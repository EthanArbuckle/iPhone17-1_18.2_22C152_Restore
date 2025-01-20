@interface STUIUser
+ (id)keyPathsForValuesAffectingGivenName;
+ (id)keyPathsForValuesAffectingHasPasscode;
+ (unint64_t)userTypeFromUser:(id)a3;
- (BOOL)canRecoveryAuthenticate;
- (BOOL)hasAllowances;
- (BOOL)hasDeviceWithoutUsageReported;
- (BOOL)hasPasscode;
- (BOOL)isChild;
- (BOOL)isManaged;
- (BOOL)isParent;
- (BOOL)isRemoteUser;
- (BOOL)isScreenTimeEnabled;
- (BOOL)isWebUsageEnabled;
- (BOOL)needsRecoveryAppleID;
- (NSArray)devices;
- (NSManagedObjectID)userObjectID;
- (NSNumber)dsid;
- (NSString)altDSID;
- (NSString)givenName;
- (NSString)name;
- (NSString)passcode;
- (NSString)recoveryAltDSID;
- (STUIUser)initWithUser:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)source;
- (unint64_t)type;
- (void)setAltDSID:(id)a3;
- (void)setDevices:(id)a3;
- (void)setDsid:(id)a3;
- (void)setHasAllowances:(BOOL)a3;
- (void)setHasDeviceWithoutUsageReported:(BOOL)a3;
- (void)setManaged:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPasscode:(id)a3;
- (void)setRecoveryAltDSID:(id)a3;
- (void)setRemoteUser:(BOOL)a3;
- (void)setScreenTimeEnabled:(BOOL)a3;
- (void)setSource:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserObjectID:(id)a3;
- (void)setWebUsageEnabled:(BOOL)a3;
@end

@implementation STUIUser

- (STUIUser)initWithUser:(id)a3
{
  id v4 = a3;
  v5 = [(STUIUser *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectID];
    userObjectID = v5->_userObjectID;
    v5->_userObjectID = (NSManagedObjectID *)v6;

    v5->_type = +[STUIUser userTypeFromUser:v4];
    v8 = [v4 localUserDeviceState];
    v5->_remoteUser = v8 == 0;

    if (v5->_remoteUser)
    {
      uint64_t v9 = 1;
    }
    else
    {
      v10 = [v4 familySettings];
      unsigned int v11 = [v10 isManaged];

      uint64_t v9 = v11;
    }
    v5->_source = v9;
    v12 = objc_opt_new();
    v13 = [v4 givenName];
    [v12 setGivenName:v13];

    v14 = [v4 familyName];
    [v12 setFamilyName:v14];

    uint64_t v15 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v12 style:0 options:0];
    name = v5->_name;
    v5->_name = (NSString *)v15;

    uint64_t v17 = [v4 dsid];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v17;

    uint64_t v19 = [v4 altDSID];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v19;

    uint64_t v21 = [v4 effectivePasscode];
    passcode = v5->_passcode;
    v5->_passcode = (NSString *)v21;

    v23 = [v4 effectiveRecoveryAltDSID];
    uint64_t v24 = [v23 copy];
    recoveryAltDSID = v5->_recoveryAltDSID;
    v5->_recoveryAltDSID = (NSString *)v24;

    v5->_screenTimeEnabled = [v4 screenTimeEnabled];
    v5->_webUsageEnabled = [v4 shareWebUsage];
    v5->_managed = [v4 isManaged];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(STUIUser *)self name];
  uint64_t v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  uint64_t v7 = [(STUIUser *)self dsid];
  v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  uint64_t v9 = [(STUIUser *)self altDSID];
  v10 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v9;

  *(unsigned char *)(v4 + 11) = [(STUIUser *)self isRemoteUser];
  *(unsigned char *)(v4 + 8) = [(STUIUser *)self isScreenTimeEnabled];
  *(unsigned char *)(v4 + 10) = [(STUIUser *)self isWebUsageEnabled];
  *(void *)(v4 + 48) = [(STUIUser *)self type];
  unsigned int v11 = [(STUIUser *)self passcode];
  uint64_t v12 = [v11 copy];
  v13 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v12;

  v14 = [(STUIUser *)self recoveryAltDSID];
  uint64_t v15 = [v14 copy];
  v16 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v15;

  *(unsigned char *)(v4 + 12) = [(STUIUser *)self hasAllowances];
  *(void *)(v4 + 16) = [(STUIUser *)self source];
  uint64_t v17 = [(STUIUser *)self userObjectID];
  v18 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v17;

  *(unsigned char *)(v4 + 9) = [(STUIUser *)self isManaged];
  return (id)v4;
}

+ (id)keyPathsForValuesAffectingHasPasscode
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"passcode"];
}

- (BOOL)hasPasscode
{
  v2 = [(STUIUser *)self passcode];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)needsRecoveryAppleID
{
  if ([(STUIUser *)self type] - 8 > 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  BOOL v3 = [(STUIUser *)self recoveryAltDSID];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)canRecoveryAuthenticate
{
  BOOL v3 = [(STUIUser *)self recoveryAltDSID];

  if ([(STUIUser *)self isChild] || ![(STUIUser *)self type])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v4 = [(STUIUser *)self altDSID];
    BOOL v5 = v4 != 0;
  }
  return v3 || v5;
}

+ (unint64_t)userTypeFromUser:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 dsid];
  if (v4
    && (BOOL v5 = (void *)v4,
        [v3 dsid],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToNumber:&unk_26D9671B0],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    uint64_t v9 = [v3 familyMemberType];
    if ([v9 isEqualToString:*MEMORY[0x263F67310]])
    {
      v10 = [v3 familySettings];
      char v11 = [v10 isManaged];

      if (v11)
      {
        unint64_t v8 = 5;
      }
      else if ([v3 isFamilyOrganizer])
      {
        unint64_t v8 = 2;
      }
      else if ([v3 isParent])
      {
        unint64_t v8 = 3;
      }
      else
      {
        unint64_t v8 = 4;
      }
    }
    else if ([v9 isEqualToString:*MEMORY[0x263F67320]])
    {
      unint64_t v8 = 6;
    }
    else if ([v9 isEqualToString:*MEMORY[0x263F67318]])
    {
      unint64_t v8 = 7;
    }
    else
    {
      unint64_t v8 = 1;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isParent
{
  return ([(STUIUser *)self type] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isChild
{
  return [(STUIUser *)self type] - 5 < 3;
}

+ (id)keyPathsForValuesAffectingGivenName
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"name"];
}

- (NSString)givenName
{
  v2 = [(STUIUser *)self name];
  if (v2)
  {
    id v3 = objc_opt_new();
    uint64_t v4 = [v3 personNameComponentsFromString:v2];

    BOOL v5 = [v4 givenName];
    if (![v5 length])
    {

      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSString *)v5;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (BOOL)isScreenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  self->_screenTimeEnabled = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (BOOL)isWebUsageEnabled
{
  return self->_webUsageEnabled;
}

- (void)setWebUsageEnabled:(BOOL)a3
{
  self->_webUsageEnabled = a3;
}

- (BOOL)isRemoteUser
{
  return self->_remoteUser;
}

- (void)setRemoteUser:(BOOL)a3
{
  self->_remoteUser = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)hasAllowances
{
  return self->_hasAllowances;
}

- (void)setHasAllowances:(BOOL)a3
{
  self->_hasAllowances = a3;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (NSString)recoveryAltDSID
{
  return self->_recoveryAltDSID;
}

- (void)setRecoveryAltDSID:(id)a3
{
}

- (BOOL)hasDeviceWithoutUsageReported
{
  return self->_hasDeviceWithoutUsageReported;
}

- (void)setHasDeviceWithoutUsageReported:(BOOL)a3
{
  self->_hasDeviceWithoutUsageReported = a3;
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_recoveryAltDSID, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end