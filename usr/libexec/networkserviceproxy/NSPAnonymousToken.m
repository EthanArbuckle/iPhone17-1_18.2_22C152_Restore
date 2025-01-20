@interface NSPAnonymousToken
+ (id)description;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6;
@end

@implementation NSPAnonymousToken

+ (id)description
{
  return @"AnonToken";
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null urlRequest", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (!v10)
  {
    v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null tokenFetchURLSession", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (!v11)
  {
    v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null tokenActivationQuery", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_18;
  }
  v13 = [v11 authInfo];

  if (!v13)
  {
    v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s called with null tokenActivationQuery.authInfo", (uint8_t *)&buf, 0xCu);
    }
LABEL_18:

    (*((void (**)(id, uint64_t, void, void, void))v12 + 2))(v12, 4, 0, 0, 0);
    goto LABEL_6;
  }
  [v11 setAuthType:4];
  v14 = [v11 data];
  [v9 setHTTPBody:v14];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100005DFC;
  v26 = sub_1000B281C;
  id v27 = 0;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1000B4360;
  v20 = &unk_100106A90;
  p_long long buf = &buf;
  id v21 = v12;
  v15 = [v10 dataTaskWithRequest:v9 completionHandler:&v17];
  objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v15);
  [*(id *)(*((void *)&buf + 1) + 40) resume:v17, v18, v19, v20];

  _Block_object_dispose(&buf, 8);
LABEL_6:
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
}

@end