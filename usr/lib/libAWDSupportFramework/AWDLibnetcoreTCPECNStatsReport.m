@interface AWDLibnetcoreTCPECNStatsReport
- (BOOL)hasTcpECNClientNegotiationEnabled;
- (BOOL)hasTcpECNClientSetup;
- (BOOL)hasTcpECNClientSuccess;
- (BOOL)hasTcpECNConnNoPacketLossCE;
- (BOOL)hasTcpECNConnPacketLossCE;
- (BOOL)hasTcpECNConnPacketLossNoCE;
- (BOOL)hasTcpECNConnRecvCE;
- (BOOL)hasTcpECNConnRecvECE;
- (BOOL)hasTcpECNFallbackCE;
- (BOOL)hasTcpECNFallbackReorder;
- (BOOL)hasTcpECNFallbackSynLoss;
- (BOOL)hasTcpECNNotSupportedPeer;
- (BOOL)hasTcpECNRecvCE;
- (BOOL)hasTcpECNRecvECE;
- (BOOL)hasTcpECNSentECE;
- (BOOL)hasTcpECNServerNegotiationEnabled;
- (BOOL)hasTcpECNServerSetup;
- (BOOL)hasTcpECNServerSuccess;
- (BOOL)hasTcpECNSynAckLost;
- (BOOL)hasTcpECNSynLost;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)tcpECNClientNegotiationEnabled;
- (BOOL)tcpECNServerNegotiationEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)tcpECNClientSetup;
- (unint64_t)tcpECNClientSuccess;
- (unint64_t)tcpECNConnNoPacketLossCE;
- (unint64_t)tcpECNConnPacketLossCE;
- (unint64_t)tcpECNConnPacketLossNoCE;
- (unint64_t)tcpECNConnRecvCE;
- (unint64_t)tcpECNConnRecvECE;
- (unint64_t)tcpECNFallbackCE;
- (unint64_t)tcpECNFallbackReorder;
- (unint64_t)tcpECNFallbackSynLoss;
- (unint64_t)tcpECNNotSupportedPeer;
- (unint64_t)tcpECNRecvCE;
- (unint64_t)tcpECNRecvECE;
- (unint64_t)tcpECNSentECE;
- (unint64_t)tcpECNServerSetup;
- (unint64_t)tcpECNServerSuccess;
- (unint64_t)tcpECNSynAckLost;
- (unint64_t)tcpECNSynLost;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTcpECNClientNegotiationEnabled:(BOOL)a3;
- (void)setHasTcpECNClientSetup:(BOOL)a3;
- (void)setHasTcpECNClientSuccess:(BOOL)a3;
- (void)setHasTcpECNConnNoPacketLossCE:(BOOL)a3;
- (void)setHasTcpECNConnPacketLossCE:(BOOL)a3;
- (void)setHasTcpECNConnPacketLossNoCE:(BOOL)a3;
- (void)setHasTcpECNConnRecvCE:(BOOL)a3;
- (void)setHasTcpECNConnRecvECE:(BOOL)a3;
- (void)setHasTcpECNFallbackCE:(BOOL)a3;
- (void)setHasTcpECNFallbackReorder:(BOOL)a3;
- (void)setHasTcpECNFallbackSynLoss:(BOOL)a3;
- (void)setHasTcpECNNotSupportedPeer:(BOOL)a3;
- (void)setHasTcpECNRecvCE:(BOOL)a3;
- (void)setHasTcpECNRecvECE:(BOOL)a3;
- (void)setHasTcpECNSentECE:(BOOL)a3;
- (void)setHasTcpECNServerNegotiationEnabled:(BOOL)a3;
- (void)setHasTcpECNServerSetup:(BOOL)a3;
- (void)setHasTcpECNServerSuccess:(BOOL)a3;
- (void)setHasTcpECNSynAckLost:(BOOL)a3;
- (void)setHasTcpECNSynLost:(BOOL)a3;
- (void)setTcpECNClientNegotiationEnabled:(BOOL)a3;
- (void)setTcpECNClientSetup:(unint64_t)a3;
- (void)setTcpECNClientSuccess:(unint64_t)a3;
- (void)setTcpECNConnNoPacketLossCE:(unint64_t)a3;
- (void)setTcpECNConnPacketLossCE:(unint64_t)a3;
- (void)setTcpECNConnPacketLossNoCE:(unint64_t)a3;
- (void)setTcpECNConnRecvCE:(unint64_t)a3;
- (void)setTcpECNConnRecvECE:(unint64_t)a3;
- (void)setTcpECNFallbackCE:(unint64_t)a3;
- (void)setTcpECNFallbackReorder:(unint64_t)a3;
- (void)setTcpECNFallbackSynLoss:(unint64_t)a3;
- (void)setTcpECNNotSupportedPeer:(unint64_t)a3;
- (void)setTcpECNRecvCE:(unint64_t)a3;
- (void)setTcpECNRecvECE:(unint64_t)a3;
- (void)setTcpECNSentECE:(unint64_t)a3;
- (void)setTcpECNServerNegotiationEnabled:(BOOL)a3;
- (void)setTcpECNServerSetup:(unint64_t)a3;
- (void)setTcpECNServerSuccess:(unint64_t)a3;
- (void)setTcpECNSynAckLost:(unint64_t)a3;
- (void)setTcpECNSynLost:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreTCPECNStatsReport

- (void)setTcpECNClientNegotiationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_tcpECNClientNegotiationEnabled = a3;
}

- (void)setHasTcpECNClientNegotiationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTcpECNClientNegotiationEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTcpECNServerNegotiationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_tcpECNServerNegotiationEnabled = a3;
}

- (void)setHasTcpECNServerNegotiationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTcpECNServerNegotiationEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTcpECNClientSetup:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_tcpECNClientSetup = a3;
}

- (void)setHasTcpECNClientSetup:(BOOL)a3
{
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTcpECNClientSetup
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTcpECNServerSetup:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_tcpECNServerSetup = a3;
}

- (void)setHasTcpECNServerSetup:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTcpECNServerSetup
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTcpECNClientSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_tcpECNClientSuccess = a3;
}

- (void)setHasTcpECNClientSuccess:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTcpECNClientSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTcpECNServerSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_tcpECNServerSuccess = a3;
}

- (void)setHasTcpECNServerSuccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTcpECNServerSuccess
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTcpECNNotSupportedPeer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_tcpECNNotSupportedPeer = a3;
}

- (void)setHasTcpECNNotSupportedPeer:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTcpECNNotSupportedPeer
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTcpECNSynLost:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tcpECNSynLost = a3;
}

- (void)setHasTcpECNSynLost:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTcpECNSynLost
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTcpECNSynAckLost:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tcpECNSynAckLost = a3;
}

- (void)setHasTcpECNSynAckLost:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTcpECNSynAckLost
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setTcpECNRecvCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_tcpECNRecvCE = a3;
}

- (void)setHasTcpECNRecvCE:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTcpECNRecvCE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTcpECNRecvECE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_tcpECNRecvECE = a3;
}

- (void)setHasTcpECNRecvECE:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTcpECNRecvECE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTcpECNSentECE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_tcpECNSentECE = a3;
}

- (void)setHasTcpECNSentECE:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTcpECNSentECE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTcpECNConnRecvCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_tcpECNConnRecvCE = a3;
}

- (void)setHasTcpECNConnRecvCE:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTcpECNConnRecvCE
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTcpECNConnRecvECE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_tcpECNConnRecvECE = a3;
}

- (void)setHasTcpECNConnRecvECE:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTcpECNConnRecvECE
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTcpECNConnPacketLossNoCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_tcpECNConnPacketLossNoCE = a3;
}

- (void)setHasTcpECNConnPacketLossNoCE:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTcpECNConnPacketLossNoCE
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTcpECNConnPacketLossCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_tcpECNConnPacketLossCE = a3;
}

- (void)setHasTcpECNConnPacketLossCE:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTcpECNConnPacketLossCE
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTcpECNConnNoPacketLossCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_tcpECNConnNoPacketLossCE = a3;
}

- (void)setHasTcpECNConnNoPacketLossCE:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTcpECNConnNoPacketLossCE
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTcpECNFallbackSynLoss:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_tcpECNFallbackSynLoss = a3;
}

- (void)setHasTcpECNFallbackSynLoss:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTcpECNFallbackSynLoss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTcpECNFallbackReorder:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_tcpECNFallbackReorder = a3;
}

- (void)setHasTcpECNFallbackReorder:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTcpECNFallbackReorder
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setTcpECNFallbackCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_tcpECNFallbackCE = a3;
}

- (void)setHasTcpECNFallbackCE:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTcpECNFallbackCE
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPECNStatsReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreTCPECNStatsReport description](&v3, sel_description), -[AWDLibnetcoreTCPECNStatsReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_tcpECNClientNegotiationEnabled] forKey:@"tcpECNClientNegotiationEnabled"];
    $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_tcpECNServerNegotiationEnabled] forKey:@"tcpECNServerNegotiationEnabled"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNClientSetup] forKey:@"tcpECNClientSetup"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNServerSetup] forKey:@"tcpECNServerSetup"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNClientSuccess] forKey:@"tcpECNClientSuccess"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNServerSuccess] forKey:@"tcpECNServerSuccess"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNNotSupportedPeer] forKey:@"tcpECNNotSupportedPeer"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNSynLost] forKey:@"tcpECNSynLost"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNSynAckLost] forKey:@"tcpECNSynAckLost"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNRecvCE] forKey:@"tcpECNRecvCE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNRecvECE] forKey:@"tcpECNRecvECE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNSentECE] forKey:@"tcpECNSentECE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNConnRecvCE] forKey:@"tcpECNConnRecvCE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNConnRecvECE] forKey:@"tcpECNConnRecvECE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNConnPacketLossNoCE] forKey:@"tcpECNConnPacketLossNoCE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNConnPacketLossCE] forKey:@"tcpECNConnPacketLossCE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNConnNoPacketLossCE] forKey:@"tcpECNConnNoPacketLossCE"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
LABEL_41:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNFallbackReorder] forKey:@"tcpECNFallbackReorder"];
    if ((*(_DWORD *)&self->_has & 0x80) == 0) {
      return v3;
    }
    goto LABEL_21;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNFallbackSynLoss] forKey:@"tcpECNFallbackSynLoss"];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0) {
    goto LABEL_41;
  }
LABEL_20:
  if ((*(unsigned char *)&has & 0x80) != 0) {
LABEL_21:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNFallbackCE] forKey:@"tcpECNFallbackCE"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPECNStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
LABEL_40:
    PBDataWriterWriteUint64Field();
    if ((*(_DWORD *)&self->_has & 0x80) == 0) {
      return;
    }
    goto LABEL_41;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0) {
    goto LABEL_40;
  }
LABEL_20:
  if ((*(unsigned char *)&has & 0x80) == 0) {
    return;
  }
LABEL_41:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((unsigned char *)a3 + 152) = self->_tcpECNClientNegotiationEnabled;
    *((_DWORD *)a3 + 39) |= 0x40000u;
    $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 153) = self->_tcpECNServerNegotiationEnabled;
  *((_DWORD *)a3 + 39) |= 0x80000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 1) = self->_tcpECNClientSetup;
  *((_DWORD *)a3 + 39) |= 1u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)a3 + 15) = self->_tcpECNServerSetup;
  *((_DWORD *)a3 + 39) |= 0x4000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)a3 + 2) = self->_tcpECNClientSuccess;
  *((_DWORD *)a3 + 39) |= 2u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 16) = self->_tcpECNServerSuccess;
  *((_DWORD *)a3 + 39) |= 0x8000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)a3 + 11) = self->_tcpECNNotSupportedPeer;
  *((_DWORD *)a3 + 39) |= 0x400u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 18) = self->_tcpECNSynLost;
  *((_DWORD *)a3 + 39) |= 0x20000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)a3 + 17) = self->_tcpECNSynAckLost;
  *((_DWORD *)a3 + 39) |= 0x10000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)a3 + 12) = self->_tcpECNRecvCE;
  *((_DWORD *)a3 + 39) |= 0x800u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)a3 + 13) = self->_tcpECNRecvECE;
  *((_DWORD *)a3 + 39) |= 0x1000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)a3 + 14) = self->_tcpECNSentECE;
  *((_DWORD *)a3 + 39) |= 0x2000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)a3 + 6) = self->_tcpECNConnRecvCE;
  *((_DWORD *)a3 + 39) |= 0x20u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 7) = self->_tcpECNConnRecvECE;
  *((_DWORD *)a3 + 39) |= 0x40u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)a3 + 5) = self->_tcpECNConnPacketLossNoCE;
  *((_DWORD *)a3 + 39) |= 0x10u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)a3 + 4) = self->_tcpECNConnPacketLossCE;
  *((_DWORD *)a3 + 39) |= 8u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 3) = self->_tcpECNConnNoPacketLossCE;
  *((_DWORD *)a3 + 39) |= 4u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 10) = self->_tcpECNFallbackSynLoss;
  *((_DWORD *)a3 + 39) |= 0x200u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      return;
    }
LABEL_41:
    *((void *)a3 + 8) = self->_tcpECNFallbackCE;
    *((_DWORD *)a3 + 39) |= 0x80u;
    return;
  }
LABEL_40:
  *((void *)a3 + 9) = self->_tcpECNFallbackReorder;
  *((_DWORD *)a3 + 39) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
    goto LABEL_41;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((unsigned char *)result + 152) = self->_tcpECNClientNegotiationEnabled;
    *((_DWORD *)result + 39) |= 0x40000u;
    $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 153) = self->_tcpECNServerNegotiationEnabled;
  *((_DWORD *)result + 39) |= 0x80000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 1) = self->_tcpECNClientSetup;
  *((_DWORD *)result + 39) |= 1u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 15) = self->_tcpECNServerSetup;
  *((_DWORD *)result + 39) |= 0x4000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 2) = self->_tcpECNClientSuccess;
  *((_DWORD *)result + 39) |= 2u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 16) = self->_tcpECNServerSuccess;
  *((_DWORD *)result + 39) |= 0x8000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 11) = self->_tcpECNNotSupportedPeer;
  *((_DWORD *)result + 39) |= 0x400u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 18) = self->_tcpECNSynLost;
  *((_DWORD *)result + 39) |= 0x20000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)result + 17) = self->_tcpECNSynAckLost;
  *((_DWORD *)result + 39) |= 0x10000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)result + 12) = self->_tcpECNRecvCE;
  *((_DWORD *)result + 39) |= 0x800u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)result + 13) = self->_tcpECNRecvECE;
  *((_DWORD *)result + 39) |= 0x1000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 14) = self->_tcpECNSentECE;
  *((_DWORD *)result + 39) |= 0x2000u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 6) = self->_tcpECNConnRecvCE;
  *((_DWORD *)result + 39) |= 0x20u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 7) = self->_tcpECNConnRecvECE;
  *((_DWORD *)result + 39) |= 0x40u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 5) = self->_tcpECNConnPacketLossNoCE;
  *((_DWORD *)result + 39) |= 0x10u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 4) = self->_tcpECNConnPacketLossCE;
  *((_DWORD *)result + 39) |= 8u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 3) = self->_tcpECNConnNoPacketLossCE;
  *((_DWORD *)result + 39) |= 4u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 10) = self->_tcpECNFallbackSynLoss;
  *((_DWORD *)result + 39) |= 0x200u;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      return result;
    }
    goto LABEL_21;
  }
LABEL_41:
  *((void *)result + 9) = self->_tcpECNFallbackReorder;
  *((_DWORD *)result + 39) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_21:
  *((void *)result + 8) = self->_tcpECNFallbackCE;
  *((_DWORD *)result + 39) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  int v7 = *((_DWORD *)a3 + 39);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0) {
      goto LABEL_107;
    }
    if (self->_tcpECNClientNegotiationEnabled)
    {
      if (!*((unsigned char *)a3 + 152)) {
        goto LABEL_107;
      }
    }
    else if (*((unsigned char *)a3 + 152))
    {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    if ((v7 & 0x80000) != 0) {
      goto LABEL_107;
    }
    goto LABEL_18;
  }
  if ((v7 & 0x80000) == 0) {
    goto LABEL_107;
  }
  if (self->_tcpECNServerNegotiationEnabled)
  {
    if (!*((unsigned char *)a3 + 153)) {
      goto LABEL_107;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)a3 + 153))
  {
LABEL_107:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_tcpECNClientSetup != *((void *)a3 + 1)) {
      goto LABEL_107;
    }
  }
  else if (v7)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_tcpECNServerSetup != *((void *)a3 + 15)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_tcpECNClientSuccess != *((void *)a3 + 2)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_tcpECNServerSuccess != *((void *)a3 + 16)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_tcpECNNotSupportedPeer != *((void *)a3 + 11)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_tcpECNSynLost != *((void *)a3 + 18)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_tcpECNSynAckLost != *((void *)a3 + 17)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_tcpECNRecvCE != *((void *)a3 + 12)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_tcpECNRecvECE != *((void *)a3 + 13)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_tcpECNSentECE != *((void *)a3 + 14)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_tcpECNConnRecvCE != *((void *)a3 + 6)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tcpECNConnRecvECE != *((void *)a3 + 7)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_tcpECNConnPacketLossNoCE != *((void *)a3 + 5)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_tcpECNConnPacketLossCE != *((void *)a3 + 4)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_107;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_tcpECNConnNoPacketLossCE != *((void *)a3 + 3)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_tcpECNFallbackSynLoss != *((void *)a3 + 10)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_tcpECNFallbackReorder != *((void *)a3 + 9)) {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_107;
  }
  LOBYTE(v5) = (*((_DWORD *)a3 + 39) & 0x80) == 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_tcpECNFallbackCE != *((void *)a3 + 8)) {
      goto LABEL_107;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $3B6FF8093550D50F91F32B5E1EBCBE87 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v3 = 2654435761 * self->_tcpECNClientNegotiationEnabled;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_tcpECNServerNegotiationEnabled;
      if (*(unsigned char *)&has) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_tcpECNClientSetup;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_tcpECNServerSetup;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_tcpECNClientSuccess;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_tcpECNServerSuccess;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_tcpECNNotSupportedPeer;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_tcpECNSynLost;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_tcpECNSynAckLost;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_tcpECNRecvCE;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_tcpECNRecvECE;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    unint64_t v14 = 2654435761u * self->_tcpECNSentECE;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v14 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_14:
    unint64_t v15 = 2654435761u * self->_tcpECNConnRecvCE;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v15 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_15:
    unint64_t v16 = 2654435761u * self->_tcpECNConnRecvECE;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v16 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_16:
    unint64_t v17 = 2654435761u * self->_tcpECNConnPacketLossNoCE;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v17 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_17:
    unint64_t v18 = 2654435761u * self->_tcpECNConnPacketLossCE;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v18 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_18:
    unint64_t v19 = 2654435761u * self->_tcpECNConnNoPacketLossCE;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_19:
    unint64_t v20 = 2654435761u * self->_tcpECNFallbackSynLoss;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_20;
    }
LABEL_40:
    unint64_t v21 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_21;
    }
LABEL_41:
    unint64_t v22 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_39:
  unint64_t v20 = 0;
  if ((*(_WORD *)&has & 0x100) == 0) {
    goto LABEL_40;
  }
LABEL_20:
  unint64_t v21 = 2654435761u * self->_tcpECNFallbackReorder;
  if ((*(unsigned char *)&has & 0x80) == 0) {
    goto LABEL_41;
  }
LABEL_21:
  unint64_t v22 = 2654435761u * self->_tcpECNFallbackCE;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x40000) != 0)
  {
    self->_tcpECNClientNegotiationEnabled = *((unsigned char *)a3 + 152);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v3 = *((_DWORD *)a3 + 39);
    if ((v3 & 0x80000) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v3 & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  self->_tcpECNServerNegotiationEnabled = *((unsigned char *)a3 + 153);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_tcpECNClientSetup = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x4000) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_tcpECNServerSetup = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_tcpECNClientSuccess = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x8000) == 0)
  {
LABEL_7:
    if ((v3 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_tcpECNServerSuccess = *((void *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x400) == 0)
  {
LABEL_8:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_tcpECNNotSupportedPeer = *((void *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x20000) == 0)
  {
LABEL_9:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_tcpECNSynLost = *((void *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x10000) == 0)
  {
LABEL_10:
    if ((v3 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_tcpECNSynAckLost = *((void *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x800) == 0)
  {
LABEL_11:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_tcpECNRecvCE = *((void *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x1000) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_tcpECNRecvECE = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x2000) == 0)
  {
LABEL_13:
    if ((v3 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_tcpECNSentECE = *((void *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x20) == 0)
  {
LABEL_14:
    if ((v3 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_tcpECNConnRecvCE = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x40) == 0)
  {
LABEL_15:
    if ((v3 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_tcpECNConnRecvECE = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x10) == 0)
  {
LABEL_16:
    if ((v3 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_tcpECNConnPacketLossNoCE = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 8) == 0)
  {
LABEL_17:
    if ((v3 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_tcpECNConnPacketLossCE = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 4) == 0)
  {
LABEL_18:
    if ((v3 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_tcpECNConnNoPacketLossCE = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x200) == 0)
  {
LABEL_19:
    if ((v3 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_tcpECNFallbackSynLoss = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x100) == 0)
  {
LABEL_20:
    if ((v3 & 0x80) == 0) {
      return;
    }
LABEL_41:
    self->_tcpECNFallbackCE = *((void *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    return;
  }
LABEL_40:
  self->_tcpECNFallbackReorder = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)a3 + 39) & 0x80) != 0) {
    goto LABEL_41;
  }
}

- (BOOL)tcpECNClientNegotiationEnabled
{
  return self->_tcpECNClientNegotiationEnabled;
}

- (BOOL)tcpECNServerNegotiationEnabled
{
  return self->_tcpECNServerNegotiationEnabled;
}

- (unint64_t)tcpECNClientSetup
{
  return self->_tcpECNClientSetup;
}

- (unint64_t)tcpECNServerSetup
{
  return self->_tcpECNServerSetup;
}

- (unint64_t)tcpECNClientSuccess
{
  return self->_tcpECNClientSuccess;
}

- (unint64_t)tcpECNServerSuccess
{
  return self->_tcpECNServerSuccess;
}

- (unint64_t)tcpECNNotSupportedPeer
{
  return self->_tcpECNNotSupportedPeer;
}

- (unint64_t)tcpECNSynLost
{
  return self->_tcpECNSynLost;
}

- (unint64_t)tcpECNSynAckLost
{
  return self->_tcpECNSynAckLost;
}

- (unint64_t)tcpECNRecvCE
{
  return self->_tcpECNRecvCE;
}

- (unint64_t)tcpECNRecvECE
{
  return self->_tcpECNRecvECE;
}

- (unint64_t)tcpECNSentECE
{
  return self->_tcpECNSentECE;
}

- (unint64_t)tcpECNConnRecvCE
{
  return self->_tcpECNConnRecvCE;
}

- (unint64_t)tcpECNConnRecvECE
{
  return self->_tcpECNConnRecvECE;
}

- (unint64_t)tcpECNConnPacketLossNoCE
{
  return self->_tcpECNConnPacketLossNoCE;
}

- (unint64_t)tcpECNConnPacketLossCE
{
  return self->_tcpECNConnPacketLossCE;
}

- (unint64_t)tcpECNConnNoPacketLossCE
{
  return self->_tcpECNConnNoPacketLossCE;
}

- (unint64_t)tcpECNFallbackSynLoss
{
  return self->_tcpECNFallbackSynLoss;
}

- (unint64_t)tcpECNFallbackReorder
{
  return self->_tcpECNFallbackReorder;
}

- (unint64_t)tcpECNFallbackCE
{
  return self->_tcpECNFallbackCE;
}

@end