@interface USOSchemaUSOGraphNodeDataTier1
- (BOOL)hasLinkedUsoNodeData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)linkedUsoEntityIdentifiers;
- (NSArray)linkedUsoEntitySpans;
- (NSData)jsonData;
- (USOSchemaUSOGraphNodeDataTier1)initWithDictionary:(id)a3;
- (USOSchemaUSOGraphNodeDataTier1)initWithJSON:(id)a3;
- (USOSchemaUSONodeDataTier1)linkedUsoNodeData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)linkedUsoEntityIdentifiersAtIndex:(unint64_t)a3;
- (id)linkedUsoEntitySpansAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)linkedUsoEntityIdentifiersCount;
- (unint64_t)linkedUsoEntitySpansCount;
- (void)addLinkedUsoEntityIdentifiers:(id)a3;
- (void)addLinkedUsoEntitySpans:(id)a3;
- (void)clearLinkedUsoEntityIdentifiers;
- (void)clearLinkedUsoEntitySpans;
- (void)deleteLinkedUsoNodeData;
- (void)setHasLinkedUsoNodeData:(BOOL)a3;
- (void)setLinkedUsoEntityIdentifiers:(id)a3;
- (void)setLinkedUsoEntitySpans:(id)a3;
- (void)setLinkedUsoNodeData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOGraphNodeDataTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSchemaUSOGraphNodeDataTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v14 applySensitiveConditionsPolicy:v4];
  v6 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoNodeData];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(USOSchemaUSOGraphNodeDataTier1 *)self deleteLinkedUsoNodeData];
  }
  v9 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntityIdentifiers];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(USOSchemaUSOGraphNodeDataTier1 *)self setLinkedUsoEntityIdentifiers:v10];

  v11 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntitySpans];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(USOSchemaUSOGraphNodeDataTier1 *)self setLinkedUsoEntitySpans:v12];

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
  objc_storeStrong((id *)&self->_linkedUsoEntitySpans, 0);
  objc_storeStrong((id *)&self->_linkedUsoEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_linkedUsoNodeData, 0);
}

- (void)setHasLinkedUsoNodeData:(BOOL)a3
{
  self->_hasLinkedUsoNodeData = a3;
}

- (void)setLinkedUsoEntitySpans:(id)a3
{
}

- (NSArray)linkedUsoEntitySpans
{
  return self->_linkedUsoEntitySpans;
}

- (void)setLinkedUsoEntityIdentifiers:(id)a3
{
}

- (NSArray)linkedUsoEntityIdentifiers
{
  return self->_linkedUsoEntityIdentifiers;
}

- (void)setLinkedUsoNodeData:(id)a3
{
}

- (USOSchemaUSONodeDataTier1)linkedUsoNodeData
{
  return self->_linkedUsoNodeData;
}

- (USOSchemaUSOGraphNodeDataTier1)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)USOSchemaUSOGraphNodeDataTier1;
  v5 = [(USOSchemaUSOGraphNodeDataTier1 *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkedUsoNodeData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[USOSchemaUSONodeDataTier1 alloc] initWithDictionary:v6];
      [(USOSchemaUSOGraphNodeDataTier1 *)v5 setLinkedUsoNodeData:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"linkedUsoEntityIdentifiers"];
    objc_opt_class();
    v28 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v9 = v8;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v34;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[USOSchemaUSOEntityIdentifierTier1 alloc] initWithDictionary:v15];
              [(USOSchemaUSOGraphNodeDataTier1 *)v5 addLinkedUsoEntityIdentifiers:v16];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v12);
      }

      v6 = v28;
      int v8 = v9;
    }
    v17 = [v4 objectForKeyedSubscript:@"linkedUsoEntitySpans"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = v8;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * v22);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[USOSchemaUSOEntitySpanTier1 alloc] initWithDictionary:v23];
              [(USOSchemaUSOGraphNodeDataTier1 *)v5 addLinkedUsoEntitySpans:v24];
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v20);
      }

      int v8 = v27;
      v6 = v28;
    }
    v25 = v5;
  }
  return v5;
}

- (USOSchemaUSOGraphNodeDataTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOGraphNodeDataTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOGraphNodeDataTier1 *)self dictionaryRepresentation];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_linkedUsoEntityIdentifiers count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v5 = self->_linkedUsoEntityIdentifiers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"linkedUsoEntityIdentifiers"];
  }
  if ([(NSArray *)self->_linkedUsoEntitySpans count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = self->_linkedUsoEntitySpans;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"linkedUsoEntitySpans"];
  }
  if (self->_linkedUsoNodeData)
  {
    uint64_t v20 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoNodeData];
    uint64_t v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"linkedUsoNodeData"];
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"linkedUsoNodeData"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v24);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(USOSchemaUSONodeDataTier1 *)self->_linkedUsoNodeData hash];
  uint64_t v4 = [(NSArray *)self->_linkedUsoEntityIdentifiers hash] ^ v3;
  return v4 ^ [(NSArray *)self->_linkedUsoEntitySpans hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoNodeData];
  uint64_t v6 = [v4 linkedUsoNodeData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoNodeData];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoNodeData];
    id v10 = [v4 linkedUsoNodeData];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntityIdentifiers];
  uint64_t v6 = [v4 linkedUsoEntityIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntityIdentifiers];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntityIdentifiers];
    uint64_t v15 = [v4 linkedUsoEntityIdentifiers];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntitySpans];
  uint64_t v6 = [v4 linkedUsoEntitySpans];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntitySpans];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    id v18 = (void *)v17;
    uint64_t v19 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoEntitySpans];
    uint64_t v20 = [v4 linkedUsoEntitySpans];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoNodeData];

  if (v5)
  {
    uint64_t v6 = [(USOSchemaUSOGraphNodeDataTier1 *)self linkedUsoNodeData];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_linkedUsoEntityIdentifiers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_linkedUsoEntitySpans;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOGraphNodeDataTier1ReadFrom(self, (uint64_t)a3);
}

- (id)linkedUsoEntitySpansAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_linkedUsoEntitySpans objectAtIndexedSubscript:a3];
}

- (unint64_t)linkedUsoEntitySpansCount
{
  return [(NSArray *)self->_linkedUsoEntitySpans count];
}

- (void)addLinkedUsoEntitySpans:(id)a3
{
  id v4 = a3;
  linkedUsoEntitySpans = self->_linkedUsoEntitySpans;
  id v8 = v4;
  if (!linkedUsoEntitySpans)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_linkedUsoEntitySpans;
    self->_linkedUsoEntitySpans = v6;

    id v4 = v8;
    linkedUsoEntitySpans = self->_linkedUsoEntitySpans;
  }
  [(NSArray *)linkedUsoEntitySpans addObject:v4];
}

- (void)clearLinkedUsoEntitySpans
{
}

- (id)linkedUsoEntityIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_linkedUsoEntityIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)linkedUsoEntityIdentifiersCount
{
  return [(NSArray *)self->_linkedUsoEntityIdentifiers count];
}

- (void)addLinkedUsoEntityIdentifiers:(id)a3
{
  id v4 = a3;
  linkedUsoEntityIdentifiers = self->_linkedUsoEntityIdentifiers;
  id v8 = v4;
  if (!linkedUsoEntityIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_linkedUsoEntityIdentifiers;
    self->_linkedUsoEntityIdentifiers = v6;

    id v4 = v8;
    linkedUsoEntityIdentifiers = self->_linkedUsoEntityIdentifiers;
  }
  [(NSArray *)linkedUsoEntityIdentifiers addObject:v4];
}

- (void)clearLinkedUsoEntityIdentifiers
{
}

- (void)deleteLinkedUsoNodeData
{
}

- (BOOL)hasLinkedUsoNodeData
{
  return self->_linkedUsoNodeData != 0;
}

@end