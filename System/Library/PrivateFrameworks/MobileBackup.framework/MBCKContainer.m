@interface MBCKContainer
- (BOOL)fetchedSyncZone;
- (CKContainer)ckContainer;
- (CKDatabase)ckDatabase;
- (CKDatabase)ckDatabaseWithZoneWidePCS;
- (MBCKContainer)ckContainerWithZoneWidePCS;
- (MBCKContainer)initWithAccount:(id)a3 useSandbox:(BOOL)a4;
- (MBServiceAccount)account;
- (NSString)personaIdentifier;
- (void)setAccount:(id)a3;
- (void)setCkContainer:(id)a3;
- (void)setCkContainerWithZoneWidePCS:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
@end

@implementation MBCKContainer

- (MBCKContainer)initWithAccount:(id)a3 useSandbox:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKContainer initWithAccount:useSandbox:]", "MBCKDatabaseManager.m", 56, "account");
  }
  v7 = v6;
  v8 = [v6 persona];
  v9 = [v8 personaIdentifier];

  if (!v9) {
    __assert_rtn("-[MBCKContainer initWithAccount:useSandbox:]", "MBCKDatabaseManager.m", 58, "personaIdentifier");
  }
  v27.receiver = self;
  v27.super_class = (Class)MBCKContainer;
  v10 = [(MBCKContainer *)&v27 init];
  v11 = v10;
  if (v10)
  {
    [(MBCKContainer *)v10 setAccount:v7];
    [(MBCKContainer *)v11 setPersonaIdentifier:v9];
    v12 = [v7 persona];
    unsigned int v13 = [v12 isDataSeparatedPersona];

    if (v13)
    {
      uint64_t v14 = [v7 accountIdentifier];
      if (!v14)
      {
        v16 = v11;
        v11 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v15 = (void *)v14;
      v16 = (MBCKContainer *)[objc_alloc((Class)CKAccountOverrideInfo) initWithAccountID:v14];
    }
    else
    {
      v16 = 0;
    }
    if ((MBIsInternalInstall() & v4) != 0) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    v18 = +[MBBehaviorOptions sharedOptions];
    v19 = [v18 cloudKitContainerName];

    id v20 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v19 environment:v17];
    v21 = objc_opt_new();
    [v21 setMmcsEncryptionSupport:3];
    [v21 setAccountOverrideInfo:v16];
    id v22 = [objc_alloc((Class)CKContainer) initWithContainerID:v20 options:v21];
    if (!v22) {
      __assert_rtn("-[MBCKContainer initWithAccount:useSandbox:]", "MBCKDatabaseManager.m", 87, "container");
    }
    v23 = v22;
    [(MBCKContainer *)v11 setCkContainer:v22];
    v24 = objc_opt_new();

    [v24 setAccountOverrideInfo:v16];
    [v24 setUseZoneWidePCS:1];
    [v24 setMmcsEncryptionSupport:3];
    id v25 = [objc_alloc((Class)CKContainer) initWithContainerID:v20 options:v24];

    if (!v25) {
      __assert_rtn("-[MBCKContainer initWithAccount:useSandbox:]", "MBCKDatabaseManager.m", 97, "container");
    }
    [(MBCKContainer *)v11 setCkContainerWithZoneWidePCS:v25];

    goto LABEL_14;
  }
LABEL_15:

  return v11;
}

- (CKDatabase)ckDatabase
{
  v2 = [(MBCKContainer *)self ckContainer];
  v3 = [v2 privateCloudDatabase];

  return (CKDatabase *)v3;
}

- (CKDatabase)ckDatabaseWithZoneWidePCS
{
  v2 = [(MBCKContainer *)self ckContainerWithZoneWidePCS];
  v3 = [v2 privateCloudDatabase];

  return (CKDatabase *)v3;
}

- (BOOL)fetchedSyncZone
{
  v2 = [(MBCKContainer *)self account];
  BOOL v3 = +[MBCKDatabaseManager fetchedSyncZoneWithAccount:v2];

  return v3;
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (CKContainer)ckContainer
{
  return self->_ckContainer;
}

- (void)setCkContainer:(id)a3
{
}

- (MBCKContainer)ckContainerWithZoneWidePCS
{
  return (MBCKContainer *)self->_ckContainerWithZoneWidePCS;
}

- (void)setCkContainerWithZoneWidePCS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckContainerWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end