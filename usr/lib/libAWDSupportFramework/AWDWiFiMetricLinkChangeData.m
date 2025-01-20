@interface AWDWiFiMetricLinkChangeData
- (BOOL)hasAkmSuites;
- (BOOL)hasAssociationDuration;
- (BOOL)hasCapabilities;
- (BOOL)hasChannel;
- (BOOL)hasChannelSwitchDuringHostSleep;
- (BOOL)hasChannelSwitchDuringHostWake;
- (BOOL)hasChannelWidth;
- (BOOL)hasCountryCode;
- (BOOL)hasEnhancedSecurityType;
- (BOOL)hasFlags;
- (BOOL)hasGatewayARPHistory;
- (BOOL)hasHtASel;
- (BOOL)hasHtAmpduParams;
- (BOOL)hasHtExtended;
- (BOOL)hasHtInfo;
- (BOOL)hasHtSupportedMcsSet;
- (BOOL)hasHtTxBf;
- (BOOL)hasIsInVol;
- (BOOL)hasIsLinkUp;
- (BOOL)hasLocale;
- (BOOL)hasLocaleSource;
- (BOOL)hasMcastCipher;
- (BOOL)hasOui;
- (BOOL)hasPhyMode;
- (BOOL)hasPrivateMacType;
- (BOOL)hasReason;
- (BOOL)hasRxCSAFrames;
- (BOOL)hasSecurityType;
- (BOOL)hasSubreason;
- (BOOL)hasTimestamp;
- (BOOL)hasUcastCipher;
- (BOOL)hasVhtInfo;
- (BOOL)hasVhtSupportedMcsSet;
- (BOOL)hasWpaProtocol;
- (BOOL)hasWpsConfigMethods;
- (BOOL)hasWpsDeviceNameData;
- (BOOL)hasWpsDeviceNameElement;
- (BOOL)hasWpsManufacturerElement;
- (BOOL)hasWpsModelName;
- (BOOL)hasWpsModelNumber;
- (BOOL)hasWpsPrimaryDeviceTypeCategory;
- (BOOL)hasWpsPrimaryDeviceTypeSubCategory;
- (BOOL)hasWpsResponseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInVol;
- (BOOL)isLinkUp;
- (BOOL)readFrom:(id)a3;
- (NSData)htSupportedMcsSet;
- (NSData)oui;
- (NSData)vhtSupportedMcsSet;
- (NSString)countryCode;
- (NSString)locale;
- (NSString)localeSource;
- (NSString)privateMacType;
- (NSString)wpsConfigMethods;
- (NSString)wpsDeviceNameData;
- (NSString)wpsDeviceNameElement;
- (NSString)wpsManufacturerElement;
- (NSString)wpsModelName;
- (NSString)wpsModelNumber;
- (NSString)wpsPrimaryDeviceTypeCategory;
- (NSString)wpsPrimaryDeviceTypeSubCategory;
- (NSString)wpsResponseType;
- (double)associationDuration;
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
- (unsigned)channelSwitchDuringHostSleep;
- (unsigned)channelSwitchDuringHostWake;
- (unsigned)channelWidth;
- (unsigned)enhancedSecurityType;
- (unsigned)flags;
- (unsigned)gatewayARPHistory;
- (unsigned)htASel;
- (unsigned)htAmpduParams;
- (unsigned)htExtended;
- (unsigned)htInfo;
- (unsigned)htTxBf;
- (unsigned)mcastCipher;
- (unsigned)phyMode;
- (unsigned)reason;
- (unsigned)rxCSAFrames;
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
- (void)setAssociationDuration:(double)a3;
- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setBcnPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setCapabilities:(unsigned int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setChannelSwitchDuringHostSleep:(unsigned int)a3;
- (void)setChannelSwitchDuringHostWake:(unsigned int)a3;
- (void)setChannelWidth:(unsigned int)a3;
- (void)setCountryCode:(id)a3;
- (void)setEnhancedSecurityType:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFwTxFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setFwTxPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setGatewayARPHistory:(unsigned int)a3;
- (void)setHasAkmSuites:(BOOL)a3;
- (void)setHasAssociationDuration:(BOOL)a3;
- (void)setHasCapabilities:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasChannelSwitchDuringHostSleep:(BOOL)a3;
- (void)setHasChannelSwitchDuringHostWake:(BOOL)a3;
- (void)setHasChannelWidth:(BOOL)a3;
- (void)setHasEnhancedSecurityType:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasGatewayARPHistory:(BOOL)a3;
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
- (void)setHasRxCSAFrames:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasSubreason:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUcastCipher:(BOOL)a3;
- (void)setHasVhtInfo:(BOOL)a3;
- (void)setHasWpaProtocol:(BOOL)a3;
- (void)setHtASel:(unsigned int)a3;
- (void)setHtAmpduParams:(unsigned int)a3;
- (void)setHtExtended:(unsigned int)a3;
- (void)setHtInfo:(unsigned int)a3;
- (void)setHtSupportedMcsSet:(id)a3;
- (void)setHtTxBf:(unsigned int)a3;
- (void)setIsInVol:(BOOL)a3;
- (void)setIsLinkUp:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setLocaleSource:(id)a3;
- (void)setMcastCipher:(unsigned int)a3;
- (void)setOui:(id)a3;
- (void)setPhyMode:(unsigned int)a3;
- (void)setPrivateMacType:(id)a3;
- (void)setReason:(unsigned int)a3;
- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setRxCSAFrames:(unsigned int)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setSubreason:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setTxPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setUcastCipher:(unsigned int)a3;
- (void)setVhtInfo:(unsigned int)a3;
- (void)setVhtSupportedMcsSet:(id)a3;
- (void)setWpaProtocol:(unsigned int)a3;
- (void)setWpsConfigMethods:(id)a3;
- (void)setWpsDeviceNameData:(id)a3;
- (void)setWpsDeviceNameElement:(id)a3;
- (void)setWpsManufacturerElement:(id)a3;
- (void)setWpsModelName:(id)a3;
- (void)setWpsModelNumber:(id)a3;
- (void)setWpsPrimaryDeviceTypeCategory:(id)a3;
- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3;
- (void)setWpsResponseType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricLinkChangeData

- (void)dealloc
{
  PBRepeatedInt32Clear();
  [(AWDWiFiMetricLinkChangeData *)self setOui:0];
  [(AWDWiFiMetricLinkChangeData *)self setHtSupportedMcsSet:0];
  [(AWDWiFiMetricLinkChangeData *)self setVhtSupportedMcsSet:0];
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  [(AWDWiFiMetricLinkChangeData *)self setLocale:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsResponseType:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsManufacturerElement:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsModelName:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsModelNumber:0];
  [(AWDWiFiMetricLinkChangeData *)self setCountryCode:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsPrimaryDeviceTypeCategory:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsPrimaryDeviceTypeSubCategory:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsDeviceNameElement:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsDeviceNameData:0];
  [(AWDWiFiMetricLinkChangeData *)self setWpsConfigMethods:0];
  [(AWDWiFiMetricLinkChangeData *)self setLocaleSource:0];
  [(AWDWiFiMetricLinkChangeData *)self setPrivateMacType:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricLinkChangeData;
  [(AWDWiFiMetricLinkChangeData *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_rssiHistorys->list[a3];
}

- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (void)setIsLinkUp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isLinkUp = a3;
}

- (void)setHasIsLinkUp:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsLinkUp
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsInVol:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isInVol = a3;
}

- (void)setHasIsInVol:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsInVol
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSubreason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_subreason = a3;
}

- (void)setHasSubreason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubreason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasChannelWidth
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setPhyMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setWpaProtocol:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_wpaProtocol = a3;
}

- (void)setHasWpaProtocol:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasWpaProtocol
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setMcastCipher:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_mcastCipher = a3;
}

- (void)setHasMcastCipher:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMcastCipher
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setUcastCipher:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_ucastCipher = a3;
}

- (void)setHasUcastCipher:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUcastCipher
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAkmSuites:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_akmSuites = a3;
}

- (void)setHasAkmSuites:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAkmSuites
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCapabilities:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCapabilities
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEnhancedSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_enhancedSecurityType = a3;
}

- (void)setHasEnhancedSecurityType:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasEnhancedSecurityType
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHtInfo:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_htInfo = a3;
}

- (void)setHasHtInfo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasHtInfo
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHtExtended:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_htExtended = a3;
}

- (void)setHasHtExtended:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasHtExtended
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHtTxBf:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_htTxBf = a3;
}

- (void)setHasHtTxBf:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasHtTxBf
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHtASel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_htASel = a3;
}

- (void)setHasHtASel:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHtASel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHtAmpduParams:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_htAmpduParams = a3;
}

- (void)setHasHtAmpduParams:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHtAmpduParams
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasHtSupportedMcsSet
{
  return self->_htSupportedMcsSet != 0;
}

- (void)setVhtInfo:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_vhtInfo = a3;
}

- (void)setHasVhtInfo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasVhtInfo
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
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
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
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
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
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
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
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
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
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
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_bcnFrmsHistorys->list[a3];
}

- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (void)setGatewayARPHistory:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_gatewayARPHistory = a3;
}

- (void)setHasGatewayARPHistory:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGatewayARPHistory
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setAssociationDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_associationDuration = a3;
}

- (void)setHasAssociationDuration:(BOOL)a3
{
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssociationDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasWpsResponseType
{
  return self->_wpsResponseType != 0;
}

- (BOOL)hasWpsManufacturerElement
{
  return self->_wpsManufacturerElement != 0;
}

- (BOOL)hasWpsModelName
{
  return self->_wpsModelName != 0;
}

- (BOOL)hasWpsModelNumber
{
  return self->_wpsModelNumber != 0;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory != 0;
}

- (BOOL)hasWpsDeviceNameElement
{
  return self->_wpsDeviceNameElement != 0;
}

- (BOOL)hasWpsDeviceNameData
{
  return self->_wpsDeviceNameData != 0;
}

- (BOOL)hasWpsConfigMethods
{
  return self->_wpsConfigMethods != 0;
}

- (BOOL)hasLocaleSource
{
  return self->_localeSource != 0;
}

- (void)setRxCSAFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rxCSAFrames = a3;
}

- (void)setHasRxCSAFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRxCSAFrames
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setChannelSwitchDuringHostSleep:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_channelSwitchDuringHostSleep = a3;
}

- (void)setHasChannelSwitchDuringHostSleep:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasChannelSwitchDuringHostSleep
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setChannelSwitchDuringHostWake:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_channelSwitchDuringHostWake = a3;
}

- (void)setHasChannelSwitchDuringHostWake:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B0D1D818CB9EA72D974DA75CDADC79AD)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasChannelSwitchDuringHostWake
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasPrivateMacType
{
  return self->_privateMacType != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricLinkChangeData;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricLinkChangeData description](&v3, sel_description), -[AWDWiFiMetricLinkChangeData dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"rssiHistory"];
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_isLinkUp] forKey:@"isLinkUp"];
    $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x40000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_70;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_isInVol] forKey:@"isInVol"];
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reason] forKey:@"reason"];
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_subreason] forKey:@"subreason"];
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelWidth] forKey:@"channelWidth"];
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_phyMode] forKey:@"phyMode"];
  if ((*(_DWORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_flags] forKey:@"flags"];
LABEL_12:
  oui = self->_oui;
  if (oui) {
    [v3 setObject:oui forKey:@"oui"];
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
    $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x10000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_78;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_16;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wpaProtocol] forKey:@"wpaProtocol"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mcastCipher] forKey:@"mcastCipher"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ucastCipher] forKey:@"ucastCipher"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_akmSuites] forKey:@"akmSuites"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_capabilities] forKey:@"capabilities"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_enhancedSecurityType] forKey:@"enhancedSecurityType"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htInfo] forKey:@"htInfo"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htExtended] forKey:@"htExtended"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htTxBf] forKey:@"htTxBf"];
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htASel] forKey:@"htASel"];
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_26:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_htAmpduParams] forKey:@"htAmpduParams"];
LABEL_27:
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if (htSupportedMcsSet) {
    [v3 setObject:htSupportedMcsSet forKey:@"htSupportedMcsSet"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
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
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_gatewayARPHistory] forKey:@"gatewayARPHistory"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithDouble:self->_associationDuration] forKey:@"associationDuration"];
  }
  wpsResponseType = self->_wpsResponseType;
  if (wpsResponseType) {
    [v3 setObject:wpsResponseType forKey:@"wpsResponseType"];
  }
  wpsManufacturerElement = self->_wpsManufacturerElement;
  if (wpsManufacturerElement) {
    [v3 setObject:wpsManufacturerElement forKey:@"wpsManufacturerElement"];
  }
  wpsModelName = self->_wpsModelName;
  if (wpsModelName) {
    [v3 setObject:wpsModelName forKey:@"wpsModelName"];
  }
  wpsModelNumber = self->_wpsModelNumber;
  if (wpsModelNumber) {
    [v3 setObject:wpsModelNumber forKey:@"wpsModelNumber"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v3 setObject:countryCode forKey:@"countryCode"];
  }
  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
  if (wpsPrimaryDeviceTypeCategory) {
    [v3 setObject:wpsPrimaryDeviceTypeCategory forKey:@"wpsPrimaryDeviceTypeCategory"];
  }
  wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
  if (wpsPrimaryDeviceTypeSubCategory) {
    [v3 setObject:wpsPrimaryDeviceTypeSubCategory forKey:@"wpsPrimaryDeviceTypeSubCategory"];
  }
  wpsDeviceNameElement = self->_wpsDeviceNameElement;
  if (wpsDeviceNameElement) {
    [v3 setObject:wpsDeviceNameElement forKey:@"wpsDeviceNameElement"];
  }
  wpsDeviceNameData = self->_wpsDeviceNameData;
  if (wpsDeviceNameData) {
    [v3 setObject:wpsDeviceNameData forKey:@"wpsDeviceNameData"];
  }
  wpsConfigMethods = self->_wpsConfigMethods;
  if (wpsConfigMethods) {
    [v3 setObject:wpsConfigMethods forKey:@"wpsConfigMethods"];
  }
  localeSource = self->_localeSource;
  if (localeSource) {
    [v3 setObject:localeSource forKey:@"localeSource"];
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rxCSAFrames] forKey:@"rxCSAFrames"];
    $B0D1D818CB9EA72D974DA75CDADC79AD v21 = self->_has;
    if ((*(unsigned char *)&v21 & 0x20) == 0)
    {
LABEL_63:
      if ((*(unsigned char *)&v21 & 0x40) == 0) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
  }
  else if ((*(unsigned char *)&v21 & 0x20) == 0)
  {
    goto LABEL_63;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelSwitchDuringHostSleep] forKey:@"channelSwitchDuringHostSleep"];
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_64:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelSwitchDuringHostWake] forKey:@"channelSwitchDuringHostWake"];
LABEL_65:
  privateMacType = self->_privateMacType;
  if (privateMacType) {
    [v3 setObject:privateMacType forKey:@"privateMacType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricLinkChangeDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
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
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&has & 0x40000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_92;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x200) != 0) {
LABEL_14:
  }
    PBDataWriterWriteUint32Field();
LABEL_15:
  if (self->_oui) {
    PBDataWriterWriteDataField();
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_19:
      if ((*(_DWORD *)&v6 & 0x10000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  $B0D1D818CB9EA72D974DA75CDADC79AD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_29:
  }
    PBDataWriterWriteUint32Field();
LABEL_30:
  if (self->_htSupportedMcsSet) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
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
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_wpsResponseType) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsManufacturerElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsModelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsModelNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsPrimaryDeviceTypeCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsDeviceNameElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsDeviceNameData) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsConfigMethods) {
    PBDataWriterWriteStringField();
  }
  if (self->_localeSource) {
    PBDataWriterWriteStringField();
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $B0D1D818CB9EA72D974DA75CDADC79AD v13 = self->_has;
    if ((*(unsigned char *)&v13 & 0x20) == 0)
    {
LABEL_84:
      if ((*(unsigned char *)&v13 & 0x40) == 0) {
        goto LABEL_86;
      }
      goto LABEL_85;
    }
  }
  else if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
    goto LABEL_84;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_85:
  }
    PBDataWriterWriteUint32Field();
LABEL_86:
  if (self->_privateMacType)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 23) = self->_timestamp;
    *((_DWORD *)a3 + 109) |= 2u;
  }
  if ([(AWDWiFiMetricLinkChangeData *)self rssiHistorysCount])
  {
    [a3 clearRssiHistorys];
    unint64_t v5 = [(AWDWiFiMetricLinkChangeData *)self rssiHistorysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRssiHistory:-[AWDWiFiMetricLinkChangeData rssiHistoryAtIndex:](self, "rssiHistoryAtIndex:", i)];
    }
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *((unsigned char *)a3 + 433) = self->_isLinkUp;
    *((_DWORD *)a3 + 109) |= 0x4000000u;
    $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&has & 0x40000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_99;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)a3 + 432) = self->_isInVol;
  *((_DWORD *)a3 + 109) |= 0x2000000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)a3 + 80) = self->_reason;
  *((_DWORD *)a3 + 109) |= 0x40000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)a3 + 83) = self->_subreason;
  *((_DWORD *)a3 + 109) |= 0x200000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)a3 + 50) = self->_channel;
  *((_DWORD *)a3 + 109) |= 0x10u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)a3 + 53) = self->_channelWidth;
  *((_DWORD *)a3 + 109) |= 0x80u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_103:
  *((_DWORD *)a3 + 76) = self->_phyMode;
  *((_DWORD *)a3 + 109) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 57) = self->_flags;
    *((_DWORD *)a3 + 109) |= 0x200u;
  }
LABEL_16:
  if (self->_oui) {
    [a3 setOui:];
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
  {
    *((_DWORD *)a3 + 82) = self->_securityType;
    *((_DWORD *)a3 + 109) |= 0x100000u;
    $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v9 & 0x10000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_107;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)a3 + 88) = self->_wpaProtocol;
  *((_DWORD *)a3 + 109) |= 0x1000000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v9 & 0x400000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)a3 + 72) = self->_mcastCipher;
  *((_DWORD *)a3 + 109) |= 0x10000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v9 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)a3 + 84) = self->_ucastCipher;
  *((_DWORD *)a3 + 109) |= 0x400000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v9 & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)a3 + 48) = self->_akmSuites;
  *((_DWORD *)a3 + 109) |= 4u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v9 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 49) = self->_capabilities;
  *((_DWORD *)a3 + 109) |= 8u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v9 & 0x4000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)a3 + 56) = self->_enhancedSecurityType;
  *((_DWORD *)a3 + 109) |= 0x100u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)a3 + 62) = self->_htInfo;
  *((_DWORD *)a3 + 109) |= 0x4000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)a3 + 61) = self->_htExtended;
  *((_DWORD *)a3 + 109) |= 0x2000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v9 & 0x800) == 0) {
      goto LABEL_29;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)a3 + 66) = self->_htTxBf;
  *((_DWORD *)a3 + 109) |= 0x8000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v9 & 0x1000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_115:
  *((_DWORD *)a3 + 59) = self->_htASel;
  *((_DWORD *)a3 + 109) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_30:
    *((_DWORD *)a3 + 60) = self->_htAmpduParams;
    *((_DWORD *)a3 + 109) |= 0x1000u;
  }
LABEL_31:
  if (self->_htSupportedMcsSet) {
    [a3 setHtSupportedMcsSet:];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *((_DWORD *)a3 + 85) = self->_vhtInfo;
    *((_DWORD *)a3 + 109) |= 0x800000u;
  }
  if (self->_vhtSupportedMcsSet) {
    [a3 setVhtSupportedMcsSet:];
  }
  if ([(AWDWiFiMetricLinkChangeData *)self txPerHistorysCount])
  {
    [a3 clearTxPerHistorys];
    unint64_t v10 = [(AWDWiFiMetricLinkChangeData *)self txPerHistorysCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addTxPerHistory:-[AWDWiFiMetricLinkChangeData txPerHistoryAtIndex:](self, "txPerHistoryAtIndex:", j)];
    }
  }
  if ([(AWDWiFiMetricLinkChangeData *)self txFrmsHistorysCount])
  {
    [a3 clearTxFrmsHistorys];
    unint64_t v13 = [(AWDWiFiMetricLinkChangeData *)self txFrmsHistorysCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        [a3 addTxFrmsHistory:-[AWDWiFiMetricLinkChangeData txFrmsHistoryAtIndex:](self, "txFrmsHistoryAtIndex:", k)];
    }
  }
  if ([(AWDWiFiMetricLinkChangeData *)self fwTxPerHistorysCount])
  {
    [a3 clearFwTxPerHistorys];
    unint64_t v16 = [(AWDWiFiMetricLinkChangeData *)self fwTxPerHistorysCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [a3 addFwTxPerHistory:-[AWDWiFiMetricLinkChangeData fwTxPerHistoryAtIndex:](self, "fwTxPerHistoryAtIndex:", m)];
    }
  }
  if ([(AWDWiFiMetricLinkChangeData *)self fwTxFrmsHistorysCount])
  {
    [a3 clearFwTxFrmsHistorys];
    unint64_t v19 = [(AWDWiFiMetricLinkChangeData *)self fwTxFrmsHistorysCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [a3 addFwTxFrmsHistory:-[AWDWiFiMetricLinkChangeData fwTxFrmsHistoryAtIndex:](self, "fwTxFrmsHistoryAtIndex:", n)];
    }
  }
  if ([(AWDWiFiMetricLinkChangeData *)self bcnPerHistorysCount])
  {
    [a3 clearBcnPerHistorys];
    unint64_t v22 = [(AWDWiFiMetricLinkChangeData *)self bcnPerHistorysCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
        [a3 addBcnPerHistory:-[AWDWiFiMetricLinkChangeData bcnPerHistoryAtIndex:](self, "bcnPerHistoryAtIndex:", ii)];
    }
  }
  if ([(AWDWiFiMetricLinkChangeData *)self bcnFrmsHistorysCount])
  {
    [a3 clearBcnFrmsHistorys];
    unint64_t v25 = [(AWDWiFiMetricLinkChangeData *)self bcnFrmsHistorysCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (juint64_t j = 0; jj != v26; ++jj)
        [a3 addBcnFrmsHistory:-[AWDWiFiMetricLinkChangeData bcnFrmsHistoryAtIndex:](self, "bcnFrmsHistoryAtIndex:", jj)];
    }
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *((_DWORD *)a3 + 58) = self->_gatewayARPHistory;
    *((_DWORD *)a3 + 109) |= 0x400u;
  }
  if (self->_locale) {
    [a3 setLocale:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 22) = *(void *)&self->_associationDuration;
    *((_DWORD *)a3 + 109) |= 1u;
  }
  if (self->_wpsResponseType) {
    [a3 setWpsResponseType:];
  }
  if (self->_wpsManufacturerElement) {
    [a3 setWpsManufacturerElement:];
  }
  if (self->_wpsModelName) {
    [a3 setWpsModelName:];
  }
  if (self->_wpsModelNumber) {
    [a3 setWpsModelNumber:];
  }
  if (self->_countryCode) {
    [a3 setCountryCode:];
  }
  if (self->_wpsPrimaryDeviceTypeCategory) {
    [a3 setWpsPrimaryDeviceTypeCategory:];
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory) {
    [a3 setWpsPrimaryDeviceTypeSubCategory:];
  }
  if (self->_wpsDeviceNameElement) {
    [a3 setWpsDeviceNameElement:];
  }
  if (self->_wpsDeviceNameData) {
    [a3 setWpsDeviceNameData:];
  }
  if (self->_wpsConfigMethods) {
    [a3 setWpsConfigMethods:];
  }
  if (self->_localeSource) {
    [a3 setLocaleSource:];
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000) != 0)
  {
    *((_DWORD *)a3 + 81) = self->_rxCSAFrames;
    *((_DWORD *)a3 + 109) |= 0x80000u;
    $B0D1D818CB9EA72D974DA75CDADC79AD v28 = self->_has;
    if ((*(unsigned char *)&v28 & 0x20) == 0)
    {
LABEL_91:
      if ((*(unsigned char *)&v28 & 0x40) == 0) {
        goto LABEL_93;
      }
      goto LABEL_92;
    }
  }
  else if ((*(unsigned char *)&v28 & 0x20) == 0)
  {
    goto LABEL_91;
  }
  *((_DWORD *)a3 + 51) = self->_channelSwitchDuringHostSleep;
  *((_DWORD *)a3 + 109) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_92:
    *((_DWORD *)a3 + 52) = self->_channelSwitchDuringHostWake;
    *((_DWORD *)a3 + 109) |= 0x40u;
  }
LABEL_93:
  if (self->_privateMacType)
  {
    [a3 setPrivateMacType:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 184) = self->_timestamp;
    *(_DWORD *)(v5 + 436) |= 2u;
  }
  PBRepeatedInt32Copy();
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *(unsigned char *)(v6 + 433) = self->_isLinkUp;
    *(_DWORD *)(v6 + 436) |= 0x4000000u;
    $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x40000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v6 + 432) = self->_isInVol;
  *(_DWORD *)(v6 + 436) |= 0x2000000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 320) = self->_reason;
  *(_DWORD *)(v6 + 436) |= 0x40000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v6 + 332) = self->_subreason;
  *(_DWORD *)(v6 + 436) |= 0x200000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v6 + 200) = self->_channel;
  *(_DWORD *)(v6 + 436) |= 0x10u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 212) = self->_channelWidth;
  *(_DWORD *)(v6 + 436) |= 0x80u;
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_42:
  *(_DWORD *)(v6 + 304) = self->_phyMode;
  *(_DWORD *)(v6 + 436) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 228) = self->_flags;
    *(_DWORD *)(v6 + 436) |= 0x200u;
  }
LABEL_12:

  *(void *)(v6 + 296) = [(NSData *)self->_oui copyWithZone:a3];
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) != 0)
  {
    *(_DWORD *)(v6 + 328) = self->_securityType;
    *(_DWORD *)(v6 + 436) |= 0x100000u;
    $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
    {
LABEL_14:
      if ((*(_DWORD *)&v8 & 0x10000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 352) = self->_wpaProtocol;
  *(_DWORD *)(v6 + 436) |= 0x1000000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 288) = self->_mcastCipher;
  *(_DWORD *)(v6 + 436) |= 0x10000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 336) = self->_ucastCipher;
  *(_DWORD *)(v6 + 436) |= 0x400000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 192) = self->_akmSuites;
  *(_DWORD *)(v6 + 436) |= 4u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 196) = self->_capabilities;
  *(_DWORD *)(v6 + 436) |= 8u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v8 & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v6 + 224) = self->_enhancedSecurityType;
  *(_DWORD *)(v6 + 436) |= 0x100u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 248) = self->_htInfo;
  *(_DWORD *)(v6 + 436) |= 0x4000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 244) = self->_htExtended;
  *(_DWORD *)(v6 + 436) |= 0x2000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v6 + 264) = self->_htTxBf;
  *(_DWORD *)(v6 + 436) |= 0x8000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_54:
  *(_DWORD *)(v6 + 236) = self->_htASel;
  *(_DWORD *)(v6 + 436) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_24:
    *(_DWORD *)(v6 + 240) = self->_htAmpduParams;
    *(_DWORD *)(v6 + 436) |= 0x1000u;
  }
LABEL_25:

  *(void *)(v6 + 256) = [(NSData *)self->_htSupportedMcsSet copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 340) = self->_vhtInfo;
    *(_DWORD *)(v6 + 436) |= 0x800000u;
  }

  *(void *)(v6 + 344) = [(NSData *)self->_vhtSupportedMcsSet copyWithZone:a3];
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *(_DWORD *)(v6 + 232) = self->_gatewayARPHistory;
    *(_DWORD *)(v6 + 436) |= 0x400u;
  }

  *(void *)(v6 + 272) = [(NSString *)self->_locale copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 176) = self->_associationDuration;
    *(_DWORD *)(v6 + 436) |= 1u;
  }

  *(void *)(v6 + 424) = [(NSString *)self->_wpsResponseType copyWithZone:a3];
  *(void *)(v6 + 384) = [(NSString *)self->_wpsManufacturerElement copyWithZone:a3];

  *(void *)(v6 + 392) = [(NSString *)self->_wpsModelName copyWithZone:a3];
  *(void *)(v6 + 400) = [(NSString *)self->_wpsModelNumber copyWithZone:a3];

  *(void *)(v6 + 216) = [(NSString *)self->_countryCode copyWithZone:a3];
  *(void *)(v6 + 408) = [(NSString *)self->_wpsPrimaryDeviceTypeCategory copyWithZone:a3];

  *(void *)(v6 + 416) = [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory copyWithZone:a3];
  *(void *)(v6 + 376) = [(NSString *)self->_wpsDeviceNameElement copyWithZone:a3];

  *(void *)(v6 + 368) = [(NSString *)self->_wpsDeviceNameData copyWithZone:a3];
  *(void *)(v6 + 360) = [(NSString *)self->_wpsConfigMethods copyWithZone:a3];

  *(void *)(v6 + 280) = [(NSString *)self->_localeSource copyWithZone:a3];
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
    if ((*(unsigned char *)&v9 & 0x20) == 0) {
      goto LABEL_33;
    }
LABEL_57:
    *(_DWORD *)(v6 + 204) = self->_channelSwitchDuringHostSleep;
    *(_DWORD *)(v6 + 436) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  *(_DWORD *)(v6 + 324) = self->_rxCSAFrames;
  *(_DWORD *)(v6 + 436) |= 0x80000u;
  $B0D1D818CB9EA72D974DA75CDADC79AD v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x20) != 0) {
    goto LABEL_57;
  }
LABEL_33:
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
LABEL_34:
    *(_DWORD *)(v6 + 208) = self->_channelSwitchDuringHostWake;
    *(_DWORD *)(v6 + 436) |= 0x40u;
  }
LABEL_35:

  *(void *)(v6 + 312) = [(NSString *)self->_privateMacType copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (!IsEqual) {
    return IsEqual;
  }
  int v6 = *((_DWORD *)a3 + 109);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((void *)a3 + 23)) {
      goto LABEL_185;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_185;
  }
  int IsEqual = PBRepeatedInt32IsEqual();
  if (!IsEqual) {
    return IsEqual;
  }
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  int v8 = *((_DWORD *)a3 + 109);
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0) {
      goto LABEL_185;
    }
    if (self->_isLinkUp)
    {
      if (!*((unsigned char *)a3 + 433)) {
        goto LABEL_185;
      }
    }
    else if (*((unsigned char *)a3 + 433))
    {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    if ((v8 & 0x2000000) != 0) {
      goto LABEL_185;
    }
    goto LABEL_24;
  }
  if ((v8 & 0x2000000) == 0) {
    goto LABEL_185;
  }
  if (self->_isInVol)
  {
    if (!*((unsigned char *)a3 + 432)) {
      goto LABEL_185;
    }
    goto LABEL_24;
  }
  if (*((unsigned char *)a3 + 432))
  {
LABEL_185:
    LOBYTE(IsEqual) = 0;
    return IsEqual;
  }
LABEL_24:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_reason != *((_DWORD *)a3 + 80)) {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_subreason != *((_DWORD *)a3 + 83)) {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_channel != *((_DWORD *)a3 + 50)) {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_185;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_channelWidth != *((_DWORD *)a3 + 53)) {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_phyMode != *((_DWORD *)a3 + 76)) {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_flags != *((_DWORD *)a3 + 57)) {
      goto LABEL_185;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_185;
  }
  ouuint64_t i = self->_oui;
  if ((unint64_t)oui | *((void *)a3 + 37))
  {
    int IsEqual = -[NSData isEqual:](oui, "isEqual:");
    if (!IsEqual) {
      return IsEqual;
    }
    $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  }
  int v10 = *((_DWORD *)a3 + 109);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_securityType != *((_DWORD *)a3 + 82)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_wpaProtocol != *((_DWORD *)a3 + 88)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_mcastCipher != *((_DWORD *)a3 + 72)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_ucastCipher != *((_DWORD *)a3 + 84)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_akmSuites != *((_DWORD *)a3 + 48)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_185;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_capabilities != *((_DWORD *)a3 + 49)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_enhancedSecurityType != *((_DWORD *)a3 + 56)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_htInfo != *((_DWORD *)a3 + 62)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_htExtended != *((_DWORD *)a3 + 61)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_htTxBf != *((_DWORD *)a3 + 66)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_htASel != *((_DWORD *)a3 + 59)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_htAmpduParams != *((_DWORD *)a3 + 60)) {
      goto LABEL_185;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_185;
  }
  htSupportedMcsSet = self->_htSupportedMcsSet;
  if ((unint64_t)htSupportedMcsSet | *((void *)a3 + 32))
  {
    int IsEqual = -[NSData isEqual:](htSupportedMcsSet, "isEqual:");
    if (!IsEqual) {
      return IsEqual;
    }
    $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  }
  int v12 = *((_DWORD *)a3 + 109);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0 || self->_vhtInfo != *((_DWORD *)a3 + 85)) {
      goto LABEL_185;
    }
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_185;
  }
  vhtSupportedMcsSet = self->_vhtSupportedMcsSet;
  if (!((unint64_t)vhtSupportedMcsSet | *((void *)a3 + 43))
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
                $B0D1D818CB9EA72D974DA75CDADC79AD v14 = self->_has;
                int v15 = *((_DWORD *)a3 + 109);
                if ((*(_WORD *)&v14 & 0x400) != 0)
                {
                  if ((v15 & 0x400) == 0 || self->_gatewayARPHistory != *((_DWORD *)a3 + 58)) {
                    goto LABEL_185;
                  }
                }
                else if ((v15 & 0x400) != 0)
                {
                  goto LABEL_185;
                }
                locale = self->_locale;
                if ((unint64_t)locale | *((void *)a3 + 34))
                {
                  int IsEqual = -[NSString isEqual:](locale, "isEqual:");
                  if (!IsEqual) {
                    return IsEqual;
                  }
                  $B0D1D818CB9EA72D974DA75CDADC79AD v14 = self->_has;
                }
                int v17 = *((_DWORD *)a3 + 109);
                if (*(unsigned char *)&v14)
                {
                  if ((v17 & 1) == 0 || self->_associationDuration != *((double *)a3 + 22)) {
                    goto LABEL_185;
                  }
                }
                else if (v17)
                {
                  goto LABEL_185;
                }
                wpsResponseType = self->_wpsResponseType;
                if (!((unint64_t)wpsResponseType | *((void *)a3 + 53))
                  || (int IsEqual = -[NSString isEqual:](wpsResponseType, "isEqual:")) != 0)
                {
                  wpsManufacturerElement = self->_wpsManufacturerElement;
                  if (!((unint64_t)wpsManufacturerElement | *((void *)a3 + 48))
                    || (int IsEqual = -[NSString isEqual:](wpsManufacturerElement, "isEqual:")) != 0)
                  {
                    wpsModelName = self->_wpsModelName;
                    if (!((unint64_t)wpsModelName | *((void *)a3 + 49))
                      || (int IsEqual = -[NSString isEqual:](wpsModelName, "isEqual:")) != 0)
                    {
                      wpsModelNumber = self->_wpsModelNumber;
                      if (!((unint64_t)wpsModelNumber | *((void *)a3 + 50))
                        || (int IsEqual = -[NSString isEqual:](wpsModelNumber, "isEqual:")) != 0)
                      {
                        countryCode = self->_countryCode;
                        if (!((unint64_t)countryCode | *((void *)a3 + 27))
                          || (int IsEqual = -[NSString isEqual:](countryCode, "isEqual:")) != 0)
                        {
                          wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
                          if (!((unint64_t)wpsPrimaryDeviceTypeCategory | *((void *)a3 + 51))
                            || (int IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:")) != 0)
                          {
                            wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
                            if (!((unint64_t)wpsPrimaryDeviceTypeSubCategory | *((void *)a3 + 52))
                              || (int IsEqual = -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:")) != 0)
                            {
                              wpsDeviceNameElement = self->_wpsDeviceNameElement;
                              if (!((unint64_t)wpsDeviceNameElement | *((void *)a3 + 47))
                                || (int IsEqual = -[NSString isEqual:](wpsDeviceNameElement, "isEqual:")) != 0)
                              {
                                wpsDeviceNameData = self->_wpsDeviceNameData;
                                if (!((unint64_t)wpsDeviceNameData | *((void *)a3 + 46))
                                  || (int IsEqual = -[NSString isEqual:](wpsDeviceNameData, "isEqual:")) != 0)
                                {
                                  wpsConfigMethods = self->_wpsConfigMethods;
                                  if (!((unint64_t)wpsConfigMethods | *((void *)a3 + 45))
                                    || (int IsEqual = -[NSString isEqual:](wpsConfigMethods, "isEqual:")) != 0)
                                  {
                                    localeSource = self->_localeSource;
                                    if (!((unint64_t)localeSource | *((void *)a3 + 35))
                                      || (int IsEqual = -[NSString isEqual:](localeSource, "isEqual:")) != 0)
                                    {
                                      $B0D1D818CB9EA72D974DA75CDADC79AD v29 = self->_has;
                                      int v30 = *((_DWORD *)a3 + 109);
                                      if ((*(_DWORD *)&v29 & 0x80000) != 0)
                                      {
                                        if ((v30 & 0x80000) == 0 || self->_rxCSAFrames != *((_DWORD *)a3 + 81)) {
                                          goto LABEL_185;
                                        }
                                      }
                                      else if ((v30 & 0x80000) != 0)
                                      {
                                        goto LABEL_185;
                                      }
                                      if ((*(unsigned char *)&v29 & 0x20) != 0)
                                      {
                                        if ((v30 & 0x20) == 0
                                          || self->_channelSwitchDuringHostSleep != *((_DWORD *)a3 + 51))
                                        {
                                          goto LABEL_185;
                                        }
                                      }
                                      else if ((v30 & 0x20) != 0)
                                      {
                                        goto LABEL_185;
                                      }
                                      if ((*(unsigned char *)&v29 & 0x40) != 0)
                                      {
                                        if ((v30 & 0x40) == 0
                                          || self->_channelSwitchDuringHostWake != *((_DWORD *)a3 + 52))
                                        {
                                          goto LABEL_185;
                                        }
                                      }
                                      else if ((v30 & 0x40) != 0)
                                      {
                                        goto LABEL_185;
                                      }
                                      privateMacType = self->_privateMacType;
                                      if ((unint64_t)privateMacType | *((void *)a3 + 39))
                                      {
                                        LOBYTE(IsEqual) = -[NSString isEqual:](privateMacType, "isEqual:");
                                      }
                                      else
                                      {
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
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v63 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v63 = 0;
  }
  uint64_t v62 = PBRepeatedInt32Hash();
  $B0D1D818CB9EA72D974DA75CDADC79AD has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    uint64_t v61 = 2654435761 * self->_isLinkUp;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
LABEL_6:
      uint64_t v60 = 2654435761 * self->_isInVol;
      if ((*(_DWORD *)&has & 0x40000) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v60 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_7:
    uint64_t v59 = 2654435761 * self->_reason;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v59 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_8:
    uint64_t v58 = 2654435761 * self->_subreason;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v58 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v57 = 2654435761 * self->_channel;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v57 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_10:
    uint64_t v56 = 2654435761 * self->_channelWidth;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v55 = 0;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v56 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v55 = 2654435761 * self->_phyMode;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v54 = 2654435761 * self->_flags;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v54 = 0;
LABEL_21:
  uint64_t v53 = [(NSData *)self->_oui hash];
  $B0D1D818CB9EA72D974DA75CDADC79AD v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
    uint64_t v52 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0)
    {
LABEL_23:
      uint64_t v51 = 2654435761 * self->_wpaProtocol;
      if ((*(_DWORD *)&v4 & 0x10000) != 0) {
        goto LABEL_24;
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v52 = 0;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v51 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_24:
    uint64_t v50 = 2654435761 * self->_mcastCipher;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v50 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_25:
    uint64_t v49 = 2654435761 * self->_ucastCipher;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v49 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_26:
    uint64_t v48 = 2654435761 * self->_akmSuites;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_27;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v48 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_27:
    uint64_t v47 = 2654435761 * self->_capabilities;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v47 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_28:
    uint64_t v46 = 2654435761 * self->_enhancedSecurityType;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v46 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_29:
    uint64_t v45 = 2654435761 * self->_htInfo;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v45 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_30:
    uint64_t v44 = 2654435761 * self->_htExtended;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v44 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_31:
    uint64_t v43 = 2654435761 * self->_htTxBf;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_32;
    }
LABEL_44:
    uint64_t v42 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_45;
  }
LABEL_43:
  uint64_t v43 = 0;
  if ((*(_WORD *)&v4 & 0x800) == 0) {
    goto LABEL_44;
  }
LABEL_32:
  uint64_t v42 = 2654435761 * self->_htASel;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_33:
    uint64_t v41 = 2654435761 * self->_htAmpduParams;
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v41 = 0;
LABEL_46:
  uint64_t v40 = [(NSData *)self->_htSupportedMcsSet hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    uint64_t v39 = 2654435761 * self->_vhtInfo;
  }
  else {
    uint64_t v39 = 0;
  }
  uint64_t v38 = [(NSData *)self->_vhtSupportedMcsSet hash];
  uint64_t v37 = PBRepeatedInt32Hash();
  uint64_t v36 = PBRepeatedInt32Hash();
  uint64_t v35 = PBRepeatedInt32Hash();
  uint64_t v34 = PBRepeatedInt32Hash();
  uint64_t v33 = PBRepeatedInt32Hash();
  uint64_t v32 = PBRepeatedInt32Hash();
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    uint64_t v31 = 2654435761 * self->_gatewayARPHistory;
  }
  else {
    uint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_locale hash];
  if (*(unsigned char *)&self->_has)
  {
    associationDuratiouint64_t n = self->_associationDuration;
    double v6 = -associationDuration;
    if (associationDuration >= 0.0) {
      double v6 = self->_associationDuration;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    double v9 = fmod(v7, 1.84467441e19);
    unint64_t v10 = 2654435761u * (unint64_t)v9;
    unint64_t v11 = v10 + (unint64_t)v8;
    if (v8 <= 0.0) {
      unint64_t v11 = 2654435761u * (unint64_t)v9;
    }
    unint64_t v12 = v10 - (unint64_t)fabs(v8);
    if (v8 >= 0.0) {
      unint64_t v12 = v11;
    }
    unint64_t v29 = v12;
  }
  else
  {
    unint64_t v29 = 0;
  }
  NSUInteger v28 = [(NSString *)self->_wpsResponseType hash];
  NSUInteger v27 = [(NSString *)self->_wpsManufacturerElement hash];
  NSUInteger v26 = [(NSString *)self->_wpsModelName hash];
  NSUInteger v13 = [(NSString *)self->_wpsModelNumber hash];
  NSUInteger v14 = [(NSString *)self->_countryCode hash];
  NSUInteger v15 = [(NSString *)self->_wpsPrimaryDeviceTypeCategory hash];
  NSUInteger v16 = [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory hash];
  NSUInteger v17 = [(NSString *)self->_wpsDeviceNameElement hash];
  NSUInteger v18 = [(NSString *)self->_wpsDeviceNameData hash];
  NSUInteger v19 = [(NSString *)self->_wpsConfigMethods hash];
  NSUInteger v20 = [(NSString *)self->_localeSource hash];
  $B0D1D818CB9EA72D974DA75CDADC79AD v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
    uint64_t v22 = 0;
    if ((*(unsigned char *)&v21 & 0x20) != 0) {
      goto LABEL_63;
    }
LABEL_66:
    uint64_t v23 = 0;
    if ((*(unsigned char *)&v21 & 0x40) != 0) {
      goto LABEL_64;
    }
LABEL_67:
    uint64_t v24 = 0;
    return v62 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v52 ^ v51 ^ v53 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ [(NSString *)self->_privateMacType hash];
  }
  uint64_t v22 = 2654435761 * self->_rxCSAFrames;
  if ((*(unsigned char *)&v21 & 0x20) == 0) {
    goto LABEL_66;
  }
LABEL_63:
  uint64_t v23 = 2654435761 * self->_channelSwitchDuringHostSleep;
  if ((*(unsigned char *)&v21 & 0x40) == 0) {
    goto LABEL_67;
  }
LABEL_64:
  uint64_t v24 = 2654435761 * self->_channelSwitchDuringHostWake;
  return v62 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v52 ^ v51 ^ v53 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v22 ^ v23 ^ v24 ^ [(NSString *)self->_privateMacType hash];
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 436) & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 23);
    *(_DWORD *)&self->_has |= 2u;
  }
  uint64_t v5 = [a3 rssiHistorysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiMetricLinkChangeData addRssiHistory:](self, "addRssiHistory:", [a3 rssiHistoryAtIndex:i]);
  }
  int v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x4000000) != 0)
  {
    self->_isLinkUp = *((unsigned char *)a3 + 433);
    *(_DWORD *)&self->_has |= 0x4000000u;
    int v8 = *((_DWORD *)a3 + 109);
    if ((v8 & 0x2000000) == 0)
    {
LABEL_8:
      if ((v8 & 0x40000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_92;
    }
  }
  else if ((v8 & 0x2000000) == 0)
  {
    goto LABEL_8;
  }
  self->_isInVol = *((unsigned char *)a3 + 432);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x40000) == 0)
  {
LABEL_9:
    if ((v8 & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_reasouint64_t n = *((_DWORD *)a3 + 80);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x200000) == 0)
  {
LABEL_10:
    if ((v8 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_subreasouint64_t n = *((_DWORD *)a3 + 83);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x10) == 0)
  {
LABEL_11:
    if ((v8 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_channel = *((_DWORD *)a3 + 50);
  *(_DWORD *)&self->_has |= 0x10u;
  int v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x80) == 0)
  {
LABEL_12:
    if ((v8 & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_channelWidth = *((_DWORD *)a3 + 53);
  *(_DWORD *)&self->_has |= 0x80u;
  int v8 = *((_DWORD *)a3 + 109);
  if ((v8 & 0x20000) == 0)
  {
LABEL_13:
    if ((v8 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_96:
  self->_phyMode = *((_DWORD *)a3 + 76);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)a3 + 109) & 0x200) != 0)
  {
LABEL_14:
    self->_flags = *((_DWORD *)a3 + 57);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_15:
  if (*((void *)a3 + 37)) {
    -[AWDWiFiMetricLinkChangeData setOui:](self, "setOui:");
  }
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x100000) != 0)
  {
    self->_securityType = *((_DWORD *)a3 + 82);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v9 = *((_DWORD *)a3 + 109);
    if ((v9 & 0x1000000) == 0)
    {
LABEL_19:
      if ((v9 & 0x10000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_100;
    }
  }
  else if ((v9 & 0x1000000) == 0)
  {
    goto LABEL_19;
  }
  self->_wpaProtocol = *((_DWORD *)a3 + 88);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x10000) == 0)
  {
LABEL_20:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_mcastCipher = *((_DWORD *)a3 + 72);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x400000) == 0)
  {
LABEL_21:
    if ((v9 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_ucastCipher = *((_DWORD *)a3 + 84);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 4) == 0)
  {
LABEL_22:
    if ((v9 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_akmSuites = *((_DWORD *)a3 + 48);
  *(_DWORD *)&self->_has |= 4u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 8) == 0)
  {
LABEL_23:
    if ((v9 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_capabilities = *((_DWORD *)a3 + 49);
  *(_DWORD *)&self->_has |= 8u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x100) == 0)
  {
LABEL_24:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_enhancedSecurityType = *((_DWORD *)a3 + 56);
  *(_DWORD *)&self->_has |= 0x100u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x4000) == 0)
  {
LABEL_25:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_htInfo = *((_DWORD *)a3 + 62);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x2000) == 0)
  {
LABEL_26:
    if ((v9 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_htExtended = *((_DWORD *)a3 + 61);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x8000) == 0)
  {
LABEL_27:
    if ((v9 & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_htTxBf = *((_DWORD *)a3 + 66);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v9 = *((_DWORD *)a3 + 109);
  if ((v9 & 0x800) == 0)
  {
LABEL_28:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_108:
  self->_htASel = *((_DWORD *)a3 + 59);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)a3 + 109) & 0x1000) != 0)
  {
LABEL_29:
    self->_htAmpduParams = *((_DWORD *)a3 + 60);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_30:
  if (*((void *)a3 + 32)) {
    -[AWDWiFiMetricLinkChangeData setHtSupportedMcsSet:](self, "setHtSupportedMcsSet:");
  }
  if ((*((unsigned char *)a3 + 438) & 0x80) != 0)
  {
    self->_vhtInfo = *((_DWORD *)a3 + 85);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (*((void *)a3 + 43)) {
    -[AWDWiFiMetricLinkChangeData setVhtSupportedMcsSet:](self, "setVhtSupportedMcsSet:");
  }
  uint64_t v10 = [a3 txPerHistorysCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[AWDWiFiMetricLinkChangeData addTxPerHistory:](self, "addTxPerHistory:", [a3 txPerHistoryAtIndex:j]);
  }
  uint64_t v13 = [a3 txFrmsHistorysCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[AWDWiFiMetricLinkChangeData addTxFrmsHistory:](self, "addTxFrmsHistory:", [a3 txFrmsHistoryAtIndex:k]);
  }
  uint64_t v16 = [a3 fwTxPerHistorysCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t m = 0; m != v17; ++m)
      -[AWDWiFiMetricLinkChangeData addFwTxPerHistory:](self, "addFwTxPerHistory:", [a3 fwTxPerHistoryAtIndex:m]);
  }
  uint64_t v19 = [a3 fwTxFrmsHistorysCount];
  if (v19)
  {
    uint64_t v20 = v19;
    for (uint64_t n = 0; n != v20; ++n)
      -[AWDWiFiMetricLinkChangeData addFwTxFrmsHistory:](self, "addFwTxFrmsHistory:", [a3 fwTxFrmsHistoryAtIndex:n]);
  }
  uint64_t v22 = [a3 bcnPerHistorysCount];
  if (v22)
  {
    uint64_t v23 = v22;
    for (iuint64_t i = 0; ii != v23; ++ii)
      -[AWDWiFiMetricLinkChangeData addBcnPerHistory:](self, "addBcnPerHistory:", [a3 bcnPerHistoryAtIndex:ii]);
  }
  uint64_t v25 = [a3 bcnFrmsHistorysCount];
  if (v25)
  {
    uint64_t v26 = v25;
    for (juint64_t j = 0; jj != v26; ++jj)
      -[AWDWiFiMetricLinkChangeData addBcnFrmsHistory:](self, "addBcnFrmsHistory:", [a3 bcnFrmsHistoryAtIndex:jj]);
  }
  if ((*((unsigned char *)a3 + 437) & 4) != 0)
  {
    self->_gatewayARPHistory = *((_DWORD *)a3 + 58);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)a3 + 34)) {
    -[AWDWiFiMetricLinkChangeData setLocale:](self, "setLocale:");
  }
  if (*((unsigned char *)a3 + 436))
  {
    self->_associationDuratiouint64_t n = *((double *)a3 + 22);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 53)) {
    -[AWDWiFiMetricLinkChangeData setWpsResponseType:](self, "setWpsResponseType:");
  }
  if (*((void *)a3 + 48)) {
    -[AWDWiFiMetricLinkChangeData setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  }
  if (*((void *)a3 + 49)) {
    -[AWDWiFiMetricLinkChangeData setWpsModelName:](self, "setWpsModelName:");
  }
  if (*((void *)a3 + 50)) {
    -[AWDWiFiMetricLinkChangeData setWpsModelNumber:](self, "setWpsModelNumber:");
  }
  if (*((void *)a3 + 27)) {
    -[AWDWiFiMetricLinkChangeData setCountryCode:](self, "setCountryCode:");
  }
  if (*((void *)a3 + 51)) {
    -[AWDWiFiMetricLinkChangeData setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  }
  if (*((void *)a3 + 52)) {
    -[AWDWiFiMetricLinkChangeData setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  }
  if (*((void *)a3 + 47)) {
    -[AWDWiFiMetricLinkChangeData setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  }
  if (*((void *)a3 + 46)) {
    -[AWDWiFiMetricLinkChangeData setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  }
  if (*((void *)a3 + 45)) {
    -[AWDWiFiMetricLinkChangeData setWpsConfigMethods:](self, "setWpsConfigMethods:");
  }
  if (*((void *)a3 + 35)) {
    -[AWDWiFiMetricLinkChangeData setLocaleSource:](self, "setLocaleSource:");
  }
  int v28 = *((_DWORD *)a3 + 109);
  if ((v28 & 0x80000) != 0)
  {
    self->_rxCSAFrames = *((_DWORD *)a3 + 81);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v28 = *((_DWORD *)a3 + 109);
    if ((v28 & 0x20) == 0)
    {
LABEL_84:
      if ((v28 & 0x40) == 0) {
        goto LABEL_86;
      }
      goto LABEL_85;
    }
  }
  else if ((v28 & 0x20) == 0)
  {
    goto LABEL_84;
  }
  self->_channelSwitchDuringHostSleep = *((_DWORD *)a3 + 51);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)a3 + 109) & 0x40) != 0)
  {
LABEL_85:
    self->_channelSwitchDuringHostWake = *((_DWORD *)a3 + 52);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_86:
  if (*((void *)a3 + 39))
  {
    -[AWDWiFiMetricLinkChangeData setPrivateMacType:](self, "setPrivateMacType:");
  }
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

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (double)associationDuration
{
  return self->_associationDuration;
}

- (NSString)wpsResponseType
{
  return self->_wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
}

- (NSString)wpsManufacturerElement
{
  return self->_wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
}

- (NSString)wpsModelName
{
  return self->_wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
}

- (NSString)wpsModelNumber
{
  return self->_wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
}

- (NSString)wpsDeviceNameElement
{
  return self->_wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
}

- (NSString)wpsDeviceNameData
{
  return self->_wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
}

- (NSString)wpsConfigMethods
{
  return self->_wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
}

- (NSString)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(id)a3
{
}

- (unsigned)rxCSAFrames
{
  return self->_rxCSAFrames;
}

- (unsigned)channelSwitchDuringHostSleep
{
  return self->_channelSwitchDuringHostSleep;
}

- (unsigned)channelSwitchDuringHostWake
{
  return self->_channelSwitchDuringHostWake;
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
}

@end