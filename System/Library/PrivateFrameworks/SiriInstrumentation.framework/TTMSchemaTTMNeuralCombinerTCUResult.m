@interface TTMSchemaTTMNeuralCombinerTCUResult
- (BOOL)hasMode;
- (BOOL)hasNeuralCombinerScore;
- (BOOL)hasRecommendation;
- (BOOL)hasTcuId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)tcuId;
- (TTMSchemaTTMNeuralCombinerTCUResult)initWithDictionary:(id)a3;
- (TTMSchemaTTMNeuralCombinerTCUResult)initWithJSON:(id)a3;
- (float)neuralCombinerScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mode;
- (int)recommendation;
- (unint64_t)hash;
- (void)deleteMode;
- (void)deleteNeuralCombinerScore;
- (void)deleteRecommendation;
- (void)deleteTcuId;
- (void)setHasMode:(BOOL)a3;
- (void)setHasNeuralCombinerScore:(BOOL)a3;
- (void)setHasRecommendation:(BOOL)a3;
- (void)setHasTcuId:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setNeuralCombinerScore:(float)a3;
- (void)setRecommendation:(int)a3;
- (void)setTcuId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMNeuralCombinerTCUResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TTMSchemaTTMNeuralCombinerTCUResult;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self tcuId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(TTMSchemaTTMNeuralCombinerTCUResult *)self deleteTcuId];
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

- (void)setHasTcuId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)mode
{
  return self->_mode;
}

- (int)recommendation
{
  return self->_recommendation;
}

- (float)neuralCombinerScore
{
  return self->_neuralCombinerScore;
}

- (void)setTcuId:(id)a3
{
}

- (SISchemaUUID)tcuId
{
  return self->_tcuId;
}

- (TTMSchemaTTMNeuralCombinerTCUResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TTMSchemaTTMNeuralCombinerTCUResult;
  v5 = [(TTMSchemaTTMNeuralCombinerTCUResult *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tcuId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(TTMSchemaTTMNeuralCombinerTCUResult *)v5 setTcuId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"neuralCombinerScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[TTMSchemaTTMNeuralCombinerTCUResult setNeuralCombinerScore:](v5, "setNeuralCombinerScore:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"recommendation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMNeuralCombinerTCUResult setRecommendation:](v5, "setRecommendation:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"mode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMNeuralCombinerTCUResult setMode:](v5, "setMode:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (TTMSchemaTTMNeuralCombinerTCUResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMNeuralCombinerTCUResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    int v5 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self mode];
    v6 = @"TTMNEURALCOMBINERMODE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"TTMNEURALCOMBINERMODE_SIRI_X";
    }
    if (v5 == 2) {
      uint64_t v7 = @"TTMNEURALCOMBINERMODE_CONVERSATIONAL";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"mode"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = NSNumber;
  [(TTMSchemaTTMNeuralCombinerTCUResult *)self neuralCombinerScore];
  objc_super v9 = objc_msgSend(v8, "numberWithFloat:");
  [v3 setObject:v9 forKeyedSubscript:@"neuralCombinerScore"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  unsigned int v10 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self recommendation] - 1;
  if (v10 > 5) {
    v11 = @"TTMTCUMITIGATIONDECISION_UNKNOWN";
  }
  else {
    v11 = off_1E5EBB038[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"recommendation"];
LABEL_16:
  if (self->_tcuId)
  {
    v12 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self tcuId];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"tcuId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"tcuId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_tcuId hash];
  char has = (char)self->_has;
  if (has)
  {
    float neuralCombinerScore = self->_neuralCombinerScore;
    double v7 = neuralCombinerScore;
    if (neuralCombinerScore < 0.0) {
      double v7 = -neuralCombinerScore;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_recommendation;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v11 = 0;
    return v5 ^ v3 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_mode;
  return v5 ^ v3 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self tcuId];
  v6 = [v4 tcuId];
  double v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self tcuId];
  if (v8)
  {
    double v9 = (void *)v8;
    uint64_t v10 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self tcuId];
    uint64_t v11 = [v4 tcuId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $B1EFAAA5BDE7E48CBA522B21E7585FFF has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v21 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    float neuralCombinerScore = self->_neuralCombinerScore;
    [v4 neuralCombinerScore];
    if (neuralCombinerScore != v16) {
      goto LABEL_20;
    }
    $B1EFAAA5BDE7E48CBA522B21E7585FFF has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v17 = (*(unsigned int *)&has >> 1) & 1;
  if (v17 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v17)
  {
    int recommendation = self->_recommendation;
    if (recommendation == [v4 recommendation])
    {
      $B1EFAAA5BDE7E48CBA522B21E7585FFF has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v19)
  {
    int mode = self->_mode;
    if (mode != [v4 mode]) {
      goto LABEL_20;
    }
  }
  BOOL v21 = 1;
LABEL_21:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self tcuId];

  if (v4)
  {
    unint64_t v5 = [(TTMSchemaTTMNeuralCombinerTCUResult *)self tcuId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  double v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    double v7 = v8;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    double v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TTMSchemaTTMNeuralCombinerTCUResultReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteMode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int mode = a3;
}

- (void)deleteRecommendation
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRecommendation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecommendation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRecommendation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int recommendation = a3;
}

- (void)deleteNeuralCombinerScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNeuralCombinerScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNeuralCombinerScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNeuralCombinerScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float neuralCombinerScore = a3;
}

- (void)deleteTcuId
{
}

- (BOOL)hasTcuId
{
  return self->_tcuId != 0;
}

@end