@interface AppTelemetryFPFSMigrationInvestigation
- (BOOL)hasAccountQuotaUsage;
- (BOOL)hasBouncedItemsCount;
- (BOOL)hasBouncedItemsMatrix;
- (BOOL)hasBusyDateNotMigratedCount;
- (BOOL)hasChildItemsNotMigratedCount;
- (BOOL)hasDurationBetweenDbCreationAndMigrationStart;
- (BOOL)hasExperimentId;
- (BOOL)hasIgnoredFromSyncItemsNotMigratedCount;
- (BOOL)hasImportTime;
- (BOOL)hasIsAccountDataSeparated;
- (BOOL)hasIsStreamResetRunning;
- (BOOL)hasIsSuccessful;
- (BOOL)hasItemsMigratedWithoutAlreadyMayExistFlag;
- (BOOL)hasItemsNotFoundInDB;
- (BOOL)hasItemsNotMigratedCount;
- (BOOL)hasItemsNotMigratedDelta;
- (BOOL)hasItemsReconciledInFileProvider;
- (BOOL)hasItemsReconciledInFileProviderDelta;
- (BOOL)hasNumberOfItemsPendingReconciliation;
- (BOOL)hasNumberOfItemsPendingScanningDisk;
- (BOOL)hasNumberOfItemsPendingScanningProvider;
- (BOOL)hasNumberOfItemsPendingSelection;
- (BOOL)hasRampId;
- (BOOL)hasStateOfDownloadJobs;
- (BOOL)hasStateOfOtherJobs;
- (BOOL)hasStateOfUploadJobs;
- (BOOL)hasTotalItemCount;
- (BOOL)hasTreatmentId;
- (BOOL)hasTypesOfMigratedItemsMask;
- (BOOL)hasTypesOfNonMigratedItemsMask;
- (BOOL)hasXpcActivityDasdContext;
- (BOOL)hasXpcActivityIsActive;
- (BOOL)hasXpcActivityRegisteredWithDuet;
- (BOOL)hasXpcActivityTimeSinceLastAbleToRun;
- (BOOL)hasXpcActivityTimeSinceLastActivation;
- (BOOL)hasXpcActivityTimeSinceLastRegistration;
- (BOOL)isAccountDataSeparated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStreamResetRunning;
- (BOOL)isSuccessful;
- (BOOL)readFrom:(id)a3;
- (BOOL)xpcActivityIsActive;
- (BOOL)xpcActivityRegisteredWithDuet;
- (NSString)experimentId;
- (NSString)rampId;
- (NSString)treatmentId;
- (double)importTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)typesOfMigratedItemsMask;
- (int)typesOfNonMigratedItemsMask;
- (int64_t)accountQuotaUsage;
- (int64_t)bouncedItemsCount;
- (int64_t)bouncedItemsMatrix;
- (int64_t)busyDateNotMigratedCount;
- (int64_t)childItemsNotMigratedCount;
- (int64_t)durationBetweenDbCreationAndMigrationStart;
- (int64_t)ignoredFromSyncItemsNotMigratedCount;
- (int64_t)itemsMigratedWithoutAlreadyMayExistFlag;
- (int64_t)itemsNotFoundInDB;
- (int64_t)itemsNotMigratedCount;
- (int64_t)itemsNotMigratedDelta;
- (int64_t)itemsReconciledInFileProvider;
- (int64_t)itemsReconciledInFileProviderDelta;
- (int64_t)numberOfItemsPendingReconciliation;
- (int64_t)numberOfItemsPendingScanningDisk;
- (int64_t)numberOfItemsPendingScanningProvider;
- (int64_t)numberOfItemsPendingSelection;
- (int64_t)stateOfDownloadJobs;
- (int64_t)stateOfOtherJobs;
- (int64_t)stateOfUploadJobs;
- (int64_t)totalItemCount;
- (int64_t)xpcActivityDasdContext;
- (int64_t)xpcActivityTimeSinceLastAbleToRun;
- (int64_t)xpcActivityTimeSinceLastActivation;
- (int64_t)xpcActivityTimeSinceLastRegistration;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountQuotaUsage:(int64_t)a3;
- (void)setBouncedItemsCount:(int64_t)a3;
- (void)setBouncedItemsMatrix:(int64_t)a3;
- (void)setBusyDateNotMigratedCount:(int64_t)a3;
- (void)setChildItemsNotMigratedCount:(int64_t)a3;
- (void)setDurationBetweenDbCreationAndMigrationStart:(int64_t)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasAccountQuotaUsage:(BOOL)a3;
- (void)setHasBouncedItemsCount:(BOOL)a3;
- (void)setHasBouncedItemsMatrix:(BOOL)a3;
- (void)setHasBusyDateNotMigratedCount:(BOOL)a3;
- (void)setHasChildItemsNotMigratedCount:(BOOL)a3;
- (void)setHasDurationBetweenDbCreationAndMigrationStart:(BOOL)a3;
- (void)setHasIgnoredFromSyncItemsNotMigratedCount:(BOOL)a3;
- (void)setHasImportTime:(BOOL)a3;
- (void)setHasIsAccountDataSeparated:(BOOL)a3;
- (void)setHasIsStreamResetRunning:(BOOL)a3;
- (void)setHasIsSuccessful:(BOOL)a3;
- (void)setHasItemsMigratedWithoutAlreadyMayExistFlag:(BOOL)a3;
- (void)setHasItemsNotFoundInDB:(BOOL)a3;
- (void)setHasItemsNotMigratedCount:(BOOL)a3;
- (void)setHasItemsNotMigratedDelta:(BOOL)a3;
- (void)setHasItemsReconciledInFileProvider:(BOOL)a3;
- (void)setHasItemsReconciledInFileProviderDelta:(BOOL)a3;
- (void)setHasNumberOfItemsPendingReconciliation:(BOOL)a3;
- (void)setHasNumberOfItemsPendingScanningDisk:(BOOL)a3;
- (void)setHasNumberOfItemsPendingScanningProvider:(BOOL)a3;
- (void)setHasNumberOfItemsPendingSelection:(BOOL)a3;
- (void)setHasStateOfDownloadJobs:(BOOL)a3;
- (void)setHasStateOfOtherJobs:(BOOL)a3;
- (void)setHasStateOfUploadJobs:(BOOL)a3;
- (void)setHasTotalItemCount:(BOOL)a3;
- (void)setHasTypesOfMigratedItemsMask:(BOOL)a3;
- (void)setHasTypesOfNonMigratedItemsMask:(BOOL)a3;
- (void)setHasXpcActivityDasdContext:(BOOL)a3;
- (void)setHasXpcActivityIsActive:(BOOL)a3;
- (void)setHasXpcActivityRegisteredWithDuet:(BOOL)a3;
- (void)setHasXpcActivityTimeSinceLastAbleToRun:(BOOL)a3;
- (void)setHasXpcActivityTimeSinceLastActivation:(BOOL)a3;
- (void)setHasXpcActivityTimeSinceLastRegistration:(BOOL)a3;
- (void)setIgnoredFromSyncItemsNotMigratedCount:(int64_t)a3;
- (void)setImportTime:(double)a3;
- (void)setIsAccountDataSeparated:(BOOL)a3;
- (void)setIsStreamResetRunning:(BOOL)a3;
- (void)setIsSuccessful:(BOOL)a3;
- (void)setItemsMigratedWithoutAlreadyMayExistFlag:(int64_t)a3;
- (void)setItemsNotFoundInDB:(int64_t)a3;
- (void)setItemsNotMigratedCount:(int64_t)a3;
- (void)setItemsNotMigratedDelta:(int64_t)a3;
- (void)setItemsReconciledInFileProvider:(int64_t)a3;
- (void)setItemsReconciledInFileProviderDelta:(int64_t)a3;
- (void)setNumberOfItemsPendingReconciliation:(int64_t)a3;
- (void)setNumberOfItemsPendingScanningDisk:(int64_t)a3;
- (void)setNumberOfItemsPendingScanningProvider:(int64_t)a3;
- (void)setNumberOfItemsPendingSelection:(int64_t)a3;
- (void)setRampId:(id)a3;
- (void)setStateOfDownloadJobs:(int64_t)a3;
- (void)setStateOfOtherJobs:(int64_t)a3;
- (void)setStateOfUploadJobs:(int64_t)a3;
- (void)setTotalItemCount:(int64_t)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTypesOfMigratedItemsMask:(int)a3;
- (void)setTypesOfNonMigratedItemsMask:(int)a3;
- (void)setXpcActivityDasdContext:(int64_t)a3;
- (void)setXpcActivityIsActive:(BOOL)a3;
- (void)setXpcActivityRegisteredWithDuet:(BOOL)a3;
- (void)setXpcActivityTimeSinceLastAbleToRun:(int64_t)a3;
- (void)setXpcActivityTimeSinceLastActivation:(int64_t)a3;
- (void)setXpcActivityTimeSinceLastRegistration:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AppTelemetryFPFSMigrationInvestigation

- (void)setIsSuccessful:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_isSuccessful = a3;
}

- (void)setHasIsSuccessful:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsSuccessful
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setItemsNotMigratedCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_itemsNotMigratedCount = a3;
}

- (void)setHasItemsNotMigratedCount:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasItemsNotMigratedCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTotalItemCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_totalItemCount = a3;
}

- (void)setHasTotalItemCount:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTotalItemCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setAccountQuotaUsage:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_accountQuotaUsage = a3;
}

- (void)setHasAccountQuotaUsage:(BOOL)a3
{
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAccountQuotaUsage
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsAccountDataSeparated:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_isAccountDataSeparated = a3;
}

- (void)setHasIsAccountDataSeparated:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsAccountDataSeparated
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setImportTime:(double)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_importTime = a3;
}

- (void)setHasImportTime:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasImportTime
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTypesOfMigratedItemsMask:(int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_typesOfMigratedItemsMask = a3;
}

- (void)setHasTypesOfMigratedItemsMask:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasTypesOfMigratedItemsMask
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTypesOfNonMigratedItemsMask:(int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_typesOfNonMigratedItemsMask = a3;
}

- (void)setHasTypesOfNonMigratedItemsMask:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasTypesOfNonMigratedItemsMask
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setItemsNotFoundInDB:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_itemsNotFoundInDB = a3;
}

- (void)setHasItemsNotFoundInDB:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasItemsNotFoundInDB
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBouncedItemsCount:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_bouncedItemsCount = a3;
}

- (void)setHasBouncedItemsCount:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBouncedItemsCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBouncedItemsMatrix:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_bouncedItemsMatrix = a3;
}

- (void)setHasBouncedItemsMatrix:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBouncedItemsMatrix
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTreatmentId
{
  return self->_treatmentId != 0;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (BOOL)hasRampId
{
  return self->_rampId != 0;
}

- (void)setBusyDateNotMigratedCount:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_busyDateNotMigratedCount = a3;
}

- (void)setHasBusyDateNotMigratedCount:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBusyDateNotMigratedCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setChildItemsNotMigratedCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_childItemsNotMigratedCount = a3;
}

- (void)setHasChildItemsNotMigratedCount:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasChildItemsNotMigratedCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIgnoredFromSyncItemsNotMigratedCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_ignoredFromSyncItemsNotMigratedCount = a3;
}

- (void)setHasIgnoredFromSyncItemsNotMigratedCount:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasIgnoredFromSyncItemsNotMigratedCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setItemsReconciledInFileProvider:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_itemsReconciledInFileProvider = a3;
}

- (void)setHasItemsReconciledInFileProvider:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasItemsReconciledInFileProvider
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setItemsMigratedWithoutAlreadyMayExistFlag:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_itemsMigratedWithoutAlreadyMayExistFlag = a3;
}

- (void)setHasItemsMigratedWithoutAlreadyMayExistFlag:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasItemsMigratedWithoutAlreadyMayExistFlag
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setDurationBetweenDbCreationAndMigrationStart:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_durationBetweenDbCreationAndMigrationStart = a3;
}

- (void)setHasDurationBetweenDbCreationAndMigrationStart:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDurationBetweenDbCreationAndMigrationStart
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsStreamResetRunning:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_isStreamResetRunning = a3;
}

- (void)setHasIsStreamResetRunning:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsStreamResetRunning
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setStateOfDownloadJobs:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_stateOfDownloadJobs = a3;
}

- (void)setHasStateOfDownloadJobs:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasStateOfDownloadJobs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setStateOfUploadJobs:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_stateOfUploadJobs = a3;
}

- (void)setHasStateOfUploadJobs:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasStateOfUploadJobs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setStateOfOtherJobs:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_stateOfOtherJobs = a3;
}

- (void)setHasStateOfOtherJobs:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasStateOfOtherJobs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNumberOfItemsPendingReconciliation:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_numberOfItemsPendingReconciliation = a3;
}

- (void)setHasNumberOfItemsPendingReconciliation:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingReconciliation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setNumberOfItemsPendingSelection:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_numberOfItemsPendingSelection = a3;
}

- (void)setHasNumberOfItemsPendingSelection:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingSelection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNumberOfItemsPendingScanningDisk:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_numberOfItemsPendingScanningDisk = a3;
}

- (void)setHasNumberOfItemsPendingScanningDisk:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingScanningDisk
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumberOfItemsPendingScanningProvider:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_numberOfItemsPendingScanningProvider = a3;
}

- (void)setHasNumberOfItemsPendingScanningProvider:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasNumberOfItemsPendingScanningProvider
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setXpcActivityRegisteredWithDuet:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_xpcActivityRegisteredWithDuet = a3;
}

- (void)setHasXpcActivityRegisteredWithDuet:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityRegisteredWithDuet
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setXpcActivityTimeSinceLastRegistration:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_xpcActivityTimeSinceLastRegistration = a3;
}

- (void)setHasXpcActivityTimeSinceLastRegistration:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityTimeSinceLastRegistration
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setXpcActivityIsActive:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_xpcActivityIsActive = a3;
}

- (void)setHasXpcActivityIsActive:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityIsActive
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setXpcActivityTimeSinceLastActivation:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_xpcActivityTimeSinceLastActivation = a3;
}

- (void)setHasXpcActivityTimeSinceLastActivation:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasXpcActivityTimeSinceLastActivation
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setXpcActivityDasdContext:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_xpcActivityDasdContext = a3;
}

- (void)setHasXpcActivityDasdContext:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasXpcActivityDasdContext
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setItemsNotMigratedDelta:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_itemsNotMigratedDelta = a3;
}

- (void)setHasItemsNotMigratedDelta:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasItemsNotMigratedDelta
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setItemsReconciledInFileProviderDelta:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_itemsReconciledInFileProviderDelta = a3;
}

- (void)setHasItemsReconciledInFileProviderDelta:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasItemsReconciledInFileProviderDelta
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setXpcActivityTimeSinceLastAbleToRun:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_xpcActivityTimeSinceLastAbleToRun = a3;
}

- (void)setHasXpcActivityTimeSinceLastAbleToRun:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($03CFB5B8B6ED84BF2F9A3941B0FD4455)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasXpcActivityTimeSinceLastAbleToRun
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryFPFSMigrationInvestigation;
  v4 = [(AppTelemetryFPFSMigrationInvestigation *)&v8 description];
  v5 = [(AppTelemetryFPFSMigrationInvestigation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    v13 = [NSNumber numberWithBool:self->_isSuccessful];
    [v3 setObject:v13 forKey:@"isSuccessful"];

    $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v14 = [NSNumber numberWithLongLong:self->_itemsNotMigratedCount];
  [v3 setObject:v14 forKey:@"itemsNotMigratedCount"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_46;
  }
LABEL_45:
  v15 = [NSNumber numberWithLongLong:self->_totalItemCount];
  [v3 setObject:v15 forKey:@"totalItemCount"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_47;
  }
LABEL_46:
  v16 = [NSNumber numberWithLongLong:self->_accountQuotaUsage];
  [v3 setObject:v16 forKey:@"accountQuotaUsage"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_48;
  }
LABEL_47:
  v17 = [NSNumber numberWithBool:self->_isAccountDataSeparated];
  [v3 setObject:v17 forKey:@"isAccountDataSeparated"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_49;
  }
LABEL_48:
  v18 = [NSNumber numberWithDouble:self->_importTime];
  [v3 setObject:v18 forKey:@"importTime"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_50;
  }
LABEL_49:
  v19 = [NSNumber numberWithInt:self->_typesOfMigratedItemsMask];
  [v3 setObject:v19 forKey:@"typesOfMigratedItemsMask"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_51;
  }
LABEL_50:
  v20 = [NSNumber numberWithInt:self->_typesOfNonMigratedItemsMask];
  [v3 setObject:v20 forKey:@"typesOfNonMigratedItemsMask"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_52;
  }
LABEL_51:
  v21 = [NSNumber numberWithLongLong:self->_itemsNotFoundInDB];
  [v3 setObject:v21 forKey:@"itemsNotFoundInDB"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_52:
  v22 = [NSNumber numberWithLongLong:self->_bouncedItemsCount];
  [v3 setObject:v22 forKey:@"bouncedItemsCount"];

  if ((*(void *)&self->_has & 4) != 0)
  {
LABEL_12:
    v5 = [NSNumber numberWithLongLong:self->_bouncedItemsMatrix];
    [v3 setObject:v5 forKey:@"bouncedItemsMatrix"];
  }
LABEL_13:
  treatmentId = self->_treatmentId;
  if (treatmentId) {
    [v3 setObject:treatmentId forKey:@"treatmentId"];
  }
  experimentId = self->_experimentId;
  if (experimentId) {
    [v3 setObject:experimentId forKey:@"experimentId"];
  }
  rampId = self->_rampId;
  if (rampId) {
    [v3 setObject:rampId forKey:@"rampId"];
  }
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) != 0)
  {
    v23 = [NSNumber numberWithLongLong:self->_busyDateNotMigratedCount];
    [v3 setObject:v23 forKey:@"busyDateNotMigratedCount"];

    $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
    if ((*(unsigned char *)&v9 & 0x10) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v9 & 0x40) == 0) {
        goto LABEL_22;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&v9 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  v24 = [NSNumber numberWithLongLong:self->_childItemsNotMigratedCount];
  [v3 setObject:v24 forKey:@"childItemsNotMigratedCount"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v9 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_57;
  }
LABEL_56:
  v25 = [NSNumber numberWithLongLong:self->_ignoredFromSyncItemsNotMigratedCount];
  [v3 setObject:v25 forKey:@"ignoredFromSyncItemsNotMigratedCount"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v9 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_58;
  }
LABEL_57:
  v26 = [NSNumber numberWithLongLong:self->_itemsReconciledInFileProvider];
  [v3 setObject:v26 forKey:@"itemsReconciledInFileProvider"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v9 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_59;
  }
LABEL_58:
  v27 = [NSNumber numberWithLongLong:self->_itemsMigratedWithoutAlreadyMayExistFlag];
  [v3 setObject:v27 forKey:@"itemsMigratedWithoutAlreadyMayExistFlag"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_60;
  }
LABEL_59:
  v28 = [NSNumber numberWithLongLong:self->_durationBetweenDbCreationAndMigrationStart];
  [v3 setObject:v28 forKey:@"durationBetweenDbCreationAndMigrationStart"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
LABEL_60:
  v29 = [NSNumber numberWithBool:self->_isStreamResetRunning];
  [v3 setObject:v29 forKey:@"isStreamResetRunning"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_61:
  v30 = [NSNumber numberWithLongLong:self->_stateOfDownloadJobs];
  [v3 setObject:v30 forKey:@"stateOfDownloadJobs"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_62:
  v31 = [NSNumber numberWithLongLong:self->_stateOfUploadJobs];
  [v3 setObject:v31 forKey:@"stateOfUploadJobs"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v9 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  v32 = [NSNumber numberWithLongLong:self->_stateOfOtherJobs];
  [v3 setObject:v32 forKey:@"stateOfOtherJobs"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  v33 = [NSNumber numberWithLongLong:self->_numberOfItemsPendingReconciliation];
  [v3 setObject:v33 forKey:@"numberOfItemsPendingReconciliation"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_66;
  }
LABEL_65:
  v34 = [NSNumber numberWithLongLong:self->_numberOfItemsPendingSelection];
  [v3 setObject:v34 forKey:@"numberOfItemsPendingSelection"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v9 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_67;
  }
LABEL_66:
  v35 = [NSNumber numberWithLongLong:self->_numberOfItemsPendingScanningDisk];
  [v3 setObject:v35 forKey:@"numberOfItemsPendingScanningDisk"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(void *)&v9 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_68;
  }
LABEL_67:
  v36 = [NSNumber numberWithLongLong:self->_numberOfItemsPendingScanningProvider];
  [v3 setObject:v36 forKey:@"numberOfItemsPendingScanningProvider"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(void *)&v9 & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_69;
  }
LABEL_68:
  v37 = [NSNumber numberWithBool:self->_xpcActivityRegisteredWithDuet];
  [v3 setObject:v37 forKey:@"xpcActivityRegisteredWithDuet"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v9 & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_70;
  }
LABEL_69:
  v38 = [NSNumber numberWithLongLong:self->_xpcActivityTimeSinceLastRegistration];
  [v3 setObject:v38 forKey:@"xpcActivityTimeSinceLastRegistration"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_71;
  }
LABEL_70:
  v39 = [NSNumber numberWithBool:self->_xpcActivityIsActive];
  [v3 setObject:v39 forKey:@"xpcActivityIsActive"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v9 & 0x400000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_72;
  }
LABEL_71:
  v40 = [NSNumber numberWithLongLong:self->_xpcActivityTimeSinceLastActivation];
  [v3 setObject:v40 forKey:@"xpcActivityTimeSinceLastActivation"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v9 & 0x800) == 0) {
      goto LABEL_39;
    }
    goto LABEL_73;
  }
LABEL_72:
  v41 = [NSNumber numberWithLongLong:self->_xpcActivityDasdContext];
  [v3 setObject:v41 forKey:@"xpcActivityDasdContext"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_40;
    }
LABEL_74:
    v43 = [NSNumber numberWithLongLong:self->_itemsReconciledInFileProviderDelta];
    [v3 setObject:v43 forKey:@"itemsReconciledInFileProviderDelta"];

    if ((*(void *)&self->_has & 0x800000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_73:
  v42 = [NSNumber numberWithLongLong:self->_itemsNotMigratedDelta];
  [v3 setObject:v42 forKey:@"itemsNotMigratedDelta"];

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) != 0) {
    goto LABEL_74;
  }
LABEL_40:
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
LABEL_41:
    v10 = [NSNumber numberWithLongLong:self->_xpcActivityTimeSinceLastAbleToRun];
    [v3 setObject:v10 forKey:@"xpcActivityTimeSinceLastAbleToRun"];
  }
LABEL_42:
  id v11 = v3;

  return v11;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryFPFSMigrationInvestigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_54:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 4) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt64Field();
LABEL_13:
  if (self->_treatmentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_experimentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_rampId) {
    PBDataWriterWriteStringField();
  }
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
    if ((*(unsigned char *)&v5 & 0x10) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v5 & 0x40) == 0) {
        goto LABEL_22;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v5 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v5 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v5 & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v5 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v5 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(void *)&v5 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(void *)&v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v5 & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v5 & 0x400000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v5 & 0x800) == 0) {
      goto LABEL_39;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt64Field();
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v5 & 0x800000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_76:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x800000) != 0) {
LABEL_41:
  }
    PBDataWriterWriteInt64Field();
LABEL_42:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    v4[250] = self->_isSuccessful;
    *((void *)v4 + 32) |= 0x40000000uLL;
    $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 11) = self->_itemsNotMigratedCount;
  *((void *)v4 + 32) |= 0x400uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)v4 + 22) = self->_totalItemCount;
  *((void *)v4 + 32) |= 0x200000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v4 + 1) = self->_accountQuotaUsage;
  *((void *)v4 + 32) |= 1uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  v4[248] = self->_isAccountDataSeparated;
  *((void *)v4 + 32) |= 0x10000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)v4 + 8) = *(void *)&self->_importTime;
  *((void *)v4 + 32) |= 0x80uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 60) = self->_typesOfMigratedItemsMask;
  *((void *)v4 + 32) |= 0x4000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 61) = self->_typesOfNonMigratedItemsMask;
  *((void *)v4 + 32) |= 0x8000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)v4 + 10) = self->_itemsNotFoundInDB;
  *((void *)v4 + 32) |= 0x200uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_54:
  *((void *)v4 + 2) = self->_bouncedItemsCount;
  *((void *)v4 + 32) |= 2uLL;
  if ((*(void *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((void *)v4 + 3) = self->_bouncedItemsMatrix;
    *((void *)v4 + 32) |= 4uLL;
  }
LABEL_13:
  v7 = v4;
  if (self->_treatmentId)
  {
    objc_msgSend(v4, "setTreatmentId:");
    v4 = v7;
  }
  if (self->_experimentId)
  {
    objc_msgSend(v7, "setExperimentId:");
    v4 = v7;
  }
  if (self->_rampId)
  {
    objc_msgSend(v7, "setRampId:");
    v4 = v7;
  }
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
    *((void *)v4 + 4) = self->_busyDateNotMigratedCount;
    *((void *)v4 + 32) |= 8uLL;
    $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x10) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v6 & 0x40) == 0) {
        goto LABEL_22;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  *((void *)v4 + 5) = self->_childItemsNotMigratedCount;
  *((void *)v4 + 32) |= 0x10uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)v4 + 7) = self->_ignoredFromSyncItemsNotMigratedCount;
  *((void *)v4 + 32) |= 0x40uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)v4 + 13) = self->_itemsReconciledInFileProvider;
  *((void *)v4 + 32) |= 0x1000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)v4 + 9) = self->_itemsMigratedWithoutAlreadyMayExistFlag;
  *((void *)v4 + 32) |= 0x100uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)v4 + 6) = self->_durationBetweenDbCreationAndMigrationStart;
  *((void *)v4 + 32) |= 0x20uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
LABEL_62:
  v4[249] = self->_isStreamResetRunning;
  *((void *)v4 + 32) |= 0x20000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)v4 + 19) = self->_stateOfDownloadJobs;
  *((void *)v4 + 32) |= 0x40000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)v4 + 21) = self->_stateOfUploadJobs;
  *((void *)v4 + 32) |= 0x100000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)v4 + 20) = self->_stateOfOtherJobs;
  *((void *)v4 + 32) |= 0x80000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)v4 + 15) = self->_numberOfItemsPendingReconciliation;
  *((void *)v4 + 32) |= 0x4000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)v4 + 18) = self->_numberOfItemsPendingSelection;
  *((void *)v4 + 32) |= 0x20000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)v4 + 16) = self->_numberOfItemsPendingScanningDisk;
  *((void *)v4 + 32) |= 0x8000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(void *)&v6 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)v4 + 17) = self->_numberOfItemsPendingScanningProvider;
  *((void *)v4 + 32) |= 0x10000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_71;
  }
LABEL_70:
  v4[252] = self->_xpcActivityRegisteredWithDuet;
  *((void *)v4 + 32) |= 0x100000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)v4 + 26) = self->_xpcActivityTimeSinceLastRegistration;
  *((void *)v4 + 32) |= 0x2000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_73;
  }
LABEL_72:
  v4[251] = self->_xpcActivityIsActive;
  *((void *)v4 + 32) |= 0x80000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)v4 + 25) = self->_xpcActivityTimeSinceLastActivation;
  *((void *)v4 + 32) |= 0x1000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_39;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)v4 + 23) = self->_xpcActivityDasdContext;
  *((void *)v4 + 32) |= 0x400000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)v4 + 12) = self->_itemsNotMigratedDelta;
  *((void *)v4 + 32) |= 0x800uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_76:
  *((void *)v4 + 14) = self->_itemsReconciledInFileProviderDelta;
  *((void *)v4 + 32) |= 0x2000uLL;
  if ((*(void *)&self->_has & 0x800000) != 0)
  {
LABEL_41:
    *((void *)v4 + 24) = self->_xpcActivityTimeSinceLastAbleToRun;
    *((void *)v4 + 32) |= 0x800000uLL;
  }
LABEL_42:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    *(unsigned char *)(v5 + 250) = self->_isSuccessful;
    *(void *)(v5 + 256) |= 0x40000000uLL;
    $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 88) = self->_itemsNotMigratedCount;
  *(void *)(v5 + 256) |= 0x400uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(void *)(v5 + 176) = self->_totalItemCount;
  *(void *)(v5 + 256) |= 0x200000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(void *)(v5 + 8) = self->_accountQuotaUsage;
  *(void *)(v5 + 256) |= 1uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(unsigned char *)(v5 + 248) = self->_isAccountDataSeparated;
  *(void *)(v5 + 256) |= 0x10000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(double *)(v5 + 64) = self->_importTime;
  *(void *)(v5 + 256) |= 0x80uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 240) = self->_typesOfMigratedItemsMask;
  *(void *)(v5 + 256) |= 0x4000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 244) = self->_typesOfNonMigratedItemsMask;
  *(void *)(v5 + 256) |= 0x8000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(void *)(v5 + 80) = self->_itemsNotFoundInDB;
  *(void *)(v5 + 256) |= 0x200uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_46:
  *(void *)(v5 + 16) = self->_bouncedItemsCount;
  *(void *)(v5 + 256) |= 2uLL;
  if ((*(void *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(void *)(v5 + 24) = self->_bouncedItemsMatrix;
    *(void *)(v5 + 256) |= 4uLL;
  }
LABEL_13:
  uint64_t v8 = [(NSString *)self->_treatmentId copyWithZone:a3];
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v9 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v8;

  uint64_t v10 = [(NSString *)self->_experimentId copyWithZone:a3];
  id v11 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v10;

  uint64_t v12 = [(NSString *)self->_rampId copyWithZone:a3];
  v13 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v12;

  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_busyDateNotMigratedCount;
    *(void *)(v6 + 256) |= 8uLL;
    $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 0x10) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&v14 & 0x40) == 0) {
        goto LABEL_16;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&v14 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  *(void *)(v6 + 40) = self->_childItemsNotMigratedCount;
  *(void *)(v6 + 256) |= 0x10uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v14 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(void *)(v6 + 56) = self->_ignoredFromSyncItemsNotMigratedCount;
  *(void *)(v6 + 256) |= 0x40uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v14 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(void *)(v6 + 104) = self->_itemsReconciledInFileProvider;
  *(void *)(v6 + 256) |= 0x1000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v14 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(void *)(v6 + 72) = self->_itemsMigratedWithoutAlreadyMayExistFlag;
  *(void *)(v6 + 256) |= 0x100uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v14 & 0x20000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(void *)(v6 + 48) = self->_durationBetweenDbCreationAndMigrationStart;
  *(void *)(v6 + 256) |= 0x20uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(unsigned char *)(v6 + 249) = self->_isStreamResetRunning;
  *(void *)(v6 + 256) |= 0x20000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v14 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(void *)(v6 + 152) = self->_stateOfDownloadJobs;
  *(void *)(v6 + 256) |= 0x40000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(void *)(v6 + 168) = self->_stateOfUploadJobs;
  *(void *)(v6 + 256) |= 0x100000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(void *)(v6 + 160) = self->_stateOfOtherJobs;
  *(void *)(v6 + 256) |= 0x80000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v14 & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(void *)(v6 + 120) = self->_numberOfItemsPendingReconciliation;
  *(void *)(v6 + 256) |= 0x4000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v14 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(void *)(v6 + 144) = self->_numberOfItemsPendingSelection;
  *(void *)(v6 + 256) |= 0x20000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(void *)(v6 + 128) = self->_numberOfItemsPendingScanningDisk;
  *(void *)(v6 + 256) |= 0x8000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_27:
    if ((*(void *)&v14 & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(void *)(v6 + 136) = self->_numberOfItemsPendingScanningProvider;
  *(void *)(v6 + 256) |= 0x10000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(void *)&v14 & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(unsigned char *)(v6 + 252) = self->_xpcActivityRegisteredWithDuet;
  *(void *)(v6 + 256) |= 0x100000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v14 & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(void *)(v6 + 208) = self->_xpcActivityTimeSinceLastRegistration;
  *(void *)(v6 + 256) |= 0x2000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(unsigned char *)(v6 + 251) = self->_xpcActivityIsActive;
  *(void *)(v6 + 256) |= 0x80000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v14 & 0x400000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(void *)(v6 + 200) = self->_xpcActivityTimeSinceLastActivation;
  *(void *)(v6 + 256) |= 0x1000000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v14 & 0x800) == 0) {
      goto LABEL_33;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(void *)(v6 + 184) = self->_xpcActivityDasdContext;
  *(void *)(v6 + 256) |= 0x400000uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_34;
    }
LABEL_68:
    *(void *)(v6 + 112) = self->_itemsReconciledInFileProviderDelta;
    *(void *)(v6 + 256) |= 0x2000uLL;
    if ((*(void *)&self->_has & 0x800000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_67:
  *(void *)(v6 + 96) = self->_itemsNotMigratedDelta;
  *(void *)(v6 + 256) |= 0x800uLL;
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) != 0) {
    goto LABEL_68;
  }
LABEL_34:
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
LABEL_35:
    *(void *)(v6 + 192) = self->_xpcActivityTimeSinceLastAbleToRun;
    *(void *)(v6 + 256) |= 0x800000uLL;
  }
LABEL_36:
  id v15 = (id)v6;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_188;
  }
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  uint64_t v6 = *((void *)v4 + 32);
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_188;
    }
    if (self->_isSuccessful)
    {
      if (!*((unsigned char *)v4 + 250)) {
        goto LABEL_188;
      }
    }
    else if (*((unsigned char *)v4 + 250))
    {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_itemsNotMigratedCount != *((void *)v4 + 11)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_totalItemCount != *((void *)v4 + 22)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_188;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_accountQuotaUsage != *((void *)v4 + 1)) {
      goto LABEL_188;
    }
  }
  else if (v6)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_188;
    }
    if (self->_isAccountDataSeparated)
    {
      if (!*((unsigned char *)v4 + 248)) {
        goto LABEL_188;
      }
    }
    else if (*((unsigned char *)v4 + 248))
    {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_importTime != *((double *)v4 + 8)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_typesOfMigratedItemsMask != *((_DWORD *)v4 + 60)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_typesOfNonMigratedItemsMask != *((_DWORD *)v4 + 61)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_itemsNotFoundInDB != *((void *)v4 + 10)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_188;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bouncedItemsCount != *((void *)v4 + 2)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_188;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bouncedItemsMatrix != *((void *)v4 + 3)) {
      goto LABEL_188;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_188;
  }
  treatmentId = self->_treatmentId;
  if ((unint64_t)treatmentId | *((void *)v4 + 29)
    && !-[NSString isEqual:](treatmentId, "isEqual:"))
  {
    goto LABEL_188;
  }
  experimentId = self->_experimentId;
  if ((unint64_t)experimentId | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](experimentId, "isEqual:")) {
      goto LABEL_188;
    }
  }
  rampId = self->_rampId;
  if ((unint64_t)rampId | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](rampId, "isEqual:")) {
      goto LABEL_188;
    }
  }
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v10 = self->_has;
  uint64_t v11 = *((void *)v4 + 32);
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_busyDateNotMigratedCount != *((void *)v4 + 4)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_188;
  }
  if ((*(unsigned char *)&v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_childItemsNotMigratedCount != *((void *)v4 + 5)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_188;
  }
  if ((*(unsigned char *)&v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_ignoredFromSyncItemsNotMigratedCount != *((void *)v4 + 7)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0 || self->_itemsReconciledInFileProvider != *((void *)v4 + 13)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_itemsMigratedWithoutAlreadyMayExistFlag != *((void *)v4 + 9)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_188;
  }
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_durationBetweenDbCreationAndMigrationStart != *((void *)v4 + 6)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x20000000) != 0)
  {
    if ((v11 & 0x20000000) == 0) {
      goto LABEL_188;
    }
    if (self->_isStreamResetRunning)
    {
      if (!*((unsigned char *)v4 + 249)) {
        goto LABEL_188;
      }
    }
    else if (*((unsigned char *)v4 + 249))
    {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x20000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0 || self->_stateOfDownloadJobs != *((void *)v4 + 19)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    if ((v11 & 0x100000) == 0 || self->_stateOfUploadJobs != *((void *)v4 + 21)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x100000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v11 & 0x80000) == 0 || self->_stateOfOtherJobs != *((void *)v4 + 20)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x80000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_numberOfItemsPendingReconciliation != *((void *)v4 + 15)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_numberOfItemsPendingSelection != *((void *)v4 + 18)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_numberOfItemsPendingScanningDisk != *((void *)v4 + 16)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_numberOfItemsPendingScanningProvider != *((void *)v4 + 17)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(void *)&v10 & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0) {
      goto LABEL_188;
    }
    if (self->_xpcActivityRegisteredWithDuet)
    {
      if (!*((unsigned char *)v4 + 252)) {
        goto LABEL_188;
      }
    }
    else if (*((unsigned char *)v4 + 252))
    {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x2000000) != 0)
  {
    if ((v11 & 0x2000000) == 0 || self->_xpcActivityTimeSinceLastRegistration != *((void *)v4 + 26)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x2000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x80000000) != 0)
  {
    if ((v11 & 0x80000000) != 0)
    {
      if (self->_xpcActivityIsActive)
      {
        if (!*((unsigned char *)v4 + 251)) {
          goto LABEL_188;
        }
        goto LABEL_163;
      }
      if (!*((unsigned char *)v4 + 251)) {
        goto LABEL_163;
      }
    }
LABEL_188:
    BOOL v12 = 0;
    goto LABEL_189;
  }
  if ((v11 & 0x80000000) != 0) {
    goto LABEL_188;
  }
LABEL_163:
  if ((*(_DWORD *)&v10 & 0x1000000) != 0)
  {
    if ((v11 & 0x1000000) == 0 || self->_xpcActivityTimeSinceLastActivation != *((void *)v4 + 25)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x1000000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x400000) != 0)
  {
    if ((v11 & 0x400000) == 0 || self->_xpcActivityDasdContext != *((void *)v4 + 23)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x400000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_itemsNotMigratedDelta != *((void *)v4 + 12)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_itemsReconciledInFileProviderDelta != *((void *)v4 + 14)) {
      goto LABEL_188;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_188;
  }
  if ((*(_DWORD *)&v10 & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0 || self->_xpcActivityTimeSinceLastAbleToRun != *((void *)v4 + 24)) {
      goto LABEL_188;
    }
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = (v11 & 0x800000) == 0;
  }
LABEL_189:

  return v12;
}

- (unint64_t)hash
{
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    uint64_t v46 = 2654435761 * self->_isSuccessful;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v45 = 2654435761 * self->_itemsNotMigratedCount;
      if ((*(_DWORD *)&has & 0x200000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v46 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v45 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    uint64_t v44 = 2654435761 * self->_totalItemCount;
    if (*(unsigned char *)&has) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v44 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_5:
    uint64_t v43 = 2654435761 * self->_accountQuotaUsage;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v42 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v8 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v43 = 0;
  if ((*(_DWORD *)&has & 0x10000000) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v42 = 2654435761 * self->_isAccountDataSeparated;
  if ((*(unsigned char *)&has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double importTime = self->_importTime;
  double v5 = -importTime;
  if (importTime >= 0.0) {
    double v5 = self->_importTime;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_19:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    uint64_t v41 = 2654435761 * self->_typesOfMigratedItemsMask;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_21:
      uint64_t v40 = 2654435761 * self->_typesOfNonMigratedItemsMask;
      if ((*(_WORD *)&has & 0x200) != 0) {
        goto LABEL_22;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v41 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v40 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_22:
    uint64_t v39 = 2654435761 * self->_itemsNotFoundInDB;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_23;
    }
LABEL_28:
    uint64_t v38 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_24;
    }
    goto LABEL_29;
  }
LABEL_27:
  uint64_t v39 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_28;
  }
LABEL_23:
  uint64_t v38 = 2654435761 * self->_bouncedItemsCount;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_24:
    NSUInteger v9 = [(NSString *)self->_treatmentId hash];
    goto LABEL_30;
  }
LABEL_29:
  NSUInteger v9 = [(NSString *)self->_treatmentId hash];
LABEL_30:
  NSUInteger v10 = v9;
  NSUInteger v11 = [(NSString *)self->_experimentId hash];
  NSUInteger v12 = [(NSString *)self->_rampId hash];
  $03CFB5B8B6ED84BF2F9A3941B0FD4455 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    uint64_t v14 = 2654435761 * self->_busyDateNotMigratedCount;
    if ((*(unsigned char *)&v13 & 0x10) != 0)
    {
LABEL_32:
      uint64_t v15 = 2654435761 * self->_childItemsNotMigratedCount;
      if ((*(unsigned char *)&v13 & 0x40) != 0) {
        goto LABEL_33;
      }
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&v13 & 0x10) != 0) {
      goto LABEL_32;
    }
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
LABEL_33:
    uint64_t v16 = 2654435761 * self->_ignoredFromSyncItemsNotMigratedCount;
    if ((*(_WORD *)&v13 & 0x1000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v16 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_34:
    uint64_t v17 = 2654435761 * self->_itemsReconciledInFileProvider;
    if ((*(_WORD *)&v13 & 0x100) != 0) {
      goto LABEL_35;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v17 = 0;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_35:
    uint64_t v18 = 2654435761 * self->_itemsMigratedWithoutAlreadyMayExistFlag;
    if ((*(unsigned char *)&v13 & 0x20) != 0) {
      goto LABEL_36;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&v13 & 0x20) != 0)
  {
LABEL_36:
    uint64_t v19 = 2654435761 * self->_durationBetweenDbCreationAndMigrationStart;
    if ((*(_DWORD *)&v13 & 0x20000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
LABEL_37:
    uint64_t v20 = 2654435761 * self->_isStreamResetRunning;
    if ((*(_DWORD *)&v13 & 0x40000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
LABEL_38:
    uint64_t v21 = 2654435761 * self->_stateOfDownloadJobs;
    if ((*(_DWORD *)&v13 & 0x100000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
LABEL_39:
    uint64_t v22 = 2654435761 * self->_stateOfUploadJobs;
    if ((*(_DWORD *)&v13 & 0x80000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
LABEL_40:
    uint64_t v23 = 2654435761 * self->_stateOfOtherJobs;
    if ((*(_WORD *)&v13 & 0x4000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v23 = 0;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
LABEL_41:
    uint64_t v24 = 2654435761 * self->_numberOfItemsPendingReconciliation;
    if ((*(_DWORD *)&v13 & 0x20000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
LABEL_42:
    uint64_t v25 = 2654435761 * self->_numberOfItemsPendingSelection;
    if ((*(_WORD *)&v13 & 0x8000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v25 = 0;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
LABEL_43:
    uint64_t v26 = 2654435761 * self->_numberOfItemsPendingScanningDisk;
    if ((*(_DWORD *)&v13 & 0x10000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
LABEL_44:
    uint64_t v27 = 2654435761 * self->_numberOfItemsPendingScanningProvider;
    if ((*(void *)&v13 & 0x100000000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v27 = 0;
  if ((*(void *)&v13 & 0x100000000) != 0)
  {
LABEL_45:
    uint64_t v28 = 2654435761 * self->_xpcActivityRegisteredWithDuet;
    if ((*(_DWORD *)&v13 & 0x2000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
LABEL_46:
    uint64_t v29 = 2654435761 * self->_xpcActivityTimeSinceLastRegistration;
    if ((*(_DWORD *)&v13 & 0x80000000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&v13 & 0x80000000) != 0)
  {
LABEL_47:
    uint64_t v30 = 2654435761 * self->_xpcActivityIsActive;
    if ((*(_DWORD *)&v13 & 0x1000000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
LABEL_48:
    uint64_t v31 = 2654435761 * self->_xpcActivityTimeSinceLastActivation;
    if ((*(_DWORD *)&v13 & 0x400000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v13 & 0x400000) != 0)
  {
LABEL_49:
    uint64_t v32 = 2654435761 * self->_xpcActivityDasdContext;
    if ((*(_WORD *)&v13 & 0x800) != 0) {
      goto LABEL_50;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v32 = 0;
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
LABEL_50:
    uint64_t v33 = 2654435761 * self->_itemsNotMigratedDelta;
    if ((*(_WORD *)&v13 & 0x2000) != 0) {
      goto LABEL_51;
    }
LABEL_73:
    uint64_t v34 = 0;
    if ((*(_DWORD *)&v13 & 0x800000) != 0) {
      goto LABEL_52;
    }
LABEL_74:
    uint64_t v35 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v8 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35;
  }
LABEL_72:
  uint64_t v33 = 0;
  if ((*(_WORD *)&v13 & 0x2000) == 0) {
    goto LABEL_73;
  }
LABEL_51:
  uint64_t v34 = 2654435761 * self->_itemsReconciledInFileProviderDelta;
  if ((*(_DWORD *)&v13 & 0x800000) == 0) {
    goto LABEL_74;
  }
LABEL_52:
  uint64_t v35 = 2654435761 * self->_xpcActivityTimeSinceLastAbleToRun;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v8 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 0x40000000) != 0)
  {
    self->_isSuccessful = *((unsigned char *)v4 + 250);
    *(void *)&self->_has |= 0x40000000uLL;
    uint64_t v5 = *((void *)v4 + 32);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_itemsNotMigratedCount = *((void *)v4 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 0x200000) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_totalItemCount = *((void *)v4 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_accountQuotaUsage = *((void *)v4 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_isAccountDataSeparated = *((unsigned char *)v4 + 248);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_double importTime = *((double *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_typesOfMigratedItemsMask = *((_DWORD *)v4 + 60);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_typesOfNonMigratedItemsMask = *((_DWORD *)v4 + 61);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_itemsNotFoundInDB = *((void *)v4 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_54:
  self->_bouncedItemsCount = *((void *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  if ((*((void *)v4 + 32) & 4) != 0)
  {
LABEL_12:
    self->_bouncedItemsMatrix = *((void *)v4 + 3);
    *(void *)&self->_has |= 4uLL;
  }
LABEL_13:
  id v7 = v4;
  if (*((void *)v4 + 29))
  {
    -[AppTelemetryFPFSMigrationInvestigation setTreatmentId:](self, "setTreatmentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 27))
  {
    -[AppTelemetryFPFSMigrationInvestigation setExperimentId:](self, "setExperimentId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 28))
  {
    -[AppTelemetryFPFSMigrationInvestigation setRampId:](self, "setRampId:");
    id v4 = v7;
  }
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 8) != 0)
  {
    self->_busyDateNotMigratedCount = *((void *)v4 + 4);
    *(void *)&self->_has |= 8uLL;
    uint64_t v6 = *((void *)v4 + 32);
    if ((v6 & 0x10) == 0)
    {
LABEL_21:
      if ((v6 & 0x40) == 0) {
        goto LABEL_22;
      }
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  self->_childItemsNotMigratedCount = *((void *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x40) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_ignoredFromSyncItemsNotMigratedCount = *((void *)v4 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((v6 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_itemsReconciledInFileProvider = *((void *)v4 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_24:
    if ((v6 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_itemsMigratedWithoutAlreadyMayExistFlag = *((void *)v4 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x20) == 0)
  {
LABEL_25:
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_durationBetweenDbCreationAndMigrationStart = *((void *)v4 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_isStreamResetRunning = *((unsigned char *)v4 + 249);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_stateOfDownloadJobs = *((void *)v4 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x100000) == 0)
  {
LABEL_28:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_stateOfUploadJobs = *((void *)v4 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x80000) == 0)
  {
LABEL_29:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_stateOfOtherJobs = *((void *)v4 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_numberOfItemsPendingReconciliation = *((void *)v4 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_numberOfItemsPendingSelection = *((void *)v4 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x8000) == 0)
  {
LABEL_32:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_numberOfItemsPendingScanningDisk = *((void *)v4 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x10000) == 0)
  {
LABEL_33:
    if ((v6 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_numberOfItemsPendingScanningProvider = *((void *)v4 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_xpcActivityRegisteredWithDuet = *((unsigned char *)v4 + 252);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_xpcActivityTimeSinceLastRegistration = *((void *)v4 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_36:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_xpcActivityIsActive = *((unsigned char *)v4 + 251);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_37:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_xpcActivityTimeSinceLastActivation = *((void *)v4 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x400000) == 0)
  {
LABEL_38:
    if ((v6 & 0x800) == 0) {
      goto LABEL_39;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_xpcActivityDasdContext = *((void *)v4 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x800) == 0)
  {
LABEL_39:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_itemsNotMigratedDelta = *((void *)v4 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v6 = *((void *)v4 + 32);
  if ((v6 & 0x2000) == 0)
  {
LABEL_40:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_76:
  self->_itemsReconciledInFileProviderDelta = *((void *)v4 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  if ((*((void *)v4 + 32) & 0x800000) != 0)
  {
LABEL_41:
    self->_xpcActivityTimeSinceLastAbleToRun = *((void *)v4 + 24);
    *(void *)&self->_has |= 0x800000uLL;
  }
LABEL_42:
}

- (BOOL)isSuccessful
{
  return self->_isSuccessful;
}

- (int64_t)itemsNotMigratedCount
{
  return self->_itemsNotMigratedCount;
}

- (int64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (int64_t)accountQuotaUsage
{
  return self->_accountQuotaUsage;
}

- (BOOL)isAccountDataSeparated
{
  return self->_isAccountDataSeparated;
}

- (double)importTime
{
  return self->_importTime;
}

- (int)typesOfMigratedItemsMask
{
  return self->_typesOfMigratedItemsMask;
}

- (int)typesOfNonMigratedItemsMask
{
  return self->_typesOfNonMigratedItemsMask;
}

- (int64_t)itemsNotFoundInDB
{
  return self->_itemsNotFoundInDB;
}

- (int64_t)bouncedItemsCount
{
  return self->_bouncedItemsCount;
}

- (int64_t)bouncedItemsMatrix
{
  return self->_bouncedItemsMatrix;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)rampId
{
  return self->_rampId;
}

- (void)setRampId:(id)a3
{
}

- (int64_t)busyDateNotMigratedCount
{
  return self->_busyDateNotMigratedCount;
}

- (int64_t)childItemsNotMigratedCount
{
  return self->_childItemsNotMigratedCount;
}

- (int64_t)ignoredFromSyncItemsNotMigratedCount
{
  return self->_ignoredFromSyncItemsNotMigratedCount;
}

- (int64_t)itemsReconciledInFileProvider
{
  return self->_itemsReconciledInFileProvider;
}

- (int64_t)itemsMigratedWithoutAlreadyMayExistFlag
{
  return self->_itemsMigratedWithoutAlreadyMayExistFlag;
}

- (int64_t)durationBetweenDbCreationAndMigrationStart
{
  return self->_durationBetweenDbCreationAndMigrationStart;
}

- (BOOL)isStreamResetRunning
{
  return self->_isStreamResetRunning;
}

- (int64_t)stateOfDownloadJobs
{
  return self->_stateOfDownloadJobs;
}

- (int64_t)stateOfUploadJobs
{
  return self->_stateOfUploadJobs;
}

- (int64_t)stateOfOtherJobs
{
  return self->_stateOfOtherJobs;
}

- (int64_t)numberOfItemsPendingReconciliation
{
  return self->_numberOfItemsPendingReconciliation;
}

- (int64_t)numberOfItemsPendingSelection
{
  return self->_numberOfItemsPendingSelection;
}

- (int64_t)numberOfItemsPendingScanningDisk
{
  return self->_numberOfItemsPendingScanningDisk;
}

- (int64_t)numberOfItemsPendingScanningProvider
{
  return self->_numberOfItemsPendingScanningProvider;
}

- (BOOL)xpcActivityRegisteredWithDuet
{
  return self->_xpcActivityRegisteredWithDuet;
}

- (int64_t)xpcActivityTimeSinceLastRegistration
{
  return self->_xpcActivityTimeSinceLastRegistration;
}

- (BOOL)xpcActivityIsActive
{
  return self->_xpcActivityIsActive;
}

- (int64_t)xpcActivityTimeSinceLastActivation
{
  return self->_xpcActivityTimeSinceLastActivation;
}

- (int64_t)xpcActivityDasdContext
{
  return self->_xpcActivityDasdContext;
}

- (int64_t)itemsNotMigratedDelta
{
  return self->_itemsNotMigratedDelta;
}

- (int64_t)itemsReconciledInFileProviderDelta
{
  return self->_itemsReconciledInFileProviderDelta;
}

- (int64_t)xpcActivityTimeSinceLastAbleToRun
{
  return self->_xpcActivityTimeSinceLastAbleToRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end