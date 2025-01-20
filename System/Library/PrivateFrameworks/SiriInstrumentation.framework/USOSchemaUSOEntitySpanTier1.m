@interface USOSchemaUSOEntitySpanTier1
- (BOOL)hasIndex;
- (BOOL)hasOriginAppId;
- (BOOL)hasOriginEntityId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alternatives;
- (NSArray)properties;
- (NSData)jsonData;
- (NSString)originAppId;
- (NSString)originEntityId;
- (USOSchemaUSOEntitySpanTier1)initWithDictionary:(id)a3;
- (USOSchemaUSOEntitySpanTier1)initWithJSON:(id)a3;
- (id)alternativesAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)propertiesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)alternativesCount;
- (unint64_t)hash;
- (unint64_t)propertiesCount;
- (unsigned)index;
- (void)addAlternatives:(id)a3;
- (void)addProperties:(id)a3;
- (void)clearAlternatives;
- (void)clearProperties;
- (void)deleteIndex;
- (void)deleteOriginAppId;
- (void)deleteOriginEntityId;
- (void)setAlternatives:(id)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasOriginAppId:(BOOL)a3;
- (void)setHasOriginEntityId:(BOOL)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setOriginAppId:(id)a3;
- (void)setOriginEntityId:(id)a3;
- (void)setProperties:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOEntitySpanTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)USOSchemaUSOEntitySpanTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginAppId];
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginEntityId];
  }
  if ([v4 isConditionSet:4])
  {
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginAppId];
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginEntityId];
  }
  if ([v4 isConditionSet:5])
  {
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginAppId];
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginEntityId];
  }
  if ([v4 isConditionSet:6])
  {
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginAppId];
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginEntityId];
  }
  if ([v4 isConditionSet:7])
  {
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginAppId];
    [(USOSchemaUSOEntitySpanTier1 *)self deleteOriginEntityId];
  }
  v6 = [(USOSchemaUSOEntitySpanTier1 *)self properties];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(USOSchemaUSOEntitySpanTier1 *)self setProperties:v7];

  v8 = [(USOSchemaUSOEntitySpanTier1 *)self alternatives];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(USOSchemaUSOEntitySpanTier1 *)self setAlternatives:v9];

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
  objc_storeStrong((id *)&self->_originEntityId, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
}

- (void)setHasOriginEntityId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOriginAppId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setOriginEntityId:(id)a3
{
}

- (NSString)originEntityId
{
  return self->_originEntityId;
}

- (void)setAlternatives:(id)a3
{
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setProperties:(id)a3
{
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setOriginAppId:(id)a3
{
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (unsigned)index
{
  return self->_index;
}

- (USOSchemaUSOEntitySpanTier1)initWithDictionary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)USOSchemaUSOEntitySpanTier1;
  v5 = [(USOSchemaUSOEntitySpanTier1 *)&v39 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntitySpanTier1 setIndex:](v5, "setIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"originAppId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(USOSchemaUSOEntitySpanTier1 *)v5 setOriginAppId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"properties"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v10 = v9;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[USOSchemaUSOSpanPropertyTier1 alloc] initWithDictionary:v16];
              [(USOSchemaUSOEntitySpanTier1 *)v5 addProperties:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v13);
      }

      v9 = v10;
    }
    v18 = [v4 objectForKeyedSubscript:@"alternatives"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = v9;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = [[USOSchemaUSOAsrAlternativeTier1 alloc] initWithDictionary:v24];
              [(USOSchemaUSOEntitySpanTier1 *)v5 addAlternatives:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v21);
      }

      v9 = v30;
    }
    v26 = [v4 objectForKeyedSubscript:@"originEntityId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(USOSchemaUSOEntitySpanTier1 *)v5 setOriginEntityId:v27];
    }
    v28 = v5;
  }
  return v5;
}

- (USOSchemaUSOEntitySpanTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOEntitySpanTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOEntitySpanTier1 *)self dictionaryRepresentation];
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alternatives count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v5 = self->_alternatives;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"alternatives"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpanTier1 index](self, "index"));
    [v3 setObject:v12 forKeyedSubscript:@"index"];
  }
  if (self->_originAppId)
  {
    uint64_t v13 = [(USOSchemaUSOEntitySpanTier1 *)self originAppId];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"originAppId"];
  }
  if (self->_originEntityId)
  {
    v15 = [(USOSchemaUSOEntitySpanTier1 *)self originEntityId];
    uint64_t v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"originEntityId"];
  }
  if ([(NSArray *)self->_properties count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v18 = self->_properties;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (void)v26);
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"properties"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_index;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_originAppId hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_properties hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_alternatives hash];
  return v6 ^ [(NSString *)self->_originEntityId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int index = self->_index;
    if (index != [v4 index]) {
      goto LABEL_25;
    }
  }
  uint64_t v6 = [(USOSchemaUSOEntitySpanTier1 *)self originAppId];
  uint64_t v7 = [v4 originAppId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v8 = [(USOSchemaUSOEntitySpanTier1 *)self originAppId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(USOSchemaUSOEntitySpanTier1 *)self originAppId];
    id v11 = [v4 originAppId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v6 = [(USOSchemaUSOEntitySpanTier1 *)self properties];
  uint64_t v7 = [v4 properties];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v13 = [(USOSchemaUSOEntitySpanTier1 *)self properties];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(USOSchemaUSOEntitySpanTier1 *)self properties];
    uint64_t v16 = [v4 properties];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v6 = [(USOSchemaUSOEntitySpanTier1 *)self alternatives];
  uint64_t v7 = [v4 alternatives];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_24;
  }
  uint64_t v18 = [(USOSchemaUSOEntitySpanTier1 *)self alternatives];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(USOSchemaUSOEntitySpanTier1 *)self alternatives];
    uint64_t v21 = [v4 alternatives];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v6 = [(USOSchemaUSOEntitySpanTier1 *)self originEntityId];
  uint64_t v7 = [v4 originEntityId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(USOSchemaUSOEntitySpanTier1 *)self originEntityId];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    uint64_t v24 = (void *)v23;
    v25 = [(USOSchemaUSOEntitySpanTier1 *)self originEntityId];
    long long v26 = [v4 originEntityId];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v5 = [(USOSchemaUSOEntitySpanTier1 *)self originAppId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = self->_properties;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_alternatives;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  uint64_t v16 = [(USOSchemaUSOEntitySpanTier1 *)self originEntityId];

  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntitySpanTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteOriginEntityId
{
}

- (BOOL)hasOriginEntityId
{
  return self->_originEntityId != 0;
}

- (id)alternativesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alternatives objectAtIndexedSubscript:a3];
}

- (unint64_t)alternativesCount
{
  return [(NSArray *)self->_alternatives count];
}

- (void)addAlternatives:(id)a3
{
  id v4 = a3;
  alternatives = self->_alternatives;
  id v8 = v4;
  if (!alternatives)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alternatives;
    self->_alternatives = v6;

    id v4 = v8;
    alternatives = self->_alternatives;
  }
  [(NSArray *)alternatives addObject:v4];
}

- (void)clearAlternatives
{
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_properties objectAtIndexedSubscript:a3];
}

- (unint64_t)propertiesCount
{
  return [(NSArray *)self->_properties count];
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  id v8 = v4;
  if (!properties)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_properties;
    self->_properties = v6;

    id v4 = v8;
    properties = self->_properties;
  }
  [(NSArray *)properties addObject:v4];
}

- (void)clearProperties
{
}

- (void)deleteOriginAppId
{
}

- (BOOL)hasOriginAppId
{
  return self->_originAppId != 0;
}

- (void)deleteIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int index = a3;
}

@end