@interface PKAppletSubcredentialSharingInvitationRequest
+ (BOOL)supportsSecureCoding;
- (NSString)credentialIdentifier;
- (NSString)sharedCredentialIdentifier;
- (NSUUID)sharingSessionIdentifier;
- (PKAppletSubcredentialSharingInvitationRequest)initWithCoder:(id)a3;
- (id)description;
- (int64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setSharedCredentialIdentifier:(id)a3;
- (void)setSharingSessionIdentifier:(id)a3;
@end

@implementation PKAppletSubcredentialSharingInvitationRequest

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; credential: %@; shared credential: %@; sharing session: %@; device type: %ld >",
               objc_opt_class(),
               self,
               self->_credentialIdentifier,
               self->_sharedCredentialIdentifier,
               self->_sharingSessionIdentifier,
               self->_deviceType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  credentialIdentifier = self->_credentialIdentifier;
  id v5 = a3;
  [v5 encodeObject:credentialIdentifier forKey:@"credentialIdentifier"];
  [v5 encodeObject:self->_sharedCredentialIdentifier forKey:@"sharedCredentialIdentifier"];
  [v5 encodeObject:self->_sharingSessionIdentifier forKey:@"sharingSessionIdentifier"];
  [v5 encodeInteger:self->_deviceType forKey:@"deviceType"];
}

- (PKAppletSubcredentialSharingInvitationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAppletSubcredentialSharingInvitationRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedCredentialIdentifier"];
    sharedCredentialIdentifier = v5->_sharedCredentialIdentifier;
    v5->_sharedCredentialIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionIdentifier"];
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v10;

    v5->_deviceType = [v4 decodeIntegerForKey:@"deviceType"];
  }

  return v5;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSString)sharedCredentialIdentifier
{
  return self->_sharedCredentialIdentifier;
}

- (void)setSharedCredentialIdentifier:(id)a3
{
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end