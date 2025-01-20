@interface AWDWiFiMetricsManagerBlacklistedNetworkInfo
+ (Class)blacklistingRecordType;
- (BOOL)hasNetworkFlags;
- (BOOL)hasReserverdInfo;
- (BOOL)hasSsidHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)blacklistingRecords;
- (NSString)ssidHash;
- (id)blacklistingRecordAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)blacklistingRecordsCount;
- (unint64_t)hash;
- (unsigned)networkFlags;
- (unsigned)reserverdInfo;
- (void)addBlacklistingRecord:(id)a3;
- (void)clearBlacklistingRecords;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBlacklistingRecords:(id)a3;
- (void)setHasNetworkFlags:(BOOL)a3;
- (void)setHasReserverdInfo:(BOOL)a3;
- (void)setNetworkFlags:(unsigned int)a3;
- (void)setReserverdInfo:(unsigned int)a3;
- (void)setSsidHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerBlacklistedNetworkInfo

- (void)dealloc
{
  [(AWDWiFiMetricsManagerBlacklistedNetworkInfo *)self setSsidHash:0];
  [(AWDWiFiMetricsManagerBlacklistedNetworkInfo *)self setBlacklistingRecords:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBlacklistedNetworkInfo;
  [(AWDWiFiMetricsManagerBlacklistedNetworkInfo *)&v3 dealloc];
}

- (BOOL)hasSsidHash
{
  return self->_ssidHash != 0;
}

- (void)setNetworkFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_networkFlags = a3;
}

- (void)setHasNetworkFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNetworkFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReserverdInfo:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reserverdInfo = a3;
}

- (void)setHasReserverdInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReserverdInfo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearBlacklistingRecords
{
}

- (void)addBlacklistingRecord:(id)a3
{
  blacklistingRecords = self->_blacklistingRecords;
  if (!blacklistingRecords)
  {
    blacklistingRecords = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_blacklistingRecords = blacklistingRecords;
  }

  [(NSMutableArray *)blacklistingRecords addObject:a3];
}

- (unint64_t)blacklistingRecordsCount
{
  return [(NSMutableArray *)self->_blacklistingRecords count];
}

- (id)blacklistingRecordAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_blacklistingRecords objectAtIndex:a3];
}

+ (Class)blacklistingRecordType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBlacklistedNetworkInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerBlacklistedNetworkInfo description](&v3, sel_description), -[AWDWiFiMetricsManagerBlacklistedNetworkInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  ssidHash = self->_ssidHash;
  if (ssidHash) {
    [v3 setObject:ssidHash forKey:@"ssidHash"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_networkFlags] forKey:@"networkFlags"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_reserverdInfo] forKey:@"reserverdInfo"];
  }
  if ([(NSMutableArray *)self->_blacklistingRecords count])
  {
    v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_blacklistingRecords, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    blacklistingRecords = self->_blacklistingRecords;
    uint64_t v9 = [(NSMutableArray *)blacklistingRecords countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(blacklistingRecords);
          }
          [v7 addObject:[*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v10 = [(NSMutableArray *)blacklistingRecords countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    [v4 setObject:v7 forKey:@"blacklistingRecord"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBlacklistedNetworkInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_ssidHash) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  blacklistingRecords = self->_blacklistingRecords;
  uint64_t v6 = [(NSMutableArray *)blacklistingRecords countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(blacklistingRecords);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)blacklistingRecords countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_ssidHash) {
    [a3 setSsidHash:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 4) = self->_networkFlags;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_reserverdInfo;
    *((unsigned char *)a3 + 32) |= 2u;
  }
  if ([(AWDWiFiMetricsManagerBlacklistedNetworkInfo *)self blacklistingRecordsCount])
  {
    [a3 clearBlacklistingRecords];
    unint64_t v6 = [(AWDWiFiMetricsManagerBlacklistedNetworkInfo *)self blacklistingRecordsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addBlacklistingRecord:-[AWDWiFiMetricsManagerBlacklistedNetworkInfo blacklistingRecordAtIndex:](self, "blacklistingRecordAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 24) = [(NSString *)self->_ssidHash copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_networkFlags;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_reserverdInfo;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  blacklistingRecords = self->_blacklistingRecords;
  uint64_t v8 = [(NSMutableArray *)blacklistingRecords countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(blacklistingRecords);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addBlacklistingRecord:v12];
      }
      uint64_t v9 = [(NSMutableArray *)blacklistingRecords countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    ssidHash = self->_ssidHash;
    if (!((unint64_t)ssidHash | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](ssidHash, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_networkFlags != *((_DWORD *)a3 + 4)) {
          goto LABEL_16;
        }
      }
      else if (*((unsigned char *)a3 + 32))
      {
LABEL_16:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_reserverdInfo != *((_DWORD *)a3 + 5)) {
          goto LABEL_16;
        }
      }
      else if ((*((unsigned char *)a3 + 32) & 2) != 0)
      {
        goto LABEL_16;
      }
      blacklistingRecords = self->_blacklistingRecords;
      if ((unint64_t)blacklistingRecords | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](blacklistingRecords, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_ssidHash hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_networkFlags;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_blacklistingRecords hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_reserverdInfo;
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_blacklistingRecords hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 3)) {
    -[AWDWiFiMetricsManagerBlacklistedNetworkInfo setSsidHash:](self, "setSsidHash:");
  }
  char v5 = *((unsigned char *)a3 + 32);
  if (v5)
  {
    self->_networkFlags = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_reserverdInfo = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = (void *)*((void *)a3 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDWiFiMetricsManagerBlacklistedNetworkInfo *)self addBlacklistingRecord:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)ssidHash
{
  return self->_ssidHash;
}

- (void)setSsidHash:(id)a3
{
}

- (unsigned)networkFlags
{
  return self->_networkFlags;
}

- (unsigned)reserverdInfo
{
  return self->_reserverdInfo;
}

- (NSMutableArray)blacklistingRecords
{
  return self->_blacklistingRecords;
}

- (void)setBlacklistingRecords:(id)a3
{
}

@end