@interface INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals
- (BOOL)hasBucketedDeviceMotionState;
- (BOOL)hasClientHourOfDay;
- (BOOL)hasClientLanguage;
- (BOOL)hasClientLocale;
- (BOOL)hasClientRegion;
- (BOOL)hasDeviceClass;
- (BOOL)hasDeviceMotionState;
- (BOOL)hasIntentType;
- (BOOL)hasIsDeviceLockStatus;
- (BOOL)hasNowPlayingState;
- (BOOL)isDeviceLockStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)bucketedDeviceMotionState;
- (int)clientHourOfDay;
- (int)deviceClass;
- (int)deviceMotionState;
- (int)intentType;
- (int)nowPlayingState;
- (int64_t)clientLanguage;
- (int64_t)clientLocale;
- (int64_t)clientRegion;
- (unint64_t)hash;
- (void)deleteBucketedDeviceMotionState;
- (void)deleteClientHourOfDay;
- (void)deleteClientLanguage;
- (void)deleteClientLocale;
- (void)deleteClientRegion;
- (void)deleteDeviceClass;
- (void)deleteDeviceMotionState;
- (void)deleteIntentType;
- (void)deleteIsDeviceLockStatus;
- (void)deleteNowPlayingState;
- (void)setBucketedDeviceMotionState:(int)a3;
- (void)setClientHourOfDay:(int)a3;
- (void)setClientLanguage:(int64_t)a3;
- (void)setClientLocale:(int64_t)a3;
- (void)setClientRegion:(int64_t)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDeviceMotionState:(int)a3;
- (void)setHasBucketedDeviceMotionState:(BOOL)a3;
- (void)setHasClientHourOfDay:(BOOL)a3;
- (void)setHasClientLanguage:(BOOL)a3;
- (void)setHasClientLocale:(BOOL)a3;
- (void)setHasClientRegion:(BOOL)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasDeviceMotionState:(BOOL)a3;
- (void)setHasIntentType:(BOOL)a3;
- (void)setHasIsDeviceLockStatus:(BOOL)a3;
- (void)setHasNowPlayingState:(BOOL)a3;
- (void)setIntentType:(int)a3;
- (void)setIsDeviceLockStatus:(BOOL)a3;
- (void)setNowPlayingState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)bucketedDeviceMotionState
{
  return self->_bucketedDeviceMotionState;
}

- (int64_t)clientRegion
{
  return self->_clientRegion;
}

- (int64_t)clientLanguage
{
  return self->_clientLanguage;
}

- (int64_t)clientLocale
{
  return self->_clientLocale;
}

- (int)clientHourOfDay
{
  return self->_clientHourOfDay;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (int)nowPlayingState
{
  return self->_nowPlayingState;
}

- (int)intentType
{
  return self->_intentType;
}

- (int)deviceMotionState
{
  return self->_deviceMotionState;
}

- (BOOL)isDeviceLockStatus
{
  return self->_isDeviceLockStatus;
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals;
  v5 = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDeviceLockStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setIsDeviceLockStatus:](v5, "setIsDeviceLockStatus:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"deviceMotionState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setDeviceMotionState:](v5, "setDeviceMotionState:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"intentType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setIntentType:](v5, "setIntentType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"nowPlayingState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setNowPlayingState:](v5, "setNowPlayingState:", [v9 intValue]);
    }
    v19 = v9;
    v10 = [v4 objectForKeyedSubscript:@"deviceClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setDeviceClass:](v5, "setDeviceClass:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"clientHourOfDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientHourOfDay:](v5, "setClientHourOfDay:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"clientLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientLocale:](v5, "setClientLocale:", [v12 longLongValue]);
    }
    v20 = v8;
    v21 = v6;
    v13 = [v4 objectForKeyedSubscript:@"clientLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientLanguage:](v5, "setClientLanguage:", [v13 longLongValue]);
    }
    v14 = v7;
    v15 = [v4 objectForKeyedSubscript:@"clientRegion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setClientRegion:](v5, "setClientRegion:", [v15 longLongValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"bucketedDeviceMotionState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals setBucketedDeviceMotionState:](v5, "setBucketedDeviceMotionState:", [v16 intValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals bucketedDeviceMotionState](self, "bucketedDeviceMotionState"));
    [v3 setObject:v7 forKeyedSubscript:@"bucketedDeviceMotionState"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientHourOfDay](self, "clientHourOfDay"));
  [v3 setObject:v8 forKeyedSubscript:@"clientHourOfDay"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientLanguage](self, "clientLanguage"));
  [v3 setObject:v9 forKeyedSubscript:@"clientLanguage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientLocale](self, "clientLocale"));
  [v3 setObject:v10 forKeyedSubscript:@"clientLocale"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals clientRegion](self, "clientRegion"));
  [v3 setObject:v11 forKeyedSubscript:@"clientRegion"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals deviceClass](self, "deviceClass"));
  [v3 setObject:v12 forKeyedSubscript:@"deviceClass"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals deviceMotionState](self, "deviceMotionState"));
  [v3 setObject:v13 forKeyedSubscript:@"deviceMotionState"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals intentType](self, "intentType"));
  [v3 setObject:v14 forKeyedSubscript:@"intentType"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals isDeviceLockStatus](self, "isDeviceLockStatus"));
  [v3 setObject:v15 forKeyedSubscript:@"isDeviceLockStatus"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignals nowPlayingState](self, "nowPlayingState"));
    [v3 setObject:v5 forKeyedSubscript:@"nowPlayingState"];
  }
LABEL_12:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_isDeviceLockStatus;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_deviceMotionState;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
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
    uint64_t v5 = 2654435761 * self->_intentType;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_nowPlayingState;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_deviceClass;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_clientHourOfDay;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_clientLocale;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_clientLanguage;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_clientRegion;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_bucketedDeviceMotionState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
  unsigned int v6 = v4[30];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    int isDeviceLockStatus = self->_isDeviceLockStatus;
    if (isDeviceLockStatus != [v4 isDeviceLockStatus]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_42;
  }
  if (v8)
  {
    int deviceMotionState = self->_deviceMotionState;
    if (deviceMotionState != [v4 deviceMotionState]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_42;
  }
  if (v10)
  {
    int intentType = self->_intentType;
    if (intentType != [v4 intentType]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_42;
  }
  if (v12)
  {
    int nowPlayingState = self->_nowPlayingState;
    if (nowPlayingState != [v4 nowPlayingState]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_42;
  }
  if (v14)
  {
    int deviceClass = self->_deviceClass;
    if (deviceClass != [v4 deviceClass]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_42;
  }
  if (v16)
  {
    int clientHourOfDay = self->_clientHourOfDay;
    if (clientHourOfDay != [v4 clientHourOfDay]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_42;
  }
  if (v18)
  {
    int64_t clientLocale = self->_clientLocale;
    if (clientLocale != [v4 clientLocale]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_42;
  }
  if (v20)
  {
    int64_t clientLanguage = self->_clientLanguage;
    if (clientLanguage != [v4 clientLanguage]) {
      goto LABEL_42;
    }
    $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
    unsigned int v6 = v4[30];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_42;
  }
  if (v22)
  {
    int64_t clientRegion = self->_clientRegion;
    if (clientRegion == [v4 clientRegion])
    {
      $C5A00BAA0C83D70C2345CCD5F989A571 has = self->_has;
      unsigned int v6 = v4[30];
      goto LABEL_38;
    }
LABEL_42:
    BOOL v26 = 0;
    goto LABEL_43;
  }
LABEL_38:
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_42;
  }
  if (v24)
  {
    int bucketedDeviceMotionState = self->_bucketedDeviceMotionState;
    if (bucketedDeviceMotionState != [v4 bucketedDeviceMotionState]) {
      goto LABEL_42;
    }
  }
  BOOL v26 = 1;
LABEL_43:

  return v26;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteBucketedDeviceMotionState
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasBucketedDeviceMotionState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasBucketedDeviceMotionState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBucketedDeviceMotionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int bucketedDeviceMotionState = a3;
}

- (void)deleteClientRegion
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasClientRegion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasClientRegion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setClientRegion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int64_t clientRegion = a3;
}

- (void)deleteClientLanguage
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasClientLanguage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasClientLanguage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setClientLanguage:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int64_t clientLanguage = a3;
}

- (void)deleteClientLocale
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasClientLocale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasClientLocale
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setClientLocale:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int64_t clientLocale = a3;
}

- (void)deleteClientHourOfDay
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasClientHourOfDay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasClientHourOfDay
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setClientHourOfDay:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int clientHourOfDay = a3;
}

- (void)deleteDeviceClass
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDeviceClass:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int deviceClass = a3;
}

- (void)deleteNowPlayingState
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasNowPlayingState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNowPlayingState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNowPlayingState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int nowPlayingState = a3;
}

- (void)deleteIntentType
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasIntentType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasIntentType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIntentType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int intentType = a3;
}

- (void)deleteDeviceMotionState
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasDeviceMotionState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeviceMotionState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDeviceMotionState:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int deviceMotionState = a3;
}

- (void)deleteIsDeviceLockStatus
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasIsDeviceLockStatus:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasIsDeviceLockStatus
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setIsDeviceLockStatus:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int isDeviceLockStatus = a3;
}

@end