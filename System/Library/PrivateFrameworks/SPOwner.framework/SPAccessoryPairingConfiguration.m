@interface SPAccessoryPairingConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (NSString)roleEmoji;
- (SPAccessoryPairingConfiguration)initWithCoder:(id)a3;
- (SPAccessoryPairingConfiguration)initWithName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)roleId;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setRoleEmoji:(id)a3;
- (void)setRoleId:(int64_t)a3;
@end

@implementation SPAccessoryPairingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAccessoryPairingConfiguration)initWithName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPAccessoryPairingConfiguration;
  v11 = [(SPAccessoryPairingConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_roleId = a4;
    objc_storeStrong((id *)&v12->_roleEmoji, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPAccessoryPairingConfiguration alloc];
  v5 = [(SPAccessoryPairingConfiguration *)self name];
  int64_t v6 = [(SPAccessoryPairingConfiguration *)self roleId];
  v7 = [(SPAccessoryPairingConfiguration *)self roleEmoji];
  v8 = [(SPAccessoryPairingConfiguration *)v4 initWithName:v5 roleId:v6 roleEmoji:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInteger:self->_roleId forKey:@"roleId"];
  [v5 encodeObject:self->_roleEmoji forKey:@"roleEmoji"];
}

- (SPAccessoryPairingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  self->_roleId = [v4 decodeIntegerForKey:@"roleId"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roleEmoji"];

  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v7;

  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(int64_t)a3
{
  self->_roleId = a3;
}

- (NSString)roleEmoji
{
  return self->_roleEmoji;
}

- (void)setRoleEmoji:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleEmoji, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end