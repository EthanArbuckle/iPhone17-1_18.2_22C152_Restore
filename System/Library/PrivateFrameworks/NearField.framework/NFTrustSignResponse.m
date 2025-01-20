@interface NFTrustSignResponse
+ (BOOL)supportsSecureCoding;
+ (id)signResponseWithRawData:(id)a3 counterValueData:(id)a4;
- (NFTrustKey)key;
- (NFTrustSignResponse)initWithCoder:(id)a3;
- (NSData)trustObjectInternalRawNSData;
- (NSNumber)counterValue;
- (NSString)rawData;
- (void)encodeWithCoder:(id)a3;
- (void)setCounterValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setTrustObjectInternalRawNSData:(id)a3;
@end

@implementation NFTrustSignResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rawData
{
  v2 = [(NFTrustSignResponse *)self trustObjectInternalRawNSData];
  v3 = objc_msgSend(v2, "NF_asHexString");

  return (NSString *)v3;
}

- (NFTrustSignResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFTrustSignResponse;
  v5 = [(NFTrustObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trustObjectInternalRawNSData"];
    [(NFTrustSignResponse *)v5 setValue:v6 forKey:@"trustObjectInternalRawNSData"];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    [(NFTrustSignResponse *)v5 setValue:v7 forKey:@"key"];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counterValue"];
    [(NFTrustSignResponse *)v5 setValue:v8 forKey:@"counterValue"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NFTrustSignResponse *)self trustObjectInternalRawNSData];
  [v4 encodeObject:v5 forKey:@"trustObjectInternalRawNSData"];

  v6 = [(NFTrustSignResponse *)self key];
  [v4 encodeObject:v6 forKey:@"key"];

  id v7 = [(NFTrustSignResponse *)self counterValue];
  [v4 encodeObject:v7 forKey:@"counterValue"];
}

+ (id)signResponseWithRawData:(id)a3 counterValueData:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = objc_alloc((Class)a1);
    objc_super v10 = v9;
    if (v9)
    {
      [v9 setTrustObjectInternalRawNSData:v7];
      if (v8)
      {
        v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", bswap32(*(_DWORD *)objc_msgSend(v8, "bytes")));
        [v10 setCounterValue:v11];
      }
    }
  }
  else
  {
    v12 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v18 = 45;
      if (isMetaClass) {
        uint64_t v18 = 43;
      }
      v14(3, "%c[%{public}s %{public}s]:%i Could not create SignResponse with nil data", v18, ClassName, Name, 407);
    }
    dispatch_get_specific(*v12);
    v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(a1);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v25 = v21;
      __int16 v26 = 2082;
      v27 = object_getClassName(a1);
      __int16 v28 = 2082;
      v29 = sel_getName(a2);
      __int16 v30 = 1024;
      int v31 = 407;
      _os_log_impl(&dword_19D636000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create SignResponse with nil data", buf, 0x22u);
    }

    objc_super v10 = 0;
  }

  return v10;
}

- (NSNumber)counterValue
{
  return self->_counterValue;
}

- (void)setCounterValue:(id)a3
{
}

- (NFTrustKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)trustObjectInternalRawNSData
{
  return self->_trustObjectInternalRawNSData;
}

- (void)setTrustObjectInternalRawNSData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustObjectInternalRawNSData, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
}

@end