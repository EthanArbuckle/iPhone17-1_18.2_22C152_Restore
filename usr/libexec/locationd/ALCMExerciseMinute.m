@interface ALCMExerciseMinute
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)avgIntensity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeAsString:(int)a3;
- (int)StringAsMode:(id)a3;
- (int)mode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgIntensity:(double)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMExerciseMinute

- (int)mode
{
  if (*(unsigned char *)&self->_has) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_10231FEA8 + a3);
  }
}

- (int)StringAsMode:(id)a3
{
  if ([a3 isEqualToString:@"kModeThreshold"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kModeBurst"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kModeCoverage"]) {
    return 2;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMExerciseMinute;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMExerciseMinute *)&v3 description], [(ALCMExerciseMinute *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_avgIntensity)] forKey:@"avgIntensity"];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t mode = self->_mode;
    if (mode >= 3) {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mode];
    }
    else {
      v5 = (NSString *)*(&off_10231FEA8 + mode);
    }
    [v3 setObject:v5 forKey:@"mode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1013192CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_avgIntensity;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_mode;
    *((unsigned char *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((void *)result + 1) = *(void *)&self->_avgIntensity;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 4) = self->_mode;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_avgIntensity != *((double *)a3 + 1)) {
      goto LABEL_7;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) != 0 && self->_mode == *((_DWORD *)a3 + 4))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  double avgIntensity = self->_avgIntensity;
  double v4 = -avgIntensity;
  if (avgIntensity >= 0.0) {
    double v4 = self->_avgIntensity;
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
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_mode;
  }
  else {
    uint64_t v11 = 0;
  }
  return v11 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  self->_double avgIntensity = *((double *)a3 + 1);
  if (*((unsigned char *)a3 + 20))
  {
    self->_uint64_t mode = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (double)avgIntensity
{
  return self->_avgIntensity;
}

- (void)setAvgIntensity:(double)a3
{
  self->_double avgIntensity = a3;
}

@end