@interface AWDNWConnectionReport
+ (Class)activitiesType;
- (AWDNWDeviceReport)deviceReport;
- (AWDNWL2Report)l2Report;
- (BOOL)customProxyConfigured;
- (BOOL)fallbackEligible;
- (BOOL)firstParty;
- (BOOL)hasAppleApp;
- (BOOL)hasAppleHost;
- (BOOL)hasBestRTT;
- (BOOL)hasBundleID;
- (BOOL)hasBytesDuplicate;
- (BOOL)hasBytesIn;
- (BOOL)hasBytesOut;
- (BOOL)hasBytesOutOfOrder;
- (BOOL)hasBytesRetransmitted;
- (BOOL)hasConnectedAddressFamily;
- (BOOL)hasConnectedAddressIndex;
- (BOOL)hasConnectedInterfaceType;
- (BOOL)hasConnectionMode;
- (BOOL)hasConnectionReuseCount;
- (BOOL)hasConnectionUUID;
- (BOOL)hasCurrentRTT;
- (BOOL)hasCustomProxyConfigured;
- (BOOL)hasDataStallCount;
- (BOOL)hasDeviceReport;
- (BOOL)hasDnsProtocol;
- (BOOL)hasDnsProvider;
- (BOOL)hasEffectiveBundleID;
- (BOOL)hasFailureReason;
- (BOOL)hasFallbackEligible;
- (BOOL)hasFirstAddressFamily;
- (BOOL)hasFirstParty;
- (BOOL)hasFlowConnectMilliseconds;
- (BOOL)hasFlowDurationMilliseconds;
- (BOOL)hasIpv4AddressCount;
- (BOOL)hasIpv4Available;
- (BOOL)hasIpv4DNSServerCount;
- (BOOL)hasIpv6AddressCount;
- (BOOL)hasIpv6Available;
- (BOOL)hasIpv6DNSServerCount;
- (BOOL)hasIsDaemon;
- (BOOL)hasIsPathConstrained;
- (BOOL)hasIsPathExpensive;
- (BOOL)hasL2Report;
- (BOOL)hasMultipathBytesInCell;
- (BOOL)hasMultipathBytesInInitial;
- (BOOL)hasMultipathBytesInWiFi;
- (BOOL)hasMultipathBytesOutCell;
- (BOOL)hasMultipathBytesOutInitial;
- (BOOL)hasMultipathBytesOutWiFi;
- (BOOL)hasMultipathConfigured;
- (BOOL)hasMultipathServiceType;
- (BOOL)hasPacketsIn;
- (BOOL)hasPacketsOut;
- (BOOL)hasPathTriggerMilliseconds;
- (BOOL)hasProcessName;
- (BOOL)hasProhibitsConstrained;
- (BOOL)hasProhibitsExpensive;
- (BOOL)hasProxyMilliseconds;
- (BOOL)hasRTTvariance;
- (BOOL)hasResolutionMilliseconds;
- (BOOL)hasResolutionRequired;
- (BOOL)hasSecondsSinceInterfaceChange;
- (BOOL)hasSmoothedRTT;
- (BOOL)hasStackLevel;
- (BOOL)hasSynRetransmissionCount;
- (BOOL)hasSynthesizedExtraIPv6Address;
- (BOOL)hasSynthesizedIPv6Address;
- (BOOL)hasSystemProxyConfigured;
- (BOOL)hasTfoConfigured;
- (BOOL)hasTfoUsed;
- (BOOL)hasTimestamp;
- (BOOL)hasTlsConfigured;
- (BOOL)hasTlsHandshakeTimedOut;
- (BOOL)hasTlsMilliseconds;
- (BOOL)hasTlsVersion;
- (BOOL)hasTlsVersionTimeout;
- (BOOL)hasTrafficClass;
- (BOOL)hasTransportProtocol;
- (BOOL)hasTriggeredPath;
- (BOOL)hasUsedFallback;
- (BOOL)hasUsedProxyType;
- (BOOL)hasWeakFallback;
- (BOOL)ipv4Available;
- (BOOL)ipv6Available;
- (BOOL)isDaemon;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPathConstrained;
- (BOOL)isPathExpensive;
- (BOOL)multipathConfigured;
- (BOOL)prohibitsConstrained;
- (BOOL)prohibitsExpensive;
- (BOOL)readFrom:(id)a3;
- (BOOL)resolutionRequired;
- (BOOL)synthesizedExtraIPv6Address;
- (BOOL)synthesizedIPv6Address;
- (BOOL)systemProxyConfigured;
- (BOOL)tfoConfigured;
- (BOOL)tfoUsed;
- (BOOL)tlsConfigured;
- (BOOL)tlsHandshakeTimedOut;
- (BOOL)tlsVersionTimeout;
- (BOOL)triggeredPath;
- (BOOL)usedFallback;
- (BOOL)weakFallback;
- (NSMutableArray)activities;
- (NSString)bundleID;
- (NSString)connectionUUID;
- (NSString)effectiveBundleID;
- (NSString)processName;
- (id)activitiesAtIndex:(unint64_t)a3;
- (id)appleAppAsString:(int)a3;
- (id)appleHostAsString:(int)a3;
- (id)connectedAddressFamilyAsString:(int)a3;
- (id)connectedInterfaceTypeAsString:(int)a3;
- (id)connectionModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dnsProtocolAsString:(int)a3;
- (id)dnsProviderAsString:(int)a3;
- (id)failureReasonAsString:(int)a3;
- (id)firstAddressFamilyAsString:(int)a3;
- (id)stackLevelAsString:(int)a3;
- (id)tlsVersionAsString:(int)a3;
- (id)transportProtocolAsString:(int)a3;
- (id)usedProxyTypeAsString:(int)a3;
- (int)StringAsAppleApp:(id)a3;
- (int)StringAsAppleHost:(id)a3;
- (int)StringAsConnectedAddressFamily:(id)a3;
- (int)StringAsConnectedInterfaceType:(id)a3;
- (int)StringAsConnectionMode:(id)a3;
- (int)StringAsDnsProtocol:(id)a3;
- (int)StringAsDnsProvider:(id)a3;
- (int)StringAsFailureReason:(id)a3;
- (int)StringAsFirstAddressFamily:(id)a3;
- (int)StringAsStackLevel:(id)a3;
- (int)StringAsTlsVersion:(id)a3;
- (int)StringAsTransportProtocol:(id)a3;
- (int)StringAsUsedProxyType:(id)a3;
- (int)appleApp;
- (int)appleHost;
- (int)connectedAddressFamily;
- (int)connectedInterfaceType;
- (int)connectionMode;
- (int)dnsProtocol;
- (int)dnsProvider;
- (int)failureReason;
- (int)firstAddressFamily;
- (int)stackLevel;
- (int)tlsVersion;
- (int)transportProtocol;
- (int)usedProxyType;
- (unint64_t)activitiesCount;
- (unint64_t)bestRTT;
- (unint64_t)bytesDuplicate;
- (unint64_t)bytesIn;
- (unint64_t)bytesOut;
- (unint64_t)bytesOutOfOrder;
- (unint64_t)bytesRetransmitted;
- (unint64_t)connectedAddressIndex;
- (unint64_t)connectionReuseCount;
- (unint64_t)currentRTT;
- (unint64_t)dataStallCount;
- (unint64_t)flowConnectMilliseconds;
- (unint64_t)flowDurationMilliseconds;
- (unint64_t)hash;
- (unint64_t)ipv4AddressCount;
- (unint64_t)ipv4DNSServerCount;
- (unint64_t)ipv6AddressCount;
- (unint64_t)ipv6DNSServerCount;
- (unint64_t)multipathBytesInCell;
- (unint64_t)multipathBytesInInitial;
- (unint64_t)multipathBytesInWiFi;
- (unint64_t)multipathBytesOutCell;
- (unint64_t)multipathBytesOutInitial;
- (unint64_t)multipathBytesOutWiFi;
- (unint64_t)multipathServiceType;
- (unint64_t)packetsIn;
- (unint64_t)packetsOut;
- (unint64_t)pathTriggerMilliseconds;
- (unint64_t)proxyMilliseconds;
- (unint64_t)rTTvariance;
- (unint64_t)resolutionMilliseconds;
- (unint64_t)secondsSinceInterfaceChange;
- (unint64_t)smoothedRTT;
- (unint64_t)synRetransmissionCount;
- (unint64_t)timestamp;
- (unint64_t)tlsMilliseconds;
- (unint64_t)trafficClass;
- (void)addActivities:(id)a3;
- (void)clearActivities;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivities:(id)a3;
- (void)setAppleApp:(int)a3;
- (void)setAppleHost:(int)a3;
- (void)setBestRTT:(unint64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setBytesDuplicate:(unint64_t)a3;
- (void)setBytesIn:(unint64_t)a3;
- (void)setBytesOut:(unint64_t)a3;
- (void)setBytesOutOfOrder:(unint64_t)a3;
- (void)setBytesRetransmitted:(unint64_t)a3;
- (void)setConnectedAddressFamily:(int)a3;
- (void)setConnectedAddressIndex:(unint64_t)a3;
- (void)setConnectedInterfaceType:(int)a3;
- (void)setConnectionMode:(int)a3;
- (void)setConnectionReuseCount:(unint64_t)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setCurrentRTT:(unint64_t)a3;
- (void)setCustomProxyConfigured:(BOOL)a3;
- (void)setDataStallCount:(unint64_t)a3;
- (void)setDeviceReport:(id)a3;
- (void)setDnsProtocol:(int)a3;
- (void)setDnsProvider:(int)a3;
- (void)setEffectiveBundleID:(id)a3;
- (void)setFailureReason:(int)a3;
- (void)setFallbackEligible:(BOOL)a3;
- (void)setFirstAddressFamily:(int)a3;
- (void)setFirstParty:(BOOL)a3;
- (void)setFlowConnectMilliseconds:(unint64_t)a3;
- (void)setFlowDurationMilliseconds:(unint64_t)a3;
- (void)setHasAppleApp:(BOOL)a3;
- (void)setHasAppleHost:(BOOL)a3;
- (void)setHasBestRTT:(BOOL)a3;
- (void)setHasBytesDuplicate:(BOOL)a3;
- (void)setHasBytesIn:(BOOL)a3;
- (void)setHasBytesOut:(BOOL)a3;
- (void)setHasBytesOutOfOrder:(BOOL)a3;
- (void)setHasBytesRetransmitted:(BOOL)a3;
- (void)setHasConnectedAddressFamily:(BOOL)a3;
- (void)setHasConnectedAddressIndex:(BOOL)a3;
- (void)setHasConnectedInterfaceType:(BOOL)a3;
- (void)setHasConnectionMode:(BOOL)a3;
- (void)setHasConnectionReuseCount:(BOOL)a3;
- (void)setHasCurrentRTT:(BOOL)a3;
- (void)setHasCustomProxyConfigured:(BOOL)a3;
- (void)setHasDataStallCount:(BOOL)a3;
- (void)setHasDnsProtocol:(BOOL)a3;
- (void)setHasDnsProvider:(BOOL)a3;
- (void)setHasFailureReason:(BOOL)a3;
- (void)setHasFallbackEligible:(BOOL)a3;
- (void)setHasFirstAddressFamily:(BOOL)a3;
- (void)setHasFirstParty:(BOOL)a3;
- (void)setHasFlowConnectMilliseconds:(BOOL)a3;
- (void)setHasFlowDurationMilliseconds:(BOOL)a3;
- (void)setHasIpv4AddressCount:(BOOL)a3;
- (void)setHasIpv4Available:(BOOL)a3;
- (void)setHasIpv4DNSServerCount:(BOOL)a3;
- (void)setHasIpv6AddressCount:(BOOL)a3;
- (void)setHasIpv6Available:(BOOL)a3;
- (void)setHasIpv6DNSServerCount:(BOOL)a3;
- (void)setHasIsDaemon:(BOOL)a3;
- (void)setHasIsPathConstrained:(BOOL)a3;
- (void)setHasIsPathExpensive:(BOOL)a3;
- (void)setHasMultipathBytesInCell:(BOOL)a3;
- (void)setHasMultipathBytesInInitial:(BOOL)a3;
- (void)setHasMultipathBytesInWiFi:(BOOL)a3;
- (void)setHasMultipathBytesOutCell:(BOOL)a3;
- (void)setHasMultipathBytesOutInitial:(BOOL)a3;
- (void)setHasMultipathBytesOutWiFi:(BOOL)a3;
- (void)setHasMultipathConfigured:(BOOL)a3;
- (void)setHasMultipathServiceType:(BOOL)a3;
- (void)setHasPacketsIn:(BOOL)a3;
- (void)setHasPacketsOut:(BOOL)a3;
- (void)setHasPathTriggerMilliseconds:(BOOL)a3;
- (void)setHasProhibitsConstrained:(BOOL)a3;
- (void)setHasProhibitsExpensive:(BOOL)a3;
- (void)setHasProxyMilliseconds:(BOOL)a3;
- (void)setHasRTTvariance:(BOOL)a3;
- (void)setHasResolutionMilliseconds:(BOOL)a3;
- (void)setHasResolutionRequired:(BOOL)a3;
- (void)setHasSecondsSinceInterfaceChange:(BOOL)a3;
- (void)setHasSmoothedRTT:(BOOL)a3;
- (void)setHasStackLevel:(BOOL)a3;
- (void)setHasSynRetransmissionCount:(BOOL)a3;
- (void)setHasSynthesizedExtraIPv6Address:(BOOL)a3;
- (void)setHasSynthesizedIPv6Address:(BOOL)a3;
- (void)setHasSystemProxyConfigured:(BOOL)a3;
- (void)setHasTfoConfigured:(BOOL)a3;
- (void)setHasTfoUsed:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTlsConfigured:(BOOL)a3;
- (void)setHasTlsHandshakeTimedOut:(BOOL)a3;
- (void)setHasTlsMilliseconds:(BOOL)a3;
- (void)setHasTlsVersion:(BOOL)a3;
- (void)setHasTlsVersionTimeout:(BOOL)a3;
- (void)setHasTrafficClass:(BOOL)a3;
- (void)setHasTransportProtocol:(BOOL)a3;
- (void)setHasTriggeredPath:(BOOL)a3;
- (void)setHasUsedFallback:(BOOL)a3;
- (void)setHasUsedProxyType:(BOOL)a3;
- (void)setHasWeakFallback:(BOOL)a3;
- (void)setIpv4AddressCount:(unint64_t)a3;
- (void)setIpv4Available:(BOOL)a3;
- (void)setIpv4DNSServerCount:(unint64_t)a3;
- (void)setIpv6AddressCount:(unint64_t)a3;
- (void)setIpv6Available:(BOOL)a3;
- (void)setIpv6DNSServerCount:(unint64_t)a3;
- (void)setIsDaemon:(BOOL)a3;
- (void)setIsPathConstrained:(BOOL)a3;
- (void)setIsPathExpensive:(BOOL)a3;
- (void)setL2Report:(id)a3;
- (void)setMultipathBytesInCell:(unint64_t)a3;
- (void)setMultipathBytesInInitial:(unint64_t)a3;
- (void)setMultipathBytesInWiFi:(unint64_t)a3;
- (void)setMultipathBytesOutCell:(unint64_t)a3;
- (void)setMultipathBytesOutInitial:(unint64_t)a3;
- (void)setMultipathBytesOutWiFi:(unint64_t)a3;
- (void)setMultipathConfigured:(BOOL)a3;
- (void)setMultipathServiceType:(unint64_t)a3;
- (void)setPacketsIn:(unint64_t)a3;
- (void)setPacketsOut:(unint64_t)a3;
- (void)setPathTriggerMilliseconds:(unint64_t)a3;
- (void)setProcessName:(id)a3;
- (void)setProhibitsConstrained:(BOOL)a3;
- (void)setProhibitsExpensive:(BOOL)a3;
- (void)setProxyMilliseconds:(unint64_t)a3;
- (void)setRTTvariance:(unint64_t)a3;
- (void)setResolutionMilliseconds:(unint64_t)a3;
- (void)setResolutionRequired:(BOOL)a3;
- (void)setSecondsSinceInterfaceChange:(unint64_t)a3;
- (void)setSmoothedRTT:(unint64_t)a3;
- (void)setStackLevel:(int)a3;
- (void)setSynRetransmissionCount:(unint64_t)a3;
- (void)setSynthesizedExtraIPv6Address:(BOOL)a3;
- (void)setSynthesizedIPv6Address:(BOOL)a3;
- (void)setSystemProxyConfigured:(BOOL)a3;
- (void)setTfoConfigured:(BOOL)a3;
- (void)setTfoUsed:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTlsConfigured:(BOOL)a3;
- (void)setTlsHandshakeTimedOut:(BOOL)a3;
- (void)setTlsMilliseconds:(unint64_t)a3;
- (void)setTlsVersion:(int)a3;
- (void)setTlsVersionTimeout:(BOOL)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)setTransportProtocol:(int)a3;
- (void)setTriggeredPath:(BOOL)a3;
- (void)setUsedFallback:(BOOL)a3;
- (void)setUsedProxyType:(int)a3;
- (void)setWeakFallback:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNWConnectionReport

- (void)dealloc
{
  [(AWDNWConnectionReport *)self setProcessName:0];
  [(AWDNWConnectionReport *)self setActivities:0];
  [(AWDNWConnectionReport *)self setConnectionUUID:0];
  [(AWDNWConnectionReport *)self setL2Report:0];
  [(AWDNWConnectionReport *)self setDeviceReport:0];
  [(AWDNWConnectionReport *)self setBundleID:0];
  [(AWDNWConnectionReport *)self setEffectiveBundleID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNWConnectionReport;
  [(AWDNWConnectionReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasTimestamp
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (void)setTriggeredPath:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 0x10u;
  self->_triggeredPath = a3;
}

- (void)setHasTriggeredPath:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xEF | v3;
}

- (BOOL)hasTriggeredPath
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setSystemProxyConfigured:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_systemProxyConfigured = a3;
}

- (void)setHasSystemProxyConfigured:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSystemProxyConfigured
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (void)setCustomProxyConfigured:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_customProxyConfigured = a3;
}

- (void)setHasCustomProxyConfigured:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCustomProxyConfigured
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (int)usedProxyType
{
  if ((*(void *)&self->_has & 0x800000000000) != 0) {
    return self->_usedProxyType;
  }
  else {
    return 0;
  }
}

- (void)setUsedProxyType:(int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_usedProxyType = a3;
}

- (void)setHasUsedProxyType:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasUsedProxyType
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (id)usedProxyTypeAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9828[a3];
  }
}

- (int)StringAsUsedProxyType:(id)a3
{
  if ([a3 isEqualToString:@"NW_PROXY_TYPE_NONE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_PROXY_TYPE_DIRECT"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_PROXY_TYPE_HTTP"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_PROXY_TYPE_HTTPS"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_PROXY_TYPE_SOCKS"]) {
    return 4;
  }
  return 0;
}

- (void)setFallbackEligible:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_fallbackEligible = a3;
}

- (void)setHasFallbackEligible:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFallbackEligible
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setWeakFallback:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 0x40u;
  self->_weakFallback = a3;
}

- (void)setHasWeakFallback:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xBF | v3;
}

- (BOOL)hasWeakFallback
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 6) & 1;
}

- (void)setUsedFallback:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 0x20u;
  self->_usedFallback = a3;
}

- (void)setHasUsedFallback:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xDF | v3;
}

- (BOOL)hasUsedFallback
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 5) & 1;
}

- (void)setResolutionRequired:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_resolutionRequired = a3;
}

- (void)setHasResolutionRequired:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasResolutionRequired
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (void)setTlsConfigured:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 2u;
  self->_tlsConfigured = a3;
}

- (void)setHasTlsConfigured:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xFD | v3;
}

- (BOOL)hasTlsConfigured
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setTfoConfigured:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_tfoConfigured = a3;
}

- (void)setHasTfoConfigured:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasTfoConfigured
{
  return *(void *)&self->_has >> 63;
}

- (void)setMultipathConfigured:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_multipathConfigured = a3;
}

- (void)setHasMultipathConfigured:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMultipathConfigured
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setTrafficClass:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_trafficClass = a3;
}

- (void)setHasTrafficClass:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasTrafficClass
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (int)failureReason
{
  if ((*(void *)&self->_has & 0x40000000000) != 0) {
    return self->_failureReason;
  }
  else {
    return 0;
  }
}

- (void)setFailureReason:(int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasFailureReason
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (id)failureReasonAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9850[a3];
  }
}

- (int)StringAsFailureReason:(id)a3
{
  if ([a3 isEqualToString:@"NW_FAILURE_REASON_NONE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_FAILURE_REASON_PATH"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_FAILURE_REASON_RESOLVER"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_FAILURE_REASON_FLOW"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_FAILURE_REASON_TLS"]) {
    return 4;
  }
  return 0;
}

- (void)setPathTriggerMilliseconds:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_pathTriggerMilliseconds = a3;
}

- (void)setHasPathTriggerMilliseconds:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasPathTriggerMilliseconds
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (void)setResolutionMilliseconds:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_resolutionMilliseconds = a3;
}

- (void)setHasResolutionMilliseconds:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasResolutionMilliseconds
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (void)setProxyMilliseconds:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_proxyMilliseconds = a3;
}

- (void)setHasProxyMilliseconds:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasProxyMilliseconds
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setFlowConnectMilliseconds:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_flowConnectMilliseconds = a3;
}

- (void)setHasFlowConnectMilliseconds:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasFlowConnectMilliseconds
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (void)setTlsMilliseconds:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_tlsMilliseconds = a3;
}

- (void)setHasTlsMilliseconds:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasTlsMilliseconds
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (void)setFlowDurationMilliseconds:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_flowDurationMilliseconds = a3;
}

- (void)setHasFlowDurationMilliseconds:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasFlowDurationMilliseconds
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (void)setIpv4AddressCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_ipv4AddressCount = a3;
}

- (void)setHasIpv4AddressCount:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasIpv4AddressCount
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (void)setIpv6AddressCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_ipv6AddressCount = a3;
}

- (void)setHasIpv6AddressCount:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasIpv6AddressCount
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (void)setSynthesizedIPv6Address:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_synthesizedIPv6Address = a3;
}

- (void)setHasSynthesizedIPv6Address:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSynthesizedIPv6Address
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (int)firstAddressFamily
{
  if ((*(void *)&self->_has & 0x80000000000) != 0) {
    return self->_firstAddressFamily;
  }
  else {
    return 0;
  }
}

- (void)setFirstAddressFamily:(int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_firstAddressFamily = a3;
}

- (void)setHasFirstAddressFamily:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstAddressFamily
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (id)firstAddressFamilyAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9878[a3];
  }
}

- (int)StringAsFirstAddressFamily:(id)a3
{
  if ([a3 isEqualToString:@"NW_ADDRESS_FAMILY_OTHER"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_ADDRESS_FAMILY_IPV4"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_ADDRESS_FAMILY_IPV6"]) {
    return 2;
  }
  return 0;
}

- (int)connectedAddressFamily
{
  if ((*(void *)&self->_has & 0x2000000000) != 0) {
    return self->_connectedAddressFamily;
  }
  else {
    return 0;
  }
}

- (void)setConnectedAddressFamily:(int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_connectedAddressFamily = a3;
}

- (void)setHasConnectedAddressFamily:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasConnectedAddressFamily
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (id)connectedAddressFamilyAsString:(int)a3
{
  if (a3 >= 3) {
    return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9878[a3];
  }
}

- (int)StringAsConnectedAddressFamily:(id)a3
{
  if ([a3 isEqualToString:@"NW_ADDRESS_FAMILY_OTHER"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_ADDRESS_FAMILY_IPV4"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_ADDRESS_FAMILY_IPV6"]) {
    return 2;
  }
  return 0;
}

- (void)setConnectedAddressIndex:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_connectedAddressIndex = a3;
}

- (void)setHasConnectedAddressIndex:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasConnectedAddressIndex
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (int)connectedInterfaceType
{
  if ((*(void *)&self->_has & 0x4000000000) != 0) {
    return self->_connectedInterfaceType;
  }
  else {
    return 0;
  }
}

- (void)setConnectedInterfaceType:(int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_connectedInterfaceType = a3;
}

- (void)setHasConnectedInterfaceType:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasConnectedInterfaceType
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (id)connectedInterfaceTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9890[a3];
  }
}

- (int)StringAsConnectedInterfaceType:(id)a3
{
  if ([a3 isEqualToString:@"NW_INTERFACE_TYPE_OTHER"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_INTERFACE_TYPE_WIFI"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_INTERFACE_TYPE_CELLULAR"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_INTERFACE_TYPE_WIRED"]) {
    return 3;
  }
  return 0;
}

- (void)setConnectionReuseCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_connectionReuseCount = a3;
}

- (void)setHasConnectionReuseCount:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasConnectionReuseCount
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setDataStallCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_dataStallCount = a3;
}

- (void)setHasDataStallCount:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasDataStallCount
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (int)connectionMode
{
  if ((*(void *)&self->_has & 0x8000000000) != 0) {
    return self->_connectionMode;
  }
  else {
    return 0;
  }
}

- (void)setConnectionMode:(int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_connectionMode = a3;
}

- (void)setHasConnectionMode:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasConnectionMode
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (id)connectionModeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B98B0[a3];
  }
}

- (int)StringAsConnectionMode:(id)a3
{
  if ([a3 isEqualToString:@"NW_CONNECTION_MODE_NONE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_CONNECTION_MODE_STREAM"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_CONNECTION_MODE_DATAGRAM"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_CONNECTION_MODE_MESSAGE"]) {
    return 3;
  }
  return 0;
}

- (int)appleHost
{
  if ((*(void *)&self->_has & 0x1000000000) != 0) {
    return self->_appleHost;
  }
  else {
    return 0;
  }
}

- (void)setAppleHost:(int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_appleHost = a3;
}

- (void)setHasAppleHost:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasAppleHost
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (id)appleHostAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B98D0[a3];
  }
}

- (int)StringAsAppleHost:(id)a3
{
  if ([a3 isEqualToString:@"NW_APPLE_HOST_NONE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_APPLE_HOST_APPLE_COM"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_APPLE_HOST_ICLOUD_COM"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_APPLE_HOST_MZSTATIC_COM"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_APPLE_HOST_ME_COM"]) {
    return 4;
  }
  return 0;
}

- (int)appleApp
{
  if ((*(void *)&self->_has & 0x800000000) != 0) {
    return self->_appleApp;
  }
  else {
    return 0;
  }
}

- (void)setAppleApp:(int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_appleApp = a3;
}

- (void)setHasAppleApp:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasAppleApp
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (id)appleAppAsString:(int)a3
{
  if (a3 >= 0xA) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B98F8[a3];
  }
}

- (int)StringAsAppleApp:(id)a3
{
  if ([a3 isEqualToString:@"NW_APPLE_APP_NONE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_MESSAGES"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_SAFARI"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_MAIL"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_MAPS"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_PHOTOS"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_MUSIC"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_APP_STORE"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_ITUNES_STORE"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"NW_APPLE_APP_SIRI"]) {
    return 9;
  }
  return 0;
}

- (int)tlsVersion
{
  if ((*(void *)&self->_has & 0x200000000000) != 0) {
    return self->_tlsVersion;
  }
  else {
    return 0;
  }
}

- (void)setTlsVersion:(int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_tlsVersion = a3;
}

- (void)setHasTlsVersion:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTlsVersion
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (id)tlsVersionAsString:(int)a3
{
  if (a3 >= 7) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9948[a3];
  }
}

- (int)StringAsTlsVersion:(id)a3
{
  if ([a3 isEqualToString:@"NW_TLS_VERSION_NONE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_TLS_VERSION_SSL_3"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_TLS_VERSION_TLS_1_0"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_TLS_VERSION_TLS_1_1"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_TLS_VERSION_TLS_1_2"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"NW_TLS_VERSION_TLS_1_3"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"NW_TLS_VERSION_DTLS_1_0"]) {
    return 6;
  }
  return 0;
}

- (int)stackLevel
{
  if ((*(void *)&self->_has & 0x100000000000) != 0) {
    return self->_stackLevel;
  }
  else {
    return 0;
  }
}

- (void)setStackLevel:(int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_stackLevel = a3;
}

- (void)setHasStackLevel:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasStackLevel
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (id)stackLevelAsString:(int)a3
{
  if (a3 >= 6) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9980[a3];
  }
}

- (int)StringAsStackLevel:(id)a3
{
  if ([a3 isEqualToString:@"NW_STACK_LEVEL_UNDEFINED"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_STACK_LEVEL_APPLICATION_SOCKET"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_STACK_LEVEL_APPLICATION"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_STACK_LEVEL_TRANSPORT"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_STACK_LEVEL_INTERNET"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"NW_STACK_LEVEL_LINK"]) {
    return 5;
  }
  return 0;
}

- (void)setIpv4Available:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_ipv4Available = a3;
}

- (void)setHasIpv4Available:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIpv4Available
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (void)setIpv6Available:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_ipv6Available = a3;
}

- (void)setHasIpv6Available:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIpv6Available
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (void)setIpv4DNSServerCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_ipv4DNSServerCount = a3;
}

- (void)setHasIpv4DNSServerCount:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasIpv4DNSServerCount
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (void)setIpv6DNSServerCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_ipv6DNSServerCount = a3;
}

- (void)setHasIpv6DNSServerCount:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasIpv6DNSServerCount
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (void)setTlsVersionTimeout:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 8u;
  self->_tlsVersionTimeout = a3;
}

- (void)setHasTlsVersionTimeout:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xF7 | v3;
}

- (BOOL)hasTlsVersionTimeout
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)setSynthesizedExtraIPv6Address:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_synthesizedExtraIPv6Address = a3;
}

- (void)setHasSynthesizedExtraIPv6Address:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSynthesizedExtraIPv6Address
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (void)setBytesIn:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_bytesIn = a3;
}

- (void)setHasBytesIn:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasBytesIn
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (void)setBytesOut:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_bytesOut = a3;
}

- (void)setHasBytesOut:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasBytesOut
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (void)setBytesDuplicate:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_bytesDuplicate = a3;
}

- (void)setHasBytesDuplicate:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasBytesDuplicate
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (void)setBytesOutOfOrder:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_bytesOutOfOrder = a3;
}

- (void)setHasBytesOutOfOrder:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasBytesOutOfOrder
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (void)setBytesRetransmitted:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_bytesRetransmitted = a3;
}

- (void)setHasBytesRetransmitted:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasBytesRetransmitted
{
  return (*(void *)&self->_has >> 5) & 1;
}

- (void)setPacketsIn:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_packetsIn = a3;
}

- (void)setHasPacketsIn:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasPacketsIn
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setPacketsOut:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_packetsOut = a3;
}

- (void)setHasPacketsOut:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasPacketsOut
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setCurrentRTT:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_currentRTT = a3;
}

- (void)setHasCurrentRTT:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCurrentRTT
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setSmoothedRTT:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_smoothedRTT = a3;
}

- (void)setHasSmoothedRTT:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasSmoothedRTT
{
  return (*(void *)&self->_has >> 30) & 1;
}

- (void)setBestRTT:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_bestRTT = a3;
}

- (void)setHasBestRTT:(BOOL)a3
{
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasBestRTT
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRTTvariance:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_rTTvariance = a3;
}

- (void)setHasRTTvariance:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasRTTvariance
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setSynRetransmissionCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_synRetransmissionCount = a3;
}

- (void)setHasSynRetransmissionCount:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasSynRetransmissionCount
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (void)setTfoUsed:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 1u;
  self->_tfoUsed = a3;
}

- (void)setHasTfoUsed:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xFE | a3;
}

- (BOOL)hasTfoUsed
{
  return *((unsigned char *)&self->_has + 8) & 1;
}

- (void)setMultipathServiceType:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_multipathServiceType = a3;
}

- (void)setHasMultipathServiceType:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasMultipathServiceType
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setFirstParty:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_firstParty = a3;
}

- (void)setHasFirstParty:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstParty
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (void)setMultipathBytesInCell:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_multipathBytesInCell = a3;
}

- (void)setHasMultipathBytesInCell:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasMultipathBytesInCell
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (void)setMultipathBytesOutCell:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_multipathBytesOutCell = a3;
}

- (void)setHasMultipathBytesOutCell:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasMultipathBytesOutCell
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (void)setMultipathBytesInWiFi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_multipathBytesInWiFi = a3;
}

- (void)setHasMultipathBytesInWiFi:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasMultipathBytesInWiFi
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (void)setMultipathBytesOutWiFi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_multipathBytesOutWiFi = a3;
}

- (void)setHasMultipathBytesOutWiFi:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasMultipathBytesOutWiFi
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (void)setMultipathBytesInInitial:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_multipathBytesInInitial = a3;
}

- (void)setHasMultipathBytesInInitial:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasMultipathBytesInInitial
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setMultipathBytesOutInitial:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_multipathBytesOutInitial = a3;
}

- (void)setHasMultipathBytesOutInitial:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasMultipathBytesOutInitial
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (void)setSecondsSinceInterfaceChange:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_secondsSinceInterfaceChange = a3;
}

- (void)setHasSecondsSinceInterfaceChange:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasSecondsSinceInterfaceChange
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setIsDaemon:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_isDaemon = a3;
}

- (void)setHasIsDaemon:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsDaemon
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (void)clearActivities
{
}

- (void)addActivities:(id)a3
{
  activities = self->_activities;
  if (!activities)
  {
    activities = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_activities = activities;
  }

  [(NSMutableArray *)activities addObject:a3];
}

- (unint64_t)activitiesCount
{
  return [(NSMutableArray *)self->_activities count];
}

- (id)activitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_activities objectAtIndex:a3];
}

+ (Class)activitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasConnectionUUID
{
  return self->_connectionUUID != 0;
}

- (void)setTlsHandshakeTimedOut:(BOOL)a3
{
  *((unsigned char *)&self->_has + 8) |= 4u;
  self->_tlsHandshakeTimedOut = a3;
}

- (void)setHasTlsHandshakeTimedOut:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_has + 8) = *((unsigned char *)&self->_has + 8) & 0xFB | v3;
}

- (BOOL)hasTlsHandshakeTimedOut
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setIsPathExpensive:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_isPathExpensive = a3;
}

- (void)setHasIsPathExpensive:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsPathExpensive
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)setIsPathConstrained:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_isPathConstrained = a3;
}

- (void)setHasIsPathConstrained:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsPathConstrained
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (void)setProhibitsExpensive:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_prohibitsExpensive = a3;
}

- (void)setHasProhibitsExpensive:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProhibitsExpensive
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (void)setProhibitsConstrained:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_prohibitsConstrained = a3;
}

- (void)setHasProhibitsConstrained:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProhibitsConstrained
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (BOOL)hasL2Report
{
  return self->_l2Report != 0;
}

- (BOOL)hasDeviceReport
{
  return self->_deviceReport != 0;
}

- (int)transportProtocol
{
  if ((*(void *)&self->_has & 0x400000000000) != 0) {
    return self->_transportProtocol;
  }
  else {
    return 0;
  }
}

- (void)setTransportProtocol:(int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_transportProtocol = a3;
}

- (void)setHasTransportProtocol:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTransportProtocol
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (id)transportProtocolAsString:(int)a3
{
  if (a3 >= 4) {
    return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B99B0[a3];
  }
}

- (int)StringAsTransportProtocol:(id)a3
{
  if ([a3 isEqualToString:@"NW_TRANSPORT_PROTOCOL_UNKNOWN"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_TRANSPORT_PROTOCOL_TCP"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_TRANSPORT_PROTOCOL_UDP"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_TRANSPORT_PROTOCOL_QUIC"]) {
    return 3;
  }
  return 0;
}

- (int)dnsProtocol
{
  if ((*(void *)&self->_has & 0x10000000000) != 0) {
    return self->_dnsProtocol;
  }
  else {
    return 0;
  }
}

- (void)setDnsProtocol:(int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_dnsProtocol = a3;
}

- (void)setHasDnsProtocol:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasDnsProtocol
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (id)dnsProtocolAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B99D0[a3];
  }
}

- (int)StringAsDnsProtocol:(id)a3
{
  if ([a3 isEqualToString:@"NW_DNS_PROTOCOL_UNKNOWN"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_DNS_PROTOCOL_UDP"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_DNS_PROTOCOL_TCP"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_DNS_PROTOCOL_TLS"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NW_DNS_PROTOCOL_HTTPS"]) {
    return 4;
  }
  return 0;
}

- (int)dnsProvider
{
  if ((*(void *)&self->_has & 0x20000000000) != 0) {
    return self->_dnsProvider;
  }
  else {
    return 0;
  }
}

- (void)setDnsProvider:(int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_dnsProvider = a3;
}

- (void)setHasDnsProvider:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasDnsProvider
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (id)dnsProviderAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B99F8[a3];
  }
}

- (int)StringAsDnsProvider:(id)a3
{
  if ([a3 isEqualToString:@"NW_DNS_PROVIDER_UNKNOWN"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NW_DNS_PROVIDER_CLOUDFLARE"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NW_DNS_PROVIDER_GOOGLE"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NW_DNS_PROVIDER_QUAD9"]) {
    return 3;
  }
  return 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasEffectiveBundleID
{
  return self->_effectiveBundleID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNWConnectionReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNWConnectionReport description](&v3, sel_description), -[AWDNWConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    uint64_t has = (uint64_t)self->_has;
  }
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((v5 & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_triggeredPath] forKey:@"triggeredPath"];
    uint64_t has = (uint64_t)self->_has;
    char v5 = *((unsigned char *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_89;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_systemProxyConfigured] forKey:@"systemProxyConfigured"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_90;
  }
LABEL_89:
  [v3 setObject:[NSNumber numberWithBool:self->_customProxyConfigured] forKey:@"customProxyConfigured"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_100;
  }
LABEL_90:
  uint64_t usedProxyType = self->_usedProxyType;
  if (usedProxyType >= 5) {
    v15 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_usedProxyType];
  }
  else {
    v15 = off_2641B9828[usedProxyType];
  }
  [v3 setObject:v15 forKey:@"usedProxyType"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_101;
  }
LABEL_100:
  [v3 setObject:[NSNumber numberWithBool:self->_fallbackEligible] forKey:@"fallbackEligible"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_102;
  }
LABEL_101:
  [v3 setObject:[NSNumber numberWithBool:self->_weakFallback] forKey:@"weakFallback"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_103;
  }
LABEL_102:
  [v3 setObject:[NSNumber numberWithBool:self->_usedFallback] forKey:@"usedFallback"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_104;
  }
LABEL_103:
  [v3 setObject:[NSNumber numberWithBool:self->_resolutionRequired] forKey:@"resolutionRequired"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_105;
  }
LABEL_104:
  [v3 setObject:[NSNumber numberWithBool:self->_tlsConfigured] forKey:@"tlsConfigured"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_106;
  }
LABEL_105:
  [v3 setObject:[NSNumber numberWithBool:self->_tfoConfigured] forKey:@"tfoConfigured"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_107;
  }
LABEL_106:
  [v3 setObject:[NSNumber numberWithBool:self->_multipathConfigured] forKey:@"multipathConfigured"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_trafficClass] forKey:@"trafficClass"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_116;
  }
LABEL_108:
  uint64_t failureReason = self->_failureReason;
  if (failureReason >= 5) {
    v19 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_failureReason];
  }
  else {
    v19 = off_2641B9850[failureReason];
  }
  [v3 setObject:v19 forKey:@"failureReason"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_117;
  }
LABEL_116:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_pathTriggerMilliseconds] forKey:@"pathTriggerMilliseconds"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_118;
  }
LABEL_117:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resolutionMilliseconds] forKey:@"resolutionMilliseconds"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_119;
  }
LABEL_118:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_proxyMilliseconds] forKey:@"proxyMilliseconds"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_120;
  }
LABEL_119:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_flowConnectMilliseconds] forKey:@"flowConnectMilliseconds"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_121;
  }
LABEL_120:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tlsMilliseconds] forKey:@"tlsMilliseconds"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_122;
  }
LABEL_121:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_flowDurationMilliseconds] forKey:@"flowDurationMilliseconds"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_123;
  }
LABEL_122:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ipv4AddressCount] forKey:@"ipv4AddressCount"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_124;
  }
LABEL_123:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ipv6AddressCount] forKey:@"ipv6AddressCount"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_125;
  }
LABEL_124:
  [v3 setObject:[NSNumber numberWithBool:self->_synthesizedIPv6Address] forKey:@"synthesizedIPv6Address"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_133;
  }
LABEL_125:
  uint64_t firstAddressFamily = self->_firstAddressFamily;
  if (firstAddressFamily >= 3) {
    v23 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_firstAddressFamily];
  }
  else {
    v23 = off_2641B9878[firstAddressFamily];
  }
  [v3 setObject:v23 forKey:@"firstAddressFamily"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_144;
  }
LABEL_133:
  uint64_t connectedAddressFamily = self->_connectedAddressFamily;
  if (connectedAddressFamily >= 3) {
    v27 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_connectedAddressFamily];
  }
  else {
    v27 = off_2641B9878[connectedAddressFamily];
  }
  [v3 setObject:v27 forKey:@"connectedAddressFamily"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_145;
  }
LABEL_144:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectedAddressIndex] forKey:@"connectedAddressIndex"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_149;
  }
LABEL_145:
  uint64_t connectedInterfaceType = self->_connectedInterfaceType;
  if (connectedInterfaceType >= 4) {
    v32 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_connectedInterfaceType];
  }
  else {
    v32 = off_2641B9890[connectedInterfaceType];
  }
  [v3 setObject:v32 forKey:@"connectedInterfaceType"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_150;
  }
LABEL_149:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionReuseCount] forKey:@"connectionReuseCount"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_151;
  }
LABEL_150:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dataStallCount] forKey:@"dataStallCount"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_155;
  }
LABEL_151:
  uint64_t connectionMode = self->_connectionMode;
  if (connectionMode >= 4) {
    v34 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_connectionMode];
  }
  else {
    v34 = off_2641B98B0[connectionMode];
  }
  [v3 setObject:v34 forKey:@"connectionMode"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_159;
  }
LABEL_155:
  uint64_t appleHost = self->_appleHost;
  if (appleHost >= 5) {
    v36 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_appleHost];
  }
  else {
    v36 = off_2641B98D0[appleHost];
  }
  [v3 setObject:v36 forKey:@"appleHost"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_163;
  }
LABEL_159:
  uint64_t appleApp = self->_appleApp;
  if (appleApp >= 0xA) {
    v38 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_appleApp];
  }
  else {
    v38 = off_2641B98F8[appleApp];
  }
  [v3 setObject:v38 forKey:@"appleApp"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_167;
  }
LABEL_163:
  uint64_t tlsVersion = self->_tlsVersion;
  if (tlsVersion >= 7) {
    v40 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_tlsVersion];
  }
  else {
    v40 = off_2641B9948[tlsVersion];
  }
  [v3 setObject:v40 forKey:@"tlsVersion"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_171;
  }
LABEL_167:
  uint64_t stackLevel = self->_stackLevel;
  if (stackLevel >= 6) {
    v42 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_stackLevel];
  }
  else {
    v42 = off_2641B9980[stackLevel];
  }
  [v3 setObject:v42 forKey:@"stackLevel"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_172;
  }
LABEL_171:
  [v3 setObject:[NSNumber numberWithBool:self->_ipv4Available] forKey:@"ipv4Available"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_173;
  }
LABEL_172:
  [v3 setObject:[NSNumber numberWithBool:self->_ipv6Available] forKey:@"ipv6Available"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_174;
  }
LABEL_173:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ipv4DNSServerCount] forKey:@"ipv4DNSServerCount"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v5 & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_175;
  }
LABEL_174:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ipv6DNSServerCount] forKey:@"ipv6DNSServerCount"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((v5 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_176;
  }
LABEL_175:
  [v3 setObject:[NSNumber numberWithBool:self->_tlsVersionTimeout] forKey:@"tlsVersionTimeout"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0) {
      goto LABEL_43;
    }
    goto LABEL_177;
  }
LABEL_176:
  [v3 setObject:[NSNumber numberWithBool:self->_synthesizedExtraIPv6Address] forKey:@"synthesizedExtraIPv6Address"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0) {
      goto LABEL_44;
    }
    goto LABEL_178;
  }
LABEL_177:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesIn] forKey:@"bytesIn"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0) {
      goto LABEL_45;
    }
    goto LABEL_179;
  }
LABEL_178:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesOut] forKey:@"bytesOut"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_180;
  }
LABEL_179:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesDuplicate] forKey:@"bytesDuplicate"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_181;
  }
LABEL_180:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesOutOfOrder] forKey:@"bytesOutOfOrder"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_182;
  }
LABEL_181:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesRetransmitted] forKey:@"bytesRetransmitted"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_183;
  }
LABEL_182:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsIn] forKey:@"packetsIn"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0) {
      goto LABEL_50;
    }
    goto LABEL_184;
  }
LABEL_183:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsOut] forKey:@"packetsOut"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_185;
  }
LABEL_184:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_currentRTT] forKey:@"currentRTT"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_186;
  }
LABEL_185:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_smoothedRTT] forKey:@"smoothedRTT"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_187;
  }
LABEL_186:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bestRTT] forKey:@"bestRTT"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_188;
  }
LABEL_187:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rTTvariance] forKey:@"RTTvariance"];
  uint64_t has = (uint64_t)self->_has;
  char v5 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v5 & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_189;
  }
LABEL_188:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_synRetransmissionCount] forKey:@"synRetransmissionCount"];
  uint64_t has = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_190;
  }
LABEL_189:
  [v3 setObject:[NSNumber numberWithBool:self->_tfoUsed] forKey:@"tfoUsed"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_191;
  }
LABEL_190:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathServiceType] forKey:@"multipathServiceType"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_192;
  }
LABEL_191:
  [v3 setObject:[NSNumber numberWithBool:self->_firstParty] forKey:@"firstParty"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_193;
  }
LABEL_192:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInCell] forKey:@"multipathBytesInCell"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_194;
  }
LABEL_193:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutCell] forKey:@"multipathBytesOutCell"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_195;
  }
LABEL_194:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInWiFi] forKey:@"multipathBytesInWiFi"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_196;
  }
LABEL_195:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutWiFi] forKey:@"multipathBytesOutWiFi"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_197;
  }
LABEL_196:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInInitial] forKey:@"multipathBytesInInitial"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_198;
  }
LABEL_197:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutInitial] forKey:@"multipathBytesOutInitial"];
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_198:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_secondsSinceInterfaceChange] forKey:@"secondsSinceInterfaceChange"];
  if ((*(void *)&self->_has & 0x20000000000000) != 0) {
LABEL_65:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_isDaemon] forKey:@"isDaemon"];
LABEL_66:
  processName = self->_processName;
  if (processName) {
    [v3 setObject:processName forKey:@"processName"];
  }
  activities = self->_activities;
  if (activities) {
    [v3 setObject:activities forKey:@"activities"];
  }
  connectionUUID = self->_connectionUUID;
  if (connectionUUID) {
    [v3 setObject:connectionUUID forKey:@"connectionUUID"];
  }
  p_uint64_t has = &self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 4) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_tlsHandshakeTimedOut] forKey:@"tlsHandshakeTimedOut"];
  }
  uint64_t v10 = *(void *)p_has;
  if ((*(void *)p_has & 0x80000000000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_isPathExpensive] forKey:@"isPathExpensive"];
    uint64_t v10 = (uint64_t)self->_has;
    if ((v10 & 0x40000000000000) == 0)
    {
LABEL_76:
      if ((v10 & 0x400000000000000) == 0) {
        goto LABEL_77;
      }
      goto LABEL_94;
    }
  }
  else if ((v10 & 0x40000000000000) == 0)
  {
    goto LABEL_76;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_isPathConstrained] forKey:@"isPathConstrained"];
  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x400000000000000) == 0)
  {
LABEL_77:
    if ((v10 & 0x200000000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
LABEL_94:
  [v3 setObject:[NSNumber numberWithBool:self->_prohibitsExpensive] forKey:@"prohibitsExpensive"];
  if ((*(void *)&self->_has & 0x200000000000000) != 0) {
LABEL_78:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_prohibitsConstrained] forKey:@"prohibitsConstrained"];
LABEL_79:
  l2Report = self->_l2Report;
  if (l2Report) {
    [v3 setObject:l2Report dictionaryRepresentation] forKey:@"l2Report"];
  }
  deviceReport = self->_deviceReport;
  if (deviceReport) {
    [v3 setObject:[[-[AWDNWDeviceReport dictionaryRepresentation](deviceReport, "dictionaryRepresentation")] forKey:@"deviceReport"];
  }
  uint64_t v13 = (uint64_t)self->_has;
  if ((v13 & 0x400000000000) != 0)
  {
    uint64_t transportProtocol = self->_transportProtocol;
    if (transportProtocol >= 4) {
      v17 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_transportProtocol];
    }
    else {
      v17 = off_2641B99B0[transportProtocol];
    }
    [v3 setObject:v17 forKey:@"transportProtocol"];
    uint64_t v13 = (uint64_t)self->_has;
    if ((v13 & 0x10000000000) == 0)
    {
LABEL_85:
      if ((v13 & 0x20000000000) == 0) {
        goto LABEL_137;
      }
      goto LABEL_129;
    }
  }
  else if ((v13 & 0x10000000000) == 0)
  {
    goto LABEL_85;
  }
  uint64_t dnsProtocol = self->_dnsProtocol;
  if (dnsProtocol >= 5) {
    v21 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_dnsProtocol];
  }
  else {
    v21 = off_2641B99D0[dnsProtocol];
  }
  [v3 setObject:v21 forKey:@"dnsProtocol"];
  if ((*(void *)&self->_has & 0x20000000000) != 0)
  {
LABEL_129:
    uint64_t dnsProvider = self->_dnsProvider;
    if (dnsProvider >= 4) {
      v25 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_dnsProvider];
    }
    else {
      v25 = off_2641B99F8[dnsProvider];
    }
    [v3 setObject:v25 forKey:@"dnsProvider"];
  }
LABEL_137:
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  effectiveBundleID = self->_effectiveBundleID;
  if (effectiveBundleID) {
    [v3 setObject:effectiveBundleID forKey:@"effectiveBundleID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    uint64_t has = *(void *)p_has;
  }
  char v6 = *((unsigned char *)p_has + 8);
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t has = (uint64_t)self->_has;
    char v6 = *((unsigned char *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_99;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x40) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v6 & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0) {
      goto LABEL_43;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0) {
      goto LABEL_44;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0) {
      goto LABEL_45;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0) {
      goto LABEL_50;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v6 & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_157:
  PBDataWriterWriteUint64Field();
  if ((*(void *)&self->_has & 0x20000000000000) != 0) {
LABEL_65:
  }
    PBDataWriterWriteBOOLField();
LABEL_66:
  if (self->_processName) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  activities = self->_activities;
  uint64_t v8 = [(NSMutableArray *)activities countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(activities);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)activities countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  if (self->_connectionUUID) {
    PBDataWriterWriteStringField();
  }
  v12 = &self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v13 = *(void *)v12;
  if ((*(void *)v12 & 0x80000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v13 = (uint64_t)self->_has;
    if ((v13 & 0x40000000000000) == 0)
    {
LABEL_81:
      if ((v13 & 0x400000000000000) == 0) {
        goto LABEL_82;
      }
      goto LABEL_161;
    }
  }
  else if ((v13 & 0x40000000000000) == 0)
  {
    goto LABEL_81;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_has;
  if ((v13 & 0x400000000000000) == 0)
  {
LABEL_82:
    if ((v13 & 0x200000000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_161:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x200000000000000) != 0) {
LABEL_83:
  }
    PBDataWriterWriteBOOLField();
LABEL_84:
  if (self->_l2Report) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceReport) {
    PBDataWriterWriteSubmessage();
  }
  v14 = &self->_has;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x400000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v15 = *(void *)v14;
    if ((*(void *)v14 & 0x10000000000) == 0)
    {
LABEL_90:
      if ((v15 & 0x20000000000) == 0) {
        goto LABEL_92;
      }
      goto LABEL_91;
    }
  }
  else if ((v15 & 0x10000000000) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x20000000000) != 0) {
LABEL_91:
  }
    PBDataWriterWriteInt32Field();
LABEL_92:
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_effectiveBundleID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    *((void *)a3 + 33) = self->_timestamp;
    *((void *)a3 + 53) |= 0x100000000uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x10) != 0)
  {
    *((unsigned char *)a3 + 420) = self->_triggeredPath;
    *((unsigned char *)a3 + 432) |= 0x10u;
    uint64_t has = (uint64_t)self->_has;
    char v6 = *((unsigned char *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_97;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)a3 + 414) = self->_systemProxyConfigured;
  *((void *)a3 + 53) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((unsigned char *)a3 + 400) = self->_customProxyConfigured;
  *((void *)a3 + 53) |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 99) = self->_usedProxyType;
  *((void *)a3 + 53) |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((unsigned char *)a3 + 401) = self->_fallbackEligible;
  *((void *)a3 + 53) |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x40) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((unsigned char *)a3 + 422) = self->_weakFallback;
  *((unsigned char *)a3 + 432) |= 0x40u;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((unsigned char *)a3 + 421) = self->_usedFallback;
  *((unsigned char *)a3 + 432) |= 0x20u;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((unsigned char *)a3 + 411) = self->_resolutionRequired;
  *((void *)a3 + 53) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((unsigned char *)a3 + 417) = self->_tlsConfigured;
  *((unsigned char *)a3 + 432) |= 2u;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((unsigned char *)a3 + 415) = self->_tfoConfigured;
  *((void *)a3 + 53) |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((unsigned char *)a3 + 408) = self->_multipathConfigured;
  *((void *)a3 + 53) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((void *)a3 + 35) = self->_trafficClass;
  *((void *)a3 + 53) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)a3 + 90) = self->_failureReason;
  *((void *)a3 + 53) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((void *)a3 + 26) = self->_pathTriggerMilliseconds;
  *((void *)a3 + 53) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((void *)a3 + 29) = self->_resolutionMilliseconds;
  *((void *)a3 + 53) |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((void *)a3 + 27) = self->_proxyMilliseconds;
  *((void *)a3 + 53) |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((void *)a3 + 11) = self->_flowConnectMilliseconds;
  *((void *)a3 + 53) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((void *)a3 + 34) = self->_tlsMilliseconds;
  *((void *)a3 + 53) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((void *)a3 + 12) = self->_flowDurationMilliseconds;
  *((void *)a3 + 53) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((void *)a3 + 13) = self->_ipv4AddressCount;
  *((void *)a3 + 53) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((void *)a3 + 15) = self->_ipv6AddressCount;
  *((void *)a3 + 53) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((unsigned char *)a3 + 413) = self->_synthesizedIPv6Address;
  *((void *)a3 + 53) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)a3 + 91) = self->_firstAddressFamily;
  *((void *)a3 + 53) |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)a3 + 78) = self->_connectedAddressFamily;
  *((void *)a3 + 53) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((void *)a3 + 7) = self->_connectedAddressIndex;
  *((void *)a3 + 53) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)a3 + 79) = self->_connectedInterfaceType;
  *((void *)a3 + 53) |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((void *)a3 + 8) = self->_connectionReuseCount;
  *((void *)a3 + 53) |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((void *)a3 + 10) = self->_dataStallCount;
  *((void *)a3 + 53) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)a3 + 80) = self->_connectionMode;
  *((void *)a3 + 53) |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)a3 + 75) = self->_appleHost;
  *((void *)a3 + 53) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)a3 + 74) = self->_appleApp;
  *((void *)a3 + 53) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)a3 + 97) = self->_tlsVersion;
  *((void *)a3 + 53) |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((_DWORD *)a3 + 96) = self->_stackLevel;
  *((void *)a3 + 53) |= 0x100000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((unsigned char *)a3 + 403) = self->_ipv4Available;
  *((void *)a3 + 53) |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((unsigned char *)a3 + 404) = self->_ipv6Available;
  *((void *)a3 + 53) |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_131;
  }
LABEL_130:
  *((void *)a3 + 14) = self->_ipv4DNSServerCount;
  *((void *)a3 + 53) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v6 & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_132;
  }
LABEL_131:
  *((void *)a3 + 16) = self->_ipv6DNSServerCount;
  *((void *)a3 + 53) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((v6 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((unsigned char *)a3 + 419) = self->_tlsVersionTimeout;
  *((unsigned char *)a3 + 432) |= 8u;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0) {
      goto LABEL_43;
    }
    goto LABEL_134;
  }
LABEL_133:
  *((unsigned char *)a3 + 412) = self->_synthesizedExtraIPv6Address;
  *((void *)a3 + 53) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0) {
      goto LABEL_44;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((void *)a3 + 3) = self->_bytesIn;
  *((void *)a3 + 53) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0) {
      goto LABEL_45;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((void *)a3 + 4) = self->_bytesOut;
  *((void *)a3 + 53) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((void *)a3 + 2) = self->_bytesDuplicate;
  *((void *)a3 + 53) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((void *)a3 + 5) = self->_bytesOutOfOrder;
  *((void *)a3 + 53) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((void *)a3 + 6) = self->_bytesRetransmitted;
  *((void *)a3 + 53) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((void *)a3 + 24) = self->_packetsIn;
  *((void *)a3 + 53) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0) {
      goto LABEL_50;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((void *)a3 + 25) = self->_packetsOut;
  *((void *)a3 + 53) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((void *)a3 + 9) = self->_currentRTT;
  *((void *)a3 + 53) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_143;
  }
LABEL_142:
  *((void *)a3 + 31) = self->_smoothedRTT;
  *((void *)a3 + 53) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((void *)a3 + 1) = self->_bestRTT;
  *((void *)a3 + 53) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_145;
  }
LABEL_144:
  *((void *)a3 + 28) = self->_rTTvariance;
  *((void *)a3 + 53) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v6 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v6 & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((void *)a3 + 32) = self->_synRetransmissionCount;
  *((void *)a3 + 53) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((unsigned char *)a3 + 416) = self->_tfoUsed;
  *((unsigned char *)a3 + 432) |= 1u;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((void *)a3 + 23) = self->_multipathServiceType;
  *((void *)a3 + 53) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((unsigned char *)a3 + 402) = self->_firstParty;
  *((void *)a3 + 53) |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((void *)a3 + 17) = self->_multipathBytesInCell;
  *((void *)a3 + 53) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((void *)a3 + 20) = self->_multipathBytesOutCell;
  *((void *)a3 + 53) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_152;
  }
LABEL_151:
  *((void *)a3 + 19) = self->_multipathBytesInWiFi;
  *((void *)a3 + 53) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_153;
  }
LABEL_152:
  *((void *)a3 + 22) = self->_multipathBytesOutWiFi;
  *((void *)a3 + 53) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_154;
  }
LABEL_153:
  *((void *)a3 + 18) = self->_multipathBytesInInitial;
  *((void *)a3 + 53) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_155;
  }
LABEL_154:
  *((void *)a3 + 21) = self->_multipathBytesOutInitial;
  *((void *)a3 + 53) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_155:
  *((void *)a3 + 30) = self->_secondsSinceInterfaceChange;
  *((void *)a3 + 53) |= 0x20000000uLL;
  if ((*(void *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_65:
    *((unsigned char *)a3 + 405) = self->_isDaemon;
    *((void *)a3 + 53) |= 0x20000000000000uLL;
  }
LABEL_66:
  if (self->_processName) {
    [a3 setProcessName:];
  }
  if ([(AWDNWConnectionReport *)self activitiesCount])
  {
    [a3 clearActivities];
    unint64_t v7 = [(AWDNWConnectionReport *)self activitiesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addActivities:-[AWDNWConnectionReport activitiesAtIndex:](self, "activitiesAtIndex:", i)];
    }
  }
  if (self->_connectionUUID) {
    [a3 setConnectionUUID:];
  }
  if ((*((unsigned char *)&self->_has + 8) & 4) != 0)
  {
    *((unsigned char *)a3 + 418) = self->_tlsHandshakeTimedOut;
    *((unsigned char *)a3 + 432) |= 4u;
  }
  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x80000000000000) != 0)
  {
    *((unsigned char *)a3 + 407) = self->_isPathExpensive;
    *((void *)a3 + 53) |= 0x80000000000000uLL;
    uint64_t v10 = (uint64_t)self->_has;
    if ((v10 & 0x40000000000000) == 0)
    {
LABEL_78:
      if ((v10 & 0x400000000000000) == 0) {
        goto LABEL_79;
      }
      goto LABEL_159;
    }
  }
  else if ((v10 & 0x40000000000000) == 0)
  {
    goto LABEL_78;
  }
  *((unsigned char *)a3 + 406) = self->_isPathConstrained;
  *((void *)a3 + 53) |= 0x40000000000000uLL;
  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x400000000000000) == 0)
  {
LABEL_79:
    if ((v10 & 0x200000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_159:
  *((unsigned char *)a3 + 410) = self->_prohibitsExpensive;
  *((void *)a3 + 53) |= 0x400000000000000uLL;
  if ((*(void *)&self->_has & 0x200000000000000) != 0)
  {
LABEL_80:
    *((unsigned char *)a3 + 409) = self->_prohibitsConstrained;
    *((void *)a3 + 53) |= 0x200000000000000uLL;
  }
LABEL_81:
  if (self->_l2Report) {
    [a3 setL2Report:];
  }
  if (self->_deviceReport) {
    [a3 setDeviceReport:];
  }
  p_uint64_t has = &self->_has;
  uint64_t v12 = (uint64_t)self->_has;
  if ((v12 & 0x400000000000) != 0)
  {
    *((_DWORD *)a3 + 98) = self->_transportProtocol;
    *((void *)a3 + 53) |= 0x400000000000uLL;
    uint64_t v12 = *(void *)p_has;
    if ((*(void *)p_has & 0x10000000000) == 0)
    {
LABEL_87:
      if ((v12 & 0x20000000000) == 0) {
        goto LABEL_89;
      }
      goto LABEL_88;
    }
  }
  else if ((v12 & 0x10000000000) == 0)
  {
    goto LABEL_87;
  }
  *((_DWORD *)a3 + 86) = self->_dnsProtocol;
  *((void *)a3 + 53) |= 0x10000000000uLL;
  if ((*(void *)&self->_has & 0x20000000000) != 0)
  {
LABEL_88:
    *((_DWORD *)a3 + 87) = self->_dnsProvider;
    *((void *)a3 + 53) |= 0x20000000000uLL;
  }
LABEL_89:
  if (self->_bundleID) {
    [a3 setBundleID:];
  }
  if (self->_effectiveBundleID)
  {
    [a3 setEffectiveBundleID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    *(void *)(v5 + 264) = self->_timestamp;
    *(void *)(v5 + 424) |= 0x100000000uLL;
    uint64_t has = (uint64_t)self->_has;
  }
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((v8 & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 420) = self->_triggeredPath;
    *(unsigned char *)(v5 + 432) |= 0x10u;
    uint64_t has = (uint64_t)self->_has;
    char v8 = *((unsigned char *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_87;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v5 + 414) = self->_systemProxyConfigured;
  *(void *)(v5 + 424) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(unsigned char *)(v5 + 400) = self->_customProxyConfigured;
  *(void *)(v5 + 424) |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 396) = self->_usedProxyType;
  *(void *)(v5 + 424) |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v8 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(unsigned char *)(v5 + 401) = self->_fallbackEligible;
  *(void *)(v5 + 424) |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((v8 & 0x40) == 0)
  {
LABEL_9:
    if ((v8 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(unsigned char *)(v5 + 422) = self->_weakFallback;
  *(unsigned char *)(v5 + 432) |= 0x40u;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((v8 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(unsigned char *)(v5 + 421) = self->_usedFallback;
  *(unsigned char *)(v5 + 432) |= 0x20u;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v8 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(unsigned char *)(v5 + 411) = self->_resolutionRequired;
  *(void *)(v5 + 424) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((v8 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(unsigned char *)(v5 + 417) = self->_tlsConfigured;
  *(unsigned char *)(v5 + 432) |= 2u;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(unsigned char *)(v5 + 415) = self->_tfoConfigured;
  *(void *)(v5 + 424) |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(unsigned char *)(v5 + 408) = self->_multipathConfigured;
  *(void *)(v5 + 424) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(void *)(v5 + 280) = self->_trafficClass;
  *(void *)(v5 + 424) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v5 + 360) = self->_failureReason;
  *(void *)(v5 + 424) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(void *)(v5 + 208) = self->_pathTriggerMilliseconds;
  *(void *)(v5 + 424) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(void *)(v5 + 232) = self->_resolutionMilliseconds;
  *(void *)(v5 + 424) |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(void *)(v5 + 216) = self->_proxyMilliseconds;
  *(void *)(v5 + 424) |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(void *)(v5 + 88) = self->_flowConnectMilliseconds;
  *(void *)(v5 + 424) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(void *)(v5 + 272) = self->_tlsMilliseconds;
  *(void *)(v5 + 424) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(void *)(v5 + 96) = self->_flowDurationMilliseconds;
  *(void *)(v5 + 424) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(void *)(v5 + 104) = self->_ipv4AddressCount;
  *(void *)(v5 + 424) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(void *)(v5 + 120) = self->_ipv6AddressCount;
  *(void *)(v5 + 424) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(unsigned char *)(v5 + 413) = self->_synthesizedIPv6Address;
  *(void *)(v5 + 424) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v5 + 364) = self->_firstAddressFamily;
  *(void *)(v5 + 424) |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v5 + 312) = self->_connectedAddressFamily;
  *(void *)(v5 + 424) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(void *)(v5 + 56) = self->_connectedAddressIndex;
  *(void *)(v5 + 424) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v5 + 316) = self->_connectedInterfaceType;
  *(void *)(v5 + 424) |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(void *)(v5 + 64) = self->_connectionReuseCount;
  *(void *)(v5 + 424) |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(void *)(v5 + 80) = self->_dataStallCount;
  *(void *)(v5 + 424) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(_DWORD *)(v5 + 320) = self->_connectionMode;
  *(void *)(v5 + 424) |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v5 + 300) = self->_appleHost;
  *(void *)(v5 + 424) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(_DWORD *)(v5 + 296) = self->_appleApp;
  *(void *)(v5 + 424) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(_DWORD *)(v5 + 388) = self->_tlsVersion;
  *(void *)(v5 + 424) |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(_DWORD *)(v5 + 384) = self->_stackLevel;
  *(void *)(v5 + 424) |= 0x100000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(unsigned char *)(v5 + 403) = self->_ipv4Available;
  *(void *)(v5 + 424) |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(unsigned char *)(v5 + 404) = self->_ipv6Available;
  *(void *)(v5 + 424) |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_121;
  }
LABEL_120:
  *(void *)(v5 + 112) = self->_ipv4DNSServerCount;
  *(void *)(v5 + 424) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v8 & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(void *)(v5 + 128) = self->_ipv6DNSServerCount;
  *(void *)(v5 + 424) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((v8 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_123;
  }
LABEL_122:
  *(unsigned char *)(v5 + 419) = self->_tlsVersionTimeout;
  *(unsigned char *)(v5 + 432) |= 8u;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0) {
      goto LABEL_43;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(unsigned char *)(v5 + 412) = self->_synthesizedExtraIPv6Address;
  *(void *)(v5 + 424) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0) {
      goto LABEL_44;
    }
    goto LABEL_125;
  }
LABEL_124:
  *(void *)(v5 + 24) = self->_bytesIn;
  *(void *)(v5 + 424) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0) {
      goto LABEL_45;
    }
    goto LABEL_126;
  }
LABEL_125:
  *(void *)(v5 + 32) = self->_bytesOut;
  *(void *)(v5 + 424) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_127;
  }
LABEL_126:
  *(void *)(v5 + 16) = self->_bytesDuplicate;
  *(void *)(v5 + 424) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_128;
  }
LABEL_127:
  *(void *)(v5 + 40) = self->_bytesOutOfOrder;
  *(void *)(v5 + 424) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_129;
  }
LABEL_128:
  *(void *)(v5 + 48) = self->_bytesRetransmitted;
  *(void *)(v5 + 424) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_130;
  }
LABEL_129:
  *(void *)(v5 + 192) = self->_packetsIn;
  *(void *)(v5 + 424) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0) {
      goto LABEL_50;
    }
    goto LABEL_131;
  }
LABEL_130:
  *(void *)(v5 + 200) = self->_packetsOut;
  *(void *)(v5 + 424) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_132;
  }
LABEL_131:
  *(void *)(v5 + 72) = self->_currentRTT;
  *(void *)(v5 + 424) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_133;
  }
LABEL_132:
  *(void *)(v5 + 248) = self->_smoothedRTT;
  *(void *)(v5 + 424) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_134;
  }
LABEL_133:
  *(void *)(v5 + 8) = self->_bestRTT;
  *(void *)(v5 + 424) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_135;
  }
LABEL_134:
  *(void *)(v5 + 224) = self->_rTTvariance;
  *(void *)(v5 + 424) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  char v8 = *((unsigned char *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v8 & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_136;
  }
LABEL_135:
  *(void *)(v5 + 256) = self->_synRetransmissionCount;
  *(void *)(v5 + 424) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_137;
  }
LABEL_136:
  *(unsigned char *)(v5 + 416) = self->_tfoUsed;
  *(unsigned char *)(v5 + 432) |= 1u;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_138;
  }
LABEL_137:
  *(void *)(v5 + 184) = self->_multipathServiceType;
  *(void *)(v5 + 424) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_139;
  }
LABEL_138:
  *(unsigned char *)(v5 + 402) = self->_firstParty;
  *(void *)(v5 + 424) |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_140;
  }
LABEL_139:
  *(void *)(v5 + 136) = self->_multipathBytesInCell;
  *(void *)(v5 + 424) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_141;
  }
LABEL_140:
  *(void *)(v5 + 160) = self->_multipathBytesOutCell;
  *(void *)(v5 + 424) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_142;
  }
LABEL_141:
  *(void *)(v5 + 152) = self->_multipathBytesInWiFi;
  *(void *)(v5 + 424) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_143;
  }
LABEL_142:
  *(void *)(v5 + 176) = self->_multipathBytesOutWiFi;
  *(void *)(v5 + 424) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_144;
  }
LABEL_143:
  *(void *)(v5 + 144) = self->_multipathBytesInInitial;
  *(void *)(v5 + 424) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_145;
  }
LABEL_144:
  *(void *)(v5 + 168) = self->_multipathBytesOutInitial;
  *(void *)(v5 + 424) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_145:
  *(void *)(v5 + 240) = self->_secondsSinceInterfaceChange;
  *(void *)(v5 + 424) |= 0x20000000uLL;
  if ((*(void *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_65:
    *(unsigned char *)(v5 + 405) = self->_isDaemon;
    *(void *)(v5 + 424) |= 0x20000000000000uLL;
  }
LABEL_66:

  *(void *)(v6 + 376) = [(NSString *)self->_processName copyWithZone:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  activities = self->_activities;
  uint64_t v10 = [(NSMutableArray *)activities countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(activities);
        }
        v14 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addActivities:v14];
      }
      uint64_t v11 = [(NSMutableArray *)activities countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  *(void *)(v6 + 328) = [(NSString *)self->_connectionUUID copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 8) & 4) != 0)
  {
    *(unsigned char *)(v6 + 418) = self->_tlsHandshakeTimedOut;
    *(unsigned char *)(v6 + 432) |= 4u;
  }
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x80000000000000) != 0)
  {
    *(unsigned char *)(v6 + 407) = self->_isPathExpensive;
    *(void *)(v6 + 424) |= 0x80000000000000uLL;
    uint64_t v15 = (uint64_t)self->_has;
    if ((v15 & 0x40000000000000) == 0)
    {
LABEL_77:
      if ((v15 & 0x400000000000000) == 0) {
        goto LABEL_78;
      }
      goto LABEL_149;
    }
  }
  else if ((v15 & 0x40000000000000) == 0)
  {
    goto LABEL_77;
  }
  *(unsigned char *)(v6 + 406) = self->_isPathConstrained;
  *(void *)(v6 + 424) |= 0x40000000000000uLL;
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x400000000000000) == 0)
  {
LABEL_78:
    if ((v15 & 0x200000000000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_149:
  *(unsigned char *)(v6 + 410) = self->_prohibitsExpensive;
  *(void *)(v6 + 424) |= 0x400000000000000uLL;
  if ((*(void *)&self->_has & 0x200000000000000) != 0)
  {
LABEL_79:
    *(unsigned char *)(v6 + 409) = self->_prohibitsConstrained;
    *(void *)(v6 + 424) |= 0x200000000000000uLL;
  }
LABEL_80:

  *(void *)(v6 + 368) = [(AWDNWL2Report *)self->_l2Report copyWithZone:a3];
  *(void *)(v6 + 336) = [(AWDNWDeviceReport *)self->_deviceReport copyWithZone:a3];
  p_uint64_t has = &self->_has;
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x400000000000) == 0)
  {
    if ((v17 & 0x10000000000) == 0) {
      goto LABEL_82;
    }
LABEL_152:
    *(_DWORD *)(v6 + 344) = self->_dnsProtocol;
    *(void *)(v6 + 424) |= 0x10000000000uLL;
    if ((*(void *)&self->_has & 0x20000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
  *(_DWORD *)(v6 + 392) = self->_transportProtocol;
  *(void *)(v6 + 424) |= 0x400000000000uLL;
  uint64_t v17 = *(void *)p_has;
  if ((*(void *)p_has & 0x10000000000) != 0) {
    goto LABEL_152;
  }
LABEL_82:
  if ((v17 & 0x20000000000) != 0)
  {
LABEL_83:
    *(_DWORD *)(v6 + 348) = self->_dnsProvider;
    *(void *)(v6 + 424) |= 0x20000000000uLL;
  }
LABEL_84:

  *(void *)(v6 + 304) = [(NSString *)self->_bundleID copyWithZone:a3];
  *(void *)(v6 + 352) = [(NSString *)self->_effectiveBundleID copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)a3 + 53);
  if ((has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_timestamp != *((void *)a3 + 33)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((unsigned char *)&self->_has + 8) & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 0x10) == 0) {
      goto LABEL_440;
    }
    if (self->_triggeredPath)
    {
      if (!*((unsigned char *)a3 + 420)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 420))
    {
      goto LABEL_440;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 0x10) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v7 & 0x4000000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_systemProxyConfigured)
    {
      if (!*((unsigned char *)a3 + 414)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 414))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x4000000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_customProxyConfigured)
    {
      if (!*((unsigned char *)a3 + 400)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 400))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v7 & 0x800000000000) == 0 || self->_usedProxyType != *((_DWORD *)a3 + 99)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x800000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_fallbackEligible)
    {
      if (!*((unsigned char *)a3 + 401)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 401))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x2000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((unsigned char *)&self->_has + 8) & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 0x40) == 0) {
      goto LABEL_440;
    }
    if (self->_weakFallback)
    {
      if (!*((unsigned char *)a3 + 422)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 422))
    {
      goto LABEL_440;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 0x40) != 0)
  {
    goto LABEL_440;
  }
  if ((*((unsigned char *)&self->_has + 8) & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 0x20) == 0) {
      goto LABEL_440;
    }
    if (self->_usedFallback)
    {
      if (!*((unsigned char *)a3 + 421)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 421))
    {
      goto LABEL_440;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 0x20) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_resolutionRequired)
    {
      if (!*((unsigned char *)a3 + 411)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 411))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x800000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((unsigned char *)&self->_has + 8) & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 2) == 0) {
      goto LABEL_440;
    }
    if (self->_tlsConfigured)
    {
      if (!*((unsigned char *)a3 + 417)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 417))
    {
      goto LABEL_440;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 2) != 0)
  {
    goto LABEL_440;
  }
  if (has < 0)
  {
    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_tfoConfigured)
    {
      if (!*((unsigned char *)a3 + 415)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 415))
    {
      goto LABEL_440;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v7 & 0x100000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_multipathConfigured)
    {
      if (!*((unsigned char *)a3 + 408)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 408))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x100000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_trafficClass != *((void *)a3 + 35)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_failureReason != *((_DWORD *)a3 + 90)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_pathTriggerMilliseconds != *((void *)a3 + 26)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_resolutionMilliseconds != *((void *)a3 + 29)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_proxyMilliseconds != *((void *)a3 + 27)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_flowConnectMilliseconds != *((void *)a3 + 11)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_tlsMilliseconds != *((void *)a3 + 34)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_flowDurationMilliseconds != *((void *)a3 + 12)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_ipv4AddressCount != *((void *)a3 + 13)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_ipv6AddressCount != *((void *)a3 + 15)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_synthesizedIPv6Address)
    {
      if (!*((unsigned char *)a3 + 413)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 413))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x2000000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_firstAddressFamily != *((_DWORD *)a3 + 91)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0 || self->_connectedAddressFamily != *((_DWORD *)a3 + 78)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_connectedAddressIndex != *((void *)a3 + 7)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_connectedInterfaceType != *((_DWORD *)a3 + 79)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_connectionReuseCount != *((void *)a3 + 8)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_dataStallCount != *((void *)a3 + 10)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_connectionMode != *((_DWORD *)a3 + 80)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_appleHost != *((_DWORD *)a3 + 75)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_appleApp != *((_DWORD *)a3 + 74)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_tlsVersion != *((_DWORD *)a3 + 97)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0 || self->_stackLevel != *((_DWORD *)a3 + 96)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_ipv4Available)
    {
      if (!*((unsigned char *)a3 + 403)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 403))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x8000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v7 & 0x10000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_ipv6Available)
    {
      if (!*((unsigned char *)a3 + 404)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 404))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x10000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_ipv4DNSServerCount != *((void *)a3 + 14)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_ipv6DNSServerCount != *((void *)a3 + 16)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((unsigned char *)&self->_has + 8) & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 8) == 0) {
      goto LABEL_440;
    }
    if (self->_tlsVersionTimeout)
    {
      if (!*((unsigned char *)a3 + 419)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 419))
    {
      goto LABEL_440;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 8) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v7 & 0x1000000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_synthesizedExtraIPv6Address)
    {
      if (!*((unsigned char *)a3 + 412)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 412))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x1000000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bytesIn != *((void *)a3 + 3)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_bytesOut != *((void *)a3 + 4)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bytesDuplicate != *((void *)a3 + 2)) {
      goto LABEL_440;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_440;
  }
  uint64_t v8 = *((void *)a3 + 53);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_bytesOutOfOrder != *((void *)a3 + 5)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_bytesRetransmitted != *((void *)a3 + 6)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_packetsIn != *((void *)a3 + 24)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_packetsOut != *((void *)a3 + 25)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_currentRTT != *((void *)a3 + 9)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0 || self->_smoothedRTT != *((void *)a3 + 31)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_440;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_bestRTT != *((void *)a3 + 1)) {
      goto LABEL_440;
    }
  }
  else if (v8)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0 || self->_rTTvariance != *((void *)a3 + 28)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v8 & 0x80000000) == 0 || self->_synRetransmissionCount != *((void *)a3 + 32)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x80000000) != 0)
  {
    goto LABEL_440;
  }
  if (*((unsigned char *)&self->_has + 8))
  {
    if ((*((unsigned char *)a3 + 432) & 1) == 0) {
      goto LABEL_440;
    }
    if (self->_tfoUsed)
    {
      if (!*((unsigned char *)a3 + 416)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 416))
    {
      goto LABEL_440;
    }
  }
  else if (*((unsigned char *)a3 + 432))
  {
    goto LABEL_440;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_multipathServiceType != *((void *)a3 + 23)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v8 & 0x4000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_firstParty)
    {
      if (!*((unsigned char *)a3 + 402)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 402))
    {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x4000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_multipathBytesInCell != *((void *)a3 + 17)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_multipathBytesOutCell != *((void *)a3 + 20)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_multipathBytesInWiFi != *((void *)a3 + 19)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_multipathBytesOutWiFi != *((void *)a3 + 22)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_multipathBytesInInitial != *((void *)a3 + 18)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_multipathBytesOutInitial != *((void *)a3 + 21)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0 || self->_secondsSinceInterfaceChange != *((void *)a3 + 30)) {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v8 & 0x20000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_isDaemon)
    {
      if (!*((unsigned char *)a3 + 405)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 405))
    {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x20000000000000) != 0)
  {
    goto LABEL_440;
  }
  processName = self->_processName;
  if ((unint64_t)processName | *((void *)a3 + 47))
  {
    int v5 = -[NSString isEqual:](processName, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  activities = self->_activities;
  if ((unint64_t)activities | *((void *)a3 + 36))
  {
    int v5 = -[NSMutableArray isEqual:](activities, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  connectionUUID = self->_connectionUUID;
  if ((unint64_t)connectionUUID | *((void *)a3 + 41))
  {
    int v5 = -[NSString isEqual:](connectionUUID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  uint64_t v12 = (uint64_t)self->_has;
  uint64_t v13 = *((void *)a3 + 53);
  if ((*((unsigned char *)&self->_has + 8) & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 432) & 4) == 0) {
      goto LABEL_440;
    }
    if (self->_tlsHandshakeTimedOut)
    {
      if (!*((unsigned char *)a3 + 418)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 418))
    {
      goto LABEL_440;
    }
  }
  else if ((*((unsigned char *)a3 + 432) & 4) != 0)
  {
    goto LABEL_440;
  }
  if ((v12 & 0x80000000000000) != 0)
  {
    if ((v13 & 0x80000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_isPathExpensive)
    {
      if (!*((unsigned char *)a3 + 407)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 407))
    {
      goto LABEL_440;
    }
  }
  else if ((v13 & 0x80000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((v12 & 0x40000000000000) != 0)
  {
    if ((v13 & 0x40000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_isPathConstrained)
    {
      if (!*((unsigned char *)a3 + 406)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 406))
    {
      goto LABEL_440;
    }
  }
  else if ((v13 & 0x40000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((v12 & 0x400000000000000) != 0)
  {
    if ((v13 & 0x400000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_prohibitsExpensive)
    {
      if (!*((unsigned char *)a3 + 410)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 410))
    {
      goto LABEL_440;
    }
  }
  else if ((v13 & 0x400000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((v12 & 0x200000000000000) != 0)
  {
    if ((v13 & 0x200000000000000) == 0) {
      goto LABEL_440;
    }
    if (self->_prohibitsConstrained)
    {
      if (!*((unsigned char *)a3 + 409)) {
        goto LABEL_440;
      }
    }
    else if (*((unsigned char *)a3 + 409))
    {
      goto LABEL_440;
    }
  }
  else if ((v13 & 0x200000000000000) != 0)
  {
    goto LABEL_440;
  }
  l2Report = self->_l2Report;
  if ((unint64_t)l2Report | *((void *)a3 + 46))
  {
    int v5 = -[AWDNWL2Report isEqual:](l2Report, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  deviceReport = self->_deviceReport;
  if ((unint64_t)deviceReport | *((void *)a3 + 42))
  {
    int v5 = -[AWDNWDeviceReport isEqual:](deviceReport, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  uint64_t v16 = (uint64_t)self->_has;
  uint64_t v17 = *((void *)a3 + 53);
  if ((v16 & 0x400000000000) != 0)
  {
    if ((v17 & 0x400000000000) == 0 || self->_transportProtocol != *((_DWORD *)a3 + 98)) {
      goto LABEL_440;
    }
  }
  else if ((v17 & 0x400000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((v16 & 0x10000000000) != 0)
  {
    if ((v17 & 0x10000000000) == 0 || self->_dnsProtocol != *((_DWORD *)a3 + 86)) {
      goto LABEL_440;
    }
  }
  else if ((v17 & 0x10000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((v16 & 0x20000000000) != 0)
  {
    if ((v17 & 0x20000000000) == 0 || self->_dnsProvider != *((_DWORD *)a3 + 87)) {
      goto LABEL_440;
    }
    goto LABEL_436;
  }
  if ((v17 & 0x20000000000) != 0)
  {
LABEL_440:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_436:
  bundleID = self->_bundleID;
  if (!((unint64_t)bundleID | *((void *)a3 + 38)) || (int v5 = -[NSString isEqual:](bundleID, "isEqual:")) != 0)
  {
    effectiveBundleID = self->_effectiveBundleID;
    if ((unint64_t)effectiveBundleID | *((void *)a3 + 44))
    {
      LOBYTE(v5) = -[NSString isEqual:](effectiveBundleID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    unint64_t v84 = 2654435761u * self->_timestamp;
    if ((*((unsigned char *)&self->_has + 8) & 0x10) != 0)
    {
LABEL_3:
      uint64_t v83 = 2654435761 * self->_triggeredPath;
      if ((has & 0x4000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_67;
    }
  }
  else
  {
    unint64_t v84 = 0;
    if ((*((unsigned char *)&self->_has + 8) & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v83 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_4:
    uint64_t v82 = 2654435761 * self->_systemProxyConfigured;
    if ((has & 0x1000000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v82 = 0;
  if ((has & 0x1000000000000) != 0)
  {
LABEL_5:
    uint64_t v81 = 2654435761 * self->_customProxyConfigured;
    if ((has & 0x800000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v81 = 0;
  if ((has & 0x800000000000) != 0)
  {
LABEL_6:
    uint64_t v80 = 2654435761 * self->_usedProxyType;
    if ((has & 0x2000000000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v80 = 0;
  if ((has & 0x2000000000000) != 0)
  {
LABEL_7:
    uint64_t v79 = 2654435761 * self->_fallbackEligible;
    if ((*((unsigned char *)&self->_has + 8) & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v79 = 0;
  if ((*((unsigned char *)&self->_has + 8) & 0x40) != 0)
  {
LABEL_8:
    uint64_t v78 = 2654435761 * self->_weakFallback;
    if ((*((unsigned char *)&self->_has + 8) & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v78 = 0;
  if ((*((unsigned char *)&self->_has + 8) & 0x20) != 0)
  {
LABEL_9:
    uint64_t v77 = 2654435761 * self->_usedFallback;
    if ((has & 0x800000000000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v77 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_10:
    uint64_t v76 = 2654435761 * self->_resolutionRequired;
    if ((*((unsigned char *)&self->_has + 8) & 2) != 0) {
      goto LABEL_11;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v76 = 0;
  if ((*((unsigned char *)&self->_has + 8) & 2) != 0)
  {
LABEL_11:
    uint64_t v75 = 2654435761 * self->_tlsConfigured;
    if (has < 0) {
      goto LABEL_12;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v75 = 0;
  if (has < 0)
  {
LABEL_12:
    uint64_t v74 = 2654435761 * self->_tfoConfigured;
    if ((has & 0x100000000000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v74 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_13:
    uint64_t v73 = 2654435761 * self->_multipathConfigured;
    if ((has & 0x400000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v73 = 0;
  if ((has & 0x400000000) != 0)
  {
LABEL_14:
    unint64_t v72 = 2654435761u * self->_trafficClass;
    if ((has & 0x40000000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_78;
  }
LABEL_77:
  unint64_t v72 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_15:
    uint64_t v71 = 2654435761 * self->_failureReason;
    if ((has & 0x2000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v71 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_16:
    unint64_t v70 = 2654435761u * self->_pathTriggerMilliseconds;
    if ((has & 0x10000000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_80;
  }
LABEL_79:
  unint64_t v70 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_17:
    unint64_t v69 = 2654435761u * self->_resolutionMilliseconds;
    if ((has & 0x4000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_81;
  }
LABEL_80:
  unint64_t v69 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_18:
    unint64_t v68 = 2654435761u * self->_proxyMilliseconds;
    if ((has & 0x400) != 0) {
      goto LABEL_19;
    }
    goto LABEL_82;
  }
LABEL_81:
  unint64_t v68 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_19:
    unint64_t v67 = 2654435761u * self->_flowConnectMilliseconds;
    if ((has & 0x200000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_83;
  }
LABEL_82:
  unint64_t v67 = 0;
  if ((has & 0x200000000) != 0)
  {
LABEL_20:
    unint64_t v66 = 2654435761u * self->_tlsMilliseconds;
    if ((has & 0x800) != 0) {
      goto LABEL_21;
    }
    goto LABEL_84;
  }
LABEL_83:
  unint64_t v66 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_21:
    unint64_t v65 = 2654435761u * self->_flowDurationMilliseconds;
    if ((has & 0x1000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_85;
  }
LABEL_84:
  unint64_t v65 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_22:
    unint64_t v64 = 2654435761u * self->_ipv4AddressCount;
    if ((has & 0x4000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_86;
  }
LABEL_85:
  unint64_t v64 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_23:
    unint64_t v63 = 2654435761u * self->_ipv6AddressCount;
    if ((has & 0x2000000000000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_87;
  }
LABEL_86:
  unint64_t v63 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_24:
    uint64_t v62 = 2654435761 * self->_synthesizedIPv6Address;
    if ((has & 0x80000000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v62 = 0;
  if ((has & 0x80000000000) != 0)
  {
LABEL_25:
    uint64_t v61 = 2654435761 * self->_firstAddressFamily;
    if ((has & 0x2000000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v61 = 0;
  if ((has & 0x2000000000) != 0)
  {
LABEL_26:
    uint64_t v60 = 2654435761 * self->_connectedAddressFamily;
    if ((has & 0x40) != 0) {
      goto LABEL_27;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v60 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_27:
    unint64_t v59 = 2654435761u * self->_connectedAddressIndex;
    if ((has & 0x4000000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_91;
  }
LABEL_90:
  unint64_t v59 = 0;
  if ((has & 0x4000000000) != 0)
  {
LABEL_28:
    uint64_t v58 = 2654435761 * self->_connectedInterfaceType;
    if ((has & 0x80) != 0) {
      goto LABEL_29;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v58 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_29:
    unint64_t v57 = 2654435761u * self->_connectionReuseCount;
    if ((has & 0x200) != 0) {
      goto LABEL_30;
    }
    goto LABEL_93;
  }
LABEL_92:
  unint64_t v57 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_30:
    unint64_t v56 = 2654435761u * self->_dataStallCount;
    if ((has & 0x8000000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_94;
  }
LABEL_93:
  unint64_t v56 = 0;
  if ((has & 0x8000000000) != 0)
  {
LABEL_31:
    uint64_t v55 = 2654435761 * self->_connectionMode;
    if ((has & 0x1000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v55 = 0;
  if ((has & 0x1000000000) != 0)
  {
LABEL_32:
    uint64_t v54 = 2654435761 * self->_appleHost;
    if ((has & 0x800000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v54 = 0;
  if ((has & 0x800000000) != 0)
  {
LABEL_33:
    uint64_t v53 = 2654435761 * self->_appleApp;
    if ((has & 0x200000000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v53 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_34:
    uint64_t v52 = 2654435761 * self->_tlsVersion;
    if ((has & 0x100000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v52 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_35:
    uint64_t v51 = 2654435761 * self->_stackLevel;
    if ((has & 0x8000000000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v51 = 0;
  if ((has & 0x8000000000000) != 0)
  {
LABEL_36:
    uint64_t v50 = 2654435761 * self->_ipv4Available;
    if ((has & 0x10000000000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v50 = 0;
  if ((has & 0x10000000000000) != 0)
  {
LABEL_37:
    uint64_t v49 = 2654435761 * self->_ipv6Available;
    if ((has & 0x2000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v49 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_38:
    unint64_t v48 = 2654435761u * self->_ipv4DNSServerCount;
    if ((has & 0x8000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_102;
  }
LABEL_101:
  unint64_t v48 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_39:
    unint64_t v47 = 2654435761u * self->_ipv6DNSServerCount;
    if ((*((unsigned char *)&self->_has + 8) & 8) != 0) {
      goto LABEL_40;
    }
    goto LABEL_103;
  }
LABEL_102:
  unint64_t v47 = 0;
  if ((*((unsigned char *)&self->_has + 8) & 8) != 0)
  {
LABEL_40:
    uint64_t v46 = 2654435761 * self->_tlsVersionTimeout;
    if ((has & 0x1000000000000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v46 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_41:
    uint64_t v45 = 2654435761 * self->_synthesizedExtraIPv6Address;
    if ((has & 4) != 0) {
      goto LABEL_42;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v45 = 0;
  if ((has & 4) != 0)
  {
LABEL_42:
    unint64_t v44 = 2654435761u * self->_bytesIn;
    if ((has & 8) != 0) {
      goto LABEL_43;
    }
    goto LABEL_106;
  }
LABEL_105:
  unint64_t v44 = 0;
  if ((has & 8) != 0)
  {
LABEL_43:
    unint64_t v43 = 2654435761u * self->_bytesOut;
    if ((has & 2) != 0) {
      goto LABEL_44;
    }
    goto LABEL_107;
  }
LABEL_106:
  unint64_t v43 = 0;
  if ((has & 2) != 0)
  {
LABEL_44:
    unint64_t v42 = 2654435761u * self->_bytesDuplicate;
    if ((has & 0x10) != 0) {
      goto LABEL_45;
    }
    goto LABEL_108;
  }
LABEL_107:
  unint64_t v42 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_45:
    unint64_t v41 = 2654435761u * self->_bytesOutOfOrder;
    if ((has & 0x20) != 0) {
      goto LABEL_46;
    }
    goto LABEL_109;
  }
LABEL_108:
  unint64_t v41 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_46:
    unint64_t v40 = 2654435761u * self->_bytesRetransmitted;
    if ((has & 0x800000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_110;
  }
LABEL_109:
  unint64_t v40 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_47:
    unint64_t v39 = 2654435761u * self->_packetsIn;
    if ((has & 0x1000000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_111;
  }
LABEL_110:
  unint64_t v39 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_48:
    unint64_t v38 = 2654435761u * self->_packetsOut;
    if ((has & 0x100) != 0) {
      goto LABEL_49;
    }
    goto LABEL_112;
  }
LABEL_111:
  unint64_t v38 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_49:
    unint64_t v37 = 2654435761u * self->_currentRTT;
    if ((has & 0x40000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_113;
  }
LABEL_112:
  unint64_t v37 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_50:
    unint64_t v36 = 2654435761u * self->_smoothedRTT;
    if (has) {
      goto LABEL_51;
    }
    goto LABEL_114;
  }
LABEL_113:
  unint64_t v36 = 0;
  if (has)
  {
LABEL_51:
    unint64_t v35 = 2654435761u * self->_bestRTT;
    if ((has & 0x8000000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_115;
  }
LABEL_114:
  unint64_t v35 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_52:
    unint64_t v34 = 2654435761u * self->_rTTvariance;
    if ((has & 0x80000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_116;
  }
LABEL_115:
  unint64_t v34 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_53:
    unint64_t v33 = 2654435761u * self->_synRetransmissionCount;
    if (*((unsigned char *)&self->_has + 8)) {
      goto LABEL_54;
    }
    goto LABEL_117;
  }
LABEL_116:
  unint64_t v33 = 0;
  if (*((unsigned char *)&self->_has + 8))
  {
LABEL_54:
    uint64_t v32 = 2654435761 * self->_tfoUsed;
    if ((has & 0x400000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_118;
  }
LABEL_117:
  uint64_t v32 = 0;
  if ((has & 0x400000) != 0)
  {
LABEL_55:
    unint64_t v31 = 2654435761u * self->_multipathServiceType;
    if ((has & 0x4000000000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_119;
  }
LABEL_118:
  unint64_t v31 = 0;
  if ((has & 0x4000000000000) != 0)
  {
LABEL_56:
    uint64_t v30 = 2654435761 * self->_firstParty;
    if ((has & 0x10000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_120;
  }
LABEL_119:
  uint64_t v30 = 0;
  if ((has & 0x10000) != 0)
  {
LABEL_57:
    unint64_t v29 = 2654435761u * self->_multipathBytesInCell;
    if ((has & 0x80000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_121;
  }
LABEL_120:
  unint64_t v29 = 0;
  if ((has & 0x80000) != 0)
  {
LABEL_58:
    unint64_t v28 = 2654435761u * self->_multipathBytesOutCell;
    if ((has & 0x40000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_122;
  }
LABEL_121:
  unint64_t v28 = 0;
  if ((has & 0x40000) != 0)
  {
LABEL_59:
    unint64_t v27 = 2654435761u * self->_multipathBytesInWiFi;
    if ((has & 0x200000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_123;
  }
LABEL_122:
  unint64_t v27 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_60:
    unint64_t v26 = 2654435761u * self->_multipathBytesOutWiFi;
    if ((has & 0x20000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_124;
  }
LABEL_123:
  unint64_t v26 = 0;
  if ((has & 0x20000) != 0)
  {
LABEL_61:
    unint64_t v25 = 2654435761u * self->_multipathBytesInInitial;
    if ((has & 0x100000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_125;
  }
LABEL_124:
  unint64_t v25 = 0;
  if ((has & 0x100000) != 0)
  {
LABEL_62:
    unint64_t v24 = 2654435761u * self->_multipathBytesOutInitial;
    if ((has & 0x20000000) != 0) {
      goto LABEL_63;
    }
LABEL_126:
    unint64_t v23 = 0;
    if ((has & 0x20000000000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_127;
  }
LABEL_125:
  unint64_t v24 = 0;
  if ((has & 0x20000000) == 0) {
    goto LABEL_126;
  }
LABEL_63:
  unint64_t v23 = 2654435761u * self->_secondsSinceInterfaceChange;
  if ((has & 0x20000000000000) != 0)
  {
LABEL_64:
    uint64_t v22 = 2654435761 * self->_isDaemon;
    goto LABEL_128;
  }
LABEL_127:
  uint64_t v22 = 0;
LABEL_128:
  NSUInteger v21 = [(NSString *)self->_processName hash];
  uint64_t v20 = [(NSMutableArray *)self->_activities hash];
  NSUInteger v4 = [(NSString *)self->_connectionUUID hash];
  uint64_t v5 = (uint64_t)self->_has;
  if ((*((unsigned char *)&self->_has + 8) & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_tlsHandshakeTimedOut;
    if ((v5 & 0x80000000000000) != 0)
    {
LABEL_130:
      uint64_t v7 = 2654435761 * self->_isPathExpensive;
      if ((v5 & 0x40000000000000) != 0) {
        goto LABEL_131;
      }
      goto LABEL_136;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((v5 & 0x80000000000000) != 0) {
      goto LABEL_130;
    }
  }
  uint64_t v7 = 0;
  if ((v5 & 0x40000000000000) != 0)
  {
LABEL_131:
    uint64_t v8 = 2654435761 * self->_isPathConstrained;
    if ((v5 & 0x400000000000000) != 0) {
      goto LABEL_132;
    }
LABEL_137:
    uint64_t v9 = 0;
    if ((v5 & 0x200000000000000) != 0) {
      goto LABEL_133;
    }
    goto LABEL_138;
  }
LABEL_136:
  uint64_t v8 = 0;
  if ((v5 & 0x400000000000000) == 0) {
    goto LABEL_137;
  }
LABEL_132:
  uint64_t v9 = 2654435761 * self->_prohibitsExpensive;
  if ((v5 & 0x200000000000000) != 0)
  {
LABEL_133:
    uint64_t v10 = 2654435761 * self->_prohibitsConstrained;
    goto LABEL_139;
  }
LABEL_138:
  uint64_t v10 = 0;
LABEL_139:
  unint64_t v11 = [(AWDNWL2Report *)self->_l2Report hash];
  unint64_t v12 = [(AWDNWDeviceReport *)self->_deviceReport hash];
  uint64_t v13 = (uint64_t)self->_has;
  if ((v13 & 0x400000000000) == 0)
  {
    uint64_t v14 = 0;
    if ((v13 & 0x10000000000) != 0) {
      goto LABEL_141;
    }
LABEL_144:
    uint64_t v15 = 0;
    if ((v13 & 0x20000000000) != 0) {
      goto LABEL_142;
    }
LABEL_145:
    uint64_t v16 = 0;
    goto LABEL_146;
  }
  uint64_t v14 = 2654435761 * self->_transportProtocol;
  if ((v13 & 0x10000000000) == 0) {
    goto LABEL_144;
  }
LABEL_141:
  uint64_t v15 = 2654435761 * self->_dnsProtocol;
  if ((v13 & 0x20000000000) == 0) {
    goto LABEL_145;
  }
LABEL_142:
  uint64_t v16 = 2654435761 * self->_dnsProvider;
LABEL_146:
  unint64_t v17 = v83 ^ v84 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  NSUInteger v18 = v14 ^ v15 ^ v16 ^ [(NSString *)self->_bundleID hash];
  return v17 ^ v18 ^ [(NSString *)self->_effectiveBundleID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x100000000) != 0)
  {
    self->_timestamp = *((void *)a3 + 33);
    *(void *)&self->_has |= 0x100000000uLL;
    uint64_t v5 = *((void *)a3 + 53);
  }
  char v6 = *((unsigned char *)a3 + 432);
  if ((v6 & 0x10) != 0)
  {
    self->_triggeredPath = *((unsigned char *)a3 + 420);
    *((unsigned char *)&self->_has + 8) |= 0x10u;
    uint64_t v5 = *((void *)a3 + 53);
    char v6 = *((unsigned char *)a3 + 432);
    if ((v5 & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x1000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_89;
    }
  }
  else if ((v5 & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  self->_systemProxyConfigured = *((unsigned char *)a3 + 414);
  *(void *)&self->_has |= 0x4000000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_customProxyConfigured = *((unsigned char *)a3 + 400);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x2000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_uint64_t usedProxyType = *((_DWORD *)a3 + 99);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_fallbackEligible = *((unsigned char *)a3 + 401);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v6 & 0x40) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_weakFallback = *((unsigned char *)a3 + 422);
  *((unsigned char *)&self->_has + 8) |= 0x40u;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x800000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_usedFallback = *((unsigned char *)a3 + 421);
  *((unsigned char *)&self->_has + 8) |= 0x20u;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_resolutionRequired = *((unsigned char *)a3 + 411);
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x8000000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_tlsConfigured = *((unsigned char *)a3 + 417);
  *((unsigned char *)&self->_has + 8) |= 2u;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_tfoConfigured = *((unsigned char *)a3 + 415);
  *(void *)&self->_has |= 0x8000000000000000;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_multipathConfigured = *((unsigned char *)a3 + 408);
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_trafficClass = *((void *)a3 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_uint64_t failureReason = *((_DWORD *)a3 + 90);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_pathTriggerMilliseconds = *((void *)a3 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_resolutionMilliseconds = *((void *)a3 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_proxyMilliseconds = *((void *)a3 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x400) == 0)
  {
LABEL_20:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_flowConnectMilliseconds = *((void *)a3 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_tlsMilliseconds = *((void *)a3 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x800) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_flowDurationMilliseconds = *((void *)a3 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_ipv4AddressCount = *((void *)a3 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x2000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_ipv6AddressCount = *((void *)a3 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_synthesizedIPv6Address = *((unsigned char *)a3 + 413);
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_uint64_t firstAddressFamily = *((_DWORD *)a3 + 91);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_uint64_t connectedAddressFamily = *((_DWORD *)a3 + 78);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x40) == 0)
  {
LABEL_28:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_connectedAddressIndex = *((void *)a3 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_uint64_t connectedInterfaceType = *((_DWORD *)a3 + 79);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x80) == 0)
  {
LABEL_30:
    if ((v5 & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_connectionReuseCount = *((void *)a3 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x200) == 0)
  {
LABEL_31:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_dataStallCount = *((void *)a3 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_uint64_t connectionMode = *((_DWORD *)a3 + 80);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_uint64_t appleHost = *((_DWORD *)a3 + 75);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_uint64_t appleApp = *((_DWORD *)a3 + 74);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x100000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_uint64_t tlsVersion = *((_DWORD *)a3 + 97);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x8000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_uint64_t stackLevel = *((_DWORD *)a3 + 96);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_ipv4Available = *((unsigned char *)a3 + 403);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_ipv6Available = *((unsigned char *)a3 + 404);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x2000) == 0)
  {
LABEL_39:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_ipv4DNSServerCount = *((void *)a3 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x8000) == 0)
  {
LABEL_40:
    if ((v6 & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_ipv6DNSServerCount = *((void *)a3 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v6 & 8) == 0)
  {
LABEL_41:
    if ((v5 & 0x1000000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_tlsVersionTimeout = *((unsigned char *)a3 + 419);
  *((unsigned char *)&self->_has + 8) |= 8u;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((v5 & 4) == 0) {
      goto LABEL_43;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_synthesizedExtraIPv6Address = *((unsigned char *)a3 + 412);
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 4) == 0)
  {
LABEL_43:
    if ((v5 & 8) == 0) {
      goto LABEL_44;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_bytesIn = *((void *)a3 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 8) == 0)
  {
LABEL_44:
    if ((v5 & 2) == 0) {
      goto LABEL_45;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_bytesOut = *((void *)a3 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 2) == 0)
  {
LABEL_45:
    if ((v5 & 0x10) == 0) {
      goto LABEL_46;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_bytesDuplicate = *((void *)a3 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x10) == 0)
  {
LABEL_46:
    if ((v5 & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_bytesOutOfOrder = *((void *)a3 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x20) == 0)
  {
LABEL_47:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_bytesRetransmitted = *((void *)a3 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x800000) == 0)
  {
LABEL_48:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_packetsIn = *((void *)a3 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_49:
    if ((v5 & 0x100) == 0) {
      goto LABEL_50;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_packetsOut = *((void *)a3 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x100) == 0)
  {
LABEL_50:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_currentRTT = *((void *)a3 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_51:
    if ((v5 & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_smoothedRTT = *((void *)a3 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 1) == 0)
  {
LABEL_52:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_bestRTT = *((void *)a3 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_53:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_rTTvariance = *((void *)a3 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  char v6 = *((unsigned char *)a3 + 432);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_54:
    if ((v6 & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_synRetransmissionCount = *((void *)a3 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((*((unsigned char *)a3 + 432) & 1) == 0)
  {
LABEL_55:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_tfoUsed = *((unsigned char *)a3 + 416);
  *((unsigned char *)&self->_has + 8) |= 1u;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x400000) == 0)
  {
LABEL_56:
    if ((v5 & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_multipathServiceType = *((void *)a3 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_141;
  }
LABEL_140:
  self->_firstParty = *((unsigned char *)a3 + 402);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x10000) == 0)
  {
LABEL_58:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_multipathBytesInCell = *((void *)a3 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x80000) == 0)
  {
LABEL_59:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_multipathBytesOutCell = *((void *)a3 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x40000) == 0)
  {
LABEL_60:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_multipathBytesInWiFuint64_t i = *((void *)a3 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x200000) == 0)
  {
LABEL_61:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_multipathBytesOutWiFuint64_t i = *((void *)a3 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x20000) == 0)
  {
LABEL_62:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_multipathBytesInInitial = *((void *)a3 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x100000) == 0)
  {
LABEL_63:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_multipathBytesOutInitial = *((void *)a3 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *((void *)a3 + 53);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_64:
    if ((v5 & 0x20000000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_147:
  self->_secondsSinceInterfaceChange = *((void *)a3 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  if ((*((void *)a3 + 53) & 0x20000000000000) != 0)
  {
LABEL_65:
    self->_isDaemon = *((unsigned char *)a3 + 405);
    *(void *)&self->_has |= 0x20000000000000uLL;
  }
LABEL_66:
  if (*((void *)a3 + 47)) {
    -[AWDNWConnectionReport setProcessName:](self, "setProcessName:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 36);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDNWConnectionReport *)self addActivities:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  if (*((void *)a3 + 41)) {
    -[AWDNWConnectionReport setConnectionUUID:](self, "setConnectionUUID:");
  }
  if ((*((unsigned char *)a3 + 432) & 4) != 0)
  {
    self->_tlsHandshakeTimedOut = *((unsigned char *)a3 + 418);
    *((unsigned char *)&self->_has + 8) |= 4u;
  }
  uint64_t v12 = *((void *)a3 + 53);
  if ((v12 & 0x80000000000000) != 0)
  {
    self->_isPathExpensive = *((unsigned char *)a3 + 407);
    *(void *)&self->_has |= 0x80000000000000uLL;
    uint64_t v12 = *((void *)a3 + 53);
    if ((v12 & 0x40000000000000) == 0)
    {
LABEL_81:
      if ((v12 & 0x400000000000000) == 0) {
        goto LABEL_82;
      }
      goto LABEL_151;
    }
  }
  else if ((v12 & 0x40000000000000) == 0)
  {
    goto LABEL_81;
  }
  self->_isPathConstrained = *((unsigned char *)a3 + 406);
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v12 = *((void *)a3 + 53);
  if ((v12 & 0x400000000000000) == 0)
  {
LABEL_82:
    if ((v12 & 0x200000000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_151:
  self->_prohibitsExpensive = *((unsigned char *)a3 + 410);
  *(void *)&self->_has |= 0x400000000000000uLL;
  if ((*((void *)a3 + 53) & 0x200000000000000) != 0)
  {
LABEL_83:
    self->_prohibitsConstrained = *((unsigned char *)a3 + 409);
    *(void *)&self->_has |= 0x200000000000000uLL;
  }
LABEL_84:
  l2Report = self->_l2Report;
  uint64_t v14 = *((void *)a3 + 46);
  if (l2Report)
  {
    if (v14) {
      -[AWDNWL2Report mergeFrom:](l2Report, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[AWDNWConnectionReport setL2Report:](self, "setL2Report:");
  }
  deviceReport = self->_deviceReport;
  uint64_t v16 = *((void *)a3 + 42);
  if (deviceReport)
  {
    if (v16) {
      -[AWDNWDeviceReport mergeFrom:](deviceReport, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[AWDNWConnectionReport setDeviceReport:](self, "setDeviceReport:");
  }
  unint64_t v17 = (uint64_t *)((char *)a3 + 424);
  uint64_t v18 = *((void *)a3 + 53);
  if ((v18 & 0x400000000000) != 0)
  {
    self->_uint64_t transportProtocol = *((_DWORD *)a3 + 98);
    *(void *)&self->_has |= 0x400000000000uLL;
    uint64_t v18 = *v17;
    if ((*v17 & 0x10000000000) == 0)
    {
LABEL_162:
      if ((v18 & 0x20000000000) == 0) {
        goto LABEL_164;
      }
      goto LABEL_163;
    }
  }
  else if ((v18 & 0x10000000000) == 0)
  {
    goto LABEL_162;
  }
  self->_uint64_t dnsProtocol = *((_DWORD *)a3 + 86);
  *(void *)&self->_has |= 0x10000000000uLL;
  if ((*((void *)a3 + 53) & 0x20000000000) != 0)
  {
LABEL_163:
    self->_uint64_t dnsProvider = *((_DWORD *)a3 + 87);
    *(void *)&self->_has |= 0x20000000000uLL;
  }
LABEL_164:
  if (*((void *)a3 + 38)) {
    -[AWDNWConnectionReport setBundleID:](self, "setBundleID:");
  }
  if (*((void *)a3 + 44)) {
    -[AWDNWConnectionReport setEffectiveBundleID:](self, "setEffectiveBundleID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)triggeredPath
{
  return self->_triggeredPath;
}

- (BOOL)systemProxyConfigured
{
  return self->_systemProxyConfigured;
}

- (BOOL)customProxyConfigured
{
  return self->_customProxyConfigured;
}

- (BOOL)fallbackEligible
{
  return self->_fallbackEligible;
}

- (BOOL)weakFallback
{
  return self->_weakFallback;
}

- (BOOL)usedFallback
{
  return self->_usedFallback;
}

- (BOOL)resolutionRequired
{
  return self->_resolutionRequired;
}

- (BOOL)tlsConfigured
{
  return self->_tlsConfigured;
}

- (BOOL)tfoConfigured
{
  return self->_tfoConfigured;
}

- (BOOL)multipathConfigured
{
  return self->_multipathConfigured;
}

- (unint64_t)trafficClass
{
  return self->_trafficClass;
}

- (unint64_t)pathTriggerMilliseconds
{
  return self->_pathTriggerMilliseconds;
}

- (unint64_t)resolutionMilliseconds
{
  return self->_resolutionMilliseconds;
}

- (unint64_t)proxyMilliseconds
{
  return self->_proxyMilliseconds;
}

- (unint64_t)flowConnectMilliseconds
{
  return self->_flowConnectMilliseconds;
}

- (unint64_t)tlsMilliseconds
{
  return self->_tlsMilliseconds;
}

- (unint64_t)flowDurationMilliseconds
{
  return self->_flowDurationMilliseconds;
}

- (unint64_t)ipv4AddressCount
{
  return self->_ipv4AddressCount;
}

- (unint64_t)ipv6AddressCount
{
  return self->_ipv6AddressCount;
}

- (BOOL)synthesizedIPv6Address
{
  return self->_synthesizedIPv6Address;
}

- (unint64_t)connectedAddressIndex
{
  return self->_connectedAddressIndex;
}

- (unint64_t)connectionReuseCount
{
  return self->_connectionReuseCount;
}

- (unint64_t)dataStallCount
{
  return self->_dataStallCount;
}

- (BOOL)ipv4Available
{
  return self->_ipv4Available;
}

- (BOOL)ipv6Available
{
  return self->_ipv6Available;
}

- (unint64_t)ipv4DNSServerCount
{
  return self->_ipv4DNSServerCount;
}

- (unint64_t)ipv6DNSServerCount
{
  return self->_ipv6DNSServerCount;
}

- (BOOL)tlsVersionTimeout
{
  return self->_tlsVersionTimeout;
}

- (BOOL)synthesizedExtraIPv6Address
{
  return self->_synthesizedExtraIPv6Address;
}

- (unint64_t)bytesIn
{
  return self->_bytesIn;
}

- (unint64_t)bytesOut
{
  return self->_bytesOut;
}

- (unint64_t)bytesDuplicate
{
  return self->_bytesDuplicate;
}

- (unint64_t)bytesOutOfOrder
{
  return self->_bytesOutOfOrder;
}

- (unint64_t)bytesRetransmitted
{
  return self->_bytesRetransmitted;
}

- (unint64_t)packetsIn
{
  return self->_packetsIn;
}

- (unint64_t)packetsOut
{
  return self->_packetsOut;
}

- (unint64_t)currentRTT
{
  return self->_currentRTT;
}

- (unint64_t)smoothedRTT
{
  return self->_smoothedRTT;
}

- (unint64_t)bestRTT
{
  return self->_bestRTT;
}

- (unint64_t)rTTvariance
{
  return self->_rTTvariance;
}

- (unint64_t)synRetransmissionCount
{
  return self->_synRetransmissionCount;
}

- (BOOL)tfoUsed
{
  return self->_tfoUsed;
}

- (unint64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (BOOL)firstParty
{
  return self->_firstParty;
}

- (unint64_t)multipathBytesInCell
{
  return self->_multipathBytesInCell;
}

- (unint64_t)multipathBytesOutCell
{
  return self->_multipathBytesOutCell;
}

- (unint64_t)multipathBytesInWiFi
{
  return self->_multipathBytesInWiFi;
}

- (unint64_t)multipathBytesOutWiFi
{
  return self->_multipathBytesOutWiFi;
}

- (unint64_t)multipathBytesInInitial
{
  return self->_multipathBytesInInitial;
}

- (unint64_t)multipathBytesOutInitial
{
  return self->_multipathBytesOutInitial;
}

- (unint64_t)secondsSinceInterfaceChange
{
  return self->_secondsSinceInterfaceChange;
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (BOOL)tlsHandshakeTimedOut
{
  return self->_tlsHandshakeTimedOut;
}

- (BOOL)isPathExpensive
{
  return self->_isPathExpensive;
}

- (BOOL)isPathConstrained
{
  return self->_isPathConstrained;
}

- (BOOL)prohibitsExpensive
{
  return self->_prohibitsExpensive;
}

- (BOOL)prohibitsConstrained
{
  return self->_prohibitsConstrained;
}

- (AWDNWL2Report)l2Report
{
  return self->_l2Report;
}

- (void)setL2Report:(id)a3
{
}

- (AWDNWDeviceReport)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)effectiveBundleID
{
  return self->_effectiveBundleID;
}

- (void)setEffectiveBundleID:(id)a3
{
}

@end