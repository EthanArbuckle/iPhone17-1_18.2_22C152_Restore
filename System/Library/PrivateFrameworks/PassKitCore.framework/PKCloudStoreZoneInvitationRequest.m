@interface PKCloudStoreZoneInvitationRequest
+ (BOOL)supportsSecureCoding;
+ (id)cloudStoreZoneInvitationRequestWithProtobuf:(id)a3;
+ (id)invitationErrorWithProtobuf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSError)invitationError;
- (PKCloudStoreZoneInvitation)invitation;
- (PKCloudStoreZoneInvitationRequest)initWithCoder:(id)a3;
- (PKSharingDestination)destination;
- (id)description;
- (id)protobuf;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setInvitationError:(id)a3;
@end

@implementation PKCloudStoreZoneInvitationRequest

+ (id)cloudStoreZoneInvitationRequestWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PKCloudStoreZoneInvitationRequest);
  v6 = [v4 invitation];
  v7 = +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:v6];
  [(PKCloudStoreZoneInvitationRequest *)v5 setInvitation:v7];

  v8 = [a1 invitationErrorWithProtobuf:v4];

  [(PKCloudStoreZoneInvitationRequest *)v5 setInvitationError:v8];
  return v5;
}

- (id)protobuf
{
  v3 = objc_alloc_init(PKProtobufCloudStoreZoneInvitationRequest);
  id v4 = [(PKCloudStoreZoneInvitationRequest *)self invitation];
  v5 = [v4 protobuf];
  [(PKProtobufCloudStoreZoneInvitationRequest *)v3 setInvitation:v5];

  v6 = [(PKCloudStoreZoneInvitationRequest *)self invitationError];

  if (v6)
  {
    v7 = [(PKCloudStoreZoneInvitationRequest *)self invitationError];
    -[PKProtobufCloudStoreZoneInvitationRequest setErrorCode:](v3, "setErrorCode:", [v7 code]);

    v8 = [(PKCloudStoreZoneInvitationRequest *)self invitationError];
    v9 = [v8 domain];
    [(PKProtobufCloudStoreZoneInvitationRequest *)v3 setErrorDomain:v9];

    v10 = [(PKCloudStoreZoneInvitationRequest *)self invitationError];
    v11 = [v10 localizedDescription];
    [(PKProtobufCloudStoreZoneInvitationRequest *)v3 setErrorDescription:v11];
  }
  return v3;
}

+ (id)invitationErrorWithProtobuf:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 errorDomain];

  if (v4)
  {
    v5 = [v3 errorDescription];
    v6 = (void *)MEMORY[0x1E4F28C58];
    v7 = [v3 errorDomain];
    uint64_t v8 = [v3 errorCode];
    uint64_t v9 = *MEMORY[0x1E4F28588];
    v13[0] = *MEMORY[0x1E4F28568];
    v13[1] = v9;
    v14[0] = v5;
    v14[1] = v5;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v11 = [v6 errorWithDomain:v7 code:v8 userInfo:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneInvitationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudStoreZoneInvitationRequest;
  v5 = [(PKCloudStoreZoneInvitationRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    destination = v5->_destination;
    v5->_destination = (PKSharingDestination *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitation"];
    invitation = v5->_invitation;
    v5->_invitation = (PKCloudStoreZoneInvitation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationError"];
    invitationError = v5->_invitationError;
    v5->_invitationError = (NSError *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  destination = self->_destination;
  id v5 = a3;
  [v5 encodeObject:destination forKey:@"destination"];
  [v5 encodeObject:self->_invitation forKey:@"invitation"];
  [v5 encodeObject:self->_invitationError forKey:@"invitationError"];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_destination];
  [v3 safelyAddObject:self->_invitation];
  [v3 safelyAddObject:self->_invitationError];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;
  if (!v6) {
    goto LABEL_17;
  }
  destination = self->_destination;
  uint64_t v8 = (PKSharingDestination *)v6[2];
  if (destination && v8)
  {
    if (!-[PKSharingDestination isEqual:](destination, "isEqual:")) {
      goto LABEL_17;
    }
  }
  else if (destination != v8)
  {
    goto LABEL_17;
  }
  invitation = self->_invitation;
  uint64_t v10 = (PKCloudStoreZoneInvitation *)v6[1];
  if (!invitation || !v10)
  {
    if (invitation == v10) {
      goto LABEL_13;
    }
LABEL_17:
    char v13 = 0;
    goto LABEL_18;
  }
  if (!-[PKCloudStoreZoneInvitation isEqual:](invitation, "isEqual:")) {
    goto LABEL_17;
  }
LABEL_13:
  invitationError = self->_invitationError;
  v12 = (NSError *)v6[3];
  if (invitationError && v12) {
    char v13 = -[NSError isEqual:](invitationError, "isEqual:");
  }
  else {
    char v13 = invitationError == v12;
  }
LABEL_18:

  return v13;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"destination: '%@'; ", self->_destination];
  [v3 appendFormat:@"invitation: '%@'; ", self->_invitation];
  if (self->_invitationError) {
    [v3 appendFormat:@"invitationError: '%@'; ", self->_invitationError];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (PKCloudStoreZoneInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (PKSharingDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSError)invitationError
{
  return self->_invitationError;
}

- (void)setInvitationError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationError, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end