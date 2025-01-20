@interface TRISystemDimensions
+ (Class)userKeyboardEnabledInputModeIdentifiersType;
- (BOOL)experimentOptOutStatus;
- (BOOL)hasAneVersion;
- (BOOL)hasCarrierBundleIdentifier;
- (BOOL)hasCarrierCountryIsoCode;
- (BOOL)hasDeviceClass;
- (BOOL)hasExperimentOptOutStatus;
- (BOOL)hasIsAutomatedTestDevice;
- (BOOL)hasIsBetaUser;
- (BOOL)hasIsInternalBuild;
- (BOOL)hasOsBuild;
- (BOOL)hasTargetedPopulation;
- (BOOL)hasUserSettingsBcp47DeviceLocale;
- (BOOL)hasUserSettingsLanguageCode;
- (BOOL)hasUserSettingsRegionCode;
- (BOOL)hasVersionTag;
- (BOOL)isAutomatedTestDevice;
- (BOOL)isBetaUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalBuild;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)userKeyboardEnabledInputModeIdentifiers;
- (NSString)aneVersion;
- (NSString)carrierBundleIdentifier;
- (NSString)carrierCountryIsoCode;
- (NSString)deviceClass;
- (NSString)osBuild;
- (NSString)userSettingsBcp47DeviceLocale;
- (NSString)userSettingsLanguageCode;
- (NSString)userSettingsRegionCode;
- (NSString)versionTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)targetedPopulationAsString:(int)a3;
- (id)userKeyboardEnabledInputModeIdentifiersAtIndex:(unint64_t)a3;
- (int)StringAsTargetedPopulation:(id)a3;
- (int)targetedPopulation;
- (unint64_t)hash;
- (unint64_t)userKeyboardEnabledInputModeIdentifiersCount;
- (void)addUserKeyboardEnabledInputModeIdentifiers:(id)a3;
- (void)clearUserKeyboardEnabledInputModeIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAneVersion:(id)a3;
- (void)setCarrierBundleIdentifier:(id)a3;
- (void)setCarrierCountryIsoCode:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setExperimentOptOutStatus:(BOOL)a3;
- (void)setHasExperimentOptOutStatus:(BOOL)a3;
- (void)setHasIsAutomatedTestDevice:(BOOL)a3;
- (void)setHasIsBetaUser:(BOOL)a3;
- (void)setHasIsInternalBuild:(BOOL)a3;
- (void)setHasTargetedPopulation:(BOOL)a3;
- (void)setIsAutomatedTestDevice:(BOOL)a3;
- (void)setIsBetaUser:(BOOL)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setOsBuild:(id)a3;
- (void)setTargetedPopulation:(int)a3;
- (void)setUserKeyboardEnabledInputModeIdentifiers:(id)a3;
- (void)setUserSettingsBcp47DeviceLocale:(id)a3;
- (void)setUserSettingsLanguageCode:(id)a3;
- (void)setUserSettingsRegionCode:(id)a3;
- (void)setVersionTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRISystemDimensions

- (BOOL)hasDeviceClass
{
  return self->_deviceClass != 0;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isInternalBuild = a3;
}

- (void)setHasIsInternalBuild:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsInternalBuild
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsBetaUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isBetaUser = a3;
}

- (void)setHasIsBetaUser:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsBetaUser
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasVersionTag
{
  return self->_versionTag != 0;
}

- (BOOL)hasOsBuild
{
  return self->_osBuild != 0;
}

- (BOOL)hasUserSettingsLanguageCode
{
  return self->_userSettingsLanguageCode != 0;
}

- (BOOL)hasUserSettingsRegionCode
{
  return self->_userSettingsRegionCode != 0;
}

- (void)clearUserKeyboardEnabledInputModeIdentifiers
{
}

- (void)addUserKeyboardEnabledInputModeIdentifiers:(id)a3
{
  id v4 = a3;
  userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  id v8 = v4;
  if (!userKeyboardEnabledInputModeIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_userKeyboardEnabledInputModeIdentifiers;
    self->_userKeyboardEnabledInputModeIdentifiers = v6;

    id v4 = v8;
    userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  }
  [(NSMutableArray *)userKeyboardEnabledInputModeIdentifiers addObject:v4];
}

- (unint64_t)userKeyboardEnabledInputModeIdentifiersCount
{
  return [(NSMutableArray *)self->_userKeyboardEnabledInputModeIdentifiers count];
}

- (id)userKeyboardEnabledInputModeIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userKeyboardEnabledInputModeIdentifiers objectAtIndex:a3];
}

+ (Class)userKeyboardEnabledInputModeIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserSettingsBcp47DeviceLocale
{
  return self->_userSettingsBcp47DeviceLocale != 0;
}

- (int)targetedPopulation
{
  if (*(unsigned char *)&self->_has) {
    return self->_targetedPopulation;
  }
  else {
    return 0;
  }
}

- (void)setTargetedPopulation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_targetedPopulation = a3;
}

- (void)setHasTargetedPopulation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTargetedPopulation
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)targetedPopulationAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E576C640[a3];
  }
  return v3;
}

- (int)StringAsTargetedPopulation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POPULATION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIMITED_CARRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ORGANIZATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INTERNAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BETA_PROGRAM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GENERAL_PUBLIC"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCarrierCountryIsoCode
{
  return self->_carrierCountryIsoCode != 0;
}

- (BOOL)hasCarrierBundleIdentifier
{
  return self->_carrierBundleIdentifier != 0;
}

- (void)setExperimentOptOutStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_experimentOptOutStatus = a3;
}

- (void)setHasExperimentOptOutStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExperimentOptOutStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAneVersion
{
  return self->_aneVersion != 0;
}

- (void)setIsAutomatedTestDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isAutomatedTestDevice = a3;
}

- (void)setHasIsAutomatedTestDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAutomatedTestDevice
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRISystemDimensions;
  int v4 = [(TRISystemDimensions *)&v8 description];
  v5 = [(TRISystemDimensions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  deviceClass = self->_deviceClass;
  if (deviceClass) {
    [v3 setObject:deviceClass forKey:@"device_class"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_isInternalBuild];
    [v4 setObject:v7 forKey:@"is_internal_build"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_isBetaUser];
    [v4 setObject:v8 forKey:@"is_beta_user"];
  }
  versionTag = self->_versionTag;
  if (versionTag) {
    [v4 setObject:versionTag forKey:@"version_tag"];
  }
  osBuild = self->_osBuild;
  if (osBuild) {
    [v4 setObject:osBuild forKey:@"os_build"];
  }
  userSettingsLanguageCode = self->_userSettingsLanguageCode;
  if (userSettingsLanguageCode) {
    [v4 setObject:userSettingsLanguageCode forKey:@"user_settings_language_code"];
  }
  userSettingsRegionCode = self->_userSettingsRegionCode;
  if (userSettingsRegionCode) {
    [v4 setObject:userSettingsRegionCode forKey:@"user_settings_region_code"];
  }
  userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  if (userKeyboardEnabledInputModeIdentifiers) {
    [v4 setObject:userKeyboardEnabledInputModeIdentifiers forKey:@"user_keyboard_enabled_input_mode_identifiers"];
  }
  userSettingsBcp47DeviceLocale = self->_userSettingsBcp47DeviceLocale;
  if (userSettingsBcp47DeviceLocale) {
    [v4 setObject:userSettingsBcp47DeviceLocale forKey:@"user_settings_bcp47_device_locale"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t targetedPopulation = self->_targetedPopulation;
    if (targetedPopulation >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_targetedPopulation);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E576C640[targetedPopulation];
    }
    [v4 setObject:v16 forKey:@"targeted_population"];
  }
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  if (carrierCountryIsoCode) {
    [v4 setObject:carrierCountryIsoCode forKey:@"carrier_country_iso_code"];
  }
  carrierBundleIdentifier = self->_carrierBundleIdentifier;
  if (carrierBundleIdentifier) {
    [v4 setObject:carrierBundleIdentifier forKey:@"carrier_bundle_identifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_experimentOptOutStatus];
    [v4 setObject:v19 forKey:@"experiment_opt_out_status"];
  }
  aneVersion = self->_aneVersion;
  if (aneVersion) {
    [v4 setObject:aneVersion forKey:@"ane_version"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_isAutomatedTestDevice];
    [v4 setObject:v21 forKey:@"is_automated_test_device"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRISystemDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_deviceClass) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_versionTag) {
    PBDataWriterWriteStringField();
  }
  if (self->_osBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_userSettingsLanguageCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_userSettingsRegionCode) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_userKeyboardEnabledInputModeIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_userSettingsBcp47DeviceLocale) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_carrierCountryIsoCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_carrierBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_aneVersion) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  long long v11 = v4;
  if (self->_deviceClass)
  {
    objc_msgSend(v4, "setDeviceClass:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[99] = self->_isInternalBuild;
    v4[100] |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[98] = self->_isBetaUser;
    v4[100] |= 8u;
  }
  if (self->_versionTag) {
    objc_msgSend(v11, "setVersionTag:");
  }
  if (self->_osBuild) {
    objc_msgSend(v11, "setOsBuild:");
  }
  if (self->_userSettingsLanguageCode) {
    objc_msgSend(v11, "setUserSettingsLanguageCode:");
  }
  if (self->_userSettingsRegionCode) {
    objc_msgSend(v11, "setUserSettingsRegionCode:");
  }
  if ([(TRISystemDimensions *)self userKeyboardEnabledInputModeIdentifiersCount])
  {
    [v11 clearUserKeyboardEnabledInputModeIdentifiers];
    unint64_t v6 = [(TRISystemDimensions *)self userKeyboardEnabledInputModeIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(TRISystemDimensions *)self userKeyboardEnabledInputModeIdentifiersAtIndex:i];
        [v11 addUserKeyboardEnabledInputModeIdentifiers:v9];
      }
    }
  }
  if (self->_userSettingsBcp47DeviceLocale) {
    objc_msgSend(v11, "setUserSettingsBcp47DeviceLocale:");
  }
  v10 = v11;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v11 + 12) = self->_targetedPopulation;
    v11[100] |= 1u;
  }
  if (self->_carrierCountryIsoCode)
  {
    objc_msgSend(v11, "setCarrierCountryIsoCode:");
    v10 = v11;
  }
  if (self->_carrierBundleIdentifier)
  {
    objc_msgSend(v11, "setCarrierBundleIdentifier:");
    v10 = v11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10[96] = self->_experimentOptOutStatus;
    v10[100] |= 2u;
  }
  if (self->_aneVersion)
  {
    objc_msgSend(v11, "setAneVersion:");
    v10 = v11;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v10[97] = self->_isAutomatedTestDevice;
    v10[100] |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceClass copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 99) = self->_isInternalBuild;
    *(unsigned char *)(v5 + 100) |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 98) = self->_isBetaUser;
    *(unsigned char *)(v5 + 100) |= 8u;
  }
  uint64_t v9 = [(NSString *)self->_versionTag copyWithZone:a3];
  v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  uint64_t v11 = [(NSString *)self->_osBuild copyWithZone:a3];
  long long v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  uint64_t v13 = [(NSString *)self->_userSettingsLanguageCode copyWithZone:a3];
  long long v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_userSettingsRegionCode copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v15;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v17 = self->_userKeyboardEnabledInputModeIdentifiers;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [(id)v5 addUserKeyboardEnabledInputModeIdentifiers:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [(NSString *)self->_userSettingsBcp47DeviceLocale copyWithZone:a3];
  v24 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v23;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_targetedPopulation;
    *(unsigned char *)(v5 + 100) |= 1u;
  }
  uint64_t v25 = -[NSString copyWithZone:](self->_carrierCountryIsoCode, "copyWithZone:", a3, (void)v32);
  v26 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v25;

  uint64_t v27 = [(NSString *)self->_carrierBundleIdentifier copyWithZone:a3];
  v28 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v27;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 96) = self->_experimentOptOutStatus;
    *(unsigned char *)(v5 + 100) |= 2u;
  }
  uint64_t v29 = [(NSString *)self->_aneVersion copyWithZone:a3];
  v30 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v29;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 97) = self->_isAutomatedTestDevice;
    *(unsigned char *)(v5 + 100) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  deviceClass = self->_deviceClass;
  if ((unint64_t)deviceClass | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](deviceClass, "isEqual:")) {
      goto LABEL_54;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x10) == 0) {
      goto LABEL_54;
    }
    if (self->_isInternalBuild)
    {
      if (!*((unsigned char *)v4 + 99)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 99))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0) {
      goto LABEL_54;
    }
    if (self->_isBetaUser)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    goto LABEL_54;
  }
  versionTag = self->_versionTag;
  if ((unint64_t)versionTag | *((void *)v4 + 11)
    && !-[NSString isEqual:](versionTag, "isEqual:"))
  {
    goto LABEL_54;
  }
  osBuild = self->_osBuild;
  if ((unint64_t)osBuild | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](osBuild, "isEqual:")) {
      goto LABEL_54;
    }
  }
  userSettingsLanguageCode = self->_userSettingsLanguageCode;
  if ((unint64_t)userSettingsLanguageCode | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](userSettingsLanguageCode, "isEqual:")) {
      goto LABEL_54;
    }
  }
  userSettingsRegionCode = self->_userSettingsRegionCode;
  if ((unint64_t)userSettingsRegionCode | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](userSettingsRegionCode, "isEqual:")) {
      goto LABEL_54;
    }
  }
  userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  if ((unint64_t)userKeyboardEnabledInputModeIdentifiers | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](userKeyboardEnabledInputModeIdentifiers, "isEqual:")) {
      goto LABEL_54;
    }
  }
  userSettingsBcp47DeviceLocale = self->_userSettingsBcp47DeviceLocale;
  if ((unint64_t)userSettingsBcp47DeviceLocale | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](userSettingsBcp47DeviceLocale, "isEqual:")) {
      goto LABEL_54;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_targetedPopulation != *((_DWORD *)v4 + 12)) {
      goto LABEL_54;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_54;
  }
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  if ((unint64_t)carrierCountryIsoCode | *((void *)v4 + 3)
    && !-[NSString isEqual:](carrierCountryIsoCode, "isEqual:"))
  {
    goto LABEL_54;
  }
  carrierBundleIdentifier = self->_carrierBundleIdentifier;
  if ((unint64_t)carrierBundleIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](carrierBundleIdentifier, "isEqual:")) {
      goto LABEL_54;
    }
  }
  char has = (char)self->_has;
  char v15 = *((unsigned char *)v4 + 100);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0) {
      goto LABEL_54;
    }
    if (self->_experimentOptOutStatus)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_54;
  }
  aneVersion = self->_aneVersion;
  if ((unint64_t)aneVersion | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](aneVersion, "isEqual:")) {
      goto LABEL_54;
    }
    char has = (char)self->_has;
    char v15 = *((unsigned char *)v4 + 100);
  }
  BOOL v17 = (v15 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v15 & 4) != 0)
    {
      if (self->_isAutomatedTestDevice)
      {
        if (!*((unsigned char *)v4 + 97)) {
          goto LABEL_54;
        }
      }
      else if (*((unsigned char *)v4 + 97))
      {
        goto LABEL_54;
      }
      BOOL v17 = 1;
      goto LABEL_55;
    }
LABEL_54:
    BOOL v17 = 0;
  }
LABEL_55:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v18 = [(NSString *)self->_deviceClass hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v17 = 2654435761 * self->_isInternalBuild;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v16 = 2654435761 * self->_isBetaUser;
      goto LABEL_6;
    }
  }
  uint64_t v16 = 0;
LABEL_6:
  NSUInteger v15 = [(NSString *)self->_versionTag hash];
  NSUInteger v14 = [(NSString *)self->_osBuild hash];
  NSUInteger v13 = [(NSString *)self->_userSettingsLanguageCode hash];
  NSUInteger v3 = [(NSString *)self->_userSettingsRegionCode hash];
  uint64_t v4 = [(NSMutableArray *)self->_userKeyboardEnabledInputModeIdentifiers hash];
  NSUInteger v5 = [(NSString *)self->_userSettingsBcp47DeviceLocale hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_targetedPopulation;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_carrierCountryIsoCode hash];
  NSUInteger v8 = [(NSString *)self->_carrierBundleIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_experimentOptOutStatus;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_aneVersion hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_isAutomatedTestDevice;
  }
  else {
    uint64_t v11 = 0;
  }
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[TRISystemDimensions setDeviceClass:](self, "setDeviceClass:");
  }
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 0x10) != 0)
  {
    self->_isInternalBuild = *((unsigned char *)v4 + 99);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 100);
  }
  if ((v5 & 8) != 0)
  {
    self->_isBetaUser = *((unsigned char *)v4 + 98);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 11)) {
    -[TRISystemDimensions setVersionTag:](self, "setVersionTag:");
  }
  if (*((void *)v4 + 5)) {
    -[TRISystemDimensions setOsBuild:](self, "setOsBuild:");
  }
  if (*((void *)v4 + 9)) {
    -[TRISystemDimensions setUserSettingsLanguageCode:](self, "setUserSettingsLanguageCode:");
  }
  if (*((void *)v4 + 10)) {
    -[TRISystemDimensions setUserSettingsRegionCode:](self, "setUserSettingsRegionCode:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 7);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TRISystemDimensions addUserKeyboardEnabledInputModeIdentifiers:](self, "addUserKeyboardEnabledInputModeIdentifiers:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 8)) {
    -[TRISystemDimensions setUserSettingsBcp47DeviceLocale:](self, "setUserSettingsBcp47DeviceLocale:");
  }
  if (*((unsigned char *)v4 + 100))
  {
    self->_uint64_t targetedPopulation = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[TRISystemDimensions setCarrierCountryIsoCode:](self, "setCarrierCountryIsoCode:");
  }
  if (*((void *)v4 + 2)) {
    -[TRISystemDimensions setCarrierBundleIdentifier:](self, "setCarrierBundleIdentifier:");
  }
  if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    self->_experimentOptOutStatus = *((unsigned char *)v4 + 96);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1)) {
    -[TRISystemDimensions setAneVersion:](self, "setAneVersion:");
  }
  if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    self->_isAutomatedTestDevice = *((unsigned char *)v4 + 97);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (BOOL)isBetaUser
{
  return self->_isBetaUser;
}

- (NSString)versionTag
{
  return self->_versionTag;
}

- (void)setVersionTag:(id)a3
{
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (void)setOsBuild:(id)a3
{
}

- (NSString)userSettingsLanguageCode
{
  return self->_userSettingsLanguageCode;
}

- (void)setUserSettingsLanguageCode:(id)a3
{
}

- (NSString)userSettingsRegionCode
{
  return self->_userSettingsRegionCode;
}

- (void)setUserSettingsRegionCode:(id)a3
{
}

- (NSMutableArray)userKeyboardEnabledInputModeIdentifiers
{
  return self->_userKeyboardEnabledInputModeIdentifiers;
}

- (void)setUserKeyboardEnabledInputModeIdentifiers:(id)a3
{
}

- (NSString)userSettingsBcp47DeviceLocale
{
  return self->_userSettingsBcp47DeviceLocale;
}

- (void)setUserSettingsBcp47DeviceLocale:(id)a3
{
}

- (NSString)carrierCountryIsoCode
{
  return self->_carrierCountryIsoCode;
}

- (void)setCarrierCountryIsoCode:(id)a3
{
}

- (NSString)carrierBundleIdentifier
{
  return self->_carrierBundleIdentifier;
}

- (void)setCarrierBundleIdentifier:(id)a3
{
}

- (BOOL)experimentOptOutStatus
{
  return self->_experimentOptOutStatus;
}

- (NSString)aneVersion
{
  return self->_aneVersion;
}

- (void)setAneVersion:(id)a3
{
}

- (BOOL)isAutomatedTestDevice
{
  return self->_isAutomatedTestDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionTag, 0);
  objc_storeStrong((id *)&self->_userSettingsRegionCode, 0);
  objc_storeStrong((id *)&self->_userSettingsLanguageCode, 0);
  objc_storeStrong((id *)&self->_userSettingsBcp47DeviceLocale, 0);
  objc_storeStrong((id *)&self->_userKeyboardEnabledInputModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_aneVersion, 0);
}

@end