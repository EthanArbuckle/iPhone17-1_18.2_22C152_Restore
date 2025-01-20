@interface AWDNetworkServiceProxyConnectionStatistics
- (BOOL)hasAlternatePathCount;
- (BOOL)hasCaptivePresentCount;
- (BOOL)hasCaptivePresentFailedCount;
- (BOOL)hasConnectionCount;
- (BOOL)hasExceededMssCount;
- (BOOL)hasInterfaceType;
- (BOOL)hasMptcpSuccessCount;
- (BOOL)hasProtocolType;
- (BOOL)hasRestrictedNetworkCount;
- (BOOL)hasRestrictedNetworkFailedCount;
- (BOOL)hasResultConnectionResetCount;
- (BOOL)hasResultNetworkUnavailableCount;
- (BOOL)hasResultResponseTimeoutCount;
- (BOOL)hasResultSendFailureCount;
- (BOOL)hasResultServerBusyCount;
- (BOOL)hasResultServerDetachedCount;
- (BOOL)hasResultServerInterruptCount;
- (BOOL)hasResultServerOfflineCount;
- (BOOL)hasResultServerOrphanedCount;
- (BOOL)hasResultServerSessionExpiredCount;
- (BOOL)hasResultServerUnreachableCount;
- (BOOL)hasResultSuccessCount;
- (BOOL)hasResultUnknownErrorCount;
- (BOOL)hasTfoSuccessCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceTypeAsString:(int)a3;
- (id)protocolTypeAsString:(int)a3;
- (int)StringAsInterfaceType:(id)a3;
- (int)StringAsProtocolType:(id)a3;
- (int)interfaceType;
- (int)protocolType;
- (unint64_t)captivePresentCount;
- (unint64_t)connectionCount;
- (unint64_t)connectionDurationBucketsCount;
- (unint64_t)hash;
- (unint64_t)mptcpSuccessCount;
- (unint64_t)restrictedNetworkCount;
- (unint64_t)resultConnectionResetCount;
- (unint64_t)resultNetworkUnavailableCount;
- (unint64_t)resultResponseTimeoutCount;
- (unint64_t)resultSendFailureCount;
- (unint64_t)resultServerBusyCount;
- (unint64_t)resultServerDetachedCount;
- (unint64_t)resultServerInterruptCount;
- (unint64_t)resultServerOfflineCount;
- (unint64_t)resultServerOrphanedCount;
- (unint64_t)resultServerSessionExpiredCount;
- (unint64_t)resultServerUnreachableCount;
- (unint64_t)resultSuccessCount;
- (unint64_t)resultUnknownErrorCount;
- (unint64_t)tfoSuccessCount;
- (unint64_t)timestamp;
- (unsigned)alternatePathCount;
- (unsigned)captivePresentFailedCount;
- (unsigned)connectionDurationBuckets;
- (unsigned)connectionDurationBucketsAtIndex:(unint64_t)a3;
- (unsigned)exceededMssCount;
- (unsigned)restrictedNetworkFailedCount;
- (void)addConnectionDurationBuckets:(unsigned int)a3;
- (void)clearConnectionDurationBuckets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlternatePathCount:(unsigned int)a3;
- (void)setCaptivePresentCount:(unint64_t)a3;
- (void)setCaptivePresentFailedCount:(unsigned int)a3;
- (void)setConnectionCount:(unint64_t)a3;
- (void)setConnectionDurationBuckets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setExceededMssCount:(unsigned int)a3;
- (void)setHasAlternatePathCount:(BOOL)a3;
- (void)setHasCaptivePresentCount:(BOOL)a3;
- (void)setHasCaptivePresentFailedCount:(BOOL)a3;
- (void)setHasConnectionCount:(BOOL)a3;
- (void)setHasExceededMssCount:(BOOL)a3;
- (void)setHasInterfaceType:(BOOL)a3;
- (void)setHasMptcpSuccessCount:(BOOL)a3;
- (void)setHasProtocolType:(BOOL)a3;
- (void)setHasRestrictedNetworkCount:(BOOL)a3;
- (void)setHasRestrictedNetworkFailedCount:(BOOL)a3;
- (void)setHasResultConnectionResetCount:(BOOL)a3;
- (void)setHasResultNetworkUnavailableCount:(BOOL)a3;
- (void)setHasResultResponseTimeoutCount:(BOOL)a3;
- (void)setHasResultSendFailureCount:(BOOL)a3;
- (void)setHasResultServerBusyCount:(BOOL)a3;
- (void)setHasResultServerDetachedCount:(BOOL)a3;
- (void)setHasResultServerInterruptCount:(BOOL)a3;
- (void)setHasResultServerOfflineCount:(BOOL)a3;
- (void)setHasResultServerOrphanedCount:(BOOL)a3;
- (void)setHasResultServerSessionExpiredCount:(BOOL)a3;
- (void)setHasResultServerUnreachableCount:(BOOL)a3;
- (void)setHasResultSuccessCount:(BOOL)a3;
- (void)setHasResultUnknownErrorCount:(BOOL)a3;
- (void)setHasTfoSuccessCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceType:(int)a3;
- (void)setMptcpSuccessCount:(unint64_t)a3;
- (void)setProtocolType:(int)a3;
- (void)setRestrictedNetworkCount:(unint64_t)a3;
- (void)setRestrictedNetworkFailedCount:(unsigned int)a3;
- (void)setResultConnectionResetCount:(unint64_t)a3;
- (void)setResultNetworkUnavailableCount:(unint64_t)a3;
- (void)setResultResponseTimeoutCount:(unint64_t)a3;
- (void)setResultSendFailureCount:(unint64_t)a3;
- (void)setResultServerBusyCount:(unint64_t)a3;
- (void)setResultServerDetachedCount:(unint64_t)a3;
- (void)setResultServerInterruptCount:(unint64_t)a3;
- (void)setResultServerOfflineCount:(unint64_t)a3;
- (void)setResultServerOrphanedCount:(unint64_t)a3;
- (void)setResultServerSessionExpiredCount:(unint64_t)a3;
- (void)setResultServerUnreachableCount:(unint64_t)a3;
- (void)setResultSuccessCount:(unint64_t)a3;
- (void)setResultUnknownErrorCount:(unint64_t)a3;
- (void)setTfoSuccessCount:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNetworkServiceProxyConnectionStatistics

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyConnectionStatistics;
  [(AWDNetworkServiceProxyConnectionStatistics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)interfaceType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    return self->_interfaceType;
  }
  else {
    return 1;
  }
}

- (void)setInterfaceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasInterfaceType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9AC0[a3 - 1];
  }
}

- (int)StringAsInterfaceType:(id)a3
{
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_WIFI"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_CELLULAR"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_WIRED"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyInterfaceType_VIRTUAL"]) {
    return 4;
  }
  return 1;
}

- (void)setConnectionCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_connectionCount = a3;
}

- (void)setHasConnectionCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConnectionCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTfoSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tfoSuccessCount = a3;
}

- (void)setHasTfoSuccessCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTfoSuccessCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMptcpSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_mptcpSuccessCount = a3;
}

- (void)setHasMptcpSuccessCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMptcpSuccessCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRestrictedNetworkCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_restrictedNetworkCount = a3;
}

- (void)setHasRestrictedNetworkCount:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRestrictedNetworkCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCaptivePresentCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_captivePresentCount = a3;
}

- (void)setHasCaptivePresentCount:(BOOL)a3
{
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCaptivePresentCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setResultSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_resultSuccessCount = a3;
}

- (void)setHasResultSuccessCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasResultSuccessCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setResultNetworkUnavailableCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_resultNetworkUnavailableCount = a3;
}

- (void)setHasResultNetworkUnavailableCount:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasResultNetworkUnavailableCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setResultServerUnreachableCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_resultServerUnreachableCount = a3;
}

- (void)setHasResultServerUnreachableCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasResultServerUnreachableCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setResultSendFailureCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_resultSendFailureCount = a3;
}

- (void)setHasResultSendFailureCount:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasResultSendFailureCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setResultResponseTimeoutCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_resultResponseTimeoutCount = a3;
}

- (void)setHasResultResponseTimeoutCount:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasResultResponseTimeoutCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setResultConnectionResetCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_resultConnectionResetCount = a3;
}

- (void)setHasResultConnectionResetCount:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasResultConnectionResetCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setResultServerBusyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_resultServerBusyCount = a3;
}

- (void)setHasResultServerBusyCount:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasResultServerBusyCount
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setResultServerOfflineCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_resultServerOfflineCount = a3;
}

- (void)setHasResultServerOfflineCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasResultServerOfflineCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setResultServerDetachedCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_resultServerDetachedCount = a3;
}

- (void)setHasResultServerDetachedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasResultServerDetachedCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setResultServerInterruptCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_resultServerInterruptCount = a3;
}

- (void)setHasResultServerInterruptCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasResultServerInterruptCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setResultServerSessionExpiredCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_resultServerSessionExpiredCount = a3;
}

- (void)setHasResultServerSessionExpiredCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasResultServerSessionExpiredCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setResultUnknownErrorCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_resultUnknownErrorCount = a3;
}

- (void)setHasResultUnknownErrorCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasResultUnknownErrorCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRestrictedNetworkFailedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_restrictedNetworkFailedCount = a3;
}

- (void)setHasRestrictedNetworkFailedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasRestrictedNetworkFailedCount
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setCaptivePresentFailedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_captivePresentFailedCount = a3;
}

- (void)setHasCaptivePresentFailedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasCaptivePresentFailedCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAlternatePathCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_alternatePathCount = a3;
}

- (void)setHasAlternatePathCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAlternatePathCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setExceededMssCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_exceededMssCount = a3;
}

- (void)setHasExceededMssCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasExceededMssCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (unint64_t)connectionDurationBucketsCount
{
  return self->_connectionDurationBuckets.count;
}

- (unsigned)connectionDurationBuckets
{
  return self->_connectionDurationBuckets.list;
}

- (void)clearConnectionDurationBuckets
{
}

- (void)addConnectionDurationBuckets:(unsigned int)a3
{
}

- (unsigned)connectionDurationBucketsAtIndex:(unint64_t)a3
{
  p_connectionDurationBuckets = &self->_connectionDurationBuckets;
  unint64_t count = self->_connectionDurationBuckets.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_connectionDurationBuckets->list[a3];
}

- (void)setConnectionDurationBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)protocolType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    return self->_protocolType;
  }
  else {
    return 1;
  }
}

- (void)setProtocolType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_protocolType = a3;
}

- (void)setHasProtocolType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasProtocolType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)protocolTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9AE0[a3 - 1];
  }
}

- (int)StringAsProtocolType:(id)a3
{
  if ([a3 isEqualToString:@"NetworkServiceProxyProtocolType_IPv4"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyProtocolType_IPv6"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NetworkServiceProxyProtocolType_NAT64"]) {
    return 3;
  }
  return 1;
}

- (void)setResultServerOrphanedCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_resultServerOrphanedCount = a3;
}

- (void)setHasResultServerOrphanedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasResultServerOrphanedCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyConnectionStatistics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNetworkServiceProxyConnectionStatistics description](&v3, sel_description), -[AWDNetworkServiceProxyConnectionStatistics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v8 = self->_interfaceType - 1;
  if (v8 >= 4) {
    v9 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_interfaceType];
  }
  else {
    v9 = off_2641B9AC0[v8];
  }
  [v3 setObject:v9 forKey:@"interface_type"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionCount] forKey:@"connection_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tfoSuccessCount] forKey:@"tfo_success_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpSuccessCount] forKey:@"mptcp_success_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_restrictedNetworkCount] forKey:@"restricted_network_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_captivePresentCount] forKey:@"captive_present_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultSuccessCount] forKey:@"result_success_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultNetworkUnavailableCount] forKey:@"result_network_unavailable_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultServerUnreachableCount] forKey:@"result_server_unreachable_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultSendFailureCount] forKey:@"result_send_failure_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultResponseTimeoutCount] forKey:@"result_response_timeout_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultConnectionResetCount] forKey:@"result_connection_reset_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultServerBusyCount] forKey:@"result_server_busy_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultServerOfflineCount] forKey:@"result_server_offline_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultServerDetachedCount] forKey:@"result_server_detached_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultServerInterruptCount] forKey:@"result_server_interrupt_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultServerSessionExpiredCount] forKey:@"result_server_session_expired_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultUnknownErrorCount] forKey:@"result_unknown_error_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_restrictedNetworkFailedCount] forKey:@"restricted_network_failed_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_captivePresentFailedCount] forKey:@"captive_present_failed_count"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_alternatePathCount] forKey:@"alternate_path_count"];
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_24:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_exceededMssCount] forKey:@"exceeded_mss_count"];
LABEL_25:
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"connection_duration_buckets"];
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
    unsigned int v6 = self->_protocolType - 1;
    if (v6 >= 3) {
      v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_protocolType];
    }
    else {
      v7 = off_2641B9AE0[v6];
    }
    [v3 setObject:v7 forKey:@"protocol_type"];
    $9970266CB1C3DB0A09F8AFAECC0F0C8E v5 = self->_has;
  }
  if ((*(_WORD *)&v5 & 0x1000) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resultServerOrphanedCount] forKey:@"result_server_orphaned_count"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkServiceProxyConnectionStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_connectionDurationBuckets.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_connectionDurationBuckets.count);
  }
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $9970266CB1C3DB0A09F8AFAECC0F0C8E v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((void *)a3 + 22) = self->_timestamp;
    *((_DWORD *)a3 + 52) |= 0x40000u;
    $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 49) = self->_interfaceType;
  *((_DWORD *)a3 + 52) |= 0x400000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)a3 + 5) = self->_connectionCount;
  *((_DWORD *)a3 + 52) |= 2u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)a3 + 21) = self->_tfoSuccessCount;
  *((_DWORD *)a3 + 52) |= 0x20000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 6) = self->_mptcpSuccessCount;
  *((_DWORD *)a3 + 52) |= 4u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 7) = self->_restrictedNetworkCount;
  *((_DWORD *)a3 + 52) |= 8u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 4) = self->_captivePresentCount;
  *((_DWORD *)a3 + 52) |= 1u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)a3 + 19) = self->_resultSuccessCount;
  *((_DWORD *)a3 + 52) |= 0x8000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)a3 + 9) = self->_resultNetworkUnavailableCount;
  *((_DWORD *)a3 + 52) |= 0x20u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)a3 + 18) = self->_resultServerUnreachableCount;
  *((_DWORD *)a3 + 52) |= 0x4000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)a3 + 11) = self->_resultSendFailureCount;
  *((_DWORD *)a3 + 52) |= 0x80u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)a3 + 10) = self->_resultResponseTimeoutCount;
  *((_DWORD *)a3 + 52) |= 0x40u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)a3 + 8) = self->_resultConnectionResetCount;
  *((_DWORD *)a3 + 52) |= 0x10u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)a3 + 12) = self->_resultServerBusyCount;
  *((_DWORD *)a3 + 52) |= 0x100u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)a3 + 15) = self->_resultServerOfflineCount;
  *((_DWORD *)a3 + 52) |= 0x800u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)a3 + 13) = self->_resultServerDetachedCount;
  *((_DWORD *)a3 + 52) |= 0x200u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 14) = self->_resultServerInterruptCount;
  *((_DWORD *)a3 + 52) |= 0x400u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 17) = self->_resultServerSessionExpiredCount;
  *((_DWORD *)a3 + 52) |= 0x2000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 20) = self->_resultUnknownErrorCount;
  *((_DWORD *)a3 + 52) |= 0x10000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 51) = self->_restrictedNetworkFailedCount;
  *((_DWORD *)a3 + 52) |= 0x1000000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_23;
    }
LABEL_55:
    *((_DWORD *)a3 + 46) = self->_alternatePathCount;
    *((_DWORD *)a3 + 52) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_54:
  *((_DWORD *)a3 + 47) = self->_captivePresentFailedCount;
  *((_DWORD *)a3 + 52) |= 0x100000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_55;
  }
LABEL_23:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_24:
    *((_DWORD *)a3 + 48) = self->_exceededMssCount;
    *((_DWORD *)a3 + 52) |= 0x200000u;
  }
LABEL_25:
  if ([(AWDNetworkServiceProxyConnectionStatistics *)self connectionDurationBucketsCount])
  {
    [a3 clearConnectionDurationBuckets];
    unint64_t v6 = [(AWDNetworkServiceProxyConnectionStatistics *)self connectionDurationBucketsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addConnectionDurationBuckets:-[AWDNetworkServiceProxyConnectionStatistics connectionDurationBucketsAtIndex:](self, "connectionDurationBucketsAtIndex:", i)];
    }
  }
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    *((_DWORD *)a3 + 50) = self->_protocolType;
    *((_DWORD *)a3 + 52) |= 0x800000u;
    $9970266CB1C3DB0A09F8AFAECC0F0C8E v9 = self->_has;
  }
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    *((void *)a3 + 16) = self->_resultServerOrphanedCount;
    *((_DWORD *)a3 + 52) |= 0x1000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = v4;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *(void *)(v4 + 176) = self->_timestamp;
    *(_DWORD *)(v4 + 208) |= 0x40000u;
    $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 196) = self->_interfaceType;
  *(_DWORD *)(v4 + 208) |= 0x400000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)(v4 + 40) = self->_connectionCount;
  *(_DWORD *)(v4 + 208) |= 2u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(void *)(v4 + 168) = self->_tfoSuccessCount;
  *(_DWORD *)(v4 + 208) |= 0x20000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(void *)(v4 + 48) = self->_mptcpSuccessCount;
  *(_DWORD *)(v4 + 208) |= 4u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(void *)(v4 + 56) = self->_restrictedNetworkCount;
  *(_DWORD *)(v4 + 208) |= 8u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(void *)(v4 + 32) = self->_captivePresentCount;
  *(_DWORD *)(v4 + 208) |= 1u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(void *)(v4 + 152) = self->_resultSuccessCount;
  *(_DWORD *)(v4 + 208) |= 0x8000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(void *)(v4 + 72) = self->_resultNetworkUnavailableCount;
  *(_DWORD *)(v4 + 208) |= 0x20u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(void *)(v4 + 144) = self->_resultServerUnreachableCount;
  *(_DWORD *)(v4 + 208) |= 0x4000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(void *)(v4 + 88) = self->_resultSendFailureCount;
  *(_DWORD *)(v4 + 208) |= 0x80u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(void *)(v4 + 80) = self->_resultResponseTimeoutCount;
  *(_DWORD *)(v4 + 208) |= 0x40u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(void *)(v4 + 64) = self->_resultConnectionResetCount;
  *(_DWORD *)(v4 + 208) |= 0x10u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(void *)(v4 + 96) = self->_resultServerBusyCount;
  *(_DWORD *)(v4 + 208) |= 0x100u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(void *)(v4 + 120) = self->_resultServerOfflineCount;
  *(_DWORD *)(v4 + 208) |= 0x800u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(void *)(v4 + 104) = self->_resultServerDetachedCount;
  *(_DWORD *)(v4 + 208) |= 0x200u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(void *)(v4 + 112) = self->_resultServerInterruptCount;
  *(_DWORD *)(v4 + 208) |= 0x400u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(void *)(v4 + 136) = self->_resultServerSessionExpiredCount;
  *(_DWORD *)(v4 + 208) |= 0x2000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(void *)(v4 + 160) = self->_resultUnknownErrorCount;
  *(_DWORD *)(v4 + 208) |= 0x10000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v4 + 204) = self->_restrictedNetworkFailedCount;
  *(_DWORD *)(v4 + 208) |= 0x1000000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v4 + 188) = self->_captivePresentFailedCount;
  *(_DWORD *)(v4 + 208) |= 0x100000u;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_51:
  *(_DWORD *)(v4 + 184) = self->_alternatePathCount;
  *(_DWORD *)(v4 + 208) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_24:
    *(_DWORD *)(v4 + 192) = self->_exceededMssCount;
    *(_DWORD *)(v4 + 208) |= 0x200000u;
  }
LABEL_25:
  PBRepeatedUInt32Copy();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_protocolType;
    *(_DWORD *)(v5 + 208) |= 0x800000u;
    $9970266CB1C3DB0A09F8AFAECC0F0C8E v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    *(void *)(v5 + 128) = self->_resultServerOrphanedCount;
    *(_DWORD *)(v5 + 208) |= 0x1000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
    int v7 = *((_DWORD *)a3 + 52);
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_timestamp != *((void *)a3 + 22)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
LABEL_127:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_interfaceType != *((_DWORD *)a3 + 49)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_connectionCount != *((void *)a3 + 5)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_tfoSuccessCount != *((void *)a3 + 21)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_mptcpSuccessCount != *((void *)a3 + 6)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_127;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_restrictedNetworkCount != *((void *)a3 + 7)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_127;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_captivePresentCount != *((void *)a3 + 4)) {
        goto LABEL_127;
      }
    }
    else if (v7)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_resultSuccessCount != *((void *)a3 + 19)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_resultNetworkUnavailableCount != *((void *)a3 + 9)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_resultServerUnreachableCount != *((void *)a3 + 18)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_resultSendFailureCount != *((void *)a3 + 11)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_127;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_resultResponseTimeoutCount != *((void *)a3 + 10)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_127;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_resultConnectionResetCount != *((void *)a3 + 8)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_resultServerBusyCount != *((void *)a3 + 12)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_resultServerOfflineCount != *((void *)a3 + 15)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_resultServerDetachedCount != *((void *)a3 + 13)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_resultServerInterruptCount != *((void *)a3 + 14)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_resultServerSessionExpiredCount != *((void *)a3 + 17)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_resultUnknownErrorCount != *((void *)a3 + 20)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_restrictedNetworkFailedCount != *((_DWORD *)a3 + 51)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_captivePresentFailedCount != *((_DWORD *)a3 + 47)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_alternatePathCount != *((_DWORD *)a3 + 46)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_exceededMssCount != *((_DWORD *)a3 + 48)) {
        goto LABEL_127;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_127;
    }
    int IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      $9970266CB1C3DB0A09F8AFAECC0F0C8E v8 = self->_has;
      int v9 = *((_DWORD *)a3 + 52);
      if ((*(_DWORD *)&v8 & 0x800000) != 0)
      {
        if ((v9 & 0x800000) == 0 || self->_protocolType != *((_DWORD *)a3 + 50)) {
          goto LABEL_127;
        }
      }
      else if ((v9 & 0x800000) != 0)
      {
        goto LABEL_127;
      }
      LOBYTE(IsEqual) = (*((_DWORD *)a3 + 52) & 0x1000) == 0;
      if ((*(_WORD *)&v8 & 0x1000) != 0)
      {
        if ((v9 & 0x1000) == 0 || self->_resultServerOrphanedCount != *((void *)a3 + 16)) {
          goto LABEL_127;
        }
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    unint64_t v31 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
LABEL_3:
      uint64_t v30 = 2654435761 * self->_interfaceType;
      if ((*(unsigned char *)&has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else
  {
    unint64_t v31 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v30 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_4:
    unint64_t v29 = 2654435761u * self->_connectionCount;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v29 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_5:
    unint64_t v28 = 2654435761u * self->_tfoSuccessCount;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v28 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_6:
    unint64_t v27 = 2654435761u * self->_mptcpSuccessCount;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v27 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_7:
    unint64_t v26 = 2654435761u * self->_restrictedNetworkCount;
    if (*(unsigned char *)&has) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v26 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_8:
    unint64_t v25 = 2654435761u * self->_captivePresentCount;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_9:
    unint64_t v24 = 2654435761u * self->_resultSuccessCount;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v24 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_10:
    unint64_t v23 = 2654435761u * self->_resultNetworkUnavailableCount;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    unint64_t v22 = 2654435761u * self->_resultServerUnreachableCount;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_12:
    unint64_t v21 = 2654435761u * self->_resultSendFailureCount;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v21 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_13:
    unint64_t v20 = 2654435761u * self->_resultResponseTimeoutCount;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_14:
    unint64_t v19 = 2654435761u * self->_resultConnectionResetCount;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    unint64_t v18 = 2654435761u * self->_resultServerBusyCount;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    unint64_t v17 = 2654435761u * self->_resultServerOfflineCount;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_17:
    unint64_t v4 = 2654435761u * self->_resultServerDetachedCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_18:
    unint64_t v5 = 2654435761u * self->_resultServerInterruptCount;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_19:
    unint64_t v6 = 2654435761u * self->_resultServerSessionExpiredCount;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_20:
    unint64_t v7 = 2654435761u * self->_resultUnknownErrorCount;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  unint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_21:
    uint64_t v8 = 2654435761 * self->_restrictedNetworkFailedCount;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    uint64_t v9 = 2654435761 * self->_captivePresentFailedCount;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_23;
    }
LABEL_46:
    uint64_t v10 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_45:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    goto LABEL_46;
  }
LABEL_23:
  uint64_t v10 = 2654435761 * self->_alternatePathCount;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_24:
    uint64_t v11 = 2654435761 * self->_exceededMssCount;
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v11 = 0;
LABEL_48:
  uint64_t v12 = PBRepeatedUInt32Hash();
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    uint64_t v14 = 2654435761 * self->_protocolType;
    if ((*(_WORD *)&v13 & 0x1000) != 0) {
      goto LABEL_50;
    }
LABEL_52:
    unint64_t v15 = 0;
    return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&v13 & 0x1000) == 0) {
    goto LABEL_52;
  }
LABEL_50:
  unint64_t v15 = 2654435761u * self->_resultServerOrphanedCount;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x40000) != 0)
  {
    self->_timestamp = *((void *)a3 + 22);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v5 = *((_DWORD *)a3 + 52);
    if ((v5 & 0x400000) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((v5 & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  self->_interfaceType = *((_DWORD *)a3 + 49);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_connectionCount = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x20000) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_tfoSuccessCount = *((void *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_mptcpSuccessCount = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_restrictedNetworkCount = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_captivePresentCount = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_resultSuccessCount = *((void *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_resultNetworkUnavailableCount = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_resultServerUnreachableCount = *((void *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_resultSendFailureCount = *((void *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_resultResponseTimeoutCount = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_resultConnectionResetCount = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_resultServerBusyCount = *((void *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x800) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_resultServerOfflineCount = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_resultServerDetachedCount = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x400) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_resultServerInterruptCount = *((void *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_resultServerSessionExpiredCount = *((void *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x10000) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_resultUnknownErrorCount = *((void *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_restrictedNetworkFailedCount = *((_DWORD *)a3 + 51);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_captivePresentFailedCount = *((_DWORD *)a3 + 47);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x80000) == 0)
  {
LABEL_23:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_54:
  self->_alternatePathCount = *((_DWORD *)a3 + 46);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 52) & 0x200000) != 0)
  {
LABEL_24:
    self->_exceededMssCount = *((_DWORD *)a3 + 48);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_25:
  uint64_t v6 = [a3 connectionDurationBucketsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDNetworkServiceProxyConnectionStatistics addConnectionDurationBuckets:](self, "addConnectionDurationBuckets:", [a3 connectionDurationBucketsAtIndex:i]);
  }
  int v9 = *((_DWORD *)a3 + 52);
  if ((v9 & 0x800000) != 0)
  {
    self->_protocolType = *((_DWORD *)a3 + 50);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v9 = *((_DWORD *)a3 + 52);
  }
  if ((v9 & 0x1000) != 0)
  {
    self->_resultServerOrphanedCount = *((void *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)connectionCount
{
  return self->_connectionCount;
}

- (unint64_t)tfoSuccessCount
{
  return self->_tfoSuccessCount;
}

- (unint64_t)mptcpSuccessCount
{
  return self->_mptcpSuccessCount;
}

- (unint64_t)restrictedNetworkCount
{
  return self->_restrictedNetworkCount;
}

- (unint64_t)captivePresentCount
{
  return self->_captivePresentCount;
}

- (unint64_t)resultSuccessCount
{
  return self->_resultSuccessCount;
}

- (unint64_t)resultNetworkUnavailableCount
{
  return self->_resultNetworkUnavailableCount;
}

- (unint64_t)resultServerUnreachableCount
{
  return self->_resultServerUnreachableCount;
}

- (unint64_t)resultSendFailureCount
{
  return self->_resultSendFailureCount;
}

- (unint64_t)resultResponseTimeoutCount
{
  return self->_resultResponseTimeoutCount;
}

- (unint64_t)resultConnectionResetCount
{
  return self->_resultConnectionResetCount;
}

- (unint64_t)resultServerBusyCount
{
  return self->_resultServerBusyCount;
}

- (unint64_t)resultServerOfflineCount
{
  return self->_resultServerOfflineCount;
}

- (unint64_t)resultServerDetachedCount
{
  return self->_resultServerDetachedCount;
}

- (unint64_t)resultServerInterruptCount
{
  return self->_resultServerInterruptCount;
}

- (unint64_t)resultServerSessionExpiredCount
{
  return self->_resultServerSessionExpiredCount;
}

- (unint64_t)resultUnknownErrorCount
{
  return self->_resultUnknownErrorCount;
}

- (unsigned)restrictedNetworkFailedCount
{
  return self->_restrictedNetworkFailedCount;
}

- (unsigned)captivePresentFailedCount
{
  return self->_captivePresentFailedCount;
}

- (unsigned)alternatePathCount
{
  return self->_alternatePathCount;
}

- (unsigned)exceededMssCount
{
  return self->_exceededMssCount;
}

- (unint64_t)resultServerOrphanedCount
{
  return self->_resultServerOrphanedCount;
}

@end