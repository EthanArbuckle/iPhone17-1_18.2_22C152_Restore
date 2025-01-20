@interface MSDServer
- (MSDSession)session;
- (id)taskInfoFromCommandRequest:(id)a3;
- (void)sendQueryForRequest:(id)a3 toPath:(id)a4 maxRetry:(int64_t)a5;
- (void)sendRequest:(id)a3 toEndpoint:(id)a4 postData:(BOOL)a5 maxRetry:(int64_t)a6;
- (void)setSession:(id)a3;
@end

@implementation MSDServer

- (void)sendQueryForRequest:(id)a3 toPath:(id)a4 maxRetry:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100080C48;
  v23[3] = &unk_100153500;
  id v10 = v8;
  id v24 = v10;
  v11 = objc_retainBlock(v23);
  if ([v10 isValid])
  {
    v12 = [v10 getQueryItems];

    if (v12)
    {
      if (v9)
      {
        id v13 = objc_alloc_init((Class)NSURLComponents);
        v14 = [v10 getQueryItems];
        [v13 setQueryItems:v14];

        [v13 setPath:v9];
        v15 = [(MSDServer *)self taskInfoFromCommandRequest:v10];
        v16 = [v13 URL];
        v17 = [v16 absoluteString];
        [(MSDServerResponse *)v15 setEndpoint:v17];

        [(MSDServerResponse *)v15 setMaxRetry:a5];
        [(MSDServerResponse *)v15 setHandler:v11];
        v18 = [(MSDServer *)self session];
        [v18 launchTaskWithInfo:v15];

        id v19 = 0;
        goto LABEL_5;
      }
      v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000D4CD0(v10);
      }
    }
    else
    {
      v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000D4C4C(v10);
      }
    }
  }
  else
  {
    v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000D4D54(v10);
    }
  }

  id v22 = 0;
  sub_1000C3140(&v22, 3727744769, @"Input is invalid");
  id v19 = v22;
  v21 = [v10 completion];

  if (!v21) {
    goto LABEL_6;
  }
  id v13 = [v10 completion];
  v15 = [[MSDServerResponse alloc] initWithError:v19];
  (*((void (**)(id, MSDServerResponse *))v13 + 2))(v13, v15);
LABEL_5:

LABEL_6:
}

- (void)sendRequest:(id)a3 toEndpoint:(id)a4 postData:(BOOL)a5 maxRetry:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100080F94;
  v22[3] = &unk_100153500;
  id v12 = v10;
  id v23 = v12;
  id v13 = objc_retainBlock(v22);
  if (([v12 isValid] & 1) == 0)
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000D4D54(v12);
    }
    goto LABEL_14;
  }
  if (v7)
  {
    v14 = [v12 getPostData];
    if (!v14)
    {
      v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000D4DD8(v12);
      }
LABEL_14:
      v14 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v14 = 0;
  }
  if (v11)
  {
    v16 = [(MSDServer *)self taskInfoFromCommandRequest:v12];
    if (v16)
    {
      v17 = v16;
      [v16 setEndpoint:v11];
      [v17 setMaxRetry:a6];
      [v17 setPostData:v14];
      [v17 setHandler:v13];
      v18 = [(MSDServer *)self session];
      [(MSDServerResponse *)v18 launchTaskWithInfo:v17];
      id v19 = 0;
      goto LABEL_10;
    }
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000D4EE0(v12);
    }
  }
  else
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000D4E5C(v12);
    }
  }
LABEL_19:

  id v21 = 0;
  sub_1000C3140(&v21, 3727744769, @"Input is invalid");
  id v19 = v21;
  v20 = [v12 completion];

  if (!v20) {
    goto LABEL_11;
  }
  v17 = [v12 completion];
  v18 = [[MSDServerResponse alloc] initWithError:v19];
  ((void (**)(void, MSDServerResponse *))v17)[2](v17, v18);
LABEL_10:

LABEL_11:
}

- (id)taskInfoFromCommandRequest:(id)a3
{
  return 0;
}

- (MSDSession)session
{
  return (MSDSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end