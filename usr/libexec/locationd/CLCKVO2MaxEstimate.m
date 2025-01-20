@interface CLCKVO2MaxEstimate
- (BOOL)eligibleForCalorimetry;
- (BOOL)eligibleForHealthKit;
- (BOOL)hasDurationInSeconds;
- (BOOL)hasEligibleForCalorimetry;
- (BOOL)hasEligibleForHealthKit;
- (BOOL)hasEstimatedHRRecoveryParam;
- (BOOL)hasEstimatedHRResponseParam;
- (BOOL)hasEstimatedVo2Max;
- (BOOL)hasFilteredVo2Max;
- (BOOL)hasHrMax;
- (BOOL)hasHrMin;
- (BOOL)hasNumWorkoutsContrToEstimate;
- (BOOL)hasSessionType;
- (BOOL)hasSessionVo2Max;
- (BOOL)hasStartTime;
- (BOOL)hasVariance;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)durationInSeconds;
- (double)estimatedHRRecoveryParam;
- (double)estimatedHRResponseParam;
- (double)estimatedVo2Max;
- (double)filteredVo2Max;
- (double)hrMax;
- (double)hrMin;
- (double)sessionVo2Max;
- (double)startTime;
- (double)variance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionType;
- (int)workoutType;
- (unint64_t)hash;
- (unsigned)numWorkoutsContrToEstimate;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setEligibleForCalorimetry:(BOOL)a3;
- (void)setEligibleForHealthKit:(BOOL)a3;
- (void)setEstimatedHRRecoveryParam:(double)a3;
- (void)setEstimatedHRResponseParam:(double)a3;
- (void)setEstimatedVo2Max:(double)a3;
- (void)setFilteredVo2Max:(double)a3;
- (void)setHasDurationInSeconds:(BOOL)a3;
- (void)setHasEligibleForCalorimetry:(BOOL)a3;
- (void)setHasEligibleForHealthKit:(BOOL)a3;
- (void)setHasEstimatedHRRecoveryParam:(BOOL)a3;
- (void)setHasEstimatedHRResponseParam:(BOOL)a3;
- (void)setHasEstimatedVo2Max:(BOOL)a3;
- (void)setHasFilteredVo2Max:(BOOL)a3;
- (void)setHasHrMax:(BOOL)a3;
- (void)setHasHrMin:(BOOL)a3;
- (void)setHasNumWorkoutsContrToEstimate:(BOOL)a3;
- (void)setHasSessionType:(BOOL)a3;
- (void)setHasSessionVo2Max:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasVariance:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setHrMax:(double)a3;
- (void)setHrMin:(double)a3;
- (void)setNumWorkoutsContrToEstimate:(unsigned int)a3;
- (void)setSessionType:(int)a3;
- (void)setSessionVo2Max:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setVariance:(double)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxEstimate

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasStartTime
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEstimatedVo2Max:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_estimatedVo2Max = a3;
}

- (void)setHasEstimatedVo2Max:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEstimatedVo2Max
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWorkoutType:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_durationInSeconds = a3;
}

- (void)setHasDurationInSeconds:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDurationInSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHrMax:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hrMax = a3;
}

- (void)setHasHrMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHrMax
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHrMin:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hrMin = a3;
}

- (void)setHasHrMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHrMin
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setVariance:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_variance = a3;
}

- (void)setHasVariance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVariance
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setFilteredVo2Max:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_filteredVo2Max = a3;
}

- (void)setHasFilteredVo2Max:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFilteredVo2Max
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSessionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSessionType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setEligibleForHealthKit:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_eligibleForHealthKit = a3;
}

- (void)setHasEligibleForHealthKit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasEligibleForHealthKit
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setEligibleForCalorimetry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_eligibleForCalorimetry = a3;
}

- (void)setHasEligibleForCalorimetry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasEligibleForCalorimetry
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNumWorkoutsContrToEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_numWorkoutsContrToEstimate = a3;
}

- (void)setHasNumWorkoutsContrToEstimate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasNumWorkoutsContrToEstimate
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setEstimatedHRResponseParam:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_estimatedHRResponseParam = a3;
}

- (void)setHasEstimatedHRResponseParam:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEstimatedHRResponseParam
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setEstimatedHRRecoveryParam:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_estimatedHRRecoveryParam = a3;
}

- (void)setHasEstimatedHRRecoveryParam:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEstimatedHRRecoveryParam
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSessionVo2Max:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sessionVo2Max = a3;
}

- (void)setHasSessionVo2Max:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSessionVo2Max
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxEstimate;
  return +[NSString stringWithFormat:@"%@ %@", [(CLCKVO2MaxEstimate *)&v3 description], [(CLCKVO2MaxEstimate *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_estimatedVo2Max)] forKey:@"estimatedVo2Max"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithInt:self->_workoutType] forKey:@"workoutType"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithDouble:self->_durationInSeconds] forKey:@"durationInSeconds"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrMax)] forKey:@"hrMax"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrMin)] forKey:@"hrMin"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_variance)] forKey:@"variance"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_filteredVo2Max)] forKey:@"filteredVo2Max"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sessionType)] forKey:@"sessionType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_eligibleForHealthKit)] forKey:@"eligibleForHealthKit"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_eligibleForCalorimetry)] forKey:@"eligibleForCalorimetry"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numWorkoutsContrToEstimate)] forKey:@"numWorkoutsContrToEstimate"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_estimatedHRRecoveryParam)] forKey:@"estimatedHRRecoveryParam"];
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      return v3;
    }
    goto LABEL_16;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithDouble:self->_estimatedHRResponseParam] forKey:@"estimatedHRResponseParam"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((has & 0x80) != 0) {
LABEL_16:
  }
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_sessionVo2Max)] forKey:@"sessionVo2Max"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100438B14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      return;
    }
    goto LABEL_31;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((has & 0x80) == 0) {
    return;
  }
LABEL_31:

  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((void *)a3 + 9) = *(void *)&self->_startTime;
    *((_WORD *)a3 + 52) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = *(void *)&self->_estimatedVo2Max;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 24) = self->_workoutType;
  *((_WORD *)a3 + 52) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 1) = *(void *)&self->_durationInSeconds;
  *((_WORD *)a3 + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 6) = *(void *)&self->_hrMax;
  *((_WORD *)a3 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 7) = *(void *)&self->_hrMin;
  *((_WORD *)a3 + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 10) = *(void *)&self->_variance;
  *((_WORD *)a3 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 5) = *(void *)&self->_filteredVo2Max;
  *((_WORD *)a3 + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 23) = self->_sessionType;
  *((_WORD *)a3 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)a3 + 101) = self->_eligibleForHealthKit;
  *((_WORD *)a3 + 52) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((unsigned char *)a3 + 100) = self->_eligibleForCalorimetry;
  *((_WORD *)a3 + 52) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 22) = self->_numWorkoutsContrToEstimate;
  *((_WORD *)a3 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 3) = *(void *)&self->_estimatedHRResponseParam;
  *((_WORD *)a3 + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      return;
    }
LABEL_31:
    *((void *)a3 + 8) = *(void *)&self->_sessionVo2Max;
    *((_WORD *)a3 + 52) |= 0x80u;
    return;
  }
LABEL_30:
  *((void *)a3 + 2) = *(void *)&self->_estimatedHRRecoveryParam;
  *((_WORD *)a3 + 52) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    goto LABEL_31;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((void *)result + 9) = *(void *)&self->_startTime;
    *((_WORD *)result + 52) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = *(void *)&self->_estimatedVo2Max;
  *((_WORD *)result + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 24) = self->_workoutType;
  *((_WORD *)result + 52) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 1) = *(void *)&self->_durationInSeconds;
  *((_WORD *)result + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 6) = *(void *)&self->_hrMax;
  *((_WORD *)result + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 7) = *(void *)&self->_hrMin;
  *((_WORD *)result + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 10) = *(void *)&self->_variance;
  *((_WORD *)result + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 5) = *(void *)&self->_filteredVo2Max;
  *((_WORD *)result + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 23) = self->_sessionType;
  *((_WORD *)result + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((unsigned char *)result + 101) = self->_eligibleForHealthKit;
  *((_WORD *)result + 52) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)result + 100) = self->_eligibleForCalorimetry;
  *((_WORD *)result + 52) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 22) = self->_numWorkoutsContrToEstimate;
  *((_WORD *)result + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 3) = *(void *)&self->_estimatedHRResponseParam;
  *((_WORD *)result + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_16;
  }
LABEL_31:
  *((void *)result + 2) = *(void *)&self->_estimatedHRRecoveryParam;
  *((_WORD *)result + 52) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_16:
  *((void *)result + 8) = *(void *)&self->_sessionVo2Max;
  *((_WORD *)result + 52) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 52);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_startTime != *((double *)a3 + 9)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_estimatedVo2Max != *((double *)a3 + 4)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x1000) == 0 || self->_workoutType != *((_DWORD *)a3 + 24)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x1000) != 0)
  {
    goto LABEL_82;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_durationInSeconds != *((double *)a3 + 1)) {
      goto LABEL_82;
    }
  }
  else if (v7)
  {
    goto LABEL_82;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_hrMax != *((double *)a3 + 6)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_hrMin != *((double *)a3 + 7)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_variance != *((double *)a3 + 10)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_filteredVo2Max != *((double *)a3 + 5)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_sessionType != *((_DWORD *)a3 + 23)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x4000) == 0) {
      goto LABEL_82;
    }
    if (self->_eligibleForHealthKit)
    {
      if (!*((unsigned char *)a3 + 101)) {
        goto LABEL_82;
      }
    }
    else if (*((unsigned char *)a3 + 101))
    {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x4000) != 0)
  {
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x2000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_63;
  }
  if ((*((_WORD *)a3 + 52) & 0x2000) == 0) {
    goto LABEL_82;
  }
  if (self->_eligibleForCalorimetry)
  {
    if (!*((unsigned char *)a3 + 100)) {
      goto LABEL_82;
    }
    goto LABEL_63;
  }
  if (*((unsigned char *)a3 + 100))
  {
LABEL_82:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_63:
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_numWorkoutsContrToEstimate != *((_DWORD *)a3 + 22)) {
      goto LABEL_82;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_estimatedHRResponseParam != *((double *)a3 + 3)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_82;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_estimatedHRRecoveryParam != *((double *)a3 + 2)) {
      goto LABEL_82;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_82;
  }
  LOBYTE(v5) = (v7 & 0x80) == 0;
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_sessionVo2Max != *((double *)a3 + 8)) {
      goto LABEL_82;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
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
  if ((has & 8) != 0)
  {
    double estimatedVo2Max = self->_estimatedVo2Max;
    double v11 = -estimatedVo2Max;
    if (estimatedVo2Max >= 0.0) {
      double v11 = self->_estimatedVo2Max;
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
  if ((has & 0x1000) != 0)
  {
    uint64_t v63 = 2654435761 * self->_workoutType;
    if (has) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v18 = 0;
    goto LABEL_27;
  }
  uint64_t v63 = 0;
  if ((has & 1) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  double durationInSeconds = self->_durationInSeconds;
  double v15 = -durationInSeconds;
  if (durationInSeconds >= 0.0) {
    double v15 = self->_durationInSeconds;
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
LABEL_27:
  if ((has & 0x20) != 0)
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
  if ((has & 0x40) != 0)
  {
    double hrMin = self->_hrMin;
    double v26 = -hrMin;
    if (hrMin >= 0.0) {
      double v26 = self->_hrMin;
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
  if ((has & 0x200) != 0)
  {
    double variance = self->_variance;
    double v31 = -variance;
    if (variance >= 0.0) {
      double v31 = self->_variance;
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
  unint64_t v62 = v18;
  if ((has & 0x10) != 0)
  {
    double filteredVo2Max = self->_filteredVo2Max;
    double v36 = -filteredVo2Max;
    if (filteredVo2Max >= 0.0) {
      double v36 = self->_filteredVo2Max;
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
  if ((has & 0x800) != 0) {
    uint64_t v60 = 2654435761 * self->_sessionType;
  }
  else {
    uint64_t v60 = 0;
  }
  unint64_t v64 = v9;
  if ((has & 0x4000) != 0) {
    uint64_t v59 = 2654435761 * self->_eligibleForHealthKit;
  }
  else {
    uint64_t v59 = 0;
  }
  unint64_t v61 = v19;
  if ((has & 0x2000) != 0) {
    uint64_t v58 = 2654435761 * self->_eligibleForCalorimetry;
  }
  else {
    uint64_t v58 = 0;
  }
  unint64_t v39 = v24;
  if ((has & 0x400) != 0)
  {
    uint64_t v40 = 2654435761 * self->_numWorkoutsContrToEstimate;
    if ((has & 4) != 0) {
      goto LABEL_70;
    }
LABEL_75:
    unint64_t v45 = 0;
    goto LABEL_78;
  }
  uint64_t v40 = 0;
  if ((has & 4) == 0) {
    goto LABEL_75;
  }
LABEL_70:
  double estimatedHRResponseParam = self->_estimatedHRResponseParam;
  double v42 = -estimatedHRResponseParam;
  if (estimatedHRResponseParam >= 0.0) {
    double v42 = self->_estimatedHRResponseParam;
  }
  long double v43 = floor(v42 + 0.5);
  double v44 = (v42 - v43) * 1.84467441e19;
  unint64_t v45 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
  if (v44 >= 0.0)
  {
    if (v44 > 0.0) {
      v45 += (unint64_t)v44;
    }
  }
  else
  {
    v45 -= (unint64_t)fabs(v44);
  }
LABEL_78:
  unint64_t v46 = v29;
  if ((has & 2) != 0)
  {
    double estimatedHRRecoveryParam = self->_estimatedHRRecoveryParam;
    double v49 = -estimatedHRRecoveryParam;
    if (estimatedHRRecoveryParam >= 0.0) {
      double v49 = self->_estimatedHRRecoveryParam;
    }
    long double v50 = floor(v49 + 0.5);
    double v51 = (v49 - v50) * 1.84467441e19;
    unint64_t v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0) {
        v47 += (unint64_t)v51;
      }
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    unint64_t v47 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double sessionVo2Max = self->_sessionVo2Max;
    double v54 = -sessionVo2Max;
    if (sessionVo2Max >= 0.0) {
      double v54 = self->_sessionVo2Max;
    }
    long double v55 = floor(v54 + 0.5);
    double v56 = (v54 - v55) * 1.84467441e19;
    unint64_t v52 = 2654435761u * (unint64_t)fmod(v55, 1.84467441e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0) {
        v52 += (unint64_t)v56;
      }
    }
    else
    {
      v52 -= (unint64_t)fabs(v56);
    }
  }
  else
  {
    unint64_t v52 = 0;
  }
  return v64 ^ v4 ^ v63 ^ v62 ^ v61 ^ v39 ^ v46 ^ v34 ^ v60 ^ v59 ^ v58 ^ v40 ^ v45 ^ v47 ^ v52;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) != 0)
  {
    self->_double startTime = *((double *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v3 = *((_WORD *)a3 + 52);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_double estimatedVo2Max = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x1000) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_workoutType = *((_DWORD *)a3 + 24);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double durationInSeconds = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_double hrMax = *((double *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_double hrMin = *((double *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x200) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_double variance = *((double *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_9:
    if ((v3 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double filteredVo2Max = *((double *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_10:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_sessionType = *((_DWORD *)a3 + 23);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x4000) == 0)
  {
LABEL_11:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_eligibleForHealthKit = *((unsigned char *)a3 + 101);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x2000) == 0)
  {
LABEL_12:
    if ((v3 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_eligibleForCalorimetry = *((unsigned char *)a3 + 100);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_13:
    if ((v3 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_numWorkoutsContrToEstimate = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_14:
    if ((v3 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double estimatedHRResponseParam = *((double *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 2) == 0)
  {
LABEL_15:
    if ((v3 & 0x80) == 0) {
      return;
    }
LABEL_31:
    self->_double sessionVo2Max = *((double *)a3 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    return;
  }
LABEL_30:
  self->_double estimatedHRRecoveryParam = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 52) & 0x80) != 0) {
    goto LABEL_31;
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (double)estimatedVo2Max
{
  return self->_estimatedVo2Max;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (double)hrMax
{
  return self->_hrMax;
}

- (double)hrMin
{
  return self->_hrMin;
}

- (double)variance
{
  return self->_variance;
}

- (double)filteredVo2Max
{
  return self->_filteredVo2Max;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (BOOL)eligibleForHealthKit
{
  return self->_eligibleForHealthKit;
}

- (BOOL)eligibleForCalorimetry
{
  return self->_eligibleForCalorimetry;
}

- (unsigned)numWorkoutsContrToEstimate
{
  return self->_numWorkoutsContrToEstimate;
}

- (double)estimatedHRResponseParam
{
  return self->_estimatedHRResponseParam;
}

- (double)estimatedHRRecoveryParam
{
  return self->_estimatedHRRecoveryParam;
}

- (double)sessionVo2Max
{
  return self->_sessionVo2Max;
}

@end