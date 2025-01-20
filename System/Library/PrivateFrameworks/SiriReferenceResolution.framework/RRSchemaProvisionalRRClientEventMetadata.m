@interface RRSchemaProvisionalRRClientEventMetadata
- (BOOL)hasRequestId;
- (BOOL)hasRrID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RRSchemaProvisionalRRClientEventMetadata)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRRClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)requestId;
- (SISchemaUUID)rrID;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasRrID:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)setRrID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaProvisionalRRClientEventMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_rrID, 0);
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasRrID:(BOOL)a3
{
  self->_hasRrID = a3;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setRrID:(id)a3
{
}

- (SISchemaUUID)rrID
{
  return self->_rrID;
}

- (RRSchemaProvisionalRRClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RRSchemaProvisionalRRClientEventMetadata;
  v5 = [(RRSchemaProvisionalRRClientEventMetadata *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rrID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithDictionary:v6];
      [(RRSchemaProvisionalRRClientEventMetadata *)v5 setRrID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithDictionary:v8];
      [(RRSchemaProvisionalRRClientEventMetadata *)v5 setRequestId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRRClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRRClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRRClientEventMetadata *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_requestId)
  {
    id v4 = [(RRSchemaProvisionalRRClientEventMetadata *)self requestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"requestId"];
    }
    else
    {
      v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"requestId"];
    }
  }
  if (self->_rrID)
  {
    uint64_t v7 = [(RRSchemaProvisionalRRClientEventMetadata *)self rrID];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"rrID"];
    }
    else
    {
      v9 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v9 forKeyedSubscript:@"rrID"];
    }
  }
  [(RRSchemaProvisionalRRClientEventMetadata *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SISchemaUUID *)self->_rrID hash];
  return [(SISchemaUUID *)self->_requestId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(RRSchemaProvisionalRRClientEventMetadata *)self rrID];
  v6 = [v4 rrID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(RRSchemaProvisionalRRClientEventMetadata *)self rrID];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(RRSchemaProvisionalRRClientEventMetadata *)self rrID];
    v10 = [v4 rrID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(RRSchemaProvisionalRRClientEventMetadata *)self requestId];
  v6 = [v4 requestId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(RRSchemaProvisionalRRClientEventMetadata *)self requestId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(RRSchemaProvisionalRRClientEventMetadata *)self requestId];
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
  id v4 = [(RRSchemaProvisionalRRClientEventMetadata *)self rrID];

  if (v4)
  {
    v5 = [(RRSchemaProvisionalRRClientEventMetadata *)self rrID];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(RRSchemaProvisionalRRClientEventMetadata *)self requestId];

  if (v6)
  {
    uint64_t v7 = [(RRSchemaProvisionalRRClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasRrID
{
  return self->_rrID != 0;
}

@end