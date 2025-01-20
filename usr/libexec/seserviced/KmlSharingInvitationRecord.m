@interface KmlSharingInvitationRecord
+ (BOOL)supportsSecureCoding;
- (KmlSharingInvitationRecord)init;
- (KmlSharingInvitationRecord)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KmlSharingInvitationRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  if (self)
  {
    [v11 encodeObject:self->_uuid forKey:@"uuid"];
    ownerIdsIdentifier = self->_ownerIdsIdentifier;
  }
  else
  {
    [v11 encodeObject:0 forKey:@"uuid"];
    ownerIdsIdentifier = 0;
  }
  [v11 encodeObject:ownerIdsIdentifier forKey:@"ownerIdsIdentifier"];
  if (self)
  {
    [v11 encodeObject:self->_crossPlatformMailboxIdentifier forKey:@"crossPlatformMailboxIdentifier"];
    invitationFromOwner = self->_invitationFromOwner;
  }
  else
  {
    [v11 encodeObject:0 forKey:@"crossPlatformMailboxIdentifier"];
    invitationFromOwner = 0;
  }
  [v11 encodeObject:invitationFromOwner forKey:@"invitationFromOwner"];
  if (self)
  {
    [v11 encodeObject:self->_bindingAttestation forKey:@"bindingAttestation"];
    signingRequest = self->_signingRequest;
  }
  else
  {
    [v11 encodeObject:0 forKey:@"bindingAttestation"];
    signingRequest = 0;
  }
  [v11 encodeObject:signingRequest forKey:@"signingRequest"];
  if (self)
  {
    [v11 encodeObject:self->_ppidEncryptionEphemeralPublicKey forKey:@"ppidEncryptionEphemeralPublicKey"];
    ppidEncryptionEphemeralSecretKey = self->_ppidEncryptionEphemeralSecretKey;
  }
  else
  {
    [v11 encodeObject:0 forKey:@"ppidEncryptionEphemeralPublicKey"];
    ppidEncryptionEphemeralSecretKey = 0;
  }
  [v11 encodeObject:ppidEncryptionEphemeralSecretKey forKey:@"ppidEncryptionEphemeralSecretKey"];
  if (self)
  {
    [v11 encodeObject:self->_ppidFetchRequest forKey:@"ppidFetchRequest"];
    preTrackRequest = self->_preTrackRequest;
  }
  else
  {
    [v11 encodeObject:0 forKey:@"ppidFetchRequest"];
    preTrackRequest = 0;
  }
  [v11 encodeObject:preTrackRequest forKey:@"preTrackRequest"];
  if (self)
  {
    [v11 encodeInteger:self->_friendSideState forKey:@"friendSideState"];
    friendKeyIdentifier = self->_friendKeyIdentifier;
  }
  else
  {
    [v11 encodeInteger:0 forKey:@"friendSideState"];
    friendKeyIdentifier = 0;
  }
  [v11 encodeObject:friendKeyIdentifier forKey:@"friendKeyIdentifier"];
  if (self)
  {
    [v11 encodeObject:self->_invitationIdentifier forKey:@"invitationIdentifier"];
    unint64_t numberOfPinAttempts = self->_numberOfPinAttempts;
  }
  else
  {
    [v11 encodeObject:0 forKey:@"invitationIdentifier"];
    unint64_t numberOfPinAttempts = 0;
  }
  [v11 encodeInteger:numberOfPinAttempts forKey:@"numberOfPinAttempts"];
}

- (KmlSharingInvitationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)KmlSharingInvitationRecord;
  v5 = [(KmlSharingInvitationRecord *)&v32 init];
  v6 = v5;
  if (v5)
  {
    v5->_dirty = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerIdsIdentifier"];
    ownerIdsIdentifier = v6->_ownerIdsIdentifier;
    v6->_ownerIdsIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crossPlatformMailboxIdentifier"];
    crossPlatformMailboxIdentifier = v6->_crossPlatformMailboxIdentifier;
    v6->_crossPlatformMailboxIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationFromOwner"];
    invitationFromOwner = v6->_invitationFromOwner;
    v6->_invitationFromOwner = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bindingAttestation"];
    bindingAttestation = v6->_bindingAttestation;
    v6->_bindingAttestation = (NSData *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signingRequest"];
    signingRequest = v6->_signingRequest;
    v6->_signingRequest = (NSData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ppidEncryptionEphemeralPublicKey"];
    ppidEncryptionEphemeralPublicKey = v6->_ppidEncryptionEphemeralPublicKey;
    v6->_ppidEncryptionEphemeralPublicKey = (NSData *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ppidEncryptionEphemeralSecretKey"];
    ppidEncryptionEphemeralSecretKey = v6->_ppidEncryptionEphemeralSecretKey;
    v6->_ppidEncryptionEphemeralSecretKey = (NSData *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ppidFetchRequest"];
    ppidFetchRequest = v6->_ppidFetchRequest;
    v6->_ppidFetchRequest = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preTrackRequest"];
    preTrackRequest = v6->_preTrackRequest;
    v6->_preTrackRequest = (NSData *)v25;

    v6->_friendSideState = (int64_t)[v4 decodeIntegerForKey:@"friendSideState"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendKeyIdentifier"];
    friendKeyIdentifier = v6->_friendKeyIdentifier;
    v6->_friendKeyIdentifier = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationIdentifier"];
    invitationIdentifier = v6->_invitationIdentifier;
    v6->_invitationIdentifier = (NSString *)v29;

    v6->_unint64_t numberOfPinAttempts = (unint64_t)[v4 decodeIntegerForKey:@"numberOfPinAttempts"];
  }

  return v6;
}

- (KmlSharingInvitationRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)KmlSharingInvitationRecord;
  result = [(KmlSharingInvitationRecord *)&v3 init];
  if (result) {
    result->_dirty = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[KmlSharingInvitationRecord allocWithZone:](KmlSharingInvitationRecord, "allocWithZone:") init];
  if (v5)
  {
    v6 = (NSUUID *)[(NSUUID *)self->_uuid copyWithZone:a3];
    uuid = v5->_uuid;
    v5->_uuid = v6;

    v8 = (NSString *)[(NSString *)self->_ownerIdsIdentifier copyWithZone:a3];
    ownerIdsIdentifier = v5->_ownerIdsIdentifier;
    v5->_ownerIdsIdentifier = v8;

    v10 = (NSString *)[(NSString *)self->_crossPlatformMailboxIdentifier copyWithZone:a3];
    crossPlatformMailboxIdentifier = v5->_crossPlatformMailboxIdentifier;
    v5->_crossPlatformMailboxIdentifier = v10;

    v12 = (NSData *)[(NSData *)self->_invitationFromOwner copyWithZone:a3];
    invitationFromOwner = v5->_invitationFromOwner;
    v5->_invitationFromOwner = v12;

    v5->_friendSideState = self->_friendSideState;
    v14 = (NSString *)[(NSString *)self->_friendKeyIdentifier copyWithZone:a3];
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = v14;

    v16 = (NSString *)[(NSString *)self->_invitationIdentifier copyWithZone:a3];
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = v16;

    v18 = (NSData *)[(NSData *)self->_bindingAttestation copyWithZone:a3];
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = v18;

    v20 = (NSData *)[(NSData *)self->_signingRequest copyWithZone:a3];
    signingRequest = v5->_signingRequest;
    v5->_signingRequest = v20;

    v22 = (NSData *)[(NSData *)self->_ppidEncryptionEphemeralPublicKey copyWithZone:a3];
    ppidEncryptionEphemeralPublicKey = v5->_ppidEncryptionEphemeralPublicKey;
    v5->_ppidEncryptionEphemeralPublicKey = v22;

    v24 = (NSData *)[(NSData *)self->_ppidEncryptionEphemeralSecretKey copyWithZone:a3];
    ppidEncryptionEphemeralSecretKey = v5->_ppidEncryptionEphemeralSecretKey;
    v5->_ppidEncryptionEphemeralSecretKey = v24;

    v26 = (NSData *)[(NSData *)self->_ppidFetchRequest copyWithZone:a3];
    ppidFetchRequest = v5->_ppidFetchRequest;
    v5->_ppidFetchRequest = v26;

    v28 = (NSData *)[(NSData *)self->_preTrackRequest copyWithZone:a3];
    preTrackRequest = v5->_preTrackRequest;
    v5->_preTrackRequest = v28;

    v5->_unint64_t numberOfPinAttempts = self->_numberOfPinAttempts;
  }
  return v5;
}

- (id)description
{
  objc_super v3 = +[NSMutableString string];
  id v4 = +[NSString stringWithFormat:@"UUID                  : %@\n", self->_uuid];
  [v3 appendString:v4];

  v5 = +[NSString stringWithFormat:@"OwnerIdsIdentifier    : %@\n", self->_ownerIdsIdentifier];
  [v3 appendString:v5];

  NSUInteger v6 = [(NSString *)self->_crossPlatformMailboxIdentifier length];
  if (v6 < 9)
  {
    uint64_t v7 = &stru_100421848;
  }
  else
  {
    uint64_t v7 = [(NSString *)self->_crossPlatformMailboxIdentifier substringToIndex:4];
  }
  v8 = +[NSString stringWithFormat:@"MailboxIdentifier     : %@\n", v7];
  [v3 appendString:v8];

  if (v6 >= 9) {
  uint64_t v9 = +[NSString stringWithFormat:@"InvitationIdentifier  : %@\n", self->_invitationIdentifier];
  }
  [v3 appendString:v9];

  v10 = +[NSString stringWithFormat:@"FriendKeyIdentifier   : %@", self->_friendKeyIdentifier];
  [v3 appendString:v10];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_preTrackRequest, 0);
  objc_storeStrong((id *)&self->_ppidFetchRequest, 0);
  objc_storeStrong((id *)&self->_ppidEncryptionEphemeralSecretKey, 0);
  objc_storeStrong((id *)&self->_ppidEncryptionEphemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_signingRequest, 0);
  objc_storeStrong((id *)&self->_bindingAttestation, 0);
  objc_storeStrong((id *)&self->_invitationFromOwner, 0);
  objc_storeStrong((id *)&self->_crossPlatformMailboxIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerIdsIdentifier, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end