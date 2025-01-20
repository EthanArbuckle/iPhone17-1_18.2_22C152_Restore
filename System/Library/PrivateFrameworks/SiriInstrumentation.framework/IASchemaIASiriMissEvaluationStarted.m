@interface IASchemaIASiriMissEvaluationStarted
- (BOOL)hasAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IASchemaIASiriMissEvaluationStarted)initWithDictionary:(id)a3;
- (IASchemaIASiriMissEvaluationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)assetVersion;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAssetVersion;
- (void)setAssetVersion:(id)a3;
- (void)setHasAssetVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IASchemaIASiriMissEvaluationStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAssetVersion:(BOOL)a3
{
  self->_hasAssetVersion = a3;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (IASchemaIASiriMissEvaluationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IASchemaIASiriMissEvaluationStarted;
  v5 = [(IASchemaIASiriMissEvaluationStarted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IASchemaIASiriMissEvaluationStarted *)v5 setAssetVersion:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (IASchemaIASiriMissEvaluationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IASchemaIASiriMissEvaluationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IASchemaIASiriMissEvaluationStarted *)self dictionaryRepresentation];
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
  if (self->_assetVersion)
  {
    id v4 = [(IASchemaIASiriMissEvaluationStarted *)self assetVersion];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_assetVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(IASchemaIASiriMissEvaluationStarted *)self assetVersion];
    v6 = [v4 assetVersion];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(IASchemaIASiriMissEvaluationStarted *)self assetVersion];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(IASchemaIASiriMissEvaluationStarted *)self assetVersion];
      v11 = [v4 assetVersion];
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
  id v5 = a3;
  id v4 = [(IASchemaIASiriMissEvaluationStarted *)self assetVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IASchemaIASiriMissEvaluationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetVersion
{
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

@end