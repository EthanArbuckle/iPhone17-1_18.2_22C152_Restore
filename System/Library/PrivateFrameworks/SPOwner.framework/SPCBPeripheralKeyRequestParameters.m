@interface SPCBPeripheralKeyRequestParameters
+ (BOOL)supportsSecureCoding;
- (NSArray)vendorIdentifierList;
- (SPCBPeripheralKeyRequestParameters)initWithCoder:(id)a3;
- (SPCBPeripheralKeyRequestParameters)initWithSessionKey:(id)a3 vendorIdentifierList:(id)a4;
- (SPCBPeripheralManagerSessionKey)sessionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPCBPeripheralKeyRequestParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyRequestParameters)initWithSessionKey:(id)a3 vendorIdentifierList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralKeyRequestParameters;
  v8 = [(SPCBPeripheralKeyRequestParameters *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sessionKey = v8->_sessionKey;
    v8->_sessionKey = (SPCBPeripheralManagerSessionKey *)v9;

    uint64_t v11 = [v7 copy];
    vendorIdentifierList = v8->_vendorIdentifierList;
    v8->_vendorIdentifierList = (NSArray *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPCBPeripheralKeyRequestParameters alloc];
  v5 = [(SPCBPeripheralKeyRequestParameters *)self sessionKey];
  id v6 = [(SPCBPeripheralKeyRequestParameters *)self vendorIdentifierList];
  id v7 = [(SPCBPeripheralKeyRequestParameters *)v4 initWithSessionKey:v5 vendorIdentifierList:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPCBPeripheralKeyRequestParameters *)self sessionKey];
  [v4 encodeObject:v5 forKey:@"sessionKey"];

  id v6 = [(SPCBPeripheralKeyRequestParameters *)self vendorIdentifierList];
  [v4 encodeObject:v6 forKey:@"vendorIdentifierList"];
}

- (SPCBPeripheralKeyRequestParameters)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionKey"];
  sessionKey = self->_sessionKey;
  self->_sessionKey = v5;

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"vendorIdentifierList"];

  vendorIdentifierList = self->_vendorIdentifierList;
  self->_vendorIdentifierList = v10;

  return self;
}

- (SPCBPeripheralManagerSessionKey)sessionKey
{
  return self->_sessionKey;
}

- (NSArray)vendorIdentifierList
{
  return self->_vendorIdentifierList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifierList, 0);

  objc_storeStrong((id *)&self->_sessionKey, 0);
}

@end