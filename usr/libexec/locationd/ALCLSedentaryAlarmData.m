@interface ALCLSedentaryAlarmData
- (BOOL)didWake;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)regularEntry;
- (double)firedTime;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDidWake:(BOOL)a3;
- (void)setFiredTime:(double)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRegularEntry:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLSedentaryAlarmData

- (id)typeAsString:(int)a3
{
  if (a3 >= 8) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B37F0 + a3);
  }
}

- (int)StringAsType:(id)a3
{
  if ([a3 isEqualToString:@"kAlarmTypeReminder"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kAlarmTypeFinal"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kAlarmTypeReset"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kAlarmTypeActiveReminder"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kAlarmTypeDrivingReminder"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"kAlarmTypeDeskReminder"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"kAlarmTypeTestSedentary"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"kAlarmTypeTestActive"]) {
    return 7;
  }
  return 0;
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLSedentaryAlarmData;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLSedentaryAlarmData *)&v3 description], [(ALCLSedentaryAlarmData *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_firedTime)] forKey:@"firedTime"];
  uint64_t type = self->_type;
  if (type >= 8) {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
  }
  else {
    v5 = (NSString *)*(&off_1022B37F0 + type);
  }
  [v3 setObject:v5 forKey:@"type"];
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_didWake)] forKey:@"didWake"];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp)] forKey:@"timestamp"];
  }
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry)] forKey:@"regularEntry"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100467B64((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_firedTime;
  *((_DWORD *)a3 + 6) = self->_type;
  *((unsigned char *)a3 + 28) = self->_didWake;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 2) = *(void *)&self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  *((unsigned char *)a3 + 29) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((void *)result + 1) = *(void *)&self->_firedTime;
  *((_DWORD *)result + 6) = self->_type;
  *((unsigned char *)result + 28) = self->_didWake;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 2) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 32) |= 1u;
  }
  *((unsigned char *)result + 29) = self->_regularEntry;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_firedTime != *((double *)a3 + 1) || self->_type != *((_DWORD *)a3 + 6)) {
      goto LABEL_15;
    }
    if (self->_didWake)
    {
      if (!*((unsigned char *)a3 + 28)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((double *)a3 + 2)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_15;
    }
    int v6 = *((unsigned __int8 *)a3 + 29);
    if (self->_regularEntry) {
      LOBYTE(v5) = v6 != 0;
    }
    else {
      LOBYTE(v5) = v6 == 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  double firedTime = self->_firedTime;
  double v4 = -firedTime;
  if (firedTime >= 0.0) {
    double v4 = self->_firedTime;
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
  uint64_t type = self->_type;
  BOOL didWake = self->_didWake;
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v16 = -timestamp;
    if (timestamp >= 0.0) {
      double v16 = self->_timestamp;
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
  return (2654435761 * type) ^ v14 ^ (2654435761 * self->_regularEntry) ^ v11 ^ (2654435761 * didWake);
}

- (void)mergeFrom:(id)a3
{
  self->_double firedTime = *((double *)a3 + 1);
  self->_uint64_t type = *((_DWORD *)a3 + 6);
  self->_BOOL didWake = *((unsigned char *)a3 + 28);
  if (*((unsigned char *)a3 + 32))
  {
    self->_double timestamp = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  self->_regularEntry = *((unsigned char *)a3 + 29);
}

- (double)firedTime
{
  return self->_firedTime;
}

- (void)setFiredTime:(double)a3
{
  self->_double firedTime = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (BOOL)didWake
{
  return self->_didWake;
}

- (void)setDidWake:(BOOL)a3
{
  self->_BOOL didWake = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end