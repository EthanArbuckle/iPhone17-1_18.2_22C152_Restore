@interface NSPBAA_Anisette
+ (id)description;
+ (void)authenticationFailure;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6;
+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6;
@end

@implementation NSPBAA_Anisette

+ (id)description
{
  return @"BAA_Anisette";
}

+ (void)authenticationFailure
{
  +[NSPBAA authenticationFailure];

  +[NSPAnisette authenticationFailure];
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    v24 = nplog_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:c"
                                      "ompletionHandler:]";
      v25 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    (*((void (**)(id, uint64_t, void, void, void))v12 + 2))(v12, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    v24 = nplog_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:c"
                                      "ompletionHandler:]";
      v25 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    v24 = nplog_obj();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:com"
                                    "pletionHandler:]";
    v25 = "%s called with null tokenActivationQuery";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, v25, (uint8_t *)&buf, 0xCu);
    goto LABEL_11;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000B3AA4;
  v28[3] = &unk_100107148;
  id v27 = v9;
  id v29 = v9;
  id v26 = v10;
  id v30 = v10;
  id v31 = v11;
  id v32 = v12;
  id v13 = v11;
  id v14 = v29;
  id v15 = v30;
  id v16 = v31;
  v17 = v28;
  self;
  [v16 setAuthType:1];
  v18 = [v16 tokenInfo];
  v19 = [v18 data];
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  v34 = sub_1000B2C94;
  v35 = &unk_1001070D0;
  id v20 = v16;
  id v36 = v20;
  id v21 = v14;
  id v37 = v21;
  id v22 = v15;
  id v38 = v22;
  v23 = v17;
  id v39 = v23;
  sub_1000B206C((uint64_t)NSPBAA, v19, &buf);

  id v11 = v13;
  id v9 = v27;

  id v10 = v26;
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
    id v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      id v22 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    (*((void (**)(id, uint64_t, void, void, void))v12 + 2))(v12, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    id v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      id v22 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    id v21 = nplog_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    id v22 = "%s called with null messageBody";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, v22, (uint8_t *)&buf, 0xCu);
    goto LABEL_11;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000B3EA0;
  v23[3] = &unk_100107148;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  id v13 = v24;
  id v14 = v25;
  id v15 = v26;
  id v16 = v23;
  self;
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  id v29 = sub_1000B35B4;
  id v30 = &unk_100107120;
  id v17 = v13;
  id v31 = v17;
  id v18 = v15;
  id v32 = v18;
  id v19 = v14;
  id v33 = v19;
  id v20 = v16;
  id v34 = v20;
  sub_1000B2DE4((uint64_t)NSPBAA, v18, v17, &buf);

LABEL_5:
}

@end