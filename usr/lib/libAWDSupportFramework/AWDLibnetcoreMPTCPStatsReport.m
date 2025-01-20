@interface AWDLibnetcoreMPTCPStatsReport
- (BOOL)hasMptcpAggregateAllBytes;
- (BOOL)hasMptcpAggregateAttempt;
- (BOOL)hasMptcpAggregateCellBytes;
- (BOOL)hasMptcpBackToWiFi;
- (BOOL)hasMptcpCellDenied;
- (BOOL)hasMptcpCellProxy;
- (BOOL)hasMptcpFirstPartyAggregateAttempt;
- (BOOL)hasMptcpFirstPartyHandoverAttempt;
- (BOOL)hasMptcpFirstPartyInteractiveAttempt;
- (BOOL)hasMptcpHandoverAllBytes;
- (BOOL)hasMptcpHandoverAttempts;
- (BOOL)hasMptcpHandoverCellBytes;
- (BOOL)hasMptcpHandoverCellSubflowFromWiFi;
- (BOOL)hasMptcpHandoverWiFiSubflowFromCell;
- (BOOL)hasMptcpHandshakeAggregateSuccess;
- (BOOL)hasMptcpHandshakeAggregateSuccessFirstParty;
- (BOOL)hasMptcpHandshakeHandoverSuccessCell;
- (BOOL)hasMptcpHandshakeHandoverSuccessCellFirstParty;
- (BOOL)hasMptcpHandshakeHandoverSuccessWiFi;
- (BOOL)hasMptcpHandshakeHandoverSuccessWiFiFirstParty;
- (BOOL)hasMptcpHandshakeInteractiveSuccess;
- (BOOL)hasMptcpHandshakeInteractiveSuccessFirstParty;
- (BOOL)hasMptcpHeuristicFallback;
- (BOOL)hasMptcpHeuristicFallbackFirstParty;
- (BOOL)hasMptcpInteractiveAllBytes;
- (BOOL)hasMptcpInteractiveAttempt;
- (BOOL)hasMptcpInteractiveCellBytes;
- (BOOL)hasMptcpInteractiveCellUsage;
- (BOOL)hasMptcpTriggeredCell;
- (BOOL)hasMptcpWiFiProxy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)mptcpAggregateAllBytes;
- (unint64_t)mptcpAggregateAttempt;
- (unint64_t)mptcpAggregateCellBytes;
- (unint64_t)mptcpBackToWiFi;
- (unint64_t)mptcpCellDenied;
- (unint64_t)mptcpCellProxy;
- (unint64_t)mptcpFirstPartyAggregateAttempt;
- (unint64_t)mptcpFirstPartyHandoverAttempt;
- (unint64_t)mptcpFirstPartyInteractiveAttempt;
- (unint64_t)mptcpHandoverAllBytes;
- (unint64_t)mptcpHandoverAttempts;
- (unint64_t)mptcpHandoverCellBytes;
- (unint64_t)mptcpHandoverCellSubflowFromWiFi;
- (unint64_t)mptcpHandoverWiFiSubflowFromCell;
- (unint64_t)mptcpHandshakeAggregateSuccess;
- (unint64_t)mptcpHandshakeAggregateSuccessFirstParty;
- (unint64_t)mptcpHandshakeHandoverSuccessCell;
- (unint64_t)mptcpHandshakeHandoverSuccessCellFirstParty;
- (unint64_t)mptcpHandshakeHandoverSuccessWiFi;
- (unint64_t)mptcpHandshakeHandoverSuccessWiFiFirstParty;
- (unint64_t)mptcpHandshakeInteractiveSuccess;
- (unint64_t)mptcpHandshakeInteractiveSuccessFirstParty;
- (unint64_t)mptcpHeuristicFallback;
- (unint64_t)mptcpHeuristicFallbackFirstParty;
- (unint64_t)mptcpInteractiveAllBytes;
- (unint64_t)mptcpInteractiveAttempt;
- (unint64_t)mptcpInteractiveCellBytes;
- (unint64_t)mptcpInteractiveCellUsage;
- (unint64_t)mptcpTriggeredCell;
- (unint64_t)mptcpWiFiProxy;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMptcpAggregateAllBytes:(BOOL)a3;
- (void)setHasMptcpAggregateAttempt:(BOOL)a3;
- (void)setHasMptcpAggregateCellBytes:(BOOL)a3;
- (void)setHasMptcpBackToWiFi:(BOOL)a3;
- (void)setHasMptcpCellDenied:(BOOL)a3;
- (void)setHasMptcpCellProxy:(BOOL)a3;
- (void)setHasMptcpFirstPartyAggregateAttempt:(BOOL)a3;
- (void)setHasMptcpFirstPartyHandoverAttempt:(BOOL)a3;
- (void)setHasMptcpFirstPartyInteractiveAttempt:(BOOL)a3;
- (void)setHasMptcpHandoverAllBytes:(BOOL)a3;
- (void)setHasMptcpHandoverAttempts:(BOOL)a3;
- (void)setHasMptcpHandoverCellBytes:(BOOL)a3;
- (void)setHasMptcpHandoverCellSubflowFromWiFi:(BOOL)a3;
- (void)setHasMptcpHandoverWiFiSubflowFromCell:(BOOL)a3;
- (void)setHasMptcpHandshakeAggregateSuccess:(BOOL)a3;
- (void)setHasMptcpHandshakeAggregateSuccessFirstParty:(BOOL)a3;
- (void)setHasMptcpHandshakeHandoverSuccessCell:(BOOL)a3;
- (void)setHasMptcpHandshakeHandoverSuccessCellFirstParty:(BOOL)a3;
- (void)setHasMptcpHandshakeHandoverSuccessWiFi:(BOOL)a3;
- (void)setHasMptcpHandshakeHandoverSuccessWiFiFirstParty:(BOOL)a3;
- (void)setHasMptcpHandshakeInteractiveSuccess:(BOOL)a3;
- (void)setHasMptcpHandshakeInteractiveSuccessFirstParty:(BOOL)a3;
- (void)setHasMptcpHeuristicFallback:(BOOL)a3;
- (void)setHasMptcpHeuristicFallbackFirstParty:(BOOL)a3;
- (void)setHasMptcpInteractiveAllBytes:(BOOL)a3;
- (void)setHasMptcpInteractiveAttempt:(BOOL)a3;
- (void)setHasMptcpInteractiveCellBytes:(BOOL)a3;
- (void)setHasMptcpInteractiveCellUsage:(BOOL)a3;
- (void)setHasMptcpTriggeredCell:(BOOL)a3;
- (void)setHasMptcpWiFiProxy:(BOOL)a3;
- (void)setMptcpAggregateAllBytes:(unint64_t)a3;
- (void)setMptcpAggregateAttempt:(unint64_t)a3;
- (void)setMptcpAggregateCellBytes:(unint64_t)a3;
- (void)setMptcpBackToWiFi:(unint64_t)a3;
- (void)setMptcpCellDenied:(unint64_t)a3;
- (void)setMptcpCellProxy:(unint64_t)a3;
- (void)setMptcpFirstPartyAggregateAttempt:(unint64_t)a3;
- (void)setMptcpFirstPartyHandoverAttempt:(unint64_t)a3;
- (void)setMptcpFirstPartyInteractiveAttempt:(unint64_t)a3;
- (void)setMptcpHandoverAllBytes:(unint64_t)a3;
- (void)setMptcpHandoverAttempts:(unint64_t)a3;
- (void)setMptcpHandoverCellBytes:(unint64_t)a3;
- (void)setMptcpHandoverCellSubflowFromWiFi:(unint64_t)a3;
- (void)setMptcpHandoverWiFiSubflowFromCell:(unint64_t)a3;
- (void)setMptcpHandshakeAggregateSuccess:(unint64_t)a3;
- (void)setMptcpHandshakeAggregateSuccessFirstParty:(unint64_t)a3;
- (void)setMptcpHandshakeHandoverSuccessCell:(unint64_t)a3;
- (void)setMptcpHandshakeHandoverSuccessCellFirstParty:(unint64_t)a3;
- (void)setMptcpHandshakeHandoverSuccessWiFi:(unint64_t)a3;
- (void)setMptcpHandshakeHandoverSuccessWiFiFirstParty:(unint64_t)a3;
- (void)setMptcpHandshakeInteractiveSuccess:(unint64_t)a3;
- (void)setMptcpHandshakeInteractiveSuccessFirstParty:(unint64_t)a3;
- (void)setMptcpHeuristicFallback:(unint64_t)a3;
- (void)setMptcpHeuristicFallbackFirstParty:(unint64_t)a3;
- (void)setMptcpInteractiveAllBytes:(unint64_t)a3;
- (void)setMptcpInteractiveAttempt:(unint64_t)a3;
- (void)setMptcpInteractiveCellBytes:(unint64_t)a3;
- (void)setMptcpInteractiveCellUsage:(unint64_t)a3;
- (void)setMptcpTriggeredCell:(unint64_t)a3;
- (void)setMptcpWiFiProxy:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreMPTCPStatsReport

- (void)setMptcpHandoverAttempts:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_mptcpHandoverAttempts = a3;
}

- (void)setHasMptcpHandoverAttempts:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMptcpHandoverAttempts
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMptcpInteractiveAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_mptcpInteractiveAttempt = a3;
}

- (void)setHasMptcpInteractiveAttempt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveAttempt
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setMptcpAggregateAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_mptcpAggregateAttempt = a3;
}

- (void)setHasMptcpAggregateAttempt:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMptcpAggregateAttempt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMptcpFirstPartyHandoverAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_mptcpFirstPartyHandoverAttempt = a3;
}

- (void)setHasMptcpFirstPartyHandoverAttempt:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMptcpFirstPartyHandoverAttempt
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMptcpFirstPartyInteractiveAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_mptcpFirstPartyInteractiveAttempt = a3;
}

- (void)setHasMptcpFirstPartyInteractiveAttempt:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMptcpFirstPartyInteractiveAttempt
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setMptcpFirstPartyAggregateAttempt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_mptcpFirstPartyAggregateAttempt = a3;
}

- (void)setHasMptcpFirstPartyAggregateAttempt:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMptcpFirstPartyAggregateAttempt
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMptcpHeuristicFallback:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_mptcpHeuristicFallback = a3;
}

- (void)setHasMptcpHeuristicFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasMptcpHeuristicFallback
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setMptcpHeuristicFallbackFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_mptcpHeuristicFallbackFirstParty = a3;
}

- (void)setHasMptcpHeuristicFallbackFirstParty:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasMptcpHeuristicFallbackFirstParty
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setMptcpHandshakeHandoverSuccessWiFi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_mptcpHandshakeHandoverSuccessWiFi = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessWiFi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessWiFi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMptcpHandshakeHandoverSuccessCell:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_mptcpHandshakeHandoverSuccessCell = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessCell:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessCell
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMptcpHandshakeInteractiveSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_mptcpHandshakeInteractiveSuccess = a3;
}

- (void)setHasMptcpHandshakeInteractiveSuccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasMptcpHandshakeInteractiveSuccess
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMptcpHandshakeAggregateSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_mptcpHandshakeAggregateSuccess = a3;
}

- (void)setHasMptcpHandshakeAggregateSuccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMptcpHandshakeAggregateSuccess
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMptcpHandshakeHandoverSuccessWiFiFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_mptcpHandshakeHandoverSuccessWiFiFirstParty = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessWiFiFirstParty:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessWiFiFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMptcpHandshakeHandoverSuccessCellFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_mptcpHandshakeHandoverSuccessCellFirstParty = a3;
}

- (void)setHasMptcpHandshakeHandoverSuccessCellFirstParty:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMptcpHandshakeHandoverSuccessCellFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMptcpHandshakeInteractiveSuccessFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_mptcpHandshakeInteractiveSuccessFirstParty = a3;
}

- (void)setHasMptcpHandshakeInteractiveSuccessFirstParty:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasMptcpHandshakeInteractiveSuccessFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setMptcpHandshakeAggregateSuccessFirstParty:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_mptcpHandshakeAggregateSuccessFirstParty = a3;
}

- (void)setHasMptcpHandshakeAggregateSuccessFirstParty:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMptcpHandshakeAggregateSuccessFirstParty
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMptcpHandoverCellSubflowFromWiFi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mptcpHandoverCellSubflowFromWiFi = a3;
}

- (void)setHasMptcpHandoverCellSubflowFromWiFi:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMptcpHandoverCellSubflowFromWiFi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMptcpHandoverWiFiSubflowFromCell:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_mptcpHandoverWiFiSubflowFromCell = a3;
}

- (void)setHasMptcpHandoverWiFiSubflowFromCell:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMptcpHandoverWiFiSubflowFromCell
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMptcpInteractiveCellUsage:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_mptcpInteractiveCellUsage = a3;
}

- (void)setHasMptcpInteractiveCellUsage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveCellUsage
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMptcpHandoverCellBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mptcpHandoverCellBytes = a3;
}

- (void)setHasMptcpHandoverCellBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMptcpHandoverCellBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMptcpInteractiveCellBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_mptcpInteractiveCellBytes = a3;
}

- (void)setHasMptcpInteractiveCellBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveCellBytes
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMptcpAggregateCellBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_mptcpAggregateCellBytes = a3;
}

- (void)setHasMptcpAggregateCellBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMptcpAggregateCellBytes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMptcpHandoverAllBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mptcpHandoverAllBytes = a3;
}

- (void)setHasMptcpHandoverAllBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMptcpHandoverAllBytes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMptcpInteractiveAllBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_mptcpInteractiveAllBytes = a3;
}

- (void)setHasMptcpInteractiveAllBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasMptcpInteractiveAllBytes
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setMptcpAggregateAllBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_mptcpAggregateAllBytes = a3;
}

- (void)setHasMptcpAggregateAllBytes:(BOOL)a3
{
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasMptcpAggregateAllBytes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setMptcpBackToWiFi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_mptcpBackToWiFi = a3;
}

- (void)setHasMptcpBackToWiFi:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMptcpBackToWiFi
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMptcpCellDenied:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_mptcpCellDenied = a3;
}

- (void)setHasMptcpCellDenied:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMptcpCellDenied
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMptcpCellProxy:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_mptcpCellProxy = a3;
}

- (void)setHasMptcpCellProxy:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMptcpCellProxy
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMptcpWiFiProxy:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_mptcpWiFiProxy = a3;
}

- (void)setHasMptcpWiFiProxy:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasMptcpWiFiProxy
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setMptcpTriggeredCell:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_mptcpTriggeredCell = a3;
}

- (void)setHasMptcpTriggeredCell:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($A42C86F35415F5D5ABC6B48FCFD0454C)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasMptcpTriggeredCell
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreMPTCPStatsReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreMPTCPStatsReport description](&v3, sel_description), -[AWDLibnetcoreMPTCPStatsReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandoverAttempts] forKey:@"mptcpHandoverAttempts"];
    $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpInteractiveAttempt] forKey:@"mptcpInteractiveAttempt"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpAggregateAttempt] forKey:@"mptcpAggregateAttempt"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpFirstPartyHandoverAttempt] forKey:@"mptcpFirstPartyHandoverAttempt"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpFirstPartyInteractiveAttempt] forKey:@"mptcpFirstPartyInteractiveAttempt"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpFirstPartyAggregateAttempt] forKey:@"mptcpFirstPartyAggregateAttempt"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHeuristicFallback] forKey:@"mptcpHeuristicFallback"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHeuristicFallbackFirstParty] forKey:@"mptcpHeuristicFallbackFirstParty"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeHandoverSuccessWiFi] forKey:@"mptcpHandshakeHandoverSuccessWiFi"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeHandoverSuccessCell] forKey:@"mptcpHandshakeHandoverSuccessCell"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeInteractiveSuccess] forKey:@"mptcpHandshakeInteractiveSuccess"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeAggregateSuccess] forKey:@"mptcpHandshakeAggregateSuccess"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeHandoverSuccessWiFiFirstParty] forKey:@"mptcpHandshakeHandoverSuccessWiFiFirstParty"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeHandoverSuccessCellFirstParty] forKey:@"mptcpHandshakeHandoverSuccessCellFirstParty"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeInteractiveSuccessFirstParty] forKey:@"mptcpHandshakeInteractiveSuccessFirstParty"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandshakeAggregateSuccessFirstParty] forKey:@"mptcpHandshakeAggregateSuccessFirstParty"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandoverCellSubflowFromWiFi] forKey:@"mptcpHandoverCellSubflowFromWiFi"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandoverWiFiSubflowFromCell] forKey:@"mptcpHandoverWiFiSubflowFromCell"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpInteractiveCellUsage] forKey:@"mptcpInteractiveCellUsage"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandoverCellBytes] forKey:@"mptcpHandoverCellBytes"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpInteractiveCellBytes] forKey:@"mptcpInteractiveCellBytes"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpAggregateCellBytes] forKey:@"mptcpAggregateCellBytes"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpHandoverAllBytes] forKey:@"mptcpHandoverAllBytes"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpInteractiveAllBytes] forKey:@"mptcpInteractiveAllBytes"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpAggregateAllBytes] forKey:@"mptcpAggregateAllBytes"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpBackToWiFi] forKey:@"mptcpBackToWiFi"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpCellDenied] forKey:@"mptcpCellDenied"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_30;
    }
LABEL_61:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpWiFiProxy] forKey:@"mptcpWiFiProxy"];
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      return v3;
    }
    goto LABEL_31;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpCellProxy] forKey:@"mptcpCellProxy"];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0) {
    goto LABEL_61;
  }
LABEL_30:
  if ((*(_DWORD *)&has & 0x10000000) != 0) {
LABEL_31:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_mptcpTriggeredCell] forKey:@"mptcpTriggeredCell"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreMPTCPStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
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
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0) {
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
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((void *)a3 + 11) = self->_mptcpHandoverAttempts;
    *((_DWORD *)a3 + 62) |= 0x400u;
    $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 26) = self->_mptcpInteractiveAttempt;
  *((_DWORD *)a3 + 62) |= 0x2000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)a3 + 2) = self->_mptcpAggregateAttempt;
  *((_DWORD *)a3 + 62) |= 2u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 8) = self->_mptcpFirstPartyHandoverAttempt;
  *((_DWORD *)a3 + 62) |= 0x80u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)a3 + 9) = self->_mptcpFirstPartyInteractiveAttempt;
  *((_DWORD *)a3 + 62) |= 0x100u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)a3 + 7) = self->_mptcpFirstPartyAggregateAttempt;
  *((_DWORD *)a3 + 62) |= 0x40u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 23) = self->_mptcpHeuristicFallback;
  *((_DWORD *)a3 + 62) |= 0x400000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 24) = self->_mptcpHeuristicFallbackFirstParty;
  *((_DWORD *)a3 + 62) |= 0x800000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 19) = self->_mptcpHandshakeHandoverSuccessWiFi;
  *((_DWORD *)a3 + 62) |= 0x40000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)a3 + 17) = self->_mptcpHandshakeHandoverSuccessCell;
  *((_DWORD *)a3 + 62) |= 0x10000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)a3 + 21) = self->_mptcpHandshakeInteractiveSuccess;
  *((_DWORD *)a3 + 62) |= 0x100000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)a3 + 15) = self->_mptcpHandshakeAggregateSuccess;
  *((_DWORD *)a3 + 62) |= 0x4000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)a3 + 20) = self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
  *((_DWORD *)a3 + 62) |= 0x80000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)a3 + 18) = self->_mptcpHandshakeHandoverSuccessCellFirstParty;
  *((_DWORD *)a3 + 62) |= 0x20000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)a3 + 22) = self->_mptcpHandshakeInteractiveSuccessFirstParty;
  *((_DWORD *)a3 + 62) |= 0x200000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)a3 + 16) = self->_mptcpHandshakeAggregateSuccessFirstParty;
  *((_DWORD *)a3 + 62) |= 0x8000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)a3 + 13) = self->_mptcpHandoverCellSubflowFromWiFi;
  *((_DWORD *)a3 + 62) |= 0x1000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)a3 + 14) = self->_mptcpHandoverWiFiSubflowFromCell;
  *((_DWORD *)a3 + 62) |= 0x2000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 28) = self->_mptcpInteractiveCellUsage;
  *((_DWORD *)a3 + 62) |= 0x8000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 12) = self->_mptcpHandoverCellBytes;
  *((_DWORD *)a3 + 62) |= 0x800u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 27) = self->_mptcpInteractiveCellBytes;
  *((_DWORD *)a3 + 62) |= 0x4000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 3) = self->_mptcpAggregateCellBytes;
  *((_DWORD *)a3 + 62) |= 4u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 10) = self->_mptcpHandoverAllBytes;
  *((_DWORD *)a3 + 62) |= 0x200u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 25) = self->_mptcpInteractiveAllBytes;
  *((_DWORD *)a3 + 62) |= 0x1000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 1) = self->_mptcpAggregateAllBytes;
  *((_DWORD *)a3 + 62) |= 1u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 4) = self->_mptcpBackToWiFi;
  *((_DWORD *)a3 + 62) |= 8u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)a3 + 5) = self->_mptcpCellDenied;
  *((_DWORD *)a3 + 62) |= 0x10u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 6) = self->_mptcpCellProxy;
  *((_DWORD *)a3 + 62) |= 0x20u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      return;
    }
LABEL_61:
    *((void *)a3 + 29) = self->_mptcpTriggeredCell;
    *((_DWORD *)a3 + 62) |= 0x10000000u;
    return;
  }
LABEL_60:
  *((void *)a3 + 30) = self->_mptcpWiFiProxy;
  *((_DWORD *)a3 + 62) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
    goto LABEL_61;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((void *)result + 11) = self->_mptcpHandoverAttempts;
    *((_DWORD *)result + 62) |= 0x400u;
    $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 26) = self->_mptcpInteractiveAttempt;
  *((_DWORD *)result + 62) |= 0x2000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 2) = self->_mptcpAggregateAttempt;
  *((_DWORD *)result + 62) |= 2u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 8) = self->_mptcpFirstPartyHandoverAttempt;
  *((_DWORD *)result + 62) |= 0x80u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 9) = self->_mptcpFirstPartyInteractiveAttempt;
  *((_DWORD *)result + 62) |= 0x100u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 7) = self->_mptcpFirstPartyAggregateAttempt;
  *((_DWORD *)result + 62) |= 0x40u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 23) = self->_mptcpHeuristicFallback;
  *((_DWORD *)result + 62) |= 0x400000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 24) = self->_mptcpHeuristicFallbackFirstParty;
  *((_DWORD *)result + 62) |= 0x800000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 19) = self->_mptcpHandshakeHandoverSuccessWiFi;
  *((_DWORD *)result + 62) |= 0x40000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 17) = self->_mptcpHandshakeHandoverSuccessCell;
  *((_DWORD *)result + 62) |= 0x10000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)result + 21) = self->_mptcpHandshakeInteractiveSuccess;
  *((_DWORD *)result + 62) |= 0x100000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)result + 15) = self->_mptcpHandshakeAggregateSuccess;
  *((_DWORD *)result + 62) |= 0x4000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)result + 20) = self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
  *((_DWORD *)result + 62) |= 0x80000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)result + 18) = self->_mptcpHandshakeHandoverSuccessCellFirstParty;
  *((_DWORD *)result + 62) |= 0x20000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)result + 22) = self->_mptcpHandshakeInteractiveSuccessFirstParty;
  *((_DWORD *)result + 62) |= 0x200000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)result + 16) = self->_mptcpHandshakeAggregateSuccessFirstParty;
  *((_DWORD *)result + 62) |= 0x8000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)result + 13) = self->_mptcpHandoverCellSubflowFromWiFi;
  *((_DWORD *)result + 62) |= 0x1000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)result + 14) = self->_mptcpHandoverWiFiSubflowFromCell;
  *((_DWORD *)result + 62) |= 0x2000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)result + 28) = self->_mptcpInteractiveCellUsage;
  *((_DWORD *)result + 62) |= 0x8000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)result + 12) = self->_mptcpHandoverCellBytes;
  *((_DWORD *)result + 62) |= 0x800u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)result + 27) = self->_mptcpInteractiveCellBytes;
  *((_DWORD *)result + 62) |= 0x4000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)result + 3) = self->_mptcpAggregateCellBytes;
  *((_DWORD *)result + 62) |= 4u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)result + 10) = self->_mptcpHandoverAllBytes;
  *((_DWORD *)result + 62) |= 0x200u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)result + 25) = self->_mptcpInteractiveAllBytes;
  *((_DWORD *)result + 62) |= 0x1000000u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)result + 1) = self->_mptcpAggregateAllBytes;
  *((_DWORD *)result + 62) |= 1u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)result + 4) = self->_mptcpBackToWiFi;
  *((_DWORD *)result + 62) |= 8u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)result + 5) = self->_mptcpCellDenied;
  *((_DWORD *)result + 62) |= 0x10u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)result + 6) = self->_mptcpCellProxy;
  *((_DWORD *)result + 62) |= 0x20u;
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      return result;
    }
    goto LABEL_31;
  }
LABEL_61:
  *((void *)result + 30) = self->_mptcpWiFiProxy;
  *((_DWORD *)result + 62) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
    return result;
  }
LABEL_31:
  *((void *)result + 29) = self->_mptcpTriggeredCell;
  *((_DWORD *)result + 62) |= 0x10000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
    int v7 = *((_DWORD *)a3 + 62);
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_mptcpHandoverAttempts != *((void *)a3 + 11)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
LABEL_151:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_mptcpInteractiveAttempt != *((void *)a3 + 26)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_mptcpAggregateAttempt != *((void *)a3 + 2)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_mptcpFirstPartyHandoverAttempt != *((void *)a3 + 8)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_mptcpFirstPartyInteractiveAttempt != *((void *)a3 + 9)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_mptcpFirstPartyAggregateAttempt != *((void *)a3 + 7)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_mptcpHeuristicFallback != *((void *)a3 + 23)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_mptcpHeuristicFallbackFirstParty != *((void *)a3 + 24)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_mptcpHandshakeHandoverSuccessWiFi != *((void *)a3 + 19)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_mptcpHandshakeHandoverSuccessCell != *((void *)a3 + 17)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_mptcpHandshakeInteractiveSuccess != *((void *)a3 + 21)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_mptcpHandshakeAggregateSuccess != *((void *)a3 + 15)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_mptcpHandshakeHandoverSuccessWiFiFirstParty != *((void *)a3 + 20)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_mptcpHandshakeHandoverSuccessCellFirstParty != *((void *)a3 + 18)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_mptcpHandshakeInteractiveSuccessFirstParty != *((void *)a3 + 22)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_mptcpHandshakeAggregateSuccessFirstParty != *((void *)a3 + 16)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_mptcpHandoverCellSubflowFromWiFi != *((void *)a3 + 13)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_mptcpHandoverWiFiSubflowFromCell != *((void *)a3 + 14)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_mptcpInteractiveCellUsage != *((void *)a3 + 28)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_mptcpHandoverCellBytes != *((void *)a3 + 12)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_mptcpInteractiveCellBytes != *((void *)a3 + 27)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_mptcpAggregateCellBytes != *((void *)a3 + 3)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_mptcpHandoverAllBytes != *((void *)a3 + 10)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_mptcpInteractiveAllBytes != *((void *)a3 + 25)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_151;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_mptcpAggregateAllBytes != *((void *)a3 + 1)) {
        goto LABEL_151;
      }
    }
    else if (v7)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_mptcpBackToWiFi != *((void *)a3 + 4)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_mptcpCellDenied != *((void *)a3 + 5)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_151;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_mptcpCellProxy != *((void *)a3 + 6)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_151;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_mptcpWiFiProxy != *((void *)a3 + 30)) {
        goto LABEL_151;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_151;
    }
    LOBYTE(v5) = (v7 & 0x10000000) == 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_mptcpTriggeredCell != *((void *)a3 + 29)) {
        goto LABEL_151;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $A42C86F35415F5D5ABC6B48FCFD0454C has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    unint64_t v33 = 2654435761u * self->_mptcpHandoverAttempts;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
LABEL_3:
      unint64_t v32 = 2654435761u * self->_mptcpInteractiveAttempt;
      if ((*(unsigned char *)&has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else
  {
    unint64_t v33 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v32 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_4:
    unint64_t v31 = 2654435761u * self->_mptcpAggregateAttempt;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v31 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_5:
    unint64_t v3 = 2654435761u * self->_mptcpFirstPartyHandoverAttempt;
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
    unint64_t v4 = 2654435761u * self->_mptcpFirstPartyInteractiveAttempt;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_7:
    unint64_t v5 = 2654435761u * self->_mptcpFirstPartyAggregateAttempt;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    unint64_t v6 = 2654435761u * self->_mptcpHeuristicFallback;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_9:
    unint64_t v7 = 2654435761u * self->_mptcpHeuristicFallbackFirstParty;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_10:
    unint64_t v8 = 2654435761u * self->_mptcpHandshakeHandoverSuccessWiFi;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_11:
    unint64_t v9 = 2654435761u * self->_mptcpHandshakeHandoverSuccessCell;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_12:
    unint64_t v10 = 2654435761u * self->_mptcpHandshakeInteractiveSuccess;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    unint64_t v11 = 2654435761u * self->_mptcpHandshakeAggregateSuccess;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  unint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    unint64_t v12 = 2654435761u * self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_15:
    unint64_t v13 = 2654435761u * self->_mptcpHandshakeHandoverSuccessCellFirstParty;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_16:
    unint64_t v14 = 2654435761u * self->_mptcpHandshakeInteractiveSuccessFirstParty;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  unint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    unint64_t v15 = 2654435761u * self->_mptcpHandshakeAggregateSuccessFirstParty;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  unint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    unint64_t v16 = 2654435761u * self->_mptcpHandoverCellSubflowFromWiFi;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  unint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_19:
    unint64_t v17 = 2654435761u * self->_mptcpHandoverWiFiSubflowFromCell;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_20:
    unint64_t v18 = 2654435761u * self->_mptcpInteractiveCellUsage;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  unint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_21:
    unint64_t v19 = 2654435761u * self->_mptcpHandoverCellBytes;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  unint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_22:
    unint64_t v20 = 2654435761u * self->_mptcpInteractiveCellBytes;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v20 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_23:
    unint64_t v21 = 2654435761u * self->_mptcpAggregateCellBytes;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_24:
    unint64_t v22 = 2654435761u * self->_mptcpHandoverAllBytes;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_25:
    unint64_t v23 = 2654435761u * self->_mptcpInteractiveAllBytes;
    if (*(unsigned char *)&has) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  unint64_t v23 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_26:
    unint64_t v24 = 2654435761u * self->_mptcpAggregateAllBytes;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  unint64_t v24 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_27:
    unint64_t v25 = 2654435761u * self->_mptcpBackToWiFi;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  unint64_t v25 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_28:
    unint64_t v26 = 2654435761u * self->_mptcpCellDenied;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v26 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_29:
    unint64_t v27 = 2654435761u * self->_mptcpCellProxy;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
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
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_60;
  }
LABEL_30:
  unint64_t v28 = 2654435761u * self->_mptcpWiFiProxy;
  if ((*(_DWORD *)&has & 0x10000000) == 0) {
    goto LABEL_61;
  }
LABEL_31:
  unint64_t v29 = 2654435761u * self->_mptcpTriggeredCell;
  return v32 ^ v33 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400) != 0)
  {
    self->_mptcpHandoverAttempts = *((void *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
    int v3 = *((_DWORD *)a3 + 62);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  self->_mptcpInteractiveAttempt = *((void *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_mptcpAggregateAttempt = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_mptcpFirstPartyHandoverAttempt = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_mptcpFirstPartyInteractiveAttempt = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_mptcpFirstPartyAggregateAttempt = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x400000) == 0)
  {
LABEL_8:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_mptcpHeuristicFallback = *((void *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800000) == 0)
  {
LABEL_9:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_mptcpHeuristicFallbackFirstParty = *((void *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x40000) == 0)
  {
LABEL_10:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_mptcpHandshakeHandoverSuccessWiFi = *((void *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10000) == 0)
  {
LABEL_11:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_mptcpHandshakeHandoverSuccessCell = *((void *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x100000) == 0)
  {
LABEL_12:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_mptcpHandshakeInteractiveSuccess = *((void *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000) == 0)
  {
LABEL_13:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_mptcpHandshakeAggregateSuccess = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x80000) == 0)
  {
LABEL_14:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_mptcpHandshakeHandoverSuccessWiFiFirstParty = *((void *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000) == 0)
  {
LABEL_15:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_mptcpHandshakeHandoverSuccessCellFirstParty = *((void *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200000) == 0)
  {
LABEL_16:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_mptcpHandshakeInteractiveSuccessFirstParty = *((void *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_mptcpHandshakeAggregateSuccessFirstParty = *((void *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000) == 0)
  {
LABEL_18:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_mptcpHandoverCellSubflowFromWiFi = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x2000) == 0)
  {
LABEL_19:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_mptcpHandoverWiFiSubflowFromCell = *((void *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_mptcpInteractiveCellUsage = *((void *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x800) == 0)
  {
LABEL_21:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_mptcpHandoverCellBytes = *((void *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_22:
    if ((v3 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_mptcpInteractiveCellBytes = *((void *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 4) == 0)
  {
LABEL_23:
    if ((v3 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_mptcpAggregateCellBytes = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x200) == 0)
  {
LABEL_24:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_mptcpHandoverAllBytes = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_25:
    if ((v3 & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_mptcpInteractiveAllBytes = *((void *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 1) == 0)
  {
LABEL_26:
    if ((v3 & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_mptcpAggregateAllBytes = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 8) == 0)
  {
LABEL_27:
    if ((v3 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_mptcpBackToWiFi = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x10) == 0)
  {
LABEL_28:
    if ((v3 & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_mptcpCellDenied = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20) == 0)
  {
LABEL_29:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_mptcpCellProxy = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 62);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x10000000) == 0) {
      return;
    }
LABEL_61:
    self->_mptcpTriggeredCell = *((void *)a3 + 29);
    *(_DWORD *)&self->_has |= 0x10000000u;
    return;
  }
LABEL_60:
  self->_mptcpWiFiProxy = *((void *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x20000000u;
  if ((*((_DWORD *)a3 + 62) & 0x10000000) != 0) {
    goto LABEL_61;
  }
}

- (unint64_t)mptcpHandoverAttempts
{
  return self->_mptcpHandoverAttempts;
}

- (unint64_t)mptcpInteractiveAttempt
{
  return self->_mptcpInteractiveAttempt;
}

- (unint64_t)mptcpAggregateAttempt
{
  return self->_mptcpAggregateAttempt;
}

- (unint64_t)mptcpFirstPartyHandoverAttempt
{
  return self->_mptcpFirstPartyHandoverAttempt;
}

- (unint64_t)mptcpFirstPartyInteractiveAttempt
{
  return self->_mptcpFirstPartyInteractiveAttempt;
}

- (unint64_t)mptcpFirstPartyAggregateAttempt
{
  return self->_mptcpFirstPartyAggregateAttempt;
}

- (unint64_t)mptcpHeuristicFallback
{
  return self->_mptcpHeuristicFallback;
}

- (unint64_t)mptcpHeuristicFallbackFirstParty
{
  return self->_mptcpHeuristicFallbackFirstParty;
}

- (unint64_t)mptcpHandshakeHandoverSuccessWiFi
{
  return self->_mptcpHandshakeHandoverSuccessWiFi;
}

- (unint64_t)mptcpHandshakeHandoverSuccessCell
{
  return self->_mptcpHandshakeHandoverSuccessCell;
}

- (unint64_t)mptcpHandshakeInteractiveSuccess
{
  return self->_mptcpHandshakeInteractiveSuccess;
}

- (unint64_t)mptcpHandshakeAggregateSuccess
{
  return self->_mptcpHandshakeAggregateSuccess;
}

- (unint64_t)mptcpHandshakeHandoverSuccessWiFiFirstParty
{
  return self->_mptcpHandshakeHandoverSuccessWiFiFirstParty;
}

- (unint64_t)mptcpHandshakeHandoverSuccessCellFirstParty
{
  return self->_mptcpHandshakeHandoverSuccessCellFirstParty;
}

- (unint64_t)mptcpHandshakeInteractiveSuccessFirstParty
{
  return self->_mptcpHandshakeInteractiveSuccessFirstParty;
}

- (unint64_t)mptcpHandshakeAggregateSuccessFirstParty
{
  return self->_mptcpHandshakeAggregateSuccessFirstParty;
}

- (unint64_t)mptcpHandoverCellSubflowFromWiFi
{
  return self->_mptcpHandoverCellSubflowFromWiFi;
}

- (unint64_t)mptcpHandoverWiFiSubflowFromCell
{
  return self->_mptcpHandoverWiFiSubflowFromCell;
}

- (unint64_t)mptcpInteractiveCellUsage
{
  return self->_mptcpInteractiveCellUsage;
}

- (unint64_t)mptcpHandoverCellBytes
{
  return self->_mptcpHandoverCellBytes;
}

- (unint64_t)mptcpInteractiveCellBytes
{
  return self->_mptcpInteractiveCellBytes;
}

- (unint64_t)mptcpAggregateCellBytes
{
  return self->_mptcpAggregateCellBytes;
}

- (unint64_t)mptcpHandoverAllBytes
{
  return self->_mptcpHandoverAllBytes;
}

- (unint64_t)mptcpInteractiveAllBytes
{
  return self->_mptcpInteractiveAllBytes;
}

- (unint64_t)mptcpAggregateAllBytes
{
  return self->_mptcpAggregateAllBytes;
}

- (unint64_t)mptcpBackToWiFi
{
  return self->_mptcpBackToWiFi;
}

- (unint64_t)mptcpCellDenied
{
  return self->_mptcpCellDenied;
}

- (unint64_t)mptcpCellProxy
{
  return self->_mptcpCellProxy;
}

- (unint64_t)mptcpWiFiProxy
{
  return self->_mptcpWiFiProxy;
}

- (unint64_t)mptcpTriggeredCell
{
  return self->_mptcpTriggeredCell;
}

@end