@interface SPPairingConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isZeus;
- (NSData)collaborativeKeyC3;
- (NSData)keyStatus;
- (NSData)signatureS4;
- (NSString)name;
- (NSString)roleEmoji;
- (SPPairingConfiguration)initWithCoder:(id)a3;
- (SPPairingConfiguration)initWithName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5 keyStatus:(id)a6 collaborativeKeyC3:(id)a7 signatureS4:(id)a8 isZeus:(BOOL)a9 batteryLevel:(int64_t)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)batteryLevel;
- (int64_t)roleId;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryLevel:(int64_t)a3;
- (void)setCollaborativeKeyC3:(id)a3;
- (void)setIsZeus:(BOOL)a3;
- (void)setKeyStatus:(id)a3;
- (void)setName:(id)a3;
- (void)setRoleEmoji:(id)a3;
- (void)setRoleId:(int64_t)a3;
- (void)setSignatureS4:(id)a3;
@end

@implementation SPPairingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPairingConfiguration)initWithName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5 keyStatus:(id)a6 collaborativeKeyC3:(id)a7 signatureS4:(id)a8 isZeus:(BOOL)a9 batteryLevel:(int64_t)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v24 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SPPairingConfiguration;
  v20 = [(SPPairingConfiguration *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, a3);
    v21->_roleId = a4;
    objc_storeStrong((id *)&v21->_roleEmoji, a5);
    objc_storeStrong((id *)&v21->_collaborativeKeyC3, a7);
    objc_storeStrong((id *)&v21->_signatureS4, a8);
    objc_storeStrong((id *)&v21->_keyStatus, a6);
    v21->_isZeus = a9;
    v21->_batteryLevel = a10;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPPairingConfiguration alloc];
  v5 = [(SPPairingConfiguration *)self name];
  int64_t v6 = [(SPPairingConfiguration *)self roleId];
  v7 = [(SPPairingConfiguration *)self roleEmoji];
  v8 = [(SPPairingConfiguration *)self keyStatus];
  v9 = [(SPPairingConfiguration *)self collaborativeKeyC3];
  v10 = [(SPPairingConfiguration *)self signatureS4];
  LOBYTE(v13) = [(SPPairingConfiguration *)self isZeus];
  v11 = [(SPPairingConfiguration *)v4 initWithName:v5 roleId:v6 roleEmoji:v7 keyStatus:v8 collaborativeKeyC3:v9 signatureS4:v10 isZeus:v13 batteryLevel:[(SPPairingConfiguration *)self batteryLevel]];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInteger:self->_roleId forKey:@"roleId"];
  [v5 encodeObject:self->_roleEmoji forKey:@"roleEmoji"];
  [v5 encodeObject:self->_collaborativeKeyC3 forKey:@"collaborativeKeyC3"];
  [v5 encodeObject:self->_signatureS4 forKey:@"signatureS4"];
  [v5 encodeObject:self->_keyStatus forKey:@"keyStatus"];
  [v5 encodeBool:self->_isZeus forKey:@"isZeus"];
  [v5 encodeInteger:self->_batteryLevel forKey:@"batteryLevel"];
}

- (SPPairingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v5;

  self->_roleId = [v4 decodeIntegerForKey:@"roleId"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roleEmoji"];
  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborativeKeyC3"];
  collaborativeKeyC3 = self->_collaborativeKeyC3;
  self->_collaborativeKeyC3 = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signatureS4"];
  signatureS4 = self->_signatureS4;
  self->_signatureS4 = v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyStatus"];
  keyStatus = self->_keyStatus;
  self->_keyStatus = v13;

  self->_isZeus = [v4 decodeBoolForKey:@"isZeus"];
  int64_t v15 = [v4 decodeIntegerForKey:@"batteryLevel"];

  self->_batteryLevel = v15;
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

- (NSData)collaborativeKeyC3
{
  return self->_collaborativeKeyC3;
}

- (void)setCollaborativeKeyC3:(id)a3
{
}

- (NSData)signatureS4
{
  return self->_signatureS4;
}

- (void)setSignatureS4:(id)a3
{
}

- (NSData)keyStatus
{
  return self->_keyStatus;
}

- (void)setKeyStatus:(id)a3
{
}

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyStatus, 0);
  objc_storeStrong((id *)&self->_signatureS4, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC3, 0);
  objc_storeStrong((id *)&self->_roleEmoji, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end