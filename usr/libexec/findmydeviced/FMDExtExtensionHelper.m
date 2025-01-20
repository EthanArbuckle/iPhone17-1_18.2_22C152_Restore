@interface FMDExtExtensionHelper
+ (id)_getConnectionForID:(id)a3 withDelegate:(id)a4;
+ (id)extensionforFeature:(id)a3 flavor:(id)a4;
+ (id)getAccessoryControllerForFeature:(id)a3 flavor:(id)a4;
+ (id)getAccessoryControllerForFeature:(id)a3 flavor:(id)a4 withDelegate:(id)a5;
+ (id)getAccessoryProxyForId:(id)a3 withDelegate:(id)a4;
+ (id)getAllExtensions;
@end

@implementation FMDExtExtensionHelper

+ (id)getAccessoryProxyForId:(id)a3 withDelegate:(id)a4
{
  id v6 = a3;
  v7 = [a1 _getConnectionForID:v6 withDelegate:a4];
  v8 = v7;
  if (v7)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005C5B4;
    v21[3] = &unk_1002DA200;
    v9 = v7;
    v22 = v9;
    id v10 = v6;
    id v23 = v10;
    v11 = [v9 remoteObjectProxyWithErrorHandler:v21];
    v12 = sub_100059878();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v25 = v11;
      __int16 v26 = 2048;
      v27 = v9;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Created new remoteObjectProxy %p with connection %p for extensionId = %@", buf, 0x20u);
    }

    v13 = v22;
  }
  else
  {
    v13 = sub_100059878();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10023F624((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)_getConnectionForID:(id)a3 withDelegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[FMDExtExtensionsDataSource sharedInstance];
  v8 = [v7 extensions];
  v9 = [v8 objectForKeyedSubscript:v5];

  if (!v9)
  {
    id v10 = sub_100059878();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10023F780((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  id v42 = 0;
  uint64_t v17 = [v9 beginExtensionRequestWithOptions:0 inputItems:0 error:&v42];
  id v18 = v42;
  if (v18)
  {
    uint64_t v19 = sub_100059878();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10023F714((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    }
    __int16 v26 = 0;
  }
  else
  {
    id v27 = v17;
    __int16 v28 = [v9 _extensionContextForUUID:v27];
    if (v28)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v6)
      {
        if (isKindOfClass) {
          [v28 setAccessoryDelegate:v6];
        }
      }
    }
    v30 = [v28 _auxiliaryConnection];
    if (v30)
    {
      v31 = +[NSString stringWithFormat:@"%p", v30];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10005C8E4;
      v39[3] = &unk_1002D93F0;
      id v32 = v27;
      id v40 = v32;
      id v33 = v31;
      id v41 = v33;
      [v30 setInterruptionHandler:v39];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10005C930;
      v36[3] = &unk_1002D93F0;
      id v37 = v32;
      id v38 = v33;
      id v34 = v33;
      [v30 setInvalidationHandler:v36];
    }
    uint64_t v19 = v30;

    __int16 v26 = v19;
  }

  return v26;
}

+ (id)getAllExtensions
{
  v2 = +[FMDExtExtensionsDataSource sharedInstance];
  v3 = [v2 extensions];
  v4 = [v3 allKeys];

  return v4;
}

+ (id)extensionforFeature:(id)a3 flavor:(id)a4
{
  uint64_t v5 = qword_10031E978;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_10031E978, &stru_1002DB6B8);
  }
  v8 = +[NSString stringWithFormat:@"%@__%@", v7, v6];

  v9 = [(id)qword_10031E970 objectForKeyedSubscript:v8];

  return v9;
}

+ (id)getAccessoryControllerForFeature:(id)a3 flavor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[FMDExtExtensionHelper extensionforFeature:v5 flavor:v6];
  if (v7)
  {
    v8 = +[FMDExtExtensionHelper getAccessoryProxyForId:v7 withDelegate:0];
  }
  else
  {
    v9 = sub_100059878();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023F8DC();
    }

    v8 = 0;
  }

  return v8;
}

+ (id)getAccessoryControllerForFeature:(id)a3 flavor:(id)a4 withDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[FMDExtExtensionHelper extensionforFeature:v7 flavor:v8];
  if (v10)
  {
    uint64_t v11 = +[FMDExtExtensionHelper getAccessoryProxyForId:v10 withDelegate:v9];
    if (v11) {
      goto LABEL_9;
    }
    uint64_t v12 = sub_100059878();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023F944();
    }
  }
  else
  {
    uint64_t v12 = sub_100059878();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023F8DC();
    }
    uint64_t v11 = 0;
  }

LABEL_9:

  return v11;
}

@end