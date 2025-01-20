@interface CloudArtworkImportSetupOperation
+ (CloudArtworkImportSetupOperation)sharedSetupOperation;
- (void)start;
@end

@implementation CloudArtworkImportSetupOperation

- (void)start
{
  v2 = +[NSFileManager defaultManager];
  v3 = sub_1000D4924();
  v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up artwork cache directory.", buf, 2u);
  }

  id v21 = 0;
  unsigned __int8 v5 = [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v6 = v21;
  if ((v5 & 1) == 0)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v3;
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error creating directory. path=%{public}@ error=%{public}@", buf, 0x16u);
    }
  }
  v8 = [v2 enumeratorAtPath:v3];
  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      v11 = [v3 stringByAppendingPathComponent:v10];
      id v20 = v6;
      unsigned __int8 v12 = [v2 removeItemAtPath:v11 error:&v20];
      id v13 = v20;

      if ((v12 & 1) == 0)
      {
        v14 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v3 stringByAppendingPathComponent:v10];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error removing item path=%{public}@", buf, 0xCu);
        }
      }
      uint64_t v16 = [v8 nextObject];

      v10 = (void *)v16;
      id v6 = v13;
    }
    while (v16);
  }
  else
  {
    id v13 = v6;
  }
  v17 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Artwork cache setup complete.", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)CloudArtworkImportSetupOperation;
  [(CloudArtworkImportSetupOperation *)&v19 finishWithError:v13];
}

+ (CloudArtworkImportSetupOperation)sharedSetupOperation
{
  if (qword_1001F3AC0 != -1) {
    dispatch_once(&qword_1001F3AC0, &stru_1001BEE70);
  }
  v2 = (void *)qword_1001F3AC8;

  return (CloudArtworkImportSetupOperation *)v2;
}

@end