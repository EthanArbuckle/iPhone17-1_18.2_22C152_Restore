@interface FLSchemaFLActionEvaluationEnded
- (BOOL)hasActionStatementId;
- (BOOL)hasEvaluationType;
- (BOOL)hasIfSessionId;
- (BOOL)hasTaskEvaluation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLActionEvaluationEnded)initWithDictionary:(id)a3;
- (FLSchemaFLActionEvaluationEnded)initWithJSON:(id)a3;
- (FLSchemaFLTaskEvaluation)taskEvaluation;
- (NSArray)candidateEvaluations;
- (NSData)jsonData;
- (SISchemaUUID)ifSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)candidateEvaluationsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)evaluationType;
- (unint64_t)candidateEvaluationsCount;
- (unint64_t)hash;
- (unsigned)actionStatementId;
- (void)addCandidateEvaluations:(id)a3;
- (void)clearCandidateEvaluations;
- (void)deleteActionStatementId;
- (void)deleteEvaluationType;
- (void)deleteIfSessionId;
- (void)deleteTaskEvaluation;
- (void)setActionStatementId:(unsigned int)a3;
- (void)setCandidateEvaluations:(id)a3;
- (void)setEvaluationType:(int)a3;
- (void)setHasActionStatementId:(BOOL)a3;
- (void)setHasEvaluationType:(BOOL)a3;
- (void)setHasIfSessionId:(BOOL)a3;
- (void)setHasTaskEvaluation:(BOOL)a3;
- (void)setIfSessionId:(id)a3;
- (void)setTaskEvaluation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLActionEvaluationEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLSchemaFLActionEvaluationEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(FLSchemaFLActionEvaluationEnded *)self ifSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLSchemaFLActionEvaluationEnded *)self deleteIfSessionId];
  }
  v9 = [(FLSchemaFLActionEvaluationEnded *)self taskEvaluation];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLSchemaFLActionEvaluationEnded *)self deleteTaskEvaluation];
  }
  v12 = [(FLSchemaFLActionEvaluationEnded *)self candidateEvaluations];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(FLSchemaFLActionEvaluationEnded *)self setCandidateEvaluations:v13];

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
  objc_storeStrong((id *)&self->_candidateEvaluations, 0);
  objc_storeStrong((id *)&self->_taskEvaluation, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
}

- (void)setHasTaskEvaluation:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIfSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)evaluationType
{
  return self->_evaluationType;
}

- (void)setCandidateEvaluations:(id)a3
{
}

- (NSArray)candidateEvaluations
{
  return self->_candidateEvaluations;
}

- (void)setTaskEvaluation:(id)a3
{
}

- (FLSchemaFLTaskEvaluation)taskEvaluation
{
  return self->_taskEvaluation;
}

- (unsigned)actionStatementId
{
  return self->_actionStatementId;
}

- (void)setIfSessionId:(id)a3
{
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (FLSchemaFLActionEvaluationEnded)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FLSchemaFLActionEvaluationEnded;
  v5 = [(FLSchemaFLActionEvaluationEnded *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLSchemaFLActionEvaluationEnded *)v5 setIfSessionId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"actionStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLActionEvaluationEnded setActionStatementId:](v5, "setActionStatementId:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"taskEvaluation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[FLSchemaFLTaskEvaluation alloc] initWithDictionary:v9];
      [(FLSchemaFLActionEvaluationEnded *)v5 setTaskEvaluation:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"candidateEvaluations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v9;
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [[FLSchemaFLCandidateEvaluation alloc] initWithDictionary:v17];
              [(FLSchemaFLActionEvaluationEnded *)v5 addCandidateEvaluations:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v14);
      }

      v6 = v23;
      v9 = v22;
    }
    v19 = [v4 objectForKeyedSubscript:@"evaluationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLActionEvaluationEnded setEvaluationType:](v5, "setEvaluationType:", [v19 intValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (FLSchemaFLActionEvaluationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLActionEvaluationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLActionEvaluationEnded *)self dictionaryRepresentation];
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLSchemaFLActionEvaluationEnded actionStatementId](self, "actionStatementId"));
    [v3 setObject:v4 forKeyedSubscript:@"actionStatementId"];
  }
  if ([(NSArray *)self->_candidateEvaluations count])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v6 = self->_candidateEvaluations;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          if (v11)
          {
            [v5 addObject:v11];
          }
          else
          {
            id v12 = [MEMORY[0x1E4F1CA98] null];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKeyedSubscript:@"candidateEvaluations"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v13 = [(FLSchemaFLActionEvaluationEnded *)self evaluationType];
    uint64_t v14 = @"FLEVALUATIONTYPE_UNKNOWN";
    if (v13 == 1) {
      uint64_t v14 = @"FLEVALUATIONTYPE_FAST_EVALUATOR";
    }
    if (v13 == 2) {
      uint64_t v15 = @"FLEVALUATIONTYPE_FULL_EVALUATOR";
    }
    else {
      uint64_t v15 = v14;
    }
    [v3 setObject:v15 forKeyedSubscript:@"evaluationType"];
  }
  if (self->_ifSessionId)
  {
    v16 = [(FLSchemaFLActionEvaluationEnded *)self ifSessionId];
    uint64_t v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"ifSessionId"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"ifSessionId"];
    }
  }
  if (self->_taskEvaluation)
  {
    v19 = [(FLSchemaFLActionEvaluationEnded *)self taskEvaluation];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"taskEvaluation"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"taskEvaluation"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ifSessionId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_actionStatementId;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(FLSchemaFLTaskEvaluation *)self->_taskEvaluation hash];
  uint64_t v6 = [(NSArray *)self->_candidateEvaluations hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_evaluationType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(FLSchemaFLActionEvaluationEnded *)self ifSessionId];
  uint64_t v6 = [v4 ifSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(FLSchemaFLActionEvaluationEnded *)self ifSessionId];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(FLSchemaFLActionEvaluationEnded *)self ifSessionId];
    v10 = [v4 ifSessionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[44] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int actionStatementId = self->_actionStatementId;
    if (actionStatementId != [v4 actionStatementId]) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(FLSchemaFLActionEvaluationEnded *)self taskEvaluation];
  uint64_t v6 = [v4 taskEvaluation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(FLSchemaFLActionEvaluationEnded *)self taskEvaluation];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(FLSchemaFLActionEvaluationEnded *)self taskEvaluation];
    v16 = [v4 taskEvaluation];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(FLSchemaFLActionEvaluationEnded *)self candidateEvaluations];
  uint64_t v6 = [v4 candidateEvaluations];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v18 = [(FLSchemaFLActionEvaluationEnded *)self candidateEvaluations];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(FLSchemaFLActionEvaluationEnded *)self candidateEvaluations];
    v21 = [v4 candidateEvaluations];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int v25 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v25 == ((v4[44] >> 1) & 1))
  {
    if (!v25
      || (int evaluationType = self->_evaluationType, evaluationType == [v4 evaluationType]))
    {
      BOOL v23 = 1;
      goto LABEL_21;
    }
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(FLSchemaFLActionEvaluationEnded *)self ifSessionId];

  if (v5)
  {
    uint64_t v6 = [(FLSchemaFLActionEvaluationEnded *)self ifSessionId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v7 = [(FLSchemaFLActionEvaluationEnded *)self taskEvaluation];

  if (v7)
  {
    uint64_t v8 = [(FLSchemaFLActionEvaluationEnded *)self taskEvaluation];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = self->_candidateEvaluations;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLActionEvaluationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteEvaluationType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEvaluationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEvaluationType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEvaluationType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int evaluationType = a3;
}

- (id)candidateEvaluationsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_candidateEvaluations objectAtIndexedSubscript:a3];
}

- (unint64_t)candidateEvaluationsCount
{
  return [(NSArray *)self->_candidateEvaluations count];
}

- (void)addCandidateEvaluations:(id)a3
{
  id v4 = a3;
  candidateEvaluations = self->_candidateEvaluations;
  id v8 = v4;
  if (!candidateEvaluations)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_candidateEvaluations;
    self->_candidateEvaluations = v6;

    id v4 = v8;
    candidateEvaluations = self->_candidateEvaluations;
  }
  [(NSArray *)candidateEvaluations addObject:v4];
}

- (void)clearCandidateEvaluations
{
}

- (void)deleteTaskEvaluation
{
}

- (BOOL)hasTaskEvaluation
{
  return self->_taskEvaluation != 0;
}

- (void)deleteActionStatementId
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasActionStatementId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionStatementId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setActionStatementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int actionStatementId = a3;
}

- (void)deleteIfSessionId
{
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

@end