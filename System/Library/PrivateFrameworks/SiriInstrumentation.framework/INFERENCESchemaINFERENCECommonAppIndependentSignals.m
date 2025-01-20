@interface INFERENCESchemaINFERENCECommonAppIndependentSignals
- (BOOL)hasAppResolutionType;
- (BOOL)hasAppSelectionUses;
- (BOOL)hasClientDayOfWeek;
- (BOOL)hasIsClientDaylight;
- (BOOL)hasModelVersion;
- (BOOL)hasRawClientHourOfDay;
- (BOOL)hasRawCountry;
- (BOOL)hasRawLanguage;
- (BOOL)hasRawLocale;
- (BOOL)hasRawRequestDeviceCategory;
- (BOOL)hasRawStateOrProvince;
- (BOOL)hasSirikitResponseCode;
- (BOOL)isClientDaylight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommonAppIndependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommonAppIndependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appResolutionType;
- (int)appSelectionUses;
- (int)clientDayOfWeek;
- (int)rawClientHourOfDay;
- (int)sirikitResponseCode;
- (int64_t)rawCountry;
- (int64_t)rawLanguage;
- (int64_t)rawLocale;
- (int64_t)rawRequestDeviceCategory;
- (int64_t)rawStateOrProvince;
- (unint64_t)hash;
- (unsigned)modelVersion;
- (void)deleteAppResolutionType;
- (void)deleteAppSelectionUses;
- (void)deleteClientDayOfWeek;
- (void)deleteIsClientDaylight;
- (void)deleteModelVersion;
- (void)deleteRawClientHourOfDay;
- (void)deleteRawCountry;
- (void)deleteRawLanguage;
- (void)deleteRawLocale;
- (void)deleteRawRequestDeviceCategory;
- (void)deleteRawStateOrProvince;
- (void)deleteSirikitResponseCode;
- (void)setAppResolutionType:(int)a3;
- (void)setAppSelectionUses:(int)a3;
- (void)setClientDayOfWeek:(int)a3;
- (void)setHasAppResolutionType:(BOOL)a3;
- (void)setHasAppSelectionUses:(BOOL)a3;
- (void)setHasClientDayOfWeek:(BOOL)a3;
- (void)setHasIsClientDaylight:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasRawClientHourOfDay:(BOOL)a3;
- (void)setHasRawCountry:(BOOL)a3;
- (void)setHasRawLanguage:(BOOL)a3;
- (void)setHasRawLocale:(BOOL)a3;
- (void)setHasRawRequestDeviceCategory:(BOOL)a3;
- (void)setHasRawStateOrProvince:(BOOL)a3;
- (void)setHasSirikitResponseCode:(BOOL)a3;
- (void)setIsClientDaylight:(BOOL)a3;
- (void)setModelVersion:(unsigned int)a3;
- (void)setRawClientHourOfDay:(int)a3;
- (void)setRawCountry:(int64_t)a3;
- (void)setRawLanguage:(int64_t)a3;
- (void)setRawLocale:(int64_t)a3;
- (void)setRawRequestDeviceCategory:(int64_t)a3;
- (void)setRawStateOrProvince:(int64_t)a3;
- (void)setSirikitResponseCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommonAppIndependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (int)appSelectionUses
{
  return self->_appSelectionUses;
}

- (int)sirikitResponseCode
{
  return self->_sirikitResponseCode;
}

- (int)appResolutionType
{
  return self->_appResolutionType;
}

- (BOOL)isClientDaylight
{
  return self->_isClientDaylight;
}

- (int)rawClientHourOfDay
{
  return self->_rawClientHourOfDay;
}

- (int)clientDayOfWeek
{
  return self->_clientDayOfWeek;
}

- (int64_t)rawRequestDeviceCategory
{
  return self->_rawRequestDeviceCategory;
}

- (int64_t)rawCountry
{
  return self->_rawCountry;
}

- (int64_t)rawStateOrProvince
{
  return self->_rawStateOrProvince;
}

- (int64_t)rawLocale
{
  return self->_rawLocale;
}

- (int64_t)rawLanguage
{
  return self->_rawLanguage;
}

- (INFERENCESchemaINFERENCECommonAppIndependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INFERENCESchemaINFERENCECommonAppIndependentSignals;
  v5 = [(INFERENCESchemaINFERENCECommonAppIndependentSignals *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rawLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawLanguage:](v5, "setRawLanguage:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"rawLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawLocale:](v5, "setRawLocale:", [v7 longLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"rawStateOrProvince"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawStateOrProvince:](v5, "setRawStateOrProvince:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"rawCountry"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawCountry:](v5, "setRawCountry:", [v9 longLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"rawRequestDeviceCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawRequestDeviceCategory:](v5, "setRawRequestDeviceCategory:", [v10 longLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"clientDayOfWeek"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setClientDayOfWeek:](v5, "setClientDayOfWeek:", [v11 intValue]);
    }
    v21 = v11;
    v12 = [v4 objectForKeyedSubscript:@"rawClientHourOfDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setRawClientHourOfDay:](v5, "setRawClientHourOfDay:", [v12 intValue]);
    }
    v25 = v6;
    v13 = [v4 objectForKeyedSubscript:@"isClientDaylight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setIsClientDaylight:](v5, "setIsClientDaylight:", [v13 BOOLValue]);
    }
    v24 = v7;
    v14 = [v4 objectForKeyedSubscript:@"appResolutionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setAppResolutionType:](v5, "setAppResolutionType:", [v14 intValue]);
    }
    v22 = v10;
    v23 = v8;
    v15 = [v4 objectForKeyedSubscript:@"sirikitResponseCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setSirikitResponseCode:](v5, "setSirikitResponseCode:", [v15 intValue]);
    }
    v16 = v9;
    v17 = [v4 objectForKeyedSubscript:@"appSelectionUses"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setAppSelectionUses:](v5, "setAppSelectionUses:", [v17 intValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppIndependentSignals setModelVersion:](v5, "setModelVersion:", [v18 unsignedIntValue]);
    }
    v19 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommonAppIndependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommonAppIndependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommonAppIndependentSignals *)self dictionaryRepresentation];
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
  if ((has & 0x100) != 0)
  {
    unsigned int v5 = [(INFERENCESchemaINFERENCECommonAppIndependentSignals *)self appResolutionType] - 1;
    if (v5 > 9) {
      v6 = @"INFERENCEAPPRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBA808[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"appResolutionType"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals appSelectionUses](self, "appSelectionUses"));
    [v3 setObject:v9 forKeyedSubscript:@"appSelectionUses"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_8:
      if ((has & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_8;
  }
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
  [v3 setObject:v10 forKeyedSubscript:@"clientDayOfWeek"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals isClientDaylight](self, "isClientDaylight"));
  [v3 setObject:v11 forKeyedSubscript:@"isClientDaylight"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals modelVersion](self, "modelVersion"));
  [v3 setObject:v12 forKeyedSubscript:@"modelVersion"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
  [v3 setObject:v13 forKeyedSubscript:@"rawClientHourOfDay"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawCountry](self, "rawCountry"));
  [v3 setObject:v14 forKeyedSubscript:@"rawCountry"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawLanguage](self, "rawLanguage"));
  [v3 setObject:v15 forKeyedSubscript:@"rawLanguage"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  v16 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawLocale](self, "rawLocale"));
  [v3 setObject:v16 forKeyedSubscript:@"rawLocale"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }
LABEL_29:
  v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawRequestDeviceCategory](self, "rawRequestDeviceCategory"));
  [v3 setObject:v17 forKeyedSubscript:@"rawRequestDeviceCategory"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_30:
  v18 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals rawStateOrProvince](self, "rawStateOrProvince"));
  [v3 setObject:v18 forKeyedSubscript:@"rawStateOrProvince"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_17:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
    [v3 setObject:v7 forKeyedSubscript:@"sirikitResponseCode"];
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_rawLanguage;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rawLocale;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_rawStateOrProvince;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_rawCountry;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_rawRequestDeviceCategory;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_clientDayOfWeek;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_rawClientHourOfDay;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_isClientDaylight;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_appResolutionType;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_sirikitResponseCode;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_appSelectionUses;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_modelVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
  unsigned int v6 = v4[38];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_50;
  }
  if (*(unsigned char *)&has)
  {
    int64_t rawLanguage = self->_rawLanguage;
    if (rawLanguage != [v4 rawLanguage]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_50;
  }
  if (v8)
  {
    int64_t rawLocale = self->_rawLocale;
    if (rawLocale != [v4 rawLocale]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_50;
  }
  if (v10)
  {
    int64_t rawStateOrProvince = self->_rawStateOrProvince;
    if (rawStateOrProvince != [v4 rawStateOrProvince]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_50;
  }
  if (v12)
  {
    int64_t rawCountry = self->_rawCountry;
    if (rawCountry != [v4 rawCountry]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_50;
  }
  if (v14)
  {
    int64_t rawRequestDeviceCategory = self->_rawRequestDeviceCategory;
    if (rawRequestDeviceCategory != [v4 rawRequestDeviceCategory]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_50;
  }
  if (v16)
  {
    int clientDayOfWeek = self->_clientDayOfWeek;
    if (clientDayOfWeek != [v4 clientDayOfWeek]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_50;
  }
  if (v18)
  {
    int rawClientHourOfDay = self->_rawClientHourOfDay;
    if (rawClientHourOfDay != [v4 rawClientHourOfDay]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_50;
  }
  if (v20)
  {
    int isClientDaylight = self->_isClientDaylight;
    if (isClientDaylight != [v4 isClientDaylight]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_50;
  }
  if (v22)
  {
    int appResolutionType = self->_appResolutionType;
    if (appResolutionType != [v4 appResolutionType]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_50;
  }
  if (v24)
  {
    int sirikitResponseCode = self->_sirikitResponseCode;
    if (sirikitResponseCode != [v4 sirikitResponseCode]) {
      goto LABEL_50;
    }
    $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
    unsigned int v6 = v4[38];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_50;
  }
  if (v26)
  {
    int appSelectionUses = self->_appSelectionUses;
    if (appSelectionUses == [v4 appSelectionUses])
    {
      $D0A0D8F83E59B8C98DCEAE04751221F4 has = self->_has;
      unsigned int v6 = v4[38];
      goto LABEL_46;
    }
LABEL_50:
    BOOL v30 = 0;
    goto LABEL_51;
  }
LABEL_46:
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_50;
  }
  if (v28)
  {
    unsigned int modelVersion = self->_modelVersion;
    if (modelVersion != [v4 modelVersion]) {
      goto LABEL_50;
    }
  }
  BOOL v30 = 1;
LABEL_51:

  return v30;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommonAppIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelVersion
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasModelVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasModelVersion
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unsigned int modelVersion = a3;
}

- (void)deleteAppSelectionUses
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasAppSelectionUses:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAppSelectionUses
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAppSelectionUses:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int appSelectionUses = a3;
}

- (void)deleteSirikitResponseCode
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasSirikitResponseCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSirikitResponseCode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSirikitResponseCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int sirikitResponseCode = a3;
}

- (void)deleteAppResolutionType
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasAppResolutionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasAppResolutionType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAppResolutionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int appResolutionType = a3;
}

- (void)deleteIsClientDaylight
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsClientDaylight
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsClientDaylight:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int isClientDaylight = a3;
}

- (void)deleteRawClientHourOfDay
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasRawClientHourOfDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRawClientHourOfDay
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRawClientHourOfDay:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int rawClientHourOfDay = a3;
}

- (void)deleteClientDayOfWeek
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasClientDayOfWeek:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasClientDayOfWeek
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setClientDayOfWeek:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int clientDayOfWeek = a3;
}

- (void)deleteRawRequestDeviceCategory
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasRawRequestDeviceCategory:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRawRequestDeviceCategory
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRawRequestDeviceCategory:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int64_t rawRequestDeviceCategory = a3;
}

- (void)deleteRawCountry
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasRawCountry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRawCountry
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRawCountry:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int64_t rawCountry = a3;
}

- (void)deleteRawStateOrProvince
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasRawStateOrProvince:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRawStateOrProvince
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRawStateOrProvince:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int64_t rawStateOrProvince = a3;
}

- (void)deleteRawLocale
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasRawLocale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRawLocale
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRawLocale:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int64_t rawLocale = a3;
}

- (void)deleteRawLanguage
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasRawLanguage:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRawLanguage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRawLanguage:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int64_t rawLanguage = a3;
}

@end