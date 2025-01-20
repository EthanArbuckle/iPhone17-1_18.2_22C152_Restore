@interface TTSSchemaTTSVoiceFallbackOccurred
- (BOOL)hasContext;
- (BOOL)hasContextId;
- (BOOL)hasVoiceSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (SISchemaVoiceSettings)voiceSettings;
- (TTSSchemaTTSVoiceContext)context;
- (TTSSchemaTTSVoiceFallbackOccurred)initWithDictionary:(id)a3;
- (TTSSchemaTTSVoiceFallbackOccurred)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteContext;
- (void)deleteContextId;
- (void)deleteVoiceSettings;
- (void)setContext:(id)a3;
- (void)setContextId:(id)a3;
- (void)setHasContext:(BOOL)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasVoiceSettings:(BOOL)a3;
- (void)setVoiceSettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSVoiceFallbackOccurred

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TTSSchemaTTSVoiceFallbackOccurred;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(TTSSchemaTTSVoiceFallbackOccurred *)self voiceSettings];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTSSchemaTTSVoiceFallbackOccurred *)self deleteVoiceSettings];
  }
  v9 = [(TTSSchemaTTSVoiceFallbackOccurred *)self context];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(TTSSchemaTTSVoiceFallbackOccurred *)self deleteContext];
  }
  v12 = [(TTSSchemaTTSVoiceFallbackOccurred *)self contextId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(TTSSchemaTTSVoiceFallbackOccurred *)self deleteContextId];
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
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_voiceSettings, 0);
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (void)setHasContext:(BOOL)a3
{
  self->_hasContext = a3;
}

- (void)setHasVoiceSettings:(BOOL)a3
{
  self->_hasVoiceSettings = a3;
}

- (void)setContextId:(id)a3
{
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContext:(id)a3
{
}

- (TTSSchemaTTSVoiceContext)context
{
  return self->_context;
}

- (void)setVoiceSettings:(id)a3
{
}

- (SISchemaVoiceSettings)voiceSettings
{
  return self->_voiceSettings;
}

- (TTSSchemaTTSVoiceFallbackOccurred)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TTSSchemaTTSVoiceFallbackOccurred;
  v5 = [(TTSSchemaTTSVoiceFallbackOccurred *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaVoiceSettings alloc] initWithDictionary:v6];
      [(TTSSchemaTTSVoiceFallbackOccurred *)v5 setVoiceSettings:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"context"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[TTSSchemaTTSVoiceContext alloc] initWithDictionary:v8];
      [(TTSSchemaTTSVoiceFallbackOccurred *)v5 setContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(TTSSchemaTTSVoiceFallbackOccurred *)v5 setContextId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (TTSSchemaTTSVoiceFallbackOccurred)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSVoiceFallbackOccurred *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSVoiceFallbackOccurred *)self dictionaryRepresentation];
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
  if (self->_context)
  {
    id v4 = [(TTSSchemaTTSVoiceFallbackOccurred *)self context];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"context"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"context"];
    }
  }
  if (self->_contextId)
  {
    uint64_t v7 = [(TTSSchemaTTSVoiceFallbackOccurred *)self contextId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"contextId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"contextId"];
    }
  }
  if (self->_voiceSettings)
  {
    v10 = [(TTSSchemaTTSVoiceFallbackOccurred *)self voiceSettings];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"voiceSettings"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"voiceSettings"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaVoiceSettings *)self->_voiceSettings hash];
  unint64_t v4 = [(TTSSchemaTTSVoiceContext *)self->_context hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_contextId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(TTSSchemaTTSVoiceFallbackOccurred *)self voiceSettings];
  v6 = [v4 voiceSettings];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(TTSSchemaTTSVoiceFallbackOccurred *)self voiceSettings];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(TTSSchemaTTSVoiceFallbackOccurred *)self voiceSettings];
    v10 = [v4 voiceSettings];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(TTSSchemaTTSVoiceFallbackOccurred *)self context];
  v6 = [v4 context];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(TTSSchemaTTSVoiceFallbackOccurred *)self context];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(TTSSchemaTTSVoiceFallbackOccurred *)self context];
    v15 = [v4 context];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(TTSSchemaTTSVoiceFallbackOccurred *)self contextId];
  v6 = [v4 contextId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(TTSSchemaTTSVoiceFallbackOccurred *)self contextId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(TTSSchemaTTSVoiceFallbackOccurred *)self contextId];
    v20 = [v4 contextId];
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
  id v10 = a3;
  id v4 = [(TTSSchemaTTSVoiceFallbackOccurred *)self voiceSettings];

  if (v4)
  {
    v5 = [(TTSSchemaTTSVoiceFallbackOccurred *)self voiceSettings];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(TTSSchemaTTSVoiceFallbackOccurred *)self context];

  if (v6)
  {
    uint64_t v7 = [(TTSSchemaTTSVoiceFallbackOccurred *)self context];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(TTSSchemaTTSVoiceFallbackOccurred *)self contextId];

  if (v8)
  {
    v9 = [(TTSSchemaTTSVoiceFallbackOccurred *)self contextId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSVoiceFallbackOccurredReadFrom(self, (uint64_t)a3);
}

- (void)deleteContextId
{
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteContext
{
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (void)deleteVoiceSettings
{
}

- (BOOL)hasVoiceSettings
{
  return self->_voiceSettings != 0;
}

@end