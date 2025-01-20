@interface DIMSchemaDIMDeviceFixedContext
- (BOOL)hasAvailableDictationKeyboards;
- (BOOL)hasCountryCode;
- (BOOL)hasDataCollectionId;
- (BOOL)hasDataSharingOptInState;
- (BOOL)hasDataSharingSettings;
- (BOOL)hasDeviceType;
- (BOOL)hasEffectiveSystemLanguage;
- (BOOL)hasEntitySyncSettings;
- (BOOL)hasHomeKitConfiguration;
- (BOOL)hasIsLowPowerModeEnabled;
- (BOOL)hasIsStoreDemoMode;
- (BOOL)hasProgramCode;
- (BOOL)hasSearchDataOptOutState;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasSiriInputLocaleV2;
- (BOOL)hasSiriVoiceSettings;
- (BOOL)hasSystemBuild;
- (BOOL)hasSystemLocale;
- (BOOL)hasSystemLocaleV2;
- (BOOL)hasTimeIntervalSince1970;
- (BOOL)hasTimezoneOffset;
- (BOOL)hasWatchDeviceAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isStoreDemoMode;
- (BOOL)readFrom:(id)a3;
- (DIMSchemaDIMDataSharingSettings)dataSharingSettings;
- (DIMSchemaDIMDeviceFixedContext)initWithDictionary:(id)a3;
- (DIMSchemaDIMDeviceFixedContext)initWithJSON:(id)a3;
- (DIMSchemaDIMWatchDeviceAttributes)watchDeviceAttributes;
- (DIMSchemaEntitySyncSettings)entitySyncSettings;
- (NSArray)preferredLanguages;
- (NSData)jsonData;
- (NSString)dataCollectionId;
- (NSString)deviceType;
- (NSString)effectiveSystemLanguage;
- (NSString)systemBuild;
- (NSString)timezoneOffset;
- (SISchemaISOLocale)siriInputLocaleV2;
- (SISchemaISOLocale)systemLocaleV2;
- (SISchemaVoiceSettings)siriVoiceSettings;
- (double)timeIntervalSince1970;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)preferredLanguagesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)countryCode;
- (int)dataSharingOptInState;
- (int)homeKitConfiguration;
- (int)programCode;
- (int)searchDataOptOutState;
- (int)siriInputLocale;
- (int)systemLocale;
- (unint64_t)hash;
- (unint64_t)preferredLanguagesCount;
- (unint64_t)whichDeviceattributes;
- (unsigned)availableDictationKeyboards;
- (void)addPreferredLanguages:(id)a3;
- (void)clearPreferredLanguages;
- (void)deleteAvailableDictationKeyboards;
- (void)deleteCountryCode;
- (void)deleteDataCollectionId;
- (void)deleteDataSharingOptInState;
- (void)deleteDataSharingSettings;
- (void)deleteDeviceType;
- (void)deleteEffectiveSystemLanguage;
- (void)deleteEntitySyncSettings;
- (void)deleteHomeKitConfiguration;
- (void)deleteIsLowPowerModeEnabled;
- (void)deleteIsStoreDemoMode;
- (void)deleteProgramCode;
- (void)deleteSearchDataOptOutState;
- (void)deleteSiriInputLocale;
- (void)deleteSiriInputLocaleV2;
- (void)deleteSiriVoiceSettings;
- (void)deleteSystemBuild;
- (void)deleteSystemLocale;
- (void)deleteSystemLocaleV2;
- (void)deleteTimeIntervalSince1970;
- (void)deleteTimezoneOffset;
- (void)deleteWatchDeviceAttributes;
- (void)setAvailableDictationKeyboards:(unsigned int)a3;
- (void)setCountryCode:(int)a3;
- (void)setDataCollectionId:(id)a3;
- (void)setDataSharingOptInState:(int)a3;
- (void)setDataSharingSettings:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setEffectiveSystemLanguage:(id)a3;
- (void)setEntitySyncSettings:(id)a3;
- (void)setHasAvailableDictationKeyboards:(BOOL)a3;
- (void)setHasCountryCode:(BOOL)a3;
- (void)setHasDataCollectionId:(BOOL)a3;
- (void)setHasDataSharingOptInState:(BOOL)a3;
- (void)setHasDataSharingSettings:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasEffectiveSystemLanguage:(BOOL)a3;
- (void)setHasEntitySyncSettings:(BOOL)a3;
- (void)setHasHomeKitConfiguration:(BOOL)a3;
- (void)setHasIsLowPowerModeEnabled:(BOOL)a3;
- (void)setHasIsStoreDemoMode:(BOOL)a3;
- (void)setHasProgramCode:(BOOL)a3;
- (void)setHasSearchDataOptOutState:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasSiriInputLocaleV2:(BOOL)a3;
- (void)setHasSiriVoiceSettings:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setHasSystemLocale:(BOOL)a3;
- (void)setHasSystemLocaleV2:(BOOL)a3;
- (void)setHasTimeIntervalSince1970:(BOOL)a3;
- (void)setHasTimezoneOffset:(BOOL)a3;
- (void)setHasWatchDeviceAttributes:(BOOL)a3;
- (void)setHomeKitConfiguration:(int)a3;
- (void)setIsLowPowerModeEnabled:(BOOL)a3;
- (void)setIsStoreDemoMode:(BOOL)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setProgramCode:(int)a3;
- (void)setSearchDataOptOutState:(int)a3;
- (void)setSiriInputLocale:(int)a3;
- (void)setSiriInputLocaleV2:(id)a3;
- (void)setSiriVoiceSettings:(id)a3;
- (void)setSystemBuild:(id)a3;
- (void)setSystemLocale:(int)a3;
- (void)setSystemLocaleV2:(id)a3;
- (void)setTimeIntervalSince1970:(double)a3;
- (void)setTimezoneOffset:(id)a3;
- (void)setWatchDeviceAttributes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DIMSchemaDIMDeviceFixedContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DIMSchemaDIMDeviceFixedContext;
  v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  v6 = [(DIMSchemaDIMDeviceFixedContext *)self siriVoiceSettings];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DIMSchemaDIMDeviceFixedContext *)self deleteSiriVoiceSettings];
  }
  v9 = [(DIMSchemaDIMDeviceFixedContext *)self watchDeviceAttributes];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DIMSchemaDIMDeviceFixedContext *)self deleteWatchDeviceAttributes];
  }
  v12 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocaleV2];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(DIMSchemaDIMDeviceFixedContext *)self deleteSystemLocaleV2];
  }
  v15 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocaleV2];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(DIMSchemaDIMDeviceFixedContext *)self deleteSiriInputLocaleV2];
  }
  v18 = [(DIMSchemaDIMDeviceFixedContext *)self entitySyncSettings];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(DIMSchemaDIMDeviceFixedContext *)self deleteEntitySyncSettings];
  }
  v21 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingSettings];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(DIMSchemaDIMDeviceFixedContext *)self deleteDataSharingSettings];
  }

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
  objc_storeStrong((id *)&self->_dataSharingSettings, 0);
  objc_storeStrong((id *)&self->_entitySyncSettings, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_effectiveSystemLanguage, 0);
  objc_storeStrong((id *)&self->_dataCollectionId, 0);
  objc_storeStrong((id *)&self->_siriInputLocaleV2, 0);
  objc_storeStrong((id *)&self->_systemLocaleV2, 0);
  objc_storeStrong((id *)&self->_watchDeviceAttributes, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_timezoneOffset, 0);
  objc_storeStrong((id *)&self->_siriVoiceSettings, 0);
}

- (void)setHasDataSharingSettings:(BOOL)a3
{
  self->_hasEffectiveSystemLanguage = a3;
}

- (void)setHasEntitySyncSettings:(BOOL)a3
{
  self->_hasDataCollectionId = a3;
}

- (void)setHasEffectiveSystemLanguage:(BOOL)a3
{
  self->_hasSiriInputLocaleV2 = a3;
}

- (void)setHasDataCollectionId:(BOOL)a3
{
  self->_hasSystemLocaleV2 = a3;
}

- (void)setHasSiriInputLocaleV2:(BOOL)a3
{
  self->_hasWatchDeviceAttributes = a3;
}

- (void)setHasSystemLocaleV2:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasWatchDeviceAttributes:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (BOOL)hasWatchDeviceAttributes
{
  return self->_hasDeviceType;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  self->_hasTimezoneOffset = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  self->_hasSiriVoiceSettings = a3;
}

- (void)setHasTimezoneOffset:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSiriVoiceSettings:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (int)searchDataOptOutState
{
  return self->_searchDataOptOutState;
}

- (unsigned)availableDictationKeyboards
{
  return self->_availableDictationKeyboards;
}

- (void)setDataSharingSettings:(id)a3
{
}

- (DIMSchemaDIMDataSharingSettings)dataSharingSettings
{
  return self->_dataSharingSettings;
}

- (void)setEntitySyncSettings:(id)a3
{
}

- (DIMSchemaEntitySyncSettings)entitySyncSettings
{
  return self->_entitySyncSettings;
}

- (int)homeKitConfiguration
{
  return self->_homeKitConfiguration;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setEffectiveSystemLanguage:(id)a3
{
}

- (NSString)effectiveSystemLanguage
{
  return self->_effectiveSystemLanguage;
}

- (void)setDataCollectionId:(id)a3
{
}

- (NSString)dataCollectionId
{
  return self->_dataCollectionId;
}

- (int)programCode
{
  return self->_programCode;
}

- (void)setSiriInputLocaleV2:(id)a3
{
}

- (SISchemaISOLocale)siriInputLocaleV2
{
  return self->_siriInputLocaleV2;
}

- (void)setSystemLocaleV2:(id)a3
{
}

- (SISchemaISOLocale)systemLocaleV2
{
  return self->_systemLocaleV2;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_isLowPowerModeEnabled;
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (BOOL)isStoreDemoMode
{
  return self->_isStoreDemoMode;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (int)countryCode
{
  return self->_countryCode;
}

- (void)setTimezoneOffset:(id)a3
{
}

- (NSString)timezoneOffset
{
  return self->_timezoneOffset;
}

- (int)dataSharingOptInState
{
  return self->_dataSharingOptInState;
}

- (void)setSiriVoiceSettings:(id)a3
{
}

- (SISchemaVoiceSettings)siriVoiceSettings
{
  return self->_siriVoiceSettings;
}

- (int)siriInputLocale
{
  return self->_siriInputLocale;
}

- (int)systemLocale
{
  return self->_systemLocale;
}

- (unint64_t)whichDeviceattributes
{
  return self->_whichDeviceattributes;
}

- (DIMSchemaDIMDeviceFixedContext)initWithDictionary:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)DIMSchemaDIMDeviceFixedContext;
  v5 = [(DIMSchemaDIMDeviceFixedContext *)&v69 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"systemLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setSystemLocale:](v5, "setSystemLocale:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setSiriInputLocale:](v5, "setSiriInputLocale:", [v7 intValue]);
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"siriVoiceSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaVoiceSettings alloc] initWithDictionary:v8];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setSiriVoiceSettings:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"dataSharingOptInState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setDataSharingOptInState:](v5, "setDataSharingOptInState:", [v10 intValue]);
    }
    v54 = v10;
    int v11 = [v4 objectForKeyedSubscript:@"timezoneOffset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setTimezoneOffset:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"countryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setCountryCode:](v5, "setCountryCode:", [v13 intValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    v64 = v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setDeviceType:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    v63 = v16;
    if (objc_opt_isKindOfClass())
    {
      int v17 = (void *)[v16 copy];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setSystemBuild:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"isStoreDemoMode"];
    objc_opt_class();
    v62 = v18;
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setIsStoreDemoMode:](v5, "setIsStoreDemoMode:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"timeIntervalSince1970"];
    objc_opt_class();
    v61 = v19;
    if (objc_opt_isKindOfClass())
    {
      [v19 doubleValue];
      -[DIMSchemaDIMDeviceFixedContext setTimeIntervalSince1970:](v5, "setTimeIntervalSince1970:");
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"watchDeviceAttributes"];
    objc_opt_class();
    v60 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[DIMSchemaDIMWatchDeviceAttributes alloc] initWithDictionary:v20];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setWatchDeviceAttributes:v21];
    }
    v56 = v7;
    v22 = [v4 objectForKeyedSubscript:@"isLowPowerModeEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setIsLowPowerModeEnabled:](v5, "setIsLowPowerModeEnabled:", [v22 BOOLValue]);
    }
    v51 = v22;
    uint64_t v23 = [v4 objectForKeyedSubscript:@"systemLocaleV2"];
    objc_opt_class();
    v59 = (void *)v23;
    if (objc_opt_isKindOfClass())
    {
      v24 = [[SISchemaISOLocale alloc] initWithDictionary:v23];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setSystemLocaleV2:v24];
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"siriInputLocaleV2"];
    objc_opt_class();
    v58 = (void *)v25;
    if (objc_opt_isKindOfClass())
    {
      v26 = [[SISchemaISOLocale alloc] initWithDictionary:v25];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setSiriInputLocaleV2:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"programCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setProgramCode:](v5, "setProgramCode:", [v27 intValue]);
    }
    v50 = v27;
    v28 = [v4 objectForKeyedSubscript:@"dataCollectionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setDataCollectionId:v29];
    }
    v52 = v13;
    v53 = v11;
    v55 = (void *)v8;
    v30 = objc_msgSend(v4, "objectForKeyedSubscript:", @"effectiveSystemLanguage", v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = (void *)[v30 copy];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setEffectiveSystemLanguage:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"preferredLanguages"];
    objc_opt_class();
    v57 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v33 = v32;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v65 objects:v70 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v66 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v39 = (void *)[v38 copy];
              [(DIMSchemaDIMDeviceFixedContext *)v5 addPreferredLanguages:v39];
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v65 objects:v70 count:16];
        }
        while (v35);
      }
    }
    v40 = [v4 objectForKeyedSubscript:@"homeKitConfiguration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setHomeKitConfiguration:](v5, "setHomeKitConfiguration:", [v40 intValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"entitySyncSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = [[DIMSchemaEntitySyncSettings alloc] initWithDictionary:v41];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setEntitySyncSettings:v42];
    }
    v43 = [v4 objectForKeyedSubscript:@"dataSharingSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [[DIMSchemaDIMDataSharingSettings alloc] initWithDictionary:v43];
      [(DIMSchemaDIMDeviceFixedContext *)v5 setDataSharingSettings:v44];
    }
    v45 = [v4 objectForKeyedSubscript:@"availableDictationKeyboards"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setAvailableDictationKeyboards:](v5, "setAvailableDictationKeyboards:", [v45 unsignedIntValue]);
    }
    v46 = [v4 objectForKeyedSubscript:@"searchDataOptOutState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DIMSchemaDIMDeviceFixedContext setSearchDataOptOutState:](v5, "setSearchDataOptOutState:", [v46 intValue]);
    }
    v47 = v5;
  }
  return v5;
}

- (DIMSchemaDIMDeviceFixedContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DIMSchemaDIMDeviceFixedContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DIMSchemaDIMDeviceFixedContext *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DIMSchemaDIMDeviceFixedContext availableDictationKeyboards](self, "availableDictationKeyboards"));
    [v3 setObject:v5 forKeyedSubscript:@"availableDictationKeyboards"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    unsigned int v6 = [(DIMSchemaDIMDeviceFixedContext *)self countryCode] - 1;
    if (v6 > 0xF9) {
      uint64_t v7 = @"COUNTRYCODE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EAD988[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"countryCode"];
  }
  if (self->_dataCollectionId)
  {
    uint64_t v8 = [(DIMSchemaDIMDeviceFixedContext *)self dataCollectionId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"dataCollectionId"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    unsigned int v10 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingOptInState] - 1;
    if (v10 > 2) {
      int v11 = @"UNKNOWN";
    }
    else {
      int v11 = off_1E5EAE158[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"dataSharingOptInState"];
  }
  if (self->_dataSharingSettings)
  {
    v12 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingSettings];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"dataSharingSettings"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"dataSharingSettings"];
    }
  }
  if (self->_deviceType)
  {
    v15 = [(DIMSchemaDIMDeviceFixedContext *)self deviceType];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"deviceType"];
  }
  if (self->_effectiveSystemLanguage)
  {
    int v17 = [(DIMSchemaDIMDeviceFixedContext *)self effectiveSystemLanguage];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"effectiveSystemLanguage"];
  }
  if (self->_entitySyncSettings)
  {
    v19 = [(DIMSchemaDIMDeviceFixedContext *)self entitySyncSettings];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"entitySyncSettings"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"entitySyncSettings"];
    }
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0)
  {
    int v27 = [(DIMSchemaDIMDeviceFixedContext *)self homeKitConfiguration];
    v28 = @"HOMEKITCONFIGURATION_UNKNOWN";
    if (v27 == 1) {
      v28 = @"HOMEKITCONFIGURATION_HH1";
    }
    if (v27 == 2) {
      v29 = @"HOMEKITCONFIGURATION_HH2";
    }
    else {
      v29 = v28;
    }
    [v3 setObject:v29 forKeyedSubscript:@"homeKitConfiguration"];
    __int16 v22 = (__int16)self->_has;
    if ((v22 & 0x40) == 0)
    {
LABEL_31:
      if ((v22 & 0x10) == 0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  else if ((v22 & 0x40) == 0)
  {
    goto LABEL_31;
  }
  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[DIMSchemaDIMDeviceFixedContext isLowPowerModeEnabled](self, "isLowPowerModeEnabled"));
  [v3 setObject:v30 forKeyedSubscript:@"isLowPowerModeEnabled"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_32:
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[DIMSchemaDIMDeviceFixedContext isStoreDemoMode](self, "isStoreDemoMode"));
    [v3 setObject:v23 forKeyedSubscript:@"isStoreDemoMode"];
  }
LABEL_33:
  if (self->_preferredLanguages)
  {
    v24 = [(DIMSchemaDIMDeviceFixedContext *)self preferredLanguages];
    uint64_t v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"preferredLanguages"];
  }
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    unsigned int v31 = [(DIMSchemaDIMDeviceFixedContext *)self programCode] - 1;
    if (v31 > 4) {
      v32 = @"PROGRAMCODE_UNKNOWN";
    }
    else {
      v32 = off_1E5EAE170[v31];
    }
    [v3 setObject:v32 forKeyedSubscript:@"programCode"];
    __int16 v26 = (__int16)self->_has;
    if ((v26 & 0x400) == 0)
    {
LABEL_37:
      if ((v26 & 2) == 0) {
        goto LABEL_61;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_37;
  }
  int v33 = [(DIMSchemaDIMDeviceFixedContext *)self searchDataOptOutState];
  uint64_t v34 = @"SEARCHDATAOPTOUTSTATE_UNKNOWN";
  if (v33 == 1) {
    uint64_t v34 = @"SEARCHDATAOPTOUTSTATE_OPTED_IN";
  }
  if (v33 == 2) {
    uint64_t v35 = @"SEARCHDATAOPTOUTSTATE_OPTED_OUT";
  }
  else {
    uint64_t v35 = v34;
  }
  [v3 setObject:v35 forKeyedSubscript:@"searchDataOptOutState"];
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_57:
    unsigned int v36 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocale] - 1;
    if (v36 > 0x3D) {
      v37 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v37 = off_1E5EAE198[v36];
    }
    [v3 setObject:v37 forKeyedSubscript:@"siriInputLocale"];
  }
LABEL_61:
  if (self->_siriInputLocaleV2)
  {
    v38 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocaleV2];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"siriInputLocaleV2"];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v40 forKeyedSubscript:@"siriInputLocaleV2"];
    }
  }
  if (self->_siriVoiceSettings)
  {
    v41 = [(DIMSchemaDIMDeviceFixedContext *)self siriVoiceSettings];
    v42 = [v41 dictionaryRepresentation];
    if (v42)
    {
      [v3 setObject:v42 forKeyedSubscript:@"siriVoiceSettings"];
    }
    else
    {
      v43 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v43 forKeyedSubscript:@"siriVoiceSettings"];
    }
  }
  if (self->_systemBuild)
  {
    v44 = [(DIMSchemaDIMDeviceFixedContext *)self systemBuild];
    v45 = (void *)[v44 copy];
    [v3 setObject:v45 forKeyedSubscript:@"systemBuild"];
  }
  if (*(_WORD *)&self->_has)
  {
    unsigned int v46 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocale] - 1;
    if (v46 > 0x3D) {
      v47 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v47 = off_1E5EAE198[v46];
    }
    [v3 setObject:v47 forKeyedSubscript:@"systemLocale"];
  }
  if (self->_systemLocaleV2)
  {
    v48 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocaleV2];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"systemLocaleV2"];
    }
    else
    {
      v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"systemLocaleV2"];
    }
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v51 = NSNumber;
    [(DIMSchemaDIMDeviceFixedContext *)self timeIntervalSince1970];
    v52 = objc_msgSend(v51, "numberWithDouble:");
    [v3 setObject:v52 forKeyedSubscript:@"timeIntervalSince1970"];
  }
  if (self->_timezoneOffset)
  {
    v53 = [(DIMSchemaDIMDeviceFixedContext *)self timezoneOffset];
    v54 = (void *)[v53 copy];
    [v3 setObject:v54 forKeyedSubscript:@"timezoneOffset"];
  }
  if (self->_watchDeviceAttributes)
  {
    v55 = [(DIMSchemaDIMDeviceFixedContext *)self watchDeviceAttributes];
    v56 = [v55 dictionaryRepresentation];
    if (v56)
    {
      [v3 setObject:v56 forKeyedSubscript:@"watchDeviceAttributes"];
    }
    else
    {
      v57 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v57 forKeyedSubscript:@"watchDeviceAttributes"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v58 = v3;

  return v58;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v33 = 2654435761 * self->_systemLocale;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v32 = 2654435761 * self->_siriInputLocale;
      goto LABEL_6;
    }
  }
  uint64_t v32 = 0;
LABEL_6:
  unint64_t v31 = [(SISchemaVoiceSettings *)self->_siriVoiceSettings hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v30 = 2654435761 * self->_dataSharingOptInState;
  }
  else {
    uint64_t v30 = 0;
  }
  NSUInteger v29 = [(NSString *)self->_timezoneOffset hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v28 = 2654435761 * self->_countryCode;
  }
  else {
    uint64_t v28 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_deviceType hash];
  NSUInteger v26 = [(NSString *)self->_systemBuild hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    uint64_t v25 = 2654435761 * self->_isStoreDemoMode;
    if ((v4 & 0x20) != 0) {
      goto LABEL_14;
    }
LABEL_19:
    unint64_t v9 = 0;
    goto LABEL_22;
  }
  uint64_t v25 = 0;
  if ((v4 & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_14:
  double timeIntervalSince1970 = self->_timeIntervalSince1970;
  double v6 = -timeIntervalSince1970;
  if (timeIntervalSince1970 >= 0.0) {
    double v6 = self->_timeIntervalSince1970;
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
  unint64_t v24 = v9;
  unint64_t v23 = [(DIMSchemaDIMWatchDeviceAttributes *)self->_watchDeviceAttributes hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v22 = 2654435761 * self->_isLowPowerModeEnabled;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v21 = [(SISchemaISOLocale *)self->_systemLocaleV2 hash];
  unint64_t v10 = [(SISchemaISOLocale *)self->_siriInputLocaleV2 hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v11 = 2654435761 * self->_programCode;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_dataCollectionId hash];
  NSUInteger v13 = [(NSString *)self->_effectiveSystemLanguage hash];
  uint64_t v14 = [(NSArray *)self->_preferredLanguages hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v15 = 2654435761 * self->_homeKitConfiguration;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = [(DIMSchemaEntitySyncSettings *)self->_entitySyncSettings hash];
  unint64_t v17 = [(DIMSchemaDIMDataSharingSettings *)self->_dataSharingSettings hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v18 = 2654435761 * self->_availableDictationKeyboards;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_33;
    }
LABEL_35:
    uint64_t v19 = 0;
    return v32 ^ v33 ^ v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_35;
  }
LABEL_33:
  uint64_t v19 = 2654435761 * self->_searchDataOptOutState;
  return v32 ^ v33 ^ v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (BOOL)isEqual:(id)a3
{
  __int16 v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_92;
  }
  unint64_t whichDeviceattributes = self->_whichDeviceattributes;
  if (whichDeviceattributes != [v4 whichDeviceattributes]) {
    goto LABEL_92;
  }
  $DEE1C978DEBF0C656FD98E8056DDEAEC has = self->_has;
  unsigned int v7 = v4[88];
  if ((*(unsigned char *)&has & 1) != (v7 & 1)) {
    goto LABEL_92;
  }
  if (*(unsigned char *)&has)
  {
    int systemLocale = self->_systemLocale;
    if (systemLocale != [v4 systemLocale]) {
      goto LABEL_92;
    }
    $DEE1C978DEBF0C656FD98E8056DDEAEC has = self->_has;
    unsigned int v7 = v4[88];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1)) {
    goto LABEL_92;
  }
  if (v9)
  {
    int siriInputLocale = self->_siriInputLocale;
    if (siriInputLocale != [v4 siriInputLocale]) {
      goto LABEL_92;
    }
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self siriVoiceSettings];
  NSUInteger v12 = [v4 siriVoiceSettings];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v13 = [(DIMSchemaDIMDeviceFixedContext *)self siriVoiceSettings];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(DIMSchemaDIMDeviceFixedContext *)self siriVoiceSettings];
    unint64_t v16 = [v4 siriVoiceSettings];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  int v18 = (*(_WORD *)&self->_has >> 2) & 1;
  if (v18 != ((v4[88] >> 2) & 1)) {
    goto LABEL_92;
  }
  if (v18)
  {
    int dataSharingOptInState = self->_dataSharingOptInState;
    if (dataSharingOptInState != [v4 dataSharingOptInState]) {
      goto LABEL_92;
    }
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self timezoneOffset];
  NSUInteger v12 = [v4 timezoneOffset];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v20 = [(DIMSchemaDIMDeviceFixedContext *)self timezoneOffset];
  if (v20)
  {
    unint64_t v21 = (void *)v20;
    uint64_t v22 = [(DIMSchemaDIMDeviceFixedContext *)self timezoneOffset];
    unint64_t v23 = [v4 timezoneOffset];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  int v25 = (*(_WORD *)&self->_has >> 3) & 1;
  if (v25 != ((v4[88] >> 3) & 1)) {
    goto LABEL_92;
  }
  if (v25)
  {
    int countryCode = self->_countryCode;
    if (countryCode != [v4 countryCode]) {
      goto LABEL_92;
    }
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self deviceType];
  NSUInteger v12 = [v4 deviceType];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v27 = [(DIMSchemaDIMDeviceFixedContext *)self deviceType];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    NSUInteger v29 = [(DIMSchemaDIMDeviceFixedContext *)self deviceType];
    uint64_t v30 = [v4 deviceType];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self systemBuild];
  NSUInteger v12 = [v4 systemBuild];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v32 = [(DIMSchemaDIMDeviceFixedContext *)self systemBuild];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(DIMSchemaDIMDeviceFixedContext *)self systemBuild];
    uint64_t v35 = [v4 systemBuild];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  $DEE1C978DEBF0C656FD98E8056DDEAEC v37 = self->_has;
  int v38 = (*(unsigned int *)&v37 >> 4) & 1;
  unsigned int v39 = v4[88];
  if (v38 != ((v39 >> 4) & 1)) {
    goto LABEL_92;
  }
  if (v38)
  {
    int isStoreDemoMode = self->_isStoreDemoMode;
    if (isStoreDemoMode != [v4 isStoreDemoMode]) {
      goto LABEL_92;
    }
    $DEE1C978DEBF0C656FD98E8056DDEAEC v37 = self->_has;
    unsigned int v39 = v4[88];
  }
  int v41 = (*(unsigned int *)&v37 >> 5) & 1;
  if (v41 != ((v39 >> 5) & 1)) {
    goto LABEL_92;
  }
  if (v41)
  {
    double timeIntervalSince1970 = self->_timeIntervalSince1970;
    [v4 timeIntervalSince1970];
    if (timeIntervalSince1970 != v43) {
      goto LABEL_92;
    }
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self watchDeviceAttributes];
  NSUInteger v12 = [v4 watchDeviceAttributes];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v44 = [(DIMSchemaDIMDeviceFixedContext *)self watchDeviceAttributes];
  if (v44)
  {
    v45 = (void *)v44;
    unsigned int v46 = [(DIMSchemaDIMDeviceFixedContext *)self watchDeviceAttributes];
    v47 = [v4 watchDeviceAttributes];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  int v49 = (*(_WORD *)&self->_has >> 6) & 1;
  if (v49 != ((v4[88] >> 6) & 1)) {
    goto LABEL_92;
  }
  if (v49)
  {
    int isLowPowerModeEnabled = self->_isLowPowerModeEnabled;
    if (isLowPowerModeEnabled != [v4 isLowPowerModeEnabled]) {
      goto LABEL_92;
    }
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocaleV2];
  NSUInteger v12 = [v4 systemLocaleV2];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v51 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocaleV2];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocaleV2];
    v54 = [v4 systemLocaleV2];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocaleV2];
  NSUInteger v12 = [v4 siriInputLocaleV2];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v56 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocaleV2];
  if (v56)
  {
    v57 = (void *)v56;
    id v58 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocaleV2];
    v59 = [v4 siriInputLocaleV2];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  int v61 = (*(_WORD *)&self->_has >> 7) & 1;
  if (v61 != ((v4[88] >> 7) & 1)) {
    goto LABEL_92;
  }
  if (v61)
  {
    int programCode = self->_programCode;
    if (programCode != [v4 programCode]) {
      goto LABEL_92;
    }
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self dataCollectionId];
  NSUInteger v12 = [v4 dataCollectionId];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v63 = [(DIMSchemaDIMDeviceFixedContext *)self dataCollectionId];
  if (v63)
  {
    v64 = (void *)v63;
    long long v65 = [(DIMSchemaDIMDeviceFixedContext *)self dataCollectionId];
    long long v66 = [v4 dataCollectionId];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self effectiveSystemLanguage];
  NSUInteger v12 = [v4 effectiveSystemLanguage];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v68 = [(DIMSchemaDIMDeviceFixedContext *)self effectiveSystemLanguage];
  if (v68)
  {
    objc_super v69 = (void *)v68;
    v70 = [(DIMSchemaDIMDeviceFixedContext *)self effectiveSystemLanguage];
    uint64_t v71 = [v4 effectiveSystemLanguage];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self preferredLanguages];
  NSUInteger v12 = [v4 preferredLanguages];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v73 = [(DIMSchemaDIMDeviceFixedContext *)self preferredLanguages];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(DIMSchemaDIMDeviceFixedContext *)self preferredLanguages];
    v76 = [v4 preferredLanguages];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  int v78 = HIBYTE(*(_WORD *)&self->_has) & 1;
  if (v78 != (HIBYTE(v4[88]) & 1)) {
    goto LABEL_92;
  }
  if (v78)
  {
    int homeKitConfiguration = self->_homeKitConfiguration;
    if (homeKitConfiguration != [v4 homeKitConfiguration]) {
      goto LABEL_92;
    }
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self entitySyncSettings];
  NSUInteger v12 = [v4 entitySyncSettings];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_91;
  }
  uint64_t v80 = [(DIMSchemaDIMDeviceFixedContext *)self entitySyncSettings];
  if (v80)
  {
    v81 = (void *)v80;
    v82 = [(DIMSchemaDIMDeviceFixedContext *)self entitySyncSettings];
    v83 = [v4 entitySyncSettings];
    int v84 = [v82 isEqual:v83];

    if (!v84) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  uint64_t v11 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingSettings];
  NSUInteger v12 = [v4 dataSharingSettings];
  if ((v11 == 0) == (v12 != 0))
  {
LABEL_91:

    goto LABEL_92;
  }
  uint64_t v85 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingSettings];
  if (v85)
  {
    v86 = (void *)v85;
    v87 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingSettings];
    v88 = [v4 dataSharingSettings];
    int v89 = [v87 isEqual:v88];

    if (!v89) {
      goto LABEL_92;
    }
  }
  else
  {
  }
  $DEE1C978DEBF0C656FD98E8056DDEAEC v92 = self->_has;
  int v93 = (*(unsigned int *)&v92 >> 9) & 1;
  unsigned int v94 = v4[88];
  if (v93 == ((v94 >> 9) & 1))
  {
    if (v93)
    {
      unsigned int availableDictationKeyboards = self->_availableDictationKeyboards;
      if (availableDictationKeyboards != [v4 availableDictationKeyboards]) {
        goto LABEL_92;
      }
      $DEE1C978DEBF0C656FD98E8056DDEAEC v92 = self->_has;
      unsigned int v94 = v4[88];
    }
    int v96 = (*(unsigned int *)&v92 >> 10) & 1;
    if (v96 == ((v94 >> 10) & 1))
    {
      if (!v96
        || (int searchDataOptOutState = self->_searchDataOptOutState,
            searchDataOptOutState == [v4 searchDataOptOutState]))
      {
        BOOL v90 = 1;
        goto LABEL_93;
      }
    }
  }
LABEL_92:
  BOOL v90 = 0;
LABEL_93:

  return v90;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  double v6 = [(DIMSchemaDIMDeviceFixedContext *)self siriVoiceSettings];

  if (v6)
  {
    unsigned int v7 = [(DIMSchemaDIMDeviceFixedContext *)self siriVoiceSettings];
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  double v8 = [(DIMSchemaDIMDeviceFixedContext *)self timezoneOffset];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v9 = [(DIMSchemaDIMDeviceFixedContext *)self deviceType];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  unint64_t v10 = [(DIMSchemaDIMDeviceFixedContext *)self systemBuild];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0) {
    PBDataWriterWriteDoubleField();
  }
  NSUInteger v12 = [(DIMSchemaDIMDeviceFixedContext *)self watchDeviceAttributes];

  if (v12)
  {
    uint64_t v13 = [(DIMSchemaDIMDeviceFixedContext *)self watchDeviceAttributes];
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v14 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocaleV2];

  if (v14)
  {
    uint64_t v15 = [(DIMSchemaDIMDeviceFixedContext *)self systemLocaleV2];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocaleV2];

  if (v16)
  {
    int v17 = [(DIMSchemaDIMDeviceFixedContext *)self siriInputLocaleV2];
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v18 = [(DIMSchemaDIMDeviceFixedContext *)self dataCollectionId];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  uint64_t v19 = [(DIMSchemaDIMDeviceFixedContext *)self effectiveSystemLanguage];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = self->_preferredLanguages;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v22);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v25 = [(DIMSchemaDIMDeviceFixedContext *)self entitySyncSettings];

  if (v25)
  {
    NSUInteger v26 = [(DIMSchemaDIMDeviceFixedContext *)self entitySyncSettings];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v27 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingSettings];

  if (v27)
  {
    uint64_t v28 = [(DIMSchemaDIMDeviceFixedContext *)self dataSharingSettings];
    PBDataWriterWriteSubmessage();
  }
  __int16 v29 = (__int16)self->_has;
  if ((v29 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v29 = (__int16)self->_has;
  }
  if ((v29 & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMDeviceFixedContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteSearchDataOptOutState
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasSearchDataOptOutState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSearchDataOptOutState
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSearchDataOptOutState:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int searchDataOptOutState = a3;
}

- (void)deleteAvailableDictationKeyboards
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAvailableDictationKeyboards:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAvailableDictationKeyboards
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAvailableDictationKeyboards:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int availableDictationKeyboards = a3;
}

- (void)deleteDataSharingSettings
{
}

- (BOOL)hasDataSharingSettings
{
  return self->_dataSharingSettings != 0;
}

- (void)deleteEntitySyncSettings
{
}

- (BOOL)hasEntitySyncSettings
{
  return self->_entitySyncSettings != 0;
}

- (void)deleteHomeKitConfiguration
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasHomeKitConfiguration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasHomeKitConfiguration
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHomeKitConfiguration:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int homeKitConfiguration = a3;
}

- (id)preferredLanguagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_preferredLanguages objectAtIndexedSubscript:a3];
}

- (unint64_t)preferredLanguagesCount
{
  return [(NSArray *)self->_preferredLanguages count];
}

- (void)addPreferredLanguages:(id)a3
{
  id v4 = a3;
  preferredLanguages = self->_preferredLanguages;
  id v8 = v4;
  if (!preferredLanguages)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v7 = self->_preferredLanguages;
    self->_preferredLanguages = v6;

    id v4 = v8;
    preferredLanguages = self->_preferredLanguages;
  }
  [(NSArray *)preferredLanguages addObject:v4];
}

- (void)clearPreferredLanguages
{
}

- (void)deleteEffectiveSystemLanguage
{
}

- (BOOL)hasEffectiveSystemLanguage
{
  return self->_effectiveSystemLanguage != 0;
}

- (void)deleteDataCollectionId
{
}

- (BOOL)hasDataCollectionId
{
  return self->_dataCollectionId != 0;
}

- (void)deleteProgramCode
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasProgramCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasProgramCode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setProgramCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int programCode = a3;
}

- (void)deleteSiriInputLocaleV2
{
}

- (BOOL)hasSiriInputLocaleV2
{
  return self->_siriInputLocaleV2 != 0;
}

- (void)deleteSystemLocaleV2
{
}

- (BOOL)hasSystemLocaleV2
{
  return self->_systemLocaleV2 != 0;
}

- (void)deleteIsLowPowerModeEnabled
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsLowPowerModeEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsLowPowerModeEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsLowPowerModeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isLowPowerModeEnabled = a3;
}

- (void)deleteWatchDeviceAttributes
{
  if (self->_whichDeviceattributes == 100)
  {
    self->_unint64_t whichDeviceattributes = 0;
    self->_watchDeviceAttributes = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (DIMSchemaDIMWatchDeviceAttributes)watchDeviceAttributes
{
  if (self->_whichDeviceattributes == 100) {
    v2 = self->_watchDeviceAttributes;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setWatchDeviceAttributes:(id)a3
{
  unint64_t v3 = 100;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichDeviceattributes = v3;
  objc_storeStrong((id *)&self->_watchDeviceAttributes, a3);
}

- (void)deleteTimeIntervalSince1970
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_double timeIntervalSince1970 = a3;
}

- (void)deleteIsStoreDemoMode
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasIsStoreDemoMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsStoreDemoMode
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsStoreDemoMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int isStoreDemoMode = a3;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteDeviceType
{
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteCountryCode
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasCountryCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCountryCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCountryCode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int countryCode = a3;
}

- (void)deleteTimezoneOffset
{
}

- (BOOL)hasTimezoneOffset
{
  return self->_timezoneOffset != 0;
}

- (void)deleteDataSharingOptInState
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasDataSharingOptInState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDataSharingOptInState
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDataSharingOptInState:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int dataSharingOptInState = a3;
}

- (void)deleteSiriVoiceSettings
{
}

- (BOOL)hasSiriVoiceSettings
{
  return self->_siriVoiceSettings != 0;
}

- (void)deleteSiriInputLocale
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSiriInputLocale
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSiriInputLocale:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int siriInputLocale = a3;
}

- (void)deleteSystemLocale
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasSystemLocale:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSystemLocale
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSystemLocale:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int systemLocale = a3;
}

@end