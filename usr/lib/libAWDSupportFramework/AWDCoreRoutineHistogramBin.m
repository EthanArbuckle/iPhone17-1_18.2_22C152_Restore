@interface AWDCoreRoutineHistogramBin
- (BOOL)hasCount;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)count;
- (unsigned)value;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineHistogramBin

- (void)setValue:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineHistogramBin;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineHistogramBin description](&v3, sel_description), -[AWDCoreRoutineHistogramBin dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_value] forKey:@"value"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_count] forKey:@"count"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineHistogramBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
LABEL_5:
    *((_DWORD *)a3 + 2) = self->_count;
    *((unsigned char *)a3 + 16) |= 1u;
    return;
  }
  *((_DWORD *)a3 + 3) = self->_value;
  *((unsigned char *)a3 + 16) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_value;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_count;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 16) & 2) == 0 || self->_value != *((_DWORD *)a3 + 3)) {
        goto LABEL_11;
      }
    }
    else if ((*((unsigned char *)a3 + 16) & 2) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 16) & 1) == 0 || self->_count != *((_DWORD *)a3 + 2)) {
        goto LABEL_11;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_value;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_count;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 16) & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 16) & 1) == 0) {
      return;
    }
LABEL_5:
    self->_count = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
  self->_value = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 16)) {
    goto LABEL_5;
  }
}

- (unsigned)value
{
  return self->_value;
}

- (unsigned)count
{
  return self->_count;
}

@end