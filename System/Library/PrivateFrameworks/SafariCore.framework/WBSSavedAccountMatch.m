@interface WBSSavedAccountMatch
- (BOOL)hasUniqueHostAndUser;
- (NSDate)creationDate;
- (NSDate)lastUsedDateAffectingAutoFillSortOrder;
- (NSString)customTitle;
- (NSString)groupName;
- (NSString)host;
- (NSString)password;
- (NSString)user;
- (NSURLProtectionSpace)protectionSpace;
- (WBSAutoFillPasskey)autoFillPasskey;
- (WBSSavedAccount)savedAccount;
- (WBSSavedAccountContext)context;
- (WBSSavedAccountMatch)initWithSavedAccount:(id)a3 protectionSpace:(id)a4 context:(id)a5 matchLevel:(int64_t)a6;
- (WBSSavedAccountMatch)initWithSavedAccount:(id)a3 protectionSpace:(id)a4 context:(id)a5 matchLevel:(int64_t)a6 autoFillPasskey:(id)a7;
- (id)debugDescription;
- (id)userVisibleDomainForAutoFillWithPageURL:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)matchLevel;
- (void)setHasUniqueHostAndUser:(BOOL)a3;
@end

@implementation WBSSavedAccountMatch

- (WBSSavedAccountMatch)initWithSavedAccount:(id)a3 protectionSpace:(id)a4 context:(id)a5 matchLevel:(int64_t)a6
{
  return [(WBSSavedAccountMatch *)self initWithSavedAccount:a3 protectionSpace:a4 context:a5 matchLevel:a6 autoFillPasskey:0];
}

- (WBSSavedAccountMatch)initWithSavedAccount:(id)a3 protectionSpace:(id)a4 context:(id)a5 matchLevel:(int64_t)a6 autoFillPasskey:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)WBSSavedAccountMatch;
  v17 = [(WBSSavedAccountMatch *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_savedAccount, a3);
    uint64_t v19 = [v14 copy];
    protectionSpace = v18->_protectionSpace;
    v18->_protectionSpace = (NSURLProtectionSpace *)v19;

    objc_storeStrong((id *)&v18->_context, a5);
    v18->_matchLevel = a6;
    uint64_t v21 = [v14 host];
    host = v18->_host;
    v18->_host = (NSString *)v21;

    if (!v18->_host)
    {
      v23 = [v16 relyingPartyIdentifier];
      uint64_t v24 = [v23 copy];
      v25 = v18->_host;
      v18->_host = (NSString *)v24;
    }
    objc_storeStrong((id *)&v18->_autoFillPasskey, a7);
    v26 = v18;
  }

  return v18;
}

- (NSString)user
{
  return [(WBSSavedAccount *)self->_savedAccount user];
}

- (id)userVisibleDomainForAutoFillWithPageURL:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F18D98], "safari_HTMLFormProtectionSpaceForURL:", a3);
  v5 = [(WBSSavedAccount *)self->_savedAccount protectionSpaces];
  int v6 = [v5 containsObject:v4];

  if (v6) {
    objc_msgSend(v4, "safari_userVisibleSiteForProtectionSpace");
  }
  else {
  v7 = [(WBSSavedAccount *)self->_savedAccount userVisibleDomain];
  }

  return v7;
}

- (NSString)password
{
  return [(WBSSavedAccount *)self->_savedAccount password];
}

- (NSDate)creationDate
{
  return [(WBSSavedAccount *)self->_savedAccount creationDate];
}

- (NSDate)lastUsedDateAffectingAutoFillSortOrder
{
  return (NSDate *)[(WBSSavedAccount *)self->_savedAccount lastUsedDateForContext:self->_context];
}

- (NSString)customTitle
{
  return [(WBSSavedAccount *)self->_savedAccount customTitle];
}

- (NSString)groupName
{
  return [(WBSSavedAccount *)self->_savedAccount sharedGroupName];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(WBSSavedAccountMatch *)self savedAccount];
  char v6 = [v5 isAppleIDPasskey];

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = [(WBSSavedAccountMatch *)self lastUsedDateAffectingAutoFillSortOrder];
    uint64_t v9 = [v4 lastUsedDateAffectingAutoFillSortOrder];
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([(id)v8 compare:v9] == -1) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = -1;
      }
      goto LABEL_21;
    }
    if (v8) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = 1;
    }
    if (v8 | v9) {
      goto LABEL_21;
    }
    BOOL v11 = [(WBSSavedAccount *)self->_savedAccount isDefaultCredentialForFullyQualifiedHostname:self->_host];
    v12 = [v4 savedAccount];
    int v13 = [v12 isDefaultCredentialForFullyQualifiedHostname:self->_host];

    if (v11 && !v13) {
      goto LABEL_14;
    }
    if ((v13 ^ 1 | v11) == 1)
    {
      char v14 = [(WBSSavedAccount *)self->_savedAccount credentialTypes];
      id v15 = [v4 savedAccount];
      char v16 = [v15 credentialTypes];

      if ((v14 & 2) != 0 && (v16 & 2) == 0)
      {
LABEL_14:
        int64_t v7 = -1;
LABEL_21:

        goto LABEL_22;
      }
      if ((v14 & 2) != 0 || (v16 & 2) == 0)
      {
        savedAccount = self->_savedAccount;
        uint64_t v19 = [v4 savedAccount];
        int64_t v7 = [(WBSSavedAccount *)savedAccount compare:v19];

        goto LABEL_21;
      }
    }
    int64_t v7 = 1;
    goto LABEL_21;
  }
  int64_t v7 = -1;
LABEL_22:

  return v7;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  savedAccount = self->_savedAccount;
  protectionSpace = self->_protectionSpace;
  uint64_t v8 = [(WBSAutoFillPasskey *)self->_autoFillPasskey identifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; savedAccount = %@; protection space = %@; passkey identifier = %@>",
    v5,
    self,
    savedAccount,
    protectionSpace,
  uint64_t v9 = v8);

  return v9;
}

- (NSString)host
{
  return self->_host;
}

- (BOOL)hasUniqueHostAndUser
{
  return self->_hasUniqueHostAndUser;
}

- (void)setHasUniqueHostAndUser:(BOOL)a3
{
  self->_hasUniqueHostAndUser = a3;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (WBSSavedAccountContext)context
{
  return self->_context;
}

- (int64_t)matchLevel
{
  return self->_matchLevel;
}

- (WBSAutoFillPasskey)autoFillPasskey
{
  return self->_autoFillPasskey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFillPasskey, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end