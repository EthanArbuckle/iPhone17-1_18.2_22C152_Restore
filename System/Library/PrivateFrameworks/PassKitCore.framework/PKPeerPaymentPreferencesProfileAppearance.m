@interface PKPeerPaymentPreferencesProfileAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProfileAppearance:(id)a3;
- (BOOL)shareLastName;
- (BOOL)shareProfilePicture;
- (PKPeerPaymentPreferencesProfileAppearance)initWithCoder:(id)a3;
- (PKPeerPaymentPreferencesProfileAppearance)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setShareLastName:(BOOL)a3;
- (void)setShareProfilePicture:(BOOL)a3;
@end

@implementation PKPeerPaymentPreferencesProfileAppearance

- (PKPeerPaymentPreferencesProfileAppearance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentPreferencesProfileAppearance;
  v5 = [(PKPeerPaymentPreferencesProfileAppearance *)&v7 init];
  if (v5)
  {
    v5->_shareLastName = [v4 PKBoolForKey:@"shareLastName"];
    v5->_shareProfilePicture = [v4 PKBoolForKey:@"shareProfilePicture"];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithBool:self->_shareLastName];
  [v3 setObject:v4 forKey:@"shareLastName"];

  v5 = [NSNumber numberWithBool:self->_shareProfilePicture];
  [v3 setObject:v5 forKey:@"shareProfilePicture"];

  v6 = (void *)[v3 copy];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferencesProfileAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentPreferencesProfileAppearance;
  v5 = [(PKPeerPaymentPreferencesProfileAppearance *)&v7 init];
  if (v5)
  {
    v5->_shareLastName = [v4 decodeBoolForKey:@"shareLastName"];
    v5->_shareProfilePicture = [v4 decodeBoolForKey:@"shareProfilePicture"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL shareLastName = self->_shareLastName;
  id v5 = a3;
  [v5 encodeBool:shareLastName forKey:@"shareLastName"];
  [v5 encodeBool:self->_shareProfilePicture forKey:@"shareProfilePicture"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKPeerPaymentPreferencesProfileAppearance allocWithZone:a3] init];
  *((unsigned char *)result + 8) = self->_shareLastName;
  *((unsigned char *)result + 9) = self->_shareProfilePicture;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentPreferencesProfileAppearance *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentPreferencesProfileAppearance *)self isEqualToProfileAppearance:v5];

  return v6;
}

- (BOOL)isEqualToProfileAppearance:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  BOOL v5 = v4 && self->_shareLastName == v4[8] && self->_shareProfilePicture == v4[9];

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_shareLastName - v4 + 32 * v4;
  unint64_t v6 = self->_shareProfilePicture - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_shareLastName) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"shareLastName: '%@'; ", v5];
  if (self->_shareProfilePicture) {
    unint64_t v6 = @"YES";
  }
  else {
    unint64_t v6 = @"NO";
  }
  [v4 appendFormat:@"shareProfilePicture: '%@'; ", v6];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)shareLastName
{
  return self->_shareLastName;
}

- (void)setShareLastName:(BOOL)a3
{
  self->_BOOL shareLastName = a3;
}

- (BOOL)shareProfilePicture
{
  return self->_shareProfilePicture;
}

- (void)setShareProfilePicture:(BOOL)a3
{
  self->_shareProfilePicture = a3;
}

@end