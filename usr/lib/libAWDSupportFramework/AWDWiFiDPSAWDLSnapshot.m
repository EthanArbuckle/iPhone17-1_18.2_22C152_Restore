@interface AWDWiFiDPSAWDLSnapshot
- (BOOL)hasDuration;
- (BOOL)hasSdb;
- (BOOL)hasTs;
- (BOOL)hasUse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)ts;
- (unsigned)duration;
- (unsigned)sdb;
- (unsigned)use;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasSdb:(BOOL)a3;
- (void)setHasTs:(BOOL)a3;
- (void)setHasUse:(BOOL)a3;
- (void)setSdb:(unsigned int)a3;
- (void)setTs:(unint64_t)a3;
- (void)setUse:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiDPSAWDLSnapshot

- (void)setTs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ts = a3;
}

- (void)setHasTs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUse:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_use = a3;
}

- (void)setHasUse:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUse
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSdb:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sdb = a3;
}

- (void)setHasSdb:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSdb
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSAWDLSnapshot;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiDPSAWDLSnapshot description](&v3, sel_description), -[AWDWiFiDPSAWDLSnapshot dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ts] forKey:@"ts"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_use] forKey:@"use"];
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_duration] forKey:@"duration"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sdb] forKey:@"sdb"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSAWDLSnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 4) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_ts;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_duration;
  *((unsigned char *)a3 + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      return;
    }
LABEL_9:
    *((_DWORD *)a3 + 5) = self->_sdb;
    *((unsigned char *)a3 + 28) |= 4u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 6) = self->_use;
  *((unsigned char *)a3 + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_ts;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_duration;
  *((unsigned char *)result + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_use;
  *((unsigned char *)result + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 5) = self->_sdb;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_ts != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_duration != *((_DWORD *)a3 + 4)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_use != *((_DWORD *)a3 + 6)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_sdb != *((_DWORD *)a3 + 5)) {
        goto LABEL_21;
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
    unint64_t v2 = 2654435761u * self->_ts;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_duration;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_use;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_sdb;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_ts = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_9:
    self->_sdb = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
    return;
  }
LABEL_8:
  self->_use = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 28) & 4) != 0) {
    goto LABEL_9;
  }
}

- (unint64_t)ts
{
  return self->_ts;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)use
{
  return self->_use;
}

- (unsigned)sdb
{
  return self->_sdb;
}

@end