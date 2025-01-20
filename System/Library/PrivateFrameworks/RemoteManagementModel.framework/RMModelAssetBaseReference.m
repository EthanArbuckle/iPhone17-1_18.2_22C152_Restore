@interface RMModelAssetBaseReference
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithDataURL:(id)a3;
+ (id)buildWithDataURL:(id)a3 contentType:(id)a4 size:(id)a5 hashSHA256:(id)a6;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadSize;
- (NSString)payloadContentType;
- (NSString)payloadDataURL;
- (NSString)payloadHashSHA256;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setPayloadContentType:(id)a3;
- (void)setPayloadDataURL:(id)a3;
- (void)setPayloadHashSHA256:(id)a3;
- (void)setPayloadSize:(id)a3;
@end

@implementation RMModelAssetBaseReference

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DataURL";
  v6[1] = @"ContentType";
  v6[2] = @"Size";
  v6[3] = @"Hash-SHA-256";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithDataURL:(id)a3 contentType:(id)a4 size:(id)a5 hashSHA256:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadDataURL:v12];

  [v13 setPayloadContentType:v11];
  [v13 setPayloadSize:v10];

  [v13 setPayloadHashSHA256:v9];
  return v13;
}

+ (id)buildRequiredOnlyWithDataURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadDataURL:v3];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];

  id v11 = +[RMModelAssetBaseReference allowedPayloadKeys];
  [v10 minusSet:v11];

  id v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"DataURL" forKeyPath:@"payloadDataURL" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"ContentType" forKeyPath:@"payloadContentType" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"Size" forKeyPath:@"payloadSize" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Hash-SHA-256" forKeyPath:@"payloadHashSHA256" isRequired:0 defaultValue:0 error:a5];
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(RMModelAssetBaseReference *)self payloadDataURL];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"DataURL" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelAssetBaseReference *)self payloadContentType];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"ContentType" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelAssetBaseReference *)self payloadSize];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"Size" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelAssetBaseReference *)self payloadHashSHA256];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Hash-SHA-256" value:v8 isRequired:0 defaultValue:0];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RMModelAssetBaseReference;
  v4 = [(RMModelPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDataURL copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadContentType copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadSize copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadHashSHA256 copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadDataURL
{
  return self->_payloadDataURL;
}

- (void)setPayloadDataURL:(id)a3
{
}

- (NSString)payloadContentType
{
  return self->_payloadContentType;
}

- (void)setPayloadContentType:(id)a3
{
}

- (NSNumber)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(id)a3
{
}

- (NSString)payloadHashSHA256
{
  return self->_payloadHashSHA256;
}

- (void)setPayloadHashSHA256:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadHashSHA256, 0);
  objc_storeStrong((id *)&self->_payloadSize, 0);
  objc_storeStrong((id *)&self->_payloadContentType, 0);
  objc_storeStrong((id *)&self->_payloadDataURL, 0);
}

@end