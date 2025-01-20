@interface KCellularLtePdcchStateStats
- (BOOL)hasDurationMs;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)pccPdcchStatesCount;
- (unint64_t)scc0PdcchStatesCount;
- (unint64_t)scc1PdcchStatesCount;
- (unint64_t)scc2PdcchStatesCount;
- (unint64_t)scc3PdcchStatesCount;
- (unint64_t)timestamp;
- (unsigned)durationMs;
- (unsigned)pccPdcchStateAtIndex:(unint64_t)a3;
- (unsigned)pccPdcchStates;
- (unsigned)scc0PdcchStateAtIndex:(unint64_t)a3;
- (unsigned)scc0PdcchStates;
- (unsigned)scc1PdcchStateAtIndex:(unint64_t)a3;
- (unsigned)scc1PdcchStates;
- (unsigned)scc2PdcchStateAtIndex:(unint64_t)a3;
- (unsigned)scc2PdcchStates;
- (unsigned)scc3PdcchStateAtIndex:(unint64_t)a3;
- (unsigned)scc3PdcchStates;
- (unsigned)subsId;
- (void)addPccPdcchState:(unsigned int)a3;
- (void)addScc0PdcchState:(unsigned int)a3;
- (void)addScc1PdcchState:(unsigned int)a3;
- (void)addScc2PdcchState:(unsigned int)a3;
- (void)addScc3PdcchState:(unsigned int)a3;
- (void)clearPccPdcchStates;
- (void)clearScc0PdcchStates;
- (void)clearScc1PdcchStates;
- (void)clearScc2PdcchStates;
- (void)clearScc3PdcchStates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPccPdcchStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setScc0PdcchStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setScc1PdcchStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setScc2PdcchStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setScc3PdcchStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLtePdcchStateStats

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)KCellularLtePdcchStateStats;
  [(KCellularLtePdcchStateStats *)&v3 dealloc];
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

- (unint64_t)pccPdcchStatesCount
{
  return self->_pccPdcchStates.count;
}

- (unsigned)pccPdcchStates
{
  return self->_pccPdcchStates.list;
}

- (void)clearPccPdcchStates
{
}

- (void)addPccPdcchState:(unsigned int)a3
{
}

- (unsigned)pccPdcchStateAtIndex:(unint64_t)a3
{
  p_pccPdcchStates = &self->_pccPdcchStates;
  unint64_t count = self->_pccPdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_pccPdcchStates->list[a3];
}

- (void)setPccPdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)scc0PdcchStatesCount
{
  return self->_scc0PdcchStates.count;
}

- (unsigned)scc0PdcchStates
{
  return self->_scc0PdcchStates.list;
}

- (void)clearScc0PdcchStates
{
}

- (void)addScc0PdcchState:(unsigned int)a3
{
}

- (unsigned)scc0PdcchStateAtIndex:(unint64_t)a3
{
  p_scc0PdcchStates = &self->_scc0PdcchStates;
  unint64_t count = self->_scc0PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_scc0PdcchStates->list[a3];
}

- (void)setScc0PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)scc1PdcchStatesCount
{
  return self->_scc1PdcchStates.count;
}

- (unsigned)scc1PdcchStates
{
  return self->_scc1PdcchStates.list;
}

- (void)clearScc1PdcchStates
{
}

- (void)addScc1PdcchState:(unsigned int)a3
{
}

- (unsigned)scc1PdcchStateAtIndex:(unint64_t)a3
{
  p_scc1PdcchStates = &self->_scc1PdcchStates;
  unint64_t count = self->_scc1PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_scc1PdcchStates->list[a3];
}

- (void)setScc1PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)scc2PdcchStatesCount
{
  return self->_scc2PdcchStates.count;
}

- (unsigned)scc2PdcchStates
{
  return self->_scc2PdcchStates.list;
}

- (void)clearScc2PdcchStates
{
}

- (void)addScc2PdcchState:(unsigned int)a3
{
}

- (unsigned)scc2PdcchStateAtIndex:(unint64_t)a3
{
  p_scc2PdcchStates = &self->_scc2PdcchStates;
  unint64_t count = self->_scc2PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_scc2PdcchStates->list[a3];
}

- (void)setScc2PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)scc3PdcchStatesCount
{
  return self->_scc3PdcchStates.count;
}

- (unsigned)scc3PdcchStates
{
  return self->_scc3PdcchStates.list;
}

- (void)clearScc3PdcchStates
{
}

- (void)addScc3PdcchState:(unsigned int)a3
{
}

- (unsigned)scc3PdcchStateAtIndex:(unint64_t)a3
{
  p_scc3PdcchStates = &self->_scc3PdcchStates;
  unint64_t count = self->_scc3PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_scc3PdcchStates->list[a3];
}

- (void)setScc3PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularLtePdcchStateStats;
  v4 = [(KCellularLtePdcchStateStats *)&v8 description];
  v5 = [(KCellularLtePdcchStateStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"pcc_pdcch_state"];

  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"scc0_pdcch_state"];

  uint64_t v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"scc1_pdcch_state"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_durationMs];
    [v3 setObject:v8 forKey:@"duration_ms"];
  }
  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"scc2_pdcch_state"];

  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"scc3_pdcch_state"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v11 forKey:@"subs_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLtePdcchStateStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v10;
  }
  if (self->_pccPdcchStates.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v10;
      ++v5;
    }
    while (v5 < self->_pccPdcchStates.count);
  }
  if (self->_scc0PdcchStates.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v10;
      ++v6;
    }
    while (v6 < self->_scc0PdcchStates.count);
  }
  if (self->_scc1PdcchStates.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v10;
      ++v7;
    }
    while (v7 < self->_scc1PdcchStates.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v10;
  }
  if (self->_scc2PdcchStates.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v10;
      ++v8;
    }
    while (v8 < self->_scc2PdcchStates.count);
  }
  if (self->_scc3PdcchStates.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v10;
      ++v9;
    }
    while (v9 < self->_scc3PdcchStates.count);
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v10;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_timestamp;
    *((unsigned char *)v4 + 144) |= 1u;
  }
  id v20 = v4;
  if ([(KCellularLtePdcchStateStats *)self pccPdcchStatesCount])
  {
    [v20 clearPccPdcchStates];
    unint64_t v5 = [(KCellularLtePdcchStateStats *)self pccPdcchStatesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v20, "addPccPdcchState:", -[KCellularLtePdcchStateStats pccPdcchStateAtIndex:](self, "pccPdcchStateAtIndex:", i));
    }
  }
  if ([(KCellularLtePdcchStateStats *)self scc0PdcchStatesCount])
  {
    [v20 clearScc0PdcchStates];
    unint64_t v8 = [(KCellularLtePdcchStateStats *)self scc0PdcchStatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v20, "addScc0PdcchState:", -[KCellularLtePdcchStateStats scc0PdcchStateAtIndex:](self, "scc0PdcchStateAtIndex:", j));
    }
  }
  if ([(KCellularLtePdcchStateStats *)self scc1PdcchStatesCount])
  {
    [v20 clearScc1PdcchStates];
    unint64_t v11 = [(KCellularLtePdcchStateStats *)self scc1PdcchStatesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v20, "addScc1PdcchState:", -[KCellularLtePdcchStateStats scc1PdcchStateAtIndex:](self, "scc1PdcchStateAtIndex:", k));
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v20 + 34) = self->_durationMs;
    *((unsigned char *)v20 + 144) |= 2u;
  }
  if ([(KCellularLtePdcchStateStats *)self scc2PdcchStatesCount])
  {
    [v20 clearScc2PdcchStates];
    unint64_t v14 = [(KCellularLtePdcchStateStats *)self scc2PdcchStatesCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        objc_msgSend(v20, "addScc2PdcchState:", -[KCellularLtePdcchStateStats scc2PdcchStateAtIndex:](self, "scc2PdcchStateAtIndex:", m));
    }
  }
  if ([(KCellularLtePdcchStateStats *)self scc3PdcchStatesCount])
  {
    [v20 clearScc3PdcchStates];
    unint64_t v17 = [(KCellularLtePdcchStateStats *)self scc3PdcchStatesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        objc_msgSend(v20, "addScc3PdcchState:", -[KCellularLtePdcchStateStats scc3PdcchStateAtIndex:](self, "scc3PdcchStateAtIndex:", n));
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v20 + 35) = self->_subsId;
    *((unsigned char *)v20 + 144) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 128) = self->_timestamp;
    *(unsigned char *)(v4 + 144) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_durationMs;
    *(unsigned char *)(v5 + 144) |= 2u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_subsId;
    *(unsigned char *)(v5 + 144) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 144) & 1) == 0 || self->_timestamp != *((void *)v4 + 16)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 144))
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 34)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 144) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 35)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

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
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_durationMs;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (v4[36])
  {
    self->_timestamp = *((void *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v20 = v4;
  uint64_t v5 = [v4 pccPdcchStatesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[KCellularLtePdcchStateStats addPccPdcchState:](self, "addPccPdcchState:", [v20 pccPdcchStateAtIndex:i]);
  }
  uint64_t v8 = [v20 scc0PdcchStatesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[KCellularLtePdcchStateStats addScc0PdcchState:](self, "addScc0PdcchState:", [v20 scc0PdcchStateAtIndex:j]);
  }
  uint64_t v11 = [v20 scc1PdcchStatesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[KCellularLtePdcchStateStats addScc1PdcchState:](self, "addScc1PdcchState:", [v20 scc1PdcchStateAtIndex:k]);
  }
  if ((v20[36] & 2) != 0)
  {
    self->_durationMs = v20[34];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v14 = [v20 scc2PdcchStatesCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[KCellularLtePdcchStateStats addScc2PdcchState:](self, "addScc2PdcchState:", [v20 scc2PdcchStateAtIndex:m]);
  }
  uint64_t v17 = [v20 scc3PdcchStatesCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[KCellularLtePdcchStateStats addScc3PdcchState:](self, "addScc3PdcchState:", [v20 scc3PdcchStateAtIndex:n]);
  }
  if ((v20[36] & 4) != 0)
  {
    self->_subsId = v20[35];
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end