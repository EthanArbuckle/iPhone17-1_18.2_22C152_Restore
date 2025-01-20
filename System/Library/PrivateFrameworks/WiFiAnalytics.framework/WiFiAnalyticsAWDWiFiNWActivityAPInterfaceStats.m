@interface WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats
+ (Class)bytesType;
+ (Class)enableStateType;
+ (Class)npeersType;
+ (Class)packetsType;
+ (Class)txLatencyBEType;
+ (Class)txLatencyBKType;
+ (Class)txLatencyVIType;
+ (Class)txLatencyVOType;
- (BOOL)hasEnabled;
- (BOOL)hasPeerCount;
- (BOOL)hasPeersAdded;
- (BOOL)hasPeersRemoved;
- (BOOL)hasRole;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bytes;
- (NSMutableArray)enableStates;
- (NSMutableArray)npeers;
- (NSMutableArray)packets;
- (NSMutableArray)txLatencyBEs;
- (NSMutableArray)txLatencyBKs;
- (NSMutableArray)txLatencyVIs;
- (NSMutableArray)txLatencyVOs;
- (NSString)role;
- (id)bytesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enableStateAtIndex:(unint64_t)a3;
- (id)npeersAtIndex:(unint64_t)a3;
- (id)packetsAtIndex:(unint64_t)a3;
- (id)txLatencyBEAtIndex:(unint64_t)a3;
- (id)txLatencyBKAtIndex:(unint64_t)a3;
- (id)txLatencyVIAtIndex:(unint64_t)a3;
- (id)txLatencyVOAtIndex:(unint64_t)a3;
- (unint64_t)bytesCount;
- (unint64_t)enableStatesCount;
- (unint64_t)hash;
- (unint64_t)npeersCount;
- (unint64_t)packetsCount;
- (unint64_t)txLatencyBEsCount;
- (unint64_t)txLatencyBKsCount;
- (unint64_t)txLatencyVIsCount;
- (unint64_t)txLatencyVOsCount;
- (unsigned)enabled;
- (unsigned)peerCount;
- (unsigned)peersAdded;
- (unsigned)peersRemoved;
- (void)addBytes:(id)a3;
- (void)addEnableState:(id)a3;
- (void)addNpeers:(id)a3;
- (void)addPackets:(id)a3;
- (void)addTxLatencyBE:(id)a3;
- (void)addTxLatencyBK:(id)a3;
- (void)addTxLatencyVI:(id)a3;
- (void)addTxLatencyVO:(id)a3;
- (void)clearBytes;
- (void)clearEnableStates;
- (void)clearNpeers;
- (void)clearPackets;
- (void)clearTxLatencyBEs;
- (void)clearTxLatencyBKs;
- (void)clearTxLatencyVIs;
- (void)clearTxLatencyVOs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytes:(id)a3;
- (void)setEnableStates:(id)a3;
- (void)setEnabled:(unsigned int)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasPeerCount:(BOOL)a3;
- (void)setHasPeersAdded:(BOOL)a3;
- (void)setHasPeersRemoved:(BOOL)a3;
- (void)setNpeers:(id)a3;
- (void)setPackets:(id)a3;
- (void)setPeerCount:(unsigned int)a3;
- (void)setPeersAdded:(unsigned int)a3;
- (void)setPeersRemoved:(unsigned int)a3;
- (void)setRole:(id)a3;
- (void)setTxLatencyBEs:(id)a3;
- (void)setTxLatencyBKs:(id)a3;
- (void)setTxLatencyVIs:(id)a3;
- (void)setTxLatencyVOs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats

- (void)writeTo:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_role) {
    PBDataWriterWriteStringField();
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v5 = self->_packets;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v75 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v7);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v10 = self->_bytes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v12);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v15 = self->_npeers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v66 objects:v83 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v67 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v66 objects:v83 count:16];
    }
    while (v17);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_26:
      if ((has & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_67;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_28:
  }
    PBDataWriterWriteUint32Field();
LABEL_29:
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v21 = self->_enableStates;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v63 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
    }
    while (v23);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v26 = self->_txLatencyBKs;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
    }
    while (v28);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v31 = self->_txLatencyBEs;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v55;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
    }
    while (v33);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v36 = self->_txLatencyVOs;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v51;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
    }
    while (v38);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v41 = self->_txLatencyVIs;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v47;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(v41);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
    }
    while (v43);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txLatencyVOs, 0);
  objc_storeStrong((id *)&self->_txLatencyVIs, 0);
  objc_storeStrong((id *)&self->_txLatencyBKs, 0);
  objc_storeStrong((id *)&self->_txLatencyBEs, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_npeers, 0);
  objc_storeStrong((id *)&self->_enableStates, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
}

- (id)dictionaryRepresentation
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  role = self->_role;
  if (role) {
    [v3 setObject:role forKey:@"role"];
  }
  if ([(NSMutableArray *)self->_packets count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v7 = self->_packets;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v96 objects:v107 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v97 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v96 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v96 objects:v107 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"packets"];
  }
  if ([(NSMutableArray *)self->_bytes count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v14 = self->_bytes;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v92 objects:v106 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v93;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v93 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v92 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v92 objects:v106 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"bytes"];
  }
  if ([(NSMutableArray *)self->_npeers count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_npeers, "count"));
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v21 = self->_npeers;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v88 objects:v105 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v89;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v89 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v88 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v88 objects:v105 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"npeers"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    long long v65 = [NSNumber numberWithUnsignedInt:self->_peerCount];
    [v4 setObject:v65 forKey:@"peerCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_32:
      if ((has & 8) == 0) {
        goto LABEL_33;
      }
      goto LABEL_85;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_32;
  }
  long long v66 = [NSNumber numberWithUnsignedInt:self->_peersAdded];
  [v4 setObject:v66 forKey:@"peersAdded"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_33:
    if ((has & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_85:
  long long v67 = [NSNumber numberWithUnsignedInt:self->_peersRemoved];
  [v4 setObject:v67 forKey:@"peersRemoved"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_34:
    uint64_t v28 = [NSNumber numberWithUnsignedInt:self->_enabled];
    [v4 setObject:v28 forKey:@"enabled"];
  }
LABEL_35:
  if ([(NSMutableArray *)self->_enableStates count])
  {
    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_enableStates, "count"));
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v30 = self->_enableStates;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v84 objects:v104 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v85;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v85 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v84 + 1) + 8 * m) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v84 objects:v104 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"enableState"];
  }
  if ([(NSMutableArray *)self->_txLatencyBKs count])
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBKs, "count"));
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v37 = self->_txLatencyBKs;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v80 objects:v103 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v81;
      do
      {
        for (uint64_t n = 0; n != v39; ++n)
        {
          if (*(void *)v81 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = [*(id *)(*((void *)&v80 + 1) + 8 * n) dictionaryRepresentation];
          [v36 addObject:v42];
        }
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v80 objects:v103 count:16];
      }
      while (v39);
    }

    [v4 setObject:v36 forKey:@"txLatencyBK"];
  }
  if ([(NSMutableArray *)self->_txLatencyBEs count])
  {
    uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBEs, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v44 = self->_txLatencyBEs;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v76 objects:v102 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v77;
      do
      {
        for (iuint64_t i = 0; ii != v46; ++ii)
        {
          if (*(void *)v77 != v47) {
            objc_enumerationMutation(v44);
          }
          long long v49 = [*(id *)(*((void *)&v76 + 1) + 8 * ii) dictionaryRepresentation];
          [v43 addObject:v49];
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v76 objects:v102 count:16];
      }
      while (v46);
    }

    [v4 setObject:v43 forKey:@"txLatencyBE"];
  }
  if ([(NSMutableArray *)self->_txLatencyVOs count])
  {
    long long v50 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVOs, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v51 = self->_txLatencyVOs;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v72 objects:v101 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v73;
      do
      {
        for (juint64_t j = 0; jj != v53; ++jj)
        {
          if (*(void *)v73 != v54) {
            objc_enumerationMutation(v51);
          }
          long long v56 = [*(id *)(*((void *)&v72 + 1) + 8 * jj) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v72 objects:v101 count:16];
      }
      while (v53);
    }

    [v4 setObject:v50 forKey:@"txLatencyVO"];
  }
  if ([(NSMutableArray *)self->_txLatencyVIs count])
  {
    long long v57 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVIs, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v58 = self->_txLatencyVIs;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v68 objects:v100 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v69;
      do
      {
        for (kuint64_t k = 0; kk != v60; ++kk)
        {
          if (*(void *)v69 != v61) {
            objc_enumerationMutation(v58);
          }
          long long v63 = objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * kk), "dictionaryRepresentation", (void)v68);
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v68 objects:v100 count:16];
      }
      while (v60);
    }

    [v4 setObject:v57 forKey:@"txLatencyVI"];
  }
  return v4;
}

- (void)setPeersRemoved:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_peersRemoved = a3;
}

- (void)setPeersAdded:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_peersAdded = a3;
}

- (void)setPeerCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_peerCount = a3;
}

- (void)setEnabled:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enabled = a3;
}

- (BOOL)hasRole
{
  return self->_role != 0;
}

- (void)clearPackets
{
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

- (void)addNpeers:(id)a3
{
  id v4 = a3;
  npeers = self->_npeers;
  id v8 = v4;
  if (!npeers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_npeers;
    self->_npeers = v6;

    id v4 = v8;
    npeers = self->_npeers;
  }
  [(NSMutableArray *)npeers addObject:v4];
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

- (void)setHasPeerCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPeerCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPeersAdded:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPeersAdded
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPeersRemoved:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPeersRemoved
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearEnableStates
{
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v37 = a3;
  if (self->_role) {
    objc_msgSend(v37, "setRole:");
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self packetsCount])
  {
    [v37 clearPackets];
    unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self packetsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self packetsAtIndex:i];
        [v37 addPackets:v7];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self bytesCount])
  {
    [v37 clearBytes];
    unint64_t v8 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self bytesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self bytesAtIndex:j];
        [v37 addBytes:v11];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self npeersCount])
  {
    [v37 clearNpeers];
    unint64_t v12 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self npeersCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self npeersAtIndex:k];
        [v37 addNpeers:v15];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v37 + 12) = self->_peerCount;
    *((unsigned char *)v37 + 104) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
LABEL_45:
      *((_DWORD *)v37 + 14) = self->_peersRemoved;
      *((unsigned char *)v37 + 104) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v37 + 13) = self->_peersAdded;
  *((unsigned char *)v37 + 104) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_45;
  }
LABEL_18:
  if (has)
  {
LABEL_19:
    *((_DWORD *)v37 + 6) = self->_enabled;
    *((unsigned char *)v37 + 104) |= 1u;
  }
LABEL_20:
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self enableStatesCount])
  {
    [v37 clearEnableStates];
    unint64_t v17 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self enableStatesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self enableStateAtIndex:m];
        [v37 addEnableState:v20];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyBKsCount])
  {
    [v37 clearTxLatencyBKs];
    unint64_t v21 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyBKsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyBKAtIndex:n];
        [v37 addTxLatencyBK:v24];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyBEsCount])
  {
    [v37 clearTxLatencyBEs];
    unint64_t v25 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyBEsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyBEAtIndex:ii];
        [v37 addTxLatencyBE:v28];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyVOsCount])
  {
    [v37 clearTxLatencyVOs];
    unint64_t v29 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyVOsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyVOAtIndex:jj];
        [v37 addTxLatencyVO:v32];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyVIsCount])
  {
    [v37 clearTxLatencyVIs];
    unint64_t v33 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyVIsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        v36 = [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self txLatencyVIAtIndex:kk];
        [v37 addTxLatencyVI:v36];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_role copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  unint64_t v8 = self->_packets;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v86 objects:v97 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v87 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v86 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPackets:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v86 objects:v97 count:16];
    }
    while (v10);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v14 = self->_bytes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v82 objects:v96 count:16];
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
        v19 = (void *)[*(id *)(*((void *)&v82 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBytes:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v82 objects:v96 count:16];
    }
    while (v16);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v20 = self->_npeers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v78 objects:v95 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v79;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v79 != v23) {
          objc_enumerationMutation(v20);
        }
        unint64_t v25 = (void *)[*(id *)(*((void *)&v78 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addNpeers:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v78 objects:v95 count:16];
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_peerCount;
    *(unsigned char *)(v5 + 104) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_24:
      if ((has & 8) == 0) {
        goto LABEL_25;
      }
      goto LABEL_65;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(v5 + 52) = self->_peersAdded;
  *(unsigned char *)(v5 + 104) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_25:
    if ((has & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_65:
  *(_DWORD *)(v5 + 56) = self->_peersRemoved;
  *(unsigned char *)(v5 + 104) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_26:
    *(_DWORD *)(v5 + 24) = self->_enabled;
    *(unsigned char *)(v5 + 104) |= 1u;
  }
LABEL_27:
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v27 = self->_enableStates;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v74 objects:v94 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v75;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v75 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = (void *)[*(id *)(*((void *)&v74 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addEnableState:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v74 objects:v94 count:16];
    }
    while (v29);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  unint64_t v33 = self->_txLatencyBKs;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v70 objects:v93 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v71;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v71 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = (void *)[*(id *)(*((void *)&v70 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addTxLatencyBK:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v70 objects:v93 count:16];
    }
    while (v35);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v39 = self->_txLatencyBEs;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v66 objects:v92 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v67;
    do
    {
      for (iuint64_t i = 0; ii != v41; ++ii)
      {
        if (*(void *)v67 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = (void *)[*(id *)(*((void *)&v66 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addTxLatencyBE:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v66 objects:v92 count:16];
    }
    while (v41);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v45 = self->_txLatencyVOs;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v62 objects:v91 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v63;
    do
    {
      for (juint64_t j = 0; jj != v47; ++jj)
      {
        if (*(void *)v63 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addTxLatencyVO:v50];
      }
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v62 objects:v91 count:16];
    }
    while (v47);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v51 = self->_txLatencyVIs;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v58 objects:v90 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v59;
    do
    {
      for (kuint64_t k = 0; kk != v53; ++kk)
      {
        if (*(void *)v59 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * kk), "copyWithZone:", a3, (void)v58);
        [(id)v5 addTxLatencyVI:v56];
      }
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v58 objects:v90 count:16];
    }
    while (v53);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  role = self->_role;
  if ((unint64_t)role | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](role, "isEqual:")) {
      goto LABEL_40;
    }
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:")) {
      goto LABEL_40;
    }
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:")) {
      goto LABEL_40;
    }
  }
  npeers = self->_npeers;
  if ((unint64_t)npeers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](npeers, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_peerCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
LABEL_40:
    char v14 = 0;
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_peersAdded != *((_DWORD *)v4 + 13)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 8) == 0 || self->_peersRemoved != *((_DWORD *)v4 + 14)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 8) != 0)
  {
    goto LABEL_40;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_enabled != *((_DWORD *)v4 + 6)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
    goto LABEL_40;
  }
  enableStates = self->_enableStates;
  if ((unint64_t)enableStates | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](enableStates, "isEqual:"))
  {
    goto LABEL_40;
  }
  txLatencyBKs = self->_txLatencyBKs;
  if ((unint64_t)txLatencyBKs | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBKs, "isEqual:")) {
      goto LABEL_40;
    }
  }
  txLatencyBEs = self->_txLatencyBEs;
  if ((unint64_t)txLatencyBEs | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBEs, "isEqual:")) {
      goto LABEL_40;
    }
  }
  txLatencyVOs = self->_txLatencyVOs;
  if ((unint64_t)txLatencyVOs | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVOs, "isEqual:")) {
      goto LABEL_40;
    }
  }
  txLatencyVIs = self->_txLatencyVIs;
  if ((unint64_t)txLatencyVIs | *((void *)v4 + 11)) {
    char v14 = -[NSMutableArray isEqual:](txLatencyVIs, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_41:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_role hash];
  uint64_t v4 = [(NSMutableArray *)self->_packets hash];
  uint64_t v5 = [(NSMutableArray *)self->_bytes hash];
  uint64_t v6 = [(NSMutableArray *)self->_npeers hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_peerCount;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_peersAdded;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v9 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_peersRemoved;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v10 = 2654435761 * self->_enabled;
LABEL_10:
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v12 = v7 ^ v8 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_enableStates hash];
  uint64_t v13 = v11 ^ v12 ^ [(NSMutableArray *)self->_txLatencyBKs hash];
  uint64_t v14 = [(NSMutableArray *)self->_txLatencyBEs hash];
  uint64_t v15 = v14 ^ [(NSMutableArray *)self->_txLatencyVOs hash];
  return v13 ^ v15 ^ [(NSMutableArray *)self->_txLatencyVIs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats setRole:](self, "setRole:");
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v75 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self addPackets:*(void *)(*((void *)&v74 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v7);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v10 = *((id *)v4 + 1);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(v10);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self addBytes:*(void *)(*((void *)&v70 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v12);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v15 = *((id *)v4 + 4);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v66 objects:v83 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v67 != v18) {
          objc_enumerationMutation(v15);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self addNpeers:*(void *)(*((void *)&v66 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v66 objects:v83 count:16];
    }
    while (v17);
  }

  char v20 = *((unsigned char *)v4 + 104);
  if ((v20 & 2) != 0)
  {
    self->_peerCount = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v20 = *((unsigned char *)v4 + 104);
    if ((v20 & 4) == 0)
    {
LABEL_26:
      if ((v20 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) == 0)
  {
    goto LABEL_26;
  }
  self->_peersAdded = *((_DWORD *)v4 + 13);
  *(unsigned char *)&self->_has |= 4u;
  char v20 = *((unsigned char *)v4 + 104);
  if ((v20 & 8) == 0)
  {
LABEL_27:
    if ((v20 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_67:
  self->_peersRemoved = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 104))
  {
LABEL_28:
    self->_enabled = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_29:
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v21 = *((id *)v4 + 2);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v63 != v24) {
          objc_enumerationMutation(v21);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self addEnableState:*(void *)(*((void *)&v62 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
    }
    while (v23);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v26 = *((id *)v4 + 10);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self addTxLatencyBK:*(void *)(*((void *)&v58 + 1) + 8 * n)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
    }
    while (v28);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v31 = *((id *)v4 + 9);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v55;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v31);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self addTxLatencyBE:*(void *)(*((void *)&v54 + 1) + 8 * ii)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
    }
    while (v33);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v36 = *((id *)v4 + 12);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v51;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(v36);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats *)self addTxLatencyVO:*(void *)(*((void *)&v50 + 1) + 8 * jj)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
    }
    while (v38);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v41 = *((id *)v4 + 11);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v47;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(v41);
        }
        -[WiFiAnalyticsAWDWiFiNWActivityAPInterfaceStats addTxLatencyVI:](self, "addTxLatencyVI:", *(void *)(*((void *)&v46 + 1) + 8 * kk), (void)v46);
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
    }
    while (v43);
  }
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
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

@end