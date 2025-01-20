@interface UNCSectionInfo
+ (BOOL)supportsSecureCoding;
+ (id)defaultSectionInfoForSection:(id)a3;
+ (id)defaultSectionInfoForType:(int64_t)a3;
- (BOOL)_isDeliveredQuietly;
- (BOOL)allowsNotifications;
- (BOOL)enabled;
- (BOOL)hasEnabledSettings;
- (BOOL)hasUserConfiguredDirectMessagesSetting;
- (BOOL)hasUserConfiguredTimeSensitiveSetting;
- (BOOL)hideWeeApp;
- (BOOL)isAppClip;
- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3;
- (BOOL)isDeliveredQuietly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isModificationAllowed;
- (BOOL)isRestricted;
- (BOOL)showsCustomSettingsLink;
- (BOOL)showsInLockScreen;
- (BOOL)showsInNotificationCenter;
- (BOOL)showsMessagePreview;
- (BOOL)showsOnExternalDevices;
- (BOOL)suppressFromSettings;
- (BOOL)usesManagedSettings;
- (NSArray)dataProviderIDs;
- (NSArray)subsections;
- (NSData)iconData;
- (NSDate)authorizationExpirationDate;
- (NSDate)lastUserGrantedAuthorizationDate;
- (NSDictionary)stateCapture;
- (NSString)appName;
- (NSString)customSettingsBundle;
- (NSString)customSettingsDetailControllerClass;
- (NSString)displayName;
- (NSString)factorySectionID;
- (NSString)pathToWeeAppPluginBundle;
- (NSString)sectionID;
- (NSString)subsectionID;
- (UNCMuteAssertion)muteAssertion;
- (UNCSectionIcon)icon;
- (UNCSectionInfo)init;
- (UNCSectionInfo)initWithCoder:(id)a3;
- (UNCSectionInfo)initWithDefaultsForSectionType:(int64_t)a3;
- (UNCSectionInfo)parentSection;
- (UNCSectionInfoSettings)managedSectionInfoSettings;
- (UNCSectionInfoSettings)readableSettings;
- (UNCSectionInfoSettings)sectionInfoSettings;
- (UNCSectionInfoSettings)writableSettings;
- (id)_subsectionForID:(id)a3;
- (id)_suppressedSettingsList:(unint64_t)a3;
- (id)copyFromManagedSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectiveSectionInfoWithDefaultContentPreviewSetting:(int64_t)a3 globalAnnounceSetting:(int64_t)a4 globalScheduledDeliverySetting:(int64_t)a5 hasPairedVehiclesForCarPlay:(BOOL)a6 hasDestinationForRemoteNotifications:(BOOL)a7;
- (id)effectiveSectionInfoWithFactoryInfo:(id)a3 defaultContentPreviewSetting:(int64_t)a4 globalAnnounceSetting:(int64_t)a5 globalScheduledDeliverySetting:(int64_t)a6 hasPairedVehiclesForCarPlay:(BOOL)a7 hasDestinationForRemoteNotifications:(BOOL)a8;
- (int64_t)announceSetting;
- (int64_t)authorizationStatus;
- (int64_t)bulletinGroupingSetting;
- (int64_t)carPlaySetting;
- (int64_t)contentPreviewSetting;
- (int64_t)criticalAlertSetting;
- (int64_t)directMessagesSetting;
- (int64_t)disabledSettingForSetting:(int64_t)a3;
- (int64_t)lockScreenSetting;
- (int64_t)notificationCenterSetting;
- (int64_t)remoteNotificationsSetting;
- (int64_t)scheduledDeliverySetting;
- (int64_t)sectionCategory;
- (int64_t)sectionType;
- (int64_t)spokenNotificationSetting;
- (int64_t)subsectionPriority;
- (int64_t)timeSensitiveSetting;
- (unint64_t)alertType;
- (unint64_t)bulletinCount;
- (unint64_t)hash;
- (unint64_t)notificationCenterLimit;
- (unint64_t)pushSettings;
- (unint64_t)suppressedSettings;
- (unint64_t)version;
- (void)_addSubsection:(id)a3;
- (void)_associateDataProviderSectionInfo:(id)a3;
- (void)_configureWithDefaultsForSectionType:(int64_t)a3;
- (void)_deliverQuietly:(BOOL)a3;
- (void)_dissociateDataProviderSectionInfo:(id)a3;
- (void)_replaceSubsection:(id)a3;
- (void)deliverQuietly:(BOOL)a3;
- (void)deliverQuietly:(BOOL)a3 changeAuthorizationStatus:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)makeAuthorizationPermanent;
- (void)muteSectionUntilDate:(id)a3;
- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4;
- (void)queryAndUseManagedSettings;
- (void)queryAndUseManagedSettingsForSectionID:(id)a3;
- (void)setAlertType:(unint64_t)a3;
- (void)setAllowsNotifications:(BOOL)a3;
- (void)setAnnounceSetting:(int64_t)a3;
- (void)setAppName:(id)a3;
- (void)setAuthorizationExpirationDate:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setBulletinGroupingSetting:(int64_t)a3;
- (void)setCarPlaySetting:(int64_t)a3;
- (void)setContentPreviewSetting:(int64_t)a3;
- (void)setCriticalAlertSetting:(int64_t)a3;
- (void)setCustomSettingsBundle:(id)a3;
- (void)setCustomSettingsDetailControllerClass:(id)a3;
- (void)setDataProviderIDs:(id)a3;
- (void)setDirectMessagesSetting:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFactorySectionID:(id)a3;
- (void)setHideWeeApp:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIsAppClip:(BOOL)a3;
- (void)setIsModificationAllowed:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setLastUserGrantedAuthorizationDate:(id)a3;
- (void)setLockScreenSetting:(int64_t)a3;
- (void)setManagedSectionInfoSettings:(id)a3;
- (void)setMuteAssertion:(id)a3;
- (void)setNotificationCenterSetting:(int64_t)a3;
- (void)setParentSection:(id)a3;
- (void)setPathToWeeAppPluginBundle:(id)a3;
- (void)setPushSettings:(unint64_t)a3;
- (void)setRemoteNotificationsSetting:(int64_t)a3;
- (void)setScheduledDeliverySetting:(int64_t)a3;
- (void)setSectionCategory:(int64_t)a3;
- (void)setSectionID:(id)a3;
- (void)setSectionInfoSettings:(id)a3;
- (void)setSectionType:(int64_t)a3;
- (void)setShowsCustomSettingsLink:(BOOL)a3;
- (void)setShowsInLockScreen:(BOOL)a3;
- (void)setShowsInNotificationCenter:(BOOL)a3;
- (void)setShowsMessagePreview:(BOOL)a3;
- (void)setShowsOnExternalDevices:(BOOL)a3;
- (void)setSpokenNotificationSetting:(int64_t)a3;
- (void)setSubsectionID:(id)a3;
- (void)setSubsectionPriority:(int64_t)a3;
- (void)setSubsections:(id)a3;
- (void)setSuppressFromSettings:(BOOL)a3;
- (void)setSuppressedSettings:(unint64_t)a3;
- (void)setTimeSensitiveSetting:(int64_t)a3;
- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3;
- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
- (void)unmuteSection;
- (void)unmuteThreadIdentifier:(id)a3;
- (void)updateWithDefaultSectionInfo:(id)a3;
@end

@implementation UNCSectionInfo

+ (id)defaultSectionInfoForType:(int64_t)a3
{
  v3 = [[UNCSectionInfo alloc] initWithDefaultsForSectionType:a3];

  return v3;
}

- (UNCSectionInfo)init
{
  return [(UNCSectionInfo *)self initWithDefaultsForSectionType:0];
}

- (UNCSectionInfo)initWithDefaultsForSectionType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UNCSectionInfo;
  v4 = [(UNCSectionInfo *)&v8 init];
  if (v4)
  {
    v5 = [[UNCSectionInfoSettings alloc] initWithDefaultsForSectionType:a3];
    sectionInfoSettings = v4->_sectionInfoSettings;
    v4->_sectionInfoSettings = v5;

    [(UNCSectionInfo *)v4 _configureWithDefaultsForSectionType:a3];
  }
  return v4;
}

- (void)_configureWithDefaultsForSectionType:(int64_t)a3
{
  -[UNCSectionInfo setSectionType:](self, "setSectionType:");
  [(UNCSectionInfo *)self setSuppressedSettings:0];
  if ((a3 | 2) == 2)
  {
    [(UNCSectionInfo *)self setBulletinCount:5];
    if (a3 == 2)
    {
      [(UNCSectionInfo *)self setSuppressedSettings:8];
    }
  }
}

- (void)_addSubsection:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setParentSection:self];
    v5 = (void *)MEMORY[0x263EFF980];
    v6 = [(UNCSectionInfo *)self subsections];
    id v7 = [v5 arrayWithArray:v6];

    [v7 addObject:v4];
    [(UNCSectionInfo *)self setSubsections:v7];
  }
}

- (void)_replaceSubsection:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17 = self;
  v5 = [(UNCSectionInfo *)self subsections];
  v6 = [v4 subsectionID];
  if ([v5 count] && v6)
  {
    id v7 = [MEMORY[0x263EFF980] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v16 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "subsectionID", v16);
          int v15 = [v14 isEqualToString:v6];

          if (v15)
          {
            [v13 setParentSection:0];
            [v4 setParentSection:v17];
            v13 = v4;
          }
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [(UNCSectionInfo *)v17 setSubsections:v7];
    v5 = v16;
  }
}

- (id)_subsectionForID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(UNCSectionInfo *)self subsections];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 subsectionID];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_associateDataProviderSectionInfo:(id)a3
{
  id v4 = a3;
  id v8 = [v4 sectionID];
  v5 = [(UNCSectionInfo *)self dataProviderIDs];
  if (v8 && ([v5 containsObject:v8] & 1) == 0)
  {
    id v6 = [MEMORY[0x263EFF980] arrayWithArray:v5];
    [v6 addObject:v8];
    [(UNCSectionInfo *)self setDataProviderIDs:v6];
  }
  uint64_t v7 = [(UNCSectionInfo *)self sectionID];
  [v4 setFactorySectionID:v7];
}

- (void)_dissociateDataProviderSectionInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    v5 = [v4 factorySectionID];
    id v6 = [(UNCSectionInfo *)self sectionID];
    int v7 = [v5 isEqualToString:v6];

    id v4 = v12;
    if (v7)
    {
      id v8 = (void *)MEMORY[0x263EFF980];
      uint64_t v9 = [(UNCSectionInfo *)self dataProviderIDs];
      uint64_t v10 = [v8 arrayWithArray:v9];

      int v11 = [v12 sectionID];
      [v10 removeObject:v11];

      [(UNCSectionInfo *)self setDataProviderIDs:v10];
      [v12 setFactorySectionID:0];

      id v4 = v12;
    }
  }
}

- (void)setParentSection:(id)a3
{
  p_parentSection = &self->_parentSection;
  id v7 = a3;
  id v5 = objc_storeWeak((id *)p_parentSection, v7);
  id v6 = [v7 managedSectionInfoSettings];

  [(UNCSectionInfo *)self setManagedSectionInfoSettings:v6];
}

- (BOOL)hasEnabledSettings
{
  if ([(UNCSectionInfo *)self allowsNotifications])
  {
    char v3 = [(UNCSectionInfo *)self pushSettings];
    if ((v3 & 0x18) != 0
      || (v3 & 0x20) != 0 && [(UNCSectionInfo *)self alertType]
      || [(UNCSectionInfo *)self lockScreenSetting] == 2
      || [(UNCSectionInfo *)self notificationCenterSetting] == 2
      || [(UNCSectionInfo *)self carPlaySetting] == 2
      || [(UNCSectionInfo *)self remoteNotificationsSetting] == 2
      || [(UNCSectionInfo *)self criticalAlertSetting] == 2)
    {
      return 1;
    }
    int64_t v4 = [(UNCSectionInfo *)self scheduledDeliverySetting];
  }
  else
  {
    int64_t v4 = [(UNCSectionInfo *)self criticalAlertSetting];
  }
  return v4 == 2;
}

- (BOOL)_isDeliveredQuietly
{
  if (![(UNCSectionInfo *)self allowsNotifications]) {
    return 0;
  }
  if ([(UNCSectionInfo *)self notificationCenterSetting] != 2) {
    return 0;
  }
  char v3 = [(UNCSectionInfo *)self pushSettings];
  if ((v3 & 0x18) != 0 || (v3 & 0x20) != 0 && [(UNCSectionInfo *)self alertType]) {
    return 0;
  }
  if ([(UNCSectionInfo *)self lockScreenSetting] == 2) {
    return 0;
  }
  id v6 = [MEMORY[0x263F7FC90] sharedToneManager];
  char v7 = objc_msgSend(v6, "unc_isToneEnabledForSectionInfo:", self);

  if (v7) {
    return 0;
  }
  id v8 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  char v9 = objc_msgSend(v8, "unc_isVibrationEnabledForSectionInfo:", self);

  if (v9) {
    return 0;
  }
  if ([(UNCSectionInfo *)self carPlaySetting] != 2) {
    goto LABEL_14;
  }
  id v10 = objc_alloc_init((Class)getCRPairedVehicleManagerClass());
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__UNCSectionInfo__isDeliveredQuietly__block_invoke;
  v13[3] = &unk_265567578;
  v13[4] = &v14;
  [v10 syncFetchAllVehiclesWithCompletion:v13];
  uint64_t v11 = [(id)v15[5] count];
  _Block_object_dispose(&v14, 8);

  if (v11) {
    return 0;
  }
LABEL_14:
  if ([(UNCSectionInfo *)self announceSetting] != 2
    && [(UNCSectionInfo *)self announceSetting] != 3)
  {
    return 1;
  }
  id v12 = +[UNCBulletinDefaults standardDefaults];
  BOOL v4 = ([v12 isAnnounceSupportedForHeadphones] & 1) == 0
    && (![v12 isAnnounceSupportedForCarPlay]
     || ![v12 hasPairedVehiclesForCarPlay]);

  return v4;
}

void __37__UNCSectionInfo__isDeliveredQuietly__block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)isDeliveredQuietly
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v3 = [(UNCSectionInfo *)self subsections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(UNCSectionInfo *)self allowsNotifications];
    if (v5)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = [(UNCSectionInfo *)self subsections];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v7)
      {
LABEL_18:

LABEL_19:
        LOBYTE(v5) = 0;
        return v5;
      }
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v12 allowsNotifications]
            && [v12 notificationCenterSetting] == 2)
          {
            if (![v12 _isDeliveredQuietly]) {
              goto LABEL_18;
            }
            char v9 = 1;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);

      if ((v9 & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v5 = [(UNCSectionInfo *)self _isDeliveredQuietly];
    if (v5) {
LABEL_17:
    }
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_deliverQuietly:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(UNCSectionInfo *)self pushSettings];
  if (v3)
  {
    [(UNCSectionInfo *)self setPushSettings:v5 & 0xFFFFFFFFFFFFFFC7];
    [(UNCSectionInfo *)self setAlertType:0];
    if ([(UNCSectionInfo *)self lockScreenSetting]) {
      [(UNCSectionInfo *)self setLockScreenSetting:1];
    }
    if ([(UNCSectionInfo *)self carPlaySetting]) {
      [(UNCSectionInfo *)self setCarPlaySetting:1];
    }
    if ([(UNCSectionInfo *)self remoteNotificationsSetting]) {
      [(UNCSectionInfo *)self setRemoteNotificationsSetting:1];
    }
    if ([(UNCSectionInfo *)self announceSetting])
    {
      uint64_t v6 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    [(UNCSectionInfo *)self setPushSettings:(8 * (v5 & 7)) | v5];
    [(UNCSectionInfo *)self setAlertType:1];
    if ([(UNCSectionInfo *)self lockScreenSetting]) {
      [(UNCSectionInfo *)self setLockScreenSetting:2];
    }
    if ([(UNCSectionInfo *)self carPlaySetting]) {
      [(UNCSectionInfo *)self setCarPlaySetting:2];
    }
    if ([(UNCSectionInfo *)self remoteNotificationsSetting]) {
      [(UNCSectionInfo *)self setRemoteNotificationsSetting:2];
    }
    if ([(UNCSectionInfo *)self announceSetting])
    {
      if ([(UNCSectionInfo *)self timeSensitiveSetting] == 2) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
LABEL_20:
      [(UNCSectionInfo *)self setAnnounceSetting:v6];
    }
  }
}

- (void)deliverQuietly:(BOOL)a3
{
}

- (void)deliverQuietly:(BOOL)a3 changeAuthorizationStatus:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263F7FC68];
  uint64_t v8 = [(UNCSectionInfo *)self sectionID];
  uint64_t v9 = objc_msgSend(v7, "unc_toneLibraryAlertTypeForSectionID:", v8);

  if (v9) {
    [MEMORY[0x263F7FC68] _setCurrentOverridePolicy:v5 forType:v9];
  }
  uint64_t v10 = [(UNCSectionInfo *)self subsections];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = [(UNCSectionInfo *)self subsections];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v16++) _deliverQuietly:v5];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    if (v4) {
      goto LABEL_12;
    }
  }
  else
  {
    [(UNCSectionInfo *)self _deliverQuietly:v5];
    if (v4) {
LABEL_12:
    }
      [(UNCSectionInfo *)self makeAuthorizationPermanent];
  }
  if (v5)
  {
    long long v17 = [(UNCSectionInfo *)self muteAssertion];

    if (v17) {
      [(UNCSectionInfo *)self setMuteAssertion:0];
    }
  }
}

- (void)makeAuthorizationPermanent
{
  if ([(UNCSectionInfo *)self authorizationStatus] == 4
    || [(UNCSectionInfo *)self authorizationStatus] == 3)
  {
    [(UNCSectionInfo *)self setAuthorizationStatus:2];
  }
}

- (void)muteSectionUntilDate:(id)a3
{
  id v5 = a3;
  if (![(UNCSectionInfo *)self _isDeliveredQuietly])
  {
    BOOL v4 = [(UNCSectionInfo *)self sectionInfoSettings];
    [v4 muteSectionUntilDate:v5];
  }
}

- (void)unmuteSection
{
  id v2 = [(UNCSectionInfo *)self sectionInfoSettings];
  [v2 unmuteSection];
}

- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(UNCSectionInfo *)self _isDeliveredQuietly])
  {
    uint64_t v7 = [(UNCSectionInfo *)self sectionInfoSettings];
    [v7 muteThreadIdentifier:v8 untilDate:v6];
  }
}

- (void)unmuteThreadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCSectionInfo *)self sectionInfoSettings];
  [v5 unmuteThreadIdentifier:v4];
}

- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCSectionInfo *)self sectionInfoSettings];
  char v6 = [v5 isBulletinMutedForThreadIdentifier:v4];

  return v6;
}

- (id)_suppressedSettingsList:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = v4;
  if (a3 == -1)
  {
    char v6 = @"All";
LABEL_36:
    [v5 addObject:v6];
    goto LABEL_37;
  }
  if (a3)
  {
    [v4 addObject:@"ShowsInNotificationCenter"];
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v5 addObject:@"ShowsInLockScreen"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v5 addObject:@"ShowsOnExternalDevices"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v5 addObject:@"NotificationCenterLimit"];
  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v5 addObject:@"PushSettings"];
  if ((a3 & 0x20) == 0)
  {
LABEL_8:
    if ((a3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v5 addObject:@"AlertType"];
  if ((a3 & 0x40) == 0)
  {
LABEL_9:
    if ((a3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v5 addObject:@"ShowsMessagePreview"];
  if ((a3 & 0x80) == 0)
  {
LABEL_10:
    if ((a3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v5 addObject:@"ShowsInCarPlay"];
  if ((a3 & 0x100) == 0)
  {
LABEL_11:
    if ((a3 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v5 addObject:@"CriticalAlert"];
  if ((a3 & 0x200) == 0)
  {
LABEL_12:
    if ((a3 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v5 addObject:@"BulletinGrouping"];
  if ((a3 & 0x400) == 0)
  {
LABEL_13:
    if ((a3 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v5 addObject:@"SpokenNotifications"];
  [v5 addObject:@"SpokenNotifications"];
  if ((a3 & 0x800) == 0)
  {
LABEL_14:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v5 addObject:@"TimeSensitive"];
  if ((a3 & 0x1000) == 0)
  {
LABEL_15:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v5 addObject:@"ScheduledDelivery"];
  if ((a3 & 0x2000) == 0)
  {
LABEL_16:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_17;
    }
LABEL_34:
    [v5 addObject:@"Sound"];
    if ((a3 & 0x8000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
LABEL_33:
  [v5 addObject:@"Badge"];
  if ((a3 & 0x4000) != 0) {
    goto LABEL_34;
  }
LABEL_17:
  if ((a3 & 0x8000) != 0)
  {
LABEL_35:
    char v6 = @"DirectMessages";
    goto LABEL_36;
  }
LABEL_37:

  return v5;
}

- (NSDictionary)stateCapture
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(UNCSectionInfoSettings *)self->_sectionInfoSettings stateCapture];
  [v3 setValue:v4 forKey:@"SectionInfoSettings"];

  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  if (managedSectionInfoSettings)
  {
    char v6 = [(UNCSectionInfoSettings *)managedSectionInfoSettings stateCapture];
    [v3 setValue:v6 forKey:@"ManagedSettings"];
  }
  else
  {
    [v3 setValue:@"Unmanaged" forKey:@"ManagedSettings"];
  }
  uint64_t v7 = [(UNCSectionInfo *)self appName];

  if (v7)
  {
    id v8 = [(UNCSectionInfo *)self appName];
    [v3 setValue:v8 forKey:@"AppName"];
  }
  uint64_t v9 = [(UNCSectionInfo *)self displayName];

  if (v9)
  {
    uint64_t v10 = [(UNCSectionInfo *)self displayName];
    [v3 setValue:v10 forKey:@"DisplayName"];
  }
  uint64_t v11 = [(UNCSectionInfo *)self subsectionID];

  if (v11)
  {
    id v12 = [(UNCSectionInfo *)self subsectionID];
    [v3 setValue:v12 forKey:@"SubSectionID"];
  }
  uint64_t v13 = [(UNCSectionInfo *)self factorySectionID];

  if (v13)
  {
    uint64_t v14 = [(UNCSectionInfo *)self factorySectionID];
    [v3 setValue:v14 forKey:@"FactorySectionID"];
  }
  if ([(UNCSectionInfo *)self version])
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNCSectionInfo version](self, "version"));
    [v3 setValue:v15 forKey:@"Version"];
  }
  uint64_t v16 = UNCStringFromBool(self->_suppressFromSettings);
  [v3 setValue:v16 forKey:@"HiddenFromSettings"];

  long long v17 = UNCStringFromBool([(UNCSectionInfo *)self hideWeeApp]);
  [v3 setValue:v17 forKey:@"HiddenWeeApp"];

  unint64_t v18 = [(UNCSectionInfo *)self suppressedSettings];
  if (v18)
  {
    long long v19 = [(UNCSectionInfo *)self _suppressedSettingsList:v18];
    [v3 setValue:v19 forKey:@"SuppressedSettings"];
  }
  long long v20 = [(UNCSectionInfo *)self subsections];
  if ([v20 count])
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v28 = objc_msgSend(v27, "stateCapture", (void)v38);
          v29 = [v27 subsectionID];
          [v21 setValue:v28 forKey:v29];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v24);
    }

    [v3 setValue:v21 forKey:@"SubSections"];
    goto LABEL_25;
  }
  uint64_t v31 = [(UNCSectionInfo *)self parentSection];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(UNCSectionInfo *)self parentSection];
    v34 = [v33 sectionID];
    v35 = [(UNCSectionInfo *)self sectionID];
    char v36 = [v34 isEqualToString:v35];

    if ((v36 & 1) == 0)
    {
      id v21 = [(UNCSectionInfo *)self parentSection];
      v37 = [v21 sectionID];
      [v3 setValue:v37 forKey:@"ParentSectionID"];

LABEL_25:
    }
  }

  return (NSDictionary *)v3;
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)enabled
{
  return [(UNCSectionInfo *)self notificationCenterSetting] == 2;
}

- (unint64_t)bulletinCount
{
  return 500;
}

- (NSData)iconData
{
  id v2 = [(UNCSectionInfo *)self icon];
  id v3 = [v2 _bestVariantForFormat:1];
  id v4 = [v3 imageData];

  return (NSData *)v4;
}

- (unint64_t)notificationCenterLimit
{
  return 500;
}

- (id)description
{
  id v3 = [NSString stringWithFormat:@" Section %@", self->_sectionID];
  id v4 = [v3 stringByAppendingFormat:@" %@", self->_sectionInfoSettings];

  if (self->_isRestricted)
  {
    uint64_t v5 = [v4 stringByAppendingFormat:@" (restricted)"];

    id v4 = (void *)v5;
  }
  if (self->_managedSectionInfoSettings) {
    [v4 stringByAppendingFormat:@" %@ (managed)", self->_managedSectionInfoSettings];
  }
  else {
  char v6 = [v4 stringByAppendingString:@" (unmanaged)"];
  }

  uint64_t v7 = [(UNCSectionInfo *)self appName];

  if (v7)
  {
    id v8 = [(UNCSectionInfo *)self appName];
    uint64_t v9 = [v6 stringByAppendingFormat:@" '%@'", v8];

    char v6 = (void *)v9;
  }
  uint64_t v10 = [(UNCSectionInfo *)self displayName];

  if (v10)
  {
    uint64_t v11 = [(UNCSectionInfo *)self displayName];
    uint64_t v12 = [v6 stringByAppendingFormat:@" '%@'", v11];

    char v6 = (void *)v12;
  }
  uint64_t v13 = [(UNCSectionInfo *)self subsectionID];

  if (v13)
  {
    uint64_t v14 = [(UNCSectionInfo *)self subsectionID];
    uint64_t v15 = [v6 stringByAppendingFormat:@" (%@)", v14];

    char v6 = (void *)v15;
  }
  uint64_t v16 = [(UNCSectionInfo *)self factorySectionID];

  if (v16)
  {
    long long v17 = [(UNCSectionInfo *)self factorySectionID];
    uint64_t v18 = [v6 stringByAppendingFormat:@" (factory: %@)", v17];

    char v6 = (void *)v18;
  }
  if ([(UNCSectionInfo *)self version])
  {
    uint64_t v19 = objc_msgSend(v6, "stringByAppendingFormat:", @" [v%ld]", -[UNCSectionInfo version](self, "version"));

    char v6 = (void *)v19;
  }
  if (self->_suppressFromSettings)
  {
    uint64_t v20 = [v6 stringByAppendingString:@", hidden from settings"];

    char v6 = (void *)v20;
  }
  if ([(UNCSectionInfo *)self hideWeeApp])
  {
    uint64_t v21 = [v6 stringByAppendingString:@", hidden wee app"];

    char v6 = (void *)v21;
  }
  unint64_t v22 = [(UNCSectionInfo *)self suppressedSettings];
  if (v22)
  {
    uint64_t v23 = [v6 stringByAppendingFormat:@", suppressed settings = %lX", v22];

    char v6 = (void *)v23;
  }
  uint64_t v24 = [(UNCSectionInfo *)self subsections];
  if ([v24 count])
  {
    uint64_t v25 = [v6 stringByAppendingFormat:@", subsections = %@", v24];
LABEL_24:

    char v6 = (void *)v25;
    goto LABEL_25;
  }
  uint64_t v29 = [(UNCSectionInfo *)self parentSection];
  if (v29)
  {
    v30 = (void *)v29;
    uint64_t v31 = [(UNCSectionInfo *)self parentSection];
    v32 = [v31 sectionID];
    v33 = [(UNCSectionInfo *)self sectionID];
    char v34 = [v32 isEqualToString:v33];

    if ((v34 & 1) == 0)
    {
      v35 = [(UNCSectionInfo *)self parentSection];
      char v36 = [v35 sectionID];
      uint64_t v25 = [v6 stringByAppendingFormat:@", parent section = %@", v36];

      char v6 = v35;
      goto LABEL_24;
    }
  }
LABEL_25:
  v37.receiver = self;
  v37.super_class = (Class)UNCSectionInfo;
  v26 = [(UNCSectionInfo *)&v37 description];
  v27 = [v26 stringByAppendingString:v6];

  return v27;
}

- (unint64_t)hash
{
  v42 = [(UNCSectionInfo *)self sectionID];
  uint64_t v3 = [v42 hash];
  long long v41 = [(UNCSectionInfo *)self subsectionID];
  uint64_t v4 = [v41 hash] ^ v3;
  int64_t v5 = v4 ^ [(UNCSectionInfo *)self sectionType];
  uint64_t v6 = [(UNCSectionInfo *)self isAppClip];
  int64_t v7 = v5 ^ v6 ^ [(UNCSectionInfo *)self isModificationAllowed];
  uint64_t v8 = [(UNCSectionInfo *)self isRestricted];
  int64_t v9 = v8 ^ [(UNCSectionInfo *)self sectionCategory];
  int64_t v10 = v7 ^ v9 ^ [(UNCSectionInfo *)self suppressFromSettings];
  long long v40 = [(UNCSectionInfo *)self sectionInfoSettings];
  uint64_t v11 = [v40 hash];
  long long v39 = [(UNCSectionInfo *)self managedSectionInfoSettings];
  uint64_t v12 = v11 ^ [v39 hash];
  unint64_t v13 = v12 ^ [(UNCSectionInfo *)self suppressedSettings];
  long long v38 = [(UNCSectionInfo *)self subsections];
  uint64_t v14 = v13 ^ [v38 hash];
  objc_super v37 = [(UNCSectionInfo *)self parentSection];
  char v36 = [v37 sectionID];
  uint64_t v15 = v10 ^ v14 ^ [v36 hash];
  int64_t v16 = [(UNCSectionInfo *)self subsectionPriority];
  unint64_t v17 = v16 ^ [(UNCSectionInfo *)self version];
  v35 = [(UNCSectionInfo *)self appName];
  uint64_t v18 = v17 ^ [v35 hash];
  uint64_t v19 = [(UNCSectionInfo *)self displayName];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = [(UNCSectionInfo *)self icon];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = [(UNCSectionInfo *)self factorySectionID];
  uint64_t v24 = v22 ^ [v23 hash];
  uint64_t v25 = [(UNCSectionInfo *)self dataProviderIDs];
  uint64_t v26 = v15 ^ v24 ^ [v25 hash];
  v27 = [(UNCSectionInfo *)self customSettingsBundle];
  uint64_t v28 = [v27 hash];
  uint64_t v29 = [(UNCSectionInfo *)self customSettingsDetailControllerClass];
  uint64_t v30 = v28 ^ [v29 hash];
  uint64_t v31 = [(UNCSectionInfo *)self pathToWeeAppPluginBundle];
  uint64_t v32 = v30 ^ [v31 hash];
  unint64_t v33 = v26 ^ v32 ^ [(UNCSectionInfo *)self hideWeeApp];

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UNCSectionInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      int64_t v5 = v4;
      uint64_t v6 = [(UNCSectionInfo *)self sectionID];
      int64_t v7 = [(UNCSectionInfo *)v5 sectionID];
      if (BSEqualStrings())
      {
        uint64_t v8 = [(UNCSectionInfo *)self subsectionID];
        int64_t v9 = [(UNCSectionInfo *)v5 subsectionID];
        if (BSEqualStrings()
          && (int64_t v10 = [(UNCSectionInfo *)self sectionType],
              v10 == [(UNCSectionInfo *)v5 sectionType])
          && (BOOL v11 = [(UNCSectionInfo *)self isAppClip], v11 == [(UNCSectionInfo *)v5 isAppClip])
          && (BOOL v12 = [(UNCSectionInfo *)self isModificationAllowed],
              v12 == [(UNCSectionInfo *)v5 isModificationAllowed])
          && (BOOL v13 = [(UNCSectionInfo *)self isRestricted],
              v13 == [(UNCSectionInfo *)v5 isRestricted])
          && (int64_t v14 = [(UNCSectionInfo *)self sectionCategory],
              v14 == [(UNCSectionInfo *)v5 sectionCategory])
          && (BOOL v15 = [(UNCSectionInfo *)self suppressFromSettings],
              v15 == [(UNCSectionInfo *)v5 suppressFromSettings]))
        {
          uint64_t v18 = [(UNCSectionInfo *)self sectionInfoSettings];
          uint64_t v19 = [(UNCSectionInfo *)v5 sectionInfoSettings];
          if (BSEqualObjects())
          {
            uint64_t v20 = [(UNCSectionInfo *)self managedSectionInfoSettings];
            v58 = [(UNCSectionInfo *)v5 managedSectionInfoSettings];
            if (BSEqualObjects())
            {
              v57 = v20;
              unint64_t v21 = [(UNCSectionInfo *)self suppressedSettings];
              if (v21 == [(UNCSectionInfo *)v5 suppressedSettings])
              {
                uint64_t v22 = [(UNCSectionInfo *)self subsections];
                v55 = [(UNCSectionInfo *)v5 subsections];
                v56 = (void *)v22;
                if (BSEqualObjects())
                {
                  v54 = [(UNCSectionInfo *)self parentSection];
                  uint64_t v23 = [v54 sectionID];
                  v52 = [(UNCSectionInfo *)v5 parentSection];
                  [v52 sectionID];
                  v51 = v53 = (void *)v23;
                  if (BSEqualStrings()
                    && (int64_t v24 = [(UNCSectionInfo *)self subsectionPriority],
                        v24 == [(UNCSectionInfo *)v5 subsectionPriority])
                    && (unint64_t v25 = [(UNCSectionInfo *)self version], v25 == [(UNCSectionInfo *)v5 version]))
                  {
                    uint64_t v26 = [(UNCSectionInfo *)self appName];
                    [(UNCSectionInfo *)v5 appName];
                    v50 = v49 = (void *)v26;
                    if (BSEqualStrings())
                    {
                      uint64_t v27 = [(UNCSectionInfo *)self displayName];
                      v47 = [(UNCSectionInfo *)v5 displayName];
                      v48 = (void *)v27;
                      if (BSEqualStrings())
                      {
                        uint64_t v28 = [(UNCSectionInfo *)self icon];
                        v45 = [(UNCSectionInfo *)v5 icon];
                        v46 = (void *)v28;
                        if (BSEqualObjects())
                        {
                          uint64_t v29 = [(UNCSectionInfo *)self factorySectionID];
                          uint64_t v43 = [(UNCSectionInfo *)v5 factorySectionID];
                          v44 = (void *)v29;
                          if (BSEqualStrings())
                          {
                            uint64_t v30 = [(UNCSectionInfo *)self dataProviderIDs];
                            long long v41 = [(UNCSectionInfo *)v5 dataProviderIDs];
                            v42 = (void *)v30;
                            if (BSEqualObjects())
                            {
                              uint64_t v31 = [(UNCSectionInfo *)self customSettingsBundle];
                              long long v39 = [(UNCSectionInfo *)v5 customSettingsBundle];
                              long long v40 = (void *)v31;
                              if (BSEqualStrings())
                              {
                                uint64_t v32 = [(UNCSectionInfo *)self customSettingsDetailControllerClass];
                                objc_super v37 = [(UNCSectionInfo *)v5 customSettingsDetailControllerClass];
                                long long v38 = (void *)v32;
                                if (BSEqualStrings())
                                {
                                  uint64_t v33 = [(UNCSectionInfo *)self pathToWeeAppPluginBundle];
                                  [(UNCSectionInfo *)v5 pathToWeeAppPluginBundle];
                                  v34 = char v36 = (void *)v33;
                                  if (BSEqualStrings())
                                  {
                                    BOOL v35 = [(UNCSectionInfo *)self hideWeeApp];
                                    BOOL v16 = v35 ^ [(UNCSectionInfo *)v5 hideWeeApp] ^ 1;
                                  }
                                  else
                                  {
                                    LOBYTE(v16) = 0;
                                  }
                                }
                                else
                                {
                                  LOBYTE(v16) = 0;
                                }
                              }
                              else
                              {
                                LOBYTE(v16) = 0;
                              }
                            }
                            else
                            {
                              LOBYTE(v16) = 0;
                            }
                          }
                          else
                          {
                            LOBYTE(v16) = 0;
                          }
                        }
                        else
                        {
                          LOBYTE(v16) = 0;
                        }
                      }
                      else
                      {
                        LOBYTE(v16) = 0;
                      }
                    }
                    else
                    {
                      LOBYTE(v16) = 0;
                    }
                  }
                  else
                  {
                    LOBYTE(v16) = 0;
                  }
                }
                else
                {
                  LOBYTE(v16) = 0;
                }
              }
              else
              {
                LOBYTE(v16) = 0;
              }
              uint64_t v20 = v57;
            }
            else
            {
              LOBYTE(v16) = 0;
            }
          }
          else
          {
            LOBYTE(v16) = 0;
          }
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(UNCSectionInfo *)self parentSection];
  [v5 setParentSection:v6];

  int64_t v7 = [(UNCSectionInfo *)self sectionID];
  [v5 setSectionID:v7];

  uint64_t v8 = [(UNCSectionInfo *)self subsectionID];
  [v5 setSubsectionID:v8];

  objc_msgSend(v5, "setSectionType:", -[UNCSectionInfo sectionType](self, "sectionType"));
  objc_msgSend(v5, "setIsAppClip:", -[UNCSectionInfo isAppClip](self, "isAppClip"));
  objc_msgSend(v5, "setIsModificationAllowed:", -[UNCSectionInfo isModificationAllowed](self, "isModificationAllowed"));
  objc_msgSend(v5, "setIsRestricted:", -[UNCSectionInfo isRestricted](self, "isRestricted"));
  objc_msgSend(v5, "setSectionCategory:", -[UNCSectionInfo sectionCategory](self, "sectionCategory"));
  objc_msgSend(v5, "setSuppressFromSettings:", -[UNCSectionInfo suppressFromSettings](self, "suppressFromSettings"));
  id v9 = [(UNCSectionInfoSettings *)self->_sectionInfoSettings copyWithZone:a3];
  [v5 setSectionInfoSettings:v9];

  id v10 = [(UNCSectionInfoSettings *)self->_managedSectionInfoSettings copyWithZone:a3];
  [v5 setManagedSectionInfoSettings:v10];

  BOOL v11 = [(UNCSectionInfo *)self pathToWeeAppPluginBundle];
  [v5 setPathToWeeAppPluginBundle:v11];

  BOOL v12 = [(UNCSectionInfo *)self appName];
  [v5 setAppName:v12];

  BOOL v13 = [(UNCSectionInfo *)self displayName];
  [v5 setDisplayName:v13];

  int64_t v14 = [(UNCSectionInfo *)self icon];
  [v5 setIcon:v14];

  BOOL v15 = [(UNCSectionInfo *)self customSettingsBundle];
  [v5 setCustomSettingsBundle:v15];

  BOOL v16 = [(UNCSectionInfo *)self customSettingsDetailControllerClass];
  [v5 setCustomSettingsDetailControllerClass:v16];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v17 = [(UNCSectionInfo *)self subsections];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * v21) copyWithZone:a3];
        [v5 _addSubsection:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }

  objc_msgSend(v5, "setSubsectionPriority:", -[UNCSectionInfo subsectionPriority](self, "subsectionPriority"));
  objc_msgSend(v5, "setSuppressedSettings:", -[UNCSectionInfo suppressedSettings](self, "suppressedSettings"));
  objc_msgSend(v5, "setHideWeeApp:", -[UNCSectionInfo hideWeeApp](self, "hideWeeApp"));
  uint64_t v23 = [(UNCSectionInfo *)self factorySectionID];
  [v5 setFactorySectionID:v23];

  int64_t v24 = [(UNCSectionInfo *)self dataProviderIDs];
  [v5 setDataProviderIDs:v24];

  objc_msgSend(v5, "setVersion:", -[UNCSectionInfo version](self, "version"));
  objc_msgSend(v5, "setIsRestricted:", -[UNCSectionInfo isRestricted](self, "isRestricted"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionInfo)initWithCoder:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)UNCSectionInfo;
  int64_t v5 = [(UNCSectionInfo *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionID"];
    [(UNCSectionInfo *)v5 setSectionID:v6];

    int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subsectionID"];
    [(UNCSectionInfo *)v5 setSubsectionID:v7];

    -[UNCSectionInfo setSectionType:](v5, "setSectionType:", [v4 decodeIntegerForKey:@"sectionType"]);
    -[UNCSectionInfo setIsAppClip:](v5, "setIsAppClip:", [v4 decodeBoolForKey:@"isAppClip"]);
    -[UNCSectionInfo setIsModificationAllowed:](v5, "setIsModificationAllowed:", [v4 decodeBoolForKey:@"isModificationAllowed"]);
    -[UNCSectionInfo setIsRestricted:](v5, "setIsRestricted:", [v4 decodeBoolForKey:@"isRestricted"]);
    -[UNCSectionInfo setSectionCategory:](v5, "setSectionCategory:", [v4 decodeIntegerForKey:@"sectionCategory"]);
    -[UNCSectionInfo setSuppressFromSettings:](v5, "setSuppressFromSettings:", [v4 decodeBoolForKey:@"suppressFromSettings"]);
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathToWeeAppPluginBundle"];
    [(UNCSectionInfo *)v5 setPathToWeeAppPluginBundle:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appName"];
    [(UNCSectionInfo *)v5 setAppName:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(UNCSectionInfo *)v5 setDisplayName:v10];

    BOOL v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    [(UNCSectionInfo *)v5 setIcon:v11];

    BOOL v12 = (void *)MEMORY[0x263EFFA08];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    BOOL v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    int64_t v14 = [v12 setWithArray:v13];
    BOOL v15 = [v4 decodeObjectOfClasses:v14 forKey:@"subsections"];

    [(UNCSectionInfo *)v5 setSubsections:v15];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v20++), "setParentSection:", v5, (void)v36);
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v18);
    }

    -[UNCSectionInfo setSubsectionPriority:](v5, "setSubsectionPriority:", [v4 decodeIntegerForKey:@"subsectionPriority"]);
    -[UNCSectionInfo setSuppressedSettings:](v5, "setSuppressedSettings:", [v4 decodeInt64ForKey:@"suppressedSettings"]);
    -[UNCSectionInfo setHideWeeApp:](v5, "setHideWeeApp:", [v4 decodeBoolForKey:@"hideWeeApp"]);
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"factorySectionID"];
    [(UNCSectionInfo *)v5 setFactorySectionID:v21];

    uint64_t v22 = (void *)MEMORY[0x263EFFA08];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
    int64_t v24 = [v22 setWithArray:v23];
    unint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"dataProviderIDs"];
    [(UNCSectionInfo *)v5 setDataProviderIDs:v25];

    long long v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customSettingsBundle"];
    [(UNCSectionInfo *)v5 setCustomSettingsBundle:v26];

    long long v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customSettingsDetailControllerClass"];
    [(UNCSectionInfo *)v5 setCustomSettingsDetailControllerClass:v27];

    long long v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    -[UNCSectionInfo setVersion:](v5, "setVersion:", [v28 unsignedIntegerValue]);
    if ([v4 containsValueForKey:@"sectionInfoSettings"])
    {
      uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionInfoSettings"];
      sectionInfoSettings = v5->_sectionInfoSettings;
      v5->_sectionInfoSettings = (UNCSectionInfoSettings *)v29;
    }
    else
    {
      uint64_t v31 = [[UNCSectionInfoSettings alloc] initWithDefaultsForSectionType:[(UNCSectionInfo *)v5 sectionType]];
      uint64_t v32 = v5->_sectionInfoSettings;
      v5->_sectionInfoSettings = v31;

      if ([v4 containsValueForKey:@"allowsNotifications"]) {
        uint64_t v33 = [v4 decodeBoolForKey:@"allowsNotifications"];
      }
      else {
        uint64_t v33 = 1;
      }
      -[UNCSectionInfoSettings setAllowsNotifications:](v5->_sectionInfoSettings, "setAllowsNotifications:", v33, (void)v36);
      -[UNCSectionInfoSettings setShowsInNotificationCenter:](v5->_sectionInfoSettings, "setShowsInNotificationCenter:", [v4 decodeBoolForKey:@"showsInNotificationCenter"]);
      -[UNCSectionInfoSettings setShowsInLockScreen:](v5->_sectionInfoSettings, "setShowsInLockScreen:", [v4 decodeBoolForKey:@"showsInLockScreen"]);
      -[UNCSectionInfoSettings setShowsCustomSettingsLink:](v5->_sectionInfoSettings, "setShowsCustomSettingsLink:", [v4 decodeBoolForKey:@"showsCustomSettingsLink"]);
      -[UNCSectionInfoSettings setAlertType:](v5->_sectionInfoSettings, "setAlertType:", [v4 decodeIntegerForKey:@"alertType"]);
      -[UNCSectionInfoSettings setPushSettings:](v5->_sectionInfoSettings, "setPushSettings:", [v4 decodeInt64ForKey:@"pushSettings"]);
      if ([v4 containsValueForKey:@"showsOnExternalDevices"]) {
        -[UNCSectionInfoSettings setShowsOnExternalDevices:](v5->_sectionInfoSettings, "setShowsOnExternalDevices:", [v4 decodeBoolForKey:@"showsOnExternalDevices"]);
      }
      if ([v4 containsValueForKey:@"showsMessagePreview"]) {
        -[UNCSectionInfoSettings setShowsMessagePreview:](v5->_sectionInfoSettings, "setShowsMessagePreview:", [v4 decodeBoolForKey:@"showsMessagePreview"]);
      }
    }
    if (objc_msgSend(v4, "containsValueForKey:", @"bulletinGroupingSetting", (void)v36)) {
      -[UNCSectionInfo setBulletinGroupingSetting:](v5, "setBulletinGroupingSetting:", [v4 decodeIntegerForKey:@"bulletinGroupingSetting"]);
    }
    if ([v4 containsValueForKey:@"managedSectionInfoSettings"])
    {
      char v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedSectionInfoSettings"];
      [(UNCSectionInfo *)v5 setManagedSectionInfoSettings:v34];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UNCSectionInfo *)self sectionID];
  [v4 encodeObject:v5 forKey:@"sectionID"];

  uint64_t v6 = [(UNCSectionInfo *)self subsectionID];
  [v4 encodeObject:v6 forKey:@"subsectionID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo sectionType](self, "sectionType"), @"sectionType");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo isAppClip](self, "isAppClip"), @"isAppClip");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo isModificationAllowed](self, "isModificationAllowed"), @"isModificationAllowed");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo isRestricted](self, "isRestricted"), @"isRestricted");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo sectionCategory](self, "sectionCategory"), @"sectionCategory");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo suppressFromSettings](self, "suppressFromSettings"), @"suppressFromSettings");
  [v4 encodeObject:self->_sectionInfoSettings forKey:@"sectionInfoSettings"];
  [v4 encodeObject:self->_managedSectionInfoSettings forKey:@"managedSectionInfoSettings"];
  int64_t v7 = [(UNCSectionInfo *)self pathToWeeAppPluginBundle];
  [v4 encodeObject:v7 forKey:@"pathToWeeAppPluginBundle"];

  uint64_t v8 = [(UNCSectionInfo *)self appName];
  [v4 encodeObject:v8 forKey:@"appName"];

  id v9 = [(UNCSectionInfo *)self displayName];
  [v4 encodeObject:v9 forKey:@"displayName"];

  id v10 = [(UNCSectionInfo *)self icon];
  [v4 encodeObject:v10 forKey:@"icon"];

  BOOL v11 = [(UNCSectionInfo *)self subsections];
  [v4 encodeObject:v11 forKey:@"subsections"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo subsectionPriority](self, "subsectionPriority"), @"subsectionPriority");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNCSectionInfo suppressedSettings](self, "suppressedSettings"), @"suppressedSettings");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNCSectionInfo hideWeeApp](self, "hideWeeApp"), @"hideWeeApp");
  BOOL v12 = [(UNCSectionInfo *)self factorySectionID];
  [v4 encodeObject:v12 forKey:@"factorySectionID"];

  BOOL v13 = [(UNCSectionInfo *)self dataProviderIDs];
  [v4 encodeObject:v13 forKey:@"dataProviderIDs"];

  int64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNCSectionInfo version](self, "version"));
  [v4 encodeObject:v14 forKey:@"version"];

  BOOL v15 = [(UNCSectionInfo *)self customSettingsBundle];
  [v4 encodeObject:v15 forKey:@"customSettingsBundle"];

  id v16 = [(UNCSectionInfo *)self customSettingsDetailControllerClass];
  [v4 encodeObject:v16 forKey:@"customSettingsDetailControllerClass"];
}

- (id)effectiveSectionInfoWithDefaultContentPreviewSetting:(int64_t)a3 globalAnnounceSetting:(int64_t)a4 globalScheduledDeliverySetting:(int64_t)a5 hasPairedVehiclesForCarPlay:(BOOL)a6 hasDestinationForRemoteNotifications:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v11 = self;
  uint64_t v73 = *MEMORY[0x263EF8340];
  BOOL v12 = [(UNCSectionInfo *)self parentSection];
  if (!v12)
  {
    id v16 = [(UNCSectionInfo *)v11 subsections];
    uint64_t v17 = [v16 count];

    if (!v17) {
      goto LABEL_46;
    }
    v47 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v50 = v11;
    uint64_t v19 = [(UNCSectionInfo *)v11 subsections];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v68 != v22) {
            objc_enumerationMutation(v19);
          }
          int64_t v24 = [*(id *)(*((void *)&v67 + 1) + 8 * i) effectiveSectionInfoWithDefaultContentPreviewSetting:a3 globalAnnounceSetting:a4 globalScheduledDeliverySetting:a5 hasPairedVehiclesForCarPlay:v8 hasDestinationForRemoteNotifications:v7];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v21);
    }

    int v25 = [(UNCSectionInfo *)v47 suppressedSettings];
    int v26 = v25;
    if ((v25 & 2) != 0)
    {
      uint64_t v61 = 0;
      if ((v25 & 4) != 0) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v61 = [(UNCSectionInfo *)v47 lockScreenSetting];
      if ((v26 & 4) != 0)
      {
LABEL_35:
        int v52 = 0;
        if ((v26 & 1) == 0) {
          goto LABEL_36;
        }
        goto LABEL_63;
      }
    }
    int v52 = [(UNCSectionInfo *)v47 showsOnExternalDevices];
    if ((v26 & 1) == 0)
    {
LABEL_36:
      uint64_t v60 = [(UNCSectionInfo *)v47 notificationCenterSetting];
      if ((v26 & 0x40) == 0) {
        goto LABEL_37;
      }
      goto LABEL_64;
    }
LABEL_63:
    uint64_t v60 = 0;
    if ((v26 & 0x40) == 0)
    {
LABEL_37:
      uint64_t v59 = [(UNCSectionInfo *)v47 contentPreviewSetting];
      if ((v26 & 0x2000) != 0) {
        goto LABEL_38;
      }
      goto LABEL_65;
    }
LABEL_64:
    uint64_t v59 = 0;
    if ((v26 & 0x2000) != 0)
    {
LABEL_38:
      uint64_t v27 = 0;
      if ((v26 & 0x4000) != 0) {
        goto LABEL_39;
      }
      goto LABEL_66;
    }
LABEL_65:
    uint64_t v27 = [(UNCSectionInfo *)v47 pushSettings] & 9;
    if ((v26 & 0x4000) != 0)
    {
LABEL_39:
      uint64_t v28 = 0;
      if ((v26 & 0x20) != 0) {
        goto LABEL_40;
      }
      goto LABEL_67;
    }
LABEL_66:
    uint64_t v28 = [(UNCSectionInfo *)v47 pushSettings] & 0x12;
    if ((v26 & 0x20) != 0)
    {
LABEL_40:
      unint64_t v51 = 0;
      uint64_t v29 = v28 | v27;
      if ((v26 & 0x80) == 0) {
        goto LABEL_41;
      }
      goto LABEL_68;
    }
LABEL_67:
    uint64_t v29 = v27 | v28 | [(UNCSectionInfo *)v47 pushSettings] & 0x24;
    unint64_t v51 = [(UNCSectionInfo *)v47 alertType];
    if ((v26 & 0x80) == 0)
    {
LABEL_41:
      uint64_t v58 = [(UNCSectionInfo *)v47 carPlaySetting];
      if ((v26 & 0x10000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_69;
    }
LABEL_68:
    uint64_t v58 = 0;
    if ((v26 & 0x10000) == 0)
    {
LABEL_42:
      uint64_t v57 = [(UNCSectionInfo *)v47 remoteNotificationsSetting];
      if ((v26 & 0x100) == 0) {
        goto LABEL_43;
      }
      goto LABEL_70;
    }
LABEL_69:
    uint64_t v57 = 0;
    if ((v26 & 0x100) == 0)
    {
LABEL_43:
      uint64_t v56 = [(UNCSectionInfo *)v47 criticalAlertSetting];
      if ((v26 & 0x400) == 0) {
        goto LABEL_44;
      }
      goto LABEL_71;
    }
LABEL_70:
    uint64_t v56 = 0;
    if ((v26 & 0x400) == 0)
    {
LABEL_44:
      uint64_t v30 = [(UNCSectionInfo *)v47 announceSetting];
      if ((v26 & 0x800) == 0)
      {
LABEL_45:
        uint64_t v55 = [(UNCSectionInfo *)v47 timeSensitiveSetting];
        goto LABEL_73;
      }
LABEL_72:
      uint64_t v55 = 0;
LABEL_73:
      BOOL v48 = v7;
      if ((v26 & 0x1000) != 0) {
        uint64_t v54 = 0;
      }
      else {
        uint64_t v54 = [(UNCSectionInfo *)v47 scheduledDeliverySetting];
      }
      if ((v26 & 0x8000) != 0) {
        uint64_t v31 = 0;
      }
      else {
        uint64_t v31 = [(UNCSectionInfo *)v47 directMessagesSetting];
      }
      int64_t v49 = a3;
      [(UNCSectionInfo *)v47 setSubsections:0];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id obj = v18;
      uint64_t v32 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (!v32)
      {
LABEL_128:

        BOOL v13 = v47;
        [(UNCSectionInfo *)v47 setLockScreenSetting:v61];
        [(UNCSectionInfo *)v47 setShowsOnExternalDevices:v52 & 1];
        [(UNCSectionInfo *)v47 setNotificationCenterSetting:v60];
        [(UNCSectionInfo *)v47 setPushSettings:v29];
        [(UNCSectionInfo *)v47 setAlertType:v51];
        [(UNCSectionInfo *)v47 setContentPreviewSetting:v59];
        [(UNCSectionInfo *)v47 setAnnounceSetting:v30];
        [(UNCSectionInfo *)v47 setCarPlaySetting:v58];
        [(UNCSectionInfo *)v47 setRemoteNotificationsSetting:v57];
        [(UNCSectionInfo *)v47 setCriticalAlertSetting:v56];
        [(UNCSectionInfo *)v47 setTimeSensitiveSetting:v55];
        [(UNCSectionInfo *)v47 setScheduledDeliverySetting:v54];
        [(UNCSectionInfo *)v47 setDirectMessagesSetting:v31];

        BOOL v11 = v50;
        BOOL v12 = 0;
        a3 = v49;
        LOBYTE(v7) = v48;
        goto LABEL_129;
      }
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v64;
LABEL_81:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v64 != v34) {
          objc_enumerationMutation(obj);
        }
        long long v36 = *(void **)(*((void *)&v63 + 1) + 8 * v35);
        [(UNCSectionInfo *)v47 _addSubsection:v36];
        if ([v36 sectionType] != 2) {
          goto LABEL_126;
        }
        if ((v26 & 0x2000) != 0)
        {
          v29 |= [v36 pushSettings] & 9;
          if ((v26 & 0x4000) == 0)
          {
LABEL_87:
            if ((v26 & 0x20) != 0) {
              goto LABEL_91;
            }
            goto LABEL_93;
          }
        }
        else if ((v26 & 0x4000) == 0)
        {
          goto LABEL_87;
        }
        v29 |= [v36 pushSettings] & 0x12;
        if ((v26 & 0x20) != 0)
        {
LABEL_91:
          v29 |= [v36 pushSettings] & 0x24;
          if ([v36 alertType] > v51) {
            unint64_t v51 = [v36 alertType];
          }
        }
LABEL_93:
        if ((v26 & 2) != 0 && v61 != 2) {
          uint64_t v61 = [v36 lockScreenSetting];
        }
        if ((v26 & 4) != 0) {
          v52 |= [v36 showsOnExternalDevices];
        }
        if ((v26 & 1) != 0 && v60 != 2) {
          uint64_t v60 = [v36 notificationCenterSetting];
        }
        if ((v26 & 0x40) != 0 && v59 != 1) {
          uint64_t v59 = [v36 contentPreviewSetting];
        }
        if ((v26 & 0x80) != 0 && v58 != 2) {
          uint64_t v58 = [v36 carPlaySetting];
        }
        if ((v26 & 0x10000) != 0 && v57 != 2) {
          uint64_t v57 = [v36 remoteNotificationsSetting];
        }
        if ((v26 & 0x400) != 0 && v30 != 2 && v30 != 3) {
          uint64_t v30 = [v36 announceSetting];
        }
        if ((v26 & 0x100) != 0 && v56 != 2) {
          uint64_t v56 = [v36 criticalAlertSetting];
        }
        if ((v26 & 0x800) != 0 && v55 != 2) {
          uint64_t v55 = [v36 timeSensitiveSetting];
        }
        if ((v26 & 0x1000) != 0 && v54 != 2) {
          uint64_t v54 = [v36 scheduledDeliverySetting];
        }
        if ((v26 & 0x8000) != 0 && v31 != 2) {
          uint64_t v31 = [v36 directMessagesSetting];
        }
LABEL_126:
        if (v33 == ++v35)
        {
          uint64_t v33 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
          if (!v33) {
            goto LABEL_128;
          }
          goto LABEL_81;
        }
      }
    }
LABEL_71:
    uint64_t v30 = 0;
    if ((v26 & 0x800) == 0) {
      goto LABEL_45;
    }
    goto LABEL_72;
  }
  if ([(UNCSectionInfo *)v11 sectionType] != 2)
  {
LABEL_46:
    BOOL v13 = 0;
    goto LABEL_129;
  }
  BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
  if (([v12 allowsNotifications] & 1) == 0) {
    -[UNCSectionInfo setAuthorizationStatus:](v13, "setAuthorizationStatus:", [v12 authorizationStatus]);
  }
  if (([v12 suppressedSettings] & 0x2000) == 0
    && ([v12 pushSettings] & 1) != 0
    && ([v12 pushSettings] & 8) == 0
    && ([(UNCSectionInfo *)v13 pushSettings] & 1) != 0)
  {
    [(UNCSectionInfo *)v13 setPushSettings:[(UNCSectionInfo *)v13 pushSettings] & 0xFFFFFFFFFFFFFFF7];
  }
  int v14 = [(UNCSectionInfo *)v13 suppressedSettings];
  int v15 = v14;
  if (v14)
  {
    -[UNCSectionInfo setNotificationCenterSetting:](v13, "setNotificationCenterSetting:", [v12 notificationCenterSetting]);
    if ((v15 & 2) == 0)
    {
LABEL_12:
      if ((v15 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_49;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_12;
  }
  -[UNCSectionInfo setLockScreenSetting:](v13, "setLockScreenSetting:", [v12 lockScreenSetting]);
  if ((v15 & 4) == 0)
  {
LABEL_13:
    if ((v15 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  -[UNCSectionInfo setShowsOnExternalDevices:](v13, "setShowsOnExternalDevices:", [v12 showsOnExternalDevices]);
  if ((v15 & 0x2000) == 0)
  {
LABEL_14:
    if ((v15 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", [v12 pushSettings] & 9 | -[UNCSectionInfo pushSettings](v13, "pushSettings") & 0xFFFFFFFFFFFFFFF6);
  if ((v15 & 0x4000) == 0)
  {
LABEL_15:
    if ((v15 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", [v12 pushSettings] & 0x12 | -[UNCSectionInfo pushSettings](v13, "pushSettings") & 0xFFFFFFFFFFFFFFEDLL);
  if ((v15 & 0x20) == 0)
  {
LABEL_16:
    if ((v15 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_53;
  }
LABEL_52:
  -[UNCSectionInfo setPushSettings:](v13, "setPushSettings:", [v12 pushSettings] & 0x24 | -[UNCSectionInfo pushSettings](v13, "pushSettings") & 0xFFFFFFFFFFFFFFDBLL);
  -[UNCSectionInfo setAlertType:](v13, "setAlertType:", [v12 alertType]);
  if ((v15 & 0x40) == 0)
  {
LABEL_17:
    if ((v15 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_54;
  }
LABEL_53:
  -[UNCSectionInfo setContentPreviewSetting:](v13, "setContentPreviewSetting:", [v12 contentPreviewSetting]);
  if ((v15 & 0x400) == 0)
  {
LABEL_18:
    if ((v15 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_55;
  }
LABEL_54:
  -[UNCSectionInfo setAnnounceSetting:](v13, "setAnnounceSetting:", [v12 announceSetting]);
  if ((v15 & 0x80) == 0)
  {
LABEL_19:
    if ((v15 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
LABEL_55:
  -[UNCSectionInfo setCarPlaySetting:](v13, "setCarPlaySetting:", [v12 carPlaySetting]);
  if ((v15 & 0x10000) == 0)
  {
LABEL_20:
    if ((v15 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_57;
  }
LABEL_56:
  -[UNCSectionInfo setRemoteNotificationsSetting:](v13, "setRemoteNotificationsSetting:", [v12 remoteNotificationsSetting]);
  if ((v15 & 0x100) == 0)
  {
LABEL_21:
    if ((v15 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_58;
  }
LABEL_57:
  -[UNCSectionInfo setCriticalAlertSetting:](v13, "setCriticalAlertSetting:", [v12 criticalAlertSetting]);
  if ((v15 & 0x800) == 0)
  {
LABEL_22:
    if ((v15 & 0x1000) == 0) {
      goto LABEL_23;
    }
LABEL_59:
    -[UNCSectionInfo setScheduledDeliverySetting:](v13, "setScheduledDeliverySetting:", [v12 scheduledDeliverySetting]);
    if ((v15 & 0x8000) == 0) {
      goto LABEL_129;
    }
    goto LABEL_60;
  }
LABEL_58:
  -[UNCSectionInfo setTimeSensitiveSetting:](v13, "setTimeSensitiveSetting:", [v12 timeSensitiveSetting]);
  if ((v15 & 0x1000) != 0) {
    goto LABEL_59;
  }
LABEL_23:
  if ((v15 & 0x8000) != 0) {
LABEL_60:
  }
    -[UNCSectionInfo setDirectMessagesSetting:](v13, "setDirectMessagesSetting:", [v12 directMessagesSetting]);
LABEL_129:
  if ([(UNCSectionInfo *)v11 isRestricted])
  {
    if (!v13) {
      BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    }
    [(UNCSectionInfo *)v13 setAuthorizationStatus:1];
  }
  if (![(UNCSectionInfo *)v11 allowsNotifications])
  {
    if (!v13) {
      BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    }
LABEL_139:
    if (![v12 allowsNotifications]
      || ([v12 pushSettings] & 1) == 0
      || ([v12 suppressedSettings] & 0x2000) != 0
      || ([(UNCSectionInfo *)v11 suppressedSettings] & 0x2000) != 0)
    {
      uint64_t v37 = -57;
    }
    else
    {
      uint64_t v37 = -49;
    }
    [(UNCSectionInfo *)v13 setPushSettings:[(UNCSectionInfo *)v11 pushSettings] & v37];
    [(UNCSectionInfo *)v13 setAlertType:0];
    [(UNCSectionInfo *)v13 setNotificationCenterSetting:[(UNCSectionInfo *)v11 disabledSettingForSetting:[(UNCSectionInfo *)v11 notificationCenterSetting]]];
    [(UNCSectionInfo *)v13 setLockScreenSetting:[(UNCSectionInfo *)v11 disabledSettingForSetting:[(UNCSectionInfo *)v11 lockScreenSetting]]];
    [(UNCSectionInfo *)v13 setShowsOnExternalDevices:0];
    [(UNCSectionInfo *)v13 setShowsCustomSettingsLink:0];
    [(UNCSectionInfo *)v13 setContentPreviewSetting:0];
    [(UNCSectionInfo *)v13 setAnnounceSetting:1];
    [(UNCSectionInfo *)v13 setCarPlaySetting:[(UNCSectionInfo *)v11 disabledSettingForSetting:[(UNCSectionInfo *)v11 carPlaySetting]]];
    [(UNCSectionInfo *)v13 setRemoteNotificationsSetting:[(UNCSectionInfo *)v11 disabledSettingForSetting:[(UNCSectionInfo *)v11 remoteNotificationsSetting]]];
    [(UNCSectionInfo *)v13 setDirectMessagesSetting:[(UNCSectionInfo *)v11 disabledSettingForSetting:[(UNCSectionInfo *)v11 directMessagesSetting]]];
    [(UNCSectionInfo *)v13 setScheduledDeliverySetting:[(UNCSectionInfo *)v11 disabledSettingForSetting:[(UNCSectionInfo *)v11 scheduledDeliverySetting]]];
    [(UNCSectionInfo *)v13 setTimeSensitiveSetting:[(UNCSectionInfo *)v11 disabledSettingForSetting:[(UNCSectionInfo *)v11 timeSensitiveSetting]]];
LABEL_146:
    if (a4 != -1)
    {
      if ((unint64_t)a4 >= 2) {
        goto LABEL_159;
      }
      if (v13) {
        goto LABEL_155;
      }
      goto LABEL_154;
    }
    if (v13)
    {
LABEL_157:
      long long v38 = v13;
      uint64_t v39 = 0;
      goto LABEL_158;
    }
LABEL_156:
    BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    goto LABEL_157;
  }
  if (v13)
  {
    if ([(UNCSectionInfo *)v13 allowsNotifications]) {
      goto LABEL_146;
    }
    goto LABEL_139;
  }
  if (a4 == -1) {
    goto LABEL_156;
  }
  if ((unint64_t)a4 < 2)
  {
LABEL_154:
    BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
LABEL_155:
    long long v38 = v13;
    uint64_t v39 = 1;
LABEL_158:
    [(UNCSectionInfo *)v38 setAnnounceSetting:v39];
LABEL_159:
    if ((unint64_t)(a5 + 1) < 3)
    {
      if (v13) {
        goto LABEL_162;
      }
      goto LABEL_161;
    }
    if (v13)
    {
      if (!v8) {
        goto LABEL_170;
      }
      goto LABEL_166;
    }
LABEL_169:
    BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    if (!v8) {
      goto LABEL_170;
    }
LABEL_166:
    if (v7) {
      goto LABEL_176;
    }
    goto LABEL_173;
  }
  if ((unint64_t)(a5 + 1) >= 3) {
    goto LABEL_169;
  }
LABEL_161:
  BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
LABEL_162:
  [(UNCSectionInfo *)v13 setScheduledDeliverySetting:1];
  if (v8) {
    goto LABEL_166;
  }
LABEL_170:
  if (!v13) {
    BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
  }
  [(UNCSectionInfo *)v13 setCarPlaySetting:0];
  if (!v7)
  {
LABEL_173:
    if (!v13) {
      BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    }
    [(UNCSectionInfo *)v13 setRemoteNotificationsSetting:0];
  }
LABEL_176:
  if (v13) {
    objc_super v40 = v13;
  }
  else {
    objc_super v40 = v11;
  }
  long long v41 = v40;
  if (![(UNCSectionInfo *)v41 contentPreviewSetting])
  {
    if (!v13) {
      BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    }
    [(UNCSectionInfo *)v13 setContentPreviewSetting:a3];
  }
  if ([(UNCSectionInfo *)v41 authorizationStatus] == 4)
  {
    if (!v13) {
      BOOL v13 = [(UNCSectionInfo *)v11 copyFromManagedSettings];
    }
    v42 = [(UNCSectionInfo *)v11 sectionInfoSettings];
    if ([v42 isAuthorizedTemporarily]) {
      uint64_t v43 = 2;
    }
    else {
      uint64_t v43 = 0;
    }

    [(UNCSectionInfo *)v13 setAuthorizationStatus:v43];
  }
  if (v13) {
    v44 = v13;
  }
  else {
    v44 = v11;
  }
  v45 = v44;

  return v45;
}

- (int64_t)disabledSettingForSetting:(int64_t)a3
{
  return a3 != 0;
}

- (id)effectiveSectionInfoWithFactoryInfo:(id)a3 defaultContentPreviewSetting:(int64_t)a4 globalAnnounceSetting:(int64_t)a5 globalScheduledDeliverySetting:(int64_t)a6 hasPairedVehiclesForCarPlay:(BOOL)a7 hasDestinationForRemoteNotifications:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  if (!v14) {
    goto LABEL_9;
  }
  int v15 = [(UNCSectionInfo *)self factorySectionID];
  id v16 = [v14 sectionID];
  if (([v15 isEqualToString:v16] & 1) == 0)
  {

    goto LABEL_9;
  }
  [v14 dataProviderIDs];
  int64_t v25 = a6;
  uint64_t v17 = v26 = a5;
  [(UNCSectionInfo *)self sectionID];
  v19 = BOOL v18 = v8;
  char v20 = [v17 containsObject:v19];

  if ((v20 & 1) == 0)
  {
LABEL_9:
    uint64_t v23 = self;
    goto LABEL_10;
  }
  uint64_t v21 = (void *)[(UNCSectionInfo *)self copy];
  if ([v21 suppressFromSettings] && (objc_msgSend(v14, "suppressFromSettings") & 1) == 0)
  {
    objc_msgSend(v21, "setNotificationCenterSetting:", objc_msgSend(v14, "notificationCenterSetting"));
    objc_msgSend(v21, "setLockScreenSetting:", objc_msgSend(v14, "lockScreenSetting"));
    if ([v21 showsOnExternalDevices]) {
      uint64_t v22 = [v14 showsOnExternalDevices];
    }
    else {
      uint64_t v22 = 0;
    }
    [v21 setShowsOnExternalDevices:v22];
    objc_msgSend(v21, "setContentPreviewSetting:", objc_msgSend(v14, "contentPreviewSetting"));
    objc_msgSend(v21, "setPushSettings:", objc_msgSend(v14, "pushSettings"));
    objc_msgSend(v21, "setAlertType:", objc_msgSend(v14, "alertType"));
    objc_msgSend(v21, "setAuthorizationStatus:", objc_msgSend(v14, "authorizationStatus"));
    objc_msgSend(v21, "setCarPlaySetting:", objc_msgSend(v14, "carPlaySetting"));
    objc_msgSend(v21, "setRemoteNotificationsSetting:", objc_msgSend(v14, "remoteNotificationsSetting"));
    objc_msgSend(v21, "setAnnounceSetting:", objc_msgSend(v14, "announceSetting"));
    objc_msgSend(v21, "setCriticalAlertSetting:", objc_msgSend(v14, "criticalAlertSetting"));
    objc_msgSend(v21, "setTimeSensitiveSetting:", objc_msgSend(v14, "timeSensitiveSetting"));
    objc_msgSend(v21, "setScheduledDeliverySetting:", objc_msgSend(v14, "scheduledDeliverySetting"));
    objc_msgSend(v21, "setDirectMessagesSetting:", objc_msgSend(v14, "directMessagesSetting"));
  }
  uint64_t v23 = [v21 effectiveSectionInfoWithDefaultContentPreviewSetting:a4 globalAnnounceSetting:v26 globalScheduledDeliverySetting:v25 hasPairedVehiclesForCarPlay:v9 hasDestinationForRemoteNotifications:v18];

LABEL_10:

  return v23;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSString)subsectionID
{
  return self->_subsectionID;
}

- (void)setSubsectionID:(id)a3
{
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)isModificationAllowed
{
  return self->_isModificationAllowed;
}

- (void)setIsModificationAllowed:(BOOL)a3
{
  self->_isModificationAllowed = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (int64_t)sectionCategory
{
  return self->_sectionCategory;
}

- (void)setSectionCategory:(int64_t)a3
{
  self->_sectionCategory = a3;
}

- (BOOL)suppressFromSettings
{
  return self->_suppressFromSettings;
}

- (void)setSuppressFromSettings:(BOOL)a3
{
  self->_suppressFromSettings = a3;
}

- (UNCSectionInfoSettings)sectionInfoSettings
{
  return self->_sectionInfoSettings;
}

- (void)setSectionInfoSettings:(id)a3
{
}

- (NSString)pathToWeeAppPluginBundle
{
  return self->_pathToWeeAppPluginBundle;
}

- (void)setPathToWeeAppPluginBundle:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (UNCSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSArray)subsections
{
  return self->_subsections;
}

- (void)setSubsections:(id)a3
{
}

- (UNCSectionInfo)parentSection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSection);

  return (UNCSectionInfo *)WeakRetained;
}

- (int64_t)subsectionPriority
{
  return self->_subsectionPriority;
}

- (void)setSubsectionPriority:(int64_t)a3
{
  self->_subsectionPriority = a3;
}

- (unint64_t)suppressedSettings
{
  return self->_suppressedSettings;
}

- (void)setSuppressedSettings:(unint64_t)a3
{
  self->_suppressedSettings = a3;
}

- (BOOL)hideWeeApp
{
  return self->_hideWeeApp;
}

- (void)setHideWeeApp:(BOOL)a3
{
  self->_hideWeeApp = a3;
}

- (NSString)factorySectionID
{
  return self->_factorySectionID;
}

- (void)setFactorySectionID:(id)a3
{
}

- (NSArray)dataProviderIDs
{
  return self->_dataProviderIDs;
}

- (void)setDataProviderIDs:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)customSettingsBundle
{
  return self->_customSettingsBundle;
}

- (void)setCustomSettingsBundle:(id)a3
{
}

- (NSString)customSettingsDetailControllerClass
{
  return self->_customSettingsDetailControllerClass;
}

- (void)setCustomSettingsDetailControllerClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSettingsDetailControllerClass, 0);
  objc_storeStrong((id *)&self->_customSettingsBundle, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_dataProviderIDs, 0);
  objc_storeStrong((id *)&self->_factorySectionID, 0);
  objc_destroyWeak((id *)&self->_parentSection);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pathToWeeAppPluginBundle, 0);
  objc_storeStrong((id *)&self->_managedSectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_sectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_subsectionID, 0);

  objc_storeStrong((id *)&self->_sectionID, 0);
}

+ (id)defaultSectionInfoForSection:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 defaultSectionInfo], (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = +[UNCSectionInfo defaultSectionInfoForType:0];
  }
  int64_t v5 = [v3 sectionIdentifier];
  [v4 setSectionID:v5];
  id v12 = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:&v12];
  id v7 = v12;
  if (v6)
  {
    BOOL v8 = [v6 localizedName];
    [v4 setAppName:v8];

    BOOL v9 = [v6 applicationState];
    objc_msgSend(v4, "setIsRestricted:", objc_msgSend(v9, "isRestricted"));
  }
  else
  {
    id v10 = (void *)*MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      +[UNCSectionInfo(DataProviders) defaultSectionInfoForSection:v7];
    }
  }

  return v4;
}

- (void)updateWithDefaultSectionInfo:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UNCSectionInfo *)self alertType];
  unint64_t v6 = [(UNCSectionInfo *)self pushSettings];
  char v7 = [v4 pushSettings];
  char v8 = v7;
  if ((v6 & 4) == 0 && (v7 & 4) != 0)
  {
    uint64_t v5 = [v4 alertType];
    v6 |= 0x24uLL;
  }
  if (v6 & 1 | ((v8 & 1) == 0)) {
    unint64_t v9 = v6;
  }
  else {
    unint64_t v9 = v6 | 9;
  }
  uint64_t v10 = (v9 >> 1) & 1;
  if ((v8 & 2) == 0) {
    LODWORD(v10) = 1;
  }
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 | 0x12;
  }
  unsigned int v12 = [(UNCSectionInfo *)self suppressedSettings];
  int v13 = [v4 suppressedSettings];
  int v14 = v13;
  if ((v12 & 0x2000) == 0 || (v13 & 0x2000) != 0)
  {
LABEL_26:
    if ((v12 & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if (v8)
  {
    v11 |= 9uLL;
    goto LABEL_26;
  }
  int v15 = [(UNCSectionInfo *)self subsections];
  uint64_t v16 = [v15 count];

  if (!v16) {
    goto LABEL_26;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v17 = [(UNCSectionInfo *)self subsections];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v57 != v20) {
          objc_enumerationMutation(v17);
        }
        if (([*(id *)(*((void *)&v56 + 1) + 8 * i) pushSettings] & 8) != 0)
        {
          v11 |= 9uLL;
          goto LABEL_81;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_81:

  if ((v12 & 0x20) != 0)
  {
LABEL_27:
    if ((v14 & 0x20) == 0)
    {
      uint64_t v5 = [v4 alertType];
      v11 |= 0x24uLL;
    }
  }
LABEL_29:
  [(UNCSectionInfo *)self setAlertType:v5];
  [(UNCSectionInfo *)self setPushSettings:v11];
  int64_t v22 = [(UNCSectionInfo *)self lockScreenSetting];
  uint64_t v23 = [v4 lockScreenSetting];
  if (v22) {
    int v25 = ((v14 & 2) == 0) & (v12 >> 1);
  }
  else {
    int v25 = 1;
  }
  if (v25 == 1)
  {
    uint64_t v24 = v23;
    if (v23) {
      [(UNCSectionInfo *)self setLockScreenSetting:v23];
    }
  }
  int64_t v26 = [(UNCSectionInfo *)self notificationCenterSetting];
  uint64_t v27 = [v4 notificationCenterSetting];
  if (v26) {
    int v29 = v12 & ((v14 & 1) == 0);
  }
  else {
    int v29 = 1;
  }
  if (v29 == 1)
  {
    uint64_t v28 = v27;
    if (v27) {
      [(UNCSectionInfo *)self setNotificationCenterSetting:v27];
    }
  }
  int64_t v30 = [(UNCSectionInfo *)self carPlaySetting];
  uint64_t v31 = [v4 carPlaySetting];
  if (v30) {
    int v33 = ((v14 & 0x80) == 0) & (v12 >> 7);
  }
  else {
    int v33 = 1;
  }
  if (v33 == 1)
  {
    uint64_t v32 = v31;
    if (v31) {
      [(UNCSectionInfo *)self setCarPlaySetting:v31];
    }
  }
  int64_t v34 = [(UNCSectionInfo *)self remoteNotificationsSetting];
  uint64_t v35 = [v4 remoteNotificationsSetting];
  if (v34) {
    int v37 = ((*(void *)&v14 & 0x10000) == 0) & HIWORD(v12);
  }
  else {
    int v37 = 1;
  }
  if (v37 == 1)
  {
    uint64_t v36 = v35;
    if (v35) {
      [(UNCSectionInfo *)self setRemoteNotificationsSetting:v35];
    }
  }
  int64_t v38 = [(UNCSectionInfo *)self announceSetting];
  uint64_t v39 = [v4 announceSetting];
  if (!v38)
  {
    uint64_t v40 = v39;
    if (v39) {
      [(UNCSectionInfo *)self setAnnounceSetting:v39];
    }
  }
  int64_t v41 = [(UNCSectionInfo *)self criticalAlertSetting];
  uint64_t v42 = [v4 criticalAlertSetting];
  if (!v41)
  {
    uint64_t v43 = v42;
    if (v42) {
      [(UNCSectionInfo *)self setCriticalAlertSetting:v42];
    }
  }
  int64_t v44 = [(UNCSectionInfo *)self timeSensitiveSetting];
  uint64_t v45 = [v4 timeSensitiveSetting];
  if (!v44)
  {
    uint64_t v46 = v45;
    if (v45) {
      [(UNCSectionInfo *)self setTimeSensitiveSetting:v45];
    }
  }
  int64_t v47 = [(UNCSectionInfo *)self directMessagesSetting];
  uint64_t v48 = [v4 directMessagesSetting];
  if (!v47)
  {
    uint64_t v49 = v48;
    if (v48) {
      [(UNCSectionInfo *)self setDirectMessagesSetting:v48];
    }
  }
  if (![(UNCSectionInfo *)self showsCustomSettingsLink]) {
    -[UNCSectionInfo setShowsCustomSettingsLink:](self, "setShowsCustomSettingsLink:", [v4 showsCustomSettingsLink]);
  }
  v50 = [(UNCSectionInfo *)self parentSection];
  if (!v50 || (v12 & 0x23) != 0)
  {
  }
  else
  {

    if ((v14 & 0x23) != 0)
    {
      if ([(UNCSectionInfo *)self allowsNotifications])
      {
        if ([(UNCSectionInfo *)self lockScreenSetting] != 2
          && [(UNCSectionInfo *)self notificationCenterSetting] != 2
          && ![(UNCSectionInfo *)self alertType])
        {
          [(UNCSectionInfo *)self setAllowsNotifications:0];
        }
      }
      else if (([(UNCSectionInfo *)self suppressedSettings] & 0x2000) == 0 {
             && ([(UNCSectionInfo *)self pushSettings] & 1) != 0)
      }
      {
        [(UNCSectionInfo *)self setPushSettings:[(UNCSectionInfo *)self pushSettings] & 0xFFFFFFFFFFFFFFF7];
      }
    }
  }
  -[UNCSectionInfo setSuppressFromSettings:](self, "setSuppressFromSettings:", [v4 suppressFromSettings]);
  -[UNCSectionInfo setSuppressedSettings:](self, "setSuppressedSettings:", [v4 suppressedSettings]);
  -[UNCSectionInfo setSectionType:](self, "setSectionType:", [v4 sectionType]);
  -[UNCSectionInfo setIsAppClip:](self, "setIsAppClip:", [v4 isAppClip]);
  -[UNCSectionInfo setSectionCategory:](self, "setSectionCategory:", [v4 sectionCategory]);
  -[UNCSectionInfo setSubsectionPriority:](self, "setSubsectionPriority:", [v4 subsectionPriority]);
  -[UNCSectionInfo setVersion:](self, "setVersion:", [v4 version]);
  unint64_t v51 = [v4 appName];
  [(UNCSectionInfo *)self setAppName:v51];

  int v52 = [v4 displayName];
  [(UNCSectionInfo *)self setDisplayName:v52];

  v53 = [v4 icon];
  [(UNCSectionInfo *)self setIcon:v53];

  -[UNCSectionInfo setIsRestricted:](self, "setIsRestricted:", [v4 isRestricted]);
  uint64_t v54 = [v4 customSettingsBundle];
  [(UNCSectionInfo *)self setCustomSettingsBundle:v54];

  uint64_t v55 = [v4 customSettingsDetailControllerClass];
  [(UNCSectionInfo *)self setCustomSettingsDetailControllerClass:v55];
}

- (void)queryAndUseManagedSettings
{
  id v3 = [(UNCSectionInfo *)self sectionID];
  [(UNCSectionInfo *)self queryAndUseManagedSettingsForSectionID:v3];
}

- (void)queryAndUseManagedSettingsForSectionID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[UNCSectionInfoSettings sectionInfoSettingsForManagedBundleID:v4];
  unint64_t v6 = (os_log_t *)MEMORY[0x263F1E070];
  if (v5)
  {
    char v7 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Managed settings found for section %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [(UNCSectionInfo *)self setManagedSectionInfoSettings:v5];
  char v8 = [MEMORY[0x263F53C50] sharedConnection];
  int v9 = [v8 isNotificationsModificationAllowedForBundleID:v4];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_2608DB000, v10, OS_LOG_TYPE_DEFAULT, "Modification not allowed for section %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [(UNCSectionInfo *)self setIsModificationAllowed:v9 ^ 1u];
}

- (UNCSectionInfoSettings)managedSectionInfoSettings
{
  return self->_managedSectionInfoSettings;
}

- (void)setManagedSectionInfoSettings:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (UNCSectionInfoSettings *)[v4 copy];
  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  self->_managedSectionInfoSettings = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v7 = self->_subsections;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setManagedSectionInfoSettings:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)usesManagedSettings
{
  return self->_managedSectionInfoSettings != 0;
}

- (UNCSectionInfoSettings)readableSettings
{
  managedSectionInfoSettings = self->_managedSectionInfoSettings;
  if (!managedSectionInfoSettings) {
    managedSectionInfoSettings = self->_sectionInfoSettings;
  }
  return managedSectionInfoSettings;
}

- (UNCSectionInfoSettings)writableSettings
{
  if (self->_managedSectionInfoSettings) {
    return (UNCSectionInfoSettings *)0;
  }
  else {
    return self->_sectionInfoSettings;
  }
}

- (id)copyFromManagedSettings
{
  id v2 = (void *)[(UNCSectionInfo *)self copy];
  if ([v2 usesManagedSettings])
  {
    id v3 = [v2 managedSectionInfoSettings];
    [v2 setSectionInfoSettings:v3];

    [v2 setManagedSectionInfoSettings:0];
  }
  return v2;
}

- (BOOL)allowsNotifications
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  char v3 = [v2 allowsNotifications];

  return v3;
}

- (void)setAllowsNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setAllowsNotifications:v3];
}

- (NSDate)authorizationExpirationDate
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  BOOL v3 = [v2 authorizationExpirationDate];

  return (NSDate *)v3;
}

- (void)setAuthorizationExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCSectionInfo *)self writableSettings];
  [v5 setAuthorizationExpirationDate:v4];
}

- (int64_t)authorizationStatus
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 authorizationStatus];

  return v3;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setAuthorizationStatus:a3];
}

- (NSDate)lastUserGrantedAuthorizationDate
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 lastUserGrantedAuthorizationDate];

  return (NSDate *)v3;
}

- (void)setLastUserGrantedAuthorizationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCSectionInfo *)self writableSettings];
  [v5 setLastUserGrantedAuthorizationDate:v4];
}

- (UNCMuteAssertion)muteAssertion
{
  id v2 = [(UNCSectionInfo *)self sectionInfoSettings];
  int64_t v3 = [v2 muteAssertion];

  return (UNCMuteAssertion *)v3;
}

- (void)setMuteAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCSectionInfo *)self sectionInfoSettings];
  [v5 setMuteAssertion:v4];
}

- (int64_t)notificationCenterSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 notificationCenterSetting];

  return v3;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setNotificationCenterSetting:a3];
}

- (BOOL)showsInNotificationCenter
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  char v3 = [v2 showsInNotificationCenter];

  return v3;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setShowsInNotificationCenter:v3];
}

- (int64_t)lockScreenSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 lockScreenSetting];

  return v3;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setLockScreenSetting:a3];
}

- (BOOL)showsInLockScreen
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  char v3 = [v2 showsInLockScreen];

  return v3;
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setShowsInLockScreen:v3];
}

- (unint64_t)alertType
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  unint64_t v3 = [v2 alertType];

  return v3;
}

- (void)setAlertType:(unint64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setAlertType:a3];
}

- (unint64_t)pushSettings
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  unint64_t v3 = [v2 pushSettings];

  return v3;
}

- (void)setPushSettings:(unint64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setPushSettings:a3];
}

- (int64_t)carPlaySetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 carPlaySetting];

  return v3;
}

- (void)setCarPlaySetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setCarPlaySetting:a3];
}

- (int64_t)remoteNotificationsSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 remoteNotificationsSetting];

  return v3;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setRemoteNotificationsSetting:a3];
}

- (int64_t)spokenNotificationSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 spokenNotificationSetting];

  return v3;
}

- (void)setSpokenNotificationSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setSpokenNotificationSetting:a3];
}

- (int64_t)criticalAlertSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 criticalAlertSetting];

  return v3;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setCriticalAlertSetting:a3];
}

- (int64_t)timeSensitiveSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 timeSensitiveSetting];

  return v3;
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setTimeSensitiveSetting:a3];
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  char v3 = [v2 hasUserConfiguredTimeSensitiveSetting];

  return v3;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setUserConfiguredTimeSensitiveSetting:v3];
}

- (int64_t)bulletinGroupingSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 bulletinGroupingSetting];

  return v3;
}

- (void)setBulletinGroupingSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setBulletinGroupingSetting:a3];
}

- (int64_t)announceSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 announceSetting];

  return v3;
}

- (void)setAnnounceSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setAnnounceSetting:a3];
}

- (int64_t)scheduledDeliverySetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 scheduledDeliverySetting];

  return v3;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setScheduledDeliverySetting:a3];
}

- (int64_t)directMessagesSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 directMessagesSetting];

  return v3;
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setDirectMessagesSetting:a3];
}

- (BOOL)hasUserConfiguredDirectMessagesSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  char v3 = [v2 hasUserConfiguredDirectMessagesSetting];

  return v3;
}

- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setUserConfiguredDirectMessagesSetting:v3];
}

- (BOOL)showsOnExternalDevices
{
  id v2 = [(UNCSectionInfo *)self sectionInfoSettings];
  char v3 = [v2 showsOnExternalDevices];

  return v3;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self sectionInfoSettings];
  [v4 setShowsOnExternalDevices:v3];
}

- (int64_t)contentPreviewSetting
{
  id v2 = [(UNCSectionInfo *)self readableSettings];
  int64_t v3 = [v2 contentPreviewSetting];

  return v3;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  id v4 = [(UNCSectionInfo *)self writableSettings];
  [v4 setContentPreviewSetting:a3];
}

- (BOOL)showsMessagePreview
{
  id v2 = [(UNCSectionInfo *)self sectionInfoSettings];
  char v3 = [v2 showsMessagePreview];

  return v3;
}

- (void)setShowsMessagePreview:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self sectionInfoSettings];
  [v4 setShowsMessagePreview:v3];
}

- (BOOL)showsCustomSettingsLink
{
  id v2 = [(UNCSectionInfo *)self sectionInfoSettings];
  char v3 = [v2 showsCustomSettingsLink];

  return v3;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UNCSectionInfo *)self sectionInfoSettings];
  [v4 setShowsCustomSettingsLink:v3];
}

@end