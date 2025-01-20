@interface ODDSiriSchemaODDRequestsWithoutAssetsDimensions
- (BOOL)hasAssetSetId;
- (BOOL)hasAssetSetName;
- (BOOL)hasAssistantDimensions;
- (BOOL)hasBuildInstallationTimestampInSecondsSince1970;
- (BOOL)hasPreviousSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)assetFailureReasons;
- (NSData)jsonData;
- (NSString)assetSetId;
- (NSString)assetSetName;
- (NSString)previousSystemBuild;
- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions;
- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)assetFailureReasonAtIndex:(unint64_t)a3;
- (unint64_t)assetFailureReasonCount;
- (unint64_t)buildInstallationTimestampInSecondsSince1970;
- (unint64_t)hash;
- (void)addAssetFailureReason:(int)a3;
- (void)clearAssetFailureReason;
- (void)deleteAssetSetId;
- (void)deleteAssetSetName;
- (void)deleteAssistantDimensions;
- (void)deleteBuildInstallationTimestampInSecondsSince1970;
- (void)deletePreviousSystemBuild;
- (void)setAssetFailureReasons:(id)a3;
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

@implementation ODDSiriSchemaODDRequestsWithoutAssetsDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assistantDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self deleteAssistantDimensions];
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
  objc_storeStrong((id *)&self->_assetFailureReasons, 0);
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

- (void)setAssetFailureReasons:(id)a3
{
}

- (NSArray)assetFailureReasons
{
  return self->_assetFailureReasons;
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

- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ODDSiriSchemaODDRequestsWithoutAssetsDimensions;
  v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)&v32 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assistantDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAssistantDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)v5 setAssistantDimensions:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"assetSetId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)v5 setAssetSetId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"assetSetName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)v5 setAssetSetName:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"previousSystemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)v5 setPreviousSystemBuild:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions setBuildInstallationTimestampInSecondsSince1970:](v5, "setBuildInstallationTimestampInSecondsSince1970:", [v14 unsignedLongLongValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"assetFailureReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v12;
      v25 = v10;
      v26 = v8;
      v27 = v6;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v29;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions addAssetFailureReason:](v5, "addAssetFailureReason:", [v21 intValue]);
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v18);
      }

      v8 = v26;
      v6 = v27;
      v12 = v24;
      v10 = v25;
    }
    v22 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDRequestsWithoutAssetsDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_assetFailureReasons count])
  {
    id v4 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetFailureReasons];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetFailureReason"];
  }
  if (self->_assetSetId)
  {
    v6 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"assetSetId"];
  }
  if (self->_assetSetName)
  {
    v8 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetName];
    objc_super v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"assetSetName"];
  }
  if (self->_assistantDimensions)
  {
    v10 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assistantDimensions];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"assistantDimensions"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"assistantDimensions"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDRequestsWithoutAssetsDimensions buildInstallationTimestampInSecondsSince1970](self, "buildInstallationTimestampInSecondsSince1970"));
    [v3 setObject:v13 forKeyedSubscript:@"buildInstallationTimestampInSecondsSince1970"];
  }
  if (self->_previousSystemBuild)
  {
    v14 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self previousSystemBuild];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"previousSystemBuild"];
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSArray *)self->_assetFailureReasons hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  NSUInteger v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assistantDimensions];
  NSUInteger v6 = [v4 assistantDimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assistantDimensions];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assistantDimensions];
    v10 = [v4 assistantDimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetId];
  NSUInteger v6 = [v4 assetSetId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetId];
    v15 = [v4 assetSetId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetName];
  NSUInteger v6 = [v4 assetSetName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v17 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetName];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetName];
    uint64_t v20 = [v4 assetSetName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self previousSystemBuild];
  NSUInteger v6 = [v4 previousSystemBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v22 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self previousSystemBuild];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self previousSystemBuild];
    v25 = [v4 previousSystemBuild];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t buildInstallationTimestampInSecondsSince1970 = self->_buildInstallationTimestampInSecondsSince1970;
    if (buildInstallationTimestampInSecondsSince1970 != [v4 buildInstallationTimestampInSecondsSince1970])goto LABEL_30; {
  }
    }
  NSUInteger v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetFailureReasons];
  NSUInteger v6 = [v4 assetFailureReasons];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetFailureReasons];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    long long v29 = (void *)v28;
    long long v30 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetFailureReasons];
    long long v31 = [v4 assetFailureReasons];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v33 = 0;
LABEL_31:

  return v33;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assistantDimensions];

  if (v5)
  {
    NSUInteger v6 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assistantDimensions];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  v8 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self assetSetName];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  objc_super v9 = [(ODDSiriSchemaODDRequestsWithoutAssetsDimensions *)self previousSystemBuild];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_assetFailureReasons;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "intValue", (void)v15);
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDRequestsWithoutAssetsDimensionsReadFrom(self, (uint64_t)a3);
}

- (int)assetFailureReasonAtIndex:(unint64_t)a3
{
  unint64_t v3 = [(NSArray *)self->_assetFailureReasons objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)assetFailureReasonCount
{
  return [(NSArray *)self->_assetFailureReasons count];
}

- (void)addAssetFailureReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  assetFailureReasons = self->_assetFailureReasons;
  if (!assetFailureReasons)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_assetFailureReasons;
    self->_assetFailureReasons = v6;

    assetFailureReasons = self->_assetFailureReasons;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)assetFailureReasons addObject:v8];
}

- (void)clearAssetFailureReason
{
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