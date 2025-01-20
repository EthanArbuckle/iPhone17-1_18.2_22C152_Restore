@interface NLRouterSchemaNLRouterClientEventMetadata
- (BOOL)hasNlRouterId;
- (BOOL)hasRequestId;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLRouterSchemaNLRouterClientEventMetadata)initWithDictionary:(id)a3;
- (NLRouterSchemaNLRouterClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)nlRouterId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteNlRouterId;
- (void)deleteRequestId;
- (void)deleteTrpId;
- (void)setHasNlRouterId:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setNlRouterId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLRouterSchemaNLRouterClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLRouterSchemaNLRouterClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(NLRouterSchemaNLRouterClientEventMetadata *)self nlRouterId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLRouterSchemaNLRouterClientEventMetadata *)self deleteNlRouterId];
  }
  v9 = [(NLRouterSchemaNLRouterClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLRouterSchemaNLRouterClientEventMetadata *)self deleteRequestId];
  }
  v12 = [(NLRouterSchemaNLRouterClientEventMetadata *)self trpId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLRouterSchemaNLRouterClientEventMetadata *)self deleteTrpId];
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
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_nlRouterId, 0);
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasNlRouterId:(BOOL)a3
{
  self->_hasNlRouterId = a3;
}

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setNlRouterId:(id)a3
{
}

- (SISchemaUUID)nlRouterId
{
  return self->_nlRouterId;
}

- (NLRouterSchemaNLRouterClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLRouterSchemaNLRouterClientEventMetadata;
  v5 = [(NLRouterSchemaNLRouterClientEventMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"nlRouterId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLRouterSchemaNLRouterClientEventMetadata *)v5 setNlRouterId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(NLRouterSchemaNLRouterClientEventMetadata *)v5 setRequestId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(NLRouterSchemaNLRouterClientEventMetadata *)v5 setTrpId:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (NLRouterSchemaNLRouterClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLRouterSchemaNLRouterClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLRouterSchemaNLRouterClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_nlRouterId)
  {
    id v4 = [(NLRouterSchemaNLRouterClientEventMetadata *)self nlRouterId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"nlRouterId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"nlRouterId"];
    }
  }
  if (self->_requestId)
  {
    uint64_t v7 = [(NLRouterSchemaNLRouterClientEventMetadata *)self requestId];
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
  if (self->_trpId)
  {
    v10 = [(NLRouterSchemaNLRouterClientEventMetadata *)self trpId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"trpId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_nlRouterId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_requestId hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_trpId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(NLRouterSchemaNLRouterClientEventMetadata *)self nlRouterId];
  v6 = [v4 nlRouterId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(NLRouterSchemaNLRouterClientEventMetadata *)self nlRouterId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(NLRouterSchemaNLRouterClientEventMetadata *)self nlRouterId];
    v10 = [v4 nlRouterId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(NLRouterSchemaNLRouterClientEventMetadata *)self requestId];
  v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(NLRouterSchemaNLRouterClientEventMetadata *)self requestId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(NLRouterSchemaNLRouterClientEventMetadata *)self requestId];
    v15 = [v4 requestId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(NLRouterSchemaNLRouterClientEventMetadata *)self trpId];
  v6 = [v4 trpId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(NLRouterSchemaNLRouterClientEventMetadata *)self trpId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(NLRouterSchemaNLRouterClientEventMetadata *)self trpId];
    v20 = [v4 trpId];
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
  id v4 = [(NLRouterSchemaNLRouterClientEventMetadata *)self nlRouterId];

  if (v4)
  {
    v5 = [(NLRouterSchemaNLRouterClientEventMetadata *)self nlRouterId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLRouterSchemaNLRouterClientEventMetadata *)self requestId];

  if (v6)
  {
    uint64_t v7 = [(NLRouterSchemaNLRouterClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(NLRouterSchemaNLRouterClientEventMetadata *)self trpId];

  if (v8)
  {
    v9 = [(NLRouterSchemaNLRouterClientEventMetadata *)self trpId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLRouterSchemaNLRouterClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteRequestId
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteNlRouterId
{
}

- (BOOL)hasNlRouterId
{
  return self->_nlRouterId != 0;
}

@end