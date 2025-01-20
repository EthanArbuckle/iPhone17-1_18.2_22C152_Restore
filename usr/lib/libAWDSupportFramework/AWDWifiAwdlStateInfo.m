@interface AWDWifiAwdlStateInfo
- (BOOL)hasCount;
- (BOOL)hasDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)hash;
- (unsigned)count;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiAwdlStateInfo

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAwdlStateInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiAwdlStateInfo description](&v3, sel_description), -[AWDWifiAwdlStateInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_count] forKey:@"count"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiAwdlStateInfoReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteUint64Field();
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
    *((void *)a3 + 1) = self->_duration;
    *((unsigned char *)a3 + 20) |= 1u;
    return;
  }
  *((_DWORD *)a3 + 4) = self->_count;
  *((unsigned char *)a3 + 20) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_count;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = self->_duration;
    *((unsigned char *)result + 20) |= 1u;
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
      if ((*((unsigned char *)a3 + 20) & 2) == 0 || self->_count != *((_DWORD *)a3 + 4)) {
        goto LABEL_11;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 2) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
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
    uint64_t v2 = 2654435761 * self->_count;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_duration;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 20) & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 20) & 1) == 0) {
      return;
    }
LABEL_5:
    self->_duration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
  self->_count = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 20)) {
    goto LABEL_5;
  }
}

- (unsigned)count
{
  return self->_count;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end