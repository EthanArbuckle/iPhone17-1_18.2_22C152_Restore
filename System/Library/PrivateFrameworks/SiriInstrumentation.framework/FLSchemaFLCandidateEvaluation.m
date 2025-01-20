@interface FLSchemaFLCandidateEvaluation
- (BOOL)hasCandidateCategory;
- (BOOL)hasCandidateIdentifier;
- (BOOL)hasOutcome;
- (BOOL)hasResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLCandidateCategory)candidateCategory;
- (FLSchemaFLCandidateEvaluation)initWithDictionary:(id)a3;
- (FLSchemaFLCandidateEvaluation)initWithJSON:(id)a3;
- (FLSchemaFLCandidateIdentifier)candidateIdentifier;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)outcome;
- (int)resolution;
- (unint64_t)hash;
- (void)deleteCandidateCategory;
- (void)deleteCandidateIdentifier;
- (void)deleteOutcome;
- (void)deleteResolution;
- (void)setCandidateCategory:(id)a3;
- (void)setCandidateIdentifier:(id)a3;
- (void)setHasCandidateCategory:(BOOL)a3;
- (void)setHasCandidateIdentifier:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setHasResolution:(BOOL)a3;
- (void)setOutcome:(int)a3;
- (void)setResolution:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLCandidateEvaluation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLSchemaFLCandidateEvaluation;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(FLSchemaFLCandidateEvaluation *)self candidateCategory];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLSchemaFLCandidateEvaluation *)self deleteCandidateCategory];
  }
  v9 = [(FLSchemaFLCandidateEvaluation *)self candidateIdentifier];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLSchemaFLCandidateEvaluation *)self deleteCandidateIdentifier];
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
  objc_storeStrong((id *)&self->_candidateIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateCategory, 0);
}

- (void)setHasCandidateIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCandidateCategory:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)outcome
{
  return self->_outcome;
}

- (int)resolution
{
  return self->_resolution;
}

- (void)setCandidateIdentifier:(id)a3
{
}

- (FLSchemaFLCandidateIdentifier)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (void)setCandidateCategory:(id)a3
{
}

- (FLSchemaFLCandidateCategory)candidateCategory
{
  return self->_candidateCategory;
}

- (FLSchemaFLCandidateEvaluation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FLSchemaFLCandidateEvaluation;
  v5 = [(FLSchemaFLCandidateEvaluation *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"candidateCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLSchemaFLCandidateCategory alloc] initWithDictionary:v6];
      [(FLSchemaFLCandidateEvaluation *)v5 setCandidateCategory:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"candidateIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLSchemaFLCandidateIdentifier alloc] initWithDictionary:v8];
      [(FLSchemaFLCandidateEvaluation *)v5 setCandidateIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"resolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLCandidateEvaluation setResolution:](v5, "setResolution:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"outcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLCandidateEvaluation setOutcome:](v5, "setOutcome:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (FLSchemaFLCandidateEvaluation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLCandidateEvaluation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLCandidateEvaluation *)self dictionaryRepresentation];
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
  if (self->_candidateCategory)
  {
    id v4 = [(FLSchemaFLCandidateEvaluation *)self candidateCategory];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"candidateCategory"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"candidateCategory"];
    }
  }
  if (self->_candidateIdentifier)
  {
    uint64_t v7 = [(FLSchemaFLCandidateEvaluation *)self candidateIdentifier];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"candidateIdentifier"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"candidateIdentifier"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v11 = [(FLSchemaFLCandidateEvaluation *)self outcome] - 1;
    if (v11 > 0xA) {
      v12 = @"FLCANDIDATEOUTCOME_UNKNOWN";
    }
    else {
      v12 = off_1E5EC0408[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"outcome"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v13 = [(FLSchemaFLCandidateEvaluation *)self resolution] - 1;
    if (v13 > 3) {
      objc_super v14 = @"FLCANDIDATERESOLUTION_UNKNOWN";
    }
    else {
      objc_super v14 = off_1E5EC0460[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"resolution"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLSchemaFLCandidateCategory *)self->_candidateCategory hash];
  unint64_t v4 = [(FLSchemaFLCandidateIdentifier *)self->_candidateIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_resolution;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_outcome;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(FLSchemaFLCandidateEvaluation *)self candidateCategory];
  uint64_t v6 = [v4 candidateCategory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(FLSchemaFLCandidateEvaluation *)self candidateCategory];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(FLSchemaFLCandidateEvaluation *)self candidateCategory];
    v10 = [v4 candidateCategory];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLSchemaFLCandidateEvaluation *)self candidateIdentifier];
  uint64_t v6 = [v4 candidateIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(FLSchemaFLCandidateEvaluation *)self candidateIdentifier];
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    objc_super v14 = [(FLSchemaFLCandidateEvaluation *)self candidateIdentifier];
    v15 = [v4 candidateIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $5E02A68FF380693B734741EFEB1D4439 has = self->_has;
  unsigned int v20 = v4[32];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int resolution = self->_resolution;
      if (resolution != [v4 resolution]) {
        goto LABEL_12;
      }
      $5E02A68FF380693B734741EFEB1D4439 has = self->_has;
      unsigned int v20 = v4[32];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22 || (int outcome = self->_outcome, outcome == [v4 outcome]))
      {
        BOOL v17 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [(FLSchemaFLCandidateEvaluation *)self candidateCategory];

  if (v4)
  {
    uint64_t v5 = [(FLSchemaFLCandidateEvaluation *)self candidateCategory];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(FLSchemaFLCandidateEvaluation *)self candidateIdentifier];

  if (v6)
  {
    uint64_t v7 = [(FLSchemaFLCandidateEvaluation *)self candidateIdentifier];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLCandidateEvaluationReadFrom(self, (uint64_t)a3);
}

- (void)deleteOutcome
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int outcome = a3;
}

- (void)deleteResolution
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResolution:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResolution
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResolution:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int resolution = a3;
}

- (void)deleteCandidateIdentifier
{
}

- (BOOL)hasCandidateIdentifier
{
  return self->_candidateIdentifier != 0;
}

- (void)deleteCandidateCategory
{
}

- (BOOL)hasCandidateCategory
{
  return self->_candidateCategory != 0;
}

@end