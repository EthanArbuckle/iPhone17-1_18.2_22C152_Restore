@interface FRNewsReferralItemEncoder
- (FRNewsReferralItem)referralItem;
- (FRNewsReferralItemEncoder)init;
- (FRNewsReferralItemEncoder)initWithReferralItem:(id)a3 sharedDirectoryFileURL:(id)a4;
- (NSURL)sharedDirectoryFileURL;
- (id)encodeQueryValueWithError:(id *)a3;
@end

@implementation FRNewsReferralItemEncoder

- (FRNewsReferralItemEncoder)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRNewsReferralItemEncoder init]";
    __int16 v7 = 2080;
    v8 = "FRNewsReferralItemEncoding.m";
    __int16 v9 = 1024;
    int v10 = 27;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRNewsReferralItemEncoder init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FRNewsReferralItemEncoder)initWithReferralItem:(id)a3 sharedDirectoryFileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E6ADC();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E6A18();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FRNewsReferralItemEncoder;
  v8 = [(FRNewsReferralItemEncoder *)&v14 init];
  if (v8)
  {
    __int16 v9 = (FRNewsReferralItem *)[v6 copy];
    referralItem = v8->_referralItem;
    v8->_referralItem = v9;

    __int16 v11 = (NSURL *)[v7 copy];
    sharedDirectoryFileURL = v8->_sharedDirectoryFileURL;
    v8->_sharedDirectoryFileURL = v11;
  }
  return v8;
}

- (id)encodeQueryValueWithError:(id *)a3
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100011BAC;
  v36 = sub_100011BBC;
  id v37 = 0;
  v5 = +[NSFileManager defaultManager];
  id v6 = +[NSUUID UUID];
  id v7 = [v6 UUIDString];

  v8 = [(FRNewsReferralItemEncoder *)self sharedDirectoryFileURL];
  __int16 v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:1];

  int v10 = (id *)(v33 + 5);
  id obj = (id)v33[5];
  [v5 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong(v10, obj);
  if (v33[5])
  {
    __int16 v11 = 0;
  }
  else
  {
    id v12 = [(FRNewsReferralItemEncoder *)self referralItem];
    v13 = [v12 assetHandles];
    objc_super v14 = objc_opt_new();
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100011BC4;
    v26[3] = &unk_100123DD0;
    id v15 = v9;
    id v27 = v15;
    id v28 = v5;
    v30 = &v32;
    id v16 = v14;
    id v29 = v16;
    [v13 enumerateObjectsUsingBlock:v26];
    if (v33[5])
    {
      __int16 v11 = 0;
    }
    else
    {
      uint64_t v17 = [v12 encodableElement];
      v38[0] = @"a";
      v38[1] = @"b";
      v39[0] = v17;
      v39[1] = v16;
      v24 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
      v22 = (void *)v17;
      v23 = [v15 URLByAppendingPathComponent:@"dictionary" isDirectory:0];
      v18 = +[NSKeyedArchiver archivedDataWithRootObject:v24 requiringSecureCoding:1 error:0];
      v19 = (id *)(v33 + 5);
      id v25 = (id)v33[5];
      [v18 writeToURL:v23 options:1 error:&v25];
      objc_storeStrong(v19, v25);
      v20 = v22;
      if (v33[5])
      {
        __int16 v11 = 0;
      }
      else
      {
        __int16 v11 = [v15 absoluteString];
        v20 = v22;
      }
    }
  }
  if (a3) {
    *a3 = (id) v33[5];
  }

  _Block_object_dispose(&v32, 8);

  return v11;
}

- (FRNewsReferralItem)referralItem
{
  return self->_referralItem;
}

- (NSURL)sharedDirectoryFileURL
{
  return self->_sharedDirectoryFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDirectoryFileURL, 0);

  objc_storeStrong((id *)&self->_referralItem, 0);
}

@end