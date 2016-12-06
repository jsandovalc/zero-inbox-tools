import os
import email

from imapclient import IMAPClient

HOST = 'imap.gmail.com'
USERNAME = os.getenv('IMAPUSER', 'test')
PASSWORD = os.getenv('IMAPSECRET', 'test')
ssl = True

server = IMAPClient(HOST, use_uid=True, ssl=ssl)
server.login(USERNAME, PASSWORD)
select_info = server.select_folder('INBOX')

messages = server.gmail_search(['NOT', 'DELETED'])
response = server.fetch(messages, ['RFC822'])

for msgid, data in response.items():
    print('data is', list(data.keys()))
    msg_string = data[b'RFC822']
    msg = email.message_from_string(msg_string.decode('utf-8'))
    print(msgid, msg['From'], msg['date'])
