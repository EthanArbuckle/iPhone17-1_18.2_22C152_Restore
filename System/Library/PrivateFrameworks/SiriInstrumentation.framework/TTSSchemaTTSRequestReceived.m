@interface TTSSchemaTTSRequestReceived
- (BOOL)hasContextId;
- (BOOL)hasInputTextLength;
- (BOOL)hasLinkId;
- (BOOL)hasRequestedVoiceContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (SISchemaUUID)linkId;
- (TTSSchemaTTSRequestReceived)initWithDictionary:(id)a3;
- (TTSSchemaTTSRequestReceived)initWithJSON:(id)a3;
- (TTSSchemaTTSVoiceContext)requestedVoiceContext;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)inputTextLength;
- (unint64_t)hash;
- (void)deleteContextId;
- (void)deleteInputTextLength;
- (void)deleteLinkId;
- (void)deleteRequestedVoiceContext;
- (void)setContextId:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasInputTextLength:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasRequestedVoiceContext:(BOOL)a3;
- (void)setInputTextLength:(int)a3;
- (void)setLinkId:(id)a3;
- (void)setRequestedVoiceContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSRequestReceived

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TTSSchemaTTSRequestReceived;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(TTSSchemaTTSRequestReceived *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTSSchemaTTSRequestReceived *)self deleteLinkId];
  }
  v9 = [(TTSSchemaTTSRequestReceived *)self requestedVoiceContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(TTSSchemaTTSRequestReceived *)self deleteRequestedVoiceContext];
  }
  v12 = [(TTSSchemaTTSRequestReceived *)self contextId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(TTSSchemaTTSRequestReceived *)self deleteContextId];
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
  objc_storeStrong((id *)&self->_requestedVoiceContext, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasContextId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasRequestedVoiceContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setContextId:(id)a3
{
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (int)inputTextLength
{
  return self->_inputTextLength;
}

- (void)setRequestedVoiceContext:(id)a3
{
}

- (TTSSchemaTTSVoiceContext)requestedVoiceContext
{
  return self->_requestedVoiceContext;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (TTSSchemaTTSRequestReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TTSSchemaTTSRequestReceived;
  v5 = [(TTSSchemaTTSRequestReceived *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(TTSSchemaTTSRequestReceived *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestedVoiceContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[TTSSchemaTTSVoiceContext alloc] initWithDictionary:v8];
      [(TTSSchemaTTSRequestReceived *)v5 setRequestedVoiceContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"inputTextLength"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTSSchemaTTSRequestReceived setInputTextLength:](v5, "setInputTextLength:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(TTSSchemaTTSRequestReceived *)v5 setContextId:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (TTSSchemaTTSRequestReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSRequestReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSRequestReceived *)self dictionaryRepresentation];
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
  if (self->_contextId)
  {
    id v4 = [(TTSSchemaTTSRequestReceived *)self contextId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contextId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contextId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[TTSSchemaTTSRequestReceived inputTextLength](self, "inputTextLength"));
    [v3 setObject:v7 forKeyedSubscript:@"inputTextLength"];
  }
  if (self->_linkId)
  {
    int v8 = [(TTSSchemaTTSRequestReceived *)self linkId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_requestedVoiceContext)
  {
    int v11 = [(TTSSchemaTTSRequestReceived *)self requestedVoiceContext];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"requestedVoiceContext"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"requestedVoiceContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  unint64_t v4 = [(TTSSchemaTTSVoiceContext *)self->_requestedVoiceContext hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_inputTextLength;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_contextId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(TTSSchemaTTSRequestReceived *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(TTSSchemaTTSRequestReceived *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(TTSSchemaTTSRequestReceived *)self linkId];
    v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v5 = [(TTSSchemaTTSRequestReceived *)self requestedVoiceContext];
  v6 = [v4 requestedVoiceContext];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(TTSSchemaTTSRequestReceived *)self requestedVoiceContext];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(TTSSchemaTTSRequestReceived *)self requestedVoiceContext];
    objc_super v15 = [v4 requestedVoiceContext];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int inputTextLength = self->_inputTextLength;
    if (inputTextLength != [v4 inputTextLength]) {
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(TTSSchemaTTSRequestReceived *)self contextId];
  v6 = [v4 contextId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(TTSSchemaTTSRequestReceived *)self contextId];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(TTSSchemaTTSRequestReceived *)self contextId];
    v21 = [v4 contextId];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [(TTSSchemaTTSRequestReceived *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(TTSSchemaTTSRequestReceived *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(TTSSchemaTTSRequestReceived *)self requestedVoiceContext];

  if (v6)
  {
    uint64_t v7 = [(TTSSchemaTTSRequestReceived *)self requestedVoiceContext];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  int v8 = [(TTSSchemaTTSRequestReceived *)self contextId];

  v9 = v11;
  if (v8)
  {
    v10 = [(TTSSchemaTTSRequestReceived *)self contextId];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteContextId
{
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteInputTextLength
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInputTextLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInputTextLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInputTextLength:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int inputTextLength = a3;
}

- (void)deleteRequestedVoiceContext
{
}

- (BOOL)hasRequestedVoiceContext
{
  return self->_requestedVoiceContext != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end