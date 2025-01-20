@interface ALCLOdometer
- (BOOL)hasAccuracy;
- (BOOL)hasDistance;
- (BOOL)hasGpsAltitude;
- (BOOL)hasGpsSpeedAccuracy;
- (BOOL)hasQuality;
- (BOOL)hasRawSpeed;
- (BOOL)hasSpeed;
- (BOOL)hasTimestampGps;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestampGps;
- (float)accuracy;
- (float)distance;
- (float)gpsAltitude;
- (float)gpsSpeedAccuracy;
- (float)odometer;
- (float)rawSpeed;
- (float)speed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)qualityAsString:(int)a3;
- (int)StringAsQuality:(id)a3;
- (int)quality;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccuracy:(float)a3;
- (void)setDistance:(float)a3;
- (void)setGpsAltitude:(float)a3;
- (void)setGpsSpeedAccuracy:(float)a3;
- (void)setHasAccuracy:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasGpsAltitude:(BOOL)a3;
- (void)setHasGpsSpeedAccuracy:(BOOL)a3;
- (void)setHasQuality:(BOOL)a3;
- (void)setHasRawSpeed:(BOOL)a3;
- (void)setHasSpeed:(BOOL)a3;
- (void)setHasTimestampGps:(BOOL)a3;
- (void)setOdometer:(float)a3;
- (void)setQuality:(int)a3;
- (void)setRawSpeed:(float)a3;
- (void)setSpeed:(float)a3;
- (void)setTimestampGps:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLOdometer

- (void)setDistance:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDistance
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAccuracy:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_accuracy = a3;
}

- (void)setHasAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccuracy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGpsAltitude:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_gpsAltitude = a3;
}

- (void)setHasGpsAltitude:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasGpsAltitude
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSpeed:(float)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSpeed
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRawSpeed:(float)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_rawSpeed = a3;
}

- (void)setHasRawSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRawSpeed
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setGpsSpeedAccuracy:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_gpsSpeedAccuracy = a3;
}

- (void)setHasGpsSpeedAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasGpsSpeedAccuracy
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimestampGps:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampGps = a3;
}

- (void)setHasTimestampGps:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampGps
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)quality
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_quality;
  }
  else {
    return 0;
  }
}

- (void)setQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasQuality
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)qualityAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_10232D3D0 + a3);
  }
}

- (int)StringAsQuality:(id)a3
{
  if ([a3 isEqualToString:@"kUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kGood"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kMed"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kPoor"]) {
    return 3;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLOdometer;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLOdometer *)&v3 description], [(ALCLOdometer *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_distance;
    [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"distance"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_accuracy;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"accuracy"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(float *)&double v4 = self->_gpsAltitude;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"gpsAltitude"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  *(float *)&double v4 = self->_speed;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"speed"];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *(float *)&double v4 = self->_rawSpeed;
    [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"rawSpeed"];
  }
LABEL_7:
  *(float *)&double v4 = self->_odometer;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"odometer"];
  char v7 = (char)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestampGps)] forKey:@"timestampGps"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_18;
  }
  *(float *)&double v6 = self->_gpsSpeedAccuracy;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"gpsSpeedAccuracy"];
  char v7 = (char)self->_has;
  if (v7) {
    goto LABEL_17;
  }
LABEL_9:
  if ((v7 & 0x20) == 0) {
    return v3;
  }
LABEL_18:
  uint64_t quality = self->_quality;
  if (quality >= 4) {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_quality];
  }
  else {
    v9 = (NSString *)*(&off_10232D3D0 + quality);
  }
  [v3 setObject:v9 forKey:@"quality"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101558008((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_6:
  }
    PBDataWriterWriteFloatField();
LABEL_7:
  PBDataWriterWriteFloatField();
  char v5 = (char)self->_has;
  if ((v5 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_18;
  }
  PBDataWriterWriteFloatField();
  char v5 = (char)self->_has;
  if (v5) {
    goto LABEL_17;
  }
LABEL_9:
  if ((v5 & 0x20) == 0) {
    return;
  }
LABEL_18:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = LODWORD(self->_distance);
    *((unsigned char *)a3 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = LODWORD(self->_accuracy);
  *((unsigned char *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 6) = LODWORD(self->_gpsAltitude);
  *((unsigned char *)a3 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  *((_DWORD *)a3 + 11) = LODWORD(self->_speed);
  *((unsigned char *)a3 + 48) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 10) = LODWORD(self->_rawSpeed);
    *((unsigned char *)a3 + 48) |= 0x40u;
  }
LABEL_7:
  *((_DWORD *)a3 + 8) = LODWORD(self->_odometer);
  char v4 = (char)self->_has;
  if ((v4 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 7) = LODWORD(self->_gpsSpeedAccuracy);
    *((unsigned char *)a3 + 48) |= 0x10u;
    char v4 = (char)self->_has;
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 0x20) == 0) {
        return;
      }
LABEL_18:
      *((_DWORD *)a3 + 9) = self->_quality;
      *((unsigned char *)a3 + 48) |= 0x20u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)a3 + 1) = *(void *)&self->_timestampGps;
  *((unsigned char *)a3 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    goto LABEL_18;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = LODWORD(self->_distance);
    *((unsigned char *)result + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = LODWORD(self->_accuracy);
  *((unsigned char *)result + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 6) = LODWORD(self->_gpsAltitude);
  *((unsigned char *)result + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  *((_DWORD *)result + 11) = LODWORD(self->_speed);
  *((unsigned char *)result + 48) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)result + 10) = LODWORD(self->_rawSpeed);
    *((unsigned char *)result + 48) |= 0x40u;
  }
LABEL_7:
  *((_DWORD *)result + 8) = LODWORD(self->_odometer);
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)result + 7) = LODWORD(self->_gpsSpeedAccuracy);
    *((unsigned char *)result + 48) |= 0x10u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        return result;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)result + 1) = *(void *)&self->_timestampGps;
  *((unsigned char *)result + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 9) = self->_quality;
  *((unsigned char *)result + 48) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_distance != *((float *)a3 + 5)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_accuracy != *((float *)a3 + 4)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_gpsAltitude != *((float *)a3 + 6)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x80) == 0 || self->_speed != *((float *)a3 + 11)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x80) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x40) == 0 || self->_rawSpeed != *((float *)a3 + 10)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if (self->_odometer != *((float *)a3 + 8))
  {
LABEL_42:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_gpsSpeedAccuracy != *((float *)a3 + 7)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestampGps != *((double *)a3 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)a3 + 48))
  {
    goto LABEL_42;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 48) & 0x20) == 0 || self->_quality != *((_DWORD *)a3 + 9)) {
      goto LABEL_42;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    float distance = self->_distance;
    float v6 = -distance;
    if (distance >= 0.0) {
      float v6 = self->_distance;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    float accuracy = self->_accuracy;
    float v11 = -accuracy;
    if (accuracy >= 0.0) {
      float v11 = self->_accuracy;
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
  if ((has & 8) != 0)
  {
    float gpsAltitude = self->_gpsAltitude;
    float v16 = -gpsAltitude;
    if (gpsAltitude >= 0.0) {
      float v16 = self->_gpsAltitude;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (has < 0)
  {
    float speed = self->_speed;
    float v21 = -speed;
    if (speed >= 0.0) {
      float v21 = self->_speed;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    float v24 = fmodf(v22, 1.8447e19);
    unint64_t v25 = 2654435761u * (unint64_t)v24;
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        unint64_t v19 = v25 + (unint64_t)v23;
      }
      else {
        unint64_t v19 = 2654435761u * (unint64_t)v24;
      }
      if ((has & 0x40) == 0) {
        goto LABEL_43;
      }
    }
    else
    {
      unint64_t v19 = v25 - (unint64_t)fabsf(v23);
      if ((has & 0x40) == 0)
      {
LABEL_43:
        unint64_t v34 = 0;
        goto LABEL_44;
      }
    }
  }
  else
  {
    unint64_t v19 = 0;
    if ((has & 0x40) == 0) {
      goto LABEL_43;
    }
  }
  float rawSpeed = self->_rawSpeed;
  float v27 = -rawSpeed;
  if (rawSpeed >= 0.0) {
    float v27 = self->_rawSpeed;
  }
  float v28 = floorf(v27 + 0.5);
  float v29 = (float)(v27 - v28) * 1.8447e19;
  float v30 = fmodf(v28, 1.8447e19);
  unint64_t v31 = 2654435761u * (unint64_t)v30;
  unint64_t v32 = v31 + (unint64_t)v29;
  if (v29 <= 0.0) {
    unint64_t v32 = 2654435761u * (unint64_t)v30;
  }
  unint64_t v33 = v31 - (unint64_t)fabsf(v29);
  if (v29 < 0.0) {
    unint64_t v34 = v33;
  }
  else {
    unint64_t v34 = v32;
  }
LABEL_44:
  float odometer = self->_odometer;
  float v36 = -odometer;
  if (odometer >= 0.0) {
    float v36 = self->_odometer;
  }
  float v37 = floorf(v36 + 0.5);
  float v38 = (float)(v36 - v37) * 1.8447e19;
  float v39 = fmodf(v37, 1.8447e19);
  unint64_t v40 = 2654435761u * (unint64_t)v39;
  unint64_t v41 = v40 + (unint64_t)v38;
  if (v38 <= 0.0) {
    unint64_t v41 = 2654435761u * (unint64_t)v39;
  }
  unint64_t v42 = v40 - (unint64_t)fabsf(v38);
  if (v38 < 0.0) {
    unint64_t v43 = v42;
  }
  else {
    unint64_t v43 = v41;
  }
  if ((has & 0x10) != 0)
  {
    float gpsSpeedAccuracy = self->_gpsSpeedAccuracy;
    float v46 = -gpsSpeedAccuracy;
    if (gpsSpeedAccuracy >= 0.0) {
      float v46 = self->_gpsSpeedAccuracy;
    }
    float v47 = floorf(v46 + 0.5);
    float v48 = (float)(v46 - v47) * 1.8447e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  if (has)
  {
    double timestampGps = self->_timestampGps;
    double v51 = -timestampGps;
    if (timestampGps >= 0.0) {
      double v51 = self->_timestampGps;
    }
    long double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
      if ((has & 0x20) == 0) {
        goto LABEL_70;
      }
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
      if ((has & 0x20) == 0)
      {
LABEL_70:
        uint64_t v54 = 0;
        return v9 ^ v4 ^ v14 ^ v19 ^ v44 ^ v49 ^ v54 ^ v34 ^ v43;
      }
    }
  }
  else
  {
    unint64_t v49 = 0;
    if ((has & 0x20) == 0) {
      goto LABEL_70;
    }
  }
  uint64_t v54 = 2654435761 * self->_quality;
  return v9 ^ v4 ^ v14 ^ v19 ^ v44 ^ v49 ^ v54 ^ v34 ^ v43;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 4) != 0)
  {
    self->_float distance = *((float *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 48);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_float accuracy = *((float *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_float gpsAltitude = *((float *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  self->_float speed = *((float *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)a3 + 48) & 0x40) != 0)
  {
LABEL_6:
    self->_float rawSpeed = *((float *)a3 + 10);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_7:
  self->_float odometer = *((float *)a3 + 8);
  char v4 = *((unsigned char *)a3 + 48);
  if ((v4 & 0x10) != 0)
  {
    self->_float gpsSpeedAccuracy = *((float *)a3 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
    char v4 = *((unsigned char *)a3 + 48);
    if ((v4 & 1) == 0)
    {
LABEL_9:
      if ((v4 & 0x20) == 0) {
        return;
      }
LABEL_18:
      self->_uint64_t quality = *((_DWORD *)a3 + 9);
      *(unsigned char *)&self->_has |= 0x20u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_double timestampGps = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 48) & 0x20) != 0) {
    goto LABEL_18;
  }
}

- (float)distance
{
  return self->_distance;
}

- (float)accuracy
{
  return self->_accuracy;
}

- (float)gpsAltitude
{
  return self->_gpsAltitude;
}

- (float)speed
{
  return self->_speed;
}

- (float)rawSpeed
{
  return self->_rawSpeed;
}

- (float)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(float)a3
{
  self->_float odometer = a3;
}

- (float)gpsSpeedAccuracy
{
  return self->_gpsSpeedAccuracy;
}

- (double)timestampGps
{
  return self->_timestampGps;
}

@end