@interface ScratchManager
+ (id)_baseDirectoryPath;
+ (id)_containerDirectoryPath;
+ (id)_directoryPathForDownloadID:(int64_t)a3 createIfNeeded:(BOOL)a4 atBasePath:(id)a5;
+ (id)baseDirectoryPath;
+ (id)containerDirectoryPath;
+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 createIfNeeded:(BOOL)a5;
+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 kind:(id)a5 createIfNeeded:(BOOL)a6;
+ (id)directoryPathForDownloadID:(int64_t)a3 kind:(id)a4 createIfNeeded:(BOOL)a5;
@end

@implementation ScratchManager

+ (id)baseDirectoryPath
{
  v2 = [a1 _baseDirectoryPath];
  id v3 = objc_alloc_init((Class)NSFileManager);
  [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];

  return v2;
}

+ (id)containerDirectoryPath
{
  v2 = [a1 _containerDirectoryPath];
  id v3 = objc_alloc_init((Class)NSFileManager);
  [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];

  return v2;
}

+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 createIfNeeded:(BOOL)a5
{
  return [a1 directoryPathForDownloadID:a3 assetID:a4 kind:0 createIfNeeded:a5];
}

+ (id)directoryPathForDownloadID:(int64_t)a3 assetID:(int64_t)a4 kind:(id)a5 createIfNeeded:(BOOL)a6
{
  v7 = [a1 directoryPathForDownloadID:a3 kind:a5 createIfNeeded:a6];
  v8 = +[NSString stringWithFormat:@"%lld", a4];
  v9 = [v7 stringByAppendingPathComponent:v8];

  return v9;
}

+ (id)directoryPathForDownloadID:(int64_t)a3 kind:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = +[ApplicationWorkspace defaultWorkspace];
  if ([v9 isMultiUser])
  {
    int IsEBookKind = SSDownloadKindIsEBookKind();

    if (IsEBookKind)
    {
      uint64_t v11 = [a1 _containerDirectoryPath];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v11 = [a1 _baseDirectoryPath];
LABEL_6:
  v12 = (void *)v11;
  if (!v11)
  {
    v12 = [a1 _baseDirectoryPath];
  }
  v13 = [a1 _directoryPathForDownloadID:a3 createIfNeeded:v5 atBasePath:v12];

  return v13;
}

+ (id)_baseDirectoryPath
{
  if (qword_100401DF8 != -1) {
    dispatch_once(&qword_100401DF8, &stru_1003A6978);
  }
  v2 = (void *)qword_100401DF0;

  return v2;
}

+ (id)_containerDirectoryPath
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100108308;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401E08 != -1) {
    dispatch_once(&qword_100401E08, block);
  }
  v2 = (void *)qword_100401E00;

  return v2;
}

+ (id)_directoryPathForDownloadID:(int64_t)a3 createIfNeeded:(BOOL)a4 atBasePath:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = +[NSString stringWithFormat:@"%lld", a3];
  v9 = [v7 stringByAppendingPathComponent:v8];

  if (v5 && v9)
  {
    id v10 = objc_alloc_init((Class)NSFileManager);
    [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v9;
}

@end