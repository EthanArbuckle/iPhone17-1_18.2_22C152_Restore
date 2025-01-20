@interface WiFiAnalyticsAWDWiFiNWActivityInterfaceStats
+ (Class)awdlModeType;
+ (Class)bytesType;
+ (Class)enableStateType;
+ (Class)nssType;
+ (Class)packetsType;
+ (Class)peerType;
+ (Class)phymodeType;
- (BOOL)hasAssoc;
- (BOOL)hasConsecutivedps;
- (BOOL)hasDps;
- (BOOL)hasEnabled;
- (BOOL)hasRole;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)awdlModes;
- (NSMutableArray)bytes;
- (NSMutableArray)enableStates;
- (NSMutableArray)nss;
- (NSMutableArray)packets;
- (NSMutableArray)peers;
- (NSMutableArray)phymodes;
- (NSString)role;
- (WiFiAnalyticsAWDWiFiNWActivityAssoc)assoc;
- (id)awdlModeAtIndex:(unint64_t)a3;
- (id)bytesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enableStateAtIndex:(unint64_t)a3;
- (id)nssAtIndex:(unint64_t)a3;
- (id)packetsAtIndex:(unint64_t)a3;
- (id)peerAtIndex:(unint64_t)a3;
- (id)phymodeAtIndex:(unint64_t)a3;
- (unint64_t)awdlModesCount;
- (unint64_t)bytesCount;
- (unint64_t)enableStatesCount;
- (unint64_t)hash;
- (unint64_t)nssCount;
- (unint64_t)packetsCount;
- (unint64_t)peersCount;
- (unint64_t)phymodesCount;
- (unsigned)consecutivedps;
- (unsigned)dps;
- (unsigned)enabled;
- (void)addAwdlMode:(id)a3;
- (void)addBytes:(id)a3;
- (void)addEnableState:(id)a3;
- (void)addNss:(id)a3;
- (void)addPackets:(id)a3;
- (void)addPeer:(id)a3;
- (void)addPhymode:(id)a3;
- (void)clearAwdlModes;
- (void)clearBytes;
- (void)clearEnableStates;
- (void)clearNss;
- (void)clearPackets;
- (void)clearPeers;
- (void)clearPhymodes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssoc:(id)a3;
- (void)setAwdlModes:(id)a3;
- (void)setBytes:(id)a3;
- (void)setConsecutivedps:(unsigned int)a3;
- (void)setDps:(unsigned int)a3;
- (void)setEnableStates:(id)a3;
- (void)setEnabled:(unsigned int)a3;
- (void)setHasConsecutivedps:(BOOL)a3;
- (void)setHasDps:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setNss:(id)a3;
- (void)setPackets:(id)a3;
- (void)setPeers:(id)a3;
- (void)setPhymodes:(id)a3;
- (void)setRole:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityInterfaceStats

- (id)dictionaryRepresentation
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  role = self->_role;
  if (role) {
    [v3 setObject:role forKey:@"role"];
  }
  if ([(NSMutableArray *)self->_packets count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v7 = self->_packets;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v86 objects:v96 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v87 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v86 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v86 objects:v96 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"packets"];
  }
  if ([(NSMutableArray *)self->_bytes count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v14 = self->_bytes;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v82 objects:v95 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v83;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v83 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v82 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v82 objects:v95 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"bytes"];
  }
  if ([(NSMutableArray *)self->_peers count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_peers, "count"));
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v21 = self->_peers;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v78 objects:v94 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v79 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v78 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v78 objects:v94 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"peer"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v28 = [NSNumber numberWithUnsignedInt:self->_dps];
    [v4 setObject:v28 forKey:@"dps"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v29 = [NSNumber numberWithUnsignedInt:self->_consecutivedps];
    [v4 setObject:v29 forKey:@"consecutivedps"];
  }
  assoc = self->_assoc;
  if (assoc)
  {
    v31 = [(WiFiAnalyticsAWDWiFiNWActivityAssoc *)assoc dictionaryRepresentation];
    [v4 setObject:v31 forKey:@"assoc"];
  }
  if ([(NSMutableArray *)self->_awdlModes count])
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_awdlModes, "count"));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v33 = self->_awdlModes;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v74 objects:v93 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v75;
      do
      {
        for (uint64_t m = 0; m != v35; ++m)
        {
          if (*(void *)v75 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v74 + 1) + 8 * m) dictionaryRepresentation];
          [v32 addObject:v38];
        }
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v74 objects:v93 count:16];
      }
      while (v35);
    }

    [v4 setObject:v32 forKey:@"awdlMode"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v39 = [NSNumber numberWithUnsignedInt:self->_enabled];
    [v4 setObject:v39 forKey:@"enabled"];
  }
  if ([(NSMutableArray *)self->_enableStates count])
  {
    v40 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_enableStates, "count"));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v41 = self->_enableStates;
    uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v70 objects:v92 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v71;
      do
      {
        for (uint64_t n = 0; n != v43; ++n)
        {
          if (*(void *)v71 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = [*(id *)(*((void *)&v70 + 1) + 8 * n) dictionaryRepresentation];
          [v40 addObject:v46];
        }
        uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v70 objects:v92 count:16];
      }
      while (v43);
    }

    [v4 setObject:v40 forKey:@"enableState"];
  }
  if ([(NSMutableArray *)self->_nss count])
  {
    v47 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_nss, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v48 = self->_nss;
    uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v66 objects:v91 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v67;
      do
      {
        for (iuint64_t i = 0; ii != v50; ++ii)
        {
          if (*(void *)v67 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [*(id *)(*((void *)&v66 + 1) + 8 * ii) dictionaryRepresentation];
          [v47 addObject:v53];
        }
        uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v66 objects:v91 count:16];
      }
      while (v50);
    }

    [v4 setObject:v47 forKey:@"nss"];
  }
  if ([(NSMutableArray *)self->_phymodes count])
  {
    v54 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_phymodes, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v55 = self->_phymodes;
    uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v62 objects:v90 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v63;
      do
      {
        for (juint64_t j = 0; jj != v57; ++jj)
        {
          if (*(void *)v63 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * jj), "dictionaryRepresentation", (void)v62);
          [v54 addObject:v60];
        }
        uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v62 objects:v90 count:16];
      }
      while (v57);
    }

    [v4 setObject:v54 forKey:@"phymode"];
  }
  return v4;
}

- (void)addPeer:(id)a3
{
  id v4 = a3;
  peers = self->_peers;
  id v8 = v4;
  if (!peers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_peers;
    self->_peers = v6;

    id v4 = v8;
    peers = self->_peers;
  }
  [(NSMutableArray *)peers addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_role) {
    PBDataWriterWriteStringField();
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v5 = self->_packets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v7);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v10 = self->_bytes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v12);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v15 = self->_peers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v17);
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
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v21 = self->_awdlModes;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v53 objects:v72 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v54;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v53 objects:v72 count:16];
    }
    while (v23);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v26 = self->_enableStates;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v49 objects:v71 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v50;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v49 objects:v71 count:16];
    }
    while (v28);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v31 = self->_nss;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v45 objects:v70 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v46;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v45 objects:v70 count:16];
    }
    while (v33);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v36 = self->_phymodes;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v41 objects:v69 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v42;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v41 objects:v69 count:16];
    }
    while (v38);
  }
}

- (void)addPhymode:(id)a3
{
  id v4 = a3;
  phymodes = self->_phymodes;
  id v8 = v4;
  if (!phymodes)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_phymodes;
    self->_phymodes = v6;

    id v4 = v8;
    phymodes = self->_phymodes;
  }
  [(NSMutableArray *)phymodes addObject:v4];
}

- (void)addPackets:(id)a3
{
  id v4 = a3;
  packets = self->_packets;
  id v8 = v4;
  if (!packets)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_packets;
    self->_packets = v6;

    id v4 = v8;
    packets = self->_packets;
  }
  [(NSMutableArray *)packets addObject:v4];
}

- (void)addBytes:(id)a3
{
  id v4 = a3;
  bytes = self->_bytes;
  id v8 = v4;
  if (!bytes)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_bytes;
    self->_bytes = v6;

    id v4 = v8;
    bytes = self->_bytes;
  }
  [(NSMutableArray *)bytes addObject:v4];
}

- (void)addNss:(id)a3
{
  id v4 = a3;
  nss = self->_nss;
  id v8 = v4;
  if (!nss)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_nss;
    self->_nss = v6;

    id v4 = v8;
    nss = self->_nss;
  }
  [(NSMutableArray *)nss addObject:v4];
}

- (void)addEnableState:(id)a3
{
  id v4 = a3;
  enableStates = self->_enableStates;
  id v8 = v4;
  if (!enableStates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_enableStates;
    self->_enableStates = v6;

    id v4 = v8;
    enableStates = self->_enableStates;
  }
  [(NSMutableArray *)enableStates addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_phymodes, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_nss, 0);
  objc_storeStrong((id *)&self->_enableStates, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_awdlModes, 0);
  objc_storeStrong((id *)&self->_assoc, 0);
}

- (void)setRole:(id)a3
{
}

- (void)setEnabled:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_enabled = a3;
}

- (void)setDps:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dps = a3;
}

- (void)setConsecutivedps:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_consecutivedps = a3;
}

- (void)setAssoc:(id)a3
{
}

- (BOOL)hasRole
{
  return self->_role != 0;
}

- (void)clearPackets
{
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

- (void)setHasDps:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDps
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasConsecutivedps:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConsecutivedps
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAssoc
{
  return self->_assoc != 0;
}

- (void)clearAwdlModes
{
}

- (void)addAwdlMode:(id)a3
{
  id v4 = a3;
  awdlModes = self->_awdlModes;
  id v8 = v4;
  if (!awdlModes)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_awdlModes;
    self->_awdlModes = v6;

    id v4 = v8;
    awdlModes = self->_awdlModes;
  }
  [(NSMutableArray *)awdlModes addObject:v4];
}

- (unint64_t)awdlModesCount
{
  return [(NSMutableArray *)self->_awdlModes count];
}

- (id)awdlModeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_awdlModes objectAtIndex:a3];
}

+ (Class)awdlModeType
{
  return (Class)objc_opt_class();
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearEnableStates
{
}

- (unint64_t)enableStatesCount
{
  return [(NSMutableArray *)self->_enableStates count];
}

- (id)enableStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_enableStates objectAtIndex:a3];
}

+ (Class)enableStateType
{
  return (Class)objc_opt_class();
}

- (void)clearNss
{
}

- (unint64_t)nssCount
{
  return [(NSMutableArray *)self->_nss count];
}

- (id)nssAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nss objectAtIndex:a3];
}

+ (Class)nssType
{
  return (Class)objc_opt_class();
}

- (void)clearPhymodes
{
}

- (unint64_t)phymodesCount
{
  return [(NSMutableArray *)self->_phymodes count];
}

- (id)phymodeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_phymodes objectAtIndex:a3];
}

+ (Class)phymodeType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityInterfaceStats;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v33 = a3;
  if (self->_role) {
    objc_msgSend(v33, "setRole:");
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self packetsCount])
  {
    [v33 clearPackets];
    unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self packetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self packetsAtIndex:i];
        [v33 addPackets:v7];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self bytesCount])
  {
    [v33 clearBytes];
    unint64_t v8 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self bytesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self bytesAtIndex:j];
        [v33 addBytes:v11];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self peersCount])
  {
    [v33 clearPeers];
    unint64_t v12 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self peersCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self peerAtIndex:k];
        [v33 addPeer:v15];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v33 + 9) = self->_dps;
    *((unsigned char *)v33 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v33 + 8) = self->_consecutivedps;
    *((unsigned char *)v33 + 96) |= 1u;
  }
  if (self->_assoc) {
    objc_msgSend(v33, "setAssoc:");
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self awdlModesCount])
  {
    [v33 clearAwdlModes];
    unint64_t v17 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self awdlModesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self awdlModeAtIndex:m];
        [v33 addAwdlMode:v20];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v33 + 12) = self->_enabled;
    *((unsigned char *)v33 + 96) |= 4u;
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self enableStatesCount])
  {
    [v33 clearEnableStates];
    unint64_t v21 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self enableStatesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self enableStateAtIndex:n];
        [v33 addEnableState:v24];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self nssCount])
  {
    [v33 clearNss];
    unint64_t v25 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self nssCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self nssAtIndex:ii];
        [v33 addNss:v28];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self phymodesCount])
  {
    [v33 clearPhymodes];
    unint64_t v29 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self phymodesCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self phymodeAtIndex:jj];
        [v33 addPhymode:v32];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_role copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  unint64_t v8 = self->_packets;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v79 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPackets:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v78 objects:v88 count:16];
    }
    while (v10);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v14 = self->_bytes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v75 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBytes:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v74 objects:v87 count:16];
    }
    while (v16);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v20 = self->_peers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v70 objects:v86 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v71 != v23) {
          objc_enumerationMutation(v20);
        }
        unint64_t v25 = (void *)[*(id *)(*((void *)&v70 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addPeer:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v70 objects:v86 count:16];
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_dps;
    *(unsigned char *)(v5 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 32) = self->_consecutivedps;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  id v27 = [(WiFiAnalyticsAWDWiFiNWActivityAssoc *)self->_assoc copyWithZone:a3];
  uint64_t v28 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v27;

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  unint64_t v29 = self->_awdlModes;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v66 objects:v85 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v67;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v67 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addAwdlMode:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v66 objects:v85 count:16];
    }
    while (v31);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_enabled;
    *(unsigned char *)(v5 + 96) |= 4u;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v35 = self->_enableStates;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v62 objects:v84 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v63;
    do
    {
      for (uint64_t n = 0; n != v37; ++n)
      {
        if (*(void *)v63 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addEnableState:v40];
      }
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v62 objects:v84 count:16];
    }
    while (v37);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v41 = self->_nss;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v58 objects:v83 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v59;
    do
    {
      for (iuint64_t i = 0; ii != v43; ++ii)
      {
        if (*(void *)v59 != v44) {
          objc_enumerationMutation(v41);
        }
        long long v46 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addNss:v46];
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v58 objects:v83 count:16];
    }
    while (v43);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v47 = self->_phymodes;
  uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v54 objects:v82 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v55;
    do
    {
      for (juint64_t j = 0; jj != v49; ++jj)
      {
        if (*(void *)v55 != v50) {
          objc_enumerationMutation(v47);
        }
        long long v52 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * jj), "copyWithZone:", a3, (void)v54);
        [(id)v5 addPhymode:v52];
      }
      uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v54 objects:v82 count:16];
    }
    while (v49);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  role = self->_role;
  if ((unint64_t)role | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](role, "isEqual:")) {
      goto LABEL_35;
    }
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:")) {
      goto LABEL_35;
    }
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:")) {
      goto LABEL_35;
    }
  }
  peers = self->_peers;
  if ((unint64_t)peers | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](peers, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_dps != *((_DWORD *)v4 + 9)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_35:
    char v14 = 0;
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_consecutivedps != *((_DWORD *)v4 + 8)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_35;
  }
  assoc = self->_assoc;
  if ((unint64_t)assoc | *((void *)v4 + 1)
    && !-[WiFiAnalyticsAWDWiFiNWActivityAssoc isEqual:](assoc, "isEqual:"))
  {
    goto LABEL_35;
  }
  awdlModes = self->_awdlModes;
  if ((unint64_t)awdlModes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](awdlModes, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_enabled != *((_DWORD *)v4 + 12)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_35;
  }
  enableStates = self->_enableStates;
  if ((unint64_t)enableStates | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](enableStates, "isEqual:"))
  {
    goto LABEL_35;
  }
  nss = self->_nss;
  if ((unint64_t)nss | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](nss, "isEqual:")) {
      goto LABEL_35;
    }
  }
  phymodes = self->_phymodes;
  if ((unint64_t)phymodes | *((void *)v4 + 10)) {
    char v14 = -[NSMutableArray isEqual:](phymodes, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_role hash];
  uint64_t v4 = [(NSMutableArray *)self->_packets hash];
  uint64_t v5 = [(NSMutableArray *)self->_bytes hash];
  uint64_t v6 = [(NSMutableArray *)self->_peers hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_dps;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_consecutivedps;
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  unint64_t v9 = [(WiFiAnalyticsAWDWiFiNWActivityAssoc *)self->_assoc hash];
  uint64_t v10 = [(NSMutableArray *)self->_awdlModes hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_enabled;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  uint64_t v13 = v11 ^ [(NSMutableArray *)self->_enableStates hash];
  uint64_t v14 = v13 ^ [(NSMutableArray *)self->_nss hash];
  return v12 ^ v14 ^ [(NSMutableArray *)self->_phymodes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 11)) {
    -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats setRole:](self, "setRole:");
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v5 = *((id *)v4 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self addPackets:*(void *)(*((void *)&v67 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v67 objects:v77 count:16];
    }
    while (v7);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v64 != v13) {
          objc_enumerationMutation(v10);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self addBytes:*(void *)(*((void *)&v63 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v12);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v15 = *((id *)v4 + 9);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v75 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v60 != v18) {
          objc_enumerationMutation(v15);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self addPeer:*(void *)(*((void *)&v59 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v75 count:16];
    }
    while (v17);
  }

  char v20 = *((unsigned char *)v4 + 96);
  if ((v20 & 2) != 0)
  {
    self->_dps = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
    char v20 = *((unsigned char *)v4 + 96);
  }
  if (v20)
  {
    self->_consecutivedps = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  assoc = self->_assoc;
  uint64_t v22 = *((void *)v4 + 1);
  if (assoc)
  {
    if (v22) {
      -[WiFiAnalyticsAWDWiFiNWActivityAssoc mergeFrom:](assoc, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats setAssoc:](self, "setAssoc:");
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v23 = *((id *)v4 + 2);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v55 objects:v74 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v56;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v56 != v26) {
          objc_enumerationMutation(v23);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self addAwdlMode:*(void *)(*((void *)&v55 + 1) + 8 * m)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v55 objects:v74 count:16];
    }
    while (v25);
  }

  if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    self->_enabled = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v28 = *((id *)v4 + 5);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v73 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (uint64_t n = 0; n != v30; ++n)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v28);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self addEnableState:*(void *)(*((void *)&v51 + 1) + 8 * n)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v73 count:16];
    }
    while (v30);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v33 = *((id *)v4 + 7);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v72 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      for (iuint64_t i = 0; ii != v35; ++ii)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityInterfaceStats *)self addNss:*(void *)(*((void *)&v47 + 1) + 8 * ii)];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v72 count:16];
    }
    while (v35);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v38 = *((id *)v4 + 10);
  uint64_t v39 = [v38 countByEnumeratingWithState:&v43 objects:v71 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v44;
    do
    {
      for (juint64_t j = 0; jj != v40; ++jj)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(v38);
        }
        -[WiFiAnalyticsAWDWiFiNWActivityInterfaceStats addPhymode:](self, "addPhymode:", *(void *)(*((void *)&v43 + 1) + 8 * jj), (void)v43);
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v43 objects:v71 count:16];
    }
    while (v40);
  }
}

- (NSString)role
{
  return self->_role;
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

- (unsigned)dps
{
  return self->_dps;
}

- (unsigned)consecutivedps
{
  return self->_consecutivedps;
}

- (WiFiAnalyticsAWDWiFiNWActivityAssoc)assoc
{
  return self->_assoc;
}

- (NSMutableArray)awdlModes
{
  return self->_awdlModes;
}

- (void)setAwdlModes:(id)a3
{
}

- (unsigned)enabled
{
  return self->_enabled;
}

- (NSMutableArray)enableStates
{
  return self->_enableStates;
}

- (void)setEnableStates:(id)a3
{
}

- (NSMutableArray)nss
{
  return self->_nss;
}

- (void)setNss:(id)a3
{
}

- (NSMutableArray)phymodes
{
  return self->_phymodes;
}

- (void)setPhymodes:(id)a3
{
}

@end