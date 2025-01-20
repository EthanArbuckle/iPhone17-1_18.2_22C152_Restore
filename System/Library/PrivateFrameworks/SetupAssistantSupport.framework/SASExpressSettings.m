@interface SASExpressSettings
- (BOOL)appAnalyticsOptIn;
- (BOOL)deviceAnalyticsOptIn;
- (BOOL)fileVaultEnabled;
- (BOOL)findMyOptIn;
- (BOOL)hasAppAnalyticsOptIn;
- (BOOL)hasAppAnalyticsPrivacyBundle;
- (BOOL)hasAppearanceMode;
- (BOOL)hasDeviceAnalyticsOptIn;
- (BOOL)hasDeviceAnalyticsPrivacyBundle;
- (BOOL)hasDisplayZoomOption;
- (BOOL)hasFileVaultEnabled;
- (BOOL)hasFindMyOptIn;
- (BOOL)hasFindMyPrivacyBundle;
- (BOOL)hasLocationServicesOptIn;
- (BOOL)hasLocationServicesPrivacyBundle;
- (BOOL)hasProductVersion;
- (BOOL)hasScreenTimeEnabled;
- (BOOL)hasSiriDataSharingOptIn;
- (BOOL)hasSiriOptIn;
- (BOOL)hasSiriPrivacyBundle;
- (BOOL)hasSiriVoiceTriggerEnabled;
- (BOOL)hasSoftwareUpdateAutoDownloadEnabled;
- (BOOL)hasSoftwareUpdateAutoUpdateEnabled;
- (BOOL)hasStolenDeviceProtectionEnabled;
- (BOOL)hasStolenDeviceProtectionStrictModeEnabled;
- (BOOL)hasUnlockWithWatchEnabled;
- (BOOL)hasWalletData;
- (BOOL)hasWatchMigrationData;
- (BOOL)isEqual:(id)a3;
- (BOOL)locationServicesOptIn;
- (BOOL)readFrom:(id)a3;
- (BOOL)screenTimeEnabled;
- (BOOL)siriDataSharingOptIn;
- (BOOL)siriOptIn;
- (BOOL)siriVoiceTriggerEnabled;
- (BOOL)softwareUpdateAutoDownloadEnabled;
- (BOOL)softwareUpdateAutoUpdateEnabled;
- (BOOL)stolenDeviceProtectionEnabled;
- (BOOL)stolenDeviceProtectionStrictModeEnabled;
- (BOOL)unlockWithWatchEnabled;
- (NSData)walletData;
- (NSData)watchMigrationData;
- (NSString)deviceClass;
- (NSString)productType;
- (NSString)productVersion;
- (SASExpressSettingsPrivacyBundle)appAnalyticsPrivacyBundle;
- (SASExpressSettingsPrivacyBundle)deviceAnalyticsPrivacyBundle;
- (SASExpressSettingsPrivacyBundle)findMyPrivacyBundle;
- (SASExpressSettingsPrivacyBundle)locationServicesPrivacyBundle;
- (SASExpressSettingsPrivacyBundle)siriPrivacyBundle;
- (id)appearanceModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayZoomOptionAsString:(int)a3;
- (int)StringAsAppearanceMode:(id)a3;
- (int)StringAsDisplayZoomOption:(id)a3;
- (int)appearanceMode;
- (int)displayZoomOption;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppAnalyticsOptIn:(BOOL)a3;
- (void)setAppAnalyticsPrivacyBundle:(id)a3;
- (void)setAppearanceMode:(int)a3;
- (void)setDeviceAnalyticsOptIn:(BOOL)a3;
- (void)setDeviceAnalyticsPrivacyBundle:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDisplayZoomOption:(int)a3;
- (void)setFileVaultEnabled:(BOOL)a3;
- (void)setFindMyOptIn:(BOOL)a3;
- (void)setFindMyPrivacyBundle:(id)a3;
- (void)setHasAppAnalyticsOptIn:(BOOL)a3;
- (void)setHasAppearanceMode:(BOOL)a3;
- (void)setHasDeviceAnalyticsOptIn:(BOOL)a3;
- (void)setHasDisplayZoomOption:(BOOL)a3;
- (void)setHasFileVaultEnabled:(BOOL)a3;
- (void)setHasFindMyOptIn:(BOOL)a3;
- (void)setHasLocationServicesOptIn:(BOOL)a3;
- (void)setHasScreenTimeEnabled:(BOOL)a3;
- (void)setHasSiriDataSharingOptIn:(BOOL)a3;
- (void)setHasSiriOptIn:(BOOL)a3;
- (void)setHasSiriVoiceTriggerEnabled:(BOOL)a3;
- (void)setHasSoftwareUpdateAutoDownloadEnabled:(BOOL)a3;
- (void)setHasSoftwareUpdateAutoUpdateEnabled:(BOOL)a3;
- (void)setHasStolenDeviceProtectionEnabled:(BOOL)a3;
- (void)setHasStolenDeviceProtectionStrictModeEnabled:(BOOL)a3;
- (void)setHasUnlockWithWatchEnabled:(BOOL)a3;
- (void)setLocationServicesOptIn:(BOOL)a3;
- (void)setLocationServicesPrivacyBundle:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setScreenTimeEnabled:(BOOL)a3;
- (void)setSiriDataSharingOptIn:(BOOL)a3;
- (void)setSiriOptIn:(BOOL)a3;
- (void)setSiriPrivacyBundle:(id)a3;
- (void)setSiriVoiceTriggerEnabled:(BOOL)a3;
- (void)setSoftwareUpdateAutoDownloadEnabled:(BOOL)a3;
- (void)setSoftwareUpdateAutoUpdateEnabled:(BOOL)a3;
- (void)setStolenDeviceProtectionEnabled:(BOOL)a3;
- (void)setStolenDeviceProtectionStrictModeEnabled:(BOOL)a3;
- (void)setUnlockWithWatchEnabled:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWalletData:(id)a3;
- (void)setWatchMigrationData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SASExpressSettings

- (BOOL)hasWatchMigrationData
{
  return self->_watchMigrationData != 0;
}

- (BOOL)hasWalletData
{
  return self->_walletData != 0;
}

- (void)setDeviceAnalyticsOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_deviceAnalyticsOptIn = a3;
}

- (void)setHasDeviceAnalyticsOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDeviceAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAppAnalyticsOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appAnalyticsOptIn = a3;
}

- (void)setHasAppAnalyticsOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLocationServicesOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_locationServicesOptIn = a3;
}

- (void)setHasLocationServicesOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLocationServicesOptIn
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFindMyOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_findMyOptIn = a3;
}

- (void)setHasFindMyOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFindMyOptIn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSiriOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_siriOptIn = a3;
}

- (void)setHasSiriOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSiriOptIn
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_screenTimeEnabled = a3;
}

- (void)setHasScreenTimeEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScreenTimeEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSoftwareUpdateAutoUpdateEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_softwareUpdateAutoUpdateEnabled = a3;
}

- (void)setHasSoftwareUpdateAutoUpdateEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSoftwareUpdateAutoUpdateEnabled
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSoftwareUpdateAutoDownloadEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_softwareUpdateAutoDownloadEnabled = a3;
}

- (void)setHasSoftwareUpdateAutoDownloadEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSoftwareUpdateAutoDownloadEnabled
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSiriDataSharingOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_siriDataSharingOptIn = a3;
}

- (void)setHasSiriDataSharingOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSiriDataSharingOptIn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)appearanceMode
{
  if (*(_WORD *)&self->_has) {
    return self->_appearanceMode;
  }
  else {
    return 1;
  }
}

- (void)setAppearanceMode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_appearanceMode = a3;
}

- (void)setHasAppearanceMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAppearanceMode
{
  return *(_WORD *)&self->_has & 1;
}

- (id)appearanceModeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = *(&off_1E6CAB980 + a3 - 1);
  }
  return v3;
}

- (int)StringAsAppearanceMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LIGHT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DARK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTO"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasDeviceAnalyticsPrivacyBundle
{
  return self->_deviceAnalyticsPrivacyBundle != 0;
}

- (BOOL)hasAppAnalyticsPrivacyBundle
{
  return self->_appAnalyticsPrivacyBundle != 0;
}

- (BOOL)hasLocationServicesPrivacyBundle
{
  return self->_locationServicesPrivacyBundle != 0;
}

- (BOOL)hasFindMyPrivacyBundle
{
  return self->_findMyPrivacyBundle != 0;
}

- (BOOL)hasSiriPrivacyBundle
{
  return self->_siriPrivacyBundle != 0;
}

- (int)displayZoomOption
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_displayZoomOption;
  }
  else {
    return 1;
  }
}

- (void)setDisplayZoomOption:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_displayZoomOption = a3;
}

- (void)setHasDisplayZoomOption:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisplayZoomOption
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)displayZoomOptionAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"STANDARD";
  }
  else if (a3 == 2)
  {
    int v4 = @"ZOOMED";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsDisplayZoomOption:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"STANDARD"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"ZOOMED"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (void)setUnlockWithWatchEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_unlockWithWatchEnabled = a3;
}

- (void)setHasUnlockWithWatchEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasUnlockWithWatchEnabled
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setFileVaultEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fileVaultEnabled = a3;
}

- (void)setHasFileVaultEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFileVaultEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSiriVoiceTriggerEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_siriVoiceTriggerEnabled = a3;
}

- (void)setHasSiriVoiceTriggerEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSiriVoiceTriggerEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (void)setStolenDeviceProtectionEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_stolenDeviceProtectionEnabled = a3;
}

- (void)setHasStolenDeviceProtectionEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasStolenDeviceProtectionEnabled
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setStolenDeviceProtectionStrictModeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_stolenDeviceProtectionStrictModeEnabled = a3;
}

- (void)setHasStolenDeviceProtectionStrictModeEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasStolenDeviceProtectionStrictModeEnabled
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SASExpressSettings;
  int v4 = [(SASExpressSettings *)&v8 description];
  v5 = [(SASExpressSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  watchMigrationData = self->_watchMigrationData;
  if (watchMigrationData) {
    [v3 setObject:watchMigrationData forKey:@"watchMigrationData"];
  }
  walletData = self->_walletData;
  if (walletData) {
    [v3 setObject:walletData forKey:@"walletData"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_deviceAnalyticsOptIn];
    [v3 setObject:v8 forKey:@"deviceAnalyticsOptIn"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  v9 = [NSNumber numberWithBool:self->_appAnalyticsOptIn];
  [v3 setObject:v9 forKey:@"appAnalyticsOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = [NSNumber numberWithBool:self->_locationServicesOptIn];
  [v3 setObject:v10 forKey:@"locationServicesOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = [NSNumber numberWithBool:self->_findMyOptIn];
  [v3 setObject:v11 forKey:@"findMyOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = [NSNumber numberWithBool:self->_siriOptIn];
  [v3 setObject:v12 forKey:@"siriOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = [NSNumber numberWithBool:self->_screenTimeEnabled];
  [v3 setObject:v13 forKey:@"screenTimeEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = [NSNumber numberWithBool:self->_softwareUpdateAutoUpdateEnabled];
  [v3 setObject:v14 forKey:@"softwareUpdateAutoUpdateEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  v15 = [NSNumber numberWithBool:self->_softwareUpdateAutoDownloadEnabled];
  [v3 setObject:v15 forKey:@"softwareUpdateAutoDownloadEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
LABEL_24:
  v16 = [NSNumber numberWithBool:self->_siriDataSharingOptIn];
  [v3 setObject:v16 forKey:@"siriDataSharingOptIn"];

  if ((*(_WORD *)&self->_has & 1) == 0) {
    goto LABEL_29;
  }
LABEL_25:
  int v17 = self->_appearanceMode - 1;
  if (v17 >= 3)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_appearanceMode);
  }
  else
  {
    v18 = *(&off_1E6CAB980 + v17);
  }
  [v3 setObject:v18 forKey:@"appearanceMode"];

LABEL_29:
  deviceAnalyticsPrivacyBundle = self->_deviceAnalyticsPrivacyBundle;
  if (deviceAnalyticsPrivacyBundle)
  {
    v20 = [(SASExpressSettingsPrivacyBundle *)deviceAnalyticsPrivacyBundle dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"deviceAnalyticsPrivacyBundle"];
  }
  appAnalyticsPrivacyBundle = self->_appAnalyticsPrivacyBundle;
  if (appAnalyticsPrivacyBundle)
  {
    v22 = [(SASExpressSettingsPrivacyBundle *)appAnalyticsPrivacyBundle dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"appAnalyticsPrivacyBundle"];
  }
  locationServicesPrivacyBundle = self->_locationServicesPrivacyBundle;
  if (locationServicesPrivacyBundle)
  {
    v24 = [(SASExpressSettingsPrivacyBundle *)locationServicesPrivacyBundle dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"locationServicesPrivacyBundle"];
  }
  findMyPrivacyBundle = self->_findMyPrivacyBundle;
  if (findMyPrivacyBundle)
  {
    v26 = [(SASExpressSettingsPrivacyBundle *)findMyPrivacyBundle dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"findMyPrivacyBundle"];
  }
  siriPrivacyBundle = self->_siriPrivacyBundle;
  if (siriPrivacyBundle)
  {
    v28 = [(SASExpressSettingsPrivacyBundle *)siriPrivacyBundle dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"siriPrivacyBundle"];
  }
  productType = self->_productType;
  if (productType) {
    [v3 setObject:productType forKey:@"productType"];
  }
  deviceClass = self->_deviceClass;
  if (deviceClass) {
    [v3 setObject:deviceClass forKey:@"deviceClass"];
  }
  __int16 v31 = (__int16)self->_has;
  if ((v31 & 2) != 0)
  {
    int displayZoomOption = self->_displayZoomOption;
    if (displayZoomOption == 1)
    {
      v39 = @"STANDARD";
    }
    else if (displayZoomOption == 2)
    {
      v39 = @"ZOOMED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_displayZoomOption);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v39 forKey:@"displayZoomOption"];

    __int16 v31 = (__int16)self->_has;
    if ((v31 & 0x8000) == 0)
    {
LABEL_45:
      if ((v31 & 0x10) == 0) {
        goto LABEL_46;
      }
      goto LABEL_64;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
    goto LABEL_45;
  }
  v40 = [NSNumber numberWithBool:self->_unlockWithWatchEnabled];
  [v3 setObject:v40 forKey:@"unlockWithWatchEnabled"];

  __int16 v31 = (__int16)self->_has;
  if ((v31 & 0x10) == 0)
  {
LABEL_46:
    if ((v31 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_64:
  v41 = [NSNumber numberWithBool:self->_fileVaultEnabled];
  [v3 setObject:v41 forKey:@"fileVaultEnabled"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_47:
    v32 = [NSNumber numberWithBool:self->_siriVoiceTriggerEnabled];
    [v3 setObject:v32 forKey:@"siriVoiceTriggerEnabled"];
  }
LABEL_48:
  productVersion = self->_productVersion;
  if (productVersion) {
    [v3 setObject:productVersion forKey:@"productVersion"];
  }
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x2000) != 0)
  {
    v35 = [NSNumber numberWithBool:self->_stolenDeviceProtectionEnabled];
    [v3 setObject:v35 forKey:@"stolenDeviceProtectionEnabled"];

    __int16 v34 = (__int16)self->_has;
  }
  if ((v34 & 0x4000) != 0)
  {
    v36 = [NSNumber numberWithBool:self->_stolenDeviceProtectionStrictModeEnabled];
    [v3 setObject:v36 forKey:@"stolenDeviceProtectionStrictModeEnabled"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SASExpressSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_watchMigrationData) {
    PBDataWriterWriteDataField();
  }
  if (self->_walletData) {
    PBDataWriterWriteDataField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_47;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  if (*(_WORD *)&self->_has) {
LABEL_15:
  }
    PBDataWriterWriteInt32Field();
LABEL_16:
  if (self->_deviceAnalyticsPrivacyBundle) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appAnalyticsPrivacyBundle) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_locationServicesPrivacyBundle) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_findMyPrivacyBundle) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_siriPrivacyBundle) {
    PBDataWriterWriteSubmessage();
  }
  if (!self->_productType) {
    -[SASExpressSettings writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_deviceClass) {
    -[SASExpressSettings writeTo:]();
  }
  PBDataWriterWriteStringField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if (v5 < 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_has;
  }
  v6 = v8;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v8;
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v8;
  }
  if (self->_productVersion)
  {
    PBDataWriterWriteStringField();
    v6 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v8;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v8;
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[22] = self->_version;
  v9 = v4;
  if (self->_watchMigrationData)
  {
    objc_msgSend(v4, "setWatchMigrationData:");
    int v4 = v9;
  }
  if (self->_walletData)
  {
    objc_msgSend(v9, "setWalletData:");
    int v4 = v9;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 113) = self->_deviceAnalyticsOptIn;
    *((_WORD *)v4 + 64) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_42;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 112) = self->_appAnalyticsOptIn;
  *((_WORD *)v4 + 64) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 116) = self->_locationServicesOptIn;
  *((_WORD *)v4 + 64) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 115) = self->_findMyOptIn;
  *((_WORD *)v4 + 64) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)v4 + 119) = self->_siriOptIn;
  *((_WORD *)v4 + 64) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 117) = self->_screenTimeEnabled;
  *((_WORD *)v4 + 64) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((unsigned char *)v4 + 122) = self->_softwareUpdateAutoUpdateEnabled;
  *((_WORD *)v4 + 64) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((unsigned char *)v4 + 121) = self->_softwareUpdateAutoDownloadEnabled;
  *((_WORD *)v4 + 64) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_48:
  *((unsigned char *)v4 + 118) = self->_siriDataSharingOptIn;
  *((_WORD *)v4 + 64) |= 0x100u;
  if (*(_WORD *)&self->_has)
  {
LABEL_15:
    v4[4] = self->_appearanceMode;
    *((_WORD *)v4 + 64) |= 1u;
  }
LABEL_16:
  if (self->_deviceAnalyticsPrivacyBundle) {
    objc_msgSend(v9, "setDeviceAnalyticsPrivacyBundle:");
  }
  if (self->_appAnalyticsPrivacyBundle) {
    objc_msgSend(v9, "setAppAnalyticsPrivacyBundle:");
  }
  if (self->_locationServicesPrivacyBundle) {
    objc_msgSend(v9, "setLocationServicesPrivacyBundle:");
  }
  if (self->_findMyPrivacyBundle) {
    objc_msgSend(v9, "setFindMyPrivacyBundle:");
  }
  if (self->_siriPrivacyBundle) {
    objc_msgSend(v9, "setSiriPrivacyBundle:");
  }
  [v9 setProductType:self->_productType];
  [v9 setDeviceClass:self->_deviceClass];
  v6 = v9;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
  {
    v9[10] = self->_displayZoomOption;
    *((_WORD *)v9 + 64) |= 2u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x8000) == 0)
    {
LABEL_28:
      if ((v7 & 0x10) == 0) {
        goto LABEL_29;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
    goto LABEL_28;
  }
  *((unsigned char *)v9 + 125) = self->_unlockWithWatchEnabled;
  *((_WORD *)v9 + 64) |= 0x8000u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
LABEL_29:
    if ((v7 & 0x400) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_52:
  *((unsigned char *)v9 + 114) = self->_fileVaultEnabled;
  *((_WORD *)v9 + 64) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_30:
    *((unsigned char *)v9 + 120) = self->_siriVoiceTriggerEnabled;
    *((_WORD *)v9 + 64) |= 0x400u;
  }
LABEL_31:
  if (self->_productVersion)
  {
    objc_msgSend(v9, "setProductVersion:");
    v6 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x2000) != 0)
  {
    v6[123] = self->_stolenDeviceProtectionEnabled;
    *((_WORD *)v6 + 64) |= 0x2000u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x4000) != 0)
  {
    v6[124] = self->_stolenDeviceProtectionStrictModeEnabled;
    *((_WORD *)v6 + 64) |= 0x4000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 88) = self->_version;
  uint64_t v6 = [(NSData *)self->_watchMigrationData copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v6;

  uint64_t v8 = [(NSData *)self->_walletData copyWithZone:a3];
  v9 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 113) = self->_deviceAnalyticsOptIn;
    *(_WORD *)(v5 + 128) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 112) = self->_appAnalyticsOptIn;
  *(_WORD *)(v5 + 128) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(unsigned char *)(v5 + 116) = self->_locationServicesOptIn;
  *(_WORD *)(v5 + 128) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(unsigned char *)(v5 + 115) = self->_findMyOptIn;
  *(_WORD *)(v5 + 128) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(v5 + 119) = self->_siriOptIn;
  *(_WORD *)(v5 + 128) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(v5 + 117) = self->_screenTimeEnabled;
  *(_WORD *)(v5 + 128) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v5 + 122) = self->_softwareUpdateAutoUpdateEnabled;
  *(_WORD *)(v5 + 128) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(unsigned char *)(v5 + 121) = self->_softwareUpdateAutoDownloadEnabled;
  *(_WORD *)(v5 + 128) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  *(unsigned char *)(v5 + 118) = self->_siriDataSharingOptIn;
  *(_WORD *)(v5 + 128) |= 0x100u;
  if (*(_WORD *)&self->_has)
  {
LABEL_11:
    *(_DWORD *)(v5 + 16) = self->_appearanceMode;
    *(_WORD *)(v5 + 128) |= 1u;
  }
LABEL_12:
  id v11 = [(SASExpressSettingsPrivacyBundle *)self->_deviceAnalyticsPrivacyBundle copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(SASExpressSettingsPrivacyBundle *)self->_appAnalyticsPrivacyBundle copyWithZone:a3];
  v14 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v13;

  id v15 = [(SASExpressSettingsPrivacyBundle *)self->_locationServicesPrivacyBundle copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  id v17 = [(SASExpressSettingsPrivacyBundle *)self->_findMyPrivacyBundle copyWithZone:a3];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  id v19 = [(SASExpressSettingsPrivacyBundle *)self->_siriPrivacyBundle copyWithZone:a3];
  v20 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v19;

  uint64_t v21 = [(NSString *)self->_productType copyWithZone:a3];
  v22 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v21;

  uint64_t v23 = [(NSString *)self->_deviceClass copyWithZone:a3];
  v24 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v23;

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_displayZoomOption;
    *(_WORD *)(v5 + 128) |= 2u;
    __int16 v25 = (__int16)self->_has;
    if ((v25 & 0x8000) == 0)
    {
LABEL_14:
      if ((v25 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
    goto LABEL_14;
  }
  *(unsigned char *)(v5 + 125) = self->_unlockWithWatchEnabled;
  *(_WORD *)(v5 + 128) |= 0x8000u;
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x10) == 0)
  {
LABEL_15:
    if ((v25 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_34:
  *(unsigned char *)(v5 + 114) = self->_fileVaultEnabled;
  *(_WORD *)(v5 + 128) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(unsigned char *)(v5 + 120) = self->_siriVoiceTriggerEnabled;
    *(_WORD *)(v5 + 128) |= 0x400u;
  }
LABEL_17:
  uint64_t v26 = [(NSString *)self->_productVersion copyWithZone:a3];
  v27 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v26;

  __int16 v28 = (__int16)self->_has;
  if ((v28 & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 123) = self->_stolenDeviceProtectionEnabled;
    *(_WORD *)(v5 + 128) |= 0x2000u;
    __int16 v28 = (__int16)self->_has;
  }
  if ((v28 & 0x4000) != 0)
  {
    *(unsigned char *)(v5 + 124) = self->_stolenDeviceProtectionStrictModeEnabled;
    *(_WORD *)(v5 + 128) |= 0x4000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_141;
  }
  if (self->_version != *((_DWORD *)v4 + 22)) {
    goto LABEL_141;
  }
  watchMigrationData = self->_watchMigrationData;
  if ((unint64_t)watchMigrationData | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](watchMigrationData, "isEqual:")) {
      goto LABEL_141;
    }
  }
  walletData = self->_walletData;
  if ((unint64_t)walletData | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](walletData, "isEqual:")) {
      goto LABEL_141;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 64);
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0) {
      goto LABEL_141;
    }
    if (self->_deviceAnalyticsOptIn)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_141;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_141;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0) {
      goto LABEL_141;
    }
    if (self->_appAnalyticsOptIn)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_141;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_141;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_141;
    }
    if (self->_locationServicesOptIn)
    {
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 116))
    {
      goto LABEL_141;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_141;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0) {
      goto LABEL_141;
    }
    if (self->_findMyOptIn)
    {
      if (!*((unsigned char *)v4 + 115)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 115))
    {
      goto LABEL_141;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x200) == 0) {
      goto LABEL_141;
    }
    if (self->_siriOptIn)
    {
      if (!*((unsigned char *)v4 + 119)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 119))
    {
      goto LABEL_141;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x200) != 0)
  {
    goto LABEL_141;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0) {
      goto LABEL_141;
    }
    if (self->_screenTimeEnabled)
    {
      if (!*((unsigned char *)v4 + 117)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 117))
    {
      goto LABEL_141;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x1000) == 0) {
      goto LABEL_141;
    }
    if (self->_softwareUpdateAutoUpdateEnabled)
    {
      if (!*((unsigned char *)v4 + 122)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 122))
    {
      goto LABEL_141;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x1000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x800) == 0) {
      goto LABEL_141;
    }
    if (self->_softwareUpdateAutoDownloadEnabled)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_141;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x800) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x100) == 0) {
      goto LABEL_141;
    }
    if (self->_siriDataSharingOptIn)
    {
      if (!*((unsigned char *)v4 + 118)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 118))
    {
      goto LABEL_141;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x100) != 0)
  {
    goto LABEL_141;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_appearanceMode != *((_DWORD *)v4 + 4)) {
      goto LABEL_141;
    }
  }
  else if (v8)
  {
    goto LABEL_141;
  }
  deviceAnalyticsPrivacyBundle = self->_deviceAnalyticsPrivacyBundle;
  if ((unint64_t)deviceAnalyticsPrivacyBundle | *((void *)v4 + 3)
    && !-[SASExpressSettingsPrivacyBundle isEqual:](deviceAnalyticsPrivacyBundle, "isEqual:"))
  {
    goto LABEL_141;
  }
  appAnalyticsPrivacyBundle = self->_appAnalyticsPrivacyBundle;
  if ((unint64_t)appAnalyticsPrivacyBundle | *((void *)v4 + 1))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](appAnalyticsPrivacyBundle, "isEqual:")) {
      goto LABEL_141;
    }
  }
  locationServicesPrivacyBundle = self->_locationServicesPrivacyBundle;
  if ((unint64_t)locationServicesPrivacyBundle | *((void *)v4 + 7))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](locationServicesPrivacyBundle, "isEqual:")) {
      goto LABEL_141;
    }
  }
  findMyPrivacyBundle = self->_findMyPrivacyBundle;
  if ((unint64_t)findMyPrivacyBundle | *((void *)v4 + 6))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](findMyPrivacyBundle, "isEqual:")) {
      goto LABEL_141;
    }
  }
  siriPrivacyBundle = self->_siriPrivacyBundle;
  if ((unint64_t)siriPrivacyBundle | *((void *)v4 + 10))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](siriPrivacyBundle, "isEqual:")) {
      goto LABEL_141;
    }
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_141;
    }
  }
  deviceClass = self->_deviceClass;
  if ((unint64_t)deviceClass | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](deviceClass, "isEqual:")) {
      goto LABEL_141;
    }
  }
  __int16 v16 = (__int16)self->_has;
  __int16 v17 = *((_WORD *)v4 + 64);
  if ((v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_displayZoomOption != *((_DWORD *)v4 + 10)) {
      goto LABEL_141;
    }
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x8000) == 0) {
      goto LABEL_141;
    }
    if (self->_unlockWithWatchEnabled)
    {
      if (!*((unsigned char *)v4 + 125)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 125))
    {
      goto LABEL_141;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x8000) != 0)
  {
    goto LABEL_141;
  }
  if ((v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0) {
      goto LABEL_141;
    }
    if (self->_fileVaultEnabled)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_141;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x400) == 0) {
      goto LABEL_141;
    }
    if (self->_siriVoiceTriggerEnabled)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_141;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x400) != 0)
  {
    goto LABEL_141;
  }
  productVersion = self->_productVersion;
  if ((unint64_t)productVersion | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](productVersion, "isEqual:")) {
      goto LABEL_141;
    }
    __int16 v16 = (__int16)self->_has;
  }
  if ((v16 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x2000) == 0) {
      goto LABEL_141;
    }
    if (self->_stolenDeviceProtectionEnabled)
    {
      if (!*((unsigned char *)v4 + 123)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 123))
    {
      goto LABEL_141;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x2000) != 0)
  {
    goto LABEL_141;
  }
  if ((v16 & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x4000) != 0)
    {
      if (self->_stolenDeviceProtectionStrictModeEnabled)
      {
        if (!*((unsigned char *)v4 + 124)) {
          goto LABEL_141;
        }
      }
      else if (*((unsigned char *)v4 + 124))
      {
        goto LABEL_141;
      }
      BOOL v19 = 1;
      goto LABEL_142;
    }
LABEL_141:
    BOOL v19 = 0;
    goto LABEL_142;
  }
  BOOL v19 = (*((_WORD *)v4 + 64) & 0x4000) == 0;
LABEL_142:

  return v19;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  uint64_t v43 = [(NSData *)self->_watchMigrationData hash];
  uint64_t v3 = [(NSData *)self->_walletData hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_deviceAnalyticsOptIn;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_appAnalyticsOptIn;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_locationServicesOptIn;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_findMyOptIn;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_siriOptIn;
    if ((has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_screenTimeEnabled;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_softwareUpdateAutoUpdateEnabled;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_softwareUpdateAutoDownloadEnabled;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_siriDataSharingOptIn;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = 0;
LABEL_20:
  uint64_t v42 = v3;
  uint64_t v40 = v6;
  uint64_t v41 = v5;
  uint64_t v38 = v8;
  uint64_t v39 = v7;
  uint64_t v36 = v10;
  uint64_t v37 = v9;
  uint64_t v34 = v12;
  uint64_t v35 = v11;
  uint64_t v33 = v13;
  if (has) {
    uint64_t v29 = 2654435761 * self->_appearanceMode;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v32 = [(SASExpressSettingsPrivacyBundle *)self->_deviceAnalyticsPrivacyBundle hash];
  unint64_t v30 = [(SASExpressSettingsPrivacyBundle *)self->_appAnalyticsPrivacyBundle hash];
  unint64_t v14 = [(SASExpressSettingsPrivacyBundle *)self->_locationServicesPrivacyBundle hash];
  unint64_t v15 = [(SASExpressSettingsPrivacyBundle *)self->_findMyPrivacyBundle hash];
  unint64_t v16 = [(SASExpressSettingsPrivacyBundle *)self->_siriPrivacyBundle hash];
  NSUInteger v31 = [(NSString *)self->_productType hash];
  NSUInteger v17 = [(NSString *)self->_deviceClass hash];
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 2) == 0)
  {
    uint64_t v28 = 0;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v19 = 0;
    if ((v18 & 0x10) != 0) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  uint64_t v28 = 2654435761 * self->_displayZoomOption;
  if ((*(_WORD *)&self->_has & 0x8000) == 0) {
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v19 = 2654435761 * self->_unlockWithWatchEnabled;
  if ((v18 & 0x10) != 0)
  {
LABEL_26:
    uint64_t v20 = 2654435761 * self->_fileVaultEnabled;
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v20 = 0;
LABEL_30:
  uint64_t v21 = v19;
  NSUInteger v22 = v17;
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v23 = 2654435761 * self->_siriVoiceTriggerEnabled;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_productVersion hash];
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    uint64_t v25 = 2654435761 * self->_stolenDeviceProtectionEnabled;
  }
  else {
    uint64_t v25 = 0;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    uint64_t v26 = 2654435761 * self->_stolenDeviceProtectionStrictModeEnabled;
  }
  else {
    uint64_t v26 = 0;
  }
  return v43 ^ v42 ^ v41 ^ v40 ^ (2654435761 * version) ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v29 ^ v32 ^ v30 ^ v14 ^ v15 ^ v16 ^ v31 ^ v22 ^ v28 ^ v21 ^ v20 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 22);
  id v18 = v4;
  if (*((void *)v4 + 13))
  {
    -[SASExpressSettings setWatchMigrationData:](self, "setWatchMigrationData:");
    id v4 = v18;
  }
  if (*((void *)v4 + 12))
  {
    -[SASExpressSettings setWalletData:](self, "setWalletData:");
    id v4 = v18;
  }
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_deviceAnalyticsOptIn = *((unsigned char *)v4 + 113);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 64);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_appAnalyticsOptIn = *((unsigned char *)v4 + 112);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_locationServicesOptIn = *((unsigned char *)v4 + 116);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_findMyOptIn = *((unsigned char *)v4 + 115);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_siriOptIn = *((unsigned char *)v4 + 119);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_screenTimeEnabled = *((unsigned char *)v4 + 117);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_softwareUpdateAutoUpdateEnabled = *((unsigned char *)v4 + 122);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_softwareUpdateAutoDownloadEnabled = *((unsigned char *)v4 + 121);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 64);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_27:
  self->_siriDataSharingOptIn = *((unsigned char *)v4 + 118);
  *(_WORD *)&self->_has |= 0x100u;
  if (*((_WORD *)v4 + 64))
  {
LABEL_15:
    self->_appearanceMode = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_16:
  deviceAnalyticsPrivacyBundle = self->_deviceAnalyticsPrivacyBundle;
  uint64_t v7 = *((void *)v4 + 3);
  if (deviceAnalyticsPrivacyBundle)
  {
    if (!v7) {
      goto LABEL_32;
    }
    -[SASExpressSettingsPrivacyBundle mergeFrom:](deviceAnalyticsPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_32;
    }
    -[SASExpressSettings setDeviceAnalyticsPrivacyBundle:](self, "setDeviceAnalyticsPrivacyBundle:");
  }
  id v4 = v18;
LABEL_32:
  appAnalyticsPrivacyBundle = self->_appAnalyticsPrivacyBundle;
  uint64_t v9 = *((void *)v4 + 1);
  if (appAnalyticsPrivacyBundle)
  {
    if (!v9) {
      goto LABEL_38;
    }
    -[SASExpressSettingsPrivacyBundle mergeFrom:](appAnalyticsPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_38;
    }
    -[SASExpressSettings setAppAnalyticsPrivacyBundle:](self, "setAppAnalyticsPrivacyBundle:");
  }
  id v4 = v18;
LABEL_38:
  locationServicesPrivacyBundle = self->_locationServicesPrivacyBundle;
  uint64_t v11 = *((void *)v4 + 7);
  if (locationServicesPrivacyBundle)
  {
    if (!v11) {
      goto LABEL_44;
    }
    -[SASExpressSettingsPrivacyBundle mergeFrom:](locationServicesPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_44;
    }
    -[SASExpressSettings setLocationServicesPrivacyBundle:](self, "setLocationServicesPrivacyBundle:");
  }
  id v4 = v18;
LABEL_44:
  findMyPrivacyBundle = self->_findMyPrivacyBundle;
  uint64_t v13 = *((void *)v4 + 6);
  if (findMyPrivacyBundle)
  {
    if (!v13) {
      goto LABEL_50;
    }
    -[SASExpressSettingsPrivacyBundle mergeFrom:](findMyPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_50;
    }
    -[SASExpressSettings setFindMyPrivacyBundle:](self, "setFindMyPrivacyBundle:");
  }
  id v4 = v18;
LABEL_50:
  siriPrivacyBundle = self->_siriPrivacyBundle;
  uint64_t v15 = *((void *)v4 + 10);
  if (siriPrivacyBundle)
  {
    if (!v15) {
      goto LABEL_56;
    }
    -[SASExpressSettingsPrivacyBundle mergeFrom:](siriPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_56;
    }
    -[SASExpressSettings setSiriPrivacyBundle:](self, "setSiriPrivacyBundle:");
  }
  id v4 = v18;
LABEL_56:
  if (*((void *)v4 + 8))
  {
    -[SASExpressSettings setProductType:](self, "setProductType:");
    id v4 = v18;
  }
  if (*((void *)v4 + 4))
  {
    -[SASExpressSettings setDeviceClass:](self, "setDeviceClass:");
    id v4 = v18;
  }
  __int16 v16 = *((_WORD *)v4 + 64);
  if ((v16 & 2) != 0)
  {
    self->_int displayZoomOption = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 2u;
    __int16 v16 = *((_WORD *)v4 + 64);
    if ((v16 & 0x8000) == 0)
    {
LABEL_62:
      if ((v16 & 0x10) == 0) {
        goto LABEL_63;
      }
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 64) & 0x8000) == 0)
  {
    goto LABEL_62;
  }
  self->_unlockWithWatchEnabled = *((unsigned char *)v4 + 125);
  *(_WORD *)&self->_has |= 0x8000u;
  __int16 v16 = *((_WORD *)v4 + 64);
  if ((v16 & 0x10) == 0)
  {
LABEL_63:
    if ((v16 & 0x400) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_76:
  self->_fileVaultEnabled = *((unsigned char *)v4 + 114);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 64) & 0x400) != 0)
  {
LABEL_64:
    self->_siriVoiceTriggerEnabled = *((unsigned char *)v4 + 120);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_65:
  if (*((void *)v4 + 9))
  {
    -[SASExpressSettings setProductVersion:](self, "setProductVersion:");
    id v4 = v18;
  }
  __int16 v17 = *((_WORD *)v4 + 64);
  if ((v17 & 0x2000) != 0)
  {
    self->_stolenDeviceProtectionEnabled = *((unsigned char *)v4 + 123);
    *(_WORD *)&self->_has |= 0x2000u;
    __int16 v17 = *((_WORD *)v4 + 64);
  }
  if ((v17 & 0x4000) != 0)
  {
    self->_stolenDeviceProtectionStrictModeEnabled = *((unsigned char *)v4 + 124);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  MEMORY[0x1F41817F8]();
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (NSData)watchMigrationData
{
  return self->_watchMigrationData;
}

- (void)setWatchMigrationData:(id)a3
{
}

- (NSData)walletData
{
  return self->_walletData;
}

- (void)setWalletData:(id)a3
{
}

- (BOOL)deviceAnalyticsOptIn
{
  return self->_deviceAnalyticsOptIn;
}

- (BOOL)appAnalyticsOptIn
{
  return self->_appAnalyticsOptIn;
}

- (BOOL)locationServicesOptIn
{
  return self->_locationServicesOptIn;
}

- (BOOL)findMyOptIn
{
  return self->_findMyOptIn;
}

- (BOOL)siriOptIn
{
  return self->_siriOptIn;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (BOOL)softwareUpdateAutoUpdateEnabled
{
  return self->_softwareUpdateAutoUpdateEnabled;
}

- (BOOL)softwareUpdateAutoDownloadEnabled
{
  return self->_softwareUpdateAutoDownloadEnabled;
}

- (BOOL)siriDataSharingOptIn
{
  return self->_siriDataSharingOptIn;
}

- (SASExpressSettingsPrivacyBundle)deviceAnalyticsPrivacyBundle
{
  return self->_deviceAnalyticsPrivacyBundle;
}

- (void)setDeviceAnalyticsPrivacyBundle:(id)a3
{
}

- (SASExpressSettingsPrivacyBundle)appAnalyticsPrivacyBundle
{
  return self->_appAnalyticsPrivacyBundle;
}

- (void)setAppAnalyticsPrivacyBundle:(id)a3
{
}

- (SASExpressSettingsPrivacyBundle)locationServicesPrivacyBundle
{
  return self->_locationServicesPrivacyBundle;
}

- (void)setLocationServicesPrivacyBundle:(id)a3
{
}

- (SASExpressSettingsPrivacyBundle)findMyPrivacyBundle
{
  return self->_findMyPrivacyBundle;
}

- (void)setFindMyPrivacyBundle:(id)a3
{
}

- (SASExpressSettingsPrivacyBundle)siriPrivacyBundle
{
  return self->_siriPrivacyBundle;
}

- (void)setSiriPrivacyBundle:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (BOOL)unlockWithWatchEnabled
{
  return self->_unlockWithWatchEnabled;
}

- (BOOL)fileVaultEnabled
{
  return self->_fileVaultEnabled;
}

- (BOOL)siriVoiceTriggerEnabled
{
  return self->_siriVoiceTriggerEnabled;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (BOOL)stolenDeviceProtectionEnabled
{
  return self->_stolenDeviceProtectionEnabled;
}

- (BOOL)stolenDeviceProtectionStrictModeEnabled
{
  return self->_stolenDeviceProtectionStrictModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchMigrationData, 0);
  objc_storeStrong((id *)&self->_walletData, 0);
  objc_storeStrong((id *)&self->_siriPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_locationServicesPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_findMyPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceAnalyticsPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_appAnalyticsPrivacyBundle, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SASExpressSettings writeTo:]", "SASExpressSettings.m", 803, "nil != self->_productType");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SASExpressSettings writeTo:]", "SASExpressSettings.m", 808, "nil != self->_deviceClass");
}

@end