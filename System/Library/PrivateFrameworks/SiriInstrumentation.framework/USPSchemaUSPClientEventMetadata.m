@interface USPSchemaUSPClientEventMetadata
- (BOOL)hasContext;
- (BOOL)hasSutFingerprint;
- (BOOL)hasUspId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)sutFingerprint;
- (SISchemaUUID)uspId;
- (USPSchemaUSPClientEventMetadata)initWithDictionary:(id)a3;
- (USPSchemaUSPClientEventMetadata)initWithJSON:(id)a3;
- (USPSchemaUSPMeasurementContext)context;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteContext;
- (void)deleteSutFingerprint;
- (void)deleteUspId;
- (void)setContext:(id)a3;
- (void)setHasContext:(BOOL)a3;
- (void)setHasSutFingerprint:(BOOL)a3;
- (void)setHasUspId:(BOOL)a3;
- (void)setSutFingerprint:(id)a3;
- (void)setUspId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USPSchemaUSPClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)USPSchemaUSPClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(USPSchemaUSPClientEventMetadata *)self uspId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(USPSchemaUSPClientEventMetadata *)self deleteUspId];
  }
  v9 = [(USPSchemaUSPClientEventMetadata *)self context];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(USPSchemaUSPClientEventMetadata *)self deleteContext];
  }
  v12 = [(USPSchemaUSPClientEventMetadata *)self sutFingerprint];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(USPSchemaUSPClientEventMetadata *)self deleteSutFingerprint];
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
  objc_storeStrong((id *)&self->_sutFingerprint, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uspId, 0);
}

- (void)setHasSutFingerprint:(BOOL)a3
{
  self->_hasSutFingerprint = a3;
}

- (void)setHasContext:(BOOL)a3
{
  self->_hasContext = a3;
}

- (void)setHasUspId:(BOOL)a3
{
  self->_hasUspId = a3;
}

- (void)setSutFingerprint:(id)a3
{
}

- (SISchemaUUID)sutFingerprint
{
  return self->_sutFingerprint;
}

- (void)setContext:(id)a3
{
}

- (USPSchemaUSPMeasurementContext)context
{
  return self->_context;
}

- (void)setUspId:(id)a3
{
}

- (SISchemaUUID)uspId
{
  return self->_uspId;
}

- (USPSchemaUSPClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USPSchemaUSPClientEventMetadata;
  v5 = [(USPSchemaUSPClientEventMetadata *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"uspId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(USPSchemaUSPClientEventMetadata *)v5 setUspId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"context"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[USPSchemaUSPMeasurementContext alloc] initWithDictionary:v8];
      [(USPSchemaUSPClientEventMetadata *)v5 setContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"sutFingerprint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(USPSchemaUSPClientEventMetadata *)v5 setSutFingerprint:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (USPSchemaUSPClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USPSchemaUSPClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USPSchemaUSPClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_context)
  {
    id v4 = [(USPSchemaUSPClientEventMetadata *)self context];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"context"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"context"];
    }
  }
  if (self->_sutFingerprint)
  {
    uint64_t v7 = [(USPSchemaUSPClientEventMetadata *)self sutFingerprint];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"sutFingerprint"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"sutFingerprint"];
    }
  }
  if (self->_uspId)
  {
    v10 = [(USPSchemaUSPClientEventMetadata *)self uspId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"uspId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"uspId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_uspId hash];
  unint64_t v4 = [(USPSchemaUSPMeasurementContext *)self->_context hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_sutFingerprint hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(USPSchemaUSPClientEventMetadata *)self uspId];
  v6 = [v4 uspId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(USPSchemaUSPClientEventMetadata *)self uspId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(USPSchemaUSPClientEventMetadata *)self uspId];
    v10 = [v4 uspId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(USPSchemaUSPClientEventMetadata *)self context];
  v6 = [v4 context];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(USPSchemaUSPClientEventMetadata *)self context];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(USPSchemaUSPClientEventMetadata *)self context];
    v15 = [v4 context];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(USPSchemaUSPClientEventMetadata *)self sutFingerprint];
  v6 = [v4 sutFingerprint];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(USPSchemaUSPClientEventMetadata *)self sutFingerprint];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(USPSchemaUSPClientEventMetadata *)self sutFingerprint];
    v20 = [v4 sutFingerprint];
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
  id v4 = [(USPSchemaUSPClientEventMetadata *)self uspId];

  if (v4)
  {
    v5 = [(USPSchemaUSPClientEventMetadata *)self uspId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(USPSchemaUSPClientEventMetadata *)self context];

  if (v6)
  {
    uint64_t v7 = [(USPSchemaUSPClientEventMetadata *)self context];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(USPSchemaUSPClientEventMetadata *)self sutFingerprint];

  if (v8)
  {
    v9 = [(USPSchemaUSPClientEventMetadata *)self sutFingerprint];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return USPSchemaUSPClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSutFingerprint
{
}

- (BOOL)hasSutFingerprint
{
  return self->_sutFingerprint != 0;
}

- (void)deleteContext
{
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (void)deleteUspId
{
}

- (BOOL)hasUspId
{
  return self->_uspId != 0;
}

@end