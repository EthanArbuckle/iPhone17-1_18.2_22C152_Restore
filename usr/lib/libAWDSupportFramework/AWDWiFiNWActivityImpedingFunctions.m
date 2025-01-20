@interface AWDWiFiNWActivityImpedingFunctions
+ (Class)cTLMIndex1Type;
+ (Class)cTLMIndexType;
+ (Class)txDutyCyclePct1Type;
+ (Class)txDutyCyclePctType;
+ (Class)txPowerBackoffDB1Type;
+ (Class)txPowerBackoffDBType;
- (AWDWiFiTDM)sdbtdm;
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
- (void)dealloc;
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

@implementation AWDWiFiNWActivityImpedingFunctions

- (void)dealloc
{
  [(AWDWiFiNWActivityImpedingFunctions *)self setCTLMIndexs:0];
  [(AWDWiFiNWActivityImpedingFunctions *)self setTxPowerBackoffDBs:0];
  [(AWDWiFiNWActivityImpedingFunctions *)self setTxDutyCyclePcts:0];
  [(AWDWiFiNWActivityImpedingFunctions *)self setCTLMIndex1s:0];
  [(AWDWiFiNWActivityImpedingFunctions *)self setTxPowerBackoffDB1s:0];
  [(AWDWiFiNWActivityImpedingFunctions *)self setTxDutyCyclePct1s:0];
  [(AWDWiFiNWActivityImpedingFunctions *)self setSdbtdm:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityImpedingFunctions;
  [(AWDWiFiNWActivityImpedingFunctions *)&v3 dealloc];
}

- (void)clearCTLMIndexs
{
}

- (void)addCTLMIndex:(id)a3
{
  cTLMIndexs = self->_cTLMIndexs;
  if (!cTLMIndexs)
  {
    cTLMIndexs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_cTLMIndexs = cTLMIndexs;
  }

  [(NSMutableArray *)cTLMIndexs addObject:a3];
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

- (void)addTxPowerBackoffDB:(id)a3
{
  txPowerBackoffDBs = self->_txPowerBackoffDBs;
  if (!txPowerBackoffDBs)
  {
    txPowerBackoffDBs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txPowerBackoffDBs = txPowerBackoffDBs;
  }

  [(NSMutableArray *)txPowerBackoffDBs addObject:a3];
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

- (void)addTxDutyCyclePct:(id)a3
{
  txDutyCyclePcts = self->_txDutyCyclePcts;
  if (!txDutyCyclePcts)
  {
    txDutyCyclePcts = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txDutyCyclePcts = txDutyCyclePcts;
  }

  [(NSMutableArray *)txDutyCyclePcts addObject:a3];
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

- (void)addCTLMIndex1:(id)a3
{
  cTLMIndex1s = self->_cTLMIndex1s;
  if (!cTLMIndex1s)
  {
    cTLMIndex1s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_cTLMIndex1s = cTLMIndex1s;
  }

  [(NSMutableArray *)cTLMIndex1s addObject:a3];
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

- (void)addTxPowerBackoffDB1:(id)a3
{
  txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  if (!txPowerBackoffDB1s)
  {
    txPowerBackoffDB1s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txPowerBackoffDB1s = txPowerBackoffDB1s;
  }

  [(NSMutableArray *)txPowerBackoffDB1s addObject:a3];
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

- (void)addTxDutyCyclePct1:(id)a3
{
  txDutyCyclePct1s = self->_txDutyCyclePct1s;
  if (!txDutyCyclePct1s)
  {
    txDutyCyclePct1s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txDutyCyclePct1s = txDutyCyclePct1s;
  }

  [(NSMutableArray *)txDutyCyclePct1s addObject:a3];
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

- (void)setTxduty0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_txduty0 = a3;
}

- (void)setHasTxduty0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTxduty0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTxduty1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_txduty1 = a3;
}

- (void)setHasTxduty1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTxduty1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setTxpowerbackoff0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_txpowerbackoff0 = a3;
}

- (void)setHasTxpowerbackoff0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTxpowerbackoff0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTxpowerbackoff1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_txpowerbackoff1 = a3;
}

- (void)setHasTxpowerbackoff1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTxpowerbackoff1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setActivechains0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_activechains0 = a3;
}

- (void)setHasActivechains0:(BOOL)a3
{
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasActivechains0
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setActivechains1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activechains1 = a3;
}

- (void)setHasActivechains1:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActivechains1
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTemp0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_temp0 = a3;
}

- (void)setHasTemp0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTemp0
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTemp1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_temp1 = a3;
}

- (void)setHasTemp1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTemp1
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setVoltage0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_voltage0 = a3;
}

- (void)setHasVoltage0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasVoltage0
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setVoltage1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_voltage1 = a3;
}

- (void)setHasVoltage1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasVoltage1
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setPpm0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_ppm0 = a3;
}

- (void)setHasPpm0:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPpm0
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPpm1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_ppm1 = a3;
}

- (void)setHasPpm1:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPpm1
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCtlmid0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_ctlmid0 = a3;
}

- (void)setHasCtlmid0:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCtlmid0
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCtlmid1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_ctlmid1 = a3;
}

- (void)setHasCtlmid1:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCtlmid1
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTvpmindex0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tvpmindex0 = a3;
}

- (void)setHasTvpmindex0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTvpmindex0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTvpmindex1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_tvpmindex1 = a3;
}

- (void)setHasTvpmindex1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTvpmindex1
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRc1Request:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_rc1Request = a3;
}

- (void)setHasRc1Request:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRc1Request
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRc1Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_rc1Duration = a3;
}

- (void)setHasRc1Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasRc1Duration
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRc1wlanCrit:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rc1wlanCrit = a3;
}

- (void)setHasRc1wlanCrit:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRc1wlanCrit
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRc1wlanCritDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rc1wlanCritDuration = a3;
}

- (void)setHasRc1wlanCritDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRc1wlanCritDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRc2Request:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rc2Request = a3;
}

- (void)setHasRc2Request:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRc2Request
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRc2Duration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rc2Duration = a3;
}

- (void)setHasRc2Duration:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRc2Duration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRc2Grant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_rc2Grant = a3;
}

- (void)setHasRc2Grant:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRc2Grant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRc2LongGrant:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rc2LongGrant = a3;
}

- (void)setHasRc2LongGrant:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRc2LongGrant
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRc2cts2a:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rc2cts2a = a3;
}

- (void)setHasRc2cts2a:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C1F2D7BEB865EA600EC2FB99897FDEC2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
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
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityImpedingFunctions;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityImpedingFunctions description](&v3, sel_description), -[AWDWiFiNWActivityImpedingFunctions dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_cTLMIndexs count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_cTLMIndexs, "count")];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    cTLMIndexs = self->_cTLMIndexs;
    uint64_t v6 = [(NSMutableArray *)cTLMIndexs countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v64 != v8) {
            objc_enumerationMutation(cTLMIndexs);
          }
          [v4 addObject:[*(id *)(*((void *)&v63 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)cTLMIndexs countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"CTLMIndex"];
  }
  if ([(NSMutableArray *)self->_txPowerBackoffDBs count])
  {
    v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txPowerBackoffDBs, "count")];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    txPowerBackoffDBs = self->_txPowerBackoffDBs;
    uint64_t v12 = [(NSMutableArray *)txPowerBackoffDBs countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v60 != v14) {
            objc_enumerationMutation(txPowerBackoffDBs);
          }
          [v10 addObject:[(*(id *)(*((void *)&v59 + 1) + 8 * j)) dictionaryRepresentation]];
        }
        uint64_t v13 = [(NSMutableArray *)txPowerBackoffDBs countByEnumeratingWithState:&v59 objects:v71 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"TxPowerBackoff_dB"];
  }
  if ([(NSMutableArray *)self->_txDutyCyclePcts count])
  {
    v16 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txDutyCyclePcts, "count")];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    txDutyCyclePcts = self->_txDutyCyclePcts;
    uint64_t v18 = [(NSMutableArray *)txDutyCyclePcts countByEnumeratingWithState:&v55 objects:v70 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v56;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v56 != v20) {
            objc_enumerationMutation(txDutyCyclePcts);
          }
          [v16 addObject:[*(id *)(*((void *)&v55 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v19 = [(NSMutableArray *)txDutyCyclePcts countByEnumeratingWithState:&v55 objects:v70 count:16];
      }
      while (v19);
    }
    [v3 setObject:v16 forKey:@"TxDutyCycle_pct"];
  }
  if ([(NSMutableArray *)self->_cTLMIndex1s count])
  {
    v22 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_cTLMIndex1s, "count")];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    cTLMIndex1s = self->_cTLMIndex1s;
    uint64_t v24 = [(NSMutableArray *)cTLMIndex1s countByEnumeratingWithState:&v51 objects:v69 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v52;
      do
      {
        for (uint64_t m = 0; m != v25; ++m)
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(cTLMIndex1s);
          }
          [v22 addObject:[(*(id *)(*((void *)&v51 + 1) + 8 * m)) dictionaryRepresentation]];
        }
        uint64_t v25 = [(NSMutableArray *)cTLMIndex1s countByEnumeratingWithState:&v51 objects:v69 count:16];
      }
      while (v25);
    }
    [v3 setObject:v22 forKey:@"CTLMIndex1"];
  }
  if ([(NSMutableArray *)self->_txPowerBackoffDB1s count])
  {
    v28 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txPowerBackoffDB1s, "count")];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
    uint64_t v30 = [(NSMutableArray *)txPowerBackoffDB1s countByEnumeratingWithState:&v47 objects:v68 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v48;
      do
      {
        for (uint64_t n = 0; n != v31; ++n)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(txPowerBackoffDB1s);
          }
          [v28 addObject:[(*(id *)(*((void *)&v47 + 1) + 8 * n)) dictionaryRepresentation]];
        }
        uint64_t v31 = [(NSMutableArray *)txPowerBackoffDB1s countByEnumeratingWithState:&v47 objects:v68 count:16];
      }
      while (v31);
    }
    [v3 setObject:v28 forKey:@"TxPowerBackoff_dB1"];
  }
  if ([(NSMutableArray *)self->_txDutyCyclePct1s count])
  {
    v34 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txDutyCyclePct1s, "count")];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    txDutyCyclePct1s = self->_txDutyCyclePct1s;
    uint64_t v36 = [(NSMutableArray *)txDutyCyclePct1s countByEnumeratingWithState:&v43 objects:v67 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v44;
      do
      {
        for (iuint64_t i = 0; ii != v37; ++ii)
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(txDutyCyclePct1s);
          }
          [v34 addObject:[*(id *)(*((void *)&v43 + 1) + 8 * ii) dictionaryRepresentation]];
        }
        uint64_t v37 = [(NSMutableArray *)txDutyCyclePct1s countByEnumeratingWithState:&v43 objects:v67 count:16];
      }
      while (v37);
    }
    [v3 setObject:v34 forKey:@"TxDutyCycle_pct1"];
  }
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txduty0] forKey:@"txduty0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txduty1] forKey:@"txduty1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txpowerbackoff0] forKey:@"txpowerbackoff0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txpowerbackoff1] forKey:@"txpowerbackoff1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_activechains0] forKey:@"activechains0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_activechains1] forKey:@"activechains1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_temp0] forKey:@"temp0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_temp1] forKey:@"temp1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_voltage0] forKey:@"voltage0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_voltage1] forKey:@"voltage1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ppm0] forKey:@"ppm0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ppm1] forKey:@"ppm1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ctlmid0] forKey:@"ctlmid0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ctlmid1] forKey:@"ctlmid1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tvpmindex0] forKey:@"tvpmindex0"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_tvpmindex1] forKey:@"tvpmindex1"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc1Request] forKey:@"rc1Request"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc1Duration] forKey:@"rc1Duration"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc1wlanCrit] forKey:@"rc1wlanCrit"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc1wlanCritDuration] forKey:@"rc1wlanCritDuration"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc2Request] forKey:@"rc2Request"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc2Duration] forKey:@"rc2Duration"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc2Grant] forKey:@"rc2Grant"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc2LongGrant] forKey:@"rc2LongGrant"];
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_80:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc2cts2a] forKey:@"rc2cts2a"];
LABEL_81:
  sdbtduint64_t m = self->_sdbtdm;
  if (sdbtdm) {
    [v3 setObject:-[AWDWiFiTDM dictionaryRepresentation](sdbtdm, "dictionaryRepresentation") forKey:@"sdbtdm"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityImpedingFunctionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  cTLMIndexs = self->_cTLMIndexs;
  uint64_t v5 = [(NSMutableArray *)cTLMIndexs countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(cTLMIndexs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)cTLMIndexs countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v6);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  txPowerBackoffDBs = self->_txPowerBackoffDBs;
  uint64_t v10 = [(NSMutableArray *)txPowerBackoffDBs countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(txPowerBackoffDBs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)txPowerBackoffDBs countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v11);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  txDutyCyclePcts = self->_txDutyCyclePcts;
  uint64_t v15 = [(NSMutableArray *)txDutyCyclePcts countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(txDutyCyclePcts);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSMutableArray *)txDutyCyclePcts countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v16);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  cTLMIndex1s = self->_cTLMIndex1s;
  uint64_t v20 = [(NSMutableArray *)cTLMIndex1s countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(cTLMIndex1s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)cTLMIndex1s countByEnumeratingWithState:&v43 objects:v61 count:16];
    }
    while (v21);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  uint64_t v25 = [(NSMutableArray *)txPowerBackoffDB1s countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v26; ++n)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(txPowerBackoffDB1s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v26 = [(NSMutableArray *)txPowerBackoffDB1s countByEnumeratingWithState:&v39 objects:v60 count:16];
    }
    while (v26);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  txDutyCyclePct1s = self->_txDutyCyclePct1s;
  uint64_t v30 = [(NSMutableArray *)txDutyCyclePct1s countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v36;
    do
    {
      for (iuint64_t i = 0; ii != v31; ++ii)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(txDutyCyclePct1s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v31 = [(NSMutableArray *)txDutyCyclePct1s countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v31);
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

- (void)copyTo:(id)a3
{
  if ([(AWDWiFiNWActivityImpedingFunctions *)self cTLMIndexsCount])
  {
    [a3 clearCTLMIndexs];
    unint64_t v5 = [(AWDWiFiNWActivityImpedingFunctions *)self cTLMIndexsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addCTLMIndex:-[AWDWiFiNWActivityImpedingFunctions cTLMIndexAtIndex:](self, "cTLMIndexAtIndex:", i)];
    }
  }
  if ([(AWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDBsCount])
  {
    [a3 clearTxPowerBackoffDBs];
    unint64_t v8 = [(AWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDBsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addTxPowerBackoffDB:-[AWDWiFiNWActivityImpedingFunctions txPowerBackoffDBAtIndex:](self, "txPowerBackoffDBAtIndex:", j)];
    }
  }
  if ([(AWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePctsCount])
  {
    [a3 clearTxDutyCyclePcts];
    unint64_t v11 = [(AWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePctsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addTxDutyCyclePct:-[AWDWiFiNWActivityImpedingFunctions txDutyCyclePctAtIndex:](self, "txDutyCyclePctAtIndex:", k)];
    }
  }
  if ([(AWDWiFiNWActivityImpedingFunctions *)self cTLMIndex1sCount])
  {
    [a3 clearCTLMIndex1s];
    unint64_t v14 = [(AWDWiFiNWActivityImpedingFunctions *)self cTLMIndex1sCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addCTLMIndex1:-[AWDWiFiNWActivityImpedingFunctions cTLMIndex1AtIndex:](self, "cTLMIndex1AtIndex:", m)];
    }
  }
  if ([(AWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDB1sCount])
  {
    [a3 clearTxPowerBackoffDB1s];
    unint64_t v17 = [(AWDWiFiNWActivityImpedingFunctions *)self txPowerBackoffDB1sCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addTxPowerBackoffDB1:-[AWDWiFiNWActivityImpedingFunctions txPowerBackoffDB1AtIndex:](self, "txPowerBackoffDB1AtIndex:", n)];
    }
  }
  if ([(AWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePct1sCount])
  {
    [a3 clearTxDutyCyclePct1s];
    unint64_t v20 = [(AWDWiFiNWActivityImpedingFunctions *)self txDutyCyclePct1sCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        [a3 addTxDutyCyclePct1:-[AWDWiFiNWActivityImpedingFunctions txDutyCyclePct1AtIndex:](self, "txDutyCyclePct1AtIndex:", ii)];
    }
  }
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    *((_DWORD *)a3 + 36) = self->_txduty0;
    *((_DWORD *)a3 + 42) |= 0x80000u;
    $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
    if ((*(_DWORD *)&has & 0x100000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_DWORD *)&has & 0x100000) == 0)
  {
    goto LABEL_27;
  }
  *((_DWORD *)a3 + 37) = self->_txduty1;
  *((_DWORD *)a3 + 42) |= 0x100000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 38) = self->_txpowerbackoff0;
  *((_DWORD *)a3 + 42) |= 0x200000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 39) = self->_txpowerbackoff1;
  *((_DWORD *)a3 + 42) |= 0x400000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 2) = self->_activechains0;
  *((_DWORD *)a3 + 42) |= 1u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 3) = self->_activechains1;
  *((_DWORD *)a3 + 42) |= 2u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 24) = self->_temp0;
  *((_DWORD *)a3 + 42) |= 0x8000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 25) = self->_temp1;
  *((_DWORD *)a3 + 42) |= 0x10000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 40) = self->_voltage0;
  *((_DWORD *)a3 + 42) |= 0x800000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 41) = self->_voltage1;
  *((_DWORD *)a3 + 42) |= 0x1000000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_37;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 10) = self->_ppm0;
  *((_DWORD *)a3 + 42) |= 0x10u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 11) = self->_ppm1;
  *((_DWORD *)a3 + 42) |= 0x20u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 8) = self->_ctlmid0;
  *((_DWORD *)a3 + 42) |= 4u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 9) = self->_ctlmid1;
  *((_DWORD *)a3 + 42) |= 8u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)a3 + 26) = self->_tvpmindex0;
  *((_DWORD *)a3 + 42) |= 0x20000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_42;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)a3 + 27) = self->_tvpmindex1;
  *((_DWORD *)a3 + 42) |= 0x40000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_43;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)a3 + 13) = self->_rc1Request;
  *((_DWORD *)a3 + 42) |= 0x80u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_44;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)a3 + 12) = self->_rc1Duration;
  *((_DWORD *)a3 + 42) |= 0x40u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_45;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 14) = self->_rc1wlanCrit;
  *((_DWORD *)a3 + 42) |= 0x100u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 15) = self->_rc1wlanCritDuration;
  *((_DWORD *)a3 + 42) |= 0x200u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_47;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 19) = self->_rc2Request;
  *((_DWORD *)a3 + 42) |= 0x2000u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_48;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 16) = self->_rc2Duration;
  *((_DWORD *)a3 + 42) |= 0x400u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 17) = self->_rc2Grant;
  *((_DWORD *)a3 + 42) |= 0x800u;
  $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_78:
  *((_DWORD *)a3 + 18) = self->_rc2LongGrant;
  *((_DWORD *)a3 + 42) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_50:
    *((_DWORD *)a3 + 20) = self->_rc2cts2a;
    *((_DWORD *)a3 + 42) |= 0x4000u;
  }
LABEL_51:
  if (self->_sdbtdm)
  {
    [a3 setSdbtdm:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  cTLMIndexs = self->_cTLMIndexs;
  uint64_t v7 = [(NSMutableArray *)cTLMIndexs countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v65 != v9) {
          objc_enumerationMutation(cTLMIndexs);
        }
        unint64_t v11 = (void *)[*(id *)(*((void *)&v64 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addCTLMIndex:v11];
      }
      uint64_t v8 = [(NSMutableArray *)cTLMIndexs countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v8);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  txPowerBackoffDBs = self->_txPowerBackoffDBs;
  uint64_t v13 = [(NSMutableArray *)txPowerBackoffDBs countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v61 != v15) {
          objc_enumerationMutation(txPowerBackoffDBs);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v60 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addTxPowerBackoffDB:v17];
      }
      uint64_t v14 = [(NSMutableArray *)txPowerBackoffDBs countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v14);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  txDutyCyclePcts = self->_txDutyCyclePcts;
  uint64_t v19 = [(NSMutableArray *)txDutyCyclePcts countByEnumeratingWithState:&v56 objects:v71 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v57;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v57 != v21) {
          objc_enumerationMutation(txDutyCyclePcts);
        }
        v23 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addTxDutyCyclePct:v23];
      }
      uint64_t v20 = [(NSMutableArray *)txDutyCyclePcts countByEnumeratingWithState:&v56 objects:v71 count:16];
    }
    while (v20);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  cTLMIndex1s = self->_cTLMIndex1s;
  uint64_t v25 = [(NSMutableArray *)cTLMIndex1s countByEnumeratingWithState:&v52 objects:v70 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v53;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(cTLMIndex1s);
        }
        v29 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addCTLMIndex1:v29];
      }
      uint64_t v26 = [(NSMutableArray *)cTLMIndex1s countByEnumeratingWithState:&v52 objects:v70 count:16];
    }
    while (v26);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
  uint64_t v31 = [(NSMutableArray *)txPowerBackoffDB1s countByEnumeratingWithState:&v48 objects:v69 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v49;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(txPowerBackoffDB1s);
        }
        long long v35 = (void *)[*(id *)(*((void *)&v48 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addTxPowerBackoffDB1:v35];
      }
      uint64_t v32 = [(NSMutableArray *)txPowerBackoffDB1s countByEnumeratingWithState:&v48 objects:v69 count:16];
    }
    while (v32);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  txDutyCyclePct1s = self->_txDutyCyclePct1s;
  uint64_t v37 = [(NSMutableArray *)txDutyCyclePct1s countByEnumeratingWithState:&v44 objects:v68 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (iuint64_t i = 0; ii != v38; ++ii)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(txDutyCyclePct1s);
        }
        long long v41 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addTxDutyCyclePct1:v41];
      }
      uint64_t v38 = [(NSMutableArray *)txDutyCyclePct1s countByEnumeratingWithState:&v44 objects:v68 count:16];
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

  *(void *)(v5 + 88) = [(AWDWiFiTDM *)self->_sdbtdm copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    cTLMIndexs = self->_cTLMIndexs;
    if (!((unint64_t)cTLMIndexs | *((void *)a3 + 3))
      || (int v5 = -[NSMutableArray isEqual:](cTLMIndexs, "isEqual:")) != 0)
    {
      txPowerBackoffDBs = self->_txPowerBackoffDBs;
      if (!((unint64_t)txPowerBackoffDBs | *((void *)a3 + 17))
        || (int v5 = -[NSMutableArray isEqual:](txPowerBackoffDBs, "isEqual:")) != 0)
      {
        txDutyCyclePcts = self->_txDutyCyclePcts;
        if (!((unint64_t)txDutyCyclePcts | *((void *)a3 + 15))
          || (int v5 = -[NSMutableArray isEqual:](txDutyCyclePcts, "isEqual:")) != 0)
        {
          cTLMIndex1s = self->_cTLMIndex1s;
          if (!((unint64_t)cTLMIndex1s | *((void *)a3 + 2))
            || (int v5 = -[NSMutableArray isEqual:](cTLMIndex1s, "isEqual:")) != 0)
          {
            txPowerBackoffDB1s = self->_txPowerBackoffDB1s;
            if (!((unint64_t)txPowerBackoffDB1s | *((void *)a3 + 16))
              || (int v5 = -[NSMutableArray isEqual:](txPowerBackoffDB1s, "isEqual:")) != 0)
            {
              txDutyCyclePct1s = self->_txDutyCyclePct1s;
              if (!((unint64_t)txDutyCyclePct1s | *((void *)a3 + 14))
                || (int v5 = -[NSMutableArray isEqual:](txDutyCyclePct1s, "isEqual:")) != 0)
              {
                $C1F2D7BEB865EA600EC2FB99897FDEC2 has = self->_has;
                int v13 = *((_DWORD *)a3 + 42);
                if ((*(_DWORD *)&has & 0x80000) != 0)
                {
                  if ((v13 & 0x80000) == 0 || self->_txduty0 != *((_DWORD *)a3 + 36)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x80000) != 0)
                {
LABEL_141:
                  LOBYTE(v5) = 0;
                  return v5;
                }
                if ((*(_DWORD *)&has & 0x100000) != 0)
                {
                  if ((v13 & 0x100000) == 0 || self->_txduty1 != *((_DWORD *)a3 + 37)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x100000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_DWORD *)&has & 0x200000) != 0)
                {
                  if ((v13 & 0x200000) == 0 || self->_txpowerbackoff0 != *((_DWORD *)a3 + 38)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x200000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_DWORD *)&has & 0x400000) != 0)
                {
                  if ((v13 & 0x400000) == 0 || self->_txpowerbackoff1 != *((_DWORD *)a3 + 39)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x400000) != 0)
                {
                  goto LABEL_141;
                }
                if (*(unsigned char *)&has)
                {
                  if ((v13 & 1) == 0 || self->_activechains0 != *((_DWORD *)a3 + 2)) {
                    goto LABEL_141;
                  }
                }
                else if (v13)
                {
                  goto LABEL_141;
                }
                if ((*(unsigned char *)&has & 2) != 0)
                {
                  if ((v13 & 2) == 0 || self->_activechains1 != *((_DWORD *)a3 + 3)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 2) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x8000) != 0)
                {
                  if ((v13 & 0x8000) == 0 || self->_temp0 != *((_DWORD *)a3 + 24)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x8000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_DWORD *)&has & 0x10000) != 0)
                {
                  if ((v13 & 0x10000) == 0 || self->_temp1 != *((_DWORD *)a3 + 25)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x10000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_DWORD *)&has & 0x800000) != 0)
                {
                  if ((v13 & 0x800000) == 0 || self->_voltage0 != *((_DWORD *)a3 + 40)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x800000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_DWORD *)&has & 0x1000000) != 0)
                {
                  if ((v13 & 0x1000000) == 0 || self->_voltage1 != *((_DWORD *)a3 + 41)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x1000000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(unsigned char *)&has & 0x10) != 0)
                {
                  if ((v13 & 0x10) == 0 || self->_ppm0 != *((_DWORD *)a3 + 10)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x10) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(unsigned char *)&has & 0x20) != 0)
                {
                  if ((v13 & 0x20) == 0 || self->_ppm1 != *((_DWORD *)a3 + 11)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x20) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(unsigned char *)&has & 4) != 0)
                {
                  if ((v13 & 4) == 0 || self->_ctlmid0 != *((_DWORD *)a3 + 8)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 4) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(unsigned char *)&has & 8) != 0)
                {
                  if ((v13 & 8) == 0 || self->_ctlmid1 != *((_DWORD *)a3 + 9)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 8) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_DWORD *)&has & 0x20000) != 0)
                {
                  if ((v13 & 0x20000) == 0 || self->_tvpmindex0 != *((_DWORD *)a3 + 26)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x20000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_DWORD *)&has & 0x40000) != 0)
                {
                  if ((v13 & 0x40000) == 0 || self->_tvpmindex1 != *((_DWORD *)a3 + 27)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x40000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(unsigned char *)&has & 0x80) != 0)
                {
                  if ((v13 & 0x80) == 0 || self->_rc1Request != *((_DWORD *)a3 + 13)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x80) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(unsigned char *)&has & 0x40) != 0)
                {
                  if ((v13 & 0x40) == 0 || self->_rc1Duration != *((_DWORD *)a3 + 12)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x40) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x100) != 0)
                {
                  if ((v13 & 0x100) == 0 || self->_rc1wlanCrit != *((_DWORD *)a3 + 14)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x100) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x200) != 0)
                {
                  if ((v13 & 0x200) == 0 || self->_rc1wlanCritDuration != *((_DWORD *)a3 + 15)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x200) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x2000) != 0)
                {
                  if ((v13 & 0x2000) == 0 || self->_rc2Request != *((_DWORD *)a3 + 19)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x2000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x400) != 0)
                {
                  if ((v13 & 0x400) == 0 || self->_rc2Duration != *((_DWORD *)a3 + 16)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x400) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x800) != 0)
                {
                  if ((v13 & 0x800) == 0 || self->_rc2Grant != *((_DWORD *)a3 + 17)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x800) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x1000) != 0)
                {
                  if ((v13 & 0x1000) == 0 || self->_rc2LongGrant != *((_DWORD *)a3 + 18)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x1000) != 0)
                {
                  goto LABEL_141;
                }
                if ((*(_WORD *)&has & 0x4000) != 0)
                {
                  if ((v13 & 0x4000) == 0 || self->_rc2cts2a != *((_DWORD *)a3 + 20)) {
                    goto LABEL_141;
                  }
                }
                else if ((v13 & 0x4000) != 0)
                {
                  goto LABEL_141;
                }
                sdbtduint64_t m = self->_sdbtdm;
                if ((unint64_t)sdbtdm | *((void *)a3 + 11))
                {
                  LOBYTE(v5) = -[AWDWiFiTDM isEqual:](sdbtdm, "isEqual:");
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
  }
  return v5;
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
    return v35 ^ v3 ^ v34 ^ v33 ^ v32 ^ v4 ^ v31 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ [(AWDWiFiTDM *)self->_sdbtdm hash];
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
  return v35 ^ v3 ^ v34 ^ v33 ^ v32 ^ v4 ^ v31 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ [(AWDWiFiTDM *)self->_sdbtdm hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  int v5 = (void *)*((void *)a3 + 3);
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
        [(AWDWiFiNWActivityImpedingFunctions *)self addCTLMIndex:*(void *)(*((void *)&v58 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v7);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 17);
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
        [(AWDWiFiNWActivityImpedingFunctions *)self addTxPowerBackoffDB:*(void *)(*((void *)&v54 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v12);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v15 = (void *)*((void *)a3 + 15);
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
        [(AWDWiFiNWActivityImpedingFunctions *)self addTxDutyCyclePct:*(void *)(*((void *)&v50 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v17);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v20 = (void *)*((void *)a3 + 2);
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
        [(AWDWiFiNWActivityImpedingFunctions *)self addCTLMIndex1:*(void *)(*((void *)&v46 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v22);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v25 = (void *)*((void *)a3 + 16);
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
        [(AWDWiFiNWActivityImpedingFunctions *)self addTxPowerBackoffDB1:*(void *)(*((void *)&v42 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v63 count:16];
    }
    while (v27);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v30 = (void *)*((void *)a3 + 14);
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
        [(AWDWiFiNWActivityImpedingFunctions *)self addTxDutyCyclePct1:*(void *)(*((void *)&v38 + 1) + 8 * ii)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v32);
  }
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x80000) != 0)
  {
    self->_txduty0 = *((_DWORD *)a3 + 36);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v35 = *((_DWORD *)a3 + 42);
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
  self->_txduty1 = *((_DWORD *)a3 + 37);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x200000) == 0)
  {
LABEL_46:
    if ((v35 & 0x400000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_txpowerbackoff0 = *((_DWORD *)a3 + 38);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x400000) == 0)
  {
LABEL_47:
    if ((v35 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_txpowerbackoff1 = *((_DWORD *)a3 + 39);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 1) == 0)
  {
LABEL_48:
    if ((v35 & 2) == 0) {
      goto LABEL_49;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_activechains0 = *((_DWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 1u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 2) == 0)
  {
LABEL_49:
    if ((v35 & 0x8000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_activechains1 = *((_DWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 2u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x8000) == 0)
  {
LABEL_50:
    if ((v35 & 0x10000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_temp0 = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x10000) == 0)
  {
LABEL_51:
    if ((v35 & 0x800000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_temp1 = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x800000) == 0)
  {
LABEL_52:
    if ((v35 & 0x1000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_voltage0 = *((_DWORD *)a3 + 40);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x1000000) == 0)
  {
LABEL_53:
    if ((v35 & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_voltage1 = *((_DWORD *)a3 + 41);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x10) == 0)
  {
LABEL_54:
    if ((v35 & 0x20) == 0) {
      goto LABEL_55;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_ppm0 = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x20) == 0)
  {
LABEL_55:
    if ((v35 & 4) == 0) {
      goto LABEL_56;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_ppm1 = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 4) == 0)
  {
LABEL_56:
    if ((v35 & 8) == 0) {
      goto LABEL_57;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_ctlmid0 = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 4u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 8) == 0)
  {
LABEL_57:
    if ((v35 & 0x20000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_ctlmid1 = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 8u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x20000) == 0)
  {
LABEL_58:
    if ((v35 & 0x40000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_tvpmindex0 = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x40000) == 0)
  {
LABEL_59:
    if ((v35 & 0x80) == 0) {
      goto LABEL_60;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_tvpmindex1 = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x80) == 0)
  {
LABEL_60:
    if ((v35 & 0x40) == 0) {
      goto LABEL_61;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_rc1Request = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x40) == 0)
  {
LABEL_61:
    if ((v35 & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_rc1Duratiouint64_t n = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x100) == 0)
  {
LABEL_62:
    if ((v35 & 0x200) == 0) {
      goto LABEL_63;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_rc1wlanCrit = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x200) == 0)
  {
LABEL_63:
    if ((v35 & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_rc1wlanCritDuratiouint64_t n = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x2000) == 0)
  {
LABEL_64:
    if ((v35 & 0x400) == 0) {
      goto LABEL_65;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_rc2Request = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x400) == 0)
  {
LABEL_65:
    if ((v35 & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_rc2Duratiouint64_t n = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x800) == 0)
  {
LABEL_66:
    if ((v35 & 0x1000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_rc2Grant = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  int v35 = *((_DWORD *)a3 + 42);
  if ((v35 & 0x1000) == 0)
  {
LABEL_67:
    if ((v35 & 0x4000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_95:
  self->_rc2LongGrant = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)a3 + 42) & 0x4000) != 0)
  {
LABEL_68:
    self->_rc2cts2a = *((_DWORD *)a3 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_69:
  sdbtduint64_t m = self->_sdbtdm;
  uint64_t v37 = *((void *)a3 + 11);
  if (sdbtdm)
  {
    if (v37) {
      -[AWDWiFiTDM mergeFrom:](sdbtdm, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[AWDWiFiNWActivityImpedingFunctions setSdbtdm:](self, "setSdbtdm:");
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

- (AWDWiFiTDM)sdbtdm
{
  return self->_sdbtdm;
}

- (void)setSdbtdm:(id)a3
{
}

@end