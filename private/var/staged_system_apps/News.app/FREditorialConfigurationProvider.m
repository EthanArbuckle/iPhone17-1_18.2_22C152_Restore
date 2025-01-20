@interface FREditorialConfigurationProvider
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FREditorialConfigurationProvider)init;
- (FREditorialConfigurationProvider)initWithAppConfigurationManager:(id)a3;
- (void)fetchEditorialConfiguration:(id)a3;
- (void)processConfigurationWithJSON:(id)a3 completion:(id)a4;
@end

@implementation FREditorialConfigurationProvider

- (FREditorialConfigurationProvider)initWithAppConfigurationManager:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007C178();
  }
  v9.receiver = self;
  v9.super_class = (Class)FREditorialConfigurationProvider;
  v6 = [(FREditorialConfigurationProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);
  }

  return v7;
}

- (FREditorialConfigurationProvider)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FREditorialConfigurationProvider init]";
    __int16 v7 = 2080;
    v8 = "FREditorialConfigurationProvider.m";
    __int16 v9 = 1024;
    int v10 = 21;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FREditorialConfigurationProvider init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)fetchEditorialConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(FREditorialConfigurationProvider *)self appConfigurationManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006B560;
  v7[3] = &unk_1000C6EA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAppConfigurationIfNeededWithCompletion:v7];
}

- (void)processConfigurationWithJSON:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dataUsingEncoding:4];
  id v38 = 0;
  __int16 v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v38];
  id v8 = v38;
  __int16 v9 = v8;
  if (v8)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006BB20;
    v35[3] = &unk_1000C5988;
    id v36 = v8;
    id v37 = v5;
    sub_10006BB20((uint64_t)v35);

    int v10 = v36;
    goto LABEL_23;
  }
  v25 = v7;
  v26 = v6;
  id v27 = v5;
  __int16 v11 = [v7 objectForKey:@"items"];
  v29 = +[NSMutableArray array];
  id v12 = +[NSMutableSet set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v31 objects:v47 count:16];
  id v30 = v13;
  if (!v14) {
    goto LABEL_20;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v32;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      v19 = [v18 valueForKey:@"id"];
      v20 = [v18 valueForKey:@"title"];
      v21 = [v18 valueForKey:@"subtitle"];
      v22 = [v18 valueForKey:@"subtitleColor"];
      v23 = [v18 valueForKey:@"actionUrl"];
      if (!v19 || ([v12 containsObject:v19] & 1) != 0)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        v24 = (FREditorialOverrideItem *)[objc_alloc((Class)NSString) initWithFormat:@"id value cannot be nil in feed navigation configuration json."];
        *(_DWORD *)buf = 136315906;
        v40 = "-[FREditorialConfigurationProvider processConfigurationWithJSON:completion:]";
        __int16 v41 = 2080;
        v42 = "FREditorialConfigurationProvider.m";
        __int16 v43 = 1024;
        int v44 = 105;
        __int16 v45 = 2114;
        v46 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        goto LABEL_15;
      }
      if ((objc_msgSend(v19, "fc_isValidTagID") & 1) != 0
        || (objc_msgSend(v19, "fc_isValidArticleID") & 1) != 0)
      {
        v24 = [[FREditorialOverrideItem alloc] initWithIdentifier:v19 title:v20 subtitle:v21 subtitleColorString:v22 actionUrlString:v23];
        [v29 addObject:v24];
        [v12 addObject:v19];
LABEL_15:

        id v13 = v30;
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v28 = (FREditorialOverrideItem *)[objc_alloc((Class)NSString) initWithFormat:@"id value must represent either an article or a tag."];
        *(_DWORD *)buf = 136315906;
        v40 = "-[FREditorialConfigurationProvider processConfigurationWithJSON:completion:]";
        __int16 v41 = 2080;
        v42 = "FREditorialConfigurationProvider.m";
        __int16 v43 = 1024;
        int v44 = 88;
        __int16 v45 = 2114;
        v46 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
LABEL_18:
    }
    id v15 = [v13 countByEnumeratingWithState:&v31 objects:v47 count:16];
  }
  while (v15);
LABEL_20:

  id v5 = v27;
  if (v27) {
    (*((void (**)(id, void *, void))v27 + 2))(v27, v29, 0);
  }

  __int16 v7 = v25;
  id v6 = v26;
  __int16 v9 = 0;
  int v10 = v30;
LABEL_23:
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
}

@end