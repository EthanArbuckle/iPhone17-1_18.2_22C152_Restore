@interface CAMSchemaCAMModelExecuted
- (BOOL)hasAsset;
- (BOOL)hasIsShadowLog;
- (BOOL)hasModelId;
- (BOOL)hasPrediction;
- (BOOL)hasPredictionScore;
- (BOOL)hasPredictionThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShadowLog;
- (BOOL)readFrom:(id)a3;
- (CAMSchemaCAMModelExecuted)initWithDictionary:(id)a3;
- (CAMSchemaCAMModelExecuted)initWithJSON:(id)a3;
- (CAMSchemaCAMModelId)modelId;
- (NSData)jsonData;
- (SISchemaAsset)asset;
- (float)predictionScore;
- (float)predictionThreshold;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)prediction;
- (void)deleteAsset;
- (void)deleteIsShadowLog;
- (void)deleteModelId;
- (void)deletePrediction;
- (void)deletePredictionScore;
- (void)deletePredictionThreshold;
- (void)setAsset:(id)a3;
- (void)setHasAsset:(BOOL)a3;
- (void)setHasIsShadowLog:(BOOL)a3;
- (void)setHasModelId:(BOOL)a3;
- (void)setHasPrediction:(BOOL)a3;
- (void)setHasPredictionScore:(BOOL)a3;
- (void)setHasPredictionThreshold:(BOOL)a3;
- (void)setIsShadowLog:(BOOL)a3;
- (void)setModelId:(id)a3;
- (void)setPrediction:(unsigned int)a3;
- (void)setPredictionScore:(float)a3;
- (void)setPredictionThreshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAMSchemaCAMModelExecuted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMSchemaCAMModelExecuted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(CAMSchemaCAMModelExecuted *)self modelId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAMSchemaCAMModelExecuted *)self deleteModelId];
  }
  v9 = [(CAMSchemaCAMModelExecuted *)self asset];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAMSchemaCAMModelExecuted *)self deleteAsset];
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
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
}

- (void)setHasAsset:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAsset:(id)a3
{
}

- (SISchemaAsset)asset
{
  return self->_asset;
}

- (BOOL)isShadowLog
{
  return self->_isShadowLog;
}

- (float)predictionThreshold
{
  return self->_predictionThreshold;
}

- (float)predictionScore
{
  return self->_predictionScore;
}

- (unsigned)prediction
{
  return self->_prediction;
}

- (void)setModelId:(id)a3
{
}

- (CAMSchemaCAMModelId)modelId
{
  return self->_modelId;
}

- (CAMSchemaCAMModelExecuted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMSchemaCAMModelExecuted;
  v5 = [(CAMSchemaCAMModelExecuted *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[CAMSchemaCAMModelId alloc] initWithDictionary:v6];
      [(CAMSchemaCAMModelExecuted *)v5 setModelId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"prediction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAMSchemaCAMModelExecuted setPrediction:](v5, "setPrediction:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"predictionScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[CAMSchemaCAMModelExecuted setPredictionScore:](v5, "setPredictionScore:");
    }
    v10 = [v4 objectForKeyedSubscript:@"predictionThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[CAMSchemaCAMModelExecuted setPredictionThreshold:](v5, "setPredictionThreshold:");
    }
    int v11 = [v4 objectForKeyedSubscript:@"isShadowLog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAMSchemaCAMModelExecuted setIsShadowLog:](v5, "setIsShadowLog:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"asset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[SISchemaAsset alloc] initWithDictionary:v12];
      [(CAMSchemaCAMModelExecuted *)v5 setAsset:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (CAMSchemaCAMModelExecuted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAMSchemaCAMModelExecuted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAMSchemaCAMModelExecuted *)self dictionaryRepresentation];
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
  if (self->_asset)
  {
    id v4 = [(CAMSchemaCAMModelExecuted *)self asset];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asset"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asset"];
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMSchemaCAMModelExecuted isShadowLog](self, "isShadowLog"));
    [v3 setObject:v7 forKeyedSubscript:@"isShadowLog"];
  }
  if (self->_modelId)
  {
    int v8 = [(CAMSchemaCAMModelExecuted *)self modelId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"modelId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"modelId"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAMSchemaCAMModelExecuted prediction](self, "prediction"));
    [v3 setObject:v15 forKeyedSubscript:@"prediction"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  objc_super v16 = NSNumber;
  [(CAMSchemaCAMModelExecuted *)self predictionScore];
  v17 = objc_msgSend(v16, "numberWithFloat:");
  [v3 setObject:v17 forKeyedSubscript:@"predictionScore"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_16:
    v12 = NSNumber;
    [(CAMSchemaCAMModelExecuted *)self predictionThreshold];
    objc_super v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"predictionThreshold"];
  }
LABEL_17:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CAMSchemaCAMModelId *)self->_modelId hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v5 = 2654435761 * self->_prediction;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float predictionScore = self->_predictionScore;
  double v7 = predictionScore;
  if (predictionScore < 0.0) {
    double v7 = -predictionScore;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    float predictionThreshold = self->_predictionThreshold;
    double v13 = predictionThreshold;
    if (predictionThreshold < 0.0) {
      double v13 = -predictionThreshold;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 8) != 0) {
    uint64_t v16 = 2654435761 * self->_isShadowLog;
  }
  else {
    uint64_t v16 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ [(SISchemaAsset *)self->_asset hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(CAMSchemaCAMModelExecuted *)self modelId];
  v6 = [v4 modelId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(CAMSchemaCAMModelExecuted *)self modelId];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(CAMSchemaCAMModelExecuted *)self modelId];
    unint64_t v10 = [v4 modelId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $412F3D71AE4B812EAB84F2C81827393C has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int prediction = self->_prediction;
    if (prediction != [v4 prediction]) {
      goto LABEL_27;
    }
    $412F3D71AE4B812EAB84F2C81827393C has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v15)
  {
    float predictionScore = self->_predictionScore;
    [v4 predictionScore];
    if (predictionScore != v17) {
      goto LABEL_27;
    }
    $412F3D71AE4B812EAB84F2C81827393C has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v13 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v18)
  {
    float predictionThreshold = self->_predictionThreshold;
    [v4 predictionThreshold];
    if (predictionThreshold != v20) {
      goto LABEL_27;
    }
    $412F3D71AE4B812EAB84F2C81827393C has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v13 >> 3) & 1)) {
    goto LABEL_27;
  }
  if (v21)
  {
    int isShadowLog = self->_isShadowLog;
    if (isShadowLog != [v4 isShadowLog]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(CAMSchemaCAMModelExecuted *)self asset];
  v6 = [v4 asset];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v23 = [(CAMSchemaCAMModelExecuted *)self asset];
  if (!v23)
  {

LABEL_30:
    BOOL v28 = 1;
    goto LABEL_28;
  }
  v24 = (void *)v23;
  v25 = [(CAMSchemaCAMModelExecuted *)self asset];
  v26 = [v4 asset];
  char v27 = [v25 isEqual:v26];

  if (v27) {
    goto LABEL_30;
  }
LABEL_27:
  BOOL v28 = 0;
LABEL_28:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(CAMSchemaCAMModelExecuted *)self modelId];

  if (v4)
  {
    uint64_t v5 = [(CAMSchemaCAMModelExecuted *)self modelId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
  uint64_t v7 = [(CAMSchemaCAMModelExecuted *)self asset];

  long double v8 = v10;
  if (v7)
  {
    double v9 = [(CAMSchemaCAMModelExecuted *)self asset];
    PBDataWriterWriteSubmessage();

    long double v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMModelExecutedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAsset
{
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (void)deleteIsShadowLog
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsShadowLog:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsShadowLog
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsShadowLog:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isShadowLog = a3;
}

- (void)deletePredictionThreshold
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPredictionThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPredictionThreshold
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPredictionThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float predictionThreshold = a3;
}

- (void)deletePredictionScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPredictionScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPredictionScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPredictionScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float predictionScore = a3;
}

- (void)deletePrediction
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPrediction:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrediction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPrediction:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int prediction = a3;
}

- (void)deleteModelId
{
}

- (BOOL)hasModelId
{
  return self->_modelId != 0;
}

@end