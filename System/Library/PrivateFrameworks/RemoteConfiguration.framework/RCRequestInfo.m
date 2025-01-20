@interface RCRequestInfo
- (BOOL)isEqual:(id)a3;
- (NSArray)additionalChangeTags;
- (NSDictionary)allAdditionalFields;
- (NSMutableDictionary)mutableAdditionalFields;
- (NSString)requestCacheKey;
- (NSString)requestKey;
- (NSString)responseKey;
- (NSURL)fallbackURL;
- (RCCachePolicy)cachePolicy;
- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5;
- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7;
- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestCacheKey:(id)a8;
- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestCacheKey:(id)a8 cachePolicy:(id)a9;
- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestFeedType:(unint64_t)a8;
- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestFeedType:(unint64_t)a8 cachePolicy:(id)a9;
- (RCUnfairLock)accessLock;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requestType;
- (void)setAccessLock:(id)a3;
- (void)setValue:(id)a3 forAdditionalField:(id)a4;
@end

@implementation RCRequestInfo

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestCacheKey:(id)a8
{
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = +[RCCachePolicy defaultCachePolicy];
  v18 = [(RCRequestInfo *)self initWithRequestKey:v16 responseKey:v15 fallbackURL:v14 requestType:a6 additionalChangeTags:v13 requestCacheKey:v16 cachePolicy:v17];

  return v18;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestFeedType:(unint64_t)a8 cachePolicy:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCRequestInfo(News) initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:]();
    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCRequestInfo(News) initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:]();
  }
LABEL_6:
  if (a8 == 1)
  {
    v20 = @"premium";
  }
  else
  {
    if (a8 != 2)
    {
      id v21 = v15;
      v20 = 0;
      int v22 = 0;
      goto LABEL_12;
    }
    v20 = @"premium_lite";
  }
  id v21 = [NSString stringWithFormat:@"%@-%@", v15, v20];
  int v22 = 1;
LABEL_12:
  v23 = [(RCRequestInfo *)self initWithRequestKey:v15 responseKey:v16 fallbackURL:v17 requestType:a6 additionalChangeTags:v18 requestCacheKey:v21 cachePolicy:v19];
  v24 = v23;
  if (v22 && v23) {
    [(RCRequestInfo *)v23 setValue:v20 forAdditionalField:@"feedType"];
  }

  return v24;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7
{
  return [(RCRequestInfo *)self initWithRequestKey:a3 responseKey:a4 fallbackURL:a5 requestType:a6 additionalChangeTags:a7 requestCacheKey:a3];
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5
{
  return [(RCRequestInfo *)self initWithRequestKey:a3 responseKey:a4 fallbackURL:a5 requestType:0 additionalChangeTags:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_mutableAdditionalFields, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_requestCacheKey, 0);
  objc_storeStrong((id *)&self->_additionalChangeTags, 0);
  objc_storeStrong((id *)&self->_fallbackURL, 0);
  objc_storeStrong((id *)&self->_responseKey, 0);

  objc_storeStrong((id *)&self->_requestKey, 0);
}

- (NSURL)fallbackURL
{
  return self->_fallbackURL;
}

- (RCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (NSString)requestCacheKey
{
  return self->_requestCacheKey;
}

- (NSString)requestKey
{
  return self->_requestKey;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestCacheKey:(id)a8 cachePolicy:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:]();
    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:]();
  }
LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)RCRequestInfo;
  id v21 = [(RCRequestInfo *)&v39 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    requestKey = v21->_requestKey;
    v21->_requestKey = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    responseKey = v21->_responseKey;
    v21->_responseKey = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    fallbackURL = v21->_fallbackURL;
    v21->_fallbackURL = (NSURL *)v26;

    v21->_requestType = a6;
    uint64_t v28 = [v18 copy];
    additionalChangeTags = v21->_additionalChangeTags;
    v21->_additionalChangeTags = (NSArray *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableAdditionalFields = v21->_mutableAdditionalFields;
    v21->_mutableAdditionalFields = (NSMutableDictionary *)v30;

    uint64_t v32 = [v19 copy];
    requestCacheKey = v21->_requestCacheKey;
    v21->_requestCacheKey = (NSString *)v32;

    uint64_t v34 = [v20 copy];
    cachePolicy = v21->_cachePolicy;
    v21->_cachePolicy = (RCCachePolicy *)v34;

    v36 = objc_alloc_init(RCUnfairLock);
    accessLock = v21->_accessLock;
    v21->_accessLock = v36;
  }
  return v21;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestFeedType:(unint64_t)a8
{
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = +[RCCachePolicy defaultCachePolicy];
  id v19 = [(RCRequestInfo *)self initWithRequestKey:v17 responseKey:v16 fallbackURL:v15 requestType:a6 additionalChangeTags:v14 requestFeedType:a8 cachePolicy:v18];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(RCRequestInfo *)self requestKey];
    v7 = [v5 requestKey];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(RCRequestInfo *)self responseKey];
      v9 = [v5 responseKey];
      if ([v8 isEqualToString:v9])
      {
        v10 = [(RCRequestInfo *)self fallbackURL];
        v11 = [v5 fallbackURL];
        if ([v10 isEqual:v11]
          && (unint64_t v12 = -[RCRequestInfo requestType](self, "requestType"), v12 == [v5 requestType]))
        {
          uint64_t v28 = (void *)MEMORY[0x1E4FBA8A8];
          uint64_t v13 = [(RCRequestInfo *)self additionalChangeTags];
          uint64_t v14 = [v5 additionalChangeTags];
          id v15 = v28;
          v27 = (void *)v14;
          v29 = (void *)v13;
          if (objc_msgSend(v15, "rc_object:isEqualToObject:", v13))
          {
            uint64_t v16 = [(RCRequestInfo *)self requestCacheKey];
            id v17 = [v5 requestCacheKey];
            uint64_t v26 = (void *)v16;
            if ((void *)v16 == v17)
            {
              id v25 = v17;
              id v19 = [(RCRequestInfo *)self allAdditionalFields];
              uint64_t v24 = [v5 allAdditionalFields];
              if (objc_msgSend(v19, "isEqualToDictionary:"))
              {
                uint64_t v22 = [(RCRequestInfo *)self cachePolicy];
                [v5 cachePolicy];
                id v20 = v23 = v19;
                char v18 = [v22 isEqual:v20];

                id v19 = v23;
              }
              else
              {
                char v18 = 0;
              }

              id v17 = v25;
            }
            else
            {
              char v18 = 0;
            }
          }
          else
          {
            char v18 = 0;
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [(RCRequestInfo *)self requestKey];
  uint64_t v4 = [v3 hash];
  id v5 = [(RCRequestInfo *)self responseKey];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RCRequestInfo *)self fallbackURL];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCRequestInfo requestType](self, "requestType"));
  uint64_t v10 = [v9 hash];
  v11 = [(RCRequestInfo *)self additionalChangeTags];
  uint64_t v12 = v8 ^ [v11 hash];
  uint64_t v13 = [(RCRequestInfo *)self requestCacheKey];
  uint64_t v14 = v12 ^ [v13 hash];
  id v15 = [(RCRequestInfo *)self allAdditionalFields];
  uint64_t v16 = v14 ^ [v15 hash] ^ v10;
  id v17 = [(RCRequestInfo *)self cachePolicy];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (id)description
{
  uint64_t v14 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(RCRequestInfo *)self requestKey];
  id v5 = [(RCRequestInfo *)self responseKey];
  uint64_t v6 = [(RCRequestInfo *)self fallbackURL];
  unint64_t v7 = [(RCRequestInfo *)self requestType];
  uint64_t v8 = [(RCRequestInfo *)self additionalChangeTags];
  v9 = [(RCRequestInfo *)self requestCacheKey];
  uint64_t v10 = [(RCRequestInfo *)self allAdditionalFields];
  v11 = [(RCRequestInfo *)self cachePolicy];
  objc_msgSend(v14, "stringWithFormat:", @"<%@: %p; requestKey: %@ responseKey: %@ fallbackURL: %@ requestType: %lu, additionalChangeTags: %@, cacheKey: %@, additionalFields: %@ cachePolicy: %@>",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  uint64_t v12 = v11);

  return v12;
}

- (void)setValue:(id)a3 forAdditionalField:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RCRequestInfo *)self accessLock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__RCRequestInfo_setValue_forAdditionalField___block_invoke;
  v11[3] = &unk_1E5B76C88;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performWithLockSync:v11];
}

void __45__RCRequestInfo_setValue_forAdditionalField___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) mutableAdditionalFields];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = v3;
  if (v2) {
    [v3 setObject:v2 forKeyedSubscript:v4];
  }
  else {
    [v3 removeObjectForKey:v4];
  }
}

- (NSDictionary)allAdditionalFields
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  uint64_t v3 = [(RCRequestInfo *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__RCRequestInfo_allAdditionalFields__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithLockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __36__RCRequestInfo_allAdditionalFields__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mutableAdditionalFields];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)responseKey
{
  return self->_responseKey;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (NSArray)additionalChangeTags
{
  return self->_additionalChangeTags;
}

- (NSMutableDictionary)mutableAdditionalFields
{
  return self->_mutableAdditionalFields;
}

- (RCUnfairLock)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(id)a3
{
}

- (void)initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "responseKey");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCRequestInfo.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "requestKey");
  *(_DWORD *)buf = 136315906;
  uint64_t v2 = "-[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCRequestInfo.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end