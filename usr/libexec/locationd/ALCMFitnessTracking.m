@interface ALCMFitnessTracking
- (BOOL)fitnessTrackingEnabled;
- (BOOL)hasPowerSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)powerSourceAsString:(int)a3;
- (int)StringAsPowerSource:(id)a3;
- (int)powerSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFitnessTrackingEnabled:(BOOL)a3;
- (void)setHasPowerSource:(BOOL)a3;
- (void)setPowerSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMFitnessTracking

- (int)powerSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_powerSource;
  }
  else {
    return 0;
  }
}

- (void)setPowerSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_powerSource = a3;
}

- (void)setHasPowerSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPowerSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)powerSourceAsString:(int)a3
{
  if (a3 >= 4) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_10232C968 + a3);
  }
}

- (int)StringAsPowerSource:(id)a3
{
  if ([a3 isEqualToString:@"kChargerTypeUnknown"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kChargerTypeNone"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kChargerTypeUsb"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kChargerTypeExternal"]) {
    return 3;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMFitnessTracking;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMFitnessTracking *)&v3 description], [(ALCMFitnessTracking *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[NSNumber numberWithBool:self->_fitnessTrackingEnabled] forKey:@"fitnessTrackingEnabled"];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t powerSource = self->_powerSource;
    if (powerSource >= 4) {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_powerSource];
    }
    else {
      v5 = (NSString *)*(&off_10232C968 + powerSource);
    }
    [v3 setObject:v5 forKey:@"powerSource"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1015394B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 12) = self->_fitnessTrackingEnabled;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_powerSource;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  *((unsigned char *)result + 12) = self->_fitnessTrackingEnabled;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_powerSource;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_fitnessTrackingEnabled)
    {
      if (!*((unsigned char *)a3 + 12)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)a3 + 12))
    {
LABEL_10:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 16) & 1) == 0 || self->_powerSource != *((_DWORD *)a3 + 2)) {
        goto LABEL_10;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_powerSource;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761 * self->_fitnessTrackingEnabled);
}

- (void)mergeFrom:(id)a3
{
  self->_fitnessTrackingEnabled = *((unsigned char *)a3 + 12);
  if (*((unsigned char *)a3 + 16))
  {
    self->_uint64_t powerSource = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)fitnessTrackingEnabled
{
  return self->_fitnessTrackingEnabled;
}

- (void)setFitnessTrackingEnabled:(BOOL)a3
{
  self->_fitnessTrackingEnabled = a3;
}

@end