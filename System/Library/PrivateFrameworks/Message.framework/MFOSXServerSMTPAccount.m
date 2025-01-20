@interface MFOSXServerSMTPAccount
+ (id)accountTypeIdentifier;
- (BOOL)shouldUseAuthentication;
- (BOOL)usesSSL;
- (MFOSXServerIMAPAccount)mailAccountIfAvailable;
- (NSDictionary)parentAccountMailProperties;
- (id)accountForRenewingCredentials;
- (id)hostname;
- (id)password;
- (id)preferredAuthScheme;
- (id)username;
- (unsigned)portNumber;
- (void)setMailAccount:(id)a3;
@end

@implementation MFOSXServerSMTPAccount

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)accountForRenewingCredentials
{
  return [(MFAccount *)self->_mailAccount accountForRenewingCredentials];
}

- (NSDictionary)parentAccountMailProperties
{
  v2 = [(MFAccount *)self->_mailAccount persistentAccount];
  v3 = [v2 parentAccount];
  v4 = [v3 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];

  return (NSDictionary *)v4;
}

- (BOOL)shouldUseAuthentication
{
  v2 = [(MFOSXServerSMTPAccount *)self parentAccountMailProperties];
  v3 = [v2 objectForKeyedSubscript:@"OutgoingMailServerAuthentication"];

  LOBYTE(v2) = [v3 isEqualToString:@"EmailAuthNone"] ^ 1;
  return (char)v2;
}

- (BOOL)usesSSL
{
  v2 = [(MFOSXServerSMTPAccount *)self parentAccountMailProperties];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17710]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)hostname
{
  v2 = [(MFOSXServerSMTPAccount *)self parentAccountMailProperties];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17700]];

  return v3;
}

- (unsigned)portNumber
{
  v2 = [(MFOSXServerSMTPAccount *)self parentAccountMailProperties];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F17708]];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (id)username
{
  return [(MFAccount *)self->_mailAccount username];
}

- (id)password
{
  return [(MFAccount *)self->_mailAccount password];
}

- (id)preferredAuthScheme
{
  return [(MFAccount *)self->_mailAccount preferredAuthScheme];
}

- (MFOSXServerIMAPAccount)mailAccountIfAvailable
{
  return self->_mailAccount;
}

- (void)setMailAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end