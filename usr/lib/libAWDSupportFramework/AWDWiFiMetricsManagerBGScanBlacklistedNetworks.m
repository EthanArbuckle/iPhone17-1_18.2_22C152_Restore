@interface AWDWiFiMetricsManagerBGScanBlacklistedNetworks
+ (Class)blacklistingHistoryType;
- (BOOL)hasInterfaceName;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)blacklistingHistorys;
- (NSString)interfaceName;
- (id)blacklistingHistoryAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)blacklistingHistorysCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addBlacklistingHistory:(id)a3;
- (void)clearBlacklistingHistorys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBlacklistingHistorys:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceName:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerBGScanBlacklistedNetworks

- (void)dealloc
{
  [(AWDWiFiMetricsManagerBGScanBlacklistedNetworks *)self setInterfaceName:0];
  [(AWDWiFiMetricsManagerBGScanBlacklistedNetworks *)self setBlacklistingHistorys:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBGScanBlacklistedNetworks;
  [(AWDWiFiMetricsManagerBGScanBlacklistedNetworks *)&v3 dealloc];
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

- (BOOL)hasInterfaceName
{
  return self->_interfaceName != 0;
}

- (void)clearBlacklistingHistorys
{
}

- (void)addBlacklistingHistory:(id)a3
{
  blacklistingHistorys = self->_blacklistingHistorys;
  if (!blacklistingHistorys)
  {
    blacklistingHistorys = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_blacklistingHistorys = blacklistingHistorys;
  }

  [(NSMutableArray *)blacklistingHistorys addObject:a3];
}

- (unint64_t)blacklistingHistorysCount
{
  return [(NSMutableArray *)self->_blacklistingHistorys count];
}

- (id)blacklistingHistoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_blacklistingHistorys objectAtIndex:a3];
}

+ (Class)blacklistingHistoryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBGScanBlacklistedNetworks;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks description](&v3, sel_description), -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  interfaceName = self->_interfaceName;
  if (interfaceName) {
    [v3 setObject:interfaceName forKey:@"interfaceName"];
  }
  if ([(NSMutableArray *)self->_blacklistingHistorys count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_blacklistingHistorys, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    blacklistingHistorys = self->_blacklistingHistorys;
    uint64_t v7 = [(NSMutableArray *)blacklistingHistorys countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(blacklistingHistorys);
          }
          [v5 addObject:[*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)blacklistingHistorys countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"blacklistingHistory"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBGScanBlacklistedNetworksReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_interfaceName) {
    PBDataWriterWriteStringField();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  blacklistingHistorys = self->_blacklistingHistorys;
  uint64_t v5 = [(NSMutableArray *)blacklistingHistorys countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(blacklistingHistorys);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)blacklistingHistorys countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_interfaceName) {
    [a3 setInterfaceName:];
  }
  if ([(AWDWiFiMetricsManagerBGScanBlacklistedNetworks *)self blacklistingHistorysCount])
  {
    [a3 clearBlacklistingHistorys];
    unint64_t v5 = [(AWDWiFiMetricsManagerBGScanBlacklistedNetworks *)self blacklistingHistorysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addBlacklistingHistory:-[AWDWiFiMetricsManagerBGScanBlacklistedNetworks blacklistingHistoryAtIndex:](self, "blacklistingHistoryAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  v6[3] = [(NSString *)self->_interfaceName copyWithZone:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  blacklistingHistorys = self->_blacklistingHistorys;
  uint64_t v8 = [(NSMutableArray *)blacklistingHistorys countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(blacklistingHistorys);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addBlacklistingHistory:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)blacklistingHistorys countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    interfaceName = self->_interfaceName;
    if (!((unint64_t)interfaceName | *((void *)a3 + 3))
      || (int v5 = -[NSString isEqual:](interfaceName, "isEqual:")) != 0)
    {
      blacklistingHistorys = self->_blacklistingHistorys;
      if ((unint64_t)blacklistingHistorys | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](blacklistingHistorys, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_interfaceName hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_blacklistingHistorys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 32))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDWiFiMetricsManagerBGScanBlacklistedNetworks setInterfaceName:](self, "setInterfaceName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDWiFiMetricsManagerBGScanBlacklistedNetworks *)self addBlacklistingHistory:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSMutableArray)blacklistingHistorys
{
  return self->_blacklistingHistorys;
}

- (void)setBlacklistingHistorys:(id)a3
{
}

@end