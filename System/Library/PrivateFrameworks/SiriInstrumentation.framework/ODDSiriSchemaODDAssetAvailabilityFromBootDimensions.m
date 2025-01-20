@interface ODDSiriSchemaODDAssetAvailabilityFromBootDimensions
- (BOOL)hasAssetSetId;
- (BOOL)hasAssetSetName;
- (BOOL)hasAssistantDimensions;
- (BOOL)hasBuildInstallationTimestampInSecondsSince1970;
- (BOOL)hasPreviousSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)assetSetId;
- (NSString)assetSetName;
- (NSString)previousSystemBuild;
- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)initWithJSON:(id)a3;
- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)buildInstallationTimestampInSecondsSince1970;
- (unint64_t)hash;
- (void)deleteAssetSetId;
- (void)deleteAssetSetName;
- (void)deleteAssistantDimensions;
- (void)deleteBuildInstallationTimestampInSecondsSince1970;
- (void)deletePreviousSystemBuild;
- (void)setAssetSetId:(id)a3;
- (void)setAssetSetName:(id)a3;
- (void)setAssistantDimensions:(id)a3;
- (void)setBuildInstallationTimestampInSecondsSince1970:(unint64_t)a3;
- (void)setHasAssetSetId:(BOOL)a3;
- (void)setHasAssetSetName:(BOOL)a3;
- (void)setHasAssistantDimensions:(BOOL)a3;
- (void)setHasBuildInstallationTimestampInSecondsSince1970:(BOOL)a3;
- (void)setHasPreviousSystemBuild:(BOOL)a3;
- (void)setPreviousSystemBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssetAvailabilityFromBootDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assistantDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self deleteAssistantDimensions];
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
  objc_storeStrong((id *)&self->_previousSystemBuild, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_assetSetId, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

- (void)setHasPreviousSystemBuild:(BOOL)a3
{
  self->_hasAssistantDimensions = a3;
}

- (void)setHasAssetSetName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAssetSetId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
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

- (void)setAssetSetName:(id)a3
{
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetId:(id)a3
{
}

- (NSString)assetSetId
{
  return self->_assetSetId;
}

- (void)setAssistantDimensions:(id)a3
{
}

- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions
{
  return self->_assistantDimensions;
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDAssetAvailabilityFromBootDimensions;
  v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assistantDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAssistantDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)v5 setAssistantDimensions:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"assetSetId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)v5 setAssetSetId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"assetSetName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)v5 setAssetSetName:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"previousSystemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)v5 setPreviousSystemBuild:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", [v14 unsignedLongLongValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssetAvailabilityFromBootDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self dictionaryRepresentation];
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
  if (self->_assetSetId)
  {
    id v4 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetSetId"];
  }
  if (self->_assetSetName)
  {
    v6 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"assetSetName"];
  }
  if (self->_assistantDimensions)
  {
    v8 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assistantDimensions];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"assistantDimensions"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"assistantDimensions"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDAssetAvailabilityFromBootDimensions buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    [v3 setObject:v11 forKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
  }
  if (self->_previousSystemBuild)
  {
    v12 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self previousSystemBuild];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"previousSystemBuild"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDAssistantDimensions *)self->_assistantDimensions hash];
  NSUInteger v4 = [(NSString *)self->_assetSetId hash];
  NSUInteger v5 = [(NSString *)self->_assetSetName hash];
  NSUInteger v6 = [(NSString *)self->_previousSystemBuild hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_buildInstallationTimestampInSecondsSince1970;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assistantDimensions];
  NSUInteger v6 = [v4 assistantDimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assistantDimensions];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assistantDimensions];
    v10 = [v4 assistantDimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetId];
  NSUInteger v6 = [v4 assetSetId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetId];
    v15 = [v4 assetSetId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetName];
  NSUInteger v6 = [v4 assetSetName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetName];
    v20 = [v4 assetSetName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self previousSystemBuild];
  NSUInteger v6 = [v4 previousSystemBuild];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self previousSystemBuild];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self previousSystemBuild];
    v25 = [v4 previousSystemBuild];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[48] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (unint64_t buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970,
          buildInstallationTimestampInSecondsSince1970 == [v4 buildInstallationTimestampInSecondsSince1970]))
    {
      BOOL v27 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assistantDimensions];

  if (v4)
  {
    NSUInteger v5 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assistantDimensions];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v6 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self assetSetName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  v8 = [(ODDSiriSchemaODDAssetAvailabilityFromBootDimensions *)self previousSystemBuild];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  objc_super v9 = v10;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    objc_super v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssetAvailabilityFromBootDimensionsReadFrom(self, (uint64_t)a3);
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

- (void)deleteAssetSetName
{
}

- (BOOL)hasAssetSetName
{
  return self->_assetSetName != 0;
}

- (void)deleteAssetSetId
{
}

- (BOOL)hasAssetSetId
{
  return self->_assetSetId != 0;
}

- (void)deleteAssistantDimensions
{
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

@end