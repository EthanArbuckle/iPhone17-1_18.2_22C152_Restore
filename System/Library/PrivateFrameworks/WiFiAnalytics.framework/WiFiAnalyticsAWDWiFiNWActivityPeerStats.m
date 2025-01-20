@interface WiFiAnalyticsAWDWiFiNWActivityPeerStats
+ (Class)acCompletionsType;
+ (Class)bytesType;
+ (Class)ccaType;
+ (Class)packetsType;
+ (Class)rssiType;
+ (Class)snrType;
+ (Class)txLatencyBEType;
+ (Class)txLatencyBKType;
+ (Class)txLatencyVIType;
+ (Class)txLatencyVOType;
- (BOOL)hasCcaValue;
- (BOOL)hasCompletions;
- (BOOL)hasHashID;
- (BOOL)hasIbssCCA;
- (BOOL)hasInterferenceCCA;
- (BOOL)hasNfValue;
- (BOOL)hasObssCCA;
- (BOOL)hasOfdmDesense;
- (BOOL)hasQbssCCA;
- (BOOL)hasQbssSTACount;
- (BOOL)hasRole;
- (BOOL)hasRssiValue;
- (BOOL)hasRssiValue0;
- (BOOL)hasRssiValue1;
- (BOOL)hasSnrValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)acCompletions;
- (NSMutableArray)bytes;
- (NSMutableArray)ccas;
- (NSMutableArray)packets;
- (NSMutableArray)rssis;
- (NSMutableArray)snrs;
- (NSMutableArray)txLatencyBEs;
- (NSMutableArray)txLatencyBKs;
- (NSMutableArray)txLatencyVIs;
- (NSMutableArray)txLatencyVOs;
- (NSString)hashID;
- (WiFiAnalyticsAWDWiFiNWActivityTxCompletions)completions;
- (id)acCompletionsAtIndex:(unint64_t)a3;
- (id)bytesAtIndex:(unint64_t)a3;
- (id)ccaAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)packetsAtIndex:(unint64_t)a3;
- (id)roleAsString:(int)a3;
- (id)rssiAtIndex:(unint64_t)a3;
- (id)snrAtIndex:(unint64_t)a3;
- (id)txLatencyBEAtIndex:(unint64_t)a3;
- (id)txLatencyBKAtIndex:(unint64_t)a3;
- (id)txLatencyVIAtIndex:(unint64_t)a3;
- (id)txLatencyVOAtIndex:(unint64_t)a3;
- (int)StringAsRole:(id)a3;
- (int)nfValue;
- (int)role;
- (int)rssiValue;
- (int)rssiValue0;
- (int)rssiValue1;
- (int)snrValue;
- (unint64_t)acCompletionsCount;
- (unint64_t)bytesCount;
- (unint64_t)ccasCount;
- (unint64_t)hash;
- (unint64_t)packetsCount;
- (unint64_t)rssisCount;
- (unint64_t)snrsCount;
- (unint64_t)txLatencyBEsCount;
- (unint64_t)txLatencyBKsCount;
- (unint64_t)txLatencyVIsCount;
- (unint64_t)txLatencyVOsCount;
- (unsigned)ccaValue;
- (unsigned)ibssCCA;
- (unsigned)interferenceCCA;
- (unsigned)obssCCA;
- (unsigned)ofdmDesense;
- (unsigned)qbssCCA;
- (unsigned)qbssSTACount;
- (void)addAcCompletions:(id)a3;
- (void)addBytes:(id)a3;
- (void)addCca:(id)a3;
- (void)addPackets:(id)a3;
- (void)addRssi:(id)a3;
- (void)addSnr:(id)a3;
- (void)addTxLatencyBE:(id)a3;
- (void)addTxLatencyBK:(id)a3;
- (void)addTxLatencyVI:(id)a3;
- (void)addTxLatencyVO:(id)a3;
- (void)clearAcCompletions;
- (void)clearBytes;
- (void)clearCcas;
- (void)clearPackets;
- (void)clearRssis;
- (void)clearSnrs;
- (void)clearTxLatencyBEs;
- (void)clearTxLatencyBKs;
- (void)clearTxLatencyVIs;
- (void)clearTxLatencyVOs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcCompletions:(id)a3;
- (void)setBytes:(id)a3;
- (void)setCcaValue:(unsigned int)a3;
- (void)setCcas:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setHasCcaValue:(BOOL)a3;
- (void)setHasIbssCCA:(BOOL)a3;
- (void)setHasInterferenceCCA:(BOOL)a3;
- (void)setHasNfValue:(BOOL)a3;
- (void)setHasObssCCA:(BOOL)a3;
- (void)setHasOfdmDesense:(BOOL)a3;
- (void)setHasQbssCCA:(BOOL)a3;
- (void)setHasQbssSTACount:(BOOL)a3;
- (void)setHasRole:(BOOL)a3;
- (void)setHasRssiValue0:(BOOL)a3;
- (void)setHasRssiValue1:(BOOL)a3;
- (void)setHasRssiValue:(BOOL)a3;
- (void)setHasSnrValue:(BOOL)a3;
- (void)setHashID:(id)a3;
- (void)setIbssCCA:(unsigned int)a3;
- (void)setInterferenceCCA:(unsigned int)a3;
- (void)setNfValue:(int)a3;
- (void)setObssCCA:(unsigned int)a3;
- (void)setOfdmDesense:(unsigned int)a3;
- (void)setPackets:(id)a3;
- (void)setQbssCCA:(unsigned int)a3;
- (void)setQbssSTACount:(unsigned int)a3;
- (void)setRole:(int)a3;
- (void)setRssiValue0:(int)a3;
- (void)setRssiValue1:(int)a3;
- (void)setRssiValue:(int)a3;
- (void)setRssis:(id)a3;
- (void)setSnrValue:(int)a3;
- (void)setSnrs:(id)a3;
- (void)setTxLatencyBEs:(id)a3;
- (void)setTxLatencyBKs:(id)a3;
- (void)setTxLatencyVIs:(id)a3;
- (void)setTxLatencyVOs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityPeerStats

- (void)writeTo:(id)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hashID) {
    PBDataWriterWriteStringField();
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v5 = self->_rssis;
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
  v10 = self->_ccas;
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
  v15 = self->_snrs;
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
  v20 = self->_packets;
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
  v25 = self->_bytes;
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

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v30 = self->_txLatencyBKs;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v72 objects:v100 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v73;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v73 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v72 objects:v100 count:16];
    }
    while (v32);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v35 = self->_txLatencyBEs;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v68 objects:v99 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v69;
    do
    {
      for (juint64_t j = 0; jj != v37; ++jj)
      {
        if (*(void *)v69 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v68 objects:v99 count:16];
    }
    while (v37);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v40 = self->_txLatencyVOs;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v64 objects:v98 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v65;
    do
    {
      for (kuint64_t k = 0; kk != v42; ++kk)
      {
        if (*(void *)v65 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v64 objects:v98 count:16];
    }
    while (v42);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v45 = self->_txLatencyVIs;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v60 objects:v97 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v61;
    do
    {
      for (muint64_t m = 0; mm != v47; ++mm)
      {
        if (*(void *)v61 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v60 objects:v97 count:16];
    }
    while (v47);
  }

  if (self->_completions) {
    PBDataWriterWriteSubmessage();
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v50 = self->_acCompletions;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v56 objects:v96 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v57;
    do
    {
      for (nuint64_t n = 0; nn != v52; ++nn)
      {
        if (*(void *)v57 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v56 objects:v96 count:16];
    }
    while (v52);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_79:
      if ((has & 1) == 0) {
        goto LABEL_80;
      }
      goto LABEL_93;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_80:
    if ((has & 8) == 0) {
      goto LABEL_81;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_81:
    if ((has & 0x20) == 0) {
      goto LABEL_82;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_82:
    if ((has & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_83:
    if ((has & 0x10) == 0) {
      goto LABEL_84;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_84:
    if ((has & 4) == 0) {
      goto LABEL_85;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_85:
    if ((has & 0x40) == 0) {
      goto LABEL_86;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_86:
    if ((has & 0x80) == 0) {
      goto LABEL_87;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_87:
    if ((has & 0x400) == 0) {
      goto LABEL_88;
    }
LABEL_101:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_101;
  }
LABEL_88:
  if ((has & 0x800) != 0) {
LABEL_89:
  }
    PBDataWriterWriteInt32Field();
LABEL_90:
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

- (void)addCca:(id)a3
{
  id v4 = a3;
  ccas = self->_ccas;
  id v8 = v4;
  if (!ccas)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_ccas;
    self->_ccas = v6;

    id v4 = v8;
    ccas = self->_ccas;
  }
  [(NSMutableArray *)ccas addObject:v4];
}

- (void)addSnr:(id)a3
{
  id v4 = a3;
  snrs = self->_snrs;
  id v8 = v4;
  if (!snrs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_snrs;
    self->_snrs = v6;

    id v4 = v8;
    snrs = self->_snrs;
  }
  [(NSMutableArray *)snrs addObject:v4];
}

- (void)addRssi:(id)a3
{
  id v4 = a3;
  rssis = self->_rssis;
  id v8 = v4;
  if (!rssis)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_rssis;
    self->_rssis = v6;

    id v4 = v8;
    rssis = self->_rssis;
  }
  [(NSMutableArray *)rssis addObject:v4];
}

- (void)addAcCompletions:(id)a3
{
  id v4 = a3;
  acCompletions = self->_acCompletions;
  id v8 = v4;
  if (!acCompletions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_acCompletions;
    self->_acCompletions = v6;

    id v4 = v8;
    acCompletions = self->_acCompletions;
  }
  [(NSMutableArray *)acCompletions addObject:v4];
}

- (id)dictionaryRepresentation
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t role = self->_role;
    if (role >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_role);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_264467510[role];
    }
    [v3 setObject:v5 forKey:@"role"];
  }
  hashID = self->_hashID;
  if (hashID) {
    [v3 setObject:hashID forKey:@"hashID"];
  }
  if ([(NSMutableArray *)self->_rssis count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_rssis, "count"));
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v8 = self->_rssis;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v130 objects:v143 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v131;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v131 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v130 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v130 objects:v143 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"rssi"];
  }
  if ([(NSMutableArray *)self->_ccas count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_ccas, "count"));
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v15 = self->_ccas;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v126 objects:v142 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v127;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v127 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v126 + 1) + 8 * j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v126 objects:v142 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"cca"];
  }
  if ([(NSMutableArray *)self->_snrs count])
  {
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_snrs, "count"));
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    uint64_t v22 = self->_snrs;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v122 objects:v141 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v123;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v123 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [*(id *)(*((void *)&v122 + 1) + 8 * k) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v122 objects:v141 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"snr"];
  }
  if ([(NSMutableArray *)self->_packets count])
  {
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_packets, "count"));
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    v29 = self->_packets;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v118 objects:v140 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v119;
      do
      {
        for (uint64_t m = 0; m != v31; ++m)
        {
          if (*(void *)v119 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v118 + 1) + 8 * m) dictionaryRepresentation];
          [v28 addObject:v34];
        }
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v118 objects:v140 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKey:@"packets"];
  }
  if ([(NSMutableArray *)self->_bytes count])
  {
    v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_bytes, "count"));
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    uint64_t v36 = self->_bytes;
    uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v114 objects:v139 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v115;
      do
      {
        for (uint64_t n = 0; n != v38; ++n)
        {
          if (*(void *)v115 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = [*(id *)(*((void *)&v114 + 1) + 8 * n) dictionaryRepresentation];
          [v35 addObject:v41];
        }
        uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v114 objects:v139 count:16];
      }
      while (v38);
    }

    [v3 setObject:v35 forKey:@"bytes"];
  }
  if ([(NSMutableArray *)self->_txLatencyBKs count])
  {
    uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBKs, "count"));
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v43 = self->_txLatencyBKs;
    uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v110 objects:v138 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v111;
      do
      {
        for (iuint64_t i = 0; ii != v45; ++ii)
        {
          if (*(void *)v111 != v46) {
            objc_enumerationMutation(v43);
          }
          uint64_t v48 = [*(id *)(*((void *)&v110 + 1) + 8 * ii) dictionaryRepresentation];
          [v42 addObject:v48];
        }
        uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v110 objects:v138 count:16];
      }
      while (v45);
    }

    [v3 setObject:v42 forKey:@"txLatencyBK"];
  }
  if ([(NSMutableArray *)self->_txLatencyBEs count])
  {
    v49 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyBEs, "count"));
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v50 = self->_txLatencyBEs;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v106 objects:v137 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v107;
      do
      {
        for (juint64_t j = 0; jj != v52; ++jj)
        {
          if (*(void *)v107 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = [*(id *)(*((void *)&v106 + 1) + 8 * jj) dictionaryRepresentation];
          [v49 addObject:v55];
        }
        uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v106 objects:v137 count:16];
      }
      while (v52);
    }

    [v3 setObject:v49 forKey:@"txLatencyBE"];
  }
  if ([(NSMutableArray *)self->_txLatencyVOs count])
  {
    long long v56 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVOs, "count"));
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v57 = self->_txLatencyVOs;
    uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v102 objects:v136 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v103;
      do
      {
        for (kuint64_t k = 0; kk != v59; ++kk)
        {
          if (*(void *)v103 != v60) {
            objc_enumerationMutation(v57);
          }
          long long v62 = [*(id *)(*((void *)&v102 + 1) + 8 * kk) dictionaryRepresentation];
          [v56 addObject:v62];
        }
        uint64_t v59 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v102 objects:v136 count:16];
      }
      while (v59);
    }

    [v3 setObject:v56 forKey:@"txLatencyVO"];
  }
  if ([(NSMutableArray *)self->_txLatencyVIs count])
  {
    long long v63 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txLatencyVIs, "count"));
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v64 = self->_txLatencyVIs;
    uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v98 objects:v135 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v99;
      do
      {
        for (muint64_t m = 0; mm != v66; ++mm)
        {
          if (*(void *)v99 != v67) {
            objc_enumerationMutation(v64);
          }
          long long v69 = [*(id *)(*((void *)&v98 + 1) + 8 * mm) dictionaryRepresentation];
          [v63 addObject:v69];
        }
        uint64_t v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v98 objects:v135 count:16];
      }
      while (v66);
    }

    [v3 setObject:v63 forKey:@"txLatencyVI"];
  }
  completions = self->_completions;
  if (completions)
  {
    long long v71 = [(WiFiAnalyticsAWDWiFiNWActivityTxCompletions *)completions dictionaryRepresentation];
    [v3 setObject:v71 forKey:@"completions"];
  }
  if ([(NSMutableArray *)self->_acCompletions count])
  {
    long long v72 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_acCompletions, "count"));
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v73 = self->_acCompletions;
    uint64_t v74 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v94 objects:v134 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v95;
      do
      {
        for (nuint64_t n = 0; nn != v75; ++nn)
        {
          if (*(void *)v95 != v76) {
            objc_enumerationMutation(v73);
          }
          long long v78 = [*(id *)(*((void *)&v94 + 1) + 8 * nn) dictionaryRepresentation];
          [v72 addObject:v78];
        }
        uint64_t v75 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v94 objects:v134 count:16];
      }
      while (v75);
    }

    [v3 setObject:v72 forKey:@"acCompletions"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    long long v83 = [NSNumber numberWithInt:self->_rssiValue];
    [v3 setObject:v83 forKey:@"rssiValue"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_102:
      if ((has & 1) == 0) {
        goto LABEL_103;
      }
      goto LABEL_116;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_102;
  }
  long long v84 = [NSNumber numberWithInt:self->_snrValue];
  [v3 setObject:v84 forKey:@"snrValue"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_103:
    if ((has & 8) == 0) {
      goto LABEL_104;
    }
    goto LABEL_117;
  }
LABEL_116:
  long long v85 = [NSNumber numberWithUnsignedInt:self->_ccaValue];
  [v3 setObject:v85 forKey:@"ccaValue"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_104:
    if ((has & 0x20) == 0) {
      goto LABEL_105;
    }
    goto LABEL_118;
  }
LABEL_117:
  long long v86 = [NSNumber numberWithInt:self->_nfValue];
  [v3 setObject:v86 forKey:@"nfValue"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_105:
    if ((has & 2) == 0) {
      goto LABEL_106;
    }
    goto LABEL_119;
  }
LABEL_118:
  long long v87 = [NSNumber numberWithUnsignedInt:self->_ofdmDesense];
  [v3 setObject:v87 forKey:@"ofdmDesense"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_106:
    if ((has & 0x10) == 0) {
      goto LABEL_107;
    }
    goto LABEL_120;
  }
LABEL_119:
  long long v88 = [NSNumber numberWithUnsignedInt:self->_ibssCCA];
  [v3 setObject:v88 forKey:@"ibssCCA"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_107:
    if ((has & 4) == 0) {
      goto LABEL_108;
    }
    goto LABEL_121;
  }
LABEL_120:
  long long v89 = [NSNumber numberWithUnsignedInt:self->_obssCCA];
  [v3 setObject:v89 forKey:@"obssCCA"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_108:
    if ((has & 0x40) == 0) {
      goto LABEL_109;
    }
    goto LABEL_122;
  }
LABEL_121:
  long long v90 = [NSNumber numberWithUnsignedInt:self->_interferenceCCA];
  [v3 setObject:v90 forKey:@"interferenceCCA"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_109:
    if ((has & 0x80) == 0) {
      goto LABEL_110;
    }
    goto LABEL_123;
  }
LABEL_122:
  long long v91 = [NSNumber numberWithUnsignedInt:self->_qbssCCA];
  [v3 setObject:v91 forKey:@"qbssCCA"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_110:
    if ((has & 0x400) == 0) {
      goto LABEL_111;
    }
LABEL_124:
    long long v93 = [NSNumber numberWithInt:self->_rssiValue0];
    [v3 setObject:v93 forKey:@"rssiValue0"];

    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_113;
    }
    goto LABEL_112;
  }
LABEL_123:
  long long v92 = [NSNumber numberWithUnsignedInt:self->_qbssSTACount];
  [v3 setObject:v92 forKey:@"qbssSTACount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_124;
  }
LABEL_111:
  if ((has & 0x800) != 0)
  {
LABEL_112:
    long long v80 = [NSNumber numberWithInt:self->_rssiValue1];
    [v3 setObject:v80 forKey:@"rssiValue1"];
  }
LABEL_113:
  id v81 = v3;

  return v81;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txLatencyVOs, 0);
  objc_storeStrong((id *)&self->_txLatencyVIs, 0);
  objc_storeStrong((id *)&self->_txLatencyBKs, 0);
  objc_storeStrong((id *)&self->_txLatencyBEs, 0);
  objc_storeStrong((id *)&self->_snrs, 0);
  objc_storeStrong((id *)&self->_rssis, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_hashID, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_ccas, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_acCompletions, 0);
}

- (void)setSnrValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_snrValue = a3;
}

- (void)setRssiValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rssiValue = a3;
}

- (void)setRssiValue1:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rssiValue1 = a3;
}

- (void)setRssiValue0:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rssiValue0 = a3;
}

- (void)setRole:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_uint64_t role = a3;
}

- (void)setQbssSTACount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qbssSTACount = a3;
}

- (void)setQbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_qbssCCA = a3;
}

- (void)setOfdmDesense:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ofdmDesense = a3;
}

- (void)setObssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_obssCCA = a3;
}

- (void)setNfValue:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_nfValue = a3;
}

- (void)setInterferenceCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_interferenceCCA = a3;
}

- (void)setIbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ibssCCA = a3;
}

- (void)setHashID:(id)a3
{
}

- (void)setCompletions:(id)a3
{
}

- (void)setCcaValue:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ccaValue = a3;
}

- (int)role
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_role;
  }
  else {
    return 0;
  }
}

- (void)setHasRole:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRole
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264467510[a3];
  }
  return v3;
}

- (int)StringAsRole:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INFRA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEGACYAWDL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LLWAWDL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasHashID
{
  return self->_hashID != 0;
}

- (void)clearRssis
{
}

- (unint64_t)rssisCount
{
  return [(NSMutableArray *)self->_rssis count];
}

- (id)rssiAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rssis objectAtIndex:a3];
}

+ (Class)rssiType
{
  return (Class)objc_opt_class();
}

- (void)clearCcas
{
}

- (unint64_t)ccasCount
{
  return [(NSMutableArray *)self->_ccas count];
}

- (id)ccaAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ccas objectAtIndex:a3];
}

+ (Class)ccaType
{
  return (Class)objc_opt_class();
}

- (void)clearSnrs
{
}

- (unint64_t)snrsCount
{
  return [(NSMutableArray *)self->_snrs count];
}

- (id)snrAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_snrs objectAtIndex:a3];
}

+ (Class)snrType
{
  return (Class)objc_opt_class();
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

- (BOOL)hasCompletions
{
  return self->_completions != 0;
}

- (void)clearAcCompletions
{
}

- (unint64_t)acCompletionsCount
{
  return [(NSMutableArray *)self->_acCompletions count];
}

- (id)acCompletionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_acCompletions objectAtIndex:a3];
}

+ (Class)acCompletionsType
{
  return (Class)objc_opt_class();
}

- (void)setHasRssiValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRssiValue
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasSnrValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSnrValue
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasCcaValue:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCcaValue
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNfValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNfValue
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasOfdmDesense:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOfdmDesense
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasIbssCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasIbssCCA
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasObssCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasObssCCA
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasInterferenceCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInterferenceCCA
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasQbssCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQbssCCA
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasQbssSTACount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQbssSTACount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasRssiValue0:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRssiValue0
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasRssiValue1:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRssiValue1
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityPeerStats;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityPeerStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v4[24] = self->_role;
    *((_WORD *)v4 + 84) |= 0x100u;
  }
  id v46 = v4;
  if (self->_hashID) {
    objc_msgSend(v4, "setHashID:");
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self rssisCount])
  {
    [v46 clearRssis];
    unint64_t v5 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self rssisCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_super v8 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self rssiAtIndex:i];
        [v46 addRssi:v8];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self ccasCount])
  {
    [v46 clearCcas];
    unint64_t v9 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self ccasCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self ccaAtIndex:j];
        [v46 addCca:v12];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self snrsCount])
  {
    [v46 clearSnrs];
    unint64_t v13 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self snrsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self snrAtIndex:k];
        [v46 addSnr:v16];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self packetsCount])
  {
    [v46 clearPackets];
    unint64_t v17 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self packetsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self packetsAtIndex:m];
        [v46 addPackets:v20];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self bytesCount])
  {
    [v46 clearBytes];
    unint64_t v21 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self bytesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self bytesAtIndex:n];
        [v46 addBytes:v24];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyBKsCount])
  {
    [v46 clearTxLatencyBKs];
    unint64_t v25 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyBKsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyBKAtIndex:ii];
        [v46 addTxLatencyBK:v28];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyBEsCount])
  {
    [v46 clearTxLatencyBEs];
    unint64_t v29 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyBEsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyBEAtIndex:jj];
        [v46 addTxLatencyBE:v32];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyVOsCount])
  {
    [v46 clearTxLatencyVOs];
    unint64_t v33 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyVOsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        uint64_t v36 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyVOAtIndex:kk];
        [v46 addTxLatencyVO:v36];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyVIsCount])
  {
    [v46 clearTxLatencyVIs];
    unint64_t v37 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyVIsCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0; mm != v38; ++mm)
      {
        v40 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self txLatencyVIAtIndex:mm];
        [v46 addTxLatencyVI:v40];
      }
    }
  }
  if (self->_completions) {
    objc_msgSend(v46, "setCompletions:");
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self acCompletionsCount])
  {
    [v46 clearAcCompletions];
    unint64_t v41 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self acCompletionsCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (nuint64_t n = 0; nn != v42; ++nn)
      {
        uint64_t v44 = [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self acCompletionsAtIndex:nn];
        [v46 addAcCompletions:v44];
      }
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v46 + 25) = self->_rssiValue;
    *((_WORD *)v46 + 84) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_49:
      if ((has & 1) == 0) {
        goto LABEL_50;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_49;
  }
  *((_DWORD *)v46 + 30) = self->_snrValue;
  *((_WORD *)v46 + 84) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_50:
    if ((has & 8) == 0) {
      goto LABEL_51;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v46 + 6) = self->_ccaValue;
  *((_WORD *)v46 + 84) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_51:
    if ((has & 0x20) == 0) {
      goto LABEL_52;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v46 + 16) = self->_nfValue;
  *((_WORD *)v46 + 84) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_52:
    if ((has & 2) == 0) {
      goto LABEL_53;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v46 + 18) = self->_ofdmDesense;
  *((_WORD *)v46 + 84) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_53:
    if ((has & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v46 + 14) = self->_ibssCCA;
  *((_WORD *)v46 + 84) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_54:
    if ((has & 4) == 0) {
      goto LABEL_55;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v46 + 17) = self->_obssCCA;
  *((_WORD *)v46 + 84) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_55:
    if ((has & 0x40) == 0) {
      goto LABEL_56;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v46 + 15) = self->_interferenceCCA;
  *((_WORD *)v46 + 84) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_56:
    if ((has & 0x80) == 0) {
      goto LABEL_57;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v46 + 22) = self->_qbssCCA;
  *((_WORD *)v46 + 84) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_57:
    if ((has & 0x400) == 0) {
      goto LABEL_58;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v46 + 23) = self->_qbssSTACount;
  *((_WORD *)v46 + 84) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_58:
    if ((has & 0x800) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_73:
  *((_DWORD *)v46 + 26) = self->_rssiValue0;
  *((_WORD *)v46 + 84) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_59:
    *((_DWORD *)v46 + 27) = self->_rssiValue1;
    *((_WORD *)v46 + 84) |= 0x800u;
  }
LABEL_60:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_role;
    *(_WORD *)(v5 + 168) |= 0x100u;
  }
  uint64_t v7 = [(NSString *)self->_hashID copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  unint64_t v9 = self->_rssis;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v109 objects:v122 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v110 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addRssi:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v109 objects:v122 count:16];
    }
    while (v11);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v15 = self->_ccas;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v105 objects:v121 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v106;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v106 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = (void *)[*(id *)(*((void *)&v105 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addCca:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v105 objects:v121 count:16];
    }
    while (v17);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  unint64_t v21 = self->_snrs;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v101 objects:v120 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v102 != v24) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = (void *)[*(id *)(*((void *)&v101 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addSnr:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v101 objects:v120 count:16];
    }
    while (v23);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v27 = self->_packets;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v97 objects:v119 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v98;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v98 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = (void *)[*(id *)(*((void *)&v97 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addPackets:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v97 objects:v119 count:16];
    }
    while (v29);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  unint64_t v33 = self->_bytes;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v93 objects:v118 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v94;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v94 != v36) {
          objc_enumerationMutation(v33);
        }
        unint64_t v38 = (void *)[*(id *)(*((void *)&v93 + 1) + 8 * n) copyWithZone:a3];
        [(id)v6 addBytes:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v93 objects:v118 count:16];
    }
    while (v35);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v39 = self->_txLatencyBKs;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v89 objects:v117 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v90;
    do
    {
      for (iuint64_t i = 0; ii != v41; ++ii)
      {
        if (*(void *)v90 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v6 addTxLatencyBK:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v89 objects:v117 count:16];
    }
    while (v41);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v45 = self->_txLatencyBEs;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v85 objects:v116 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v86;
    do
    {
      for (juint64_t j = 0; jj != v47; ++jj)
      {
        if (*(void *)v86 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = (void *)[*(id *)(*((void *)&v85 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v6 addTxLatencyBE:v50];
      }
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v85 objects:v116 count:16];
    }
    while (v47);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v51 = self->_txLatencyVOs;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v81 objects:v115 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v82;
    do
    {
      for (kuint64_t k = 0; kk != v53; ++kk)
      {
        if (*(void *)v82 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = (void *)[*(id *)(*((void *)&v81 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v6 addTxLatencyVO:v56];
      }
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v81 objects:v115 count:16];
    }
    while (v53);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v57 = self->_txLatencyVIs;
  uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v77 objects:v114 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v78;
    do
    {
      for (muint64_t m = 0; mm != v59; ++mm)
      {
        if (*(void *)v78 != v60) {
          objc_enumerationMutation(v57);
        }
        long long v62 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v6 addTxLatencyVI:v62];
      }
      uint64_t v59 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v77 objects:v114 count:16];
    }
    while (v59);
  }

  id v63 = [(WiFiAnalyticsAWDWiFiNWActivityTxCompletions *)self->_completions copyWithZone:a3];
  long long v64 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v63;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v65 = self->_acCompletions;
  uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v73 objects:v113 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v74;
    do
    {
      for (nuint64_t n = 0; nn != v67; ++nn)
      {
        if (*(void *)v74 != v68) {
          objc_enumerationMutation(v65);
        }
        long long v70 = objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * nn), "copyWithZone:", a3, (void)v73);
        [(id)v6 addAcCompletions:v70];
      }
      uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v73 objects:v113 count:16];
    }
    while (v67);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_rssiValue;
    *(_WORD *)(v6 + 168) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_75:
      if ((has & 1) == 0) {
        goto LABEL_76;
      }
      goto LABEL_89;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_75;
  }
  *(_DWORD *)(v6 + 120) = self->_snrValue;
  *(_WORD *)(v6 + 168) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_76:
    if ((has & 8) == 0) {
      goto LABEL_77;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v6 + 24) = self->_ccaValue;
  *(_WORD *)(v6 + 168) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_77:
    if ((has & 0x20) == 0) {
      goto LABEL_78;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v6 + 64) = self->_nfValue;
  *(_WORD *)(v6 + 168) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_78:
    if ((has & 2) == 0) {
      goto LABEL_79;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v6 + 72) = self->_ofdmDesense;
  *(_WORD *)(v6 + 168) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_79:
    if ((has & 0x10) == 0) {
      goto LABEL_80;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v6 + 56) = self->_ibssCCA;
  *(_WORD *)(v6 + 168) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_80:
    if ((has & 4) == 0) {
      goto LABEL_81;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 68) = self->_obssCCA;
  *(_WORD *)(v6 + 168) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_81:
    if ((has & 0x40) == 0) {
      goto LABEL_82;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v6 + 60) = self->_interferenceCCA;
  *(_WORD *)(v6 + 168) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_82:
    if ((has & 0x80) == 0) {
      goto LABEL_83;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 88) = self->_qbssCCA;
  *(_WORD *)(v6 + 168) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_83:
    if ((has & 0x400) == 0) {
      goto LABEL_84;
    }
LABEL_97:
    *(_DWORD *)(v6 + 104) = self->_rssiValue0;
    *(_WORD *)(v6 + 168) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return (id)v6;
    }
    goto LABEL_85;
  }
LABEL_96:
  *(_DWORD *)(v6 + 92) = self->_qbssSTACount;
  *(_WORD *)(v6 + 168) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_97;
  }
LABEL_84:
  if ((has & 0x800) != 0)
  {
LABEL_85:
    *(_DWORD *)(v6 + 108) = self->_rssiValue1;
    *(_WORD *)(v6 + 168) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x100) == 0 || self->_role != *((_DWORD *)v4 + 24)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x100) != 0)
  {
LABEL_91:
    BOOL v19 = 0;
    goto LABEL_92;
  }
  hashID = self->_hashID;
  if ((unint64_t)hashID | *((void *)v4 + 6) && !-[NSString isEqual:](hashID, "isEqual:")) {
    goto LABEL_91;
  }
  rssis = self->_rssis;
  if ((unint64_t)rssis | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](rssis, "isEqual:")) {
      goto LABEL_91;
    }
  }
  ccas = self->_ccas;
  if ((unint64_t)ccas | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](ccas, "isEqual:")) {
      goto LABEL_91;
    }
  }
  snrs = self->_snrs;
  if ((unint64_t)snrs | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](snrs, "isEqual:")) {
      goto LABEL_91;
    }
  }
  packets = self->_packets;
  if ((unint64_t)packets | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](packets, "isEqual:")) {
      goto LABEL_91;
    }
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](bytes, "isEqual:")) {
      goto LABEL_91;
    }
  }
  txLatencyBKs = self->_txLatencyBKs;
  if ((unint64_t)txLatencyBKs | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBKs, "isEqual:")) {
      goto LABEL_91;
    }
  }
  txLatencyBEs = self->_txLatencyBEs;
  if ((unint64_t)txLatencyBEs | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](txLatencyBEs, "isEqual:")) {
      goto LABEL_91;
    }
  }
  txLatencyVOs = self->_txLatencyVOs;
  if ((unint64_t)txLatencyVOs | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVOs, "isEqual:")) {
      goto LABEL_91;
    }
  }
  txLatencyVIs = self->_txLatencyVIs;
  if ((unint64_t)txLatencyVIs | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](txLatencyVIs, "isEqual:")) {
      goto LABEL_91;
    }
  }
  completions = self->_completions;
  if ((unint64_t)completions | *((void *)v4 + 5))
  {
    if (!-[WiFiAnalyticsAWDWiFiNWActivityTxCompletions isEqual:](completions, "isEqual:")) {
      goto LABEL_91;
    }
  }
  acCompletions = self->_acCompletions;
  if ((unint64_t)acCompletions | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](acCompletions, "isEqual:")) {
      goto LABEL_91;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v18 = *((_WORD *)v4 + 84);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x200) == 0 || self->_rssiValue != *((_DWORD *)v4 + 25)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x1000) == 0 || self->_snrValue != *((_DWORD *)v4 + 30)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  if (has)
  {
    if ((v18 & 1) == 0 || self->_ccaValue != *((_DWORD *)v4 + 6)) {
      goto LABEL_91;
    }
  }
  else if (v18)
  {
    goto LABEL_91;
  }
  if ((has & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_nfValue != *((_DWORD *)v4 + 16)) {
      goto LABEL_91;
    }
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_ofdmDesense != *((_DWORD *)v4 + 18)) {
      goto LABEL_91;
    }
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_ibssCCA != *((_DWORD *)v4 + 14)) {
      goto LABEL_91;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_obssCCA != *((_DWORD *)v4 + 17)) {
      goto LABEL_91;
    }
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_interferenceCCA != *((_DWORD *)v4 + 15)) {
      goto LABEL_91;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_qbssCCA != *((_DWORD *)v4 + 22)) {
      goto LABEL_91;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_qbssSTACount != *((_DWORD *)v4 + 23)) {
      goto LABEL_91;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x400) == 0 || self->_rssiValue0 != *((_DWORD *)v4 + 26)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 84) & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 84) & 0x800) == 0 || self->_rssiValue1 != *((_DWORD *)v4 + 27)) {
      goto LABEL_91;
    }
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = (v18 & 0x800) == 0;
  }
LABEL_92:

  return v19;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v29 = 2654435761 * self->_role;
  }
  else {
    uint64_t v29 = 0;
  }
  NSUInteger v28 = [(NSString *)self->_hashID hash];
  uint64_t v27 = [(NSMutableArray *)self->_rssis hash];
  uint64_t v26 = [(NSMutableArray *)self->_ccas hash];
  uint64_t v25 = [(NSMutableArray *)self->_snrs hash];
  uint64_t v3 = [(NSMutableArray *)self->_packets hash];
  uint64_t v4 = [(NSMutableArray *)self->_bytes hash];
  uint64_t v5 = [(NSMutableArray *)self->_txLatencyBKs hash];
  uint64_t v6 = [(NSMutableArray *)self->_txLatencyBEs hash];
  uint64_t v7 = [(NSMutableArray *)self->_txLatencyVOs hash];
  uint64_t v8 = [(NSMutableArray *)self->_txLatencyVIs hash];
  unint64_t v9 = [(WiFiAnalyticsAWDWiFiNWActivityTxCompletions *)self->_completions hash];
  uint64_t v10 = [(NSMutableArray *)self->_acCompletions hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v12 = 2654435761 * self->_rssiValue;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_6:
      uint64_t v13 = 2654435761 * self->_snrValue;
      if (has) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v13 = 0;
  if (has)
  {
LABEL_7:
    uint64_t v14 = 2654435761 * self->_ccaValue;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v15 = 2654435761 * self->_nfValue;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v16 = 2654435761 * self->_ofdmDesense;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v16 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    uint64_t v17 = 2654435761 * self->_ibssCCA;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v17 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v18 = 2654435761 * self->_obssCCA;
    if ((has & 4) != 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_12:
    uint64_t v19 = 2654435761 * self->_interferenceCCA;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v19 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    uint64_t v20 = 2654435761 * self->_qbssCCA;
    if ((has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v20 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_14:
    uint64_t v21 = 2654435761 * self->_qbssSTACount;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_15;
    }
LABEL_27:
    uint64_t v22 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_16;
    }
LABEL_28:
    uint64_t v23 = 0;
    return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_26:
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_27;
  }
LABEL_15:
  uint64_t v22 = 2654435761 * self->_rssiValue0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_28;
  }
LABEL_16:
  uint64_t v23 = 2654435761 * self->_rssiValue1;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  if ((v4[42] & 0x100) != 0)
  {
    self->_uint64_t role = v4[24];
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 6)) {
    -[WiFiAnalyticsAWDWiFiNWActivityPeerStats setHashID:](self, "setHashID:");
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v6 = *((id *)v5 + 14);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v96 != v9) {
          objc_enumerationMutation(v6);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addRssi:*(void *)(*((void *)&v95 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v95 objects:v108 count:16];
    }
    while (v8);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v11 = *((id *)v5 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v92 != v14) {
          objc_enumerationMutation(v11);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addCca:*(void *)(*((void *)&v91 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v13);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v16 = *((id *)v5 + 16);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v87 objects:v106 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v88;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v88 != v19) {
          objc_enumerationMutation(v16);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addSnr:*(void *)(*((void *)&v87 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v87 objects:v106 count:16];
    }
    while (v18);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v21 = *((id *)v5 + 10);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v83 objects:v105 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v84;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v84 != v24) {
          objc_enumerationMutation(v21);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addPackets:*(void *)(*((void *)&v83 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v83 objects:v105 count:16];
    }
    while (v23);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v26 = *((id *)v5 + 2);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v79 objects:v104 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v80;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v80 != v29) {
          objc_enumerationMutation(v26);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addBytes:*(void *)(*((void *)&v79 + 1) + 8 * n)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v79 objects:v104 count:16];
    }
    while (v28);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v31 = *((id *)v5 + 18);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v75 objects:v103 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v76;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v76 != v34) {
          objc_enumerationMutation(v31);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addTxLatencyBK:*(void *)(*((void *)&v75 + 1) + 8 * ii)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v75 objects:v103 count:16];
    }
    while (v33);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v36 = *((id *)v5 + 17);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v102 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v72;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v72 != v39) {
          objc_enumerationMutation(v36);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addTxLatencyBE:*(void *)(*((void *)&v71 + 1) + 8 * jj)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v71 objects:v102 count:16];
    }
    while (v38);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v41 = *((id *)v5 + 20);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v67 objects:v101 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v68;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v68 != v44) {
          objc_enumerationMutation(v41);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addTxLatencyVO:*(void *)(*((void *)&v67 + 1) + 8 * kk)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v67 objects:v101 count:16];
    }
    while (v43);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v46 = *((id *)v5 + 19);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v63 objects:v100 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v64;
    do
    {
      for (muint64_t m = 0; mm != v48; ++mm)
      {
        if (*(void *)v64 != v49) {
          objc_enumerationMutation(v46);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityPeerStats *)self addTxLatencyVI:*(void *)(*((void *)&v63 + 1) + 8 * mm)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v63 objects:v100 count:16];
    }
    while (v48);
  }

  completions = self->_completions;
  uint64_t v52 = *((void *)v5 + 5);
  if (completions)
  {
    if (v52) {
      -[WiFiAnalyticsAWDWiFiNWActivityTxCompletions mergeFrom:](completions, "mergeFrom:");
    }
  }
  else if (v52)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityPeerStats setCompletions:](self, "setCompletions:");
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v53 = *((id *)v5 + 1);
  uint64_t v54 = [v53 countByEnumeratingWithState:&v59 objects:v99 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v60;
    do
    {
      for (nuint64_t n = 0; nn != v55; ++nn)
      {
        if (*(void *)v60 != v56) {
          objc_enumerationMutation(v53);
        }
        -[WiFiAnalyticsAWDWiFiNWActivityPeerStats addAcCompletions:](self, "addAcCompletions:", *(void *)(*((void *)&v59 + 1) + 8 * nn), (void)v59);
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v59 objects:v99 count:16];
    }
    while (v55);
  }

  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x200) != 0)
  {
    self->_rssiValue = *((_DWORD *)v5 + 25);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v58 = *((_WORD *)v5 + 84);
    if ((v58 & 0x1000) == 0)
    {
LABEL_82:
      if ((v58 & 1) == 0) {
        goto LABEL_83;
      }
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)v5 + 84) & 0x1000) == 0)
  {
    goto LABEL_82;
  }
  self->_snrValue = *((_DWORD *)v5 + 30);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 1) == 0)
  {
LABEL_83:
    if ((v58 & 8) == 0) {
      goto LABEL_84;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_ccaValue = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 1u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 8) == 0)
  {
LABEL_84:
    if ((v58 & 0x20) == 0) {
      goto LABEL_85;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_nfValue = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_has |= 8u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x20) == 0)
  {
LABEL_85:
    if ((v58 & 2) == 0) {
      goto LABEL_86;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_ofdmDesense = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 2) == 0)
  {
LABEL_86:
    if ((v58 & 0x10) == 0) {
      goto LABEL_87;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_ibssCCA = *((_DWORD *)v5 + 14);
  *(_WORD *)&self->_has |= 2u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x10) == 0)
  {
LABEL_87:
    if ((v58 & 4) == 0) {
      goto LABEL_88;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_obssCCA = *((_DWORD *)v5 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 4) == 0)
  {
LABEL_88:
    if ((v58 & 0x40) == 0) {
      goto LABEL_89;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_interferenceCCA = *((_DWORD *)v5 + 15);
  *(_WORD *)&self->_has |= 4u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x40) == 0)
  {
LABEL_89:
    if ((v58 & 0x80) == 0) {
      goto LABEL_90;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_qbssCCA = *((_DWORD *)v5 + 22);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x80) == 0)
  {
LABEL_90:
    if ((v58 & 0x400) == 0) {
      goto LABEL_91;
    }
LABEL_104:
    self->_rssiValue0 = *((_DWORD *)v5 + 26);
    *(_WORD *)&self->_has |= 0x400u;
    if ((*((_WORD *)v5 + 84) & 0x800) == 0) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
LABEL_103:
  self->_qbssSTACount = *((_DWORD *)v5 + 23);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v58 = *((_WORD *)v5 + 84);
  if ((v58 & 0x400) != 0) {
    goto LABEL_104;
  }
LABEL_91:
  if ((v58 & 0x800) != 0)
  {
LABEL_92:
    self->_rssiValue1 = *((_DWORD *)v5 + 27);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_93:
}

- (NSString)hashID
{
  return self->_hashID;
}

- (NSMutableArray)rssis
{
  return self->_rssis;
}

- (void)setRssis:(id)a3
{
}

- (NSMutableArray)ccas
{
  return self->_ccas;
}

- (void)setCcas:(id)a3
{
}

- (NSMutableArray)snrs
{
  return self->_snrs;
}

- (void)setSnrs:(id)a3
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

- (WiFiAnalyticsAWDWiFiNWActivityTxCompletions)completions
{
  return self->_completions;
}

- (NSMutableArray)acCompletions
{
  return self->_acCompletions;
}

- (void)setAcCompletions:(id)a3
{
}

- (int)rssiValue
{
  return self->_rssiValue;
}

- (int)snrValue
{
  return self->_snrValue;
}

- (unsigned)ccaValue
{
  return self->_ccaValue;
}

- (int)nfValue
{
  return self->_nfValue;
}

- (unsigned)ofdmDesense
{
  return self->_ofdmDesense;
}

- (unsigned)ibssCCA
{
  return self->_ibssCCA;
}

- (unsigned)obssCCA
{
  return self->_obssCCA;
}

- (unsigned)interferenceCCA
{
  return self->_interferenceCCA;
}

- (unsigned)qbssCCA
{
  return self->_qbssCCA;
}

- (unsigned)qbssSTACount
{
  return self->_qbssSTACount;
}

- (int)rssiValue0
{
  return self->_rssiValue0;
}

- (int)rssiValue1
{
  return self->_rssiValue1;
}

@end