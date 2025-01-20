@interface ALCLElevationDeprecated
- (BOOL)hasElevationDescended;
- (BOOL)hasGradeType;
- (BOOL)hasVerticalSpeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)verticalSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gradeTypeAsString:(int)a3;
- (int)StringAsGradeType:(id)a3;
- (int)gradeType;
- (unint64_t)hash;
- (unsigned)elevationAscended;
- (unsigned)elevationDescended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElevationAscended:(unsigned int)a3;
- (void)setElevationDescended:(unsigned int)a3;
- (void)setGradeType:(int)a3;
- (void)setHasElevationDescended:(BOOL)a3;
- (void)setHasGradeType:(BOOL)a3;
- (void)setHasVerticalSpeed:(BOOL)a3;
- (void)setVerticalSpeed:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLElevationDeprecated

- (void)setElevationDescended:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_elevationDescended = a3;
}

- (void)setHasElevationDescended:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElevationDescended
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)gradeType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_gradeType;
  }
  else {
    return 0;
  }
}

- (void)setGradeType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_gradeType = a3;
}

- (void)setHasGradeType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGradeType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)gradeTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_1022F14C8[a3];
  }
}

- (int)StringAsGradeType:(id)a3
{
  if ([a3 isEqualToString:@"Unknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"Uphill"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"Flat"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"Downhill"]) {
    return 3;
  }
  return 0;
}

- (void)setVerticalSpeed:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_verticalSpeed = a3;
}

- (void)setHasVerticalSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVerticalSpeed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLElevationDeprecated;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLElevationDeprecated *)&v3 description], [(ALCLElevationDeprecated *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended)] forKey:@"elevationAscended"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t gradeType = self->_gradeType;
    if (gradeType >= 4) {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gradeType];
    }
    else {
      v8 = off_1022F14C8[gradeType];
    }
    [v3 setObject:v8 forKey:@"gradeType"];
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    return v3;
  }
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationDescended)] forKey:@"elevationDescended"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(float *)&double v4 = self->_verticalSpeed;
    [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"verticalSpeed"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100CACE44((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 3) = self->_elevationDescended;
    *((unsigned char *)a3 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 5) = LODWORD(self->_verticalSpeed);
      *((unsigned char *)a3 + 24) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_gradeType;
  *((unsigned char *)a3 + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 2) = self->_elevationAscended;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 3) = self->_elevationDescended;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_gradeType;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 5) = LODWORD(self->_verticalSpeed);
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_elevationDescended != *((_DWORD *)a3 + 3)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_17;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_gradeType != *((_DWORD *)a3 + 4)) {
        goto LABEL_17;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 4) == 0 || self->_verticalSpeed != *((float *)a3 + 5)) {
        goto LABEL_17;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_elevationDescended;
  }
  else {
    uint64_t v2 = 0;
  }
  unsigned int elevationAscended = self->_elevationAscended;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_gradeType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v9 = 0;
    return v2 ^ v4 ^ v9 ^ (2654435761 * elevationAscended);
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  float verticalSpeed = self->_verticalSpeed;
  float v6 = -verticalSpeed;
  if (verticalSpeed >= 0.0) {
    float v6 = self->_verticalSpeed;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }
  return v2 ^ v4 ^ v9 ^ (2654435761 * elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int elevationAscended = *((_DWORD *)a3 + 2);
  char v3 = *((unsigned char *)a3 + 24);
  if (v3)
  {
    self->_elevationDescended = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_float verticalSpeed = *((float *)a3 + 5);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t gradeType = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 24) & 4) != 0) {
    goto LABEL_7;
  }
}

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (void)setElevationAscended:(unsigned int)a3
{
  self->_unsigned int elevationAscended = a3;
}

- (unsigned)elevationDescended
{
  return self->_elevationDescended;
}

- (float)verticalSpeed
{
  return self->_verticalSpeed;
}

@end