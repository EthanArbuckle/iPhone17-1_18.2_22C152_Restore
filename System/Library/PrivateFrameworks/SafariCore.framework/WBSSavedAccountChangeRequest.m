@interface WBSSavedAccountChangeRequest
- (BOOL)hasAdditionalSitesChange;
- (BOOL)hasChanges;
- (BOOL)hasCustomTitleChange;
- (BOOL)hasNotesEntryChange;
- (BOOL)hasPasswordChange;
- (BOOL)hasSitesChange;
- (BOOL)hasTOTPGeneratorChange;
- (BOOL)hasUserChange;
- (BOOL)isAddingPasswordToAccountWithPasskey;
- (NSArray)additionalSites;
- (NSArray)userVisibleSites;
- (NSMutableArray)sites;
- (NSString)customTitle;
- (NSString)notesEntry;
- (NSString)password;
- (NSString)user;
- (WBSSavedAccount)savedAccount;
- (WBSTOTPGenerator)totpGenerator;
- (void)setAdditionalSites:(id)a3;
- (void)setCustomTitle:(id)a3;
- (void)setNotesEntry:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSavedAccount:(id)a3;
- (void)setSites:(id)a3;
- (void)setTotpGenerator:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation WBSSavedAccountChangeRequest

- (void)setSavedAccount:(id)a3
{
  id v26 = a3;
  if ((WBSIsEqual(v26, self->_savedAccount) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_savedAccount, a3);
    v5 = [v26 user];
    v6 = (NSString *)[v5 copy];
    user = self->_user;
    self->_user = v6;

    v8 = [v26 password];
    v9 = (NSString *)[v8 copy];
    password = self->_password;
    self->_password = v9;

    v11 = [v26 sites];
    v12 = (NSMutableArray *)[v11 mutableCopy];
    sites = self->_sites;
    self->_sites = v12;

    v14 = [v26 totpGenerators];
    v15 = [v14 firstObject];
    totpGenerator = self->_totpGenerator;
    self->_totpGenerator = v15;

    v17 = [v26 notesEntry];
    v18 = (NSString *)[v17 copy];
    notesEntry = self->_notesEntry;
    self->_notesEntry = v18;

    v20 = [v26 customTitle];
    v21 = (NSString *)[v20 copy];
    customTitle = self->_customTitle;
    self->_customTitle = v21;

    v23 = [v26 additionalSites];
    v24 = (NSArray *)[v23 copy];
    additionalSites = self->_additionalSites;
    self->_additionalSites = v24;
  }
}

- (NSArray)userVisibleSites
{
  return (NSArray *)[(NSMutableArray *)self->_sites safari_mapObjectsUsingBlock:&__block_literal_global_56];
}

id __48__WBSSavedAccountChangeRequest_userVisibleSites__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(v2, "_web_decodeHostName");
  v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

- (BOOL)hasChanges
{
  if ([(WBSSavedAccountChangeRequest *)self hasUserChange]
    || [(WBSSavedAccountChangeRequest *)self hasPasswordChange]
    || [(WBSSavedAccountChangeRequest *)self hasSitesChange]
    || [(WBSSavedAccountChangeRequest *)self hasTOTPGeneratorChange]
    || [(WBSSavedAccountChangeRequest *)self hasNotesEntryChange]
    || [(WBSSavedAccountChangeRequest *)self hasCustomTitleChange]
    || [(WBSSavedAccountChangeRequest *)self isAddingPasswordToAccountWithPasskey])
  {
    return 1;
  }
  return [(WBSSavedAccountChangeRequest *)self hasAdditionalSitesChange];
}

- (BOOL)hasUserChange
{
  user = self->_user;
  v3 = [(WBSSavedAccount *)self->_savedAccount user];
  LOBYTE(user) = WBSIsEqual(user, v3) ^ 1;

  return (char)user;
}

- (BOOL)hasPasswordChange
{
  if ([(WBSSavedAccount *)self->_savedAccount credentialTypes])
  {
    password = self->_password;
    id v5 = [(WBSSavedAccount *)self->_savedAccount password];
    int v3 = WBSIsEqual(password, v5) ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasSitesChange
{
  if ([(NSMutableArray *)self->_sites count]
    || ([(WBSSavedAccount *)self->_savedAccount sites],
        int v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    sites = self->_sites;
    v6 = [(WBSSavedAccount *)self->_savedAccount sites];
    int v7 = WBSIsEqual(sites, v6) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)hasTOTPGeneratorChange
{
  totpGenerator = self->_totpGenerator;
  int v3 = [(WBSSavedAccount *)self->_savedAccount totpGenerators];
  uint64_t v4 = [v3 firstObject];
  LOBYTE(totpGenerator) = WBSIsEqual(totpGenerator, v4) ^ 1;

  return (char)totpGenerator;
}

- (BOOL)hasNotesEntryChange
{
  notesEntry = self->_notesEntry;
  uint64_t v4 = [(WBSSavedAccount *)self->_savedAccount notesEntry];
  if (WBSIsEqual(notesEntry, v4))
  {
    BOOL v5 = 0;
  }
  else if ([(NSString *)self->_notesEntry length])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(WBSSavedAccount *)self->_savedAccount notesEntry];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (BOOL)hasCustomTitleChange
{
  customTitle = self->_customTitle;
  uint64_t v4 = [(WBSSavedAccount *)self->_savedAccount customTitle];
  if (WBSIsEqual(customTitle, v4))
  {
    BOOL v5 = 0;
  }
  else if ([(NSString *)self->_customTitle length])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(WBSSavedAccount *)self->_savedAccount customTitle];
    BOOL v5 = [v6 length] != 0;
  }
  return v5;
}

- (BOOL)isAddingPasswordToAccountWithPasskey
{
  return [(WBSSavedAccount *)self->_savedAccount credentialTypes] == 2
      && [(NSString *)self->_password length] != 0;
}

- (NSArray)additionalSites
{
  return (NSArray *)[(NSArray *)self->_additionalSites safari_mapAndFilterObjectsUsingBlock:&__block_literal_global_3_1];
}

id __47__WBSSavedAccountChangeRequest_additionalSites__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "safari_stringByTrimmingWhitespace");
  if ([v2 length]) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)hasAdditionalSitesChange
{
  int v3 = [(WBSSavedAccountChangeRequest *)self additionalSites];
  if ([v3 count])
  {
  }
  else
  {
    id v4 = [(WBSSavedAccount *)self->_savedAccount additionalSites];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      LOBYTE(v8) = 0;
      return v8;
    }
  }
  v6 = [(WBSSavedAccountChangeRequest *)self additionalSites];
  int v7 = [(WBSSavedAccount *)self->_savedAccount additionalSites];
  int v8 = WBSIsEqual(v6, v7) ^ 1;

  return v8;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSMutableArray)sites
{
  return self->_sites;
}

- (void)setSites:(id)a3
{
}

- (WBSTOTPGenerator)totpGenerator
{
  return self->_totpGenerator;
}

- (void)setTotpGenerator:(id)a3
{
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (void)setNotesEntry:(id)a3
{
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (void)setCustomTitle:(id)a3
{
}

- (void)setAdditionalSites:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_sites, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
}

@end