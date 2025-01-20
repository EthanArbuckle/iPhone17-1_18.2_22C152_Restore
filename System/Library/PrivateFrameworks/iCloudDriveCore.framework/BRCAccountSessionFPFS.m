@interface BRCAccountSessionFPFS
+ (BOOL)_checkIntegrity:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 skipControlFiles:(BOOL)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8;
+ (BOOL)_openConnection:(id)a3 databaseName:(id)a4 baseURL:(id)a5 readonly:(BOOL)a6 error:(id *)a7;
+ (BOOL)_openConnection:(id)a3 serverTruth:(BOOL)a4 databaseName:(id)a5 baseURL:(id)a6 initialVersion:(unsigned int *)a7 lastCurrentVersion:(unsigned int *)a8 error:(id *)a9;
+ (BOOL)_registerStaticDBFunctions:(id)a3 error:(id *)a4;
+ (BOOL)_validateDatabase:(id)a3 baseURL:(id)a4 session:(id)a5 serverTruth:(BOOL)a6 initialVersion:(unsigned int)a7 lastCurrentVersion:(unsigned int)a8 error:(id *)a9;
+ (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 baseURL:(id)a6 skipControlFiles:(BOOL)a7 initialVersion:(unsigned int *)a8 lastCurrentVersion:(unsigned int *)a9 deviceIDChanged:(BOOL *)a10 error:(id *)a11;
+ (BOOL)upgradeOfflineDB:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 error:(id *)a6;
+ (id)_classesForClientState;
+ (id)nameComponentsForKey:(id)a3 db:(id)a4;
+ (id)nameComponentsForName:(id)a3 db:(id)a4;
+ (id)sessionForBackingUpDatabasesAtURL:(id)a3;
+ (id)sessionForCheckingInconsistencies;
+ (id)sessionForDumpingDatabasesAtURL:(id)a3;
+ (id)sessionForDumpingDatabasesAtURL:(id)a3 with:(id)a4;
+ (id)sessionForSendingTelemetryAtURL:(id)a3;
+ (id)userIdentityForKey:(id)a3 db:(id)a4;
+ (id)userIdentityForName:(id)a3 db:(id)a4;
+ (void)_registerLastBootIfNeeded:(id)a3 table:(id)a4 skipControlFiles:(BOOL)a5 deviceIDChanged:(BOOL *)a6;
- (BOOL)PCSMigrationComplete;
- (BOOL)_addOrImportDomainIfNeededWithError:(id *)a3 domainAdded:(BOOL *)a4 domainImported:(BOOL *)a5;
- (BOOL)_createAppLibrary:(id)a3;
- (BOOL)_createClientZone:(id)a3;
- (BOOL)_decorateFPFSDomainUserInfoWithError:(id *)a3;
- (BOOL)_decorateUserInfoForFPFSDomain:(id)a3 panicOnDomainIDMismatch:(BOOL)a4 withError:(id *)a5;
- (BOOL)_deleteAppLibrary:(id)a3;
- (BOOL)_deleteClientZone:(id)a3;
- (BOOL)_dumpClientZone:(id)a3 toContext:(id)a4 includeAllItems:(BOOL)a5 error:(id *)a6;
- (BOOL)_dumpClientZoneStatus:(id)a3 toContext:(id)a4 error:(id *)a5;
- (BOOL)_finishClientTruthConnectionSetupWithError:(id *)a3;
- (BOOL)_finishServerTruthConnectionSetupWithError:(id *)a3;
- (BOOL)_openConnection:(id)a3 databaseName:(id)a4 readonly:(BOOL)a5 error:(id *)a6;
- (BOOL)_recursivelyPrepareFolderForLogOutAtURL:(id)a3 pruneEmptyFolders:(BOOL)a4 pruneEmptyTopLevelFolder:(BOOL)a5 maxDepth:(unint64_t)a6;
- (BOOL)_registerDynamicDBFunctions:(id)a3 error:(id *)a4;
- (BOOL)_setupBackupDetector:(backup_detector *)a3 error:(id *)a4;
- (BOOL)_setupConnection:(id)a3 readonly:(BOOL)a4 forChecker:(BOOL)a5 error:(id *)a6;
- (BOOL)_shouldPrivateAppLibraryBeCZMMoved:(id)a3;
- (BOOL)_shouldTriggerTapToRadar:(int64_t)a3 daysSinceLastMigrationProgress:(int64_t)a4;
- (BOOL)_stepBackupDetector:(backup_detector *)a3 newState:(backup_detector *)a4 error:(id *)a5;
- (BOOL)backupDatabaseToURL:(id)a3 error:(id *)a4;
- (BOOL)backupDatabaseToURL:(id)a3 includeServer:(BOOL)a4 doNotObfuscate:(BOOL)a5 error:(id *)a6;
- (BOOL)createServerZone:(id)a3;
- (BOOL)decorateUserInfoForFPFSDomain:(id)a3 withError:(id *)a4;
- (BOOL)deleteServerZone:(id)a3;
- (BOOL)dumpDatabaseToFileHandle:(id)a3 zoneName:(id)a4 includeAllItems:(BOOL)a5 verbose:(BOOL)a6 tracker:(id)a7 error:(id *)a8;
- (BOOL)dumpFPFSMigrationStatusToFileHandle:(id)a3 tracker:(id)a4 includeNonMigratedItems:(BOOL)a5 error:(id *)a6;
- (BOOL)dumpFileCoordinationInfoToFileHandle:(id)a3 error:(id *)a4;
- (BOOL)dumpItemsToHandle:(id)a3 itemType:(id)a4 tracker:(id)a5 error:(id *)a6;
- (BOOL)dumpItemsURLsToHandle:(id)a3 itemRowIDs:(id)a4 error:(id *)a5;
- (BOOL)dumpStatusToFileHandle:(id)a3 zoneName:(id)a4 tracker:(id)a5 error:(id *)a6;
- (BOOL)enumerateItemsWithType:(id)a3 itemRowIDs:(id)a4 db:(id)a5 withBlock:(id)a6;
- (BOOL)enumerateSharedToMeItemsWithBlock:(id)a3 error:(id *)a4;
- (BOOL)fpfsMigrationStatusTTRTriggered;
- (BOOL)globalID:(id)a3 isStrictChildOfGlobalID:(id)a4;
- (BOOL)hasOptimizeStorageEnabled;
- (BOOL)icloudAccountIsInCarry;
- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 error:(id *)a4;
- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 error:(id *)a5;
- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 forDBDump:(BOOL)a5 error:(id *)a6;
- (BOOL)isCancelled;
- (BOOL)isDataSeparated;
- (BOOL)isGreedy;
- (BOOL)isMigratingToFPFS;
- (BOOL)isOpen;
- (BOOL)isOptimizeStorage;
- (BOOL)offline;
- (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 initialVersion:(unsigned int *)a5 lastCurrentVersion:(unsigned int *)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8;
- (BOOL)openDBForNewDomain:(BOOL)a3 deviceIDChanged:(BOOL *)a4 withError:(id *)a5;
- (BOOL)openWithError:(id *)a3 pushWorkloop:(id)a4;
- (BOOL)registerClient:(id)a3;
- (BOOL)reimportFPFSDomainWithError:(id *)a3;
- (BOOL)runDatabaseFixups;
- (BOOL)runDatabaseFixupsForDB:(id)a3 serverTruth:(BOOL)a4;
- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4;
- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4 supportsEnhancedDrivePrivacy:(BOOL)a5;
- (BOOL)saveAppLibraryToDB:(id)a3;
- (BOOL)saveClientZoneToDB:(id)a3;
- (BOOL)saveServerZone:(id)a3 toDB:(id)a4;
- (BOOL)saveServerZoneToDB:(id)a3;
- (BOOL)shouldPerformPCSMigration;
- (BRCAccountHandler)accountHandler;
- (BRCAccountSessionFPFS)init;
- (BRCAccountSessionFPFS)initWithACAccountID:(id)a3 dbAccountDSID:(id)a4 salt:(id)a5 accountHandler:(id)a6;
- (BRCAccountWaitOperation)accountWaitOperation;
- (BRCAnalyticsReporter)analyticsReporter;
- (BRCApplyScheduler)applyScheduler;
- (BRCBarrier)dbLoadingBarrier;
- (BRCBouncingAnalyzer)bouncingAnalyzer;
- (BRCClientState)clientState;
- (BRCContainerScheduler)containerScheduler;
- (BRCDeadlineScheduler)defaultScheduler;
- (BRCDiskSpaceReclaimer)diskReclaimer;
- (BRCDownloadStagingProtocol)downloadStager;
- (BRCDownloadTrackers)downloadTrackers;
- (BRCFSDownloader)fsDownloader;
- (BRCFSImporter)fsImporter;
- (BRCFSUploader)fsUploader;
- (BRCFairScheduler)fairClientDBScheduler;
- (BRCFileUnlinker)fileUnlinker;
- (BRCGlobalProgress)globalProgress;
- (BRCNamedThrottleManager)namedThrottleManager;
- (BRCNotificationManager)notificationManager;
- (BRCPQLConnection)clientDB;
- (BRCPQLConnection)expensiveReadOnlyDB;
- (BRCPQLConnection)readOnlyDB;
- (BRCPQLConnection)serverDB;
- (BRCRecentsEnumerator)recentsEnumerator;
- (BRCServerChangesApplier)serverChangesApplier;
- (BRCServerPersistedState)serverState;
- (BRCStageRegistry)stageRegistry;
- (BRCSyncContextProvider)syncContextProvider;
- (BRCSyncUpScheduler)syncUpScheduler;
- (BRCSyncUpStagingProtocol)syncUpStager;
- (BRCTapToRadarManager)tapToRadarManager;
- (BRCThrottle)appLibraryAliasRemovalThrottle;
- (BRCThrottle)appLibraryResetThrottle;
- (BRCThrottle)appLibraryScanThrottle;
- (BRCThrottle)lostItemThrottle;
- (BRCThrottle)operationFailureThrottle;
- (BRCThrottle)sharedAppLibraryResetThrottle;
- (BRCThrottle)syncClientZoneErrorThrottle;
- (BRCThrottle)syncClientZoneThrottle;
- (BRCUserNotification)userNotification;
- (BRCVolume)volume;
- (BRDSIDString)accountDSID;
- (BRFileProviderExtensionBackChannel)extensionBackChannel;
- (NSFileProviderDomain)fpDomain;
- (NSString)cacheDirPath;
- (NSString)databaseID;
- (NSString)description;
- (NSString)domainID;
- (NSString)personaIdentifier;
- (NSString)sessionDirPath;
- (NSString)ubiquityTokenSalt;
- (OS_dispatch_queue)dbFixupQueue;
- (OS_dispatch_queue)resetQueue;
- (OS_dispatch_workloop)clientTruthWorkloop;
- (OS_dispatch_workloop)readOnlyWorkloop;
- (OS_dispatch_workloop)serverTruthWorkloop;
- (id)__getOrCreateAppLibrary:(id)a3 rowID:(id)a4 alreadyExists:(BOOL *)a5 withClientZone:(id)a6 createCZMMoved:(BOOL)a7;
- (id)__getOrCreateClientZone:(id)a3 withServerZone:(id)a4 alreadyExists:(BOOL *)a5;
- (id)__getOrCreateServerZone:(id)a3;
- (id)_appLibrariesEnumerator:(id)a3;
- (id)_appLibrariesEnumerator:(id)a3 version:(int)a4;
- (id)_appLibrariesMatchingSearchString:(id)a3;
- (id)_appLibraryByName:(id)a3 db:(id)a4;
- (id)_clientZonesMatchingSearchString:(id)a3;
- (id)_computePathOfItemWithName:(id)a3 appLibrary:(id)a4 parentClientZoneRowID:(id)a5 parentID:(id)a6 type:(char)a7 needsLocalName:(BOOL)a8 db:(id)a9;
- (id)_containerMetadataRecordsToSaveWithBatchSize:(unint64_t)a3 requestID:(unint64_t)a4;
- (id)_createAppTelemetryFPFSMigrationInvestigation:(unsigned int)a3;
- (id)_createRecoveryExecutedErrorForImportError:(id)a3;
- (id)_getFPFSMigrationStatus:(id)a3 withError:(id *)a4;
- (id)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 creationFlags:(unsigned int *)a4;
- (id)_getPartiallySaltedItemWithAppLibrary:(id)a3;
- (id)_old_privateAppLibraryByZoneName:(id)a3 db:(id)a4;
- (id)_postImportAnalysisForProviderDomainID:(id)a3 withLostItemCount:(unint64_t)a4 withMigrationID:(id)a5;
- (id)_prepareXPCActivityIdentifierWithName:(id)a3;
- (id)_privateClientZoneByID:(id)a3 db:(id)a4;
- (id)_privateClientZoneByName:(id)a3 db:(id)a4;
- (id)_privateClientZonesEnumerator;
- (id)_privateServerZoneByName:(id)a3 db:(id)a4;
- (id)_privateServerZonesEnumerator:(id)a3;
- (id)_reserveRowIDForLibrary:(id)a3;
- (id)_sharedClientZonesEnumerator;
- (id)_sharedServerZoneByName:(id)a3 ownerName:(id)a4 db:(id)a5;
- (id)_sharedServerZonesEnumerator:(id)a3;
- (id)_triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted:(int64_t)a3 daysSinceLastMigrationProgress:(int64_t)a4 importError:(id)a5;
- (id)_unloadClientZones;
- (id)accountStatisticsWithDB:(id)a3;
- (id)appLibraries;
- (id)appLibrariesMatchingSearchString:(id)a3 error:(id *)a4;
- (id)appLibraryByID:(id)a3;
- (id)appLibraryByMangledID:(id)a3;
- (id)appLibraryByRowID:(id)a3;
- (id)cachedCurrentUserRecordName;
- (id)cachedCurrentUserRecordNameIfExists;
- (id)clientZoneByMangledID:(id)a3;
- (id)clientZones;
- (id)clientZonesMatchingSearchString:(id)a3 error:(id *)a4;
- (id)cloudDocsClientZone;
- (id)createDeviceKeyForNameInServerDB:(id)a3;
- (id)createUserKeyForOwnerName:(id)a3;
- (id)deviceKeyForName:(id)a3 db:(id)a4;
- (id)downloadStagePathForCurrentPersona;
- (id)fallbackAppLibraryForClientZone:(id)a3 extension:(id)a4;
- (id)fetchAccountWaitOperationWithAccountReady:(BOOL *)a3;
- (id)fixObfuscatedMangledID:(id)a3;
- (id)fpfsMigrationEndTime;
- (id)fpfsMigrationItemsNotMigratedDictionary;
- (id)fpfsMigrationStartTime;
- (id)fpfsMigrationUUID;
- (id)getFPFSNonMigratedItemsWithDB:(id)a3;
- (id)getMiscOperations;
- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3;
- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 appLibraryExists:(BOOL *)a4;
- (id)getOrCreateSharedZones:(id)a3;
- (id)getOrCreateSharedZones:(id)a3 shareAcceptOp:(id)a4;
- (id)getOrReserveLibraryRowIDForLibrary:(id)a3;
- (id)groupContainerStagePathForCurrentPersonaFromStageType:(signed __int16)a3;
- (id)itemByFileObjectID:(id)a3;
- (id)itemByFileObjectID:(id)a3 db:(id)a4;
- (id)itemByItemGlobalID:(id)a3;
- (id)itemByItemGlobalID:(id)a3 db:(id)a4;
- (id)itemByRowID:(unint64_t)a3;
- (id)itemByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemIDByRowID:(unint64_t)a3;
- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemsNeedingIndexingEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5;
- (id)itemsWithSideCarInFlightDiffsEnumerator;
- (id)localAliasForSharedItem:(id)a3 inZone:(id)a4;
- (id)newAppLibraryFromPQLResultSet:(id)a3 version:(int)a4;
- (id)newConnection:(id)a3;
- (id)newConnectionWithLabel:(id)a3 readonly:(BOOL)a4 error:(id *)a5;
- (id)newLocalItemFromPQLResultSet:(id)a3 db:(id)a4 error:(id *)a5;
- (id)newPrivateClientZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newPrivateServerZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newServerItemFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newSharedClientZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newSharedServerZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)privateClientZoneByID:(id)a3;
- (id)privateServerZoneByID:(id)a3;
- (id)serverAliasItemForSharedItem:(id)a3;
- (id)serverAliasItemForSharedItem:(id)a3 db:(id)a4;
- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4;
- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4 db:(id)a5;
- (id)serverZoneByCKZoneID:(id)a3;
- (id)serverZoneByMangledID:(id)a3;
- (id)serverZoneByName:(id)a3 ownerName:(id)a4;
- (id)serverZoneByRowID:(id)a3;
- (id)sharedClientZoneByMangledID:(id)a3;
- (id)sharedServerZoneByMangledID:(id)a3;
- (id)sharedServerZoneRowIDsByOwnerNamePrefix:(id)a3;
- (id)singleAppLibraryMatchingSearchString:(id)a3 error:(id *)a4;
- (id)singleClientZoneMatchingSearchString:(id)a3 error:(id *)a4;
- (id)trashedItemsEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5;
- (id)userIdentityForKey:(id)a3;
- (id)userKeyForOwnerName:(id)a3 db:(id)a4;
- (id)userNameForKey:(id)a3 db:(id)a4;
- (int)_resolveDeviceID;
- (int)fpfsMigrationMigratedTypes;
- (int)fpfsMigrationNonMigratedTypes;
- (int64_t)_getAndUpdateDaysSinceLastMigrationProgress:(int64_t)a3 itemsNotMigrated:(int64_t)a4 reconciledItems:(int64_t)a5;
- (int64_t)fpfsMigrationBouncedItemCount;
- (int64_t)fpfsMigrationBouncedMatrix;
- (int64_t)fpfsMigrationNewItemsInDB;
- (int64_t)fpfsMigrationNonMigratedItems;
- (int64_t)lastBootHistoryTime;
- (unint64_t)databaseIDHash;
- (unint64_t)fpfsMigrationCleanupLastRowID;
- (unint64_t)fpfsMigrationInvestigatedItemsCount;
- (unsigned)_recoverAndReportBoosting;
- (unsigned)_recoverAndReportBrokenShareOptions;
- (unsigned)_recoverAndReportDanglingLostZombieDirectories;
- (unsigned)_reportBasehashSalting;
- (unsigned)fpfsMigrationState;
- (void)__registerServerZone:(id)a3 clientZone:(id)a4 appLibrary:(id)a5 isShared:(BOOL)a6;
- (void)_cleanupMigrationClientState;
- (void)_cleanupOldCiconiaLocations;
- (void)_clearLegacyConflictVersionsAsync;
- (void)_clearNeedsUpgradeErrorsWithBrVersion:(id)a3;
- (void)_closeSharedPackageExtensionsPlist;
- (void)_cloudDocsAppsListDidChange:(id)a3;
- (void)_createAccountSupportPathIfNeeded:(id)a3 protectParent:(BOOL)a4;
- (void)_createGroupContainerStageOfType:(signed __int16)a3;
- (void)_dumpClientZoneBlockedState:(id)a3 toContext:(id)a4;
- (void)_enumerateAppLibraryRowIDs:(id)a3 usingBlock:(id)a4;
- (void)_fixImportStatusErrorIfPossible:(id)a3;
- (void)_fixupItemsAtStartup;
- (void)_handleTrashedItemsMigration;
- (void)_handleUnloadedZones:(id)a3;
- (void)_loadClientStateFromDB:(id)a3;
- (void)_loadClientZonesFromDisk;
- (void)_markDBOpened;
- (void)_mutexZonesLock;
- (void)_pcsChainAllItemsWithActivity:(id)a3;
- (void)_populateFPFSImportStatusTelemetryEventForEvent:(id)a3 withFPImportReport:(id)a4 itemsNotMigrated:(int64_t)a5;
- (void)_populateNonMigratedItemEventForLocalDataWithEvent:(id)a3 fileIDData:(id)a4 diagnosticDescriptor:(id)a5 migrationStart:(id)a6;
- (void)_prepareGroupContainerLocations;
- (void)_recoverAndReportStateIntegrityWithCompletion:(id)a3;
- (void)_refreshRootsCache;
- (void)_registerBackgroundXPCActivities;
- (void)_registerObfuscationFunction:(id)a3;
- (void)_reportBasehashSalting;
- (void)_reportForFPFSImportStatusTelemetryEventIfNeeded:(unsigned int)a3 completionHandler:(id)a4;
- (void)_saltPartiallySaltedItemsWithActivity:(id)a3;
- (void)_sendFPFSImportFinishedTelemetryEvent:(id)a3;
- (void)_sendFPFSImportStartTelemetryEvent;
- (void)_sendFPFSImportStatusTelemetryEvent;
- (void)_sendItemsPendingReconciliation:(id)a3 event:(id)a4;
- (void)_sendItemsPendingScanningDisk:(id)a3 event:(id)a4;
- (void)_sendItemsPendingScanningProvider:(id)a3 event:(id)a4;
- (void)_sendTelemetryEventForPendingItemsWithFPReport:(id)a3 migrationUUID:(id)a4 daysSinceImportStarted:(int64_t)a5;
- (void)_sendTelemetryEventWithDiagnosticAttributes:(id)a3 event:(id)a4;
- (void)_setDatabaseProfilingForDB:(id)a3 enabled:(BOOL)a4 verbose:(BOOL)a5;
- (void)_setICloudDesktopEnabled:(BOOL)a3 forAccount:(id)a4;
- (void)_setUserIdentity:(id)a3 forName:(id)a4;
- (void)_setupSharedPackageExtensionsPlist;
- (void)_setupThrottles;
- (void)_startWatcher;
- (void)_submitDBCorruptionTelemetryEventIfNeeded;
- (void)_submitDelayedTelemetryEventIfNeeded:(id)a3 wait:(double)a4 withBlock:(id)a5;
- (void)_submitReimportDomainFailedTelemetryEventIfNeeded;
- (void)_submitSessionOpenFailedTelemetryEventIfNeeded;
- (void)_triggerFPFSImportFinishedTelemetryEvent;
- (void)_unlinkContainersWithRootURL:(id)a3 containers:(id)a4;
- (void)_updateFPFSMigrationBouncedItemType:(char)a3 withExistingItemType:(char)a4;
- (void)_updateFPFSMigrationItemTypes:(char)a3 withStateKey:(id)a4 isPackage:(BOOL)a5;
- (void)_validatePersona;
- (void)accountWaitOperation;
- (void)addMiscOperation:(id)a3;
- (void)addOfflineAppLibrary:(id)a3;
- (void)addOfflineClientZone:(id)a3;
- (void)addOfflineServerZone:(id)a3;
- (void)applyScheduler;
- (void)assertNotOnZoneMutex;
- (void)bumpNotificationRankOnItemGlobalID:(id)a3;
- (void)cacheDirPath;
- (void)cachedCurrentUserRecordName;
- (void)captureDBCorruptionInfoWithDescription:(id)a3 error:(id)a4;
- (void)captureSessionOpenFailedInfoWithError:(id)a3;
- (void)close;
- (void)closeAndResetLocalStateWithDescription:(id)a3 error:(id)a4;
- (void)closeDBs;
- (void)closeXPCClientsSync;
- (void)cloudDocsAppsListDidChange:(id)a3;
- (void)containerScheduler;
- (void)dbBecameCorruptedWithDescription:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)destroyLocalData;
- (void)destroySharedClientZone:(id)a3;
- (void)disableDatabaseProfilingForDB:(id)a3;
- (void)dumpMiscOperationsToContext:(id)a3;
- (void)dumpXPCClientsToContext:(id)a3;
- (void)enableDatabaseProfilingForDB:(id)a3;
- (void)enumerateAppLibraries:(id)a3;
- (void)enumerateClientZones:(id)a3;
- (void)enumerateContainersWithDB:(id)a3 handler:(id)a4;
- (void)enumerateItemsWithShareIDUnderParent:(id)a3 block:(id)a4;
- (void)enumeratePrivateClientZones:(id)a3;
- (void)enumeratePrivateServerZones:(id)a3;
- (void)enumerateServerZones:(id)a3;
- (void)enumerateSharedClientZones:(id)a3;
- (void)fetchUserRecordIDWithCompletionHandler:(id)a3;
- (void)fixFileProviderDomainDecorations;
- (void)fpfsMigrationStatusTTRWasTriggered;
- (void)fsImporter;
- (void)invalidateAccountStatus;
- (void)isGreedy;
- (void)learnParticipantIdentitiesForShare:(id)a3 forceUpdate:(BOOL)a4;
- (void)markAccountMigrationComplete;
- (void)markMigrationToFPFSCleanupComplete;
- (void)markMigrationToFPFSComplete;
- (void)notificationManager;
- (void)openForDumping;
- (void)openForSendingTelemetry;
- (void)performBlock:(id)a3 whileRemovingPrivateClientZone:(id)a4;
- (void)preventDatabaseFromBeingReused;
- (void)recomputeAppSyncBlockStateForPrivateClientZone:(id)a3;
- (void)recoverAndReportContentPolicyWithCompletion:(id)a3;
- (void)resetThrottles;
- (void)resumeIfNecessary;
- (void)scheduleZoneMovesToCloudDocs:(id)a3;
- (void)sendFileStatsTelemetryWithDescriptors:(id)a3 perItemSendTelemetryBlock:(id)a4;
- (void)sendNonMigratedItemTelemetryWithfileIDs:(id)a3;
- (void)sessionDirPath;
- (void)setCacheDirPath:(id)a3;
- (void)setExtensionBackChannel:(id)a3;
- (void)setFPFSMigrationState:(unsigned int)a3;
- (void)setFpDomain:(id)a3;
- (void)setNeedsPCSMigration:(BOOL)a3;
- (void)setOptimizeStorageEnabled:(BOOL)a3 forKey:(id)a4 synchronous:(BOOL)a5;
- (void)setOptimizeStorageEnabled:(BOOL)a3 synchronous:(BOOL)a4;
- (void)setSessionDirPath:(id)a3;
- (void)setupDatabase;
- (void)stageRegistry;
- (void)stopDBWatcher;
- (void)triggerFPFSImportFinishedTelemetryEventIfNeeded;
- (void)unregisterClient:(id)a3;
- (void)updateFPFSMigrationCleanupLastRowID:(unint64_t)a3 lostItemCount:(unint64_t)a4 childLostItemCount:(unint64_t)a5 busyDateLostItemCount:(unint64_t)a6 ignoredFromSyncLostItemCount:(unint64_t)a7 investigatedItemsCount:(unint64_t)a8 notMigratedItems:(id)a9;
- (void)updateFPFSMigrationMigratedTypes:(char)a3;
- (void)updateFPFSMigrationMigratedTypesWithPackage;
- (void)updateFPFSMigrationNewItemsInDB;
- (void)updateFPFSMigrationNonMigratedTypes:(char)a3;
- (void)updateFPFSMigrationNonMigratedTypesWithPackage;
- (void)waitForUploadsToCompleteInSyncBubbleWithReply:(id)a3;
@end

@implementation BRCAccountSessionFPFS

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BRCNotificationManager)notificationManager
{
  notificationManager = self->_notificationManager;
  if (!notificationManager)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS notificationManager]();
    }

    notificationManager = self->_notificationManager;
  }
  return notificationManager;
}

- (BRCAccountHandler)accountHandler
{
  return self->_accountHandler;
}

- (BRDSIDString)accountDSID
{
  return self->_accountDSID;
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (([(NSMutableSet *)v5->_xpcClients containsObject:v4] & 1) == 0)
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS unregisterClient:]();
    }
  }
  [(NSMutableSet *)v5->_xpcClients removeObject:v4];
  objc_sync_exit(v5);
}

- (BOOL)registerClient:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableSet *)v5->_xpcClients containsObject:v4])
  {
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS registerClient:]();
    }
  }
  BOOL isCancelled = v5->_isCancelled;
  if (!v5->_isCancelled) {
    [(NSMutableSet *)v5->_xpcClients addObject:v4];
  }
  objc_sync_exit(v5);

  return !isCancelled;
}

- (void)addOfflineServerZone:(id)a3
{
  id v18 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_serverZonesByZoneRowID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    self->_serverZonesByZoneRowID = v5;
  }
  v7 = v18;
  if (!self->_sharedServerZonesByMangledID)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
    self->_sharedServerZonesByMangledID = v8;

    v7 = v18;
  }
  if (!self->_privateServerZonesByID)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    privateServerZonesByID = self->_privateServerZonesByID;
    self->_privateServerZonesByID = v10;

    v7 = v18;
  }
  [v7 setSession:self];
  v12 = self->_serverZonesByZoneRowID;
  v13 = [v18 dbRowID];
  [(NSMutableDictionary *)v12 setObject:v18 forKeyedSubscript:v13];

  if ([v18 isSharedZone])
  {
    v14 = self->_sharedServerZonesByMangledID;
    v15 = [v18 asSharedZone];
    v16 = [v15 mangledID];
    [(NSMutableDictionary *)v14 setObject:v18 forKeyedSubscript:v16];
  }
  else
  {
    v17 = self->_privateServerZonesByID;
    v15 = [v18 zoneName];
    [(NSMutableDictionary *)v17 setObject:v18 forKeyedSubscript:v15];
  }

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineClientZone:(id)a3
{
  id v14 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_privateClientZonesByID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    privateClientZonesByID = self->_privateClientZonesByID;
    self->_privateClientZonesByID = v5;
  }
  if (!self->_sharedClientZonesByMangledID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
    self->_sharedClientZonesByMangledID = v7;
  }
  [v14 setSession:self];
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  v10 = [v14 dbRowID];
  v11 = [(NSMutableDictionary *)serverZonesByZoneRowID objectForKeyedSubscript:v10];

  if (v11) {
    [v14 associateWithServerZone:v11 offline:1];
  }
  if ([v14 isSharedZone])
  {
    v12 = self->_sharedClientZonesByMangledID;
    [v14 mangledID];
  }
  else
  {
    v12 = self->_privateClientZonesByID;
    [v14 zoneName];
  v13 = };
  [(NSMutableDictionary *)v12 setObject:v14 forKeyedSubscript:v13];

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineAppLibrary:(id)a3
{
  p_zonesLock = &self->_zonesLock;
  id v5 = a3;
  brc_mutex_lock(&p_zonesLock->pthread);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  if (!appLibrariesByRowID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = self->_appLibrariesByRowID;
    self->_appLibrariesByRowID = v7;

    appLibrariesByRowID = self->_appLibrariesByRowID;
  }
  v9 = [v5 dbRowID];
  [(NSMutableDictionary *)appLibrariesByRowID setObject:v5 forKeyedSubscript:v9];

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (OS_dispatch_workloop)clientTruthWorkloop
{
  return self->_clientTruthWorkloop;
}

- (OS_dispatch_workloop)readOnlyWorkloop
{
  return self->_readOnlyWorkloop;
}

- (OS_dispatch_workloop)serverTruthWorkloop
{
  return self->_serverTruthWorkloop;
}

- (unint64_t)databaseIDHash
{
  return [(NSString *)self->_databaseID hash];
}

- (BRCClientState)clientState
{
  return self->_clientState;
}

- (BRCServerPersistedState)serverState
{
  return self->_serverState;
}

- (BRCPQLConnection)clientDB
{
  return self->_clientDB;
}

- (BRCPQLConnection)serverDB
{
  return self->_serverDB;
}

- (BRCPQLConnection)readOnlyDB
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_readOnlyDB;
  if (v3)
  {
    id v4 = v3;
    id v5 = v4;
  }
  else
  {
    id v12 = 0;
    id v4 = [(BRCAccountSessionFPFS *)v2 newConnectionWithLabel:@"readonly-interactive-db" readonly:1 error:&v12];
    id v6 = v12;
    if (v4)
    {
      v7 = [(BRCAccountSessionFPFS *)v2 readOnlyWorkloop];
      [(BRCPQLConnection *)v4 useSerialQueueWithTarget:v7];

      objc_storeStrong((id *)&v2->_readOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) readOnlyDB]();
      }

      clientDB = v2->_clientDB;
    }
    id v5 = clientDB;
  }
  objc_sync_exit(v2);

  return v5;
}

- (BRCPQLConnection)expensiveReadOnlyDB
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expensiveReadOnlyDB;
  if (v3)
  {
    id v4 = v3;
    id v5 = v4;
  }
  else
  {
    id v12 = 0;
    id v4 = [(BRCAccountSessionFPFS *)v2 newConnectionWithLabel:@"readonly-expensive-db" readonly:1 error:&v12];
    id v6 = v12;
    if (v4)
    {
      v7 = [(BRCAccountSessionFPFS *)v2 readOnlyWorkloop];
      [(BRCPQLConnection *)v4 useSerialQueueWithTarget:v7];

      objc_storeStrong((id *)&v2->_expensiveReadOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) expensiveReadOnlyDB]();
      }

      clientDB = v2->_clientDB;
    }
    id v5 = clientDB;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)dbBecameCorruptedWithDescription:(id)a3 error:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(BRCAccountSessionFPFS *)self extensionBackChannel];

  if (v8)
  {
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412546;
      v28 = self;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] %@ - Invalidating the extension%@", buf, 0x16u);
    }

    v11 = [(BRCAccountSessionFPFS *)self extensionBackChannel];
    [v11 invalidateExtension];
  }
  id v12 = self;
  objc_sync_enter(v12);
  if (!v12->_dbCorruptionQueue)
  {
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("db-corrupting-handler-queue", v16);

    dbCorruptionQueue = v12->_dbCorruptionQueue;
    v12->_dbCorruptionQueue = (OS_dispatch_queue *)v17;

    [(BRCAccountSessionFPFS *)v12 captureDBCorruptionInfoWithDescription:v6 error:v7];
    objc_sync_exit(v12);

    v19 = [(BRCAccountSessionFPFS *)v12 fileUnlinker];
    v20 = [(NSURL *)v12->_dbURL path];
    [v19 renameAndUnlinkInBackgroundItemAtPath:v20];

    v21 = [(BRCAccountSessionFPFS *)v12 fileUnlinker];
    v22 = [(BRCAccountSessionFPFS *)v12 sessionDirPath];
    [v21 renameAndUnlinkInBackgroundItemAtPath:v22];

    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"db was corrupted with description - '%@' and due to - %@", v6, v7];
    objc_claimAutoreleasedReturnValue();
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      brc_append_system_info_to_message();
      v25 = (BRCAccountSessionFPFS *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v25;
      __int16 v29 = 2112;
      v30 = v23;
      _os_log_fault_impl(&dword_23FA42000, v24, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);
    }
    brc_append_system_info_to_message();
    v26 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) dbBecameCorruptedWithDescription:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 299, v26);
  }
  brc_bread_crumbs();
  v13 = (BRCAccountSessionFPFS *)objc_claimAutoreleasedReturnValue();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Corrupting handling is already in-flight%@", buf, 0xCu);
  }

  objc_sync_exit(v12);
}

- (id)newConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [BRCPQLConnection alloc];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __59__BRCAccountSessionFPFS_BRCDatabaseManager__newConnection___block_invoke;
  v11 = &unk_26507F100;
  objc_copyWeak(&v12, &location);
  id v6 = [(BRCPQLConnection *)v5 initWithLabel:v4 dbCorruptionHandler:&v8];
  -[BRCPQLConnection setAssertionPersonaIdentifier:](v6, "setAssertionPersonaIdentifier:", self->_personaIdentifier, v8, v9, v10, v11);
  [(BRCPQLConnection *)v6 setStatementCacheMaxCount:10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __59__BRCAccountSessionFPFS_BRCDatabaseManager__newConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained dbBecameCorruptedWithDescription:@"Invoked from DB Corruption Handler" error:v4];
}

+ (id)sessionForBackingUpDatabasesAtURL:(id)a3
{
  v3 = (NSURL *)a3;
  id v4 = objc_alloc_init(BRCAccountSessionFPFS);
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;

  return v4;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3 with:(id)a4
{
  id v5 = (NSURL *)a3;
  id v6 = (BRDSIDString *)a4;
  id v7 = objc_alloc_init(BRCAccountSessionFPFS);
  [(BRCAccountSessionFPFS *)v7 setupDatabase];
  dbURL = v7->_dbURL;
  v7->_dbURL = v5;
  uint64_t v9 = v5;

  accountDSID = v7->_accountDSID;
  v7->_accountDSID = v6;
  v11 = v6;

  serverDB = v7->_serverDB;
  v13 = [(BRCAccountSessionFPFS *)v7 serverTruthWorkloop];
  [(BRCPQLConnection *)serverDB useSerialQueueWithTarget:v13];

  clientDB = v7->_clientDB;
  v15 = [(BRCAccountSessionFPFS *)v7 clientTruthWorkloop];
  [(BRCPQLConnection *)clientDB useSerialQueueWithTarget:v15];

  [(BRCAccountSessionFPFS *)v7 openForDumping];
  return v7;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sessionForDumpingDatabasesAtURL:v3 with:0];

  return v4;
}

+ (id)sessionForSendingTelemetryAtURL:(id)a3
{
  id v3 = (NSURL *)a3;
  id v4 = objc_alloc_init(BRCAccountSessionFPFS);
  [(BRCAccountSessionFPFS *)v4 setupDatabase];
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;
  id v6 = v3;

  serverDB = v4->_serverDB;
  uint64_t v8 = [(BRCAccountSessionFPFS *)v4 serverTruthWorkloop];
  [(BRCPQLConnection *)serverDB useSerialQueueWithTarget:v8];

  clientDB = v4->_clientDB;
  v10 = [(BRCAccountSessionFPFS *)v4 clientTruthWorkloop];
  [(BRCPQLConnection *)clientDB useSerialQueueWithTarget:v10];

  [(BRCAccountSessionFPFS *)v4 openForSendingTelemetry];
  v11 = +[BRCDaemonFPFS daemon];
  uint64_t v12 = objc_opt_class();

  [v11 setContainerClass:v12];
  return v4;
}

+ (id)sessionForCheckingInconsistencies
{
  v2 = objc_alloc_init(BRCAccountSessionFPFS);
  serverDB = v2->_serverDB;
  id v4 = [(BRCAccountSessionFPFS *)v2 serverTruthWorkloop];
  [(BRCPQLConnection *)serverDB useSerialQueueWithTarget:v4];

  clientDB = v2->_clientDB;
  id v6 = [(BRCAccountSessionFPFS *)v2 clientTruthWorkloop];
  [(BRCPQLConnection *)clientDB useSerialQueueWithTarget:v6];

  return v2;
}

- (void)setupDatabase
{
  id v7 = +[BRCUserDefaults defaultsForMangledID:0];
  id v3 = [(BRCAccountSessionFPFS *)self newConnection:@"serverTruth"];
  serverDB = self->_serverDB;
  self->_serverDB = v3;

  id v5 = [(BRCAccountSessionFPFS *)self newConnection:@"clientTruth"];
  clientDB = self->_clientDB;
  self->_clientDB = v5;

  -[BRCPQLConnection setStatementCacheMaxCount:](self->_serverDB, "setStatementCacheMaxCount:", [v7 statementCacheMaxCountForServerTruth]);
  -[BRCPQLConnection setStatementCacheMaxCount:](self->_clientDB, "setStatementCacheMaxCount:", [v7 statementCacheMaxCountForClientTruth]);
}

- (void)_startWatcher
{
  id v3 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"client.db"];
  id v4 = (const char *)[v3 fileSystemRepresentation];

  unsigned int v5 = open(v4, 33028);
  if ((v5 & 0x80000000) != 0)
  {
    abc_report_panic_with_signature();
    objc_msgSend(NSString, "stringWithFormat:", @"can't open the client db we've just created %{errno}d", *__error());
    objc_claimAutoreleasedReturnValue();
    id v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
    }

    brc_append_system_info_to_message();
    v20 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 391, v20);
  }
  unsigned int v6 = v5;
  id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8410], v5, 1uLL, (dispatch_queue_t)self->_dbWatcherQueue);
  dbWatcher = self->_dbWatcher;
  self->_dbWatcher = v7;

  uint64_t v9 = self->_dbWatcher;
  v10 = (void (**)(void *))MEMORY[0x263F32768];
  if (*MEMORY[0x263F32768])
  {
    v11 = ((void (*)(void *))*MEMORY[0x263F32768])(&__block_literal_global_6);
  }
  else
  {
    v11 = &__block_literal_global_6;
  }
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v11);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v12);

  v13 = self->_dbWatcher;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__BRCAccountSessionFPFS_BRCDatabaseManager___startWatcher__block_invoke_2;
  v21[3] = &__block_descriptor_36_e5_v8__0l;
  unsigned int v22 = v6;
  id v14 = v13;
  v15 = v21;
  v16 = v15;
  if (*v10)
  {
    uint64_t v17 = (*v10)(v15);

    v16 = (void *)v17;
  }
  dispatch_source_set_cancel_handler(v14, v16);

  dispatch_resume((dispatch_object_t)self->_dbWatcher);
}

void __58__BRCAccountSessionFPFS_BRCDatabaseManager___startWatcher__block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"someone ripped the database from under our feet"];
  objc_claimAutoreleasedReturnValue();
  v0 = brc_bread_crumbs();
  v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    v2 = brc_append_system_info_to_message();
    int v4 = 138412546;
    unsigned int v5 = v2;
    __int16 v6 = 2112;
    id v7 = v0;
    _os_log_fault_impl(&dword_23FA42000, v1, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v4, 0x16u);
  }
  brc_append_system_info_to_message();
  id v3 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 396, v3);
}

uint64_t __58__BRCAccountSessionFPFS_BRCDatabaseManager___startWatcher__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)stopDBWatcher
{
  dbWatcherQueue = self->_dbWatcherQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BRCAccountSessionFPFS_BRCDatabaseManager__stopDBWatcher__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(dbWatcherQueue, block);
}

void __58__BRCAccountSessionFPFS_BRCDatabaseManager__stopDBWatcher__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;
  }
}

- (BOOL)_openConnection:(id)a3 databaseName:(id)a4 readonly:(BOOL)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  LODWORD(v7) = [(id)objc_opt_class() _openConnection:v10 databaseName:v11 baseURL:self->_dbURL readonly:v7 error:a6];

  if (v7) {
    BOOL v12 = [(BRCAccountSessionFPFS *)self _registerDynamicDBFunctions:v10 error:a6];
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)_openConnection:(id)a3 databaseName:(id)a4 baseURL:(id)a5 readonly:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  if (v8) {
    uint64_t v13 = 3145729;
  }
  else {
    uint64_t v13 = 3145734;
  }
  id v14 = [a5 URLByAppendingPathComponent:v12];
  int v15 = [v11 openAtURL:v14 withFlags:v13 error:a7];

  if (!v15) {
    goto LABEL_9;
  }
  if (!v8) {
    objc_msgSend(v11, "setSynchronousMode:", objc_msgSend(v12, "isEqualToString:", @"checker.db") ^ 1);
  }
  if (+[BRCAccountSessionFPFS _registerStaticDBFunctions:v11 error:a7])
  {
    v16 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v16, "sqliteCacheSize"));
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v16, "sqliteCacheSpill"));
    v19 = (void *)MEMORY[0x263F8C720];
    id v20 = v17;
    v21 = objc_msgSend(v19, "rawInjection:length:", objc_msgSend(v20, "UTF8String"), objc_msgSend(v20, "length"));
    [v11 execute:@"PRAGMA cache_size = %@", v21];

    unsigned int v22 = (void *)MEMORY[0x263F8C720];
    id v23 = v18;
    v24 = objc_msgSend(v22, "rawInjection:length:", objc_msgSend(v23, "UTF8String"), objc_msgSend(v23, "length"));
    [v11 execute:@"PRAGMA cache_spill = %@", v24];

    BOOL v25 = 1;
  }
  else
  {
LABEL_9:
    BOOL v25 = 0;
  }

  return v25;
}

+ (BOOL)_registerStaticDBFunctions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke;
  v9[3] = &unk_26507F148;
  id v6 = v5;
  id v10 = v6;
  if ([v6 registerFunction:@"migration_is_parented_or_equal_to_old_doc_id" nArgs:2 handler:v9 error:a4]&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", @"document_is_evictable", 1, &__block_literal_global_78, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", @"document_is_indexable", 1, &__block_literal_global_83,
                       a4))
  {
    char v7 = [v6 registerFunction:@"ckinfo_etags_are_equal" nArgs:2 handler:&__block_literal_global_88_0];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  char v7 = pql_sqlite3_value_object();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1();
    }

    sqlite3_result_null(a2);
    goto LABEL_23;
  }
  unsigned int v22 = a2;
  BOOL v8 = (void *)[MEMORY[0x263EFF8F8] newFromSqliteValue:*(void *)(a4 + 8)];
  uint64_t v9 = -1000;
  while (1)
  {
    id v10 = (void *)MEMORY[0x2455D97F0]();
    if (!v8) {
      goto LABEL_18;
    }
    id v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    if ([v11 isEqualToString:@"root"])
    {
      int v19 = 0;
LABEL_16:
      sqlite3_result_int(v22, v19);

      goto LABEL_22;
    }
    if ([v11 isEqualToString:@"documents"])
    {
      int v19 = 1;
      goto LABEL_16;
    }

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v7 dbRowID];
    id v14 = (void *)[v12 fetch:@"SELECT item_parent_id FROM client_items WHERE zone_rowid = %@ AND item_id = %@", v13, v8];

    if (([v14 next] & 1) == 0) {
      break;
    }
    uint64_t v15 = [v14 dataAtIndex:0];

    BOOL v8 = (void *)v15;
    if (__CFADD__(v9++, 1)) {
      goto LABEL_19;
    }
  }

LABEL_18:
  uint64_t v15 = (uint64_t)v8;
LABEL_19:
  id v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2();
  }

  sqlite3_result_null(v22);
  BOOL v8 = (void *)v15;
LABEL_22:

LABEL_23:
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_76(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v5 = sqlite3_value_int64(*a4) & 1;
  sqlite3_result_int(a2, v5);
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  unsigned int v5 = (sqlite3_value_int64(*a4) >> 1) & 1;
  sqlite3_result_int(a2, v5);
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v11 = +[BRFieldCKInfo newFromSqliteValue:*a4];
  id v7 = +[BRFieldCKInfo newFromSqliteValue:a4[1]];
  BOOL v8 = [v11 etag];
  if (v8 || ([v7 etag], (int v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = [v11 etag];
    id v10 = [v7 etag];
    sqlite3_result_int(a2, [v9 isEqualToString:v10]);

    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    sqlite3_result_int(a2, 1);
  }

LABEL_7:
}

- (BOOL)_registerDynamicDBFunctions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke;
  v16[3] = &unk_26507F170;
  objc_copyWeak(&v17, &location);
  id v7 = (void *)MEMORY[0x2455D9A50](v16);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_90;
  v14[3] = &unk_26507F170;
  objc_copyWeak(&v15, &location);
  BOOL v8 = (void *)MEMORY[0x2455D9A50](v14);
  if ([v6 registerFunction:@"trigger_notification" nArgs:1 handler:v7 error:a4]&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", @"bump_notifs_rank", 0, v8, a4))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2;
    v11[3] = &unk_26507F198;
    id v12 = v7;
    id v13 = v8;
    char v9 = [v6 registerFunction:@"bump_notifs_rank_and_trigger_notifs" nArgs:1 handler:v11 error:a4];
  }
  else
  {
    char v9 = 0;
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v9;
}

void __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3_value **a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sqlite3_int64 v6 = sqlite3_value_int64(*a4);
  id v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1((uint64_t)v7, v6, v8);
  }

  char v9 = [WeakRetained notificationManager];
  [v9 queueUpdateForItemAtRowID:v6];
}

void __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_90(uint64_t a1, sqlite3_context *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = +[BRCPersistedState loadFromClientStateInSession:WeakRetained];
  sqlite3_int64 v4 = [v3 allocateNotifRank];

  sqlite3_result_int64(a2, v4);
}

uint64_t __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)_setupConnection:(id)a3 readonly:(BOOL)a4 forChecker:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  BOOL v22 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v25 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  if (v6) {
    BOOL v8 = &unk_26F3DDAD8;
  }
  else {
    BOOL v8 = &unk_26F3DDAF0;
  }
  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    BOOL v11 = 0;
    uint64_t v12 = *(void *)v27;
    unint64_t v13 = 0x263F08000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v16 = [*(id *)(v13 + 2880) stringWithFormat:@"%@.db", v15];
        if (v11)
        {
          id v17 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:v16];
          [v17 path];
          v19 = unint64_t v18 = v13;
          char v20 = [v25 attachDBAtPath:v19 as:v15 error:a6];

          unint64_t v13 = v18;
          if ((v20 & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if (![(BRCAccountSessionFPFS *)self _openConnection:v25 databaseName:v16 readonly:v22 error:a6])
        {
LABEL_16:

          BOOL v11 = 0;
          goto LABEL_18;
        }

        BOOL v11 = 1;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_18:

  return v11;
}

- (id)newConnectionWithLabel:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(BRCAccountSessionFPFS *)self newConnection:v8];
  uint64_t v10 = [v8 isEqualToString:@"checker"];

  if ([(BRCAccountSessionFPFS *)self _setupConnection:v9 readonly:v6 forChecker:v10 error:a5])
  {
    BOOL v11 = v9;
  }
  else
  {
    BOOL v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (BOOL)_setupBackupDetector:(backup_detector *)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-odd"];
  id v8 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-even"];
  __darwin_ino64_t v23 = 0;
  a3->unint64_t var2 = 0;
  id v9 = v7;
  if (create_control_file((char *)[v9 fileSystemRepresentation], &v23, 1))
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      BOOL v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v25 = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _setupBackupDetector:error:]";
        __int16 v26 = 2080;
        if (!a4) {
          v21 = "(ignored by caller)";
        }
        unint64_t v27 = (unint64_t)v21;
        __int16 v28 = 2112;
        unint64_t v29 = (unint64_t)v10;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_error_impl(&dword_23FA42000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      goto LABEL_6;
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  a3->unint64_t var0 = v23;
  if (!create_control_file((char *)[v8 fileSystemRepresentation], &v23, 1))
  {
    a3->unint64_t var1 = v23;
    brc_bread_crumbs();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v13 = 1;
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t var0 = a3->var0;
      unint64_t var1 = a3->var1;
      unint64_t var2 = a3->var2;
      *(_DWORD *)buf = 134218754;
      id v25 = (const char *)var0;
      __int16 v26 = 2048;
      unint64_t v27 = var1;
      __int16 v28 = 2048;
      unint64_t v29 = var2;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector initialized {old:%llu; new:%llu; c:%llu}%@",
        buf,
        0x2Au);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      BOOL v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      id v25 = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _setupBackupDetector:error:]";
      __int16 v26 = 2080;
      if (!a4) {
        BOOL v22 = "(ignored by caller)";
      }
      unint64_t v27 = (unint64_t)v22;
      __int16 v28 = 2112;
      unint64_t v29 = (unint64_t)v10;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_error_impl(&dword_23FA42000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (!a4) {
    goto LABEL_13;
  }
LABEL_6:
  id v10 = v10;
  BOOL v13 = 0;
  id v14 = *a4;
  *a4 = v10;
LABEL_7:

LABEL_14:
  return v13;
}

- (BOOL)_stepBackupDetector:(backup_detector *)a3 newState:(backup_detector *)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v9 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-odd"];
  id v10 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-even"];
  BOOL v11 = v10;
  memset(&v44, 0, sizeof(v44));
  if (a3->var2) {
    id v10 = v9;
  }
  id v12 = (const char *)objc_msgSend(v10, "fileSystemRepresentation", *(void *)&v44.st_dev);
  if (lstat(v12, &v44))
  {
    int v13 = *__error();
    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 136315650;
      st_ino = v12;
      __int16 v47 = 1024;
      *(_DWORD *)v48 = v13;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v14;
      _os_log_error_impl(&dword_23FA42000, v15, (os_log_type_t)0x90u, "[ERROR] failed stating '%s' %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v13;
    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      id v17 = brc_bread_crumbs();
      unint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        st_ino = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
        __int16 v47 = 2080;
        if (!a5) {
          v35 = "(ignored by caller)";
        }
        *(void *)v48 = v35;
        *(_WORD *)&v48[8] = 2112;
        *(void *)&v48[10] = v16;
        __int16 v49 = 2112;
        unint64_t v50 = (unint64_t)v17;
        _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
  if (v44.st_ino != a3->var1)
  {
    v24 = brc_bread_crumbs();
    id v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t var1 = a3->var1;
      *(_DWORD *)buf = 134218754;
      st_ino = (const char *)v44.st_ino;
      __int16 v47 = 2048;
      *(void *)v48 = var1;
      *(_WORD *)&v48[8] = 2080;
      *(void *)&v48[10] = v12;
      __int16 v49 = 2112;
      unint64_t v50 = (unint64_t)v24;
      _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] backup detected: ino %llu instead of %llu at '%s'\n%@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 70);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_32:
      if (a5)
      {
LABEL_10:
        id v16 = v16;
        BOOL v19 = 0;
        *a5 = v16;
        goto LABEL_41;
      }
LABEL_33:
      BOOL v19 = 0;
      goto LABEL_41;
    }
    unint64_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
LABEL_31:

      goto LABEL_32;
    }
    unint64_t v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    __int16 v47 = 2080;
    if (!a5) {
      unint64_t v29 = "(ignored by caller)";
    }
LABEL_48:
    *(void *)v48 = v29;
    *(_WORD *)&v48[8] = 2112;
    *(void *)&v48[10] = v16;
    __int16 v49 = 2112;
    unint64_t v50 = (unint64_t)v27;
    _os_log_error_impl(&dword_23FA42000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_31;
  }
  if (a3->var2) {
    char v20 = v11;
  }
  else {
    char v20 = v9;
  }
  v21 = (char *)[v20 fileSystemRepresentation];
  if (!lstat(v21, &v44))
  {
    if (v44.st_ino != a3->var0)
    {
      __int16 v30 = brc_bread_crumbs();
      id v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        unint64_t var0 = a3->var0;
        *(_DWORD *)buf = 136315906;
        st_ino = v21;
        __int16 v47 = 2048;
        *(void *)v48 = v44.st_ino;
        *(_WORD *)&v48[8] = 2048;
        *(void *)&v48[10] = var0;
        __int16 v49 = 2112;
        unint64_t v50 = (unint64_t)v30;
        _os_log_debug_impl(&dword_23FA42000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] mismatch on new control file '%s': %llu != %llu\n%@", buf, 0x2Au);
      }

      goto LABEL_37;
    }
    if (!create_control_file(v21, &v44.st_ino, 1))
    {
      __darwin_ino64_t v36 = v44.st_ino;
      a4->unint64_t var0 = a3->var1;
      a4->unint64_t var1 = v36;
      a4->unint64_t var2 = a3->var2 + 1;
      goto LABEL_38;
    }
    goto LABEL_29;
  }
  BOOL v22 = brc_bread_crumbs();
  __darwin_ino64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:]();
  }

  if (create_control_file(v21, &v44.st_ino, 1))
  {
LABEL_29:
    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16) {
      goto LABEL_32;
    }
    unint64_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
      goto LABEL_31;
    }
    unint64_t v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    __int16 v47 = 2080;
    if (!a5) {
      unint64_t v29 = "(ignored by caller)";
    }
    goto LABEL_48;
  }
LABEL_37:
  unint64_t var2 = a3->var2;
  *(_OWORD *)&a4->unint64_t var0 = *(_OWORD *)&a3->var0;
  a4->unint64_t var2 = var2;
  a4->unint64_t var0 = v44.st_ino;
LABEL_38:
  brc_bread_crumbs();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v37 = a3->var0;
    unint64_t v38 = a3->var1;
    unint64_t v39 = a4->var0;
    unint64_t v40 = a4->var1;
    unint64_t v41 = a3->var2;
    unint64_t v42 = a4->var2;
    *(_DWORD *)buf = 134219522;
    st_ino = (const char *)v37;
    __int16 v47 = 2048;
    *(void *)v48 = v39;
    *(_WORD *)&v48[8] = 2048;
    *(void *)&v48[10] = v38;
    __int16 v49 = 2048;
    unint64_t v50 = v40;
    __int16 v51 = 2048;
    unint64_t v52 = v41;
    __int16 v53 = 2048;
    unint64_t v54 = v42;
    __int16 v55 = 2112;
    id v56 = v16;
    _os_log_debug_impl(&dword_23FA42000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector updated {old:%llu -> %llu; new:%llu -> %llu; c:%llu -> %llu}%@",
      buf,
      0x48u);
  }

  BOOL v19 = 1;
LABEL_41:

  return v19;
}

- (void)preventDatabaseFromBeingReused
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-odd"];
  sqlite3_int64 v4 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-even"];
  unsigned int v5 = [MEMORY[0x263F08850] defaultManager];
  id v15 = 0;
  char v6 = [v5 removeItemAtURL:v3 error:&v15];
  id v7 = v15;
  if ((v6 & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v3;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }
  }
  id v14 = v7;
  char v10 = [v5 removeItemAtURL:v4 error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0)
  {
    id v12 = brc_bread_crumbs();
    int v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }
  }
}

- (id)fixObfuscatedMangledID:(id)a3
{
  id v4 = a3;
  if (!self->_forDBDump) {
    goto LABEL_6;
  }
  if (fixObfuscatedMangledID__onceToken != -1) {
    dispatch_once(&fixObfuscatedMangledID__onceToken, &__block_literal_global_127);
  }
  uint64_t v5 = [v4 length];
  uint64_t v7 = objc_msgSend((id)fixObfuscatedMangledID____regex, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5);
  if (v7 || v6 != v5)
  {
    objc_msgSend(v4, "substringWithRange:", v7, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

void __68__BRCAccountSessionFPFS_BRCDatabaseManager__fixObfuscatedMangledID___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[a-zA-Z0-9\\-]+\\.[a-zA-Z0-9\\-\\.]+" options:0 error:0];
  v1 = (void *)fixObfuscatedMangledID____regex;
  fixObfuscatedMangledID____regex = v0;
}

- (BOOL)saveServerZone:(id)a3 toDB:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 dbRowID];

  if (!v7)
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveServerZone:toDB:]();
    }
  }
  id v8 = [v5 plist];
  id v9 = [v5 dbRowID];
  int v10 = [v6 execute:@"UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@", v8, v9];

  if (v10)
  {
    [v5 setNeedsSave:0];
  }
  else
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveServerZone:toDB:]();
    }
  }
  return v10;
}

- (BOOL)saveServerZoneToDB:(id)a3
{
  return [(BRCAccountSessionFPFS *)self saveServerZone:a3 toDB:self->_serverDB];
}

- (BOOL)saveClientZoneToDB:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dbRowID];

  if (!v5)
  {
    int v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveClientZoneToDB:]();
    }
  }
  clientDB = self->_clientDB;
  uint64_t v7 = [v4 plist];
  id v8 = [v4 dbRowID];
  BOOL v9 = [(BRCPQLConnection *)clientDB execute:@"UPDATE client_zones SET zone_plist = %@ WHERE rowid = %@", v7, v8];

  if (v9)
  {
    [v4 setNeedsSave:0];
  }
  else
  {
    int v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveClientZoneToDB:]();
    }
  }
  return v9;
}

- (BOOL)createServerZone:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  serverDB = self->_serverDB;
  id v6 = [v4 ownerName];
  uint64_t v7 = [v4 zoneName];
  id v8 = [v4 plist];
  LOBYTE(serverDB) = [(BRCPQLConnection *)serverDB execute:@"INSERT OR IGNORE INTO server_zones (zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@)", v6, v7, v8];

  if (serverDB)
  {
    if ([(BRCPQLConnection *)self->_serverDB changes] < 1)
    {
      id v17 = brc_bread_crumbs();
      __int16 v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:]();
      }

      id v19 = self->_serverDB;
      __int16 v20 = [v4 ownerName];
      v21 = [v4 zoneName];
      int v10 = [(PQLConnection *)v19 numberWithSQL:@"SELECT rowid from server_zones WHERE zone_owner = %@ and zone_name = %@", v20, v21];

      if (!v10)
      {
        v33 = brc_bread_crumbs();
        v34 = brc_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:]();
        }
      }
      uint64_t v22 = [v4 dbRowID];

      if (v22)
      {
        __darwin_ino64_t v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          id v31 = [v4 dbRowID];
          *(_DWORD *)buf = 138412802;
          __darwin_ino64_t v36 = v31;
          __int16 v37 = 2112;
          uint64_t v38 = (uint64_t)v10;
          __int16 v39 = 2112;
          unint64_t v40 = v23;
          _os_log_fault_impl(&dword_23FA42000, v24, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a new rowid for already existing zone (sct.dbRowID=%@ rowID=%@)%@", buf, 0x20u);
        }
      }
      else
      {
        [v4 setDbRowID:v10];
      }
      unint64_t v27 = self->_serverDB;
      __int16 v28 = [v4 plist];
      LOBYTE(v27) = [(BRCPQLConnection *)v27 execute:@"UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@", v28, v10];

      if (v27) {
        goto LABEL_25;
      }
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = [(BRCPQLConnection *)self->_serverDB lastError];
        *(_DWORD *)buf = 138412802;
        __darwin_ino64_t v36 = v4;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v32;
        __int16 v39 = 2112;
        unint64_t v40 = v11;
        _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to update plist for zone %@: %@%@", buf, 0x20u);
      }
    }
    else
    {
      BOOL v9 = [v4 dbRowID];

      if (!v9)
      {
        id v25 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
        [v4 setDbRowID:v25];

        __int16 v26 = [v4 dbRowID];

        if (v26)
        {
LABEL_26:
          id v14 = [v4 ownerName];
          id v15 = [(BRCAccountSessionFPFS *)self createUserKeyForOwnerName:v14];
          BOOL v16 = v15 != 0;
          goto LABEL_27;
        }
        int v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSessionFPFS(BRCDatabaseManager) saveServerZone:toDB:]();
        }
        goto LABEL_24;
      }
      int v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      id v12 = [v4 dbRowID];
      uint64_t v13 = [(BRCPQLConnection *)self->_serverDB lastInsertedRowID];
      *(_DWORD *)buf = 138412802;
      __darwin_ino64_t v36 = v12;
      __int16 v37 = 2048;
      uint64_t v38 = v13;
      __int16 v39 = 2112;
      unint64_t v40 = v10;
      _os_log_fault_impl(&dword_23FA42000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: sct.dbRowID is %@ lastInsertedRow is %lld%@", buf, 0x20u);
    }

    goto LABEL_24;
  }
  id v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
  {
    __int16 v30 = [(BRCPQLConnection *)self->_serverDB lastError];
    *(_DWORD *)buf = 138412802;
    __darwin_ino64_t v36 = v4;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v30;
    __int16 v39 = 2112;
    unint64_t v40 = v14;
    _os_log_error_impl(&dword_23FA42000, v15, (os_log_type_t)0x90u, "[ERROR] Failed to create server zone %@:  %@%@", buf, 0x20u);
  }
  BOOL v16 = 0;
LABEL_27:

  return v16;
}

- (BOOL)deleteServerZone:(id)a3
{
  serverDB = self->_serverDB;
  id v4 = [a3 dbRowID];
  LOBYTE(serverDB) = [(BRCPQLConnection *)serverDB execute:@"DELETE FROM server_zones WHERE rowid = %@", v4];

  return (char)serverDB;
}

- (void)_enumerateAppLibraryRowIDs:(id)a3 usingBlock:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, void *, void *))a4;
  id v6 = (void *)[v10 fetch:@"SELECT container_id, rowid FROM rowid_reservations"];
  if ([v6 next])
  {
    do
    {
      uint64_t v7 = (void *)MEMORY[0x2455D97F0]();
      id v8 = [v6 stringAtIndex:0];
      BOOL v9 = [v6 numberAtIndex:1];
      v5[2](v5, v8, v9);
    }
    while (([v6 next] & 1) != 0);
  }
  [v6 close];
}

- (id)_reserveRowIDForLibrary:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  if ([(BRCPQLConnection *)self->_serverDB execute:@"INSERT INTO rowid_reservations (container_id) VALUES (%@)", v4])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
    if (v5) {
      goto LABEL_9;
    }
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:]();
    }
  }
  else
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      BOOL v9 = [(BRCPQLConnection *)self->_serverDB lastError];
      *(_DWORD *)buf = 138412802;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_fault_impl(&dword_23FA42000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: couldn't allocate a rowid. libraryID %@ error %@%@", buf, 0x20u);
    }
    id v5 = 0;
  }

LABEL_9:
  return v5;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4 supportsEnhancedDrivePrivacy:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [v7 zoneRowID];

  if (!v9)
  {
    uint64_t v22 = brc_bread_crumbs();
    __darwin_ino64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:]();
    }
  }
  id v10 = [v7 plist];
  id v11 = [v7 zoneRowID];
  if (v5)
  {
    __int16 v12 = [v7 childBasehashSalt];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "saltingState"));
    __int16 v14 = [v7 dbRowID];
    int v15 = [v8 execute:@"UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@, child_basehash_salt = %@, salting_state = %@ WHERE rowid = %@", v10, v11, v12, v13, v14];

    if (v15)
    {
LABEL_4:
      [v7 setNeedsSave:0];
      BOOL v16 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    id v17 = [v7 dbRowID];
    int v18 = [v8 execute:@"UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@ WHERE rowid = %@", v10, v11, v17];

    if (v18) {
      goto LABEL_4;
    }
  }
  id v19 = brc_bread_crumbs();
  __int16 v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSessionFPFS(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:]();
  }

  BOOL v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BRCUserDefaults defaultsForMangledID:0];
  LOBYTE(self) = -[BRCAccountSessionFPFS saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:](self, "saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:", v7, v6, [v8 supportsEnhancedDrivePrivacy]);

  return (char)self;
}

- (BOOL)saveAppLibraryToDB:(id)a3
{
  return [(BRCAccountSessionFPFS *)self saveAppLibrary:a3 toDB:self->_clientDB];
}

- (id)newAppLibraryFromPQLResultSet:(id)a3 version:(int)a4
{
  id v6 = a3;
  uint64_t v22 = [v6 numberAtIndex:0];
  int v7 = 1;
  id v8 = [v6 stringAtIndex:1];
  BOOL v9 = [(BRCAccountSessionFPFS *)self fixObfuscatedMangledID:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v9];
  id v11 = _BRCClassesForContainerState();
  __int16 v12 = [v6 unarchivedObjectOfClasses:v11 atIndex:2];

  uint64_t v13 = [v6 numberAtIndex:3];
  if (a4 < 3)
  {
    __int16 v14 = 0;
  }
  else
  {
    __int16 v14 = [v6 objectOfClass:objc_opt_class() atIndex:4];
    int v15 = [v6 numberAtIndex:5];
    int v7 = [v15 intValue];
  }
  BOOL v16 = [BRCAppLibrary alloc];
  id v17 = [v6 db];
  LODWORD(v21) = v7;
  BYTE2(v20) = 0;
  LOWORD(v20) = 0;
  int v18 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v16, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v10, v22, v13, v17, v12, self, v20, 0, v14, v21);

  return v18;
}

- (BOOL)_createAppLibrary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 dbRowID];

  if (!v5)
  {
    id v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _createAppLibrary:]();
    }
  }
  id v6 = [v4 zoneRowID];

  if (!v6)
  {
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:]();
    }
  }
  int v7 = +[BRCUserDefaults defaultsForMangledID:0];
  int v8 = [v7 supportsEnhancedDrivePrivacy];

  clientDB = self->_clientDB;
  id v10 = [v4 dbRowID];
  id v11 = [v4 appLibraryID];
  __int16 v12 = [v4 plist];
  uint64_t v13 = [v4 zoneRowID];
  __int16 v14 = (void *)v13;
  if (v8)
  {
    int v15 = [v4 childBasehashSalt];
    BOOL v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "saltingState"));
    BOOL v17 = [(BRCPQLConnection *)clientDB execute:@"INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state)  VALUES (%@, %@, %@, %@, %@, %@)", v10, v11, v12, v14, v15, v16];
  }
  else
  {
    BOOL v17 = [(BRCPQLConnection *)clientDB execute:@"INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid)  VALUES (%@, %@, %@, %@)", v10, v11, v12, v13];
  }

  return v17;
}

- (BOOL)_deleteAppLibrary:(id)a3
{
  clientDB = self->_clientDB;
  id v4 = [a3 dbRowID];
  LOBYTE(clientDB) = [(BRCPQLConnection *)clientDB execute:@"DELETE FROM app_libraries WHERE rowid = %@", v4];

  return (char)clientDB;
}

- (id)_appLibrariesEnumerator:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BRCUserDefaults defaultsForMangledID:0];
  int v6 = [v5 supportsEnhancedDrivePrivacy];

  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  if (self->_forDBDump)
  {
    int v8 = [v4 userVersion];
    unint64_t v9 = [v8 unsignedLongValue];

    if (v9 >= 0x7544) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = 2;
    }
  }
  id v10 = [(BRCAccountSessionFPFS *)self _appLibrariesEnumerator:v4 version:v7];

  return v10;
}

- (id)_appLibrariesEnumerator:(id)a3 version:(int)a4
{
  if (a4 <= 2) {
    uint64_t v7 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries";
  }
  else {
    uint64_t v7 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries";
  }
  int v8 = (void *)[a3 fetch:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__BRCAccountSessionFPFS_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke;
  v11[3] = &unk_26507F1C0;
  void v11[4] = self;
  int v12 = a4;
  unint64_t v9 = [v8 enumerateObjects:v11];

  return v9;
}

id __77__BRCAccountSessionFPFS_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newAppLibraryFromPQLResultSet:a2 version:*(unsigned int *)(a1 + 40)];
  return v2;
}

- (id)_appLibraryByName:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[BRCUserDefaults defaultsForMangledID:0];
  int v9 = [v8 supportsEnhancedDrivePrivacy];

  if (v9) {
    id v10 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries WHERE app_library_name = %@";
  }
  else {
    id v10 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@";
  }
  id v11 = objc_msgSend(v6, "fetch:", v10, v7);

  id v12 = 0;
  if ([v11 next])
  {
    if (v9) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 2;
    }
    id v12 = [(BRCAccountSessionFPFS *)self newAppLibraryFromPQLResultSet:v11 version:v13];
  }

  return v12;
}

- (BOOL)_createClientZone:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 dbRowID];

  if (!v5)
  {
    BOOL v17 = brc_bread_crumbs();
    int v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) saveClientZoneToDB:]();
    }
  }
  id v6 = [v4 mangledID];
  uint64_t v7 = [v6 ownerName];
  int v8 = (void *)v7;
  int v9 = (void *)*MEMORY[0x263EFD488];
  if (v7) {
    int v9 = (void *)v7;
  }
  id v10 = v9;

  clientDB = self->_clientDB;
  id v12 = [v4 dbRowID];
  uint64_t v13 = [v4 zoneName];
  __int16 v14 = [v4 plist];

  BOOL v15 = [(BRCPQLConnection *)clientDB execute:@"INSERT OR REPLACE INTO client_zones (rowid, zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@, %@)", v12, v10, v13, v14];
  return v15;
}

- (BOOL)_deleteClientZone:(id)a3
{
  clientDB = self->_clientDB;
  id v4 = [a3 dbRowID];
  LOBYTE(clientDB) = [(BRCPQLConnection *)clientDB execute:@"DELETE FROM client_zones where rowid = %@", v4];

  return (char)clientDB;
}

- (id)newSharedClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:1];
  int v8 = [v5 stringAtIndex:2];
  int v9 = [(BRCAccountSessionFPFS *)self fixObfuscatedMangledID:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithZoneName:v9 ownerName:v7];
  id v11 = _BRCClassesForContainerState();
  id v12 = [v5 unarchivedObjectOfClasses:v11 atIndex:3];

  if (!v12)
  {
    BOOL v15 = brc_bread_crumbs();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:]();
    }
  }
  uint64_t v13 = [(BRCClientZone *)[BRCSharedClientZone alloc] initWithMangledID:v10 dbRowID:v6 plist:v12 session:self initialCreation:0];

  return v13;
}

- (id)_sharedClientZonesEnumerator
{
  uint64_t v3 = [(BRCAccountSessionFPFS *)self clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner != %@", *MEMORY[0x263EFD488]];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__BRCAccountSessionFPFS_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke;
  v7[3] = &unk_26507F1E8;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __73__BRCAccountSessionFPFS_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newSharedClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)newSharedServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:1];
  int v8 = [v5 stringAtIndex:2];
  int v9 = [(BRCAccountSessionFPFS *)self fixObfuscatedMangledID:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithZoneName:v9 ownerName:v7];
  id v11 = _BRCClassesForContainerState();
  id v12 = [v5 unarchivedObjectOfClasses:v11 atIndex:3];

  if (!v12)
  {
    BOOL v15 = brc_bread_crumbs();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:]();
    }
  }
  uint64_t v13 = [[BRCSharedServerZone alloc] initWithMangledID:v10 dbRowID:v6 plist:v12 session:self];

  return v13;
}

- (id)_sharedServerZonesEnumerator:(id)a3
{
  id v4 = (void *)[a3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner != %@", *MEMORY[0x263EFD488]];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke;
  v7[3] = &unk_26507F1E8;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __74__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newSharedServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_sharedServerZoneByName:(id)a3 ownerName:(id)a4 db:(id)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke;
  v7[3] = &unk_26507F1E8;
  v7[4] = self;
  id v5 = (void *)[a5 fetchObject:v7, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@", a4, a3 sql];
  return v5;
}

id __82__BRCAccountSessionFPFS_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newSharedServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)newPrivateClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:2];
  int v8 = [(BRCAccountSessionFPFS *)self fixObfuscatedMangledID:v7];

  int v9 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithZoneName:v8 ownerName:0];
  id v10 = _BRCClassesForContainerState();
  id v11 = [v5 unarchivedObjectOfClasses:v10 atIndex:3];

  if (!v11)
  {
    __int16 v14 = brc_bread_crumbs();
    BOOL v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:]();
    }
  }
  id v12 = [[BRCPrivateClientZone alloc] initWithMangledID:v9 dbRowID:v6 plist:v11 session:self initialCreation:0];

  return v12;
}

- (id)_privateClientZonesEnumerator
{
  uint64_t v3 = [(BRCAccountSessionFPFS *)self clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@", *MEMORY[0x263EFD488]];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke;
  v7[3] = &unk_26507F1E8;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __74__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_privateClientZoneByName:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByName_db___block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND zone_name = %@ AND zone_plist IS NOT NULL", *MEMORY[0x263EFD488], a3 sql];
  return v4;
}

id __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_privateClientZoneByID:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByID_db___block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND rowid = %@", *MEMORY[0x263EFD488], a3 sql];
  return v4;
}

id __71__BRCAccountSessionFPFS_BRCDatabaseManager___privateClientZoneByID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)newPrivateServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:2];
  int v8 = [(BRCAccountSessionFPFS *)self fixObfuscatedMangledID:v7];

  int v9 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithZoneName:v8 ownerName:0];
  id v10 = _BRCClassesForContainerState();
  id v11 = [v5 unarchivedObjectOfClasses:v10 atIndex:3];

  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
    goto LABEL_7;
  }
  __int16 v14 = brc_bread_crumbs();
  BOOL v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSessionFPFS(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:]();
  }

  if (!v9)
  {
LABEL_7:
    BOOL v16 = brc_bread_crumbs();
    BOOL v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) newPrivateServerZoneFromPQLResultSet:error:]();
    }
  }
LABEL_3:
  id v12 = [(BRCServerZone *)[BRCPrivateServerZone alloc] initWithMangledID:v9 dbRowID:v6 plist:v11 session:self];

  return v12;
}

- (id)_privateServerZoneByName:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZoneByName_db___block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@", *MEMORY[0x263EFD488], a3 sql];
  return v4;
}

id __73__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_privateServerZonesEnumerator:(id)a3
{
  id v4 = (void *)[a3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@", *MEMORY[0x263EFD488]];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke;
  v7[3] = &unk_26507F1E8;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __75__BRCAccountSessionFPFS_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)itemsNeedingIndexingEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5
{
  id v8 = a5;
  int v9 = (void *)[v8 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items AS li   WHERE li.item_notifs_rank >= %lld     AND li.item_type != 3   ORDER BY li.item_notifs_rank ASC LIMIT %lld", a3, a4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __102__BRCAccountSessionFPFS_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke;
  v13[3] = &unk_26507F210;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  id v11 = [v9 enumerateObjects:v13];

  return v11;
}

id __102__BRCAccountSessionFPFS_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)itemsWithSideCarInFlightDiffsEnumerator
{
  id v3 = [(BRCPQLConnection *)self->_clientDB fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0", &unk_26F3DD0A0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__BRCAccountSessionFPFS_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __84__BRCAccountSessionFPFS_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (id)deviceKeyForName:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT key FROM devices WHERE name = %@", a3];
  return v4;
}

- (id)createDeviceKeyForNameInServerDB:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    id v5 = 0;
    goto LABEL_11;
  }
  id v5 = [(BRCAccountSessionFPFS *)self deviceKeyForName:v4 db:self->_serverDB];
  if (v5) {
    goto LABEL_11;
  }
  if (![(BRCPQLConnection *)self->_serverDB execute:@"INSERT INTO devices (name) VALUES (%@)", v4])
  {
    id v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createDeviceKeyForNameInServerDB:]();
    }

    goto LABEL_10;
  }
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(BRCDatabaseManager) createDeviceKeyForNameInServerDB:]();
  }

  id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
LABEL_11:

  return v5;
}

+ (id)userIdentityForKey:(id)a3 db:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[v5 fetchObjectOfClass:objc_opt_class(), @"SELECT user_plist FROM users WHERE user_key = %@", v6 sql];

  return v7;
}

- (id)userIdentityForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() userIdentityForKey:v4 db:self->_clientDB];

  return v5;
}

+ (id)userIdentityForName:(id)a3 db:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[v5 fetchObjectOfClass:objc_opt_class(), @"SELECT user_plist FROM users WHERE user_name = %@", v6 sql];

  return v7;
}

- (void)_setUserIdentity:(id)a3 forName:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  id v8 = [v6 nameComponents];
  int v9 = objc_msgSend(v8, "br_formattedName");

  if (!v9)
  {
    int v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _setUserIdentity:forName:]();
    }
  }
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    unint64_t v27 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] learning name '%@' for user %@%@", buf, 0x20u);
  }

  if (!v6)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _setUserIdentity:forName:]();
    }
  }
  id v12 = [(BRCAccountSessionFPFS *)self createUserKeyForOwnerName:v7];
  if (![(BRCPQLConnection *)self->_serverDB execute:@"UPDATE users SET user_plist = %@ WHERE user_name = %@", v6, v7])
  {
    uint64_t v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      BOOL v17 = [(BRCPQLConnection *)self->_serverDB lastError];
      *(_DWORD *)buf = 138412802;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v17;
      __int16 v26 = 2112;
      unint64_t v27 = v13;
      _os_log_fault_impl(&dword_23FA42000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user identity for name '%@': %@%@", buf, 0x20u);
    }
  }
  if ([(BRCPQLConnection *)self->_serverDB changes] != 1)
  {
    BOOL v15 = brc_bread_crumbs();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _setUserIdentity:forName:]();
    }
  }
}

- (void)learnParticipantIdentitiesForShare:(id)a3 forceUpdate:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v33 = self;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v31 = v6;
  id v7 = [v6 participants];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    uint64_t v34 = *MEMORY[0x263EFD488];
    *(void *)&long long v9 = 138412290;
    long long v28 = v9;
    BOOL v32 = a4;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "isCurrentUser", v28) & 1) == 0 && objc_msgSend(v13, "acceptanceStatus") == 2)
        {
          id v14 = [v13 userIdentity];
          BOOL v15 = v14;
          if (v14)
          {
            BOOL v16 = [v14 userRecordID];
            if (v16)
            {
              brc_bread_crumbs();
              BOOL v17 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
              int v18 = brc_default_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                unint64_t v40 = v13;
                __int16 v41 = 2112;
                unint64_t v42 = v15;
                __int16 v43 = 2112;
                stat v44 = v17;
                _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] user %@ has identity %@%@", buf, 0x20u);
              }

              id v19 = [v15 userRecordID];
              uint64_t v20 = [v19 recordName];

              if (([v20 isEqualToString:v34] & 1) == 0)
              {
                if (a4
                  || ([(id)objc_opt_class() userIdentityForName:v20 db:v33->_serverDB],
                      uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                      v21,
                      !v21))
                {
                  uint64_t v22 = [v15 nameComponents];

                  if (v22)
                  {
                    id v23 = [[BRFieldUserIdentity alloc] initWithCKUserIdentity:v15];
                    __int16 v24 = [(BRFieldUserIdentity *)v23 nameComponents];
                    id v25 = objc_msgSend(v24, "br_formattedName");

                    if (!v25)
                    {
                      __int16 v30 = brc_bread_crumbs();
                      __int16 v26 = brc_default_log();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = v28;
                        unint64_t v40 = v30;
                        _os_log_fault_impl(&dword_23FA42000, v26, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: userFormattedName != nil%@", buf, 0xCu);
                      }
                    }
                    [(BRCAccountSessionFPFS *)v33 _setUserIdentity:v23 forName:v20];
                    a4 = v32;
                  }
                  else
                  {
                    brc_bread_crumbs();
                    id v23 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
                    id v25 = brc_default_log();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                    {
                      unint64_t v29 = [v15 debugDescription];
                      *(_DWORD *)buf = 138412802;
                      unint64_t v40 = v29;
                      __int16 v41 = 2112;
                      unint64_t v42 = v20;
                      __int16 v43 = 2112;
                      stat v44 = v23;
                      _os_log_fault_impl(&dword_23FA42000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nameless identity: %@ (user %@)%@", buf, 0x20u);
                    }
                  }
                }
              }
              goto LABEL_26;
            }
          }
          else
          {
            if ([v13 role] == 1)
            {
              BOOL v16 = brc_bread_crumbs();
              uint64_t v20 = brc_default_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v40 = v13;
                __int16 v41 = 2112;
                unint64_t v42 = v16;
                _os_log_fault_impl(&dword_23FA42000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: owner %@ with no user identity%@", buf, 0x16u);
              }
            }
            else
            {
              BOOL v16 = brc_bread_crumbs();
              uint64_t v20 = brc_default_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v40 = v13;
                __int16 v41 = 2112;
                unint64_t v42 = v16;
                _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Participant %@ has no user identity%@", buf, 0x16u);
              }
            }
LABEL_26:
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v27 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
      uint64_t v10 = v27;
    }
    while (v27);
  }
}

- (id)userKeyForOwnerName:(id)a3 db:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:*MEMORY[0x263EFD488]]) {
    id v7 = &unk_26F3DD0B8;
  }
  else {
    id v7 = (void *)[v6 numberWithSQL:@"SELECT user_key FROM users WHERE user_name = %@", v5];
  }

  return v7;
}

- (id)userNameForKey:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 stringWithSQL:@"SELECT user_name FROM users WHERE user_key = %@", a3];
  return v4;
}

- (id)createUserKeyForOwnerName:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BRCAccountSessionFPFS *)self userKeyForOwnerName:v4 db:self->_serverDB];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
      id v6 = v7;
LABEL_11:
      uint64_t v11 = v7;
      goto LABEL_16;
    }
    if ([(BRCPQLConnection *)self->_serverDB execute:@"INSERT INTO users (user_name) VALUES (%@)", v4])
    {
      long long v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) createUserKeyForOwnerName:]();
      }

      objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      BOOL v15 = [(BRCPQLConnection *)self->_serverDB lastError];
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_fault_impl(&dword_23FA42000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user name: '%@': %@%@", buf, 0x20u);
    }
  }
  else
  {
    id v6 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createUserKeyForOwnerName:]();
    }
  }
  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

+ (id)nameComponentsForKey:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_msgSend(v6, "br_isEqualToNumber:", &unk_26F3DD0B8) & 1) == 0)
  {
    long long v9 = [a1 userIdentityForKey:v6 db:v7];
    uint64_t v10 = v9;
    if (v9) {
      [v9 nameComponents];
    }
    else {
    uint64_t v8 = +[BRFieldUserIdentity unknownPersonNameComponents];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)nameComponentsForName:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x263EFD488]])
  {
    uint64_t v8 = 0;
  }
  else
  {
    long long v9 = [a1 userIdentityForName:v6 db:v7];
    uint64_t v10 = v9;
    if (v9) {
      [v9 nameComponents];
    }
    else {
    uint64_t v8 = +[BRFieldUserIdentity unknownPersonNameComponents];
    }
  }
  return v8;
}

- (void)_clearNeedsUpgradeErrorsWithBrVersion:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(BRCDatabaseManager) _clearNeedsUpgradeErrorsWithBrVersion:]();
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(BRCAccountSessionFPFS *)self _privateClientZonesEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v11 state] & 0x200000) != 0)
        {
          objc_msgSend(v11, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          [(BRCAccountSessionFPFS *)self saveClientZoneToDB:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [(BRCAccountSessionFPFS *)self _sharedClientZonesEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        if (([v17 state] & 0x200000) != 0)
        {
          objc_msgSend(v17, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          [(BRCAccountSessionFPFS *)self saveClientZoneToDB:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  __int16 v18 = [(BRCAccountSessionFPFS *)self clientDB];
  [v18 execute:@"UPDATE client_items SET item_min_supported_os_rowid = NULL"];
}

+ (void)_registerLastBootIfNeeded:(id)a3 table:(id)a4 skipControlFiles:(BOOL)a5 deviceIDChanged:(BOOL *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = OSVersion();
  uint64_t v12 = BRVersion();
  uint64_t v13 = [v9 userVersion];
  uint64_t v14 = NSURL;
  uint64_t v15 = objc_msgSend(NSString, "br_currentSupportDir");
  BOOL v16 = [v15 stringByAppendingPathComponent:@"device-tracking"];
  id v17 = [v14 fileURLWithPath:v16 isDirectory:0];

  __darwin_ino64_t v37 = 0;
  id v18 = v17;
  if (file_id_from_control_file((const char *)[v18 fileSystemRepresentation], &v37, v7)
    || ([NSNumber numberWithUnsignedLongLong:v37],
        (long long v22 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[BRCAccountSessionFPFS(BRCDatabaseManager) _registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:]();
    }

    int v21 = 0;
    long long v22 = 0;
  }
  else
  {
    int v21 = 1;
  }
  long long v23 = (void *)[v9 fetch:@"SELECT os, br, bird_schema, db_schema, device_id FROM %@ ORDER BY rowid DESC LIMIT 1", v10];
  if (![v23 next])
  {
    [v23 close];
LABEL_24:
    [v9 execute:@"INSERT INTO %@ (date,os,br,bird_schema,db_schema,device_id) VALUES (%lu,%@,%@,%u,%@,%@)", v10, time(0), v11, v12, 32005, v13, v22];
    goto LABEL_25;
  }
  int v33 = v21;
  long long v35 = v12;
  long long v36 = a6;
  char v24 = 1;
  long long v25 = [v23 stringAtIndex:1];
  long long v26 = [v23 stringAtIndex:0];
  uint64_t v34 = v11;
  if ([v11 isEqualToString:v26]
    && [v35 isEqualToString:v25]
    && [v23 unsignedIntAtIndex:2] == 32005)
  {
    uint64_t v27 = [v23 numberAtIndex:3];
    int v28 = objc_msgSend(v13, "br_isEqualToNumber:", v27);
    if ((v33 & v28) == 1)
    {
      BOOL v32 = [v23 numberAtIndex:4];
      LOBYTE(v28) = objc_msgSend(v22, "br_isEqualToNumber:", v32);
    }
    char v24 = v28 ^ 1;
  }
  if (v36)
  {
    uint64_t v29 = [v23 numberAtIndex:4];
    if (v29) {
      int v30 = v33;
    }
    else {
      int v30 = 0;
    }
    if (v30 == 1) {
      char v31 = objc_msgSend(v22, "br_isEqualToNumber:", v29) ^ 1;
    }
    else {
      char v31 = 0;
    }
    *long long v36 = v31;
  }
  [v23 close];
  uint64_t v11 = v34;
  uint64_t v12 = v35;
  if (v24) {
    goto LABEL_24;
  }
LABEL_25:
}

- (int64_t)lastBootHistoryTime
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(PQLConnection *)self->_clientDB numberWithSQL:@"SELECT date FROM boot_history ORDER BY rowid DESC LIMIT 1"];
  int64_t v4 = [v3 longValue];

  return v4;
}

+ (BOOL)_checkIntegrity:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 skipControlFiles:(BOOL)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v12 = a4;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  long long v45 = 0uLL;
  uint64_t v46 = 0;
  BOOL v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFiles:deviceIDChanged:error:](v12);
  }

  if (v12)
  {
    id v18 = (void *)[v14 numberWithSQL:@"SELECT count(*) FROM server_state"];
    if (objc_msgSend(v18, "br_isEqualToNumber:", &unk_26F3DD0D0))
    {
      long long v19 = [MEMORY[0x263F8C718] nameWithString:@"server_boot_history"];
      [a1 _registerLastBootIfNeeded:v14 table:v19 skipControlFiles:v10 deviceIDChanged:a7];

      long long v20 = 0;
      int v21 = 0;
      long long v22 = 0;
      long long v23 = 0;
      char v24 = 0;
LABEL_44:
      BOOL v28 = 1;
      goto LABEL_47;
    }
    long long v25 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 22, @"missing entry in the server_state table");
    if (v25)
    {
      long long v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        __int16 v39 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControl"
                             "Files:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a8) {
          __int16 v39 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2112;
        v48 = v25;
        __int16 v49 = 2112;
        unint64_t v50 = v26;
        _os_log_error_impl(&dword_23FA42000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a8) {
      *a8 = v25;
    }

    long long v20 = 0;
    int v21 = 0;
    long long v22 = 0;
    long long v23 = 0;
    char v24 = 0;
    BOOL v28 = 0;
    goto LABEL_47;
  }
  if (v15)
  {
    char v24 = (void *)[v14 fetch:@"SELECT old, new, counter, os, br FROM backup_detector"];
    if ([v24 next])
    {
      *(void *)&long long v45 = [v24 unsignedLongLongAtIndex:0];
      *((void *)&v45 + 1) = [v24 unsignedLongLongAtIndex:1];
      uint64_t v46 = [v24 unsignedLongLongAtIndex:2];
      stat v44 = [v24 stringAtIndex:3];
      long long v22 = [v24 stringAtIndex:4];
    }
    else
    {
      long long v22 = 0;
      stat v44 = 0;
    }
    [v24 close];
    if (!v10)
    {
      *(_OWORD *)buf = v45;
      *(void *)&buf[16] = v46;
      if (![v15 _stepBackupDetector:buf newState:&v45 error:a8])
      {
        id v18 = 0;
        long long v20 = 0;
        int v21 = 0;
LABEL_46:
        BOOL v28 = 0;
        long long v23 = v44;
        goto LABEL_47;
      }
    }
    unint64_t v42 = a8;
  }
  else
  {
    unint64_t v42 = a8;
    stat v44 = 0;
    long long v22 = 0;
    char v24 = 0;
  }
  int v21 = OSVersion();
  long long v20 = BRVersion();
  if (([v22 isEqualToString:v20] & 1) == 0) {
    [v15 _clearNeedsUpgradeErrorsWithBrVersion:v20];
  }
  if (v15
    && ([v14 execute:@"UPDATE backup_detector set old = %llu, new = %llu, counter = %llu, br = %@", v45, v46, v20] & 1) == 0)
  {
    int v33 = [v14 lastError];
    if (v33)
    {
      uint64_t v34 = brc_bread_crumbs();
      long long v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        __int16 v41 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControl"
                             "Files:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42) {
          __int16 v41 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2112;
        v48 = v33;
        __int16 v49 = 2112;
        unint64_t v50 = v34;
        _os_log_error_impl(&dword_23FA42000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (v42) {
      *unint64_t v42 = v33;
    }

    id v18 = 0;
    goto LABEL_46;
  }
  id v18 = (void *)[v14 numberWithSQL:@"SELECT count(*) FROM client_state"];
  if ((objc_msgSend(v18, "br_isEqualToNumber:", &unk_26F3DD0D0) & 1) == 0)
  {
    int v30 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 22, @"missing entry in the client_state table");
    if (v30)
    {
      char v31 = brc_bread_crumbs();
      BOOL v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        unint64_t v40 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControl"
                             "Files:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42) {
          unint64_t v40 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        v48 = v30;
        __int16 v49 = 2112;
        unint64_t v50 = v31;
        _os_log_error_impl(&dword_23FA42000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (v42) {
      *unint64_t v42 = v30;
    }

    goto LABEL_46;
  }
  id v43 = v15;
  uint64_t v29 = [MEMORY[0x263F8C718] nameWithString:@"boot_history"];
  [a1 _registerLastBootIfNeeded:v14 table:v29 skipControlFiles:v10 deviceIDChanged:a7];

  long long v23 = v44;
  if (![v44 isEqualToString:v21]
    || ([v22 isEqualToString:v20] & 1) == 0)
  {
    long long v36 = brc_bread_crumbs();
    __darwin_ino64_t v37 = brc_default_log();
    id v15 = v43;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2112;
      v48 = v20;
      __int16 v49 = 2112;
      unint64_t v50 = v21;
      __int16 v51 = 2112;
      unint64_t v52 = v36;
      _os_log_impl(&dword_23FA42000, v37, OS_LOG_TYPE_DEFAULT, "[NOTICE] CloudDocs was upgraded from [%@ on %@] to [%@ on %@]%@", buf, 0x34u);
    }

    if (v43) {
      [v14 execute:@"UPDATE backup_detector SET os = %@", v21];
    }
    goto LABEL_44;
  }
  BOOL v28 = 1;
  id v15 = v43;
LABEL_47:

  return v28;
}

+ (id)_classesForClientState
{
  id v18 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  BOOL v12 = objc_msgSend(v18, "initWithObjects:", v17, v16, v15, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  return v12;
}

- (void)_loadClientStateFromDB:(id)a3
{
  id v4 = a3;
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:].cold.5();
  }

  uint64_t v7 = (void *)[v4 fetch:@"SELECT * FROM client_state"];
  uint64_t v8 = +[BRCAccountSessionFPFS _classesForClientState];
  if (![v7 next])
  {
    abc_report_panic_with_signature();
    int v21 = NSString;
    long long v22 = [v4 lastError];
    [v21 stringWithFormat:@"there should always be one row in client_state {%@}", v22];
    objc_claimAutoreleasedReturnValue();

    long long v23 = brc_bread_crumbs();
    char v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
    }

    brc_append_system_info_to_message();
    long long v25 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1615, v25);
  }
  uint64_t v9 = [v7 dataAtIndex:0];
  if (v9)
  {
    id v26 = 0;
    uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v8 fromData:v9 error:&v26];
    id v11 = v26;
    if (v11)
    {
      id v12 = v11;
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Error while unarchiving client state %@", v12];
      objc_claimAutoreleasedReturnValue();
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      uint64_t v15 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1610, v15);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v7 close];
  uint64_t v16 = [[BRCClientState alloc] initWithDictionary:v10 clientStateData:v9];
  p_clientState = &self->_clientState;
  clientState = self->_clientState;
  self->_clientState = v16;

  if (v10)
  {
    long long v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:](p_clientState);
    }
  }
  else
  {
    long long v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _loadClientStateFromDB:](p_clientState);
    }
  }
}

- (BOOL)_finishClientTruthConnectionSetupWithError:(id *)a3
{
  id v4 = self->_clientDB;
  [(BRCAccountSessionFPFS *)self _loadClientStateFromDB:v4];
  uint64_t v5 = [(PQLConnection *)v4 stringWithSQL:@"SELECT uuid FROM backup_detector"];
  databaseID = self->_databaseID;
  self->_databaseID = v5;

  if (!self->_databaseID)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]();
    }
  }
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke;
  v19[3] = &unk_26507F288;
  objc_copyWeak(&v20, &location);
  [(BRCPQLConnection *)v4 setPreFlushHook:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2;
  v17[3] = &unk_26507F288;
  objc_copyWeak(&v18, &location);
  [(BRCPQLConnection *)v4 setPostFlushHook:v17];
  uint64_t v7 = [(BRCPQLConnection *)v4 autoRollbackHandler];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_338;
  v14[3] = &unk_26507F2D0;
  objc_copyWeak(&v16, &location);
  id v8 = v7;
  id v15 = v8;
  [(BRCPQLConnection *)v4 setAutoRollbackHandler:v14];
  [(BRCPQLConnection *)v4 execute:@"CREATE TEMP TRIGGER child_item_count_notifs  AFTER UPDATE OF visible_child_count ON main.client_items  BEGIN  UPDATE client_items SET item_notifs_rank = bump_notifs_rank_and_trigger_notifs(old.rowid)   WHERE old.visible_child_count != new.visible_child_count     AND rowid = old.rowid     AND item_type = 0 ; END"];
  uint64_t v9 = +[BRCUserDefaults defaultsForMangledID:0];
  [v9 dbBatchDelay];
  -[BRCPQLConnection usePacedBatchingOnTargetQueue:withInterval:changeCount:](v4, "usePacedBatchingOnTargetQueue:withInterval:changeCount:", self->_clientTruthWorkloop, [v9 dbBatchSize], v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();
    }
  }
  if (([WeakRetained isCancelled] & 1) == 0)
  {
    id v6 = WeakRetained[24];
    memset(v24, 0, sizeof(v24));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1646, v24);
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v26 = v24[0];
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      int v30 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx db pre-flush: flushing client-state %@%@", buf, 0x20u);
    }

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_323;
    v22[3] = &unk_26507F238;
    objc_copyWeak(&v23, v4);
    [WeakRetained enumerateServerZones:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_325;
    v20[3] = &unk_26507F260;
    objc_copyWeak(&v21, v4);
    [WeakRetained enumerateAppLibraries:v20];
    id v19 = 0;
    int v9 = [v6 hasStateChangesAndClearSaveStatusWithResultingState:&v19];
    id v10 = v19;
    if (v9)
    {
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2();
      }

      if (([v3 execute:@"UPDATE client_state SET v = %@", v10] & 1) == 0)
      {
        abc_report_panic_with_signature();
        [NSString stringWithFormat:@"unable to flush client state, crash to maintain consistency"];
        objc_claimAutoreleasedReturnValue();
        id v15 = brc_bread_crumbs();
        id v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          uint64_t v17 = brc_append_system_info_to_message();
          __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(v17, (uint64_t)v15, (uint64_t)buf, v16);
        }

        brc_append_system_info_to_message();
        id v18 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
        __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1668, v18);
      }
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    __brc_leave_section(v24);
  }
}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_323(uint64_t a1, void *a2)
{
  id v3 = [a2 clientZone];
  if ([v3 needsSave])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained saveClientZoneToDB:v3];

    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_323_cold_1();
    }
  }
  return 1;
}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_325(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 needsSave])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained saveAppLibraryToDB:v3];

    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_325_cold_1();
    }
  }
  return 1;
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();
    }
  }
  if (([WeakRetained isCancelled] & 1) == 0)
  {
    memset(v13, 0, sizeof(v13));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1682, v13);
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(v13);
    }

    uint64_t v7 = +[BRCPersistedState loadFromClientStateInSession:WeakRetained];
    uint64_t v8 = [v7 nextNotifRank];

    int v9 = [WeakRetained notificationManager];
    [v9 flushUpdatesWithRank:v8];

    [WeakRetained enumerateClientZones:&__block_literal_global_337];
    id v10 = [WeakRetained recentsEnumerator];
    [v10 maxNotifRankWasFlushed];

    __brc_leave_section(v13);
  }
}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_334(uint64_t a1, void *a2)
{
  return 1;
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_338(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 domain];
  if (v10 == (void *)*MEMORY[0x263F8C730])
  {
    uint64_t v11 = [v9 code];

    if (v11 != 13) {
      goto LABEL_7;
    }
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_338_cold_2();
    }

    id v10 = +[BRCDaemonFPFS daemon];
    [v10 restart];
  }

LABEL_7:
  if (objc_msgSend(v9, "brc_isDatabaseRemovalError"))
  {
    uint64_t v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_338_cold_1();
    }

    id v16 = +[BRCDaemonFPFS daemon];
    [v16 restart];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v18 = [WeakRetained extensionBackChannel];

  if (v18)
  {
    id v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      int v22 = 138412802;
      id v23 = WeakRetained;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      __int16 v27 = v19;
      _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %@ - Got error: %@. Invalidating the extension...%@", (uint8_t *)&v22, 0x20u);
    }

    id v21 = [WeakRetained extensionBackChannel];
    [v21 invalidateExtension];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_finishServerTruthConnectionSetupWithError:(id *)a3
{
  serverDB = self->_serverDB;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke;
  v5[3] = &unk_26507F2F8;
  v5[4] = self;
  return [(BRCPQLConnection *)serverDB performWithFlags:1 action:v5];
}

uint64_t __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 fetch:@"SELECT state FROM server_state"];
  if (([v4 next] & 1) == 0)
  {
    uint64_t v6 = [v3 lastError];
    if (v6)
    {
      uint64_t v10 = v6;
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"there should always be one row in server_state: %@", v10];
      objc_claimAutoreleasedReturnValue();
      uint64_t v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      uint64_t v13 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _finishServerTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1770, v13);
    }
    [v4 close];
    goto LABEL_6;
  }
  uint64_t v5 = [v4 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
  [v4 close];
  if (!v5)
  {
LABEL_6:
    uint64_t v5 = objc_alloc_init(BRCServerPersistedState);
    [(BRCServerPersistedState *)v5 saveToDB:v3];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 200);
  *(void *)(v7 + 200) = v5;

  return 1;
}

- (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 initialVersion:(unsigned int *)a5 lastCurrentVersion:(unsigned int *)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  LOBYTE(a8) = [(id)objc_opt_class() openAndValidateDatabase:v14 serverTruth:v12 session:self baseURL:self->_dbURL skipControlFiles:0 initialVersion:a5 lastCurrentVersion:a6 deviceIDChanged:a7 error:a8];

  return (char)a8;
}

+ (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 baseURL:(id)a6 skipControlFiles:(BOOL)a7 initialVersion:(unsigned int *)a8 lastCurrentVersion:(unsigned int *)a9 deviceIDChanged:(BOOL *)a10 error:(id *)a11
{
  BOOL v15 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = @"client.db";
  if (v15) {
    id v20 = @"server.db";
  }
  uint64_t v31 = v20;
  uint64_t v43 = 0;
  brc_bread_crumbs();
  id v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  int v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    __int16 v51 = v21;
    _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening DB %@ in base URL: %@%@", buf, 0x20u);
  }

  if ([a1 _openConnection:v17 serverTruth:v15 databaseName:v31 baseURL:v19 initialVersion:(char *)&v43 + 4 lastCurrentVersion:&v43 error:a11])
  {
    if (a8) {
      *a8 = HIDWORD(v43);
    }
    if (a9) {
      *a9 = v43;
    }
    if (HIDWORD(v43) >> 4 >= 0x753)
    {
      id v23 = brc_bread_crumbs();
      __int16 v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountSessionFPFS(BRCDatabaseManager) openAndValidateDatabase:serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:]();
      }

      a7 = 1;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v51 = __Block_byref_object_copy__1;
    unint64_t v52 = __Block_byref_object_dispose__1;
    id v53 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke;
    v32[3] = &unk_26507F320;
    id v33 = v17;
    id v37 = a1;
    id v34 = v19;
    id v25 = v18;
    BOOL v41 = v15;
    int v39 = HIDWORD(v43);
    int v40 = v43;
    id v35 = v25;
    long long v36 = buf;
    BOOL v42 = a7;
    long long v38 = a10;
    char v26 = [v33 performWithFlags:10 action:v32];
    __int16 v27 = brc_bread_crumbs();
    uint64_t v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)stat v44 = 138412802;
      long long v45 = v31;
      __int16 v46 = 2112;
      uint64_t v47 = v30;
      __int16 v48 = 2112;
      __int16 v49 = v27;
      _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Done with %@ DB: error: %@%@", v44, 0x20u);
    }

    if (a11) {
      *a11 = *(id *)(*(void *)&buf[8] + 40);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    char v26 = 0;
  }

  return v26;
}

uint64_t __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) execute:@"PRAGMA recursive_triggers = true"] & 1) == 0)
  {
    uint64_t v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1();
    }
  }
  id v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v8 = *(unsigned int *)(a1 + 80);
  uint64_t v9 = *(unsigned int *)(a1 + 84);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v4 _validateDatabase:v5 baseURL:v6 session:v10 serverTruth:v7 initialVersion:v8 lastCurrentVersion:v9 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 89);
  id v16 = *(void **)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  id v27 = *(id *)(v19 + 40);
  int v20 = [v16 _checkIntegrity:v13 serverTruth:v14 session:v18 skipControlFiles:v15 deviceIDChanged:v17 error:&v27];
  objc_storeStrong((id *)(v19 + 40), v27);
  if (!v20) {
    return 0;
  }
  id v21 = *(void **)(a1 + 48);
  if (!v21) {
    return 1;
  }
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
  id v26 = *(id *)(v23 + 40);
  uint64_t v24 = [v21 _registerDynamicDBFunctions:v22 error:&v26];
  objc_storeStrong((id *)(v23 + 40), v26);
  return v24;
}

+ (BOOL)_openConnection:(id)a3 serverTruth:(BOOL)a4 databaseName:(id)a5 baseURL:(id)a6 initialVersion:(unsigned int *)a7 lastCurrentVersion:(unsigned int *)a8 error:(id *)a9
{
  uint64_t v14 = a9;
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = brc_bread_crumbs();
  uint64_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.8();
  }

  id v90 = 0;
  BOOL v20 = +[BRCAccountSessionFPFS _openConnection:v15 databaseName:v16 baseURL:v17 readonly:0 error:&v90];
  id v21 = v90;
  if (v20)
  {
    uint64_t v22 = [v15 userVersion];
    uint64_t v23 = [v22 unsignedIntValue];

    if (!v23)
    {
      unsigned int v35 = 0;
      unsigned int v36 = 0;
      if (a4)
      {
LABEL_63:
        if (!a7)
        {
LABEL_65:
          if (a8) {
            *a8 = v36;
          }
          BOOL v34 = 1;
          goto LABEL_68;
        }
LABEL_64:
        *a7 = v35;
        goto LABEL_65;
      }
      goto LABEL_59;
    }
    v87 = a7;
    uint64_t v24 = +[BRCEventsAnalytics sharedAnalytics];
    id v25 = v24;
    if ((v23 - 3000) > 0x3EA)
    {
      if (v23 > 0x75)
      {
        if (v23 < 0x7D06 || (v23 - 32000) < 0x3E8)
        {

          goto LABEL_56;
        }
        BOOL v86 = a4;
        unint64_t v73 = v23 / 0x3E8uLL;
        v74 = brc_bread_crumbs();
        v75 = brc_default_log();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
        }

        +[BRCDatabaseFromTheFutureException raise:@"DatabaseFromTheFuture", @"database has a major version from the future: %d (want at most %d)", v73, 32 format];
      }
      else
      {
        BOOL v86 = a4;
        id v37 = brc_bread_crumbs();
        long long v38 = brc_default_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
        }

        int v39 = objc_msgSend(NSString, "stringWithFormat:", @"old-db-%d.%03d", 0, v23);
        [v25 registerAndSendNewContainerResetWithOutcome:v39];
      }
    }
    else
    {
      BOOL v86 = a4;
      id v26 = brc_bread_crumbs();
      id v27 = brc_default_log();
      uint64_t v28 = (unsigned __int16)v23 / 0x3E8u;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v92 = (unsigned __int16)v23 / 0x3E8u;
        uint64_t v29 = (unsigned __int16)v23 % 0x3E8u;
        *(_WORD *)&v92[4] = 1024;
        *(_DWORD *)&v92[6] = v29;
        *(_WORD *)&v92[10] = 2112;
        *(void *)&v92[12] = v26;
        _os_log_fault_impl(&dword_23FA42000, v27, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
      }
      else
      {
        uint64_t v29 = (unsigned __int16)v23 % 0x3E8u;
      }

      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"internal-db-%d.%03d", v28, v29);
      [v25 registerAndSendNewContainerResetWithOutcome:v30];

      uint64_t v14 = a9;
    }

    int v89 = 61;
    int v40 = sqlite3_file_control((sqlite3 *)[v15 dbHandle], 0, 101, &v89);
    unint64_t v41 = 0x26507D000uLL;
    if (v40)
    {
      int v42 = v40;
      uint64_t v43 = brc_bread_crumbs();
      stat v44 = brc_default_log();
      if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
      {
        v76 = sqlite3_errmsg((sqlite3 *)[v15 dbHandle]);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v92 = v42;
        *(_WORD *)&v92[4] = 2080;
        *(void *)&v92[6] = v76;
        *(_WORD *)&v92[14] = 2112;
        *(void *)&v92[16] = v43;
        _os_log_error_impl(&dword_23FA42000, v44, (os_log_type_t)0x90u, "[ERROR] unable to truncate database: %d; %s%@",
          buf,
          0x1Cu);
      }

      objc_msgSend(v15, "brc_close");
      id v45 = [v15 url];
      int v46 = unlink((const char *)[v45 fileSystemRepresentation]);

      if (v46 < 0)
      {
        int v47 = *__error();
        __int16 v48 = brc_bread_crumbs();
        __int16 v49 = brc_default_log();
        if (os_log_type_enabled(v49, (os_log_type_t)0x90u))
        {
          v79 = [v15 url];
          *(_DWORD *)buf = 138412802;
          *(void *)v92 = v79;
          *(_WORD *)&v92[8] = 1024;
          *(_DWORD *)&v92[10] = v47;
          *(_WORD *)&v92[14] = 2112;
          *(void *)&v92[16] = v48;
          _os_log_error_impl(&dword_23FA42000, v49, (os_log_type_t)0x90u, "[ERROR] can't unlink '%@' %{errno}d%@", buf, 0x1Cu);
        }
        *__error() = v47;
        unint64_t v41 = 0x26507D000;
      }
    }
    else
    {
      objc_msgSend(v15, "brc_close");
    }
    unint64_t v50 = *(void **)(v41 + 2792);
    id v88 = v21;
    char v51 = [v50 _openConnection:v15 databaseName:v16 baseURL:v17 readonly:0 error:&v88];
    id v33 = v88;

    if ((v51 & 1) == 0)
    {
      v59 = brc_bread_crumbs();
      v60 = brc_default_log();
      if (os_log_type_enabled(v60, (os_log_type_t)0x90u)) {
        +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.4();
      }

      if (v14) {
        id *v14 = v33;
      }
      goto LABEL_51;
    }
    unint64_t v52 = [v15 userVersion];
    uint64_t v23 = [v52 unsignedIntValue];

    a4 = v86;
    if (v23)
    {
      id v53 = +[BRCEventsAnalytics sharedAnalytics];
      uint64_t v54 = v53;
      if ((v23 - 3000) <= 0x3EA)
      {
        __int16 v55 = brc_bread_crumbs();
        id v56 = brc_default_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v92 = (unsigned __int16)v23 / 0x3E8u;
          uint64_t v57 = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v92[4] = 1024;
          *(_DWORD *)&v92[6] = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v92[10] = 2112;
          *(void *)&v92[12] = v55;
          _os_log_fault_impl(&dword_23FA42000, v56, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
        }
        else
        {
          uint64_t v57 = (unsigned __int16)v23 % 0x3E8u;
        }

        v58 = objc_msgSend(NSString, "stringWithFormat:", @"internal-db-%d.%03d", (unsigned __int16)v23 / 0x3E8u, v57);
        [v54 registerAndSendNewContainerResetWithOutcome:v58];

LABEL_45:
        v64 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 70, @"db is stale even after recreating");
        if (v64)
        {
          v65 = brc_bread_crumbs();
          v66 = brc_default_log();
          if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
          {
            v80 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            *(void *)v92 = "+[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseUR"
                             "L:initialVersion:lastCurrentVersion:error:]";
            *(_WORD *)&v92[8] = 2080;
            if (!v14) {
              v80 = "(ignored by caller)";
            }
            *(void *)&v92[10] = v80;
            *(_WORD *)&v92[18] = 2112;
            *(void *)&v92[20] = v64;
            __int16 v93 = 2112;
            v94 = v65;
            _os_log_error_impl(&dword_23FA42000, v66, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (v14) {
          id *v14 = v64;
        }

LABEL_51:
        BOOL v34 = 0;
        goto LABEL_69;
      }
      if (v23 <= 0x75)
      {
        v61 = brc_bread_crumbs();
        v62 = brc_default_log();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
        }

        v63 = objc_msgSend(NSString, "stringWithFormat:", @"old-db-%d.%03d", 0, v23);
        [v54 registerAndSendNewContainerResetWithOutcome:v63];

        goto LABEL_45;
      }
      if (v23 >= 0x7D06 && (v23 - 32000) >= 0x3E8)
      {
        v77 = brc_bread_crumbs();
        v78 = brc_default_log();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT)) {
          +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
        }

        +[BRCDatabaseFromTheFutureException raise:@"DatabaseFromTheFuture", @"database has a major version from the future: %d (want at most %d)", v23 / 0x3E8uLL, 32 format];
        goto LABEL_45;
      }
    }
    id v21 = v33;
LABEL_56:
    a7 = v87;
    if (a4)
    {
      if (v23)
      {
        v67 = @"SELECT bird_schema FROM server_boot_history ORDER BY rowid DESC LIMIT 1";
LABEL_62:
        v71 = (void *)[v15 numberWithSQL:v67];
        unsigned int v36 = [v71 unsignedIntValue];

        unsigned int v35 = v23;
        goto LABEL_63;
      }
      goto LABEL_70;
    }
LABEL_59:
    v68 = [v17 URLByAppendingPathComponent:@"server.db"];
    v69 = [v68 path];
    char v70 = [v15 attachDBAtPath:v69 as:@"server" error:v14];

    if ((v70 & 1) == 0)
    {
      abc_report_panic_with_signature();
      v81 = NSString;
      v82 = [v15 lastError];
      [v81 stringWithFormat:@"we should be able to attach the server db {%@}", v82];
      objc_claimAutoreleasedReturnValue();

      v83 = brc_bread_crumbs();
      v84 = brc_default_log();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      v85 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("+[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1887, v85);
    }
    if (v23)
    {
      v67 = @"SELECT bird_schema FROM boot_history ORDER BY rowid DESC LIMIT 1";
      goto LABEL_62;
    }
LABEL_70:
    unsigned int v35 = 0;
    unsigned int v36 = 0;
    if (!a7) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  uint64_t v31 = brc_bread_crumbs();
  BOOL v32 = brc_default_log();
  if (os_log_type_enabled(v32, (os_log_type_t)0x90u)) {
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.7();
  }

  if (!a9)
  {
    BOOL v34 = 0;
LABEL_68:
    id v33 = v21;
    goto LABEL_69;
  }
  id v33 = v21;
  BOOL v34 = 0;
  *a9 = v33;
LABEL_69:

  return v34;
}

+ (BOOL)_validateDatabase:(id)a3 baseURL:(id)a4 session:(id)a5 serverTruth:(BOOL)a6 initialVersion:(unsigned int)a7 lastCurrentVersion:(unsigned int)a8 error:(id *)a9
{
  BOOL v11 = a6;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v78 = a3;
  id v77 = a4;
  id v79 = a5;
  uint64_t v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:](v11);
  }

  uint64_t v76 = os_transaction_create();
  id v16 = off_26F380B40;
  if (off_26F380B40)
  {
    uint64_t v17 = 0;
    unsigned int v18 = 1;
    do
    {
      unsigned int v19 = *((_DWORD *)&internal_fixups + 4 * v17);
      if (v19 > a7) {
        break;
      }
      if (v19 == a7)
      {
        BOOL v20 = brc_bread_crumbs();
        id v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v82 = a8;
          *(_WORD *)&v82[4] = 1024;
          *(_DWORD *)&v82[6] = a7;
          *(_WORD *)&v82[10] = 2112;
          *(void *)&v82[12] = v20;
          _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] doing an internal fixup from %d to %d%@", buf, 0x18u);
        }

        id v80 = 0;
        uint64_t v22 = (void *)MEMORY[0x2455D97F0]();
        char v23 = ((uint64_t (*)(id, id, BOOL, id *))v16)(v79, v78, v11, &v80);
        if ((v23 & 1) == 0)
        {
          v62 = brc_bread_crumbs();
          v63 = brc_default_log();
          v64 = a9;
          if (os_log_type_enabled(v63, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v82 = a8;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = a7;
            *(_WORD *)&v82[10] = 2112;
            *(void *)&v82[12] = v80;
            *(_WORD *)&v82[20] = 2112;
            *(void *)&v82[22] = v62;
            _os_log_error_impl(&dword_23FA42000, v63, (os_log_type_t)0x90u, "[ERROR] can't internal fixup from version %d to %d: %@%@", buf, 0x22u);
          }

LABEL_67:
          id v45 = v78;
LABEL_68:
          __int16 v48 = v77;
          if (v64) {
LABEL_69:
          }
            id *v64 = v80;
LABEL_70:

          BOOL v49 = 0;
LABEL_71:
          v67 = (void *)v76;
          goto LABEL_77;
        }
      }
      uint64_t v17 = v18;
      id v16 = (uint64_t (*)())*((void *)&internal_fixups + 2 * v18++ + 1);
    }
    while (v16);
  }
  uint64_t v24 = off_26F380B70;
  if (off_26F380B70)
  {
    uint64_t v25 = 0;
    unsigned int v26 = 1;
    do
    {
      unsigned int v27 = *((_DWORD *)&schema_fixups + 4 * v25);
      if (v27 > a7) {
        break;
      }
      if (v27 > a8)
      {
        uint64_t v28 = brc_bread_crumbs();
        uint64_t v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v82 = a8;
          *(_WORD *)&v82[4] = 1024;
          *(_DWORD *)&v82[6] = v27;
          *(_WORD *)&v82[10] = 2112;
          *(void *)&v82[12] = v28;
          _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEFAULT, "[NOTICE] fixuping database from version %d to %d%@", buf, 0x18u);
        }

        id v80 = 0;
        uint64_t v30 = (void *)MEMORY[0x2455D97F0]();
        char v31 = ((uint64_t (*)(id, id, BOOL, id *))v24)(v79, v78, v11, &v80);
        if ((v31 & 1) == 0)
        {
          v65 = brc_bread_crumbs();
          v66 = brc_default_log();
          v64 = a9;
          if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v82 = a8;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = v27;
            *(_WORD *)&v82[10] = 2112;
            *(void *)&v82[12] = v80;
            *(_WORD *)&v82[20] = 2112;
            *(void *)&v82[22] = v65;
            _os_log_error_impl(&dword_23FA42000, v66, (os_log_type_t)0x90u, "[ERROR] can't fixup from version %d to %d: %@%@", buf, 0x22u);
          }

          goto LABEL_67;
        }
      }
      uint64_t v25 = v26;
      uint64_t v24 = (uint64_t (*)())*((void *)&schema_fixups + 2 * v26++ + 1);
    }
    while (v24);
  }
  BOOL v32 = off_26F380BF0;
  if (off_26F380BF0)
  {
    uint64_t v33 = 0;
    int v34 = 0;
    do
    {
      unsigned int v35 = (unsigned int *)((char *)&range_fixups + 16 * v33);
      unsigned int v36 = *v35;
      unsigned int v37 = v35[1];
      if (*v35 <= a7 && v37 >= a7)
      {
        int v39 = brc_bread_crumbs();
        int v40 = brc_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v82 = v34;
          *(_WORD *)&v82[4] = 1024;
          *(_DWORD *)&v82[6] = a7;
          *(_WORD *)&v82[10] = 1024;
          *(_DWORD *)&v82[12] = v36;
          *(_WORD *)&v82[16] = 1024;
          *(_DWORD *)&v82[18] = v37;
          *(_WORD *)&v82[22] = 2112;
          *(void *)&v82[24] = v39;
          _os_log_impl(&dword_23FA42000, v40, OS_LOG_TYPE_DEFAULT, "[NOTICE] running fixup %d on version %d which is in range [%d,%d]%@", buf, 0x24u);
        }

        id v80 = 0;
        unint64_t v41 = (void *)MEMORY[0x2455D97F0]();
        char v42 = ((uint64_t (*)(id, id, BOOL, id *))v32)(v79, v78, v11, &v80);
        if ((v42 & 1) == 0)
        {
          int v46 = brc_bread_crumbs();
          int v47 = brc_default_log();
          if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)v82 = v34;
            *(_WORD *)&v82[4] = 1024;
            *(_DWORD *)&v82[6] = a7;
            *(_WORD *)&v82[10] = 1024;
            *(_DWORD *)&v82[12] = v36;
            *(_WORD *)&v82[16] = 1024;
            *(_DWORD *)&v82[18] = v37;
            *(_WORD *)&v82[22] = 2112;
            *(void *)&v82[24] = v80;
            __int16 v83 = 2112;
            v84 = v46;
            _os_log_error_impl(&dword_23FA42000, v47, (os_log_type_t)0x90u, "[ERROR] can't fixup %d on %d which is in range [%d,%d] - %@%@", buf, 0x2Eu);
          }

          __int16 v48 = v77;
          if (a9) {
            *a9 = v80;
          }

          BOOL v49 = 0;
          id v45 = v78;
          goto LABEL_71;
        }
      }
      uint64_t v33 = (v34 + 1);
      BOOL v32 = (uint64_t (*)())*((void *)&range_fixups + 2 * v33 + 1);
      ++v34;
    }
    while (v32);
  }
  if (a7 < 0x7D06)
  {
    id v45 = v78;
    if (a7 == 32005)
    {
      uint64_t v43 = brc_bread_crumbs();
      stat v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:]();
      }
    }
    else
    {
      unint64_t v50 = off_26F380050;
      if (off_26F380050)
      {
        uint64_t v51 = 0;
        if (v11) {
          unint64_t v52 = "server";
        }
        else {
          unint64_t v52 = "client";
        }
        unsigned int v53 = 1;
        while (1)
        {
          uint64_t v54 = *((unsigned int *)&schema_upgrades + 4 * v51);
          if (v54 > a7)
          {
            __int16 v55 = brc_bread_crumbs();
            id v56 = brc_default_log();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(void *)v82 = v52;
              *(_WORD *)&v82[8] = 1024;
              *(_DWORD *)&v82[10] = a7;
              *(_WORD *)&v82[14] = 1024;
              *(_DWORD *)&v82[16] = v54;
              *(_WORD *)&v82[20] = 2112;
              *(void *)&v82[22] = v55;
              _os_log_impl(&dword_23FA42000, v56, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
            }

            id v80 = 0;
            uint64_t v57 = (void *)MEMORY[0x2455D97F0]();
            char v58 = ((uint64_t (*)(id, id, BOOL, id *))v50)(v79, v78, v11, &v80);
            if ((v58 & 1) == 0)
            {
              char v70 = brc_bread_crumbs();
              v71 = brc_default_log();
              v64 = a9;
              if (os_log_type_enabled(v71, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v82 = a7;
                *(_WORD *)&v82[4] = 1024;
                *(_DWORD *)&v82[6] = v54;
                *(_WORD *)&v82[10] = 2112;
                *(void *)&v82[12] = v80;
                *(_WORD *)&v82[20] = 2112;
                *(void *)&v82[22] = v70;
                _os_log_error_impl(&dword_23FA42000, v71, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
              }

              goto LABEL_68;
            }
            if (([v78 setUserVersion:v54] & 1) == 0)
            {
              v72 = [v78 lastError];
              id v73 = v80;
              id v80 = v72;

              v74 = brc_bread_crumbs();
              v75 = brc_default_log();
              __int16 v48 = v77;
              if (os_log_type_enabled(v75, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v82 = v54;
                *(_WORD *)&v82[4] = 2112;
                *(void *)&v82[6] = v80;
                *(_WORD *)&v82[14] = 2112;
                *(void *)&v82[16] = v74;
                _os_log_error_impl(&dword_23FA42000, v75, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
              }

              v64 = a9;
              if (a9) {
                goto LABEL_69;
              }
              goto LABEL_70;
            }
            v59 = [v78 userVersion];
            a7 = [v59 unsignedIntValue];

            if (a7 != v54)
            {
              v60 = brc_bread_crumbs();
              v61 = brc_default_log();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v82 = v60;
                _os_log_fault_impl(&dword_23FA42000, v61, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db_version == schema_upgrades[i].version%@", buf, 0xCu);
              }
            }
          }
          uint64_t v51 = v53;
          unint64_t v50 = (uint64_t (*)())*((void *)&schema_upgrades + 2 * v53++ + 1);
          if (!v50)
          {
            if (a7 == 32005) {
              goto LABEL_76;
            }
            break;
          }
        }
      }
      uint64_t v43 = brc_bread_crumbs();
      stat v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:]();
      }
    }
  }
  else
  {
    uint64_t v43 = brc_bread_crumbs();
    stat v44 = brc_default_log();
    id v45 = v78;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v82 = a7;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = 32005;
      *(_WORD *)&v82[10] = 2112;
      *(void *)&v82[12] = v43;
      _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }
  }

LABEL_76:
  v67 = (void *)v76;
  id v68 = self;
  BOOL v49 = 1;
  __int16 v48 = v77;
LABEL_77:

  return v49;
}

+ (BOOL)upgradeOfflineDB:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = [v9 userVersion];
  int v12 = [v11 unsignedIntValue];

  if (v12 >= 32006)
  {
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)long long v38 = v12;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = 32005;
      *(_WORD *)&v38[10] = 2112;
      *(void *)&v38[12] = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }

    goto LABEL_12;
  }
  if (v12 == 32005)
  {
    uint64_t v13 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[BRCAccountSessionFPFS(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:]();
    }
LABEL_11:

LABEL_12:
LABEL_13:
    BOOL v16 = 1;
    goto LABEL_14;
  }
  if ((v12 - 32000) < 0x3E8)
  {
    uint64_t v13 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[BRCAccountSessionFPFS(BRCDatabaseManager) upgradeOfflineDB:serverTruth:session:error:]();
    }
    goto LABEL_11;
  }
  unsigned int v18 = off_26F380050;
  if (!off_26F380050) {
    goto LABEL_13;
  }
  int v34 = a6;
  uint64_t v19 = 0;
  BOOL v20 = "client";
  if (v8) {
    BOOL v20 = "server";
  }
  unsigned int v35 = v20;
  unsigned int v21 = 1;
  while (1)
  {
    uint64_t v22 = *((unsigned int *)&schema_upgrades + 4 * v19);
    if (v22 <= v12) {
      goto LABEL_25;
    }
    char v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)long long v38 = v35;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = v12;
      *(_WORD *)&v38[14] = 1024;
      *(_DWORD *)&v38[16] = v22;
      *(_WORD *)&v38[20] = 2112;
      *(void *)&v38[22] = v23;
      _os_log_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
    }

    id v36 = 0;
    uint64_t v25 = (void *)MEMORY[0x2455D97F0]();
    char v26 = ((uint64_t (*)(id, id, BOOL, id *))v18)(v10, v9, v8, &v36);
    if ((v26 & 1) == 0) {
      break;
    }
    if (([v9 setUserVersion:v22] & 1) == 0)
    {
      uint64_t v30 = [v9 lastError];
      id v31 = v36;
      id v36 = v30;

      BOOL v32 = brc_bread_crumbs();
      uint64_t v33 = brc_default_log();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)long long v38 = v22;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v36;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = v32;
        _os_log_error_impl(&dword_23FA42000, v33, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
      }

      goto LABEL_33;
    }
    unsigned int v27 = [v9 userVersion];
    int v12 = [v27 unsignedIntValue];

LABEL_25:
    uint64_t v19 = v21;
    unsigned int v18 = (uint64_t (*)())*((void *)&schema_upgrades + 2 * v21++ + 1);
    if (!v18) {
      goto LABEL_13;
    }
  }
  uint64_t v28 = brc_bread_crumbs();
  uint64_t v29 = brc_default_log();
  if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)long long v38 = v12;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v22;
    *(_WORD *)&v38[10] = 2112;
    *(void *)&v38[12] = v36;
    *(_WORD *)&v38[20] = 2112;
    *(void *)&v38[22] = v28;
    _os_log_error_impl(&dword_23FA42000, v29, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
  }

LABEL_33:
  if (v34) {
    id *v34 = v36;
  }

  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)runDatabaseFixups
{
  BOOL v3 = [(BRCAccountSessionFPFS *)self runDatabaseFixupsForDB:self->_clientDB serverTruth:0];
  if (v3)
  {
    serverDB = self->_serverDB;
    LOBYTE(v3) = [(BRCAccountSessionFPFS *)self runDatabaseFixupsForDB:serverDB serverTruth:1];
  }
  return v3;
}

- (BOOL)runDatabaseFixupsForDB:(id)a3 serverTruth:(BOOL)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__BRCAccountSessionFPFS_BRCDatabaseManager__runDatabaseFixupsForDB_serverTruth___block_invoke;
  v5[3] = &unk_26507ECD0;
  BOOL v6 = a4;
  v5[4] = self;
  return [a3 performWithFlags:27 action:v5];
}

BOOL __80__BRCAccountSessionFPFS_BRCDatabaseManager__runDatabaseFixupsForDB_serverTruth___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)[v3 numberWithSQL:@"SELECT max(fixup_version) + 1 FROM completed_db_fixups"];
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 >= 3)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
    uint64_t v7 = v5;
    unsigned int v8 = 3 - v5;
    while (1)
    {
      id v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = "server";
        if (!*(unsigned char *)(a1 + 40)) {
          BOOL v11 = "client";
        }
        *(_DWORD *)buf = 67109634;
        int v21 = v7;
        __int16 v22 = 2080;
        char v23 = v11;
        __int16 v24 = 2112;
        uint64_t v25 = v9;
        _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] Running db fixup %d for %s db%@", buf, 0x1Cu);
      }

      int v12 = (void *)MEMORY[0x2455D97F0]();
      id v19 = 0;
      if ((((uint64_t (*)(void, id, void, id *))db_fixups[v7])(*(void *)(a1 + 32), v3, *(unsigned __int8 *)(a1 + 40), &v19) & 1) == 0)break; {

      }
      if ((objc_msgSend(v3, "execute:", @"INSERT INTO completed_db_fixups (fixup_version) VALUES (%u)", v7) & 1) == 0)
      {
        id v15 = brc_bread_crumbs();
        BOOL v16 = brc_default_log();
        if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        {
          unsigned int v18 = [v3 lastError];
          *(_DWORD *)buf = 67109634;
          int v21 = v7;
          __int16 v22 = 2112;
          char v23 = v18;
          __int16 v24 = 2112;
          uint64_t v25 = v15;
          _os_log_error_impl(&dword_23FA42000, v16, (os_log_type_t)0x90u, "[ERROR] failed registering completion of db fixup %d with error %@%@", buf, 0x1Cu);
        }
        goto LABEL_18;
      }
      BOOL v6 = (unint64_t)++v7 >= 3;
      if (!--v8) {
        goto LABEL_18;
      }
    }
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109634;
      int v21 = v7;
      __int16 v22 = 2112;
      char v23 = (const char *)v19;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] db fixup %d failed %@%@", buf, 0x1Cu);
    }
  }
LABEL_18:

  return v6;
}

- (BOOL)reimportFPFSDomainWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (void *)*MEMORY[0x263F053F0];
  id v17 = 0;
  BOOL v5 = +[BRCImportUtil reimportItemsBelowItemWithIdentifier:v4 error:&v17];
  id v6 = v17;
  uint64_t v7 = +[BRCAutoBugCaptureReporter sharedABCReporter];
  [v7 captureLogsForOperationType:@"OpenAccountSession" ofSubtype:@"ReimportRootItem" forError:v6];

  if (v5)
  {
    unsigned int v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v21 = v8;
      id v10 = "[NOTICE] Signalled reimport of all FP items%@";
LABEL_7:
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "br_isFileProviderErrorCode:", -1005))
  {
    unsigned int v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v21 = v8;
      id v10 = "[WARNING] RootContainerItem not found -> Trying to reimport from a domain that we just added. Skip the reimport...%@";
      goto LABEL_7;
    }
LABEL_8:

    BOOL v11 = 1;
    goto LABEL_9;
  }
  uint64_t v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138412802;
    int v21 = v4;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] Failed to signal reimport of %@ on startup %@%@", buf, 0x20u);
  }

  if (!a3)
  {
    BOOL v11 = 0;
    goto LABEL_10;
  }
  id v15 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = *MEMORY[0x263F32360];
  uint64_t v18 = *MEMORY[0x263F08608];
  id v19 = v6;
  unsigned int v8 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  objc_msgSend(v15, "br_errorWithDomain:code:userInfo:description:", v16, 100, v8, @"Failed to signal reimport of root container on startup");
  BOOL v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_10:
  return v11;
}

- (BOOL)_decorateFPFSDomainUserInfoWithError:(id *)a3
{
  return [(BRCAccountSessionFPFS *)self _decorateUserInfoForFPFSDomain:self->_fpDomain panicOnDomainIDMismatch:0 withError:a3];
}

- (BOOL)decorateUserInfoForFPFSDomain:(id)a3 withError:(id *)a4
{
  return [(BRCAccountSessionFPFS *)self _decorateUserInfoForFPFSDomain:a3 panicOnDomainIDMismatch:1 withError:a4];
}

- (BOOL)_decorateUserInfoForFPFSDomain:(id)a3 panicOnDomainIDMismatch:(BOOL)a4 withError:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = v7;
    id v9 = [v7 userInfo];
    id v10 = (void *)[v9 mutableCopy];
    BOOL v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)objc_opt_new();
    }
    uint64_t v16 = v12;

    *(void *)id v45 = 0;
    *(void *)&v45[8] = v45;
    *(void *)&v45[16] = 0x2020000000;
    LOBYTE(v46) = 0;
    if (self->_isDataSeparated)
    {
      id v17 = [MEMORY[0x263EFB210] defaultStore];
      uint64_t v18 = objc_msgSend(v17, "br_accountForCurrentPersona");

      id v19 = [v18 accountDescription];
      BOOL v20 = [v8 displayName];
      char v21 = [v19 isEqualToString:v20];

      if ((v21 & 1) == 0)
      {
        *(unsigned char *)(*(void *)&v45[8] + 24) = 1;
        id v22 = objc_alloc(MEMORY[0x263F05590]);
        id v23 = [v8 identifier];
        __int16 v24 = [v18 accountDescription];
        uint64_t v25 = [v22 initWithIdentifier:v23 displayName:v24];

        id v8 = (id)v25;
      }
    }
    clientTruthWorkloop = self->_clientTruthWorkloop;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __110__BRCAccountSessionFPFS_BRCDatabaseManager___decorateUserInfoForFPFSDomain_panicOnDomainIDMismatch_withError___block_invoke;
    block[3] = &unk_26507F348;
    id v27 = v16;
    id v39 = v27;
    int v40 = self;
    unint64_t v41 = v45;
    BOOL v42 = a4;
    dispatch_async_and_wait(clientTruthWorkloop, block);
    if (*(unsigned char *)(*(void *)&v45[8] + 24))
    {
      [v8 setUserInfo:v27];
      uint64_t v28 = objc_msgSend(MEMORY[0x263F325C0], "br_getProviderIDForDataSeparated:", self->_isDataSeparated);
      id v37 = 0;
      char v15 = objc_msgSend(MEMORY[0x263F055B8], "br_addDomain:forProviderIdentifier:error:", v8, v28, &v37);
      id v29 = v37;
      if (v15)
      {
        uint64_t v30 = brc_bread_crumbs();
        id v31 = brc_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          stat v44 = v30;
          _os_log_impl(&dword_23FA42000, v31, OS_LOG_TYPE_DEFAULT, "[NOTICE] Domain update was successful%@", buf, 0xCu);
        }
      }
      else
      {
        BOOL v32 = brc_bread_crumbs();
        uint64_t v33 = brc_default_log();
        if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
          -[BRCAccountSessionFPFS(BRCDatabaseManager) _decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:]();
        }

        if (a5) {
          *a5 = v29;
        }
      }
    }
    else
    {
      char v15 = 1;
    }

    _Block_object_dispose(v45, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"domain", 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        unsigned int v35 = "(passed to caller)";
        *(_DWORD *)id v45 = 136315906;
        *(void *)&v45[4] = "-[BRCAccountSessionFPFS(BRCDatabaseManager) _decorateUserInfoForFPFSDomain:panicOnDomainIDM"
                             "ismatch:withError:]";
        *(_WORD *)&v45[12] = 2080;
        if (!a5) {
          unsigned int v35 = "(ignored by caller)";
        }
        *(void *)&v45[14] = v35;
        *(_WORD *)&v45[22] = 2112;
        id v46 = v8;
        __int16 v47 = 2112;
        __int16 v48 = v13;
        _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v45, 0x2Au);
      }
    }
    if (a5)
    {
      id v8 = v8;
      char v15 = 0;
      *a5 = v8;
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

void __110__BRCAccountSessionFPFS_BRCDatabaseManager___decorateUserInfoForFPFSDomain_panicOnDomainIDMismatch_withError___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F323B8];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F323B8]];

  if ([*(id *)(a1 + 40) fpfsMigrationState] == 2)
  {
    if (v3) {
      goto LABEL_11;
    }
  }
  else
  {
    int v4 = [*(id *)(a1 + 40) fpfsMigrationState];
    if ((v3 == 0) != (v4 == 1)) {
      goto LABEL_11;
    }
    if (v4 != 1)
    {
      BOOL v5 = 0;
      goto LABEL_8;
    }
  }
  BOOL v5 = [*(id *)(a1 + 40) fpfsMigrationUUID];
LABEL_8:
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v2];
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    char v21 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] Updating migration UUID %@%@", buf, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:
  uint64_t v8 = *MEMORY[0x263F323B0];
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F323B0]];
  if (([v9 isEqualToString:*(void *)(*(void *)(a1 + 40) + 88)] & 1) == 0)
  {
    if (v9) {
      BOOL v10 = *(unsigned char *)(a1 + 56) == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"The domain has a non nil database ID (%@) which is different than our database ID (%@) ", v9, *(void *)(*(void *)(a1 + 40) + 88)];
      objc_claimAutoreleasedReturnValue();
      uint64_t v14 = brc_bread_crumbs();
      char v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      id v17 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSessionFPFS(BRCDatabaseManager) _decorateUserInfoForFPFSDomain:panicOnDomainIDMismatch:withError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 2218, v17);
    }
    [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(a1 + 40) + 88) forKeyedSubscript:v8];
    BOOL v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(*(void *)(a1 + 40) + 88);
      *(_DWORD *)buf = 138412546;
      id v19 = v13;
      __int16 v20 = 2112;
      char v21 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] Updating domain databaseID to %@%@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)openDBForNewDomain:(BOOL)a3 deviceIDChanged:(BOOL *)a4 withError:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!self->_offline) {
    [(BRCAccountSessionFPFS *)self setupDatabase];
  }
  [(BRCPQLConnection *)self->_clientDB setCrashIfUsedAfterClose:0];
  [(BRCPQLConnection *)self->_serverDB setCrashIfUsedAfterClose:0];
  uint64_t v37 = 0;
  BOOL v36 = 0;
  if (!self->_offline
    && (![(BRCAccountSessionFPFS *)self openAndValidateDatabase:self->_serverDB serverTruth:1 initialVersion:0 lastCurrentVersion:&v37 deviceIDChanged:0 error:a5]|| ![(BRCAccountSessionFPFS *)self openAndValidateDatabase:self->_clientDB serverTruth:0 initialVersion:0 lastCurrentVersion:(char *)&v37 + 4 deviceIDChanged:&v36 error:a5]))
  {
    [(BRCPQLConnection *)self->_serverDB brc_close];
    serverDB = self->_serverDB;
    self->_serverDB = 0;

    BOOL v11 = 0;
    id v12 = 0;
LABEL_24:
    [(BRCPQLConnection *)self->_clientDB brc_close];
    goto LABEL_25;
  }
  if (a4) {
    *a4 = v36;
  }
  if (a3)
  {
    int v9 = 0;
  }
  else
  {
    if (HIDWORD(v37)) {
      BOOL v13 = v37 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    int v9 = v13;
  }
  [(BRCAccountSessionFPFS *)self _startWatcher];
  [(BRCPQLConnection *)self->_serverDB useSerialQueueWithTarget:self->_serverTruthWorkloop];
  BOOL v14 = [(BRCAccountSessionFPFS *)self _finishClientTruthConnectionSetupWithError:a5];
  if (!v14
    || ![(BRCAccountSessionFPFS *)self _finishServerTruthConnectionSetupWithError:a5])
  {
    BOOL v11 = 0;
    id v12 = 0;
    goto LABEL_22;
  }
  char v15 = [(BRCAccountSessionFPFS *)self dbLoadingBarrier];
  [v15 signalBarrier];

  uint64_t v16 = [(NSFileProviderDomain *)self->_fpDomain userInfo];
  id v17 = (void *)[v16 mutableCopy];
  uint64_t v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  BOOL v11 = v19;

  id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F323B0]];
  if (v12) {
    char v27 = v9;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0 && ![(NSString *)self->_databaseID isEqualToString:v12])
  {
    uint64_t v33 = brc_bread_crumbs();
    uint64_t v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      databaseID = self->_databaseID;
      *(_DWORD *)buf = 138412802;
      id v39 = v12;
      __int16 v40 = 2112;
      unint64_t v41 = databaseID;
      __int16 v42 = 2112;
      uint64_t v43 = v33;
      _os_log_error_impl(&dword_23FA42000, v28, (os_log_type_t)0x90u, "[ERROR] DatabaseID mismatch %@ vs %@. Signalling reimport%@", buf, 0x20u);
    }

    id v29 = +[AppTelemetryTimeSeriesEvent newDatabaseIDMismatchEventWithFPDatabaseID:v12 cloudDocsDatabaseID:self->_databaseID];
    uint64_t v30 = [(BRCAccountSessionFPFS *)self analyticsReporter];
    [v30 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v29];

    id v31 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v31 captureLogsForOperationType:@"OpenAccountSession" ofSubtype:@"DatabaseMismatch" forError:0];

LABEL_38:
    if (![(BRCAccountSessionFPFS *)self reimportFPFSDomainWithError:a5]) {
      goto LABEL_22;
    }
    goto LABEL_39;
  }
  if (v9) {
    goto LABEL_38;
  }
LABEL_39:
  if ([(BRCAccountSessionFPFS *)self _decorateFPFSDomainUserInfoWithError:a5])
  {
    [(BRCAccountSessionFPFS *)self enableDatabaseProfilingForDB:self->_clientDB];
    [(BRCAccountSessionFPFS *)self enableDatabaseProfilingForDB:self->_serverDB];
    BOOL v25 = 1;
    [(BRCPQLConnection *)self->_clientDB setCrashIfUsedAfterClose:1];
    [(BRCPQLConnection *)self->_serverDB setCrashIfUsedAfterClose:1];
    goto LABEL_26;
  }
LABEL_22:
  __int16 v20 = self->_serverDB;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke;
  v35[3] = &unk_26507F2F8;
  v35[4] = self;
  [(BRCPQLConnection *)v20 performWithFlags:1 action:v35];
  char v21 = self->_serverDB;
  self->_serverDB = 0;

  if (!v14) {
    goto LABEL_24;
  }
  clientDB = self->_clientDB;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke_2;
  v34[3] = &unk_26507F2F8;
  v34[4] = self;
  [(BRCPQLConnection *)clientDB performWithFlags:1 action:v34];
LABEL_25:
  id v23 = self->_clientDB;
  self->_clientDB = 0;

  __int16 v24 = self->_databaseID;
  self->_databaseID = 0;

  BOOL v25 = 0;
LABEL_26:

  return v25;
}

uint64_t __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __90__BRCAccountSessionFPFS_BRCDatabaseManager__openDBForNewDomain_deviceIDChanged_withError___block_invoke_2(uint64_t a1)
{
  return 1;
}

- (void)closeDBs
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  int v4 = self;
  objc_sync_enter(v4);
  if (v4->_clientDB)
  {
    objc_msgSend(v3, "addObject:");
    clientDB = v4->_clientDB;
    v4->_clientDB = 0;
  }
  if (v4->_serverDB)
  {
    objc_msgSend(v3, "addObject:");
    serverDB = v4->_serverDB;
    v4->_serverDB = 0;
  }
  if (v4->_readOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    readOnlyDB = v4->_readOnlyDB;
    v4->_readOnlyDB = 0;
  }
  if (v4->_expensiveReadOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    expensiveReadOnlyDB = v4->_expensiveReadOnlyDB;
    v4->_expensiveReadOnlyDB = 0;
  }
  objc_sync_exit(v4);
  __int16 v24 = v4;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v27;
    *(void *)&long long v11 = 138412290;
    long long v22 = v11;
    uint64_t v13 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        char v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        uint64_t v16 = objc_msgSend(v15, "serialQueue", v22);
        BOOL v17 = v16 == 0;

        if (v17)
        {
          id v23 = brc_bread_crumbs();
          id v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v22;
            id v31 = v23;
            _os_log_fault_impl(&dword_23FA42000, v19, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db.serialQueue%@", buf, 0xCu);
          }
        }
        uint64_t v18 = [v15 serialQueue];
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __53__BRCAccountSessionFPFS_BRCDatabaseManager__closeDBs__block_invoke;
        block[3] = &unk_26507ED70;
        void block[4] = v15;
        dispatch_sync(v18, block);

        ++v14;
      }
      while (v10 != v14);
      uint64_t v20 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
      uint64_t v10 = v20;
    }
    while (v20);
  }

  [(BRCAccountSessionFPFS *)v24 stopDBWatcher];
  clientState = v24->_clientState;
  v24->_clientState = 0;
}

uint64_t __53__BRCAccountSessionFPFS_BRCDatabaseManager__closeDBs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "brc_close");
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 error:(id *)a4
{
  return [(BRCAccountSessionFPFS *)self initializeOfflineDatabaseWhileUpgrading:a3 loadClientState:0 error:a4];
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 error:(id *)a5
{
  return [(BRCAccountSessionFPFS *)self initializeOfflineDatabaseWhileUpgrading:a3 loadClientState:a4 forDBDump:0 error:a5];
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 forDBDump:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a3;
  uint64_t v31 = 0;
  BOOL v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__1;
  self->_offline = 1;
  long long v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  self->_forDBDump = a5;
  uint64_t v10 = [(BRCAccountSessionFPFS *)self clientDB];
  long long v11 = [v10 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke;
  block[3] = &unk_26507F390;
  void block[4] = self;
  void block[5] = &v31;
  BOOL v24 = v8;
  block[6] = &v25;
  dispatch_sync(v11, block);

  uint64_t v12 = v32;
  int v13 = *((unsigned __int8 *)v32 + 24);
  if (*((unsigned char *)v32 + 24) && v8)
  {
    uint64_t v14 = [(BRCAccountSessionFPFS *)self serverDB];
    char v15 = [v14 serialQueue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_405;
    v22[3] = &unk_26507F3B8;
    void v22[4] = self;
    v22[5] = &v31;
    v22[6] = &v25;
    dispatch_sync(v15, v22);

    uint64_t v12 = v32;
    int v13 = *((unsigned __int8 *)v32 + 24);
  }
  if (!v13)
  {
    *((unsigned char *)v12 + 24) = 0;
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v16 = [(BRCAccountSessionFPFS *)self clientDB];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_406;
  v20[3] = &unk_26507ECD0;
  void v20[4] = self;
  BOOL v21 = a4;
  char v17 = [v16 performWithFlags:1 action:v20];
  *((unsigned char *)v32 + 24) = v17;

  if (a6) {
LABEL_6:
  }
    *a6 = (id) v26[5];
LABEL_7:
  BOOL v18 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v18;
}

void __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 clientDB];
  BOOL v4 = *(unsigned char *)(a1 + 56) == 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  LOBYTE(v2) = [v2 _setupConnection:v3 readonly:v4 forChecker:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v2;

  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 clientDB];
  [v6 disableDatabaseProfilingForDB:v7];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && *(unsigned char *)(a1 + 56))
  {
    BOOL v8 = [*(id *)(a1 + 32) clientDB];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(id *)(v10 + 40);
    BOOL v11 = +[BRCAccountSessionFPFS upgradeOfflineDB:v8 serverTruth:0 session:v9 error:&v13];
    objc_storeStrong((id *)(v10 + 40), v13);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  }
  uint64_t v12 = [*(id *)(a1 + 32) clientDB];
  [v12 setSqliteErrorHandler:&__block_literal_global_404];
}

void __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered an error %@ running stmt %@%@", (uint8_t *)&v9, 0x20u);
  }
}

void __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_405(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    id v3 = *(void **)(a1 + 32);
    BOOL v4 = [v3 serverDB];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v5 + 40);
    LOBYTE(v3) = [v3 _openConnection:v4 databaseName:@"server.db" readonly:0 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    id v7 = [*(id *)(a1 + 32) serverDB];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v9 + 40);
    BOOL v10 = +[BRCAccountSessionFPFS upgradeOfflineDB:v7 serverTruth:1 session:v8 error:&v11];
    objc_storeStrong((id *)(v9 + 40), v11);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
  }
}

uint64_t __117__BRCAccountSessionFPFS_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_406(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  BOOL v4 = [*(id *)(a1 + 32) _sharedServerZonesEnumerator:v3];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) addOfflineServerZone:*(void *)(*((void *)&v56 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v6);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v9 = [*(id *)(a1 + 32) _privateServerZonesEnumerator:v3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(a1 + 32) addOfflineServerZone:*(void *)(*((void *)&v52 + 1) + 8 * j)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v11);
  }

  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v15 = [*(id *)(a1 + 32) _sharedClientZonesEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * k);
        [*(id *)(a1 + 32) addOfflineClientZone:v20];
        BOOL v21 = [v20 dbRowID];
        [v14 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v17);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v22 = [*(id *)(a1 + 32) _privateClientZonesEnumerator];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v44 + 1) + 8 * m);
        [*(id *)(a1 + 32) addOfflineClientZone:v27];
        long long v28 = [v27 dbRowID];
        [v14 setObject:v27 forKeyedSubscript:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v24);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v39 = v3;
  long long v29 = [*(id *)(a1 + 32) _appLibrariesEnumerator:v3];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v41;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(v29);
        }
        char v34 = *(void **)(*((void *)&v40 + 1) + 8 * n);
        [*(id *)(a1 + 32) addOfflineAppLibrary:v34];
        unsigned int v35 = [v34 zoneRowID];
        BOOL v36 = [v14 objectForKeyedSubscript:v35];
        uint64_t v37 = [v36 asPrivateClientZone];

        if (v37) {
          [v34 associateWithClientZone:v37];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v31);
  }

  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _loadClientStateFromDB:v39];
  }

  return 1;
}

- (BOOL)dumpFileCoordinationInfoToFileHandle:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v6 = dup([a3 fileDescriptor]);
  uint64_t v7 = fdopen(v6, "a");
  if (v7)
  {
    uint64_t v8 = [[BRCDumpContext alloc] initWithFile:v7 db:self->_clientDB];
    [(BRCDumpContext *)v8 setDumpTrackedPendingDownloads:1];
    fclose(v7);
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    if (v9)
    {
      uint64_t v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        __int16 v13 = "(passed to caller)";
        int v14 = 136315906;
        uint64_t v15 = "-[BRCAccountSessionFPFS(BRCDatabaseManager) dumpFileCoordinationInfoToFileHandle:error:]";
        __int16 v16 = 2080;
        if (!a4) {
          __int16 v13 = "(ignored by caller)";
        }
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        BOOL v21 = v10;
        _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }
  return v7 != 0;
}

- (void)_registerObfuscationFunction:(id)a3
{
  id v3 = a3;
  [v3 registerFunction:@"OBFUSCATE" nArgs:1 handler:&__block_literal_global_413];
  [v3 registerFunction:@"OBFUSCATE_APPLIBRARY" nArgs:1 handler:&__block_literal_global_418];
  [v3 registerFunction:@"OBFUSCATE_PATH" nArgs:1 handler:&__block_literal_global_435];
}

void __74__BRCAccountSessionFPFS_BRCDatabaseManager___registerObfuscationFunction___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v6 = (void *)MEMORY[0x2455D97F0]();
  uint64_t v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    objc_msgSend(v8, "fp_obfuscatedFilename");
    id v9 = objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (const char *)[v9 fileSystemRepresentation];

    int v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __74__BRCAccountSessionFPFS_BRCDatabaseManager___registerObfuscationFunction___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v6 = (void *)MEMORY[0x2455D97F0]();
  uint64_t v7 = sqlite3_value_text(*a4);
  if (v7 && (uint64_t v8 = (const char *)v7, *v7))
  {
    id v9 = [NSString stringWithUTF8String:v7];
    if ([v9 isEqualToString:@"com.apple.CloudDocs"])
    {
      int v10 = strlen(v8);
      sqlite3_result_text(a2, v8, v10, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      int v11 = objc_msgSend(v9, "fp_obfuscatedDotSeparatedComponents");
      uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:@"{" withString:@"-"];

      __int16 v13 = [v12 stringByReplacingOccurrencesOfString:@"}" withString:@"-"];

      id v14 = v13;
      uint64_t v15 = (const char *)[v14 fileSystemRepresentation];
      int v16 = strlen(v15);
      sqlite3_result_text(a2, v15, v16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __74__BRCAccountSessionFPFS_BRCDatabaseManager___registerObfuscationFunction___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v6 = (void *)MEMORY[0x2455D97F0]();
  uint64_t v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    objc_msgSend(v8, "fp_obfuscatedPath");
    id v9 = objc_claimAutoreleasedReturnValue();
    int v10 = (const char *)[v9 fileSystemRepresentation];

    int v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

- (BOOL)backupDatabaseToURL:(id)a3 includeServer:(BOOL)a4 doNotObfuscate:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v52 = a3;
  long long v57 = 0u;
  long long v58 = 0u;
  if (v8) {
    id v9 = &unk_26F3DDB08;
  }
  else {
    id v9 = &unk_26F3DDB20;
  }
  long long v59 = 0uLL;
  long long v60 = 0uLL;
  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v61 count:16];
  long long v50 = a6;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v49 = *(void *)v58;
    BOOL v46 = a5;
    BOOL v47 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        id v14 = [(BRCAccountSessionFPFS *)self newConnection:@"backup"];
        uint64_t v15 = [v52 URLByAppendingPathComponent:v13];
        int v16 = [v14 sqliteErrorHandler];
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke;
        v55[3] = &unk_26507F3E0;
        id v17 = v16;
        id v56 = v17;
        [v14 setSqliteErrorHandler:v55];
        __int16 v18 = [v14 autoRollbackHandler];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_445;
        v53[3] = &unk_26507F3E0;
        id v19 = v18;
        id v54 = v19;
        [v14 setAutoRollbackHandler:v53];
        a6 = v50;
        if (![(BRCAccountSessionFPFS *)self _openConnection:v14 databaseName:v13 readonly:1 error:v50])goto LABEL_19; {
        if (([v14 backupToURL:v15 progress:0] & 1) == 0)
        }
        {
          if (v50)
          {
            *long long v50 = [v14 lastError];
          }
          objc_msgSend(v14, "brc_close");
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v14, "brc_close");
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      a5 = v46;
      BOOL v8 = v47;
      if (v11) {
        continue;
      }
      break;
    }
  }
  if (a5)
  {
    int shouldObfuscateFilenames = 0;
    if (!v8) {
      goto LABEL_27;
    }
  }
  else
  {
    int shouldObfuscateFilenames = fp_shouldObfuscateFilenames();
    if (!v8) {
      goto LABEL_27;
    }
  }
  id v14 = [(BRCAccountSessionFPFS *)self newConnection:@"privacy"];
  if (![(id)objc_opt_class() _openConnection:v14 databaseName:@"server.db" baseURL:v52 readonly:0 error:a6])
  {
LABEL_20:
    LOBYTE(v21) = 0;
    goto LABEL_21;
  }
  if (shouldObfuscateFilenames)
  {
    uint64_t v23 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v23, "sqliteCacheSize"));
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v23, "sqliteCacheSpill"));
    long long v26 = (void *)MEMORY[0x263F8C720];
    id v27 = v24;
    long long v28 = objc_msgSend(v26, "rawInjection:length:", objc_msgSend(v27, "UTF8String"), objc_msgSend(v27, "length"));
    [v14 execute:@"PRAGMA cache_size = %@", v28];

    long long v29 = (void *)MEMORY[0x263F8C720];
    id v30 = v25;
    uint64_t v31 = [v30 UTF8String];
    uint64_t v32 = [v30 length];
    uint64_t v33 = v29;
    a6 = v50;
    char v34 = [v33 rawInjection:v31 length:v32];
    [v14 execute:@"PRAGMA cache_spill = %@", v34];

    [(BRCAccountSessionFPFS *)self _registerObfuscationFunction:v14];
    [v14 groupInTransaction:&__block_literal_global_451];
    [v14 groupInTransaction:&__block_literal_global_456];
    [v14 groupInTransaction:&__block_literal_global_461];
    [v14 groupInTransaction:&__block_literal_global_466];
    [v14 groupInTransaction:&__block_literal_global_471];
  }
  [v14 groupInTransaction:&__block_literal_global_476];
  [v14 flush];
  objc_msgSend(v14, "brc_close");

LABEL_27:
  id v14 = [(BRCAccountSessionFPFS *)self newConnection:@"privacy"];
  int v21 = [(id)objc_opt_class() _openConnection:v14 databaseName:@"client.db" baseURL:v52 readonly:0 error:a6];
  if (v21)
  {
    if (shouldObfuscateFilenames)
    {
      unsigned int v35 = +[BRCUserDefaults defaultsForMangledID:0];
      BOOL v36 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v35, "sqliteCacheSize"));
      uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v35, "sqliteCacheSpill"));
      long long v38 = (void *)MEMORY[0x263F8C720];
      id v39 = v36;
      long long v40 = objc_msgSend(v38, "rawInjection:length:", objc_msgSend(v39, "UTF8String"), objc_msgSend(v39, "length"));
      [v14 execute:@"PRAGMA cache_size = %@", v40];

      long long v41 = (void *)MEMORY[0x263F8C720];
      id v42 = v37;
      long long v43 = objc_msgSend(v41, "rawInjection:length:", objc_msgSend(v42, "UTF8String"), objc_msgSend(v42, "length"));
      [v14 execute:@"PRAGMA cache_spill = %@", v43];

      [(BRCAccountSessionFPFS *)self _registerObfuscationFunction:v14];
      [v14 groupInTransaction:&__block_literal_global_481];
      [v14 groupInTransaction:&__block_literal_global_486];
      long long v44 = (void *)[v14 numberWithSQL:@"SELECT 1 FROM sqlite_master where type = 'table' AND name = 'client_pkg_items'"];
      int v45 = [v44 BOOLValue];

      if (v45) {
        [v14 groupInTransaction:&__block_literal_global_494];
      }
      [v14 groupInTransaction:&__block_literal_global_499];
    }
    [v14 groupInTransaction:&__block_literal_global_504];
    [v14 flush];
    objc_msgSend(v14, "brc_close");
  }
LABEL_21:

  return v21;
}

void __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    int v21 = v10;
    _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v12 = [v9 domain];
  if (![v12 isEqualToString:*MEMORY[0x263F8C730]])
  {

    goto LABEL_9;
  }
  uint64_t v13 = [v9 code];

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  id v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
    __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();
  }

LABEL_10:
}

void __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_445(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    int v21 = v10;
    _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v12 = [v9 domain];
  if (![v12 isEqualToString:*MEMORY[0x263F8C730]])
  {

    goto LABEL_9;
  }
  uint64_t v13 = [v9 code];

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  id v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
    __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();
  }

LABEL_10:
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_449(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE devices SET name = printf(\"%%u - %%s\", key, OBFUSCATE(name)) WHERE name IS NOT NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE server_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE server_items SET item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_origname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_origname)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name))"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE rowid_reservations SET container_id = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(container_id)) WHERE container_id IS NOT NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_5(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE users SET user_plist = NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_6(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE server_items SET child_basehash_salt = validation_key(child_basehash_salt), content_boundary_key = validation_key(content_boundary_key)"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_7(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE client_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_8(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE client_items SET item_localname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_localname)), item_bouncedname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_bouncedname)), item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name)), version_block_sync_until_bundle_id = NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_9(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE client_pkg_items SET rel_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(rel_path)) WHERE rel_path IS NOT NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_10(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE app_libraries SET app_library_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(app_library_name)) WHERE app_library_name IS NOT NULL"];
  return 1;
}

uint64_t __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_11(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE app_libraries SET child_basehash_salt = validation_key(child_basehash_salt)"];
  return 1;
}

- (BOOL)backupDatabaseToURL:(id)a3 error:(id *)a4
{
  return [(BRCAccountSessionFPFS *)self backupDatabaseToURL:a3 includeServer:1 doNotObfuscate:0 error:a4];
}

- (id)accountStatisticsWithDB:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  uint64_t v5 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items"];
  [v4 setObject:v5 forKeyedSubscript:@"totalNumberOfItems"];

  int v6 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items WHERE item_type = 2"];
  [v4 setObject:v6 forKeyedSubscript:@"totalNumberOfFaults"];

  id v7 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items WHERE item_type = 1"];
  [v4 setObject:v7 forKeyedSubscript:@"totalNumberOfDocuments"];

  id v8 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items WHERE item_type = 0"];
  [v4 setObject:v8 forKeyedSubscript:@"totalNumberOfDirectories"];

  return v4;
}

- (void)bumpNotificationRankOnItemGlobalID:(id)a3
{
  clientDB = self->_clientDB;
  id v4 = a3;
  id v6 = [v4 itemID];
  uint64_t v5 = [v4 zoneRowID];

  [(BRCPQLConnection *)clientDB execute:@"UPDATE client_items SET item_notifs_ranuint64_t k = bump_notifs_rank() WHERE item_id = %@ AND zone_rowid = %@", v6, v5];
}

- (void)scheduleZoneMovesToCloudDocs:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSessionFPFS *)self cloudDocsClientZone];
  id v6 = [v5 defaultAppLibrary];
  char v7 = [v6 wasMovedToCloudDocs];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)[v4 mutableCopy];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke;
    v25[3] = &unk_26507F0B0;
    id v26 = v8;
    id v27 = self;
    id v9 = v8;
    [(BRCAccountSessionFPFS *)self enumerateAppLibraries:v25];
    uint64_t v10 = [v9 allObjects];

    id v4 = (id)v10;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v22;
    *(void *)&long long v13 = 138412290;
    long long v20 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v17, "isCloudDocsZone", v20, (void)v21))
        {
          __int16 v18 = brc_bread_crumbs();
          id v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v20;
            long long v29 = v18;
            _os_log_fault_impl(&dword_23FA42000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't CZM the clouddocs zone%@", buf, 0xCu);
          }
        }
        else
        {
          [v17 scheduleMoveToCloudDocs];
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v14);
  }
}

uint64_t __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 wasMovedToCloudDocs] & 1) == 0)
  {
    id v4 = [v3 defaultClientZone];
    if ([v4 isCloudDocsZone]) {
      goto LABEL_7;
    }
    uint64_t v5 = [v3 mangledID];
    id v6 = +[BRCUserDefaults defaultsForMangledID:v5];
    int v7 = [v6 shouldAutoMigrateToCloudDocs];

    if (v7)
    {
      id v8 = [v3 defaultClientZone];
      id v9 = [v8 serverZone];
      char v10 = [v9 hasFetchedServerZoneState];

      if (v10)
      {
        id v11 = [*(id *)(*(void *)(a1 + 40) + 160) serialQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2;
        block[3] = &unk_26507ED70;
        id v16 = v3;
        dispatch_async(v11, block);

        goto LABEL_8;
      }
      uint64_t v12 = *(void **)(a1 + 32);
      id v4 = [v3 defaultClientZone];
      long long v13 = [v4 serverZone];
      [v12 addObject:v13];

LABEL_7:
    }
  }
LABEL_8:

  return 1;
}

void __72__BRCAccountSessionFPFS_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) defaultClientZone];
  [v1 scheduleSyncDown];
}

- (void)disableDatabaseProfilingForDB:(id)a3
{
}

- (void)enableDatabaseProfilingForDB:(id)a3
{
  id v5 = a3;
  id v4 = +[BRCUserDefaults defaultsForMangledID:0];
  if ([v4 dbProfiled]) {
    -[BRCAccountSessionFPFS _setDatabaseProfilingForDB:enabled:verbose:](self, "_setDatabaseProfilingForDB:enabled:verbose:", v5, 1, [v4 dbVerboseProfiled]);
  }
}

- (void)_setDatabaseProfilingForDB:(id)a3 enabled:(BOOL)a4 verbose:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  [v7 setVerboseProfilingEnabled:v5];
  [v7 setProfilingEnabled:v6];
}

- (id)getFPFSNonMigratedItemsWithDB:(id)a3
{
  id v3 = (void *)[a3 numberWithSQL:@"SELECT count(*) FROM client_items WHERE item_localsyncupstate IN (5, 6)"];
  return v3;
}

- (id)_getFPFSMigrationStatus:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (!self->_clientState)
  {
    uint64_t v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(DatabaseAdditions) _getFPFSMigrationStatus:withError:]((uint64_t)v15, v16);
    }
  }
  BOOL v6 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStateKey"];
  if (!v7)
  {
    id v8 = (void *)[v5 numberWithSQL:@"SELECT MIN(db_schema) FROM boot_history"];
    unint64_t v9 = [v8 unsignedLongValue];

    if (v9 >> 4 > 0x752)
    {
      id v13 = 0;
      goto LABEL_8;
    }
    id v7 = &unk_26F3DD1A8;
  }
  [v6 setObject:v7 forKey:@"MigrationStatus"];
  char v10 = [(BRCAccountSessionFPFS *)self getFPFSNonMigratedItemsWithDB:v5];
  if (v10) {
    [v6 setObject:v10 forKey:@"NonMigratedItems"];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__BRCAccountSessionFPFS_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke;
  v17[3] = &unk_2650817B0;
  void v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  uint64_t v12 = (void (**)(void, void, void))MEMORY[0x2455D9A50](v17);
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationUUIDKey", @"MigrationID");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationStartTimeKey", @"MigrationStarted");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationInitialItemsNeedMigratingCountKey", @"InitialItemsNeedMigratingCount");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationInitialItemCountKey", @"InitialItemsCount");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationNewItemsInDBStatKey", @"NewItemsInDB");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationLostItemCountKey", @"MigrationLostItemCount");
  id v13 = v11;

LABEL_8:
  return v13;
}

void __78__BRCAccountSessionFPFS_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  BOOL v6 = [*(id *)(a1 + 32) clientState];
  id v7 = [v6 objectForKeyedSubscript:v11];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    unint64_t v9 = [*(id *)(a1 + 32) clientState];
    char v10 = [v9 objectForKeyedSubscript:v11];
    [v8 setObject:v10 forKey:v5];
  }
}

- (BOOL)dumpFPFSMigrationStatusToFileHandle:(id)a3 tracker:(id)a4 includeNonMigratedItems:(BOOL)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v30 = a4;
  memset(v47, 0, sizeof(v47));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]", 133, v47);
  unint64_t v9 = brc_bread_crumbs();
  char v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]();
  }

  id v11 = self->_readOnlyDB;
  uint64_t v12 = v11;
  uint64_t v43 = 0;
  long long v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v37 = 0;
  long long v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__16;
  long long v41 = __Block_byref_object_dispose__16;
  id v42 = 0;
  int cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    uint64_t v14 = 0;
    if (!v11)
    {
LABEL_22:
      BOOL v21 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v14 = [(BRCAccountSessionFPFS *)self containerScheduler];
    if (!v12) {
      goto LABEL_22;
    }
  }
  int v15 = dup(objc_msgSend(v8, "fileDescriptor", a6));
  id v16 = fdopen(v15, "a");
  if (!v16)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    long long v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      long long v23 = brc_bread_crumbs();
      long long v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        id v27 = "(passed to caller)";
        *(_DWORD *)id v56 = 136315906;
        *(void *)&v56[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:incl"
                             "udeNonMigratedItems:error:]";
        *(_WORD *)&v56[12] = 2080;
        if (!v29) {
          id v27 = "(ignored by caller)";
        }
        *(void *)&v56[14] = v27;
        *(_WORD *)&v56[22] = 2112;
        long long v57 = v22;
        LOWORD(v58) = 2112;
        *(void *)((char *)&v58 + 2) = v23;
        _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v56, 0x2Au);
      }
    }
    if (v29) {
      *long long v29 = v22;
    }

    goto LABEL_22;
  }
  *(void *)id v56 = 0;
  *(void *)&v56[8] = v56;
  *(void *)&v56[16] = 0x3032000000;
  long long v57 = __Block_byref_object_copy__16;
  *(void *)&long long v58 = __Block_byref_object_dispose__16;
  *((void *)&v58 + 1) = [[BRCDumpContext alloc] initWithFile:v16 db:v12];
  [*(id *)(*(void *)&v56[8] + 40) setLiveDaemon:cloudDocsFD >= 0];
  [*(id *)(*(void *)&v56[8] + 40) setTaskTracker:v30];
  [(BRCAccountSessionFPFS *)self disableDatabaseProfilingForDB:v12];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __118__BRCAccountSessionFPFS_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke;
  v31[3] = &unk_2650817D8;
  id v17 = v12;
  uint64_t v32 = v17;
  uint64_t v33 = self;
  char v34 = &v37;
  unsigned int v35 = v56;
  BOOL v36 = &v43;
  [(BRCPQLConnection *)v17 performWithFlags:1 action:v31];
  id v18 = (id)v38[5];
  if (v18)
  {
    id v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      id v26 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v49 = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]";
      __int16 v50 = 2080;
      if (!v29) {
        id v26 = "(ignored by caller)";
      }
      long long v51 = v26;
      __int16 v52 = 2112;
      id v53 = v18;
      __int16 v54 = 2112;
      long long v55 = v19;
      _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (v29) {
    *long long v29 = v18;
  }

  fclose(v16);
  if (cloudDocsFD >= 0) {
    [(BRCAccountSessionFPFS *)self enableDatabaseProfilingForDB:v17];
  }
  BOOL v21 = *((unsigned char *)v44 + 24) != 0;

  _Block_object_dispose(v56, 8);
LABEL_23:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  __brc_leave_section(v47);

  return v21;
}

uint64_t __118__BRCAccountSessionFPFS_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userVersion];
  unint64_t v5 = [v4 unsignedLongValue];

  if (v5 >> 4 >= 0x753)
  {
    BOOL v6 = *(void **)(a1 + 40);
    if (v6[24])
    {
      id v7 = [v6 _getFPFSMigrationStatus:v3 withError:0];
      if (v7)
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        id obj = *(id *)(v8 + 40);
        unint64_t v9 = [MEMORY[0x263F08900] jsonStringFromDictionary:v7 options:1 error:&obj];
        objc_storeStrong((id *)(v8 + 40), obj);
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) writeLineWithFormat:@"%@", v9];
      }
      else
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x263F32360], 15, MEMORY[0x263EFFA78], @"Domain was not migrated");
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }

  return 0;
}

- (id)_computePathOfItemWithName:(id)a3 appLibrary:(id)a4 parentClientZoneRowID:(id)a5 parentID:(id)a6 type:(char)a7 needsLocalName:(BOOL)a8 db:(id)a9
{
  BOOL v9 = a8;
  int v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = objc_opt_new();
  if (v10 == 4)
  {
    long long v20 = @"/";
  }
  else
  {
    id v31 = v14;
    BOOL v21 = (void *)[v18 fetch:@" WITH RECURSIVE item_parents (item_id, zone_rowid, item_filename, item_localname) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_filename, item_localname FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_filename, li.item_localname FROM client_items AS li     INNER JOIN item_parents AS p USING (item_id, zone_rowid)) SELECT item_localname, item_filename FROM item_parents", v17, v16];
    id v22 = objc_alloc(MEMORY[0x263F325E0]);
    long long v23 = [v15 appLibraryID];
    long long v24 = (void *)[v22 initWithAppLibraryName:v23];

    uint64_t v25 = [v24 mangledIDString];
    [v19 insertObject:v25 atIndex:0];

    if ([v21 next])
    {
      do
      {
        id v26 = [v21 stringAtIndex:0];
        id v27 = [v21 stringAtIndex:1];
        if (!v9 || (v28 = [v26 length], long long v29 = v26, !v28)) {
          long long v29 = v27;
        }
        [v19 insertObject:v29 atIndex:1];
      }
      while (([v21 next] & 1) != 0);
    }
    id v14 = v31;
    [v19 addObject:v31];
    long long v20 = [NSString pathWithComponents:v19];
  }
  return v20;
}

- (BOOL)enumerateItemsWithType:(id)a3 itemRowIDs:(id)a4 db:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke;
  v37[3] = &unk_265081800;
  uint64_t v39 = &v40;
  id v14 = v12;
  id v38 = v14;
  [v14 performWithFlags:1 action:v37];
  long long v29 = v11;
  int cloudDocsFD = self->_cloudDocsFD;
  [(BRCAccountSessionFPFS *)self disableDatabaseProfilingForDB:v14];
  char v16 = *((unsigned char *)v41 + 24);
  id v17 = [MEMORY[0x263F8C720] rawInjection:"1" length:1];
  if ([v10 isEqualToString:@"reserved"])
  {
    id v18 = "(+item_state = BRC_ITEM_STATE_RESERVED_VALUE)";
    uint64_t v19 = 45;
LABEL_8:
    uint64_t v20 = [MEMORY[0x263F8C720] rawInjection:v18 length:v19];
    BOOL v21 = v13;

    id v17 = (void *)v20;
    goto LABEL_9;
  }
  if ([v10 isEqualToString:@"br-alias"])
  {
    id v18 = "item_type = 3";
LABEL_7:
    uint64_t v19 = 13;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"br-bookmark-fault"])
  {
    id v18 = "item_type = 7";
    goto LABEL_7;
  }
  if ([v10 isEqualToString:@"pkg"])
  {
    id v18 = "(item_type IN (1, 2, 8) AND HEX(SUBSTR(version_content_signature, 1, 1)) = '1B')";
    uint64_t v19 = 80;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"br-non-uploaded"])
  {
    id v18 = "item_localsyncupstate = 3";
    uint64_t v19 = 25;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"busy"])
  {
    id v18 = "item_birthtime IN (443779200, -2082844800)";
    uint64_t v19 = 42;
    goto LABEL_8;
  }
  BOOL v21 = v13;
LABEL_9:
  id v22 = [MEMORY[0x263F8C720] rawInjection:"1" length:1];
  if (v29)
  {
    uint64_t v23 = [MEMORY[0x263F8C710] formatInjection:@"indexset_contains(%p, rowid)", v29];

    id v22 = (void *)v23;
  }
  long long v24 = [MEMORY[0x263F8C710] formatInjection:@" WHERE %@ AND %@", v17, v22];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2;
  v30[3] = &unk_265081828;
  unsigned int v35 = &v40;
  id v25 = v24;
  char v36 = v16 ^ 1;
  id v31 = v25;
  uint64_t v32 = self;
  id v26 = v14;
  id v33 = v26;
  id v27 = v21;
  id v34 = v27;
  [v26 performWithFlags:1 action:v30];
  if ((cloudDocsFD & 0x80000000) == 0) {
    [(BRCAccountSessionFPFS *)self enableDatabaseProfilingForDB:v26];
  }

  _Block_object_dispose(&v40, 8);
  return 1;
}

uint64_t __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userVersion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)[v2 unsignedLongValue] >> 4 > 0x752;

  return 0;
}

uint64_t __91__BRCAccountSessionFPFS_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    id v4 = @"SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_file_id, item_doc_id, item_generation FROM client_items %@";
  }
  else {
    id v4 = @"SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_localname, item_file_id, item_doc_id, item_generation FROM client_items %@";
  }
  long long v24 = v3;
  unint64_t v5 = objc_msgSend(v3, "fetch:", v4, *(void *)(a1 + 32));
  while ([v5 next])
  {
    BOOL v6 = [v5 stringAtIndex:0];
    uint64_t v7 = [v5 objectOfClass:objc_opt_class() atIndex:1];
    uint64_t v8 = [v5 numberAtIndex:2];
    uint64_t v9 = [v5 numberAtIndex:3];
    char v10 = [v5 intAtIndex:4];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v11 = v6;
    }
    else
    {
      id v11 = [v5 stringAtIndex:5];
    }
    id v12 = v11;
    if (!*(unsigned char *)(a1 + 72) || (v13 = [v11 length], id v14 = v12, !v13)) {
      id v14 = v6;
    }
    id v15 = *(void **)(a1 + 40);
    uint64_t v28 = v12;
    id v16 = v14;
    id v17 = [v15 appLibraryByRowID:v9];
    id v18 = [*(id *)(a1 + 40) _computePathOfItemWithName:v16 appLibrary:v17 parentClientZoneRowID:v8 parentID:v7 type:v10 needsLocalName:*(unsigned __int8 *)(a1 + 72) db:*(void *)(a1 + 48)];
    id v27 = (void *)v8;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      uint64_t v19 = 5;
    }
    else {
      uint64_t v19 = 6;
    }
    id v25 = (void *)v9;
    [v5 numberAtIndex:v19];
    uint64_t v20 = v26 = (void *)v7;
    BOOL v21 = [v5 numberAtIndex:(v19 + 1)];
    id v22 = [v5 numberAtIndex:(v19 + 2)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [v5 close];

  return 0;
}

- (BOOL)dumpItemsURLsToHandle:(id)a3 itemRowIDs:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = self->_clientDB;
  if (!v10)
  {
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  int v11 = dup([v8 fileDescriptor]);
  id v12 = fdopen(v11, "a");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    id v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      id v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        uint64_t v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpItemsURLsToHandle:itemRowIDs:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5) {
          uint64_t v19 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        id v22 = v15;
        LOWORD(v23) = 2112;
        *(void *)((char *)&v23 + 2) = v16;
        _os_log_error_impl(&dword_23FA42000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v15;
    }

    goto LABEL_10;
  }
  uint64_t v13 = v12;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v22 = __Block_byref_object_copy__16;
  *(void *)&long long v23 = __Block_byref_object_dispose__16;
  *((void *)&v23 + 1) = [[BRCDumpContext alloc] initWithFile:v12 db:v10];
  [*(id *)(*(void *)&buf[8] + 40) setTaskTracker:0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __83__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke;
  v20[3] = &unk_265081850;
  void v20[4] = buf;
  [(BRCAccountSessionFPFS *)self enumerateItemsWithType:0 itemRowIDs:v9 db:v10 withBlock:v20];
  fclose(v13);
  _Block_object_dispose(buf, 8);

  BOOL v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __83__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeLineWithFormat:@"%@", a3];
}

- (BOOL)dumpItemsToHandle:(id)a3 itemType:(id)a4 tracker:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]", 360, v33);
  brc_bread_crumbs();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  BOOL v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v33[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    unsigned int v35 = v13;
    _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping all %@ items%@", buf, 0x20u);
  }

  id v15 = self->_clientDB;
  if (!v15) {
    goto LABEL_13;
  }
  int v16 = dup([v10 fileDescriptor]);
  id v17 = fdopen(v16, "a");
  if (!v17)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      BOOL v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        uint64_t v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a6) {
          uint64_t v24 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        unsigned int v35 = v19;
        LOWORD(v36) = 2112;
        *(void *)((char *)&v36 + 2) = v20;
        _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v19;
    }

LABEL_13:
    BOOL v22 = 0;
    goto LABEL_18;
  }
  int v18 = [v11 isEqualToString:@"all"];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unsigned int v35 = __Block_byref_object_copy__16;
  *(void *)&long long v36 = __Block_byref_object_dispose__16;
  *((void *)&v36 + 1) = [[BRCDumpContext alloc] initWithFile:v17 db:v15];
  [*(id *)(*(void *)&buf[8] + 40) setTaskTracker:v12];
  if (v18)
  {
    [*(id *)(*(void *)&buf[8] + 40) setNewLineAfterWrite:0];
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
    [*(id *)(*(void *)&buf[8] + 40) writeLineWithFormat:@"{"];
    [*(id *)(*(void *)&buf[8] + 40) writeEmptyLine];
  }
  else
  {
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 1;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __85__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke;
  v25[3] = &unk_265081878;
  void v25[4] = buf;
  v25[5] = &v29;
  char v26 = v18;
  v25[6] = v27;
  [(BRCAccountSessionFPFS *)self enumerateItemsWithType:v11 itemRowIDs:0 db:v15 withBlock:v25];
  if (v18)
  {
    [*(id *)(*(void *)&buf[8] + 40) writeEmptyLine];
    [*(id *)(*(void *)&buf[8] + 40) writeLineWithFormat:@"}"];
  }
  fclose(v17);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

  BOOL v22 = 1;
LABEL_18:

  __brc_leave_section(v33);
  return v22;
}

void __85__BRCAccountSessionFPFS_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  id v16 = a2;
  id v11 = a3;
  id v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if ((objc_msgSend(v12, "shouldKeepDumpingWithItemCount:includeAllItems:") & 1) == 0) {
    *a8 = 1;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v13 = objc_msgSend(v11, "br_stringByJSONEscaping");
    BOOL v14 = objc_msgSend(v16, "br_stringByJSONEscaping");
    id v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [v15 writeLineWithFormat:@"\t\"%@\": \"%@\"", v13, v14];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      [v15 writeLineWithFormat:@","];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeEmptyLine];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeLineWithFormat:@"\t\"%@\": \"%@\"", v13, v14];
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeLineWithFormat:@"%@", v11];
  }
}

- (int)_resolveDeviceID
{
  NSHomeDirectory();
  long long v6 = xmmword_23FD34358;
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  id v2 = objc_claimAutoreleasedReturnValue();
  if (getattrlist((const char *)[v2 fileSystemRepresentation], &v6, &v5, 8uLL, 0x20u) < 0) {
    int v3 = 0x80000000;
  }
  else {
    int v3 = HIDWORD(v5);
  }

  return v3;
}

- (BOOL)enumerateSharedToMeItemsWithBlock:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v29 = a3;
  long long v6 = self->_clientDB;
  char v28 = v6;
  if (v6)
  {
    uint64_t v45 = 0;
    char v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke;
    v42[3] = &unk_265081800;
    long long v44 = &v45;
    uint64_t v7 = v6;
    char v43 = v7;
    [(BRCPQLConnection *)v7 performWithFlags:1 action:v42];
    if (*((unsigned char *)v46 + 24))
    {
      id v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
        -[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]((uint64_t)v8, v9);
      }

      id v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorMethodNotImplemented:", sel_enumerateSharedToMeItemsWithBlock_error_);
      if (v10)
      {
        id v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        {
          id v25 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4) {
            id v25 = "(ignored by caller)";
          }
          *(void *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2112;
          __int16 v50 = v10;
          __int16 v51 = 2112;
          __int16 v52 = v11;
          _os_log_error_impl(&dword_23FA42000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      int v17 = [(BRCAccountSessionFPFS *)self _resolveDeviceID];
      if (v17 != 0x80000000)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        __int16 v50 = 0;
        BOOL v21 = +[BRCUserDefaults defaultsForMangledID:0];
        int v22 = [v21 readerScanBatchSize];

        uint64_t v38 = 0;
        uint64_t v39 = &v38;
        uint64_t v40 = 0x2020000000;
        char v41 = 0;
        uint64_t v23 = MEMORY[0x263EF8330];
        do
        {
          v30[0] = v23;
          v30[1] = 3221225472;
          v30[2] = __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_136;
          v30[3] = &unk_2650818A0;
          uint64_t v24 = v7;
          unsigned int v35 = &v38;
          uint64_t v36 = v22;
          id v34 = buf;
          uint64_t v31 = v24;
          int v32 = self;
          int v37 = v17;
          id v33 = v29;
          [(BRCPQLConnection *)v24 performWithFlags:1 action:v30];
        }
        while (!*((unsigned char *)v39 + 24));
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(buf, 8);
        BOOL v16 = 1;
        goto LABEL_24;
      }
      id v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_unkownErrorWithDescription:", @"Can't resolve device ID");
      if (v10)
      {
        int v18 = brc_bread_crumbs();
        uint64_t v19 = brc_default_log();
        if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
        {
          id v27 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4) {
            id v27 = "(ignored by caller)";
          }
          *(void *)&buf[14] = v27;
          *(_WORD *)&buf[22] = 2112;
          __int16 v50 = v10;
          __int16 v51 = 2112;
          __int16 v52 = v18;
          _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        *a4 = v10;
      }
    }

    BOOL v16 = 0;
LABEL_24:

    _Block_object_dispose(&v45, 8);
    goto LABEL_25;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 25, @"The session has a nil DB");
  if (v13)
  {
    BOOL v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      char v26 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
      *(_WORD *)&buf[12] = 2080;
      if (!a4) {
        char v26 = "(ignored by caller)";
      }
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2112;
      __int16 v50 = v13;
      __int16 v51 = 2112;
      __int16 v52 = v14;
      _os_log_error_impl(&dword_23FA42000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4) {
    *a4 = v13;
  }

  BOOL v16 = 0;
LABEL_25:

  return v16;
}

uint64_t __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userVersion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)[v2 unsignedLongValue] >> 4 > 0x752;

  return 0;
}

uint64_t __84__BRCAccountSessionFPFS_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_136(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) fetchWithSlowStatementRadar:@"none", @"SELECT item_file_id, zone_rowid    FROM client_items   WHERE item_sharing_options != 0    ORDER BY rowid    LIMIT %lld    OFFSET %lld", *(void *)(a1 + 72), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) sql];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if ([v2 next])
  {
    do
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v3 = [v2 integerAtIndex:0];
      id v4 = *(void **)(a1 + 40);
      uint64_t v5 = [v2 numberAtIndex:1];
      long long v6 = [v4 serverZoneByRowID:v5];

      uint64_t v7 = [v6 clientZone];
      int v8 = [v7 isSharedZone];

      if (v8)
      {
        id v9 = objc_msgSend(NSString, "br_pathWithDeviceID:fileID:", *(unsigned int *)(a1 + 80), v3);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    while (([v2 next] & 1) != 0);
  }

  return 0;
}

- (BOOL)dumpDatabaseToFileHandle:(id)a3 zoneName:(id)a4 includeAllItems:(BOOL)a5 verbose:(BOOL)a6 tracker:(id)a7 error:(id *)a8
{
  BOOL v9 = a6;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v40 = a4;
  id v41 = a7;
  memset(v61, 0, sizeof(v61));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]", 515, v61);
  uint64_t v13 = brc_bread_crumbs();
  BOOL v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]();
  }

  id v15 = self->_clientDB;
  BOOL v16 = v15;
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v51 = 0;
  __int16 v52 = &v51;
  uint64_t v53 = 0x3032000000;
  __int16 v54 = __Block_byref_object_copy__16;
  long long v55 = __Block_byref_object_dispose__16;
  id v56 = 0;
  int cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    int v18 = 0;
    if (!v15)
    {
LABEL_24:
      BOOL v32 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    int v18 = [(BRCAccountSessionFPFS *)self containerScheduler];
    if (!v16) {
      goto LABEL_24;
    }
  }
  int v19 = dup([v42 fileDescriptor]);
  uint64_t v20 = fdopen(v19, "a");
  if (!v20)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    id v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      id v34 = brc_bread_crumbs();
      unsigned int v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        uint64_t v38 = "(passed to caller)";
        *(_DWORD *)char v70 = 136315906;
        *(void *)&v70[4] = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItem"
                             "s:verbose:tracker:error:]";
        *(_WORD *)&v70[12] = 2080;
        if (!a8) {
          uint64_t v38 = "(ignored by caller)";
        }
        *(void *)&v70[14] = v38;
        *(_WORD *)&v70[22] = 2112;
        v71 = v33;
        LOWORD(v72) = 2112;
        *(void *)((char *)&v72 + 2) = v34;
        _os_log_error_impl(&dword_23FA42000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v70, 0x2Au);
      }
    }
    if (a8) {
      *a8 = v33;
    }

    goto LABEL_24;
  }
  *(void *)char v70 = 0;
  *(void *)&v70[8] = v70;
  *(void *)&v70[16] = 0x3032000000;
  v71 = __Block_byref_object_copy__16;
  *(void *)&long long v72 = __Block_byref_object_dispose__16;
  *((void *)&v72 + 1) = [[BRCDumpContext alloc] initWithFile:v20 db:v16];
  [*(id *)(*(void *)&v70[8] + 40) setLiveDaemon:cloudDocsFD >= 0];
  [*(id *)(*(void *)&v70[8] + 40) setTaskTracker:v41];
  [*(id *)(*(void *)&v70[8] + 40) setVerbose:v9];
  [(BRCAccountSessionFPFS *)self disableDatabaseProfilingForDB:v16];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __116__BRCAccountSessionFPFS_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke;
  v43[3] = &unk_265081908;
  uint64_t v47 = v70;
  v43[4] = self;
  BOOL v21 = v16;
  long long v44 = v21;
  id v45 = v18;
  BOOL v50 = a5;
  id v46 = v40;
  char v48 = &v51;
  uint64_t v49 = &v57;
  [(BRCPQLConnection *)v21 performWithFlags:1 action:v43];
  int v22 = [(BRCAccountSessionFPFS *)self analyticsReporter];
  [v22 dumpToContext:*(void *)(*(void *)&v70[8] + 40)];

  uint64_t v23 = [(BRCAccountSessionFPFS *)self globalProgress];
  [v23 dumpToContext:*(void *)(*(void *)&v70[8] + 40)];

  uint64_t v24 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
  [v24 dumpToContext:*(void *)(*(void *)&v70[8] + 40)];

  id v25 = +[BRCUserDefaults defaultsForMangledID:0];
  int v26 = [v25 fpfsUploadV2];

  if (v26)
  {
    id v27 = +[BRCUploadSyncUpRequestsManager defaultManagerWithPersonaIdentifier:self->_personaIdentifier];
    [v27 dumpToContext:*(void *)(*(void *)&v70[8] + 40)];
  }
  char v28 = +[BRCDaemonFPFS daemon];
  [v28 dumpToContext:*(void *)(*(void *)&v70[8] + 40)];

  id v29 = (id)v52[5];
  if (v29)
  {
    id v30 = brc_bread_crumbs();
    uint64_t v31 = brc_default_log();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      int v37 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v63 = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]";
      __int16 v64 = 2080;
      if (!a8) {
        int v37 = "(ignored by caller)";
      }
      uint64_t v65 = v37;
      __int16 v66 = 2112;
      id v67 = v29;
      __int16 v68 = 2112;
      v69 = v30;
      _os_log_error_impl(&dword_23FA42000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a8) {
    *a8 = v29;
  }

  fclose(v20);
  if (cloudDocsFD >= 0) {
    [(BRCAccountSessionFPFS *)self enableDatabaseProfilingForDB:v21];
  }
  BOOL v32 = *((unsigned char *)v58 + 24) != 0;

  _Block_object_dispose(v70, 8);
LABEL_25:
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  __brc_leave_section(v61);

  return v32;
}

uint64_t __116__BRCAccountSessionFPFS_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
  v112 = (void *)[v3 fetch:@"SELECT count(*) FROM boot_history"];
  [v112 next];
  int v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) liveDaemon];
  long long v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  v115 = v4;
  uint64_t v8 = [v4 stringFromDate:v7];
  BOOL v9 = (void *)v8;
  if (v5)
  {
    id v10 = [*(id *)(a1 + 32) accountDSID];
    if ([*(id *)(a1 + 32) icloudAccountIsInCarry]) {
      id v11 = "Yes";
    }
    else {
      id v11 = "No";
    }
    id v12 = objc_msgSend(NSString, "br_currentHomeDir");
    uint64_t v13 = objc_msgSend(v12, "br_realpath");
    [v6 writeLineWithFormat:@"dump taken at %@ [account=%@] [inCarry=%s] [home=%@]", v9, v10, v11, v13];
  }
  else
  {
    [v6 writeLineWithFormat:@"dump taken at %@", v8];
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:&stru_26F3822F0];
  BOOL v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v15 = [*(id *)(a1 + 40) userVersion];
  [v14 writeLineWithFormat:@"database version: %@", v15];

  if (*(void *)(*(void *)(a1 + 32) + 88)) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"database ID: %@", *(void *)(*(void *)(a1 + 32) + 88)];
  }
  BOOL v16 = [*(id *)(a1 + 40) userVersion];
  unint64_t v17 = [v16 unsignedLongValue];

  int v18 = @"FPFS";
  if (v17 >> 4 <= 0x752) {
    int v18 = @"Legacy";
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"fsType: %@", v18];
  if (v17 >> 4 >= 0x753)
  {
    int v19 = *(void **)(a1 + 32);
    if (v19[24])
    {
      uint64_t v20 = [v19 _getFPFSMigrationStatus:v3 withError:0];
      BOOL v21 = [v20 objectForKeyedSubscript:@"MigrationStatus"];
      int v22 = v21;
      if (v21)
      {
        uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        [v21 unsignedIntValue];
        objc_msgSend(v23, "writeLineWithFormat:", @"FPFS import state: %s", BRCPrettyPrintEnum());
      }
      uint64_t v24 = [v20 objectForKeyedSubscript:@"kBRCFPFSMigrationUUIDKey"];
      if (v24) {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"FPFS import UUID: %@", v24];
      }
      id v25 = [v20 objectForKeyedSubscript:@"NonMigratedItems"];
      if (v25) {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"FPFS import pending items: %@", v25];
      }
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:&stru_26F3822F0];
  int v26 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v27 = +[BRCDaemonFPFS daemon];
  char v28 = [v27 startupDate];
  [v28 timeIntervalSinceNow];
  objc_msgSend(v26, "writeLineWithFormat:", @"boot_history (startup %.1fs ago)", -v29);

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
  id v30 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v31 = [v30 dumpDateFormat];
  [v115 setDateFormat:v31];

  BOOL v32 = [v3 userVersion];
  unint64_t v33 = [v32 unsignedLongValue];

  if (v33 <= 0x7533)
  {
    id v34 = "";
    uint64_t v35 = 0;
  }
  else
  {
    id v34 = ",device_id";
    uint64_t v35 = 10;
  }
  uint64_t v36 = [MEMORY[0x263F8C720] rawInjection:v34 length:v35];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"server_truth"];
  v113 = (void *)v36;
  v114 = v3;
  int v37 = (void *)[v3 fetch:@"SELECT date,os,br,bird_schema,db_schema%@ FROM server_boot_history ORDER BY rowid DESC LIMIT 10", v36];
  if ([v37 next])
  {
    do
    {
      uint64_t v38 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v37, "intAtIndex:", 0));
      uint64_t v39 = [v115 stringFromDate:v38];
      id v40 = [v37 stringAtIndex:1];
      id v41 = [v37 stringAtIndex:2];
      id v42 = [v37 numberAtIndex:3];
      char v43 = [v37 numberAtIndex:4];
      if (v33 < 0x7534)
      {
        long long v44 = 0;
      }
      else
      {
        long long v44 = [v37 numberAtIndex:5];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@", v39, v40, v41, v42, v43, v44];
    }
    while (([v37 next] & 1) != 0);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"client_truth"];
  id v45 = (void *)[v114 fetch:@"SELECT date,os,br,bird_schema,db_schema%@ FROM boot_history ORDER BY rowid DESC LIMIT 10", v113];

  if ([v45 next])
  {
    do
    {
      id v46 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v45, "intAtIndex:", 0));
      uint64_t v47 = [v115 stringFromDate:v46];
      char v48 = [v45 stringAtIndex:1];
      uint64_t v49 = [v45 stringAtIndex:2];
      BOOL v50 = [v45 numberAtIndex:3];
      uint64_t v51 = [v45 numberAtIndex:4];
      if (v33 < 0x7534)
      {
        __int16 v52 = 0;
      }
      else
      {
        __int16 v52 = [v45 numberAtIndex:5];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@", v47, v48, v49, v50, v51, v52];
    }
    while (([v45 next] & 1) != 0);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"backup_detector"];
  uint64_t v53 = v114;
  __int16 v54 = (void *)[v114 fetch:@"SELECT old,new,counter,os,br FROM backup_detector"];

  if ([v54 next])
  {
    v110 = [v54 numberAtIndex:0];
    long long v55 = [v54 numberAtIndex:1];
    id v56 = [v54 numberAtIndex:2];
    uint64_t v57 = [v54 stringAtIndex:3];
    long long v58 = [v54 stringAtIndex:4];
    uint64_t v59 = [v114 userVersion];
    char v60 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v61 = v57;
    uint64_t v62 = [v61 UTF8String];
    id v63 = v58;
    uint64_t v64 = [v63 UTF8String];
    if (v59) {
      uint64_t v65 = [v59 longValue];
    }
    else {
      uint64_t v65 = -1;
    }
    [v60 writeLineWithFormat:@"  [%@|%@|%@] OS:%s CloudDocs:%s DBSchema:%ld", v110, v55, v56, v62, v64, v65];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    [v54 close];

    uint64_t v53 = v114;
  }
  __int16 v66 = (void *)[v53 fetch:@"SELECT * FROM server_state"];

  if ([v66 next])
  {
    id v67 = [v66 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"server_state"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"%@", v67];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    [v66 close];
  }
  else
  {
    id v67 = 0;
  }
  __int16 v68 = (void *)[v53 fetch:@"SELECT * FROM client_state"];

  if ([v68 next])
  {
    v69 = +[BRCAccountSessionFPFS _classesForClientState];
    uint64_t v70 = [v68 unarchivedObjectOfClasses:v69 atIndex:0];

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"client_state"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"%@", v70];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    [v68 close];

    v111 = (void *)v70;
  }
  else
  {
    v111 = v67;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"devices:"];
  v71 = (void *)[v53 fetch:@"SELECT key, name FROM devices"];

  if ([v71 next])
  {
    do
    {
      uint64_t v72 = [v71 longAtIndex:0];
      uint64_t v73 = [v71 stringAtIndex:1];
      v74 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v75 = objc_msgSend(v73, "fp_obfuscatedFilename");
      [v74 writeLineWithFormat:@"    o \"%@\" (%ld)", v75, v72];
    }
    while (([v71 next] & 1) != 0);
  }
  [v71 close];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"users:"];
  uint64_t v76 = (void *)[v53 fetch:@"SELECT user_key, user_name, user_plist FROM users"];

  if ([v76 next])
  {
    do
    {
      uint64_t v77 = [v76 longAtIndex:0];
      id v78 = [v76 stringAtIndex:1];
      id v79 = [v76 objectOfClass:objc_opt_class() atIndex:2];
      id v80 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v81 = [v79 nameComponents];
      v82 = objc_msgSend(v81, "br_formattedName");
      __int16 v83 = objc_msgSend(v82, "fp_obfuscatedFilename");
      [v80 writeLineWithFormat:@"    o \"%@\" %@ (%ld)", v78, v83, v77];
    }
    while (([v76 next] & 1) != 0);
  }
  [v76 close];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
  [*(id *)(a1 + 48) dumpToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) includeAllItems:*(unsigned __int8 *)(a1 + 88) db:*(void *)(a1 + 40)];
  v84 = *(void **)(a1 + 32);
  uint64_t v85 = *(void *)(a1 + 56);
  id v121 = 0;
  BOOL v86 = [v84 clientZonesMatchingSearchString:v85 error:&v121];
  id v87 = v121;
  id v88 = v87;
  int v89 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v86)
  {
    id v108 = v87;
    uint64_t v90 = [v86 count];
    v91 = *(__CFString **)(a1 + 56);
    if (!v91) {
      v91 = @"*";
    }
    [v89 writeLineWithFormat:@"%u containers matching '%@'", v90, v91];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v109 = v86;
    id v92 = v86;
    uint64_t v93 = [v92 countByEnumeratingWithState:&v117 objects:v126 count:16];
    if (v93)
    {
      uint64_t v94 = v93;
      uint64_t v95 = *(void *)v118;
      while (2)
      {
        for (uint64_t i = 0; i != v94; ++i)
        {
          if (*(void *)v118 != v95) {
            objc_enumerationMutation(v92);
          }
          uint64_t v97 = *(void *)(*((void *)&v117 + 1) + 8 * i);
          v98 = (void *)MEMORY[0x2455D97F0]();
          v99 = brc_bread_crumbs();
          v100 = brc_default_log();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v123 = v97;
            __int16 v124 = 2112;
            v125 = v99;
            _os_log_debug_impl(&dword_23FA42000, v100, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping client zone %@%@", buf, 0x16u);
          }

          if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isCancelled])
          {
            goto LABEL_63;
          }
          v101 = *(void **)(a1 + 32);
          uint64_t v102 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          uint64_t v103 = *(unsigned __int8 *)(a1 + 88);
          uint64_t v104 = *(void *)(*(void *)(a1 + 72) + 8);
          id obj = *(id *)(v104 + 40);
          [v101 _dumpClientZone:v97 toContext:v102 includeAllItems:v103 error:&obj];
          objc_storeStrong((id *)(v104 + 40), obj);
        }
        uint64_t v94 = [v92 countByEnumeratingWithState:&v117 objects:v126 count:16];
        if (v94) {
          continue;
        }
        break;
      }
    }
LABEL_63:

    v105 = v114;
    id v88 = v108;
    BOOL v86 = v109;
  }
  else
  {
    [v89 writeLineWithFormat:@"%@", v87];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    v105 = v114;
  }

  if (*(unsigned char *)(a1 + 88)) {
    +[BRCPackageItem dumpSession:*(void *)(a1 + 32) toContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) db:v105 error:0];
  }
  [*(id *)(a1 + 32) dumpXPCClientsToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 32) dumpMiscOperationsToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(*(void *)(a1 + 32) + 136) dumpToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v106 = [*(id *)(a1 + 32) analyticsReporter];
  [v106 dumpDatabaseInfoToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  [v112 close];

  return 0;
}

- (void)_dumpClientZoneBlockedState:(id)a3 toContext:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (([v9 state] & 0x10000) != 0)
  {
    long long v6 = [v5 highlightedString:@">>> BROKEN STRUCTURE" type:3];
    [v5 writeLineWithFormat:@"%@", v6];
  }
  if ([v9 isSyncBlockedBecauseAppNotInstalled])
  {
    uint64_t v7 = [v5 highlightedString:@">>> SYNC DISABLED (app not installed)" type:6];
    [v5 writeLineWithFormat:@"%@", v7];
  }
  if ([v9 isSyncBlockedBecauseOSNeedsUpgrade])
  {
    uint64_t v8 = [v5 highlightedString:@">>> NEEDS UPGRADE" type:3];
    [v5 writeLineWithFormat:@"%@", v8];
  }
}

- (BOOL)_dumpClientZoneStatus:(id)a3 toContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 descriptionWithContext:v9];
  [v9 writeLineWithFormat:@"%@", v10];

  [(BRCAccountSessionFPFS *)self _dumpClientZoneBlockedState:v8 toContext:v9];
  [v9 pushIndentation];
  id v11 = [v8 serverZone];
  LODWORD(v10) = [v11 dumpStatusToContext:v9 error:a5];

  BOOL v12 = v10 && ([v8 dumpStatusToContext:v9 error:a5] & 1) != 0;
  [v9 popIndentation];

  return v12;
}

- (BOOL)_dumpClientZone:(id)a3 toContext:(id)a4 includeAllItems:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [v10 descriptionWithContext:v11];
  [v11 writeLineWithFormat:@"- %@", v12];

  [(BRCAccountSessionFPFS *)self _dumpClientZoneBlockedState:v10 toContext:v11];
  [v11 writeLineWithFormat:@"-----------------------------------------------------"];
  if ([v10 isPrivateZone])
  {
    [v11 pushIndentation];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v13 = [v10 asPrivateClientZone];
    BOOL v14 = [v13 appLibraries];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) dumpToContext:v11];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [v11 popIndentation];
  }
  [v11 writeLineWithFormat:&stru_26F3822F0];
  [v11 pushIndentation];
  int v19 = [v10 serverZone];
  if (!v19)
  {
    if ([v10 isSharedZone])
    {
      uint64_t v20 = [v10 asSharedClientZone];
      BOOL v21 = [v20 zoneName];
      int v22 = [v20 ownerName];
      uint64_t v23 = [v11 db];
      int v19 = [(BRCAccountSessionFPFS *)self _sharedServerZoneByName:v21 ownerName:v22 db:v23];
    }
    else
    {
      uint64_t v20 = [v10 zoneName];
      BOOL v21 = [v11 db];
      int v19 = [(BRCAccountSessionFPFS *)self _privateServerZoneByName:v20 db:v21];
    }

    [v10 associateWithServerZone:v19];
  }
  int v24 = [v10 dumpActivityToContext:v11 includeExpensiveActivity:v7 error:a6];
  if (v24)
  {
    [v11 writeLineWithFormat:&stru_26F3822F0];
    int v25 = [v19 dumpTablesToContext:v11 includeAllItems:v7 error:a6];
    int v26 = [v10 dumpTablesToContext:v11 includeAllItems:v7 error:a6];
    if (v25 && v26) {
      [v11 writeLineWithFormat:@" - not done dumping items -"];
    }
    [v11 popIndentation];
    [v11 writeLineWithFormat:@"-----------------------------------------------------"];
  }
  else
  {
    [v11 popIndentation];
  }

  return v24;
}

- (BOOL)dumpStatusToFileHandle:(id)a3 zoneName:(id)a4 tracker:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]", 855, v34);
  brc_bread_crumbs();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  BOOL v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v34[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    long long v44 = v13;
    _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping status for zone: %@%@", buf, 0x20u);
  }

  uint64_t v15 = self->_clientDB;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v44 = __Block_byref_object_copy__16;
  id v45 = __Block_byref_object_dispose__16;
  id v46 = 0;
  [(BRCAccountSessionFPFS *)self disableDatabaseProfilingForDB:v15];
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  id v27 = __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke;
  long long v28 = &unk_265081390;
  id v16 = v10;
  id v29 = v16;
  uint64_t v33 = buf;
  id v17 = v12;
  id v30 = v17;
  long long v31 = self;
  id v18 = v11;
  id v32 = v18;
  [(BRCPQLConnection *)v15 performWithFlags:1 action:&v25];
  id v19 = *(id *)(*(void *)&buf[8] + 40);
  if (v19)
  {
    uint64_t v20 = brc_bread_crumbs();
    BOOL v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      int v24 = "(passed to caller)";
      *(_DWORD *)uint64_t v35 = 136315906;
      uint64_t v36 = "-[BRCAccountSessionFPFS(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]";
      __int16 v37 = 2080;
      if (!a6) {
        int v24 = "(ignored by caller)";
      }
      uint64_t v38 = v24;
      __int16 v39 = 2112;
      id v40 = v19;
      __int16 v41 = 2112;
      id v42 = v20;
      _os_log_error_impl(&dword_23FA42000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v35, 0x2Au);
    }
  }
  if (a6) {
    *a6 = v19;
  }

  -[BRCAccountSessionFPFS enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v15, v25, v26, v27, v28);
  BOOL v22 = *(void *)(*(void *)&buf[8] + 40) == 0;

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v34);

  return v22;
}

uint64_t __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = dup([*(id *)(a1 + 32) fileDescriptor]);
  id v5 = fdopen(v4, "a");
  if (v5)
  {
    long long v6 = v5;
    id v7 = objc_alloc_init(MEMORY[0x263F08790]);
    [v7 setDateStyle:1];
    [v7 setTimeStyle:2];
    id v8 = [[BRCDumpContext alloc] initWithFile:v6 db:v3];
    [(BRCDumpContext *)v8 setLiveDaemon:1];
    [(BRCDumpContext *)v8 setOnlyActiveStuff:1];
    [(BRCDumpContext *)v8 setTaskTracker:*(void *)(a1 + 40)];
    id v9 = (void *)[v3 fetch:@"SELECT count(*) FROM boot_history"];
    [v9 next];
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v46 = 0;
    id v12 = [v10 clientZonesMatchingSearchString:v11 error:&v46];
    id v13 = v46;
    BOOL v14 = v13;
    if (v12)
    {
      __int16 v39 = v6;
      uint64_t v15 = [v12 count];
      id v16 = *(void **)(a1 + 56);
      id v40 = v3;
      __int16 v37 = v9;
      id v38 = v7;
      uint64_t v35 = v14;
      if (v16) {
        id v17 = (const char *)[v16 UTF8String];
      }
      else {
        id v17 = "*";
      }
      [(BRCDumpContext *)v8 writeLineWithFormat:@"%u containers matching '%s'", v15, v17];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v36 = v12;
      id v23 = v12;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v43 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            id v29 = (void *)MEMORY[0x2455D97F0]();
            id v30 = brc_bread_crumbs();
            long long v31 = brc_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              id v48 = v23;
              __int16 v49 = 2112;
              BOOL v50 = v30;
              _os_log_debug_impl(&dword_23FA42000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping container %@%@", buf, 0x16u);
            }

            if ([(BRCDumpContext *)v8 isCancelled])
            {
              goto LABEL_22;
            }
            id v32 = *(void **)(a1 + 48);
            uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
            id obj = *(id *)(v33 + 40);
            [v32 _dumpClientZoneStatus:v28 toContext:v8 error:&obj];
            objc_storeStrong((id *)(v33 + 40), obj);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
LABEL_22:

      long long v6 = v39;
      id v3 = v40;
      id v9 = v37;
      id v7 = v38;
      BOOL v14 = v35;
      id v12 = v36;
    }
    else
    {
      [(BRCDumpContext *)v8 writeLineWithFormat:@"%@", v13];
      [(BRCDumpContext *)v8 writeEmptyLine];
    }

    [v9 close];
    fclose(v6);
  }
  else
  {
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1((uint64_t)v18, v19);
    }

    uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    BOOL v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    [0 close];
  }

  return 0;
}

- (id)_old_privateAppLibraryByZoneName:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__BRCAccountSessionFPFS_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke;
  v6[3] = &unk_26507F1E8;
  v6[4] = self;
  int v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@ AND (app_library_owner = %@ OR app_library_owner IS NULL)", a3, *MEMORY[0x263EFD488] sql];
  return v4;
}

id __87__BRCAccountSessionFPFS_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)[*(id *)(a1 + 32) newAppLibraryFromPQLResultSet:a2 version:2];
  return v2;
}

- (id)trashedItemsEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5
{
  id v8 = a5;
  id v9 = (void *)[v8 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items      WHERE item_scope = 3        AND item_notifs_rank >= %lld        AND item_user_visible = 1   ORDER BY item_notifs_rank ASC LIMIT %lld", a3, a4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__BRCAccountSessionFPFS_FPFSAdditions__trashedItemsEnumeratorFromNotifRank_batchSize_db___block_invoke;
  uint64_t v13[3] = &unk_26507F210;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 enumerateObjects:v13];

  return v11;
}

id __89__BRCAccountSessionFPFS_FPFSAdditions__trashedItemsEnumeratorFromNotifRank_batchSize_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (BOOL)isMigratingToFPFS
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStateKey"];
  if (v3)
  {
    int v4 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationUUIDKey"];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unsigned)fpfsMigrationState
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStateKey"];
  unsigned int v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)fpfsMigrationCleanupLastRowID
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationCleanupLastRowIDKey"];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)fpfsMigrationInvestigatedItemsCount
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationInvestigatedItemCountKey"];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (id)fpfsMigrationItemsNotMigratedDictionary
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  clientState = self->_clientState;
  return [(BRCClientState *)clientState objectForKeyedSubscript:@"kBRCFPFSMigrationItemsNotMigratedDictionaryKey"];
}

- (id)fpfsMigrationUUID
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  clientState = self->_clientState;
  return [(BRCClientState *)clientState objectForKeyedSubscript:@"kBRCFPFSMigrationUUIDKey"];
}

- (id)fpfsMigrationStartTime
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  clientState = self->_clientState;
  return [(BRCClientState *)clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStartTimeKey"];
}

- (id)fpfsMigrationEndTime
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  clientState = self->_clientState;
  return [(BRCClientState *)clientState objectForKeyedSubscript:@"kBRCFPFSMigrationEndTimeKey"];
}

- (int)fpfsMigrationMigratedTypes
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationMigratedTypesStatKey"];
  int v4 = [v3 intValue];

  return v4;
}

- (int)fpfsMigrationNonMigratedTypes
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationNonMigratedTypesStatKey"];
  int v4 = [v3 intValue];

  return v4;
}

- (BOOL)fpfsMigrationStatusTTRTriggered
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStatusTTRTriggeredKey"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)fpfsMigrationStatusTTRWasTriggered
{
  [(BRCClientState *)self->_clientState setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kBRCFPFSMigrationStatusTTRTriggeredKey"];
  clientDB = self->_clientDB;
  [(BRCPQLConnection *)clientDB forceBatchStart];
}

- (void)updateFPFSMigrationMigratedTypes:(char)a3
{
}

- (void)updateFPFSMigrationMigratedTypesWithPackage
{
}

- (void)updateFPFSMigrationNonMigratedTypes:(char)a3
{
}

- (void)updateFPFSMigrationNonMigratedTypesWithPackage
{
}

- (void)_updateFPFSMigrationItemTypes:(char)a3 withStateKey:(id)a4 isPackage:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a3;
  id v8 = a4;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v9 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:v8];
    unsigned int v12 = [v10 intValue];

    setTypeFieldFromDBType(v6, v5, (__int16 *)&v12);
    uint64_t v11 = [NSNumber numberWithInt:v12];
    [(BRCClientState *)self->_clientState setObject:v11 forKeyedSubscript:v8];

    [(BRCPQLConnection *)self->_clientDB forceBatchStart];
  }
}

- (int64_t)fpfsMigrationBouncedItemCount
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationBouncedItemCountStatKey"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int64_t)fpfsMigrationBouncedMatrix
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationBouncedMatrixStatKey"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (void)_updateFPFSMigrationBouncedItemType:(char)a3 withExistingItemType:(char)a4
{
  int v4 = a4;
  int v5 = a3;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v7 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationBouncedMatrixStatKey"];

  if (v7)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCAccountSessionFPFS fpfsMigrationBouncedItemCount](self, "fpfsMigrationBouncedItemCount") + 1);
    [(BRCClientState *)self->_clientState setObject:v8 forKeyedSubscript:@"kBRCFPFSMigrationBouncedItemCountStatKey"];

    id v9 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationBouncedMatrixStatKey"];
    uint64_t v10 = [v9 longLongValue];
    unint64_t v11 = v10 & 0xFFFFFFFFFF000000;

    if (v5 == v4)
    {
      LODWORD(v10) = v10 & 0xEFFFFF | 0x100000;
    }
    else
    {
      switch(v5)
      {
        case 0:
          switch(v4)
          {
            case 1:
              LODWORD(v10) = v10 & 0xFFFFF7 | 8;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xFFFFFB | 4;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFFFFFD | 2;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFFFFFE | 1;
              break;
            default:
              unsigned int v12 = brc_bread_crumbs();
              id v13 = brc_default_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
                goto LABEL_8;
              }
              goto LABEL_9;
          }
          break;
        case 1:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 & 0xFEFFFF | 0x10000;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xF7FFFF | 0x80000;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFBFFFF | 0x40000;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFDFFFF | 0x20000;
              break;
            default:
              unsigned int v12 = brc_bread_crumbs();
              id v13 = brc_default_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
                goto LABEL_8;
              }
              goto LABEL_9;
          }
          break;
        case 2:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 | 0x1000;
              break;
            case 1:
              LODWORD(v10) = v10 & 0xFF7FFF | 0x8000;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFFBFFF | 0x4000;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFFDFFF | 0x2000;
              break;
            default:
              unsigned int v12 = brc_bread_crumbs();
              id v13 = brc_default_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
                goto LABEL_8;
              }
              goto LABEL_9;
          }
          break;
        case 3:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 & 0xFFFEFF | 0x100;
              break;
            case 1:
              LODWORD(v10) = v10 & 0xFFF7FF | 0x800;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xFFFBFF | 0x400;
              break;
            case 4:
              LODWORD(v10) = v10 & 0xFFFDFF | 0x200;
              break;
            default:
              unsigned int v12 = brc_bread_crumbs();
              id v13 = brc_default_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
                goto LABEL_8;
              }
              goto LABEL_9;
          }
          break;
        case 4:
          switch(v4)
          {
            case 0:
              LODWORD(v10) = v10 & 0xFFFFEF | 0x10;
              break;
            case 1:
              LODWORD(v10) = v10 & 0xFFFF7F | 0x80;
              break;
            case 2:
              LODWORD(v10) = v10 & 0xFFFFBF | 0x40;
              break;
            case 3:
              LODWORD(v10) = v10 & 0xFFFFDF | 0x20;
              break;
            default:
              unsigned int v12 = brc_bread_crumbs();
              id v13 = brc_default_log();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
                goto LABEL_8;
              }
              goto LABEL_9;
          }
          break;
        default:
          unsigned int v12 = brc_bread_crumbs();
          id v13 = brc_default_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
LABEL_8:
          }
            -[BRCAccountSessionFPFS(FPFSAdditions) _updateFPFSMigrationBouncedItemType:withExistingItemType:]();
LABEL_9:

          break;
      }
    }
    id v14 = [NSNumber numberWithUnsignedLongLong:v10 & 0xFFFFFF | v11];
    [(BRCClientState *)self->_clientState setObject:v14 forKeyedSubscript:@"kBRCFPFSMigrationBouncedMatrixStatKey"];

    [(BRCPQLConnection *)self->_clientDB forceBatchStart];
  }
}

- (int64_t)fpfsMigrationNewItemsInDB
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationNewItemsInDBStatKey"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int64_t)fpfsMigrationNonMigratedItems
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCAccountSessionFPFS *)self getFPFSNonMigratedItemsWithDB:self->_clientDB];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (void)updateFPFSMigrationNewItemsInDB
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationNewItemsInDBStatKey"];

  if (v3)
  {
    int64_t v4 = NSNumber;
    int v5 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationNewItemsInDBStatKey"];
    int v6 = objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "longLongValue") + 1);
    [(BRCClientState *)self->_clientState setObject:v6 forKeyedSubscript:@"kBRCFPFSMigrationNewItemsInDBStatKey"];

    clientDB = self->_clientDB;
    [(BRCPQLConnection *)clientDB forceBatchStart];
  }
}

- (void)setFPFSMigrationState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v17[1] = *MEMORY[0x263EF8340];
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  int v5 = brc_bread_crumbs();
  int v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(BRCAccountSessionFPFS(FPFSAdditions) *)(uint64_t)v5 setFPFSMigrationState:v6];
  }

  id v7 = [NSNumber numberWithUnsignedInt:v3];
  [(BRCClientState *)self->_clientState setObject:v7 forKeyedSubscript:@"kBRCFPFSMigrationStateKey"];

  if (v3 == 2)
  {
    uint64_t v10 = brc_bread_crumbs();
    unint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS(FPFSAdditions) setFPFSMigrationState:]();
    }

    [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationCleanupLastRowIDKey"];
    unsigned int v12 = [(BRCAccountSessionFPFS(FPFSAdditions) *)self fsImporter];
    [v12 signal];
  }
  else if (!v3)
  {
    id v8 = [(BRCAccountSessionFPFS *)self fpfsMigrationUUID];

    if (v8)
    {
      id v9 = [MEMORY[0x263EFF910] now];
      [(BRCClientState *)self->_clientState setObject:v9 forKeyedSubscript:@"kBRCFPFSMigrationEndTimeKey"];

      [(BRCAccountSessionFPFS *)self triggerFPFSImportFinishedTelemetryEventIfNeeded];
    }
    else
    {
      [(BRCAccountSessionFPFS *)self _cleanupMigrationClientState];
    }
  }
  [(BRCPQLConnection *)self->_clientDB forceBatchStart];
  id v13 = [MEMORY[0x263F08A00] defaultCenter];
  id v16 = @"kBRCFPFSMigrationStateKey";
  id v14 = [NSNumber numberWithUnsignedInt:v3];
  v17[0] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [v13 postNotificationName:@"kBRCFPFSMigrationStateKey" object:0 userInfo:v15];
}

- (void)_cleanupMigrationClientState
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationStateKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationCleanupLastRowIDKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationLostItemCountKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationChildItemsLostItemCountKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationBusyDateLostItemCountKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationStartTimeKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationEndTimeKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationInitialItemCountKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationInitialItemsNeedMigratingCountKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationMigratedTypesStatKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationNonMigratedTypesStatKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationBouncedItemCountStatKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationBouncedMatrixStatKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationNewItemsInDBStatKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationStatusMigrationStatsTakenAtKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationStatusLastItemsNotMigratedKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationStatusLastReconciledItemsKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationInvestigatedItemCountKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationItemsNotMigratedDictionaryKey"];
  [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationRecoveryWasInvokedAtKey"];
  clientDB = self->_clientDB;
  [(BRCPQLConnection *)clientDB forceBatchStart];
}

- (void)updateFPFSMigrationCleanupLastRowID:(unint64_t)a3 lostItemCount:(unint64_t)a4 childLostItemCount:(unint64_t)a5 busyDateLostItemCount:(unint64_t)a6 ignoredFromSyncLostItemCount:(unint64_t)a7 investigatedItemsCount:(unint64_t)a8 notMigratedItems:(id)a9
{
  id v23 = a9;
  if (a3)
  {
    id v16 = [NSNumber numberWithUnsignedLongLong:a3];
    p_clientState = &self->_clientState;
    [(BRCClientState *)self->_clientState setObject:v16 forKeyedSubscript:@"kBRCFPFSMigrationCleanupLastRowIDKey"];

    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    p_clientState = &self->_clientState;
    [(BRCClientState *)self->_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationCleanupLastRowIDKey"];
    if (a4)
    {
LABEL_3:
      id v18 = [NSNumber numberWithUnsignedLongLong:a4];
      [(BRCClientState *)*p_clientState setObject:v18 forKeyedSubscript:@"kBRCFPFSMigrationLostItemCountKey"];

      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  [(BRCClientState *)*p_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationLostItemCountKey"];
  if (a5)
  {
LABEL_4:
    id v19 = [NSNumber numberWithUnsignedLongLong:a5];
    [(BRCClientState *)*p_clientState setObject:v19 forKeyedSubscript:@"kBRCFPFSMigrationChildItemsLostItemCountKey"];

    if (a6) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  [(BRCClientState *)*p_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationChildItemsLostItemCountKey"];
  if (a6)
  {
LABEL_5:
    uint64_t v20 = [NSNumber numberWithUnsignedLongLong:a6];
    [(BRCClientState *)*p_clientState setObject:v20 forKeyedSubscript:@"kBRCFPFSMigrationBusyDateLostItemCountKey"];

    if (a7) {
      goto LABEL_6;
    }
LABEL_12:
    [(BRCClientState *)*p_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"];
    if (a8) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  [(BRCClientState *)*p_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationBusyDateLostItemCountKey"];
  if (!a7) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v21 = [NSNumber numberWithUnsignedLongLong:a7];
  [(BRCClientState *)*p_clientState setObject:v21 forKeyedSubscript:@"kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"];

  if (a8)
  {
LABEL_7:
    BOOL v22 = [NSNumber numberWithUnsignedLongLong:a8];
    [(BRCClientState *)*p_clientState setObject:v22 forKeyedSubscript:@"kBRCFPFSMigrationInvestigatedItemCountKey"];

    goto LABEL_14;
  }
LABEL_13:
  [(BRCClientState *)*p_clientState setObject:0 forKeyedSubscript:@"kBRCFPFSMigrationInvestigatedItemCountKey"];
LABEL_14:
  [(BRCClientState *)*p_clientState setObject:v23 forKeyedSubscript:@"kBRCFPFSMigrationItemsNotMigratedDictionaryKey"];
  [(BRCPQLConnection *)self->_clientDB forceBatchStart];
}

- (void)_populateNonMigratedItemEventForLocalDataWithEvent:(id)a3 fileIDData:(id)a4 diagnosticDescriptor:(id)a5 migrationStart:(id)a6
{
  id v57 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v57 investigation];
  id v14 = [v13 itemStatsInvestigation];
  uint64_t v15 = [v14 mTime];

  [v12 timeIntervalSince1970];
  double v17 = v16;

  id v18 = [v57 investigation];
  id v19 = [v18 itemStatsInvestigation];
  [v19 setMTimeBeforeMigrationStarted:v17 > (double)v15];

  if ([v57 hasInvestigation])
  {
    uint64_t v20 = [v57 investigation];
    int v21 = [v20 hasItemStatsInvestigation];

    if (v21)
    {
      if ((unint64_t)[v10 count] >= 2)
      {
        BOOL v22 = [v57 investigation];
        id v23 = [v22 itemStatsInvestigation];
        if ([v23 hasFsGenCount])
        {
          uint64_t v24 = [v57 investigation];
          uint64_t v25 = [v24 itemStatsInvestigation];
          uint64_t v26 = [v25 fsGenCount];
        }
        else
        {
          uint64_t v26 = 0;
        }

        id v27 = [v10 objectAtIndexedSubscript:1];
        uint64_t v28 = [v27 unsignedLongLongValue];

        uint64_t v29 = v28 - v26;
        BOOL v30 = v28 == v26;
        long long v31 = [v57 investigation];
        id v32 = [v31 itemStatsInvestigation];
        [v32 setDoGenCountsMatchInFileId:v30];

        uint64_t v33 = [v57 investigation];
        id v34 = [v33 itemStatsInvestigation];
        [v34 setGencountDiff:v29];
      }
      if ((unint64_t)[v10 count] >= 3)
      {
        uint64_t v35 = [v10 objectAtIndexedSubscript:2];
        BOOL v36 = [v35 unsignedLongLongValue] != 0;
        __int16 v37 = [v57 investigation];
        id v38 = [v37 itemStatsInvestigation];
        [v38 setHasLocalChanges:v36];
      }
      if ((unint64_t)[v10 count] >= 4)
      {
        __int16 v39 = [v10 objectAtIndexedSubscript:3];
        uint64_t v40 = [v39 unsignedLongLongValue];

        BOOL v41 = v40 == [v11 docID];
        long long v42 = [v57 investigation];
        long long v43 = [v42 itemStatsInvestigation];
        [v43 setDocIDMatches:v41];
      }
      if ((unint64_t)[v10 count] >= 5)
      {
        long long v44 = [v10 objectAtIndexedSubscript:4];
        uint64_t v45 = [v44 BOOLValue];
        id v46 = [v57 investigation];
        uint64_t v47 = [v46 itemStatsInvestigation];
        [v47 setAppLibraryMatches:v45];

        id v48 = [v11 diagnosticAttributes];
        __int16 v49 = [v48 objectForKeyedSubscript:*MEMORY[0x263F050E0]];

        if (v49)
        {
          BOOL v50 = [v10 objectAtIndexedSubscript:0];
          uint64_t v51 = -[BRCAccountSessionFPFS itemByRowID:](self, "itemByRowID:", [v50 unsignedLongLongValue]);
          uint64_t v52 = [v51 parentFileObjectID];
          uint64_t v53 = [v52 asString];

          uint64_t v54 = [v53 isEqualToString:v49];
          long long v55 = [v57 investigation];
          id v56 = [v55 itemStatsInvestigation];
          [v56 setParentMatches:v54];
        }
      }
    }
  }
}

- (void)sendFileStatsTelemetryWithDescriptors:(id)a3 perItemSendTelemetryBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __104__BRCAccountSessionFPFS_FPFSAdditions__sendFileStatsTelemetryWithDescriptors_perItemSendTelemetryBlock___block_invoke;
    v8[3] = &unk_2650838B8;
    id v9 = v5;
    id v10 = v6;
    [v7 getDiagnosticAttributesForItems:v9 completionHandler:v8];
  }
}

void __104__BRCAccountSessionFPFS_FPFSAdditions__sendFileStatsTelemetryWithDescriptors_perItemSendTelemetryBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v21 = v6;
  if (v6)
  {
    id v7 = v6;
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      BOOL v30 = v7;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_error_impl(&dword_23FA42000, v9, (os_log_type_t)0x90u, "[ERROR] error while getting attributes for fileIDs %@: %@%@", buf, 0x20u);
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v5);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = [v14 error];

          if (v15)
          {
            double v16 = brc_bread_crumbs();
            double v17 = brc_default_log();
            if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
            {
              uint64_t v18 = [v14 fileID];
              id v19 = [v14 error];
              *(_DWORD *)buf = 134218498;
              uint64_t v28 = v18;
              __int16 v29 = 2112;
              BOOL v30 = v19;
              __int16 v31 = 2112;
              id v32 = v16;
              _os_log_error_impl(&dword_23FA42000, v17, (os_log_type_t)0x90u, "[ERROR] Error occured while getting diagnostic attributes for fileID: %llu: %@%@", buf, 0x20u);
            }
          }
          else
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          }
        }
        uint64_t v11 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
  }
}

- (void)sendNonMigratedItemTelemetryWithfileIDs:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(FPFSAdditions) sendNonMigratedItemTelemetryWithfileIDs:]();
  }

  uint64_t v18 = [(BRCAccountSessionFPFS *)self fpfsMigrationUUID];
  id v7 = [(BRCAccountSessionFPFS *)self fpfsMigrationStartTime];
  id v19 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(objc_alloc(MEMORY[0x263F05588]), "initWithFileID:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v13), "unsignedLongLongValue"));
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__BRCAccountSessionFPFS_FPFSAdditions__sendNonMigratedItemTelemetryWithfileIDs___block_invoke;
  v20[3] = &unk_2650838E0;
  id v21 = v18;
  long long v22 = self;
  id v23 = v9;
  id v24 = v7;
  id v15 = v7;
  id v16 = v9;
  id v17 = v18;
  [(BRCAccountSessionFPFS *)self sendFileStatsTelemetryWithDescriptors:v8 perItemSendTelemetryBlock:v20];
}

void __80__BRCAccountSessionFPFS_FPFSAdditions__sendNonMigratedItemTelemetryWithfileIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 diagnosticAttributes];
  id v11 = +[AppTelemetryTimeSeriesEvent newNonMigratedItemEvent:v3 foundInfo:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "fileID"));
  id v9 = [v7 objectForKeyedSubscript:v8];
  [v6 _populateNonMigratedItemEventForLocalDataWithEvent:v11 fileIDData:v9 diagnosticDescriptor:v4 migrationStart:*(void *)(a1 + 56)];

  uint64_t v10 = [*(id *)(a1 + 40) analyticsReporter];
  [v10 postReportForDefaultSubCategoryWithCategory:9 telemetryTimeEvent:v11];
}

- (void)markMigrationToFPFSCleanupComplete
{
  if ([(BRCAccountSessionFPFS *)self fpfsMigrationState] == 2)
  {
    [(BRCAccountSessionFPFS *)self setFPFSMigrationState:0];
  }
}

- (void)markMigrationToFPFSComplete
{
  if ([(BRCAccountSessionFPFS *)self fpfsMigrationState] == 1)
  {
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS(FPFSAdditions) markMigrationToFPFSComplete]();
    }

    [(BRCAccountSessionFPFS *)self setFPFSMigrationState:2];
    [(BRCPQLConnection *)self->_clientDB flush];
  }
  else
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS(FPFSAdditions) markMigrationToFPFSComplete]();
    }
  }
}

- (void)setExtensionBackChannel:(id)a3
{
}

- (BRFileProviderExtensionBackChannel)extensionBackChannel
{
  return self->_extensionBackChannel;
}

- (BRCServerChangesApplier)serverChangesApplier
{
  return self->_serverChangesApplier;
}

- (NSString)domainID
{
  return [(NSFileProviderDomain *)self->_fpDomain identifier];
}

- (id)groupContainerStagePathForCurrentPersonaFromStageType:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (groupContainerStagePathForCurrentPersonaFromStageType__once != -1) {
    dispatch_once(&groupContainerStagePathForCurrentPersonaFromStageType__once, &__block_literal_global_36);
  }
  id v4 = (id)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
  objc_sync_enter(v4);
  id v5 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  id v6 = (void *)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
  id v7 = [NSNumber numberWithShort:v3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v8 = objc_opt_new();
    id v9 = (void *)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
    uint64_t v10 = [NSNumber numberWithShort:v3];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  id v11 = [v8 objectForKeyedSubscript:v5];
  if (!v11)
  {
    if (v3
      || (objc_msgSend(NSString, "brc_groupDownloadStagePath"),
          id v14 = objc_claimAutoreleasedReturnValue(),
          (id v11 = v14) == 0))
    {
      uint64_t v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v17[0] = 67109634;
        v17[1] = v3;
        __int16 v18 = 2112;
        id v19 = v5;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_error_impl(&dword_23FA42000, v13, (os_log_type_t)0x90u, "[ERROR] Can't find group container path of type %d for current persona %@%@", (uint8_t *)v17, 0x1Cu);
      }

      id v11 = 0;
    }
    else
    {
      id v15 = objc_msgSend(v14, "br_realpath");
      [v8 setObject:v15 forKeyedSubscript:v5];
    }
  }

  objc_sync_exit(v4);
  return v11;
}

void __94__BRCAccountSessionFPFS_FPFSAdditions__groupContainerStagePathForCurrentPersonaFromStageType___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID;
  groupContainerStagePathForCurrentPersonaFromStageType__stageTypeToPathByPersonaID = v0;
}

- (id)downloadStagePathForCurrentPersona
{
  return [(BRCAccountSessionFPFS *)self groupContainerStagePathForCurrentPersonaFromStageType:0];
}

- (id)_createAppTelemetryFPFSMigrationInvestigation:(unsigned int)a3
{
  id v5 = objc_alloc_init(AppTelemetryFPFSMigrationInvestigation);
  id v6 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"availableQuota"];
  -[AppTelemetryFPFSMigrationInvestigation setAccountQuotaUsage:](v5, "setAccountQuotaUsage:", objc_msgSend(v6, "br_roundedLongLongValue"));

  id v7 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationInitialItemCountKey"];
  -[AppTelemetryFPFSMigrationInvestigation setTotalItemCount:](v5, "setTotalItemCount:", objc_msgSend(v7, "br_roundedLongLongValue"));

  [(AppTelemetryFPFSMigrationInvestigation *)v5 setIsAccountDataSeparated:[(BRCAccountSessionFPFS *)self isDataSeparated]];
  if (a3)
  {
    id v8 = [(BRCAccountSessionFPFS *)self fpfsMigrationStartTime];
    [v8 timeIntervalSinceNow];
    [(AppTelemetryFPFSMigrationInvestigation *)v5 setImportTime:-v9];

    [(AppTelemetryFPFSMigrationInvestigation *)v5 setTypesOfMigratedItemsMask:[(BRCAccountSessionFPFS *)self fpfsMigrationMigratedTypes]];
    [(AppTelemetryFPFSMigrationInvestigation *)v5 setBouncedItemsCount:[(BRCAccountSessionFPFS *)self fpfsMigrationBouncedItemCount]];
    [(AppTelemetryFPFSMigrationInvestigation *)v5 setBouncedItemsMatrix:[(BRCAccountSessionFPFS *)self fpfsMigrationBouncedMatrix]];
    [(AppTelemetryFPFSMigrationInvestigation *)v5 setItemsNotFoundInDB:[(BRCAccountSessionFPFS *)self fpfsMigrationNewItemsInDB]];
    if (a3 != 1)
    {
      uint64_t v10 = [(BRCAccountSessionFPFS *)self fpfsMigrationEndTime];
      id v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [MEMORY[0x263EFF910] now];
      }
      uint64_t v13 = v12;

      id v14 = [(BRCAccountSessionFPFS *)self fpfsMigrationStartTime];
      [v13 timeIntervalSinceDate:v14];
      -[AppTelemetryFPFSMigrationInvestigation setImportTime:](v5, "setImportTime:");

      id v15 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationLostItemCountKey"];
      -[AppTelemetryFPFSMigrationInvestigation setItemsNotMigratedCount:](v5, "setItemsNotMigratedCount:", objc_msgSend(v15, "br_roundedLongLongValue"));

      id v16 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationChildItemsLostItemCountKey"];
      -[AppTelemetryFPFSMigrationInvestigation setChildItemsNotMigratedCount:](v5, "setChildItemsNotMigratedCount:", objc_msgSend(v16, "br_roundedLongLongValue"));

      id v17 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationBusyDateLostItemCountKey"];
      -[AppTelemetryFPFSMigrationInvestigation setBusyDateNotMigratedCount:](v5, "setBusyDateNotMigratedCount:", objc_msgSend(v17, "br_roundedLongLongValue"));

      __int16 v18 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationIgnoredFromSyncLostItemCountKey"];
      -[AppTelemetryFPFSMigrationInvestigation setIgnoredFromSyncItemsNotMigratedCount:](v5, "setIgnoredFromSyncItemsNotMigratedCount:", objc_msgSend(v18, "br_roundedLongLongValue"));

      [(AppTelemetryFPFSMigrationInvestigation *)v5 setIsSuccessful:a3 == 2];
      [(AppTelemetryFPFSMigrationInvestigation *)v5 setTypesOfNonMigratedItemsMask:[(BRCAccountSessionFPFS *)self fpfsMigrationNonMigratedTypes]];
    }
  }
  return v5;
}

- (void)_sendFPFSImportStartTelemetryEvent
{
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportStartTelemetryEvent]();
  }

  id v5 = [(BRCAccountSessionFPFS *)self fpfsMigrationUUID];
  id v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:400 UUID:v5 value:1];
  id v7 = [(BRCAccountSessionFPFS *)self _createAppTelemetryFPFSMigrationInvestigation:0];
  id v8 = [v6 investigation];
  [v8 setFpfsMigrationInvestigation:v7];

  double v9 = [(BRCAccountSessionFPFS *)self analyticsReporter];
  [v9 postReportForDefaultSubCategoryWithCategory:4 telemetryTimeEvent:v6];
}

- (void)_reportForFPFSImportStatusTelemetryEventIfNeeded:(unsigned int)a3 completionHandler:(id)a4
{
  id v4 = a4;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__29;
  v6[4] = __Block_byref_object_dispose__29;
  id v7 = objc_alloc_init(BRCFPImportReport);
  id v5 = v4;
  BRPerformWithPersonaAndError();

  _Block_object_dispose(v6, 8);
}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_cold_1(a1);
    }
  }
  else
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F325C0], "br_getProviderDomainIDForCurrentPersona");
    id v5 = [MEMORY[0x263F05448] sharedConnectionProxy];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_106;
    v8[3] = &unk_265083908;
    int v10 = *(_DWORD *)(a1 + 56);
    long long v7 = *(_OWORD *)(a1 + 40);
    id v6 = (id)v7;
    long long v9 = v7;
    [v5 importProgressForDomainWithID:v3 completionHandler:v8];

    id v4 = v9;
  }
}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_msgSend(v7, "fp_prettyDescription");
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = v15;
      __int16 v36 = 2112;
      __int16 v37 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed querying the import status: %@%@", buf, 0x16u);
    }
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F32360];
    id v8 = objc_msgSend(v7, "fp_prettyDescription");
    objc_msgSend(v16, "br_errorWithDomain:code:userInfo:description:", v17, 94, &unk_26F3DDCA0, @"importProgressForDomainWithID failed: %@", v8, v28);
    __int16 v18 = LABEL_19:;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setImportError:v18];

    goto LABEL_28;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setFpReport:v5];
  if (![v5 status])
  {
    if (*(_DWORD *)(a1 + 48) == 2)
    {
      id v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v19;
        _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Migration might be stuck in MigrationNeedsClean status - send telemtry error!%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x263F32360], 95, &unk_26F3DDCC8, @"Migration might be stuck in MigrationNeedsClean status and FP migration status is <%ld>", objc_msgSend(v5, "status"));
    }
    else
    {
      id v21 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v21;
        _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] There's no import ongoing in fp - send telemtry error!%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x263F32360], 96, &unk_26F3DDCF0, @"Bird assuming BRMigrationInProgress but FP migration status is <%ld>", objc_msgSend(v5, "status"));
    id v8 = };
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setImportError:v8];
LABEL_28:

    goto LABEL_29;
  }
  if (([v5 status] == 2 || objc_msgSend(v5, "status") == 1) && objc_msgSend(v5, "numberOfItemsInError"))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = [v5 errorDetails];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v29 + 1) + 8 * i) retryCount] >= 4)
          {
            id v23 = brc_bread_crumbs();
            id v24 = brc_default_log();
            if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
              __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_106_cold_1();
            }

            long long v25 = (void *)MEMORY[0x263F087E8];
            uint64_t v26 = *MEMORY[0x263F32360];
            uint64_t v27 = [v5 numberOfItemsInError];
            id v8 = [v5 errorDetails];
            objc_msgSend(v25, "br_errorWithDomain:code:userInfo:description:", v26, 97, &unk_26F3DDD18, @"FP has %ld items in error: <%@>", v27, v8);
            goto LABEL_19;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    goto LABEL_28;
  }
LABEL_29:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_getAndUpdateDaysSinceLastMigrationProgress:(int64_t)a3 itemsNotMigrated:(int64_t)a4 reconciledItems:(int64_t)a5
{
  uint64_t v9 = [(BRCAccountSessionFPFS *)self clientDB];
  [v9 assertOnQueue];

  uint64_t v10 = [(BRCAccountSessionFPFS *)self clientState];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"kBRCFPFSMigrationStatusLastItemsNotMigratedKey"];

  id v12 = [(BRCAccountSessionFPFS *)self clientState];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"kBRCFPFSMigrationStatusLastReconciledItemsKey"];

  id v14 = [(BRCAccountSessionFPFS *)self clientState];
  id v15 = [v14 objectForKeyedSubscript:@"kBRCFPFSMigrationStatusMigrationStatsTakenAtKey"];

  id v16 = +[BRCUserDefaults defaultsForMangledID:0];
  if (!v15)
  {
    __int16 v18 = [(BRCAccountSessionFPFS *)self clientState];
    [v18 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"kBRCFPFSMigrationStatusTTRTriggeredKey"];

LABEL_7:
    id v19 = [NSNumber numberWithLongLong:a3];
    __int16 v20 = [(BRCAccountSessionFPFS *)self clientState];
    [v20 setObject:v19 forKeyedSubscript:@"kBRCFPFSMigrationStatusMigrationStatsTakenAtKey"];

    id v21 = [NSNumber numberWithLongLong:a4];
    uint64_t v22 = [(BRCAccountSessionFPFS *)self clientState];
    [v22 setObject:v21 forKeyedSubscript:@"kBRCFPFSMigrationStatusLastItemsNotMigratedKey"];

    id v23 = [NSNumber numberWithLongLong:a5];
    id v24 = [(BRCAccountSessionFPFS *)self clientState];
    [v24 setObject:v23 forKeyedSubscript:@"kBRCFPFSMigrationStatusLastReconciledItemsKey"];

    long long v25 = [(BRCAccountSessionFPFS *)self clientDB];
    [v25 forceBatchStart];

    int64_t v17 = 0;
    goto LABEL_8;
  }
  if ([v11 longLongValue] != a4
    || [v16 fpfsStuckMigrationTakeReconciledItemsIntoAccount]
    && [v13 longLongValue] != a5)
  {
    goto LABEL_7;
  }
  int64_t v17 = a3 - [v15 longLongValue];
LABEL_8:

  return v17;
}

- (BOOL)_shouldTriggerTapToRadar:(int64_t)a3 daysSinceLastMigrationProgress:(int64_t)a4
{
  if (!a4 || [(BRCAccountSessionFPFS *)self fpfsMigrationStatusTTRTriggered]) {
    return 0;
  }
  id v6 = +[BRCUserDefaults defaultsForMangledID:0];
  BOOL v5 = [v6 fpfsImportStatusTelemetryStuckMigrationDaysThreshold] <= a3;

  return v5;
}

- (id)_createRecoveryExecutedErrorForImportError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  BOOL v5 = (void *)MEMORY[0x263F087E8];
  if (v3)
  {
    id v6 = [v3 domain];
    uint64_t v7 = -[v4 code];
    id v8 = [v4 userInfo];
    uint64_t v9 = [v5 errorWithDomain:v6 code:v7 userInfo:v8];
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 131, @"FPFS Migration Recovery Initiated");
  }

  return v9;
}

- (id)_triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted:(int64_t)a3 daysSinceLastMigrationProgress:(int64_t)a4 importError:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = [(BRCAccountSessionFPFS *)self clientDB];
  [v9 assertOnQueue];

  uint64_t v10 = [(BRCAccountSessionFPFS *)self clientState];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"kBRCFPFSMigrationRecoveryWasInvokedAtKey"];

  if (v11)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v32 = (int64_t)v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Recovery was already invoked once, ignoring%@", buf, 0xCu);
    }

    id v14 = [(BRCAccountSessionFPFS *)self _createRecoveryExecutedErrorForImportError:v8];
    goto LABEL_16;
  }
  if ([MEMORY[0x263F32628] isRunningOnMacOS]
    && (([MEMORY[0x263F32628] isSeedBuild] & 1) != 0
     || ([MEMORY[0x263F32628] isInternalBuild] & 1) != 0))
  {
    int64_t v15 = [(BRCAccountSessionFPFS *)self lastBootHistoryTime];
    time_t v16 = time(0);
    int64_t v17 = +[BRCUserDefaults defaultsForMangledID:0];
    __int16 v18 = v17;
    uint64_t v19 = (v16 - v15) / 86400;
    if (v15 && v19 >= [v17 fpfsStuckMigrationRecoveryDaysSinceUpgradeThreshold])
    {
      if ([v18 fpfsStuckMigrationRecoveryDaysSinceImportStartedThreshold] <= a3)
      {
        if ([v18 fpfsStuckMigrationRecoveryDaysWithoutProgressThreshold] <= a4)
        {
          uint64_t v26 = brc_bread_crumbs();
          uint64_t v27 = brc_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            int64_t v32 = a4;
            __int16 v33 = 2112;
            id v34 = v26;
            _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Migration progress is stuck for %lld days, invoking recovery flow...%@", buf, 0x16u);
          }

          objc_initWeak((id *)buf, self);
          uint64_t v28 = [(BRCAccountSessionFPFS *)self clientTruthWorkloop];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke;
          block[3] = &unk_26507ED20;
          objc_copyWeak(&v30, (id *)buf);
          dispatch_async(v28, block);

          id v22 = [(BRCAccountSessionFPFS *)self _createRecoveryExecutedErrorForImportError:v8];
          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
          goto LABEL_14;
        }
        id v24 = brc_bread_crumbs();
        long long v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          int64_t v32 = a4;
          __int16 v33 = 2112;
          id v34 = v24;
          _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEFAULT, "[NOTICE] Days import is stuck (%lld) are less then threshold%@", buf, 0x16u);
        }

LABEL_13:
        id v22 = v8;
LABEL_14:

        goto LABEL_17;
      }
      __int16 v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        int64_t v32 = a3;
        __int16 v33 = 2112;
        id v34 = v20;
        _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] Days since import started (%lld) are less then threshold%@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        int64_t v32 = v19;
        __int16 v33 = 2112;
        id v34 = v20;
        _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] Days since last boot history (%ld) are less then threshold%@", buf, 0x16u);
      }
    }

    goto LABEL_13;
  }
  id v14 = v8;
LABEL_16:
  id v22 = v14;
LABEL_17:

  return v22;
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F053F0];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2;
  v2[3] = &unk_26507EAC0;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  +[BRCImportUtil reimportItemsBelowItemWithIdentifier:v1 completionHandler:v2];
  objc_destroyWeak(&v3);
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
      __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2_cold_1();
    }
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v5 = [WeakRetained clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_151;
    block[3] = &unk_26507ED70;
    void block[4] = v4;
    dispatch_async(v5, block);
LABEL_6:
  }
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_151(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF910] now];
  id v3 = [*(id *)(a1 + 32) clientState];
  [v3 setObject:v2 forKeyedSubscript:@"kBRCFPFSMigrationRecoveryWasInvokedAtKey"];

  id v4 = [*(id *)(a1 + 32) clientDB];
  [v4 forceBatchStart];
}

- (void)_populateFPFSImportStatusTelemetryEventForEvent:(id)a3 withFPImportReport:(id)a4 itemsNotMigrated:(int64_t)a5
{
  id v89 = a3;
  id v8 = a4;
  uint64_t v9 = [v89 investigation];
  int v10 = [v9 hasFpfsMigrationInvestigation];

  if (v10)
  {
    uint64_t v11 = [NSNumber numberWithLongLong:a5];
    uint64_t v12 = objc_msgSend(v11, "br_roundedLongLongValue");
    uint64_t v13 = [v89 investigation];
    id v14 = [v13 fpfsMigrationInvestigation];
    [v14 setItemsNotMigratedCount:v12];

    int64_t v15 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStatusLastItemsNotMigratedKey"];
    time_t v16 = v15;
    if (v15) {
      uint64_t v17 = [v15 longLongValue] - a5;
    }
    else {
      uint64_t v17 = -1;
    }
    __int16 v18 = [NSNumber numberWithLongLong:v17];
    uint64_t v19 = objc_msgSend(v18, "br_roundedLongLongValue");
    __int16 v20 = [v89 investigation];
    id v21 = [v20 fpfsMigrationInvestigation];
    [v21 setItemsNotMigratedDelta:v19];

    id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "numberOfItemsReconciled"));
    uint64_t v23 = objc_msgSend(v22, "br_roundedLongLongValue");
    id v24 = [v89 investigation];
    long long v25 = [v24 fpfsMigrationInvestigation];
    [v25 setItemsReconciledInFileProvider:v23];

    uint64_t v26 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStatusLastReconciledItemsKey"];
    if (v26)
    {
      uint64_t v27 = [v8 numberOfItemsReconciled];
      uint64_t v28 = v27 - [v26 longLongValue];
    }
    else
    {
      uint64_t v28 = -1;
    }
    long long v29 = [NSNumber numberWithLongLong:v28];
    uint64_t v30 = objc_msgSend(v29, "br_roundedLongLongValue");
    long long v31 = [v89 investigation];
    int64_t v32 = [v31 fpfsMigrationInvestigation];
    [v32 setItemsReconciledInFileProviderDelta:v30];

    __int16 v33 = NSNumber;
    double v34 = (double)[v8 dbCreationTimestamp];
    uint64_t v35 = [(BRCAccountSessionFPFS *)self fpfsMigrationStartTime];
    [v35 timeIntervalSince1970];
    __int16 v37 = [v33 numberWithDouble:v34 - v36];
    uint64_t v38 = objc_msgSend(v37, "br_roundedLongLongValue");
    __int16 v39 = [v89 investigation];
    uint64_t v40 = [v39 fpfsMigrationInvestigation];
    [v40 setDurationBetweenDbCreationAndMigrationStart:v38];

    uint64_t v41 = [v8 isStreamResetRunning];
    long long v42 = [v89 investigation];
    long long v43 = [v42 fpfsMigrationInvestigation];
    [v43 setIsStreamResetRunning:v41];

    uint64_t v44 = [v8 stateOfDownloadJobs];
    uint64_t v45 = [v89 investigation];
    id v46 = [v45 fpfsMigrationInvestigation];
    [v46 setStateOfDownloadJobs:v44];

    uint64_t v47 = [v8 stateOfUploadJobs];
    id v48 = [v89 investigation];
    __int16 v49 = [v48 fpfsMigrationInvestigation];
    [v49 setStateOfUploadJobs:v47];

    uint64_t v50 = [v8 stateOfOtherJobs];
    uint64_t v51 = [v89 investigation];
    uint64_t v52 = [v51 fpfsMigrationInvestigation];
    [v52 setStateOfOtherJobs:v50];

    uint64_t v53 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingReconciliation"));
    uint64_t v54 = objc_msgSend(v53, "br_roundedLongLongValue");
    long long v55 = [v89 investigation];
    id v56 = [v55 fpfsMigrationInvestigation];
    [v56 setNumberOfItemsPendingReconciliation:v54];

    id v57 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingSelection"));
    uint64_t v58 = objc_msgSend(v57, "br_roundedLongLongValue");
    uint64_t v59 = [v89 investigation];
    char v60 = [v59 fpfsMigrationInvestigation];
    [v60 setNumberOfItemsPendingSelection:v58];

    id v61 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingScanningDisk"));
    uint64_t v62 = objc_msgSend(v61, "br_roundedLongLongValue");
    id v63 = [v89 investigation];
    uint64_t v64 = [v63 fpfsMigrationInvestigation];
    [v64 setNumberOfItemsPendingScanningDisk:v62];

    uint64_t v65 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "numberOfItemsPendingScanningProvider"));
    uint64_t v66 = objc_msgSend(v65, "br_roundedLongLongValue");
    id v67 = [v89 investigation];
    __int16 v68 = [v67 fpfsMigrationInvestigation];
    [v68 setNumberOfItemsPendingScanningProvider:v66];

    uint64_t v69 = [v8 xpcActivityRegisteredWithDuet];
    uint64_t v70 = [v89 investigation];
    v71 = [v70 fpfsMigrationInvestigation];
    [v71 setXpcActivityRegisteredWithDuet:v69];

    uint64_t v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "xpcActivityTimeSinceLastRegistration"));
    uint64_t v73 = objc_msgSend(v72, "br_roundedLongLongValue");
    v74 = [v89 investigation];
    v75 = [v74 fpfsMigrationInvestigation];
    [v75 setXpcActivityTimeSinceLastRegistration:v73];

    uint64_t v76 = [v8 xpcActivityIsActive];
    uint64_t v77 = [v89 investigation];
    id v78 = [v77 fpfsMigrationInvestigation];
    [v78 setXpcActivityIsActive:v76];

    id v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "xpcActivityTimeSinceLastActivation"));
    uint64_t v80 = objc_msgSend(v79, "br_roundedLongLongValue");
    v81 = [v89 investigation];
    v82 = [v81 fpfsMigrationInvestigation];
    [v82 setXpcActivityTimeSinceLastActivation:v80];

    uint64_t v83 = [v8 xpcActivityTimeSinceLastAbleToRun];
    v84 = [v89 investigation];
    uint64_t v85 = [v84 fpfsMigrationInvestigation];
    [v85 setXpcActivityTimeSinceLastAbleToRun:v83];

    uint64_t v86 = [v8 xpcActivityDasdContext];
    id v87 = [v89 investigation];
    id v88 = [v87 fpfsMigrationInvestigation];
    [v88 setXpcActivityDasdContext:v86];
  }
}

- (void)_sendTelemetryEventWithDiagnosticAttributes:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v9 = +[AppTelemetryTimeSeriesEvent itemStatsInvestigationWithFoundInfo:a3];
  uint64_t v7 = [v6 investigation];
  [v7 setItemStatsInvestigation:v9];

  id v8 = [(BRCAccountSessionFPFS *)self analyticsReporter];
  [v8 postReportForDefaultSubCategoryWithCategory:10 telemetryTimeEvent:v6];
}

- (void)_sendItemsPendingReconciliation:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_alloc_init(AppTelemetryStuckStatus);
  -[AppTelemetryStuckStatus setItemPendingReconciliationIsLocked:](v11, "setItemPendingReconciliationIsLocked:", [v7 itemPendingReconciliationIsLocked]);
  -[AppTelemetryStuckStatus setItemPendingReconciliationIsLockedInDB:](v11, "setItemPendingReconciliationIsLockedInDB:", [v7 itemPendingReconciliationIsLockedInDB]);
  -[AppTelemetryStuckStatus setItemPendingReconciliationJobCode:](v11, "setItemPendingReconciliationJobCode:", [v7 itemPendingReconciliationJobCode]);
  -[AppTelemetryStuckStatus setItemPendingReconciliationJobSchedulingState:](v11, "setItemPendingReconciliationJobSchedulingState:", [v7 itemPendingReconciliationJobSchedulingState]);
  -[AppTelemetryStuckStatus setItemPendingReconciliationJobBlockingCode:](v11, "setItemPendingReconciliationJobBlockingCode:", [v7 itemPendingReconciliationJobBlockingCode]);
  id v8 = [v6 investigation];
  [v8 setStuckStatus:v11];

  id v9 = [v7 diagnosticAttributes];

  int v10 = [v9 diagnosticAttributes];
  [(BRCAccountSessionFPFS *)self _sendTelemetryEventWithDiagnosticAttributes:v10 event:v6];
}

- (void)_sendItemsPendingScanningDisk:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v20 = objc_alloc_init(AppTelemetryStuckStatus);
  -[AppTelemetryStuckStatus setItemPendingScanningDiskEnumerationStatus:](v20, "setItemPendingScanningDiskEnumerationStatus:", [v7 itemPendingScanningDiskEnumerationStatus]);
  -[AppTelemetryStuckStatus setItemPendingScanningDiskHasMultiplePagesEnumeration:](v20, "setItemPendingScanningDiskHasMultiplePagesEnumeration:", [v7 itemPendingScanningDiskHasMultiplePagesEnumeration]);
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingReconciliation"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:", objc_msgSend(v8, "br_roundedLongLongValue"));

  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:](v20, "setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:", objc_msgSend(v9, "br_roundedLongLongValue"));

  int v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:", objc_msgSend(v10, "br_roundedLongLongValue"));

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:", objc_msgSend(v11, "br_roundedLongLongValue"));

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:", objc_msgSend(v12, "br_roundedLongLongValue"));

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncUp"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:", objc_msgSend(v13, "br_roundedLongLongValue"));

  id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:", objc_msgSend(v14, "br_roundedLongLongValue"));

  int64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingSyncDown"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:", objc_msgSend(v15, "br_roundedLongLongValue"));

  time_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningDiskNumberOfChildrenPendingRejection"));
  -[AppTelemetryStuckStatus setItemPendingScanningDiskNumberOfChildrenPendingRejection:](v20, "setItemPendingScanningDiskNumberOfChildrenPendingRejection:", objc_msgSend(v16, "br_roundedLongLongValue"));

  uint64_t v17 = [v6 investigation];
  [v17 setStuckStatus:v20];

  __int16 v18 = [v7 diagnosticAttributes];

  uint64_t v19 = [v18 diagnosticAttributes];
  [(BRCAccountSessionFPFS *)self _sendTelemetryEventWithDiagnosticAttributes:v19 event:v6];
}

- (void)_sendItemsPendingScanningProvider:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v14 = objc_alloc_init(AppTelemetryStuckStatus);
  -[AppTelemetryStuckStatus setItemPendingScanningProviderEnumerationStatus:](v14, "setItemPendingScanningProviderEnumerationStatus:", [v7 itemPendingScanningProviderEnumerationStatus]);
  -[AppTelemetryStuckStatus setItemPendingScanningProviderHasMultiplePagesEnumeration:](v14, "setItemPendingScanningProviderHasMultiplePagesEnumeration:", [v7 itemPendingScanningProviderHasMultiplePagesEnumeration]);
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningProviderNumberOfChildren"));
  -[AppTelemetryStuckStatus setItemPendingScanningProviderNumberOfChildren:](v14, "setItemPendingScanningProviderNumberOfChildren:", objc_msgSend(v8, "br_roundedLongLongValue"));

  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningProviderNumberOfChildrenPendingCreation"));
  -[AppTelemetryStuckStatus setItemPendingScanningProviderNumberOfChildrenPendingCreation:](v14, "setItemPendingScanningProviderNumberOfChildrenPendingCreation:", objc_msgSend(v9, "br_roundedLongLongValue"));

  int v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "itemPendingScanningProviderNumberOfChildrenFailingCreation"));
  -[AppTelemetryStuckStatus setItemPendingScanningProviderNumberOfChildrenFailingCreation:](v14, "setItemPendingScanningProviderNumberOfChildrenFailingCreation:", objc_msgSend(v10, "br_roundedLongLongValue"));

  -[AppTelemetryStuckStatus setItemPendingScanningProviderRemovalOfDatalessBitStatus:](v14, "setItemPendingScanningProviderRemovalOfDatalessBitStatus:", [v7 itemPendingScanningProviderRemovalOfDatalessBitStatus]);
  uint64_t v11 = [v6 investigation];
  [v11 setStuckStatus:v14];

  uint64_t v12 = [v7 diagnosticAttributes];

  uint64_t v13 = [v12 diagnosticAttributes];
  [(BRCAccountSessionFPFS *)self _sendTelemetryEventWithDiagnosticAttributes:v13 event:v6];
}

- (void)_sendTelemetryEventForPendingItemsWithFPReport:(id)a3 migrationUUID:(id)a4 daysSinceImportStarted:(int64_t)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = [v25 itemsPendingReconciliation];
  unint64_t v10 = [v9 count];

  uint64_t v11 = [v25 itemsPendingScanningDisk];
  unint64_t v12 = [v11 count];

  uint64_t v13 = [v25 itemsPendingScanningProvider];
  unint64_t v14 = [v13 count];

  int64_t v15 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v16 = [v15 migrationStatusPendingItemsTelemetryLimit];

  id v24 = v8;
  id v17 = +[AppTelemetryTimeSeriesEvent newLongEvent:404 UUID:v8 value:a5];
  for (int i = 0; i != 3; ++i)
  {
    if (v16)
    {
      for (unint64_t j = 0; v16 != j; ++j)
      {
        if (i || j >= v10)
        {
          if (i == 1 && j < v12)
          {
            id v22 = [v25 itemsPendingScanningDisk];
            id v21 = [v22 objectAtIndexedSubscript:j];

            [(BRCAccountSessionFPFS *)self _sendItemsPendingScanningDisk:v21 event:v17];
          }
          else
          {
            if (i != 2 || j >= v14) {
              break;
            }
            uint64_t v23 = [v25 itemsPendingScanningProvider];
            id v21 = [v23 objectAtIndexedSubscript:j];

            [(BRCAccountSessionFPFS *)self _sendItemsPendingScanningProvider:v21 event:v17];
          }
        }
        else
        {
          __int16 v20 = [v25 itemsPendingReconciliation];
          id v21 = [v20 objectAtIndexedSubscript:j];

          [(BRCAccountSessionFPFS *)self _sendItemsPendingReconciliation:v21 event:v17];
        }
      }
    }
  }
}

- (void)_sendFPFSImportStatusTelemetryEvent
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(BRCAccountSessionFPFS *)self fpfsMigrationUUID];
  uint64_t v4 = [(BRCAccountSessionFPFS *)self fpfsMigrationState];
  if ((v4 - 3) >= 0xFFFFFFFE)
  {
    uint64_t v5 = v4;
    id v6 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    id v7 = [(BRCAccountSessionFPFS *)self fpfsMigrationStartTime];
    id v8 = [MEMORY[0x263EFF910] now];
    id v9 = [v6 components:16 fromDate:v7 toDate:v8 options:0];
    unint64_t v10 = (void *)[v9 day];

    uint64_t v11 = +[BRCUserDefaults defaultsForMangledID:0];
    unsigned int v12 = [v11 fpfsImportStatusTelemetryDaysThreshold];

    if ((uint64_t)v10 >= v12)
    {
      int64_t v15 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportStatusTelemetryEvent]();
      }

      objc_initWeak((id *)location, self);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke;
      v18[3] = &unk_265083980;
      objc_copyWeak(v21, (id *)location);
      id v17 = v3;
      v21[1] = v10;
      id v19 = v17;
      __int16 v20 = self;
      [(BRCAccountSessionFPFS *)self _reportForFPFSImportStatusTelemetryEventIfNeeded:v5 completionHandler:v18];

      objc_destroyWeak(v21);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v13 = brc_bread_crumbs();
      unint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 134218498;
        *(void *)&location[4] = v10;
        __int16 v23 = 1024;
        unsigned int v24 = v12;
        __int16 v25 = 2112;
        uint64_t v26 = v13;
        _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Not sending FPFS Import status telemetry because: Days since import started: %ld. Threshold: %d%@", location, 0x1Cu);
      }
    }
  }
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[6];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2;
    block[3] = &unk_265083958;
    id v7 = *(id *)(a1 + 32);
    v13[1] = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v11 = v8;
    id v12 = v3;
    objc_copyWeak(v13, (id *)(a1 + 48));
    dispatch_async(v6, block);
    objc_destroyWeak(v13);
  }
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v43 = +[AppTelemetryTimeSeriesEvent newLongEvent:402 UUID:*(void *)(a1 + 32) value:*(void *)(a1 + 64)];
  id v2 = [*(id *)(a1 + 40) _createAppTelemetryFPFSMigrationInvestigation:1];
  id v3 = [v43 investigation];
  [v3 setFpfsMigrationInvestigation:v2];

  uint64_t v4 = [*(id *)(a1 + 48) importError];
  char v46 = 0;
  id v5 = (id)[*(id *)(a1 + 40) fetchAccountWaitOperationWithAccountReady:&v46];
  if (!v46)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 137, @"Account is not ready");

    uint64_t v4 = (void *)v6;
  }
  uint64_t v7 = [*(id *)(a1 + 40) fpfsMigrationNonMigratedItems];
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 48) fpReport];
  [v8 _populateFPFSImportStatusTelemetryEventForEvent:v43 withFPImportReport:v9 itemsNotMigrated:v7];

  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 48) fpReport];
  [v10 _sendTelemetryEventForPendingItemsWithFPReport:v11 migrationUUID:*(void *)(a1 + 32) daysSinceImportStarted:*(void *)(a1 + 64)];

  id v12 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 64);
  unint64_t v14 = [*(id *)(a1 + 48) fpReport];
  uint64_t v15 = objc_msgSend(v12, "_getAndUpdateDaysSinceLastMigrationProgress:itemsNotMigrated:reconciledItems:", v13, v7, objc_msgSend(v14, "numberOfItemsReconciled"));

  uint64_t v16 = [*(id *)(a1 + 40) _triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted:*(void *)(a1 + 64) daysSinceLastMigrationProgress:v15 importError:v4];

  if (!v16)
  {
    long long v29 = brc_bread_crumbs();
    uint64_t v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_2((void *)(a1 + 32));
    }
    goto LABEL_10;
  }
  id v17 = brc_bread_crumbs();
  __int16 v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v48 = v19;
    __int16 v49 = 2112;
    uint64_t v50 = v16;
    __int16 v51 = 2112;
    uint64_t v52 = v17;
    _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Sending Error FPFS migration status telemetry event (%@) with error: %@%@", buf, 0x20u);
  }

  uint64_t v20 = [v16 code];
  id v21 = [v43 investigation];
  [v21 setErrorCode:v20];

  id v22 = [v16 domain];
  __int16 v23 = [v43 investigation];
  [v23 setErrorDomain:v22];

  unsigned int v24 = NSString;
  __int16 v25 = objc_msgSend(v16, "fp_prettyDescription");
  uint64_t v26 = [v24 stringWithFormat:@"%@", v25];
  uint64_t v27 = [v43 investigation];
  [v27 setErrorDescription:v26];

  uint64_t v28 = [v16 userInfo];
  long long v29 = [v28 objectForKey:@"OriginatorID"];

  if (v29)
  {
    uint64_t v30 = [v29 stringValue];
    long long v31 = [v43 investigation];
    [v31 setOperationType:v30];

LABEL_10:
  }

  int64_t v32 = [*(id *)(a1 + 40) analyticsReporter];
  [v32 postReportForDefaultSubCategoryWithCategory:6 telemetryTimeEvent:v43];

  [*(id *)(a1 + 40) _fixImportStatusErrorIfPossible:v16];
  if ((!v16 || (objc_msgSend(v16, "br_isCloudDocsErrorCode:", 96) & 1) == 0)
    && [*(id *)(a1 + 40) _shouldTriggerTapToRadar:*(void *)(a1 + 64) daysSinceLastMigrationProgress:v15])
  {
    __int16 v33 = brc_bread_crumbs();
    double v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_1();
    }

    uint64_t v35 = NSString;
    uint64_t v36 = [v43 telemetrySchema];
    if ((int)v36 > 299)
    {
      switch((int)v36)
      {
        case 500:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_NEW_WITH_EXISTING";
          break;
        case 501:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW";
          break;
        case 502:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_EXISTING";
          break;
        case 503:
          __int16 v37 = @"ITEM_BOUNCE_BY_SERVER";
          break;
        case 504:
          __int16 v37 = @"ITEM_BOUNCE_CREATE_ITEM_WITH_EXISTING";
          break;
        case 505:
          __int16 v37 = @"ITEM_BOUNCE_CHANGE_ITEM_WITH_EXISTING";
          break;
        case 506:
          __int16 v37 = @"ITEM_BOUNCE_SHARE_ACCEPT_EXISTING_WITH_NEW";
          break;
        case 507:
          __int16 v37 = @"ITEM_BOUNCE_SHARE_ACCEPT_NEW_WITH_EXISTING";
          break;
        case 508:
          __int16 v37 = @"ITEM_BOUNCE_TRASHED_ITEM";
          break;
        case 509:
          __int16 v37 = @"ITEM_BOUNCE_ITEM_DIRECTORY_MERGE";
          break;
        case 510:
          __int16 v37 = @"ITEM_BOUNCE_NEW_DIRECTORY_WITH_EXISTING";
          break;
        case 511:
          __int16 v37 = @"ITEM_BOUNCE_EXISTING_WITH_NEW_DIRECTORY";
          break;
        case 512:
          __int16 v37 = @"ITEM_BOUNCE_ITEM_WITH_DOCUMENTS_FOLDER";
          break;
        case 513:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_DEAD_EXISTING_WITH_NEW";
          break;
        case 514:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_NOT_KNOWN_BY_SERVER_WITH_NEW";
          break;
        case 515:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_LOCAL_DIFF_REPARENT_WITH_NEW";
          break;
        case 516:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_LOCAL_DIFF_FILE_NAME_WITH_NEW";
          break;
        case 517:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_INITIAL_SCAN_WITH_NEW";
          break;
        case 518:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_SHARED_ITEM_WITH_NEW_SHARED_ITEM_UNTITLED_FILE_NAME";
          break;
        case 519:
          __int16 v37 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW_UNTITLED_FILE_NAME";
          break;
        default:
          switch((int)v36)
          {
            case 400:
              __int16 v37 = @"FPFS_MIGRATION_STARTED";
              break;
            case 401:
              __int16 v37 = @"FPFS_MIGRATION_FINISHED";
              break;
            case 402:
              __int16 v37 = @"FPFS_MIGRATION_STATUS_REPORT";
              break;
            case 403:
              __int16 v37 = @"FPFS_MIGRATION_NON_MIGRATED_ITEM_REPORT";
              break;
            case 404:
              __int16 v37 = @"FPFS_MIGRATION_STUCK_STATUS";
              break;
            default:
              if (v36 == 300)
              {
                __int16 v37 = @"INITIAL_SCAN_REJECTED_MISMATCH_TYPE";
              }
              else
              {
LABEL_50:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v36);
                __int16 v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
          break;
      }
    }
    else
    {
      __int16 v37 = @"UNKNOWN";
      switch((int)v36)
      {
        case 0:
          break;
        case 1:
          __int16 v37 = @"_UNUSED_SYNC_UP_BACKOFF_RATIO";
          break;
        case 2:
          __int16 v37 = @"FOLDER_SHARING_ITEM_COUNT_MISMATCH";
          break;
        case 3:
          __int16 v37 = @"MISSING_PUSH";
          break;
        case 4:
          __int16 v37 = @"PERMANENTLY_INCONSISTENT";
          break;
        case 5:
          __int16 v37 = @"DROPPED_EVENTS";
          break;
        case 6:
          __int16 v37 = @"TEST_METRIC";
          break;
        case 7:
          __int16 v37 = @"SHARE_ALIAS_IN_SHARED_FOLDER";
          break;
        case 8:
          __int16 v37 = @"MALIGNANT_ZONE_RESET";
          break;
        case 9:
          __int16 v37 = @"BENIGN_ZONE_RESET";
          break;
        case 10:
          __int16 v37 = @"DB_RESET";
          break;
        case 11:
          __int16 v37 = @"APPLY_SCHEDULER_MISSING_JOBS";
          break;
        case 12:
          __int16 v37 = @"SYNC_UP_MISSING_JOBS";
          break;
        case 13:
          __int16 v37 = @"READER_MISSING_JOBS";
          break;
        case 14:
          __int16 v37 = @"UPLOADER_MISSING_JOBS";
          break;
        case 15:
          __int16 v37 = @"DOWNLOADER_MISSING_JOBS";
          break;
        case 16:
          __int16 v37 = @"_UNUSED_SYNC_UP_BACKOFF_DELAY";
          break;
        case 17:
          __int16 v37 = @"FOLDER_SHARING_PCS_CHAINING";
          break;
        case 18:
          __int16 v37 = @"NEW_SHARE_ACCEPTATION";
          break;
        case 19:
          __int16 v37 = @"FS_EVENT_TO_SYNC_UP";
          break;
        case 20:
          __int16 v37 = @"USER_DOWNLOAD";
          break;
        case 21:
          __int16 v37 = @"CORRUPT_PACKAGE_DOWNLOAD";
          break;
        case 22:
          __int16 v37 = @"DIRECTORY_MISSING_CHAINPCS";
          break;
        case 23:
          __int16 v37 = @"SYNC_BOOSTING_PROBLEM_COUNT";
          break;
        case 24:
          __int16 v37 = @"DEEP_SCAN";
          break;
        case 25:
          __int16 v37 = @"OPERATION_TIMED_OUT";
          break;
        case 26:
          __int16 v37 = @"MISSING_SHARE_ALIAS";
          break;
        case 27:
          __int16 v37 = @"ASSET_CONTENT_NOT_FOUND";
          break;
        case 28:
          __int16 v37 = @"QBS_DIR_FAULT_COUNT";
          break;
        case 29:
          __int16 v37 = @"FILE_BOUNCED_MANY_TIMES";
          break;
        case 30:
          __int16 v37 = @"SYNC_UP_BACKOFF_RATIO_SUMMARY";
          break;
        case 31:
          __int16 v37 = @"SYNC_UP_BACKOFF_DELAY_SUMMARY";
          break;
        case 32:
          __int16 v37 = @"QBS_PERFORMANCE";
          break;
        case 33:
          __int16 v37 = @"ACCOUNT_SESSION_OPEN_ERROR";
          break;
        case 34:
          __int16 v37 = @"CORRUPT_SHARING_OPTIONS";
          break;
        case 35:
          __int16 v37 = @"INCORRECT_CONTENT_POLICY_COUNT";
          break;
        case 36:
          __int16 v37 = @"CORRUPT_BASEHASH_SALT_COUNT";
          break;
        case 37:
          __int16 v37 = @"EDP_KEYS_MISMATCH";
          break;
        case 38:
          __int16 v37 = @"DATABASE_ID_MISMATCH";
          break;
        case 39:
          __int16 v37 = @"COLLABORATION_UPLOAD";
          break;
        case 40:
          __int16 v37 = @"DANGLING_ZOMBIE_DIRECTORY_COUNT";
          break;
        case 41:
          __int16 v37 = @"RECORD_VALUE_ERROR";
          break;
        case 42:
          __int16 v37 = @"AGGRESSIVE_SALTING";
          break;
        case 43:
          __int16 v37 = @"REIMPORT_DOMAIN_FAILED_ON_STARTUP";
          break;
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
          goto LABEL_50;
        case 100:
          __int16 v37 = @"FULLY_CONSISTENT";
          break;
        case 101:
          __int16 v37 = @"FILE_CHECKSUM_MISMATCH";
          break;
        case 102:
          __int16 v37 = @"PACKAGE_CHECKSUM_MISMATCH";
          break;
        case 103:
          __int16 v37 = @"CHILD_COUNT_MISMATCH";
          break;
        case 104:
          __int16 v37 = @"RECURSIVE_ITEM_COUNT_MISMATCH";
          break;
        case 105:
          __int16 v37 = @"SHARE_ALIAS_COUNT_MISMATCH";
          break;
        case 106:
          __int16 v37 = @"SHARE_COUNT_MISMATCH";
          break;
        case 107:
          __int16 v37 = @"CONSISTENCY_CHECKER_FAILED";
          break;
        case 108:
          __int16 v37 = @"FILE_READ_ERROR";
          break;
        default:
          switch((int)v36)
          {
            case 200:
              __int16 v37 = @"CA_TOTAL_ERROR_COUNT";
              break;
            case 201:
              __int16 v37 = @"CA_UPLOAD_ERROR_COUNT";
              break;
            case 202:
              __int16 v37 = @"CA_DOWNLOAD_ERROR_COUNT";
              break;
            case 203:
              __int16 v37 = @"CA_SYNC_UP_ITEM_ERROR_COUNT";
              break;
            case 204:
              __int16 v37 = @"CA_SYNC_UP_ZONE_ERROR_COUNT";
              break;
            case 205:
              __int16 v37 = @"CA_SYNC_DOWN_ERROR_COUNT";
              break;
            case 210:
              __int16 v37 = @"CA_UPLOAD_ERROR";
              break;
            case 211:
              __int16 v37 = @"CA_DOWNLOAD_ERROR";
              break;
            case 212:
              __int16 v37 = @"CA_SYNC_UP_ITEM_ERROR";
              break;
            case 213:
              __int16 v37 = @"CA_SYNC_UP_ZONE_ERROR";
              break;
            case 214:
              __int16 v37 = @"CA_SYNC_DOWN_ERROR";
              break;
            case 215:
              __int16 v37 = @"CA_DAMAGED_FILE_UPLOAD_ERROR";
              break;
            case 216:
              __int16 v37 = @"CA_NIL_APP_LIBRARY";
              break;
            default:
              goto LABEL_50;
          }
          break;
      }
    }
    uint64_t v38 = [v16 domain];
    __int16 v39 = [v35 stringWithFormat:@"%@ (%@: %ld)", v37, v38, objc_msgSend(v16, "code")];

    uint64_t v40 = [NSString stringWithFormat:@"FPFS Migration is running for then %ld days and might be stuck.\nError: %@", *(void *)(a1 + 64), v16];
    uint64_t v41 = *(void **)(*(void *)(a1 + 40) + 152);
    long long v42 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorStuckFPFSMigration");
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_175;
    v44[3] = &unk_26507EAC0;
    objc_copyWeak(&v45, (id *)(a1 + 56));
    [v41 requestTapToRadarWithTitle:v39 description:v40 keywords:&unk_26F3DDB50 attachments:MEMORY[0x263EFFA68] sendFullLog:1 displayReason:@"FPFS migration seem stuck" triggerRootCause:v42 completionHandler:v44];

    objc_destroyWeak(&v45);
  }
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_175(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    void block[7] = v2;
    block[8] = v3;
    id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v6 = WeakRetained[6];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_176;
      block[3] = &unk_26507ED70;
      void block[4] = v5;
      dispatch_async_and_wait(v6, block);
    }
  }
}

uint64_t __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_176(uint64_t a1)
{
  return [*(id *)(a1 + 32) fpfsMigrationStatusTTRWasTriggered];
}

- (void)triggerFPFSImportFinishedTelemetryEventIfNeeded
{
  if ([(BRCAccountSessionFPFS *)self isMigratingToFPFS])
  {
    unsigned int v3 = [(BRCAccountSessionFPFS *)self fpfsMigrationState];
    if (v3 == 1)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __87__BRCAccountSessionFPFS_FPFSAdditions__triggerFPFSImportFinishedTelemetryEventIfNeeded__block_invoke;
      v6[3] = &unk_2650839A8;
      v6[4] = self;
      [(BRCAccountSessionFPFS *)self _reportForFPFSImportStatusTelemetryEventIfNeeded:1 completionHandler:v6];
    }
    else if (!v3)
    {
      [(BRCAccountSessionFPFS *)self _triggerFPFSImportFinishedTelemetryEvent];
    }
  }
  else
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS(FPFSAdditions) triggerFPFSImportFinishedTelemetryEventIfNeeded]();
    }
  }
}

void __87__BRCAccountSessionFPFS_FPFSAdditions__triggerFPFSImportFinishedTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 importError];
  [v2 _fixImportStatusErrorIfPossible:v3];
}

- (void)_fixImportStatusErrorIfPossible:(id)a3
{
  if (objc_msgSend(a3, "br_isCloudDocsErrorCode:", 96))
  {
    clientTruthWorkloop = self->_clientTruthWorkloop;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__BRCAccountSessionFPFS_FPFSAdditions___fixImportStatusErrorIfPossible___block_invoke;
    block[3] = &unk_26507ED70;
    void block[4] = self;
    dispatch_async(clientTruthWorkloop, block);
  }
}

uint64_t __72__BRCAccountSessionFPFS_FPFSAdditions___fixImportStatusErrorIfPossible___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Seems that we missed the notification about migration complete. Completing it now.%@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) markMigrationToFPFSComplete];
}

- (void)_triggerFPFSImportFinishedTelemetryEvent
{
}

void __80__BRCAccountSessionFPFS_FPFSAdditions___triggerFPFSImportFinishedTelemetryEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_cold_1(a1);
    }
  }
  else
  {
    id v3 = objc_msgSend(MEMORY[0x263F325C0], "br_getProviderDomainIDForCurrentPersona");
    int v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __80__BRCAccountSessionFPFS_FPFSAdditions___triggerFPFSImportFinishedTelemetryEvent__block_invoke_cold_1();
    }

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:@"kBRCFPFSMigrationLostItemCountKey"];
    uint64_t v8 = objc_msgSend(v7, "br_roundedLongLongValue");

    uint64_t v4 = [*(id *)(a1 + 32) fpfsMigrationUUID];
    if (v8)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x263F32360], 90, MEMORY[0x263EFFA78], @"Found approximately %llu items that were not migrated by FP", v8);
    }
    [*(id *)(a1 + 32) _sendFPFSImportFinishedTelemetryEvent:v8];
  }
}

- (void)_sendFPFSImportFinishedTelemetryEvent:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(BRCAccountSessionFPFS *)self fpfsMigrationUUID];
  id v6 = +[AppTelemetryTimeSeriesEvent newIntEvent:401 UUID:v5 value:v4 == 0];
  if (!v4)
  {
    __int16 v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    uint64_t v21 = 2;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportFinishedTelemetryEvent:].cold.4();
    }
    goto LABEL_8;
  }
  uint64_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v40 = v5;
    __int16 v41 = 2112;
    id v42 = v4;
    __int16 v43 = 2112;
    uint64_t v44 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Sending Error FPFS migration finished telemetry event (%@) with error: %@%@", buf, 0x20u);
  }

  uint64_t v9 = [v4 code];
  id v10 = [v6 investigation];
  [v10 setErrorCode:v9];

  uint64_t v11 = [v4 domain];
  id v12 = [v6 investigation];
  [v12 setErrorDomain:v11];

  uint64_t v13 = NSString;
  unint64_t v14 = objc_msgSend(v4, "fp_prettyDescription");
  uint64_t v15 = [v13 stringWithFormat:@"%@", v14];
  uint64_t v16 = [v6 investigation];
  [v16 setErrorDescription:v15];

  id v17 = [v4 userInfo];
  __int16 v18 = [v17 objectForKey:@"OriginatorID"];

  if (v18)
  {
    uint64_t v19 = [v18 stringValue];
    uint64_t v20 = [v6 investigation];
    [v20 setOperationType:v19];

    uint64_t v21 = 3;
LABEL_8:

    goto LABEL_10;
  }
  uint64_t v21 = 3;
LABEL_10:

  id v22 = [(BRCAccountSessionFPFS *)self _createAppTelemetryFPFSMigrationInvestigation:v21];
  __int16 v23 = [v6 investigation];
  [v23 setFpfsMigrationInvestigation:v22];

  unsigned int v24 = brc_bread_crumbs();
  __int16 v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    [(BRCAccountSessionFPFS(FPFSAdditions) *)v6 _sendFPFSImportFinishedTelemetryEvent:v25];
  }

  uint64_t v26 = [(BRCAccountSessionFPFS *)self analyticsReporter];
  [v26 postReportForDefaultSubCategoryWithCategory:5 telemetryTimeEvent:v6];

  if (v4)
  {
    uint64_t v27 = +[BRCUserDefaults defaultsForMangledID:0];
    if ([v27 testDevice])
    {
      uint64_t v28 = brc_bread_crumbs();
      long long v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportFinishedTelemetryEvent:]();
      }
    }
    else
    {
      uint64_t v30 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      [v30 captureLogsForOperationType:@"FPFSMigration" ofSubtype:@"MigrationFailure" forError:v4];

      long long v31 = [v27 sendTapToRadarForMigrationErrors];
      int64_t v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
      int v33 = [v31 containsObject:v32];

      if (v33)
      {
        double v34 = NSString;
        uint64_t v35 = [v6 telemetrySchema];
        if ((int)v35 > 299)
        {
          switch((int)v35)
          {
            case 500:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_NEW_WITH_EXISTING";
              break;
            case 501:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW";
              break;
            case 502:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_EXISTING";
              break;
            case 503:
              uint64_t v36 = @"ITEM_BOUNCE_BY_SERVER";
              break;
            case 504:
              uint64_t v36 = @"ITEM_BOUNCE_CREATE_ITEM_WITH_EXISTING";
              break;
            case 505:
              uint64_t v36 = @"ITEM_BOUNCE_CHANGE_ITEM_WITH_EXISTING";
              break;
            case 506:
              uint64_t v36 = @"ITEM_BOUNCE_SHARE_ACCEPT_EXISTING_WITH_NEW";
              break;
            case 507:
              uint64_t v36 = @"ITEM_BOUNCE_SHARE_ACCEPT_NEW_WITH_EXISTING";
              break;
            case 508:
              uint64_t v36 = @"ITEM_BOUNCE_TRASHED_ITEM";
              break;
            case 509:
              uint64_t v36 = @"ITEM_BOUNCE_ITEM_DIRECTORY_MERGE";
              break;
            case 510:
              uint64_t v36 = @"ITEM_BOUNCE_NEW_DIRECTORY_WITH_EXISTING";
              break;
            case 511:
              uint64_t v36 = @"ITEM_BOUNCE_EXISTING_WITH_NEW_DIRECTORY";
              break;
            case 512:
              uint64_t v36 = @"ITEM_BOUNCE_ITEM_WITH_DOCUMENTS_FOLDER";
              break;
            case 513:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_DEAD_EXISTING_WITH_NEW";
              break;
            case 514:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_NOT_KNOWN_BY_SERVER_WITH_NEW";
              break;
            case 515:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_LOCAL_DIFF_REPARENT_WITH_NEW";
              break;
            case 516:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_LOCAL_DIFF_FILE_NAME_WITH_NEW";
              break;
            case 517:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_INITIAL_SCAN_WITH_NEW";
              break;
            case 518:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_SHARED_ITEM_WITH_NEW_SHARED_ITEM_UNTITLED_FILE_NAME";
              break;
            case 519:
              uint64_t v36 = @"ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW_UNTITLED_FILE_NAME";
              break;
            default:
              switch((int)v35)
              {
                case 400:
                  uint64_t v36 = @"FPFS_MIGRATION_STARTED";
                  break;
                case 401:
                  uint64_t v36 = @"FPFS_MIGRATION_FINISHED";
                  break;
                case 402:
                  uint64_t v36 = @"FPFS_MIGRATION_STATUS_REPORT";
                  break;
                case 403:
                  uint64_t v36 = @"FPFS_MIGRATION_NON_MIGRATED_ITEM_REPORT";
                  break;
                case 404:
                  uint64_t v36 = @"FPFS_MIGRATION_STUCK_STATUS";
                  break;
                default:
                  if (v35 == 300)
                  {
                    uint64_t v36 = @"INITIAL_SCAN_REJECTED_MISMATCH_TYPE";
                  }
                  else
                  {
LABEL_53:
                    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
                    uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          uint64_t v36 = @"UNKNOWN";
          switch((int)v35)
          {
            case 0:
              break;
            case 1:
              uint64_t v36 = @"_UNUSED_SYNC_UP_BACKOFF_RATIO";
              break;
            case 2:
              uint64_t v36 = @"FOLDER_SHARING_ITEM_COUNT_MISMATCH";
              break;
            case 3:
              uint64_t v36 = @"MISSING_PUSH";
              break;
            case 4:
              uint64_t v36 = @"PERMANENTLY_INCONSISTENT";
              break;
            case 5:
              uint64_t v36 = @"DROPPED_EVENTS";
              break;
            case 6:
              uint64_t v36 = @"TEST_METRIC";
              break;
            case 7:
              uint64_t v36 = @"SHARE_ALIAS_IN_SHARED_FOLDER";
              break;
            case 8:
              uint64_t v36 = @"MALIGNANT_ZONE_RESET";
              break;
            case 9:
              uint64_t v36 = @"BENIGN_ZONE_RESET";
              break;
            case 10:
              uint64_t v36 = @"DB_RESET";
              break;
            case 11:
              uint64_t v36 = @"APPLY_SCHEDULER_MISSING_JOBS";
              break;
            case 12:
              uint64_t v36 = @"SYNC_UP_MISSING_JOBS";
              break;
            case 13:
              uint64_t v36 = @"READER_MISSING_JOBS";
              break;
            case 14:
              uint64_t v36 = @"UPLOADER_MISSING_JOBS";
              break;
            case 15:
              uint64_t v36 = @"DOWNLOADER_MISSING_JOBS";
              break;
            case 16:
              uint64_t v36 = @"_UNUSED_SYNC_UP_BACKOFF_DELAY";
              break;
            case 17:
              uint64_t v36 = @"FOLDER_SHARING_PCS_CHAINING";
              break;
            case 18:
              uint64_t v36 = @"NEW_SHARE_ACCEPTATION";
              break;
            case 19:
              uint64_t v36 = @"FS_EVENT_TO_SYNC_UP";
              break;
            case 20:
              uint64_t v36 = @"USER_DOWNLOAD";
              break;
            case 21:
              uint64_t v36 = @"CORRUPT_PACKAGE_DOWNLOAD";
              break;
            case 22:
              uint64_t v36 = @"DIRECTORY_MISSING_CHAINPCS";
              break;
            case 23:
              uint64_t v36 = @"SYNC_BOOSTING_PROBLEM_COUNT";
              break;
            case 24:
              uint64_t v36 = @"DEEP_SCAN";
              break;
            case 25:
              uint64_t v36 = @"OPERATION_TIMED_OUT";
              break;
            case 26:
              uint64_t v36 = @"MISSING_SHARE_ALIAS";
              break;
            case 27:
              uint64_t v36 = @"ASSET_CONTENT_NOT_FOUND";
              break;
            case 28:
              uint64_t v36 = @"QBS_DIR_FAULT_COUNT";
              break;
            case 29:
              uint64_t v36 = @"FILE_BOUNCED_MANY_TIMES";
              break;
            case 30:
              uint64_t v36 = @"SYNC_UP_BACKOFF_RATIO_SUMMARY";
              break;
            case 31:
              uint64_t v36 = @"SYNC_UP_BACKOFF_DELAY_SUMMARY";
              break;
            case 32:
              uint64_t v36 = @"QBS_PERFORMANCE";
              break;
            case 33:
              uint64_t v36 = @"ACCOUNT_SESSION_OPEN_ERROR";
              break;
            case 34:
              uint64_t v36 = @"CORRUPT_SHARING_OPTIONS";
              break;
            case 35:
              uint64_t v36 = @"INCORRECT_CONTENT_POLICY_COUNT";
              break;
            case 36:
              uint64_t v36 = @"CORRUPT_BASEHASH_SALT_COUNT";
              break;
            case 37:
              uint64_t v36 = @"EDP_KEYS_MISMATCH";
              break;
            case 38:
              uint64_t v36 = @"DATABASE_ID_MISMATCH";
              break;
            case 39:
              uint64_t v36 = @"COLLABORATION_UPLOAD";
              break;
            case 40:
              uint64_t v36 = @"DANGLING_ZOMBIE_DIRECTORY_COUNT";
              break;
            case 41:
              uint64_t v36 = @"RECORD_VALUE_ERROR";
              break;
            case 42:
              uint64_t v36 = @"AGGRESSIVE_SALTING";
              break;
            case 43:
              uint64_t v36 = @"REIMPORT_DOMAIN_FAILED_ON_STARTUP";
              break;
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
            case 58:
            case 59:
            case 60:
            case 61:
            case 62:
            case 63:
            case 64:
            case 65:
            case 66:
            case 67:
            case 68:
            case 69:
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 75:
            case 76:
            case 77:
            case 78:
            case 79:
            case 80:
            case 81:
            case 82:
            case 83:
            case 84:
            case 85:
            case 86:
            case 87:
            case 88:
            case 89:
            case 90:
            case 91:
            case 92:
            case 93:
            case 94:
            case 95:
            case 96:
            case 97:
            case 98:
            case 99:
              goto LABEL_53;
            case 100:
              uint64_t v36 = @"FULLY_CONSISTENT";
              break;
            case 101:
              uint64_t v36 = @"FILE_CHECKSUM_MISMATCH";
              break;
            case 102:
              uint64_t v36 = @"PACKAGE_CHECKSUM_MISMATCH";
              break;
            case 103:
              uint64_t v36 = @"CHILD_COUNT_MISMATCH";
              break;
            case 104:
              uint64_t v36 = @"RECURSIVE_ITEM_COUNT_MISMATCH";
              break;
            case 105:
              uint64_t v36 = @"SHARE_ALIAS_COUNT_MISMATCH";
              break;
            case 106:
              uint64_t v36 = @"SHARE_COUNT_MISMATCH";
              break;
            case 107:
              uint64_t v36 = @"CONSISTENCY_CHECKER_FAILED";
              break;
            case 108:
              uint64_t v36 = @"FILE_READ_ERROR";
              break;
            default:
              switch((int)v35)
              {
                case 200:
                  uint64_t v36 = @"CA_TOTAL_ERROR_COUNT";
                  break;
                case 201:
                  uint64_t v36 = @"CA_UPLOAD_ERROR_COUNT";
                  break;
                case 202:
                  uint64_t v36 = @"CA_DOWNLOAD_ERROR_COUNT";
                  break;
                case 203:
                  uint64_t v36 = @"CA_SYNC_UP_ITEM_ERROR_COUNT";
                  break;
                case 204:
                  uint64_t v36 = @"CA_SYNC_UP_ZONE_ERROR_COUNT";
                  break;
                case 205:
                  uint64_t v36 = @"CA_SYNC_DOWN_ERROR_COUNT";
                  break;
                case 210:
                  uint64_t v36 = @"CA_UPLOAD_ERROR";
                  break;
                case 211:
                  uint64_t v36 = @"CA_DOWNLOAD_ERROR";
                  break;
                case 212:
                  uint64_t v36 = @"CA_SYNC_UP_ITEM_ERROR";
                  break;
                case 213:
                  uint64_t v36 = @"CA_SYNC_UP_ZONE_ERROR";
                  break;
                case 214:
                  uint64_t v36 = @"CA_SYNC_DOWN_ERROR";
                  break;
                case 215:
                  uint64_t v36 = @"CA_DAMAGED_FILE_UPLOAD_ERROR";
                  break;
                case 216:
                  uint64_t v36 = @"CA_NIL_APP_LIBRARY";
                  break;
                default:
                  goto LABEL_53;
              }
              break;
          }
        }
        __int16 v37 = [v4 domain];
        uint64_t v28 = [v34 stringWithFormat:@"%@ (%@: %ld)", v36, v37, objc_msgSend(v4, "code")];

        tapToRadarManager = self->_tapToRadarManager;
        long long v29 = [v4 description];
        [(BRCTapToRadarManager *)tapToRadarManager requestTapToRadarWithTitle:v28 description:v29 keywords:&unk_26F3DDB68 attachments:MEMORY[0x263EFFA68] sendFullLog:1 displayReason:@"it failed to migrate to FPFS" triggerRootCause:v4];
      }
      else
      {
        uint64_t v28 = brc_bread_crumbs();
        long long v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountSessionFPFS(FPFSAdditions) _sendFPFSImportFinishedTelemetryEvent:]();
        }
      }
    }
  }
  [(BRCAccountSessionFPFS *)self _cleanupMigrationClientState];
}

- (id)_postImportAnalysisForProviderDomainID:(id)a3 withLostItemCount:(unint64_t)a4 withMigrationID:(id)a5
{
  if (a4)
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x263F32360], 90, MEMORY[0x263EFFA78], @"Found approximately %llu items that were not migrated by FP", a4);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_clientZonesMatchingSearchString:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:v4])
  {
    char v6 = 0;
  }
  else
  {
    uint64_t v7 = [v4 uppercaseString];
    char v6 = [v7 isEqualToString:v4] ^ 1;
  }
  uint64_t v8 = [v4 rangeOfString:@":"];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v4;
    id v11 = (id)*MEMORY[0x263EFD488];
  }
  else
  {
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    id v10 = [v4 substringToIndex:v8];
    id v11 = [v4 substringFromIndex:v12 + v13];
  }
  unint64_t v14 = v11;
  uint64_t v15 = [v10 stringByReplacingOccurrencesOfString:@"~" withString:@"."];

  if ([MEMORY[0x263F325E0] validateContainerID:v15])
  {
    id v16 = (id)[objc_alloc(MEMORY[0x263F325E0]) initWithZoneName:v15 ownerName:v14];
    uint64_t v17 = [(BRCAccountSessionFPFS *)self clientZoneByMangledID:v16];
    if (v17)
    {
      id v18 = (id)v17;
      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke;
      v60[3] = &unk_2650839D0;
      id v61 = v15;
      id v20 = v19;
      id v62 = v20;
      [(BRCAccountSessionFPFS *)self enumerateSharedClientZones:v60];
      [v20 addObject:v18];
      uint64_t v21 = v62;
      id v22 = v20;

      id v23 = v61;
      unsigned int v24 = v22;
      goto LABEL_22;
    }
  }
  uint64_t v48 = self;
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2;
  v58[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
  char v59 = v6;
  __int16 v25 = (void (**)(void, void))MEMORY[0x2455D9A50](v58);
  id v26 = objc_alloc(MEMORY[0x263F08AE8]);
  uint64_t v27 = ((void (**)(void, void *))v25)[2](v25, v15);
  uint64_t v28 = (void *)v27;
  if (v27) {
    long long v29 = (__CFString *)v27;
  }
  else {
    long long v29 = @"*";
  }
  uint64_t v30 = (void *)[v26 initWithPattern:v29 options:0 error:0];

  id v31 = objc_alloc(MEMORY[0x263F08AE8]);
  uint64_t v32 = [v14 lowercaseString];
  int v33 = (void *)v32;
  if (v32) {
    double v34 = (__CFString *)v32;
  }
  else {
    double v34 = @"*";
  }
  uint64_t v35 = (void *)[v31 initWithPattern:v34 options:0 error:0];

  uint64_t v36 = [MEMORY[0x263EFF980] array];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3;
  v54[3] = &unk_265083A18;
  __int16 v37 = v14;
  uint64_t v38 = v25;
  id v57 = v38;
  id v39 = v30;
  id v55 = v39;
  id v40 = v36;
  id v56 = v40;
  __int16 v41 = (void *)MEMORY[0x2455D9A50](v54);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4;
  v49[3] = &unk_265083A40;
  id v53 = v38;
  id v50 = v39;
  id v51 = v35;
  id v42 = v40;
  id v52 = v42;
  id v22 = v35;
  id v16 = v39;
  id v18 = v38;
  __int16 v43 = (void *)MEMORY[0x2455D9A50](v49);
  if (!v37) {
    [(BRCAccountSessionFPFS *)v48 enumeratePrivateClientZones:v41];
  }
  -[BRCAccountSessionFPFS enumerateSharedClientZones:](v48, "enumerateSharedClientZones:", v43, v37);
  [v42 sortUsingComparator:&__block_literal_global_37];
  uint64_t v44 = brc_bread_crumbs();
  uint64_t v45 = brc_default_log();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v64 = v4;
    __int16 v65 = 2112;
    id v66 = v42;
    __int16 v67 = 2112;
    __int16 v68 = v44;
    _os_log_debug_impl(&dword_23FA42000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
  }

  id v23 = v42;
  unsigned int v24 = v23;
  unint64_t v14 = v47;
LABEL_22:

  return v24;
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 zoneName];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return 1;
}

id __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 lowercaseString];
  }
  char v6 = v5;

  return v6;
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v3 zoneName];
  char v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3); {
  return 1;
  }
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = [v3 zoneName];
  char v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  uint64_t v7 = [v3 ownerName];
  uint64_t v8 = [v7 lowercaseString];

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(*(id *)(a1 + 40), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 48) addObject:v3];
  }

  return 1;
}

uint64_t __82__BRCAccountSessionFPFS_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 zoneName];
  char v6 = [v4 zoneName];

  uint64_t v7 = [v5 compare:v6 options:129];
  return v7;
}

- (id)clientZonesMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSessionFPFS *)self _clientZonesMatchingSearchString:v6];
  if ([v7 count])
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorClientZoneNotFound:", v6);
    if (v9)
    {
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = "(passed to caller)";
        int v14 = 136315906;
        uint64_t v15 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) clientZonesMatchingSearchString:error:]";
        __int16 v16 = 2080;
        if (!a4) {
          uint64_t v13 = "(ignored by caller)";
        }
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }

    id v8 = 0;
  }

  return v8;
}

- (id)singleClientZoneMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSessionFPFS *)self _clientZonesMatchingSearchString:v6];
  if (![v7 count])
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v6);
    if (v8)
    {
      id v23 = brc_bread_crumbs();
      unsigned int v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        uint64_t v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        __int16 v36 = 2080;
        if (!a4) {
          uint64_t v27 = "(ignored by caller)";
        }
        __int16 v37 = v27;
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 2112;
        __int16 v41 = v23;
        _os_log_error_impl(&dword_23FA42000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v8;
    }
    goto LABEL_24;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v14 isPrivateZone])
          {
            uint64_t v15 = [v14 zoneName];
            [v8 addObject:v15];
          }
          else
          {
            uint64_t v15 = [v14 mangledID];
            __int16 v16 = [v15 mangledIDString];
            [v8 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F32360];
    id v19 = [v8 componentsJoinedByString:@", "];
    __int16 v20 = objc_msgSend(v17, "br_errorWithDomain:code:description:", v18, 12, @"Too many containers matching '%@': {%@}", v6, v19, (void)v29);

    if (v20)
    {
      uint64_t v21 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        uint64_t v28 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        __int16 v36 = 2080;
        if (!a4) {
          uint64_t v28 = "(ignored by caller)";
        }
        __int16 v37 = v28;
        __int16 v38 = 2112;
        id v39 = v20;
        __int16 v40 = 2112;
        __int16 v41 = v21;
        _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v20;
    }

LABEL_24:
    __int16 v25 = 0;
    goto LABEL_26;
  }
  __int16 v25 = [v7 firstObject];
LABEL_26:

  return v25;
}

- (id)_appLibrariesMatchingSearchString:(id)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:v4])
  {
    char v6 = 0;
  }
  else
  {
    uint64_t v7 = [v4 uppercaseString];
    char v6 = [v7 isEqualToString:v4] ^ 1;
  }
  id v8 = [v4 stringByReplacingOccurrencesOfString:@"~" withString:@"."];
  if (v8
    && ([(BRCAccountSessionFPFS *)self appLibraryByID:v8],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = (void (**)(void, void))v9;
    v40[0] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
  }
  else
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke;
    v32[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
    char v33 = v6;
    uint64_t v12 = (void (**)(void, void))MEMORY[0x2455D9A50](v32);
    id v13 = objc_alloc(MEMORY[0x263F08AE8]);
    uint64_t v14 = ((void (**)(void, void *))v12)[2](v12, v8);
    uint64_t v15 = (void *)v14;
    if (v14) {
      __int16 v16 = (__CFString *)v14;
    }
    else {
      __int16 v16 = @"*";
    }
    uint64_t v17 = (void *)[v13 initWithPattern:v16 options:0 error:0];

    uint64_t v18 = [MEMORY[0x263EFF980] array];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2;
    uint64_t v28 = &unk_265083A88;
    id v31 = v12;
    id v29 = v17;
    id v19 = v18;
    id v30 = v19;
    id v20 = v17;
    uint64_t v10 = v12;
    uint64_t v21 = (void *)MEMORY[0x2455D9A50](&v25);
    -[BRCAccountSessionFPFS enumerateAppLibraries:](self, "enumerateAppLibraries:", v21, v25, v26, v27, v28);
    [v19 sortUsingComparator:&__block_literal_global_28];
    uint64_t v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v35 = v4;
      __int16 v36 = 2112;
      id v37 = v19;
      __int16 v38 = 2112;
      id v39 = v22;
      _os_log_debug_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
    }

    id v11 = v19;
  }

  return v11;
}

id __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 lowercaseString];
  }
  char v6 = v5;

  return v6;
}

uint64_t __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v3 appLibraryID];
  char v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3); {
  return 1;
  }
}

uint64_t __83__BRCAccountSessionFPFS_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 appLibraryID];
  char v6 = [v4 appLibraryID];

  uint64_t v7 = [v5 compare:v6 options:129];
  return v7;
}

- (id)appLibrariesMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSessionFPFS *)self _appLibrariesMatchingSearchString:v6];
  if ([v7 count])
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorClientZoneNotFound:", v6);
    if (v9)
    {
      uint64_t v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v13 = "(passed to caller)";
        int v14 = 136315906;
        uint64_t v15 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) appLibrariesMatchingSearchString:error:]";
        __int16 v16 = 2080;
        if (!a4) {
          id v13 = "(ignored by caller)";
        }
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }

    id v8 = 0;
  }

  return v8;
}

- (id)singleAppLibraryMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSessionFPFS *)self _appLibrariesMatchingSearchString:v6];
  if (![v7 count])
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAppLibraryNotFound:", v6);
    if (v8)
    {
      uint64_t v21 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        uint64_t v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        char v33 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        __int16 v34 = 2080;
        if (!a4) {
          uint64_t v25 = "(ignored by caller)";
        }
        id v35 = v25;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        id v39 = v21;
        _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v8;
    }
    goto LABEL_21;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) appLibraryID];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F32360];
    uint64_t v17 = [v8 componentsJoinedByString:@", "];
    __int16 v18 = objc_msgSend(v15, "br_errorWithDomain:code:description:", v16, 12, @"Too many containers matching '%@': {%@}", v6, v17, (void)v27);

    if (v18)
    {
      id v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        uint64_t v26 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        char v33 = "-[BRCAccountSessionFPFS(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        __int16 v34 = 2080;
        if (!a4) {
          uint64_t v26 = "(ignored by caller)";
        }
        id v35 = v26;
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        id v39 = v19;
        _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v18;
    }

LABEL_21:
    id v23 = 0;
    goto LABEL_23;
  }
  id v23 = [v7 firstObject];
LABEL_23:

  return v23;
}

- (BOOL)shouldPerformPCSMigration
{
  if ([(BRCAccountSessionFPFS *)self PCSMigrationComplete]) {
    return 0;
  }
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  char v4 = [v3 shouldPreparePCSMigration];

  return v4;
}

- (BOOL)PCSMigrationComplete
{
  uint64_t v2 = [(BRCAccountSessionFPFS *)self clientState];
  id v3 = [v2 objectForKeyedSubscript:@"hasCompletedPCSMigration"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setNeedsPCSMigration:(BOOL)a3
{
  BOOL v3 = a3;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v5 = [NSNumber numberWithInt:!v3];
  id v6 = [(BRCAccountSessionFPFS *)self clientState];
  [v6 setObject:v5 forKeyedSubscript:@"hasCompletedPCSMigration"];

  clientDB = self->_clientDB;
  [(BRCPQLConnection *)clientDB forceBatchStart];
}

- (BRCAccountSessionFPFS)init
{
  v28.receiver = self;
  v28.super_class = (Class)BRCAccountSessionFPFS;
  uint64_t v2 = [(BRCAccountSessionFPFS *)&v28 init];
  BOOL v3 = v2;
  if (v2)
  {
    brc_mutex_init_recursive(&v2->_zonesLock.pthread);
    brc_mutex_init(&v3->_zonesCreationLock.pthread);
    v3->_int cloudDocsFD = -1;
    char v4 = [MEMORY[0x263F841B0] sharedManager];
    id v5 = objc_msgSend(v4, "br_currentPersonaID");

    BRPersonaSpecificName();
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (const char *)[v6 UTF8String];
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v7, v9);

    dbWatcherQueue = v3->_dbWatcherQueue;
    v3->_dbWatcherQueue = (OS_dispatch_queue *)v10;

    BRPersonaSpecificName();
    id v12 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v13 = dispatch_workloop_create((const char *)[v12 UTF8String]);
    clientTruthWorkloop = v3->_clientTruthWorkloop;
    v3->_clientTruthWorkloop = (OS_dispatch_workloop *)v13;

    BRPersonaSpecificName();
    id v15 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v16 = dispatch_workloop_create((const char *)[v15 UTF8String]);
    serverTruthWorkloop = v3->_serverTruthWorkloop;
    v3->_serverTruthWorkloop = (OS_dispatch_workloop *)v16;

    BRPersonaSpecificName();
    id v18 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v19 = dispatch_workloop_create((const char *)[v18 UTF8String]);
    readOnlyWorkloop = v3->_readOnlyWorkloop;
    v3->_readOnlyWorkloop = (OS_dispatch_workloop *)v19;

    uint64_t v21 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    miscOperations = v3->_miscOperations;
    v3->_miscOperations = (NSHashTable *)v21;

    uint64_t v23 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", &v3->_isDataSeparated);
    personaIdentifier = v3->_personaIdentifier;
    v3->_personaIdentifier = (NSString *)v23;

    uint64_t v25 = objc_alloc_init(BRCBarrier);
    dbLoadingBarrier = v3->_dbLoadingBarrier;
    v3->_dbLoadingBarrier = v25;

    v3->_isOpeuint64_t n = 0;
  }
  return v3;
}

- (BRCAccountSessionFPFS)initWithACAccountID:(id)a3 dbAccountDSID:(id)a4 salt:(id)a5 accountHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(BRCAccountSessionFPFS *)self init];
  dispatch_workloop_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_acAccountID, a3);
    objc_storeStrong((id *)&v16->_accountDSID, a4);
    objc_storeStrong((id *)&v16->_ubiquityTokenSalt, a5);
    objc_storeStrong((id *)&v16->_accountHandler, a6);
    uint64_t v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    xpcClients = v16->_xpcClients;
    v16->_xpcClients = v17;

    dispatch_workloop_t v19 = objc_msgSend(NSString, "br_currentSupportDir");
    uint64_t v20 = *MEMORY[0x263F32468];
    uint64_t v21 = [v19 stringByAppendingPathComponent:*MEMORY[0x263F32468]];
    [(BRCAccountSessionFPFS *)v16 setSessionDirPath:v21];

    uint64_t v22 = objc_msgSend(NSString, "brc_currentCachesDir");
    uint64_t v23 = [v22 stringByAppendingPathComponent:v20];
    [(BRCAccountSessionFPFS *)v16 setCacheDirPath:v23];

    unsigned int v24 = [[BRCFileUnlinker alloc] initWithCacheDirPath:v22];
    fileUnlinker = v16->_fileUnlinker;
    v16->_fileUnlinker = v24;

    uint64_t v26 = [(NSString *)v16->_sessionDirPath stringByAppendingPathComponent:@"db"];
    uint64_t v27 = [NSURL fileURLWithPath:v26 isDirectory:1];
    dbURL = v16->_dbURL;
    v16->_dbURL = (NSURL *)v27;
  }
  return v16;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: session wasn't properly closed%@", v2, v3, v4, v5, v6);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"session{account:%@}", self->_accountDSID];
}

- (BRCTapToRadarManager)tapToRadarManager
{
  return self->_tapToRadarManager;
}

- (BRCSyncUpStagingProtocol)syncUpStager
{
  return (BRCSyncUpStagingProtocol *)self->_stageRegistry;
}

- (BRCDownloadStagingProtocol)downloadStager
{
  return (BRCDownloadStagingProtocol *)self->_stageRegistry;
}

- (BRCNamedThrottleManager)namedThrottleManager
{
  return self->_namedThrottleManager;
}

- (BRCBouncingAnalyzer)bouncingAnalyzer
{
  return self->_bouncingAnalyzer;
}

- (void)addMiscOperation:(id)a3
{
}

- (id)getMiscOperations
{
  uint64_t v2 = (void *)[(NSHashTable *)self->_miscOperations copy];
  return v2;
}

- (void)closeXPCClientsSync
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx closing XPC connections%@");
}

- (BOOL)icloudAccountIsInCarry
{
  isInCarry = self->_isInCarry;
  if (isInCarry)
  {
    return [(NSNumber *)isInCarry BOOLValue];
  }
  else
  {
    uint64_t v5 = +[BRCAccountHandler currentiCloudAccount];
    if (objc_msgSend(v5, "br_isEnabledForCloudDocs"))
    {
      uint8_t v6 = [(BRCAccountSessionFPFS *)self accountDSID];
      uint64_t v7 = objc_msgSend(v5, "br_dsid");
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        id v9 = [v5 propertiesForDataclass:*MEMORY[0x263EFB4C0]];
        dispatch_queue_t v10 = [v9 objectForKeyedSubscript:@"url"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [NSURL URLWithString:v10];
          id v12 = [v11 host];
          id v13 = [v12 componentsSeparatedByString:@"-"];
          id v14 = [v13 firstObject];

          id v15 = +[BRCUserDefaults defaultsForMangledID:0];
          dispatch_workloop_t v16 = [v15 carryPartitions];

          if (v14 && ([v16 containsObject:v14] & 1) != 0) {
            uint64_t v17 = (NSNumber *)MEMORY[0x263EFFA88];
          }
          else {
            uint64_t v17 = (NSNumber *)MEMORY[0x263EFFA80];
          }
          id v18 = self->_isInCarry;
          self->_isInCarry = v17;
        }
      }
    }
    BOOL v19 = [(NSNumber *)self->_isInCarry BOOLValue];

    return v19;
  }
}

- (void)_setupSharedPackageExtensionsPlist
{
}

- (void)_closeSharedPackageExtensionsPlist
{
}

- (void)_createAccountSupportPathIfNeeded:(id)a3 protectParent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v66 = a3;
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:]", 493, v72);
  uint64_t v5 = brc_bread_crumbs();
  uint8_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)id v78 = v72[0];
    *(_WORD *)&v78[8] = 2112;
    id v79 = v66;
    *(_WORD *)uint64_t v80 = 2112;
    *(void *)&v80[2] = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating '%@'%@", buf, 0x20u);
  }

  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  id v71 = 0;
  char v8 = [v7 createDirectoryAtPath:v66 withIntermediateDirectories:1 attributes:0 error:&v71];
  id v9 = v71;
  dispatch_queue_t v10 = v9;
  if ((v8 & 1) == 0)
  {
    if ((objc_msgSend(v9, "br_isCocoaErrorCode:", 516) & 1) == 0)
    {
      char v59 = brc_bread_crumbs();
      char v60 = brc_default_log();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)id v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        id v79 = v10;
        *(_WORD *)uint64_t v80 = 2112;
        *(void *)&v80[2] = v59;
        _os_log_fault_impl(&dword_23FA42000, v60, OS_LOG_TYPE_FAULT, "[CRIT] can't create directory at '%@': %@%@", buf, 0x20u);
      }

LABEL_69:
      exit(1);
    }
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:]((uint64_t)v66);
    }
  }
  id v70 = v10;
  id v13 = [v7 attributesOfItemAtPath:v66 error:&v70];
  id v14 = v70;

  BOOL v15 = v14 == 0;
  if (v14)
  {
    dispatch_workloop_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v45 = [v66 fileSystemRepresentation];
      *(_DWORD *)buf = 136315650;
      *(void *)id v78 = v45;
      *(_WORD *)&v78[8] = 2112;
      id v79 = v14;
      *(_WORD *)uint64_t v80 = 2112;
      *(void *)&v80[2] = v16;
      _os_log_fault_impl(&dword_23FA42000, v17, OS_LOG_TYPE_FAULT, "[CRIT] can't retrieve attributes of item at '%s': %@%@", buf, 0x20u);
    }
  }
  id v18 = [v13 fileOwnerAccountName];
  BOOL v19 = NSUserName();
  char v20 = [v18 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      id v46 = [v13 fileOwnerAccountName];
      uint64_t v47 = NSUserName();
      *(_DWORD *)buf = 138412802;
      *(void *)id v78 = v46;
      *(_WORD *)&v78[8] = 2112;
      id v79 = v47;
      *(_WORD *)uint64_t v80 = 2112;
      *(void *)&v80[2] = v21;
      _os_log_fault_impl(&dword_23FA42000, v22, OS_LOG_TYPE_FAULT, "[CRIT] created directory has a wrong owner (value: %@, expected: %@)%@", buf, 0x20u);
    }
    BOOL v15 = 0;
  }
  if (([v13 filePosixPermissions] & 0x180) == 0)
  {
    uint64_t v23 = brc_bread_crumbs();
    unsigned int v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      int v65 = aPcDBLSW[(unsigned __int16)[v13 filePosixPermissions] >> 12];
      if (([v13 filePosixPermissions] & 0x100) != 0) {
        int v48 = 114;
      }
      else {
        int v48 = 45;
      }
      int v64 = v48;
      if (([v13 filePosixPermissions] & 0x80) != 0) {
        int v49 = 119;
      }
      else {
        int v49 = 45;
      }
      int v63 = v49;
      if (([v13 filePosixPermissions] & 0x40) != 0) {
        int v50 = 120;
      }
      else {
        int v50 = 45;
      }
      int v62 = v50;
      if (([v13 filePosixPermissions] & 0x20) != 0) {
        int v51 = 114;
      }
      else {
        int v51 = 45;
      }
      int v61 = v51;
      if (([v13 filePosixPermissions] & 0x10) != 0) {
        int v52 = 119;
      }
      else {
        int v52 = 45;
      }
      if (([v13 filePosixPermissions] & 8) != 0) {
        int v53 = 120;
      }
      else {
        int v53 = 45;
      }
      if (([v13 filePosixPermissions] & 4) != 0) {
        int v54 = 114;
      }
      else {
        int v54 = 45;
      }
      char v55 = [v13 filePosixPermissions];
      char v56 = [v13 filePosixPermissions];
      *(_DWORD *)buf = 67111682;
      *(_DWORD *)id v78 = v65;
      if ((v55 & 2) != 0) {
        int v57 = 119;
      }
      else {
        int v57 = 45;
      }
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v64;
      if (v56) {
        int v58 = 120;
      }
      else {
        int v58 = 45;
      }
      LOWORD(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 2) = v63;
      HIWORD(v79) = 1024;
      *(_DWORD *)uint64_t v80 = v62;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)&v80[6] = v61;
      __int16 v81 = 1024;
      int v82 = v52;
      __int16 v83 = 1024;
      int v84 = v53;
      __int16 v85 = 1024;
      int v86 = v54;
      __int16 v87 = 1024;
      int v88 = v57;
      __int16 v89 = 1024;
      int v90 = v58;
      __int16 v91 = 2112;
      id v92 = v23;
      _os_log_fault_impl(&dword_23FA42000, v24, OS_LOG_TYPE_FAULT, "[CRIT] created directory doesn't have read/write access for owner (permission: %c%c%c%c%c%c%c%c%c%c)%@", buf, 0x48u);
    }

    BOOL v15 = 0;
  }
  uint64_t v25 = *MEMORY[0x263F080A8];
  uint64_t v26 = [v13 objectForKeyedSubscript:*MEMORY[0x263F080A8]];
  uint64_t v27 = *MEMORY[0x263F08098];
  char v28 = [v26 isEqualToString:*MEMORY[0x263F08098]];

  if (v28)
  {
    id v29 = v14;
  }
  else
  {
    uint64_t v75 = v25;
    uint64_t v76 = v27;
    long long v30 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    id v69 = v14;
    char v31 = [v7 setAttributes:v30 ofItemAtPath:v66 error:&v69];
    id v29 = v69;

    if ((v31 & 1) == 0)
    {
      long long v32 = brc_bread_crumbs();
      char v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)id v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        id v79 = v29;
        *(_WORD *)uint64_t v80 = 2112;
        *(void *)&v80[2] = v32;
        _os_log_fault_impl(&dword_23FA42000, v33, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
      }
    }
  }
  if (v4)
  {
    __int16 v34 = [v66 stringByDeletingLastPathComponent];
    id v68 = v29;
    id v35 = [v7 attributesOfItemAtPath:v34 error:&v68];
    id v36 = v68;

    id v37 = [v35 objectForKeyedSubscript:v25];
    char v38 = [v37 isEqualToString:v27];

    if (v38)
    {
      id v29 = v36;
    }
    else
    {
      uint64_t v73 = v25;
      uint64_t v74 = v27;
      id v39 = [NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      id v67 = v36;
      char v40 = [v7 setAttributes:v39 ofItemAtPath:v34 error:&v67];
      id v29 = v67;

      if ((v40 & 1) == 0)
      {
        __int16 v41 = brc_bread_crumbs();
        uint64_t v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)id v78 = v34;
          *(_WORD *)&v78[8] = 2112;
          id v79 = v29;
          *(_WORD *)uint64_t v80 = 2112;
          *(void *)&v80[2] = v41;
          _os_log_fault_impl(&dword_23FA42000, v42, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    id v35 = v13;
  }

  if (!v15) {
    goto LABEL_69;
  }
  __int16 v43 = brc_bread_crumbs();
  uint64_t v44 = brc_default_log();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS _createAccountSupportPathIfNeeded:protectParent:]();
  }

  __brc_leave_section(v72);
}

- (void)markAccountMigrationComplete
{
}

- (void)_setupThrottles
{
  uint64_t v3 = +[BRCUserDefaults defaultsForMangledID:0];
  BOOL v4 = [v3 appLibraryScanThrottleParams];
  uint64_t v5 = [[BRCThrottle alloc] initWithName:@"fsreader.container.throttle" andParameters:v4];
  appLibraryScanThrottle = self->_appLibraryScanThrottle;
  self->_appLibraryScanThrottle = v5;

  uint64_t v7 = [v3 appLibraryResetThrottleParams];

  char v8 = [[BRCThrottle alloc] initWithName:@"container.reset.throttle" andParameters:v7];
  appLibraryResetThrottle = self->_appLibraryResetThrottle;
  self->_appLibraryResetThrottle = v8;

  dispatch_queue_t v10 = [v3 sharedAppLibraryResetThrottleParams];

  id v11 = [[BRCThrottle alloc] initWithName:@"shared-container.reset.throttle" andParameters:v10];
  sharedAppLibraryResetThrottle = self->_sharedAppLibraryResetThrottle;
  self->_sharedAppLibraryResetThrottle = v11;

  id v13 = [v3 appLibraryAliasRemovalThrottleParams];

  id v14 = [[BRCThrottle alloc] initWithName:@"container.reset.alias-removal.throttle" andParameters:v13];
  appLibraryAliasRemovalThrottle = self->_appLibraryAliasRemovalThrottle;
  self->_appLibraryAliasRemovalThrottle = v14;

  dispatch_workloop_t v16 = [v3 lostItemThrottleParams];

  uint64_t v17 = [[BRCThrottle alloc] initWithName:@"fsreader.lost.throttle" andParameters:v16];
  lostItemThrottle = self->_lostItemThrottle;
  self->_lostItemThrottle = v17;

  BOOL v19 = [v3 operationFailureThrottleParams];

  char v20 = [[BRCThrottle alloc] initWithName:@"operation.failure.throttle" andParameters:v19];
  operationFailureThrottle = self->_operationFailureThrottle;
  self->_operationFailureThrottle = v20;

  uint64_t v22 = [v3 syncClientZoneThrottleParams];

  uint64_t v23 = [[BRCThrottle alloc] initWithName:@"sync.container.throttle" andParameters:v22];
  syncClientZoneThrottle = self->_syncClientZoneThrottle;
  self->_syncClientZoneThrottle = v23;

  id v27 = [v3 syncClientZoneErrorThrottleParams];

  uint64_t v25 = [[BRCThrottle alloc] initWithName:@"sync.container.error.throttle" andParameters:v27];
  syncClientZoneErrorThrottle = self->_syncClientZoneErrorThrottle;
  self->_syncClientZoneErrorThrottle = v25;
}

- (void)resetThrottles
{
  [(BRCThrottle *)self->_appLibraryScanThrottle reset];
  [(BRCThrottle *)self->_appLibraryResetThrottle reset];
  [(BRCThrottle *)self->_appLibraryAliasRemovalThrottle reset];
  [(BRCThrottle *)self->_sharedAppLibraryResetThrottle reset];
  [(BRCThrottle *)self->_lostItemThrottle reset];
  [(BRCThrottle *)self->_operationFailureThrottle reset];
  [(BRCThrottle *)self->_syncClientZoneThrottle reset];
  syncClientZoneErrorThrottle = self->_syncClientZoneErrorThrottle;
  [(BRCThrottle *)syncClientZoneErrorThrottle reset];
}

- (void)_clearLegacyConflictVersionsAsync
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &__block_literal_global_49);
}

void __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v0 = brc_bread_crumbs();
  os_log_t v1 = brc_notifications_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke_cold_1();
  }

  uint64_t v2 = [MEMORY[0x263F406B8] manager];
  uint64_t v3 = *MEMORY[0x263F406A8];
  BOOL v4 = [MEMORY[0x263F325A0] homeDirectoryURL];
  uint64_t v5 = [v4 path];
  id v10 = 0;
  char v6 = [v2 removeAdditionsInNamespace:v3 underPath:v5 withMatchingPredicate:&__block_literal_global_45_2 errorPerAddition:0 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    char v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] Couldn't clear the legacy additions after migrating to FPFS - %@%@", buf, 0x16u);
    }
  }
}

uint64_t __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke_42(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263F406B0], "brc_isLegacyConflictAddition:", a2);
}

- (void)_setICloudDesktopEnabled:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  objc_msgSend(v5, "br_setEnabledForiCloudDesktop:", v4);
  char v6 = [MEMORY[0x263EFB210] defaultStore];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__BRCAccountSessionFPFS__setICloudDesktopEnabled_forAccount___block_invoke;
  v8[3] = &unk_2650819D0;
  id v9 = v5;
  id v7 = v5;
  [v6 saveAccount:v7 withCompletionHandler:v8];
}

void __61__BRCAccountSessionFPFS__setICloudDesktopEnabled_forAccount___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    char v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_23FA42000, v7, (os_log_type_t)0x90u, "[ERROR] can't save account %@: %@%@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (BOOL)_addOrImportDomainIfNeededWithError:(id *)a3 domainAdded:(BOOL *)a4 domainImported:(BOOL *)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v8 = [MEMORY[0x263EFB210] defaultStore];
  int v9 = [v8 accountWithIdentifier:self->_acAccountID];

  if (![v9 isDataSeparatedAccount])
  {
    id v12 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
    __int16 v11 = [v12 userPersonaUniqueString];

    uint64_t v10 = @"iCloudDrive";
    if (!v11) {
      goto LABEL_5;
    }
LABEL_6:
    uint64_t v55 = 0;
    char v56 = &v55;
    uint64_t v57 = 0x3032000000;
    int v58 = __Block_byref_object_copy__40;
    char v59 = __Block_byref_object_dispose__40;
    id v60 = 0;
    uint64_t v51 = 0;
    int v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    uint64_t v47 = 0;
    int v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000;
    uint64_t v44 = __Block_byref_object_copy__40;
    uint64_t v45 = __Block_byref_object_dispose__40;
    id v46 = 0;
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x3032000000;
    char v38 = __Block_byref_object_copy__40;
    id v39 = __Block_byref_object_dispose__40;
    id v40 = 0;
    id v32 = v11;
    char v33 = v10;
    id v34 = v9;
    BRPerformWithPersonaAndError();
    uint64_t v15 = (void *)v56[5];
    BOOL v16 = v15 == 0;
    if (v15)
    {
      id v17 = v15;
      id v18 = brc_bread_crumbs();
      BOOL v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        long long v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v62 = (BRCAccountSessionFPFS *)"-[BRCAccountSessionFPFS _addOrImportDomainIfNeededWithError:domainAdded:domainImported:]";
        __int16 v63 = 2080;
        if (!a3) {
          long long v30 = "(ignored by caller)";
        }
        int v64 = v30;
        __int16 v65 = 2112;
        id v66 = v17;
        __int16 v67 = 2112;
        id v68 = v18;
        _os_log_error_impl(&dword_23FA42000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a3) {
        *a3 = v17;
      }
    }
    else if (!*((unsigned char *)v52 + 24))
    {
      char v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        if (*((unsigned char *)v48 + 24)) {
          uint64_t v22 = "Importing";
        }
        else {
          uint64_t v22 = "Adding";
        }
        uint64_t v23 = (void *)v42[5];
        unsigned int v24 = (void *)v36[5];
        *(_DWORD *)buf = 138413314;
        int v62 = self;
        __int16 v63 = 2080;
        int v64 = v22;
        __int16 v65 = 2112;
        id v66 = v23;
        __int16 v67 = 2112;
        id v68 = v24;
        __int16 v69 = 2112;
        id v70 = v20;
        _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - %s Provider Domain %@/%@ was successful%@", buf, 0x34u);
      }

      if (a5) {
        *a5 = *((unsigned char *)v48 + 24);
      }
      if (a4) {
        *a4 = *((unsigned char *)v48 + 24) ^ 1;
      }
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);

    goto LABEL_22;
  }
  uint64_t v10 = [v9 accountDescription];
  __int16 v11 = objc_msgSend(v9, "br_personaIdentifier");
  if (v11) {
    goto LABEL_6;
  }
LABEL_5:
  __int16 v13 = [MEMORY[0x263F841B0] sharedManager];
  char v14 = [v13 isSharedIPad];

  if (v14) {
    goto LABEL_6;
  }
  uint64_t v26 = brc_bread_crumbs();
  id v27 = brc_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS _addOrImportDomainIfNeededWithError:domainAdded:domainImported:]();
  }

  char v28 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 116, @"Can't get persona for accountID %@", self->_acAccountID);
  id v29 = v28;
  if (a3) {
    *a3 = v28;
  }

  BOOL v16 = 0;
LABEL_22:

  return v16;
}

void __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v184 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (!v4)
  {
    id v160 = 0;
    uint64_t v5 = objc_msgSend(MEMORY[0x263F055B8], "br_getDomainForCurrentPersonaWithError:", &v160);
    id v6 = v160;
    id v7 = v160;
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 128);
    *(void *)(v8 + 128) = v5;

    if (*(void *)(*(void *)(a1 + 32) + 128))
    {
      brc_bread_crumbs();
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v171 = v12;
        __int16 v172 = 2112;
        v173 = v10;
        _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Found an existing FPFS domain%@", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
LABEL_82:

      goto LABEL_83;
    }
    if (v7)
    {
      __int16 v13 = brc_bread_crumbs();
      char v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        uint64_t v113 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v171 = v113;
        __int16 v172 = 2112;
        v173 = (const char *)v7;
        __int16 v174 = 2112;
        id v175 = v13;
        _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] %@ - Got an error while looking for FPFS domain, fail the request to open account. Error: %@%@", buf, 0x20u);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
      goto LABEL_82;
    }
    uint64_t v15 = objc_msgSend(NSURL, "brc_ciconiaWorkDirForCurrentPersona");
    BOOL v16 = objc_msgSend(NSURL, "brc_ciconiaDumpDirForCurrentPersona");
    id v17 = [v15 path];
    if (access((const char *)[v17 fileSystemRepresentation], 0) < 0)
    {
      id v18 = [v16 path];
      int v19 = access((const char *)[v18 fileSystemRepresentation], 0);

      if (v19 < 0) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    char v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v129 = *(void *)(a1 + 32);
      v130 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v171 = v129;
      __int16 v172 = 2112;
      v173 = v130;
      __int16 v174 = 2112;
      id v175 = v15;
      __int16 v176 = 2112;
      v177 = v20;
      _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Cleaning Ciconia for persona ID: %@ at: %@%@", buf, 0x2Au);
    }

    uint64_t v22 = objc_opt_new();
    v159[0] = MEMORY[0x263EF8330];
    v159[1] = 3221225472;
    v159[2] = __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_62;
    v159[3] = &unk_26507EBD8;
    v159[4] = *(void *)(a1 + 32);
    [v22 cleanupCiconiaAtURL:v15 diagnosticsURL:v16 completionHandler:v159];

LABEL_17:
    v140 = v15;
    uint64_t v23 = objc_msgSend(MEMORY[0x263F325C0], "br_getProviderDomainIDForCurrentPersona");
    uint64_t v24 = [v23 stringByDeletingLastPathComponent];
    uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    v139 = v23;
    uint64_t v27 = [v23 lastPathComponent];
    uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    uint64_t v30 = +[BRCStringAdditions _br_currentMobileDocumentsDirForLegacy];
    char v31 = [MEMORY[0x263F08850] defaultManager];
    int v32 = [v31 fileExistsAtPath:v30];

    if (v32)
    {
      char v33 = [NSURL fileURLWithPath:v30 isDirectory:1];
      BRCGetAccountDSIDForMobileDocsRoot(v33, 0);
      id v34 = (char *)objc_claimAutoreleasedReturnValue();

      uint64_t v35 = (void *)v30;
      id v36 = [NSURL fileURLWithPath:v30];
      uint64_t v37 = objc_msgSend(v36, "fp_fpfsProviderDomainID:", 0);

      char v38 = brc_bread_crumbs();
      id v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v171 = v40;
        __int16 v172 = 2112;
        v173 = v34;
        __int16 v174 = 2112;
        id v175 = v38;
        _os_log_impl(&dword_23FA42000, v39, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Found LMD folder with legacy XATTR '%@', checking if it's valid for import%@", buf, 0x20u);
      }

      if (v34 && [v34 isEqualToString:*(void *)(*(void *)(a1 + 32) + 208)])
      {
        brc_bread_crumbs();
        uint64_t v41 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v171 = v43;
          __int16 v172 = 2112;
          v173 = v41;
          _os_log_impl(&dword_23FA42000, v42, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Mobile Documents folder owner matches the session owner. We can safely import. %@", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      }
      else
      {
        uint64_t v45 = v16;
        id v46 = brc_bread_crumbs();
        uint64_t v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v48 = *(void *)(a1 + 32);
          uint64_t v49 = *(void **)(v48 + 208);
          *(_DWORD *)buf = 138413058;
          uint64_t v171 = v48;
          __int16 v172 = 2112;
          v173 = v34;
          __int16 v174 = 2112;
          id v175 = v49;
          __int16 v176 = 2112;
          v177 = v46;
          _os_log_impl(&dword_23FA42000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Mobile Documents folder owner (%@) DOES NOT match the session owner (%@). Not invoking Import%@", buf, 0x2Au);
        }

        if (!v37)
        {
          char v50 = NSURL;
          v156[0] = MEMORY[0x263EF8330];
          v156[1] = 3221225472;
          v156[2] = __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_66;
          v156[3] = &unk_265081E88;
          v156[4] = *(void *)(a1 + 32);
          id v51 = v35;
          uint64_t v52 = *(void *)(a1 + 64);
          id v157 = v51;
          uint64_t v158 = v52;
          objc_msgSend(v50, "br_setIOPolicy:type:forBlock:", 1, 7, v156);
        }
        BRCRecursiveRemoveBelow(*(void **)(*(void *)(a1 + 32) + 544));
        BOOL v16 = v45;
      }
    }
    else
    {
      uint64_t v35 = (void *)v30;
      brc_bread_crumbs();
      id v34 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v171 = v44;
        __int16 v172 = 2112;
        v173 = v34;
        _os_log_impl(&dword_23FA42000, v37, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Didn't find LMD folder. Will start from scratch%@", buf, 0x16u);
      }
    }

    uint64_t v53 = brc_bread_crumbs();
    char v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
        uint64_t v55 = "import";
      }
      else {
        uint64_t v55 = "add";
      }
      char v56 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      uint64_t v57 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      uint64_t v58 = *(void *)(a1 + 32);
      uint64_t v59 = *(void *)(a1 + 40);
      uint64_t v60 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413826;
      uint64_t v171 = v58;
      __int16 v172 = 2080;
      v173 = v55;
      __int16 v174 = 2112;
      id v175 = v56;
      __int16 v176 = 2112;
      v177 = v57;
      __int16 v178 = 2112;
      uint64_t v179 = v59;
      __int16 v180 = 2112;
      uint64_t v181 = v60;
      __int16 v182 = 2112;
      v183 = v53;
      _os_log_impl(&dword_23FA42000, v54, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Will attempt to %s domain: providerID = %@ , domainID = %@, persona = %@, displayName = %@%@", buf, 0x48u);
    }
    int v61 = v16;

    uint64_t v62 = [objc_alloc(MEMORY[0x263F05590]) initWithIdentifier:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) displayName:*(void *)(a1 + 48)];
    uint64_t v63 = *(void *)(a1 + 32);
    int v64 = *(void **)(v63 + 128);
    *(void *)(v63 + 128) = v62;

    uint64_t v65 = objc_msgSend(*(id *)(a1 + 56), "br_dsid");
    id v66 = [*(id *)(*(void *)(a1 + 32) + 128) userInfo];
    __int16 v67 = (void *)[v66 mutableCopy];
    id v68 = v67;
    __int16 v69 = v35;
    if (v67) {
      id v70 = v67;
    }
    else {
      id v70 = (id)objc_opt_new();
    }
    uint64_t v71 = v70;
    uint64_t v72 = v140;
    v137 = v70;

    [v71 setObject:v65 forKeyedSubscript:*MEMORY[0x263F323A8]];
    [*(id *)(*(void *)(a1 + 32) + 128) setUserInfo:v71];
    v138 = (void *)v65;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      [*(id *)(a1 + 32) _clearLegacyConflictVersionsAsync];
      uint64_t v73 = v61;
      id v7 = 0;
      if ([*(id *)(a1 + 56) isDataSeparatedAccount])
      {
        objc_msgSend(MEMORY[0x263F055B8], "br_getLegacyEnterpriseProviderManager");
        v143 = id v155 = 0;
        objc_msgSend(v143, "br_getFPDomainsWithError:", &v155);
        uint64_t v74 = (char *)objc_claimAutoreleasedReturnValue();
        v136 = (char *)v155;
        if (v136)
        {
          brc_bread_crumbs();
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v75 = brc_default_log();
          if (os_log_type_enabled(v75, (os_log_type_t)0x90u))
          {
            uint64_t v131 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            uint64_t v171 = v131;
            __int16 v172 = 2112;
            v173 = v136;
            __int16 v174 = 2112;
            id v175 = obj;
            _os_log_error_impl(&dword_23FA42000, v75, (os_log_type_t)0x90u, "[ERROR] %@ - couldn't get existing domains: %@%@", buf, 0x20u);
          }
        }
        else
        {
          int v88 = brc_bread_crumbs();
          __int16 v89 = brc_default_log();
          v132 = v74;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v90 = *(void *)(a1 + 32);
            __int16 v91 = [v143 providerIdentifier];
            *(_DWORD *)buf = 138413058;
            uint64_t v171 = v90;
            __int16 v172 = 2112;
            v173 = v132;
            __int16 v174 = 2112;
            id v175 = v91;
            __int16 v176 = 2112;
            v177 = v88;
            _os_log_impl(&dword_23FA42000, v89, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Found the following domains: %@ from provider: %@%@", buf, 0x2Au);

            uint64_t v74 = (char *)v132;
          }

          v154[0] = MEMORY[0x263EF8330];
          v154[1] = 3221225472;
          v154[2] = __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_75;
          v154[3] = &unk_265084A88;
          v154[4] = *(void *)(a1 + 88);
          objc_msgSend(v74, "br_copy_if:", v154);
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v92 = [obj countByEnumeratingWithState:&v150 objects:v169 count:16];
          if (v92)
          {
            uint64_t v93 = v92;
            v133 = v69;
            uint64_t v94 = *(void *)v151;
            do
            {
              for (uint64_t i = 0; i != v93; ++i)
              {
                if (*(void *)v151 != v94) {
                  objc_enumerationMutation(obj);
                }
                v96 = *(const char **)(*((void *)&v150 + 1) + 8 * i);
                uint64_t v97 = brc_bread_crumbs();
                v98 = brc_default_log();
                if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v99 = *(void *)(a1 + 32);
                  *(_DWORD *)buf = 138412802;
                  uint64_t v171 = v99;
                  __int16 v172 = 2112;
                  v173 = v96;
                  __int16 v174 = 2112;
                  id v175 = v97;
                  _os_log_impl(&dword_23FA42000, v98, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Trying to remove domain %@%@", buf, 0x20u);
                }

                v149[0] = MEMORY[0x263EF8330];
                v149[1] = 3221225472;
                v149[2] = __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_77;
                v149[3] = &unk_26507F7B0;
                v149[4] = *(void *)(a1 + 32);
                v149[5] = v96;
                objc_msgSend(v143, "br_removeDomain:sync:completionHandler:", v96, 1, v149);
              }
              uint64_t v93 = [obj countByEnumeratingWithState:&v150 objects:v169 count:16];
            }
            while (v93);
            id v4 = 0;
            uint64_t v74 = (char *)v132;
            id v7 = 0;
            uint64_t v72 = v140;
            __int16 v69 = v133;
          }
        }
      }
      v100 = (void *)MEMORY[0x263F055B8];
      uint64_t v101 = *(void *)(*(void *)(a1 + 32) + 128);
      uint64_t v102 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      uint64_t v103 = [NSURL fileURLWithPath:v69];
      id v148 = 0;
      LOBYTE(v100) = objc_msgSend(v100, "br_importDomain:forProviderIdentifier:fromDirectoryAtURL:error:", v101, v102, v103, &v148);
      id v80 = v148;

      if (v100)
      {
        __int16 v81 = 0;
      }
      else
      {
        uint64_t v104 = v73;
        int v105 = objc_msgSend(v80, "br_isCocoaErrorCode:", 3328);
        v106 = (void *)MEMORY[0x263F087E8];
        uint64_t v107 = *MEMORY[0x263F32360];
        if (v105)
        {
          uint64_t v167 = *MEMORY[0x263F08608];
          id v168 = v80;
          id v108 = [NSDictionary dictionaryWithObjects:&v168 forKeys:&v167 count:1];
          v109 = @"volume not supported by FPFS";
          v110 = v106;
          uint64_t v111 = v107;
          uint64_t v112 = 121;
        }
        else
        {
          uint64_t v165 = *MEMORY[0x263F08608];
          id v166 = v80;
          id v108 = [NSDictionary dictionaryWithObjects:&v166 forKeys:&v165 count:1];
          v109 = @"Can't import FPFS domain";
          v110 = v106;
          uint64_t v111 = v107;
          uint64_t v112 = 92;
        }
        __int16 v81 = objc_msgSend(v110, "br_errorWithDomain:code:userInfo:description:", v111, v112, v108, v109);

        uint64_t v73 = v104;
      }
    }
    else
    {
      uint64_t v76 = *(void *)(*(void *)(a1 + 32) + 128);
      uint64_t v77 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v147 = 0;
      char v78 = objc_msgSend(MEMORY[0x263F055B8], "br_addDomain:forProviderIdentifier:error:", v76, v77, &v147);
      id v79 = v147;
      id v80 = v79;
      uint64_t v73 = v61;
      if (v78)
      {
        __int16 v81 = 0;
        id v7 = 0;
        int v82 = v139;
LABEL_71:

        if (v81)
        {
          v114 = v72;
          id v146 = 0;
          v115 = [MEMORY[0x263F054C8] providerDomainWithID:v82 cachePolicy:0 error:&v146];
          id v116 = v146;
          if (!v116 && [v115 disconnectionState] == 6)
          {
            v134 = v69;
            v135 = v73;
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
              long long v117 = "importing";
            }
            else {
              long long v117 = "adding";
            }
            long long v118 = [NSString stringWithFormat:@"Failed %s domain. Device out of space for domain %@", v117, *(void *)(*(void *)(a1 + 32) + 128)];
            long long v119 = brc_bread_crumbs();
            long long v120 = brc_default_log();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v121 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138412802;
              uint64_t v171 = v121;
              __int16 v172 = 2112;
              v173 = v118;
              __int16 v174 = 2112;
              id v175 = v119;
              _os_log_impl(&dword_23FA42000, v120, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - %@%@", buf, 0x20u);
            }

            id obja = (id)MEMORY[0x263F087E8];
            uint64_t v144 = *MEMORY[0x263F32360];
            uint64_t v161 = *MEMORY[0x263F08608];
            v122 = (void *)[v81 copy];
            v162 = v122;
            [NSDictionary dictionaryWithObjects:&v162 forKeys:&v161 count:1];
            v124 = uint64_t v123 = a1;
            uint64_t v145 = objc_msgSend(obja, "br_errorWithDomain:code:userInfo:description:", v144, 85, v124, @"%@", v118);

            a1 = v123;
            uint64_t v125 = *(void *)(v123 + 32);
            v126 = *(void **)(v125 + 128);
            *(void *)(v125 + 128) = 0;

            __int16 v81 = (void *)v145;
            __int16 v69 = v134;
            uint64_t v73 = v135;
            int v82 = v139;
          }

          uint64_t v72 = v114;
        }
        uint64_t v127 = *(void *)(*(void *)(a1 + 64) + 8);
        v128 = *(void **)(v127 + 40);
        *(void *)(v127 + 40) = v81;

        goto LABEL_82;
      }
      id v7 = 0;
      if (objc_msgSend(v79, "br_isCocoaErrorCode:", 3328))
      {
        __int16 v83 = (void *)MEMORY[0x263F087E8];
        uint64_t v84 = *MEMORY[0x263F32360];
        uint64_t v163 = *MEMORY[0x263F08608];
        id v164 = v80;
        [NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
        __int16 v85 = v69;
        v87 = int v86 = v73;
        __int16 v81 = objc_msgSend(v83, "br_errorWithDomain:code:userInfo:description:", v84, 121, v87, @"volume not supported by FPFS");

        uint64_t v73 = v86;
        __int16 v69 = v85;
        uint64_t v72 = v140;
      }
      else
      {
        id v80 = v80;
        __int16 v81 = v80;
      }
    }
    int v82 = v139;
    goto LABEL_71;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
LABEL_83:
}

void __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] %@ - Cleaning up Ciconia failed: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_66(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 424) renameAndUnlinkInBackgroundItemAtPath:*(void *)(a1 + 40)] & 1) == 0&& !BRCRecursiveRemoveBelow(*(void **)(a1 + 40)))
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x263F32360], 99, 0, @"Found unknown account data on disk");
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

uint64_t __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v4;
}

void __88__BRCAccountSessionFPFS__addOrImportDomainIfNeededWithError_domainAdded_domainImported___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138413058;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v3;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] %@ - couldn't remove domain %@: %@%@", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - Successfully removed domain %@%@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)fixFileProviderDomainDecorations
{
  id v3 = objc_msgSend(MEMORY[0x263F055B8], "br_getDomainForCurrentPersonaWithError:", 0);
  if (v3)
  {
    uint64_t v4 = v3;
    objc_storeStrong((id *)&self->_fpDomain, v3);
    [(BRCAccountSessionFPFS *)self decorateUserInfoForFPFSDomain:self->_fpDomain withError:0];
    id v3 = v4;
  }
}

- (void)_createGroupContainerStageOfType:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (objc_msgSend(MEMORY[0x263F841B0], "br_isInSyncBubble"))
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS _createGroupContainerStageOfType:]();
    }
  }
  else
  {
    uint64_t v5 = [(BRCAccountSessionFPFS *)self groupContainerStagePathForCurrentPersonaFromStageType:v3];
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = 0;
    if (([v7 fileExistsAtPath:v5 isDirectory:0] & 1) == 0)
    {
      id v11 = 0;
      char v8 = [v7 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v11];
      uint64_t v6 = v11;
      if ((v8 & 1) == 0)
      {
        uint64_t v9 = brc_bread_crumbs();
        int v10 = brc_default_log();
        if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v13 = v5;
          __int16 v14 = 2112;
          id v15 = v6;
          __int16 v16 = 2112;
          id v17 = v9;
          _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to create directory at '%@'; %@%@",
            buf,
            0x20u);
        }
      }
    }
  }
}

- (void)_prepareGroupContainerLocations
{
}

- (void)_refreshRootsCache
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] New mobile documents dir = %@%@", (void)v3, DWORD2(v3));
}

- (void)_submitDelayedTelemetryEventIfNeeded:(id)a3 wait:(double)a4 withBlock:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v8];
  if (v10)
  {
    id v11 = (void *)MEMORY[0x263F08928];
    __int16 v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    __int16 v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    id v30 = 0;
    id v17 = [v11 unarchivedObjectOfClasses:v16 fromData:v10 error:&v30];
    id v18 = v30;

    if (v18)
    {
      int v19 = brc_bread_crumbs();
      char v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = v8;
        __int16 v32 = 2112;
        id v33 = v18;
        __int16 v34 = 2112;
        uint64_t v35 = v19;
        _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Error Unarchiving %@ - %@%@", location, 0x20u);
      }
    }
    else
    {
      objc_initWeak((id *)location, self);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __77__BRCAccountSessionFPFS__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke;
      v25[3] = &unk_265084200;
      objc_copyWeak(&v29, (id *)location);
      id v28 = v9;
      id v26 = v17;
      id v27 = v8;
      uint64_t v21 = MEMORY[0x2455D9A50](v25);
      uint64_t v22 = (void *)v21;
      if (a4 <= 0.0)
      {
        (*(void (**)(uint64_t))(v21 + 16))(v21);
      }
      else
      {
        dispatch_time_t v23 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
        uint64_t v24 = dispatch_get_global_queue(0, 0);
        dispatch_after(v23, v24, v22);
      }
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)location);
    }
  }
}

void __77__BRCAccountSessionFPFS__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    if (*((unsigned char *)v4 + 528) && !*((unsigned char *)v4 + 529))
    {
      objc_sync_exit(v4);

      if (!*((void *)v4 + 91))
      {
        __int16 v12 = brc_bread_crumbs();
        uint64_t v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          __77__BRCAccountSessionFPFS__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_2();
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v6 = (uint64_t *)(a1 + 40);
      id v14 = 0;
      char v8 = [v5 removeItemAtPath:v7 error:&v14];
      id v4 = v14;

      if (v8)
      {
        id v9 = brc_bread_crumbs();
        int v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __77__BRCAccountSessionFPFS__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_1();
        }
      }
      else
      {
        id v9 = brc_bread_crumbs();
        int v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = *v6;
          *(_DWORD *)buf = 138412802;
          uint64_t v16 = v11;
          __int16 v17 = 2112;
          id v18 = v4;
          __int16 v19 = 2112;
          char v20 = v9;
          _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Error while deleting %@ - %@%@", buf, 0x20u);
        }
      }
    }
    else
    {
      objc_sync_exit(v4);
    }
  }
}

- (void)_submitSessionOpenFailedTelemetryEventIfNeeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Checking if there is a need to submit ACCOUNT_SESSION_OPEN_ERROR telemetry%@", v2, v3, v4, v5, v6);
}

void __71__BRCAccountSessionFPFS__submitSessionOpenFailedTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = a2;
  if ([v4 count] != 1)
  {
    id v9 = brc_bread_crumbs();
    int v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __71__BRCAccountSessionFPFS__submitSessionOpenFailedTelemetryEventIfNeeded__block_invoke_cold_1();
    }
  }
  uint8_t v6 = [v4 objectForKey:@"Error"];
  id v7 = +[AppTelemetryTimeSeriesEvent newNSErrorEvent:33 eventGroupUUID:v5[58] value:v6];
  char v8 = [v5 analyticsReporter];

  [v8 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v7];
}

- (void)_submitDBCorruptionTelemetryEventIfNeeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Checking if there is a need to submit DB_RESET telemetry%@", v2, v3, v4, v5, v6);
}

void __66__BRCAccountSessionFPFS__submitDBCorruptionTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  if ([v4 count] != 2)
  {
    int v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __66__BRCAccountSessionFPFS__submitDBCorruptionTelemetryEventIfNeeded__block_invoke_cold_1();
    }
  }
  uint8_t v6 = [v4 objectForKey:@"Description"];
  id v7 = [v4 objectForKey:@"Error"];

  id v8 = +[AppTelemetryTimeSeriesEvent newDBResetEventWithError:v7 description:v6];
  id v9 = [v5 analyticsReporter];

  [v9 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v8];
}

- (void)_submitReimportDomainFailedTelemetryEventIfNeeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Checking if there is a need to submit reimport failed telemetry%@", v2, v3, v4, v5, v6);
}

void __74__BRCAccountSessionFPFS__submitReimportDomainFailedTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  if ([v4 count] != 2)
  {
    uint64_t v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __66__BRCAccountSessionFPFS__submitDBCorruptionTelemetryEventIfNeeded__block_invoke_cold_1();
    }
  }
  uint8_t v6 = [v4 objectForKey:@"Description"];
  id v7 = [v4 objectForKey:@"Error"];

  id v8 = +[AppTelemetryTimeSeriesEvent newReimportDomainFailureEventWithError:v7 description:v6];
  id v9 = [v5 analyticsReporter];
  [v9 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v8];

  int v10 = [v5 tapToRadarManager];

  [v10 requestTapToRadarWithTitle:@"Reimport domain on startup failed", @"Reimport domain on startup failed, need to verify that things got recovered correctly", MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], 1, @"it reset the database", v7 description keywords attachments sendFullLog displayReason triggerRootCause];
}

- (BOOL)openWithError:(id *)a3 pushWorkloop:(id)a4
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self->_isOpen)
  {
    uint64_t v103 = brc_bread_crumbs();
    uint64_t v104 = brc_default_log();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS openWithError:pushWorkloop:].cold.5();
    }
  }
  memset(v122, 0, sizeof(v122));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSessionFPFS openWithError:pushWorkloop:]", 1059, v122);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v126 = (const char *)v122[0];
    __int16 v127 = 2112;
    v128 = self;
    __int16 v129 = 2112;
    id v130 = v7;
    _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Opening session%@", buf, 0x20u);
  }

  id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v9;

  uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v11;

  uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v13;

  uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v15;

  __int16 v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v17;

  __int16 v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v19;

  uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v21;

  [(BRCAccountSessionFPFS *)self _createAccountSupportPathIfNeeded:self->_sessionDirPath protectParent:1];
  [(BRCAccountSessionFPFS *)self _createAccountSupportPathIfNeeded:self->_cacheDirPath protectParent:1];
  if (self->_cloudDocsFD == -1)
  {
    id v23 = [(NSString *)self->_sessionDirPath stringByDeletingLastPathComponent];
    int v24 = open((const char *)[v23 fileSystemRepresentation], 33028);
    self->_int cloudDocsFD = v24;
    if (v24 < 0)
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Unable to open file at path '%@' %{errno}d", v23, *__error()];
      objc_claimAutoreleasedReturnValue();
      uint64_t v107 = brc_bread_crumbs();
      id v108 = brc_default_log();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
      {
        v109 = brc_append_system_info_to_message();
        -[BRCAccountSessionFPFS openWithError:pushWorkloop:](v109, (uint64_t)v107, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v110 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSessionFPFS openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1084, v110);
    }
    uint64_t v25 = brc_bread_crumbs();
    id v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS openWithError:pushWorkloop:].cold.4((uint64_t)v23);
    }

    if (flock(self->_cloudDocsFD, 2) < 0)
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Unable to lock file at path '%@' %{errno}d", v23, *__error()];
      objc_claimAutoreleasedReturnValue();
      uint64_t v111 = brc_bread_crumbs();
      uint64_t v112 = brc_default_log();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_FAULT))
      {
        uint64_t v113 = brc_append_system_info_to_message();
        -[BRCAccountSessionFPFS openWithError:pushWorkloop:](v113, (uint64_t)v111, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v114 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSessionFPFS openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1088, v114);
    }
  }
  id v27 = [(NSURL *)self->_dbURL path];
  [(BRCAccountSessionFPFS *)self _createAccountSupportPathIfNeeded:v27 protectParent:0];

  [(BRCAccountSessionFPFS *)self _prepareGroupContainerLocations];
  id v28 = self->_dbURL;
  id v29 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke;
  block[3] = &unk_26507ED70;
  id v30 = v28;
  uint64_t v121 = v30;
  dispatch_async(v29, block);

  [(BRCAccountSessionFPFS *)self _setupSharedPackageExtensionsPlist];
  [(BRCAccountSessionFPFS *)self _setupThrottles];
  char v31 = objc_alloc_init(BRCVolume);
  volume = self->_volume;
  self->_volume = v31;

  [MEMORY[0x263F32570] clearAccountDescriptorCache];
  __int16 v119 = 0;
  id v118 = 0;
  BOOL v33 = [(BRCAccountSessionFPFS *)self _addOrImportDomainIfNeededWithError:&v118 domainAdded:(char *)&v119 + 1 domainImported:&v119];
  id v34 = v118;
  uint64_t v35 = v34;
  if (!v33)
  {
    if ((objc_msgSend(v34, "br_isCloudDocsErrorCode:", 85) & 1) != 0
      || (objc_msgSend(v35, "br_isCloudDocsErrorCode:", 92) & 1) != 0
      || (objc_msgSend(v35, "br_isCloudDocsErrorCode:", 99) & 1) != 0
      || (objc_msgSend(v35, "br_isCloudDocsErrorCode:", 116) & 1) != 0
      || objc_msgSend(v35, "br_isCloudDocsErrorCode:", 121))
    {
      id v93 = v35;
      if (v93)
      {
        uint64_t v94 = brc_bread_crumbs();
        uint64_t v95 = brc_default_log();
        if (os_log_type_enabled(v95, (os_log_type_t)0x90u))
        {
          uint64_t v97 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v126 = "-[BRCAccountSessionFPFS openWithError:pushWorkloop:]";
          __int16 v127 = 2080;
          if (!a3) {
            uint64_t v97 = "(ignored by caller)";
          }
          v128 = (BRCAccountSessionFPFS *)v97;
          __int16 v129 = 2112;
          id v130 = v93;
          __int16 v131 = 2112;
          v132 = v94;
          _os_log_error_impl(&dword_23FA42000, v95, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a3) {
        *a3 = v93;
      }
    }
    else
    {
      v98 = (void *)MEMORY[0x263F087E8];
      uint64_t v123 = *MEMORY[0x263F08608];
      __int16 v124 = v35;
      uint64_t v99 = [NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      objc_msgSend(v98, "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x263F32360], 81, v99, @"Can't create FPFS domain");
      id v93 = (id)objc_claimAutoreleasedReturnValue();

      if (v93)
      {
        v100 = brc_bread_crumbs();
        uint64_t v101 = brc_default_log();
        if (os_log_type_enabled(v101, (os_log_type_t)0x90u))
        {
          uint64_t v102 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v126 = "-[BRCAccountSessionFPFS openWithError:pushWorkloop:]";
          __int16 v127 = 2080;
          if (!a3) {
            uint64_t v102 = "(ignored by caller)";
          }
          v128 = (BRCAccountSessionFPFS *)v102;
          __int16 v129 = 2112;
          id v130 = v93;
          __int16 v131 = 2112;
          v132 = v100;
          _os_log_error_impl(&dword_23FA42000, v101, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a3) {
        *a3 = v93;
      }
    }

    goto LABEL_32;
  }
  if (![(BRCVolume *)self->_volume setupWithError:a3]
    || ([(BRCAccountSessionFPFS *)self _refreshRootsCache],
        uint64_t v36 = [[BRCStageRegistry alloc] initWithAccountSession:self], stageRegistry = self->_stageRegistry, self->_stageRegistry = v36, stageRegistry, [(BRCStageRegistry *)self->_stageRegistry open], buf[0] = 0, ![(BRCAccountSessionFPFS *)self openDBForNewDomain:(HIBYTE(v119) | v119) != 0 deviceIDChanged:buf withError:a3]))
  {
LABEL_32:
    BOOL v84 = 0;
    goto LABEL_33;
  }
  [(BRCAccountSessionFPFS *)self _markDBOpened];
  if (buf[0])
  {
    char v38 = +[BRCUserDefaults defaultsForMangledID:0];
    int v39 = [v38 shouldPurgeUploadsOnDeviceIDChange];

    if (v39) {
      [(BRCStageRegistry *)self->_stageRegistry purgeAllUploads];
    }
  }
  uint64_t v40 = [[BRCFairScheduler alloc] initWithWorkloop:self->_clientTruthWorkloop name:@"client-db"];
  fairClientDBScheduler = self->_fairClientDBScheduler;
  self->_fairClientDBScheduler = v40;

  uint64_t v42 = [[BRCDeadlineScheduler alloc] initWithName:@"com.apple.bird.main-scheduler" fairScheduler:self->_fairClientDBScheduler];
  defaultScheduler = self->_defaultScheduler;
  self->_defaultScheduler = v42;

  uint64_t v44 = [[BRCContainerScheduler alloc] initWithAccountSession:self pushWorkloop:v6];
  containerScheduler = self->_containerScheduler;
  self->_containerScheduler = v44;

  id v46 = [[BRCApplyScheduler alloc] initWithAccountSession:self];
  applyScheduler = self->_applyScheduler;
  self->_applyScheduler = v46;

  uint64_t v48 = [[BRCFSImporter alloc] initWithAccountSession:self];
  fsImporter = self->_fsImporter;
  self->_fsImporter = v48;

  char v50 = [[BRCFSUploader alloc] initWithAccountSession:self];
  fsUploader = self->_fsUploader;
  self->_fsUploader = v50;

  uint64_t v52 = [[BRCFSDownloader alloc] initWithAccountSession:self];
  fsDownloader = self->_fsDownloader;
  self->_fsDownloader = v52;

  char v54 = [[BRCSyncUpScheduler alloc] initWithAccountSession:self];
  syncUpScheduler = self->_syncUpScheduler;
  self->_syncUpScheduler = v54;

  char v56 = [[BRCNotificationManager alloc] initWithAccountSession:self];
  notificationManager = self->_notificationManager;
  self->_notificationManager = v56;

  uint64_t v58 = [[BRCSyncContextProvider alloc] initWithAccountSession:self];
  syncContextProvider = self->_syncContextProvider;
  self->_syncContextProvider = v58;

  uint64_t v60 = [[BRCNamedThrottleManager alloc] initWithDB:self->_clientDB];
  namedThrottleManager = self->_namedThrottleManager;
  self->_namedThrottleManager = v60;

  uint64_t v62 = [[BRCTapToRadarManager alloc] initWithNamedThrottleManager:self->_namedThrottleManager];
  tapToRadarManager = self->_tapToRadarManager;
  self->_tapToRadarManager = v62;

  int v64 = [[BRCDownloadTrackers alloc] initWithSession:self];
  downloadTrackers = self->_downloadTrackers;
  self->_downloadTrackers = v64;

  id v66 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v67 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.reset", v66);

  resetQueue = self->_resetQueue;
  self->_resetQueue = v67;

  __int16 v69 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v70 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.db.fixup", v69);

  dbFixupQueue = self->_dbFixupQueue;
  self->_dbFixupQueue = v70;

  dispatch_suspend((dispatch_object_t)self->_resetQueue);
  uint64_t v72 = +[BRCUserDefaults defaultsForMangledID:0];
  LODWORD(v69) = [v72 spotlightIndexingEnabled];

  if (v69)
  {
    uint64_t v73 = [[BRCRecentsEnumerator alloc] initWithAccountSession:self];
    recentsEnumerator = self->_recentsEnumerator;
    self->_recentsEnumerator = v73;
  }
  uint64_t v75 = objc_alloc_init(BRCUserNotification);
  userNotificatiouint64_t n = self->_userNotification;
  self->_userNotificatiouint64_t n = v75;

  [(BRCAccountSessionFPFS *)self _loadClientZonesFromDisk];
  uint64_t v77 = [MEMORY[0x263F325E0] cloudDocsMangledID];
  id v78 = [(BRCAccountSessionFPFS *)self getOrCreateAppLibraryAndPrivateZonesIfNecessary:v77];

  id v79 = [[BRCDiskSpaceReclaimer alloc] initWithAccountSession:self];
  diskReclaimer = self->_diskReclaimer;
  self->_diskReclaimer = v79;

  [(BRCContainerScheduler *)self->_containerScheduler setup];
  __int16 v81 = [MEMORY[0x263F325E0] cloudDocsMangledID];
  int v82 = [(BRCAccountSessionFPFS *)self getOrCreateAppLibraryAndPrivateZonesIfNecessary:v81];
  __int16 v83 = [v82 defaultClientZone];

  BOOL v84 = v83 != 0;
  if (v83)
  {
    __int16 v85 = [v83 defaultAppLibrary];
    if (!v85)
    {
      int v105 = brc_bread_crumbs();
      v106 = brc_default_log();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS openWithError:pushWorkloop:]();
      }
    }
    int v86 = [[BRCGlobalProgress alloc] initWithSession:self];
    globalProgress = self->_globalProgress;
    self->_globalProgress = v86;

    int v88 = [[BRCServerChangesApplier alloc] initWithAccountSession:self];
    serverChangesApplier = self->_serverChangesApplier;
    self->_serverChangesApplier = v88;

    uint64_t v90 = [[BRCAnalyticsReporter alloc] initWithSession:self];
    analyticsReporter = self->_analyticsReporter;
    self->_analyticsReporter = v90;

    [(BRCAccountSessionFPFS *)self _submitDBCorruptionTelemetryEventIfNeeded];
    [(BRCAccountSessionFPFS *)self _submitSessionOpenFailedTelemetryEventIfNeeded];
    [(BRCAccountSessionFPFS *)self _submitReimportDomainFailedTelemetryEventIfNeeded];
    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_165;
    v117[3] = &unk_265084AF8;
    v117[4] = self;
    [(BRCAccountSessionFPFS *)self fetchUserRecordIDWithCompletionHandler:v117];
    clientTruthWorkloop = self->_clientTruthWorkloop;
    v115[0] = MEMORY[0x263EF8330];
    v115[1] = 3221225472;
    v115[2] = __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_2;
    v115[3] = &unk_2650806E8;
    char v116 = v119;
    v115[4] = self;
    dispatch_async(clientTruthWorkloop, v115);
    +[BRCSQLBackedSet clearTempDatabases];
    self->_isOpeuint64_t n = 1;
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 4);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_33:
  __brc_leave_section(v122);

  return v84;
}

void __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x2455D97F0]();
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS openWithError:pushWorkloop:]_block_invoke", 1114, v14);
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v14[0];
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    char v20 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx including %@ in backup%@", buf, 0x20u);
  }

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x263EFF6B0];
  id v13 = 0;
  char v7 = [v5 setResourceValue:MEMORY[0x263EFFA80] forKey:v6 error:&v13];
  id v8 = v13;
  if ((v7 & 1) == 0)
  {
    id v9 = brc_bread_crumbs();
    int v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      __int16 v12 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      uint64_t v16 = (uint64_t)v12;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      char v20 = v9;
      _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to include '%@' from backups: %@%@", buf, 0x20u);
    }
  }
  __brc_leave_section(v14);
}

uint64_t __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_165(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 568) enablePushNotifications];
}

uint64_t __52__BRCAccountSessionFPFS_openWithError_pushWorkloop___block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 _sendFPFSImportStartTelemetryEvent];
  }
  else {
    return [v2 triggerFPFSImportFinishedTelemetryEventIfNeeded];
  }
}

- (void)_markDBOpened
{
  self->_isDBOpened = 1;
}

- (void)_pcsChainAllItemsWithActivity:(id)a3
{
  id v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_2();
  }

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_168;
  v7[3] = &unk_265084B48;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = &v10;
  [v4 enumerateAppLibraries:v7];
  if (!*((unsigned char *)v11 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_1();
    }
  }
  _Block_object_dispose(&v10, 8);
}

BOOL __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_168(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 containerMetadata];
  if (([v4 isDocumentScopePublic] & 1) == 0)
  {

LABEL_11:
    BOOL v12 = 1;
    goto LABEL_12;
  }
  id v5 = [v3 defaultClientZone];
  char v6 = [v5 isSyncBlocked];

  if (v6) {
    goto LABEL_11;
  }
  char v7 = [v3 mangledID];
  id v8 = +[BRCUserDefaults defaultsForMangledID:v7];
  int v9 = [v8 aggressivelyPCSChainWithSession:*(void *)(a1 + 32)];

  if (!v9) {
    goto LABEL_11;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      uint64_t v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_168_cold_1();
      }
    }
    BOOL v12 = 0;
  }
  else
  {
    id v14 = [v3 db];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    void v40[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_169;
    v40[3] = &unk_26507F1E8;
    v40[4] = *(void *)(a1 + 32);
    uint64_t v15 = [v3 documentsFolderItemID];
    uint64_t v16 = [v3 defaultClientZone];
    __int16 v17 = [v16 dbRowID];
    id v18 = (void *)[v14 fetchObject:v40, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND zone_rowid = %@ AND item_filename != '.Trash' AND pcs_state NOT IN (2, 3) LIMIT 1", v15, v17 sql];

    BOOL v12 = v18 == 0;
    if (v18)
    {
      __int16 v19 = [[BRCPCSChainingOperation alloc] initWithRootItem:v18 appLibrary:v3 sessionContext:*(void *)(a1 + 32) syncUpCallback:*(void *)(*(void *)(a1 + 32) + 608)];
      char v20 = objc_msgSend(MEMORY[0x263EFD780], "br_aggressiveChaining");
      [(_BRCOperation *)v19 setGroup:v20];

      [(BRCPCSChainingOperation *)v19 setQualityOfService:9];
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 160) serialQueue];
      uint64_t v22 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v21);

      dispatch_source_set_timer(v22, 0, 0x2540BE400uLL, 0xB2D05E00uLL);
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2;
      v36[3] = &unk_26507ED98;
      id v37 = *(id *)(a1 + 40);
      id v23 = v19;
      char v38 = v23;
      int v24 = v22;
      uint64_t v25 = v36;
      id v26 = v24;
      id v27 = v25;
      id v28 = v27;
      id v29 = v27;
      if (*MEMORY[0x263F32768])
      {
        id v29 = ((void (*)(void *))*MEMORY[0x263F32768])(v27);
      }
      dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v29);
      dispatch_source_set_event_handler(v26, v30);

      dispatch_resume(v26);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_176;
      v32[3] = &unk_265084B20;
      char v31 = v26;
      BOOL v33 = v31;
      objc_copyWeak(&v35, &location);
      id v34 = *(id *)(a1 + 40);
      [(BRCPCSChainingOperation *)v23 setPcsChainCompletionBlock:v32];
      [(_BRCOperation *)v23 schedule];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
  }
LABEL_12:

  return v12;
}

id __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_169(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newServerItemFromPQLResultSet:a2 error:a3];
  return v3;
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2(uint64_t a1)
{
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    [*(id *)(a1 + 40) cancel];
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      uint64_t v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, (os_log_type_t)0x90u)) {
        __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_cold_1();
      }
    }
  }
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_176(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = WeakRetained;
  if (v8 || !WeakRetained)
  {
    if ((objc_msgSend(v8, "brc_isCloudKitCancellationError") & 1) == 0
      && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      BOOL v12 = brc_bread_crumbs();
      char v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_176_cold_1();
      }
    }
  }
  else
  {
    if (v7)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      _DWORD v17[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_177;
      v17[3] = &unk_26507F7B0;
      void v17[4] = WeakRetained;
      id v18 = *(id *)(a1 + 40);
      [v7 addPreFlushDirectoryListCompletionBlock:v17];
      [v7 beginObservingChangesWithDelegate:0];
      uint64_t v11 = v18;
    }
    else
    {
      id v14 = WeakRetained[6];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_3;
      v15[3] = &unk_26507ED98;
      v15[4] = WeakRetained;
      id v16 = *(id *)(a1 + 40);
      dispatch_async(v14, v15);
      uint64_t v11 = v16;
    }
  }
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_177(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 48);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_178;
  v3[3] = &unk_26507ED98;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_178(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pcsChainAllItemsWithActivity:*(void *)(a1 + 40)];
}

uint64_t __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pcsChainAllItemsWithActivity:*(void *)(a1 + 40)];
}

- (id)_getPartiallySaltedItemWithAppLibrary:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v5 = [v4 defaultClientZone];
  if (!v4) {
    goto LABEL_4;
  }
  if ([v4 saltingState] != 2) {
    goto LABEL_4;
  }
  char v6 = [v4 rootItemID];
  id v7 = [v5 itemByItemID:v6];
  id v8 = [v7 asDirectory];

  if (!v8)
  {
LABEL_4:
    int v9 = [v5 db];
    uint64_t v10 = [v5 dbRowID];
    uint64_t v11 = (void *)[v9 fetch:@"SELECT item_id FROM server_items WHERE salting_state = 2 AND item_type IN (0, 9, 10) AND zone_rowid = %@ LIMIT 1", v10];

    if ([v11 next]
      && ([v11 objectOfClass:objc_opt_class() atIndex:0],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v13 = (void *)v12;
      id v14 = [v5 itemByItemID:v12];
      id v8 = [v14 asDirectory];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (void)_saltPartiallySaltedItemsWithActivity:(id)a3
{
  id v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);
}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2();
  }

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_186;
  v9[3] = &unk_265084B98;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  uint64_t v12 = &v13;
  [v4 enumerateAppLibraries:v9];
  if (!*((unsigned char *)v14 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_1();
    }
  }
  _Block_object_dispose(&v13, 8);
}

BOOL __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_186(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 defaultClientZone];
  if ([v4 isSyncBlocked]) {
    goto LABEL_12;
  }
  id v5 = [v3 mangledID];
  uint64_t v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  if (![v6 finishSaltingPartiallySaltedDirectories]
    || ([v4 enhancedDrivePrivacyEnabled] & 1) == 0)
  {

    goto LABEL_12;
  }
  char v7 = [v4 isBusy];

  if (v7)
  {
LABEL_12:
    BOOL v10 = 1;
    goto LABEL_13;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      id v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_186_cold_1();
      }
    }
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 40) _getPartiallySaltedItemWithAppLibrary:v3];
    objc_initWeak(&location, *(id *)(a1 + 40));
    BOOL v10 = v12 == 0;
    if (v12)
    {
      uint64_t v13 = [BRCSaltingBatchOperation alloc];
      id v14 = objc_loadWeakRetained(&location);
      uint64_t v15 = [(BRCSaltingBatchOperation *)v13 initWithParentItem:v12 sessionContext:v14];

      char v16 = objc_msgSend(MEMORY[0x263EFD780], "br_partialSaltingCompletion");
      [(_BRCOperation *)v15 setGroup:v16];

      [(_BRCOperation *)v15 setNonDiscretionary:1];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_188;
      v18[3] = &unk_265084B70;
      objc_copyWeak(&v22, &location);
      id v19 = v12;
      id v17 = v4;
      id v20 = v17;
      id v21 = *(id *)(a1 + 32);
      [(BRCSaltingBatchOperation *)v15 setMetadataCompletionBlock:v18];
      [v17 addOutOfBandOperation:v15];
      [(_BRCOperation *)v15 schedule];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v22);
    }
    objc_destroyWeak(&location);
  }
LABEL_13:

  return v10;
}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_188(id *a1, int a2, int a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v10 = [WeakRetained analyticsReporter];
    uint64_t v11 = [a1[4] itemID];
    uint64_t v12 = [v11 debugItemIDString];
    uint64_t v13 = [a1[5] mangledID];
    id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "enhancedDrivePrivacyEnabled"));
    [v10 aggregateReportForAppTelemetryIdentifier:42 itemID:v12 zoneMangledID:v13 enhancedDrivePrivacyEnabled:v14 error:v7];

    uint64_t v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v18 = a1[4];
      *(_DWORD *)buf = 138413314;
      id v25 = v18;
      __int16 v26 = 1024;
      int v27 = a2;
      __int16 v28 = 1024;
      int v29 = a3;
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      BOOL v33 = v15;
      _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished metadata salting a batch for item %@ when completed: %d validation: %d error: %@%@", buf, 0x2Cu);
    }

    if (!v7
      || (objc_msgSend(v7, "brc_isSaltingError") & 1) != 0
      || (a3 & 1) != 0
      || objc_msgSend(v7, "brc_isCloudKitCancellationError"))
    {
      id v17 = v9[6];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_190;
      v19[3] = &unk_26507EE10;
      id v20 = v7;
      id v21 = a1[5];
      id v22 = v9;
      id v23 = a1[6];
      dispatch_async(v17, v19);
    }
  }
}

uint64_t __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_190(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitCancellationError") & 1) == 0) {
    [*(id *)(a1 + 40) scheduleSyncDown];
  }
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 _saltPartiallySaltedItemsWithActivity:v3];
}

- (unsigned)_recoverAndReportBoosting
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__BRCAccountSessionFPFS__recoverAndReportBoosting__block_invoke;
  v5[3] = &unk_265084BC0;
  v5[4] = &v6;
  [(BRCAccountSessionFPFS *)self enumerateAppLibraries:v5];
  id v3 = +[AppTelemetryTimeSeriesEvent newSyncBoostingProblemCountWithProblemCount:*((unsigned int *)v7 + 6)];
  [(BRCAnalyticsReporter *)v2->_analyticsReporter postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v3];
  LODWORD(v2) = *((_DWORD *)v7 + 6);

  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __50__BRCAccountSessionFPFS__recoverAndReportBoosting__block_invoke(uint64_t a1, void *a2)
{
  if (([a2 integrityCheckBoosting] & 1) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return 1;
}

- (unsigned)_recoverAndReportBrokenShareOptions
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(BRCPQLConnection *)self->_clientDB fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci LEFT JOIN server_items AS si ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE ci.zone_rowid != ci.item_parent_zone_rowid AND (ci.item_sharing_options & 4) = 0 AND (si.item_id IS NULL OR item_id_is_root(si.item_parent_id))"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__BRCAccountSessionFPFS__recoverAndReportBrokenShareOptions__block_invoke;
  v20[3] = &unk_26507F1E8;
  id v18 = self;
  id v19 = v3;
  void v20[4] = self;
  id v4 = [v3 enumerateObjects:v20];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x2455D97F0]();
        uint64_t v12 = [v10 clientZone];
        int v13 = [v12 isSharedZone];

        if (v13)
        {
          id v14 = brc_bread_crumbs();
          uint64_t v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v26 = v10;
            __int16 v27 = 2112;
            __int16 v28 = v14;
            _os_log_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is missing a shareID%@", buf, 0x16u);
          }

          objc_msgSend(v10, "setSharingOptions:", objc_msgSend(v10, "sharingOptions") | 4);
          [v10 markForceNeedsSyncUp];
          [v10 saveToDB];
          uint64_t v7 = (v7 + 1);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v16 = +[AppTelemetryTimeSeriesEvent newCorruptSharingOptionsProblemWithProblemCount:v7];
  [(BRCAnalyticsReporter *)v18->_analyticsReporter postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v16];

  return v7;
}

id __60__BRCAccountSessionFPFS__recoverAndReportBrokenShareOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (unsigned)_reportBasehashSalting
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = [(BRCPQLConnection *)self->_clientDB fetch:@"SELECT COUNT(*), child.item_id, child.zone_rowid FROM server_items AS child INNER JOIN server_items AS parent ON child.item_parent_id = parent.item_id AND child.zone_rowid = parent.zone_rowid WHERE IFNULL(child.basehash_salt_validation_key, 0) != IFNULL(validation_key(parent.child_basehash_salt), 0) AND LENGTH(child.item_filename) > 0 AND child.item_type != 3 AND (parent.salting_state = 3 OR child.basehash_salt_validation_key IS NOT NULL)"];
  if (([v3 next] & 1) == 0)
  {
    __int16 v32 = brc_bread_crumbs();
    BOOL v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS _reportBasehashSalting]();
    }
  }
  int v4 = [v3 intAtIndex:0];
  if (v4)
  {
    id v5 = [v3 objectOfClass:objc_opt_class() atIndex:1];
    uint64_t v6 = [v3 numberAtIndex:2];
    uint64_t v7 = [(BRCAccountSessionFPFS *)self serverZoneByRowID:v6];
    uint64_t v36 = [v7 mangledID];

    uint64_t v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [v5 debugItemIDString];
      *(_DWORD *)buf = 67109634;
      int v41 = v4;
      __int16 v42 = 2112;
      uint64_t v43 = v10;
      __int16 v44 = 2112;
      uint64_t v45 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Found %d items with basehash salting issues example itemID %@%@", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v36 = 0;
    id v5 = 0;
  }
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke;
  v39[3] = &unk_26507F148;
  v39[4] = self;
  uint64_t v11 = MEMORY[0x2455D9A50](v39);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke_200;
  v38[3] = &unk_26507F148;
  v38[4] = self;
  uint64_t v12 = (void *)MEMORY[0x2455D9A50](v38);
  clientDB = self->_clientDB;
  id v37 = (void *)v11;
  id v14 = (void *)MEMORY[0x2455D9A50](v11);
  uint64_t v15 = (void *)MEMORY[0x2455D9A50](v12);
  id v16 = [(BRCPQLConnection *)clientDB fetch:@"SELECT COUNT(*), item_id, zone_rowid FROM server_items AS child WHERE item_id_is_app_library_root(child.item_parent_id) AND IFNULL(child.basehash_salt_validation_key, 0) != IFNULL(call_block(%p, child.item_parent_id), 0) AND LENGTH(child.item_filename) > 0 AND child.item_type != 3 AND (call_block(%p, child.item_parent_id) = 3 OR child.basehash_salt_validation_key IS NOT NULL)", v14, v15];

  if (([v16 next] & 1) == 0)
  {
    uint64_t v34 = brc_bread_crumbs();
    id v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS _reportBasehashSalting]();
    }
  }
  int v17 = [v16 intAtIndex:0];
  uint64_t v18 = (v17 + v4);
  if (v17)
  {
    int v19 = v17;
    id v20 = [v16 objectOfClass:objc_opt_class() atIndex:1];

    long long v21 = [v16 numberAtIndex:2];
    long long v22 = [(BRCAccountSessionFPFS *)self serverZoneByRowID:v21];
    long long v23 = [v22 mangledID];

    long long v24 = brc_bread_crumbs();
    id v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = [v20 debugItemIDString];
      *(_DWORD *)buf = 67109890;
      int v41 = v19;
      __int16 v42 = 2112;
      uint64_t v43 = v26;
      __int16 v44 = 2112;
      uint64_t v45 = v23;
      __int16 v46 = 2112;
      uint64_t v47 = v24;
      _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Found %d items parented to root with basehash salting issues example itemID %@ zone %@%@", buf, 0x26u);
    }
  }
  else
  {
    long long v23 = v36;
    id v20 = v5;
  }
  __int16 v27 = brc_bread_crumbs();
  __int16 v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    [(BRCAccountSessionFPFS *)(uint64_t)v27 _reportBasehashSalting];
  }

  int v29 = [v20 itemIDString];
  id v30 = +[AppTelemetryTimeSeriesEvent newBasehashSaltingProblemCountWithProblemCount:v18 mangledID:v23 itemIDString:v29];

  [(BRCAnalyticsReporter *)self->_analyticsReporter postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v30];
  return v18;
}

void __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v6 = +[BRCItemID newFromSqliteValue:*a4];
  if (([v6 isNonDesktopRoot] & 1) == 0)
  {
    int v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCZoneRootItem initWithZoneRootItemID:session:]();
    }
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 appLibraryRowID];
  int v9 = [v7 appLibraryByRowID:v8];
  BOOL v10 = [v9 childBasehashSalt];
  uint64_t v11 = objc_msgSend(v10, "brc_truncatedSHA256");

  id v12 = v11;
  sqlite3_result_blob(a2, (const void *)[v12 bytes], objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __47__BRCAccountSessionFPFS__reportBasehashSalting__block_invoke_200(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v6 = +[BRCItemID newFromSqliteValue:*a4];
  if (([v6 isNonDesktopRoot] & 1) == 0)
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCZoneRootItem initWithZoneRootItemID:session:]();
    }
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 appLibraryRowID];
  int v9 = [v7 appLibraryByRowID:v8];
  int v10 = [v9 saltingState];

  sqlite3_result_int(a2, v10);
}

- (unsigned)_recoverAndReportDanglingLostZombieDirectories
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(BRCPQLConnection *)self->_clientDB fetch:@"SELECT ci1.rowid, ci1.zone_rowid, ci1.item_id, ci1.item_creator_id, ci1.item_sharing_options, ci1.item_side_car_ckinfo, ci1.item_parent_zone_rowid, ci1.item_localsyncupstate, ci1.item_local_diffs, ci1.item_notifs_rank, ci1.app_library_rowid, ci1.item_min_supported_os_rowid, ci1.item_user_visible, ci1.item_stat_ckinfo, ci1.item_state, ci1.item_type, ci1.item_mode, ci1.item_birthtime, ci1.item_lastusedtime, ci1.item_favoriterank,ci1.item_parent_id, ci1.item_filename, ci1.item_hidden_ext, ci1.item_finder_tags, ci1.item_xattr_signature, ci1.item_trash_put_back_path, ci1.item_trash_put_back_parent_id, ci1.item_alias_target, ci1.item_creator, ci1.item_processing_stamp, ci1.item_bouncedname, ci1.item_scope, ci1.item_local_change_count, ci1.item_old_version_identifier, ci1.fp_creation_item_identifier, ci1.version_name, ci1.version_ckinfo, ci1.version_mtime, ci1.version_size, ci1.version_thumb_size, ci1.version_thumb_signature, ci1.version_content_signature, ci1.version_xattr_signature, ci1.version_edited_since_shared, ci1.version_device, ci1.version_conflict_loser_etags, ci1.version_quarantine_info, ci1.version_uploaded_assets, ci1.version_upload_error, ci1.version_old_zone_item_id, ci1.version_old_zone_rowid, ci1.version_local_change_count, ci1.version_old_version_identifier, ci1.item_live_conflict_loser_etags, ci1.item_file_id, ci1.item_generation FROM client_items AS ci1                             LEFT JOIN client_items AS ci2                             ON ci2.version_old_zone_item_id = ci1.item_id AND ci2.version_old_zone_rowid = ci1.zone_rowid                             WHERE ci2.version_old_zone_rowid IS NULL                               AND ci2.version_old_zone_item_id IS NULL                               AND ci1.item_state = -3                               AND ci1.item_type IN (0, 9, 10)"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__BRCAccountSessionFPFS__recoverAndReportDanglingLostZombieDirectories__block_invoke;
  v19[3] = &unk_26507F1E8;
  void v19[4] = self;
  int v4 = [v3 enumerateObjects:v19];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    LODWORD(v7) = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x2455D97F0]();
        if (([v10 isDirectory] & 1) == 0)
        {
          id v18 = v3;
          int v13 = brc_bread_crumbs();
          id v14 = brc_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v13;
            _os_log_fault_impl(&dword_23FA42000, v14, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: zombieItem.isDirectory%@", buf, 0xCu);
          }

          id v3 = v18;
        }
        [v10 markRemovedFromFilesystemRecursively:1];
        [v10 markForceNeedsSyncUp];
        [v10 markForceNotify];
        id v12 = [v10 asDirectory];
        [v12 forceSignalPropagationToChildren];

        [v10 saveToDB];
        ++v9;
      }
      while (v6 != v9);
      uint64_t v7 = (v7 + v6);
      uint64_t v15 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
      uint64_t v6 = v15;
    }
    while (v15);

    if (v7)
    {
      id v16 = +[AppTelemetryTimeSeriesEvent newDanglingZombieProblemCountWithProblemCount:v7];
      [(BRCAnalyticsReporter *)self->_analyticsReporter postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v16];
    }
  }
  else
  {

    LODWORD(v7) = 0;
  }

  return v7;
}

id __71__BRCAccountSessionFPFS__recoverAndReportDanglingLostZombieDirectories__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (void)recoverAndReportContentPolicyWithCompletion:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  id v21[2] = 0x2020000000;
  int v22 = 0;
  id v5 = dispatch_group_create();
  [(BRCAccountSessionFPFS *)self hasOptimizeStorageEnabled];
  dispatch_group_enter(v5);
  uint64_t v6 = [MEMORY[0x263F054C0] defaultManager];
  uint64_t v7 = objc_msgSend(MEMORY[0x263F054B8], "br_fpItemIDFromItemIdentifier:", *MEMORY[0x263F053F0]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke;
  v18[3] = &unk_265084BE8;
  void v18[4] = self;
  long long v20 = v21;
  uint64_t v8 = v5;
  int v19 = v8;
  [v6 fetchItemForItemID:v7 completionHandler:v18];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_214;
  v15[3] = &unk_26507F0B0;
  uint64_t v9 = v8;
  id v16 = v9;
  int v17 = self;
  [(BRCAccountSessionFPFS *)self enumerateAppLibraries:v15];
  clientTruthWorkloop = self->_clientTruthWorkloop;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_217;
  block[3] = &unk_265084C38;
  id v13 = v4;
  id v14 = v21;
  id v11 = v4;
  dispatch_group_notify(v9, clientTruthWorkloop, block);

  _Block_object_dispose(v21, 8);
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 contentPolicy];
  id v4 = +[BRCQueryItemUtil sharedQueryItemUtil];
  uint64_t v5 = [v4 contentPolicyForRootContainerWithSessionContext:a1[4]];

  if (v5 != v3)
  {
    +[BRCImportUtil forceIngestionForItemID:*MEMORY[0x263F053F0] completionHandler:&__block_literal_global_212];
    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  }
  uint64_t v6 = a1[5];
  dispatch_group_leave(v6);
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_cold_1((uint64_t)v2);
  }
}

uint64_t __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_214(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  if ([v3 isCloudDocsAppLibrary]) {
    [v3 rootFileObjectID];
  }
  else {
  id v4 = [v3 documentsFolderFileObjectID];
  }
  uint64_t v5 = [MEMORY[0x263F054C0] defaultManager];
  uint64_t v6 = (void *)MEMORY[0x263F054B8];
  uint64_t v7 = [v4 asString];
  uint64_t v8 = objc_msgSend(v6, "br_fpItemIDFromItemIdentifier:", v7);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_215;
  uint64_t v14[3] = &unk_265084C10;
  int v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v3;
  uint64_t v16 = v9;
  id v17 = v4;
  id v18 = v10;
  id v11 = v4;
  id v12 = v3;
  [v5 fetchItemForItemID:v8 completionHandler:v14];

  return 1;
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_215(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 contentPolicy];
  int v4 = [*(id *)(a1 + 32) isCloudDocsAppLibrary];
  uint64_t v5 = +[BRCQueryItemUtil sharedQueryItemUtil];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v4) {
    +[BRCQueryItemInfo queryItemInfoForAppLibrary:v6];
  }
  else {
  uint64_t v7 = +[BRCQueryItemInfo queryItemInfoForDocumentsFolderWithAppLibrary:v6];
  }
  uint64_t v8 = [v5 contentPolicyForItemInfo:v7 sessionContext:*(void *)(a1 + 40)];

  if (v8 != v3)
  {
    uint64_t v9 = [*(id *)(a1 + 48) asString];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_3;
    v10[3] = &unk_26507EBD8;
    id v11 = *(id *)(a1 + 48);
    +[BRCImportUtil forceIngestionForItemID:v9 completionHandler:v10];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [*(id *)(a1 + 32) asString];
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Done Force Ingestion %@ container to update the contentPolicy - %@%@", (uint8_t *)&v7, 0x20u);
  }
}

uint64_t __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_217(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)_recoverAndReportStateIntegrityWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS _recoverAndReportStateIntegrityWithCompletion:]();
  }

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  int v7 = dispatch_group_create();
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
  clientDB = self->_clientDB;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke;
  v19[3] = &unk_265084C60;
  id v10 = v8;
  long long v21 = self;
  int v22 = v23;
  id v20 = v10;
  [(BRCPQLConnection *)clientDB performWithFlags:8 action:v19];
  if ([v10 integrityCheckContentPolicy])
  {
    dispatch_group_enter(v7);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_2;
    v16[3] = &unk_265084C88;
    void v16[4] = self;
    id v18 = v23;
    id v17 = v7;
    [(BRCAccountSessionFPFS *)self recoverAndReportContentPolicyWithCompletion:v16];
  }
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  id v13[2] = __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_3;
  uint64_t v13[3] = &unk_265084C38;
  id v14 = v4;
  id v15 = v23;
  id v12 = v4;
  dispatch_group_notify(v7, clientTruthWorkloop, v13);

  _Block_object_dispose(v23, 8);
}

uint64_t __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) dbIntegrityCheckMissingShareOptions]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) _recoverAndReportBrokenShareOptions];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckApplyJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 576) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckSyncUpJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 608) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckDownloadJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 600) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckUploadJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 592) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) integrityCheckBoosting]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) _recoverAndReportBoosting];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckBasehashSalting]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) _reportBasehashSalting];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckLostZombieDirectories]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) _recoverAndReportDanglingLostZombieDirectories];
  }
  return 1;
}

void __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_2(uint64_t a1, unsigned int a2)
{
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a2;
  objc_sync_exit(v4);

  uint64_t v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

uint64_t __71__BRCAccountSessionFPFS__recoverAndReportStateIntegrityWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)_cleanupOldCiconiaLocations
{
  if (self->_isDataSeparated)
  {
    id v6 = [MEMORY[0x263F325A0] cloudDocsAppSupportURL];
    id v3 = [v6 URLByAppendingPathComponent:@"ciconia"];
    if (!access((const char *)[v3 fileSystemRepresentation], 0))
    {
      fileUnlinker = self->_fileUnlinker;
      uint64_t v5 = [v3 path];
      [(BRCFileUnlinker *)fileUnlinker renameAndUnlinkInBackgroundItemAtPath:v5];
    }
  }
}

- (id)_prepareXPCActivityIdentifierWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F841B0] sharedManager];
  id v6 = [v5 currentPersona];
  int v7 = [v6 isDataSeparatedPersona];

  if (v7)
  {
    uint64_t v8 = NSString;
    __int16 v9 = [(BRCAccountSessionFPFS *)self volume];
    id v10 = [v8 stringWithFormat:@"%@-%d", v4, objc_msgSend(v9, "deviceID")];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (void)_registerBackgroundXPCActivities
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  objc_initWeak(location, self);
  id v4 = [(BRCAccountSessionFPFS *)self _prepareXPCActivityIdentifierWithName:@"com.apple.bird.aggressive-pcs-chain"];
  int v5 = [v3 aggressivelyPCSChainWithSession:self];
  id v6 = v4;
  int v7 = v6;
  uint64_t v8 = (void (**)(void *))MEMORY[0x263F32760];
  if (v5)
  {
    __int16 v9 = (const char *)[v6 UTF8String];
    id v10 = [v3 aggressivePCSChainActivity];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke;
    v38[3] = &unk_26507F7D8;
    objc_copyWeak(&v39, location);
    id v11 = v10;
    id v12 = v38;
    uint64_t v13 = v12;
    if (*v8)
    {
      uint64_t v14 = (*v8)(v12);

      uint64_t v13 = (void *)v14;
    }
    xpc_activity_unregister(v9);
    xpc_activity_register(v9, v11, v13);

    objc_destroyWeak(&v39);
  }
  else
  {
    id v15 = (const char *)[v6 UTF8String];
    id v16 = (id)*MEMORY[0x263EF8188];
    if (*v8)
    {
      id v17 = (*v8)(__block_literal_global_886);
    }
    else
    {
      id v17 = __block_literal_global_886;
    }
    xpc_activity_unregister(v15);
    xpc_activity_register(v15, v16, v17);
  }
  id v18 = [(BRCAccountSessionFPFS *)self _prepareXPCActivityIdentifierWithName:@"com.apple.bird.db-integrity-check"];
  int v19 = (const char *)[v18 UTF8String];
  id v20 = [v3 dbIntegrityCheckXPCActivity];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_240;
  v36[3] = &unk_26507F7D8;
  objc_copyWeak(&v37, location);
  id v21 = v20;
  int v22 = v36;
  long long v23 = v22;
  if (*v8)
  {
    uint64_t v24 = (*v8)(v22);

    long long v23 = (void *)v24;
  }
  xpc_activity_unregister(v19);
  xpc_activity_register(v19, v21, v23);

  id v25 = [(BRCAccountSessionFPFS *)self _prepareXPCActivityIdentifierWithName:@"com.apple.bird.finish-salting-partially-salted-directories"];
  __int16 v26 = (const char *)[v25 UTF8String];
  uint64_t v27 = [v3 finishSaltingPartiallySaltedDirectoriesActivity];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_248;
  uint64_t v33[3] = &unk_265084CD8;
  id v28 = v3;
  id v34 = v28;
  objc_copyWeak(&v35, location);
  id v29 = v27;
  id v30 = v33;
  id v31 = v30;
  if (*v8)
  {
    uint64_t v32 = (*v8)(v30);

    id v31 = (void *)v32;
  }
  xpc_activity_unregister(v26);
  xpc_activity_register(v26, v29, v31);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(location);
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3)) {
        goto LABEL_23;
      }
      int v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v5;
        _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }
    }
    if (xpc_activity_get_state(v3) == 2)
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        int v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
          __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_cold_4();
        }
      }
      __int16 v9 = +[BRCAccountsManager sharedManager];
      id v10 = [WeakRetained[13] acAccountID];
      id v11 = [v9 personaIdentifierForACAccountID:v10];

      if ([v11 isEqualToString:@"__defaultPersonaID__"]) {
        id v12 = 0;
      }
      else {
        id v12 = v11;
      }
      id v13 = v12;
      id v14 = v11;
      if (!v13)
      {
        if (_block_invoke___personaOnceToken_3 != -1) {
          dispatch_once(&_block_invoke___personaOnceToken_3, &__block_literal_global_234);
        }
        id v14 = (id)_block_invoke___personalPersona_3;
      }
      id v15 = [MEMORY[0x263F841B0] sharedManager];
      id v16 = [v15 currentPersona];

      id v30 = 0;
      id v17 = [v16 userPersonaUniqueString];
      id v18 = v17;
      if (v17 == v14 || ([v17 isEqualToString:v14] & 1) != 0)
      {
        int v19 = 0;
      }
      else
      {
        if (voucher_process_can_use_arbitrary_personas())
        {
          id v29 = 0;
          id v20 = (void *)[v16 copyCurrentPersonaContextWithError:&v29];
          id v21 = v29;
          id v22 = v30;
          id v30 = v20;

          if (v21)
          {
            long long v23 = brc_bread_crumbs();
            uint64_t v24 = brc_default_log();
            if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
              -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v21);
            }
          }
          int v19 = [v16 generateAndRestorePersonaContextWithPersonaUniqueString:v14];

          if (!v19) {
            goto LABEL_22;
          }
          id v25 = brc_bread_crumbs();
          __int16 v26 = brc_default_log();
          if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v32 = v11;
            __int16 v33 = 2112;
            id v34 = v19;
            __int16 v35 = 2112;
            uint64_t v36 = v25;
            _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
          }
        }
        else
        {
          if (v13 || ([v16 isDataSeparatedPersona] & 1) != 0)
          {
            uint64_t v27 = brc_bread_crumbs();
            id v28 = brc_default_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              __br_notify_register_dispatch_block_invoke_cold_3();
            }

            int v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
            goto LABEL_22;
          }
          id v25 = brc_bread_crumbs();
          __int16 v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_4();
          }
          int v19 = 0;
        }
      }
LABEL_22:
      [WeakRetained _pcsChainAllItemsWithActivity:v3];

      _BRRestorePersona();
    }
  }
LABEL_23:
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_232()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke___personalPersona_3;
  _block_invoke___personalPersona_3 = v0;
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_240(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    int v5 = WeakRetained[6];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_2;
    v6[3] = &unk_26507ED98;
    v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async_and_wait(v5, v6);
  }
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = +[BRCAccountsManager sharedManager];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 104) acAccountID];
  id v4 = [v2 personaIdentifierForACAccountID:v3];

  if ([v4 isEqualToString:@"__defaultPersonaID__"]) {
    int v5 = 0;
  }
  else {
    int v5 = v4;
  }
  id v6 = v5;
  id v7 = v4;
  if (!v6)
  {
    if (_block_invoke_2___personaOnceToken_0 != -1) {
      dispatch_once(&_block_invoke_2___personaOnceToken_0, &__block_literal_global_242);
    }
    id v7 = (id)_block_invoke_2___personalPersona_0;
  }
  uint64_t v8 = [MEMORY[0x263F841B0] sharedManager];
  __int16 v9 = [v8 currentPersona];

  id v28 = 0;
  id v10 = [v9 userPersonaUniqueString];
  id v11 = v10;
  if (v10 == v7 || ([v10 isEqualToString:v7] & 1) != 0)
  {
    id v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v27 = 0;
    id v16 = (void *)[v9 copyCurrentPersonaContextWithError:&v27];
    id v17 = v27;
    id v18 = v28;
    id v28 = v16;

    if (v17)
    {
      int v19 = brc_bread_crumbs();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v17);
      }
    }
    id v12 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

    if (v12)
    {
      id v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v30 = v4;
        __int16 v31 = 2112;
        uint64_t v32 = v12;
        __int16 v33 = 2112;
        id v34 = v21;
        _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:
    }
  }
  else
  {
    if (!v6 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      id v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      id v12 = 0;
      goto LABEL_32;
    }
    long long v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
  }
LABEL_11:
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 4))
  {
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v13;
      _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't continue activity%@", buf, 0xCu);
    }
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_243;
  v25[3] = &unk_265084CB0;
  id v15 = *(void **)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  [v15 _recoverAndReportStateIntegrityWithCompletion:v25];

  _BRRestorePersona();
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_3()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke_2___personalPersona_0;
  _block_invoke_2___personalPersona_0 = v0;
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_243(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    uint64_t v1 = brc_bread_crumbs();
    id v2 = brc_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = v1;
      _os_log_impl(&dword_23FA42000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't finish activity%@", (uint8_t *)&v3, 0xCu);
    }
  }
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_248(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v3 = a2;
  if ([*(id *)(a1 + 32) finishSaltingPartiallySaltedDirectories])
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      if (xpc_activity_should_defer(v3))
      {
        if (xpc_activity_set_state(v3, 3)) {
          goto LABEL_24;
        }
        uint64_t v5 = brc_bread_crumbs();
        id v6 = brc_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = v5;
          _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
        }
      }
      if (xpc_activity_get_state(v3) == 2)
      {
        if (!xpc_activity_set_state(v3, 4))
        {
          id v7 = brc_bread_crumbs();
          uint64_t v8 = brc_default_log();
          if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
            __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_248_cold_4();
          }
        }
        __int16 v9 = +[BRCAccountsManager sharedManager];
        id v10 = [WeakRetained[13] acAccountID];
        id v11 = [v9 personaIdentifierForACAccountID:v10];

        if ([v11 isEqualToString:@"__defaultPersonaID__"]) {
          id v12 = 0;
        }
        else {
          id v12 = v11;
        }
        id v13 = v12;
        id v14 = v11;
        if (!v13)
        {
          if (_block_invoke_3___personaOnceToken_0 != -1) {
            dispatch_once(&_block_invoke_3___personaOnceToken_0, &__block_literal_global_251);
          }
          id v14 = (id)_block_invoke_3___personalPersona_0;
        }
        id v15 = [MEMORY[0x263F841B0] sharedManager];
        id v16 = [v15 currentPersona];

        id v30 = 0;
        id v17 = [v16 userPersonaUniqueString];
        id v18 = v17;
        if (v17 == v14 || ([v17 isEqualToString:v14] & 1) != 0)
        {
          int v19 = 0;
        }
        else
        {
          if (voucher_process_can_use_arbitrary_personas())
          {
            id v29 = 0;
            id v20 = (void *)[v16 copyCurrentPersonaContextWithError:&v29];
            id v21 = v29;
            id v22 = v30;
            id v30 = v20;

            if (v21)
            {
              long long v23 = brc_bread_crumbs();
              uint64_t v24 = brc_default_log();
              if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
                -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v21);
              }
            }
            int v19 = [v16 generateAndRestorePersonaContextWithPersonaUniqueString:v14];

            if (!v19) {
              goto LABEL_23;
            }
            id v25 = brc_bread_crumbs();
            id v26 = brc_default_log();
            if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v32 = v11;
              __int16 v33 = 2112;
              id v34 = v19;
              __int16 v35 = 2112;
              uint64_t v36 = v25;
              _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
            }
          }
          else
          {
            if (v13 || ([v16 isDataSeparatedPersona] & 1) != 0)
            {
              id v27 = brc_bread_crumbs();
              id v28 = brc_default_log();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
                __br_notify_register_dispatch_block_invoke_cold_3();
              }

              int v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
              goto LABEL_23;
            }
            id v25 = brc_bread_crumbs();
            id v26 = brc_default_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
              __br_notify_register_dispatch_block_invoke_cold_4();
            }
            int v19 = 0;
          }
        }
LABEL_23:
        [WeakRetained _saltPartiallySaltedItemsWithActivity:v3];

        _BRRestorePersona();
      }
    }
LABEL_24:
  }
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_249()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke_3___personalPersona_0;
  _block_invoke_3___personalPersona_0 = v0;
}

- (void)_fixupItemsAtStartup
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx fixing up items%@");
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 clientZone];
  uint64_t v5 = [v3 changeState];
  char v6 = [v5 hasNeverSyncedDown];

  if ((v6 & 1) == 0)
  {
    id v7 = [v3 changeState];
    unint64_t v8 = [v7 clientRequestID];

    unint64_t v9 = [v4 currentRequestID];
    if (v8 >= v9)
    {
      unint64_t v10 = v9;
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v16 = [v4 mangledID];
        int v17 = 138413058;
        id v18 = v16;
        __int16 v19 = 2048;
        unint64_t v20 = v8;
        __int16 v21 = 2048;
        unint64_t v22 = v10;
        __int16 v23 = 2112;
        uint64_t v24 = v11;
        _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Will acknowledge the last sync down again for %@ (server:%lld, client:%lld)%@", (uint8_t *)&v17, 0x2Au);
      }
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v14 = [v4 mangledID];
  LODWORD(v13) = [v13 mangledIDIsPendingMigration:v14];

  if (v13)
  {
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }

  return 1;
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_254(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2;
        v11[3] = &unk_26507F2F8;
        void v11[4] = v9;
        [v3 performWithFlags:8 action:v11];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 40) + 200) nextRank];
  return 1;
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) allocateRanksWhenCaughtUp:1];
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v13 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        memset(v14, 0, sizeof(v14));
        __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _fixupItemsAtStartup]_block_invoke_3", 2012, v14);
        uint64_t v8 = brc_bread_crumbs();
        uint64_t v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v20 = v14[0];
          __int16 v21 = 2112;
          unint64_t v22 = v7;
          __int16 v23 = 2112;
          uint64_t v24 = v8;
          _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Acknowledge the last sync down again for %@%@", buf, 0x20u);
        }

        unint64_t v10 = *(void **)(*(void *)(a1 + 40) + 576);
        id v11 = [v7 changeState];
        objc_msgSend(v10, "didSyncDownZone:requestID:upToRank:caughtUpWithServer:", v7, objc_msgSend(v11, "clientRequestID"), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0);

        __brc_leave_section(v14);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v4);
  }

  return 1;
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_255(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 state] & 2) != 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_257(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _fixupItemsAtStartup]_block_invoke_2", 2037, v21);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_257_cold_1();
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) scheduleSyncDown];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v8 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_258;
  v16[3] = &unk_265084D50;
  uint64_t v9 = *(void *)(a1 + 56);
  void v16[4] = v8;
  void v16[5] = v9;
  [v8 enumerateServerZones:v16];
  unint64_t v10 = *(void **)(a1 + 48);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  id v13[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_259;
  uint64_t v13[3] = &unk_265084D78;
  id v11 = v10;
  uint64_t v12 = *(void *)(a1 + 40);
  id v14 = v11;
  uint64_t v15 = v12;
  [v11 groupInBatch:v13];

  __brc_leave_section(v21);
}

uint64_t __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_258(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) rescheduleSuspendedJobsMatching:v3 inState:16];
  if ([v3 hasFetchedRecentsAndFavorites])
  {
    [*(id *)(*(void *)(a1 + 32) + 592) rescheduleJobsPendingRecentsAndFavoritesFetchInZone:v3];
    [*(id *)(*(void *)(a1 + 32) + 600) rescheduleJobsPendingRecentsAndFavoritesFetchInZone:v3];
  }
  if ([v3 isSharedZone])
  {
    id v4 = [v3 clientZone];
    uint64_t v5 = [v4 asSharedClientZone];
    [v5 removeAllShareAcceptationSidefaults];
  }
  return 1;
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_259(uint64_t a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v45 = a2;
  id v3 = (void *)[*(id *)(a1 + 32) fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_localsyncupstate = 7"];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_3_263;
  v57[3] = &unk_26507F1E8;
  uint64_t v46 = a1;
  v57[4] = *(void *)(a1 + 40);
  id v4 = [v3 enumerateObjects:v57];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        unint64_t v10 = (void *)MEMORY[0x2455D97F0]();
        id v11 = [v9 asDocument];
        [v11 reIngestFromFileProvider];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v6);
  }

  uint64_t v12 = (void *)[*(id *)(*(void *)(v46 + 40) + 160) fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND item_min_supported_os_rowid IS NULL AND NOT EXISTS (SELECT 1 FROM client_sync_up AS su WHERE su.throttle_id = ci.rowid AND su.throttle_state != 0)"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_4;
  v52[3] = &unk_26507F1E8;
  v52[4] = *(void *)(v46 + 40);
  uint64_t v43 = v12;
  id v13 = [v12 enumerateObjects:v52];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v16 = 0;
    uint64_t v17 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v53 + 1) + 8 * j);
        long long v20 = (void *)MEMORY[0x2455D97F0]();
        __int16 v21 = brc_bread_crumbs();
        unint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          int v64 = v19;
          __int16 v65 = 2112;
          id v66 = v21;
          _os_log_fault_impl(&dword_23FA42000, v22, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ is missing a sync up throttle%@", buf, 0x16u);
        }

        uint64_t v23 = [v19 clientZone];
        uint64_t v24 = [v23 dbRowID];
        [v19 markLatestSyncRequestFailedInZone:v24];

        if ([v19 isSharedToMeChildItem])
        {
          [v19 markLatestSyncRequestFailedInZone:&unk_26F3DD4A8];
          [*(id *)(*(void *)(v46 + 40) + 568) scheduleSyncUpForSideCar];
          char v16 = 1;
        }
        if ([v19 isSharedToMeTopLevelItem])
        {
          uint64_t v25 = [v19 parentClientZone];
          uint64_t v26 = [v25 dbRowID];
          [v19 markLatestSyncRequestFailedInZone:v26];
        }
        [v19 saveToDB];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v15);
  }
  else
  {
    char v16 = 0;
  }

  id v27 = (void *)[*(id *)(*(void *)(v46 + 40) + 160) fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci LEFT JOIN client_sync_up AS su ON su.throttle_id = ci.rowid AND su.zone_rowid = ci.zone_rowid LEFT JOIN client_uploads AS cu ON cu.throttle_id = ci.rowid AND cu.zone_rowid = ci.zone_rowid WHERE ci.item_localsyncupstate = 3 AND ci.item_type IN (1, 6) AND (IFNULL(cu.throttle_state, 0) = 0 OR (cu.throttle_state = 31 AND IFNULL(su.throttle_state, 0) = 0))"];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_271;
  uint64_t v47[3] = &unk_26507F1E8;
  v47[4] = *(void *)(v46 + 40);
  __int16 v44 = v27;
  id v28 = [v27 enumerateObjects:v47];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v28);
        }
        __int16 v33 = *(void **)(*((void *)&v48 + 1) + 8 * k);
        id v34 = (void *)MEMORY[0x2455D97F0]();
        __int16 v35 = brc_bread_crumbs();
        uint64_t v36 = brc_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          int v64 = v33;
          __int16 v65 = 2112;
          id v66 = v35;
          _os_log_fault_impl(&dword_23FA42000, v36, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has a corrupt upload throttle%@", buf, 0x16u);
        }

        uint64_t v37 = [v33 asDocument];
        [v37 markNeedsReading];

        [v33 saveToDB];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v30);
  }

  if ((v16 & 1) == 0)
  {
    char v38 = [*(id *)(*(void *)(v46 + 40) + 568) sideCarSyncPersistedState];
    char v39 = [v38 needsSync];

    if ((v39 & 1) == 0)
    {
      uint64_t v40 = (void *)[*(id *)(*(void *)(v46 + 40) + 160) numberWithSQL:@"SELECT throttle_id FROM client_sync_up WHERE zone_rowid = %@ AND throttle_state != 0", &unk_26F3DD4A8];
      if ([v40 BOOLValue])
      {
        int v41 = brc_bread_crumbs();
        __int16 v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_259_cold_1((uint64_t)v40);
        }

        [*(id *)(*(void *)(v46 + 40) + 568) scheduleSyncUpForSideCar];
      }
    }
  }
}

id __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_3_263(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

id __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

id __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_271(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (void)resumeIfNecessary
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: qos_class_self() == QOS_CLASS_UTILITY%@", v2, v3, v4, v5, v6);
}

uint64_t __42__BRCAccountSessionFPFS_resumeIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 640) maxNotifRankWasFlushed];
}

- (void)waitForUploadsToCompleteInSyncBubbleWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BRCAccountsManager sharedManager];
  char v6 = [v5 isInSyncBubble];

  if (v6)
  {
    uint64_t v7 = [(BRCAccountSessionFPFS *)self appLibraries];
    uint64_t v8 = [[BRCUploadAllFilesTrackerOperation alloc] initWithSession:self appLibraries:v7];
    [(_BRCFrameworkOperation *)v8 setIgnoreMissingRemoteClientProxy:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__BRCAccountSessionFPFS_waitForUploadsToCompleteInSyncBubbleWithReply___block_invoke;
    v10[3] = &unk_265082400;
    id v11 = v4;
    [(_BRCOperation *)v8 setFinishBlock:v10];
    [(BRCAccountSessionFPFS *)self addMiscOperation:v8];
    [(_BRCOperation *)v8 schedule];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F32360] code:122 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

uint64_t __71__BRCAccountSessionFPFS_waitForUploadsToCompleteInSyncBubbleWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateAccountStatus
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_accountIsReady = 0;
  objc_sync_exit(obj);
}

- (BRCAccountWaitOperation)accountWaitOperation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_accountIsReady)
  {
    uint64_t v3 = 0;
  }
  else
  {
    accountWaitOperatiouint64_t n = v2->_accountWaitOperation;
    if (!accountWaitOperation)
    {
      uint64_t v5 = [(BRCAccountSessionFPFS *)v2 syncContextProvider];
      char v6 = [v5 defaultSyncContext];
      uint64_t v7 = [v6 ckContainer];

      uint64_t v8 = [[BRCAccountWaitOperation alloc] initWithCKContainer:v7];
      uint64_t v9 = v2->_accountWaitOperation;
      v2->_accountWaitOperatiouint64_t n = v8;

      objc_initWeak(&location, v2);
      unint64_t v10 = [(BRCAccountSessionFPFS *)v2 syncClientZoneErrorThrottle];
      [(_BRCOperation *)v2->_accountWaitOperation setOperationFailureThrottle:v10];

      id v11 = [(_BRCOperation *)v2->_accountWaitOperation operationFailureThrottle];

      if (!v11)
      {
        uint64_t v15 = brc_bread_crumbs();
        char v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSessionFPFS accountWaitOperation]();
        }
      }
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      long long v19 = __45__BRCAccountSessionFPFS_accountWaitOperation__block_invoke;
      long long v20 = &unk_265082C58;
      objc_copyWeak(&v21, &location);
      [(_BRCOperation *)v2->_accountWaitOperation setFinishBlock:&v17];
      uint64_t v12 = objc_msgSend(v7, "privateCloudDatabase", v17, v18, v19, v20);
      id v13 = [v12 operationQueue];
      [v13 addOperation:v2->_accountWaitOperation];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      accountWaitOperatiouint64_t n = v2->_accountWaitOperation;
    }
    uint64_t v3 = accountWaitOperation;
  }
  objc_sync_exit(v2);

  return v3;
}

void __45__BRCAccountSessionFPFS_accountWaitOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = WeakRetained;
    objc_sync_enter(v2);
    *((unsigned char *)v2 + 488) = 1;
    uint64_t v3 = (void *)*((void *)v2 + 62);
    *((void *)v2 + 62) = 0;

    objc_sync_exit(v2);
    id WeakRetained = v4;
  }
}

- (id)fetchAccountWaitOperationWithAccountReady:(BOOL *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (a3) {
    *a3 = v4->_accountIsReady;
  }
  if (v4->_accountIsReady) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4->_accountWaitOperation;
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)captureSessionOpenFailedInfoWithError:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(NSString, "br_accountSessionOpenErrorInfoPath");
  unint64_t v22 = @"Error";
  uint64_t v5 = v3;
  if (!v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorAccountSessionOpenFailed");
  }
  v23[0] = v5;
  char v6 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  if (!v3) {

  }
  id v15 = 0;
  uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v8 = v15;
  if (!v7)
  {
    uint64_t v9 = brc_bread_crumbs();
    unint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_fault_impl(&dword_23FA42000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode session open failed info %@: %@%@", buf, 0x20u);
    }
  }
  id v11 = [MEMORY[0x263F08850] defaultManager];
  int v12 = [v11 createFileAtPath:v4 contents:v7 attributes:0];

  if (v12)
  {
    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
    }
  }
  else
  {
    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS captureSessionOpenFailedInfoWithError:]((uint64_t)v4);
    }
  }
}

- (void)captureDBCorruptionInfoWithDescription:(id)a3 error:(id)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ((objc_msgSend(v6, "br_isCloudDocsErrorCode:", 99) & 1) == 0)
  {
    uint64_t v7 = objc_msgSend(NSString, "br_corruptedDBInfoPath");
    if (objc_msgSend(v6, "br_isCloudDocsErrorCode:", 100))
    {
      uint64_t v8 = objc_msgSend(NSString, "br_reimportDomainErrorInfoPath");

      uint64_t v7 = (void *)v8;
    }
    v26[0] = @"Description";
    v26[1] = @"Error";
    v27[0] = v5;
    uint64_t v9 = v6;
    if (!v6)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorCorruptedDB");
    }
    v27[1] = v9;
    unint64_t v10 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    if (!v6) {

    }
    id v19 = 0;
    id v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v19];
    id v12 = v19;
    if (!v11)
    {
      id v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v12;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_fault_impl(&dword_23FA42000, v14, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode corruption info %@: %@%@", buf, 0x20u);
      }
    }
    id v15 = [MEMORY[0x263F08850] defaultManager];
    int v16 = [v15 createFileAtPath:v7 contents:v11 attributes:0];

    if (v16)
    {
      uint64_t v17 = brc_bread_crumbs();
      __int16 v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v10;
        __int16 v24 = 2112;
        uint64_t v25 = v17;
        _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v17 = brc_bread_crumbs();
      __int16 v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSessionFPFS captureSessionOpenFailedInfoWithError:]((uint64_t)v7);
      }
    }
  }
}

- (void)close
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx cancelling _defaultScheduler...%@");
}

uint64_t __30__BRCAccountSessionFPFS_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

uint64_t __30__BRCAccountSessionFPFS_close__block_invoke_287(uint64_t a1, void *a2)
{
  return 1;
}

- (void)closeAndResetLocalStateWithDescription:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSessionFPFS closeAndResetLocalStateWithDescription:error:]", 2671, v17);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v17[0];
    __int16 v20 = 2112;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Resetting local state%@", buf, 0x20u);
  }

  clientDB = self->_clientDB;
  id v11 = self->_accountHandler;
  if (!self->_resumed)
  {
    resetQueue = self->_resetQueue;
    if (resetQueue)
    {
      dispatch_resume(resetQueue);
      id v15 = self->_resetQueue;
    }
    else
    {
      id v15 = 0;
    }
    self->_resetQueue = 0;

    if (!clientDB) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (clientDB)
  {
LABEL_12:
    [(BRCAccountSessionFPFS *)self close];
    goto LABEL_13;
  }
  id v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSessionFPFS closeAndResetLocalStateWithDescription:error:]();
  }

LABEL_13:
  [(BRCAccountSessionFPFS *)self stopDBWatcher];
  [(BRCAccountSessionFPFS *)self captureDBCorruptionInfoWithDescription:v6 error:v7];
  BRCRecursiveRemove(self->_cacheDirPath);
  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  if (!clientDB) {
    [(BRCAccountSessionFPFS *)self close];
  }
  self->_BOOL isCancelled = 0;
  accountHandler = self->_accountHandler;
  self->_accountHandler = v11;

  __brc_leave_section(v17);
}

- (void)_validatePersona
{
  OUTLINED_FUNCTION_12();
  uint64_t v4 = *MEMORY[0x263EF8340];
  os_log_t v1 = brc_append_system_info_to_message();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v0, v2, "[CRIT] %@%@", v3);
}

- (BOOL)_recursivelyPrepareFolderForLogOutAtURL:(id)a3 pruneEmptyFolders:(BOOL)a4 pruneEmptyTopLevelFolder:(BOOL)a5 maxDepth:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v93 = a4;
  v114[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  unint64_t v10 = v9;
  if (a6)
  {
    if (v9)
    {
      BOOL v80 = v7;
      id v11 = [MEMORY[0x263F08850] defaultManager];
      id v12 = +[BRCUserDefaults defaultsForMangledID:0];
      int v13 = [v12 maxRelativePathDepth];

      uint64_t v14 = *MEMORY[0x263EFF6F0];
      uint64_t v84 = *MEMORY[0x263EFF6A8];
      v114[0] = *MEMORY[0x263EFF6A8];
      v114[1] = v14;
      uint64_t v94 = v14;
      uint64_t v15 = *MEMORY[0x263EFF700];
      uint64_t v92 = *MEMORY[0x263EFF6D0];
      v114[2] = *MEMORY[0x263EFF6D0];
      v114[3] = v15;
      uint64_t v95 = v15;
      int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:4];
      __int16 v81 = v11;
      int v82 = v10;
      uint64_t v17 = [v11 enumeratorAtURL:v10 includingPropertiesForKeys:v16 options:1 errorHandler:&__block_literal_global_296];

      __int16 v18 = +[BRCUserDefaults defaultsForMangledID:0];
      uint64_t v91 = [v18 uploadMaxFileSize];
      id v79 = v18;
      uint64_t v90 = [v18 uploadMaxPkgFileSize];
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id obj = v17;
      uint64_t v99 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
      if (v99)
      {
        unsigned int v88 = 2 * v13;
        unint64_t v83 = a6 - 1;
        uint64_t v97 = 0;
        uint64_t v98 = *(void *)v106;
        __int16 v89 = self;
        while (1)
        {
          for (uint64_t i = 0; i != v99; ++i)
          {
            if (*(void *)v106 != v98) {
              objc_enumerationMutation(obj);
            }
            __int16 v20 = *(void **)(*((void *)&v105 + 1) + 8 * i);
            uint64_t v100 = MEMORY[0x2455D97F0]();
            id v21 = +[BRCUserDefaults defaultsForMangledID:0];
            __int16 v22 = [v21 excludedFilenamesWorthPreserving];

            id v23 = +[BRCUserDefaults defaultsForMangledID:0];
            uint64_t v24 = [v23 excludedExtensionsWorthPreserving];

            uint64_t v25 = brc_bread_crumbs();
            uint64_t v26 = brc_default_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v110 = v20;
              __int16 v111 = 2112;
              uint64_t v112 = v25;
              _os_log_debug_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerate URL [%@]%@", buf, 0x16u);
            }

            if (objc_msgSend(v20, "br_isExternalDocumentReference"))
            {
              id v27 = brc_bread_crumbs();
              id v28 = brc_default_log();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                __int16 v67 = [v20 path];
                *(_DWORD *)buf = 138412546;
                v110 = v67;
                __int16 v111 = 2112;
                uint64_t v112 = v27;
                _os_log_debug_impl(&dword_23FA42000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] unlinking br security bookmark %@%@", buf, 0x16u);
              }
              fileUnlinker = self->_fileUnlinker;
              uint64_t v30 = [v20 path];
              [(BRCFileUnlinker *)fileUnlinker renameAndUnlinkInBackgroundItemAtPath:v30];

              uint64_t v31 = 0;
              uint64_t v32 = 0;
              __int16 v33 = 0;
              id v34 = 0;
              goto LABEL_55;
            }
            id v104 = 0;
            int v35 = [v20 getResourceValue:&v104 forKey:v95 error:0];
            id v36 = v104;
            id v34 = v36;
            if (v35 && [v36 BOOLValue])
            {
              uint64_t v37 = brc_bread_crumbs();
              char v38 = brc_default_log();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v74 = [v20 path];
                *(_DWORD *)buf = 138412546;
                v110 = v74;
                __int16 v111 = 2112;
                uint64_t v112 = v37;
                _os_log_debug_impl(&dword_23FA42000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] unlinking symlink %@%@", buf, 0x16u);
              }
              char v39 = self->_fileUnlinker;
              uint64_t v40 = [v20 path];
              [(BRCFileUnlinker *)v39 renameAndUnlinkInBackgroundItemAtPath:v40];

              uint64_t v31 = 0;
              uint64_t v32 = 0;
              __int16 v33 = 0;
              goto LABEL_55;
            }
            int v41 = [v20 path];
            int v42 = objc_msgSend(v41, "br_isExcludedButPreservedAtLogOutWithFilenames:extensions:", v22, v24);

            if (v42)
            {
              uint64_t v43 = brc_bread_crumbs();
              __int16 v44 = brc_default_log();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v73 = [v20 path];
                *(_DWORD *)buf = 138412546;
                v110 = v73;
                __int16 v111 = 2112;
                uint64_t v112 = v43;
                _os_log_debug_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping preserved item %@%@", buf, 0x16u);
              }
              uint64_t v31 = 0;
              uint64_t v32 = 0;
              goto LABEL_23;
            }
            id v103 = 0;
            int v46 = [v20 getResourceValue:&v103 forKey:v94 error:0];
            id v47 = v103;
            uint64_t v31 = v47;
            if (v46 && ([v47 BOOLValue] & 1) != 0)
            {
              uint64_t v32 = 0;
            }
            else
            {
              id v102 = 0;
              int v48 = [v20 getResourceValue:&v102 forKey:v92 error:0];
              id v49 = v102;
              uint64_t v32 = v49;
              if (!v48 || ![v49 BOOLValue]) {
                goto LABEL_35;
              }
            }
            long long v50 = [v20 path];
            uint64_t v51 = [v32 BOOLValue];
            if ([v32 BOOLValue]) {
              uint64_t v52 = v90;
            }
            else {
              uint64_t v52 = v91;
            }
            int v53 = objc_msgSend(v50, "br_isDocumentTooLargeForUpload:maxUploadDocumentSize:", v51, v52);

            if (v53)
            {
              uint64_t v43 = brc_bread_crumbs();
              __int16 v44 = brc_default_log();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                long long v54 = [v20 path];
                *(_DWORD *)buf = 138412546;
                v110 = v54;
                __int16 v111 = 2112;
                uint64_t v112 = v43;
                _os_log_debug_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping item too large to upload %@%@", buf, 0x16u);
              }
LABEL_23:
              id v45 = (void *)v100;

              __int16 v33 = 0;
LABEL_58:
              ++v97;
              goto LABEL_59;
            }
LABEL_35:
            if ([v31 BOOLValue] & 1) != 0 || (objc_msgSend(v32, "BOOLValue"))
            {
              __int16 v33 = 0;
LABEL_38:
              if (v93)
              {
                long long v55 = [v20 path];
                int v56 = objc_msgSend(v55, "br_isExcludedWithMaximumDepth:", v88);

                if (v56)
                {
                  uint64_t v57 = brc_bread_crumbs();
                  long long v58 = brc_default_log();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    [v20 path];
                    v59 = __int16 v85 = v57;
                    *(_DWORD *)buf = 138412546;
                    v110 = v59;
                    __int16 v111 = 2112;
                    uint64_t v112 = v85;
                    long long v60 = v58;
                    long long v61 = "[DEBUG] unlinking excluded item %@%@";
                    goto LABEL_53;
                  }
                  goto LABEL_54;
                }
                __int16 v65 = [v20 lastPathComponent];
                int v66 = [v65 isEqualToString:@".localized"];

                if (v66)
                {
                  uint64_t v57 = brc_bread_crumbs();
                  long long v58 = brc_default_log();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    [v20 path];
                    v59 = __int16 v85 = v57;
                    *(_DWORD *)buf = 138412546;
                    v110 = v59;
                    __int16 v111 = 2112;
                    uint64_t v112 = v85;
                    long long v60 = v58;
                    long long v61 = "[DEBUG] unlinking .localized file %@%@";
                    goto LABEL_53;
                  }
                  goto LABEL_54;
                }
                id v68 = [v20 lastPathComponent];
                uint64_t v69 = objc_msgSend(v68, "br_pathExtension");
                int v86 = [v69 isEqualToString:@"app"];

                if (v86)
                {
                  id v70 = [v20 path];
                  uint64_t v71 = BRCGetXattrValueForKeyOnPath(v70, @"com.apple.clouddocs.app-uploaded");

                  if (v71)
                  {
                    uint64_t v57 = brc_bread_crumbs();
                    long long v58 = brc_default_log();
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                    {
                      [v20 path];
                      v59 = __int16 v85 = v57;
                      *(_DWORD *)buf = 138412546;
                      v110 = v59;
                      __int16 v111 = 2112;
                      uint64_t v112 = v85;
                      long long v60 = v58;
                      long long v61 = "[DEBUG] unlinking uploaded .app file %@%@";
LABEL_53:
                      _os_log_debug_impl(&dword_23FA42000, v60, OS_LOG_TYPE_DEBUG, v61, buf, 0x16u);

                      uint64_t v57 = v85;
                    }
LABEL_54:

                    __int16 v87 = v89->_fileUnlinker;
                    uint64_t v72 = [v20 path];
                    [(BRCFileUnlinker *)v87 renameAndUnlinkInBackgroundItemAtPath:v72];

                    self = v89;
LABEL_55:
                    id v45 = (void *)v100;
                    goto LABEL_59;
                  }
                }
                self = v89;
              }
              id v45 = (void *)v100;
              goto LABEL_58;
            }
            id v101 = 0;
            int v62 = [v20 getResourceValue:&v101 forKey:v84 error:0];
            id v63 = v101;
            __int16 v33 = v63;
            if (!v62 || ([v63 BOOLValue] & 1) == 0) {
              goto LABEL_38;
            }
            BOOL v64 = [(BRCAccountSessionFPFS *)self _recursivelyPrepareFolderForLogOutAtURL:v20 pruneEmptyFolders:v93 pruneEmptyTopLevelFolder:0 maxDepth:v83];
            id v45 = (void *)v100;
            if (!v64) {
              goto LABEL_58;
            }
LABEL_59:
          }
          uint64_t v99 = [obj countByEnumeratingWithState:&v105 objects:v113 count:16];
          if (!v99) {
            goto LABEL_66;
          }
        }
      }
      uint64_t v97 = 0;
LABEL_66:

      LOBYTE(a6) = v97 == 0;
      unint64_t v10 = v82;
      if ((v93 || v80) && !v97)
      {
        uint64_t v76 = self->_fileUnlinker;
        uint64_t v77 = [v82 path];
        [(BRCFileUnlinker *)v76 renameAndUnlinkInBackgroundItemAtPath:v77];
      }
      uint64_t v75 = v81;
    }
    else
    {
      brc_bread_crumbs();
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v75 = brc_default_log();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS _recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:]();
      }
      LOBYTE(a6) = 0;
    }
  }
  return a6;
}

uint64_t __117__BRCAccountSessionFPFS__recursivelyPrepareFolderForLogOutAtURL_pruneEmptyFolders_pruneEmptyTopLevelFolder_maxDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = brc_bread_crumbs();
  BOOL v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    int v9 = 138412802;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_error_impl(&dword_23FA42000, v7, (os_log_type_t)0x90u, "[ERROR] Unable to enumerate URL [%@] with Error [%@]%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (void)_unlinkContainersWithRootURL:(id)a3 containers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (![(BRCAccountSessionFPFS *)self isOpen])
  {
    id v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS _unlinkContainersWithRootURL:containers:]();
    }
  }
  uint64_t v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS _unlinkContainersWithRootURL:containers:]();
  }

  id v10 = [MEMORY[0x263EFF980] array];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__BRCAccountSessionFPFS__unlinkContainersWithRootURL_containers___block_invoke;
  uint64_t v14[3] = &unk_26507F5B8;
  id v15 = v10;
  id v11 = v10;
  [(BRCAccountSessionFPFS *)self enumerateAppLibraries:v14];
  [(BRCAccountSessionFPFS *)self _unlinkContainersWithPristineContainerIDs:v11 containersActualRoot:v7 containers:v6];
}

uint64_t __65__BRCAccountSessionFPFS__unlinkContainersWithRootURL_containers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 containerMetadata];
  if ([v3 isInInitialState])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 identifier];
    [v4 addObject:v5];
  }
  return 1;
}

- (void)destroyLocalData
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS destroyLocalData]", 2958, v16);
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v16[0];
    __int16 v19 = 2112;
    __int16 v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx destroying local account data for %@%@", buf, 0x20u);
  }

  id v5 = dispatch_group_create();
  id v6 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INTERACTIVE, 0);
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v8 = dispatch_queue_create("com.apple.bird.destroy-account-data", v7);

  int v9 = (void *)os_transaction_create();
  [(BRCAccountSessionFPFS *)self _validatePersona];
  id v10 = self->_fileUnlinker;
  BRCRecursiveRemove(self->_cacheDirPath);
  cacheDirPath = self->_cacheDirPath;
  self->_cacheDirPath = 0;

  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  sessionDirPath = self->_sessionDirPath;
  self->_sessionDirPath = 0;

  dispatch_group_async(v5, v8, &__block_literal_global_308);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_309;
  uint64_t v14[3] = &unk_26507ED70;
  id v15 = v9;
  id v13 = v9;
  dispatch_group_notify(v5, v8, v14);

  __brc_leave_section(v16);
}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke()
{
  TCCAccessReset();
  uint64_t v0 = brc_bread_crumbs();
  os_log_t v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_cold_1();
  }
}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_309()
{
  uint64_t v0 = brc_bread_crumbs();
  os_log_t v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_309_cold_1();
  }
}

- (void)_loadClientZonesFromDisk
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx loading app libraries%@");
}

uint64_t __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v34 = a2;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3035, &v43);
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_2();
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [*(id *)(a1 + 32) _privateServerZonesEnumerator:v34];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
        id v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          int v48 = v9;
          __int16 v49 = 2112;
          long long v50 = v10;
          _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        [v9 setSession:*(void *)(a1 + 32)];
        id v12 = *(void **)(a1 + 40);
        id v13 = [v9 mangledID];
        [v12 setObject:v9 forKeyedSubscript:v13];

        uint64_t v14 = *(void **)(a1 + 48);
        id v15 = [v9 dbRowID];
        [v14 setObject:v9 forKeyedSubscript:v15];

        int v16 = *(void **)(a1 + 56);
        uint64_t v17 = [v9 dbRowID];
        [v16 addZoneRowID:v17];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v6);
  }

  __brc_leave_section(&v43);
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3046, &v43);
  uint64_t v18 = brc_bread_crumbs();
  __int16 v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_1();
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  __int16 v20 = [*(id *)(a1 + 32) _sharedServerZonesEnumerator:v34];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v36;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void **)(*((void *)&v35 + 1) + 8 * v23);
        uint64_t v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          int v48 = v24;
          __int16 v49 = 2112;
          long long v50 = v25;
          _os_log_debug_impl(&dword_23FA42000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        [v24 setSession:*(void *)(a1 + 32)];
        id v27 = *(void **)(a1 + 40);
        id v28 = [v24 mangledID];
        [v27 setObject:v24 forKeyedSubscript:v28];

        uint64_t v29 = *(void **)(a1 + 48);
        uint64_t v30 = [v24 dbRowID];
        [v29 setObject:v24 forKeyedSubscript:v30];

        uint64_t v31 = *(void **)(a1 + 56);
        uint64_t v32 = [v24 dbRowID];
        [v31 addZoneRowID:v32];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v21);
  }

  __brc_leave_section(&v43);
  return 1;
}

uint64_t __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_311(uint64_t a1, void *a2)
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  id v102 = a2;
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3064, v143);
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_311_cold_4();
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v5 = [*(id *)(a1 + 32) _privateClientZonesEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v132 objects:v142 count:16];
  if (v6)
  {
    id context = *(id *)v133;
    uint64_t v105 = *MEMORY[0x263F32360];
    id obj = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(id *)v133 != context) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v132 + 1) + 8 * i);
        int v9 = (void *)MEMORY[0x2455D97F0]();
        id v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded client zone: %@%@", buf, 0x16u);
        }

        [v8 setSession:*(void *)(a1 + 32)];
        [v8 setDelegate:*(void *)(*(void *)(a1 + 32) + 568)];
        id v12 = *(void **)(a1 + 40);
        id v13 = [v8 dbRowID];
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];

        if (v14)
        {
          if ([v14 isPrivateZone])
          {
            id v15 = [v14 zoneName];
            int v16 = [v8 zoneName];
            char v17 = [v15 isEqual:v16];

            if (v17)
            {
              [v8 associateWithServerZone:v14 offline:*(unsigned __int8 *)(*(void *)(a1 + 32) + 121)];
              goto LABEL_20;
            }
          }
          uint64_t v18 = brc_bread_crumbs();
          __int16 v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2112;
            v141 = v18;
            _os_log_fault_impl(&dword_23FA42000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneNames mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          __int16 v20 = [MEMORY[0x263F087E8] errorWithDomain:v105 code:77 userInfo:0];
          [*(id *)(a1 + 32) dbBecameCorruptedWithDescription:@"Zone names mistmatch" error:v20];
        }
        uint64_t v21 = brc_bread_crumbs();
        uint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring client zone because it's missing a server zone%@", buf, 0xCu);
        }

        uint64_t v23 = *(void **)(a1 + 48);
        uint64_t v24 = [v8 dbRowID];
        [v23 addZoneRowID:v24];

        uint64_t v14 = 0;
LABEL_20:
      }
      id v5 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v132 objects:v142 count:16];
    }
    while (v6);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3090, v143);
  uint64_t v25 = brc_bread_crumbs();
  uint64_t v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_311_cold_3();
  }

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v27 = [*(id *)(a1 + 32) _sharedClientZonesEnumerator];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v128 objects:v139 count:16];
  if (v28)
  {
    uint64_t obja = *(void *)v129;
    uint64_t v106 = *MEMORY[0x263F32360];
    id v103 = v27;
    do
    {
      uint64_t v29 = 0;
      id contexta = (id)v28;
      do
      {
        if (*(void *)v129 != obja) {
          objc_enumerationMutation(v103);
        }
        uint64_t v30 = *(void **)(*((void *)&v128 + 1) + 8 * (void)v29);
        uint64_t v31 = (void *)MEMORY[0x2455D97F0]();
        uint64_t v32 = brc_bread_crumbs();
        __int16 v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v32;
          _os_log_debug_impl(&dword_23FA42000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded shared client zone: %@%@", buf, 0x16u);
        }

        [v30 setSession:*(void *)(a1 + 32)];
        [v30 setDelegate:*(void *)(*(void *)(a1 + 32) + 568)];
        id v34 = *(void **)(a1 + 40);
        long long v35 = [v30 dbRowID];
        long long v36 = [v34 objectForKeyedSubscript:v35];

        if (v36)
        {
          if ([v36 isSharedZone])
          {
            long long v37 = [v36 zoneName];
            long long v38 = [v30 zoneName];
            if ([v37 isEqual:v38])
            {
              long long v39 = [v36 ownerName];
              long long v40 = [v30 ownerName];
              char v41 = [v39 isEqual:v40];

              if (v41)
              {
                [v30 associateWithServerZone:v36 offline:*(unsigned __int8 *)(*(void *)(a1 + 32) + 121)];
                goto LABEL_43;
              }
            }
            else
            {
            }
          }
          long long v42 = brc_bread_crumbs();
          uint64_t v43 = brc_default_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v30;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v36;
            *(_WORD *)&buf[22] = 2112;
            v141 = v42;
            _os_log_fault_impl(&dword_23FA42000, v43, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneName or ownerss mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          uint64_t v44 = [MEMORY[0x263F087E8] errorWithDomain:v106 code:78 userInfo:0];
          [*(id *)(a1 + 32) dbBecameCorruptedWithDescription:@"Zone names or owners mismatch" error:v44];
        }
        uint64_t v45 = brc_bread_crumbs();
        int v46 = brc_default_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl(&dword_23FA42000, v46, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring shared client zone because it's missing a server zone%@", buf, 0xCu);
        }

        id v47 = *(void **)(a1 + 48);
        int v48 = [v30 dbRowID];
        [v47 addZoneRowID:v48];

        long long v36 = 0;
LABEL_43:

        uint64_t v29 = (char *)v29 + 1;
      }
      while (contexta != v29);
      id v27 = v103;
      uint64_t v28 = [v103 countByEnumeratingWithState:&v128 objects:v139 count:16];
    }
    while (v28);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3118, buf);
  __int16 v49 = brc_bread_crumbs();
  long long v50 = brc_default_log();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS _loadClientZonesFromDisk]();
  }

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v51 = [*(id *)(a1 + 32) _appLibrariesEnumerator:v102];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v124 objects:v138 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v125;
    id contextb = v51;
    do
    {
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v125 != v53) {
          objc_enumerationMutation(contextb);
        }
        long long v55 = *(void **)(*((void *)&v124 + 1) + 8 * j);
        int v56 = (void *)MEMORY[0x2455D97F0]();
        uint64_t v57 = brc_bread_crumbs();
        long long v58 = brc_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412546;
          *(void *)&v143[4] = v55;
          *(_WORD *)&v143[12] = 2112;
          *(void *)&v143[14] = v57;
          _os_log_debug_impl(&dword_23FA42000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded app library: %@%@", v143, 0x16u);
        }

        long long v59 = *(void **)(a1 + 40);
        long long v60 = [v55 zoneRowID];
        long long v61 = [v59 objectForKeyedSubscript:v60];
        int v62 = [v61 clientZone];
        id v63 = [v62 asPrivateClientZone];

        if (v63)
        {
          [v55 associateWithClientZone:v63 offline:*(unsigned __int8 *)(*(void *)(a1 + 32) + 121)];
          BOOL v64 = [v55 appLibraryID];
          if ([v55 wasMovedToCloudDocs])
          {
            if ([v63 isCloudDocsZone])
            {
LABEL_64:
              if (!*(unsigned char *)(*(void *)(a1 + 32) + 121)
                && [v55 containerMetadataNeedsSyncUp])
              {
                [v55 scheduleContainerMetadataSyncUp];
              }
              id v70 = *(void **)(a1 + 56);
              __int16 v65 = [v55 dbRowID];
              [v70 setObject:v55 forKeyedSubscript:v65];
              goto LABEL_68;
            }
          }
          else
          {
            int v66 = [v63 zoneName];
            char v67 = [v66 isEqualToString:v64];

            if (v67) {
              goto LABEL_64;
            }
          }
          id v68 = brc_bread_crumbs();
          uint64_t v69 = brc_default_log();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v143 = 138412290;
            *(void *)&v143[4] = v68;
            _os_log_fault_impl(&dword_23FA42000, v69, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibrary.wasMovedToCloudDocs ? clientZone.isCloudDocsZone : [clientZone.zoneName isEqualToString:appLibraryID]%@", v143, 0xCu);
          }

          goto LABEL_64;
        }
        BOOL v64 = brc_bread_crumbs();
        __int16 v65 = brc_default_log();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412290;
          *(void *)&v143[4] = v64;
          _os_log_debug_impl(&dword_23FA42000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring app library because it's missing a client zone%@", v143, 0xCu);
        }
LABEL_68:
      }
      uint64_t v51 = contextb;
      uint64_t v52 = [contextb countByEnumeratingWithState:&v124 objects:v138 count:16];
    }
    while (v52);
  }

  __brc_leave_section((uint64_t *)buf);
  brc_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 216));
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _loadClientZonesFromDisk]_block_invoke", 3152, buf);
  uint64_t v71 = brc_bread_crumbs();
  uint64_t v72 = brc_default_log();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_311_cold_1();
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v73 = [*(id *)(a1 + 64) allValues];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v120 objects:v137 count:16];
  if (v74)
  {
    uint64_t v107 = *(void *)v121;
    id v104 = v73;
    do
    {
      uint64_t objb = v74;
      for (uint64_t k = 0; k != objb; ++k)
      {
        if (*(void *)v121 != v107) {
          objc_enumerationMutation(v104);
        }
        uint64_t v76 = *(void **)(*((void *)&v120 + 1) + 8 * k);
        id contextc = (id)MEMORY[0x2455D97F0]();
        uint64_t v77 = [v76 clientZone];
        if (!v77)
        {
LABEL_80:
          __int16 v81 = brc_bread_crumbs();
          int v82 = brc_default_log();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v143 = 138412546;
            *(void *)&v143[4] = v76;
            *(_WORD *)&v143[12] = 2112;
            *(void *)&v143[14] = v81;
            _os_log_impl(&dword_23FA42000, v82, OS_LOG_TYPE_DEFAULT, "[WARNING] dropping %@ because it's missing its client zone or app library%@", v143, 0x16u);
          }
          goto LABEL_96;
        }
        if ([v76 isPrivateZone])
        {
          id v78 = [v76 clientZone];
          id v79 = [v78 asPrivateClientZone];
          char v80 = [v79 hasDefaultAppLibrary];

          if ((v80 & 1) == 0) {
            goto LABEL_80;
          }
        }
        else
        {
        }
        __int16 v81 = [v76 clientZone];
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 121))
        {
          unint64_t v83 = brc_bread_crumbs();
          uint64_t v84 = brc_default_log();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v143 = 138412546;
            *(void *)&v143[4] = v81;
            *(_WORD *)&v143[12] = 2112;
            *(void *)&v143[14] = v83;
            _os_log_debug_impl(&dword_23FA42000, v84, OS_LOG_TYPE_DEBUG, "[DEBUG] activating %@%@", v143, 0x16u);
          }

          [v81 resume];
        }
        __int16 v85 = *(void **)(a1 + 48);
        int v86 = [v76 dbRowID];
        [v85 removeZoneRowID:v86];

        __int16 v87 = *(void **)(*(void *)(a1 + 32) + 368);
        unsigned int v88 = [v76 dbRowID];
        [v87 setObject:v76 forKeyedSubscript:v88];

        if ([v76 isSharedZone])
        {
          int v82 = [v76 mangledID];
          [*(id *)(*(void *)(a1 + 32) + 376) setObject:v76 forKeyedSubscript:v82];
          [*(id *)(*(void *)(a1 + 32) + 384) setObject:v81 forKeyedSubscript:v82];
        }
        else
        {
          __int16 v89 = *(void **)(*(void *)(a1 + 32) + 392);
          uint64_t v90 = [v76 zoneName];
          [v89 setObject:v76 forKeyedSubscript:v90];

          uint64_t v91 = *(void **)(*(void *)(a1 + 32) + 400);
          uint64_t v92 = [v81 zoneName];
          [v91 setObject:v81 forKeyedSubscript:v92];

          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          BOOL v93 = [v81 asPrivateClientZone];
          int v82 = [v93 appLibraries];

          uint64_t v94 = [v82 countByEnumeratingWithState:&v116 objects:v136 count:16];
          if (v94)
          {
            uint64_t v95 = *(void *)v117;
            do
            {
              for (uint64_t m = 0; m != v94; ++m)
              {
                if (*(void *)v117 != v95) {
                  objc_enumerationMutation(v82);
                }
                uint64_t v97 = *(void **)(*((void *)&v116 + 1) + 8 * m);
                uint64_t v98 = *(void **)(*(void *)(a1 + 32) + 360);
                uint64_t v99 = [v97 dbRowID];
                [v98 setObject:v97 forKeyedSubscript:v99];
              }
              uint64_t v94 = [v82 countByEnumeratingWithState:&v116 objects:v136 count:16];
            }
            while (v94);
          }
        }
LABEL_96:
      }
      uint64_t v73 = v104;
      uint64_t v74 = [v104 countByEnumeratingWithState:&v120 objects:v137 count:16];
    }
    while (v74);
  }

  __brc_leave_section((uint64_t *)buf);
  uint64_t v100 = *(unsigned char **)(a1 + 32);
  if (!v100[121])
  {
    [v100 enumerateAppLibraries:&__block_literal_global_320];
    uint64_t v100 = *(unsigned char **)(a1 + 32);
  }
  v115[0] = MEMORY[0x263EF8330];
  v115[1] = 3221225472;
  v115[2] = __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_321;
  v115[3] = &unk_265084DC8;
  v115[4] = v100;
  [v100 _enumerateAppLibraryRowIDs:v102 usingBlock:v115];
  brc_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 216));

  return 1;
}

uint64_t __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_318(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_318_cold_1((uint64_t)v2);
  }

  [v2 activate];
  return 1;
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_321(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263F325E0];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithAppLibraryName:v7];

  [*(id *)(*(void *)(a1 + 32) + 352) setObject:v6 forKeyedSubscript:v8];
}

- (void)_handleUnloadedZones:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[BRCUserDefaults defaultsForMangledID:0];
    char v6 = [v5 handleUnloadedZones];

    if (v6)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke;
      v10[3] = &unk_26507ED98;
      id v11 = v4;
      id v12 = self;
      dispatch_async(clientTruthWorkloop, v10);
      id v8 = v11;
    }
    else
    {
      id v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        int v16 = v8;
        _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We found %@ unloaded zones, but handling logic is disabled by user defaults%@", buf, 0x16u);
      }
    }
  }
}

uint64_t __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2;
  v3[3] = &unk_265081E38;
  os_log_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateIndexesUsingBlock:v3];
}

void __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v14 = a2;
    __int16 v15 = 2112;
    int v16 = v6;
    _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Checking if unloaded zone %lu is being referenced by a client item%@", buf, 0x16u);
  }

  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "numberWithSQL:", @"SELECT 1 FROM client_items WHERE zone_rowid = %lu LIMIT 1", a2);
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2_cold_1((uint64_t)v10, a2, v11);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F32360] code:142 userInfo:0];
    [*(id *)(a1 + 32) dbBecameCorruptedWithDescription:@"Unloaded zone is referenced by item" error:v12];
    *a3 = 1;
  }
}

- (id)_unloadClientZones
{
  id v3 = self->_clientDB;
  id v4 = [(BRCPQLConnection *)v3 serialQueue];

  if (v4)
  {
    id v5 = [(BRCPQLConnection *)v3 serialQueue];
    dispatch_assert_queue_not_V2(v5);
  }
  char v6 = self->_serverDB;
  id v7 = [(BRCPQLConnection *)v6 serialQueue];

  if (v7)
  {
    id v8 = [(BRCPQLConnection *)v6 serialQueue];
    dispatch_assert_queue_not_V2(v8);
  }
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  brc_mutex_lock(&self->_zonesLock.pthread);
  int v9 = [(NSMutableDictionary *)self->_privateClientZonesByID allValues];
  id v10 = (void *)[v9 copy];

  id v11 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID allValues];
  id v12 = [v10 arrayByAddingObjectsFromArray:v11];

  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = 0;

  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = 0;

  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = 0;

  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = 0;

  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = 0;

  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = 0;

  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = 0;

  brc_mutex_unlock(&self->_zonesLock.pthread);
  brc_mutex_unlock(&self->_zonesCreationLock.pthread);
  return v12;
}

- (void)_mutexZonesLock
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: BRCurrentPersonaMatchesID(self.personaIdentifier)%@", v2, v3, v4, v5, v6);
}

- (id)sharedServerZoneRowIDsByOwnerNamePrefix:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint8_t v6 = [(NSMutableDictionary *)self->_sharedServerZonesByMangledID objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 ownerName];
        int v13 = [v12 hasPrefix:v4];

        if (v13)
        {
          uint64_t v14 = [v11 dbRowID];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v5;
}

- (id)serverZoneByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  if ([v4 isShared])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID objectForKeyedSubscript:v4];
  }
  else
  {
    privateClientZonesByID = self->_privateClientZonesByID;
    uint64_t v7 = [v4 appLibraryOrZoneName];

    uint64_t v5 = [(NSMutableDictionary *)privateClientZonesByID objectForKeyedSubscript:v7];
    id v4 = (id)v7;
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  uint64_t v8 = [v5 serverZone];

  return v8;
}

- (id)serverZoneByCKZoneID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F325E0];
  id v5 = a3;
  uint8_t v6 = (void *)[[v4 alloc] initWithRecordZoneID:v5];

  uint64_t v7 = [(BRCAccountSessionFPFS *)self serverZoneByMangledID:v6];

  return v7;
}

- (id)serverZoneByName:(id)a3 ownerName:(id)a4
{
  uint8_t v6 = (objc_class *)MEMORY[0x263F325E0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithZoneName:v8 ownerName:v7];

  id v10 = [(BRCAccountSessionFPFS *)self serverZoneByMangledID:v9];

  return v10;
}

- (id)serverZoneByRowID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(BRCAccountSessionFPFS *)self _mutexZonesLock];
    id v5 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID objectForKeyedSubscript:v4];

    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v5)
    {
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS serverZoneByRowID:]();
      }
    }
    uint8_t v6 = [v5 clientZone];

    if (!v6)
    {
      int v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS serverZoneByRowID:]();
      }
    }
    id v7 = [v5 clientZone];
    if (v7) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)clientZoneByMangledID:(id)a3
{
  id v4 = a3;
  if ([v4 isShared])
  {
    id v5 = [(BRCAccountSessionFPFS *)self sharedClientZoneByMangledID:v4];
  }
  else
  {
    uint8_t v6 = [(BRCAccountSessionFPFS *)self appLibraryByMangledID:v4];

    id v5 = [v6 defaultClientZone];
    id v4 = v6;
  }

  return v5;
}

- (void)enumerateServerZones:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void *))a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x2455D97F0](v7);
        uint64_t v13 = objc_msgSend(v11, "clientZone", (void)v16);
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          char v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            goto LABEL_12;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)enumerateAppLibraries:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void))a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_appLibrariesByRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      id v12 = (void *)MEMORY[0x2455D97F0](v7);
      LODWORD(v11) = v4[2](v4, v11);
      if (!v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)appLibraries
{
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v3 = [(NSMutableDictionary *)self->_appLibrariesByRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (id)fallbackAppLibraryForClientZone:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 zoneName];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F32320]];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F841B0] sharedManager];
    uint64_t v11 = [v10 currentPersona];
    int v12 = [v11 isEnterprisePersona];

    if (v12)
    {
      long long v13 = [(BRCAccountSessionFPFS *)self appLibraryByID:*MEMORY[0x263F324E8]];
    }
    else
    {
      long long v14 = [v6 zoneName];
      long long v13 = [(BRCAccountSessionFPFS *)self appLibraryByID:v14];
    }
  }
  else
  {
    long long v13 = 0;
  }
  long long v15 = [v6 zoneName];
  int v16 = [v15 isEqualToString:*MEMORY[0x263F32340]];

  if (v16)
  {
    long long v17 = [v6 zoneName];
    uint64_t v18 = [(BRCAccountSessionFPFS *)self appLibraryByID:v17];

    long long v13 = (void *)v18;
  }
  if (v13)
  {
    id v19 = v13;
    __int16 v20 = v19;
    goto LABEL_21;
  }
  uint64_t v21 = [v6 mangledID];
  uint64_t v22 = +[BRCUserDefaults defaultsForMangledID:v21];
  uint64_t v23 = [v22 iworkShareableExtensions];

  if (![v23 containsObject:v7]) {
    goto LABEL_19;
  }
  if ([v7 containsString:@"pages"])
  {
    uint64_t v24 = (void *)MEMORY[0x263F32338];
  }
  else if ([v7 containsString:@"key"])
  {
    uint64_t v24 = (void *)MEMORY[0x263F32328];
  }
  else
  {
    if (![v7 containsString:@"numbers"])
    {
LABEL_19:
      __int16 v20 = [(BRCAccountSessionFPFS *)self appLibraryByID:*MEMORY[0x263F324E8]];
      id v19 = 0;
      goto LABEL_20;
    }
    uint64_t v24 = (void *)MEMORY[0x263F32330];
  }
  uint64_t v25 = [(BRCAccountSessionFPFS *)self appLibraryByID:*v24];
  if (!v25) {
    goto LABEL_19;
  }
  id v19 = v25;
  __int16 v20 = v19;
LABEL_20:

LABEL_21:
  return v20;
}

- (id)privateServerZoneByID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_privateServerZonesByID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 clientZone];
  if (v6) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)enumeratePrivateServerZones:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void))a3;
  if (!v4)
  {
    long long v13 = brc_bread_crumbs();
    long long v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_privateServerZonesByID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
      int v12 = (void *)MEMORY[0x2455D97F0](v7);
      LODWORD(v11) = v4[2](v4, v11);
      if (!v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (id)cloudDocsClientZone
{
  return [(BRCAccountSessionFPFS *)self privateClientZoneByID:*MEMORY[0x263F324E8]];
}

- (id)privateClientZoneByID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_privateClientZonesByID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 serverZone];
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)enumerateClientZones:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    long long v16 = brc_bread_crumbs();
    long long v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      uint64_t v11 = (void *)MEMORY[0x2455D97F0]();
      int v12 = [v10 clientZone];
      if (!v12)
      {
        long long v13 = brc_bread_crumbs();
        long long v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v24 = v10;
          __int16 v25 = 2112;
          uint64_t v26 = v13;
          _os_log_fault_impl(&dword_23FA42000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: missing client zone for %@%@", buf, 0x16u);
        }
      }
      int v15 = v4[2](v4, v12);

      if (!v15) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (id)clientZones
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableDictionary count](self->_serverZonesByZoneRowID, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x2455D97F0]();
        uint64_t v11 = [v9 clientZone];
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (void)enumeratePrivateClientZones:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void))a3;
  if (!v4)
  {
    long long v13 = brc_bread_crumbs();
    long long v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_privateClientZonesByID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
      int v12 = (void *)MEMORY[0x2455D97F0](v7);
      LODWORD(v11) = v4[2](v4, v11);
      if (!v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (id)sharedServerZoneByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sharedServerZonesByMangledID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 clientZone];
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)sharedClientZoneByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 serverZone];
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)enumerateSharedClientZones:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    long long v16 = brc_bread_crumbs();
    long long v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        int v12 = (void *)MEMORY[0x2455D97F0](v7);
        uint64_t v13 = objc_msgSend(v11, "serverZone", (void)v18);
        if (v13)
        {
          long long v14 = (void *)v13;
          char v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            goto LABEL_13;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)performBlock:(id)a3 whileRemovingPrivateClientZone:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  if (!self->_isCancelled)
  {
    uint64_t v8 = [(BRCPQLConnection *)self->_clientDB serialQueue];
    dispatch_assert_queue_not_V2(v8);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    uint64_t v9 = [(BRCPQLConnection *)self->_serverDB serialQueue];
    dispatch_assert_queue_not_V2(v9);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS performBlock:whileRemovingPrivateClientZone:]();
    }

    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    if (v6) {
      v6[2](v6);
    }
    [(BRCAccountSessionFPFS *)self _mutexZonesLock];
    privateClientZonesByID = self->_privateClientZonesByID;
    uint64_t v13 = [v7 zoneName];
    [(NSMutableDictionary *)privateClientZonesByID removeObjectForKey:v13];

    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    char v15 = [v7 dbRowID];
    [(NSMutableDictionary *)serverZonesByZoneRowID removeObjectForKey:v15];

    brc_mutex_unlock(&self->_zonesLock.pthread);
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    [v7 close];
  }
}

- (void)destroySharedClientZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_isCancelled)
  {
    if (([v4 state] & 0x100) == 0)
    {
      long long v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS destroySharedClientZone:]();
      }
    }
    if (([v5 state] & 0x20000) == 0)
    {
      uint64_t v24 = brc_bread_crumbs();
      __int16 v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS destroySharedClientZone:]();
      }
    }
    id v6 = [(BRCPQLConnection *)self->_clientDB serialQueue];
    dispatch_assert_queue_not_V2(v6);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    id v7 = [(BRCPQLConnection *)self->_serverDB serialQueue];
    dispatch_assert_queue_not_V2(v7);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    uint64_t v8 = [v5 serverZone];
    uint64_t v9 = [v5 mangledID];
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS destroySharedClientZone:]((uint64_t)v9);
    }

    p_zonesCreationLocuint64_t k = &self->_zonesCreationLock;
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    [(BRCAccountSessionFPFS *)self _mutexZonesLock];
    [(NSMutableDictionary *)self->_sharedClientZonesByMangledID removeObjectForKey:v9];
    [(NSMutableDictionary *)self->_sharedServerZonesByMangledID removeObjectForKey:v9];
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    long long v14 = [v5 dbRowID];
    [(NSMutableDictionary *)serverZonesByZoneRowID removeObjectForKey:v14];

    brc_mutex_unlock(&self->_zonesLock.pthread);
    clientDB = self->_clientDB;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke;
    uint64_t v33[3] = &unk_26507F760;
    id v16 = v9;
    id v34 = v16;
    long long v35 = self;
    id v17 = v5;
    id v36 = v17;
    [(BRCPQLConnection *)clientDB performWithFlags:27 action:v33];
    serverDB = self->_serverDB;
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_341;
    uint64_t v29 = &unk_26507F760;
    id v19 = v16;
    id v30 = v19;
    uint64_t v31 = self;
    id v20 = v8;
    id v32 = v20;
    [(BRCPQLConnection *)serverDB performWithFlags:11 action:&v26];

    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    objc_msgSend(v17, "close", v26, v27, v28, v29);
    long long v21 = +[BRCUserDefaults defaultsForMangledID:0];
    LODWORD(p_zonesCreationLock) = [v21 sessionZombiesEnabled];

    if (p_zonesCreationLock)
    {
      [MEMORY[0x263F32660] turnObjectIntoZombie:v20];
      [MEMORY[0x263F32660] turnObjectIntoZombie:v17];
    }
  }
}

uint64_t __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 40) _deleteClientZone:*(void *)(a1 + 48)];
}

uint64_t __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_341(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_341_cold_1();
  }

  return [*(id *)(a1 + 40) deleteServerZone:*(void *)(a1 + 48)];
}

- (id)appLibraryByRowID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
    }
  }
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_appLibrariesByRowID objectForKeyedSubscript:v4];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (!v5)
  {
    if ([(BRCAccountSessionFPFS *)self isCancelled])
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        int v12 = v6;
        _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find app library in the middle of closing%@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS appLibraryByRowID:]();
      }
    }
  }
  return v5;
}

- (id)appLibraryByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_libraryRowIDsByMangledID objectForKeyedSubscript:v4];

  id v6 = [(NSMutableDictionary *)self->_appLibrariesByRowID objectForKeyedSubscript:v5];
  brc_mutex_unlock(&self->_zonesLock.pthread);

  return v6;
}

- (id)appLibraryByID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F325E0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithAppLibraryName:v5];

  id v7 = [(BRCAccountSessionFPFS *)self appLibraryByMangledID:v6];

  return v7;
}

- (void)assertNotOnZoneMutex
{
}

- (id)__getOrCreateServerZone:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  int v5 = [v4 isShared];
  id v6 = [v4 appLibraryOrZoneName];
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  if (v5)
  {
    id v7 = [(NSMutableDictionary *)self->_sharedServerZonesByMangledID objectForKeyedSubscript:v4];
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v7)
    {
      uint64_t v8 = off_26507DE08;
      goto LABEL_9;
    }
LABEL_5:
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS __getOrCreateServerZone:]();
    }
    goto LABEL_7;
  }
  id v7 = [(NSMutableDictionary *)self->_privateServerZonesByID objectForKeyedSubscript:v6];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (v7) {
    goto LABEL_5;
  }
  uint64_t v8 = off_26507DD98;
LABEL_9:
  id v7 = (id)[objc_alloc(*v8) initWithMangledID:v4 dbRowID:0 plist:0 session:self];
  if ([(BRCAccountSessionFPFS *)self createServerZone:v7])
  {
    int v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS __getOrCreateServerZone:]((uint64_t)v7);
    }

    uint64_t v13 = [v7 dbRowID];

    if (v13) {
      goto LABEL_13;
    }
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS __getOrCreateServerZone:]();
    }
LABEL_7:

LABEL_13:
    id v7 = v7;
    long long v14 = v7;
    goto LABEL_14;
  }
  long long v14 = 0;
LABEL_14:

  return v14;
}

- (id)__getOrCreateClientZone:(id)a3 withServerZone:(id)a4 alreadyExists:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  int v10 = [v8 isShared];
  int v11 = [v8 appLibraryOrZoneName];
  if (a5) {
    *a5 = 0;
  }
  [(BRCAccountSessionFPFS *)self _mutexZonesLock];
  if (v10)
  {
    int v12 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID objectForKeyedSubscript:v8];
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      uint64_t v13 = BRCSharedClientZone;
LABEL_12:
      id v16 = [v13 alloc];
      id v17 = [v9 dbRowID];
      int v12 = (void *)[v16 initWithMangledID:v8 dbRowID:v17 plist:0 session:self initialCreation:1];

      if (![(BRCAccountSessionFPFS *)self _createClientZone:v12])
      {

        int v12 = 0;
      }
      long long v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSessionFPFS __getOrCreateClientZone:withServerZone:alreadyExists:]((uint64_t)v12);
      }

      if (v12)
      {
        [v12 setDelegate:self->_containerScheduler];
        [v12 associateWithServerZone:v9];
        id v20 = [v12 dbRowID];
        long long v21 = [v9 dbRowID];
        char v22 = objc_msgSend(v20, "br_isEqualToNumber:", v21);

        if ((v22 & 1) == 0)
        {
          __int16 v25 = brc_bread_crumbs();
          uint64_t v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSessionFPFS __getOrCreateClientZone:withServerZone:alreadyExists:]();
          }
        }
      }
      goto LABEL_18;
    }
  }
  else
  {
    int v12 = [(NSMutableDictionary *)self->_privateClientZonesByID objectForKeyedSubscript:v11];
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      uint64_t v13 = BRCPrivateClientZone;
      goto LABEL_12;
    }
  }
  long long v14 = brc_bread_crumbs();
  char v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS __getOrCreateClientZone:withServerZone:alreadyExists:]();
  }

  if (a5) {
    *a5 = 1;
  }
LABEL_18:
  id v23 = v12;

  return v23;
}

- (id)__getOrCreateAppLibrary:(id)a3 rowID:(id)a4 alreadyExists:(BOOL *)a5 withClientZone:(id)a6 createCZMMoved:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  if (!v13)
  {
    uint64_t v26 = brc_bread_crumbs();
    uint64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(BRCDatabaseManager) createServerZone:]();
    }
  }
  char v15 = [v12 appLibraryOrZoneName];
  id v16 = [(BRCAccountSessionFPFS *)self appLibraryByID:v15];

  if (v16)
  {
    id v17 = brc_bread_crumbs();
    long long v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS __getOrCreateAppLibrary:rowID:alreadyExists:withClientZone:createCZMMoved:]();
    }

    if (a5) {
      *a5 = 1;
    }
    id v19 = v16;
LABEL_8:
    id v20 = v19;
    long long v21 = v19;
    goto LABEL_15;
  }
  char v22 = [BRCAppLibrary alloc];
  id v23 = [v14 dbRowID];
  LODWORD(v29) = 1;
  BYTE2(v28) = a7;
  LOWORD(v28) = 1;
  id v20 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v22, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v12, v13, v23, self->_clientDB, 0, self, v28, 0, 0, v29);

  if ([(BRCAccountSessionFPFS *)self _createPrivateAppLibrary:v20])
  {
    [(BRCAppLibrary *)v20 associateWithClientZone:v14];
    [(BRCAppLibrary *)v20 setDelegate:self->_containerScheduler];
    uint64_t v24 = [v14 serverZone];
    [(BRCAccountSessionFPFS *)self __registerServerZone:v24 clientZone:v14 appLibrary:v20 isShared:0];

    if ([(BRCAppLibrary *)v20 recreateDocumentsFolderIfNeededInDB])
    {
      [(BRCAppLibrary *)v20 flushAndForceIngestRootAndDocumentsFolder];
      if (a5) {
        *a5 = 0;
      }
      id v19 = v20;
      goto LABEL_8;
    }
  }
  long long v21 = 0;
LABEL_15:

  return v21;
}

- (void)__registerServerZone:(id)a3 clientZone:(id)a4 appLibrary:(id)a5 isShared:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((v12 == 0) != v6)
  {
    __int16 v33 = brc_bread_crumbs();
    id v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:].cold.4();
    }
  }
  id v13 = [v10 dbRowID];
  id v14 = v13;
  if (!v13 || v6)
  {

    if (!v14) {
      goto LABEL_5;
    }
LABEL_9:
    [(BRCAccountSessionFPFS *)self _mutexZonesLock];
    if (v10 && v11)
    {
      if (v6)
      {
        uint64_t v18 = [v10 mangledID];
        if (!v18)
        {
          id v30 = brc_bread_crumbs();
          id v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:]();
          }
          goto LABEL_19;
        }
        id v19 = (void *)v18;
        [(NSMutableDictionary *)self->_sharedClientZonesByMangledID setObject:v11 forKeyedSubscript:v18];
        sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
        id v21 = v10;
      }
      else
      {
        char v22 = [v10 zoneName];

        if (!v22)
        {
          id v30 = brc_bread_crumbs();
          id v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:]();
          }
          goto LABEL_19;
        }
        privateServerZonesByID = self->_privateServerZonesByID;
        uint64_t v24 = [v10 zoneName];
        [(NSMutableDictionary *)privateServerZonesByID setObject:v10 forKeyedSubscript:v24];

        privateClientZonesByID = self->_privateClientZonesByID;
        id v19 = [v10 zoneName];
        sharedServerZonesByMangledID = privateClientZonesByID;
        id v21 = v11;
      }
      [(NSMutableDictionary *)sharedServerZonesByMangledID setObject:v21 forKeyedSubscript:v19];

      serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
      uint64_t v27 = [v10 dbRowID];
      [(NSMutableDictionary *)serverZonesByZoneRowID setObject:v10 forKeyedSubscript:v27];
    }
    if (!v12)
    {
LABEL_20:
      brc_mutex_unlock(&self->_zonesLock.pthread);
      goto LABEL_21;
    }
    appLibrariesByRowID = self->_appLibrariesByRowID;
    uint64_t v29 = [v12 dbRowID];
    [(NSMutableDictionary *)appLibrariesByRowID setObject:v12 forKeyedSubscript:v29];

    id v30 = [v12 dbRowID];
    libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
    id v32 = [v12 mangledID];
    [(NSMutableDictionary *)libraryRowIDsByMangledID setObject:v30 forKeyedSubscript:v32];
LABEL_19:

    goto LABEL_20;
  }
  char v15 = [v12 dbRowID];

  if (v15) {
    goto LABEL_9;
  }
LABEL_5:
  id v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSessionFPFS __registerServerZone:clientZone:appLibrary:isShared:]();
  }

LABEL_21:
}

- (BOOL)_shouldPrivateAppLibraryBeCZMMoved:(id)a3
{
  id v4 = a3;
  if ([v4 isCloudDocsMangledID])
  {
    char v5 = 0;
  }
  else
  {
    BOOL v6 = [(BRCAccountSessionFPFS *)self appLibraryByID:*MEMORY[0x263F324E8]];
    if ([v6 wasMovedToCloudDocs])
    {
      id v7 = +[BRCUserDefaults defaultsForMangledID:v4];
      char v5 = [v7 shouldAutoMigrateToCloudDocs];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (id)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 creationFlags:(unsigned int *)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v63 = 0;
  BOOL v64 = &v63;
  uint64_t v65 = 0x3032000000;
  int v66 = __Block_byref_object_copy__40;
  char v67 = __Block_byref_object_dispose__40;
  id v68 = 0;
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x3032000000;
  long long v60 = __Block_byref_object_copy__40;
  long long v61 = __Block_byref_object_dispose__40;
  id v62 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  long long v54 = __Block_byref_object_copy__40;
  long long v55 = __Block_byref_object_dispose__40;
  id v56 = 0;
  id v7 = [(BRCPQLConnection *)self->_clientDB serialQueue];
  dispatch_assert_queue_not_V2(v7);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
  id v8 = [(BRCPQLConnection *)self->_serverDB serialQueue];
  dispatch_assert_queue_not_V2(v8);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
  if (a4) {
    *a4 = 0;
  }
  BOOL v9 = [(BRCAccountSessionFPFS *)self _shouldPrivateAppLibraryBeCZMMoved:v6];
  memset(v50, 0, sizeof(v50));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:]", 3952, v50);
  brc_bread_crumbs();
  id v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v50[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v70 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating app library and zones: %@ if needed%@", buf, 0x20u);
  }

  if (v6 && ![v6 isShared])
  {
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    uint64_t v15 = [(BRCAccountSessionFPFS *)self appLibraryByMangledID:v6];
    id v16 = (void *)v64[5];
    v64[5] = v15;

    uint64_t v17 = [(id)v64[5] defaultClientZone];
    uint64_t v18 = (void *)v58[5];
    v58[5] = v17;

    uint64_t v19 = [(id)v58[5] privateServerZone];
    id v20 = (void *)v52[5];
    void v52[5] = v19;

    if (v52[5])
    {
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      id v21 = brc_bread_crumbs();
      char v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = v52[5];
        uint64_t v33 = v58[5];
        id v34 = (uint64_t (*)(uint64_t, uint64_t))v64[5];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v32;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        id v70 = v34;
        LOWORD(v71) = 2112;
        *(void *)((char *)&v71 + 2) = v21;
        _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] returning early server zone: %@\nclient zone: %@\napp library: %@%@", buf, 0x2Au);
      }

      if (a4) {
        *a4 = 1;
      }
    }
    else
    {
      if (![(BRCAccountSessionFPFS *)self isCancelled])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        id v70 = __Block_byref_object_copy__40;
        *(void *)&long long v71 = __Block_byref_object_dispose__40;
        *((void *)&v71 + 1) = 0;
        serverDB = self->_serverDB;
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke;
        v45[3] = &unk_265084DF0;
        BOOL v49 = v9;
        id v47 = &v51;
        v45[4] = self;
        id v24 = v6;
        id v46 = v24;
        int v48 = buf;
        [(BRCPQLConnection *)serverDB performWithFlags:19 action:v45];
        if (v52[5])
        {
          clientDB = self->_clientDB;
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_347;
          v37[3] = &unk_265084E18;
          BOOL v44 = v9;
          long long v39 = &v57;
          void v37[4] = self;
          id v38 = v24;
          long long v40 = &v51;
          char v41 = &v63;
          long long v42 = buf;
          uint64_t v43 = a4;
          [(BRCPQLConnection *)clientDB performWithFlags:23 action:v37];
        }
        _Block_object_dispose(buf, 8);
      }
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      if (v64[5])
      {
        uint64_t v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = v64[5];
          uint64_t v29 = v52[5];
          id v30 = (uint64_t (*)(uint64_t, uint64_t))v58[5];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v29;
          *(_WORD *)&buf[22] = 2112;
          id v70 = v30;
          LOWORD(v71) = 2112;
          *(void *)((char *)&v71 + 2) = v26;
          _os_log_debug_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] returning app library %@\nserver zone:%@\n, client zone: %@%@", buf, 0x2Au);
        }
      }
      else
      {
        uint64_t v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          uint64_t v35 = v52[5];
          id v36 = (uint64_t (*)(uint64_t, uint64_t))v58[5];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          *(_WORD *)&buf[22] = 2112;
          id v70 = v36;
          LOWORD(v71) = 2112;
          *(void *)((char *)&v71 + 2) = v26;
          _os_log_error_impl(&dword_23FA42000, v27, (os_log_type_t)0x90u, "[ERROR] couldn't create app library\n appID: %@\nserverZone: %@\nclientZone: %@%@", buf, 0x2Au);
        }
      }
    }
    id v14 = (id)v64[5];
  }
  else
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:]((uint64_t)v6);
    }

    id v14 = 0;
  }
  __brc_leave_section(v50);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v14;
}

uint64_t __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = [v4 privateServerZoneByID:*MEMORY[0x263F324E8]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      goto LABEL_8;
    }
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS serverZoneByRowID:]();
    }
  }
  else
  {
    id v8 = objc_msgSend(v4, "__getOrCreateServerZone:", *(void *)(a1 + 40));
    uint64_t v10 = [v8 asPrivateZone];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
LABEL_8:
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v13 = [*(id *)(a1 + 32) getOrReserveLibraryRowIDForLibrary:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  return 1;
}

uint64_t __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_347(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(a1 + 88))
  {
    id v8 = objc_msgSend(v4, "__getOrCreateClientZone:withServerZone:alreadyExists:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
    uint64_t v10 = [v8 asPrivateClientZone];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v5 = [v4 privateClientZoneByID:*MEMORY[0x263F324E8]];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_347_cold_1();
    }

    goto LABEL_7;
  }
LABEL_8:
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v13)
  {
    char v21 = 0;
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "__getOrCreateAppLibrary:rowID:alreadyExists:withClientZone:createCZMMoved:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), &v21, v13, *(unsigned __int8 *)(a1 + 88));
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v17)
    {
      uint64_t v18 = *(int **)(a1 + 80);
      if (v21)
      {
        if (v18)
        {
          int v19 = 1;
LABEL_15:
          *uint64_t v18 = v19;
        }
      }
      else
      {
        if (v18)
        {
          int v19 = 2 * (*(unsigned char *)(a1 + 88) != 0);
          goto LABEL_15;
        }
        if (!*(unsigned char *)(a1 + 88) && !*(unsigned char *)(*(void *)(a1 + 32) + 121))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) resume];
          uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        }
        [v17 activate];
      }
    }
  }

  return 1;
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3
{
  return [(BRCAccountSessionFPFS *)self _getOrCreateAppLibraryAndPrivateZonesIfNecessary:a3 creationFlags:0];
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 appLibraryExists:(BOOL *)a4
{
  int v13 = 0;
  uint64_t v6 = [(BRCAccountSessionFPFS *)self _getOrCreateAppLibraryAndPrivateZonesIfNecessary:a3 creationFlags:&v13];
  if (v6 && v13 != 1)
  {
    id v7 = [(BRCAccountSessionFPFS *)self clientDB];
    id v8 = [v7 serialQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__BRCAccountSessionFPFS_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke;
    v10[3] = &unk_26507F428;
    int v12 = v13;
    id v11 = v6;
    dispatch_sync(v8, v10);
  }
  if (a4) {
    *a4 = v13 == 1;
  }
  return v6;
}

uint64_t __90__BRCAccountSessionFPFS_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) defaultClientZone];
    [v2 resume];
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 activate];
}

- (id)getOrCreateSharedZones:(id)a3
{
  return [(BRCAccountSessionFPFS *)self getOrCreateSharedZones:a3 shareAcceptOp:0];
}

- (id)getOrCreateSharedZones:(id)a3 shareAcceptOp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isShared] & 1) == 0)
  {
    char v21 = brc_bread_crumbs();
    char v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS getOrCreateSharedZones:shareAcceptOp:]();
    }
  }
  id v8 = self->_serverDB;
  BOOL v9 = [(BRCPQLConnection *)v8 serialQueue];

  if (v9)
  {
    uint64_t v10 = [(BRCPQLConnection *)v8 serialQueue];
    dispatch_assert_queue_not_V2(v10);
  }
  id v11 = self->_clientDB;
  int v12 = [(BRCPQLConnection *)v11 serialQueue];

  if (v12)
  {
    int v13 = [(BRCPQLConnection *)v11 serialQueue];
    dispatch_assert_queue_not_V2(v13);
  }
  p_zonesCreationLocuint64_t k = &self->_zonesCreationLock;
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__40;
  int v48 = __Block_byref_object_dispose__40;
  id v49 = [(BRCAccountSessionFPFS *)self clientZoneByMangledID:v6];
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3032000000;
  char v41 = __Block_byref_object_copy__40;
  long long v42 = __Block_byref_object_dispose__40;
  id v43 = [(id)v45[5] serverZone];
  if (v39[5])
  {
    if (v7)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke;
      block[3] = &unk_265081558;
      long long v37 = &v44;
      id v36 = v7;
      dispatch_async_and_wait(clientTruthWorkloop, block);
    }
    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    id v16 = [(id)v45[5] asSharedClientZone];
  }
  else
  {
    serverDB = self->_serverDB;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_2;
    v32[3] = &unk_265084020;
    id v34 = &v38;
    void v32[4] = self;
    id v18 = v6;
    id v33 = v18;
    [(BRCPQLConnection *)serverDB performWithFlags:19 action:v32];
    clientDB = self->_clientDB;
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    __int16 v25 = __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_3;
    uint64_t v26 = &unk_265084E40;
    id v30 = &v44;
    uint64_t v27 = self;
    id v28 = v18;
    uint64_t v31 = &v38;
    id v29 = v7;
    [(BRCPQLConnection *)clientDB performWithFlags:19 action:&v23];
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    id v16 = objc_msgSend((id)v45[5], "asSharedClientZone", v23, v24, v25, v26, v27);
  }
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v16;
}

uint64_t __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addSyncDownDependency:*(void *)(a1 + 32)];
}

uint64_t __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__getOrCreateServerZone:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

uint64_t __62__BRCAccountSessionFPFS_getOrCreateSharedZones_shareAcceptOp___block_invoke_3(uint64_t a1)
{
  char v7 = 0;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__getOrCreateClientZone:withServerZone:alreadyExists:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), &v7);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) && v7 == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "__registerServerZone:clientZone:appLibrary:isShared:");
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) resume];
    }
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addSyncDownDependency:");
  }
  return 1;
}

- (id)getOrReserveLibraryRowIDForLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  if ([v4 isShared])
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS getOrReserveLibraryRowIDForLibrary:]();
    }

    char v7 = 0;
  }
  else
  {
    brc_mutex_lock(&self->_zonesLock.pthread);
    char v7 = [(NSMutableDictionary *)self->_libraryRowIDsByMangledID objectForKeyedSubscript:v4];
    if (!v7)
    {
      id v8 = [v4 appLibraryOrZoneName];
      char v7 = [(BRCAccountSessionFPFS *)self _reserveRowIDForLibrary:v8];

      BOOL v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412802;
        int v13 = v7;
        __int16 v14 = 2112;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] reserved rowid %@ for %@%@", (uint8_t *)&v12, 0x20u);
      }

      if (v7) {
        [(NSMutableDictionary *)self->_libraryRowIDsByMangledID setObject:v7 forKeyedSubscript:v4];
      }
    }
    brc_mutex_unlock(&self->_zonesLock.pthread);
  }

  return v7;
}

- (void)fetchUserRecordIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (fetchUserRecordIDWithCompletionHandler__onceToken != -1) {
    dispatch_once(&fetchUserRecordIDWithCompletionHandler__onceToken, &__block_literal_global_352);
  }
  uint64_t v5 = fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_26507F850;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("fetch-user-recordID", v0);

  uint64_t v2 = (void *)fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue = (uint64_t)v1;
}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 192);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__40;
  uint64_t v23 = __Block_byref_object_dispose__40;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  _DWORD v17[2] = 0x3032000000;
  uint64_t v17[3] = __Block_byref_object_copy__40;
  void v17[4] = __Block_byref_object_dispose__40;
  id v18 = 0;
  objc_sync_enter(@"currentUserRecordID");
  uint64_t v3 = [v2 objectForKeyedSubscript:@"currentUserRecordID"];
  id v4 = (void *)v20[5];
  void v20[5] = v3;

  objc_sync_exit(@"currentUserRecordID");
  if (!v20[5])
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1();
    }

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [*(id *)(a1 + 32) syncContextProvider];
    BOOL v9 = [v8 defaultSyncContext];
    uint64_t v10 = [v9 ckContainer];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_354;
    v12[3] = &unk_265084E90;
    id v15 = v17;
    __int16 v16 = &v19;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v2;
    id v11 = v7;
    __int16 v14 = v11;
    [v10 fetchUserRecordIDWithCompletionHandler:v12];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_354(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = brc_bread_crumbs();
  BOOL v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched user record id %@ with error %@%@", buf, 0x20u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    id v13[2] = __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_355;
    uint64_t v13[3] = &unk_265084E68;
    id v11 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = v11;
    uint64_t v15 = v12;
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v10, v13);
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

intptr_t __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_355(uint64_t a1)
{
  objc_sync_enter(@"currentUserRecordID");
  [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:@"currentUserRecordID"];
  [*(id *)(*(void *)(a1 + 40) + 160) forceBatchStart];
  objc_sync_exit(@"currentUserRecordID");
  id v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (id)cachedCurrentUserRecordName
{
  id v2 = [(BRCAccountSessionFPFS *)self cachedCurrentUserRecordNameIfExists];
  if (!v2)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS cachedCurrentUserRecordName]();
    }
  }
  return v2;
}

- (id)cachedCurrentUserRecordNameIfExists
{
  id v2 = self->_clientState;
  objc_sync_enter(@"currentUserRecordID");
  uint64_t v3 = [(BRCClientState *)v2 objectForKeyedSubscript:@"currentUserRecordID"];
  id v4 = [v3 recordName];

  objc_sync_exit(@"currentUserRecordID");
  return v4;
}

- (void)_cloudDocsAppsListDidChange:(id)a3
{
  id v4 = a3;
  if (!self->_isCancelled)
  {
    if (objc_msgSend(MEMORY[0x263F841B0], "br_isInSyncBubble"))
    {
      uint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSessionFPFS _cloudDocsAppsListDidChange:]();
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x3032000000;
      id v19 = __Block_byref_object_copy__40;
      __int16 v20 = __Block_byref_object_dispose__40;
      id v21 = 0;
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3032000000;
      uint64_t v14[3] = __Block_byref_object_copy__40;
      void v14[4] = __Block_byref_object_dispose__40;
      id v15 = 0;
      memset(v13, 0, sizeof(v13));
      __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS _cloudDocsAppsListDidChange:]", 4261, v13);
      id v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSessionFPFS _cloudDocsAppsListDidChange:]();
      }

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke;
      v12[3] = &unk_265084F08;
      v12[4] = self;
      void v12[5] = &v16;
      v12[6] = v14;
      [v4 enumerateKeysAndObjectsUsingBlock:v12];
      [(id)v17[5] invalidate];
      BOOL v9 = [(BRCAccountSessionFPFS *)self clientDB];
      uint64_t v10 = [v9 serialQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_6;
      block[3] = &unk_26507ED70;
      void block[4] = self;
      dispatch_sync(v10, block);

      __brc_leave_section(v13);
      _Block_object_dispose(v14, 8);

      _Block_object_dispose(&v16, 8);
    }
  }
}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F325E0]) initWithAppLibraryName:v7];
  uint64_t v10 = [*(id *)(a1 + 32) getOrCreateAppLibraryAndPrivateZonesIfNecessary:v9];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_2;
  v20[3] = &unk_265084EE0;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 40);
  void v20[4] = v11;
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 48);
  id v21 = v12;
  uint64_t v24 = v13;
  id v14 = v7;
  id v22 = v14;
  __int16 v25 = &v26;
  [v8 enumerateObjectsUsingBlock:v20];
  id v15 = *(unsigned char **)(a1 + 32);
  if (v15[529])
  {
    *a4 = 1;
  }
  else if (*((unsigned char *)v27 + 24))
  {
    uint64_t v16 = [v15 clientDB];
    uint64_t v17 = [v16 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_5;
    block[3] = &unk_26507ED70;
    id v19 = v12;
    dispatch_sync(v17, block);
  }
  _Block_object_dispose(&v26, 8);
}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v6 = BRCBundleServiceConnection();
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 529))
  {
    *a3 = 1;
  }
  else
  {
    BOOL v9 = [*(id *)(a1 + 40) containerMetadata];
    uint64_t v10 = [v9 versionNumberForBundleIdentifier:v5];

    uint64_t v11 = [objc_alloc(MEMORY[0x263F32658]) initWithXPCObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    id v19 = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_3;
    __int16 v20 = &unk_265084EB8;
    uint64_t v15 = *(void *)(a1 + 48);
    id v21 = *(id *)(a1 + 40);
    id v22 = v5;
    int8x16_t v23 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
    [v14 extractMetadataForContainerID:v15 bundleID:v22 minimumBundleVersion:v10 reply:&v17];
    id v16 = (id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "result", v17, v18, v19, v20);
  }
}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) containerMetadata];
  int v11 = [v10 isDocumentScopePublic];

  if (v7)
  {
    uint64_t v12 = [*(id *)(a1 + 32) containerMetadata];
    int v13 = [v12 updateMetadataWithExtractorProperties:v7 iconPaths:v8 bundleID:*(void *)(a1 + 40)];

    if (v13) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  id v14 = [*(id *)(a1 + 32) containerMetadata];
  int v15 = [v14 isDocumentScopePublic];

  if (v11 != v15)
  {
    id v16 = brc_task_tracker_create("apps-list-did-change");
    uint64_t v17 = [*(id *)(a1 + 32) db];
    uint64_t v18 = [v17 serialQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_4;
    v19[3] = &unk_26507ED70;
    id v20 = *(id *)(a1 + 32);
    brc_task_tracker_async_with_logs(v16, v18, v19, 0);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setBoolResult:v9 == 0 error:v9];
}

uint64_t __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateDocumentScopePublic];
}

uint64_t __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleContainerMetadataSyncUp];
}

void __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_6(uint64_t a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_7;
  v3[3] = &unk_265084F30;
  v3[4] = &v4;
  [v2 enumeratePrivateClientZones:v3];
  if (*((unsigned char *)v5 + 24)) {
    [*(id *)(*(void *)(a1 + 32) + 568) refreshPushRegistrationAfterAppsListChanged];
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __53__BRCAccountSessionFPFS__cloudDocsAppsListDidChange___block_invoke_7(uint64_t a1, void *a2)
{
  if ([a2 recomputeAppSyncBlockState]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

- (void)cloudDocsAppsListDidChange:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BRPerformWithPersonaAndError();
}

void __52__BRCAccountSessionFPFS_cloudDocsAppsListDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __52__BRCAccountSessionFPFS_cloudDocsAppsListDidChange___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 32);
    [v5 _cloudDocsAppsListDidChange:v4];
  }
}

- (void)recomputeAppSyncBlockStateForPrivateClientZone:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSessionFPFS *)self clientDB];
  [v5 assertOnQueue];

  LODWORD(v5) = [v4 recomputeAppSyncBlockState];
  if (v5)
  {
    containerScheduler = self->_containerScheduler;
    [(BRCContainerScheduler *)containerScheduler refreshPushRegistrationAfterAppsListChanged];
  }
}

- (BOOL)hasOptimizeStorageEnabled
{
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = (id)*MEMORY[0x263F32548];
  id v5 = [MEMORY[0x263F841B0] sharedManager];
  uint64_t v6 = [v5 currentPersona];
  int v7 = [v6 isEnterprisePersona];

  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@-%@", *MEMORY[0x263F32540], self->_accountDSID];

    id v4 = (id)v8;
  }
  id v9 = [v3 objectForKey:v4];
  if (!v9)
  {
    [(BRCAccountSessionFPFS *)self setOptimizeStorageEnabled:1 forKey:v4 synchronous:0];
    id v9 = (void *)MEMORY[0x263EFFA88];
  }
  char v10 = [v9 BOOLValue];

  return v10;
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 forKey:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  memset(v26, 0, sizeof(v26));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS setOptimizeStorageEnabled:forKey:synchronous:]", 4377, v26);
  char v10 = brc_bread_crumbs();
  int v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    uint64_t v28 = v26[0];
    if (v6) {
      uint64_t v18 = "enabling";
    }
    else {
      uint64_t v18 = "disabling";
    }
    __int16 v29 = 2080;
    id v30 = v18;
    id v19 = "YES";
    __int16 v31 = 2112;
    id v32 = v8;
    if (!v5) {
      id v19 = "NO";
    }
    __int16 v33 = 2080;
    id v34 = v19;
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s storage optimization for %@ synchronous %s%@", buf, 0x34u);
  }

  uint64_t v12 = [NSNumber numberWithBool:v6];
  [v9 setObject:v12 forKey:v8];

  [v9 synchronize];
  int v13 = dispatch_group_create();
  id v14 = v13;
  if (v5) {
    dispatch_group_enter(v13);
  }
  uint64_t v15 = *MEMORY[0x263F053F0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  void v23[2] = __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke;
  v23[3] = &unk_2650806C0;
  BOOL v25 = v5;
  id v16 = v14;
  uint64_t v24 = v16;
  +[BRCImportUtil forceIngestionForItemID:v15 completionHandler:v23];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_370;
  v20[3] = &unk_265084F80;
  BOOL v22 = v5;
  uint64_t v17 = v16;
  id v21 = v17;
  [(BRCAccountSessionFPFS *)self enumerateAppLibraries:v20];
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  BRPostAccountTokenChangedNotification();

  __brc_leave_section(v26);
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_cold_1();
  }

  if (*(unsigned char *)(a1 + 40)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

uint64_t __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_370(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isAppInstalled] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 40)) {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    }
    id v4 = [v3 rootFileObjectID];
    BOOL v5 = [v4 asString];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2;
    v7[3] = &unk_265084F58;
    id v8 = v3;
    char v10 = *(unsigned char *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    +[BRCImportUtil forceIngestionForItemID:v5 completionHandler:v7];
  }
  return 1;
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2_cold_1();
  }

  if (*(unsigned char *)(a1 + 48)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 synchronous:(BOOL)a4
{
}

- (BOOL)isGreedy
{
  BOOL v2 = [(BRCAccountSessionFPFS *)self hasOptimizeStorageEnabled];
  if (!v2)
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSessionFPFS isGreedy]();
    }
  }
  return !v2;
}

- (BOOL)isOptimizeStorage
{
  return ![(BRCAccountSessionFPFS *)self isGreedy];
}

- (void)dumpXPCClientsToContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = (void *)[(NSMutableSet *)v5->_xpcClients copy];
  objc_sync_exit(v5);

  [v4 writeLineWithFormat:&stru_26F3822F0];
  objc_msgSend(v4, "writeLineWithFormat:", @"%ld xpc clients:", objc_msgSend(v6, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) dumpToContext:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v4 writeLineWithFormat:&stru_26F3822F0];
}

- (void)dumpMiscOperationsToContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(NSHashTable *)self->_miscOperations allObjects];
  [v4 writeLineWithFormat:&stru_26F3822F0];
  objc_msgSend(v4, "writeLineWithFormat:", @"%ld misc operations:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = [v11 descriptionWithContext:v4];
          [v4 writeLineWithFormat:@"%@", v12];
        }
        else
        {
          [v4 writeLineWithFormat:@"%@", v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)openForDumping
{
  id v3 = [[BRCFairScheduler alloc] initWithWorkloop:self->_clientTruthWorkloop name:@"client-db"];
  fairClientDBScheduler = self->_fairClientDBScheduler;
  self->_fairClientDBScheduler = v3;

  BOOL v5 = [[BRCDeadlineScheduler alloc] initWithName:@"com.apple.bird.main-scheduler" fairScheduler:self->_fairClientDBScheduler];
  defaultScheduler = self->_defaultScheduler;
  self->_defaultScheduler = v5;

  uint64_t v7 = [[BRCApplyScheduler alloc] initWithAccountSession:self];
  applyScheduler = self->_applyScheduler;
  self->_applyScheduler = v7;

  uint64_t v9 = [[BRCFSImporter alloc] initWithAccountSession:self];
  fsImporter = self->_fsImporter;
  self->_fsImporter = v9;

  long long v11 = [[BRCFSUploader alloc] initWithAccountSession:self];
  fsUploader = self->_fsUploader;
  self->_fsUploader = v11;

  long long v13 = [[BRCFSDownloader alloc] initWithAccountSession:self];
  fsDownloader = self->_fsDownloader;
  self->_fsDownloader = v13;

  long long v15 = [[BRCStageRegistry alloc] initWithAccountSession:self];
  stageRegistry = self->_stageRegistry;
  self->_stageRegistry = v15;

  uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v17;

  id v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v19;

  id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v21;

  int8x16_t v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v23;

  BOOL v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v25;

  uint64_t v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v27;

  __int16 v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v29;

  id v34 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  __int16 v31 = dispatch_queue_attr_make_with_autorelease_frequency(v34, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v32 = (OS_dispatch_queue *)dispatch_queue_create("reset-queue", v31);

  resetQueue = self->_resetQueue;
  self->_resetQueue = v32;
}

- (void)openForSendingTelemetry
{
  [(BRCAccountSessionFPFS *)self openForDumping];
  id v3 = [[BRCAnalyticsReporter alloc] initWithSession:self];
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = v3;

  BOOL v5 = [[BRCSyncContextProvider alloc] initWithAccountSession:self];
  syncContextProvider = self->_syncContextProvider;
  self->_syncContextProvider = v5;

  [(BRCAccountSessionFPFS *)self _setupThrottles];
}

- (void)_handleTrashedItemsMigration
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 dbMigrationBatchSize];

  uint64_t v5 = MEMORY[0x263EF8330];
  do
  {
    clientDB = self->_clientDB;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke;
    v7[3] = &unk_265084FA8;
    void v7[5] = &v8;
    v7[6] = v4;
    void v7[4] = self;
    [(BRCPQLConnection *)clientDB groupInBatch:v7];
  }
  while (!*((unsigned char *)v9 + 24));
  _Block_object_dispose(&v8, 8);
}

void __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v24 = a2;
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 160) fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_scope = 3 AND item_localsyncupstate = 5 LIMIT %lld", *(void *)(a1 + 48)];
  uint64_t v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke_2;
  v29[3] = &unk_26507F1E8;
  BOOL v22 = v3;
  uint64_t v23 = a1;
  v29[4] = *(void *)(a1 + 32);
  uint64_t v5 = [v3 enumerateObjects:v29];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        char v11 = (void *)MEMORY[0x2455D97F0]();
        long long v12 = [v10 clientZone];
        long long v13 = [v10 itemID];
        long long v14 = [v12 serverItemByItemID:v13];

        [v10 markNeedsDeleteForRescheduleOfItem:v14];
        [v10 markDoneMigratingToFPFS];
        [v4 insertObject:v10 atIndex:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  [v22 close];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        id v21 = (void *)MEMORY[0x2455D97F0]();
        [v20 saveToDB];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v17);
  }

  *(unsigned char *)(*(void *)(*(void *)(v23 + 40) + 8) + 24) = [v15 count] == 0;
}

id __53__BRCAccountSessionFPFS__handleTrashedItemsMigration__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (NSString)sessionDirPath
{
  sessionDirPath = self->_sessionDirPath;
  if (!sessionDirPath)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS sessionDirPath]();
    }

    sessionDirPath = self->_sessionDirPath;
  }
  return sessionDirPath;
}

- (NSString)cacheDirPath
{
  cacheDirPath = self->_cacheDirPath;
  if (!cacheDirPath)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS cacheDirPath]();
    }

    cacheDirPath = self->_cacheDirPath;
  }
  return cacheDirPath;
}

- (BRCApplyScheduler)applyScheduler
{
  applyScheduler = self->_applyScheduler;
  if (!applyScheduler)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS applyScheduler]();
    }

    applyScheduler = self->_applyScheduler;
  }
  return applyScheduler;
}

- (BRCContainerScheduler)containerScheduler
{
  containerScheduler = self->_containerScheduler;
  if (!containerScheduler)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS containerScheduler]();
    }

    containerScheduler = self->_containerScheduler;
  }
  return containerScheduler;
}

- (BRCFSImporter)fsImporter
{
  fsImporter = self->_fsImporter;
  if (!fsImporter)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS fsImporter]();
    }

    fsImporter = self->_fsImporter;
  }
  return fsImporter;
}

- (BRCStageRegistry)stageRegistry
{
  stageRegistry = self->_stageRegistry;
  if (!stageRegistry)
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS stageRegistry]();
    }

    stageRegistry = self->_stageRegistry;
  }
  return stageRegistry;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (BRCBarrier)dbLoadingBarrier
{
  return self->_dbLoadingBarrier;
}

- (void)setSessionDirPath:(id)a3
{
}

- (void)setCacheDirPath:(id)a3
{
}

- (NSString)ubiquityTokenSalt
{
  return self->_ubiquityTokenSalt;
}

- (BRCDeadlineScheduler)defaultScheduler
{
  return self->_defaultScheduler;
}

- (BRCFairScheduler)fairClientDBScheduler
{
  return self->_fairClientDBScheduler;
}

- (BRCVolume)volume
{
  return self->_volume;
}

- (BRCFSUploader)fsUploader
{
  return self->_fsUploader;
}

- (BRCFSDownloader)fsDownloader
{
  return self->_fsDownloader;
}

- (BRCSyncUpScheduler)syncUpScheduler
{
  return self->_syncUpScheduler;
}

- (BRCDownloadTrackers)downloadTrackers
{
  return self->_downloadTrackers;
}

- (BRCUserNotification)userNotification
{
  return self->_userNotification;
}

- (BRCDiskSpaceReclaimer)diskReclaimer
{
  return self->_diskReclaimer;
}

- (BRCFileUnlinker)fileUnlinker
{
  return self->_fileUnlinker;
}

- (BRCRecentsEnumerator)recentsEnumerator
{
  return self->_recentsEnumerator;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCThrottle)appLibraryScanThrottle
{
  return self->_appLibraryScanThrottle;
}

- (BRCThrottle)appLibraryResetThrottle
{
  return self->_appLibraryResetThrottle;
}

- (BRCThrottle)sharedAppLibraryResetThrottle
{
  return self->_sharedAppLibraryResetThrottle;
}

- (BRCThrottle)appLibraryAliasRemovalThrottle
{
  return self->_appLibraryAliasRemovalThrottle;
}

- (BRCThrottle)lostItemThrottle
{
  return self->_lostItemThrottle;
}

- (BRCThrottle)operationFailureThrottle
{
  return self->_operationFailureThrottle;
}

- (BRCThrottle)syncClientZoneThrottle
{
  return self->_syncClientZoneThrottle;
}

- (BRCThrottle)syncClientZoneErrorThrottle
{
  return self->_syncClientZoneErrorThrottle;
}

- (BRCGlobalProgress)globalProgress
{
  return self->_globalProgress;
}

- (OS_dispatch_queue)resetQueue
{
  return self->_resetQueue;
}

- (OS_dispatch_queue)dbFixupQueue
{
  return self->_dbFixupQueue;
}

- (BRCAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (BRCSyncContextProvider)syncContextProvider
{
  return self->_syncContextProvider;
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (BOOL)offline
{
  return self->_offline;
}

- (NSFileProviderDomain)fpDomain
{
  return self->_fpDomain;
}

- (void)setFpDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_dbFixupQueue, 0);
  objc_storeStrong((id *)&self->_resetQueue, 0);
  objc_storeStrong((id *)&self->_syncClientZoneErrorThrottle, 0);
  objc_storeStrong((id *)&self->_syncClientZoneThrottle, 0);
  objc_storeStrong((id *)&self->_operationFailureThrottle, 0);
  objc_storeStrong((id *)&self->_lostItemThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryAliasRemovalThrottle, 0);
  objc_storeStrong((id *)&self->_sharedAppLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryScanThrottle, 0);
  objc_storeStrong((id *)&self->_recentsEnumerator, 0);
  objc_storeStrong((id *)&self->_diskReclaimer, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_downloadTrackers, 0);
  objc_storeStrong((id *)&self->_syncUpScheduler, 0);
  objc_storeStrong((id *)&self->_fsDownloader, 0);
  objc_storeStrong((id *)&self->_fsUploader, 0);
  objc_storeStrong((id *)&self->_fairClientDBScheduler, 0);
  objc_storeStrong((id *)&self->_applyScheduler, 0);
  objc_storeStrong((id *)&self->_containerScheduler, 0);
  objc_storeStrong((id *)&self->_ubiquityTokenSalt, 0);
  objc_storeStrong((id *)&self->_cacheDirPath, 0);
  objc_storeStrong((id *)&self->_sessionDirPath, 0);
  objc_storeStrong((id *)&self->_dbLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_syncContextProvider, 0);
  objc_storeStrong((id *)&self->_isInCarry, 0);
  objc_storeStrong((id *)&self->_accountWaitOperation, 0);
  objc_storeStrong((id *)&self->_globalProgress, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_acAccountID, 0);
  objc_storeStrong((id *)&self->_extensionBackChannel, 0);
  objc_storeStrong((id *)&self->_serverChangesApplier, 0);
  objc_storeStrong((id *)&self->_fsImporter, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_fileUnlinker, 0);
  objc_storeStrong((id *)&self->_stageRegistry, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_privateClientZonesByID, 0);
  objc_storeStrong((id *)&self->_privateServerZonesByID, 0);
  objc_storeStrong((id *)&self->_sharedClientZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_sharedServerZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_serverZonesByZoneRowID, 0);
  objc_storeStrong((id *)&self->_appLibrariesByRowID, 0);
  objc_storeStrong((id *)&self->_libraryRowIDsByMangledID, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_serverState, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_expensiveReadOnlyDB, 0);
  objc_storeStrong((id *)&self->_readOnlyDB, 0);
  objc_storeStrong((id *)&self->_serverDB, 0);
  objc_storeStrong((id *)&self->_clientDB, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_bouncingAnalyzer, 0);
  objc_storeStrong((id *)&self->_namedThrottleManager, 0);
  objc_storeStrong((id *)&self->_fpDomain, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandler, 0);
  objc_storeStrong((id *)&self->_miscOperations, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong(&self->_dbProfilingHook, 0);
  objc_storeStrong((id *)&self->_readOnlyWorkloop, 0);
  objc_storeStrong((id *)&self->_serverTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_clientTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_dbCorruptionQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcherQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcher, 0);
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_defaultScheduler, 0);
}

- (id)newLocalItemFromPQLResultSet:(id)a3 db:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (char)[v8 intAtIndex:15];
  switch(v10)
  {
    case 0:
    case 4:
    case 9:
      char v11 = BRCDirectoryItem;
      goto LABEL_12;
    case 1:
    case 2:
      char v11 = BRCDocumentItem;
      goto LABEL_12;
    case 3:
      char v11 = BRCAliasItem;
      goto LABEL_12;
    case 5:
      char v11 = BRCSymlinkItem;
      goto LABEL_12;
    case 6:
    case 7:
      char v11 = BRCFinderBookmarkItem;
      goto LABEL_12;
    case 8:
      char v11 = BRCShareAcceptationDocumentFault;
      goto LABEL_12;
    case 10:
      char v11 = BRCShareAcceptationDirectoryFault;
LABEL_12:
      long long v14 = (void *)[[v11 alloc] initFromPQLResultSet:v8 session:self db:v9 error:a5];
      break;
    default:
      long long v12 = brc_bread_crumbs();
      long long v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[BRCItemID(CKConversions) structureRecordPrefixForItemType:targetZoneShared:]((uint64_t)v12, v10, v13);
      }

      long long v14 = 0;
      break;
  }

  return v14;
}

- (id)newServerItemFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 numberAtIndex:0];
  id v8 = [(BRCAccountSessionFPFS *)self serverZoneByRowID:v7];

  int v9 = [v8 isSharedZone];
  int v10 = off_26507DE00;
  if (!v9) {
    int v10 = off_26507DDE8;
  }
  char v11 = (void *)[objc_alloc(*v10) initFromPQLResultSet:v6 serverZone:v8 error:a4];

  return v11;
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return [(BRCAccountSessionFPFS *)self itemIDByRowID:a3 db:self->_clientDB];
}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "itemIDWithSQL:", @"SELECT item_id FROM client_items   WHERE rowid = %lld", a3);
  return v4;
}

- (id)itemByRowID:(unint64_t)a3
{
  return [(BRCAccountSessionFPFS *)self itemByRowID:a3 db:self->_clientDB];
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__BRCAccountSessionFPFS_ItemFetching__itemByRowID_db___block_invoke;
  v10[3] = &unk_26507F210;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = (void *)[v7 fetchObject:v10, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE rowid = %lld", a3 sql];

  return v8;
}

id __54__BRCAccountSessionFPFS_ItemFetching__itemByRowID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)itemByFileObjectID:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [v6 type];
    uint64_t v9 = [v6 rawID];
    switch(v8)
    {
      case 0:
        int v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:]();
        }
        goto LABEL_14;
      case 1:
        long long v12 = [NSNumber numberWithUnsignedLongLong:v9];
        long long v13 = [(BRCAccountSessionFPFS *)self appLibraryByRowID:v12];

        uint64_t v14 = [v13 fetchRootItemInDB:v7];
        goto LABEL_11;
      case 4:
        uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v9];
        long long v13 = [(BRCAccountSessionFPFS *)self appLibraryByRowID:v16];

        if (([v13 includesDataScope] & 1) == 0)
        {
          uint64_t v18 = brc_bread_crumbs();
          id v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:].cold.4();
          }
        }
        uint64_t v14 = [v13 fetchDocumentsDirectoryItem:v7];
LABEL_11:
        id v15 = (void *)v14;

        break;
      case 5:
        int v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:]();
        }
        goto LABEL_14;
      default:
        id v15 = [(BRCAccountSessionFPFS *)self itemByRowID:v9 db:v7];
        break;
    }
  }
  else
  {
    int v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(ItemFetching) itemByFileObjectID:db:]();
    }
LABEL_14:

    id v15 = 0;
  }

  return v15;
}

- (id)itemByFileObjectID:(id)a3
{
  return [(BRCAccountSessionFPFS *)self itemByFileObjectID:a3 db:self->_clientDB];
}

- (id)serverAliasItemForSharedItem:(id)a3
{
  return [(BRCAccountSessionFPFS *)self serverAliasItemForSharedItem:a3 db:self->_clientDB];
}

- (id)serverAliasItemForSharedItem:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 clientZone];
  uint64_t v9 = [v8 zoneName];
  int v10 = [(BRCAccountSessionFPFS *)self privateClientZoneByID:v9];

  if (!v10
    || ([v10 serverZone],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [(BRCAccountSessionFPFS *)self serverAliasItemForSharedItem:v6 inZone:v11 db:v7], long long v12 = objc_claimAutoreleasedReturnValue(), v11, !v12))
  {
    long long v12 = [(BRCAccountSessionFPFS *)self serverAliasItemForSharedItem:v6 inZone:0 db:v7];
  }

  return v12;
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4
{
  return [(BRCAccountSessionFPFS *)self serverAliasItemForSharedItem:a3 inZone:a4 db:self->_clientDB];
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4 db:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 serverZone];
  char v12 = [v11 isSharedZone];

  if ((v12 & 1) == 0)
  {
    id v24 = brc_bread_crumbs();
    long long v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(ItemFetching) serverAliasItemForSharedItem:inZone:db:]();
    }
  }
  long long v13 = NSString;
  uint64_t v14 = [v10 itemID];
  id v15 = [v14 itemIDString];
  uint64_t v16 = [v10 serverZone];

  uint64_t v17 = [v16 mangledID];
  uint64_t v18 = [v13 unsaltedBookmarkDataWithItemResolutionString:v15 serverZoneMangledID:v17];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  void v26[2] = __78__BRCAccountSessionFPFS_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke;
  uint64_t v26[3] = &unk_26507F1E8;
  v26[4] = self;
  if (v8)
  {
    id v19 = (void *)MEMORY[0x263F8C710];
    id v20 = [v8 dbRowID];
    id v21 = [v19 formatInjection:@"AND +si.zone_rowid = %@", v20];
    BOOL v22 = (void *)[v9 fetchObject:v26, @"SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.child_basehash_salt, si.salting_state, si.basehash_salt_validation_key, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id", v18, v21 sql];
  }
  else
  {
    id v20 = [MEMORY[0x263F8C720] rawInjection:"" length:0];
    BOOL v22 = (void *)[v9 fetchObject:v26, @"SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.child_basehash_salt, si.salting_state, si.basehash_salt_validation_key, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id", v18, v20 sql];
  }

  return v22;
}

id __78__BRCAccountSessionFPFS_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newServerItemFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)localAliasForSharedItem:(id)a3 inZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 serverZone];
  char v9 = [v8 isSharedZone];

  if ((v9 & 1) == 0)
  {
    id v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSessionFPFS(ItemFetching) serverAliasItemForSharedItem:inZone:db:]();
    }
  }
  id v10 = NSString;
  id v11 = [v7 itemID];
  char v12 = [v11 itemIDString];
  long long v13 = [v7 serverZone];

  uint64_t v14 = [v13 mangledID];
  id v15 = [v10 unsaltedBookmarkDataWithItemResolutionString:v12 serverZoneMangledID:v14];

  clientDB = self->_clientDB;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__BRCAccountSessionFPFS_ItemFetching__localAliasForSharedItem_inZone___block_invoke;
  v22[3] = &unk_26507F1E8;
  void v22[4] = self;
  uint64_t v17 = [v6 dbRowID];

  id v18 = [(BRCPQLConnection *)clientDB fetchObject:v22, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND +zone_rowid = %@ ORDER BY item_id", v15, v17 sql];
  return v18;
}

id __70__BRCAccountSessionFPFS_ItemFetching__localAliasForSharedItem_inZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 clientDB];
  id v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (id)itemByItemGlobalID:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 itemID];
  int v9 = [v8 isNonDesktopRoot];

  if (v9)
  {
    id v10 = [BRCZoneRootItem alloc];
    id v11 = [v7 itemID];

    char v12 = [(BRCZoneRootItem *)v10 initWithZoneRootItemID:v11 session:self];
  }
  else
  {
    long long v13 = [v7 zoneRowID];
    uint64_t v14 = [(BRCAccountSessionFPFS *)self serverZoneByRowID:v13];
    id v15 = [v14 clientZone];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__BRCAccountSessionFPFS_ItemFetching__itemByItemGlobalID_db___block_invoke;
    v20[3] = &unk_26507F210;
    id v21 = v15;
    id v22 = v6;
    id v16 = v15;
    uint64_t v17 = [v7 itemID];
    id v18 = [v7 zoneRowID];

    char v12 = (BRCZoneRootItem *)[v22 fetchObject:v20, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v17, v18 sql];
  }

  return v12;
}

id __61__BRCAccountSessionFPFS_ItemFetching__itemByItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByItemGlobalID:(id)a3
{
  return [(BRCAccountSessionFPFS *)self itemByItemGlobalID:a3 db:self->_clientDB];
}

- (BOOL)globalID:(id)a3 isStrictChildOfGlobalID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v9 = [v8 maxSyncPathDepth];

  if (([v6 isEqualToItemGlobalID:v7] & 1) != 0
    || ([v6 itemID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isNonDesktopRoot],
        v10,
        (v11 & 1) != 0))
  {
    BOOL v12 = 0;
  }
  else
  {
    clientDB = self->_clientDB;
    uint64_t v14 = [v6 zoneRowID];
    id v15 = [v6 itemID];
    id v16 = [v7 itemID];
    uint64_t v17 = [v7 zoneRowID];
    id v18 = [(BRCPQLConnection *)clientDB fetch:@"WITH RECURSIVE item_parents (item_id, zone_rowid) AS(    SELECT item_parent_id, item_parent_zone_rowid FROM client_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid FROM client_items AS li INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_id, zone_rowid FROM item_parents WHERE item_id_is_root(item_id) OR (item_id = %@ AND zone_rowid = %@) LIMIT 1", v14, v15, v9, v16, v17];

    if ([v18 next])
    {
      id v19 = [v18 objectOfClass:objc_opt_class() atIndex:0];
      id v20 = [v18 numberAtIndex:1];
      id v21 = [[BRCItemGlobalID alloc] initWithZoneRowID:v20 itemID:v19];
      BOOL v12 = [(BRCItemGlobalID *)v21 isEqualToItemGlobalID:v7];
    }
    else
    {
      id v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413314;
        __int16 v29 = self;
        __int16 v30 = 1024;
        int v31 = v9;
        __int16 v32 = 2112;
        id v33 = v7;
        __int16 v34 = 2112;
        id v35 = v6;
        __int16 v36 = 2112;
        uint64_t v37 = v22;
        _os_log_fault_impl(&dword_23FA42000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because the hierarchy is deeper than %u under %@ when looking for %@%@", buf, 0x30u);
      }

      id v24 = [v6 zoneRowID];
      long long v25 = [(BRCAccountSessionFPFS *)self serverZoneByRowID:v24];
      long long v26 = [v25 clientZone];
      [v26 scheduleResetServerAndClientTruthsForReason:@"hierarchy-too-deep"];

      BOOL v12 = 0;
    }
  }
  return v12;
}

- (void)enumerateItemsWithShareIDUnderParent:(id)a3 block:(id)a4
{
  void v40[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *, uint64_t, unsigned char *))a4;
  id v7 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v8 = [v7 maxFolderEnumerationCount];

  LODWORD(v7) = [v5 isZoneRoot];
  uint64_t v9 = (void *)MEMORY[0x263F8C710];
  id v10 = [v5 clientZone];
  char v11 = [v10 dbRowID];
  uint64_t v12 = [v5 itemID];
  long long v13 = (void *)v12;
  if (v7) {
    uint64_t v14 = @"item_parent_zone_rowid = %@ AND item_parent_id = %@";
  }
  else {
    uint64_t v14 = @"zone_rowid = %@ AND item_id = %@";
  }
  id v15 = objc_msgSend(v9, "formatInjection:", v14, v11, v12);

  char v38 = 0;
  id v33 = v5;
  id v16 = [v5 db];
  uint64_t v17 = (void *)[v16 fetch:@"WITH RECURSIVE item_children_with_shared_items (item_id, zone_rowid, shared_items_count) AS(    SELECT item_id, zone_rowid, (shared_by_me_count | shared_to_me_count) FROM item_recursive_properties      WHERE %@ AND (shared_by_me_count | shared_to_me_count) != 0  UNION ALL     SELECT ip.item_id, ip.zone_rowid, (ip.shared_by_me_count | ip.shared_to_me_count) FROM item_recursive_properties AS ip INNER JOIN item_children_with_shared_items AS p WHERE ip.item_parent_id = p.item_id AND ip.item_parent_zone_rowid = p.zone_rowid AND (ip.shared_by_me_count | ip.shared_to_me_count) != 0      LIMIT %llu) SELECT ic.item_id, ic.zone_rowid, li.item_sharing_options FROM item_children_with_shared_items AS ic INNER JOIN client_items AS li WHERE ic.shared_items_count = 1 AND li.item_id = ic.item_id AND li.zone_rowid = ic.zone_rowid AND (li.item_sharing_options & 4) != 0", v15, v8];

  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v17 next])
  {
    do
    {
      id v19 = [v17 objectOfClass:objc_opt_class() atIndex:0];
      id v20 = [v17 objectOfClass:objc_opt_class() atIndex:1];
      uint64_t v21 = (int)[v17 intAtIndex:2];
      id v22 = [[BRCItemGlobalID alloc] initWithZoneRowID:v20 itemID:v19];
      v40[0] = v22;
      uint64_t v23 = [NSNumber numberWithUnsignedInteger:v21];
      v40[1] = v23;
      id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
      [v18 addObject:v24];
    }
    while (([v17 next] & 1) != 0);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v25 = v18;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
LABEL_8:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v35 != v28) {
        objc_enumerationMutation(v25);
      }
      if (v38) {
        break;
      }
      __int16 v30 = *(void **)(*((void *)&v34 + 1) + 8 * v29);
      int v31 = [v30 objectAtIndex:0];
      __int16 v32 = [v30 objectAtIndex:1];
      v6[2](v6, v31, [v32 unsignedLongValue], &v38);

      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v27) {
          goto LABEL_8;
        }
        break;
      }
    }
  }
}

- (void)enumerateContainersWithDB:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSessionFPFS(ItemFetching) enumerateContainersWithDB:handler:]", 320, v15);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSessionFPFS(ItemFetching) enumerateContainersWithDB:handler:](v15, (uint64_t)v8, v9);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__BRCAccountSessionFPFS_ItemFetching__enumerateContainersWithDB_handler___block_invoke;
  v12[3] = &unk_265086A98;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(BRCAccountSessionFPFS *)self enumerateAppLibraries:v12];

  __brc_leave_section(v15);
}

uint64_t __73__BRCAccountSessionFPFS_ItemFetching__enumerateContainersWithDB_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 containerMetadata];
  id v5 = [v3 fetchRootItemInDB:*(void *)(a1 + 32)];

  id v6 = +[BRCNotification notificationFromItem:v5];
  id v7 = [MEMORY[0x263F32610] containerItemForContainer:v4 withRepresentativeItem:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 1;
}

- (id)_containerMetadataRecordsToSaveWithBatchSize:(unint64_t)a3 requestID:(unint64_t)a4
{
  id v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [(BRCPQLConnection *)self->_clientDB serialQueue];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke;
  id v16 = &unk_265087068;
  uint64_t v17 = self;
  id v18 = v7;
  unint64_t v19 = a4;
  unint64_t v20 = a3;
  id v9 = v7;
  dispatch_sync(v8, &v13);

  if (objc_msgSend(v9, "count", v13, v14, v15, v16, v17)) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

void __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2;
  v6[3] = &unk_265087040;
  id v3 = (void *)a1[4];
  BOOL v2 = (void *)a1[5];
  uint64_t v8 = a1[6];
  id v4 = v2;
  uint64_t v5 = a1[7];
  id v7 = v4;
  uint64_t v9 = v5;
  [v3 enumerateAppLibraries:v6];
}

uint64_t __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 shouldSaveContainerMetadataServerside] & 1) == 0)
  {
    [v3 setContainerMetadataNeedsSyncUp:0];
LABEL_10:
    uint64_t v9 = 1;
    goto LABEL_11;
  }
  if (![v3 containerMetadataNeedsSyncUp]) {
    goto LABEL_10;
  }
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(v3);
  }

  [v3 setContainerMetadataSyncRequestID:*(void *)(a1 + 40)];
  id v6 = objc_msgSend(MEMORY[0x263EFD7C8], "brc_containerMetadataRecordWithContainer:", v3);
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  unint64_t v7 = [*(id *)(a1 + 32) count];
  unint64_t v8 = *(void *)(a1 + 48);

  if (v7 < v8) {
    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] API MISUSE: is_parented_or_equal_to(Container, parent_id, parentId_or_Set)%@", v2, v3, v4, v5, v6);
}

void __78__BRCAccountSessionFPFS_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: we have a cycle%@", v2, v3, v4, v5, v6);
}

void __79__BRCAccountSessionFPFS_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] recursive update of %lld%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_8(&dword_23FA42000, a4, a3, "[CRIT] %@%@", (uint8_t *)a3);
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Saving client state data%@", v2, v3, v4, v5, v6);
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sself%@", v2, v3, v4, v5, v6);
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_323_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Saved zone state for %@%@");
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_325_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Saved app library state for %@%@");
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx db post flush%@", (void)v3, DWORD2(v3));
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_338_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Ciconia DB was likely dropped - domain removal will happen on next start%@", v2, v3, v4, v5, v6);
}

void __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_338_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v0, (uint64_t)v0, "[CRIT] disk is full, restarting: %@%@", v1);
}

void __170__BRCAccountSessionFPFS_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [*v0 lastError];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_23FA42000, v2, v3, "[CRIT] UNREACHABLE: Failed to enable recursive triggers - %@%@", v4, v5, v6, v7, v8);
}

void __100__BRCAccountSessionFPFS_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] disk is full - will fail%@", v2, v3, v4, v5, v6);
}

void __90__BRCAccountSessionFPFS_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23FA42000, a2, (os_log_type_t)0x90u, "[ERROR] Failed opening file handle%@", (uint8_t *)&v2, 0xCu);
}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)(a1 + 32) + 112);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: Failed adopting persona %@%@", (void)v3, DWORD2(v3));
}

void __107__BRCAccountSessionFPFS_FPFSAdditions___reportForFPFSImportStatusTelemetryEventIfNeeded_completionHandler___block_invoke_106_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Items in error - import won't complete%@", v1, 0xCu);
}

void __144__BRCAccountSessionFPFS_FPFSAdditions___triggerMigrationStuckRecoveryIfNeededDaysSinceImportStarted_daysSinceLastMigrationProgress_importError___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] FPFS Migration recovery failed: %@%@", v1, 0x16u);
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Triggering TTR due to stuck migration%@", v2, v3, v4, v5, v6);
}

void __75__BRCAccountSessionFPFS_FPFSAdditions___sendFPFSImportStatusTelemetryEvent__block_invoke_2_cold_2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Sending FPFS Import status telemetry event (%@)%@", (void)v3, DWORD2(v3));
}

void __80__BRCAccountSessionFPFS_FPFSAdditions___triggerFPFSImportFinishedTelemetryEvent__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Running post import analysis to validate import success for domain: %@%@");
}

- (void)registerClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)unregisterClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)_createAccountSupportPathIfNeeded:protectParent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] permissions checked%@", v2, v3, v4, v5, v6);
}

- (void)_createAccountSupportPathIfNeeded:(uint64_t)a1 protectParent:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] '%@' already exists%@", (void)v3, DWORD2(v3));
}

void __58__BRCAccountSessionFPFS__clearLegacyConflictVersionsAsync__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[NOTIF] Clearing Legacy Conflict Versions Due To Migration to FPFS%@", v2, v3, v4, v5, v6);
}

- (void)_addOrImportDomainIfNeededWithError:domainAdded:domainImported:.cold.1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Can't get persona for accountID %@%@");
}

- (void)_createGroupContainerStageOfType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Running in sync bubble. Should not try to create the group container download stage folder%@", v2, v3, v4, v5, v6);
}

void __77__BRCAccountSessionFPFS__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Successfully deleted %@%@");
}

void __77__BRCAccountSessionFPFS__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sself->_analyticsReporter%@", v2, v3, v4, v5, v6);
}

void __71__BRCAccountSessionFPFS__submitSessionOpenFailedTelemetryEventIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: decodedData.count == 1%@", v2, v3, v4, v5, v6);
}

void __66__BRCAccountSessionFPFS__submitDBCorruptionTelemetryEventIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: decodedData.count == 2%@", v2, v3, v4, v5, v6);
}

- (void)openWithError:(uint64_t)a3 pushWorkloop:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_8(&dword_23FA42000, v6, v4, "[CRIT] %@%@", v5);
}

- (void)openWithError:pushWorkloop:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: defaultAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)openWithError:(uint64_t)a1 pushWorkloop:.cold.4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] flocking '%@'%@", (void)v3, DWORD2(v3));
}

- (void)openWithError:pushWorkloop:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_isOpen%@", v2, v3, v4, v5, v6);
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Failed to set the xpc activity state to done%@", v2, v3, v4, v5, v6);
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Checking for items that need pcs chaining%@", v2, v3, v4, v5, v6);
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_168_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed to defer the pcs chain state%@", v2, v3, v4, v5, v6);
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] Failed to defer the activity state%@", v2, v3, v4, v5, v6);
}

void __55__BRCAccountSessionFPFS__pcsChainAllItemsWithActivity___block_invoke_176_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] failed to defer the activity state%@", v2, v3, v4, v5, v6);
}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Checking for items that need salting%@", v2, v3, v4, v5, v6);
}

void __63__BRCAccountSessionFPFS__saltPartiallySaltedItemsWithActivity___block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed to defer the salting state%@", v2, v3, v4, v5, v6);
}

- (void)_reportBasehashSalting
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: rs.next%@", v2, v3, v4, v5, v6);
}

void __69__BRCAccountSessionFPFS_recoverAndReportContentPolicyWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Done Force Ingestion root container to update the contentPolicy - %@%@", (void)v3, DWORD2(v3));
}

- (void)_recoverAndReportStateIntegrityWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Starting _recoverAndReportStateIntegrity%@", v2, v3, v4, v5, v6);
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] failed to continue the pcs chain state%@", v2, v3, v4, v5, v6);
}

void __57__BRCAccountSessionFPFS__registerBackgroundXPCActivities__block_invoke_248_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_13(&dword_23FA42000, v0, v1, "[ERROR] failed to continue the salting state%@", v2, v3, v4, v5, v6);
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_257_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Fixing up bounced and staged items%@");
}

void __45__BRCAccountSessionFPFS__fixupItemsAtStartup__block_invoke_2_259_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: side car forgot to schedule sync up throttle %@!%@", (void)v3, DWORD2(v3));
}

- (void)accountWaitOperation
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _accountWaitOperation.operationFailureThrottle%@", v2, v3, v4, v5, v6);
}

- (void)captureSessionOpenFailedInfoWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Failed to create %@%@", (void)v3, DWORD2(v3));
}

- (void)closeAndResetLocalStateWithDescription:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: hasDB%@", v2, v3, v4, v5, v6);
}

- (void)_recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: directoryURL is nil%@", v2, v3, v4, v5, v6);
}

- (void)_unlinkContainersWithRootURL:containers:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Calculating pristineContainerIDs before logout.%@", v2, v3, v4, v5, v6);
}

- (void)_unlinkContainersWithRootURL:containers:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self.isOpen The session must be open in order to calculate pristine containers%@", v2, v3, v4, v5, v6);
}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] did reset TCC access%@", v2, v3, v4, v5, v6);
}

void __41__BRCAccountSessionFPFS_destroyLocalData__block_invoke_309_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] done deleting local account data%@", v2, v3, v4, v5, v6);
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx loading shared server zones%@");
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx loading server zones%@");
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_311_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx registering and activating zones%@");
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_311_cold_3()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx loading shared client zones%@");
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_311_cold_4()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx loading client zones%@");
}

void __49__BRCAccountSessionFPFS__loadClientZonesFromDisk__block_invoke_318_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] activating %@%@", (void)v3, DWORD2(v3));
}

void __46__BRCAccountSessionFPFS__handleUnloadedZones___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, a2, a3, "[CRIT] UNREACHABLE: Found zoneRowID %lu which was skipped on load but is referenced by an item on DB%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)serverZoneByRowID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverZone.clientZone%@", v2, v3, v4, v5, v6);
}

- (void)serverZoneByRowID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverZone%@", v2, v3, v4, v5, v6);
}

- (void)enumeratePrivateServerZones:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: block%@", v2, v3, v4, v5, v6);
}

- (void)performBlock:whileRemovingPrivateClientZone:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 zoneName];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Deactivating private client zone %@%@", v4, v5, v6, v7, v8);
}

- (void)destroySharedClientZone:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Destroying shared client zone %@%@", (void)v3, DWORD2(v3));
}

- (void)destroySharedClientZone:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateWantsDataUnlinked%@", v2, v3, v4, v5, v6);
}

- (void)destroySharedClientZone:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateIsResetting%@", v2, v3, v4, v5, v6);
}

void __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] deleting shared zone and library for %@ from local db%@");
}

void __49__BRCAccountSessionFPFS_destroySharedClientZone___block_invoke_341_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] deleting shared container %@ from server db%@");
}

- (void)appLibraryByRowID:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v4 = *MEMORY[0x263EF8340];
  [v1 unsignedLongLongValue];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_23FA42000, v0, v2, "[CRIT] UNREACHABLE: can't find app library for %lld%@", v3);
}

- (void)__getOrCreateServerZone:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: serverZone.dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateServerZone:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Created server zone: %@%@", (void)v3, DWORD2(v3));
}

- (void)__getOrCreateServerZone:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] server zone already exists%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [clientZone.dbRowID br_isEqualToNumber:serverZone.dbRowID]%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateClientZone:(uint64_t)a1 withServerZone:alreadyExists:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Created client zone: %@%@", (void)v3, DWORD2(v3));
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] client zone already exists%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateAppLibrary:rowID:alreadyExists:withClientZone:createCZMMoved:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] app library already exists%@", v2, v3, v4, v5, v6);
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No db rowID on an app library or server zone%@", v2, v3, v4, v5, v6);
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No mangledID on a server zone%@", v2, v3, v4, v5, v6);
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: no zone name on a server zone%@", v2, v3, v4, v5, v6);
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: isShared == (appLibrary == nil)%@", v2, v3, v4, v5, v6);
}

- (void)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(uint64_t)a1 creationFlags:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: invalid containerID: %@%@", (void)v3, DWORD2(v3));
}

void __88__BRCAccountSessionFPFS__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_347_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't find the default client zone%@", v2, v3, v4, v5, v6);
}

- (void)getOrCreateSharedZones:shareAcceptOp:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: mangledID.isShared%@", v2, v3, v4, v5, v6);
}

- (void)getOrReserveLibraryRowIDForLibrary:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't reserve library rowID for a shared zone%@", v2, v3, v4, v5, v6);
}

void __64__BRCAccountSessionFPFS_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] fetching the user record id because it wasn't set in the client state%@", v2, v3, v4, v5, v6);
}

- (void)cachedCurrentUserRecordName
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: userRecordName != nil%@", v2, v3, v4, v5, v6);
}

- (void)_cloudDocsAppsListDidChange:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Running in sync bubble. Ignoring app list did change event%@", v2, v3, v4, v5, v6);
}

- (void)_cloudDocsAppsListDidChange:.cold.2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx CloudDocs apps list did change%@");
}

void __52__BRCAccountSessionFPFS_cloudDocsAppsListDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Couldn't change personas during app list refresh%@", v2, v3, v4, v5, v6);
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Done Force Ingestion root container to update the contentPolicy%@", v2, v3, v4, v5, v6);
}

void __70__BRCAccountSessionFPFS_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [*(id *)(v0 + 32) rootFileObjectID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Done Force Ingestion AppLibrary %@ to update the contentPolicy%@", v4, v5, v6, v7, v8);
}

- (void)isGreedy
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] greediness enforced because optimize storage is disabled%@", v2, v3, v4, v5, v6);
}

- (void)sessionDirPath
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: sessionDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)cacheDirPath
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: cacheDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)applyScheduler
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: applyScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)containerScheduler
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: containerScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)fsImporter
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: fsImporter was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)notificationManager
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: notificationManager was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)stageRegistry
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: stageRegistry was accessed after being closed%@", v2, v3, v4, v5, v6);
}

void __117__BRCAccountSessionFPFS_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 containerMetadata];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] preparing to sync up %@%@", v4, v5, v6, v7, v8);
}

@end