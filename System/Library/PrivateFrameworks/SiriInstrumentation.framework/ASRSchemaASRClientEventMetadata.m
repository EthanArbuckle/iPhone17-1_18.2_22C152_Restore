@interface ASRSchemaASRClientEventMetadata
- (ASRSchemaASRClientEventMetadata)initWithDictionary:(id)a3;
- (ASRSchemaASRClientEventMetadata)initWithJSON:(id)a3;
- (BOOL)hasAsrId;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)asrId;
- (SISchemaUUID)requestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAsrId;
- (void)deleteRequestId;
- (void)setAsrId:(id)a3;
- (void)setHasAsrId:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASRSchemaASRClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRClientEventMetadata *)self asrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ASRSchemaASRClientEventMetadata *)self deleteAsrId];
  }
  v9 = [(ASRSchemaASRClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ASRSchemaASRClientEventMetadata *)self deleteRequestId];
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
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasAsrId:(BOOL)a3
{
  self->_hasAsrId = a3;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setAsrId:(id)a3
{
}

- (SISchemaUUID)asrId
{
  return self->_asrId;
}

- (ASRSchemaASRClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASRSchemaASRClientEventMetadata;
  v5 = [(ASRSchemaASRClientEventMetadata *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRClientEventMetadata *)v5 setAsrId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ASRSchemaASRClientEventMetadata *)v5 setRequestId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (ASRSchemaASRClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_asrId)
  {
    id v4 = [(ASRSchemaASRClientEventMetadata *)self asrId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asrId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asrId"];
    }
  }
  if (self->_requestId)
  {
    uint64_t v7 = [(ASRSchemaASRClientEventMetadata *)self requestId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"requestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"requestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_asrId hash];
  return [(SISchemaUUID *)self->_requestId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ASRSchemaASRClientEventMetadata *)self asrId];
  v6 = [v4 asrId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(ASRSchemaASRClientEventMetadata *)self asrId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ASRSchemaASRClientEventMetadata *)self asrId];
    v10 = [v4 asrId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRClientEventMetadata *)self requestId];
  v6 = [v4 requestId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(ASRSchemaASRClientEventMetadata *)self requestId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(ASRSchemaASRClientEventMetadata *)self requestId];
    v15 = [v4 requestId];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(ASRSchemaASRClientEventMetadata *)self asrId];

  if (v4)
  {
    v5 = [(ASRSchemaASRClientEventMetadata *)self asrId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ASRSchemaASRClientEventMetadata *)self requestId];

  if (v6)
  {
    uint64_t v7 = [(ASRSchemaASRClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteRequestId
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteAsrId
{
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

@end