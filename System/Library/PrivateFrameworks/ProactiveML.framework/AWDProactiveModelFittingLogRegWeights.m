@interface AWDProactiveModelFittingLogRegWeights
- (AWDProactiveModelFittingEvalMetrics)evaluationMetrics;
- (AWDProactiveModelFittingMinibatchStats)minibatchStats;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (AWDProactiveModelFittingQuantizedDenseVector)denseQuantizedWeights;
- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedWeights;
- (AWDProactiveModelFittingSparseFloatVector)sparseFloatWeights;
- (BOOL)hasDenseQuantizedWeights;
- (BOOL)hasEvaluationMetrics;
- (BOOL)hasMinibatchStats;
- (BOOL)hasModelInfo;
- (BOOL)hasSparseFloatWeights;
- (BOOL)hasSparseQuantizedWeights;
- (BOOL)hasTimestamp;
- (BOOL)hasWeights;
- (BOOL)hasWeightsL2norm;
- (BOOL)hasWeightsScaleFactor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)weightsL2norm;
- (float)weightsScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDenseQuantizedWeights:(id)a3;
- (void)setEvaluationMetrics:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWeightsL2norm:(BOOL)a3;
- (void)setHasWeightsScaleFactor:(BOOL)a3;
- (void)setMinibatchStats:(id)a3;
- (void)setModelInfo:(id)a3;
- (void)setSparseFloatWeights:(id)a3;
- (void)setSparseQuantizedWeights:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWeightsL2norm:(float)a3;
- (void)setWeightsScaleFactor:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingLogRegWeights

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseQuantizedWeights, 0);
  objc_storeStrong((id *)&self->_sparseFloatWeights, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
  objc_storeStrong((id *)&self->_denseQuantizedWeights, 0);
}

- (void)setDenseQuantizedWeights:(id)a3
{
}

- (AWDProactiveModelFittingQuantizedDenseVector)denseQuantizedWeights
{
  return self->_denseQuantizedWeights;
}

- (float)weightsL2norm
{
  return self->_weightsL2norm;
}

- (float)weightsScaleFactor
{
  return self->_weightsScaleFactor;
}

- (void)setSparseQuantizedWeights:(id)a3
{
}

- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedWeights
{
  return self->_sparseQuantizedWeights;
}

- (void)setEvaluationMetrics:(id)a3
{
}

- (AWDProactiveModelFittingEvalMetrics)evaluationMetrics
{
  return self->_evaluationMetrics;
}

- (void)setMinibatchStats:(id)a3
{
}

- (AWDProactiveModelFittingMinibatchStats)minibatchStats
{
  return self->_minibatchStats;
}

- (void)setSparseFloatWeights:(id)a3
{
}

- (AWDProactiveModelFittingSparseFloatVector)sparseFloatWeights
{
  return self->_sparseFloatWeights;
}

- (void)setModelInfo:(id)a3
{
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[9])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  modelInfo = self->_modelInfo;
  uint64_t v7 = v5[5];
  v19 = v5;
  if (modelInfo)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDProactiveModelFittingModelInfo mergeFrom:](modelInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDProactiveModelFittingLogRegWeights setModelInfo:](self, "setModelInfo:");
  }
  v5 = v19;
LABEL_9:
  sparseFloatWeights = self->_sparseFloatWeights;
  uint64_t v9 = v5[6];
  if (sparseFloatWeights)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingSparseFloatVector mergeFrom:](sparseFloatWeights, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingLogRegWeights setSparseFloatWeights:](self, "setSparseFloatWeights:");
  }
  v5 = v19;
LABEL_15:
  minibatchStats = self->_minibatchStats;
  uint64_t v11 = v5[4];
  if (minibatchStats)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDProactiveModelFittingMinibatchStats mergeFrom:](minibatchStats, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[AWDProactiveModelFittingLogRegWeights setMinibatchStats:](self, "setMinibatchStats:");
  }
  v5 = v19;
LABEL_21:
  evaluationMetrics = self->_evaluationMetrics;
  uint64_t v13 = v5[3];
  if (evaluationMetrics)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDProactiveModelFittingEvalMetrics mergeFrom:](evaluationMetrics, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDProactiveModelFittingLogRegWeights setEvaluationMetrics:](self, "setEvaluationMetrics:");
  }
  v5 = v19;
LABEL_27:
  sparseQuantizedWeights = self->_sparseQuantizedWeights;
  uint64_t v15 = v5[7];
  if (sparseQuantizedWeights)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[AWDProactiveModelFittingQuantizedSparseVector mergeFrom:](sparseQuantizedWeights, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[AWDProactiveModelFittingLogRegWeights setSparseQuantizedWeights:](self, "setSparseQuantizedWeights:");
  }
  v5 = v19;
LABEL_33:
  char v16 = *((unsigned char *)v5 + 72);
  if ((v16 & 4) != 0)
  {
    self->_weightsScaleFactor = *((float *)v5 + 17);
    *(unsigned char *)&self->_has |= 4u;
    char v16 = *((unsigned char *)v5 + 72);
  }
  if ((v16 & 2) != 0)
  {
    self->_weightsL2norm = *((float *)v5 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
  denseQuantizedWeights = self->_denseQuantizedWeights;
  uint64_t v18 = v5[2];
  if (denseQuantizedWeights)
  {
    if (v18) {
      -[AWDProactiveModelFittingQuantizedDenseVector mergeFrom:](denseQuantizedWeights, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[AWDProactiveModelFittingLogRegWeights setDenseQuantizedWeights:](self, "setDenseQuantizedWeights:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo hash];
  unint64_t v5 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatWeights hash];
  unint64_t v6 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats hash];
  unint64_t v7 = [(AWDProactiveModelFittingEvalMetrics *)self->_evaluationMetrics hash];
  unint64_t v8 = [(AWDProactiveModelFittingQuantizedSparseVector *)self->_sparseQuantizedWeights hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    float weightsScaleFactor = self->_weightsScaleFactor;
    double v12 = weightsScaleFactor;
    if (weightsScaleFactor < 0.0) {
      double v12 = -weightsScaleFactor;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 2) != 0)
  {
    float weightsL2norm = self->_weightsL2norm;
    double v17 = weightsL2norm;
    if (weightsL2norm < 0.0) {
      double v17 = -weightsL2norm;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ [(AWDProactiveModelFittingQuantizedDenseVector *)self->_denseQuantizedWeights hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_29:
    char v11 = 0;
    goto LABEL_30;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((void *)v4 + 5)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_29;
  }
  sparseFloatWeights = self->_sparseFloatWeights;
  if ((unint64_t)sparseFloatWeights | *((void *)v4 + 6))
  {
    if (!-[AWDProactiveModelFittingSparseFloatVector isEqual:](sparseFloatWeights, "isEqual:")) {
      goto LABEL_29;
    }
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((void *)v4 + 4))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:")) {
      goto LABEL_29;
    }
  }
  evaluationMetrics = self->_evaluationMetrics;
  if ((unint64_t)evaluationMetrics | *((void *)v4 + 3))
  {
    if (!-[AWDProactiveModelFittingEvalMetrics isEqual:](evaluationMetrics, "isEqual:")) {
      goto LABEL_29;
    }
  }
  sparseQuantizedWeights = self->_sparseQuantizedWeights;
  if ((unint64_t)sparseQuantizedWeights | *((void *)v4 + 7))
  {
    if (!-[AWDProactiveModelFittingQuantizedSparseVector isEqual:](sparseQuantizedWeights, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_weightsScaleFactor != *((float *)v4 + 17)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_weightsL2norm != *((float *)v4 + 16)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_29;
  }
  denseQuantizedWeights = self->_denseQuantizedWeights;
  if ((unint64_t)denseQuantizedWeights | *((void *)v4 + 2)) {
    char v11 = -[AWDProactiveModelFittingQuantizedDenseVector isEqual:](denseQuantizedWeights, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_30:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v7 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo copyWithZone:a3];
  unint64_t v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  id v9 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatWeights copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  id v11 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats copyWithZone:a3];
  double v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  id v13 = [(AWDProactiveModelFittingEvalMetrics *)self->_evaluationMetrics copyWithZone:a3];
  double v14 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v13;

  id v15 = [(AWDProactiveModelFittingQuantizedSparseVector *)self->_sparseQuantizedWeights copyWithZone:a3];
  char v16 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v15;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)(v6 + 68) = self->_weightsScaleFactor;
    *(unsigned char *)(v6 + 72) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v6 + 64) = self->_weightsL2norm;
    *(unsigned char *)(v6 + 72) |= 2u;
  }
  id v18 = [(AWDProactiveModelFittingQuantizedDenseVector *)self->_denseQuantizedWeights copyWithZone:a3];
  double v19 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v18;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  uint64_t v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    id v4 = v6;
  }
  if (self->_sparseFloatWeights)
  {
    objc_msgSend(v6, "setSparseFloatWeights:");
    id v4 = v6;
  }
  if (self->_minibatchStats)
  {
    objc_msgSend(v6, "setMinibatchStats:");
    id v4 = v6;
  }
  if (self->_evaluationMetrics)
  {
    objc_msgSend(v6, "setEvaluationMetrics:");
    id v4 = v6;
  }
  if (self->_sparseQuantizedWeights)
  {
    objc_msgSend(v6, "setSparseQuantizedWeights:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 17) = LODWORD(self->_weightsScaleFactor);
    *((unsigned char *)v4 + 72) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = LODWORD(self->_weightsL2norm);
    *((unsigned char *)v4 + 72) |= 2u;
  }
  if (self->_denseQuantizedWeights)
  {
    objc_msgSend(v6, "setDenseQuantizedWeights:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_modelInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sparseFloatWeights)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_minibatchStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_evaluationMetrics)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sparseQuantizedWeights)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
  if (self->_denseQuantizedWeights)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingLogRegWeightsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
  modelInfo = self->_modelInfo;
  if (modelInfo)
  {
    id v7 = [(AWDProactiveModelFittingModelInfo *)modelInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"modelInfo"];
  }
  sparseFloatWeights = self->_sparseFloatWeights;
  if (sparseFloatWeights)
  {
    id v9 = [(AWDProactiveModelFittingSparseFloatVector *)sparseFloatWeights dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"sparseFloatWeights"];
  }
  minibatchStats = self->_minibatchStats;
  if (minibatchStats)
  {
    id v11 = [(AWDProactiveModelFittingMinibatchStats *)minibatchStats dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"minibatchStats"];
  }
  evaluationMetrics = self->_evaluationMetrics;
  if (evaluationMetrics)
  {
    id v13 = [(AWDProactiveModelFittingEvalMetrics *)evaluationMetrics dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"evaluationMetrics"];
  }
  sparseQuantizedWeights = self->_sparseQuantizedWeights;
  if (sparseQuantizedWeights)
  {
    id v15 = [(AWDProactiveModelFittingQuantizedSparseVector *)sparseQuantizedWeights dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"sparseQuantizedWeights"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_weightsScaleFactor;
    double v17 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v17 forKey:@"weightsScaleFactor"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_weightsL2norm;
    id v18 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v18 forKey:@"weightsL2norm"];
  }
  denseQuantizedWeights = self->_denseQuantizedWeights;
  if (denseQuantizedWeights)
  {
    v20 = [(AWDProactiveModelFittingQuantizedDenseVector *)denseQuantizedWeights dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"denseQuantizedWeights"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingLogRegWeights;
  double v4 = [(AWDProactiveModelFittingLogRegWeights *)&v8 description];
  uint64_t v5 = [(AWDProactiveModelFittingLogRegWeights *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDenseQuantizedWeights
{
  return self->_denseQuantizedWeights != 0;
}

- (BOOL)hasWeightsL2norm
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasWeightsL2norm:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setWeightsL2norm:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float weightsL2norm = a3;
}

- (BOOL)hasWeightsScaleFactor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasWeightsScaleFactor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setWeightsScaleFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float weightsScaleFactor = a3;
}

- (BOOL)hasSparseQuantizedWeights
{
  return self->_sparseQuantizedWeights != 0;
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasSparseFloatWeights
{
  return self->_sparseFloatWeights != 0;
}

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (BOOL)hasWeights
{
  if ([(AWDProactiveModelFittingLogRegWeights *)self hasSparseFloatWeights]
    || [(AWDProactiveModelFittingLogRegWeights *)self hasSparseQuantizedWeights])
  {
    return 1;
  }
  return [(AWDProactiveModelFittingLogRegWeights *)self hasDenseQuantizedWeights];
}

@end