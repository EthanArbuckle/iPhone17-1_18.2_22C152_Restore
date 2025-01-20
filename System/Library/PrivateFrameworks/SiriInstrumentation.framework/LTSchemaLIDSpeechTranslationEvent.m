@interface LTSchemaLIDSpeechTranslationEvent
- (BOOL)hasAlternateLocale;
- (BOOL)hasRequestID;
- (BOOL)hasResponseTimeMs;
- (BOOL)hasSelectedLocale;
- (BOOL)hasSpeechElapsedTime;
- (BOOL)hasUserSelectedLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaLIDSpeechTranslationEvent)initWithDictionary:(id)a3;
- (LTSchemaLIDSpeechTranslationEvent)initWithJSON:(id)a3;
- (LTSchemaLocaleConfidence)alternateLocale;
- (LTSchemaLocaleConfidence)selectedLocale;
- (NSData)jsonData;
- (NSString)requestID;
- (NSString)userSelectedLocale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)responseTimeMs;
- (unsigned)speechElapsedTime;
- (void)deleteAlternateLocale;
- (void)deleteRequestID;
- (void)deleteResponseTimeMs;
- (void)deleteSelectedLocale;
- (void)deleteSpeechElapsedTime;
- (void)deleteUserSelectedLocale;
- (void)setAlternateLocale:(id)a3;
- (void)setHasAlternateLocale:(BOOL)a3;
- (void)setHasRequestID:(BOOL)a3;
- (void)setHasResponseTimeMs:(BOOL)a3;
- (void)setHasSelectedLocale:(BOOL)a3;
- (void)setHasSpeechElapsedTime:(BOOL)a3;
- (void)setHasUserSelectedLocale:(BOOL)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseTimeMs:(unsigned int)a3;
- (void)setSelectedLocale:(id)a3;
- (void)setSpeechElapsedTime:(unsigned int)a3;
- (void)setUserSelectedLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaLIDSpeechTranslationEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LTSchemaLIDSpeechTranslationEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(LTSchemaLIDSpeechTranslationEvent *)self selectedLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LTSchemaLIDSpeechTranslationEvent *)self deleteSelectedLocale];
  }
  v9 = [(LTSchemaLIDSpeechTranslationEvent *)self alternateLocale];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(LTSchemaLIDSpeechTranslationEvent *)self deleteAlternateLocale];
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
  objc_storeStrong((id *)&self->_userSelectedLocale, 0);
  objc_storeStrong((id *)&self->_alternateLocale, 0);
  objc_storeStrong((id *)&self->_selectedLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)setHasUserSelectedLocale:(BOOL)a3
{
  self->_hasRequestID = a3;
}

- (void)setHasAlternateLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSelectedLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)speechElapsedTime
{
  return self->_speechElapsedTime;
}

- (unsigned)responseTimeMs
{
  return self->_responseTimeMs;
}

- (void)setUserSelectedLocale:(id)a3
{
}

- (NSString)userSelectedLocale
{
  return self->_userSelectedLocale;
}

- (void)setAlternateLocale:(id)a3
{
}

- (LTSchemaLocaleConfidence)alternateLocale
{
  return self->_alternateLocale;
}

- (void)setSelectedLocale:(id)a3
{
}

- (LTSchemaLocaleConfidence)selectedLocale
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

- (LTSchemaLIDSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LTSchemaLIDSpeechTranslationEvent;
  v5 = [(LTSchemaLIDSpeechTranslationEvent *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaLIDSpeechTranslationEvent *)v5 setRequestID:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"selectedLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[LTSchemaLocaleConfidence alloc] initWithDictionary:v8];
      [(LTSchemaLIDSpeechTranslationEvent *)v5 setSelectedLocale:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"alternateLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[LTSchemaLocaleConfidence alloc] initWithDictionary:v10];
      [(LTSchemaLIDSpeechTranslationEvent *)v5 setAlternateLocale:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"userSelectedLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = (void *)[v12 copy];
      [(LTSchemaLIDSpeechTranslationEvent *)v5 setUserSelectedLocale:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"responseTimeMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaLIDSpeechTranslationEvent setResponseTimeMs:](v5, "setResponseTimeMs:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"speechElapsedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaLIDSpeechTranslationEvent setSpeechElapsedTime:](v5, "setSpeechElapsedTime:", [v15 unsignedIntValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (LTSchemaLIDSpeechTranslationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaLIDSpeechTranslationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaLIDSpeechTranslationEvent *)self dictionaryRepresentation];
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
  if (self->_alternateLocale)
  {
    id v4 = [(LTSchemaLIDSpeechTranslationEvent *)self alternateLocale];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"alternateLocale"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"alternateLocale"];
    }
  }
  if (self->_requestID)
  {
    uint64_t v7 = [(LTSchemaLIDSpeechTranslationEvent *)self requestID];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"requestID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaLIDSpeechTranslationEvent responseTimeMs](self, "responseTimeMs"));
    [v3 setObject:v9 forKeyedSubscript:@"responseTimeMs"];
  }
  if (self->_selectedLocale)
  {
    v10 = [(LTSchemaLIDSpeechTranslationEvent *)self selectedLocale];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"selectedLocale"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"selectedLocale"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaLIDSpeechTranslationEvent speechElapsedTime](self, "speechElapsedTime"));
    [v3 setObject:v13 forKeyedSubscript:@"speechElapsedTime"];
  }
  if (self->_userSelectedLocale)
  {
    v14 = [(LTSchemaLIDSpeechTranslationEvent *)self userSelectedLocale];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"userSelectedLocale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  unint64_t v4 = [(LTSchemaLocaleConfidence *)self->_selectedLocale hash];
  unint64_t v5 = [(LTSchemaLocaleConfidence *)self->_alternateLocale hash];
  NSUInteger v6 = [(NSString *)self->_userSelectedLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_responseTimeMs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_speechElapsedTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(LTSchemaLIDSpeechTranslationEvent *)self requestID];
  NSUInteger v6 = [v4 requestID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(LTSchemaLIDSpeechTranslationEvent *)self requestID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(LTSchemaLIDSpeechTranslationEvent *)self requestID];
    v10 = [v4 requestID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(LTSchemaLIDSpeechTranslationEvent *)self selectedLocale];
  NSUInteger v6 = [v4 selectedLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(LTSchemaLIDSpeechTranslationEvent *)self selectedLocale];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(LTSchemaLIDSpeechTranslationEvent *)self selectedLocale];
    v15 = [v4 selectedLocale];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(LTSchemaLIDSpeechTranslationEvent *)self alternateLocale];
  NSUInteger v6 = [v4 alternateLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(LTSchemaLIDSpeechTranslationEvent *)self alternateLocale];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(LTSchemaLIDSpeechTranslationEvent *)self alternateLocale];
    v20 = [v4 alternateLocale];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(LTSchemaLIDSpeechTranslationEvent *)self userSelectedLocale];
  NSUInteger v6 = [v4 userSelectedLocale];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(LTSchemaLIDSpeechTranslationEvent *)self userSelectedLocale];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(LTSchemaLIDSpeechTranslationEvent *)self userSelectedLocale];
    v25 = [v4 userSelectedLocale];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  $9BA7F92579BAE5AFFC13C1948E9867C3 has = self->_has;
  unsigned int v30 = v4[48];
  if ((*(unsigned char *)&has & 1) == (v30 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unsigned int responseTimeMs = self->_responseTimeMs;
      if (responseTimeMs != [v4 responseTimeMs]) {
        goto LABEL_22;
      }
      $9BA7F92579BAE5AFFC13C1948E9867C3 has = self->_has;
      unsigned int v30 = v4[48];
    }
    int v32 = (*(unsigned int *)&has >> 1) & 1;
    if (v32 == ((v30 >> 1) & 1))
    {
      if (!v32
        || (unsigned int speechElapsedTime = self->_speechElapsedTime,
            speechElapsedTime == [v4 speechElapsedTime]))
      {
        BOOL v27 = 1;
        goto LABEL_23;
      }
    }
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [(LTSchemaLIDSpeechTranslationEvent *)self requestID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(LTSchemaLIDSpeechTranslationEvent *)self selectedLocale];

  if (v5)
  {
    NSUInteger v6 = [(LTSchemaLIDSpeechTranslationEvent *)self selectedLocale];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(LTSchemaLIDSpeechTranslationEvent *)self alternateLocale];

  if (v7)
  {
    uint64_t v8 = [(LTSchemaLIDSpeechTranslationEvent *)self alternateLocale];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(LTSchemaLIDSpeechTranslationEvent *)self userSelectedLocale];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  int v11 = v12;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    int v11 = v12;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    int v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaLIDSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSpeechElapsedTime
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSpeechElapsedTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSpeechElapsedTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSpeechElapsedTime:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int speechElapsedTime = a3;
}

- (void)deleteResponseTimeMs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasResponseTimeMs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseTimeMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResponseTimeMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int responseTimeMs = a3;
}

- (void)deleteUserSelectedLocale
{
}

- (BOOL)hasUserSelectedLocale
{
  return self->_userSelectedLocale != 0;
}

- (void)deleteAlternateLocale
{
}

- (BOOL)hasAlternateLocale
{
  return self->_alternateLocale != 0;
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