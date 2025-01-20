@interface PKCloudStoreZoneShareParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKDeviceToDeviceShareInvitationToken)invitationToken;
- (CKUserIdentityLookupInfo)lookupInfo;
- (NSString)participantHandle;
- (PKCloudStoreZoneShareParticipant)initWithCoder:(id)a3;
- (PKCloudStoreZoneShareParticipant)initWithParticipant:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)invitationTokenData;
- (id)lookupInfoData;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInvitationToken:(id)a3;
- (void)setLookupInfo:(id)a3;
- (void)setParticipantHandle:(id)a3;
@end

@implementation PKCloudStoreZoneShareParticipant

- (PKCloudStoreZoneShareParticipant)initWithParticipant:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCloudStoreZoneShareParticipant;
  v5 = [(PKCloudStoreZoneShareParticipant *)&v16 init];
  if (v5)
  {
    v6 = [v4 userIdentity];
    uint64_t v7 = [v6 lookupInfo];
    lookupInfo = v5->_lookupInfo;
    v5->_lookupInfo = (CKUserIdentityLookupInfo *)v7;

    uint64_t v9 = [v4 invitationToken];
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v9;

    v11 = [(CKUserIdentityLookupInfo *)v5->_lookupInfo emailAddress];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = [(CKUserIdentityLookupInfo *)v5->_lookupInfo phoneNumber];
    }
    participantHandle = v5->_participantHandle;
    v5->_participantHandle = v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneShareParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudStoreZoneShareParticipant;
  v5 = [(PKCloudStoreZoneShareParticipant *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"participantHandle"];
    participantHandle = v5->_participantHandle;
    v5->_participantHandle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lookupInfo"];
    lookupInfo = v5->_lookupInfo;
    v5->_lookupInfo = (CKUserIdentityLookupInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationToken"];
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v10;
  }
  return v5;
}

- (id)invitationTokenData
{
  invitationToken = self->_invitationToken;
  if (invitationToken)
  {
    v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:invitationToken requiringSecureCoding:1 error:0];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)lookupInfoData
{
  lookupInfo = self->_lookupInfo;
  if (lookupInfo)
  {
    v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:lookupInfo requiringSecureCoding:1 error:0];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  participantHandle = self->_participantHandle;
  id v5 = a3;
  [v5 encodeObject:participantHandle forKey:@"participantHandle"];
  [v5 encodeObject:self->_lookupInfo forKey:@"lookupInfo"];
  [v5 encodeObject:self->_invitationToken forKey:@"invitationToken"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKCloudStoreZoneShareParticipant allocWithZone:](PKCloudStoreZoneShareParticipant, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_participantHandle copyWithZone:a3];
  participantHandle = v5->_participantHandle;
  v5->_participantHandle = (NSString *)v6;

  uint64_t v8 = [(CKUserIdentityLookupInfo *)self->_lookupInfo copyWithZone:a3];
  lookupInfo = v5->_lookupInfo;
  v5->_lookupInfo = (CKUserIdentityLookupInfo *)v8;

  uint64_t v10 = [(CKDeviceToDeviceShareInvitationToken *)self->_invitationToken copyWithZone:a3];
  invitationToken = v5->_invitationToken;
  v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;
  if (!v6) {
    goto LABEL_17;
  }
  participantHandle = self->_participantHandle;
  uint64_t v8 = (NSString *)v6[1];
  if (participantHandle && v8)
  {
    if ((-[NSString isEqual:](participantHandle, "isEqual:") & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (participantHandle != v8)
  {
    goto LABEL_17;
  }
  lookupInfo = self->_lookupInfo;
  uint64_t v10 = (CKUserIdentityLookupInfo *)v6[2];
  if (!lookupInfo || !v10)
  {
    if (lookupInfo == v10) {
      goto LABEL_13;
    }
LABEL_17:
    char v13 = 0;
    goto LABEL_18;
  }
  if ((-[CKUserIdentityLookupInfo isEqual:](lookupInfo, "isEqual:") & 1) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  invitationToken = self->_invitationToken;
  v12 = (CKDeviceToDeviceShareInvitationToken *)v6[3];
  if (invitationToken && v12) {
    char v13 = -[CKDeviceToDeviceShareInvitationToken isEqual:](invitationToken, "isEqual:");
  }
  else {
    char v13 = invitationToken == v12;
  }
LABEL_18:

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_participantHandle];
  [v3 safelyAddObject:self->_lookupInfo];
  [v3 safelyAddObject:self->_invitationToken];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"participantHandle: '%@'; ", self->_participantHandle];
  [v3 appendFormat:@"invitationToken: '%@'; ", self->_invitationToken];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)participantHandle
{
  return self->_participantHandle;
}

- (void)setParticipantHandle:(id)a3
{
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  return self->_lookupInfo;
}

- (void)setLookupInfo:(id)a3
{
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return self->_invitationToken;
}

- (void)setInvitationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_participantHandle, 0);
}

@end