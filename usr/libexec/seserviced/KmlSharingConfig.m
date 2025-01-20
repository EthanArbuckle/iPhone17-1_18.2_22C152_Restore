@interface KmlSharingConfig
+ (BOOL)supportsSecureCoding;
- (KmlSharingConfig)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KmlSharingConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  if (self)
  {
    [v13 encodeObject:self->_uuid forKey:@"uuid"];
    toIdsIdentifier = self->_toIdsIdentifier;
  }
  else
  {
    [v13 encodeObject:0 forKey:@"uuid"];
    toIdsIdentifier = 0;
  }
  [v13 encodeObject:toIdsIdentifier forKey:@"toIdsIdentifier"];
  if (self)
  {
    [v13 encodeObject:self->_crossPlatformRemoteIdentifier forKey:@"crossPlatformRemoteIdentifier"];
    crossPlatformMailboxIdentifier = self->_crossPlatformMailboxIdentifier;
  }
  else
  {
    [v13 encodeObject:0 forKey:@"crossPlatformRemoteIdentifier"];
    crossPlatformMailboxIdentifier = 0;
  }
  [v13 encodeObject:crossPlatformMailboxIdentifier forKey:@"crossPlatformMailboxIdentifier"];
  if (self)
  {
    [v13 encodeInteger:self->_profile forKey:@"profile"];
    [v13 encodeInteger:self->_keyRole forKey:@"keyRole"];
    [v13 encodeInteger:self->_targetDeviceType forKey:@"targetDeviceType"];
    [v13 encodeInteger:self->_ownerSideState forKey:@"ownerSideState"];
    [v13 encodeInteger:self->_immoTokenLength forKey:@"immoTokenLength"];
    [v13 encodeInteger:self->_immoTokenOffset forKey:@"immoTokenOffset"];
    slotIdentifier = self->_slotIdentifier;
  }
  else
  {
    [v13 encodeInteger:0 forKey:@"profile"];
    [v13 encodeInteger:0 forKey:@"keyRole"];
    [v13 encodeInteger:0 forKey:@"targetDeviceType"];
    [v13 encodeInteger:0 forKey:@"ownerSideState"];
    [v13 encodeInteger:0 forKey:@"immoTokenLength"];
    [v13 encodeInteger:0 forKey:@"immoTokenOffset"];
    slotIdentifier = 0;
  }
  [v13 encodeObject:slotIdentifier forKey:@"slotIdentifier"];
  if (self)
  {
    [v13 encodeInteger:self->_slotIdentifierIndex forKey:@"slotIdentifierIndex"];
    [v13 encodeInteger:self->_slotIdentifierSize forKey:@"slotIdentifierSize"];
    [v13 encodeInteger:self->_slotIdentifierOffset forKey:@"slotIdentifierOffset"];
    entitlementsInASN1 = self->_entitlementsInASN1;
  }
  else
  {
    [v13 encodeInteger:0 forKey:@"slotIdentifierIndex"];
    [v13 encodeInteger:0 forKey:@"slotIdentifierSize"];
    [v13 encodeInteger:0 forKey:@"slotIdentifierOffset"];
    entitlementsInASN1 = 0;
  }
  [v13 encodeObject:entitlementsInASN1 forKey:@"entitlements"];
  if (self)
  {
    [v13 encodeObject:self->_friendKeyIdentifier forKey:@"friendKeyIdentifier"];
    invitationIdentifier = self->_invitationIdentifier;
  }
  else
  {
    [v13 encodeObject:0 forKey:@"friendKeyIdentifier"];
    invitationIdentifier = 0;
  }
  [v13 encodeObject:invitationIdentifier forKey:@"invitationIdentifier"];
  if (self)
  {
    [v13 encodeObject:self->_authorizationId forKey:@"authorizationId"];
    displayName = self->_displayName;
  }
  else
  {
    [v13 encodeObject:0 forKey:@"authorizationId"];
    displayName = 0;
  }
  [v13 encodeObject:displayName forKey:@"displayName"];
  if (self)
  {
    [v13 encodeBool:self->_enableVehicleEnteredPasscode forKey:@"enableVehicleEnteredPasscode"];
    vehicleEnteredPasscode = self->_vehicleEnteredPasscode;
  }
  else
  {
    [v13 encodeBool:0 forKey:@"enableVehicleEnteredPasscode"];
    vehicleEnteredPasscode = 0;
  }
  [v13 encodeObject:vehicleEnteredPasscode forKey:@"vehicleEnteredPasscode"];
  if (self)
  {
    [v13 encodeObject:self->_passcodeSeed forKey:@"passcodeSeed"];
    deviceEnteredPasscode = self->_deviceEnteredPasscode;
  }
  else
  {
    [v13 encodeObject:0 forKey:@"passcodeSeed"];
    deviceEnteredPasscode = 0;
  }
  [v13 encodeObject:deviceEnteredPasscode forKey:@"deviceEnteredPasscode"];
  if (self)
  {
    [v13 encodeInteger:self->_depRetriesLeft forKey:@"depRetriesLeft"];
    [v13 encodeInteger:self->_maxDepRetriesAllowed forKey:@"maxDepRetriesAllowed"];
    BOOL mockRefreshInstanceCA = self->_mockRefreshInstanceCA;
  }
  else
  {
    [v13 encodeInteger:0 forKey:@"depRetriesLeft"];
    [v13 encodeInteger:0 forKey:@"maxDepRetriesAllowed"];
    BOOL mockRefreshInstanceCA = 0;
  }
  [v13 encodeBool:mockRefreshInstanceCA forKey:@"mockRefreshInstanceCA"];
}

- (KmlSharingConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)KmlSharingConfig;
  v5 = [(KmlSharingConfig *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toIdsIdentifier"];
    toIdsIdentifier = v5->_toIdsIdentifier;
    v5->_toIdsIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crossPlatformRemoteIdentifier"];
    crossPlatformRemoteIdentifier = v5->_crossPlatformRemoteIdentifier;
    v5->_crossPlatformRemoteIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crossPlatformMailboxIdentifier"];
    crossPlatformMailboxIdentifier = v5->_crossPlatformMailboxIdentifier;
    v5->_crossPlatformMailboxIdentifier = (NSString *)v12;

    v5->_profile = (unint64_t)[v4 decodeIntegerForKey:@"profile"];
    v5->_keyRole = (unint64_t)[v4 decodeIntegerForKey:@"keyRole"];
    v5->_targetDeviceType = (int64_t)[v4 decodeIntegerForKey:@"targetDeviceType"];
    v5->_ownerSideState = (int64_t)[v4 decodeIntegerForKey:@"ownerSideState"];
    v5->_immoTokenLength = [v4 decodeIntegerForKey:@"immoTokenLength"];
    v5->_immoTokenOffset = (unsigned __int16)[v4 decodeIntegerForKey:@"immoTokenOffset"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slotIdentifier"];
    slotIdentifier = v5->_slotIdentifier;
    v5->_slotIdentifier = (NSData *)v14;

    v5->_slotIdentifierIndex = [v4 decodeIntegerForKey:@"slotIdentifierIndex"];
    v5->_slotIdentifierSize = [v4 decodeIntegerForKey:@"slotIdentifierSize"];
    v5->_slotIdentifierOffset = [v4 decodeIntegerForKey:@"slotIdentifierOffset"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlements"];
    entitlementsInASN1 = v5->_entitlementsInASN1;
    v5->_entitlementsInASN1 = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendKeyIdentifier"];
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationIdentifier"];
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationId"];
    authorizationId = v5->_authorizationId;
    v5->_authorizationId = (NSData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v24;

    v5->_enableVehicleEnteredPasscode = [v4 decodeBoolForKey:@"enableVehicleEnteredPasscode"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleEnteredPasscode"];
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcodeSeed"];
    passcodeSeed = v5->_passcodeSeed;
    v5->_passcodeSeed = (NSData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceEnteredPasscode"];
    deviceEnteredPasscode = v5->_deviceEnteredPasscode;
    v5->_deviceEnteredPasscode = (NSString *)v30;

    v5->_depRetriesLeft = (unint64_t)[v4 decodeIntegerForKey:@"depRetriesLeft"];
    v5->_maxDepRetriesAllowed = (unint64_t)[v4 decodeIntegerForKey:@"maxDepRetriesAllowed"];
    v5->_BOOL mockRefreshInstanceCA = [v4 decodeBoolForKey:@"mockRefreshInstanceCA"];
  }

  return v5;
}

- (id)description
{
  v3 = +[NSMutableString string];
  id v4 = +[NSString stringWithFormat:@"UUID                  : %@\n", self->_uuid];
  [v3 appendString:v4];

  v5 = +[NSString stringWithFormat:@"FriendIdsIdentifier   : %@\n", self->_toIdsIdentifier];
  [v3 appendString:v5];

  uint64_t v6 = +[NSString stringWithFormat:@"XP FriendIdentifier   : %@\n", self->_crossPlatformRemoteIdentifier];
  [v3 appendString:v6];

  NSUInteger v7 = [(NSString *)self->_crossPlatformMailboxIdentifier length];
  if (v7 < 9)
  {
    uint64_t v8 = &stru_100421848;
  }
  else
  {
    uint64_t v8 = [(NSString *)self->_crossPlatformMailboxIdentifier substringToIndex:4];
  }
  v9 = +[NSString stringWithFormat:@"XP Mailbox Identifier : %@\n", v8];
  [v3 appendString:v9];

  if (v7 >= 9) {
  uint64_t v10 = +[NSString stringWithFormat:@"InvitationIdentifier  : %@\n", self->_invitationIdentifier];
  }
  [v3 appendString:v10];

  v11 = +[NSString stringWithFormat:@"FriendKeyIdentifier   : %@", self->_friendKeyIdentifier];
  [v3 appendString:v11];

  if (self->_enableVehicleEnteredPasscode) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  id v13 = +[NSString stringWithFormat:@"EnableVEP             : %@", v12];
  [v3 appendString:v13];

  uint64_t v14 = +[NSString stringWithFormat:@"VEP length            : %u", [(NSString *)self->_vehicleEnteredPasscode length]];
  [v3 appendString:v14];

  v15 = +[NSString stringWithFormat:@"PasscodeSeed length   : %u", [(NSData *)self->_passcodeSeed length]];
  [v3 appendString:v15];

  uint64_t v16 = +[NSString stringWithFormat:@"DEP : length - %u, Attempts/Max - %u / %u", [(NSString *)self->_deviceEnteredPasscode length], self->_maxDepRetriesAllowed - self->_depRetriesLeft, self->_maxDepRetriesAllowed];
  [v3 appendString:v16];

  if (self->_mockRefreshInstanceCA) {
    [v3 appendString:@"Mock Refresh Instance CA requested"];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_passcodeSeed, 0);
  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_entitlementsInTLV, 0);
  objc_storeStrong((id *)&self->_entitlementsInASN1, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationId, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_crossPlatformMailboxIdentifier, 0);
  objc_storeStrong((id *)&self->_crossPlatformRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_toIdsIdentifier, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end