@interface ALCMElevation
- (BOOL)hasElevationDescended;
- (BOOL)hasGradeType;
- (BOOL)hasRawGradeType;
- (BOOL)hasSource;
- (BOOL)hasVerticalSpeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)verticalSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gradeTypeAsString:(int)a3;
- (id)rawGradeTypeAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (int)StringAsGradeType:(id)a3;
- (int)StringAsRawGradeType:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)gradeType;
- (int)rawGradeType;
- (int)source;
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
- (void)setHasRawGradeType:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasVerticalSpeed:(BOOL)a3;
- (void)setRawGradeType:(int)a3;
- (void)setSource:(int)a3;
- (void)setVerticalSpeed:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMElevation

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
    return off_1022B2538[a3];
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
  *(unsigned char *)&self->_has |= 0x10u;
  self->_verticalSpeed = a3;
}

- (void)setHasVerticalSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVerticalSpeed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)rawGradeType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_rawGradeType;
  }
  else {
    return 0;
  }
}

- (void)setRawGradeType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rawGradeType = a3;
}

- (void)setHasRawGradeType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRawGradeType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)rawGradeTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_1022B2538[a3];
  }
}

- (int)StringAsRawGradeType:(id)a3
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

- (int)source
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (!a3) {
    return @"Phone";
  }
  if (a3 == 1) {
    return @"Watch";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsSource:(id)a3
{
  if ([a3 isEqualToString:@"Phone"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"Watch"];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMElevation;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMElevation *)&v3 description], [(ALCMElevation *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended)] forKey:@"elevationAscended"];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationDescended)] forKey:@"elevationDescended"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t gradeType = self->_gradeType;
  if (gradeType >= 4) {
    v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gradeType];
  }
  else {
    v7 = off_1022B2538[gradeType];
  }
  [v3 setObject:v7 forKey:@"gradeType"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(float *)&double v4 = self->_verticalSpeed;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"verticalSpeed"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return v3;
    }
    goto LABEL_17;
  }
LABEL_13:
  uint64_t rawGradeType = self->_rawGradeType;
  if (rawGradeType >= 4) {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rawGradeType];
  }
  else {
    v9 = off_1022B2538[rawGradeType];
  }
  [v3 setObject:v9 forKey:@"rawGradeType"];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_17:
    int source = self->_source;
    if (source)
    {
      if (source == 1) {
        CFStringRef v11 = @"Watch";
      }
      else {
        CFStringRef v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_source];
      }
    }
    else
    {
      CFStringRef v11 = @"Phone";
    }
    [v3 setObject:v11 forKey:@"source"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004375EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 8) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 3) = self->_elevationDescended;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_gradeType;
  *((unsigned char *)a3 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 7) = LODWORD(self->_verticalSpeed);
  *((unsigned char *)a3 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return;
    }
LABEL_11:
    *((_DWORD *)a3 + 6) = self->_source;
    *((unsigned char *)a3 + 32) |= 8u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_rawGradeType;
  *((unsigned char *)a3 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_11;
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
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_gradeType;
  *((unsigned char *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 7) = LODWORD(self->_verticalSpeed);
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_rawGradeType;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 6) = self->_source;
  *((unsigned char *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2))
    {
LABEL_27:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_elevationDescended != *((_DWORD *)a3 + 3)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_27;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_gradeType != *((_DWORD *)a3 + 4)) {
        goto LABEL_27;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_27;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 0x10) == 0 || self->_verticalSpeed != *((float *)a3 + 7)) {
        goto LABEL_27;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 0x10) != 0)
    {
      goto LABEL_27;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_rawGradeType != *((_DWORD *)a3 + 5)) {
        goto LABEL_27;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 4) != 0)
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 8) == 0 || self->_source != *((_DWORD *)a3 + 6)) {
        goto LABEL_27;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has) {
    uint64_t v4 = 2654435761 * self->_elevationDescended;
  }
  else {
    uint64_t v4 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_gradeType;
  }
  else {
    uint64_t v5 = 0;
  }
  unsigned int elevationAscended = self->_elevationAscended;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    float verticalSpeed = self->_verticalSpeed;
    float v9 = -verticalSpeed;
    if (verticalSpeed >= 0.0) {
      float v9 = self->_verticalSpeed;
    }
    float v10 = floorf(v9 + 0.5);
    float v11 = (float)(v9 - v10) * 1.8447e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabsf(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v12 = 2654435761 * self->_rawGradeType;
    if ((has & 8) != 0) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v13 = 0;
    return v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ (2654435761 * elevationAscended);
  }
  uint64_t v12 = 0;
  if ((has & 8) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v13 = 2654435761 * self->_source;
  return v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ (2654435761 * elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int elevationAscended = *((_DWORD *)a3 + 2);
  char v3 = *((unsigned char *)a3 + 32);
  if (v3)
  {
    self->_elevationDescended = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t gradeType = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_float verticalSpeed = *((float *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_11:
    self->_int source = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_10:
  self->_uint64_t rawGradeType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 32) & 8) != 0) {
    goto LABEL_11;
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