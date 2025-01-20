@interface PKPeerPaymentPreferencesRestriction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPreferencesRestriction:(id)a3;
- (NSString)altDSID;
- (PKPeerPaymentPreferencesRestriction)initWithCoder:(id)a3;
- (PKPeerPaymentPreferencesRestriction)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)receiveRestrictionType;
- (unint64_t)sendRestrictionType;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setReceiveRestrictionType:(unint64_t)a3;
- (void)setSendRestrictionType:(unint64_t)a3;
@end

@implementation PKPeerPaymentPreferencesRestriction

- (PKPeerPaymentPreferencesRestriction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentPreferencesRestriction;
  v5 = [(PKPeerPaymentPreferencesRestriction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"restrictionType"];
    v5->_sendRestrictionType = PKPeerPaymentPreferencesSendRestrictionTypeFromString(v8);

    v9 = [v4 PKStringForKey:@"receiveRestrictionType"];
    v5->_receiveRestrictionType = PKPeerPaymentPreferencesReceiveRestrictionTypeFromString(v9);
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_altDSID forKey:@"altDSID"];
  unint64_t sendRestrictionType = self->_sendRestrictionType;
  if (sendRestrictionType > 4) {
    v5 = 0;
  }
  else {
    v5 = off_1E56F7118[sendRestrictionType];
  }
  [v3 setObject:v5 forKey:@"restrictionType"];
  unint64_t receiveRestrictionType = self->_receiveRestrictionType;
  if (receiveRestrictionType > 3) {
    v7 = 0;
  }
  else {
    v7 = off_1E56F7140[receiveRestrictionType];
  }
  [v3 setObject:v7 forKey:@"receiveRestrictionType"];
  v8 = (void *)[v3 copy];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferencesRestriction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentPreferencesRestriction;
  v5 = [(PKPeerPaymentPreferencesRestriction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restrictionType"];
    v5->_unint64_t sendRestrictionType = [v8 integerValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiveRestrictionType"];
    v5->_unint64_t receiveRestrictionType = [v9 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"altDSID"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_sendRestrictionType];
  [v5 encodeObject:v6 forKey:@"restrictionType"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_receiveRestrictionType];
  [v5 encodeObject:v7 forKey:@"receiveRestrictionType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPeerPaymentPreferencesRestriction allocWithZone:](PKPeerPaymentPreferencesRestriction, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_altDSID copyWithZone:a3];
  altDSID = v5->_altDSID;
  v5->_altDSID = (NSString *)v6;

  v5->_unint64_t sendRestrictionType = self->_sendRestrictionType;
  v5->_unint64_t receiveRestrictionType = self->_receiveRestrictionType;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentPreferencesRestriction *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentPreferencesRestriction *)self isEqualToPreferencesRestriction:v5];

  return v6;
}

- (BOOL)isEqualToPreferencesRestriction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_sendRestrictionType == v4[2] && self->_receiveRestrictionType == v4[3])
  {
    altDSID = self->_altDSID;
    id v7 = (NSString *)v5[1];
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
  unint64_t v5 = self->_sendRestrictionType - v4 + 32 * v4;
  unint64_t v6 = self->_receiveRestrictionType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  unint64_t sendRestrictionType = self->_sendRestrictionType;
  if (sendRestrictionType > 4) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = off_1E56F7118[sendRestrictionType];
  }
  [v3 appendFormat:@"sendRestrictionType: '%@'; ", v5];
  unint64_t receiveRestrictionType = self->_receiveRestrictionType;
  if (receiveRestrictionType > 3) {
    id v7 = 0;
  }
  else {
    id v7 = off_1E56F7140[receiveRestrictionType];
  }
  [v3 appendFormat:@"receiveRestrictionType: '%@'; ", v7];
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

- (unint64_t)sendRestrictionType
{
  return self->_sendRestrictionType;
}

- (void)setSendRestrictionType:(unint64_t)a3
{
  self->_unint64_t sendRestrictionType = a3;
}

- (unint64_t)receiveRestrictionType
{
  return self->_receiveRestrictionType;
}

- (void)setReceiveRestrictionType:(unint64_t)a3
{
  self->_unint64_t receiveRestrictionType = a3;
}

- (void).cxx_destruct
{
}

@end