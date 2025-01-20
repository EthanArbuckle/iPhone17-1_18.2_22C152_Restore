@interface LTSchemaMTSpeechTranslationEvent
- (BOOL)hasRequestID;
- (BOOL)hasResponseTimeMs;
- (BOOL)hasSelectedLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaMTSpeechTranslationEvent)initWithDictionary:(id)a3;
- (LTSchemaMTSpeechTranslationEvent)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)requestID;
- (NSString)selectedLocale;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)responseTimeMs;
- (unint64_t)hash;
- (void)deleteRequestID;
- (void)deleteResponseTimeMs;
- (void)deleteSelectedLocale;
- (void)setHasRequestID:(BOOL)a3;
- (void)setHasResponseTimeMs:(BOOL)a3;
- (void)setHasSelectedLocale:(BOOL)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseTimeMs:(int)a3;
- (void)setSelectedLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaMTSpeechTranslationEvent

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)setHasSelectedLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)responseTimeMs
{
  return self->_responseTimeMs;
}

- (void)setSelectedLocale:(id)a3
{
}

- (NSString)selectedLocale
{
  return self->_selectedLocale;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (LTSchemaMTSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTSchemaMTSpeechTranslationEvent;
  v5 = [(LTSchemaMTSpeechTranslationEvent *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaMTSpeechTranslationEvent *)v5 setRequestID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"selectedLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(LTSchemaMTSpeechTranslationEvent *)v5 setSelectedLocale:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"responseTimeMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaMTSpeechTranslationEvent setResponseTimeMs:](v5, "setResponseTimeMs:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (LTSchemaMTSpeechTranslationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaMTSpeechTranslationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaMTSpeechTranslationEvent *)self dictionaryRepresentation];
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
  if (self->_requestID)
  {
    id v4 = [(LTSchemaMTSpeechTranslationEvent *)self requestID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"requestID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[LTSchemaMTSpeechTranslationEvent responseTimeMs](self, "responseTimeMs"));
    [v3 setObject:v6 forKeyedSubscript:@"responseTimeMs"];
  }
  if (self->_selectedLocale)
  {
    uint64_t v7 = [(LTSchemaMTSpeechTranslationEvent *)self selectedLocale];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"selectedLocale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  NSUInteger v4 = [(NSString *)self->_selectedLocale hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_responseTimeMs;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(LTSchemaMTSpeechTranslationEvent *)self requestID];
  v6 = [v4 requestID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(LTSchemaMTSpeechTranslationEvent *)self requestID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(LTSchemaMTSpeechTranslationEvent *)self requestID];
    v10 = [v4 requestID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(LTSchemaMTSpeechTranslationEvent *)self selectedLocale];
  v6 = [v4 selectedLocale];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(LTSchemaMTSpeechTranslationEvent *)self selectedLocale];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(LTSchemaMTSpeechTranslationEvent *)self selectedLocale];
    v15 = [v4 selectedLocale];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int responseTimeMs = self->_responseTimeMs, responseTimeMs == [v4 responseTimeMs]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  NSUInteger v4 = [(LTSchemaMTSpeechTranslationEvent *)self requestID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(LTSchemaMTSpeechTranslationEvent *)self selectedLocale];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = v7;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaMTSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteResponseTimeMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResponseTimeMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseTimeMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResponseTimeMs:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int responseTimeMs = a3;
}

- (void)deleteSelectedLocale
{
}

- (BOOL)hasSelectedLocale
{
  return self->_selectedLocale != 0;
}

- (void)deleteRequestID
{
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

@end