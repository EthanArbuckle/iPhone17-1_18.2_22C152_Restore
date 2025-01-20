@interface NFConnectionHandoverSelect
+ (id)selectWithRetry:(double)a3;
- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5;
- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5 userInfo:(id)a6;
- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6;
- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6 retryInMS:(id)a7 retryRandom:(id)a8;
- (NFConnectionHandoverTransportServiceValue)userInfo;
- (NSArray)transportServiceList;
- (NSNumber)retryInMS;
- (NSNumber)retryRandom;
- (NSString)applicationLabel;
- (NSString)version;
- (id)_encodeRetryError;
- (id)_encodeSelect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)encode;
- (void)setApplicationLabel:(id)a3;
- (void)setRetryInMS:(id)a3;
- (void)setRetryRandom:(id)a3;
- (void)setTransportServiceList:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation NFConnectionHandoverSelect

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5
{
  return [(NFConnectionHandoverSelect *)self initWithVersion:a3 applicationLabel:a4 serviceList:a5 userInfo:0 retryInMS:0 retryRandom:0];
}

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5 userInfo:(id)a6
{
  return [(NFConnectionHandoverSelect *)self initWithVersion:a3 applicationLabel:a4 serviceList:a5 userInfo:a6 retryInMS:0 retryRandom:0];
}

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6
{
  return [(NFConnectionHandoverSelect *)self initWithVersion:a3 applicationLabel:a4 serviceList:a5 userInfo:a6 retryInMS:0 retryRandom:0];
}

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6 retryInMS:(id)a7 retryRandom:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)NFConnectionHandoverSelect;
  v18 = [(NFConnectionHandoverSelect *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_version, a3);
    objc_storeStrong((id *)&v19->_applicationLabel, a4);
    objc_storeStrong((id *)&v19->_transportServiceList, a5);
    objc_storeStrong((id *)&v19->_userInfo, a6);
    objc_storeStrong((id *)&v19->_retryInMS, a7);
    objc_storeStrong((id *)&v19->_retryRandom, a8);
    v20 = v19;
  }

  return v19;
}

+ (id)selectWithRetry:(double)a3
{
  double v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0)
  {
    v6 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v8(6, "%c[%{public}s %{public}s]:%i Override retry to min value of %f", v11, ClassName, Name, 353, 0);
    }
    dispatch_get_specific(*v6);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v23 = v14;
      __int16 v24 = 2082;
      objc_super v25 = object_getClassName(a1);
      __int16 v26 = 2082;
      v27 = sel_getName(a2);
      __int16 v28 = 1024;
      int v29 = 353;
      __int16 v30 = 2048;
      uint64_t v31 = 0;
      _os_log_impl(&dword_19D636000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Override retry to min value of %f", buf, 0x2Cu);
    }

    double v3 = 0.0;
  }
  id v15 = objc_opt_new();
  id v16 = (void *)[objc_alloc(NSNumber) initWithInteger:(uint64_t)(v3 * 1000.0)];
  [v15 setRetryInMS:v16];

  *(_WORD *)buf = 0;
  arc4random_buf(buf, 2uLL);
  id v17 = objc_alloc(NSNumber);
  v18 = (void *)[v17 initWithUnsignedShort:*(unsigned __int16 *)buf];
  [v15 setRetryRandom:v18];

  return v15;
}

- (id)encode
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (CBORLibraryLibraryCore_0())
  {
    uint64_t v4 = [(NFConnectionHandoverSelect *)self retryInMS];
    if (v4
      && (v5 = (void *)v4,
          [(NFConnectionHandoverSelect *)self retryRandom],
          v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      v7 = [(NFConnectionHandoverSelect *)self _encodeRetryError];
    }
    else
    {
      v7 = [(NFConnectionHandoverSelect *)self _encodeSelect];
    }
  }
  else
  {
    v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i CBOR library unavailable", v14, ClassName, Name, 370);
    }
    dispatch_get_specific(*v8);
    id v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v21 = v17;
      __int16 v22 = 2082;
      int v23 = object_getClassName(self);
      __int16 v24 = 2082;
      objc_super v25 = sel_getName(a2);
      __int16 v26 = 1024;
      int v27 = 370;
      _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i CBOR library unavailable", buf, 0x22u);
    }

    v7 = 0;
  }
  return v7;
}

- (id)_encodeSelect
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v3 = [(NFConnectionHandoverSelect *)self transportServiceList];
  int v4 = _NFCHValidateTransportServiceList(v3);

  if (v4)
  {
    v5 = objc_opt_new();
    id CBORClass_0 = getCBORClass_0();
    v7 = [(NFConnectionHandoverSelect *)self version];
    v8 = [CBORClass_0 cborWithUTF8String:v7];
    v9 = [getCBORClass_0() cborWithInteger:0];
    [v5 setObject:v8 forKey:v9];

    id v10 = getCBORClass_0();
    uint64_t v11 = [(NFConnectionHandoverSelect *)self applicationLabel];
    v12 = [v10 cborWithUTF8String:v11];
    v13 = [getCBORClass_0() cborWithInteger:1];
    [v5 setObject:v12 forKey:v13];

    uint64_t v14 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = [(NFConnectionHandoverSelect *)self transportServiceList];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v30 + 1) + 8 * i) encodeToCBOR];
          if (v20) {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }

    int v21 = [getCBORClass_0() cborWithArray:v14];
    __int16 v22 = [getCBORClass_0() cborWithInteger:2];
    [v5 setObject:v21 forKey:v22];

    userInfo = self->_userInfo;
    if (userInfo && IsValueCBOREncodable(userInfo))
    {
      __int16 v24 = [(NFConnectionHandoverTransportServiceValue *)self->_userInfo encodeToCBOR];
      objc_super v25 = [getCBORClass_0() cborWithInteger:3];
      [v5 setObject:v24 forKey:v25];
    }
    __int16 v26 = [getCBORClass_0() cborWithDictionary:v5];
    int v27 = [MEMORY[0x1E4F1C9B8] dataWithCBOR:v26];
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v27];
    [v28 appendBytes:&SW_STATUS_SUCCESS length:2];
  }
  else
  {
    uint64_t v28 = 0;
  }
  return v28;
}

- (id)_encodeRetryError
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v4 = [getCBORClass_0() cborWithInteger:1];
  id CBORClass_0 = getCBORClass_0();
  v6 = [(NFConnectionHandoverSelect *)self retryInMS];
  v7 = objc_msgSend(CBORClass_0, "cborWithInteger:", objc_msgSend(v6, "integerValue"));
  [v3 setObject:v7 forKeyedSubscript:v4];

  v8 = [getCBORClass_0() cborWithInteger:2];
  id v9 = getCBORClass_0();
  id v10 = [(NFConnectionHandoverSelect *)self retryRandom];
  uint64_t v11 = objc_msgSend(v9, "cborWithUnsignedInteger:", objc_msgSend(v10, "unsignedShortValue"));
  [v3 setObject:v11 forKeyedSubscript:v8];

  v12 = [getCBORClass_0() cborWithDictionary:v3];
  v13 = [MEMORY[0x1E4F1C9B8] dataWithCBOR:v12];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v13];
  [v14 appendBytes:&SW_STATUS_DATA_NOT_FOUND length:2];

  return v14;
}

- (id)debugDescription
{
  id v3 = [(NFConnectionHandoverSelect *)self retryInMS];
  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = [(NFConnectionHandoverSelect *)self retryInMS];
    v6 = (__CFString *)[v4 initWithFormat:@", retryInMS=%@", v5];
  }
  else
  {
    v6 = &stru_1EEF24A78;
  }

  v7 = [(NFConnectionHandoverSelect *)self retryRandom];
  if (v7)
  {
    id v8 = [NSString alloc];
    id v9 = [(NFConnectionHandoverSelect *)self retryRandom];
    id v10 = (__CFString *)[v8 initWithFormat:@", retryRandom=%@", v9];
  }
  else
  {
    id v10 = &stru_1EEF24A78;
  }

  id v11 = [NSString alloc];
  v12 = [(NFConnectionHandoverSelect *)self version];
  v13 = [(NFConnectionHandoverSelect *)self applicationLabel];
  uint64_t v14 = [(NFConnectionHandoverSelect *)self transportServiceList];
  id v15 = [(NFConnectionHandoverSelect *)self userInfo];
  uint64_t v16 = (void *)[v11 initWithFormat:@"{version=%@, appLabel=%@, transportServices=%@, userInfo=%@%@%@}", v12, v13, v14, v15, v6, v10];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NFConnectionHandoverSelect alloc];
  v5 = [(NFConnectionHandoverSelect *)self version];
  v6 = [(NFConnectionHandoverSelect *)self applicationLabel];
  v7 = [(NFConnectionHandoverSelect *)self transportServiceList];
  id v8 = [(NFConnectionHandoverSelect *)self userInfo];
  id v9 = [(NFConnectionHandoverSelect *)self retryInMS];
  id v10 = [(NFConnectionHandoverSelect *)self retryRandom];
  id v11 = [(NFConnectionHandoverSelect *)v4 initWithVersion:v5 applicationLabel:v6 serviceList:v7 userInfo:v8 retryInMS:v9 retryRandom:v10];

  return v11;
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

- (NSNumber)retryInMS
{
  return self->_retryInMS;
}

- (void)setRetryInMS:(id)a3
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
  objc_storeStrong((id *)&self->_retryInMS, 0);
  objc_storeStrong((id *)&self->_transportServiceList, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end