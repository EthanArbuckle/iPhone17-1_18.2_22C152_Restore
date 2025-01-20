@interface ICCloudSchemaCatchUpSyncContext
- (BOOL)isCloudSchemaCatchUpSyncNeeded;
- (BOOL)shouldPerformCloudSchemaCatchUpSync;
- (ICCloudSchemaCatchUpSyncContext)initWithAccountIdentifier:(id)a3 syncReason:(id)a4 schedulingStateStorage:(id)a5 managedObjectContext:(id)a6;
- (NSString)accountIdentifier;
- (NSString)syncReason;
- (id)description;
- (int64_t)persistenceCloudSchemaVersion;
- (void)_computeShouldPerformCloudSchemaCatchUpSyncFrom:(id)a3 storeController:(id)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setIsCloudSchemaCatchUpSyncNeeded:(BOOL)a3;
- (void)setPersistenceCloudSchemaVersion:(int64_t)a3;
- (void)setShouldPerformCloudSchemaCatchUpSync:(BOOL)a3;
- (void)setSyncReason:(id)a3;
@end

@implementation ICCloudSchemaCatchUpSyncContext

- (ICCloudSchemaCatchUpSyncContext)initWithAccountIdentifier:(id)a3 syncReason:(id)a4 schedulingStateStorage:(id)a5 managedObjectContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ICCloudSchemaCatchUpSyncContext;
  v14 = [(ICCloudSchemaCatchUpSyncContext *)&v23 init];
  v15 = v14;
  if (v14)
  {
    [(ICCloudSchemaCatchUpSyncContext *)v14 setAccountIdentifier:v10];
    [(ICCloudSchemaCatchUpSyncContext *)v15 setSyncReason:v11];
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = [(ICCloudSchemaCatchUpSyncContext *)v15 accountIdentifier];
    BOOL v17 = +[ICCloudSchemaCompatibilityUtils isCloudSchemaCatchUpSyncNeededForAccountIdentifier:v16 context:v13 outPersistenceCloudSchemaVersion:&v22];

    if (v17) {
      [(ICCloudSchemaCatchUpSyncContext *)v15 setPersistenceCloudSchemaVersion:v22];
    }
    [(ICCloudSchemaCatchUpSyncContext *)v15 setIsCloudSchemaCatchUpSyncNeeded:v17];
    v18 = [v13 storeController];
    [(ICCloudSchemaCatchUpSyncContext *)v15 _computeShouldPerformCloudSchemaCatchUpSyncFrom:v12 storeController:v18];

    v19 = +[REMLog cloudkit];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = [(ICCloudSchemaCatchUpSyncContext *)v15 description];
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "ICCloudSchemaCatchUpSyncContext: finished initizing context: %@", buf, 0xCu);
    }
  }

  return v15;
}

- (void)_computeShouldPerformCloudSchemaCatchUpSyncFrom:(id)a3 storeController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ICCloudSchemaCatchUpSyncContext *)self isCloudSchemaCatchUpSyncNeeded])
  {
    BOOL v15 = 0;
    goto LABEL_12;
  }
  v8 = [(ICCloudSchemaCatchUpSyncContext *)self syncReason];
  int v9 = isCloudContextSyncReasonUserInitiated(v8);

  unsigned int v10 = [v7 supportsCloudSchemaCatchUpSyncBackgroundScheduling];
  unsigned int v11 = [v6 debugForceSupportBackgroundScheduling];
  id v12 = [v6 schedulingState];
  id v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(ICCloudSchemaCatchUpSyncContext *)self syncReason];
    v17[0] = 67110146;
    v17[1] = v9;
    __int16 v18 = 1024;
    unsigned int v19 = v10;
    __int16 v20 = 1024;
    unsigned int v21 = v11;
    __int16 v22 = 2048;
    id v23 = v12;
    __int16 v24 = 2114;
    v25 = v14;
  }
  if ((v10 & (v9 ^ 1) | v11) != 1)
  {
LABEL_11:
    BOOL v15 = 1;
    goto LABEL_12;
  }
  if ((unint64_t)v12 >= 3)
  {
    v16 = +[REMLog cloudkit];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10074F514((uint64_t)v12, v16);
    }

    goto LABEL_11;
  }
  BOOL v15 = v12 == (id)2;
LABEL_12:
  [(ICCloudSchemaCatchUpSyncContext *)self setShouldPerformCloudSchemaCatchUpSync:v15];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(ICCloudSchemaCatchUpSyncContext *)self accountIdentifier];
  v5 = [(ICCloudSchemaCatchUpSyncContext *)self syncReason];
  id v6 = +[NSString stringWithFormat:@"<%@: %p, accountIdentifier: %@, syncReason: %@, persistenceCloudSchemaVersion: %ld, isCloudSchemaCatchUpSyncNeeded: %d, shouldPerformCloudSchemaCatchUpSync: %d>", v3, self, v4, v5, [(ICCloudSchemaCatchUpSyncContext *)self persistenceCloudSchemaVersion], [(ICCloudSchemaCatchUpSyncContext *)self isCloudSchemaCatchUpSyncNeeded], [(ICCloudSchemaCatchUpSyncContext *)self shouldPerformCloudSchemaCatchUpSync]];

  return v6;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)syncReason
{
  return self->_syncReason;
}

- (void)setSyncReason:(id)a3
{
}

- (BOOL)isCloudSchemaCatchUpSyncNeeded
{
  return self->_isCloudSchemaCatchUpSyncNeeded;
}

- (void)setIsCloudSchemaCatchUpSyncNeeded:(BOOL)a3
{
  self->_isCloudSchemaCatchUpSyncNeeded = a3;
}

- (BOOL)shouldPerformCloudSchemaCatchUpSync
{
  return self->_shouldPerformCloudSchemaCatchUpSync;
}

- (void)setShouldPerformCloudSchemaCatchUpSync:(BOOL)a3
{
  self->_shouldPerformCloudSchemaCatchUpSync = a3;
}

- (int64_t)persistenceCloudSchemaVersion
{
  return self->_persistenceCloudSchemaVersion;
}

- (void)setPersistenceCloudSchemaVersion:(int64_t)a3
{
  self->_persistenceCloudSchemaVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncReason, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end