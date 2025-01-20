@interface SISchemaLinkedAccessoryState
- (BOOL)hasAccessoryId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)gradingOptInStateChanges;
- (NSData)jsonData;
- (SISchemaLinkedAccessoryState)initWithDictionary:(id)a3;
- (SISchemaLinkedAccessoryState)initWithJSON:(id)a3;
- (SISchemaUUID)accessoryId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)gradingOptInStateChangesCount;
- (unint64_t)hash;
- (void)addGradingOptInStateChanges:(id)a3;
- (void)clearGradingOptInStateChanges;
- (void)deleteAccessoryId;
- (void)setAccessoryId:(id)a3;
- (void)setGradingOptInStateChanges:(id)a3;
- (void)setHasAccessoryId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaLinkedAccessoryState

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaLinkedAccessoryState;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaLinkedAccessoryState *)self accessoryId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaLinkedAccessoryState *)self deleteAccessoryId];
  }
  v9 = [(SISchemaLinkedAccessoryState *)self gradingOptInStateChanges];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(SISchemaLinkedAccessoryState *)self setGradingOptInStateChanges:v10];

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
  objc_storeStrong((id *)&self->_gradingOptInStateChanges, 0);
  objc_storeStrong((id *)&self->_accessoryId, 0);
}

- (void)setHasAccessoryId:(BOOL)a3
{
  self->_hasAccessoryId = a3;
}

- (void)setGradingOptInStateChanges:(id)a3
{
}

- (NSArray)gradingOptInStateChanges
{
  return self->_gradingOptInStateChanges;
}

- (void)setAccessoryId:(id)a3
{
}

- (SISchemaUUID)accessoryId
{
  return self->_accessoryId;
}

- (SISchemaLinkedAccessoryState)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SISchemaLinkedAccessoryState;
  v5 = [(SISchemaLinkedAccessoryState *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"accessoryId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaLinkedAccessoryState *)v5 setAccessoryId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"gradingOptInStateChanges"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = v6;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[SISchemaGradingOptInStateChange alloc] initWithDictionary:v14];
              [(SISchemaLinkedAccessoryState *)v5 addGradingOptInStateChanges:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;
  }
  return v5;
}

- (SISchemaLinkedAccessoryState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaLinkedAccessoryState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaLinkedAccessoryState *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_accessoryId)
  {
    id v4 = [(SISchemaLinkedAccessoryState *)self accessoryId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"accessoryId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"accessoryId"];
    }
  }
  if ([(NSArray *)self->_gradingOptInStateChanges count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v8 = self->_gradingOptInStateChanges;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"gradingOptInStateChanges"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_accessoryId hash];
  return [(NSArray *)self->_gradingOptInStateChanges hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaLinkedAccessoryState *)self accessoryId];
  v6 = [v4 accessoryId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaLinkedAccessoryState *)self accessoryId];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(SISchemaLinkedAccessoryState *)self accessoryId];
    uint64_t v10 = [v4 accessoryId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaLinkedAccessoryState *)self gradingOptInStateChanges];
  v6 = [v4 gradingOptInStateChanges];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaLinkedAccessoryState *)self gradingOptInStateChanges];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(SISchemaLinkedAccessoryState *)self gradingOptInStateChanges];
    v15 = [v4 gradingOptInStateChanges];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SISchemaLinkedAccessoryState *)self accessoryId];

  if (v5)
  {
    v6 = [(SISchemaLinkedAccessoryState *)self accessoryId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_gradingOptInStateChanges;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaLinkedAccessoryStateReadFrom(self, (uint64_t)a3);
}

- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_gradingOptInStateChanges objectAtIndexedSubscript:a3];
}

- (unint64_t)gradingOptInStateChangesCount
{
  return [(NSArray *)self->_gradingOptInStateChanges count];
}

- (void)addGradingOptInStateChanges:(id)a3
{
  id v4 = a3;
  gradingOptInStateChanges = self->_gradingOptInStateChanges;
  id v8 = v4;
  if (!gradingOptInStateChanges)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_gradingOptInStateChanges;
    self->_gradingOptInStateChanges = v6;

    id v4 = v8;
    gradingOptInStateChanges = self->_gradingOptInStateChanges;
  }
  [(NSArray *)gradingOptInStateChanges addObject:v4];
}

- (void)clearGradingOptInStateChanges
{
}

- (void)deleteAccessoryId
{
}

- (BOOL)hasAccessoryId
{
  return self->_accessoryId != 0;
}

@end