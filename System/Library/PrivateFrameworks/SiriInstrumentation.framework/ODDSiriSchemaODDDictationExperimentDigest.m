@interface ODDSiriSchemaODDDictationExperimentDigest
- (BOOL)hasCounts;
- (BOOL)hasDimensions;
- (BOOL)hasTuples;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)turnIds;
- (NSData)jsonData;
- (ODDSiriSchemaODDDictationExperimentCounts)counts;
- (ODDSiriSchemaODDDictationExperimentDigest)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDDictationExperimentDigest)initWithJSON:(id)a3;
- (ODDSiriSchemaODDDictationExperimentDimensions)dimensions;
- (ODDSiriSchemaODDDictationExperimentTuples)tuples;
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
- (void)deleteTuples;
- (void)setCounts:(id)a3;
- (void)setDimensions:(id)a3;
- (void)setHasCounts:(BOOL)a3;
- (void)setHasDimensions:(BOOL)a3;
- (void)setHasTuples:(BOOL)a3;
- (void)setTuples:(id)a3;
- (void)setTurnIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDDictationExperimentDigest

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ODDSiriSchemaODDDictationExperimentDigest;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:8]) {
    [(ODDSiriSchemaODDDictationExperimentDigest *)self deleteTurnIds];
  }
  v6 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDDictationExperimentDigest *)self deleteDimensions];
  }
  v9 = [(ODDSiriSchemaODDDictationExperimentDigest *)self counts];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDDictationExperimentDigest *)self deleteCounts];
  }
  v12 = [(ODDSiriSchemaODDDictationExperimentDigest *)self tuples];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODDSiriSchemaODDDictationExperimentDigest *)self deleteTuples];
  }
  v15 = [(ODDSiriSchemaODDDictationExperimentDigest *)self turnIds];
  v16 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v15 underConditions:v4];
  [(ODDSiriSchemaODDDictationExperimentDigest *)self setTurnIds:v16];

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
  objc_storeStrong((id *)&self->_tuples, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

- (void)setHasTuples:(BOOL)a3
{
  self->_hasTuples = a3;
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

- (void)setTuples:(id)a3
{
}

- (ODDSiriSchemaODDDictationExperimentTuples)tuples
{
  return self->_tuples;
}

- (void)setCounts:(id)a3
{
}

- (ODDSiriSchemaODDDictationExperimentCounts)counts
{
  return self->_counts;
}

- (void)setDimensions:(id)a3
{
}

- (ODDSiriSchemaODDDictationExperimentDimensions)dimensions
{
  return self->_dimensions;
}

- (ODDSiriSchemaODDDictationExperimentDigest)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ODDSiriSchemaODDDictationExperimentDigest;
  v5 = [(ODDSiriSchemaODDDictationExperimentDigest *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDDictationExperimentDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDDictationExperimentDigest *)v5 setDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"counts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDDictationExperimentCounts alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDDictationExperimentDigest *)v5 setCounts:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"tuples"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODDSiriSchemaODDDictationExperimentTuples alloc] initWithDictionary:v10];
      [(ODDSiriSchemaODDDictationExperimentDigest *)v5 setTuples:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"turnIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v10;
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[SISchemaUUID alloc] initWithDictionary:v18];
              [(ODDSiriSchemaODDDictationExperimentDigest *)v5 addTurnIds:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v15);
      }

      v6 = v23;
      v10 = v22;
    }
    v20 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDDictationExperimentDigest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDDictationExperimentDigest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dictionaryRepresentation];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_counts)
  {
    id v4 = [(ODDSiriSchemaODDDictationExperimentDigest *)self counts];
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
    uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dimensions];
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
  if (self->_tuples)
  {
    v10 = [(ODDSiriSchemaODDDictationExperimentDigest *)self tuples];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"tuples"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"tuples"];
    }
  }
  if ([(NSArray *)self->_turnIds count])
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v14 = self->_turnIds;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [MEMORY[0x1E4F1CA98] null];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"turnIds"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v22);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDDictationExperimentDimensions *)self->_dimensions hash];
  unint64_t v4 = [(ODDSiriSchemaODDDictationExperimentCounts *)self->_counts hash] ^ v3;
  unint64_t v5 = [(ODDSiriSchemaODDDictationExperimentTuples *)self->_tuples hash];
  return v4 ^ v5 ^ [(NSArray *)self->_turnIds hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dimensions];
  v6 = [v4 dimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dimensions];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dimensions];
    v10 = [v4 dimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDigest *)self counts];
  v6 = [v4 counts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(ODDSiriSchemaODDDictationExperimentDigest *)self counts];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(ODDSiriSchemaODDDictationExperimentDigest *)self counts];
    uint64_t v15 = [v4 counts];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDigest *)self tuples];
  v6 = [v4 tuples];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(ODDSiriSchemaODDDictationExperimentDigest *)self tuples];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(ODDSiriSchemaODDDictationExperimentDigest *)self tuples];
    v20 = [v4 tuples];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDigest *)self turnIds];
  v6 = [v4 turnIds];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(ODDSiriSchemaODDDictationExperimentDigest *)self turnIds];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    long long v23 = (void *)v22;
    long long v24 = [(ODDSiriSchemaODDDictationExperimentDigest *)self turnIds];
    long long v25 = [v4 turnIds];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dimensions];

  if (v5)
  {
    v6 = [(ODDSiriSchemaODDDictationExperimentDigest *)self dimensions];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(ODDSiriSchemaODDDictationExperimentDigest *)self counts];

  if (v7)
  {
    int v8 = [(ODDSiriSchemaODDDictationExperimentDigest *)self counts];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(ODDSiriSchemaODDDictationExperimentDigest *)self tuples];

  if (v9)
  {
    v10 = [(ODDSiriSchemaODDDictationExperimentDigest *)self tuples];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v11 = self->_turnIds;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDDictationExperimentDigestReadFrom(self, (uint64_t)a3);
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

- (void)deleteTuples
{
}

- (BOOL)hasTuples
{
  return self->_tuples != 0;
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