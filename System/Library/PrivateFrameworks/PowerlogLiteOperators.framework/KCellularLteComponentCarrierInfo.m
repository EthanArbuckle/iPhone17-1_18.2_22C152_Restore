@interface KCellularLteComponentCarrierInfo
+ (Class)carrierInfoType;
- (BOOL)hasPccBandwidth;
- (BOOL)hasPccEarfcn;
- (BOOL)hasPccRfBand;
- (BOOL)hasScc0Bandwidth;
- (BOOL)hasScc0Earfcn;
- (BOOL)hasScc0RfBand;
- (BOOL)hasScc1Bandwidth;
- (BOOL)hasScc1Earfcn;
- (BOOL)hasScc1RfBand;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)carrierInfos;
- (id)carrierInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pccBandwidthAsString:(int)a3;
- (id)scc0BandwidthAsString:(int)a3;
- (id)scc1BandwidthAsString:(int)a3;
- (int)StringAsPccBandwidth:(id)a3;
- (int)StringAsScc0Bandwidth:(id)a3;
- (int)StringAsScc1Bandwidth:(id)a3;
- (int)pccBandwidth;
- (int)scc0Bandwidth;
- (int)scc1Bandwidth;
- (unint64_t)carrierInfosCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)pccEarfcn;
- (unsigned)pccRfBand;
- (unsigned)scc0Earfcn;
- (unsigned)scc0RfBand;
- (unsigned)scc1Earfcn;
- (unsigned)scc1RfBand;
- (unsigned)subsId;
- (void)addCarrierInfo:(id)a3;
- (void)clearCarrierInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCarrierInfos:(id)a3;
- (void)setHasPccBandwidth:(BOOL)a3;
- (void)setHasPccEarfcn:(BOOL)a3;
- (void)setHasPccRfBand:(BOOL)a3;
- (void)setHasScc0Bandwidth:(BOOL)a3;
- (void)setHasScc0Earfcn:(BOOL)a3;
- (void)setHasScc0RfBand:(BOOL)a3;
- (void)setHasScc1Bandwidth:(BOOL)a3;
- (void)setHasScc1Earfcn:(BOOL)a3;
- (void)setHasScc1RfBand:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPccBandwidth:(int)a3;
- (void)setPccEarfcn:(unsigned int)a3;
- (void)setPccRfBand:(unsigned int)a3;
- (void)setScc0Bandwidth:(int)a3;
- (void)setScc0Earfcn:(unsigned int)a3;
- (void)setScc0RfBand:(unsigned int)a3;
- (void)setScc1Bandwidth:(int)a3;
- (void)setScc1Earfcn:(unsigned int)a3;
- (void)setScc1RfBand:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteComponentCarrierInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPccEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_pccEarfcn = a3;
}

- (void)setHasPccEarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPccEarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setScc0Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_scc0Earfcn = a3;
}

- (void)setHasScc0Earfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasScc0Earfcn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setScc1Earfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_scc1Earfcn = a3;
}

- (void)setHasScc1Earfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScc1Earfcn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)pccBandwidth
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_pccBandwidth;
  }
  else {
    return 0;
  }
}

- (void)setPccBandwidth:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pccBandwidth = a3;
}

- (void)setHasPccBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPccBandwidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)pccBandwidthAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692E638[a3];
  }
  return v3;
}

- (int)StringAsPccBandwidth:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N15"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N25"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N75"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N100"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_COUNT"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)scc0Bandwidth
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_scc0Bandwidth;
  }
  else {
    return 0;
  }
}

- (void)setScc0Bandwidth:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_scc0Bandwidth = a3;
}

- (void)setHasScc0Bandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScc0Bandwidth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)scc0BandwidthAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692E638[a3];
  }
  return v3;
}

- (int)StringAsScc0Bandwidth:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N15"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N25"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N75"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N100"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_COUNT"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)scc1Bandwidth
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_scc1Bandwidth;
  }
  else {
    return 0;
  }
}

- (void)setScc1Bandwidth:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_scc1Bandwidth = a3;
}

- (void)setHasScc1Bandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScc1Bandwidth
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)scc1BandwidthAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E692E638[a3];
  }
  return v3;
}

- (int)StringAsScc1Bandwidth:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N15"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N25"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N75"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_N100"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KLTE_TX_BW_CONFIG_COUNT"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPccRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pccRfBand = a3;
}

- (void)setHasPccRfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPccRfBand
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScc0RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_scc0RfBand = a3;
}

- (void)setHasScc0RfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScc0RfBand
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setScc1RfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scc1RfBand = a3;
}

- (void)setHasScc1RfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScc1RfBand
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearCarrierInfos
{
}

- (void)addCarrierInfo:(id)a3
{
  id v4 = a3;
  carrierInfos = self->_carrierInfos;
  id v8 = v4;
  if (!carrierInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_carrierInfos;
    self->_carrierInfos = v6;

    id v4 = v8;
    carrierInfos = self->_carrierInfos;
  }
  [(NSMutableArray *)carrierInfos addObject:v4];
}

- (unint64_t)carrierInfosCount
{
  return [(NSMutableArray *)self->_carrierInfos count];
}

- (id)carrierInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_carrierInfos objectAtIndex:a3];
}

+ (Class)carrierInfoType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularLteComponentCarrierInfo;
  id v4 = [(KCellularLteComponentCarrierInfo *)&v8 description];
  v5 = [(KCellularLteComponentCarrierInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v15 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v15 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v16 = [NSNumber numberWithUnsignedInt:self->_pccEarfcn];
  [v3 setObject:v16 forKey:@"pcc_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = [NSNumber numberWithUnsignedInt:self->_scc0Earfcn];
  [v3 setObject:v17 forKey:@"scc0_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v18 = [NSNumber numberWithUnsignedInt:self->_scc1Earfcn];
  [v3 setObject:v18 forKey:@"scc1_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_30:
  uint64_t pccBandwidth = self->_pccBandwidth;
  if (pccBandwidth >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_pccBandwidth);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E692E638[pccBandwidth];
  }
  [v3 setObject:v20 forKey:@"pcc_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_34:
  uint64_t scc0Bandwidth = self->_scc0Bandwidth;
  if (scc0Bandwidth >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_scc0Bandwidth);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E692E638[scc0Bandwidth];
  }
  [v3 setObject:v22 forKey:@"scc0_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_38:
  uint64_t scc1Bandwidth = self->_scc1Bandwidth;
  if (scc1Bandwidth >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_scc1Bandwidth);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_1E692E638[scc1Bandwidth];
  }
  [v3 setObject:v24 forKey:@"scc1_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  v25 = [NSNumber numberWithUnsignedInt:self->_pccRfBand];
  [v3 setObject:v25 forKey:@"pcc_rf_band"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_43:
  v26 = [NSNumber numberWithUnsignedInt:self->_scc0RfBand];
  [v3 setObject:v26 forKey:@"scc0_rf_band"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v5 = [NSNumber numberWithUnsignedInt:self->_scc1RfBand];
    [v3 setObject:v5 forKey:@"scc1_rf_band"];
  }
LABEL_12:
  if ([(NSMutableArray *)self->_carrierInfos count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_carrierInfos, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v7 = self->_carrierInfos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"carrier_info"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v13 forKey:@"subs_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLteComponentCarrierInfoReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_carrierInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_pccEarfcn;
  *((_WORD *)v4 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 10) = self->_scc0Earfcn;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 13) = self->_scc1Earfcn;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 6) = self->_pccBandwidth;
  *((_WORD *)v4 + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 9) = self->_scc0Bandwidth;
  *((_WORD *)v4 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 12) = self->_scc1Bandwidth;
  *((_WORD *)v4 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_29:
    *((_DWORD *)v4 + 11) = self->_scc0RfBand;
    *((_WORD *)v4 + 32) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_28:
  *((_DWORD *)v4 + 8) = self->_pccRfBand;
  *((_WORD *)v4 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_29;
  }
LABEL_10:
  if ((has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 14) = self->_scc1RfBand;
    *((_WORD *)v4 + 32) |= 0x200u;
  }
LABEL_12:
  id v10 = v4;
  if ([(KCellularLteComponentCarrierInfo *)self carrierInfosCount])
  {
    [v10 clearCarrierInfos];
    unint64_t v6 = [(KCellularLteComponentCarrierInfo *)self carrierInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(KCellularLteComponentCarrierInfo *)self carrierInfoAtIndex:i];
        [v10 addCarrierInfo:v9];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v10 + 15) = self->_subsId;
    *((_WORD *)v10 + 32) |= 0x400u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 64) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_pccEarfcn;
  *(_WORD *)(v5 + 64) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 40) = self->_scc0Earfcn;
  *(_WORD *)(v5 + 64) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 52) = self->_scc1Earfcn;
  *(_WORD *)(v5 + 64) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 24) = self->_pccBandwidth;
  *(_WORD *)(v5 + 64) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 36) = self->_scc0Bandwidth;
  *(_WORD *)(v5 + 64) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 48) = self->_scc1Bandwidth;
  *(_WORD *)(v5 + 64) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 32) = self->_pccRfBand;
  *(_WORD *)(v5 + 64) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  *(_DWORD *)(v5 + 44) = self->_scc0RfBand;
  *(_WORD *)(v5 + 64) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 56) = self->_scc1RfBand;
    *(_WORD *)(v5 + 64) |= 0x200u;
  }
LABEL_12:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_carrierInfos;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addCarrierInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_subsId;
    *(_WORD *)(v6 + 64) |= 0x400u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_60;
    }
  }
  else if (v6)
  {
    goto LABEL_60;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_pccEarfcn != *((_DWORD *)v4 + 7)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_scc0Earfcn != *((_DWORD *)v4 + 10)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_scc1Earfcn != *((_DWORD *)v4 + 13)) {
      goto LABEL_60;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_pccBandwidth != *((_DWORD *)v4 + 6)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_scc0Bandwidth != *((_DWORD *)v4 + 9)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_scc1Bandwidth != *((_DWORD *)v4 + 12)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_pccRfBand != *((_DWORD *)v4 + 8)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_scc0RfBand != *((_DWORD *)v4 + 11)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_scc1RfBand != *((_DWORD *)v4 + 14)) {
      goto LABEL_60;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_60;
  }
  carrierInfos = self->_carrierInfos;
  if ((unint64_t)carrierInfos | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](carrierInfos, "isEqual:"))
    {
LABEL_60:
      BOOL v8 = 0;
      goto LABEL_61;
    }
    __int16 has = (__int16)self->_has;
    __int16 v6 = *((_WORD *)v4 + 32);
  }
  if ((has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 15)) {
      goto LABEL_60;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (v6 & 0x400) == 0;
  }
LABEL_61:

  return v8;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v16 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v15 = 2654435761 * self->_pccEarfcn;
      if ((has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v14 = 2654435761 * self->_scc0Earfcn;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_scc1Earfcn;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_pccBandwidth;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_scc0Bandwidth;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v7 = 2654435761 * self->_scc1Bandwidth;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_pccRfBand;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_scc0RfBand;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v10 = 2654435761 * self->_scc1RfBand;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
LABEL_22:
  uint64_t v11 = [(NSMutableArray *)self->_carrierInfos hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v12 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v12 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 32);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_pccEarfcn = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_scc0Earfcn = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_5:
    if ((v6 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_scc1Earfcn = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 2) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_uint64_t pccBandwidth = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_uint64_t scc0Bandwidth = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_uint64_t scc1Bandwidth = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 8) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_pccRfBand = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x40) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  self->_scc0RfBand = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
LABEL_11:
    self->_scc1RfBand = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_12:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[KCellularLteComponentCarrierInfo addCarrierInfo:](self, "addCarrierInfo:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((v5[16] & 0x400) != 0)
  {
    self->_subsId = v5[15];
    *(_WORD *)&self->_has |= 0x400u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)pccEarfcn
{
  return self->_pccEarfcn;
}

- (unsigned)scc0Earfcn
{
  return self->_scc0Earfcn;
}

- (unsigned)scc1Earfcn
{
  return self->_scc1Earfcn;
}

- (unsigned)pccRfBand
{
  return self->_pccRfBand;
}

- (unsigned)scc0RfBand
{
  return self->_scc0RfBand;
}

- (unsigned)scc1RfBand
{
  return self->_scc1RfBand;
}

- (NSMutableArray)carrierInfos
{
  return self->_carrierInfos;
}

- (void)setCarrierInfos:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end