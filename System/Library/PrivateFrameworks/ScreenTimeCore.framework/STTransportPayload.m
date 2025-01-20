@interface STTransportPayload
+ (BOOL)supportsSecureCoding;
- (NSString)UUID;
- (STTransportPayload)init;
- (STTransportPayload)initWithCoder:(id)a3;
- (STTransportPayload)initWithUUID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STTransportPayload

- (STTransportPayload)initWithUUID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STTransportPayload;
  v5 = [(STTransportPayload *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (NSString *)[v4 copy];
      UUID = v5->_UUID;
      v5->_UUID = v6;
    }
    else
    {
      UUID = +[NSUUID UUID];
      uint64_t v8 = [UUID UUIDString];
      v9 = v5->_UUID;
      v5->_UUID = (NSString *)v8;
    }
  }

  return v5;
}

- (STTransportPayload)init
{
  return [(STTransportPayload *)self initWithUUID:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STTransportPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STTransportPayload;
  v5 = [(STTransportPayload *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  UUID = self->_UUID;
  return _[v4 initWithUUID:UUID];
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
}

@end