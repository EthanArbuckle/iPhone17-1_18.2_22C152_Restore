@interface RDStoreController
+ (BOOL)isDummyStoreURL:(id)a3;
+ (id)entityNamesToIncludeFromTracking;
+ (id)managedObjectModel;
+ (id)persistentStoreOptions;
+ (id)storeFileNameWithStoreName:(id)a3;
+ (void)unittest_setLoadAndValidateAccountStoresBatchSize:(unint64_t)a3;
- (BOOL)_removeFilesOfStoresAtURLs:(id)a3 outRemovedFileURLs:(id *)a4 error:(id *)a5;
- (BOOL)containsLargeDatabases;
- (BOOL)containsOnlySmallDatabases;
- (BOOL)createAccountStoresWithIdentifiers:(id)a3 didAddNewStores:(BOOL *)a4 error:(id *)a5;
- (BOOL)deleteCloudObjectIfFullyPushed:(id)a3;
- (BOOL)hasFailedLoadingAccountStoresFromDiskDueToDiskFull;
- (BOOL)hasPassedBuddyAndSystemDataMigrator;
- (BOOL)invalidateStoreConnectionsWithError:(id *)a3;
- (BOOL)isInitializing;
- (BOOL)isPPTStore;
- (BOOL)isolated;
- (BOOL)l_createAccountStoresWithIdentifiers:(id)a3 didAddNewStores:(BOOL *)a4 error:(id *)a5;
- (BOOL)l_createOrLoadAccountStoresWithURLs:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 isCreatingStores:(BOOL)a5 error:(id *)a6;
- (BOOL)l_loadAccountStoresFromDiskAndValidateInBatchesWithStoreURLs:(id)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4 error:(id *)a5;
- (BOOL)l_loadAccountStoresFromDiskDeletingFilesMarkedDeleted:(BOOL)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4 error:(id *)a5;
- (BOOL)l_loadBatchOfAccountStoresFromDiskAndValidateWithStoreURLs:(id)a3 processedStoreIdentifiers:(id)a4 shouldDeleteInvalidStoresImmediately:(BOOL)a5 connectionPoolMaxSize:(unint64_t)a6 error:(id *)a7;
- (BOOL)l_markAccountStoreDeletedAndDeleteData:(id)a3 deletedObjectIDs:(id *)a4 error:(id *)a5;
- (BOOL)l_removeAccountStoresWithIdentifiers:(id)a3 deletedObjectIDs:(id *)a4 error:(id *)a5;
- (BOOL)l_setAccountIdentifier:(id)a3 intoMetadataOfCreatedStore:(id)a4 error:(id *)a5;
- (BOOL)notificationContainsChangeTrackingChangesOnly:(id)a3;
- (BOOL)notificationContainsInternalChangesOnly:(id)a3;
- (BOOL)nukeDataWithError:(id *)a3;
- (BOOL)purgeFilesForAccountWithAccountID:(id)a3 error:(id *)a4;
- (BOOL)removeAccountStoresWithIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)supportsAccountUtils;
- (BOOL)supportsAlarmEngine;
- (BOOL)supportsAppStoreRating;
- (BOOL)supportsApplicationShortcuts;
- (BOOL)supportsAssignmentNotificationEngine;
- (BOOL)supportsCloudSchemaCatchUpSyncBackgroundScheduling;
- (BOOL)supportsCoreSpotlightIndexing;
- (BOOL)supportsGroceryOperation;
- (BOOL)supportsHashtagLabelUpdater;
- (BOOL)supportsLocalInternalAccount;
- (BOOL)supportsSharedInlineTagAutoConvertEngine;
- (BOOL)supportsStalePinnedListsEventHandler;
- (BOOL)supportsSuggestedAttributes;
- (BOOL)supportsSyncActivityNotificationEngine;
- (BOOL)supportsSyncingToCloudKit;
- (BOOL)supportsTemplateOperation;
- (BOOL)supportsTimelineEngine;
- (BOOL)supportsWidgetRefresh;
- (BOOL)unittest_isTestingDataSeparation;
- (BOOL)updateAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6 fileURL:(id)a7 keepSource:(BOOL)a8 error:(id *)a9;
- (ICCloudContext)cloudContext;
- (NSArray)validPersistentStores;
- (NSHashTable)l_allGenericAccountsObjectIDs;
- (NSMapTable)l_accountExternalIdentifiersToObjectIDsMap;
- (NSMapTable)l_accountStorageCacheByObjectIDs;
- (NSMapTable)l_accountStoreMap;
- (NSMergePolicy)mergePolicy;
- (NSMutableSet)cloudKitNetworkActivityObservers;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSURL)isolatedReminderDataContainerURL;
- (RDAccountPropertiesNotifier)accountPropertiesNotifier;
- (RDAccountUtils)accountUtils;
- (RDAttachmentFileManager)attachmentFileManager;
- (RDCoreSpotlightDelegateManager)coreSpotlightDelegateManager;
- (RDStoreController)init;
- (RDStoreController)initWithIsolatedReminderDataContainerURL:(id)a3;
- (RDStoreController)initWithIsolatedReminderDataContainerURL:(id)a3 accountStoreManagementDelegate:(id)a4 appleAccountUitilities:(id)a5;
- (RDStoreControllerAccountStoreManagementDelegate)accountStoreManagementDelegate;
- (REMAppleAccountUtilities)appleAccountUtilities;
- (REMDaemonUserDefaults)daemonUserDefaults;
- (REMObjectID)l_primaryActiveCloudKitAccountREMObjectID;
- (id)URLForAttachmentDirectory:(id)a3 accountID:(id)a4;
- (id)URLForAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6;
- (id)_dataSeparationIncompatible_defaultReminderDataContainerURL;
- (id)_deduplicateLocalAccountStore:(id)a3 withStore:(id)a4 managedObjectContext:(id)a5;
- (id)_deduplicateStore:(id)a3 withStore:(id)a4 isLocalAccountType:(BOOL)a5 managedObjectContext:(id)a6;
- (id)_discoverReminderDataContainerURLs;
- (id)_makePersistentStoreCoordinator;
- (id)_migrateStoresToPostDataSeparationLocationsWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4;
- (id)_performDataSeparationMigrationIfNeededWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4;
- (id)_relocateMisplacedDataSeparationStoresAndFilesWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4;
- (id)_relocateMisplacedDataSeparationStoresWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4;
- (id)_reminderDataContainerURLForAccountIdentifier:(id)a3;
- (id)_urlsToDeleteFromFileURLs:(id)a3 matchingStoreURL:(id)a4;
- (id)accountIdentifierForStoreID:(id)a3;
- (id)accountStoragesForAccountExternalIdentifiers:(id)a3;
- (id)accountStoragesForAccountObjectIDs:(id)a3;
- (id)accountStoragesForAllGenericAccounts;
- (id)attachmentIDsFromAttachmentDirectoryWithAccountID:(id)a3 error:(id *)a4;
- (id)containerStats;
- (id)databaseBackupDirectoryURLWithContainerURL:(id)a3;
- (id)databaseDirectoryURLWithContainerURL:(id)a3;
- (id)databaseStagedMigrationDirectoryURLWithContainerURL:(id)a3;
- (id)extractSha512Sum:(id)a3;
- (id)fileIOWorkerQueue;
- (id)inMemoryPrimaryActiveCKAccountREMObjectID;
- (id)invalidStoreBackupURLWithFileName:(id)a3 withContainerURL:(id)a4;
- (id)l_accountStoragesForAccountObjectIDs:(id)a3;
- (id)l_discoverAccountStoreURLsFromDatabaseDirectoryURL:(id)a3 deletingFilesMarkedDeleted:(BOOL)a4 storesDiscoveryStatesRef:(id *)a5 error:(id *)a6;
- (id)l_discoverAccountStoreURLsFromReminderDataContainerURLs:(id)a3 deletingFilesMarkedDeleted:(BOOL)a4 storesDiscoveryStatesRef:(id *)a5 error:(id *)a6;
- (id)newBackgroundContextWithAuthor:(id)a3;
- (id)newBackgroundContextWithAuthor:(id)a3 enableQueryGenerationToken:(BOOL)a4;
- (id)observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:(id)a3 successHandler:(id)a4 errorHandler:(id)a5;
- (id)purgeAttachmentFilesWithAttachmentIDs:(id)a3 accountID:(id)a4 error:(id *)a5;
- (id)purgeAttachmentFilesWithSha512SumsAndExtensions:(id)a3 accountID:(id)a4 error:(id *)a5;
- (id)status:(BOOL)a3;
- (id)storeBackupURLWithFileName:(id)a3 withContainerURL:(id)a4;
- (id)storeForAccountIdentifier:(id)a3;
- (id)storeURLWithName:(id)a3 withContainerURL:(id)a4;
- (id)storesForAccountTypes:(id)a3;
- (int64_t)unittest_countKeysInAccountStoreMap;
- (os_unfair_lock_s)ivarLock;
- (unint64_t)_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:(unint64_t)a3;
- (void)_backupInvalidStores:(id)a3 outBackUpFailedStores:(id *)a4;
- (void)_cleanUpCloudKitNetworkActivityObservers;
- (void)_cleanUpPreDataSeparationDataContainerIfNeeded;
- (void)_migrateAttachmentFilesToPostDataSeparationLocationsIfNeededWithAccountIdentifiers:(id)a3;
- (void)_migrateBackupStoresToPostDataSeparationLocationIfNeeded;
- (void)_migrateImageDeduplicationSentinelFileIfNeededWithPreMigrationAttachmentFileManager:(id)a3 dataSeparationAttachmentFileManager:(id)a4;
- (void)_migrateMLModelsToPostDataSeparationLocationIfNeeded;
- (void)_moveAttachmentFilesFromAttachmentFileManager:(id)a3 toAttachmentFileManager:(id)a4 affectedAccountIdentifiers:(id)a5 logPrefix:(id)a6;
- (void)_notifyCloudKitNetworkActivityObservers:(id)a3;
- (void)_performStagedLightweightMigrationIfNeededForAccountStoreWithURL:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 migrationCoordinator:(id)a5;
- (void)_performStagedLightweightMigrationIfNeededForAccountStoresWithURLs:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4;
- (void)_populateCountForEntity:(Class)a3 withinCDAccount:(id)a4 statsAccumulator:(id)a5 errorAccumulator:(id)a6;
- (void)_postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:(id)a3;
- (void)_relocateMisplacedDataSeparationAccountAttachmentFilesWithRelocatedAccountIdentifiers:(id)a3;
- (void)_validateAccountStores:(id)a3 outValidStoresByAccountIDs:(id *)a4 outInvalidStores:(id *)a5 outLocalAccountStores:(id *)a6;
- (void)cloudContext:(id)a3 didFetchUserRecord:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 receivedZoneNotFound:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5;
- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5;
- (void)cloudContextHasPendingOperationsDidChange:(id)a3;
- (void)dealloc;
- (void)didFailPushingExceededStorageQuotaForContext:(id)a3 accountID:(id)a4;
- (void)l_activateCoreSpotlightDelegates;
- (void)l_addValidatedStoresToAccountStoreMapWithStores:(id)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4;
- (void)l_invalidateAccountStorageCaches:(id)a3;
- (void)l_loadDummyStoreIfNeeded;
- (void)l_loadPPTStoreStatus;
- (void)l_performManualStoreMigrations:(id)a3;
- (void)l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:(id)a3;
- (void)l_setAccountStorages:(id)a3 forAccountObjectIDs:(id)a4;
- (void)managedObjectContextDidSave:(id)a3;
- (void)purgeDeletedObjectsWithCompletionHandler:(id)a3;
- (void)reindexAllSearchableItems;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3;
- (void)requestFreeSpaceToLoadAccountStoresWithQueue:(id)a3 completionBlock:(id)a4;
- (void)setAccountPropertiesNotifier:(id)a3;
- (void)setAccountStorages:(id)a3 forAccountExternalIdentifiers:(id)a4;
- (void)setAccountStorages:(id)a3 forAccountObjectIDs:(id)a4;
- (void)setAccountStoragesForAllGenericAccountsWithStorages:(id)a3;
- (void)setAccountStoreManagementDelegate:(id)a3;
- (void)setAccountUtils:(id)a3;
- (void)setAppleAccountUtilities:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setCloudKitNetworkActivityObservers:(id)a3;
- (void)setContainsLargeDatabases:(BOOL)a3;
- (void)setContainsOnlySmallDatabases:(BOOL)a3;
- (void)setDaemonUserDefaults:(id)a3;
- (void)setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:(BOOL)a3;
- (void)setIsInitializing:(BOOL)a3;
- (void)setIsPPTStore:(BOOL)a3;
- (void)setIsolatedReminderDataContainerURL:(id)a3;
- (void)setIvarLock:(os_unfair_lock_s)a3;
- (void)setL_accountExternalIdentifiersToObjectIDsMap:(id)a3;
- (void)setL_accountStorageCacheByObjectIDs:(id)a3;
- (void)setL_accountStoreMap:(id)a3;
- (void)setL_allGenericAccountsObjectIDs:(id)a3;
- (void)setL_primaryActiveCloudKitAccountREMObjectID:(id)a3;
- (void)setMergePolicy:(id)a3;
- (void)setSupportsLocalInternalAccount:(BOOL)a3;
- (void)setSupportsSuggestedAttributes:(BOOL)a3;
- (void)setUnittest_isTestingDataSeparation:(BOOL)a3;
- (void)startObservingCloudKitNetworkActivityWithObserver:(id)a3;
- (void)unittest_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:(id)a3;
- (void)unittest_setEnableCoreSpotlightIndexing:(BOOL)a3;
- (void)unittest_setIsTestingDataSeparation:(BOOL)a3;
- (void)unobservePrimaryCloudKitAccountPersonIDSaltChanges:(id)a3;
- (void)updateInMemoryPrimaryActiveCKAccountREMObjectIDIfNecessary:(id)a3;
@end

@implementation RDStoreController

+ (id)managedObjectModel
{
  if (qword_100922A80 != -1) {
    dispatch_once(&qword_100922A80, &stru_1008B0620);
  }
  v2 = (void *)qword_100922A78;

  return v2;
}

- (RDStoreController)init
{
  return [(RDStoreController *)self initWithIsolatedReminderDataContainerURL:0];
}

- (RDStoreController)initWithIsolatedReminderDataContainerURL:(id)a3
{
  return [(RDStoreController *)self initWithIsolatedReminderDataContainerURL:a3 accountStoreManagementDelegate:0 appleAccountUitilities:0];
}

- (RDStoreController)initWithIsolatedReminderDataContainerURL:(id)a3 accountStoreManagementDelegate:(id)a4 appleAccountUitilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v48.receiver = self;
  v48.super_class = (Class)RDStoreController;
  v12 = [(RDStoreController *)&v48 init];
  v13 = v12;
  if (v12)
  {
    v12->_ivarLock._os_unfair_lock_opaque = 0;
    v12->_isInitializing = 1;
    uint64_t v14 = +[REMUserDefaults daemonUserDefaults];
    daemonUserDefaults = v13->_daemonUserDefaults;
    v13->_daemonUserDefaults = (REMDaemonUserDefaults *)v14;

    objc_storeWeak((id *)&v13->_accountStoreManagementDelegate, v10);
    if (v11)
    {
      v16 = (REMAppleAccountUtilities *)v11;
    }
    else
    {
      v16 = +[REMAppleAccountUtilities sharedInstance];
    }
    appleAccountUtilities = v13->_appleAccountUtilities;
    v13->_appleAccountUtilities = v16;

    if (v9) {
      objc_storeStrong((id *)&v13->_isolatedReminderDataContainerURL, a3);
    }
    v18 = [[RDAttachmentFileManager alloc] initWithDocumentsURLProvider:v13];
    attachmentFileManager = v13->_attachmentFileManager;
    v13->_attachmentFileManager = v18;

    *(_WORD *)&v13->_supportsLocalInternalAccount = 257;
    uint64_t v20 = +[RDMergePolicy defaultMergePolicy];
    mergePolicy = v13->_mergePolicy;
    v13->_mergePolicy = (NSMergePolicy *)v20;

    uint64_t v22 = [(RDStoreController *)v13 _makePersistentStoreCoordinator];
    persistentStoreCoordinator = v13->_persistentStoreCoordinator;
    v13->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v22;

    v24 = [[RDCoreSpotlightDelegateManager alloc] initWithIsolated:[(RDStoreController *)v13 isolated] coordinator:v13->_persistentStoreCoordinator];
    coreSpotlightDelegateManager = v13->_coreSpotlightDelegateManager;
    v13->_coreSpotlightDelegateManager = v24;

    uint64_t v26 = objc_opt_new();
    cloudKitNetworkActivityObservers = v13->_cloudKitNetworkActivityObservers;
    v13->_cloudKitNetworkActivityObservers = (NSMutableSet *)v26;

    os_unfair_lock_lock(&v13->_ivarLock);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10006B088;
    v45[3] = &unk_1008ADC88;
    v28 = v13;
    v46 = v28;
    id v47 = v10;
    sub_10006B088((uint64_t)v45);
    os_unfair_lock_unlock(&v13->_ivarLock);

    if ([v28 supportsCoreSpotlightIndexing])
    {
      objc_initWeak(&location, v28);
      v29 = v13->_coreSpotlightDelegateManager;
      v39 = _NSConcreteStackBlock;
      uint64_t v40 = 3221225472;
      v41 = sub_10006B1B4;
      v42 = &unk_1008B0648;
      objc_copyWeak(&v43, &location);
      [(RDCoreSpotlightDelegateManager *)v29 validateIndexVersionWithCompletionHandler:&v39];
      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    if ((objc_msgSend(v28, "isolated", v39, v40, v41, v42) & 1) == 0)
    {
      v30 = +[ICSyncSettings sharedSettings];
      unsigned int v31 = [v30 hasOptions:16];

      if (v31)
      {
        v32 = [[ICCloudContext alloc] initWithStoreController:v28];
        id v33 = v28[3];
        v28[3] = v32;

        [v28[3] setCloudContextDelegate:v28];
        v34 = +[NSNotificationCenter defaultCenter];
        [v34 addObserver:v28 selector:"cloudContextHasPendingOperationsDidChange:" name:@"ICCloudContextHasPendingOperationsDidChangeNotification" object:v28[3]];

        v35 = objc_alloc_init(RDAccountPropertiesNotifier);
        [v28 setAccountPropertiesNotifier:v35];
      }
    }
    v36 = +[NSNotificationCenter defaultCenter];
    [v36 addObserver:v28 selector:"managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveObjectIDsNotification object:v13->_persistentStoreCoordinator];

    v37 = +[ICReachability sharedReachabilityForInternetConnection];
    [v37 startNotifier];
    v13->_isInitializing = 0;
  }
  return v13;
}

- (BOOL)hasPassedBuddyAndSystemDataMigrator
{
  if (+[DADBuddyStateObserver hasPassedBuddy])
  {
    if ([(RDStoreController *)self isolated]) {
      return 1;
    }
    id v3 = objc_alloc_init((Class)REMDatabaseMigrationContext);
    unsigned __int8 v4 = [v3 isDatabaseMigrated];

    if (v4) {
      return 1;
    }
    v6 = +[REMLogStore container];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      v7 = "RDStoreController: System data migration has not finished";
      v8 = (uint8_t *)&v9;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = +[REMLogStore container];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v7 = "RDStoreController: We are still in buddy";
      v8 = (uint8_t *)&v10;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  return 0;
}

- (void)dealloc
{
  id v3 = +[REMLogStore container];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v4 = [(RDStoreController *)self isolatedReminderDataContainerURL];
    v5 = +[RDPaths defaultReminderDataContainerURL];
    *(_DWORD *)buf = 134218498;
    v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Deallocating RDStoreController {pointer: %p, isolatedReminderDataContainerURL: %@, defaultReminderDataContainerURL: %@}", buf, 0x20u);
  }
  v6.receiver = self;
  v6.super_class = (Class)RDStoreController;
  [(RDStoreController *)&v6 dealloc];
}

- (BOOL)isolated
{
  v2 = [(RDStoreController *)self isolatedReminderDataContainerURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)databaseDirectoryURLWithContainerURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"Stores/"];
}

- (id)databaseBackupDirectoryURLWithContainerURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"Stores-Backup/"];
}

- (id)databaseStagedMigrationDirectoryURLWithContainerURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"Stores-StagedMigration/"];
}

+ (id)storeFileNameWithStoreName:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@.sqlite", @"Data-", a3];
}

+ (BOOL)isDummyStoreURL:(id)a3
{
  id v4 = a3;
  v5 = [a1 storeFileNameWithStoreName:@"local"];
  objc_super v6 = [v4 lastPathComponent];

  LOBYTE(v4) = [v6 isEqualToString:v5];
  return (char)v4;
}

- (id)storeURLWithName:(id)a3 withContainerURL:(id)a4
{
  id v6 = a3;
  v7 = [(RDStoreController *)self databaseDirectoryURLWithContainerURL:a4];
  v8 = [(id)objc_opt_class() storeFileNameWithStoreName:v6];

  __int16 v9 = [v7 URLByAppendingPathComponent:v8];

  return v9;
}

- (id)storeBackupURLWithFileName:(id)a3 withContainerURL:(id)a4
{
  id v6 = a3;
  v7 = [(RDStoreController *)self databaseBackupDirectoryURLWithContainerURL:a4];
  v8 = [v7 URLByAppendingPathComponent:v6];

  return v8;
}

- (id)invalidStoreBackupURLWithFileName:(id)a3 withContainerURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSTimeZone systemTimeZone];
  __int16 v9 = +[NSISO8601DateFormatter rem_formatterWithTimeZone:v8];

  __int16 v10 = +[NSDate rem_now];
  __int16 v11 = [v9 stringFromDate:v10];
  v12 = +[NSCharacterSet URLHostAllowedCharacterSet];
  v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

  uint64_t v14 = [v7 stringByDeletingPathExtension];

  v15 = +[NSString stringWithFormat:@"%@--%@.sqlite", v14, v13];

  v16 = [(RDStoreController *)self databaseBackupDirectoryURLWithContainerURL:v6];

  v17 = [v16 URLByAppendingPathComponent:v15];

  return v17;
}

- (id)_reminderDataContainerURLForAccountIdentifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(RDStoreController *)self isolatedReminderDataContainerURL];
  if (v6
    && (id v7 = (void *)v6,
        unsigned __int8 v8 = [(RDStoreController *)self unittest_isTestingDataSeparation],
        v7,
        (v8 & 1) == 0))
  {
    __int16 v10 = [(RDStoreController *)self isolatedReminderDataContainerURL];
  }
  else
  {
    __int16 v9 = [(RDStoreController *)self appleAccountUtilities];
    __int16 v10 = [v9 reminderDataContainerURLForAccountIdentifier:v5];

    __int16 v11 = +[NSFileManager defaultManager];
    id v21 = 0;
    unsigned __int8 v12 = [v11 rem_createDirectoryIfNecessaryAtURL:v10 error:&v21];
    id v13 = v21;
    if ((v12 & 1) == 0)
    {
      uint64_t v14 = +[REMLogStore container];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        v18 = NSStringFromSelector(a2);
        v19 = +[NSString stringWithFormat:@"%@.%@", v17, v18];
        uint64_t v20 = [v13 localizedDescription];
        *(_DWORD *)buf = 138544130;
        v23 = v19;
        __int16 v24 = 2114;
        id v25 = v5;
        __int16 v26 = 2112;
        v27 = v10;
        __int16 v28 = 2112;
        v29 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {accountIdentifier: %{public}@, reminderDataContainerURL: %@, error: %@}", buf, 0x2Au);
      }
    }
  }

  return v10;
}

- (id)_makePersistentStoreCoordinator
{
  v2 = [(id)objc_opt_class() managedObjectModel];
  id v3 = [objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v2];

  return v3;
}

- (BOOL)l_loadAccountStoresFromDiskDeletingFilesMarkedDeleted:(BOOL)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  __int16 v10 = +[REMLogStore container];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = +[RDPaths isDataSeparationEnabled];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] Data-separation enabled: %d", buf, 8u);
  }

  [(RDStoreController *)self l_loadPPTStoreStatus];
  __int16 v11 = [(RDStoreController *)self l_accountStoreMap];
  [v11 removeAllObjects];

  [(RDStoreController *)self l_invalidateAccountStorageCaches:@"loadAccountStoresFromDisk"];
  unsigned __int8 v42 = 0;
  __int16 v41 = 0;
  unsigned __int8 v12 = [(RDStoreController *)self _discoverReminderDataContainerURLs];
  id v40 = 0;
  id v13 = [(RDStoreController *)self l_discoverAccountStoreURLsFromReminderDataContainerURLs:v12 deletingFilesMarkedDeleted:v7 storesDiscoveryStatesRef:&v41 error:&v40];
  id v14 = v40;
  [(RDStoreController *)self setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:v41];
  [(RDStoreController *)self setContainsLargeDatabases:HIBYTE(v41)];
  [(RDStoreController *)self setContainsOnlySmallDatabases:v42];
  if (v13)
  {
    v38 = a5;
    v15 = v9;
    v16 = [(RDStoreController *)self _relocateMisplacedDataSeparationStoresAndFilesWithDataSeparatedStoreURLsMap:v13 deleteFilesMarkedDeleted:v7];

    v17 = [v16 allKeys];
    v18 = +[NSMutableSet setWithArray:v17];

    v19 = [(RDStoreController *)self _performDataSeparationMigrationIfNeededWithDataSeparatedStoreURLsMap:v16 deleteFilesMarkedDeleted:v7];
    if ([v19 count])
    {
      uint64_t v20 = [v19 allKeys];
      id v21 = +[NSSet setWithArray:v20];
      [v18 unionSet:v21];

      uint64_t v22 = [(RDStoreController *)self daemonUserDefaults];
      v23 = +[NSDate now];
      [v22 setLastDataSeparationMigrationDate:v23];
    }
    __int16 v24 = +[REMLogStore container];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v19 count];
      id v26 = [v18 count];
      *(_DWORD *)buf = 134218240;
      id v44 = v25;
      __int16 v45 = 2048;
      id v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] Will load discovered stores from disk {migratedStoresFromLegacyLocation.count: %ld, totalStores.count: %ld}", buf, 0x16u);
    }

    id v39 = v14;
    BOOL v27 = [(RDStoreController *)self l_loadAccountStoresFromDiskAndValidateInBatchesWithStoreURLs:v18 shouldDeleteInvalidStoresImmediately:v6 error:&v39];
    id v28 = v39;

    id v14 = v28;
    __int16 v9 = v15;
    a5 = v38;
  }
  else
  {
    v16 = +[REMLogStore container];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_100754C18();
    }
    BOOL v27 = 0;
  }

  [(RDStoreController *)self l_loadDummyStoreIfNeeded];
  v29 = [(RDStoreController *)self persistentStoreCoordinator];
  v30 = [v29 persistentStores];
  id v31 = [v30 count];

  v32 = [(RDStoreController *)self l_accountStoreMap];
  id v33 = [v32 count];

  if (v31 != v33)
  {
    v34 = +[REMLogStore container];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100754BA4();
    }
  }
  v35 = [(RDStoreController *)self persistentStoreCoordinator];
  v36 = [v35 persistentStores];
  [(RDStoreController *)self l_performManualStoreMigrations:v36];

  if (a5) {
    *a5 = v14;
  }

  return v27;
}

- (void)l_loadPPTStoreStatus
{
  id v4 = [(RDStoreController *)self _dataSeparationIncompatible_defaultReminderDataContainerURL];
  id v5 = +[NSFileManager defaultManager];
  id v20 = 0;
  unsigned __int8 v6 = [v5 rem_createDirectoryIfNecessaryAtURL:v4 error:&v20];
  id v7 = v20;
  if ((v6 & 1) == 0)
  {
    unsigned __int8 v8 = +[REMLogStore container];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v15);
      v16 = NSStringFromSelector(a2);
      v17 = +[NSString stringWithFormat:@"%@.%@", v19, v16];
      v18 = [v7 localizedDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = v4;
      __int16 v25 = 2112;
      id v26 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {defaultReminderDataContainerURL: %@, error: %@}", buf, 0x20u);
    }
  }
  __int16 v9 = +[RDPaths pptSentinelURLInContainerURL:v4];
  __int16 v10 = +[NSFileManager defaultManager];
  __int16 v11 = [v9 path];
  id v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    id v13 = +[REMLogStore container];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v22 = v9;
      id v14 = "[loadPPTStoreStatus] Found ppt sentinel. Marking as PPTStore {pptSentinelURL: %{private}@}";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    }
  }
  else
  {
    if (![(RDStoreController *)self isPPTStore])
    {
      id v12 = 0;
      goto LABEL_14;
    }
    id v13 = +[REMLogStore container];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v22 = v9;
      id v14 = "[loadPPTStoreStatus] Store was marked as PPT but sentinel is gone. Marking a non-PPTStore {pptSentinelURL: %{private}@}";
      goto LABEL_11;
    }
  }

LABEL_14:
  [(RDStoreController *)self setIsPPTStore:v12];
}

- (id)_discoverReminderDataContainerURLs
{
  uint64_t v3 = [(RDStoreController *)self isolatedReminderDataContainerURL];
  if (v3
    && (id v4 = (void *)v3,
        unsigned __int8 v5 = [(RDStoreController *)self unittest_isTestingDataSeparation],
        v4,
        (v5 & 1) == 0))
  {
    v19 = [(RDStoreController *)self isolatedReminderDataContainerURL];
    unsigned __int8 v6 = +[NSSet setWithObject:v19];
  }
  else
  {
    unsigned __int8 v6 = +[NSMutableSet set];
    id v7 = +[RDPaths defaultReminderDataContainerURL];
    [v6 addObject:v7];

    if ([(RDStoreController *)self hasPassedBuddyAndSystemDataMigrator])
    {
      unsigned __int8 v8 = [(RDStoreController *)self appleAccountUtilities];
      __int16 v9 = [v8 unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      __int16 v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v11)
      {
        id v13 = v11;
        uint64_t v14 = *(void *)v23;
        *(void *)&long long v12 = 138543618;
        long long v21 = v12;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v10);
            }
            v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) identifier:v21];
            v17 = [(RDStoreController *)self _reminderDataContainerURLForAccountIdentifier:v16];
            v18 = +[REMLogStore container];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              BOOL v27 = v16;
              __int16 v28 = 2112;
              v29 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[discoverApplicationDocumentURLs] Queried application documents URL for account {accountIdentifier: %{public}@, reminderDataContainerURL: %@}", buf, 0x16u);
            }

            [v6 addObject:v17];
          }
          id v13 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v13);
      }
      v19 = v10;
    }
    else
    {
      v19 = +[RDPaths defaultReminderDataContainerURL];
      [v6 addObject:v19];
      __int16 v10 = +[REMLogStore container];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100754C8C();
      }
    }
  }

  return v6;
}

- (id)l_discoverAccountStoreURLsFromReminderDataContainerURLs:(id)a3 deletingFilesMarkedDeleted:(BOOL)a4 storesDiscoveryStatesRef:(id *)a5 error:(id *)a6
{
  BOOL v39 = a4;
  id v8 = a3;
  if (a5)
  {
    a5->var2 = 1;
    *(_WORD *)&a5->var0 = 0;
  }
  __int16 v9 = +[NSFileManager defaultManager];
  id v37 = +[NSMutableDictionary dictionary];
  v36 = +[NSMutableArray array];
  __int16 v10 = +[REMLogStore container];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromApplicationDocumentsURLs] Scanning into {appDocumentsURLs: %{public}@}", buf, 0xCu);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v44;
    v38 = a5;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = [(RDStoreController *)self databaseDirectoryURLWithContainerURL:*(void *)(*((void *)&v43 + 1) + 8 * (void)v14)];
        id v42 = 0;
        unsigned __int8 v16 = [v9 rem_createDirectoryIfNecessaryAtURL:v15 error:&v42];
        id v17 = v42;
        if ((v16 & 1) == 0)
        {
          v18 = +[REMLogStore container];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            long long v24 = (objc_class *)objc_opt_class();
            v34 = NSStringFromClass(v24);
            v32 = NSStringFromSelector(a2);
            long long v25 = +[NSString stringWithFormat:@"%@.%@", v34, v32];
            id v26 = [v17 localizedDescription];
            *(_DWORD *)buf = 138543874;
            id v48 = v25;
            __int16 v49 = 2112;
            id v50 = v15;
            __int16 v51 = 2112;
            v52 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {databaseDirectoryURL: %@, error: %@}", buf, 0x20u);

            a5 = v38;
          }
        }
        unsigned __int8 v41 = 0;
        if (objc_msgSend(v9, "rem_fileExistsAtURL:isDirectory:", v15, &v41)) {
          BOOL v19 = v41 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          id v20 = +[REMLogStore container];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            BOOL v27 = [v15 absoluteString];
            *(_DWORD *)buf = 138412546;
            id v48 = v27;
            __int16 v49 = 1024;
            LODWORD(v50) = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromApplicationDocumentsURLs] Given appDocumentsURL is not an existing directory {databaseDirectoryURL: %@, isDirectory: %d}", buf, 0x12u);

            a5 = v38;
          }
        }
        id v40 = 0;
        long long v21 = [(RDStoreController *)self l_discoverAccountStoreURLsFromDatabaseDirectoryURL:v15 deletingFilesMarkedDeleted:v39 storesDiscoveryStatesRef:a5 error:&v40];
        id v22 = v40;
        if (v22)
        {
          long long v23 = +[REMLogStore container];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v33 = [v15 absoluteString];
            *(_DWORD *)buf = 138412546;
            id v48 = v33;
            __int16 v49 = 2114;
            id v50 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromApplicationDocumentsURLs] Error getting store URLs from {databaseDirectoryURL: %@, error: %{public}@}", buf, 0x16u);
          }
          [v36 addObject:v22];
          a5 = v38;
        }
        if (v21) {
          [v37 addEntriesFromDictionary:v21];
        }

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v12);
  }

  if (a6)
  {
    id v28 = [v36 count];
    if (v28)
    {
      id v28 = +[REMError errorFromErrors:v36];
    }
    *a6 = v28;
  }

  return v37;
}

- (id)l_discoverAccountStoreURLsFromDatabaseDirectoryURL:(id)a3 deletingFilesMarkedDeleted:(BOOL)a4 storesDiscoveryStatesRef:(id *)a5 error:(id *)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  v96 = self;
  __int16 v9 = [(RDStoreController *)self daemonUserDefaults];
  unsigned int v94 = [v9 debugSimulateSqliteFull];

  __int16 v10 = INDateRelevanceProvider_ptr;
  id v11 = +[REMLogStore container];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100754E04(v8, v11);
  }

  id v12 = +[NSFileManager defaultManager];
  NSURLResourceKey v124 = NSURLFileSizeKey;
  uint64_t v13 = +[NSArray arrayWithObjects:&v124 count:1];
  id v115 = 0;
  v89 = v8;
  uint64_t v14 = [v12 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v13 options:1 error:&v115];
  v15 = (__CFString *)v115;

  unsigned __int8 v16 = +[REMLogStore container];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100754D60(v89, v14);
  }

  v86 = v14;
  if (v14)
  {
    BOOL v85 = v6;
    id v17 = [(id)objc_opt_class() storeFileNameWithStoreName:@"local"];
    id v88 = +[NSMutableDictionary dictionary];
    v95 = [(id)objc_opt_class() persistentStoreOptions];
    v90 = +[NSMutableSet set];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v18 = v14;
    id v19 = [v18 countByEnumeratingWithState:&v111 objects:v123 count:16];
    if (!v19) {
      goto LABEL_74;
    }
    id v21 = v19;
    uint64_t v105 = *(void *)v112;
    *(void *)&long long v20 = 134218754;
    long long v84 = v20;
    id v92 = v18;
    v93 = v17;
    while (1)
    {
      id v22 = 0;
      id v104 = v21;
      do
      {
        if (*(void *)v112 != v105) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(__CFString **)(*((void *)&v111 + 1) + 8 * (void)v22);
        long long v24 = [(__CFString *)v23 pathExtension];
        long long v25 = [v24 lowercaseString];
        unsigned int v26 = [v25 isEqualToString:@"sqlite"];

        if (v26)
        {
          BOOL v27 = [(__CFString *)v23 lastPathComponent];
          id v28 = v27;
          if (v27 && ([(__CFString *)v27 hasPrefix:@"Data-"] & 1) != 0)
          {
            if (([(__CFString *)v28 isEqualToString:v17] & 1) == 0)
            {
              id v109 = 0;
              id v110 = 0;
              unsigned int v29 = [(__CFString *)v23 getResourceValue:&v110 forKey:NSURLFileSizeKey error:&v109];
              v30 = v110;
              id v31 = (__CFString *)v109;

              if (!v29 || !v30)
              {
                v32 = [v10[202] container];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  unint64_t v117 = (unint64_t)v28;
                  __int16 v118 = 2114;
                  CFStringRef v119 = v31;
                  _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to get file size {fileName: %{public}@, error: %{public}@}", buf, 0x16u);
                }
              }
              id v108 = 0;
              id v33 = +[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType URL:v23 options:v95 error:&v108];
              id v34 = v108;
              if (v94)
              {
                +[NSNumber numberWithInteger:13];
                v36 = v35 = v33;
                id v37 = +[NSDictionary dictionaryWithObject:v36 forKey:NSSQLiteErrorDomain];

                id v38 = [objc_alloc((Class)NSError) initWithDomain:NSCocoaErrorDomain code:134060 userInfo:v37];
                __int16 v10 = INDateRelevanceProvider_ptr;
                id v34 = v38;
                id v33 = v35;
              }
              if (objc_msgSend(v34, "rem_isDiskFullSQLError"))
              {
                if (a5) {
                  a5->var0 = 1;
                }
                BOOL v39 = [v10[202] container];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  unint64_t v117 = (unint64_t)v28;
                  __int16 v118 = 2114;
                  CFStringRef v119 = v31;
                  _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to fetch store metadata for sqlite file due to disk full {fileName: %{public}@, error: %{public}@}", buf, 0x16u);
                }

                __int16 v10 = INDateRelevanceProvider_ptr;
              }
              CFStringRef v40 = (const __CFString *)v34;

              if (!v33)
              {
                unsigned __int8 v41 = [v10[202] container];
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  unint64_t v117 = (unint64_t)v28;
                  __int16 v118 = 2114;
                  CFStringRef v119 = v40;
                  _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to fetch store metadata for sqlite file {fileName: %{public}@, error: %{public}@}", buf, 0x16u);
                }
              }
              CFStringRef v102 = v40;
              id v42 = [v33 objectForKeyedSubscript:@"RDStoreControllerAccountIdentifier"];
              [v33 objectForKeyedSubscript:NSStoreModelVersionHashesKey];
              v44 = long long v43 = v33;

              objc_opt_class();
              v101 = v43;
              long long v45 = [v43 objectForKeyedSubscript:@"RDMarkedForDeletion"];
              long long v46 = REMDynamicCast();
              unsigned int v47 = [v46 BOOLValue];

              CFStringRef v103 = v42;
              if ([(RDStoreController *)v96 supportsLocalInternalAccount])
              {
                unsigned int v100 = 0;
              }
              else
              {
                id v48 = +[REMAccount localInternalAccountID];
                __int16 v49 = [v48 uuid];
                id v50 = [v49 UUIDString];
                unsigned int v100 = [(__CFString *)v42 isEqualToString:v50];
              }
              __int16 v51 = [(__CFString *)v23 URLByResolvingSymlinksInPath];
              __int16 v10 = INDateRelevanceProvider_ptr;
              v52 = +[REMLogStore container];
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                [v51 absoluteString];
                v53 = v97 = v51;
                *(_DWORD *)buf = 138413314;
                unint64_t v117 = (unint64_t)v53;
                __int16 v118 = 2114;
                CFStringRef v119 = v103;
                __int16 v120 = 1024;
                *(_DWORD *)v121 = v44 != 0;
                *(_WORD *)&v121[4] = 1024;
                *(_DWORD *)&v121[6] = v47;
                LOWORD(v122) = 1024;
                *(_DWORD *)((char *)&v122 + 2) = v100 ^ 1;
                __int16 v10 = INDateRelevanceProvider_ptr;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Considering sqlite store on disk... {storeURL: %@, accountIdentifier: %{public}@, initialized: %d, markedAsDeleted: %d, supported: %d}", buf, 0x28u);

                __int16 v51 = v97;
              }

              if (v44) {
                char v54 = 1;
              }
              else {
                char v54 = v47;
              }
              if (v54)
              {
                id v17 = v93;
                v15 = (__CFString *)v102;
                if (v47)
                {
                  [v90 addObject:v51];
                  id v18 = v92;
                  goto LABEL_58;
                }
                if (v100)
                {
                  v58 = +[REMLogStore container];
                  id v18 = v92;
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    [v51 absoluteString];
                    v59 = v98 = v51;
                    *(_DWORD *)buf = 138543874;
                    unint64_t v117 = (unint64_t)v23;
                    __int16 v118 = 2114;
                    CFStringRef v119 = v103;
                    __int16 v120 = 2112;
                    *(void *)v121 = v59;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Unsupported storeURL. DELETING {store: %{public}@, accountIdentifier: %{public}@, storeURL: %@}", buf, 0x20u);

                    __int16 v51 = v98;
                  }

                  [v90 addObject:v51];
LABEL_58:
                  v56 = (__CFString *)v103;
                }
                else
                {
                  unint64_t v60 = (unint64_t)[v30 unsignedIntegerValue];
                  unint64_t v61 = v60;
                  if (a5 && v60 >= 0xA00000) {
                    a5->var2 = 0;
                  }
                  id v18 = v92;
                  if (v60 >> 21 >= 0x19)
                  {
                    if (a5) {
                      a5->var1 = 1;
                    }
                    v62 = +[REMLogStore container];
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      [v51 absoluteString];
                      v66 = v99 = v51;
                      *(_DWORD *)buf = v84;
                      unint64_t v117 = v61;
                      __int16 v118 = 2114;
                      CFStringRef v119 = v23;
                      __int16 v120 = 2114;
                      *(void *)v121 = v103;
                      *(_WORD *)&v121[8] = 2112;
                      v122 = v66;
                      _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] WARNING that we're loading a large database exceeding 50MB, large database is suboptimal in every way {fileSize: %lu, store: %{public}@, accountIdentifier: %{public}@, storeURL: %@}", buf, 0x2Au);

                      __int16 v51 = v99;
                    }

                    __int16 v10 = INDateRelevanceProvider_ptr;
                  }
                  v56 = (__CFString *)v103;
                  if (v103) {
                    CFStringRef v63 = v103;
                  }
                  else {
                    CFStringRef v63 = @"NullMetadataAccountIdentifier";
                  }
                  [v88 setObject:v63 forKey:v51];
                }
              }
              else
              {
                v55 = +[REMLogStore container];
                id v18 = v92;
                id v17 = v93;
                v15 = (__CFString *)v102;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
                {
                  [v51 absoluteString];
                  v64 = v51;
                  v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  unint64_t v117 = (unint64_t)v28;
                  __int16 v118 = 2112;
                  CFStringRef v119 = v65;
                  _os_log_fault_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "[discoverAccountStoreURLsFromURL] The store sqlite file is neither initialized or marked as deleted -- probably corrupted. Will delete the file if <= 4096 bytes (i.e. empty) {fileName: %{public}@, storeURL: %@}", buf, 0x16u);

                  __int16 v51 = v64;
                }

                v56 = (__CFString *)v103;
                if (v30 && (unint64_t)[v30 unsignedIntegerValue] <= 0x1000) {
                  [v90 addObject:v51];
                }
              }

LABEL_36:
            }

            id v21 = v104;
            goto LABEL_38;
          }
          v30 = [v10[202] container];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            v57 = [v89 absoluteString];
            *(_DWORD *)buf = 138412546;
            unint64_t v117 = (unint64_t)v57;
            __int16 v118 = 2114;
            CFStringRef v119 = v28;
            _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "[discoverAccountStoreURLsFromURL] Found sqlite file that doesn't have the prefix RDPathComponentStoreFilePrefix {databaseDirectoryURL: %@, fileName: %{public}@}", buf, 0x16u);
          }
          goto LABEL_36;
        }
LABEL_38:
        id v22 = (char *)v22 + 1;
      }
      while (v21 != v22);
      id v67 = [v18 countByEnumeratingWithState:&v111 objects:v123 count:16];
      id v21 = v67;
      if (!v67)
      {
LABEL_74:

        if (v85 && [v90 count])
        {
          id v106 = 0;
          id v107 = 0;
          unsigned int v68 = [(RDStoreController *)v96 _removeFilesOfStoresAtURLs:v90 outRemovedFileURLs:&v107 error:&v106];
          id v69 = v107;
          id v70 = v106;
          v71 = [v10[202] container];
          v72 = v71;
          if (v68)
          {
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              id v73 = [v90 count];
              CFStringRef v74 = (const __CFString *)[v69 count];
              *(_DWORD *)buf = 134218240;
              unint64_t v117 = (unint64_t)v73;
              __int16 v118 = 2048;
              CFStringRef v119 = v74;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Deleted store files marked for deletion in previous launches {removed.stores.count: %ld, removed.files.count: %ld}", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            id v82 = [v90 count];
            CFStringRef v83 = (const __CFString *)[v69 count];
            *(_DWORD *)buf = 134218498;
            unint64_t v117 = (unint64_t)v82;
            __int16 v118 = 2048;
            CFStringRef v119 = v83;
            __int16 v120 = 2114;
            *(void *)v121 = v70;
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "[discoverAccountStoreURLsFromURL] Failed to delete (some) store files marked for deletion in previous launches {storesToRemove.count: %ld, removed.files.count: %ld, error: %{public}@}", buf, 0x20u);
          }

          v76 = [(RDStoreController *)v96 accountStoreManagementDelegate];
          [v76 didRemoveStoreFilesOnInitWithURLs:v69];
        }
        v77 = [v10[202] container];
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          id v78 = [v18 count];
          CFStringRef v79 = (const __CFString *)[v88 count];
          id v80 = [v90 count];
          *(_DWORD *)buf = 134218496;
          unint64_t v117 = (unint64_t)v78;
          __int16 v118 = 2048;
          CFStringRef v119 = v79;
          __int16 v120 = 2048;
          *(void *)v121 = v80;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "[discoverAccountStoreURLsFromURL] Finished discovering account identifiers on disk {file.count: %ld, storeURLs.count: %ld, deletedStores.count: %ld}", buf, 0x20u);
        }

        v75 = v89;
        goto LABEL_88;
      }
    }
  }
  id v17 = +[REMLogStore container];
  v75 = v89;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    sub_100754CF4();
  }
  id v88 = 0;
LABEL_88:

  if (a6) {
    *a6 = v15;
  }

  return v88;
}

- (id)_relocateMisplacedDataSeparationStoresAndFilesWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(RDStoreController *)self hasPassedBuddyAndSystemDataMigrator]
    && [v6 count])
  {
    id v7 = [(RDStoreController *)self _relocateMisplacedDataSeparationStoresWithDataSeparatedStoreURLsMap:v6 deleteFilesMarkedDeleted:v4];
    id v8 = [v6 allKeys];
    __int16 v9 = +[NSMutableSet setWithArray:v8];

    __int16 v10 = [v7 allKeys];
    id v11 = +[NSSet setWithArray:v10];
    [v9 minusSet:v11];

    id v12 = [v9 allObjects];
    uint64_t v13 = [v6 objectsForKeys:v12 notFoundMarker:@"NotFoundInStoreURLsMapAccountIdentifier"];

    [(RDStoreController *)self _relocateMisplacedDataSeparationAccountAttachmentFilesWithRelocatedAccountIdentifiers:v13];
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (id)_relocateMisplacedDataSeparationStoresWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  BOOL v49 = a4;
  id v5 = a3;
  unint64_t v61 = +[NSFileManager defaultManager];
  v66 = self;
  char v54 = [(RDStoreController *)self _reminderDataContainerURLForAccountIdentifier:0];
  id v6 = [v54 path];
  v64 = [v6 stringByStandardizingPath];

  id v52 = [v5 mutableCopy];
  v53 = +[NSMutableSet set];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v73;
    *(void *)&long long v9 = 138544386;
    long long v48 = v9;
    uint64_t v65 = *(void *)v73;
    do
    {
      id v12 = 0;
      id v67 = v10;
      do
      {
        if (*(void *)v73 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(NSObject **)(*((void *)&v72 + 1) + 8 * (void)v12);
        v15 = [v13 path];
        unsigned __int8 v16 = [v15 stringByStandardizingPath];

        id v17 = [v13 lastPathComponent];
        id v18 = [v7 objectForKey:v13];
        if ([v17 length]
          && [v16 length]
          && [v18 length]
          && ![v18 isEqualToString:@"NullMetadataAccountIdentifier"])
        {
          id v20 = v7;
          id v19 = [(RDStoreController *)v66 _reminderDataContainerURLForAccountIdentifier:v18];
          id v21 = [v19 path];
          id v22 = [v21 stringByStandardizingPath];

          unsigned int v68 = v22;
          if ([v22 length] && objc_msgSend(v64, "length"))
          {
            uint64_t v11 = v65;
            id v7 = v20;
            id v10 = v67;
            if (([v16 hasPrefix:v68] & 1) == 0
              && [v16 hasPrefix:v64])
            {
              v62 = v13;
              long long v23 = [(RDStoreController *)v66 databaseDirectoryURLWithContainerURL:v19];
              uint64_t v24 = [v23 URLByAppendingPathComponent:v17];

              long long v25 = (void *)v24;
              if (objc_msgSend(v61, "rem_fileExistsAtURL:", v24))
              {
                unsigned int v26 = v62;
                log = +[REMLogStore container];
                if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                {
                  os_log_t v55 = [v62 absoluteString];
                  [v25 absoluteString];
                  BOOL v27 = v59 = v25;
                  *(_DWORD *)buf = 138544130;
                  id v77 = v18;
                  __int16 v78 = 2114;
                  CFStringRef v79 = v17;
                  __int16 v80 = 2112;
                  os_log_t v81 = v55;
                  __int16 v82 = 2112;
                  CFStringRef v83 = v27;
                  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] There's already a store at the persona container with the same name, skipping this mis-located store at the default container {accountIdentifier: %{public}@, basename: %{public}@, misLocatedStoreURL: %@, relocateToStoreURL: %@}", buf, 0x2Au);

                  long long v25 = v59;
                  unsigned int v26 = v62;
                }
              }
              else
              {
                id v28 = [v62 path];
                unint64_t v60 = v25;
                unsigned int v29 = [v25 path];
                id v71 = 0;
                unsigned int v56 = +[RDSQLiteDBUtils copySQLiteFileAtPath:v28 toPath:v29 timeout:&v71 error:1.0];
                log = v71;

                v30 = +[REMLogStore container];
                id v31 = v30;
                unsigned int v26 = v62;
                if (!v56 || log)
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    __int16 v51 = [v62 absoluteString];
                    [v60 absoluteString];
                    id v33 = v58 = v31;
                    *(_DWORD *)buf = v48;
                    id v77 = v18;
                    __int16 v78 = 2114;
                    CFStringRef v79 = v17;
                    __int16 v80 = 2112;
                    os_log_t v81 = v51;
                    __int16 v82 = 2112;
                    CFStringRef v83 = v33;
                    __int16 v84 = 2114;
                    BOOL v85 = log;
                    _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Failed to clone store located at default container to its correct container path {accountIdentifier: %{public}@, basename: %{public}@, misLocatedStoreURL: %@, relocateToStoreURL: %@, error: %{public}@}", buf, 0x34u);

                    id v31 = v58;
                  }

                  long long v25 = v60;
                }
                else
                {
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    id v50 = [v62 absoluteString];
                    [v60 absoluteString];
                    v32 = v57 = v31;
                    *(_DWORD *)buf = 138544130;
                    id v77 = v18;
                    __int16 v78 = 2114;
                    CFStringRef v79 = v17;
                    __int16 v80 = 2112;
                    os_log_t v81 = v50;
                    __int16 v82 = 2112;
                    CFStringRef v83 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[relocateMisplacedStores] Successfully cloned store located at default container to its correct container path {accountIdentifier: %{public}@, basename: %{public}@, misLocatedStoreURL: %@, relocateToStoreURL: %@}", buf, 0x2Au);

                    id v31 = v57;
                  }

                  [v53 addObject:v62];
                  [v52 removeObjectForKey:v62];
                  long long v25 = v60;
                  [v52 setObject:v18 forKey:v60];
                }
              }

              uint64_t v11 = v65;
              goto LABEL_24;
            }
          }
          else
          {
            unsigned int v26 = +[REMLogStore container];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              id v77 = v18;
              __int16 v78 = 2112;
              CFStringRef v79 = v19;
              __int16 v80 = 2112;
              os_log_t v81 = v54;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Unexpectedly nil container URL(s) path(s) {accountIdentifier: %{public}@, reminderDataContainerURL: %@, defaultReminderDataContainerURL: %@}", buf, 0x20u);
            }
            uint64_t v11 = v65;
            id v7 = v20;
            id v10 = v67;
LABEL_24:
          }
          goto LABEL_12;
        }
        id v19 = +[REMLogStore container];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v77 = v18;
          __int16 v78 = 2114;
          CFStringRef v79 = v17;
          __int16 v80 = 2112;
          os_log_t v81 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Unexpectedly nil store basename/storeURLPath/accountIdentifier {accountIdentifier: %{public}@, basename: %{public}@, storeURL: %@}", buf, 0x20u);
        }
LABEL_12:

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v34 = [v7 countByEnumeratingWithState:&v72 objects:v86 count:16];
      id v10 = v34;
    }
    while (v34);
  }

  if (v49 && [v53 count])
  {
    id v69 = 0;
    id v70 = 0;
    unsigned int v35 = [(RDStoreController *)v66 _removeFilesOfStoresAtURLs:v53 outRemovedFileURLs:&v70 error:&v69];
    id v36 = v70;
    id v37 = v69;
    id v38 = [v36 allObjects];
    BOOL v39 = [v38 valueForKey:@"lastPathComponent"];

    CFStringRef v40 = [v39 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

    unsigned __int8 v41 = +[NSPredicate predicateWithFormat:@"!(SELF ENDSWITH[c] 'shm') && !(SELF ENDSWITH[c] 'wal')"];
    id v42 = [v40 filteredArrayUsingPredicate:v41];

    long long v43 = +[REMLogStore container];
    long long v44 = v43;
    if (v35)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = [v36 count];
        *(_DWORD *)buf = 134218242;
        id v77 = v45;
        __int16 v78 = 2112;
        CFStringRef v79 = v42;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[relocateMisplacedStores] Deleted store files and journals of mis-located stores {total: %ld, removeStoreNames: %@}", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      unsigned int v47 = [v36 count];
      *(_DWORD *)buf = 138543874;
      id v77 = v37;
      __int16 v78 = 2048;
      CFStringRef v79 = v47;
      __int16 v80 = 2112;
      os_log_t v81 = v42;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[relocateMisplacedStores] Failed to delete (some) mis-located store files {error: %{public}@, totalRemoved: %ld, removedFileNames: %@}", buf, 0x20u);
    }
  }

  return v52;
}

- (void)_relocateMisplacedDataSeparationAccountAttachmentFilesWithRelocatedAccountIdentifiers:(id)a3
{
  id v5 = a3;
  id v14 = (id)objc_opt_new();
  id v6 = [[RDAttachmentFileManager alloc] initWithDocumentsURLProvider:v14];
  id v7 = [(RDStoreController *)self attachmentFileManager];
  id v8 = +[NSMutableSet setWithArray:v5];

  long long v9 = +[NSSet setWithObjects:@"NullMetadataAccountIdentifier", @"NotFoundInStoreURLsMapAccountIdentifier", 0];
  [v8 minusSet:v9];

  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  id v12 = NSStringFromSelector(a2);
  uint64_t v13 = +[NSString stringWithFormat:@"%@.%@", v11, v12];
  [(RDStoreController *)self _moveAttachmentFilesFromAttachmentFileManager:v6 toAttachmentFileManager:v7 affectedAccountIdentifiers:v8 logPrefix:v13];
}

- (id)_performDataSeparationMigrationIfNeededWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSDictionary dictionary];
  id v8 = +[RDFeatureFlagsObjCWrapper wrappedFeatureFlagsWithRawValue:@"dataSeparation"];
  if ([v8 isEnabled])
  {
    long long v9 = [(RDStoreController *)self _migrateStoresToPostDataSeparationLocationsWithDataSeparatedStoreURLsMap:v6 deleteFilesMarkedDeleted:v4];

    id v10 = +[REMLogStore container];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v17 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[performDataSeparationMigration] Stores migrated: %ld", buf, 0xCu);
    }

    if ([v6 count] || objc_msgSend(v9, "count"))
    {
      [(RDStoreController *)self _migrateMLModelsToPostDataSeparationLocationIfNeeded];
      uint64_t v11 = [v6 allValues];
      id v12 = +[NSMutableSet setWithArray:v11];

      uint64_t v13 = [v9 allValues];
      [v12 addObjectsFromArray:v13];

      id v14 = +[NSSet setWithObjects:@"NullMetadataAccountIdentifier", 0];
      [v12 minusSet:v14];

      [(RDStoreController *)self _migrateAttachmentFilesToPostDataSeparationLocationsIfNeededWithAccountIdentifiers:v12];
      [(RDStoreController *)self _migrateBackupStoresToPostDataSeparationLocationIfNeeded];
    }
    [(RDStoreController *)self _cleanUpPreDataSeparationDataContainerIfNeeded];
  }
  else
  {
    long long v9 = v7;
  }

  return v9;
}

- (id)_migrateStoresToPostDataSeparationLocationsWithDataSeparatedStoreURLsMap:(id)a3 deleteFilesMarkedDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = +[NSFileManager defaultManager];
  long long v9 = +[REMPaths legacy_applicationDocumentsURL];
  id v10 = +[RDPaths reminderDataContainerURLWithAppDocumentsURL:v9];
  if (objc_msgSend(v8, "rem_fileExistsAtURL:", v10))
  {
    uint64_t v11 = +[NSSet setWithObject:v10];
    id v98 = 0;
    __int16 v80 = self;
    BOOL v76 = v4;
    id v12 = [(RDStoreController *)self l_discoverAccountStoreURLsFromReminderDataContainerURLs:v11 deletingFilesMarkedDeleted:v4 storesDiscoveryStatesRef:0 error:&v98];
    id v13 = v98;

    if (v13)
    {
      id v14 = +[REMLogStore container];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100754E98(v10, (uint64_t)v13, v14);
      }
    }
    if ([v12 count])
    {
      id v71 = v13;
      long long v73 = v10;
      long long v74 = v9;
      id v77 = v7;
      v15 = [v6 allValues];
      __int16 v82 = +[NSSet setWithArray:v15];

      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_10006F010;
      v96[3] = &unk_1008B0670;
      id v79 = (id)objc_opt_new();
      id v97 = v79;
      id v75 = v6;
      [v6 enumerateKeysAndObjectsUsingBlock:v96];
      __int16 v78 = +[NSMutableSet set];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v72 = v12;
      id v16 = v12;
      id v17 = [v16 countByEnumeratingWithState:&v92 objects:v109 count:16];
      os_log_t v81 = v8;
      id v19 = INDateRelevanceProvider_ptr;
      if (v17)
      {
        id v20 = v17;
        uint64_t v21 = *(void *)v93;
        *(void *)&long long v18 = 138544386;
        long long v70 = v18;
        id v85 = v16;
        uint64_t v87 = *(void *)v93;
        do
        {
          id v22 = 0;
          id v83 = v20;
          do
          {
            if (*(void *)v93 != v21) {
              objc_enumerationMutation(v16);
            }
            long long v23 = *(void **)(*((void *)&v92 + 1) + 8 * (void)v22);
            long long v25 = [v23 lastPathComponent];
            if ([v25 length]
              && (objc_msgSend(v8, "rem_fileExistsAtURL:", v23) & 1) != 0)
            {
              unsigned int v26 = [v16 objectForKey:v23];
              if (![v26 length]
                || [v26 isEqualToString:@"NullMetadataAccountIdentifier"])
              {
                BOOL v27 = [v19[202] container:v70];
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  id v28 = [v23 absoluteString];
                  *(_DWORD *)buf = 138412546;
                  unsigned int v100 = v28;
                  __int16 v101 = 2114;
                  CFStringRef v102 = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Found a store from legacy container path with nil acccount identifier {legacyStoreURL: %@, legacyStoreName: %{public}@}", buf, 0x16u);

                  goto LABEL_25;
                }
                goto LABEL_44;
              }
              if ([v82 containsObject:v26])
              {
                BOOL v27 = [v79 objectForKey:v26];
                unsigned int v30 = [v8 rem_fileExistsAtURL:v27];
                id v31 = v19;
                unsigned int v32 = v30;
                id v33 = [v31[202] container];
                id v34 = v33;
                if (v32)
                {
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v35 = [v23 absoluteString];
                    id v36 = [v27 absoluteString];
                    *(_DWORD *)buf = 138544130;
                    unsigned int v100 = v26;
                    __int16 v101 = 2114;
                    CFStringRef v102 = v25;
                    __int16 v103 = 2112;
                    id v104 = v35;
                    __int16 v105 = 2112;
                    id v106 = v36;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Found store at modern container path with the same account ID of the store at legacy container path, we're good and no need to clone {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);

                    id v8 = v81;
                  }

                  [v78 addObject:v23];
                  id v19 = INDateRelevanceProvider_ptr;
LABEL_25:
                  id v16 = v85;
LABEL_44:

                  uint64_t v21 = v87;
                  goto LABEL_45;
                }
                if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                {
                  BOOL v49 = [v23 absoluteString];
                  id v50 = [v27 absoluteString];
                  *(_DWORD *)buf = 138544130;
                  unsigned int v100 = v26;
                  __int16 v101 = 2114;
                  CFStringRef v102 = v25;
                  __int16 v103 = 2112;
                  id v104 = v49;
                  __int16 v105 = 2112;
                  id v106 = v50;
                  _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "[migrateStoresToDataSeparationLocations] Unexpectedly found store in our map with the same account ID of the store at legacy container path but file DOES NOT EXIST at modern container path {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);

                  id v8 = v81;
                }

                id v19 = INDateRelevanceProvider_ptr;
              }
              BOOL v27 = -[RDStoreController _reminderDataContainerURLForAccountIdentifier:](v80, "_reminderDataContainerURLForAccountIdentifier:", v26, v70);
              __int16 v84 = [(RDStoreController *)v80 databaseDirectoryURLWithContainerURL:v27];
              v86 = [v84 URLByAppendingPathComponent:v25];
              id v37 = [v19[202] container];
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                id v38 = [v23 absoluteString];
                BOOL v39 = [v27 absoluteString];
                *(_DWORD *)buf = 138544130;
                unsigned int v100 = v26;
                __int16 v101 = 2114;
                CFStringRef v102 = v25;
                __int16 v103 = 2112;
                id v104 = v38;
                __int16 v105 = 2112;
                id v106 = v39;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Will proceed cloning this store at legacy container path to its modern container path because we did not find it any store with the same account ID at the modern container paths {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernDataContainerURL: %@}", buf, 0x2Au);

                id v8 = v81;
                id v19 = INDateRelevanceProvider_ptr;
              }

              if (objc_msgSend(v8, "rem_fileExistsAtURL:", v86))
              {
                CFStringRef v40 = [v19[202] container];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                {
                  unsigned __int8 v41 = [v23 absoluteString];
                  id v42 = [v86 absoluteString];
                  *(_DWORD *)buf = 138544130;
                  unsigned int v100 = v26;
                  __int16 v101 = 2114;
                  CFStringRef v102 = v25;
                  __int16 v103 = 2112;
                  id v104 = v41;
                  __int16 v105 = 2112;
                  id v106 = v42;
                  _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "[migrateStoresToDataSeparationLocations] Unexpectedly found store at modern container path but account identifier DOES NOT EXIST in our store map {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);

                  id v8 = v81;
                  goto LABEL_41;
                }
              }
              else
              {
                long long v43 = [v23 path];
                long long v44 = [v86 path];
                id v91 = 0;
                unsigned int v45 = +[RDSQLiteDBUtils copySQLiteFileAtPath:v43 toPath:v44 timeout:&v91 error:1.0];
                CFStringRef v40 = v91;

                if (!v45 || v40)
                {
                  unsigned __int8 v41 = +[REMLogStore container];
                  id v8 = v81;
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    __int16 v51 = [v23 absoluteString];
                    id v52 = [v86 absoluteString];
                    *(_DWORD *)buf = v70;
                    unsigned int v100 = v26;
                    __int16 v101 = 2114;
                    CFStringRef v102 = v25;
                    __int16 v103 = 2112;
                    id v104 = v51;
                    __int16 v105 = 2112;
                    id v106 = v52;
                    __int16 v107 = 2114;
                    id v108 = v40;
                    _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Failed to clone store from legacy container path to its modern container path {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@, error: %{public}@}", buf, 0x34u);

                    id v8 = v81;
                  }
LABEL_41:
                }
                else
                {
                  [v77 setObject:v26 forKey:v86];
                  long long v46 = +[REMLogStore container];
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    unsigned int v47 = [v23 absoluteString];
                    long long v48 = [v86 absoluteString];
                    *(_DWORD *)buf = 138544130;
                    unsigned int v100 = v26;
                    __int16 v101 = 2114;
                    CFStringRef v102 = v25;
                    __int16 v103 = 2112;
                    id v104 = v47;
                    __int16 v105 = 2112;
                    id v106 = v48;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Successfully cloned store at legacy container path to its modern container path {accountIdentifier: %{public}@, basename: %{public}@, legacyStoreURL: %@, modernStoreURL: %@}", buf, 0x2Au);
                  }
                  [v78 addObject:v23];
                  id v8 = v81;
                }
                id v19 = INDateRelevanceProvider_ptr;
              }
              id v16 = v85;

              id v20 = v83;
              goto LABEL_44;
            }
            unsigned int v26 = [v19[202] container:v70];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              unsigned int v29 = [v23 absoluteString];
              *(_DWORD *)buf = 138412546;
              unsigned int v100 = v29;
              __int16 v101 = 2114;
              CFStringRef v102 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Unexpected nil legacy store basename or legacy store file doesn't exist {legacyStoreURL: %@, legacyStoreName: %{public}@}", buf, 0x16u);

              id v16 = v85;
            }
LABEL_45:

            id v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          id v20 = [v16 countByEnumeratingWithState:&v92 objects:v109 count:16];
        }
        while (v20);
      }

      id v12 = v72;
      id v10 = v73;
      id v13 = v71;
      if (v76 && [v78 count])
      {
        id v88 = [(RDStoreController *)v80 storeURLWithName:@"local" withContainerURL:v73];
        [v78 addObject:];
        id v89 = 0;
        id v90 = 0;
        unsigned int v53 = [(RDStoreController *)v80 _removeFilesOfStoresAtURLs:v78 outRemovedFileURLs:&v90 error:&v89];
        id v54 = v90;
        os_log_t v55 = v89;
        unsigned int v56 = [v54 allObjects];
        [v56 valueForKey:@"lastPathComponent"];
        v58 = v57 = v19;

        v59 = [v58 sortedArrayUsingSelector:"caseInsensitiveCompare:"];

        unint64_t v60 = +[NSPredicate predicateWithFormat:@"!(SELF ENDSWITH[c] 'shm') && !(SELF ENDSWITH[c] 'wal')"];
        unint64_t v61 = [v59 filteredArrayUsingPredicate:v60];

        v62 = [v57[202] container];
        CFStringRef v63 = v62;
        if (v53)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v64 = [v54 count];
            *(_DWORD *)buf = 134218242;
            unsigned int v100 = v64;
            __int16 v101 = 2112;
            CFStringRef v102 = v61;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "[migrateStoresToDataSeparationLocations] Deleted store files and journals at legacy container path after migration {total: %ld, removeStoreNames: %@}", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          id v69 = [v54 count];
          *(_DWORD *)buf = 138543874;
          unsigned int v100 = v55;
          __int16 v101 = 2048;
          CFStringRef v102 = v69;
          __int16 v103 = 2112;
          id v104 = v61;
          _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "[migrateStoresToDataSeparationLocations] Failed to delete (some) store files from legacy container path after migration {error: %{public}@, totalRemoved: %ld, removedFileNames: %@}", buf, 0x20u);
        }

        id v8 = v81;
      }
      id v7 = v77;
      id v67 = v77;

      long long v9 = v74;
      id v6 = v75;
    }
    else
    {
      id v66 = v7;
    }
  }
  else
  {
    id v65 = v7;
  }

  return v7;
}

- (void)_migrateBackupStoresToPostDataSeparationLocationIfNeeded
{
  uint64_t v3 = +[NSFileManager defaultManager];
  CFStringRef v40 = +[REMPaths legacy_applicationDocumentsURL];
  BOOL v4 = +[RDPaths reminderDataContainerURLWithAppDocumentsURL:](RDPaths, "reminderDataContainerURLWithAppDocumentsURL:");
  id v5 = [(RDStoreController *)self databaseBackupDirectoryURLWithContainerURL:v4];
  id v6 = [(RDStoreController *)self databaseStagedMigrationDirectoryURLWithContainerURL:v4];
  id v7 = +[RDPaths defaultReminderDataContainerURL];
  id v8 = [(RDStoreController *)self databaseBackupDirectoryURLWithContainerURL:v7];
  long long v9 = [(RDStoreController *)self databaseStagedMigrationDirectoryURLWithContainerURL:v7];
  if (objc_msgSend(v3, "rem_fileExistsAtURL:", v5))
  {
    id v42 = 0;
    unsigned int v10 = [v3 moveItemAtURL:v5 toURL:v8 error:&v42];
    id v36 = v42;
    uint64_t v11 = +[REMLogStore container];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        id v13 = (objc_class *)objc_opt_class();
        id v33 = NSStringFromClass(v13);
        unsigned int v29 = NSStringFromSelector(a2);
        +[NSString stringWithFormat:@"%@.%@", v33, v29];
        id v14 = v31 = v9;
        v15 = [v8 absoluteString];
        *(_DWORD *)buf = 138543618;
        long long v44 = v14;
        __int16 v45 = 2112;
        long long v46 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Moved Stores-Backup from legacy contanier to the post-data-separation default container {modernStoresBackupDirURL: %@}", buf, 0x16u);

        long long v9 = v31;
      }
    }
    else if (v12)
    {
      id v16 = (objc_class *)objc_opt_class();
      unsigned int v32 = NSStringFromClass(v16);
      unsigned int v30 = NSStringFromSelector(a2);
      +[NSString stringWithFormat:@"%@.%@", v32, v30];
      id v17 = v34 = v8;
      long long v18 = [v34 absoluteString];
      *(_DWORD *)buf = 138543874;
      long long v44 = v17;
      __int16 v45 = 2112;
      long long v46 = v18;
      __int16 v47 = 2114;
      id v48 = v36;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to move Stores-Backup from legacy contanier to the post-data-separation default container {modernStoresBackupDirURL: %@, error: %{public}@}", buf, 0x20u);

      id v8 = v34;
    }
  }
  if (objc_msgSend(v3, "rem_fileExistsAtURL:", v6))
  {
    id v41 = 0;
    unsigned int v19 = [v3 moveItemAtURL:v6 toURL:v9 error:&v41];
    id v37 = v41;
    id v20 = +[REMLogStore container];
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        id v22 = (objc_class *)objc_opt_class();
        unsigned int v35 = NSStringFromClass(v22);
        NSStringFromSelector(a2);
        aSelectora = (char *)objc_claimAutoreleasedReturnValue();
        long long v23 = +[NSString stringWithFormat:@"%@.%@", v35, aSelectora];
        uint64_t v24 = [v9 absoluteString];
        *(_DWORD *)buf = 138543618;
        long long v44 = v23;
        __int16 v45 = 2112;
        long long v46 = v24;
        long long v25 = "[%{public}@] Moved Stores-StagedMigration from legacy contanier to the post-data-separation default contai"
              "ner {modernStoresStagedMigrationDirURL: %@}";
        unsigned int v26 = v20;
        uint32_t v27 = 22;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
    else if (v21)
    {
      id v28 = (objc_class *)objc_opt_class();
      unsigned int v35 = NSStringFromClass(v28);
      NSStringFromSelector(a2);
      aSelectora = (char *)objc_claimAutoreleasedReturnValue();
      long long v23 = +[NSString stringWithFormat:@"%@.%@", v35, aSelectora];
      uint64_t v24 = [v9 absoluteString];
      *(_DWORD *)buf = 138543874;
      long long v44 = v23;
      __int16 v45 = 2112;
      long long v46 = v24;
      __int16 v47 = 2114;
      id v48 = v37;
      long long v25 = "[%{public}@] Failed to move Stores-StagedMigration from legacy contanier to the post-data-separation default"
            " container {modernStoresStagedMigrationDirURL: %@, error: %{public}@}";
      unsigned int v26 = v20;
      uint32_t v27 = 32;
      goto LABEL_14;
    }
  }
}

- (void)_migrateMLModelsToPostDataSeparationLocationIfNeeded
{
  uint64_t v3 = +[NSFileManager defaultManager];
  BOOL v4 = INDateRelevanceProvider_ptr;
  id v5 = +[REMPaths _legacy_mlModelURL];
  if (objc_msgSend(v3, "rem_fileExistsAtURL:", v5))
  {
    id v6 = +[REMPaths mlModelURL];
    if (objc_msgSend(v3, "rem_fileExistsAtURL:", v6))
    {
      unsigned int v7 = [v3 rem_isEmptyDirectoryAtURL:v6 skipsHiddenFiles:0];
      id v8 = +[REMLogStore container];
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (!v7)
      {
        if (v9)
        {
          id v34 = (objc_class *)objc_opt_class();
          unsigned int v35 = NSStringFromClass(v34);
          id v36 = NSStringFromSelector(a2);
          id v37 = +[NSString stringWithFormat:@"%@.%@", v35, v36];
          [v6 absoluteString];
          BOOL v39 = v38 = a2;
          *(_DWORD *)buf = 138543618;
          id v69 = v37;
          __int16 v70 = 2112;
          id v71 = v39;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] ML models already exist and non-empty at modern location, don't overwrite it with the legacy copy {modernMLModelURL: %@}", buf, 0x16u);

          a2 = v38;
          BOOL v4 = INDateRelevanceProvider_ptr;
        }
        goto LABEL_21;
      }
      if (v9)
      {
        unsigned int v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        BOOL v12 = NSStringFromSelector(a2);
        id v13 = +[NSString stringWithFormat:@"%@.%@", v11, v12];
        [v6 absoluteString];
        v15 = id v14 = a2;
        *(_DWORD *)buf = 138543618;
        id v69 = v13;
        __int16 v70 = 2112;
        id v71 = v15;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] ML model directory exists at modern location but is empty or not a directory, removing before proceeding {modernMLModelURL: %@}", buf, 0x16u);

        a2 = v14;
        BOOL v4 = INDateRelevanceProvider_ptr;
      }
      id v67 = 0;
      [v3 removeItemAtURL:v6 error:&v67];
      id v16 = v67;
      if (v16)
      {
        id v17 = +[REMLogStore container];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          os_log_t v55 = (objc_class *)objc_opt_class();
          unsigned int v56 = NSStringFromClass(v55);
          NSStringFromSelector(a2);
          v58 = v57 = a2;
          v59 = +[NSString stringWithFormat:@"%@.%@", v56, v58];
          *(_DWORD *)buf = 138543618;
          id v69 = v59;
          __int16 v70 = 2114;
          id v71 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Could not remove the the empty dir or existing file at the modern ML model location before proceeding {error: %{public}@}", buf, 0x16u);

          a2 = v57;
          BOOL v4 = INDateRelevanceProvider_ptr;
        }
      }
    }
    id v66 = 0;
    unsigned __int8 v18 = [v3 moveItemAtURL:v5 toURL:v6 error:&v66];
    id v8 = v66;
    unsigned int v19 = +[REMLogStore container];
    id v20 = v19;
    if ((v18 & 1) == 0)
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_36;
      }
      unsigned int v30 = (objc_class *)objc_opt_class();
      id v31 = NSStringFromClass(v30);
      unsigned int v32 = NSStringFromSelector(a2);
      id v33 = +[NSString stringWithFormat:@"%@.%@", v31, v32];
      *(_DWORD *)buf = 138544130;
      id v69 = v33;
      __int16 v70 = 2112;
      id v71 = v5;
      __int16 v72 = 2112;
      long long v73 = v6;
      __int16 v74 = 2114;
      id v75 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to move ML models to modern location {legacyMLModelURL: %@, modernMLModelURL: %@, error: %{public}@}", buf, 0x2Au);

      goto LABEL_34;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      NSStringFromSelector(a2);
      uint64_t v24 = v23 = a2;
      long long v25 = +[NSString stringWithFormat:@"%@.%@", v22, v24];
      *(_DWORD *)buf = 138543874;
      id v69 = v25;
      __int16 v70 = 2112;
      id v71 = v5;
      __int16 v72 = 2112;
      long long v73 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully moved ML models to modern location {legacyMLModelURL: %@, modernMLModelURL: %@}", buf, 0x20u);

      a2 = v23;
      BOOL v4 = INDateRelevanceProvider_ptr;
    }
LABEL_21:

    if (!objc_msgSend(v3, "rem_fileExistsAtURL:", v5)) {
      goto LABEL_28;
    }
    id v65 = 0;
    unsigned __int8 v40 = [v3 removeItemAtURL:v5 error:&v65];
    id v41 = v65;
    id v42 = +[REMLogStore container];
    long long v43 = v42;
    if (v40)
    {
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

LABEL_28:
        id v8 = [v4[213] _legacy_temporaryMLModelURL];
        if (objc_msgSend(v3, "rem_fileExistsAtURL:", v8))
        {
          id v64 = 0;
          unsigned __int8 v49 = [v3 removeItemAtURL:v8 error:&v64];
          id v20 = v64;
          id v50 = +[REMLogStore container];
          id v33 = v50;
          if ((v49 & 1) == 0)
          {
            if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
              goto LABEL_34;
            }
            CFStringRef v63 = (objc_class *)objc_opt_class();
            id v52 = NSStringFromClass(v63);
            unsigned int v53 = NSStringFromSelector(a2);
            id v54 = +[NSString stringWithFormat:@"%@.%@", v52, v53];
            *(_DWORD *)buf = 138543874;
            id v69 = v54;
            __int16 v70 = 2112;
            id v71 = v8;
            __int16 v72 = 2114;
            long long v73 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove temporary ML models at legacy location {legacyTempMLModelURL: %@, error: %{public}@}", buf, 0x20u);
            goto LABEL_32;
          }
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v51 = (objc_class *)objc_opt_class();
            id v52 = NSStringFromClass(v51);
            unsigned int v53 = NSStringFromSelector(a2);
            id v54 = +[NSString stringWithFormat:@"%@.%@", v52, v53];
            *(_DWORD *)buf = 138543618;
            id v69 = v54;
            __int16 v70 = 2112;
            id v71 = v8;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed temporary ML models at legacty location {legacyTempMLModelURL: %@}", buf, 0x16u);
LABEL_32:
          }
LABEL_34:

          goto LABEL_35;
        }
LABEL_36:

        goto LABEL_37;
      }
      long long v44 = (objc_class *)objc_opt_class();
      __int16 v45 = NSStringFromClass(v44);
      NSStringFromSelector(a2);
      __int16 v47 = v46 = a2;
      id v48 = +[NSString stringWithFormat:@"%@.%@", v45, v47];
      *(_DWORD *)buf = 138543618;
      id v69 = v48;
      __int16 v70 = 2112;
      id v71 = v5;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed ML models at legacty location {legacyMLModelURL: %@}", buf, 0x16u);

      a2 = v46;
      BOOL v4 = INDateRelevanceProvider_ptr;
    }
    else
    {
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      unint64_t v60 = (objc_class *)objc_opt_class();
      __int16 v45 = NSStringFromClass(v60);
      NSStringFromSelector(a2);
      v62 = unint64_t v61 = a2;
      id v48 = +[NSString stringWithFormat:@"%@.%@", v45, v62];
      *(_DWORD *)buf = 138543874;
      id v69 = v48;
      __int16 v70 = 2112;
      id v71 = v5;
      __int16 v72 = 2114;
      long long v73 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove ML models at legacy location {legacyMLModelURL: %@, error: %{public}@}", buf, 0x20u);

      a2 = v61;
    }

    goto LABEL_27;
  }
  id v6 = +[REMLogStore container];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v26 = (objc_class *)objc_opt_class();
    uint32_t v27 = NSStringFromClass(v26);
    id v28 = NSStringFromSelector(a2);
    id v8 = +[NSString stringWithFormat:@"%@.%@", v27, v28];
    unsigned int v29 = [v5 absoluteString];
    *(_DWORD *)buf = 138543618;
    id v69 = v8;
    __int16 v70 = 2112;
    id v71 = v29;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] No ML models found at legacy location {legacyMLModelURL: %@}", buf, 0x16u);

    goto LABEL_36;
  }
LABEL_37:
}

- (void)_migrateAttachmentFilesToPostDataSeparationLocationsIfNeededWithAccountIdentifiers:(id)a3
{
  id v5 = a3;
  id v6 = objc_opt_new();
  unsigned int v7 = [[RDAttachmentFileManager alloc] initWithDocumentsURLProvider:v6];
  id v8 = [(RDStoreController *)self attachmentFileManager];
  BOOL v9 = +[NSFileManager defaultManager];
  unsigned int v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  BOOL v12 = NSStringFromSelector(a2);
  id v13 = +[NSString stringWithFormat:@"%@.%@", v11, v12];
  [(RDStoreController *)self _moveAttachmentFilesFromAttachmentFileManager:v7 toAttachmentFileManager:v8 affectedAccountIdentifiers:v5 logPrefix:v13];

  [(RDStoreController *)self _migrateImageDeduplicationSentinelFileIfNeededWithPreMigrationAttachmentFileManager:v7 dataSeparationAttachmentFileManager:v8];
  id v14 = [(RDAttachmentFileManager *)v7 URLForDefaultFilesDirectory];
  if (objc_msgSend(v9, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v14, 0))
  {
    id v24 = 0;
    unsigned __int8 v15 = [v9 removeItemAtURL:v14 error:&v24];
    id v16 = v24;
    id v17 = +[REMLogStore container];
    unsigned __int8 v18 = v17;
    if (v15)
    {
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        goto LABEL_8;
      }
      unsigned int v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      BOOL v21 = NSStringFromSelector(a2);
      id v22 = +[NSString stringWithFormat:@"%@.%@", v20, v21];
      *(_DWORD *)buf = 138543362;
      unsigned int v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed empty pre-migration 'Files' directory", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      long long v23 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v23);
      BOOL v21 = NSStringFromSelector(a2);
      id v22 = +[NSString stringWithFormat:@"%@.%@", v20, v21];
      *(_DWORD *)buf = 138543618;
      unsigned int v26 = v22;
      __int16 v27 = 2114;
      id v28 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove empty pre-migration 'Files' directory {error: %{public}@}", buf, 0x16u);
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_moveAttachmentFilesFromAttachmentFileManager:(id)a3 toAttachmentFileManager:(id)a4 affectedAccountIdentifiers:(id)a5 logPrefix:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  id v39 = v12;
  uint64_t v14 = +[NSFileManager defaultManager];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v15 = v11;
  id v16 = (void *)v14;
  id obj = v15;
  id v44 = [v15 countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v50;
    *(void *)&long long v17 = 138544130;
    long long v37 = v17;
    unsigned __int8 v40 = v13;
    id v41 = (void *)v14;
    id v38 = v9;
    do
    {
      unsigned __int8 v18 = 0;
      do
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(obj);
        }
        unsigned int v19 = *(NSObject **)(*((void *)&v49 + 1) + 8 * (void)v18);
        id v21 = [objc_alloc((Class)NSUUID) initWithUUIDString:v19];
        if (v21)
        {
          id v22 = [v9 URLForAccountFileDirectory:v21];
          long long v23 = [v13 URLForAccountFileDirectory:v21];
          if (objc_msgSend(v16, "rem_fileExistsAtURL:", v22))
          {
            if (!objc_msgSend(v16, "rem_fileExistsAtURL:", v23)) {
              goto LABEL_17;
            }
            if (objc_msgSend(v16, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v23, 1))
            {
              id v24 = +[REMLogStore container];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v54 = v39;
                __int16 v55 = 2114;
                unsigned int v56 = v19;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] File attachment directory exists but is empty or not directory with given toAttachmentFileManager, removing before proceeding {accountIdentifier: %{public}@}", buf, 0x16u);
              }

              id v48 = 0;
              [v16 removeItemAtURL:v23 error:&v48];
              long long v25 = v48;
              if (v25)
              {
                unsigned int v26 = +[REMLogStore container];
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  id v54 = v39;
                  __int16 v55 = 2114;
                  unsigned int v56 = v19;
                  __int16 v57 = 2114;
                  v58 = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Could not remove the the empty dir or existing file at the toAttachmentFileManager location before proceeding {accountIdentifier: %{public}@, error: %{public}@}", buf, 0x20u);
                }

                id v16 = v41;
              }

LABEL_17:
              __int16 v27 = [v23 URLByDeletingLastPathComponent];
              if (v27)
              {
                id v46 = 0;
                [v16 rem_createDirectoryIfNecessaryAtURL:v27 error:&v46];
                id v28 = v46;
                if (v28)
                {
                  unsigned int v29 = v28;
                  unsigned int v30 = +[REMLogStore container];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v54 = v39;
                    __int16 v55 = 2112;
                    unsigned int v56 = v27;
                    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to create container files directory given by the toAttachmentFileManager {destinationContainerFilesDirectoryURL: %@}", buf, 0x16u);
                  }

                  goto LABEL_37;
                }
              }
              id v45 = 0;
              unsigned __int8 v31 = [v16 moveItemAtURL:v22 toURL:v23 error:&v45];
              id v32 = v45;
              id v33 = +[REMLogStore container];
              id v34 = v33;
              if (v31)
              {
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  id v54 = v39;
                  __int16 v55 = 2114;
                  unsigned int v56 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sucessfully moved file attachment directory to target location given by the toAttachmentFileManager {accountIdentifier: %{public}@}", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544386;
                id v54 = v39;
                __int16 v55 = 2114;
                unsigned int v56 = v19;
                __int16 v57 = 2112;
                v58 = v22;
                __int16 v59 = 2112;
                unint64_t v60 = v23;
                __int16 v61 = 2114;
                id v62 = v32;
                _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to move file attachment directory given by the fromAttachmentFileManager to target location given by the toAttachmentFileManager {accountIdentifier: %{public}@, fromAccountFileDirectoryURL: %@, toAccountFileDirectoryURL: %@, error: %{public}@}", buf, 0x34u);
              }

              id v9 = v38;
            }
            else
            {
              id v47 = 0;
              unsigned __int8 v35 = [v16 removeItemAtURL:v22 error:&v47];
              __int16 v27 = v47;
              id v36 = +[REMLogStore container];
              unsigned int v29 = v36;
              if (v35)
              {
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  id v54 = v39;
                  __int16 v55 = 2114;
                  unsigned int v56 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] File attachment directory already exist and non-empty with given fromAttachmentFileManager, successfully removed source copy {accountIdentifier: %{public}@}", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v37;
                id v54 = v39;
                __int16 v55 = 2112;
                unsigned int v56 = v19;
                __int16 v57 = 2112;
                v58 = v22;
                __int16 v59 = 2114;
                unint64_t v60 = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%{public}@] File attachment directory already exist and non-empty with given fromAttachmentFileManager, but failed to remove the source copy {accountIdentifier: %@, fromAccountFileDirectoryURL: %@, error: %{public}@}", buf, 0x2Au);
              }
LABEL_37:
            }
            id v13 = v40;
            id v16 = v41;
          }
          else
          {
            __int16 v27 = +[REMLogStore container];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              id v54 = v39;
              __int16 v55 = 2114;
              unsigned int v56 = v19;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}@] No need to move file attachments of given fromAttachmentFileManager as the source directory is not found {accountIdentifier: %{public}@}", buf, 0x16u);
            }
          }

          goto LABEL_40;
        }
        id v22 = +[REMLogStore container];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v54 = v39;
          __int16 v55 = 2114;
          unsigned int v56 = v19;
          _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "[%{public}@] Account identifier is not a UUID {accountIdentifier: %{public}@}", buf, 0x16u);
        }
LABEL_40:

        unsigned __int8 v18 = (char *)v18 + 1;
      }
      while (v44 != v18);
      id v44 = [obj countByEnumeratingWithState:&v49 objects:v63 count:16];
    }
    while (v44);
  }
}

- (void)_migrateImageDeduplicationSentinelFileIfNeededWithPreMigrationAttachmentFileManager:(id)a3 dataSeparationAttachmentFileManager:(id)a4
{
  id v46 = a3;
  id v43 = a4;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = +[RDImageDeduplicationActivityObjC SentinelFileName];
  v60[0] = v5;
  id v6 = +[RDSavedImageDeduplicationActivityObjC SentinelFileName];
  v60[1] = v6;
  unsigned int v7 = +[NSArray arrayWithObjects:v60 count:2];

  id obj = v7;
  id v47 = [v7 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v47)
  {
    uint64_t v8 = *(void *)v51;
    id v9 = INDateRelevanceProvider_ptr;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v12 = [v9[43] defaultManager];
        id v13 = [v46 URLForDefaultFilesDirectory];
        uint64_t v14 = [v13 URLByAppendingPathComponent:v11];
        if (objc_msgSend(v12, "rem_fileExistsAtURL:", v14))
        {
          id v45 = v13;
          id v15 = [v43 URLForDefaultFilesDirectory];
          id v16 = [v15 URLByAppendingPathComponent:v11];
          if (objc_msgSend(v12, "rem_fileExistsAtURL:", v16))
          {
            long long v17 = +[REMLogStore container];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              unsigned __int8 v18 = (objc_class *)objc_opt_class();
              id v39 = NSStringFromClass(v18);
              NSStringFromSelector(a2);
              id v20 = v19 = v16;
              id v21 = +[NSString stringWithFormat:@"%@.%@", v39, v20];
              id v22 = [v19 absoluteString];
              *(_DWORD *)buf = 138543874;
              __int16 v55 = v21;
              __int16 v56 = 2114;
              uint64_t v57 = v11;
              __int16 v58 = 2112;
              id v59 = v22;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Post-migration '%{public}@' sentinel file already exists, removing pre-migration copy {postMigrationImageDedupSentinelFileURL: %@}", buf, 0x20u);

              id v9 = INDateRelevanceProvider_ptr;
              id v16 = v19;

              uint64_t v8 = v41;
            }

            id v49 = 0;
            [v12 removeItemAtURL:v14 error:&v49];
            id v23 = v49;
            if (v23)
            {
              id v24 = +[REMLogStore container];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                long long v25 = (objc_class *)objc_opt_class();
                unsigned int v26 = NSStringFromClass(v25);
                NSStringFromSelector(a2);
                v27 = unsigned __int8 v40 = v16;
                id v28 = +[NSString stringWithFormat:@"%@.%@", v26, v27];
                *(_DWORD *)buf = 138543874;
                __int16 v55 = v28;
                __int16 v56 = 2114;
                uint64_t v57 = v11;
                __int16 v58 = 2114;
                id v59 = v23;
                unsigned int v29 = v24;
                unsigned int v30 = "[%{public}@] Could not remove pre-migration  '%{public}@' sentinel file {error: %{public}@}";
                goto LABEL_20;
              }
LABEL_23:
            }
            id v13 = v45;
            goto LABEL_25;
          }
          id v48 = 0;
          unsigned __int8 v35 = [v12 moveItemAtURL:v14 toURL:v16 error:&v48];
          id v23 = v48;
          id v36 = +[REMLogStore container];
          id v24 = v36;
          if (v35)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              long long v37 = (objc_class *)objc_opt_class();
              unsigned int v26 = NSStringFromClass(v37);
              NSStringFromSelector(a2);
              v27 = unsigned __int8 v40 = v16;
              id v28 = +[NSString stringWithFormat:@"%@.%@", v26, v27];
              *(_DWORD *)buf = 138543618;
              __int16 v55 = v28;
              __int16 v56 = 2114;
              uint64_t v57 = v11;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sucessfully moved '%{public}@' sentinel file to post-migration location", buf, 0x16u);
              goto LABEL_21;
            }
          }
          else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            id v38 = (objc_class *)objc_opt_class();
            unsigned int v26 = NSStringFromClass(v38);
            NSStringFromSelector(a2);
            v27 = unsigned __int8 v40 = v16;
            id v28 = +[NSString stringWithFormat:@"%@.%@", v26, v27];
            *(_DWORD *)buf = 138543874;
            __int16 v55 = v28;
            __int16 v56 = 2114;
            uint64_t v57 = v11;
            __int16 v58 = 2114;
            id v59 = v23;
            unsigned int v29 = v24;
            unsigned int v30 = "[%{public}@] Failed to move '%{public}@' sentinel file to post-migration location {error: %{public}@}";
LABEL_20:
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);
LABEL_21:

            id v16 = v40;
            id v9 = INDateRelevanceProvider_ptr;
          }
          uint64_t v8 = v41;
          goto LABEL_23;
        }
        id v15 = +[REMLogStore container];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v31 = (objc_class *)objc_opt_class();
          id v32 = NSStringFromClass(v31);
          id v33 = NSStringFromSelector(a2);
          id v34 = +[NSString stringWithFormat:@"%@.%@", v32, v33];
          *(_DWORD *)buf = 138543874;
          __int16 v55 = v34;
          __int16 v56 = 2114;
          uint64_t v57 = v11;
          __int16 v58 = 2112;
          id v59 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] No pre-migration '%{public}@' sentinel file found {preMigrationImageDedupSentinelFileURL: %@}", buf, 0x20u);

          id v9 = INDateRelevanceProvider_ptr;
        }
LABEL_25:
      }
      id v47 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v47);
  }
}

- (void)_cleanUpPreDataSeparationDataContainerIfNeeded
{
  BOOL v4 = +[NSFileManager defaultManager];
  id v5 = +[REMPaths legacy_applicationDocumentsURL];
  id v6 = +[RDPaths reminderDataContainerURLWithAppDocumentsURL:v5];
  unsigned int v7 = [(RDStoreController *)self databaseDirectoryURLWithContainerURL:v6];
  if (objc_msgSend(v4, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v7, 1))
  {
    id v32 = 0;
    unsigned __int8 v8 = [v4 removeItemAtURL:v7 error:&v32];
    id v9 = v32;
    id v10 = +[REMLogStore container];
    uint64_t v11 = v10;
    if (v8)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        goto LABEL_8;
      }
      id v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v29 = v9;
      uint64_t v14 = v13 = a2;
      id v15 = NSStringFromSelector(v13);
      id v16 = +[NSString stringWithFormat:@"%@.%@", v14, v15];
      *(_DWORD *)buf = 138543362;
      id v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed empty pre-migration 'Stores' directory", buf, 0xCu);

      a2 = v13;
      id v9 = v29;
    }
    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      long long v25 = (objc_class *)objc_opt_class();
      unsigned int v26 = NSStringFromClass(v25);
      NSStringFromSelector(a2);
      __int16 v27 = v30 = a2;
      id v16 = +[NSString stringWithFormat:@"%@.%@", v26, v27];
      *(_DWORD *)buf = 138543618;
      id v34 = v16;
      __int16 v35 = 2114;
      id v36 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove empty pre-migration 'Stores' directory {error: %{public}@}", buf, 0x16u);

      a2 = v30;
    }

    goto LABEL_7;
  }
LABEL_8:
  if (objc_msgSend(v4, "rem_isEmptyDirectoryAtURL:skipsHiddenFiles:", v6, 1))
  {
    id v31 = 0;
    unsigned __int8 v17 = [v4 removeItemAtURL:v6 error:&v31];
    id v18 = v31;
    unsigned int v19 = +[REMLogStore container];
    id v20 = v19;
    if (v17)
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      id v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      id v23 = NSStringFromSelector(a2);
      id v24 = +[NSString stringWithFormat:@"%@.%@", v22, v23];
      *(_DWORD *)buf = 138543362;
      id v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed empty pre-migration 'Container_v1' directory", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v28 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v28);
      id v23 = NSStringFromSelector(a2);
      id v24 = +[NSString stringWithFormat:@"%@.%@", v22, v23];
      *(_DWORD *)buf = 138543618;
      id v34 = v24;
      __int16 v35 = 2114;
      id v36 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove empty pre-migration 'Container_v1' directory {error: %{public}@}", buf, 0x16u);
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (BOOL)l_loadAccountStoresFromDiskAndValidateInBatchesWithStoreURLs:(id)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4 error:(id *)a5
{
  id v31 = a5;
  BOOL v37 = a4;
  id v6 = a3;
  id v34 = self;
  unint64_t v38 = -[RDStoreController _persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:](self, "_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:", [v6 count]);
  unint64_t v43 = qword_100906C90;
  unsigned int v7 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:");
  unsigned __int8 v40 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = v6;
  id v42 = [v8 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v42)
  {
    id v39 = 0;
    uint64_t v41 = *(void *)v47;
    id v32 = &v59;
    uint64_t v9 = 1;
    char v35 = 1;
    id v10 = v34;
    id v33 = v7;
    id v36 = v8;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v47 != v41) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v46 + 1) + 8 * (void)v11);
        [v7 addObject:v13];
        uint64_t v14 = +[REMLogStore container];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_100754F44((uint64_t)v58, v13);
        }
        uint64_t v15 = v9;
        unint64_t v16 = (unint64_t)v11 + v9;

        unint64_t v17 = ((unint64_t)v11 + v9) / v43;
        if (v12 == v16 / v43 * v43 || (id)v16 == [v8 count])
        {
          id v18 = +[REMLogStore container];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = [v8 count];
            *(_DWORD *)buf = 134218496;
            unint64_t v51 = v16;
            __int16 v52 = 2048;
            unint64_t v53 = v17;
            __int16 v54 = 2048;
            id v55 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[loadAccountStoresFromDisk] Flusing batch {idx: %ld, batch: %ld, storeURLs.count: %ld}", buf, 0x20u);
          }

          id v20 = [v7 allObjects];
          id v45 = 0;
          unsigned int v21 = [(RDStoreController *)v10 l_loadBatchOfAccountStoresFromDiskAndValidateWithStoreURLs:v20 processedStoreIdentifiers:v40 shouldDeleteInvalidStoresImmediately:v37 connectionPoolMaxSize:v38 error:&v45];
          id v22 = v45;

          id v23 = +[REMLogStore container];
          id v24 = v23;
          if (v21)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              long long v25 = [v7 valueForKey:@"lastPathComponent"];
              unsigned int v26 = [(RDStoreController *)v10 l_accountStoreMap];
              __int16 v27 = [v26 keyEnumerator];
              id v28 = [v27 allObjects];
              *(_DWORD *)buf = 134218754;
              unint64_t v51 = v17;
              __int16 v52 = 2048;
              unint64_t v53 = v43;
              __int16 v54 = 2114;
              id v55 = v25;
              __int16 v56 = 2114;
              id v57 = v28;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] Loaded accounts from disk {batch: %ld, batchSize: %ld, urls: %{public}@, accountIdentifiers: %{public}@}", buf, 0x2Au);

              id v10 = v34;
              unsigned int v7 = v33;
            }
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v29 = [v7 valueForKey:@"lastPathComponent"];
              *(_DWORD *)buf = 134218754;
              unint64_t v51 = v17;
              __int16 v52 = 2048;
              unint64_t v53 = v43;
              __int16 v54 = 2114;
              id v55 = v29;
              __int16 v56 = 2114;
              id v57 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[loadAccountStoresFromDisk] Failed to load accountStoreFromDisk. {batch: %ld, batchSize: %ld, urls: %{public}@, error: %{public}@}", buf, 0x2Au);
            }
            char v35 = 0;
            id v24 = v39;
            id v39 = v22;
          }
          id v8 = v36;

          [v7 removeAllObjects];
        }
        uint64_t v9 = v15;
        ++v12;
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v42 != v11);
      uint64_t v9 = (uint64_t)v11 + v15;
      id v42 = [v8 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v42);
  }
  else
  {
    id v39 = 0;
    char v35 = 1;
  }

  if (v31) {
    *id v31 = v39;
  }

  return v35 & 1;
}

- (BOOL)l_loadBatchOfAccountStoresFromDiskAndValidateWithStoreURLs:(id)a3 processedStoreIdentifiers:(id)a4 shouldDeleteInvalidStoresImmediately:(BOOL)a5 connectionPoolMaxSize:(unint64_t)a6 error:(id *)a7
{
  BOOL v30 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v41 = NSPersistentStoreConnectionPoolMaxSizeKey;
  uint64_t v12 = +[NSNumber numberWithUnsignedInteger:a6];
  id v42 = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

  id v37 = 0;
  id v32 = v10;
  id v29 = (void *)v13;
  BOOL v27 = [(RDStoreController *)self l_createOrLoadAccountStoresWithURLs:v10 persistentStoreDescriptionOptionsOverride:v13 isCreatingStores:0 error:&v37];
  id v28 = v37;
  uint64_t v14 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v15 = [(RDStoreController *)self persistentStoreCoordinator];
  unint64_t v16 = [v15 persistentStores];

  id v17 = [v16 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        unsigned int v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v22 = [v21 identifier];
        if (v22)
        {
          if (([v11 containsObject:v22] & 1) == 0)
          {
            [v14 addObject:v21];
            [v11 addObject:v22];
          }
        }
        else
        {
          id v23 = +[REMLogStore container];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v39 = v21;
            _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "[loadAccountStoresFromDisk] Loaded an account store with no store identifier, can't add to store controller {store: %{public}@}", buf, 0xCu);
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v18);
  }

  id v24 = +[REMLogStore container];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v14 count];
    *(_DWORD *)buf = 134217984;
    id v39 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadAccountStoresFromDisk] candidates stores to validate... {candidateStores.count: %ld}", buf, 0xCu);
  }

  [(RDStoreController *)self l_addValidatedStoresToAccountStoreMapWithStores:v14 shouldDeleteInvalidStoresImmediately:v30];
  if (a7) {
    *a7 = v28;
  }

  return v27;
}

- (void)l_loadDummyStoreIfNeeded
{
  uint64_t v3 = [(RDStoreController *)self persistentStoreCoordinator];
  BOOL v4 = [v3 persistentStores];
  id v5 = [v4 count];

  if (!v5)
  {
    id v6 = [(RDStoreController *)self _dataSeparationIncompatible_defaultReminderDataContainerURL];
    unsigned int v7 = [(RDStoreController *)self storeURLWithName:@"local" withContainerURL:v6];
    id v8 = +[NSSet setWithObject:v7];
    uint64_t v9 = [v8 allObjects];
    id v27 = 0;
    unsigned __int8 v10 = [(RDStoreController *)self l_createOrLoadAccountStoresWithURLs:v9 persistentStoreDescriptionOptionsOverride:0 isCreatingStores:0 error:&v27];
    id v11 = v27;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = +[REMLogStore container];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1007550B4();
      }

      uint64_t v13 = +[NSFileManager defaultManager];
      id v26 = 0;
      unsigned __int8 v14 = [v13 removeItemAtURL:v7 error:&v26];
      id v15 = v26;

      if ((v14 & 1) == 0)
      {
        unint64_t v16 = +[REMLogStore container];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10075504C();
        }
      }
      BOOL v30 = v7;
      id v17 = +[NSArray arrayWithObjects:&v30 count:1];
      id v25 = v15;
      unsigned __int8 v18 = [(RDStoreController *)self l_createOrLoadAccountStoresWithURLs:v17 persistentStoreDescriptionOptionsOverride:0 isCreatingStores:1 error:&v25];
      id v19 = v25;

      if ((v18 & 1) == 0)
      {
        id v20 = +[REMLogStore container];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100754FE4();
        }
      }
      unsigned int v21 = [(RDStoreController *)self persistentStoreCoordinator];
      id v22 = [v21 persistentStoreForURL:v7];

      if (v22)
      {
        id v23 = [(RDStoreController *)self l_accountStoreMap];
        [v23 setObject:v22 forKey:@"local"];

        id v24 = +[REMLogStore container];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v29 = v22;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[loadDummyStoreIfNeeded] Re-created and loaded local store {store: %{public}@}", buf, 0xCu);
        }
      }
      else
      {
        id v24 = +[REMLogStore container];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100754FA0(v24);
        }
      }
    }
  }
}

- (void)l_addValidatedStoresToAccountStoreMapWithStores:(id)a3 shouldDeleteInvalidStoresImmediately:(BOOL)a4
{
  BOOL v37 = a4;
  id v69 = 0;
  id v70 = 0;
  id v68 = 0;
  id v38 = a3;
  -[RDStoreController _validateAccountStores:outValidStoresByAccountIDs:outInvalidStores:outLocalAccountStores:](self, "_validateAccountStores:outValidStoresByAccountIDs:outInvalidStores:outLocalAccountStores:");
  id v45 = v70;
  id v39 = v69;
  id v40 = v68;
  uint64_t v41 = +[NSSet setWithArray:](NSSet, "setWithArray:");
  id v42 = +[NSMutableSet setWithArray:v39];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = [v45 allKeys];
  id v46 = [obj countByEnumeratingWithState:&v64 objects:v80 count:16];
  if (v46)
  {
    uint64_t v44 = *(void *)v65;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v64 + 1) + 8 * (void)v5);
        id v8 = [v45 objectForKey:v6];
        if (v8)
        {
          uint64_t v9 = [(RDStoreController *)self l_accountStoreMap];
          unsigned __int8 v10 = [v9 objectForKey:v6];

          if (v10)
          {
            id v11 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.remindd.RDStoreController.addValidatedStoresToAccountStoreMapWithStores"];
            unsigned __int8 v12 = [v41 containsObject:v8];
            uint64_t v58 = 0;
            int v59 = &v58;
            uint64_t v60 = 0x3032000000;
            __int16 v61 = sub_10007258C;
            id v62 = sub_10007259C;
            uint64_t v13 = v8;
            CFStringRef v63 = v13;
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472;
            v52[2] = sub_1000725A4;
            v52[3] = &unk_1008B0698;
            __int16 v56 = &v58;
            v52[4] = self;
            id v14 = v10;
            id v53 = v14;
            id v15 = v13;
            __int16 v54 = v15;
            unsigned __int8 v57 = v12;
            id v16 = v11;
            id v55 = v16;
            [v16 performBlockAndWait:v52];
            id v17 = v14;
            unsigned __int8 v18 = v59[5];
            if (v18 == v17)
            {
              id v19 = v15;

              unsigned __int8 v18 = v59[5];
              id v17 = v19;
            }
            [v42 addObject:v18];
            id v8 = v17;

            id v20 = +[REMLogStore container];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v25 = [v8 identifier];
              id v26 = [(id)v59[5] identifier];
              uint64_t v27 = v59[5];
              *(_DWORD *)buf = 138544386;
              *(void *)long long v73 = v6;
              *(_WORD *)&v73[8] = 2114;
              *(void *)&v73[10] = v25;
              __int16 v74 = 2112;
              id v75 = v8;
              __int16 v76 = 2114;
              id v77 = v26;
              __int16 v78 = 2112;
              uint64_t v79 = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[addValidatedStoresToAccountStoreMapWithStores] Found duplicated stores for the same account, treating one of them as invalid {accountID: %{public}@, valid: storeid=%{public}@ %@, invalid: storeid=%{public}@ %@}", buf, 0x34u);
            }
            _Block_object_dispose(&v58, 8);
          }
          unsigned int v21 = +[REMLogStore container];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [v8 URL];
            id v23 = [v22 absoluteString];
            *(_DWORD *)buf = 138543618;
            *(void *)long long v73 = v6;
            *(_WORD *)&v73[8] = 2112;
            *(void *)&v73[10] = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[addValidatedStoresToAccountStoreMapWithStores] Adding valid store to accountStoreMap {accountID: %{public}@, store.URL: %@}", buf, 0x16u);
          }
          id v24 = [(RDStoreController *)self l_accountStoreMap];
          [v24 setObject:v8 forKey:v6];
        }
        else
        {
          id v8 = +[REMLogStore container];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)long long v73 = v6;
            _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[addValidatedStoresToAccountStoreMapWithStores] Impossible: Unexpected nil store from validStoresByAccountIDs map {accountID: %{public}@}", buf, 0xCu);
          }
        }

        id v5 = (char *)v5 + 1;
      }
      while (v46 != v5);
      id v46 = [obj countByEnumeratingWithState:&v64 objects:v80 count:16];
    }
    while (v46);
  }

  if ([v42 count] && objc_msgSend(v40, "count"))
  {
    id v28 = +[NSMutableSet setWithSet:v42];
    id v29 = +[NSSet setWithArray:v40];
    [v28 intersectSet:v29];

    id v51 = 0;
    [(RDStoreController *)self _backupInvalidStores:v28 outBackUpFailedStores:&v51];
    id v30 = v51;
    if ([v30 count]) {
      [v42 minusSet:v30];
    }
  }
  if ([v42 count])
  {
    id v31 = +[REMLogStore container];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [v42 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)long long v73 = v37;
      *(_WORD *)&v73[4] = 2048;
      *(void *)&v73[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[addValidatedStoresToAccountStoreMapWithStores] Processing invalid stores, either to delete immediately or mark as deleted {shouldDeleteInvalidStoresImmediately: %d, count: %ld}", buf, 0x12u);
    }

    if (v37)
    {
      [(RDStoreController *)self l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:v42];
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v33 = v42;
      id v34 = [v33 countByEnumeratingWithState:&v47 objects:v71 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v48;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v48 != v35) {
              objc_enumerationMutation(v33);
            }
            [(RDStoreController *)self l_markAccountStoreDeletedAndDeleteData:*(void *)(*((void *)&v47 + 1) + 8 * i) deletedObjectIDs:0 error:0];
          }
          id v34 = [v33 countByEnumeratingWithState:&v47 objects:v71 count:16];
        }
        while (v34);
      }
    }
  }
}

- (void)_validateAccountStores:(id)a3 outValidStoresByAccountIDs:(id *)a4 outInvalidStores:(id *)a5 outLocalAccountStores:(id *)a6
{
  id v8 = a3;
  uint64_t v9 = +[NSMutableDictionary dictionary];
  unsigned __int8 v10 = +[NSMutableArray array];
  id v11 = +[NSMutableArray array];
  unsigned __int8 v12 = [(RDStoreController *)self _dataSeparationIncompatible_defaultReminderDataContainerURL];
  uint64_t v13 = [(RDStoreController *)self storeURLWithName:@"local" withContainerURL:v12];
  id v14 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.remindd.RDStoreController.validateAccounts"];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000728F8;
  v34[3] = &unk_1008B06C0;
  id v15 = v8;
  id v35 = v15;
  id v31 = v13;
  id v36 = v31;
  id v16 = v9;
  id v37 = v16;
  id v17 = v14;
  id v38 = v17;
  id v18 = v11;
  id v39 = v18;
  id v19 = v10;
  id v40 = v19;
  uint64_t v41 = self;
  [v17 performBlockAndWait:v34];
  id v20 = [v16 allKeys];
  unsigned int v21 = +[REMLogStore container];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = v17;
    id v22 = v12;
    id v23 = [v15 count];
    id v24 = v16;
    id v25 = v18;
    id v26 = v15;
    uint64_t v27 = a6;
    id v28 = [v20 count];
    id v29 = [v19 count];
    *(_DWORD *)buf = 134218754;
    id v43 = v23;
    unsigned __int8 v12 = v22;
    id v17 = v30;
    __int16 v44 = 2048;
    id v45 = v28;
    a6 = v27;
    id v15 = v26;
    id v18 = v25;
    id v16 = v24;
    __int16 v46 = 2048;
    id v47 = v29;
    __int16 v48 = 2114;
    long long v49 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[_validateAccountStores] Validate results {input.count: %ld, valid.count: %ld, invalid.count: %ld, valid.accountIDs: %{public}@}", buf, 0x2Au);
  }

  if (a4) {
    *a4 = v16;
  }
  if (a5) {
    *a5 = v19;
  }
  if (a6) {
    *a6 = v18;
  }
}

- (id)_deduplicateStore:(id)a3 withStore:(id)a4 isLocalAccountType:(BOOL)a5 managedObjectContext:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7)
  {
    id v13 = [(RDStoreController *)self _deduplicateLocalAccountStore:v10 withStore:v11 managedObjectContext:v12];
  }
  else
  {
    id v14 = [v10 identifier];
    id v15 = [v11 identifier];
    id v16 = [v14 caseInsensitiveCompare:v15];

    if (v16 == (id)-1) {
      id v13 = v10;
    }
    else {
      id v13 = v11;
    }
  }
  id v17 = v13;

  return v17;
}

- (id)_deduplicateLocalAccountStore:(id)a3 withStore:(id)a4 managedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v31 = v7;
  id v9 = a5;
  id v10 = +[NSArray arrayWithObjects:&v31 count:1];
  id v11 = +[REMChangeTracking lastTransactionTimestampWithManagedObjectContext:v9 affectedStores:v10];

  id v30 = v8;
  id v12 = +[NSArray arrayWithObjects:&v30 count:1];
  id v13 = +[REMChangeTracking lastTransactionTimestampWithManagedObjectContext:v9 affectedStores:v12];

  id v14 = v8;
  id v15 = v14;
  if ([v11 compare:v13] == (id)-1)
  {
    id v15 = v7;
  }
  id v16 = +[REMLogStore container];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v7 identifier];
    id v18 = [v14 identifier];
    int v20 = 138544386;
    id v21 = v15;
    __int16 v22 = 2114;
    id v23 = v17;
    __int16 v24 = 2114;
    id v25 = v11;
    __int16 v26 = 2114;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    id v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[_deduplicateLocalAccountStore] {storeToDrop: %{public}@, store1: {id=%{public}@, lastEdit=%{public}@}, store2: {id=%{public}@, lastEdit=%{public}@}", (uint8_t *)&v20, 0x34u);
  }

  return v15;
}

- (void)l_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:(id)a3
{
  id v4 = a3;
  if ([(RDStoreController *)self isInitializing])
  {
    __int16 v28 = +[NSMutableSet set];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = v4;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v11 = [(RDStoreController *)self persistentStoreCoordinator];
          id v31 = 0;
          unsigned int v12 = [v11 removePersistentStore:v10 error:&v31];
          id v13 = v31;

          uint64_t v14 = [v10 URL];
          id v15 = (void *)v14;
          if (v12) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {
            id v18 = +[REMLogStore container];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v37 = v15;
              __int16 v38 = 2114;
              id v39 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[removeFromPersistentStoreCoordinatorAndDeleteImmediately] Failed to remove store from PSC {storeURL: %@, error: %{public}@}", buf, 0x16u);
            }
          }
          else
          {
            [v28 addObject:v14];
            id v17 = [(RDStoreController *)self accountStoreManagementDelegate];
            [v17 didRemoveInvalidPersistentStoreOnInitWithStore:v10];

            id v18 = +[REMLogStore container];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v37 = v15;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[removeFromPersistentStoreCoordinatorAndDeleteImmediately] Removed store from PSC {storeURL: %@}", buf, 0xCu);
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v7);
    }

    id v29 = 0;
    id v30 = 0;
    unsigned int v20 = [(RDStoreController *)self _removeFilesOfStoresAtURLs:v28 outRemovedFileURLs:&v30 error:&v29];
    id v21 = v30;
    id v22 = v29;
    id v23 = +[REMLogStore container];
    __int16 v24 = v23;
    if (v20)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = [v28 count];
        *(_DWORD *)buf = 134217984;
        id v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[removeFromPersistentStoreCoordinatorAndDeleteImmediately] Deleted store files immeidately {count: %ld}", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_10075511C();
    }

    __int16 v26 = [(RDStoreController *)self accountStoreManagementDelegate];
    [v26 didRemoveStoreFilesOnInitWithURLs:v21];

    id v4 = v27;
  }
  else
  {
    __int16 v28 = +[REMLogStore container];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_100755184(self, v28);
    }
  }
}

- (void)l_performManualStoreMigrations:(id)a3
{
  id v3 = a3;
  id v4 = (void **)INDateRelevanceProvider_ptr;
  id v5 = +[REMLogStore container];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v68 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MIGRATE STORES] BEGIN {stores.count: %ld}", buf, 0xCu);
  }

  id v45 = objc_alloc_init((Class)NSMutableArray);
  obja = objc_alloc_init(RDStoreControllerMigrator_AccountIdentifierMetadata);
  v73[0] = obja;
  id v51 = objc_alloc_init(RDStoreControllerMigrator_PopulateDefaultValues);
  v73[1] = v51;
  long long v49 = objc_alloc_init(RDStoreControllerMigrator_JSONProperties);
  v73[2] = v49;
  __int16 v46 = objc_alloc_init(RDStoreControllerMigrator_DisplayDate);
  v73[3] = v46;
  __int16 v44 = objc_alloc_init(RDStoreControllerMigrator_CKParentReminderIdentifier);
  v73[4] = v44;
  id v43 = objc_alloc_init(RDStoreControllerMigrator_RemoveOrphanedLists);
  v73[5] = v43;
  id v42 = objc_alloc_init(_TtC7remindd56RDStoreControllerMigrator_AccountIdentifierHashtagLabels);
  v73[6] = v42;
  id v6 = objc_alloc_init(_TtC7remindd60RDStoreControllerMigrator_DiacriticsInsensitiveHashtagLabels);
  v73[7] = v6;
  id v7 = objc_alloc_init(_TtC7remindd53RDStoreControllerMigrator_AutoConvertSharedInlineTags);
  v73[8] = v7;
  uint64_t v8 = objc_alloc_init(_TtC7remindd58RDStoreControllerMigrator_UnsetCKDirtyFlagsInNonCKAccounts);
  v73[9] = v8;
  id v9 = objc_alloc_init(_TtC7remindd47RDStoreControllerMigrator_IsPinnedByCurrentUser);
  v73[10] = v9;
  id v10 = objc_alloc_init(_TtC7remindd73RDStoreControllerMigrator_MostRecentTargetTemplateIdentifierByCurrentUser);
  v73[11] = v10;
  id v11 = v3;
  unsigned int v12 = objc_alloc_init(_TtC7remindd53RDStoreControllerMigrator_RemoveObsoleteDueDateDeltas);
  v73[12] = v12;
  id v13 = objc_alloc_init(_TtC7remindd50RDStoreControllerMigrator_ResetReminderCountsCache);
  v73[13] = v13;
  uint64_t v14 = objc_alloc_init(_TtC7remindd68RDStoreControllerMigrator_UpdateAlternativeDueDatesOfCalDavReminders);
  v73[14] = v14;
  __int16 v48 = +[NSArray arrayWithObjects:v73 count:15];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v63;
    uint64_t v47 = *(void *)v63;
    do
    {
      id v18 = 0;
      id v50 = v16;
      do
      {
        if (*(void *)v63 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v18);
        unsigned int v20 = [v19 URL];
        id v21 = [v20 lastPathComponent];
        if (v20)
        {
          unsigned int v22 = [(id)objc_opt_class() isDummyStoreURL:v20];
          id v23 = [v4[202] container];
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (v22)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138412546;
              id v68 = v20;
              __int16 v69 = 2114;
              id v70 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "RDStoreControllerMigrator: [MIGRATE STORE] Skipping local dummy store {storeURL: %@, fileName: %{public}@}", buf, 0x16u);
            }
          }
          else
          {
            id v25 = v4;
            if (v24)
            {
              *(_DWORD *)buf = 138412546;
              id v68 = v20;
              __int16 v69 = 2114;
              id v70 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "RDStoreControllerMigrator: [MIGRATE STORE] BEGIN {storeURL: %@, fileName: %{public}@}", buf, 0x16u);
            }

            __int16 v26 = [v19 metadata];
            id v23 = [v26 mutableCopy];

            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v27 = v48;
            id v28 = [v27 countByEnumeratingWithState:&v58 objects:v66 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v59;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(void *)v59 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  [*(id *)(*((void *)&v58 + 1) + 8 * i) migrateStoreIfNeeded:v19 metadata:v23];
                }
                id v29 = [v27 countByEnumeratingWithState:&v58 objects:v66 count:16];
              }
              while (v29);
            }

            long long v32 = [v19 metadata];
            unsigned __int8 v33 = [v23 isEqualToDictionary:v32];

            if ((v33 & 1) == 0)
            {
              id v34 = [v23 copy];
              [v19 setMetadata:v34];

              [v45 addObject:v19];
            }
            id v4 = v25;
            long long v35 = [v25[202] container];
            uint64_t v17 = v47;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v68 = v20;
              __int16 v69 = 2114;
              id v70 = v21;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "RDStoreControllerMigrator: [MIGRATE STORE] END {storeURL: %@, fileName: %{public}@}", buf, 0x16u);
            }

            id v16 = v50;
          }
        }
        else
        {
          id v23 = [v4[202] container];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_100755210((uint64_t)v71, (uint64_t)v19);
          }
        }

        id v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      id v16 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v16);
  }

  if ([v45 count])
  {
    id v36 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    id v37 = [(RDStoreController *)self persistentStoreCoordinator];
    [v36 setPersistentStoreCoordinator:v37];

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100073E04;
    v55[3] = &unk_1008ADC88;
    id v56 = v36;
    id v57 = v45;
    id v38 = v36;
    [v38 performBlockAndWait:v55];
  }
  id v39 = [v4[202] container];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = [v45 count];
    uint64_t v41 = [v45 valueForKey:@"URL"];
    *(_DWORD *)buf = 134218242;
    id v68 = v40;
    __int16 v69 = 2114;
    id v70 = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "RDStoreControllerMigrator: [MIGRATE STORES] END {updatedStoreURLs.count: %ld, updatedStoreURLs: %{public}@}", buf, 0x16u);
  }
}

- (BOOL)_removeFilesOfStoresAtURLs:(id)a3 outRemovedFileURLs:(id *)a4 error:(id *)a5
{
  long long v35 = a4;
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  id v38 = +[NSMutableDictionary dictionary];
  id v47 = +[NSMutableSet set];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v5;
  id v41 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  id v7 = 0;
  if (!v41)
  {
    char v46 = 1;
    goto LABEL_43;
  }
  char v46 = 1;
  uint64_t v39 = *(void *)v55;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v55 != v39) {
        objc_enumerationMutation(obj);
      }
      id v45 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
      uint64_t v9 = [v45 URLByDeletingLastPathComponent:v35];
      id v43 = (void *)v9;
      uint64_t v44 = v8;
      if (!v9)
      {
        id v15 = +[REMLogStore container];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v60 = v45;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[_removeFilesOfStoresAtURLs] Unexpected nil store directory URL {store.url: %@}", buf, 0xCu);
        }

        uint64_t v12 = 0;
        goto LABEL_14;
      }
      id v10 = (void *)v9;
      uint64_t v11 = [v38 objectForKey:v9];
      if (v11)
      {
        uint64_t v12 = v11;
        id v13 = +[REMLogStore container];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v10 absoluteString];
          *(_DWORD *)buf = 138543618;
          long long v60 = v14;
          __int16 v61 = 2112;
          long long v62 = v45;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[_removeFilesOfStoresAtURLs] Obtained store directory content cached for {storeDir: %{public}@, store.url: %@}", buf, 0x16u);
        }
LABEL_14:
        id v16 = v7;
        goto LABEL_15;
      }
      id v53 = v7;
      uint64_t v12 = [v6 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v53];
      id v16 = v53;

      id v29 = +[REMLogStore container];
      uint64_t v30 = v29;
      if (v12)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          id v31 = [v10 absoluteString];
          *(_DWORD *)buf = 138543618;
          long long v60 = v31;
          __int16 v61 = 2112;
          long long v62 = v45;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[_removeFilesOfStoresAtURLs] Obtained store directory content from {storeDir: %{public}@, store.url: %@}", buf, 0x16u);
        }
        [v38 setObject:v12 forKey:v10];
      }
      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          long long v32 = [v10 absoluteString];
          *(_DWORD *)buf = 138543874;
          long long v60 = v32;
          __int16 v61 = 2112;
          long long v62 = v45;
          __int16 v63 = 2114;
          id v64 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[_removeFilesOfStoresAtURLs] Failed to get store directory content from {storeDir: %{public}@, store.url: %@, error: %{public}@}", buf, 0x20u);
        }
        uint64_t v12 = 0;
      }
LABEL_15:
      id v42 = (void *)v12;
      uint64_t v17 = [(RDStoreController *)self _urlsToDeleteFromFileURLs:v12 matchingStoreURL:v45];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v18 = [v17 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v50;
        id v7 = v16;
        do
        {
          id v21 = 0;
          unsigned int v22 = v7;
          do
          {
            if (*(void *)v50 != v20) {
              objc_enumerationMutation(v17);
            }
            id v23 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v21);
            id v48 = v22;
            unsigned int v24 = [v6 removeItemAtURL:v23 error:&v48];
            id v7 = v48;

            id v25 = +[REMLogStore container];
            __int16 v26 = v25;
            if (v24)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v27 = [v23 lastPathComponent];
                *(_DWORD *)buf = 138543618;
                long long v60 = v27;
                __int16 v61 = 2112;
                long long v62 = v45;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[_removeFilesOfStoresAtURLs] Removed store file {filename: %{public}@, storeUrl: %@}", buf, 0x16u);
              }
              [v47 addObject:v23];
            }
            else
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                id v28 = [v23 lastPathComponent];
                *(_DWORD *)buf = 138543874;
                long long v60 = v28;
                __int16 v61 = 2112;
                long long v62 = v45;
                __int16 v63 = 2114;
                id v64 = v7;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[_removeFilesOfStoresAtURLs] Failed to remove store file at {filename: %{public}@, storeUrl: %@, error: %{public}@}", buf, 0x20u);
              }
              char v46 = 0;
            }
            id v21 = (char *)v21 + 1;
            unsigned int v22 = v7;
          }
          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v19);
      }
      else
      {
        id v7 = v16;
      }

      uint64_t v8 = v44 + 1;
    }
    while ((id)(v44 + 1) != v41);
    id v33 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    id v41 = v33;
  }
  while (v33);
LABEL_43:

  if (v35) {
    id *v35 = v47;
  }
  if (a5) {
    *a5 = v7;
  }

  return v46 & 1;
}

- (id)_urlsToDeleteFromFileURLs:(id)a3 matchingStoreURL:(id)a4
{
  id v5 = a3;
  id v6 = [a4 URLByStandardizingPath];
  id v7 = +[NSMutableSet setWithObject:v6];
  uint64_t v8 = [v6 lastPathComponent];
  uint64_t v9 = (void *)v8;
  if (v5 && v8)
  {
    uint64_t v20 = v6;
    id v21 = v5;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) URLByStandardizingPath:v20, v21, (void)v22];
          id v16 = [v15 lastPathComponent];
          if ([v16 hasPrefix:v9])
          {
            uint64_t v17 = [v15 lastPathComponent];
            unsigned __int8 v18 = [v17 isEqualToString:v9];

            if ((v18 & 1) == 0) {
              [v7 addObject:v15];
            }
          }
          else
          {
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    id v6 = v20;
    id v5 = v21;
  }

  return v7;
}

- (void)_backupInvalidStores:(id)a3 outBackUpFailedStores:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = +[NSFileManager defaultManager];
  +[NSMutableSet set];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000747D0;
  v11[3] = &unk_1008B06E8;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = self;
  SEL v15 = a2;
  id v10 = v8;
  [v7 enumerateObjectsUsingBlock:v11];

  if (a4) {
    *a4 = v9;
  }
}

- (void)_performStagedLightweightMigrationIfNeededForAccountStoresWithURLs:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RDStoreController *)self accountStoreManagementDelegate];
  id v9 = [v8 clientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation];

  id v10 = +[RDStagedLightweightCoreDataMigrationCoordinator createCoordinatorForMigratingReminderDataWithClientNamesOfREMCDChangeTrackingStateWhichShouldNotBeResetUponPersistentHistoryTruncation:v9];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      SEL v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v15);
        -[RDStoreController _performStagedLightweightMigrationIfNeededForAccountStoreWithURL:persistentStoreDescriptionOptionsOverride:migrationCoordinator:](self, "_performStagedLightweightMigrationIfNeededForAccountStoreWithURL:persistentStoreDescriptionOptionsOverride:migrationCoordinator:", v16, v7, v10, (void)v18);
        SEL v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)_performStagedLightweightMigrationIfNeededForAccountStoreWithURL:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 migrationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSFileManager defaultManager];
  id v12 = [v8 path];
  v99 = v11;
  if ([v11 fileExistsAtPath:v12]
    && [v10 shouldPerformStagedLightweightMigrationForStoreAtStoreURL:v8])
  {
    id v13 = [v8 URLByDeletingLastPathComponent];
    uint64_t v14 = [v13 URLByDeletingLastPathComponent];

    if (!v14)
    {
      SEL v15 = +[REMLogStore stagedLightweightCoreDataMigration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100755578();
      }
      goto LABEL_62;
    }
    SEL v15 = [(RDStoreController *)self databaseStagedMigrationDirectoryURLWithContainerURL:v14];
    id v111 = 0;
    unsigned __int8 v16 = [v99 rem_createDirectoryIfNecessaryAtURL:v15 error:&v111];
    id v92 = v111;
    if ((v16 & 1) == 0)
    {
      log = +[REMLogStore container];
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        long long v24 = (objc_class *)objc_opt_class();
        long long v25 = NSStringFromClass(v24);
        __int16 v26 = NSStringFromSelector(a2);
        id v27 = +[NSString stringWithFormat:@"%@.%@", v25, v26];
        [v92 localizedDescription];
        v29 = id v28 = v15;
        *(_DWORD *)buf = 138544130;
        v116 = v27;
        __int16 v117 = 2112;
        __int16 v118 = v14;
        __int16 v119 = 2112;
        __int16 v120 = v28;
        __int16 v121 = 2112;
        id v122 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {reminderDataContainerURL: %@, databaseBackupDirectoryURL: %@, error: %@}", buf, 0x2Au);

        SEL v15 = v28;
      }
      goto LABEL_61;
    }
    [v15 setRd_isExcludedFromBackup:1];
    [v8 lastPathComponent];
    log = id v89 = v15;
    uint64_t v17 = -[NSObject URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:");
    id v88 = v14;
    id v91 = (void *)v17;
    unsigned int v86 = +[REMSystemUtilities isInternalInstall];
    if (v86)
    {
      long long v18 = [(RDStoreController *)self databaseBackupDirectoryURLWithContainerURL:v14];
      id v110 = 0;
      unsigned __int8 v19 = [v99 rem_createDirectoryIfNecessaryAtURL:v18 error:&v110];
      id v20 = v110;
      if ((v19 & 1) == 0)
      {
        long long v21 = +[REMLogStore container];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          __int16 v78 = (objc_class *)objc_opt_class();
          id v98 = NSStringFromClass(v78);
          uint64_t v79 = NSStringFromSelector(a2);
          __int16 v80 = +[NSString stringWithFormat:@"%@.%@", v98, v79];
          [v20 localizedDescription];
          __int16 v82 = v81 = v12;
          *(_DWORD *)buf = 138544130;
          v116 = v80;
          __int16 v117 = 2112;
          __int16 v118 = v88;
          __int16 v119 = 2112;
          __int16 v120 = v18;
          __int16 v121 = 2112;
          id v122 = v82;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {reminderDataContainerURL: %@, databaseBackupDirectoryURL: %@, error: %@}", buf, 0x2Au);

          id v12 = v81;
          uint64_t v14 = v88;
        }
      }
      [v18 setRd_isExcludedFromBackup:1];
      id v90 = [(RDStoreController *)self storeBackupURLWithFileName:log withContainerURL:v14];
      long long v22 = v91;
      v126[0] = v90;
      v126[1] = v91;
      long long v23 = +[NSArray arrayWithObjects:v126 count:2];
    }
    else
    {
      uint64_t v125 = v17;
      long long v23 = +[NSArray arrayWithObjects:&v125 count:1];
      id v90 = 0;
      long long v22 = (void *)v17;
    }
    uint64_t v87 = v12;
    v96 = v10;
    uint64_t v30 = +[REMLogStore stagedLightweightCoreDataMigration];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [v8 path];
      long long v32 = +[NSNumber numberWithBool:v86];
      id v33 = [v90 path];
      id v34 = [v22 path];
      *(_DWORD *)buf = 138544386;
      v116 = log;
      __int16 v117 = 2112;
      __int16 v118 = v31;
      __int16 v119 = 2114;
      __int16 v120 = v32;
      __int16 v121 = 2112;
      id v122 = v33;
      __int16 v123 = 2112;
      NSURLResourceKey v124 = v34;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Creating clones of store before performing staged lightweight migration for store. {fileName: %{public}@, storeUrl: %@, isInternalInstall: %{public}@, storeBackupURL: %@, storeCloneURL: %@}", buf, 0x34u);
    }
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v35 = v23;
    id v36 = [v35 countByEnumeratingWithState:&v106 objects:v114 count:16];
    id obj = v35;
    if (v36)
    {
      id v37 = v36;
      id v85 = v9;
      id v38 = 0;
      uint64_t v39 = *(void *)v107;
      id v40 = v8;
      do
      {
        id v41 = 0;
        do
        {
          if (*(void *)v107 != v39) {
            objc_enumerationMutation(obj);
          }
          id v42 = *(void **)(*((void *)&v106 + 1) + 8 * (void)v41);
          id v43 = [v42 path];
          if ([v99 fileExistsAtPath:v43])
          {
            id v44 = objc_alloc((Class)NSSet);
            long long v113 = v42;
            id v45 = +[NSArray arrayWithObjects:&v113 count:1];
            id v46 = [v44 initWithArray:v45];
            id v105 = 0;
            [(RDStoreController *)self _removeFilesOfStoresAtURLs:v46 outRemovedFileURLs:0 error:&v105];
            id v47 = v105;

            id v8 = v40;
            if (v47) {
              goto LABEL_26;
            }
          }
          id v104 = 0;
          [v96 cloneStoreAtSourceStoreURL:v8 destinationStoreURL:v42 error:&v104];
          id v47 = v104;
          if (v47)
          {
LABEL_26:
            long long v49 = +[REMLogStore stagedLightweightCoreDataMigration];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            {
              id v53 = [v8 path];
              long long v54 = [v42 path];
              *(_DWORD *)buf = 138544130;
              v116 = log;
              __int16 v117 = 2112;
              __int16 v118 = v53;
              __int16 v119 = 2112;
              __int16 v120 = v54;
              __int16 v121 = 2114;
              id v122 = v47;
              _os_log_fault_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, "Failed to create clone of store before performing staged lightweight migration for store. {fileName: %{public}@, storeURL: %@, destinationStoreURL: %@, error: %{public}@}", buf, 0x2Au);

              id v8 = v40;
            }

            long long v50 = v47;
            id v38 = v50;
          }
          else
          {
            long long v50 = +[REMLogStore stagedLightweightCoreDataMigration];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              long long v51 = [v8 path];
              long long v52 = [v42 path];
              *(_DWORD *)buf = 138543874;
              v116 = log;
              __int16 v117 = 2112;
              __int16 v118 = v51;
              __int16 v119 = 2112;
              __int16 v120 = v52;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Created clone of store before performing staged lightweight migration for store. {fileName: %{public}@, storeURL: %@, destinationStoreURL: %@}", buf, 0x20u);
            }
          }

          id v41 = (char *)v41 + 1;
        }
        while (v37 != v41);
        id v55 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
        id v37 = v55;
      }
      while (v55);

      id v9 = v85;
      id v10 = v96;
      id v12 = v87;
      SEL v15 = v89;
      if (v38) {
        goto LABEL_60;
      }
    }
    else
    {

      id v12 = v87;
      SEL v15 = v89;
    }
    id v103 = 0;
    [v10 performStagedLightweightMigrationForStoreAtStoreURL:v91 persistentStoreDescriptionOptionsOverride:v9 postMigrationDataUpdatesTransactionAuthor:RDStagedLightweightMigrationAuthor error:&v103];
    id v57 = v103;
    long long v58 = objc_opt_new();
    long long v59 = INDateRelevanceProvider_ptr;
    long long v60 = +[REMLogStore stagedLightweightCoreDataMigration];
    __int16 v61 = v60;
    if (v57)
    {
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        id v75 = [v8 path];
        [v91 path];
        id v77 = v76 = v58;
        *(_DWORD *)buf = 138544130;
        v116 = log;
        __int16 v117 = 2112;
        __int16 v118 = v75;
        __int16 v119 = 2112;
        __int16 v120 = v77;
        __int16 v121 = 2114;
        id v122 = v57;
        _os_log_fault_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_FAULT, "Failed to perform staged lightweight migration on store clone. {fileName: %{public}@, storeURL: %@, storeCloneURL: %@, error: %{public}@}", buf, 0x2Au);

        long long v58 = v76;
        long long v59 = INDateRelevanceProvider_ptr;
      }

      [v58 addObject:v8];
      goto LABEL_52;
    }
    id v97 = v58;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      long long v62 = [v8 path];
      __int16 v63 = [v91 path];
      *(_DWORD *)buf = 138543874;
      v116 = log;
      __int16 v117 = 2112;
      __int16 v118 = v62;
      __int16 v119 = 2112;
      __int16 v120 = v63;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Performed staged lightweight migration on store clone. Will replace store with store clone. {fileName: %{public}@, storeURL: %@, storeCloneURL: %@}", buf, 0x20u);
    }
    id v65 = objc_alloc((Class)NSSet);
    id v112 = v8;
    long long v66 = +[NSArray arrayWithObjects:&v112 count:1];
    id v67 = [v65 initWithArray:v66];
    id v102 = 0;
    [(RDStoreController *)self _removeFilesOfStoresAtURLs:v67 outRemovedFileURLs:0 error:&v102];
    id v68 = v102;

    if (v68
      || (id v101 = 0,
          [v10 cloneStoreAtSourceStoreURL:v91 destinationStoreURL:v8 error:&v101],
          (id v68 = v101) != 0))
    {
      __int16 v69 = +[REMLogStore stagedLightweightCoreDataMigration];
      SEL v15 = v89;
      long long v58 = v97;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
      {
        id v83 = [v8 path];
        __int16 v84 = [v91 path];
        *(_DWORD *)buf = 138544130;
        v116 = log;
        __int16 v117 = 2112;
        __int16 v118 = v83;
        __int16 v119 = 2112;
        __int16 v120 = v84;
        __int16 v121 = 2114;
        id v122 = v68;
        _os_log_fault_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_FAULT, "Failed to replace store with store clone. {fileName: %{public}@, storeURL: %@, storeCloneURL: %@, error: %{public}@}", buf, 0x2Au);

        SEL v15 = v89;
        long long v58 = v97;
      }

      long long v59 = INDateRelevanceProvider_ptr;
      if (v86) {
        goto LABEL_51;
      }
    }
    else
    {
      SEL v15 = v89;
      long long v59 = INDateRelevanceProvider_ptr;
      long long v58 = v97;
    }
    [v58 addObject:v91];
LABEL_51:

LABEL_52:
    if ([v58 count])
    {
      id v100 = 0;
      [(RDStoreController *)self _removeFilesOfStoresAtURLs:v58 outRemovedFileURLs:0 error:&v100];
      id v70 = v100;
      id v71 = [v59[202] stagedLightweightCoreDataMigration];
      __int16 v72 = v71;
      if (v70)
      {
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          sub_1007555F8();
        }
      }
      else if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        [v58 valueForKey:@"lastPathComponent"];
        v74 = long long v73 = v58;
        *(_DWORD *)buf = 138543618;
        v116 = v74;
        __int16 v117 = 2112;
        __int16 v118 = v73;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Deleted stores. {storeFileNamesToDelete: %{public}@, storeURLsToDelete: %@}", buf, 0x16u);

        long long v58 = v73;
      }
    }
    id v38 = 0;
LABEL_60:

    uint64_t v14 = v88;
LABEL_61:

LABEL_62:
  }
}

- (unint64_t)_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:(unint64_t)a3
{
  if (a3 >= 5) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 3;
  }
  id v5 = +[REMLogStore container];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134218240;
    unint64_t v8 = a3;
    __int16 v9 = 2048;
    unint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount] {totalStoreCount: %ld, result: %ld}", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (NSArray)validPersistentStores
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = sub_10007258C;
  unint64_t v10 = sub_10007259C;
  id v11 = +[NSMutableArray array];
  os_unfair_lock_lock(&self->_ivarLock);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100075ED8;
  v5[3] = &unk_1008AFB60;
  v5[4] = self;
  v5[5] = &v6;
  sub_100075ED8((uint64_t)v5);
  os_unfair_lock_unlock(&self->_ivarLock);
  id v3 = [(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)accountIdentifierForStoreID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  SEL v15 = sub_10007258C;
  unsigned __int8 v16 = sub_10007259C;
  id v17 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100076138;
  v9[3] = &unk_1008ADFD0;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  sub_100076138((uint64_t)v9);
  os_unfair_lock_unlock(p_ivarLock);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)storeForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  SEL v15 = sub_10007258C;
  unsigned __int8 v16 = sub_10007259C;
  id v17 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007640C;
  v9[3] = &unk_1008ADD28;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_10007640C((uint64_t)v9);
  os_unfair_lock_unlock(p_ivarLock);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)storesForAccountTypes:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = +[REMCDAccount fetchRequest];
  id v7 = +[NSPredicate predicateWithFormat:@"type IN %@", v4];
  [v6 setPredicate:v7];

  [v6 setResultType:2];
  [v6 setReturnsDistinctResults:1];
  CFStringRef v22 = @"identifier";
  uint64_t v8 = +[NSArray arrayWithObjects:&v22 count:1];
  [v6 setPropertiesToFetch:v8];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100076658;
  v16[3] = &unk_1008AE520;
  id v17 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.remindd.RDStoreController.storesForAccounts"];
  id v18 = v6;
  unsigned __int8 v19 = self;
  id v9 = v5;
  id v20 = v9;
  id v21 = v4;
  id v10 = v4;
  id v11 = v6;
  id v12 = v17;
  [v12 performBlockAndWait:v16];
  id v13 = v21;
  id v14 = v9;

  return v14;
}

+ (id)persistentStoreOptions
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076990;
  block[3] = &unk_1008AFF00;
  block[4] = a1;
  if (qword_100922A90 != -1) {
    dispatch_once(&qword_100922A90, block);
  }
  v2 = (void *)qword_100922A88;

  return v2;
}

- (BOOL)createAccountStoresWithIdentifiers:(id)a3 didAddNewStores:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  unsigned __int8 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10007258C;
  CFStringRef v22 = sub_10007259C;
  id v23 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100076CA4;
  v13[3] = &unk_1008B0710;
  SEL v15 = &v24;
  v13[4] = self;
  id v10 = v8;
  unsigned __int8 v16 = &v18;
  id v17 = a4;
  id v14 = v10;
  sub_100076CA4(v13);
  os_unfair_lock_unlock(p_ivarLock);

  if (a5) {
    *a5 = (id) v19[5];
  }
  char v11 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

- (BOOL)l_createAccountStoresWithIdentifiers:(id)a3 didAddNewStores:(BOOL *)a4 error:(id *)a5
{
  id v6 = a3;
  if ([(RDStoreController *)self hasPassedBuddyAndSystemDataMigrator])
  {
    id v7 = [(RDStoreController *)self appleAccountUtilities];
    id v8 = [v7 unsafeUntilSystemReady_allICloudACAccounts];
  }
  else
  {
    id v7 = +[REMLogStore container];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138543618;
      id v77 = v6;
      __int16 v78 = 2112;
      uint64_t v79 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Attempt to create new store before buddy/system-data-migrator is passed, stores are ALWAYS stored into default container path {accountIdentifiers: %{public}@, callStack: %@}", buf, 0x16u);
    }
  }

  long long v62 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v6;
  id v11 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
  long long v60 = v10;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v70;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v70 != v13) {
          objc_enumerationMutation(obj);
        }
        SEL v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        unsigned __int8 v16 = [(RDStoreController *)self l_accountStoreMap];
        id v17 = [v16 objectForKey:v15];

        if (v17)
        {
          uint64_t v18 = +[REMLogStore container];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v77 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[createAccountStoresWithIdentifiers] Identifier already loaded -- skipping {identifier: %{public}@}", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v18 = [(RDStoreController *)self _reminderDataContainerURLForAccountIdentifier:v15];
          unsigned __int8 v19 = +[NSUUID UUID];
          uint64_t v20 = [v19 UUIDString];
          id v21 = [(RDStoreController *)self storeURLWithName:v20 withContainerURL:v18];

          CFStringRef v22 = +[REMLogStore container];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v77 = v15;
            __int16 v78 = 2112;
            uint64_t v79 = v18;
            __int16 v80 = 2112;
            unint64_t v81 = (unint64_t)v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Path to create account store {accountIdentifier: %{public}@, reminderDataContainerURL: %@, storeURL: %@}", buf, 0x20u);
          }

          [v62 setObject:v15 forKeyedSubscript:v21];
          id v10 = v60;
          [v60 addObject:v15];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v12);
  }

  if ([v10 count])
  {
    id v23 = [(RDStoreController *)self l_accountStoreMap];
    uint64_t v24 = [v23 count];

    unint64_t v25 = -[RDStoreController _persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:](self, "_persistentStoreConnectionPoolMaxSizeWithTotalStoreCount:", (char *)v24 + (void)[v10 count]);
    uint64_t v26 = +[REMLogStore container];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v10 count];
      *(_DWORD *)buf = 134218496;
      id v77 = v27;
      __int16 v78 = 2048;
      uint64_t v79 = v24;
      __int16 v80 = 2048;
      unint64_t v81 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Add persistentStores BEGIN {identifiersToAdd.count: %ld, accountStoreMap.count: %ld, connectionPoolMaxSize: %ld}", buf, 0x20u);
    }

    __int16 v74 = NSPersistentStoreConnectionPoolMaxSizeKey;
    id v28 = +[NSNumber numberWithUnsignedInteger:v25];
    id v75 = v28;
    uint64_t v29 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];

    uint64_t v30 = [v62 allKeys];
    id v68 = 0;
    id v55 = v29;
    unsigned __int8 v54 = [(RDStoreController *)self l_createOrLoadAccountStoresWithURLs:v30 persistentStoreDescriptionOptionsOverride:v29 isCreatingStores:1 error:&v68];
    id v53 = v68;

    long long v58 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v31 = [(RDStoreController *)self persistentStoreCoordinator];
    long long v32 = [v31 persistentStores];

    long long v59 = v32;
    id v33 = [v32 countByEnumeratingWithState:&v64 objects:v73 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v65;
      do
      {
        id v36 = 0;
        do
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v59);
          }
          id v37 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v36);
          uint64_t v39 = [v37 URL];
          if (v39)
          {
            uint64_t v40 = [v62 objectForKeyedSubscript:v39];
            if (v40)
            {
              id v41 = (void *)v40;
              id v63 = 0;
              unsigned __int8 v42 = [(RDStoreController *)self l_setAccountIdentifier:v40 intoMetadataOfCreatedStore:v37 error:&v63];
              id v43 = v63;
              if ((v42 & 1) == 0)
              {
                id v44 = +[REMLogStore container];
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  id v77 = v41;
                  __int16 v78 = 2112;
                  uint64_t v79 = v43;
                  __int16 v80 = 2112;
                  unint64_t v81 = (unint64_t)v37;
                  _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[createAccountStoresWithIdentifiers] Failed to set account identifier into metata {identifier: %{public}@, error: %@, store: %@}", buf, 0x20u);
                }
              }
              id v45 = [(RDStoreController *)self l_accountStoreMap];
              [v45 setObject:v37 forKey:v41];

              [v58 addObject:v37];
            }
          }

          id v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        id v34 = [v59 countByEnumeratingWithState:&v64 objects:v73 count:16];
      }
      while (v34);
    }

    id v46 = +[REMLogStore container];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = [(RDStoreController *)self l_accountStoreMap];
      id v48 = [v47 count];
      long long v49 = [v58 count];
      *(_DWORD *)buf = 134218498;
      id v77 = v48;
      __int16 v78 = 2048;
      uint64_t v79 = v49;
      __int16 v80 = 2114;
      unint64_t v81 = (unint64_t)v53;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] Add persistentStores END {accountStoreMap.count: %ld, newStores.count: %ld, lastError: %{public}@}", buf, 0x20u);
    }
    [(RDStoreController *)self l_performManualStoreMigrations:v58];
    id v10 = v60;
    if (a5) {
      *a5 = v53;
    }
    BOOL v50 = v54;
    if (a4) {
      *a4 = 1;
    }

    long long v51 = v55;
  }
  else
  {
    long long v51 = +[REMLogStore container];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[createAccountStoresWithIdentifiers] No account is missing. No need to load missing accounts", buf, 2u);
    }
    BOOL v50 = 1;
  }

  return v50;
}

- (BOOL)l_createOrLoadAccountStoresWithURLs:(id)a3 persistentStoreDescriptionOptionsOverride:(id)a4 isCreatingStores:(BOOL)a5 error:(id *)a6
{
  id v7 = a3;
  id v52 = a4;
  long long v59 = +[NSFileManager defaultManager];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v83 objects:v101 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v84;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v84 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [*(id *)(*((void *)&v83 + 1) + 8 * i) URLByDeletingLastPathComponent];
        id v82 = 0;
        unsigned __int8 v12 = [v59 rem_createDirectoryIfNecessaryAtURL:v11 error:&v82];
        id v13 = v82;
        if ((v12 & 1) == 0)
        {
          id v14 = +[REMLogStore container];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            SEL v15 = (objc_class *)objc_opt_class();
            unsigned __int8 v16 = NSStringFromClass(v15);
            id v17 = NSStringFromSelector(a2);
            uint64_t v18 = +[NSString stringWithFormat:@"%@.%@", v16, v17];
            unsigned __int8 v19 = [v13 localizedDescription];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v11;
            *(_WORD *)&buf[22] = 2112;
            v96 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Create directory failed {directoryURL: %@, error: %@}", buf, 0x20u);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v83 objects:v101 count:16];
    }
    while (v8);
  }

  id v20 = objc_alloc((Class)NSMutableDictionary);
  id v21 = [(id)objc_opt_class() persistentStoreOptions];
  aSelectora = (char *)[v20 initWithDictionary:v21];

  if (v52) {
    [aSelectora addEntriesFromDictionary:v52];
  }
  id v50 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:aSelectora];
  uint64_t v99 = NSPersistentHistoryTrackingEntitiesToInclude;
  id v100 = &__NSArray0__struct;
  CFStringRef v22 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
  [v50 setObject:v22 forKeyedSubscript:NSPersistentHistoryTrackingKey];

  [(RDStoreController *)self _performStagedLightweightMigrationIfNeededForAccountStoresWithURLs:obj persistentStoreDescriptionOptionsOverride:v50];
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v96 = sub_10007258C;
  id v97 = sub_10007259C;
  id v98 = 0;
  uint64_t v74 = 0;
  id v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v53 = obj;
  id v23 = [v53 countByEnumeratingWithState:&v70 objects:v94 count:16];
  if (v23)
  {
    id obja = *(id *)v71;
    while (2)
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(id *)v71 != obja) {
          objc_enumerationMutation(v53);
        }
        unint64_t v25 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
        uint64_t v26 = [(RDStoreController *)self persistentStoreCoordinator];
        id v27 = [v26 persistentStores];
        id v28 = [v27 count];

        if ((unint64_t)v28 >= 0xF)
        {
          if (!a5)
          {
            id v44 = +[REMLogStore container];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
              sub_100755714();
            }

            *((unsigned char *)v79 + 24) = 0;
            uint64_t v45 = +[REMError tooManyLoadedStoresError];
            id v46 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v45;

            goto LABEL_41;
          }
          uint64_t v29 = +[REMLogStore container];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v88 = 134218240;
            uint64_t v89 = 15;
            __int16 v90 = 2048;
            id v91 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[createOrLoadAccountStores] WARNING We are now loading more stores than the maximum limit. Allowed though because we have passed the initial load-from-disk stage. {limit: %ld, loaded.count: %ld}", v88, 0x16u);
          }
        }
        uint64_t v30 = +[REMLogStore container];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [v25 lastPathComponent];
          *(_DWORD *)id v88 = 138543874;
          uint64_t v89 = (uint64_t)v31;
          __int16 v90 = 2112;
          id v91 = v25;
          __int16 v92 = 2114;
          id v93 = v52;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[createOrLoadAccountStores] Will add store {fileName: %{public}@, storeURL: %@, optionsOverride: %{public}@}", v88, 0x20u);
        }
        long long v32 = [v25 lastPathComponent];
        id v33 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v25];
        [v33 setType:NSSQLiteStoreType];
        [v33 setShouldMigrateStoreAutomatically:1];
        [v33 setShouldInferMappingModelAutomatically:1];
        [v33 setConfiguration:0];
        [v33 setOption:&off_1008D7468 forKey:NSPersistentStoreConnectionPoolMaxSizeKey];
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v34 = aSelectora;
        id v35 = [v34 countByEnumeratingWithState:&v66 objects:v87 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v67;
          do
          {
            for (k = 0; k != v35; k = (char *)k + 1)
            {
              if (*(void *)v67 != v36) {
                objc_enumerationMutation(v34);
              }
              uint64_t v38 = *(void *)(*((void *)&v66 + 1) + 8 * (void)k);
              uint64_t v39 = [v34 objectForKeyedSubscript:v38];
              [v33 setOption:v39 forKey:v38];
            }
            id v35 = [v34 countByEnumeratingWithState:&v66 objects:v87 count:16];
          }
          while (v35);
        }

        [v33 setShouldAddStoreAsynchronously:0];
        uint64_t v40 = [(RDStoreController *)self persistentStoreCoordinator];
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        void v60[2] = sub_100077E08;
        v60[3] = &unk_1008B0738;
        id v41 = v33;
        id v61 = v41;
        id v42 = v32;
        id v62 = v42;
        id v63 = buf;
        long long v64 = &v78;
        long long v65 = &v74;
        [v40 addPersistentStoreWithDescription:v41 completionHandler:v60];

        if ([(RDStoreController *)self supportsCoreSpotlightIndexing])
        {
          id v43 = [(RDStoreController *)self coreSpotlightDelegateManager];
          [v43 createAndAttachCoreSpotlightDelegateForStoreWithDescription:v41];
        }
      }
      id v23 = [v53 countByEnumeratingWithState:&v70 objects:v94 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }
LABEL_41:

  if ([(RDStoreController *)self isInitializing] && *((unsigned char *)v75 + 24)) {
    [(RDStoreController *)self setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:1];
  }
  if (a6) {
    *a6 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v47 = *((unsigned char *)v79 + 24) != 0;
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v78, 8);
  return v47;
}

- (BOOL)l_setAccountIdentifier:(id)a3 intoMetadataOfCreatedStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  CFStringRef v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v10 = [(RDStoreController *)self newBackgroundContextWithAuthor:RDStoreControllerCreateAccountStoreAuthor];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007811C;
  v15[3] = &unk_1008B0760;
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  unsigned __int8 v19 = &v21;
  id v13 = v10;
  id v18 = v13;
  id v20 = a5;
  [v13 performBlockAndWait:v15];
  LOBYTE(a5) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)a5;
}

- (void)l_activateCoreSpotlightDelegates
{
  id v2 = [(RDStoreController *)self coreSpotlightDelegateManager];
  [v2 activateCoreSpotlightDelegates];
}

- (BOOL)removeAccountStoresWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10007258C;
  uint64_t v29 = sub_10007259C;
  id v30 = 0;
  uint64_t v21 = 0;
  CFStringRef v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10007258C;
  unsigned __int8 v19 = sub_10007259C;
  id v20 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100078420;
  v10[3] = &unk_1008B0788;
  id v12 = &v21;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  id v13 = &v25;
  id v14 = &v15;
  sub_100078420(v10);
  os_unfair_lock_unlock(&self->_ivarLock);

  if (v26[5]) {
    -[RDStoreController _postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:](self, "_postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:");
  }
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v8 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v8;
}

- (BOOL)l_removeAccountStoresWithIdentifiers:(id)a3 deletedObjectIDs:(id *)a4 error:(id *)a5
{
  uint64_t v21 = a4;
  CFStringRef v22 = a5;
  id v6 = a3;
  id v23 = +[NSMutableSet set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v12 = [(RDStoreController *)self l_accountStoreMap];
        id v13 = [v12 objectForKey:v11];

        id v14 = +[REMLogStore container];
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v34 = v11;
            __int16 v35 = 2112;
            uint64_t v36 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[removeAccountStoresWithIdentifiers] Going to remove store for account {accountIdentifier: %{public}@, store: %@}", buf, 0x16u);
          }

          id v27 = v9;
          id v28 = 0;
          unsigned int v16 = [(RDStoreController *)self l_markAccountStoreDeletedAndDeleteData:v13 deletedObjectIDs:&v28 error:&v27];
          id v14 = v28;
          id v17 = v27;

          if (v16)
          {
            id v18 = [(RDStoreController *)self l_accountStoreMap];
            [v18 removeObjectForKey:v11];

            unsigned __int8 v19 = +[REMLogStore container];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v34 = v11;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[removeAccountStoresWithIdentifiers] Successfully removed store for account {accountIdentifier: %{public}@}", buf, 0xCu);
            }
          }
          else
          {
            ++v25;
            unsigned __int8 v19 = +[REMLogStore container];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v34 = v11;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[removeAccountStoresWithIdentifiers] Failed to remove store for account {accountIdentifier: %{public}@}", buf, 0xCu);
            }
          }

          if (v14) {
            [v23 addObjectsFromArray:v14];
          }
          id v9 = v17;
        }
        else if (v15)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[removeAccountStoresWithIdentifiers] Tried to remove store for unknown account -- skipping {accountIdentifier: %{public}@}", buf, 0xCu);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v25 = 0;
    id v9 = 0;
  }

  if ([v23 count]) {
    [(RDStoreController *)self l_invalidateAccountStorageCaches:@"removeAccountStoresWithIdentifiers"];
  }
  if (v21) {
    *uint64_t v21 = v23;
  }
  if (v22) {
    *CFStringRef v22 = v9;
  }

  return v25 == 0;
}

- (BOOL)l_markAccountStoreDeletedAndDeleteData:(id)a3 deletedObjectIDs:(id *)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x3032000000;
  long long v64 = sub_10007258C;
  long long v65 = sub_10007259C;
  id v66 = 0;
  uint64_t v38 = [(RDStoreController *)self persistentStoreCoordinator];
  uint64_t v40 = self;
  id v7 = [(RDStoreController *)self newBackgroundContextWithAuthor:RDStoreControllerDeleteAccountStoreAuthor];
  id v8 = +[REMLogStore container];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Marking account store as deleted {store: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v76 = 0x3032000000;
  char v77 = sub_10007258C;
  uint64_t v78 = sub_10007259C;
  id v79 = 0;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10007901C;
  v56[3] = &unk_1008B07B0;
  id v44 = v6;
  id v57 = v44;
  p_long long buf = &buf;
  id v58 = v7;
  long long v60 = &v61;
  id v42 = v58;
  [v58 performBlockAndWait:v56];
  if (*(void *)(*((void *)&buf + 1) + 40)
    && (id v9 = objc_alloc((Class)NSUUID),
        (id v39 = [v9 initWithUUIDString:*(void *)(*((void *)&buf + 1) + 40)]) != 0))
  {
    char v35 = 0;
  }
  else
  {
    id v10 = +[REMLogStore container];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100755804((uint64_t)&buf + 8, (uint64_t)v44, v10);
    }

    id v39 = 0;
    char v35 = 1;
  }
  if ([(RDStoreController *)v40 supportsCoreSpotlightIndexing])
  {
    uint64_t v11 = +[REMLogStore container];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v67 = 138412290;
      id v68 = v44;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Deleting spotlight indices {store: %@}", v67, 0xCu);
    }

    id v12 = [(RDStoreController *)v40 coreSpotlightDelegateManager];
    id v74 = v44;
    id v13 = +[NSArray arrayWithObjects:&v74 count:1];
    [v12 stopCoreSpotlightDelegatesForStores:v13];

    id v14 = [(RDStoreController *)v40 coreSpotlightDelegateManager];
    [v14 deleteIndicesForStore:v44];
  }
  if (a4)
  {
    id v43 = +[NSMutableArray array];
  }
  else
  {
    id v43 = 0;
  }
  id v37 = [v38 managedObjectModel];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  BOOL v15 = [v37 entities];
  id v16 = [v15 countByEnumeratingWithState:&v52 objects:v73 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v53;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v53 != v17) {
          objc_enumerationMutation(v15);
        }
        unsigned __int8 v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v21 = [v19 name];
        if (v21)
        {
          CFStringRef v22 = [v19 superentity];
          BOOL v23 = v22 == 0;

          if (v23)
          {
            char v24 = +[REMLogStore container];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long v67 = 138412546;
              id v68 = v21;
              __int16 v69 = 2112;
              id v70 = v44;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Going to delete objects for entity {entity: %@, store: %@}", v67, 0x16u);
            }

            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_10007913C;
            v46[3] = &unk_1008AE810;
            id v47 = v21;
            id v48 = v44;
            id v25 = v42;
            id v49 = v25;
            long long v51 = &v61;
            id v50 = v43;
            [v25 performBlockAndWait:v46];
          }
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v52 objects:v73 count:16];
    }
    while (v16);
  }

  if (!v62[5])
  {
    if ((v35 & 1) == 0)
    {
      id v45 = 0;
      unsigned __int8 v26 = [(RDStoreController *)v40 purgeFilesForAccountWithAccountID:v39 error:&v45];
      id v27 = v45;
      if (v27) {
        unsigned __int8 v28 = 0;
      }
      else {
        unsigned __int8 v28 = v26;
      }
      if (v28)
      {
        long long v29 = +[REMLogStore container];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v67 = 138543618;
          id v68 = v39;
          __int16 v69 = 2112;
          id v70 = v44;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[markAccountStoreDeleted] Purged account files for {accountID: %{public}@, store: %@}", v67, 0x16u);
        }
      }
      else
      {
        long long v29 = +[REMLogStore container];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = [(id)v62[5] localizedDescription];
          *(_DWORD *)long long v67 = 138412802;
          id v68 = v34;
          __int16 v69 = 2114;
          id v70 = v39;
          __int16 v71 = 2112;
          id v72 = v44;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[markAccountStoreDeleted] Errors purging account files {error: %@, accountID: %{public}@, store: %@}", v67, 0x20u);
        }
      }
    }
    long long v30 = [(RDStoreController *)v40 accountStoreManagementDelegate];
    [v30 didMarkForDeletingOnNextLanuchWithPersistentStore:v44 deletedObjectIDs:v43];
  }
  if (a4) {
    *a4 = v43;
  }
  long long v31 = v62;
  if (a5)
  {
    *a5 = (id) v62[5];
    long long v31 = v62;
  }
  BOOL v32 = v31[5] == 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v61, 8);

  return v32;
}

- (void)_postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:(id)a3
{
  if (a3)
  {
    id v7 = NSDeletedObjectIDsKey;
    id v8 = a3;
    id v4 = a3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v6 = +[NSNotificationCenter defaultCenter];

    [v6 postNotificationName:@"RDStoreControllerDidRemoveAccountStoresNotification" object:self userInfo:v5];
  }
}

- (id)fileIOWorkerQueue
{
  if (qword_100922AA0 != -1) {
    dispatch_once(&qword_100922AA0, &stru_1008B07D0);
  }
  id v2 = (void *)qword_100922A98;

  return v2;
}

- (id)URLForAttachmentDirectory:(id)a3 accountID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RDStoreController *)self attachmentFileManager];
  id v9 = [v8 URLForAttachmentDirectory:v7 accountID:v6];

  return v9;
}

- (id)URLForAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(RDStoreController *)self attachmentFileManager];
  BOOL v15 = [v14 URLForAttachmentFile:v13 accountID:v12 fileName:v11 sha512Sum:v10];

  return v15;
}

- (id)extractSha512Sum:(id)a3
{
  id v4 = a3;
  id v5 = [(RDStoreController *)self attachmentFileManager];
  id v6 = [(id)objc_opt_class() extractSha512Sum:v4];

  return v6;
}

- (BOOL)updateAttachmentFile:(id)a3 accountID:(id)a4 fileName:(id)a5 sha512Sum:(id)a6 fileURL:(id)a7 keepSource:(BOOL)a8 error:(id *)a9
{
  uint64_t v9 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(RDStoreController *)self attachmentFileManager];
  LOBYTE(v9) = [v20 updateAttachmentFile:v19 accountID:v18 fileName:v17 sha512Sum:v16 fileURL:v15 keepSource:v9 error:a9];

  return v9;
}

- (BOOL)purgeFilesForAccountWithAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(RDStoreController *)self attachmentFileManager];
  LOBYTE(a4) = [v7 purgeFilesForAccountWithAccountID:v6 error:a4];

  return (char)a4;
}

- (id)purgeAttachmentFilesWithAttachmentIDs:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(RDStoreController *)self attachmentFileManager];
  id v11 = [v10 purgeAttachmentFilesWithAttachmentIDs:v9 accountID:v8 error:a5];

  return v11;
}

- (id)purgeAttachmentFilesWithSha512SumsAndExtensions:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(RDStoreController *)self attachmentFileManager];
  id v11 = [v10 purgeAttachmentFilesWithSha512SumsAndExtensions:v9 accountID:v8 error:a5];

  return v11;
}

- (id)attachmentIDsFromAttachmentDirectoryWithAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(RDStoreController *)self attachmentFileManager];
  id v8 = [v7 attachmentIDsFromAttachmentDirectoryWithAccountID:v6 error:a4];

  return v8;
}

- (void)reindexAllSearchableItems
{
  if ([(RDStoreController *)self supportsCoreSpotlightIndexing])
  {
    p_ivarLock = &self->_ivarLock;
    os_unfair_lock_lock(&self->_ivarLock);
    id v4 = [(RDStoreController *)self coreSpotlightDelegateManager];
    [v4 reindexAllSearchableItems];

    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([(RDStoreController *)self supportsCoreSpotlightIndexing])
  {
    os_unfair_lock_lock(&self->_ivarLock);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100079C00;
    v5[3] = &unk_1008ADC88;
    v5[4] = self;
    id v6 = v4;
    sub_100079C00((uint64_t)v5);
    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (BOOL)invalidateStoreConnectionsWithError:(id *)a3
{
  BOOL v5 = [(RDStoreController *)self isolated];
  if (v5)
  {
    os_unfair_lock_lock(&self->_ivarLock);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100079CFC;
    v7[3] = &unk_1008AF458;
    v7[4] = self;
    v7[5] = a3;
    sub_100079CFC((uint64_t)v7);
    os_unfair_lock_unlock(&self->_ivarLock);
    LOBYTE(v5) = a3 == 0;
  }
  return v5;
}

- (id)newBackgroundContextWithAuthor:(id)a3 enableQueryGenerationToken:(BOOL)a4
{
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100079E4C;
  v12[3] = &unk_1008B07F8;
  id v7 = [[RDStoreControllerManagedObjectContext alloc] initWithConcurrencyType:1];
  id v13 = v7;
  id v14 = self;
  id v15 = v6;
  BOOL v16 = a4;
  id v8 = v6;
  [(RDStoreControllerManagedObjectContext *)v7 performBlockAndWait:v12];
  id v9 = v15;
  id v10 = v7;

  return v10;
}

- (id)newBackgroundContextWithAuthor:(id)a3
{
  return [(RDStoreController *)self newBackgroundContextWithAuthor:a3 enableQueryGenerationToken:1];
}

- (void)requestFreeSpaceToLoadAccountStoresWithQueue:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RDStoreController *)self _dataSeparationIncompatible_defaultReminderDataContainerURL];
  id v9 = [(RDStoreController *)self databaseDirectoryURLWithContainerURL:v8];
  id v10 = +[NSFileManager defaultManager];
  NSURLResourceKey v64 = NSURLFileSizeKey;
  id v11 = +[NSArray arrayWithObjects:&v64 count:1];
  id v56 = 0;
  id v12 = [v10 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:v11 options:1 error:&v56];
  id v13 = v56;

  id v14 = +[REMLogStore container];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    [v9 absoluteString];
    BOOL v16 = v15 = v6;
    id v17 = [v12 count];
    *(_DWORD *)long long buf = 138478339;
    unint64_t v59 = (unint64_t)v16;
    __int16 v60 = 2048;
    uint64_t v61 = (uint64_t)v17;
    __int16 v62 = 2112;
    id v63 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[RDStoreController requestFreeSpaceToLoadAccountStores] Files from URL {url: %{private}@, count: %ld, error: %@}", buf, 0x20u);

    id v6 = v15;
  }

  if (v12)
  {
    id v18 = [(id)objc_opt_class() storeFileNameWithStoreName:@"local"];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v19 = v12;
    id v20 = [v19 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v40 = v12;
      id v41 = v10;
      id v42 = v9;
      id v43 = v8;
      id v44 = v7;
      id v45 = v6;
      unint64_t v47 = 0;
      uint64_t v22 = *(void *)v53;
      id v46 = v18;
      do
      {
        BOOL v23 = 0;
        do
        {
          if (*(void *)v53 != v22) {
            objc_enumerationMutation(v19);
          }
          char v24 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v23);
          id v25 = [v24 pathExtension:v40, v41, v42, v43, v44, v45];
          unsigned __int8 v26 = [v25 lowercaseString];
          unsigned int v27 = [v26 isEqualToString:@"sqlite"];

          if (v27)
          {
            unsigned __int8 v28 = [v24 lastPathComponent];
            long long v29 = v28;
            if (v28
              && [v28 hasPrefix:@"Data-"]
              && ([v29 isEqualToString:v18] & 1) == 0)
            {
              id v50 = 0;
              id v51 = 0;
              unsigned int v31 = [v24 getResourceValue:&v51 forKey:NSURLFileSizeKey error:&v50];
              id v32 = v51;
              id v30 = v50;

              if (!v31 || !v32)
              {
                id v33 = +[REMLogStore container];
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v36 = [v24 lastPathComponent];
                  *(_DWORD *)long long buf = 138543618;
                  unint64_t v59 = (unint64_t)v36;
                  __int16 v60 = 2114;
                  uint64_t v61 = (uint64_t)v30;
                  _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[RDStoreController requestFreeSpaceToLoadAccountStores] Failed to get file size {file: %{public}@, error: %{public}@}", buf, 0x16u);
                }
              }
              uint64_t v34 = +[REMLogStore container];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                char v35 = [v24 lastPathComponent];
                *(_DWORD *)long long buf = 138412546;
                unint64_t v59 = (unint64_t)v35;
                __int16 v60 = 2112;
                uint64_t v61 = (uint64_t)v32;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[RDStoreController requestFreeSpaceToLoadAccountStores] File size is {file: %@, size: %@}", buf, 0x16u);
              }
              v47 += [v32 unsignedIntValue];

              id v18 = v46;
            }
            else
            {
              id v30 = v13;
            }

            id v13 = v30;
          }
          BOOL v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v37 = [v19 countByEnumeratingWithState:&v52 objects:v57 count:16];
        id v21 = v37;
      }
      while (v37);

      if (v47)
      {
        uint64_t v38 = +[REMLogStore container];
        id v7 = v44;
        id v6 = v45;
        id v9 = v42;
        id v8 = v43;
        id v12 = v40;
        id v10 = v41;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134218240;
          unint64_t v59 = v47 << (v47 < 0x7FFFFFFFFFFFFFFFLL);
          __int16 v60 = 2048;
          uint64_t v61 = 2;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[RDStoreController requestFreeSpaceToLoadAccountStores] Trying to request free space (multiplied) {space: %llu, multiplier: %llu}", buf, 0x16u);
        }

        +[RDDiskSpaceUtils requestFreeSpace:v47 << (v47 < 0x7FFFFFFFFFFFFFFFLL) atPath:v42 effortLevel:1 queue:v45 completionBlock:v44];
        goto LABEL_35;
      }
      id v7 = v44;
      id v6 = v45;
      id v9 = v42;
      id v8 = v43;
      id v12 = v40;
      id v10 = v41;
    }
    else
    {
    }
  }
  id v39 = +[REMLogStore container];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[RDStoreController requestFreeSpaceToLoadAccountStores] Aborted requesting free space, dispatch to call completion directly", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A574;
  block[3] = &unk_1008AE138;
  id v49 = v7;
  dispatch_async(v6, block);

LABEL_35:
}

- (BOOL)notificationContainsInternalChangesOnly:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RDStoreController *)self cloudContext];
  unsigned __int8 v6 = [v5 notificationContainsCloudContextInternalChangesOnly:v4];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = [(RDStoreController *)self notificationContainsChangeTrackingChangesOnly:v4];
  }

  return v7;
}

- (BOOL)notificationContainsChangeTrackingChangesOnly:(id)a3
{
  uint64_t v3 = NSManagedObjectContextTransactionAuthorKey;
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:v3];

  objc_opt_class();
  unsigned __int8 v6 = REMDynamicCast();
  BOOL v7 = v6;
  if (v6) {
    unsigned __int8 v8 = [v6 isEqualToString:REMNSPersistentHistoryTrackingAuthor];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)startObservingCloudKitNetworkActivityWithObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(RDStoreController *)self cloudKitNetworkActivityObservers];
    objc_sync_enter(v5);
    unsigned __int8 v6 = [(RDStoreController *)self cloudKitNetworkActivityObservers];
    [v6 addObject:v9];

    objc_sync_exit(v5);
    BOOL v7 = [(RDStoreController *)self cloudContext];
    unsigned __int8 v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 hasPendingOperations]);

    [(RDStoreController *)self _notifyCloudKitNetworkActivityObservers:v8];
    id v4 = v9;
  }
}

- (void)_cleanUpCloudKitNetworkActivityObservers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(RDStoreController *)self cloudKitNetworkActivityObservers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isObsolete])
        {
          id v10 = [(RDStoreController *)self cloudKitNetworkActivityObservers];
          [v10 removeObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_notifyCloudKitNetworkActivityObservers:(id)a3
{
  id v4 = a3;
  id v5 = [(RDStoreController *)self cloudKitNetworkActivityObservers];
  objc_sync_enter(v5);
  [(RDStoreController *)self _cleanUpCloudKitNetworkActivityObservers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [(RDStoreController *)self cloudKitNetworkActivityObservers];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateNetworkActivityWithValue:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)cloudContextHasPendingOperationsDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 userInfo];

  id v6 = [v5 objectForKeyedSubscript:@"operationCount"];
  uint64_t v7 = REMDynamicCast();
  uint64_t v8 = (void *)v7;
  id v9 = &off_1008D7480;
  if (v7) {
    id v9 = (_UNKNOWN **)v7;
  }
  long long v10 = v9;

  [(RDStoreController *)self _notifyCloudKitNetworkActivityObservers:v10];
}

- (void)cloudContext:(id)a3 didFetchUserRecord:(id)a4 accountID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didFetchUserRecord: %@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007AC50;
  v13[3] = &unk_1008ADD00;
  id v14 = v7;
  id v15 = v8;
  id v16 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.RDStoreController.ckFetchUser"];
  id v10 = v16;
  id v11 = v8;
  id v12 = v7;
  [v10 performBlockAndWait:v13];
}

- (void)cloudContext:(id)a3 receivedZoneNotFound:(id)a4 accountID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 zoneName];
    *(_DWORD *)long long buf = 138543618;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received an error that a zone (%{public}@) wasn't found. Re-uploading everything for that zone for accountID %{public}@.", buf, 0x16u);
  }
  if (v8)
  {
    id v11 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.RDStoreController.ckZoneNotFound"];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007AEAC;
    v13[3] = &unk_1008ADD00;
    id v14 = v7;
    id v15 = v8;
    id v16 = v11;
    id v12 = v11;
    [v12 performBlock:v13];
  }
  else
  {
    id v12 = +[REMLog cloudkit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100755980(v7);
    }
  }
}

- (void)cloudContext:(id)a3 sharedZoneWasDeleted:(id)a4 accountID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Shared zone was deleted for account ID %{public}@: %{public}@", buf, 0x16u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007B1D0;
  v14[3] = &unk_1008ADD00;
  id v15 = v7;
  id v16 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.RDStoreController.ckSharedZoneWasDeleted"];
  id v17 = v8;
  id v11 = v8;
  id v12 = v16;
  id v13 = v7;
  [v12 performBlockAndWait:v14];
}

- (void)cloudContext:(id)a3 userDidDeleteRecordZoneWithID:(id)a4 accountID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543618;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "userDidDeleteRecordZoneWithID: %{public}@, accountID:%{public}@", buf, 0x16u);
  }

  if (!v8)
  {
    id v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100755A04(v7);
    }
    goto LABEL_8;
  }
  id v10 = +[ICCloudContext appZoneID];
  unsigned int v11 = [v7 isEqual:v10];

  if (v11)
  {
    id v12 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.RDStoreController.ckDeleteZone"];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007B684;
    v14[3] = &unk_1008ADD00;
    id v15 = v8;
    id v16 = v12;
    id v17 = self;
    id v13 = v12;
    [v13 performBlockAndWait:v14];

LABEL_8:
  }
}

- (BOOL)deleteCloudObjectIfFullyPushed:(id)a3
{
  id v4 = a3;
  if ([v4 isDeleted])
  {
LABEL_14:
    BOOL v11 = 1;
    goto LABEL_20;
  }
  if (([v4 hasSuccessfullyPushedLatestVersionToCloud] & 1) != 0
    || ([v4 markedForDeletion] & 1) != 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    id v5 = [v4 objectsToBeDeletedBeforeThisObject];
    id v6 = (char *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          id v10 = REMDynamicCast();
          if (v10
            && ![(RDStoreController *)self deleteCloudObjectIfFullyPushed:v10])
          {

            goto LABEL_19;
          }
        }
        id v7 = (char *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [v4 deleteFromLocalDatabase];
    goto LABEL_14;
  }
  id v12 = +[REMLog cloudkit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100755AF0(v4);
  }

LABEL_19:
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (void)didFailPushingExceededStorageQuotaForContext:(id)a3 accountID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[REMLog cloudkit];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didFailPushingExceededStorageQuotaForContext: %@, accountID: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NSDeletedObjectIDsKey];

  id v6 = [v3 userInfo];
  uint64_t v61 = [v6 objectForKeyedSubscript:NSInsertedObjectIDsKey];

  id v7 = [v3 userInfo];
  __int16 v60 = [v7 objectForKeyedSubscript:NSUpdatedObjectIDsKey];

  int v8 = +[REMLogStore write];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    id v57 = v5;
    id v58 = v3;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v82 objects:v93 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v83;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v83 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v82 + 1) + 8 * i);
          long long v16 = +[REMLogStore write];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v92 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Deleted object {managedObjectID: %@}", buf, 0xCu);
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v82 objects:v93 count:16];
      }
      while (v12);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v17 = v61;
    id v18 = [v17 countByEnumeratingWithState:&v78 objects:v90 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v79;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v79 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v78 + 1) + 8 * (void)j);
          BOOL v23 = +[REMLogStore write];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v92 = v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Inserted object {managedObjectID: %@}", buf, 0xCu);
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v78 objects:v90 count:16];
      }
      while (v19);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v24 = v60;
    id v25 = [v24 countByEnumeratingWithState:&v74 objects:v89 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v75;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v75 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v74 + 1) + 8 * (void)k);
          id v30 = +[REMLogStore write];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v92 = v29;
            _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Updated object {managedObjectID: %@}", buf, 0xCu);
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v74 objects:v89 count:16];
      }
      while (v26);
    }

    id v5 = v57;
    id v3 = v58;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v31 = v5;
  id v32 = [v31 countByEnumeratingWithState:&v70 objects:v88 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v71;
    while (2)
    {
      for (m = 0; m != v33; m = (char *)m + 1)
      {
        if (*(void *)v71 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = [*(id *)(*((void *)&v70 + 1) + 8 * (void)m) entity];
        id v37 = +[REMCDObject entity];
        unsigned __int8 v38 = [v36 isEqual:v37];

        if (v38)
        {
          id v39 = v31;
          goto LABEL_56;
        }
      }
      id v33 = [v31 countByEnumeratingWithState:&v70 objects:v88 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v39 = v61;
  id v40 = [v39 countByEnumeratingWithState:&v66 objects:v87 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v67;
LABEL_40:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v67 != v42) {
        objc_enumerationMutation(v39);
      }
      id v44 = [*(id *)(*((void *)&v66 + 1) + 8 * v43) entity];
      id v45 = +[REMCDObject entity];
      unsigned __int8 v46 = [v44 isEqual:v45];

      if (v46) {
        goto LABEL_56;
      }
      if (v41 == (id)++v43)
      {
        id v41 = [v39 countByEnumeratingWithState:&v66 objects:v87 count:16];
        if (v41) {
          goto LABEL_40;
        }
        break;
      }
    }
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v39 = v60;
  id v47 = [v39 countByEnumeratingWithState:&v62 objects:v86 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v63;
LABEL_48:
    uint64_t v50 = 0;
    while (1)
    {
      if (*(void *)v63 != v49) {
        objc_enumerationMutation(v39);
      }
      id v51 = [*(id *)(*((void *)&v62 + 1) + 8 * v50) entity];
      long long v52 = +[REMCDObject entity];
      unsigned __int8 v53 = [v51 isEqual:v52];

      if (v53) {
        break;
      }
      if (v48 == (id)++v50)
      {
        id v48 = [v39 countByEnumeratingWithState:&v62 objects:v86 count:16];
        if (v48) {
          goto LABEL_48;
        }
        goto LABEL_57;
      }
    }
LABEL_56:

    os_unfair_lock_lock(&self->_ivarLock);
    long long v54 = [(RDStoreController *)self l_accountStorageCacheByObjectIDs];
    long long v55 = [v54 keyEnumerator];
    id v56 = [v55 allObjects];
    id v39 = +[NSString stringWithFormat:@"managedObjectContextDidSave(REMCDAccount-changed) {self: %p, keys: %@}", self, v56];

    [(RDStoreController *)self l_invalidateAccountStorageCaches:v39];
    os_unfair_lock_unlock(&self->_ivarLock);
  }
LABEL_57:
}

- (id)observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  int v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RDStoreController *)self cloudContext];
  unsigned int v12 = [v11 hasPassedBuddy];

  uint64_t v13 = [(RDStoreController *)self cloudContext];
  unsigned int v14 = [v13 isSystemAvailableForSyncing];

  if (v12 & v14)
  {
    id v15 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.remindd.RDStoreController.observePrimaryCloudKitAccountPersonIDSaltChanges"];
    long long v16 = [(RDStoreController *)self appleAccountUtilities];
    *(void *)uint64_t v50 = 0;
    id v51 = v50;
    uint64_t v52 = 0x3032000000;
    unsigned __int8 v53 = sub_10007258C;
    long long v54 = sub_10007259C;
    id v55 = 0;
    uint64_t v44 = 0;
    id v45 = &v44;
    uint64_t v46 = 0x3032000000;
    id v47 = sub_10007258C;
    id v48 = sub_10007259C;
    id v49 = 0;
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10007C6D8;
    v34[3] = &unk_1008AEB20;
    id v17 = v15;
    char v35 = v17;
    id v18 = v16;
    id v36 = v18;
    id v37 = v50;
    unsigned __int8 v38 = &v44;
    id v39 = &v40;
    [v17 performBlockAndWait:v34];
    if (*((void *)v51 + 5) && !*((unsigned char *)v41 + 24))
    {
      BOOL v23 = +[REMAccount objectIDWithUUID:](REMAccount, "objectIDWithUUID:");
      id v24 = [RDAccountPersonIDSaltObserver alloc];
      id v25 = [(RDAccountPersonIDSaltObserver *)v24 initWithAccountObjectID:v23 accountType:_auto_REMAccountTypeForPrimaryCloudKit() initialSaltValue:v45[5] callbackQueue:v8 successHandler:v9 errorHandler:v10];
      uint64_t v22 = v25;
      if (!v25
        || ([(RDAccountPersonIDSaltObserver *)v25 uuid],
            id v26 = objc_claimAutoreleasedReturnValue(),
            BOOL v27 = v26 == 0,
            v26,
            v27))
      {
        uint64_t v29 = +[REMLog cloudkit];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100755BB0();
        }
      }
      else
      {
        unsigned __int8 v28 = [(RDStoreController *)self accountPropertiesNotifier];
        [v28 observeWithObserver:v22];

        uint64_t v29 = +[REMLog cloudkit];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          id v30 = [(RDAccountPersonIDSaltObserver *)v22 uuid];
          *(_DWORD *)long long buf = 138412546;
          id v57 = v30;
          __int16 v58 = 2112;
          unint64_t v59 = v23;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Created an RDAccountPersonIDSaltObserver and added to accountPropertiesNotifier {observerID: %@, accountObjID: %@}", buf, 0x16u);
        }
      }
    }
    else
    {
      id v19 = +[REMLog cloudkit];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = (void *)*((void *)v51 + 5);
        int v21 = *((unsigned __int8 *)v41 + 24);
        *(_DWORD *)long long buf = 138543618;
        id v57 = v20;
        __int16 v58 = 1024;
        LODWORD(v59) = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not creating an RDAccountPersonIDSaltObserver because primary cloudkit account is not available. Notifying caller explicitly to handle RDAccountPersonIDSaltObserver.AccountAbsentError... {accountID: %{public}@, inactive: %d}", buf, 0x12u);
      }

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10007C77C;
      v32[3] = &unk_1008AE138;
      id v33 = v10;
      dispatch_async(v8, v32);
      uint64_t v22 = 0;
      BOOL v23 = v33;
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(v50, 8);
  }
  else
  {
    id v17 = +[REMLog cloudkit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not creating an RDAccountPersonIDSaltObserver because the system is not ready to retrieve the primary cloudkit account", v50, 2u);
    }
    uint64_t v22 = 0;
  }

  return v22;
}

- (void)unobservePrimaryCloudKitAccountPersonIDSaltChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(RDStoreController *)self accountPropertiesNotifier];
  [v5 unobserveWithObserver:v4];

  id v6 = +[REMLog cloudkit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 uuid];
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Removed RDAccountPersonIDSaltObserver from accountPropertiesNotifier {observerID: %@}", (uint8_t *)&v8, 0xCu);
  }
}

+ (id)entityNamesToIncludeFromTracking
{
  if (qword_100922AB0 != -1) {
    dispatch_once(&qword_100922AB0, &stru_1008B0818);
  }
  id v2 = (void *)qword_100922AA8;

  return v2;
}

- (void)_populateCountForEntity:(Class)a3 withinCDAccount:(id)a4 statsAccumulator:(id)a5 errorAccumulator:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned int v12 = NSStringFromClass(a3);
  uint64_t v13 = +[NSPredicate predicateWithFormat:@"%K == %@", @"account", v9];
  unsigned int v14 = +[NSFetchRequest fetchRequestWithEntityName:v12];
  [v14 setPredicate:v13];
  [v14 setResultType:4];
  id v15 = [v9 managedObjectContext];
  id v23 = 0;
  id v16 = [v15 countForFetchRequest:v14 error:&v23];
  id v17 = v23;

  if (v17)
  {
    id v18 = [v17 debugDescription];
    [v11 addObject:v18];
LABEL_5:

    goto LABEL_6;
  }
  if (v16)
  {
    id v18 = +[NSNumber numberWithUnsignedInteger:v16];
    int v21 = +[NSString stringWithFormat:@"%@", v18];
    uint64_t v22 = [v9 identifier];
    id v19 = [v22 UUIDString];
    uint64_t v20 = +[NSString stringWithFormat:@"account[%@].%@.count", v19, v12];
    [v10 setObject:v21 forKeyedSubscript:v20];

    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)supportsAccountUtils
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsAlarmEngine
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsAppStoreRating
{
  return ![(RDStoreController *)self isPPTStore];
}

- (BOOL)supportsTimelineEngine
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsAssignmentNotificationEngine
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsHashtagLabelUpdater
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsStalePinnedListsEventHandler
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsTemplateOperation
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsGroceryOperation
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsCoreSpotlightIndexing
{
  id v3 = [(RDStoreController *)self coreSpotlightDelegateManager];
  if ([v3 enableCoreSpotlightIndexing]) {
    unsigned int v4 = ![(RDStoreController *)self isPPTStore];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)supportsSyncingToCloudKit
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsCloudSchemaCatchUpSyncBackgroundScheduling
{
  id v3 = [(RDStoreController *)self daemonUserDefaults];
  unsigned __int8 v4 = [v3 debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling];

  if (v4) {
    return 1;
  }

  return [(RDStoreController *)self supportsSyncingToCloudKit];
}

- (BOOL)supportsApplicationShortcuts
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsSuggestedAttributes
{
  if (self->_supportsSuggestedAttributes) {
    return ![(RDStoreController *)self isPPTStore];
  }
  else {
    return 0;
  }
}

- (BOOL)supportsWidgetRefresh
{
  return 1;
}

- (BOOL)supportsSyncActivityNotificationEngine
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (BOOL)supportsSharedInlineTagAutoConvertEngine
{
  if ([(RDStoreController *)self isolated]) {
    return 0;
  }
  else {
    return ![(RDStoreController *)self isPPTStore];
  }
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
}

- (RDAccountPropertiesNotifier)accountPropertiesNotifier
{
  return self->_accountPropertiesNotifier;
}

- (void)setAccountPropertiesNotifier:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (RDAttachmentFileManager)attachmentFileManager
{
  return self->_attachmentFileManager;
}

- (NSURL)isolatedReminderDataContainerURL
{
  return self->_isolatedReminderDataContainerURL;
}

- (void)setIsolatedReminderDataContainerURL:(id)a3
{
}

- (RDAccountUtils)accountUtils
{
  return self->_accountUtils;
}

- (void)setAccountUtils:(id)a3
{
}

- (REMAppleAccountUtilities)appleAccountUtilities
{
  return self->_appleAccountUtilities;
}

- (void)setAppleAccountUtilities:(id)a3
{
}

- (BOOL)hasFailedLoadingAccountStoresFromDiskDueToDiskFull
{
  return self->_hasFailedLoadingAccountStoresFromDiskDueToDiskFull;
}

- (void)setHasFailedLoadingAccountStoresFromDiskDueToDiskFull:(BOOL)a3
{
  self->_hasFailedLoadingAccountStoresFromDiskDueToDiskFull = a3;
}

- (BOOL)containsLargeDatabases
{
  return self->_containsLargeDatabases;
}

- (void)setContainsLargeDatabases:(BOOL)a3
{
  self->_containsLargeDatabases = a3;
}

- (BOOL)containsOnlySmallDatabases
{
  return self->_containsOnlySmallDatabases;
}

- (void)setContainsOnlySmallDatabases:(BOOL)a3
{
  self->_containsOnlySmallDatabases = a3;
}

- (RDStoreControllerAccountStoreManagementDelegate)accountStoreManagementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountStoreManagementDelegate);

  return (RDStoreControllerAccountStoreManagementDelegate *)WeakRetained;
}

- (void)setAccountStoreManagementDelegate:(id)a3
{
}

- (BOOL)supportsLocalInternalAccount
{
  return self->_supportsLocalInternalAccount;
}

- (void)setSupportsLocalInternalAccount:(BOOL)a3
{
  self->_supportsLocalInternalAccount = a3;
}

- (void)setSupportsSuggestedAttributes:(BOOL)a3
{
  self->_supportsSuggestedAttributes = a3;
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (REMDaemonUserDefaults)daemonUserDefaults
{
  return self->_daemonUserDefaults;
}

- (void)setDaemonUserDefaults:(id)a3
{
}

- (NSMergePolicy)mergePolicy
{
  return self->_mergePolicy;
}

- (void)setMergePolicy:(id)a3
{
}

- (NSMapTable)l_accountStoreMap
{
  return self->_l_accountStoreMap;
}

- (void)setL_accountStoreMap:(id)a3
{
}

- (NSMapTable)l_accountStorageCacheByObjectIDs
{
  return self->_l_accountStorageCacheByObjectIDs;
}

- (void)setL_accountStorageCacheByObjectIDs:(id)a3
{
}

- (NSMapTable)l_accountExternalIdentifiersToObjectIDsMap
{
  return self->_l_accountExternalIdentifiersToObjectIDsMap;
}

- (void)setL_accountExternalIdentifiersToObjectIDsMap:(id)a3
{
}

- (NSHashTable)l_allGenericAccountsObjectIDs
{
  return self->_l_allGenericAccountsObjectIDs;
}

- (void)setL_allGenericAccountsObjectIDs:(id)a3
{
}

- (RDCoreSpotlightDelegateManager)coreSpotlightDelegateManager
{
  return self->_coreSpotlightDelegateManager;
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (void)setIsInitializing:(BOOL)a3
{
  self->_isInitializing = a3;
}

- (BOOL)isPPTStore
{
  return self->_isPPTStore;
}

- (void)setIsPPTStore:(BOOL)a3
{
  self->_isPPTStore = a3;
}

- (NSMutableSet)cloudKitNetworkActivityObservers
{
  return self->_cloudKitNetworkActivityObservers;
}

- (void)setCloudKitNetworkActivityObservers:(id)a3
{
}

- (REMObjectID)l_primaryActiveCloudKitAccountREMObjectID
{
  return self->_l_primaryActiveCloudKitAccountREMObjectID;
}

- (void)setL_primaryActiveCloudKitAccountREMObjectID:(id)a3
{
}

- (BOOL)unittest_isTestingDataSeparation
{
  return self->_unittest_isTestingDataSeparation;
}

- (void)setUnittest_isTestingDataSeparation:(BOOL)a3
{
  self->_unittest_isTestingDataSeparation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_l_primaryActiveCloudKitAccountREMObjectID, 0);
  objc_storeStrong((id *)&self->_cloudKitNetworkActivityObservers, 0);
  objc_storeStrong((id *)&self->_coreSpotlightDelegateManager, 0);
  objc_storeStrong((id *)&self->_l_allGenericAccountsObjectIDs, 0);
  objc_storeStrong((id *)&self->_l_accountExternalIdentifiersToObjectIDsMap, 0);
  objc_storeStrong((id *)&self->_l_accountStorageCacheByObjectIDs, 0);
  objc_storeStrong((id *)&self->_l_accountStoreMap, 0);
  objc_storeStrong((id *)&self->_mergePolicy, 0);
  objc_storeStrong((id *)&self->_daemonUserDefaults, 0);
  objc_destroyWeak((id *)&self->_accountStoreManagementDelegate);
  objc_storeStrong((id *)&self->_appleAccountUtilities, 0);
  objc_storeStrong((id *)&self->_accountUtils, 0);
  objc_storeStrong((id *)&self->_isolatedReminderDataContainerURL, 0);
  objc_storeStrong((id *)&self->_attachmentFileManager, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_accountPropertiesNotifier, 0);

  objc_storeStrong((id *)&self->_cloudContext, 0);
}

- (id)inMemoryPrimaryActiveCKAccountREMObjectID
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10007258C;
  unsigned int v12 = sub_10007259C;
  id v13 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  uint64_t v4 = [(RDStoreController *)self l_primaryActiveCloudKitAccountREMObjectID];
  id v5 = (void *)v9[5];
  void v9[5] = v4;

  os_unfair_lock_unlock(p_ivarLock);
  id v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

- (void)updateInMemoryPrimaryActiveCKAccountREMObjectIDIfNecessary:(id)a3
{
  id v4 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007D7B0;
  v7[3] = &unk_1008ADC88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_10007D7B0((uint64_t)v7);
  os_unfair_lock_unlock(p_ivarLock);
}

- (id)accountStoragesForAccountObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10007258C;
  id v16 = sub_10007259C;
  id v17 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007D974;
  v9[3] = &unk_1008ADD28;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_10007D974((uint64_t)v9);
  os_unfair_lock_unlock(p_ivarLock);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setAccountStorages:(id)a3 forAccountObjectIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007DAA4;
  v11[3] = &unk_1008ADD00;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_10007DAA4((uint64_t)v11);
  os_unfair_lock_unlock(p_ivarLock);
}

- (id)accountStoragesForAccountExternalIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10007258C;
  id v16 = sub_10007259C;
  id v17 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007DC00;
  v8[3] = &unk_1008ADFD0;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  id v11 = &v12;
  sub_10007DC00((uint64_t)v8);
  os_unfair_lock_unlock(&self->_ivarLock);

  id v6 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v6;
}

- (void)setAccountStorages:(id)a3 forAccountExternalIdentifiers:(id)a4
{
  id v5 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007DE2C;
  v8[3] = &unk_1008ADC88;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  sub_10007DE2C((uint64_t)v8);
  os_unfair_lock_unlock(p_ivarLock);
}

- (id)accountStoragesForAllGenericAccounts
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10007258C;
  id v11 = sub_10007259C;
  id v12 = 0;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007E0D4;
  v6[3] = &unk_1008AFB60;
  v6[4] = self;
  v6[5] = &v7;
  sub_10007E0D4((uint64_t)v6);
  os_unfair_lock_unlock(p_ivarLock);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setAccountStoragesForAllGenericAccountsWithStorages:(id)a3
{
  id v4 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007E3A4;
  v7[3] = &unk_1008ADC88;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  sub_10007E3A4((uint64_t)v7);
  os_unfair_lock_unlock(p_ivarLock);
}

- (id)l_accountStoragesForAccountObjectIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(RDStoreController *)self l_accountStorageCacheByObjectIDs];
  uint64_t v7 = [v6 keyEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([v4 containsObject:v12])
        {
          id v13 = [(RDStoreController *)self l_accountStorageCacheByObjectIDs];
          uint64_t v14 = [v13 objectForKey:v12];

          [v5 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)l_setAccountStorages:(id)a3 forAccountObjectIDs:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v6 objectAtIndex:v7];
      id v9 = [v13 objectAtIndex:v7];
      uint64_t v10 = [v9 externalIdentifier];
      id v11 = [(RDStoreController *)self l_accountStorageCacheByObjectIDs];
      [v11 setObject:v9 forKey:v8];

      if (v10)
      {
        uint64_t v12 = [(RDStoreController *)self l_accountExternalIdentifiersToObjectIDsMap];
        [v12 setObject:v8 forKey:v10];
      }
      ++v7;
    }
    while (v7 < (unint64_t)[v6 count]);
  }
}

- (void)l_invalidateAccountStorageCaches:(id)a3
{
  id v4 = a3;
  id v5 = [(RDStoreController *)self l_accountStorageCacheByObjectIDs];
  [v5 removeAllObjects];

  id v6 = [(RDStoreController *)self l_accountExternalIdentifiersToObjectIDsMap];
  [v6 removeAllObjects];

  unint64_t v7 = [(RDStoreController *)self l_allGenericAccountsObjectIDs];
  [v7 removeAllObjects];

  id v8 = +[REMLogStore container];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Account storage invocation caches invalidated {reason: %{public}@}", (uint8_t *)&v9, 0xCu);
  }
}

- (id)_dataSeparationIncompatible_defaultReminderDataContainerURL
{
  id v2 = [(RDStoreController *)self isolatedReminderDataContainerURL];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[RDPaths defaultReminderDataContainerURL];
  }
  id v5 = v4;

  return v5;
}

- (BOOL)nukeDataWithError:(id *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10007258C;
  id v23 = sub_10007259C;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_10007258C;
  long long v17 = sub_10007259C;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007EC90;
  v8[3] = &unk_1008B0840;
  void v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v19;
  v8[7] = &v13;
  sub_10007EC90((uint64_t)v8);
  os_unfair_lock_unlock(p_ivarLock);
  if (v20[5]) {
    -[RDStoreController _postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:](self, "_postDidRemoveAccountStoresNotificationWithDeletedObjectIDs:");
  }
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v6;
}

- (void)purgeDeletedObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F1BC;
  v7[3] = &unk_1008AE160;
  id v8 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.RDStoreController.purgeDeleted"];
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlock:v7];
}

- (id)status:(BOOL)a3
{
  BOOL v86 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  os_unfair_lock_t lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v5 = [(RDStoreController *)self l_accountStoreMap];
  id v6 = [v5 keyEnumerator];

  id obj = v6;
  unint64_t v7 = INDateRelevanceProvider_ptr;
  uint64_t v89 = v4;
  id v87 = [v6 countByEnumeratingWithState:&v94 objects:v99 count:16];
  if (v87)
  {
    uint64_t v84 = *(void *)v95;
    long long v85 = self;
    do
    {
      for (i = 0; i != v87; i = (char *)i + 1)
      {
        if (*(void *)v95 != v84) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v94 + 1) + 8 * i);
        id v10 = [v7[87] stringWithFormat:@"accountStore.%@", v9];
        uint64_t v11 = [(RDStoreController *)self l_accountStoreMap];
        char v12 = [v11 objectForKey:v9];

        uint64_t v13 = [v12 identifier];
        uint64_t v14 = [v12 URL];
        uint64_t v15 = v14;
        if (v86)
        {
          long long v16 = self;
          objc_opt_class();
          id v88 = v13;
          long long v17 = [v12 options];
          id v18 = [v17 valueForKey:NSPersistentStoreConnectionPoolMaxSizeKey];
          uint64_t v83 = REMDynamicCast();

          uint64_t v19 = [(RDStoreController *)v16 appleAccountUtilities];
          uint64_t v20 = [v19 applicationDocumentsURLForAccountIdentifier:v9];

          long long v81 = [(RDStoreController *)v16 _reminderDataContainerURLForAccountIdentifier:v9];
          long long v82 = +[RDStagedLightweightCoreDataMigrationCoordinator stagedMigrationsInfoForPersistentStoreAt:v15];
          uint64_t v21 = v7[87];
          uint64_t v22 = [v15 absoluteString];
          id v23 = [v21 stringWithFormat:@"{storeID: %@, URL: %@, connectionPoolMaxSize: %@}", v88, v22, v83, lock];
          [v89 setObject:v23 forKeyedSubscript:v10];

          id v24 = v7[87];
          id v25 = [v20 absoluteString];
          id v26 = [v24 stringWithFormat:@"%@", v25];
          BOOL v27 = [v7[87] stringWithFormat:@"%@.applicationDocumentsURL", v10];
          [v89 setObject:v26 forKeyedSubscript:v27];

          unsigned __int8 v28 = v7[87];
          uint64_t v29 = [v81 absoluteString];
          id v30 = [v28 stringWithFormat:@"%@", v29];
          id v31 = [v7[87] stringWithFormat:@"%@.reminderDataContainerURL", v10];
          [v89 setObject:v30 forKeyedSubscript:v31];

          id v4 = v89;
          id v32 = &__NSArray0__struct;
          if (v82) {
            id v32 = v82;
          }
          id v33 = [v7[87] stringWithFormat:@"%@", v32];
          uint64_t v34 = [v7[87] stringWithFormat:@"%@.stagedMigrations", v10];
          [v89 setObject:v33 forKeyedSubscript:v34];

          uint64_t v13 = v88;
          char v35 = (void *)v83;
        }
        else
        {
          id v36 = v7[87];
          char v35 = [v14 absoluteString];
          uint64_t v20 = [v36 stringWithFormat:@"{storeID: %@, URL: %@}", v13, v35];
          [v4 setObject:v20 forKeyedSubscript:v10];
        }

        self = v85;
        unint64_t v7 = INDateRelevanceProvider_ptr;
      }
      id v87 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
    }
    while (v87);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v37 = [(RDStoreController *)self l_accountExternalIdentifiersToObjectIDsMap];
  unsigned __int8 v38 = [v37 keyEnumerator];

  id v39 = [v38 countByEnumeratingWithState:&v90 objects:v98 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v91;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v91 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v90 + 1) + 8 * (void)j);
        uint64_t v44 = +[NSString stringWithFormat:@"accountExternalIDsMap.%@", v43];
        id v45 = [(RDStoreController *)self l_accountExternalIdentifiersToObjectIDsMap];
        uint64_t v46 = [v45 objectForKey:v43];
        id v47 = [v46 description];
        [v89 setObject:v47 forKeyedSubscript:v44];
      }
      id v40 = [v38 countByEnumeratingWithState:&v90 objects:v98 count:16];
    }
    while (v40);
  }

  id v48 = [(RDStoreController *)self l_accountStorageCacheByObjectIDs];
  id v49 = [v48 keyEnumerator];
  uint64_t v50 = [v49 allObjects];
  id v51 = [v50 description];
  [v89 setObject:v51 forKeyedSubscript:@"accountStorageCache.keys"];

  uint64_t v52 = [(RDStoreController *)self l_allGenericAccountsObjectIDs];
  unsigned __int8 v53 = [v52 allObjects];
  long long v54 = [v53 description];
  [v89 setObject:v54 forKeyedSubscript:@"accountStorageCache.hasAllGenericAccounts"];

  id v55 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", +[RDPaths isDataSeparationEnabled]);
  [v89 setObject:v55 forKeyedSubscript:@"dataSeparationEnabled"];

  id v56 = +[RDPaths defaultReminderDataContainerURL];
  id v57 = [v56 absoluteString];
  [v89 setObject:v57 forKeyedSubscript:@"defaultReminderDataContainerURL"];

  __int16 v58 = +[RDPaths defaultApplicationDocumentsURL];
  unint64_t v59 = [v58 absoluteString];
  [v89 setObject:v59 forKeyedSubscript:@"defaultApplicationDocumentsURL"];

  __int16 v60 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self isolated]];
  [v89 setObject:v60 forKeyedSubscript:@"isolated"];

  uint64_t v61 = [(RDStoreController *)self isolatedReminderDataContainerURL];
  long long v62 = [v61 absoluteString];
  [v89 setObject:v62 forKeyedSubscript:@"isolatedReminderDataContainerURL"];

  long long v63 = [(RDStoreController *)self l_primaryActiveCloudKitAccountREMObjectID];
  long long v64 = v63;
  if (v63)
  {
    long long v65 = [v63 description];
    [v89 setObject:v65 forKeyedSubscript:@"primaryActiveCKAccountID"];
  }
  else
  {
    [v89 setObject:@"Nil" forKeyedSubscript:@"primaryActiveCKAccountID"];
  }
  long long v66 = +[NSString stringWithFormat:@"%ld", rem_currentRuntimeVersion()];
  [v89 setObject:v66 forKeyedSubscript:@"remCurrentRuntimeVersion"];

  long long v67 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsAccountUtils]];
  [v89 setObject:v67 forKeyedSubscript:@"supportsAccountUtils"];

  long long v68 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsAlarmEngine]];
  [v89 setObject:v68 forKeyedSubscript:@"supportsAlarmEngine"];

  long long v69 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsTimelineEngine]];
  [v89 setObject:v69 forKeyedSubscript:@"supportsTimelineEngine"];

  long long v70 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsAssignmentNotificationEngine]];
  [v89 setObject:v70 forKeyedSubscript:@"supportsAssignmentNotificationEngine"];

  long long v71 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsCoreSpotlightIndexing]];
  [v89 setObject:v71 forKeyedSubscript:@"supportsCoreSpotlightIndexing"];

  long long v72 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsSyncingToCloudKit]];
  [v89 setObject:v72 forKeyedSubscript:@"supportsSyncingToCloudKit"];

  long long v73 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsApplicationShortcuts]];
  [v89 setObject:v73 forKeyedSubscript:@"supportsApplicationShortcuts"];

  long long v74 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsLocalInternalAccount]];
  [v89 setObject:v74 forKeyedSubscript:@"supportsLocalInternalAccount"];

  long long v75 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsSuggestedAttributes]];
  [v89 setObject:v75 forKeyedSubscript:@"supportsSuggestedAttributes"];

  long long v76 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsSyncActivityNotificationEngine]];
  [v89 setObject:v76 forKeyedSubscript:@"supportsSyncActivityNotificationEngine"];

  long long v77 = +[NSString stringWithFormat:@"%d", [(RDStoreController *)self supportsSharedInlineTagAutoConvertEngine]];
  [v89 setObject:v77 forKeyedSubscript:@"supportsSharedInlineTagAutoConvertEngine"];

  os_unfair_lock_unlock(lock);

  return v89;
}

- (id)containerStats
{
  id v37 = +[NSMutableDictionary dictionary];
  os_unfair_lock_t lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v3 = [(RDStoreController *)self l_accountStoreMap];
  id v4 = [v3 keyEnumerator];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v43;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v10 = +[NSString stringWithFormat:@"accountStore.%@", v9];
        uint64_t v11 = [(RDStoreController *)self l_accountStoreMap];
        char v12 = [v11 objectForKey:v9];
        uint64_t v13 = [v12 identifier];

        uint64_t v14 = [(RDStoreController *)self l_accountStoreMap];
        uint64_t v15 = [v14 objectForKey:v9];
        long long v16 = [v15 URL];

        long long v17 = [v16 absoluteString];
        id v18 = +[NSString stringWithFormat:@"{storeID: %@, URL: %@}", v13, v17];
        [v37 setObject:v18 forKeyedSubscript:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v6);
  }

  uint64_t v19 = +[RDPaths defaultReminderDataContainerURL];
  uint64_t v20 = [v19 absoluteString];
  [v37 setObject:v20 forKeyedSubscript:@"defaultReminderDataContainerURL"];

  uint64_t v21 = [(RDStoreController *)self isolatedReminderDataContainerURL];
  uint64_t v22 = [v21 absoluteString];
  [v37 setObject:v22 forKeyedSubscript:@"isolatedReminderDataContainerURL"];

  id v23 = [(RDStoreController *)self l_primaryActiveCloudKitAccountREMObjectID];
  id v24 = v23;
  if (v23)
  {
    id v25 = [v23 description];
    [v37 setObject:v25 forKeyedSubscript:@"primaryActiveCKAccountID"];
  }
  else
  {
    [v37 setObject:@"Nil" forKeyedSubscript:@"primaryActiveCKAccountID"];
  }
  id v26 = +[NSString stringWithFormat:@"%ld", rem_currentRuntimeVersion()];
  [v37 setObject:v26 forKeyedSubscript:@"remCurrentRuntimeVersion"];

  BOOL v27 = +[NSMutableArray array];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000802E4;
  v38[3] = &unk_1008ADC60;
  v38[4] = self;
  id v39 = [(RDStoreController *)self newBackgroundContextWithAuthor:@"com.apple.RDStoreController.containerStats"];
  id v28 = v27;
  id v40 = v28;
  id v29 = v37;
  id v41 = v29;
  id v30 = v39;
  [v30 performBlockAndWait:v38];
  if ([v28 count])
  {
    id v31 = [v28 componentsJoinedByString:@"; "];
    [v29 setObject:v31 forKeyedSubscript:@"ERRORS"];
  }
  os_unfair_lock_unlock(lock);
  id v32 = v41;
  id v33 = v29;

  return v33;
}

- (void)unittest_setEnableCoreSpotlightIndexing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RDStoreController *)self coreSpotlightDelegateManager];
  [v4 setEnableCoreSpotlightIndexing:v3];
}

- (int64_t)unittest_countKeysInAccountStoreMap
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008090C;
  v6[3] = &unk_1008ADB18;
  v6[4] = self;
  v6[5] = &v7;
  sub_10008090C((uint64_t)v6);
  os_unfair_lock_unlock(p_ivarLock);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)unittest_setIsTestingDataSeparation:(BOOL)a3
{
}

- (void)unittest_removeFromPersistentStoreCoordinatorAndDeleteImmediatelyWithStores:(id)a3
{
  id v4 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100080A28;
  v7[3] = &unk_1008ADC88;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100080A28((uint64_t)v7);
  os_unfair_lock_unlock(p_ivarLock);
}

+ (void)unittest_setLoadAndValidateAccountStoresBatchSize:(unint64_t)a3
{
  qword_100906C90 = a3;
}

@end