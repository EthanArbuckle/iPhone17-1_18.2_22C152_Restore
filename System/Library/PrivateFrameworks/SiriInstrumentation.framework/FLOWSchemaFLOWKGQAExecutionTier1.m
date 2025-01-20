@interface FLOWSchemaFLOWKGQAExecutionTier1
- (BOOL)hasAnswerId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWKGQAExecutionTier1)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWKGQAExecutionTier1)initWithJSON:(id)a3;
- (NSArray)primaryEntities;
- (NSArray)secondaryEntities;
- (NSData)jsonData;
- (NSString)answerId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)primaryEntitiesAtIndex:(unint64_t)a3;
- (id)secondaryEntitiesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)primaryEntitiesCount;
- (unint64_t)secondaryEntitiesCount;
- (void)addPrimaryEntities:(id)a3;
- (void)addSecondaryEntities:(id)a3;
- (void)clearPrimaryEntities;
- (void)clearSecondaryEntities;
- (void)deleteAnswerId;
- (void)setAnswerId:(id)a3;
- (void)setHasAnswerId:(BOOL)a3;
- (void)setPrimaryEntities:(id)a3;
- (void)setSecondaryEntities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWKGQAExecutionTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FLOWSchemaFLOWKGQAExecutionTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:4])
  {
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:5])
  {
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:6])
  {
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:7])
  {
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(FLOWSchemaFLOWKGQAExecutionTier1 *)self deleteAnswerId];
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
  objc_storeStrong((id *)&self->_answerId, 0);
  objc_storeStrong((id *)&self->_secondaryEntities, 0);
  objc_storeStrong((id *)&self->_primaryEntities, 0);
}

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void)setAnswerId:(id)a3
{
}

- (NSString)answerId
{
  return self->_answerId;
}

- (void)setSecondaryEntities:(id)a3
{
}

- (NSArray)secondaryEntities
{
  return self->_secondaryEntities;
}

- (void)setPrimaryEntities:(id)a3
{
}

- (NSArray)primaryEntities
{
  return self->_primaryEntities;
}

- (FLOWSchemaFLOWKGQAExecutionTier1)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FLOWSchemaFLOWKGQAExecutionTier1;
  v5 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"primaryEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v31;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = (void *)[v12 copy];
              [(FLOWSchemaFLOWKGQAExecutionTier1 *)v5 addPrimaryEntities:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"secondaryEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v26 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = objc_msgSend(v20, "copy", (void)v26);
              [(FLOWSchemaFLOWKGQAExecutionTier1 *)v5 addSecondaryEntities:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v17);
      }
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"answerId", (void)v26);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(FLOWSchemaFLOWKGQAExecutionTier1 *)v5 setAnswerId:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWKGQAExecutionTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self dictionaryRepresentation];
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
  if (self->_answerId)
  {
    id v4 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self answerId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"answerId"];
  }
  if (self->_primaryEntities)
  {
    v6 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self primaryEntities];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"primaryEntities"];
  }
  if (self->_secondaryEntities)
  {
    uint64_t v8 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self secondaryEntities];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"secondaryEntities"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_primaryEntities hash];
  uint64_t v4 = [(NSArray *)self->_secondaryEntities hash] ^ v3;
  return v4 ^ [(NSString *)self->_answerId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self primaryEntities];
  v6 = [v4 primaryEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self primaryEntities];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self primaryEntities];
    uint64_t v10 = [v4 primaryEntities];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self secondaryEntities];
  v6 = [v4 secondaryEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self secondaryEntities];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self secondaryEntities];
    id v15 = [v4 secondaryEntities];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self answerId];
  v6 = [v4 answerId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self answerId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self answerId];
    v20 = [v4 answerId];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = self->_primaryEntities;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_secondaryEntities;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  id v15 = [(FLOWSchemaFLOWKGQAExecutionTier1 *)self answerId];

  if (v15) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWKGQAExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnswerId
{
}

- (BOOL)hasAnswerId
{
  return self->_answerId != 0;
}

- (id)secondaryEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_secondaryEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)secondaryEntitiesCount
{
  return [(NSArray *)self->_secondaryEntities count];
}

- (void)addSecondaryEntities:(id)a3
{
  id v4 = a3;
  secondaryEntities = self->_secondaryEntities;
  id v8 = v4;
  if (!secondaryEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_secondaryEntities;
    self->_secondaryEntities = v6;

    id v4 = v8;
    secondaryEntities = self->_secondaryEntities;
  }
  [(NSArray *)secondaryEntities addObject:v4];
}

- (void)clearSecondaryEntities
{
}

- (id)primaryEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_primaryEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)primaryEntitiesCount
{
  return [(NSArray *)self->_primaryEntities count];
}

- (void)addPrimaryEntities:(id)a3
{
  id v4 = a3;
  primaryEntities = self->_primaryEntities;
  id v8 = v4;
  if (!primaryEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_primaryEntities;
    self->_primaryEntities = v6;

    id v4 = v8;
    primaryEntities = self->_primaryEntities;
  }
  [(NSArray *)primaryEntities addObject:v4];
}

- (void)clearPrimaryEntities
{
}

@end