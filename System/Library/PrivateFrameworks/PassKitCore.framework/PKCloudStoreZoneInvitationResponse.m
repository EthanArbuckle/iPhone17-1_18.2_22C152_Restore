@interface PKCloudStoreZoneInvitationResponse
+ (BOOL)supportsSecureCoding;
+ (id)cloudStoreZoneInvitationResponseWithProtobuf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PKCloudStoreZoneInvitation)invitation;
- (PKCloudStoreZoneInvitationResponse)initWithCoder:(id)a3;
- (PKSharingDestination)destination;
- (id)description;
- (id)protobuf;
- (int64_t)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation PKCloudStoreZoneInvitationResponse

+ (id)cloudStoreZoneInvitationResponseWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKCloudStoreZoneInvitationResponse);
  v5 = [v3 invitation];
  v6 = +[PKCloudStoreZoneInvitation cloudStoreZoneInvitationWithProtobuf:v5];
  [(PKCloudStoreZoneInvitationResponse *)v4 setInvitation:v6];

  LODWORD(v6) = [v3 status];
  [(PKCloudStoreZoneInvitationResponse *)v4 setStatus:v6];
  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufCloudStoreZoneInvitationResponse);
  v4 = [(PKCloudStoreZoneInvitationResponse *)self invitation];
  v5 = [v4 protobuf];
  [(PKProtobufCloudStoreZoneInvitationResponse *)v3 setInvitation:v5];

  [(PKProtobufCloudStoreZoneInvitationResponse *)v3 setStatus:[(PKCloudStoreZoneInvitationResponse *)self status]];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneInvitationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudStoreZoneInvitationResponse;
  v5 = [(PKCloudStoreZoneInvitationResponse *)&v11 init];
  if (v5)
  {
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitation"];
    invitation = v5->_invitation;
    v5->_invitation = (PKCloudStoreZoneInvitation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
    destination = v5->_destination;
    v5->_destination = (PKSharingDestination *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t status = self->_status;
  id v5 = a3;
  [v5 encodeInteger:status forKey:@"status"];
  [v5 encodeObject:self->_invitation forKey:@"invitation"];
  [v5 encodeObject:self->_destination forKey:@"destination"];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_invitation];
  [v3 safelyAddObject:self->_destination];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_status - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = v5;
  v7 = v6;
  if (!v6 || self->_status != v6[3]) {
    goto LABEL_13;
  }
  invitation = self->_invitation;
  v9 = (PKCloudStoreZoneInvitation *)v7[1];
  if (!invitation || !v9)
  {
    if (invitation == v9) {
      goto LABEL_9;
    }
LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  if (!-[PKCloudStoreZoneInvitation isEqual:](invitation, "isEqual:")) {
    goto LABEL_13;
  }
LABEL_9:
  destination = self->_destination;
  objc_super v11 = (PKSharingDestination *)v7[2];
  if (destination && v11) {
    BOOL v12 = -[PKSharingDestination isEqual:](destination, "isEqual:");
  }
  else {
    BOOL v12 = destination == v11;
  }
LABEL_14:

  return v12;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  unint64_t status = self->_status;
  if (status > 3) {
    uint64_t v6 = @"accepted";
  }
  else {
    uint64_t v6 = off_1E56ED748[status];
  }
  [v3 appendFormat:@"status: '%@'; ", v6];
  [v4 appendFormat:@"invitation: '%@'; ", self->_invitation];
  [v4 appendFormat:@"destination: '%@'; ", self->_destination];
  [v4 appendFormat:@">"];
  return v4;
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

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_unint64_t status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end