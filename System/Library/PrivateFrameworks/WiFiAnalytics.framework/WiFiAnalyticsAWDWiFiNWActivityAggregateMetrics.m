@interface WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics
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
- (BOOL)hasKRxBadOther;
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
- (unint64_t)kRxBadOther;
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
- (void)setHasKRxBadOther:(BOOL)a3;
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
- (void)setKRxBadOther:(unint64_t)a3;
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

@implementation WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x200) != 0) {
LABEL_25:
  }
    PBDataWriterWriteUint64Field();
LABEL_26:
}

- (void)setKdot11RetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_kdot11RetryCount = a3;
}

- (void)setKdot11RTSSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_kdot11RTSSuccessCount = a3;
}

- (void)setKdot11RTSFailureCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_kdot11RTSFailureCount = a3;
}

- (void)setKdot11MultipleRetryCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_kdot11MultipleRetryCount = a3;
}

- (void)setKTxRetransmission:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_kTxRetransmission = a3;
}

- (void)setKTxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_kTxFrames = a3;
}

- (void)setKRxRetryBitSet:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_kRxRetryBitSet = a3;
}

- (void)setKRxGoodPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_kRxGoodPLCP = a3;
}

- (void)setKRxFrames:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_kRxFrames = a3;
}

- (void)setKRxDataErrors:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_kRxDataErrors = a3;
}

- (void)setKRxCRCGlitch:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_kRxCRCGlitch = a3;
}

- (void)setKRxBadPLCP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_kRxBadPLCP = a3;
}

- (void)setKRxBadOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_kRxBadOther = a3;
}

- (void)setKRxBadFCS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_kRxBadFCS = a3;
}

- (void)setKMACRxUnicastRTStoOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_kMACRxUnicastRTStoOther = a3;
}

- (void)setKMACRxUnicastRTStoMAC:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_kMACRxUnicastRTStoMAC = a3;
}

- (void)setKMACRxUnicastCTStoOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_kMACRxUnicastCTStoOther = a3;
}

- (void)setKMACRxUnicastCTStoMAC:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_kMACRxUnicastCTStoMAC = a3;
}

- (void)setKMACRxDataFrameOtherRA:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_kMACRxDataFrameOtherRA = a3;
}

- (void)setKMACRxDataFrameMatchingRA:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_kMACRxDataFrameMatchingRA = a3;
}

- (void)setKMACRxControlFrameOtherRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_kMACRxControlFrameOtherRA = a3;
}

- (void)setKMACRxControlFrameMatchingRA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_kMACRxControlFrameMatchingRA = a3;
}

- (void)setKCtlTxRTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_kCtlTxRTS = a3;
}

- (void)setKCtlTxCTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_kCtlTxCTS = a3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_kRxDataErrors];
    [v3 setObject:v7 forKey:@"kRxDataErrors"];

    $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedLongLong:self->_kRxFrames];
  [v3 setObject:v8 forKey:@"kRxFrames"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  v9 = [NSNumber numberWithUnsignedLongLong:self->_kRxRetryBitSet];
  [v3 setObject:v9 forKey:@"kRxRetryBitSet"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  v10 = [NSNumber numberWithUnsignedLongLong:self->_kMACRxDataFrameMatchingRA];
  [v3 setObject:v10 forKey:@"kMACRxDataFrameMatchingRA"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  v11 = [NSNumber numberWithUnsignedLongLong:self->_kMACRxDataFrameOtherRA];
  [v3 setObject:v11 forKey:@"kMACRxDataFrameOtherRA"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  v12 = [NSNumber numberWithUnsignedInt:self->_kMACRxControlFrameMatchingRA];
  [v3 setObject:v12 forKey:@"kMACRxControlFrameMatchingRA"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  v13 = [NSNumber numberWithUnsignedInt:self->_kMACRxControlFrameOtherRA];
  [v3 setObject:v13 forKey:@"kMACRxControlFrameOtherRA"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  v14 = [NSNumber numberWithUnsignedLongLong:self->_kRxGoodPLCP];
  [v3 setObject:v14 forKey:@"kRxGoodPLCP"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  v15 = [NSNumber numberWithUnsignedLongLong:self->_kRxBadPLCP];
  [v3 setObject:v15 forKey:@"kRxBadPLCP"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  v16 = [NSNumber numberWithUnsignedLongLong:self->_kRxBadFCS];
  [v3 setObject:v16 forKey:@"kRxBadFCS"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  v17 = [NSNumber numberWithUnsignedLongLong:self->_kTxFrames];
  [v3 setObject:v17 forKey:@"kTxFrames"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  v18 = [NSNumber numberWithUnsignedLongLong:self->_kTxRetransmission];
  [v3 setObject:v18 forKey:@"kTxRetransmission"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  v19 = [NSNumber numberWithUnsignedLongLong:self->_kdot11RetryCount];
  [v3 setObject:v19 forKey:@"kdot11RetryCount"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_43;
  }
LABEL_42:
  v20 = [NSNumber numberWithUnsignedLongLong:self->_kdot11MultipleRetryCount];
  [v3 setObject:v20 forKey:@"kdot11MultipleRetryCount"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_43:
  v21 = [NSNumber numberWithUnsignedLongLong:self->_kdot11RTSSuccessCount];
  [v3 setObject:v21 forKey:@"kdot11RTSSuccessCount"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  v22 = [NSNumber numberWithUnsignedLongLong:self->_kdot11RTSFailureCount];
  [v3 setObject:v22 forKey:@"kdot11RTSFailureCount"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  v23 = [NSNumber numberWithUnsignedLongLong:self->_kCtlTxRTS];
  [v3 setObject:v23 forKey:@"kCtlTxRTS"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  v24 = [NSNumber numberWithUnsignedLongLong:self->_kRxCRCGlitch];
  [v3 setObject:v24 forKey:@"kRxCRCGlitch"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  v25 = [NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastCTStoMAC];
  [v3 setObject:v25 forKey:@"kMACRxUnicastCTStoMAC"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  v26 = [NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastCTStoOther];
  [v3 setObject:v26 forKey:@"kMACRxUnicastCTStoOther"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  v27 = [NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastRTStoMAC];
  [v3 setObject:v27 forKey:@"kMACRxUnicastRTStoMAC"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  v28 = [NSNumber numberWithUnsignedLongLong:self->_kMACRxUnicastRTStoOther];
  [v3 setObject:v28 forKey:@"kMACRxUnicastRTStoOther"];

  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_51:
  v29 = [NSNumber numberWithUnsignedLongLong:self->_kCtlTxCTS];
  [v3 setObject:v29 forKey:@"kCtlTxCTS"];

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_25:
    id v5 = [NSNumber numberWithUnsignedLongLong:self->_kRxBadOther];
    [v3 setObject:v5 forKey:@"kRxBadOther"];
  }
LABEL_26:
  return v3;
}

- (void)setHasKRxDataErrors:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasKRxDataErrors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasKRxFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasKRxFrames
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasKRxRetryBitSet:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasKRxRetryBitSet
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasKMACRxDataFrameMatchingRA:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasKMACRxDataFrameMatchingRA
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasKMACRxDataFrameOtherRA:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasKMACRxDataFrameOtherRA
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasKMACRxControlFrameMatchingRA:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameMatchingRA
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasKMACRxControlFrameOtherRA:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasKMACRxControlFrameOtherRA
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasKRxGoodPLCP:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasKRxGoodPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasKRxBadPLCP:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasKRxBadPLCP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasKRxBadFCS:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasKRxBadFCS
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasKTxFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasKTxFrames
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasKTxRetransmission:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasKTxRetransmission
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasKdot11RetryCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasKdot11RetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasKdot11MultipleRetryCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasKdot11MultipleRetryCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasKdot11RTSSuccessCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasKdot11RTSSuccessCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasKdot11RTSFailureCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasKdot11RTSFailureCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasKCtlTxRTS:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasKCtlTxRTS
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasKRxCRCGlitch:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasKRxCRCGlitch
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasKMACRxUnicastCTStoMAC:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasKMACRxUnicastCTStoMAC
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasKMACRxUnicastCTStoOther:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasKMACRxUnicastCTStoOther
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasKMACRxUnicastRTStoMAC:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasKMACRxUnicastRTStoMAC
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasKMACRxUnicastRTStoOther:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasKMACRxUnicastRTStoOther
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasKCtlTxCTS:(BOOL)a3
{
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasKCtlTxCTS
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasKRxBadOther:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$D920E565D10DD7D8512C956EF549CB66 has = ($D920E565D10DD7D8512C956EF549CB66)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasKRxBadOther
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics;
  v4 = [(WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityAggregateMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityAggregateMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v4[13] = self->_kRxDataErrors;
    *((_DWORD *)v4 + 48) |= 0x1000u;
    $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  v4[14] = self->_kRxFrames;
  *((_DWORD *)v4 + 48) |= 0x2000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[16] = self->_kRxRetryBitSet;
  *((_DWORD *)v4 + 48) |= 0x8000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[3] = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)v4 + 48) |= 4u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[4] = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)v4 + 48) |= 8u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 46) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)v4 + 48) |= 0x400000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 47) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)v4 + 48) |= 0x800000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[15] = self->_kRxGoodPLCP;
  *((_DWORD *)v4 + 48) |= 0x4000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[11] = self->_kRxBadPLCP;
  *((_DWORD *)v4 + 48) |= 0x400u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[9] = self->_kRxBadFCS;
  *((_DWORD *)v4 + 48) |= 0x100u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[17] = self->_kTxFrames;
  *((_DWORD *)v4 + 48) |= 0x10000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  v4[18] = self->_kTxRetransmission;
  *((_DWORD *)v4 + 48) |= 0x20000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  v4[22] = self->_kdot11RetryCount;
  *((_DWORD *)v4 + 48) |= 0x200000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_43;
  }
LABEL_42:
  v4[19] = self->_kdot11MultipleRetryCount;
  *((_DWORD *)v4 + 48) |= 0x40000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_43:
  v4[21] = self->_kdot11RTSSuccessCount;
  *((_DWORD *)v4 + 48) |= 0x100000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  v4[20] = self->_kdot11RTSFailureCount;
  *((_DWORD *)v4 + 48) |= 0x80000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  v4[2] = self->_kCtlTxRTS;
  *((_DWORD *)v4 + 48) |= 2u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  v4[12] = self->_kRxCRCGlitch;
  *((_DWORD *)v4 + 48) |= 0x800u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  v4[5] = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)v4 + 48) |= 0x10u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  v4[6] = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)v4 + 48) |= 0x20u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  v4[7] = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)v4 + 48) |= 0x40u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  v4[8] = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)v4 + 48) |= 0x80u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_51:
  v4[1] = self->_kCtlTxCTS;
  *((_DWORD *)v4 + 48) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_25:
    v4[10] = self->_kRxBadOther;
    *((_DWORD *)v4 + 48) |= 0x200u;
  }
LABEL_26:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    *((void *)result + 13) = self->_kRxDataErrors;
    *((_DWORD *)result + 48) |= 0x1000u;
    $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 14) = self->_kRxFrames;
  *((_DWORD *)result + 48) |= 0x2000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 16) = self->_kRxRetryBitSet;
  *((_DWORD *)result + 48) |= 0x8000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 3) = self->_kMACRxDataFrameMatchingRA;
  *((_DWORD *)result + 48) |= 4u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)result + 4) = self->_kMACRxDataFrameOtherRA;
  *((_DWORD *)result + 48) |= 8u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 46) = self->_kMACRxControlFrameMatchingRA;
  *((_DWORD *)result + 48) |= 0x400000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 47) = self->_kMACRxControlFrameOtherRA;
  *((_DWORD *)result + 48) |= 0x800000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 15) = self->_kRxGoodPLCP;
  *((_DWORD *)result + 48) |= 0x4000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 11) = self->_kRxBadPLCP;
  *((_DWORD *)result + 48) |= 0x400u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 9) = self->_kRxBadFCS;
  *((_DWORD *)result + 48) |= 0x100u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 17) = self->_kTxFrames;
  *((_DWORD *)result + 48) |= 0x10000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 18) = self->_kTxRetransmission;
  *((_DWORD *)result + 48) |= 0x20000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 22) = self->_kdot11RetryCount;
  *((_DWORD *)result + 48) |= 0x200000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 19) = self->_kdot11MultipleRetryCount;
  *((_DWORD *)result + 48) |= 0x40000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 21) = self->_kdot11RTSSuccessCount;
  *((_DWORD *)result + 48) |= 0x100000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 20) = self->_kdot11RTSFailureCount;
  *((_DWORD *)result + 48) |= 0x80000u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)result + 2) = self->_kCtlTxRTS;
  *((_DWORD *)result + 48) |= 2u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)result + 12) = self->_kRxCRCGlitch;
  *((_DWORD *)result + 48) |= 0x800u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)result + 5) = self->_kMACRxUnicastCTStoMAC;
  *((_DWORD *)result + 48) |= 0x10u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)result + 6) = self->_kMACRxUnicastCTStoOther;
  *((_DWORD *)result + 48) |= 0x20u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)result + 7) = self->_kMACRxUnicastRTStoMAC;
  *((_DWORD *)result + 48) |= 0x40u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)result + 8) = self->_kMACRxUnicastRTStoOther;
  *((_DWORD *)result + 48) |= 0x80u;
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0) {
      return result;
    }
    goto LABEL_25;
  }
LABEL_49:
  *((void *)result + 1) = self->_kCtlTxCTS;
  *((_DWORD *)result + 48) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x200) == 0) {
    return result;
  }
LABEL_25:
  *((void *)result + 10) = self->_kRxBadOther;
  *((_DWORD *)result + 48) |= 0x200u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_122;
  }
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  int v6 = *((_DWORD *)v4 + 48);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_kRxDataErrors != *((void *)v4 + 13)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
LABEL_122:
    BOOL v7 = 0;
    goto LABEL_123;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_kRxFrames != *((void *)v4 + 14)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_kRxRetryBitSet != *((void *)v4 + 16)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_kMACRxDataFrameMatchingRA != *((void *)v4 + 3)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_122;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_kMACRxDataFrameOtherRA != *((void *)v4 + 4)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_kMACRxControlFrameMatchingRA != *((_DWORD *)v4 + 46)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_kMACRxControlFrameOtherRA != *((_DWORD *)v4 + 47)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_kRxGoodPLCP != *((void *)v4 + 15)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_kRxBadPLCP != *((void *)v4 + 11)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_kRxBadFCS != *((void *)v4 + 9)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_kTxFrames != *((void *)v4 + 17)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_kTxRetransmission != *((void *)v4 + 18)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_kdot11RetryCount != *((void *)v4 + 22)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_kdot11MultipleRetryCount != *((void *)v4 + 19)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_kdot11RTSSuccessCount != *((void *)v4 + 21)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_kdot11RTSFailureCount != *((void *)v4 + 20)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_122;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_kCtlTxRTS != *((void *)v4 + 2)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_kRxCRCGlitch != *((void *)v4 + 12)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_122;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_kMACRxUnicastCTStoMAC != *((void *)v4 + 5)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_122;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_kMACRxUnicastCTStoOther != *((void *)v4 + 6)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_122;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_kMACRxUnicastRTStoMAC != *((void *)v4 + 7)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_122;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_kMACRxUnicastRTStoOther != *((void *)v4 + 8)) {
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_122;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_kCtlTxCTS != *((void *)v4 + 1)) {
      goto LABEL_122;
    }
  }
  else if (v6)
  {
    goto LABEL_122;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_kRxBadOther != *((void *)v4 + 10)) {
      goto LABEL_122;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 48) & 0x200) == 0;
  }
LABEL_123:

  return v7;
}

- (unint64_t)hash
{
  $D920E565D10DD7D8512C956EF549CB66 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    unint64_t v3 = 2654435761u * self->_kRxDataErrors;
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_kRxFrames;
      if ((*(_WORD *)&has & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_kRxRetryBitSet;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_kMACRxDataFrameMatchingRA;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_kMACRxDataFrameOtherRA;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_kMACRxControlFrameMatchingRA;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_kMACRxControlFrameOtherRA;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_kRxGoodPLCP;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_kRxBadPLCP;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_kRxBadFCS;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_12:
    unint64_t v13 = 2654435761u * self->_kTxFrames;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_13:
    unint64_t v14 = 2654435761u * self->_kTxRetransmission;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_14:
    unint64_t v15 = 2654435761u * self->_kdot11RetryCount;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_15:
    unint64_t v16 = 2654435761u * self->_kdot11MultipleRetryCount;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_16:
    unint64_t v17 = 2654435761u * self->_kdot11RTSSuccessCount;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    unint64_t v18 = 2654435761u * self->_kdot11RTSFailureCount;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v18 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_18:
    unint64_t v19 = 2654435761u * self->_kCtlTxRTS;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_19:
    unint64_t v20 = 2654435761u * self->_kRxCRCGlitch;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  unint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_20:
    unint64_t v21 = 2654435761u * self->_kMACRxUnicastCTStoMAC;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v21 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_21:
    unint64_t v22 = 2654435761u * self->_kMACRxUnicastCTStoOther;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_22:
    unint64_t v23 = 2654435761u * self->_kMACRxUnicastRTStoMAC;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  unint64_t v23 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_23:
    unint64_t v24 = 2654435761u * self->_kMACRxUnicastRTStoOther;
    if (*(unsigned char *)&has) {
      goto LABEL_24;
    }
LABEL_48:
    unint64_t v25 = 0;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_25;
    }
LABEL_49:
    unint64_t v26 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_47:
  unint64_t v24 = 0;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_48;
  }
LABEL_24:
  unint64_t v25 = 2654435761u * self->_kCtlTxCTS;
  if ((*(_WORD *)&has & 0x200) == 0) {
    goto LABEL_49;
  }
LABEL_25:
  unint64_t v26 = 2654435761u * self->_kRxBadOther;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x1000) != 0)
  {
    self->_kRxDataErrors = *((void *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x1000u;
    int v5 = *((_DWORD *)v4 + 48);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_kRxFrames = *((void *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_kRxRetryBitSet = *((void *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_kMACRxDataFrameMatchingRA = *((void *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_kMACRxDataFrameOtherRA = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x400000) == 0)
  {
LABEL_7:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_kMACRxControlFrameMatchingRA = *((_DWORD *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x800000) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_kMACRxControlFrameOtherRA = *((_DWORD *)v4 + 47);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_kRxGoodPLCP = *((void *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_kRxBadPLCP = *((void *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_kRxBadFCS = *((void *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x10000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_kTxFrames = *((void *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x20000) == 0)
  {
LABEL_13:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_kTxRetransmission = *((void *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x200000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_kdot11RetryCount = *((void *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_kdot11MultipleRetryCount = *((void *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x100000) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_kdot11RTSSuccessCount = *((void *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_kdot11RTSFailureCount = *((void *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_18:
    if ((v5 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_kCtlTxRTS = *((void *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x800) == 0)
  {
LABEL_19:
    if ((v5 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_kRxCRCGlitch = *((void *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if ((v5 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_kMACRxUnicastCTStoMAC = *((void *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_21:
    if ((v5 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_kMACRxUnicastCTStoOther = *((void *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_22:
    if ((v5 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_kMACRxUnicastRTStoMAC = *((void *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 0x80) == 0)
  {
LABEL_23:
    if ((v5 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_kMACRxUnicastRTStoOther = *((void *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_24:
    if ((v5 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_51:
  self->_kCtlTxCTS = *((void *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v4 + 48) & 0x200) != 0)
  {
LABEL_25:
    self->_kRxBadOther = *((void *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_26:
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

- (unint64_t)kRxBadOther
{
  return self->_kRxBadOther;
}

@end