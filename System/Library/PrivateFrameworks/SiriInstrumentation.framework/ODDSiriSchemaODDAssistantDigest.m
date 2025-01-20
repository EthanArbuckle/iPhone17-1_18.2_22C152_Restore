@interface ODDSiriSchemaODDAssistantDigest
- (BOOL)hasCounts;
- (BOOL)hasDimensions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)turnIds;
- (NSData)jsonData;
- (ODDSiriSchemaODDAssistantCounts)counts;
- (ODDSiriSchemaODDAssistantDigest)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssistantDigest)initWithJSON:(id)a3;
- (ODDSiriSchemaODDAssistantDimensions)dimensions;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)turnIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)turnIdsCount;
- (void)addTurnIds:(id)a3;
- (void)clearTurnIds;
- (void)deleteCounts;
- (void)deleteDimensions;
- (void)setCounts:(id)a3;
- (void)setDimensions:(id)a3;
- (void)setHasCounts:(BOOL)a3;
- (void)setHasDimensions:(BOOL)a3;
- (void)setTurnIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssistantDigest

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDAssistantDigest;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8]) {
    [(ODDSiriSchemaODDAssistantDigest *)self deleteTurnIds];
  }
  v6 = [(ODDSiriSchemaODDAssistantDigest *)self dimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDAssistantDigest *)self deleteDimensions];
  }
  v9 = [(ODDSiriSchemaODDAssistantDigest *)self counts];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDAssistantDigest *)self deleteCounts];
  }
  v12 = [(ODDSiriSchemaODDAssistantDigest *)self turnIds];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(ODDSiriSchemaODDAssistantDigest *)self setTurnIds:v13];

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
  objc_storeStrong((id *)&self->_turnIds, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

- (void)setHasCounts:(BOOL)a3
{
  self->_hasCounts = a3;
}

- (void)setHasDimensions:(BOOL)a3
{
  self->_hasDimensions = a3;
}

- (void)setTurnIds:(id)a3
{
}

- (NSArray)turnIds
{
  return self->_turnIds;
}

- (void)setCounts:(id)a3
{
}

- (ODDSiriSchemaODDAssistantCounts)counts
{
  return self->_counts;
}

- (void)setDimensions:(id)a3
{
}

- (ODDSiriSchemaODDAssistantDimensions)dimensions
{
  return self->_dimensions;
}

- (ODDSiriSchemaODDAssistantDigest)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ODDSiriSchemaODDAssistantDigest;
  v5 = [(ODDSiriSchemaODDAssistantDigest *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAssistantDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssistantDigest *)v5 setDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"counts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDAssistantCounts alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDAssistantDigest *)v5 setCounts:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"turnIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v8;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
              [(ODDSiriSchemaODDAssistantDigest *)v5 addTurnIds:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v13);
      }

      int v8 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssistantDigest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssistantDigest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssistantDigest *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_counts)
  {
    id v4 = [(ODDSiriSchemaODDAssistantDigest *)self counts];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"counts"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"counts"];
    }
  }
  if (self->_dimensions)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantDigest *)self dimensions];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"dimensions"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"dimensions"];
    }
  }
  if ([(NSArray *)self->_turnIds count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = self->_turnIds;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"turnIds"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDAssistantDimensions *)self->_dimensions hash];
  unint64_t v4 = [(ODDSiriSchemaODDAssistantCounts *)self->_counts hash] ^ v3;
  return v4 ^ [(NSArray *)self->_turnIds hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ODDSiriSchemaODDAssistantDigest *)self dimensions];
  v6 = [v4 dimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantDigest *)self dimensions];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDAssistantDigest *)self dimensions];
    v10 = [v4 dimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDAssistantDigest *)self counts];
  v6 = [v4 counts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ODDSiriSchemaODDAssistantDigest *)self counts];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(ODDSiriSchemaODDAssistantDigest *)self counts];
    objc_super v15 = [v4 counts];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDAssistantDigest *)self turnIds];
  v6 = [v4 turnIds];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ODDSiriSchemaODDAssistantDigest *)self turnIds];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(ODDSiriSchemaODDAssistantDigest *)self turnIds];
    long long v20 = [v4 turnIds];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ODDSiriSchemaODDAssistantDigest *)self dimensions];

  if (v5)
  {
    v6 = [(ODDSiriSchemaODDAssistantDigest *)self dimensions];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantDigest *)self counts];

  if (v7)
  {
    int v8 = [(ODDSiriSchemaODDAssistantDigest *)self counts];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_turnIds;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantDigestReadFrom(self, (uint64_t)a3);
}

- (id)turnIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_turnIds objectAtIndexedSubscript:a3];
}

- (unint64_t)turnIdsCount
{
  return [(NSArray *)self->_turnIds count];
}

- (void)addTurnIds:(id)a3
{
  id v4 = a3;
  turnIds = self->_turnIds;
  id v8 = v4;
  if (!turnIds)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_turnIds;
    self->_turnIds = v6;

    id v4 = v8;
    turnIds = self->_turnIds;
  }
  [(NSArray *)turnIds addObject:v4];
}

- (void)clearTurnIds
{
}

- (void)deleteCounts
{
}

- (BOOL)hasCounts
{
  return self->_counts != 0;
}

- (void)deleteDimensions
{
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

@end