@interface MHSchemaMHVoiceTriggerRePrompted
- (BOOL)hasIsRePrompted;
- (BOOL)hasLastWhenRePrompted;
- (BOOL)hasSiriSpeechID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRePrompted;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceTriggerRePrompted)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceTriggerRePrompted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)lastWhenRePrompted;
- (NSString)siriSpeechID;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsRePrompted;
- (void)deleteLastWhenRePrompted;
- (void)deleteSiriSpeechID;
- (void)setHasIsRePrompted:(BOOL)a3;
- (void)setHasLastWhenRePrompted:(BOOL)a3;
- (void)setHasSiriSpeechID:(BOOL)a3;
- (void)setIsRePrompted:(BOOL)a3;
- (void)setLastWhenRePrompted:(id)a3;
- (void)setSiriSpeechID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceTriggerRePrompted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWhenRePrompted, 0);
  objc_storeStrong((id *)&self->_siriSpeechID, 0);
}

- (void)setHasLastWhenRePrompted:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSiriSpeechID:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLastWhenRePrompted:(id)a3
{
}

- (NSString)lastWhenRePrompted
{
  return self->_lastWhenRePrompted;
}

- (BOOL)isRePrompted
{
  return self->_isRePrompted;
}

- (void)setSiriSpeechID:(id)a3
{
}

- (NSString)siriSpeechID
{
  return self->_siriSpeechID;
}

- (MHSchemaMHVoiceTriggerRePrompted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHVoiceTriggerRePrompted;
  v5 = [(MHSchemaMHVoiceTriggerRePrompted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriSpeechID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHVoiceTriggerRePrompted *)v5 setSiriSpeechID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isRePrompted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerRePrompted setIsRePrompted:](v5, "setIsRePrompted:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"lastWhenRePrompted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(MHSchemaMHVoiceTriggerRePrompted *)v5 setLastWhenRePrompted:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceTriggerRePrompted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceTriggerRePrompted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceTriggerRePrompted *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceTriggerRePrompted isRePrompted](self, "isRePrompted"));
    [v3 setObject:v4 forKeyedSubscript:@"isRePrompted"];
  }
  if (self->_lastWhenRePrompted)
  {
    v5 = [(MHSchemaMHVoiceTriggerRePrompted *)self lastWhenRePrompted];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"lastWhenRePrompted"];
  }
  if (self->_siriSpeechID)
  {
    uint64_t v7 = [(MHSchemaMHVoiceTriggerRePrompted *)self siriSpeechID];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"siriSpeechID"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_siriSpeechID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isRePrompted;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_lastWhenRePrompted hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(MHSchemaMHVoiceTriggerRePrompted *)self siriSpeechID];
  v6 = [v4 siriSpeechID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(MHSchemaMHVoiceTriggerRePrompted *)self siriSpeechID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(MHSchemaMHVoiceTriggerRePrompted *)self siriSpeechID];
    v10 = [v4 siriSpeechID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isRePrompted = self->_isRePrompted;
    if (isRePrompted != [v4 isRePrompted]) {
      goto LABEL_15;
    }
  }
  v5 = [(MHSchemaMHVoiceTriggerRePrompted *)self lastWhenRePrompted];
  v6 = [v4 lastWhenRePrompted];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(MHSchemaMHVoiceTriggerRePrompted *)self lastWhenRePrompted];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(MHSchemaMHVoiceTriggerRePrompted *)self lastWhenRePrompted];
    v16 = [v4 lastWhenRePrompted];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(MHSchemaMHVoiceTriggerRePrompted *)self siriSpeechID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(MHSchemaMHVoiceTriggerRePrompted *)self lastWhenRePrompted];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerRePromptedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLastWhenRePrompted
{
}

- (BOOL)hasLastWhenRePrompted
{
  return self->_lastWhenRePrompted != 0;
}

- (void)deleteIsRePrompted
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsRePrompted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsRePrompted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsRePrompted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isRePrompted = a3;
}

- (void)deleteSiriSpeechID
{
}

- (BOOL)hasSiriSpeechID
{
  return self->_siriSpeechID != 0;
}

@end