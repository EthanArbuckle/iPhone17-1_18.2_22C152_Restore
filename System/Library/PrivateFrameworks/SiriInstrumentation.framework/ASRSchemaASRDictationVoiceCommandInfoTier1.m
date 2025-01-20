@interface ASRSchemaASRDictationVoiceCommandInfoTier1
- (ASRSchemaASRDictationVoiceCommandInfoTier1)initWithDictionary:(id)a3;
- (ASRSchemaASRDictationVoiceCommandInfoTier1)initWithJSON:(id)a3;
- (BOOL)hasCommandUtterance;
- (BOOL)hasDictationVoiceCommandLinkId;
- (BOOL)hasPayload;
- (BOOL)hasPreviousUtterance;
- (BOOL)hasTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)commandUtterance;
- (NSString)payload;
- (NSString)previousUtterance;
- (NSString)target;
- (SISchemaUUID)dictationVoiceCommandLinkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCommandUtterance;
- (void)deleteDictationVoiceCommandLinkId;
- (void)deletePayload;
- (void)deletePreviousUtterance;
- (void)deleteTarget;
- (void)setCommandUtterance:(id)a3;
- (void)setDictationVoiceCommandLinkId:(id)a3;
- (void)setHasCommandUtterance:(BOOL)a3;
- (void)setHasDictationVoiceCommandLinkId:(BOOL)a3;
- (void)setHasPayload:(BOOL)a3;
- (void)setHasPreviousUtterance:(BOOL)a3;
- (void)setHasTarget:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setPreviousUtterance:(id)a3;
- (void)setTarget:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRDictationVoiceCommandInfoTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRDictationVoiceCommandInfoTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePreviousUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteCommandUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteTarget];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePayload];
  }
  if ([v4 isConditionSet:4])
  {
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePreviousUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteCommandUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteTarget];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePayload];
  }
  if ([v4 isConditionSet:5])
  {
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePreviousUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteCommandUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteTarget];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePayload];
  }
  if ([v4 isConditionSet:6])
  {
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePreviousUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteCommandUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteTarget];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePayload];
  }
  if ([v4 isConditionSet:7])
  {
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePreviousUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteCommandUtterance];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteTarget];
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deletePayload];
  }
  v6 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictationVoiceCommandLinkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self deleteDictationVoiceCommandLinkId];
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
  objc_storeStrong((id *)&self->_dictationVoiceCommandLinkId, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_commandUtterance, 0);
  objc_storeStrong((id *)&self->_previousUtterance, 0);
}

- (void)setHasDictationVoiceCommandLinkId:(BOOL)a3
{
  self->_hasDictationVoiceCommandLinkId = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  self->_hasPayload = a3;
}

- (void)setHasTarget:(BOOL)a3
{
  self->_hasTarget = a3;
}

- (void)setHasCommandUtterance:(BOOL)a3
{
  self->_hasCommandUtterance = a3;
}

- (void)setHasPreviousUtterance:(BOOL)a3
{
  self->_hasPreviousUtterance = a3;
}

- (void)setDictationVoiceCommandLinkId:(id)a3
{
}

- (SISchemaUUID)dictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId;
}

- (void)setPayload:(id)a3
{
}

- (NSString)payload
{
  return self->_payload;
}

- (void)setTarget:(id)a3
{
}

- (NSString)target
{
  return self->_target;
}

- (void)setCommandUtterance:(id)a3
{
}

- (NSString)commandUtterance
{
  return self->_commandUtterance;
}

- (void)setPreviousUtterance:(id)a3
{
}

- (NSString)previousUtterance
{
  return self->_previousUtterance;
}

- (ASRSchemaASRDictationVoiceCommandInfoTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASRSchemaASRDictationVoiceCommandInfoTier1;
  v5 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"previousUtterance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)v5 setPreviousUtterance:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"commandUtterance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)v5 setCommandUtterance:v9];
    }
    objc_super v10 = [v4 objectForKeyedSubscript:@"target"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)v5 setTarget:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"payload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)v5 setPayload:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"dictationVoiceCommandLinkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)v5 setDictationVoiceCommandLinkId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (ASRSchemaASRDictationVoiceCommandInfoTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictionaryRepresentation];
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
  if (self->_commandUtterance)
  {
    id v4 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self commandUtterance];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"commandUtterance"];
  }
  if (self->_dictationVoiceCommandLinkId)
  {
    v6 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictationVoiceCommandLinkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"dictationVoiceCommandLinkId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"dictationVoiceCommandLinkId"];
    }
  }
  if (self->_payload)
  {
    v9 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self payload];
    objc_super v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"payload"];
  }
  if (self->_previousUtterance)
  {
    v11 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self previousUtterance];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"previousUtterance"];
  }
  if (self->_target)
  {
    v13 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self target];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"target"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_previousUtterance hash];
  NSUInteger v4 = [(NSString *)self->_commandUtterance hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_target hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_payload hash];
  return v6 ^ [(SISchemaUUID *)self->_dictationVoiceCommandLinkId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  NSUInteger v5 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self previousUtterance];
  NSUInteger v6 = [v4 previousUtterance];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self previousUtterance];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self previousUtterance];
    objc_super v10 = [v4 previousUtterance];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self commandUtterance];
  NSUInteger v6 = [v4 commandUtterance];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self commandUtterance];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self commandUtterance];
    v15 = [v4 commandUtterance];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self target];
  NSUInteger v6 = [v4 target];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self target];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self target];
    v20 = [v4 target];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self payload];
  NSUInteger v6 = [v4 payload];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self payload];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self payload];
    v25 = [v4 payload];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictationVoiceCommandLinkId];
  NSUInteger v6 = [v4 dictationVoiceCommandLinkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictationVoiceCommandLinkId];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictationVoiceCommandLinkId];
    v30 = [v4 dictationVoiceCommandLinkId];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self previousUtterance];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self commandUtterance];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self target];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self payload];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  int v8 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictationVoiceCommandLinkId];

  if (v8)
  {
    v9 = [(ASRSchemaASRDictationVoiceCommandInfoTier1 *)self dictationVoiceCommandLinkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRDictationVoiceCommandInfoTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteDictationVoiceCommandLinkId
{
}

- (BOOL)hasDictationVoiceCommandLinkId
{
  return self->_dictationVoiceCommandLinkId != 0;
}

- (void)deletePayload
{
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)deleteTarget
{
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (void)deleteCommandUtterance
{
}

- (BOOL)hasCommandUtterance
{
  return self->_commandUtterance != 0;
}

- (void)deletePreviousUtterance
{
}

- (BOOL)hasPreviousUtterance
{
  return self->_previousUtterance != 0;
}

@end