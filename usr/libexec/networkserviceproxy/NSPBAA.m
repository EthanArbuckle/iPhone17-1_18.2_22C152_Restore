@interface NSPBAA
+ (id)description;
+ (void)authenticationFailure;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6;
@end

@implementation NSPBAA

+ (id)description
{
  return @"BAA";
}

+ (void)authenticationFailure
{
  id v2 = +[NSPDeviceIdentityCertificate sharedDeviceIdentity];
  [v2 deviceIdentityAuthenticationFailed];
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
      v16 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    (*((void (**)(id, uint64_t, void, void, void))v12 + 2))(v12, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
      v16 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    v15 = nplog_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    v23 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
    v16 = "%s called with null tokenActivationQuery";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, v16, buf, 0xCu);
    goto LABEL_11;
  }
  [v11 setAuthType:1];
  v13 = [v11 tokenInfo];
  v14 = [v13 data];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B2B4C;
  v17[3] = &unk_1001070D0;
  id v18 = v11;
  id v19 = v9;
  id v20 = v10;
  id v21 = v12;
  sub_1000B206C((uint64_t)NSPBAA, v14, v17);

LABEL_5:
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      v14 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    (*((void (**)(id, uint64_t, void, void, void))v12 + 2))(v12, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      v14 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    v13 = nplog_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    id v21 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    v14 = "%s called with null messageBody";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v14, buf, 0xCu);
    goto LABEL_11;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B3490;
  v15[3] = &unk_100107120;
  id v16 = v9;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  sub_1000B2DE4((uint64_t)NSPBAA, v17, v16, v15);

LABEL_5:
}

@end