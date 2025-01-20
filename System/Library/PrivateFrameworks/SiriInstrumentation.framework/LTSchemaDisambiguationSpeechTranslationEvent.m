@interface LTSchemaDisambiguationSpeechTranslationEvent
- (BOOL)hasRequestID;
- (BOOL)hasSenseID;
- (BOOL)hasSourceLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LTSchemaDisambiguationSpeechTranslationEvent)initWithDictionary:(id)a3;
- (LTSchemaDisambiguationSpeechTranslationEvent)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)requestID;
- (NSString)senseID;
- (NSString)sourceLocale;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteRequestID;
- (void)deleteSenseID;
- (void)deleteSourceLocale;
- (void)setHasRequestID:(BOOL)a3;
- (void)setHasSenseID:(BOOL)a3;
- (void)setHasSourceLocale:(BOOL)a3;
- (void)setRequestID:(id)a3;
- (void)setSenseID:(id)a3;
- (void)setSourceLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LTSchemaDisambiguationSpeechTranslationEvent

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senseID, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)setHasSenseID:(BOOL)a3
{
  self->_hasSenseID = a3;
}

- (void)setHasSourceLocale:(BOOL)a3
{
  self->_hasSourceLocale = a3;
}

- (void)setHasRequestID:(BOOL)a3
{
  self->_hasRequestID = a3;
}

- (void)setSenseID:(id)a3
{
}

- (NSString)senseID
{
  return self->_senseID;
}

- (void)setSourceLocale:(id)a3
{
}

- (NSString)sourceLocale
{
  return self->_sourceLocale;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (LTSchemaDisambiguationSpeechTranslationEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LTSchemaDisambiguationSpeechTranslationEvent;
  v5 = [(LTSchemaDisambiguationSpeechTranslationEvent *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(LTSchemaDisambiguationSpeechTranslationEvent *)v5 setRequestID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sourceLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(LTSchemaDisambiguationSpeechTranslationEvent *)v5 setSourceLocale:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"senseID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(LTSchemaDisambiguationSpeechTranslationEvent *)v5 setSenseID:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (LTSchemaDisambiguationSpeechTranslationEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LTSchemaDisambiguationSpeechTranslationEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self dictionaryRepresentation];
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
    id v4 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self requestID];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"requestID"];
  }
  if (self->_senseID)
  {
    v6 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self senseID];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"senseID"];
  }
  if (self->_sourceLocale)
  {
    v8 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self sourceLocale];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"sourceLocale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  NSUInteger v4 = [(NSString *)self->_sourceLocale hash] ^ v3;
  return v4 ^ [(NSString *)self->_senseID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self requestID];
  v6 = [v4 requestID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self requestID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self requestID];
    v10 = [v4 requestID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self sourceLocale];
  v6 = [v4 sourceLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self sourceLocale];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self sourceLocale];
    v15 = [v4 sourceLocale];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self senseID];
  v6 = [v4 senseID];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self senseID];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self senseID];
    v20 = [v4 senseID];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self requestID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self sourceLocale];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(LTSchemaDisambiguationSpeechTranslationEvent *)self senseID];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaDisambiguationSpeechTranslationEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteSenseID
{
}

- (BOOL)hasSenseID
{
  return self->_senseID != 0;
}

- (void)deleteSourceLocale
{
}

- (BOOL)hasSourceLocale
{
  return self->_sourceLocale != 0;
}

- (void)deleteRequestID
{
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

@end