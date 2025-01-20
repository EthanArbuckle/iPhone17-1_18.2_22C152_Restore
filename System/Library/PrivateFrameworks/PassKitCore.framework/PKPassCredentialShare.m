@interface PKPassCredentialShare
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForWatch;
- (NSString)channelTransportIdentifier;
- (NSString)identifier;
- (PKPassCredentialShare)init;
- (PKPassCredentialShare)initWithCoder:(id)a3;
- (PKPassCredentialShare)initWithInvitationData:(id)a3;
- (PKPassCredentialShare)initWithSubcredentialDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)targetDevice;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelTransportIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTargetDevice:(int64_t)a3;
- (void)updateWithInvitationData:(id)a3;
@end

@implementation PKPassCredentialShare

- (PKPassCredentialShare)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassCredentialShare;
  return [(PKPassCredentialShare *)&v3 init];
}

- (PKPassCredentialShare)initWithSubcredentialDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    char v15 = 0;
    v6 = [v4 PKStringForKey:@"status"];
    uint64_t v7 = PKShareStatusFromCarKeyStringStatus(v6, &v15);

    if (v15)
    {
      v8 = self;
    }
    else
    {
      v8 = [v5 PKStringForKey:@"keyID"];
      if (v8)
      {
        v14.receiver = self;
        v14.super_class = (Class)PKPassCredentialShare;
        v10 = [(PKPassCredentialShare *)&v14 init];
        v11 = v10;
        if (v10)
        {
          objc_storeStrong((id *)&v10->_identifier, v8);
          v11->_status = v7;
          v12 = [v5 PKStringForKey:@"deviceType"];
          v11->_targetDevice = PKPassCredentialShareTargetDeviceFromString(v12);
        }
        self = v11;
        goto LABEL_10;
      }
    }
    self = 0;
LABEL_10:

    v9 = self;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (PKPassCredentialShare)initWithInvitationData:(id)a3
{
  id v4 = a3;
  v5 = [(PKPassCredentialShare *)self init];
  v6 = v5;
  if (v5) {
    [(PKPassCredentialShare *)v5 updateWithInvitationData:v4];
  }

  return v6;
}

- (BOOL)isForWatch
{
  int64_t targetDevice = self->_targetDevice;
  return targetDevice == 4 || targetDevice == 1;
}

- (void)updateWithInvitationData:(id)a3
{
  id v7 = a3;
  id v4 = [v7 invitationIdentifier];
  [(PKPassCredentialShare *)self setIdentifier:v4];

  -[PKPassCredentialShare setTargetDevice:](self, "setTargetDevice:", [v7 sharingTargetType] == 2);
  unint64_t v5 = [v7 invitationState] - 1;
  if (v5 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_191674DD8[v5];
  }
  [(PKPassCredentialShare *)self setStatus:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassCredentialShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassCredentialShare;
  unint64_t v5 = [(PKPassCredentialShare *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"channelTransportIdentifier"];
    channelTransportIdentifier = v5->_channelTransportIdentifier;
    v5->_channelTransportIdentifier = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetDevice"];
    v5->_int64_t targetDevice = PKPassCredentialShareTargetDeviceFromString(v10);

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = PKShareStatusFromString(v11);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:self->_identifier forKey:@"identifier"];
  [v7 encodeObject:self->_channelTransportIdentifier forKey:@"channelTransportIdentifier"];
  unint64_t targetDevice = self->_targetDevice;
  if (targetDevice > 5) {
    unint64_t v5 = @"universal";
  }
  else {
    unint64_t v5 = off_1E56EC710[targetDevice];
  }
  [v7 encodeObject:v5 forKey:@"targetDevice"];
  uint64_t v6 = PKShareStatusToString(self->_status);
  [v7 encodeObject:v6 forKey:@"status"];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@"identifier: '%@'; ", self->_identifier];
  id v7 = PKSharingLoggableMailboxAddress(self->_channelTransportIdentifier);
  [v6 appendFormat:@"channelTransportIdentifier: '%@'; ", v7];

  unint64_t targetDevice = self->_targetDevice;
  if (targetDevice > 5) {
    v9 = @"universal";
  }
  else {
    v9 = off_1E56EC710[targetDevice];
  }
  [v6 appendFormat:@"targetDevice: '%@'; ", v9];
  v10 = PKShareStatusToString(self->_status);
  [v6 appendFormat:@"status: '%@'; ", v10];

  [v6 appendFormat:@">"];
  v11 = [NSString stringWithString:v6];

  return v11;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_identifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_channelTransportIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  int64_t v6 = self->_targetDevice - v5 + 32 * v5;
  unint64_t v7 = self->_status - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassCredentialShare *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v6 = v5;
        if (!self)
        {
LABEL_20:

          goto LABEL_21;
        }
        identifier = self->_identifier;
        uint64_t v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
            goto LABEL_19;
          }
        }
        else if (identifier != v8)
        {
          goto LABEL_19;
        }
        channelTransportIdentifier = self->_channelTransportIdentifier;
        v10 = v6->_channelTransportIdentifier;
        if (channelTransportIdentifier && v10)
        {
          if ((-[NSString isEqual:](channelTransportIdentifier, "isEqual:") & 1) == 0) {
            goto LABEL_19;
          }
        }
        else if (channelTransportIdentifier != v10)
        {
          goto LABEL_19;
        }
        if (self->_targetDevice == v6->_targetDevice)
        {
          LOBYTE(self) = self->_status == v6->_status;
          goto LABEL_20;
        }
LABEL_19:
        LOBYTE(self) = 0;
        goto LABEL_20;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_21:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_identifier copy];
  int64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_channelTransportIdentifier copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  v4[3] = self->_targetDevice;
  v4[4] = self->_status;
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)channelTransportIdentifier
{
  return self->_channelTransportIdentifier;
}

- (void)setChannelTransportIdentifier:(id)a3
{
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(int64_t)a3
{
  self->_unint64_t targetDevice = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelTransportIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end