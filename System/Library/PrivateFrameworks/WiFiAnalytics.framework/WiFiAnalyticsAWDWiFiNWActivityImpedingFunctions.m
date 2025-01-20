@interface WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions
+ (Class)cTLMIndex1Type;
+ (Class)cTLMIndexType;
+ (Class)txDutyCyclePct1Type;
+ (Class)txDutyCyclePctType;
+ (Class)txPowerBackoffDB1Type;
+ (Class)txPowerBackoffDBType;
- (BOOL)hasActivechains0;
- (BOOL)hasActivechains1;
- (BOOL)hasCtlmid0;
- (BOOL)hasCtlmid1;
- (BOOL)hasPpm0;
- (BOOL)hasPpm1;
- (BOOL)hasRc1Duration;
- (BOOL)hasRc1Request;
- (BOOL)hasRc1wlanCrit;
- (BOOL)hasRc1wlanCritDuration;
- (BOOL)hasRc2Duration;
- (BOOL)hasRc2Grant;
- (BOOL)hasRc2LongGrant;
- (BOOL)hasRc2Request;
- (BOOL)hasRc2cts2a;
- (BOOL)hasSdbtdm;
- (BOOL)hasTemp0;
- (BOOL)hasTemp1;
- (BOOL)hasTvpmindex0;
- (BOOL)hasTvpmindex1;
- (BOOL)hasTxduty0;
- (BOOL)hasTxduty1;
- (BOOL)hasTxpowerbackoff0;
- (BOOL)hasTxpowerbackoff1;
- (BOOL)hasVoltage0;
- (BOOL)hasVoltage1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cTLMIndex1s;
- (NSMutableArray)cTLMIndexs;
- (NSMutableArray)txDutyCyclePct1s;
- (NSMutableArray)txDutyCyclePcts;
- (NSMutableArray)txPowerBackoffDB1s;
- (NSMutableArray)txPowerBackoffDBs;
- (WiFiAnalyticsAWDWiFiTDM)sdbtdm;
- (id)cTLMIndex1AtIndex:(unint64_t)a3;
- (id)cTLMIndexAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)txDutyCyclePct1AtIndex:(unint64_t)a3;
- (id)txDutyCyclePctAtIndex:(unint64_t)a3;
- (id)txPowerBackoffDB1AtIndex:(unint64_t)a3;
- (id)txPowerBackoffDBAtIndex:(unint64_t)a3;
- (unint64_t)cTLMIndex1sCount;
- (unint64_t)cTLMIndexsCount;
- (unint64_t)hash;
- (unint64_t)txDutyCyclePct1sCount;
- (unint64_t)txDutyCyclePctsCount;
- (unint64_t)txPowerBackoffDB1sCount;
- (unint64_t)txPowerBackoffDBsCount;
- (unsigned)activechains0;
- (unsigned)activechains1;
- (unsigned)ctlmid0;
- (unsigned)ctlmid1;
- (unsigned)ppm0;
- (unsigned)ppm1;
- (unsigned)rc1Duration;
- (unsigned)rc1Request;
- (unsigned)rc1wlanCrit;
- (unsigned)rc1wlanCritDuration;
- (unsigned)rc2Duration;
- (unsigned)rc2Grant;
- (unsigned)rc2LongGrant;
- (unsigned)rc2Request;
- (unsigned)rc2cts2a;
- (unsigned)temp0;
- (unsigned)temp1;
- (unsigned)tvpmindex0;
- (unsigned)tvpmindex1;
- (unsigned)txduty0;
- (unsigned)txduty1;
- (unsigned)txpowerbackoff0;
- (unsigned)txpowerbackoff1;
- (unsigned)voltage0;
- (unsigned)voltage1;
- (void)addCTLMIndex1:(id)a3;
- (void)addCTLMIndex:(id)a3;
- (void)addTxDutyCyclePct1:(id)a3;
- (void)addTxDutyCyclePct:(id)a3;
- (void)addTxPowerBackoffDB1:(id)a3;
- (void)addTxPowerBackoffDB:(id)a3;
- (void)clearCTLMIndex1s;
- (void)clearCTLMIndexs;
- (void)clearTxDutyCyclePct1s;
- (void)clearTxDutyCyclePcts;
- (void)clearTxPowerBackoffDB1s;
- (void)clearTxPowerBackoffDBs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivechains0:(unsigned int)a3;
- (void)setActivechains1:(unsigned int)a3;
- (void)setCTLMIndex1s:(id)a3;
- (void)setCTLMIndexs:(id)a3;
- (void)setCtlmid0:(unsigned int)a3;
- (void)setCtlmid1:(unsigned int)a3;
- (void)setHasActivechains0:(BOOL)a3;
- (void)setHasActivechains1:(BOOL)a3;
- (void)setHasCtlmid0:(BOOL)a3;
- (void)setHasCtlmid1:(BOOL)a3;
- (void)setHasPpm0:(BOOL)a3;
- (void)setHasPpm1:(BOOL)a3;
- (void)setHasRc1Duration:(BOOL)a3;
- (void)setHasRc1Request:(BOOL)a3;
- (void)setHasRc1wlanCrit:(BOOL)a3;
- (void)setHasRc1wlanCritDuration:(BOOL)a3;
- (void)setHasRc2Duration:(BOOL)a3;
- (void)setHasRc2Grant:(BOOL)a3;
- (void)setHasRc2LongGrant:(BOOL)a3;
- (void)setHasRc2Request:(BOOL)a3;
- (void)setHasRc2cts2a:(BOOL)a3;
- (void)setHasTemp0:(BOOL)a3;
- (void)setHasTemp1:(BOOL)a3;
- (void)setHasTvpmindex0:(BOOL)a3;
- (void)setHasTvpmindex1:(BOOL)a3;
- (void)setHasTxduty0:(BOOL)a3;
- (void)setHasTxduty1:(BOOL)a3;
- (void)setHasTxpowerbackoff0:(BOOL)a3;
- (void)setHasTxpowerbackoff1:(BOOL)a3;
- (void)setHasVoltage0:(BOOL)a3;
- (void)setHasVoltage1:(BOOL)a3;
- (void)setPpm0:(unsigned int)a3;
- (void)setPpm1:(unsigned int)a3;
- (void)setRc1Duration:(unsigned int)a3;
- (void)setRc1Request:(unsigned int)a3;
- (void)setRc1wlanCrit:(unsigned int)a3;
- (void)setRc1wlanCritDuration:(unsigned int)a3;
- (void)setRc2Duration:(unsigned int)a3;
- (void)setRc2Grant:(unsigned int)a3;
- (void)setRc2LongGrant:(unsigned int)a3;
- (void)setRc2Request:(unsigned int)a3;
- (void)setRc2cts2a:(unsigned int)a3;
- (void)setSdbtdm:(id)a3;
- (void)setTemp0:(unsigned int)a3;
- (void)setTemp1:(unsigned int)a3;
- (void)setTvpmindex0:(unsigned int)a3;
- (void)setTvpmindex1:(unsigned int)a3;
- (void)setTxDutyCyclePct1s:(id)a3;
- (void)setTxDutyCyclePcts:(id)a3;
- (void)setTxPowerBackoffDB1s:(id)a3;
- (void)setTxPowerBackoffDBs:(id)a3;
- (void)setTxduty0:(unsigned int)a3;
- (void)setTxduty1:(unsigned int)a3;
- (void)setTxpowerbackoff0:(unsigned int)a3;
- (void)setTxpowerbackoff1:(unsigned int)a3;
- (void)setVoltage0:(unsigned int)a3;
- (void)setVoltage1:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions

- (void)addTxDutyCyclePct:(id)a3
{
  id v4 = a3;
  txDutyCyclePcts = self->_txDutyCyclePcts;
  id v8 = v4;
  if (!txDutyCyclePcts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_txDutyCyclePcts;
    self->_txDutyCyclePcts = v6;

    id v4 = v8;
    txDutyCyclePcts = self->_txDutyCyclePcts;
  }
  [(NSMutableArray *)txDutyCyclePcts addObject:v4];
}

- (void)addTxDutyCyclePct1:(id)a3
{
  id v4 = a3;
  txDutyCyclePct1s = self->_txDutyCyclePct1s;
  id v8 = v4;
  if (!txDutyCyclePct1s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_txDutyCyclePct1s;
    self->_txDutyCyclePct1s = v6;

    id v4 = v8;
    txDutyCyclePct1s = self->_txDutyCyclePct1s;
  }
  [(NSMutableArray *)txDutyCyclePct1s addObject:v4];
}

- (void)addCTLMIndex:(id)a3
{
  id v4 = a3;
  cTLMIndexs = self->_cTLMIndexs;
  id v8 = v4;
  if (!cTLMIndexs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cTLMIndexs;
    self->_cTLMIndexs = v6;

    id v4 = v8;
    cTLMIndexs = self->_cTLMIndexs;
  }
  [(NSMutableArray *)cTLMIndexs addObject:v4];
}

- (void)addCTLMIndex1:(id)a3
{
  id v4 = a3;
  cTLMIndex1s = self->_cTLMIndex1s;
  id v8 = v4;
  if (!cTLMIndex1s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cTLMIndex1s;
    self->_cTLMIndex1s = v6;

    id v4 = v8;
    cTLMIndex1s = self->_cTLMIndex1s;
  }
  [(NSMutableArray *)cTLMIndex1s addObject:v4];
}

- (void)addTxPowerBackoffDB:(id)a3
{
  id v4 = a3;
  txPowerBackoffDBs = self->_txPowerBackoffDBs;
  id v8 = v4;
  if (!txPowerBackoffDBs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_txPowerBackoffDBs;
    self->_txPowerBackoffDBs = v6;

    id v4 = v8;
    txPowerBackoffDBs = self->_txPowerBackoffDBs;
  }
  [(NSMutableArray *)txPowerBackoffDBs addObject:v4];
}

- (void)addTxPowerBackoffDB1:(id)a3
{
  id v4 = a3;
  txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  id v8 = v4;
  if (!txPowerBackoffDB1s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_txPowerBackoffDB1s;
    self->_txPowerBackoffDB1s = v6;

    id v4 = v8;
    txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  }
  [(NSMutableArray *)txPowerBackoffDB1s addObject:v4];
}

- (void)writeTo:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v5 = self->_cTLMIndexs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v57;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v7);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v10 = self->_txPowerBackoffDBs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v12);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v15 = self->_txDutyCyclePcts;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }
    while (v17);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v20 = self->_cTLMIndex1s;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v62 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v44 objects:v62 count:16];
    }
    while (v22);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v25 = self->_txPowerBackoffDB1s;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v40 objects:v61 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v40 objects:v61 count:16];
    }
    while (v27);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v30 = self->_txDutyCyclePct1s;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v36 objects:v60 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v37;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v36 objects:v60 count:16];
    }
    while (v32);
  }

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_45:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_74;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_49;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_55;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_55:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_56;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_56:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_60;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_61;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_63;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_65;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_68:
  }
    PBDataWriterWriteUint32Field();
LABEL_69:
  if (self->_sdbtdm) {
    PBDataWriterWriteSubmessage();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txPowerBackoffDBs, 0);
  objc_storeStrong((id *)&self->_txPowerBackoffDB1s, 0);
  objc_storeStrong((id *)&self->_txDutyCyclePcts, 0);
  objc_storeStrong((id *)&self->_txDutyCyclePct1s, 0);
  objc_storeStrong((id *)&self->_sdbtdm, 0);
  objc_storeStrong((id *)&self->_cTLMIndexs, 0);
  objc_storeStrong((id *)&self->_cTLMIndex1s, 0);
}

- (id)dictionaryRepresentation
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_cTLMIndexs count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cTLMIndexs, "count"));
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v5 = self->_cTLMIndexs;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v96 objects:v105 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v97 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v96 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v96 objects:v105 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"CTLMIndex"];
  }
  if ([(NSMutableArray *)self->_txPowerBackoffDBs count])
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txPowerBackoffDBs, "count"));
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v12 = self->_txPowerBackoffDBs;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v92 objects:v104 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v93;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v93 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v92 + 1) + 8 * j) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v92 objects:v104 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"TxPowerBackoff_dB"];
  }
  if ([(NSMutableArray *)self->_txDutyCyclePcts count])
  {
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txDutyCyclePcts, "count"));
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v19 = self->_txDutyCyclePcts;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v88 objects:v103 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v89;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v89 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = [*(id *)(*((void *)&v88 + 1) + 8 * k) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v88 objects:v103 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"TxDutyCycle_pct"];
  }
  if ([(NSMutableArray *)self->_cTLMIndex1s count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cTLMIndex1s, "count"));
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v26 = self->_cTLMIndex1s;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v84 objects:v102 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v85;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v85 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = [*(id *)(*((void *)&v84 + 1) + 8 * m) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v84 objects:v102 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"CTLMIndex1"];
  }
  if ([(NSMutableArray *)self->_txPowerBackoffDB1s count])
  {
    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txPowerBackoffDB1s, "count"));
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v33 = self->_txPowerBackoffDB1s;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v80 objects:v101 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v81;
      do
      {
        for (uint64_t n = 0; n != v35; ++n)
        {
          if (*(void *)v81 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v38 = [*(id *)(*((void *)&v80 + 1) + 8 * n) dictionaryRepresentation];
          [v32 addObject:v38];
        }
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v80 objects:v101 count:16];
      }
      while (v35);
    }

    [v3 setObject:v32 forKey:@"TxPowerBackoff_dB1"];
  }
  if ([(NSMutableArray *)self->_txDutyCyclePct1s count])
  {
    long long v39 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_txDutyCyclePct1s, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v40 = self->_txDutyCyclePct1s;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v76 objects:v100 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v77;
      do
      {
        for (iuint64_t i = 0; ii != v42; ++ii)
        {
          if (*(void *)v77 != v43) {
            objc_enumerationMutation(v40);
          }
          long long v45 = objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * ii), "dictionaryRepresentation", (void)v76);
          [v39 addObject:v45];
        }
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v76 objects:v100 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"TxDutyCycle_pct1"];
  }
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    long long v52 = [NSNumber numberWithUnsignedInt:self->_txduty0];
    [v3 setObject:v52 forKey:@"txduty0"];

    $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_57;
  }
  long long v53 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_txduty1, (void)v76);
  [v3 setObject:v53 forKey:@"txduty1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_87;
  }
LABEL_86:
  long long v54 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_txpowerbackoff0, (void)v76);
  [v3 setObject:v54 forKey:@"txpowerbackoff0"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_88;
  }
LABEL_87:
  long long v55 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_txpowerbackoff1, (void)v76);
  [v3 setObject:v55 forKey:@"txpowerbackoff1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_61;
    }
    goto LABEL_89;
  }
LABEL_88:
  long long v56 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_activechains0, (void)v76);
  [v3 setObject:v56 forKey:@"activechains0"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_90;
  }
LABEL_89:
  long long v57 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_activechains1, (void)v76);
  [v3 setObject:v57 forKey:@"activechains1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_91;
  }
LABEL_90:
  long long v58 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_temp0, (void)v76);
  [v3 setObject:v58 forKey:@"temp0"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_92;
  }
LABEL_91:
  long long v59 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_temp1, (void)v76);
  [v3 setObject:v59 forKey:@"temp1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_93;
  }
LABEL_92:
  v60 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_voltage0, (void)v76);
  [v3 setObject:v60 forKey:@"voltage0"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_65:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_66;
    }
    goto LABEL_94;
  }
LABEL_93:
  v61 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_voltage1, (void)v76);
  [v3 setObject:v61 forKey:@"voltage1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_66:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_67;
    }
    goto LABEL_95;
  }
LABEL_94:
  v62 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_ppm0, (void)v76);
  [v3 setObject:v62 forKey:@"ppm0"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_67:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_68;
    }
    goto LABEL_96;
  }
LABEL_95:
  v63 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_ppm1, (void)v76);
  [v3 setObject:v63 forKey:@"ppm1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_68:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_69;
    }
    goto LABEL_97;
  }
LABEL_96:
  v64 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_ctlmid0, (void)v76);
  [v3 setObject:v64 forKey:@"ctlmid0"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_98;
  }
LABEL_97:
  v65 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_ctlmid1, (void)v76);
  [v3 setObject:v65 forKey:@"ctlmid1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v66 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_tvpmindex0, (void)v76);
  [v3 setObject:v66 forKey:@"tvpmindex0"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_71:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_72;
    }
    goto LABEL_100;
  }
LABEL_99:
  v67 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_tvpmindex1, (void)v76);
  [v3 setObject:v67 forKey:@"tvpmindex1"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_72:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_73;
    }
    goto LABEL_101;
  }
LABEL_100:
  v68 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc1Request, (void)v76);
  [v3 setObject:v68 forKey:@"rc1Request"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_73:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_74;
    }
    goto LABEL_102;
  }
LABEL_101:
  v69 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc1Duration, (void)v76);
  [v3 setObject:v69 forKey:@"rc1Duration"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_74:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_75;
    }
    goto LABEL_103;
  }
LABEL_102:
  v70 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc1wlanCrit, (void)v76);
  [v3 setObject:v70 forKey:@"rc1wlanCrit"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_75:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_104;
  }
LABEL_103:
  v71 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc1wlanCritDuration, (void)v76);
  [v3 setObject:v71 forKey:@"rc1wlanCritDuration"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_76:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_77;
    }
    goto LABEL_105;
  }
LABEL_104:
  v72 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc2Request, (void)v76);
  [v3 setObject:v72 forKey:@"rc2Request"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_77:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_78;
    }
    goto LABEL_106;
  }
LABEL_105:
  v73 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc2Duration, (void)v76);
  [v3 setObject:v73 forKey:@"rc2Duration"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_107;
  }
LABEL_106:
  v74 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc2Grant, (void)v76);
  [v3 setObject:v74 forKey:@"rc2Grant"];

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_79:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_107:
  v75 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc2LongGrant, (void)v76);
  [v3 setObject:v75 forKey:@"rc2LongGrant"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_80:
    long long v47 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rc2cts2a, (void)v76);
    [v3 setObject:v47 forKey:@"rc2cts2a"];
  }
LABEL_81:
  sdbtduint64_t m = self->_sdbtdm;
  if (sdbtdm)
  {
    long long v49 = [(WiFiAnalyticsAWDWiFiTDM *)sdbtdm dictionaryRepresentation];
    [v3 setObject:v49 forKey:@"sdbtdm"];
  }
  id v50 = v3;

  return v50;
}

- (void)setVoltage1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_voltage1 = a3;
}

- (void)setVoltage0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_voltage0 = a3;
}

- (void)setTxpowerbackoff1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_txpowerbackoff1 = a3;
}

- (void)setTxpowerbackoff0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_txpowerbackoff0 = a3;
}

- (void)setTxduty1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_txduty1 = a3;
}

- (void)setTxduty0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_txduty0 = a3;
}

- (void)setTvpmindex1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_tvpmindex1 = a3;
}

- (void)setTvpmindex0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tvpmindex0 = a3;
}

- (void)setTemp1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_temp1 = a3;
}

- (void)setTemp0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_temp0 = a3;
}

- (void)setSdbtdm:(id)a3
{
}

- (void)setRc2cts2a:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rc2cts2a = a3;
}

- (void)setRc2Request:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rc2Request = a3;
}

- (void)setRc2LongGrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rc2LongGrant = a3;
}

- (void)setRc2Grant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_rc2Grant = a3;
}

- (void)setRc2Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rc2Duratiouint64_t n = a3;
}

- (void)setRc1wlanCritDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rc1wlanCritDuratiouint64_t n = a3;
}

- (void)setRc1wlanCrit:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rc1wlanCrit = a3;
}

- (void)setRc1Request:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_rc1Request = a3;
}

- (void)setRc1Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_rc1Duratiouint64_t n = a3;
}

- (void)setPpm1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_ppm1 = a3;
}

- (void)setPpm0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_ppm0 = a3;
}

- (void)setCtlmid1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_ctlmid1 = a3;
}

- (void)setCtlmid0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_ctlmid0 = a3;
}

- (void)setActivechains1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activechains1 = a3;
}

- (void)setActivechains0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_activechains0 = a3;
}

- (void)clearCTLMIndexs
{
}

- (unint64_t)cTLMIndexsCount
{
  return [(NSMutableArray *)self->_cTLMIndexs count];
}

- (id)cTLMIndexAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cTLMIndexs objectAtIndex:a3];
}

+ (Class)cTLMIndexType
{
  return (Class)objc_opt_class();
}

- (void)clearTxPowerBackoffDBs
{
}

- (unint64_t)txPowerBackoffDBsCount
{
  return [(NSMutableArray *)self->_txPowerBackoffDBs count];
}

- (id)txPowerBackoffDBAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txPowerBackoffDBs objectAtIndex:a3];
}

+ (Class)txPowerBackoffDBType
{
  return (Class)objc_opt_class();
}

- (void)clearTxDutyCyclePcts
{
}

- (unint64_t)txDutyCyclePctsCount
{
  return [(NSMutableArray *)self->_txDutyCyclePcts count];
}

- (id)txDutyCyclePctAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txDutyCyclePcts objectAtIndex:a3];
}

+ (Class)txDutyCyclePctType
{
  return (Class)objc_opt_class();
}

- (void)clearCTLMIndex1s
{
}

- (unint64_t)cTLMIndex1sCount
{
  return [(NSMutableArray *)self->_cTLMIndex1s count];
}

- (id)cTLMIndex1AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cTLMIndex1s objectAtIndex:a3];
}

+ (Class)cTLMIndex1Type
{
  return (Class)objc_opt_class();
}

- (void)clearTxPowerBackoffDB1s
{
}

- (unint64_t)txPowerBackoffDB1sCount
{
  return [(NSMutableArray *)self->_txPowerBackoffDB1s count];
}

- (id)txPowerBackoffDB1AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txPowerBackoffDB1s objectAtIndex:a3];
}

+ (Class)txPowerBackoffDB1Type
{
  return (Class)objc_opt_class();
}

- (void)clearTxDutyCyclePct1s
{
}

- (unint64_t)txDutyCyclePct1sCount
{
  return [(NSMutableArray *)self->_txDutyCyclePct1s count];
}

- (id)txDutyCyclePct1AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txDutyCyclePct1s objectAtIndex:a3];
}

+ (Class)txDutyCyclePct1Type
{
  return (Class)objc_opt_class();
}

- (void)setHasTxduty0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTxduty0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasTxduty1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTxduty1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasTxpowerbackoff0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTxpowerbackoff0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasTxpowerbackoff1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTxpowerbackoff1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasActivechains0:(BOOL)a3
{
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasActivechains0
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasActivechains1:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActivechains1
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTemp0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTemp0
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasTemp1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTemp1
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasVoltage0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasVoltage0
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasVoltage1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasVoltage1
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasPpm0:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPpm0
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasPpm1:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPpm1
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasCtlmid0:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCtlmid0
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasCtlmid1:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCtlmid1
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTvpmindex0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTvpmindex0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasTvpmindex1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTvpmindex1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasRc1Request:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRc1Request
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasRc1Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasRc1Duration
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasRc1wlanCrit:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRc1wlanCrit
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasRc1wlanCritDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRc1wlanCritDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasRc2Request:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRc2Request
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasRc2Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRc2Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasRc2Grant:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRc2Grant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasRc2LongGrant:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRc2LongGrant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasRc2cts2a:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$C1F2D7BEB865EA600EC2FB99897FDEC2 has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRc2cts2a
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasSdbtdm
{
  return self->_sdbtdm != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityImpedingFunctionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  v30 = a3;
  if ([(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self cTLMIndexsCount])
  {
    [v30 clearCTLMIndexs];
    unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self cTLMIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self cTLMIndexAtIndex:i];
        [v30 addCTLMIndex:v7];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDBsCount])
  {
    [v30 clearTxPowerBackoffDBs];
    unint64_t v8 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDBsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDBAtIndex:j];
        [v30 addTxPowerBackoffDB:v11];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePctsCount])
  {
    [v30 clearTxDutyCyclePcts];
    unint64_t v12 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePctsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePctAtIndex:k];
        [v30 addTxDutyCyclePct:v15];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self cTLMIndex1sCount])
  {
    [v30 clearCTLMIndex1s];
    unint64_t v16 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self cTLMIndex1sCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self cTLMIndex1AtIndex:m];
        [v30 addCTLMIndex1:v19];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDB1sCount])
  {
    [v30 clearTxPowerBackoffDB1s];
    unint64_t v20 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDB1sCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDB1AtIndex:n];
        [v30 addTxPowerBackoffDB1:v23];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePct1sCount])
  {
    [v30 clearTxDutyCyclePct1s];
    unint64_t v24 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePct1sCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePct1AtIndex:ii];
        [v30 addTxDutyCyclePct1:v27];
      }
    }
  }
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  uint64_t v29 = v30;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v30[36] = self->_txduty0;
    v30[42] |= 0x80000u;
    $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_27;
  }
  v30[37] = self->_txduty1;
  v30[42] |= 0x100000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  v30[38] = self->_txpowerbackoff0;
  v30[42] |= 0x200000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  v30[39] = self->_txpowerbackoff1;
  v30[42] |= 0x400000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  v30[2] = self->_activechains0;
  v30[42] |= 1u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  v30[3] = self->_activechains1;
  v30[42] |= 2u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  v30[24] = self->_temp0;
  v30[42] |= 0x8000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  v30[25] = self->_temp1;
  v30[42] |= 0x10000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  v30[40] = self->_voltage0;
  v30[42] |= 0x800000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_66;
  }
LABEL_65:
  v30[41] = self->_voltage1;
  v30[42] |= 0x1000000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_37;
    }
    goto LABEL_67;
  }
LABEL_66:
  v30[10] = self->_ppm0;
  v30[42] |= 0x10u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_68;
  }
LABEL_67:
  v30[11] = self->_ppm1;
  v30[42] |= 0x20u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_69;
  }
LABEL_68:
  v30[8] = self->_ctlmid0;
  v30[42] |= 4u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_70;
  }
LABEL_69:
  v30[9] = self->_ctlmid1;
  v30[42] |= 8u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_71;
  }
LABEL_70:
  v30[26] = self->_tvpmindex0;
  v30[42] |= 0x20000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_42;
    }
    goto LABEL_72;
  }
LABEL_71:
  v30[27] = self->_tvpmindex1;
  v30[42] |= 0x40000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_43;
    }
    goto LABEL_73;
  }
LABEL_72:
  v30[13] = self->_rc1Request;
  v30[42] |= 0x80u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_44;
    }
    goto LABEL_74;
  }
LABEL_73:
  v30[12] = self->_rc1Duration;
  v30[42] |= 0x40u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_45;
    }
    goto LABEL_75;
  }
LABEL_74:
  v30[14] = self->_rc1wlanCrit;
  v30[42] |= 0x100u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_76;
  }
LABEL_75:
  v30[15] = self->_rc1wlanCritDuration;
  v30[42] |= 0x200u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_77;
  }
LABEL_76:
  v30[19] = self->_rc2Request;
  v30[42] |= 0x2000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_48;
    }
    goto LABEL_78;
  }
LABEL_77:
  v30[16] = self->_rc2Duration;
  v30[42] |= 0x400u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_79;
  }
LABEL_78:
  v30[17] = self->_rc2Grant;
  v30[42] |= 0x800u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_79:
  v30[18] = self->_rc2LongGrant;
  v30[42] |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_50:
    v30[20] = self->_rc2cts2a;
    v30[42] |= 0x4000u;
  }
LABEL_51:
  if (self->_sdbtdm)
  {
    objc_msgSend(v30, "setSdbtdm:");
    uint64_t v29 = v30;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v6 = self->_cTLMIndexs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v68;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v68 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addCTLMIndex:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v8);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  unint64_t v12 = self->_txPowerBackoffDBs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v64;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v64 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * v16) copyWithZone:a3];
        [(id)v5 addTxPowerBackoffDB:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v14);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v18 = self->_txDutyCyclePcts;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v60;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v60 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * v22) copyWithZone:a3];
        [(id)v5 addTxDutyCyclePct:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v20);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  unint64_t v24 = self->_cTLMIndex1s;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v56;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v56 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * v28) copyWithZone:a3];
        [(id)v5 addCTLMIndex1:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v26);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v30 = self->_txPowerBackoffDB1s;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v51 objects:v72 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v52;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * v34) copyWithZone:a3];
        [(id)v5 addTxPowerBackoffDB1:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v51 objects:v72 count:16];
    }
    while (v32);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v36 = self->_txDutyCyclePct1s;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v47 objects:v71 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v48;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v40), "copyWithZone:", a3, (void)v47);
        [(id)v5 addTxDutyCyclePct1:v41];

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v47 objects:v71 count:16];
    }
    while (v38);
  }

  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_txduty0;
    *(_DWORD *)(v5 + 168) |= 0x80000u;
    $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_45:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_45;
  }
  *(_DWORD *)(v5 + 148) = self->_txduty1;
  *(_DWORD *)(v5 + 168) |= 0x100000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 152) = self->_txpowerbackoff0;
  *(_DWORD *)(v5 + 168) |= 0x200000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 156) = self->_txpowerbackoff1;
  *(_DWORD *)(v5 + 168) |= 0x400000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_49;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 8) = self->_activechains0;
  *(_DWORD *)(v5 + 168) |= 1u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 12) = self->_activechains1;
  *(_DWORD *)(v5 + 168) |= 2u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 96) = self->_temp0;
  *(_DWORD *)(v5 + 168) |= 0x8000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 100) = self->_temp1;
  *(_DWORD *)(v5 + 168) |= 0x10000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 160) = self->_voltage0;
  *(_DWORD *)(v5 + 168) |= 0x800000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 164) = self->_voltage1;
  *(_DWORD *)(v5 + 168) |= 0x1000000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_55;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 40) = self->_ppm0;
  *(_DWORD *)(v5 + 168) |= 0x10u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_55:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_56;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 44) = self->_ppm1;
  *(_DWORD *)(v5 + 168) |= 0x20u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_56:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 32) = self->_ctlmid0;
  *(_DWORD *)(v5 + 168) |= 4u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 36) = self->_ctlmid1;
  *(_DWORD *)(v5 + 168) |= 8u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 104) = self->_tvpmindex0;
  *(_DWORD *)(v5 + 168) |= 0x20000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_60;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 108) = self->_tvpmindex1;
  *(_DWORD *)(v5 + 168) |= 0x40000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_61;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 52) = self->_rc1Request;
  *(_DWORD *)(v5 + 168) |= 0x80u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v5 + 48) = self->_rc1Duration;
  *(_DWORD *)(v5 + 168) |= 0x40u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_63;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 56) = self->_rc1wlanCrit;
  *(_DWORD *)(v5 + 168) |= 0x100u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v5 + 60) = self->_rc1wlanCritDuration;
  *(_DWORD *)(v5 + 168) |= 0x200u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_65;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 76) = self->_rc2Request;
  *(_DWORD *)(v5 + 168) |= 0x2000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 64) = self->_rc2Duration;
  *(_DWORD *)(v5 + 168) |= 0x400u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_67;
    }
LABEL_93:
    *(_DWORD *)(v5 + 72) = self->_rc2LongGrant;
    *(_DWORD *)(v5 + 168) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_92:
  *(_DWORD *)(v5 + 68) = self->_rc2Grant;
  *(_DWORD *)(v5 + 168) |= 0x800u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0) {
    goto LABEL_93;
  }
LABEL_67:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_68:
    *(_DWORD *)(v5 + 80) = self->_rc2cts2a;
    *(_DWORD *)(v5 + 168) |= 0x4000u;
  }
LABEL_69:
  id v43 = -[WiFiAnalyticsAWDWiFiTDM copyWithZone:](self->_sdbtdm, "copyWithZone:", a3, (void)v47);
  long long v44 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v43;

  id v45 = (id)v5;
  return v45;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_141;
  }
  cTLMIndexs = self->_cTLMIndexs;
  if ((unint64_t)cTLMIndexs | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](cTLMIndexs, "isEqual:")) {
      goto LABEL_141;
    }
  }
  txPowerBackoffDBs = self->_txPowerBackoffDBs;
  if ((unint64_t)txPowerBackoffDBs | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](txPowerBackoffDBs, "isEqual:")) {
      goto LABEL_141;
    }
  }
  txDutyCyclePcts = self->_txDutyCyclePcts;
  if ((unint64_t)txDutyCyclePcts | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](txDutyCyclePcts, "isEqual:")) {
      goto LABEL_141;
    }
  }
  cTLMIndex1s = self->_cTLMIndex1s;
  if ((unint64_t)cTLMIndex1s | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](cTLMIndex1s, "isEqual:")) {
      goto LABEL_141;
    }
  }
  txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  if ((unint64_t)txPowerBackoffDB1s | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](txPowerBackoffDB1s, "isEqual:")) {
      goto LABEL_141;
    }
  }
  txDutyCyclePct1s = self->_txDutyCyclePct1s;
  if ((unint64_t)txDutyCyclePct1s | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](txDutyCyclePct1s, "isEqual:")) {
      goto LABEL_141;
    }
  }
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  int v12 = *((_DWORD *)v4 + 42);
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v12 & 0x80000) == 0 || self->_txduty0 != *((_DWORD *)v4 + 36)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x80000) != 0)
  {
LABEL_141:
    char v14 = 0;
    goto LABEL_142;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v12 & 0x100000) == 0 || self->_txduty1 != *((_DWORD *)v4 + 37)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x100000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v12 & 0x200000) == 0 || self->_txpowerbackoff0 != *((_DWORD *)v4 + 38)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x200000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_txpowerbackoff1 != *((_DWORD *)v4 + 39)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_141;
  }
  if (*(unsigned char *)&has)
  {
    if ((v12 & 1) == 0 || self->_activechains0 != *((_DWORD *)v4 + 2)) {
      goto LABEL_141;
    }
  }
  else if (v12)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_activechains1 != *((_DWORD *)v4 + 3)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_temp0 != *((_DWORD *)v4 + 24)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v12 & 0x10000) == 0 || self->_temp1 != *((_DWORD *)v4 + 25)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x10000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0 || self->_voltage0 != *((_DWORD *)v4 + 40)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0 || self->_voltage1 != *((_DWORD *)v4 + 41)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_ppm0 != *((_DWORD *)v4 + 10)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_ppm1 != *((_DWORD *)v4 + 11)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_ctlmid0 != *((_DWORD *)v4 + 8)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_ctlmid1 != *((_DWORD *)v4 + 9)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_tvpmindex0 != *((_DWORD *)v4 + 26)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v12 & 0x40000) == 0 || self->_tvpmindex1 != *((_DWORD *)v4 + 27)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x40000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_rc1Request != *((_DWORD *)v4 + 13)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_rc1Duration != *((_DWORD *)v4 + 12)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_rc1wlanCrit != *((_DWORD *)v4 + 14)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_rc1wlanCritDuration != *((_DWORD *)v4 + 15)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_rc2Request != *((_DWORD *)v4 + 19)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_rc2Duration != *((_DWORD *)v4 + 16)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_rc2Grant != *((_DWORD *)v4 + 17)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_rc2LongGrant != *((_DWORD *)v4 + 18)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_rc2cts2a != *((_DWORD *)v4 + 20)) {
      goto LABEL_141;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_141;
  }
  sdbtduint64_t m = self->_sdbtdm;
  if ((unint64_t)sdbtdm | *((void *)v4 + 11)) {
    char v14 = -[WiFiAnalyticsAWDWiFiTDM isEqual:](sdbtdm, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_142:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_cTLMIndexs hash];
  uint64_t v35 = [(NSMutableArray *)self->_txPowerBackoffDBs hash];
  uint64_t v34 = [(NSMutableArray *)self->_txDutyCyclePcts hash];
  uint64_t v33 = [(NSMutableArray *)self->_cTLMIndex1s hash];
  uint64_t v32 = [(NSMutableArray *)self->_txPowerBackoffDB1s hash];
  uint64_t v4 = [(NSMutableArray *)self->_txDutyCyclePct1s hash];
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    uint64_t v31 = 2654435761 * self->_txduty0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_txduty1;
      if ((*(_DWORD *)&has & 0x200000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_txpowerbackoff0;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_txpowerbackoff1;
    if (*(unsigned char *)&has) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v8 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_activechains0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_activechains1;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_temp0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_temp1;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_voltage0;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    uint64_t v14 = 2654435761 * self->_voltage1;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v14 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_12:
    uint64_t v15 = 2654435761 * self->_ppm0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_13:
    uint64_t v16 = 2654435761 * self->_ppm1;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_14:
    uint64_t v17 = 2654435761 * self->_ctlmid0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_15:
    uint64_t v18 = 2654435761 * self->_ctlmid1;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_16:
    uint64_t v19 = 2654435761 * self->_tvpmindex0;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_17:
    uint64_t v20 = 2654435761 * self->_tvpmindex1;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_18:
    uint64_t v21 = 2654435761 * self->_rc1Request;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_19:
    uint64_t v22 = 2654435761 * self->_rc1Duration;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_20:
    uint64_t v23 = 2654435761 * self->_rc1wlanCrit;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_21:
    uint64_t v24 = 2654435761 * self->_rc1wlanCritDuration;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_22:
    uint64_t v25 = 2654435761 * self->_rc2Request;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_23:
    uint64_t v26 = 2654435761 * self->_rc2Duration;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_24:
    uint64_t v27 = 2654435761 * self->_rc2Grant;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_25;
    }
LABEL_50:
    uint64_t v28 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_26;
    }
LABEL_51:
    uint64_t v29 = 0;
    return v35 ^ v3 ^ v34 ^ v33 ^ v32 ^ v4 ^ v31 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ [(WiFiAnalyticsAWDWiFiTDM *)self->_sdbtdm hash];
  }
LABEL_49:
  uint64_t v27 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0) {
    goto LABEL_50;
  }
LABEL_25:
  uint64_t v28 = 2654435761 * self->_rc2LongGrant;
  if ((*(_WORD *)&has & 0x4000) == 0) {
    goto LABEL_51;
  }
LABEL_26:
  uint64_t v29 = 2654435761 * self->_rc2cts2a;
  return v35 ^ v3 ^ v34 ^ v33 ^ v32 ^ v4 ^ v31 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ [(WiFiAnalyticsAWDWiFiTDM *)self->_sdbtdm hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self addCTLMIndex:*(void *)(*((void *)&v58 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v7);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v10 = *((id *)v4 + 17);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v10);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self addTxPowerBackoffDB:*(void *)(*((void *)&v54 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v12);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = *((id *)v4 + 15);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(v15);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self addTxDutyCyclePct:*(void *)(*((void *)&v50 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v17);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = *((id *)v4 + 2);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v64 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self addCTLMIndex1:*(void *)(*((void *)&v46 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v22);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v25 = *((id *)v4 + 16);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v63 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        [(WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions *)self addTxPowerBackoffDB1:*(void *)(*((void *)&v42 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v63 count:16];
    }
    while (v27);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v30 = *((id *)v4 + 14);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v62 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(v30);
        }
        -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions addTxDutyCyclePct1:](self, "addTxDutyCyclePct1:", *(void *)(*((void *)&v38 + 1) + 8 * ii), (void)v38);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v32);
  }

  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x80000) != 0)
  {
    self->_txduty0 = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v35 = *((_DWORD *)v4 + 42);
    if ((v35 & 0x100000) == 0)
    {
LABEL_45:
      if ((v35 & 0x200000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_74;
    }
  }
  else if ((v35 & 0x100000) == 0)
  {
    goto LABEL_45;
  }
  self->_txduty1 = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x200000) == 0)
  {
LABEL_46:
    if ((v35 & 0x400000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_txpowerbackoff0 = *((_DWORD *)v4 + 38);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x400000) == 0)
  {
LABEL_47:
    if ((v35 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_txpowerbackoff1 = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 1) == 0)
  {
LABEL_48:
    if ((v35 & 2) == 0) {
      goto LABEL_49;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_activechains0 = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 2) == 0)
  {
LABEL_49:
    if ((v35 & 0x8000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_activechains1 = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x8000) == 0)
  {
LABEL_50:
    if ((v35 & 0x10000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_temp0 = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x10000) == 0)
  {
LABEL_51:
    if ((v35 & 0x800000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_temp1 = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x800000) == 0)
  {
LABEL_52:
    if ((v35 & 0x1000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_voltage0 = *((_DWORD *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x1000000) == 0)
  {
LABEL_53:
    if ((v35 & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_voltage1 = *((_DWORD *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x10) == 0)
  {
LABEL_54:
    if ((v35 & 0x20) == 0) {
      goto LABEL_55;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_ppm0 = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x20) == 0)
  {
LABEL_55:
    if ((v35 & 4) == 0) {
      goto LABEL_56;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_ppm1 = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 4) == 0)
  {
LABEL_56:
    if ((v35 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_ctlmid0 = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 4u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 8) == 0)
  {
LABEL_57:
    if ((v35 & 0x20000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_ctlmid1 = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 8u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x20000) == 0)
  {
LABEL_58:
    if ((v35 & 0x40000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_tvpmindex0 = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x40000) == 0)
  {
LABEL_59:
    if ((v35 & 0x80) == 0) {
      goto LABEL_60;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_tvpmindex1 = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x80) == 0)
  {
LABEL_60:
    if ((v35 & 0x40) == 0) {
      goto LABEL_61;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_rc1Request = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x40) == 0)
  {
LABEL_61:
    if ((v35 & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_rc1Duratiouint64_t n = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x100) == 0)
  {
LABEL_62:
    if ((v35 & 0x200) == 0) {
      goto LABEL_63;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_rc1wlanCrit = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x200) == 0)
  {
LABEL_63:
    if ((v35 & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_rc1wlanCritDuratiouint64_t n = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x2000) == 0)
  {
LABEL_64:
    if ((v35 & 0x400) == 0) {
      goto LABEL_65;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_rc2Request = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x400) == 0)
  {
LABEL_65:
    if ((v35 & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_rc2Duratiouint64_t n = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x800) == 0)
  {
LABEL_66:
    if ((v35 & 0x1000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_rc2Grant = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  int v35 = *((_DWORD *)v4 + 42);
  if ((v35 & 0x1000) == 0)
  {
LABEL_67:
    if ((v35 & 0x4000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_95:
  self->_rc2LongGrant = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 42) & 0x4000) != 0)
  {
LABEL_68:
    self->_rc2cts2a = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_69:
  sdbtduint64_t m = self->_sdbtdm;
  uint64_t v37 = *((void *)v4 + 11);
  if (sdbtdm)
  {
    if (v37) {
      -[WiFiAnalyticsAWDWiFiTDM mergeFrom:](sdbtdm, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[WiFiAnalyticsAWDWiFiNWActivityImpedingFunctions setSdbtdm:](self, "setSdbtdm:");
  }
}

- (NSMutableArray)cTLMIndexs
{
  return self->_cTLMIndexs;
}

- (void)setCTLMIndexs:(id)a3
{
}

- (NSMutableArray)txPowerBackoffDBs
{
  return self->_txPowerBackoffDBs;
}

- (void)setTxPowerBackoffDBs:(id)a3
{
}

- (NSMutableArray)txDutyCyclePcts
{
  return self->_txDutyCyclePcts;
}

- (void)setTxDutyCyclePcts:(id)a3
{
}

- (NSMutableArray)cTLMIndex1s
{
  return self->_cTLMIndex1s;
}

- (void)setCTLMIndex1s:(id)a3
{
}

- (NSMutableArray)txPowerBackoffDB1s
{
  return self->_txPowerBackoffDB1s;
}

- (void)setTxPowerBackoffDB1s:(id)a3
{
}

- (NSMutableArray)txDutyCyclePct1s
{
  return self->_txDutyCyclePct1s;
}

- (void)setTxDutyCyclePct1s:(id)a3
{
}

- (unsigned)txduty0
{
  return self->_txduty0;
}

- (unsigned)txduty1
{
  return self->_txduty1;
}

- (unsigned)txpowerbackoff0
{
  return self->_txpowerbackoff0;
}

- (unsigned)txpowerbackoff1
{
  return self->_txpowerbackoff1;
}

- (unsigned)activechains0
{
  return self->_activechains0;
}

- (unsigned)activechains1
{
  return self->_activechains1;
}

- (unsigned)temp0
{
  return self->_temp0;
}

- (unsigned)temp1
{
  return self->_temp1;
}

- (unsigned)voltage0
{
  return self->_voltage0;
}

- (unsigned)voltage1
{
  return self->_voltage1;
}

- (unsigned)ppm0
{
  return self->_ppm0;
}

- (unsigned)ppm1
{
  return self->_ppm1;
}

- (unsigned)ctlmid0
{
  return self->_ctlmid0;
}

- (unsigned)ctlmid1
{
  return self->_ctlmid1;
}

- (unsigned)tvpmindex0
{
  return self->_tvpmindex0;
}

- (unsigned)tvpmindex1
{
  return self->_tvpmindex1;
}

- (unsigned)rc1Request
{
  return self->_rc1Request;
}

- (unsigned)rc1Duration
{
  return self->_rc1Duration;
}

- (unsigned)rc1wlanCrit
{
  return self->_rc1wlanCrit;
}

- (unsigned)rc1wlanCritDuration
{
  return self->_rc1wlanCritDuration;
}

- (unsigned)rc2Request
{
  return self->_rc2Request;
}

- (unsigned)rc2Duration
{
  return self->_rc2Duration;
}

- (unsigned)rc2Grant
{
  return self->_rc2Grant;
}

- (unsigned)rc2LongGrant
{
  return self->_rc2LongGrant;
}

- (unsigned)rc2cts2a
{
  return self->_rc2cts2a;
}

- (WiFiAnalyticsAWDWiFiTDM)sdbtdm
{
  return self->_sdbtdm;
}

@end