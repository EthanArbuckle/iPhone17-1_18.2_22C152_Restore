@interface SPRSecureChannel
+ (NSString)serverResponseBody;
+ (NSString)serverResponseHeader;
+ (id)secureChannelWithName:(id)a3 error:(id *)a4;
- (BOOL)startSessionAsyncWithRequest:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6;
- (BOOL)startSessionAsyncWithRequest:(id)a3 delegate:(id)a4 error:(id *)a5;
- (SPRSecureChannel)init;
- (SPRSecureChannel)initWithName:(id)a3 error:(id *)a4;
- (id)securingRequest:(id)a3 error:(id *)a4;
- (id)startDataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)startDownloadTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)startSessionWithRequest:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)startSessionWithRequest:(id)a3 error:(id *)a4;
@end

@implementation SPRSecureChannel

+ (NSString)serverResponseHeader
{
  return (NSString *)@"header";
}

+ (NSString)serverResponseBody
{
  return (NSString *)@"body";
}

- (SPRSecureChannel)init
{
  v7 = objc_msgSend_shared(SPRPrimer, a2, v2, v3, v4, v5);
  objc_msgSend_secureChannelAndReturnError_(v7, v8, 0, v9, v10, v11);
  v12 = (SPRSecureChannel *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)startDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (id)startDownloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (id)securingRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_221257A5C;
  v30 = sub_221257A6C;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_221257A5C;
  v24 = sub_221257A6C;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_221257A74;
  v19[3] = &unk_26459CAD0;
  v19[4] = &v26;
  uint64_t v11 = objc_msgSend_syncProxyWithErrorHandler_(self, v7, (uint64_t)v19, v8, v9, v10);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_221257A84;
  v18[3] = &unk_26459D250;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend_securingRequest_reply_(v11, v12, (uint64_t)v6, (uint64_t)v18, v13, v14);

  if (a4)
  {
    v15 = (void *)v27[5];
    if (v15) {
      *a4 = v15;
    }
  }
  id v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (SPRSecureChannel)initWithName:(id)a3 error:(id *)a4
{
  uint64_t v8 = objc_msgSend_shared(SPRPrimer, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  objc_msgSend_secureChannelAndReturnError_(v8, v9, (uint64_t)a4, v10, v11, v12);
  uint64_t v13 = (SPRSecureChannel *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)secureChannelWithName:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend_shared(SPRPrimer, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  uint64_t v12 = objc_msgSend_secureChannelAndReturnError_(v7, v8, (uint64_t)a4, v9, v10, v11);

  return v12;
}

- (id)startSessionWithRequest:(id)a3 configuration:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)startSessionWithRequest:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F08C00];
  id v7 = a3;
  uint64_t v13 = objc_msgSend_ephemeralSessionConfiguration(v6, v8, v9, v10, v11, v12);
  id v16 = objc_msgSend_startSessionWithRequest_configuration_error_(self, v14, (uint64_t)v7, (uint64_t)v13, (uint64_t)a4, v15);

  return v16;
}

- (BOOL)startSessionAsyncWithRequest:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)startSessionAsyncWithRequest:(id)a3 delegate:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x263F08C00];
  id v9 = a4;
  id v10 = a3;
  id v16 = objc_msgSend_ephemeralSessionConfiguration(v8, v11, v12, v13, v14, v15);
  LOBYTE(a5) = objc_msgSend_startSessionAsyncWithRequest_configuration_delegate_error_(self, v17, (uint64_t)v10, (uint64_t)v16, (uint64_t)v9, (uint64_t)a5);

  return (char)a5;
}

@end