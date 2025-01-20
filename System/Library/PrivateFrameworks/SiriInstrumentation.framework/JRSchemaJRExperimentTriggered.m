@interface JRSchemaJRExperimentTriggered
- (BOOL)hasCodepathId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaJRExperimentTriggered)initWithDictionary:(id)a3;
- (JRSchemaJRExperimentTriggered)initWithJSON:(id)a3;
- (NSArray)allocations;
- (NSData)jsonData;
- (SISchemaUUID)codepathId;
- (id)allocationAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)allocationCount;
- (unint64_t)hash;
- (void)addAllocation:(id)a3;
- (void)clearAllocation;
- (void)deleteCodepathId;
- (void)setAllocations:(id)a3;
- (void)setCodepathId:(id)a3;
- (void)setHasCodepathId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaJRExperimentTriggered

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)JRSchemaJRExperimentTriggered;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(JRSchemaJRExperimentTriggered *)self allocations];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(JRSchemaJRExperimentTriggered *)self setAllocations:v7];

  v8 = [(JRSchemaJRExperimentTriggered *)self codepathId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(JRSchemaJRExperimentTriggered *)self deleteCodepathId];
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
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_allocations, 0);
}

- (void)setHasCodepathId:(BOOL)a3
{
  self->_hasCodepathId = a3;
}

- (void)setCodepathId:(id)a3
{
}

- (SISchemaUUID)codepathId
{
  return self->_codepathId;
}

- (void)setAllocations:(id)a3
{
}

- (NSArray)allocations
{
  return self->_allocations;
}

- (JRSchemaJRExperimentTriggered)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)JRSchemaJRExperimentTriggered;
  v5 = [(JRSchemaJRExperimentTriggered *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"allocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [EXPSchemaEXPTrialExperiment alloc];
              v14 = -[EXPSchemaEXPTrialExperiment initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(JRSchemaJRExperimentTriggered *)v5 addAllocation:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"codepathId", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(JRSchemaJRExperimentTriggered *)v5 setCodepathId:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (JRSchemaJRExperimentTriggered)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(JRSchemaJRExperimentTriggered *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaJRExperimentTriggered *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_allocations count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_allocations;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"allocation"];
  }
  if (self->_codepathId)
  {
    uint64_t v12 = [(JRSchemaJRExperimentTriggered *)self codepathId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"codepathId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"codepathId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_allocations hash];
  return [(SISchemaUUID *)self->_codepathId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(JRSchemaJRExperimentTriggered *)self allocations];
  uint64_t v6 = [v4 allocations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(JRSchemaJRExperimentTriggered *)self allocations];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(JRSchemaJRExperimentTriggered *)self allocations];
    uint64_t v10 = [v4 allocations];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(JRSchemaJRExperimentTriggered *)self codepathId];
  uint64_t v6 = [v4 codepathId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(JRSchemaJRExperimentTriggered *)self codepathId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(JRSchemaJRExperimentTriggered *)self codepathId];
    v15 = [v4 codepathId];
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
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_allocations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(JRSchemaJRExperimentTriggered *)self codepathId];

  if (v10)
  {
    int v11 = [(JRSchemaJRExperimentTriggered *)self codepathId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRExperimentTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)deleteCodepathId
{
}

- (BOOL)hasCodepathId
{
  return self->_codepathId != 0;
}

- (id)allocationAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_allocations objectAtIndexedSubscript:a3];
}

- (unint64_t)allocationCount
{
  return [(NSArray *)self->_allocations count];
}

- (void)addAllocation:(id)a3
{
  id v4 = a3;
  allocations = self->_allocations;
  id v8 = v4;
  if (!allocations)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_allocations;
    self->_allocations = v6;

    id v4 = v8;
    allocations = self->_allocations;
  }
  [(NSArray *)allocations addObject:v4];
}

- (void)clearAllocation
{
}

@end