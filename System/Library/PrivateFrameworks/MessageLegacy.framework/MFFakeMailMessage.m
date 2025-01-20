@interface MFFakeMailMessage
- (MFMailboxUid)mailbox;
- (MFMessageHeaders)headers;
- (MailAccount)account;
- (void)setAccount:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setMailbox:(id)a3;
@end

@implementation MFFakeMailMessage

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
}

- (MFMessageHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
}

@end