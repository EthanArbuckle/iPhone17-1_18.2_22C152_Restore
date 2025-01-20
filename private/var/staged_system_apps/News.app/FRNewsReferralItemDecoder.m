@interface FRNewsReferralItemDecoder
- (FCAssetManager)assetManager;
- (FRNewsReferralItemDecoder)init;
- (FRNewsReferralItemDecoder)initWithAssetManager:(id)a3;
- (id)destructivelyDecodeReferraltemOfClass:(Class)a3 withQueryValue:(id)a4 error:(id *)a5;
@end

@implementation FRNewsReferralItemDecoder

- (FRNewsReferralItemDecoder)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRNewsReferralItemDecoder init]";
    __int16 v7 = 2080;
    v8 = "FRNewsReferralItemEncoding.m";
    __int16 v9 = 1024;
    int v10 = 147;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRNewsReferralItemDecoder init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FRNewsReferralItemDecoder)initWithAssetManager:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006FFF4();
  }
  v9.receiver = self;
  v9.super_class = (Class)FRNewsReferralItemDecoder;
  v6 = [(FRNewsReferralItemDecoder *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetManager, a3);
  }

  return v7;
}

- (id)destructivelyDecodeReferraltemOfClass:(Class)a3 withQueryValue:(id)a4 error:(id *)a5
{
  id v6 = a4;
  if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007017C();
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000700B8();
  }
LABEL_6:
  v28 = v6;
  __int16 v7 = +[NSURL URLWithString:v6];
  v8 = +[NSFileManager defaultManager];
  id v9 = [(objc_class *)a3 encodableElementClass];
  int v10 = [v7 URLByAppendingPathComponent:@"dictionary" isDirectory:0];
  id v11 = [objc_alloc((Class)NSData) initWithContentsOfURL:v10];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v9, objc_opt_class(), 0);
  v26 = v11;
  v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v14 fromData:v11 error:0];

  v16 = [v15 objectForKeyedSubscript:@"a"];
  v17 = [v15 objectForKeyedSubscript:@"b"];
  [(FRNewsReferralItemDecoder *)self assetManager];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001F51C;
  v30[3] = &unk_1000C5960;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v18;
  v19 = [v17 fc_dictionaryByTransformingValuesWithKeyAndValueBlock:v30];
  id v20 = [[a3 alloc] initWithEncodableElement:v16 assetHandlesByRemoteURL:v19];
  id v29 = 0;
  [v8 removeItemAtURL:v7 error:&v29];
  id v21 = v29;
  v22 = v21;
  if (a5)
  {
    id v25 = v21;
    *a5 = v21;
    v22 = v25;
  }

  return v20;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void).cxx_destruct
{
}

@end