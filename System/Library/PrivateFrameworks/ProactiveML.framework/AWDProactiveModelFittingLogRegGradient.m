@interface AWDProactiveModelFittingLogRegGradient
- (AWDProactiveModelFittingEvalMetrics)evaluationMetrics;
- (AWDProactiveModelFittingMinibatchStats)minibatchStats;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (AWDProactiveModelFittingQuantizedDenseVector)denseQuantizedGradient;
- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedGradient;
- (AWDProactiveModelFittingSparseFloatVector)sparseFloatGradient;
- (BOOL)hasDenseQuantizedGradient;
- (BOOL)hasEvaluationMetrics;
- (BOOL)hasGradient;
- (BOOL)hasGradientL2norm;
- (BOOL)hasGradientScaleFactor;
- (BOOL)hasIteration;
- (BOOL)hasMinibatchStats;
- (BOOL)hasModelInfo;
- (BOOL)hasSparseFloatGradient;
- (BOOL)hasSparseQuantizedGradient;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)gradientL2norm;
- (float)gradientScaleFactor;
- (float)gradientValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)gradientLength;
- (unint64_t)hash;
- (unint64_t)iteration;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDenseQuantizedGradient:(id)a3;
- (void)setEvaluationMetrics:(id)a3;
- (void)setGradientL2norm:(float)a3;
- (void)setGradientScaleFactor:(float)a3;
- (void)setHasGradientL2norm:(BOOL)a3;
- (void)setHasGradientScaleFactor:(BOOL)a3;
- (void)setHasIteration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIteration:(unint64_t)a3;
- (void)setMinibatchStats:(id)a3;
- (void)setModelInfo:(id)a3;
- (void)setSparseFloatGradient:(id)a3;
- (void)setSparseQuantizedGradient:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingLogRegGradient

- (unint64_t)gradientLength
{
  if ([(AWDProactiveModelFittingLogRegGradient *)self hasSparseFloatGradient])
  {
    v3 = [(AWDProactiveModelFittingLogRegGradient *)self sparseFloatGradient];
    uint64_t v4 = [v3 length];
LABEL_7:
    unint64_t v5 = v4;
    goto LABEL_8;
  }
  if (![(AWDProactiveModelFittingLogRegGradient *)self hasSparseQuantizedGradient])
  {
    if (![(AWDProactiveModelFittingLogRegGradient *)self hasDenseQuantizedGradient]) {
      return 0;
    }
    v3 = [(AWDProactiveModelFittingLogRegGradient *)self denseQuantizedGradient];
    uint64_t v4 = [v3 valuesCount];
    goto LABEL_7;
  }
  v3 = [(AWDProactiveModelFittingLogRegGradient *)self sparseQuantizedGradient];
  unint64_t v5 = [v3 length];
LABEL_8:

  return v5;
}

- (float)gradientValueAtIndex:(unint64_t)a3
{
  if ([(AWDProactiveModelFittingLogRegGradient *)self hasSparseFloatGradient])
  {
    unint64_t v5 = [(AWDProactiveModelFittingLogRegGradient *)self sparseFloatGradient];
    [v5 valueAtIndex:a3];
LABEL_8:
    float v8 = v6;

    return v8;
  }
  if ([(AWDProactiveModelFittingLogRegGradient *)self hasSparseQuantizedGradient])
  {
    v7 = [(AWDProactiveModelFittingLogRegGradient *)self sparseQuantizedGradient];
LABEL_7:
    unint64_t v5 = v7;
    [v7 originalValueAtIndex:a3];
    goto LABEL_8;
  }
  float v8 = 0.0;
  if ([(AWDProactiveModelFittingLogRegGradient *)self hasDenseQuantizedGradient])
  {
    v7 = [(AWDProactiveModelFittingLogRegGradient *)self denseQuantizedGradient];
    goto LABEL_7;
  }
  return v8;
}

- (BOOL)hasGradient
{
  if ([(AWDProactiveModelFittingLogRegGradient *)self hasSparseFloatGradient]
    || [(AWDProactiveModelFittingLogRegGradient *)self hasSparseQuantizedGradient])
  {
    return 1;
  }
  return [(AWDProactiveModelFittingLogRegGradient *)self hasDenseQuantizedGradient];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseQuantizedGradient, 0);
  objc_storeStrong((id *)&self->_sparseFloatGradient, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
  objc_storeStrong((id *)&self->_denseQuantizedGradient, 0);
}

- (void)setDenseQuantizedGradient:(id)a3
{
}

- (AWDProactiveModelFittingQuantizedDenseVector)denseQuantizedGradient
{
  return self->_denseQuantizedGradient;
}

- (float)gradientL2norm
{
  return self->_gradientL2norm;
}

- (float)gradientScaleFactor
{
  return self->_gradientScaleFactor;
}

- (void)setSparseQuantizedGradient:(id)a3
{
}

- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedGradient
{
  return self->_sparseQuantizedGradient;
}

- (unint64_t)iteration
{
  return self->_iteration;
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

- (void)setSparseFloatGradient:(id)a3
{
}

- (AWDProactiveModelFittingSparseFloatVector)sparseFloatGradient
{
  return self->_sparseFloatGradient;
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
  uint64_t v4 = a3;
  unint64_t v5 = v4;
  if ((v4[10] & 2) != 0)
  {
    self->_timestamp = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  modelInfo = self->_modelInfo;
  uint64_t v7 = v5[7];
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
    -[AWDProactiveModelFittingLogRegGradient setModelInfo:](self, "setModelInfo:");
  }
  unint64_t v5 = v19;
LABEL_9:
  sparseFloatGradient = self->_sparseFloatGradient;
  uint64_t v9 = v5[8];
  if (sparseFloatGradient)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingSparseFloatVector mergeFrom:](sparseFloatGradient, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingLogRegGradient setSparseFloatGradient:](self, "setSparseFloatGradient:");
  }
  unint64_t v5 = v19;
LABEL_15:
  minibatchStats = self->_minibatchStats;
  uint64_t v11 = v5[6];
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
    -[AWDProactiveModelFittingLogRegGradient setMinibatchStats:](self, "setMinibatchStats:");
  }
  unint64_t v5 = v19;
LABEL_21:
  evaluationMetrics = self->_evaluationMetrics;
  uint64_t v13 = v5[4];
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
    -[AWDProactiveModelFittingLogRegGradient setEvaluationMetrics:](self, "setEvaluationMetrics:");
  }
  unint64_t v5 = v19;
LABEL_27:
  if (v5[10])
  {
    self->_iteration = v5[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  sparseQuantizedGradient = self->_sparseQuantizedGradient;
  uint64_t v15 = v5[9];
  if (sparseQuantizedGradient)
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[AWDProactiveModelFittingQuantizedSparseVector mergeFrom:](sparseQuantizedGradient, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[AWDProactiveModelFittingLogRegGradient setSparseQuantizedGradient:](self, "setSparseQuantizedGradient:");
  }
  unint64_t v5 = v19;
LABEL_35:
  char v16 = *((unsigned char *)v5 + 80);
  if ((v16 & 8) != 0)
  {
    self->_gradientScaleFactor = *((float *)v5 + 11);
    *(unsigned char *)&self->_has |= 8u;
    char v16 = *((unsigned char *)v5 + 80);
  }
  if ((v16 & 4) != 0)
  {
    self->_gradientL2norm = *((float *)v5 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
  denseQuantizedGradient = self->_denseQuantizedGradient;
  uint64_t v18 = v5[3];
  if (denseQuantizedGradient)
  {
    if (v18) {
      -[AWDProactiveModelFittingQuantizedDenseVector mergeFrom:](denseQuantizedGradient, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[AWDProactiveModelFittingLogRegGradient setDenseQuantizedGradient:](self, "setDenseQuantizedGradient:");
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v21 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v21 = 0;
  }
  unint64_t v3 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo hash];
  unint64_t v4 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatGradient hash];
  unint64_t v5 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats hash];
  unint64_t v6 = [(AWDProactiveModelFittingEvalMetrics *)self->_evaluationMetrics hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_iteration;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v8 = [(AWDProactiveModelFittingQuantizedSparseVector *)self->_sparseQuantizedGradient hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float gradientScaleFactor = self->_gradientScaleFactor;
    double v12 = gradientScaleFactor;
    if (gradientScaleFactor < 0.0) {
      double v12 = -gradientScaleFactor;
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
  if ((has & 4) != 0)
  {
    float gradientL2norm = self->_gradientL2norm;
    double v17 = gradientL2norm;
    if (gradientL2norm < 0.0) {
      double v17 = -gradientL2norm;
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
  return v3 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ [(AWDProactiveModelFittingQuantizedDenseVector *)self->_denseQuantizedGradient hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_35;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((void *)v4 + 7)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_35;
  }
  sparseFloatGradient = self->_sparseFloatGradient;
  if ((unint64_t)sparseFloatGradient | *((void *)v4 + 8))
  {
    if (!-[AWDProactiveModelFittingSparseFloatVector isEqual:](sparseFloatGradient, "isEqual:")) {
      goto LABEL_35;
    }
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((void *)v4 + 6))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:")) {
      goto LABEL_35;
    }
  }
  evaluationMetrics = self->_evaluationMetrics;
  if ((unint64_t)evaluationMetrics | *((void *)v4 + 4))
  {
    if (!-[AWDProactiveModelFittingEvalMetrics isEqual:](evaluationMetrics, "isEqual:")) {
      goto LABEL_35;
    }
  }
  char has = (char)self->_has;
  char v10 = *((unsigned char *)v4 + 80);
  if (has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_iteration != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_35;
  }
  sparseQuantizedGradient = self->_sparseQuantizedGradient;
  if ((unint64_t)sparseQuantizedGradient | *((void *)v4 + 9))
  {
    if (!-[AWDProactiveModelFittingQuantizedSparseVector isEqual:](sparseQuantizedGradient, "isEqual:"))
    {
LABEL_35:
      char v13 = 0;
      goto LABEL_36;
    }
    char has = (char)self->_has;
    char v10 = *((unsigned char *)v4 + 80);
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_gradientScaleFactor != *((float *)v4 + 11)) {
      goto LABEL_35;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_gradientL2norm != *((float *)v4 + 10)) {
      goto LABEL_35;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_35;
  }
  denseQuantizedGradient = self->_denseQuantizedGradient;
  if ((unint64_t)denseQuantizedGradient | *((void *)v4 + 3)) {
    char v13 = -[AWDProactiveModelFittingQuantizedDenseVector isEqual:](denseQuantizedGradient, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_36:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  id v7 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo copyWithZone:a3];
  unint64_t v8 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v7;

  id v9 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatGradient copyWithZone:a3];
  char v10 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v9;

  id v11 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats copyWithZone:a3];
  double v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  id v13 = [(AWDProactiveModelFittingEvalMetrics *)self->_evaluationMetrics copyWithZone:a3];
  double v14 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v13;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_iteration;
    *(unsigned char *)(v6 + 80) |= 1u;
  }
  id v15 = [(AWDProactiveModelFittingQuantizedSparseVector *)self->_sparseQuantizedGradient copyWithZone:a3];
  char v16 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v15;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)(v6 + 44) = self->_gradientScaleFactor;
    *(unsigned char *)(v6 + 80) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(float *)(v6 + 40) = self->_gradientL2norm;
    *(unsigned char *)(v6 + 80) |= 4u;
  }
  id v18 = [(AWDProactiveModelFittingQuantizedDenseVector *)self->_denseQuantizedGradient copyWithZone:a3];
  double v19 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v18;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 80) |= 2u;
  }
  uint64_t v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    id v4 = v6;
  }
  if (self->_sparseFloatGradient)
  {
    objc_msgSend(v6, "setSparseFloatGradient:");
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_iteration;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_sparseQuantizedGradient)
  {
    objc_msgSend(v6, "setSparseQuantizedGradient:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 11) = LODWORD(self->_gradientScaleFactor);
    *((unsigned char *)v4 + 80) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = LODWORD(self->_gradientL2norm);
    *((unsigned char *)v4 + 80) |= 4u;
  }
  if (self->_denseQuantizedGradient)
  {
    objc_msgSend(v6, "setDenseQuantizedGradient:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_modelInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sparseFloatGradient)
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_sparseQuantizedGradient)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
  if (self->_denseQuantizedGradient)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingLogRegGradientReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
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
  sparseFloatGradient = self->_sparseFloatGradient;
  if (sparseFloatGradient)
  {
    id v9 = [(AWDProactiveModelFittingSparseFloatVector *)sparseFloatGradient dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"sparseFloatGradient"];
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
  if (*(unsigned char *)&self->_has)
  {
    double v14 = [NSNumber numberWithUnsignedLongLong:self->_iteration];
    [v3 setObject:v14 forKey:@"iteration"];
  }
  sparseQuantizedGradient = self->_sparseQuantizedGradient;
  if (sparseQuantizedGradient)
  {
    char v16 = [(AWDProactiveModelFittingQuantizedSparseVector *)sparseQuantizedGradient dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"sparseQuantizedGradient"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&double v4 = self->_gradientScaleFactor;
    id v18 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v18 forKey:@"gradientScaleFactor"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_gradientL2norm;
    double v19 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v19 forKey:@"gradientL2norm"];
  }
  denseQuantizedGradient = self->_denseQuantizedGradient;
  if (denseQuantizedGradient)
  {
    unint64_t v21 = [(AWDProactiveModelFittingQuantizedDenseVector *)denseQuantizedGradient dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"denseQuantizedGradient"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingLogRegGradient;
  double v4 = [(AWDProactiveModelFittingLogRegGradient *)&v8 description];
  uint64_t v5 = [(AWDProactiveModelFittingLogRegGradient *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDenseQuantizedGradient
{
  return self->_denseQuantizedGradient != 0;
}

- (BOOL)hasGradientL2norm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasGradientL2norm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setGradientL2norm:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float gradientL2norm = a3;
}

- (BOOL)hasGradientScaleFactor
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasGradientScaleFactor:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setGradientScaleFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float gradientScaleFactor = a3;
}

- (BOOL)hasSparseQuantizedGradient
{
  return self->_sparseQuantizedGradient != 0;
}

- (BOOL)hasIteration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIteration:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIteration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iteration = a3;
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasSparseFloatGradient
{
  return self->_sparseFloatGradient != 0;
}

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

@end