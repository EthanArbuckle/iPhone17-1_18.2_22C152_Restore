@interface CDASchemaCDAElectionAdvertisingStartStarted
- (BOOL)hasAdvertisementDelay;
- (BOOL)hasAdvertisementInterval;
- (BOOL)hasState;
- (BOOL)hasVoiceTriggerLatency;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CDASchemaCDAElectionAdvertisingStartStarted)initWithDictionary:(id)a3;
- (CDASchemaCDAElectionAdvertisingStartStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)advertisementDelay;
- (float)advertisementInterval;
- (float)voiceTriggerLatency;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)state;
- (unint64_t)hash;
- (void)deleteAdvertisementDelay;
- (void)deleteAdvertisementInterval;
- (void)deleteState;
- (void)deleteVoiceTriggerLatency;
- (void)setAdvertisementDelay:(float)a3;
- (void)setAdvertisementInterval:(float)a3;
- (void)setHasAdvertisementDelay:(BOOL)a3;
- (void)setHasAdvertisementInterval:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasVoiceTriggerLatency:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setVoiceTriggerLatency:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation CDASchemaCDAElectionAdvertisingStartStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)voiceTriggerLatency
{
  return self->_voiceTriggerLatency;
}

- (float)advertisementDelay
{
  return self->_advertisementDelay;
}

- (float)advertisementInterval
{
  return self->_advertisementInterval;
}

- (int)state
{
  return self->_state;
}

- (CDASchemaCDAElectionAdvertisingStartStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDASchemaCDAElectionAdvertisingStartStarted;
  v5 = [(CDASchemaCDAElectionAdvertisingStartStarted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CDASchemaCDAElectionAdvertisingStartStarted setState:](v5, "setState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"advertisementInterval"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[CDASchemaCDAElectionAdvertisingStartStarted setAdvertisementInterval:](v5, "setAdvertisementInterval:");
    }
    v8 = [v4 objectForKeyedSubscript:@"advertisementDelay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[CDASchemaCDAElectionAdvertisingStartStarted setAdvertisementDelay:](v5, "setAdvertisementDelay:");
    }
    v9 = [v4 objectForKeyedSubscript:@"voiceTriggerLatency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[CDASchemaCDAElectionAdvertisingStartStarted setVoiceTriggerLatency:](v5, "setVoiceTriggerLatency:");
    }
    v10 = v5;
  }
  return v5;
}

- (CDASchemaCDAElectionAdvertisingStartStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CDASchemaCDAElectionAdvertisingStartStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CDASchemaCDAElectionAdvertisingStartStarted *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    v8 = NSNumber;
    [(CDASchemaCDAElectionAdvertisingStartStarted *)self advertisementDelay];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"advertisementDelay"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(CDASchemaCDAElectionAdvertisingStartStarted *)self advertisementInterval];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"advertisementInterval"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  unsigned int v12 = [(CDASchemaCDAElectionAdvertisingStartStarted *)self state] - 1;
  if (v12 > 0x11) {
    v13 = @"CDASTATE_UNKNOWN";
  }
  else {
    v13 = off_1E5EACF30[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"state"];
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  v5 = NSNumber;
  [(CDASchemaCDAElectionAdvertisingStartStarted *)self voiceTriggerLatency];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  [v3 setObject:v6 forKeyedSubscript:@"voiceTriggerLatency"];

LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_state;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float advertisementInterval = self->_advertisementInterval;
  double v6 = advertisementInterval;
  if (advertisementInterval < 0.0) {
    double v6 = -advertisementInterval;
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
  if ((has & 4) != 0)
  {
    float advertisementDelay = self->_advertisementDelay;
    double v12 = advertisementDelay;
    if (advertisementDelay < 0.0) {
      double v12 = -advertisementDelay;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 8) != 0)
  {
    float voiceTriggerLatency = self->_voiceTriggerLatency;
    double v17 = voiceTriggerLatency;
    if (voiceTriggerLatency < 0.0) {
      double v17 = -voiceTriggerLatency;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  $9E885E6731FDA7DE6038BE83DEED876D has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int state = self->_state;
    if (state != [v4 state]) {
      goto LABEL_17;
    }
    $9E885E6731FDA7DE6038BE83DEED876D has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      float advertisementInterval = self->_advertisementInterval;
      [v4 advertisementInterval];
      if (advertisementInterval != v10) {
        goto LABEL_17;
      }
      $9E885E6731FDA7DE6038BE83DEED876D has = self->_has;
      unsigned int v6 = v4[24];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (v11)
      {
        float advertisementDelay = self->_advertisementDelay;
        [v4 advertisementDelay];
        if (advertisementDelay != v13) {
          goto LABEL_17;
        }
        $9E885E6731FDA7DE6038BE83DEED876D has = self->_has;
        unsigned int v6 = v4[24];
      }
      int v14 = (*(unsigned int *)&has >> 3) & 1;
      if (v14 == ((v6 >> 3) & 1))
      {
        if (!v14
          || (float voiceTriggerLatency = self->_voiceTriggerLatency,
              [v4 voiceTriggerLatency],
              voiceTriggerLatency == v16))
        {
          BOOL v17 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  BOOL v17 = 0;
LABEL_18:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAElectionAdvertisingStartStartedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteVoiceTriggerLatency
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasVoiceTriggerLatency:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVoiceTriggerLatency
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVoiceTriggerLatency:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float voiceTriggerLatency = a3;
}

- (void)deleteAdvertisementDelay
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAdvertisementDelay:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAdvertisementDelay
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAdvertisementDelay:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float advertisementDelay = a3;
}

- (void)deleteAdvertisementInterval
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAdvertisementInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAdvertisementInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAdvertisementInterval:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float advertisementInterval = a3;
}

- (void)deleteState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int state = a3;
}

@end