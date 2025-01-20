@interface WiFiAnalyticsAWDWiFiConnectionQuality
+ (Class)additionalUniqueIDsType;
+ (Class)otherUniqueIDsType;
- (BOOL)hasAssocReason;
- (BOOL)hasAssociatedTime;
- (BOOL)hasBand;
- (BOOL)hasBytesInActive;
- (BOOL)hasBytesInTotal;
- (BOOL)hasBytesOutActive;
- (BOOL)hasBytesOutTotal;
- (BOOL)hasCaptiveFlag;
- (BOOL)hasCca;
- (BOOL)hasChannel;
- (BOOL)hasChannelWidth;
- (BOOL)hasColocatedState;
- (BOOL)hasDataStalls;
- (BOOL)hasDisassocReason;
- (BOOL)hasFailedConnections;
- (BOOL)hasFaultyStay;
- (BOOL)hasHotspot20;
- (BOOL)hasLat;
- (BOOL)hasLon;
- (BOOL)hasLowLQMStay;
- (BOOL)hasLowqStay;
- (BOOL)hasLqmTranCount;
- (BOOL)hasOverAllStay;
- (BOOL)hasPacketsIn;
- (BOOL)hasPacketsOut;
- (BOOL)hasPhyMode;
- (BOOL)hasReTxBytes;
- (BOOL)hasReceivedDupes;
- (BOOL)hasRoundTripTimeAvg;
- (BOOL)hasRoundTripTimeAvgActive;
- (BOOL)hasRoundTripTimeMin;
- (BOOL)hasRoundTripTimeMinActive;
- (BOOL)hasRoundTripTimeVar;
- (BOOL)hasRoundTripTimeVarActive;
- (BOOL)hasRssi;
- (BOOL)hasRxOutOfOrderBytes;
- (BOOL)hasSecurityType;
- (BOOL)hasSnr;
- (BOOL)hasSuccessfulConnections;
- (BOOL)hasTimeOfDay;
- (BOOL)hasTimestamp;
- (BOOL)hasUniqueID;
- (BOOL)hotspot20;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)additionalUniqueIDs;
- (NSMutableArray)otherUniqueIDs;
- (NSString)uniqueID;
- (double)lat;
- (double)lon;
- (float)roundTripTimeAvg;
- (float)roundTripTimeAvgActive;
- (float)roundTripTimeMin;
- (float)roundTripTimeMinActive;
- (float)roundTripTimeVar;
- (float)roundTripTimeVarActive;
- (id)additionalUniqueIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)otherUniqueIDsAtIndex:(unint64_t)a3;
- (int)cca;
- (int)rssi;
- (int)snr;
- (unint64_t)additionalUniqueIDsCount;
- (unint64_t)bytesInActive;
- (unint64_t)bytesInTotal;
- (unint64_t)bytesOutActive;
- (unint64_t)bytesOutTotal;
- (unint64_t)dataStalls;
- (unint64_t)failedConnections;
- (unint64_t)faultyStay;
- (unint64_t)hash;
- (unint64_t)lowLQMStay;
- (unint64_t)lowqStay;
- (unint64_t)lqmTranCount;
- (unint64_t)otherUniqueIDsCount;
- (unint64_t)overAllStay;
- (unint64_t)packetsIn;
- (unint64_t)packetsOut;
- (unint64_t)reTxBytes;
- (unint64_t)receivedDupes;
- (unint64_t)rxOutOfOrderBytes;
- (unint64_t)successfulConnections;
- (unint64_t)timeOfDay;
- (unint64_t)timestamp;
- (unsigned)assocReason;
- (unsigned)associatedTime;
- (unsigned)band;
- (unsigned)captiveFlag;
- (unsigned)channel;
- (unsigned)channelWidth;
- (unsigned)colocatedState;
- (unsigned)disassocReason;
- (unsigned)phyMode;
- (unsigned)securityType;
- (void)addAdditionalUniqueIDs:(id)a3;
- (void)addOtherUniqueIDs:(id)a3;
- (void)clearAdditionalUniqueIDs;
- (void)clearOtherUniqueIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdditionalUniqueIDs:(id)a3;
- (void)setAssocReason:(unsigned int)a3;
- (void)setAssociatedTime:(unsigned int)a3;
- (void)setBand:(unsigned int)a3;
- (void)setBytesInActive:(unint64_t)a3;
- (void)setBytesInTotal:(unint64_t)a3;
- (void)setBytesOutActive:(unint64_t)a3;
- (void)setBytesOutTotal:(unint64_t)a3;
- (void)setCaptiveFlag:(unsigned int)a3;
- (void)setCca:(int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setChannelWidth:(unsigned int)a3;
- (void)setColocatedState:(unsigned int)a3;
- (void)setDataStalls:(unint64_t)a3;
- (void)setDisassocReason:(unsigned int)a3;
- (void)setFailedConnections:(unint64_t)a3;
- (void)setFaultyStay:(unint64_t)a3;
- (void)setHasAssocReason:(BOOL)a3;
- (void)setHasAssociatedTime:(BOOL)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasBytesInActive:(BOOL)a3;
- (void)setHasBytesInTotal:(BOOL)a3;
- (void)setHasBytesOutActive:(BOOL)a3;
- (void)setHasBytesOutTotal:(BOOL)a3;
- (void)setHasCaptiveFlag:(BOOL)a3;
- (void)setHasCca:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasChannelWidth:(BOOL)a3;
- (void)setHasColocatedState:(BOOL)a3;
- (void)setHasDataStalls:(BOOL)a3;
- (void)setHasDisassocReason:(BOOL)a3;
- (void)setHasFailedConnections:(BOOL)a3;
- (void)setHasFaultyStay:(BOOL)a3;
- (void)setHasHotspot20:(BOOL)a3;
- (void)setHasLat:(BOOL)a3;
- (void)setHasLon:(BOOL)a3;
- (void)setHasLowLQMStay:(BOOL)a3;
- (void)setHasLowqStay:(BOOL)a3;
- (void)setHasLqmTranCount:(BOOL)a3;
- (void)setHasOverAllStay:(BOOL)a3;
- (void)setHasPacketsIn:(BOOL)a3;
- (void)setHasPacketsOut:(BOOL)a3;
- (void)setHasPhyMode:(BOOL)a3;
- (void)setHasReTxBytes:(BOOL)a3;
- (void)setHasReceivedDupes:(BOOL)a3;
- (void)setHasRoundTripTimeAvg:(BOOL)a3;
- (void)setHasRoundTripTimeAvgActive:(BOOL)a3;
- (void)setHasRoundTripTimeMin:(BOOL)a3;
- (void)setHasRoundTripTimeMinActive:(BOOL)a3;
- (void)setHasRoundTripTimeVar:(BOOL)a3;
- (void)setHasRoundTripTimeVarActive:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasRxOutOfOrderBytes:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasSnr:(BOOL)a3;
- (void)setHasSuccessfulConnections:(BOOL)a3;
- (void)setHasTimeOfDay:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHotspot20:(BOOL)a3;
- (void)setLat:(double)a3;
- (void)setLon:(double)a3;
- (void)setLowLQMStay:(unint64_t)a3;
- (void)setLowqStay:(unint64_t)a3;
- (void)setLqmTranCount:(unint64_t)a3;
- (void)setOtherUniqueIDs:(id)a3;
- (void)setOverAllStay:(unint64_t)a3;
- (void)setPacketsIn:(unint64_t)a3;
- (void)setPacketsOut:(unint64_t)a3;
- (void)setPhyMode:(unsigned int)a3;
- (void)setReTxBytes:(unint64_t)a3;
- (void)setReceivedDupes:(unint64_t)a3;
- (void)setRoundTripTimeAvg:(float)a3;
- (void)setRoundTripTimeAvgActive:(float)a3;
- (void)setRoundTripTimeMin:(float)a3;
- (void)setRoundTripTimeMinActive:(float)a3;
- (void)setRoundTripTimeVar:(float)a3;
- (void)setRoundTripTimeVarActive:(float)a3;
- (void)setRssi:(int)a3;
- (void)setRxOutOfOrderBytes:(unint64_t)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setSnr:(int)a3;
- (void)setSuccessfulConnections:(unint64_t)a3;
- (void)setTimeOfDay:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiConnectionQuality

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)clearAdditionalUniqueIDs
{
}

- (void)addAdditionalUniqueIDs:(id)a3
{
  id v4 = a3;
  additionalUniqueIDs = self->_additionalUniqueIDs;
  id v8 = v4;
  if (!additionalUniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_additionalUniqueIDs;
    self->_additionalUniqueIDs = v6;

    id v4 = v8;
    additionalUniqueIDs = self->_additionalUniqueIDs;
  }
  [(NSMutableArray *)additionalUniqueIDs addObject:v4];
}

- (unint64_t)additionalUniqueIDsCount
{
  return [(NSMutableArray *)self->_additionalUniqueIDs count];
}

- (id)additionalUniqueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_additionalUniqueIDs objectAtIndex:a3];
}

+ (Class)additionalUniqueIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearOtherUniqueIDs
{
}

- (void)addOtherUniqueIDs:(id)a3
{
  id v4 = a3;
  otherUniqueIDs = self->_otherUniqueIDs;
  id v8 = v4;
  if (!otherUniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_otherUniqueIDs;
    self->_otherUniqueIDs = v6;

    id v4 = v8;
    otherUniqueIDs = self->_otherUniqueIDs;
  }
  [(NSMutableArray *)otherUniqueIDs addObject:v4];
}

- (unint64_t)otherUniqueIDsCount
{
  return [(NSMutableArray *)self->_otherUniqueIDs count];
}

- (id)otherUniqueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_otherUniqueIDs objectAtIndex:a3];
}

+ (Class)otherUniqueIDsType
{
  return (Class)objc_opt_class();
}

- (void)setLat:(double)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_lat = a3;
}

- (void)setHasLat:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasLat
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setLon:(double)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_lon = a3;
}

- (void)setHasLon:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasLon
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setOverAllStay:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_overAllStay = a3;
}

- (void)setHasOverAllStay:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasOverAllStay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFaultyStay:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_faultyStay = a3;
}

- (void)setHasFaultyStay:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasFaultyStay
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setLowLQMStay:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_lowLQMStay = a3;
}

- (void)setHasLowLQMStay:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasLowLQMStay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLowqStay:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_lowqStay = a3;
}

- (void)setHasLowqStay:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasLowqStay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLqmTranCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_lqmTranCount = a3;
}

- (void)setHasLqmTranCount:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasLqmTranCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSuccessfulConnections:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_successfulConnections = a3;
}

- (void)setHasSuccessfulConnections:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSuccessfulConnections
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setFailedConnections:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_failedConnections = a3;
}

- (void)setHasFailedConnections:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasFailedConnections
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPacketsIn:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_packetsIn = a3;
}

- (void)setHasPacketsIn:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasPacketsIn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPacketsOut:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_packetsOut = a3;
}

- (void)setHasPacketsOut:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPacketsOut
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBytesInTotal:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_bytesInTotal = a3;
}

- (void)setHasBytesInTotal:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBytesInTotal
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBytesOutTotal:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_bytesOutTotal = a3;
}

- (void)setHasBytesOutTotal:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBytesOutTotal
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBytesInActive:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_bytesInActive = a3;
}

- (void)setHasBytesInActive:(BOOL)a3
{
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasBytesInActive
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBytesOutActive:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_bytesOutActive = a3;
}

- (void)setHasBytesOutActive:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBytesOutActive
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReTxBytes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_reTxBytes = a3;
}

- (void)setHasReTxBytes:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasReTxBytes
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDataStalls:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_dataStalls = a3;
}

- (void)setHasDataStalls:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDataStalls
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setReceivedDupes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_receivedDupes = a3;
}

- (void)setHasReceivedDupes:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasReceivedDupes
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRxOutOfOrderBytes:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_rxOutOfOrderBytes = a3;
}

- (void)setHasRxOutOfOrderBytes:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasRxOutOfOrderBytes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoundTripTimeMin:(float)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_roundTripTimeMin = a3;
}

- (void)setHasRoundTripTimeMin:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeMin
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setRoundTripTimeAvg:(float)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_roundTripTimeAvg = a3;
}

- (void)setHasRoundTripTimeAvg:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeAvg
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setRoundTripTimeVar:(float)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_roundTripTimeVar = a3;
}

- (void)setHasRoundTripTimeVar:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeVar
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setRoundTripTimeMinActive:(float)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_roundTripTimeMinActive = a3;
}

- (void)setHasRoundTripTimeMinActive:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeMinActive
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setRoundTripTimeAvgActive:(float)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_roundTripTimeAvgActive = a3;
}

- (void)setHasRoundTripTimeAvgActive:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeAvgActive
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setRoundTripTimeVarActive:(float)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_roundTripTimeVarActive = a3;
}

- (void)setHasRoundTripTimeVarActive:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasRoundTripTimeVarActive
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setCaptiveFlag:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_captiveFlag = a3;
}

- (void)setHasCaptiveFlag:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasCaptiveFlag
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setColocatedState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_colocatedState = a3;
}

- (void)setHasColocatedState:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasColocatedState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHotspot20:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_hotspot20 = a3;
}

- (void)setHasHotspot20:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasHotspot20
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setDisassocReason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_disassocReason = a3;
}

- (void)setHasDisassocReason:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasDisassocReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setAssocReason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_assocReason = a3;
}

- (void)setHasAssocReason:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasAssocReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setBand:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasBand
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setChannel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasChannelWidth
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setRssi:(int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasRssi
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setSnr:(int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasSnr
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCca:(int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasCca
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setPhyMode:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasTimeOfDay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAssociatedTime:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_associatedTime = a3;
}

- (void)setHasAssociatedTime:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($6D1F4AE12A053AA933BF826E67DD671F)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasAssociatedTime
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiConnectionQuality;
  id v4 = [(WiFiAnalyticsAWDWiFiConnectionQuality *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiConnectionQuality *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v3 setObject:uniqueID forKey:@"uniqueID"];
  }
  additionalUniqueIDs = self->_additionalUniqueIDs;
  if (additionalUniqueIDs) {
    [v3 setObject:additionalUniqueIDs forKey:@"additionalUniqueIDs"];
  }
  otherUniqueIDs = self->_otherUniqueIDs;
  if (otherUniqueIDs) {
    [v3 setObject:otherUniqueIDs forKey:@"otherUniqueIDs"];
  }
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v13 = [NSNumber numberWithDouble:self->_lat];
    [v3 setObject:v13 forKey:@"lat"];

    $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  v14 = [NSNumber numberWithDouble:self->_lon];
  [v3 setObject:v14 forKey:@"lon"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_54;
  }
LABEL_53:
  v15 = [NSNumber numberWithUnsignedLongLong:self->_overAllStay];
  [v3 setObject:v15 forKey:@"overAllStay"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_55;
  }
LABEL_54:
  v16 = [NSNumber numberWithUnsignedLongLong:self->_faultyStay];
  [v3 setObject:v16 forKey:@"faultyStay"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_56;
  }
LABEL_55:
  v17 = [NSNumber numberWithUnsignedLongLong:self->_lowLQMStay];
  [v3 setObject:v17 forKey:@"lowLQMStay"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_57;
  }
LABEL_56:
  v18 = [NSNumber numberWithUnsignedLongLong:self->_lowqStay];
  [v3 setObject:v18 forKey:@"lowqStay"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_58;
  }
LABEL_57:
  v19 = [NSNumber numberWithUnsignedLongLong:self->_lqmTranCount];
  [v3 setObject:v19 forKey:@"lqmTranCount"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_59;
  }
LABEL_58:
  v20 = [NSNumber numberWithUnsignedLongLong:self->_successfulConnections];
  [v3 setObject:v20 forKey:@"successfulConnections"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_60;
  }
LABEL_59:
  v21 = [NSNumber numberWithUnsignedLongLong:self->_failedConnections];
  [v3 setObject:v21 forKey:@"failedConnections"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_61;
  }
LABEL_60:
  v22 = [NSNumber numberWithUnsignedLongLong:self->_packetsIn];
  [v3 setObject:v22 forKey:@"packetsIn"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_21;
    }
    goto LABEL_62;
  }
LABEL_61:
  v23 = [NSNumber numberWithUnsignedLongLong:self->_packetsOut];
  [v3 setObject:v23 forKey:@"packetsOut"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_63;
  }
LABEL_62:
  v24 = [NSNumber numberWithUnsignedLongLong:self->_bytesInTotal];
  [v3 setObject:v24 forKey:@"bytesInTotal"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_64;
  }
LABEL_63:
  v25 = [NSNumber numberWithUnsignedLongLong:self->_bytesOutTotal];
  [v3 setObject:v25 forKey:@"bytesOutTotal"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_65;
  }
LABEL_64:
  v26 = [NSNumber numberWithUnsignedLongLong:self->_bytesInActive];
  [v3 setObject:v26 forKey:@"bytesInActive"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_66;
  }
LABEL_65:
  v27 = [NSNumber numberWithUnsignedLongLong:self->_bytesOutActive];
  [v3 setObject:v27 forKey:@"bytesOutActive"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_67;
  }
LABEL_66:
  v28 = [NSNumber numberWithUnsignedLongLong:self->_reTxBytes];
  [v3 setObject:v28 forKey:@"reTxBytes"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_68;
  }
LABEL_67:
  v29 = [NSNumber numberWithUnsignedLongLong:self->_dataStalls];
  [v3 setObject:v29 forKey:@"dataStalls"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_69;
  }
LABEL_68:
  v30 = [NSNumber numberWithUnsignedLongLong:self->_receivedDupes];
  [v3 setObject:v30 forKey:@"receivedDupes"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_70;
  }
LABEL_69:
  v31 = [NSNumber numberWithUnsignedLongLong:self->_rxOutOfOrderBytes];
  [v3 setObject:v31 forKey:@"rxOutOfOrderBytes"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(float *)&double v4 = self->_roundTripTimeMin;
  v32 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v32 forKey:@"roundTripTimeMin"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(float *)&double v4 = self->_roundTripTimeAvg;
  v33 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v33 forKey:@"roundTripTimeAvg"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(float *)&double v4 = self->_roundTripTimeVar;
  v34 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v34 forKey:@"roundTripTimeVar"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(float *)&double v4 = self->_roundTripTimeMinActive;
  v35 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v35 forKey:@"roundTripTimeMinActive"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(float *)&double v4 = self->_roundTripTimeAvgActive;
  v36 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v36 forKey:@"roundTripTimeAvgActive"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(float *)&double v4 = self->_roundTripTimeVarActive;
  v37 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v37 forKey:@"roundTripTimeVarActive"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_77;
  }
LABEL_76:
  v38 = [NSNumber numberWithUnsignedInt:self->_securityType];
  [v3 setObject:v38 forKey:@"securityType"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_78;
  }
LABEL_77:
  v39 = [NSNumber numberWithUnsignedInt:self->_captiveFlag];
  [v3 setObject:v39 forKey:@"captiveFlag"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_79;
  }
LABEL_78:
  v40 = [NSNumber numberWithUnsignedInt:self->_colocatedState];
  [v3 setObject:v40 forKey:@"colocatedState"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_80;
  }
LABEL_79:
  v41 = [NSNumber numberWithBool:self->_hotspot20];
  [v3 setObject:v41 forKey:@"hotspot20"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_81;
  }
LABEL_80:
  v42 = [NSNumber numberWithUnsignedInt:self->_disassocReason];
  [v3 setObject:v42 forKey:@"disassocReason"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_82;
  }
LABEL_81:
  v43 = [NSNumber numberWithUnsignedInt:self->_assocReason];
  [v3 setObject:v43 forKey:@"assocReason"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_83;
  }
LABEL_82:
  v44 = [NSNumber numberWithUnsignedInt:self->_band];
  [v3 setObject:v44 forKey:@"band"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_84;
  }
LABEL_83:
  v45 = [NSNumber numberWithUnsignedInt:self->_channel];
  [v3 setObject:v45 forKey:@"channel"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_85;
  }
LABEL_84:
  v46 = [NSNumber numberWithUnsignedInt:self->_channelWidth];
  [v3 setObject:v46 forKey:@"channelWidth"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_86;
  }
LABEL_85:
  v47 = [NSNumber numberWithInt:self->_rssi];
  [v3 setObject:v47 forKey:@"rssi"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_87;
  }
LABEL_86:
  v48 = [NSNumber numberWithInt:self->_snr];
  [v3 setObject:v48 forKey:@"snr"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_88;
  }
LABEL_87:
  v49 = [NSNumber numberWithInt:self->_cca];
  [v3 setObject:v49 forKey:@"cca"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_48;
    }
LABEL_89:
    v51 = [NSNumber numberWithUnsignedLongLong:self->_timeOfDay];
    [v3 setObject:v51 forKey:@"timeOfDay"];

    if ((*(void *)&self->_has & 0x400000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_88:
  v50 = [NSNumber numberWithUnsignedInt:self->_phyMode];
  [v3 setObject:v50 forKey:@"phyMode"];

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_89;
  }
LABEL_48:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_49:
    v10 = [NSNumber numberWithUnsignedInt:self->_associatedTime];
    [v3 setObject:v10 forKey:@"associatedTime"];
  }
LABEL_50:
  id v11 = v3;

  return v11;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiConnectionQualityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_additionalUniqueIDs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_otherUniqueIDs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteDoubleField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteFloatField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteFloatField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteFloatField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteFloatField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteFloatField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteFloatField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_53:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_54:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_58;
    }
LABEL_99:
    PBDataWriterWriteUint64Field();
    if ((*(void *)&self->_has & 0x400000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_99;
  }
LABEL_58:
  if ((*(_DWORD *)&has & 0x400000) != 0) {
LABEL_59:
  }
    PBDataWriterWriteUint32Field();
LABEL_60:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    v4[21] = self->_timestamp;
    *(void *)((char *)v4 + 284) |= 0x100000uLL;
  }
  uint64_t v14 = (char *)v4;
  if (self->_uniqueID) {
    objc_msgSend(v4, "setUniqueID:");
  }
  if ([(WiFiAnalyticsAWDWiFiConnectionQuality *)self additionalUniqueIDsCount])
  {
    [v14 clearAdditionalUniqueIDs];
    unint64_t v5 = [(WiFiAnalyticsAWDWiFiConnectionQuality *)self additionalUniqueIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(WiFiAnalyticsAWDWiFiConnectionQuality *)self additionalUniqueIDsAtIndex:i];
        [v14 addAdditionalUniqueIDs:v8];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiConnectionQuality *)self otherUniqueIDsCount])
  {
    [v14 clearOtherUniqueIDs];
    unint64_t v9 = [(WiFiAnalyticsAWDWiFiConnectionQuality *)self otherUniqueIDsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(WiFiAnalyticsAWDWiFiConnectionQuality *)self otherUniqueIDsAtIndex:j];
        [v14 addOtherUniqueIDs:v12];
      }
    }
  }
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *((void *)v14 + 8) = *(void *)&self->_lat;
    *(void *)(v14 + 284) |= 0x80uLL;
    $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v14 + 9) = *(void *)&self->_lon;
  *(void *)(v14 + 284) |= 0x100uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)v14 + 13) = self->_overAllStay;
  *(void *)(v14 + 284) |= 0x1000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)v14 + 7) = self->_faultyStay;
  *(void *)(v14 + 284) |= 0x40uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)v14 + 10) = self->_lowLQMStay;
  *(void *)(v14 + 284) |= 0x200uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)v14 + 11) = self->_lowqStay;
  *(void *)(v14 + 284) |= 0x400uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)v14 + 12) = self->_lqmTranCount;
  *(void *)(v14 + 284) |= 0x800uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)v14 + 19) = self->_successfulConnections;
  *(void *)(v14 + 284) |= 0x40000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)v14 + 6) = self->_failedConnections;
  *(void *)(v14 + 284) |= 0x20uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)v14 + 14) = self->_packetsIn;
  *(void *)(v14 + 284) |= 0x2000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)v14 + 15) = self->_packetsOut;
  *(void *)(v14 + 284) |= 0x4000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)v14 + 2) = self->_bytesInTotal;
  *(void *)(v14 + 284) |= 2uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)v14 + 4) = self->_bytesOutTotal;
  *(void *)(v14 + 284) |= 8uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)v14 + 1) = self->_bytesInActive;
  *(void *)(v14 + 284) |= 1uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)v14 + 3) = self->_bytesOutActive;
  *(void *)(v14 + 284) |= 4uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)v14 + 16) = self->_reTxBytes;
  *(void *)(v14 + 284) |= 0x8000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)v14 + 5) = self->_dataStalls;
  *(void *)(v14 + 284) |= 0x10uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)v14 + 17) = self->_receivedDupes;
  *(void *)(v14 + 284) |= 0x10000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)v14 + 18) = self->_rxOutOfOrderBytes;
  *(void *)(v14 + 284) |= 0x20000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)v14 + 61) = LODWORD(self->_roundTripTimeMin);
  *(void *)(v14 + 284) |= 0x200000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)v14 + 59) = LODWORD(self->_roundTripTimeAvg);
  *(void *)(v14 + 284) |= 0x80000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)v14 + 63) = LODWORD(self->_roundTripTimeVar);
  *(void *)(v14 + 284) |= 0x800000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)v14 + 62) = LODWORD(self->_roundTripTimeMinActive);
  *(void *)(v14 + 284) |= 0x400000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_37:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v14 + 60) = LODWORD(self->_roundTripTimeAvgActive);
  *(void *)(v14 + 284) |= 0x100000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v14 + 64) = LODWORD(self->_roundTripTimeVarActive);
  *(void *)(v14 + 284) |= 0x1000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v14 + 66) = self->_securityType;
  *(void *)(v14 + 284) |= 0x4000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v14 + 49) = self->_captiveFlag;
  *(void *)(v14 + 284) |= 0x1000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v14 + 53) = self->_colocatedState;
  *(void *)(v14 + 284) |= 0x10000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_86;
  }
LABEL_85:
  v14[280] = self->_hotspot20;
  *(void *)(v14 + 284) |= 0x10000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v14 + 54) = self->_disassocReason;
  *(void *)(v14 + 284) |= 0x20000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v14 + 46) = self->_assocReason;
  *(void *)(v14 + 284) |= 0x200000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v14 + 48) = self->_band;
  *(void *)(v14 + 284) |= 0x800000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v14 + 51) = self->_channel;
  *(void *)(v14 + 284) |= 0x4000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_47:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v14 + 52) = self->_channelWidth;
  *(void *)(v14 + 284) |= 0x8000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_48:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v14 + 65) = self->_rssi;
  *(void *)(v14 + 284) |= 0x2000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v14 + 67) = self->_snr;
  *(void *)(v14 + 284) |= 0x8000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v14 + 50) = self->_cca;
  *(void *)(v14 + 284) |= 0x2000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v14 + 58) = self->_phyMode;
  *(void *)(v14 + 284) |= 0x40000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_95:
  *((void *)v14 + 20) = self->_timeOfDay;
  *(void *)(v14 + 284) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_53:
    *((_DWORD *)v14 + 47) = self->_associatedTime;
    *(void *)(v14 + 284) |= 0x400000uLL;
  }
LABEL_54:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *(void *)(v5 + 168) = self->_timestamp;
    *(void *)(v5 + 284) |= 0x100000uLL;
  }
  uint64_t v7 = [(NSString *)self->_uniqueID copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v7;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v9 = self->_additionalUniqueIDs;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v13) copyWithZone:a3];
        [(id)v6 addAdditionalUniqueIDs:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = self->_otherUniqueIDs;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v19), "copyWithZone:", a3, (void)v24);
        [(id)v6 addOtherUniqueIDs:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *(double *)(v6 + 64) = self->_lat;
    *(void *)(v6 + 284) |= 0x80uLL;
    $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  *(double *)(v6 + 72) = self->_lon;
  *(void *)(v6 + 284) |= 0x100uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(void *)(v6 + 104) = self->_overAllStay;
  *(void *)(v6 + 284) |= 0x1000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(void *)(v6 + 56) = self->_faultyStay;
  *(void *)(v6 + 284) |= 0x40uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(void *)(v6 + 80) = self->_lowLQMStay;
  *(void *)(v6 + 284) |= 0x200uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(void *)(v6 + 88) = self->_lowqStay;
  *(void *)(v6 + 284) |= 0x400uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(void *)(v6 + 96) = self->_lqmTranCount;
  *(void *)(v6 + 284) |= 0x800uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(void *)(v6 + 152) = self->_successfulConnections;
  *(void *)(v6 + 284) |= 0x40000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(void *)(v6 + 48) = self->_failedConnections;
  *(void *)(v6 + 284) |= 0x20uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(void *)(v6 + 112) = self->_packetsIn;
  *(void *)(v6 + 284) |= 0x2000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(void *)(v6 + 120) = self->_packetsOut;
  *(void *)(v6 + 284) |= 0x4000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(void *)(v6 + 16) = self->_bytesInTotal;
  *(void *)(v6 + 284) |= 2uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(void *)(v6 + 32) = self->_bytesOutTotal;
  *(void *)(v6 + 284) |= 8uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(void *)(v6 + 8) = self->_bytesInActive;
  *(void *)(v6 + 284) |= 1uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(void *)(v6 + 24) = self->_bytesOutActive;
  *(void *)(v6 + 284) |= 4uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(void *)(v6 + 128) = self->_reTxBytes;
  *(void *)(v6 + 284) |= 0x8000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(void *)(v6 + 40) = self->_dataStalls;
  *(void *)(v6 + 284) |= 0x10uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(void *)(v6 + 136) = self->_receivedDupes;
  *(void *)(v6 + 284) |= 0x10000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(void *)(v6 + 144) = self->_rxOutOfOrderBytes;
  *(void *)(v6 + 284) |= 0x20000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(float *)(v6 + 244) = self->_roundTripTimeMin;
  *(void *)(v6 + 284) |= 0x200000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(float *)(v6 + 236) = self->_roundTripTimeAvg;
  *(void *)(v6 + 284) |= 0x80000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_39:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(float *)(v6 + 252) = self->_roundTripTimeVar;
  *(void *)(v6 + 284) |= 0x800000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(float *)(v6 + 248) = self->_roundTripTimeMinActive;
  *(void *)(v6 + 284) |= 0x400000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(float *)(v6 + 240) = self->_roundTripTimeAvgActive;
  *(void *)(v6 + 284) |= 0x100000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(float *)(v6 + 256) = self->_roundTripTimeVarActive;
  *(void *)(v6 + 284) |= 0x1000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v6 + 264) = self->_securityType;
  *(void *)(v6 + 284) |= 0x4000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v6 + 196) = self->_captiveFlag;
  *(void *)(v6 + 284) |= 0x1000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v6 + 212) = self->_colocatedState;
  *(void *)(v6 + 284) |= 0x10000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(unsigned char *)(v6 + 280) = self->_hotspot20;
  *(void *)(v6 + 284) |= 0x10000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v6 + 216) = self->_disassocReason;
  *(void *)(v6 + 284) |= 0x20000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v6 + 184) = self->_assocReason;
  *(void *)(v6 + 284) |= 0x200000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v6 + 192) = self->_band;
  *(void *)(v6 + 284) |= 0x800000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v6 + 204) = self->_channel;
  *(void *)(v6 + 284) |= 0x4000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_51:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v6 + 208) = self->_channelWidth;
  *(void *)(v6 + 284) |= 0x8000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_52:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 260) = self->_rssi;
  *(void *)(v6 + 284) |= 0x2000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v6 + 268) = self->_snr;
  *(void *)(v6 + 284) |= 0x8000000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 200) = self->_cca;
  *(void *)(v6 + 284) |= 0x2000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_56;
    }
LABEL_97:
    *(void *)(v6 + 160) = self->_timeOfDay;
    *(void *)(v6 + 284) |= 0x80000uLL;
    if ((*(void *)&self->_has & 0x400000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_96:
  *(_DWORD *)(v6 + 232) = self->_phyMode;
  *(void *)(v6 + 284) |= 0x40000000uLL;
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_97;
  }
LABEL_56:
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_57:
    *(_DWORD *)(v6 + 188) = self->_associatedTime;
    *(void *)(v6 + 284) |= 0x400000uLL;
  }
LABEL_58:
  id v22 = (id)v6;

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_216;
  }
  uint64_t v5 = *(void *)(v4 + 284);
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    if ((v5 & 0x100000) == 0 || self->_timestamp != *((void *)v4 + 21)) {
      goto LABEL_216;
    }
  }
  else if ((v5 & 0x100000) != 0)
  {
    goto LABEL_216;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 34) && !-[NSString isEqual:](uniqueID, "isEqual:")) {
    goto LABEL_216;
  }
  additionalUniqueIDs = self->_additionalUniqueIDs;
  if ((unint64_t)additionalUniqueIDs | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](additionalUniqueIDs, "isEqual:")) {
      goto LABEL_216;
    }
  }
  otherUniqueIDs = self->_otherUniqueIDs;
  if ((unint64_t)otherUniqueIDs | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](otherUniqueIDs, "isEqual:")) {
      goto LABEL_216;
    }
  }
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  uint64_t v10 = *(void *)(v4 + 284);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_lat != *((double *)v4 + 8)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_lon != *((double *)v4 + 9)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_overAllStay != *((void *)v4 + 13)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_faultyStay != *((void *)v4 + 7)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_lowLQMStay != *((void *)v4 + 10)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_lowqStay != *((void *)v4 + 11)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_lqmTranCount != *((void *)v4 + 12)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_successfulConnections != *((void *)v4 + 19)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_failedConnections != *((void *)v4 + 6)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_packetsIn != *((void *)v4 + 14)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_packetsOut != *((void *)v4 + 15)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_bytesInTotal != *((void *)v4 + 2)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_216;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_bytesOutTotal != *((void *)v4 + 4)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_216;
  }
  if (*(unsigned char *)&has)
  {
    if ((v10 & 1) == 0 || self->_bytesInActive != *((void *)v4 + 1)) {
      goto LABEL_216;
    }
  }
  else if (v10)
  {
    goto LABEL_216;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_bytesOutActive != *((void *)v4 + 3)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_reTxBytes != *((void *)v4 + 16)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_dataStalls != *((void *)v4 + 5)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_receivedDupes != *((void *)v4 + 17)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0 || self->_rxOutOfOrderBytes != *((void *)v4 + 18)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_roundTripTimeMin != *((float *)v4 + 61)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_roundTripTimeAvg != *((float *)v4 + 59)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v10 & 0x800000000) == 0 || self->_roundTripTimeVar != *((float *)v4 + 63)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x800000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v10 & 0x400000000) == 0 || self->_roundTripTimeMinActive != *((float *)v4 + 62)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x400000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v10 & 0x100000000) == 0 || self->_roundTripTimeAvgActive != *((float *)v4 + 60)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x100000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_roundTripTimeVarActive != *((float *)v4 + 64)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v10 & 0x4000000000) == 0 || self->_securityType != *((_DWORD *)v4 + 66)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x4000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_captiveFlag != *((_DWORD *)v4 + 49)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) == 0 || self->_colocatedState != *((_DWORD *)v4 + 53)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x10000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v10 & 0x10000000000) != 0)
    {
      if (self->_hotspot20)
      {
        if (!v4[280]) {
          goto LABEL_216;
        }
        goto LABEL_161;
      }
      if (!v4[280]) {
        goto LABEL_161;
      }
    }
LABEL_216:
    BOOL v11 = 0;
    goto LABEL_217;
  }
  if ((v10 & 0x10000000000) != 0) {
    goto LABEL_216;
  }
LABEL_161:
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0 || self->_disassocReason != *((_DWORD *)v4 + 54)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_assocReason != *((_DWORD *)v4 + 46)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_band != *((_DWORD *)v4 + 48)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v10 & 0x4000000) == 0 || self->_channel != *((_DWORD *)v4 + 51)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x4000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_channelWidth != *((_DWORD *)v4 + 52)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_rssi != *((_DWORD *)v4 + 65)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v10 & 0x8000000000) == 0 || self->_snr != *((_DWORD *)v4 + 67)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x8000000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0 || self->_cca != *((_DWORD *)v4 + 50)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v10 & 0x40000000) == 0 || self->_phyMode != *((_DWORD *)v4 + 58)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x40000000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_timeOfDay != *((void *)v4 + 20)) {
      goto LABEL_216;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_216;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_associatedTime != *((_DWORD *)v4 + 47)) {
      goto LABEL_216;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x400000) == 0;
  }
LABEL_217:

  return v11;
}

- (unint64_t)hash
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    unint64_t v80 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v80 = 0;
  }
  NSUInteger v79 = [(NSString *)self->_uniqueID hash];
  uint64_t v78 = [(NSMutableArray *)self->_additionalUniqueIDs hash];
  uint64_t v77 = [(NSMutableArray *)self->_otherUniqueIDs hash];
  $6D1F4AE12A053AA933BF826E67DD671F has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double lat = self->_lat;
    double v6 = -lat;
    if (lat >= 0.0) {
      double v6 = self->_lat;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double lon = self->_lon;
    double v11 = -lon;
    if (lon >= 0.0) {
      double v11 = self->_lon;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    unint64_t v76 = 2654435761u * self->_overAllStay;
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
LABEL_22:
      unint64_t v75 = 2654435761u * self->_faultyStay;
      if ((*(_WORD *)&has & 0x200) != 0) {
        goto LABEL_23;
      }
      goto LABEL_44;
    }
  }
  else
  {
    unint64_t v76 = 0;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_22;
    }
  }
  unint64_t v75 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_23:
    unint64_t v74 = 2654435761u * self->_lowLQMStay;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_24;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v74 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_24:
    unint64_t v73 = 2654435761u * self->_lowqStay;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_25;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v73 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_25:
    unint64_t v72 = 2654435761u * self->_lqmTranCount;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_47;
  }
LABEL_46:
  unint64_t v72 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_26:
    unint64_t v71 = 2654435761u * self->_successfulConnections;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_27;
    }
    goto LABEL_48;
  }
LABEL_47:
  unint64_t v71 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_27:
    unint64_t v70 = 2654435761u * self->_failedConnections;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_49;
  }
LABEL_48:
  unint64_t v70 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_28:
    unint64_t v69 = 2654435761u * self->_packetsIn;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_50;
  }
LABEL_49:
  unint64_t v69 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_29:
    unint64_t v68 = 2654435761u * self->_packetsOut;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_30;
    }
    goto LABEL_51;
  }
LABEL_50:
  unint64_t v68 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_30:
    unint64_t v67 = 2654435761u * self->_bytesInTotal;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_31;
    }
    goto LABEL_52;
  }
LABEL_51:
  unint64_t v67 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_31:
    unint64_t v66 = 2654435761u * self->_bytesOutTotal;
    if (*(unsigned char *)&has) {
      goto LABEL_32;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v66 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_32:
    unint64_t v65 = 2654435761u * self->_bytesInActive;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_33;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v65 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_33:
    unint64_t v64 = 2654435761u * self->_bytesOutActive;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v64 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_34:
    unint64_t v63 = 2654435761u * self->_reTxBytes;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_35;
    }
    goto LABEL_56;
  }
LABEL_55:
  unint64_t v63 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_35:
    unint64_t v62 = 2654435761u * self->_dataStalls;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_57;
  }
LABEL_56:
  unint64_t v62 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_36:
    unint64_t v61 = 2654435761u * self->_receivedDupes;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_37;
    }
LABEL_58:
    unint64_t v60 = 0;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_38;
    }
LABEL_59:
    unint64_t v18 = 0;
    goto LABEL_62;
  }
LABEL_57:
  unint64_t v61 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_58;
  }
LABEL_37:
  unint64_t v60 = 2654435761u * self->_rxOutOfOrderBytes;
  if ((*(void *)&has & 0x200000000) == 0) {
    goto LABEL_59;
  }
LABEL_38:
  float roundTripTimeMin = self->_roundTripTimeMin;
  float v15 = -roundTripTimeMin;
  if (roundTripTimeMin >= 0.0) {
    float v15 = self->_roundTripTimeMin;
  }
  float v16 = floorf(v15 + 0.5);
  float v17 = (float)(v15 - v16) * 1.8447e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmodf(v16, 1.8447e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabsf(v17);
  }
LABEL_62:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    float roundTripTimeAvg = self->_roundTripTimeAvg;
    float v21 = -roundTripTimeAvg;
    if (roundTripTimeAvg >= 0.0) {
      float v21 = self->_roundTripTimeAvg;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    float roundTripTimeVar = self->_roundTripTimeVar;
    float v26 = -roundTripTimeVar;
    if (roundTripTimeVar >= 0.0) {
      float v26 = self->_roundTripTimeVar;
    }
    float v27 = floorf(v26 + 0.5);
    float v28 = (float)(v26 - v27) * 1.8447e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    float roundTripTimeMinActive = self->_roundTripTimeMinActive;
    float v31 = -roundTripTimeMinActive;
    if (roundTripTimeMinActive >= 0.0) {
      float v31 = self->_roundTripTimeMinActive;
    }
    float v32 = floorf(v31 + 0.5);
    float v33 = (float)(v31 - v32) * 1.8447e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    float roundTripTimeAvgActive = self->_roundTripTimeAvgActive;
    float v36 = -roundTripTimeAvgActive;
    if (roundTripTimeAvgActive >= 0.0) {
      float v36 = self->_roundTripTimeAvgActive;
    }
    float v37 = floorf(v36 + 0.5);
    float v38 = (float)(v36 - v37) * 1.8447e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    float roundTripTimeVarActive = self->_roundTripTimeVarActive;
    float v41 = -roundTripTimeVarActive;
    if (roundTripTimeVarActive >= 0.0) {
      float v41 = self->_roundTripTimeVarActive;
    }
    float v42 = floorf(v41 + 0.5);
    float v43 = (float)(v41 - v42) * 1.8447e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    uint64_t v44 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
LABEL_104:
      uint64_t v45 = 2654435761 * self->_captiveFlag;
      if ((*(_DWORD *)&has & 0x10000000) != 0) {
        goto LABEL_105;
      }
      goto LABEL_120;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_104;
    }
  }
  uint64_t v45 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_105:
    uint64_t v46 = 2654435761 * self->_colocatedState;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_106;
    }
    goto LABEL_121;
  }
LABEL_120:
  uint64_t v46 = 0;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_106:
    uint64_t v47 = 2654435761 * self->_hotspot20;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_107;
    }
    goto LABEL_122;
  }
LABEL_121:
  uint64_t v47 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_107:
    uint64_t v48 = 2654435761 * self->_disassocReason;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_108;
    }
    goto LABEL_123;
  }
LABEL_122:
  uint64_t v48 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_108:
    uint64_t v49 = 2654435761 * self->_assocReason;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_109;
    }
    goto LABEL_124;
  }
LABEL_123:
  uint64_t v49 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_109:
    uint64_t v50 = 2654435761 * self->_band;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_110;
    }
    goto LABEL_125;
  }
LABEL_124:
  uint64_t v50 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_110:
    uint64_t v51 = 2654435761 * self->_channel;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_111;
    }
    goto LABEL_126;
  }
LABEL_125:
  uint64_t v51 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_111:
    uint64_t v52 = 2654435761 * self->_channelWidth;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_112;
    }
    goto LABEL_127;
  }
LABEL_126:
  uint64_t v52 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_112:
    uint64_t v53 = 2654435761 * self->_rssi;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_113;
    }
    goto LABEL_128;
  }
LABEL_127:
  uint64_t v53 = 0;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_113:
    uint64_t v54 = 2654435761 * self->_snr;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_114;
    }
    goto LABEL_129;
  }
LABEL_128:
  uint64_t v54 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_114:
    uint64_t v55 = 2654435761 * self->_cca;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_115;
    }
    goto LABEL_130;
  }
LABEL_129:
  uint64_t v55 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_115:
    uint64_t v56 = 2654435761 * self->_phyMode;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_116;
    }
LABEL_131:
    unint64_t v57 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_117;
    }
LABEL_132:
    uint64_t v58 = 0;
    return v79 ^ v80 ^ v78 ^ v77 ^ v4 ^ v9 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v18 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57 ^ v58;
  }
LABEL_130:
  uint64_t v56 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    goto LABEL_131;
  }
LABEL_116:
  unint64_t v57 = 2654435761u * self->_timeOfDay;
  if ((*(_DWORD *)&has & 0x400000) == 0) {
    goto LABEL_132;
  }
LABEL_117:
  uint64_t v58 = 2654435761 * self->_associatedTime;
  return v79 ^ v80 ^ v78 ^ v77 ^ v4 ^ v9 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v18 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57 ^ v58;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v4 = (char *)a3;
  uint64_t v5 = v4;
  if ((v4[286] & 0x10) != 0)
  {
    self->_timestamp = *((void *)v4 + 21);
    *(void *)&self->_has |= 0x100000uLL;
  }
  if (*((void *)v4 + 34)) {
    -[WiFiAnalyticsAWDWiFiConnectionQuality setUniqueID:](self, "setUniqueID:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v5 + 22);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(WiFiAnalyticsAWDWiFiConnectionQuality *)self addAdditionalUniqueIDs:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v5 + 28);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[WiFiAnalyticsAWDWiFiConnectionQuality addOtherUniqueIDs:](self, "addOtherUniqueIDs:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x80) != 0)
  {
    self->_double lat = *((double *)v5 + 8);
    *(void *)&self->_has |= 0x80uLL;
    uint64_t v16 = *(void *)(v5 + 284);
    if ((v16 & 0x100) == 0)
    {
LABEL_21:
      if ((v16 & 0x1000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_63;
    }
  }
  else if ((v16 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  self->_double lon = *((double *)v5 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x1000) == 0)
  {
LABEL_22:
    if ((v16 & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_overAllStay = *((void *)v5 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x40) == 0)
  {
LABEL_23:
    if ((v16 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_faultyStay = *((void *)v5 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x200) == 0)
  {
LABEL_24:
    if ((v16 & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_lowLQMStay = *((void *)v5 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x400) == 0)
  {
LABEL_25:
    if ((v16 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_lowqStay = *((void *)v5 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x800) == 0)
  {
LABEL_26:
    if ((v16 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_lqmTranCount = *((void *)v5 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x40000) == 0)
  {
LABEL_27:
    if ((v16 & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_successfulConnections = *((void *)v5 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x20) == 0)
  {
LABEL_28:
    if ((v16 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_failedConnections = *((void *)v5 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x2000) == 0)
  {
LABEL_29:
    if ((v16 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_packetsIn = *((void *)v5 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x4000) == 0)
  {
LABEL_30:
    if ((v16 & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_packetsOut = *((void *)v5 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 2) == 0)
  {
LABEL_31:
    if ((v16 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_bytesInTotal = *((void *)v5 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 8) == 0)
  {
LABEL_32:
    if ((v16 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_bytesOutTotal = *((void *)v5 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 1) == 0)
  {
LABEL_33:
    if ((v16 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_bytesInActive = *((void *)v5 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 4) == 0)
  {
LABEL_34:
    if ((v16 & 0x8000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_bytesOutActive = *((void *)v5 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x8000) == 0)
  {
LABEL_35:
    if ((v16 & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_reTxBytes = *((void *)v5 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x10) == 0)
  {
LABEL_36:
    if ((v16 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_dataStalls = *((void *)v5 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x10000) == 0)
  {
LABEL_37:
    if ((v16 & 0x20000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_receivedDupes = *((void *)v5 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x20000) == 0)
  {
LABEL_38:
    if ((v16 & 0x200000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_rxOutOfOrderBytes = *((void *)v5 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x200000000) == 0)
  {
LABEL_39:
    if ((v16 & 0x80000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_float roundTripTimeMin = *((float *)v5 + 61);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x80000000) == 0)
  {
LABEL_40:
    if ((v16 & 0x800000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_float roundTripTimeAvg = *((float *)v5 + 59);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x800000000) == 0)
  {
LABEL_41:
    if ((v16 & 0x400000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_float roundTripTimeVar = *((float *)v5 + 63);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x400000000) == 0)
  {
LABEL_42:
    if ((v16 & 0x100000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_float roundTripTimeMinActive = *((float *)v5 + 62);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x100000000) == 0)
  {
LABEL_43:
    if ((v16 & 0x1000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_float roundTripTimeAvgActive = *((float *)v5 + 60);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x1000000000) == 0)
  {
LABEL_44:
    if ((v16 & 0x4000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_float roundTripTimeVarActive = *((float *)v5 + 64);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x4000000000) == 0)
  {
LABEL_45:
    if ((v16 & 0x1000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_securityType = *((_DWORD *)v5 + 66);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x1000000) == 0)
  {
LABEL_46:
    if ((v16 & 0x10000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_captiveFlag = *((_DWORD *)v5 + 49);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x10000000) == 0)
  {
LABEL_47:
    if ((v16 & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_colocatedState = *((_DWORD *)v5 + 53);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v16 & 0x20000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_hotspot20 = v5[280];
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x20000000) == 0)
  {
LABEL_49:
    if ((v16 & 0x200000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_disassocReason = *((_DWORD *)v5 + 54);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x200000) == 0)
  {
LABEL_50:
    if ((v16 & 0x800000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_assocReason = *((_DWORD *)v5 + 46);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x800000) == 0)
  {
LABEL_51:
    if ((v16 & 0x4000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_band = *((_DWORD *)v5 + 48);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x4000000) == 0)
  {
LABEL_52:
    if ((v16 & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_channel = *((_DWORD *)v5 + 51);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x8000000) == 0)
  {
LABEL_53:
    if ((v16 & 0x2000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_channelWidth = *((_DWORD *)v5 + 52);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x2000000000) == 0)
  {
LABEL_54:
    if ((v16 & 0x8000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_rssuint64_t i = *((_DWORD *)v5 + 65);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x8000000000) == 0)
  {
LABEL_55:
    if ((v16 & 0x2000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_snr = *((_DWORD *)v5 + 67);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x2000000) == 0)
  {
LABEL_56:
    if ((v16 & 0x40000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_cca = *((_DWORD *)v5 + 50);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x40000000) == 0)
  {
LABEL_57:
    if ((v16 & 0x80000) == 0) {
      goto LABEL_58;
    }
LABEL_99:
    self->_timeOfDay = *((void *)v5 + 20);
    *(void *)&self->_has |= 0x80000uLL;
    if ((*(void *)(v5 + 284) & 0x400000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_98:
  self->_phyMode = *((_DWORD *)v5 + 58);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v16 = *(void *)(v5 + 284);
  if ((v16 & 0x80000) != 0) {
    goto LABEL_99;
  }
LABEL_58:
  if ((v16 & 0x400000) != 0)
  {
LABEL_59:
    self->_associatedTime = *((_DWORD *)v5 + 47);
    *(void *)&self->_has |= 0x400000uLL;
  }
LABEL_60:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSMutableArray)additionalUniqueIDs
{
  return self->_additionalUniqueIDs;
}

- (void)setAdditionalUniqueIDs:(id)a3
{
}

- (NSMutableArray)otherUniqueIDs
{
  return self->_otherUniqueIDs;
}

- (void)setOtherUniqueIDs:(id)a3
{
}

- (double)lat
{
  return self->_lat;
}

- (double)lon
{
  return self->_lon;
}

- (unint64_t)overAllStay
{
  return self->_overAllStay;
}

- (unint64_t)faultyStay
{
  return self->_faultyStay;
}

- (unint64_t)lowLQMStay
{
  return self->_lowLQMStay;
}

- (unint64_t)lowqStay
{
  return self->_lowqStay;
}

- (unint64_t)lqmTranCount
{
  return self->_lqmTranCount;
}

- (unint64_t)successfulConnections
{
  return self->_successfulConnections;
}

- (unint64_t)failedConnections
{
  return self->_failedConnections;
}

- (unint64_t)packetsIn
{
  return self->_packetsIn;
}

- (unint64_t)packetsOut
{
  return self->_packetsOut;
}

- (unint64_t)bytesInTotal
{
  return self->_bytesInTotal;
}

- (unint64_t)bytesOutTotal
{
  return self->_bytesOutTotal;
}

- (unint64_t)bytesInActive
{
  return self->_bytesInActive;
}

- (unint64_t)bytesOutActive
{
  return self->_bytesOutActive;
}

- (unint64_t)reTxBytes
{
  return self->_reTxBytes;
}

- (unint64_t)dataStalls
{
  return self->_dataStalls;
}

- (unint64_t)receivedDupes
{
  return self->_receivedDupes;
}

- (unint64_t)rxOutOfOrderBytes
{
  return self->_rxOutOfOrderBytes;
}

- (float)roundTripTimeMin
{
  return self->_roundTripTimeMin;
}

- (float)roundTripTimeAvg
{
  return self->_roundTripTimeAvg;
}

- (float)roundTripTimeVar
{
  return self->_roundTripTimeVar;
}

- (float)roundTripTimeMinActive
{
  return self->_roundTripTimeMinActive;
}

- (float)roundTripTimeAvgActive
{
  return self->_roundTripTimeAvgActive;
}

- (float)roundTripTimeVarActive
{
  return self->_roundTripTimeVarActive;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)captiveFlag
{
  return self->_captiveFlag;
}

- (unsigned)colocatedState
{
  return self->_colocatedState;
}

- (BOOL)hotspot20
{
  return self->_hotspot20;
}

- (unsigned)disassocReason
{
  return self->_disassocReason;
}

- (unsigned)assocReason
{
  return self->_assocReason;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)snr
{
  return self->_snr;
}

- (int)cca
{
  return self->_cca;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (unsigned)associatedTime
{
  return self->_associatedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_otherUniqueIDs, 0);
  objc_storeStrong((id *)&self->_additionalUniqueIDs, 0);
}

@end