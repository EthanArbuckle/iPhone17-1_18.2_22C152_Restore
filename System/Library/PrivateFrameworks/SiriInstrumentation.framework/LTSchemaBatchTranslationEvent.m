@interface LTSchemaBatchTranslationEvent
- (BOOL)hasBatchSeqNo;
- (BOOL)hasError;
- (BOOL)hasNumParagraphFailures;
- (BOOL)hasNumberOfParagraphs;
- (BOOL)hasRequestID;
- (BOOL)hasResponseTimeMs;
- (BOOL)hasSessionID;
- (BOOL)hasSystemLocale;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaBatchTranslationEvent)initWithDictionary:(id)a3;
- (LTSchemaBatchTranslationEvent)initWithJSON:(id)a3;
- (LTSchemaError)error;
- (LTSchemaTask)task;
- (NSData)jsonData;
- (NSString)requestID;
- (NSString)sessionID;
- (NSString)systemLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)batchSeqNo;
- (unsigned)numParagraphFailures;
- (unsigned)numberOfParagraphs;
- (unsigned)responseTimeMs;
- (void)deleteBatchSeqNo;
- (void)deleteError;
- (void)deleteNumParagraphFailures;
- (void)deleteNumberOfParagraphs;
- (void)deleteRequestID;
- (void)deleteResponseTimeMs;
- (void)deleteSessionID;
- (void)deleteSystemLocale;
- (void)deleteTask;
- (void)setBatchSeqNo:(unsigned int)a3;
- (void)setError:(id)a3;
- (void)setHasBatchSeqNo:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasNumParagraphFailures:(BOOL)a3;
- (void)setHasNumberOfParagraphs:(BOOL)a3;
- (void)setHasRequestID:(BOOL)a3;
- (void)setHasResponseTimeMs:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasSystemLocale:(BOOL)a3;
- (void)setHasTask:(BOOL)a3;
- (void)setNumParagraphFailures:(unsigned int)a3;
- (void)setNumberOfParagraphs:(unsigned int)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseTimeMs:(unsigned int)a3;
- (void)setSessionID:(id)a3;
- (void)setSystemLocale:(id)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaBatchTranslationEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTSchemaBatchTranslationEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(LTSchemaBatchTranslationEvent *)self task];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LTSchemaBatchTranslationEvent *)self deleteTask];
  }
  v9 = [(LTSchemaBatchTranslationEvent *)self error];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(LTSchemaBatchTranslationEvent *)self deleteError];
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (void)setHasError:(BOOL)a3
{
  self->_hasSessionID = a3;
}

- (void)setHasSystemLocale:(BOOL)a3
{
  self->_hasTask = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTask:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setError:(id)a3
{
}

- (LTSchemaError)error
{
  return self->_error;
}

- (unsigned)numParagraphFailures
{
  return self->_numParagraphFailures;
}

- (unsigned)responseTimeMs
{
  return self->_responseTimeMs;
}

- (unsigned)numberOfParagraphs
{
  return self->_numberOfParagraphs;
}

- (unsigned)batchSeqNo
{
  return self->_batchSeqNo;
}

- (void)setSystemLocale:(id)a3
{
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setTask:(id)a3
{
}

- (LTSchemaTask)task
{
  return self->_task;
}

- (LTSchemaBatchTranslationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)LTSchemaBatchTranslationEvent;
  v5 = [(LTSchemaBatchTranslationEvent *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"task"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[LTSchemaTask alloc] initWithDictionary:v6];
      [(LTSchemaBatchTranslationEvent *)v5 setTask:v7];
    }
    v23 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"sessionID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(LTSchemaBatchTranslationEvent *)v5 setSessionID:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"requestID", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(LTSchemaBatchTranslationEvent *)v5 setRequestID:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"systemLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(LTSchemaBatchTranslationEvent *)v5 setSystemLocale:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"batchSeqNo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaBatchTranslationEvent setBatchSeqNo:](v5, "setBatchSeqNo:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"numberOfParagraphs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaBatchTranslationEvent setNumberOfParagraphs:](v5, "setNumberOfParagraphs:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"responseTimeMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaBatchTranslationEvent setResponseTimeMs:](v5, "setResponseTimeMs:", [v16 unsignedIntValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"numParagraphFailures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaBatchTranslationEvent setNumParagraphFailures:](v5, "setNumParagraphFailures:", [v17 unsignedIntValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[LTSchemaError alloc] initWithDictionary:v18];
      [(LTSchemaBatchTranslationEvent *)v5 setError:v19];
    }
    v20 = v5;
  }
  return v5;
}

- (LTSchemaBatchTranslationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaBatchTranslationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaBatchTranslationEvent *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent batchSeqNo](self, "batchSeqNo"));
    [v3 setObject:v4 forKeyedSubscript:@"batchSeqNo"];
  }
  if (self->_error)
  {
    v5 = [(LTSchemaBatchTranslationEvent *)self error];
    uint64_t v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"error"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"error"];
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent numParagraphFailures](self, "numParagraphFailures"));
    [v3 setObject:v9 forKeyedSubscript:@"numParagraphFailures"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent numberOfParagraphs](self, "numberOfParagraphs"));
    [v3 setObject:v10 forKeyedSubscript:@"numberOfParagraphs"];
  }
  if (self->_requestID)
  {
    int v11 = [(LTSchemaBatchTranslationEvent *)self requestID];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"requestID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaBatchTranslationEvent responseTimeMs](self, "responseTimeMs"));
    [v3 setObject:v13 forKeyedSubscript:@"responseTimeMs"];
  }
  if (self->_sessionID)
  {
    v14 = [(LTSchemaBatchTranslationEvent *)self sessionID];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"sessionID"];
  }
  if (self->_systemLocale)
  {
    v16 = [(LTSchemaBatchTranslationEvent *)self systemLocale];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"systemLocale"];
  }
  if (self->_task)
  {
    v18 = [(LTSchemaBatchTranslationEvent *)self task];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"task"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"task"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(LTSchemaTask *)self->_task hash];
  NSUInteger v4 = [(NSString *)self->_sessionID hash];
  NSUInteger v5 = [(NSString *)self->_requestID hash];
  NSUInteger v6 = [(NSString *)self->_systemLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_batchSeqNo;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_numberOfParagraphs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v9 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(LTSchemaError *)self->_error hash];
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_responseTimeMs;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v10 = 2654435761 * self->_numParagraphFailures;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(LTSchemaError *)self->_error hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  NSUInteger v5 = [(LTSchemaBatchTranslationEvent *)self task];
  NSUInteger v6 = [v4 task];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(LTSchemaBatchTranslationEvent *)self task];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(LTSchemaBatchTranslationEvent *)self task];
    uint64_t v10 = [v4 task];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaBatchTranslationEvent *)self sessionID];
  NSUInteger v6 = [v4 sessionID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(LTSchemaBatchTranslationEvent *)self sessionID];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(LTSchemaBatchTranslationEvent *)self sessionID];
    v15 = [v4 sessionID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaBatchTranslationEvent *)self requestID];
  NSUInteger v6 = [v4 requestID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(LTSchemaBatchTranslationEvent *)self requestID];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(LTSchemaBatchTranslationEvent *)self requestID];
    v20 = [v4 requestID];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(LTSchemaBatchTranslationEvent *)self systemLocale];
  NSUInteger v6 = [v4 systemLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v22 = [(LTSchemaBatchTranslationEvent *)self systemLocale];
  if (v22)
  {
    v23 = (void *)v22;
    objc_super v24 = [(LTSchemaBatchTranslationEvent *)self systemLocale];
    v25 = [v4 systemLocale];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  $613A9DD8B06BD4489BDD94EA1AE706A4 has = self->_has;
  unsigned int v28 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v28 & 1)) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int batchSeqNo = self->_batchSeqNo;
    if (batchSeqNo != [v4 batchSeqNo]) {
      goto LABEL_42;
    }
    $613A9DD8B06BD4489BDD94EA1AE706A4 has = self->_has;
    unsigned int v28 = v4[64];
  }
  int v30 = (*(unsigned int *)&has >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1)) {
    goto LABEL_42;
  }
  if (v30)
  {
    unsigned int numberOfParagraphs = self->_numberOfParagraphs;
    if (numberOfParagraphs != [v4 numberOfParagraphs]) {
      goto LABEL_42;
    }
    $613A9DD8B06BD4489BDD94EA1AE706A4 has = self->_has;
    unsigned int v28 = v4[64];
  }
  int v32 = (*(unsigned int *)&has >> 2) & 1;
  if (v32 != ((v28 >> 2) & 1)) {
    goto LABEL_42;
  }
  if (v32)
  {
    unsigned int responseTimeMs = self->_responseTimeMs;
    if (responseTimeMs != [v4 responseTimeMs]) {
      goto LABEL_42;
    }
    $613A9DD8B06BD4489BDD94EA1AE706A4 has = self->_has;
    unsigned int v28 = v4[64];
  }
  int v34 = (*(unsigned int *)&has >> 3) & 1;
  if (v34 != ((v28 >> 3) & 1)) {
    goto LABEL_42;
  }
  if (v34)
  {
    unsigned int numParagraphFailures = self->_numParagraphFailures;
    if (numParagraphFailures != [v4 numParagraphFailures]) {
      goto LABEL_42;
    }
  }
  NSUInteger v5 = [(LTSchemaBatchTranslationEvent *)self error];
  NSUInteger v6 = [v4 error];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v36 = [(LTSchemaBatchTranslationEvent *)self error];
  if (!v36)
  {

LABEL_45:
    BOOL v41 = 1;
    goto LABEL_43;
  }
  v37 = (void *)v36;
  v38 = [(LTSchemaBatchTranslationEvent *)self error];
  v39 = [v4 error];
  char v40 = [v38 isEqual:v39];

  if (v40) {
    goto LABEL_45;
  }
LABEL_42:
  BOOL v41 = 0;
LABEL_43:

  return v41;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  NSUInteger v4 = [(LTSchemaBatchTranslationEvent *)self task];

  if (v4)
  {
    NSUInteger v5 = [(LTSchemaBatchTranslationEvent *)self task];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v6 = [(LTSchemaBatchTranslationEvent *)self sessionID];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(LTSchemaBatchTranslationEvent *)self requestID];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  uint64_t v8 = [(LTSchemaBatchTranslationEvent *)self systemLocale];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
  uint64_t v10 = [(LTSchemaBatchTranslationEvent *)self error];

  int v11 = v13;
  if (v10)
  {
    uint64_t v12 = [(LTSchemaBatchTranslationEvent *)self error];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaBatchTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteError
{
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteNumParagraphFailures
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNumParagraphFailures:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumParagraphFailures
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumParagraphFailures:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int numParagraphFailures = a3;
}

- (void)deleteResponseTimeMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasResponseTimeMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseTimeMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setResponseTimeMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int responseTimeMs = a3;
}

- (void)deleteNumberOfParagraphs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumberOfParagraphs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfParagraphs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumberOfParagraphs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numberOfParagraphs = a3;
}

- (void)deleteBatchSeqNo
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBatchSeqNo:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBatchSeqNo
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBatchSeqNo:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int batchSeqNo = a3;
}

- (void)deleteSystemLocale
{
}

- (BOOL)hasSystemLocale
{
  return self->_systemLocale != 0;
}

- (void)deleteRequestID
{
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)deleteSessionID
{
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (void)deleteTask
{
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end