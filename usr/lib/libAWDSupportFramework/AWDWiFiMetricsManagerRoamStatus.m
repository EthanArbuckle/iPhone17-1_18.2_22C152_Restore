@interface AWDWiFiMetricsManagerRoamStatus
- (BOOL)hasAssociatedDur;
- (BOOL)hasCcaInt;
- (BOOL)hasCcaOthers;
- (BOOL)hasCcaSelf;
- (BOOL)hasCcaTotal;
- (BOOL)hasFlags;
- (BOOL)hasHostReason;
- (BOOL)hasLateRoam;
- (BOOL)hasLatency;
- (BOOL)hasMotionState;
- (BOOL)hasOffChannelDt;
- (BOOL)hasOriginAKMs;
- (BOOL)hasOriginBcnPer;
- (BOOL)hasOriginChannel;
- (BOOL)hasOriginEnhancedSecurityType;
- (BOOL)hasOriginFwTxPer;
- (BOOL)hasOriginOui;
- (BOOL)hasOriginPhyMode;
- (BOOL)hasOriginRssi;
- (BOOL)hasOriginTxPer;
- (BOOL)hasProfileType;
- (BOOL)hasReason;
- (BOOL)hasRoamScanDuration;
- (BOOL)hasSecurityType;
- (BOOL)hasStatus;
- (BOOL)hasTargetAKMs;
- (BOOL)hasTargetChannel;
- (BOOL)hasTargetEnhancedSecurityType;
- (BOOL)hasTargetOui;
- (BOOL)hasTargetPhyMode;
- (BOOL)hasTargetRssi;
- (BOOL)hasTimestamp;
- (BOOL)hasVoipActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)lateRoam;
- (BOOL)readFrom:(id)a3;
- (BOOL)voipActive;
- (NSData)originOui;
- (NSData)targetOui;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originRssi;
- (int)targetRssi;
- (unint64_t)associatedDur;
- (unint64_t)hash;
- (unint64_t)originBcnPer;
- (unint64_t)originFwTxPer;
- (unint64_t)originTxPer;
- (unint64_t)timestamp;
- (unsigned)ccaInt;
- (unsigned)ccaOthers;
- (unsigned)ccaSelf;
- (unsigned)ccaTotal;
- (unsigned)flags;
- (unsigned)hostReason;
- (unsigned)latency;
- (unsigned)motionState;
- (unsigned)offChannelDt;
- (unsigned)originAKMs;
- (unsigned)originChannel;
- (unsigned)originEnhancedSecurityType;
- (unsigned)originPhyMode;
- (unsigned)profileType;
- (unsigned)reason;
- (unsigned)roamScanDuration;
- (unsigned)securityType;
- (unsigned)status;
- (unsigned)targetAKMs;
- (unsigned)targetChannel;
- (unsigned)targetEnhancedSecurityType;
- (unsigned)targetPhyMode;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedDur:(unint64_t)a3;
- (void)setCcaInt:(unsigned int)a3;
- (void)setCcaOthers:(unsigned int)a3;
- (void)setCcaSelf:(unsigned int)a3;
- (void)setCcaTotal:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHasAssociatedDur:(BOOL)a3;
- (void)setHasCcaInt:(BOOL)a3;
- (void)setHasCcaOthers:(BOOL)a3;
- (void)setHasCcaSelf:(BOOL)a3;
- (void)setHasCcaTotal:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasHostReason:(BOOL)a3;
- (void)setHasLateRoam:(BOOL)a3;
- (void)setHasLatency:(BOOL)a3;
- (void)setHasMotionState:(BOOL)a3;
- (void)setHasOffChannelDt:(BOOL)a3;
- (void)setHasOriginAKMs:(BOOL)a3;
- (void)setHasOriginBcnPer:(BOOL)a3;
- (void)setHasOriginChannel:(BOOL)a3;
- (void)setHasOriginEnhancedSecurityType:(BOOL)a3;
- (void)setHasOriginFwTxPer:(BOOL)a3;
- (void)setHasOriginPhyMode:(BOOL)a3;
- (void)setHasOriginRssi:(BOOL)a3;
- (void)setHasOriginTxPer:(BOOL)a3;
- (void)setHasProfileType:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasRoamScanDuration:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTargetAKMs:(BOOL)a3;
- (void)setHasTargetChannel:(BOOL)a3;
- (void)setHasTargetEnhancedSecurityType:(BOOL)a3;
- (void)setHasTargetPhyMode:(BOOL)a3;
- (void)setHasTargetRssi:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVoipActive:(BOOL)a3;
- (void)setHostReason:(unsigned int)a3;
- (void)setLateRoam:(BOOL)a3;
- (void)setLatency:(unsigned int)a3;
- (void)setMotionState:(unsigned int)a3;
- (void)setOffChannelDt:(unsigned int)a3;
- (void)setOriginAKMs:(unsigned int)a3;
- (void)setOriginBcnPer:(unint64_t)a3;
- (void)setOriginChannel:(unsigned int)a3;
- (void)setOriginEnhancedSecurityType:(unsigned int)a3;
- (void)setOriginFwTxPer:(unint64_t)a3;
- (void)setOriginOui:(id)a3;
- (void)setOriginPhyMode:(unsigned int)a3;
- (void)setOriginRssi:(int)a3;
- (void)setOriginTxPer:(unint64_t)a3;
- (void)setProfileType:(unsigned int)a3;
- (void)setReason:(unsigned int)a3;
- (void)setRoamScanDuration:(unsigned int)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setTargetAKMs:(unsigned int)a3;
- (void)setTargetChannel:(unsigned int)a3;
- (void)setTargetEnhancedSecurityType:(unsigned int)a3;
- (void)setTargetOui:(id)a3;
- (void)setTargetPhyMode:(unsigned int)a3;
- (void)setTargetRssi:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVoipActive:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerRoamStatus

- (void)dealloc
{
  [(AWDWiFiMetricsManagerRoamStatus *)self setOriginOui:0];
  [(AWDWiFiMetricsManagerRoamStatus *)self setTargetOui:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRoamStatus;
  [(AWDWiFiMetricsManagerRoamStatus *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setProfileType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_profileType = a3;
}

- (void)setHasProfileType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasProfileType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasStatus
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setOriginRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_originRssi = a3;
}

- (void)setHasOriginRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasOriginRssi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTargetRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_targetRssi = a3;
}

- (void)setHasTargetRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTargetRssi
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasOriginOui
{
  return self->_originOui != 0;
}

- (BOOL)hasTargetOui
{
  return self->_targetOui != 0;
}

- (void)setFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setOriginChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_originChannel = a3;
}

- (void)setHasOriginChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasOriginChannel
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTargetChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_targetChannel = a3;
}

- (void)setHasTargetChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTargetChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCcaTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_ccaTotal = a3;
}

- (void)setHasCcaTotal:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCcaTotal
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCcaSelf:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_ccaSelf = a3;
}

- (void)setHasCcaSelf:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCcaSelf
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCcaOthers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_ccaOthers = a3;
}

- (void)setHasCcaOthers:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCcaOthers
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCcaInt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_ccaInt = a3;
}

- (void)setHasCcaInt:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCcaInt
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setOriginTxPer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_originTxPer = a3;
}

- (void)setHasOriginTxPer:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasOriginTxPer
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOffChannelDt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_offChannelDt = a3;
}

- (void)setHasOffChannelDt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasOffChannelDt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRoamScanDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_roamScanDuration = a3;
}

- (void)setHasRoamScanDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRoamScanDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setAssociatedDur:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_associatedDur = a3;
}

- (void)setHasAssociatedDur:(BOOL)a3
{
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAssociatedDur
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHostReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hostReason = a3;
}

- (void)setHasHostReason:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHostReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMotionState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMotionState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setVoipActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_voipActive = a3;
}

- (void)setHasVoipActive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasVoipActive
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setLateRoam:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_lateRoam = a3;
}

- (void)setHasLateRoam:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasLateRoam
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setOriginBcnPer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_originBcnPer = a3;
}

- (void)setHasOriginBcnPer:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasOriginBcnPer
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOriginFwTxPer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_originFwTxPer = a3;
}

- (void)setHasOriginFwTxPer:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasOriginFwTxPer
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOriginEnhancedSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_originEnhancedSecurityType = a3;
}

- (void)setHasOriginEnhancedSecurityType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasOriginEnhancedSecurityType
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setTargetEnhancedSecurityType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_targetEnhancedSecurityType = a3;
}

- (void)setHasTargetEnhancedSecurityType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTargetEnhancedSecurityType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setOriginAKMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_originAKMs = a3;
}

- (void)setHasOriginAKMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasOriginAKMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTargetAKMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_targetAKMs = a3;
}

- (void)setHasTargetAKMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTargetAKMs
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setOriginPhyMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_originPhyMode = a3;
}

- (void)setHasOriginPhyMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasOriginPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTargetPhyMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_targetPhyMode = a3;
}

- (void)setHasTargetPhyMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3FBDB23C6C5F349EAF78C1AAF25ADCD2)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTargetPhyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRoamStatus;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerRoamStatus description](&v3, sel_description), -[AWDWiFiMetricsManagerRoamStatus dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_latency] forKey:@"latency"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_profileType] forKey:@"profileType"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_status] forKey:@"status"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_reason] forKey:@"reason"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithInt:self->_originRssi] forKey:@"originRssi"];
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_targetRssi] forKey:@"targetRssi"];
LABEL_10:
  originOui = self->_originOui;
  if (originOui) {
    [v3 setObject:originOui forKey:@"originOui"];
  }
  targetOui = self->_targetOui;
  if (targetOui) {
    [v3 setObject:targetOui forKey:@"targetOui"];
  }
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_flags] forKey:@"flags"];
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x8000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_originChannel] forKey:@"originChannel"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_targetChannel] forKey:@"targetChannel"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaTotal] forKey:@"ccaTotal"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaSelf] forKey:@"ccaSelf"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaOthers] forKey:@"ccaOthers"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaInt] forKey:@"ccaInt"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_originTxPer] forKey:@"originTxPer"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_offChannelDt] forKey:@"offChannelDt"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v7 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamScanDuration] forKey:@"roamScanDuration"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_associatedDur] forKey:@"associatedDur"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_hostReason] forKey:@"hostReason"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_motionState] forKey:@"motionState"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v7 & 0x20000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithBool:self->_voipActive] forKey:@"voipActive"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithBool:self->_lateRoam] forKey:@"lateRoam"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_originBcnPer] forKey:@"originBcnPer"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_originFwTxPer] forKey:@"originFwTxPer"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_originEnhancedSecurityType] forKey:@"originEnhancedSecurityType"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_targetEnhancedSecurityType] forKey:@"targetEnhancedSecurityType"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_originAKMs] forKey:@"originAKMs"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_36;
    }
LABEL_68:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_originPhyMode] forKey:@"originPhyMode"];
    if ((*(_DWORD *)&self->_has & 0x8000000) == 0) {
      return v3;
    }
    goto LABEL_37;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_targetAKMs] forKey:@"targetAKMs"];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) != 0) {
    goto LABEL_68;
  }
LABEL_36:
  if ((*(_DWORD *)&v7 & 0x8000000) != 0) {
LABEL_37:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_targetPhyMode] forKey:@"targetPhyMode"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerRoamStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_originOui) {
    PBDataWriterWriteDataField();
  }
  if (self->_targetOui) {
    PBDataWriterWriteDataField();
  }
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x8000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v5 & 0x2000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v5 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v5 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x40) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v5 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v5 & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v5 & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v5 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v5 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x20000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v5 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 2) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 4) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_36;
    }
LABEL_67:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 0x8000000) == 0) {
      return;
    }
    goto LABEL_68;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) != 0) {
    goto LABEL_67;
  }
LABEL_36:
  if ((*(_DWORD *)&v5 & 0x8000000) == 0) {
    return;
  }
LABEL_68:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((_DWORD *)a3 + 41) |= 0x10u;
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 18) = self->_latency;
  *((_DWORD *)a3 + 41) |= 0x800u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 28) = self->_profileType;
  *((_DWORD *)a3 + 41) |= 0x80000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 31) = self->_securityType;
  *((_DWORD *)a3 + 41) |= 0x400000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 32) = self->_status;
  *((_DWORD *)a3 + 41) |= 0x800000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 29) = self->_reason;
  *((_DWORD *)a3 + 41) |= 0x100000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_45:
  *((_DWORD *)a3 + 27) = self->_originRssi;
  *((_DWORD *)a3 + 41) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_9:
    *((_DWORD *)a3 + 39) = self->_targetRssi;
    *((_DWORD *)a3 + 41) |= 0x10000000u;
  }
LABEL_10:
  if (self->_originOui) {
    [a3 setOriginOui:];
  }
  if (self->_targetOui) {
    [a3 setTargetOui:];
  }
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_flags;
    *((_DWORD *)a3 + 41) |= 0x200u;
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x8000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x2000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 22) = self->_originChannel;
  *((_DWORD *)a3 + 41) |= 0x8000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 34) = self->_targetChannel;
  *((_DWORD *)a3 + 41) |= 0x2000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 15) = self->_ccaTotal;
  *((_DWORD *)a3 + 41) |= 0x100u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 14) = self->_ccaSelf;
  *((_DWORD *)a3 + 41) |= 0x80u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 13) = self->_ccaOthers;
  *((_DWORD *)a3 + 41) |= 0x40u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 12) = self->_ccaInt;
  *((_DWORD *)a3 + 41) |= 0x20u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 4) = self->_originTxPer;
  *((_DWORD *)a3 + 41) |= 8u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 20) = self->_offChannelDt;
  *((_DWORD *)a3 + 41) |= 0x2000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 30) = self->_roamScanDuration;
  *((_DWORD *)a3 + 41) |= 0x200000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 1) = self->_associatedDur;
  *((_DWORD *)a3 + 41) |= 1u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 17) = self->_hostReason;
  *((_DWORD *)a3 + 41) |= 0x400u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 19) = self->_motionState;
  *((_DWORD *)a3 + 41) |= 0x1000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((unsigned char *)a3 + 161) = self->_voipActive;
  *((_DWORD *)a3 + 41) |= 0x40000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((unsigned char *)a3 + 160) = self->_lateRoam;
  *((_DWORD *)a3 + 41) |= 0x20000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)a3 + 2) = self->_originBcnPer;
  *((_DWORD *)a3 + 41) |= 2u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 3) = self->_originFwTxPer;
  *((_DWORD *)a3 + 41) |= 4u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 23) = self->_originEnhancedSecurityType;
  *((_DWORD *)a3 + 41) |= 0x10000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 35) = self->_targetEnhancedSecurityType;
  *((_DWORD *)a3 + 41) |= 0x4000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 21) = self->_originAKMs;
  *((_DWORD *)a3 + 41) |= 0x4000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 33) = self->_targetAKMs;
  *((_DWORD *)a3 + 41) |= 0x1000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      return;
    }
    goto LABEL_37;
  }
LABEL_68:
  *((_DWORD *)a3 + 26) = self->_originPhyMode;
  *((_DWORD *)a3 + 41) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0) {
    return;
  }
LABEL_37:
  *((_DWORD *)a3 + 38) = self->_targetPhyMode;
  *((_DWORD *)a3 + 41) |= 0x8000000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(_DWORD *)(v5 + 164) |= 0x10u;
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_latency;
  *(_DWORD *)(v5 + 164) |= 0x800u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 112) = self->_profileType;
  *(_DWORD *)(v5 + 164) |= 0x80000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 124) = self->_securityType;
  *(_DWORD *)(v5 + 164) |= 0x400000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 128) = self->_status;
  *(_DWORD *)(v5 + 164) |= 0x800000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 116) = self->_reason;
  *(_DWORD *)(v5 + 164) |= 0x100000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_41:
  *(_DWORD *)(v5 + 108) = self->_originRssi;
  *(_DWORD *)(v5 + 164) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 156) = self->_targetRssi;
    *(_DWORD *)(v5 + 164) |= 0x10000000u;
  }
LABEL_10:

  *(void *)(v6 + 96) = [(NSData *)self->_originOui copyWithZone:a3];
  *(void *)(v6 + 144) = [(NSData *)self->_targetOui copyWithZone:a3];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_flags;
    *(_DWORD *)(v6 + 164) |= 0x200u;
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x8000) == 0)
    {
LABEL_12:
      if ((*(_DWORD *)&v8 & 0x2000000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 88) = self->_originChannel;
  *(_DWORD *)(v6 + 164) |= 0x8000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 136) = self->_targetChannel;
  *(_DWORD *)(v6 + 164) |= 0x2000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v8 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 60) = self->_ccaTotal;
  *(_DWORD *)(v6 + 164) |= 0x100u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 56) = self->_ccaSelf;
  *(_DWORD *)(v6 + 164) |= 0x80u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 52) = self->_ccaOthers;
  *(_DWORD *)(v6 + 164) |= 0x40u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 48) = self->_ccaInt;
  *(_DWORD *)(v6 + 164) |= 0x20u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(void *)(v6 + 32) = self->_originTxPer;
  *(_DWORD *)(v6 + 164) |= 8u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 80) = self->_offChannelDt;
  *(_DWORD *)(v6 + 164) |= 0x2000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v8 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 120) = self->_roamScanDuration;
  *(_DWORD *)(v6 + 164) |= 0x200000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 1) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(void *)(v6 + 8) = self->_associatedDur;
  *(_DWORD *)(v6 + 164) |= 1u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v6 + 68) = self->_hostReason;
  *(_DWORD *)(v6 + 164) |= 0x400u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x40000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v6 + 76) = self->_motionState;
  *(_DWORD *)(v6 + 164) |= 0x1000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v8 & 0x20000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(unsigned char *)(v6 + 161) = self->_voipActive;
  *(_DWORD *)(v6 + 164) |= 0x40000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v8 & 2) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(unsigned char *)(v6 + 160) = self->_lateRoam;
  *(_DWORD *)(v6 + 164) |= 0x20000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 2) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(void *)(v6 + 16) = self->_originBcnPer;
  *(_DWORD *)(v6 + 164) |= 2u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v8 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(void *)(v6 + 24) = self->_originFwTxPer;
  *(_DWORD *)(v6 + 164) |= 4u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v8 & 0x4000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v6 + 92) = self->_originEnhancedSecurityType;
  *(_DWORD *)(v6 + 164) |= 0x10000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v8 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v6 + 140) = self->_targetEnhancedSecurityType;
  *(_DWORD *)(v6 + 164) |= 0x4000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v6 + 84) = self->_originAKMs;
  *(_DWORD *)(v6 + 164) |= 0x4000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_32;
    }
LABEL_64:
    *(_DWORD *)(v6 + 104) = self->_originPhyMode;
    *(_DWORD *)(v6 + 164) |= 0x20000u;
    if ((*(_DWORD *)&self->_has & 0x8000000) == 0) {
      return (id)v6;
    }
    goto LABEL_33;
  }
LABEL_63:
  *(_DWORD *)(v6 + 132) = self->_targetAKMs;
  *(_DWORD *)(v6 + 164) |= 0x1000000u;
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0) {
    goto LABEL_64;
  }
LABEL_32:
  if ((*(_DWORD *)&v8 & 0x8000000) != 0)
  {
LABEL_33:
    *(_DWORD *)(v6 + 152) = self->_targetPhyMode;
    *(_DWORD *)(v6 + 164) |= 0x8000000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
    int v7 = *((_DWORD *)a3 + 41);
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_latency != *((_DWORD *)a3 + 18)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_profileType != *((_DWORD *)a3 + 28)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_securityType != *((_DWORD *)a3 + 31)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_status != *((_DWORD *)a3 + 32)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_reason != *((_DWORD *)a3 + 29)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_originRssi != *((_DWORD *)a3 + 27)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_166;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_targetRssi != *((_DWORD *)a3 + 39)) {
        goto LABEL_166;
      }
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_166;
    }
    originOui = self->_originOui;
    if (!((unint64_t)originOui | *((void *)a3 + 12)) || (int v5 = -[NSData isEqual:](originOui, "isEqual:")) != 0)
    {
      targetOui = self->_targetOui;
      if (!((unint64_t)targetOui | *((void *)a3 + 18))
        || (int v5 = -[NSData isEqual:](targetOui, "isEqual:")) != 0)
      {
        $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v10 = self->_has;
        int v11 = *((_DWORD *)a3 + 41);
        if ((*(_WORD *)&v10 & 0x200) != 0)
        {
          if ((v11 & 0x200) == 0 || self->_flags != *((_DWORD *)a3 + 16)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x200) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x8000) != 0)
        {
          if ((v11 & 0x8000) == 0 || self->_originChannel != *((_DWORD *)a3 + 22)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x8000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x2000000) != 0)
        {
          if ((v11 & 0x2000000) == 0 || self->_targetChannel != *((_DWORD *)a3 + 34)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x2000000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x100) != 0)
        {
          if ((v11 & 0x100) == 0 || self->_ccaTotal != *((_DWORD *)a3 + 15)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x100) != 0)
        {
          goto LABEL_166;
        }
        if ((*(unsigned char *)&v10 & 0x80) != 0)
        {
          if ((v11 & 0x80) == 0 || self->_ccaSelf != *((_DWORD *)a3 + 14)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x80) != 0)
        {
          goto LABEL_166;
        }
        if ((*(unsigned char *)&v10 & 0x40) != 0)
        {
          if ((v11 & 0x40) == 0 || self->_ccaOthers != *((_DWORD *)a3 + 13)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x40) != 0)
        {
          goto LABEL_166;
        }
        if ((*(unsigned char *)&v10 & 0x20) != 0)
        {
          if ((v11 & 0x20) == 0 || self->_ccaInt != *((_DWORD *)a3 + 12)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x20) != 0)
        {
          goto LABEL_166;
        }
        if ((*(unsigned char *)&v10 & 8) != 0)
        {
          if ((v11 & 8) == 0 || self->_originTxPer != *((void *)a3 + 4)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 8) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x2000) != 0)
        {
          if ((v11 & 0x2000) == 0 || self->_offChannelDt != *((_DWORD *)a3 + 20)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x2000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x200000) != 0)
        {
          if ((v11 & 0x200000) == 0 || self->_roamScanDuration != *((_DWORD *)a3 + 30)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x200000) != 0)
        {
          goto LABEL_166;
        }
        if (*(unsigned char *)&v10)
        {
          if ((v11 & 1) == 0 || self->_associatedDur != *((void *)a3 + 1)) {
            goto LABEL_166;
          }
        }
        else if (v11)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x400) != 0)
        {
          if ((v11 & 0x400) == 0 || self->_hostReason != *((_DWORD *)a3 + 17)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x400) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_WORD *)&v10 & 0x1000) != 0)
        {
          if ((v11 & 0x1000) == 0 || self->_motionState != *((_DWORD *)a3 + 19)) {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x1000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x40000000) != 0)
        {
          if ((v11 & 0x40000000) == 0) {
            goto LABEL_166;
          }
          if (self->_voipActive)
          {
            if (!*((unsigned char *)a3 + 161)) {
              goto LABEL_166;
            }
          }
          else if (*((unsigned char *)a3 + 161))
          {
            goto LABEL_166;
          }
        }
        else if ((v11 & 0x40000000) != 0)
        {
          goto LABEL_166;
        }
        if ((*(_DWORD *)&v10 & 0x20000000) == 0)
        {
          if ((v11 & 0x20000000) != 0) {
            goto LABEL_166;
          }
          goto LABEL_127;
        }
        if ((v11 & 0x20000000) != 0)
        {
          if (self->_lateRoam)
          {
            if (!*((unsigned char *)a3 + 160)) {
              goto LABEL_166;
            }
            goto LABEL_127;
          }
          if (!*((unsigned char *)a3 + 160))
          {
LABEL_127:
            if ((*(unsigned char *)&v10 & 2) != 0)
            {
              if ((v11 & 2) == 0 || self->_originBcnPer != *((void *)a3 + 2)) {
                goto LABEL_166;
              }
            }
            else if ((v11 & 2) != 0)
            {
              goto LABEL_166;
            }
            if ((*(unsigned char *)&v10 & 4) != 0)
            {
              if ((v11 & 4) == 0 || self->_originFwTxPer != *((void *)a3 + 3)) {
                goto LABEL_166;
              }
            }
            else if ((v11 & 4) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x10000) != 0)
            {
              if ((v11 & 0x10000) == 0 || self->_originEnhancedSecurityType != *((_DWORD *)a3 + 23)) {
                goto LABEL_166;
              }
            }
            else if ((v11 & 0x10000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x4000000) != 0)
            {
              if ((v11 & 0x4000000) == 0 || self->_targetEnhancedSecurityType != *((_DWORD *)a3 + 35)) {
                goto LABEL_166;
              }
            }
            else if ((v11 & 0x4000000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_WORD *)&v10 & 0x4000) != 0)
            {
              if ((v11 & 0x4000) == 0 || self->_originAKMs != *((_DWORD *)a3 + 21)) {
                goto LABEL_166;
              }
            }
            else if ((v11 & 0x4000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x1000000) != 0)
            {
              if ((v11 & 0x1000000) == 0 || self->_targetAKMs != *((_DWORD *)a3 + 33)) {
                goto LABEL_166;
              }
            }
            else if ((v11 & 0x1000000) != 0)
            {
              goto LABEL_166;
            }
            if ((*(_DWORD *)&v10 & 0x20000) != 0)
            {
              if ((v11 & 0x20000) == 0 || self->_originPhyMode != *((_DWORD *)a3 + 26)) {
                goto LABEL_166;
              }
            }
            else if ((v11 & 0x20000) != 0)
            {
              goto LABEL_166;
            }
            LOBYTE(v5) = (v11 & 0x8000000) == 0;
            if ((*(_DWORD *)&v10 & 0x8000000) != 0)
            {
              if ((v11 & 0x8000000) == 0 || self->_targetPhyMode != *((_DWORD *)a3 + 38)) {
                goto LABEL_166;
              }
              LOBYTE(v5) = 1;
            }
            return v5;
          }
        }
LABEL_166:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    unint64_t v38 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v37 = 2654435761 * self->_latency;
      if ((*(_DWORD *)&has & 0x80000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v38 = 0;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761 * self->_profileType;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_5:
    uint64_t v35 = 2654435761 * self->_securityType;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_6:
    uint64_t v34 = 2654435761 * self->_status;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_7:
    uint64_t v33 = 2654435761 * self->_reason;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v32 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v32 = 2654435761 * self->_originRssi;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_9:
    uint64_t v4 = 2654435761 * self->_targetRssi;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v4 = 0;
LABEL_18:
  uint64_t v5 = [(NSData *)self->_originOui hash];
  uint64_t v6 = [(NSData *)self->_targetOui hash];
  $3FBDB23C6C5F349EAF78C1AAF25ADCD2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    uint64_t v8 = 2654435761 * self->_flags;
    if ((*(_WORD *)&v7 & 0x8000) != 0)
    {
LABEL_20:
      uint64_t v9 = 2654435761 * self->_originChannel;
      if ((*(_DWORD *)&v7 & 0x2000000) != 0) {
        goto LABEL_21;
      }
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(_WORD *)&v7 & 0x8000) != 0) {
      goto LABEL_20;
    }
  }
  uint64_t v9 = 0;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
LABEL_21:
    uint64_t v10 = 2654435761 * self->_targetChannel;
    if ((*(_WORD *)&v7 & 0x100) != 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v10 = 0;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
LABEL_22:
    uint64_t v11 = 2654435761 * self->_ccaTotal;
    if ((*(unsigned char *)&v7 & 0x80) != 0) {
      goto LABEL_23;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v11 = 0;
  if ((*(unsigned char *)&v7 & 0x80) != 0)
  {
LABEL_23:
    uint64_t v12 = 2654435761 * self->_ccaSelf;
    if ((*(unsigned char *)&v7 & 0x40) != 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&v7 & 0x40) != 0)
  {
LABEL_24:
    uint64_t v13 = 2654435761 * self->_ccaOthers;
    if ((*(unsigned char *)&v7 & 0x20) != 0) {
      goto LABEL_25;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
LABEL_25:
    uint64_t v14 = 2654435761 * self->_ccaInt;
    if ((*(unsigned char *)&v7 & 8) != 0) {
      goto LABEL_26;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
LABEL_26:
    unint64_t v15 = 2654435761u * self->_originTxPer;
    if ((*(_WORD *)&v7 & 0x2000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_50;
  }
LABEL_49:
  unint64_t v15 = 0;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_27:
    uint64_t v16 = 2654435761 * self->_offChannelDt;
    if ((*(_DWORD *)&v7 & 0x200000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
LABEL_28:
    uint64_t v17 = 2654435761 * self->_roamScanDuration;
    if (*(unsigned char *)&v7) {
      goto LABEL_29;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v17 = 0;
  if (*(unsigned char *)&v7)
  {
LABEL_29:
    unint64_t v18 = 2654435761u * self->_associatedDur;
    if ((*(_WORD *)&v7 & 0x400) != 0) {
      goto LABEL_30;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v18 = 0;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
LABEL_30:
    uint64_t v19 = 2654435761 * self->_hostReason;
    if ((*(_WORD *)&v7 & 0x1000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v19 = 0;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
LABEL_31:
    uint64_t v20 = 2654435761 * self->_motionState;
    if ((*(_DWORD *)&v7 & 0x40000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
LABEL_32:
    uint64_t v21 = 2654435761 * self->_voipActive;
    if ((*(_DWORD *)&v7 & 0x20000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
LABEL_33:
    uint64_t v22 = 2654435761 * self->_lateRoam;
    if ((*(unsigned char *)&v7 & 2) != 0) {
      goto LABEL_34;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
LABEL_34:
    unint64_t v23 = 2654435761u * self->_originBcnPer;
    if ((*(unsigned char *)&v7 & 4) != 0) {
      goto LABEL_35;
    }
    goto LABEL_58;
  }
LABEL_57:
  unint64_t v23 = 0;
  if ((*(unsigned char *)&v7 & 4) != 0)
  {
LABEL_35:
    unint64_t v24 = 2654435761u * self->_originFwTxPer;
    if ((*(_DWORD *)&v7 & 0x10000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v24 = 0;
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
LABEL_36:
    uint64_t v25 = 2654435761 * self->_originEnhancedSecurityType;
    if ((*(_DWORD *)&v7 & 0x4000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v7 & 0x4000000) != 0)
  {
LABEL_37:
    uint64_t v26 = 2654435761 * self->_targetEnhancedSecurityType;
    if ((*(_WORD *)&v7 & 0x4000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v26 = 0;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
LABEL_38:
    uint64_t v27 = 2654435761 * self->_originAKMs;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&v7 & 0x1000000) != 0)
  {
LABEL_39:
    uint64_t v28 = 2654435761 * self->_targetAKMs;
    if ((*(_DWORD *)&v7 & 0x20000) != 0) {
      goto LABEL_40;
    }
LABEL_63:
    uint64_t v29 = 0;
    if ((*(_DWORD *)&v7 & 0x8000000) != 0) {
      goto LABEL_41;
    }
LABEL_64:
    uint64_t v30 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_62:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v7 & 0x20000) == 0) {
    goto LABEL_63;
  }
LABEL_40:
  uint64_t v29 = 2654435761 * self->_originPhyMode;
  if ((*(_DWORD *)&v7 & 0x8000000) == 0) {
    goto LABEL_64;
  }
LABEL_41:
  uint64_t v30 = 2654435761 * self->_targetPhyMode;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  int v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
    int v5 = *((_DWORD *)a3 + 41);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_latency = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x80000) == 0)
  {
LABEL_4:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_profileType = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x400000) == 0)
  {
LABEL_5:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_securityType = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x800000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_status = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x100000) == 0)
  {
LABEL_7:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_reason = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)a3 + 41);
  if ((v5 & 0x40000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_45:
  self->_originRssi = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 41) & 0x10000000) != 0)
  {
LABEL_9:
    self->_targetRssi = *((_DWORD *)a3 + 39);
    *(_DWORD *)&self->_has |= 0x10000000u;
  }
LABEL_10:
  if (*((void *)a3 + 12)) {
    -[AWDWiFiMetricsManagerRoamStatus setOriginOui:](self, "setOriginOui:");
  }
  if (*((void *)a3 + 18)) {
    -[AWDWiFiMetricsManagerRoamStatus setTargetOui:](self, "setTargetOui:");
  }
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x200) != 0)
  {
    self->_flags = *((_DWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x200u;
    int v6 = *((_DWORD *)a3 + 41);
    if ((v6 & 0x8000) == 0)
    {
LABEL_16:
      if ((v6 & 0x2000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x8000) == 0)
  {
    goto LABEL_16;
  }
  self->_originChannel = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_targetChannel = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_ccaTotal = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x80) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_ccaSelf = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_ccaOthers = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x20) == 0)
  {
LABEL_21:
    if ((v6 & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_ccaInt = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x20u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 8) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_originTxPer = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_offChannelDt = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x200000) == 0)
  {
LABEL_24:
    if ((v6 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_roamScanDuration = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 1) == 0)
  {
LABEL_25:
    if ((v6 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_associatedDur = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x400) == 0)
  {
LABEL_26:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_hostReason = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x1000) == 0)
  {
LABEL_27:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_motionState = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_voipActive = *((unsigned char *)a3 + 161);
  *(_DWORD *)&self->_has |= 0x40000000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_29:
    if ((v6 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_lateRoam = *((unsigned char *)a3 + 160);
  *(_DWORD *)&self->_has |= 0x20000000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 2) == 0)
  {
LABEL_30:
    if ((v6 & 4) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_originBcnPer = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 4) == 0)
  {
LABEL_31:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_originFwTxPer = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x10000) == 0)
  {
LABEL_32:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_originEnhancedSecurityType = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_targetEnhancedSecurityType = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x4000) == 0)
  {
LABEL_34:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_originAKMs = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_targetAKMs = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v6 = *((_DWORD *)a3 + 41);
  if ((v6 & 0x20000) == 0)
  {
LABEL_36:
    if ((v6 & 0x8000000) == 0) {
      return;
    }
    goto LABEL_37;
  }
LABEL_68:
  self->_originPhyMode = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)a3 + 41) & 0x8000000) == 0) {
    return;
  }
LABEL_37:
  self->_targetPhyMode = *((_DWORD *)a3 + 38);
  *(_DWORD *)&self->_has |= 0x8000000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)latency
{
  return self->_latency;
}

- (unsigned)profileType
{
  return self->_profileType;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)reason
{
  return self->_reason;
}

- (int)originRssi
{
  return self->_originRssi;
}

- (int)targetRssi
{
  return self->_targetRssi;
}

- (NSData)originOui
{
  return self->_originOui;
}

- (void)setOriginOui:(id)a3
{
}

- (NSData)targetOui
{
  return self->_targetOui;
}

- (void)setTargetOui:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (unsigned)originChannel
{
  return self->_originChannel;
}

- (unsigned)targetChannel
{
  return self->_targetChannel;
}

- (unsigned)ccaTotal
{
  return self->_ccaTotal;
}

- (unsigned)ccaSelf
{
  return self->_ccaSelf;
}

- (unsigned)ccaOthers
{
  return self->_ccaOthers;
}

- (unsigned)ccaInt
{
  return self->_ccaInt;
}

- (unint64_t)originTxPer
{
  return self->_originTxPer;
}

- (unsigned)offChannelDt
{
  return self->_offChannelDt;
}

- (unsigned)roamScanDuration
{
  return self->_roamScanDuration;
}

- (unint64_t)associatedDur
{
  return self->_associatedDur;
}

- (unsigned)hostReason
{
  return self->_hostReason;
}

- (unsigned)motionState
{
  return self->_motionState;
}

- (BOOL)voipActive
{
  return self->_voipActive;
}

- (BOOL)lateRoam
{
  return self->_lateRoam;
}

- (unint64_t)originBcnPer
{
  return self->_originBcnPer;
}

- (unint64_t)originFwTxPer
{
  return self->_originFwTxPer;
}

- (unsigned)originEnhancedSecurityType
{
  return self->_originEnhancedSecurityType;
}

- (unsigned)targetEnhancedSecurityType
{
  return self->_targetEnhancedSecurityType;
}

- (unsigned)originAKMs
{
  return self->_originAKMs;
}

- (unsigned)targetAKMs
{
  return self->_targetAKMs;
}

- (unsigned)originPhyMode
{
  return self->_originPhyMode;
}

- (unsigned)targetPhyMode
{
  return self->_targetPhyMode;
}

@end