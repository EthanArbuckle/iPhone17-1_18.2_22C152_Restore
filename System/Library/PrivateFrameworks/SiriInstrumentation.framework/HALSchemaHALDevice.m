@interface HALSchemaHALDevice
- (BOOL)hasAlarmContext;
- (BOOL)hasDeviceFamily;
- (BOOL)hasDeviceProximity;
- (BOOL)hasMediaPlayerContext;
- (BOOL)hasPowerState;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasSystemBuild;
- (BOOL)hasTimerContext;
- (BOOL)hasVoiceTriggerContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALAlarmContext)alarmContext;
- (HALSchemaHALDevice)initWithDictionary:(id)a3;
- (HALSchemaHALDevice)initWithJSON:(id)a3;
- (HALSchemaHALMediaPlayerContext)mediaPlayerContext;
- (HALSchemaHALTimerContext)timerContext;
- (HALSchemaHALVoiceTriggerContext)voiceTriggerContext;
- (NSData)jsonData;
- (NSString)systemBuild;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)deviceFamily;
- (int)deviceProximity;
- (int)powerState;
- (int)siriInputLocale;
- (unint64_t)hash;
- (void)deleteAlarmContext;
- (void)deleteDeviceFamily;
- (void)deleteDeviceProximity;
- (void)deleteMediaPlayerContext;
- (void)deletePowerState;
- (void)deleteSiriInputLocale;
- (void)deleteSystemBuild;
- (void)deleteTimerContext;
- (void)deleteVoiceTriggerContext;
- (void)setAlarmContext:(id)a3;
- (void)setDeviceFamily:(int)a3;
- (void)setDeviceProximity:(int)a3;
- (void)setHasAlarmContext:(BOOL)a3;
- (void)setHasDeviceFamily:(BOOL)a3;
- (void)setHasDeviceProximity:(BOOL)a3;
- (void)setHasMediaPlayerContext:(BOOL)a3;
- (void)setHasPowerState:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setHasTimerContext:(BOOL)a3;
- (void)setHasVoiceTriggerContext:(BOOL)a3;
- (void)setMediaPlayerContext:(id)a3;
- (void)setPowerState:(int)a3;
- (void)setSiriInputLocale:(int)a3;
- (void)setSystemBuild:(id)a3;
- (void)setTimerContext:(id)a3;
- (void)setVoiceTriggerContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALDevice

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HALSchemaHALDevice;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(HALSchemaHALDevice *)self mediaPlayerContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(HALSchemaHALDevice *)self deleteMediaPlayerContext];
  }
  v9 = [(HALSchemaHALDevice *)self alarmContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(HALSchemaHALDevice *)self deleteAlarmContext];
  }
  v12 = [(HALSchemaHALDevice *)self timerContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(HALSchemaHALDevice *)self deleteTimerContext];
  }
  v15 = [(HALSchemaHALDevice *)self voiceTriggerContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(HALSchemaHALDevice *)self deleteVoiceTriggerContext];
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
  objc_storeStrong((id *)&self->_voiceTriggerContext, 0);
  objc_storeStrong((id *)&self->_timerContext, 0);
  objc_storeStrong((id *)&self->_alarmContext, 0);
  objc_storeStrong((id *)&self->_mediaPlayerContext, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

- (void)setHasVoiceTriggerContext:(BOOL)a3
{
  self->_hasMediaPlayerContext = a3;
}

- (void)setHasTimerContext:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasAlarmContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasMediaPlayerContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setVoiceTriggerContext:(id)a3
{
}

- (HALSchemaHALVoiceTriggerContext)voiceTriggerContext
{
  return self->_voiceTriggerContext;
}

- (void)setTimerContext:(id)a3
{
}

- (HALSchemaHALTimerContext)timerContext
{
  return self->_timerContext;
}

- (void)setAlarmContext:(id)a3
{
}

- (HALSchemaHALAlarmContext)alarmContext
{
  return self->_alarmContext;
}

- (void)setMediaPlayerContext:(id)a3
{
}

- (HALSchemaHALMediaPlayerContext)mediaPlayerContext
{
  return self->_mediaPlayerContext;
}

- (int)siriInputLocale
{
  return self->_siriInputLocale;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (int)deviceFamily
{
  return self->_deviceFamily;
}

- (int)deviceProximity
{
  return self->_deviceProximity;
}

- (HALSchemaHALDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HALSchemaHALDevice;
  v5 = [(HALSchemaHALDevice *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"deviceProximity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALDevice setDeviceProximity:](v5, "setDeviceProximity:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"deviceFamily"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALDevice setDeviceFamily:](v5, "setDeviceFamily:", [v7 intValue]);
    }
    v23 = v6;
    int v8 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(HALSchemaHALDevice *)v5 setSystemBuild:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"siriInputLocale", v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALDevice setSiriInputLocale:](v5, "setSiriInputLocale:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"mediaPlayerContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[HALSchemaHALMediaPlayerContext alloc] initWithDictionary:v11];
      [(HALSchemaHALDevice *)v5 setMediaPlayerContext:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"alarmContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[HALSchemaHALAlarmContext alloc] initWithDictionary:v13];
      [(HALSchemaHALDevice *)v5 setAlarmContext:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"timerContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[HALSchemaHALTimerContext alloc] initWithDictionary:v15];
      [(HALSchemaHALDevice *)v5 setTimerContext:v16];
    }
    int v17 = [v4 objectForKeyedSubscript:@"voiceTriggerContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[HALSchemaHALVoiceTriggerContext alloc] initWithDictionary:v17];
      [(HALSchemaHALDevice *)v5 setVoiceTriggerContext:v18];
    }
    objc_super v19 = [v4 objectForKeyedSubscript:@"powerState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALDevice setPowerState:](v5, "setPowerState:", [v19 intValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (HALSchemaHALDevice)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALDevice *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALDevice *)self dictionaryRepresentation];
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
  if (self->_alarmContext)
  {
    id v4 = [(HALSchemaHALDevice *)self alarmContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"alarmContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"alarmContext"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v8 = [(HALSchemaHALDevice *)self deviceFamily] - 1;
    if (v8 > 7) {
      v9 = @"DEVICEFAMILY_UNKNOWN";
    }
    else {
      v9 = off_1E5EB0858[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"deviceFamily"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v10 = [(HALSchemaHALDevice *)self deviceProximity] - 1;
    if (v10 > 3) {
      int v11 = @"HALDEVICEPROXIMITY_UNKNOWN";
    }
    else {
      int v11 = off_1E5EB0898[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"deviceProximity"];
  }
  if (self->_mediaPlayerContext)
  {
    v12 = [(HALSchemaHALDevice *)self mediaPlayerContext];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"mediaPlayerContext"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"mediaPlayerContext"];
    }
  }
  char v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    unsigned int v16 = [(HALSchemaHALDevice *)self powerState] - 1;
    if (v16 > 2) {
      int v17 = @"HALPOWERSTATE_UNKNOWN";
    }
    else {
      int v17 = off_1E5EB08B8[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"powerState"];
    char v15 = (char)self->_has;
  }
  if ((v15 & 4) != 0)
  {
    unsigned int v18 = [(HALSchemaHALDevice *)self siriInputLocale] - 1;
    if (v18 > 0x3D) {
      objc_super v19 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      objc_super v19 = off_1E5EB08D0[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"siriInputLocale"];
  }
  if (self->_systemBuild)
  {
    v20 = [(HALSchemaHALDevice *)self systemBuild];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"systemBuild"];
  }
  if (self->_timerContext)
  {
    v22 = [(HALSchemaHALDevice *)self timerContext];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"timerContext"];
    }
    else
    {
      objc_super v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"timerContext"];
    }
  }
  if (self->_voiceTriggerContext)
  {
    v25 = [(HALSchemaHALDevice *)self voiceTriggerContext];
    v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"voiceTriggerContext"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"voiceTriggerContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_deviceProximity;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_deviceFamily;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_systemBuild hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_siriInputLocale;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(HALSchemaHALMediaPlayerContext *)self->_mediaPlayerContext hash];
  unint64_t v8 = [(HALSchemaHALAlarmContext *)self->_alarmContext hash];
  unint64_t v9 = [(HALSchemaHALTimerContext *)self->_timerContext hash];
  unint64_t v10 = [(HALSchemaHALVoiceTriggerContext *)self->_voiceTriggerContext hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_powerState;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  $AD3AB2ED704B40CE4732714BDC82807E has = self->_has;
  unsigned int v6 = v4[68];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_37;
  }
  if (*(unsigned char *)&has)
  {
    int deviceProximity = self->_deviceProximity;
    if (deviceProximity != [v4 deviceProximity]) {
      goto LABEL_37;
    }
    $AD3AB2ED704B40CE4732714BDC82807E has = self->_has;
    unsigned int v6 = v4[68];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_37;
  }
  if (v8)
  {
    int deviceFamily = self->_deviceFamily;
    if (deviceFamily != [v4 deviceFamily]) {
      goto LABEL_37;
    }
  }
  unint64_t v10 = [(HALSchemaHALDevice *)self systemBuild];
  uint64_t v11 = [v4 systemBuild];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(HALSchemaHALDevice *)self systemBuild];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(HALSchemaHALDevice *)self systemBuild];
    char v15 = [v4 systemBuild];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  int v17 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v17 != ((v4[68] >> 2) & 1)) {
    goto LABEL_37;
  }
  if (v17)
  {
    int siriInputLocale = self->_siriInputLocale;
    if (siriInputLocale != [v4 siriInputLocale]) {
      goto LABEL_37;
    }
  }
  unint64_t v10 = [(HALSchemaHALDevice *)self mediaPlayerContext];
  uint64_t v11 = [v4 mediaPlayerContext];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_36;
  }
  uint64_t v19 = [(HALSchemaHALDevice *)self mediaPlayerContext];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(HALSchemaHALDevice *)self mediaPlayerContext];
    v22 = [v4 mediaPlayerContext];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v10 = [(HALSchemaHALDevice *)self alarmContext];
  uint64_t v11 = [v4 alarmContext];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_36;
  }
  uint64_t v24 = [(HALSchemaHALDevice *)self alarmContext];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(HALSchemaHALDevice *)self alarmContext];
    v27 = [v4 alarmContext];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v10 = [(HALSchemaHALDevice *)self timerContext];
  uint64_t v11 = [v4 timerContext];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_36;
  }
  uint64_t v29 = [(HALSchemaHALDevice *)self timerContext];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(HALSchemaHALDevice *)self timerContext];
    v32 = [v4 timerContext];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v10 = [(HALSchemaHALDevice *)self voiceTriggerContext];
  uint64_t v11 = [v4 voiceTriggerContext];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v34 = [(HALSchemaHALDevice *)self voiceTriggerContext];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(HALSchemaHALDevice *)self voiceTriggerContext];
    v37 = [v4 voiceTriggerContext];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  int v41 = (*(unsigned char *)&self->_has >> 3) & 1;
  if (v41 == ((v4[68] >> 3) & 1))
  {
    if (!v41 || (int powerState = self->_powerState, powerState == [v4 powerState]))
    {
      BOOL v39 = 1;
      goto LABEL_38;
    }
  }
LABEL_37:
  BOOL v39 = 0;
LABEL_38:

  return v39;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v5 = [(HALSchemaHALDevice *)self systemBuild];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v6 = [(HALSchemaHALDevice *)self mediaPlayerContext];

  if (v6)
  {
    unint64_t v7 = [(HALSchemaHALDevice *)self mediaPlayerContext];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(HALSchemaHALDevice *)self alarmContext];

  if (v8)
  {
    unint64_t v9 = [(HALSchemaHALDevice *)self alarmContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(HALSchemaHALDevice *)self timerContext];

  if (v10)
  {
    uint64_t v11 = [(HALSchemaHALDevice *)self timerContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(HALSchemaHALDevice *)self voiceTriggerContext];

  if (v12)
  {
    v13 = [(HALSchemaHALDevice *)self voiceTriggerContext];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALDeviceReadFrom(self, (uint64_t)a3);
}

- (void)deletePowerState
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasPowerState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPowerState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPowerState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int powerState = a3;
}

- (void)deleteVoiceTriggerContext
{
}

- (BOOL)hasVoiceTriggerContext
{
  return self->_voiceTriggerContext != 0;
}

- (void)deleteTimerContext
{
}

- (BOOL)hasTimerContext
{
  return self->_timerContext != 0;
}

- (void)deleteAlarmContext
{
}

- (BOOL)hasAlarmContext
{
  return self->_alarmContext != 0;
}

- (void)deleteMediaPlayerContext
{
}

- (BOOL)hasMediaPlayerContext
{
  return self->_mediaPlayerContext != 0;
}

- (void)deleteSiriInputLocale
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSiriInputLocale
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSiriInputLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int siriInputLocale = a3;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteDeviceFamily
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDeviceFamily:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceFamily
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeviceFamily:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int deviceFamily = a3;
}

- (void)deleteDeviceProximity
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeviceProximity:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceProximity
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceProximity:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int deviceProximity = a3;
}

@end