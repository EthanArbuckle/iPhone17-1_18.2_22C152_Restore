@interface ISOPBSubscriptiondPetMessage
- (BOOL)buyLabel;
- (BOOL)hasAppLaunchCount2wMax;
- (BOOL)hasAppLaunchCount2wMedian;
- (BOOL)hasAppLaunchCountSameSlot;
- (BOOL)hasAvgWeeklyScreenTimeSeconds2w;
- (BOOL)hasBuyLabel;
- (BOOL)hasCameraAppLaunchCount1w;
- (BOOL)hasCameraLaunchCountSameSlot;
- (BOOL)hasDaemonVersion;
- (BOOL)hasDailyScreenTimeSeconds;
- (BOOL)hasDayOfWeek;
- (BOOL)hasDeviceModelName;
- (BOOL)hasDiskStorageCapacityBytes;
- (BOOL)hasDropboxAppLaunchCount1w;
- (BOOL)hasFilesAppLaunchCount1w;
- (BOOL)hasFilesLaunchCountSameSlot;
- (BOOL)hasGoogleDriveAppLaunchCount1w;
- (BOOL)hasGooglePhotoAppLaunchCount1w;
- (BOOL)hasHourOfDay;
- (BOOL)hasICloudNotificationUsageTypeTop1;
- (BOOL)hasICloudNotificationUsageTypeTop2;
- (BOOL)hasICloudNotificationUsageTypeTop3;
- (BOOL)hasIcloudNotificationActionLabel;
- (BOOL)hasIsDoNotDisturbOn;
- (BOOL)hasIsDoNotDisturbOnCount2w;
- (BOOL)hasIsDoNotDisturbOnSameSlot;
- (BOOL)hasIsDrivingModeOn;
- (BOOL)hasIsDrivingModeOnCount2w;
- (BOOL)hasIsDrivingModeOnSameSlot;
- (BOOL)hasIsSleepModeOn;
- (BOOL)hasIsSleepModeOnCount2w;
- (BOOL)hasIsSleepModeOnSameSlot;
- (BOOL)hasLabelMessage;
- (BOOL)hasLastOpenedAppHour24h;
- (BOOL)hasLastOpenedAppId24h;
- (BOOL)hasMinsSinceLastCameraAppLaunch1w;
- (BOOL)hasMinsSinceLastFilesAppLaunch1w;
- (BOOL)hasMinsSinceLastPhotosAppLaunch1w;
- (BOOL)hasMinsUntilICloudBuy;
- (BOOL)hasMinsUntilICloudNotificationOpened;
- (BOOL)hasMinsUntilICloudOpenedSubStream;
- (BOOL)hasMlServerScore;
- (BOOL)hasNotificationUsageTypeTop1;
- (BOOL)hasNotificationUsageTypeTop2;
- (BOOL)hasNotificationUsageTypeTop3;
- (BOOL)hasNumNotificationsSameSlot;
- (BOOL)hasNumOpenedNotificationsSameSlot;
- (BOOL)hasOBSOLETEDayOfWeek;
- (BOOL)hasOBSOLETETrafficType;
- (BOOL)hasOffsetMins;
- (BOOL)hasOpenLabelSubStream;
- (BOOL)hasOpenedICloudNotificationRatio1w;
- (BOOL)hasOpenedICloudNotificationRatio2w;
- (BOOL)hasOpenedNotificationCount2wMax;
- (BOOL)hasOpenedNotificationCount2wMedian;
- (BOOL)hasOpenedNotificationRatio1w;
- (BOOL)hasOpenedNotificationRatio24h;
- (BOOL)hasOsVersionMajorVersion;
- (BOOL)hasOsVersionMinorVersion;
- (BOOL)hasOsVersionPatchVersion;
- (BOOL)hasPhotosAppLaunchCount1w;
- (BOOL)hasPhotosLaunchCount2wMax;
- (BOOL)hasPhotosLaunchCount2wMedian;
- (BOOL)hasPhotosLaunchCountSameSlot;
- (BOOL)hasTimestampMillis;
- (BOOL)hasTotalNotificationCount1w;
- (BOOL)hasTotalNotificationCount2wMax;
- (BOOL)hasTotalNotificationCount2wMedian;
- (BOOL)hasTotalOpenedNotificationCount1w;
- (BOOL)hasTrafficType;
- (BOOL)hasUsedDiskCapacityBytes;
- (BOOL)hasUserTier;
- (BOOL)isDoNotDisturbOn;
- (BOOL)isDoNotDisturbOnSameSlot;
- (BOOL)isDrivingModeOn;
- (BOOL)isDrivingModeOnSameSlot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSleepModeOn;
- (BOOL)isSleepModeOnSameSlot;
- (BOOL)openLabelSubStream;
- (BOOL)readFrom:(id)a3;
- (ISOPBSubscriptionLabelMessage)labelMessage;
- (NSString)deviceModelName;
- (NSString)iCloudNotificationUsageTypeTop1;
- (NSString)iCloudNotificationUsageTypeTop2;
- (NSString)iCloudNotificationUsageTypeTop3;
- (NSString)lastOpenedAppId24h;
- (NSString)notificationUsageTypeTop1;
- (NSString)notificationUsageTypeTop2;
- (NSString)notificationUsageTypeTop3;
- (NSString)oBSOLETEDayOfWeek;
- (double)mlServerScore;
- (double)openedICloudNotificationRatio1w;
- (double)openedICloudNotificationRatio2w;
- (double)openedNotificationRatio1w;
- (double)openedNotificationRatio24h;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dayOfWeekAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)icloudNotificationActionLabelAsString:(int)a3;
- (id)oBSOLETETrafficTypeAsString:(int)a3;
- (id)trafficTypeAsString:(int)a3;
- (id)userTierAsString:(int)a3;
- (int)StringAsDayOfWeek:(id)a3;
- (int)StringAsIcloudNotificationActionLabel:(id)a3;
- (int)StringAsOBSOLETETrafficType:(id)a3;
- (int)StringAsTrafficType:(id)a3;
- (int)StringAsUserTier:(id)a3;
- (int)dayOfWeek;
- (int)hourOfDay;
- (int)icloudNotificationActionLabel;
- (int)oBSOLETETrafficType;
- (int)trafficType;
- (int)userTier;
- (int64_t)appLaunchCount2wMax;
- (int64_t)appLaunchCount2wMedian;
- (int64_t)appLaunchCountSameSlot;
- (int64_t)avgWeeklyScreenTimeSeconds2w;
- (int64_t)cameraAppLaunchCount1w;
- (int64_t)cameraLaunchCountSameSlot;
- (int64_t)daemonVersion;
- (int64_t)dailyScreenTimeSeconds;
- (int64_t)diskStorageCapacityBytes;
- (int64_t)dropboxAppLaunchCount1w;
- (int64_t)filesAppLaunchCount1w;
- (int64_t)filesLaunchCountSameSlot;
- (int64_t)googleDriveAppLaunchCount1w;
- (int64_t)googlePhotoAppLaunchCount1w;
- (int64_t)isDoNotDisturbOnCount2w;
- (int64_t)isDrivingModeOnCount2w;
- (int64_t)isSleepModeOnCount2w;
- (int64_t)lastOpenedAppHour24h;
- (int64_t)minsSinceLastCameraAppLaunch1w;
- (int64_t)minsSinceLastFilesAppLaunch1w;
- (int64_t)minsSinceLastPhotosAppLaunch1w;
- (int64_t)minsUntilICloudBuy;
- (int64_t)minsUntilICloudNotificationOpened;
- (int64_t)minsUntilICloudOpenedSubStream;
- (int64_t)numNotificationsSameSlot;
- (int64_t)numOpenedNotificationsSameSlot;
- (int64_t)offsetMins;
- (int64_t)openedNotificationCount2wMax;
- (int64_t)openedNotificationCount2wMedian;
- (int64_t)osVersionMajorVersion;
- (int64_t)osVersionMinorVersion;
- (int64_t)osVersionPatchVersion;
- (int64_t)photosAppLaunchCount1w;
- (int64_t)photosLaunchCount2wMax;
- (int64_t)photosLaunchCount2wMedian;
- (int64_t)photosLaunchCountSameSlot;
- (int64_t)timestampMillis;
- (int64_t)totalNotificationCount1w;
- (int64_t)totalNotificationCount2wMax;
- (int64_t)totalNotificationCount2wMedian;
- (int64_t)totalOpenedNotificationCount1w;
- (int64_t)usedDiskCapacityBytes;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLaunchCount2wMax:(int64_t)a3;
- (void)setAppLaunchCount2wMedian:(int64_t)a3;
- (void)setAppLaunchCountSameSlot:(int64_t)a3;
- (void)setAvgWeeklyScreenTimeSeconds2w:(int64_t)a3;
- (void)setBuyLabel:(BOOL)a3;
- (void)setCameraAppLaunchCount1w:(int64_t)a3;
- (void)setCameraLaunchCountSameSlot:(int64_t)a3;
- (void)setDaemonVersion:(int64_t)a3;
- (void)setDailyScreenTimeSeconds:(int64_t)a3;
- (void)setDayOfWeek:(int)a3;
- (void)setDeviceModelName:(id)a3;
- (void)setDiskStorageCapacityBytes:(int64_t)a3;
- (void)setDropboxAppLaunchCount1w:(int64_t)a3;
- (void)setFilesAppLaunchCount1w:(int64_t)a3;
- (void)setFilesLaunchCountSameSlot:(int64_t)a3;
- (void)setGoogleDriveAppLaunchCount1w:(int64_t)a3;
- (void)setGooglePhotoAppLaunchCount1w:(int64_t)a3;
- (void)setHasAppLaunchCount2wMax:(BOOL)a3;
- (void)setHasAppLaunchCount2wMedian:(BOOL)a3;
- (void)setHasAppLaunchCountSameSlot:(BOOL)a3;
- (void)setHasAvgWeeklyScreenTimeSeconds2w:(BOOL)a3;
- (void)setHasBuyLabel:(BOOL)a3;
- (void)setHasCameraAppLaunchCount1w:(BOOL)a3;
- (void)setHasCameraLaunchCountSameSlot:(BOOL)a3;
- (void)setHasDaemonVersion:(BOOL)a3;
- (void)setHasDailyScreenTimeSeconds:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasDiskStorageCapacityBytes:(BOOL)a3;
- (void)setHasDropboxAppLaunchCount1w:(BOOL)a3;
- (void)setHasFilesAppLaunchCount1w:(BOOL)a3;
- (void)setHasFilesLaunchCountSameSlot:(BOOL)a3;
- (void)setHasGoogleDriveAppLaunchCount1w:(BOOL)a3;
- (void)setHasGooglePhotoAppLaunchCount1w:(BOOL)a3;
- (void)setHasHourOfDay:(BOOL)a3;
- (void)setHasIcloudNotificationActionLabel:(BOOL)a3;
- (void)setHasIsDoNotDisturbOn:(BOOL)a3;
- (void)setHasIsDoNotDisturbOnCount2w:(BOOL)a3;
- (void)setHasIsDoNotDisturbOnSameSlot:(BOOL)a3;
- (void)setHasIsDrivingModeOn:(BOOL)a3;
- (void)setHasIsDrivingModeOnCount2w:(BOOL)a3;
- (void)setHasIsDrivingModeOnSameSlot:(BOOL)a3;
- (void)setHasIsSleepModeOn:(BOOL)a3;
- (void)setHasIsSleepModeOnCount2w:(BOOL)a3;
- (void)setHasIsSleepModeOnSameSlot:(BOOL)a3;
- (void)setHasLastOpenedAppHour24h:(BOOL)a3;
- (void)setHasMinsSinceLastCameraAppLaunch1w:(BOOL)a3;
- (void)setHasMinsSinceLastFilesAppLaunch1w:(BOOL)a3;
- (void)setHasMinsSinceLastPhotosAppLaunch1w:(BOOL)a3;
- (void)setHasMinsUntilICloudBuy:(BOOL)a3;
- (void)setHasMinsUntilICloudNotificationOpened:(BOOL)a3;
- (void)setHasMinsUntilICloudOpenedSubStream:(BOOL)a3;
- (void)setHasMlServerScore:(BOOL)a3;
- (void)setHasNumNotificationsSameSlot:(BOOL)a3;
- (void)setHasNumOpenedNotificationsSameSlot:(BOOL)a3;
- (void)setHasOBSOLETETrafficType:(BOOL)a3;
- (void)setHasOffsetMins:(BOOL)a3;
- (void)setHasOpenLabelSubStream:(BOOL)a3;
- (void)setHasOpenedICloudNotificationRatio1w:(BOOL)a3;
- (void)setHasOpenedICloudNotificationRatio2w:(BOOL)a3;
- (void)setHasOpenedNotificationCount2wMax:(BOOL)a3;
- (void)setHasOpenedNotificationCount2wMedian:(BOOL)a3;
- (void)setHasOpenedNotificationRatio1w:(BOOL)a3;
- (void)setHasOpenedNotificationRatio24h:(BOOL)a3;
- (void)setHasOsVersionMajorVersion:(BOOL)a3;
- (void)setHasOsVersionMinorVersion:(BOOL)a3;
- (void)setHasOsVersionPatchVersion:(BOOL)a3;
- (void)setHasPhotosAppLaunchCount1w:(BOOL)a3;
- (void)setHasPhotosLaunchCount2wMax:(BOOL)a3;
- (void)setHasPhotosLaunchCount2wMedian:(BOOL)a3;
- (void)setHasPhotosLaunchCountSameSlot:(BOOL)a3;
- (void)setHasTimestampMillis:(BOOL)a3;
- (void)setHasTotalNotificationCount1w:(BOOL)a3;
- (void)setHasTotalNotificationCount2wMax:(BOOL)a3;
- (void)setHasTotalNotificationCount2wMedian:(BOOL)a3;
- (void)setHasTotalOpenedNotificationCount1w:(BOOL)a3;
- (void)setHasTrafficType:(BOOL)a3;
- (void)setHasUsedDiskCapacityBytes:(BOOL)a3;
- (void)setHasUserTier:(BOOL)a3;
- (void)setHourOfDay:(int)a3;
- (void)setICloudNotificationUsageTypeTop1:(id)a3;
- (void)setICloudNotificationUsageTypeTop2:(id)a3;
- (void)setICloudNotificationUsageTypeTop3:(id)a3;
- (void)setIcloudNotificationActionLabel:(int)a3;
- (void)setIsDoNotDisturbOn:(BOOL)a3;
- (void)setIsDoNotDisturbOnCount2w:(int64_t)a3;
- (void)setIsDoNotDisturbOnSameSlot:(BOOL)a3;
- (void)setIsDrivingModeOn:(BOOL)a3;
- (void)setIsDrivingModeOnCount2w:(int64_t)a3;
- (void)setIsDrivingModeOnSameSlot:(BOOL)a3;
- (void)setIsSleepModeOn:(BOOL)a3;
- (void)setIsSleepModeOnCount2w:(int64_t)a3;
- (void)setIsSleepModeOnSameSlot:(BOOL)a3;
- (void)setLabelMessage:(id)a3;
- (void)setLastOpenedAppHour24h:(int64_t)a3;
- (void)setLastOpenedAppId24h:(id)a3;
- (void)setMinsSinceLastCameraAppLaunch1w:(int64_t)a3;
- (void)setMinsSinceLastFilesAppLaunch1w:(int64_t)a3;
- (void)setMinsSinceLastPhotosAppLaunch1w:(int64_t)a3;
- (void)setMinsUntilICloudBuy:(int64_t)a3;
- (void)setMinsUntilICloudNotificationOpened:(int64_t)a3;
- (void)setMinsUntilICloudOpenedSubStream:(int64_t)a3;
- (void)setMlServerScore:(double)a3;
- (void)setNotificationUsageTypeTop1:(id)a3;
- (void)setNotificationUsageTypeTop2:(id)a3;
- (void)setNotificationUsageTypeTop3:(id)a3;
- (void)setNumNotificationsSameSlot:(int64_t)a3;
- (void)setNumOpenedNotificationsSameSlot:(int64_t)a3;
- (void)setOBSOLETEDayOfWeek:(id)a3;
- (void)setOBSOLETETrafficType:(int)a3;
- (void)setOffsetMins:(int64_t)a3;
- (void)setOpenLabelSubStream:(BOOL)a3;
- (void)setOpenedICloudNotificationRatio1w:(double)a3;
- (void)setOpenedICloudNotificationRatio2w:(double)a3;
- (void)setOpenedNotificationCount2wMax:(int64_t)a3;
- (void)setOpenedNotificationCount2wMedian:(int64_t)a3;
- (void)setOpenedNotificationRatio1w:(double)a3;
- (void)setOpenedNotificationRatio24h:(double)a3;
- (void)setOsVersionMajorVersion:(int64_t)a3;
- (void)setOsVersionMinorVersion:(int64_t)a3;
- (void)setOsVersionPatchVersion:(int64_t)a3;
- (void)setPhotosAppLaunchCount1w:(int64_t)a3;
- (void)setPhotosLaunchCount2wMax:(int64_t)a3;
- (void)setPhotosLaunchCount2wMedian:(int64_t)a3;
- (void)setPhotosLaunchCountSameSlot:(int64_t)a3;
- (void)setTimestampMillis:(int64_t)a3;
- (void)setTotalNotificationCount1w:(int64_t)a3;
- (void)setTotalNotificationCount2wMax:(int64_t)a3;
- (void)setTotalNotificationCount2wMedian:(int64_t)a3;
- (void)setTotalOpenedNotificationCount1w:(int64_t)a3;
- (void)setTrafficType:(int)a3;
- (void)setUsedDiskCapacityBytes:(int64_t)a3;
- (void)setUserTier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ISOPBSubscriptiondPetMessage

- (void)setTimestampMillis:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_timestampMillis = a3;
}

- (void)setHasTimestampMillis:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasTimestampMillis
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setHourOfDay:(int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_hourOfDay = a3;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHourOfDay
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (BOOL)hasLastOpenedAppId24h
{
  return self->_lastOpenedAppId24h != 0;
}

- (void)setLastOpenedAppHour24h:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_lastOpenedAppHour24h = a3;
}

- (void)setHasLastOpenedAppHour24h:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasLastOpenedAppHour24h
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsSleepModeOn:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_isSleepModeOn = a3;
}

- (void)setHasIsSleepModeOn:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsSleepModeOn
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setIsDoNotDisturbOn:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_isDoNotDisturbOn = a3;
}

- (void)setHasIsDoNotDisturbOn:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDoNotDisturbOn
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setIsDrivingModeOn:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_isDrivingModeOn = a3;
}

- (void)setHasIsDrivingModeOn:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDrivingModeOn
{
  return *((unsigned char *)&self->_has + 7) & 1;
}

- (void)setOpenedNotificationRatio24h:(double)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_openedNotificationRatio24h = a3;
}

- (void)setHasOpenedNotificationRatio24h:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationRatio24h
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setGoogleDriveAppLaunchCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_googleDriveAppLaunchCount1w = a3;
}

- (void)setHasGoogleDriveAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasGoogleDriveAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setGooglePhotoAppLaunchCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_googlePhotoAppLaunchCount1w = a3;
}

- (void)setHasGooglePhotoAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasGooglePhotoAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDropboxAppLaunchCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_dropboxAppLaunchCount1w = a3;
}

- (void)setHasDropboxAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasDropboxAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCameraAppLaunchCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_cameraAppLaunchCount1w = a3;
}

- (void)setHasCameraAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCameraAppLaunchCount1w
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPhotosAppLaunchCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_photosAppLaunchCount1w = a3;
}

- (void)setHasPhotosAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setFilesAppLaunchCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_filesAppLaunchCount1w = a3;
}

- (void)setHasFilesAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasFilesAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTotalNotificationCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_totalNotificationCount1w = a3;
}

- (void)setHasTotalNotificationCount1w:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalNotificationCount1w
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTotalOpenedNotificationCount1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_totalOpenedNotificationCount1w = a3;
}

- (void)setHasTotalOpenedNotificationCount1w:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalOpenedNotificationCount1w
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setOpenedNotificationRatio1w:(double)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_openedNotificationRatio1w = a3;
}

- (void)setHasOpenedNotificationRatio1w:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationRatio1w
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setOpenedICloudNotificationRatio1w:(double)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_openedICloudNotificationRatio1w = a3;
}

- (void)setHasOpenedICloudNotificationRatio1w:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasOpenedICloudNotificationRatio1w
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasNotificationUsageTypeTop1
{
  return self->_notificationUsageTypeTop1 != 0;
}

- (BOOL)hasNotificationUsageTypeTop2
{
  return self->_notificationUsageTypeTop2 != 0;
}

- (BOOL)hasNotificationUsageTypeTop3
{
  return self->_notificationUsageTypeTop3 != 0;
}

- (BOOL)hasICloudNotificationUsageTypeTop1
{
  return self->_iCloudNotificationUsageTypeTop1 != 0;
}

- (BOOL)hasICloudNotificationUsageTypeTop2
{
  return self->_iCloudNotificationUsageTypeTop2 != 0;
}

- (BOOL)hasICloudNotificationUsageTypeTop3
{
  return self->_iCloudNotificationUsageTypeTop3 != 0;
}

- (void)setMlServerScore:(double)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_mlServerScore = a3;
}

- (void)setHasMlServerScore:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMlServerScore
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (BOOL)hasLabelMessage
{
  return self->_labelMessage != 0;
}

- (void)setDiskStorageCapacityBytes:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_diskStorageCapacityBytes = a3;
}

- (void)setHasDiskStorageCapacityBytes:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasDiskStorageCapacityBytes
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setUsedDiskCapacityBytes:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_usedDiskCapacityBytes = a3;
}

- (void)setHasUsedDiskCapacityBytes:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUsedDiskCapacityBytes
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setOpenedICloudNotificationRatio2w:(double)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_openedICloudNotificationRatio2w = a3;
}

- (void)setHasOpenedICloudNotificationRatio2w:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasOpenedICloudNotificationRatio2w
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (int)trafficType
{
  if ((*((unsigned char *)&self->_has + 6) & 8) != 0) {
    return self->_trafficType;
  }
  else {
    return 0;
  }
}

- (void)setTrafficType:(int)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_trafficType = a3;
}

- (void)setHasTrafficType:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTrafficType
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264CCCAA8[a3];
  }
  return v3;
}

- (int)StringAsTrafficType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYNTHESIZED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDailyScreenTimeSeconds:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_dailyScreenTimeSeconds = a3;
}

- (void)setHasDailyScreenTimeSeconds:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDailyScreenTimeSeconds
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setAvgWeeklyScreenTimeSeconds2w:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_avgWeeklyScreenTimeSeconds2w = a3;
}

- (void)setHasAvgWeeklyScreenTimeSeconds2w:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAvgWeeklyScreenTimeSeconds2w
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDaemonVersion:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_daemonVersion = a3;
}

- (void)setHasDaemonVersion:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasDaemonVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasOBSOLETEDayOfWeek
{
  return self->_oBSOLETEDayOfWeek != 0;
}

- (BOOL)hasDeviceModelName
{
  return self->_deviceModelName != 0;
}

- (int)dayOfWeek
{
  if ((*((unsigned char *)&self->_has + 5) & 0x80) != 0) {
    return self->_dayOfWeek;
  }
  else {
    return 0;
  }
}

- (void)setDayOfWeek:(int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasDayOfWeek
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (id)dayOfWeekAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264CCCA38[a3];
  }
  return v3;
}

- (int)StringAsDayOfWeek:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNAVAILABLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUNDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MONDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TUESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WEDNESDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"THURSDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FRIDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SATURDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setOsVersionMajorVersion:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_osVersionMajorVersion = a3;
}

- (void)setHasOsVersionMajorVersion:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasOsVersionMajorVersion
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setOsVersionMinorVersion:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_osVersionMinorVersion = a3;
}

- (void)setHasOsVersionMinorVersion:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasOsVersionMinorVersion
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setOsVersionPatchVersion:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_osVersionPatchVersion = a3;
}

- (void)setHasOsVersionPatchVersion:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasOsVersionPatchVersion
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setOffsetMins:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_offsetMins = a3;
}

- (void)setHasOffsetMins:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasOffsetMins
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (int)icloudNotificationActionLabel
{
  if ((*((unsigned char *)&self->_has + 6) & 2) != 0) {
    return self->_icloudNotificationActionLabel;
  }
  else {
    return 0;
  }
}

- (void)setIcloudNotificationActionLabel:(int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_icloudNotificationActionLabel = a3;
}

- (void)setHasIcloudNotificationActionLabel:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIcloudNotificationActionLabel
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (id)icloudNotificationActionLabelAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264CCCA78[a3];
  }
  return v3;
}

- (int)StringAsIcloudNotificationActionLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LABEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CLICK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLEAR"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setMinsUntilICloudNotificationOpened:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_minsUntilICloudNotificationOpened = a3;
}

- (void)setHasMinsUntilICloudNotificationOpened:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasMinsUntilICloudNotificationOpened
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAppLaunchCountSameSlot:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_appLaunchCountSameSlot = a3;
}

- (void)setHasAppLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAppLaunchCountSameSlot
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCameraLaunchCountSameSlot:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_cameraLaunchCountSameSlot = a3;
}

- (void)setHasCameraLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCameraLaunchCountSameSlot
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPhotosLaunchCountSameSlot:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_photosLaunchCountSameSlot = a3;
}

- (void)setHasPhotosLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosLaunchCountSameSlot
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setFilesLaunchCountSameSlot:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_filesLaunchCountSameSlot = a3;
}

- (void)setHasFilesLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasFilesLaunchCountSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsSleepModeOnSameSlot:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_isSleepModeOnSameSlot = a3;
}

- (void)setHasIsSleepModeOnSameSlot:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsSleepModeOnSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setIsDoNotDisturbOnSameSlot:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_isDoNotDisturbOnSameSlot = a3;
}

- (void)setHasIsDoNotDisturbOnSameSlot:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDoNotDisturbOnSameSlot
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setIsDrivingModeOnSameSlot:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_isDrivingModeOnSameSlot = a3;
}

- (void)setHasIsDrivingModeOnSameSlot:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDrivingModeOnSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setNumNotificationsSameSlot:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_numNotificationsSameSlot = a3;
}

- (void)setHasNumNotificationsSameSlot:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasNumNotificationsSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setNumOpenedNotificationsSameSlot:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_numOpenedNotificationsSameSlot = a3;
}

- (void)setHasNumOpenedNotificationsSameSlot:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasNumOpenedNotificationsSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMinsSinceLastCameraAppLaunch1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_minsSinceLastCameraAppLaunch1w = a3;
}

- (void)setHasMinsSinceLastCameraAppLaunch1w:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMinsSinceLastCameraAppLaunch1w
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMinsSinceLastPhotosAppLaunch1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_minsSinceLastPhotosAppLaunch1w = a3;
}

- (void)setHasMinsSinceLastPhotosAppLaunch1w:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMinsSinceLastPhotosAppLaunch1w
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMinsSinceLastFilesAppLaunch1w:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_minsSinceLastFilesAppLaunch1w = a3;
}

- (void)setHasMinsSinceLastFilesAppLaunch1w:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMinsSinceLastFilesAppLaunch1w
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsSleepModeOnCount2w:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_isSleepModeOnCount2w = a3;
}

- (void)setHasIsSleepModeOnCount2w:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasIsSleepModeOnCount2w
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsDoNotDisturbOnCount2w:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_isDoNotDisturbOnCount2w = a3;
}

- (void)setHasIsDoNotDisturbOnCount2w:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIsDoNotDisturbOnCount2w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsDrivingModeOnCount2w:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_isDrivingModeOnCount2w = a3;
}

- (void)setHasIsDrivingModeOnCount2w:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasIsDrivingModeOnCount2w
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAppLaunchCount2wMedian:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_appLaunchCount2wMedian = a3;
}

- (void)setHasAppLaunchCount2wMedian:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAppLaunchCount2wMedian
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppLaunchCount2wMax:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_appLaunchCount2wMax = a3;
}

- (void)setHasAppLaunchCount2wMax:(BOOL)a3
{
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAppLaunchCount2wMax
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhotosLaunchCount2wMedian:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_photosLaunchCount2wMedian = a3;
}

- (void)setHasPhotosLaunchCount2wMedian:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosLaunchCount2wMedian
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setPhotosLaunchCount2wMax:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_photosLaunchCount2wMax = a3;
}

- (void)setHasPhotosLaunchCount2wMax:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosLaunchCount2wMax
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTotalNotificationCount2wMedian:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_totalNotificationCount2wMedian = a3;
}

- (void)setHasTotalNotificationCount2wMedian:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalNotificationCount2wMedian
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setTotalNotificationCount2wMax:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_totalNotificationCount2wMax = a3;
}

- (void)setHasTotalNotificationCount2wMax:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalNotificationCount2wMax
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setOpenedNotificationCount2wMedian:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_openedNotificationCount2wMedian = a3;
}

- (void)setHasOpenedNotificationCount2wMedian:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationCount2wMedian
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setOpenedNotificationCount2wMax:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_openedNotificationCount2wMax = a3;
}

- (void)setHasOpenedNotificationCount2wMax:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationCount2wMax
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setBuyLabel:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_buyLabel = a3;
}

- (void)setHasBuyLabel:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasBuyLabel
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setMinsUntilICloudBuy:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_minsUntilICloudBuy = a3;
}

- (void)setHasMinsUntilICloudBuy:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMinsUntilICloudBuy
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setOpenLabelSubStream:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_openLabelSubStream = a3;
}

- (void)setHasOpenLabelSubStream:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasOpenLabelSubStream
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setMinsUntilICloudOpenedSubStream:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_minsUntilICloudOpenedSubStream = a3;
}

- (void)setHasMinsUntilICloudOpenedSubStream:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMinsUntilICloudOpenedSubStream
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (int)userTier
{
  if ((*((unsigned char *)&self->_has + 6) & 0x10) != 0) {
    return self->_userTier;
  }
  else {
    return 0;
  }
}

- (void)setUserTier:(int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_userTier = a3;
}

- (void)setHasUserTier:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserTier
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (id)userTierAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264CCCA90[a3];
  }
  return v3;
}

- (int)StringAsUserTier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USERTIER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FREE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAID"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)oBSOLETETrafficType
{
  if ((*((unsigned char *)&self->_has + 6) & 4) != 0) {
    return self->_oBSOLETETrafficType;
  }
  else {
    return 0;
  }
}

- (void)setOBSOLETETrafficType:(int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_oBSOLETETrafficType = a3;
}

- (void)setHasOBSOLETETrafficType:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasOBSOLETETrafficType
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (id)oBSOLETETrafficTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264CCCAA8[a3];
  }
  return v3;
}

- (int)StringAsOBSOLETETrafficType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYNTHESIZED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ISOPBSubscriptiondPetMessage;
  int v4 = [(ISOPBSubscriptiondPetMessage *)&v8 description];
  v5 = [(ISOPBSubscriptiondPetMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  $28C44C570028719347E25634D282F7AE has = self->_has;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_timestampMillis];
    [v3 setObject:v5 forKey:@"timestampMillis"];

    $28C44C570028719347E25634D282F7AE has = self->_has;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_hourOfDay];
    [v3 setObject:v6 forKey:@"hourOfDay"];
  }
  lastOpenedAppId24h = self->_lastOpenedAppId24h;
  if (lastOpenedAppId24h) {
    [v3 setObject:lastOpenedAppId24h forKey:@"lastOpenedAppId24h"];
  }
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
  {
    v24 = [NSNumber numberWithLongLong:self->_lastOpenedAppHour24h];
    [v3 setObject:v24 forKey:@"lastOpenedAppHour24h"];

    $28C44C570028719347E25634D282F7AE v8 = self->_has;
    if ((*(void *)&v8 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((*(void *)&v8 & 0x40000000000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_90;
    }
  }
  else if ((*(void *)&v8 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  v25 = [NSNumber numberWithBool:self->_isSleepModeOn];
  [v3 setObject:v25 forKey:@"isSleepModeOn"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&v8 & 0x100000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_91;
  }
LABEL_90:
  v26 = [NSNumber numberWithBool:self->_isDoNotDisturbOn];
  [v3 setObject:v26 forKey:@"isDoNotDisturbOn"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&v8 & 0x200000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_92;
  }
LABEL_91:
  v27 = [NSNumber numberWithBool:self->_isDrivingModeOn];
  [v3 setObject:v27 forKey:@"isDrivingModeOn"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x200000000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_93;
  }
LABEL_92:
  v28 = [NSNumber numberWithDouble:self->_openedNotificationRatio24h];
  [v3 setObject:v28 forKey:@"openedNotificationRatio24h"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_94;
  }
LABEL_93:
  v29 = [NSNumber numberWithLongLong:self->_googleDriveAppLaunchCount1w];
  [v3 setObject:v29 forKey:@"googleDriveAppLaunchCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_95;
  }
LABEL_94:
  v30 = [NSNumber numberWithLongLong:self->_googlePhotoAppLaunchCount1w];
  [v3 setObject:v30 forKey:@"googlePhotoAppLaunchCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_96;
  }
LABEL_95:
  v31 = [NSNumber numberWithLongLong:self->_dropboxAppLaunchCount1w];
  [v3 setObject:v31 forKey:@"dropboxAppLaunchCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
LABEL_16:
    if ((*(void *)&v8 & 0x2000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_97;
  }
LABEL_96:
  v32 = [NSNumber numberWithLongLong:self->_cameraAppLaunchCount1w];
  [v3 setObject:v32 forKey:@"cameraAppLaunchCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_98;
  }
LABEL_97:
  v33 = [NSNumber numberWithLongLong:self->_photosAppLaunchCount1w];
  [v3 setObject:v33 forKey:@"photosAppLaunchCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_18:
    if ((*(void *)&v8 & 0x40000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_99;
  }
LABEL_98:
  v34 = [NSNumber numberWithLongLong:self->_filesAppLaunchCount1w];
  [v3 setObject:v34 forKey:@"filesAppLaunchCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&v8 & 0x200000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_100;
  }
LABEL_99:
  v35 = [NSNumber numberWithLongLong:self->_totalNotificationCount1w];
  [v3 setObject:v35 forKey:@"totalNotificationCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&v8 & 0x100000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_101;
  }
LABEL_100:
  v36 = [NSNumber numberWithLongLong:self->_totalOpenedNotificationCount1w];
  [v3 setObject:v36 forKey:@"totalOpenedNotificationCount1w"];

  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_101:
  v37 = [NSNumber numberWithDouble:self->_openedNotificationRatio1w];
  [v3 setObject:v37 forKey:@"openedNotificationRatio1w"];

  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_22:
    v9 = [NSNumber numberWithDouble:self->_openedICloudNotificationRatio1w];
    [v3 setObject:v9 forKey:@"openedICloudNotificationRatio1w"];
  }
LABEL_23:
  notificationUsageTypeTop1 = self->_notificationUsageTypeTop1;
  if (notificationUsageTypeTop1) {
    [v3 setObject:notificationUsageTypeTop1 forKey:@"notificationUsageTypeTop1"];
  }
  notificationUsageTypeTop2 = self->_notificationUsageTypeTop2;
  if (notificationUsageTypeTop2) {
    [v3 setObject:notificationUsageTypeTop2 forKey:@"notificationUsageTypeTop2"];
  }
  notificationUsageTypeTop3 = self->_notificationUsageTypeTop3;
  if (notificationUsageTypeTop3) {
    [v3 setObject:notificationUsageTypeTop3 forKey:@"notificationUsageTypeTop3"];
  }
  iCloudNotificationUsageTypeTop1 = self->_iCloudNotificationUsageTypeTop1;
  if (iCloudNotificationUsageTypeTop1) {
    [v3 setObject:iCloudNotificationUsageTypeTop1 forKey:@"iCloudNotificationUsageTypeTop1"];
  }
  iCloudNotificationUsageTypeTop2 = self->_iCloudNotificationUsageTypeTop2;
  if (iCloudNotificationUsageTypeTop2) {
    [v3 setObject:iCloudNotificationUsageTypeTop2 forKey:@"iCloudNotificationUsageTypeTop2"];
  }
  iCloudNotificationUsageTypeTop3 = self->_iCloudNotificationUsageTypeTop3;
  if (iCloudNotificationUsageTypeTop3) {
    [v3 setObject:iCloudNotificationUsageTypeTop3 forKey:@"iCloudNotificationUsageTypeTop3"];
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    v16 = [NSNumber numberWithDouble:self->_mlServerScore];
    [v3 setObject:v16 forKey:@"mlServerScore"];
  }
  labelMessage = self->_labelMessage;
  if (labelMessage)
  {
    v18 = [(ISOPBSubscriptionLabelMessage *)labelMessage dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"labelMessage"];
  }
  $28C44C570028719347E25634D282F7AE v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x100) != 0)
  {
    v38 = [NSNumber numberWithLongLong:self->_diskStorageCapacityBytes];
    [v3 setObject:v38 forKey:@"diskStorageCapacityBytes"];

    $28C44C570028719347E25634D282F7AE v19 = self->_has;
    if ((*(void *)&v19 & 0x400000000000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v19 & 0x20000000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_105;
    }
  }
  else if ((*(void *)&v19 & 0x400000000000) == 0)
  {
    goto LABEL_41;
  }
  v39 = [NSNumber numberWithLongLong:self->_usedDiskCapacityBytes];
  [v3 setObject:v39 forKey:@"usedDiskCapacityBytes"];

  $28C44C570028719347E25634D282F7AE v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x20000000) == 0)
  {
LABEL_42:
    if ((*(void *)&v19 & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_106;
  }
LABEL_105:
  v40 = [NSNumber numberWithDouble:self->_openedICloudNotificationRatio2w];
  [v3 setObject:v40 forKey:@"openedICloudNotificationRatio2w"];

  $28C44C570028719347E25634D282F7AE v19 = self->_has;
  if ((*(void *)&v19 & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v19 & 0x80) == 0) {
      goto LABEL_44;
    }
    goto LABEL_112;
  }
LABEL_106:
  uint64_t trafficType = self->_trafficType;
  if (trafficType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_trafficType);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = off_264CCCAA8[trafficType];
  }
  [v3 setObject:v42 forKey:@"trafficType"];

  $28C44C570028719347E25634D282F7AE v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x80) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v19 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_113;
  }
LABEL_112:
  v45 = [NSNumber numberWithLongLong:self->_dailyScreenTimeSeconds];
  [v3 setObject:v45 forKey:@"dailyScreenTimeSeconds"];

  $28C44C570028719347E25634D282F7AE v19 = self->_has;
  if ((*(unsigned char *)&v19 & 8) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v19 & 0x40) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_113:
  v46 = [NSNumber numberWithLongLong:self->_avgWeeklyScreenTimeSeconds2w];
  [v3 setObject:v46 forKey:@"avgWeeklyScreenTimeSeconds2w"];

  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_46:
    v20 = [NSNumber numberWithLongLong:self->_daemonVersion];
    [v3 setObject:v20 forKey:@"daemonVersion"];
  }
LABEL_47:
  oBSOLETEDayOfWeek = self->_oBSOLETEDayOfWeek;
  if (oBSOLETEDayOfWeek) {
    [v3 setObject:oBSOLETEDayOfWeek forKey:@"OBSOLETE_dayOfWeek"];
  }
  deviceModelName = self->_deviceModelName;
  if (deviceModelName) {
    [v3 setObject:deviceModelName forKey:@"deviceModelName"];
  }
  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x800000000000) != 0)
  {
    uint64_t dayOfWeek = self->_dayOfWeek;
    if (dayOfWeek >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dayOfWeek);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = off_264CCCA38[dayOfWeek];
    }
    [v3 setObject:v44 forKey:@"dayOfWeek"];

    $28C44C570028719347E25634D282F7AE v23 = self->_has;
    if ((*(void *)&v23 & 0x400000000) == 0)
    {
LABEL_53:
      if ((*(void *)&v23 & 0x800000000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_118;
    }
  }
  else if ((*(void *)&v23 & 0x400000000) == 0)
  {
    goto LABEL_53;
  }
  v47 = [NSNumber numberWithLongLong:self->_osVersionMajorVersion];
  [v3 setObject:v47 forKey:@"osVersionMajorVersion"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x800000000) == 0)
  {
LABEL_54:
    if ((*(void *)&v23 & 0x1000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_119;
  }
LABEL_118:
  v48 = [NSNumber numberWithLongLong:self->_osVersionMinorVersion];
  [v3 setObject:v48 forKey:@"osVersionMinorVersion"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x1000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v23 & 0x8000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_120;
  }
LABEL_119:
  v49 = [NSNumber numberWithLongLong:self->_osVersionPatchVersion];
  [v3 setObject:v49 forKey:@"osVersionPatchVersion"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x8000000) == 0)
  {
LABEL_56:
    if ((*(void *)&v23 & 0x2000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_121;
  }
LABEL_120:
  v50 = [NSNumber numberWithLongLong:self->_offsetMins];
  [v3 setObject:v50 forKey:@"offsetMins"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x2000000000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v23 & 0x400000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_125;
  }
LABEL_121:
  uint64_t icloudNotificationActionLabel = self->_icloudNotificationActionLabel;
  if (icloudNotificationActionLabel >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_icloudNotificationActionLabel);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = off_264CCCA78[icloudNotificationActionLabel];
  }
  [v3 setObject:v52 forKey:@"icloudNotificationActionLabel"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v23 & 4) == 0) {
      goto LABEL_59;
    }
    goto LABEL_126;
  }
LABEL_125:
  v53 = [NSNumber numberWithLongLong:self->_minsUntilICloudNotificationOpened];
  [v3 setObject:v53 forKey:@"minsUntilICloudNotificationOpened"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(unsigned char *)&v23 & 4) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v23 & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_127;
  }
LABEL_126:
  v54 = [NSNumber numberWithLongLong:self->_appLaunchCountSameSlot];
  [v3 setObject:v54 forKey:@"appLaunchCountSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(unsigned char *)&v23 & 0x20) == 0)
  {
LABEL_60:
    if ((*(void *)&v23 & 0x10000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_128;
  }
LABEL_127:
  v55 = [NSNumber numberWithLongLong:self->_cameraLaunchCountSameSlot];
  [v3 setObject:v55 forKey:@"cameraLaunchCountSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x10000000000) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v23 & 0x800) == 0) {
      goto LABEL_62;
    }
    goto LABEL_129;
  }
LABEL_128:
  v56 = [NSNumber numberWithLongLong:self->_photosLaunchCountSameSlot];
  [v3 setObject:v56 forKey:@"photosLaunchCountSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x800) == 0)
  {
LABEL_62:
    if ((*(void *)&v23 & 0x800000000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_130;
  }
LABEL_129:
  v57 = [NSNumber numberWithLongLong:self->_filesLaunchCountSameSlot];
  [v3 setObject:v57 forKey:@"filesLaunchCountSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x800000000000000) == 0)
  {
LABEL_63:
    if ((*(void *)&v23 & 0x80000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_131;
  }
LABEL_130:
  v58 = [NSNumber numberWithBool:self->_isSleepModeOnSameSlot];
  [v3 setObject:v58 forKey:@"isSleepModeOnSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x80000000000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v23 & 0x200000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_132;
  }
LABEL_131:
  v59 = [NSNumber numberWithBool:self->_isDoNotDisturbOnSameSlot];
  [v3 setObject:v59 forKey:@"isDoNotDisturbOnSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x200000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v23 & 0x2000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_133;
  }
LABEL_132:
  v60 = [NSNumber numberWithBool:self->_isDrivingModeOnSameSlot];
  [v3 setObject:v60 forKey:@"isDrivingModeOnSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x2000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v23 & 0x4000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_134;
  }
LABEL_133:
  v61 = [NSNumber numberWithLongLong:self->_numNotificationsSameSlot];
  [v3 setObject:v61 forKey:@"numNotificationsSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x4000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v23 & 0x40000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_135;
  }
LABEL_134:
  v62 = [NSNumber numberWithLongLong:self->_numOpenedNotificationsSameSlot];
  [v3 setObject:v62 forKey:@"numOpenedNotificationsSameSlot"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x40000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v23 & 0x100000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_136;
  }
LABEL_135:
  v63 = [NSNumber numberWithLongLong:self->_minsSinceLastCameraAppLaunch1w];
  [v3 setObject:v63 forKey:@"minsSinceLastCameraAppLaunch1w"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x100000) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&v23 & 0x80000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_137;
  }
LABEL_136:
  v64 = [NSNumber numberWithLongLong:self->_minsSinceLastPhotosAppLaunch1w];
  [v3 setObject:v64 forKey:@"minsSinceLastPhotosAppLaunch1w"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x80000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v23 & 0x10000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_138;
  }
LABEL_137:
  v65 = [NSNumber numberWithLongLong:self->_minsSinceLastFilesAppLaunch1w];
  [v3 setObject:v65 forKey:@"minsSinceLastFilesAppLaunch1w"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v23 & 0x4000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_139;
  }
LABEL_138:
  v66 = [NSNumber numberWithLongLong:self->_isSleepModeOnCount2w];
  [v3 setObject:v66 forKey:@"isSleepModeOnCount2w"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v23 & 0x8000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_140;
  }
LABEL_139:
  v67 = [NSNumber numberWithLongLong:self->_isDoNotDisturbOnCount2w];
  [v3 setObject:v67 forKey:@"isDoNotDisturbOnCount2w"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x8000) == 0)
  {
LABEL_73:
    if ((*(unsigned char *)&v23 & 2) == 0) {
      goto LABEL_74;
    }
    goto LABEL_141;
  }
LABEL_140:
  v68 = [NSNumber numberWithLongLong:self->_isDrivingModeOnCount2w];
  [v3 setObject:v68 forKey:@"isDrivingModeOnCount2w"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(unsigned char *)&v23 & 2) == 0)
  {
LABEL_74:
    if ((*(unsigned char *)&v23 & 1) == 0) {
      goto LABEL_75;
    }
    goto LABEL_142;
  }
LABEL_141:
  v69 = [NSNumber numberWithLongLong:self->_appLaunchCount2wMedian];
  [v3 setObject:v69 forKey:@"appLaunchCount2wMedian"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(unsigned char *)&v23 & 1) == 0)
  {
LABEL_75:
    if ((*(void *)&v23 & 0x8000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_143;
  }
LABEL_142:
  v70 = [NSNumber numberWithLongLong:self->_appLaunchCount2wMax];
  [v3 setObject:v70 forKey:@"appLaunchCount2wMax"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x8000000000) == 0)
  {
LABEL_76:
    if ((*(void *)&v23 & 0x4000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_144;
  }
LABEL_143:
  v71 = [NSNumber numberWithLongLong:self->_photosLaunchCount2wMedian];
  [v3 setObject:v71 forKey:@"photosLaunchCount2wMedian"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x4000000000) == 0)
  {
LABEL_77:
    if ((*(void *)&v23 & 0x100000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_145;
  }
LABEL_144:
  v72 = [NSNumber numberWithLongLong:self->_photosLaunchCount2wMax];
  [v3 setObject:v72 forKey:@"photosLaunchCount2wMax"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x100000000000) == 0)
  {
LABEL_78:
    if ((*(void *)&v23 & 0x80000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_146;
  }
LABEL_145:
  v73 = [NSNumber numberWithLongLong:self->_totalNotificationCount2wMedian];
  [v3 setObject:v73 forKey:@"totalNotificationCount2wMedian"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x80000000000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v23 & 0x80000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_147;
  }
LABEL_146:
  v74 = [NSNumber numberWithLongLong:self->_totalNotificationCount2wMax];
  [v3 setObject:v74 forKey:@"totalNotificationCount2wMax"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x80000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v23 & 0x40000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_148;
  }
LABEL_147:
  v75 = [NSNumber numberWithLongLong:self->_openedNotificationCount2wMedian];
  [v3 setObject:v75 forKey:@"openedNotificationCount2wMedian"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x40000000) == 0)
  {
LABEL_81:
    if ((*(void *)&v23 & 0x20000000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_149;
  }
LABEL_148:
  v76 = [NSNumber numberWithLongLong:self->_openedNotificationCount2wMax];
  [v3 setObject:v76 forKey:@"openedNotificationCount2wMax"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x20000000000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v23 & 0x200000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_150;
  }
LABEL_149:
  v77 = [NSNumber numberWithBool:self->_buyLabel];
  [v3 setObject:v77 forKey:@"buyLabel"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x200000) == 0)
  {
LABEL_83:
    if ((*(void *)&v23 & 0x1000000000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_151;
  }
LABEL_150:
  v78 = [NSNumber numberWithLongLong:self->_minsUntilICloudBuy];
  [v3 setObject:v78 forKey:@"minsUntilICloudBuy"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x1000000000000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v23 & 0x800000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_152;
  }
LABEL_151:
  v79 = [NSNumber numberWithBool:self->_openLabelSubStream];
  [v3 setObject:v79 forKey:@"openLabelSubStream"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x800000) == 0)
  {
LABEL_85:
    if ((*(void *)&v23 & 0x10000000000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_153;
  }
LABEL_152:
  v80 = [NSNumber numberWithLongLong:self->_minsUntilICloudOpenedSubStream];
  [v3 setObject:v80 forKey:@"minsUntilICloudOpenedSubStream"];

  $28C44C570028719347E25634D282F7AE v23 = self->_has;
  if ((*(void *)&v23 & 0x10000000000000) == 0)
  {
LABEL_86:
    if ((*(void *)&v23 & 0x4000000000000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_157;
  }
LABEL_153:
  uint64_t userTier = self->_userTier;
  if (userTier >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_userTier);
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82 = off_264CCCA90[userTier];
  }
  [v3 setObject:v82 forKey:@"userTier"];

  if ((*(void *)&self->_has & 0x4000000000000) != 0)
  {
LABEL_157:
    uint64_t oBSOLETETrafficType = self->_oBSOLETETrafficType;
    if (oBSOLETETrafficType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_oBSOLETETrafficType);
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v84 = off_264CCCAA8[oBSOLETETrafficType];
    }
    [v3 setObject:v84 forKey:@"OBSOLETE_trafficType"];
  }
LABEL_161:
  id v85 = v3;

  return v85;
}

- (BOOL)readFrom:(id)a3
{
  return ISOPBSubscriptiondPetMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  $28C44C570028719347E25634D282F7AE has = self->_has;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $28C44C570028719347E25634D282F7AE has = self->_has;
  }
  if ((*(void *)&has & 0x1000000000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_lastOpenedAppId24h) {
    PBDataWriterWriteStringField();
  }
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $28C44C570028719347E25634D282F7AE v5 = self->_has;
    if ((*(void *)&v5 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((*(void *)&v5 & 0x40000000000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_93;
    }
  }
  else if ((*(void *)&v5 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(void *)&v5 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&v5 & 0x100000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(void *)&v5 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&v5 & 0x200000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(void *)&v5 & 0x200000000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteDoubleField();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v5 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
LABEL_16:
    if ((*(void *)&v5 & 0x2000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(void *)&v5 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_18:
    if ((*(void *)&v5 & 0x40000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(void *)&v5 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&v5 & 0x200000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(void *)&v5 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&v5 & 0x100000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v5 = self->_has;
  if ((*(void *)&v5 & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v5 & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_104:
  PBDataWriterWriteDoubleField();
  if ((*(void *)&self->_has & 0x10000000) != 0) {
LABEL_22:
  }
    PBDataWriterWriteDoubleField();
LABEL_23:
  if (self->_notificationUsageTypeTop1) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationUsageTypeTop2) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationUsageTypeTop3) {
    PBDataWriterWriteStringField();
  }
  if (self->_iCloudNotificationUsageTypeTop1) {
    PBDataWriterWriteStringField();
  }
  if (self->_iCloudNotificationUsageTypeTop2) {
    PBDataWriterWriteStringField();
  }
  if (self->_iCloudNotificationUsageTypeTop3) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 3)) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_labelMessage) {
    PBDataWriterWriteSubmessage();
  }
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    PBDataWriterWriteInt64Field();
    $28C44C570028719347E25634D282F7AE v6 = self->_has;
    if ((*(void *)&v6 & 0x400000000000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_108;
    }
  }
  else if ((*(void *)&v6 & 0x400000000000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_42:
    if ((*(void *)&v6 & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteDoubleField();
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_44;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteInt32Field();
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_111:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x40) != 0) {
LABEL_46:
  }
    PBDataWriterWriteInt64Field();
LABEL_47:
  if (self->_oBSOLETEDayOfWeek) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModelName) {
    PBDataWriterWriteStringField();
  }
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $28C44C570028719347E25634D282F7AE v7 = self->_has;
    if ((*(void *)&v7 & 0x400000000) == 0)
    {
LABEL_53:
      if ((*(void *)&v7 & 0x800000000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_115;
    }
  }
  else if ((*(void *)&v7 & 0x400000000) == 0)
  {
    goto LABEL_53;
  }
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000) == 0)
  {
LABEL_54:
    if ((*(void *)&v7 & 0x1000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v7 & 0x8000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) == 0)
  {
LABEL_56:
    if ((*(void *)&v7 & 0x2000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteInt32Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_59;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_60:
    if ((*(void *)&v7 & 0x10000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x10000000000) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_62;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_62:
    if ((*(void *)&v7 & 0x800000000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000000000) == 0)
  {
LABEL_63:
    if ((*(void *)&v7 & 0x80000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x80000000000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v7 & 0x200000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_73:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_74;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_74:
    if ((*(unsigned char *)&v7 & 1) == 0) {
      goto LABEL_75;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_75:
    if ((*(void *)&v7 & 0x8000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x8000000000) == 0)
  {
LABEL_76:
    if ((*(void *)&v7 & 0x4000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x4000000000) == 0)
  {
LABEL_77:
    if ((*(void *)&v7 & 0x100000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x100000000000) == 0)
  {
LABEL_78:
    if ((*(void *)&v7 & 0x80000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x80000000000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_81:
    if ((*(void *)&v7 & 0x20000000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x20000000000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_83:
    if ((*(void *)&v7 & 0x1000000000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteBOOLField();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_85:
    if ((*(void *)&v7 & 0x10000000000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteInt64Field();
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x10000000000000) == 0)
  {
LABEL_86:
    if ((*(void *)&v7 & 0x4000000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_147:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x4000000000000) != 0) {
LABEL_87:
  }
    PBDataWriterWriteInt32Field();
LABEL_88:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $28C44C570028719347E25634D282F7AE has = self->_has;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    v4[42] = self->_timestampMillis;
    *(void *)((char *)v4 + 508) |= 0x20000000000uLL;
    $28C44C570028719347E25634D282F7AE has = self->_has;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    *((_DWORD *)v4 + 100) = self->_hourOfDay;
    *(void *)((char *)v4 + 508) |= 0x1000000000000uLL;
  }
  v9 = v4;
  if (self->_lastOpenedAppId24h)
  {
    objc_msgSend(v4, "setLastOpenedAppId24h:");
    int v4 = v9;
  }
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    v4[18] = self->_lastOpenedAppHour24h;
    *(void *)((char *)v4 + 508) |= 0x20000uLL;
    $28C44C570028719347E25634D282F7AE v6 = self->_has;
    if ((*(void *)&v6 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((*(void *)&v6 & 0x40000000000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_93;
    }
  }
  else if ((*(void *)&v6 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 505) = self->_isSleepModeOn;
  *(void *)((char *)v4 + 508) |= 0x400000000000000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&v6 & 0x100000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((unsigned char *)v4 + 501) = self->_isDoNotDisturbOn;
  *(void *)((char *)v4 + 508) |= 0x40000000000000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&v6 & 0x200000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((unsigned char *)v4 + 503) = self->_isDrivingModeOn;
  *(void *)((char *)v4 + 508) |= 0x100000000000000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x200000000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_96;
  }
LABEL_95:
  v4[34] = *(void *)&self->_openedNotificationRatio24h;
  *(void *)((char *)v4 + 508) |= 0x200000000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_97;
  }
LABEL_96:
  v4[13] = self->_googleDriveAppLaunchCount1w;
  *(void *)((char *)v4 + 508) |= 0x1000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_98;
  }
LABEL_97:
  v4[14] = self->_googlePhotoAppLaunchCount1w;
  *(void *)((char *)v4 + 508) |= 0x2000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_99;
  }
LABEL_98:
  v4[10] = self->_dropboxAppLaunchCount1w;
  *(void *)((char *)v4 + 508) |= 0x200uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_16:
    if ((*(void *)&v6 & 0x2000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_100;
  }
LABEL_99:
  v4[5] = self->_cameraAppLaunchCount1w;
  *(void *)((char *)v4 + 508) |= 0x10uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_101;
  }
LABEL_100:
  v4[38] = self->_photosAppLaunchCount1w;
  *(void *)((char *)v4 + 508) |= 0x2000000000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_18:
    if ((*(void *)&v6 & 0x40000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_102;
  }
LABEL_101:
  v4[11] = self->_filesAppLaunchCount1w;
  *(void *)((char *)v4 + 508) |= 0x400uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&v6 & 0x200000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_103;
  }
LABEL_102:
  v4[43] = self->_totalNotificationCount1w;
  *(void *)((char *)v4 + 508) |= 0x40000000000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&v6 & 0x100000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_104;
  }
LABEL_103:
  v4[46] = self->_totalOpenedNotificationCount1w;
  *(void *)((char *)v4 + 508) |= 0x200000000000uLL;
  $28C44C570028719347E25634D282F7AE v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_104:
  v4[33] = *(void *)&self->_openedNotificationRatio1w;
  *(void *)((char *)v4 + 508) |= 0x100000000uLL;
  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_22:
    v4[29] = *(void *)&self->_openedICloudNotificationRatio1w;
    *(void *)((char *)v4 + 508) |= 0x10000000uLL;
  }
LABEL_23:
  if (self->_notificationUsageTypeTop1)
  {
    objc_msgSend(v9, "setNotificationUsageTypeTop1:");
    int v4 = v9;
  }
  if (self->_notificationUsageTypeTop2)
  {
    objc_msgSend(v9, "setNotificationUsageTypeTop2:");
    int v4 = v9;
  }
  if (self->_notificationUsageTypeTop3)
  {
    objc_msgSend(v9, "setNotificationUsageTypeTop3:");
    int v4 = v9;
  }
  if (self->_iCloudNotificationUsageTypeTop1)
  {
    objc_msgSend(v9, "setICloudNotificationUsageTypeTop1:");
    int v4 = v9;
  }
  if (self->_iCloudNotificationUsageTypeTop2)
  {
    objc_msgSend(v9, "setICloudNotificationUsageTypeTop2:");
    int v4 = v9;
  }
  if (self->_iCloudNotificationUsageTypeTop3)
  {
    objc_msgSend(v9, "setICloudNotificationUsageTypeTop3:");
    int v4 = v9;
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    v4[25] = *(void *)&self->_mlServerScore;
    *(void *)((char *)v4 + 508) |= 0x1000000uLL;
  }
  if (self->_labelMessage)
  {
    objc_msgSend(v9, "setLabelMessage:");
    int v4 = v9;
  }
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    v4[9] = self->_diskStorageCapacityBytes;
    *(void *)((char *)v4 + 508) |= 0x100uLL;
    $28C44C570028719347E25634D282F7AE v7 = self->_has;
    if ((*(void *)&v7 & 0x400000000000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v7 & 0x20000000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_108;
    }
  }
  else if ((*(void *)&v7 & 0x400000000000) == 0)
  {
    goto LABEL_41;
  }
  v4[47] = self->_usedDiskCapacityBytes;
  *(void *)((char *)v4 + 508) |= 0x400000000000uLL;
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) == 0)
  {
LABEL_42:
    if ((*(void *)&v7 & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_109;
  }
LABEL_108:
  v4[30] = *(void *)&self->_openedICloudNotificationRatio2w;
  *(void *)((char *)v4 + 508) |= 0x20000000uLL;
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(void *)&v7 & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_44;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v4 + 123) = self->_trafficType;
  *(void *)((char *)v4 + 508) |= 0x8000000000000uLL;
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_111;
  }
LABEL_110:
  v4[8] = self->_dailyScreenTimeSeconds;
  *(void *)((char *)v4 + 508) |= 0x80uLL;
  $28C44C570028719347E25634D282F7AE v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_111:
  v4[4] = self->_avgWeeklyScreenTimeSeconds2w;
  *(void *)((char *)v4 + 508) |= 8uLL;
  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_46:
    v4[7] = self->_daemonVersion;
    *(void *)((char *)v4 + 508) |= 0x40uLL;
  }
LABEL_47:
  if (self->_oBSOLETEDayOfWeek)
  {
    objc_msgSend(v9, "setOBSOLETEDayOfWeek:");
    int v4 = v9;
  }
  if (self->_deviceModelName)
  {
    objc_msgSend(v9, "setDeviceModelName:");
    int v4 = v9;
  }
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x800000000000) != 0)
  {
    *((_DWORD *)v4 + 96) = self->_dayOfWeek;
    *(void *)((char *)v4 + 508) |= 0x800000000000uLL;
    $28C44C570028719347E25634D282F7AE v8 = self->_has;
    if ((*(void *)&v8 & 0x400000000) == 0)
    {
LABEL_53:
      if ((*(void *)&v8 & 0x800000000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_115;
    }
  }
  else if ((*(void *)&v8 & 0x400000000) == 0)
  {
    goto LABEL_53;
  }
  v4[35] = self->_osVersionMajorVersion;
  *(void *)((char *)v4 + 508) |= 0x400000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x800000000) == 0)
  {
LABEL_54:
    if ((*(void *)&v8 & 0x1000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_116;
  }
LABEL_115:
  v4[36] = self->_osVersionMinorVersion;
  *(void *)((char *)v4 + 508) |= 0x800000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x1000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_117;
  }
LABEL_116:
  v4[37] = self->_osVersionPatchVersion;
  *(void *)((char *)v4 + 508) |= 0x1000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_56:
    if ((*(void *)&v8 & 0x2000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_118;
  }
LABEL_117:
  v4[28] = self->_offsetMins;
  *(void *)((char *)v4 + 508) |= 0x8000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x2000000000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v4 + 108) = self->_icloudNotificationActionLabel;
  *(void *)((char *)v4 + 508) |= 0x2000000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_59;
    }
    goto LABEL_120;
  }
LABEL_119:
  v4[23] = self->_minsUntilICloudNotificationOpened;
  *(void *)((char *)v4 + 508) |= 0x400000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_121;
  }
LABEL_120:
  v4[3] = self->_appLaunchCountSameSlot;
  *(void *)((char *)v4 + 508) |= 4uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_60:
    if ((*(void *)&v8 & 0x10000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_122;
  }
LABEL_121:
  v4[6] = self->_cameraLaunchCountSameSlot;
  *(void *)((char *)v4 + 508) |= 0x20uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x10000000000) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_62;
    }
    goto LABEL_123;
  }
LABEL_122:
  v4[41] = self->_photosLaunchCountSameSlot;
  *(void *)((char *)v4 + 508) |= 0x10000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_62:
    if ((*(void *)&v8 & 0x800000000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_124;
  }
LABEL_123:
  v4[12] = self->_filesLaunchCountSameSlot;
  *(void *)((char *)v4 + 508) |= 0x800uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x800000000000000) == 0)
  {
LABEL_63:
    if ((*(void *)&v8 & 0x80000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((unsigned char *)v4 + 506) = self->_isSleepModeOnSameSlot;
  *(void *)((char *)v4 + 508) |= 0x800000000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x80000000000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v8 & 0x200000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((unsigned char *)v4 + 502) = self->_isDoNotDisturbOnSameSlot;
  *(void *)((char *)v4 + 508) |= 0x80000000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x200000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((unsigned char *)v4 + 504) = self->_isDrivingModeOnSameSlot;
  *(void *)((char *)v4 + 508) |= 0x200000000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v8 & 0x4000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_128;
  }
LABEL_127:
  v4[26] = self->_numNotificationsSameSlot;
  *(void *)((char *)v4 + 508) |= 0x2000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v8 & 0x40000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_129;
  }
LABEL_128:
  v4[27] = self->_numOpenedNotificationsSameSlot;
  *(void *)((char *)v4 + 508) |= 0x4000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_130;
  }
LABEL_129:
  v4[19] = self->_minsSinceLastCameraAppLaunch1w;
  *(void *)((char *)v4 + 508) |= 0x40000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&v8 & 0x80000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_131;
  }
LABEL_130:
  v4[21] = self->_minsSinceLastPhotosAppLaunch1w;
  *(void *)((char *)v4 + 508) |= 0x100000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v8 & 0x10000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_132;
  }
LABEL_131:
  v4[20] = self->_minsSinceLastFilesAppLaunch1w;
  *(void *)((char *)v4 + 508) |= 0x80000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v8 & 0x4000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_133;
  }
LABEL_132:
  v4[17] = self->_isSleepModeOnCount2w;
  *(void *)((char *)v4 + 508) |= 0x10000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_134;
  }
LABEL_133:
  v4[15] = self->_isDoNotDisturbOnCount2w;
  *(void *)((char *)v4 + 508) |= 0x4000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_73:
    if ((*(unsigned char *)&v8 & 2) == 0) {
      goto LABEL_74;
    }
    goto LABEL_135;
  }
LABEL_134:
  v4[16] = self->_isDrivingModeOnCount2w;
  *(void *)((char *)v4 + 508) |= 0x8000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(unsigned char *)&v8 & 2) == 0)
  {
LABEL_74:
    if ((*(unsigned char *)&v8 & 1) == 0) {
      goto LABEL_75;
    }
    goto LABEL_136;
  }
LABEL_135:
  v4[2] = self->_appLaunchCount2wMedian;
  *(void *)((char *)v4 + 508) |= 2uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(unsigned char *)&v8 & 1) == 0)
  {
LABEL_75:
    if ((*(void *)&v8 & 0x8000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_137;
  }
LABEL_136:
  v4[1] = self->_appLaunchCount2wMax;
  *(void *)((char *)v4 + 508) |= 1uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x8000000000) == 0)
  {
LABEL_76:
    if ((*(void *)&v8 & 0x4000000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_138;
  }
LABEL_137:
  v4[40] = self->_photosLaunchCount2wMedian;
  *(void *)((char *)v4 + 508) |= 0x8000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x4000000000) == 0)
  {
LABEL_77:
    if ((*(void *)&v8 & 0x100000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_139;
  }
LABEL_138:
  v4[39] = self->_photosLaunchCount2wMax;
  *(void *)((char *)v4 + 508) |= 0x4000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000000) == 0)
  {
LABEL_78:
    if ((*(void *)&v8 & 0x80000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_140;
  }
LABEL_139:
  v4[45] = self->_totalNotificationCount2wMedian;
  *(void *)((char *)v4 + 508) |= 0x100000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x80000000000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v8 & 0x80000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_141;
  }
LABEL_140:
  v4[44] = self->_totalNotificationCount2wMax;
  *(void *)((char *)v4 + 508) |= 0x80000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v8 & 0x40000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_142;
  }
LABEL_141:
  v4[32] = self->_openedNotificationCount2wMedian;
  *(void *)((char *)v4 + 508) |= 0x80000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000000) == 0)
  {
LABEL_81:
    if ((*(void *)&v8 & 0x20000000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_143;
  }
LABEL_142:
  v4[31] = self->_openedNotificationCount2wMax;
  *(void *)((char *)v4 + 508) |= 0x40000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x20000000000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((unsigned char *)v4 + 500) = self->_buyLabel;
  *(void *)((char *)v4 + 508) |= 0x20000000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_83:
    if ((*(void *)&v8 & 0x1000000000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_145;
  }
LABEL_144:
  v4[22] = self->_minsUntilICloudBuy;
  *(void *)((char *)v4 + 508) |= 0x200000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x1000000000000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v8 & 0x800000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((unsigned char *)v4 + 507) = self->_openLabelSubStream;
  *(void *)((char *)v4 + 508) |= 0x1000000000000000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_85:
    if ((*(void *)&v8 & 0x10000000000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_147;
  }
LABEL_146:
  v4[24] = self->_minsUntilICloudOpenedSubStream;
  *(void *)((char *)v4 + 508) |= 0x800000uLL;
  $28C44C570028719347E25634D282F7AE v8 = self->_has;
  if ((*(void *)&v8 & 0x10000000000000) == 0)
  {
LABEL_86:
    if ((*(void *)&v8 & 0x4000000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_147:
  *((_DWORD *)v4 + 124) = self->_userTier;
  *(void *)((char *)v4 + 508) |= 0x10000000000000uLL;
  if ((*(void *)&self->_has & 0x4000000000000) != 0)
  {
LABEL_87:
    *((_DWORD *)v4 + 122) = self->_oBSOLETETrafficType;
    *(void *)((char *)v4 + 508) |= 0x4000000000000uLL;
  }
LABEL_88:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $28C44C570028719347E25634D282F7AE has = self->_has;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    *(void *)(v5 + 336) = self->_timestampMillis;
    *(void *)(v5 + 508) |= 0x20000000000uLL;
    $28C44C570028719347E25634D282F7AE has = self->_has;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    *(_DWORD *)(v5 + 400) = self->_hourOfDay;
    *(void *)(v5 + 508) |= 0x1000000000000uLL;
  }
  uint64_t v8 = [(NSString *)self->_lastOpenedAppId24h copyWithZone:a3];
  v9 = *(void **)(v6 + 448);
  *(void *)(v6 + 448) = v8;

  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    *(void *)(v6 + 144) = self->_lastOpenedAppHour24h;
    *(void *)(v6 + 508) |= 0x20000uLL;
    $28C44C570028719347E25634D282F7AE v10 = self->_has;
    if ((*(void *)&v10 & 0x400000000000000) == 0)
    {
LABEL_7:
      if ((*(void *)&v10 & 0x40000000000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_71;
    }
  }
  else if ((*(void *)&v10 & 0x400000000000000) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v6 + 505) = self->_isSleepModeOn;
  *(void *)(v6 + 508) |= 0x400000000000000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(void *)&v10 & 0x40000000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&v10 & 0x100000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(unsigned char *)(v6 + 501) = self->_isDoNotDisturbOn;
  *(void *)(v6 + 508) |= 0x40000000000000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(void *)&v10 & 0x100000000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&v10 & 0x200000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(unsigned char *)(v6 + 503) = self->_isDrivingModeOn;
  *(void *)(v6 + 508) |= 0x100000000000000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(void *)&v10 & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v10 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(double *)(v6 + 272) = self->_openedNotificationRatio24h;
  *(void *)(v6 + 508) |= 0x200000000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v10 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(void *)(v6 + 104) = self->_googleDriveAppLaunchCount1w;
  *(void *)(v6 + 508) |= 0x1000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v10 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(void *)(v6 + 112) = self->_googlePhotoAppLaunchCount1w;
  *(void *)(v6 + 508) |= 0x2000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v10 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(void *)(v6 + 80) = self->_dropboxAppLaunchCount1w;
  *(void *)(v6 + 508) |= 0x200uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
LABEL_14:
    if ((*(void *)&v10 & 0x2000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(void *)(v6 + 40) = self->_cameraAppLaunchCount1w;
  *(void *)(v6 + 508) |= 0x10uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(void *)&v10 & 0x2000000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(void *)(v6 + 304) = self->_photosAppLaunchCount1w;
  *(void *)(v6 + 508) |= 0x2000000000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) == 0)
  {
LABEL_16:
    if ((*(void *)&v10 & 0x40000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(void *)(v6 + 88) = self->_filesAppLaunchCount1w;
  *(void *)(v6 + 508) |= 0x400uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(void *)&v10 & 0x40000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&v10 & 0x200000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(void *)(v6 + 344) = self->_totalNotificationCount1w;
  *(void *)(v6 + 508) |= 0x40000000000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(void *)&v10 & 0x200000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&v10 & 0x100000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(void *)(v6 + 368) = self->_totalOpenedNotificationCount1w;
  *(void *)(v6 + 508) |= 0x200000000000uLL;
  $28C44C570028719347E25634D282F7AE v10 = self->_has;
  if ((*(void *)&v10 & 0x100000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v10 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_82:
  *(double *)(v6 + 264) = self->_openedNotificationRatio1w;
  *(void *)(v6 + 508) |= 0x100000000uLL;
  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_20:
    *(double *)(v6 + 232) = self->_openedICloudNotificationRatio1w;
    *(void *)(v6 + 508) |= 0x10000000uLL;
  }
LABEL_21:
  uint64_t v11 = [(NSString *)self->_notificationUsageTypeTop1 copyWithZone:a3];
  v12 = *(void **)(v6 + 456);
  *(void *)(v6 + 456) = v11;

  uint64_t v13 = [(NSString *)self->_notificationUsageTypeTop2 copyWithZone:a3];
  v14 = *(void **)(v6 + 464);
  *(void *)(v6 + 464) = v13;

  uint64_t v15 = [(NSString *)self->_notificationUsageTypeTop3 copyWithZone:a3];
  v16 = *(void **)(v6 + 472);
  *(void *)(v6 + 472) = v15;

  uint64_t v17 = [(NSString *)self->_iCloudNotificationUsageTypeTop1 copyWithZone:a3];
  v18 = *(void **)(v6 + 408);
  *(void *)(v6 + 408) = v17;

  uint64_t v19 = [(NSString *)self->_iCloudNotificationUsageTypeTop2 copyWithZone:a3];
  v20 = *(void **)(v6 + 416);
  *(void *)(v6 + 416) = v19;

  uint64_t v21 = [(NSString *)self->_iCloudNotificationUsageTypeTop3 copyWithZone:a3];
  v22 = *(void **)(v6 + 424);
  *(void *)(v6 + 424) = v21;

  if (*((unsigned char *)&self->_has + 3))
  {
    *(double *)(v6 + 200) = self->_mlServerScore;
    *(void *)(v6 + 508) |= 0x1000000uLL;
  }
  id v23 = [(ISOPBSubscriptionLabelMessage *)self->_labelMessage copyWithZone:a3];
  v24 = *(void **)(v6 + 440);
  *(void *)(v6 + 440) = v23;

  $28C44C570028719347E25634D282F7AE v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) != 0)
  {
    *(void *)(v6 + 72) = self->_diskStorageCapacityBytes;
    *(void *)(v6 + 508) |= 0x100uLL;
    $28C44C570028719347E25634D282F7AE v25 = self->_has;
    if ((*(void *)&v25 & 0x400000000000) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&v25 & 0x20000000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_86;
    }
  }
  else if ((*(void *)&v25 & 0x400000000000) == 0)
  {
    goto LABEL_25;
  }
  *(void *)(v6 + 376) = self->_usedDiskCapacityBytes;
  *(void *)(v6 + 508) |= 0x400000000000uLL;
  $28C44C570028719347E25634D282F7AE v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(void *)&v25 & 0x8000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(double *)(v6 + 240) = self->_openedICloudNotificationRatio2w;
  *(void *)(v6 + 508) |= 0x20000000uLL;
  $28C44C570028719347E25634D282F7AE v25 = self->_has;
  if ((*(void *)&v25 & 0x8000000000000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v25 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v6 + 492) = self->_trafficType;
  *(void *)(v6 + 508) |= 0x8000000000000uLL;
  $28C44C570028719347E25634D282F7AE v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x80) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v25 & 8) == 0) {
      goto LABEL_29;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(void *)(v6 + 64) = self->_dailyScreenTimeSeconds;
  *(void *)(v6 + 508) |= 0x80uLL;
  $28C44C570028719347E25634D282F7AE v25 = self->_has;
  if ((*(unsigned char *)&v25 & 8) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v25 & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_89:
  *(void *)(v6 + 32) = self->_avgWeeklyScreenTimeSeconds2w;
  *(void *)(v6 + 508) |= 8uLL;
  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_30:
    *(void *)(v6 + 56) = self->_daemonVersion;
    *(void *)(v6 + 508) |= 0x40uLL;
  }
LABEL_31:
  uint64_t v26 = [(NSString *)self->_oBSOLETEDayOfWeek copyWithZone:a3];
  v27 = *(void **)(v6 + 480);
  *(void *)(v6 + 480) = v26;

  uint64_t v28 = [(NSString *)self->_deviceModelName copyWithZone:a3];
  v29 = *(void **)(v6 + 392);
  *(void *)(v6 + 392) = v28;

  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x800000000000) != 0)
  {
    *(_DWORD *)(v6 + 384) = self->_dayOfWeek;
    *(void *)(v6 + 508) |= 0x800000000000uLL;
    $28C44C570028719347E25634D282F7AE v30 = self->_has;
    if ((*(void *)&v30 & 0x400000000) == 0)
    {
LABEL_33:
      if ((*(void *)&v30 & 0x800000000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_93;
    }
  }
  else if ((*(void *)&v30 & 0x400000000) == 0)
  {
    goto LABEL_33;
  }
  *(void *)(v6 + 280) = self->_osVersionMajorVersion;
  *(void *)(v6 + 508) |= 0x400000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x800000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v30 & 0x1000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(void *)(v6 + 288) = self->_osVersionMinorVersion;
  *(void *)(v6 + 508) |= 0x800000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v30 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(void *)(v6 + 296) = self->_osVersionPatchVersion;
  *(void *)(v6 + 508) |= 0x1000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v30 & 0x2000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(void *)(v6 + 224) = self->_offsetMins;
  *(void *)(v6 + 508) |= 0x8000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x2000000000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v30 & 0x400000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v6 + 432) = self->_icloudNotificationActionLabel;
  *(void *)(v6 + 508) |= 0x2000000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&v30 & 4) == 0) {
      goto LABEL_39;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(void *)(v6 + 184) = self->_minsUntilICloudNotificationOpened;
  *(void *)(v6 + 508) |= 0x400000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(unsigned char *)&v30 & 4) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v30 & 0x20) == 0) {
      goto LABEL_40;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(void *)(v6 + 24) = self->_appLaunchCountSameSlot;
  *(void *)(v6 + 508) |= 4uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(unsigned char *)&v30 & 0x20) == 0)
  {
LABEL_40:
    if ((*(void *)&v30 & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(void *)(v6 + 48) = self->_cameraLaunchCountSameSlot;
  *(void *)(v6 + 508) |= 0x20uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x10000000000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v30 & 0x800) == 0) {
      goto LABEL_42;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(void *)(v6 + 328) = self->_photosLaunchCountSameSlot;
  *(void *)(v6 + 508) |= 0x10000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x800) == 0)
  {
LABEL_42:
    if ((*(void *)&v30 & 0x800000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(void *)(v6 + 96) = self->_filesLaunchCountSameSlot;
  *(void *)(v6 + 508) |= 0x800uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x800000000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v30 & 0x80000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(unsigned char *)(v6 + 506) = self->_isSleepModeOnSameSlot;
  *(void *)(v6 + 508) |= 0x800000000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x80000000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&v30 & 0x200000000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(unsigned char *)(v6 + 502) = self->_isDoNotDisturbOnSameSlot;
  *(void *)(v6 + 508) |= 0x80000000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x200000000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v30 & 0x2000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(unsigned char *)(v6 + 504) = self->_isDrivingModeOnSameSlot;
  *(void *)(v6 + 508) |= 0x200000000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v30 & 0x4000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(void *)(v6 + 208) = self->_numNotificationsSameSlot;
  *(void *)(v6 + 508) |= 0x2000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x4000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v30 & 0x40000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(void *)(v6 + 216) = self->_numOpenedNotificationsSameSlot;
  *(void *)(v6 + 508) |= 0x4000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v30 & 0x100000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(void *)(v6 + 152) = self->_minsSinceLastCameraAppLaunch1w;
  *(void *)(v6 + 508) |= 0x40000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x100000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v30 & 0x80000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(void *)(v6 + 168) = self->_minsSinceLastPhotosAppLaunch1w;
  *(void *)(v6 + 508) |= 0x100000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x80000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v30 & 0x10000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(void *)(v6 + 160) = self->_minsSinceLastFilesAppLaunch1w;
  *(void *)(v6 + 508) |= 0x80000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x10000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v30 & 0x4000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(void *)(v6 + 136) = self->_isSleepModeOnCount2w;
  *(void *)(v6 + 508) |= 0x10000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x4000) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v30 & 0x8000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(void *)(v6 + 120) = self->_isDoNotDisturbOnCount2w;
  *(void *)(v6 + 508) |= 0x4000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x8000) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&v30 & 2) == 0) {
      goto LABEL_54;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(void *)(v6 + 128) = self->_isDrivingModeOnCount2w;
  *(void *)(v6 + 508) |= 0x8000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(unsigned char *)&v30 & 2) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&v30 & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(void *)(v6 + 16) = self->_appLaunchCount2wMedian;
  *(void *)(v6 + 508) |= 2uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(unsigned char *)&v30 & 1) == 0)
  {
LABEL_55:
    if ((*(void *)&v30 & 0x8000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(void *)(v6 + 8) = self->_appLaunchCount2wMax;
  *(void *)(v6 + 508) |= 1uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x8000000000) == 0)
  {
LABEL_56:
    if ((*(void *)&v30 & 0x4000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(void *)(v6 + 320) = self->_photosLaunchCount2wMedian;
  *(void *)(v6 + 508) |= 0x8000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x4000000000) == 0)
  {
LABEL_57:
    if ((*(void *)&v30 & 0x100000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(void *)(v6 + 312) = self->_photosLaunchCount2wMax;
  *(void *)(v6 + 508) |= 0x4000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x100000000000) == 0)
  {
LABEL_58:
    if ((*(void *)&v30 & 0x80000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(void *)(v6 + 360) = self->_totalNotificationCount2wMedian;
  *(void *)(v6 + 508) |= 0x100000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x80000000000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v30 & 0x80000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(void *)(v6 + 352) = self->_totalNotificationCount2wMax;
  *(void *)(v6 + 508) |= 0x80000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x80000000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v30 & 0x40000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(void *)(v6 + 256) = self->_openedNotificationCount2wMedian;
  *(void *)(v6 + 508) |= 0x80000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000000) == 0)
  {
LABEL_61:
    if ((*(void *)&v30 & 0x20000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_121;
  }
LABEL_120:
  *(void *)(v6 + 248) = self->_openedNotificationCount2wMax;
  *(void *)(v6 + 508) |= 0x40000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x20000000000000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v30 & 0x200000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(unsigned char *)(v6 + 500) = self->_buyLabel;
  *(void *)(v6 + 508) |= 0x20000000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x200000) == 0)
  {
LABEL_63:
    if ((*(void *)&v30 & 0x1000000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_123;
  }
LABEL_122:
  *(void *)(v6 + 176) = self->_minsUntilICloudBuy;
  *(void *)(v6 + 508) |= 0x200000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x1000000000000000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v30 & 0x800000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(unsigned char *)(v6 + 507) = self->_openLabelSubStream;
  *(void *)(v6 + 508) |= 0x1000000000000000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x800000) == 0)
  {
LABEL_65:
    if ((*(void *)&v30 & 0x10000000000000) == 0) {
      goto LABEL_66;
    }
LABEL_125:
    *(_DWORD *)(v6 + 496) = self->_userTier;
    *(void *)(v6 + 508) |= 0x10000000000000uLL;
    if ((*(void *)&self->_has & 0x4000000000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_124:
  *(void *)(v6 + 192) = self->_minsUntilICloudOpenedSubStream;
  *(void *)(v6 + 508) |= 0x800000uLL;
  $28C44C570028719347E25634D282F7AE v30 = self->_has;
  if ((*(void *)&v30 & 0x10000000000000) != 0) {
    goto LABEL_125;
  }
LABEL_66:
  if ((*(void *)&v30 & 0x4000000000000) != 0)
  {
LABEL_67:
    *(_DWORD *)(v6 + 488) = self->_oBSOLETETrafficType;
    *(void *)(v6 + 508) |= 0x4000000000000uLL;
  }
LABEL_68:
  id v31 = (id)v6;

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_353;
  }
  $28C44C570028719347E25634D282F7AE has = self->_has;
  uint64_t v6 = *(void *)(v4 + 508);
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_timestampMillis != *((void *)v4 + 42)) {
      goto LABEL_353;
    }
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v6 & 0x1000000000000) == 0 || self->_hourOfDay != *((_DWORD *)v4 + 100)) {
      goto LABEL_353;
    }
  }
  else if ((v6 & 0x1000000000000) != 0)
  {
    goto LABEL_353;
  }
  lastOpenedAppId24h = self->_lastOpenedAppId24h;
  if ((unint64_t)lastOpenedAppId24h | *((void *)v4 + 56))
  {
    if (!-[NSString isEqual:](lastOpenedAppId24h, "isEqual:")) {
      goto LABEL_353;
    }
    $28C44C570028719347E25634D282F7AE has = self->_has;
  }
  uint64_t v8 = *(void *)(v4 + 508);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_lastOpenedAppHour24h != *((void *)v4 + 18)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x400000000000000) != 0)
  {
    if ((v8 & 0x400000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_isSleepModeOn)
    {
      if (!v4[505]) {
        goto LABEL_353;
      }
    }
    else if (v4[505])
    {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x400000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x40000000000000) != 0)
  {
    if ((v8 & 0x40000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_isDoNotDisturbOn)
    {
      if (!v4[501]) {
        goto LABEL_353;
      }
    }
    else if (v4[501])
    {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x40000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x100000000000000) != 0)
  {
    if ((v8 & 0x100000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_isDrivingModeOn)
    {
      if (!v4[503]) {
        goto LABEL_353;
      }
    }
    else if (v4[503])
    {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x100000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0 || self->_openedNotificationRatio24h != *((double *)v4 + 34)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_googleDriveAppLaunchCount1w != *((void *)v4 + 13)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_googlePhotoAppLaunchCount1w != *((void *)v4 + 14)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_dropboxAppLaunchCount1w != *((void *)v4 + 10)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_353;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_cameraAppLaunchCount1w != *((void *)v4 + 5)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_photosAppLaunchCount1w != *((void *)v4 + 38)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_filesAppLaunchCount1w != *((void *)v4 + 11)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v8 & 0x40000000000) == 0 || self->_totalNotificationCount1w != *((void *)v4 + 43)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x40000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x200000000000) != 0)
  {
    if ((v8 & 0x200000000000) == 0 || self->_totalOpenedNotificationCount1w != *((void *)v4 + 46)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x200000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v8 & 0x100000000) == 0 || self->_openedNotificationRatio1w != *((double *)v4 + 33)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x100000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_openedICloudNotificationRatio1w != *((double *)v4 + 29)) {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_353;
  }
  notificationUsageTypeTop1 = self->_notificationUsageTypeTop1;
  if ((unint64_t)notificationUsageTypeTop1 | *((void *)v4 + 57)
    && !-[NSString isEqual:](notificationUsageTypeTop1, "isEqual:"))
  {
    goto LABEL_353;
  }
  notificationUsageTypeTop2 = self->_notificationUsageTypeTop2;
  if ((unint64_t)notificationUsageTypeTop2 | *((void *)v4 + 58))
  {
    if (!-[NSString isEqual:](notificationUsageTypeTop2, "isEqual:")) {
      goto LABEL_353;
    }
  }
  notificationUsageTypeTop3 = self->_notificationUsageTypeTop3;
  if ((unint64_t)notificationUsageTypeTop3 | *((void *)v4 + 59))
  {
    if (!-[NSString isEqual:](notificationUsageTypeTop3, "isEqual:")) {
      goto LABEL_353;
    }
  }
  iCloudNotificationUsageTypeTop1 = self->_iCloudNotificationUsageTypeTop1;
  if ((unint64_t)iCloudNotificationUsageTypeTop1 | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](iCloudNotificationUsageTypeTop1, "isEqual:")) {
      goto LABEL_353;
    }
  }
  iCloudNotificationUsageTypeTop2 = self->_iCloudNotificationUsageTypeTop2;
  if ((unint64_t)iCloudNotificationUsageTypeTop2 | *((void *)v4 + 52))
  {
    if (!-[NSString isEqual:](iCloudNotificationUsageTypeTop2, "isEqual:")) {
      goto LABEL_353;
    }
  }
  iCloudNotificationUsageTypeTop3 = self->_iCloudNotificationUsageTypeTop3;
  if ((unint64_t)iCloudNotificationUsageTypeTop3 | *((void *)v4 + 53))
  {
    if (!-[NSString isEqual:](iCloudNotificationUsageTypeTop3, "isEqual:")) {
      goto LABEL_353;
    }
  }
  $28C44C570028719347E25634D282F7AE v15 = self->_has;
  uint64_t v16 = *(void *)(v4 + 508);
  if ((*(_DWORD *)&v15 & 0x1000000) != 0)
  {
    if ((v16 & 0x1000000) == 0 || self->_mlServerScore != *((double *)v4 + 25)) {
      goto LABEL_353;
    }
  }
  else if ((v16 & 0x1000000) != 0)
  {
    goto LABEL_353;
  }
  labelMessage = self->_labelMessage;
  if ((unint64_t)labelMessage | *((void *)v4 + 55))
  {
    if (!-[ISOPBSubscriptionLabelMessage isEqual:](labelMessage, "isEqual:")) {
      goto LABEL_353;
    }
    $28C44C570028719347E25634D282F7AE v15 = self->_has;
  }
  uint64_t v18 = *(void *)(v4 + 508);
  if ((*(_WORD *)&v15 & 0x100) != 0)
  {
    if ((v18 & 0x100) == 0 || self->_diskStorageCapacityBytes != *((void *)v4 + 9)) {
      goto LABEL_353;
    }
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v15 & 0x400000000000) != 0)
  {
    if ((v18 & 0x400000000000) == 0 || self->_usedDiskCapacityBytes != *((void *)v4 + 47)) {
      goto LABEL_353;
    }
  }
  else if ((v18 & 0x400000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v15 & 0x20000000) != 0)
  {
    if ((v18 & 0x20000000) == 0 || self->_openedICloudNotificationRatio2w != *((double *)v4 + 30)) {
      goto LABEL_353;
    }
  }
  else if ((v18 & 0x20000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v15 & 0x8000000000000) != 0)
  {
    if ((v18 & 0x8000000000000) == 0 || self->_trafficType != *((_DWORD *)v4 + 123)) {
      goto LABEL_353;
    }
  }
  else if ((v18 & 0x8000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(unsigned char *)&v15 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_dailyScreenTimeSeconds != *((void *)v4 + 8)) {
      goto LABEL_353;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_353;
  }
  if ((*(unsigned char *)&v15 & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_avgWeeklyScreenTimeSeconds2w != *((void *)v4 + 4)) {
      goto LABEL_353;
    }
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_353;
  }
  if ((*(unsigned char *)&v15 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_daemonVersion != *((void *)v4 + 7)) {
      goto LABEL_353;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_353;
  }
  oBSOLETEDayOfWeek = self->_oBSOLETEDayOfWeek;
  if ((unint64_t)oBSOLETEDayOfWeek | *((void *)v4 + 60)
    && !-[NSString isEqual:](oBSOLETEDayOfWeek, "isEqual:"))
  {
    goto LABEL_353;
  }
  deviceModelName = self->_deviceModelName;
  if ((unint64_t)deviceModelName | *((void *)v4 + 49))
  {
    if (!-[NSString isEqual:](deviceModelName, "isEqual:")) {
      goto LABEL_353;
    }
  }
  $28C44C570028719347E25634D282F7AE v21 = self->_has;
  uint64_t v22 = *(void *)(v4 + 508);
  if ((*(void *)&v21 & 0x800000000000) != 0)
  {
    if ((v22 & 0x800000000000) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 96)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x800000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x400000000) != 0)
  {
    if ((v22 & 0x400000000) == 0 || self->_osVersionMajorVersion != *((void *)v4 + 35)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x400000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x800000000) != 0)
  {
    if ((v22 & 0x800000000) == 0 || self->_osVersionMinorVersion != *((void *)v4 + 36)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x800000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x1000000000) != 0)
  {
    if ((v22 & 0x1000000000) == 0 || self->_osVersionPatchVersion != *((void *)v4 + 37)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x1000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x8000000) != 0)
  {
    if ((v22 & 0x8000000) == 0 || self->_offsetMins != *((void *)v4 + 28)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x8000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x2000000000000) != 0)
  {
    if ((v22 & 0x2000000000000) == 0 || self->_icloudNotificationActionLabel != *((_DWORD *)v4 + 108)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x2000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x400000) != 0)
  {
    if ((v22 & 0x400000) == 0 || self->_minsUntilICloudNotificationOpened != *((void *)v4 + 23)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x400000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(unsigned char *)&v21 & 4) != 0)
  {
    if ((v22 & 4) == 0 || self->_appLaunchCountSameSlot != *((void *)v4 + 3)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 4) != 0)
  {
    goto LABEL_353;
  }
  if ((*(unsigned char *)&v21 & 0x20) != 0)
  {
    if ((v22 & 0x20) == 0 || self->_cameraLaunchCountSameSlot != *((void *)v4 + 6)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x20) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x10000000000) != 0)
  {
    if ((v22 & 0x10000000000) == 0 || self->_photosLaunchCountSameSlot != *((void *)v4 + 41)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x10000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&v21 & 0x800) != 0)
  {
    if ((v22 & 0x800) == 0 || self->_filesLaunchCountSameSlot != *((void *)v4 + 12)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x800) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x800000000000000) != 0)
  {
    if ((v22 & 0x800000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_isSleepModeOnSameSlot)
    {
      if (!v4[506]) {
        goto LABEL_353;
      }
    }
    else if (v4[506])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x800000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x80000000000000) != 0)
  {
    if ((v22 & 0x80000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_isDoNotDisturbOnSameSlot)
    {
      if (!v4[502]) {
        goto LABEL_353;
      }
    }
    else if (v4[502])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x80000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x200000000000000) != 0)
  {
    if ((v22 & 0x200000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_isDrivingModeOnSameSlot)
    {
      if (!v4[504]) {
        goto LABEL_353;
      }
    }
    else if (v4[504])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x200000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x2000000) != 0)
  {
    if ((v22 & 0x2000000) == 0 || self->_numNotificationsSameSlot != *((void *)v4 + 26)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x2000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x4000000) != 0)
  {
    if ((v22 & 0x4000000) == 0 || self->_numOpenedNotificationsSameSlot != *((void *)v4 + 27)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x4000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    if ((v22 & 0x40000) == 0 || self->_minsSinceLastCameraAppLaunch1w != *((void *)v4 + 19)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x40000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x100000) != 0)
  {
    if ((v22 & 0x100000) == 0 || self->_minsSinceLastPhotosAppLaunch1w != *((void *)v4 + 21)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x100000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    if ((v22 & 0x80000) == 0 || self->_minsSinceLastFilesAppLaunch1w != *((void *)v4 + 20)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x80000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x10000) != 0)
  {
    if ((v22 & 0x10000) == 0 || self->_isSleepModeOnCount2w != *((void *)v4 + 17)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x10000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&v21 & 0x4000) != 0)
  {
    if ((v22 & 0x4000) == 0 || self->_isDoNotDisturbOnCount2w != *((void *)v4 + 15)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x4000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&v21 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0 || self->_isDrivingModeOnCount2w != *((void *)v4 + 16)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(unsigned char *)&v21 & 2) != 0)
  {
    if ((v22 & 2) == 0 || self->_appLaunchCount2wMedian != *((void *)v4 + 2)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 2) != 0)
  {
    goto LABEL_353;
  }
  if (*(unsigned char *)&v21)
  {
    if ((v22 & 1) == 0 || self->_appLaunchCount2wMax != *((void *)v4 + 1)) {
      goto LABEL_353;
    }
  }
  else if (v22)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x8000000000) != 0)
  {
    if ((v22 & 0x8000000000) == 0 || self->_photosLaunchCount2wMedian != *((void *)v4 + 40)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x8000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x4000000000) != 0)
  {
    if ((v22 & 0x4000000000) == 0 || self->_photosLaunchCount2wMax != *((void *)v4 + 39)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x4000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x100000000000) != 0)
  {
    if ((v22 & 0x100000000000) == 0 || self->_totalNotificationCount2wMedian != *((void *)v4 + 45)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x100000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x80000000000) != 0)
  {
    if ((v22 & 0x80000000000) == 0 || self->_totalNotificationCount2wMax != *((void *)v4 + 44)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x80000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x80000000) != 0)
  {
    if ((v22 & 0x80000000) == 0 || self->_openedNotificationCount2wMedian != *((void *)v4 + 32)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x80000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x40000000) != 0)
  {
    if ((v22 & 0x40000000) == 0 || self->_openedNotificationCount2wMax != *((void *)v4 + 31)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x40000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x20000000000000) != 0)
  {
    if ((v22 & 0x20000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_buyLabel)
    {
      if (!v4[500]) {
        goto LABEL_353;
      }
    }
    else if (v4[500])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x20000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x200000) != 0)
  {
    if ((v22 & 0x200000) == 0 || self->_minsUntilICloudBuy != *((void *)v4 + 22)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x200000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x1000000000000000) != 0)
  {
    if ((v22 & 0x1000000000000000) == 0) {
      goto LABEL_353;
    }
    if (self->_openLabelSubStream)
    {
      if (!v4[507]) {
        goto LABEL_353;
      }
    }
    else if (v4[507])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x1000000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x800000) != 0)
  {
    if ((v22 & 0x800000) == 0 || self->_minsUntilICloudOpenedSubStream != *((void *)v4 + 24)) {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x800000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(void *)&v21 & 0x10000000000000) == 0)
  {
    if ((v22 & 0x10000000000000) == 0) {
      goto LABEL_348;
    }
LABEL_353:
    BOOL v23 = 0;
    goto LABEL_354;
  }
  if ((v22 & 0x10000000000000) == 0 || self->_userTier != *((_DWORD *)v4 + 124)) {
    goto LABEL_353;
  }
LABEL_348:
  if ((*(void *)&v21 & 0x4000000000000) != 0)
  {
    if ((v22 & 0x4000000000000) == 0 || self->_oBSOLETETrafficType != *((_DWORD *)v4 + 122)) {
      goto LABEL_353;
    }
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = (v22 & 0x4000000000000) == 0;
  }
LABEL_354:

  return v23;
}

- (unint64_t)hash
{
  $28C44C570028719347E25634D282F7AE has = self->_has;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    uint64_t v103 = 2654435761 * self->_timestampMillis;
    if ((*(void *)&has & 0x1000000000000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v103 = 0;
    if ((*(void *)&has & 0x1000000000000) != 0)
    {
LABEL_3:
      uint64_t v102 = 2654435761 * self->_hourOfDay;
      goto LABEL_6;
    }
  }
  uint64_t v102 = 0;
LABEL_6:
  NSUInteger v101 = [(NSString *)self->_lastOpenedAppId24h hash];
  $28C44C570028719347E25634D282F7AE v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    uint64_t v100 = 2654435761 * self->_lastOpenedAppHour24h;
    if ((*(void *)&v4 & 0x400000000000000) != 0)
    {
LABEL_8:
      uint64_t v99 = 2654435761 * self->_isSleepModeOn;
      if ((*(void *)&v4 & 0x40000000000000) != 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v100 = 0;
    if ((*(void *)&v4 & 0x400000000000000) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v99 = 0;
  if ((*(void *)&v4 & 0x40000000000000) != 0)
  {
LABEL_9:
    uint64_t v98 = 2654435761 * self->_isDoNotDisturbOn;
    if ((*(void *)&v4 & 0x100000000000000) != 0) {
      goto LABEL_10;
    }
LABEL_18:
    uint64_t v97 = 0;
    if ((*(void *)&v4 & 0x200000000) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    unint64_t v9 = 0;
    goto LABEL_22;
  }
LABEL_17:
  uint64_t v98 = 0;
  if ((*(void *)&v4 & 0x100000000000000) == 0) {
    goto LABEL_18;
  }
LABEL_10:
  uint64_t v97 = 2654435761 * self->_isDrivingModeOn;
  if ((*(void *)&v4 & 0x200000000) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  double openedNotificationRatio24h = self->_openedNotificationRatio24h;
  double v6 = -openedNotificationRatio24h;
  if (openedNotificationRatio24h >= 0.0) {
    double v6 = self->_openedNotificationRatio24h;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_22:
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
    uint64_t v95 = 2654435761 * self->_googleDriveAppLaunchCount1w;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
    {
LABEL_24:
      uint64_t v94 = 2654435761 * self->_googlePhotoAppLaunchCount1w;
      if ((*(_WORD *)&v4 & 0x200) != 0) {
        goto LABEL_25;
      }
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v95 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_24;
    }
  }
  uint64_t v94 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_25:
    uint64_t v93 = 2654435761 * self->_dropboxAppLaunchCount1w;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v93 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_26:
    uint64_t v92 = 2654435761 * self->_cameraAppLaunchCount1w;
    if ((*(void *)&v4 & 0x2000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v92 = 0;
  if ((*(void *)&v4 & 0x2000000000) != 0)
  {
LABEL_27:
    uint64_t v91 = 2654435761 * self->_photosAppLaunchCount1w;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v91 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_28:
    uint64_t v90 = 2654435761 * self->_filesAppLaunchCount1w;
    if ((*(void *)&v4 & 0x40000000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v90 = 0;
  if ((*(void *)&v4 & 0x40000000000) != 0)
  {
LABEL_29:
    uint64_t v89 = 2654435761 * self->_totalNotificationCount1w;
    if ((*(void *)&v4 & 0x200000000000) != 0) {
      goto LABEL_30;
    }
LABEL_42:
    uint64_t v88 = 0;
    if ((*(void *)&v4 & 0x100000000) != 0) {
      goto LABEL_31;
    }
LABEL_43:
    unint64_t v14 = 0;
    goto LABEL_46;
  }
LABEL_41:
  uint64_t v89 = 0;
  if ((*(void *)&v4 & 0x200000000000) == 0) {
    goto LABEL_42;
  }
LABEL_30:
  uint64_t v88 = 2654435761 * self->_totalOpenedNotificationCount1w;
  if ((*(void *)&v4 & 0x100000000) == 0) {
    goto LABEL_43;
  }
LABEL_31:
  double openedNotificationRatio1w = self->_openedNotificationRatio1w;
  double v11 = -openedNotificationRatio1w;
  if (openedNotificationRatio1w >= 0.0) {
    double v11 = self->_openedNotificationRatio1w;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_46:
  unint64_t v87 = v14;
  if ((*(_DWORD *)&v4 & 0x10000000) != 0)
  {
    double openedICloudNotificationRatio1w = self->_openedICloudNotificationRatio1w;
    double v17 = -openedICloudNotificationRatio1w;
    if (openedICloudNotificationRatio1w >= 0.0) {
      double v17 = self->_openedICloudNotificationRatio1w;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  unint64_t v86 = v15;
  NSUInteger v85 = [(NSString *)self->_notificationUsageTypeTop1 hash];
  NSUInteger v84 = [(NSString *)self->_notificationUsageTypeTop2 hash];
  NSUInteger v83 = [(NSString *)self->_notificationUsageTypeTop3 hash];
  NSUInteger v82 = [(NSString *)self->_iCloudNotificationUsageTypeTop1 hash];
  NSUInteger v81 = [(NSString *)self->_iCloudNotificationUsageTypeTop2 hash];
  NSUInteger v80 = [(NSString *)self->_iCloudNotificationUsageTypeTop3 hash];
  unint64_t v96 = v9;
  if (*((unsigned char *)&self->_has + 3))
  {
    double mlServerScore = self->_mlServerScore;
    double v22 = -mlServerScore;
    if (mlServerScore >= 0.0) {
      double v22 = self->_mlServerScore;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  unint64_t v79 = v20;
  unint64_t v78 = [(ISOPBSubscriptionLabelMessage *)self->_labelMessage hash];
  $28C44C570028719347E25634D282F7AE v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
    uint64_t v77 = 0;
    if ((*(void *)&v25 & 0x400000000000) != 0) {
      goto LABEL_64;
    }
LABEL_70:
    uint64_t v76 = 0;
    if ((*(_DWORD *)&v25 & 0x20000000) != 0) {
      goto LABEL_65;
    }
LABEL_71:
    unint64_t v30 = 0;
    goto LABEL_74;
  }
  uint64_t v77 = 2654435761 * self->_diskStorageCapacityBytes;
  if ((*(void *)&v25 & 0x400000000000) == 0) {
    goto LABEL_70;
  }
LABEL_64:
  uint64_t v76 = 2654435761 * self->_usedDiskCapacityBytes;
  if ((*(_DWORD *)&v25 & 0x20000000) == 0) {
    goto LABEL_71;
  }
LABEL_65:
  double openedICloudNotificationRatio2w = self->_openedICloudNotificationRatio2w;
  double v27 = -openedICloudNotificationRatio2w;
  if (openedICloudNotificationRatio2w >= 0.0) {
    double v27 = self->_openedICloudNotificationRatio2w;
  }
  long double v28 = floor(v27 + 0.5);
  double v29 = (v27 - v28) * 1.84467441e19;
  unint64_t v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
  if (v29 >= 0.0)
  {
    if (v29 > 0.0) {
      v30 += (unint64_t)v29;
    }
  }
  else
  {
    v30 -= (unint64_t)fabs(v29);
  }
LABEL_74:
  if ((*(void *)&v25 & 0x8000000000000) == 0)
  {
    uint64_t v74 = 0;
    if ((*(unsigned char *)&v25 & 0x80) != 0) {
      goto LABEL_76;
    }
LABEL_79:
    uint64_t v73 = 0;
    if ((*(unsigned char *)&v25 & 8) != 0) {
      goto LABEL_77;
    }
    goto LABEL_80;
  }
  uint64_t v74 = 2654435761 * self->_trafficType;
  if ((*(unsigned char *)&v25 & 0x80) == 0) {
    goto LABEL_79;
  }
LABEL_76:
  uint64_t v73 = 2654435761 * self->_dailyScreenTimeSeconds;
  if ((*(unsigned char *)&v25 & 8) != 0)
  {
LABEL_77:
    uint64_t v72 = 2654435761 * self->_avgWeeklyScreenTimeSeconds2w;
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v72 = 0;
LABEL_81:
  unint64_t v75 = v30;
  if ((*(unsigned char *)&v25 & 0x40) != 0) {
    uint64_t v71 = 2654435761 * self->_daemonVersion;
  }
  else {
    uint64_t v71 = 0;
  }
  NSUInteger v70 = [(NSString *)self->_oBSOLETEDayOfWeek hash];
  NSUInteger v69 = [(NSString *)self->_deviceModelName hash];
  $28C44C570028719347E25634D282F7AE v31 = self->_has;
  if ((*(void *)&v31 & 0x800000000000) != 0)
  {
    uint64_t v68 = 2654435761 * self->_dayOfWeek;
    if ((*(void *)&v31 & 0x400000000) != 0)
    {
LABEL_86:
      uint64_t v67 = 2654435761 * self->_osVersionMajorVersion;
      if ((*(void *)&v31 & 0x800000000) != 0) {
        goto LABEL_87;
      }
      goto LABEL_123;
    }
  }
  else
  {
    uint64_t v68 = 0;
    if ((*(void *)&v31 & 0x400000000) != 0) {
      goto LABEL_86;
    }
  }
  uint64_t v67 = 0;
  if ((*(void *)&v31 & 0x800000000) != 0)
  {
LABEL_87:
    uint64_t v66 = 2654435761 * self->_osVersionMinorVersion;
    if ((*(void *)&v31 & 0x1000000000) != 0) {
      goto LABEL_88;
    }
    goto LABEL_124;
  }
LABEL_123:
  uint64_t v66 = 0;
  if ((*(void *)&v31 & 0x1000000000) != 0)
  {
LABEL_88:
    uint64_t v65 = 2654435761 * self->_osVersionPatchVersion;
    if ((*(_DWORD *)&v31 & 0x8000000) != 0) {
      goto LABEL_89;
    }
    goto LABEL_125;
  }
LABEL_124:
  uint64_t v65 = 0;
  if ((*(_DWORD *)&v31 & 0x8000000) != 0)
  {
LABEL_89:
    uint64_t v64 = 2654435761 * self->_offsetMins;
    if ((*(void *)&v31 & 0x2000000000000) != 0) {
      goto LABEL_90;
    }
    goto LABEL_126;
  }
LABEL_125:
  uint64_t v64 = 0;
  if ((*(void *)&v31 & 0x2000000000000) != 0)
  {
LABEL_90:
    uint64_t v63 = 2654435761 * self->_icloudNotificationActionLabel;
    if ((*(_DWORD *)&v31 & 0x400000) != 0) {
      goto LABEL_91;
    }
    goto LABEL_127;
  }
LABEL_126:
  uint64_t v63 = 0;
  if ((*(_DWORD *)&v31 & 0x400000) != 0)
  {
LABEL_91:
    uint64_t v62 = 2654435761 * self->_minsUntilICloudNotificationOpened;
    if ((*(unsigned char *)&v31 & 4) != 0) {
      goto LABEL_92;
    }
    goto LABEL_128;
  }
LABEL_127:
  uint64_t v62 = 0;
  if ((*(unsigned char *)&v31 & 4) != 0)
  {
LABEL_92:
    uint64_t v61 = 2654435761 * self->_appLaunchCountSameSlot;
    if ((*(unsigned char *)&v31 & 0x20) != 0) {
      goto LABEL_93;
    }
    goto LABEL_129;
  }
LABEL_128:
  uint64_t v61 = 0;
  if ((*(unsigned char *)&v31 & 0x20) != 0)
  {
LABEL_93:
    uint64_t v60 = 2654435761 * self->_cameraLaunchCountSameSlot;
    if ((*(void *)&v31 & 0x10000000000) != 0) {
      goto LABEL_94;
    }
    goto LABEL_130;
  }
LABEL_129:
  uint64_t v60 = 0;
  if ((*(void *)&v31 & 0x10000000000) != 0)
  {
LABEL_94:
    uint64_t v59 = 2654435761 * self->_photosLaunchCountSameSlot;
    if ((*(_WORD *)&v31 & 0x800) != 0) {
      goto LABEL_95;
    }
    goto LABEL_131;
  }
LABEL_130:
  uint64_t v59 = 0;
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
LABEL_95:
    uint64_t v32 = 2654435761 * self->_filesLaunchCountSameSlot;
    if ((*(void *)&v31 & 0x800000000000000) != 0) {
      goto LABEL_96;
    }
    goto LABEL_132;
  }
LABEL_131:
  uint64_t v32 = 0;
  if ((*(void *)&v31 & 0x800000000000000) != 0)
  {
LABEL_96:
    uint64_t v33 = 2654435761 * self->_isSleepModeOnSameSlot;
    if ((*(void *)&v31 & 0x80000000000000) != 0) {
      goto LABEL_97;
    }
    goto LABEL_133;
  }
LABEL_132:
  uint64_t v33 = 0;
  if ((*(void *)&v31 & 0x80000000000000) != 0)
  {
LABEL_97:
    uint64_t v34 = 2654435761 * self->_isDoNotDisturbOnSameSlot;
    if ((*(void *)&v31 & 0x200000000000000) != 0) {
      goto LABEL_98;
    }
    goto LABEL_134;
  }
LABEL_133:
  uint64_t v34 = 0;
  if ((*(void *)&v31 & 0x200000000000000) != 0)
  {
LABEL_98:
    uint64_t v35 = 2654435761 * self->_isDrivingModeOnSameSlot;
    if ((*(_DWORD *)&v31 & 0x2000000) != 0) {
      goto LABEL_99;
    }
    goto LABEL_135;
  }
LABEL_134:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&v31 & 0x2000000) != 0)
  {
LABEL_99:
    uint64_t v36 = 2654435761 * self->_numNotificationsSameSlot;
    if ((*(_DWORD *)&v31 & 0x4000000) != 0) {
      goto LABEL_100;
    }
    goto LABEL_136;
  }
LABEL_135:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
LABEL_100:
    uint64_t v37 = 2654435761 * self->_numOpenedNotificationsSameSlot;
    if ((*(_DWORD *)&v31 & 0x40000) != 0) {
      goto LABEL_101;
    }
    goto LABEL_137;
  }
LABEL_136:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&v31 & 0x40000) != 0)
  {
LABEL_101:
    uint64_t v38 = 2654435761 * self->_minsSinceLastCameraAppLaunch1w;
    if ((*(_DWORD *)&v31 & 0x100000) != 0) {
      goto LABEL_102;
    }
    goto LABEL_138;
  }
LABEL_137:
  uint64_t v38 = 0;
  if ((*(_DWORD *)&v31 & 0x100000) != 0)
  {
LABEL_102:
    uint64_t v39 = 2654435761 * self->_minsSinceLastPhotosAppLaunch1w;
    if ((*(_DWORD *)&v31 & 0x80000) != 0) {
      goto LABEL_103;
    }
    goto LABEL_139;
  }
LABEL_138:
  uint64_t v39 = 0;
  if ((*(_DWORD *)&v31 & 0x80000) != 0)
  {
LABEL_103:
    uint64_t v40 = 2654435761 * self->_minsSinceLastFilesAppLaunch1w;
    if ((*(_DWORD *)&v31 & 0x10000) != 0) {
      goto LABEL_104;
    }
    goto LABEL_140;
  }
LABEL_139:
  uint64_t v40 = 0;
  if ((*(_DWORD *)&v31 & 0x10000) != 0)
  {
LABEL_104:
    uint64_t v41 = 2654435761 * self->_isSleepModeOnCount2w;
    if ((*(_WORD *)&v31 & 0x4000) != 0) {
      goto LABEL_105;
    }
    goto LABEL_141;
  }
LABEL_140:
  uint64_t v41 = 0;
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
LABEL_105:
    uint64_t v42 = 2654435761 * self->_isDoNotDisturbOnCount2w;
    if ((*(_WORD *)&v31 & 0x8000) != 0) {
      goto LABEL_106;
    }
    goto LABEL_142;
  }
LABEL_141:
  uint64_t v42 = 0;
  if ((*(_WORD *)&v31 & 0x8000) != 0)
  {
LABEL_106:
    uint64_t v43 = 2654435761 * self->_isDrivingModeOnCount2w;
    if ((*(unsigned char *)&v31 & 2) != 0) {
      goto LABEL_107;
    }
    goto LABEL_143;
  }
LABEL_142:
  uint64_t v43 = 0;
  if ((*(unsigned char *)&v31 & 2) != 0)
  {
LABEL_107:
    uint64_t v44 = 2654435761 * self->_appLaunchCount2wMedian;
    if (*(unsigned char *)&v31) {
      goto LABEL_108;
    }
    goto LABEL_144;
  }
LABEL_143:
  uint64_t v44 = 0;
  if (*(unsigned char *)&v31)
  {
LABEL_108:
    uint64_t v45 = 2654435761 * self->_appLaunchCount2wMax;
    if ((*(void *)&v31 & 0x8000000000) != 0) {
      goto LABEL_109;
    }
    goto LABEL_145;
  }
LABEL_144:
  uint64_t v45 = 0;
  if ((*(void *)&v31 & 0x8000000000) != 0)
  {
LABEL_109:
    uint64_t v46 = 2654435761 * self->_photosLaunchCount2wMedian;
    if ((*(void *)&v31 & 0x4000000000) != 0) {
      goto LABEL_110;
    }
    goto LABEL_146;
  }
LABEL_145:
  uint64_t v46 = 0;
  if ((*(void *)&v31 & 0x4000000000) != 0)
  {
LABEL_110:
    uint64_t v47 = 2654435761 * self->_photosLaunchCount2wMax;
    if ((*(void *)&v31 & 0x100000000000) != 0) {
      goto LABEL_111;
    }
    goto LABEL_147;
  }
LABEL_146:
  uint64_t v47 = 0;
  if ((*(void *)&v31 & 0x100000000000) != 0)
  {
LABEL_111:
    uint64_t v48 = 2654435761 * self->_totalNotificationCount2wMedian;
    if ((*(void *)&v31 & 0x80000000000) != 0) {
      goto LABEL_112;
    }
    goto LABEL_148;
  }
LABEL_147:
  uint64_t v48 = 0;
  if ((*(void *)&v31 & 0x80000000000) != 0)
  {
LABEL_112:
    uint64_t v49 = 2654435761 * self->_totalNotificationCount2wMax;
    if ((*(_DWORD *)&v31 & 0x80000000) != 0) {
      goto LABEL_113;
    }
    goto LABEL_149;
  }
LABEL_148:
  uint64_t v49 = 0;
  if ((*(_DWORD *)&v31 & 0x80000000) != 0)
  {
LABEL_113:
    uint64_t v50 = 2654435761 * self->_openedNotificationCount2wMedian;
    if ((*(_DWORD *)&v31 & 0x40000000) != 0) {
      goto LABEL_114;
    }
    goto LABEL_150;
  }
LABEL_149:
  uint64_t v50 = 0;
  if ((*(_DWORD *)&v31 & 0x40000000) != 0)
  {
LABEL_114:
    uint64_t v51 = 2654435761 * self->_openedNotificationCount2wMax;
    if ((*(void *)&v31 & 0x20000000000000) != 0) {
      goto LABEL_115;
    }
    goto LABEL_151;
  }
LABEL_150:
  uint64_t v51 = 0;
  if ((*(void *)&v31 & 0x20000000000000) != 0)
  {
LABEL_115:
    uint64_t v52 = 2654435761 * self->_buyLabel;
    if ((*(_DWORD *)&v31 & 0x200000) != 0) {
      goto LABEL_116;
    }
    goto LABEL_152;
  }
LABEL_151:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
LABEL_116:
    uint64_t v53 = 2654435761 * self->_minsUntilICloudBuy;
    if ((*(void *)&v31 & 0x1000000000000000) != 0) {
      goto LABEL_117;
    }
    goto LABEL_153;
  }
LABEL_152:
  uint64_t v53 = 0;
  if ((*(void *)&v31 & 0x1000000000000000) != 0)
  {
LABEL_117:
    uint64_t v54 = 2654435761 * self->_openLabelSubStream;
    if ((*(_DWORD *)&v31 & 0x800000) != 0) {
      goto LABEL_118;
    }
    goto LABEL_154;
  }
LABEL_153:
  uint64_t v54 = 0;
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
LABEL_118:
    uint64_t v55 = 2654435761 * self->_minsUntilICloudOpenedSubStream;
    if ((*(void *)&v31 & 0x10000000000000) != 0) {
      goto LABEL_119;
    }
LABEL_155:
    uint64_t v56 = 0;
    if ((*(void *)&v31 & 0x4000000000000) != 0) {
      goto LABEL_120;
    }
LABEL_156:
    uint64_t v57 = 0;
    return v102 ^ v103 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v101 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ v43 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57;
  }
LABEL_154:
  uint64_t v55 = 0;
  if ((*(void *)&v31 & 0x10000000000000) == 0) {
    goto LABEL_155;
  }
LABEL_119:
  uint64_t v56 = 2654435761 * self->_userTier;
  if ((*(void *)&v31 & 0x4000000000000) == 0) {
    goto LABEL_156;
  }
LABEL_120:
  uint64_t v57 = 2654435761 * self->_oBSOLETETrafficType;
  return v102 ^ v103 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v101 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ v43 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  $28C44C570028719347E25634D282F7AE v4 = (char *)a3;
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 + 508);
  if ((v6 & 0x20000000000) != 0)
  {
    self->_timestampMillis = *((void *)v4 + 42);
    *(void *)&self->_has |= 0x20000000000uLL;
    uint64_t v6 = *(void *)(v4 + 508);
  }
  if ((v6 & 0x1000000000000) != 0)
  {
    self->_hourOfDay = *((_DWORD *)v4 + 100);
    *(void *)&self->_has |= 0x1000000000000uLL;
  }
  long double v12 = v4;
  if (*((void *)v4 + 56))
  {
    -[ISOPBSubscriptiondPetMessage setLastOpenedAppId24h:](self, "setLastOpenedAppId24h:");
    uint64_t v5 = v12;
  }
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x20000) != 0)
  {
    self->_lastOpenedAppHour24h = *((void *)v5 + 18);
    *(void *)&self->_has |= 0x20000uLL;
    uint64_t v7 = *(void *)(v5 + 508);
    if ((v7 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((v7 & 0x40000000000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_42;
    }
  }
  else if ((v7 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  self->_isSleepModeOn = v5[505];
  *(void *)&self->_has |= 0x400000000000000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((v7 & 0x100000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_isDoNotDisturbOn = v5[501];
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_isDrivingModeOn = v5[503];
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_12:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_double openedNotificationRatio24h = *((double *)v5 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x1000) == 0)
  {
LABEL_13:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_googleDriveAppLaunchCount1w = *((void *)v5 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x2000) == 0)
  {
LABEL_14:
    if ((v7 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_googlePhotoAppLaunchCount1w = *((void *)v5 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x200) == 0)
  {
LABEL_15:
    if ((v7 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_dropboxAppLaunchCount1w = *((void *)v5 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x10) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_cameraAppLaunchCount1w = *((void *)v5 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((v7 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_photosAppLaunchCount1w = *((void *)v5 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x400) == 0)
  {
LABEL_18:
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_filesAppLaunchCount1w = *((void *)v5 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((v7 & 0x200000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_totalNotificationCount1w = *((void *)v5 + 43);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((v7 & 0x100000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_totalOpenedNotificationCount1w = *((void *)v5 + 46);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v7 = *(void *)(v5 + 508);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_21:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_53:
  self->_double openedNotificationRatio1w = *((double *)v5 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  if ((*(void *)(v5 + 508) & 0x10000000) != 0)
  {
LABEL_22:
    self->_double openedICloudNotificationRatio1w = *((double *)v5 + 29);
    *(void *)&self->_has |= 0x10000000uLL;
  }
LABEL_23:
  if (*((void *)v5 + 57))
  {
    -[ISOPBSubscriptiondPetMessage setNotificationUsageTypeTop1:](self, "setNotificationUsageTypeTop1:");
    uint64_t v5 = v12;
  }
  if (*((void *)v5 + 58))
  {
    -[ISOPBSubscriptiondPetMessage setNotificationUsageTypeTop2:](self, "setNotificationUsageTypeTop2:");
    uint64_t v5 = v12;
  }
  if (*((void *)v5 + 59))
  {
    -[ISOPBSubscriptiondPetMessage setNotificationUsageTypeTop3:](self, "setNotificationUsageTypeTop3:");
    uint64_t v5 = v12;
  }
  if (*((void *)v5 + 51))
  {
    -[ISOPBSubscriptiondPetMessage setICloudNotificationUsageTypeTop1:](self, "setICloudNotificationUsageTypeTop1:");
    uint64_t v5 = v12;
  }
  if (*((void *)v5 + 52))
  {
    -[ISOPBSubscriptiondPetMessage setICloudNotificationUsageTypeTop2:](self, "setICloudNotificationUsageTypeTop2:");
    uint64_t v5 = v12;
  }
  if (*((void *)v5 + 53))
  {
    -[ISOPBSubscriptiondPetMessage setICloudNotificationUsageTypeTop3:](self, "setICloudNotificationUsageTypeTop3:");
    uint64_t v5 = v12;
  }
  if (v5[511])
  {
    self->_double mlServerScore = *((double *)v5 + 25);
    *(void *)&self->_has |= 0x1000000uLL;
  }
  labelMessage = self->_labelMessage;
  uint64_t v9 = *((void *)v5 + 55);
  if (labelMessage)
  {
    if (!v9) {
      goto LABEL_58;
    }
    -[ISOPBSubscriptionLabelMessage mergeFrom:](labelMessage, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_58;
    }
    -[ISOPBSubscriptiondPetMessage setLabelMessage:](self, "setLabelMessage:");
  }
  uint64_t v5 = v12;
LABEL_58:
  uint64_t v10 = *(void *)(v5 + 508);
  if ((v10 & 0x100) != 0)
  {
    self->_diskStorageCapacityBytes = *((void *)v5 + 9);
    *(void *)&self->_has |= 0x100uLL;
    uint64_t v10 = *(void *)(v5 + 508);
    if ((v10 & 0x400000000000) == 0)
    {
LABEL_60:
      if ((v10 & 0x20000000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_112;
    }
  }
  else if ((v10 & 0x400000000000) == 0)
  {
    goto LABEL_60;
  }
  self->_usedDiskCapacityBytes = *((void *)v5 + 47);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v10 = *(void *)(v5 + 508);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_61:
    if ((v10 & 0x8000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_double openedICloudNotificationRatio2w = *((double *)v5 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v10 = *(void *)(v5 + 508);
  if ((v10 & 0x8000000000000) == 0)
  {
LABEL_62:
    if ((v10 & 0x80) == 0) {
      goto LABEL_63;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_uint64_t trafficType = *((_DWORD *)v5 + 123);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v10 = *(void *)(v5 + 508);
  if ((v10 & 0x80) == 0)
  {
LABEL_63:
    if ((v10 & 8) == 0) {
      goto LABEL_64;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_dailyScreenTimeSeconds = *((void *)v5 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v10 = *(void *)(v5 + 508);
  if ((v10 & 8) == 0)
  {
LABEL_64:
    if ((v10 & 0x40) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_115:
  self->_avgWeeklyScreenTimeSeconds2w = *((void *)v5 + 4);
  *(void *)&self->_has |= 8uLL;
  if ((*(void *)(v5 + 508) & 0x40) != 0)
  {
LABEL_65:
    self->_daemonVersion = *((void *)v5 + 7);
    *(void *)&self->_has |= 0x40uLL;
  }
LABEL_66:
  if (*((void *)v5 + 60))
  {
    -[ISOPBSubscriptiondPetMessage setOBSOLETEDayOfWeek:](self, "setOBSOLETEDayOfWeek:");
    uint64_t v5 = v12;
  }
  if (*((void *)v5 + 49))
  {
    -[ISOPBSubscriptiondPetMessage setDeviceModelName:](self, "setDeviceModelName:");
    uint64_t v5 = v12;
  }
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x800000000000) != 0)
  {
    self->_uint64_t dayOfWeek = *((_DWORD *)v5 + 96);
    *(void *)&self->_has |= 0x800000000000uLL;
    uint64_t v11 = *(void *)(v5 + 508);
    if ((v11 & 0x400000000) == 0)
    {
LABEL_72:
      if ((v11 & 0x800000000) == 0) {
        goto LABEL_73;
      }
      goto LABEL_119;
    }
  }
  else if ((v11 & 0x400000000) == 0)
  {
    goto LABEL_72;
  }
  self->_osVersionMajorVersion = *((void *)v5 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x800000000) == 0)
  {
LABEL_73:
    if ((v11 & 0x1000000000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_osVersionMinorVersion = *((void *)v5 + 36);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x1000000000) == 0)
  {
LABEL_74:
    if ((v11 & 0x8000000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_osVersionPatchVersion = *((void *)v5 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x8000000) == 0)
  {
LABEL_75:
    if ((v11 & 0x2000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_offsetMins = *((void *)v5 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x2000000000000) == 0)
  {
LABEL_76:
    if ((v11 & 0x400000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_uint64_t icloudNotificationActionLabel = *((_DWORD *)v5 + 108);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x400000) == 0)
  {
LABEL_77:
    if ((v11 & 4) == 0) {
      goto LABEL_78;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_minsUntilICloudNotificationOpened = *((void *)v5 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 4) == 0)
  {
LABEL_78:
    if ((v11 & 0x20) == 0) {
      goto LABEL_79;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_appLaunchCountSameSlot = *((void *)v5 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x20) == 0)
  {
LABEL_79:
    if ((v11 & 0x10000000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_cameraLaunchCountSameSlot = *((void *)v5 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x10000000000) == 0)
  {
LABEL_80:
    if ((v11 & 0x800) == 0) {
      goto LABEL_81;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_photosLaunchCountSameSlot = *((void *)v5 + 41);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x800) == 0)
  {
LABEL_81:
    if ((v11 & 0x800000000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_filesLaunchCountSameSlot = *((void *)v5 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x800000000000000) == 0)
  {
LABEL_82:
    if ((v11 & 0x80000000000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_isSleepModeOnSameSlot = v5[506];
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x80000000000000) == 0)
  {
LABEL_83:
    if ((v11 & 0x200000000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_isDoNotDisturbOnSameSlot = v5[502];
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x200000000000000) == 0)
  {
LABEL_84:
    if ((v11 & 0x2000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_isDrivingModeOnSameSlot = v5[504];
  *(void *)&self->_has |= 0x200000000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_85:
    if ((v11 & 0x4000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_numNotificationsSameSlot = *((void *)v5 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x4000000) == 0)
  {
LABEL_86:
    if ((v11 & 0x40000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_numOpenedNotificationsSameSlot = *((void *)v5 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x40000) == 0)
  {
LABEL_87:
    if ((v11 & 0x100000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_minsSinceLastCameraAppLaunch1w = *((void *)v5 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x100000) == 0)
  {
LABEL_88:
    if ((v11 & 0x80000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_minsSinceLastPhotosAppLaunch1w = *((void *)v5 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x80000) == 0)
  {
LABEL_89:
    if ((v11 & 0x10000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_minsSinceLastFilesAppLaunch1w = *((void *)v5 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x10000) == 0)
  {
LABEL_90:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_isSleepModeOnCount2w = *((void *)v5 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x4000) == 0)
  {
LABEL_91:
    if ((v11 & 0x8000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_isDoNotDisturbOnCount2w = *((void *)v5 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x8000) == 0)
  {
LABEL_92:
    if ((v11 & 2) == 0) {
      goto LABEL_93;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_isDrivingModeOnCount2w = *((void *)v5 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 2) == 0)
  {
LABEL_93:
    if ((v11 & 1) == 0) {
      goto LABEL_94;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_appLaunchCount2wMedian = *((void *)v5 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 1) == 0)
  {
LABEL_94:
    if ((v11 & 0x8000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_141;
  }
LABEL_140:
  self->_appLaunchCount2wMax = *((void *)v5 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x8000000000) == 0)
  {
LABEL_95:
    if ((v11 & 0x4000000000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_photosLaunchCount2wMedian = *((void *)v5 + 40);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x4000000000) == 0)
  {
LABEL_96:
    if ((v11 & 0x100000000000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_photosLaunchCount2wMax = *((void *)v5 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_97:
    if ((v11 & 0x80000000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_totalNotificationCount2wMedian = *((void *)v5 + 45);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x80000000000) == 0)
  {
LABEL_98:
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_totalNotificationCount2wMax = *((void *)v5 + 44);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_99:
    if ((v11 & 0x40000000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_openedNotificationCount2wMedian = *((void *)v5 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_100:
    if ((v11 & 0x20000000000000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_openedNotificationCount2wMax = *((void *)v5 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_101:
    if ((v11 & 0x200000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_148;
  }
LABEL_147:
  self->_buyLabel = v5[500];
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x200000) == 0)
  {
LABEL_102:
    if ((v11 & 0x1000000000000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_minsUntilICloudBuy = *((void *)v5 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x1000000000000000) == 0)
  {
LABEL_103:
    if ((v11 & 0x800000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_openLabelSubStream = v5[507];
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x800000) == 0)
  {
LABEL_104:
    if ((v11 & 0x10000000000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_minsUntilICloudOpenedSubStream = *((void *)v5 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v11 = *(void *)(v5 + 508);
  if ((v11 & 0x10000000000000) == 0)
  {
LABEL_105:
    if ((v11 & 0x4000000000000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_106;
  }
LABEL_151:
  self->_uint64_t userTier = *((_DWORD *)v5 + 124);
  *(void *)&self->_has |= 0x10000000000000uLL;
  if ((*(void *)(v5 + 508) & 0x4000000000000) != 0)
  {
LABEL_106:
    self->_uint64_t oBSOLETETrafficType = *((_DWORD *)v5 + 122);
    *(void *)&self->_has |= 0x4000000000000uLL;
  }
LABEL_107:
  MEMORY[0x270F9A758]();
}

- (int64_t)timestampMillis
{
  return self->_timestampMillis;
}

- (int)hourOfDay
{
  return self->_hourOfDay;
}

- (NSString)lastOpenedAppId24h
{
  return self->_lastOpenedAppId24h;
}

- (void)setLastOpenedAppId24h:(id)a3
{
}

- (int64_t)lastOpenedAppHour24h
{
  return self->_lastOpenedAppHour24h;
}

- (BOOL)isSleepModeOn
{
  return self->_isSleepModeOn;
}

- (BOOL)isDoNotDisturbOn
{
  return self->_isDoNotDisturbOn;
}

- (BOOL)isDrivingModeOn
{
  return self->_isDrivingModeOn;
}

- (double)openedNotificationRatio24h
{
  return self->_openedNotificationRatio24h;
}

- (int64_t)googleDriveAppLaunchCount1w
{
  return self->_googleDriveAppLaunchCount1w;
}

- (int64_t)googlePhotoAppLaunchCount1w
{
  return self->_googlePhotoAppLaunchCount1w;
}

- (int64_t)dropboxAppLaunchCount1w
{
  return self->_dropboxAppLaunchCount1w;
}

- (int64_t)cameraAppLaunchCount1w
{
  return self->_cameraAppLaunchCount1w;
}

- (int64_t)photosAppLaunchCount1w
{
  return self->_photosAppLaunchCount1w;
}

- (int64_t)filesAppLaunchCount1w
{
  return self->_filesAppLaunchCount1w;
}

- (int64_t)totalNotificationCount1w
{
  return self->_totalNotificationCount1w;
}

- (int64_t)totalOpenedNotificationCount1w
{
  return self->_totalOpenedNotificationCount1w;
}

- (double)openedNotificationRatio1w
{
  return self->_openedNotificationRatio1w;
}

- (double)openedICloudNotificationRatio1w
{
  return self->_openedICloudNotificationRatio1w;
}

- (NSString)notificationUsageTypeTop1
{
  return self->_notificationUsageTypeTop1;
}

- (void)setNotificationUsageTypeTop1:(id)a3
{
}

- (NSString)notificationUsageTypeTop2
{
  return self->_notificationUsageTypeTop2;
}

- (void)setNotificationUsageTypeTop2:(id)a3
{
}

- (NSString)notificationUsageTypeTop3
{
  return self->_notificationUsageTypeTop3;
}

- (void)setNotificationUsageTypeTop3:(id)a3
{
}

- (NSString)iCloudNotificationUsageTypeTop1
{
  return self->_iCloudNotificationUsageTypeTop1;
}

- (void)setICloudNotificationUsageTypeTop1:(id)a3
{
}

- (NSString)iCloudNotificationUsageTypeTop2
{
  return self->_iCloudNotificationUsageTypeTop2;
}

- (void)setICloudNotificationUsageTypeTop2:(id)a3
{
}

- (NSString)iCloudNotificationUsageTypeTop3
{
  return self->_iCloudNotificationUsageTypeTop3;
}

- (void)setICloudNotificationUsageTypeTop3:(id)a3
{
}

- (double)mlServerScore
{
  return self->_mlServerScore;
}

- (ISOPBSubscriptionLabelMessage)labelMessage
{
  return self->_labelMessage;
}

- (void)setLabelMessage:(id)a3
{
}

- (int64_t)diskStorageCapacityBytes
{
  return self->_diskStorageCapacityBytes;
}

- (int64_t)usedDiskCapacityBytes
{
  return self->_usedDiskCapacityBytes;
}

- (double)openedICloudNotificationRatio2w
{
  return self->_openedICloudNotificationRatio2w;
}

- (int64_t)dailyScreenTimeSeconds
{
  return self->_dailyScreenTimeSeconds;
}

- (int64_t)avgWeeklyScreenTimeSeconds2w
{
  return self->_avgWeeklyScreenTimeSeconds2w;
}

- (int64_t)daemonVersion
{
  return self->_daemonVersion;
}

- (NSString)oBSOLETEDayOfWeek
{
  return self->_oBSOLETEDayOfWeek;
}

- (void)setOBSOLETEDayOfWeek:(id)a3
{
}

- (NSString)deviceModelName
{
  return self->_deviceModelName;
}

- (void)setDeviceModelName:(id)a3
{
}

- (int64_t)osVersionMajorVersion
{
  return self->_osVersionMajorVersion;
}

- (int64_t)osVersionMinorVersion
{
  return self->_osVersionMinorVersion;
}

- (int64_t)osVersionPatchVersion
{
  return self->_osVersionPatchVersion;
}

- (int64_t)offsetMins
{
  return self->_offsetMins;
}

- (int64_t)minsUntilICloudNotificationOpened
{
  return self->_minsUntilICloudNotificationOpened;
}

- (int64_t)appLaunchCountSameSlot
{
  return self->_appLaunchCountSameSlot;
}

- (int64_t)cameraLaunchCountSameSlot
{
  return self->_cameraLaunchCountSameSlot;
}

- (int64_t)photosLaunchCountSameSlot
{
  return self->_photosLaunchCountSameSlot;
}

- (int64_t)filesLaunchCountSameSlot
{
  return self->_filesLaunchCountSameSlot;
}

- (BOOL)isSleepModeOnSameSlot
{
  return self->_isSleepModeOnSameSlot;
}

- (BOOL)isDoNotDisturbOnSameSlot
{
  return self->_isDoNotDisturbOnSameSlot;
}

- (BOOL)isDrivingModeOnSameSlot
{
  return self->_isDrivingModeOnSameSlot;
}

- (int64_t)numNotificationsSameSlot
{
  return self->_numNotificationsSameSlot;
}

- (int64_t)numOpenedNotificationsSameSlot
{
  return self->_numOpenedNotificationsSameSlot;
}

- (int64_t)minsSinceLastCameraAppLaunch1w
{
  return self->_minsSinceLastCameraAppLaunch1w;
}

- (int64_t)minsSinceLastPhotosAppLaunch1w
{
  return self->_minsSinceLastPhotosAppLaunch1w;
}

- (int64_t)minsSinceLastFilesAppLaunch1w
{
  return self->_minsSinceLastFilesAppLaunch1w;
}

- (int64_t)isSleepModeOnCount2w
{
  return self->_isSleepModeOnCount2w;
}

- (int64_t)isDoNotDisturbOnCount2w
{
  return self->_isDoNotDisturbOnCount2w;
}

- (int64_t)isDrivingModeOnCount2w
{
  return self->_isDrivingModeOnCount2w;
}

- (int64_t)appLaunchCount2wMedian
{
  return self->_appLaunchCount2wMedian;
}

- (int64_t)appLaunchCount2wMax
{
  return self->_appLaunchCount2wMax;
}

- (int64_t)photosLaunchCount2wMedian
{
  return self->_photosLaunchCount2wMedian;
}

- (int64_t)photosLaunchCount2wMax
{
  return self->_photosLaunchCount2wMax;
}

- (int64_t)totalNotificationCount2wMedian
{
  return self->_totalNotificationCount2wMedian;
}

- (int64_t)totalNotificationCount2wMax
{
  return self->_totalNotificationCount2wMax;
}

- (int64_t)openedNotificationCount2wMedian
{
  return self->_openedNotificationCount2wMedian;
}

- (int64_t)openedNotificationCount2wMax
{
  return self->_openedNotificationCount2wMax;
}

- (BOOL)buyLabel
{
  return self->_buyLabel;
}

- (int64_t)minsUntilICloudBuy
{
  return self->_minsUntilICloudBuy;
}

- (BOOL)openLabelSubStream
{
  return self->_openLabelSubStream;
}

- (int64_t)minsUntilICloudOpenedSubStream
{
  return self->_minsUntilICloudOpenedSubStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oBSOLETEDayOfWeek, 0);
  objc_storeStrong((id *)&self->_notificationUsageTypeTop3, 0);
  objc_storeStrong((id *)&self->_notificationUsageTypeTop2, 0);
  objc_storeStrong((id *)&self->_notificationUsageTypeTop1, 0);
  objc_storeStrong((id *)&self->_lastOpenedAppId24h, 0);
  objc_storeStrong((id *)&self->_labelMessage, 0);
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop3, 0);
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop2, 0);
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop1, 0);
  objc_storeStrong((id *)&self->_deviceModelName, 0);
}

@end