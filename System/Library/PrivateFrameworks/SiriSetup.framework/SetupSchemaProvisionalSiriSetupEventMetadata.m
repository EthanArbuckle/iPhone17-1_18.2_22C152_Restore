@interface SetupSchemaProvisionalSiriSetupEventMetadata
- (BOOL)hasSetupId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)setupId;
- (SetupSchemaProvisionalSiriSetupEventMetadata)initWithDictionary:(id)a3;
- (SetupSchemaProvisionalSiriSetupEventMetadata)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteSetupId;
- (void)setHasSetupId:(BOOL)a3;
- (void)setSetupId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SetupSchemaProvisionalSiriSetupEventMetadata

- (BOOL)hasSetupId
{
  return self->_setupId != 0;
}

- (void)deleteSetupId
{
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  v4 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self setupId];

  if (v4)
  {
    v5 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self setupId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self setupId];
    id v6 = [v4 setupId];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self setupId];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self setupId];
      v11 = [v4 setupId];
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

- (unint64_t)hash
{
  return [(SISchemaUUID *)self->_setupId hash];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_setupId)
  {
    id v4 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self setupId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"setupId"];
    }
    else
    {
      id v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"setupId"];
    }
  }
  [(SetupSchemaProvisionalSiriSetupEventMetadata *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  v2 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self dictionaryRepresentation];
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

- (SetupSchemaProvisionalSiriSetupEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SetupSchemaProvisionalSiriSetupEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SetupSchemaProvisionalSiriSetupEventMetadata;
  v5 = [(SetupSchemaProvisionalSiriSetupEventMetadata *)&v10 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"setupId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithDictionary:v6];
      [(SetupSchemaProvisionalSiriSetupEventMetadata *)v5 setSetupId:v7];
    }
    uint64_t v8 = v5;
  }
  return v5;
}

- (SISchemaUUID)setupId
{
  return self->_setupId;
}

- (void)setSetupId:(id)a3
{
}

- (void)setHasSetupId:(BOOL)a3
{
  self->_hasSetupId = a3;
}

- (void).cxx_destruct
{
}

@end