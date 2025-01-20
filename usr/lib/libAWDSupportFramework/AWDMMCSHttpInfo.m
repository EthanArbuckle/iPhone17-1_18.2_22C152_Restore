@interface AWDMMCSHttpInfo
+ (Class)httpErrorType;
+ (Class)tcpInfoType;
- (BOOL)allowsCellular;
- (BOOL)allowsPowerNapScheduling;
- (BOOL)cancelled;
- (BOOL)connectionReused;
- (BOOL)fastFail;
- (BOOL)finalTryInRequest;
- (BOOL)forceNondiscretionary;
- (BOOL)hasAdaptiveTcpReadTimeout;
- (BOOL)hasAdaptiveTcpWriteTimeout;
- (BOOL)hasAllowsCellular;
- (BOOL)hasAllowsPowerNapScheduling;
- (BOOL)hasCancelled;
- (BOOL)hasConnectionReused;
- (BOOL)hasDuration;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasFastFail;
- (BOOL)hasFinalTryInRequest;
- (BOOL)hasForceNondiscretionary;
- (BOOL)hasHttpStatus;
- (BOOL)hasInlineEdgeComplete;
- (BOOL)hasInterfaceIdentifier;
- (BOOL)hasLocatorHostname;
- (BOOL)hasLocatorPeerAddress;
- (BOOL)hasLocatorPort;
- (BOOL)hasLocatorScheme;
- (BOOL)hasNetworkServiceType;
- (BOOL)hasNetworkUsed;
- (BOOL)hasPowerPluggedInAtEnd;
- (BOOL)hasPowerPluggedInAtStart;
- (BOOL)hasPowerPluggedInWhenQueued;
- (BOOL)hasProxyUsed;
- (BOOL)hasQualityOfService;
- (BOOL)hasRequestSize;
- (BOOL)hasRequiresPowerPluggedIn;
- (BOOL)hasResponseReceivedDuration;
- (BOOL)hasResponseSize;
- (BOOL)hasStartTime;
- (BOOL)hasTimedOut;
- (BOOL)hasTransactionComplete;
- (BOOL)inlineEdgeComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)powerPluggedInAtEnd;
- (BOOL)powerPluggedInAtStart;
- (BOOL)powerPluggedInWhenQueued;
- (BOOL)proxyUsed;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresPowerPluggedIn;
- (BOOL)timedOut;
- (BOOL)transactionComplete;
- (NSMutableArray)httpErrors;
- (NSMutableArray)tcpInfos;
- (NSString)errorDomain;
- (NSString)interfaceIdentifier;
- (NSString)locatorHostname;
- (NSString)locatorPeerAddress;
- (NSString)locatorScheme;
- (NSString)networkUsed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)httpErrorAtIndex:(unint64_t)a3;
- (id)tcpInfoAtIndex:(unint64_t)a3;
- (int)adaptiveTcpReadTimeout;
- (int)adaptiveTcpWriteTimeout;
- (int)errorCode;
- (int)httpStatus;
- (int)qualityOfService;
- (int)requestSize;
- (int)responseSize;
- (int64_t)duration;
- (int64_t)networkServiceType;
- (int64_t)responseReceivedDuration;
- (int64_t)startTime;
- (unint64_t)hash;
- (unint64_t)httpErrorsCount;
- (unint64_t)tcpInfosCount;
- (unsigned)locatorPort;
- (void)addHttpError:(id)a3;
- (void)addTcpInfo:(id)a3;
- (void)clearHttpErrors;
- (void)clearTcpInfos;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdaptiveTcpReadTimeout:(int)a3;
- (void)setAdaptiveTcpWriteTimeout:(int)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setAllowsPowerNapScheduling:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setConnectionReused:(BOOL)a3;
- (void)setDuration:(int64_t)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setFastFail:(BOOL)a3;
- (void)setFinalTryInRequest:(BOOL)a3;
- (void)setForceNondiscretionary:(BOOL)a3;
- (void)setHasAdaptiveTcpReadTimeout:(BOOL)a3;
- (void)setHasAdaptiveTcpWriteTimeout:(BOOL)a3;
- (void)setHasAllowsCellular:(BOOL)a3;
- (void)setHasAllowsPowerNapScheduling:(BOOL)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasConnectionReused:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasFastFail:(BOOL)a3;
- (void)setHasFinalTryInRequest:(BOOL)a3;
- (void)setHasForceNondiscretionary:(BOOL)a3;
- (void)setHasHttpStatus:(BOOL)a3;
- (void)setHasInlineEdgeComplete:(BOOL)a3;
- (void)setHasLocatorPort:(BOOL)a3;
- (void)setHasNetworkServiceType:(BOOL)a3;
- (void)setHasPowerPluggedInAtEnd:(BOOL)a3;
- (void)setHasPowerPluggedInAtStart:(BOOL)a3;
- (void)setHasPowerPluggedInWhenQueued:(BOOL)a3;
- (void)setHasProxyUsed:(BOOL)a3;
- (void)setHasQualityOfService:(BOOL)a3;
- (void)setHasRequestSize:(BOOL)a3;
- (void)setHasRequiresPowerPluggedIn:(BOOL)a3;
- (void)setHasResponseReceivedDuration:(BOOL)a3;
- (void)setHasResponseSize:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTimedOut:(BOOL)a3;
- (void)setHasTransactionComplete:(BOOL)a3;
- (void)setHttpErrors:(id)a3;
- (void)setHttpStatus:(int)a3;
- (void)setInlineEdgeComplete:(BOOL)a3;
- (void)setInterfaceIdentifier:(id)a3;
- (void)setLocatorHostname:(id)a3;
- (void)setLocatorPeerAddress:(id)a3;
- (void)setLocatorPort:(unsigned int)a3;
- (void)setLocatorScheme:(id)a3;
- (void)setNetworkServiceType:(int64_t)a3;
- (void)setNetworkUsed:(id)a3;
- (void)setPowerPluggedInAtEnd:(BOOL)a3;
- (void)setPowerPluggedInAtStart:(BOOL)a3;
- (void)setPowerPluggedInWhenQueued:(BOOL)a3;
- (void)setProxyUsed:(BOOL)a3;
- (void)setQualityOfService:(int)a3;
- (void)setRequestSize:(int)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setResponseReceivedDuration:(int64_t)a3;
- (void)setResponseSize:(int)a3;
- (void)setStartTime:(int64_t)a3;
- (void)setTcpInfos:(id)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTransactionComplete:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMMCSHttpInfo

- (void)dealloc
{
  [(AWDMMCSHttpInfo *)self setLocatorScheme:0];
  [(AWDMMCSHttpInfo *)self setLocatorHostname:0];
  [(AWDMMCSHttpInfo *)self setErrorDomain:0];
  [(AWDMMCSHttpInfo *)self setTcpInfos:0];
  [(AWDMMCSHttpInfo *)self setHttpErrors:0];
  [(AWDMMCSHttpInfo *)self setInterfaceIdentifier:0];
  [(AWDMMCSHttpInfo *)self setLocatorPeerAddress:0];
  [(AWDMMCSHttpInfo *)self setNetworkUsed:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSHttpInfo;
  [(AWDMMCSHttpInfo *)&v3 dealloc];
}

- (BOOL)hasLocatorScheme
{
  return self->_locatorScheme != 0;
}

- (BOOL)hasLocatorHostname
{
  return self->_locatorHostname != 0;
}

- (void)setLocatorPort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_locatorPort = a3;
}

- (void)setHasLocatorPort:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocatorPort
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setConnectionReused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_connectionReused = a3;
}

- (void)setHasConnectionReused:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasConnectionReused
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setStartTime:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setResponseReceivedDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_responseReceivedDuration = a3;
}

- (void)setHasResponseReceivedDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasResponseReceivedDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHttpStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_httpStatus = a3;
}

- (void)setHasHttpStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHttpStatus
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRequestSize:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_requestSize = a3;
}

- (void)setHasRequestSize:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRequestSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setResponseSize:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_responseSize = a3;
}

- (void)setHasResponseSize:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasResponseSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTransactionComplete:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_transactionComplete = a3;
}

- (void)setHasTransactionComplete:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTransactionComplete
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTimedOut:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_timedOut = a3;
}

- (void)setHasTimedOut:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTimedOut
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCancelled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasCancelled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)clearTcpInfos
{
}

- (void)addTcpInfo:(id)a3
{
  tcpInfos = self->_tcpInfos;
  if (!tcpInfos)
  {
    tcpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_tcpInfos = tcpInfos;
  }

  [(NSMutableArray *)tcpInfos addObject:a3];
}

- (unint64_t)tcpInfosCount
{
  return [(NSMutableArray *)self->_tcpInfos count];
}

- (id)tcpInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tcpInfos objectAtIndex:a3];
}

+ (Class)tcpInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearHttpErrors
{
}

- (void)addHttpError:(id)a3
{
  httpErrors = self->_httpErrors;
  if (!httpErrors)
  {
    httpErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_httpErrors = httpErrors;
  }

  [(NSMutableArray *)httpErrors addObject:a3];
}

- (unint64_t)httpErrorsCount
{
  return [(NSMutableArray *)self->_httpErrors count];
}

- (id)httpErrorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_httpErrors objectAtIndex:a3];
}

+ (Class)httpErrorType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInterfaceIdentifier
{
  return self->_interfaceIdentifier != 0;
}

- (BOOL)hasLocatorPeerAddress
{
  return self->_locatorPeerAddress != 0;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_requiresPowerPluggedIn = a3;
}

- (void)setHasRequiresPowerPluggedIn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasRequiresPowerPluggedIn
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setAllowsPowerNapScheduling:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_allowsPowerNapScheduling = a3;
}

- (void)setHasAllowsPowerNapScheduling:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAllowsPowerNapScheduling
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAllowsCellular:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_allowsCellular = a3;
}

- (void)setHasAllowsCellular:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAllowsCellular
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setForceNondiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_forceNondiscretionary = a3;
}

- (void)setHasForceNondiscretionary:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasForceNondiscretionary
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setFastFail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_fastFail = a3;
}

- (void)setHasFastFail:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasFastFail
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setQualityOfService:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_qualityOfService = a3;
}

- (void)setHasQualityOfService:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasQualityOfService
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProxyUsed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_proxyUsed = a3;
}

- (void)setHasProxyUsed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasProxyUsed
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setFinalTryInRequest:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_finalTryInRequest = a3;
}

- (void)setHasFinalTryInRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasFinalTryInRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setInlineEdgeComplete:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_inlineEdgeComplete = a3;
}

- (void)setHasInlineEdgeComplete:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasInlineEdgeComplete
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAdaptiveTcpReadTimeout:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_adaptiveTcpReadTimeout = a3;
}

- (void)setHasAdaptiveTcpReadTimeout:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAdaptiveTcpReadTimeout
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAdaptiveTcpWriteTimeout:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_adaptiveTcpWriteTimeout = a3;
}

- (void)setHasAdaptiveTcpWriteTimeout:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAdaptiveTcpWriteTimeout
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPowerPluggedInWhenQueued:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_powerPluggedInWhenQueued = a3;
}

- (void)setHasPowerPluggedInWhenQueued:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasPowerPluggedInWhenQueued
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPowerPluggedInAtStart:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_powerPluggedInAtStart = a3;
}

- (void)setHasPowerPluggedInAtStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasPowerPluggedInAtStart
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPowerPluggedInAtEnd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_powerPluggedInAtEnd = a3;
}

- (void)setHasPowerPluggedInAtEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasPowerPluggedInAtEnd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasNetworkUsed
{
  return self->_networkUsed != 0;
}

- (void)setNetworkServiceType:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_networkServiceType = a3;
}

- (void)setHasNetworkServiceType:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNetworkServiceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSHttpInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMMCSHttpInfo description](&v3, sel_description), -[AWDMMCSHttpInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  locatorScheme = self->_locatorScheme;
  if (locatorScheme) {
    [v3 setObject:locatorScheme forKey:@"locatorScheme"];
  }
  locatorHostname = self->_locatorHostname;
  if (locatorHostname) {
    [v4 setObject:locatorHostname forKey:@"locatorHostname"];
  }
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_locatorPort] forKey:@"locatorPort"];
    $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  [v4 setObject:[NSNumber numberWithBool:self->_connectionReused] forKey:@"connectionReused"];
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v4 setObject:[NSNumber numberWithLongLong:self->_startTime] forKey:@"startTime"];
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v4 setObject:[NSNumber numberWithLongLong:self->_responseReceivedDuration] forKey:@"responseReceivedDuration"];
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_67:
  [v4 setObject:[NSNumber numberWithLongLong:self->_duration] forKey:@"duration"];
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
LABEL_11:
  }
    [v4 setObject:[NSNumber numberWithInt:self->_httpStatus] forKey:@"httpStatus"];
LABEL_12:
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v4 setObject:errorDomain forKey:@"errorDomain"];
  }
  $A066514945FF1DC5778C75FAFFDDB194 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    [v4 setObject:[NSNumber numberWithInt:self->_errorCode] forKey:@"errorCode"];
    $A066514945FF1DC5778C75FAFFDDB194 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v9 & 0x800) == 0) {
        goto LABEL_17;
      }
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&v9 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  [v4 setObject:[NSNumber numberWithInt:self->_requestSize] forKey:@"requestSize"];
  $A066514945FF1DC5778C75FAFFDDB194 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v9 & 0x4000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v4 setObject:[NSNumber numberWithInt:self->_responseSize] forKey:@"responseSize"];
  $A066514945FF1DC5778C75FAFFDDB194 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v4 setObject:[NSNumber numberWithBool:self->_transactionComplete] forKey:@"transactionComplete"];
  $A066514945FF1DC5778C75FAFFDDB194 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v9 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_73:
  [v4 setObject:[NSNumber numberWithBool:self->_timedOut] forKey:@"timedOut"];
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_20:
  }
    [v4 setObject:[NSNumber numberWithBool:self->_cancelled] forKey:@"cancelled"];
LABEL_21:
  if ([(NSMutableArray *)self->_tcpInfos count])
  {
    v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_tcpInfos, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    tcpInfos = self->_tcpInfos;
    uint64_t v12 = [(NSMutableArray *)tcpInfos countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(tcpInfos);
          }
          [v10 addObject:[*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v13 = [(NSMutableArray *)tcpInfos countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }
    [v4 setObject:v10 forKey:@"tcpInfo"];
  }
  if ([(NSMutableArray *)self->_httpErrors count])
  {
    v16 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_httpErrors, "count")];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    httpErrors = self->_httpErrors;
    uint64_t v18 = [(NSMutableArray *)httpErrors countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(httpErrors);
          }
          [v16 addObject:[*(id *)(*((void *)&v27 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v19 = [(NSMutableArray *)httpErrors countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v19);
    }
    [v4 setObject:v16 forKey:@"httpError"];
  }
  interfaceIdentifier = self->_interfaceIdentifier;
  if (interfaceIdentifier) {
    [v4 setObject:interfaceIdentifier forKey:@"interfaceIdentifier"];
  }
  locatorPeerAddress = self->_locatorPeerAddress;
  if (locatorPeerAddress) {
    [v4 setObject:locatorPeerAddress forKey:@"locatorPeerAddress"];
  }
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x1000000) != 0)
  {
    [v4 setObject:[NSNumber numberWithBool:self->_requiresPowerPluggedIn] forKey:@"requiresPowerPluggedIn"];
    $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
    if ((*(_WORD *)&v24 & 0x2000) == 0)
    {
LABEL_45:
      if ((*(_WORD *)&v24 & 0x1000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v24 & 0x2000) == 0)
  {
    goto LABEL_45;
  }
  [v4 setObject:[NSNumber numberWithBool:self->_allowsPowerNapScheduling] forKey:@"allowsPowerNapScheduling"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x1000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v24 & 0x40000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v4 setObject:[NSNumber numberWithBool:self->_allowsCellular] forKey:@"allowsCellular"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x40000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v24 & 0x10000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v4 setObject:[NSNumber numberWithBool:self->_forceNondiscretionary] forKey:@"forceNondiscretionary"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x10000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v24 & 0x200) == 0) {
      goto LABEL_49;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v4 setObject:[NSNumber numberWithBool:self->_fastFail] forKey:@"fastFail"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x200) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v24 & 0x800000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v4 setObject:[NSNumber numberWithInt:self->_qualityOfService] forKey:@"qualityOfService"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x800000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v24 & 0x20000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v4 setObject:[NSNumber numberWithBool:self->_proxyUsed] forKey:@"proxyUsed"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x20000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v24 & 0x80000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v4 setObject:[NSNumber numberWithBool:self->_finalTryInRequest] forKey:@"finalTryInRequest"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x80000) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v24 & 0x10) == 0) {
      goto LABEL_53;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v4 setObject:[NSNumber numberWithBool:self->_inlineEdgeComplete] forKey:@"inlineEdgeComplete"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(unsigned char *)&v24 & 0x10) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&v24 & 0x20) == 0) {
      goto LABEL_54;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v4 setObject:[NSNumber numberWithInt:self->_adaptiveTcpReadTimeout] forKey:@"adaptiveTcpReadTimeout"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(unsigned char *)&v24 & 0x20) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v24 & 0x400000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v4 setObject:[NSNumber numberWithInt:self->_adaptiveTcpWriteTimeout] forKey:@"adaptiveTcpWriteTimeout"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x400000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v24 & 0x200000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_87;
  }
LABEL_86:
  [v4 setObject:[NSNumber numberWithBool:self->_powerPluggedInWhenQueued] forKey:@"powerPluggedInWhenQueued"];
  $A066514945FF1DC5778C75FAFFDDB194 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x200000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v24 & 0x100000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_87:
  [v4 setObject:[NSNumber numberWithBool:self->_powerPluggedInAtStart] forKey:@"powerPluggedInAtStart"];
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_57:
  }
    [v4 setObject:[NSNumber numberWithBool:self->_powerPluggedInAtEnd] forKey:@"powerPluggedInAtEnd"];
LABEL_58:
  networkUsed = self->_networkUsed;
  if (networkUsed) {
    [v4 setObject:networkUsed forKey:@"networkUsed"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v4 setObject:[NSNumber numberWithLongLong:self->_networkServiceType] forKey:@"networkServiceType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSHttpInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_locatorScheme) {
    PBDataWriterWriteStringField();
  }
  if (self->_locatorHostname) {
    PBDataWriterWriteStringField();
  }
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt64Field();
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_63:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  $A066514945FF1DC5778C75FAFFDDB194 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    $A066514945FF1DC5778C75FAFFDDB194 v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v5 & 0x800) == 0) {
        goto LABEL_17;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&v5 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  $A066514945FF1DC5778C75FAFFDDB194 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt32Field();
  $A066514945FF1DC5778C75FAFFDDB194 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_20:
  }
    PBDataWriterWriteBOOLField();
LABEL_21:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  tcpInfos = self->_tcpInfos;
  uint64_t v7 = [(NSMutableArray *)tcpInfos countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(tcpInfos);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)tcpInfos countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  httpErrors = self->_httpErrors;
  uint64_t v12 = [(NSMutableArray *)httpErrors countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(httpErrors);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)httpErrors countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
  if (self->_interfaceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_locatorPeerAddress) {
    PBDataWriterWriteStringField();
  }
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x2000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v16 & 0x1000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v16 & 0x40000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v16 & 0x10000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x10000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v16 & 0x200) == 0) {
      goto LABEL_45;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v16 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v16 & 0x20000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v16 & 0x80000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x80000) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v16 & 0x10) == 0) {
      goto LABEL_49;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x10) == 0)
  {
LABEL_49:
    if ((*(unsigned char *)&v16 & 0x20) == 0) {
      goto LABEL_50;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x20) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v16 & 0x400000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x400000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v16 & 0x200000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v16 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_53:
  }
    PBDataWriterWriteBOOLField();
LABEL_54:
  if (self->_networkUsed) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_locatorScheme) {
    [a3 setLocatorScheme:];
  }
  if (self->_locatorHostname) {
    [a3 setLocatorHostname:];
  }
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_locatorPort;
    *((_DWORD *)a3 + 42) |= 0x100u;
    $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)a3 + 155) = self->_connectionReused;
  *((_DWORD *)a3 + 42) |= 0x8000u;
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 4) = self->_startTime;
  *((_DWORD *)a3 + 42) |= 8u;
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 3) = self->_responseReceivedDuration;
  *((_DWORD *)a3 + 42) |= 4u;
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_57:
  *((void *)a3 + 1) = self->_duration;
  *((_DWORD *)a3 + 42) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 18) = self->_httpStatus;
    *((_DWORD *)a3 + 42) |= 0x80u;
  }
LABEL_12:
  if (self->_errorDomain) {
    [a3 setErrorDomain:];
  }
  $A066514945FF1DC5778C75FAFFDDB194 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_errorCode;
    *((_DWORD *)a3 + 42) |= 0x40u;
    $A066514945FF1DC5778C75FAFFDDB194 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v6 & 0x800) == 0) {
        goto LABEL_17;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 33) = self->_requestSize;
  *((_DWORD *)a3 + 42) |= 0x400u;
  $A066514945FF1DC5778C75FAFFDDB194 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 34) = self->_responseSize;
  *((_DWORD *)a3 + 42) |= 0x800u;
  $A066514945FF1DC5778C75FAFFDDB194 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0) {
      goto LABEL_19;
    }
LABEL_63:
    *((unsigned char *)a3 + 165) = self->_timedOut;
    *((_DWORD *)a3 + 42) |= 0x2000000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_62:
  *((unsigned char *)a3 + 166) = self->_transactionComplete;
  *((_DWORD *)a3 + 42) |= 0x4000000u;
  $A066514945FF1DC5778C75FAFFDDB194 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0) {
    goto LABEL_63;
  }
LABEL_19:
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
LABEL_20:
    *((unsigned char *)a3 + 154) = self->_cancelled;
    *((_DWORD *)a3 + 42) |= 0x4000u;
  }
LABEL_21:
  if ([(AWDMMCSHttpInfo *)self tcpInfosCount])
  {
    [a3 clearTcpInfos];
    unint64_t v7 = [(AWDMMCSHttpInfo *)self tcpInfosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addTcpInfo:-[AWDMMCSHttpInfo tcpInfoAtIndex:](self, "tcpInfoAtIndex:", i)];
    }
  }
  if ([(AWDMMCSHttpInfo *)self httpErrorsCount])
  {
    [a3 clearHttpErrors];
    unint64_t v10 = [(AWDMMCSHttpInfo *)self httpErrorsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addHttpError:-[AWDMMCSHttpInfo httpErrorAtIndex:](self, "httpErrorAtIndex:", j)];
    }
  }
  if (self->_interfaceIdentifier) {
    [a3 setInterfaceIdentifier:];
  }
  if (self->_locatorPeerAddress) {
    [a3 setLocatorPeerAddress:];
  }
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
    *((unsigned char *)a3 + 164) = self->_requiresPowerPluggedIn;
    *((_DWORD *)a3 + 42) |= 0x1000000u;
    $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_35:
      if ((*(_WORD *)&v13 & 0x1000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_35;
  }
  *((unsigned char *)a3 + 153) = self->_allowsPowerNapScheduling;
  *((_DWORD *)a3 + 42) |= 0x2000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((unsigned char *)a3 + 152) = self->_allowsCellular;
  *((_DWORD *)a3 + 42) |= 0x1000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((unsigned char *)a3 + 158) = self->_forceNondiscretionary;
  *((_DWORD *)a3 + 42) |= 0x40000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((unsigned char *)a3 + 156) = self->_fastFail;
  *((_DWORD *)a3 + 42) |= 0x10000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v13 & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)a3 + 32) = self->_qualityOfService;
  *((_DWORD *)a3 + 42) |= 0x200u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x20000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((unsigned char *)a3 + 163) = self->_proxyUsed;
  *((_DWORD *)a3 + 42) |= 0x800000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x80000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((unsigned char *)a3 + 157) = self->_finalTryInRequest;
  *((_DWORD *)a3 + 42) |= 0x20000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&v13 & 0x10) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((unsigned char *)a3 + 159) = self->_inlineEdgeComplete;
  *((_DWORD *)a3 + 42) |= 0x80000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 10) = self->_adaptiveTcpReadTimeout;
  *((_DWORD *)a3 + 42) |= 0x10u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v13 & 0x400000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 11) = self->_adaptiveTcpWriteTimeout;
  *((_DWORD *)a3 + 42) |= 0x20u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((unsigned char *)a3 + 162) = self->_powerPluggedInWhenQueued;
  *((_DWORD *)a3 + 42) |= 0x400000u;
  $A066514945FF1DC5778C75FAFFDDB194 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v13 & 0x100000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_77:
  *((unsigned char *)a3 + 161) = self->_powerPluggedInAtStart;
  *((_DWORD *)a3 + 42) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_47:
    *((unsigned char *)a3 + 160) = self->_powerPluggedInAtEnd;
    *((_DWORD *)a3 + 42) |= 0x100000u;
  }
LABEL_48:
  if (self->_networkUsed) {
    [a3 setNetworkUsed:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_networkServiceType;
    *((_DWORD *)a3 + 42) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")

  *(void *)(v5 + 112) = [(NSString *)self->_locatorScheme copyWithZone:a3];
  *(void *)(v5 + 88) = [(NSString *)self->_locatorHostname copyWithZone:a3];
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_locatorPort;
    *(_DWORD *)(v5 + 168) |= 0x100u;
    $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 155) = self->_connectionReused;
  *(_DWORD *)(v5 + 168) |= 0x8000u;
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(void *)(v5 + 32) = self->_startTime;
  *(_DWORD *)(v5 + 168) |= 8u;
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(void *)(v5 + 24) = self->_responseReceivedDuration;
  *(_DWORD *)(v5 + 168) |= 4u;
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_51:
  *(void *)(v5 + 8) = self->_duration;
  *(_DWORD *)(v5 + 168) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 72) = self->_httpStatus;
    *(_DWORD *)(v5 + 168) |= 0x80u;
  }
LABEL_8:

  *(void *)(v5 + 56) = [(NSString *)self->_errorDomain copyWithZone:a3];
  $A066514945FF1DC5778C75FAFFDDB194 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_errorCode;
    *(_DWORD *)(v5 + 168) |= 0x40u;
    $A066514945FF1DC5778C75FAFFDDB194 v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x400) == 0)
    {
LABEL_10:
      if ((*(_WORD *)&v7 & 0x800) == 0) {
        goto LABEL_11;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v7 & 0x400) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 132) = self->_requestSize;
  *(_DWORD *)(v5 + 168) |= 0x400u;
  $A066514945FF1DC5778C75FAFFDDB194 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 136) = self->_responseSize;
  *(_DWORD *)(v5 + 168) |= 0x800u;
  $A066514945FF1DC5778C75FAFFDDB194 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(unsigned char *)(v5 + 166) = self->_transactionComplete;
  *(_DWORD *)(v5 + 168) |= 0x4000000u;
  $A066514945FF1DC5778C75FAFFDDB194 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_57:
  *(unsigned char *)(v5 + 165) = self->_timedOut;
  *(_DWORD *)(v5 + 168) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_14:
    *(unsigned char *)(v5 + 154) = self->_cancelled;
    *(_DWORD *)(v5 + 168) |= 0x4000u;
  }
LABEL_15:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  tcpInfos = self->_tcpInfos;
  uint64_t v9 = [(NSMutableArray *)tcpInfos countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(tcpInfos);
        }
        $A066514945FF1DC5778C75FAFFDDB194 v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTcpInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)tcpInfos countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  httpErrors = self->_httpErrors;
  uint64_t v15 = [(NSMutableArray *)httpErrors countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(httpErrors);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addHttpError:v19];
      }
      uint64_t v16 = [(NSMutableArray *)httpErrors countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  *(void *)(v5 + 80) = [(NSString *)self->_interfaceIdentifier copyWithZone:a3];
  *(void *)(v5 + 96) = [(NSString *)self->_locatorPeerAddress copyWithZone:a3];
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x1000000) != 0)
  {
    *(unsigned char *)(v5 + 164) = self->_requiresPowerPluggedIn;
    *(_DWORD *)(v5 + 168) |= 0x1000000u;
    $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x2000) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v20 & 0x1000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
    goto LABEL_31;
  }
  *(unsigned char *)(v5 + 153) = self->_allowsPowerNapScheduling;
  *(_DWORD *)(v5 + 168) |= 0x2000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x1000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v20 & 0x40000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(unsigned char *)(v5 + 152) = self->_allowsCellular;
  *(_DWORD *)(v5 + 168) |= 0x1000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v20 & 0x10000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(unsigned char *)(v5 + 158) = self->_forceNondiscretionary;
  *(_DWORD *)(v5 + 168) |= 0x40000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v20 & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(unsigned char *)(v5 + 156) = self->_fastFail;
  *(_DWORD *)(v5 + 168) |= 0x10000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v20 & 0x800000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v5 + 128) = self->_qualityOfService;
  *(_DWORD *)(v5 + 168) |= 0x200u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x800000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v20 & 0x20000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(unsigned char *)(v5 + 163) = self->_proxyUsed;
  *(_DWORD *)(v5 + 168) |= 0x800000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v20 & 0x80000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(unsigned char *)(v5 + 157) = self->_finalTryInRequest;
  *(_DWORD *)(v5 + 168) |= 0x20000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&v20 & 0x10) == 0) {
      goto LABEL_39;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(unsigned char *)(v5 + 159) = self->_inlineEdgeComplete;
  *(_DWORD *)(v5 + 168) |= 0x80000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 0x10) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v20 & 0x20) == 0) {
      goto LABEL_40;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v5 + 40) = self->_adaptiveTcpReadTimeout;
  *(_DWORD *)(v5 + 168) |= 0x10u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 0x20) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v20 & 0x400000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v5 + 44) = self->_adaptiveTcpWriteTimeout;
  *(_DWORD *)(v5 + 168) |= 0x20u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x400000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v20 & 0x200000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(unsigned char *)(v5 + 162) = self->_powerPluggedInWhenQueued;
  *(_DWORD *)(v5 + 168) |= 0x400000u;
  $A066514945FF1DC5778C75FAFFDDB194 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x200000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v20 & 0x100000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_71:
  *(unsigned char *)(v5 + 161) = self->_powerPluggedInAtStart;
  *(_DWORD *)(v5 + 168) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_43:
    *(unsigned char *)(v5 + 160) = self->_powerPluggedInAtEnd;
    *(_DWORD *)(v5 + 168) |= 0x100000u;
  }
LABEL_44:

  *(void *)(v5 + 120) = [(NSString *)self->_networkUsed copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_networkServiceType;
    *(_DWORD *)(v5 + 168) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  locatorScheme = self->_locatorScheme;
  if ((unint64_t)locatorScheme | *((void *)a3 + 14))
  {
    int v5 = -[NSString isEqual:](locatorScheme, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  locatorHostname = self->_locatorHostname;
  if ((unint64_t)locatorHostname | *((void *)a3 + 11))
  {
    int v5 = -[NSString isEqual:](locatorHostname, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  int v9 = *((_DWORD *)a3 + 42);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_locatorPort != *((_DWORD *)a3 + 26)) {
      goto LABEL_77;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0) {
      goto LABEL_77;
    }
    if (self->_connectionReused)
    {
      if (!*((unsigned char *)a3 + 155)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 155))
    {
      goto LABEL_77;
    }
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_startTime != *((void *)a3 + 4)) {
      goto LABEL_77;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_responseReceivedDuration != *((void *)a3 + 3)) {
      goto LABEL_77;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_77;
  }
  if (*(unsigned char *)&has)
  {
    if ((v9 & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
      goto LABEL_77;
    }
  }
  else if (v9)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_httpStatus != *((_DWORD *)a3 + 18)) {
      goto LABEL_77;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)a3 + 7))
  {
    int v5 = -[NSString isEqual:](errorDomain, "isEqual:");
    if (!v5) {
      return v5;
    }
    $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  }
  int v11 = *((_DWORD *)a3 + 42);
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_errorCode != *((_DWORD *)a3 + 12)) {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0 || self->_requestSize != *((_DWORD *)a3 + 33)) {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_responseSize != *((_DWORD *)a3 + 34)) {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0) {
      goto LABEL_77;
    }
    if (self->_transactionComplete)
    {
      if (!*((unsigned char *)a3 + 166)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 166))
    {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v11 & 0x2000000) == 0) {
      goto LABEL_77;
    }
    if (self->_timedOut)
    {
      if (!*((unsigned char *)a3 + 165)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 165))
    {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x2000000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0) {
      goto LABEL_77;
    }
    if (self->_cancelled)
    {
      if (!*((unsigned char *)a3 + 154)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 154))
    {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_77;
  }
  tcpInfos = self->_tcpInfos;
  if ((unint64_t)tcpInfos | *((void *)a3 + 18))
  {
    int v5 = -[NSMutableArray isEqual:](tcpInfos, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  httpErrors = self->_httpErrors;
  if ((unint64_t)httpErrors | *((void *)a3 + 8))
  {
    int v5 = -[NSMutableArray isEqual:](httpErrors, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  interfaceIdentifier = self->_interfaceIdentifier;
  if ((unint64_t)interfaceIdentifier | *((void *)a3 + 10))
  {
    int v5 = -[NSString isEqual:](interfaceIdentifier, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  locatorPeerAddress = self->_locatorPeerAddress;
  if ((unint64_t)locatorPeerAddress | *((void *)a3 + 12))
  {
    int v5 = -[NSString isEqual:](locatorPeerAddress, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  int v17 = *((_DWORD *)a3 + 42);
  if ((*(_DWORD *)&v16 & 0x1000000) != 0)
  {
    if ((v17 & 0x1000000) == 0) {
      goto LABEL_77;
    }
    if (self->_requiresPowerPluggedIn)
    {
      if (!*((unsigned char *)a3 + 164)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 164))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x1000000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&v16 & 0x2000) != 0)
  {
    if ((v17 & 0x2000) == 0) {
      goto LABEL_77;
    }
    if (self->_allowsPowerNapScheduling)
    {
      if (!*((unsigned char *)a3 + 153)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 153))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x2000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0) {
      goto LABEL_77;
    }
    if (self->_allowsCellular)
    {
      if (!*((unsigned char *)a3 + 152)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 152))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x40000) != 0)
  {
    if ((v17 & 0x40000) == 0) {
      goto LABEL_77;
    }
    if (self->_forceNondiscretionary)
    {
      if (!*((unsigned char *)a3 + 158)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 158))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x40000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    if ((v17 & 0x10000) == 0) {
      goto LABEL_77;
    }
    if (self->_fastFail)
    {
      if (!*((unsigned char *)a3 + 156)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 156))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x10000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_qualityOfService != *((_DWORD *)a3 + 32)) {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x800000) != 0)
  {
    if ((v17 & 0x800000) == 0) {
      goto LABEL_77;
    }
    if (self->_proxyUsed)
    {
      if (!*((unsigned char *)a3 + 163)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 163))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x800000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    if ((v17 & 0x20000) == 0) {
      goto LABEL_77;
    }
    if (self->_finalTryInRequest)
    {
      if (!*((unsigned char *)a3 + 157)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 157))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x20000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    if ((v17 & 0x80000) == 0) {
      goto LABEL_77;
    }
    if (self->_inlineEdgeComplete)
    {
      if (!*((unsigned char *)a3 + 159)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 159))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x80000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_adaptiveTcpReadTimeout != *((_DWORD *)a3 + 10)) {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((*(unsigned char *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_adaptiveTcpWriteTimeout != *((_DWORD *)a3 + 11)) {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x400000) != 0)
  {
    if ((v17 & 0x400000) == 0) {
      goto LABEL_77;
    }
    if (self->_powerPluggedInWhenQueued)
    {
      if (!*((unsigned char *)a3 + 162)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 162))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x400000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0) {
      goto LABEL_77;
    }
    if (self->_powerPluggedInAtStart)
    {
      if (!*((unsigned char *)a3 + 161)) {
        goto LABEL_77;
      }
    }
    else if (*((unsigned char *)a3 + 161))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x100000) == 0)
  {
    if ((v17 & 0x100000) == 0) {
      goto LABEL_194;
    }
LABEL_77:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v17 & 0x100000) == 0) {
    goto LABEL_77;
  }
  if (self->_powerPluggedInAtEnd)
  {
    if (!*((unsigned char *)a3 + 160)) {
      goto LABEL_77;
    }
    goto LABEL_194;
  }
  if (*((unsigned char *)a3 + 160)) {
    goto LABEL_77;
  }
LABEL_194:
  networkUsed = self->_networkUsed;
  if ((unint64_t)networkUsed | *((void *)a3 + 15))
  {
    int v5 = -[NSString isEqual:](networkUsed, "isEqual:");
    if (!v5) {
      return v5;
    }
    $A066514945FF1DC5778C75FAFFDDB194 v16 = self->_has;
  }
  int v19 = *((_DWORD *)a3 + 42);
  LOBYTE(v5) = (v19 & 2) == 0;
  if ((*(unsigned char *)&v16 & 2) == 0) {
    return v5;
  }
  if ((v19 & 2) == 0 || self->_networkServiceType != *((void *)a3 + 2)) {
    goto LABEL_77;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v41 = [(NSString *)self->_locatorScheme hash];
  NSUInteger v40 = [(NSString *)self->_locatorHostname hash];
  $A066514945FF1DC5778C75FAFFDDB194 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    uint64_t v39 = 2654435761 * self->_locatorPort;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      uint64_t v38 = 2654435761 * self->_connectionReused;
      if ((*(unsigned char *)&has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v38 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_4:
    uint64_t v37 = 2654435761 * self->_startTime;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v37 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    uint64_t v36 = 2654435761 * self->_responseReceivedDuration;
    if (*(unsigned char *)&has) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v35 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v36 = 0;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v35 = 2654435761 * self->_duration;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v34 = 2654435761 * self->_httpStatus;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v34 = 0;
LABEL_14:
  NSUInteger v33 = [(NSString *)self->_errorDomain hash];
  $A066514945FF1DC5778C75FAFFDDB194 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
    uint64_t v32 = 2654435761 * self->_errorCode;
    if ((*(_WORD *)&v4 & 0x400) != 0)
    {
LABEL_16:
      uint64_t v31 = 2654435761 * self->_requestSize;
      if ((*(_WORD *)&v4 & 0x800) != 0) {
        goto LABEL_17;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v31 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_17:
    uint64_t v30 = 2654435761 * self->_responseSize;
    if ((*(_DWORD *)&v4 & 0x4000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&v4 & 0x4000000) != 0)
  {
LABEL_18:
    uint64_t v29 = 2654435761 * self->_transactionComplete;
    if ((*(_DWORD *)&v4 & 0x2000000) != 0) {
      goto LABEL_19;
    }
LABEL_25:
    uint64_t v28 = 0;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&v4 & 0x2000000) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v28 = 2654435761 * self->_timedOut;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_20:
    uint64_t v27 = 2654435761 * self->_cancelled;
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v27 = 0;
LABEL_27:
  uint64_t v26 = [(NSMutableArray *)self->_tcpInfos hash];
  uint64_t v25 = [(NSMutableArray *)self->_httpErrors hash];
  NSUInteger v24 = [(NSString *)self->_interfaceIdentifier hash];
  NSUInteger v23 = [(NSString *)self->_locatorPeerAddress hash];
  $A066514945FF1DC5778C75FAFFDDB194 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) != 0)
  {
    uint64_t v22 = 2654435761 * self->_requiresPowerPluggedIn;
    if ((*(_WORD *)&v5 & 0x2000) != 0)
    {
LABEL_29:
      uint64_t v21 = 2654435761 * self->_allowsPowerNapScheduling;
      if ((*(_WORD *)&v5 & 0x1000) != 0) {
        goto LABEL_30;
      }
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((*(_WORD *)&v5 & 0x2000) != 0) {
      goto LABEL_29;
    }
  }
  uint64_t v21 = 0;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_30:
    uint64_t v20 = 2654435761 * self->_allowsCellular;
    if ((*(_DWORD *)&v5 & 0x40000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
LABEL_31:
    uint64_t v19 = 2654435761 * self->_forceNondiscretionary;
    if ((*(_DWORD *)&v5 & 0x10000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_32:
    uint64_t v18 = 2654435761 * self->_fastFail;
    if ((*(_WORD *)&v5 & 0x200) != 0) {
      goto LABEL_33;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
LABEL_33:
    uint64_t v17 = 2654435761 * self->_qualityOfService;
    if ((*(_DWORD *)&v5 & 0x800000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_34:
    uint64_t v16 = 2654435761 * self->_proxyUsed;
    if ((*(_DWORD *)&v5 & 0x20000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
LABEL_35:
    uint64_t v6 = 2654435761 * self->_finalTryInRequest;
    if ((*(_DWORD *)&v5 & 0x80000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
LABEL_36:
    uint64_t v7 = 2654435761 * self->_inlineEdgeComplete;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_37;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&v5 & 0x10) != 0)
  {
LABEL_37:
    uint64_t v8 = 2654435761 * self->_adaptiveTcpReadTimeout;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_38;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
LABEL_38:
    uint64_t v9 = 2654435761 * self->_adaptiveTcpWriteTimeout;
    if ((*(_DWORD *)&v5 & 0x400000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
LABEL_39:
    uint64_t v10 = 2654435761 * self->_powerPluggedInWhenQueued;
    if ((*(_DWORD *)&v5 & 0x200000) != 0) {
      goto LABEL_40;
    }
LABEL_54:
    uint64_t v11 = 0;
    if ((*(_DWORD *)&v5 & 0x100000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_55;
  }
LABEL_53:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&v5 & 0x200000) == 0) {
    goto LABEL_54;
  }
LABEL_40:
  uint64_t v11 = 2654435761 * self->_powerPluggedInAtStart;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
LABEL_41:
    uint64_t v12 = 2654435761 * self->_powerPluggedInAtEnd;
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v12 = 0;
LABEL_56:
  NSUInteger v13 = [(NSString *)self->_networkUsed hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v14 = 2654435761 * self->_networkServiceType;
  }
  else {
    uint64_t v14 = 0;
  }
  return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 14)) {
    -[AWDMMCSHttpInfo setLocatorScheme:](self, "setLocatorScheme:");
  }
  if (*((void *)a3 + 11)) {
    -[AWDMMCSHttpInfo setLocatorHostname:](self, "setLocatorHostname:");
  }
  int v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 0x100) != 0)
  {
    self->_locatorPort = *((_DWORD *)a3 + 26);
    *(_DWORD *)&self->_has |= 0x100u;
    int v5 = *((_DWORD *)a3 + 42);
    if ((v5 & 0x8000) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_61;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  self->_connectionReused = *((unsigned char *)a3 + 155);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_startTime = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_responseReceivedDuration = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_63:
  self->_duration = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)a3 + 42) & 0x80) != 0)
  {
LABEL_11:
    self->_httpStatus = *((_DWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_12:
  if (*((void *)a3 + 7)) {
    -[AWDMMCSHttpInfo setErrorDomain:](self, "setErrorDomain:");
  }
  int v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x40) != 0)
  {
    self->_errorCode = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x40u;
    int v6 = *((_DWORD *)a3 + 42);
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x800) == 0) {
        goto LABEL_17;
      }
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  self->_requestSize = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x800) == 0)
  {
LABEL_17:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_responseSize = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_18:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_transactionComplete = *((unsigned char *)a3 + 166);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_19:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_69:
  self->_timedOut = *((unsigned char *)a3 + 165);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)a3 + 42) & 0x4000) != 0)
  {
LABEL_20:
    self->_cancelled = *((unsigned char *)a3 + 154);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_21:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 18);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDMMCSHttpInfo *)self addTcpInfo:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AWDMMCSHttpInfo *)self addHttpError:*(void *)(*((void *)&v18 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
  if (*((void *)a3 + 10)) {
    -[AWDMMCSHttpInfo setInterfaceIdentifier:](self, "setInterfaceIdentifier:");
  }
  if (*((void *)a3 + 12)) {
    -[AWDMMCSHttpInfo setLocatorPeerAddress:](self, "setLocatorPeerAddress:");
  }
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x1000000) != 0)
  {
    self->_requiresPowerPluggedIn = *((unsigned char *)a3 + 164);
    *(_DWORD *)&self->_has |= 0x1000000u;
    int v17 = *((_DWORD *)a3 + 42);
    if ((v17 & 0x2000) == 0)
    {
LABEL_41:
      if ((v17 & 0x1000) == 0) {
        goto LABEL_42;
      }
      goto LABEL_73;
    }
  }
  else if ((v17 & 0x2000) == 0)
  {
    goto LABEL_41;
  }
  self->_allowsPowerNapScheduling = *((unsigned char *)a3 + 153);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x1000) == 0)
  {
LABEL_42:
    if ((v17 & 0x40000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_allowsCellular = *((unsigned char *)a3 + 152);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x40000) == 0)
  {
LABEL_43:
    if ((v17 & 0x10000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_forceNondiscretionary = *((unsigned char *)a3 + 158);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x10000) == 0)
  {
LABEL_44:
    if ((v17 & 0x200) == 0) {
      goto LABEL_45;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_fastFail = *((unsigned char *)a3 + 156);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x200) == 0)
  {
LABEL_45:
    if ((v17 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_qualityOfService = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x200u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x800000) == 0)
  {
LABEL_46:
    if ((v17 & 0x20000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_proxyUsed = *((unsigned char *)a3 + 163);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x20000) == 0)
  {
LABEL_47:
    if ((v17 & 0x80000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_finalTryInRequest = *((unsigned char *)a3 + 157);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x80000) == 0)
  {
LABEL_48:
    if ((v17 & 0x10) == 0) {
      goto LABEL_49;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_inlineEdgeComplete = *((unsigned char *)a3 + 159);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x10) == 0)
  {
LABEL_49:
    if ((v17 & 0x20) == 0) {
      goto LABEL_50;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_adaptiveTcpReadTimeout = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x20) == 0)
  {
LABEL_50:
    if ((v17 & 0x400000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_adaptiveTcpWriteTimeout = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x400000) == 0)
  {
LABEL_51:
    if ((v17 & 0x200000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_powerPluggedInWhenQueued = *((unsigned char *)a3 + 162);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x200000) == 0)
  {
LABEL_52:
    if ((v17 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_83:
  self->_powerPluggedInAtStart = *((unsigned char *)a3 + 161);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 42) & 0x100000) != 0)
  {
LABEL_53:
    self->_powerPluggedInAtEnd = *((unsigned char *)a3 + 160);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_54:
  if (*((void *)a3 + 15)) {
    -[AWDMMCSHttpInfo setNetworkUsed:](self, "setNetworkUsed:");
  }
  if ((*((unsigned char *)a3 + 168) & 2) != 0)
  {
    self->_networkServiceType = *((void *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
  }
}

- (NSString)locatorScheme
{
  return self->_locatorScheme;
}

- (void)setLocatorScheme:(id)a3
{
}

- (NSString)locatorHostname
{
  return self->_locatorHostname;
}

- (void)setLocatorHostname:(id)a3
{
}

- (unsigned)locatorPort
{
  return self->_locatorPort;
}

- (BOOL)connectionReused
{
  return self->_connectionReused;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)responseReceivedDuration
{
  return self->_responseReceivedDuration;
}

- (int64_t)duration
{
  return self->_duration;
}

- (int)httpStatus
{
  return self->_httpStatus;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)requestSize
{
  return self->_requestSize;
}

- (int)responseSize
{
  return self->_responseSize;
}

- (BOOL)transactionComplete
{
  return self->_transactionComplete;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (NSMutableArray)tcpInfos
{
  return self->_tcpInfos;
}

- (void)setTcpInfos:(id)a3
{
}

- (NSMutableArray)httpErrors
{
  return self->_httpErrors;
}

- (void)setHttpErrors:(id)a3
{
}

- (NSString)interfaceIdentifier
{
  return self->_interfaceIdentifier;
}

- (void)setInterfaceIdentifier:(id)a3
{
}

- (NSString)locatorPeerAddress
{
  return self->_locatorPeerAddress;
}

- (void)setLocatorPeerAddress:(id)a3
{
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (BOOL)allowsPowerNapScheduling
{
  return self->_allowsPowerNapScheduling;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (BOOL)forceNondiscretionary
{
  return self->_forceNondiscretionary;
}

- (BOOL)fastFail
{
  return self->_fastFail;
}

- (int)qualityOfService
{
  return self->_qualityOfService;
}

- (BOOL)proxyUsed
{
  return self->_proxyUsed;
}

- (BOOL)finalTryInRequest
{
  return self->_finalTryInRequest;
}

- (BOOL)inlineEdgeComplete
{
  return self->_inlineEdgeComplete;
}

- (int)adaptiveTcpReadTimeout
{
  return self->_adaptiveTcpReadTimeout;
}

- (int)adaptiveTcpWriteTimeout
{
  return self->_adaptiveTcpWriteTimeout;
}

- (BOOL)powerPluggedInWhenQueued
{
  return self->_powerPluggedInWhenQueued;
}

- (BOOL)powerPluggedInAtStart
{
  return self->_powerPluggedInAtStart;
}

- (BOOL)powerPluggedInAtEnd
{
  return self->_powerPluggedInAtEnd;
}

- (NSString)networkUsed
{
  return self->_networkUsed;
}

- (void)setNetworkUsed:(id)a3
{
}

- (int64_t)networkServiceType
{
  return self->_networkServiceType;
}

@end