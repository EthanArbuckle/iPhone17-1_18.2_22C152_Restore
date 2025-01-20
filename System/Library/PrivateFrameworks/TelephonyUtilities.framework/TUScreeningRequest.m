@interface TUScreeningRequest
+ (BOOL)supportsSecureCoding;
- (NSUUID)UUID;
- (NSUUID)callUUID;
- (TUScreeningRequest)initWithCoder:(id)a3;
- (TUScreeningRequest)initWithTUCallUpdate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCallUUID:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUScreeningRequest

- (TUScreeningRequest)initWithTUCallUpdate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUScreeningRequest;
  v5 = [(TUScreeningRequest *)&v13 init];
  if (v5)
  {
    v6 = [v4 UUID];
    uint64_t v7 = [v6 copy];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

    v9 = [v4 callUUID];
    uint64_t v10 = [v9 copy];
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUScreeningRequest *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(TUScreeningRequest *)self callUUID];
  [v3 appendFormat:@" callUUID=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_callUUID forKey:@"callUUID"];
}

- (TUScreeningRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUScreeningRequest;
  id v5 = [(TUScreeningRequest *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uint64_t v7 = [v6 copy];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callUUID"];
    uint64_t v10 = [v9 copy];
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[TUScreeningRequest allocWithZone:a3] init];
  id v5 = [(TUScreeningRequest *)self UUID];
  v6 = (void *)[v5 copy];
  [(TUScreeningRequest *)v4 setUUID:v6];

  uint64_t v7 = [(TUScreeningRequest *)self callUUID];
  v8 = (void *)[v7 copy];
  [(TUScreeningRequest *)v4 setCallUUID:v8];

  return v4;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callUUID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end