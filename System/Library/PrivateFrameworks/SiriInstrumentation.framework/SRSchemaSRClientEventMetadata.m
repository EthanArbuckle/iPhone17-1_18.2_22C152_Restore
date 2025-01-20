@interface SRSchemaSRClientEventMetadata
- (BOOL)hasRequestId;
- (BOOL)hasSrId;
- (BOOL)hasSubRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)requestId;
- (SISchemaUUID)srId;
- (SISchemaUUID)subRequestId;
- (SRSchemaSRClientEventMetadata)initWithDictionary:(id)a3;
- (SRSchemaSRClientEventMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteRequestId;
- (void)deleteSrId;
- (void)deleteSubRequestId;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasSrId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)setSrId:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SRSchemaSRClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SRSchemaSRClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(SRSchemaSRClientEventMetadata *)self srId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SRSchemaSRClientEventMetadata *)self deleteSrId];
  }
  v9 = [(SRSchemaSRClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SRSchemaSRClientEventMetadata *)self deleteRequestId];
  }
  v12 = [(SRSchemaSRClientEventMetadata *)self subRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SRSchemaSRClientEventMetadata *)self deleteSubRequestId];
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
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_srId, 0);
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasSrId:(BOOL)a3
{
  self->_hasSrId = a3;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setSrId:(id)a3
{
}

- (SISchemaUUID)srId
{
  return self->_srId;
}

- (SRSchemaSRClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SRSchemaSRClientEventMetadata;
  v5 = [(SRSchemaSRClientEventMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"srId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(SRSchemaSRClientEventMetadata *)v5 setSrId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(SRSchemaSRClientEventMetadata *)v5 setRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(SRSchemaSRClientEventMetadata *)v5 setSubRequestId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (SRSchemaSRClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SRSchemaSRClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SRSchemaSRClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_requestId)
  {
    id v4 = [(SRSchemaSRClientEventMetadata *)self requestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"requestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"requestId"];
    }
  }
  if (self->_srId)
  {
    uint64_t v7 = [(SRSchemaSRClientEventMetadata *)self srId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"srId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"srId"];
    }
  }
  if (self->_subRequestId)
  {
    v10 = [(SRSchemaSRClientEventMetadata *)self subRequestId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"subRequestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_srId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_requestId hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_subRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(SRSchemaSRClientEventMetadata *)self srId];
  v6 = [v4 srId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SRSchemaSRClientEventMetadata *)self srId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SRSchemaSRClientEventMetadata *)self srId];
    v10 = [v4 srId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SRSchemaSRClientEventMetadata *)self requestId];
  v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(SRSchemaSRClientEventMetadata *)self requestId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(SRSchemaSRClientEventMetadata *)self requestId];
    v15 = [v4 requestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(SRSchemaSRClientEventMetadata *)self subRequestId];
  v6 = [v4 subRequestId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(SRSchemaSRClientEventMetadata *)self subRequestId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(SRSchemaSRClientEventMetadata *)self subRequestId];
    v20 = [v4 subRequestId];
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
  id v4 = [(SRSchemaSRClientEventMetadata *)self srId];

  if (v4)
  {
    v5 = [(SRSchemaSRClientEventMetadata *)self srId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SRSchemaSRClientEventMetadata *)self requestId];

  if (v6)
  {
    uint64_t v7 = [(SRSchemaSRClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(SRSchemaSRClientEventMetadata *)self subRequestId];

  if (v8)
  {
    v9 = [(SRSchemaSRClientEventMetadata *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SRSchemaSRClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteRequestId
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteSrId
{
}

- (BOOL)hasSrId
{
  return self->_srId != 0;
}

@end