@interface SISchemaUEIDictationVoiceCommandUndoTapAction
- (BOOL)hasIsUndoTapAlternativeSelection;
- (BOOL)hasVoiceCommandId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUndoTapAlternativeSelection;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIDictationVoiceCommandUndoTapAction)initWithDictionary:(id)a3;
- (SISchemaUEIDictationVoiceCommandUndoTapAction)initWithJSON:(id)a3;
- (SISchemaUUID)voiceCommandId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsUndoTapAlternativeSelection;
- (void)deleteVoiceCommandId;
- (void)setHasIsUndoTapAlternativeSelection:(BOOL)a3;
- (void)setHasVoiceCommandId:(BOOL)a3;
- (void)setIsUndoTapAlternativeSelection:(BOOL)a3;
- (void)setVoiceCommandId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIDictationVoiceCommandUndoTapAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIDictationVoiceCommandUndoTapAction;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self voiceCommandId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self deleteVoiceCommandId];
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
}

- (void)setHasVoiceCommandId:(BOOL)a3
{
  *(&self->_isUndoTapAlternativeSelection + 2) = a3;
}

- (BOOL)isUndoTapAlternativeSelection
{
  return self->_isUndoTapAlternativeSelection;
}

- (void)setVoiceCommandId:(id)a3
{
}

- (SISchemaUUID)voiceCommandId
{
  return self->_voiceCommandId;
}

- (SISchemaUEIDictationVoiceCommandUndoTapAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaUEIDictationVoiceCommandUndoTapAction;
  v5 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"voiceCommandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SISchemaUEIDictationVoiceCommandUndoTapAction *)v5 setVoiceCommandId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isUndoTapAlternativeSelection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIDictationVoiceCommandUndoTapAction setIsUndoTapAlternativeSelection:](v5, "setIsUndoTapAlternativeSelection:", [v8 BOOLValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (SISchemaUEIDictationVoiceCommandUndoTapAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self dictionaryRepresentation];
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
  if (*(&self->_isUndoTapAlternativeSelection + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEIDictationVoiceCommandUndoTapAction isUndoTapAlternativeSelection](self, "isUndoTapAlternativeSelection"));
    [v3 setObject:v4 forKeyedSubscript:@"isUndoTapAlternativeSelection"];
  }
  if (self->_voiceCommandId)
  {
    v5 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self voiceCommandId];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"voiceCommandId"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"voiceCommandId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_voiceCommandId hash];
  if (*(&self->_isUndoTapAlternativeSelection + 1)) {
    uint64_t v4 = 2654435761 * self->_isUndoTapAlternativeSelection;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self voiceCommandId];
  v6 = [v4 voiceCommandId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self voiceCommandId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self voiceCommandId];
    objc_super v11 = [v4 voiceCommandId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (*(&self->_isUndoTapAlternativeSelection + 1) != (v4[17] & 1)) {
    goto LABEL_12;
  }
  if (*(&self->_isUndoTapAlternativeSelection + 1))
  {
    int isUndoTapAlternativeSelection = self->_isUndoTapAlternativeSelection;
    if (isUndoTapAlternativeSelection != [v4 isUndoTapAlternativeSelection]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self voiceCommandId];

  if (v4)
  {
    v5 = [(SISchemaUEIDictationVoiceCommandUndoTapAction *)self voiceCommandId];
    PBDataWriterWriteSubmessage();
  }
  if (*(&self->_isUndoTapAlternativeSelection + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIDictationVoiceCommandUndoTapActionReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsUndoTapAlternativeSelection
{
  *(&self->_isUndoTapAlternativeSelection + 1) &= ~1u;
}

- (void)setHasIsUndoTapAlternativeSelection:(BOOL)a3
{
  *(&self->_isUndoTapAlternativeSelection + 1) = *(&self->_isUndoTapAlternativeSelection + 1) & 0xFE | a3;
}

- (BOOL)hasIsUndoTapAlternativeSelection
{
  return *(&self->_isUndoTapAlternativeSelection + 1);
}

- (void)setIsUndoTapAlternativeSelection:(BOOL)a3
{
  *(&self->_isUndoTapAlternativeSelection + 1) |= 1u;
  self->_int isUndoTapAlternativeSelection = a3;
}

- (void)deleteVoiceCommandId
{
}

- (BOOL)hasVoiceCommandId
{
  return self->_voiceCommandId != 0;
}

@end