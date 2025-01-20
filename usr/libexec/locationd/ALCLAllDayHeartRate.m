@interface ALCLAllDayHeartRate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)startTime;
- (float)confidence;
- (float)heartRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)mode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setHeartRate:(float)a3;
- (void)setMode:(unsigned int)a3;
- (void)setStartTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLAllDayHeartRate

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLAllDayHeartRate;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLAllDayHeartRate *)&v3 description], [(ALCLAllDayHeartRate *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mode)] forKey:@"mode"];
  *(float *)&double v4 = self->_confidence;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"confidence"];
  *(float *)&double v5 = self->_heartRate;
  [v3 setObject:[NSNumber numberWithFloat:v5] forKey:@"heartRate"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10099AD90((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteFloatField();

  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_startTime;
  *((_DWORD *)a3 + 6) = self->_mode;
  *((_DWORD *)a3 + 4) = LODWORD(self->_confidence);
  *((_DWORD *)a3 + 5) = LODWORD(self->_heartRate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((void *)result + 1) = *(void *)&self->_startTime;
  *((_DWORD *)result + 6) = self->_mode;
  *((_DWORD *)result + 4) = LODWORD(self->_confidence);
  *((_DWORD *)result + 5) = LODWORD(self->_heartRate);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = self->_startTime == *((double *)a3 + 1)
  }
              && self->_mode == *((_DWORD *)a3 + 6)
              && self->_confidence == *((float *)a3 + 4)
              && self->_heartRate == *((float *)a3 + 5);
  return v5;
}

- (unint64_t)hash
{
  double startTime = self->_startTime;
  double v4 = -startTime;
  if (startTime >= 0.0) {
    double v4 = self->_startTime;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  unsigned int mode = self->_mode;
  float confidence = self->_confidence;
  float v14 = -confidence;
  if (confidence >= 0.0) {
    float v14 = self->_confidence;
  }
  float v15 = floorf(v14 + 0.5);
  float v16 = (float)(v14 - v15) * 1.8447e19;
  float v17 = fmodf(v15, 1.8447e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 < 0.0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  float heartRate = self->_heartRate;
  float v23 = -heartRate;
  if (heartRate >= 0.0) {
    float v23 = self->_heartRate;
  }
  float v24 = floorf(v23 + 0.5);
  float v25 = (float)(v23 - v24) * 1.8447e19;
  float v26 = fmodf(v24, 1.8447e19);
  unint64_t v27 = 2654435761u * (unint64_t)v26;
  unint64_t v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0) {
    unint64_t v28 = 2654435761u * (unint64_t)v26;
  }
  unint64_t v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 >= 0.0) {
    unint64_t v29 = v28;
  }
  return (2654435761 * mode) ^ v29 ^ v11 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  self->_double startTime = *((double *)a3 + 1);
  self->_unsigned int mode = *((_DWORD *)a3 + 6);
  self->_float confidence = *((float *)a3 + 4);
  self->_float heartRate = *((float *)a3 + 5);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_double startTime = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->_unsigned int mode = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

- (float)heartRate
{
  return self->_heartRate;
}

- (void)setHeartRate:(float)a3
{
  self->_float heartRate = a3;
}

@end