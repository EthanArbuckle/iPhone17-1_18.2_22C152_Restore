@interface DMDiphoneOSDeviceController
- (id)bluetoothAddress;
- (id)buildVersion;
- (id)deviceName;
- (id)deviceType;
- (id)iTunesStoreAccountHash;
- (id)iTunesStoreAccountIsActive;
- (id)isAppleInternal;
- (id)isAwaitingConfiguration;
- (id)isInSingleAppMode;
- (id)isSupervised;
- (id)lastCloudBackupDate;
- (id)marketingName;
- (id)model;
- (id)modelName;
- (id)osVersion;
- (id)productName;
- (id)serialNumber;
- (id)uniqueIdentifier;
- (id)wifiAddress;
@end

@implementation DMDiphoneOSDeviceController

- (id)bluetoothAddress
{
  return +[DMDMobileGestalt bluetoothAddress];
}

- (id)buildVersion
{
  return +[DMDMobileGestalt buildVersion];
}

- (id)deviceName
{
  return +[DMDMobileGestalt userAssignedDeviceName];
}

- (id)deviceType
{
  unint64_t v2 = +[DMDMobileGestalt deviceType];

  return +[NSNumber numberWithUnsignedInteger:v2];
}

- (id)isAppleInternal
{
  BOOL v2 = +[DMDMobileGestalt hasAppleInternalInstallCapability];

  return +[NSNumber numberWithBool:v2];
}

- (id)isAwaitingConfiguration
{
  BOOL v2 = +[MCCloudConfiguration sharedConfiguration];
  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 isAwaitingConfiguration]);

  return v3;
}

- (id)isInSingleAppMode
{
  uint64_t v2 = MCIsEffectivelyInAppWhitelistMode();

  return +[NSNumber numberWithBool:v2];
}

- (id)iTunesStoreAccountHash
{
  uint64_t v2 = +[SSAccountStore defaultStore];
  v3 = [v2 activeAccount];
  v4 = [v3 uniqueIdentifier];
  v5 = +[DMDMDMUtilities iTunesAccountHashForUniqueIdentifier:v4];

  return v5;
}

- (id)iTunesStoreAccountIsActive
{
  uint64_t v2 = +[SSAccountStore defaultStore];
  v3 = [v2 activeAccount];
  if (v3) {
    v4 = &__kCFBooleanTrue;
  }
  else {
    v4 = &__kCFBooleanFalse;
  }
  id v5 = v4;

  return v5;
}

- (id)marketingName
{
  return +[DMDMobileGestalt marketingName];
}

- (id)model
{
  return +[DMDMobileGestalt modelNumber];
}

- (id)modelName
{
  return +[DMDMobileGestalt deviceClass];
}

- (id)osVersion
{
  return +[DMDMobileGestalt productVersion];
}

- (id)productName
{
  return +[DMDMobileGestalt productType];
}

- (id)serialNumber
{
  return +[DMDMobileGestalt serialNumber];
}

- (id)wifiAddress
{
  return +[DMDMobileGestalt wifiAddress];
}

- (id)isSupervised
{
  uint64_t v2 = +[MCCloudConfiguration sharedConfiguration];
  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 isSupervised]);

  return v3;
}

- (id)lastCloudBackupDate
{
  return +[DMDLockdownUtilities deviceLastCloudBackupDate];
}

- (id)uniqueIdentifier
{
  return +[DMDMobileGestalt uniqueDeviceID];
}

@end