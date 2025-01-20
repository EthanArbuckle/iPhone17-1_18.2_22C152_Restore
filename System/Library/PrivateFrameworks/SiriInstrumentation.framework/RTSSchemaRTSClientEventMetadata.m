@interface RTSSchemaRTSClientEventMetadata
- (BOOL)hasRtsSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RTSSchemaRTSClientEventMetadata)initWithDictionary:(id)a3;
- (RTSSchemaRTSClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)rtsSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteRtsSessionId;
- (void)setHasRtsSessionId:(BOOL)a3;
- (void)setRtsSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RTSSchemaRTSClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RTSSchemaRTSClientEventMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(RTSSchemaRTSClientEventMetadata *)self rtsSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(RTSSchemaRTSClientEventMetadata *)self deleteRtsSessionId];
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
}

- (void)setHasRtsSessionId:(BOOL)a3
{
  self->_hasRtsSessionId = a3;
}

- (void)setRtsSessionId:(id)a3
{
}

- (SISchemaUUID)rtsSessionId
{
  return self->_rtsSessionId;
}

- (RTSSchemaRTSClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTSSchemaRTSClientEventMetadata;
  v5 = [(RTSSchemaRTSClientEventMetadata *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rtsSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(RTSSchemaRTSClientEventMetadata *)v5 setRtsSessionId:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (RTSSchemaRTSClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RTSSchemaRTSClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RTSSchemaRTSClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_rtsSessionId)
  {
    id v4 = [(RTSSchemaRTSClientEventMetadata *)self rtsSessionId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"rtsSessionId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"rtsSessionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(SISchemaUUID *)self->_rtsSessionId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(RTSSchemaRTSClientEventMetadata *)self rtsSessionId];
    v6 = [v4 rtsSessionId];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(RTSSchemaRTSClientEventMetadata *)self rtsSessionId];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(RTSSchemaRTSClientEventMetadata *)self rtsSessionId];
      v11 = [v4 rtsSessionId];
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
  id v6 = a3;
  id v4 = [(RTSSchemaRTSClientEventMetadata *)self rtsSessionId];

  if (v4)
  {
    v5 = [(RTSSchemaRTSClientEventMetadata *)self rtsSessionId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RTSSchemaRTSClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteRtsSessionId
{
}

- (BOOL)hasRtsSessionId
{
  return self->_rtsSessionId != 0;
}

@end