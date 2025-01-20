@interface PKPeerPaymentPreferencesNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPreferencesNotification:(id)a3;
- (BOOL)value;
- (NSString)altDSID;
- (PKPeerPaymentPreferencesNotification)initWithCoder:(id)a3;
- (PKPeerPaymentPreferencesNotification)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setNotificationType:(unint64_t)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation PKPeerPaymentPreferencesNotification

- (PKPeerPaymentPreferencesNotification)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentPreferencesNotification;
  v5 = [(PKPeerPaymentPreferencesNotification *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"notificationType"];
    v5->_notificationType = PKPeerPaymentPreferencesNotificationTypeFromString(v8);

    v5->_value = [v4 PKBoolForKey:@"value"];
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_altDSID forKey:@"altDSID"];
  unint64_t notificationType = self->_notificationType;
  v5 = @"unknown";
  if (notificationType) {
    v5 = 0;
  }
  if (notificationType == 1) {
    uint64_t v6 = @"purchases";
  }
  else {
    uint64_t v6 = v5;
  }
  [v3 setObject:v6 forKey:@"notificationType"];
  v7 = [NSNumber numberWithBool:self->_value];
  [v3 setObject:v7 forKey:@"value"];

  v8 = (void *)[v3 copy];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferencesNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentPreferencesNotification;
  v5 = [(PKPeerPaymentPreferencesNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_unint64_t notificationType = [v4 decodeIntegerForKey:@"notificationType"];
    v5->_value = [v4 decodeBoolForKey:@"value"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"altDSID"];
  [v5 encodeInteger:self->_notificationType forKey:@"notificationType"];
  [v5 encodeBool:self->_value forKey:@"value"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPeerPaymentPreferencesNotification allocWithZone:](PKPeerPaymentPreferencesNotification, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_altDSID copyWithZone:a3];
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v6;

  v5->_unint64_t notificationType = self->_notificationType;
  v5->_value = self->_value;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentPreferencesNotification *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentPreferencesNotification *)self isEqualToPreferencesNotification:v5];

  return v6;
}

- (BOOL)isEqualToPreferencesNotification:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_notificationType == v4[3] && self->_value == *((unsigned __int8 *)v4 + 8))
  {
    altDSID = self->_altDSID;
    v7 = (NSString *)v5[2];
    if (altDSID && v7) {
      char v8 = -[NSString isEqual:](altDSID, "isEqual:");
    }
    else {
      char v8 = altDSID == v7;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_altDSID];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_notificationType - v4 + 32 * v4;
  unint64_t v6 = self->_value - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  unint64_t notificationType = self->_notificationType;
  unint64_t v5 = @"unknown";
  if (notificationType) {
    unint64_t v5 = 0;
  }
  if (notificationType == 1) {
    unint64_t v6 = @"purchases";
  }
  else {
    unint64_t v6 = v5;
  }
  [v3 appendFormat:@"notificationType: '%@'; ", v6];
  if (self->_value) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"value: '%@'; ", v7];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_unint64_t notificationType = a3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

- (void).cxx_destruct
{
}

@end