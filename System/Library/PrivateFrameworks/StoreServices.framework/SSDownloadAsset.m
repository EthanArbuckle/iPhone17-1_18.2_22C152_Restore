@interface SSDownloadAsset
+ (id)assetWithURL:(id)a3 type:(int64_t)a4;
+ (int64_t)_existsMessage;
+ (int64_t)_getExternalValuesMessage;
+ (int64_t)_getValueMessage;
+ (int64_t)_setValuesMessage;
- (BOOL)isExternal;
- (NSArray)sinfs;
- (NSString)downloadFileName;
- (NSString)downloadPath;
- (NSString)finalizedPath;
- (NSURLRequest)URLRequest;
- (SSDownloadAsset)initWithURLRequest:(id)a3;
- (SSDownloadAsset)initWithURLRequest:(id)a3 type:(int64_t)a4;
- (SSDownloadAsset)initWithURLRequestProperties:(id)a3;
- (SSURLRequestProperties)URLRequestProperties;
- (SSURLRequestProperties)_localProperties;
- (id)_copyURLRequestProperties;
- (id)copyXPCEncoding;
- (int64_t)_legacyAssetType;
- (int64_t)assetType;
- (int64_t)bytesDownloaded;
- (int64_t)bytesUploadTotal;
- (int64_t)bytesUploaded;
- (int64_t)fileSize;
- (void)_resetLocalIVars;
- (void)dealloc;
@end

@implementation SSDownloadAsset

- (SSDownloadAsset)initWithURLRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSDownloadAsset;
  v4 = [(SSEntity *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = [[SSURLRequestProperties alloc] initWithURLRequest:a3];
    }
    else {
      v5 = 0;
    }
    v4->_localProperties = v5;
  }
  return v4;
}

- (SSDownloadAsset)initWithURLRequestProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSDownloadAsset;
  v4 = [(SSEntity *)&v6 init];
  if (v4) {
    v4->_localProperties = (SSURLRequestProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadAsset;
  [(SSEntity *)&v3 dealloc];
}

- (int64_t)bytesDownloaded
{
  int64_t result = [(SSEntity *)self valueForExternalProperty:@"0"];
  if (result)
  {
    return [(id)result longLongValue];
  }
  return result;
}

- (int64_t)bytesUploaded
{
  int64_t result = [(SSEntity *)self valueForExternalProperty:@"9"];
  if (result)
  {
    return [(id)result longLongValue];
  }
  return result;
}

- (int64_t)bytesUploadTotal
{
  int64_t result = [(SSEntity *)self valueForExternalProperty:@"A"];
  if (result)
  {
    return [(id)result longLongValue];
  }
  return result;
}

- (NSArray)sinfs
{
  return (NSArray *)[(SSEntity *)self valueForExternalProperty:@"1"];
}

- (NSURLRequest)URLRequest
{
  id v2 = [(SSDownloadAsset *)self _copyURLRequestProperties];
  objc_super v3 = (void *)[v2 copyURLRequest];

  return (NSURLRequest *)v3;
}

+ (int64_t)_existsMessage
{
  return 53;
}

+ (int64_t)_getExternalValuesMessage
{
  return 26;
}

+ (int64_t)_getValueMessage
{
  return 10;
}

+ (int64_t)_setValuesMessage
{
  return 21;
}

- (void)_resetLocalIVars
{
  self->_localProperties = 0;
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadAsset;
  [(SSEntity *)&v3 _resetLocalIVars];
}

- (SSURLRequestProperties)URLRequestProperties
{
  id v2 = [(SSDownloadAsset *)self _copyURLRequestProperties];
  return (SSURLRequestProperties *)v2;
}

- (int64_t)_legacyAssetType
{
  return self->_assetType;
}

- (SSURLRequestProperties)_localProperties
{
  id v2 = (void *)[(SSURLRequestProperties *)self->_localProperties copy];
  return (SSURLRequestProperties *)v2;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->super._pid);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SSDownloadAsset_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E5BA7448;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __34__SSDownloadAsset_copyXPCEncoding__block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", *(__CFString **)(*(void *)(a1 + 40) + 32));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "2", *(__CFString **)(*(void *)(a1 + 40) + 72));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:@"d"];
  if (v2)
  {
    uint64_t v3 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
      uint64_t v5 = [v4 URLByDeletingLastPathComponent];

      if (v5) {
        goto LABEL_17;
      }
    }
  }
  id v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    int v9 = v8;
  }
  else {
    int v9 = v8 & 2;
  }
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 64);
    int v68 = 134217984;
    uint64_t v69 = v10;
    LODWORD(v66) = 12;
    v63 = &v68;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v68, v66);
      free(v12);
      SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, v13);
    }
  }
  uint64_t v20 = SSGetFinalizedDirectoryForAssetType(*(void *)(*(void *)(a1 + 40) + 64));
  if (v20)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20];
    if (v5)
    {
LABEL_17:
      uint64_t v67 = 0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v63), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v67) & 1) == 0)
      {
        id v21 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v21) {
          id v21 = +[SSLogConfig sharedConfig];
        }
        int v22 = [v21 shouldLog];
        if ([v21 shouldLogToDisk]) {
          int v23 = v22 | 2;
        }
        else {
          int v23 = v22;
        }
        if (os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_ERROR)) {
          int v24 = v23;
        }
        else {
          int v24 = v23 & 2;
        }
        if (v24)
        {
          int v68 = 138543362;
          uint64_t v69 = v67;
          LODWORD(v66) = 12;
          v64 = &v68;
          uint64_t v25 = _os_log_send_and_compose_impl();
          if (v25)
          {
            v26 = (void *)v25;
            uint64_t v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v68, v66);
            free(v26);
            SSFileLog(v21, @"%@", v28, v29, v30, v31, v32, v33, v27);
          }
        }
        uint64_t v67 = 0;
      }
      id v34 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v34) {
        id v34 = +[SSLogConfig sharedConfig];
      }
      int v35 = [v34 shouldLog];
      if ([v34 shouldLogToDisk]) {
        int v36 = v35 | 2;
      }
      else {
        int v36 = v35;
      }
      if (os_log_type_enabled((os_log_t)[v34 OSLogObject], OS_LOG_TYPE_INFO)) {
        int v37 = v36;
      }
      else {
        int v37 = v36 & 2;
      }
      if (v37)
      {
        int v68 = 138543362;
        uint64_t v69 = v5;
        LODWORD(v66) = 12;
        v65 = &v68;
        uint64_t v38 = _os_log_send_and_compose_impl();
        if (v38)
        {
          v39 = (void *)v38;
          uint64_t v40 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v68, v66);
          free(v39);
          SSFileLog(v34, @"%@", v41, v42, v43, v44, v45, v46, v40);
        }
      }
      id v47 = objc_alloc(MEMORY[0x1E4F28FF8]);
      v48 = objc_msgSend(v47, "initWithURL:readonly:extensionClass:", v5, 0, objc_msgSend(NSString, "stringWithUTF8String:", *MEMORY[0x1E4F14008]));
      uint64_t v49 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v48 requiringSecureCoding:1 error:&v67];
      if (v49)
      {
        SSXPCDictionarySetObject(*(void *)(a1 + 32), "3", v49);
      }
      else
      {
        id v50 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v50) {
          id v50 = +[SSLogConfig sharedConfig];
        }
        int v51 = objc_msgSend(v50, "shouldLog", v65);
        if ([v50 shouldLogToDisk]) {
          int v52 = v51 | 2;
        }
        else {
          int v52 = v51;
        }
        if (os_log_type_enabled((os_log_t)[v50 OSLogObject], OS_LOG_TYPE_ERROR)) {
          int v53 = v52;
        }
        else {
          int v53 = v52 & 2;
        }
        if (v53)
        {
          int v68 = 138543362;
          uint64_t v69 = v67;
          LODWORD(v66) = 12;
          uint64_t v54 = _os_log_send_and_compose_impl();
          if (v54)
          {
            v55 = (void *)v54;
            uint64_t v56 = objc_msgSend(NSString, "stringWithCString:encoding:", v54, 4, &v68, v66);
            free(v55);
            SSFileLog(v50, @"%@", v57, v58, v59, v60, v61, v62, v56);
          }
        }
        uint64_t v67 = 0;
      }
    }
  }
}

+ (id)assetWithURL:(id)a3 type:(int64_t)a4
{
  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURLRequest:", objc_msgSend(MEMORY[0x1E4F290D0], "requestWithURL:", a3));
  v5[8] = a4;
  return v5;
}

- (SSDownloadAsset)initWithURLRequest:(id)a3 type:(int64_t)a4
{
  int64_t result = [(SSDownloadAsset *)self initWithURLRequest:a3];
  if (result) {
    result->_assetType = a4;
  }
  return result;
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (NSString)downloadFileName
{
  id v2 = [(SSEntity *)self valueForProperty:@"4"];
  return (NSString *)[v2 lastPathComponent];
}

- (NSString)downloadPath
{
  return (NSString *)[(SSEntity *)self valueForProperty:@"4"];
}

- (NSString)finalizedPath
{
  return 0;
}

- (int64_t)fileSize
{
  int64_t result = [(SSEntity *)self valueForProperty:@"3"];
  if (result)
  {
    return [(id)result longLongValue];
  }
  return result;
}

- (BOOL)isExternal
{
  id v2 = [(SSEntity *)self valueForProperty:@"9"];
  return [v2 BOOLValue];
}

- (id)_copyURLRequestProperties
{
  v24[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  uint64_t v18 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__SSDownloadAsset__copyURLRequestProperties__block_invoke;
  v12[3] = &unk_1E5BA7688;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(dispatchQueue, v12);
  v4 = (void *)v14[5];
  if (!v4)
  {
    v24[0] = @"5";
    v24[1] = @"6";
    v24[2] = @"7";
    v24[3] = @"8";
    v24[4] = @"9";
    v24[5] = @"a";
    v24[6] = @"b";
    v24[7] = @"c";
    v24[8] = @"3";
    v24[9] = @"n";
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    [(SSEntity *)self getValues:&v19 forProperties:v24 count:10];
    if (*((void *)&v22 + 1))
    {
      uint64_t v5 = objc_alloc_init(SSMutableURLRequestProperties);
      -[SSMutableURLRequestProperties setAllowedRetryCount:](v5, "setAllowedRetryCount:", [(id)v19 integerValue]);
      [(SSMutableURLRequestProperties *)v5 setHTTPBody:*((void *)&v19 + 1)];
      -[SSMutableURLRequestProperties setITunesStoreRequest:](v5, "setITunesStoreRequest:", [(id)v21 BOOLValue] ^ 1);
      [(id)v22 doubleValue];
      [(SSMutableURLRequestProperties *)v5 setTimeoutInterval:"setTimeoutInterval:"];
      uint64_t v6 = *((void *)&v20 + 1);
      if ([*((id *)&v20 + 1) length]) {
        [(SSMutableURLRequestProperties *)v5 setHTTPMethod:v6];
      }
      if ((void)v20) {
        -[SSMutableURLRequestProperties setHTTPHeaders:](v5, "setHTTPHeaders:", [MEMORY[0x1E4F28F98] propertyListWithData:(void)v20 options:0 format:0 error:0]);
      }
      if (*((void *)&v23 + 1))
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        if ([v7 fileExistsAtPath:*((void *)&v23 + 1)])
        {
          id v8 = objc_alloc(MEMORY[0x1E4F1CA10]);
          int v9 = (void *)[v8 initWithFileAtPath:*((void *)&v23 + 1)];
          [(SSMutableURLRequestProperties *)v5 setHTTPBodyStream:v9];
        }
      }
      if (*((void *)&v21 + 1)) {
        -[SSMutableURLRequestProperties setRequestParameters:](v5, "setRequestParameters:", [MEMORY[0x1E4F28F98] propertyListWithData:*((void *)&v21 + 1) options:0 format:0 error:0]);
      }
      if (*((void *)&v22 + 1)) {
        -[SSMutableURLRequestProperties setURL:](v5, "setURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:"));
      }
      if ((void)v23) {
        -[SSMutableURLRequestProperties setExpectedContentLength:](v5, "setExpectedContentLength:", [(id)v23 longLongValue]);
      }
      uint64_t v10 = v14;
      v14[5] = (uint64_t)v5;
    }
    else
    {
      uint64_t v10 = v14;
    }
    v4 = (void *)v10[5];
  }
  _Block_object_dispose(&v13, 8);
  return v4;
}

id __44__SSDownloadAsset__copyURLRequestProperties__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end