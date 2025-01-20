@interface AWDWiFiNWActivityInterfaceStats
+ (Class)bytesType;
+ (Class)npeersType;
+ (Class)packetsType;
+ (Class)peerType;
- (AWDWiFiNWActivityAssoc)assoc;
- (AWDWiFiNWActivityStateBin)awdlMode;
- (BOOL)hasAssoc;
- (BOOL)hasAwdlMode;
- (BOOL)hasConsecutivedps;
- (BOOL)hasDps;
- (BOOL)hasRole;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bytes;
- (NSMutableArray)npeers;
- (NSMutableArray)packets;
- (NSMutableArray)peers;
- (id)bytesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)npeersAtIndex:(unint64_t)a3;
- (id)packetsAtIndex:(unint64_t)a3;
- (id)peerAtIndex:(unint64_t)a3;
- (id)roleAsString:(int)a3;
- (int)StringAsRole:(id)a3;
- (int)role;
- (unint64_t)bytesCount;
- (unint64_t)hash;
- (unint64_t)npeersCount;
- (unint64_t)packetsCount;
- (unint64_t)peersCount;
- (unsigned)consecutivedps;
- (unsigned)dps;
- (void)addBytes:(id)a3;
- (void)addNpeers:(id)a3;
- (void)addPackets:(id)a3;
- (void)addPeer:(id)a3;
- (void)clearBytes;
- (void)clearNpeers;
- (void)clearPackets;
- (void)clearPeers;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssoc:(id)a3;
- (void)setAwdlMode:(id)a3;
- (void)setBytes:(id)a3;
- (void)setConsecutivedps:(unsigned int)a3;
- (void)setDps:(unsigned int)a3;
- (void)setHasConsecutivedps:(BOOL)a3;
- (void)setHasDps:(BOOL)a3;
- (void)setHasRole:(BOOL)a3;
- (void)setNpeers:(id)a3;
- (void)setPackets:(id)a3;
- (void)setPeers:(id)a3;
- (void)setRole:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityInterfaceStats

- (void)dealloc
{
  [(AWDWiFiNWActivityInterfaceStats *)self setPackets:0];
  [(AWDWiFiNWActivityInterfaceStats *)self setBytes:0];
  [(AWDWiFiNWActivityInterfaceStats *)self setPeers:0];
  [(AWDWiFiNWActivityInterfaceStats *)self setNpeers:0];
  [(AWDWiFiNWActivityInterfaceStats *)self setAssoc:0];
  [(AWDWiFiNWActivityInterfaceStats *)self setAwdlMode:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityInterfaceStats;
  [(AWDWiFiNWActivityInterfaceStats *)&v3 dealloc];
}

- (int)role
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_role;
  }
  else {
    return 0;
  }
}

- (void)setRole:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRole
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA328[a3];
  }
}

- (int)StringAsRole:(id)a3
{
  if ([a3 isEqualToString:@"INFRA"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"LEGACYAWDL"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"LLWAWDL"]) {
    return 2;
  }
  return 0;
}

- (void)clearPackets
{
}

- (void)addPackets:(id)a3
{
  packets = self->_packets;
  if (!packets)
  {
    packets = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_packets = packets;
  }

  [(NSMutableArray *)packets addObject:a3];
}

- (unint64_t)packetsCount
{
  return [(NSMutableArray *)self->_packets count];
}

- (id)packetsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_packets objectAtIndex:a3];
}

+ (Class)packetsType
{
  return (Class)objc_opt_class();
}

- (void)clearBytes
{
}

- (void)addBytes:(id)a3
{
  bytes = self->_bytes;
  if (!bytes)
  {
    bytes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_bytes = bytes;
  }

  [(NSMutableArray *)bytes addObject:a3];
}

- (unint64_t)bytesCount
{
  return [(NSMutableArray *)self->_bytes count];
}

- (id)bytesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bytes objectAtIndex:a3];
}

+ (Class)bytesType
{
  return (Class)objc_opt_class();
}

- (void)clearPeers
{
}

- (void)addPeer:(id)a3
{
  peers = self->_peers;
  if (!peers)
  {
    peers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_peers = peers;
  }

  [(NSMutableArray *)peers addObject:a3];
}

- (unint64_t)peersCount
{
  return [(NSMutableArray *)self->_peers count];
}

- (id)peerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_peers objectAtIndex:a3];
}

+ (Class)peerType
{
  return (Class)objc_opt_class();
}

- (void)clearNpeers
{
}

- (void)addNpeers:(id)a3
{
  npeers = self->_npeers;
  if (!npeers)
  {
    npeers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_npeers = npeers;
  }

  [(NSMutableArray *)npeers addObject:a3];
}

- (unint64_t)npeersCount
{
  return [(NSMutableArray *)self->_npeers count];
}

- (id)npeersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_npeers objectAtIndex:a3];
}

+ (Class)npeersType
{
  return (Class)objc_opt_class();
}

- (void)setDps:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dps = a3;
}

- (void)setHasDps:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDps
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConsecutivedps:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_consecutivedps = a3;
}

- (void)setHasConsecutivedps:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConsecutivedps
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAssoc
{
  return self->_assoc != 0;
}

- (BOOL)hasAwdlMode
{
  return self->_awdlMode != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityInterfaceStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityInterfaceStats description](&v3, sel_description), -[AWDWiFiNWActivityInterfaceStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t role = self->_role;
    if (role >= 3) {
      v5 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_role];
    }
    else {
      v5 = off_2641BA328[role];
    }
    [v3 setObject:v5 forKey:@"role"];
  }
  if ([(NSMutableArray *)self->_packets count])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_packets, "count")];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    packets = self->_packets;
    uint64_t v8 = [(NSMutableArray *)packets countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(packets);
          }
          [v6 addObject:[*(id *)(*((void *)&v46 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v9 = [(NSMutableArray *)packets countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v9);
    }
    [v3 setObject:v6 forKey:@"packets"];
  }
  if ([(NSMutableArray *)self->_bytes count])
  {
    v12 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_bytes, "count")];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    bytes = self->_bytes;
    uint64_t v14 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(bytes);
          }
          [v12 addObject:[(*(id *)(*((void *)&v42 + 1) + 8 * j)) dictionaryRepresentation]];
        }
        uint64_t v15 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v15);
    }
    [v3 setObject:v12 forKey:@"bytes"];
  }
  if ([(NSMutableArray *)self->_peers count])
  {
    v18 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_peers, "count")];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    peers = self->_peers;
    uint64_t v20 = [(NSMutableArray *)peers countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(peers);
          }
          [v18 addObject:[*(id *)(*((void *)&v38 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v21 = [(NSMutableArray *)peers countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v21);
    }
    [v3 setObject:v18 forKey:@"peer"];
  }
  if ([(NSMutableArray *)self->_npeers count])
  {
    v24 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_npeers, "count")];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    npeers = self->_npeers;
    uint64_t v26 = [(NSMutableArray *)npeers countByEnumeratingWithState:&v34 objects:v50 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (uint64_t m = 0; m != v27; ++m)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(npeers);
          }
          [v24 addObject:[*(id *)(*((void *)&v34 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v27 = [(NSMutableArray *)npeers countByEnumeratingWithState:&v34 objects:v50 count:16];
      }
      while (v27);
    }
    [v3 setObject:v24 forKey:@"npeers"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dps] forKey:@"dps"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_consecutivedps] forKey:@"consecutivedps"];
  }
  assoc = self->_assoc;
  if (assoc) {
    [v3 setObject:-[AWDWiFiNWActivityAssoc dictionaryRepresentation](assoc, "dictionaryRepresentation") forKey:@"assoc"];
  }
  awdlMode = self->_awdlMode;
  if (awdlMode) {
    [v3 setObject:[[-[AWDWiFiNWActivityStateBin dictionaryRepresentation](awdlMode, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"awdlMode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  packets = self->_packets;
  uint64_t v5 = [(NSMutableArray *)packets countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(packets);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)packets countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v6);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  bytes = self->_bytes;
  uint64_t v10 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(bytes);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v11);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  peers = self->_peers;
  uint64_t v15 = [(NSMutableArray *)peers countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(peers);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSMutableArray *)peers countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v16);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  npeers = self->_npeers;
  uint64_t v20 = [(NSMutableArray *)npeers countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(npeers);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)npeers countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v21);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_assoc) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_awdlMode) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_role;
    *((unsigned char *)a3 + 68) |= 4u;
  }
  if ([(AWDWiFiNWActivityInterfaceStats *)self packetsCount])
  {
    [a3 clearPackets];
    unint64_t v5 = [(AWDWiFiNWActivityInterfaceStats *)self packetsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addPackets:-[AWDWiFiNWActivityInterfaceStats packetsAtIndex:](self, "packetsAtIndex:", i)];
    }
  }
  if ([(AWDWiFiNWActivityInterfaceStats *)self bytesCount])
  {
    [a3 clearBytes];
    unint64_t v8 = [(AWDWiFiNWActivityInterfaceStats *)self bytesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addBytes:-[AWDWiFiNWActivityInterfaceStats bytesAtIndex:](self, "bytesAtIndex:", j)];
    }
  }
  if ([(AWDWiFiNWActivityInterfaceStats *)self peersCount])
  {
    [a3 clearPeers];
    unint64_t v11 = [(AWDWiFiNWActivityInterfaceStats *)self peersCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addPeer:[[self peerAtIndex:k]];
    }
  }
  if ([(AWDWiFiNWActivityInterfaceStats *)self npeersCount])
  {
    [a3 clearNpeers];
    unint64_t v14 = [(AWDWiFiNWActivityInterfaceStats *)self npeersCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addNpeers:-[AWDWiFiNWActivityInterfaceStats npeersAtIndex:](self, "npeersAtIndex:", m)];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_dps;
    *((unsigned char *)a3 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)a3 + 8) = self->_consecutivedps;
    *((unsigned char *)a3 + 68) |= 1u;
  }
  if (self->_assoc) {
    [a3 setAssoc:];
  }
  if (self->_awdlMode)
  {
    [a3 setAwdlMode:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_role;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  packets = self->_packets;
  uint64_t v8 = [(NSMutableArray *)packets countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(packets);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addPackets:v12];
      }
      uint64_t v9 = [(NSMutableArray *)packets countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v9);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  bytes = self->_bytes;
  uint64_t v14 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(bytes);
        }
        v18 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addBytes:v18];
      }
      uint64_t v15 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v15);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  peers = self->_peers;
  uint64_t v20 = [(NSMutableArray *)peers countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(peers);
        }
        v24 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addPeer:v24];
      }
      uint64_t v21 = [(NSMutableArray *)peers countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v21);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  npeers = self->_npeers;
  uint64_t v26 = [(NSMutableArray *)npeers countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(npeers);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addNpeers:v30];
      }
      uint64_t v27 = [(NSMutableArray *)npeers countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v27);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_dps;
    *(unsigned char *)(v6 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v6 + 32) = self->_consecutivedps;
    *(unsigned char *)(v6 + 68) |= 1u;
  }

  *(void *)(v6 + 8) = [(AWDWiFiNWActivityAssoc *)self->_assoc copyWithZone:a3];
  *(void *)(v6 + 16) = [(AWDWiFiNWActivityStateBin *)self->_awdlMode copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 68) & 4) == 0 || self->_role != *((_DWORD *)a3 + 16)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 68) & 4) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    packets = self->_packets;
    if (!((unint64_t)packets | *((void *)a3 + 6))
      || (int v5 = -[NSMutableArray isEqual:](packets, "isEqual:")) != 0)
    {
      bytes = self->_bytes;
      if (!((unint64_t)bytes | *((void *)a3 + 3)) || (int v5 = -[NSMutableArray isEqual:](bytes, "isEqual:")) != 0)
      {
        peers = self->_peers;
        if (!((unint64_t)peers | *((void *)a3 + 7))
          || (int v5 = -[NSMutableArray isEqual:](peers, "isEqual:")) != 0)
        {
          npeers = self->_npeers;
          if (!((unint64_t)npeers | *((void *)a3 + 5))
            || (int v5 = -[NSMutableArray isEqual:](npeers, "isEqual:")) != 0)
          {
            if ((*(unsigned char *)&self->_has & 2) != 0)
            {
              if ((*((unsigned char *)a3 + 68) & 2) == 0 || self->_dps != *((_DWORD *)a3 + 9)) {
                goto LABEL_29;
              }
            }
            else if ((*((unsigned char *)a3 + 68) & 2) != 0)
            {
              goto LABEL_29;
            }
            if (*(unsigned char *)&self->_has)
            {
              if ((*((unsigned char *)a3 + 68) & 1) == 0 || self->_consecutivedps != *((_DWORD *)a3 + 8)) {
                goto LABEL_29;
              }
            }
            else if (*((unsigned char *)a3 + 68))
            {
              goto LABEL_29;
            }
            assoc = self->_assoc;
            if (!((unint64_t)assoc | *((void *)a3 + 1))
              || (int v5 = -[AWDWiFiNWActivityAssoc isEqual:](assoc, "isEqual:")) != 0)
            {
              awdlMode = self->_awdlMode;
              if ((unint64_t)awdlMode | *((void *)a3 + 2))
              {
                LOBYTE(v5) = -[AWDWiFiNWActivityStateBin isEqual:](awdlMode, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_role;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_packets hash];
  uint64_t v5 = [(NSMutableArray *)self->_bytes hash];
  uint64_t v6 = [(NSMutableArray *)self->_peers hash];
  uint64_t v7 = [(NSMutableArray *)self->_npeers hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_dps;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_consecutivedps;
LABEL_9:
  uint64_t v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v11 = [(AWDWiFiNWActivityAssoc *)self->_assoc hash];
  return v10 ^ v11 ^ [(AWDWiFiNWActivityStateBin *)self->_awdlMode hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)a3 + 68) & 4) != 0)
  {
    self->_uint64_t role = *((_DWORD *)a3 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDWiFiNWActivityInterfaceStats *)self addPackets:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v7);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDWiFiNWActivityInterfaceStats *)self addBytes:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v12);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v15 = (void *)*((void *)a3 + 7);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        [(AWDWiFiNWActivityInterfaceStats *)self addPeer:*(void *)(*((void *)&v34 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v17);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = (void *)*((void *)a3 + 5);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        [(AWDWiFiNWActivityInterfaceStats *)self addNpeers:*(void *)(*((void *)&v30 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v22);
  }
  char v25 = *((unsigned char *)a3 + 68);
  if ((v25 & 2) != 0)
  {
    self->_dps = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 2u;
    char v25 = *((unsigned char *)a3 + 68);
  }
  if (v25)
  {
    self->_consecutivedps = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  assoc = self->_assoc;
  uint64_t v27 = *((void *)a3 + 1);
  if (assoc)
  {
    if (v27) {
      -[AWDWiFiNWActivityAssoc mergeFrom:](assoc, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[AWDWiFiNWActivityInterfaceStats setAssoc:](self, "setAssoc:");
  }
  awdlMode = self->_awdlMode;
  uint64_t v29 = *((void *)a3 + 2);
  if (awdlMode)
  {
    if (v29) {
      -[AWDWiFiNWActivityStateBin mergeFrom:](awdlMode, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[AWDWiFiNWActivityInterfaceStats setAwdlMode:](self, "setAwdlMode:");
  }
}

- (NSMutableArray)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
}

- (NSMutableArray)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
}

- (NSMutableArray)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
}

- (NSMutableArray)npeers
{
  return self->_npeers;
}

- (void)setNpeers:(id)a3
{
}

- (unsigned)dps
{
  return self->_dps;
}

- (unsigned)consecutivedps
{
  return self->_consecutivedps;
}

- (AWDWiFiNWActivityAssoc)assoc
{
  return self->_assoc;
}

- (void)setAssoc:(id)a3
{
}

- (AWDWiFiNWActivityStateBin)awdlMode
{
  return self->_awdlMode;
}

- (void)setAwdlMode:(id)a3
{
}

@end