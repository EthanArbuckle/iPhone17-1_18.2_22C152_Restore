@interface SHClusterImporterUtils
+ (BOOL)clearTemporaryDatabaseFileAtURL:(id)a3 withError:(id *)a4;
+ (BOOL)copyDatabaseFromURL:(id)a3 toDatabaseDestinationURL:(id)a4 error:(id *)a5;
+ (id)buildTemporaryClusterURLWithError:(id *)a3;
+ (id)cachesDirectory;
+ (id)importerForFile:(id)a3;
@end

@implementation SHClusterImporterUtils

+ (id)cachesDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  v4 = [v3 stringByAppendingPathComponent:@"com.apple.ShazamInsights"];

  v5 = [NSURL fileURLWithPath:v4 isDirectory:1];

  return v5;
}

+ (id)buildTemporaryClusterURLWithError:(id *)a3
{
  v4 = objc_msgSend(a1, "cachesDirectory", a3);
  v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if ((v7 & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = 0,
        char v9 = [v8 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v19],
        v8,
        (v9 & 1) != 0))
  {
    v10 = NSString;
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    v13 = [v10 stringWithFormat:@"%@_temp", v12];

    v14 = [a1 cachesDirectory];
    v15 = [v14 URLByAppendingPathComponent:v13];

    v16 = [v15 URLByAppendingPathExtension:@"unknown"];
  }
  else
  {
    v13 = sh_log_object();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266BF000, v13, OS_LOG_TYPE_ERROR, "Failed to create the caches directory!", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

+ (BOOL)copyDatabaseFromURL:(id)a3 toDatabaseDestinationURL:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (([v7 isEqual:v8] & 1) == 0)
  {
    if (+[SHClusterSQLiteDataStore sqliteDatabaseExistsAtURL:](SHClusterSQLiteDataStore, "sqliteDatabaseExistsAtURL:", v7)&& +[SHClusterSQLiteDataStore sqliteDatabaseExistsAtURL:v8])
    {
      v10 = [MEMORY[0x263F08850] defaultManager];
      id v23 = 0;
      char v11 = [v10 removeItemAtURL:v8 error:&v23];
      id v12 = v23;

      if ((v11 & 1) == 0)
      {
        if (a5)
        {
          *a5 = +[SHInsightsError errorWithCode:201 underlyingError:v12];
        }
        v14 = sh_log_object();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v12;
          _os_log_impl(&dword_2266BF000, v14, OS_LOG_TYPE_ERROR, "Failed to delete existing database %@", buf, 0xCu);
        }
        goto LABEL_15;
      }
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    v14 = [v8 URLByDeletingLastPathComponent];
    v15 = [MEMORY[0x263F08850] defaultManager];
    v16 = [v14 path];
    char v17 = [v15 fileExistsAtPath:v16];

    if ((v17 & 1) == 0)
    {
      v18 = [MEMORY[0x263F08850] defaultManager];
      int v9 = [v18 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:a5];

      if (!v9)
      {
        id v12 = v13;
        goto LABEL_17;
      }
    }
    uint64_t v19 = [MEMORY[0x263F08850] defaultManager];
    id v22 = v13;
    LOBYTE(v9) = [v19 copyItemAtURL:v7 toURL:v8 error:&v22];
    id v12 = v22;

    if (!a5 || (v9 & 1) != 0) {
      goto LABEL_17;
    }
    *a5 = +[SHInsightsError errorWithCode:201 underlyingError:v12];
    v20 = sh_log_object();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v12;
      _os_log_impl(&dword_2266BF000, v20, OS_LOG_TYPE_ERROR, "Failed to move database into place %@", buf, 0xCu);
    }

LABEL_15:
    LOBYTE(v9) = 0;
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v9) = 1;
LABEL_18:

  return v9;
}

+ (BOOL)clearTemporaryDatabaseFileAtURL:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    int v9 = [MEMORY[0x263F08850] defaultManager];
    id v13 = 0;
    char v10 = [v9 removeItemAtURL:v5 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0 && a4)
    {
      *a4 = +[SHInsightsError errorWithCode:201 underlyingError:v11];
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

+ (id)importerForFile:(id)a3
{
  v3 = [a3 dataFilePathURL];
  BOOL v4 = +[SHClusterSQLiteDataStore sqliteDatabaseExistsAtURL:v3];

  id v5 = &off_2647ACED8;
  if (!v4) {
    id v5 = &off_2647ACEA8;
  }
  id v6 = objc_alloc_init(*v5);
  return v6;
}

@end