@interface AWDWRMWiFiCallingEnd
- (BOOL)aTMRegistrationState;
- (BOOL)captiveNetwork;
- (BOOL)hOCapability;
- (BOOL)hasATMRegistrationState;
- (BOOL)hasBBAudioErasures;
- (BOOL)hasBBAudioPacketLoss;
- (BOOL)hasBSSLoad;
- (BOOL)hasBeaconRate;
- (BOOL)hasCallEndReason;
- (BOOL)hasCallId;
- (BOOL)hasCaptiveNetwork;
- (BOOL)hasHOBool;
- (BOOL)hasHOCapability;
- (BOOL)hasIPSecTunnelStatus;
- (BOOL)hasIWLANStatus;
- (BOOL)hasLTECTRSRP;
- (BOOL)hasLTEDataLQM;
- (BOOL)hasLTEQoSAvailable;
- (BOOL)hasLTERSRP;
- (BOOL)hasLTESINR;
- (BOOL)hasLTETxPower;
- (BOOL)hasLTEVoiceLQM;
- (BOOL)hasLatteDejitterBufferUnderflow;
- (BOOL)hasLatteErasures;
- (BOOL)hasLatteNominalJitterBufferSize;
- (BOOL)hasLatteRTPPacketLoss;
- (BOOL)hasServingCellRAT;
- (BOOL)hasServingCellRSRP;
- (BOOL)hasServingCellSINR;
- (BOOL)hasSessionId;
- (BOOL)hasSignalBar;
- (BOOL)hasTimestamp;
- (BOOL)hasWOWEnabled;
- (BOOL)hasWRMRecommendedRAT;
- (BOOL)hasWiFiBSSIDChange;
- (BOOL)hasWiFiPreferred;
- (BOOL)hasWiFiRSSI;
- (BOOL)hasWiFiRxRetry;
- (BOOL)hasWiFiSINR;
- (BOOL)hasWiFiTxPER;
- (BOOL)iPSecTunnelStatus;
- (BOOL)iWLANStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)lTEQoSAvailable;
- (BOOL)readFrom:(id)a3;
- (BOOL)wOWEnabled;
- (BOOL)wiFiBSSIDChange;
- (BOOL)wiFiPreferred;
- (NSString)callEndReason;
- (NSString)callId;
- (NSString)wRMRecommendedRAT;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)lTEDataLQM;
- (int)lTESINR;
- (int)lTEVoiceLQM;
- (int)servingCellSINR;
- (int64_t)lTECTRSRP;
- (int64_t)lTERSRP;
- (int64_t)servingCellRSRP;
- (int64_t)wiFiRSSI;
- (int64_t)wiFiSINR;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bBAudioErasures;
- (unsigned)bBAudioPacketLoss;
- (unsigned)bSSLoad;
- (unsigned)beaconRate;
- (unsigned)hOBool;
- (unsigned)lTETxPower;
- (unsigned)latteDejitterBufferUnderflow;
- (unsigned)latteErasures;
- (unsigned)latteNominalJitterBufferSize;
- (unsigned)latteRTPPacketLoss;
- (unsigned)servingCellRAT;
- (unsigned)sessionId;
- (unsigned)signalBar;
- (unsigned)wiFiRxRetry;
- (unsigned)wiFiTxPER;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setATMRegistrationState:(BOOL)a3;
- (void)setBBAudioErasures:(unsigned int)a3;
- (void)setBBAudioPacketLoss:(unsigned int)a3;
- (void)setBSSLoad:(unsigned int)a3;
- (void)setBeaconRate:(unsigned int)a3;
- (void)setCallEndReason:(id)a3;
- (void)setCallId:(id)a3;
- (void)setCaptiveNetwork:(BOOL)a3;
- (void)setHOBool:(unsigned int)a3;
- (void)setHOCapability:(BOOL)a3;
- (void)setHasATMRegistrationState:(BOOL)a3;
- (void)setHasBBAudioErasures:(BOOL)a3;
- (void)setHasBBAudioPacketLoss:(BOOL)a3;
- (void)setHasBSSLoad:(BOOL)a3;
- (void)setHasBeaconRate:(BOOL)a3;
- (void)setHasCaptiveNetwork:(BOOL)a3;
- (void)setHasHOBool:(BOOL)a3;
- (void)setHasHOCapability:(BOOL)a3;
- (void)setHasIPSecTunnelStatus:(BOOL)a3;
- (void)setHasIWLANStatus:(BOOL)a3;
- (void)setHasLTECTRSRP:(BOOL)a3;
- (void)setHasLTEDataLQM:(BOOL)a3;
- (void)setHasLTEQoSAvailable:(BOOL)a3;
- (void)setHasLTERSRP:(BOOL)a3;
- (void)setHasLTESINR:(BOOL)a3;
- (void)setHasLTETxPower:(BOOL)a3;
- (void)setHasLTEVoiceLQM:(BOOL)a3;
- (void)setHasLatteDejitterBufferUnderflow:(BOOL)a3;
- (void)setHasLatteErasures:(BOOL)a3;
- (void)setHasLatteNominalJitterBufferSize:(BOOL)a3;
- (void)setHasLatteRTPPacketLoss:(BOOL)a3;
- (void)setHasServingCellRAT:(BOOL)a3;
- (void)setHasServingCellRSRP:(BOOL)a3;
- (void)setHasServingCellSINR:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setHasSignalBar:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWOWEnabled:(BOOL)a3;
- (void)setHasWiFiBSSIDChange:(BOOL)a3;
- (void)setHasWiFiPreferred:(BOOL)a3;
- (void)setHasWiFiRSSI:(BOOL)a3;
- (void)setHasWiFiRxRetry:(BOOL)a3;
- (void)setHasWiFiSINR:(BOOL)a3;
- (void)setHasWiFiTxPER:(BOOL)a3;
- (void)setIPSecTunnelStatus:(BOOL)a3;
- (void)setIWLANStatus:(BOOL)a3;
- (void)setLTECTRSRP:(int64_t)a3;
- (void)setLTEDataLQM:(int)a3;
- (void)setLTEQoSAvailable:(BOOL)a3;
- (void)setLTERSRP:(int64_t)a3;
- (void)setLTESINR:(int)a3;
- (void)setLTETxPower:(unsigned int)a3;
- (void)setLTEVoiceLQM:(int)a3;
- (void)setLatteDejitterBufferUnderflow:(unsigned int)a3;
- (void)setLatteErasures:(unsigned int)a3;
- (void)setLatteNominalJitterBufferSize:(unsigned int)a3;
- (void)setLatteRTPPacketLoss:(unsigned int)a3;
- (void)setServingCellRAT:(unsigned int)a3;
- (void)setServingCellRSRP:(int64_t)a3;
- (void)setServingCellSINR:(int)a3;
- (void)setSessionId:(unsigned int)a3;
- (void)setSignalBar:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWOWEnabled:(BOOL)a3;
- (void)setWRMRecommendedRAT:(id)a3;
- (void)setWiFiBSSIDChange:(BOOL)a3;
- (void)setWiFiPreferred:(BOOL)a3;
- (void)setWiFiRSSI:(int64_t)a3;
- (void)setWiFiRxRetry:(unsigned int)a3;
- (void)setWiFiSINR:(int64_t)a3;
- (void)setWiFiTxPER:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWRMWiFiCallingEnd

- (void)dealloc
{
  [(AWDWRMWiFiCallingEnd *)self setWRMRecommendedRAT:0];
  [(AWDWRMWiFiCallingEnd *)self setCallId:0];
  [(AWDWRMWiFiCallingEnd *)self setCallEndReason:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCallingEnd;
  [(AWDWRMWiFiCallingEnd *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setWiFiRSSI:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_wiFiRSSI = a3;
}

- (void)setHasWiFiRSSI:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasWiFiRSSI
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setWiFiTxPER:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_wiFiTxPER = a3;
}

- (void)setHasWiFiTxPER:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasWiFiTxPER
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setWiFiSINR:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_wiFiSINR = a3;
}

- (void)setHasWiFiSINR:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasWiFiSINR
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setWiFiBSSIDChange:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_wiFiBSSIDChange = a3;
}

- (void)setHasWiFiBSSIDChange:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasWiFiBSSIDChange
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setBeaconRate:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_beaconRate = a3;
}

- (void)setHasBeaconRate:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasBeaconRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCaptiveNetwork:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_captiveNetwork = a3;
}

- (void)setHasCaptiveNetwork:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasCaptiveNetwork
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setWOWEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_wOWEnabled = a3;
}

- (void)setHasWOWEnabled:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasWOWEnabled
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setWiFiRxRetry:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_wiFiRxRetry = a3;
}

- (void)setHasWiFiRxRetry:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasWiFiRxRetry
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLTEDataLQM:(int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_lTEDataLQM = a3;
}

- (void)setHasLTEDataLQM:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasLTEDataLQM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLTETxPower:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_lTETxPower = a3;
}

- (void)setHasLTETxPower:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasLTETxPower
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setLTEQoSAvailable:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_lTEQoSAvailable = a3;
}

- (void)setHasLTEQoSAvailable:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasLTEQoSAvailable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setBSSLoad:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_bSSLoad = a3;
}

- (void)setHasBSSLoad:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasBSSLoad
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setLTEVoiceLQM:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_lTEVoiceLQM = a3;
}

- (void)setHasLTEVoiceLQM:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasLTEVoiceLQM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setLTESINR:(int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_lTESINR = a3;
}

- (void)setHasLTESINR:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasLTESINR
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLTERSRP:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_lTERSRP = a3;
}

- (void)setHasLTERSRP:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasLTERSRP
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLTECTRSRP:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_lTECTRSRP = a3;
}

- (void)setHasLTECTRSRP:(BOOL)a3
{
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasLTECTRSRP
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSignalBar:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_signalBar = a3;
}

- (void)setHasSignalBar:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSignalBar
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLatteNominalJitterBufferSize:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_latteNominalJitterBufferSize = a3;
}

- (void)setHasLatteNominalJitterBufferSize:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasLatteNominalJitterBufferSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLatteDejitterBufferUnderflow:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_latteDejitterBufferUnderflow = a3;
}

- (void)setHasLatteDejitterBufferUnderflow:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasLatteDejitterBufferUnderflow
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setLatteRTPPacketLoss:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_latteRTPPacketLoss = a3;
}

- (void)setHasLatteRTPPacketLoss:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasLatteRTPPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setLatteErasures:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_latteErasures = a3;
}

- (void)setHasLatteErasures:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasLatteErasures
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHOCapability:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_hOCapability = a3;
}

- (void)setHasHOCapability:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasHOCapability
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHOBool:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_hOBool = a3;
}

- (void)setHasHOBool:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasHOBool
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasWRMRecommendedRAT
{
  return self->_wRMRecommendedRAT != 0;
}

- (void)setIWLANStatus:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_iWLANStatus = a3;
}

- (void)setHasIWLANStatus:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIWLANStatus
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (BOOL)hasCallId
{
  return self->_callId != 0;
}

- (void)setSessionId:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSessionId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIPSecTunnelStatus:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_iPSecTunnelStatus = a3;
}

- (void)setHasIPSecTunnelStatus:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIPSecTunnelStatus
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasCallEndReason
{
  return self->_callEndReason != 0;
}

- (void)setATMRegistrationState:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_aTMRegistrationState = a3;
}

- (void)setHasATMRegistrationState:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasATMRegistrationState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setBBAudioPacketLoss:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_bBAudioPacketLoss = a3;
}

- (void)setHasBBAudioPacketLoss:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasBBAudioPacketLoss
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setBBAudioErasures:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_bBAudioErasures = a3;
}

- (void)setHasBBAudioErasures:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasBBAudioErasures
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setWiFiPreferred:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_wiFiPreferred = a3;
}

- (void)setHasWiFiPreferred:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasWiFiPreferred
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setServingCellRAT:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_servingCellRAT = a3;
}

- (void)setHasServingCellRAT:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasServingCellRAT
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setServingCellSINR:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_servingCellSINR = a3;
}

- (void)setHasServingCellSINR:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasServingCellSINR
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setServingCellRSRP:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_servingCellRSRP = a3;
}

- (void)setHasServingCellRSRP:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E13B6317796A15400D7522EDCFAEA1D1)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasServingCellRSRP
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCallingEnd;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWRMWiFiCallingEnd description](&v3, sel_description), -[AWDWRMWiFiCallingEnd dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithLongLong:self->_wiFiRSSI] forKey:@"WiFi_RSSI"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wiFiTxPER] forKey:@"WiFi_TxPER"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithLongLong:self->_wiFiSINR] forKey:@"WiFi_SINR"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithBool:self->_wiFiBSSIDChange] forKey:@"WiFi_BSSID_Change"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_beaconRate] forKey:@"Beacon_Rate"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithBool:self->_captiveNetwork] forKey:@"Captive_Network"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithBool:self->_wOWEnabled] forKey:@"WOW_Enabled"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wiFiRxRetry] forKey:@"WiFi_RxRetry"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithInt:self->_lTEDataLQM] forKey:@"LTE_Data_LQM"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lTETxPower] forKey:@"LTE_Tx_Power"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithBool:self->_lTEQoSAvailable] forKey:@"LTE_QoS_Available"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bSSLoad] forKey:@"BSS_Load"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithInt:self->_lTEVoiceLQM] forKey:@"LTE_Voice_LQM"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithInt:self->_lTESINR] forKey:@"LTE_SINR"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithLongLong:self->_lTERSRP] forKey:@"LTE_RSRP"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithLongLong:self->_lTECTRSRP] forKey:@"LTE_CT_RSRP"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_signalBar] forKey:@"Signal_bar"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_latteNominalJitterBufferSize] forKey:@"Latte_Nominal_Jitter_Buffer_Size"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_latteDejitterBufferUnderflow] forKey:@"Latte_Dejitter_Buffer_Underflow"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_latteRTPPacketLoss] forKey:@"Latte_RTP_Packet_Loss"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_latteErasures] forKey:@"Latte_Erasures"];
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithBool:self->_hOCapability] forKey:@"HO_Capability"];
  if ((*(void *)&self->_has & 0x400) != 0) {
LABEL_25:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_hOBool] forKey:@"HO_Bool"];
LABEL_26:
  wRMRecommendedRAT = self->_wRMRecommendedRAT;
  if (wRMRecommendedRAT) {
    [v3 setObject:wRMRecommendedRAT forKey:@"WRM_Recommended_RAT"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_iWLANStatus] forKey:@"iWLAN_Status"];
  }
  callId = self->_callId;
  if (callId) {
    [v3 setObject:callId forKey:@"call_id"];
  }
  $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sessionId] forKey:@"session_id"];
    $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x10000000) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_iPSecTunnelStatus] forKey:@"IPSec_Tunnel_status"];
  }
  callEndReason = self->_callEndReason;
  if (callEndReason) {
    [v3 setObject:callEndReason forKey:@"Call_End_Reason"];
  }
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_aTMRegistrationState] forKey:@"ATM_Registration_State"];
    $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
    if ((*(unsigned char *)&v9 & 0x80) == 0)
    {
LABEL_40:
      if ((*(unsigned char *)&v9 & 0x40) == 0) {
        goto LABEL_41;
      }
      goto LABEL_73;
    }
  }
  else if ((*(unsigned char *)&v9 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bBAudioPacketLoss] forKey:@"BB_Audio_Packet_Loss"];
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) == 0)
  {
LABEL_41:
    if ((*(void *)&v9 & 0x200000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bBAudioErasures] forKey:@"BB_Audio_Erasures"];
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(void *)&v9 & 0x200000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v9 & 0x80000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithBool:self->_wiFiPreferred] forKey:@"WiFi_Preferred"];
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v9 & 0x100000) == 0) {
      goto LABEL_44;
    }
LABEL_76:
    [v3 setObject:[NSNumber numberWithInt:self->_servingCellSINR] forKey:@"ServingCell_SINR"];
    if ((*(void *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_45;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_servingCellRAT] forKey:@"ServingCell_RAT"];
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0) {
    goto LABEL_76;
  }
LABEL_44:
  if ((*(unsigned char *)&v9 & 4) != 0) {
LABEL_45:
  }
    [v3 setObject:[NSNumber numberWithLongLong:self->_servingCellRSRP] forKey:@"ServingCell_RSRP"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMWiFiCallingEndReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint64Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteSint64Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteSint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteSint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteSint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteSint64Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteSint64Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x400) != 0) {
LABEL_25:
  }
    PBDataWriterWriteUint32Field();
LABEL_26:
  if (self->_wRMRecommendedRAT) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_callId) {
    PBDataWriterWriteStringField();
  }
  $E13B6317796A15400D7522EDCFAEA1D1 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $E13B6317796A15400D7522EDCFAEA1D1 v5 = self->_has;
  }
  if ((*(_DWORD *)&v5 & 0x10000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_callEndReason) {
    PBDataWriterWriteStringField();
  }
  $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x80) == 0)
    {
LABEL_40:
      if ((*(unsigned char *)&v6 & 0x40) == 0) {
        goto LABEL_41;
      }
      goto LABEL_72;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_41:
    if ((*(void *)&v6 & 0x200000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
  if ((*(void *)&v6 & 0x200000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_44;
    }
LABEL_75:
    PBDataWriterWriteSint32Field();
    if ((*(void *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_76;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) != 0) {
    goto LABEL_75;
  }
LABEL_44:
  if ((*(unsigned char *)&v6 & 4) == 0) {
    return;
  }
LABEL_76:

  PBDataWriterWriteSint64Field();
}

- (void)copyTo:(id)a3
{
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *(void *)((char *)a3 + 172) |= 8uLL;
    $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 5) = self->_wiFiRSSI;
  *(void *)((char *)a3 + 172) |= 0x10uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 39) = self->_wiFiTxPER;
  *(void *)((char *)a3 + 172) |= 0x1000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 6) = self->_wiFiSINR;
  *(void *)((char *)a3 + 172) |= 0x20uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((unsigned char *)a3 + 167) = self->_wiFiBSSIDChange;
  *(void *)((char *)a3 + 172) |= 0x100000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 17) = self->_beaconRate;
  *(void *)((char *)a3 + 172) |= 0x200uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((unsigned char *)a3 + 161) = self->_captiveNetwork;
  *(void *)((char *)a3 + 172) |= 0x4000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((unsigned char *)a3 + 166) = self->_wOWEnabled;
  *(void *)((char *)a3 + 172) |= 0x80000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 38) = self->_wiFiRxRetry;
  *(void *)((char *)a3 + 172) |= 0x800000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 23) = self->_lTEDataLQM;
  *(void *)((char *)a3 + 172) |= 0x800uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 25) = self->_lTETxPower;
  *(void *)((char *)a3 + 172) |= 0x2000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)a3 + 165) = self->_lTEQoSAvailable;
  *(void *)((char *)a3 + 172) |= 0x40000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 16) = self->_bSSLoad;
  *(void *)((char *)a3 + 172) |= 0x100uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 26) = self->_lTEVoiceLQM;
  *(void *)((char *)a3 + 172) |= 0x4000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 24) = self->_lTESINR;
  *(void *)((char *)a3 + 172) |= 0x1000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)a3 + 2) = self->_lTERSRP;
  *(void *)((char *)a3 + 172) |= 2uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 1) = self->_lTECTRSRP;
  *(void *)((char *)a3 + 172) |= 1uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 34) = self->_signalBar;
  *(void *)((char *)a3 + 172) |= 0x400000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 29) = self->_latteNominalJitterBufferSize;
  *(void *)((char *)a3 + 172) |= 0x20000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 27) = self->_latteDejitterBufferUnderflow;
  *(void *)((char *)a3 + 172) |= 0x8000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 30) = self->_latteRTPPacketLoss;
  *(void *)((char *)a3 + 172) |= 0x40000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 28) = self->_latteErasures;
  *(void *)((char *)a3 + 172) |= 0x10000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_69:
  *((unsigned char *)a3 + 162) = self->_hOCapability;
  *(void *)((char *)a3 + 172) |= 0x8000000uLL;
  if ((*(void *)&self->_has & 0x400) != 0)
  {
LABEL_25:
    *((_DWORD *)a3 + 22) = self->_hOBool;
    *(void *)((char *)a3 + 172) |= 0x400uLL;
  }
LABEL_26:
  if (self->_wRMRecommendedRAT) {
    [a3 setWRMRecommendedRAT:];
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x20) != 0)
  {
    *((unsigned char *)a3 + 164) = self->_iWLANStatus;
    *(void *)((char *)a3 + 172) |= 0x20000000uLL;
  }
  if (self->_callId) {
    [a3 setCallId:];
  }
  $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) != 0)
  {
    *((_DWORD *)a3 + 33) = self->_sessionId;
    *(void *)((char *)a3 + 172) |= 0x200000uLL;
    $E13B6317796A15400D7522EDCFAEA1D1 v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x10000000) != 0)
  {
    *((unsigned char *)a3 + 163) = self->_iPSecTunnelStatus;
    *(void *)((char *)a3 + 172) |= 0x10000000uLL;
  }
  if (self->_callEndReason) {
    [a3 setCallEndReason:];
  }
  $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    *((unsigned char *)a3 + 160) = self->_aTMRegistrationState;
    *(void *)((char *)a3 + 172) |= 0x2000000uLL;
    $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x80) == 0)
    {
LABEL_40:
      if ((*(unsigned char *)&v7 & 0x40) == 0) {
        goto LABEL_41;
      }
      goto LABEL_73;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  *((_DWORD *)a3 + 15) = self->_bBAudioPacketLoss;
  *(void *)((char *)a3 + 172) |= 0x80uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_41:
    if ((*(void *)&v7 & 0x200000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 14) = self->_bBAudioErasures;
  *(void *)((char *)a3 + 172) |= 0x40uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((unsigned char *)a3 + 168) = self->_wiFiPreferred;
  *(void *)((char *)a3 + 172) |= 0x200000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 31) = self->_servingCellRAT;
  *(void *)((char *)a3 + 172) |= 0x80000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      return;
    }
    goto LABEL_45;
  }
LABEL_76:
  *((_DWORD *)a3 + 32) = self->_servingCellSINR;
  *(void *)((char *)a3 + 172) |= 0x100000uLL;
  if ((*(void *)&self->_has & 4) == 0) {
    return;
  }
LABEL_45:
  *((void *)a3 + 3) = self->_servingCellRSRP;
  *(void *)((char *)a3 + 172) |= 4uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(void *)(v5 + 172) |= 8uLL;
    $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_43;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 40) = self->_wiFiRSSI;
  *(void *)(v5 + 172) |= 0x10uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 156) = self->_wiFiTxPER;
  *(void *)(v5 + 172) |= 0x1000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(void *)(v5 + 48) = self->_wiFiSINR;
  *(void *)(v5 + 172) |= 0x20uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v5 + 167) = self->_wiFiBSSIDChange;
  *(void *)(v5 + 172) |= 0x100000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 68) = self->_beaconRate;
  *(void *)(v5 + 172) |= 0x200uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(unsigned char *)(v5 + 161) = self->_captiveNetwork;
  *(void *)(v5 + 172) |= 0x4000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(unsigned char *)(v5 + 166) = self->_wOWEnabled;
  *(void *)(v5 + 172) |= 0x80000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 152) = self->_wiFiRxRetry;
  *(void *)(v5 + 172) |= 0x800000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 92) = self->_lTEDataLQM;
  *(void *)(v5 + 172) |= 0x800uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 100) = self->_lTETxPower;
  *(void *)(v5 + 172) |= 0x2000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(unsigned char *)(v5 + 165) = self->_lTEQoSAvailable;
  *(void *)(v5 + 172) |= 0x40000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 64) = self->_bSSLoad;
  *(void *)(v5 + 172) |= 0x100uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 104) = self->_lTEVoiceLQM;
  *(void *)(v5 + 172) |= 0x4000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 96) = self->_lTESINR;
  *(void *)(v5 + 172) |= 0x1000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(void *)(v5 + 16) = self->_lTERSRP;
  *(void *)(v5 + 172) |= 2uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(void *)(v5 + 8) = self->_lTECTRSRP;
  *(void *)(v5 + 172) |= 1uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 136) = self->_signalBar;
  *(void *)(v5 + 172) |= 0x400000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 116) = self->_latteNominalJitterBufferSize;
  *(void *)(v5 + 172) |= 0x20000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v5 + 108) = self->_latteDejitterBufferUnderflow;
  *(void *)(v5 + 172) |= 0x8000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 120) = self->_latteRTPPacketLoss;
  *(void *)(v5 + 172) |= 0x40000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 112) = self->_latteErasures;
  *(void *)(v5 + 172) |= 0x10000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_63:
  *(unsigned char *)(v5 + 162) = self->_hOCapability;
  *(void *)(v5 + 172) |= 0x8000000uLL;
  if ((*(void *)&self->_has & 0x400) != 0)
  {
LABEL_25:
    *(_DWORD *)(v5 + 88) = self->_hOBool;
    *(void *)(v5 + 172) |= 0x400uLL;
  }
LABEL_26:

  *(void *)(v6 + 144) = [(NSString *)self->_wRMRecommendedRAT copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 3) & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 164) = self->_iWLANStatus;
    *(void *)(v6 + 172) |= 0x20000000uLL;
  }

  *(void *)(v6 + 80) = [(NSString *)self->_callId copyWithZone:a3];
  $E13B6317796A15400D7522EDCFAEA1D1 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    *(_DWORD *)(v6 + 132) = self->_sessionId;
    *(void *)(v6 + 172) |= 0x200000uLL;
    $E13B6317796A15400D7522EDCFAEA1D1 v8 = self->_has;
  }
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
    *(unsigned char *)(v6 + 163) = self->_iPSecTunnelStatus;
    *(void *)(v6 + 172) |= 0x10000000uLL;
  }

  *(void *)(v6 + 72) = [(NSString *)self->_callEndReason copyWithZone:a3];
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) != 0)
  {
    *(unsigned char *)(v6 + 160) = self->_aTMRegistrationState;
    *(void *)(v6 + 172) |= 0x2000000uLL;
    $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
    if ((*(unsigned char *)&v9 & 0x80) == 0)
    {
LABEL_34:
      if ((*(unsigned char *)&v9 & 0x40) == 0) {
        goto LABEL_35;
      }
      goto LABEL_67;
    }
  }
  else if ((*(unsigned char *)&v9 & 0x80) == 0)
  {
    goto LABEL_34;
  }
  *(_DWORD *)(v6 + 60) = self->_bBAudioPacketLoss;
  *(void *)(v6 + 172) |= 0x80uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) == 0)
  {
LABEL_35:
    if ((*(void *)&v9 & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v6 + 56) = self->_bBAudioErasures;
  *(void *)(v6 + 172) |= 0x40uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(void *)&v9 & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v9 & 0x80000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(unsigned char *)(v6 + 168) = self->_wiFiPreferred;
  *(void *)(v6 + 172) |= 0x200000000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v9 & 0x100000) == 0) {
      goto LABEL_38;
    }
LABEL_70:
    *(_DWORD *)(v6 + 128) = self->_servingCellSINR;
    *(void *)(v6 + 172) |= 0x100000uLL;
    if ((*(void *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_39;
  }
LABEL_69:
  *(_DWORD *)(v6 + 124) = self->_servingCellRAT;
  *(void *)(v6 + 172) |= 0x80000uLL;
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0) {
    goto LABEL_70;
  }
LABEL_38:
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
LABEL_39:
    *(void *)(v6 + 24) = self->_servingCellRSRP;
    *(void *)(v6 + 172) |= 4uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  uint64_t v7 = *(void *)((char *)a3 + 172);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_207;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_wiFiRSSI != *((void *)a3 + 5)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_wiFiTxPER != *((_DWORD *)a3 + 39)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_wiFiSINR != *((void *)a3 + 6)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_207;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0) {
      goto LABEL_207;
    }
    if (self->_wiFiBSSIDChange)
    {
      if (!*((unsigned char *)a3 + 167)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 167))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_beaconRate != *((_DWORD *)a3 + 17)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_207;
    }
    if (self->_captiveNetwork)
    {
      if (!*((unsigned char *)a3 + 161)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 161))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_207;
    }
    if (self->_wOWEnabled)
    {
      if (!*((unsigned char *)a3 + 166)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 166))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_wiFiRxRetry != *((_DWORD *)a3 + 38)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_lTEDataLQM != *((_DWORD *)a3 + 23)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_lTETxPower != *((_DWORD *)a3 + 25)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_207;
    }
    if (self->_lTEQoSAvailable)
    {
      if (!*((unsigned char *)a3 + 165)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 165))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_bSSLoad != *((_DWORD *)a3 + 16)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_lTEVoiceLQM != *((_DWORD *)a3 + 26)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_lTESINR != *((_DWORD *)a3 + 24)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lTERSRP != *((void *)a3 + 2)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_207;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_lTECTRSRP != *((void *)a3 + 1)) {
      goto LABEL_207;
    }
  }
  else if (v7)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_signalBar != *((_DWORD *)a3 + 34)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_latteNominalJitterBufferSize != *((_DWORD *)a3 + 29)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_latteDejitterBufferUnderflow != *((_DWORD *)a3 + 27)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_latteRTPPacketLoss != *((_DWORD *)a3 + 30)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_latteErasures != *((_DWORD *)a3 + 28)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_207;
    }
    if (self->_hOCapability)
    {
      if (!*((unsigned char *)a3 + 162)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 162))
    {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_hOBool != *((_DWORD *)a3 + 22)) {
      goto LABEL_207;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_207;
  }
  wRMRecommendedRAT = self->_wRMRecommendedRAT;
  if ((unint64_t)wRMRecommendedRAT | *((void *)a3 + 18))
  {
    int v5 = -[NSString isEqual:](wRMRecommendedRAT, "isEqual:");
    if (!v5) {
      return v5;
    }
    $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  }
  uint64_t v9 = *(void *)((char *)a3 + 172);
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v9 & 0x20000000) == 0) {
      goto LABEL_207;
    }
    if (self->_iWLANStatus)
    {
      if (!*((unsigned char *)a3 + 164)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 164))
    {
      goto LABEL_207;
    }
  }
  else if ((v9 & 0x20000000) != 0)
  {
    goto LABEL_207;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((void *)a3 + 10))
  {
    int v5 = -[NSString isEqual:](callId, "isEqual:");
    if (!v5) {
      return v5;
    }
    $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  }
  uint64_t v11 = *(void *)((char *)a3 + 172);
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0 || self->_sessionId != *((_DWORD *)a3 + 33)) {
      goto LABEL_207;
    }
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v11 & 0x10000000) == 0) {
      goto LABEL_207;
    }
    if (self->_iPSecTunnelStatus)
    {
      if (!*((unsigned char *)a3 + 163)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 163))
    {
      goto LABEL_207;
    }
  }
  else if ((v11 & 0x10000000) != 0)
  {
    goto LABEL_207;
  }
  callEndReason = self->_callEndReason;
  if ((unint64_t)callEndReason | *((void *)a3 + 9))
  {
    int v5 = -[NSString isEqual:](callEndReason, "isEqual:");
    if (!v5) {
      return v5;
    }
    $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  }
  uint64_t v13 = *(void *)((char *)a3 + 172);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v13 & 0x2000000) == 0) {
      goto LABEL_207;
    }
    if (self->_aTMRegistrationState)
    {
      if (!*((unsigned char *)a3 + 160)) {
        goto LABEL_207;
      }
    }
    else if (*((unsigned char *)a3 + 160))
    {
      goto LABEL_207;
    }
  }
  else if ((v13 & 0x2000000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_bBAudioPacketLoss != *((_DWORD *)a3 + 15)) {
      goto LABEL_207;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_207;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_bBAudioErasures != *((_DWORD *)a3 + 14)) {
      goto LABEL_207;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_207;
  }
  if ((*(void *)&has & 0x200000000) == 0)
  {
    if ((v13 & 0x200000000) != 0) {
      goto LABEL_207;
    }
    goto LABEL_193;
  }
  if ((v13 & 0x200000000) == 0) {
    goto LABEL_207;
  }
  if (self->_wiFiPreferred)
  {
    if (!*((unsigned char *)a3 + 168)) {
      goto LABEL_207;
    }
    goto LABEL_193;
  }
  if (*((unsigned char *)a3 + 168))
  {
LABEL_207:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_193:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v13 & 0x80000) == 0 || self->_servingCellRAT != *((_DWORD *)a3 + 31)) {
      goto LABEL_207;
    }
  }
  else if ((v13 & 0x80000) != 0)
  {
    goto LABEL_207;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v13 & 0x100000) == 0 || self->_servingCellSINR != *((_DWORD *)a3 + 32)) {
      goto LABEL_207;
    }
  }
  else if ((v13 & 0x100000) != 0)
  {
    goto LABEL_207;
  }
  LOBYTE(v5) = (*(void *)((unsigned char *)a3 + 172) & 4) == 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_servingCellRSRP != *((void *)a3 + 3)) {
      goto LABEL_207;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $E13B6317796A15400D7522EDCFAEA1D1 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    unint64_t v43 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v42 = 2654435761 * self->_wiFiRSSI;
      if ((*(_DWORD *)&has & 0x1000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else
  {
    unint64_t v43 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v42 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_4:
    uint64_t v41 = 2654435761 * self->_wiFiTxPER;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v41 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v40 = 2654435761 * self->_wiFiSINR;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v40 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_6:
    uint64_t v39 = 2654435761 * self->_wiFiBSSIDChange;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v39 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v38 = 2654435761 * self->_beaconRate;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v38 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_8:
    uint64_t v37 = 2654435761 * self->_captiveNetwork;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_9:
    uint64_t v36 = 2654435761 * self->_wOWEnabled;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_10:
    uint64_t v35 = 2654435761 * self->_wiFiRxRetry;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v35 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    uint64_t v34 = 2654435761 * self->_lTEDataLQM;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v34 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_12:
    uint64_t v33 = 2654435761 * self->_lTETxPower;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_13:
    uint64_t v32 = 2654435761 * self->_lTEQoSAvailable;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v32 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_14:
    uint64_t v31 = 2654435761 * self->_bSSLoad;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v31 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_15:
    uint64_t v30 = 2654435761 * self->_lTEVoiceLQM;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v30 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_16:
    uint64_t v29 = 2654435761 * self->_lTESINR;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v29 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_17:
    uint64_t v28 = 2654435761 * self->_lTERSRP;
    if (*(unsigned char *)&has) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v28 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_18:
    uint64_t v27 = 2654435761 * self->_lTECTRSRP;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_19:
    uint64_t v26 = 2654435761 * self->_signalBar;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_20:
    uint64_t v25 = 2654435761 * self->_latteNominalJitterBufferSize;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_21:
    uint64_t v24 = 2654435761 * self->_latteDejitterBufferUnderflow;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_22:
    uint64_t v23 = 2654435761 * self->_latteRTPPacketLoss;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_23:
    uint64_t v22 = 2654435761 * self->_latteErasures;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_24;
    }
LABEL_48:
    uint64_t v4 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
LABEL_47:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x8000000) == 0) {
    goto LABEL_48;
  }
LABEL_24:
  uint64_t v4 = 2654435761 * self->_hOCapability;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_25:
    uint64_t v5 = 2654435761 * self->_hOBool;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v5 = 0;
LABEL_50:
  NSUInteger v6 = [(NSString *)self->_wRMRecommendedRAT hash];
  if ((*((unsigned char *)&self->_has + 3) & 0x20) != 0) {
    uint64_t v7 = 2654435761 * self->_iWLANStatus;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_callId hash];
  $E13B6317796A15400D7522EDCFAEA1D1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
    uint64_t v10 = 2654435761 * self->_sessionId;
    if ((*(_DWORD *)&v9 & 0x10000000) != 0) {
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(_DWORD *)&v9 & 0x10000000) != 0)
    {
LABEL_55:
      uint64_t v11 = 2654435761 * self->_iPSecTunnelStatus;
      goto LABEL_58;
    }
  }
  uint64_t v11 = 0;
LABEL_58:
  NSUInteger v12 = [(NSString *)self->_callEndReason hash];
  $E13B6317796A15400D7522EDCFAEA1D1 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
    uint64_t v14 = 2654435761 * self->_aTMRegistrationState;
    if ((*(unsigned char *)&v13 & 0x80) != 0)
    {
LABEL_60:
      uint64_t v15 = 2654435761 * self->_bBAudioPacketLoss;
      if ((*(unsigned char *)&v13 & 0x40) != 0) {
        goto LABEL_61;
      }
      goto LABEL_68;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&v13 & 0x80) != 0) {
      goto LABEL_60;
    }
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
LABEL_61:
    uint64_t v16 = 2654435761 * self->_bBAudioErasures;
    if ((*(void *)&v13 & 0x200000000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v16 = 0;
  if ((*(void *)&v13 & 0x200000000) != 0)
  {
LABEL_62:
    uint64_t v17 = 2654435761 * self->_wiFiPreferred;
    if ((*(_DWORD *)&v13 & 0x80000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
LABEL_63:
    uint64_t v18 = 2654435761 * self->_servingCellRAT;
    if ((*(_DWORD *)&v13 & 0x100000) != 0) {
      goto LABEL_64;
    }
LABEL_71:
    uint64_t v19 = 0;
    if ((*(unsigned char *)&v13 & 4) != 0) {
      goto LABEL_65;
    }
LABEL_72:
    uint64_t v20 = 0;
    return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v7 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_70:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&v13 & 0x100000) == 0) {
    goto LABEL_71;
  }
LABEL_64:
  uint64_t v19 = 2654435761 * self->_servingCellSINR;
  if ((*(unsigned char *)&v13 & 4) == 0) {
    goto LABEL_72;
  }
LABEL_65:
  uint64_t v20 = 2654435761 * self->_servingCellRSRP;
  return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v7 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(void *)&self->_has |= 8uLL;
    uint64_t v5 = *(void *)((char *)a3 + 172);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_wiFiRSSI = *((void *)a3 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_wiFiTxPER = *((_DWORD *)a3 + 39);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_wiFiSINR = *((void *)a3 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_wiFiBSSIDChange = *((unsigned char *)a3 + 167);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_beaconRate = *((_DWORD *)a3 + 17);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_captiveNetwork = *((unsigned char *)a3 + 161);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_wOWEnabled = *((unsigned char *)a3 + 166);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x800000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_wiFiRxRetry = *((_DWORD *)a3 + 38);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_lTEDataLQM = *((_DWORD *)a3 + 23);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x2000) == 0)
  {
LABEL_12:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_lTETxPower = *((_DWORD *)a3 + 25);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_lTEQoSAvailable = *((unsigned char *)a3 + 165);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_bSSLoad = *((_DWORD *)a3 + 16);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x4000) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_lTEVoiceLQM = *((_DWORD *)a3 + 26);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_lTESINR = *((_DWORD *)a3 + 24);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v5 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_lTERSRP = *((void *)a3 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 1) == 0)
  {
LABEL_18:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_lTECTRSRP = *((void *)a3 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x400000) == 0)
  {
LABEL_19:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_signalBar = *((_DWORD *)a3 + 34);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x20000) == 0)
  {
LABEL_20:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_latteNominalJitterBufferSize = *((_DWORD *)a3 + 29);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x8000) == 0)
  {
LABEL_21:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_latteDejitterBufferUnderflow = *((_DWORD *)a3 + 27);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x40000) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_latteRTPPacketLoss = *((_DWORD *)a3 + 30);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x10000) == 0)
  {
LABEL_23:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_latteErasures = *((_DWORD *)a3 + 28);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 172);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_69:
  self->_hOCapability = *((unsigned char *)a3 + 162);
  *(void *)&self->_has |= 0x8000000uLL;
  if ((*(void *)((unsigned char *)a3 + 172) & 0x400) != 0)
  {
LABEL_25:
    self->_hOBool = *((_DWORD *)a3 + 22);
    *(void *)&self->_has |= 0x400uLL;
  }
LABEL_26:
  if (*((void *)a3 + 18)) {
    -[AWDWRMWiFiCallingEnd setWRMRecommendedRAT:](self, "setWRMRecommendedRAT:");
  }
  if ((*((unsigned char *)a3 + 175) & 0x20) != 0)
  {
    self->_iWLANStatus = *((unsigned char *)a3 + 164);
    *(void *)&self->_has |= 0x20000000uLL;
  }
  if (*((void *)a3 + 10)) {
    -[AWDWRMWiFiCallingEnd setCallId:](self, "setCallId:");
  }
  uint64_t v6 = *(void *)((char *)a3 + 172);
  if ((v6 & 0x200000) != 0)
  {
    self->_sessionId = *((_DWORD *)a3 + 33);
    *(void *)&self->_has |= 0x200000uLL;
    uint64_t v6 = *(void *)((char *)a3 + 172);
  }
  if ((v6 & 0x10000000) != 0)
  {
    self->_iPSecTunnelStatus = *((unsigned char *)a3 + 163);
    *(void *)&self->_has |= 0x10000000uLL;
  }
  if (*((void *)a3 + 9)) {
    -[AWDWRMWiFiCallingEnd setCallEndReason:](self, "setCallEndReason:");
  }
  uint64_t v7 = *(void *)((char *)a3 + 172);
  if ((v7 & 0x2000000) != 0)
  {
    self->_aTMRegistrationState = *((unsigned char *)a3 + 160);
    *(void *)&self->_has |= 0x2000000uLL;
    uint64_t v7 = *(void *)((char *)a3 + 172);
    if ((v7 & 0x80) == 0)
    {
LABEL_40:
      if ((v7 & 0x40) == 0) {
        goto LABEL_41;
      }
      goto LABEL_73;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_40;
  }
  self->_bBAudioPacketLoss = *((_DWORD *)a3 + 15);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v7 = *(void *)((char *)a3 + 172);
  if ((v7 & 0x40) == 0)
  {
LABEL_41:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_bBAudioErasures = *((_DWORD *)a3 + 14);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v7 = *(void *)((char *)a3 + 172);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x80000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_wiFiPreferred = *((unsigned char *)a3 + 168);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v7 = *(void *)((char *)a3 + 172);
  if ((v7 & 0x80000) == 0)
  {
LABEL_43:
    if ((v7 & 0x100000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_servingCellRAT = *((_DWORD *)a3 + 31);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v7 = *(void *)((char *)a3 + 172);
  if ((v7 & 0x100000) == 0)
  {
LABEL_44:
    if ((v7 & 4) == 0) {
      return;
    }
    goto LABEL_45;
  }
LABEL_76:
  self->_servingCellSINR = *((_DWORD *)a3 + 32);
  *(void *)&self->_has |= 0x100000uLL;
  if ((*(void *)((unsigned char *)a3 + 172) & 4) == 0) {
    return;
  }
LABEL_45:
  self->_servingCellRSRP = *((void *)a3 + 3);
  *(void *)&self->_has |= 4uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)wiFiRSSI
{
  return self->_wiFiRSSI;
}

- (unsigned)wiFiTxPER
{
  return self->_wiFiTxPER;
}

- (int64_t)wiFiSINR
{
  return self->_wiFiSINR;
}

- (BOOL)wiFiBSSIDChange
{
  return self->_wiFiBSSIDChange;
}

- (unsigned)beaconRate
{
  return self->_beaconRate;
}

- (BOOL)captiveNetwork
{
  return self->_captiveNetwork;
}

- (BOOL)wOWEnabled
{
  return self->_wOWEnabled;
}

- (unsigned)wiFiRxRetry
{
  return self->_wiFiRxRetry;
}

- (int)lTEDataLQM
{
  return self->_lTEDataLQM;
}

- (unsigned)lTETxPower
{
  return self->_lTETxPower;
}

- (BOOL)lTEQoSAvailable
{
  return self->_lTEQoSAvailable;
}

- (unsigned)bSSLoad
{
  return self->_bSSLoad;
}

- (int)lTEVoiceLQM
{
  return self->_lTEVoiceLQM;
}

- (int)lTESINR
{
  return self->_lTESINR;
}

- (int64_t)lTERSRP
{
  return self->_lTERSRP;
}

- (int64_t)lTECTRSRP
{
  return self->_lTECTRSRP;
}

- (unsigned)signalBar
{
  return self->_signalBar;
}

- (unsigned)latteNominalJitterBufferSize
{
  return self->_latteNominalJitterBufferSize;
}

- (unsigned)latteDejitterBufferUnderflow
{
  return self->_latteDejitterBufferUnderflow;
}

- (unsigned)latteRTPPacketLoss
{
  return self->_latteRTPPacketLoss;
}

- (unsigned)latteErasures
{
  return self->_latteErasures;
}

- (BOOL)hOCapability
{
  return self->_hOCapability;
}

- (unsigned)hOBool
{
  return self->_hOBool;
}

- (NSString)wRMRecommendedRAT
{
  return self->_wRMRecommendedRAT;
}

- (void)setWRMRecommendedRAT:(id)a3
{
}

- (BOOL)iWLANStatus
{
  return self->_iWLANStatus;
}

- (NSString)callId
{
  return self->_callId;
}

- (void)setCallId:(id)a3
{
}

- (unsigned)sessionId
{
  return self->_sessionId;
}

- (BOOL)iPSecTunnelStatus
{
  return self->_iPSecTunnelStatus;
}

- (NSString)callEndReason
{
  return self->_callEndReason;
}

- (void)setCallEndReason:(id)a3
{
}

- (BOOL)aTMRegistrationState
{
  return self->_aTMRegistrationState;
}

- (unsigned)bBAudioPacketLoss
{
  return self->_bBAudioPacketLoss;
}

- (unsigned)bBAudioErasures
{
  return self->_bBAudioErasures;
}

- (BOOL)wiFiPreferred
{
  return self->_wiFiPreferred;
}

- (unsigned)servingCellRAT
{
  return self->_servingCellRAT;
}

- (int)servingCellSINR
{
  return self->_servingCellSINR;
}

- (int64_t)servingCellRSRP
{
  return self->_servingCellRSRP;
}

@end