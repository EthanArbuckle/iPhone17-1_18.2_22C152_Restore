@interface MHSchemaMHAssistantDaemonAudioFanInfo
- (BOOL)hasCurrentSpeed;
- (BOOL)hasFanId;
- (BOOL)hasTargetSpeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAssistantDaemonAudioFanInfo)initWithDictionary:(id)a3;
- (MHSchemaMHAssistantDaemonAudioFanInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)currentSpeed;
- (int)targetSpeed;
- (unint64_t)hash;
- (unsigned)fanId;
- (void)deleteCurrentSpeed;
- (void)deleteFanId;
- (void)deleteTargetSpeed;
- (void)setCurrentSpeed:(int)a3;
- (void)setFanId:(unsigned int)a3;
- (void)setHasCurrentSpeed:(BOOL)a3;
- (void)setHasFanId:(BOOL)a3;
- (void)setHasTargetSpeed:(BOOL)a3;
- (void)setTargetSpeed:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAssistantDaemonAudioFanInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)targetSpeed
{
  return self->_targetSpeed;
}

- (int)currentSpeed
{
  return self->_currentSpeed;
}

- (unsigned)fanId
{
  return self->_fanId;
}

- (MHSchemaMHAssistantDaemonAudioFanInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHAssistantDaemonAudioFanInfo;
  v5 = [(MHSchemaMHAssistantDaemonAudioFanInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"fanId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioFanInfo setFanId:](v5, "setFanId:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"currentSpeed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioFanInfo setCurrentSpeed:](v5, "setCurrentSpeed:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"targetSpeed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAssistantDaemonAudioFanInfo setTargetSpeed:](v5, "setTargetSpeed:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (MHSchemaMHAssistantDaemonAudioFanInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAssistantDaemonAudioFanInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAssistantDaemonAudioFanInfo *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHAssistantDaemonAudioFanInfo currentSpeed](self, "currentSpeed"));
    [v3 setObject:v7 forKeyedSubscript:@"currentSpeed"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHAssistantDaemonAudioFanInfo fanId](self, "fanId"));
  [v3 setObject:v8 forKeyedSubscript:@"fanId"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHAssistantDaemonAudioFanInfo targetSpeed](self, "targetSpeed"));
    [v3 setObject:v5 forKeyedSubscript:@"targetSpeed"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_fanId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_currentSpeed;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_targetSpeed;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $ACD72B5FB8490925DB96324E5CA82910 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int fanId = self->_fanId;
    if (fanId != [v4 fanId]) {
      goto LABEL_14;
    }
    $ACD72B5FB8490925DB96324E5CA82910 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int currentSpeed = self->_currentSpeed;
    if (currentSpeed == [v4 currentSpeed])
    {
      $ACD72B5FB8490925DB96324E5CA82910 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int targetSpeed = self->_targetSpeed;
    if (targetSpeed != [v4 targetSpeed]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAssistantDaemonAudioFanInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteTargetSpeed
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasTargetSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTargetSpeed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTargetSpeed:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int targetSpeed = a3;
}

- (void)deleteCurrentSpeed
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCurrentSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentSpeed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCurrentSpeed:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int currentSpeed = a3;
}

- (void)deleteFanId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFanId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFanId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFanId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int fanId = a3;
}

@end