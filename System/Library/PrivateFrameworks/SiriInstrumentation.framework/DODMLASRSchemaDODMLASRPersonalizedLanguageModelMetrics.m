@interface DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics
- (BOOL)hasEvaluationMetrics;
- (BOOL)hasModelMetrics;
- (BOOL)hasTranscriptionMetrics;
- (BOOL)hasUserLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASREvaluationMetrics)evaluationMetrics;
- (DODMLASRSchemaDODMLASRModelMetrics)modelMetrics;
- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)initWithJSON:(id)a3;
- (DODMLASRSchemaDODMLASRTranscriptionMetrics)transcriptionMetrics;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)userLocale;
- (unint64_t)hash;
- (void)deleteEvaluationMetrics;
- (void)deleteModelMetrics;
- (void)deleteTranscriptionMetrics;
- (void)deleteUserLocale;
- (void)setEvaluationMetrics:(id)a3;
- (void)setHasEvaluationMetrics:(BOOL)a3;
- (void)setHasModelMetrics:(BOOL)a3;
- (void)setHasTranscriptionMetrics:(BOOL)a3;
- (void)setHasUserLocale:(BOOL)a3;
- (void)setModelMetrics:(id)a3;
- (void)setTranscriptionMetrics:(id)a3;
- (void)setUserLocale:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self transcriptionMetrics];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self deleteTranscriptionMetrics];
  }
  v9 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self modelMetrics];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self deleteModelMetrics];
  }
  v12 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self evaluationMetrics];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self deleteEvaluationMetrics];
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
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
  objc_storeStrong((id *)&self->_modelMetrics, 0);
  objc_storeStrong((id *)&self->_transcriptionMetrics, 0);
}

- (void)setHasEvaluationMetrics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasModelMetrics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTranscriptionMetrics:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setEvaluationMetrics:(id)a3
{
}

- (DODMLASRSchemaDODMLASREvaluationMetrics)evaluationMetrics
{
  return self->_evaluationMetrics;
}

- (void)setModelMetrics:(id)a3
{
}

- (DODMLASRSchemaDODMLASRModelMetrics)modelMetrics
{
  return self->_modelMetrics;
}

- (void)setTranscriptionMetrics:(id)a3
{
}

- (DODMLASRSchemaDODMLASRTranscriptionMetrics)transcriptionMetrics
{
  return self->_transcriptionMetrics;
}

- (int)userLocale
{
  return self->_userLocale;
}

- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics;
  v5 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"userLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics setUserLocale:](v5, "setUserLocale:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"transcriptionMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[DODMLASRSchemaDODMLASRTranscriptionMetrics alloc] initWithDictionary:v7];
      [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)v5 setTranscriptionMetrics:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"modelMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[DODMLASRSchemaDODMLASRModelMetrics alloc] initWithDictionary:v9];
      [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)v5 setModelMetrics:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"evaluationMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[DODMLASRSchemaDODMLASREvaluationMetrics alloc] initWithDictionary:v11];
      [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)v5 setEvaluationMetrics:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self dictionaryRepresentation];
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
  if (self->_evaluationMetrics)
  {
    id v4 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self evaluationMetrics];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"evaluationMetrics"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"evaluationMetrics"];
    }
  }
  if (self->_modelMetrics)
  {
    uint64_t v7 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self modelMetrics];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"modelMetrics"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"modelMetrics"];
    }
  }
  if (self->_transcriptionMetrics)
  {
    v10 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self transcriptionMetrics];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"transcriptionMetrics"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"transcriptionMetrics"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v13 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self userLocale] - 1;
    if (v13 > 0x3D) {
      int v14 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      int v14 = off_1E5EAE3E0[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"userLocale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_userLocale;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(DODMLASRSchemaDODMLASRTranscriptionMetrics *)self->_transcriptionMetrics hash] ^ v3;
  unint64_t v5 = [(DODMLASRSchemaDODMLASRModelMetrics *)self->_modelMetrics hash];
  return v4 ^ v5 ^ [(DODMLASRSchemaDODMLASREvaluationMetrics *)self->_evaluationMetrics hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int userLocale = self->_userLocale;
    if (userLocale != [v4 userLocale]) {
      goto LABEL_20;
    }
  }
  v6 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self transcriptionMetrics];
  uint64_t v7 = [v4 transcriptionMetrics];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self transcriptionMetrics];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self transcriptionMetrics];
    int v11 = [v4 transcriptionMetrics];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self modelMetrics];
  uint64_t v7 = [v4 modelMetrics];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self modelMetrics];
  if (v13)
  {
    int v14 = (void *)v13;
    objc_super v15 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self modelMetrics];
    objc_super v16 = [v4 modelMetrics];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v6 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self evaluationMetrics];
  uint64_t v7 = [v4 evaluationMetrics];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self evaluationMetrics];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self evaluationMetrics];
    v21 = [v4 evaluationMetrics];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self transcriptionMetrics];

  if (v4)
  {
    unint64_t v5 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self transcriptionMetrics];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self modelMetrics];

  if (v6)
  {
    uint64_t v7 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self modelMetrics];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self evaluationMetrics];

  v9 = v11;
  if (v8)
  {
    v10 = [(DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetrics *)self evaluationMetrics];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRPersonalizedLanguageModelMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteEvaluationMetrics
{
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (void)deleteModelMetrics
{
}

- (BOOL)hasModelMetrics
{
  return self->_modelMetrics != 0;
}

- (void)deleteTranscriptionMetrics
{
}

- (BOOL)hasTranscriptionMetrics
{
  return self->_transcriptionMetrics != 0;
}

- (void)deleteUserLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUserLocale:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserLocale
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int userLocale = a3;
}

@end