@interface PRPeer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSUUID)uuid;
- (PRPeer)init;
- (PRPeer)initWithCoder:(id)a3;
- (PRPeer)initWithUUID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPeer

- (PRPeer)init
{
  return 0;
}

- (PRPeer)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPeer;
  v6 = [(PRPeer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPeer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];

  v6 = [(PRPeer *)self initWithUUID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRPeer alloc];
  uuid = self->_uuid;
  return [(PRPeer *)v4 initWithUUID:uuid];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"UUID: %@", self->_uuid];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PRPeer *)self uuid];
    v7 = [v5 uuid];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end