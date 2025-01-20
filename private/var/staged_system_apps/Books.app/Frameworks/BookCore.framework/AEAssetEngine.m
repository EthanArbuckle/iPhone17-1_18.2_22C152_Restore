@interface AEAssetEngine
+ (id)appInfoMgr;
+ (id)cachePathForAssetID:(id)a3;
+ (id)cachePathForAssetType:(id)a3 withAssetID:(id)a4;
+ (id)libraryMgr;
+ (id)storeMgr;
+ (void)setAppInfoMgr:(id)a3;
+ (void)setLibraryMgr:(id)a3;
+ (void)setStoreMgr:(id)a3;
@end

@implementation AEAssetEngine

+ (void)setAppInfoMgr:(id)a3
{
}

+ (id)appInfoMgr
{
  return (id)qword_3456D0;
}

+ (void)setStoreMgr:(id)a3
{
}

+ (id)storeMgr
{
  return (id)qword_3456D8;
}

+ (void)setLibraryMgr:(id)a3
{
  id v4 = a3;
  if ((id)qword_3456E0 != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&qword_3456E0, a3);
    id v4 = v5;
  }
}

+ (id)libraryMgr
{
  return (id)qword_3456E0;
}

+ (id)cachePathForAssetID:(id)a3
{
  return +[AEAssetEngine cachePathForAssetType:@"AE" withAssetID:a3];
}

+ (id)cachePathForAssetType:(id)a3 withAssetID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ((unint64_t)[v5 length] < 2)
  {
    v7 = @"AE";
  }
  else
  {
    v7 = [v5 substringToIndex:2];
  }
  v8 = +[UIApplication applicationCacheDirectory];
  v9 = [v8 stringByAppendingPathComponent:@"AssetInfo"];

  v10 = [v9 stringByAppendingPathComponent:v6];

  v11 = [v10 stringByAppendingPathComponent:v7];

  v12 = [v11 stringByAppendingPathComponent:v5];

  v13 = objc_opt_new();
  id v19 = 0;
  unsigned __int8 v14 = [v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v15 = v19;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v17 = [v15 localizedDescription];
    +[NSException raise:NSInternalInconsistencyException, @"Could not create cache [path: %@] %@", v12, v17 format];
  }

  return v12;
}

@end