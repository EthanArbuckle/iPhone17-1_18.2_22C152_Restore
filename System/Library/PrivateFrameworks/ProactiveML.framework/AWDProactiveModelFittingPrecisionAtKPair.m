@interface AWDProactiveModelFittingPrecisionAtKPair
- (BOOL)hasK;
- (BOOL)hasPrecision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)precision;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)k;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasK:(BOOL)a3;
- (void)setHasPrecision:(BOOL)a3;
- (void)setK:(unint64_t)a3;
- (void)setPrecision:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingPrecisionAtKPair

- (float)precision
{
  return self->_precision;
}

- (unint64_t)k
{
  return self->_k;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_k = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_precision = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_k;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float precision = self->_precision;
  double v4 = precision;
  if (precision < 0.0) {
    double v4 = -precision;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_k != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_precision != *((float *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_k;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = LODWORD(self->_precision);
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_k;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_precision);
    *((unsigned char *)v4 + 20) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingPrecisionAtKPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:self->_k];
    [v3 setObject:v6 forKey:@"k"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_precision;
    unint64_t v7 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v7 forKey:@"precision"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingPrecisionAtKPair;
  double v4 = [(AWDProactiveModelFittingPrecisionAtKPair *)&v8 description];
  BOOL v5 = [(AWDProactiveModelFittingPrecisionAtKPair *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPrecision
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPrecision:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPrecision:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float precision = a3;
}

- (BOOL)hasK
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasK:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setK:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_k = a3;
}

@end