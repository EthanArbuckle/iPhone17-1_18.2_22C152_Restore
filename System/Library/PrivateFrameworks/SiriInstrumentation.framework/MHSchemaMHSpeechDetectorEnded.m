@interface MHSchemaMHSpeechDetectorEnded
- (BOOL)hasAmountOfSpeechDetectedInMs;
- (BOOL)hasPreviousRequestId;
- (BOOL)hasStartSpeechDetectionThresholdInMs;
- (BOOL)hasTimeSinceLastAcceptedRequestInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHSpeechDetectorEnded)initWithDictionary:(id)a3;
- (MHSchemaMHSpeechDetectorEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)previousRequestId;
- (float)amountOfSpeechDetectedInMs;
- (float)startSpeechDetectionThresholdInMs;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)timeSinceLastAcceptedRequestInNs;
- (void)deleteAmountOfSpeechDetectedInMs;
- (void)deletePreviousRequestId;
- (void)deleteStartSpeechDetectionThresholdInMs;
- (void)deleteTimeSinceLastAcceptedRequestInNs;
- (void)setAmountOfSpeechDetectedInMs:(float)a3;
- (void)setHasAmountOfSpeechDetectedInMs:(BOOL)a3;
- (void)setHasPreviousRequestId:(BOOL)a3;
- (void)setHasStartSpeechDetectionThresholdInMs:(BOOL)a3;
- (void)setHasTimeSinceLastAcceptedRequestInNs:(BOOL)a3;
- (void)setPreviousRequestId:(id)a3;
- (void)setStartSpeechDetectionThresholdInMs:(float)a3;
- (void)setTimeSinceLastAcceptedRequestInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHSpeechDetectorEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHSpeechDetectorEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHSpeechDetectorEnded *)self previousRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(MHSchemaMHSpeechDetectorEnded *)self deletePreviousRequestId];
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
}

- (void)setHasPreviousRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)startSpeechDetectionThresholdInMs
{
  return self->_startSpeechDetectionThresholdInMs;
}

- (float)amountOfSpeechDetectedInMs
{
  return self->_amountOfSpeechDetectedInMs;
}

- (unint64_t)timeSinceLastAcceptedRequestInNs
{
  return self->_timeSinceLastAcceptedRequestInNs;
}

- (void)setPreviousRequestId:(id)a3
{
}

- (SISchemaUUID)previousRequestId
{
  return self->_previousRequestId;
}

- (MHSchemaMHSpeechDetectorEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHSpeechDetectorEnded;
  v5 = [(MHSchemaMHSpeechDetectorEnded *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"previousRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(MHSchemaMHSpeechDetectorEnded *)v5 setPreviousRequestId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"timeSinceLastAcceptedRequestInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHSpeechDetectorEnded setTimeSinceLastAcceptedRequestInNs:](v5, "setTimeSinceLastAcceptedRequestInNs:", [v8 unsignedLongLongValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"amountOfSpeechDetectedInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHSpeechDetectorEnded setAmountOfSpeechDetectedInMs:](v5, "setAmountOfSpeechDetectedInMs:");
    }
    v10 = [v4 objectForKeyedSubscript:@"startSpeechDetectionThresholdInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[MHSchemaMHSpeechDetectorEnded setStartSpeechDetectionThresholdInMs:](v5, "setStartSpeechDetectionThresholdInMs:");
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHSpeechDetectorEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHSpeechDetectorEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHSpeechDetectorEnded *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = NSNumber;
    [(MHSchemaMHSpeechDetectorEnded *)self amountOfSpeechDetectedInMs];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"amountOfSpeechDetectedInMs"];
  }
  if (self->_previousRequestId)
  {
    v6 = [(MHSchemaMHSpeechDetectorEnded *)self previousRequestId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"previousRequestId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"previousRequestId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = NSNumber;
    [(MHSchemaMHSpeechDetectorEnded *)self startSpeechDetectionThresholdInMs];
    v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"startSpeechDetectionThresholdInMs"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHSpeechDetectorEnded timeSinceLastAcceptedRequestInNs](self, "timeSinceLastAcceptedRequestInNs"));
    [v3 setObject:v12 forKeyedSubscript:@"timeSinceLastAcceptedRequestInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_previousRequestId hash];
  char has = (char)self->_has;
  if (has)
  {
    unint64_t v5 = 2654435761u * self->_timeSinceLastAcceptedRequestInNs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float amountOfSpeechDetectedInMs = self->_amountOfSpeechDetectedInMs;
  double v7 = amountOfSpeechDetectedInMs;
  if (amountOfSpeechDetectedInMs < 0.0) {
    double v7 = -amountOfSpeechDetectedInMs;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    float startSpeechDetectionThresholdInMs = self->_startSpeechDetectionThresholdInMs;
    double v13 = startSpeechDetectionThresholdInMs;
    if (startSpeechDetectionThresholdInMs < 0.0) {
      double v13 = -startSpeechDetectionThresholdInMs;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  unint64_t v5 = [(MHSchemaMHSpeechDetectorEnded *)self previousRequestId];
  v6 = [v4 previousRequestId];
  double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(MHSchemaMHSpeechDetectorEnded *)self previousRequestId];
    if (v8)
    {
      double v9 = (void *)v8;
      unint64_t v10 = [(MHSchemaMHSpeechDetectorEnded *)self previousRequestId];
      unint64_t v11 = [v4 previousRequestId];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    $43D1D06FA34761E24804D22522CA737B has = self->_has;
    unsigned int v14 = v4[32];
    if ((*(unsigned char *)&has & 1) == (v14 & 1))
    {
      if (*(unsigned char *)&has)
      {
        unint64_t timeSinceLastAcceptedRequestInNs = self->_timeSinceLastAcceptedRequestInNs;
        if (timeSinceLastAcceptedRequestInNs != [v4 timeSinceLastAcceptedRequestInNs]) {
          goto LABEL_19;
        }
        $43D1D06FA34761E24804D22522CA737B has = self->_has;
        unsigned int v14 = v4[32];
      }
      int v16 = (*(unsigned int *)&has >> 1) & 1;
      if (v16 == ((v14 >> 1) & 1))
      {
        if (v16)
        {
          float amountOfSpeechDetectedInMs = self->_amountOfSpeechDetectedInMs;
          [v4 amountOfSpeechDetectedInMs];
          if (amountOfSpeechDetectedInMs != v18) {
            goto LABEL_19;
          }
          $43D1D06FA34761E24804D22522CA737B has = self->_has;
          unsigned int v14 = v4[32];
        }
        int v19 = (*(unsigned int *)&has >> 2) & 1;
        if (v19 == ((v14 >> 2) & 1))
        {
          if (!v19
            || (float startSpeechDetectionThresholdInMs = self->_startSpeechDetectionThresholdInMs,
                [v4 startSpeechDetectionThresholdInMs],
                startSpeechDetectionThresholdInMs == v21))
          {
            BOOL v22 = 1;
            goto LABEL_20;
          }
        }
      }
    }
  }
  else
  {
  }
LABEL_19:
  BOOL v22 = 0;
LABEL_20:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(MHSchemaMHSpeechDetectorEnded *)self previousRequestId];

  if (v4)
  {
    unint64_t v5 = [(MHSchemaMHSpeechDetectorEnded *)self previousRequestId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  double v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    double v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    double v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHSpeechDetectorEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteStartSpeechDetectionThresholdInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasStartSpeechDetectionThresholdInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartSpeechDetectionThresholdInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartSpeechDetectionThresholdInMs:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float startSpeechDetectionThresholdInMs = a3;
}

- (void)deleteAmountOfSpeechDetectedInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAmountOfSpeechDetectedInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAmountOfSpeechDetectedInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAmountOfSpeechDetectedInMs:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float amountOfSpeechDetectedInMs = a3;
}

- (void)deleteTimeSinceLastAcceptedRequestInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimeSinceLastAcceptedRequestInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeSinceLastAcceptedRequestInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeSinceLastAcceptedRequestInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t timeSinceLastAcceptedRequestInNs = a3;
}

- (void)deletePreviousRequestId
{
}

- (BOOL)hasPreviousRequestId
{
  return self->_previousRequestId != 0;
}

@end