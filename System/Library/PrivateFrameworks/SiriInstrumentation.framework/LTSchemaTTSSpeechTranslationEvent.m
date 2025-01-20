@interface LTSchemaTTSSpeechTranslationEvent
- (BOOL)hasPlaybackBeginTimeMs;
- (BOOL)hasRequestID;
- (BOOL)hasResponseTimeMs;
- (BOOL)hasSelectedLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaTTSSpeechTranslationEvent)initWithDictionary:(id)a3;
- (LTSchemaTTSSpeechTranslationEvent)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)requestID;
- (NSString)selectedLocale;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)playbackBeginTimeMs;
- (unsigned)responseTimeMs;
- (void)deletePlaybackBeginTimeMs;
- (void)deleteRequestID;
- (void)deleteResponseTimeMs;
- (void)deleteSelectedLocale;
- (void)setHasPlaybackBeginTimeMs:(BOOL)a3;
- (void)setHasRequestID:(BOOL)a3;
- (void)setHasResponseTimeMs:(BOOL)a3;
- (void)setHasSelectedLocale:(BOOL)a3;
- (void)setPlaybackBeginTimeMs:(unsigned int)a3;
- (void)setRequestID:(id)a3;
- (void)setResponseTimeMs:(unsigned int)a3;
- (void)setSelectedLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaTTSSpeechTranslationEvent

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

- (unsigned)playbackBeginTimeMs
{
  return self->_playbackBeginTimeMs;
}

- (unsigned)responseTimeMs
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

- (LTSchemaTTSSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LTSchemaTTSSpeechTranslationEvent;
  v5 = [(LTSchemaTTSSpeechTranslationEvent *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaTTSSpeechTranslationEvent *)v5 setRequestID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"selectedLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(LTSchemaTTSSpeechTranslationEvent *)v5 setSelectedLocale:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"responseTimeMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaTTSSpeechTranslationEvent setResponseTimeMs:](v5, "setResponseTimeMs:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"playbackBeginTimeMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LTSchemaTTSSpeechTranslationEvent setPlaybackBeginTimeMs:](v5, "setPlaybackBeginTimeMs:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (LTSchemaTTSSpeechTranslationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaTTSSpeechTranslationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaTTSSpeechTranslationEvent *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaTTSSpeechTranslationEvent playbackBeginTimeMs](self, "playbackBeginTimeMs"));
    [v3 setObject:v4 forKeyedSubscript:@"playbackBeginTimeMs"];
  }
  if (self->_requestID)
  {
    v5 = [(LTSchemaTTSSpeechTranslationEvent *)self requestID];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"requestID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[LTSchemaTTSSpeechTranslationEvent responseTimeMs](self, "responseTimeMs"));
    [v3 setObject:v7 forKeyedSubscript:@"responseTimeMs"];
  }
  if (self->_selectedLocale)
  {
    v8 = [(LTSchemaTTSSpeechTranslationEvent *)self selectedLocale];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"selectedLocale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  NSUInteger v4 = [(NSString *)self->_selectedLocale hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_responseTimeMs;
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
  uint64_t v6 = 2654435761 * self->_playbackBeginTimeMs;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(LTSchemaTTSSpeechTranslationEvent *)self requestID];
  uint64_t v6 = [v4 requestID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(LTSchemaTTSSpeechTranslationEvent *)self requestID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(LTSchemaTTSSpeechTranslationEvent *)self requestID];
    v10 = [v4 requestID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(LTSchemaTTSSpeechTranslationEvent *)self selectedLocale];
  uint64_t v6 = [v4 selectedLocale];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(LTSchemaTTSSpeechTranslationEvent *)self selectedLocale];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(LTSchemaTTSSpeechTranslationEvent *)self selectedLocale];
    v15 = [v4 selectedLocale];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $A7B44E420770E311DD2934706F9DCF13 has = self->_has;
  unsigned int v20 = v4[32];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      unsigned int responseTimeMs = self->_responseTimeMs;
      if (responseTimeMs != [v4 responseTimeMs]) {
        goto LABEL_12;
      }
      $A7B44E420770E311DD2934706F9DCF13 has = self->_has;
      unsigned int v20 = v4[32];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (!v22
        || (unsigned int playbackBeginTimeMs = self->_playbackBeginTimeMs,
            playbackBeginTimeMs == [v4 playbackBeginTimeMs]))
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
  id v8 = a3;
  NSUInteger v4 = [(LTSchemaTTSSpeechTranslationEvent *)self requestID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(LTSchemaTTSSpeechTranslationEvent *)self selectedLocale];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  uint64_t v7 = v8;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaTTSSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePlaybackBeginTimeMs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPlaybackBeginTimeMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlaybackBeginTimeMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPlaybackBeginTimeMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int playbackBeginTimeMs = a3;
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