@interface MFHotmailSMTPAccount
+ (id)accountTypeIdentifier;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)shouldUseAuthentication;
- (BOOL)usesSSL;
- (HotmailAccount)mailAccountIfAvailable;
- (id)accountForRenewingCredentials;
- (id)displayHostname;
- (id)hostname;
- (id)oauth2Token;
- (id)password;
- (id)preferredAuthScheme;
- (id)username;
- (unsigned)portNumber;
- (void)setMailAccount:(id)a3;
@end

@implementation MFHotmailSMTPAccount

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)accountForRenewingCredentials
{
  return [(MFAccount *)self->_account accountForRenewingCredentials];
}

- (BOOL)shouldUseAuthentication
{
  return 1;
}

- (BOOL)usesSSL
{
  return +[HotmailAccount deliveryAccountUsesSSL];
}

- (id)hostname
{
  return +[HotmailAccount deliveryAccountHostname];
}

- (unsigned)portNumber
{
  return +[HotmailAccount deliveryAccountPortNumber];
}

- (id)username
{
  return [(MFAccount *)self->_account username];
}

- (id)password
{
  return [(MFAccount *)self->_account password];
}

- (id)oauth2Token
{
  return [(MFAccount *)self->_account oauth2Token];
}

- (id)preferredAuthScheme
{
  return [(HotmailAccount *)self->_account preferredAuthScheme];
}

- (id)displayHostname
{
  return MFLookupLocalizedString(@"HOTMAIL_DELIVERY_HOSTNAME", @"Outlook SMTP Server", @"Delayed");
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (HotmailAccount)mailAccountIfAvailable
{
  return self->_account;
}

- (void)setMailAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end