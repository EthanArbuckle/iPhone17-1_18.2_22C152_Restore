@interface AWDLibnetcoreTCPStatsReport
- (BOOL)hasTcpConnectionAccepts;
- (BOOL)hasTcpConnectionAttempts;
- (BOOL)hasTcpIPv4AvgRTT;
- (BOOL)hasTcpIPv6AvgRTT;
- (BOOL)hasTcpRecvPLR;
- (BOOL)hasTcpSendPLR;
- (BOOL)hasTcpSendReorderRate;
- (BOOL)hasTcpSendTLRTO;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)tcpConnectionAccepts;
- (unint64_t)tcpConnectionAttempts;
- (unint64_t)tcpIPv4AvgRTT;
- (unint64_t)tcpIPv6AvgRTT;
- (unint64_t)tcpRecvPLR;
- (unint64_t)tcpSendPLR;
- (unint64_t)tcpSendReorderRate;
- (unint64_t)tcpSendTLRTO;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTcpConnectionAccepts:(BOOL)a3;
- (void)setHasTcpConnectionAttempts:(BOOL)a3;
- (void)setHasTcpIPv4AvgRTT:(BOOL)a3;
- (void)setHasTcpIPv6AvgRTT:(BOOL)a3;
- (void)setHasTcpRecvPLR:(BOOL)a3;
- (void)setHasTcpSendPLR:(BOOL)a3;
- (void)setHasTcpSendReorderRate:(BOOL)a3;
- (void)setHasTcpSendTLRTO:(BOOL)a3;
- (void)setTcpConnectionAccepts:(unint64_t)a3;
- (void)setTcpConnectionAttempts:(unint64_t)a3;
- (void)setTcpIPv4AvgRTT:(unint64_t)a3;
- (void)setTcpIPv6AvgRTT:(unint64_t)a3;
- (void)setTcpRecvPLR:(unint64_t)a3;
- (void)setTcpSendPLR:(unint64_t)a3;
- (void)setTcpSendReorderRate:(unint64_t)a3;
- (void)setTcpSendTLRTO:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreTCPStatsReport

- (void)setTcpIPv4AvgRTT:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tcpIPv4AvgRTT = a3;
}

- (void)setHasTcpIPv4AvgRTT:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTcpIPv4AvgRTT
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTcpIPv6AvgRTT:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_tcpIPv6AvgRTT = a3;
}

- (void)setHasTcpIPv6AvgRTT:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTcpIPv6AvgRTT
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTcpSendPLR:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_tcpSendPLR = a3;
}

- (void)setHasTcpSendPLR:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTcpSendPLR
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTcpRecvPLR:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_tcpRecvPLR = a3;
}

- (void)setHasTcpRecvPLR:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTcpRecvPLR
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTcpSendTLRTO:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_tcpSendTLRTO = a3;
}

- (void)setHasTcpSendTLRTO:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasTcpSendTLRTO
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTcpSendReorderRate:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_tcpSendReorderRate = a3;
}

- (void)setHasTcpSendReorderRate:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTcpSendReorderRate
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTcpConnectionAttempts:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tcpConnectionAttempts = a3;
}

- (void)setHasTcpConnectionAttempts:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTcpConnectionAttempts
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTcpConnectionAccepts:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tcpConnectionAccepts = a3;
}

- (void)setHasTcpConnectionAccepts:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTcpConnectionAccepts
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPStatsReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreTCPStatsReport description](&v3, sel_description), -[AWDLibnetcoreTCPStatsReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpIPv4AvgRTT] forKey:@"tcpIPv4AvgRTT"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpIPv6AvgRTT] forKey:@"tcpIPv6AvgRTT"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpSendPLR] forKey:@"tcpSendPLR"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpRecvPLR] forKey:@"tcpRecvPLR"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpSendTLRTO] forKey:@"tcpSendTLRTO"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpConnectionAttempts] forKey:@"tcpConnectionAttempts"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpSendReorderRate] forKey:@"tcpSendReorderRate"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if (has) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpConnectionAccepts] forKey:@"tcpConnectionAccepts"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((has & 1) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_tcpIPv4AvgRTT;
    *((unsigned char *)a3 + 72) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_tcpIPv6AvgRTT;
  *((unsigned char *)a3 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)a3 + 6) = self->_tcpSendPLR;
  *((unsigned char *)a3 + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)a3 + 5) = self->_tcpRecvPLR;
  *((unsigned char *)a3 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)a3 + 8) = self->_tcpSendTLRTO;
  *((unsigned char *)a3 + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 7) = self->_tcpSendReorderRate;
  *((unsigned char *)a3 + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      return;
    }
LABEL_17:
    *((void *)a3 + 1) = self->_tcpConnectionAccepts;
    *((unsigned char *)a3 + 72) |= 1u;
    return;
  }
LABEL_16:
  *((void *)a3 + 2) = self->_tcpConnectionAttempts;
  *((unsigned char *)a3 + 72) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_tcpIPv4AvgRTT;
    *((unsigned char *)result + 72) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_tcpIPv6AvgRTT;
  *((unsigned char *)result + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 6) = self->_tcpSendPLR;
  *((unsigned char *)result + 72) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 5) = self->_tcpRecvPLR;
  *((unsigned char *)result + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 8) = self->_tcpSendTLRTO;
  *((unsigned char *)result + 72) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 7) = self->_tcpSendReorderRate;
  *((unsigned char *)result + 72) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((void *)result + 2) = self->_tcpConnectionAttempts;
  *((unsigned char *)result + 72) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_9:
  *((void *)result + 1) = self->_tcpConnectionAccepts;
  *((unsigned char *)result + 72) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_tcpIPv4AvgRTT != *((void *)a3 + 3)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_tcpIPv6AvgRTT != *((void *)a3 + 4)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x20) == 0 || self->_tcpSendPLR != *((void *)a3 + 6)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_tcpRecvPLR != *((void *)a3 + 5)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x80) == 0 || self->_tcpSendTLRTO != *((void *)a3 + 8)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x80) != 0)
    {
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x40) == 0 || self->_tcpSendReorderRate != *((void *)a3 + 7)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_41;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_tcpConnectionAttempts != *((void *)a3 + 2)) {
        goto LABEL_41;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_41;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 72) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_tcpConnectionAccepts != *((void *)a3 + 1)) {
        goto LABEL_41;
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
    unint64_t v2 = 2654435761u * self->_tcpIPv4AvgRTT;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_tcpIPv6AvgRTT;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_tcpSendPLR;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_tcpRecvPLR;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_tcpSendTLRTO;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_tcpSendReorderRate;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v8 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_17:
    unint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_tcpConnectionAttempts;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_tcpConnectionAccepts;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 4) != 0)
  {
    self->_tcpIPv4AvgRTT = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 72);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_tcpIPv6AvgRTT = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_tcpSendPLR = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_tcpRecvPLR = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_tcpSendTLRTO = *((void *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_tcpSendReorderRate = *((void *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 72);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_17:
    self->_tcpConnectionAccepts = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
LABEL_16:
  self->_tcpConnectionAttempts = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 72)) {
    goto LABEL_17;
  }
}

- (unint64_t)tcpIPv4AvgRTT
{
  return self->_tcpIPv4AvgRTT;
}

- (unint64_t)tcpIPv6AvgRTT
{
  return self->_tcpIPv6AvgRTT;
}

- (unint64_t)tcpSendPLR
{
  return self->_tcpSendPLR;
}

- (unint64_t)tcpRecvPLR
{
  return self->_tcpRecvPLR;
}

- (unint64_t)tcpSendTLRTO
{
  return self->_tcpSendTLRTO;
}

- (unint64_t)tcpSendReorderRate
{
  return self->_tcpSendReorderRate;
}

- (unint64_t)tcpConnectionAttempts
{
  return self->_tcpConnectionAttempts;
}

- (unint64_t)tcpConnectionAccepts
{
  return self->_tcpConnectionAccepts;
}

@end