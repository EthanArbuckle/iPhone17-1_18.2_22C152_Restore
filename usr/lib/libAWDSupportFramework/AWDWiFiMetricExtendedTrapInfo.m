@interface AWDWiFiMetricExtendedTrapInfo
- (BOOL)hasSequence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)backplanesCount;
- (unint64_t)busCount;
- (unint64_t)deepSleepsCount;
- (unint64_t)hash;
- (unint64_t)macEnabsCount;
- (unint64_t)macsCount;
- (unint64_t)memoryDumpsCount;
- (unint64_t)pcieQueueStatesCount;
- (unint64_t)phyTxErrThreshsCount;
- (unint64_t)physCount;
- (unint64_t)psmWDsCount;
- (unint64_t)signaturesCount;
- (unint64_t)stackTracesCount;
- (unint64_t)ucodeErrorsCount;
- (unint64_t)wlcStatesCount;
- (unsigned)backplaneAtIndex:(unint64_t)a3;
- (unsigned)backplanes;
- (unsigned)bus;
- (unsigned)busAtIndex:(unint64_t)a3;
- (unsigned)deepSleepAtIndex:(unint64_t)a3;
- (unsigned)deepSleeps;
- (unsigned)macAtIndex:(unint64_t)a3;
- (unsigned)macEnabAtIndex:(unint64_t)a3;
- (unsigned)macEnabs;
- (unsigned)macs;
- (unsigned)memoryDumpAtIndex:(unint64_t)a3;
- (unsigned)memoryDumps;
- (unsigned)pcieQueueStateAtIndex:(unint64_t)a3;
- (unsigned)pcieQueueStates;
- (unsigned)phyAtIndex:(unint64_t)a3;
- (unsigned)phyTxErrThreshAtIndex:(unint64_t)a3;
- (unsigned)phyTxErrThreshs;
- (unsigned)phys;
- (unsigned)psmWDAtIndex:(unint64_t)a3;
- (unsigned)psmWDs;
- (unsigned)sequence;
- (unsigned)signatureAtIndex:(unint64_t)a3;
- (unsigned)signatures;
- (unsigned)stackTraces;
- (unsigned)stackTracesAtIndex:(unint64_t)a3;
- (unsigned)ucodeErrors;
- (unsigned)ucodeErrorsAtIndex:(unint64_t)a3;
- (unsigned)wlcStateAtIndex:(unint64_t)a3;
- (unsigned)wlcStates;
- (void)addBackplane:(unsigned int)a3;
- (void)addBus:(unsigned int)a3;
- (void)addDeepSleep:(unsigned int)a3;
- (void)addMac:(unsigned int)a3;
- (void)addMacEnab:(unsigned int)a3;
- (void)addMemoryDump:(unsigned int)a3;
- (void)addPcieQueueState:(unsigned int)a3;
- (void)addPhy:(unsigned int)a3;
- (void)addPhyTxErrThresh:(unsigned int)a3;
- (void)addPsmWD:(unsigned int)a3;
- (void)addSignature:(unsigned int)a3;
- (void)addStackTraces:(unsigned int)a3;
- (void)addUcodeErrors:(unsigned int)a3;
- (void)addWlcState:(unsigned int)a3;
- (void)clearBackplanes;
- (void)clearBus;
- (void)clearDeepSleeps;
- (void)clearMacEnabs;
- (void)clearMacs;
- (void)clearMemoryDumps;
- (void)clearPcieQueueStates;
- (void)clearPhyTxErrThreshs;
- (void)clearPhys;
- (void)clearPsmWDs;
- (void)clearSignatures;
- (void)clearStackTraces;
- (void)clearUcodeErrors;
- (void)clearWlcStates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBackplanes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setBus:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDeepSleeps:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasSequence:(BOOL)a3;
- (void)setMacEnabs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setMacs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setMemoryDumps:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPcieQueueStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPhyTxErrThreshs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPhys:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPsmWDs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSequence:(unsigned int)a3;
- (void)setSignatures:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setStackTraces:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUcodeErrors:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setWlcStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricExtendedTrapInfo

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricExtendedTrapInfo;
  [(AWDWiFiMetricExtendedTrapInfo *)&v3 dealloc];
}

- (void)setSequence:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequence = a3;
}

- (void)setHasSequence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequence
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)signaturesCount
{
  return self->_signatures.count;
}

- (unsigned)signatures
{
  return self->_signatures.list;
}

- (void)clearSignatures
{
}

- (void)addSignature:(unsigned int)a3
{
}

- (unsigned)signatureAtIndex:(unint64_t)a3
{
  p_signatures = &self->_signatures;
  unint64_t count = self->_signatures.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_signatures->list[a3];
}

- (void)setSignatures:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)stackTracesCount
{
  return self->_stackTraces.count;
}

- (unsigned)stackTraces
{
  return self->_stackTraces.list;
}

- (void)clearStackTraces
{
}

- (void)addStackTraces:(unsigned int)a3
{
}

- (unsigned)stackTracesAtIndex:(unint64_t)a3
{
  p_stackTraces = &self->_stackTraces;
  unint64_t count = self->_stackTraces.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_stackTraces->list[a3];
}

- (void)setStackTraces:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ucodeErrorsCount
{
  return self->_ucodeErrors.count;
}

- (unsigned)ucodeErrors
{
  return self->_ucodeErrors.list;
}

- (void)clearUcodeErrors
{
}

- (void)addUcodeErrors:(unsigned int)a3
{
}

- (unsigned)ucodeErrorsAtIndex:(unint64_t)a3
{
  p_ucodeErrors = &self->_ucodeErrors;
  unint64_t count = self->_ucodeErrors.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_ucodeErrors->list[a3];
}

- (void)setUcodeErrors:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)memoryDumpsCount
{
  return self->_memoryDumps.count;
}

- (unsigned)memoryDumps
{
  return self->_memoryDumps.list;
}

- (void)clearMemoryDumps
{
}

- (void)addMemoryDump:(unsigned int)a3
{
}

- (unsigned)memoryDumpAtIndex:(unint64_t)a3
{
  p_memoryDumps = &self->_memoryDumps;
  unint64_t count = self->_memoryDumps.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_memoryDumps->list[a3];
}

- (void)setMemoryDumps:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)deepSleepsCount
{
  return self->_deepSleeps.count;
}

- (unsigned)deepSleeps
{
  return self->_deepSleeps.list;
}

- (void)clearDeepSleeps
{
}

- (void)addDeepSleep:(unsigned int)a3
{
}

- (unsigned)deepSleepAtIndex:(unint64_t)a3
{
  p_deepSleeps = &self->_deepSleeps;
  unint64_t count = self->_deepSleeps.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0) raise:@"reason" userInfo:nil];
  }
  return p_deepSleeps->list[a3];
}

- (void)setDeepSleeps:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)psmWDsCount
{
  return self->_psmWDs.count;
}

- (unsigned)psmWDs
{
  return self->_psmWDs.list;
}

- (void)clearPsmWDs
{
}

- (void)addPsmWD:(unsigned int)a3
{
}

- (unsigned)psmWDAtIndex:(unint64_t)a3
{
  p_psmWDs = &self->_psmWDs;
  unint64_t count = self->_psmWDs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_psmWDs->list[a3];
}

- (void)setPsmWDs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)physCount
{
  return self->_phys.count;
}

- (unsigned)phys
{
  return self->_phys.list;
}

- (void)clearPhys
{
}

- (void)addPhy:(unsigned int)a3
{
}

- (unsigned)phyAtIndex:(unint64_t)a3
{
  p_phys = &self->_phys;
  unint64_t count = self->_phys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_phys->list[a3];
}

- (void)setPhys:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)busCount
{
  return self->_bus.count;
}

- (unsigned)bus
{
  return self->_bus.list;
}

- (void)clearBus
{
}

- (void)addBus:(unsigned int)a3
{
}

- (unsigned)busAtIndex:(unint64_t)a3
{
  p_bus = &self->_bus;
  unint64_t count = self->_bus.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_bus->list[a3];
}

- (void)setBus:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)macsCount
{
  return self->_macs.count;
}

- (unsigned)macs
{
  return self->_macs.list;
}

- (void)clearMacs
{
}

- (void)addMac:(unsigned int)a3
{
}

- (unsigned)macAtIndex:(unint64_t)a3
{
  p_macs = &self->_macs;
  unint64_t count = self->_macs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], raise reason userInfo];
  }
  return p_macs->list[a3];
}

- (void)setMacs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)backplanesCount
{
  return self->_backplanes.count;
}

- (unsigned)backplanes
{
  return self->_backplanes.list;
}

- (void)clearBackplanes
{
}

- (void)addBackplane:(unsigned int)a3
{
}

- (unsigned)backplaneAtIndex:(unint64_t)a3
{
  p_backplanes = &self->_backplanes;
  unint64_t count = self->_backplanes.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_backplanes->list[a3];
}

- (void)setBackplanes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)pcieQueueStatesCount
{
  return self->_pcieQueueStates.count;
}

- (unsigned)pcieQueueStates
{
  return self->_pcieQueueStates.list;
}

- (void)clearPcieQueueStates
{
}

- (void)addPcieQueueState:(unsigned int)a3
{
}

- (unsigned)pcieQueueStateAtIndex:(unint64_t)a3
{
  p_pcieQueueStates = &self->_pcieQueueStates;
  unint64_t count = self->_pcieQueueStates.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_pcieQueueStates->list[a3];
}

- (void)setPcieQueueStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)wlcStatesCount
{
  return self->_wlcStates.count;
}

- (unsigned)wlcStates
{
  return self->_wlcStates.list;
}

- (void)clearWlcStates
{
}

- (void)addWlcState:(unsigned int)a3
{
}

- (unsigned)wlcStateAtIndex:(unint64_t)a3
{
  p_wlcStates = &self->_wlcStates;
  unint64_t count = self->_wlcStates.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_wlcStates->list[a3];
}

- (void)setWlcStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)macEnabsCount
{
  return self->_macEnabs.count;
}

- (unsigned)macEnabs
{
  return self->_macEnabs.list;
}

- (void)clearMacEnabs
{
}

- (void)addMacEnab:(unsigned int)a3
{
}

- (unsigned)macEnabAtIndex:(unint64_t)a3
{
  p_macEnabs = &self->_macEnabs;
  unint64_t count = self->_macEnabs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_macEnabs->list[a3];
}

- (void)setMacEnabs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)phyTxErrThreshsCount
{
  return self->_phyTxErrThreshs.count;
}

- (unsigned)phyTxErrThreshs
{
  return self->_phyTxErrThreshs.list;
}

- (void)clearPhyTxErrThreshs
{
}

- (void)addPhyTxErrThresh:(unsigned int)a3
{
}

- (unsigned)phyTxErrThreshAtIndex:(unint64_t)a3
{
  p_phyTxErrThreshs = &self->_phyTxErrThreshs;
  unint64_t count = self->_phyTxErrThreshs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_phyTxErrThreshs->list[a3];
}

- (void)setPhyTxErrThreshs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricExtendedTrapInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricExtendedTrapInfo description](&v3, sel_description), -[AWDWiFiMetricExtendedTrapInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sequence] forKey:@"sequence"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"signature"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"stackTraces"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"ucodeErrors"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"memoryDump"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"deepSleep"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"psmWD"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"phy"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"bus"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"mac"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"backplane"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"pcieQueueState"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"wlcState"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"macEnab"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"phyTxErrThresh"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricExtendedTrapInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_signatures.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_signatures.count);
  }
  if (self->_stackTraces.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_stackTraces.count);
  }
  if (self->_ucodeErrors.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_ucodeErrors.count);
  }
  if (self->_memoryDumps.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_memoryDumps.count);
  }
  if (self->_deepSleeps.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v8;
    }
    while (v8 < self->_deepSleeps.count);
  }
  if (self->_psmWDs.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < self->_psmWDs.count);
  }
  if (self->_phys.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < self->_phys.count);
  }
  if (self->_bus.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v11;
    }
    while (v11 < self->_bus.count);
  }
  if (self->_macs.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v12;
    }
    while (v12 < self->_macs.count);
  }
  if (self->_backplanes.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v13;
    }
    while (v13 < self->_backplanes.count);
  }
  if (self->_pcieQueueStates.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v14;
    }
    while (v14 < self->_pcieQueueStates.count);
  }
  if (self->_wlcStates.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v15;
    }
    while (v15 < self->_wlcStates.count);
  }
  if (self->_macEnabs.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v16;
    }
    while (v16 < self->_macEnabs.count);
  }
  p_phyTxErrThreshs = &self->_phyTxErrThreshs;
  if (p_phyTxErrThreshs->count)
  {
    unint64_t v18 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v18;
    }
    while (v18 < p_phyTxErrThreshs->count);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 86) = self->_sequence;
    *((unsigned char *)a3 + 348) |= 1u;
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self signaturesCount])
  {
    [a3 clearSignatures];
    unint64_t v5 = [(AWDWiFiMetricExtendedTrapInfo *)self signaturesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addSignature:-[AWDWiFiMetricExtendedTrapInfo signatureAtIndex:](self, "signatureAtIndex:", i)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self stackTracesCount])
  {
    [a3 clearStackTraces];
    unint64_t v8 = [(AWDWiFiMetricExtendedTrapInfo *)self stackTracesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addStackTraces:-[AWDWiFiMetricExtendedTrapInfo stackTracesAtIndex:](self, "stackTracesAtIndex:", j)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self ucodeErrorsCount])
  {
    [a3 clearUcodeErrors];
    unint64_t v11 = [(AWDWiFiMetricExtendedTrapInfo *)self ucodeErrorsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addUcodeErrors:-[AWDWiFiMetricExtendedTrapInfo ucodeErrorsAtIndex:](self, "ucodeErrorsAtIndex:", k)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self memoryDumpsCount])
  {
    [a3 clearMemoryDumps];
    unint64_t v14 = [(AWDWiFiMetricExtendedTrapInfo *)self memoryDumpsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addMemoryDump:-[AWDWiFiMetricExtendedTrapInfo memoryDumpAtIndex:](self, "memoryDumpAtIndex:", m)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self deepSleepsCount])
  {
    [a3 clearDeepSleeps];
    unint64_t v17 = [(AWDWiFiMetricExtendedTrapInfo *)self deepSleepsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addDeepSleep:-[AWDWiFiMetricExtendedTrapInfo deepSleepAtIndex:](self, "deepSleepAtIndex:", n)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self psmWDsCount])
  {
    [a3 clearPsmWDs];
    unint64_t v20 = [(AWDWiFiMetricExtendedTrapInfo *)self psmWDsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        [a3 addPsmWD:-[AWDWiFiMetricExtendedTrapInfo psmWDAtIndex:](self, "psmWDAtIndex:", ii)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self physCount])
  {
    [a3 clearPhys];
    unint64_t v23 = [(AWDWiFiMetricExtendedTrapInfo *)self physCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (juint64_t j = 0; jj != v24; ++jj)
        [a3 addPhy:-[AWDWiFiMetricExtendedTrapInfo phyAtIndex:](self, "phyAtIndex:", jj)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self busCount])
  {
    [a3 clearBus];
    unint64_t v26 = [(AWDWiFiMetricExtendedTrapInfo *)self busCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (kuint64_t k = 0; kk != v27; ++kk)
        [a3 addBus:-[AWDWiFiMetricExtendedTrapInfo busAtIndex:](self, "busAtIndex:", kk)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self macsCount])
  {
    [a3 clearMacs];
    unint64_t v29 = [(AWDWiFiMetricExtendedTrapInfo *)self macsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (muint64_t m = 0; mm != v30; ++mm)
        [a3 addMac:-[AWDWiFiMetricExtendedTrapInfo macAtIndex:](self, "macAtIndex:", mm)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self backplanesCount])
  {
    [a3 clearBackplanes];
    unint64_t v32 = [(AWDWiFiMetricExtendedTrapInfo *)self backplanesCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (nuint64_t n = 0; nn != v33; ++nn)
        [a3 addBackplane:-[AWDWiFiMetricExtendedTrapInfo backplaneAtIndex:](self, "backplaneAtIndex:", nn)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self pcieQueueStatesCount])
  {
    [a3 clearPcieQueueStates];
    unint64_t v35 = [(AWDWiFiMetricExtendedTrapInfo *)self pcieQueueStatesCount];
    if (v35)
    {
      unint64_t v36 = v35;
      for (uint64_t i1 = 0; i1 != v36; ++i1)
        [a3 addPcieQueueState:-[AWDWiFiMetricExtendedTrapInfo pcieQueueStateAtIndex:](self, "pcieQueueStateAtIndex:", i1)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self wlcStatesCount])
  {
    [a3 clearWlcStates];
    unint64_t v38 = [(AWDWiFiMetricExtendedTrapInfo *)self wlcStatesCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (uint64_t i2 = 0; i2 != v39; ++i2)
        [a3 addWlcState:-[AWDWiFiMetricExtendedTrapInfo wlcStateAtIndex:](self, "wlcStateAtIndex:", i2)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self macEnabsCount])
  {
    [a3 clearMacEnabs];
    unint64_t v41 = [(AWDWiFiMetricExtendedTrapInfo *)self macEnabsCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (uint64_t i3 = 0; i3 != v42; ++i3)
        [a3 addMacEnab:-[AWDWiFiMetricExtendedTrapInfo macEnabAtIndex:](self, "macEnabAtIndex:", i3)];
    }
  }
  if ([(AWDWiFiMetricExtendedTrapInfo *)self phyTxErrThreshsCount])
  {
    [a3 clearPhyTxErrThreshs];
    unint64_t v44 = [(AWDWiFiMetricExtendedTrapInfo *)self phyTxErrThreshsCount];
    if (v44)
    {
      unint64_t v45 = v44;
      for (uint64_t i4 = 0; i4 != v45; ++i4)
        [a3 addPhyTxErrThresh:-[AWDWiFiMetricExtendedTrapInfo phyTxErrThreshAtIndex:](self, "phyTxErrThreshAtIndex:", i4)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v4 + 344) = self->_sequence;
    *(unsigned char *)(v4 + 348) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 348) & 1) == 0 || self->_sequence != *((_DWORD *)a3 + 86)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 348))
  {
    return 0;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    return 0;
  }

  return PBRepeatedUInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sequence;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = PBRepeatedUInt32Hash() ^ v2;
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = v3 ^ v4 ^ PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = v6 ^ PBRepeatedUInt32Hash();
  uint64_t v8 = v5 ^ v7 ^ PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v10 = v9 ^ PBRepeatedUInt32Hash();
  uint64_t v11 = v10 ^ PBRepeatedUInt32Hash();
  uint64_t v12 = v8 ^ v11 ^ PBRepeatedUInt32Hash();
  uint64_t v13 = PBRepeatedUInt32Hash();
  uint64_t v14 = v13 ^ PBRepeatedUInt32Hash();
  uint64_t v15 = v14 ^ PBRepeatedUInt32Hash();
  return v12 ^ v15 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 348))
  {
    self->_sequence = *((_DWORD *)a3 + 86);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 signaturesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiMetricExtendedTrapInfo addSignature:](self, "addSignature:", [a3 signatureAtIndex:i]);
  }
  uint64_t v8 = [a3 stackTracesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDWiFiMetricExtendedTrapInfo addStackTraces:](self, "addStackTraces:", [a3 stackTracesAtIndex:j]);
  }
  uint64_t v11 = [a3 ucodeErrorsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDWiFiMetricExtendedTrapInfo addUcodeErrors:](self, "addUcodeErrors:", [a3 ucodeErrorsAtIndex:k]);
  }
  uint64_t v14 = [a3 memoryDumpsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[AWDWiFiMetricExtendedTrapInfo addMemoryDump:](self, "addMemoryDump:", [a3 memoryDumpAtIndex:m]);
  }
  uint64_t v17 = [a3 deepSleepsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[AWDWiFiMetricExtendedTrapInfo addDeepSleep:](self, "addDeepSleep:", [a3 deepSleepAtIndex:n]);
  }
  uint64_t v20 = [a3 psmWDsCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (iuint64_t i = 0; ii != v21; ++ii)
      -[AWDWiFiMetricExtendedTrapInfo addPsmWD:](self, "addPsmWD:", [a3 psmWDAtIndex:ii]);
  }
  uint64_t v23 = [a3 physCount];
  if (v23)
  {
    uint64_t v24 = v23;
    for (juint64_t j = 0; jj != v24; ++jj)
      -[AWDWiFiMetricExtendedTrapInfo addPhy:](self, "addPhy:", [a3 phyAtIndex:jj]);
  }
  uint64_t v26 = [a3 busCount];
  if (v26)
  {
    uint64_t v27 = v26;
    for (kuint64_t k = 0; kk != v27; ++kk)
      -[AWDWiFiMetricExtendedTrapInfo addBus:](self, "addBus:", [a3 busAtIndex:kk]);
  }
  uint64_t v29 = [a3 macsCount];
  if (v29)
  {
    uint64_t v30 = v29;
    for (muint64_t m = 0; mm != v30; ++mm)
      -[AWDWiFiMetricExtendedTrapInfo addMac:](self, "addMac:", [a3 macAtIndex:mm]);
  }
  uint64_t v32 = [a3 backplanesCount];
  if (v32)
  {
    uint64_t v33 = v32;
    for (nuint64_t n = 0; nn != v33; ++nn)
      -[AWDWiFiMetricExtendedTrapInfo addBackplane:](self, "addBackplane:", [a3 backplaneAtIndex:nn]);
  }
  uint64_t v35 = [a3 pcieQueueStatesCount];
  if (v35)
  {
    uint64_t v36 = v35;
    for (uint64_t i1 = 0; i1 != v36; ++i1)
      -[AWDWiFiMetricExtendedTrapInfo addPcieQueueState:](self, "addPcieQueueState:", [a3 pcieQueueStateAtIndex:i1]);
  }
  uint64_t v38 = [a3 wlcStatesCount];
  if (v38)
  {
    uint64_t v39 = v38;
    for (uint64_t i2 = 0; i2 != v39; ++i2)
      -[AWDWiFiMetricExtendedTrapInfo addWlcState:](self, "addWlcState:", [a3 wlcStateAtIndex:i2]);
  }
  uint64_t v41 = [a3 macEnabsCount];
  if (v41)
  {
    uint64_t v42 = v41;
    for (uint64_t i3 = 0; i3 != v42; ++i3)
      -[AWDWiFiMetricExtendedTrapInfo addMacEnab:](self, "addMacEnab:", [a3 macEnabAtIndex:i3]);
  }
  uint64_t v44 = [a3 phyTxErrThreshsCount];
  if (v44)
  {
    uint64_t v45 = v44;
    for (uint64_t i4 = 0; i4 != v45; ++i4)
      -[AWDWiFiMetricExtendedTrapInfo addPhyTxErrThresh:](self, "addPhyTxErrThresh:", [a3 phyTxErrThreshAtIndex:i4]);
  }
}

- (unsigned)sequence
{
  return self->_sequence;
}

@end