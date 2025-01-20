@interface SHClusterSQLiteDataStore
+ (BOOL)sqliteDatabaseExistsAtURL:(id)a3;
- (BOOL)hasNotPassedExpiryDate:(id)a3 isForCountryCode:(id)a4;
- (BOOL)isDataLoaded;
- (BOOL)isDataValid;
- (NSString)requiredStorefront;
- (NSURL)databaseFilePathURL;
- (SHClusterSQLiteDataStore)initWithClusterType:(int64_t)a3 databaseMaxAge:(double)a4 forStorefront:(id)a5 databaseFilePathURL:(id)a6;
- (SHClusterStatus)dataStatus;
- (double)databaseMaxAge;
- (int64_t)clusterType;
@end

@implementation SHClusterSQLiteDataStore

+ (BOOL)sqliteDatabaseExistsAtURL:(id)a3
{
  uint64_t v5 = 0;
  if (+[SHSQLiteUtils openDatabase:&v5 atURL:a3 error:0])
  {
    BOOL v3 = +[SHSQLiteUtils database:v5 hasPopulatedTable:@"Cohesion" error:0];
  }
  else
  {
    BOOL v3 = 0;
  }
  +[SHSQLiteUtils closeDatabase:v5 error:0];
  return v3;
}

- (SHClusterSQLiteDataStore)initWithClusterType:(int64_t)a3 databaseMaxAge:(double)a4 forStorefront:(id)a5 databaseFilePathURL:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SHClusterSQLiteDataStore;
  v13 = [(SHClusterSQLiteDataStore *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_clusterType = a3;
    objc_storeStrong((id *)&v13->_databaseFilePathURL, a6);
    v14->_databaseMaxAge = a4;
    objc_storeStrong((id *)&v14->_requiredStorefront, a5);
  }

  return v14;
}

- (BOOL)isDataValid
{
  BOOL v3 = (void *)MEMORY[0x263EFF910];
  [(SHClusterSQLiteDataStore *)self databaseMaxAge];
  uint64_t v5 = [v3 dateWithTimeIntervalSinceNow:-v4];
  if ([(SHClusterSQLiteDataStore *)self isDataLoaded])
  {
    v6 = [(SHClusterSQLiteDataStore *)self requiredStorefront];
    BOOL v7 = [(SHClusterSQLiteDataStore *)self hasNotPassedExpiryDate:v5 isForCountryCode:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasNotPassedExpiryDate:(id)a3 isForCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SHClusterSQLiteDataStore *)self databaseFilePathURL];
  v9 = +[SHClusterMetadataQuery metadataFromDatabaseAtLocation:v8 error:0];

  if (v9 && [(SHClusterSQLiteDataStore *)self isDataLoaded])
  {
    v10 = [v9 storefront];
    if ([v10 isEqualToString:v7])
    {
      id v11 = [v9 creationDate];
      id v12 = [v6 laterDate:v11];
      v13 = [v9 creationDate];
      if (v12 == v13)
      {
        uint64_t v15 = [v9 clusterType];
        BOOL v14 = v15 == [(SHClusterSQLiteDataStore *)self clusterType];
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)isDataLoaded
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  v2 = [(SHClusterSQLiteDataStore *)self databaseFilePathURL];
  id v11 = 0;
  BOOL v3 = +[SHSQLiteUtils openDatabase:&v12 atURL:v2 error:&v11];
  id v4 = v11;

  if (v3)
  {
    id v10 = v4;
    BOOL v5 = +[SHSQLiteUtils database:v12 hasPopulatedTable:@"Cohesion" error:&v10];
    id v6 = v10;

    if (!v5)
    {
      id v7 = sh_log_object();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_2266BF000, v7, OS_LOG_TYPE_ERROR, "Failed to check database load status %@", buf, 0xCu);
      }
    }
    +[SHSQLiteUtils closeDatabase:v12 error:0];
    id v4 = v6;
  }
  else
  {
    v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_2266BF000, v8, OS_LOG_TYPE_ERROR, "Failed to check database load status %@", buf, 0xCu);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (SHClusterStatus)dataStatus
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_alloc_init(SHClusterStatus);
  id v4 = [MEMORY[0x263F08850] defaultManager];
  BOOL v5 = [(SHClusterSQLiteDataStore *)self databaseFilePathURL];
  id v6 = [v5 path];
  int v7 = [v4 fileExistsAtPath:v6];

  if (v7)
  {
    if ([(SHClusterSQLiteDataStore *)self isDataLoaded]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(SHClusterStatus *)v3 setLoadStatus:v8];
  v9 = [(SHClusterSQLiteDataStore *)self databaseFilePathURL];
  [(SHClusterStatus *)v3 setDataURL:v9];

  if ([(SHClusterStatus *)v3 loadStatus] == 1)
  {
    [(SHClusterStatus *)v3 setIsDataValid:[(SHClusterSQLiteDataStore *)self isDataValid]];
    id v10 = [(SHClusterSQLiteDataStore *)self databaseFilePathURL];
    id v15 = 0;
    id v11 = +[SHClusterMetadataQuery metadataFromDatabaseAtLocation:v10 error:&v15];
    id v12 = v15;

    if (v11)
    {
      [(SHClusterStatus *)v3 setMetadata:v11];
    }
    else
    {
      v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v12;
        _os_log_impl(&dword_2266BF000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  return v3;
}

- (double)databaseMaxAge
{
  return self->_databaseMaxAge;
}

- (NSURL)databaseFilePathURL
{
  return self->_databaseFilePathURL;
}

- (int64_t)clusterType
{
  return self->_clusterType;
}

- (NSString)requiredStorefront
{
  return self->_requiredStorefront;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredStorefront, 0);
  objc_storeStrong((id *)&self->_databaseFilePathURL, 0);
}

@end