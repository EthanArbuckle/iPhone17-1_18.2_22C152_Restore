@interface TTMSchemaTTMClientEventMetadata
- (BOOL)hasTrpId;
- (BOOL)hasTtmId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)trpId;
- (SISchemaUUID)ttmId;
- (TTMSchemaTTMClientEventMetadata)initWithDictionary:(id)a3;
- (TTMSchemaTTMClientEventMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteTrpId;
- (void)deleteTtmId;
- (void)setHasTrpId:(BOOL)a3;
- (void)setHasTtmId:(BOOL)a3;
- (void)setTrpId:(id)a3;
- (void)setTtmId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTMSchemaTTMClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(TTMSchemaTTMClientEventMetadata *)self ttmId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(TTMSchemaTTMClientEventMetadata *)self deleteTtmId];
  }
  v9 = [(TTMSchemaTTMClientEventMetadata *)self trpId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(TTMSchemaTTMClientEventMetadata *)self deleteTrpId];
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
  objc_storeStrong((id *)&self->_ttmId, 0);
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void)setHasTtmId:(BOOL)a3
{
  self->_hasTtmId = a3;
}

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTtmId:(id)a3
{
}

- (SISchemaUUID)ttmId
{
  return self->_ttmId;
}

- (TTMSchemaTTMClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TTMSchemaTTMClientEventMetadata;
  v5 = [(TTMSchemaTTMClientEventMetadata *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ttmId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(TTMSchemaTTMClientEventMetadata *)v5 setTtmId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(TTMSchemaTTMClientEventMetadata *)v5 setTrpId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (TTMSchemaTTMClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_trpId)
  {
    id v4 = [(TTMSchemaTTMClientEventMetadata *)self trpId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"trpId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"trpId"];
    }
  }
  if (self->_ttmId)
  {
    uint64_t v7 = [(TTMSchemaTTMClientEventMetadata *)self ttmId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ttmId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ttmId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ttmId hash];
  return [(SISchemaUUID *)self->_trpId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(TTMSchemaTTMClientEventMetadata *)self ttmId];
  v6 = [v4 ttmId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(TTMSchemaTTMClientEventMetadata *)self ttmId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(TTMSchemaTTMClientEventMetadata *)self ttmId];
    v10 = [v4 ttmId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(TTMSchemaTTMClientEventMetadata *)self trpId];
  v6 = [v4 trpId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(TTMSchemaTTMClientEventMetadata *)self trpId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(TTMSchemaTTMClientEventMetadata *)self trpId];
    v15 = [v4 trpId];
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
  id v4 = [(TTMSchemaTTMClientEventMetadata *)self ttmId];

  if (v4)
  {
    v5 = [(TTMSchemaTTMClientEventMetadata *)self ttmId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(TTMSchemaTTMClientEventMetadata *)self trpId];

  if (v6)
  {
    uint64_t v7 = [(TTMSchemaTTMClientEventMetadata *)self trpId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTtmId
{
}

- (BOOL)hasTtmId
{
  return self->_ttmId != 0;
}

@end