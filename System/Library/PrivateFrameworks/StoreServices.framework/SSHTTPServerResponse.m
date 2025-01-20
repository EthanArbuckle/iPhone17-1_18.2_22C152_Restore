@interface SSHTTPServerResponse
- (NSData)body;
- (NSDictionary)headers;
- (SSHTTPServerResponse)initWithStatusCode:(signed __int16)a3;
- (__CFHTTPMessage)copyHTTPMessage;
- (id)bagFromBody;
- (signed)statusCode;
- (void)setBody:(id)a3;
- (void)setBodyWithBag:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setStatusCode:(signed __int16)a3;
@end

@implementation SSHTTPServerResponse

- (SSHTTPServerResponse)initWithStatusCode:(signed __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSHTTPServerResponse;
  result = [(SSHTTPServerResponse *)&v5 init];
  if (result) {
    result->_statusCode = a3;
  }
  return result;
}

- (void)setBodyWithBag:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  body = self->_body;
  self->_body = 0;

  if (v4)
  {
    if ([MEMORY[0x1E4F28F98] propertyList:v4 isValidForFormat:100])
    {
      v6 = (void *)SSViTunesStoreFramework();
      v7 = (uint64_t (*)(void *))SSVWeakLinkedSymbolForString("ISCopyGzippedDataForData", v6);
      id v26 = 0;
      v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:100 options:0 error:&v26];
      id v9 = v26;
      v10 = (NSData *)v7(v8);
      v11 = self->_body;
      self->_body = v10;

      if (v9)
      {
LABEL_6:
        v12 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v12)
        {
          v12 = +[SSLogConfig sharedConfig];
        }
        int v13 = [v12 shouldLog];
        if ([v12 shouldLogToDisk]) {
          int v14 = v13 | 2;
        }
        else {
          int v14 = v13;
        }
        v15 = [v12 OSLogObject];
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          v14 &= 2u;
        }
        if (v14)
        {
          v16 = objc_opt_class();
          int v27 = 138543618;
          v28 = v16;
          __int16 v29 = 2112;
          id v30 = v9;
          id v17 = v16;
          LODWORD(v25) = 22;
          v18 = (void *)_os_log_send_and_compose_impl();

          if (!v18)
          {
LABEL_17:

            goto LABEL_18;
          }
          v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v27, v25);
          free(v18);
          SSFileLog(v12, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v15);
        }

        goto LABEL_17;
      }
    }
  }
  if (!self->_body)
  {
    id v9 = 0;
    goto LABEL_6;
  }
LABEL_18:
}

- (id)bagFromBody
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = (void *)SSViTunesStoreFramework();
  id v4 = (uint64_t (*)(NSData *))SSVWeakLinkedSymbolForString("ISCopyDecompressedGZipDataForData", v3);
  objc_super v5 = (NSData *)v4(self->_body);
  if (v5 || (objc_super v5 = self->_body) != 0)
  {
    id v23 = 0;
    v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v23];
    id v7 = v23;
    if (!v7)
    {
LABEL_16:

      goto LABEL_17;
    }
    v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      v12 = objc_opt_class();
      int v24 = 138543618;
      uint64_t v25 = v12;
      __int16 v26 = 2112;
      id v27 = v7;
      id v13 = v12;
      LODWORD(v22) = 22;
      int v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v24, v22);
      free(v14);
      SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_15;
  }
  v6 = 0;
LABEL_17:

  return v6;
}

- (__CFHTTPMessage)copyHTTPMessage
{
  v3 = [(SSHTTPServerResponse *)self headers];
  id v4 = (void *)[v3 mutableCopy];
  objc_super v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v7 = v6;

  [v7 setObject:@"close" forKeyedSubscript:@"Connection"];
  v8 = [v7 objectForKeyedSubscript:@"Content-Type"];

  if (!v8) {
    [v7 setObject:@"text/html" forKeyedSubscript:@"Content-Type"];
  }
  int v9 = [(SSHTTPServerResponse *)self body];

  if (v9)
  {
    int v10 = NSString;
    v11 = [(SSHTTPServerResponse *)self body];
    v12 = objc_msgSend(v10, "stringWithFormat:", @"%lu", objc_msgSend(v11, "length"));
    [v7 setObject:v12 forKeyedSubscript:@"Content-Length"];
  }
  else
  {
    [v7 removeObjectForKey:@"Content-Length"];
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int v14 = [(SSHTTPServerResponse *)self statusCode];
  Response = CFHTTPMessageCreateResponse(v13, v14, 0, (CFStringRef)*MEMORY[0x1E4F18F90]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__SSHTTPServerResponse_copyHTTPMessage__block_invoke;
  v17[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
  v17[4] = Response;
  [v7 enumerateKeysAndObjectsUsingBlock:v17];
  CFHTTPMessageSetBody(Response, (CFDataRef)[(SSHTTPServerResponse *)self body]);

  return Response;
}

void __39__SSHTTPServerResponse_copyHTTPMessage__block_invoke(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (signed)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(signed __int16)a3
{
  self->_statusCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end