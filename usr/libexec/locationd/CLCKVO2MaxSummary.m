@interface CLCKVO2MaxSummary
- (BOOL)hasCadenceMean;
- (BOOL)hasDurationInSeconds;
- (BOOL)hasGradeMean;
- (BOOL)hasGradeVariance;
- (BOOL)hasHrCadenceAgreementMean;
- (BOOL)hasHrCadenceAgreementVariance;
- (BOOL)hasHrConfidenceMean;
- (BOOL)hasHrConfidenceVariance;
- (BOOL)hasHrMax;
- (BOOL)hasHrMean;
- (BOOL)hasHrMin;
- (BOOL)hasHrVariance;
- (BOOL)hasPointCount;
- (BOOL)hasSessionType;
- (BOOL)hasSpeedMean;
- (BOOL)hasSpeedVariance;
- (BOOL)hasStartTime;
- (BOOL)hasVo2MaxModelSource;
- (BOOL)hasVo2Mean;
- (BOOL)hasVo2Variance;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)cadenceMean;
- (double)durationInSeconds;
- (double)gradeMean;
- (double)gradeVariance;
- (double)hrCadenceAgreementMean;
- (double)hrCadenceAgreementVariance;
- (double)hrConfidenceMean;
- (double)hrConfidenceVariance;
- (double)hrMax;
- (double)hrMean;
- (double)hrMin;
- (double)hrVariance;
- (double)speedMean;
- (double)speedVariance;
- (double)startTime;
- (double)vo2Mean;
- (double)vo2Variance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionType;
- (int)vo2MaxModelSource;
- (int)workoutType;
- (unint64_t)hash;
- (unint64_t)pointCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCadenceMean:(double)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setGradeMean:(double)a3;
- (void)setGradeVariance:(double)a3;
- (void)setHasCadenceMean:(BOOL)a3;
- (void)setHasDurationInSeconds:(BOOL)a3;
- (void)setHasGradeMean:(BOOL)a3;
- (void)setHasGradeVariance:(BOOL)a3;
- (void)setHasHrCadenceAgreementMean:(BOOL)a3;
- (void)setHasHrCadenceAgreementVariance:(BOOL)a3;
- (void)setHasHrConfidenceMean:(BOOL)a3;
- (void)setHasHrConfidenceVariance:(BOOL)a3;
- (void)setHasHrMax:(BOOL)a3;
- (void)setHasHrMean:(BOOL)a3;
- (void)setHasHrMin:(BOOL)a3;
- (void)setHasHrVariance:(BOOL)a3;
- (void)setHasPointCount:(BOOL)a3;
- (void)setHasSessionType:(BOOL)a3;
- (void)setHasSpeedMean:(BOOL)a3;
- (void)setHasSpeedVariance:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasVo2MaxModelSource:(BOOL)a3;
- (void)setHasVo2Mean:(BOOL)a3;
- (void)setHasVo2Variance:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setHrCadenceAgreementMean:(double)a3;
- (void)setHrCadenceAgreementVariance:(double)a3;
- (void)setHrConfidenceMean:(double)a3;
- (void)setHrConfidenceVariance:(double)a3;
- (void)setHrMax:(double)a3;
- (void)setHrMean:(double)a3;
- (void)setHrMin:(double)a3;
- (void)setHrVariance:(double)a3;
- (void)setPointCount:(unint64_t)a3;
- (void)setSessionType:(int)a3;
- (void)setSpeedMean:(double)a3;
- (void)setSpeedVariance:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setVo2MaxModelSource:(int)a3;
- (void)setVo2Mean:(double)a3;
- (void)setVo2Variance:(double)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxSummary

- (void)setStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasStartTime
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWorkoutType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWorkoutType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setDurationInSeconds:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_durationInSeconds = a3;
}

- (void)setHasDurationInSeconds:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDurationInSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPointCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pointCount = a3;
}

- (void)setHasPointCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPointCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHrMin:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hrMin = a3;
}

- (void)setHasHrMin:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHrMin
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHrMax:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hrMax = a3;
}

- (void)setHasHrMax:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHrMax
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHrMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hrMean = a3;
}

- (void)setHasHrMean:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHrMean
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHrConfidenceMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hrConfidenceMean = a3;
}

- (void)setHasHrConfidenceMean:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHrConfidenceMean
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHrCadenceAgreementMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_hrCadenceAgreementMean = a3;
}

- (void)setHasHrCadenceAgreementMean:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHrCadenceAgreementMean
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setVo2Mean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_vo2Mean = a3;
}

- (void)setHasVo2Mean:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasVo2Mean
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSpeedMean:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_speedMean = a3;
}

- (void)setHasSpeedMean:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSpeedMean
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setGradeMean:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_gradeMean = a3;
}

- (void)setHasGradeMean:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasGradeMean
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCadenceMean:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cadenceMean = a3;
}

- (void)setHasCadenceMean:(BOOL)a3
{
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCadenceMean
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHrVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hrVariance = a3;
}

- (void)setHasHrVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHrVariance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHrConfidenceVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hrConfidenceVariance = a3;
}

- (void)setHasHrConfidenceVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHrConfidenceVariance
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHrCadenceAgreementVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hrCadenceAgreementVariance = a3;
}

- (void)setHasHrCadenceAgreementVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHrCadenceAgreementVariance
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setVo2Variance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_vo2Variance = a3;
}

- (void)setHasVo2Variance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVo2Variance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSpeedVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_speedVariance = a3;
}

- (void)setHasSpeedVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSpeedVariance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setGradeVariance:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_gradeVariance = a3;
}

- (void)setHasGradeVariance:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasGradeVariance
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVo2MaxModelSource:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_vo2MaxModelSource = a3;
}

- (void)setHasVo2MaxModelSource:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVo2MaxModelSource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSessionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E8ED42556FF3749C3CBEC9B5EE9EF018)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSessionType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSummary;
  return +[NSString stringWithFormat:@"%@ %@", [(CLCKVO2MaxSummary *)&v3 description], [(CLCKVO2MaxSummary *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_workoutType] forKey:@"workoutType"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_durationInSeconds)] forKey:@"durationInSeconds"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_pointCount)] forKey:@"pointCount"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithDouble:self->_hrMin] forKey:@"hrMin"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithDouble:self->_hrMax] forKey:@"hrMax"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrMean)] forKey:@"hrMean"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrConfidenceMean)] forKey:@"hrConfidenceMean"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrCadenceAgreementMean)] forKey:@"hrCadenceAgreementMean"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_vo2Mean)] forKey:@"vo2Mean"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_speedMean)] forKey:@"speedMean"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_gradeMean)] forKey:@"gradeMean"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_cadenceMean)] forKey:@"cadenceMean"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithDouble:self->_hrVariance] forKey:@"hrVariance"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrConfidenceVariance)] forKey:@"hrConfidenceVariance"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrCadenceAgreementVariance)] forKey:@"hrCadenceAgreementVariance"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_vo2Variance)] forKey:@"vo2Variance"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithDouble:self->_speedVariance] forKey:@"speedVariance"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_21;
    }
LABEL_43:
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_vo2MaxModelSource)] forKey:@"vo2MaxModelSource"];
    if ((*(_DWORD *)&self->_has & 0x40000) == 0) {
      return v3;
    }
    goto LABEL_22;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithDouble:self->_gradeVariance] forKey:@"gradeVariance"];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_43;
  }
LABEL_21:
  if ((*(_DWORD *)&has & 0x40000) != 0) {
LABEL_22:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sessionType)] forKey:@"sessionType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F6B04C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteDoubleField();
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_21;
    }
LABEL_42:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_has & 0x40000) == 0) {
      return;
    }
    goto LABEL_43;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_42;
  }
LABEL_21:
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    return;
  }
LABEL_43:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((void *)a3 + 16) = *(void *)&self->_startTime;
    *((_DWORD *)a3 + 41) |= 0x8000u;
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 40) = self->_workoutType;
  *((_DWORD *)a3 + 41) |= 0x100000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 2) = *(void *)&self->_durationInSeconds;
  *((_DWORD *)a3 + 41) |= 2u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)a3 + 13) = self->_pointCount;
  *((_DWORD *)a3 + 41) |= 0x1000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 11) = *(void *)&self->_hrMin;
  *((_DWORD *)a3 + 41) |= 0x400u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)a3 + 9) = *(void *)&self->_hrMax;
  *((_DWORD *)a3 + 41) |= 0x100u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 10) = *(void *)&self->_hrMean;
  *((_DWORD *)a3 + 41) |= 0x200u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)a3 + 7) = *(void *)&self->_hrConfidenceMean;
  *((_DWORD *)a3 + 41) |= 0x40u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)a3 + 5) = *(void *)&self->_hrCadenceAgreementMean;
  *((_DWORD *)a3 + 41) |= 0x10u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)a3 + 17) = *(void *)&self->_vo2Mean;
  *((_DWORD *)a3 + 41) |= 0x10000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)a3 + 14) = *(void *)&self->_speedMean;
  *((_DWORD *)a3 + 41) |= 0x2000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)a3 + 3) = *(void *)&self->_gradeMean;
  *((_DWORD *)a3 + 41) |= 4u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 1) = *(void *)&self->_cadenceMean;
  *((_DWORD *)a3 + 41) |= 1u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)a3 + 12) = *(void *)&self->_hrVariance;
  *((_DWORD *)a3 + 41) |= 0x800u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)a3 + 8) = *(void *)&self->_hrConfidenceVariance;
  *((_DWORD *)a3 + 41) |= 0x80u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 6) = *(void *)&self->_hrCadenceAgreementVariance;
  *((_DWORD *)a3 + 41) |= 0x20u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 18) = *(void *)&self->_vo2Variance;
  *((_DWORD *)a3 + 41) |= 0x20000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 15) = *(void *)&self->_speedVariance;
  *((_DWORD *)a3 + 41) |= 0x4000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)a3 + 4) = *(void *)&self->_gradeVariance;
  *((_DWORD *)a3 + 41) |= 8u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      return;
    }
LABEL_43:
    *((_DWORD *)a3 + 38) = self->_sessionType;
    *((_DWORD *)a3 + 41) |= 0x40000u;
    return;
  }
LABEL_42:
  *((_DWORD *)a3 + 39) = self->_vo2MaxModelSource;
  *((_DWORD *)a3 + 41) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0) {
    goto LABEL_43;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((void *)result + 16) = *(void *)&self->_startTime;
    *((_DWORD *)result + 41) |= 0x8000u;
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 40) = self->_workoutType;
  *((_DWORD *)result + 41) |= 0x100000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 2) = *(void *)&self->_durationInSeconds;
  *((_DWORD *)result + 41) |= 2u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 13) = self->_pointCount;
  *((_DWORD *)result + 41) |= 0x1000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 11) = *(void *)&self->_hrMin;
  *((_DWORD *)result + 41) |= 0x400u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 9) = *(void *)&self->_hrMax;
  *((_DWORD *)result + 41) |= 0x100u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 10) = *(void *)&self->_hrMean;
  *((_DWORD *)result + 41) |= 0x200u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)result + 7) = *(void *)&self->_hrConfidenceMean;
  *((_DWORD *)result + 41) |= 0x40u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)result + 5) = *(void *)&self->_hrCadenceAgreementMean;
  *((_DWORD *)result + 41) |= 0x10u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)result + 17) = *(void *)&self->_vo2Mean;
  *((_DWORD *)result + 41) |= 0x10000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 14) = *(void *)&self->_speedMean;
  *((_DWORD *)result + 41) |= 0x2000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 3) = *(void *)&self->_gradeMean;
  *((_DWORD *)result + 41) |= 4u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 1) = *(void *)&self->_cadenceMean;
  *((_DWORD *)result + 41) |= 1u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 12) = *(void *)&self->_hrVariance;
  *((_DWORD *)result + 41) |= 0x800u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 8) = *(void *)&self->_hrConfidenceVariance;
  *((_DWORD *)result + 41) |= 0x80u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 6) = *(void *)&self->_hrCadenceAgreementVariance;
  *((_DWORD *)result + 41) |= 0x20u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 18) = *(void *)&self->_vo2Variance;
  *((_DWORD *)result + 41) |= 0x20000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 15) = *(void *)&self->_speedVariance;
  *((_DWORD *)result + 41) |= 0x4000u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 4) = *(void *)&self->_gradeVariance;
  *((_DWORD *)result + 41) |= 8u;
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      return result;
    }
    goto LABEL_22;
  }
LABEL_43:
  *((_DWORD *)result + 39) = self->_vo2MaxModelSource;
  *((_DWORD *)result + 41) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x40000) == 0) {
    return result;
  }
LABEL_22:
  *((_DWORD *)result + 38) = self->_sessionType;
  *((_DWORD *)result + 41) |= 0x40000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
    int v7 = *((_DWORD *)a3 + 41);
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_startTime != *((double *)a3 + 16)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
LABEL_106:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_workoutType != *((_DWORD *)a3 + 40)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_durationInSeconds != *((double *)a3 + 2)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_pointCount != *((void *)a3 + 13)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_hrMin != *((double *)a3 + 11)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_hrMax != *((double *)a3 + 9)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_hrMean != *((double *)a3 + 10)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_106;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_hrConfidenceMean != *((double *)a3 + 7)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_106;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_hrCadenceAgreementMean != *((double *)a3 + 5)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_vo2Mean != *((double *)a3 + 17)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_speedMean != *((double *)a3 + 14)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_gradeMean != *((double *)a3 + 3)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_106;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_cadenceMean != *((double *)a3 + 1)) {
        goto LABEL_106;
      }
    }
    else if (v7)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_hrVariance != *((double *)a3 + 12)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_106;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_hrConfidenceVariance != *((double *)a3 + 8)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_106;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_hrCadenceAgreementVariance != *((double *)a3 + 6)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_vo2Variance != *((double *)a3 + 18)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_speedVariance != *((double *)a3 + 15)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_106;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_gradeVariance != *((double *)a3 + 4)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_106;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_vo2MaxModelSource != *((_DWORD *)a3 + 39)) {
        goto LABEL_106;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_106;
    }
    LOBYTE(v5) = (v7 & 0x40000) == 0;
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_sessionType != *((_DWORD *)a3 + 38)) {
        goto LABEL_106;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $E8ED42556FF3749C3CBEC9B5EE9EF018 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
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
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t v104 = 2654435761 * self->_workoutType;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v13 = 0;
    goto LABEL_19;
  }
  uint64_t v104 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double durationInSeconds = self->_durationInSeconds;
  double v10 = -durationInSeconds;
  if (durationInSeconds >= 0.0) {
    double v10 = self->_durationInSeconds;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    unint64_t v103 = 2654435761u * self->_pointCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_21;
    }
LABEL_26:
    unint64_t v18 = 0;
    goto LABEL_29;
  }
  unint64_t v103 = 0;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_26;
  }
LABEL_21:
  double hrMin = self->_hrMin;
  double v15 = -hrMin;
  if (hrMin >= 0.0) {
    double v15 = self->_hrMin;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_29:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double hrMax = self->_hrMax;
    double v21 = -hrMax;
    if (hrMax >= 0.0) {
      double v21 = self->_hrMax;
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
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    double hrMean = self->_hrMean;
    double v26 = -hrMean;
    if (hrMean >= 0.0) {
      double v26 = self->_hrMean;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    double hrConfidenceMean = self->_hrConfidenceMean;
    double v31 = -hrConfidenceMean;
    if (hrConfidenceMean >= 0.0) {
      double v31 = self->_hrConfidenceMean;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double hrCadenceAgreementMean = self->_hrCadenceAgreementMean;
    double v36 = -hrCadenceAgreementMean;
    if (hrCadenceAgreementMean >= 0.0) {
      double v36 = self->_hrCadenceAgreementMean;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    double vo2Mean = self->_vo2Mean;
    double v41 = -vo2Mean;
    if (vo2Mean >= 0.0) {
      double v41 = self->_vo2Mean;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v98 = v39;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    double speedMean = self->_speedMean;
    double v46 = -speedMean;
    if (speedMean >= 0.0) {
      double v46 = self->_speedMean;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v97 = v44;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    double gradeMean = self->_gradeMean;
    double v51 = -gradeMean;
    if (gradeMean >= 0.0) {
      double v51 = self->_gradeMean;
    }
    long double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  unint64_t v96 = v49;
  if (*(unsigned char *)&has)
  {
    double cadenceMean = self->_cadenceMean;
    double v56 = -cadenceMean;
    if (cadenceMean >= 0.0) {
      double v56 = self->_cadenceMean;
    }
    long double v57 = floor(v56 + 0.5);
    double v58 = (v56 - v57) * 1.84467441e19;
    unint64_t v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0) {
        v54 += (unint64_t)v58;
      }
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    unint64_t v54 = 0;
  }
  unint64_t v95 = v54;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    double hrVariance = self->_hrVariance;
    double v61 = -hrVariance;
    if (hrVariance >= 0.0) {
      double v61 = self->_hrVariance;
    }
    long double v62 = floor(v61 + 0.5);
    double v63 = (v61 - v62) * 1.84467441e19;
    unint64_t v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0) {
        v59 += (unint64_t)v63;
      }
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    unint64_t v59 = 0;
  }
  unint64_t v94 = v59;
  unint64_t v102 = v18;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double hrConfidenceVariance = self->_hrConfidenceVariance;
    double v66 = -hrConfidenceVariance;
    if (hrConfidenceVariance >= 0.0) {
      double v66 = self->_hrConfidenceVariance;
    }
    long double v67 = floor(v66 + 0.5);
    double v68 = (v66 - v67) * 1.84467441e19;
    unint64_t v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0) {
        v64 += (unint64_t)v68;
      }
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    unint64_t v64 = 0;
  }
  unint64_t v100 = v29;
  unint64_t v101 = v19;
  unint64_t v99 = v13;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double hrCadenceAgreementVariance = self->_hrCadenceAgreementVariance;
    double v71 = -hrCadenceAgreementVariance;
    if (hrCadenceAgreementVariance >= 0.0) {
      double v71 = self->_hrCadenceAgreementVariance;
    }
    long double v72 = floor(v71 + 0.5);
    double v73 = (v71 - v72) * 1.84467441e19;
    unint64_t v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0) {
        v69 += (unint64_t)v73;
      }
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    unint64_t v69 = 0;
  }
  unint64_t v74 = v4;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    double vo2Variance = self->_vo2Variance;
    double v78 = -vo2Variance;
    if (vo2Variance >= 0.0) {
      double v78 = self->_vo2Variance;
    }
    long double v79 = floor(v78 + 0.5);
    double v80 = (v78 - v79) * 1.84467441e19;
    unint64_t v76 = 2654435761u * (unint64_t)fmod(v79, 1.84467441e19);
    unint64_t v75 = v34;
    if (v80 >= 0.0)
    {
      if (v80 > 0.0) {
        v76 += (unint64_t)v80;
      }
    }
    else
    {
      v76 -= (unint64_t)fabs(v80);
    }
  }
  else
  {
    unint64_t v75 = v34;
    unint64_t v76 = 0;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    double speedVariance = self->_speedVariance;
    double v83 = -speedVariance;
    if (speedVariance >= 0.0) {
      double v83 = self->_speedVariance;
    }
    long double v84 = floor(v83 + 0.5);
    double v85 = (v83 - v84) * 1.84467441e19;
    unint64_t v81 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
    if (v85 >= 0.0)
    {
      if (v85 > 0.0) {
        v81 += (unint64_t)v85;
      }
    }
    else
    {
      v81 -= (unint64_t)fabs(v85);
    }
  }
  else
  {
    unint64_t v81 = 0;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double gradeVariance = self->_gradeVariance;
    double v88 = -gradeVariance;
    if (gradeVariance >= 0.0) {
      double v88 = self->_gradeVariance;
    }
    long double v89 = floor(v88 + 0.5);
    double v90 = (v88 - v89) * 1.84467441e19;
    unint64_t v86 = 2654435761u * (unint64_t)fmod(v89, 1.84467441e19);
    if (v90 >= 0.0)
    {
      if (v90 > 0.0) {
        v86 += (unint64_t)v90;
      }
    }
    else
    {
      v86 -= (unint64_t)fabs(v90);
    }
  }
  else
  {
    unint64_t v86 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    uint64_t v91 = 2654435761 * self->_vo2MaxModelSource;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_143;
    }
LABEL_145:
    uint64_t v92 = 0;
    return v104 ^ v74 ^ v99 ^ v103 ^ v102 ^ v101 ^ v24 ^ v100 ^ v75 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v64 ^ v69 ^ v76 ^ v81 ^ v86 ^ v91 ^ v92;
  }
  uint64_t v91 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_145;
  }
LABEL_143:
  uint64_t v92 = 2654435761 * self->_sessionType;
  return v104 ^ v74 ^ v99 ^ v103 ^ v102 ^ v101 ^ v24 ^ v100 ^ v75 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v64 ^ v69 ^ v76 ^ v81 ^ v86 ^ v91 ^ v92;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x8000) != 0)
  {
    self->_double startTime = *((double *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
    int v3 = *((_DWORD *)a3 + 41);
    if ((v3 & 0x100000) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((v3 & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  self->_workoutType = *((_DWORD *)a3 + 40);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double durationInSeconds = *((double *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x1000) == 0)
  {
LABEL_5:
    if ((v3 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_pointCount = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x400) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double hrMin = *((double *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double hrMax = *((double *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x200) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double hrMean = *((double *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double hrConfidenceMean = *((double *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double hrCadenceAgreementMean = *((double *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x10000) == 0)
  {
LABEL_11:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double vo2Mean = *((double *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x2000) == 0)
  {
LABEL_12:
    if ((v3 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_double speedMean = *((double *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 4) == 0)
  {
LABEL_13:
    if ((v3 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_double gradeMean = *((double *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 1) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_double cadenceMean = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x800) == 0)
  {
LABEL_15:
    if ((v3 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_double hrVariance = *((double *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x80) == 0)
  {
LABEL_16:
    if ((v3 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_double hrConfidenceVariance = *((double *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x20) == 0)
  {
LABEL_17:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double hrCadenceAgreementVariance = *((double *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x20000) == 0)
  {
LABEL_18:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_double vo2Variance = *((double *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x4000) == 0)
  {
LABEL_19:
    if ((v3 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_double speedVariance = *((double *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 8) == 0)
  {
LABEL_20:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double gradeVariance = *((double *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 41);
  if ((v3 & 0x80000) == 0)
  {
LABEL_21:
    if ((v3 & 0x40000) == 0) {
      return;
    }
LABEL_43:
    self->_sessionType = *((_DWORD *)a3 + 38);
    *(_DWORD *)&self->_has |= 0x40000u;
    return;
  }
LABEL_42:
  self->_vo2MaxModelSource = *((_DWORD *)a3 + 39);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 41) & 0x40000) != 0) {
    goto LABEL_43;
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (double)hrMin
{
  return self->_hrMin;
}

- (double)hrMax
{
  return self->_hrMax;
}

- (double)hrMean
{
  return self->_hrMean;
}

- (double)hrConfidenceMean
{
  return self->_hrConfidenceMean;
}

- (double)hrCadenceAgreementMean
{
  return self->_hrCadenceAgreementMean;
}

- (double)vo2Mean
{
  return self->_vo2Mean;
}

- (double)speedMean
{
  return self->_speedMean;
}

- (double)gradeMean
{
  return self->_gradeMean;
}

- (double)cadenceMean
{
  return self->_cadenceMean;
}

- (double)hrVariance
{
  return self->_hrVariance;
}

- (double)hrConfidenceVariance
{
  return self->_hrConfidenceVariance;
}

- (double)hrCadenceAgreementVariance
{
  return self->_hrCadenceAgreementVariance;
}

- (double)vo2Variance
{
  return self->_vo2Variance;
}

- (double)speedVariance
{
  return self->_speedVariance;
}

- (double)gradeVariance
{
  return self->_gradeVariance;
}

- (int)vo2MaxModelSource
{
  return self->_vo2MaxModelSource;
}

- (int)sessionType
{
  return self->_sessionType;
}

@end