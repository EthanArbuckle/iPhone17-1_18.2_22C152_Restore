@interface PEGASUSSchemaPEGASUSKGQAClaimTier1
- (BOOL)hasEntityId;
- (BOOL)hasPropId;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)qualifiers;
- (NSArray)references;
- (NSData)jsonData;
- (NSString)entityId;
- (NSString)propId;
- (NSString)value;
- (PEGASUSSchemaPEGASUSKGQAClaimTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSKGQAClaimTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiersAtIndex:(unint64_t)a3;
- (id)referencesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)qualifiersCount;
- (unint64_t)referencesCount;
- (void)addQualifiers:(id)a3;
- (void)addReferences:(id)a3;
- (void)clearQualifiers;
- (void)clearReferences;
- (void)deleteEntityId;
- (void)deletePropId;
- (void)deleteValue;
- (void)setEntityId:(id)a3;
- (void)setHasEntityId:(BOOL)a3;
- (void)setHasPropId:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setPropId:(id)a3;
- (void)setQualifiers:(id)a3;
- (void)setReferences:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSKGQAClaimTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEGASUSSchemaPEGASUSKGQAClaimTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteEntityId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deletePropId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteValue];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteEntityId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deletePropId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteValue];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteEntityId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deletePropId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteValue];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteEntityId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deletePropId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteValue];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteEntityId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deletePropId];
    [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self deleteValue];
  }
  v6 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self qualifiers];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self setQualifiers:v7];

  v8 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self references];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self setReferences:v9];

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
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_qualifiers, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_propId, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (void)setHasPropId:(BOOL)a3
{
  self->_hasPropId = a3;
}

- (void)setHasEntityId:(BOOL)a3
{
  self->_hasEntityId = a3;
}

- (void)setReferences:(id)a3
{
}

- (NSArray)references
{
  return self->_references;
}

- (void)setQualifiers:(id)a3
{
}

- (NSArray)qualifiers
{
  return self->_qualifiers;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setPropId:(id)a3
{
}

- (NSString)propId
{
  return self->_propId;
}

- (void)setEntityId:(id)a3
{
}

- (NSString)entityId
{
  return self->_entityId;
}

- (PEGASUSSchemaPEGASUSKGQAClaimTier1)initWithDictionary:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PEGASUSSchemaPEGASUSKGQAClaimTier1;
  v5 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"entityId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)v5 setEntityId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"propId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)v5 setPropId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v11 = v6;
      v12 = (void *)[v10 copy];
      [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)v5 setValue:v12];

      v6 = v11;
    }
    v13 = [v4 objectForKeyedSubscript:@"qualifiers"];
    objc_opt_class();
    v33 = v10;
    v32 = v13;
    if (objc_opt_isKindOfClass())
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[PEGASUSSchemaPEGASUSKGQAQualifierTier1 alloc] initWithDictionary:v19];
              [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)v5 addQualifiers:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v16);
      }

      v10 = v33;
      v13 = v32;
    }
    v21 = [v4 objectForKeyedSubscript:@"references"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v6;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = [[PEGASUSSchemaPEGASUSKGQAReference alloc] initWithDictionary:v27];
              [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)v5 addReferences:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v24);
      }

      v6 = v31;
      v13 = v32;
      v10 = v33;
    }
    v29 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSKGQAClaimTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self dictionaryRepresentation];
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_entityId)
  {
    id v4 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self entityId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"entityId"];
  }
  if (self->_propId)
  {
    v6 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self propId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"propId"];
  }
  if ([(NSArray *)self->_qualifiers count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v9 = self->_qualifiers;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"qualifiers"];
  }
  if ([(NSArray *)self->_references count])
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = self->_references;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "dictionaryRepresentation", (void)v27);
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"references"];
  }
  if (self->_value)
  {
    uint64_t v24 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self value];
    uint64_t v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"value"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v27);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_entityId hash];
  NSUInteger v4 = [(NSString *)self->_propId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_value hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_qualifiers hash];
  return v6 ^ [(NSArray *)self->_references hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self entityId];
  uint64_t v6 = [v4 entityId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self entityId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self entityId];
    uint64_t v10 = [v4 entityId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self propId];
  uint64_t v6 = [v4 propId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self propId];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self propId];
    uint64_t v15 = [v4 propId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self value];
  uint64_t v6 = [v4 value];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self value];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self value];
    uint64_t v20 = [v4 value];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self qualifiers];
  uint64_t v6 = [v4 qualifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self qualifiers];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self qualifiers];
    uint64_t v25 = [v4 qualifiers];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self references];
  uint64_t v6 = [v4 references];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self references];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    long long v28 = (void *)v27;
    long long v29 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self references];
    long long v30 = [v4 references];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self entityId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self propId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSKGQAClaimTier1 *)self value];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = self->_qualifiers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v13 = self->_references;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSKGQAClaimTier1ReadFrom(self, (uint64_t)a3);
}

- (id)referencesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_references objectAtIndexedSubscript:a3];
}

- (unint64_t)referencesCount
{
  return [(NSArray *)self->_references count];
}

- (void)addReferences:(id)a3
{
  id v4 = a3;
  references = self->_references;
  id v8 = v4;
  if (!references)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_references;
    self->_references = v6;

    id v4 = v8;
    references = self->_references;
  }
  [(NSArray *)references addObject:v4];
}

- (void)clearReferences
{
}

- (id)qualifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_qualifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)qualifiersCount
{
  return [(NSArray *)self->_qualifiers count];
}

- (void)addQualifiers:(id)a3
{
  id v4 = a3;
  qualifiers = self->_qualifiers;
  id v8 = v4;
  if (!qualifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_qualifiers;
    self->_qualifiers = v6;

    id v4 = v8;
    qualifiers = self->_qualifiers;
  }
  [(NSArray *)qualifiers addObject:v4];
}

- (void)clearQualifiers
{
}

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deletePropId
{
}

- (BOOL)hasPropId
{
  return self->_propId != 0;
}

- (void)deleteEntityId
{
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

@end