@interface SSLookupProperties
- (CLLocation)location;
- (NSNumber)timeoutInterval;
- (NSString)keyProfile;
- (SSLookupProperties)initWithXPCEncoding:(id)a3;
- (id)copyRequestParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)valueForRequestParameter:(id)a3;
- (int64_t)localizationStyle;
- (void)dealloc;
- (void)setKeyProfile:(id)a3;
- (void)setLocalizationStyle:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setTimeoutInterval:(id)a3;
- (void)setValue:(id)a3 forRequestParameter:(id)a4;
@end

@implementation SSLookupProperties

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSLookupProperties;
  [(SSLookupProperties *)&v3 dealloc];
}

- (id)copyRequestParameters
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  requestParameters = self->_requestParameters;
  uint64_t v5 = [(NSMutableDictionary *)requestParameters countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(requestParameters);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v10 = (void *)[(NSMutableDictionary *)self->_requestParameters objectForKey:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = (void *)[v10 componentsJoinedByString:@","];
        }
        [v3 setObject:v10 forKey:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)requestParameters countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  if (self->_location)
  {
    if (SSLookupPropertiesLoadCoreLocation_sOnce != -1) {
      dispatch_once(&SSLookupPropertiesLoadCoreLocation_sOnce, &__block_literal_global_20);
    }
    v11 = NSString;
    [(CLLocation *)self->_location coordinate];
    [v3 setObject:objc_msgSend(v11, "stringWithFormat:", @"%.4f", v12), @"lat" forKey];
    v13 = NSString;
    [(CLLocation *)self->_location coordinate];
    [v3 setObject:objc_msgSend(v13, "stringWithFormat:", @"%.4f", v14), @"lon" forKey];
  }
  return v3;
}

- (NSString)keyProfile
{
  return (NSString *)[(SSLookupProperties *)self valueForRequestParameter:@"p"];
}

- (void)setKeyProfile:(id)a3
{
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v7 = [a3 copy];
      requestParameters = self->_requestParameters;
      id v10 = (id)v7;
      if (!requestParameters)
      {
        requestParameters = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v7 = (uint64_t)v10;
        self->_requestParameters = requestParameters;
      }
      [(NSMutableDictionary *)requestParameters setObject:v7 forKey:a4];
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid parameter value: %@", a3 format];
    }
  }
  else
  {
    uint64_t v9 = self->_requestParameters;
    [(NSMutableDictionary *)v9 removeObjectForKey:a4];
  }
}

- (id)valueForRequestParameter:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_requestParameters objectForKey:a3];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init((Class)objc_opt_class());
  v5[2] = self->_localizationStyle;
  v5[1] = [(CLLocation *)self->_location copyWithZone:a3];
  v5[3] = [(NSMutableDictionary *)self->_requestParameters mutableCopyWithZone:a3];
  v5[4] = [(NSNumber *)self->_timeoutInterval copyWithZone:a3];
  return v5;
}

- (id)copyXPCEncoding
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_localizationStyle);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_requestParameters);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_timeoutInterval);
  location = self->_location;
  if (location)
  {
    uint64_t v21 = 0;
    uint64_t v5 = (__CFString *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:location requiringSecureCoding:1 error:&v21];
    if (v21)
    {
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
      if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v8 &= 2u;
      }
      if (v8)
      {
        uint64_t v9 = objc_opt_class();
        int v22 = 138543618;
        uint64_t v23 = v9;
        __int16 v24 = 2114;
        uint64_t v25 = v21;
        LODWORD(v20) = 22;
        uint64_t v10 = _os_log_send_and_compose_impl();
        if (v10)
        {
          v11 = (void *)v10;
          uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v20);
          free(v11);
          SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, v12);
        }
      }
    }
    SSXPCDictionarySetCFObject(v3, "1", v5);
  }
  return v3;
}

- (SSLookupProperties)initWithXPCEncoding:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v26.receiver = self;
    v26.super_class = (Class)SSLookupProperties;
    uint64_t v5 = [(SSLookupProperties *)&v26 init];
    if (v5)
    {
      v5->_localizationStyle = xpc_dictionary_get_int64(a3, "0");
      objc_opt_class();
      v5->_timeoutInterval = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      v5->_requestParameters = (NSMutableDictionary *)[(__CFArray *)v7 mutableCopy];

      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      if (v8)
      {
        CFArrayRef v9 = v8;
        if (SSLookupPropertiesLoadCoreLocation_sOnce != -1) {
          dispatch_once(&SSLookupPropertiesLoadCoreLocation_sOnce, &__block_literal_global_20);
        }
        uint64_t v25 = 0;
        uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
        getCLLocationClass();
        v5->_location = (CLLocation *)(id)[v10 unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v25];
        if (v25)
        {
          id v11 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v11) {
            id v11 = +[SSLogConfig sharedConfig];
          }
          int v12 = [v11 shouldLog];
          if ([v11 shouldLogToDisk]) {
            int v13 = v12 | 2;
          }
          else {
            int v13 = v12;
          }
          if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_ERROR)) {
            v13 &= 2u;
          }
          if (v13)
          {
            uint64_t v14 = objc_opt_class();
            int v27 = 138543618;
            uint64_t v28 = v14;
            __int16 v29 = 2114;
            uint64_t v30 = v25;
            LODWORD(v24) = 22;
            uint64_t v15 = _os_log_send_and_compose_impl();
            if (v15)
            {
              uint64_t v16 = (void *)v15;
              uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v27, v24);
              free(v16);
              SSFileLog(v11, @"%@", v18, v19, v20, v21, v22, v23, v17);
            }
          }
        }
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (int64_t)localizationStyle
{
  return self->_localizationStyle;
}

- (void)setLocalizationStyle:(int64_t)a3
{
  self->_localizationStyle = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSNumber)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(id)a3
{
}

@end