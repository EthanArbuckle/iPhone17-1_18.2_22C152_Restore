@interface SISchemaSelfTriggerSuppressionMetrics
- (BOOL)hasDurationSelfTriggerSuppressionWasActiveInSeconds;
- (BOOL)hasNumSelfTriggersDetected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)selfTriggerSuppressionSessions;
- (NSData)jsonData;
- (SISchemaSelfTriggerSuppressionMetrics)initWithDictionary:(id)a3;
- (SISchemaSelfTriggerSuppressionMetrics)initWithJSON:(id)a3;
- (double)durationSelfTriggerSuppressionWasActiveInSeconds;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- selfTriggerSuppressionSessionsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)numSelfTriggersDetected;
- (unint64_t)hash;
- (unint64_t)selfTriggerSuppressionSessionsCount;
- (void)addSelfTriggerSuppressionSessions:(id)a3;
- (void)clearSelfTriggerSuppressionSessions;
- (void)deleteDurationSelfTriggerSuppressionWasActiveInSeconds;
- (void)deleteNumSelfTriggersDetected;
- (void)setDurationSelfTriggerSuppressionWasActiveInSeconds:(double)a3;
- (void)setHasDurationSelfTriggerSuppressionWasActiveInSeconds:(BOOL)a3;
- (void)setHasNumSelfTriggersDetected:(BOOL)a3;
- (void)setNumSelfTriggersDetected:(int)a3;
- (void)setSelfTriggerSuppressionSessions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaSelfTriggerSuppressionMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaSelfTriggerSuppressionMetrics;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaSelfTriggerSuppressionMetrics *)self selfTriggerSuppressionSessions];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(SISchemaSelfTriggerSuppressionMetrics *)self setSelfTriggerSuppressionSessions:v7];
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

- (void)setSelfTriggerSuppressionSessions:(id)a3
{
}

- (NSArray)selfTriggerSuppressionSessions
{
  return self->_selfTriggerSuppressionSessions;
}

- (double)durationSelfTriggerSuppressionWasActiveInSeconds
{
  return self->_durationSelfTriggerSuppressionWasActiveInSeconds;
}

- (int)numSelfTriggersDetected
{
  return self->_numSelfTriggersDetected;
}

- (SISchemaSelfTriggerSuppressionMetrics)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SISchemaSelfTriggerSuppressionMetrics;
  v5 = [(SISchemaSelfTriggerSuppressionMetrics *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numSelfTriggersDetected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaSelfTriggerSuppressionMetrics setNumSelfTriggersDetected:](v5, "setNumSelfTriggersDetected:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"durationSelfTriggerSuppressionWasActiveInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[SISchemaSelfTriggerSuppressionMetrics setDurationSelfTriggerSuppressionWasActiveInSeconds:](v5, "setDurationSelfTriggerSuppressionWasActiveInSeconds:");
    }
    v8 = [v4 objectForKeyedSubscript:@"selfTriggerSuppressionSessions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v7;
      v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[MHSchemaMHSelfTriggerSuppressionSession alloc] initWithDictionary:v14];
              [(SISchemaSelfTriggerSuppressionMetrics *)v5 addSelfTriggerSuppressionSessions:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      v7 = v18;
      v6 = v19;
    }
    v16 = v5;
  }
  return v5;
}

- (SISchemaSelfTriggerSuppressionMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaSelfTriggerSuppressionMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaSelfTriggerSuppressionMetrics *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = NSNumber;
    [(SISchemaSelfTriggerSuppressionMetrics *)self durationSelfTriggerSuppressionWasActiveInSeconds];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"durationSelfTriggerSuppressionWasActiveInSeconds"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaSelfTriggerSuppressionMetrics numSelfTriggersDetected](self, "numSelfTriggersDetected"));
    [v3 setObject:v7 forKeyedSubscript:@"numSelfTriggersDetected"];
  }
  if ([(NSArray *)self->_selfTriggerSuppressionSessions count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = self->_selfTriggerSuppressionSessions;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"selfTriggerSuppressionSessions"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v17);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_numSelfTriggersDetected;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NSArray *)self->_selfTriggerSuppressionSessions hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double durationSelfTriggerSuppressionWasActiveInSeconds = self->_durationSelfTriggerSuppressionWasActiveInSeconds;
  double v5 = -durationSelfTriggerSuppressionWasActiveInSeconds;
  if (durationSelfTriggerSuppressionWasActiveInSeconds >= 0.0) {
    double v5 = self->_durationSelfTriggerSuppressionWasActiveInSeconds;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ [(NSArray *)self->_selfTriggerSuppressionSessions hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $571A6FCFD627308075324C3C695AF493 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int numSelfTriggersDetected = self->_numSelfTriggersDetected;
    if (numSelfTriggersDetected != [v4 numSelfTriggersDetected]) {
      goto LABEL_14;
    }
    $571A6FCFD627308075324C3C695AF493 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (double durationSelfTriggerSuppressionWasActiveInSeconds = self->_durationSelfTriggerSuppressionWasActiveInSeconds,
          [v4 durationSelfTriggerSuppressionWasActiveInSeconds],
          durationSelfTriggerSuppressionWasActiveInSeconds == v10))
    {
      uint64_t v11 = [(SISchemaSelfTriggerSuppressionMetrics *)self selfTriggerSuppressionSessions];
      uint64_t v12 = [v4 selfTriggerSuppressionSessions];
      uint64_t v13 = v12;
      if ((v11 == 0) != (v12 != 0))
      {
        uint64_t v14 = [(SISchemaSelfTriggerSuppressionMetrics *)self selfTriggerSuppressionSessions];
        if (!v14)
        {

LABEL_17:
          BOOL v19 = 1;
          goto LABEL_15;
        }
        v15 = (void *)v14;
        v16 = [(SISchemaSelfTriggerSuppressionMetrics *)self selfTriggerSuppressionSessions];
        long long v17 = [v4 selfTriggerSuppressionSessions];
        char v18 = [v16 isEqual:v17];

        if (v18) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_selfTriggerSuppressionSessions;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaSelfTriggerSuppressionMetricsReadFrom(self, (uint64_t)a3);
}

- selfTriggerSuppressionSessionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_selfTriggerSuppressionSessions objectAtIndexedSubscript:a3];
}

- (unint64_t)selfTriggerSuppressionSessionsCount
{
  return [(NSArray *)self->_selfTriggerSuppressionSessions count];
}

- (void)addSelfTriggerSuppressionSessions:(id)a3
{
  id v4 = a3;
  selfTriggerSuppressionSessions = self->_selfTriggerSuppressionSessions;
  id v8 = v4;
  if (!selfTriggerSuppressionSessions)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_selfTriggerSuppressionSessions;
    self->_selfTriggerSuppressionSessions = v6;

    id v4 = v8;
    selfTriggerSuppressionSessions = self->_selfTriggerSuppressionSessions;
  }
  [(NSArray *)selfTriggerSuppressionSessions addObject:v4];
}

- (void)clearSelfTriggerSuppressionSessions
{
}

- (void)deleteDurationSelfTriggerSuppressionWasActiveInSeconds
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDurationSelfTriggerSuppressionWasActiveInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationSelfTriggerSuppressionWasActiveInSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDurationSelfTriggerSuppressionWasActiveInSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double durationSelfTriggerSuppressionWasActiveInSeconds = a3;
}

- (void)deleteNumSelfTriggersDetected
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumSelfTriggersDetected:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumSelfTriggersDetected
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumSelfTriggersDetected:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int numSelfTriggersDetected = a3;
}

@end