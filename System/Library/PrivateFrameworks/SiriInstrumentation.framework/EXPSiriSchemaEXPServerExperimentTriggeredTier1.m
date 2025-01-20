@interface EXPSiriSchemaEXPServerExperimentTriggeredTier1
- (BOOL)hasCodepathId;
- (BOOL)hasPegasusId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)initWithDictionary:(id)a3;
- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)initWithJSON:(id)a3;
- (NSArray)allocations;
- (NSData)jsonData;
- (SISchemaUUID)codepathId;
- (SISchemaUUID)pegasusId;
- (id)allocationAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)allocationCount;
- (unint64_t)hash;
- (void)addAllocation:(id)a3;
- (void)clearAllocation;
- (void)deleteCodepathId;
- (void)deletePegasusId;
- (void)setAllocations:(id)a3;
- (void)setCodepathId:(id)a3;
- (void)setHasCodepathId:(BOOL)a3;
- (void)setHasPegasusId:(BOOL)a3;
- (void)setPegasusId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation EXPSiriSchemaEXPServerExperimentTriggeredTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EXPSiriSchemaEXPServerExperimentTriggeredTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self allocations];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self setAllocations:v7];

  v8 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self codepathId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self deleteCodepathId];
  }
  v11 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self pegasusId];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self deletePegasusId];
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
  objc_storeStrong((id *)&self->_pegasusId, 0);
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_allocations, 0);
}

- (void)setHasPegasusId:(BOOL)a3
{
  self->_hasPegasusId = a3;
}

- (void)setHasCodepathId:(BOOL)a3
{
  self->_hasCodepathId = a3;
}

- (void)setPegasusId:(id)a3
{
}

- (SISchemaUUID)pegasusId
{
  return self->_pegasusId;
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

- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EXPSiriSchemaEXPServerExperimentTriggeredTier1;
  v5 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"allocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
            uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v13 = [EXPSchemaEXPTrialExperiment alloc];
              v14 = -[EXPSchemaEXPTrialExperiment initWithDictionary:](v13, "initWithDictionary:", v12, (void)v21);
              [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)v5 addAllocation:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    objc_super v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"codepathId", (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)v5 setCodepathId:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"pegasusId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[SISchemaUUID alloc] initWithDictionary:v17];
      [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)v5 setPegasusId:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_allocations count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = self->_allocations;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"allocation"];
  }
  if (self->_codepathId)
  {
    uint64_t v12 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self codepathId];
    int v13 = [v12 dictionaryRepresentation];
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
  if (self->_pegasusId)
  {
    objc_super v15 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self pegasusId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"pegasusId"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"pegasusId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_allocations hash];
  unint64_t v4 = [(SISchemaUUID *)self->_codepathId hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_pegasusId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self allocations];
  uint64_t v6 = [v4 allocations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self allocations];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self allocations];
    uint64_t v10 = [v4 allocations];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self codepathId];
  uint64_t v6 = [v4 codepathId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self codepathId];
  if (v12)
  {
    int v13 = (void *)v12;
    v14 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self codepathId];
    objc_super v15 = [v4 codepathId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self pegasusId];
  uint64_t v6 = [v4 pegasusId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self pegasusId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self pegasusId];
    long long v20 = [v4 pegasusId];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_allocations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self codepathId];

  if (v10)
  {
    int v11 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self codepathId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self pegasusId];

  if (v12)
  {
    int v13 = [(EXPSiriSchemaEXPServerExperimentTriggeredTier1 *)self pegasusId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPServerExperimentTriggeredTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deletePegasusId
{
}

- (BOOL)hasPegasusId
{
  return self->_pegasusId != 0;
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