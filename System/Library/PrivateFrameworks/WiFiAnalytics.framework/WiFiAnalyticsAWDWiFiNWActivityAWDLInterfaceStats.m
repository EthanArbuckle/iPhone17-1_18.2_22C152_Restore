@interface WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats
+ (Class)awdlStateType;
+ (Class)bytesType;
+ (Class)enableStateType;
+ (Class)npeersType;
+ (Class)nrtpeersType;
+ (Class)packetsType;
+ (Class)txLatencyBEType;
+ (Class)txLatencyBKType;
+ (Class)txLatencyVIType;
+ (Class)txLatencyVOType;
- (BOOL)hasAfCount;
- (BOOL)hasEnabled;
- (BOOL)hasPeerCount;
- (BOOL)hasPeersAdded;
- (BOOL)hasPeersRemoved;
- (BOOL)hasRole;
- (BOOL)hasRtPeerCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)awdlStates;
- (NSMutableArray)bytes;
- (NSMutableArray)enableStates;
- (NSMutableArray)npeers;
- (NSMutableArray)nrtpeers;
- (NSMutableArray)packets;
- (NSMutableArray)txLatencyBEs;
- (NSMutableArray)txLatencyBKs;
- (NSMutableArray)txLatencyVIs;
- (NSMutableArray)txLatencyVOs;
- (NSString)role;
- (id)awdlStateAtIndex:(unint64_t)a3;
- (id)bytesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enableStateAtIndex:(unint64_t)a3;
- (id)npeersAtIndex:(unint64_t)a3;
- (id)nrtpeersAtIndex:(unint64_t)a3;
- (id)packetsAtIndex:(unint64_t)a3;
- (id)txLatencyBEAtIndex:(unint64_t)a3;
- (id)txLatencyBKAtIndex:(unint64_t)a3;
- (id)txLatencyVIAtIndex:(unint64_t)a3;
- (id)txLatencyVOAtIndex:(unint64_t)a3;
- (unint64_t)awdlStatesCount;
- (unint64_t)bytesCount;
- (unint64_t)enableStatesCount;
- (unint64_t)hash;
- (unint64_t)npeersCount;
- (unint64_t)nrtpeersCount;
- (unint64_t)packetsCount;
- (unint64_t)txLatencyBEsCount;
- (unint64_t)txLatencyBKsCount;
- (unint64_t)txLatencyVIsCount;
- (unint64_t)txLatencyVOsCount;
- (unsigned)afCount;
- (unsigned)enabled;
- (unsigned)peerCount;
- (unsigned)peersAdded;
- (unsigned)peersRemoved;
- (unsigned)rtPeerCount;
- (void)addAwdlState:(id)a3;
- (void)addBytes:(id)a3;
- (void)addEnableState:(id)a3;
- (void)addNpeers:(id)a3;
- (void)addNrtpeers:(id)a3;
- (void)addPackets:(id)a3;
- (void)addTxLatencyBE:(id)a3;
- (void)addTxLatencyBK:(id)a3;
- (void)addTxLatencyVI:(id)a3;
- (void)addTxLatencyVO:(id)a3;
- (void)clearAwdlStates;
- (void)clearBytes;
- (void)clearEnableStates;
- (void)clearNpeers;
- (void)clearNrtpeers;
- (void)clearPackets;
- (void)clearTxLatencyBEs;
- (void)clearTxLatencyBKs;
- (void)clearTxLatencyVIs;
- (void)clearTxLatencyVOs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAfCount:(unsigned int)a3;
- (void)setAwdlStates:(id)a3;
- (void)setBytes:(id)a3;
- (void)setEnableStates:(id)a3;
- (void)setEnabled:(unsigned int)a3;
- (void)setHasAfCount:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasPeerCount:(BOOL)a3;
- (void)setHasPeersAdded:(BOOL)a3;
- (void)setHasPeersRemoved:(BOOL)a3;
- (void)setHasRtPeerCount:(BOOL)a3;
- (void)setNpeers:(id)a3;
- (void)setNrtpeers:(id)a3;
- (void)setPackets:(id)a3;
- (void)setPeerCount:(unsigned int)a3;
- (void)setPeersAdded:(unsigned int)a3;
- (void)setPeersRemoved:(unsigned int)a3;
- (void)setRole:(id)a3;
- (void)setRtPeerCount:(unsigned int)a3;
- (void)setTxLatencyBEs:(id)a3;
- (void)setTxLatencyBKs:(id)a3;
- (void)setTxLatencyVIs:(id)a3;
- (void)setTxLatencyVOs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txLatencyVOs, 0);
  objc_storeStrong((id *)&self->_txLatencyVIs, 0);
  objc_storeStrong((id *)&self->_txLatencyBKs, 0);
  objc_storeStrong((id *)&self->_txLatencyBEs, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_nrtpeers, 0);
  objc_storeStrong((id *)&self->_npeers, 0);
  objc_storeStrong((id *)&self->_enableStates, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_awdlStates, 0);
}

- (void)addNrtpeers:(id)a3
{
  id v4 = a3;
  nrtpeers = self->_nrtpeers;
  id v8 = v4;
  if (!nrtpeers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_nrtpeers;
    self->_nrtpeers = v6;

    id v4 = v8;
    nrtpeers = self->_nrtpeers;
  }
  [(NSMutableArray *)nrtpeers addObject:v4];
}

- (void)addNpeers:(id)a3
{
  id v4 = a3;
  npeers = self->_npeers;
  id v8 = v4;
  if (!npeers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_npeers;
    self->_npeers = v6;

    id v4 = v8;
    npeers = self->_npeers;
  }
  [(NSMutableArray *)npeers addObject:v4];
}

- (void)addPackets:(id)a3
{
  id v4 = a3;
  packets = self->_packets;
  id v8 = v4;
  if (!packets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_packets;
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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_bytes;
    self->_bytes = v6;

    id v4 = v8;
    bytes = self->_bytes;
  }
  [(NSMutableArray *)bytes addObject:v4];
}

- (void)addEnableState:(id)a3
{
  id v4 = a3;
  enableStates = self->_enableStates;
  id v8 = v4;
  if (!enableStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_enableStates;
    self->_enableStates = v6;

    id v4 = v8;
    enableStates = self->_enableStates;
  }
  [(NSMutableArray *)enableStates addObject:v4];
}

- (id)dictionaryRepresentation
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  role = self->_role;
  if (role) {
    [v3 setObject:role forKey:@"role"];
  }
  if ([(NSMutableArray *)self->_packets count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    v7 = self->_packets;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v120 objects:v133 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v121 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v120 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v120 objects:v133 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"packets"];
  }
  if ([(NSMutableArray *)self->_bytes count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v14 = self->_bytes;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v116 objects:v132 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v117;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v117 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v116 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v116 objects:v132 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"bytes"];
  }
  if ([(NSMutableArray *)self->_npeers count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_npeers, "count"));
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v21 = self->_npeers;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v112 objects:v131 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v113;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v113 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v112 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v112 objects:v131 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"npeers"];
  }
  if ([(NSMutableArray *)self->_nrtpeers count])
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_nrtpeers, "count"));
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v28 = self->_nrtpeers;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v108 objects:v130 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v109;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v109 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v108 + 1) + 8 * m) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v108 objects:v130 count:16];
      }
      while (v30);
    }

    [v4 setObject:v27 forKey:@"nrtpeers"];
  }
  if ([(NSMutableArray *)self->_awdlStates count])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_awdlStates, "count"));
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v35 = self->_awdlStates;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v104 objects:v129 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v105;
      do
      {
        for (uint64_t n = 0; n != v37; ++n)
        {
          if (*(void *)v105 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v104 + 1) + 8 * n) dictionaryRepresentation];
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v104 objects:v129 count:16];
      }
      while (v37);
    }

    [v4 setObject:v34 forKey:@"awdlState"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v80 = [NSNumber numberWithUnsignedInt:self->_rtPeerCount];
    [v4 setObject:v80 forKey:@"rtPeerCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_50:
      if ((has & 8) == 0) {
        goto LABEL_51;
      }
      goto LABEL_106;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_50;
  }
  v81 = [NSNumber numberWithUnsignedInt:self->_peerCount];
  [v4 setObject:v81 forKey:@"peerCount"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_51:
    if ((has & 0x10) == 0) {
      goto LABEL_52;
    }
    goto LABEL_107;
  }
LABEL_106:
  v82 = [NSNumber numberWithUnsignedInt:self->_peersAdded];
  [v4 setObject:v82 forKey:@"peersAdded"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_52:
    if ((has & 2) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_107:
  v83 = [NSNumber numberWithUnsignedInt:self->_peersRemoved];
  [v4 setObject:v83 forKey:@"peersRemoved"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_53:
    v42 = [NSNumber numberWithUnsignedInt:self->_enabled];
    [v4 setObject:v42 forKey:@"enabled"];
  }
LABEL_54:
  if ([(NSMutableArray *)self->_enableStates count])
  {
    v43 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_enableStates, "count"));
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v44 = self->_enableStates;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v100 objects:v128 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v101;
      do
      {
        for (iuint64_t i = 0; ii != v46; ++ii)
        {
          if (*(void *)v101 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = [*(id *)(*((void *)&v100 + 1) + 8 * ii) dictionaryRepresentation];
          [v43 addObject:v49];
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v100 objects:v128 count:16];
      }
      while (v46);
    }

    [v4 setObject:v43 forKey:@"enableState"];
  }
  if ([(NSMutableArray *)self->_txLatencyBKs count])
  {
    v50 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBKs, "count"));
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v51 = self->_txLatencyBKs;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v96 objects:v127 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v97;
      do
      {
        for (juint64_t j = 0; jj != v53; ++jj)
        {
          if (*(void *)v97 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v96 + 1) + 8 * jj) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v96 objects:v127 count:16];
      }
      while (v53);
    }

    [v4 setObject:v50 forKey:@"txLatencyBK"];
  }
  if ([(NSMutableArray *)self->_txLatencyBEs count])
  {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBEs, "count"));
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v58 = self->_txLatencyBEs;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v92 objects:v126 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v93;
      do
      {
        for (kuint64_t k = 0; kk != v60; ++kk)
        {
          if (*(void *)v93 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = [*(id *)(*((void *)&v92 + 1) + 8 * kk) dictionaryRepresentation];
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v92 objects:v126 count:16];
      }
      while (v60);
    }

    [v4 setObject:v57 forKey:@"txLatencyBE"];
  }
  if ([(NSMutableArray *)self->_txLatencyVOs count])
  {
    v64 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVOs, "count"));
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v65 = self->_txLatencyVOs;
    uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v88 objects:v125 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v89;
      do
      {
        for (muint64_t m = 0; mm != v67; ++mm)
        {
          if (*(void *)v89 != v68) {
            objc_enumerationMutation(v65);
          }
          v70 = [*(id *)(*((void *)&v88 + 1) + 8 * mm) dictionaryRepresentation];
          [v64 addObject:v70];
        }
        uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v88 objects:v125 count:16];
      }
      while (v67);
    }

    [v4 setObject:v64 forKey:@"txLatencyVO"];
  }
  if ([(NSMutableArray *)self->_txLatencyVIs count])
  {
    v71 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVIs, "count"));
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v72 = self->_txLatencyVIs;
    uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v84 objects:v124 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v85;
      do
      {
        for (nuint64_t n = 0; nn != v74; ++nn)
        {
          if (*(void *)v85 != v75) {
            objc_enumerationMutation(v72);
          }
          v77 = objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * nn), "dictionaryRepresentation", (void)v84);
          [v71 addObject:v77];
        }
        uint64_t v74 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v84 objects:v124 count:16];
      }
      while (v74);
    }

    [v4 setObject:v71 forKey:@"txLatencyVI"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v78 = [NSNumber numberWithUnsignedInt:self->_afCount];
    [v4 setObject:v78 forKey:@"afCount"];
  }
  return v4;
}

- (void)addAwdlState:(id)a3
{
  id v4 = a3;
  awdlStates = self->_awdlStates;
  id v8 = v4;
  if (!awdlStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_awdlStates;
    self->_awdlStates = v6;

    id v4 = v8;
    awdlStates = self->_awdlStates;
  }
  [(NSMutableArray *)awdlStates addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_role) {
    PBDataWriterWriteStringField();
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v5 = self->_packets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v93 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v92 objects:v105 count:16];
    }
    while (v7);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v10 = self->_bytes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v89 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v88 objects:v104 count:16];
    }
    while (v12);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v15 = self->_npeers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v84 objects:v103 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v85;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v85 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v84 objects:v103 count:16];
    }
    while (v17);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v20 = self->_nrtpeers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v80 objects:v102 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v81;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v81 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v80 objects:v102 count:16];
    }
    while (v22);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v25 = self->_awdlStates;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v76 objects:v101 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v77;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v77 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v76 objects:v101 count:16];
    }
    while (v27);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_40:
      if ((has & 8) == 0) {
        goto LABEL_41;
      }
      goto LABEL_84;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_41:
    if ((has & 0x10) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_42:
    if ((has & 2) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_43:
  }
    PBDataWriterWriteUint32Field();
LABEL_44:
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v31 = self->_enableStates;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v72 objects:v100 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v73;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v73 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v72 objects:v100 count:16];
    }
    while (v33);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v36 = self->_txLatencyBKs;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v68 objects:v99 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v69;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v69 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v68 objects:v99 count:16];
    }
    while (v38);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v41 = self->_txLatencyBEs;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v64 objects:v98 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v65;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(v41);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v64 objects:v98 count:16];
    }
    while (v43);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v46 = self->_txLatencyVOs;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v60 objects:v97 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v61;
    do
    {
      for (muint64_t m = 0; mm != v48; ++mm)
      {
        if (*(void *)v61 != v49) {
          objc_enumerationMutation(v46);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v60 objects:v97 count:16];
    }
    while (v48);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v51 = self->_txLatencyVIs;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v56 objects:v96 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v57;
    do
    {
      for (nuint64_t n = 0; nn != v53; ++nn)
      {
        if (*(void *)v57 != v54) {
          objc_enumerationMutation(v51);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v56 objects:v96 count:16];
    }
    while (v53);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)setRtPeerCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rtPeerCount = a3;
}

- (void)setRole:(id)a3
{
}

- (void)setPeersRemoved:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_peersRemoved = a3;
}

- (void)setPeersAdded:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_peersAdded = a3;
}

- (void)setPeerCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_peerCount = a3;
}

- (void)setEnabled:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_enabled = a3;
}

- (void)setAfCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_afCount = a3;
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

- (void)clearNpeers
{
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

- (void)clearNrtpeers
{
}

- (unint64_t)nrtpeersCount
{
  return [(NSMutableArray *)self->_nrtpeers count];
}

- (id)nrtpeersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nrtpeers objectAtIndex:a3];
}

+ (Class)nrtpeersType
{
  return (Class)objc_opt_class();
}

- (void)clearAwdlStates
{
}

- (unint64_t)awdlStatesCount
{
  return [(NSMutableArray *)self->_awdlStates count];
}

- (id)awdlStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_awdlStates objectAtIndex:a3];
}

+ (Class)awdlStateType
{
  return (Class)objc_opt_class();
}

- (void)setHasRtPeerCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRtPeerCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasPeerCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPeerCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPeersAdded:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPeersAdded
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPeersRemoved:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPeersRemoved
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (void)clearTxLatencyBKs
{
}

- (void)addTxLatencyBK:(id)a3
{
  id v4 = a3;
  txLatencyBKs = self->_txLatencyBKs;
  id v8 = v4;
  if (!txLatencyBKs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_txLatencyBKs;
    self->_txLatencyBKs = v6;

    id v4 = v8;
    txLatencyBKs = self->_txLatencyBKs;
  }
  [(NSMutableArray *)txLatencyBKs addObject:v4];
}

- (unint64_t)txLatencyBKsCount
{
  return [(NSMutableArray *)self->_txLatencyBKs count];
}

- (id)txLatencyBKAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyBKs objectAtIndex:a3];
}

+ (Class)txLatencyBKType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyBEs
{
}

- (void)addTxLatencyBE:(id)a3
{
  id v4 = a3;
  txLatencyBEs = self->_txLatencyBEs;
  id v8 = v4;
  if (!txLatencyBEs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_txLatencyBEs;
    self->_txLatencyBEs = v6;

    id v4 = v8;
    txLatencyBEs = self->_txLatencyBEs;
  }
  [(NSMutableArray *)txLatencyBEs addObject:v4];
}

- (unint64_t)txLatencyBEsCount
{
  return [(NSMutableArray *)self->_txLatencyBEs count];
}

- (id)txLatencyBEAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyBEs objectAtIndex:a3];
}

+ (Class)txLatencyBEType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVOs
{
}

- (void)addTxLatencyVO:(id)a3
{
  id v4 = a3;
  txLatencyVOs = self->_txLatencyVOs;
  id v8 = v4;
  if (!txLatencyVOs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_txLatencyVOs;
    self->_txLatencyVOs = v6;

    id v4 = v8;
    txLatencyVOs = self->_txLatencyVOs;
  }
  [(NSMutableArray *)txLatencyVOs addObject:v4];
}

- (unint64_t)txLatencyVOsCount
{
  return [(NSMutableArray *)self->_txLatencyVOs count];
}

- (id)txLatencyVOAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyVOs objectAtIndex:a3];
}

+ (Class)txLatencyVOType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVIs
{
}

- (void)addTxLatencyVI:(id)a3
{
  id v4 = a3;
  txLatencyVIs = self->_txLatencyVIs;
  id v8 = v4;
  if (!txLatencyVIs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_txLatencyVIs;
    self->_txLatencyVIs = v6;

    id v4 = v8;
    txLatencyVIs = self->_txLatencyVIs;
  }
  [(NSMutableArray *)txLatencyVIs addObject:v4];
}

- (unint64_t)txLatencyVIsCount
{
  return [(NSMutableArray *)self->_txLatencyVIs count];
}

- (id)txLatencyVIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyVIs objectAtIndex:a3];
}

+ (Class)txLatencyVIType
{
  return (Class)objc_opt_class();
}

- (void)setHasAfCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAfCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v45 = a3;
  if (self->_role) {
    objc_msgSend(v45, "setRole:");
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self packetsCount])
  {
    [v45 clearPackets];
    unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self packetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self packetsAtIndex:i];
        [v45 addPackets:v7];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self bytesCount])
  {
    [v45 clearBytes];
    unint64_t v8 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self bytesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self bytesAtIndex:j];
        [v45 addBytes:v11];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self npeersCount])
  {
    [v45 clearNpeers];
    unint64_t v12 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self npeersCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self npeersAtIndex:k];
        [v45 addNpeers:v15];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self nrtpeersCount])
  {
    [v45 clearNrtpeers];
    unint64_t v16 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self nrtpeersCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        v19 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self nrtpeersAtIndex:m];
        [v45 addNrtpeers:v19];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self awdlStatesCount])
  {
    [v45 clearAwdlStates];
    unint64_t v20 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self awdlStatesCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self awdlStateAtIndex:n];
        [v45 addAwdlState:v23];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v45 + 24) = self->_rtPeerCount;
    *((unsigned char *)v45 + 136) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_25:
      if ((has & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v45 + 18) = self->_peerCount;
  *((unsigned char *)v45 + 136) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_26:
    if ((has & 0x10) == 0) {
      goto LABEL_27;
    }
LABEL_57:
    *((_DWORD *)v45 + 20) = self->_peersRemoved;
    *((unsigned char *)v45 + 136) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_56:
  *((_DWORD *)v45 + 19) = self->_peersAdded;
  *((unsigned char *)v45 + 136) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_57;
  }
LABEL_27:
  if ((has & 2) != 0)
  {
LABEL_28:
    *((_DWORD *)v45 + 10) = self->_enabled;
    *((unsigned char *)v45 + 136) |= 2u;
  }
LABEL_29:
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self enableStatesCount])
  {
    [v45 clearEnableStates];
    unint64_t v25 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self enableStatesCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self enableStateAtIndex:ii];
        [v45 addEnableState:v28];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyBKsCount])
  {
    [v45 clearTxLatencyBKs];
    unint64_t v29 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyBKsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyBKAtIndex:jj];
        [v45 addTxLatencyBK:v32];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyBEsCount])
  {
    [v45 clearTxLatencyBEs];
    unint64_t v33 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyBEsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        uint64_t v36 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyBEAtIndex:kk];
        [v45 addTxLatencyBE:v36];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyVOsCount])
  {
    [v45 clearTxLatencyVOs];
    unint64_t v37 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyVOsCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0; mm != v38; ++mm)
      {
        v40 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyVOAtIndex:mm];
        [v45 addTxLatencyVO:v40];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyVIsCount])
  {
    [v45 clearTxLatencyVIs];
    unint64_t v41 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyVIsCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (nuint64_t n = 0; nn != v42; ++nn)
      {
        uint64_t v44 = [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self txLatencyVIAtIndex:nn];
        [v45 addTxLatencyVI:v44];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v45 + 2) = self->_afCount;
    *((unsigned char *)v45 + 136) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_role copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  unint64_t v8 = self->_packets;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v106 objects:v119 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v107 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v106 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPackets:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v106 objects:v119 count:16];
    }
    while (v10);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v14 = self->_bytes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v102 objects:v118 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v103;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v103 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = (void *)[*(id *)(*((void *)&v102 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBytes:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v102 objects:v118 count:16];
    }
    while (v16);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  unint64_t v20 = self->_npeers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v98 objects:v117 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v99;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v99 != v23) {
          objc_enumerationMutation(v20);
        }
        unint64_t v25 = (void *)[*(id *)(*((void *)&v98 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addNpeers:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v98 objects:v117 count:16];
    }
    while (v22);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  unint64_t v26 = self->_nrtpeers;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v94 objects:v116 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v95;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v95 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = (void *)[*(id *)(*((void *)&v94 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addNrtpeers:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v94 objects:v116 count:16];
    }
    while (v28);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v32 = self->_awdlStates;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v90 objects:v115 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v91;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v91 != v35) {
          objc_enumerationMutation(v32);
        }
        unint64_t v37 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addAwdlState:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v90 objects:v115 count:16];
    }
    while (v34);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_rtPeerCount;
    *(unsigned char *)(v5 + 136) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_38:
      if ((has & 8) == 0) {
        goto LABEL_39;
      }
      goto LABEL_82;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_38;
  }
  *(_DWORD *)(v5 + 72) = self->_peerCount;
  *(unsigned char *)(v5 + 136) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_39:
    if ((has & 0x10) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 76) = self->_peersAdded;
  *(unsigned char *)(v5 + 136) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_40:
    if ((has & 2) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_83:
  *(_DWORD *)(v5 + 80) = self->_peersRemoved;
  *(unsigned char *)(v5 + 136) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 40) = self->_enabled;
    *(unsigned char *)(v5 + 136) |= 2u;
  }
LABEL_42:
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v39 = self->_enableStates;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v86 objects:v114 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v87;
    do
    {
      for (iuint64_t i = 0; ii != v41; ++ii)
      {
        if (*(void *)v87 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addEnableState:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v86 objects:v114 count:16];
    }
    while (v41);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v45 = self->_txLatencyBKs;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v82 objects:v113 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v83;
    do
    {
      for (juint64_t j = 0; jj != v47; ++jj)
      {
        if (*(void *)v83 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addTxLatencyBK:v50];
      }
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v82 objects:v113 count:16];
    }
    while (v47);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v51 = self->_txLatencyBEs;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v78 objects:v112 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v79;
    do
    {
      for (kuint64_t k = 0; kk != v53; ++kk)
      {
        if (*(void *)v79 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v5 addTxLatencyBE:v56];
      }
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v78 objects:v112 count:16];
    }
    while (v53);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v57 = self->_txLatencyVOs;
  uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v74 objects:v111 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v75;
    do
    {
      for (muint64_t m = 0; mm != v59; ++mm)
      {
        if (*(void *)v75 != v60) {
          objc_enumerationMutation(v57);
        }
        long long v62 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v5 addTxLatencyVO:v62];
      }
      uint64_t v59 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v74 objects:v111 count:16];
    }
    while (v59);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v63 = self->_txLatencyVIs;
  uint64_t v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v70 objects:v110 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v71;
    do
    {
      for (nuint64_t n = 0; nn != v65; ++nn)
      {
        if (*(void *)v71 != v66) {
          objc_enumerationMutation(v63);
        }
        long long v68 = objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * nn), "copyWithZone:", a3, (void)v70);
        [(id)v5 addTxLatencyVI:v68];
      }
      uint64_t v65 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v70 objects:v110 count:16];
    }
    while (v65);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_afCount;
    *(unsigned char *)(v5 + 136) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  role = self->_role;
  if ((unint64_t)role | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](role, "isEqual:")) {
      goto LABEL_54;
    }
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:")) {
      goto LABEL_54;
    }
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:")) {
      goto LABEL_54;
    }
  }
  npeers = self->_npeers;
  if ((unint64_t)npeers | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](npeers, "isEqual:")) {
      goto LABEL_54;
    }
  }
  nrtpeers = self->_nrtpeers;
  if ((unint64_t)nrtpeers | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](nrtpeers, "isEqual:")) {
      goto LABEL_54;
    }
  }
  awdlStates = self->_awdlStates;
  if ((unint64_t)awdlStates | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](awdlStates, "isEqual:")) {
      goto LABEL_54;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 0x20) == 0 || self->_rtPeerCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 0x20) != 0)
  {
LABEL_54:
    BOOL v16 = 0;
    goto LABEL_55;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 4) == 0 || self->_peerCount != *((_DWORD *)v4 + 18)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 8) == 0 || self->_peersAdded != *((_DWORD *)v4 + 19)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 0x10) == 0 || self->_peersRemoved != *((_DWORD *)v4 + 20)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 2) == 0 || self->_enabled != *((_DWORD *)v4 + 10)) {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 2) != 0)
  {
    goto LABEL_54;
  }
  enableStates = self->_enableStates;
  if ((unint64_t)enableStates | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](enableStates, "isEqual:"))
  {
    goto LABEL_54;
  }
  txLatencyBKs = self->_txLatencyBKs;
  if ((unint64_t)txLatencyBKs | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBKs, "isEqual:")) {
      goto LABEL_54;
    }
  }
  txLatencyBEs = self->_txLatencyBEs;
  if ((unint64_t)txLatencyBEs | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBEs, "isEqual:")) {
      goto LABEL_54;
    }
  }
  txLatencyVOs = self->_txLatencyVOs;
  if ((unint64_t)txLatencyVOs | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVOs, "isEqual:")) {
      goto LABEL_54;
    }
  }
  txLatencyVIs = self->_txLatencyVIs;
  if ((unint64_t)txLatencyVIs | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVIs, "isEqual:")) {
      goto LABEL_54;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 136) & 1) == 0 || self->_afCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_54;
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = (*((unsigned char *)v4 + 136) & 1) == 0;
  }
LABEL_55:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v21 = [(NSString *)self->_role hash];
  uint64_t v20 = [(NSMutableArray *)self->_packets hash];
  uint64_t v19 = [(NSMutableArray *)self->_bytes hash];
  uint64_t v18 = [(NSMutableArray *)self->_npeers hash];
  uint64_t v17 = [(NSMutableArray *)self->_nrtpeers hash];
  uint64_t v16 = [(NSMutableArray *)self->_awdlStates hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v15 = 2654435761 * self->_rtPeerCount;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v13 = 2654435761 * self->_peerCount;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v3 = 2654435761 * self->_peersAdded;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v4 = 2654435761 * self->_peersRemoved;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_enabled;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
LABEL_12:
  uint64_t v6 = [(NSMutableArray *)self->_enableStates hash];
  uint64_t v7 = [(NSMutableArray *)self->_txLatencyBKs hash];
  uint64_t v8 = [(NSMutableArray *)self->_txLatencyBEs hash];
  uint64_t v9 = [(NSMutableArray *)self->_txLatencyVOs hash];
  uint64_t v10 = [(NSMutableArray *)self->_txLatencyVIs hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_afCount;
  }
  else {
    uint64_t v11 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 11)) {
    -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats setRole:](self, "setRole:");
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v5 = *((id *)v4 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v93 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addPackets:*(void *)(*((void *)&v92 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v92 objects:v105 count:16];
    }
    while (v7);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v89 != v13) {
          objc_enumerationMutation(v10);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addBytes:*(void *)(*((void *)&v88 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v88 objects:v104 count:16];
    }
    while (v12);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v15 = *((id *)v4 + 6);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v84 objects:v103 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v85;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v85 != v18) {
          objc_enumerationMutation(v15);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addNpeers:*(void *)(*((void *)&v84 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v84 objects:v103 count:16];
    }
    while (v17);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v20 = *((id *)v4 + 7);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v80 objects:v102 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v81;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v81 != v23) {
          objc_enumerationMutation(v20);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addNrtpeers:*(void *)(*((void *)&v80 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v80 objects:v102 count:16];
    }
    while (v22);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v25 = *((id *)v4 + 2);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v76 objects:v101 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v77;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v77 != v28) {
          objc_enumerationMutation(v25);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addAwdlState:*(void *)(*((void *)&v76 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v76 objects:v101 count:16];
    }
    while (v27);
  }

  char v30 = *((unsigned char *)v4 + 136);
  if ((v30 & 0x20) != 0)
  {
    self->_rtPeerCount = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 0x20u;
    char v30 = *((unsigned char *)v4 + 136);
    if ((v30 & 4) == 0)
    {
LABEL_40:
      if ((v30 & 8) == 0) {
        goto LABEL_41;
      }
      goto LABEL_84;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 4) == 0)
  {
    goto LABEL_40;
  }
  self->_peerCount = *((_DWORD *)v4 + 18);
  *(unsigned char *)&self->_has |= 4u;
  char v30 = *((unsigned char *)v4 + 136);
  if ((v30 & 8) == 0)
  {
LABEL_41:
    if ((v30 & 0x10) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_peersAdded = *((_DWORD *)v4 + 19);
  *(unsigned char *)&self->_has |= 8u;
  char v30 = *((unsigned char *)v4 + 136);
  if ((v30 & 0x10) == 0)
  {
LABEL_42:
    if ((v30 & 2) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_85:
  self->_peersRemoved = *((_DWORD *)v4 + 20);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 136) & 2) != 0)
  {
LABEL_43:
    self->_enabled = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_44:
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v31 = *((id *)v4 + 4);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v100 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v73;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v73 != v34) {
          objc_enumerationMutation(v31);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addEnableState:*(void *)(*((void *)&v72 + 1) + 8 * ii)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v72 objects:v100 count:16];
    }
    while (v33);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v36 = *((id *)v4 + 14);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v68 objects:v99 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v69;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v69 != v39) {
          objc_enumerationMutation(v36);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addTxLatencyBK:*(void *)(*((void *)&v68 + 1) + 8 * jj)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v68 objects:v99 count:16];
    }
    while (v38);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v41 = *((id *)v4 + 13);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v98 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v65;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(v41);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addTxLatencyBE:*(void *)(*((void *)&v64 + 1) + 8 * kk)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v64 objects:v98 count:16];
    }
    while (v43);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v46 = *((id *)v4 + 16);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v60 objects:v97 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v61;
    do
    {
      for (muint64_t m = 0; mm != v48; ++mm)
      {
        if (*(void *)v61 != v49) {
          objc_enumerationMutation(v46);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats *)self addTxLatencyVO:*(void *)(*((void *)&v60 + 1) + 8 * mm)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v60 objects:v97 count:16];
    }
    while (v48);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v51 = *((id *)v4 + 15);
  uint64_t v52 = [v51 countByEnumeratingWithState:&v56 objects:v96 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v57;
    do
    {
      for (nuint64_t n = 0; nn != v53; ++nn)
      {
        if (*(void *)v57 != v54) {
          objc_enumerationMutation(v51);
        }
        -[WiFiAnalyticsAWDWiFiNWActivityAWDLInterfaceStats addTxLatencyVI:](self, "addTxLatencyVI:", *(void *)(*((void *)&v56 + 1) + 8 * nn), (void)v56);
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v56 objects:v96 count:16];
    }
    while (v53);
  }

  if (*((unsigned char *)v4 + 136))
  {
    self->_afCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
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

- (NSMutableArray)npeers
{
  return self->_npeers;
}

- (void)setNpeers:(id)a3
{
}

- (NSMutableArray)nrtpeers
{
  return self->_nrtpeers;
}

- (void)setNrtpeers:(id)a3
{
}

- (NSMutableArray)awdlStates
{
  return self->_awdlStates;
}

- (void)setAwdlStates:(id)a3
{
}

- (unsigned)rtPeerCount
{
  return self->_rtPeerCount;
}

- (unsigned)peerCount
{
  return self->_peerCount;
}

- (unsigned)peersAdded
{
  return self->_peersAdded;
}

- (unsigned)peersRemoved
{
  return self->_peersRemoved;
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

- (NSMutableArray)txLatencyBKs
{
  return self->_txLatencyBKs;
}

- (void)setTxLatencyBKs:(id)a3
{
}

- (NSMutableArray)txLatencyBEs
{
  return self->_txLatencyBEs;
}

- (void)setTxLatencyBEs:(id)a3
{
}

- (NSMutableArray)txLatencyVOs
{
  return self->_txLatencyVOs;
}

- (void)setTxLatencyVOs:(id)a3
{
}

- (NSMutableArray)txLatencyVIs
{
  return self->_txLatencyVIs;
}

- (void)setTxLatencyVIs:(id)a3
{
}

- (unsigned)afCount
{
  return self->_afCount;
}

@end