@interface DMDMDMUtilities
+ (BOOL)setSkipBackupAttribute:(BOOL)a3 toItemAtPath:(id)a4;
+ (id)iTunesAccountHashForUniqueIdentifier:(id)a3;
@end

@implementation DMDMDMUtilities

+ (id)iTunesAccountHashForUniqueIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = MCUSEnglishNumberFormatter();
    v5 = [v4 stringFromNumber:v3];

    if (v5)
    {
      v6 = [v5 dataUsingEncoding:4];
      v7 = [v6 dmd_sha1Hash];
      v8 = [v7 base64EncodedStringWithOptions:0];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)setSkipBackupAttribute:(BOOL)a3 toItemAtPath:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = +[NSURL fileURLWithPath:v5];
  if (v6
    && (+[NSFileManager defaultManager],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v6 path],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v7 fileExistsAtPath:v8],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v18 = 0;
    unsigned int v10 = [v6 getResourceValue:&v18 forKey:NSURLIsExcludedFromBackupKey error:0];
    id v11 = v18;
    v12 = v11;
    if (v10 && [v11 BOOLValue] == v4)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      v13 = +[NSNumber numberWithBool:v4];
      id v17 = 0;
      unsigned int v14 = [v6 setResourceValue:v13 forKey:NSURLIsExcludedFromBackupKey error:&v17];
      id v15 = v17;

      if ((!v14 || v15) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100085DFC(v6, (uint64_t)v15);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100085D7C((uint64_t)v5);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

@end