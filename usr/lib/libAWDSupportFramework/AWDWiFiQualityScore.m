@interface AWDWiFiQualityScore
- (BOOL)hasChannelQuality;
- (BOOL)hasRxLatency;
- (BOOL)hasRxLoss;
- (BOOL)hasTxLatency;
- (BOOL)hasTxLoss;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)channelQuality;
- (unsigned)rxLatency;
- (unsigned)rxLoss;
- (unsigned)txLatency;
- (unsigned)txLoss;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelQuality:(unsigned int)a3;
- (void)setHasChannelQuality:(BOOL)a3;
- (void)setHasRxLatency:(BOOL)a3;
- (void)setHasRxLoss:(BOOL)a3;
- (void)setHasTxLatency:(BOOL)a3;
- (void)setHasTxLoss:(BOOL)a3;
- (void)setRxLatency:(unsigned int)a3;
- (void)setRxLoss:(unsigned int)a3;
- (void)setTxLatency:(unsigned int)a3;
- (void)setTxLoss:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiQualityScore

- (void)setChannelQuality:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelQuality = a3;
}

- (void)setHasChannelQuality:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelQuality
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTxLoss:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_txLoss = a3;
}

- (void)setHasTxLoss:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTxLoss
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRxLoss:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rxLoss = a3;
}

- (void)setHasRxLoss:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRxLoss
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTxLatency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_txLatency = a3;
}

- (void)setHasTxLatency:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTxLatency
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRxLatency:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rxLatency = a3;
}

- (void)setHasRxLatency:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRxLatency
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiQualityScore;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiQualityScore description](&v3, sel_description), -[AWDWiFiQualityScore dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelQuality] forKey:@"channelQuality"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txLoss] forKey:@"txLoss"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txLatency] forKey:@"txLatency"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rxLoss] forKey:@"rxLoss"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rxLatency] forKey:@"rxLatency"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiQualityScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_channelQuality;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_txLoss;
  *((unsigned char *)a3 + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 4) = self->_rxLoss;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return;
    }
LABEL_11:
    *((_DWORD *)a3 + 3) = self->_rxLatency;
    *((unsigned char *)a3 + 28) |= 2u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_txLatency;
  *((unsigned char *)a3 + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_channelQuality;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_txLoss;
  *((unsigned char *)result + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_rxLoss;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_txLatency;
  *((unsigned char *)result + 28) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 3) = self->_rxLatency;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_channelQuality != *((_DWORD *)a3 + 2)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 0x10) == 0 || self->_txLoss != *((_DWORD *)a3 + 6)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 0x10) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_rxLoss != *((_DWORD *)a3 + 4)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_txLatency != *((_DWORD *)a3 + 5)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_rxLatency != *((_DWORD *)a3 + 3)) {
        goto LABEL_26;
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
    uint64_t v2 = 2654435761 * self->_channelQuality;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_txLoss;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_rxLoss;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_txLatency;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_rxLatency;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_channelQuality = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_txLoss = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_rxLoss = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_11:
    self->_rxLatency = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_txLatency = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 28) & 2) != 0) {
    goto LABEL_11;
  }
}

- (unsigned)channelQuality
{
  return self->_channelQuality;
}

- (unsigned)txLoss
{
  return self->_txLoss;
}

- (unsigned)rxLoss
{
  return self->_rxLoss;
}

- (unsigned)txLatency
{
  return self->_txLatency;
}

- (unsigned)rxLatency
{
  return self->_rxLatency;
}

@end