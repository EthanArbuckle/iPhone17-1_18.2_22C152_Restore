@interface NTPBDate
- (BOOL)hasTimeIntervalSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timeIntervalSince1970;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasTimeIntervalSince1970:(BOOL)a3;
- (void)setTimeIntervalSince1970:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBDate

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeIntervalSince1970 = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = *(void *)&self->_timeIntervalSince1970;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBDate;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBDate description](&v3, sel_description), -[NTPBDate dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_timeIntervalSince1970), @"timeIntervalSince1970");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) == 0;
    if (*(unsigned char *)&self->_has) {
      LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) != 0 && self->_timeIntervalSince1970 == *((double *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return 0;
  }
  double timeIntervalSince1970 = self->_timeIntervalSince1970;
  double v4 = -timeIntervalSince1970;
  if (timeIntervalSince1970 >= 0.0) {
    double v4 = self->_timeIntervalSince1970;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      result += (unint64_t)v6;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_double timeIntervalSince1970 = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end