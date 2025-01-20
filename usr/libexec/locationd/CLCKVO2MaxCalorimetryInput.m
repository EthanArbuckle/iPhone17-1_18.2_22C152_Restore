@interface CLCKVO2MaxCalorimetryInput
- (BOOL)hasCadence;
- (BOOL)hasGPS;
- (BOOL)hasGrade;
- (BOOL)hasGradeType;
- (BOOL)hasHasGPS;
- (BOOL)hasHasStrideCal;
- (BOOL)hasHr;
- (BOOL)hasHrConfidence;
- (BOOL)hasHrTime;
- (BOOL)hasIsStroller;
- (BOOL)hasMetSource;
- (BOOL)hasMets;
- (BOOL)hasPace;
- (BOOL)hasStartTime;
- (BOOL)hasStrideCal;
- (BOOL)hasWorkoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStroller;
- (BOOL)readFrom:(id)a3;
- (double)cadence;
- (double)grade;
- (double)hrTime;
- (double)pace;
- (double)startTime;
- (float)hr;
- (float)hrConfidence;
- (float)mets;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)gradeType;
- (int)metSource;
- (int)workoutType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCadence:(double)a3;
- (void)setGrade:(double)a3;
- (void)setGradeType:(int)a3;
- (void)setHasCadence:(BOOL)a3;
- (void)setHasGPS:(BOOL)a3;
- (void)setHasGrade:(BOOL)a3;
- (void)setHasGradeType:(BOOL)a3;
- (void)setHasHasGPS:(BOOL)a3;
- (void)setHasHasStrideCal:(BOOL)a3;
- (void)setHasHr:(BOOL)a3;
- (void)setHasHrConfidence:(BOOL)a3;
- (void)setHasHrTime:(BOOL)a3;
- (void)setHasIsStroller:(BOOL)a3;
- (void)setHasMetSource:(BOOL)a3;
- (void)setHasMets:(BOOL)a3;
- (void)setHasPace:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasStrideCal:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setHr:(float)a3;
- (void)setHrConfidence:(float)a3;
- (void)setHrTime:(double)a3;
- (void)setIsStroller:(BOOL)a3;
- (void)setMetSource:(int)a3;
- (void)setMets:(float)a3;
- (void)setPace:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxCalorimetryInput

- (void)setStartTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMets:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_mets = a3;
}

- (void)setHasMets:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMets
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMetSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_metSource = a3;
}

- (void)setHasMetSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMetSource
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHr:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hr = a3;
}

- (void)setHasHr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHrConfidence:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hrConfidence = a3;
}

- (void)setHasHrConfidence:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHrConfidence
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGradeType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_gradeType = a3;
}

- (void)setHasGradeType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGradeType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setGrade:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_grade = a3;
}

- (void)setHasGrade:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGrade
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasGPS:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasGPS = a3;
}

- (void)setHasHasGPS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasHasGPS
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasStrideCal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_hasStrideCal = a3;
}

- (void)setHasHasStrideCal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasHasStrideCal
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setWorkoutType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCadence:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_cadence = a3;
}

- (void)setHasCadence:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCadence
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPace:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pace = a3;
}

- (void)setHasPace:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPace
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsStroller:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isStroller = a3;
}

- (void)setHasIsStroller:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsStroller
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHrTime:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hrTime = a3;
}

- (void)setHasHrTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHrTime
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxCalorimetryInput;
  return +[NSString stringWithFormat:@"%@ %@", [(CLCKVO2MaxCalorimetryInput *)&v3 description], [(CLCKVO2MaxCalorimetryInput *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_mets;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"mets"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithInt:self->_metSource] forKey:@"metSource"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(float *)&double v4 = self->_hr;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"hr"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(float *)&double v4 = self->_hrConfidence;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"hrConfidence"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_gradeType)] forKey:@"gradeType"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_grade)] forKey:@"grade"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasGPS)] forKey:@"hasGPS"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasStrideCal)] forKey:@"hasStrideCal"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithInt:self->_workoutType] forKey:@"workoutType"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_cadence)] forKey:@"cadence"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
LABEL_29:
    [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isStroller)] forKey:@"isStroller"];
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_15;
  }
LABEL_28:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pace)] forKey:@"pace"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0) {
    goto LABEL_29;
  }
LABEL_14:
  if ((has & 4) != 0) {
LABEL_15:
  }
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_hrTime)] forKey:@"hrTime"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100D504A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
LABEL_28:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_29;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((has & 4) == 0) {
    return;
  }
LABEL_29:

  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = *(void *)&self->_startTime;
    *((_WORD *)a3 + 38) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 16) = LODWORD(self->_mets);
  *((_WORD *)a3 + 38) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 15) = self->_metSource;
  *((_WORD *)a3 + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 13) = LODWORD(self->_hr);
  *((_WORD *)a3 + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 14) = LODWORD(self->_hrConfidence);
  *((_WORD *)a3 + 38) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 12) = self->_gradeType;
  *((_WORD *)a3 + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 2) = *(void *)&self->_grade;
  *((_WORD *)a3 + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)a3 + 72) = self->_hasGPS;
  *((_WORD *)a3 + 38) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)a3 + 73) = self->_hasStrideCal;
  *((_WORD *)a3 + 38) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 17) = self->_workoutType;
  *((_WORD *)a3 + 38) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)a3 + 1) = *(void *)&self->_cadence;
  *((_WORD *)a3 + 38) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 4) = *(void *)&self->_pace;
  *((_WORD *)a3 + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      return;
    }
LABEL_29:
    *((void *)a3 + 3) = *(void *)&self->_hrTime;
    *((_WORD *)a3 + 38) |= 4u;
    return;
  }
LABEL_28:
  *((unsigned char *)a3 + 74) = self->_isStroller;
  *((_WORD *)a3 + 38) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 4) != 0) {
    goto LABEL_29;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)result + 5) = *(void *)&self->_startTime;
    *((_WORD *)result + 38) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = LODWORD(self->_mets);
  *((_WORD *)result + 38) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 15) = self->_metSource;
  *((_WORD *)result + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 13) = LODWORD(self->_hr);
  *((_WORD *)result + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 14) = LODWORD(self->_hrConfidence);
  *((_WORD *)result + 38) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 12) = self->_gradeType;
  *((_WORD *)result + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 2) = *(void *)&self->_grade;
  *((_WORD *)result + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)result + 72) = self->_hasGPS;
  *((_WORD *)result + 38) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)result + 73) = self->_hasStrideCal;
  *((_WORD *)result + 38) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 17) = self->_workoutType;
  *((_WORD *)result + 38) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 1) = *(void *)&self->_cadence;
  *((_WORD *)result + 38) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 4) = *(void *)&self->_pace;
  *((_WORD *)result + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((unsigned char *)result + 74) = self->_isStroller;
  *((_WORD *)result + 38) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_15:
  *((void *)result + 3) = *(void *)&self->_hrTime;
  *((_WORD *)result + 38) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 38);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_startTime != *((double *)a3 + 5)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x200) == 0 || self->_mets != *((float *)a3 + 16)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x100) == 0 || self->_metSource != *((_DWORD *)a3 + 15)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x100) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_hr != *((float *)a3 + 13)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_hrConfidence != *((float *)a3 + 14)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_gradeType != *((_DWORD *)a3 + 12)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_grade != *((double *)a3 + 2)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x800) == 0) {
      goto LABEL_80;
    }
    if (self->_hasGPS)
    {
      if (!*((unsigned char *)a3 + 72)) {
        goto LABEL_80;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x800) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x1000) == 0) {
      goto LABEL_80;
    }
    if (self->_hasStrideCal)
    {
      if (!*((unsigned char *)a3 + 73)) {
        goto LABEL_80;
      }
    }
    else if (*((unsigned char *)a3 + 73))
    {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x1000) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x400) == 0 || self->_workoutType != *((_DWORD *)a3 + 17)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_cadence != *((double *)a3 + 1)) {
      goto LABEL_80;
    }
  }
  else if (v7)
  {
    goto LABEL_80;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_pace != *((double *)a3 + 4)) {
      goto LABEL_80;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 38) & 0x2000) != 0) {
      goto LABEL_80;
    }
    goto LABEL_76;
  }
  if ((*((_WORD *)a3 + 38) & 0x2000) == 0) {
    goto LABEL_80;
  }
  if (self->_isStroller)
  {
    if (!*((unsigned char *)a3 + 74)) {
      goto LABEL_80;
    }
    goto LABEL_76;
  }
  if (*((unsigned char *)a3 + 74))
  {
LABEL_80:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_76:
  LOBYTE(v5) = (v7 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_hrTime != *((double *)a3 + 3)) {
      goto LABEL_80;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
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
  if ((has & 0x200) != 0)
  {
    float mets = self->_mets;
    float v11 = -mets;
    if (mets >= 0.0) {
      float v11 = self->_mets;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x100) != 0)
  {
    uint64_t v53 = 2654435761 * self->_metSource;
    if ((has & 0x40) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v18 = 0;
    goto LABEL_27;
  }
  uint64_t v53 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  float hr = self->_hr;
  float v15 = -hr;
  if (hr >= 0.0) {
    float v15 = self->_hr;
  }
  float v16 = floorf(v15 + 0.5);
  float v17 = (float)(v15 - v16) * 1.8447e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmodf(v16, 1.8447e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabsf(v17);
  }
LABEL_27:
  if ((has & 0x80) != 0)
  {
    float hrConfidence = self->_hrConfidence;
    float v21 = -hrConfidence;
    if (hrConfidence >= 0.0) {
      float v21 = self->_hrConfidence;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t v51 = 2654435761 * self->_gradeType;
    if ((has & 2) != 0) {
      goto LABEL_37;
    }
LABEL_42:
    unint64_t v28 = 0;
    goto LABEL_45;
  }
  uint64_t v51 = 0;
  if ((has & 2) == 0) {
    goto LABEL_42;
  }
LABEL_37:
  double grade = self->_grade;
  double v25 = -grade;
  if (grade >= 0.0) {
    double v25 = self->_grade;
  }
  long double v26 = floor(v25 + 0.5);
  double v27 = (v25 - v26) * 1.84467441e19;
  unint64_t v28 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
  if (v27 >= 0.0)
  {
    if (v27 > 0.0) {
      v28 += (unint64_t)v27;
    }
  }
  else
  {
    v28 -= (unint64_t)fabs(v27);
  }
LABEL_45:
  if ((has & 0x800) != 0) {
    uint64_t v50 = 2654435761 * self->_hasGPS;
  }
  else {
    uint64_t v50 = 0;
  }
  unint64_t v54 = v4;
  unint64_t v52 = v18;
  if ((has & 0x1000) != 0) {
    uint64_t v49 = 2654435761 * self->_hasStrideCal;
  }
  else {
    uint64_t v49 = 0;
  }
  unint64_t v29 = v9;
  if ((has & 0x400) != 0)
  {
    uint64_t v30 = 2654435761 * self->_workoutType;
    if (has) {
      goto LABEL_53;
    }
LABEL_58:
    unint64_t v35 = 0;
    goto LABEL_61;
  }
  uint64_t v30 = 0;
  if ((has & 1) == 0) {
    goto LABEL_58;
  }
LABEL_53:
  double cadence = self->_cadence;
  double v32 = -cadence;
  if (cadence >= 0.0) {
    double v32 = self->_cadence;
  }
  long double v33 = floor(v32 + 0.5);
  double v34 = (v32 - v33) * 1.84467441e19;
  unint64_t v35 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
  if (v34 >= 0.0)
  {
    if (v34 > 0.0) {
      v35 += (unint64_t)v34;
    }
  }
  else
  {
    v35 -= (unint64_t)fabs(v34);
  }
LABEL_61:
  unint64_t v36 = v19;
  if ((has & 8) != 0)
  {
    double pace = self->_pace;
    double v39 = -pace;
    if (pace >= 0.0) {
      double v39 = self->_pace;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  if ((has & 0x2000) != 0)
  {
    uint64_t v42 = 2654435761 * self->_isStroller;
    if ((has & 4) != 0) {
      goto LABEL_71;
    }
LABEL_76:
    unint64_t v47 = 0;
    return v29 ^ v54 ^ v53 ^ v52 ^ v36 ^ v51 ^ v28 ^ v50 ^ v49 ^ v30 ^ v35 ^ v37 ^ v42 ^ v47;
  }
  uint64_t v42 = 0;
  if ((has & 4) == 0) {
    goto LABEL_76;
  }
LABEL_71:
  double hrTime = self->_hrTime;
  double v44 = -hrTime;
  if (hrTime >= 0.0) {
    double v44 = self->_hrTime;
  }
  long double v45 = floor(v44 + 0.5);
  double v46 = (v44 - v45) * 1.84467441e19;
  unint64_t v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0) {
      v47 += (unint64_t)v46;
    }
  }
  else
  {
    v47 -= (unint64_t)fabs(v46);
  }
  return v29 ^ v54 ^ v53 ^ v52 ^ v36 ^ v51 ^ v28 ^ v50 ^ v49 ^ v30 ^ v35 ^ v37 ^ v42 ^ v47;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x10) != 0)
  {
    self->_double startTime = *((double *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v3 = *((_WORD *)a3 + 38);
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)a3 + 38) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_float mets = *((float *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_metSource = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_float hr = *((float *)a3 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_float hrConfidence = *((float *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_gradeType = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_double grade = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x800) == 0)
  {
LABEL_9:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_hasGPS = *((unsigned char *)a3 + 72);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x1000) == 0)
  {
LABEL_10:
    if ((v3 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_hasStrideCal = *((unsigned char *)a3 + 73);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x400) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_workoutType = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 1) == 0)
  {
LABEL_12:
    if ((v3 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double cadence = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 8) == 0)
  {
LABEL_13:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double pace = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 38);
  if ((v3 & 0x2000) == 0)
  {
LABEL_14:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_29:
    self->_double hrTime = *((double *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    return;
  }
LABEL_28:
  self->_isStroller = *((unsigned char *)a3 + 74);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)a3 + 38) & 4) != 0) {
    goto LABEL_29;
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (float)mets
{
  return self->_mets;
}

- (int)metSource
{
  return self->_metSource;
}

- (float)hr
{
  return self->_hr;
}

- (float)hrConfidence
{
  return self->_hrConfidence;
}

- (int)gradeType
{
  return self->_gradeType;
}

- (double)grade
{
  return self->_grade;
}

- (BOOL)hasGPS
{
  return self->_hasGPS;
}

- (BOOL)hasStrideCal
{
  return self->_hasStrideCal;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)cadence
{
  return self->_cadence;
}

- (double)pace
{
  return self->_pace;
}

- (BOOL)isStroller
{
  return self->_isStroller;
}

- (double)hrTime
{
  return self->_hrTime;
}

@end