@interface PEGASUSSchemaPEGASUSKGQAExecutionTier1
- (BOOL)hasAnswerId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)claims;
- (NSArray)primaryEntities;
- (NSArray)secondaryEntities;
- (NSData)jsonData;
- (NSString)answerId;
- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)claimsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)primaryEntitiesAtIndex:(unint64_t)a3;
- (id)secondaryEntitiesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)claimsCount;
- (unint64_t)hash;
- (unint64_t)primaryEntitiesCount;
- (unint64_t)secondaryEntitiesCount;
- (void)addClaims:(id)a3;
- (void)addPrimaryEntities:(id)a3;
- (void)addSecondaryEntities:(id)a3;
- (void)clearClaims;
- (void)clearPrimaryEntities;
- (void)clearSecondaryEntities;
- (void)deleteAnswerId;
- (void)setAnswerId:(id)a3;
- (void)setClaims:(id)a3;
- (void)setHasAnswerId:(BOOL)a3;
- (void)setPrimaryEntities:(id)a3;
- (void)setSecondaryEntities:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSKGQAExecutionTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEGASUSSchemaPEGASUSKGQAExecutionTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteAnswerId];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deletePrimaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteSecondaryEntities];
    [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self deleteAnswerId];
  }
  v6 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self claims];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self setClaims:v7];

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
  objc_storeStrong((id *)&self->_claims, 0);
  objc_storeStrong((id *)&self->_answerId, 0);
  objc_storeStrong((id *)&self->_secondaryEntities, 0);
  objc_storeStrong((id *)&self->_primaryEntities, 0);
}

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void)setClaims:(id)a3
{
}

- (NSArray)claims
{
  return self->_claims;
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

- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PEGASUSSchemaPEGASUSKGQAExecutionTier1;
  v5 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)&v50 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"primaryEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v47 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = (void *)[v13 copy];
              [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)v5 addPrimaryEntities:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v53 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v15 = [v4 objectForKeyedSubscript:@"secondaryEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v16 = v15;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = (void *)[v22 copy];
              [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)v5 addSecondaryEntities:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v52 count:16];
        }
        while (v19);
      }

      v15 = v16;
    }
    v24 = [v4 objectForKeyedSubscript:@"answerId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)v5 setAnswerId:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"claims"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = v15;
      id v37 = v4;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v27 = v26;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v33 = [[PEGASUSSchemaPEGASUSKGQAClaimTier1 alloc] initWithDictionary:v32];
              [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)v5 addClaims:v33];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v51 count:16];
        }
        while (v29);
      }

      id v4 = v37;
      v15 = v36;
    }
    v34 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self dictionaryRepresentation];
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
  if (self->_answerId)
  {
    id v4 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self answerId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"answerId"];
  }
  if ([(NSArray *)self->_claims count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_claims;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
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
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"claims"];
  }
  if (self->_primaryEntities)
  {
    v14 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self primaryEntities];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"primaryEntities"];
  }
  if (self->_secondaryEntities)
  {
    v16 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self secondaryEntities];
    id v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"secondaryEntities"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_primaryEntities hash];
  uint64_t v4 = [(NSArray *)self->_secondaryEntities hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_answerId hash];
  return v4 ^ v5 ^ [(NSArray *)self->_claims hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self primaryEntities];
  v6 = [v4 primaryEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self primaryEntities];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self primaryEntities];
    uint64_t v10 = [v4 primaryEntities];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self secondaryEntities];
  v6 = [v4 secondaryEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self secondaryEntities];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self secondaryEntities];
    v15 = [v4 secondaryEntities];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self answerId];
  v6 = [v4 answerId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self answerId];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    long long v19 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self answerId];
    long long v20 = [v4 answerId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self claims];
  v6 = [v4 claims];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self claims];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    uint64_t v24 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self claims];
    v25 = [v4 claims];
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  NSUInteger v5 = self->_primaryEntities;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = self->_secondaryEntities;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  v15 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self answerId];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v16 = self->_claims;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSKGQAExecutionTier1ReadFrom(self, (uint64_t)a3);
}

- (id)claimsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_claims objectAtIndexedSubscript:a3];
}

- (unint64_t)claimsCount
{
  return [(NSArray *)self->_claims count];
}

- (void)addClaims:(id)a3
{
  id v4 = a3;
  claims = self->_claims;
  id v8 = v4;
  if (!claims)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_claims;
    self->_claims = v6;

    id v4 = v8;
    claims = self->_claims;
  }
  [(NSArray *)claims addObject:v4];
}

- (void)clearClaims
{
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