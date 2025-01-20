@interface QDSchemaQDEntitiesRanked
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)retrievedTools;
- (NSArray)spanMatchedEntities;
- (NSArray)utteranceContexts;
- (NSData)jsonData;
- (QDSchemaQDEntitiesRanked)initWithDictionary:(id)a3;
- (QDSchemaQDEntitiesRanked)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)retrievedToolsAtIndex:(unint64_t)a3;
- (id)spanMatchedEntitiesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (id)utteranceContextAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)retrievedToolsCount;
- (unint64_t)spanMatchedEntitiesCount;
- (unint64_t)utteranceContextCount;
- (void)addRetrievedTools:(id)a3;
- (void)addSpanMatchedEntities:(id)a3;
- (void)addUtteranceContext:(id)a3;
- (void)clearRetrievedTools;
- (void)clearSpanMatchedEntities;
- (void)clearUtteranceContext;
- (void)setRetrievedTools:(id)a3;
- (void)setSpanMatchedEntities:(id)a3;
- (void)setUtteranceContexts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDEntitiesRanked

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)QDSchemaQDEntitiesRanked;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(QDSchemaQDEntitiesRanked *)self retrievedTools];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(QDSchemaQDEntitiesRanked *)self setRetrievedTools:v7];

  v8 = [(QDSchemaQDEntitiesRanked *)self spanMatchedEntities];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];
  [(QDSchemaQDEntitiesRanked *)self setSpanMatchedEntities:v9];

  v10 = [(QDSchemaQDEntitiesRanked *)self utteranceContexts];
  v11 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v10 underConditions:v4];

  [(QDSchemaQDEntitiesRanked *)self setUtteranceContexts:v11];
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
  objc_storeStrong((id *)&self->_utteranceContexts, 0);
  objc_storeStrong((id *)&self->_spanMatchedEntities, 0);
  objc_storeStrong((id *)&self->_retrievedTools, 0);
}

- (void)setUtteranceContexts:(id)a3
{
}

- (NSArray)utteranceContexts
{
  return self->_utteranceContexts;
}

- (void)setSpanMatchedEntities:(id)a3
{
}

- (NSArray)spanMatchedEntities
{
  return self->_spanMatchedEntities;
}

- (void)setRetrievedTools:(id)a3
{
}

- (NSArray)retrievedTools
{
  return self->_retrievedTools;
}

- (QDSchemaQDEntitiesRanked)initWithDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)QDSchemaQDEntitiesRanked;
  v5 = [(QDSchemaQDEntitiesRanked *)&v47 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"retrievedTools"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v44;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v44 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[QDSchemaQDRetrievedTool alloc] initWithDictionary:v13];
              [(QDSchemaQDEntitiesRanked *)v5 addRetrievedTools:v14];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v50 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v15 = [v4 objectForKeyedSubscript:@"spanMatchedEntities"];
    objc_opt_class();
    v34 = v15;
    if (objc_opt_isKindOfClass())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v40;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * v20);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [[QDSchemaQDSpanMatchedEntity alloc] initWithDictionary:v21];
              [(QDSchemaQDEntitiesRanked *)v5 addSpanMatchedEntities:v22];
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
        }
        while (v18);
      }

      v15 = v34;
    }
    v23 = [v4 objectForKeyedSubscript:@"utteranceContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = v6;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v36;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8 * v28);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [[QDSchemaQDRetrievedContextStatement alloc] initWithDictionary:v29];
              [(QDSchemaQDEntitiesRanked *)v5 addUtteranceContext:v30];
            }
            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v48 count:16];
        }
        while (v26);
      }

      v6 = v33;
      v15 = v34;
    }
    v31 = v5;
  }
  return v5;
}

- (QDSchemaQDEntitiesRanked)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDEntitiesRanked *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDEntitiesRanked *)self dictionaryRepresentation];
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
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_retrievedTools count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v5 = self->_retrievedTools;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"retrievedTools"];
  }
  if ([(NSArray *)self->_spanMatchedEntities count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v13 = self->_spanMatchedEntities;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v33 + 1) + 8 * j) dictionaryRepresentation];
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
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"spanMatchedEntities"];
  }
  if ([(NSArray *)self->_utteranceContexts count])
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v21 = self->_utteranceContexts;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * k), "dictionaryRepresentation", (void)v29);
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"utteranceContext"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v29);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_retrievedTools hash];
  uint64_t v4 = [(NSArray *)self->_spanMatchedEntities hash] ^ v3;
  return v4 ^ [(NSArray *)self->_utteranceContexts hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(QDSchemaQDEntitiesRanked *)self retrievedTools];
  uint64_t v6 = [v4 retrievedTools];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(QDSchemaQDEntitiesRanked *)self retrievedTools];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(QDSchemaQDEntitiesRanked *)self retrievedTools];
    uint64_t v10 = [v4 retrievedTools];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDEntitiesRanked *)self spanMatchedEntities];
  uint64_t v6 = [v4 spanMatchedEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(QDSchemaQDEntitiesRanked *)self spanMatchedEntities];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(QDSchemaQDEntitiesRanked *)self spanMatchedEntities];
    uint64_t v15 = [v4 spanMatchedEntities];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDEntitiesRanked *)self utteranceContexts];
  uint64_t v6 = [v4 utteranceContexts];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(QDSchemaQDEntitiesRanked *)self utteranceContexts];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(QDSchemaQDEntitiesRanked *)self utteranceContexts];
    uint64_t v20 = [v4 utteranceContexts];
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
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_retrievedTools;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_spanMatchedEntities;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_utteranceContexts;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDEntitiesRankedReadFrom(self, (uint64_t)a3);
}

- (id)utteranceContextAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_utteranceContexts objectAtIndexedSubscript:a3];
}

- (unint64_t)utteranceContextCount
{
  return [(NSArray *)self->_utteranceContexts count];
}

- (void)addUtteranceContext:(id)a3
{
  id v4 = a3;
  utteranceContexts = self->_utteranceContexts;
  id v8 = v4;
  if (!utteranceContexts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_utteranceContexts;
    self->_utteranceContexts = v6;

    id v4 = v8;
    utteranceContexts = self->_utteranceContexts;
  }
  [(NSArray *)utteranceContexts addObject:v4];
}

- (void)clearUtteranceContext
{
}

- (id)spanMatchedEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_spanMatchedEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)spanMatchedEntitiesCount
{
  return [(NSArray *)self->_spanMatchedEntities count];
}

- (void)addSpanMatchedEntities:(id)a3
{
  id v4 = a3;
  spanMatchedEntities = self->_spanMatchedEntities;
  id v8 = v4;
  if (!spanMatchedEntities)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_spanMatchedEntities;
    self->_spanMatchedEntities = v6;

    id v4 = v8;
    spanMatchedEntities = self->_spanMatchedEntities;
  }
  [(NSArray *)spanMatchedEntities addObject:v4];
}

- (void)clearSpanMatchedEntities
{
}

- (id)retrievedToolsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_retrievedTools objectAtIndexedSubscript:a3];
}

- (unint64_t)retrievedToolsCount
{
  return [(NSArray *)self->_retrievedTools count];
}

- (void)addRetrievedTools:(id)a3
{
  id v4 = a3;
  retrievedTools = self->_retrievedTools;
  id v8 = v4;
  if (!retrievedTools)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_retrievedTools;
    self->_retrievedTools = v6;

    id v4 = v8;
    retrievedTools = self->_retrievedTools;
  }
  [(NSArray *)retrievedTools addObject:v4];
}

- (void)clearRetrievedTools
{
}

@end