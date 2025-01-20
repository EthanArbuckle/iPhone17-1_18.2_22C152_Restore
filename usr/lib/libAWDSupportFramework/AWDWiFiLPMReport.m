@interface AWDWiFiLPMReport
- (BOOL)hasAssociatedDuration;
- (BOOL)hasAssociatedSleepDuration;
- (BOOL)hasBeaconReceivedInLpas;
- (BOOL)hasBeaconsEarlyTerminatedInLpas;
- (BOOL)hasBeaconsMissedInLpas;
- (BOOL)hasBeaconsScheduledInLpas;
- (BOOL)hasLpasPowerBudgetRemaining;
- (BOOL)hasLpasPowerPeriodRemaining;
- (BOOL)hasPhyOffDuration;
- (BOOL)hasPowerConsumedInSelfManagedLPASMode;
- (BOOL)hasPowerConsumptionDueToAWDLRx;
- (BOOL)hasPowerConsumptionDueToAWDLTx;
- (BOOL)hasPowerConsumptionDueToAssocScan;
- (BOOL)hasPowerConsumptionDueToEPNOScan;
- (BOOL)hasPowerConsumptionDueToFRTS;
- (BOOL)hasPowerConsumptionDueToMac;
- (BOOL)hasPowerConsumptionDueToRF;
- (BOOL)hasPowerConsumptionDueToRoamScan;
- (BOOL)hasPowerConsumptionDueToRx;
- (BOOL)hasPowerConsumptionDueToTx;
- (BOOL)hasPowerConsumptionDueToUserScan;
- (BOOL)hasReceiveDuration;
- (BOOL)hasRoamDuration;
- (BOOL)hasSleepDuration;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalLPASDuration;
- (BOOL)hasTotalLpasPowerBudget;
- (BOOL)hasTotalLpasPowerMonitoringPeriod;
- (BOOL)hasTotalTimeForBugetExpiry;
- (BOOL)hasTransmitDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)associatedDuration;
- (unint64_t)associatedSleepDuration;
- (unint64_t)beaconReceivedInLpas;
- (unint64_t)beaconsEarlyTerminatedInLpas;
- (unint64_t)beaconsMissedInLpas;
- (unint64_t)beaconsScheduledInLpas;
- (unint64_t)hash;
- (unint64_t)lpasPowerBudgetRemaining;
- (unint64_t)lpasPowerPeriodRemaining;
- (unint64_t)phyOffDuration;
- (unint64_t)powerConsumedInSelfManagedLPASMode;
- (unint64_t)powerConsumptionDueToAWDLRx;
- (unint64_t)powerConsumptionDueToAWDLTx;
- (unint64_t)powerConsumptionDueToAssocScan;
- (unint64_t)powerConsumptionDueToEPNOScan;
- (unint64_t)powerConsumptionDueToFRTS;
- (unint64_t)powerConsumptionDueToMac;
- (unint64_t)powerConsumptionDueToRF;
- (unint64_t)powerConsumptionDueToRoamScan;
- (unint64_t)powerConsumptionDueToRx;
- (unint64_t)powerConsumptionDueToTx;
- (unint64_t)powerConsumptionDueToUserScan;
- (unint64_t)receiveDuration;
- (unint64_t)roamDuration;
- (unint64_t)sleepDuration;
- (unint64_t)timestamp;
- (unint64_t)totalLPASDuration;
- (unint64_t)totalLpasPowerBudget;
- (unint64_t)totalLpasPowerMonitoringPeriod;
- (unint64_t)totalTimeForBugetExpiry;
- (unint64_t)transmitDuration;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedDuration:(unint64_t)a3;
- (void)setAssociatedSleepDuration:(unint64_t)a3;
- (void)setBeaconReceivedInLpas:(unint64_t)a3;
- (void)setBeaconsEarlyTerminatedInLpas:(unint64_t)a3;
- (void)setBeaconsMissedInLpas:(unint64_t)a3;
- (void)setBeaconsScheduledInLpas:(unint64_t)a3;
- (void)setHasAssociatedDuration:(BOOL)a3;
- (void)setHasAssociatedSleepDuration:(BOOL)a3;
- (void)setHasBeaconReceivedInLpas:(BOOL)a3;
- (void)setHasBeaconsEarlyTerminatedInLpas:(BOOL)a3;
- (void)setHasBeaconsMissedInLpas:(BOOL)a3;
- (void)setHasBeaconsScheduledInLpas:(BOOL)a3;
- (void)setHasLpasPowerBudgetRemaining:(BOOL)a3;
- (void)setHasLpasPowerPeriodRemaining:(BOOL)a3;
- (void)setHasPhyOffDuration:(BOOL)a3;
- (void)setHasPowerConsumedInSelfManagedLPASMode:(BOOL)a3;
- (void)setHasPowerConsumptionDueToAWDLRx:(BOOL)a3;
- (void)setHasPowerConsumptionDueToAWDLTx:(BOOL)a3;
- (void)setHasPowerConsumptionDueToAssocScan:(BOOL)a3;
- (void)setHasPowerConsumptionDueToEPNOScan:(BOOL)a3;
- (void)setHasPowerConsumptionDueToFRTS:(BOOL)a3;
- (void)setHasPowerConsumptionDueToMac:(BOOL)a3;
- (void)setHasPowerConsumptionDueToRF:(BOOL)a3;
- (void)setHasPowerConsumptionDueToRoamScan:(BOOL)a3;
- (void)setHasPowerConsumptionDueToRx:(BOOL)a3;
- (void)setHasPowerConsumptionDueToTx:(BOOL)a3;
- (void)setHasPowerConsumptionDueToUserScan:(BOOL)a3;
- (void)setHasReceiveDuration:(BOOL)a3;
- (void)setHasRoamDuration:(BOOL)a3;
- (void)setHasSleepDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalLPASDuration:(BOOL)a3;
- (void)setHasTotalLpasPowerBudget:(BOOL)a3;
- (void)setHasTotalLpasPowerMonitoringPeriod:(BOOL)a3;
- (void)setHasTotalTimeForBugetExpiry:(BOOL)a3;
- (void)setHasTransmitDuration:(BOOL)a3;
- (void)setLpasPowerBudgetRemaining:(unint64_t)a3;
- (void)setLpasPowerPeriodRemaining:(unint64_t)a3;
- (void)setPhyOffDuration:(unint64_t)a3;
- (void)setPowerConsumedInSelfManagedLPASMode:(unint64_t)a3;
- (void)setPowerConsumptionDueToAWDLRx:(unint64_t)a3;
- (void)setPowerConsumptionDueToAWDLTx:(unint64_t)a3;
- (void)setPowerConsumptionDueToAssocScan:(unint64_t)a3;
- (void)setPowerConsumptionDueToEPNOScan:(unint64_t)a3;
- (void)setPowerConsumptionDueToFRTS:(unint64_t)a3;
- (void)setPowerConsumptionDueToMac:(unint64_t)a3;
- (void)setPowerConsumptionDueToRF:(unint64_t)a3;
- (void)setPowerConsumptionDueToRoamScan:(unint64_t)a3;
- (void)setPowerConsumptionDueToRx:(unint64_t)a3;
- (void)setPowerConsumptionDueToTx:(unint64_t)a3;
- (void)setPowerConsumptionDueToUserScan:(unint64_t)a3;
- (void)setReceiveDuration:(unint64_t)a3;
- (void)setRoamDuration:(unint64_t)a3;
- (void)setSleepDuration:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalLPASDuration:(unint64_t)a3;
- (void)setTotalLpasPowerBudget:(unint64_t)a3;
- (void)setTotalLpasPowerMonitoringPeriod:(unint64_t)a3;
- (void)setTotalTimeForBugetExpiry:(unint64_t)a3;
- (void)setTransmitDuration:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiLPMReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTimestamp
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setAssociatedDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_associatedDuration = a3;
}

- (void)setHasAssociatedDuration:(BOOL)a3
{
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssociatedDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSleepDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sleepDuration = a3;
}

- (void)setHasSleepDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSleepDuration
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setRoamDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_roamDuration = a3;
}

- (void)setHasRoamDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasRoamDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPhyOffDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_phyOffDuration = a3;
}

- (void)setHasPhyOffDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPhyOffDuration
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setTransmitDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_transmitDuration = a3;
}

- (void)setHasTransmitDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasTransmitDuration
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setReceiveDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_receiveDuration = a3;
}

- (void)setHasReceiveDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasReceiveDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTotalLPASDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_totalLPASDuration = a3;
}

- (void)setHasTotalLPASDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTotalLPASDuration
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setPowerConsumedInSelfManagedLPASMode:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_powerConsumedInSelfManagedLPASMode = a3;
}

- (void)setHasPowerConsumedInSelfManagedLPASMode:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPowerConsumedInSelfManagedLPASMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setPowerConsumptionDueToMac:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_powerConsumptionDueToMac = a3;
}

- (void)setHasPowerConsumptionDueToMac:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPowerConsumptionDueToMac
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPowerConsumptionDueToRF:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_powerConsumptionDueToRF = a3;
}

- (void)setHasPowerConsumptionDueToRF:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToRF
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setPowerConsumptionDueToUserScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_powerConsumptionDueToUserScan = a3;
}

- (void)setHasPowerConsumptionDueToUserScan:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToUserScan
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPowerConsumptionDueToRoamScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_powerConsumptionDueToRoamScan = a3;
}

- (void)setHasPowerConsumptionDueToRoamScan:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToRoamScan
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPowerConsumptionDueToAssocScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_powerConsumptionDueToAssocScan = a3;
}

- (void)setHasPowerConsumptionDueToAssocScan:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToAssocScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setPowerConsumptionDueToEPNOScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_powerConsumptionDueToEPNOScan = a3;
}

- (void)setHasPowerConsumptionDueToEPNOScan:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToEPNOScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPowerConsumptionDueToTx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_powerConsumptionDueToTx = a3;
}

- (void)setHasPowerConsumptionDueToTx:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToTx
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setPowerConsumptionDueToRx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_powerConsumptionDueToRx = a3;
}

- (void)setHasPowerConsumptionDueToRx:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToRx
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPowerConsumptionDueToFRTS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_powerConsumptionDueToFRTS = a3;
}

- (void)setHasPowerConsumptionDueToFRTS:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPowerConsumptionDueToFRTS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPowerConsumptionDueToAWDLTx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_powerConsumptionDueToAWDLTx = a3;
}

- (void)setHasPowerConsumptionDueToAWDLTx:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPowerConsumptionDueToAWDLTx
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setPowerConsumptionDueToAWDLRx:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_powerConsumptionDueToAWDLRx = a3;
}

- (void)setHasPowerConsumptionDueToAWDLRx:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPowerConsumptionDueToAWDLRx
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBeaconReceivedInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_beaconReceivedInLpas = a3;
}

- (void)setHasBeaconReceivedInLpas:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBeaconReceivedInLpas
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBeaconsMissedInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_beaconsMissedInLpas = a3;
}

- (void)setHasBeaconsMissedInLpas:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBeaconsMissedInLpas
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBeaconsEarlyTerminatedInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_beaconsEarlyTerminatedInLpas = a3;
}

- (void)setHasBeaconsEarlyTerminatedInLpas:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBeaconsEarlyTerminatedInLpas
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBeaconsScheduledInLpas:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_beaconsScheduledInLpas = a3;
}

- (void)setHasBeaconsScheduledInLpas:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBeaconsScheduledInLpas
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTotalLpasPowerBudget:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_totalLpasPowerBudget = a3;
}

- (void)setHasTotalLpasPowerBudget:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTotalLpasPowerBudget
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setLpasPowerBudgetRemaining:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lpasPowerBudgetRemaining = a3;
}

- (void)setHasLpasPowerBudgetRemaining:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLpasPowerBudgetRemaining
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTotalLpasPowerMonitoringPeriod:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_totalLpasPowerMonitoringPeriod = a3;
}

- (void)setHasTotalLpasPowerMonitoringPeriod:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTotalLpasPowerMonitoringPeriod
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setLpasPowerPeriodRemaining:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lpasPowerPeriodRemaining = a3;
}

- (void)setHasLpasPowerPeriodRemaining:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLpasPowerPeriodRemaining
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setAssociatedSleepDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_associatedSleepDuration = a3;
}

- (void)setHasAssociatedSleepDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAssociatedSleepDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalTimeForBugetExpiry:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_totalTimeForBugetExpiry = a3;
}

- (void)setHasTotalTimeForBugetExpiry:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1BB6750C757AE8AC8B1C418F6E197DA9)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTotalTimeForBugetExpiry
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLPMReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiLPMReport description](&v3, sel_description), -[AWDWiFiLPMReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_associatedDuration] forKey:@"associatedDuration"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sleepDuration] forKey:@"sleepDuration"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_roamDuration] forKey:@"roamDuration"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_phyOffDuration] forKey:@"phyOffDuration"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_transmitDuration] forKey:@"transmitDuration"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_receiveDuration] forKey:@"receiveDuration"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalLPASDuration] forKey:@"totalLPASDuration"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumedInSelfManagedLPASMode] forKey:@"powerConsumedInSelfManagedLPASMode"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToMac] forKey:@"powerConsumptionDueToMac"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToRF] forKey:@"powerConsumptionDueToRF"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToUserScan] forKey:@"powerConsumptionDueToUserScan"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToRoamScan] forKey:@"powerConsumptionDueToRoamScan"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToAssocScan] forKey:@"powerConsumptionDueToAssocScan"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToEPNOScan] forKey:@"powerConsumptionDueToEPNOScan"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToTx] forKey:@"powerConsumptionDueToTx"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToRx] forKey:@"powerConsumptionDueToRx"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToFRTS] forKey:@"powerConsumptionDueToFRTS"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToAWDLTx] forKey:@"powerConsumptionDueToAWDLTx"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_powerConsumptionDueToAWDLRx] forKey:@"powerConsumptionDueToAWDLRx"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beaconReceivedInLpas] forKey:@"beaconReceivedInLpas"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beaconsMissedInLpas] forKey:@"beaconsMissedInLpas"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beaconsEarlyTerminatedInLpas] forKey:@"beaconsEarlyTerminatedInLpas"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beaconsScheduledInLpas] forKey:@"beaconsScheduledInLpas"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalLpasPowerBudget] forKey:@"totalLpasPowerBudget"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lpasPowerBudgetRemaining] forKey:@"lpasPowerBudgetRemaining"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalLpasPowerMonitoringPeriod] forKey:@"totalLpasPowerMonitoringPeriod"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_30;
    }
LABEL_61:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_associatedSleepDuration] forKey:@"associatedSleepDuration"];
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      return v3;
    }
    goto LABEL_31;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lpasPowerPeriodRemaining] forKey:@"lpasPowerPeriodRemaining"];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0) {
    goto LABEL_61;
  }
LABEL_30:
  if ((*(_DWORD *)&has & 0x10000000) != 0) {
LABEL_31:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalTimeForBugetExpiry] forKey:@"totalTimeForBugetExpiry"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLPMReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_30;
    }
LABEL_60:
    PBDataWriterWriteUint64Field();
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      return;
    }
    goto LABEL_61;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0) {
    goto LABEL_60;
  }
LABEL_30:
  if ((*(_DWORD *)&has & 0x10000000) == 0) {
    return;
  }
LABEL_61:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    *((void *)a3 + 25) = self->_timestamp;
    *((_DWORD *)a3 + 62) |= 0x1000000u;
    $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_associatedDuration;
  *((_DWORD *)a3 + 62) |= 1u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)a3 + 24) = self->_sleepDuration;
  *((_DWORD *)a3 + 62) |= 0x800000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 23) = self->_roamDuration;
  *((_DWORD *)a3 + 62) |= 0x400000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)a3 + 9) = self->_phyOffDuration;
  *((_DWORD *)a3 + 62) |= 0x100u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)a3 + 30) = self->_transmitDuration;
  *((_DWORD *)a3 + 62) |= 0x20000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 22) = self->_receiveDuration;
  *((_DWORD *)a3 + 62) |= 0x200000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 26) = self->_totalLPASDuration;
  *((_DWORD *)a3 + 62) |= 0x2000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 10) = self->_powerConsumedInSelfManagedLPASMode;
  *((_DWORD *)a3 + 62) |= 0x200u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)a3 + 16) = self->_powerConsumptionDueToMac;
  *((_DWORD *)a3 + 62) |= 0x8000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)a3 + 17) = self->_powerConsumptionDueToRF;
  *((_DWORD *)a3 + 62) |= 0x10000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)a3 + 21) = self->_powerConsumptionDueToUserScan;
  *((_DWORD *)a3 + 62) |= 0x100000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)a3 + 18) = self->_powerConsumptionDueToRoamScan;
  *((_DWORD *)a3 + 62) |= 0x20000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)a3 + 13) = self->_powerConsumptionDueToAssocScan;
  *((_DWORD *)a3 + 62) |= 0x1000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)a3 + 14) = self->_powerConsumptionDueToEPNOScan;
  *((_DWORD *)a3 + 62) |= 0x2000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)a3 + 20) = self->_powerConsumptionDueToTx;
  *((_DWORD *)a3 + 62) |= 0x80000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)a3 + 19) = self->_powerConsumptionDueToRx;
  *((_DWORD *)a3 + 62) |= 0x40000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)a3 + 15) = self->_powerConsumptionDueToFRTS;
  *((_DWORD *)a3 + 62) |= 0x4000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 12) = self->_powerConsumptionDueToAWDLTx;
  *((_DWORD *)a3 + 62) |= 0x800u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 11) = self->_powerConsumptionDueToAWDLRx;
  *((_DWORD *)a3 + 62) |= 0x400u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 3) = self->_beaconReceivedInLpas;
  *((_DWORD *)a3 + 62) |= 4u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 5) = self->_beaconsMissedInLpas;
  *((_DWORD *)a3 + 62) |= 0x10u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 4) = self->_beaconsEarlyTerminatedInLpas;
  *((_DWORD *)a3 + 62) |= 8u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 6) = self->_beaconsScheduledInLpas;
  *((_DWORD *)a3 + 62) |= 0x20u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 27) = self->_totalLpasPowerBudget;
  *((_DWORD *)a3 + 62) |= 0x4000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 7) = self->_lpasPowerBudgetRemaining;
  *((_DWORD *)a3 + 62) |= 0x40u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)a3 + 28) = self->_totalLpasPowerMonitoringPeriod;
  *((_DWORD *)a3 + 62) |= 0x8000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 8) = self->_lpasPowerPeriodRemaining;
  *((_DWORD *)a3 + 62) |= 0x80u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      return;
    }
LABEL_61:
    *((void *)a3 + 29) = self->_totalTimeForBugetExpiry;
    *((_DWORD *)a3 + 62) |= 0x10000000u;
    return;
  }
LABEL_60:
  *((void *)a3 + 2) = self->_associatedSleepDuration;
  *((_DWORD *)a3 + 62) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
    goto LABEL_61;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    *((void *)result + 25) = self->_timestamp;
    *((_DWORD *)result + 62) |= 0x1000000u;
    $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_associatedDuration;
  *((_DWORD *)result + 62) |= 1u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 24) = self->_sleepDuration;
  *((_DWORD *)result + 62) |= 0x800000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 23) = self->_roamDuration;
  *((_DWORD *)result + 62) |= 0x400000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 9) = self->_phyOffDuration;
  *((_DWORD *)result + 62) |= 0x100u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 30) = self->_transmitDuration;
  *((_DWORD *)result + 62) |= 0x20000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 22) = self->_receiveDuration;
  *((_DWORD *)result + 62) |= 0x200000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 26) = self->_totalLPASDuration;
  *((_DWORD *)result + 62) |= 0x2000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 10) = self->_powerConsumedInSelfManagedLPASMode;
  *((_DWORD *)result + 62) |= 0x200u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 16) = self->_powerConsumptionDueToMac;
  *((_DWORD *)result + 62) |= 0x8000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)result + 17) = self->_powerConsumptionDueToRF;
  *((_DWORD *)result + 62) |= 0x10000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)result + 21) = self->_powerConsumptionDueToUserScan;
  *((_DWORD *)result + 62) |= 0x100000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)result + 18) = self->_powerConsumptionDueToRoamScan;
  *((_DWORD *)result + 62) |= 0x20000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)result + 13) = self->_powerConsumptionDueToAssocScan;
  *((_DWORD *)result + 62) |= 0x1000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)result + 14) = self->_powerConsumptionDueToEPNOScan;
  *((_DWORD *)result + 62) |= 0x2000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)result + 20) = self->_powerConsumptionDueToTx;
  *((_DWORD *)result + 62) |= 0x80000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)result + 19) = self->_powerConsumptionDueToRx;
  *((_DWORD *)result + 62) |= 0x40000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)result + 15) = self->_powerConsumptionDueToFRTS;
  *((_DWORD *)result + 62) |= 0x4000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)result + 12) = self->_powerConsumptionDueToAWDLTx;
  *((_DWORD *)result + 62) |= 0x800u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)result + 11) = self->_powerConsumptionDueToAWDLRx;
  *((_DWORD *)result + 62) |= 0x400u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)result + 3) = self->_beaconReceivedInLpas;
  *((_DWORD *)result + 62) |= 4u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)result + 5) = self->_beaconsMissedInLpas;
  *((_DWORD *)result + 62) |= 0x10u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)result + 4) = self->_beaconsEarlyTerminatedInLpas;
  *((_DWORD *)result + 62) |= 8u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)result + 6) = self->_beaconsScheduledInLpas;
  *((_DWORD *)result + 62) |= 0x20u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)result + 27) = self->_totalLpasPowerBudget;
  *((_DWORD *)result + 62) |= 0x4000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)result + 7) = self->_lpasPowerBudgetRemaining;
  *((_DWORD *)result + 62) |= 0x40u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)result + 28) = self->_totalLpasPowerMonitoringPeriod;
  *((_DWORD *)result + 62) |= 0x8000000u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)result + 8) = self->_lpasPowerPeriodRemaining;
  *((_DWORD *)result + 62) |= 0x80u;
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      return result;
    }
    goto LABEL_31;
  }
LABEL_61:
  *((void *)result + 2) = self->_associatedSleepDuration;
  *((_DWORD *)result + 62) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
    return result;
  }
LABEL_31:
  *((void *)result + 29) = self->_totalTimeForBugetExpiry;
  *((_DWORD *)result + 62) |= 0x10000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
    int v7 = *((_DWORD *)a3 + 62);
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_timestamp != *((void *)a3 + 25)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
LABEL_151:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_associatedDuration != *((void *)a3 + 1)) {
        goto LABEL_151;
      }
    }
    else if (v7)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_sleepDuration != *((void *)a3 + 24)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_roamDuration != *((void *)a3 + 23)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_phyOffDuration != *((void *)a3 + 9)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_transmitDuration != *((void *)a3 + 30)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_receiveDuration != *((void *)a3 + 22)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_totalLPASDuration != *((void *)a3 + 26)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_powerConsumedInSelfManagedLPASMode != *((void *)a3 + 10)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_powerConsumptionDueToMac != *((void *)a3 + 16)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_powerConsumptionDueToRF != *((void *)a3 + 17)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_powerConsumptionDueToUserScan != *((void *)a3 + 21)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_powerConsumptionDueToRoamScan != *((void *)a3 + 18)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_powerConsumptionDueToAssocScan != *((void *)a3 + 13)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_powerConsumptionDueToEPNOScan != *((void *)a3 + 14)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_powerConsumptionDueToTx != *((void *)a3 + 20)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_powerConsumptionDueToRx != *((void *)a3 + 19)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_powerConsumptionDueToFRTS != *((void *)a3 + 15)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_powerConsumptionDueToAWDLTx != *((void *)a3 + 12)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_powerConsumptionDueToAWDLRx != *((void *)a3 + 11)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_beaconReceivedInLpas != *((void *)a3 + 3)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_beaconsMissedInLpas != *((void *)a3 + 5)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_beaconsEarlyTerminatedInLpas != *((void *)a3 + 4)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_beaconsScheduledInLpas != *((void *)a3 + 6)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_totalLpasPowerBudget != *((void *)a3 + 27)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_lpasPowerBudgetRemaining != *((void *)a3 + 7)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_totalLpasPowerMonitoringPeriod != *((void *)a3 + 28)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_lpasPowerPeriodRemaining != *((void *)a3 + 8)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_associatedSleepDuration != *((void *)a3 + 2)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_151;
    }
    LOBYTE(v5) = (v7 & 0x10000000) == 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_totalTimeForBugetExpiry != *((void *)a3 + 29)) {
        goto LABEL_151;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $1BB6750C757AE8AC8B1C418F6E197DA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    unint64_t v33 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&has)
    {
LABEL_3:
      unint64_t v32 = 2654435761u * self->_associatedDuration;
      if ((*(_DWORD *)&has & 0x800000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else
  {
    unint64_t v33 = 0;
    if (*(unsigned char *)&has) {
      goto LABEL_3;
    }
  }
  unint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_4:
    unint64_t v31 = 2654435761u * self->_sleepDuration;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    unint64_t v3 = 2654435761u * self->_roamDuration;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v3 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_6:
    unint64_t v4 = 2654435761u * self->_phyOffDuration;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_7:
    unint64_t v5 = 2654435761u * self->_transmitDuration;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_8:
    unint64_t v6 = 2654435761u * self->_receiveDuration;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_9:
    unint64_t v7 = 2654435761u * self->_totalLPASDuration;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    unint64_t v8 = 2654435761u * self->_powerConsumedInSelfManagedLPASMode;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_11:
    unint64_t v9 = 2654435761u * self->_powerConsumptionDueToMac;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_12:
    unint64_t v10 = 2654435761u * self->_powerConsumptionDueToRF;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_13:
    unint64_t v11 = 2654435761u * self->_powerConsumptionDueToUserScan;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  unint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_14:
    unint64_t v12 = 2654435761u * self->_powerConsumptionDueToRoamScan;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    unint64_t v13 = 2654435761u * self->_powerConsumptionDueToAssocScan;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_16:
    unint64_t v14 = 2654435761u * self->_powerConsumptionDueToEPNOScan;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  unint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    unint64_t v15 = 2654435761u * self->_powerConsumptionDueToTx;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  unint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_18:
    unint64_t v16 = 2654435761u * self->_powerConsumptionDueToRx;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  unint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_19:
    unint64_t v17 = 2654435761u * self->_powerConsumptionDueToFRTS;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  unint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_20:
    unint64_t v18 = 2654435761u * self->_powerConsumptionDueToAWDLTx;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  unint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_21:
    unint64_t v19 = 2654435761u * self->_powerConsumptionDueToAWDLRx;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  unint64_t v19 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_22:
    unint64_t v20 = 2654435761u * self->_beaconReceivedInLpas;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_23:
    unint64_t v21 = 2654435761u * self->_beaconsMissedInLpas;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v21 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_24:
    unint64_t v22 = 2654435761u * self->_beaconsEarlyTerminatedInLpas;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_25:
    unint64_t v23 = 2654435761u * self->_beaconsScheduledInLpas;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  unint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_26:
    unint64_t v24 = 2654435761u * self->_totalLpasPowerBudget;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  unint64_t v24 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_27:
    unint64_t v25 = 2654435761u * self->_lpasPowerBudgetRemaining;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  unint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_28:
    unint64_t v26 = 2654435761u * self->_totalLpasPowerMonitoringPeriod;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v26 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_29:
    unint64_t v27 = 2654435761u * self->_lpasPowerPeriodRemaining;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_30;
    }
LABEL_60:
    unint64_t v28 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_31;
    }
LABEL_61:
    unint64_t v29 = 0;
    return v32 ^ v33 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_59:
  unint64_t v27 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_60;
  }
LABEL_30:
  unint64_t v28 = 2654435761u * self->_associatedSleepDuration;
  if ((*(_DWORD *)&has & 0x10000000) == 0) {
    goto LABEL_61;
  }
LABEL_31:
  unint64_t v29 = 2654435761u * self->_totalTimeForBugetExpiry;
  return v32 ^ v33 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000000) != 0)
  {
    self->_timestamp = *((void *)a3 + 25);
    *(_DWORD *)&self->_has |= 0x1000000u;
    int v3 = *((_DWORD *)a3 + 62);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x800000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_associatedDuration = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800000) == 0)
  {
LABEL_4:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_sleepDuration = *((void *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400000) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_roamDuration = *((void *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_phyOffDuration = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_transmitDuration = *((void *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x20000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200000) == 0)
  {
LABEL_8:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_receiveDuration = *((void *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_totalLPASDuration = *((void *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_powerConsumedInSelfManagedLPASMode = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_powerConsumptionDueToMac = *((void *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10000) == 0)
  {
LABEL_12:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_powerConsumptionDueToRF = *((void *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100000) == 0)
  {
LABEL_13:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_powerConsumptionDueToUserScan = *((void *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000) == 0)
  {
LABEL_14:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_powerConsumptionDueToRoamScan = *((void *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000) == 0)
  {
LABEL_15:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_powerConsumptionDueToAssocScan = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x2000) == 0)
  {
LABEL_16:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_powerConsumptionDueToEPNOScan = *((void *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80000) == 0)
  {
LABEL_17:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_powerConsumptionDueToTx = *((void *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40000) == 0)
  {
LABEL_18:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_powerConsumptionDueToRx = *((void *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000) == 0)
  {
LABEL_19:
    if ((v3 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_powerConsumptionDueToFRTS = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800) == 0)
  {
LABEL_20:
    if ((v3 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_powerConsumptionDueToAWDLTx = *((void *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400) == 0)
  {
LABEL_21:
    if ((v3 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_powerConsumptionDueToAWDLRx = *((void *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 4) == 0)
  {
LABEL_22:
    if ((v3 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_beaconReceivedInLpas = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10) == 0)
  {
LABEL_23:
    if ((v3 & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_beaconsMissedInLpas = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 8) == 0)
  {
LABEL_24:
    if ((v3 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_beaconsEarlyTerminatedInLpas = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20) == 0)
  {
LABEL_25:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_beaconsScheduledInLpas = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_totalLpasPowerBudget = *((void *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40) == 0)
  {
LABEL_27:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_lpasPowerBudgetRemaining = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_totalLpasPowerMonitoringPeriod = *((void *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80) == 0)
  {
LABEL_29:
    if ((v3 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_lpasPowerPeriodRemaining = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 2) == 0)
  {
LABEL_30:
    if ((v3 & 0x10000000) == 0) {
      return;
    }
LABEL_61:
    self->_totalTimeForBugetExpiry = *((void *)a3 + 29);
    *(_DWORD *)&self->_has |= 0x10000000u;
    return;
  }
LABEL_60:
  self->_associatedSleepDuration = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 62) & 0x10000000) != 0) {
    goto LABEL_61;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)associatedDuration
{
  return self->_associatedDuration;
}

- (unint64_t)sleepDuration
{
  return self->_sleepDuration;
}

- (unint64_t)roamDuration
{
  return self->_roamDuration;
}

- (unint64_t)phyOffDuration
{
  return self->_phyOffDuration;
}

- (unint64_t)transmitDuration
{
  return self->_transmitDuration;
}

- (unint64_t)receiveDuration
{
  return self->_receiveDuration;
}

- (unint64_t)totalLPASDuration
{
  return self->_totalLPASDuration;
}

- (unint64_t)powerConsumedInSelfManagedLPASMode
{
  return self->_powerConsumedInSelfManagedLPASMode;
}

- (unint64_t)powerConsumptionDueToMac
{
  return self->_powerConsumptionDueToMac;
}

- (unint64_t)powerConsumptionDueToRF
{
  return self->_powerConsumptionDueToRF;
}

- (unint64_t)powerConsumptionDueToUserScan
{
  return self->_powerConsumptionDueToUserScan;
}

- (unint64_t)powerConsumptionDueToRoamScan
{
  return self->_powerConsumptionDueToRoamScan;
}

- (unint64_t)powerConsumptionDueToAssocScan
{
  return self->_powerConsumptionDueToAssocScan;
}

- (unint64_t)powerConsumptionDueToEPNOScan
{
  return self->_powerConsumptionDueToEPNOScan;
}

- (unint64_t)powerConsumptionDueToTx
{
  return self->_powerConsumptionDueToTx;
}

- (unint64_t)powerConsumptionDueToRx
{
  return self->_powerConsumptionDueToRx;
}

- (unint64_t)powerConsumptionDueToFRTS
{
  return self->_powerConsumptionDueToFRTS;
}

- (unint64_t)powerConsumptionDueToAWDLTx
{
  return self->_powerConsumptionDueToAWDLTx;
}

- (unint64_t)powerConsumptionDueToAWDLRx
{
  return self->_powerConsumptionDueToAWDLRx;
}

- (unint64_t)beaconReceivedInLpas
{
  return self->_beaconReceivedInLpas;
}

- (unint64_t)beaconsMissedInLpas
{
  return self->_beaconsMissedInLpas;
}

- (unint64_t)beaconsEarlyTerminatedInLpas
{
  return self->_beaconsEarlyTerminatedInLpas;
}

- (unint64_t)beaconsScheduledInLpas
{
  return self->_beaconsScheduledInLpas;
}

- (unint64_t)totalLpasPowerBudget
{
  return self->_totalLpasPowerBudget;
}

- (unint64_t)lpasPowerBudgetRemaining
{
  return self->_lpasPowerBudgetRemaining;
}

- (unint64_t)totalLpasPowerMonitoringPeriod
{
  return self->_totalLpasPowerMonitoringPeriod;
}

- (unint64_t)lpasPowerPeriodRemaining
{
  return self->_lpasPowerPeriodRemaining;
}

- (unint64_t)associatedSleepDuration
{
  return self->_associatedSleepDuration;
}

- (unint64_t)totalTimeForBugetExpiry
{
  return self->_totalTimeForBugetExpiry;
}

@end