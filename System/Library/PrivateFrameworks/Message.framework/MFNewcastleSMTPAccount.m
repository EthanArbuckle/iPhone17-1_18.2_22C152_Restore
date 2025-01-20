@interface MFNewcastleSMTPAccount
+ (id)accountTypeIdentifier;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)shouldUseAuthentication;
- (CastleIMAPAccount)castleAccount;
- (id)accountForRenewingCredentials;
- (id)displayHostname;
- (id)mailAccountIfAvailable;
- (void)setCastleAccount:(id)a3;
@end

@implementation MFNewcastleSMTPAccount

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)accountForRenewingCredentials
{
  return [(MFAccount *)self->_castleAccount accountForRenewingCredentials];
}

- (id)mailAccountIfAvailable
{
  return self->_castleAccount;
}

- (id)displayHostname
{
  return MFLookupLocalizedString(@"CASTLE_SMTP_SERVER", @"iCloud SMTP Server", @"Delayed");
}

- (BOOL)shouldUseAuthentication
{
  return 1;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (CastleIMAPAccount)castleAccount
{
  return self->_castleAccount;
}

- (void)setCastleAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end