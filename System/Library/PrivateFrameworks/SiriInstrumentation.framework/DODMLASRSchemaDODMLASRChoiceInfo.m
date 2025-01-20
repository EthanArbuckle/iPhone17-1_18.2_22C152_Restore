@interface DODMLASRSchemaDODMLASRChoiceInfo
- (BOOL)hasAcousticCost;
- (BOOL)hasGraphCost;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRChoiceInfo)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRChoiceInfo)initWithJSON:(id)a3;
- (NSArray)tokens;
- (NSData)jsonData;
- (float)acousticCost;
- (float)graphCost;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)tokensAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tokensCount;
- (void)addTokens:(id)a3;
- (void)clearTokens;
- (void)deleteAcousticCost;
- (void)deleteGraphCost;
- (void)setAcousticCost:(float)a3;
- (void)setGraphCost:(float)a3;
- (void)setHasAcousticCost:(BOOL)a3;
- (void)setHasGraphCost:(BOOL)a3;
- (void)setTokens:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRChoiceInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DODMLASRSchemaDODMLASRChoiceInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRChoiceInfo *)self tokens];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(DODMLASRSchemaDODMLASRChoiceInfo *)self setTokens:v7];
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

- (float)acousticCost
{
  return self->_acousticCost;
}

- (float)graphCost
{
  return self->_graphCost;
}

- (void)setTokens:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (DODMLASRSchemaDODMLASRChoiceInfo)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DODMLASRSchemaDODMLASRChoiceInfo;
  v5 = [(DODMLASRSchemaDODMLASRChoiceInfo *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [DODMLASRSchemaDODMLASRTokenInfo alloc];
              v14 = -[DODMLASRSchemaDODMLASRTokenInfo initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(DODMLASRSchemaDODMLASRChoiceInfo *)v5 addTokens:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"graphCost", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[DODMLASRSchemaDODMLASRChoiceInfo setGraphCost:](v5, "setGraphCost:");
    }
    v16 = [v4 objectForKeyedSubscript:@"acousticCost"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      -[DODMLASRSchemaDODMLASRChoiceInfo setAcousticCost:](v5, "setAcousticCost:");
    }
    v17 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRChoiceInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRChoiceInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRChoiceInfo *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = NSNumber;
    [(DODMLASRSchemaDODMLASRChoiceInfo *)self acousticCost];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"acousticCost"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v7 = NSNumber;
    [(DODMLASRSchemaDODMLASRChoiceInfo *)self graphCost];
    uint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"graphCost"];
  }
  if ([(NSArray *)self->_tokens count])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = self->_tokens;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"tokens"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v18);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_tokens hash];
  char has = (char)self->_has;
  if (has)
  {
    float graphCost = self->_graphCost;
    double v7 = graphCost;
    if (graphCost < 0.0) {
      double v7 = -graphCost;
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
    float acousticCost = self->_acousticCost;
    double v12 = acousticCost;
    if (acousticCost < 0.0) {
      double v12 = -acousticCost;
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
  return v5 ^ v3 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRChoiceInfo *)self tokens];
  v6 = [v4 tokens];
  double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(DODMLASRSchemaDODMLASRChoiceInfo *)self tokens];
    if (v8)
    {
      double v9 = (void *)v8;
      unint64_t v10 = [(DODMLASRSchemaDODMLASRChoiceInfo *)self tokens];
      uint64_t v11 = [v4 tokens];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    $B1FD75B2DA4F02B8C5526E45DC061BBA has = self->_has;
    unsigned int v14 = v4[24];
    if ((*(unsigned char *)&has & 1) == (v14 & 1))
    {
      if (*(unsigned char *)&has)
      {
        float graphCost = self->_graphCost;
        [v4 graphCost];
        if (graphCost != v16) {
          goto LABEL_15;
        }
        $B1FD75B2DA4F02B8C5526E45DC061BBA has = self->_has;
        unsigned int v14 = v4[24];
      }
      int v17 = (*(unsigned int *)&has >> 1) & 1;
      if (v17 == ((v14 >> 1) & 1))
      {
        if (!v17 || (float acousticCost = self->_acousticCost, [v4 acousticCost], acousticCost == v19))
        {
          BOOL v20 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
  }
LABEL_15:
  BOOL v20 = 0;
LABEL_16:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = self->_tokens;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
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
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRChoiceInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAcousticCost
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAcousticCost:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAcousticCost
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAcousticCost:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float acousticCost = a3;
}

- (void)deleteGraphCost
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasGraphCost:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGraphCost
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGraphCost:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float graphCost = a3;
}

- (id)tokensAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tokens objectAtIndexedSubscript:a3];
}

- (unint64_t)tokensCount
{
  return [(NSArray *)self->_tokens count];
}

- (void)addTokens:(id)a3
{
  id v4 = a3;
  tokens = self->_tokens;
  id v8 = v4;
  if (!tokens)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tokens;
    self->_tokens = v6;

    id v4 = v8;
    tokens = self->_tokens;
  }
  [(NSArray *)tokens addObject:v4];
}

- (void)clearTokens
{
}

@end