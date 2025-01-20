@interface FLSchemaFLTaskEvaluation
- (BOOL)hasActionResolutionState;
- (BOOL)hasTaskOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLTaskEvaluation)initWithDictionary:(id)a3;
- (FLSchemaFLTaskEvaluation)initWithJSON:(id)a3;
- (FLSchemaFLTaskOutcome)taskOutcome;
- (NSArray)evaluationNodes;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)evaluationNodesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)actionResolutionState;
- (unint64_t)evaluationNodesCount;
- (unint64_t)hash;
- (void)addEvaluationNodes:(id)a3;
- (void)clearEvaluationNodes;
- (void)deleteActionResolutionState;
- (void)deleteTaskOutcome;
- (void)setActionResolutionState:(int)a3;
- (void)setEvaluationNodes:(id)a3;
- (void)setHasActionResolutionState:(BOOL)a3;
- (void)setHasTaskOutcome:(BOOL)a3;
- (void)setTaskOutcome:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLTaskEvaluation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLSchemaFLTaskEvaluation;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(FLSchemaFLTaskEvaluation *)self taskOutcome];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLSchemaFLTaskEvaluation *)self deleteTaskOutcome];
  }
  v9 = [(FLSchemaFLTaskEvaluation *)self evaluationNodes];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(FLSchemaFLTaskEvaluation *)self setEvaluationNodes:v10];

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
  objc_storeStrong((id *)&self->_evaluationNodes, 0);
  objc_storeStrong((id *)&self->_taskOutcome, 0);
}

- (void)setHasTaskOutcome:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setEvaluationNodes:(id)a3
{
}

- (NSArray)evaluationNodes
{
  return self->_evaluationNodes;
}

- (void)setTaskOutcome:(id)a3
{
}

- (FLSchemaFLTaskOutcome)taskOutcome
{
  return self->_taskOutcome;
}

- (int)actionResolutionState
{
  return self->_actionResolutionState;
}

- (FLSchemaFLTaskEvaluation)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FLSchemaFLTaskEvaluation;
  v5 = [(FLSchemaFLTaskEvaluation *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionResolutionState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLTaskEvaluation setActionResolutionState:](v5, "setActionResolutionState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"taskOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[FLSchemaFLTaskOutcome alloc] initWithDictionary:v7];
      [(FLSchemaFLTaskEvaluation *)v5 setTaskOutcome:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"evaluationNodes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v7;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[FLSchemaFLTaskEvaluationNode alloc] initWithDictionary:v15];
              [(FLSchemaFLTaskEvaluation *)v5 addEvaluationNodes:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      v7 = v19;
    }
    v17 = v5;
  }
  return v5;
}

- (FLSchemaFLTaskEvaluation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLTaskEvaluation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLTaskEvaluation *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [(FLSchemaFLTaskEvaluation *)self actionResolutionState];
    v5 = @"FLACTIONRESOLUTIONSTATE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"FLACTIONRESOLUTIONSTATE_INCOMPLETE";
    }
    if (v4 == 2) {
      v6 = @"FLACTIONRESOLUTIONSTATE_COMPLETE";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"actionResolutionState"];
  }
  if ([(NSArray *)self->_evaluationNodes count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v8 = self->_evaluationNodes;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
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
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"evaluationNodes"];
  }
  if (self->_taskOutcome)
  {
    uint64_t v15 = [(FLSchemaFLTaskEvaluation *)self taskOutcome];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"taskOutcome"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"taskOutcome"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_actionResolutionState;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(FLSchemaFLTaskOutcome *)self->_taskOutcome hash] ^ v3;
  return v4 ^ [(NSArray *)self->_evaluationNodes hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int actionResolutionState = self->_actionResolutionState;
    if (actionResolutionState != [v4 actionResolutionState]) {
      goto LABEL_15;
    }
  }
  v6 = [(FLSchemaFLTaskEvaluation *)self taskOutcome];
  uint64_t v7 = [v4 taskOutcome];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(FLSchemaFLTaskEvaluation *)self taskOutcome];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(FLSchemaFLTaskEvaluation *)self taskOutcome];
    uint64_t v11 = [v4 taskOutcome];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(FLSchemaFLTaskEvaluation *)self evaluationNodes];
  uint64_t v7 = [v4 evaluationNodes];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(FLSchemaFLTaskEvaluation *)self evaluationNodes];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    uint64_t v15 = [(FLSchemaFLTaskEvaluation *)self evaluationNodes];
    v16 = [v4 evaluationNodes];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(FLSchemaFLTaskEvaluation *)self taskOutcome];

  if (v5)
  {
    v6 = [(FLSchemaFLTaskEvaluation *)self taskOutcome];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_evaluationNodes;
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
  return FLSchemaFLTaskEvaluationReadFrom(self, (uint64_t)a3);
}

- (id)evaluationNodesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_evaluationNodes objectAtIndexedSubscript:a3];
}

- (unint64_t)evaluationNodesCount
{
  return [(NSArray *)self->_evaluationNodes count];
}

- (void)addEvaluationNodes:(id)a3
{
  id v4 = a3;
  evaluationNodes = self->_evaluationNodes;
  id v8 = v4;
  if (!evaluationNodes)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_evaluationNodes;
    self->_evaluationNodes = v6;

    id v4 = v8;
    evaluationNodes = self->_evaluationNodes;
  }
  [(NSArray *)evaluationNodes addObject:v4];
}

- (void)clearEvaluationNodes
{
}

- (void)deleteTaskOutcome
{
}

- (BOOL)hasTaskOutcome
{
  return self->_taskOutcome != 0;
}

- (void)deleteActionResolutionState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasActionResolutionState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionResolutionState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setActionResolutionState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int actionResolutionState = a3;
}

@end