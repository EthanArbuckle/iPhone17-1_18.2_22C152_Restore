@interface ASRSchemaASRRescoringDeliberationResult
- (ASRSchemaASRRescoringDeliberationResult)initWithDictionary:(id)a3;
- (ASRSchemaASRRescoringDeliberationResult)initWithJSON:(id)a3;
- (BOOL)hasRescoringFinalizeDuration;
- (BOOL)hasRescoringLinkId;
- (BOOL)hasRescoringResultDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)rescoringEvents;
- (NSData)jsonData;
- (SISchemaUUID)rescoringLinkId;
- (float)rescoringFinalizeDuration;
- (float)rescoringResultDuration;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)rescoringEventsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)rescoringEventsCount;
- (void)addRescoringEvents:(id)a3;
- (void)clearRescoringEvents;
- (void)deleteRescoringFinalizeDuration;
- (void)deleteRescoringLinkId;
- (void)deleteRescoringResultDuration;
- (void)setHasRescoringFinalizeDuration:(BOOL)a3;
- (void)setHasRescoringLinkId:(BOOL)a3;
- (void)setHasRescoringResultDuration:(BOOL)a3;
- (void)setRescoringEvents:(id)a3;
- (void)setRescoringFinalizeDuration:(float)a3;
- (void)setRescoringLinkId:(id)a3;
- (void)setRescoringResultDuration:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRRescoringDeliberationResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRRescoringDeliberationResult;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringLinkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRRescoringDeliberationResult *)self deleteRescoringLinkId];
  }
  v9 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringEvents];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(ASRSchemaASRRescoringDeliberationResult *)self setRescoringEvents:v10];

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
  objc_storeStrong((id *)&self->_rescoringEvents, 0);
  objc_storeStrong((id *)&self->_rescoringLinkId, 0);
}

- (void)setHasRescoringLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setRescoringEvents:(id)a3
{
}

- (NSArray)rescoringEvents
{
  return self->_rescoringEvents;
}

- (float)rescoringFinalizeDuration
{
  return self->_rescoringFinalizeDuration;
}

- (float)rescoringResultDuration
{
  return self->_rescoringResultDuration;
}

- (void)setRescoringLinkId:(id)a3
{
}

- (SISchemaUUID)rescoringLinkId
{
  return self->_rescoringLinkId;
}

- (ASRSchemaASRRescoringDeliberationResult)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ASRSchemaASRRescoringDeliberationResult;
  v5 = [(ASRSchemaASRRescoringDeliberationResult *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rescoringLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRRescoringDeliberationResult *)v5 setRescoringLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"rescoringResultDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[ASRSchemaASRRescoringDeliberationResult setRescoringResultDuration:](v5, "setRescoringResultDuration:");
    }
    v9 = [v4 objectForKeyedSubscript:@"rescoringFinalizeDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[ASRSchemaASRRescoringDeliberationResult setRescoringFinalizeDuration:](v5, "setRescoringFinalizeDuration:");
    }
    v10 = [v4 objectForKeyedSubscript:@"rescoringEvents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v9;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[ASRSchemaASRRescoringDeliberationEvent alloc] initWithDictionary:v16];
              [(ASRSchemaASRRescoringDeliberationResult *)v5 addRescoringEvents:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v6 = v21;
      v9 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (ASRSchemaASRRescoringDeliberationResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRRescoringDeliberationResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRRescoringDeliberationResult *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_rescoringEvents count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = self->_rescoringEvents;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"rescoringEvents"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v12 = NSNumber;
    [(ASRSchemaASRRescoringDeliberationResult *)self rescoringFinalizeDuration];
    uint64_t v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"rescoringFinalizeDuration"];
  }
  if (self->_rescoringLinkId)
  {
    uint64_t v14 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringLinkId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"rescoringLinkId"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"rescoringLinkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v17 = NSNumber;
    [(ASRSchemaASRRescoringDeliberationResult *)self rescoringResultDuration];
    v18 = objc_msgSend(v17, "numberWithFloat:");
    [v3 setObject:v18 forKeyedSubscript:@"rescoringResultDuration"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v20);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_rescoringLinkId hash];
  char has = (char)self->_has;
  if (has)
  {
    float rescoringResultDuration = self->_rescoringResultDuration;
    double v7 = rescoringResultDuration;
    if (rescoringResultDuration < 0.0) {
      double v7 = -rescoringResultDuration;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    float rescoringFinalizeDuration = self->_rescoringFinalizeDuration;
    double v12 = rescoringFinalizeDuration;
    if (rescoringFinalizeDuration < 0.0) {
      double v12 = -rescoringFinalizeDuration;
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
  return v5 ^ v3 ^ v10 ^ [(NSArray *)self->_rescoringEvents hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  unint64_t v5 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringLinkId];
  uint64_t v6 = [v4 rescoringLinkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_18;
  }
  uint64_t v7 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringLinkId];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringLinkId];
    unint64_t v10 = [v4 rescoringLinkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $DA87B2DA1870C0AEAA7F045EC84AE119 has = self->_has;
  unsigned int v13 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&has)
  {
    float rescoringResultDuration = self->_rescoringResultDuration;
    [v4 rescoringResultDuration];
    if (rescoringResultDuration != v15) {
      goto LABEL_19;
    }
    $DA87B2DA1870C0AEAA7F045EC84AE119 has = self->_has;
    unsigned int v13 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v16)
  {
    float rescoringFinalizeDuration = self->_rescoringFinalizeDuration;
    [v4 rescoringFinalizeDuration];
    if (rescoringFinalizeDuration != v18) {
      goto LABEL_19;
    }
  }
  unint64_t v5 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringEvents];
  uint64_t v6 = [v4 rescoringEvents];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v19 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringEvents];
  if (!v19)
  {

LABEL_22:
    BOOL v24 = 1;
    goto LABEL_20;
  }
  long long v20 = (void *)v19;
  long long v21 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringEvents];
  long long v22 = [v4 rescoringEvents];
  char v23 = [v21 isEqual:v22];

  if (v23) {
    goto LABEL_22;
  }
LABEL_19:
  BOOL v24 = 0;
LABEL_20:

  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringLinkId];

  if (v5)
  {
    uint64_t v6 = [(ASRSchemaASRRescoringDeliberationResult *)self rescoringLinkId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long double v8 = self->_rescoringEvents;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRescoringDeliberationResultReadFrom(self, (uint64_t)a3, v3);
}

- (id)rescoringEventsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_rescoringEvents objectAtIndexedSubscript:a3];
}

- (unint64_t)rescoringEventsCount
{
  return [(NSArray *)self->_rescoringEvents count];
}

- (void)addRescoringEvents:(id)a3
{
  id v4 = a3;
  rescoringEvents = self->_rescoringEvents;
  id v8 = v4;
  if (!rescoringEvents)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_rescoringEvents;
    self->_rescoringEvents = v6;

    id v4 = v8;
    rescoringEvents = self->_rescoringEvents;
  }
  [(NSArray *)rescoringEvents addObject:v4];
}

- (void)clearRescoringEvents
{
}

- (void)deleteRescoringFinalizeDuration
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRescoringFinalizeDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRescoringFinalizeDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRescoringFinalizeDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float rescoringFinalizeDuration = a3;
}

- (void)deleteRescoringResultDuration
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRescoringResultDuration:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRescoringResultDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRescoringResultDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float rescoringResultDuration = a3;
}

- (void)deleteRescoringLinkId
{
}

- (BOOL)hasRescoringLinkId
{
  return self->_rescoringLinkId != 0;
}

@end