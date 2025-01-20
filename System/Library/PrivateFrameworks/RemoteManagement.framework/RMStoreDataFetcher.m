@interface RMStoreDataFetcher
- (BOOL)_moveDownloadedFile:(id)a3 downloadURL:(id)a4 error:(id *)a5;
- (BOOL)_validateResponseForURL:(id)a3 statusCode:(id)a4 headers:(id)a5 fetchedData:(id)a6 downloadURL:(id)a7 error:(id *)a8;
- (NSURLSession)URLSession;
- (id)_createRequestWithURL:(id)a3 additionalHeaders:(id)a4;
- (id)_dataTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5;
- (id)_dictionaryForResponse:(id)a3 downloadedData:(id)a4 downloadedURL:(id)a5;
- (id)_downloadTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5;
- (id)_makeSession;
- (id)_userAgent;
- (void)_downloadDataAtURL:(id)a3 downloadURL:(id)a4 additionalHeaders:(id)a5 completionHandler:(id)a6;
- (void)_downloadMDMDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5;
- (void)_fetchDataAtURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5;
- (void)_fetchMDMDataAtURL:(id)a3 completionHandler:(id)a4;
- (void)_processDataResponseWithURL:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_processDownloadResponseWithURL:(id)a3 downloadURL:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 completionHandler:(id)a7;
- (void)downloadResponseDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 additionalHeaders:(id)a7 completionHandler:(id)a8;
- (void)fetchDataAtURL:(id)a3 useDDM:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchResponseDataAtURL:(id)a3 useDDM:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6;
- (void)setURLSession:(id)a3;
@end

@implementation RMStoreDataFetcher

- (void)fetchDataAtURL:(id)a3 useDDM:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007BD44;
  v9[3] = &unk_1000C6DE8;
  v10 = self;
  id v11 = a3;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(RMStoreDataFetcher *)v10 fetchResponseDataAtURL:v8 useDDM:v6 additionalHeaders:0 completionHandler:v9];
}

- (void)fetchResponseDataAtURL:(id)a3 useDDM:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  v13 = +[RMLog storeDataFetcher];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10007DF0C();
  }

  if (+[RMStoreUtility isValidURL:v10])
  {
    if (v8
      && ([v10 scheme],
          v14 = objc_claimAutoreleasedReturnValue(),
          id v15 = [v14 caseInsensitiveCompare:@"https"],
          v14,
          !v15))
    {
      [(RMStoreDataFetcher *)self _fetchMDMDataAtURL:v10 completionHandler:v12];
    }
    else
    {
      [(RMStoreDataFetcher *)self _fetchDataAtURL:v10 additionalHeaders:v11 completionHandler:v12];
    }
  }
  else
  {
    v16 = +[RMErrorUtilities createAssetInvalidURLError:v10];
    v17 = +[RMLog storeDataFetcher];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10007DE98();
    }

    v12[2](v12, 0, v16);
  }
}

- (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v14)
  {
    uint64_t v16 = -1;
LABEL_7:
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10007C0A0;
    v20[3] = &unk_1000C6E38;
    v20[4] = self;
    id v21 = v12;
    id v22 = v13;
    uint64_t v24 = v16;
    id v23 = v15;
    [(RMStoreDataFetcher *)self downloadResponseDataAtURL:v21 downloadURL:v22 extensionToken:0 useDDM:v8 additionalHeaders:0 completionHandler:v20];

    goto LABEL_11;
  }
  uint64_t v16 = (uint64_t)+[RMSandbox consumeToken:v14];
  v17 = +[RMLog storeDataFetcher];
  v18 = v17;
  if (v16 != -1)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10007DFF4();
    }

    goto LABEL_7;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10007DF74();
  }

  v19 = +[RMErrorUtilities createInternalError];
  (*((void (**)(id, void *))v15 + 2))(v15, v19);

LABEL_11:
}

- (void)downloadResponseDataAtURL:(id)a3 downloadURL:(id)a4 extensionToken:(id)a5 useDDM:(BOOL)a6 additionalHeaders:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v18 = (void (**)(id, void, void *))a8;
  v19 = +[RMLog storeDataFetcher];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10007E140();
  }

  if ((+[RMStoreUtility isValidURL:v14] & 1) == 0)
  {
    v25 = +[RMErrorUtilities createAssetInvalidURLError:v14];
    v26 = +[RMLog storeDataFetcher];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10007E0CC();
    }

    goto LABEL_13;
  }
  if (v16)
  {
    uint64_t v20 = (uint64_t)+[RMSandbox consumeToken:v16];
    id v21 = +[RMLog storeDataFetcher];
    id v22 = v21;
    if (v20 != -1)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10007DFF4();
      }

      if (v10) {
        goto LABEL_9;
      }
LABEL_15:
      BOOL v24 = 0;
      goto LABEL_16;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10007DF74();
    }

    v25 = +[RMErrorUtilities createInternalError];
LABEL_13:
    v18[2](v18, 0, v25);

    goto LABEL_20;
  }
  uint64_t v20 = -1;
  if (!v10) {
    goto LABEL_15;
  }
LABEL_9:
  id v23 = [v14 scheme];
  BOOL v24 = [v23 caseInsensitiveCompare:@"https"] == 0;

LABEL_16:
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007C570;
  v37[3] = &unk_1000C6E60;
  BOOL v41 = v24;
  v37[4] = self;
  id v27 = v15;
  id v38 = v27;
  uint64_t v40 = v20;
  v39 = v18;
  v28 = objc_retainBlock(v37);
  v29 = v28;
  if (v24)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10007C698;
    v35[3] = &unk_1000C6E88;
    v30 = (id *)&v36;
    v36 = v28;
    v31 = v28;
    [(RMStoreDataFetcher *)self _downloadMDMDataAtURL:v14 downloadURL:v27 completionHandler:v35];
  }
  else
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10007C6A8;
    v33[3] = &unk_1000C6E88;
    v30 = (id *)&v34;
    v34 = v28;
    v32 = v28;
    [(RMStoreDataFetcher *)self _downloadDataAtURL:v14 downloadURL:v27 additionalHeaders:v17 completionHandler:v33];
  }

LABEL_20:
}

- (id)_makeSession
{
  v2 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v3 = +[NSURLSession sessionWithConfiguration:v2 delegate:0 delegateQueue:0];

  return v3;
}

- (void)_fetchMDMDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007C7FC;
  v9[3] = &unk_1000C6EB0;
  id v10 = (id)os_transaction_create();
  id v11 = v5;
  id v7 = v10;
  id v8 = v5;
  +[RMMCAdapter fetchDataAtURL:v6 completionHandler:v9];
}

- (void)_fetchDataAtURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)os_transaction_create();
  id v12 = [(RMStoreDataFetcher *)self _makeSession];
  [(RMStoreDataFetcher *)self setURLSession:v12];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007C98C;
  v18[3] = &unk_1000C6ED8;
  id v13 = v8;
  id v19 = v13;
  id v14 = v9;
  id v21 = v14;
  id v15 = v11;
  id v20 = v15;
  id v16 = [(RMStoreDataFetcher *)self _dataTaskWithURL:v13 additionalHeaders:v10 completionHandler:v18];

  id v17 = +[RMLog storeDataFetcher];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10007E218();
  }

  [v16 resume];
}

- (id)_dataTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [(RMStoreDataFetcher *)self _createRequestWithURL:a3 additionalHeaders:a4];
  id v10 = [(RMStoreDataFetcher *)self URLSession];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007CB3C;
  v14[3] = &unk_1000C6F00;
  v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  id v12 = [v10 dataTaskWithRequest:v9 completionHandler:v14];

  return v12;
}

- (void)_processDataResponseWithURL:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = a6;
    id v14 = +[RMLog storeDataFetcher];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007E4C4();
    }

    id v15 = v12;
    id v16 = 0;
  }
  else
  {
    uint64_t v17 = HTTPResponseKeyBody;
    id v18 = a6;
    id v19 = [v11 objectForKeyedSubscript:v17];
    id v20 = [v11 objectForKeyedSubscript:HTTPResponseKeyStatusCode];
    id v21 = [v11 objectForKeyedSubscript:HTTPResponseKeyHeaders];
    id v29 = 0;
    unsigned int v22 = [(RMStoreDataFetcher *)self _validateResponseForURL:v10 statusCode:v20 headers:v21 fetchedData:v19 downloadURL:0 error:&v29];
    id v23 = v29;

    if (v22)
    {
      BOOL v24 = +[RMLog storeDataFetcher];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_10007E3B4(v10);
      }
      id v15 = 0;
      v25 = v19;
      id v16 = v19;
    }
    else
    {
      id v26 = [v23 code];
      BOOL v24 = +[RMLog storeDataFetcher];
      BOOL v27 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (v26 == (id)1000)
      {
        if (v27) {
          sub_10006EBA0();
        }
      }
      else if (v27)
      {
        sub_10007E438();
      }
      id v16 = 0;
      v25 = v23;
      id v15 = v23;
    }

    id v28 = v25;
  }
  (*((void (**)(id, void *, id))a6 + 2))(a6, v16, v15);
}

- (void)_downloadMDMDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007CF10;
  v12[3] = &unk_1000C6EB0;
  id v13 = (id)os_transaction_create();
  id v14 = v7;
  id v10 = v13;
  id v11 = v7;
  +[RMMCAdapter downloadDataAtURL:v9 downloadURL:v8 completionHandler:v12];
}

- (void)_downloadDataAtURL:(id)a3 downloadURL:(id)a4 additionalHeaders:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = (void *)os_transaction_create();
  id v13 = [(RMStoreDataFetcher *)self _makeSession];
  [(RMStoreDataFetcher *)self setURLSession:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007D0A0;
  v19[3] = &unk_1000C6ED8;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v22 = v15;
  id v16 = v12;
  id v21 = v16;
  uint64_t v17 = [(RMStoreDataFetcher *)self _downloadTaskWithURL:v14 additionalHeaders:v11 completionHandler:v19];

  id v18 = +[RMLog storeDataFetcher];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10007E550();
  }

  [v17 resume];
}

- (id)_downloadTaskWithURL:(id)a3 additionalHeaders:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [(RMStoreDataFetcher *)self _createRequestWithURL:a3 additionalHeaders:a4];
  id v10 = [(RMStoreDataFetcher *)self URLSession];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007D250;
  v14[3] = &unk_1000C6F28;
  v14[4] = self;
  id v15 = v8;
  id v11 = v8;
  id v12 = [v10 downloadTaskWithRequest:v9 completionHandler:v14];

  return v12;
}

- (BOOL)_moveDownloadedFile:(id)a3 downloadURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = HTTPResponseKeyStatusCode;
  id v9 = a3;
  id v10 = [v9 objectForKeyedSubscript:v8];
  id v11 = [v10 integerValue];

  id v12 = [v9 objectForKeyedSubscript:HTTPResponseKeyDownloadURL];

  if (v12)
  {
    id v13 = +[NSFileManager defaultManager];
    id v34 = 0;
    unsigned int v14 = [v13 removeItemAtURL:v7 error:&v34];
    id v15 = v34;

    if (v14)
    {
      id v16 = +[RMLog storeDataFetcher];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10007E78C(v7);
      }

      goto LABEL_6;
    }
    v25 = [v15 domain];
    if ([v25 isEqualToString:NSCocoaErrorDomain])
    {
      id v26 = [v15 code];

      if (v26 == (id)4)
      {
LABEL_6:
        uint64_t v17 = +[NSFileManager defaultManager];
        id v33 = v15;
        unsigned int v18 = [v17 moveItemAtURL:v12 toURL:v7 error:&v33];
        id v19 = v33;

        id v20 = +[RMLog storeDataFetcher];
        id v21 = v20;
        if (v18)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            sub_10007E6EC();
          }
          BOOL v22 = 1;
          goto LABEL_33;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v31 = [v12 path];
          v32 = [v7 path];
          *(_DWORD *)buf = 138543874;
          v36 = v31;
          __int16 v37 = 2114;
          id v38 = v32;
          __int16 v39 = 2114;
          id v40 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to relocate downloaded asset file from %{public}@ to %{public}@: %{public}@", buf, 0x20u);
        }
        if (a5)
        {
          BOOL v27 = +[RMErrorUtilities createAssetCannotProcessFileErrorWithUnderlyingError:v19];
          id v21 = v27;
          if (v27)
          {
            id v21 = v27;
            BOOL v22 = 0;
            *a5 = v21;
          }
          else
          {
            BOOL v22 = 0;
          }
LABEL_33:
          id v15 = v19;
LABEL_34:

          goto LABEL_35;
        }
        BOOL v22 = 0;
        id v15 = v19;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
    }
    id v28 = +[RMLog storeDataFetcher];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10007E810();
    }

    if (a5)
    {
      id v29 = +[RMErrorUtilities createAssetCannotProcessFileErrorWithUnderlyingError:v15];
      id v21 = v29;
      if (v29)
      {
        id v21 = v29;
        BOOL v22 = 0;
        *a5 = v21;
      }
      else
      {
        BOOL v22 = 0;
      }
      goto LABEL_34;
    }
    BOOL v22 = 0;
    goto LABEL_35;
  }
  if (a5)
  {
    id v23 = +[RMErrorUtilities createHTTPErrorWithStatusCode:v11 reason:&stru_1000C74D0];
    BOOL v24 = v23;
    if (v23) {
      *a5 = v23;
    }
  }
  BOOL v22 = 0;
LABEL_36:

  return v22;
}

- (void)_processDownloadResponseWithURL:(id)a3 downloadURL:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    id v16 = a7;
    uint64_t v17 = +[RMLog storeDataFetcher];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10007E93C();
    }

    id v18 = +[RMErrorUtilities createAssetCannotBeDownloadedErrorWithUnderlyingError:v15];
  }
  else
  {
    uint64_t v19 = HTTPResponseKeyStatusCode;
    id v20 = a7;
    id v21 = [v14 objectForKeyedSubscript:v19];
    BOOL v22 = [v14 objectForKeyedSubscript:HTTPResponseKeyHeaders];
    id v29 = 0;
    unsigned int v23 = [(RMStoreDataFetcher *)self _validateResponseForURL:v12 statusCode:v21 headers:v22 fetchedData:0 downloadURL:v13 error:&v29];
    id v24 = v29;

    if (v23)
    {
      v25 = +[RMLog storeDataFetcher];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_10007E89C();
      }

      id v18 = 0;
    }
    else
    {
      id v26 = [v24 code];
      BOOL v27 = +[RMLog storeDataFetcher];
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v26 == (id)1000)
      {
        if (v28) {
          sub_10006EBA0();
        }
      }
      else if (v28)
      {
        sub_10007E438();
      }

      id v18 = v24;
    }
  }
  (*((void (**)(id, id))a7 + 2))(a7, v18);
}

- (id)_dictionaryForResponse:(id)a3 downloadedData:(id)a4 downloadedURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSMutableDictionary dictionaryWithCapacity:4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
    id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 statusCode]);
    [v10 setObject:v12 forKeyedSubscript:HTTPResponseKeyStatusCode];

    id v13 = [v11 allHeaderFields];

    [v10 setObject:v13 forKeyedSubscript:HTTPResponseKeyHeaders];
  }
  else
  {
    [v10 setObject:&off_1000CACB0 forKeyedSubscript:HTTPResponseKeyStatusCode];
    [v10 setObject:&__NSDictionary0__struct forKeyedSubscript:HTTPResponseKeyHeaders];
  }
  [v10 setObject:v9 forKeyedSubscript:HTTPResponseKeyBody];

  [v10 setObject:v8 forKeyedSubscript:HTTPResponseKeyDownloadURL];
  id v14 = [v10 copy];

  return v14;
}

- (id)_createRequestWithURL:(id)a3 additionalHeaders:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    id v8 = [a4 mutableCopy];
  }
  else
  {
    id v9 = a3;
    id v8 = +[NSMutableDictionary dictionaryWithCapacity:1];
  }
  id v10 = v8;
  id v11 = [(RMStoreDataFetcher *)self _userAgent];
  [v10 setObject:v11 forKeyedSubscript:@"User-Agent"];

  id v12 = +[NSMutableURLRequest requestWithURL:a3];

  [v12 setAllHTTPHeaderFields:v10];

  return v12;
}

- (id)_userAgent
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DBB0;
  block[3] = &unk_1000C51B0;
  block[4] = self;
  if (qword_1000DB438 != -1) {
    dispatch_once(&qword_1000DB438, block);
  }
  return (id)qword_1000DB430;
}

- (BOOL)_validateResponseForURL:(id)a3 statusCode:(id)a4 headers:(id)a5 fetchedData:(id)a6 downloadURL:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  id v16 = +[RMLog storeDataFetcher];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10007EA30(v12);
  }

  uint64_t v17 = (char *)[v15 integerValue];
  unint64_t v18 = (unint64_t)(v17 - 600);
  if ((unint64_t)(v17 - 600) >= 0xFFFFFFFFFFFFFF38)
  {
    if (v14)
    {
      uint64_t v19 = +[NSData dataWithContentsOfURL:v14];

      id v20 = +[NSFileManager defaultManager];
      [v20 removeItemAtURL:v14 error:0];

      id v13 = (id)v19;
    }
    if (v13)
    {
      id v21 = [v13 base64EncodedStringWithOptions:0];
    }
    else
    {
      id v21 = @"Empty Response Body";
    }
    BOOL v22 = +[RMErrorUtilities createHTTPErrorWithStatusCode:v17 reason:v21];
    unsigned int v23 = +[RMLog storeDataFetcher];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10007E9C8();
    }

    if (a8 && v22) {
      *a8 = v22;
    }
  }
  return v18 < 0xFFFFFFFFFFFFFF38;
}

- (NSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end