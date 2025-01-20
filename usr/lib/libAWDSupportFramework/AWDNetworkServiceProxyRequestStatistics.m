@interface AWDNetworkServiceProxyRequestStatistics
- (BOOL)hasDirectConnectionCount;
- (BOOL)hasDirectConnectionFailedCount;
- (BOOL)hasFirstPartyServiceName;
- (BOOL)hasInterfaceType;
- (BOOL)hasProtocolType;
- (BOOL)hasRequestCount;
- (BOOL)hasRequestFailedCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)firstPartyServiceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceTypeAsString:(int)a3;
- (id)protocolTypeAsString:(int)a3;
- (int)StringAsInterfaceType:(id)a3;
- (int)StringAsProtocolType:(id)a3;
- (int)interfaceType;
- (int)protocolType;
- (unint64_t)directConnectionFirstByteBucketsCount;
- (unint64_t)directConnectionLastByteBucketsCount;
- (unint64_t)firstByteBucketsCount;
- (unint64_t)hash;
- (unint64_t)lastByteBucketsCount;
- (unint64_t)timestamp;
- (unint64_t)udpRttBucketsCount;
- (unsigned)directConnectionCount;
- (unsigned)directConnectionFailedCount;
- (unsigned)directConnectionFirstByteBuckets;
- (unsigned)directConnectionFirstByteBucketsAtIndex:(unint64_t)a3;
- (unsigned)directConnectionLastByteBuckets;
- (unsigned)directConnectionLastByteBucketsAtIndex:(unint64_t)a3;
- (unsigned)firstByteBuckets;
- (unsigned)firstByteBucketsAtIndex:(unint64_t)a3;
- (unsigned)lastByteBuckets;
- (unsigned)lastByteBucketsAtIndex:(unint64_t)a3;
- (unsigned)requestCount;
- (unsigned)requestFailedCount;
- (unsigned)udpRttBuckets;
- (unsigned)udpRttBucketsAtIndex:(unint64_t)a3;
- (void)addDirectConnectionFirstByteBuckets:(unsigned int)a3;
- (void)addDirectConnectionLastByteBuckets:(unsigned int)a3;
- (void)addFirstByteBuckets:(unsigned int)a3;
- (void)addLastByteBuckets:(unsigned int)a3;
- (void)addUdpRttBuckets:(unsigned int)a3;
- (void)clearDirectConnectionFirstByteBuckets;
- (void)clearDirectConnectionLastByteBuckets;
- (void)clearFirstByteBuckets;
- (void)clearLastByteBuckets;
- (void)clearUdpRttBuckets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDirectConnectionCount:(unsigned int)a3;
- (void)setDirectConnectionFailedCount:(unsigned int)a3;
- (void)setDirectConnectionFirstByteBuckets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDirectConnectionLastByteBuckets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFirstByteBuckets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFirstPartyServiceName:(id)a3;
- (void)setHasDirectConnectionCount:(BOOL)a3;
- (void)setHasDirectConnectionFailedCount:(BOOL)a3;
- (void)setHasInterfaceType:(BOOL)a3;
- (void)setHasProtocolType:(BOOL)a3;
- (void)setHasRequestCount:(BOOL)a3;
- (void)setHasRequestFailedCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceType:(int)a3;
- (void)setLastByteBuckets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setProtocolType:(int)a3;
- (void)setRequestCount:(unsigned int)a3;
- (void)setRequestFailedCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUdpRttBuckets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDNetworkServiceProxyRequestStatistics

- (void)dealloc
{
  [(AWDNetworkServiceProxyRequestStatistics *)self setFirstPartyServiceName:0];
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyRequestStatistics;
  [(AWDNetworkServiceProxyRequestStatistics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)interfaceType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_interfaceType;
  }
  else {
    return 1;
  }
}

- (void)setInterfaceType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9B68[a3 - 1];
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

- (BOOL)hasFirstPartyServiceName
{
  return self->_firstPartyServiceName != 0;
}

- (void)setRequestCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_requestCount = a3;
}

- (void)setHasRequestCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRequestCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRequestFailedCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_requestFailedCount = a3;
}

- (void)setHasRequestFailedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRequestFailedCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDirectConnectionCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_directConnectionCount = a3;
}

- (void)setHasDirectConnectionCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDirectConnectionCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDirectConnectionFailedCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_directConnectionFailedCount = a3;
}

- (void)setHasDirectConnectionFailedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDirectConnectionFailedCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)firstByteBucketsCount
{
  return self->_firstByteBuckets.count;
}

- (unsigned)firstByteBuckets
{
  return self->_firstByteBuckets.list;
}

- (void)clearFirstByteBuckets
{
}

- (void)addFirstByteBuckets:(unsigned int)a3
{
}

- (unsigned)firstByteBucketsAtIndex:(unint64_t)a3
{
  p_firstByteBuckets = &self->_firstByteBuckets;
  unint64_t count = self->_firstByteBuckets.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_firstByteBuckets->list[a3];
}

- (void)setFirstByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)lastByteBucketsCount
{
  return self->_lastByteBuckets.count;
}

- (unsigned)lastByteBuckets
{
  return self->_lastByteBuckets.list;
}

- (void)clearLastByteBuckets
{
}

- (void)addLastByteBuckets:(unsigned int)a3
{
}

- (unsigned)lastByteBucketsAtIndex:(unint64_t)a3
{
  p_lastByteBuckets = &self->_lastByteBuckets;
  unint64_t count = self->_lastByteBuckets.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_lastByteBuckets->list[a3];
}

- (void)setLastByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)directConnectionFirstByteBucketsCount
{
  return self->_directConnectionFirstByteBuckets.count;
}

- (unsigned)directConnectionFirstByteBuckets
{
  return self->_directConnectionFirstByteBuckets.list;
}

- (void)clearDirectConnectionFirstByteBuckets
{
}

- (void)addDirectConnectionFirstByteBuckets:(unsigned int)a3
{
}

- (unsigned)directConnectionFirstByteBucketsAtIndex:(unint64_t)a3
{
  p_directConnectionFirstByteBuckets = &self->_directConnectionFirstByteBuckets;
  unint64_t count = self->_directConnectionFirstByteBuckets.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_directConnectionFirstByteBuckets->list[a3];
}

- (void)setDirectConnectionFirstByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)directConnectionLastByteBucketsCount
{
  return self->_directConnectionLastByteBuckets.count;
}

- (unsigned)directConnectionLastByteBuckets
{
  return self->_directConnectionLastByteBuckets.list;
}

- (void)clearDirectConnectionLastByteBuckets
{
}

- (void)addDirectConnectionLastByteBuckets:(unsigned int)a3
{
}

- (unsigned)directConnectionLastByteBucketsAtIndex:(unint64_t)a3
{
  p_directConnectionLastByteBuckets = &self->_directConnectionLastByteBuckets;
  unint64_t count = self->_directConnectionLastByteBuckets.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_directConnectionLastByteBuckets->list[a3];
}

- (void)setDirectConnectionLastByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)udpRttBucketsCount
{
  return self->_udpRttBuckets.count;
}

- (unsigned)udpRttBuckets
{
  return self->_udpRttBuckets.list;
}

- (void)clearUdpRttBuckets
{
}

- (void)addUdpRttBuckets:(unsigned int)a3
{
}

- (unsigned)udpRttBucketsAtIndex:(unint64_t)a3
{
  p_udpRttBuckets = &self->_udpRttBuckets;
  unint64_t count = self->_udpRttBuckets.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_udpRttBuckets->list[a3];
}

- (void)setUdpRttBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)protocolType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_protocolType;
  }
  else {
    return 1;
  }
}

- (void)setProtocolType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_protocolType = a3;
}

- (void)setHasProtocolType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasProtocolType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)protocolTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9B88[a3 - 1];
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyRequestStatistics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNetworkServiceProxyRequestStatistics description](&v3, sel_description), -[AWDNetworkServiceProxyRequestStatistics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    unsigned int v5 = self->_interfaceType - 1;
    if (v5 >= 4) {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_interfaceType];
    }
    else {
      v6 = off_2641B9B68[v5];
    }
    [v3 setObject:v6 forKey:@"interface_type"];
  }
  firstPartyServiceName = self->_firstPartyServiceName;
  if (firstPartyServiceName) {
    [v3 setObject:firstPartyServiceName forKey:@"first_party_service_name"];
  }
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_requestCount] forKey:@"request_count"];
    char v8 = (char)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_12:
      if ((v8 & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_requestFailedCount] forKey:@"request_failed_count"];
  char v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_13:
    if ((v8 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_directConnectionCount] forKey:@"direct_connection_count"];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_directConnectionFailedCount] forKey:@"direct_connection_failed_count"];
LABEL_15:
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"first_byte_buckets"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"last_byte_buckets"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"direct_connection_first_byte_buckets"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"direct_connection_last_byte_buckets"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"udp_rtt_buckets"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unsigned int v9 = self->_protocolType - 1;
    if (v9 >= 3) {
      v10 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_protocolType];
    }
    else {
      v10 = off_2641B9B88[v9];
    }
    [v3 setObject:v10 forKey:@"protocol_type"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkServiceProxyRequestStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_firstPartyServiceName) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
  if (self->_firstByteBuckets.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_firstByteBuckets.count);
  }
  if (self->_lastByteBuckets.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_lastByteBuckets.count);
  }
  if (self->_directConnectionFirstByteBuckets.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v8;
    }
    while (v8 < self->_directConnectionFirstByteBuckets.count);
  }
  if (self->_directConnectionLastByteBuckets.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < self->_directConnectionLastByteBuckets.count);
  }
  if (self->_udpRttBuckets.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < self->_udpRttBuckets.count);
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 16) = self->_timestamp;
    *((unsigned char *)a3 + 168) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 38) = self->_interfaceType;
    *((unsigned char *)a3 + 168) |= 8u;
  }
  if (self->_firstPartyServiceName) {
    [a3 setFirstPartyServiceName:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 40) = self->_requestCount;
    *((unsigned char *)a3 + 168) |= 0x20u;
    char v6 = (char)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
LABEL_37:
      *((_DWORD *)a3 + 34) = self->_directConnectionCount;
      *((unsigned char *)a3 + 168) |= 2u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 41) = self->_requestFailedCount;
  *((unsigned char *)a3 + 168) |= 0x40u;
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0) {
    goto LABEL_37;
  }
LABEL_10:
  if ((v6 & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 35) = self->_directConnectionFailedCount;
    *((unsigned char *)a3 + 168) |= 4u;
  }
LABEL_12:
  if ([(AWDNetworkServiceProxyRequestStatistics *)self firstByteBucketsCount])
  {
    [a3 clearFirstByteBuckets];
    unint64_t v7 = [(AWDNetworkServiceProxyRequestStatistics *)self firstByteBucketsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addFirstByteBuckets:-[AWDNetworkServiceProxyRequestStatistics firstByteBucketsAtIndex:](self, "firstByteBucketsAtIndex:", i)];
    }
  }
  if ([(AWDNetworkServiceProxyRequestStatistics *)self lastByteBucketsCount])
  {
    [a3 clearLastByteBuckets];
    unint64_t v10 = [(AWDNetworkServiceProxyRequestStatistics *)self lastByteBucketsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addLastByteBuckets:-[AWDNetworkServiceProxyRequestStatistics lastByteBucketsAtIndex:](self, "lastByteBucketsAtIndex:", j)];
    }
  }
  if ([(AWDNetworkServiceProxyRequestStatistics *)self directConnectionFirstByteBucketsCount])
  {
    [a3 clearDirectConnectionFirstByteBuckets];
    unint64_t v13 = [(AWDNetworkServiceProxyRequestStatistics *)self directConnectionFirstByteBucketsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        [a3 addDirectConnectionFirstByteBuckets:-[AWDNetworkServiceProxyRequestStatistics directConnectionFirstByteBucketsAtIndex:](self, "directConnectionFirstByteBucketsAtIndex:", k)];
    }
  }
  if ([(AWDNetworkServiceProxyRequestStatistics *)self directConnectionLastByteBucketsCount])
  {
    [a3 clearDirectConnectionLastByteBuckets];
    unint64_t v16 = [(AWDNetworkServiceProxyRequestStatistics *)self directConnectionLastByteBucketsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [a3 addDirectConnectionLastByteBuckets:[[self directConnectionLastByteBucketsAtIndex:m]];
    }
  }
  if ([(AWDNetworkServiceProxyRequestStatistics *)self udpRttBucketsCount])
  {
    [a3 clearUdpRttBuckets];
    unint64_t v19 = [(AWDNetworkServiceProxyRequestStatistics *)self udpRttBucketsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [a3 addUdpRttBuckets:-[AWDNetworkServiceProxyRequestStatistics udpRttBucketsAtIndex:](self, "udpRttBucketsAtIndex:", n)];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 39) = self->_protocolType;
    *((unsigned char *)a3 + 168) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 128) = self->_timestamp;
    *(unsigned char *)(v5 + 168) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_interfaceType;
    *(unsigned char *)(v5 + 168) |= 8u;
  }

  *(void *)(v6 + 144) = [(NSString *)self->_firstPartyServiceName copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_requestCount;
    *(unsigned char *)(v6 + 168) |= 0x20u;
    char v8 = (char)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_7:
      if ((v8 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 164) = self->_requestFailedCount;
  *(unsigned char *)(v6 + 168) |= 0x40u;
  char v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_8:
    if ((v8 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  *(_DWORD *)(v6 + 136) = self->_directConnectionCount;
  *(unsigned char *)(v6 + 168) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 140) = self->_directConnectionFailedCount;
    *(unsigned char *)(v6 + 168) |= 4u;
  }
LABEL_10:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 156) = self->_protocolType;
    *(unsigned char *)(v6 + 168) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 168) & 1) == 0 || self->_timestamp != *((void *)a3 + 16)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)a3 + 168))
    {
LABEL_44:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 168) & 8) == 0 || self->_interfaceType != *((_DWORD *)a3 + 38)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 168) & 8) != 0)
    {
      goto LABEL_44;
    }
    firstPartyServiceName = self->_firstPartyServiceName;
    if ((unint64_t)firstPartyServiceName | *((void *)a3 + 18))
    {
      int IsEqual = -[NSString isEqual:](firstPartyServiceName, "isEqual:");
      if (!IsEqual) {
        return IsEqual;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 168) & 0x20) == 0 || self->_requestCount != *((_DWORD *)a3 + 40)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 168) & 0x20) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 168) & 0x40) == 0 || self->_requestFailedCount != *((_DWORD *)a3 + 41)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 168) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 168) & 2) == 0 || self->_directConnectionCount != *((_DWORD *)a3 + 34)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 168) & 2) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 168) & 4) == 0 || self->_directConnectionFailedCount != *((_DWORD *)a3 + 35)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 168) & 4) != 0)
    {
      goto LABEL_44;
    }
    int IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      int IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        int IsEqual = PBRepeatedUInt32IsEqual();
        if (IsEqual)
        {
          int IsEqual = PBRepeatedUInt32IsEqual();
          if (IsEqual)
          {
            int IsEqual = PBRepeatedUInt32IsEqual();
            if (IsEqual)
            {
              LOBYTE(IsEqual) = (*((unsigned char *)a3 + 168) & 0x10) == 0;
              if ((*(unsigned char *)&self->_has & 0x10) != 0)
              {
                if ((*((unsigned char *)a3 + 168) & 0x10) == 0 || self->_protocolType != *((_DWORD *)a3 + 39)) {
                  goto LABEL_44;
                }
                LOBYTE(IsEqual) = 1;
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
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v16 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v15 = 2654435761 * self->_interfaceType;
      goto LABEL_6;
    }
  }
  uint64_t v15 = 0;
LABEL_6:
  NSUInteger v14 = [(NSString *)self->_firstPartyServiceName hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v13 = 2654435761 * self->_requestCount;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_8:
      uint64_t v3 = 2654435761 * self->_requestFailedCount;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v4 = 2654435761 * self->_directConnectionCount;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    uint64_t v5 = 2654435761 * self->_directConnectionFailedCount;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
LABEL_15:
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v10 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_protocolType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v15 ^ v16 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 168);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 16);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 168);
  }
  if ((v5 & 8) != 0)
  {
    self->_interfaceType = *((_DWORD *)a3 + 38);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 18)) {
    -[AWDNetworkServiceProxyRequestStatistics setFirstPartyServiceName:](self, "setFirstPartyServiceName:");
  }
  char v6 = *((unsigned char *)a3 + 168);
  if ((v6 & 0x20) != 0)
  {
    self->_requestCount = *((_DWORD *)a3 + 40);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)a3 + 168);
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 168) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_requestFailedCount = *((_DWORD *)a3 + 41);
  *(unsigned char *)&self->_has |= 0x40u;
  char v6 = *((unsigned char *)a3 + 168);
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_32:
  self->_directConnectionCount = *((_DWORD *)a3 + 34);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 168) & 4) != 0)
  {
LABEL_11:
    self->_directConnectionFailedCount = *((_DWORD *)a3 + 35);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
  uint64_t v7 = [a3 firstByteBucketsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[AWDNetworkServiceProxyRequestStatistics addFirstByteBuckets:](self, "addFirstByteBuckets:", [a3 firstByteBucketsAtIndex:i]);
  }
  uint64_t v10 = [a3 lastByteBucketsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[AWDNetworkServiceProxyRequestStatistics addLastByteBuckets:](self, "addLastByteBuckets:", [a3 lastByteBucketsAtIndex:j]);
  }
  uint64_t v13 = [a3 directConnectionFirstByteBucketsCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[AWDNetworkServiceProxyRequestStatistics addDirectConnectionFirstByteBuckets:](self, "addDirectConnectionFirstByteBuckets:", [a3 directConnectionFirstByteBucketsAtIndex:k]);
  }
  uint64_t v16 = [a3 directConnectionLastByteBucketsCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t m = 0; m != v17; ++m)
      -[AWDNetworkServiceProxyRequestStatistics addDirectConnectionLastByteBuckets:](self, "addDirectConnectionLastByteBuckets:", [a3 directConnectionLastByteBucketsAtIndex:m]);
  }
  uint64_t v19 = [a3 udpRttBucketsCount];
  if (v19)
  {
    uint64_t v20 = v19;
    for (uint64_t n = 0; n != v20; ++n)
      -[AWDNetworkServiceProxyRequestStatistics addUdpRttBuckets:](self, "addUdpRttBuckets:", [a3 udpRttBucketsAtIndex:n]);
  }
  if ((*((unsigned char *)a3 + 168) & 0x10) != 0)
  {
    self->_protocolType = *((_DWORD *)a3 + 39);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)firstPartyServiceName
{
  return self->_firstPartyServiceName;
}

- (void)setFirstPartyServiceName:(id)a3
{
}

- (unsigned)requestCount
{
  return self->_requestCount;
}

- (unsigned)requestFailedCount
{
  return self->_requestFailedCount;
}

- (unsigned)directConnectionCount
{
  return self->_directConnectionCount;
}

- (unsigned)directConnectionFailedCount
{
  return self->_directConnectionFailedCount;
}

@end