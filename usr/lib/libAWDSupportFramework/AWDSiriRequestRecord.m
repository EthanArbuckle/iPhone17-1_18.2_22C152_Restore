@interface AWDSiriRequestRecord
+ (Class)transportHistoryType;
- (BOOL)hasBeaconPer;
- (BOOL)hasBtRetransmissionRateRx;
- (BOOL)hasBtRetransmissionRateTx;
- (BOOL)hasBtRssi;
- (BOOL)hasBtTech;
- (BOOL)hasEndTimestamp;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasExpectedThroughputVIBE;
- (BOOL)hasIRATRecommendation;
- (BOOL)hasIRATRecommendationDelay;
- (BOOL)hasIdsErrorCode;
- (BOOL)hasIdsMessageDelay;
- (BOOL)hasIdsSocketDelay;
- (BOOL)hasLsmRecommendationBe;
- (BOOL)hasNwtype;
- (BOOL)hasPacketLifetimeVIBE;
- (BOOL)hasPacketLossRateVIBE;
- (BOOL)hasRequestStatus;
- (BOOL)hasStartTimestamp;
- (BOOL)hasTimeToFirstWord;
- (BOOL)hasUnderlyingErrorCode;
- (BOOL)hasUnderlyingErrorDomain;
- (BOOL)hasWifiCCA;
- (BOOL)hasWifiRSSI;
- (BOOL)hasWifiSNR;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)transportHistorys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorDomainAsString:(int)a3;
- (id)iRATRecommendationAsString:(int)a3;
- (id)requestStatusAsString:(int)a3;
- (id)transportHistoryAtIndex:(unint64_t)a3;
- (id)underlyingErrorDomainAsString:(int)a3;
- (int)StringAsErrorDomain:(id)a3;
- (int)StringAsIRATRecommendation:(id)a3;
- (int)StringAsRequestStatus:(id)a3;
- (int)StringAsUnderlyingErrorDomain:(id)a3;
- (int)errorCode;
- (int)errorDomain;
- (int)iRATRecommendation;
- (int)requestStatus;
- (int)underlyingErrorCode;
- (int)underlyingErrorDomain;
- (int64_t)btRetransmissionRateRx;
- (int64_t)btRetransmissionRateTx;
- (int64_t)btTech;
- (int64_t)expectedThroughputVIBE;
- (int64_t)lsmRecommendationBe;
- (int64_t)packetLifetimeVIBE;
- (int64_t)packetLossRateVIBE;
- (int64_t)wifiCCA;
- (int64_t)wifiRSSI;
- (int64_t)wifiSNR;
- (unint64_t)btRssi;
- (unint64_t)endTimestamp;
- (unint64_t)hash;
- (unint64_t)iRATRecommendationDelay;
- (unint64_t)startTimestamp;
- (unint64_t)timeToFirstWord;
- (unint64_t)transportHistorysCount;
- (unsigned)beaconPer;
- (unsigned)idsErrorCode;
- (unsigned)idsMessageDelay;
- (unsigned)idsSocketDelay;
- (unsigned)nwtype;
- (void)addTransportHistory:(id)a3;
- (void)clearTransportHistorys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBeaconPer:(unsigned int)a3;
- (void)setBtRetransmissionRateRx:(int64_t)a3;
- (void)setBtRetransmissionRateTx:(int64_t)a3;
- (void)setBtRssi:(unint64_t)a3;
- (void)setBtTech:(int64_t)a3;
- (void)setEndTimestamp:(unint64_t)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(int)a3;
- (void)setExpectedThroughputVIBE:(int64_t)a3;
- (void)setHasBeaconPer:(BOOL)a3;
- (void)setHasBtRetransmissionRateRx:(BOOL)a3;
- (void)setHasBtRetransmissionRateTx:(BOOL)a3;
- (void)setHasBtRssi:(BOOL)a3;
- (void)setHasBtTech:(BOOL)a3;
- (void)setHasEndTimestamp:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasExpectedThroughputVIBE:(BOOL)a3;
- (void)setHasIRATRecommendation:(BOOL)a3;
- (void)setHasIRATRecommendationDelay:(BOOL)a3;
- (void)setHasIdsErrorCode:(BOOL)a3;
- (void)setHasIdsMessageDelay:(BOOL)a3;
- (void)setHasIdsSocketDelay:(BOOL)a3;
- (void)setHasLsmRecommendationBe:(BOOL)a3;
- (void)setHasNwtype:(BOOL)a3;
- (void)setHasPacketLifetimeVIBE:(BOOL)a3;
- (void)setHasPacketLossRateVIBE:(BOOL)a3;
- (void)setHasRequestStatus:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setHasTimeToFirstWord:(BOOL)a3;
- (void)setHasUnderlyingErrorCode:(BOOL)a3;
- (void)setHasUnderlyingErrorDomain:(BOOL)a3;
- (void)setHasWifiCCA:(BOOL)a3;
- (void)setHasWifiRSSI:(BOOL)a3;
- (void)setHasWifiSNR:(BOOL)a3;
- (void)setIRATRecommendation:(int)a3;
- (void)setIRATRecommendationDelay:(unint64_t)a3;
- (void)setIdsErrorCode:(unsigned int)a3;
- (void)setIdsMessageDelay:(unsigned int)a3;
- (void)setIdsSocketDelay:(unsigned int)a3;
- (void)setLsmRecommendationBe:(int64_t)a3;
- (void)setNwtype:(unsigned int)a3;
- (void)setPacketLifetimeVIBE:(int64_t)a3;
- (void)setPacketLossRateVIBE:(int64_t)a3;
- (void)setRequestStatus:(int)a3;
- (void)setStartTimestamp:(unint64_t)a3;
- (void)setTimeToFirstWord:(unint64_t)a3;
- (void)setTransportHistorys:(id)a3;
- (void)setUnderlyingErrorCode:(int)a3;
- (void)setUnderlyingErrorDomain:(int)a3;
- (void)setWifiCCA:(int64_t)a3;
- (void)setWifiRSSI:(int64_t)a3;
- (void)setWifiSNR:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSiriRequestRecord

- (void)dealloc
{
  [(AWDSiriRequestRecord *)self setTransportHistorys:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriRequestRecord;
  [(AWDSiriRequestRecord *)&v3 dealloc];
}

- (void)setStartTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasStartTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setEndTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_endTimestamp = a3;
}

- (void)setHasEndTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)requestStatus
{
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    return self->_requestStatus;
  }
  else {
    return 1;
  }
}

- (void)setRequestStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_requestStatus = a3;
}

- (void)setHasRequestStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasRequestStatus
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)requestStatusAsString:(int)a3
{
  if (a3 == 1) {
    return @"success";
  }
  if (a3 == 2) {
    return @"failure";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsRequestStatus:(id)a3
{
  int v4 = 1;
  if (([a3 isEqualToString:@"success"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"failure"]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v4;
}

- (int)errorDomain
{
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_errorDomain;
  }
  else {
    return 1;
  }
}

- (void)setErrorDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_errorDomain = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasErrorDomain
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)errorDomainAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA0B8[a3 - 1];
  }
}

- (int)StringAsErrorDomain:(id)a3
{
  if ([a3 isEqualToString:@"assistantErrorDomain"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"connectionErrorDomain"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"posixErrorDomain"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"peerErrorDomain"]) {
    return 4;
  }
  return 1;
}

- (void)setErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasErrorCode
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int)underlyingErrorDomain
{
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0) {
    return self->_underlyingErrorDomain;
  }
  else {
    return 1;
  }
}

- (void)setUnderlyingErrorDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_underlyingErrorDomain = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasUnderlyingErrorDomain
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)underlyingErrorDomainAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA0B8[a3 - 1];
  }
}

- (int)StringAsUnderlyingErrorDomain:(id)a3
{
  if ([a3 isEqualToString:@"assistantErrorDomain"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"connectionErrorDomain"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"posixErrorDomain"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"peerErrorDomain"]) {
    return 4;
  }
  return 1;
}

- (void)setUnderlyingErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_underlyingErrorCode = a3;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUnderlyingErrorCode
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setTimeToFirstWord:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_timeToFirstWord = a3;
}

- (void)setHasTimeToFirstWord:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTimeToFirstWord
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (int)iRATRecommendation
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_iRATRecommendation;
  }
  else {
    return 1;
  }
}

- (void)setIRATRecommendation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_iRATRecommendation = a3;
}

- (void)setHasIRATRecommendation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIRATRecommendation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)iRATRecommendationAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA0D8[a3 - 1];
  }
}

- (int)StringAsIRATRecommendation:(id)a3
{
  if ([a3 isEqualToString:@"None"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"WiFi"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"BT"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"Cellular"]) {
    return 4;
  }
  return 1;
}

- (void)setIRATRecommendationDelay:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_iRATRecommendationDelay = a3;
}

- (void)setHasIRATRecommendationDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasIRATRecommendationDelay
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)clearTransportHistorys
{
}

- (void)addTransportHistory:(id)a3
{
  transportHistorys = self->_transportHistorys;
  if (!transportHistorys)
  {
    transportHistorys = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_transportHistorys = transportHistorys;
  }

  [(NSMutableArray *)transportHistorys addObject:a3];
}

- (unint64_t)transportHistorysCount
{
  return [(NSMutableArray *)self->_transportHistorys count];
}

- (id)transportHistoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transportHistorys objectAtIndex:a3];
}

+ (Class)transportHistoryType
{
  return (Class)objc_opt_class();
}

- (void)setWifiRSSI:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_wifiRSSI = a3;
}

- (void)setHasWifiRSSI:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWifiRSSI
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setWifiSNR:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_wifiSNR = a3;
}

- (void)setHasWifiSNR:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWifiSNR
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setWifiCCA:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_wifiCCA = a3;
}

- (void)setHasWifiCCA:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWifiCCA
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBeaconPer:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_beaconPer = a3;
}

- (void)setHasBeaconPer:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasBeaconPer
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNwtype:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_nwtype = a3;
}

- (void)setHasNwtype:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasNwtype
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLsmRecommendationBe:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lsmRecommendationBe = a3;
}

- (void)setHasLsmRecommendationBe:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLsmRecommendationBe
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setExpectedThroughputVIBE:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_expectedThroughputVIBE = a3;
}

- (void)setHasExpectedThroughputVIBE:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasExpectedThroughputVIBE
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPacketLifetimeVIBE:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_packetLifetimeVIBE = a3;
}

- (void)setHasPacketLifetimeVIBE:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPacketLifetimeVIBE
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setPacketLossRateVIBE:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_packetLossRateVIBE = a3;
}

- (void)setHasPacketLossRateVIBE:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPacketLossRateVIBE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBtRssi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_btRssi = a3;
}

- (void)setHasBtRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBtRssi
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBtRetransmissionRateTx:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_btRetransmissionRateTx = a3;
}

- (void)setHasBtRetransmissionRateTx:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBtRetransmissionRateTx
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBtRetransmissionRateRx:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_btRetransmissionRateRx = a3;
}

- (void)setHasBtRetransmissionRateRx:(BOOL)a3
{
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBtRetransmissionRateRx
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBtTech:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_btTech = a3;
}

- (void)setHasBtTech:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBtTech
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIdsMessageDelay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_idsMessageDelay = a3;
}

- (void)setHasIdsMessageDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIdsMessageDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIdsSocketDelay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_idsSocketDelay = a3;
}

- (void)setHasIdsSocketDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIdsSocketDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIdsErrorCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_idsErrorCode = a3;
}

- (void)setHasIdsErrorCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2A32A32658D5DED0D08472A2A6A47882)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIdsErrorCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriRequestRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSiriRequestRecord description](&v3, sel_description), -[AWDSiriRequestRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_startTimestamp] forKey:@"startTimestamp"];
    $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endTimestamp] forKey:@"endTimestamp"];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_63;
  }
LABEL_41:
  int requestStatus = self->_requestStatus;
  if (requestStatus == 1)
  {
    v14 = @"success";
  }
  else if (requestStatus == 2)
  {
    v14 = @"failure";
  }
  else
  {
    v14 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_requestStatus];
  }
  [v3 setObject:v14 forKey:@"requestStatus"];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_67;
  }
LABEL_63:
  unsigned int v15 = self->_errorDomain - 1;
  if (v15 >= 4) {
    v16 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_errorDomain];
  }
  else {
    v16 = off_2641BA0B8[v15];
  }
  [v3 setObject:v16 forKey:@"errorDomain"];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithInt:self->_errorCode] forKey:@"errorCode"];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_72;
  }
LABEL_68:
  unsigned int v17 = self->_underlyingErrorDomain - 1;
  if (v17 >= 4) {
    v18 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_underlyingErrorDomain];
  }
  else {
    v18 = off_2641BA0B8[v17];
  }
  [v3 setObject:v18 forKey:@"underlyingErrorDomain"];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithInt:self->_underlyingErrorCode] forKey:@"underlyingErrorCode"];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeToFirstWord] forKey:@"timeToFirstWord"];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_74:
  unsigned int v19 = self->_iRATRecommendation - 1;
  if (v19 >= 4) {
    v20 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_iRATRecommendation];
  }
  else {
    v20 = off_2641BA0D8[v19];
  }
  [v3 setObject:v20 forKey:@"iRATRecommendation"];
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_iRATRecommendationDelay] forKey:@"iRATRecommendationDelay"];
LABEL_12:
  if ([(NSMutableArray *)self->_transportHistorys count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_transportHistorys, "count")];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    transportHistorys = self->_transportHistorys;
    uint64_t v7 = [(NSMutableArray *)transportHistorys countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(transportHistorys);
          }
          [v5 addObject:[(*(id *)(*((void *)&v21 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)transportHistorys countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"transportHistory"];
  }
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    [v3 setObject:[NSNumber numberWithLongLong:self->_wifiRSSI] forKey:@"wifiRSSI"];
    $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x4000) == 0)
    {
LABEL_23:
      if ((*(_WORD *)&v11 & 0x1000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
    goto LABEL_23;
  }
  [v3 setObject:[NSNumber numberWithLongLong:self->_wifiSNR] forKey:@"wifiSNR"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v11 & 0x8000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithLongLong:self->_wifiCCA] forKey:@"wifiCCA"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v11 & 0x400000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_beaconPer] forKey:@"beaconPer"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x400000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v11 & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nwtype] forKey:@"nwtype"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v11 & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithLongLong:self->_lsmRecommendationBe] forKey:@"lsmRecommendationBe"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v11 & 0x100) == 0) {
      goto LABEL_29;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithLongLong:self->_expectedThroughputVIBE] forKey:@"expectedThroughputVIBE"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v11 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithLongLong:self->_packetLifetimeVIBE] forKey:@"packetLifetimeVIBE"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v11 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithLongLong:self->_packetLossRateVIBE] forKey:@"packetLossRateVIBE"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v11 & 2) == 0) {
      goto LABEL_32;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_btRssi] forKey:@"btRssi"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 2) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v11 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithLongLong:self->_btRetransmissionRateTx] forKey:@"btRetransmissionRateTx"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 1) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v11 & 8) == 0) {
      goto LABEL_34;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithLongLong:self->_btRetransmissionRateRx] forKey:@"btRetransmissionRateRx"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 8) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v11 & 0x100000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithLongLong:self->_btTech] forKey:@"btTech"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x100000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v11 & 0x200000) == 0) {
      goto LABEL_36;
    }
LABEL_58:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_idsSocketDelay] forKey:@"idsSocketDelay"];
    if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
      return v3;
    }
    goto LABEL_37;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_idsMessageDelay] forKey:@"idsMessageDelay"];
  $2A32A32658D5DED0D08472A2A6A47882 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x200000) != 0) {
    goto LABEL_58;
  }
LABEL_36:
  if ((*(_DWORD *)&v11 & 0x80000) != 0) {
LABEL_37:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_idsErrorCode] forKey:@"idsErrorCode"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriRequestRecordReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint64Field();
LABEL_12:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  transportHistorys = self->_transportHistorys;
  uint64_t v6 = [(NSMutableArray *)transportHistorys countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(transportHistorys);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)transportHistorys countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x4000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v10 & 0x1000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v10 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v10 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v10 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v10 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v10 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v10 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 4) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v10 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 2) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v10 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 1) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v10 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt64Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v10 & 0x200000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  $2A32A32658D5DED0D08472A2A6A47882 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v10 & 0x80000) == 0) {
      return;
    }
    goto LABEL_35;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
    return;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((void *)a3 + 11) = self->_startTimestamp;
    *((_DWORD *)a3 + 46) |= 0x400u;
    $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 5) = self->_endTimestamp;
  *((_DWORD *)a3 + 46) |= 0x10u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 40) = self->_requestStatus;
  *((_DWORD *)a3 + 46) |= 0x800000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 34) = self->_errorDomain;
  *((_DWORD *)a3 + 46) |= 0x20000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 33) = self->_errorCode;
  *((_DWORD *)a3 + 46) |= 0x10000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 45) = self->_underlyingErrorDomain;
  *((_DWORD *)a3 + 46) |= 0x2000000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 44) = self->_underlyingErrorCode;
  *((_DWORD *)a3 + 46) |= 0x1000000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
LABEL_42:
    *((_DWORD *)a3 + 35) = self->_iRATRecommendation;
    *((_DWORD *)a3 + 46) |= 0x40000u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_41:
  *((void *)a3 + 12) = self->_timeToFirstWord;
  *((_DWORD *)a3 + 46) |= 0x800u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0) {
    goto LABEL_42;
  }
LABEL_10:
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_11:
    *((void *)a3 + 7) = self->_iRATRecommendationDelay;
    *((_DWORD *)a3 + 46) |= 0x40u;
  }
LABEL_12:
  if ([(AWDSiriRequestRecord *)self transportHistorysCount])
  {
    [a3 clearTransportHistorys];
    unint64_t v6 = [(AWDSiriRequestRecord *)self transportHistorysCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addTransportHistory:-[AWDSiriRequestRecord transportHistoryAtIndex:](self, "transportHistoryAtIndex:", i)];
    }
  }
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) != 0)
  {
    *((void *)a3 + 14) = self->_wifiRSSI;
    *((_DWORD *)a3 + 46) |= 0x2000u;
    $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x4000) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v9 & 0x1000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
    goto LABEL_18;
  }
  *((void *)a3 + 15) = self->_wifiSNR;
  *((_DWORD *)a3 + 46) |= 0x4000u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)a3 + 13) = self->_wifiCCA;
  *((_DWORD *)a3 + 46) |= 0x1000u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v9 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 32) = self->_beaconPer;
  *((_DWORD *)a3 + 46) |= 0x8000u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v9 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 39) = self->_nwtype;
  *((_DWORD *)a3 + 46) |= 0x400000u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x80) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v9 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)a3 + 8) = self->_lsmRecommendationBe;
  *((_DWORD *)a3 + 46) |= 0x80u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v9 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 6) = self->_expectedThroughputVIBE;
  *((_DWORD *)a3 + 46) |= 0x20u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v9 & 0x200) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 9) = self->_packetLifetimeVIBE;
  *((_DWORD *)a3 + 46) |= 0x100u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v9 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 10) = self->_packetLossRateVIBE;
  *((_DWORD *)a3 + 46) |= 0x200u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v9 & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 3) = self->_btRssi;
  *((_DWORD *)a3 + 46) |= 4u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 2) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v9 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 2) = self->_btRetransmissionRateTx;
  *((_DWORD *)a3 + 46) |= 2u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 1) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v9 & 8) == 0) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 1) = self->_btRetransmissionRateRx;
  *((_DWORD *)a3 + 46) |= 1u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 4) = self->_btTech;
  *((_DWORD *)a3 + 46) |= 8u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x200000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 37) = self->_idsMessageDelay;
  *((_DWORD *)a3 + 46) |= 0x100000u;
  $2A32A32658D5DED0D08472A2A6A47882 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v9 & 0x80000) == 0) {
      return;
    }
    goto LABEL_32;
  }
LABEL_58:
  *((_DWORD *)a3 + 38) = self->_idsSocketDelay;
  *((_DWORD *)a3 + 46) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
    return;
  }
LABEL_32:
  *((_DWORD *)a3 + 36) = self->_idsErrorCode;
  *((_DWORD *)a3 + 46) |= 0x80000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(void *)(v5 + 88) = self->_startTimestamp;
    *(_DWORD *)(v5 + 184) |= 0x400u;
    $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 40) = self->_endTimestamp;
  *(_DWORD *)(v5 + 184) |= 0x10u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 160) = self->_requestStatus;
  *(_DWORD *)(v5 + 184) |= 0x800000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 136) = self->_errorDomain;
  *(_DWORD *)(v5 + 184) |= 0x20000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 132) = self->_errorCode;
  *(_DWORD *)(v5 + 184) |= 0x10000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 180) = self->_underlyingErrorDomain;
  *(_DWORD *)(v5 + 184) |= 0x2000000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 176) = self->_underlyingErrorCode;
  *(_DWORD *)(v5 + 184) |= 0x1000000u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(void *)(v5 + 96) = self->_timeToFirstWord;
  *(_DWORD *)(v5 + 184) |= 0x800u;
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_45:
  *(_DWORD *)(v5 + 140) = self->_iRATRecommendation;
  *(_DWORD *)(v5 + 184) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    *(void *)(v5 + 56) = self->_iRATRecommendationDelay;
    *(_DWORD *)(v5 + 184) |= 0x40u;
  }
LABEL_12:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  transportHistorys = self->_transportHistorys;
  uint64_t v9 = [(NSMutableArray *)transportHistorys countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(transportHistorys);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addTransportHistory:v13];
      }
      uint64_t v10 = [(NSMutableArray *)transportHistorys countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    *(void *)(v6 + 112) = self->_wifiRSSI;
    *(_DWORD *)(v6 + 184) |= 0x2000u;
    $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x4000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x1000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  *(void *)(v6 + 120) = self->_wifiSNR;
  *(_DWORD *)(v6 + 184) |= 0x4000u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v14 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(void *)(v6 + 104) = self->_wifiCCA;
  *(_DWORD *)(v6 + 184) |= 0x1000u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v14 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v6 + 128) = self->_beaconPer;
  *(_DWORD *)(v6 + 184) |= 0x8000u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v14 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 156) = self->_nwtype;
  *(_DWORD *)(v6 + 184) |= 0x400000u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x80) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v14 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(void *)(v6 + 64) = self->_lsmRecommendationBe;
  *(_DWORD *)(v6 + 184) |= 0x80u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(void *)(v6 + 48) = self->_expectedThroughputVIBE;
  *(_DWORD *)(v6 + 184) |= 0x20u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v14 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(void *)(v6 + 72) = self->_packetLifetimeVIBE;
  *(_DWORD *)(v6 + 184) |= 0x100u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v14 & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(void *)(v6 + 80) = self->_packetLossRateVIBE;
  *(_DWORD *)(v6 + 184) |= 0x200u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 4) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v14 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(void *)(v6 + 24) = self->_btRssi;
  *(_DWORD *)(v6 + 184) |= 4u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 2) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v14 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(void *)(v6 + 16) = self->_btRetransmissionRateTx;
  *(_DWORD *)(v6 + 184) |= 2u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 1) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v14 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(void *)(v6 + 8) = self->_btRetransmissionRateRx;
  *(_DWORD *)(v6 + 184) |= 1u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v14 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(void *)(v6 + 32) = self->_btTech;
  *(_DWORD *)(v6 + 184) |= 8u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v14 & 0x200000) == 0) {
      goto LABEL_34;
    }
LABEL_61:
    *(_DWORD *)(v6 + 152) = self->_idsSocketDelay;
    *(_DWORD *)(v6 + 184) |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
      return (id)v6;
    }
    goto LABEL_35;
  }
LABEL_60:
  *(_DWORD *)(v6 + 148) = self->_idsMessageDelay;
  *(_DWORD *)(v6 + 184) |= 0x100000u;
  $2A32A32658D5DED0D08472A2A6A47882 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) != 0) {
    goto LABEL_61;
  }
LABEL_34:
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
LABEL_35:
    *(_DWORD *)(v6 + 144) = self->_idsErrorCode;
    *(_DWORD *)(v6 + 184) |= 0x80000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
    int v7 = *((_DWORD *)a3 + 46);
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_startTimestamp != *((void *)a3 + 11)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
LABEL_134:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_endTimestamp != *((void *)a3 + 5)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_requestStatus != *((_DWORD *)a3 + 40)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_errorDomain != *((_DWORD *)a3 + 34)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_errorCode != *((_DWORD *)a3 + 33)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_underlyingErrorDomain != *((_DWORD *)a3 + 45)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_underlyingErrorCode != *((_DWORD *)a3 + 44)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_timeToFirstWord != *((void *)a3 + 12)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_iRATRecommendation != *((_DWORD *)a3 + 35)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_iRATRecommendationDelay != *((void *)a3 + 7)) {
        goto LABEL_134;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_134;
    }
    transportHistorys = self->_transportHistorys;
    if ((unint64_t)transportHistorys | *((void *)a3 + 21))
    {
      int v5 = -[NSMutableArray isEqual:](transportHistorys, "isEqual:");
      if (!v5) {
        return v5;
      }
      $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
    }
    int v9 = *((_DWORD *)a3 + 46);
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v9 & 0x2000) == 0 || self->_wifiRSSI != *((void *)a3 + 14)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x2000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v9 & 0x4000) == 0 || self->_wifiSNR != *((void *)a3 + 15)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x4000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v9 & 0x1000) == 0 || self->_wifiCCA != *((void *)a3 + 13)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x1000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v9 & 0x8000) == 0 || self->_beaconPer != *((_DWORD *)a3 + 32)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x8000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v9 & 0x400000) == 0 || self->_nwtype != *((_DWORD *)a3 + 39)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x400000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_lsmRecommendationBe != *((void *)a3 + 8)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_134;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_expectedThroughputVIBE != *((void *)a3 + 6)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v9 & 0x100) == 0 || self->_packetLifetimeVIBE != *((void *)a3 + 9)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x100) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v9 & 0x200) == 0 || self->_packetLossRateVIBE != *((void *)a3 + 10)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x200) != 0)
    {
      goto LABEL_134;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_btRssi != *((void *)a3 + 3)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 4) != 0)
    {
      goto LABEL_134;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_btRetransmissionRateTx != *((void *)a3 + 2)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_134;
    }
    if (*(unsigned char *)&has)
    {
      if ((v9 & 1) == 0 || self->_btRetransmissionRateRx != *((void *)a3 + 1)) {
        goto LABEL_134;
      }
    }
    else if (v9)
    {
      goto LABEL_134;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_btTech != *((void *)a3 + 4)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v9 & 0x100000) == 0 || self->_idsMessageDelay != *((_DWORD *)a3 + 37)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x100000) != 0)
    {
      goto LABEL_134;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v9 & 0x200000) == 0 || self->_idsSocketDelay != *((_DWORD *)a3 + 38)) {
        goto LABEL_134;
      }
    }
    else if ((v9 & 0x200000) != 0)
    {
      goto LABEL_134;
    }
    LOBYTE(v5) = (v9 & 0x80000) == 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v9 & 0x80000) == 0 || self->_idsErrorCode != *((_DWORD *)a3 + 36)) {
        goto LABEL_134;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $2A32A32658D5DED0D08472A2A6A47882 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    unint64_t v32 = 2654435761u * self->_startTimestamp;
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
LABEL_3:
      unint64_t v31 = 2654435761u * self->_endTimestamp;
      if ((*(_DWORD *)&has & 0x800000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v32 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_4:
    uint64_t v30 = 2654435761 * self->_requestStatus;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_errorDomain;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_errorCode;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_underlyingErrorDomain;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_8:
    uint64_t v7 = 2654435761 * self->_underlyingErrorCode;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_9:
    unint64_t v8 = 2654435761u * self->_timeToFirstWord;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  unint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_iRATRecommendation;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_11:
    unint64_t v10 = 2654435761u * self->_iRATRecommendationDelay;
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v10 = 0;
LABEL_22:
  uint64_t v11 = [(NSMutableArray *)self->_transportHistorys hash];
  $2A32A32658D5DED0D08472A2A6A47882 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_wifiRSSI;
    if ((*(_WORD *)&v12 & 0x4000) != 0)
    {
LABEL_24:
      uint64_t v14 = 2654435761 * self->_wifiSNR;
      if ((*(_WORD *)&v12 & 0x1000) != 0) {
        goto LABEL_25;
      }
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&v12 & 0x4000) != 0) {
      goto LABEL_24;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
LABEL_25:
    uint64_t v15 = 2654435761 * self->_wifiCCA;
    if ((*(_WORD *)&v12 & 0x8000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v15 = 0;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
LABEL_26:
    uint64_t v16 = 2654435761 * self->_beaconPer;
    if ((*(_DWORD *)&v12 & 0x400000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v12 & 0x400000) != 0)
  {
LABEL_27:
    uint64_t v17 = 2654435761 * self->_nwtype;
    if ((*(unsigned char *)&v12 & 0x80) != 0) {
      goto LABEL_28;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
LABEL_28:
    uint64_t v18 = 2654435761 * self->_lsmRecommendationBe;
    if ((*(unsigned char *)&v12 & 0x20) != 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
LABEL_29:
    uint64_t v19 = 2654435761 * self->_expectedThroughputVIBE;
    if ((*(_WORD *)&v12 & 0x100) != 0) {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v19 = 0;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
LABEL_30:
    uint64_t v20 = 2654435761 * self->_packetLifetimeVIBE;
    if ((*(_WORD *)&v12 & 0x200) != 0) {
      goto LABEL_31;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v20 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_31:
    uint64_t v21 = 2654435761 * self->_packetLossRateVIBE;
    if ((*(unsigned char *)&v12 & 4) != 0) {
      goto LABEL_32;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&v12 & 4) != 0)
  {
LABEL_32:
    unint64_t v22 = 2654435761u * self->_btRssi;
    if ((*(unsigned char *)&v12 & 2) != 0) {
      goto LABEL_33;
    }
    goto LABEL_49;
  }
LABEL_48:
  unint64_t v22 = 0;
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
LABEL_33:
    uint64_t v23 = 2654435761 * self->_btRetransmissionRateTx;
    if (*(unsigned char *)&v12) {
      goto LABEL_34;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v23 = 0;
  if (*(unsigned char *)&v12)
  {
LABEL_34:
    uint64_t v24 = 2654435761 * self->_btRetransmissionRateRx;
    if ((*(unsigned char *)&v12 & 8) != 0) {
      goto LABEL_35;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v24 = 0;
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
LABEL_35:
    uint64_t v25 = 2654435761 * self->_btTech;
    if ((*(_DWORD *)&v12 & 0x100000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_36:
    uint64_t v26 = 2654435761 * self->_idsMessageDelay;
    if ((*(_DWORD *)&v12 & 0x200000) != 0) {
      goto LABEL_37;
    }
LABEL_53:
    uint64_t v27 = 0;
    if ((*(_DWORD *)&v12 & 0x80000) != 0) {
      goto LABEL_38;
    }
LABEL_54:
    uint64_t v28 = 0;
    return v31 ^ v32 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_52:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) == 0) {
    goto LABEL_53;
  }
LABEL_37:
  uint64_t v27 = 2654435761 * self->_idsSocketDelay;
  if ((*(_DWORD *)&v12 & 0x80000) == 0) {
    goto LABEL_54;
  }
LABEL_38:
  uint64_t v28 = 2654435761 * self->_idsErrorCode;
  return v31 ^ v32 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x400) != 0)
  {
    self->_startTimestamp = *((void *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
    int v5 = *((_DWORD *)a3 + 46);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_endTimestamp = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x800000) == 0)
  {
LABEL_4:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_int requestStatus = *((_DWORD *)a3 + 40);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x20000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_errorDomain = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x10000) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_errorCode = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_underlyingErrorDomain = *((_DWORD *)a3 + 45);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_underlyingErrorCode = *((_DWORD *)a3 + 44);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_timeToFirstWord = *((void *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 46);
  if ((v5 & 0x40000) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_45:
  self->_iRATRecommendation = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 46) & 0x40) != 0)
  {
LABEL_11:
    self->_iRATRecommendationDelay = *((void *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_12:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 21);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDSiriRequestRecord *)self addTransportHistory:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x2000) != 0)
  {
    self->_wifiRSSI = *((void *)a3 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v11 = *((_DWORD *)a3 + 46);
    if ((v11 & 0x4000) == 0)
    {
LABEL_21:
      if ((v11 & 0x1000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
  }
  else if ((v11 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  self->_wifiSNR = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x1000) == 0)
  {
LABEL_22:
    if ((v11 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_wifiCCA = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x8000) == 0)
  {
LABEL_23:
    if ((v11 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_beaconPer = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x400000) == 0)
  {
LABEL_24:
    if ((v11 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_nwtype = *((_DWORD *)a3 + 39);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x80) == 0)
  {
LABEL_25:
    if ((v11 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_lsmRecommendationBe = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x20) == 0)
  {
LABEL_26:
    if ((v11 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_expectedThroughputVIBE = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x100) == 0)
  {
LABEL_27:
    if ((v11 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_packetLifetimeVIBE = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x200) == 0)
  {
LABEL_28:
    if ((v11 & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_packetLossRateVIBE = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 4) == 0)
  {
LABEL_29:
    if ((v11 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_btRssuint64_t i = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 2) == 0)
  {
LABEL_30:
    if ((v11 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_btRetransmissionRateTx = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 1) == 0)
  {
LABEL_31:
    if ((v11 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_btRetransmissionRateRx = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 8) == 0)
  {
LABEL_32:
    if ((v11 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_btTech = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x100000) == 0)
  {
LABEL_33:
    if ((v11 & 0x200000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_idsMessageDelay = *((_DWORD *)a3 + 37);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v11 = *((_DWORD *)a3 + 46);
  if ((v11 & 0x200000) == 0)
  {
LABEL_34:
    if ((v11 & 0x80000) == 0) {
      return;
    }
    goto LABEL_35;
  }
LABEL_61:
  self->_idsSocketDelay = *((_DWORD *)a3 + 38);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 46) & 0x80000) == 0) {
    return;
  }
LABEL_35:
  self->_idsErrorCode = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x80000u;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (unint64_t)timeToFirstWord
{
  return self->_timeToFirstWord;
}

- (unint64_t)iRATRecommendationDelay
{
  return self->_iRATRecommendationDelay;
}

- (NSMutableArray)transportHistorys
{
  return self->_transportHistorys;
}

- (void)setTransportHistorys:(id)a3
{
}

- (int64_t)wifiRSSI
{
  return self->_wifiRSSI;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (int64_t)wifiCCA
{
  return self->_wifiCCA;
}

- (unsigned)beaconPer
{
  return self->_beaconPer;
}

- (unsigned)nwtype
{
  return self->_nwtype;
}

- (int64_t)lsmRecommendationBe
{
  return self->_lsmRecommendationBe;
}

- (int64_t)expectedThroughputVIBE
{
  return self->_expectedThroughputVIBE;
}

- (int64_t)packetLifetimeVIBE
{
  return self->_packetLifetimeVIBE;
}

- (int64_t)packetLossRateVIBE
{
  return self->_packetLossRateVIBE;
}

- (unint64_t)btRssi
{
  return self->_btRssi;
}

- (int64_t)btRetransmissionRateTx
{
  return self->_btRetransmissionRateTx;
}

- (int64_t)btRetransmissionRateRx
{
  return self->_btRetransmissionRateRx;
}

- (int64_t)btTech
{
  return self->_btTech;
}

- (unsigned)idsMessageDelay
{
  return self->_idsMessageDelay;
}

- (unsigned)idsSocketDelay
{
  return self->_idsSocketDelay;
}

- (unsigned)idsErrorCode
{
  return self->_idsErrorCode;
}

@end