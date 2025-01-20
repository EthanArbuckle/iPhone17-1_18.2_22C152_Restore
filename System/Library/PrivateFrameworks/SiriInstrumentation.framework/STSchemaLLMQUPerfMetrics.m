@interface STSchemaLLMQUPerfMetrics
- (BOOL)hasLlmquInferenceDurationInMs;
- (BOOL)hasLlmquOverallDurationInMs;
- (BOOL)hasLlmquPostProcessFilterDurationInMs;
- (BOOL)hasLlmquPreWarmModelDurationInMs;
- (BOOL)hasLlmquPromptGenerationDurationInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (STSchemaLLMQUPerfMetrics)initWithDictionary:(id)a3;
- (STSchemaLLMQUPerfMetrics)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)llmquInferenceDurationInMs;
- (unsigned)llmquOverallDurationInMs;
- (unsigned)llmquPostProcessFilterDurationInMs;
- (unsigned)llmquPreWarmModelDurationInMs;
- (unsigned)llmquPromptGenerationDurationInMs;
- (void)deleteLlmquInferenceDurationInMs;
- (void)deleteLlmquOverallDurationInMs;
- (void)deleteLlmquPostProcessFilterDurationInMs;
- (void)deleteLlmquPreWarmModelDurationInMs;
- (void)deleteLlmquPromptGenerationDurationInMs;
- (void)setHasLlmquInferenceDurationInMs:(BOOL)a3;
- (void)setHasLlmquOverallDurationInMs:(BOOL)a3;
- (void)setHasLlmquPostProcessFilterDurationInMs:(BOOL)a3;
- (void)setHasLlmquPreWarmModelDurationInMs:(BOOL)a3;
- (void)setHasLlmquPromptGenerationDurationInMs:(BOOL)a3;
- (void)setLlmquInferenceDurationInMs:(unsigned int)a3;
- (void)setLlmquOverallDurationInMs:(unsigned int)a3;
- (void)setLlmquPostProcessFilterDurationInMs:(unsigned int)a3;
- (void)setLlmquPreWarmModelDurationInMs:(unsigned int)a3;
- (void)setLlmquPromptGenerationDurationInMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaLLMQUPerfMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)llmquPostProcessFilterDurationInMs
{
  return self->_llmquPostProcessFilterDurationInMs;
}

- (unsigned)llmquInferenceDurationInMs
{
  return self->_llmquInferenceDurationInMs;
}

- (unsigned)llmquPreWarmModelDurationInMs
{
  return self->_llmquPreWarmModelDurationInMs;
}

- (unsigned)llmquPromptGenerationDurationInMs
{
  return self->_llmquPromptGenerationDurationInMs;
}

- (unsigned)llmquOverallDurationInMs
{
  return self->_llmquOverallDurationInMs;
}

- (STSchemaLLMQUPerfMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSchemaLLMQUPerfMetrics;
  v5 = [(STSchemaLLMQUPerfMetrics *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"llmquOverallDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaLLMQUPerfMetrics setLlmquOverallDurationInMs:](v5, "setLlmquOverallDurationInMs:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"llmquPromptGenerationDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaLLMQUPerfMetrics setLlmquPromptGenerationDurationInMs:](v5, "setLlmquPromptGenerationDurationInMs:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"llmquPreWarmModelDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaLLMQUPerfMetrics setLlmquPreWarmModelDurationInMs:](v5, "setLlmquPreWarmModelDurationInMs:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"llmquInferenceDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaLLMQUPerfMetrics setLlmquInferenceDurationInMs:](v5, "setLlmquInferenceDurationInMs:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"llmquPostProcessFilterDurationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaLLMQUPerfMetrics setLlmquPostProcessFilterDurationInMs:](v5, "setLlmquPostProcessFilterDurationInMs:", [v10 unsignedIntValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (STSchemaLLMQUPerfMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaLLMQUPerfMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaLLMQUPerfMetrics *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaLLMQUPerfMetrics llmquInferenceDurationInMs](self, "llmquInferenceDurationInMs"));
    [v3 setObject:v7 forKeyedSubscript:@"llmquInferenceDurationInMs"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaLLMQUPerfMetrics llmquOverallDurationInMs](self, "llmquOverallDurationInMs"));
  [v3 setObject:v8 forKeyedSubscript:@"llmquOverallDurationInMs"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaLLMQUPerfMetrics llmquPostProcessFilterDurationInMs](self, "llmquPostProcessFilterDurationInMs"));
  [v3 setObject:v9 forKeyedSubscript:@"llmquPostProcessFilterDurationInMs"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaLLMQUPerfMetrics llmquPreWarmModelDurationInMs](self, "llmquPreWarmModelDurationInMs"));
  [v3 setObject:v10 forKeyedSubscript:@"llmquPreWarmModelDurationInMs"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaLLMQUPerfMetrics llmquPromptGenerationDurationInMs](self, "llmquPromptGenerationDurationInMs"));
    [v3 setObject:v5 forKeyedSubscript:@"llmquPromptGenerationDurationInMs"];
  }
LABEL_7:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_llmquOverallDurationInMs;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_llmquPromptGenerationDurationInMs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
    uint64_t v4 = 2654435761 * self->_llmquPreWarmModelDurationInMs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_llmquInferenceDurationInMs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_llmquPostProcessFilterDurationInMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $6627D60250CC93B1143AFA53A1C304DF has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int llmquOverallDurationInMs = self->_llmquOverallDurationInMs;
    if (llmquOverallDurationInMs != [v4 llmquOverallDurationInMs]) {
      goto LABEL_22;
    }
    $6627D60250CC93B1143AFA53A1C304DF has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    unsigned int llmquPromptGenerationDurationInMs = self->_llmquPromptGenerationDurationInMs;
    if (llmquPromptGenerationDurationInMs != [v4 llmquPromptGenerationDurationInMs]) {
      goto LABEL_22;
    }
    $6627D60250CC93B1143AFA53A1C304DF has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    unsigned int llmquPreWarmModelDurationInMs = self->_llmquPreWarmModelDurationInMs;
    if (llmquPreWarmModelDurationInMs != [v4 llmquPreWarmModelDurationInMs]) {
      goto LABEL_22;
    }
    $6627D60250CC93B1143AFA53A1C304DF has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    unsigned int llmquInferenceDurationInMs = self->_llmquInferenceDurationInMs;
    if (llmquInferenceDurationInMs == [v4 llmquInferenceDurationInMs])
    {
      $6627D60250CC93B1143AFA53A1C304DF has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    unsigned int llmquPostProcessFilterDurationInMs = self->_llmquPostProcessFilterDurationInMs;
    if (llmquPostProcessFilterDurationInMs != [v4 llmquPostProcessFilterDurationInMs]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
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
      goto LABEL_12;
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
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return STSchemaLLMQUPerfMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteLlmquPostProcessFilterDurationInMs
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasLlmquPostProcessFilterDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLlmquPostProcessFilterDurationInMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLlmquPostProcessFilterDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int llmquPostProcessFilterDurationInMs = a3;
}

- (void)deleteLlmquInferenceDurationInMs
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasLlmquInferenceDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLlmquInferenceDurationInMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLlmquInferenceDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int llmquInferenceDurationInMs = a3;
}

- (void)deleteLlmquPreWarmModelDurationInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasLlmquPreWarmModelDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLlmquPreWarmModelDurationInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLlmquPreWarmModelDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int llmquPreWarmModelDurationInMs = a3;
}

- (void)deleteLlmquPromptGenerationDurationInMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLlmquPromptGenerationDurationInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLlmquPromptGenerationDurationInMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLlmquPromptGenerationDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int llmquPromptGenerationDurationInMs = a3;
}

- (void)deleteLlmquOverallDurationInMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLlmquOverallDurationInMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLlmquOverallDurationInMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLlmquOverallDurationInMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int llmquOverallDurationInMs = a3;
}

@end