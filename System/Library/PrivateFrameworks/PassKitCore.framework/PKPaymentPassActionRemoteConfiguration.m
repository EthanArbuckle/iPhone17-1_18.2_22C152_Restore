@interface PKPaymentPassActionRemoteConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)appletDataRequiresEncryption;
- (BOOL)requiresAppletData;
- (PKPaymentPassActionRemoteConfiguration)init;
- (PKPaymentPassActionRemoteConfiguration)initWithCoder:(id)a3;
- (PKPaymentPassActionRemoteConfiguration)initWithDictionary:(id)a3;
- (PKPaymentPassActionRemoteConfiguration)initWithRequiresAppletData:(BOOL)a3 appletDataRequiresEncryption:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentPassActionRemoteConfiguration

- (PKPaymentPassActionRemoteConfiguration)init
{
  return 0;
}

- (PKPaymentPassActionRemoteConfiguration)initWithDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [v4 PKBoolForKey:@"requiresAppletData"];
    uint64_t v6 = [v4 PKBoolForKey:@"appletDataRequiresEncryption"];

    self = [(PKPaymentPassActionRemoteConfiguration *)self initWithRequiresAppletData:v5 appletDataRequiresEncryption:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKPaymentPassActionRemoteConfiguration)initWithRequiresAppletData:(BOOL)a3 appletDataRequiresEncryption:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassActionRemoteConfiguration;
  result = [(PKPaymentPassActionRemoteConfiguration *)&v7 init];
  if (result)
  {
    result->_requiresAppletData = a3;
    result->_appletDataRequiresEncryption = a3 && a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentPassActionRemoteConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassActionRemoteConfiguration;
  uint64_t v5 = [(PKPaymentPassActionRemoteConfiguration *)&v7 init];
  if (v5)
  {
    v5->_requiresAppletData = [v4 decodeBoolForKey:@"requiresAppletData"];
    v5->_appletDataRequiresEncryption = [v4 decodeBoolForKey:@"appletDataRequiresEncryption"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL requiresAppletData = self->_requiresAppletData;
  id v5 = a3;
  [v5 encodeBool:requiresAppletData forKey:@"requiresAppletData"];
  [v5 encodeBool:self->_appletDataRequiresEncryption forKey:@"appletDataRequiresEncryption"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((unsigned char *)result + 8) = self->_requiresAppletData;
  *((unsigned char *)result + 9) = self->_appletDataRequiresEncryption;
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; ", objc_opt_class()];
  id v4 = v3;
  if (self->_requiresAppletData) {
    id v5 = @"Yes";
  }
  else {
    id v5 = @"No";
  }
  [v3 appendFormat:@"requiresAppletData: '%@'; ", v5];
  if (self->_appletDataRequiresEncryption) {
    uint64_t v6 = @"Yes";
  }
  else {
    uint64_t v6 = @"No";
  }
  [v4 appendFormat:@"appletDataRequiresEncryption: '%@'; ", v6];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)requiresAppletData
{
  return self->_requiresAppletData;
}

- (BOOL)appletDataRequiresEncryption
{
  return self->_appletDataRequiresEncryption;
}

@end