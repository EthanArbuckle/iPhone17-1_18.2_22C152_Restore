@interface ODDSiriSchemaODDAssetSetStatusDimensions
- (BOOL)hasAssetSetStatus;
- (BOOL)hasAssistantDimensions;
- (BOOL)hasBuildInstallationTimestampInSecondsSince1970;
- (BOOL)hasPreviousSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)previousSystemBuild;
- (ODDSiriSchemaODDAssetSetStatusDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssetSetStatusDimensions)initWithJSON:(id)a3;
- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions;
- (UAFSchemaUAFAssetSetStatus)assetSetStatus;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)buildInstallationTimestampInSecondsSince1970;
- (unint64_t)hash;
- (void)deleteAssetSetStatus;
- (void)deleteAssistantDimensions;
- (void)deleteBuildInstallationTimestampInSecondsSince1970;
- (void)deletePreviousSystemBuild;
- (void)setAssetSetStatus:(id)a3;
- (void)setAssistantDimensions:(id)a3;
- (void)setBuildInstallationTimestampInSecondsSince1970:(unint64_t)a3;
- (void)setHasAssetSetStatus:(BOOL)a3;
- (void)setHasAssistantDimensions:(BOOL)a3;
- (void)setHasBuildInstallationTimestampInSecondsSince1970:(BOOL)a3;
- (void)setHasPreviousSystemBuild:(BOOL)a3;
- (void)setPreviousSystemBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssetSetStatusDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ODDSiriSchemaODDAssetSetStatusDimensions;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assistantDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDAssetSetStatusDimensions *)self deleteAssistantDimensions];
  }
  v9 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assetSetStatus];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDAssetSetStatusDimensions *)self deleteAssetSetStatus];
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
  objc_storeStrong((id *)&self->_assetSetStatus, 0);
  objc_storeStrong((id *)&self->_previousSystemBuild, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

- (void)setHasAssetSetStatus:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasPreviousSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAssetSetStatus:(id)a3
{
}

- (UAFSchemaUAFAssetSetStatus)assetSetStatus
{
  return self->_assetSetStatus;
}

- (unint64_t)buildInstallationTimestampInSecondsSince1970
{
  return self->_buildInstallationTimestampInSecondsSince1970;
}

- (void)setPreviousSystemBuild:(id)a3
{
}

- (NSString)previousSystemBuild
{
  return self->_previousSystemBuild;
}

- (void)setAssistantDimensions:(id)a3
{
}

- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions
{
  return self->_assistantDimensions;
}

- (ODDSiriSchemaODDAssetSetStatusDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDAssetSetStatusDimensions;
  v5 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assistantDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAssistantDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssetSetStatusDimensions *)v5 setAssistantDimensions:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"previousSystemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ODDSiriSchemaODDAssetSetStatusDimensions *)v5 setPreviousSystemBuild:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssetSetStatusDimensions setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", [v10 unsignedLongLongValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"assetSetStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[UAFSchemaUAFAssetSetStatus alloc] initWithDictionary:v11];
      [(ODDSiriSchemaODDAssetSetStatusDimensions *)v5 setAssetSetStatus:v12];
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssetSetStatusDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self dictionaryRepresentation];
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
  if (self->_assetSetStatus)
  {
    id v4 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assetSetStatus];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assetSetStatus"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assetSetStatus"];
    }
  }
  if (self->_assistantDimensions)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assistantDimensions];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"assistantDimensions"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"assistantDimensions"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDAssetSetStatusDimensions buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    [v3 setObject:v10 forKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
  }
  if (self->_previousSystemBuild)
  {
    int v11 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self previousSystemBuild];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"previousSystemBuild"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDAssistantDimensions *)self->_assistantDimensions hash];
  NSUInteger v4 = [(NSString *)self->_previousSystemBuild hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_buildInstallationTimestampInSecondsSince1970;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(UAFSchemaUAFAssetSetStatus *)self->_assetSetStatus hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assistantDimensions];
  v6 = [v4 assistantDimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assistantDimensions];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assistantDimensions];
    v10 = [v4 assistantDimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self previousSystemBuild];
  v6 = [v4 previousSystemBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self previousSystemBuild];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self previousSystemBuild];
    objc_super v15 = [v4 previousSystemBuild];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970;
    if (buildInstallationTimestampInSecondsSince1970 != [v4 buildInstallationTimestampInSecondsSince1970])goto LABEL_20; {
  }
    }
  unint64_t v5 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assetSetStatus];
  v6 = [v4 assetSetStatus];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v18 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assetSetStatus];
    if (!v18)
    {

LABEL_23:
      BOOL v23 = 1;
      goto LABEL_21;
    }
    v19 = (void *)v18;
    v20 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assetSetStatus];
    v21 = [v4 assetSetStatus];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assistantDimensions];

  if (v4)
  {
    unint64_t v5 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assistantDimensions];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self previousSystemBuild];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assetSetStatus];

  int v8 = v10;
  if (v7)
  {
    v9 = [(ODDSiriSchemaODDAssetSetStatusDimensions *)self assetSetStatus];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssetSetStatusDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetSetStatus
{
}

- (BOOL)hasAssetSetStatus
{
  return self->_assetSetStatus != 0;
}

- (void)deleteBuildInstallationTimestampInSecondsSince1970
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBuildInstallationTimestampInSecondsSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBuildInstallationTimestampInSecondsSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBuildInstallationTimestampInSecondsSince1970:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t buildInstallationTimestampInSecondsSince1970 = a3;
}

- (void)deletePreviousSystemBuild
{
}

- (BOOL)hasPreviousSystemBuild
{
  return self->_previousSystemBuild != 0;
}

- (void)deleteAssistantDimensions
{
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

@end