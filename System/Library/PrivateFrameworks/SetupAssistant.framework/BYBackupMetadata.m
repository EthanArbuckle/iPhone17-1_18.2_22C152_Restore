@interface BYBackupMetadata
- (BOOL)autoDownloadEnabled;
- (BOOL)autoUpdateEnabled;
- (BOOL)didSeeTrueTonePane;
- (BOOL)findMyiPhoneOptIn;
- (BOOL)hasActionButtonData;
- (BOOL)hasAppAnalyticsOptIn;
- (BOOL)hasAutoDownloadEnabled;
- (BOOL)hasAutoUpdateEnabled;
- (BOOL)hasDeviceAnalyticsOptIn;
- (BOOL)hasDidSeeTrueTonePane;
- (BOOL)hasFindMyiPhoneOptIn;
- (BOOL)hasHomeButtonHapticKind;
- (BOOL)hasLocationServicesOptIn;
- (BOOL)hasMessagesContactsPresented;
- (BOOL)hasNanoRegistryData;
- (BOOL)hasScreenTimeEnabled;
- (BOOL)hasSeedEnrollmentAssetAudience;
- (BOOL)hasSeedEnrollmentCatalogID;
- (BOOL)hasSeedEnrollmentProgram;
- (BOOL)hasSettingsContactsPresented;
- (BOOL)hasSettingsDataUsagePresented;
- (BOOL)hasSiriDataSharingOptIn;
- (BOOL)hasSiriOptIn;
- (BOOL)hasUniversalData;
- (BOOL)hasUserInterfaceStyleMode;
- (BOOL)hasWalletData;
- (BOOL)isEqual:(id)a3;
- (BOOL)locationServicesOptIn;
- (BOOL)messagesContactsPresented;
- (BOOL)readFrom:(id)a3;
- (BOOL)screenTimeEnabled;
- (BOOL)settingsContactsPresented;
- (BOOL)settingsDataUsagePresented;
- (BOOL)siriDataSharingOptIn;
- (BOOL)siriOptIn;
- (NSData)actionButtonData;
- (NSData)nanoRegistryData;
- (NSData)universalData;
- (NSData)walletData;
- (NSString)seedEnrollmentAssetAudience;
- (NSString)seedEnrollmentCatalogID;
- (NSString)seedEnrollmentProgram;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)expressSettings;
- (int64_t)userInterfaceStyleMode;
- (unint64_t)hash;
- (unsigned)appAnalyticsOptIn;
- (unsigned)deviceAnalyticsOptIn;
- (unsigned)homeButtonHapticKind;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionButtonData:(id)a3;
- (void)setAppAnalyticsOptIn:(unsigned int)a3;
- (void)setAutoDownloadEnabled:(BOOL)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)setDeviceAnalyticsOptIn:(unsigned int)a3;
- (void)setDidSeeTrueTonePane:(BOOL)a3;
- (void)setFindMyiPhoneOptIn:(BOOL)a3;
- (void)setHasAppAnalyticsOptIn:(BOOL)a3;
- (void)setHasAutoDownloadEnabled:(BOOL)a3;
- (void)setHasAutoUpdateEnabled:(BOOL)a3;
- (void)setHasDeviceAnalyticsOptIn:(BOOL)a3;
- (void)setHasDidSeeTrueTonePane:(BOOL)a3;
- (void)setHasFindMyiPhoneOptIn:(BOOL)a3;
- (void)setHasHomeButtonHapticKind:(BOOL)a3;
- (void)setHasLocationServicesOptIn:(BOOL)a3;
- (void)setHasMessagesContactsPresented:(BOOL)a3;
- (void)setHasScreenTimeEnabled:(BOOL)a3;
- (void)setHasSettingsContactsPresented:(BOOL)a3;
- (void)setHasSettingsDataUsagePresented:(BOOL)a3;
- (void)setHasSiriDataSharingOptIn:(BOOL)a3;
- (void)setHasSiriOptIn:(BOOL)a3;
- (void)setHasUserInterfaceStyleMode:(BOOL)a3;
- (void)setHomeButtonHapticKind:(unsigned int)a3;
- (void)setLocationServicesOptIn:(BOOL)a3;
- (void)setMessagesContactsPresented:(BOOL)a3;
- (void)setNanoRegistryData:(id)a3;
- (void)setScreenTimeEnabled:(BOOL)a3;
- (void)setSeedEnrollmentAssetAudience:(id)a3;
- (void)setSeedEnrollmentCatalogID:(id)a3;
- (void)setSeedEnrollmentProgram:(id)a3;
- (void)setSettingsContactsPresented:(BOOL)a3;
- (void)setSettingsDataUsagePresented:(BOOL)a3;
- (void)setSiriDataSharingOptIn:(BOOL)a3;
- (void)setSiriOptIn:(BOOL)a3;
- (void)setUniversalData:(id)a3;
- (void)setUserInterfaceStyleMode:(int64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWalletData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BYBackupMetadata

- (BOOL)hasNanoRegistryData
{
  return self->_nanoRegistryData != 0;
}

- (void)setHomeButtonHapticKind:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_homeButtonHapticKind = a3;
}

- (void)setHasHomeButtonHapticKind:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHomeButtonHapticKind
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDeviceAnalyticsOptIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_deviceAnalyticsOptIn = a3;
}

- (void)setHasDeviceAnalyticsOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDeviceAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAppAnalyticsOptIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_appAnalyticsOptIn = a3;
}

- (void)setHasAppAnalyticsOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAppAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLocationServicesOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_locationServicesOptIn = a3;
}

- (void)setHasLocationServicesOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLocationServicesOptIn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFindMyiPhoneOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_findMyiPhoneOptIn = a3;
}

- (void)setHasFindMyiPhoneOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFindMyiPhoneOptIn
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSiriOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_siriOptIn = a3;
}

- (void)setHasSiriOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSiriOptIn
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_screenTimeEnabled = a3;
}

- (void)setHasScreenTimeEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScreenTimeEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_autoUpdateEnabled = a3;
}

- (void)setHasAutoUpdateEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAutoUpdateEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDidSeeTrueTonePane:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_didSeeTrueTonePane = a3;
}

- (void)setHasDidSeeTrueTonePane:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDidSeeTrueTonePane
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setUserInterfaceStyleMode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_userInterfaceStyleMode = a3;
}

- (void)setHasUserInterfaceStyleMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasUserInterfaceStyleMode
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasWalletData
{
  return self->_walletData != 0;
}

- (void)setAutoDownloadEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_autoDownloadEnabled = a3;
}

- (void)setHasAutoDownloadEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAutoDownloadEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSiriDataSharingOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_siriDataSharingOptIn = a3;
}

- (void)setHasSiriDataSharingOptIn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSiriDataSharingOptIn
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasUniversalData
{
  return self->_universalData != 0;
}

- (BOOL)hasSeedEnrollmentProgram
{
  return self->_seedEnrollmentProgram != 0;
}

- (BOOL)hasSeedEnrollmentAssetAudience
{
  return self->_seedEnrollmentAssetAudience != 0;
}

- (void)setMessagesContactsPresented:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_messagesContactsPresented = a3;
}

- (void)setHasMessagesContactsPresented:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMessagesContactsPresented
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSettingsContactsPresented:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_settingsContactsPresented = a3;
}

- (void)setHasSettingsContactsPresented:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSettingsContactsPresented
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSettingsDataUsagePresented:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_settingsDataUsagePresented = a3;
}

- (void)setHasSettingsDataUsagePresented:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSettingsDataUsagePresented
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasSeedEnrollmentCatalogID
{
  return self->_seedEnrollmentCatalogID != 0;
}

- (BOOL)hasActionButtonData
{
  return self->_actionButtonData != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BYBackupMetadata;
  v4 = [(BYBackupMetadata *)&v8 description];
  v5 = [(BYBackupMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  nanoRegistryData = self->_nanoRegistryData;
  if (nanoRegistryData) {
    [v3 setObject:nanoRegistryData forKey:@"nanoRegistryData"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v20 = [NSNumber numberWithUnsignedInt:self->_homeButtonHapticKind];
    [v3 setObject:v20 forKey:@"homeButtonHapticKind"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_39;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  v21 = [NSNumber numberWithUnsignedInt:self->_deviceAnalyticsOptIn];
  [v3 setObject:v21 forKey:@"deviceAnalyticsOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  v22 = [NSNumber numberWithUnsignedInt:self->_appAnalyticsOptIn];
  [v3 setObject:v22 forKey:@"appAnalyticsOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  v23 = [NSNumber numberWithBool:self->_locationServicesOptIn];
  [v3 setObject:v23 forKey:@"locationServicesOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  v24 = [NSNumber numberWithBool:self->_findMyiPhoneOptIn];
  [v3 setObject:v24 forKey:@"findMyiPhoneOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  v25 = [NSNumber numberWithBool:self->_siriOptIn];
  [v3 setObject:v25 forKey:@"siriOptIn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  v26 = [NSNumber numberWithBool:self->_screenTimeEnabled];
  [v3 setObject:v26 forKey:@"screenTimeEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  v27 = [NSNumber numberWithBool:self->_autoUpdateEnabled];
  [v3 setObject:v27 forKey:@"autoUpdateEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_45:
  v28 = [NSNumber numberWithBool:self->_didSeeTrueTonePane];
  [v3 setObject:v28 forKey:@"didSeeTrueTonePane"];

  if (*(_WORD *)&self->_has)
  {
LABEL_13:
    v7 = [NSNumber numberWithLongLong:self->_userInterfaceStyleMode];
    [v3 setObject:v7 forKey:@"userInterfaceStyleMode"];
  }
LABEL_14:
  walletData = self->_walletData;
  if (walletData) {
    [v3 setObject:walletData forKey:@"walletData"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_autoDownloadEnabled];
    [v3 setObject:v10 forKey:@"autoDownloadEnabled"];

    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 0x2000) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_siriDataSharingOptIn];
    [v3 setObject:v11 forKey:@"siriDataSharingOptIn"];
  }
  universalData = self->_universalData;
  if (universalData) {
    [v3 setObject:universalData forKey:@"universalData"];
  }
  seedEnrollmentProgram = self->_seedEnrollmentProgram;
  if (seedEnrollmentProgram) {
    [v3 setObject:seedEnrollmentProgram forKey:@"seedEnrollmentProgram"];
  }
  seedEnrollmentAssetAudience = self->_seedEnrollmentAssetAudience;
  if (seedEnrollmentAssetAudience) {
    [v3 setObject:seedEnrollmentAssetAudience forKey:@"seedEnrollmentAssetAudience"];
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x200) != 0)
  {
    v29 = [NSNumber numberWithBool:self->_messagesContactsPresented];
    [v3 setObject:v29 forKey:@"messagesContactsPresented"];

    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x800) == 0)
    {
LABEL_28:
      if ((v15 & 0x1000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_28;
  }
  v30 = [NSNumber numberWithBool:self->_settingsContactsPresented];
  [v3 setObject:v30 forKey:@"settingsContactsPresented"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_29:
    v16 = [NSNumber numberWithBool:self->_settingsDataUsagePresented];
    [v3 setObject:v16 forKey:@"settingsDataUsagePresented"];
  }
LABEL_30:
  seedEnrollmentCatalogID = self->_seedEnrollmentCatalogID;
  if (seedEnrollmentCatalogID) {
    [v3 setObject:seedEnrollmentCatalogID forKey:@"seedEnrollmentCatalogID"];
  }
  actionButtonData = self->_actionButtonData;
  if (actionButtonData) {
    [v3 setObject:actionButtonData forKey:@"actionButtonData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BYBackupMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_nanoRegistryData) {
    PBDataWriterWriteDataField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
  }
  v5 = v8;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_40;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v5 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  if (*(_WORD *)&self->_has)
  {
LABEL_14:
    PBDataWriterWriteInt64Field();
    v5 = v8;
  }
LABEL_15:
  if (self->_walletData)
  {
    PBDataWriterWriteDataField();
    v5 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
  }
  if (self->_universalData)
  {
    PBDataWriterWriteDataField();
    v5 = v8;
  }
  if (self->_seedEnrollmentProgram)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_seedEnrollmentAssetAudience)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_29:
      if ((v7 & 0x1000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  v5 = v8;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_30:
    PBDataWriterWriteBOOLField();
    v5 = v8;
  }
LABEL_31:
  if (self->_seedEnrollmentCatalogID)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_actionButtonData)
  {
    PBDataWriterWriteDataField();
    v5 = v8;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[20] = self->_version;
  id v8 = v4;
  if (self->_nanoRegistryData)
  {
    objc_msgSend(v4, "setNanoRegistryData:");
    v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[8] = self->_homeButtonHapticKind;
    *((_WORD *)v4 + 54) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_39;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  v4[7] = self->_deviceAnalyticsOptIn;
  *((_WORD *)v4 + 54) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[6] = self->_appAnalyticsOptIn;
  *((_WORD *)v4 + 54) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)v4 + 100) = self->_locationServicesOptIn;
  *((_WORD *)v4 + 54) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v4 + 99) = self->_findMyiPhoneOptIn;
  *((_WORD *)v4 + 54) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 106) = self->_siriOptIn;
  *((_WORD *)v4 + 54) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 102) = self->_screenTimeEnabled;
  *((_WORD *)v4 + 54) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)v4 + 97) = self->_autoUpdateEnabled;
  *((_WORD *)v4 + 54) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_45:
  *((unsigned char *)v4 + 98) = self->_didSeeTrueTonePane;
  *((_WORD *)v4 + 54) |= 0x40u;
  if (*(_WORD *)&self->_has)
  {
LABEL_13:
    *((void *)v4 + 1) = self->_userInterfaceStyleMode;
    *((_WORD *)v4 + 54) |= 1u;
  }
LABEL_14:
  if (self->_walletData)
  {
    objc_msgSend(v8, "setWalletData:");
    v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((unsigned char *)v4 + 96) = self->_autoDownloadEnabled;
    *((_WORD *)v4 + 54) |= 0x10u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x2000) != 0)
  {
    *((unsigned char *)v4 + 105) = self->_siriDataSharingOptIn;
    *((_WORD *)v4 + 54) |= 0x2000u;
  }
  if (self->_universalData)
  {
    objc_msgSend(v8, "setUniversalData:");
    v4 = v8;
  }
  if (self->_seedEnrollmentProgram)
  {
    objc_msgSend(v8, "setSeedEnrollmentProgram:");
    v4 = v8;
  }
  if (self->_seedEnrollmentAssetAudience)
  {
    objc_msgSend(v8, "setSeedEnrollmentAssetAudience:");
    v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 101) = self->_messagesContactsPresented;
    *((_WORD *)v4 + 54) |= 0x200u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_28:
      if ((v7 & 0x1000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_28;
  }
  *((unsigned char *)v4 + 103) = self->_settingsContactsPresented;
  *((_WORD *)v4 + 54) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_29:
    *((unsigned char *)v4 + 104) = self->_settingsDataUsagePresented;
    *((_WORD *)v4 + 54) |= 0x1000u;
  }
LABEL_30:
  if (self->_seedEnrollmentCatalogID)
  {
    objc_msgSend(v8, "setSeedEnrollmentCatalogID:");
    v4 = v8;
  }
  if (self->_actionButtonData)
  {
    objc_msgSend(v8, "setActionButtonData:");
    v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 80) = self->_version;
  uint64_t v6 = [(NSData *)self->_nanoRegistryData copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_homeButtonHapticKind;
    *(_WORD *)(v5 + 108) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_deviceAnalyticsOptIn;
  *(_WORD *)(v5 + 108) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 24) = self->_appAnalyticsOptIn;
  *(_WORD *)(v5 + 108) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(unsigned char *)(v5 + 100) = self->_locationServicesOptIn;
  *(_WORD *)(v5 + 108) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(unsigned char *)(v5 + 99) = self->_findMyiPhoneOptIn;
  *(_WORD *)(v5 + 108) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(v5 + 106) = self->_siriOptIn;
  *(_WORD *)(v5 + 108) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(v5 + 102) = self->_screenTimeEnabled;
  *(_WORD *)(v5 + 108) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v5 + 97) = self->_autoUpdateEnabled;
  *(_WORD *)(v5 + 108) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  *(unsigned char *)(v5 + 98) = self->_didSeeTrueTonePane;
  *(_WORD *)(v5 + 108) |= 0x40u;
  if (*(_WORD *)&self->_has)
  {
LABEL_11:
    *(void *)(v5 + 8) = self->_userInterfaceStyleMode;
    *(_WORD *)(v5 + 108) |= 1u;
  }
LABEL_12:
  uint64_t v9 = [(NSData *)self->_walletData copyWithZone:a3];
  v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 96) = self->_autoDownloadEnabled;
    *(_WORD *)(v5 + 108) |= 0x10u;
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 105) = self->_siriDataSharingOptIn;
    *(_WORD *)(v5 + 108) |= 0x2000u;
  }
  uint64_t v12 = [(NSData *)self->_universalData copyWithZone:a3];
  v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_seedEnrollmentProgram copyWithZone:a3];
  __int16 v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_seedEnrollmentAssetAudience copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x200) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_18;
    }
LABEL_32:
    *(unsigned char *)(v5 + 103) = self->_settingsContactsPresented;
    *(_WORD *)(v5 + 108) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  *(unsigned char *)(v5 + 101) = self->_messagesContactsPresented;
  *(_WORD *)(v5 + 108) |= 0x200u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x800) != 0) {
    goto LABEL_32;
  }
LABEL_18:
  if ((v18 & 0x1000) != 0)
  {
LABEL_19:
    *(unsigned char *)(v5 + 104) = self->_settingsDataUsagePresented;
    *(_WORD *)(v5 + 108) |= 0x1000u;
  }
LABEL_20:
  uint64_t v19 = [(NSString *)self->_seedEnrollmentCatalogID copyWithZone:a3];
  v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  uint64_t v21 = [(NSData *)self->_actionButtonData copyWithZone:a3];
  v22 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_126;
  }
  if (self->_version != *((_DWORD *)v4 + 20)) {
    goto LABEL_126;
  }
  nanoRegistryData = self->_nanoRegistryData;
  if ((unint64_t)nanoRegistryData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](nanoRegistryData, "isEqual:")) {
      goto LABEL_126;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 54);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_homeButtonHapticKind != *((_DWORD *)v4 + 8)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_deviceAnalyticsOptIn != *((_DWORD *)v4 + 7)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_appAnalyticsOptIn != *((_DWORD *)v4 + 6)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x100) == 0) {
      goto LABEL_126;
    }
    if (self->_locationServicesOptIn)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_126;
    }
    if (self->_findMyiPhoneOptIn)
    {
      if (!*((unsigned char *)v4 + 99)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 99))
    {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x4000) == 0) {
      goto LABEL_126;
    }
    if (self->_siriOptIn)
    {
      if (!*((unsigned char *)v4 + 106)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 106))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x4000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x400) == 0) {
      goto LABEL_126;
    }
    if (self->_screenTimeEnabled)
    {
      if (!*((unsigned char *)v4 + 102)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 102))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x400) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_126;
    }
    if (self->_autoUpdateEnabled)
    {
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 97))
    {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_126;
    }
    if (self->_didSeeTrueTonePane)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_126;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_userInterfaceStyleMode != *((void *)v4 + 1)) {
      goto LABEL_126;
    }
  }
  else if (v7)
  {
    goto LABEL_126;
  }
  walletData = self->_walletData;
  if ((unint64_t)walletData | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](walletData, "isEqual:")) {
      goto LABEL_126;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)v4 + 54);
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0) {
      goto LABEL_126;
    }
    if (self->_autoDownloadEnabled)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_126;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x2000) == 0) {
      goto LABEL_126;
    }
    if (self->_siriDataSharingOptIn)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x2000) != 0)
  {
    goto LABEL_126;
  }
  universalData = self->_universalData;
  if ((unint64_t)universalData | *((void *)v4 + 9)
    && !-[NSData isEqual:](universalData, "isEqual:"))
  {
    goto LABEL_126;
  }
  seedEnrollmentProgram = self->_seedEnrollmentProgram;
  if ((unint64_t)seedEnrollmentProgram | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](seedEnrollmentProgram, "isEqual:")) {
      goto LABEL_126;
    }
  }
  seedEnrollmentAssetAudience = self->_seedEnrollmentAssetAudience;
  if ((unint64_t)seedEnrollmentAssetAudience | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](seedEnrollmentAssetAudience, "isEqual:")) {
      goto LABEL_126;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x200) == 0) {
      goto LABEL_126;
    }
    if (self->_messagesContactsPresented)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x800) == 0) {
      goto LABEL_126;
    }
    if (self->_settingsContactsPresented)
    {
      if (!*((unsigned char *)v4 + 103)) {
        goto LABEL_126;
      }
    }
    else if (*((unsigned char *)v4 + 103))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
    {
      if (self->_settingsDataUsagePresented)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_126;
        }
        goto LABEL_122;
      }
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_122;
      }
    }
LABEL_126:
    char v15 = 0;
    goto LABEL_127;
  }
  if ((*((_WORD *)v4 + 54) & 0x1000) != 0) {
    goto LABEL_126;
  }
LABEL_122:
  seedEnrollmentCatalogID = self->_seedEnrollmentCatalogID;
  if ((unint64_t)seedEnrollmentCatalogID | *((void *)v4 + 7)
    && !-[NSString isEqual:](seedEnrollmentCatalogID, "isEqual:"))
  {
    goto LABEL_126;
  }
  actionButtonData = self->_actionButtonData;
  if ((unint64_t)actionButtonData | *((void *)v4 + 2)) {
    char v15 = -[NSData isEqual:](actionButtonData, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_127:

  return v15;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  uint64_t v26 = [(NSData *)self->_nanoRegistryData hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v25 = 2654435761 * self->_homeButtonHapticKind;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_deviceAnalyticsOptIn;
      if ((has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    uint64_t v23 = 2654435761 * self->_appAnalyticsOptIn;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v23 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v22 = 2654435761 * self->_locationServicesOptIn;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v22 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v21 = 2654435761 * self->_findMyiPhoneOptIn;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_7:
    uint64_t v20 = 2654435761 * self->_siriOptIn;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v19 = 2654435761 * self->_screenTimeEnabled;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v19 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v17 = 2654435761 * self->_autoUpdateEnabled;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v4 = 0;
    if (has) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v17 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v4 = 2654435761 * self->_didSeeTrueTonePane;
  if (has)
  {
LABEL_11:
    uint64_t v5 = 2654435761 * self->_userInterfaceStyleMode;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v5 = 0;
LABEL_22:
  uint64_t v6 = [(NSData *)self->_walletData hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    uint64_t v7 = 2654435761 * self->_autoDownloadEnabled;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_24:
      uint64_t v8 = 2654435761 * self->_siriDataSharingOptIn;
      goto LABEL_27;
    }
  }
  uint64_t v8 = 0;
LABEL_27:
  uint64_t v9 = [(NSData *)self->_universalData hash];
  NSUInteger v10 = [(NSString *)self->_seedEnrollmentProgram hash];
  NSUInteger v11 = [(NSString *)self->_seedEnrollmentAssetAudience hash];
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_29;
    }
LABEL_32:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_30;
    }
LABEL_33:
    uint64_t v14 = 0;
    goto LABEL_34;
  }
  uint64_t v12 = 2654435761 * self->_messagesContactsPresented;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v13 = 2654435761 * self->_settingsContactsPresented;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_33;
  }
LABEL_30:
  uint64_t v14 = 2654435761 * self->_settingsDataUsagePresented;
LABEL_34:
  NSUInteger v15 = v26 ^ v25 ^ v24 ^ v23 ^ (2654435761 * version) ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(NSString *)self->_seedEnrollmentCatalogID hash];
  return v15 ^ [(NSData *)self->_actionButtonData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int version = *((_DWORD *)v4 + 20);
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[BYBackupMetadata setNanoRegistryData:](self, "setNanoRegistryData:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 8) != 0)
  {
    self->_homeButtonHapticKind = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 54);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_39;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_deviceAnalyticsOptIn = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_appAnalyticsOptIn = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_locationServicesOptIn = *((unsigned char *)v4 + 100);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_findMyiPhoneOptIn = *((unsigned char *)v4 + 99);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_siriOptIn = *((unsigned char *)v4 + 106);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_screenTimeEnabled = *((unsigned char *)v4 + 102);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_autoUpdateEnabled = *((unsigned char *)v4 + 97);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x40) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_45:
  self->_didSeeTrueTonePane = *((unsigned char *)v4 + 98);
  *(_WORD *)&self->_has |= 0x40u;
  if (*((_WORD *)v4 + 54))
  {
LABEL_13:
    self->_userInterfaceStyleMode = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_14:
  if (*((void *)v4 + 11))
  {
    -[BYBackupMetadata setWalletData:](self, "setWalletData:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x10) != 0)
  {
    self->_autoDownloadEnabled = *((unsigned char *)v4 + 96);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 54);
  }
  if ((v6 & 0x2000) != 0)
  {
    self->_siriDataSharingOptIn = *((unsigned char *)v4 + 105);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 9))
  {
    -[BYBackupMetadata setUniversalData:](self, "setUniversalData:");
    id v4 = v8;
  }
  if (*((void *)v4 + 8))
  {
    -[BYBackupMetadata setSeedEnrollmentProgram:](self, "setSeedEnrollmentProgram:");
    id v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[BYBackupMetadata setSeedEnrollmentAssetAudience:](self, "setSeedEnrollmentAssetAudience:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 54);
  if ((v7 & 0x200) != 0)
  {
    self->_messagesContactsPresented = *((unsigned char *)v4 + 101);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v7 = *((_WORD *)v4 + 54);
    if ((v7 & 0x800) == 0)
    {
LABEL_28:
      if ((v7 & 0x1000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) == 0)
  {
    goto LABEL_28;
  }
  self->_settingsContactsPresented = *((unsigned char *)v4 + 103);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
  {
LABEL_29:
    self->_settingsDataUsagePresented = *((unsigned char *)v4 + 104);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_30:
  if (*((void *)v4 + 7))
  {
    -[BYBackupMetadata setSeedEnrollmentCatalogID:](self, "setSeedEnrollmentCatalogID:");
    id v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[BYBackupMetadata setActionButtonData:](self, "setActionButtonData:");
    id v4 = v8;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (NSData)nanoRegistryData
{
  return self->_nanoRegistryData;
}

- (void)setNanoRegistryData:(id)a3
{
}

- (unsigned)homeButtonHapticKind
{
  return self->_homeButtonHapticKind;
}

- (unsigned)deviceAnalyticsOptIn
{
  return self->_deviceAnalyticsOptIn;
}

- (unsigned)appAnalyticsOptIn
{
  return self->_appAnalyticsOptIn;
}

- (BOOL)locationServicesOptIn
{
  return self->_locationServicesOptIn;
}

- (BOOL)findMyiPhoneOptIn
{
  return self->_findMyiPhoneOptIn;
}

- (BOOL)siriOptIn
{
  return self->_siriOptIn;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (BOOL)didSeeTrueTonePane
{
  return self->_didSeeTrueTonePane;
}

- (int64_t)userInterfaceStyleMode
{
  return self->_userInterfaceStyleMode;
}

- (NSData)walletData
{
  return self->_walletData;
}

- (void)setWalletData:(id)a3
{
}

- (BOOL)autoDownloadEnabled
{
  return self->_autoDownloadEnabled;
}

- (BOOL)siriDataSharingOptIn
{
  return self->_siriDataSharingOptIn;
}

- (NSData)universalData
{
  return self->_universalData;
}

- (void)setUniversalData:(id)a3
{
}

- (NSString)seedEnrollmentProgram
{
  return self->_seedEnrollmentProgram;
}

- (void)setSeedEnrollmentProgram:(id)a3
{
}

- (NSString)seedEnrollmentAssetAudience
{
  return self->_seedEnrollmentAssetAudience;
}

- (void)setSeedEnrollmentAssetAudience:(id)a3
{
}

- (BOOL)messagesContactsPresented
{
  return self->_messagesContactsPresented;
}

- (BOOL)settingsContactsPresented
{
  return self->_settingsContactsPresented;
}

- (BOOL)settingsDataUsagePresented
{
  return self->_settingsDataUsagePresented;
}

- (NSString)seedEnrollmentCatalogID
{
  return self->_seedEnrollmentCatalogID;
}

- (void)setSeedEnrollmentCatalogID:(id)a3
{
}

- (NSData)actionButtonData
{
  return self->_actionButtonData;
}

- (void)setActionButtonData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletData, 0);
  objc_storeStrong((id *)&self->_universalData, 0);
  objc_storeStrong((id *)&self->_seedEnrollmentProgram, 0);
  objc_storeStrong((id *)&self->_seedEnrollmentCatalogID, 0);
  objc_storeStrong((id *)&self->_seedEnrollmentAssetAudience, 0);
  objc_storeStrong((id *)&self->_nanoRegistryData, 0);
  objc_storeStrong((id *)&self->_actionButtonData, 0);
}

- (id)expressSettings
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F9AA48]);
  id v4 = objc_alloc(MEMORY[0x1E4F94090]);
  __int16 v5 = [(BYBackupMetadata *)self universalData];
  __int16 v6 = (void *)[v4 initWithData:v5];

  if (SASExpressSettingsReadFrom())
  {
    id v7 = v3;
  }
  else
  {
    id v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BYBackupMetadata(SetupAssistantSupport) expressSettings](v8);
    }

    id v7 = 0;
  }

  return v7;
}

@end