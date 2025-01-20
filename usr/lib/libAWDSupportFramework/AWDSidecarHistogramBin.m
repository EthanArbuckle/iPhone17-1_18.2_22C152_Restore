@interface AWDSidecarHistogramBin
- (BOOL)hasBinEnd;
- (BOOL)hasBinStart;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)binEnd;
- (double)binStart;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBinEnd:(double)a3;
- (void)setBinStart:(double)a3;
- (void)setHasBinEnd:(BOOL)a3;
- (void)setHasBinStart:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSidecarHistogramBin

- (void)setBinStart:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_binStart = a3;
}

- (void)setHasBinStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBinStart
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBinEnd:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_binEnd = a3;
}

- (void)setHasBinEnd:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBinEnd
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSidecarHistogramBin;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSidecarHistogramBin description](&v3, sel_description), -[AWDSidecarHistogramBin dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[NSNumber numberWithDouble:self->_binEnd] forKey:@"binEnd"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  [v3 setObject:[NSNumber numberWithDouble:self->_binStart] forKey:@"binStart"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithDouble:self->_value] forKey:@"value"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSidecarHistogramBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 4) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = *(void *)&self->_binStart;
    *((unsigned char *)a3 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return;
      }
LABEL_7:
      *((void *)a3 + 3) = *(void *)&self->_value;
      *((unsigned char *)a3 + 32) |= 4u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = *(void *)&self->_binEnd;
  *((unsigned char *)a3 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_binStart;
    *((unsigned char *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_binEnd;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 3) = *(void *)&self->_value;
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_binStart != *((double *)a3 + 2)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_binEnd != *((double *)a3 + 1)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_value != *((double *)a3 + 3)) {
        goto LABEL_16;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double binStart = self->_binStart;
    double v6 = -binStart;
    if (binStart >= 0.0) {
      double v6 = self->_binStart;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double binEnd = self->_binEnd;
    double v11 = -binEnd;
    if (binEnd >= 0.0) {
      double v11 = self->_binEnd;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0)
  {
    double value = self->_value;
    double v16 = -value;
    if (value >= 0.0) {
      double v16 = self->_value;
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
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_double binStart = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        return;
      }
LABEL_7:
      self->_double value = *((double *)a3 + 3);
      *(unsigned char *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double binEnd = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 32) & 4) != 0) {
    goto LABEL_7;
  }
}

- (double)binStart
{
  return self->_binStart;
}

- (double)binEnd
{
  return self->_binEnd;
}

- (double)value
{
  return self->_value;
}

@end