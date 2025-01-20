@interface AppTelemetryStuckStatus
- (BOOL)hasItemPendingReconciliationIsLocked;
- (BOOL)hasItemPendingReconciliationIsLockedInDB;
- (BOOL)hasItemPendingReconciliationJobBlockingCode;
- (BOOL)hasItemPendingReconciliationJobCode;
- (BOOL)hasItemPendingReconciliationJobSchedulingState;
- (BOOL)hasItemPendingScanningDiskEnumerationStatus;
- (BOOL)hasItemPendingScanningDiskHasMultiplePagesEnumeration;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingReconciliation;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingRejection;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDown;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUp;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
- (BOOL)hasItemPendingScanningProviderEnumerationStatus;
- (BOOL)hasItemPendingScanningProviderHasMultiplePagesEnumeration;
- (BOOL)hasItemPendingScanningProviderNumberOfChildren;
- (BOOL)hasItemPendingScanningProviderNumberOfChildrenFailingCreation;
- (BOOL)hasItemPendingScanningProviderNumberOfChildrenPendingCreation;
- (BOOL)hasItemPendingScanningProviderRemovalOfDatalessBitStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)itemPendingReconciliationIsLocked;
- (BOOL)itemPendingReconciliationIsLockedInDB;
- (BOOL)itemPendingScanningDiskHasMultiplePagesEnumeration;
- (BOOL)itemPendingScanningProviderHasMultiplePagesEnumeration;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)itemPendingReconciliationJobBlockingCode;
- (int64_t)itemPendingReconciliationJobCode;
- (int64_t)itemPendingReconciliationJobSchedulingState;
- (int64_t)itemPendingScanningDiskEnumerationStatus;
- (int64_t)itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingRejection;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
- (int64_t)itemPendingScanningProviderEnumerationStatus;
- (int64_t)itemPendingScanningProviderNumberOfChildren;
- (int64_t)itemPendingScanningProviderNumberOfChildrenFailingCreation;
- (int64_t)itemPendingScanningProviderNumberOfChildrenPendingCreation;
- (int64_t)itemPendingScanningProviderRemovalOfDatalessBitStatus;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasItemPendingReconciliationIsLocked:(BOOL)a3;
- (void)setHasItemPendingReconciliationIsLockedInDB:(BOOL)a3;
- (void)setHasItemPendingReconciliationJobBlockingCode:(BOOL)a3;
- (void)setHasItemPendingReconciliationJobCode:(BOOL)a3;
- (void)setHasItemPendingReconciliationJobSchedulingState:(BOOL)a3;
- (void)setHasItemPendingScanningDiskEnumerationStatus:(BOOL)a3;
- (void)setHasItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingRejection:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(BOOL)a3;
- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(BOOL)a3;
- (void)setHasItemPendingScanningProviderEnumerationStatus:(BOOL)a3;
- (void)setHasItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3;
- (void)setHasItemPendingScanningProviderNumberOfChildren:(BOOL)a3;
- (void)setHasItemPendingScanningProviderNumberOfChildrenFailingCreation:(BOOL)a3;
- (void)setHasItemPendingScanningProviderNumberOfChildrenPendingCreation:(BOOL)a3;
- (void)setHasItemPendingScanningProviderRemovalOfDatalessBitStatus:(BOOL)a3;
- (void)setItemPendingReconciliationIsLocked:(BOOL)a3;
- (void)setItemPendingReconciliationIsLockedInDB:(BOOL)a3;
- (void)setItemPendingReconciliationJobBlockingCode:(int64_t)a3;
- (void)setItemPendingReconciliationJobCode:(int64_t)a3;
- (void)setItemPendingReconciliationJobSchedulingState:(int64_t)a3;
- (void)setItemPendingScanningDiskEnumerationStatus:(int64_t)a3;
- (void)setItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingRejection:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(int64_t)a3;
- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(int64_t)a3;
- (void)setItemPendingScanningProviderEnumerationStatus:(int64_t)a3;
- (void)setItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3;
- (void)setItemPendingScanningProviderNumberOfChildren:(int64_t)a3;
- (void)setItemPendingScanningProviderNumberOfChildrenFailingCreation:(int64_t)a3;
- (void)setItemPendingScanningProviderNumberOfChildrenPendingCreation:(int64_t)a3;
- (void)setItemPendingScanningProviderRemovalOfDatalessBitStatus:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AppTelemetryStuckStatus

- (void)setItemPendingReconciliationIsLocked:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_itemPendingReconciliationIsLocked = a3;
}

- (void)setHasItemPendingReconciliationIsLocked:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasItemPendingReconciliationIsLocked
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setItemPendingReconciliationIsLockedInDB:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_itemPendingReconciliationIsLockedInDB = a3;
}

- (void)setHasItemPendingReconciliationIsLockedInDB:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasItemPendingReconciliationIsLockedInDB
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setItemPendingReconciliationJobCode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_itemPendingReconciliationJobCode = a3;
}

- (void)setHasItemPendingReconciliationJobCode:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasItemPendingReconciliationJobCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setItemPendingReconciliationJobSchedulingState:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_itemPendingReconciliationJobSchedulingState = a3;
}

- (void)setHasItemPendingReconciliationJobSchedulingState:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasItemPendingReconciliationJobSchedulingState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setItemPendingReconciliationJobBlockingCode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_itemPendingReconciliationJobBlockingCode = a3;
}

- (void)setHasItemPendingReconciliationJobBlockingCode:(BOOL)a3
{
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasItemPendingReconciliationJobBlockingCode
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setItemPendingScanningDiskEnumerationStatus:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_itemPendingScanningDiskEnumerationStatus = a3;
}

- (void)setHasItemPendingScanningDiskEnumerationStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasItemPendingScanningDiskEnumerationStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_itemPendingScanningDiskHasMultiplePagesEnumeration = a3;
}

- (void)setHasItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasItemPendingScanningDiskHasMultiplePagesEnumeration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingReconciliation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncUp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingSyncDown
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingRejection:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_itemPendingScanningDiskNumberOfChildrenPendingRejection = a3;
}

- (void)setHasItemPendingScanningDiskNumberOfChildrenPendingRejection:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasItemPendingScanningDiskNumberOfChildrenPendingRejection
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setItemPendingScanningProviderEnumerationStatus:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_itemPendingScanningProviderEnumerationStatus = a3;
}

- (void)setHasItemPendingScanningProviderEnumerationStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderEnumerationStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_itemPendingScanningProviderHasMultiplePagesEnumeration = a3;
}

- (void)setHasItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderHasMultiplePagesEnumeration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setItemPendingScanningProviderNumberOfChildren:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_itemPendingScanningProviderNumberOfChildren = a3;
}

- (void)setHasItemPendingScanningProviderNumberOfChildren:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderNumberOfChildren
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setItemPendingScanningProviderNumberOfChildrenPendingCreation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_itemPendingScanningProviderNumberOfChildrenPendingCreation = a3;
}

- (void)setHasItemPendingScanningProviderNumberOfChildrenPendingCreation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderNumberOfChildrenPendingCreation
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setItemPendingScanningProviderNumberOfChildrenFailingCreation:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_itemPendingScanningProviderNumberOfChildrenFailingCreation = a3;
}

- (void)setHasItemPendingScanningProviderNumberOfChildrenFailingCreation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasItemPendingScanningProviderNumberOfChildrenFailingCreation
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setItemPendingScanningProviderRemovalOfDatalessBitStatus:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_itemPendingScanningProviderRemovalOfDatalessBitStatus = a3;
}

- (void)setHasItemPendingScanningProviderRemovalOfDatalessBitStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($4E96D8002A0A5BC04655A948646AB44B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasItemPendingScanningProviderRemovalOfDatalessBitStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryStuckStatus;
  v4 = [(AppTelemetryStuckStatus *)&v8 description];
  v5 = [(AppTelemetryStuckStatus *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_itemPendingReconciliationIsLocked];
    [v3 setObject:v7 forKey:@"itemPendingReconciliationIsLocked"];

    $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithBool:self->_itemPendingReconciliationIsLockedInDB];
  [v3 setObject:v8 forKey:@"itemPendingReconciliationIsLockedInDB"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  v9 = [NSNumber numberWithLongLong:self->_itemPendingReconciliationJobCode];
  [v3 setObject:v9 forKey:@"itemPendingReconciliationJobCode"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  v10 = [NSNumber numberWithLongLong:self->_itemPendingReconciliationJobSchedulingState];
  [v3 setObject:v10 forKey:@"itemPendingReconciliationJobSchedulingState"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  v11 = [NSNumber numberWithLongLong:self->_itemPendingReconciliationJobBlockingCode];
  [v3 setObject:v11 forKey:@"itemPendingReconciliationJobBlockingCode"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  v12 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskEnumerationStatus];
  [v3 setObject:v12 forKey:@"itemPendingScanningDiskEnumerationStatus"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  v13 = [NSNumber numberWithBool:self->_itemPendingScanningDiskHasMultiplePagesEnumeration];
  [v3 setObject:v13 forKey:@"itemPendingScanningDiskHasMultiplePagesEnumeration"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  v14 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation];
  [v3 setObject:v14 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingReconciliation"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  v15 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation];
  [v3 setObject:v15 forKey:@"itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  v16 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion];
  [v3 setObject:v16 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  v17 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion];
  [v3 setObject:v17 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  v18 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent];
  [v3 setObject:v18 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  v19 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp];
  [v3 setObject:v19 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingSyncUp"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  v20 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent];
  [v3 setObject:v20 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  v21 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown];
  [v3 setObject:v21 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingSyncDown"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  v22 = [NSNumber numberWithLongLong:self->_itemPendingScanningDiskNumberOfChildrenPendingRejection];
  [v3 setObject:v22 forKey:@"itemPendingScanningDiskNumberOfChildrenPendingRejection"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  v23 = [NSNumber numberWithLongLong:self->_itemPendingScanningProviderEnumerationStatus];
  [v3 setObject:v23 forKey:@"itemPendingScanningProviderEnumerationStatus"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  v24 = [NSNumber numberWithBool:self->_itemPendingScanningProviderHasMultiplePagesEnumeration];
  [v3 setObject:v24 forKey:@"itemPendingScanningProviderHasMultiplePagesEnumeration"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  v25 = [NSNumber numberWithLongLong:self->_itemPendingScanningProviderNumberOfChildren];
  [v3 setObject:v25 forKey:@"itemPendingScanningProviderNumberOfChildren"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  v26 = [NSNumber numberWithLongLong:self->_itemPendingScanningProviderNumberOfChildrenPendingCreation];
  [v3 setObject:v26 forKey:@"itemPendingScanningProviderNumberOfChildrenPendingCreation"];

  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_47:
  v27 = [NSNumber numberWithLongLong:self->_itemPendingScanningProviderNumberOfChildrenFailingCreation];
  [v3 setObject:v27 forKey:@"itemPendingScanningProviderNumberOfChildrenFailingCreation"];

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_23:
    v5 = [NSNumber numberWithLongLong:self->_itemPendingScanningProviderRemovalOfDatalessBitStatus];
    [v3 setObject:v5 forKey:@"itemPendingScanningProviderRemovalOfDatalessBitStatus"];
  }
LABEL_24:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryStuckStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt64Field();
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_47:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
LABEL_23:
  }
    PBDataWriterWriteInt64Field();
LABEL_24:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v4[152] = self->_itemPendingReconciliationIsLocked;
    *((_DWORD *)v4 + 39) |= 0x40000u;
    $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  v4[153] = self->_itemPendingReconciliationIsLockedInDB;
  *((_DWORD *)v4 + 39) |= 0x80000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v4 + 2) = self->_itemPendingReconciliationJobCode;
  *((_DWORD *)v4 + 39) |= 2u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v4 + 3) = self->_itemPendingReconciliationJobSchedulingState;
  *((_DWORD *)v4 + 39) |= 4u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)v4 + 1) = self->_itemPendingReconciliationJobBlockingCode;
  *((_DWORD *)v4 + 39) |= 1u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 4) = self->_itemPendingScanningDiskEnumerationStatus;
  *((_DWORD *)v4 + 39) |= 8u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[154] = self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
  *((_DWORD *)v4 + 39) |= 0x100000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 6) = self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
  *((_DWORD *)v4 + 39) |= 0x20u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)v4 + 5) = self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
  *((_DWORD *)v4 + 39) |= 0x10u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)v4 + 12) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
  *((_DWORD *)v4 + 39) |= 0x800u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)v4 + 9) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
  *((_DWORD *)v4 + 39) |= 0x100u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)v4 + 13) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)v4 + 11) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
  *((_DWORD *)v4 + 39) |= 0x400u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)v4 + 10) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
  *((_DWORD *)v4 + 39) |= 0x200u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)v4 + 8) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
  *((_DWORD *)v4 + 39) |= 0x80u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)v4 + 7) = self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
  *((_DWORD *)v4 + 39) |= 0x40u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)v4 + 14) = self->_itemPendingScanningProviderEnumerationStatus;
  *((_DWORD *)v4 + 39) |= 0x2000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  v4[155] = self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
  *((_DWORD *)v4 + 39) |= 0x200000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)v4 + 15) = self->_itemPendingScanningProviderNumberOfChildren;
  *((_DWORD *)v4 + 39) |= 0x4000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)v4 + 17) = self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
  *((_DWORD *)v4 + 39) |= 0x10000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_47:
  *((void *)v4 + 16) = self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
  *((_DWORD *)v4 + 39) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_23:
    *((void *)v4 + 18) = self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
    *((_DWORD *)v4 + 39) |= 0x20000u;
  }
LABEL_24:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((unsigned char *)result + 152) = self->_itemPendingReconciliationIsLocked;
    *((_DWORD *)result + 39) |= 0x40000u;
    $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 153) = self->_itemPendingReconciliationIsLockedInDB;
  *((_DWORD *)result + 39) |= 0x80000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 2) = self->_itemPendingReconciliationJobCode;
  *((_DWORD *)result + 39) |= 2u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 3) = self->_itemPendingReconciliationJobSchedulingState;
  *((_DWORD *)result + 39) |= 4u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 1) = self->_itemPendingReconciliationJobBlockingCode;
  *((_DWORD *)result + 39) |= 1u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 4) = self->_itemPendingScanningDiskEnumerationStatus;
  *((_DWORD *)result + 39) |= 8u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((unsigned char *)result + 154) = self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
  *((_DWORD *)result + 39) |= 0x100000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)result + 6) = self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
  *((_DWORD *)result + 39) |= 0x20u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)result + 5) = self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
  *((_DWORD *)result + 39) |= 0x10u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 12) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
  *((_DWORD *)result + 39) |= 0x800u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 9) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
  *((_DWORD *)result + 39) |= 0x100u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 13) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
  *((_DWORD *)result + 39) |= 0x1000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 11) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
  *((_DWORD *)result + 39) |= 0x400u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 10) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
  *((_DWORD *)result + 39) |= 0x200u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 8) = self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
  *((_DWORD *)result + 39) |= 0x80u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 7) = self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
  *((_DWORD *)result + 39) |= 0x40u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 14) = self->_itemPendingScanningProviderEnumerationStatus;
  *((_DWORD *)result + 39) |= 0x2000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)result + 155) = self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
  *((_DWORD *)result + 39) |= 0x200000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)result + 15) = self->_itemPendingScanningProviderNumberOfChildren;
  *((_DWORD *)result + 39) |= 0x4000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)result + 17) = self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
  *((_DWORD *)result + 39) |= 0x10000u;
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      return result;
    }
    goto LABEL_23;
  }
LABEL_45:
  *((void *)result + 16) = self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
  *((_DWORD *)result + 39) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) == 0) {
    return result;
  }
LABEL_23:
  *((void *)result + 18) = self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
  *((_DWORD *)result + 39) |= 0x20000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_124;
  }
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  int v6 = *((_DWORD *)v4 + 39);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0) {
      goto LABEL_124;
    }
    if (self->_itemPendingReconciliationIsLocked)
    {
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_124;
      }
    }
    else if (*((unsigned char *)v4 + 152))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0) {
      goto LABEL_124;
    }
    if (self->_itemPendingReconciliationIsLockedInDB)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_124;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_itemPendingReconciliationJobCode != *((void *)v4 + 2)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_itemPendingReconciliationJobSchedulingState != *((void *)v4 + 3)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_124;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_itemPendingReconciliationJobBlockingCode != *((void *)v4 + 1)) {
      goto LABEL_124;
    }
  }
  else if (v6)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_itemPendingScanningDiskEnumerationStatus != *((void *)v4 + 4)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0) {
      goto LABEL_124;
    }
    if (self->_itemPendingScanningDiskHasMultiplePagesEnumeration)
    {
      if (!*((unsigned char *)v4 + 154)) {
        goto LABEL_124;
      }
    }
    else if (*((unsigned char *)v4 + 154))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation != *((void *)v4 + 6)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation != *((void *)v4 + 5))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion != *((void *)v4 + 12))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion != *((void *)v4 + 9))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent != *((void *)v4 + 13))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp != *((void *)v4 + 11)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0
      || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent != *((void *)v4 + 10))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown != *((void *)v4 + 8)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_itemPendingScanningDiskNumberOfChildrenPendingRejection != *((void *)v4 + 7)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_itemPendingScanningProviderEnumerationStatus != *((void *)v4 + 14)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) != 0)
    {
      if (self->_itemPendingScanningProviderHasMultiplePagesEnumeration)
      {
        if (!*((unsigned char *)v4 + 155)) {
          goto LABEL_124;
        }
        goto LABEL_104;
      }
      if (!*((unsigned char *)v4 + 155)) {
        goto LABEL_104;
      }
    }
LABEL_124:
    BOOL v7 = 0;
    goto LABEL_125;
  }
  if ((v6 & 0x200000) != 0) {
    goto LABEL_124;
  }
LABEL_104:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_itemPendingScanningProviderNumberOfChildren != *((void *)v4 + 15)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0
      || self->_itemPendingScanningProviderNumberOfChildrenPendingCreation != *((void *)v4 + 17))
    {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_itemPendingScanningProviderNumberOfChildrenFailingCreation != *((void *)v4 + 16)) {
      goto LABEL_124;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_itemPendingScanningProviderRemovalOfDatalessBitStatus != *((void *)v4 + 18)) {
      goto LABEL_124;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x20000) == 0;
  }
LABEL_125:

  return v7;
}

- (unint64_t)hash
{
  $4E96D8002A0A5BC04655A948646AB44B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v3 = 2654435761 * self->_itemPendingReconciliationIsLocked;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_itemPendingReconciliationIsLockedInDB;
      if ((*(unsigned char *)&has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_itemPendingReconciliationJobCode;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_itemPendingReconciliationJobSchedulingState;
    if (*(unsigned char *)&has) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v6 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_itemPendingReconciliationJobBlockingCode;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_itemPendingScanningDiskEnumerationStatus;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_itemPendingScanningProviderEnumerationStatus;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_19:
    uint64_t v20 = 2654435761 * self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v20 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_20:
    uint64_t v21 = 2654435761 * self->_itemPendingScanningProviderNumberOfChildren;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_21:
    uint64_t v22 = 2654435761 * self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_22;
    }
LABEL_44:
    uint64_t v23 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_23;
    }
LABEL_45:
    uint64_t v24 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_43:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x8000) == 0) {
    goto LABEL_44;
  }
LABEL_22:
  uint64_t v23 = 2654435761 * self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_45;
  }
LABEL_23:
  uint64_t v24 = 2654435761 * self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x40000) != 0)
  {
    self->_itemPendingReconciliationIsLocked = *((unsigned char *)v4 + 152);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v5 = *((_DWORD *)v4 + 39);
    if ((v5 & 0x80000) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  self->_itemPendingReconciliationIsLockedInDB = *((unsigned char *)v4 + 153);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_itemPendingReconciliationJobCode = *((void *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_itemPendingReconciliationJobSchedulingState = *((void *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_itemPendingReconciliationJobBlockingCode = *((void *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_itemPendingScanningDiskEnumerationStatus = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x100000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_itemPendingScanningDiskHasMultiplePagesEnumeration = *((unsigned char *)v4 + 154);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = *((void *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = *((void *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = *((void *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = *((void *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = *((void *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = *((void *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x200) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = *((void *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x80) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = *((void *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_itemPendingScanningDiskNumberOfChildrenPendingRejection = *((void *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x2000) == 0)
  {
LABEL_18:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_itemPendingScanningProviderEnumerationStatus = *((void *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x200000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_itemPendingScanningProviderHasMultiplePagesEnumeration = *((unsigned char *)v4 + 155);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x4000) == 0)
  {
LABEL_20:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_itemPendingScanningProviderNumberOfChildren = *((void *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x10000) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_itemPendingScanningProviderNumberOfChildrenPendingCreation = *((void *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x8000) == 0)
  {
LABEL_22:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_47:
  self->_itemPendingScanningProviderNumberOfChildrenFailingCreation = *((void *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v4 + 39) & 0x20000) != 0)
  {
LABEL_23:
    self->_itemPendingScanningProviderRemovalOfDatalessBitStatus = *((void *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_24:
}

- (BOOL)itemPendingReconciliationIsLocked
{
  return self->_itemPendingReconciliationIsLocked;
}

- (BOOL)itemPendingReconciliationIsLockedInDB
{
  return self->_itemPendingReconciliationIsLockedInDB;
}

- (int64_t)itemPendingReconciliationJobCode
{
  return self->_itemPendingReconciliationJobCode;
}

- (int64_t)itemPendingReconciliationJobSchedulingState
{
  return self->_itemPendingReconciliationJobSchedulingState;
}

- (int64_t)itemPendingReconciliationJobBlockingCode
{
  return self->_itemPendingReconciliationJobBlockingCode;
}

- (int64_t)itemPendingScanningDiskEnumerationStatus
{
  return self->_itemPendingScanningDiskEnumerationStatus;
}

- (BOOL)itemPendingScanningDiskHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUp
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDown
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingRejection
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
}

- (int64_t)itemPendingScanningProviderEnumerationStatus
{
  return self->_itemPendingScanningProviderEnumerationStatus;
}

- (BOOL)itemPendingScanningProviderHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
}

- (int64_t)itemPendingScanningProviderNumberOfChildren
{
  return self->_itemPendingScanningProviderNumberOfChildren;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenPendingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenFailingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
}

- (int64_t)itemPendingScanningProviderRemovalOfDatalessBitStatus
{
  return self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
}

@end