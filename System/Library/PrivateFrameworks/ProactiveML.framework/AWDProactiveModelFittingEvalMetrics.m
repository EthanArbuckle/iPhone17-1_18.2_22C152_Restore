@interface AWDProactiveModelFittingEvalMetrics
+ (AWDProactiveModelFittingEvalMetrics)evalMetricsWithRmse:(float)a3 f1:(float)a4;
+ (AWDProactiveModelFittingEvalMetrics)evalMetricsWithRmse:(float)a3 f1:(float)a4 truePositives:(unint64_t)a5 trueNegatives:(unint64_t)a6 falsePositives:(unint64_t)a7 falseNegatives:(unint64_t)a8;
- (BOOL)hasF1;
- (BOOL)hasFalseNegatives;
- (BOOL)hasFalsePositives;
- (BOOL)hasRmse;
- (BOOL)hasSecsToExecute;
- (BOOL)hasTrueNegatives;
- (BOOL)hasTruePositives;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)f1;
- (float)negativeScores;
- (float)negativeScoresAtIndex:(unint64_t)a3;
- (float)positiveScores;
- (float)positiveScoresAtIndex:(unint64_t)a3;
- (float)rmse;
- (float)secsToExecute;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)toDictionary;
- (unint64_t)falseNegatives;
- (unint64_t)falsePositives;
- (unint64_t)hash;
- (unint64_t)negativeScoresCount;
- (unint64_t)positiveScoresCount;
- (unint64_t)trueNegatives;
- (unint64_t)truePositives;
- (void)addNegativeScores:(float)a3;
- (void)addPositiveScores:(float)a3;
- (void)clearNegativeScores;
- (void)clearPositiveScores;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setF1:(float)a3;
- (void)setFalseNegatives:(unint64_t)a3;
- (void)setFalsePositives:(unint64_t)a3;
- (void)setHasF1:(BOOL)a3;
- (void)setHasFalseNegatives:(BOOL)a3;
- (void)setHasFalsePositives:(BOOL)a3;
- (void)setHasRmse:(BOOL)a3;
- (void)setHasSecsToExecute:(BOOL)a3;
- (void)setHasTrueNegatives:(BOOL)a3;
- (void)setHasTruePositives:(BOOL)a3;
- (void)setNegativeScores:(float *)a3 count:(unint64_t)a4;
- (void)setPositiveScores:(float *)a3 count:(unint64_t)a4;
- (void)setRmse:(float)a3;
- (void)setSecsToExecute:(float)a3;
- (void)setTrueNegatives:(unint64_t)a3;
- (void)setTruePositives:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingEvalMetrics

+ (AWDProactiveModelFittingEvalMetrics)evalMetricsWithRmse:(float)a3 f1:(float)a4 truePositives:(unint64_t)a5 trueNegatives:(unint64_t)a6 falsePositives:(unint64_t)a7 falseNegatives:(unint64_t)a8
{
  v14 = objc_opt_new();
  *(float *)&double v15 = a3;
  [v14 setRmse:v15];
  *(float *)&double v16 = a4;
  [v14 setF1:v16];
  [v14 setTruePositives:a5];
  [v14 setTrueNegatives:a6];
  [v14 setFalsePositives:a7];
  [v14 setFalseNegatives:a8];
  return (AWDProactiveModelFittingEvalMetrics *)v14;
}

+ (AWDProactiveModelFittingEvalMetrics)evalMetricsWithRmse:(float)a3 f1:(float)a4
{
  v6 = objc_opt_new();
  *(float *)&double v7 = a3;
  [v6 setRmse:v7];
  *(float *)&double v8 = a4;
  [v6 setF1:v8];
  return (AWDProactiveModelFittingEvalMetrics *)v6;
}

- (float)secsToExecute
{
  return self->_secsToExecute;
}

- (unint64_t)falseNegatives
{
  return self->_falseNegatives;
}

- (unint64_t)falsePositives
{
  return self->_falsePositives;
}

- (unint64_t)trueNegatives
{
  return self->_trueNegatives;
}

- (unint64_t)truePositives
{
  return self->_truePositives;
}

- (float)f1
{
  return self->_f1;
}

- (float)rmse
{
  return self->_rmse;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 0x20) != 0)
  {
    self->_rmse = *((float *)v4 + 23);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 100);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_f1 = *((float *)v4 + 22);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_truePositives = *((void *)v4 + 10);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_trueNegatives = *((void *)v4 + 9);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  self->_falsePositives = *((void *)v4 + 8);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 100))
  {
LABEL_7:
    self->_falseNegatives = *((void *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
  v12 = (float *)v4;
  uint64_t v6 = [v4 positiveScoresCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      [v12 positiveScoresAtIndex:i];
      -[AWDProactiveModelFittingEvalMetrics addPositiveScores:](self, "addPositiveScores:");
    }
  }
  uint64_t v9 = [v12 negativeScoresCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
    {
      [v12 negativeScoresAtIndex:j];
      -[AWDProactiveModelFittingEvalMetrics addNegativeScores:](self, "addNegativeScores:");
    }
  }
  if (((_BYTE)v12[25] & 0x40) != 0)
  {
    self->_secsToExecute = v12[24];
    *(unsigned char *)&self->_has |= 0x40u;
  }
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    float rmse = self->_rmse;
    double v6 = rmse;
    if (rmse < 0.0) {
      double v6 = -rmse;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float f1 = self->_f1;
    double v11 = f1;
    if (f1 < 0.0) {
      double v11 = -f1;
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
  if ((has & 8) != 0)
  {
    unint64_t v25 = 2654435761u * self->_truePositives;
    if ((has & 4) != 0)
    {
LABEL_19:
      unint64_t v14 = 2654435761u * self->_trueNegatives;
      if ((has & 2) != 0) {
        goto LABEL_20;
      }
LABEL_24:
      unint64_t v15 = 0;
      if (has) {
        goto LABEL_21;
      }
      goto LABEL_25;
    }
  }
  else
  {
    unint64_t v25 = 0;
    if ((has & 4) != 0) {
      goto LABEL_19;
    }
  }
  unint64_t v14 = 0;
  if ((has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  unint64_t v15 = 2654435761u * self->_falsePositives;
  if (has)
  {
LABEL_21:
    unint64_t v16 = 2654435761u * self->_falseNegatives;
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v16 = 0;
LABEL_26:
  uint64_t v17 = PBRepeatedFloatHash();
  uint64_t v18 = PBRepeatedFloatHash();
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    float secsToExecute = self->_secsToExecute;
    double v21 = secsToExecute;
    if (secsToExecute < 0.0) {
      double v21 = -secsToExecute;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v25 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x20) == 0 || self->_rmse != *((float *)v4 + 23)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x20) != 0)
  {
LABEL_38:
    BOOL v5 = 0;
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x10) == 0 || self->_f1 != *((float *)v4 + 22)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0 || self->_truePositives != *((void *)v4 + 10)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_trueNegatives != *((void *)v4 + 9)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_falsePositives != *((void *)v4 + 8)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_falseNegatives != *((void *)v4 + 7)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_38;
  }
  if (!PBRepeatedFloatIsEqual() || !PBRepeatedFloatIsEqual()) {
    goto LABEL_38;
  }
  BOOL v5 = (*((unsigned char *)v4 + 100) & 0x40) == 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x40) == 0 || self->_secsToExecute != *((float *)v4 + 24)) {
      goto LABEL_38;
    }
    BOOL v5 = 1;
  }
LABEL_39:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(float *)(v4 + 92) = self->_rmse;
    *(unsigned char *)(v4 + 100) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 88) = self->_f1;
  *(unsigned char *)(v4 + 100) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(void *)(v4 + 80) = self->_truePositives;
  *(unsigned char *)(v4 + 100) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(void *)(v4 + 72) = self->_trueNegatives;
  *(unsigned char *)(v4 + 100) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *(void *)(v4 + 64) = self->_falsePositives;
  *(unsigned char *)(v4 + 100) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    *(void *)(v4 + 56) = self->_falseNegatives;
    *(unsigned char *)(v4 + 100) |= 1u;
  }
LABEL_8:
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(float *)(v5 + 96) = self->_secsToExecute;
    *(unsigned char *)(v5 + 100) |= 0x40u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[23] = LODWORD(self->_rmse);
    *((unsigned char *)v4 + 100) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[22] = LODWORD(self->_f1);
  *((unsigned char *)v4 + 100) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)v4 + 10) = self->_truePositives;
  *((unsigned char *)v4 + 100) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
LABEL_25:
    *((void *)v4 + 8) = self->_falsePositives;
    *((unsigned char *)v4 + 100) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_24:
  *((void *)v4 + 9) = self->_trueNegatives;
  *((unsigned char *)v4 + 100) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_25;
  }
LABEL_6:
  if (has)
  {
LABEL_7:
    *((void *)v4 + 7) = self->_falseNegatives;
    *((unsigned char *)v4 + 100) |= 1u;
  }
LABEL_8:
  id v12 = v4;
  if ([(AWDProactiveModelFittingEvalMetrics *)self positiveScoresCount])
  {
    [v12 clearPositiveScores];
    unint64_t v6 = [(AWDProactiveModelFittingEvalMetrics *)self positiveScoresCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(AWDProactiveModelFittingEvalMetrics *)self positiveScoresAtIndex:i];
        objc_msgSend(v12, "addPositiveScores:");
      }
    }
  }
  if ([(AWDProactiveModelFittingEvalMetrics *)self negativeScoresCount])
  {
    [v12 clearNegativeScores];
    unint64_t v9 = [(AWDProactiveModelFittingEvalMetrics *)self negativeScoresCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        [(AWDProactiveModelFittingEvalMetrics *)self negativeScoresAtIndex:j];
        objc_msgSend(v12, "addNegativeScores:");
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v12 + 24) = LODWORD(self->_secsToExecute);
    *((unsigned char *)v12 + 100) |= 0x40u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_7:
  }
    PBDataWriterWriteUint64Field();
LABEL_8:
  if (self->_positiveScores.count)
  {
    PBDataWriterPlaceMark();
    if (self->_positiveScores.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v6;
      }
      while (v6 < self->_positiveScores.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_negativeScores.count)
  {
    PBDataWriterPlaceMark();
    if (self->_negativeScores.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v7;
      }
      while (v7 < self->_negativeScores.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(float *)&double v4 = self->_rmse;
    id v12 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v12 forKey:@"rmse"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_f1;
  double v13 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v13 forKey:@"f1"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v14 = [NSNumber numberWithUnsignedLongLong:self->_truePositives];
  [v3 setObject:v14 forKey:@"truePositives"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v15 = [NSNumber numberWithUnsignedLongLong:self->_trueNegatives];
  [v3 setObject:v15 forKey:@"trueNegatives"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  unint64_t v16 = [NSNumber numberWithUnsignedLongLong:self->_falsePositives];
  [v3 setObject:v16 forKey:@"falsePositives"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    unint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_falseNegatives];
    [v3 setObject:v6 forKey:@"falseNegatives"];
  }
LABEL_8:
  unint64_t v7 = PBRepeatedFloatNSArray();
  [v3 setObject:v7 forKey:@"positiveScores"];

  double v8 = PBRepeatedFloatNSArray();
  [v3 setObject:v8 forKey:@"negativeScores"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(float *)&double v9 = self->_secsToExecute;
    unint64_t v10 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v10 forKey:@"secsToExecute"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingEvalMetrics;
  double v4 = [(AWDProactiveModelFittingEvalMetrics *)&v8 description];
  uint64_t v5 = [(AWDProactiveModelFittingEvalMetrics *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSecsToExecute
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasSecsToExecute:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setSecsToExecute:(float)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_float secsToExecute = a3;
}

- (void)setNegativeScores:(float *)a3 count:(unint64_t)a4
{
}

- (float)negativeScoresAtIndex:(unint64_t)a3
{
  p_negativeScores = &self->_negativeScores;
  unint64_t count = self->_negativeScores.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_negativeScores->list[a3];
}

- (void)addNegativeScores:(float)a3
{
}

- (void)clearNegativeScores
{
}

- (float)negativeScores
{
  return self->_negativeScores.list;
}

- (unint64_t)negativeScoresCount
{
  return self->_negativeScores.count;
}

- (void)setPositiveScores:(float *)a3 count:(unint64_t)a4
{
}

- (float)positiveScoresAtIndex:(unint64_t)a3
{
  p_positiveScores = &self->_positiveScores;
  unint64_t count = self->_positiveScores.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    double v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_positiveScores->list[a3];
}

- (void)addPositiveScores:(float)a3
{
}

- (void)clearPositiveScores
{
}

- (float)positiveScores
{
  return self->_positiveScores.list;
}

- (unint64_t)positiveScoresCount
{
  return self->_positiveScores.count;
}

- (BOOL)hasFalseNegatives
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasFalseNegatives:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setFalseNegatives:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_falseNegatives = a3;
}

- (BOOL)hasFalsePositives
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasFalsePositives:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setFalsePositives:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_falsePositives = a3;
}

- (BOOL)hasTrueNegatives
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTrueNegatives:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTrueNegatives:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_trueNegatives = a3;
}

- (BOOL)hasTruePositives
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTruePositives:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setTruePositives:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_truePositives = a3;
}

- (BOOL)hasF1
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasF1:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setF1:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float f1 = a3;
}

- (BOOL)hasRmse
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasRmse:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setRmse:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_float rmse = a3;
}

- (void)dealloc
{
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingEvalMetrics;
  [(AWDProactiveModelFittingEvalMetrics *)&v3 dealloc];
}

- (id)toDictionary
{
  v26[8] = *MEMORY[0x263EF8340];
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[AWDProactiveModelFittingEvalMetrics positiveScoresCount](self, "positiveScoresCount"));
  if ([(AWDProactiveModelFittingEvalMetrics *)self positiveScoresCount])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = (void *)MEMORY[0x223C7E5C0]();
      id v6 = objc_alloc(NSNumber);
      LODWORD(v7) = [(AWDProactiveModelFittingEvalMetrics *)self positiveScores][4 * v4];
      objc_super v8 = (void *)[v6 initWithFloat:v7];
      [v3 addObject:v8];

      ++v4;
    }
    while ([(AWDProactiveModelFittingEvalMetrics *)self positiveScoresCount] > v4);
  }
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[AWDProactiveModelFittingEvalMetrics negativeScoresCount](self, "negativeScoresCount"));
  if ([(AWDProactiveModelFittingEvalMetrics *)self negativeScoresCount])
  {
    unint64_t v10 = 0;
    do
    {
      double v11 = (void *)MEMORY[0x223C7E5C0]();
      id v12 = objc_alloc(NSNumber);
      LODWORD(v13) = [(AWDProactiveModelFittingEvalMetrics *)self negativeScores][4 * v10];
      unint64_t v14 = (void *)[v12 initWithFloat:v13];
      [v9 addObject:v14];

      ++v10;
    }
    while ([(AWDProactiveModelFittingEvalMetrics *)self negativeScoresCount] > v10);
  }
  v25[0] = @"rmse";
  unint64_t v15 = NSNumber;
  [(AWDProactiveModelFittingEvalMetrics *)self rmse];
  unint64_t v16 = objc_msgSend(v15, "numberWithFloat:");
  v26[0] = v16;
  v25[1] = @"f1";
  uint64_t v17 = NSNumber;
  [(AWDProactiveModelFittingEvalMetrics *)self f1];
  uint64_t v18 = objc_msgSend(v17, "numberWithFloat:");
  v26[1] = v18;
  v25[2] = @"truePositives";
  unint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics truePositives](self, "truePositives"));
  v26[2] = v19;
  v25[3] = @"trueNegatives";
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics trueNegatives](self, "trueNegatives"));
  v26[3] = v20;
  v25[4] = @"falsePositives";
  double v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics falsePositives](self, "falsePositives"));
  v26[4] = v21;
  v25[5] = @"falseNegatives";
  long double v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics falseNegatives](self, "falseNegatives"));
  v26[5] = v22;
  v26[6] = v3;
  v25[6] = @"positiveScores";
  v25[7] = @"negativeScores";
  v26[7] = v9;
  double v23 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:8];

  return v23;
}

@end