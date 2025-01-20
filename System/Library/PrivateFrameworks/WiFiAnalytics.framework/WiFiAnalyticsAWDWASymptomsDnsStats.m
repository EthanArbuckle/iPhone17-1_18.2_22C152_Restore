@interface WiFiAnalyticsAWDWASymptomsDnsStats
- (BOOL)dpsNotificationReceivedDuringStudy;
- (BOOL)hasConfigType;
- (BOOL)hasDpsNotificationReceivedDuringStudy;
- (BOOL)hasImpactedServersAtStudyEnd;
- (BOOL)hasImpactedServersAtStudyStart;
- (BOOL)hasIsCaptiveServerIPResolved;
- (BOOL)hasIsPingEnqueueFailing;
- (BOOL)hasLanHealthAfterDecision;
- (BOOL)hasLanHealthBeforeDecision;
- (BOOL)hasNetscoreAtStudyEnd;
- (BOOL)hasNetscoreAtStudyStart;
- (BOOL)hasNetscoreHealthAfterDecision;
- (BOOL)hasNetscoreHealthBeforeDecision;
- (BOOL)hasNumIpv4DnsServers;
- (BOOL)hasNumIpv6DnsServers;
- (BOOL)hasNumLocalDnsServers;
- (BOOL)hasNumRemoteDnsServers;
- (BOOL)hasSlowWiFiNotificationReceivedDuringStudy;
- (BOOL)hasStallscoreAtStudyEnd;
- (BOOL)hasStallscoreAtStudyStart;
- (BOOL)hasStallscoreHealthAfterDecision;
- (BOOL)hasStallscoreHealthBeforeDecision;
- (BOOL)hasSuppressedReason;
- (BOOL)hasSymptomsDnsRecommendation;
- (BOOL)hasSymptomsDnsTimeSincePreviousTriggerMinutes;
- (BOOL)hasSymptomsDnsscreenStateOn;
- (BOOL)hasTotalDnsServers;
- (BOOL)hasWanHealthAfterDecision;
- (BOOL)hasWanHealthBeforeDecision;
- (BOOL)isCaptiveServerIPResolved;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPingEnqueueFailing;
- (BOOL)readFrom:(id)a3;
- (BOOL)slowWiFiNotificationReceivedDuringStudy;
- (BOOL)symptomsDnsscreenStateOn;
- (id)configTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suppressedReasonAsString:(int)a3;
- (id)symptomsDnsRecommendationAsString:(int)a3;
- (int)StringAsConfigType:(id)a3;
- (int)StringAsSuppressedReason:(id)a3;
- (int)StringAsSymptomsDnsRecommendation:(id)a3;
- (int)configType;
- (int)suppressedReason;
- (int)symptomsDnsRecommendation;
- (unint64_t)hash;
- (unint64_t)symptomsDnsTimeSincePreviousTriggerMinutes;
- (unsigned)impactedServersAtStudyEnd;
- (unsigned)impactedServersAtStudyStart;
- (unsigned)lanHealthAfterDecision;
- (unsigned)lanHealthBeforeDecision;
- (unsigned)netscoreAtStudyEnd;
- (unsigned)netscoreAtStudyStart;
- (unsigned)netscoreHealthAfterDecision;
- (unsigned)netscoreHealthBeforeDecision;
- (unsigned)numIpv4DnsServers;
- (unsigned)numIpv6DnsServers;
- (unsigned)numLocalDnsServers;
- (unsigned)numRemoteDnsServers;
- (unsigned)stallscoreAtStudyEnd;
- (unsigned)stallscoreAtStudyStart;
- (unsigned)stallscoreHealthAfterDecision;
- (unsigned)stallscoreHealthBeforeDecision;
- (unsigned)totalDnsServers;
- (unsigned)wanHealthAfterDecision;
- (unsigned)wanHealthBeforeDecision;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigType:(int)a3;
- (void)setDpsNotificationReceivedDuringStudy:(BOOL)a3;
- (void)setHasConfigType:(BOOL)a3;
- (void)setHasDpsNotificationReceivedDuringStudy:(BOOL)a3;
- (void)setHasImpactedServersAtStudyEnd:(BOOL)a3;
- (void)setHasImpactedServersAtStudyStart:(BOOL)a3;
- (void)setHasIsCaptiveServerIPResolved:(BOOL)a3;
- (void)setHasIsPingEnqueueFailing:(BOOL)a3;
- (void)setHasLanHealthAfterDecision:(BOOL)a3;
- (void)setHasLanHealthBeforeDecision:(BOOL)a3;
- (void)setHasNetscoreAtStudyEnd:(BOOL)a3;
- (void)setHasNetscoreAtStudyStart:(BOOL)a3;
- (void)setHasNetscoreHealthAfterDecision:(BOOL)a3;
- (void)setHasNetscoreHealthBeforeDecision:(BOOL)a3;
- (void)setHasNumIpv4DnsServers:(BOOL)a3;
- (void)setHasNumIpv6DnsServers:(BOOL)a3;
- (void)setHasNumLocalDnsServers:(BOOL)a3;
- (void)setHasNumRemoteDnsServers:(BOOL)a3;
- (void)setHasSlowWiFiNotificationReceivedDuringStudy:(BOOL)a3;
- (void)setHasStallscoreAtStudyEnd:(BOOL)a3;
- (void)setHasStallscoreAtStudyStart:(BOOL)a3;
- (void)setHasStallscoreHealthAfterDecision:(BOOL)a3;
- (void)setHasStallscoreHealthBeforeDecision:(BOOL)a3;
- (void)setHasSuppressedReason:(BOOL)a3;
- (void)setHasSymptomsDnsRecommendation:(BOOL)a3;
- (void)setHasSymptomsDnsTimeSincePreviousTriggerMinutes:(BOOL)a3;
- (void)setHasSymptomsDnsscreenStateOn:(BOOL)a3;
- (void)setHasTotalDnsServers:(BOOL)a3;
- (void)setHasWanHealthAfterDecision:(BOOL)a3;
- (void)setHasWanHealthBeforeDecision:(BOOL)a3;
- (void)setImpactedServersAtStudyEnd:(unsigned int)a3;
- (void)setImpactedServersAtStudyStart:(unsigned int)a3;
- (void)setIsCaptiveServerIPResolved:(BOOL)a3;
- (void)setIsPingEnqueueFailing:(BOOL)a3;
- (void)setLanHealthAfterDecision:(unsigned int)a3;
- (void)setLanHealthBeforeDecision:(unsigned int)a3;
- (void)setNetscoreAtStudyEnd:(unsigned int)a3;
- (void)setNetscoreAtStudyStart:(unsigned int)a3;
- (void)setNetscoreHealthAfterDecision:(unsigned int)a3;
- (void)setNetscoreHealthBeforeDecision:(unsigned int)a3;
- (void)setNumIpv4DnsServers:(unsigned int)a3;
- (void)setNumIpv6DnsServers:(unsigned int)a3;
- (void)setNumLocalDnsServers:(unsigned int)a3;
- (void)setNumRemoteDnsServers:(unsigned int)a3;
- (void)setSlowWiFiNotificationReceivedDuringStudy:(BOOL)a3;
- (void)setStallscoreAtStudyEnd:(unsigned int)a3;
- (void)setStallscoreAtStudyStart:(unsigned int)a3;
- (void)setStallscoreHealthAfterDecision:(unsigned int)a3;
- (void)setStallscoreHealthBeforeDecision:(unsigned int)a3;
- (void)setSuppressedReason:(int)a3;
- (void)setSymptomsDnsRecommendation:(int)a3;
- (void)setSymptomsDnsTimeSincePreviousTriggerMinutes:(unint64_t)a3;
- (void)setSymptomsDnsscreenStateOn:(BOOL)a3;
- (void)setTotalDnsServers:(unsigned int)a3;
- (void)setWanHealthAfterDecision:(unsigned int)a3;
- (void)setWanHealthBeforeDecision:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWASymptomsDnsStats

- (void)setTotalDnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalDnsServers = a3;
}

- (void)setHasTotalDnsServers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalDnsServers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNumIpv4DnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numIpv4DnsServers = a3;
}

- (void)setHasNumIpv4DnsServers:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumIpv4DnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNumIpv6DnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numIpv6DnsServers = a3;
}

- (void)setHasNumIpv6DnsServers:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNumIpv6DnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNumLocalDnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numLocalDnsServers = a3;
}

- (void)setHasNumLocalDnsServers:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumLocalDnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNumRemoteDnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numRemoteDnsServers = a3;
}

- (void)setHasNumRemoteDnsServers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumRemoteDnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)configType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_configType;
  }
  else {
    return 0;
  }
}

- (void)setConfigType:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_configType = a3;
}

- (void)setHasConfigType:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConfigType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)configTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    int v3 = *(&off_264466B28 + a3);
  }
  return v3;
}

- (int)StringAsConfigType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kDnsServerConfigTypeNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kDnsServerConfigTypeAutomatic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"kDnsServerConfigTypeManual"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNetscoreAtStudyStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_netscoreAtStudyStart = a3;
}

- (void)setHasNetscoreAtStudyStart:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNetscoreAtStudyStart
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setStallscoreAtStudyStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_stallscoreAtStudyStart = a3;
}

- (void)setHasStallscoreAtStudyStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasStallscoreAtStudyStart
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setImpactedServersAtStudyStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_impactedServersAtStudyStart = a3;
}

- (void)setHasImpactedServersAtStudyStart:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasImpactedServersAtStudyStart
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNetscoreHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_netscoreHealthBeforeDecision = a3;
}

- (void)setHasNetscoreHealthBeforeDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNetscoreHealthBeforeDecision
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setStallscoreHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_stallscoreHealthBeforeDecision = a3;
}

- (void)setHasStallscoreHealthBeforeDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasStallscoreHealthBeforeDecision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLanHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lanHealthBeforeDecision = a3;
}

- (void)setHasLanHealthBeforeDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLanHealthBeforeDecision
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setWanHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_wanHealthBeforeDecision = a3;
}

- (void)setHasWanHealthBeforeDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasWanHealthBeforeDecision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsCaptiveServerIPResolved:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isCaptiveServerIPResolved = a3;
}

- (void)setHasIsCaptiveServerIPResolved:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsCaptiveServerIPResolved
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setSymptomsDnsscreenStateOn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_symptomsDnsscreenStateOn = a3;
}

- (void)setHasSymptomsDnsscreenStateOn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasSymptomsDnsscreenStateOn
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (int)symptomsDnsRecommendation
{
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    return self->_symptomsDnsRecommendation;
  }
  else {
    return 0;
  }
}

- (void)setSymptomsDnsRecommendation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_symptomsDnsRecommendation = a3;
}

- (void)setHasSymptomsDnsRecommendation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSymptomsDnsRecommendation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)symptomsDnsRecommendationAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    int v3 = *(&off_264466B40 + a3);
  }
  return v3;
}

- (int)StringAsSymptomsDnsRecommendation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kSymptomsDnsRecoveryTypeNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsRecoveryTypeReset"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsRecoveryTypeReassoc"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)suppressedReason
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_suppressedReason;
  }
  else {
    return 0;
  }
}

- (void)setSuppressedReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_suppressedReason = a3;
}

- (void)setHasSuppressedReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSuppressedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)suppressedReasonAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    int v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    int v3 = *(&off_264466B58 + a3);
  }
  return v3;
}

- (int)StringAsSuppressedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kSymptomsDnsNotSuppressed"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsBudgetThresholdReached"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsSymptomsConditionsRecovered"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsPeerDiagnosticsStudy"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsAWDLActivitySuspected"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsCriticalAppInUse"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsWiFiDisassociatedDuringStudy"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsAverageCcaAboveThreshold"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsWiFiInterfaceNotPrimary"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsWiFiNetworkIsCaptive"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"kSymptomsDnsServerConfigurationInvalid"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNetscoreAtStudyEnd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_netscoreAtStudyEnd = a3;
}

- (void)setHasNetscoreAtStudyEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNetscoreAtStudyEnd
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setStallscoreAtStudyEnd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_stallscoreAtStudyEnd = a3;
}

- (void)setHasStallscoreAtStudyEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasStallscoreAtStudyEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setImpactedServersAtStudyEnd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_impactedServersAtStudyEnd = a3;
}

- (void)setHasImpactedServersAtStudyEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasImpactedServersAtStudyEnd
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNetscoreHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_netscoreHealthAfterDecision = a3;
}

- (void)setHasNetscoreHealthAfterDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNetscoreHealthAfterDecision
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setStallscoreHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_stallscoreHealthAfterDecision = a3;
}

- (void)setHasStallscoreHealthAfterDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasStallscoreHealthAfterDecision
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setLanHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_lanHealthAfterDecision = a3;
}

- (void)setHasLanHealthAfterDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLanHealthAfterDecision
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setWanHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_wanHealthAfterDecision = a3;
}

- (void)setHasWanHealthAfterDecision:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasWanHealthAfterDecision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSymptomsDnsTimeSincePreviousTriggerMinutes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_symptomsDnsTimeSincePreviousTriggerMinutes = a3;
}

- (void)setHasSymptomsDnsTimeSincePreviousTriggerMinutes:(BOOL)a3
{
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasSymptomsDnsTimeSincePreviousTriggerMinutes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDpsNotificationReceivedDuringStudy:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_dpsNotificationReceivedDuringStudy = a3;
}

- (void)setHasDpsNotificationReceivedDuringStudy:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasDpsNotificationReceivedDuringStudy
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSlowWiFiNotificationReceivedDuringStudy:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_slowWiFiNotificationReceivedDuringStudy = a3;
}

- (void)setHasSlowWiFiNotificationReceivedDuringStudy:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasSlowWiFiNotificationReceivedDuringStudy
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsPingEnqueueFailing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isPingEnqueueFailing = a3;
}

- (void)setHasIsPingEnqueueFailing:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsPingEnqueueFailing
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWASymptomsDnsStats;
  int v4 = [(WiFiAnalyticsAWDWASymptomsDnsStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWASymptomsDnsStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_totalDnsServers];
    [v3 setObject:v8 forKey:@"totalDnsServers"];

    $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithUnsignedInt:self->_numIpv4DnsServers];
  [v3 setObject:v9 forKey:@"numIpv4DnsServers"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  v10 = [NSNumber numberWithUnsignedInt:self->_numIpv6DnsServers];
  [v3 setObject:v10 forKey:@"numIpv6DnsServers"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  v11 = [NSNumber numberWithUnsignedInt:self->_numLocalDnsServers];
  [v3 setObject:v11 forKey:@"numLocalDnsServers"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  v12 = [NSNumber numberWithUnsignedInt:self->_numRemoteDnsServers];
  [v3 setObject:v12 forKey:@"numRemoteDnsServers"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_36:
  uint64_t configType = self->_configType;
  if (configType >= 3)
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_configType);
  }
  else
  {
    v14 = *(&off_264466B28 + configType);
  }
  [v3 setObject:v14 forKey:@"configType"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  v15 = [NSNumber numberWithUnsignedInt:self->_netscoreAtStudyStart];
  [v3 setObject:v15 forKey:@"netscoreAtStudyStart"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  v16 = [NSNumber numberWithUnsignedInt:self->_stallscoreAtStudyStart];
  [v3 setObject:v16 forKey:@"stallscoreAtStudyStart"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  v17 = [NSNumber numberWithUnsignedInt:self->_impactedServersAtStudyStart];
  [v3 setObject:v17 forKey:@"impactedServersAtStudyStart"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  v18 = [NSNumber numberWithUnsignedInt:self->_netscoreHealthBeforeDecision];
  [v3 setObject:v18 forKey:@"netscoreHealthBeforeDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  v19 = [NSNumber numberWithUnsignedInt:self->_stallscoreHealthBeforeDecision];
  [v3 setObject:v19 forKey:@"stallscoreHealthBeforeDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  v20 = [NSNumber numberWithUnsignedInt:self->_lanHealthBeforeDecision];
  [v3 setObject:v20 forKey:@"lanHealthBeforeDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  v21 = [NSNumber numberWithUnsignedInt:self->_wanHealthBeforeDecision];
  [v3 setObject:v21 forKey:@"wanHealthBeforeDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  v22 = [NSNumber numberWithBool:self->_isCaptiveServerIPResolved];
  [v3 setObject:v22 forKey:@"isCaptiveServerIPResolved"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  v23 = [NSNumber numberWithBool:self->_symptomsDnsscreenStateOn];
  [v3 setObject:v23 forKey:@"symptomsDnsscreenStateOn"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_49:
  uint64_t symptomsDnsRecommendation = self->_symptomsDnsRecommendation;
  if (symptomsDnsRecommendation >= 3)
  {
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_symptomsDnsRecommendation);
  }
  else
  {
    v25 = *(&off_264466B40 + symptomsDnsRecommendation);
  }
  [v3 setObject:v25 forKey:@"symptomsDnsRecommendation"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_53:
  uint64_t suppressedReason = self->_suppressedReason;
  if (suppressedReason >= 0xB)
  {
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suppressedReason);
  }
  else
  {
    v27 = *(&off_264466B58 + suppressedReason);
  }
  [v3 setObject:v27 forKey:@"suppressedReason"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  v28 = [NSNumber numberWithUnsignedInt:self->_netscoreAtStudyEnd];
  [v3 setObject:v28 forKey:@"netscoreAtStudyEnd"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  v29 = [NSNumber numberWithUnsignedInt:self->_stallscoreAtStudyEnd];
  [v3 setObject:v29 forKey:@"stallscoreAtStudyEnd"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  v30 = [NSNumber numberWithUnsignedInt:self->_impactedServersAtStudyEnd];
  [v3 setObject:v30 forKey:@"impactedServersAtStudyEnd"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  v31 = [NSNumber numberWithUnsignedInt:self->_netscoreHealthAfterDecision];
  [v3 setObject:v31 forKey:@"netscoreHealthAfterDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  v32 = [NSNumber numberWithUnsignedInt:self->_stallscoreHealthAfterDecision];
  [v3 setObject:v32 forKey:@"stallscoreHealthAfterDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  v33 = [NSNumber numberWithUnsignedInt:self->_lanHealthAfterDecision];
  [v3 setObject:v33 forKey:@"lanHealthAfterDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  v34 = [NSNumber numberWithUnsignedInt:self->_wanHealthAfterDecision];
  [v3 setObject:v34 forKey:@"wanHealthAfterDecision"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_65;
  }
LABEL_64:
  v35 = [NSNumber numberWithUnsignedLongLong:self->_symptomsDnsTimeSincePreviousTriggerMinutes];
  [v3 setObject:v35 forKey:@"symptomsDnsTimeSincePreviousTriggerMinutes"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_28;
    }
LABEL_66:
    v37 = [NSNumber numberWithBool:self->_slowWiFiNotificationReceivedDuringStudy];
    [v3 setObject:v37 forKey:@"slowWiFiNotificationReceivedDuringStudy"];

    if ((*(_DWORD *)&self->_has & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_65:
  v36 = [NSNumber numberWithBool:self->_dpsNotificationReceivedDuringStudy];
  [v3 setObject:v36 forKey:@"dpsNotificationReceivedDuringStudy"];

  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0) {
    goto LABEL_66;
  }
LABEL_28:
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_29:
    v5 = [NSNumber numberWithBool:self->_isPingEnqueueFailing];
    [v3 setObject:v5 forKey:@"isPingEnqueueFailing"];
  }
LABEL_30:
  id v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWASymptomsDnsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x2000000) != 0) {
LABEL_29:
  }
    PBDataWriterWriteBOOLField();
LABEL_30:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v4[23] = self->_totalDnsServers;
    v4[28] |= 0x100000u;
    $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_numIpv4DnsServers;
  v4[28] |= 0x400u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[14] = self->_numIpv6DnsServers;
  v4[28] |= 0x800u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[15] = self->_numLocalDnsServers;
  v4[28] |= 0x1000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[16] = self->_numRemoteDnsServers;
  v4[28] |= 0x2000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[4] = self->_configType;
  v4[28] |= 2u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[10] = self->_netscoreAtStudyStart;
  v4[28] |= 0x80u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  v4[18] = self->_stallscoreAtStudyStart;
  v4[28] |= 0x8000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  v4[6] = self->_impactedServersAtStudyStart;
  v4[28] |= 8u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  v4[12] = self->_netscoreHealthBeforeDecision;
  v4[28] |= 0x200u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  v4[20] = self->_stallscoreHealthBeforeDecision;
  v4[28] |= 0x20000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  v4[8] = self->_lanHealthBeforeDecision;
  v4[28] |= 0x20u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  v4[25] = self->_wanHealthBeforeDecision;
  v4[28] |= 0x400000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((unsigned char *)v4 + 105) = self->_isCaptiveServerIPResolved;
  v4[28] |= 0x1000000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((unsigned char *)v4 + 108) = self->_symptomsDnsscreenStateOn;
  v4[28] |= 0x8000000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  v4[22] = self->_symptomsDnsRecommendation;
  v4[28] |= 0x80000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  v4[21] = self->_suppressedReason;
  v4[28] |= 0x40000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  v4[9] = self->_netscoreAtStudyEnd;
  v4[28] |= 0x40u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  v4[17] = self->_stallscoreAtStudyEnd;
  v4[28] |= 0x4000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  v4[5] = self->_impactedServersAtStudyEnd;
  v4[28] |= 4u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  v4[11] = self->_netscoreHealthAfterDecision;
  v4[28] |= 0x100u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  v4[19] = self->_stallscoreHealthAfterDecision;
  v4[28] |= 0x10000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  v4[7] = self->_lanHealthAfterDecision;
  v4[28] |= 0x10u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  v4[24] = self->_wanHealthAfterDecision;
  v4[28] |= 0x200000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)v4 + 1) = self->_symptomsDnsTimeSincePreviousTriggerMinutes;
  v4[28] |= 1u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)v4 + 104) = self->_dpsNotificationReceivedDuringStudy;
  v4[28] |= 0x800000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_59:
  *((unsigned char *)v4 + 107) = self->_slowWiFiNotificationReceivedDuringStudy;
  v4[28] |= 0x4000000u;
  if ((*(_DWORD *)&self->_has & 0x2000000) != 0)
  {
LABEL_29:
    *((unsigned char *)v4 + 106) = self->_isPingEnqueueFailing;
    v4[28] |= 0x2000000u;
  }
LABEL_30:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *((_DWORD *)result + 23) = self->_totalDnsServers;
    *((_DWORD *)result + 28) |= 0x100000u;
    $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 13) = self->_numIpv4DnsServers;
  *((_DWORD *)result + 28) |= 0x400u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 14) = self->_numIpv6DnsServers;
  *((_DWORD *)result + 28) |= 0x800u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 15) = self->_numLocalDnsServers;
  *((_DWORD *)result + 28) |= 0x1000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 16) = self->_numRemoteDnsServers;
  *((_DWORD *)result + 28) |= 0x2000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 4) = self->_configType;
  *((_DWORD *)result + 28) |= 2u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 10) = self->_netscoreAtStudyStart;
  *((_DWORD *)result + 28) |= 0x80u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 18) = self->_stallscoreAtStudyStart;
  *((_DWORD *)result + 28) |= 0x8000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 6) = self->_impactedServersAtStudyStart;
  *((_DWORD *)result + 28) |= 8u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 12) = self->_netscoreHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x200u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 20) = self->_stallscoreHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x20000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 8) = self->_lanHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x20u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 25) = self->_wanHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x400000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)result + 105) = self->_isCaptiveServerIPResolved;
  *((_DWORD *)result + 28) |= 0x1000000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)result + 108) = self->_symptomsDnsscreenStateOn;
  *((_DWORD *)result + 28) |= 0x8000000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 22) = self->_symptomsDnsRecommendation;
  *((_DWORD *)result + 28) |= 0x80000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 21) = self->_suppressedReason;
  *((_DWORD *)result + 28) |= 0x40000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 9) = self->_netscoreAtStudyEnd;
  *((_DWORD *)result + 28) |= 0x40u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 17) = self->_stallscoreAtStudyEnd;
  *((_DWORD *)result + 28) |= 0x4000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 5) = self->_impactedServersAtStudyEnd;
  *((_DWORD *)result + 28) |= 4u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 11) = self->_netscoreHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x100u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 19) = self->_stallscoreHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x10000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 7) = self->_lanHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x10u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 24) = self->_wanHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x200000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)result + 1) = self->_symptomsDnsTimeSincePreviousTriggerMinutes;
  *((_DWORD *)result + 28) |= 1u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((unsigned char *)result + 104) = self->_dpsNotificationReceivedDuringStudy;
  *((_DWORD *)result + 28) |= 0x800000u;
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      return result;
    }
    goto LABEL_29;
  }
LABEL_57:
  *((unsigned char *)result + 107) = self->_slowWiFiNotificationReceivedDuringStudy;
  *((_DWORD *)result + 28) |= 0x4000000u;
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0) {
    return result;
  }
LABEL_29:
  *((unsigned char *)result + 106) = self->_isPingEnqueueFailing;
  *((_DWORD *)result + 28) |= 0x2000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_152;
  }
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  int v6 = *((_DWORD *)v4 + 28);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_totalDnsServers != *((_DWORD *)v4 + 23)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_numIpv4DnsServers != *((_DWORD *)v4 + 13)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_numIpv6DnsServers != *((_DWORD *)v4 + 14)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_numLocalDnsServers != *((_DWORD *)v4 + 15)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_numRemoteDnsServers != *((_DWORD *)v4 + 16)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_configType != *((_DWORD *)v4 + 4)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_152;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_netscoreAtStudyStart != *((_DWORD *)v4 + 10)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_stallscoreAtStudyStart != *((_DWORD *)v4 + 18)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_impactedServersAtStudyStart != *((_DWORD *)v4 + 6)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_netscoreHealthBeforeDecision != *((_DWORD *)v4 + 12)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_stallscoreHealthBeforeDecision != *((_DWORD *)v4 + 20)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lanHealthBeforeDecision != *((_DWORD *)v4 + 8)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_wanHealthBeforeDecision != *((_DWORD *)v4 + 25)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_152;
    }
    if (self->_isCaptiveServerIPResolved)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_152;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_152;
    }
    if (self->_symptomsDnsscreenStateOn)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_152;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_symptomsDnsRecommendation != *((_DWORD *)v4 + 22)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_suppressedReason != *((_DWORD *)v4 + 21)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_netscoreAtStudyEnd != *((_DWORD *)v4 + 9)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_stallscoreAtStudyEnd != *((_DWORD *)v4 + 17)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_impactedServersAtStudyEnd != *((_DWORD *)v4 + 5)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_netscoreHealthAfterDecision != *((_DWORD *)v4 + 11)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_stallscoreHealthAfterDecision != *((_DWORD *)v4 + 19)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lanHealthAfterDecision != *((_DWORD *)v4 + 7)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_wanHealthAfterDecision != *((_DWORD *)v4 + 24)) {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_152;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_symptomsDnsTimeSincePreviousTriggerMinutes != *((void *)v4 + 1)) {
      goto LABEL_152;
    }
  }
  else if (v6)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0) {
      goto LABEL_152;
    }
    if (self->_dpsNotificationReceivedDuringStudy)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_152;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_152;
    }
    if (self->_slowWiFiNotificationReceivedDuringStudy)
    {
      if (!*((unsigned char *)v4 + 107)) {
        goto LABEL_152;
      }
    }
    else if (*((unsigned char *)v4 + 107))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) != 0)
    {
      if (self->_isPingEnqueueFailing)
      {
        if (!*((unsigned char *)v4 + 106)) {
          goto LABEL_152;
        }
      }
      else if (*((unsigned char *)v4 + 106))
      {
        goto LABEL_152;
      }
      BOOL v7 = 1;
      goto LABEL_153;
    }
LABEL_152:
    BOOL v7 = 0;
    goto LABEL_153;
  }
  BOOL v7 = (v6 & 0x2000000) == 0;
LABEL_153:

  return v7;
}

- (unint64_t)hash
{
  $F3D7C730B717C29F2620BA54A0CAA3FF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t v31 = 2654435761 * self->_totalDnsServers;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_numIpv4DnsServers;
      if ((*(_WORD *)&has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_numIpv6DnsServers;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_numLocalDnsServers;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_numRemoteDnsServers;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_configType;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v8 = 2654435761 * self->_netscoreAtStudyStart;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761 * self->_stallscoreAtStudyStart;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_10:
    uint64_t v10 = 2654435761 * self->_impactedServersAtStudyStart;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v11 = 2654435761 * self->_netscoreHealthBeforeDecision;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_stallscoreHealthBeforeDecision;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_13:
    uint64_t v13 = 2654435761 * self->_lanHealthBeforeDecision;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_14:
    uint64_t v14 = 2654435761 * self->_wanHealthBeforeDecision;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_15:
    uint64_t v15 = 2654435761 * self->_isCaptiveServerIPResolved;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_16:
    uint64_t v16 = 2654435761 * self->_symptomsDnsscreenStateOn;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    uint64_t v17 = 2654435761 * self->_symptomsDnsRecommendation;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_18:
    uint64_t v18 = 2654435761 * self->_suppressedReason;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_19:
    uint64_t v19 = 2654435761 * self->_netscoreAtStudyEnd;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_20:
    uint64_t v20 = 2654435761 * self->_stallscoreAtStudyEnd;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_21:
    uint64_t v21 = 2654435761 * self->_impactedServersAtStudyEnd;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_22:
    uint64_t v22 = 2654435761 * self->_netscoreHealthAfterDecision;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_23:
    uint64_t v23 = 2654435761 * self->_stallscoreHealthAfterDecision;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_24:
    uint64_t v24 = 2654435761 * self->_lanHealthAfterDecision;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_25:
    uint64_t v25 = 2654435761 * self->_wanHealthAfterDecision;
    if (*(unsigned char *)&has) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v25 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_26:
    unint64_t v26 = 2654435761u * self->_symptomsDnsTimeSincePreviousTriggerMinutes;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_27:
    uint64_t v27 = 2654435761 * self->_dpsNotificationReceivedDuringStudy;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_28;
    }
LABEL_56:
    uint64_t v28 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_29;
    }
LABEL_57:
    uint64_t v29 = 0;
    return v3 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_55:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&has & 0x4000000) == 0) {
    goto LABEL_56;
  }
LABEL_28:
  uint64_t v28 = 2654435761 * self->_slowWiFiNotificationReceivedDuringStudy;
  if ((*(_DWORD *)&has & 0x2000000) == 0) {
    goto LABEL_57;
  }
LABEL_29:
  uint64_t v29 = 2654435761 * self->_isPingEnqueueFailing;
  return v3 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x100000) != 0)
  {
    self->_totalDnsServers = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v5 = *((_DWORD *)v4 + 28);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_numIpv4DnsServers = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_numIpv6DnsServers = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x1000) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_numLocalDnsServers = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_numRemoteDnsServers = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_uint64_t configType = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_netscoreAtStudyStart = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_stallscoreAtStudyStart = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_impactedServersAtStudyStart = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_netscoreHealthBeforeDecision = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x20000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_stallscoreHealthBeforeDecision = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_lanHealthBeforeDecision = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x400000) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_wanHealthBeforeDecision = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_isCaptiveServerIPResolved = *((unsigned char *)v4 + 105);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_symptomsDnsscreenStateOn = *((unsigned char *)v4 + 108);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_uint64_t symptomsDnsRecommendation = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x40000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_uint64_t suppressedReason = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_netscoreAtStudyEnd = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x4000) == 0)
  {
LABEL_20:
    if ((v5 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_stallscoreAtStudyEnd = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_21:
    if ((v5 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_impactedServersAtStudyEnd = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_netscoreHealthAfterDecision = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x10000) == 0)
  {
LABEL_23:
    if ((v5 & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_stallscoreHealthAfterDecision = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_24:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_lanHealthAfterDecision = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x200000) == 0)
  {
LABEL_25:
    if ((v5 & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_wanHealthAfterDecision = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_26:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_symptomsDnsTimeSincePreviousTriggerMinutes = *((void *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x800000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_dpsNotificationReceivedDuringStudy = *((unsigned char *)v4 + 104);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_59:
  self->_slowWiFiNotificationReceivedDuringStudy = *((unsigned char *)v4 + 107);
  *(_DWORD *)&self->_has |= 0x4000000u;
  if ((*((_DWORD *)v4 + 28) & 0x2000000) != 0)
  {
LABEL_29:
    self->_isPingEnqueueFailing = *((unsigned char *)v4 + 106);
    *(_DWORD *)&self->_has |= 0x2000000u;
  }
LABEL_30:
}

- (unsigned)totalDnsServers
{
  return self->_totalDnsServers;
}

- (unsigned)numIpv4DnsServers
{
  return self->_numIpv4DnsServers;
}

- (unsigned)numIpv6DnsServers
{
  return self->_numIpv6DnsServers;
}

- (unsigned)numLocalDnsServers
{
  return self->_numLocalDnsServers;
}

- (unsigned)numRemoteDnsServers
{
  return self->_numRemoteDnsServers;
}

- (unsigned)netscoreAtStudyStart
{
  return self->_netscoreAtStudyStart;
}

- (unsigned)stallscoreAtStudyStart
{
  return self->_stallscoreAtStudyStart;
}

- (unsigned)impactedServersAtStudyStart
{
  return self->_impactedServersAtStudyStart;
}

- (unsigned)netscoreHealthBeforeDecision
{
  return self->_netscoreHealthBeforeDecision;
}

- (unsigned)stallscoreHealthBeforeDecision
{
  return self->_stallscoreHealthBeforeDecision;
}

- (unsigned)lanHealthBeforeDecision
{
  return self->_lanHealthBeforeDecision;
}

- (unsigned)wanHealthBeforeDecision
{
  return self->_wanHealthBeforeDecision;
}

- (BOOL)isCaptiveServerIPResolved
{
  return self->_isCaptiveServerIPResolved;
}

- (BOOL)symptomsDnsscreenStateOn
{
  return self->_symptomsDnsscreenStateOn;
}

- (unsigned)netscoreAtStudyEnd
{
  return self->_netscoreAtStudyEnd;
}

- (unsigned)stallscoreAtStudyEnd
{
  return self->_stallscoreAtStudyEnd;
}

- (unsigned)impactedServersAtStudyEnd
{
  return self->_impactedServersAtStudyEnd;
}

- (unsigned)netscoreHealthAfterDecision
{
  return self->_netscoreHealthAfterDecision;
}

- (unsigned)stallscoreHealthAfterDecision
{
  return self->_stallscoreHealthAfterDecision;
}

- (unsigned)lanHealthAfterDecision
{
  return self->_lanHealthAfterDecision;
}

- (unsigned)wanHealthAfterDecision
{
  return self->_wanHealthAfterDecision;
}

- (unint64_t)symptomsDnsTimeSincePreviousTriggerMinutes
{
  return self->_symptomsDnsTimeSincePreviousTriggerMinutes;
}

- (BOOL)dpsNotificationReceivedDuringStudy
{
  return self->_dpsNotificationReceivedDuringStudy;
}

- (BOOL)slowWiFiNotificationReceivedDuringStudy
{
  return self->_slowWiFiNotificationReceivedDuringStudy;
}

- (BOOL)isPingEnqueueFailing
{
  return self->_isPingEnqueueFailing;
}

@end