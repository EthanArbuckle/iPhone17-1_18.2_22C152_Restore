@interface SISchemaDailyDeviceStatus
- (BOOL)hasActiveStatus;
- (BOOL)hasAggregatedMetrics;
- (BOOL)hasAssistantRecordPublishTimestampMs;
- (BOOL)hasAvailableDeviceStorageInMB;
- (BOOL)hasClientDeviceSamplingTimestampMs;
- (BOOL)hasDeviceBuild;
- (BOOL)hasDeviceCapacityInGB;
- (BOOL)hasDeviceOs;
- (BOOL)hasDeviceType;
- (BOOL)hasEnabledStatus;
- (BOOL)hasLocale;
- (BOOL)hasModelNumber;
- (BOOL)hasMultiUserSetup;
- (BOOL)hasMultiUserState;
- (BOOL)hasPersonalization;
- (BOOL)hasQueuedAtTimestampHourInMs;
- (BOOL)hasRegionInfo;
- (BOOL)hasSharedUserId;
- (BOOL)hasSiriDeviceID;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasSiriSpeechID;
- (BOOL)hasSpokenNotificationsControlCenterModuleEnabled;
- (BOOL)hasSpokenNotificationsWhitelistSettings;
- (BOOL)hasSpokenNotificationsproxCardSeen;
- (BOOL)hasStoreCountryCode;
- (BOOL)hasStorefrontId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)spokenNotificationsControlCenterModuleEnabled;
- (BOOL)spokenNotificationsproxCardSeen;
- (NSArray)enabledDictationLocales;
- (NSArray)installedVoices;
- (NSArray)linkedAccessoryStates;
- (NSData)jsonData;
- (NSString)deviceBuild;
- (NSString)deviceOs;
- (NSString)deviceType;
- (NSString)locale;
- (NSString)modelNumber;
- (NSString)regionInfo;
- (NSString)sharedUserId;
- (NSString)siriDeviceID;
- (NSString)siriSpeechID;
- (NSString)storefrontId;
- (SISchemaActiveStatus)activeStatus;
- (SISchemaAggregatedMetrics)aggregatedMetrics;
- (SISchemaDailyDeviceStatus)initWithDictionary:(id)a3;
- (SISchemaDailyDeviceStatus)initWithJSON:(id)a3;
- (SISchemaEnabledStatus)enabledStatus;
- (SISchemaMultiUserSetup)multiUserSetup;
- (SISchemaMultiUserState)multiUserState;
- (SISchemaPersonalization)personalization;
- (double)availableDeviceStorageInMB;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)enabledDictationLocalesAtIndex:(unint64_t)a3;
- (id)linkedAccessoryStateAtIndex:(unint64_t)a3;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (int)installedVoicesAtIndex:(unint64_t)a3;
- (int)siriInputLocale;
- (int)spokenNotificationsWhitelistSettings;
- (int)storeCountryCode;
- (int64_t)assistantRecordPublishTimestampMs;
- (int64_t)clientDeviceSamplingTimestampMs;
- (unint64_t)enabledDictationLocalesCount;
- (unint64_t)hash;
- (unint64_t)installedVoicesCount;
- (unint64_t)linkedAccessoryStateCount;
- (unint64_t)queuedAtTimestampHourInMs;
- (unsigned)deviceCapacityInGB;
- (void)addEnabledDictationLocales:(id)a3;
- (void)addInstalledVoices:(int)a3;
- (void)addLinkedAccessoryState:(id)a3;
- (void)clearEnabledDictationLocales;
- (void)clearInstalledVoices;
- (void)clearLinkedAccessoryState;
- (void)deleteActiveStatus;
- (void)deleteAggregatedMetrics;
- (void)deleteAssistantRecordPublishTimestampMs;
- (void)deleteAvailableDeviceStorageInMB;
- (void)deleteClientDeviceSamplingTimestampMs;
- (void)deleteDeviceBuild;
- (void)deleteDeviceCapacityInGB;
- (void)deleteDeviceOs;
- (void)deleteDeviceType;
- (void)deleteEnabledStatus;
- (void)deleteLocale;
- (void)deleteModelNumber;
- (void)deleteMultiUserSetup;
- (void)deleteMultiUserState;
- (void)deletePersonalization;
- (void)deleteQueuedAtTimestampHourInMs;
- (void)deleteRegionInfo;
- (void)deleteSharedUserId;
- (void)deleteSiriDeviceID;
- (void)deleteSiriInputLocale;
- (void)deleteSiriSpeechID;
- (void)deleteSpokenNotificationsControlCenterModuleEnabled;
- (void)deleteSpokenNotificationsWhitelistSettings;
- (void)deleteSpokenNotificationsproxCardSeen;
- (void)deleteStoreCountryCode;
- (void)deleteStorefrontId;
- (void)setActiveStatus:(id)a3;
- (void)setAggregatedMetrics:(id)a3;
- (void)setAssistantRecordPublishTimestampMs:(int64_t)a3;
- (void)setAvailableDeviceStorageInMB:(double)a3;
- (void)setClientDeviceSamplingTimestampMs:(int64_t)a3;
- (void)setDeviceBuild:(id)a3;
- (void)setDeviceCapacityInGB:(unsigned int)a3;
- (void)setDeviceOs:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setEnabledDictationLocales:(id)a3;
- (void)setEnabledStatus:(id)a3;
- (void)setHasActiveStatus:(BOOL)a3;
- (void)setHasAggregatedMetrics:(BOOL)a3;
- (void)setHasAssistantRecordPublishTimestampMs:(BOOL)a3;
- (void)setHasAvailableDeviceStorageInMB:(BOOL)a3;
- (void)setHasClientDeviceSamplingTimestampMs:(BOOL)a3;
- (void)setHasDeviceBuild:(BOOL)a3;
- (void)setHasDeviceCapacityInGB:(BOOL)a3;
- (void)setHasDeviceOs:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasEnabledStatus:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasModelNumber:(BOOL)a3;
- (void)setHasMultiUserSetup:(BOOL)a3;
- (void)setHasMultiUserState:(BOOL)a3;
- (void)setHasPersonalization:(BOOL)a3;
- (void)setHasQueuedAtTimestampHourInMs:(BOOL)a3;
- (void)setHasRegionInfo:(BOOL)a3;
- (void)setHasSharedUserId:(BOOL)a3;
- (void)setHasSiriDeviceID:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasSiriSpeechID:(BOOL)a3;
- (void)setHasSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3;
- (void)setHasSpokenNotificationsWhitelistSettings:(BOOL)a3;
- (void)setHasSpokenNotificationsproxCardSeen:(BOOL)a3;
- (void)setHasStoreCountryCode:(BOOL)a3;
- (void)setHasStorefrontId:(BOOL)a3;
- (void)setInstalledVoices:(id)a3;
- (void)setLinkedAccessoryStates:(id)a3;
- (void)setLocale:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setMultiUserSetup:(id)a3;
- (void)setMultiUserState:(id)a3;
- (void)setPersonalization:(id)a3;
- (void)setQueuedAtTimestampHourInMs:(unint64_t)a3;
- (void)setRegionInfo:(id)a3;
- (void)setSharedUserId:(id)a3;
- (void)setSiriDeviceID:(id)a3;
- (void)setSiriInputLocale:(int)a3;
- (void)setSiriSpeechID:(id)a3;
- (void)setSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3;
- (void)setSpokenNotificationsWhitelistSettings:(int)a3;
- (void)setSpokenNotificationsproxCardSeen:(BOOL)a3;
- (void)setStoreCountryCode:(int)a3;
- (void)setStorefrontId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDailyDeviceStatus

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SISchemaDailyDeviceStatus;
  v5 = [(SISchemaInstrumentationMessage *)&v29 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8])
  {
    [(SISchemaDailyDeviceStatus *)self deleteSiriDeviceID];
    [(SISchemaDailyDeviceStatus *)self deleteSiriSpeechID];
    [(SISchemaDailyDeviceStatus *)self deleteSharedUserId];
  }
  v6 = [(SISchemaDailyDeviceStatus *)self enabledStatus];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaDailyDeviceStatus *)self deleteEnabledStatus];
  }
  v9 = [(SISchemaDailyDeviceStatus *)self activeStatus];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaDailyDeviceStatus *)self deleteActiveStatus];
  }
  v12 = [(SISchemaDailyDeviceStatus *)self personalization];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaDailyDeviceStatus *)self deletePersonalization];
  }
  v15 = [(SISchemaDailyDeviceStatus *)self multiUserState];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaDailyDeviceStatus *)self deleteMultiUserState];
  }
  v18 = [(SISchemaDailyDeviceStatus *)self aggregatedMetrics];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(SISchemaDailyDeviceStatus *)self deleteAggregatedMetrics];
  }
  v21 = [(SISchemaDailyDeviceStatus *)self linkedAccessoryStates];
  v22 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v21 underConditions:v4];
  [(SISchemaDailyDeviceStatus *)self setLinkedAccessoryStates:v22];

  v23 = [(SISchemaDailyDeviceStatus *)self multiUserSetup];
  v24 = [v23 applySensitiveConditionsPolicy:v4];
  int v25 = [v24 suppressMessage];

  if (v25) {
    [(SISchemaDailyDeviceStatus *)self deleteMultiUserSetup];
  }
  v26 = [(SISchemaDailyDeviceStatus *)self enabledDictationLocales];
  v27 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v26 underConditions:v4];
  [(SISchemaDailyDeviceStatus *)self setEnabledDictationLocales:v27];

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedVoices, 0);
  objc_storeStrong((id *)&self->_storefrontId, 0);
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_enabledDictationLocales, 0);
  objc_storeStrong((id *)&self->_multiUserSetup, 0);
  objc_storeStrong((id *)&self->_linkedAccessoryStates, 0);
  objc_storeStrong((id *)&self->_aggregatedMetrics, 0);
  objc_storeStrong((id *)&self->_multiUserState, 0);
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_activeStatus, 0);
  objc_storeStrong((id *)&self->_enabledStatus, 0);
  objc_storeStrong((id *)&self->_deviceBuild, 0);
  objc_storeStrong((id *)&self->_deviceOs, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_siriSpeechID, 0);
  objc_storeStrong((id *)&self->_siriDeviceID, 0);
}

- (void)setHasStorefrontId:(BOOL)a3
{
  self->_hasModelNumber = a3;
}

- (void)setHasRegionInfo:(BOOL)a3
{
  self->_hasMultiUserSetup = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  self->_hasAggregatedMetrics = a3;
}

- (void)setHasMultiUserSetup:(BOOL)a3
{
  self->_hasMultiUserState = a3;
}

- (void)setHasAggregatedMetrics:(BOOL)a3
{
  self->_hasPersonalization = a3;
}

- (void)setHasMultiUserState:(BOOL)a3
{
  self->_hasActiveStatus = a3;
}

- (void)setHasPersonalization:(BOOL)a3
{
  self->_hasEnabledStatus = a3;
}

- (void)setHasActiveStatus:(BOOL)a3
{
  self->_hasDeviceBuild = a3;
}

- (void)setHasEnabledStatus:(BOOL)a3
{
  self->_hasDeviceOs = a3;
}

- (void)setHasDeviceBuild:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasDeviceOs:(BOOL)a3
{
  self->_hasLocale = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  self->_hasSharedUserId = a3;
}

- (void)setHasLocale:(BOOL)a3
{
  self->_hasSiriSpeechID = a3;
}

- (void)setHasSharedUserId:(BOOL)a3
{
  self->_hasSiriDeviceID = a3;
}

- (void)setHasSiriSpeechID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSiriDeviceID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setInstalledVoices:(id)a3
{
}

- (NSArray)installedVoices
{
  return self->_installedVoices;
}

- (void)setStorefrontId:(id)a3
{
}

- (NSString)storefrontId
{
  return self->_storefrontId;
}

- (void)setRegionInfo:(id)a3
{
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (double)availableDeviceStorageInMB
{
  return self->_availableDeviceStorageInMB;
}

- (unsigned)deviceCapacityInGB
{
  return self->_deviceCapacityInGB;
}

- (void)setEnabledDictationLocales:(id)a3
{
}

- (NSArray)enabledDictationLocales
{
  return self->_enabledDictationLocales;
}

- (int)storeCountryCode
{
  return self->_storeCountryCode;
}

- (unint64_t)queuedAtTimestampHourInMs
{
  return self->_queuedAtTimestampHourInMs;
}

- (void)setMultiUserSetup:(id)a3
{
}

- (SISchemaMultiUserSetup)multiUserSetup
{
  return self->_multiUserSetup;
}

- (int)siriInputLocale
{
  return self->_siriInputLocale;
}

- (void)setLinkedAccessoryStates:(id)a3
{
}

- (NSArray)linkedAccessoryStates
{
  return self->_linkedAccessoryStates;
}

- (void)setAggregatedMetrics:(id)a3
{
}

- (SISchemaAggregatedMetrics)aggregatedMetrics
{
  return self->_aggregatedMetrics;
}

- (int)spokenNotificationsWhitelistSettings
{
  return self->_spokenNotificationsWhitelistSettings;
}

- (BOOL)spokenNotificationsControlCenterModuleEnabled
{
  return self->_spokenNotificationsControlCenterModuleEnabled;
}

- (BOOL)spokenNotificationsproxCardSeen
{
  return self->_spokenNotificationsproxCardSeen;
}

- (void)setMultiUserState:(id)a3
{
}

- (SISchemaMultiUserState)multiUserState
{
  return self->_multiUserState;
}

- (void)setPersonalization:(id)a3
{
}

- (SISchemaPersonalization)personalization
{
  return self->_personalization;
}

- (void)setActiveStatus:(id)a3
{
}

- (SISchemaActiveStatus)activeStatus
{
  return self->_activeStatus;
}

- (void)setEnabledStatus:(id)a3
{
}

- (SISchemaEnabledStatus)enabledStatus
{
  return self->_enabledStatus;
}

- (void)setDeviceBuild:(id)a3
{
}

- (NSString)deviceBuild
{
  return self->_deviceBuild;
}

- (void)setDeviceOs:(id)a3
{
}

- (NSString)deviceOs
{
  return self->_deviceOs;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (int64_t)assistantRecordPublishTimestampMs
{
  return self->_assistantRecordPublishTimestampMs;
}

- (int64_t)clientDeviceSamplingTimestampMs
{
  return self->_clientDeviceSamplingTimestampMs;
}

- (void)setSharedUserId:(id)a3
{
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)setSiriSpeechID:(id)a3
{
}

- (NSString)siriSpeechID
{
  return self->_siriSpeechID;
}

- (void)setSiriDeviceID:(id)a3
{
}

- (NSString)siriDeviceID
{
  return self->_siriDeviceID;
}

- (SISchemaDailyDeviceStatus)initWithDictionary:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v112.receiver = self;
  v112.super_class = (Class)SISchemaDailyDeviceStatus;
  v5 = [(SISchemaDailyDeviceStatus *)&v112 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriDeviceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaDailyDeviceStatus *)v5 setSiriDeviceID:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"siriSpeechID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaDailyDeviceStatus *)v5 setSiriSpeechID:v9];
    }
    v83 = v6;
    v10 = [v4 objectForKeyedSubscript:@"sharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(SISchemaDailyDeviceStatus *)v5 setSharedUserId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"clientDeviceSamplingTimestampMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setClientDeviceSamplingTimestampMs:](v5, "setClientDeviceSamplingTimestampMs:", [v12 longLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"assistantRecordPublishTimestampMs"];
    objc_opt_class();
    v98 = v13;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setAssistantRecordPublishTimestampMs:](v5, "setAssistantRecordPublishTimestampMs:", [v13 longLongValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    v97 = v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(SISchemaDailyDeviceStatus *)v5 setLocale:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    v96 = v16;
    if (objc_opt_isKindOfClass())
    {
      int v17 = (void *)[v16 copy];
      [(SISchemaDailyDeviceStatus *)v5 setDeviceType:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"deviceOs"];
    objc_opt_class();
    v95 = v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(SISchemaDailyDeviceStatus *)v5 setDeviceOs:v19];
    }
    v81 = v12;
    v82 = v8;
    int v20 = [v4 objectForKeyedSubscript:@"deviceBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[v20 copy];
      [(SISchemaDailyDeviceStatus *)v5 setDeviceBuild:v21];
    }
    v80 = v20;
    uint64_t v22 = [v4 objectForKeyedSubscript:@"enabledStatus"];
    objc_opt_class();
    v94 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = [[SISchemaEnabledStatus alloc] initWithDictionary:v22];
      [(SISchemaDailyDeviceStatus *)v5 setEnabledStatus:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"activeStatus"];
    objc_opt_class();
    v93 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      int v25 = [[SISchemaActiveStatus alloc] initWithDictionary:v24];
      [(SISchemaDailyDeviceStatus *)v5 setActiveStatus:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"personalization"];
    objc_opt_class();
    v92 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[SISchemaPersonalization alloc] initWithDictionary:v26];
      [(SISchemaDailyDeviceStatus *)v5 setPersonalization:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"multiUserState"];
    objc_opt_class();
    v91 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      objc_super v29 = [[SISchemaMultiUserState alloc] initWithDictionary:v28];
      [(SISchemaDailyDeviceStatus *)v5 setMultiUserState:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"spokenNotificationsproxCardSeen"];
    objc_opt_class();
    v90 = v30;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setSpokenNotificationsproxCardSeen:](v5, "setSpokenNotificationsproxCardSeen:", [v30 BOOLValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"spokenNotificationsControlCenterModuleEnabled"];
    objc_opt_class();
    v89 = v31;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setSpokenNotificationsControlCenterModuleEnabled:](v5, "setSpokenNotificationsControlCenterModuleEnabled:", [v31 BOOLValue]);
    }
    v32 = [v4 objectForKeyedSubscript:@"spokenNotificationsWhitelistSettings"];
    objc_opt_class();
    v88 = v32;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setSpokenNotificationsWhitelistSettings:](v5, "setSpokenNotificationsWhitelistSettings:", [v32 intValue]);
    }
    uint64_t v33 = [v4 objectForKeyedSubscript:@"aggregatedMetrics"];
    objc_opt_class();
    v87 = (void *)v33;
    if (objc_opt_isKindOfClass())
    {
      v34 = [[SISchemaAggregatedMetrics alloc] initWithDictionary:v33];
      [(SISchemaDailyDeviceStatus *)v5 setAggregatedMetrics:v34];
    }
    v35 = [v4 objectForKeyedSubscript:@"linkedAccessoryState"];
    objc_opt_class();
    v86 = v35;
    id v99 = v4;
    if (objc_opt_isKindOfClass())
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v36 = v35;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v108 objects:v115 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v109 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v108 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v42 = [[SISchemaLinkedAccessoryState alloc] initWithDictionary:v41];
              [(SISchemaDailyDeviceStatus *)v5 addLinkedAccessoryState:v42];
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v108 objects:v115 count:16];
        }
        while (v38);
      }

      id v4 = v99;
    }
    v43 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setSiriInputLocale:](v5, "setSiriInputLocale:", [v43 intValue]);
    }
    v44 = [v4 objectForKeyedSubscript:@"multiUserSetup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[SISchemaMultiUserSetup alloc] initWithDictionary:v44];
      [(SISchemaDailyDeviceStatus *)v5 setMultiUserSetup:v45];
    }
    v46 = [v4 objectForKeyedSubscript:@"queuedAtTimestampHourInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setQueuedAtTimestampHourInMs:](v5, "setQueuedAtTimestampHourInMs:", [v46 unsignedLongLongValue]);
    }
    v47 = [v4 objectForKeyedSubscript:@"storeCountryCode"];
    objc_opt_class();
    v85 = v47;
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setStoreCountryCode:](v5, "setStoreCountryCode:", [v47 intValue]);
    }
    v48 = [v4 objectForKeyedSubscript:@"enabledDictationLocales"];
    objc_opt_class();
    v84 = v48;
    v78 = v46;
    v79 = v44;
    if (objc_opt_isKindOfClass())
    {
      v49 = v43;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v50 = v48;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v104 objects:v114 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v105;
        do
        {
          for (uint64_t j = 0; j != v52; ++j)
          {
            if (*(void *)v105 != v53) {
              objc_enumerationMutation(v50);
            }
            uint64_t v55 = *(void *)(*((void *)&v104 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v56 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v55];
              [(SISchemaDailyDeviceStatus *)v5 addEnabledDictationLocales:v56];
            }
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v104 objects:v114 count:16];
        }
        while (v52);
      }

      id v4 = v99;
      v43 = v49;
      v46 = v78;
    }
    v57 = [v4 objectForKeyedSubscript:@"deviceCapacityInGB"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaDailyDeviceStatus setDeviceCapacityInGB:](v5, "setDeviceCapacityInGB:", [v57 unsignedIntValue]);
    }
    v77 = v57;
    v58 = [v4 objectForKeyedSubscript:@"availableDeviceStorageInMB"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v58 doubleValue];
      -[SISchemaDailyDeviceStatus setAvailableDeviceStorageInMB:](v5, "setAvailableDeviceStorageInMB:");
    }
    v76 = v58;
    v59 = [v4 objectForKeyedSubscript:@"modelNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v60 = (void *)[v59 copy];
      [(SISchemaDailyDeviceStatus *)v5 setModelNumber:v60];
    }
    v75 = v59;
    v61 = [v4 objectForKeyedSubscript:@"regionInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v62 = (void *)[v61 copy];
      [(SISchemaDailyDeviceStatus *)v5 setRegionInfo:v62];
    }
    v63 = [v4 objectForKeyedSubscript:@"storefrontId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v64 = (void *)[v63 copy];
      [(SISchemaDailyDeviceStatus *)v5 setStorefrontId:v64];
    }
    v65 = [v4 objectForKeyedSubscript:@"installedVoices"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v74 = v43;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v66 = v65;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v100 objects:v113 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v101;
        do
        {
          for (uint64_t k = 0; k != v68; ++k)
          {
            if (*(void *)v101 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = *(void **)(*((void *)&v100 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[SISchemaDailyDeviceStatus addInstalledVoices:](v5, "addInstalledVoices:", [v71 intValue]);
            }
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v100 objects:v113 count:16];
        }
        while (v68);
      }

      id v4 = v99;
      v43 = v74;
      v46 = v78;
      v44 = v79;
    }
    v72 = v5;
  }
  return v5;
}

- (SISchemaDailyDeviceStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDailyDeviceStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDailyDeviceStatus *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_activeStatus)
  {
    id v4 = [(SISchemaDailyDeviceStatus *)self activeStatus];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"activeStatus"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"activeStatus"];
    }
  }
  if (self->_aggregatedMetrics)
  {
    uint64_t v7 = [(SISchemaDailyDeviceStatus *)self aggregatedMetrics];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"aggregatedMetrics"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"aggregatedMetrics"];
    }
  }
  __int16 has = (__int16)self->_has;
  unint64_t v11 = 0x1E4F28000uLL;
  if ((has & 2) != 0)
  {
    v30 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaDailyDeviceStatus assistantRecordPublishTimestampMs](self, "assistantRecordPublishTimestampMs"));
    [v3 setObject:v30 forKeyedSubscript:@"assistantRecordPublishTimestampMs"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_13;
  }
  v31 = NSNumber;
  [(SISchemaDailyDeviceStatus *)self availableDeviceStorageInMB];
  v32 = objc_msgSend(v31, "numberWithDouble:");
  [v3 setObject:v32 forKeyedSubscript:@"availableDeviceStorageInMB"];

  if (*(_WORD *)&self->_has)
  {
LABEL_14:
    v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaDailyDeviceStatus clientDeviceSamplingTimestampMs](self, "clientDeviceSamplingTimestampMs"));
    [v3 setObject:v12 forKeyedSubscript:@"clientDeviceSamplingTimestampMs"];
  }
LABEL_15:
  if (self->_deviceBuild)
  {
    v13 = [(SISchemaDailyDeviceStatus *)self deviceBuild];
    int v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"deviceBuild"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaDailyDeviceStatus deviceCapacityInGB](self, "deviceCapacityInGB"));
    [v3 setObject:v15 forKeyedSubscript:@"deviceCapacityInGB"];
  }
  if (self->_deviceOs)
  {
    v16 = [(SISchemaDailyDeviceStatus *)self deviceOs];
    int v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"deviceOs"];
  }
  if (self->_deviceType)
  {
    v18 = [(SISchemaDailyDeviceStatus *)self deviceType];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"deviceType"];
  }
  if ([(NSArray *)self->_enabledDictationLocales count])
  {
    int v20 = [MEMORY[0x1E4F1CA48] array];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v21 = self->_enabledDictationLocales;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v83 objects:v88 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v84 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v83 + 1) + 8 * i) dictionaryRepresentation];
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v83 objects:v88 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"enabledDictationLocales"];
    unint64_t v11 = 0x1E4F28000;
  }
  if (self->_enabledStatus)
  {
    uint64_t v28 = [(SISchemaDailyDeviceStatus *)self enabledStatus];
    objc_super v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"enabledStatus"];
    }
    else
    {
      uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"enabledStatus"];
    }
  }
  if ([(NSArray *)self->_installedVoices count])
  {
    v34 = [(SISchemaDailyDeviceStatus *)self installedVoices];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"installedVoices"];
  }
  if ([(NSArray *)self->_linkedAccessoryStates count])
  {
    id v36 = [MEMORY[0x1E4F1CA48] array];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    uint64_t v37 = self->_linkedAccessoryStates;
    uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v80 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v79 + 1) + 8 * j) dictionaryRepresentation];
          if (v42)
          {
            [v36 addObject:v42];
          }
          else
          {
            v43 = [MEMORY[0x1E4F1CA98] null];
            [v36 addObject:v43];
          }
        }
        uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v39);
    }

    [v3 setObject:v36 forKeyedSubscript:@"linkedAccessoryState"];
    unint64_t v11 = 0x1E4F28000uLL;
  }
  if (self->_locale)
  {
    v44 = [(SISchemaDailyDeviceStatus *)self locale];
    v45 = (void *)[v44 copy];
    [v3 setObject:v45 forKeyedSubscript:@"locale"];
  }
  if (self->_modelNumber)
  {
    v46 = [(SISchemaDailyDeviceStatus *)self modelNumber];
    v47 = (void *)[v46 copy];
    [v3 setObject:v47 forKeyedSubscript:@"modelNumber"];
  }
  if (self->_multiUserSetup)
  {
    v48 = [(SISchemaDailyDeviceStatus *)self multiUserSetup];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"multiUserSetup"];
    }
    else
    {
      id v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"multiUserSetup"];
    }
  }
  if (self->_multiUserState)
  {
    uint64_t v51 = [(SISchemaDailyDeviceStatus *)self multiUserState];
    uint64_t v52 = [v51 dictionaryRepresentation];
    if (v52)
    {
      [v3 setObject:v52 forKeyedSubscript:@"multiUserState"];
    }
    else
    {
      uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v53 forKeyedSubscript:@"multiUserState"];
    }
  }
  if (self->_personalization)
  {
    v54 = [(SISchemaDailyDeviceStatus *)self personalization];
    uint64_t v55 = [v54 dictionaryRepresentation];
    if (v55)
    {
      [v3 setObject:v55 forKeyedSubscript:@"personalization"];
    }
    else
    {
      v56 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v56 forKeyedSubscript:@"personalization"];
    }
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v57 = objc_msgSend(*(id *)(v11 + 3792), "numberWithUnsignedLongLong:", -[SISchemaDailyDeviceStatus queuedAtTimestampHourInMs](self, "queuedAtTimestampHourInMs"));
    [v3 setObject:v57 forKeyedSubscript:@"queuedAtTimestampHourInMs"];
  }
  if (self->_regionInfo)
  {
    v58 = [(SISchemaDailyDeviceStatus *)self regionInfo];
    v59 = (void *)[v58 copy];
    [v3 setObject:v59 forKeyedSubscript:@"regionInfo"];
  }
  if (self->_sharedUserId)
  {
    v60 = [(SISchemaDailyDeviceStatus *)self sharedUserId];
    v61 = (void *)[v60 copy];
    [v3 setObject:v61 forKeyedSubscript:@"sharedUserId"];
  }
  if (self->_siriDeviceID)
  {
    v62 = [(SISchemaDailyDeviceStatus *)self siriDeviceID];
    v63 = (void *)[v62 copy];
    [v3 setObject:v63 forKeyedSubscript:@"siriDeviceID"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    unsigned int v64 = [(SISchemaDailyDeviceStatus *)self siriInputLocale] - 1;
    if (v64 > 0x3D) {
      v65 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v65 = off_1E5EB5F38[v64];
    }
    [v3 setObject:v65 forKeyedSubscript:@"siriInputLocale"];
  }
  if (self->_siriSpeechID)
  {
    id v66 = [(SISchemaDailyDeviceStatus *)self siriSpeechID];
    uint64_t v67 = (void *)[v66 copy];
    [v3 setObject:v67 forKeyedSubscript:@"siriSpeechID"];
  }
  __int16 v68 = (__int16)self->_has;
  if ((v68 & 8) != 0)
  {
    uint64_t v69 = objc_msgSend(*(id *)(v11 + 3792), "numberWithBool:", -[SISchemaDailyDeviceStatus spokenNotificationsControlCenterModuleEnabled](self, "spokenNotificationsControlCenterModuleEnabled"));
    [v3 setObject:v69 forKeyedSubscript:@"spokenNotificationsControlCenterModuleEnabled"];

    __int16 v68 = (__int16)self->_has;
    if ((v68 & 0x10) == 0)
    {
LABEL_93:
      if ((v68 & 4) == 0) {
        goto LABEL_94;
      }
LABEL_101:
      v72 = objc_msgSend(*(id *)(v11 + 3792), "numberWithBool:", -[SISchemaDailyDeviceStatus spokenNotificationsproxCardSeen](self, "spokenNotificationsproxCardSeen"));
      [v3 setObject:v72 forKeyedSubscript:@"spokenNotificationsproxCardSeen"];

      if ((*(_WORD *)&self->_has & 0x80) == 0) {
        goto LABEL_106;
      }
LABEL_102:
      unsigned int v73 = [(SISchemaDailyDeviceStatus *)self storeCountryCode] - 1;
      if (v73 > 0xF9) {
        v74 = @"COUNTRYCODE_UNKNOWN";
      }
      else {
        v74 = off_1E5EB6148[v73];
      }
      [v3 setObject:v74 forKeyedSubscript:@"storeCountryCode"];
      goto LABEL_106;
    }
  }
  else if ((v68 & 0x10) == 0)
  {
    goto LABEL_93;
  }
  unsigned int v70 = [(SISchemaDailyDeviceStatus *)self spokenNotificationsWhitelistSettings]
      - 1;
  if (v70 > 3) {
    v71 = @"NONE";
  }
  else {
    v71 = off_1E5EB6128[v70];
  }
  [v3 setObject:v71 forKeyedSubscript:@"spokenNotificationsWhitelistSettings"];
  __int16 v68 = (__int16)self->_has;
  if ((v68 & 4) != 0) {
    goto LABEL_101;
  }
LABEL_94:
  if ((v68 & 0x80) != 0) {
    goto LABEL_102;
  }
LABEL_106:
  if (self->_storefrontId)
  {
    v75 = [(SISchemaDailyDeviceStatus *)self storefrontId];
    v76 = (void *)[v75 copy];
    [v3 setObject:v76 forKeyedSubscript:@"storefrontId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v77 = v3;

  return v77;
}

- (unint64_t)hash
{
  NSUInteger v39 = [(NSString *)self->_siriDeviceID hash];
  NSUInteger v38 = [(NSString *)self->_siriSpeechID hash];
  NSUInteger v37 = [(NSString *)self->_sharedUserId hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v36 = 2654435761 * self->_clientDeviceSamplingTimestampMs;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v35 = 2654435761 * self->_assistantRecordPublishTimestampMs;
      goto LABEL_6;
    }
  }
  uint64_t v35 = 0;
LABEL_6:
  NSUInteger v34 = [(NSString *)self->_locale hash];
  NSUInteger v33 = [(NSString *)self->_deviceType hash];
  NSUInteger v32 = [(NSString *)self->_deviceOs hash];
  NSUInteger v31 = [(NSString *)self->_deviceBuild hash];
  unint64_t v30 = [(SISchemaEnabledStatus *)self->_enabledStatus hash];
  unint64_t v29 = [(SISchemaActiveStatus *)self->_activeStatus hash];
  unint64_t v28 = [(SISchemaPersonalization *)self->_personalization hash];
  unint64_t v27 = [(SISchemaMultiUserState *)self->_multiUserState hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 4) == 0)
  {
    uint64_t v26 = 0;
    if ((v4 & 8) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v25 = 0;
    if ((v4 & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v26 = 2654435761 * self->_spokenNotificationsproxCardSeen;
  if ((v4 & 8) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v25 = 2654435761 * self->_spokenNotificationsControlCenterModuleEnabled;
  if ((v4 & 0x10) != 0)
  {
LABEL_9:
    unint64_t v5 = [(SISchemaAggregatedMetrics *)self->_aggregatedMetrics hash];
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v5 = [(SISchemaAggregatedMetrics *)self->_aggregatedMetrics hash];
LABEL_13:
  unint64_t v6 = v5;
  uint64_t v7 = [(NSArray *)self->_linkedAccessoryStates hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v8 = 2654435761 * self->_siriInputLocale;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(SISchemaMultiUserSetup *)self->_multiUserSetup hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    unint64_t v11 = 2654435761u * self->_queuedAtTimestampHourInMs;
    if ((v10 & 0x80) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v11 = 0;
    if ((v10 & 0x80) != 0)
    {
LABEL_18:
      uint64_t v12 = 2654435761 * self->_storeCountryCode;
      goto LABEL_21;
    }
  }
  uint64_t v12 = 0;
LABEL_21:
  uint64_t v13 = [(NSArray *)self->_enabledDictationLocales hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v14 = 2654435761 * self->_deviceCapacityInGB;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_23;
    }
LABEL_28:
    unint64_t v19 = 0;
    goto LABEL_31;
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_28;
  }
LABEL_23:
  double availableDeviceStorageInMB = self->_availableDeviceStorageInMB;
  double v16 = -availableDeviceStorageInMB;
  if (availableDeviceStorageInMB >= 0.0) {
    double v16 = self->_availableDeviceStorageInMB;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_31:
  NSUInteger v20 = v13 ^ v14 ^ v19 ^ [(NSString *)self->_modelNumber hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_regionInfo hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_storefrontId hash];
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v22 ^ [(NSArray *)self->_installedVoices hash];
}

- (BOOL)isEqual:(id)a3
{
  __int16 v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_132;
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self siriDeviceID];
  unint64_t v6 = [v4 siriDeviceID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v7 = [(SISchemaDailyDeviceStatus *)self siriDeviceID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(SISchemaDailyDeviceStatus *)self siriDeviceID];
    __int16 v10 = [v4 siriDeviceID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self siriSpeechID];
  unint64_t v6 = [v4 siriSpeechID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v12 = [(SISchemaDailyDeviceStatus *)self siriSpeechID];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(SISchemaDailyDeviceStatus *)self siriSpeechID];
    v15 = [v4 siriSpeechID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self sharedUserId];
  unint64_t v6 = [v4 sharedUserId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v17 = [(SISchemaDailyDeviceStatus *)self sharedUserId];
  if (v17)
  {
    double v18 = (void *)v17;
    unint64_t v19 = [(SISchemaDailyDeviceStatus *)self sharedUserId];
    NSUInteger v20 = [v4 sharedUserId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  $F1C35457E9BE1BAE233CB224F3BB2FB1 has = self->_has;
  unsigned int v23 = v4[112];
  if ((*(unsigned char *)&has & 1) != (v23 & 1)) {
    goto LABEL_132;
  }
  if (*(unsigned char *)&has)
  {
    int64_t clientDeviceSamplingTimestampMs = self->_clientDeviceSamplingTimestampMs;
    if (clientDeviceSamplingTimestampMs != [v4 clientDeviceSamplingTimestampMs]) {
      goto LABEL_132;
    }
    $F1C35457E9BE1BAE233CB224F3BB2FB1 has = self->_has;
    unsigned int v23 = v4[112];
  }
  int v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1)) {
    goto LABEL_132;
  }
  if (v25)
  {
    int64_t assistantRecordPublishTimestampMs = self->_assistantRecordPublishTimestampMs;
    if (assistantRecordPublishTimestampMs != [v4 assistantRecordPublishTimestampMs]) {
      goto LABEL_132;
    }
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self locale];
  unint64_t v6 = [v4 locale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v27 = [(SISchemaDailyDeviceStatus *)self locale];
  if (v27)
  {
    unint64_t v28 = (void *)v27;
    unint64_t v29 = [(SISchemaDailyDeviceStatus *)self locale];
    unint64_t v30 = [v4 locale];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self deviceType];
  unint64_t v6 = [v4 deviceType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v32 = [(SISchemaDailyDeviceStatus *)self deviceType];
  if (v32)
  {
    NSUInteger v33 = (void *)v32;
    NSUInteger v34 = [(SISchemaDailyDeviceStatus *)self deviceType];
    uint64_t v35 = [v4 deviceType];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self deviceOs];
  unint64_t v6 = [v4 deviceOs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v37 = [(SISchemaDailyDeviceStatus *)self deviceOs];
  if (v37)
  {
    NSUInteger v38 = (void *)v37;
    NSUInteger v39 = [(SISchemaDailyDeviceStatus *)self deviceOs];
    uint64_t v40 = [v4 deviceOs];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self deviceBuild];
  unint64_t v6 = [v4 deviceBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v42 = [(SISchemaDailyDeviceStatus *)self deviceBuild];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(SISchemaDailyDeviceStatus *)self deviceBuild];
    v45 = [v4 deviceBuild];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self enabledStatus];
  unint64_t v6 = [v4 enabledStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v47 = [(SISchemaDailyDeviceStatus *)self enabledStatus];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(SISchemaDailyDeviceStatus *)self enabledStatus];
    id v50 = [v4 enabledStatus];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self activeStatus];
  unint64_t v6 = [v4 activeStatus];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v52 = [(SISchemaDailyDeviceStatus *)self activeStatus];
  if (v52)
  {
    uint64_t v53 = (void *)v52;
    v54 = [(SISchemaDailyDeviceStatus *)self activeStatus];
    uint64_t v55 = [v4 activeStatus];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self personalization];
  unint64_t v6 = [v4 personalization];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v57 = [(SISchemaDailyDeviceStatus *)self personalization];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(SISchemaDailyDeviceStatus *)self personalization];
    v60 = [v4 personalization];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self multiUserState];
  unint64_t v6 = [v4 multiUserState];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v62 = [(SISchemaDailyDeviceStatus *)self multiUserState];
  if (v62)
  {
    v63 = (void *)v62;
    unsigned int v64 = [(SISchemaDailyDeviceStatus *)self multiUserState];
    v65 = [v4 multiUserState];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  $F1C35457E9BE1BAE233CB224F3BB2FB1 v67 = self->_has;
  int v68 = (*(unsigned int *)&v67 >> 2) & 1;
  unsigned int v69 = v4[112];
  if (v68 != ((v69 >> 2) & 1)) {
    goto LABEL_132;
  }
  if (v68)
  {
    int spokenNotificationsproxCardSeen = self->_spokenNotificationsproxCardSeen;
    if (spokenNotificationsproxCardSeen != [v4 spokenNotificationsproxCardSeen]) {
      goto LABEL_132;
    }
    $F1C35457E9BE1BAE233CB224F3BB2FB1 v67 = self->_has;
    unsigned int v69 = v4[112];
  }
  int v71 = (*(unsigned int *)&v67 >> 3) & 1;
  if (v71 != ((v69 >> 3) & 1)) {
    goto LABEL_132;
  }
  if (v71)
  {
    int spokenNotificationsControlCenterModuleEnabled = self->_spokenNotificationsControlCenterModuleEnabled;
    if (spokenNotificationsControlCenterModuleEnabled != [v4 spokenNotificationsControlCenterModuleEnabled])goto LABEL_132; {
    $F1C35457E9BE1BAE233CB224F3BB2FB1 v67 = self->_has;
    }
    unsigned int v69 = v4[112];
  }
  int v73 = (*(unsigned int *)&v67 >> 4) & 1;
  if (v73 != ((v69 >> 4) & 1)) {
    goto LABEL_132;
  }
  if (v73)
  {
    int spokenNotificationsWhitelistSettings = self->_spokenNotificationsWhitelistSettings;
    if (spokenNotificationsWhitelistSettings != [v4 spokenNotificationsWhitelistSettings]) {
      goto LABEL_132;
    }
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self aggregatedMetrics];
  unint64_t v6 = [v4 aggregatedMetrics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v75 = [(SISchemaDailyDeviceStatus *)self aggregatedMetrics];
  if (v75)
  {
    v76 = (void *)v75;
    id v77 = [(SISchemaDailyDeviceStatus *)self aggregatedMetrics];
    v78 = [v4 aggregatedMetrics];
    int v79 = [v77 isEqual:v78];

    if (!v79) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self linkedAccessoryStates];
  unint64_t v6 = [v4 linkedAccessoryStates];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v80 = [(SISchemaDailyDeviceStatus *)self linkedAccessoryStates];
  if (v80)
  {
    long long v81 = (void *)v80;
    long long v82 = [(SISchemaDailyDeviceStatus *)self linkedAccessoryStates];
    long long v83 = [v4 linkedAccessoryStates];
    int v84 = [v82 isEqual:v83];

    if (!v84) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  int v85 = (*(_WORD *)&self->_has >> 5) & 1;
  if (v85 != ((v4[112] >> 5) & 1)) {
    goto LABEL_132;
  }
  if (v85)
  {
    int siriInputLocale = self->_siriInputLocale;
    if (siriInputLocale != [v4 siriInputLocale]) {
      goto LABEL_132;
    }
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self multiUserSetup];
  unint64_t v6 = [v4 multiUserSetup];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v87 = [(SISchemaDailyDeviceStatus *)self multiUserSetup];
  if (v87)
  {
    v88 = (void *)v87;
    uint64_t v89 = [(SISchemaDailyDeviceStatus *)self multiUserSetup];
    v90 = [v4 multiUserSetup];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  $F1C35457E9BE1BAE233CB224F3BB2FB1 v92 = self->_has;
  int v93 = (*(unsigned int *)&v92 >> 6) & 1;
  unsigned int v94 = v4[112];
  if (v93 != ((v94 >> 6) & 1)) {
    goto LABEL_132;
  }
  if (v93)
  {
    unint64_t queuedAtTimestampHourInMs = self->_queuedAtTimestampHourInMs;
    if (queuedAtTimestampHourInMs != [v4 queuedAtTimestampHourInMs]) {
      goto LABEL_132;
    }
    $F1C35457E9BE1BAE233CB224F3BB2FB1 v92 = self->_has;
    unsigned int v94 = v4[112];
  }
  int v96 = (*(unsigned int *)&v92 >> 7) & 1;
  if (v96 != ((v94 >> 7) & 1)) {
    goto LABEL_132;
  }
  if (v96)
  {
    int storeCountryCode = self->_storeCountryCode;
    if (storeCountryCode != [v4 storeCountryCode]) {
      goto LABEL_132;
    }
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self enabledDictationLocales];
  unint64_t v6 = [v4 enabledDictationLocales];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v98 = [(SISchemaDailyDeviceStatus *)self enabledDictationLocales];
  if (v98)
  {
    id v99 = (void *)v98;
    long long v100 = [(SISchemaDailyDeviceStatus *)self enabledDictationLocales];
    long long v101 = [v4 enabledDictationLocales];
    int v102 = [v100 isEqual:v101];

    if (!v102) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  $F1C35457E9BE1BAE233CB224F3BB2FB1 v103 = self->_has;
  int v104 = (*(unsigned int *)&v103 >> 8) & 1;
  unsigned int v105 = v4[112];
  if (v104 != ((v105 >> 8) & 1)) {
    goto LABEL_132;
  }
  if (v104)
  {
    unsigned int deviceCapacityInGB = self->_deviceCapacityInGB;
    if (deviceCapacityInGB != [v4 deviceCapacityInGB]) {
      goto LABEL_132;
    }
    $F1C35457E9BE1BAE233CB224F3BB2FB1 v103 = self->_has;
    unsigned int v105 = v4[112];
  }
  int v107 = (*(unsigned int *)&v103 >> 9) & 1;
  if (v107 != ((v105 >> 9) & 1)) {
    goto LABEL_132;
  }
  if (v107)
  {
    double availableDeviceStorageInMB = self->_availableDeviceStorageInMB;
    [v4 availableDeviceStorageInMB];
    if (availableDeviceStorageInMB != v109) {
      goto LABEL_132;
    }
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self modelNumber];
  unint64_t v6 = [v4 modelNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v110 = [(SISchemaDailyDeviceStatus *)self modelNumber];
  if (v110)
  {
    long long v111 = (void *)v110;
    objc_super v112 = [(SISchemaDailyDeviceStatus *)self modelNumber];
    v113 = [v4 modelNumber];
    int v114 = [v112 isEqual:v113];

    if (!v114) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self regionInfo];
  unint64_t v6 = [v4 regionInfo];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v115 = [(SISchemaDailyDeviceStatus *)self regionInfo];
  if (v115)
  {
    uint64_t v116 = (void *)v115;
    v117 = [(SISchemaDailyDeviceStatus *)self regionInfo];
    v118 = [v4 regionInfo];
    int v119 = [v117 isEqual:v118];

    if (!v119) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self storefrontId];
  unint64_t v6 = [v4 storefrontId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_131;
  }
  uint64_t v120 = [(SISchemaDailyDeviceStatus *)self storefrontId];
  if (v120)
  {
    v121 = (void *)v120;
    v122 = [(SISchemaDailyDeviceStatus *)self storefrontId];
    v123 = [v4 storefrontId];
    int v124 = [v122 isEqual:v123];

    if (!v124) {
      goto LABEL_132;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self installedVoices];
  unint64_t v6 = [v4 installedVoices];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_131:

    goto LABEL_132;
  }
  uint64_t v125 = [(SISchemaDailyDeviceStatus *)self installedVoices];
  if (!v125)
  {

LABEL_135:
    BOOL v130 = 1;
    goto LABEL_133;
  }
  v126 = (void *)v125;
  v127 = [(SISchemaDailyDeviceStatus *)self installedVoices];
  v128 = [v4 installedVoices];
  char v129 = [v127 isEqual:v128];

  if (v129) {
    goto LABEL_135;
  }
LABEL_132:
  BOOL v130 = 0;
LABEL_133:

  return v130;
}

- (void)writeTo:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SISchemaDailyDeviceStatus *)self siriDeviceID];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unint64_t v6 = [(SISchemaDailyDeviceStatus *)self siriSpeechID];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(SISchemaDailyDeviceStatus *)self sharedUserId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  unint64_t v9 = [(SISchemaDailyDeviceStatus *)self locale];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  __int16 v10 = [(SISchemaDailyDeviceStatus *)self deviceType];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(SISchemaDailyDeviceStatus *)self deviceOs];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(SISchemaDailyDeviceStatus *)self deviceBuild];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  uint64_t v13 = [(SISchemaDailyDeviceStatus *)self enabledStatus];

  if (v13)
  {
    uint64_t v14 = [(SISchemaDailyDeviceStatus *)self enabledStatus];
    PBDataWriterWriteSubmessage();
  }
  v15 = [(SISchemaDailyDeviceStatus *)self activeStatus];

  if (v15)
  {
    int v16 = [(SISchemaDailyDeviceStatus *)self activeStatus];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(SISchemaDailyDeviceStatus *)self personalization];

  if (v17)
  {
    double v18 = [(SISchemaDailyDeviceStatus *)self personalization];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v19 = [(SISchemaDailyDeviceStatus *)self multiUserState];

  if (v19)
  {
    NSUInteger v20 = [(SISchemaDailyDeviceStatus *)self multiUserState];
    PBDataWriterWriteSubmessage();
  }
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v21 = (__int16)self->_has;
    if ((v21 & 8) == 0)
    {
LABEL_29:
      if ((v21 & 0x10) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v21 & 8) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_30:
  }
    PBDataWriterWriteInt32Field();
LABEL_31:
  NSUInteger v22 = [(SISchemaDailyDeviceStatus *)self aggregatedMetrics];

  if (v22)
  {
    unsigned int v23 = [(SISchemaDailyDeviceStatus *)self aggregatedMetrics];
    PBDataWriterWriteSubmessage();
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v24 = self->_linkedAccessoryStates;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v55 != v27) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v26);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v29 = [(SISchemaDailyDeviceStatus *)self multiUserSetup];

  if (v29)
  {
    unint64_t v30 = [(SISchemaDailyDeviceStatus *)self multiUserSetup];
    PBDataWriterWriteSubmessage();
  }
  __int16 v31 = (__int16)self->_has;
  if ((v31 & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 v31 = (__int16)self->_has;
  }
  if ((v31 & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v32 = self->_enabledDictationLocales;
  uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(v32);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v34);
  }

  __int16 v37 = (__int16)self->_has;
  if ((v37 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v37 = (__int16)self->_has;
  }
  if ((v37 & 0x200) != 0) {
    PBDataWriterWriteDoubleField();
  }
  NSUInteger v38 = [(SISchemaDailyDeviceStatus *)self modelNumber];

  if (v38) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v39 = [(SISchemaDailyDeviceStatus *)self regionInfo];

  if (v39) {
    PBDataWriterWriteStringField();
  }
  uint64_t v40 = [(SISchemaDailyDeviceStatus *)self storefrontId];

  if (v40) {
    PBDataWriterWriteStringField();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  int v41 = self->_installedVoices;
  uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(v41);
        }
        objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * k), "intValue", (void)v46);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v43);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDailyDeviceStatusReadFrom(self, (uint64_t)a3);
}

- (int)installedVoicesAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_installedVoices objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)installedVoicesCount
{
  return [(NSArray *)self->_installedVoices count];
}

- (void)addInstalledVoices:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  installedVoices = self->_installedVoices;
  if (!installedVoices)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_installedVoices;
    self->_installedVoices = v6;

    installedVoices = self->_installedVoices;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)installedVoices addObject:v8];
}

- (void)clearInstalledVoices
{
}

- (void)deleteStorefrontId
{
}

- (BOOL)hasStorefrontId
{
  return self->_storefrontId != 0;
}

- (void)deleteRegionInfo
{
}

- (BOOL)hasRegionInfo
{
  return self->_regionInfo != 0;
}

- (void)deleteModelNumber
{
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (void)deleteAvailableDeviceStorageInMB
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAvailableDeviceStorageInMB:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAvailableDeviceStorageInMB
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAvailableDeviceStorageInMB:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_double availableDeviceStorageInMB = a3;
}

- (void)deleteDeviceCapacityInGB
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasDeviceCapacityInGB:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDeviceCapacityInGB
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDeviceCapacityInGB:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int deviceCapacityInGB = a3;
}

- (id)enabledDictationLocalesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_enabledDictationLocales objectAtIndexedSubscript:a3];
}

- (unint64_t)enabledDictationLocalesCount
{
  return [(NSArray *)self->_enabledDictationLocales count];
}

- (void)addEnabledDictationLocales:(id)a3
{
  id v4 = a3;
  enabledDictationLocales = self->_enabledDictationLocales;
  id v8 = v4;
  if (!enabledDictationLocales)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_enabledDictationLocales;
    self->_enabledDictationLocales = v6;

    id v4 = v8;
    enabledDictationLocales = self->_enabledDictationLocales;
  }
  [(NSArray *)enabledDictationLocales addObject:v4];
}

- (void)clearEnabledDictationLocales
{
}

- (void)deleteStoreCountryCode
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasStoreCountryCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStoreCountryCode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setStoreCountryCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int storeCountryCode = a3;
}

- (void)deleteQueuedAtTimestampHourInMs
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasQueuedAtTimestampHourInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQueuedAtTimestampHourInMs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setQueuedAtTimestampHourInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unint64_t queuedAtTimestampHourInMs = a3;
}

- (void)deleteMultiUserSetup
{
}

- (BOOL)hasMultiUserSetup
{
  return self->_multiUserSetup != 0;
}

- (void)deleteSiriInputLocale
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSiriInputLocale
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSiriInputLocale:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int siriInputLocale = a3;
}

- (id)linkedAccessoryStateAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_linkedAccessoryStates objectAtIndexedSubscript:a3];
}

- (unint64_t)linkedAccessoryStateCount
{
  return [(NSArray *)self->_linkedAccessoryStates count];
}

- (void)addLinkedAccessoryState:(id)a3
{
  id v4 = a3;
  linkedAccessoryStates = self->_linkedAccessoryStates;
  id v8 = v4;
  if (!linkedAccessoryStates)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_linkedAccessoryStates;
    self->_linkedAccessoryStates = v6;

    id v4 = v8;
    linkedAccessoryStates = self->_linkedAccessoryStates;
  }
  [(NSArray *)linkedAccessoryStates addObject:v4];
}

- (void)clearLinkedAccessoryState
{
}

- (void)deleteAggregatedMetrics
{
}

- (BOOL)hasAggregatedMetrics
{
  return self->_aggregatedMetrics != 0;
}

- (void)deleteSpokenNotificationsWhitelistSettings
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasSpokenNotificationsWhitelistSettings:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSpokenNotificationsWhitelistSettings
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSpokenNotificationsWhitelistSettings:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int spokenNotificationsWhitelistSettings = a3;
}

- (void)deleteSpokenNotificationsControlCenterModuleEnabled
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSpokenNotificationsControlCenterModuleEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int spokenNotificationsControlCenterModuleEnabled = a3;
}

- (void)deleteSpokenNotificationsproxCardSeen
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasSpokenNotificationsproxCardSeen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSpokenNotificationsproxCardSeen
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSpokenNotificationsproxCardSeen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int spokenNotificationsproxCardSeen = a3;
}

- (void)deleteMultiUserState
{
}

- (BOOL)hasMultiUserState
{
  return self->_multiUserState != 0;
}

- (void)deletePersonalization
{
}

- (BOOL)hasPersonalization
{
  return self->_personalization != 0;
}

- (void)deleteActiveStatus
{
}

- (BOOL)hasActiveStatus
{
  return self->_activeStatus != 0;
}

- (void)deleteEnabledStatus
{
}

- (BOOL)hasEnabledStatus
{
  return self->_enabledStatus != 0;
}

- (void)deleteDeviceBuild
{
}

- (BOOL)hasDeviceBuild
{
  return self->_deviceBuild != 0;
}

- (void)deleteDeviceOs
{
}

- (BOOL)hasDeviceOs
{
  return self->_deviceOs != 0;
}

- (void)deleteDeviceType
{
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteLocale
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteAssistantRecordPublishTimestampMs
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasAssistantRecordPublishTimestampMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAssistantRecordPublishTimestampMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAssistantRecordPublishTimestampMs:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int64_t assistantRecordPublishTimestampMs = a3;
}

- (void)deleteClientDeviceSamplingTimestampMs
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasClientDeviceSamplingTimestampMs:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasClientDeviceSamplingTimestampMs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setClientDeviceSamplingTimestampMs:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int64_t clientDeviceSamplingTimestampMs = a3;
}

- (void)deleteSharedUserId
{
}

- (BOOL)hasSharedUserId
{
  return self->_sharedUserId != 0;
}

- (void)deleteSiriSpeechID
{
}

- (BOOL)hasSiriSpeechID
{
  return self->_siriSpeechID != 0;
}

- (void)deleteSiriDeviceID
{
}

- (BOOL)hasSiriDeviceID
{
  return self->_siriDeviceID != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.siri.heartbeat.DailyDeviceStatus";
}

- (int)getAnyEventType
{
  return 3;
}

@end