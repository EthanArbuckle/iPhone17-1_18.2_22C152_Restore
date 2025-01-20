@interface RGSiriSchemaRGInferenceStarted
- (BOOL)hasModelVersion;
- (BOOL)hasPromptVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (RGSiriSchemaRGInferenceStarted)initWithDictionary:(id)a3;
- (RGSiriSchemaRGInferenceStarted)initWithJSON:(id)a3;
- (SISchemaVersion)modelVersion;
- (SISchemaVersion)promptVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteModelVersion;
- (void)deletePromptVersion;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasPromptVersion:(BOOL)a3;
- (void)setModelVersion:(id)a3;
- (void)setPromptVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RGSiriSchemaRGInferenceStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RGSiriSchemaRGInferenceStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(RGSiriSchemaRGInferenceStarted *)self modelVersion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RGSiriSchemaRGInferenceStarted *)self deleteModelVersion];
  }
  v9 = [(RGSiriSchemaRGInferenceStarted *)self promptVersion];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RGSiriSchemaRGInferenceStarted *)self deletePromptVersion];
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
  objc_storeStrong((id *)&self->_promptVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (void)setHasPromptVersion:(BOOL)a3
{
  self->_hasPromptVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void)setPromptVersion:(id)a3
{
}

- (SISchemaVersion)promptVersion
{
  return self->_promptVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (SISchemaVersion)modelVersion
{
  return self->_modelVersion;
}

- (RGSiriSchemaRGInferenceStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RGSiriSchemaRGInferenceStarted;
  v5 = [(RGSiriSchemaRGInferenceStarted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaVersion alloc] initWithDictionary:v6];
      [(RGSiriSchemaRGInferenceStarted *)v5 setModelVersion:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"promptVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaVersion alloc] initWithDictionary:v8];
      [(RGSiriSchemaRGInferenceStarted *)v5 setPromptVersion:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (RGSiriSchemaRGInferenceStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RGSiriSchemaRGInferenceStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RGSiriSchemaRGInferenceStarted *)self dictionaryRepresentation];
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
  if (self->_modelVersion)
  {
    id v4 = [(RGSiriSchemaRGInferenceStarted *)self modelVersion];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"modelVersion"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"modelVersion"];
    }
  }
  if (self->_promptVersion)
  {
    uint64_t v7 = [(RGSiriSchemaRGInferenceStarted *)self promptVersion];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"promptVersion"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"promptVersion"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaVersion *)self->_modelVersion hash];
  return [(SISchemaVersion *)self->_promptVersion hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(RGSiriSchemaRGInferenceStarted *)self modelVersion];
  v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(RGSiriSchemaRGInferenceStarted *)self modelVersion];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(RGSiriSchemaRGInferenceStarted *)self modelVersion];
    v10 = [v4 modelVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(RGSiriSchemaRGInferenceStarted *)self promptVersion];
  v6 = [v4 promptVersion];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(RGSiriSchemaRGInferenceStarted *)self promptVersion];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(RGSiriSchemaRGInferenceStarted *)self promptVersion];
    v15 = [v4 promptVersion];
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
  id v4 = [(RGSiriSchemaRGInferenceStarted *)self modelVersion];

  if (v4)
  {
    v5 = [(RGSiriSchemaRGInferenceStarted *)self modelVersion];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(RGSiriSchemaRGInferenceStarted *)self promptVersion];

  if (v6)
  {
    uint64_t v7 = [(RGSiriSchemaRGInferenceStarted *)self promptVersion];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return RGSiriSchemaRGInferenceStartedReadFrom(self, (uint64_t)a3);
}

- (void)deletePromptVersion
{
}

- (BOOL)hasPromptVersion
{
  return self->_promptVersion != 0;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

@end