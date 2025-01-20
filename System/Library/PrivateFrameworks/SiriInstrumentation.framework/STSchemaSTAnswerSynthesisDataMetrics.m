@interface STSchemaSTAnswerSynthesisDataMetrics
- (BOOL)hasNumAnswers;
- (BOOL)hasNumLLMCalls;
- (BOOL)hasNumQueriesTriggered;
- (BOOL)hasPromptLength;
- (BOOL)hasResponseLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (STSchemaSTAnswerSynthesisDataMetrics)initWithDictionary:(id)a3;
- (STSchemaSTAnswerSynthesisDataMetrics)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numAnswers;
- (unsigned)numLLMCalls;
- (unsigned)numQueriesTriggered;
- (unsigned)promptLength;
- (unsigned)responseLength;
- (void)deleteNumAnswers;
- (void)deleteNumLLMCalls;
- (void)deleteNumQueriesTriggered;
- (void)deletePromptLength;
- (void)deleteResponseLength;
- (void)setHasNumAnswers:(BOOL)a3;
- (void)setHasNumLLMCalls:(BOOL)a3;
- (void)setHasNumQueriesTriggered:(BOOL)a3;
- (void)setHasPromptLength:(BOOL)a3;
- (void)setHasResponseLength:(BOOL)a3;
- (void)setNumAnswers:(unsigned int)a3;
- (void)setNumLLMCalls:(unsigned int)a3;
- (void)setNumQueriesTriggered:(unsigned int)a3;
- (void)setPromptLength:(unsigned int)a3;
- (void)setResponseLength:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation STSchemaSTAnswerSynthesisDataMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numQueriesTriggered
{
  return self->_numQueriesTriggered;
}

- (unsigned)numAnswers
{
  return self->_numAnswers;
}

- (unsigned)responseLength
{
  return self->_responseLength;
}

- (unsigned)promptLength
{
  return self->_promptLength;
}

- (unsigned)numLLMCalls
{
  return self->_numLLMCalls;
}

- (STSchemaSTAnswerSynthesisDataMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSchemaSTAnswerSynthesisDataMetrics;
  v5 = [(STSchemaSTAnswerSynthesisDataMetrics *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numLLMCalls"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisDataMetrics setNumLLMCalls:](v5, "setNumLLMCalls:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"promptLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisDataMetrics setPromptLength:](v5, "setPromptLength:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"responseLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisDataMetrics setResponseLength:](v5, "setResponseLength:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numAnswers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisDataMetrics setNumAnswers:](v5, "setNumAnswers:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numQueriesTriggered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[STSchemaSTAnswerSynthesisDataMetrics setNumQueriesTriggered:](v5, "setNumQueriesTriggered:", [v10 unsignedIntValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (STSchemaSTAnswerSynthesisDataMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(STSchemaSTAnswerSynthesisDataMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(STSchemaSTAnswerSynthesisDataMetrics *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisDataMetrics numAnswers](self, "numAnswers"));
    [v3 setObject:v7 forKeyedSubscript:@"numAnswers"];

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
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisDataMetrics numLLMCalls](self, "numLLMCalls"));
  [v3 setObject:v8 forKeyedSubscript:@"numLLMCalls"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisDataMetrics numQueriesTriggered](self, "numQueriesTriggered"));
  [v3 setObject:v9 forKeyedSubscript:@"numQueriesTriggered"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisDataMetrics promptLength](self, "promptLength"));
  [v3 setObject:v10 forKeyedSubscript:@"promptLength"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[STSchemaSTAnswerSynthesisDataMetrics responseLength](self, "responseLength"));
    [v3 setObject:v5 forKeyedSubscript:@"responseLength"];
  }
LABEL_7:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_numLLMCalls;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_promptLength;
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
    uint64_t v4 = 2654435761 * self->_responseLength;
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
  uint64_t v5 = 2654435761 * self->_numAnswers;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_numQueriesTriggered;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $9FD50DF90BA1FF30FB97B0FDC676B0B1 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numLLMCalls = self->_numLLMCalls;
    if (numLLMCalls != [v4 numLLMCalls]) {
      goto LABEL_22;
    }
    $9FD50DF90BA1FF30FB97B0FDC676B0B1 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    unsigned int promptLength = self->_promptLength;
    if (promptLength != [v4 promptLength]) {
      goto LABEL_22;
    }
    $9FD50DF90BA1FF30FB97B0FDC676B0B1 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    unsigned int responseLength = self->_responseLength;
    if (responseLength != [v4 responseLength]) {
      goto LABEL_22;
    }
    $9FD50DF90BA1FF30FB97B0FDC676B0B1 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    unsigned int numAnswers = self->_numAnswers;
    if (numAnswers == [v4 numAnswers])
    {
      $9FD50DF90BA1FF30FB97B0FDC676B0B1 has = self->_has;
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
    unsigned int numQueriesTriggered = self->_numQueriesTriggered;
    if (numQueriesTriggered != [v4 numQueriesTriggered]) {
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
  return STSchemaSTAnswerSynthesisDataMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumQueriesTriggered
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasNumQueriesTriggered:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumQueriesTriggered
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumQueriesTriggered:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int numQueriesTriggered = a3;
}

- (void)deleteNumAnswers
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNumAnswers:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumAnswers
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumAnswers:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int numAnswers = a3;
}

- (void)deleteResponseLength
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasResponseLength:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseLength
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setResponseLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int responseLength = a3;
}

- (void)deletePromptLength
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPromptLength:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPromptLength
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPromptLength:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int promptLength = a3;
}

- (void)deleteNumLLMCalls
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumLLMCalls:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumLLMCalls
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumLLMCalls:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numLLMCalls = a3;
}

@end