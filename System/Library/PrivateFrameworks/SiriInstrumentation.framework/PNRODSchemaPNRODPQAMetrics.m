@interface PNRODSchemaPNRODPQAMetrics
- (BOOL)hasAnswerSynthesisTime;
- (BOOL)hasLlmQUTotalTime;
- (BOOL)hasOverallTime;
- (BOOL)hasSearchToolId;
- (BOOL)hasSpotlightTotalTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODMetricDuration)answerSynthesisTime;
- (PNRODSchemaPNRODMetricDuration)llmQUTotalTime;
- (PNRODSchemaPNRODMetricDuration)overallTime;
- (PNRODSchemaPNRODMetricDuration)spotlightTotalTime;
- (PNRODSchemaPNRODPQAMetrics)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODPQAMetrics)initWithJSON:(id)a3;
- (SISchemaUUID)searchToolId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAnswerSynthesisTime;
- (void)deleteLlmQUTotalTime;
- (void)deleteOverallTime;
- (void)deleteSearchToolId;
- (void)deleteSpotlightTotalTime;
- (void)setAnswerSynthesisTime:(id)a3;
- (void)setHasAnswerSynthesisTime:(BOOL)a3;
- (void)setHasLlmQUTotalTime:(BOOL)a3;
- (void)setHasOverallTime:(BOOL)a3;
- (void)setHasSearchToolId:(BOOL)a3;
- (void)setHasSpotlightTotalTime:(BOOL)a3;
- (void)setLlmQUTotalTime:(id)a3;
- (void)setOverallTime:(id)a3;
- (void)setSearchToolId:(id)a3;
- (void)setSpotlightTotalTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODPQAMetrics

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PNRODSchemaPNRODPQAMetrics;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODPQAMetrics *)self searchToolId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODPQAMetrics *)self deleteSearchToolId];
  }
  v9 = [(PNRODSchemaPNRODPQAMetrics *)self overallTime];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODPQAMetrics *)self deleteOverallTime];
  }
  v12 = [(PNRODSchemaPNRODPQAMetrics *)self llmQUTotalTime];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODPQAMetrics *)self deleteLlmQUTotalTime];
  }
  v15 = [(PNRODSchemaPNRODPQAMetrics *)self spotlightTotalTime];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODPQAMetrics *)self deleteSpotlightTotalTime];
  }
  v18 = [(PNRODSchemaPNRODPQAMetrics *)self answerSynthesisTime];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODPQAMetrics *)self deleteAnswerSynthesisTime];
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
  objc_storeStrong((id *)&self->_answerSynthesisTime, 0);
  objc_storeStrong((id *)&self->_spotlightTotalTime, 0);
  objc_storeStrong((id *)&self->_llmQUTotalTime, 0);
  objc_storeStrong((id *)&self->_overallTime, 0);
  objc_storeStrong((id *)&self->_searchToolId, 0);
}

- (void)setHasAnswerSynthesisTime:(BOOL)a3
{
  self->_hasAnswerSynthesisTime = a3;
}

- (void)setHasSpotlightTotalTime:(BOOL)a3
{
  self->_hasSpotlightTotalTime = a3;
}

- (void)setHasLlmQUTotalTime:(BOOL)a3
{
  self->_hasLlmQUTotalTime = a3;
}

- (void)setHasOverallTime:(BOOL)a3
{
  self->_hasOverallTime = a3;
}

- (void)setHasSearchToolId:(BOOL)a3
{
  self->_hasSearchToolId = a3;
}

- (void)setAnswerSynthesisTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)answerSynthesisTime
{
  return self->_answerSynthesisTime;
}

- (void)setSpotlightTotalTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)spotlightTotalTime
{
  return self->_spotlightTotalTime;
}

- (void)setLlmQUTotalTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)llmQUTotalTime
{
  return self->_llmQUTotalTime;
}

- (void)setOverallTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)overallTime
{
  return self->_overallTime;
}

- (void)setSearchToolId:(id)a3
{
}

- (SISchemaUUID)searchToolId
{
  return self->_searchToolId;
}

- (PNRODSchemaPNRODPQAMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PNRODSchemaPNRODPQAMetrics;
  v5 = [(PNRODSchemaPNRODPQAMetrics *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"searchToolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODPQAMetrics *)v5 setSearchToolId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"overallTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODPQAMetrics *)v5 setOverallTime:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"llmQUTotalTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODPQAMetrics *)v5 setLlmQUTotalTime:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"spotlightTotalTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v12];
      [(PNRODSchemaPNRODPQAMetrics *)v5 setSpotlightTotalTime:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"answerSynthesisTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v14];
      [(PNRODSchemaPNRODPQAMetrics *)v5 setAnswerSynthesisTime:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODPQAMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODPQAMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODPQAMetrics *)self dictionaryRepresentation];
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
  if (self->_answerSynthesisTime)
  {
    id v4 = [(PNRODSchemaPNRODPQAMetrics *)self answerSynthesisTime];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"answerSynthesisTime"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"answerSynthesisTime"];
    }
  }
  if (self->_llmQUTotalTime)
  {
    uint64_t v7 = [(PNRODSchemaPNRODPQAMetrics *)self llmQUTotalTime];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"llmQUTotalTime"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"llmQUTotalTime"];
    }
  }
  if (self->_overallTime)
  {
    v10 = [(PNRODSchemaPNRODPQAMetrics *)self overallTime];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"overallTime"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"overallTime"];
    }
  }
  if (self->_searchToolId)
  {
    v13 = [(PNRODSchemaPNRODPQAMetrics *)self searchToolId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"searchToolId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"searchToolId"];
    }
  }
  if (self->_spotlightTotalTime)
  {
    v16 = [(PNRODSchemaPNRODPQAMetrics *)self spotlightTotalTime];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"spotlightTotalTime"];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"spotlightTotalTime"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_searchToolId hash];
  unint64_t v4 = [(PNRODSchemaPNRODMetricDuration *)self->_overallTime hash] ^ v3;
  unint64_t v5 = [(PNRODSchemaPNRODMetricDuration *)self->_llmQUTotalTime hash];
  unint64_t v6 = v4 ^ v5 ^ [(PNRODSchemaPNRODMetricDuration *)self->_spotlightTotalTime hash];
  return v6 ^ [(PNRODSchemaPNRODMetricDuration *)self->_answerSynthesisTime hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(PNRODSchemaPNRODPQAMetrics *)self searchToolId];
  unint64_t v6 = [v4 searchToolId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(PNRODSchemaPNRODPQAMetrics *)self searchToolId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PNRODSchemaPNRODPQAMetrics *)self searchToolId];
    v10 = [v4 searchToolId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODPQAMetrics *)self overallTime];
  unint64_t v6 = [v4 overallTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(PNRODSchemaPNRODPQAMetrics *)self overallTime];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PNRODSchemaPNRODPQAMetrics *)self overallTime];
    v15 = [v4 overallTime];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODPQAMetrics *)self llmQUTotalTime];
  unint64_t v6 = [v4 llmQUTotalTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(PNRODSchemaPNRODPQAMetrics *)self llmQUTotalTime];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(PNRODSchemaPNRODPQAMetrics *)self llmQUTotalTime];
    int v20 = [v4 llmQUTotalTime];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODPQAMetrics *)self spotlightTotalTime];
  unint64_t v6 = [v4 spotlightTotalTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(PNRODSchemaPNRODPQAMetrics *)self spotlightTotalTime];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(PNRODSchemaPNRODPQAMetrics *)self spotlightTotalTime];
    v25 = [v4 spotlightTotalTime];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODPQAMetrics *)self answerSynthesisTime];
  unint64_t v6 = [v4 answerSynthesisTime];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(PNRODSchemaPNRODPQAMetrics *)self answerSynthesisTime];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(PNRODSchemaPNRODPQAMetrics *)self answerSynthesisTime];
    v30 = [v4 answerSynthesisTime];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(PNRODSchemaPNRODPQAMetrics *)self searchToolId];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODPQAMetrics *)self searchToolId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PNRODSchemaPNRODPQAMetrics *)self overallTime];

  if (v6)
  {
    uint64_t v7 = [(PNRODSchemaPNRODPQAMetrics *)self overallTime];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(PNRODSchemaPNRODPQAMetrics *)self llmQUTotalTime];

  if (v8)
  {
    v9 = [(PNRODSchemaPNRODPQAMetrics *)self llmQUTotalTime];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PNRODSchemaPNRODPQAMetrics *)self spotlightTotalTime];

  if (v10)
  {
    int v11 = [(PNRODSchemaPNRODPQAMetrics *)self spotlightTotalTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(PNRODSchemaPNRODPQAMetrics *)self answerSynthesisTime];

  if (v12)
  {
    v13 = [(PNRODSchemaPNRODPQAMetrics *)self answerSynthesisTime];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODPQAMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnswerSynthesisTime
{
}

- (BOOL)hasAnswerSynthesisTime
{
  return self->_answerSynthesisTime != 0;
}

- (void)deleteSpotlightTotalTime
{
}

- (BOOL)hasSpotlightTotalTime
{
  return self->_spotlightTotalTime != 0;
}

- (void)deleteLlmQUTotalTime
{
}

- (BOOL)hasLlmQUTotalTime
{
  return self->_llmQUTotalTime != 0;
}

- (void)deleteOverallTime
{
}

- (BOOL)hasOverallTime
{
  return self->_overallTime != 0;
}

- (void)deleteSearchToolId
{
}

- (BOOL)hasSearchToolId
{
  return self->_searchToolId != 0;
}

@end