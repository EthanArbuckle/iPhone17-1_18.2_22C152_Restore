@interface AWDWiFiNWActivityAggregateMetrics
- (BOOL)hasKCtlTxCTS;
- (BOOL)hasKCtlTxRTS;
- (BOOL)hasKMACRxControlFrameMatchingRA;
- (BOOL)hasKMACRxControlFrameOtherRA;
- (BOOL)hasKMACRxDataFrameMatchingRA;
- (BOOL)hasKMACRxDataFrameOtherRA;
- (BOOL)hasKMACRxUnicastCTStoMAC;
- (BOOL)hasKMACRxUnicastCTStoOther;
- (BOOL)hasKMACRxUnicastRTStoMAC;
- (BOOL)hasKMACRxUnicastRTStoOther;
- (BOOL)hasKRxBadFCS;
- (BOOL)hasKRxBadPLCP;
- (BOOL)hasKRxCRCGlitch;
- (BOOL)hasKRxDataErrors;
- (BOOL)hasKRxFrames;
- (BOOL)hasKRxGoodPLCP;
- (BOOL)hasKRxRetryBitSet;
- (BOOL)hasKTxFrames;
- (BOOL)hasKTxRetransmission;
- (BOOL)hasKdot11MultipleRetryCount;
- (BOOL)hasKdot11RTSFailureCount;
- (BOOL)hasKdot11RTSSuccessCount;
- (BOOL)hasKdot11RetryCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)kCtlTxCTS;
- (unint64_t)kCtlTxRTS;
- (unint64_t)kMACRxDataFrameMatchingRA;
- (unint64_t)kMACRxDataFrameOtherRA;
- (unint64_t)kMACRxUnicastCTStoMAC;
- (unint64_t)kMACRxUnicastCTStoOther;
- (unint64_t)kMACRxUnicastRTStoMAC;
- (unint64_t)kMACRxUnicastRTStoOther;
- (unint64_t)kRxBadFCS;
- (unint64_t)kRxBadPLCP;
- (unint64_t)kRxCRCGlitch;
- (unint64_t)kRxDataErrors;
- (unint64_t)kRxFrames;
- (unint64_t)kRxGoodPLCP;
- (unint64_t)kRxRetryBitSet;
- (unint64_t)kTxFrames;
- (unint64_t)kTxRetransmission;
- (unint64_t)kdot11MultipleRetryCount;
- (unint64_t)kdot11RTSFailureCount;
- (unint64_t)kdot11RTSSuccessCount;
- (unint64_t)kdot11RetryCount;
- (unsigned)kMACRxControlFrameMatchingRA;
- (unsigned)kMACRxControlFrameOtherRA;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKCtlTxCTS:(BOOL)a3;
- (void)setHasKCtlTxRTS:(BOOL)a3;
- (void)setHasKMACRxControlFrameMatchingRA:(BOOL)a3;
- (void)setHasKMACRxControlFrameOtherRA:(BOOL)a3;
- (void)setHasKMACRxDataFrameMatchingRA:(BOOL)a3;
- (void)setHasKMACRxDataFrameOtherRA:(BOOL)a3;
- (void)setHasKMACRxUnicastCTStoMAC:(BOOL)a3;
- (void)setHasKMACRxUnicastCTStoOther:(BOOL)a3;
- (void)setHasKMACRxUnicastRTStoMAC:(BOOL)a3;
- (void)setHasKMACRxUnicastRTStoOther:(BOOL)a3;
- (void)setHasKRxBadFCS:(BOOL)a3;
- (void)setHasKRxBadPLCP:(BOOL)a3;
- (void)setHasKRxCRCGlitch:(BOOL)a3;
- (void)setHasKRxDataErrors:(BOOL)a3;
- (void)setHasKRxFrames:(BOOL)a3;
- (void)setHasKRxGoodPLCP:(BOOL)a3;
- (void)setHasKRxRetryBitSet:(BOOL)a3;
- (void)setHasKTxFrames:(BOOL)a3;
- (void)setHasKTxRetransmission:(BOOL)a3;
- (void)setHasKdot11MultipleRetryCount:(BOOL)a3;
- (void)setHasKdot11RTSFailureCount:(BOOL)a3;
- (void)setHasKdot11RTSSuccessCount:(BOOL)a3;
- (void)setHasKdot11RetryCount:(BOOL)a3;
- (void)setKCtlTxCTS:(unint64_t)a3;
- (void)setKCtlTxRTS:(unint64_t)a3;
- (void)setKMACRxControlFrameMatchingRA:(unsigned int)a3;
- (void)setKMACRxControlFrameOtherRA:(unsigned int)a3;
- (void)setKMACRxDataFrameMatchingRA:(unint64_t)a3;
- (void)setKMACRxDataFrameOtherRA:(unint64_t)a3;
- (void)setKMACRxUnicastCTStoMAC:(unint64_t)a3;
- (void)setKMACRxUnicastCTStoOther:(unint64_t)a3;
- (void)setKMACRxUnicastRTStoMAC:(unint64_t)a3;
- (void)setKMACRxUnicastRTStoOther:(unint64_t)a3;
- (void)setKRxBadFCS:(unint64_t)a3;
- (void)setKRxBadPLCP:(unint64_t)a3;
- (void)setKRxCRCGlitch:(unint64_t)a3;
- (void)setKRxDataErrors:(unint64_t)a3;
- (void)setKRxFrames:(unint64_t)a3;
- (void)setKRxGoodPLCP:(unint64_t)a3;
- (void)setKRxRetryBitSet:(unint64_t)a3;
- (void)setKTxFrames:(unint64_t)a3;
- (void)setKTxRetransmission:(unint64_t)a3;
- (void)setKdot11MultipleRetryCount:(unint64_t)a3;
- (void)setKdot11RTSFailureCount:(unint64_t)a3;
- (void)setKdot11RTSSuccessCount:(unint64_t)a3;
- (void)setKdot11RetryCount:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityAggregateMetrics

- (void)setKRxDataErrors:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_kRxDataErrors = a3;
}

- (void)setHasKRxDataErrors:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasKRxDataErrors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setKRxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_kRxFrames = a3;
}

- (void)setHasKRxFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasKRxFrames
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setKRxRetryBitSet:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_kRxRetryBitSet = a3;
}

- (void)setHasKRxRetryBitSet:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasKRxRetryBitSet
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setKMACRxDataFrameMatchingRA:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_kMACRxDataFrameMatchingRA = a3;
}

- (void)setHasKMACRxDataFrameMatchingRA:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasKMACRxDataFrameMatchingRA
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setKMACRxDataFrameOtherRA:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_kMACRxDataFrameOtherRA = a3;
}

- (void)setHasKMACRxDataFrameOtherRA:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasKMACRxDataFrameOtherRA
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setKMACRxControlFrameMatchingRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_kMACRxControlFrameMatchingRA = a3;
}

- (void)setHasKMACRxControlFrameMatchingRA:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameMatchingRA
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setKMACRxControlFrameOtherRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_kMACRxControlFrameOtherRA = a3;
}

- (void)setHasKMACRxControlFrameOtherRA:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameOtherRA
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setKRxGoodPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_kRxGoodPLCP = a3;
}

- (void)setHasKRxGoodPLCP:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasKRxGoodPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setKRxBadPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_kRxBadPLCP = a3;
}

- (void)setHasKRxBadPLCP:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasKRxBadPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setKRxBadFCS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_kRxBadFCS = a3;
}

- (void)setHasKRxBadFCS:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasKRxBadFCS
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setKTxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_kTxFrames = a3;
}

- (void)setHasKTxFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasKTxFrames
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setKTxRetransmission:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_kTxRetransmission = a3;
}

- (void)setHasKTxRetransmission:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasKTxRetransmission
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setKdot11RetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_kdot11RetryCount = a3;
}

- (void)setHasKdot11RetryCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasKdot11RetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setKdot11MultipleRetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_kdot11MultipleRetryCount = a3;
}

- (void)setHasKdot11MultipleRetryCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasKdot11MultipleRetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setKdot11RTSSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_kdot11RTSSuccessCount = a3;
}

- (void)setHasKdot11RTSSuccessCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasKdot11RTSSuccessCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setKdot11RTSFailureCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_kdot11RTSFailureCount = a3;
}

- (void)setHasKdot11RTSFailureCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasKdot11RTSFailureCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setKCtlTxRTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_kCtlTxRTS = a3;
}

- (void)setHasKCtlTxRTS:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasKCtlTxRTS
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setKRxCRCGlitch:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_kRxCRCGlitch = a3;
}

- (void)setHasKRxCRCGlitch:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasKRxCRCGlitch
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setKMACRxUnicastCTStoMAC:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_kMACRxUnicastCTStoMAC = a3;
}

- (void)setHasKMACRxUnicastCTStoMAC:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasKMACRxUnicastCTStoMAC
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setKMACRxUnicastCTStoOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_kMACRxUnicastCTStoOther = a3;
}

- (void)setHasKMACRxUnicastCTStoOther:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasKMACRxUnicastCTStoOther
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setKMACRxUnicastRTStoMAC:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_kMACRxUnicastRTStoMAC = a3;
}

- (void)setHasKMACRxUnicastRTStoMAC:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasKMACRxUnicastRTStoMAC
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setKMACRxUnicastRTStoOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_kMACRxUnicastRTStoOther = a3;
}

- (void)setHasKMACRxUnicastRTStoOther:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasKMACRxUnicastRTStoOther
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setKCtlTxCTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_kCtlTxCTS = a3;
}

- (void)setHasKCtlTxCTS:(BOOL)a3
{
  self->_has = ($6E9D4BE9CD91340AE534803B45062F36)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasKCtlTxCTS
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityAggregateMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityAggregateMetrics description](&v3, sel_description), -[AWDWiFiNWActivityAggregateMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kRxDataErrors] forKey:@"kRxDataErrors"];
    $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kRxFrames] forKey:@"kRxFrames"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kRxRetryBitSet] forKey:@"kRxRetryBitSet"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kMACRxDataFrameMatchingRA] forKey:@"kMACRxDataFrameMatchingRA"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kMACRxDataFrameOtherRA] forKey:@"kMACRxDataFrameOtherRA"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_kMACRxControlFrameMatchingRA] forKey:@"kMACRxControlFrameMatchingRA"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_kMACRxControlFrameOtherRA] forKey:@"kMACRxControlFrameOtherRA"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kRxGoodPLCP] forKey:@"kRxGoodPLCP"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kRxBadPLCP] forKey:@"kRxBadPLCP"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kRxBadFCS] forKey:@"kRxBadFCS"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kTxFrames] forKey:@"kTxFrames"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kTxRetransmission] forKey:@"kTxRetransmission"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kdot11RetryCount] forKey:@"kdot11RetryCount"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kdot11MultipleRetryCount] forKey:@"kdot11MultipleRetryCount"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kdot11RTSSuccessCount] forKey:@"kdot11RTSSuccessCount"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kdot11RTSFailureCount] forKey:@"kdot11RTSFailureCount"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kCtlTxRTS] forKey:@"kCtlTxRTS"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kRxCRCGlitch] forKey:@"kRxCRCGlitch"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastCTStoMAC] forKey:@"kMACRxUnicastCTStoMAC"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastCTStoOther] forKey:@"kMACRxUnicastCTStoOther"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
LABEL_47:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastRTStoOther] forKey:@"kMACRxUnicastRTStoOther"];
    if ((*(_DWORD *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_24;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastRTStoMAC] forKey:@"kMACRxUnicastRTStoMAC"];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0) {
    goto LABEL_47;
  }
LABEL_23:
  if (*(unsigned char *)&has) {
LABEL_24:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_kCtlTxCTS] forKey:@"kCtlTxCTS"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityAggregateMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteUint64Field();
    $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
LABEL_46:
    PBDataWriterWriteUint64Field();
    if ((*(_DWORD *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_47;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0) {
    goto LABEL_46;
  }
LABEL_23:
  if ((*(unsigned char *)&has & 1) == 0) {
    return;
  }
LABEL_47:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((void *)a3 + 12) = self->_kRxDataErrors;
    *((_DWORD *)a3 + 46) |= 0x800u;
    $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 13) = self->_kRxFrames;
  *((_DWORD *)a3 + 46) |= 0x1000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a3 + 15) = self->_kRxRetryBitSet;
  *((_DWORD *)a3 + 46) |= 0x4000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)a3 + 3) = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)a3 + 46) |= 4u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 4) = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)a3 + 46) |= 8u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 44) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)a3 + 46) |= 0x200000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 45) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)a3 + 46) |= 0x400000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)a3 + 14) = self->_kRxGoodPLCP;
  *((_DWORD *)a3 + 46) |= 0x2000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)a3 + 10) = self->_kRxBadPLCP;
  *((_DWORD *)a3 + 46) |= 0x200u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)a3 + 9) = self->_kRxBadFCS;
  *((_DWORD *)a3 + 46) |= 0x100u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 16) = self->_kTxFrames;
  *((_DWORD *)a3 + 46) |= 0x8000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)a3 + 17) = self->_kTxRetransmission;
  *((_DWORD *)a3 + 46) |= 0x10000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)a3 + 21) = self->_kdot11RetryCount;
  *((_DWORD *)a3 + 46) |= 0x100000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 18) = self->_kdot11MultipleRetryCount;
  *((_DWORD *)a3 + 46) |= 0x20000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 20) = self->_kdot11RTSSuccessCount;
  *((_DWORD *)a3 + 46) |= 0x80000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 19) = self->_kdot11RTSFailureCount;
  *((_DWORD *)a3 + 46) |= 0x40000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)a3 + 2) = self->_kCtlTxRTS;
  *((_DWORD *)a3 + 46) |= 2u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)a3 + 11) = self->_kRxCRCGlitch;
  *((_DWORD *)a3 + 46) |= 0x400u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)a3 + 5) = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)a3 + 46) |= 0x10u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)a3 + 6) = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)a3 + 46) |= 0x20u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)a3 + 7) = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)a3 + 46) |= 0x40u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 1) == 0) {
      return;
    }
LABEL_47:
    *((void *)a3 + 1) = self->_kCtlTxCTS;
    *((_DWORD *)a3 + 46) |= 1u;
    return;
  }
LABEL_46:
  *((void *)a3 + 8) = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)a3 + 46) |= 0x80u;
  if (*(_DWORD *)&self->_has) {
    goto LABEL_47;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((void *)result + 12) = self->_kRxDataErrors;
    *((_DWORD *)result + 46) |= 0x800u;
    $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 13) = self->_kRxFrames;
  *((_DWORD *)result + 46) |= 0x1000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 15) = self->_kRxRetryBitSet;
  *((_DWORD *)result + 46) |= 0x4000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 3) = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)result + 46) |= 4u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 4) = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)result + 46) |= 8u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 44) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)result + 46) |= 0x200000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 45) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)result + 46) |= 0x400000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)result + 14) = self->_kRxGoodPLCP;
  *((_DWORD *)result + 46) |= 0x2000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 10) = self->_kRxBadPLCP;
  *((_DWORD *)result + 46) |= 0x200u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 9) = self->_kRxBadFCS;
  *((_DWORD *)result + 46) |= 0x100u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 16) = self->_kTxFrames;
  *((_DWORD *)result + 46) |= 0x8000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 17) = self->_kTxRetransmission;
  *((_DWORD *)result + 46) |= 0x10000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 21) = self->_kdot11RetryCount;
  *((_DWORD *)result + 46) |= 0x100000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 18) = self->_kdot11MultipleRetryCount;
  *((_DWORD *)result + 46) |= 0x20000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 20) = self->_kdot11RTSSuccessCount;
  *((_DWORD *)result + 46) |= 0x80000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 19) = self->_kdot11RTSFailureCount;
  *((_DWORD *)result + 46) |= 0x40000u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 2) = self->_kCtlTxRTS;
  *((_DWORD *)result + 46) |= 2u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)result + 11) = self->_kRxCRCGlitch;
  *((_DWORD *)result + 46) |= 0x400u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)result + 5) = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)result + 46) |= 0x10u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)result + 6) = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)result + 46) |= 0x20u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)result + 7) = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)result + 46) |= 0x40u;
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 1) == 0) {
      return result;
    }
    goto LABEL_24;
  }
LABEL_47:
  *((void *)result + 8) = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)result + 46) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_24:
  *((void *)result + 1) = self->_kCtlTxCTS;
  *((_DWORD *)result + 46) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
    int v7 = *((_DWORD *)a3 + 46);
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_kRxDataErrors != *((void *)a3 + 12)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
LABEL_116:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_kRxFrames != *((void *)a3 + 13)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_kRxRetryBitSet != *((void *)a3 + 15)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_kMACRxDataFrameMatchingRA != *((void *)a3 + 3)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_116;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_kMACRxDataFrameOtherRA != *((void *)a3 + 4)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_kMACRxControlFrameMatchingRA != *((_DWORD *)a3 + 44)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_kMACRxControlFrameOtherRA != *((_DWORD *)a3 + 45)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_kRxGoodPLCP != *((void *)a3 + 14)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_kRxBadPLCP != *((void *)a3 + 10)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_kRxBadFCS != *((void *)a3 + 9)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_kTxFrames != *((void *)a3 + 16)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_kTxRetransmission != *((void *)a3 + 17)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_kdot11RetryCount != *((void *)a3 + 21)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_kdot11MultipleRetryCount != *((void *)a3 + 18)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_kdot11RTSSuccessCount != *((void *)a3 + 20)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_kdot11RTSFailureCount != *((void *)a3 + 19)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_116;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_kCtlTxRTS != *((void *)a3 + 2)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_116;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_kRxCRCGlitch != *((void *)a3 + 11)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_116;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_kMACRxUnicastCTStoMAC != *((void *)a3 + 5)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_116;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_kMACRxUnicastCTStoOther != *((void *)a3 + 6)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_116;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_kMACRxUnicastRTStoMAC != *((void *)a3 + 7)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_116;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_kMACRxUnicastRTStoOther != *((void *)a3 + 8)) {
        goto LABEL_116;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_116;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 46) & 1) == 0;
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_kCtlTxCTS != *((void *)a3 + 1)) {
        goto LABEL_116;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $6E9D4BE9CD91340AE534803B45062F36 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    unint64_t v3 = 2654435761u * self->_kRxDataErrors;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_kRxFrames;
      if ((*(_WORD *)&has & 0x4000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_kRxRetryBitSet;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_kMACRxDataFrameMatchingRA;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_kMACRxDataFrameOtherRA;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_kMACRxControlFrameMatchingRA;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_kMACRxControlFrameOtherRA;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_kRxGoodPLCP;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_kRxBadPLCP;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_kRxBadFCS;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_kTxFrames;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    unint64_t v14 = 2654435761u * self->_kTxRetransmission;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_14:
    unint64_t v15 = 2654435761u * self->_kdot11RetryCount;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_15:
    unint64_t v16 = 2654435761u * self->_kdot11MultipleRetryCount;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_16:
    unint64_t v17 = 2654435761u * self->_kdot11RTSSuccessCount;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_17:
    unint64_t v18 = 2654435761u * self->_kdot11RTSFailureCount;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v18 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_18:
    unint64_t v19 = 2654435761u * self->_kCtlTxRTS;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_19:
    unint64_t v20 = 2654435761u * self->_kRxCRCGlitch;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_20:
    unint64_t v21 = 2654435761u * self->_kMACRxUnicastCTStoMAC;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  unint64_t v21 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_21:
    unint64_t v22 = 2654435761u * self->_kMACRxUnicastCTStoOther;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_22:
    unint64_t v23 = 2654435761u * self->_kMACRxUnicastRTStoMAC;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_23;
    }
LABEL_46:
    unint64_t v24 = 0;
    if (*(unsigned char *)&has) {
      goto LABEL_24;
    }
LABEL_47:
    unint64_t v25 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
  }
LABEL_45:
  unint64_t v23 = 0;
  if ((*(unsigned char *)&has & 0x80) == 0) {
    goto LABEL_46;
  }
LABEL_23:
  unint64_t v24 = 2654435761u * self->_kMACRxUnicastRTStoOther;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_47;
  }
LABEL_24:
  unint64_t v25 = 2654435761u * self->_kCtlTxCTS;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x800) != 0)
  {
    self->_kRxDataErrors = *((void *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
    int v3 = *((_DWORD *)a3 + 46);
    if ((v3 & 0x1000) == 0)
    {
LABEL_3:
      if ((v3 & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((v3 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_kRxFrames = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x4000) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_kRxRetryBitSet = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_kMACRxDataFrameMatchingRA = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_kMACRxDataFrameOtherRA = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x200000) == 0)
  {
LABEL_7:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_kMACRxControlFrameMatchingRA = *((_DWORD *)a3 + 44);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x400000) == 0)
  {
LABEL_8:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_kMACRxControlFrameOtherRA = *((_DWORD *)a3 + 45);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x2000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_kRxGoodPLCP = *((void *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_kRxBadPLCP = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_kRxBadFCS = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x8000) == 0)
  {
LABEL_12:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_kTxFrames = *((void *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x10000) == 0)
  {
LABEL_13:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_kTxRetransmission = *((void *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x100000) == 0)
  {
LABEL_14:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_kdot11RetryCount = *((void *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x20000) == 0)
  {
LABEL_15:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_kdot11MultipleRetryCount = *((void *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x80000) == 0)
  {
LABEL_16:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_kdot11RTSSuccessCount = *((void *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x40000) == 0)
  {
LABEL_17:
    if ((v3 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_kdot11RTSFailureCount = *((void *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 2) == 0)
  {
LABEL_18:
    if ((v3 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_kCtlTxRTS = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x400) == 0)
  {
LABEL_19:
    if ((v3 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_kRxCRCGlitch = *((void *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x10) == 0)
  {
LABEL_20:
    if ((v3 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_kMACRxUnicastCTStoMAC = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x20) == 0)
  {
LABEL_21:
    if ((v3 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_kMACRxUnicastCTStoOther = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x40) == 0)
  {
LABEL_22:
    if ((v3 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_kMACRxUnicastRTStoMAC = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 46);
  if ((v3 & 0x80) == 0)
  {
LABEL_23:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_47:
    self->_kCtlTxCTS = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    return;
  }
LABEL_46:
  self->_kMACRxUnicastRTStoOther = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  if (*((_DWORD *)a3 + 46)) {
    goto LABEL_47;
  }
}

- (unint64_t)kRxDataErrors
{
  return self->_kRxDataErrors;
}

- (unint64_t)kRxFrames
{
  return self->_kRxFrames;
}

- (unint64_t)kRxRetryBitSet
{
  return self->_kRxRetryBitSet;
}

- (unint64_t)kMACRxDataFrameMatchingRA
{
  return self->_kMACRxDataFrameMatchingRA;
}

- (unint64_t)kMACRxDataFrameOtherRA
{
  return self->_kMACRxDataFrameOtherRA;
}

- (unsigned)kMACRxControlFrameMatchingRA
{
  return self->_kMACRxControlFrameMatchingRA;
}

- (unsigned)kMACRxControlFrameOtherRA
{
  return self->_kMACRxControlFrameOtherRA;
}

- (unint64_t)kRxGoodPLCP
{
  return self->_kRxGoodPLCP;
}

- (unint64_t)kRxBadPLCP
{
  return self->_kRxBadPLCP;
}

- (unint64_t)kRxBadFCS
{
  return self->_kRxBadFCS;
}

- (unint64_t)kTxFrames
{
  return self->_kTxFrames;
}

- (unint64_t)kTxRetransmission
{
  return self->_kTxRetransmission;
}

- (unint64_t)kdot11RetryCount
{
  return self->_kdot11RetryCount;
}

- (unint64_t)kdot11MultipleRetryCount
{
  return self->_kdot11MultipleRetryCount;
}

- (unint64_t)kdot11RTSSuccessCount
{
  return self->_kdot11RTSSuccessCount;
}

- (unint64_t)kdot11RTSFailureCount
{
  return self->_kdot11RTSFailureCount;
}

- (unint64_t)kCtlTxRTS
{
  return self->_kCtlTxRTS;
}

- (unint64_t)kRxCRCGlitch
{
  return self->_kRxCRCGlitch;
}

- (unint64_t)kMACRxUnicastCTStoMAC
{
  return self->_kMACRxUnicastCTStoMAC;
}

- (unint64_t)kMACRxUnicastCTStoOther
{
  return self->_kMACRxUnicastCTStoOther;
}

- (unint64_t)kMACRxUnicastRTStoMAC
{
  return self->_kMACRxUnicastRTStoMAC;
}

- (unint64_t)kMACRxUnicastRTStoOther
{
  return self->_kMACRxUnicastRTStoOther;
}

- (unint64_t)kCtlTxCTS
{
  return self->_kCtlTxCTS;
}

@end