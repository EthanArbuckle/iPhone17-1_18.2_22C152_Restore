@interface ALCLStrideCalEntry
- (BOOL)hasPacebin;
- (BOOL)hasRecordId;
- (BOOL)hasRegularEntry;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)endTime;
- (double)startTime;
- (double)timestamp;
- (float)distance;
- (float)kvalue;
- (float)kvalueTrack;
- (float)score;
- (float)speed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)recordId;
- (int)session;
- (int)steps;
- (unint64_t)hash;
- (unsigned)pacebin;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistance:(float)a3;
- (void)setEndTime:(double)a3;
- (void)setHasPacebin:(BOOL)a3;
- (void)setHasRecordId:(BOOL)a3;
- (void)setHasRegularEntry:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setKvalue:(float)a3;
- (void)setKvalueTrack:(float)a3;
- (void)setPacebin:(unsigned int)a3;
- (void)setRecordId:(int)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)setSession:(int)a3;
- (void)setSpeed:(float)a3;
- (void)setStartTime:(double)a3;
- (void)setSteps:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLStrideCalEntry

- (void)setRecordId:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_recordId = a3;
}

- (void)setHasRecordId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRecordId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPacebin:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pacebin = a3;
}

- (void)setHasPacebin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPacebin
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRegularEntry:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_regularEntry = a3;
}

- (void)setHasRegularEntry:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRegularEntry
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLStrideCalEntry;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLStrideCalEntry *)&v3 description], [(ALCLStrideCalEntry *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_recordId)] forKey:@"recordId"];
  }
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pacebin)] forKey:@"pacebin"];
  }
  *(float *)&double v4 = self->_kvalue;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"kvalue"];
  *(float *)&double v5 = self->_kvalueTrack;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5)] forKey:@"kvalueTrack"];
  *(float *)&double v6 = self->_score;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"score"];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_endTime)] forKey:@"endTime"];
  *(float *)&double v7 = self->_distance;
  [v3 setObject:[NSNumber numberWithFloat:v7] forKey:@"distance"];
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_steps)] forKey:@"steps"];
  [v3 setObject:[NSNumber numberWithInt:self->_session] forKey:@"session"];
  *(float *)&double v8 = self->_speed;
  [v3 setObject:[NSNumber numberWithFloat:v8] forKey:@"speed"];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithDouble:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_regularEntry] forKey:@"regularEntry"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10045FF90((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_recordId;
    *((unsigned char *)a3 + 72) |= 4u;
  }
  *((void *)a3 + 2) = *(void *)&self->_startTime;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_pacebin;
    *((unsigned char *)a3 + 72) |= 2u;
  }
  *((_DWORD *)a3 + 9) = LODWORD(self->_kvalue);
  *((_DWORD *)a3 + 10) = LODWORD(self->_kvalueTrack);
  *((_DWORD *)a3 + 13) = LODWORD(self->_score);
  *((void *)a3 + 1) = *(void *)&self->_endTime;
  *((_DWORD *)a3 + 8) = LODWORD(self->_distance);
  *((_DWORD *)a3 + 16) = self->_steps;
  *((_DWORD *)a3 + 14) = self->_session;
  *((_DWORD *)a3 + 15) = LODWORD(self->_speed);
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
LABEL_9:
    *((unsigned char *)a3 + 68) = self->_regularEntry;
    *((unsigned char *)a3 + 72) |= 8u;
    return;
  }
  *((void *)a3 + 3) = *(void *)&self->_timestamp;
  *((unsigned char *)a3 + 72) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)result + 12) = self->_recordId;
    *((unsigned char *)result + 72) |= 4u;
  }
  *((void *)result + 2) = *(void *)&self->_startTime;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)result + 11) = self->_pacebin;
    *((unsigned char *)result + 72) |= 2u;
  }
  *((_DWORD *)result + 9) = LODWORD(self->_kvalue);
  *((_DWORD *)result + 10) = LODWORD(self->_kvalueTrack);
  *((_DWORD *)result + 13) = LODWORD(self->_score);
  *((void *)result + 1) = *(void *)&self->_endTime;
  *((_DWORD *)result + 8) = LODWORD(self->_distance);
  *((_DWORD *)result + 16) = self->_steps;
  *((_DWORD *)result + 14) = self->_session;
  *((_DWORD *)result + 15) = LODWORD(self->_speed);
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)result + 68) = self->_regularEntry;
    *((unsigned char *)result + 72) |= 8u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_recordId != *((_DWORD *)a3 + 12)) {
        goto LABEL_28;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_28;
    }
    if (self->_startTime != *((double *)a3 + 2))
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_pacebin != *((_DWORD *)a3 + 11)) {
        goto LABEL_28;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_28;
    }
    if (self->_kvalue != *((float *)a3 + 9)
      || self->_kvalueTrack != *((float *)a3 + 10)
      || self->_score != *((float *)a3 + 13)
      || self->_endTime != *((double *)a3 + 1)
      || self->_distance != *((float *)a3 + 8)
      || self->_steps != *((_DWORD *)a3 + 16)
      || self->_session != *((_DWORD *)a3 + 14)
      || self->_speed != *((float *)a3 + 15))
    {
      goto LABEL_28;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_timestamp != *((double *)a3 + 3)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_28;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 72) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0) {
        goto LABEL_28;
      }
      if (self->_regularEntry)
      {
        if (!*((unsigned char *)a3 + 68)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)a3 + 68))
      {
        goto LABEL_28;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    uint64_t v77 = 2654435761 * self->_recordId;
  }
  else {
    uint64_t v77 = 0;
  }
  double startTime = self->_startTime;
  double v5 = -startTime;
  if (startTime >= 0.0) {
    double v5 = self->_startTime;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0) {
    unint64_t v11 = v10;
  }
  unint64_t v76 = v11;
  if ((has & 2) != 0) {
    uint64_t v75 = 2654435761 * self->_pacebin;
  }
  else {
    uint64_t v75 = 0;
  }
  float kvalue = self->_kvalue;
  float v13 = -kvalue;
  if (kvalue >= 0.0) {
    float v13 = self->_kvalue;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  float v16 = fmodf(v14, 1.8447e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 >= 0.0) {
    unint64_t v19 = v18;
  }
  unint64_t v74 = v19;
  float kvalueTrack = self->_kvalueTrack;
  float v21 = -kvalueTrack;
  if (kvalueTrack >= 0.0) {
    float v21 = self->_kvalueTrack;
  }
  float v22 = floorf(v21 + 0.5);
  float v23 = (float)(v21 - v22) * 1.8447e19;
  float v24 = fmodf(v22, 1.8447e19);
  unint64_t v25 = 2654435761u * (unint64_t)v24;
  unint64_t v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0) {
    unint64_t v26 = 2654435761u * (unint64_t)v24;
  }
  unint64_t v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 < 0.0) {
    unint64_t v28 = v27;
  }
  else {
    unint64_t v28 = v26;
  }
  float score = self->_score;
  float v30 = -score;
  if (score >= 0.0) {
    float v30 = self->_score;
  }
  float v31 = floorf(v30 + 0.5);
  float v32 = (float)(v30 - v31) * 1.8447e19;
  float v33 = fmodf(v31, 1.8447e19);
  unint64_t v34 = 2654435761u * (unint64_t)v33;
  unint64_t v35 = v34 + (unint64_t)v32;
  if (v32 <= 0.0) {
    unint64_t v35 = 2654435761u * (unint64_t)v33;
  }
  unint64_t v36 = v34 - (unint64_t)fabsf(v32);
  if (v32 < 0.0) {
    unint64_t v37 = v36;
  }
  else {
    unint64_t v37 = v35;
  }
  double endTime = self->_endTime;
  double v39 = -endTime;
  if (endTime >= 0.0) {
    double v39 = self->_endTime;
  }
  long double v40 = floor(v39 + 0.5);
  double v41 = (v39 - v40) * 1.84467441e19;
  double v42 = fmod(v40, 1.84467441e19);
  unint64_t v43 = 2654435761u * (unint64_t)v42;
  unint64_t v44 = v43 + (unint64_t)v41;
  if (v41 <= 0.0) {
    unint64_t v44 = 2654435761u * (unint64_t)v42;
  }
  unint64_t v45 = v43 - (unint64_t)fabs(v41);
  if (v41 < 0.0) {
    unint64_t v46 = v45;
  }
  else {
    unint64_t v46 = v44;
  }
  float distance = self->_distance;
  float v48 = -distance;
  if (distance >= 0.0) {
    float v48 = self->_distance;
  }
  float v49 = floorf(v48 + 0.5);
  float v50 = (float)(v48 - v49) * 1.8447e19;
  float v51 = fmodf(v49, 1.8447e19);
  unint64_t v52 = 2654435761u * (unint64_t)v51;
  unint64_t v53 = v52 + (unint64_t)v50;
  if (v50 <= 0.0) {
    unint64_t v53 = 2654435761u * (unint64_t)v51;
  }
  unint64_t v54 = v52 - (unint64_t)fabsf(v50);
  uint64_t steps = self->_steps;
  if (v50 < 0.0) {
    unint64_t v56 = v54;
  }
  else {
    unint64_t v56 = v53;
  }
  uint64_t session = self->_session;
  float speed = self->_speed;
  float v59 = -speed;
  if (speed >= 0.0) {
    float v59 = self->_speed;
  }
  float v60 = floorf(v59 + 0.5);
  float v61 = (float)(v59 - v60) * 1.8447e19;
  float v62 = fmodf(v60, 1.8447e19);
  unint64_t v63 = 2654435761u * (unint64_t)v62;
  unint64_t v64 = v63 + (unint64_t)v61;
  if (v61 <= 0.0) {
    unint64_t v64 = 2654435761u * (unint64_t)v62;
  }
  unint64_t v65 = v63 - (unint64_t)fabsf(v61);
  if (v61 < 0.0) {
    unint64_t v66 = v65;
  }
  else {
    unint64_t v66 = v64;
  }
  if (has)
  {
    double timestamp = self->_timestamp;
    double v69 = -timestamp;
    if (timestamp >= 0.0) {
      double v69 = self->_timestamp;
    }
    long double v70 = floor(v69 + 0.5);
    double v71 = (v69 - v70) * 1.84467441e19;
    unint64_t v67 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
    if (v71 >= 0.0)
    {
      if (v71 > 0.0) {
        v67 += (unint64_t)v71;
      }
      if ((has & 8) == 0) {
        goto LABEL_65;
      }
    }
    else
    {
      v67 -= (unint64_t)fabs(v71);
      if ((has & 8) == 0)
      {
LABEL_65:
        uint64_t v72 = 0;
        return v76 ^ v77 ^ v75 ^ v74 ^ v28 ^ v37 ^ v46 ^ v56 ^ (2654435761 * steps) ^ (2654435761 * session) ^ v66 ^ v67 ^ v72;
      }
    }
  }
  else
  {
    unint64_t v67 = 0;
    if ((has & 8) == 0) {
      goto LABEL_65;
    }
  }
  uint64_t v72 = 2654435761 * self->_regularEntry;
  return v76 ^ v77 ^ v75 ^ v74 ^ v28 ^ v37 ^ v46 ^ v56 ^ (2654435761 * steps) ^ (2654435761 * session) ^ v66 ^ v67 ^ v72;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 72) & 4) != 0)
  {
    self->_recordId = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
  self->_double startTime = *((double *)a3 + 2);
  if ((*((unsigned char *)a3 + 72) & 2) != 0)
  {
    self->_pacebin = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 2u;
  }
  self->_float kvalue = *((float *)a3 + 9);
  self->_float kvalueTrack = *((float *)a3 + 10);
  self->_float score = *((float *)a3 + 13);
  self->_double endTime = *((double *)a3 + 1);
  self->_float distance = *((float *)a3 + 8);
  self->_uint64_t steps = *((_DWORD *)a3 + 16);
  self->_uint64_t session = *((_DWORD *)a3 + 14);
  self->_float speed = *((float *)a3 + 15);
  if ((*((unsigned char *)a3 + 72) & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 72) & 8) == 0) {
      return;
    }
LABEL_9:
    self->_regularEntry = *((unsigned char *)a3 + 68);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
  self->_double timestamp = *((double *)a3 + 3);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 72) & 8) != 0) {
    goto LABEL_9;
  }
}

- (int)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (unsigned)pacebin
{
  return self->_pacebin;
}

- (float)kvalue
{
  return self->_kvalue;
}

- (void)setKvalue:(float)a3
{
  self->_float kvalue = a3;
}

- (float)kvalueTrack
{
  return self->_kvalueTrack;
}

- (void)setKvalueTrack:(float)a3
{
  self->_float kvalueTrack = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_float score = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_double endTime = a3;
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_float distance = a3;
}

- (int)steps
{
  return self->_steps;
}

- (void)setSteps:(int)a3
{
  self->_uint64_t steps = a3;
}

- (int)session
{
  return self->_session;
}

- (void)setSession:(int)a3
{
  self->_uint64_t session = a3;
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  self->_float speed = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

@end