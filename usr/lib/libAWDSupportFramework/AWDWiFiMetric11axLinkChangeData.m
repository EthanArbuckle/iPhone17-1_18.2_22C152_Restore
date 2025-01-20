@interface AWDWiFiMetric11axLinkChangeData
- (BOOL)hasAkmSuites;
- (BOOL)hasCapabilities;
- (BOOL)hasChannel;
- (BOOL)hasChannelWidth;
- (BOOL)hasEnhancedSecurityType;
- (BOOL)hasFlags;
- (BOOL)hasGatewayARPHistory;
- (BOOL)hasHeBEParamRecord;
- (BOOL)hasHeBKParamRecord;
- (BOOL)hasHeBSSLoadIE;
- (BOOL)hasHeBssMcsNss;
- (BOOL)hasHeCapabilitiesIE;
- (BOOL)hasHeMacCapSubfields;
- (BOOL)hasHeOperationIE;
- (BOOL)hasHeOpsParams;
- (BOOL)hasHePhyCapSubfields;
- (BOOL)hasHeRxTxMcsMap;
- (BOOL)hasHeStaCnt;
- (BOOL)hasHeUtilization;
- (BOOL)hasHeVIParamRecord;
- (BOOL)hasHeVOParamRecord;
- (BOOL)hasHtASel;
- (BOOL)hasHtAmpduParams;
- (BOOL)hasHtExtended;
- (BOOL)hasHtInfo;
- (BOOL)hasHtSupportedMcsSet;
- (BOOL)hasHtTxBf;
- (BOOL)hasIsInVol;
- (BOOL)hasIsLinkUp;
- (BOOL)hasMcastCipher;
- (BOOL)hasMuEDCAParametersIE;
- (BOOL)hasOui;
- (BOOL)hasPhyMode;
- (BOOL)hasReason;
- (BOOL)hasSecurityType;
- (BOOL)hasSubreason;
- (BOOL)hasTimestamp;
- (BOOL)hasUcastCipher;
- (BOOL)hasVhtInfo;
- (BOOL)hasVhtSupportedMcsSet;
- (BOOL)hasWpaProtocol;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInVol;
- (BOOL)isLinkUp;
- (BOOL)readFrom:(id)a3;
- (NSData)heBSSLoadIE;
- (NSData)heCapabilitiesIE;
- (NSData)heOperationIE;
- (NSData)htSupportedMcsSet;
- (NSData)muEDCAParametersIE;
- (NSData)oui;
- (NSData)vhtSupportedMcsSet;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)bcnFrmsHistoryAtIndex:(unint64_t)a3;
- (int)bcnFrmsHistorys;
- (int)bcnPerHistoryAtIndex:(unint64_t)a3;
- (int)bcnPerHistorys;
- (int)fwTxFrmsHistoryAtIndex:(unint64_t)a3;
- (int)fwTxFrmsHistorys;
- (int)fwTxPerHistoryAtIndex:(unint64_t)a3;
- (int)fwTxPerHistorys;
- (int)rssiHistoryAtIndex:(unint64_t)a3;
- (int)rssiHistorys;
- (int)txFrmsHistoryAtIndex:(unint64_t)a3;
- (int)txFrmsHistorys;
- (int)txPerHistoryAtIndex:(unint64_t)a3;
- (int)txPerHistorys;
- (unint64_t)bcnFrmsHistorysCount;
- (unint64_t)bcnPerHistorysCount;
- (unint64_t)fwTxFrmsHistorysCount;
- (unint64_t)fwTxPerHistorysCount;
- (unint64_t)hash;
- (unint64_t)rssiHistorysCount;
- (unint64_t)timestamp;
- (unint64_t)txFrmsHistorysCount;
- (unint64_t)txPerHistorysCount;
- (unsigned)akmSuites;
- (unsigned)capabilities;
- (unsigned)channel;
- (unsigned)channelWidth;
- (unsigned)enhancedSecurityType;
- (unsigned)flags;
- (unsigned)gatewayARPHistory;
- (unsigned)heBEParamRecord;
- (unsigned)heBKParamRecord;
- (unsigned)heBssMcsNss;
- (unsigned)heMacCapSubfields;
- (unsigned)heOpsParams;
- (unsigned)hePhyCapSubfields;
- (unsigned)heRxTxMcsMap;
- (unsigned)heStaCnt;
- (unsigned)heUtilization;
- (unsigned)heVIParamRecord;
- (unsigned)heVOParamRecord;
- (unsigned)htASel;
- (unsigned)htAmpduParams;
- (unsigned)htExtended;
- (unsigned)htInfo;
- (unsigned)htTxBf;
- (unsigned)mcastCipher;
- (unsigned)phyMode;
- (unsigned)reason;
- (unsigned)securityType;
- (unsigned)subreason;
- (unsigned)ucastCipher;
- (unsigned)vhtInfo;
- (unsigned)wpaProtocol;
- (void)addBcnFrmsHistory:(int)a3;
- (void)addBcnPerHistory:(int)a3;
- (void)addFwTxFrmsHistory:(int)a3;
- (void)addFwTxPerHistory:(int)a3;
- (void)addRssiHistory:(int)a3;
- (void)addTxFrmsHistory:(int)a3;
- (void)addTxPerHistory:(int)a3;
- (void)clearBcnFrmsHistorys;
- (void)clearBcnPerHistorys;
- (void)clearFwTxFrmsHistorys;
- (void)clearFwTxPerHistorys;
- (void)clearRssiHistorys;
- (void)clearTxFrmsHistorys;
- (void)clearTxPerHistorys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAkmSuites:(unsigned int)a3;
- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setBcnPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setCapabilities:(unsigned int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setChannelWidth:(unsigned int)a3;
- (void)setEnhancedSecurityType:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFwTxFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setFwTxPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setGatewayARPHistory:(unsigned int)a3;
- (void)setHasAkmSuites:(BOOL)a3;
- (void)setHasCapabilities:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasChannelWidth:(BOOL)a3;
- (void)setHasEnhancedSecurityType:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasGatewayARPHistory:(BOOL)a3;
- (void)setHasHeBEParamRecord:(BOOL)a3;
- (void)setHasHeBKParamRecord:(BOOL)a3;
- (void)setHasHeBssMcsNss:(BOOL)a3;
- (void)setHasHeMacCapSubfields:(BOOL)a3;
- (void)setHasHeOpsParams:(BOOL)a3;
- (void)setHasHePhyCapSubfields:(BOOL)a3;
- (void)setHasHeRxTxMcsMap:(BOOL)a3;
- (void)setHasHeStaCnt:(BOOL)a3;
- (void)setHasHeUtilization:(BOOL)a3;
- (void)setHasHeVIParamRecord:(BOOL)a3;
- (void)setHasHeVOParamRecord:(BOOL)a3;
- (void)setHasHtASel:(BOOL)a3;
- (void)setHasHtAmpduParams:(BOOL)a3;
- (void)setHasHtExtended:(BOOL)a3;
- (void)setHasHtInfo:(BOOL)a3;
- (void)setHasHtTxBf:(BOOL)a3;
- (void)setHasIsInVol:(BOOL)a3;
- (void)setHasIsLinkUp:(BOOL)a3;
- (void)setHasMcastCipher:(BOOL)a3;
- (void)setHasPhyMode:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasSubreason:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUcastCipher:(BOOL)a3;
- (void)setHasVhtInfo:(BOOL)a3;
- (void)setHasWpaProtocol:(BOOL)a3;
- (void)setHeBEParamRecord:(unsigned int)a3;
- (void)setHeBKParamRecord:(unsigned int)a3;
- (void)setHeBSSLoadIE:(id)a3;
- (void)setHeBssMcsNss:(unsigned int)a3;
- (void)setHeCapabilitiesIE:(id)a3;
- (void)setHeMacCapSubfields:(unsigned int)a3;
- (void)setHeOperationIE:(id)a3;
- (void)setHeOpsParams:(unsigned int)a3;
- (void)setHePhyCapSubfields:(unsigned int)a3;
- (void)setHeRxTxMcsMap:(unsigned int)a3;
- (void)setHeStaCnt:(unsigned int)a3;
- (void)setHeUtilization:(unsigned int)a3;
- (void)setHeVIParamRecord:(unsigned int)a3;
- (void)setHeVOParamRecord:(unsigned int)a3;
- (void)setHtASel:(unsigned int)a3;
- (void)setHtAmpduParams:(unsigned int)a3;
- (void)setHtExtended:(unsigned int)a3;
- (void)setHtInfo:(unsigned int)a3;
- (void)setHtSupportedMcsSet:(id)a3;
- (void)setHtTxBf:(unsigned int)a3;
- (void)setIsInVol:(BOOL)a3;
- (void)setIsLinkUp:(BOOL)a3;
- (void)setMcastCipher:(unsigned int)a3;
- (void)setMuEDCAParametersIE:(id)a3;
- (void)setOui:(id)a3;
- (void)setPhyMode:(unsigned int)a3;
- (void)setReason:(unsigned int)a3;
- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setSecurityType:(unsigned int)a3;
- (void)setSubreason:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setTxPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setUcastCipher:(unsigned int)a3;
- (void)setVhtInfo:(unsigned int)a3;
- (void)setVhtSupportedMcsSet:(id)a3;
- (void)setWpaProtocol:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetric11axLinkChangeData

- (void)dealloc
{
  PBRepeatedInt32Clear();
  [(AWDWiFiMetric11axLinkChangeData *)self setOui:0];
  [(AWDWiFiMetric11axLinkChangeData *)self setHtSupportedMcsSet:0];
  [(AWDWiFiMetric11axLinkChangeData *)self setVhtSupportedMcsSet:0];
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  [(AWDWiFiMetric11axLinkChangeData *)self setHeCapabilitiesIE:0];
  [(AWDWiFiMetric11axLinkChangeData *)self setHeOperationIE:0];
  [(AWDWiFiMetric11axLinkChangeData *)self setHeBSSLoadIE:0];
  [(AWDWiFiMetric11axLinkChangeData *)self setMuEDCAParametersIE:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetric11axLinkChangeData;
  [(AWDWiFiMetric11axLinkChangeData *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (unint64_t)rssiHistorysCount
{
  return self->_rssiHistorys.count;
}

- (int)rssiHistorys
{
  return self->_rssiHistorys.list;
}

- (void)clearRssiHistorys
{
}

- (void)addRssiHistory:(int)a3
{
}

- (int)rssiHistoryAtIndex:(unint64_t)a3
{
  p_rssiHistorys = &self->_rssiHistorys;
  unint64_t count = self->_rssiHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_rssiHistorys->list[a3];
}

- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (void)setIsLinkUp:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_isLinkUp = a3;
}

- (void)setHasIsLinkUp:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsLinkUp
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsInVol:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_isInVol = a3;
}

- (void)setHasIsInVol:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsInVol
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setReason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSubreason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_subreason = a3;
}

- (void)setHasSubreason:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSubreason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasChannelWidth
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPhyMode:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setFlags:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasFlags
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setWpaProtocol:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_wpaProtocol = a3;
}

- (void)setHasWpaProtocol:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasWpaProtocol
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMcastCipher:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_mcastCipher = a3;
}

- (void)setHasMcastCipher:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMcastCipher
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setUcastCipher:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_ucastCipher = a3;
}

- (void)setHasUcastCipher:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasUcastCipher
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setAkmSuites:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_akmSuites = a3;
}

- (void)setHasAkmSuites:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAkmSuites
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCapabilities:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCapabilities
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEnhancedSecurityType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_enhancedSecurityType = a3;
}

- (void)setHasEnhancedSecurityType:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasEnhancedSecurityType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHtInfo:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_htInfo = a3;
}

- (void)setHasHtInfo:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasHtInfo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHtExtended:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_htExtended = a3;
}

- (void)setHasHtExtended:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasHtExtended
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHtTxBf:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_htTxBf = a3;
}

- (void)setHasHtTxBf:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasHtTxBf
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHtASel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_htASel = a3;
}

- (void)setHasHtASel:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasHtASel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHtAmpduParams:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_htAmpduParams = a3;
}

- (void)setHasHtAmpduParams:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasHtAmpduParams
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasHtSupportedMcsSet
{
  return self->_htSupportedMcsSet != 0;
}

- (void)setVhtInfo:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_vhtInfo = a3;
}

- (void)setHasVhtInfo:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasVhtInfo
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (BOOL)hasVhtSupportedMcsSet
{
  return self->_vhtSupportedMcsSet != 0;
}

- (unint64_t)txPerHistorysCount
{
  return self->_txPerHistorys.count;
}

- (int)txPerHistorys
{
  return self->_txPerHistorys.list;
}

- (void)clearTxPerHistorys
{
}

- (void)addTxPerHistory:(int)a3
{
}

- (int)txPerHistoryAtIndex:(unint64_t)a3
{
  p_txPerHistorys = &self->_txPerHistorys;
  unint64_t count = self->_txPerHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_txPerHistorys->list[a3];
}

- (void)setTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txFrmsHistorysCount
{
  return self->_txFrmsHistorys.count;
}

- (int)txFrmsHistorys
{
  return self->_txFrmsHistorys.list;
}

- (void)clearTxFrmsHistorys
{
}

- (void)addTxFrmsHistory:(int)a3
{
}

- (int)txFrmsHistoryAtIndex:(unint64_t)a3
{
  p_txFrmsHistorys = &self->_txFrmsHistorys;
  unint64_t count = self->_txFrmsHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], raise];
  }
  return p_txFrmsHistorys->list[a3];
}

- (void)setTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)fwTxPerHistorysCount
{
  return self->_fwTxPerHistorys.count;
}

- (int)fwTxPerHistorys
{
  return self->_fwTxPerHistorys.list;
}

- (void)clearFwTxPerHistorys
{
}

- (void)addFwTxPerHistory:(int)a3
{
}

- (int)fwTxPerHistoryAtIndex:(unint64_t)a3
{
  p_fwTxPerHistorys = &self->_fwTxPerHistorys;
  unint64_t count = self->_fwTxPerHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_fwTxPerHistorys->list[a3];
}

- (void)setFwTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)fwTxFrmsHistorysCount
{
  return self->_fwTxFrmsHistorys.count;
}

- (int)fwTxFrmsHistorys
{
  return self->_fwTxFrmsHistorys.list;
}

- (void)clearFwTxFrmsHistorys
{
}

- (void)addFwTxFrmsHistory:(int)a3
{
}

- (int)fwTxFrmsHistoryAtIndex:(unint64_t)a3
{
  p_fwTxFrmsHistorys = &self->_fwTxFrmsHistorys;
  unint64_t count = self->_fwTxFrmsHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_fwTxFrmsHistorys->list[a3];
}

- (void)setFwTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bcnPerHistorysCount
{
  return self->_bcnPerHistorys.count;
}

- (int)bcnPerHistorys
{
  return self->_bcnPerHistorys.list;
}

- (void)clearBcnPerHistorys
{
}

- (void)addBcnPerHistory:(int)a3
{
}

- (int)bcnPerHistoryAtIndex:(unint64_t)a3
{
  p_bcnPerHistorys = &self->_bcnPerHistorys;
  unint64_t count = self->_bcnPerHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_bcnPerHistorys->list[a3];
}

- (void)setBcnPerHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bcnFrmsHistorysCount
{
  return self->_bcnFrmsHistorys.count;
}

- (int)bcnFrmsHistorys
{
  return self->_bcnFrmsHistorys.list;
}

- (void)clearBcnFrmsHistorys
{
}

- (void)addBcnFrmsHistory:(int)a3
{
}

- (int)bcnFrmsHistoryAtIndex:(unint64_t)a3
{
  p_bcnFrmsHistorys = &self->_bcnFrmsHistorys;
  unint64_t count = self->_bcnFrmsHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_bcnFrmsHistorys->list[a3];
}

- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (void)setGatewayARPHistory:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_gatewayARPHistory = a3;
}

- (void)setHasGatewayARPHistory:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasGatewayARPHistory
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasHeCapabilitiesIE
{
  return self->_heCapabilitiesIE != 0;
}

- (BOOL)hasHeOperationIE
{
  return self->_heOperationIE != 0;
}

- (BOOL)hasHeBSSLoadIE
{
  return self->_heBSSLoadIE != 0;
}

- (BOOL)hasMuEDCAParametersIE
{
  return self->_muEDCAParametersIE != 0;
}

- (void)setHeMacCapSubfields:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_heMacCapSubfields = a3;
}

- (void)setHasHeMacCapSubfields:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasHeMacCapSubfields
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHePhyCapSubfields:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_hePhyCapSubfields = a3;
}

- (void)setHasHePhyCapSubfields:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasHePhyCapSubfields
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHeRxTxMcsMap:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_heRxTxMcsMap = a3;
}

- (void)setHasHeRxTxMcsMap:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasHeRxTxMcsMap
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHeOpsParams:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_heOpsParams = a3;
}

- (void)setHasHeOpsParams:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasHeOpsParams
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHeBssMcsNss:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_heBssMcsNss = a3;
}

- (void)setHasHeBssMcsNss:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasHeBssMcsNss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHeStaCnt:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_heStaCnt = a3;
}

- (void)setHasHeStaCnt:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasHeStaCnt
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHeUtilization:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_heUtilization = a3;
}

- (void)setHasHeUtilization:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasHeUtilization
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHeBEParamRecord:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_heBEParamRecord = a3;
}

- (void)setHasHeBEParamRecord:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasHeBEParamRecord
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHeBKParamRecord:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_heBKParamRecord = a3;
}

- (void)setHasHeBKParamRecord:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasHeBKParamRecord
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHeVIParamRecord:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_heVIParamRecord = a3;
}

- (void)setHasHeVIParamRecord:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasHeVIParamRecord
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHeVOParamRecord:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_heVOParamRecord = a3;
}

- (void)setHasHeVOParamRecord:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($1830DFFC7F3C793B1FB608FDA3AB4356)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasHeVOParamRecord
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetric11axLinkChangeData;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetric11axLinkChangeData description](&v3, sel_description), -[AWDWiFiMetric11axLinkChangeData dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"rssiHistory"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(void *)&has & 0x200000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_isLinkUp] forKey:@"isLinkUp"];
    $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_58;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_isInVol] forKey:@"isInVol"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reason] forKey:@"reason"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_subreason] forKey:@"subreason"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelWidth] forKey:@"channelWidth"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_phyMode] forKey:@"phyMode"];
  if ((*(void *)&self->_has & 0x40) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_flags] forKey:@"flags"];
LABEL_12:
  oui = self->_oui;
  if (oui) {
    [v3 setObject:oui forKey:@"oui"];
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
    $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wpaProtocol] forKey:@"wpaProtocol"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mcastCipher] forKey:@"mcastCipher"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ucastCipher] forKey:@"ucastCipher"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_akmSuites] forKey:@"akmSuites"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_capabilities] forKey:@"capabilities"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_enhancedSecurityType] forKey:@"enhancedSecurityType"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htInfo] forKey:@"htInfo"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htExtended] forKey:@"htExtended"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htTxBf] forKey:@"htTxBf"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htASel] forKey:@"htASel"];
  if ((*(void *)&self->_has & 0x100000) != 0) {
LABEL_26:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htAmpduParams] forKey:@"htAmpduParams"];
LABEL_27:
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if (htSupportedMcsSet) {
    [v3 setObject:htSupportedMcsSet forKey:@"htSupportedMcsSet"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x40) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_vhtInfo] forKey:@"vhtInfo"];
  }
  vhtSupportedMcsSet = self->_vhtSupportedMcsSet;
  if (vhtSupportedMcsSet) {
    [v3 setObject:vhtSupportedMcsSet forKey:@"vhtSupportedMcsSet"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"txPerHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"txFrmsHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"fwTxPerHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"fwTxFrmsHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"bcnPerHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"bcnFrmsHistory"];
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_gatewayARPHistory] forKey:@"gatewayARPHistory"];
  }
  heCapabilitiesIE = self->_heCapabilitiesIE;
  if (heCapabilitiesIE) {
    [v3 setObject:heCapabilitiesIE forKey:@"heCapabilitiesIE"];
  }
  heOperationIE = self->_heOperationIE;
  if (heOperationIE) {
    [v3 setObject:heOperationIE forKey:@"heOperationIE"];
  }
  heBSSLoadIE = self->_heBSSLoadIE;
  if (heBSSLoadIE) {
    [v3 setObject:heBSSLoadIE forKey:@"heBSSLoadIE"];
  }
  muEDCAParametersIE = self->_muEDCAParametersIE;
  if (muEDCAParametersIE) {
    [v3 setObject:muEDCAParametersIE forKey:@"muEDCAParametersIE"];
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heMacCapSubfields] forKey:@"heMacCapSubfields"];
    $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_45:
      if ((*(_WORD *)&v13 & 0x4000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_78;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_45;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_hePhyCapSubfields] forKey:@"hePhyCapSubfields"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v13 & 0x1000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heRxTxMcsMap] forKey:@"heRxTxMcsMap"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOpsParams] forKey:@"heOpsParams"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heBssMcsNss] forKey:@"heBssMcsNss"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heStaCnt] forKey:@"heStaCnt"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v13 & 0x100) == 0) {
      goto LABEL_51;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heUtilization] forKey:@"heUtilization"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_52;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heBEParamRecord] forKey:@"heBEParamRecord"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v13 & 0x20000) == 0) {
      goto LABEL_53;
    }
LABEL_85:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heVIParamRecord] forKey:@"heVIParamRecord"];
    if ((*(void *)&self->_has & 0x40000) == 0) {
      return v3;
    }
    goto LABEL_54;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heBKParamRecord] forKey:@"heBKParamRecord"];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) != 0) {
    goto LABEL_85;
  }
LABEL_53:
  if ((*(_DWORD *)&v13 & 0x40000) != 0) {
LABEL_54:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heVOParamRecord] forKey:@"heVOParamRecord"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetric11axLinkChangeDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_rssiHistorys.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_rssiHistorys.count);
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(void *)&has & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_78;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x40) != 0) {
LABEL_14:
  }
    PBDataWriterWriteUint32Field();
LABEL_15:
  if (self->_oui) {
    PBDataWriterWriteDataField();
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
    {
LABEL_19:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x100000) != 0) {
LABEL_29:
  }
    PBDataWriterWriteUint32Field();
LABEL_30:
  if (self->_htSupportedMcsSet) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_vhtSupportedMcsSet) {
    PBDataWriterWriteDataField();
  }
  if (self->_txPerHistorys.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_txPerHistorys.count);
  }
  if (self->_txFrmsHistorys.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_txFrmsHistorys.count);
  }
  if (self->_fwTxPerHistorys.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_fwTxPerHistorys.count);
  }
  if (self->_fwTxFrmsHistorys.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_fwTxFrmsHistorys.count);
  }
  if (self->_bcnPerHistorys.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_bcnPerHistorys.count);
  }
  if (self->_bcnFrmsHistorys.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_bcnFrmsHistorys.count);
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_heCapabilitiesIE) {
    PBDataWriterWriteDataField();
  }
  if (self->_heOperationIE) {
    PBDataWriterWriteDataField();
  }
  if (self->_heBSSLoadIE) {
    PBDataWriterWriteDataField();
  }
  if (self->_muEDCAParametersIE) {
    PBDataWriterWriteDataField();
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_66:
      if ((*(_WORD *)&v13 & 0x4000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v13 & 0x1000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_68:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_69;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_69:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v13 & 0x100) == 0) {
      goto LABEL_72;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_73;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v13 & 0x20000) == 0) {
      goto LABEL_74;
    }
LABEL_105:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_has & 0x40000) == 0) {
      return;
    }
    goto LABEL_106;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) != 0) {
    goto LABEL_105;
  }
LABEL_74:
  if ((*(_DWORD *)&v13 & 0x40000) == 0) {
    return;
  }
LABEL_106:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 22) = self->_timestamp;
    *((void *)a3 + 48) |= 1uLL;
  }
  if ([(AWDWiFiMetric11axLinkChangeData *)self rssiHistorysCount])
  {
    [a3 clearRssiHistorys];
    unint64_t v5 = [(AWDWiFiMetric11axLinkChangeData *)self rssiHistorysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRssiHistory:-[AWDWiFiMetric11axLinkChangeData rssiHistoryAtIndex:](self, "rssiHistoryAtIndex:", i)];
    }
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(void *)&has & 0x200000000) != 0)
  {
    *((unsigned char *)a3 + 381) = self->_isLinkUp;
    *((void *)a3 + 48) |= 0x200000000uLL;
    $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_86;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)a3 + 380) = self->_isInVol;
  *((void *)a3 + 48) |= 0x100000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)a3 + 87) = self->_reason;
  *((void *)a3 + 48) |= 0x4000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 89) = self->_subreason;
  *((void *)a3 + 48) |= 0x10000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)a3 + 48) = self->_channel;
  *((void *)a3 + 48) |= 8uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 49) = self->_channelWidth;
  *((void *)a3 + 48) |= 0x10uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_90:
  *((_DWORD *)a3 + 86) = self->_phyMode;
  *((void *)a3 + 48) |= 0x2000000uLL;
  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 51) = self->_flags;
    *((void *)a3 + 48) |= 0x40uLL;
  }
LABEL_16:
  if (self->_oui) {
    [a3 setOui:];
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
    *((_DWORD *)a3 + 88) = self->_securityType;
    *((void *)a3 + 48) |= 0x8000000uLL;
    $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x80000000) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_94;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)a3 + 94) = self->_wpaProtocol;
  *((void *)a3 + 48) |= 0x80000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v9 & 0x20000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)a3 + 81) = self->_mcastCipher;
  *((void *)a3 + 48) |= 0x1000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v9 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)a3 + 90) = self->_ucastCipher;
  *((void *)a3 + 48) |= 0x20000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 2) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v9 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 46) = self->_akmSuites;
  *((void *)a3 + 48) |= 2uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v9 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 47) = self->_capabilities;
  *((void *)a3 + 48) |= 4uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x400000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 50) = self->_enhancedSecurityType;
  *((void *)a3 + 48) |= 0x20uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x200000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)a3 + 76) = self->_htInfo;
  *((void *)a3 + 48) |= 0x400000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x800000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)a3 + 75) = self->_htExtended;
  *((void *)a3 + 48) |= 0x200000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)a3 + 80) = self->_htTxBf;
  *((void *)a3 + 48) |= 0x800000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_102:
  *((_DWORD *)a3 + 73) = self->_htASel;
  *((void *)a3 + 48) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x100000) != 0)
  {
LABEL_30:
    *((_DWORD *)a3 + 74) = self->_htAmpduParams;
    *((void *)a3 + 48) |= 0x100000uLL;
  }
LABEL_31:
  if (self->_htSupportedMcsSet) {
    [a3 setHtSupportedMcsSet:];
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x40) != 0)
  {
    *((_DWORD *)a3 + 91) = self->_vhtInfo;
    *((void *)a3 + 48) |= 0x40000000uLL;
  }
  if (self->_vhtSupportedMcsSet) {
    [a3 setVhtSupportedMcsSet:];
  }
  if ([(AWDWiFiMetric11axLinkChangeData *)self txPerHistorysCount])
  {
    [a3 clearTxPerHistorys];
    unint64_t v10 = [(AWDWiFiMetric11axLinkChangeData *)self txPerHistorysCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addTxPerHistory:-[AWDWiFiMetric11axLinkChangeData txPerHistoryAtIndex:](self, "txPerHistoryAtIndex:", j)];
    }
  }
  if ([(AWDWiFiMetric11axLinkChangeData *)self txFrmsHistorysCount])
  {
    [a3 clearTxFrmsHistorys];
    unint64_t v13 = [(AWDWiFiMetric11axLinkChangeData *)self txFrmsHistorysCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        [a3 addTxFrmsHistory:-[AWDWiFiMetric11axLinkChangeData txFrmsHistoryAtIndex:](self, "txFrmsHistoryAtIndex:", k)];
    }
  }
  if ([(AWDWiFiMetric11axLinkChangeData *)self fwTxPerHistorysCount])
  {
    [a3 clearFwTxPerHistorys];
    unint64_t v16 = [(AWDWiFiMetric11axLinkChangeData *)self fwTxPerHistorysCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [a3 addFwTxPerHistory:-[AWDWiFiMetric11axLinkChangeData fwTxPerHistoryAtIndex:](self, "fwTxPerHistoryAtIndex:", m)];
    }
  }
  if ([(AWDWiFiMetric11axLinkChangeData *)self fwTxFrmsHistorysCount])
  {
    [a3 clearFwTxFrmsHistorys];
    unint64_t v19 = [(AWDWiFiMetric11axLinkChangeData *)self fwTxFrmsHistorysCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [a3 addFwTxFrmsHistory:-[AWDWiFiMetric11axLinkChangeData fwTxFrmsHistoryAtIndex:](self, "fwTxFrmsHistoryAtIndex:", n)];
    }
  }
  if ([(AWDWiFiMetric11axLinkChangeData *)self bcnPerHistorysCount])
  {
    [a3 clearBcnPerHistorys];
    unint64_t v22 = [(AWDWiFiMetric11axLinkChangeData *)self bcnPerHistorysCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
        [a3 addBcnPerHistory:-[AWDWiFiMetric11axLinkChangeData bcnPerHistoryAtIndex:](self, "bcnPerHistoryAtIndex:", ii)];
    }
  }
  if ([(AWDWiFiMetric11axLinkChangeData *)self bcnFrmsHistorysCount])
  {
    [a3 clearBcnFrmsHistorys];
    unint64_t v25 = [(AWDWiFiMetric11axLinkChangeData *)self bcnFrmsHistorysCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (juint64_t j = 0; jj != v26; ++jj)
        [a3 addBcnFrmsHistory:-[AWDWiFiMetric11axLinkChangeData bcnFrmsHistoryAtIndex:](self, "bcnFrmsHistoryAtIndex:", jj)];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)a3 + 52) = self->_gatewayARPHistory;
    *((void *)a3 + 48) |= 0x80uLL;
  }
  if (self->_heCapabilitiesIE) {
    [a3 setHeCapabilitiesIE:];
  }
  if (self->_heOperationIE) {
    [a3 setHeOperationIE:];
  }
  if (self->_heBSSLoadIE) {
    [a3 setHeBSSLoadIE:];
  }
  if (self->_muEDCAParametersIE) {
    [a3 setMuEDCAParametersIE];
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x800) != 0)
  {
    *((_DWORD *)a3 + 62) = self->_heMacCapSubfields;
    *((void *)a3 + 48) |= 0x800uLL;
    $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
    if ((*(_WORD *)&v28 & 0x2000) == 0)
    {
LABEL_73:
      if ((*(_WORD *)&v28 & 0x4000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_106;
    }
  }
  else if ((*(_WORD *)&v28 & 0x2000) == 0)
  {
    goto LABEL_73;
  }
  *((_DWORD *)a3 + 67) = self->_hePhyCapSubfields;
  *((void *)a3 + 48) |= 0x2000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x4000) == 0)
  {
LABEL_74:
    if ((*(_WORD *)&v28 & 0x1000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)a3 + 68) = self->_heRxTxMcsMap;
  *((void *)a3 + 48) |= 0x4000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x1000) == 0)
  {
LABEL_75:
    if ((*(_WORD *)&v28 & 0x400) == 0) {
      goto LABEL_76;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)a3 + 66) = self->_heOpsParams;
  *((void *)a3 + 48) |= 0x1000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x400) == 0)
  {
LABEL_76:
    if ((*(_WORD *)&v28 & 0x8000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)a3 + 58) = self->_heBssMcsNss;
  *((void *)a3 + 48) |= 0x400uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x8000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v28 & 0x10000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)a3 + 69) = self->_heStaCnt;
  *((void *)a3 + 48) |= 0x8000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x10000) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v28 & 0x100) == 0) {
      goto LABEL_79;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 70) = self->_heUtilization;
  *((void *)a3 + 48) |= 0x10000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x100) == 0)
  {
LABEL_79:
    if ((*(_WORD *)&v28 & 0x200) == 0) {
      goto LABEL_80;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)a3 + 53) = self->_heBEParamRecord;
  *((void *)a3 + 48) |= 0x100uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x200) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v28 & 0x20000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)a3 + 54) = self->_heBKParamRecord;
  *((void *)a3 + 48) |= 0x200uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x20000) == 0)
  {
LABEL_81:
    if ((*(_DWORD *)&v28 & 0x40000) == 0) {
      return;
    }
    goto LABEL_82;
  }
LABEL_113:
  *((_DWORD *)a3 + 71) = self->_heVIParamRecord;
  *((void *)a3 + 48) |= 0x20000uLL;
  if ((*(void *)&self->_has & 0x40000) == 0) {
    return;
  }
LABEL_82:
  *((_DWORD *)a3 + 72) = self->_heVOParamRecord;
  *((void *)a3 + 48) |= 0x40000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 176) = self->_timestamp;
    *(void *)(v5 + 384) |= 1uLL;
  }
  PBRepeatedInt32Copy();
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(void *)&has & 0x200000000) != 0)
  {
    *(unsigned char *)(v6 + 381) = self->_isLinkUp;
    *(void *)(v6 + 384) |= 0x200000000uLL;
    $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
    if ((*(void *)&has & 0x100000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_44;
    }
  }
  else if ((*(void *)&has & 0x100000000) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 380) = self->_isInVol;
  *(void *)(v6 + 384) |= 0x100000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 348) = self->_reason;
  *(void *)(v6 + 384) |= 0x4000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 356) = self->_subreason;
  *(void *)(v6 + 384) |= 0x10000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 192) = self->_channel;
  *(void *)(v6 + 384) |= 8uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 196) = self->_channelWidth;
  *(void *)(v6 + 384) |= 0x10uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_48:
  *(_DWORD *)(v6 + 344) = self->_phyMode;
  *(void *)(v6 + 384) |= 0x2000000uLL;
  if ((*(void *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 204) = self->_flags;
    *(void *)(v6 + 384) |= 0x40uLL;
  }
LABEL_12:

  *(void *)(v6 + 336) = [(NSData *)self->_oui copyWithZone:a3];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) != 0)
  {
    *(_DWORD *)(v6 + 352) = self->_securityType;
    *(void *)(v6 + 384) |= 0x8000000uLL;
    $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x80000000) == 0)
    {
LABEL_14:
      if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 376) = self->_wpaProtocol;
  *(void *)(v6 + 384) |= 0x80000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v8 & 0x20000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 324) = self->_mcastCipher;
  *(void *)(v6 + 384) |= 0x1000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v8 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v6 + 360) = self->_ucastCipher;
  *(void *)(v6 + 384) |= 0x20000000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v6 + 184) = self->_akmSuites;
  *(void *)(v6 + 384) |= 2uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v6 + 188) = self->_capabilities;
  *(void *)(v6 + 384) |= 4uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v6 + 200) = self->_enhancedSecurityType;
  *(void *)(v6 + 384) |= 0x20uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 304) = self->_htInfo;
  *(void *)(v6 + 384) |= 0x400000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v8 & 0x800000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 300) = self->_htExtended;
  *(void *)(v6 + 384) |= 0x200000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v8 & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v6 + 320) = self->_htTxBf;
  *(void *)(v6 + 384) |= 0x800000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_60:
  *(_DWORD *)(v6 + 292) = self->_htASel;
  *(void *)(v6 + 384) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x100000) != 0)
  {
LABEL_24:
    *(_DWORD *)(v6 + 296) = self->_htAmpduParams;
    *(void *)(v6 + 384) |= 0x100000uLL;
  }
LABEL_25:

  *(void *)(v6 + 312) = [(NSData *)self->_htSupportedMcsSet copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 3) & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 364) = self->_vhtInfo;
    *(void *)(v6 + 384) |= 0x40000000uLL;
  }

  *(void *)(v6 + 368) = [(NSData *)self->_vhtSupportedMcsSet copyWithZone:a3];
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 208) = self->_gatewayARPHistory;
    *(void *)(v6 + 384) |= 0x80uLL;
  }

  *(void *)(v6 + 240) = [(NSData *)self->_heCapabilitiesIE copyWithZone:a3];
  *(void *)(v6 + 256) = [(NSData *)self->_heOperationIE copyWithZone:a3];

  *(void *)(v6 + 224) = [(NSData *)self->_heBSSLoadIE copyWithZone:a3];
  *(void *)(v6 + 328) = [(NSData *)self->_muEDCAParametersIE copyWithZone:a3];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 248) = self->_heMacCapSubfields;
    *(void *)(v6 + 384) |= 0x800uLL;
    $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x2000) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v9 & 0x4000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_64;
    }
  }
  else if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
    goto LABEL_31;
  }
  *(_DWORD *)(v6 + 268) = self->_hePhyCapSubfields;
  *(void *)(v6 + 384) |= 0x2000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v9 & 0x1000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v6 + 272) = self->_heRxTxMcsMap;
  *(void *)(v6 + 384) |= 0x4000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v9 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v6 + 264) = self->_heOpsParams;
  *(void *)(v6 + 384) |= 0x1000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v6 + 232) = self->_heBssMcsNss;
  *(void *)(v6 + 384) |= 0x400uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v9 & 0x10000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v6 + 276) = self->_heStaCnt;
  *(void *)(v6 + 384) |= 0x8000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v9 & 0x100) == 0) {
      goto LABEL_37;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v6 + 280) = self->_heUtilization;
  *(void *)(v6 + 384) |= 0x10000uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v9 & 0x200) == 0) {
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v6 + 212) = self->_heBEParamRecord;
  *(void *)(v6 + 384) |= 0x100uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v9 & 0x20000) == 0) {
      goto LABEL_39;
    }
LABEL_71:
    *(_DWORD *)(v6 + 284) = self->_heVIParamRecord;
    *(void *)(v6 + 384) |= 0x20000uLL;
    if ((*(void *)&self->_has & 0x40000) == 0) {
      return (id)v6;
    }
    goto LABEL_40;
  }
LABEL_70:
  *(_DWORD *)(v6 + 216) = self->_heBKParamRecord;
  *(void *)(v6 + 384) |= 0x200uLL;
  $1830DFFC7F3C793B1FB608FDA3AB4356 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) != 0) {
    goto LABEL_71;
  }
LABEL_39:
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
LABEL_40:
    *(_DWORD *)(v6 + 288) = self->_heVOParamRecord;
    *(void *)(v6 + 384) |= 0x40000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (!IsEqual) {
    return IsEqual;
  }
  uint64_t v6 = *((void *)a3 + 48);
  if (*(unsigned char *)&self->_has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)a3 + 22)) {
      goto LABEL_200;
    }
  }
  else if (v6)
  {
    goto LABEL_200;
  }
  int IsEqual = PBRepeatedInt32IsEqual();
  if (!IsEqual) {
    return IsEqual;
  }
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  uint64_t v8 = *((void *)a3 + 48);
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0) {
      goto LABEL_200;
    }
    if (self->_isLinkUp)
    {
      if (!*((unsigned char *)a3 + 381)) {
        goto LABEL_200;
      }
    }
    else if (*((unsigned char *)a3 + 381))
    {
      goto LABEL_200;
    }
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(void *)&has & 0x100000000) == 0)
  {
    if ((v8 & 0x100000000) != 0) {
      goto LABEL_200;
    }
    goto LABEL_24;
  }
  if ((v8 & 0x100000000) == 0) {
    goto LABEL_200;
  }
  if (self->_isInVol)
  {
    if (!*((unsigned char *)a3 + 380)) {
      goto LABEL_200;
    }
    goto LABEL_24;
  }
  if (*((unsigned char *)a3 + 380))
  {
LABEL_200:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_24:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0 || self->_reason != *((_DWORD *)a3 + 87)) {
      goto LABEL_200;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_subreason != *((_DWORD *)a3 + 89)) {
      goto LABEL_200;
    }
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_channel != *((_DWORD *)a3 + 48)) {
      goto LABEL_200;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_200;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_channelWidth != *((_DWORD *)a3 + 49)) {
      goto LABEL_200;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_phyMode != *((_DWORD *)a3 + 86)) {
      goto LABEL_200;
    }
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_flags != *((_DWORD *)a3 + 51)) {
      goto LABEL_200;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_200;
  }
  ouuint64_t i = self->_oui;
  if ((unint64_t)oui | *((void *)a3 + 42))
  {
    int IsEqual = -[NSData isEqual:](oui, "isEqual:");
    if (!IsEqual) {
      return IsEqual;
    }
    $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  }
  uint64_t v10 = *((void *)a3 + 48);
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_securityType != *((_DWORD *)a3 + 88)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_wpaProtocol != *((_DWORD *)a3 + 94)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_mcastCipher != *((_DWORD *)a3 + 81)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0 || self->_ucastCipher != *((_DWORD *)a3 + 90)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_akmSuites != *((_DWORD *)a3 + 46)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_200;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_capabilities != *((_DWORD *)a3 + 47)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_200;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_enhancedSecurityType != *((_DWORD *)a3 + 50)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_htInfo != *((_DWORD *)a3 + 76)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_htExtended != *((_DWORD *)a3 + 75)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_htTxBf != *((_DWORD *)a3 + 80)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_htASel != *((_DWORD *)a3 + 73)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_200;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_htAmpduParams != *((_DWORD *)a3 + 74)) {
      goto LABEL_200;
    }
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_200;
  }
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if ((unint64_t)htSupportedMcsSet | *((void *)a3 + 39))
  {
    int IsEqual = -[NSData isEqual:](htSupportedMcsSet, "isEqual:");
    if (!IsEqual) {
      return IsEqual;
    }
    $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  }
  uint64_t v12 = *((void *)a3 + 48);
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v12 & 0x40000000) == 0 || self->_vhtInfo != *((_DWORD *)a3 + 91)) {
      goto LABEL_200;
    }
  }
  else if ((v12 & 0x40000000) != 0)
  {
    goto LABEL_200;
  }
  vhtSupportedMcsSet = self->_vhtSupportedMcsSet;
  if (!((unint64_t)vhtSupportedMcsSet | *((void *)a3 + 46))
    || (int IsEqual = -[NSData isEqual:](vhtSupportedMcsSet, "isEqual:")) != 0)
  {
    int IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      int IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        int IsEqual = PBRepeatedInt32IsEqual();
        if (IsEqual)
        {
          int IsEqual = PBRepeatedInt32IsEqual();
          if (IsEqual)
          {
            int IsEqual = PBRepeatedInt32IsEqual();
            if (IsEqual)
            {
              int IsEqual = PBRepeatedInt32IsEqual();
              if (IsEqual)
              {
                uint64_t v14 = *((void *)a3 + 48);
                if ((*(unsigned char *)&self->_has & 0x80) != 0)
                {
                  if ((v14 & 0x80) == 0 || self->_gatewayARPHistory != *((_DWORD *)a3 + 52)) {
                    goto LABEL_200;
                  }
                }
                else if ((v14 & 0x80) != 0)
                {
                  goto LABEL_200;
                }
                heCapabilitiesIE = self->_heCapabilitiesIE;
                if (!((unint64_t)heCapabilitiesIE | *((void *)a3 + 30))
                  || (int IsEqual = -[NSData isEqual:](heCapabilitiesIE, "isEqual:")) != 0)
                {
                  heOperationIE = self->_heOperationIE;
                  if (!((unint64_t)heOperationIE | *((void *)a3 + 32))
                    || (int IsEqual = -[NSData isEqual:](heOperationIE, "isEqual:")) != 0)
                  {
                    heBSSLoadIE = self->_heBSSLoadIE;
                    if (!((unint64_t)heBSSLoadIE | *((void *)a3 + 28))
                      || (int IsEqual = -[NSData isEqual:](heBSSLoadIE, "isEqual:")) != 0)
                    {
                      muEDCAParametersIE = self->_muEDCAParametersIE;
                      if (!((unint64_t)muEDCAParametersIE | *((void *)a3 + 41))
                        || (int IsEqual = -[NSData isEqual:](muEDCAParametersIE, "isEqual:")) != 0)
                      {
                        $1830DFFC7F3C793B1FB608FDA3AB4356 v19 = self->_has;
                        uint64_t v20 = *((void *)a3 + 48);
                        if ((*(_WORD *)&v19 & 0x800) != 0)
                        {
                          if ((v20 & 0x800) == 0 || self->_heMacCapSubfields != *((_DWORD *)a3 + 62)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x800) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x2000) != 0)
                        {
                          if ((v20 & 0x2000) == 0 || self->_hePhyCapSubfields != *((_DWORD *)a3 + 67)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x2000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x4000) != 0)
                        {
                          if ((v20 & 0x4000) == 0 || self->_heRxTxMcsMap != *((_DWORD *)a3 + 68)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x4000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x1000) != 0)
                        {
                          if ((v20 & 0x1000) == 0 || self->_heOpsParams != *((_DWORD *)a3 + 66)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x1000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x400) != 0)
                        {
                          if ((v20 & 0x400) == 0 || self->_heBssMcsNss != *((_DWORD *)a3 + 58)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x400) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x8000) != 0)
                        {
                          if ((v20 & 0x8000) == 0 || self->_heStaCnt != *((_DWORD *)a3 + 69)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x8000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_DWORD *)&v19 & 0x10000) != 0)
                        {
                          if ((v20 & 0x10000) == 0 || self->_heUtilization != *((_DWORD *)a3 + 70)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x10000) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x100) != 0)
                        {
                          if ((v20 & 0x100) == 0 || self->_heBEParamRecord != *((_DWORD *)a3 + 53)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x100) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_WORD *)&v19 & 0x200) != 0)
                        {
                          if ((v20 & 0x200) == 0 || self->_heBKParamRecord != *((_DWORD *)a3 + 54)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x200) != 0)
                        {
                          goto LABEL_200;
                        }
                        if ((*(_DWORD *)&v19 & 0x20000) != 0)
                        {
                          if ((v20 & 0x20000) == 0 || self->_heVIParamRecord != *((_DWORD *)a3 + 71)) {
                            goto LABEL_200;
                          }
                        }
                        else if ((v20 & 0x20000) != 0)
                        {
                          goto LABEL_200;
                        }
                        LOBYTE(IsEqual) = (v20 & 0x40000) == 0;
                        if ((*(_DWORD *)&v19 & 0x40000) != 0)
                        {
                          if ((v20 & 0x40000) == 0 || self->_heVOParamRecord != *((_DWORD *)a3 + 72)) {
                            goto LABEL_200;
                          }
                          LOBYTE(IsEqual) = 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v55 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v55 = 0;
  }
  uint64_t v54 = PBRepeatedInt32Hash();
  $1830DFFC7F3C793B1FB608FDA3AB4356 has = self->_has;
  if ((*(void *)&has & 0x200000000) != 0)
  {
    uint64_t v53 = 2654435761 * self->_isLinkUp;
    if ((*(void *)&has & 0x100000000) != 0)
    {
LABEL_6:
      uint64_t v52 = 2654435761 * self->_isInVol;
      if ((*(_DWORD *)&has & 0x4000000) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v53 = 0;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v52 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_7:
    uint64_t v51 = 2654435761 * self->_reason;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v51 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_8:
    uint64_t v50 = 2654435761 * self->_subreason;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v50 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_9:
    uint64_t v49 = 2654435761 * self->_channel;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v49 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v48 = 2654435761 * self->_channelWidth;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v47 = 0;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v48 = 0;
  if ((*(_DWORD *)&has & 0x2000000) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v47 = 2654435761 * self->_phyMode;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_12:
    uint64_t v46 = 2654435761 * self->_flags;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v46 = 0;
LABEL_21:
  uint64_t v45 = [(NSData *)self->_oui hash];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
    uint64_t v44 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0)
    {
LABEL_23:
      uint64_t v43 = 2654435761 * self->_wpaProtocol;
      if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
        goto LABEL_24;
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v43 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_24:
    uint64_t v42 = 2654435761 * self->_mcastCipher;
    if ((*(_DWORD *)&v4 & 0x20000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v42 = 0;
  if ((*(_DWORD *)&v4 & 0x20000000) != 0)
  {
LABEL_25:
    uint64_t v41 = 2654435761 * self->_ucastCipher;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v41 = 0;
  if ((*(unsigned char *)&v4 & 2) != 0)
  {
LABEL_26:
    uint64_t v40 = 2654435761 * self->_akmSuites;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v40 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_27:
    uint64_t v39 = 2654435761 * self->_capabilities;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v39 = 0;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_28:
    uint64_t v38 = 2654435761 * self->_enhancedSecurityType;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v38 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_29:
    uint64_t v37 = 2654435761 * self->_htInfo;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_30:
    uint64_t v36 = 2654435761 * self->_htExtended;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
LABEL_31:
    uint64_t v35 = 2654435761 * self->_htTxBf;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_32;
    }
LABEL_44:
    uint64_t v34 = 0;
    if ((*(_DWORD *)&v4 & 0x100000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_45;
  }
LABEL_43:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) == 0) {
    goto LABEL_44;
  }
LABEL_32:
  uint64_t v34 = 2654435761 * self->_htASel;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_33:
    uint64_t v33 = 2654435761 * self->_htAmpduParams;
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v33 = 0;
LABEL_46:
  uint64_t v32 = [(NSData *)self->_htSupportedMcsSet hash];
  if ((*((unsigned char *)&self->_has + 3) & 0x40) != 0) {
    uint64_t v31 = 2654435761 * self->_vhtInfo;
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v30 = [(NSData *)self->_vhtSupportedMcsSet hash];
  uint64_t v29 = PBRepeatedInt32Hash();
  uint64_t v28 = PBRepeatedInt32Hash();
  uint64_t v26 = PBRepeatedInt32Hash();
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = PBRepeatedInt32Hash();
  uint64_t v7 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v8 = 2654435761 * self->_gatewayARPHistory;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(NSData *)self->_heCapabilitiesIE hash];
  uint64_t v10 = [(NSData *)self->_heOperationIE hash];
  uint64_t v11 = [(NSData *)self->_heBSSLoadIE hash];
  uint64_t v12 = [(NSData *)self->_muEDCAParametersIE hash];
  $1830DFFC7F3C793B1FB608FDA3AB4356 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    uint64_t v14 = 2654435761 * self->_heMacCapSubfields;
    if ((*(_WORD *)&v13 & 0x2000) != 0)
    {
LABEL_54:
      uint64_t v15 = 2654435761 * self->_hePhyCapSubfields;
      if ((*(_WORD *)&v13 & 0x4000) != 0) {
        goto LABEL_55;
      }
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_WORD *)&v13 & 0x2000) != 0) {
      goto LABEL_54;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
LABEL_55:
    uint64_t v16 = 2654435761 * self->_heRxTxMcsMap;
    if ((*(_WORD *)&v13 & 0x1000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v16 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_56:
    uint64_t v17 = 2654435761 * self->_heOpsParams;
    if ((*(_WORD *)&v13 & 0x400) != 0) {
      goto LABEL_57;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v17 = 0;
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
LABEL_57:
    uint64_t v18 = 2654435761 * self->_heBssMcsNss;
    if ((*(_WORD *)&v13 & 0x8000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
LABEL_58:
    uint64_t v19 = 2654435761 * self->_heStaCnt;
    if ((*(_DWORD *)&v13 & 0x10000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
LABEL_59:
    uint64_t v20 = 2654435761 * self->_heUtilization;
    if ((*(_WORD *)&v13 & 0x100) != 0) {
      goto LABEL_60;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v20 = 0;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_60:
    uint64_t v21 = 2654435761 * self->_heBEParamRecord;
    if ((*(_WORD *)&v13 & 0x200) != 0) {
      goto LABEL_61;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
LABEL_61:
    uint64_t v22 = 2654435761 * self->_heBKParamRecord;
    if ((*(_DWORD *)&v13 & 0x20000) != 0) {
      goto LABEL_62;
    }
LABEL_73:
    uint64_t v23 = 0;
    if ((*(_DWORD *)&v13 & 0x40000) != 0) {
      goto LABEL_63;
    }
LABEL_74:
    uint64_t v24 = 0;
    return v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v44 ^ v43 ^ v45 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_72:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) == 0) {
    goto LABEL_73;
  }
LABEL_62:
  uint64_t v23 = 2654435761 * self->_heVIParamRecord;
  if ((*(_DWORD *)&v13 & 0x40000) == 0) {
    goto LABEL_74;
  }
LABEL_63:
  uint64_t v24 = 2654435761 * self->_heVOParamRecord;
  return v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v44 ^ v43 ^ v45 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 384))
  {
    self->_timestamp = *((void *)a3 + 22);
    *(void *)&self->_has |= 1uLL;
  }
  uint64_t v5 = [a3 rssiHistorysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiMetric11axLinkChangeData addRssiHistory:](self, "addRssiHistory:", [a3 rssiHistoryAtIndex:i]);
  }
  uint64_t v8 = *((void *)a3 + 48);
  if ((v8 & 0x200000000) != 0)
  {
    self->_isLinkUp = *((unsigned char *)a3 + 381);
    *(void *)&self->_has |= 0x200000000uLL;
    uint64_t v8 = *((void *)a3 + 48);
    if ((v8 & 0x100000000) == 0)
    {
LABEL_8:
      if ((v8 & 0x4000000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_79;
    }
  }
  else if ((v8 & 0x100000000) == 0)
  {
    goto LABEL_8;
  }
  self->_isInVol = *((unsigned char *)a3 + 380);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v8 = *((void *)a3 + 48);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_9:
    if ((v8 & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_reasouint64_t n = *((_DWORD *)a3 + 87);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v8 = *((void *)a3 + 48);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_10:
    if ((v8 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_subreasouint64_t n = *((_DWORD *)a3 + 89);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v8 = *((void *)a3 + 48);
  if ((v8 & 8) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_channel = *((_DWORD *)a3 + 48);
  *(void *)&self->_has |= 8uLL;
  uint64_t v8 = *((void *)a3 + 48);
  if ((v8 & 0x10) == 0)
  {
LABEL_12:
    if ((v8 & 0x2000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_channelWidth = *((_DWORD *)a3 + 49);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v8 = *((void *)a3 + 48);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_13:
    if ((v8 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_83:
  self->_phyMode = *((_DWORD *)a3 + 86);
  *(void *)&self->_has |= 0x2000000uLL;
  if ((*((void *)a3 + 48) & 0x40) != 0)
  {
LABEL_14:
    self->_flags = *((_DWORD *)a3 + 51);
    *(void *)&self->_has |= 0x40uLL;
  }
LABEL_15:
  if (*((void *)a3 + 42)) {
    -[AWDWiFiMetric11axLinkChangeData setOui:](self, "setOui:");
  }
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x8000000) != 0)
  {
    self->_securityType = *((_DWORD *)a3 + 88);
    *(void *)&self->_has |= 0x8000000uLL;
    uint64_t v9 = *((void *)a3 + 48);
    if ((v9 & 0x80000000) == 0)
    {
LABEL_19:
      if ((v9 & 0x1000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_87;
    }
  }
  else if ((v9 & 0x80000000) == 0)
  {
    goto LABEL_19;
  }
  self->_wpaProtocol = *((_DWORD *)a3 + 94);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_20:
    if ((v9 & 0x20000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_mcastCipher = *((_DWORD *)a3 + 81);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x20000000) == 0)
  {
LABEL_21:
    if ((v9 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_ucastCipher = *((_DWORD *)a3 + 90);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 2) == 0)
  {
LABEL_22:
    if ((v9 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_akmSuites = *((_DWORD *)a3 + 46);
  *(void *)&self->_has |= 2uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 4) == 0)
  {
LABEL_23:
    if ((v9 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_capabilities = *((_DWORD *)a3 + 47);
  *(void *)&self->_has |= 4uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x20) == 0)
  {
LABEL_24:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_enhancedSecurityType = *((_DWORD *)a3 + 50);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x400000) == 0)
  {
LABEL_25:
    if ((v9 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_htInfo = *((_DWORD *)a3 + 76);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x200000) == 0)
  {
LABEL_26:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_htExtended = *((_DWORD *)a3 + 75);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x800000) == 0)
  {
LABEL_27:
    if ((v9 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_htTxBf = *((_DWORD *)a3 + 80);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v9 = *((void *)a3 + 48);
  if ((v9 & 0x80000) == 0)
  {
LABEL_28:
    if ((v9 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_95:
  self->_htASel = *((_DWORD *)a3 + 73);
  *(void *)&self->_has |= 0x80000uLL;
  if ((*((void *)a3 + 48) & 0x100000) != 0)
  {
LABEL_29:
    self->_htAmpduParams = *((_DWORD *)a3 + 74);
    *(void *)&self->_has |= 0x100000uLL;
  }
LABEL_30:
  if (*((void *)a3 + 39)) {
    -[AWDWiFiMetric11axLinkChangeData setHtSupportedMcsSet:](self, "setHtSupportedMcsSet:");
  }
  if ((*((unsigned char *)a3 + 387) & 0x40) != 0)
  {
    self->_vhtInfo = *((_DWORD *)a3 + 91);
    *(void *)&self->_has |= 0x40000000uLL;
  }
  if (*((void *)a3 + 46)) {
    -[AWDWiFiMetric11axLinkChangeData setVhtSupportedMcsSet:](self, "setVhtSupportedMcsSet:");
  }
  uint64_t v10 = [a3 txPerHistorysCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[AWDWiFiMetric11axLinkChangeData addTxPerHistory:](self, "addTxPerHistory:", [a3 txPerHistoryAtIndex:j]);
  }
  uint64_t v13 = [a3 txFrmsHistorysCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[AWDWiFiMetric11axLinkChangeData addTxFrmsHistory:](self, "addTxFrmsHistory:", [a3 txFrmsHistoryAtIndex:k]);
  }
  uint64_t v16 = [a3 fwTxPerHistorysCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t m = 0; m != v17; ++m)
      -[AWDWiFiMetric11axLinkChangeData addFwTxPerHistory:](self, "addFwTxPerHistory:", [a3 fwTxPerHistoryAtIndex:m]);
  }
  uint64_t v19 = [a3 fwTxFrmsHistorysCount];
  if (v19)
  {
    uint64_t v20 = v19;
    for (uint64_t n = 0; n != v20; ++n)
      -[AWDWiFiMetric11axLinkChangeData addFwTxFrmsHistory:](self, "addFwTxFrmsHistory:", [a3 fwTxFrmsHistoryAtIndex:n]);
  }
  uint64_t v22 = [a3 bcnPerHistorysCount];
  if (v22)
  {
    uint64_t v23 = v22;
    for (iuint64_t i = 0; ii != v23; ++ii)
      -[AWDWiFiMetric11axLinkChangeData addBcnPerHistory:](self, "addBcnPerHistory:", [a3 bcnPerHistoryAtIndex:ii]);
  }
  uint64_t v25 = [a3 bcnFrmsHistorysCount];
  if (v25)
  {
    uint64_t v26 = v25;
    for (juint64_t j = 0; jj != v26; ++jj)
      -[AWDWiFiMetric11axLinkChangeData addBcnFrmsHistory:](self, "addBcnFrmsHistory:", [a3 bcnFrmsHistoryAtIndex:jj]);
  }
  if ((*((unsigned char *)a3 + 384) & 0x80) != 0)
  {
    self->_gatewayARPHistory = *((_DWORD *)a3 + 52);
    *(void *)&self->_has |= 0x80uLL;
  }
  if (*((void *)a3 + 30)) {
    -[AWDWiFiMetric11axLinkChangeData setHeCapabilitiesIE:](self, "setHeCapabilitiesIE:");
  }
  if (*((void *)a3 + 32)) {
    -[AWDWiFiMetric11axLinkChangeData setHeOperationIE:](self, "setHeOperationIE:");
  }
  if (*((void *)a3 + 28)) {
    -[AWDWiFiMetric11axLinkChangeData setHeBSSLoadIE:](self, "setHeBSSLoadIE:");
  }
  if (*((void *)a3 + 41)) {
    -[AWDWiFiMetric11axLinkChangeData setMuEDCAParametersIE:](self, "setMuEDCAParametersIE:");
  }
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x800) != 0)
  {
    self->_heMacCapSubfields = *((_DWORD *)a3 + 62);
    *(void *)&self->_has |= 0x800uLL;
    uint64_t v28 = *((void *)a3 + 48);
    if ((v28 & 0x2000) == 0)
    {
LABEL_66:
      if ((v28 & 0x4000) == 0) {
        goto LABEL_67;
      }
      goto LABEL_99;
    }
  }
  else if ((v28 & 0x2000) == 0)
  {
    goto LABEL_66;
  }
  self->_hePhyCapSubfields = *((_DWORD *)a3 + 67);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x4000) == 0)
  {
LABEL_67:
    if ((v28 & 0x1000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_heRxTxMcsMap = *((_DWORD *)a3 + 68);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x1000) == 0)
  {
LABEL_68:
    if ((v28 & 0x400) == 0) {
      goto LABEL_69;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_heOpsParams = *((_DWORD *)a3 + 66);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x400) == 0)
  {
LABEL_69:
    if ((v28 & 0x8000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_heBssMcsNss = *((_DWORD *)a3 + 58);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x8000) == 0)
  {
LABEL_70:
    if ((v28 & 0x10000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_heStaCnt = *((_DWORD *)a3 + 69);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x10000) == 0)
  {
LABEL_71:
    if ((v28 & 0x100) == 0) {
      goto LABEL_72;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_heUtilizatiouint64_t n = *((_DWORD *)a3 + 70);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x100) == 0)
  {
LABEL_72:
    if ((v28 & 0x200) == 0) {
      goto LABEL_73;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_heBEParamRecord = *((_DWORD *)a3 + 53);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x200) == 0)
  {
LABEL_73:
    if ((v28 & 0x20000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_heBKParamRecord = *((_DWORD *)a3 + 54);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v28 = *((void *)a3 + 48);
  if ((v28 & 0x20000) == 0)
  {
LABEL_74:
    if ((v28 & 0x40000) == 0) {
      return;
    }
    goto LABEL_75;
  }
LABEL_106:
  self->_heVIParamRecord = *((_DWORD *)a3 + 71);
  *(void *)&self->_has |= 0x20000uLL;
  if ((*((void *)a3 + 48) & 0x40000) == 0) {
    return;
  }
LABEL_75:
  self->_heVOParamRecord = *((_DWORD *)a3 + 72);
  *(void *)&self->_has |= 0x40000uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isLinkUp
{
  return self->_isLinkUp;
}

- (BOOL)isInVol
{
  return self->_isInVol;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unsigned)subreason
{
  return self->_subreason;
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)wpaProtocol
{
  return self->_wpaProtocol;
}

- (unsigned)mcastCipher
{
  return self->_mcastCipher;
}

- (unsigned)ucastCipher
{
  return self->_ucastCipher;
}

- (unsigned)akmSuites
{
  return self->_akmSuites;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (unsigned)enhancedSecurityType
{
  return self->_enhancedSecurityType;
}

- (unsigned)htInfo
{
  return self->_htInfo;
}

- (unsigned)htExtended
{
  return self->_htExtended;
}

- (unsigned)htTxBf
{
  return self->_htTxBf;
}

- (unsigned)htASel
{
  return self->_htASel;
}

- (unsigned)htAmpduParams
{
  return self->_htAmpduParams;
}

- (NSData)htSupportedMcsSet
{
  return self->_htSupportedMcsSet;
}

- (void)setHtSupportedMcsSet:(id)a3
{
}

- (unsigned)vhtInfo
{
  return self->_vhtInfo;
}

- (NSData)vhtSupportedMcsSet
{
  return self->_vhtSupportedMcsSet;
}

- (void)setVhtSupportedMcsSet:(id)a3
{
}

- (unsigned)gatewayARPHistory
{
  return self->_gatewayARPHistory;
}

- (NSData)heCapabilitiesIE
{
  return self->_heCapabilitiesIE;
}

- (void)setHeCapabilitiesIE:(id)a3
{
}

- (NSData)heOperationIE
{
  return self->_heOperationIE;
}

- (void)setHeOperationIE:(id)a3
{
}

- (NSData)heBSSLoadIE
{
  return self->_heBSSLoadIE;
}

- (void)setHeBSSLoadIE:(id)a3
{
}

- (NSData)muEDCAParametersIE
{
  return self->_muEDCAParametersIE;
}

- (void)setMuEDCAParametersIE:(id)a3
{
}

- (unsigned)heMacCapSubfields
{
  return self->_heMacCapSubfields;
}

- (unsigned)hePhyCapSubfields
{
  return self->_hePhyCapSubfields;
}

- (unsigned)heRxTxMcsMap
{
  return self->_heRxTxMcsMap;
}

- (unsigned)heOpsParams
{
  return self->_heOpsParams;
}

- (unsigned)heBssMcsNss
{
  return self->_heBssMcsNss;
}

- (unsigned)heStaCnt
{
  return self->_heStaCnt;
}

- (unsigned)heUtilization
{
  return self->_heUtilization;
}

- (unsigned)heBEParamRecord
{
  return self->_heBEParamRecord;
}

- (unsigned)heBKParamRecord
{
  return self->_heBKParamRecord;
}

- (unsigned)heVIParamRecord
{
  return self->_heVIParamRecord;
}

- (unsigned)heVOParamRecord
{
  return self->_heVOParamRecord;
}

@end