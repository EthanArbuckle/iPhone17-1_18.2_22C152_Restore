@interface PEGASUSSchemaPEGASUSAudioPlaybackSignal
- (BOOL)hasAudioPlaybackQueueLocation;
- (BOOL)hasAudioPlaybackSpeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)initWithJSON:(id)a3;
- (float)audioPlaybackSpeed;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)audioPlaybackQueueLocation;
- (unint64_t)hash;
- (void)deleteAudioPlaybackQueueLocation;
- (void)deleteAudioPlaybackSpeed;
- (void)setAudioPlaybackQueueLocation:(int)a3;
- (void)setAudioPlaybackSpeed:(float)a3;
- (void)setHasAudioPlaybackQueueLocation:(BOOL)a3;
- (void)setHasAudioPlaybackSpeed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSAudioPlaybackSignal

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)audioPlaybackSpeed
{
  return self->_audioPlaybackSpeed;
}

- (int)audioPlaybackQueueLocation
{
  return self->_audioPlaybackQueueLocation;
}

- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEGASUSSchemaPEGASUSAudioPlaybackSignal;
  v5 = [(PEGASUSSchemaPEGASUSAudioPlaybackSignal *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioPlaybackQueueLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSAudioPlaybackSignal setAudioPlaybackQueueLocation:](v5, "setAudioPlaybackQueueLocation:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"audioPlaybackSpeed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[PEGASUSSchemaPEGASUSAudioPlaybackSignal setAudioPlaybackSpeed:](v5, "setAudioPlaybackSpeed:");
    }
    v8 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSAudioPlaybackSignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSAudioPlaybackSignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSAudioPlaybackSignal *)self dictionaryRepresentation];
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
  if (has)
  {
    unsigned int v5 = [(PEGASUSSchemaPEGASUSAudioPlaybackSignal *)self audioPlaybackQueueLocation] - 1;
    if (v5 > 2) {
      v6 = @"PEGASUSAUDIOPLAYBACKQUEUELOCATION_UNKNOWN";
    }
    else {
      v6 = off_1E5EBC908[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"audioPlaybackQueueLocation"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = NSNumber;
    [(PEGASUSSchemaPEGASUSAudioPlaybackSignal *)self audioPlaybackSpeed];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"audioPlaybackSpeed"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_audioPlaybackQueueLocation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float audioPlaybackSpeed = self->_audioPlaybackSpeed;
  double v4 = audioPlaybackSpeed;
  if (audioPlaybackSpeed < 0.0) {
    double v4 = -audioPlaybackSpeed;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  $10BB006E35C241C8874FEF93FA132A15 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&has)
  {
    int audioPlaybackQueueLocation = self->_audioPlaybackQueueLocation;
    if (audioPlaybackQueueLocation != [v4 audioPlaybackQueueLocation]) {
      goto LABEL_9;
    }
    $10BB006E35C241C8874FEF93FA132A15 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (float audioPlaybackSpeed = self->_audioPlaybackSpeed,
          [v4 audioPlaybackSpeed],
          audioPlaybackSpeed == v10))
    {
      BOOL v11 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSAudioPlaybackSignalReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAudioPlaybackSpeed
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAudioPlaybackSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioPlaybackSpeed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAudioPlaybackSpeed:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float audioPlaybackSpeed = a3;
}

- (void)deleteAudioPlaybackQueueLocation
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAudioPlaybackQueueLocation:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioPlaybackQueueLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioPlaybackQueueLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int audioPlaybackQueueLocation = a3;
}

@end