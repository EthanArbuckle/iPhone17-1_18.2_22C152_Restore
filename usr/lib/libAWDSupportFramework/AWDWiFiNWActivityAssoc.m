@interface AWDWiFiNWActivityAssoc
- (BOOL)hasAssocDoneFailed;
- (BOOL)hasAssocDoneSuccess;
- (BOOL)hasAssocFailed;
- (BOOL)hasAssocReady;
- (BOOL)hasAssocSuccess;
- (BOOL)hasAuthFailed;
- (BOOL)hasAuthSuccess;
- (BOOL)hasBssDisallowEvent;
- (BOOL)hasBssidChanged;
- (BOOL)hasChanSwitchEvent;
- (BOOL)hasCrashTracerTrig;
- (BOOL)hasDeauthReceived;
- (BOOL)hasDecryptError;
- (BOOL)hasDisassocReceived;
- (BOOL)hasDpsSymptom;
- (BOOL)hasEscoTrafficInd;
- (BOOL)hasHomeChanQualChanged;
- (BOOL)hasLinkChanged;
- (BOOL)hasMacAddrChanged;
- (BOOL)hasPruned;
- (BOOL)hasRc1Stats;
- (BOOL)hasRc2Stats;
- (BOOL)hasReassocFailed;
- (BOOL)hasReassocSuccess;
- (BOOL)hasRoamFailed;
- (BOOL)hasRoamPrep;
- (BOOL)hasRoamScanEnd;
- (BOOL)hasRoamScanStart;
- (BOOL)hasRoamSuccess;
- (BOOL)hasRssiChanged;
- (BOOL)hasScanDone;
- (BOOL)hasScanInternalDone;
- (BOOL)hasScanResults;
- (BOOL)hasScanSummary;
- (BOOL)hasSlowWiFiSymptom;
- (BOOL)hasSsidChanged;
- (BOOL)hasSupplicant;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)assocDoneFailed;
- (unsigned)assocDoneSuccess;
- (unsigned)assocFailed;
- (unsigned)assocReady;
- (unsigned)assocSuccess;
- (unsigned)authFailed;
- (unsigned)authSuccess;
- (unsigned)bssDisallowEvent;
- (unsigned)bssidChanged;
- (unsigned)chanSwitchEvent;
- (unsigned)crashTracerTrig;
- (unsigned)deauthReceived;
- (unsigned)decryptError;
- (unsigned)disassocReceived;
- (unsigned)dpsSymptom;
- (unsigned)escoTrafficInd;
- (unsigned)homeChanQualChanged;
- (unsigned)linkChanged;
- (unsigned)macAddrChanged;
- (unsigned)pruned;
- (unsigned)rc1Stats;
- (unsigned)rc2Stats;
- (unsigned)reassocFailed;
- (unsigned)reassocSuccess;
- (unsigned)roamFailed;
- (unsigned)roamPrep;
- (unsigned)roamScanEnd;
- (unsigned)roamScanStart;
- (unsigned)roamSuccess;
- (unsigned)rssiChanged;
- (unsigned)scanDone;
- (unsigned)scanInternalDone;
- (unsigned)scanResults;
- (unsigned)scanSummary;
- (unsigned)slowWiFiSymptom;
- (unsigned)ssidChanged;
- (unsigned)supplicant;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssocDoneFailed:(unsigned int)a3;
- (void)setAssocDoneSuccess:(unsigned int)a3;
- (void)setAssocFailed:(unsigned int)a3;
- (void)setAssocReady:(unsigned int)a3;
- (void)setAssocSuccess:(unsigned int)a3;
- (void)setAuthFailed:(unsigned int)a3;
- (void)setAuthSuccess:(unsigned int)a3;
- (void)setBssDisallowEvent:(unsigned int)a3;
- (void)setBssidChanged:(unsigned int)a3;
- (void)setChanSwitchEvent:(unsigned int)a3;
- (void)setCrashTracerTrig:(unsigned int)a3;
- (void)setDeauthReceived:(unsigned int)a3;
- (void)setDecryptError:(unsigned int)a3;
- (void)setDisassocReceived:(unsigned int)a3;
- (void)setDpsSymptom:(unsigned int)a3;
- (void)setEscoTrafficInd:(unsigned int)a3;
- (void)setHasAssocDoneFailed:(BOOL)a3;
- (void)setHasAssocDoneSuccess:(BOOL)a3;
- (void)setHasAssocFailed:(BOOL)a3;
- (void)setHasAssocReady:(BOOL)a3;
- (void)setHasAssocSuccess:(BOOL)a3;
- (void)setHasAuthFailed:(BOOL)a3;
- (void)setHasAuthSuccess:(BOOL)a3;
- (void)setHasBssDisallowEvent:(BOOL)a3;
- (void)setHasBssidChanged:(BOOL)a3;
- (void)setHasChanSwitchEvent:(BOOL)a3;
- (void)setHasCrashTracerTrig:(BOOL)a3;
- (void)setHasDeauthReceived:(BOOL)a3;
- (void)setHasDecryptError:(BOOL)a3;
- (void)setHasDisassocReceived:(BOOL)a3;
- (void)setHasDpsSymptom:(BOOL)a3;
- (void)setHasEscoTrafficInd:(BOOL)a3;
- (void)setHasHomeChanQualChanged:(BOOL)a3;
- (void)setHasLinkChanged:(BOOL)a3;
- (void)setHasMacAddrChanged:(BOOL)a3;
- (void)setHasPruned:(BOOL)a3;
- (void)setHasRc1Stats:(BOOL)a3;
- (void)setHasRc2Stats:(BOOL)a3;
- (void)setHasReassocFailed:(BOOL)a3;
- (void)setHasReassocSuccess:(BOOL)a3;
- (void)setHasRoamFailed:(BOOL)a3;
- (void)setHasRoamPrep:(BOOL)a3;
- (void)setHasRoamScanEnd:(BOOL)a3;
- (void)setHasRoamScanStart:(BOOL)a3;
- (void)setHasRoamSuccess:(BOOL)a3;
- (void)setHasRssiChanged:(BOOL)a3;
- (void)setHasScanDone:(BOOL)a3;
- (void)setHasScanInternalDone:(BOOL)a3;
- (void)setHasScanResults:(BOOL)a3;
- (void)setHasScanSummary:(BOOL)a3;
- (void)setHasSlowWiFiSymptom:(BOOL)a3;
- (void)setHasSsidChanged:(BOOL)a3;
- (void)setHasSupplicant:(BOOL)a3;
- (void)setHomeChanQualChanged:(unsigned int)a3;
- (void)setLinkChanged:(unsigned int)a3;
- (void)setMacAddrChanged:(unsigned int)a3;
- (void)setPruned:(unsigned int)a3;
- (void)setRc1Stats:(unsigned int)a3;
- (void)setRc2Stats:(unsigned int)a3;
- (void)setReassocFailed:(unsigned int)a3;
- (void)setReassocSuccess:(unsigned int)a3;
- (void)setRoamFailed:(unsigned int)a3;
- (void)setRoamPrep:(unsigned int)a3;
- (void)setRoamScanEnd:(unsigned int)a3;
- (void)setRoamScanStart:(unsigned int)a3;
- (void)setRoamSuccess:(unsigned int)a3;
- (void)setRssiChanged:(unsigned int)a3;
- (void)setScanDone:(unsigned int)a3;
- (void)setScanInternalDone:(unsigned int)a3;
- (void)setScanResults:(unsigned int)a3;
- (void)setScanSummary:(unsigned int)a3;
- (void)setSlowWiFiSymptom:(unsigned int)a3;
- (void)setSsidChanged:(unsigned int)a3;
- (void)setSupplicant:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityAssoc

- (void)setAuthSuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_authSuccess = a3;
}

- (void)setHasAuthSuccess:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAuthSuccess
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAuthFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_authFailed = a3;
}

- (void)setHasAuthFailed:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAuthFailed
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAssocSuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_assocSuccess = a3;
}

- (void)setHasAssocSuccess:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAssocSuccess
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAssocFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_assocFailed = a3;
}

- (void)setHasAssocFailed:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAssocFailed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReassocSuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_reassocSuccess = a3;
}

- (void)setHasReassocSuccess:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasReassocSuccess
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setReassocFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_reassocFailed = a3;
}

- (void)setHasReassocFailed:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasReassocFailed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLinkChanged:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_linkChanged = a3;
}

- (void)setHasLinkChanged:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasLinkChanged
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoamSuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_roamSuccess = a3;
}

- (void)setHasRoamSuccess:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasRoamSuccess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setRoamFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_roamFailed = a3;
}

- (void)setHasRoamFailed:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasRoamFailed
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setAssocDoneSuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_assocDoneSuccess = a3;
}

- (void)setHasAssocDoneSuccess:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAssocDoneSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAssocDoneFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_assocDoneFailed = a3;
}

- (void)setHasAssocDoneFailed:(BOOL)a3
{
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAssocDoneFailed
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAssocReady:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_assocReady = a3;
}

- (void)setHasAssocReady:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAssocReady
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSsidChanged:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_ssidChanged = a3;
}

- (void)setHasSsidChanged:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSsidChanged
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setBssidChanged:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_bssidChanged = a3;
}

- (void)setHasBssidChanged:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasBssidChanged
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setDeauthReceived:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_deauthReceived = a3;
}

- (void)setHasDeauthReceived:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasDeauthReceived
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDisassocReceived:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_disassocReceived = a3;
}

- (void)setHasDisassocReceived:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDisassocReceived
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDecryptError:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_decryptError = a3;
}

- (void)setHasDecryptError:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDecryptError
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setPruned:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_pruned = a3;
}

- (void)setHasPruned:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasPruned
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSupplicant:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_supplicant = a3;
}

- (void)setHasSupplicant:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasSupplicant
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setMacAddrChanged:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_macAddrChanged = a3;
}

- (void)setHasMacAddrChanged:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMacAddrChanged
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRssiChanged:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_rssiChanged = a3;
}

- (void)setHasRssiChanged:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasRssiChanged
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHomeChanQualChanged:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_homeChanQualChanged = a3;
}

- (void)setHasHomeChanQualChanged:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasHomeChanQualChanged
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setChanSwitchEvent:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_chanSwitchEvent = a3;
}

- (void)setHasChanSwitchEvent:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasChanSwitchEvent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRoamPrep:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_roamPrep = a3;
}

- (void)setHasRoamPrep:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasRoamPrep
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setRoamScanStart:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_roamScanStart = a3;
}

- (void)setHasRoamScanStart:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRoamScanStart
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setRoamScanEnd:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_roamScanEnd = a3;
}

- (void)setHasRoamScanEnd:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRoamScanEnd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setScanResults:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_scanResults = a3;
}

- (void)setHasScanResults:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasScanResults
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setScanSummary:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_scanSummary = a3;
}

- (void)setHasScanSummary:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasScanSummary
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setScanDone:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_scanDone = a3;
}

- (void)setHasScanDone:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasScanDone
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setScanInternalDone:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_scanInternalDone = a3;
}

- (void)setHasScanInternalDone:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasScanInternalDone
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setBssDisallowEvent:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_bssDisallowEvent = a3;
}

- (void)setHasBssDisallowEvent:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasBssDisallowEvent
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSlowWiFiSymptom:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_slowWiFiSymptom = a3;
}

- (void)setHasSlowWiFiSymptom:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSlowWiFiSymptom
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setDpsSymptom:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_dpsSymptom = a3;
}

- (void)setHasDpsSymptom:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDpsSymptom
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCrashTracerTrig:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_crashTracerTrig = a3;
}

- (void)setHasCrashTracerTrig:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCrashTracerTrig
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRc1Stats:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_rc1Stats = a3;
}

- (void)setHasRc1Stats:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasRc1Stats
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRc2Stats:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_rc2Stats = a3;
}

- (void)setHasRc2Stats:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasRc2Stats
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setEscoTrafficInd:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_escoTrafficInd = a3;
}

- (void)setHasEscoTrafficInd:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($AFB9C266CFE0CD92D8803EB1297E3989)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasEscoTrafficInd
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityAssoc;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityAssoc description](&v3, sel_description), -[AWDWiFiNWActivityAssoc dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_authSuccess] forKey:@"authSuccess"];
    $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_authFailed] forKey:@"authFailed"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_assocSuccess] forKey:@"assocSuccess"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_assocFailed] forKey:@"assocFailed"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reassocSuccess] forKey:@"reassocSuccess"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reassocFailed] forKey:@"reassocFailed"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_linkChanged] forKey:@"linkChanged"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamSuccess] forKey:@"roamSuccess"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamFailed] forKey:@"roamFailed"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_assocDoneSuccess] forKey:@"assocDoneSuccess"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_assocDoneFailed] forKey:@"assocDoneFailed"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_assocReady] forKey:@"assocReady"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ssidChanged] forKey:@"ssidChanged"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bssidChanged] forKey:@"bssidChanged"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_deauthReceived] forKey:@"deauthReceived"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_disassocReceived] forKey:@"disassocReceived"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_decryptError] forKey:@"decryptError"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pruned] forKey:@"pruned"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_supplicant] forKey:@"supplicant"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_macAddrChanged] forKey:@"macAddrChanged"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rssiChanged] forKey:@"rssiChanged"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_homeChanQualChanged] forKey:@"homeChanQualChanged"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_chanSwitchEvent] forKey:@"chanSwitchEvent"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamPrep] forKey:@"roamPrep"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamScanStart] forKey:@"roamScanStart"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamScanEnd] forKey:@"roamScanEnd"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanResults] forKey:@"scanResults"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanSummary] forKey:@"scanSummary"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanDone] forKey:@"scanDone"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanInternalDone] forKey:@"scanInternalDone"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bssDisallowEvent] forKey:@"bssDisallowEvent"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_slowWiFiSymptom] forKey:@"slowWiFiSymptom"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_35;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dpsSymptom] forKey:@"dpsSymptom"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_crashTracerTrig] forKey:@"crashTracerTrig"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_37;
    }
LABEL_75:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc2Stats] forKey:@"rc2Stats"];
    if ((*(void *)&self->_has & 0x8000) == 0) {
      return v3;
    }
    goto LABEL_38;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rc1Stats] forKey:@"rc1Stats"];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0) {
    goto LABEL_75;
  }
LABEL_37:
  if ((*(_WORD *)&has & 0x8000) != 0) {
LABEL_38:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_escoTrafficInd] forKey:@"escoTrafficInd"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityAssocReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_35;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_37;
    }
LABEL_74:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_has & 0x8000) == 0) {
      return;
    }
    goto LABEL_75;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0) {
    goto LABEL_74;
  }
LABEL_37:
  if ((*(_WORD *)&has & 0x8000) == 0) {
    return;
  }
LABEL_75:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_authSuccess;
    *(void *)((char *)a3 + 156) |= 0x40uLL;
    $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_authFailed;
  *(void *)((char *)a3 + 156) |= 0x20uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 6) = self->_assocSuccess;
  *(void *)((char *)a3 + 156) |= 0x10uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 4) = self->_assocFailed;
  *(void *)((char *)a3 + 156) |= 4uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 25) = self->_reassocSuccess;
  *(void *)((char *)a3 + 156) |= 0x800000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 24) = self->_reassocFailed;
  *(void *)((char *)a3 + 156) |= 0x400000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 19) = self->_linkChanged;
  *(void *)((char *)a3 + 156) |= 0x20000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 30) = self->_roamSuccess;
  *(void *)((char *)a3 + 156) |= 0x10000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 26) = self->_roamFailed;
  *(void *)((char *)a3 + 156) |= 0x1000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 3) = self->_assocDoneSuccess;
  *(void *)((char *)a3 + 156) |= 2uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 2) = self->_assocDoneFailed;
  *(void *)((char *)a3 + 156) |= 1uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 5) = self->_assocReady;
  *(void *)((char *)a3 + 156) |= 8uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 37) = self->_ssidChanged;
  *(void *)((char *)a3 + 156) |= 0x800000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 10) = self->_bssidChanged;
  *(void *)((char *)a3 + 156) |= 0x100uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 13) = self->_deauthReceived;
  *(void *)((char *)a3 + 156) |= 0x800uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 15) = self->_disassocReceived;
  *(void *)((char *)a3 + 156) |= 0x2000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 14) = self->_decryptError;
  *(void *)((char *)a3 + 156) |= 0x1000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 21) = self->_pruned;
  *(void *)((char *)a3 + 156) |= 0x80000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 38) = self->_supplicant;
  *(void *)((char *)a3 + 156) |= 0x1000000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 20) = self->_macAddrChanged;
  *(void *)((char *)a3 + 156) |= 0x40000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 31) = self->_rssiChanged;
  *(void *)((char *)a3 + 156) |= 0x20000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 18) = self->_homeChanQualChanged;
  *(void *)((char *)a3 + 156) |= 0x10000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 11) = self->_chanSwitchEvent;
  *(void *)((char *)a3 + 156) |= 0x200uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 27) = self->_roamPrep;
  *(void *)((char *)a3 + 156) |= 0x2000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 29) = self->_roamScanStart;
  *(void *)((char *)a3 + 156) |= 0x8000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 28) = self->_roamScanEnd;
  *(void *)((char *)a3 + 156) |= 0x4000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 34) = self->_scanResults;
  *(void *)((char *)a3 + 156) |= 0x100000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 35) = self->_scanSummary;
  *(void *)((char *)a3 + 156) |= 0x200000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 32) = self->_scanDone;
  *(void *)((char *)a3 + 156) |= 0x40000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 33) = self->_scanInternalDone;
  *(void *)((char *)a3 + 156) |= 0x80000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)a3 + 9) = self->_bssDisallowEvent;
  *(void *)((char *)a3 + 156) |= 0x80uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)a3 + 36) = self->_slowWiFiSymptom;
  *(void *)((char *)a3 + 156) |= 0x400000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_35;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)a3 + 16) = self->_dpsSymptom;
  *(void *)((char *)a3 + 156) |= 0x4000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)a3 + 12) = self->_crashTracerTrig;
  *(void *)((char *)a3 + 156) |= 0x400uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 22) = self->_rc1Stats;
  *(void *)((char *)a3 + 156) |= 0x100000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      return;
    }
LABEL_75:
    *((_DWORD *)a3 + 17) = self->_escoTrafficInd;
    *(void *)((char *)a3 + 156) |= 0x8000uLL;
    return;
  }
LABEL_74:
  *((_DWORD *)a3 + 23) = self->_rc2Stats;
  *(void *)((char *)a3 + 156) |= 0x200000uLL;
  if ((*(void *)&self->_has & 0x8000) != 0) {
    goto LABEL_75;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    *((_DWORD *)result + 8) = self->_authSuccess;
    *(void *)((char *)result + 156) |= 0x40uLL;
    $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_authFailed;
  *(void *)((char *)result + 156) |= 0x20uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 6) = self->_assocSuccess;
  *(void *)((char *)result + 156) |= 0x10uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 4) = self->_assocFailed;
  *(void *)((char *)result + 156) |= 4uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 25) = self->_reassocSuccess;
  *(void *)((char *)result + 156) |= 0x800000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 24) = self->_reassocFailed;
  *(void *)((char *)result + 156) |= 0x400000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 19) = self->_linkChanged;
  *(void *)((char *)result + 156) |= 0x20000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 30) = self->_roamSuccess;
  *(void *)((char *)result + 156) |= 0x10000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 26) = self->_roamFailed;
  *(void *)((char *)result + 156) |= 0x1000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 3) = self->_assocDoneSuccess;
  *(void *)((char *)result + 156) |= 2uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 2) = self->_assocDoneFailed;
  *(void *)((char *)result + 156) |= 1uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 5) = self->_assocReady;
  *(void *)((char *)result + 156) |= 8uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 37) = self->_ssidChanged;
  *(void *)((char *)result + 156) |= 0x800000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 10) = self->_bssidChanged;
  *(void *)((char *)result + 156) |= 0x100uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 13) = self->_deauthReceived;
  *(void *)((char *)result + 156) |= 0x800uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 15) = self->_disassocReceived;
  *(void *)((char *)result + 156) |= 0x2000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)result + 14) = self->_decryptError;
  *(void *)((char *)result + 156) |= 0x1000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)result + 21) = self->_pruned;
  *(void *)((char *)result + 156) |= 0x80000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)result + 38) = self->_supplicant;
  *(void *)((char *)result + 156) |= 0x1000000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)result + 20) = self->_macAddrChanged;
  *(void *)((char *)result + 156) |= 0x40000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)result + 31) = self->_rssiChanged;
  *(void *)((char *)result + 156) |= 0x20000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)result + 18) = self->_homeChanQualChanged;
  *(void *)((char *)result + 156) |= 0x10000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)result + 11) = self->_chanSwitchEvent;
  *(void *)((char *)result + 156) |= 0x200uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)result + 27) = self->_roamPrep;
  *(void *)((char *)result + 156) |= 0x2000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)result + 29) = self->_roamScanStart;
  *(void *)((char *)result + 156) |= 0x8000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)result + 28) = self->_roamScanEnd;
  *(void *)((char *)result + 156) |= 0x4000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)result + 34) = self->_scanResults;
  *(void *)((char *)result + 156) |= 0x100000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)result + 35) = self->_scanSummary;
  *(void *)((char *)result + 156) |= 0x200000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)result + 32) = self->_scanDone;
  *(void *)((char *)result + 156) |= 0x40000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)result + 33) = self->_scanInternalDone;
  *(void *)((char *)result + 156) |= 0x80000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)result + 9) = self->_bssDisallowEvent;
  *(void *)((char *)result + 156) |= 0x80uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)result + 36) = self->_slowWiFiSymptom;
  *(void *)((char *)result + 156) |= 0x400000000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_35;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)result + 16) = self->_dpsSymptom;
  *(void *)((char *)result + 156) |= 0x4000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)result + 12) = self->_crashTracerTrig;
  *(void *)((char *)result + 156) |= 0x400uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)result + 22) = self->_rc1Stats;
  *(void *)((char *)result + 156) |= 0x100000uLL;
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      return result;
    }
    goto LABEL_38;
  }
LABEL_75:
  *((_DWORD *)result + 23) = self->_rc2Stats;
  *(void *)((char *)result + 156) |= 0x200000uLL;
  if ((*(void *)&self->_has & 0x8000) == 0) {
    return result;
  }
LABEL_38:
  *((_DWORD *)result + 17) = self->_escoTrafficInd;
  *(void *)((char *)result + 156) |= 0x8000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
    uint64_t v7 = *(void *)((char *)a3 + 156);
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_authSuccess != *((_DWORD *)a3 + 8)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
LABEL_186:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_authFailed != *((_DWORD *)a3 + 7)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_186;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_assocSuccess != *((_DWORD *)a3 + 6)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_186;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_assocFailed != *((_DWORD *)a3 + 4)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_reassocSuccess != *((_DWORD *)a3 + 25)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_reassocFailed != *((_DWORD *)a3 + 24)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_linkChanged != *((_DWORD *)a3 + 19)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_roamSuccess != *((_DWORD *)a3 + 30)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_roamFailed != *((_DWORD *)a3 + 26)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_assocDoneSuccess != *((_DWORD *)a3 + 3)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_186;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_assocDoneFailed != *((_DWORD *)a3 + 2)) {
        goto LABEL_186;
      }
    }
    else if (v7)
    {
      goto LABEL_186;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_assocReady != *((_DWORD *)a3 + 5)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_186;
    }
    if ((*(void *)&has & 0x800000000) != 0)
    {
      if ((v7 & 0x800000000) == 0 || self->_ssidChanged != *((_DWORD *)a3 + 37)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x800000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_bssidChanged != *((_DWORD *)a3 + 10)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_deauthReceived != *((_DWORD *)a3 + 13)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_disassocReceived != *((_DWORD *)a3 + 15)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_decryptError != *((_DWORD *)a3 + 14)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_pruned != *((_DWORD *)a3 + 21)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(void *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_supplicant != *((_DWORD *)a3 + 38)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x1000000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_macAddrChanged != *((_DWORD *)a3 + 20)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_rssiChanged != *((_DWORD *)a3 + 31)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_homeChanQualChanged != *((_DWORD *)a3 + 18)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_chanSwitchEvent != *((_DWORD *)a3 + 11)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_roamPrep != *((_DWORD *)a3 + 27)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_roamScanStart != *((_DWORD *)a3 + 29)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_roamScanEnd != *((_DWORD *)a3 + 28)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(void *)&has & 0x100000000) != 0)
    {
      if ((v7 & 0x100000000) == 0 || self->_scanResults != *((_DWORD *)a3 + 34)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x100000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(void *)&has & 0x200000000) != 0)
    {
      if ((v7 & 0x200000000) == 0 || self->_scanSummary != *((_DWORD *)a3 + 35)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x200000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_scanDone != *((_DWORD *)a3 + 32)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_scanInternalDone != *((_DWORD *)a3 + 33)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x80000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_bssDisallowEvent != *((_DWORD *)a3 + 9)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_186;
    }
    if ((*(void *)&has & 0x400000000) != 0)
    {
      if ((v7 & 0x400000000) == 0 || self->_slowWiFiSymptom != *((_DWORD *)a3 + 36)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x400000000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_dpsSymptom != *((_DWORD *)a3 + 16)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_crashTracerTrig != *((_DWORD *)a3 + 12)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_rc1Stats != *((_DWORD *)a3 + 22)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_186;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_rc2Stats != *((_DWORD *)a3 + 23)) {
        goto LABEL_186;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_186;
    }
    LOBYTE(v5) = (*(void *)((unsigned char *)a3 + 156) & 0x8000) == 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_escoTrafficInd != *((_DWORD *)a3 + 17)) {
        goto LABEL_186;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $AFB9C266CFE0CD92D8803EB1297E3989 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    uint64_t v40 = 2654435761 * self->_authSuccess;
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v39 = 2654435761 * self->_authFailed;
      if ((*(unsigned char *)&has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v39 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v38 = 2654435761 * self->_assocSuccess;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v38 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    uint64_t v37 = 2654435761 * self->_assocFailed;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_6:
    uint64_t v36 = 2654435761 * self->_reassocSuccess;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_7:
    uint64_t v35 = 2654435761 * self->_reassocFailed;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_8:
    uint64_t v34 = 2654435761 * self->_linkChanged;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_9:
    uint64_t v33 = 2654435761 * self->_roamSuccess;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_10:
    uint64_t v32 = 2654435761 * self->_roamFailed;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v32 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_11:
    uint64_t v31 = 2654435761 * self->_assocDoneSuccess;
    if (*(unsigned char *)&has) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v31 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_12:
    uint64_t v30 = 2654435761 * self->_assocDoneFailed;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v30 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_13:
    uint64_t v3 = 2654435761 * self->_assocReady;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v3 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_14:
    uint64_t v4 = 2654435761 * self->_ssidChanged;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    uint64_t v5 = 2654435761 * self->_bssidChanged;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    uint64_t v6 = 2654435761 * self->_deauthReceived;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_17:
    uint64_t v7 = 2654435761 * self->_disassocReceived;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    uint64_t v8 = 2654435761 * self->_decryptError;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_19:
    uint64_t v9 = 2654435761 * self->_pruned;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v9 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_20:
    uint64_t v10 = 2654435761 * self->_supplicant;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_21:
    uint64_t v11 = 2654435761 * self->_macAddrChanged;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_22:
    uint64_t v12 = 2654435761 * self->_rssiChanged;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_23:
    uint64_t v13 = 2654435761 * self->_homeChanQualChanged;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_24;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_24:
    uint64_t v14 = 2654435761 * self->_chanSwitchEvent;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_25:
    uint64_t v15 = 2654435761 * self->_roamPrep;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_26:
    uint64_t v16 = 2654435761 * self->_roamScanStart;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_27:
    uint64_t v17 = 2654435761 * self->_roamScanEnd;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v17 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_28:
    uint64_t v18 = 2654435761 * self->_scanResults;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v18 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_29:
    uint64_t v19 = 2654435761 * self->_scanSummary;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_30:
    uint64_t v20 = 2654435761 * self->_scanDone;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_31:
    uint64_t v21 = 2654435761 * self->_scanInternalDone;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_32;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_32:
    uint64_t v22 = 2654435761 * self->_bssDisallowEvent;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v22 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_33:
    uint64_t v23 = 2654435761 * self->_slowWiFiSymptom;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_34:
    uint64_t v24 = 2654435761 * self->_dpsSymptom;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_35;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_35:
    uint64_t v25 = 2654435761 * self->_crashTracerTrig;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_36:
    uint64_t v26 = 2654435761 * self->_rc1Stats;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_37;
    }
LABEL_74:
    uint64_t v27 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_38;
    }
LABEL_75:
    uint64_t v28 = 0;
    return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_73:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x200000) == 0) {
    goto LABEL_74;
  }
LABEL_37:
  uint64_t v27 = 2654435761 * self->_rc2Stats;
  if ((*(_WORD *)&has & 0x8000) == 0) {
    goto LABEL_75;
  }
LABEL_38:
  uint64_t v28 = 2654435761 * self->_escoTrafficInd;
  return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x40) != 0)
  {
    self->_authSuccess = *((_DWORD *)a3 + 8);
    *(void *)&self->_has |= 0x40uLL;
    uint64_t v3 = *(void *)((char *)a3 + 156);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_authFailed = *((_DWORD *)a3 + 7);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_assocSuccess = *((_DWORD *)a3 + 6);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_assocFailed = *((_DWORD *)a3 + 4);
  *(void *)&self->_has |= 4uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x800000) == 0)
  {
LABEL_6:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_reassocSuccess = *((_DWORD *)a3 + 25);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x400000) == 0)
  {
LABEL_7:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_reassocFailed = *((_DWORD *)a3 + 24);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x20000) == 0)
  {
LABEL_8:
    if ((v3 & 0x10000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_linkChanged = *((_DWORD *)a3 + 19);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_9:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_roamSuccess = *((_DWORD *)a3 + 30);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_roamFailed = *((_DWORD *)a3 + 26);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_assocDoneSuccess = *((_DWORD *)a3 + 3);
  *(void *)&self->_has |= 2uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 1) == 0)
  {
LABEL_12:
    if ((v3 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_assocDoneFailed = *((_DWORD *)a3 + 2);
  *(void *)&self->_has |= 1uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 8) == 0)
  {
LABEL_13:
    if ((v3 & 0x800000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_assocReady = *((_DWORD *)a3 + 5);
  *(void *)&self->_has |= 8uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_14:
    if ((v3 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_ssidChanged = *((_DWORD *)a3 + 37);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x100) == 0)
  {
LABEL_15:
    if ((v3 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_bssidChanged = *((_DWORD *)a3 + 10);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x800) == 0)
  {
LABEL_16:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_deauthReceived = *((_DWORD *)a3 + 13);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x2000) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_disassocReceived = *((_DWORD *)a3 + 15);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x1000) == 0)
  {
LABEL_18:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_decryptError = *((_DWORD *)a3 + 14);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x80000) == 0)
  {
LABEL_19:
    if ((v3 & 0x1000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_pruned = *((_DWORD *)a3 + 21);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_supplicant = *((_DWORD *)a3 + 38);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x40000) == 0)
  {
LABEL_21:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_macAddrChanged = *((_DWORD *)a3 + 20);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_22:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_rssiChanged = *((_DWORD *)a3 + 31);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x10000) == 0)
  {
LABEL_23:
    if ((v3 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_homeChanQualChanged = *((_DWORD *)a3 + 18);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x200) == 0)
  {
LABEL_24:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_chanSwitchEvent = *((_DWORD *)a3 + 11);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_roamPrep = *((_DWORD *)a3 + 27);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_roamScanStart = *((_DWORD *)a3 + 29);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_roamScanEnd = *((_DWORD *)a3 + 28);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_scanResults = *((_DWORD *)a3 + 34);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_scanSummary = *((_DWORD *)a3 + 35);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_scanDone = *((_DWORD *)a3 + 32);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_scanInternalDone = *((_DWORD *)a3 + 33);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x80) == 0)
  {
LABEL_32:
    if ((v3 & 0x400000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_bssDisallowEvent = *((_DWORD *)a3 + 9);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_33:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_slowWiFiSymptom = *((_DWORD *)a3 + 36);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x4000) == 0)
  {
LABEL_34:
    if ((v3 & 0x400) == 0) {
      goto LABEL_35;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_dpsSymptom = *((_DWORD *)a3 + 16);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x400) == 0)
  {
LABEL_35:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_crashTracerTrig = *((_DWORD *)a3 + 12);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x100000) == 0)
  {
LABEL_36:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_rc1Stats = *((_DWORD *)a3 + 22);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 156);
  if ((v3 & 0x200000) == 0)
  {
LABEL_37:
    if ((v3 & 0x8000) == 0) {
      return;
    }
LABEL_75:
    self->_escoTrafficInd = *((_DWORD *)a3 + 17);
    *(void *)&self->_has |= 0x8000uLL;
    return;
  }
LABEL_74:
  self->_rc2Stats = *((_DWORD *)a3 + 23);
  *(void *)&self->_has |= 0x200000uLL;
  if ((*(void *)((unsigned char *)a3 + 156) & 0x8000) != 0) {
    goto LABEL_75;
  }
}

- (unsigned)authSuccess
{
  return self->_authSuccess;
}

- (unsigned)authFailed
{
  return self->_authFailed;
}

- (unsigned)assocSuccess
{
  return self->_assocSuccess;
}

- (unsigned)assocFailed
{
  return self->_assocFailed;
}

- (unsigned)reassocSuccess
{
  return self->_reassocSuccess;
}

- (unsigned)reassocFailed
{
  return self->_reassocFailed;
}

- (unsigned)linkChanged
{
  return self->_linkChanged;
}

- (unsigned)roamSuccess
{
  return self->_roamSuccess;
}

- (unsigned)roamFailed
{
  return self->_roamFailed;
}

- (unsigned)assocDoneSuccess
{
  return self->_assocDoneSuccess;
}

- (unsigned)assocDoneFailed
{
  return self->_assocDoneFailed;
}

- (unsigned)assocReady
{
  return self->_assocReady;
}

- (unsigned)ssidChanged
{
  return self->_ssidChanged;
}

- (unsigned)bssidChanged
{
  return self->_bssidChanged;
}

- (unsigned)deauthReceived
{
  return self->_deauthReceived;
}

- (unsigned)disassocReceived
{
  return self->_disassocReceived;
}

- (unsigned)decryptError
{
  return self->_decryptError;
}

- (unsigned)pruned
{
  return self->_pruned;
}

- (unsigned)supplicant
{
  return self->_supplicant;
}

- (unsigned)macAddrChanged
{
  return self->_macAddrChanged;
}

- (unsigned)rssiChanged
{
  return self->_rssiChanged;
}

- (unsigned)homeChanQualChanged
{
  return self->_homeChanQualChanged;
}

- (unsigned)chanSwitchEvent
{
  return self->_chanSwitchEvent;
}

- (unsigned)roamPrep
{
  return self->_roamPrep;
}

- (unsigned)roamScanStart
{
  return self->_roamScanStart;
}

- (unsigned)roamScanEnd
{
  return self->_roamScanEnd;
}

- (unsigned)scanResults
{
  return self->_scanResults;
}

- (unsigned)scanSummary
{
  return self->_scanSummary;
}

- (unsigned)scanDone
{
  return self->_scanDone;
}

- (unsigned)scanInternalDone
{
  return self->_scanInternalDone;
}

- (unsigned)bssDisallowEvent
{
  return self->_bssDisallowEvent;
}

- (unsigned)slowWiFiSymptom
{
  return self->_slowWiFiSymptom;
}

- (unsigned)dpsSymptom
{
  return self->_dpsSymptom;
}

- (unsigned)crashTracerTrig
{
  return self->_crashTracerTrig;
}

- (unsigned)rc1Stats
{
  return self->_rc1Stats;
}

- (unsigned)rc2Stats
{
  return self->_rc2Stats;
}

- (unsigned)escoTrafficInd
{
  return self->_escoTrafficInd;
}

@end