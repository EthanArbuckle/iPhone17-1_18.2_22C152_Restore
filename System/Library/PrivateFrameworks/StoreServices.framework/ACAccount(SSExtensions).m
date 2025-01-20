@interface ACAccount(SSExtensions)
- (BOOL)_ss_isLocalAccount;
- (id)_ss_DSID;
- (id)_ss_altDSID;
- (id)_ss_hashedDescription;
- (id)_ss_secureToken;
- (uint64_t)_ss_isAppleAuthenticationAccount;
- (uint64_t)_ss_isDuplicate:()SSExtensions;
- (uint64_t)_ss_isIDMSAccount;
- (uint64_t)_ss_isiCloudAccount;
- (uint64_t)_ss_isiTunesAccount;
- (void)_ss_setSecureToken:()SSExtensions;
@end

@implementation ACAccount(SSExtensions)

- (id)_ss_altDSID
{
  if ((objc_msgSend(a1, "_ss_isiCloudAccount") & 1) != 0 || objc_msgSend(a1, "_ss_isiTunesAccount"))
  {
    v2 = [a1 objectForKeyedSubscript:@"altDSID"];
  }
  else if (objc_msgSend(a1, "_ss_isIDMSAccount"))
  {
    v4 = [MEMORY[0x1E4F4EF40] sharedInstance];
    v2 = [v4 altDSIDForAccount:a1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_ss_DSID
{
  if (objc_msgSend(a1, "_ss_isiCloudAccount"))
  {
    v2 = [a1 objectForKeyedSubscript:@"personID"];
    if (![v2 length])
    {
      v4 = 0;
      goto LABEL_11;
    }
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
LABEL_6:
    v4 = (void *)v3;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(a1, "_ss_isIDMSAccount"))
  {
    v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
    uint64_t v3 = [v2 DSIDForAccount:a1];
    goto LABEL_6;
  }
  if ((objc_msgSend(a1, "_ss_isAppleAuthenticationAccount") & 1) != 0
    || objc_msgSend(a1, "_ss_isiTunesAccount"))
  {
    v4 = [a1 objectForKeyedSubscript:@"dsid"];
  }
  else
  {
    v4 = 0;
  }
LABEL_12:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_ss_hashedDescription
{
  v1 = [[SSAccount alloc] initWithBackingAccount:a1];
  v2 = [(SSAccount *)v1 hashedDescription];

  return v2;
}

- (uint64_t)_ss_isAppleAuthenticationAccount
{
  v1 = [a1 accountType];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17760]];

  return v3;
}

- (uint64_t)_ss_isiCloudAccount
{
  v1 = [a1 accountType];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F17750]];

  return v3;
}

- (uint64_t)_ss_isIDMSAccount
{
  v1 = [a1 accountType];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F177E0]];

  return v3;
}

- (uint64_t)_ss_isiTunesAccount
{
  v2 = [a1 accountType];
  uint64_t v3 = [v2 identifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F17890]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [a1 accountType];
    id v6 = [v5 identifier];
    uint64_t v4 = [v6 isEqualToString:*MEMORY[0x1E4F17898]];
  }
  return v4;
}

- (BOOL)_ss_isLocalAccount
{
  return +[SSAccount backingAccountIsLocalAccount:a1];
}

- (id)_ss_secureToken
{
  v1 = [[SSAccount alloc] initWithBackingAccount:a1];
  v2 = [(SSAccount *)v1 secureToken];

  return v2;
}

- (void)_ss_setSecureToken:()SSExtensions
{
  id v4 = a3;
  v5 = [[SSAccount alloc] initWithBackingAccount:a1];
  [(SSAccount *)v5 setSecureToken:v4];
}

- (uint64_t)_ss_isDuplicate:()SSExtensions
{
  id v4 = a3;
  v5 = [a1 identifier];
  id v6 = [v4 identifier];
  char v7 = [v5 isEqualToString:v6];

  if (v7) {
    goto LABEL_7;
  }
  v8 = [a1 accountType];
  v9 = [v8 identifier];
  v10 = [v4 accountType];
  v11 = [v10 identifier];
  int v12 = [v9 isEqualToString:v11];

  if (!v12)
  {
LABEL_7:
    uint64_t v21 = 0;
  }
  else
  {
    v13 = objc_msgSend(a1, "_ss_altDSID");
    v14 = objc_msgSend(v4, "_ss_altDSID");
    char v15 = [v13 isEqualToString:v14];

    if (v15) {
      goto LABEL_6;
    }
    uint64_t v16 = objc_msgSend(v4, "_ss_DSID");
    if (!v16) {
      goto LABEL_9;
    }
    v17 = (void *)v16;
    v18 = objc_msgSend(a1, "_ss_DSID");
    v19 = objc_msgSend(v4, "_ss_DSID");
    char v20 = [v18 isEqualToNumber:v19];

    if (v20)
    {
LABEL_6:
      uint64_t v21 = 1;
    }
    else
    {
LABEL_9:
      v23 = [a1 username];
      v24 = [v4 username];
      uint64_t v21 = [v23 isEqualToString:v24];
    }
  }

  return v21;
}

@end