@interface KCellularPmicHwStats
- (BOOL)hasActiveDurMs;
- (BOOL)hasBctActiveDurMs;
- (BOOL)hasCdmaActiveDurMs;
- (BOOL)hasDbgActiveDurMs;
- (BOOL)hasDpuActiveDurMs;
- (BOOL)hasDurationMs;
- (BOOL)hasGsmActiveDurMs;
- (BOOL)hasGsmCa5ActiveDurMs;
- (BOOL)hasHighVoltActiveDurMs;
- (BOOL)hasHostActiveDurMs;
- (BOOL)hasHostCpuActiveDurMs;
- (BOOL)hasHostCpuSysActiveDurMs;
- (BOOL)hasIoActiveDurMs;
- (BOOL)hasLowVoltActiveDurMs;
- (BOOL)hasLteActiveDurMs;
- (BOOL)hasMidVoltActiveDurMs;
- (BOOL)hasPerActiveDurMs;
- (BOOL)hasPhyActiveDurMs;
- (BOOL)hasPhyNocActiveDurMs;
- (BOOL)hasRauActiveDurMs;
- (BOOL)hasRpcuActiveDurMs;
- (BOOL)hasSleepDurMs;
- (BOOL)hasSleepEntryCount;
- (BOOL)hasTdscdmaActiveDurMs;
- (BOOL)hasTimestamp;
- (BOOL)hasTpcuActiveDurMs;
- (BOOL)hasWcdmaActiveDurMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)activeDurMs;
- (unsigned)bctActiveDurMs;
- (unsigned)cdmaActiveDurMs;
- (unsigned)dbgActiveDurMs;
- (unsigned)dpuActiveDurMs;
- (unsigned)durationMs;
- (unsigned)gsmActiveDurMs;
- (unsigned)gsmCa5ActiveDurMs;
- (unsigned)highVoltActiveDurMs;
- (unsigned)hostActiveDurMs;
- (unsigned)hostCpuActiveDurMs;
- (unsigned)hostCpuSysActiveDurMs;
- (unsigned)ioActiveDurMs;
- (unsigned)lowVoltActiveDurMs;
- (unsigned)lteActiveDurMs;
- (unsigned)midVoltActiveDurMs;
- (unsigned)perActiveDurMs;
- (unsigned)phyActiveDurMs;
- (unsigned)phyNocActiveDurMs;
- (unsigned)rauActiveDurMs;
- (unsigned)rpcuActiveDurMs;
- (unsigned)sleepDurMs;
- (unsigned)sleepEntryCount;
- (unsigned)tdscdmaActiveDurMs;
- (unsigned)tpcuActiveDurMs;
- (unsigned)wcdmaActiveDurMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveDurMs:(unsigned int)a3;
- (void)setBctActiveDurMs:(unsigned int)a3;
- (void)setCdmaActiveDurMs:(unsigned int)a3;
- (void)setDbgActiveDurMs:(unsigned int)a3;
- (void)setDpuActiveDurMs:(unsigned int)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setGsmActiveDurMs:(unsigned int)a3;
- (void)setGsmCa5ActiveDurMs:(unsigned int)a3;
- (void)setHasActiveDurMs:(BOOL)a3;
- (void)setHasBctActiveDurMs:(BOOL)a3;
- (void)setHasCdmaActiveDurMs:(BOOL)a3;
- (void)setHasDbgActiveDurMs:(BOOL)a3;
- (void)setHasDpuActiveDurMs:(BOOL)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasGsmActiveDurMs:(BOOL)a3;
- (void)setHasGsmCa5ActiveDurMs:(BOOL)a3;
- (void)setHasHighVoltActiveDurMs:(BOOL)a3;
- (void)setHasHostActiveDurMs:(BOOL)a3;
- (void)setHasHostCpuActiveDurMs:(BOOL)a3;
- (void)setHasHostCpuSysActiveDurMs:(BOOL)a3;
- (void)setHasIoActiveDurMs:(BOOL)a3;
- (void)setHasLowVoltActiveDurMs:(BOOL)a3;
- (void)setHasLteActiveDurMs:(BOOL)a3;
- (void)setHasMidVoltActiveDurMs:(BOOL)a3;
- (void)setHasPerActiveDurMs:(BOOL)a3;
- (void)setHasPhyActiveDurMs:(BOOL)a3;
- (void)setHasPhyNocActiveDurMs:(BOOL)a3;
- (void)setHasRauActiveDurMs:(BOOL)a3;
- (void)setHasRpcuActiveDurMs:(BOOL)a3;
- (void)setHasSleepDurMs:(BOOL)a3;
- (void)setHasSleepEntryCount:(BOOL)a3;
- (void)setHasTdscdmaActiveDurMs:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTpcuActiveDurMs:(BOOL)a3;
- (void)setHasWcdmaActiveDurMs:(BOOL)a3;
- (void)setHighVoltActiveDurMs:(unsigned int)a3;
- (void)setHostActiveDurMs:(unsigned int)a3;
- (void)setHostCpuActiveDurMs:(unsigned int)a3;
- (void)setHostCpuSysActiveDurMs:(unsigned int)a3;
- (void)setIoActiveDurMs:(unsigned int)a3;
- (void)setLowVoltActiveDurMs:(unsigned int)a3;
- (void)setLteActiveDurMs:(unsigned int)a3;
- (void)setMidVoltActiveDurMs:(unsigned int)a3;
- (void)setPerActiveDurMs:(unsigned int)a3;
- (void)setPhyActiveDurMs:(unsigned int)a3;
- (void)setPhyNocActiveDurMs:(unsigned int)a3;
- (void)setRauActiveDurMs:(unsigned int)a3;
- (void)setRpcuActiveDurMs:(unsigned int)a3;
- (void)setSleepDurMs:(unsigned int)a3;
- (void)setSleepEntryCount:(unsigned int)a3;
- (void)setTdscdmaActiveDurMs:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTpcuActiveDurMs:(unsigned int)a3;
- (void)setWcdmaActiveDurMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularPmicHwStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDurationMs
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSleepDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sleepDurMs = a3;
}

- (void)setHasSleepDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSleepDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeDurMs = a3;
}

- (void)setHasActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveDurMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSleepEntryCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sleepEntryCount = a3;
}

- (void)setHasSleepEntryCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSleepEntryCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLowVoltActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_lowVoltActiveDurMs = a3;
}

- (void)setHasLowVoltActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasLowVoltActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMidVoltActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_midVoltActiveDurMs = a3;
}

- (void)setHasMidVoltActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMidVoltActiveDurMs
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHighVoltActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_highVoltActiveDurMs = a3;
}

- (void)setHasHighVoltActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHighVoltActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setGsmCa5ActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_gsmCa5ActiveDurMs = a3;
}

- (void)setHasGsmCa5ActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGsmCa5ActiveDurMs
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setLteActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_lteActiveDurMs = a3;
}

- (void)setHasLteActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasLteActiveDurMs
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWcdmaActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_wcdmaActiveDurMs = a3;
}

- (void)setHasWcdmaActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasWcdmaActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTdscdmaActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_tdscdmaActiveDurMs = a3;
}

- (void)setHasTdscdmaActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTdscdmaActiveDurMs
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHostActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hostActiveDurMs = a3;
}

- (void)setHasHostActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHostActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHostCpuSysActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hostCpuSysActiveDurMs = a3;
}

- (void)setHasHostCpuSysActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHostCpuSysActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHostCpuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hostCpuActiveDurMs = a3;
}

- (void)setHasHostCpuActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHostCpuActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRpcuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rpcuActiveDurMs = a3;
}

- (void)setHasRpcuActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRpcuActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPhyActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_phyActiveDurMs = a3;
}

- (void)setHasPhyActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPhyActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPhyNocActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_phyNocActiveDurMs = a3;
}

- (void)setHasPhyNocActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPhyNocActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setBctActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bctActiveDurMs = a3;
}

- (void)setHasBctActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBctActiveDurMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCdmaActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cdmaActiveDurMs = a3;
}

- (void)setHasCdmaActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCdmaActiveDurMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setGsmActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_gsmActiveDurMs = a3;
}

- (void)setHasGsmActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGsmActiveDurMs
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTpcuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_tpcuActiveDurMs = a3;
}

- (void)setHasTpcuActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTpcuActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIoActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_ioActiveDurMs = a3;
}

- (void)setHasIoActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIoActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPerActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_perActiveDurMs = a3;
}

- (void)setHasPerActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPerActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDbgActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dbgActiveDurMs = a3;
}

- (void)setHasDbgActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDbgActiveDurMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDpuActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dpuActiveDurMs = a3;
}

- (void)setHasDpuActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDpuActiveDurMs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRauActiveDurMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rauActiveDurMs = a3;
}

- (void)setHasRauActiveDurMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA88B0CE12B33516D6A70CF81698D416)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRauActiveDurMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularPmicHwStats;
  v4 = [(KCellularPmicHwStats *)&v8 description];
  v5 = [(KCellularPmicHwStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_durationMs];
  [v3 setObject:v8 forKey:@"duration_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  v9 = [NSNumber numberWithUnsignedInt:self->_sleepDurMs];
  [v3 setObject:v9 forKey:@"sleep_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  v10 = [NSNumber numberWithUnsignedInt:self->_activeDurMs];
  [v3 setObject:v10 forKey:@"active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  v11 = [NSNumber numberWithUnsignedInt:self->_sleepEntryCount];
  [v3 setObject:v11 forKey:@"sleep_entry_count"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  v12 = [NSNumber numberWithUnsignedInt:self->_lowVoltActiveDurMs];
  [v3 setObject:v12 forKey:@"low_volt_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  v13 = [NSNumber numberWithUnsignedInt:self->_midVoltActiveDurMs];
  [v3 setObject:v13 forKey:@"mid_volt_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  v14 = [NSNumber numberWithUnsignedInt:self->_highVoltActiveDurMs];
  [v3 setObject:v14 forKey:@"high_volt_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  v15 = [NSNumber numberWithUnsignedInt:self->_gsmCa5ActiveDurMs];
  [v3 setObject:v15 forKey:@"gsm_ca5_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  v16 = [NSNumber numberWithUnsignedInt:self->_lteActiveDurMs];
  [v3 setObject:v16 forKey:@"lte_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  v17 = [NSNumber numberWithUnsignedInt:self->_wcdmaActiveDurMs];
  [v3 setObject:v17 forKey:@"wcdma_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  v18 = [NSNumber numberWithUnsignedInt:self->_tdscdmaActiveDurMs];
  [v3 setObject:v18 forKey:@"tdscdma_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  v19 = [NSNumber numberWithUnsignedInt:self->_hostActiveDurMs];
  [v3 setObject:v19 forKey:@"host_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  v20 = [NSNumber numberWithUnsignedInt:self->_hostCpuSysActiveDurMs];
  [v3 setObject:v20 forKey:@"host_cpu_sys_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  v21 = [NSNumber numberWithUnsignedInt:self->_hostCpuActiveDurMs];
  [v3 setObject:v21 forKey:@"host_cpu_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  v22 = [NSNumber numberWithUnsignedInt:self->_rpcuActiveDurMs];
  [v3 setObject:v22 forKey:@"rpcu_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  v23 = [NSNumber numberWithUnsignedInt:self->_phyActiveDurMs];
  [v3 setObject:v23 forKey:@"phy_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  v24 = [NSNumber numberWithUnsignedInt:self->_phyNocActiveDurMs];
  [v3 setObject:v24 forKey:@"phy_noc_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  v25 = [NSNumber numberWithUnsignedInt:self->_bctActiveDurMs];
  [v3 setObject:v25 forKey:@"bct_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  v26 = [NSNumber numberWithUnsignedInt:self->_cdmaActiveDurMs];
  [v3 setObject:v26 forKey:@"cdma_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  v27 = [NSNumber numberWithUnsignedInt:self->_gsmActiveDurMs];
  [v3 setObject:v27 forKey:@"gsm_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  v28 = [NSNumber numberWithUnsignedInt:self->_tpcuActiveDurMs];
  [v3 setObject:v28 forKey:@"tpcu_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  v29 = [NSNumber numberWithUnsignedInt:self->_ioActiveDurMs];
  [v3 setObject:v29 forKey:@"io_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  v30 = [NSNumber numberWithUnsignedInt:self->_perActiveDurMs];
  [v3 setObject:v30 forKey:@"per_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  v31 = [NSNumber numberWithUnsignedInt:self->_dbgActiveDurMs];
  [v3 setObject:v31 forKey:@"dbg_active_dur_ms"];

  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_57:
  v32 = [NSNumber numberWithUnsignedInt:self->_dpuActiveDurMs];
  [v3 setObject:v32 forKey:@"dpu_active_dur_ms"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_28:
    v5 = [NSNumber numberWithUnsignedInt:self->_rauActiveDurMs];
    [v3 setObject:v5 forKey:@"rau_active_dur_ms"];
  }
LABEL_29:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularPmicHwStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_28:
  }
    PBDataWriterWriteUint32Field();
LABEL_29:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 30) |= 1u;
    $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_durationMs;
  *((_DWORD *)v4 + 30) |= 0x40u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 25) = self->_sleepDurMs;
  *((_DWORD *)v4 + 30) |= 0x400000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 4) = self->_activeDurMs;
  *((_DWORD *)v4 + 30) |= 2u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 26) = self->_sleepEntryCount;
  *((_DWORD *)v4 + 30) |= 0x800000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 17) = self->_lowVoltActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x4000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 19) = self->_midVoltActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x10000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 12) = self->_highVoltActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x200u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 11) = self->_gsmCa5ActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x100u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 18) = self->_lteActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x8000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 29) = self->_wcdmaActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x4000000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 27) = self->_tdscdmaActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x1000000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 13) = self->_hostActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x400u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 15) = self->_hostCpuSysActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x1000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 14) = self->_hostCpuActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x800u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 24) = self->_rpcuActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x200000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 21) = self->_phyActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x40000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 22) = self->_phyNocActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x80000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 5) = self->_bctActiveDurMs;
  *((_DWORD *)v4 + 30) |= 4u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 6) = self->_cdmaActiveDurMs;
  *((_DWORD *)v4 + 30) |= 8u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 10) = self->_gsmActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x80u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 28) = self->_tpcuActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x2000000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 16) = self->_ioActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x2000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 20) = self->_perActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x20000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 7) = self->_dbgActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x10u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_57:
  *((_DWORD *)v4 + 8) = self->_dpuActiveDurMs;
  *((_DWORD *)v4 + 30) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_28:
    *((_DWORD *)v4 + 23) = self->_rauActiveDurMs;
    *((_DWORD *)v4 + 30) |= 0x100000u;
  }
LABEL_29:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 30) |= 1u;
    $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_durationMs;
  *((_DWORD *)result + 30) |= 0x40u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 25) = self->_sleepDurMs;
  *((_DWORD *)result + 30) |= 0x400000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 4) = self->_activeDurMs;
  *((_DWORD *)result + 30) |= 2u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 26) = self->_sleepEntryCount;
  *((_DWORD *)result + 30) |= 0x800000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 17) = self->_lowVoltActiveDurMs;
  *((_DWORD *)result + 30) |= 0x4000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 19) = self->_midVoltActiveDurMs;
  *((_DWORD *)result + 30) |= 0x10000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 12) = self->_highVoltActiveDurMs;
  *((_DWORD *)result + 30) |= 0x200u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 11) = self->_gsmCa5ActiveDurMs;
  *((_DWORD *)result + 30) |= 0x100u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 18) = self->_lteActiveDurMs;
  *((_DWORD *)result + 30) |= 0x8000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 29) = self->_wcdmaActiveDurMs;
  *((_DWORD *)result + 30) |= 0x4000000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 27) = self->_tdscdmaActiveDurMs;
  *((_DWORD *)result + 30) |= 0x1000000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 13) = self->_hostActiveDurMs;
  *((_DWORD *)result + 30) |= 0x400u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 15) = self->_hostCpuSysActiveDurMs;
  *((_DWORD *)result + 30) |= 0x1000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 14) = self->_hostCpuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x800u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 24) = self->_rpcuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x200000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 21) = self->_phyActiveDurMs;
  *((_DWORD *)result + 30) |= 0x40000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 22) = self->_phyNocActiveDurMs;
  *((_DWORD *)result + 30) |= 0x80000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 5) = self->_bctActiveDurMs;
  *((_DWORD *)result + 30) |= 4u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 6) = self->_cdmaActiveDurMs;
  *((_DWORD *)result + 30) |= 8u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 10) = self->_gsmActiveDurMs;
  *((_DWORD *)result + 30) |= 0x80u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 28) = self->_tpcuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x2000000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 16) = self->_ioActiveDurMs;
  *((_DWORD *)result + 30) |= 0x2000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 20) = self->_perActiveDurMs;
  *((_DWORD *)result + 30) |= 0x20000u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 7) = self->_dbgActiveDurMs;
  *((_DWORD *)result + 30) |= 0x10u;
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      return result;
    }
    goto LABEL_28;
  }
LABEL_55:
  *((_DWORD *)result + 8) = self->_dpuActiveDurMs;
  *((_DWORD *)result + 30) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
    return result;
  }
LABEL_28:
  *((_DWORD *)result + 23) = self->_rauActiveDurMs;
  *((_DWORD *)result + 30) |= 0x100000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_137;
  }
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  int v6 = *((_DWORD *)v4 + 30);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_137;
    }
  }
  else if (v6)
  {
LABEL_137:
    BOOL v7 = 0;
    goto LABEL_138;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_durationMs != *((_DWORD *)v4 + 9)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_sleepDurMs != *((_DWORD *)v4 + 25)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_activeDurMs != *((_DWORD *)v4 + 4)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_sleepEntryCount != *((_DWORD *)v4 + 26)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_lowVoltActiveDurMs != *((_DWORD *)v4 + 17)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_midVoltActiveDurMs != *((_DWORD *)v4 + 19)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_highVoltActiveDurMs != *((_DWORD *)v4 + 12)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_gsmCa5ActiveDurMs != *((_DWORD *)v4 + 11)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_lteActiveDurMs != *((_DWORD *)v4 + 18)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_wcdmaActiveDurMs != *((_DWORD *)v4 + 29)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_tdscdmaActiveDurMs != *((_DWORD *)v4 + 27)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_hostActiveDurMs != *((_DWORD *)v4 + 13)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_hostCpuSysActiveDurMs != *((_DWORD *)v4 + 15)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_hostCpuActiveDurMs != *((_DWORD *)v4 + 14)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_rpcuActiveDurMs != *((_DWORD *)v4 + 24)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_phyActiveDurMs != *((_DWORD *)v4 + 21)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_phyNocActiveDurMs != *((_DWORD *)v4 + 22)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bctActiveDurMs != *((_DWORD *)v4 + 5)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_137;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_cdmaActiveDurMs != *((_DWORD *)v4 + 6)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_137;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_gsmActiveDurMs != *((_DWORD *)v4 + 10)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_tpcuActiveDurMs != *((_DWORD *)v4 + 28)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_ioActiveDurMs != *((_DWORD *)v4 + 16)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_perActiveDurMs != *((_DWORD *)v4 + 20)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_137;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dbgActiveDurMs != *((_DWORD *)v4 + 7)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_137;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dpuActiveDurMs != *((_DWORD *)v4 + 8)) {
      goto LABEL_137;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_137;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_rauActiveDurMs != *((_DWORD *)v4 + 23)) {
      goto LABEL_137;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x100000) == 0;
  }
LABEL_138:

  return v7;
}

- (unint64_t)hash
{
  $BA88B0CE12B33516D6A70CF81698D416 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_durationMs;
      if ((*(_DWORD *)&has & 0x400000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_sleepDurMs;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_activeDurMs;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_sleepEntryCount;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_lowVoltActiveDurMs;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_midVoltActiveDurMs;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_highVoltActiveDurMs;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_gsmCa5ActiveDurMs;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_lteActiveDurMs;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_wcdmaActiveDurMs;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_tdscdmaActiveDurMs;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_hostActiveDurMs;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_hostCpuSysActiveDurMs;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_16;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_hostCpuActiveDurMs;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_rpcuActiveDurMs;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_phyActiveDurMs;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_19:
    uint64_t v20 = 2654435761 * self->_phyNocActiveDurMs;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_20:
    uint64_t v21 = 2654435761 * self->_bctActiveDurMs;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_21:
    uint64_t v22 = 2654435761 * self->_cdmaActiveDurMs;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_22:
    uint64_t v23 = 2654435761 * self->_gsmActiveDurMs;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_23:
    uint64_t v24 = 2654435761 * self->_tpcuActiveDurMs;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_24:
    uint64_t v25 = 2654435761 * self->_ioActiveDurMs;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_25:
    uint64_t v26 = 2654435761 * self->_perActiveDurMs;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_26;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v26 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_26:
    uint64_t v27 = 2654435761 * self->_dbgActiveDurMs;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_27;
    }
LABEL_54:
    uint64_t v28 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_28;
    }
LABEL_55:
    uint64_t v29 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_53:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_54;
  }
LABEL_27:
  uint64_t v28 = 2654435761 * self->_dpuActiveDurMs;
  if ((*(_DWORD *)&has & 0x100000) == 0) {
    goto LABEL_55;
  }
LABEL_28:
  uint64_t v29 = 2654435761 * self->_rauActiveDurMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 30);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 30);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_durationMs = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x400000) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_sleepDurMs = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_activeDurMs = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x800000) == 0)
  {
LABEL_6:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_sleepEntryCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x4000) == 0)
  {
LABEL_7:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_lowVoltActiveDurMs = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x10000) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_midVoltActiveDurMs = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_highVoltActiveDurMs = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_gsmCa5ActiveDurMs = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x8000) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_lteActiveDurMs = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_wcdmaActiveDurMs = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_tdscdmaActiveDurMs = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_hostActiveDurMs = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_hostCpuSysActiveDurMs = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_16:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_hostCpuActiveDurMs = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x200000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_rpcuActiveDurMs = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x40000) == 0)
  {
LABEL_18:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_phyActiveDurMs = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x80000) == 0)
  {
LABEL_19:
    if ((v5 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_phyNocActiveDurMs = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_20:
    if ((v5 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_bctActiveDurMs = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_21:
    if ((v5 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_cdmaActiveDurMs = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_22:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_gsmActiveDurMs = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_tpcuActiveDurMs = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x2000) == 0)
  {
LABEL_24:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_ioActiveDurMs = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x20000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_perActiveDurMs = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_dbgActiveDurMs = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_27:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_57:
  self->_dpuActiveDurMs = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 30) & 0x100000) != 0)
  {
LABEL_28:
    self->_rauActiveDurMs = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_29:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)sleepDurMs
{
  return self->_sleepDurMs;
}

- (unsigned)activeDurMs
{
  return self->_activeDurMs;
}

- (unsigned)sleepEntryCount
{
  return self->_sleepEntryCount;
}

- (unsigned)lowVoltActiveDurMs
{
  return self->_lowVoltActiveDurMs;
}

- (unsigned)midVoltActiveDurMs
{
  return self->_midVoltActiveDurMs;
}

- (unsigned)highVoltActiveDurMs
{
  return self->_highVoltActiveDurMs;
}

- (unsigned)gsmCa5ActiveDurMs
{
  return self->_gsmCa5ActiveDurMs;
}

- (unsigned)lteActiveDurMs
{
  return self->_lteActiveDurMs;
}

- (unsigned)wcdmaActiveDurMs
{
  return self->_wcdmaActiveDurMs;
}

- (unsigned)tdscdmaActiveDurMs
{
  return self->_tdscdmaActiveDurMs;
}

- (unsigned)hostActiveDurMs
{
  return self->_hostActiveDurMs;
}

- (unsigned)hostCpuSysActiveDurMs
{
  return self->_hostCpuSysActiveDurMs;
}

- (unsigned)hostCpuActiveDurMs
{
  return self->_hostCpuActiveDurMs;
}

- (unsigned)rpcuActiveDurMs
{
  return self->_rpcuActiveDurMs;
}

- (unsigned)phyActiveDurMs
{
  return self->_phyActiveDurMs;
}

- (unsigned)phyNocActiveDurMs
{
  return self->_phyNocActiveDurMs;
}

- (unsigned)bctActiveDurMs
{
  return self->_bctActiveDurMs;
}

- (unsigned)cdmaActiveDurMs
{
  return self->_cdmaActiveDurMs;
}

- (unsigned)gsmActiveDurMs
{
  return self->_gsmActiveDurMs;
}

- (unsigned)tpcuActiveDurMs
{
  return self->_tpcuActiveDurMs;
}

- (unsigned)ioActiveDurMs
{
  return self->_ioActiveDurMs;
}

- (unsigned)perActiveDurMs
{
  return self->_perActiveDurMs;
}

- (unsigned)dbgActiveDurMs
{
  return self->_dbgActiveDurMs;
}

- (unsigned)dpuActiveDurMs
{
  return self->_dpuActiveDurMs;
}

- (unsigned)rauActiveDurMs
{
  return self->_rauActiveDurMs;
}

@end