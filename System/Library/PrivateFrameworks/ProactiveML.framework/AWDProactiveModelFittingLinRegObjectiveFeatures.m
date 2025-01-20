@interface AWDProactiveModelFittingLinRegObjectiveFeatures
- (AWDProactiveModelFittingMinibatchStats)minibatchStats;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedFeatures;
- (AWDProactiveModelFittingSparseFloatVector)sparseFloatFeatures;
- (BOOL)hasFeaturesL2norm;
- (BOOL)hasFeaturesScaleFactor;
- (BOOL)hasMinibatchStats;
- (BOOL)hasModelInfo;
- (BOOL)hasObjectiveFeatures;
- (BOOL)hasSparseFloatFeatures;
- (BOOL)hasSparseQuantizedFeatures;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)featuresL2norm;
- (float)featuresScaleFactor;
- (float)featuresValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)featuresLength;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeaturesL2norm:(float)a3;
- (void)setFeaturesScaleFactor:(float)a3;
- (void)setHasFeaturesL2norm:(BOOL)a3;
- (void)setHasFeaturesScaleFactor:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMinibatchStats:(id)a3;
- (void)setModelInfo:(id)a3;
- (void)setSparseFloatFeatures:(id)a3;
- (void)setSparseQuantizedFeatures:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingLinRegObjectiveFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseQuantizedFeatures, 0);
  objc_storeStrong((id *)&self->_sparseFloatFeatures, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
}

- (float)featuresL2norm
{
  return self->_featuresL2norm;
}

- (float)featuresScaleFactor
{
  return self->_featuresScaleFactor;
}

- (void)setSparseQuantizedFeatures:(id)a3
{
}

- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedFeatures
{
  return self->_sparseQuantizedFeatures;
}

- (void)setMinibatchStats:(id)a3
{
}

- (AWDProactiveModelFittingMinibatchStats)minibatchStats
{
  return self->_minibatchStats;
}

- (void)setSparseFloatFeatures:(id)a3
{
}

- (AWDProactiveModelFittingSparseFloatVector)sparseFloatFeatures
{
  return self->_sparseFloatFeatures;
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
    -[AWDProactiveModelFittingLinRegObjectiveFeatures setModelInfo:](self, "setModelInfo:");
  }
  v5 = v15;
LABEL_9:
  sparseFloatFeatures = self->_sparseFloatFeatures;
  uint64_t v9 = v5[5];
  if (sparseFloatFeatures)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingSparseFloatVector mergeFrom:](sparseFloatFeatures, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[AWDProactiveModelFittingLinRegObjectiveFeatures setSparseFloatFeatures:](self, "setSparseFloatFeatures:");
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
    -[AWDProactiveModelFittingLinRegObjectiveFeatures setMinibatchStats:](self, "setMinibatchStats:");
  }
  v5 = v15;
LABEL_21:
  sparseQuantizedFeatures = self->_sparseQuantizedFeatures;
  uint64_t v13 = v5[6];
  if (sparseQuantizedFeatures)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDProactiveModelFittingQuantizedSparseVector mergeFrom:](sparseQuantizedFeatures, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[AWDProactiveModelFittingLinRegObjectiveFeatures setSparseQuantizedFeatures:](self, "setSparseQuantizedFeatures:");
  }
  v5 = v15;
LABEL_27:
  char v14 = *((unsigned char *)v5 + 56);
  if ((v14 & 4) != 0)
  {
    self->_featuresScaleFactor = *((float *)v5 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v14 = *((unsigned char *)v5 + 56);
  }
  if ((v14 & 2) != 0)
  {
    self->_featuresL2norm = *((float *)v5 + 4);
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
  unint64_t v5 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatFeatures hash];
  unint64_t v6 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats hash];
  unint64_t v7 = [(AWDProactiveModelFittingQuantizedSparseVector *)self->_sparseQuantizedFeatures hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    float featuresScaleFactor = self->_featuresScaleFactor;
    double v11 = featuresScaleFactor;
    if (featuresScaleFactor < 0.0) {
      double v11 = -featuresScaleFactor;
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
    float featuresL2norm = self->_featuresL2norm;
    double v16 = featuresL2norm;
    if (featuresL2norm < 0.0) {
      double v16 = -featuresL2norm;
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
  sparseFloatFeatures = self->_sparseFloatFeatures;
  if ((unint64_t)sparseFloatFeatures | *((void *)v4 + 5))
  {
    if (!-[AWDProactiveModelFittingSparseFloatVector isEqual:](sparseFloatFeatures, "isEqual:")) {
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
  sparseQuantizedFeatures = self->_sparseQuantizedFeatures;
  if ((unint64_t)sparseQuantizedFeatures | *((void *)v4 + 6))
  {
    if (!-[AWDProactiveModelFittingQuantizedSparseVector isEqual:](sparseQuantizedFeatures, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_featuresScaleFactor != *((float *)v4 + 5)) {
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
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_featuresL2norm != *((float *)v4 + 4)) {
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

  id v9 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatFeatures copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  id v11 = [(AWDProactiveModelFittingMinibatchStats *)self->_minibatchStats copyWithZone:a3];
  long double v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  id v13 = [(AWDProactiveModelFittingQuantizedSparseVector *)self->_sparseQuantizedFeatures copyWithZone:a3];
  unint64_t v14 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v13;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)(v6 + 20) = self->_featuresScaleFactor;
    *(unsigned char *)(v6 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v6 + 16) = self->_featuresL2norm;
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
  if (self->_sparseFloatFeatures)
  {
    objc_msgSend(v6, "setSparseFloatFeatures:");
    id v4 = v6;
  }
  if (self->_minibatchStats)
  {
    objc_msgSend(v6, "setMinibatchStats:");
    id v4 = v6;
  }
  if (self->_sparseQuantizedFeatures)
  {
    objc_msgSend(v6, "setSparseQuantizedFeatures:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_featuresScaleFactor);
    *((unsigned char *)v4 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_featuresL2norm);
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
  if (self->_sparseFloatFeatures) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_minibatchStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sparseQuantizedFeatures) {
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
  return AWDProactiveModelFittingLinRegObjectiveFeaturesReadFrom((uint64_t)self, (uint64_t)a3);
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
  sparseFloatFeatures = self->_sparseFloatFeatures;
  if (sparseFloatFeatures)
  {
    id v9 = [(AWDProactiveModelFittingSparseFloatVector *)sparseFloatFeatures dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"sparseFloatFeatures"];
  }
  minibatchStats = self->_minibatchStats;
  if (minibatchStats)
  {
    id v11 = [(AWDProactiveModelFittingMinibatchStats *)minibatchStats dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"minibatchStats"];
  }
  sparseQuantizedFeatures = self->_sparseQuantizedFeatures;
  if (sparseQuantizedFeatures)
  {
    id v13 = [(AWDProactiveModelFittingQuantizedSparseVector *)sparseQuantizedFeatures dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"sparseQuantizedFeatures"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_featuresScaleFactor;
    v15 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v15 forKey:@"featuresScaleFactor"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_featuresL2norm;
    double v16 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v16 forKey:@"featuresL2norm"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingLinRegObjectiveFeatures;
  double v4 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)&v8 description];
  id v5 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFeaturesL2norm
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasFeaturesL2norm:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setFeaturesL2norm:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float featuresL2norm = a3;
}

- (BOOL)hasFeaturesScaleFactor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasFeaturesScaleFactor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setFeaturesScaleFactor:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float featuresScaleFactor = a3;
}

- (BOOL)hasSparseQuantizedFeatures
{
  return self->_sparseQuantizedFeatures != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasSparseFloatFeatures
{
  return self->_sparseFloatFeatures != 0;
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

- (unint64_t)featuresLength
{
  if ([(AWDProactiveModelFittingLinRegObjectiveFeatures *)self hasSparseFloatFeatures])
  {
    char v3 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self sparseFloatFeatures];
    unint64_t v4 = [v3 length];
  }
  else
  {
    if (![(AWDProactiveModelFittingLinRegObjectiveFeatures *)self hasSparseQuantizedFeatures])return 0; {
    char v3 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self sparseQuantizedFeatures];
    }
    unint64_t v4 = [v3 length];
  }

  return v4;
}

- (float)featuresValueAtIndex:(unint64_t)a3
{
  if ([(AWDProactiveModelFittingLinRegObjectiveFeatures *)self hasSparseFloatFeatures])
  {
    id v5 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self sparseFloatFeatures];
    [v5 valueAtIndex:a3];
LABEL_5:
    float v7 = v6;

    return v7;
  }
  float v7 = 0.0;
  if ([(AWDProactiveModelFittingLinRegObjectiveFeatures *)self hasSparseQuantizedFeatures])
  {
    id v5 = [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self sparseQuantizedFeatures];
    [v5 originalValueAtIndex:a3];
    goto LABEL_5;
  }
  return v7;
}

- (BOOL)hasObjectiveFeatures
{
  if ([(AWDProactiveModelFittingLinRegObjectiveFeatures *)self hasSparseFloatFeatures]) {
    return 1;
  }
  return [(AWDProactiveModelFittingLinRegObjectiveFeatures *)self hasSparseQuantizedFeatures];
}

@end