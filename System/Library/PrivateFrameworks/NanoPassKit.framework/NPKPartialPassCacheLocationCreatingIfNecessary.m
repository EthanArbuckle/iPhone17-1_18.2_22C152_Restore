@interface NPKPartialPassCacheLocationCreatingIfNecessary
@end

@implementation NPKPartialPassCacheLocationCreatingIfNecessary

void ___NPKPartialPassCacheLocationCreatingIfNecessary_block_invoke()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v0 = NSURL;
  v1 = PKCacheDirectoryPath();
  v2 = [v0 fileURLWithPath:v1];

  v3 = [v2 URLByAppendingPathComponent:@"PartialPassCache"];
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Removing old partial pass download cache at %@", buf, 0xCu);
    }

    v8 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    char v9 = [v8 removeItemAtURL:v3 error:&v11];
    id v10 = v11;

    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        __int16 v14 = 2112;
        id v15 = v10;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Could not remove old partial pass download cache at %@: %@", buf, 0x16u);
      }
    }
  }
}

@end