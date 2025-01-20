@interface SISchemaTypingRequestTrace
- (BOOL)hasKeyboardAppearanceBringUpTurnID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)keyboardAppearanceBringUpTurnID;
- (SISchemaTypingRequestTrace)initWithDictionary:(id)a3;
- (SISchemaTypingRequestTrace)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteKeyboardAppearanceBringUpTurnID;
- (void)setHasKeyboardAppearanceBringUpTurnID:(BOOL)a3;
- (void)setKeyboardAppearanceBringUpTurnID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaTypingRequestTrace

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasKeyboardAppearanceBringUpTurnID:(BOOL)a3
{
  self->_hasKeyboardAppearanceBringUpTurnID = a3;
}

- (void)setKeyboardAppearanceBringUpTurnID:(id)a3
{
}

- (NSData)keyboardAppearanceBringUpTurnID
{
  return self->_keyboardAppearanceBringUpTurnID;
}

- (SISchemaTypingRequestTrace)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaTypingRequestTrace;
  v5 = [(SISchemaTypingRequestTrace *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"keyboardAppearanceBringUpTurnID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(SISchemaTypingRequestTrace *)v5 setKeyboardAppearanceBringUpTurnID:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (SISchemaTypingRequestTrace)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaTypingRequestTrace *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaTypingRequestTrace *)self dictionaryRepresentation];
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
  if (self->_keyboardAppearanceBringUpTurnID)
  {
    id v4 = [(SISchemaTypingRequestTrace *)self keyboardAppearanceBringUpTurnID];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"keyboardAppearanceBringUpTurnID"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"keyboardAppearanceBringUpTurnID"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSData *)self->_keyboardAppearanceBringUpTurnID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(SISchemaTypingRequestTrace *)self keyboardAppearanceBringUpTurnID];
    v6 = [v4 keyboardAppearanceBringUpTurnID];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(SISchemaTypingRequestTrace *)self keyboardAppearanceBringUpTurnID];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(SISchemaTypingRequestTrace *)self keyboardAppearanceBringUpTurnID];
      v11 = [v4 keyboardAppearanceBringUpTurnID];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(SISchemaTypingRequestTrace *)self keyboardAppearanceBringUpTurnID];

  if (v4) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaTypingRequestTraceReadFrom(self, (uint64_t)a3);
}

- (void)deleteKeyboardAppearanceBringUpTurnID
{
}

- (BOOL)hasKeyboardAppearanceBringUpTurnID
{
  return self->_keyboardAppearanceBringUpTurnID != 0;
}

@end