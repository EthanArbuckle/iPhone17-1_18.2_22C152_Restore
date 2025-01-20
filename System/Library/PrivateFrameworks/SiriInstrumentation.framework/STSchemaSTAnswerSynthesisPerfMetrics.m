@interface STSchemaSTAnswerSynthesisPerfMetrics
- (BOOL)hasAnswerSynthesisOverallDurationInMs;
- (BOOL)hasCollateAnswerSynthesisResultDurationInMs;
- (BOOL)hasDataFilteringDurationInMs;
- (BOOL)hasLlmInferenceDurationInMs;
- (BOOL)hasLlmPreWarmModelDurationInMs;
- (BOOL)hasPostProcessFilterDurationInMs;
- (BOOL)hasPromptGenerationDurationInMs;
- (BOOL)hasSearchEntityPreProcessDurationInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (STSchemaSTAnswerSynthesisPerfMetrics)initWithDictionary:(id)a3;
- (STSchemaSTAnswerSynthesisPerfMetrics)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)answerSynthesisOverallDurationInMs;
- (unsigned)collateAnswerSynthesisResultDurationInMs;
- (unsigned)dataFilteringDurationInMs;
- (unsigned)llmInferenceDurationInMs;
- (unsigned)llmPreWarmModelDurationInMs;
- (unsigned)postProcessFilterDurationInMs;
- (unsigned)promptGenerationDurationInMs;
- (unsigned)searchEntityPreProcessDurationInMs;
- (void)deleteAnswerSynthesisOverallDurationInMs;
- (void)deleteCollateAnswerSynthesisResultDurationInMs;
- (void)deleteDataFilteringDurationInMs;
- (void)deleteLlmInferenceDurationInMs;
- (void)deleteLlmPreWarmModelDurationInMs;
- (void)deletePostProcessFilterDurationInMs;
- (void)deletePromptGenerationDurationInMs;
- (void)deleteSearchEntityPreProcessDurationInMs;
- (void)setAnswerSynthesisOverallDurationInMs:(unsigned int)a3;
- (void)setCollateAnswerSynthesisResultDurationInMs:(unsigned int)a3;
- (void)setDataFilteringDurationInMs:(unsigned int)a3;
- (void)setHasAnswerSynthesisOverallDurationInMs:(BOOL)a3;
- (void)setHasCollateAnswerSynthesisResultDurationInMs:(BOOL)a3;
- (void)setHasDataFilteringDurationInMs:(BOOL)a3;
- (void)setHasLlmInferenceDurationInMs:(BOOL)a3;
- (void)setHasLlmPreWarmModelDurationInMs:(BOOL)a3;
- (void)setHasPostProcessFilterDurationInMs:(BOOL)a3;
- (void)setHasPromptGenerationDurationInMs:(BOOL)a3;
- (void)setHasSearchEntityPreProcessDurationInMs:(BOOL)a3;
- (void)setLlmInferenceDurationInMs:(unsigned int)a3;
- (void)setLlmPreWarmModelDurationInMs:(unsigned int)a3;
- (void)setPostProcessFilterDurationInMs:(unsigned int)a3;
- (void)setPromptGenerationDurationInMs:(unsigned int)a3;
- (void)setSearchEntityPreProcessDurationInMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTAnswerSynthesisPerfMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)collateAnswerSynthesisResultDurationInMs
{
  return self->_collateAnswerSynthesisResultDurationInMs;
}

- (unsigned)postProcessFilterDurationInMs
{
  return self->_postProcessFilterDurationInMs;
}

- (unsigned)llmInferenceDurationInMs
{
  return self->_llmInferenceDurationInMs;
}

- (unsigned)llmPreWarmModelDurationInMs
{
  return self->_llmPreWarmModelDurationInMs;
}

- (unsigned)searchEntityPreProcessDurationInMs
{
  return self->_searchEntityPreProcessDurationInMs;
}

- (unsigned)dataFilteringDurationInMs
{
  return self->_dataFilteringDurationInMs;
}

- (unsigned)promptGenerationDurationInMs
{
  return self->_promptGenerationDurationInMs;
}

- (unsigned)answerSynthesisOverallDurationInMs
{
  return self->_answerSynthesisOverallDurationInMs;
}

- (STSchemaSTAnswerSynthesisPerfMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STSchemaSTAnswerSynthesisPerfMetrics;
  v5 = [(STSchemaSTAnswerSynthesisPerfMetrics *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"answerSynthesisOverallDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setAnswerSynthesisOverallDurationInMs:](v5, "setAnswerSynthesisOverallDurationInMs:", [v6 unsignedIntValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"promptGenerationDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setPromptGenerationDurationInMs:](v5, "setPromptGenerationDurationInMs:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"dataFilteringDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setDataFilteringDurationInMs:](v5, "setDataFilteringDurationInMs:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"searchEntityPreProcessDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setSearchEntityPreProcessDurationInMs:](v5, "setSearchEntityPreProcessDurationInMs:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"llmPreWarmModelDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setLlmPreWarmModelDurationInMs:](v5, "setLlmPreWarmModelDurationInMs:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"llmInferenceDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setLlmInferenceDurationInMs:](v5, "setLlmInferenceDurationInMs:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"postProcessFilterDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setPostProcessFilterDurationInMs:](v5, "setPostProcessFilterDurationInMs:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"collateAnswerSynthesisResultDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisPerfMetrics setCollateAnswerSynthesisResultDurationInMs:](v5, "setCollateAnswerSynthesisResultDurationInMs:", [v13 unsignedIntValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (STSchemaSTAnswerSynthesisPerfMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTAnswerSynthesisPerfMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTAnswerSynthesisPerfMetrics *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics answerSynthesisOverallDurationInMs](self, "answerSynthesisOverallDurationInMs"));
    [v3 setObject:v7 forKeyedSubscript:@"answerSynthesisOverallDurationInMs"];

    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics collateAnswerSynthesisResultDurationInMs](self, "collateAnswerSynthesisResultDurationInMs"));
  [v3 setObject:v8 forKeyedSubscript:@"collateAnswerSynthesisResultDurationInMs"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics dataFilteringDurationInMs](self, "dataFilteringDurationInMs"));
  [v3 setObject:v9 forKeyedSubscript:@"dataFilteringDurationInMs"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics llmInferenceDurationInMs](self, "llmInferenceDurationInMs"));
  [v3 setObject:v10 forKeyedSubscript:@"llmInferenceDurationInMs"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics llmPreWarmModelDurationInMs](self, "llmPreWarmModelDurationInMs"));
  [v3 setObject:v11 forKeyedSubscript:@"llmPreWarmModelDurationInMs"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics postProcessFilterDurationInMs](self, "postProcessFilterDurationInMs"));
  [v3 setObject:v12 forKeyedSubscript:@"postProcessFilterDurationInMs"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics promptGenerationDurationInMs](self, "promptGenerationDurationInMs"));
  [v3 setObject:v13 forKeyedSubscript:@"promptGenerationDurationInMs"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisPerfMetrics searchEntityPreProcessDurationInMs](self, "searchEntityPreProcessDurationInMs"));
    [v3 setObject:v5 forKeyedSubscript:@"searchEntityPreProcessDurationInMs"];
  }
LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_answerSynthesisOverallDurationInMs;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_promptGenerationDurationInMs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_dataFilteringDurationInMs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_searchEntityPreProcessDurationInMs;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_llmPreWarmModelDurationInMs;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_llmInferenceDurationInMs;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_postProcessFilterDurationInMs;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_collateAnswerSynthesisResultDurationInMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int answerSynthesisOverallDurationInMs = self->_answerSynthesisOverallDurationInMs;
    if (answerSynthesisOverallDurationInMs != [v4 answerSynthesisOverallDurationInMs]) {
      goto LABEL_34;
    }
    $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v8)
  {
    unsigned int promptGenerationDurationInMs = self->_promptGenerationDurationInMs;
    if (promptGenerationDurationInMs != [v4 promptGenerationDurationInMs]) {
      goto LABEL_34;
    }
    $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_34;
  }
  if (v10)
  {
    unsigned int dataFilteringDurationInMs = self->_dataFilteringDurationInMs;
    if (dataFilteringDurationInMs != [v4 dataFilteringDurationInMs]) {
      goto LABEL_34;
    }
    $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_34;
  }
  if (v12)
  {
    unsigned int searchEntityPreProcessDurationInMs = self->_searchEntityPreProcessDurationInMs;
    if (searchEntityPreProcessDurationInMs != [v4 searchEntityPreProcessDurationInMs]) {
      goto LABEL_34;
    }
    $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_34;
  }
  if (v14)
  {
    unsigned int llmPreWarmModelDurationInMs = self->_llmPreWarmModelDurationInMs;
    if (llmPreWarmModelDurationInMs != [v4 llmPreWarmModelDurationInMs]) {
      goto LABEL_34;
    }
    $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_34;
  }
  if (v16)
  {
    unsigned int llmInferenceDurationInMs = self->_llmInferenceDurationInMs;
    if (llmInferenceDurationInMs != [v4 llmInferenceDurationInMs]) {
      goto LABEL_34;
    }
    $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_34;
  }
  if (v18)
  {
    unsigned int postProcessFilterDurationInMs = self->_postProcessFilterDurationInMs;
    if (postProcessFilterDurationInMs == [v4 postProcessFilterDurationInMs])
    {
      $B01ED89D5491BA63521B3B79301B4A11 has = self->_has;
      unsigned int v6 = v4[40];
      goto LABEL_30;
    }
LABEL_34:
    BOOL v21 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ *(_DWORD *)&has) & 0x80) != 0) {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    unsigned int collateAnswerSynthesisResultDurationInMs = self->_collateAnswerSynthesisResultDurationInMs;
    if (collateAnswerSynthesisResultDurationInMs != [v4 collateAnswerSynthesisResultDurationInMs])goto LABEL_34; {
  }
    }
  BOOL v21 = 1;
LABEL_35:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaSTAnswerSynthesisPerfMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteCollateAnswerSynthesisResultDurationInMs
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasCollateAnswerSynthesisResultDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasCollateAnswerSynthesisResultDurationInMs
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCollateAnswerSynthesisResultDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_unsigned int collateAnswerSynthesisResultDurationInMs = a3;
}

- (void)deletePostProcessFilterDurationInMs
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasPostProcessFilterDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPostProcessFilterDurationInMs
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPostProcessFilterDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unsigned int postProcessFilterDurationInMs = a3;
}

- (void)deleteLlmInferenceDurationInMs
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasLlmInferenceDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLlmInferenceDurationInMs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLlmInferenceDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int llmInferenceDurationInMs = a3;
}

- (void)deleteLlmPreWarmModelDurationInMs
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasLlmPreWarmModelDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLlmPreWarmModelDurationInMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLlmPreWarmModelDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int llmPreWarmModelDurationInMs = a3;
}

- (void)deleteSearchEntityPreProcessDurationInMs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasSearchEntityPreProcessDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSearchEntityPreProcessDurationInMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSearchEntityPreProcessDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int searchEntityPreProcessDurationInMs = a3;
}

- (void)deleteDataFilteringDurationInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasDataFilteringDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDataFilteringDurationInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDataFilteringDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int dataFilteringDurationInMs = a3;
}

- (void)deletePromptGenerationDurationInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPromptGenerationDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPromptGenerationDurationInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPromptGenerationDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int promptGenerationDurationInMs = a3;
}

- (void)deleteAnswerSynthesisOverallDurationInMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAnswerSynthesisOverallDurationInMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnswerSynthesisOverallDurationInMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAnswerSynthesisOverallDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int answerSynthesisOverallDurationInMs = a3;
}

@end