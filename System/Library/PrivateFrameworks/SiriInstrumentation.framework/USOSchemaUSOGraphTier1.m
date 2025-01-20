@interface USOSchemaUSOGraphTier1
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)linkedUsoEntityIdentifiers;
- (NSArray)linkedUsoGraphNodeDatas;
- (NSArray)linkedUsoNodeDatas;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (USOSchemaUSOGraphTier1)initWithDictionary:(id)a3;
- (USOSchemaUSOGraphTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)linkedUsoEntityIdentifiersAtIndex:(unint64_t)a3;
- (id)linkedUsoGraphNodeDataAtIndex:(unint64_t)a3;
- (id)linkedUsoNodeDataAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)linkedUsoEntityIdentifiersCount;
- (unint64_t)linkedUsoGraphNodeDataCount;
- (unint64_t)linkedUsoNodeDataCount;
- (void)addLinkedUsoEntityIdentifiers:(id)a3;
- (void)addLinkedUsoGraphNodeData:(id)a3;
- (void)addLinkedUsoNodeData:(id)a3;
- (void)clearLinkedUsoEntityIdentifiers;
- (void)clearLinkedUsoGraphNodeData;
- (void)clearLinkedUsoNodeData;
- (void)deleteLinkId;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setLinkedUsoEntityIdentifiers:(id)a3;
- (void)setLinkedUsoGraphNodeDatas:(id)a3;
- (void)setLinkedUsoNodeDatas:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOGraphTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)USOSchemaUSOGraphTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(USOSchemaUSOGraphTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(USOSchemaUSOGraphTier1 *)self deleteLinkId];
  }
  v9 = [(USOSchemaUSOGraphTier1 *)self linkedUsoNodeDatas];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(USOSchemaUSOGraphTier1 *)self setLinkedUsoNodeDatas:v10];

  v11 = [(USOSchemaUSOGraphTier1 *)self linkedUsoEntityIdentifiers];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(USOSchemaUSOGraphTier1 *)self setLinkedUsoEntityIdentifiers:v12];

  v13 = [(USOSchemaUSOGraphTier1 *)self linkedUsoGraphNodeDatas];
  v14 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v13 underConditions:v4];
  [(USOSchemaUSOGraphTier1 *)self setLinkedUsoGraphNodeDatas:v14];

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
  objc_storeStrong((id *)&self->_linkedUsoGraphNodeDatas, 0);
  objc_storeStrong((id *)&self->_linkedUsoEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_linkedUsoNodeDatas, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setLinkedUsoGraphNodeDatas:(id)a3
{
}

- (NSArray)linkedUsoGraphNodeDatas
{
  return self->_linkedUsoGraphNodeDatas;
}

- (void)setLinkedUsoEntityIdentifiers:(id)a3
{
}

- (NSArray)linkedUsoEntityIdentifiers
{
  return self->_linkedUsoEntityIdentifiers;
}

- (void)setLinkedUsoNodeDatas:(id)a3
{
}

- (NSArray)linkedUsoNodeDatas
{
  return self->_linkedUsoNodeDatas;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (USOSchemaUSOGraphTier1)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)USOSchemaUSOGraphTier1;
  v5 = [(USOSchemaUSOGraphTier1 *)&v50 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(USOSchemaUSOGraphTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"linkedUsoNodeData"];
    objc_opt_class();
    v37 = v8;
    if (objc_opt_isKindOfClass())
    {
      v9 = v6;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v47 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_super v16 = [[USOSchemaUSONodeDataTier1 alloc] initWithDictionary:v15];
              [(USOSchemaUSOGraphTier1 *)v5 addLinkedUsoNodeData:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v53 count:16];
        }
        while (v12);
      }

      v6 = v9;
    }
    v17 = [v4 objectForKeyedSubscript:@"linkedUsoEntityIdentifiers"];
    objc_opt_class();
    v36 = v17;
    if (objc_opt_isKindOfClass())
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[USOSchemaUSOEntityIdentifierTier1 alloc] initWithDictionary:v23];
              [(USOSchemaUSOGraphTier1 *)v5 addLinkedUsoEntityIdentifiers:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v52 count:16];
        }
        while (v20);
      }
    }
    v25 = [v4 objectForKeyedSubscript:@"linkedUsoGraphNodeData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = v6;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v39 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v32 = [[USOSchemaUSOGraphNodeDataTier1 alloc] initWithDictionary:v31];
              [(USOSchemaUSOGraphTier1 *)v5 addLinkedUsoGraphNodeData:v32];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v51 count:16];
        }
        while (v28);
      }

      v6 = v35;
      v17 = v36;
    }
    v33 = v5;
  }
  return v5;
}

- (USOSchemaUSOGraphTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOGraphTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOGraphTier1 *)self dictionaryRepresentation];
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_linkId)
  {
    id v4 = [(USOSchemaUSOGraphTier1 *)self linkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_linkedUsoEntityIdentifiers count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    int v8 = self->_linkedUsoEntityIdentifiers;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"linkedUsoEntityIdentifiers"];
  }
  if ([(NSArray *)self->_linkedUsoGraphNodeDatas count])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v16 = self->_linkedUsoGraphNodeDatas;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v36 + 1) + 8 * j) dictionaryRepresentation];
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            v22 = [MEMORY[0x1E4F1CA98] null];
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"linkedUsoGraphNodeData"];
  }
  if ([(NSArray *)self->_linkedUsoNodeDatas count])
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v24 = self->_linkedUsoNodeDatas;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "dictionaryRepresentation", (void)v32);
          if (v29)
          {
            [v23 addObject:v29];
          }
          else
          {
            v30 = [MEMORY[0x1E4F1CA98] null];
            [v23 addObject:v30];
          }
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKeyedSubscript:@"linkedUsoNodeData"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v32);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  uint64_t v4 = [(NSArray *)self->_linkedUsoNodeDatas hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_linkedUsoEntityIdentifiers hash];
  return v4 ^ v5 ^ [(NSArray *)self->_linkedUsoGraphNodeDatas hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  uint64_t v5 = [(USOSchemaUSOGraphTier1 *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(USOSchemaUSOGraphTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(USOSchemaUSOGraphTier1 *)self linkId];
    uint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraphTier1 *)self linkedUsoNodeDatas];
  v6 = [v4 linkedUsoNodeDatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(USOSchemaUSOGraphTier1 *)self linkedUsoNodeDatas];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(USOSchemaUSOGraphTier1 *)self linkedUsoNodeDatas];
    uint64_t v15 = [v4 linkedUsoNodeDatas];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraphTier1 *)self linkedUsoEntityIdentifiers];
  v6 = [v4 linkedUsoEntityIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(USOSchemaUSOGraphTier1 *)self linkedUsoEntityIdentifiers];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(USOSchemaUSOGraphTier1 *)self linkedUsoEntityIdentifiers];
    uint64_t v20 = [v4 linkedUsoEntityIdentifiers];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraphTier1 *)self linkedUsoGraphNodeDatas];
  v6 = [v4 linkedUsoGraphNodeDatas];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(USOSchemaUSOGraphTier1 *)self linkedUsoGraphNodeDatas];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(USOSchemaUSOGraphTier1 *)self linkedUsoGraphNodeDatas];
    uint64_t v25 = [v4 linkedUsoGraphNodeDatas];
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(USOSchemaUSOGraphTier1 *)self linkId];

  if (v5)
  {
    v6 = [(USOSchemaUSOGraphTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = self->_linkedUsoNodeDatas;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = self->_linkedUsoEntityIdentifiers;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = self->_linkedUsoGraphNodeDatas;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOGraphTier1ReadFrom(self, (uint64_t)a3);
}

- (id)linkedUsoGraphNodeDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_linkedUsoGraphNodeDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)linkedUsoGraphNodeDataCount
{
  return [(NSArray *)self->_linkedUsoGraphNodeDatas count];
}

- (void)addLinkedUsoGraphNodeData:(id)a3
{
  id v4 = a3;
  linkedUsoGraphNodeDatas = self->_linkedUsoGraphNodeDatas;
  id v8 = v4;
  if (!linkedUsoGraphNodeDatas)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_linkedUsoGraphNodeDatas;
    self->_linkedUsoGraphNodeDatas = v6;

    id v4 = v8;
    linkedUsoGraphNodeDatas = self->_linkedUsoGraphNodeDatas;
  }
  [(NSArray *)linkedUsoGraphNodeDatas addObject:v4];
}

- (void)clearLinkedUsoGraphNodeData
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
    v6 = [MEMORY[0x1E4F1CA48] array];
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

- (id)linkedUsoNodeDataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_linkedUsoNodeDatas objectAtIndexedSubscript:a3];
}

- (unint64_t)linkedUsoNodeDataCount
{
  return [(NSArray *)self->_linkedUsoNodeDatas count];
}

- (void)addLinkedUsoNodeData:(id)a3
{
  id v4 = a3;
  linkedUsoNodeDatas = self->_linkedUsoNodeDatas;
  id v8 = v4;
  if (!linkedUsoNodeDatas)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_linkedUsoNodeDatas;
    self->_linkedUsoNodeDatas = v6;

    id v4 = v8;
    linkedUsoNodeDatas = self->_linkedUsoNodeDatas;
  }
  [(NSArray *)linkedUsoNodeDatas addObject:v4];
}

- (void)clearLinkedUsoNodeData
{
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end