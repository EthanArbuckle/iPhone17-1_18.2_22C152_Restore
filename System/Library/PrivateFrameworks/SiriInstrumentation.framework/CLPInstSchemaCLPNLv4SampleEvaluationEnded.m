@interface CLPInstSchemaCLPNLv4SampleEvaluationEnded
- (BOOL)evaluated;
- (BOOL)evaluationResult;
- (BOOL)evaluationResultOnTheFirstUserParse;
- (BOOL)hasEvaluated;
- (BOOL)hasEvaluationResult;
- (BOOL)hasEvaluationResultOnTheFirstUserParse;
- (BOOL)hasMatchedIndex;
- (BOOL)hasUserProfileSandboxRequested;
- (BOOL)hasUserStatedTaskOnTheFirstUserParse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userProfileSandboxRequested;
- (BOOL)userStatedTaskOnTheFirstUserParse;
- (CLPInstSchemaCLPNLv4SampleEvaluationEnded)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPNLv4SampleEvaluationEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)matchedIndex;
- (unint64_t)hash;
- (void)deleteEvaluated;
- (void)deleteEvaluationResult;
- (void)deleteEvaluationResultOnTheFirstUserParse;
- (void)deleteMatchedIndex;
- (void)deleteUserProfileSandboxRequested;
- (void)deleteUserStatedTaskOnTheFirstUserParse;
- (void)setEvaluated:(BOOL)a3;
- (void)setEvaluationResult:(BOOL)a3;
- (void)setEvaluationResultOnTheFirstUserParse:(BOOL)a3;
- (void)setHasEvaluated:(BOOL)a3;
- (void)setHasEvaluationResult:(BOOL)a3;
- (void)setHasEvaluationResultOnTheFirstUserParse:(BOOL)a3;
- (void)setHasMatchedIndex:(BOOL)a3;
- (void)setHasUserProfileSandboxRequested:(BOOL)a3;
- (void)setHasUserStatedTaskOnTheFirstUserParse:(BOOL)a3;
- (void)setMatchedIndex:(int)a3;
- (void)setUserProfileSandboxRequested:(BOOL)a3;
- (void)setUserStatedTaskOnTheFirstUserParse:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPNLv4SampleEvaluationEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)userProfileSandboxRequested
{
  return self->_userProfileSandboxRequested;
}

- (BOOL)evaluationResult
{
  return self->_evaluationResult;
}

- (int)matchedIndex
{
  return self->_matchedIndex;
}

- (BOOL)userStatedTaskOnTheFirstUserParse
{
  return self->_userStatedTaskOnTheFirstUserParse;
}

- (BOOL)evaluationResultOnTheFirstUserParse
{
  return self->_evaluationResultOnTheFirstUserParse;
}

- (BOOL)evaluated
{
  return self->_evaluated;
}

- (CLPInstSchemaCLPNLv4SampleEvaluationEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLPInstSchemaCLPNLv4SampleEvaluationEnded;
  v5 = [(CLPInstSchemaCLPNLv4SampleEvaluationEnded *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"evaluated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluated:](v5, "setEvaluated:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"evaluationResultOnTheFirstUserParse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluationResultOnTheFirstUserParse:](v5, "setEvaluationResultOnTheFirstUserParse:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"userStatedTaskOnTheFirstUserParse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setUserStatedTaskOnTheFirstUserParse:](v5, "setUserStatedTaskOnTheFirstUserParse:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"matchedIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setMatchedIndex:](v5, "setMatchedIndex:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"evaluationResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setEvaluationResult:](v5, "setEvaluationResult:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"userProfileSandboxRequested"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationEnded setUserProfileSandboxRequested:](v5, "setUserProfileSandboxRequested:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPNLv4SampleEvaluationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPNLv4SampleEvaluationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPNLv4SampleEvaluationEnded *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if (v4)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded evaluated](self, "evaluated"));
    [v3 setObject:v7 forKeyedSubscript:@"evaluated"];

    char v4 = *(&self->_userProfileSandboxRequested + 1);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(&self->_userProfileSandboxRequested + 1) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded evaluationResult](self, "evaluationResult"));
  [v3 setObject:v8 forKeyedSubscript:@"evaluationResult"];

  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded evaluationResultOnTheFirstUserParse](self, "evaluationResultOnTheFirstUserParse"));
  [v3 setObject:v9 forKeyedSubscript:@"evaluationResultOnTheFirstUserParse"];

  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded matchedIndex](self, "matchedIndex"));
  [v3 setObject:v10 forKeyedSubscript:@"matchedIndex"];

  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded userProfileSandboxRequested](self, "userProfileSandboxRequested"));
  [v3 setObject:v11 forKeyedSubscript:@"userProfileSandboxRequested"];

  if ((*(&self->_userProfileSandboxRequested + 1) & 4) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPNLv4SampleEvaluationEnded userStatedTaskOnTheFirstUserParse](self, "userStatedTaskOnTheFirstUserParse"));
    [v3 setObject:v5 forKeyedSubscript:@"userStatedTaskOnTheFirstUserParse"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_userProfileSandboxRequested + 1))
  {
    uint64_t v2 = 2654435761 * self->_evaluated;
    if ((*(&self->_userProfileSandboxRequested + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_evaluationResultOnTheFirstUserParse;
      if ((*(&self->_userProfileSandboxRequested + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(&self->_userProfileSandboxRequested + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_userProfileSandboxRequested + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_userStatedTaskOnTheFirstUserParse;
    if ((*(&self->_userProfileSandboxRequested + 1) & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(&self->_userProfileSandboxRequested + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_matchedIndex;
    if ((*(&self->_userProfileSandboxRequested + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(&self->_userProfileSandboxRequested + 1) & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(&self->_userProfileSandboxRequested + 1) & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_evaluationResult;
  if ((*(&self->_userProfileSandboxRequested + 1) & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_userProfileSandboxRequested;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
  unsigned int v6 = v4[18];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (v5)
  {
    int evaluated = self->_evaluated;
    if (evaluated != [v4 evaluated]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    unsigned int v6 = v4[18];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    int evaluationResultOnTheFirstUserParse = self->_evaluationResultOnTheFirstUserParse;
    if (evaluationResultOnTheFirstUserParse != [v4 evaluationResultOnTheFirstUserParse]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    unsigned int v6 = v4[18];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    int userStatedTaskOnTheFirstUserParse = self->_userStatedTaskOnTheFirstUserParse;
    if (userStatedTaskOnTheFirstUserParse != [v4 userStatedTaskOnTheFirstUserParse]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    unsigned int v6 = v4[18];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    int matchedIndex = self->_matchedIndex;
    if (matchedIndex != [v4 matchedIndex]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
    unsigned int v6 = v4[18];
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    int evaluationResult = self->_evaluationResult;
    if (evaluationResult == [v4 evaluationResult])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_userProfileSandboxRequested + 1);
      unsigned int v6 = v4[18];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    int userProfileSandboxRequested = self->_userProfileSandboxRequested;
    if (userProfileSandboxRequested != [v4 userProfileSandboxRequested]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    char v4 = *(&self->_userProfileSandboxRequested + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(&self->_userProfileSandboxRequested + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char v4 = *(&self->_userProfileSandboxRequested + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_userProfileSandboxRequested + 1) & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4SampleEvaluationEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserProfileSandboxRequested
{
  *(&self->_userProfileSandboxRequested + 1) &= ~0x20u;
}

- (void)setHasUserProfileSandboxRequested:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xDF | v3;
}

- (BOOL)hasUserProfileSandboxRequested
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 5) & 1;
}

- (void)setUserProfileSandboxRequested:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 0x20u;
  self->_int userProfileSandboxRequested = a3;
}

- (void)deleteEvaluationResult
{
  *(&self->_userProfileSandboxRequested + 1) &= ~0x10u;
}

- (void)setHasEvaluationResult:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xEF | v3;
}

- (BOOL)hasEvaluationResult
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 4) & 1;
}

- (void)setEvaluationResult:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 0x10u;
  self->_int evaluationResult = a3;
}

- (void)deleteMatchedIndex
{
  *(&self->_userProfileSandboxRequested + 1) &= ~8u;
}

- (void)setHasMatchedIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xF7 | v3;
}

- (BOOL)hasMatchedIndex
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 3) & 1;
}

- (void)setMatchedIndex:(int)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 8u;
  self->_int matchedIndex = a3;
}

- (void)deleteUserStatedTaskOnTheFirstUserParse
{
  *(&self->_userProfileSandboxRequested + 1) &= ~4u;
}

- (void)setHasUserStatedTaskOnTheFirstUserParse:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xFB | v3;
}

- (BOOL)hasUserStatedTaskOnTheFirstUserParse
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 2) & 1;
}

- (void)setUserStatedTaskOnTheFirstUserParse:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 4u;
  self->_int userStatedTaskOnTheFirstUserParse = a3;
}

- (void)deleteEvaluationResultOnTheFirstUserParse
{
  *(&self->_userProfileSandboxRequested + 1) &= ~2u;
}

- (void)setHasEvaluationResultOnTheFirstUserParse:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xFD | v3;
}

- (BOOL)hasEvaluationResultOnTheFirstUserParse
{
  return (*((unsigned __int8 *)&self->_userProfileSandboxRequested + 1) >> 1) & 1;
}

- (void)setEvaluationResultOnTheFirstUserParse:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 2u;
  self->_int evaluationResultOnTheFirstUserParse = a3;
}

- (void)deleteEvaluated
{
  *(&self->_userProfileSandboxRequested + 1) &= ~1u;
}

- (void)setHasEvaluated:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) = *(&self->_userProfileSandboxRequested + 1) & 0xFE | a3;
}

- (BOOL)hasEvaluated
{
  return *(&self->_userProfileSandboxRequested + 1);
}

- (void)setEvaluated:(BOOL)a3
{
  *(&self->_userProfileSandboxRequested + 1) |= 1u;
  self->_int evaluated = a3;
}

@end