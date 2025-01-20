@interface MFAOLSMTPAccount
+ (id)accountTypeIdentifier;
- (AOLAccount)mailAccountIfAvailable;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)shouldUseAuthentication;
- (BOOL)usesSSL;
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

@implementation MFAOLSMTPAccount

- (id)displayHostname
{
  return MFLookupLocalizedString(@"AOL_DELIVERY_HOSTNAME", @"AOL SMTP Server", @"Delayed");
}

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
  return +[AOLAccount deliveryAccountUsesSSL];
}

- (id)hostname
{
  return +[AOLAccount deliveryAccountHostname];
}

- (unsigned)portNumber
{
  return +[AOLAccount deliveryAccountPortNumber];
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
  return [(YahooAccount *)self->_account preferredAuthScheme];
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (AOLAccount)mailAccountIfAvailable
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