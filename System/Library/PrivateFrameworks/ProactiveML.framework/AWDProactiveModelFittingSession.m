@interface AWDProactiveModelFittingSession
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (AWDProactiveModelFittingSparseFloatVector)sparseFloatFeatures;
- (BOOL)hasConfidenceScore;
- (BOOL)hasLabel;
- (BOOL)hasModelInfo;
- (BOOL)hasSparseFloatFeatures;
- (BOOL)hasSupervisionType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)confidenceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)label;
- (unint64_t)supervisionType;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidenceScore:(float)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHasSupervisionType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLabel:(unint64_t)a3;
- (void)setModelInfo:(id)a3;
- (void)setSparseFloatFeatures:(id)a3;
- (void)setSupervisionType:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseFloatFeatures, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (unint64_t)supervisionType
{
  return self->_supervisionType;
}

- (void)setSparseFloatFeatures:(id)a3
{
}

- (AWDProactiveModelFittingSparseFloatVector)sparseFloatFeatures
{
  return self->_sparseFloatFeatures;
}

- (unint64_t)label
{
  return self->_label;
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
  if ((v4[7] & 4) != 0)
  {
    self->_timestamp = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  modelInfo = self->_modelInfo;
  uint64_t v7 = v5[5];
  v11 = v5;
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
    -[AWDProactiveModelFittingSession setModelInfo:](self, "setModelInfo:");
  }
  v5 = v11;
LABEL_9:
  if (v5[7])
  {
    self->_label = v5[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  sparseFloatFeatures = self->_sparseFloatFeatures;
  uint64_t v9 = v5[6];
  if (sparseFloatFeatures)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[AWDProactiveModelFittingSparseFloatVector mergeFrom:](sparseFloatFeatures, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[AWDProactiveModelFittingSession setSparseFloatFeatures:](self, "setSparseFloatFeatures:");
  }
  v5 = v11;
LABEL_17:
  char v10 = *((unsigned char *)v5 + 56);
  if ((v10 & 2) != 0)
  {
    self->_supervisionType = v5[2];
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v5 + 56);
  }
  if ((v10 & 8) != 0)
  {
    self->_confidenceScore = *((float *)v5 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_label;
  }
  else {
    unint64_t v5 = 0;
  }
  unint64_t v6 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatFeatures hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v7 = 2654435761u * self->_supervisionType;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  float confidenceScore = self->_confidenceScore;
  double v9 = confidenceScore;
  if (confidenceScore < 0.0) {
    double v9 = -confidenceScore;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 56);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_timestamp != *((void *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_27;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((void *)v4 + 5))
  {
    if (!-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 56);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_label != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (v6)
  {
    goto LABEL_27;
  }
  sparseFloatFeatures = self->_sparseFloatFeatures;
  if ((unint64_t)sparseFloatFeatures | *((void *)v4 + 6))
  {
    if (-[AWDProactiveModelFittingSparseFloatVector isEqual:](sparseFloatFeatures, "isEqual:"))
    {
      char has = (char)self->_has;
      char v6 = *((unsigned char *)v4 + 56);
      goto LABEL_18;
    }
LABEL_27:
    BOOL v9 = 0;
    goto LABEL_28;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_supervisionType != *((void *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_27;
  }
  BOOL v9 = (v6 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_confidenceScore != *((float *)v4 + 8)) {
      goto LABEL_27;
    }
    BOOL v9 = 1;
  }
LABEL_28:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
  id v7 = [(AWDProactiveModelFittingModelInfo *)self->_modelInfo copyWithZone:a3];
  v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_label;
    *(unsigned char *)(v6 + 56) |= 1u;
  }
  id v9 = [(AWDProactiveModelFittingSparseFloatVector *)self->_sparseFloatFeatures copyWithZone:a3];
  long double v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_supervisionType;
    *(unsigned char *)(v6 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(float *)(v6 + 32) = self->_confidenceScore;
    *(unsigned char *)(v6 + 56) |= 8u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[3] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 4u;
  }
  uint64_t v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_label;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_sparseFloatFeatures)
  {
    objc_msgSend(v6, "setSparseFloatFeatures:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_supervisionType;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_confidenceScore);
    *((unsigned char *)v4 + 56) |= 8u;
  }
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_modelInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_sparseFloatFeatures) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
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
  if (*(unsigned char *)&self->_has)
  {
    v8 = [NSNumber numberWithUnsignedLongLong:self->_label];
    [v3 setObject:v8 forKey:@"label"];
  }
  sparseFloatFeatures = self->_sparseFloatFeatures;
  if (sparseFloatFeatures)
  {
    long double v10 = [(AWDProactiveModelFittingSparseFloatVector *)sparseFloatFeatures dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"sparseFloatFeatures"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v12 = [NSNumber numberWithUnsignedLongLong:self->_supervisionType];
    [v3 setObject:v12 forKey:@"supervisionType"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(float *)&double v4 = self->_confidenceScore;
    v13 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v13 forKey:@"confidenceScore"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingSession;
  double v4 = [(AWDProactiveModelFittingSession *)&v8 description];
  id v5 = [(AWDProactiveModelFittingSession *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasConfidenceScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setConfidenceScore:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float confidenceScore = a3;
}

- (BOOL)hasSupervisionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSupervisionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSupervisionType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_supervisionType = a3;
}

- (BOOL)hasSparseFloatFeatures
{
  return self->_sparseFloatFeatures != 0;
}

- (BOOL)hasLabel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLabel:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLabel:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_label = a3;
}

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

@end