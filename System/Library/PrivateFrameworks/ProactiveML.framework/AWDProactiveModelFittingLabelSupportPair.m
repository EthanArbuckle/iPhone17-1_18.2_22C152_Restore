@interface AWDProactiveModelFittingLabelSupportPair
- (BOOL)hasLabel;
- (BOOL)hasSupport;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)support;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)label;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLabel:(BOOL)a3;
- (void)setHasSupport:(BOOL)a3;
- (void)setLabel:(unint64_t)a3;
- (void)setSupport:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveModelFittingLabelSupportPair

- (float)support
{
  return self->_support;
}

- (unint64_t)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_label = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_support = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_label;
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
  float support = self->_support;
  double v4 = support;
  if (support < 0.0) {
    double v4 = -support;
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
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_label != *((void *)v4 + 1)) {
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
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_support != *((float *)v4 + 4)) {
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
    *((void *)result + 1) = self->_label;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = LODWORD(self->_support);
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
    v4[1] = self->_label;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_support);
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
  return AWDProactiveModelFittingLabelSupportPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:self->_label];
    [v3 setObject:v6 forKey:@"label"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_support;
    unint64_t v7 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v7 forKey:@"support"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingLabelSupportPair;
  double v4 = [(AWDProactiveModelFittingLabelSupportPair *)&v8 description];
  BOOL v5 = [(AWDProactiveModelFittingLabelSupportPair *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSupport
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSupport:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSupport:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float support = a3;
}

- (BOOL)hasLabel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLabel:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLabel:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_label = a3;
}

@end