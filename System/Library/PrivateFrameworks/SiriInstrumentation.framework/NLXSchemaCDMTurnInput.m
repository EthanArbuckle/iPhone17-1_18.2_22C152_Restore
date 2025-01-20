@interface NLXSchemaCDMTurnInput
- (BOOL)hasIsTapToEdit;
- (BOOL)hasTurnContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTapToEdit;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMTurnContext)turnContext;
- (NLXSchemaCDMTurnInput)initWithDictionary:(id)a3;
- (NLXSchemaCDMTurnInput)initWithJSON:(id)a3;
- (NSArray)asrHypothesisIds;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)asrHypothesisIdsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)asrHypothesisIdsCount;
- (unint64_t)hash;
- (void)addAsrHypothesisIds:(id)a3;
- (void)clearAsrHypothesisIds;
- (void)deleteIsTapToEdit;
- (void)deleteTurnContext;
- (void)setAsrHypothesisIds:(id)a3;
- (void)setHasIsTapToEdit:(BOOL)a3;
- (void)setHasTurnContext:(BOOL)a3;
- (void)setIsTapToEdit:(BOOL)a3;
- (void)setTurnContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMTurnInput

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMTurnInput;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMTurnInput *)self asrHypothesisIds];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(NLXSchemaCDMTurnInput *)self setAsrHypothesisIds:v7];

  v8 = [(NLXSchemaCDMTurnInput *)self turnContext];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(NLXSchemaCDMTurnInput *)self deleteTurnContext];
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
  objc_storeStrong((id *)&self->_turnContext, 0);
  objc_storeStrong((id *)&self->_asrHypothesisIds, 0);
}

- (void)setHasTurnContext:(BOOL)a3
{
  *(&self->_isTapToEdit + 2) = a3;
}

- (BOOL)isTapToEdit
{
  return self->_isTapToEdit;
}

- (void)setTurnContext:(id)a3
{
}

- (NLXSchemaCDMTurnContext)turnContext
{
  return self->_turnContext;
}

- (void)setAsrHypothesisIds:(id)a3
{
}

- (NSArray)asrHypothesisIds
{
  return self->_asrHypothesisIds;
}

- (NLXSchemaCDMTurnInput)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NLXSchemaCDMTurnInput;
  v5 = [(NLXSchemaCDMTurnInput *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrHypothesisIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [SISchemaUUID alloc];
              v14 = -[SISchemaUUID initWithDictionary:](v13, "initWithDictionary:", v12, (void)v20);
              [(NLXSchemaCDMTurnInput *)v5 addAsrHypothesisIds:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"turnContext", (void)v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[NLXSchemaCDMTurnContext alloc] initWithDictionary:v15];
      [(NLXSchemaCDMTurnInput *)v5 setTurnContext:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"isTapToEdit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMTurnInput setIsTapToEdit:](v5, "setIsTapToEdit:", [v17 BOOLValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (NLXSchemaCDMTurnInput)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMTurnInput *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMTurnInput *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_asrHypothesisIds count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_asrHypothesisIds;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"asrHypothesisIds"];
  }
  if (*(&self->_isTapToEdit + 1))
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaCDMTurnInput isTapToEdit](self, "isTapToEdit"));
    [v3 setObject:v12 forKeyedSubscript:@"isTapToEdit"];
  }
  if (self->_turnContext)
  {
    v13 = [(NLXSchemaCDMTurnInput *)self turnContext];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"turnContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"turnContext"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v17);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_asrHypothesisIds hash];
  unint64_t v4 = [(NLXSchemaCDMTurnContext *)self->_turnContext hash];
  if (*(&self->_isTapToEdit + 1)) {
    uint64_t v5 = 2654435761 * self->_isTapToEdit;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(NLXSchemaCDMTurnInput *)self asrHypothesisIds];
  uint64_t v6 = [v4 asrHypothesisIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaCDMTurnInput *)self asrHypothesisIds];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NLXSchemaCDMTurnInput *)self asrHypothesisIds];
    uint64_t v10 = [v4 asrHypothesisIds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaCDMTurnInput *)self turnContext];
  uint64_t v6 = [v4 turnContext];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(NLXSchemaCDMTurnInput *)self turnContext];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(NLXSchemaCDMTurnInput *)self turnContext];
    v15 = [v4 turnContext];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_isTapToEdit + 1) == (v4[25] & 1))
  {
    if (!*(&self->_isTapToEdit + 1)
      || (int isTapToEdit = self->_isTapToEdit, isTapToEdit == [v4 isTapToEdit]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
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
  uint64_t v5 = self->_asrHypothesisIds;
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

  uint64_t v10 = [(NLXSchemaCDMTurnInput *)self turnContext];

  if (v10)
  {
    int v11 = [(NLXSchemaCDMTurnInput *)self turnContext];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_isTapToEdit + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMTurnInputReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsTapToEdit
{
  *(&self->_isTapToEdit + 1) &= ~1u;
}

- (void)setHasIsTapToEdit:(BOOL)a3
{
  *(&self->_isTapToEdit + 1) = *(&self->_isTapToEdit + 1) & 0xFE | a3;
}

- (BOOL)hasIsTapToEdit
{
  return *(&self->_isTapToEdit + 1);
}

- (void)setIsTapToEdit:(BOOL)a3
{
  *(&self->_isTapToEdit + 1) |= 1u;
  self->_int isTapToEdit = a3;
}

- (void)deleteTurnContext
{
}

- (BOOL)hasTurnContext
{
  return self->_turnContext != 0;
}

- (id)asrHypothesisIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_asrHypothesisIds objectAtIndexedSubscript:a3];
}

- (unint64_t)asrHypothesisIdsCount
{
  return [(NSArray *)self->_asrHypothesisIds count];
}

- (void)addAsrHypothesisIds:(id)a3
{
  id v4 = a3;
  asrHypothesisIds = self->_asrHypothesisIds;
  id v8 = v4;
  if (!asrHypothesisIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_asrHypothesisIds;
    self->_asrHypothesisIds = v6;

    id v4 = v8;
    asrHypothesisIds = self->_asrHypothesisIds;
  }
  [(NSArray *)asrHypothesisIds addObject:v4];
}

- (void)clearAsrHypothesisIds
{
}

@end