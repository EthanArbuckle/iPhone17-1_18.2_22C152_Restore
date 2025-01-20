@interface NFConnectionHandoverRequest
- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5;
- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5 userInfo:(id)a6;
- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6;
- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6 retryRandom:(id)a7;
- (NFConnectionHandoverTransportServiceValue)userInfo;
- (NSArray)transportServiceList;
- (NSNumber)retryRandom;
- (NSString)applicationLabel;
- (NSString)version;
- (id)_encodeRequest;
- (id)_encodeRequestRetry;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)encode;
- (void)setApplicationLabel:(id)a3;
- (void)setRetryRandom:(id)a3;
- (void)setTransportServiceList:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation NFConnectionHandoverRequest

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5
{
  return [(NFConnectionHandoverRequest *)self initWithVersion:a3 applicationLabel:a4 serviceList:a5 userInfo:0 retryRandom:0];
}

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5 userInfo:(id)a6
{
  return [(NFConnectionHandoverRequest *)self initWithVersion:a3 applicationLabel:a4 serviceList:a5 userInfo:a6 retryRandom:0];
}

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6
{
  return [(NFConnectionHandoverRequest *)self initWithVersion:a3 applicationLabel:a4 serviceList:a5 userInfo:a6 retryRandom:0];
}

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6 retryRandom:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)NFConnectionHandoverRequest;
  v17 = [(NFConnectionHandoverRequest *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_version, a3);
    objc_storeStrong((id *)&v18->_applicationLabel, a4);
    objc_storeStrong((id *)&v18->_transportServiceList, a5);
    objc_storeStrong((id *)&v18->_userInfo, a6);
    objc_storeStrong((id *)&v18->_retryRandom, a7);
    v19 = v18;
  }

  return v18;
}

- (id)encode
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (CBORLibraryLibraryCore_0())
  {
    v4 = [(NFConnectionHandoverRequest *)self retryRandom];

    if (v4) {
      [(NFConnectionHandoverRequest *)self _encodeRequestRetry];
    }
    else {
    v5 = [(NFConnectionHandoverRequest *)self _encodeRequest];
    }
    v17 = v5;
    if (v5)
    {
      BOOL v18 = (unint64_t)[v5 length] > 0xFF;
      v19 = (void *)MEMORY[0x1E4FBA850];
      uint64_t v20 = [v17 length];
      if (v4) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = 3;
      }
      id v16 = [v19 buildAPDUHeaderWithClass:0 instruction:202 p1:1 p2:v21 len:v20 useExtendedLength:v18];
      [v16 appendData:v17];
      id v22 = (id)[MEMORY[0x1E4FBA850] appendExpectedLength:0 usingExtendedLength:v18 toAPDU:v16];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i CBOR library unavailable", v12, ClassName, Name, 177);
    }
    dispatch_get_specific(*v6);
    id v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v15;
      __int16 v27 = 2082;
      v28 = object_getClassName(self);
      __int16 v29 = 2082;
      v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 177;
      _os_log_impl(&dword_19D636000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i CBOR library unavailable", buf, 0x22u);
    }

    id v16 = 0;
  }
  return v16;
}

- (id)_encodeRequest
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(NFConnectionHandoverRequest *)self transportServiceList];
  int v4 = _NFCHValidateTransportServiceList(v3);

  if (v4)
  {
    v5 = objc_opt_new();
    id CBORClass_0 = getCBORClass_0();
    v7 = [(NFConnectionHandoverRequest *)self version];
    v8 = [CBORClass_0 cborWithUTF8String:v7];
    v9 = [getCBORClass_0() cborWithInteger:0];
    [v5 setObject:v8 forKey:v9];

    id v10 = getCBORClass_0();
    v11 = [(NFConnectionHandoverRequest *)self applicationLabel];
    uint64_t v12 = [v10 cborWithUTF8String:v11];
    id v13 = [getCBORClass_0() cborWithInteger:1];
    [v5 setObject:v12 forKey:v13];

    id v14 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    int v15 = [(NFConnectionHandoverRequest *)self transportServiceList];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(*((void *)&v29 + 1) + 8 * i) encodeToCBOR];
          if (v20) {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }

    uint64_t v21 = [getCBORClass_0() cborWithArray:v14];
    id v22 = [getCBORClass_0() cborWithInteger:2];
    [v5 setObject:v21 forKey:v22];

    userInfo = self->_userInfo;
    if (userInfo && IsValueCBOREncodable(userInfo))
    {
      v24 = [(NFConnectionHandoverTransportServiceValue *)self->_userInfo encodeToCBOR];
      v25 = [getCBORClass_0() cborWithInteger:3];
      [v5 setObject:v24 forKey:v25];
    }
    int v26 = [getCBORClass_0() cborWithDictionary:v5];
    __int16 v27 = [MEMORY[0x1E4F1C9B8] dataWithCBOR:v26];
  }
  else
  {
    __int16 v27 = 0;
  }
  return v27;
}

- (id)_encodeRequestRetry
{
  v3 = objc_opt_new();
  id CBORClass_0 = getCBORClass_0();
  v5 = [(NFConnectionHandoverRequest *)self version];
  v6 = [CBORClass_0 cborWithUTF8String:v5];
  v7 = [getCBORClass_0() cborWithInteger:0];
  [v3 setObject:v6 forKey:v7];

  id v8 = getCBORClass_0();
  v9 = [(NFConnectionHandoverRequest *)self retryRandom];
  id v10 = objc_msgSend(v8, "cborWithUnsignedInteger:", objc_msgSend(v9, "unsignedShortValue"));
  v11 = [getCBORClass_0() cborWithInteger:4];
  [v3 setObject:v10 forKey:v11];

  uint64_t v12 = [getCBORClass_0() cborWithDictionary:v3];
  id v13 = [MEMORY[0x1E4F1C9B8] dataWithCBOR:v12];

  return v13;
}

- (id)debugDescription
{
  v3 = [(NFConnectionHandoverRequest *)self retryRandom];
  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = [(NFConnectionHandoverRequest *)self retryRandom];
    v6 = (__CFString *)[v4 initWithFormat:@", retryRandom=%@", v5];
  }
  else
  {
    v6 = &stru_1EEF24A78;
  }

  id v7 = [NSString alloc];
  id v8 = [(NFConnectionHandoverRequest *)self version];
  v9 = [(NFConnectionHandoverRequest *)self applicationLabel];
  id v10 = [(NFConnectionHandoverRequest *)self transportServiceList];
  v11 = [(NFConnectionHandoverRequest *)self userInfo];
  uint64_t v12 = (void *)[v7 initWithFormat:@"{version=%@, appLabel=%@, transportServices=%@, userInfo=%@%@}", v8, v9, v10, v11, v6];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NFConnectionHandoverRequest alloc];
  v5 = [(NFConnectionHandoverRequest *)self version];
  v6 = [(NFConnectionHandoverRequest *)self applicationLabel];
  id v7 = [(NFConnectionHandoverRequest *)self transportServiceList];
  id v8 = [(NFConnectionHandoverRequest *)self userInfo];
  v9 = [(NFConnectionHandoverRequest *)self retryRandom];
  id v10 = [(NFConnectionHandoverRequest *)v4 initWithVersion:v5 applicationLabel:v6 serviceList:v7 userInfo:v8 retryRandom:v9];

  return v10;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (void)setApplicationLabel:(id)a3
{
}

- (NFConnectionHandoverTransportServiceValue)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSArray)transportServiceList
{
  return self->_transportServiceList;
}

- (void)setTransportServiceList:(id)a3
{
}

- (NSNumber)retryRandom
{
  return self->_retryRandom;
}

- (void)setRetryRandom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryRandom, 0);
  objc_storeStrong((id *)&self->_transportServiceList, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end