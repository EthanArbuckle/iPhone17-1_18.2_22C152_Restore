@interface STRootViewModel
+ (id)keyPathsForValuesAffectingCanEditScreenTimePasscode;
+ (id)keyPathsForValuesAffectingCanSetUpFamily;
+ (id)keyPathsForValuesAffectingCanSignIn;
+ (id)keyPathsForValuesAffectingCanStartScreenTime;
+ (id)keyPathsForValuesAffectingCanStopScreenTime;
+ (id)keyPathsForValuesAffectingCanStopSharingScreenTime;
+ (id)keyPathsForValuesAffectingCanToggleCloudSyncData;
+ (id)keyPathsForValuesAffectingCanToggleWebsiteData;
+ (id)keyPathsForValuesAffectingCanViewAskForTimeRequests;
+ (id)keyPathsForValuesAffectingForceParentalControls;
+ (id)keyPathsForValuesAffectingHasWatchOSDevices;
+ (id)keyPathsForValuesAffectingHasWatchOSDevicesOnly;
+ (id)keyPathsForValuesAffectingIsLocalOrRemotelyManagedUser;
+ (id)keyPathsForValuesAffectingIsLocalOrRemotelyManagedUserWithScreenTimeDisabled;
+ (id)keyPathsForValuesAffectingIsRemoteUnmanagedChild;
+ (id)keyPathsForValuesAffectingIsRemotelyManagedUserWithPasscode;
+ (id)keyPathsForValuesAffectingIsSharingUsageData;
+ (id)keyPathsForValuesAffectingScreenTimeEnabled;
+ (id)keyPathsForValuesAffectingWebUsageEnabled;
- (BOOL)canEditScreenTimePasscode;
- (BOOL)canSetUpFamily;
- (BOOL)canSignIn;
- (BOOL)canStartScreenTime;
- (BOOL)canStopScreenTime;
- (BOOL)canStopScreenTimeWithoutPasscode;
- (BOOL)canStopSharingScreenTime;
- (BOOL)canToggleCloudSyncData;
- (BOOL)canToggleWebsiteData;
- (BOOL)canViewAskForTimeRequests;
- (BOOL)forceParentalControls;
- (BOOL)hasWatchOSDevicesInternal;
- (BOOL)hasWatchOSDevicesOnlyInternal;
- (BOOL)isCloudSyncEnabled;
- (BOOL)isCommunicationSafetyAnalyticsEnabled;
- (BOOL)isCommunicationSafetyNotificationEnabled;
- (BOOL)isCommunicationSafetyReceivingRestricted;
- (BOOL)isCommunicationSafetySendingRestricted;
- (BOOL)isLocalOrRemotelyManagedUser;
- (BOOL)isLocalOrRemotelyManagedUserWithScreenTimeDisabled;
- (BOOL)isRemoteUnmanagedChild;
- (BOOL)isRemotelyManagedUserWithPasscode;
- (BOOL)isScreenTimeEnabled;
- (BOOL)isSharingUsageData;
- (BOOL)isWebUsageEnabled;
- (BOOL)shouldShowCompatibilityAlerts;
- (NSArray)children;
- (NSArray)devices;
- (NSDictionary)installedBundleIDsByCategoryIdentifier;
- (NSSet)installedBundleIDs;
- (STRootViewModel)init;
- (STUIUser)me;
- (void)setCanStopScreenTimeWithoutPasscode:(BOOL)a3;
- (void)setChildren:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHasWatchOSDevicesInternal:(BOOL)a3;
- (void)setHasWatchOSDevicesOnlyInternal:(BOOL)a3;
- (void)setInstalledBundleIDs:(id)a3;
- (void)setInstalledBundleIDsByCategoryIdentifier:(id)a3;
- (void)setIsCloudSyncEnabled:(BOOL)a3;
- (void)setMe:(id)a3;
@end

@implementation STRootViewModel

- (STRootViewModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)STRootViewModel;
  v2 = [(STRootViewModel *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    me = v2->_me;
    v2->_me = (STUIUser *)v3;

    children = v2->_children;
    v2->_children = (NSArray *)MEMORY[0x263EFFA68];

    uint64_t v6 = objc_opt_new();
    installedBundleIDs = v2->_installedBundleIDs;
    v2->_installedBundleIDs = (NSSet *)v6;

    installedBundleIDsByCategoryIdentifier = v2->_installedBundleIDsByCategoryIdentifier;
    v2->_installedBundleIDsByCategoryIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v2;
}

+ (id)keyPathsForValuesAffectingScreenTimeEnabled
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"me.screenTimeEnabled"];
}

- (BOOL)isScreenTimeEnabled
{
  v2 = [(STRootViewModel *)self me];
  char v3 = [v2 isScreenTimeEnabled];

  return v3;
}

+ (id)keyPathsForValuesAffectingCanStartScreenTime
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", @"me.screenTimeEnabled", 0);
}

- (BOOL)canStartScreenTime
{
  char v3 = [(STRootViewModel *)self me];
  if (([v3 isRemoteUser] & 1) != 0 || (unint64_t)objc_msgSend(v3, "type") <= 7) {
    char v2 = [v3 isScreenTimeEnabled] ^ 1;
  }

  return v2 & 1;
}

+ (id)keyPathsForValuesAffectingCanStopScreenTime
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.remoteUser", @"me.type", @"me.screenTimeEnabled", @"me.managed", 0);
}

- (BOOL)canStopScreenTime
{
  char v3 = [(STRootViewModel *)self me];
  if ([v3 isRemoteUser] || (unint64_t v4 = objc_msgSend(v3, "type"), v4 < 5))
  {
    char v2 = [v3 isScreenTimeEnabled];
  }
  else if (v4 - 5 < 3)
  {
    if ([v3 isScreenTimeEnabled]) {
      char v2 = [v3 isManaged] ^ 1;
    }
    else {
      char v2 = 0;
    }
  }

  return v2 & 1;
}

+ (id)keyPathsForValuesAffectingCanStopSharingScreenTime
{
  int v2 = _os_feature_enabled_impl();
  char v3 = @"me.screenTimeEnabled";
  if (v2) {
    char v3 = @"me.managed";
  }
  unint64_t v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", v3, 0);

  return v4;
}

- (BOOL)canStopSharingScreenTime
{
  int v2 = [(STRootViewModel *)self me];
  if (!_os_feature_enabled_impl())
  {
    if ([v2 isScreenTimeEnabled] && (objc_msgSend(v2, "isRemoteUser") & 1) == 0)
    {
      char v4 = [v2 type] == 5;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (![v2 isManaged])
  {
LABEL_8:
    char v4 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = [v2 type];
  if (v3 >= 5 && v3 - 6 >= 2) {
    char v4 = 1;
  }
  else {
    char v4 = [v2 isRemoteUser];
  }
LABEL_9:

  return v4;
}

+ (id)keyPathsForValuesAffectingIsSharingUsageData
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", @"me.screenTimeEnabled", @"me.managed", 0);
}

- (BOOL)isSharingUsageData
{
  int v2 = [(STRootViewModel *)self me];
  if (![v2 isScreenTimeEnabled]
    || ([v2 isRemoteUser] & 1) != 0
    || (unint64_t)([v2 type] - 5) > 2)
  {
    char v3 = 0;
  }
  else
  {
    char v3 = [v2 isManaged];
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingWebUsageEnabled
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"me.webUsageEnabled"];
}

- (BOOL)isWebUsageEnabled
{
  int v2 = [(STRootViewModel *)self me];
  char v3 = [v2 isWebUsageEnabled];

  return v3;
}

+ (id)keyPathsForValuesAffectingIsRemoteUnmanagedChild
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", @"me.managed", 0);
}

- (BOOL)isRemoteUnmanagedChild
{
  int v2 = [(STRootViewModel *)self me];
  if (([v2 type] & 0xFFFFFFFFFFFFFFFELL) == 6 && objc_msgSend(v2, "isRemoteUser")) {
    int v3 = [v2 isManaged] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingIsLocalOrRemotelyManagedUser
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.remoteUser", @"me.managed", 0);
}

- (BOOL)isLocalOrRemotelyManagedUser
{
  int v2 = [(STRootViewModel *)self me];
  if ([v2 isRemoteUser])
  {
    if ([v2 isRemoteUser]) {
      char v3 = [v2 isManaged];
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingIsLocalOrRemotelyManagedUserWithScreenTimeDisabled
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.remoteUser", @"me.managed", @"me.screenTimeEnabled", 0);
}

- (BOOL)isLocalOrRemotelyManagedUserWithScreenTimeDisabled
{
  int v2 = [(STRootViewModel *)self me];
  if ([v2 isScreenTimeEnabled]) {
    goto LABEL_2;
  }
  if (![v2 isRemoteUser])
  {
    char v3 = 1;
    goto LABEL_7;
  }
  if (![v2 isRemoteUser]) {
LABEL_2:
  }
    char v3 = 0;
  else {
    char v3 = [v2 isManaged];
  }
LABEL_7:

  return v3;
}

+ (id)keyPathsForValuesAffectingIsRemotelyManagedUserWithPasscode
{
  if (_os_feature_enabled_impl()) {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", @"me.managed", @"me.hasPasscode", 0, v4);
  }
  else {
  int v2 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", @"me.screenTimeEnabled", @"me.managed", @"me.hasPasscode", 0);
  }

  return v2;
}

- (BOOL)isRemotelyManagedUserWithPasscode
{
  int v2 = [(STRootViewModel *)self me];
  if (_os_feature_enabled_impl())
  {
    if (([v2 isRemoteUser] & 1) == 0)
    {
LABEL_9:
      char v3 = 0;
      goto LABEL_10;
    }
  }
  else if (![v2 isScreenTimeEnabled] || !objc_msgSend(v2, "isRemoteUser"))
  {
    goto LABEL_9;
  }
  if ((unint64_t)([v2 type] - 5) > 2 || !objc_msgSend(v2, "isManaged")) {
    goto LABEL_9;
  }
  char v3 = [v2 hasPasscode];
LABEL_10:

  return v3;
}

+ (id)keyPathsForValuesAffectingCanSignIn
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", 0);
}

- (BOOL)canSignIn
{
  int v2 = [(STRootViewModel *)self me];
  BOOL v3 = (_os_feature_enabled_impl() || [v2 isScreenTimeEnabled])
    && ([v2 isRemoteUser] & 1) == 0
    && (unint64_t)([v2 type] - 8) < 0xFFFFFFFFFFFFFFF9;

  return v3;
}

+ (id)keyPathsForValuesAffectingCanToggleCloudSyncData
{
  if (_os_feature_enabled_impl()) {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", 0, v4);
  }
  else {
  int v2 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", @"me.screenTimeEnabled", 0);
  }

  return v2;
}

- (BOOL)canToggleCloudSyncData
{
  int v2 = [(STRootViewModel *)self me];
  if ((_os_feature_enabled_impl() || [v2 isScreenTimeEnabled])
    && ([v2 isRemoteUser] & 1) == 0)
  {
    unint64_t v4 = [v2 type];
    if (v4 <= 7) {
      unsigned int v3 = (0xFEu >> v4) & 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingCanEditScreenTimePasscode
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.remoteUser", @"me.type", @"me.managed", 0);
}

- (BOOL)canEditScreenTimePasscode
{
  int v2 = [(STRootViewModel *)self me];
  if ([v2 isRemoteUser])
  {
    LOBYTE(v3) = [v2 isManaged];
  }
  else if ((unint64_t)([v2 type] - 5) > 2)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = [v2 isManaged] ^ 1;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingCanSetUpFamily
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", 0);
}

- (BOOL)canSetUpFamily
{
  int v2 = [(STRootViewModel *)self me];
  BOOL v3 = (_os_feature_enabled_impl() || [v2 isScreenTimeEnabled])
    && ([v2 isRemoteUser] & 1) == 0
    && [v2 type] == 1;

  return v3;
}

+ (id)keyPathsForValuesAffectingCanViewAskForTimeRequests
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"screenTimeEnabled", @"me.remoteUser", 0);
}

- (BOOL)canViewAskForTimeRequests
{
  BOOL v3 = [(STRootViewModel *)self isScreenTimeEnabled];
  if (v3)
  {
    unint64_t v4 = [(STRootViewModel *)self me];
    char v5 = [v4 isRemoteUser];

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingForceParentalControls
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.isRemoteUser", @"me.type", 0);
}

- (BOOL)forceParentalControls
{
  int v2 = [(STRootViewModel *)self me];
  if ([v2 isRemoteUser]) {
    BOOL v3 = ([v2 type] & 0xFFFFFFFFFFFFFFFELL) == 6;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingCanToggleWebsiteData
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"me.type", @"me.remoteUser", @"me.screenTimeEnabled", 0);
}

- (BOOL)canToggleWebsiteData
{
  int v2 = [(STRootViewModel *)self me];
  BOOL v3 = [v2 isScreenTimeEnabled]
    && [v2 isRemoteUser]
    && (unint64_t)([v2 type] - 5) < 3;

  return v3;
}

- (BOOL)shouldShowCompatibilityAlerts
{
  BOOL v3 = [(STRootViewModel *)self me];
  if ([(STRootViewModel *)self isCloudSyncEnabled]
    || [v3 isRemoteUser])
  {
    unint64_t v4 = [v3 dsid];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingHasWatchOSDevices
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"devices"];
}

+ (id)keyPathsForValuesAffectingHasWatchOSDevicesOnly
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"devices"];
}

- (BOOL)canStopScreenTimeWithoutPasscode
{
  return self->_canStopScreenTimeWithoutPasscode;
}

- (void)setCanStopScreenTimeWithoutPasscode:(BOOL)a3
{
  self->_canStopScreenTimeWithoutPasscode = a3;
}

- (BOOL)isCloudSyncEnabled
{
  return self->_isCloudSyncEnabled;
}

- (void)setIsCloudSyncEnabled:(BOOL)a3
{
  self->_isCloudSyncEnabled = a3;
}

- (NSSet)installedBundleIDs
{
  return self->_installedBundleIDs;
}

- (void)setInstalledBundleIDs:(id)a3
{
}

- (NSDictionary)installedBundleIDsByCategoryIdentifier
{
  return self->_installedBundleIDsByCategoryIdentifier;
}

- (void)setInstalledBundleIDsByCategoryIdentifier:(id)a3
{
}

- (STUIUser)me
{
  return self->_me;
}

- (void)setMe:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  return self->_isCommunicationSafetyReceivingRestricted;
}

- (BOOL)isCommunicationSafetySendingRestricted
{
  return self->_isCommunicationSafetySendingRestricted;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  return self->_isCommunicationSafetyNotificationEnabled;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  return self->_isCommunicationSafetyAnalyticsEnabled;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (BOOL)hasWatchOSDevicesInternal
{
  return self->_hasWatchOSDevicesInternal;
}

- (void)setHasWatchOSDevicesInternal:(BOOL)a3
{
  self->_hasWatchOSDevicesInternal = a3;
}

- (BOOL)hasWatchOSDevicesOnlyInternal
{
  return self->_hasWatchOSDevicesOnlyInternal;
}

- (void)setHasWatchOSDevicesOnlyInternal:(BOOL)a3
{
  self->_hasWatchOSDevicesOnlyInternal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_installedBundleIDsByCategoryIdentifier, 0);

  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
}

@end