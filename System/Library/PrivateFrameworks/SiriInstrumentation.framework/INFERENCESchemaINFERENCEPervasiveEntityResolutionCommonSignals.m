@interface INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals
- (BOOL)hasCalendarDayOfWeek;
- (BOOL)hasCalendarHourOfDay;
- (BOOL)hasCalendarMonthOfYear;
- (BOOL)hasCalendarWeekOfMonth;
- (BOOL)hasChoicesCount;
- (BOOL)hasDeviceMotionState;
- (BOOL)hasDisambiguationReason;
- (BOOL)hasHistoricalDataCount;
- (BOOL)hasIsCarPlay;
- (BOOL)hasIsClientDaylight;
- (BOOL)hasIsClientNavigating;
- (BOOL)hasIsDeviceLockStatus;
- (BOOL)hasModelVersion;
- (BOOL)hasRawCountry;
- (BOOL)hasRawLanguage;
- (BOOL)hasRawLocale;
- (BOOL)hasRawRequestDeviceCategory;
- (BOOL)hasRawStateOrProvince;
- (BOOL)hasTimestampSec;
- (BOOL)hasTrialTreatmentId;
- (BOOL)hasUsecase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)usecase;
- (SISchemaUUID)trialTreatmentId;
- (SISchemaVersion)modelVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)calendarDayOfWeek;
- (int)calendarHourOfDay;
- (int)calendarMonthOfYear;
- (int)calendarWeekOfMonth;
- (int)choicesCount;
- (int)deviceMotionState;
- (int)disambiguationReason;
- (int)historicalDataCount;
- (int)isCarPlay;
- (int)isClientDaylight;
- (int)isClientNavigating;
- (int)isDeviceLockStatus;
- (int)rawCountry;
- (int)rawLanguage;
- (int)rawLocale;
- (int)rawRequestDeviceCategory;
- (int)rawStateOrProvince;
- (int64_t)timestampSec;
- (unint64_t)hash;
- (void)deleteCalendarDayOfWeek;
- (void)deleteCalendarHourOfDay;
- (void)deleteCalendarMonthOfYear;
- (void)deleteCalendarWeekOfMonth;
- (void)deleteChoicesCount;
- (void)deleteDeviceMotionState;
- (void)deleteDisambiguationReason;
- (void)deleteHistoricalDataCount;
- (void)deleteIsCarPlay;
- (void)deleteIsClientDaylight;
- (void)deleteIsClientNavigating;
- (void)deleteIsDeviceLockStatus;
- (void)deleteModelVersion;
- (void)deleteRawCountry;
- (void)deleteRawLanguage;
- (void)deleteRawLocale;
- (void)deleteRawRequestDeviceCategory;
- (void)deleteRawStateOrProvince;
- (void)deleteTimestampSec;
- (void)deleteTrialTreatmentId;
- (void)deleteUsecase;
- (void)setCalendarDayOfWeek:(int)a3;
- (void)setCalendarHourOfDay:(int)a3;
- (void)setCalendarMonthOfYear:(int)a3;
- (void)setCalendarWeekOfMonth:(int)a3;
- (void)setChoicesCount:(int)a3;
- (void)setDeviceMotionState:(int)a3;
- (void)setDisambiguationReason:(int)a3;
- (void)setHasCalendarDayOfWeek:(BOOL)a3;
- (void)setHasCalendarHourOfDay:(BOOL)a3;
- (void)setHasCalendarMonthOfYear:(BOOL)a3;
- (void)setHasCalendarWeekOfMonth:(BOOL)a3;
- (void)setHasChoicesCount:(BOOL)a3;
- (void)setHasDeviceMotionState:(BOOL)a3;
- (void)setHasDisambiguationReason:(BOOL)a3;
- (void)setHasHistoricalDataCount:(BOOL)a3;
- (void)setHasIsCarPlay:(BOOL)a3;
- (void)setHasIsClientDaylight:(BOOL)a3;
- (void)setHasIsClientNavigating:(BOOL)a3;
- (void)setHasIsDeviceLockStatus:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasRawCountry:(BOOL)a3;
- (void)setHasRawLanguage:(BOOL)a3;
- (void)setHasRawLocale:(BOOL)a3;
- (void)setHasRawRequestDeviceCategory:(BOOL)a3;
- (void)setHasRawStateOrProvince:(BOOL)a3;
- (void)setHasTimestampSec:(BOOL)a3;
- (void)setHasTrialTreatmentId:(BOOL)a3;
- (void)setHasUsecase:(BOOL)a3;
- (void)setHistoricalDataCount:(int)a3;
- (void)setIsCarPlay:(int)a3;
- (void)setIsClientDaylight:(int)a3;
- (void)setIsClientNavigating:(int)a3;
- (void)setIsDeviceLockStatus:(int)a3;
- (void)setModelVersion:(id)a3;
- (void)setRawCountry:(int)a3;
- (void)setRawLanguage:(int)a3;
- (void)setRawLocale:(int)a3;
- (void)setRawRequestDeviceCategory:(int)a3;
- (void)setRawStateOrProvince:(int)a3;
- (void)setTimestampSec:(int64_t)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)setUsecase:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self modelVersion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self deleteModelVersion];
  }
  v9 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self trialTreatmentId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self deleteTrialTreatmentId];
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
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_usecase, 0);
}

- (void)setHasTrialTreatmentId:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasUsecase = a3;
}

- (void)setHasUsecase:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (SISchemaUUID)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setModelVersion:(id)a3
{
}

- (SISchemaVersion)modelVersion
{
  return self->_modelVersion;
}

- (int)disambiguationReason
{
  return self->_disambiguationReason;
}

- (int)historicalDataCount
{
  return self->_historicalDataCount;
}

- (int)isCarPlay
{
  return self->_isCarPlay;
}

- (int)isClientNavigating
{
  return self->_isClientNavigating;
}

- (int)deviceMotionState
{
  return self->_deviceMotionState;
}

- (int)isDeviceLockStatus
{
  return self->_isDeviceLockStatus;
}

- (int)isClientDaylight
{
  return self->_isClientDaylight;
}

- (int)calendarMonthOfYear
{
  return self->_calendarMonthOfYear;
}

- (int)calendarWeekOfMonth
{
  return self->_calendarWeekOfMonth;
}

- (int)calendarDayOfWeek
{
  return self->_calendarDayOfWeek;
}

- (int)calendarHourOfDay
{
  return self->_calendarHourOfDay;
}

- (int)rawRequestDeviceCategory
{
  return self->_rawRequestDeviceCategory;
}

- (int)rawCountry
{
  return self->_rawCountry;
}

- (int)rawStateOrProvince
{
  return self->_rawStateOrProvince;
}

- (int)rawLocale
{
  return self->_rawLocale;
}

- (int)rawLanguage
{
  return self->_rawLanguage;
}

- (int64_t)timestampSec
{
  return self->_timestampSec;
}

- (int)choicesCount
{
  return self->_choicesCount;
}

- (void)setUsecase:(id)a3
{
}

- (NSString)usecase
{
  return self->_usecase;
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals;
  v5 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)&v51 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"usecase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)v5 setUsecase:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"choicesCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setChoicesCount:](v5, "setChoicesCount:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"timestampSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setTimestampSec:](v5, "setTimestampSec:", [v9 longLongValue]);
    }
    v45 = v8;
    v10 = [v4 objectForKeyedSubscript:@"rawLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawLanguage:](v5, "setRawLanguage:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"rawLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawLocale:](v5, "setRawLocale:", [v11 intValue]);
    }
    v12 = v9;
    objc_super v13 = [v4 objectForKeyedSubscript:@"rawStateOrProvince"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawStateOrProvince:](v5, "setRawStateOrProvince:", [v13 intValue]);
    }
    v14 = v6;
    v15 = [v4 objectForKeyedSubscript:@"rawCountry"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawCountry:](v5, "setRawCountry:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"rawRequestDeviceCategory"];
    objc_opt_class();
    v50 = v16;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setRawRequestDeviceCategory:](v5, "setRawRequestDeviceCategory:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"calendarHourOfDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarHourOfDay:](v5, "setCalendarHourOfDay:", [v17 intValue]);
    }
    v39 = v17;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"calendarDayOfWeek"];
    objc_opt_class();
    v49 = (void *)v18;
    v19 = v14;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarDayOfWeek:](v5, "setCalendarDayOfWeek:", [v49 intValue]);
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"calendarWeekOfMonth"];
    objc_opt_class();
    v48 = (void *)v20;
    v21 = v12;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarWeekOfMonth:](v5, "setCalendarWeekOfMonth:", [v48 intValue]);
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"calendarMonthOfYear"];
    objc_opt_class();
    v47 = (void *)v22;
    v23 = v10;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setCalendarMonthOfYear:](v5, "setCalendarMonthOfYear:", [v47 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"isClientDaylight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsClientDaylight:](v5, "setIsClientDaylight:", [v24 intValue]);
    }
    v41 = v13;
    v25 = [v4 objectForKeyedSubscript:@"isDeviceLockStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsDeviceLockStatus:](v5, "setIsDeviceLockStatus:", [v25 intValue]);
    }
    v40 = v15;
    v26 = objc_msgSend(v4, "objectForKeyedSubscript:", @"deviceMotionState", v25);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setDeviceMotionState:](v5, "setDeviceMotionState:", [v26 intValue]);
    }
    v38 = v24;
    v27 = [v4 objectForKeyedSubscript:@"isClientNavigating"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsClientNavigating:](v5, "setIsClientNavigating:", [v27 intValue]);
    }
    v46 = v19;
    v28 = [v4 objectForKeyedSubscript:@"isCarPlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setIsCarPlay:](v5, "setIsCarPlay:", [v28 intValue]);
    }
    v44 = v21;
    v29 = [v4 objectForKeyedSubscript:@"historicalDataCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setHistoricalDataCount:](v5, "setHistoricalDataCount:", [v29 intValue]);
    }
    v42 = v11;
    v43 = v23;
    v30 = [v4 objectForKeyedSubscript:@"disambiguationReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals setDisambiguationReason:](v5, "setDisambiguationReason:", [v30 intValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [[SISchemaVersion alloc] initWithDictionary:v31];
      [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)v5 setModelVersion:v32];
    }
    v33 = [v4 objectForKeyedSubscript:@"trialTreatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[SISchemaUUID alloc] initWithDictionary:v33];
      [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)v5 setTrialTreatmentId:v34];
    }
    v35 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self dictionaryRepresentation];
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
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  int v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarDayOfWeek](self, "calendarDayOfWeek"));
    [v3 setObject:v9 forKeyedSubscript:@"calendarDayOfWeek"];

    $8D9D7F62C73E045CB788A899FADF9E76 v10 = self->_has;
    int v5 = *(_DWORD *)&v10 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&v10 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarHourOfDay](self, "calendarHourOfDay"));
  [v3 setObject:v11 forKeyedSubscript:@"calendarHourOfDay"];

  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarMonthOfYear](self, "calendarMonthOfYear"));
  [v3 setObject:v12 forKeyedSubscript:@"calendarMonthOfYear"];

  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  objc_super v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals calendarWeekOfMonth](self, "calendarWeekOfMonth"));
  [v3 setObject:v13 forKeyedSubscript:@"calendarWeekOfMonth"];

  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals choicesCount](self, "choicesCount"));
  [v3 setObject:v14 forKeyedSubscript:@"choicesCount"];

  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals deviceMotionState](self, "deviceMotionState"));
  [v3 setObject:v15 forKeyedSubscript:@"deviceMotionState"];

  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_23:
  unsigned int v16 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self disambiguationReason]- 1;
  if (v16 > 2) {
    v17 = @"INFERENCEENTITYRESOLUTIONTYPE_UNKNOWN";
  }
  else {
    v17 = off_1E5EBB9E8[v16];
  }
  [v3 setObject:v17 forKeyedSubscript:@"disambiguationReason"];
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v5 & 0x10000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals historicalDataCount](self, "historicalDataCount"));
  [v3 setObject:v28 forKeyedSubscript:@"historicalDataCount"];

  LOWORD(v5) = self->_has;
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  v29 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isCarPlay](self, "isCarPlay"));
  [v3 setObject:v29 forKeyedSubscript:@"isCarPlay"];

  LOWORD(v5) = self->_has;
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  v30 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isClientDaylight](self, "isClientDaylight"));
  [v3 setObject:v30 forKeyedSubscript:@"isClientDaylight"];

  LOWORD(v5) = self->_has;
  if ((v5 & 0x4000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_48:
  v31 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isClientNavigating](self, "isClientNavigating"));
  [v3 setObject:v31 forKeyedSubscript:@"isClientNavigating"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals isDeviceLockStatus](self, "isDeviceLockStatus"));
    [v3 setObject:v6 forKeyedSubscript:@"isDeviceLockStatus"];
  }
LABEL_14:
  if (self->_modelVersion)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self modelVersion];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"modelVersion"];
    }
  }
  LOBYTE(v19) = self->_has;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v23 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawCountry](self, "rawCountry"));
    [v3 setObject:v23 forKeyedSubscript:@"rawCountry"];

    LOBYTE(v19) = self->_has;
    if ((*(_WORD *)&self->_has & 4) == 0)
    {
LABEL_29:
      if ((v19 & 8) == 0) {
        goto LABEL_30;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&self->_has & 4) == 0)
  {
    goto LABEL_29;
  }
  v24 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawLanguage](self, "rawLanguage"));
  [v3 setObject:v24 forKeyedSubscript:@"rawLanguage"];

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_30:
    if ((v19 & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_40;
  }
LABEL_39:
  v25 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawLocale](self, "rawLocale"));
  [v3 setObject:v25 forKeyedSubscript:@"rawLocale"];

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x40) == 0)
  {
LABEL_31:
    if ((v19 & 0x10) == 0) {
      goto LABEL_32;
    }
    goto LABEL_41;
  }
LABEL_40:
  v26 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawRequestDeviceCategory](self, "rawRequestDeviceCategory"));
  [v3 setObject:v26 forKeyedSubscript:@"rawRequestDeviceCategory"];

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x10) == 0)
  {
LABEL_32:
    if ((v19 & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_41:
  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals rawStateOrProvince](self, "rawStateOrProvince"));
  [v3 setObject:v27 forKeyedSubscript:@"rawStateOrProvince"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_33:
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals timestampSec](self, "timestampSec"));
    [v3 setObject:v20 forKeyedSubscript:@"timestampSec"];
  }
LABEL_34:
  if (self->_trialTreatmentId)
  {
    v21 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self trialTreatmentId];
    uint64_t v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"trialTreatmentId"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"trialTreatmentId"];
    }
  }
  if (self->_usecase)
  {
    v33 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self usecase];
    v34 = (void *)[v33 copy];
    [v3 setObject:v34 forKeyedSubscript:@"usecase"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_usecase hash];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  int v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    uint64_t v6 = 2654435761 * self->_choicesCount;
    if ((v5 & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_timestampSec;
      if ((v5 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((v5 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((v5 & 4) != 0)
  {
LABEL_4:
    uint64_t v8 = 2654435761 * self->_rawLanguage;
    if ((v5 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v8 = 0;
  if ((v5 & 8) != 0)
  {
LABEL_5:
    uint64_t v9 = 2654435761 * self->_rawLocale;
    if ((v5 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v9 = 0;
  if ((v5 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v10 = 2654435761 * self->_rawStateOrProvince;
    if ((v5 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v10 = 0;
  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v11 = 2654435761 * self->_rawCountry;
    if ((v5 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v11 = 0;
  if ((v5 & 0x40) != 0)
  {
LABEL_8:
    uint64_t v12 = 2654435761 * self->_rawRequestDeviceCategory;
    if ((v5 & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v12 = 0;
  if ((v5 & 0x80) != 0)
  {
LABEL_9:
    uint64_t v13 = 2654435761 * self->_calendarHourOfDay;
    if ((v5 & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v13 = 0;
  if ((v5 & 0x100) != 0)
  {
LABEL_10:
    uint64_t v14 = 2654435761 * self->_calendarDayOfWeek;
    if ((v5 & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v14 = 0;
  if ((v5 & 0x200) != 0)
  {
LABEL_11:
    uint64_t v15 = 2654435761 * self->_calendarWeekOfMonth;
    if ((v5 & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v15 = 0;
  if ((v5 & 0x400) != 0)
  {
LABEL_12:
    uint64_t v16 = 2654435761 * self->_calendarMonthOfYear;
    if ((v5 & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v16 = 0;
  if ((v5 & 0x800) != 0)
  {
LABEL_13:
    uint64_t v17 = 2654435761 * self->_isClientDaylight;
    if ((v5 & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v17 = 0;
  if ((v5 & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v18 = 2654435761 * self->_isDeviceLockStatus;
    if ((v5 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v18 = 0;
  if ((v5 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v19 = 2654435761 * self->_deviceMotionState;
    if ((v5 & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v19 = 0;
  if ((v5 & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v20 = 2654435761 * self->_isClientNavigating;
    if ((v5 & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v20 = 0;
  if ((v5 & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v21 = 2654435761 * self->_isCarPlay;
    if ((v5 & 0x10000) != 0) {
      goto LABEL_18;
    }
LABEL_36:
    uint64_t v22 = 0;
    if ((v5 & 0x20000) != 0) {
      goto LABEL_19;
    }
LABEL_37:
    uint64_t v23 = 0;
    goto LABEL_38;
  }
LABEL_35:
  uint64_t v21 = 0;
  if ((v5 & 0x10000) == 0) {
    goto LABEL_36;
  }
LABEL_18:
  uint64_t v22 = 2654435761 * self->_historicalDataCount;
  if ((v5 & 0x20000) == 0) {
    goto LABEL_37;
  }
LABEL_19:
  uint64_t v23 = 2654435761 * self->_disambiguationReason;
LABEL_38:
  NSUInteger v24 = v6 ^ v3 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  unint64_t v25 = v20 ^ v21 ^ v22 ^ v23 ^ [(SISchemaVersion *)self->_modelVersion hash];
  return v24 ^ v25 ^ [(SISchemaUUID *)self->_trialTreatmentId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_88;
  }
  int v5 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self usecase];
  uint64_t v6 = [v4 usecase];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_87;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self usecase];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self usecase];
    uint64_t v10 = [v4 usecase];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  int v13 = *(_WORD *)&self->_has & 1;
  unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  if (v13 != (v4[56] & 1)) {
    goto LABEL_88;
  }
  if (v13)
  {
    int choicesCount = self->_choicesCount;
    if (choicesCount != [v4 choicesCount]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v16 = (v12 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_88;
  }
  if (v16)
  {
    int64_t timestampSec = self->_timestampSec;
    if (timestampSec != [v4 timestampSec]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v18 = (v12 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_88;
  }
  if (v18)
  {
    int rawLanguage = self->_rawLanguage;
    if (rawLanguage != [v4 rawLanguage]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v20 = (v12 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_88;
  }
  if (v20)
  {
    int rawLocale = self->_rawLocale;
    if (rawLocale != [v4 rawLocale]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v22 = (v12 >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_88;
  }
  if (v22)
  {
    int rawStateOrProvince = self->_rawStateOrProvince;
    if (rawStateOrProvince != [v4 rawStateOrProvince]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v24 = (v12 >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_88;
  }
  if (v24)
  {
    int rawCountry = self->_rawCountry;
    if (rawCountry != [v4 rawCountry]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v26 = (v12 >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1)) {
    goto LABEL_88;
  }
  if (v26)
  {
    int rawRequestDeviceCategory = self->_rawRequestDeviceCategory;
    if (rawRequestDeviceCategory != [v4 rawRequestDeviceCategory]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v28 = (v12 >> 7) & 1;
  if (v28 != ((v14 >> 7) & 1)) {
    goto LABEL_88;
  }
  if (v28)
  {
    int calendarHourOfDay = self->_calendarHourOfDay;
    if (calendarHourOfDay != [v4 calendarHourOfDay]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v30 = (v12 >> 8) & 1;
  if (v30 != ((v14 >> 8) & 1)) {
    goto LABEL_88;
  }
  if (v30)
  {
    int calendarDayOfWeek = self->_calendarDayOfWeek;
    if (calendarDayOfWeek != [v4 calendarDayOfWeek]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v32 = (v12 >> 9) & 1;
  if (v32 != ((v14 >> 9) & 1)) {
    goto LABEL_88;
  }
  if (v32)
  {
    int calendarWeekOfMonth = self->_calendarWeekOfMonth;
    if (calendarWeekOfMonth != [v4 calendarWeekOfMonth]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v34 = (v12 >> 10) & 1;
  if (v34 != ((v14 >> 10) & 1)) {
    goto LABEL_88;
  }
  if (v34)
  {
    int calendarMonthOfYear = self->_calendarMonthOfYear;
    if (calendarMonthOfYear != [v4 calendarMonthOfYear]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v36 = (v12 >> 11) & 1;
  if (v36 != ((v14 >> 11) & 1)) {
    goto LABEL_88;
  }
  if (v36)
  {
    int isClientDaylight = self->_isClientDaylight;
    if (isClientDaylight != [v4 isClientDaylight]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v38 = (v12 >> 12) & 1;
  if (v38 != ((v14 >> 12) & 1)) {
    goto LABEL_88;
  }
  if (v38)
  {
    int isDeviceLockStatus = self->_isDeviceLockStatus;
    if (isDeviceLockStatus != [v4 isDeviceLockStatus]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v40 = (v12 >> 13) & 1;
  if (v40 != ((v14 >> 13) & 1)) {
    goto LABEL_88;
  }
  if (v40)
  {
    int deviceMotionState = self->_deviceMotionState;
    if (deviceMotionState != [v4 deviceMotionState]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v42 = (v12 >> 14) & 1;
  if (v42 != ((v14 >> 14) & 1)) {
    goto LABEL_88;
  }
  if (v42)
  {
    int isClientNavigating = self->_isClientNavigating;
    if (isClientNavigating != [v4 isClientNavigating]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v44 = (v12 >> 15) & 1;
  if (v44 != ((v14 >> 15) & 1)) {
    goto LABEL_88;
  }
  if (v44)
  {
    int isCarPlay = self->_isCarPlay;
    if (isCarPlay != [v4 isCarPlay]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v46 = HIWORD(v12) & 1;
  if (v46 != (HIWORD(v14) & 1)) {
    goto LABEL_88;
  }
  if (v46)
  {
    int historicalDataCount = self->_historicalDataCount;
    if (historicalDataCount != [v4 historicalDataCount]) {
      goto LABEL_88;
    }
    unsigned int v12 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v14 = v4[56] | (*((unsigned __int8 *)v4 + 114) << 16);
  }
  int v48 = (v12 >> 17) & 1;
  if (v48 != ((v14 >> 17) & 1)) {
    goto LABEL_88;
  }
  if (v48)
  {
    int disambiguationReason = self->_disambiguationReason;
    if (disambiguationReason != [v4 disambiguationReason]) {
      goto LABEL_88;
    }
  }
  int v5 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self modelVersion];
  uint64_t v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_87;
  }
  uint64_t v50 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self modelVersion];
  if (v50)
  {
    objc_super v51 = (void *)v50;
    v52 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self modelVersion];
    v53 = [v4 modelVersion];
    int v54 = [v52 isEqual:v53];

    if (!v54) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  int v5 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self trialTreatmentId];
  uint64_t v6 = [v4 trialTreatmentId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_87:

    goto LABEL_88;
  }
  uint64_t v55 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self trialTreatmentId];
  if (!v55)
  {

LABEL_91:
    BOOL v60 = 1;
    goto LABEL_89;
  }
  v56 = (void *)v55;
  v57 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self trialTreatmentId];
  v58 = [v4 trialTreatmentId];
  char v59 = [v57 isEqual:v58];

  if (v59) {
    goto LABEL_91;
  }
LABEL_88:
  BOOL v60 = 0;
LABEL_89:

  return v60;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self usecase];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  int v6 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteInt32Field();
    $8D9D7F62C73E045CB788A899FADF9E76 v12 = self->_has;
    int v6 = *(_DWORD *)&v12 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&v12 & 2) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_6:
    if ((v6 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_13:
    if ((v6 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_14:
    if ((v6 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_15:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_16:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_17:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_18:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  int v6 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x20000) != 0) {
LABEL_21:
  }
    PBDataWriterWriteInt32Field();
LABEL_22:
  uint64_t v7 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self modelVersion];

  if (v7)
  {
    uint64_t v8 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self modelVersion];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v9 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self trialTreatmentId];

  uint64_t v10 = v13;
  if (v9)
  {
    int v11 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self trialTreatmentId];
    PBDataWriterWriteSubmessage();

    uint64_t v10 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrialTreatmentId
{
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteDisambiguationReason
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setDisambiguationReason:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasDisambiguationReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFDFFFF;
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasDisambiguationReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDisambiguationReason:(int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x20000u) >> 16;
  self->_int disambiguationReason = a3;
}

- (void)deleteHistoricalDataCount
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setHistoricalDataCount:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasHistoricalDataCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasHistoricalDataCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHistoricalDataCount:(int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_int historicalDataCount = a3;
}

- (void)deleteIsCarPlay
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setIsCarPlay:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0x7FFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsCarPlay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsCarPlay
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setIsCarPlay:(int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_int isCarPlay = a3;
}

- (void)deleteIsClientNavigating
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setIsClientNavigating:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xBFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsClientNavigating:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsClientNavigating
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setIsClientNavigating:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_int isClientNavigating = a3;
}

- (void)deleteDeviceMotionState
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setDeviceMotionState:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xDFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasDeviceMotionState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasDeviceMotionState
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDeviceMotionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_int deviceMotionState = a3;
}

- (void)deleteIsDeviceLockStatus
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setIsDeviceLockStatus:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xEFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsDeviceLockStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsDeviceLockStatus
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setIsDeviceLockStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_int isDeviceLockStatus = a3;
}

- (void)deleteIsClientDaylight
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setIsClientDaylight:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xF7FF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasIsClientDaylight
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsClientDaylight:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int isClientDaylight = a3;
}

- (void)deleteCalendarMonthOfYear
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setCalendarMonthOfYear:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFBFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasCalendarMonthOfYear:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasCalendarMonthOfYear
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCalendarMonthOfYear:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int calendarMonthOfYear = a3;
}

- (void)deleteCalendarWeekOfMonth
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setCalendarWeekOfMonth:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFDFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasCalendarWeekOfMonth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasCalendarWeekOfMonth
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCalendarWeekOfMonth:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int calendarWeekOfMonth = a3;
}

- (void)deleteCalendarDayOfWeek
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setCalendarDayOfWeek:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFEFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasCalendarDayOfWeek:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasCalendarDayOfWeek
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setCalendarDayOfWeek:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int calendarDayOfWeek = a3;
}

- (void)deleteCalendarHourOfDay
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setCalendarHourOfDay:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFF7F;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasCalendarHourOfDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasCalendarHourOfDay
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCalendarHourOfDay:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int calendarHourOfDay = a3;
}

- (void)deleteRawRequestDeviceCategory
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setRawRequestDeviceCategory:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFFBF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRawRequestDeviceCategory:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRawRequestDeviceCategory
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRawRequestDeviceCategory:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int rawRequestDeviceCategory = a3;
}

- (void)deleteRawCountry
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setRawCountry:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFFDF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRawCountry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRawCountry
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRawCountry:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int rawCountry = a3;
}

- (void)deleteRawStateOrProvince
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setRawStateOrProvince:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFFEF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRawStateOrProvince:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRawStateOrProvince
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRawStateOrProvince:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int rawStateOrProvince = a3;
}

- (void)deleteRawLocale
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setRawLocale:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFFF7;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRawLocale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRawLocale
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRawLocale:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int rawLocale = a3;
}

- (void)deleteRawLanguage
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setRawLanguage:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFFFB;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRawLanguage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRawLanguage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRawLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int rawLanguage = a3;
}

- (void)deleteTimestampSec
{
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionCommonSignals *)self setTimestampSec:0];
  $8D9D7F62C73E045CB788A899FADF9E76 has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&has & 0xFFFD;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasTimestampSec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasTimestampSec
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTimestampSec:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int64_t timestampSec = a3;
}

- (void)deleteChoicesCount
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasChoicesCount:(BOOL)a3
{
  *(_WORD *)&self->_$8D9D7F62C73E045CB788A899FADF9E76 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChoicesCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setChoicesCount:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int choicesCount = a3;
}

- (void)deleteUsecase
{
}

- (BOOL)hasUsecase
{
  return self->_usecase != 0;
}

@end