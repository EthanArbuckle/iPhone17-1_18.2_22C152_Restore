@interface CAMSchemaCAMModelId
- (BOOL)hasModelName;
- (BOOL)hasModelVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAMSchemaCAMModelId)initWithDictionary:(id)a3;
- (CAMSchemaCAMModelId)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)modelName;
- (SISchemaVersion)modelVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteModelName;
- (void)deleteModelVersion;
- (void)setHasModelName:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setModelName:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAMSchemaCAMModelId

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMSchemaCAMModelId;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CAMSchemaCAMModelId *)self modelVersion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CAMSchemaCAMModelId *)self deleteModelVersion];
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
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void)setHasModelName:(BOOL)a3
{
  self->_hasModelName = a3;
}

- (void)setModelVersion:(id)a3
{
}

- (SISchemaVersion)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (CAMSchemaCAMModelId)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMSchemaCAMModelId;
  v5 = [(CAMSchemaCAMModelId *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(CAMSchemaCAMModelId *)v5 setModelName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaVersion alloc] initWithDictionary:v8];
      [(CAMSchemaCAMModelId *)v5 setModelVersion:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (CAMSchemaCAMModelId)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAMSchemaCAMModelId *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAMSchemaCAMModelId *)self dictionaryRepresentation];
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
  if (self->_modelName)
  {
    id v4 = [(CAMSchemaCAMModelId *)self modelName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"modelName"];
  }
  if (self->_modelVersion)
  {
    v6 = [(CAMSchemaCAMModelId *)self modelVersion];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"modelVersion"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelName hash];
  return [(SISchemaVersion *)self->_modelVersion hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(CAMSchemaCAMModelId *)self modelName];
  v6 = [v4 modelName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(CAMSchemaCAMModelId *)self modelName];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(CAMSchemaCAMModelId *)self modelName];
    v10 = [v4 modelName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(CAMSchemaCAMModelId *)self modelVersion];
  v6 = [v4 modelVersion];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(CAMSchemaCAMModelId *)self modelVersion];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(CAMSchemaCAMModelId *)self modelVersion];
    v15 = [v4 modelVersion];
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
  id v7 = a3;
  id v4 = [(CAMSchemaCAMModelId *)self modelName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(CAMSchemaCAMModelId *)self modelVersion];

  if (v5)
  {
    v6 = [(CAMSchemaCAMModelId *)self modelVersion];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMModelIdReadFrom(self, (uint64_t)a3);
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (void)deleteModelName
{
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

@end