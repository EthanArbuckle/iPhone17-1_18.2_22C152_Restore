@interface SSURLConnectionResponse
- (BOOL)ssv_isExpiredResponse;
- (NSData)bodyData;
- (NSData)databaseEncoding;
- (NSHTTPURLResponse)URLResponse;
- (NSString)MIMEType;
- (NSString)storeCorrelationID;
- (NSString)suggestedFilename;
- (NSString)textEncodingName;
- (NSURL)URL;
- (SSMetricsPageEvent)metricsPageEvent;
- (SSURLConnectionResponse)initWithDatabaseEncoding:(id)a3;
- (SSURLConnectionResponse)initWithURLResponse:(id)a3 bodyData:(id)a4;
- (SSURLConnectionResponse)initWithXPCEncoding:(id)a3;
- (id)allHeaderFields;
- (id)copyXPCEncoding;
- (int64_t)expectedContentLength;
- (int64_t)statusCode;
- (void)dealloc;
- (void)setMetricsPageEvent:(id)a3;
@end

@implementation SSURLConnectionResponse

- (BOOL)ssv_isExpiredResponse
{
  v2 = [(SSURLConnectionResponse *)self URLResponse];
  char v3 = objc_msgSend(v2, "ssv_isExpiredResponse");

  return v3;
}

- (SSURLConnectionResponse)initWithURLResponse:(id)a3 bodyData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SSURLConnectionResponse;
  v6 = [(SSURLConnectionResponse *)&v8 init];
  if (v6)
  {
    v6->_bodyData = (NSData *)[a4 copy];
    v6->_urlResponse = (NSHTTPURLResponse *)a3;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSURLConnectionResponse;
  [(SSURLConnectionResponse *)&v3 dealloc];
}

- (id)allHeaderFields
{
  return [(NSHTTPURLResponse *)self->_urlResponse allHeaderFields];
}

- (int64_t)expectedContentLength
{
  return [(NSHTTPURLResponse *)self->_urlResponse expectedContentLength];
}

- (NSString)MIMEType
{
  return (NSString *)[(NSHTTPURLResponse *)self->_urlResponse MIMEType];
}

- (int64_t)statusCode
{
  return [(NSHTTPURLResponse *)self->_urlResponse statusCode];
}

- (NSString)suggestedFilename
{
  return (NSString *)[(NSHTTPURLResponse *)self->_urlResponse suggestedFilename];
}

- (NSString)textEncodingName
{
  return (NSString *)[(NSHTTPURLResponse *)self->_urlResponse textEncodingName];
}

- (NSURL)URL
{
  return (NSURL *)[(NSHTTPURLResponse *)self->_urlResponse URL];
}

- (SSURLConnectionResponse)initWithDatabaseEncoding:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  }
  else {
    v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36.receiver = self;
    v36.super_class = (Class)SSURLConnectionResponse;
    v6 = [(SSURLConnectionResponse *)&v36 init];
    if (v6)
    {
      uint64_t v7 = [v5 objectForKey:@"9"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = 0;
        v6->_urlResponse = (NSHTTPURLResponse *)(id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v35];
        if (v35)
        {
          id v8 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v8) {
            id v8 = +[SSLogConfig sharedConfig];
          }
          int v9 = [v8 shouldLog];
          if ([v8 shouldLogToDisk]) {
            int v10 = v9 | 2;
          }
          else {
            int v10 = v9;
          }
          if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
            v10 &= 2u;
          }
          if (v10)
          {
            uint64_t v11 = objc_opt_class();
            int v37 = 138543618;
            uint64_t v38 = v11;
            __int16 v39 = 2114;
            uint64_t v40 = v35;
            LODWORD(v34) = 22;
            v33 = &v37;
            uint64_t v12 = _os_log_send_and_compose_impl();
            if (v12)
            {
              v13 = (void *)v12;
              uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v37, v34);
              free(v13);
              SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, v14);
            }
          }
        }
      }
      else
      {
        uint64_t v21 = [v5 objectForKey:@"7"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
          if (v22)
          {
            uint64_t v23 = v22;
            v24 = (void *)[v5 objectForKey:@"4"];
            if (objc_opt_respondsToSelector()) {
              uint64_t v25 = [v24 integerValue];
            }
            else {
              uint64_t v25 = 0;
            }
            uint64_t v26 = [v5 objectForKey:@"2"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              uint64_t v26 = 0;
            }
            id v27 = objc_alloc(MEMORY[0x1E4F28D20]);
            v28 = (NSHTTPURLResponse *)[v27 initWithURL:v23 statusCode:v25 HTTPVersion:*MEMORY[0x1E4F18F90] headerFields:v26];
            if ([(NSHTTPURLResponse *)v28 _CFURLResponse])
            {
              [v5 objectForKey:@"3"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                CFURLResponseSetMIMEType();
              }
              v29 = (void *)[v5 objectForKey:@"1"];
              if (objc_opt_respondsToSelector())
              {
                [v29 longLongValue];
                CFURLResponseSetExpectedContentLength();
              }
            }
            v6->_urlResponse = v28;
          }
        }
      }
      v30 = objc_msgSend(v5, "objectForKey:", @"0", v33);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6->_bodyData = (NSData *)v30;
      }
      uint64_t v31 = [v5 objectForKey:@"8"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6->_metricsPageEvent = [(SSMetricsMutableEvent *)[SSMetricsPageEvent alloc] initWithBodyDictionary:v31];
      }
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (NSData)databaseEncoding
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  bodyData = self->_bodyData;
  if (bodyData) {
    [v3 setObject:bodyData forKey:@"0"];
  }
  metricsPageEvent = self->_metricsPageEvent;
  if (metricsPageEvent) {
    objc_msgSend(v4, "setObject:forKey:", -[SSMetricsMutableEvent bodyDictionary](metricsPageEvent, "bodyDictionary"), @"8");
  }
  urlResponse = self->_urlResponse;
  if (urlResponse)
  {
    uint64_t v26 = 0;
    id v8 = (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:urlResponse requiringSecureCoding:1 error:&v26];
    if (v26)
    {
      id v9 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v9) {
        id v9 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v11 &= 2u;
      }
      if (v11)
      {
        uint64_t v12 = objc_opt_class();
        int v27 = 138543618;
        uint64_t v28 = v12;
        __int16 v29 = 2114;
        uint64_t v30 = v26;
        LODWORD(v25) = 22;
        v24 = &v27;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v27, v25);
          free(v14);
          SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, v15);
        }
      }
    }
    if (objc_msgSend(v8, "length", v24)) {
      [v4 setObject:v8 forKey:@"7"];
    }
  }
  uint64_t v22 = (NSData *)[MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:0];

  return v22;
}

- (NSString)storeCorrelationID
{
  v2 = [(NSDictionary *)[(NSHTTPURLResponse *)self->_urlResponse allHeaderFields] objectForKey:@"x-apple-jingle-correlation-key"];
  if ([(NSString *)v2 length]) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_bodyData);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)[(SSMetricsMutableEvent *)self->_metricsPageEvent bodyDictionary]);
  SSXPCDictionarySetCFObject(v3, "9", (__CFString *)self->_urlResponse);
  return v3;
}

- (SSURLConnectionResponse)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSURLConnectionResponse;
    v5 = [(SSURLConnectionResponse *)&v9 init];
    if (v5)
    {
      objc_opt_class();
      v5->_bodyData = (NSData *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_metricsPageEvent = [(SSMetricsMutableEvent *)[SSMetricsPageEvent alloc] initWithBodyDictionary:v7];
      }

      xpc_object_t value = xpc_dictionary_get_value(a3, "9");
      if (value) {
        v5->_urlResponse = (NSHTTPURLResponse *)[objc_alloc(MEMORY[0x1E4F28D20]) initWithXPCEncoding:value];
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (SSMetricsPageEvent)metricsPageEvent
{
  return self->_metricsPageEvent;
}

- (void)setMetricsPageEvent:(id)a3
{
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_urlResponse;
}

@end