@interface PKPeerPaymentPaymentModeIdentifiers
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)deviceTap;
- (PKPeerPaymentPaymentModeIdentifiers)initWithCoder:(id)a3;
- (PKPeerPaymentPaymentModeIdentifiers)initWithDictionary:(id)a3;
- (id)description;
- (id)identifierForPaymentMode:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceTap:(id)a3;
@end

@implementation PKPeerPaymentPaymentModeIdentifiers

- (PKPeerPaymentPaymentModeIdentifiers)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentPaymentModeIdentifiers;
  v5 = [(PKPeerPaymentPaymentModeIdentifiers *)&v10 init];
  if (v5)
  {
    v6 = PKPeerPaymentPaymentModeToString(2);
    uint64_t v7 = [v4 PKStringForKey:v6];
    deviceTap = v5->_deviceTap;
    v5->_deviceTap = (NSString *)v7;
  }
  return v5;
}

- (id)identifierForPaymentMode:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v4 = self->_deviceTap;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPaymentModeIdentifiers)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentPaymentModeIdentifiers;
  v5 = [(PKPeerPaymentPaymentModeIdentifiers *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceTap"];
    deviceTap = v5->_deviceTap;
    v5->_deviceTap = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_deviceTap];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    deviceTap = self->_deviceTap;
    uint64_t v6 = (NSString *)v4[1];
    if (deviceTap && v6) {
      char v7 = -[NSString isEqual:](deviceTap, "isEqual:");
    }
    else {
      char v7 = deviceTap == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"deviceTap: '%@'; ", self->_deviceTap];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)deviceTap
{
  return self->_deviceTap;
}

- (void)setDeviceTap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end