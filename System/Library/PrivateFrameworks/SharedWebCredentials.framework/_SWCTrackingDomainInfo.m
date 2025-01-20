@interface _SWCTrackingDomainInfo
+ (BOOL)supportsSecureCoding;
+ (NSDate)lastDatabaseUpdate;
+ (OS_dispatch_queue)_queue;
+ (id)_trackingDomainInfoWithDomain:(id)a3 JSONObject:(id)a4;
+ (id)_trackingDomainInfoWithDomain:(id)a3 JSONObject:(id)a4 expectedSources:(unint64_t)a5;
+ (id)_trackingDomainInfoWithDomains:(id)a3;
+ (id)_trackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4;
+ (id)new;
+ (id)trackingDomainInfoWithDomains:(id)a3;
+ (void)_getTrackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5;
+ (void)getTrackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4 completion:(id)a5;
- (BOOL)canBlockRequest;
- (NSString)domain;
- (NSString)ownerDisplayName;
- (NSString)ownerName;
- (_SWCTrackingDomainInfo)init;
- (_SWCTrackingDomainInfo)initWithCoder:(id)a3;
- (id)_initWithDomain:(id)a3 JSONObject:(id)a4;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SWCTrackingDomainInfo

+ (void)_getTrackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86___SWCTrackingDomainInfo__getTrackingDomainInfoWithDomains_sources_completionHandler___block_invoke;
  v13[3] = &unk_1E5E51D18;
  id v16 = a1;
  unint64_t v17 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

+ (OS_dispatch_queue)_queue
{
  if (qword_1EB67B1A8 != -1) {
    dispatch_once(&qword_1EB67B1A8, &__block_literal_global_86);
  }
  v2 = (void *)_MergedGlobals_6;
  return (OS_dispatch_queue *)v2;
}

+ (id)_trackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v6 = _SWCGetBundle();
  v25 = v6;
  if (v6)
  {
    v24 = [v6 URLForResource:@"trackingdomains" withExtension:@"json"];
    if (v24)
    {
      id v37 = 0;
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v24 options:1 error:&v37];
      id v8 = v37;
      v22 = (void *)v7;
      if (v7)
      {
        id v36 = v8;
        id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v36];
        id v23 = v36;

        if (v9)
        {
          if (v26)
          {
            id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v26, "count"));
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v10 = v26;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v33;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v33 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                  id v15 = [v9 objectForKeyedSubscript:v14];
                  if (v15)
                  {
                    id v16 = [a1 _trackingDomainInfoWithDomain:v14 JSONObject:v15 expectedSources:a4];
                    [v27 setObject:v16 forKeyedSubscript:v14];
                  }
                }
                uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v11);
            }
          }
          else
          {
            v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __65___SWCTrackingDomainInfo__trackingDomainInfoWithDomains_sources___block_invoke;
            v28[3] = &unk_1E5E51CF0;
            id v27 = v19;
            id v29 = v27;
            id v30 = a1;
            unint64_t v31 = a4;
            [v9 enumerateKeysAndObjectsUsingBlock:v28];
          }
        }
        else
        {
          if (qword_1EB67B1B8 != -1) {
            dispatch_once(&qword_1EB67B1B8, &__block_literal_global_93);
          }
          v18 = qword_1EB67B1B0;
          if (os_log_type_enabled((os_log_t)qword_1EB67B1B0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v23;
            _os_log_error_impl(&dword_1ABCD7000, v18, OS_LOG_TYPE_ERROR, "Failed to read tracking domains JSON file: %@", buf, 0xCu);
          }
          id v27 = 0;
        }
      }
      else
      {
        if (qword_1EB67B1B8 != -1) {
          dispatch_once(&qword_1EB67B1B8, &__block_literal_global_93);
        }
        unint64_t v17 = qword_1EB67B1B0;
        if (os_log_type_enabled((os_log_t)qword_1EB67B1B0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v8;
          _os_log_error_impl(&dword_1ABCD7000, v17, OS_LOG_TYPE_ERROR, "Failed to find tracking domains JSON file: %@", buf, 0xCu);
        }
        id v27 = 0;
        id v23 = v8;
      }
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }

  v20 = (void *)[v27 copy];
  return v20;
}

+ (void)getTrackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (qword_1EB67B1B8 != -1) {
    dispatch_once(&qword_1EB67B1B8, &__block_literal_global_93);
  }
  id v9 = (id)qword_1EB67B1B0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = getpid();
    _os_log_impl(&dword_1ABCD7000, v9, OS_LOG_TYPE_INFO, "Process %llu is getting tracking domain info out-of-process", buf, 0xCu);
  }

  id v10 = _SWCGetServerConnection();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78___SWCTrackingDomainInfo_getTrackingDomainInfoWithDomains_sources_completion___block_invoke;
  v16[3] = &unk_1E5E51B80;
  id v11 = v8;
  id v17 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78___SWCTrackingDomainInfo_getTrackingDomainInfoWithDomains_sources_completion___block_invoke_2;
  v14[3] = &unk_1E5E51CC8;
  id v13 = v11;
  id v15 = v13;
  [v12 getTrackingDomains:v7 sources:a4 completionHandler:v14];
}

+ (NSDate)lastDatabaseUpdate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1667849750.0];
}

+ (id)new
{
}

- (_SWCTrackingDomainInfo)init
{
}

+ (id)trackingDomainInfoWithDomains:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  if (qword_1EB67B1B8 != -1) {
    dispatch_once(&qword_1EB67B1B8, &__block_literal_global_93);
  }
  v4 = (id)qword_1EB67B1B0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    pid_t v10 = getpid();
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v10;
    _os_log_debug_impl(&dword_1ABCD7000, v4, OS_LOG_TYPE_DEBUG, "Process %llu is getting tracking domain info out-of-process", buf, 0xCu);
  }

  v5 = _SWCGetServerConnection();
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56___SWCTrackingDomainInfo_trackingDomainInfoWithDomains___block_invoke_2;
  v11[3] = &unk_1E5E51CA0;
  v11[4] = &v12;
  [v6 getTrackingDomains:v3 sources:3 completionHandler:v11];

  id v7 = (void *)v13[5];
  if (!v7)
  {
    v13[5] = MEMORY[0x1E4F1CC08];
    id v7 = (void *)v13[5];
  }
  id v8 = v7;
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (NSString)ownerName
{
  return (NSString *)[(NSDictionary *)self->_JSONObject objectForKeyedSubscript:@"n"];
}

- (NSString)ownerDisplayName
{
  return (NSString *)[(NSDictionary *)self->_JSONObject objectForKeyedSubscript:@"dn"];
}

- (unint64_t)source
{
  v2 = [(NSDictionary *)self->_JSONObject objectForKeyedSubscript:@"s"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)canBlockRequest
{
  v2 = [(NSDictionary *)self->_JSONObject objectForKeyedSubscript:@"dnbr"];
  char v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

+ (id)_trackingDomainInfoWithDomain:(id)a3 JSONObject:(id)a4
{
  v4 = [a1 _trackingDomainInfoWithDomain:a3 JSONObject:a4 expectedSources:3];
  return v4;
}

+ (id)_trackingDomainInfoWithDomain:(id)a3 JSONObject:(id)a4 expectedSources:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1AD1157F0]();
  if (_NSIsNSDictionary())
  {
    id v10 = [[_SWCTrackingDomainInfo alloc] _initWithDomain:v7 JSONObject:v8];
    if (([v10 source] & a5) != 0)
    {
      id v11 = v10;
      goto LABEL_6;
    }
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

+ (id)_trackingDomainInfoWithDomains:(id)a3
{
  char v3 = [a1 _trackingDomainInfoWithDomains:a3 sources:3];
  return v3;
}

- (id)_initWithDomain:(id)a3 JSONObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SWCTrackingDomainInfo;
  id v8 = [(_SWCTrackingDomainInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    JSONObject = v8->_JSONObject;
    v8->_JSONObject = (NSDictionary *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_domain forKey:@"domain"];
  [v4 encodeObject:self->_JSONObject forKey:@"JSONObject"];
}

- (_SWCTrackingDomainInfo)initWithCoder:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SWCTrackingDomainInfo;
  v5 = [(_SWCTrackingDomainInfo *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
    id v8 = (void *)[v6 initWithArray:v7];

    uint64_t v9 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"domain");
    domain = v5->_domain;
    v5->_domain = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "swc_decodeObjectOfClasses:forKey:", v8, @"JSONObject");
    JSONObject = v5->_JSONObject;
    v5->_JSONObject = (NSDictionary *)v11;
  }
  return v5;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONObject, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end