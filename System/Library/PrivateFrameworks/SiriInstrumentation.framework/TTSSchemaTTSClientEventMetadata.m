@interface TTSSchemaTTSClientEventMetadata
- (BOOL)hasAceViewId;
- (BOOL)hasClientId;
- (BOOL)hasRequestId;
- (BOOL)hasSubRequestId;
- (BOOL)hasTtsId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)clientId;
- (SISchemaUUID)aceViewId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)subRequestId;
- (SISchemaUUID)ttsId;
- (TTSSchemaTTSClientEventMetadata)initWithDictionary:(id)a3;
- (TTSSchemaTTSClientEventMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAceViewId;
- (void)deleteClientId;
- (void)deleteRequestId;
- (void)deleteSubRequestId;
- (void)deleteTtsId;
- (void)setAceViewId:(id)a3;
- (void)setClientId:(id)a3;
- (void)setHasAceViewId:(BOOL)a3;
- (void)setHasClientId:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasTtsId:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)setTtsId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTSSchemaTTSClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TTSSchemaTTSClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(TTSSchemaTTSClientEventMetadata *)self ttsId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTSSchemaTTSClientEventMetadata *)self deleteTtsId];
  }
  v9 = [(TTSSchemaTTSClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(TTSSchemaTTSClientEventMetadata *)self deleteRequestId];
  }
  v12 = [(TTSSchemaTTSClientEventMetadata *)self subRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(TTSSchemaTTSClientEventMetadata *)self deleteSubRequestId];
  }
  v15 = [(TTSSchemaTTSClientEventMetadata *)self aceViewId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(TTSSchemaTTSClientEventMetadata *)self deleteAceViewId];
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
  objc_storeStrong((id *)&self->_aceViewId, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_ttsId, 0);
}

- (void)setHasAceViewId:(BOOL)a3
{
  self->_hasAceViewId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void)setHasClientId:(BOOL)a3
{
  self->_hasClientId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasTtsId:(BOOL)a3
{
  self->_hasTtsId = a3;
}

- (void)setAceViewId:(id)a3
{
}

- (SISchemaUUID)aceViewId
{
  return self->_aceViewId;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setTtsId:(id)a3
{
}

- (SISchemaUUID)ttsId
{
  return self->_ttsId;
}

- (TTSSchemaTTSClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TTSSchemaTTSClientEventMetadata;
  v5 = [(TTSSchemaTTSClientEventMetadata *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ttsId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(TTSSchemaTTSClientEventMetadata *)v5 setTtsId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(TTSSchemaTTSClientEventMetadata *)v5 setRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"clientId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(TTSSchemaTTSClientEventMetadata *)v5 setClientId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(TTSSchemaTTSClientEventMetadata *)v5 setSubRequestId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"aceViewId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(TTSSchemaTTSClientEventMetadata *)v5 setAceViewId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (TTSSchemaTTSClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTSSchemaTTSClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTSSchemaTTSClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_aceViewId)
  {
    id v4 = [(TTSSchemaTTSClientEventMetadata *)self aceViewId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"aceViewId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"aceViewId"];
    }
  }
  if (self->_clientId)
  {
    uint64_t v7 = [(TTSSchemaTTSClientEventMetadata *)self clientId];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"clientId"];
  }
  if (self->_requestId)
  {
    v9 = [(TTSSchemaTTSClientEventMetadata *)self requestId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"requestId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"requestId"];
    }
  }
  if (self->_subRequestId)
  {
    v12 = [(TTSSchemaTTSClientEventMetadata *)self subRequestId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"subRequestId"];
    }
  }
  if (self->_ttsId)
  {
    v15 = [(TTSSchemaTTSClientEventMetadata *)self ttsId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"ttsId"];
    }
    else
    {
      int v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"ttsId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ttsId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_requestId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_clientId hash];
  unint64_t v6 = v4 ^ v5 ^ [(SISchemaUUID *)self->_subRequestId hash];
  return v6 ^ [(SISchemaUUID *)self->_aceViewId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  NSUInteger v5 = [(TTSSchemaTTSClientEventMetadata *)self ttsId];
  unint64_t v6 = [v4 ttsId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(TTSSchemaTTSClientEventMetadata *)self ttsId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(TTSSchemaTTSClientEventMetadata *)self ttsId];
    v10 = [v4 ttsId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(TTSSchemaTTSClientEventMetadata *)self requestId];
  unint64_t v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(TTSSchemaTTSClientEventMetadata *)self requestId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(TTSSchemaTTSClientEventMetadata *)self requestId];
    v15 = [v4 requestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(TTSSchemaTTSClientEventMetadata *)self clientId];
  unint64_t v6 = [v4 clientId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(TTSSchemaTTSClientEventMetadata *)self clientId];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    objc_super v19 = [(TTSSchemaTTSClientEventMetadata *)self clientId];
    v20 = [v4 clientId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(TTSSchemaTTSClientEventMetadata *)self subRequestId];
  unint64_t v6 = [v4 subRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(TTSSchemaTTSClientEventMetadata *)self subRequestId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(TTSSchemaTTSClientEventMetadata *)self subRequestId];
    v25 = [v4 subRequestId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(TTSSchemaTTSClientEventMetadata *)self aceViewId];
  unint64_t v6 = [v4 aceViewId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(TTSSchemaTTSClientEventMetadata *)self aceViewId];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(TTSSchemaTTSClientEventMetadata *)self aceViewId];
    v30 = [v4 aceViewId];
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
  id v13 = a3;
  id v4 = [(TTSSchemaTTSClientEventMetadata *)self ttsId];

  if (v4)
  {
    NSUInteger v5 = [(TTSSchemaTTSClientEventMetadata *)self ttsId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(TTSSchemaTTSClientEventMetadata *)self requestId];

  if (v6)
  {
    uint64_t v7 = [(TTSSchemaTTSClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(TTSSchemaTTSClientEventMetadata *)self clientId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(TTSSchemaTTSClientEventMetadata *)self subRequestId];

  if (v9)
  {
    v10 = [(TTSSchemaTTSClientEventMetadata *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(TTSSchemaTTSClientEventMetadata *)self aceViewId];

  if (v11)
  {
    uint64_t v12 = [(TTSSchemaTTSClientEventMetadata *)self aceViewId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteAceViewId
{
}

- (BOOL)hasAceViewId
{
  return self->_aceViewId != 0;
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteClientId
{
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (void)deleteRequestId
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteTtsId
{
}

- (BOOL)hasTtsId
{
  return self->_ttsId != 0;
}

@end