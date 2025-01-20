@interface MHSchemaMHSelfTriggerSuppressionSession
- (BOOL)hasAudioSource;
- (BOOL)hasIsBluetoothSpeakerActive;
- (BOOL)hasIsBuiltInSpeakerActive;
- (BOOL)hasNumSelfTriggersDetectedInSession;
- (BOOL)hasSessionDurationInSeconds;
- (BOOL)isBluetoothSpeakerActive;
- (BOOL)isBuiltInSpeakerActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHSelfTriggerSuppressionSession)initWithDictionary:(id)a3;
- (MHSchemaMHSelfTriggerSuppressionSession)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)sessionDurationInSeconds;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioSource;
- (unint64_t)hash;
- (unsigned)numSelfTriggersDetectedInSession;
- (void)deleteAudioSource;
- (void)deleteIsBluetoothSpeakerActive;
- (void)deleteIsBuiltInSpeakerActive;
- (void)deleteNumSelfTriggersDetectedInSession;
- (void)deleteSessionDurationInSeconds;
- (void)setAudioSource:(int)a3;
- (void)setHasAudioSource:(BOOL)a3;
- (void)setHasIsBluetoothSpeakerActive:(BOOL)a3;
- (void)setHasIsBuiltInSpeakerActive:(BOOL)a3;
- (void)setHasNumSelfTriggersDetectedInSession:(BOOL)a3;
- (void)setHasSessionDurationInSeconds:(BOOL)a3;
- (void)setIsBluetoothSpeakerActive:(BOOL)a3;
- (void)setIsBuiltInSpeakerActive:(BOOL)a3;
- (void)setNumSelfTriggersDetectedInSession:(unsigned int)a3;
- (void)setSessionDurationInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHSelfTriggerSuppressionSession

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isBuiltInSpeakerActive
{
  return self->_isBuiltInSpeakerActive;
}

- (BOOL)isBluetoothSpeakerActive
{
  return self->_isBluetoothSpeakerActive;
}

- (int)audioSource
{
  return self->_audioSource;
}

- (double)sessionDurationInSeconds
{
  return self->_sessionDurationInSeconds;
}

- (unsigned)numSelfTriggersDetectedInSession
{
  return self->_numSelfTriggersDetectedInSession;
}

- (MHSchemaMHSelfTriggerSuppressionSession)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHSelfTriggerSuppressionSession;
  v5 = [(MHSchemaMHSelfTriggerSuppressionSession *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numSelfTriggersDetectedInSession"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHSelfTriggerSuppressionSession setNumSelfTriggersDetectedInSession:](v5, "setNumSelfTriggersDetectedInSession:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"sessionDurationInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[MHSchemaMHSelfTriggerSuppressionSession setSessionDurationInSeconds:](v5, "setSessionDurationInSeconds:");
    }
    v8 = [v4 objectForKeyedSubscript:@"audioSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHSelfTriggerSuppressionSession setAudioSource:](v5, "setAudioSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isBluetoothSpeakerActive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHSelfTriggerSuppressionSession setIsBluetoothSpeakerActive:](v5, "setIsBluetoothSpeakerActive:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isBuiltInSpeakerActive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHSelfTriggerSuppressionSession setIsBuiltInSpeakerActive:](v5, "setIsBuiltInSpeakerActive:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHSelfTriggerSuppressionSession)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHSelfTriggerSuppressionSession *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHSelfTriggerSuppressionSession *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 4) != 0)
  {
    int v5 = [(MHSchemaMHSelfTriggerSuppressionSession *)self audioSource];
    v6 = @"MHSELFTRIGGERSUPPRESSIONAUDIOSOURCE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"MHSELFTRIGGERSUPPRESSIONAUDIOSOURCE_AUDIO_VIDEO_VOICE_CONTROLLER";
    }
    if (v5 == 2) {
      uint64_t v7 = @"MHSELFTRIGGERSUPPRESSIONAUDIOSOURCE_AUDIO_TAP";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"audioSource"];
    char v4 = *(&self->_isBuiltInSpeakerActive + 1);
  }
  if ((v4 & 8) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHSelfTriggerSuppressionSession isBluetoothSpeakerActive](self, "isBluetoothSpeakerActive"));
    [v3 setObject:v11 forKeyedSubscript:@"isBluetoothSpeakerActive"];

    char v4 = *(&self->_isBuiltInSpeakerActive + 1);
    if ((v4 & 0x10) == 0)
    {
LABEL_10:
      if ((v4 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHSelfTriggerSuppressionSession isBuiltInSpeakerActive](self, "isBuiltInSpeakerActive"));
  [v3 setObject:v12 forKeyedSubscript:@"isBuiltInSpeakerActive"];

  char v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 1) == 0)
  {
LABEL_11:
    if ((v4 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_18:
  objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHSelfTriggerSuppressionSession numSelfTriggersDetectedInSession](self, "numSelfTriggersDetectedInSession"));
  [v3 setObject:v13 forKeyedSubscript:@"numSelfTriggersDetectedInSession"];

  if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) != 0)
  {
LABEL_12:
    v8 = NSNumber;
    [(MHSchemaMHSelfTriggerSuppressionSession *)self sessionDurationInSeconds];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"sessionDurationInSeconds"];
  }
LABEL_13:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char v3 = *(&self->_isBuiltInSpeakerActive + 1);
  if (v3)
  {
    uint64_t v4 = 2654435761 * self->_numSelfTriggersDetectedInSession;
    if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double sessionDurationInSeconds = self->_sessionDurationInSeconds;
  double v6 = -sessionDurationInSeconds;
  if (sessionDurationInSeconds >= 0.0) {
    double v6 = self->_sessionDurationInSeconds;
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
LABEL_11:
  if ((v3 & 4) == 0)
  {
    uint64_t v10 = 0;
    if ((v3 & 8) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v11 = 0;
    if ((v3 & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v12 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v10 = 2654435761 * self->_audioSource;
  if ((v3 & 8) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_isBluetoothSpeakerActive;
  if ((v3 & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v12 = 2654435761 * self->_isBuiltInSpeakerActive;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
  unsigned int v6 = v4[30];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (v5)
  {
    unsigned int numSelfTriggersDetectedInSession = self->_numSelfTriggersDetectedInSession;
    if (numSelfTriggersDetectedInSession != [v4 numSelfTriggersDetectedInSession]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
    unsigned int v6 = v4[30];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    double sessionDurationInSeconds = self->_sessionDurationInSeconds;
    [v4 sessionDurationInSeconds];
    if (sessionDurationInSeconds != v10) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
    unsigned int v6 = v4[30];
  }
  int v11 = (v5 >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v11)
  {
    int audioSource = self->_audioSource;
    if (audioSource != [v4 audioSource]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
    unsigned int v6 = v4[30];
  }
  int v13 = (v5 >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v13)
  {
    int isBluetoothSpeakerActive = self->_isBluetoothSpeakerActive;
    if (isBluetoothSpeakerActive == [v4 isBluetoothSpeakerActive])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1);
      unsigned int v6 = v4[30];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v17 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v15 = (v5 >> 4) & 1;
  if (v15 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v15)
  {
    int isBuiltInSpeakerActive = self->_isBuiltInSpeakerActive;
    if (isBuiltInSpeakerActive != [v4 isBuiltInSpeakerActive]) {
      goto LABEL_22;
    }
  }
  BOOL v17 = 1;
LABEL_23:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if (v4)
  {
    PBDataWriterWriteUint32Field();
    char v4 = *(&self->_isBuiltInSpeakerActive + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isBuiltInSpeakerActive + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char v4 = *(&self->_isBuiltInSpeakerActive + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isBuiltInSpeakerActive + 1) & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHSelfTriggerSuppressionSessionReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsBuiltInSpeakerActive
{
  *(&self->_isBuiltInSpeakerActive + 1) &= ~0x10u;
}

- (void)setHasIsBuiltInSpeakerActive:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xEF | v3;
}

- (BOOL)hasIsBuiltInSpeakerActive
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 4) & 1;
}

- (void)setIsBuiltInSpeakerActive:(BOOL)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 0x10u;
  self->_int isBuiltInSpeakerActive = a3;
}

- (void)deleteIsBluetoothSpeakerActive
{
  *(&self->_isBuiltInSpeakerActive + 1) &= ~8u;
}

- (void)setHasIsBluetoothSpeakerActive:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xF7 | v3;
}

- (BOOL)hasIsBluetoothSpeakerActive
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 3) & 1;
}

- (void)setIsBluetoothSpeakerActive:(BOOL)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 8u;
  self->_int isBluetoothSpeakerActive = a3;
}

- (void)deleteAudioSource
{
  *(&self->_isBuiltInSpeakerActive + 1) &= ~4u;
}

- (void)setHasAudioSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xFB | v3;
}

- (BOOL)hasAudioSource
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 2) & 1;
}

- (void)setAudioSource:(int)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 4u;
  self->_int audioSource = a3;
}

- (void)deleteSessionDurationInSeconds
{
  *(&self->_isBuiltInSpeakerActive + 1) &= ~2u;
}

- (void)setHasSessionDurationInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xFD | v3;
}

- (BOOL)hasSessionDurationInSeconds
{
  return (*((unsigned __int8 *)&self->_isBuiltInSpeakerActive + 1) >> 1) & 1;
}

- (void)setSessionDurationInSeconds:(double)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 2u;
  self->_double sessionDurationInSeconds = a3;
}

- (void)deleteNumSelfTriggersDetectedInSession
{
  *(&self->_isBuiltInSpeakerActive + 1) &= ~1u;
}

- (void)setHasNumSelfTriggersDetectedInSession:(BOOL)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) = *(&self->_isBuiltInSpeakerActive + 1) & 0xFE | a3;
}

- (BOOL)hasNumSelfTriggersDetectedInSession
{
  return *(&self->_isBuiltInSpeakerActive + 1);
}

- (void)setNumSelfTriggersDetectedInSession:(unsigned int)a3
{
  *(&self->_isBuiltInSpeakerActive + 1) |= 1u;
  self->_unsigned int numSelfTriggersDetectedInSession = a3;
}

@end