@interface AWDWAPeerDiscoveryInfo
- (BOOL)hasIOSPeers;
- (BOOL)hasMacOSPeers;
- (BOOL)hasNumPeersDiscovered;
- (BOOL)hasTvOSPeers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)iOSPeers;
- (unsigned)macOSPeers;
- (unsigned)numPeersDiscovered;
- (unsigned)tvOSPeers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIOSPeers:(BOOL)a3;
- (void)setHasMacOSPeers:(BOOL)a3;
- (void)setHasNumPeersDiscovered:(BOOL)a3;
- (void)setHasTvOSPeers:(BOOL)a3;
- (void)setIOSPeers:(unsigned int)a3;
- (void)setMacOSPeers:(unsigned int)a3;
- (void)setNumPeersDiscovered:(unsigned int)a3;
- (void)setTvOSPeers:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWAPeerDiscoveryInfo

- (void)setNumPeersDiscovered:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numPeersDiscovered = a3;
}

- (void)setHasNumPeersDiscovered:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumPeersDiscovered
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIOSPeers:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iOSPeers = a3;
}

- (void)setHasIOSPeers:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIOSPeers
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTvOSPeers:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tvOSPeers = a3;
}

- (void)setHasTvOSPeers:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTvOSPeers
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMacOSPeers:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_macOSPeers = a3;
}

- (void)setHasMacOSPeers:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMacOSPeers
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWAPeerDiscoveryInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWAPeerDiscoveryInfo description](&v3, sel_description), -[AWDWAPeerDiscoveryInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numPeersDiscovered] forKey:@"numPeersDiscovered"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tvOSPeers] forKey:@"tvOSPeers"];
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_iOSPeers] forKey:@"iOSPeers"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_macOSPeers] forKey:@"macOSPeers"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWAPeerDiscoveryInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 2) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_numPeersDiscovered;
    *((unsigned char *)a3 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 2) = self->_iOSPeers;
  *((unsigned char *)a3 + 24) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return;
    }
LABEL_9:
    *((_DWORD *)a3 + 3) = self->_macOSPeers;
    *((unsigned char *)a3 + 24) |= 2u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 5) = self->_tvOSPeers;
  *((unsigned char *)a3 + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_numPeersDiscovered;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_iOSPeers;
  *((unsigned char *)result + 24) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_tvOSPeers;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 3) = self->_macOSPeers;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 4) == 0 || self->_numPeersDiscovered != *((_DWORD *)a3 + 4)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 4) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_iOSPeers != *((_DWORD *)a3 + 2)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 8) == 0 || self->_tvOSPeers != *((_DWORD *)a3 + 5)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 8) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_macOSPeers != *((_DWORD *)a3 + 3)) {
        goto LABEL_21;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_numPeersDiscovered;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_iOSPeers;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_tvOSPeers;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_macOSPeers;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 24);
  if ((v3 & 4) != 0)
  {
    self->_numPeersDiscovered = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_iOSPeers = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 24);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_9:
    self->_macOSPeers = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_8:
  self->_tvOSPeers = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 24) & 2) != 0) {
    goto LABEL_9;
  }
}

- (unsigned)numPeersDiscovered
{
  return self->_numPeersDiscovered;
}

- (unsigned)iOSPeers
{
  return self->_iOSPeers;
}

- (unsigned)tvOSPeers
{
  return self->_tvOSPeers;
}

- (unsigned)macOSPeers
{
  return self->_macOSPeers;
}

@end