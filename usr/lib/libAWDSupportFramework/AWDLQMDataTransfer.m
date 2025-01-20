@interface AWDLQMDataTransfer
- (BOOL)hasBundleName;
- (BOOL)hasLQM;
- (BOOL)hasRxBytes;
- (BOOL)hasStateDuration;
- (BOOL)hasTxBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lQMAsString:(int)a3;
- (int)StringAsLQM:(id)a3;
- (int)lQM;
- (unint64_t)hash;
- (unsigned)rxBytes;
- (unsigned)stateDuration;
- (unsigned)txBytes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setHasLQM:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasStateDuration:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setLQM:(int)a3;
- (void)setRxBytes:(unsigned int)a3;
- (void)setStateDuration:(unsigned int)a3;
- (void)setTxBytes:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLQMDataTransfer

- (void)dealloc
{
  [(AWDLQMDataTransfer *)self setBundleName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDLQMDataTransfer;
  [(AWDLQMDataTransfer *)&v3 dealloc];
}

- (BOOL)hasBundleName
{
  return self->_bundleName != 0;
}

- (int)lQM
{
  if (*(unsigned char *)&self->_has) {
    return self->_lQM;
  }
  else {
    return 0;
  }
}

- (void)setLQM:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lQM = a3;
}

- (void)setHasLQM:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLQM
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)lQMAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9C20[a3];
  }
}

- (int)StringAsLQM:(id)a3
{
  if ([a3 isEqualToString:@"LQM_TYPE_UNKNOWN"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"LQM_TYPE_GOOD"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"LQM_TYPE_BAD"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"LQM_TYPE_POOR"]) {
    return 3;
  }
  return 0;
}

- (void)setTxBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTxBytes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRxBytes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRxBytes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStateDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_stateDuration = a3;
}

- (void)setHasStateDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStateDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLQMDataTransfer;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLQMDataTransfer description](&v3, sel_description), -[AWDLQMDataTransfer dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  bundleName = self->_bundleName;
  if (bundleName) {
    [v3 setObject:bundleName forKey:@"bundleName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t lQM = self->_lQM;
    if (lQM >= 4) {
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_lQM];
    }
    else {
      v8 = off_2641B9C20[lQM];
    }
    [v4 setObject:v8 forKey:@"LQM"];
    char has = (char)self->_has;
  }
  if ((has & 8) == 0)
  {
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_rxBytes] forKey:@"RxBytes"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v4;
    }
    goto LABEL_11;
  }
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_txBytes] forKey:@"TxBytes"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((has & 4) != 0) {
LABEL_11:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_stateDuration] forKey:@"stateDuration"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLQMDataTransferReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bundleName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
LABEL_10:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if ((has & 4) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_bundleName) {
    [a3 setBundleName:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 4) = self->_lQM;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 7) = self->_txBytes;
  *((unsigned char *)a3 + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  *((_DWORD *)a3 + 5) = self->_rxBytes;
  *((unsigned char *)a3 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_7:
  *((_DWORD *)a3 + 6) = self->_stateDuration;
  *((unsigned char *)a3 + 32) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 8) = [(NSString *)self->_bundleName copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_lQM;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_rxBytes;
      *(unsigned char *)(v5 + 32) |= 2u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_txBytes;
  *(unsigned char *)(v5 + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_stateDuration;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    bundleName = self->_bundleName;
    if (!((unint64_t)bundleName | *((void *)a3 + 1))
      || (int v5 = -[NSString isEqual:](bundleName, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_lQM != *((_DWORD *)a3 + 4)) {
          goto LABEL_23;
        }
      }
      else if (*((unsigned char *)a3 + 32))
      {
LABEL_23:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 32) & 8) == 0 || self->_txBytes != *((_DWORD *)a3 + 7)) {
          goto LABEL_23;
        }
      }
      else if ((*((unsigned char *)a3 + 32) & 8) != 0)
      {
        goto LABEL_23;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_rxBytes != *((_DWORD *)a3 + 5)) {
          goto LABEL_23;
        }
      }
      else if ((*((unsigned char *)a3 + 32) & 2) != 0)
      {
        goto LABEL_23;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 4) == 0;
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_stateDuration != *((_DWORD *)a3 + 6)) {
          goto LABEL_23;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleName hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_lQM;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_txBytes;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_rxBytes;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_stateDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[AWDLQMDataTransfer setBundleName:](self, "setBundleName:");
  }
  char v5 = *((unsigned char *)a3 + 32);
  if (v5)
  {
    self->_uint64_t lQM = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_txBytes = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  self->_rxBytes = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 32) & 4) == 0) {
    return;
  }
LABEL_7:
  self->_stateDuration = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (unsigned)txBytes
{
  return self->_txBytes;
}

- (unsigned)rxBytes
{
  return self->_rxBytes;
}

- (unsigned)stateDuration
{
  return self->_stateDuration;
}

@end