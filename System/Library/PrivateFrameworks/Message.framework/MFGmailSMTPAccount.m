@interface MFGmailSMTPAccount
+ (id)accountTypeIdentifier;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)shouldUseAuthentication;
- (BOOL)usesSSL;
- (GmailAccount)mailAccountIfAvailable;
- (id)_urlFromResponse:(id)a3;
- (id)accountForRenewingCredentials;
- (id)clientToken;
- (id)displayHostname;
- (id)errorForResponse:(id)a3;
- (id)hostname;
- (id)oauth2Token;
- (id)password;
- (id)preferredAuthScheme;
- (id)username;
- (unsigned)portNumber;
- (void)setMailAccount:(id)a3;
@end

@implementation MFGmailSMTPAccount

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
  return +[GmailAccount deliveryAccountUsesSSL];
}

- (id)hostname
{
  return +[GmailAccount deliveryAccountHostname];
}

- (unsigned)portNumber
{
  return +[GmailAccount deliveryAccountPortNumber];
}

- (id)username
{
  return [(MFAccount *)self->_account username];
}

- (id)password
{
  return [(MFAccount *)self->_account password];
}

- (id)clientToken
{
  return [(GmailAccount *)self->_account clientToken];
}

- (id)oauth2Token
{
  return [(MFAccount *)self->_account oauth2Token];
}

- (id)preferredAuthScheme
{
  return [(GmailAccount *)self->_account preferredAuthScheme];
}

- (id)displayHostname
{
  return MFLookupLocalizedString(@"GMAIL_DELIVERY_HOSTNAME", @"Gmail SMTP Server", @"Delayed");
}

- (id)_urlFromResponse:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v5 = [v3 continuationResponses];
  v6 = (void *)[v4 initWithArray:v5];

  [v6 addObject:v3];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    v26 = v6;
    v9 = 0;
    uint64_t v10 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v3, "failureReason", v26) == 7)
        {
          v13 = [v12 statusString];
          uint64_t v14 = [v13 rangeOfString:@">"];
          uint64_t v15 = v14;
          if (v9)
          {
            if (v14 == 0x7FFFFFFFFFFFFFFFLL)
            {
              [v9 appendString:v13];
LABEL_15:

              continue;
            }
            v18 = [v13 substringToIndex:v14];
            [v9 appendString:v18];

            v19 = [(GmailAccount *)self->_account _URLFromUncleanString:v9];
          }
          else
          {
            uint64_t v16 = [v13 rangeOfString:@"<"];
            uint64_t v17 = v16;
            if (v16 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v9 = 0;
              goto LABEL_15;
            }
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v20 = objc_alloc(MEMORY[0x1E4F28E78]);
              v21 = [v13 substringFromIndex:v17 + 1];
              v9 = (void *)[v20 initWithString:v21];

              goto LABEL_15;
            }
            uint64_t v22 = v15 - (v16 + 1);
            account = self->_account;
            v24 = objc_msgSend(v13, "substringWithRange:", v16 + 1, v22);
            v19 = [(GmailAccount *)account _URLFromUncleanString:v24];
          }
          if (v19) {
            goto LABEL_23;
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v8) {
        goto LABEL_22;
      }
    }
  }
  v9 = 0;
LABEL_22:
  v19 = 0;
LABEL_23:

  return v19;
}

- (id)errorForResponse:(id)a3
{
  id v4 = a3;
  if ([v4 failureReason] != 7
    || (account = self->_account,
        [(MFGmailSMTPAccount *)self _urlFromResponse:v4],
        v6 = objc_claimAutoreleasedReturnValue(),
        [(GmailAccount *)account _webLoginErrorWithURL:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v9.receiver = self;
    v9.super_class = (Class)MFGmailSMTPAccount;
    id v7 = [(SMTPAccount *)&v9 errorForResponse:v4];
  }

  return v7;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (GmailAccount)mailAccountIfAvailable
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