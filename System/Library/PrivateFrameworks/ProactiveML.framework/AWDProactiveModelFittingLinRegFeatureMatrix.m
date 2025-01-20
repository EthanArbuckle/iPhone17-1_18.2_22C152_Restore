@interface AWDProactiveModelFittingLinRegFeatureMatrix
- (AWDProactiveModelFittingMinibatchStats)minibatchStats;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (AWDProactiveModelFittingQuantizedSparseMatrix)sparseQuantizedFeatureMatrix;
- (AWDProactiveModelFittingSparseFloatMatrix)sparseFloatFeatureMatrix;
- (BOOL)hasFeatureMatrix;
- (BOOL)hasFeatureMatrixL2norm;
- (BOOL)hasFeatureMatrixScaleFactor;
- (BOOL)hasMinibatchStats;
- (BOOL)hasModelInfo;
- (BOOL)hasSparseFloatFeatureMatrix;
- (BOOL)hasSparseQuantizedFeatureMatrix;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)featureMatrixL2norm;
- (float)featureMatrixScaleFactor;
- (float)featureMatrixValueAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeatureMatrixL2norm:(float)a3;
- (void)setFeatureMatrixScaleFactor:(float)a3;
- (void)setHasFeatureMatrixL2norm:(BOOL)a3;
- (void)setHasFeatureMatrixScaleFactor:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMinibatchStats:(id)a3;
- (void)setModelInfo:(id)a3;
- (void)setSparseFloatFeatureMatrix:(id)a3;
- (void)setSparseQuantizedFeatureMatrix:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingLinRegFeatureMatrix

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseQuantizedFeatureMatrix, 0);
  objc_storeStrong((id *)&self->_sparseFloatFeatureMatrix, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
}

- (float)featureMatrixL2norm
{
  return self->_featureMatrixL2norm;
}

- (float)featureMatrixScaleFactor
{
  return self->_featureMatrixScaleFactor;
}

- (void)setSparseQuantizedFeatureMatrix:(id)a3
{
}

- (AWDProactiveModelFittingQuantizedSparseMatrix)sparseQuantizedFeatureMatrix
{
  return self->_sparseQuantizedFeatureMatrix;
}

- (void)setMinibatchStats:(id)a3
{
}

- (AWDProactiveModelFittingMinibatchStats)minibatchStats
{
  return self->_minibatchStats;
}

- (void)setSparseFloatFeatureMatrix:(id)a3
{
}

- (AWDProactiveModelFittingSparseFloatMatrix)sparseFloatFeatureMatrix
{
  return self->_sparseFloatFeatureMatrix;
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
  if (v4[7])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  modelInfo = self->_modelInfo;
  uint64_t v7 = v5[4];
  v15 = v5;
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
    -[AWDProactiveModelFittingLinRegFeatureMatrix setModelInfo:](self, "setModelInfo:");
  }
  v5 = v15;
LABEL_9:
  sparseFloatFeatureMatrix = self->_sparseFloatFeatureMatrix;
  uint64_t v9 = v5[5];
  if (sparseFloatFeatureMatrix)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingSparseFloatMatrix mergeFrom:](sparseFloatFeatureMatrix, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingLinRegFeatureMatrix setSparseFloatFeatureMatrix:](self, "setSparseFloatFeatureMatrix:");
  }
  v5 = v15;
LABEL_15:
  minibatchStats = self->_minibatchStats;
  uint64_t v11 = v5[3];
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
    -[AWDProactiveModelFittingLinRegFeatureMatrix setMinibatchStats:](self, "setMinibatchStats:");
  }
  v5 = v15;
LABEL_21:
  sparseQuantizedFeatureMatrix = self->_sparseQuantizedFeatureMatrix;
  uint64_t v13 = v5[6];
  if (sparseQuantizedFeatureMatrix)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDProactiveModelFittingQuantizedSparseMatrix mergeFrom:](sparseQuantizedFeatureMatrix, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDProactiveModelFittingLinRegFeatureMatrix setSparseQuantizedFeatureMatrix:](self, "setSparseQuantizedFeatureMatrix:");
  }
  v5 = v15;
LABEL_27:
  char v14 = *((unsigned char *)v5 + 56);
  if ((v14 & 4) != 0)
  {
    self->_featureMatrixScaleFactor = *((float *)v5 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v14 = *((unsigned char *)v5 + 56);
  }
  if ((v14 & 2) != 0)
  {
    self->_featureMatrixL2norm = *((float *)v5 + 4);
    *(unsigned char *)&self->_has |= 2u;
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
  unint64_t v5 = [(AWDProactiveModelFittingSparseFloatMatrix *)self->_sparseFloatFeatureMatrix hash];
  unint64_t v6 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats hash];
  unint64_t v7 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)self->_sparseQuantizedFeatureMatrix hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    float featureMatrixScaleFactor = self->_featureMatrixScaleFactor;
    double v11 = featureMatrixScaleFactor;
    if (featureMatrixScaleFactor < 0.0) {
      double v11 = -featureMatrixScaleFactor;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 2) != 0)
  {
    float featureMatrixL2norm = self->_featureMatrixL2norm;
    double v16 = featureMatrixL2norm;
    if (featureMatrixL2norm < 0.0) {
      double v16 = -featureMatrixL2norm;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_24:
    BOOL v9 = 0;
    goto LABEL_25;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((void *)v4 + 4)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_24;
  }
  sparseFloatFeatureMatrix = self->_sparseFloatFeatureMatrix;
  if ((unint64_t)sparseFloatFeatureMatrix | *((void *)v4 + 5))
  {
    if (!-[AWDProactiveModelFittingSparseFloatMatrix isEqual:](sparseFloatFeatureMatrix, "isEqual:")) {
      goto LABEL_24;
    }
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((void *)v4 + 3))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:")) {
      goto LABEL_24;
    }
  }
  sparseQuantizedFeatureMatrix = self->_sparseQuantizedFeatureMatrix;
  if ((unint64_t)sparseQuantizedFeatureMatrix | *((void *)v4 + 6))
  {
    if (!-[AWDProactiveModelFittingQuantizedSparseMatrix isEqual:](sparseQuantizedFeatureMatrix, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_featureMatrixScaleFactor != *((float *)v4 + 5)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_24;
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_featureMatrixL2norm != *((float *)v4 + 4)) {
      goto LABEL_24;
    }
    BOOL v9 = 1;
  }
LABEL_25:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v7 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo copyWithZone:a3];
  v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  id v9 = [(AWDProactiveModelFittingSparseFloatMatrix *)self->_sparseFloatFeatureMatrix copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  id v11 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats copyWithZone:a3];
  long double v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  id v13 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)self->_sparseQuantizedFeatureMatrix copyWithZone:a3];
  unint64_t v14 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v13;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)(v6 + 20) = self->_featureMatrixScaleFactor;
    *(unsigned char *)(v6 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v6 + 16) = self->_featureMatrixL2norm;
    *(unsigned char *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  uint64_t v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    id v4 = v6;
  }
  if (self->_sparseFloatFeatureMatrix)
  {
    objc_msgSend(v6, "setSparseFloatFeatureMatrix:");
    id v4 = v6;
  }
  if (self->_minibatchStats)
  {
    objc_msgSend(v6, "setMinibatchStats:");
    id v4 = v6;
  }
  if (self->_sparseQuantizedFeatureMatrix)
  {
    objc_msgSend(v6, "setSparseQuantizedFeatureMatrix:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_featureMatrixScaleFactor);
    *((unsigned char *)v4 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_featureMatrixL2norm);
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_modelInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sparseFloatFeatureMatrix) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_minibatchStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sparseQuantizedFeatureMatrix) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingLinRegFeatureMatrixReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
  modelInfo = self->_modelInfo;
  if (modelInfo)
  {
    id v7 = [(AWDProactiveModelFittingModelInfo *)modelInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"modelInfo"];
  }
  sparseFloatFeatureMatrix = self->_sparseFloatFeatureMatrix;
  if (sparseFloatFeatureMatrix)
  {
    id v9 = [(AWDProactiveModelFittingSparseFloatMatrix *)sparseFloatFeatureMatrix dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"sparseFloatFeatureMatrix"];
  }
  minibatchStats = self->_minibatchStats;
  if (minibatchStats)
  {
    id v11 = [(AWDProactiveModelFittingMinibatchStats *)minibatchStats dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"minibatchStats"];
  }
  sparseQuantizedFeatureMatrix = self->_sparseQuantizedFeatureMatrix;
  if (sparseQuantizedFeatureMatrix)
  {
    id v13 = [(AWDProactiveModelFittingQuantizedSparseMatrix *)sparseQuantizedFeatureMatrix dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"sparseQuantizedFeatureMatrix"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_featureMatrixScaleFactor;
    v15 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v15 forKey:@"featureMatrixScaleFactor"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_featureMatrixL2norm;
    double v16 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v16 forKey:@"featureMatrixL2norm"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingLinRegFeatureMatrix;
  double v4 = [(AWDProactiveModelFittingLinRegFeatureMatrix *)&v8 description];
  id v5 = [(AWDProactiveModelFittingLinRegFeatureMatrix *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFeatureMatrixL2norm
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasFeatureMatrixL2norm:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setFeatureMatrixL2norm:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float featureMatrixL2norm = a3;
}

- (BOOL)hasFeatureMatrixScaleFactor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasFeatureMatrixScaleFactor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setFeatureMatrixScaleFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float featureMatrixScaleFactor = a3;
}

- (BOOL)hasSparseQuantizedFeatureMatrix
{
  return self->_sparseQuantizedFeatureMatrix != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasSparseFloatFeatureMatrix
{
  return self->_sparseFloatFeatureMatrix != 0;
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

- (float)featureMatrixValueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  if ([(AWDProactiveModelFittingLinRegFeatureMatrix *)self hasSparseFloatFeatureMatrix])
  {
    id v7 = [(AWDProactiveModelFittingLinRegFeatureMatrix *)self sparseFloatFeatureMatrix];
    [v7 valueAtRow:a3 column:a4];
LABEL_5:
    float v9 = v8;

    return v9;
  }
  float v9 = 0.0;
  if ([(AWDProactiveModelFittingLinRegFeatureMatrix *)self hasSparseQuantizedFeatureMatrix])
  {
    id v7 = [(AWDProactiveModelFittingLinRegFeatureMatrix *)self sparseQuantizedFeatureMatrix];
    [v7 originalValueAtRow:a3 column:a4];
    goto LABEL_5;
  }
  return v9;
}

- (BOOL)hasFeatureMatrix
{
  if ([(AWDProactiveModelFittingLinRegFeatureMatrix *)self hasSparseFloatFeatureMatrix]) {
    return 1;
  }
  return [(AWDProactiveModelFittingLinRegFeatureMatrix *)self hasSparseQuantizedFeatureMatrix];
}

@end