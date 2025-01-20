@interface CLPInstSchemaCLPNLv4TaskEvaluationStarted
- (BOOL)hasEvaluationEnvironment;
- (BOOL)hasEvaluationType;
- (BOOL)hasExperimentType;
- (BOOL)hasIsDebugTask;
- (BOOL)hasNlv4AssetVersion;
- (BOOL)hasNlv4AssetVersionOverride;
- (BOOL)hasRecipeType;
- (BOOL)hasSampleCount;
- (BOOL)hasSyntheticDatasetVersion;
- (BOOL)isDebugTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPNLv4TaskEvaluationStarted)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPNLv4TaskEvaluationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaAsset)nlv4AssetVersion;
- (SISchemaAsset)nlv4AssetVersionOverride;
- (SISchemaAsset)syntheticDatasetVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)evaluationEnvironment;
- (int)evaluationType;
- (int)experimentType;
- (int)recipeType;
- (unint64_t)hash;
- (unsigned)sampleCount;
- (void)deleteEvaluationEnvironment;
- (void)deleteEvaluationType;
- (void)deleteExperimentType;
- (void)deleteIsDebugTask;
- (void)deleteNlv4AssetVersion;
- (void)deleteNlv4AssetVersionOverride;
- (void)deleteRecipeType;
- (void)deleteSampleCount;
- (void)deleteSyntheticDatasetVersion;
- (void)setEvaluationEnvironment:(int)a3;
- (void)setEvaluationType:(int)a3;
- (void)setExperimentType:(int)a3;
- (void)setHasEvaluationEnvironment:(BOOL)a3;
- (void)setHasEvaluationType:(BOOL)a3;
- (void)setHasExperimentType:(BOOL)a3;
- (void)setHasIsDebugTask:(BOOL)a3;
- (void)setHasNlv4AssetVersion:(BOOL)a3;
- (void)setHasNlv4AssetVersionOverride:(BOOL)a3;
- (void)setHasRecipeType:(BOOL)a3;
- (void)setHasSampleCount:(BOOL)a3;
- (void)setHasSyntheticDatasetVersion:(BOOL)a3;
- (void)setIsDebugTask:(BOOL)a3;
- (void)setNlv4AssetVersion:(id)a3;
- (void)setNlv4AssetVersionOverride:(id)a3;
- (void)setRecipeType:(int)a3;
- (void)setSampleCount:(unsigned int)a3;
- (void)setSyntheticDatasetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPNLv4TaskEvaluationStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLPInstSchemaCLPNLv4TaskEvaluationStarted;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self deleteNlv4AssetVersion];
  }
  v9 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self syntheticDatasetVersion];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self deleteSyntheticDatasetVersion];
  }
  v12 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersionOverride];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self deleteNlv4AssetVersionOverride];
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
  objc_storeStrong((id *)&self->_nlv4AssetVersionOverride, 0);
  objc_storeStrong((id *)&self->_syntheticDatasetVersion, 0);
  objc_storeStrong((id *)&self->_nlv4AssetVersion, 0);
}

- (void)setHasNlv4AssetVersionOverride:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSyntheticDatasetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasNlv4AssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setNlv4AssetVersionOverride:(id)a3
{
}

- (SISchemaAsset)nlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride;
}

- (void)setSyntheticDatasetVersion:(id)a3
{
}

- (SISchemaAsset)syntheticDatasetVersion
{
  return self->_syntheticDatasetVersion;
}

- (BOOL)isDebugTask
{
  return self->_isDebugTask;
}

- (unsigned)sampleCount
{
  return self->_sampleCount;
}

- (void)setNlv4AssetVersion:(id)a3
{
}

- (SISchemaAsset)nlv4AssetVersion
{
  return self->_nlv4AssetVersion;
}

- (int)recipeType
{
  return self->_recipeType;
}

- (int)experimentType
{
  return self->_experimentType;
}

- (int)evaluationEnvironment
{
  return self->_evaluationEnvironment;
}

- (int)evaluationType
{
  return self->_evaluationType;
}

- (CLPInstSchemaCLPNLv4TaskEvaluationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLPInstSchemaCLPNLv4TaskEvaluationStarted;
  v5 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"evaluationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setEvaluationType:](v5, "setEvaluationType:", [v6 intValue]);
    }
    v21 = v6;
    v7 = [v4 objectForKeyedSubscript:@"evaluationEnvironment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setEvaluationEnvironment:](v5, "setEvaluationEnvironment:", [v7 intValue]);
    }
    int v8 = objc_msgSend(v4, "objectForKeyedSubscript:", @"experimentType", v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setExperimentType:](v5, "setExperimentType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"recipeType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setRecipeType:](v5, "setRecipeType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"nlv4AssetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaAsset alloc] initWithDictionary:v10];
      [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)v5 setNlv4AssetVersion:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"sampleCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setSampleCount:](v5, "setSampleCount:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"isDebugTask"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4TaskEvaluationStarted setIsDebugTask:](v5, "setIsDebugTask:", [v13 BOOLValue]);
    }
    int v14 = [v4 objectForKeyedSubscript:@"syntheticDatasetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaAsset alloc] initWithDictionary:v14];
      [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)v5 setSyntheticDatasetVersion:v15];
    }
    objc_super v16 = [v4 objectForKeyedSubscript:@"nlv4AssetVersionOverride"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaAsset alloc] initWithDictionary:v16];
      [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)v5 setNlv4AssetVersionOverride:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPNLv4TaskEvaluationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self evaluationEnvironment] - 1;
    if (v5 > 2) {
      v6 = @"CLPEVALUATIONENVIRONMENT_UNKNOWN";
    }
    else {
      v6 = off_1E5EAD188[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"evaluationEnvironment"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  if ([(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self evaluationType] == 1) {
    uint64_t v7 = @"CLPEVALUATIONTYPE_NLV4";
  }
  else {
    uint64_t v7 = @"CLPEVALUATIONTYPE_UNKNOWN";
  }
  [v3 setObject:v7 forKeyedSubscript:@"evaluationType"];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
LABEL_13:
    unsigned int v8 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self experimentType] - 1;
    if (v8 > 2) {
      v9 = @"CLPEXPERIMENTTYPE_UNKNOWN";
    }
    else {
      v9 = off_1E5EAD1A0[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"experimentType"];
    char has = (char)self->_has;
  }
LABEL_17:
  if ((has & 0x20) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[CLPInstSchemaCLPNLv4TaskEvaluationStarted isDebugTask](self, "isDebugTask"));
    [v3 setObject:v10 forKeyedSubscript:@"isDebugTask"];
  }
  if (self->_nlv4AssetVersion)
  {
    int v11 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersion];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"nlv4AssetVersion"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"nlv4AssetVersion"];
    }
  }
  if (self->_nlv4AssetVersionOverride)
  {
    int v14 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersionOverride];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"nlv4AssetVersionOverride"];
    }
    else
    {
      objc_super v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"nlv4AssetVersionOverride"];
    }
  }
  char v17 = (char)self->_has;
  if ((v17 & 8) != 0)
  {
    int v18 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self recipeType];
    v19 = @"CLPRECIPETYPE_UNKNOWN";
    if (v18 == 1) {
      v19 = @"CLPRECIPETYPE_FULL_RECIPE";
    }
    if (v18 == 2) {
      v20 = @"CLPRECIPETYPE_DEBUG_RECIPE";
    }
    else {
      v20 = v19;
    }
    [v3 setObject:v20 forKeyedSubscript:@"recipeType"];
    char v17 = (char)self->_has;
  }
  if ((v17 & 0x10) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4TaskEvaluationStarted sampleCount](self, "sampleCount"));
    [v3 setObject:v21 forKeyedSubscript:@"sampleCount"];
  }
  if (self->_syntheticDatasetVersion)
  {
    objc_super v22 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self syntheticDatasetVersion];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"syntheticDatasetVersion"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"syntheticDatasetVersion"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_evaluationType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_evaluationEnvironment;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_experimentType;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_recipeType;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  unint64_t v7 = [(SISchemaAsset *)self->_nlv4AssetVersion hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_sampleCount;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v9 = 2654435761 * self->_isDebugTask;
LABEL_15:
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
  unint64_t v11 = [(SISchemaAsset *)self->_syntheticDatasetVersion hash];
  return v10 ^ v11 ^ [(SISchemaAsset *)self->_nlv4AssetVersionOverride hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  $71413F522521DC31F5CC1B6B89037ABE has = self->_has;
  unsigned int v6 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_39;
  }
  if (*(unsigned char *)&has)
  {
    int evaluationType = self->_evaluationType;
    if (evaluationType != [v4 evaluationType]) {
      goto LABEL_39;
    }
    $71413F522521DC31F5CC1B6B89037ABE has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_39;
  }
  if (v8)
  {
    int evaluationEnvironment = self->_evaluationEnvironment;
    if (evaluationEnvironment != [v4 evaluationEnvironment]) {
      goto LABEL_39;
    }
    $71413F522521DC31F5CC1B6B89037ABE has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_39;
  }
  if (v10)
  {
    int experimentType = self->_experimentType;
    if (experimentType != [v4 experimentType]) {
      goto LABEL_39;
    }
    $71413F522521DC31F5CC1B6B89037ABE has = self->_has;
    unsigned int v6 = v4[56];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_39;
  }
  if (v12)
  {
    int recipeType = self->_recipeType;
    if (recipeType != [v4 recipeType]) {
      goto LABEL_39;
    }
  }
  int v14 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersion];
  v15 = [v4 nlv4AssetVersion];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_38;
  }
  uint64_t v16 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersion];
  if (v16)
  {
    char v17 = (void *)v16;
    int v18 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersion];
    v19 = [v4 nlv4AssetVersion];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_39;
    }
  }
  else
  {
  }
  $71413F522521DC31F5CC1B6B89037ABE v21 = self->_has;
  int v22 = (*(unsigned int *)&v21 >> 4) & 1;
  unsigned int v23 = v4[56];
  if (v22 != ((v23 >> 4) & 1)) {
    goto LABEL_39;
  }
  if (v22)
  {
    unsigned int sampleCount = self->_sampleCount;
    if (sampleCount != [v4 sampleCount]) {
      goto LABEL_39;
    }
    $71413F522521DC31F5CC1B6B89037ABE v21 = self->_has;
    unsigned int v23 = v4[56];
  }
  int v25 = (*(unsigned int *)&v21 >> 5) & 1;
  if (v25 != ((v23 >> 5) & 1)) {
    goto LABEL_39;
  }
  if (v25)
  {
    int isDebugTask = self->_isDebugTask;
    if (isDebugTask != [v4 isDebugTask]) {
      goto LABEL_39;
    }
  }
  int v14 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self syntheticDatasetVersion];
  v15 = [v4 syntheticDatasetVersion];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_38;
  }
  uint64_t v27 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self syntheticDatasetVersion];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self syntheticDatasetVersion];
    v30 = [v4 syntheticDatasetVersion];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_39;
    }
  }
  else
  {
  }
  int v14 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersionOverride];
  v15 = [v4 nlv4AssetVersionOverride];
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_38:

    goto LABEL_39;
  }
  uint64_t v32 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersionOverride];
  if (!v32)
  {

LABEL_42:
    BOOL v37 = 1;
    goto LABEL_40;
  }
  v33 = (void *)v32;
  v34 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersionOverride];
  v35 = [v4 nlv4AssetVersionOverride];
  char v36 = [v34 isEqual:v35];

  if (v36) {
    goto LABEL_42;
  }
LABEL_39:
  BOOL v37 = 0;
LABEL_40:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  uint64_t v5 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersion];

  if (v5)
  {
    unsigned int v6 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersion];
    PBDataWriterWriteSubmessage();
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v7 = (char)self->_has;
  }
  if ((v7 & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  int v8 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self syntheticDatasetVersion];

  if (v8)
  {
    uint64_t v9 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self syntheticDatasetVersion];
    PBDataWriterWriteSubmessage();
  }
  int v10 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersionOverride];

  unint64_t v11 = v13;
  if (v10)
  {
    int v12 = [(CLPInstSchemaCLPNLv4TaskEvaluationStarted *)self nlv4AssetVersionOverride];
    PBDataWriterWriteSubmessage();

    unint64_t v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4TaskEvaluationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNlv4AssetVersionOverride
{
}

- (BOOL)hasNlv4AssetVersionOverride
{
  return self->_nlv4AssetVersionOverride != 0;
}

- (void)deleteSyntheticDatasetVersion
{
}

- (BOOL)hasSyntheticDatasetVersion
{
  return self->_syntheticDatasetVersion != 0;
}

- (void)deleteIsDebugTask
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsDebugTask:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsDebugTask
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsDebugTask:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isDebugTask = a3;
}

- (void)deleteSampleCount
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasSampleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSampleCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSampleCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int sampleCount = a3;
}

- (void)deleteNlv4AssetVersion
{
}

- (BOOL)hasNlv4AssetVersion
{
  return self->_nlv4AssetVersion != 0;
}

- (void)deleteRecipeType
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasRecipeType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRecipeType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRecipeType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int recipeType = a3;
}

- (void)deleteExperimentType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasExperimentType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasExperimentType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setExperimentType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int experimentType = a3;
}

- (void)deleteEvaluationEnvironment
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEvaluationEnvironment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEvaluationEnvironment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEvaluationEnvironment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int evaluationEnvironment = a3;
}

- (void)deleteEvaluationType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEvaluationType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEvaluationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEvaluationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int evaluationType = a3;
}

@end