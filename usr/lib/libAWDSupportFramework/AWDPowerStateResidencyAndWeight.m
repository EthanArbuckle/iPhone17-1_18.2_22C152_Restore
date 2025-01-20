@interface AWDPowerStateResidencyAndWeight
- (BOOL)hasResidency;
- (BOOL)hasWeight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)residency;
- (unsigned)weight;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasResidency:(BOOL)a3;
- (void)setHasWeight:(BOOL)a3;
- (void)setResidency:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerStateResidencyAndWeight

- (void)setResidency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_residency = a3;
}

- (void)setHasResidency:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResidency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWeight:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerStateResidencyAndWeight;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerStateResidencyAndWeight description](&v3, sel_description), -[AWDPowerStateResidencyAndWeight dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_residency] forKey:@"residency"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_weight] forKey:@"weight"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerStateResidencyAndWeightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
LABEL_5:
    *((_DWORD *)a3 + 3) = self->_weight;
    *((unsigned char *)a3 + 16) |= 2u;
    return;
  }
  *((_DWORD *)a3 + 2) = self->_residency;
  *((unsigned char *)a3 + 16) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_residency;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_weight;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 16) & 1) == 0 || self->_residency != *((_DWORD *)a3 + 2)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 16))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 16) & 2) == 0 || self->_weight != *((_DWORD *)a3 + 3)) {
        goto LABEL_11;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_residency;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_weight;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 16) & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 16) & 2) == 0) {
      return;
    }
LABEL_5:
    self->_weight = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
  self->_residency = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 16) & 2) != 0) {
    goto LABEL_5;
  }
}

- (unsigned)residency
{
  return self->_residency;
}

- (unsigned)weight
{
  return self->_weight;
}

@end