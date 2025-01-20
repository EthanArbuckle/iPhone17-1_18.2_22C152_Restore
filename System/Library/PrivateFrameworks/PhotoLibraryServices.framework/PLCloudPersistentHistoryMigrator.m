@interface PLCloudPersistentHistoryMigrator
+ (void)migrateToPersistentHistoryIfNecessaryWithMigratorContext:(id)a3;
- (PLCloudPersistentHistoryMigrator)initWithMigratorContext:(id)a3;
- (int64_t)migrate;
- (void)migrateToPersistentHistoryIfNecessary;
@end

@implementation PLCloudPersistentHistoryMigrator

- (void).cxx_destruct
{
}

- (int64_t)migrate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migratorContext);
  v3 = [WeakRetained readLocalVersion];

  return v3 != 0;
}

- (void)migrateToPersistentHistoryIfNecessary
{
  v3 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Start migration from change hub to persistent history", buf, 2u);
    }
  }
  int64_t v5 = [(PLCloudPersistentHistoryMigrator *)self migrate];
  if (v5 == 1)
  {
    if (!*v3)
    {
      v7 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Migration from change hub succeeded (forced reset sync)", v10, 2u);
      }
    }
    p_migratorContext = &self->_migratorContext;
    id WeakRetained = objc_loadWeakRetained((id *)p_migratorContext);
    [WeakRetained resetSyncDueToMigrationMarker];

    v6 = objc_loadWeakRetained((id *)p_migratorContext);
    [v6 removeAllChangeHubKeys];
    goto LABEL_15;
  }
  if (!v5 && !*v3)
  {
    v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Migration from change hub not needed", v11, 2u);
    }
LABEL_15:
  }
}

- (PLCloudPersistentHistoryMigrator)initWithMigratorContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCloudPersistentHistoryMigrator;
  int64_t v5 = [(PLCloudPersistentHistoryMigrator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_migratorContext, v4);
    v7 = v6;
  }

  return v6;
}

+ (void)migrateToPersistentHistoryIfNecessaryWithMigratorContext:(id)a3
{
  id v5 = a3;
  v3 = (void *)MEMORY[0x19F38D3B0]();
  id v4 = [[PLCloudPersistentHistoryMigrator alloc] initWithMigratorContext:v5];
  [(PLCloudPersistentHistoryMigrator *)v4 migrateToPersistentHistoryIfNecessary];
}

@end