@interface QDSchemaQDToolSource
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contexualMatches;
- (NSArray)spanMatches;
- (NSData)jsonData;
- (QDSchemaQDToolSource)initWithDictionary:(id)a3;
- (QDSchemaQDToolSource)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)contexualMatchesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)spanMatchesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)contexualMatchesCount;
- (unint64_t)hash;
- (unint64_t)spanMatchesCount;
- (void)addContexualMatches:(id)a3;
- (void)addSpanMatches:(id)a3;
- (void)clearContexualMatches;
- (void)clearSpanMatches;
- (void)setContexualMatches:(id)a3;
- (void)setSpanMatches:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation QDSchemaQDToolSource

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)QDSchemaQDToolSource;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(QDSchemaQDToolSource *)self spanMatches];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(QDSchemaQDToolSource *)self setSpanMatches:v7];

  v8 = [(QDSchemaQDToolSource *)self contexualMatches];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];

  [(QDSchemaQDToolSource *)self setContexualMatches:v9];
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
  objc_storeStrong((id *)&self->_contexualMatches, 0);
  objc_storeStrong((id *)&self->_spanMatches, 0);
}

- (void)setContexualMatches:(id)a3
{
}

- (NSArray)contexualMatches
{
  return self->_contexualMatches;
}

- (void)setSpanMatches:(id)a3
{
}

- (NSArray)spanMatches
{
  return self->_spanMatches;
}

- (QDSchemaQDToolSource)initWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QDSchemaQDToolSource;
  v5 = [(QDSchemaQDToolSource *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"spanMatches"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[QDSchemaQDSpanMatchedEntity alloc] initWithDictionary:v12];
              [(QDSchemaQDToolSource *)v5 addSpanMatches:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"contexualMatches"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v6;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[SISchemaUUID alloc] initWithDictionary:v20];
              [(QDSchemaQDToolSource *)v5 addContexualMatches:v21];
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v17);
      }

      v6 = v24;
    }
    v22 = v5;
  }
  return v5;
}

- (QDSchemaQDToolSource)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(QDSchemaQDToolSource *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(QDSchemaQDToolSource *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_contexualMatches count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v5 = self->_contexualMatches;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"contexualMatches"];
  }
  if ([(NSArray *)self->_spanMatches count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = self->_spanMatches;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
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
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"spanMatches"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_spanMatches hash];
  return [(NSArray *)self->_contexualMatches hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(QDSchemaQDToolSource *)self spanMatches];
  uint64_t v6 = [v4 spanMatches];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(QDSchemaQDToolSource *)self spanMatches];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(QDSchemaQDToolSource *)self spanMatches];
    uint64_t v10 = [v4 spanMatches];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(QDSchemaQDToolSource *)self contexualMatches];
  uint64_t v6 = [v4 contexualMatches];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(QDSchemaQDToolSource *)self contexualMatches];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    uint64_t v14 = [(QDSchemaQDToolSource *)self contexualMatches];
    uint64_t v15 = [v4 contexualMatches];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_spanMatches;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_contexualMatches;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDToolSourceReadFrom(self, (uint64_t)a3);
}

- (id)contexualMatchesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contexualMatches objectAtIndexedSubscript:a3];
}

- (unint64_t)contexualMatchesCount
{
  return [(NSArray *)self->_contexualMatches count];
}

- (void)addContexualMatches:(id)a3
{
  id v4 = a3;
  contexualMatches = self->_contexualMatches;
  id v8 = v4;
  if (!contexualMatches)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contexualMatches;
    self->_contexualMatches = v6;

    id v4 = v8;
    contexualMatches = self->_contexualMatches;
  }
  [(NSArray *)contexualMatches addObject:v4];
}

- (void)clearContexualMatches
{
}

- (id)spanMatchesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_spanMatches objectAtIndexedSubscript:a3];
}

- (unint64_t)spanMatchesCount
{
  return [(NSArray *)self->_spanMatches count];
}

- (void)addSpanMatches:(id)a3
{
  id v4 = a3;
  spanMatches = self->_spanMatches;
  id v8 = v4;
  if (!spanMatches)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_spanMatches;
    self->_spanMatches = v6;

    id v4 = v8;
    spanMatches = self->_spanMatches;
  }
  [(NSArray *)spanMatches addObject:v4];
}

- (void)clearSpanMatches
{
}

@end