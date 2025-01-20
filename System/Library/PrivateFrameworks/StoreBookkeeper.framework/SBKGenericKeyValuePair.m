@interface SBKGenericKeyValuePair
+ (BOOL)supportsSecureCoding;
+ (id)pairWithKVSKey:(id)a3 kvsPayload:(id)a4;
- (NSData)kvsPayload;
- (NSString)kvsKey;
- (SBKGenericKeyValuePair)initWithCoder:(id)a3;
- (SBKGenericKeyValuePair)initWithKVSKey:(id)a3 kvsPayload:(id)a4;
- (double)timestamp;
- (id)kvsValueDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBKGenericKeyValuePair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvsPayload, 0);
  objc_storeStrong((id *)&self->_kvsKey, 0);
}

- (NSData)kvsPayload
{
  return self->_kvsPayload;
}

- (NSString)kvsKey
{
  return self->_kvsKey;
}

- (double)timestamp
{
  return 0.0;
}

- (id)kvsValueDescription
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SBKGenericKeyValuePair;
  v4 = [(SBKGenericKeyValuePair *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: key=%@, payload=%@", v4, self->_kvsKey, self->_kvsPayload];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  kvsKey = self->_kvsKey;
  id v5 = a3;
  [v5 encodeObject:kvsKey forKey:@"kvsKey"];
  [v5 encodeObject:self->_kvsPayload forKey:@"kvsPayload"];
}

- (SBKGenericKeyValuePair)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBKGenericKeyValuePair;
  id v5 = [(SBKGenericKeyValuePair *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kvsKey"];
    kvsKey = v5->_kvsKey;
    v5->_kvsKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kvsPayload"];
    kvsPayload = v5->_kvsPayload;
    v5->_kvsPayload = (NSData *)v8;
  }
  return v5;
}

- (SBKGenericKeyValuePair)initWithKVSKey:(id)a3 kvsPayload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBKGenericKeyValuePair;
  v9 = [(SBKGenericKeyValuePair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_kvsKey, a3);
    objc_storeStrong((id *)&v10->_kvsPayload, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pairWithKVSKey:(id)a3 kvsPayload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithKVSKey:v7 kvsPayload:v6];

  return v8;
}

@end