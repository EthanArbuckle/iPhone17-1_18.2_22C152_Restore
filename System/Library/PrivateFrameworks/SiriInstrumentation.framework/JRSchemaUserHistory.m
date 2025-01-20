@interface JRSchemaUserHistory
- (BOOL)hasHistoricalFeedback;
- (BOOL)hasToolId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaUserHistory)initWithDictionary:(id)a3;
- (JRSchemaUserHistory)initWithJSON:(id)a3;
- (NSArray)historicalContexts;
- (NSData)jsonData;
- (SISchemaUUID)toolId;
- (float)historicalContextAtIndex:(unint64_t)a3;
- (float)historicalFeedback;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)historicalContextCount;
- (void)addHistoricalContext:(float)a3;
- (void)clearHistoricalContext;
- (void)deleteHistoricalFeedback;
- (void)deleteToolId;
- (void)setHasHistoricalFeedback:(BOOL)a3;
- (void)setHasToolId:(BOOL)a3;
- (void)setHistoricalContexts:(id)a3;
- (void)setHistoricalFeedback:(float)a3;
- (void)setToolId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaUserHistory

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JRSchemaUserHistory;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:4]) {
    [(JRSchemaUserHistory *)self deleteToolId];
  }
  v6 = [(JRSchemaUserHistory *)self toolId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(JRSchemaUserHistory *)self deleteToolId];
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
  objc_storeStrong((id *)&self->_historicalContexts, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
}

- (void)setHasToolId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)historicalFeedback
{
  return self->_historicalFeedback;
}

- (void)setHistoricalContexts:(id)a3
{
}

- (NSArray)historicalContexts
{
  return self->_historicalContexts;
}

- (void)setToolId:(id)a3
{
}

- (SISchemaUUID)toolId
{
  return self->_toolId;
}

- (JRSchemaUserHistory)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)JRSchemaUserHistory;
  v5 = [(JRSchemaUserHistory *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"toolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(JRSchemaUserHistory *)v5 setToolId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"historicalContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_msgSend(v14, "floatValue", (void)v18);
              -[JRSchemaUserHistory addHistoricalContext:](v5, "addHistoricalContext:");
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v11);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"historicalFeedback", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[JRSchemaUserHistory setHistoricalFeedback:](v5, "setHistoricalFeedback:");
    }
    v16 = v5;
  }
  return v5;
}

- (JRSchemaUserHistory)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(JRSchemaUserHistory *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaUserHistory *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_historicalContexts count])
  {
    id v4 = [(JRSchemaUserHistory *)self historicalContexts];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"historicalContext"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = NSNumber;
    [(JRSchemaUserHistory *)self historicalFeedback];
    uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"historicalFeedback"];
  }
  if (self->_toolId)
  {
    int v8 = [(JRSchemaUserHistory *)self toolId];
    id v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"toolId"];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"toolId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_toolId hash];
  uint64_t v4 = [(NSArray *)self->_historicalContexts hash];
  if (*(unsigned char *)&self->_has)
  {
    float historicalFeedback = self->_historicalFeedback;
    double v7 = historicalFeedback;
    if (historicalFeedback < 0.0) {
      double v7 = -historicalFeedback;
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
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  unint64_t v5 = [(JRSchemaUserHistory *)self toolId];
  v6 = [v4 toolId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(JRSchemaUserHistory *)self toolId];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(JRSchemaUserHistory *)self toolId];
    uint64_t v10 = [v4 toolId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v5 = [(JRSchemaUserHistory *)self historicalContexts];
  v6 = [v4 historicalContexts];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(JRSchemaUserHistory *)self historicalContexts];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(JRSchemaUserHistory *)self historicalContexts];
    v15 = [v4 historicalContexts];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (float historicalFeedback = self->_historicalFeedback,
          [v4 historicalFeedback],
          historicalFeedback == v20))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(JRSchemaUserHistory *)self toolId];

  if (v5)
  {
    v6 = [(JRSchemaUserHistory *)self toolId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_historicalContexts;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "floatValue", (void)v12);
        PBDataWriterWriteFloatField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaUserHistoryReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteHistoricalFeedback
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHistoricalFeedback:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHistoricalFeedback
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHistoricalFeedback:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float historicalFeedback = a3;
}

- (float)historicalContextAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_historicalContexts objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (unint64_t)historicalContextCount
{
  return [(NSArray *)self->_historicalContexts count];
}

- (void)addHistoricalContext:(float)a3
{
  historicalContexts = self->_historicalContexts;
  if (!historicalContexts)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_historicalContexts;
    self->_historicalContexts = v6;

    historicalContexts = self->_historicalContexts;
  }
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(NSArray *)historicalContexts addObject:v9];
}

- (void)clearHistoricalContext
{
}

- (void)deleteToolId
{
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

@end