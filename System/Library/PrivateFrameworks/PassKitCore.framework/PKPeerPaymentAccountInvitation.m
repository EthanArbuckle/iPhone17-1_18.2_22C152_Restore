@interface PKPeerPaymentAccountInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)altDSID;
- (PKPeerPaymentAccountInvitation)initWithCoder:(id)a3;
- (PKPeerPaymentAccountInvitation)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)remoteRegistrationRequestLevel;
- (int64_t)status;
- (unint64_t)hash;
- (unint64_t)registrationResult;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setRegistrationResult:(unint64_t)a3;
- (void)setRemoteRegistrationRequestLevel:(int64_t)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation PKPeerPaymentAccountInvitation

- (PKPeerPaymentAccountInvitation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentAccountInvitation;
  v5 = [(PKPeerPaymentAccountInvitation *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"status"];
    v9 = v8;
    if (v8 != @"pending")
    {
      if (v8)
      {
        char v10 = [(__CFString *)v8 isEqualToString:@"pending"];

        if (v10) {
          goto LABEL_5;
        }
        v12 = v9;
        if (v12 == @"accepted"
          || (v13 = v12,
              int v14 = [(__CFString *)v12 isEqualToString:@"accepted"],
              v13,
              v14))
        {
          uint64_t v11 = 2;
          goto LABEL_10;
        }
      }
      uint64_t v11 = 0;
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v11 = 1;
LABEL_10:

    v5->_status = v11;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAccountInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentAccountInvitation;
  v5 = [(PKPeerPaymentAccountInvitation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v5->_registrationResult = [v4 decodeIntegerForKey:@"registrationResult"];
    v5->_remoteRegistrationRequestLevel = [v4 decodeIntegerForKey:@"remoteRegistrationRequestLevel"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"altDSID"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeInteger:self->_registrationResult forKey:@"registrationResult"];
  [v5 encodeInteger:self->_remoteRegistrationRequestLevel forKey:@"remoteRegistrationRequestLevel"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  int64_t status = self->_status;
  id v5 = @"pending";
  if (status == 2) {
    id v5 = @"accepted";
  }
  if (status) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"unknown";
  }
  [v3 appendFormat:@"status: '%@'; ", v6];
  v7 = PKDeviceRegistrationResultToString(self->_registrationResult);
  [v3 appendFormat:@"registrationResult: '%@'; ", v7];

  objc_msgSend(v3, "appendFormat:", @"remoteRegistrationRequestLevel: %ld; ",
    self->_remoteRegistrationRequestLevel);
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v5 = (void *)v4[1];
  uint64_t v6 = self->_altDSID;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_12:
      BOOL v10 = 0;
      goto LABEL_13;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_12;
    }
  }
  if (self->_status != v4[2] || self->_registrationResult != v4[3]) {
    goto LABEL_12;
  }
  BOOL v10 = self->_remoteRegistrationRequestLevel == v4[4];
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_altDSID];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_status - v4 + 32 * v4;
  unint64_t v6 = self->_registrationResult - v5 + 32 * v5;
  unint64_t v7 = self->_remoteRegistrationRequestLevel - v6 + 32 * v6;

  return v7;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (unint64_t)registrationResult
{
  return self->_registrationResult;
}

- (void)setRegistrationResult:(unint64_t)a3
{
  self->_registrationResult = a3;
}

- (int64_t)remoteRegistrationRequestLevel
{
  return self->_remoteRegistrationRequestLevel;
}

- (void)setRemoteRegistrationRequestLevel:(int64_t)a3
{
  self->_remoteRegistrationRequestLevel = a3;
}

- (void).cxx_destruct
{
}

@end