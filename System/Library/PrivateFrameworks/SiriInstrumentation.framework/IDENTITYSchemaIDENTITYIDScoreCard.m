@interface IDENTITYSchemaIDENTITYIDScoreCard
- (BOOL)hasClassification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDENTITYSchemaIDENTITYIDScoreCard)initWithDictionary:(id)a3;
- (IDENTITYSchemaIDENTITYIDScoreCard)initWithJSON:(id)a3;
- (NSArray)identityScores;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)identityScoresAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)classification;
- (unint64_t)hash;
- (unint64_t)identityScoresCount;
- (void)addIdentityScores:(id)a3;
- (void)clearIdentityScores;
- (void)deleteClassification;
- (void)setClassification:(int)a3;
- (void)setHasClassification:(BOOL)a3;
- (void)setIdentityScores:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDENTITYSchemaIDENTITYIDScoreCard

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDENTITYSchemaIDENTITYIDScoreCard;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IDENTITYSchemaIDENTITYIDScoreCard *)self identityScores];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(IDENTITYSchemaIDENTITYIDScoreCard *)self setIdentityScores:v7];
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

- (int)classification
{
  return self->_classification;
}

- (void)setIdentityScores:(id)a3
{
}

- (NSArray)identityScores
{
  return self->_identityScores;
}

- (IDENTITYSchemaIDENTITYIDScoreCard)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IDENTITYSchemaIDENTITYIDScoreCard;
  v5 = [(IDENTITYSchemaIDENTITYIDScoreCard *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identityScores"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [IDENTITYSchemaIDENTITYScoreTuple alloc];
              v14 = -[IDENTITYSchemaIDENTITYScoreTuple initWithDictionary:](v13, "initWithDictionary:", v12, (void)v18);
              [(IDENTITYSchemaIDENTITYIDScoreCard *)v5 addIdentityScores:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"classification", (void)v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IDENTITYSchemaIDENTITYIDScoreCard setClassification:](v5, "setClassification:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (IDENTITYSchemaIDENTITYIDScoreCard)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IDENTITYSchemaIDENTITYIDScoreCard *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IDENTITYSchemaIDENTITYIDScoreCard *)self dictionaryRepresentation];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(IDENTITYSchemaIDENTITYIDScoreCard *)self classification] - 1;
    if (v4 > 3) {
      v5 = @"IDENTITYUSERCLASSIFICATION_UNKNOWN";
    }
    else {
      v5 = off_1E5EBB510[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"classification"];
  }
  if ([(NSArray *)self->_identityScores count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_identityScores;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"identityScores"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v15);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_identityScores hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_classification;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IDENTITYSchemaIDENTITYIDScoreCard *)self identityScores];
  v6 = [v4 identityScores];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(IDENTITYSchemaIDENTITYIDScoreCard *)self identityScores];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(IDENTITYSchemaIDENTITYIDScoreCard *)self identityScores];
    uint64_t v11 = [v4 identityScores];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int classification = self->_classification;
    if (classification != [v4 classification]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_identityScores;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYIDScoreCardReadFrom(self, (uint64_t)a3);
}

- (void)deleteClassification
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasClassification:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClassification
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setClassification:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int classification = a3;
}

- (id)identityScoresAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_identityScores objectAtIndexedSubscript:a3];
}

- (unint64_t)identityScoresCount
{
  return [(NSArray *)self->_identityScores count];
}

- (void)addIdentityScores:(id)a3
{
  id v4 = a3;
  identityScores = self->_identityScores;
  id v8 = v4;
  if (!identityScores)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_identityScores;
    self->_identityScores = v6;

    id v4 = v8;
    identityScores = self->_identityScores;
  }
  [(NSArray *)identityScores addObject:v4];
}

- (void)clearIdentityScores
{
}

@end