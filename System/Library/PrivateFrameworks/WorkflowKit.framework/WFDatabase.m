@interface WFDatabase
+ (WFDatabase)defaultDatabase;
+ (id)appDescriptorFromData:(id)a3;
+ (id)createDatabaseForTesting;
+ (id)dataFromObject:(id)a3 error:(id *)a4;
+ (id)disabledAutoShortcutsFromData:(id)a3;
+ (id)identifierForAppDescriptor:(id)a3;
+ (void)setDefaultDatabase:(id)a3;
- (BOOL)_moveReferences:(id)a3 toIndexes:(id)a4 ofCollectionID:(id)a5 error:(id *)a6;
- (BOOL)createWorkflowWithIdentifier:(id)a3 record:(id)a4 error:(id *)a5;
- (BOOL)deleteAllBookmarksForWorkflowID:(id)a3 error:(id *)a4;
- (BOOL)deleteAutoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteReference:(id)a3 error:(id *)a4;
- (BOOL)deleteReference:(id)a3 tombstone:(BOOL)a4 deleteConflictIfPresent:(BOOL)a5 error:(id *)a6;
- (BOOL)destroysOnDeallocation;
- (BOOL)hasConflictWithName:(id)a3;
- (BOOL)hasConflictingReferenceForReference:(id)a3;
- (BOOL)hasValidLibrary;
- (BOOL)hasVisibleWorkflowsWithName:(id)a3;
- (BOOL)isAutoShortcutDisabledForAppDescriptor:(id)a3 autoShortcutIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutIdentifier:(id)a4;
- (BOOL)isAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPostingDistributedNotifications;
- (BOOL)isReference:(id)a3 allowedToRunOnDomain:(id)a4;
- (BOOL)isSiriEnabledForAutoShortcutsWithAppDescriptor:(id)a3 error:(id *)a4;
- (BOOL)isSiriEnabledForAutoShortcutsWithBundleIdentifier:(id)a3;
- (BOOL)isSiriEnabledForAutoShortcutsWithBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isSpotlightEnabledForAutoShortcutsWithAppDescriptor:(id)a3 error:(id *)a4;
- (BOOL)isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:(id)a3;
- (BOOL)isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)mergeAutoShortcutsPreferencesWithNewPreferences:(id)a3 error:(id *)a4;
- (BOOL)mergeAutomationsAndShortcuts;
- (BOOL)moveCollections:(id)a3 toIndexes:(id)a4 error:(id *)a5;
- (BOOL)moveCollections:(id)a3 toIndexes:(id)a4 ofCollectionWithIdentifier:(id)a5 error:(id *)a6;
- (BOOL)moveReferences:(id)a3 toIndex:(int64_t)a4 ofCollection:(id)a5 error:(id *)a6;
- (BOOL)moveReferences:(id)a3 toIndexes:(id)a4 ofCollection:(id)a5 error:(id *)a6;
- (BOOL)object:(id)a3 didUpdateProperties:(id)a4 error:(id *)a5;
- (BOOL)prependReferences:(id)a3 toCollection:(id)a4 error:(id *)a5;
- (BOOL)prependReferences:(id)a3 toCollectionWithType:(id)a4 error:(id *)a5;
- (BOOL)reloadRecord:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
- (BOOL)removeReferences:(id)a3 fromCollectionWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)replaceWithFileAtURL:(id)a3 error:(id *)a4;
- (BOOL)saveContextOrRollback:(id)a3 error:(id *)a4;
- (BOOL)saveRecord:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
- (BOOL)saveSmartPromptState:(id)a3 reference:(id)a4 error:(id *)a5;
- (BOOL)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 error:(id *)a6;
- (BOOL)setAutoShortcutDisabledForAppDescriptor:(id)a3 autoShortcutDisabled:(BOOL)a4 autoShortcutIdentifier:(id)a5 error:(id *)a6;
- (BOOL)setAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutDisabled:(BOOL)a4 autoShortcutIdentifier:(id)a5 source:(unint64_t)a6 error:(id *)a7;
- (BOOL)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setSiriAutoShortcutsEnablement:(BOOL)a3 forAppDescriptor:(id)a4 error:(id *)a5;
- (BOOL)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 source:(unint64_t)a5 error:(id *)a6;
- (BOOL)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forAppDescriptor:(id)a4 error:(id *)a5;
- (BOOL)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 source:(unint64_t)a5 error:(id *)a6;
- (BOOL)setWalrusStateForTesting:(int64_t)a3 withError:(id *)a4;
- (BOOL)shouldAddWorkflowToLibrary:(id)a3;
- (BOOL)shouldPromptForCurrentContentItemCount:(unint64_t)a3 previousCount:(unint64_t)a4;
- (BOOL)startObservingChangesForResult:(id)a3;
- (BOOL)updateAutoShortcutsPreferencesWithNewPreferences:(id)a3 error:(id *)a4;
- (BOOL)wipeAllLibrariesWithError:(id *)a3;
- (Class)recordClassForObjectType:(unint64_t)a3;
- (NSArray)activeObjectObservers;
- (NSArray)activeResults;
- (NSHashTable)observers;
- (NSHashTable)resultsToNotify;
- (NSManagedObjectContext)context;
- (NSManagedObjectContext)suggestionsContext;
- (NSPersistentStoreDescription)persistentStoreDescription;
- (NSString)debugDescription;
- (NSURL)exportableURL;
- (NSURL)fileURL;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)changeNotificationQueue;
- (OS_dispatch_queue)remoteChangeQueue;
- (WFCoreDataChangeNotification)pendingLocalChangeNotification;
- (WFCoreDataChangeNotification)pendingRemoteChangeNotification;
- (WFDatabase)initWithStoreDescription:(id)a3 runMigrationsIfNecessary:(BOOL)a4 useLockFile:(BOOL)a5 error:(id *)a6;
- (WFDebouncer)remoteChangeNotificationDebouncer;
- (id)_createWorkflowWithOptions:(id)a3 error:(id *)a4;
- (id)_rootCollection;
- (id)_syncTokenWithError:(id *)a3;
- (id)allCollections;
- (id)allConfiguredTriggers;
- (id)allConfiguredTriggersNeedingRunningNotifications;
- (id)allLatestLibraries;
- (id)allLatestLibrariesLimitedTo:(unint64_t)a3;
- (id)allShortcutBookmarks;
- (id)allShortcutSuggestions;
- (id)allShortcuts;
- (id)allStatesDataForReference:(id)a3 actionUUID:(id)a4;
- (id)applyConflictResolution:(id)a3;
- (id)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9;
- (id)associateWorkflowToTrigger:(id)a3 workflow:(id)a4 error:(id *)a5;
- (id)autoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4;
- (id)autoShortcutsPreferencesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)autoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4;
- (id)autoShortcutsPreferencesFromCoreDataAutoShortcutsPreferences:(id)a3;
- (id)badgeTypeForEntityIdentifier:(id)a3 error:(id *)a4;
- (id)bookmarkDataForWorkflowID:(id)a3 path:(id)a4 error:(id *)a5;
- (id)bookmarksForWorkflowID:(id)a3 error:(id *)a4;
- (id)changedWorkflowIDsForSync;
- (id)collectionForWorkflowType:(id)a3;
- (id)collectionRecordForCollectionIdentifier:(id)a3 createIfNecessary:(BOOL)a4;
- (id)collectionResultWithFetchRequest:(id)a3;
- (id)collectionResultWithLibraryQuery:(id)a3;
- (id)collectionWithIdentifier:(id)a3;
- (id)collectionWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4;
- (id)collectionsForWorkflowReference:(id)a3;
- (id)collectionsWithOutOfSyncWalrusStatus;
- (id)configuredTriggerForTriggerID:(id)a3;
- (id)configuredTriggersForWorkflowID:(id)a3;
- (id)conflictForWorkflowReference:(id)a3;
- (id)conflictingReferenceForReference:(id)a3;
- (id)coreDataAutoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4;
- (id)coreDataAutoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4;
- (id)coreDataLibraryWithIdentifier:(id)a3;
- (id)coreDataLibraryWithPredicate:(id)a3;
- (id)coreDataLibraryWithVersion:(id)a3;
- (id)createBookmarkWithWorkflowID:(id)a3 path:(id)a4 bookmarkData:(id)a5 error:(id *)a6;
- (id)createFolderWithName:(id)a3 icon:(unsigned __int16)a4 error:(id *)a5;
- (id)createLibraryFromCurrentDatabaseSnapshot;
- (id)createTriggerEventWithTriggerID:(id)a3 eventInfo:(id)a4 confirmed:(BOOL)a5 error:(id *)a6;
- (id)createTriggerWithRecord:(id)a3 error:(id *)a4;
- (id)createTriggerWithRecord:(id)a3 workflow:(id)a4 error:(id *)a5;
- (id)createWorkflowWithError:(id *)a3;
- (id)createWorkflowWithOptions:(id)a3 error:(id *)a4;
- (id)createWorkflowWithOptions:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5;
- (id)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8;
- (id)defaultCoreDataAutoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4;
- (id)deletedFolders;
- (id)deletedWorkflowIDsForSync;
- (id)deletionAuthorizationStatesForReference:(id)a3;
- (id)descriptorsForCoreDataResult:(id)a3 state:(id *)a4 error:(id *)a5;
- (id)descriptorsForFetchOperation:(id)a3 state:(id *)a4 error:(id *)a5;
- (id)duplicateNameErrorWithName:(id)a3;
- (id)duplicateReference:(id)a3 error:(id *)a4;
- (id)duplicateReference:(id)a3 newName:(id)a4 error:(id *)a5;
- (id)fetchBuiltInCollections;
- (id)fetchFirstAllowedStateMatching:(id)a3 actionUUID:(id)a4 forReference:(id)a5;
- (id)folderForWorkflowReference:(id)a3;
- (id)generateAndPersistUUIDForActionWithIdentifier:(id)a3 actionIndex:(unint64_t)a4 workflowIdentifier:(id)a5;
- (id)latestCoreDataLibrary;
- (id)latestLibrary;
- (id)latestRunEvent;
- (id)latestWorkflowSiriRunEvent;
- (id)libraryDotRepresentation;
- (id)libraryRecordForVersion:(id)a3;
- (id)localConflictingReferenceForReference:(id)a3;
- (id)logRunOfWorkflow:(id)a3 atDate:(id)a4 withIdentifier:(id)a5 source:(id)a6 triggerID:(id)a7;
- (id)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5;
- (id)migrateAccountStateToAppOriginIfNecessary:(id)a3 reference:(id)a4 actionUUID:(id)a5;
- (id)missingErrorForDescriptor:(id)a3;
- (id)mostRunOrLatestImportedVisibleShortcut;
- (id)objectForDescriptor:(id)a3 properties:(id)a4;
- (id)objectForDescriptor:(id)a3 properties:(id)a4 createIfNecessary:(BOOL)a5;
- (id)objectOfClass:(Class)a3 withIdentifier:(id)a4 forKey:(id)a5 createIfNecessary:(BOOL)a6 properties:(id)a7;
- (id)orphanedFolders;
- (id)orphanedFoldersPredicate;
- (id)orphanedShortcuts;
- (id)orphanedWorkflowsPredicate;
- (id)performDatabaseLookupForState:(id)a3 actionUUID:(id)a4 reference:(id)a5;
- (id)performOperationWithReason:(id)a3 block:(id)a4 error:(id *)a5;
- (id)performSaveOperationWithReason:(id)a3 block:(id)a4 error:(id *)a5;
- (id)performSuggestionsOperationWithBlock:(id)a3 error:(id *)a4;
- (id)recentlyModifiedShortcuts;
- (id)recentlyRunShortcuts;
- (id)recentlyRunShortcutsWithLimit:(int64_t)a3;
- (id)recordWithDescriptor:(id)a3 error:(id *)a4;
- (id)recordWithDescriptor:(id)a3 properties:(id)a4 error:(id *)a5;
- (id)referenceForWorkflowID:(id)a3;
- (id)referenceForWorkflowID:(id)a3 includingTombstones:(BOOL)a4;
- (id)remoteConflictingReferenceForReference:(id)a3;
- (id)renameReference:(id)a3 to:(id)a4 error:(id *)a5;
- (id)saveAutoShortcutsPreferencesForAppDescriptor:(id)a3 update:(id)a4 error:(id *)a5;
- (id)serializedParametersForIdentifier:(id)a3 error:(id *)a4;
- (id)shortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 shortcutAvailability:(unint64_t)a4 error:(id *)a5;
- (id)shortcutSuggestionsForAppWithBundleIdentifier:(id)a3 shortcutAvailability:(unint64_t)a4 error:(id *)a5;
- (id)shortcutsWithOutOfSyncWalrusStatus;
- (id)smartPromptStatesForReference:(id)a3;
- (id)smartPromptStatesForReference:(id)a3 actionUUID:(id)a4;
- (id)sortedRunEventsForTriggerID:(id)a3;
- (id)sortedRunEventsWithSource:(id)a3;
- (id)sortedRunEventsWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)sortedTriggerEventsWithConfirmationOnly:(BOOL)a3;
- (id)sortedVisibleAppAssociatedWorkflows;
- (id)sortedVisibleFolders;
- (id)sortedVisibleWorkflowsByLastRunOrModificationDateWithLimit:(int64_t)a3;
- (id)sortedVisibleWorkflowsByName;
- (id)sortedVisibleWorkflowsByNameWithLimit:(int64_t)a3;
- (id)sortedVisibleWorkflowsInCollection:(id)a3;
- (id)sortedVisibleWorkflowsNameContains:(id)a3 limit:(int64_t)a4;
- (id)sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:(id)a3;
- (id)sortedVisibleWorkflowsWithType:(id)a3;
- (id)sortedWorkflowsWithQuery:(id)a3;
- (id)suggestedFolderNameForName:(id)a3;
- (id)suggestedWorkflowNameForName:(id)a3;
- (id)syncToken;
- (id)tombstonedShortcutsPredicate;
- (id)triggerEventForIdentifier:(id)a3 error:(id *)a4;
- (id)triggerResultWithFetchRequest:(id)a3;
- (id)triggerRunEventsInTheLastWeek;
- (id)uniqueVisibleReferenceForWorkflowName:(id)a3;
- (id)updateFolder:(id)a3 newName:(id)a4 newIcon:(unsigned __int16)a5 error:(id *)a6;
- (id)validateFolderName:(id)a3 forCollection:(id)a4 error:(id *)a5;
- (id)validateWorkflowName:(id)a3 forCreation:(BOOL)a4 overwriting:(BOOL)a5 error:(id *)a6;
- (id)visibleCollectionForFolderName:(id)a3;
- (id)visiblePredicate;
- (id)visibleReferencesForWorkflowIDs:(id)a3 sortBy:(unint64_t)a4 nameContaining:(id)a5 nameEqualing:(id)a6 associatedAppBundleIdentifier:(id)a7 hasTombstonedConflicts:(BOOL)a8 isRecentlyModified:(BOOL)a9 isRecentlyRun:(BOOL)a10 limitTo:(unint64_t)a11;
- (id)visibleReferencesForWorkflowIDs:(id)a3 sortByKeys:(id)a4 nameContaining:(id)a5 nameEqualing:(id)a6 associatedAppBundleIdentifier:(id)a7 hasTombstonedConflicts:(BOOL)a8 isRecentlyModified:(BOOL)a9 isRecentlyRun:(BOOL)a10 limitTo:(unint64_t)a11;
- (id)visibleReferencesForWorkflowName:(id)a3;
- (id)workflowFetchRequestWithCollectionID:(id)a3 includeTombstones:(BOOL)a4 limit:(unint64_t)a5;
- (id)workflowRelationshipKeysAffectingDescriptors;
- (id)workflowResultWithFetchRequest:(id)a3;
- (id)workflowResultWithLibraryQuery:(id)a3;
- (id)workflowSiriRunEventWithIdentifier:(id)a3;
- (id)workflowsWithTombstonedConflicts;
- (int64_t)transactionCount;
- (os_unfair_lock_s)observersLock;
- (unint64_t)countForResult:(id)a3;
- (unint64_t)countOfAllVisibleWorkflows;
- (unint64_t)countOfWorkflowsInAFolder;
- (void)_deleteSmartPromptState:(id)a3 forReference:(id)a4;
- (void)_saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 forWorkflow:(id)a5;
- (void)_updateDeletionAuthorizationsToMatchAuthorization:(id)a3 forWorkflow:(id)a4;
- (void)_updateStatesToMatchSmartPromptState:(id)a3 forWorkflow:(id)a4;
- (void)accessStorageForDescriptor:(id)a3 forWriting:(BOOL)a4 readingRecordProperties:(id)a5 usingBlock:(id)a6 withError:(id *)a7;
- (void)addActionCountsToShortcutsIfNecessary;
- (void)addObjectObserver:(id)a3;
- (void)addPendingDeletedDescriptor:(id)a3;
- (void)addPendingInsertedDescriptor:(id)a3;
- (void)addPendingLocalChangeNotification:(id)a3;
- (void)addPendingUpdatedDescriptor:(id)a3;
- (void)addSyncHashesToShortcutsIfNecessary;
- (void)clearTombstonesAndSyncState;
- (void)compactDeletionAuthorizationsIfNecessaryForWorkflowReference:(id)a3;
- (void)contextDidSave:(id)a3;
- (void)createSmartPromptStatesForInsertedActions:(id)a3 forReference:(id)a4;
- (void)dealloc;
- (void)deleteAllDeletionAuthorizationsForReference:(id)a3;
- (void)deleteAllSmartPromptStateDataForReference:(id)a3;
- (void)deleteDonationsForShortcutWithIdentifier:(id)a3;
- (void)deleteShortcutSuggestionsFromApps:(id)a3;
- (void)deleteSmartPromptState:(id)a3 forReference:(id)a4;
- (void)deleteSmartPromptStatesForDeletedActionUUIDs:(id)a3 forReference:(id)a4;
- (void)invalidateAllObjectsAndNotify;
- (void)markTriggersAsRunAfterConfirmationIfNeeded;
- (void)notifyResultsAboutChange:(id)a3;
- (void)objectWasCreated:(id)a3 identifier:(id)a4;
- (void)performTransactionWithReason:(id)a3 block:(id)a4 error:(id *)a5;
- (void)reloadLibrary;
- (void)remoteChangeDebouncerDidFire;
- (void)remoteContextDidSave:(id)a3;
- (void)removeAllSerializedParametersForQueryName:(id)a3 error:(id *)a4;
- (void)removeObjectObserver:(id)a3;
- (void)removeRunEventsWithoutAssociatedShortcuts;
- (void)saveLibraryToDatabase:(id)a3;
- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 error:(id *)a4;
- (void)saveSmartPromptStatesForInsertedAction:(id)a3 contentDestination:(id)a4 reference:(id)a5;
- (void)setConfirmedForTriggerEventWithIdentifier:(id)a3 error:(id *)a4;
- (void)setConflictingReference:(id)a3 forReference:(id)a4;
- (void)setContext:(id)a3;
- (void)setDestroysOnDeallocation:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4;
- (void)setPendingLocalChangeNotification:(id)a3;
- (void)setPendingRemoteChangeNotification:(id)a3;
- (void)setPersistentStoreDescription:(id)a3;
- (void)setPostDistributedNotifications:(BOOL)a3;
- (void)setResultsToNotify:(id)a3;
- (void)setSuggestionsContext:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setTransactionCount:(int64_t)a3;
- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5;
- (void)storeSerializedParameters:(id)a3 forIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 error:(id *)a7;
- (void)trackMetricsForToggleType:(unint64_t)a3 source:(unint64_t)a4 bundleIdentifier:(id)a5 isEnabled:(BOOL)a6;
- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8;
- (void)updateWalrusStatus;
@end

@implementation WFDatabase

void __55__WFDatabase_descriptorsForFetchOperation_state_error___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [*(id *)(a1 + 32) relationshipKeysAffectingDescriptors];
  int v4 = [v3 containsObject:v9];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v6 = *(void **)(a1 + 40);
    v7 = [*(id *)(a1 + 48) objectIDsForRelationshipNamed:v9];
    v8 = [v5 setWithArray:v7];
    [v6 unionSet:v8];
  }
}

- (id)sortedVisibleAppAssociatedWorkflows
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = +[WFCoreDataWorkflow descriptorFetchRequest];
  int v4 = (void *)MEMORY[0x1E4F28BA0];
  v5 = [(WFDatabase *)self visiblePredicate];
  v14[0] = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"associatedAppBundleIdentifier");
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = [v4 andPredicateWithSubpredicates:v7];
  [v3 setPredicate:v8];

  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v13 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v3 setSortDescriptors:v10];

  v11 = [(WFDatabase *)self workflowResultWithFetchRequest:v3];

  return v11;
}

void __45__WFDatabase_startObservingChangesForResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resultsToNotify];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)resultsToNotify
{
  return self->_resultsToNotify;
}

void __51__WFDatabase_addActionCountsToShortcutsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  int v4 = +[WFCoreDataWorkflow fetchRequest];
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0", @"actionCount");
  [v4 setPredicate:v5];

  v25[0] = @"actionCount";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v4 setPropertiesToFetch:v6];

  v24 = @"actions";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v4 setRelationshipKeyPathsForPrefetching:v7];

  v8 = [*(id *)(a1 + 32) context];
  id v9 = [v8 executeFetchRequest:v4 error:a2];

  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1C87CA430]();
          if (![v15 actionCount])
          {
            v17 = [v15 deserializedActions];
            uint64_t v18 = [v17 count];

            if (v18 >= 1) {
              [v15 setActionCount:v18];
            }
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __53__WFDatabase_performOperationWithReason_block_error___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C87CA430]();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (*(void (**)(void))(v3 + 16))();
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ([*(id *)(a1 + 32) transactionCount] <= 0)
  {
    v8 = [*(id *)(a1 + 32) context];
    [v8 reset];
  }
}

id __57__WFDatabase_performSaveOperationWithReason_block_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") + 1);
  uint64_t v4 = *(void *)(a1 + 40);
  v11[1] = 0;
  uint64_t v5 = (*(void (**)(void))(v4 + 16))();
  id v6 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") - 1);
  if ([*(id *)(a1 + 32) transactionCount] <= 0)
  {
    if (v6
      || ([*(id *)(a1 + 32) context],
          v7 = objc_claimAutoreleasedReturnValue(),
          v11[0] = 0,
          [v7 save:v11],
          id v6 = v11[0],
          v7,
          v6))
    {
      v8 = [*(id *)(a1 + 32) context];
      [v8 rollback];
    }
    id v9 = [*(id *)(a1 + 32) context];
    [v9 reset];
  }
  if (a2 && v6) {
    *a2 = v6;
  }

  return v5;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

uint64_t __55__WFDatabase_performTransactionWithReason_block_error___block_invoke(uint64_t a1)
{
  return 0;
}

id __55__WFDatabase_descriptorsForCoreDataResult_state_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) fetchOperation];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  v7 = [v4 descriptorsForFetchOperation:v5 state:&obj error:a2];
  objc_storeStrong((id *)(v6 + 40), obj);

  return v7;
}

- (id)descriptorsForFetchOperation:(id)a3 state:(id *)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = getWFDatabaseLogObject();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = getWFDatabaseLogObject();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v8;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "GetDescriptors", "operation=%{signpost.description:attribute}@", buf, 0xCu);
  }

  uint64_t v13 = [(WFDatabase *)self context];
  uint64_t v14 = [v8 resultsWithContext:v13 error:a5];

  v15 = getWFDatabaseLogObject();
  v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v16, OS_SIGNPOST_INTERVAL_END, v10, "GetDescriptors", "", buf, 2u);
  }

  if (v14)
  {
    v37 = self;
    v39 = a4;
    v17 = [v8 entity];
    v41 = [v17 relationshipsByName];

    id v42 = (id)objc_opt_new();
    uint64_t v18 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v38 = v14;
    id obj = v14;
    uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v48 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v24 = (void *)MEMORY[0x1C87CA430]();
          v25 = [v23 descriptor];
          uint64_t v26 = objc_opt_class();
          v27 = WFEnforceClass(v25, v26);

          if (v27)
          {
            v28 = [v23 objectID];
            [v18 addObject:v28];

            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __55__WFDatabase_descriptorsForFetchOperation_state_error___block_invoke;
            v43[3] = &unk_1E6553640;
            id v44 = v8;
            id v45 = v18;
            v46 = v23;
            [v41 enumerateKeysAndObjectsUsingBlock:v43];
            [v42 addObject:v27];
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v20);
    }

    v29 = [v8 entity];
    v30 = [v29 name];
    uint64_t v31 = WFDatabaseObjectTypeForEntityName(v30);

    v32 = [(WFDatabase *)v37 context];
    v33 = WFDescriptorsForObjectIDs(v18, v32);

    id v34 = objc_alloc(MEMORY[0x1E4FB46A0]);
    v35 = v33;
    if (!v33) {
      v35 = objc_opt_new();
    }
    id *v39 = (id)[v34 initWithObjectType:v31 state:v35];
    if (!v33) {

    }
    uint64_t v14 = v38;
  }
  else
  {
    id v42 = 0;
  }

  return v42;
}

- (id)performOperationWithReason:(id)a3 block:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  os_signpost_id_t v10 = (void *)os_transaction_create();
  uint64_t v11 = getWFDatabaseLogObject();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = getWFDatabaseLogObject();
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v15 = @"none";
    if (v8) {
      v15 = v8;
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CoreDataOperation", "reason=%{signpost.description:attribute}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__42419;
  v36 = __Block_byref_object_dispose__42420;
  id v37 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__42419;
  uint64_t v31 = __Block_byref_object_dispose__42420;
  id v32 = 0;
  v16 = [(WFDatabase *)self context];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__WFDatabase_performOperationWithReason_block_error___block_invoke;
  v23[3] = &unk_1E65534E0;
  p_long long buf = &buf;
  id v17 = v9;
  uint64_t v26 = &v27;
  v23[4] = self;
  id v24 = v17;
  [v16 performBlockAndWait:v23];

  if (a5) {
    *a5 = (id) v28[5];
  }
  uint64_t v18 = getWFDatabaseLogObject();
  uint64_t v19 = v18;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)long long v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v19, OS_SIGNPOST_INTERVAL_END, v12, "CoreDataOperation", "", v22, 2u);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
  return v20;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

id __29__WFDatabase_countForResult___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = NSNumber;
  uint64_t v5 = [*(id *)(a1 + 32) fetchOperation];
  uint64_t v6 = [*(id *)(a1 + 40) context];
  v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "countWithContext:error:", v6, a2));

  return v7;
}

uint64_t __82__WFDatabase_initWithStoreDescription_runMigrationsIfNecessary_useLockFile_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadLibrary];
  [*(id *)(a1 + 32) addActionCountsToShortcutsIfNecessary];
  [*(id *)(a1 + 32) addSyncHashesToShortcutsIfNecessary];
  [*(id *)(a1 + 32) removeRunEventsWithoutAssociatedShortcuts];
  [*(id *)(a1 + 32) markTriggersAsRunAfterConfirmationIfNeeded];
  id v2 = *(void **)(a1 + 32);
  return [v2 updateWalrusStatus];
}

void __55__WFDatabase_removeRunEventsWithoutAssociatedShortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = +[WFCoreDataRunEvent fetchRequest];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = nil", @"shortcut");
  [v8 setPredicate:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
  uint64_t v6 = [*(id *)(a1 + 32) context];
  v7 = [v6 executeRequest:v5 error:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 != 0;
}

void __49__WFDatabase_addSyncHashesToShortcutsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[WFCoreDataWorkflow fetchRequest];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = nil", @"syncHash");
  [v4 setPredicate:v5];

  uint64_t v6 = [*(id *)(a1 + 32) context];
  v7 = [v6 executeFetchRequest:v4 error:a2];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1C87CA430]();
          objc_msgSend(v13, "setSyncHash:", objc_msgSend(v13, "computedSyncHash"));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)removeRunEventsWithoutAssociatedShortcuts
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v4 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__WFDatabase_removeRunEventsWithoutAssociatedShortcuts__block_invoke;
  v5[3] = &unk_1E65536B8;
  v5[4] = self;
  v5[5] = &v6;
  [(WFDatabase *)self performTransactionWithReason:@"remove extra run events" block:v5 error:&v4];
  id v2 = v4;
  if (!*((unsigned char *)v7 + 24))
  {
    uint64_t v3 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v11 = "-[WFDatabase removeRunEventsWithoutAssociatedShortcuts]";
      __int16 v12 = 2114;
      id v13 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Unable to remove invalid run events: %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v6, 8);
}

- (void)reloadLibrary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __27__WFDatabase_reloadLibrary__block_invoke;
    v4[3] = &unk_1E6553488;
    v4[4] = self;
    [(WFDatabase *)self performTransactionWithReason:@"reload library" block:v4 error:0];
  }
  else
  {
    uint64_t v3 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v6 = "-[WFDatabase reloadLibrary]";
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Not reloading the library because the feature flag is disabled", buf, 0xCu);
    }
  }
}

- (void)markTriggersAsRunAfterConfirmationIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v4 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__WFDatabase_markTriggersAsRunAfterConfirmationIfNeeded__block_invoke;
  v5[3] = &unk_1E65536B8;
  v5[4] = self;
  v5[5] = &v6;
  [(WFDatabase *)self performTransactionWithReason:@"migrate invalid location triggers" block:v5 error:&v4];
  id v2 = v4;
  if (!*((unsigned char *)v7 + 24))
  {
    uint64_t v3 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v11 = "-[WFDatabase markTriggersAsRunAfterConfirmationIfNeeded]";
      __int16 v12 = 2114;
      id v13 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Unable to add editable shortcut flag: %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v6, 8);
}

- (void)addSyncHashesToShortcutsIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v4 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__WFDatabase_addSyncHashesToShortcutsIfNecessary__block_invoke;
  v5[3] = &unk_1E65536B8;
  v5[4] = self;
  v5[5] = &v6;
  [(WFDatabase *)self performTransactionWithReason:@"add sync hashes" block:v5 error:&v4];
  id v2 = v4;
  if (!*((unsigned char *)v7 + 24))
  {
    uint64_t v3 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v11 = "-[WFDatabase addSyncHashesToShortcutsIfNecessary]";
      __int16 v12 = 2114;
      id v13 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Unable to add action counts: %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v6, 8);
}

- (id)allConfiguredTriggers
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WFCoreDataTrigger fetchRequest];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [v3 setPredicate:v4];

  uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setSortDescriptors:v6];

  uint64_t v7 = [(WFDatabase *)self triggerResultWithFetchRequest:v3];

  return v7;
}

void __56__WFDatabase_markTriggersAsRunAfterConfirmationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = +[WFCoreDataTrigger fetchRequest];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NO", @"shouldPrompt");
  [v4 setPredicate:v5];

  uint64_t v6 = [*(id *)(a1 + 32) context];
  uint64_t v7 = [v6 executeFetchRequest:v4 error:a2];

  if (v7)
  {
    long long v17 = v4;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1C87CA430]();
          long long v15 = [v13 data];
          long long v16 = +[WFTrigger triggerWithSerializedData:v15];

          if (([(id)objc_opt_class() isAllowedToRunAutomatically] & 1) == 0) {
            [v13 setShouldPrompt:1];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v4 = v17;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (id)triggerResultWithFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WFCoreDataDatabaseResult alloc];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"shortcut"];
  uint64_t v7 = [(WFCoreDataDatabaseResult *)v5 initWithDatabase:self fetchRequest:v4 relationshipKeysAffectingDescriptors:v6];

  return v7;
}

- (id)_syncTokenWithError:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[WFCoreDataCloudKitSyncToken fetchRequest];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [v5 setPredicate:v6];

  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v5 setSortDescriptors:v8];

  [v5 setFetchLimit:1];
  uint64_t v9 = [(WFDatabase *)self context];
  uint64_t v10 = [v9 executeFetchRequest:v5 error:a3];

  uint64_t v11 = [v10 firstObject];

  return v11;
}

void __47__WFDatabase_Sync__clearTombstonesAndSyncState__block_invoke(uint64_t a1, void *a2)
{
  v91[1] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C87CA430]();
  uint64_t v3 = +[WFCoreDataWorkflow fetchRequest];
  id v4 = [*(id *)(a1 + 32) tombstonedShortcutsPredicate];
  [v3 setPredicate:v4];

  [v3 setIncludesPropertyValues:0];
  v91[0] = @"actions";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
  [v3 setRelationshipKeyPathsForPrefetching:v5];

  [v3 setFetchLimit:50];
  uint64_t v6 = *(void **)(a1 + 40);
  id v81 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v3 error:&v81];
  id v8 = v81;
  if ([v7 count])
  {
    do
    {
      uint64_t v9 = (void *)MEMORY[0x1C87CA430]();
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v77 objects:v90 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v78 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v77 + 1) + 8 * i);
            long long v16 = (void *)MEMORY[0x1C87CA430]();
            [*(id *)(a1 + 40) deleteObject:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v77 objects:v90 count:16];
        }
        while (v12);
      }

      objc_msgSend(v3, "setFetchOffset:", objc_msgSend(v3, "fetchOffset") + objc_msgSend(v3, "fetchLimit"));
      long long v17 = *(void **)(a1 + 40);
      id v76 = v8;
      uint64_t v7 = [v17 executeFetchRequest:v3 error:&v76];
      id v18 = v76;

      id v8 = v18;
    }
    while ([v7 count]);
  }
  else
  {
    id v18 = v8;
  }

  long long v19 = (void *)MEMORY[0x1C87CA430]();
  long long v20 = +[WFCoreDataCollection fetchRequest];
  long long v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"tombstoned");
  [v20 setPredicate:v21];

  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v20];
  uint64_t v23 = *(void **)(a1 + 40);
  id v75 = v18;
  id v24 = [v23 executeRequest:v22 error:&v75];
  id v25 = v75;

  uint64_t v26 = [v24 result];
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }
  id v28 = v27;

  char v29 = [v28 BOOLValue];
  if ((v29 & 1) == 0)
  {
    v30 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v87 = "-[WFDatabase(Sync) clearTombstonesAndSyncState]_block_invoke";
      __int16 v88 = 2114;
      id v89 = v25;
      _os_log_impl(&dword_1C7F0A000, v30, OS_LOG_TYPE_ERROR, "%s Failed to perform batch deletion of tombstoned folders: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v31 = (void *)MEMORY[0x1C87CA430]();
  id v32 = objc_alloc(MEMORY[0x1E4F1C038]);
  v33 = +[WFCoreDataWorkflow entity];
  uint64_t v34 = (void *)[v32 initWithEntity:v33];

  v35 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [v34 setPredicate:v35];

  v84[0] = @"cloudKitRecordMetadata";
  v36 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v84[1] = @"lastSyncedHash";
  v85[0] = v36;
  v85[1] = &unk_1F2316950;
  id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
  [v34 setPropertiesToUpdate:v37];

  uint64_t v38 = *(void **)(a1 + 40);
  id v74 = v25;
  v39 = [v38 executeRequest:v34 error:&v74];
  id v40 = v74;

  v41 = [v39 result];
  if (v41)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v42 = v41;
    }
    else {
      id v42 = 0;
    }
  }
  else
  {
    id v42 = 0;
  }
  id v43 = v42;

  char v44 = [v43 BOOLValue];
  if ((v44 & 1) == 0)
  {
    id v45 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v87 = "-[WFDatabase(Sync) clearTombstonesAndSyncState]_block_invoke";
      __int16 v88 = 2114;
      id v89 = v40;
      _os_log_impl(&dword_1C7F0A000, v45, OS_LOG_TYPE_ERROR, "%s Failed to perform batch reset of sync state on all workflows: %{public}@", buf, 0x16u);
    }
  }
  contexta = (void *)MEMORY[0x1C87CA430]();
  id v46 = objc_alloc(MEMORY[0x1E4F1C038]);
  long long v47 = +[WFCoreDataCollection entity];
  long long v48 = (void *)[v46 initWithEntity:v47];

  long long v49 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [v48 setPredicate:v49];

  v82[0] = @"cloudKitFolderRecordMetadata";
  long long v50 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v83[0] = v50;
  v82[1] = @"cloudKitOrderingRecordMetadata";
  v51 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v83[1] = v51;
  v82[2] = @"lastRemoteCollectionOrderingData";
  v52 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v83[2] = v52;
  v82[3] = @"lastRemoteCollectionOrderingSubsetData";
  id v53 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v83[3] = v53;
  v82[4] = @"lastRemoteShortcutOrderingData";
  uint64_t v54 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v83[4] = v54;
  v82[5] = @"lastRemoteShortcutOrderingSubsetData";
  v55 = [MEMORY[0x1E4F28C68] expressionForConstantValue:0];
  v82[6] = @"lastSyncedHash";
  v83[5] = v55;
  v83[6] = &unk_1F2316950;
  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:7];
  [v48 setPropertiesToUpdate:v56];

  v57 = *(void **)(a1 + 40);
  id v73 = v40;
  v58 = [v57 executeRequest:v48 error:&v73];
  id v59 = v73;

  v60 = [v58 result];
  if (v60)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v61 = v60;
    }
    else {
      v61 = 0;
    }
  }
  else
  {
    v61 = 0;
  }
  id v62 = v61;

  char v63 = [v62 BOOLValue];
  if ((v63 & 1) == 0)
  {
    v64 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v87 = "-[WFDatabase(Sync) clearTombstonesAndSyncState]_block_invoke";
      __int16 v88 = 2114;
      id v89 = v59;
      _os_log_impl(&dword_1C7F0A000, v64, OS_LOG_TYPE_ERROR, "%s Failed to perform batch reset of sync state on all collections: %{public}@", buf, 0x16u);
    }
  }
  v65 = *(void **)(a1 + 32);
  id v72 = v59;
  v66 = [v65 _syncTokenWithError:&v72];
  id v67 = v72;

  if (v66) {
    [*(id *)(a1 + 40) deleteObject:v66];
  }
  id v68 = v67;
  *a2 = v68;
}

- (id)sortedVisibleWorkflowsInCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 identifier];
    int v7 = [v6 isEqualToString:@"Root"];

    if (!v7)
    {
      uint64_t v11 = [v5 identifier];
      uint64_t v12 = WFWorkflowTypeForCollectionIdentifier(v11);

      id v13 = objc_alloc(MEMORY[0x1E4FB4A70]);
      uint64_t v14 = v13;
      if (v12)
      {
        id v10 = (void *)[v13 initWithWorkflowType:v12];
      }
      else
      {
        uint64_t v15 = [v5 identifier];
        id v10 = (void *)[v14 initWithFolderIdentifier:v15];
      }
      goto LABEL_10;
    }
    id v8 = objc_alloc(MEMORY[0x1E4FB4A70]);
    uint64_t v9 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB4A70]);
    uint64_t v9 = 1;
  }
  id v10 = (void *)[v8 initWithLocation:v9];
LABEL_10:
  long long v16 = [(WFDatabase *)self sortedWorkflowsWithQuery:v10];

  return v16;
}

- (id)sortedVisibleFolders
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v3 = +[WFLibraryQuery sortedVisibleFolders];
    uint64_t v4 = [(WFDatabase *)self collectionResultWithLibraryQuery:v3];
  }
  else
  {
    uint64_t v3 = +[WFCoreDataCollection descriptorFetchRequest];
    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY parents.identifier == %@ AND %K == NO", @"Root", @"tombstoned"];
    [v3 setPredicate:v5];

    uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"parents" ascending:1];
    v10[0] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setSortDescriptors:v7];

    uint64_t v4 = [(WFDatabase *)self collectionResultWithFetchRequest:v3];
  }
  id v8 = (void *)v4;

  return v8;
}

- (id)sortedWorkflowsWithQuery:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    switch([v4 location])
    {
      case 0:
        uint64_t v5 = objc_opt_new();
        id v8 = -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", @"Root", [v4 includeTombstonesAndConflicts], objc_msgSend(v4, "resultsLimit"));
        [v5 addObject:v8];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v9 = [(WFDatabase *)self sortedVisibleFolders];
        id v10 = [v9 descriptors];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = [*(id *)(*((void *)&v25 + 1) + 8 * i) identifier];
              long long v16 = -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", v15, [v4 includeTombstonesAndConflicts], objc_msgSend(v4, "resultsLimit"));
              [v5 addObject:v16];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v12);
        }

        long long v17 = [WFCoreDataDatabaseResult alloc];
        id v18 = [WFCoreDataDatabaseResultConcatFetchRequestOperation alloc];
        uint64_t v19 = [v4 resultsLimit];
        long long v20 = [(WFDatabase *)self workflowRelationshipKeysAffectingDescriptors];
        long long v21 = [(WFCoreDataDatabaseResultConcatFetchRequestOperation *)v18 initWithFetchRequests:v5 resultsLimit:v19 relationshipKeysAffectingDescriptors:v20];
        int v7 = [(WFCoreDataDatabaseResult *)v17 initWithDatabase:self fetchOperation:v21];

        goto LABEL_18;
      case 1:
        uint64_t v5 = -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", @"Root", [v4 includeTombstonesAndConflicts], objc_msgSend(v4, "resultsLimit"));
        uint64_t v6 = [(WFDatabase *)self workflowResultWithFetchRequest:v5];
        goto LABEL_3;
      case 2:
        uint64_t v5 = [v4 workflowType];
        long long v22 = WFWorkflowCollectionIdentifierForWorkflowType(v5);
        uint64_t v23 = -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", v22, [v4 includeTombstonesAndConflicts], objc_msgSend(v4, "resultsLimit"));
        int v7 = [(WFDatabase *)self workflowResultWithFetchRequest:v23];

        goto LABEL_17;
      case 3:
        uint64_t v5 = [v4 folderIdentifier];
        long long v22 = -[WFDatabase workflowFetchRequestWithCollectionID:includeTombstones:limit:](self, "workflowFetchRequestWithCollectionID:includeTombstones:limit:", v5, [v4 includeTombstonesAndConflicts], objc_msgSend(v4, "resultsLimit"));
        int v7 = [(WFDatabase *)self workflowResultWithFetchRequest:v22];
LABEL_17:

        goto LABEL_18;
      default:
        int v7 = 0;
        goto LABEL_19;
    }
  }
  uint64_t v5 = +[WFLibraryQuery sortedWorkflowsWithQuery:v4];
  uint64_t v6 = [(WFDatabase *)self workflowResultWithLibraryQuery:v5];
LABEL_3:
  int v7 = (WFCoreDataDatabaseResult *)v6;
LABEL_18:

LABEL_19:
  return v7;
}

- (id)collectionResultWithFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WFCoreDataDatabaseResult alloc];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"icon", @"parents", 0);
  int v7 = [(WFCoreDataDatabaseResult *)v5 initWithDatabase:self fetchRequest:v4 relationshipKeysAffectingDescriptors:v6];

  return v7;
}

- (id)workflowResultWithFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WFCoreDataDatabaseResult alloc];
  uint64_t v6 = [WFCoreDataDatabaseResultFetchRequestOperation alloc];
  int v7 = [(WFDatabase *)self workflowRelationshipKeysAffectingDescriptors];
  id v8 = [(WFCoreDataDatabaseResultFetchRequestOperation *)v6 initWithFetchRequest:v4 relationshipKeysAffectingDescriptors:v7];

  uint64_t v9 = [(WFCoreDataDatabaseResult *)v5 initWithDatabase:self fetchOperation:v8];
  return v9;
}

- (BOOL)startObservingChangesForResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFDatabase *)self context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__WFDatabase_startObservingChangesForResult___block_invoke;
  v8[3] = &unk_1E6558938;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 performBlock:v8];

  return 1;
}

- (id)workflowRelationshipKeysAffectingDescriptors
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"icon", @"parents", 0);
}

id __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke(uint64_t a1, uint64_t a2)
{
  v58[2] = *MEMORY[0x1E4F143B8];
  v51 = +[WFCoreDataWorkflow fetchRequest];
  uint64_t v3 = [*(id *)(a1 + 32) visiblePredicate];
  long long v49 = WFWorkflowCollectionIdentifierForWorkflowType((void *)*MEMORY[0x1E4FB4FB8]);
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $p, $p.identifier == %@).@count == 0", @"parents", v49];
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  long long v50 = (void *)v3;
  v58[0] = v3;
  v58[1] = v4;
  long long v48 = (void *)v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v45 = [MEMORY[0x1E4F1C9C8] date];
  id v46 = v8;
  char v44 = objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, -7);
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $r, $r.date >= %@).@count > 0", @"runEvents", v44];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count > 0", @"runEvents");
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", @"source", @"ShortcutSourceOnDevice"];
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", @"source", @"ShortcutSourceDefaultShortcut"];
  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  v41 = (void *)v11;
  v57[0] = v11;
  v57[1] = v12;
  v39 = (void *)v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

  long long v16 = (void *)v15;
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"source", @"ShortcutSourceDefaultShortcut"];
  id v18 = (void *)MEMORY[0x1E4F28BA0];
  long long v47 = (void *)v7;
  v55[3] = v17;
  v56[0] = v7;
  id v43 = (void *)v9;
  v55[0] = v9;
  v55[1] = v10;
  uint64_t v19 = (void *)v10;
  v55[2] = v16;
  uint64_t v38 = (void *)v17;
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
  long long v21 = [v18 orPredicateWithSubpredicates:v20];
  v56[1] = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  uint64_t v23 = [v18 andPredicateWithSubpredicates:v22];
  id v24 = v51;
  [v51 setPredicate:v23];

  long long v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"runEventsCount" ascending:0];
  long long v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastRunEventDate" ascending:0];
  long long v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v54[0] = v25;
  v54[1] = v26;
  v54[2] = v27;
  long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  [v51 setSortDescriptors:v28];

  [v51 setFetchLimit:10];
  char v29 = [*(id *)(a1 + 32) context];
  uint64_t v30 = [v29 executeFetchRequest:v51 error:a2];

  uint64_t v31 = [v30 firstObject];
  if ([v31 runEventsCount] < 1)
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke_2;
    v52[3] = &unk_1E654D8F0;
    id v53 = @"ShortcutSourceDefaultShortcut";
    [v30 sortedArrayUsingComparator:v52];
    v33 = v16;
    v35 = uint64_t v34 = v19;

    v36 = [v35 firstObject];

    id v32 = [v36 descriptor];

    uint64_t v30 = v35;
    uint64_t v19 = v34;
    long long v16 = v33;
    id v24 = v51;
    uint64_t v31 = v36;
  }
  else
  {
    id v32 = [v31 descriptor];
  }

  return v32;
}

- (id)workflowFetchRequestWithCollectionID:(id)a3 includeTombstones:(BOOL)a4 limit:(unint64_t)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = +[WFCoreDataWorkflow descriptorFetchRequest];
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY parents.identifier == %@", v8];

  if (!a4)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
    v19[0] = v10;
    uint64_t v12 = [(WFDatabase *)self visiblePredicate];
    v19[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v14 = [v11 andPredicateWithSubpredicates:v13];

    uint64_t v10 = (void *)v14;
  }
  [v9 setPredicate:v10];
  uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"parents" ascending:1];
  id v18 = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v9 setSortDescriptors:v16];

  if (a5) {
    [v9 setFetchLimit:a5];
  }

  return v9;
}

- (id)visiblePredicate
{
  id v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v4 = [(WFDatabase *)self tombstonedShortcutsPredicate];
  uint64_t v5 = [v3 notPredicateWithSubpredicate:v4];

  if (![(WFDatabase *)self mergeAutomationsAndShortcuts])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NO OR %K == nil", @"hiddenFromLibraryAndSync", @"hiddenFromLibraryAndSync");
    uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
    v11[0] = v5;
    v11[1] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];

    uint64_t v5 = (void *)v9;
  }
  return v5;
}

- (id)tombstonedShortcutsPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES OR (%K != nil AND %K == NO)", @"tombstoned", @"conflictOf", @"conflictOf.tombstoned");
}

- (BOOL)mergeAutomationsAndShortcuts
{
  id v2 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFAutomationsMergeEnabled"];

  return v3;
}

- (WFDatabase)initWithStoreDescription:(id)a3 runMigrationsIfNecessary:(BOOL)a4 useLockFile:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  v96[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!v12)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v78 = long long v77 = a6;
    [v78 handleFailureInMethod:a2, self, @"WFDatabase.m", 299, @"Invalid parameter not satisfying: %@", @"storeDescription" object file lineNumber description];

    a6 = v77;
  }
  uint64_t v13 = (void *)os_transaction_create();
  uint64_t v14 = (void *)MEMORY[0x1C87CA430]();
  id v91 = 0;
  id v15 = v12;
  if (v8
    && !+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:v15 useLockFile:v7 error:&v91])
  {
    id v34 = 0;
  }
  else
  {
    v83 = v14;
    id v81 = a6;
    long long v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v17 = (void *)MEMORY[0x1E4F1C120];
    v96[0] = v16;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:1];
    v84 = [v17 mergedModelFromBundles:v18];

    uint64_t v19 = (void *)MEMORY[0x1E4F1C188];
    uint64_t v20 = *MEMORY[0x1E4F1BF70];
    long long v21 = [v15 URL];
    long long v22 = [v19 metadataForPersistentStoreOfType:v20 URL:v21 options:0 error:0];

    v82 = v22;
    uint64_t v23 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F1BF80]];
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v24 = v23;
      }
      else {
        id v24 = 0;
      }
    }
    else
    {
      id v24 = 0;
    }
    id v25 = v24;

    long long v26 = [v25 firstObject];

    if (v26)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v27 = v26;
      }
      else {
        long long v27 = 0;
      }
    }
    else
    {
      long long v27 = 0;
    }
    long long v28 = v84;
    id v86 = v27;

    char v29 = [v84 versionIdentifiers];
    uint64_t v30 = [v29 anyObject];

    if (v30)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = 0;
      }
    }
    else
    {
      uint64_t v31 = 0;
    }
    id v32 = v31;

    if (v86 && v32 && [v86 compare:v32 options:64] == 1)
    {
      v33 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        *(void *)&uint8_t buf[4] = "WFPersistentStoreCoordinator";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v86;
        __int16 v94 = 2112;
        id v95 = v32;
        _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_ERROR, "%s Model version from persistent store metadata is '%@' and is greater than the current model version '%@'. This likely indicates a schema downgrade, which is not supported", buf, 0x20u);
      }

      [MEMORY[0x1E4F28C58] errorWithDomain:@"WFDatabaseErrorDomain" code:1 userInfo:0];
      id v34 = 0;
      id v91 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v79 = v16;
      id v80 = v9;
      v35 = v13;
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v84];
      uint64_t v37 = *MEMORY[0x1E4F1BDE8];
      v92[0] = *MEMORY[0x1E4F1BE50];
      v92[1] = v37;
      *(void *)long long buf = MEMORY[0x1E4F1CC38];
      *(void *)&buf[8] = MEMORY[0x1E4F1CC38];
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v92 count:2];
      v39 = [v15 type];
      id v40 = [v15 configuration];
      id v41 = v15;
      id v42 = [v15 URL];
      id v43 = [v36 addPersistentStoreWithType:v39 configuration:v40 URL:v42 options:v38 error:&v91];

      if (v43) {
        id v34 = v36;
      }
      else {
        id v34 = 0;
      }
      uint64_t v13 = v35;

      id v15 = v41;
      id v9 = v80;
      a6 = v81;
      long long v16 = v79;
      long long v28 = v84;
    }

    uint64_t v14 = v83;
  }

  id v44 = v91;
  if (a6) {
    *a6 = v44;
  }
  if (v34)
  {
    id v45 = [[WFManagedObjectContext alloc] initWithConcurrencyType:1];
    [(WFManagedObjectContext *)v45 setDatabase:self];
    [(WFManagedObjectContext *)v45 setMergePolicy:*MEMORY[0x1E4F1BE40]];
    [(WFManagedObjectContext *)v45 setPersistentStoreCoordinator:v34];
    [(WFManagedObjectContext *)v45 setStalenessInterval:0.0];
    [(WFManagedObjectContext *)v45 setUndoManager:0];
    [(WFManagedObjectContext *)v45 setName:@"WFDatabase"];
    id v46 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
    [v46 setPersistentStoreCoordinator:v34];
    [v46 setMergePolicy:*MEMORY[0x1E4F1BE58]];
    v90.receiver = self;
    v90.super_class = (Class)WFDatabase;
    long long v47 = [(WFDatabase *)&v90 init];
    self = v47;
    if (v47)
    {
      objc_storeStrong((id *)&v47->_context, v45);
      objc_storeStrong((id *)&self->_suggestionsContext, v46);
      objc_storeStrong((id *)&self->_persistentStoreDescription, v9);
      v85 = v46;
      long long v48 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      resultsToNotify = self->_resultsToNotify;
      self->_resultsToNotify = v48;

      long long v50 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      observers = self->_observers;
      self->_observers = v50;

      self->_observersLock._os_unfair_lock_opaque = 0;
      v52 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v53 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFCoreDataDatabase-callback", v52);
      callbackQueue = self->_callbackQueue;
      self->_callbackQueue = v53;

      v55 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v56 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFCoreDataDatabase-change-notification", v55);
      changeNotificationQueue = self->_changeNotificationQueue;
      self->_changeNotificationQueue = v56;

      self->_postDistributedNotifications = 1;
      v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v58 addObserver:self selector:sel_contextDidSave_ name:*MEMORY[0x1E4F1BE28] object:v45];

      id v59 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v60 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFCoreDataDatabase-remote-change", v59);
      remoteChangeQueue = self->_remoteChangeQueue;
      self->_remoteChangeQueue = v60;

      id v62 = [[WFDebouncer alloc] initWithDelay:self->_remoteChangeQueue maximumDelay:2.0 queue:10.0];
      remoteChangeNotificationDebouncer = self->_remoteChangeNotificationDebouncer;
      self->_remoteChangeNotificationDebouncer = v62;

      [(WFDebouncer *)self->_remoteChangeNotificationDebouncer addTarget:self action:sel_remoteChangeDebouncerDidFire];
      v64 = [MEMORY[0x1E4F28C40] defaultCenter];
      uint64_t v65 = *MEMORY[0x1E4FB4C48];
      [v15 URL];
      id v87 = v34;
      id v67 = v66 = v15;
      [v67 path];
      id v68 = v44;
      v70 = v69 = v13;
      [v64 addObserver:self selector:sel_remoteContextDidSave_ name:v65 object:v70];

      uint64_t v13 = v69;
      id v44 = v68;

      id v15 = v66;
      id v34 = v87;

      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __82__WFDatabase_initWithStoreDescription_runMigrationsIfNecessary_useLockFile_error___block_invoke;
      v88[3] = &unk_1E6553488;
      v71 = self;
      id v89 = v71;
      [(WFDatabase *)v71 performTransactionWithReason:@"initial setup" block:v88 error:0];
      uint64_t v72 = [v15 URL];
      fileURL = v71->_fileURL;
      v71->_fileURL = (NSURL *)v72;

      id v74 = v71;
      id v46 = v85;
    }
    id v75 = self;
  }
  else
  {
    id v75 = 0;
  }

  return v75;
}

+ (void)setDefaultDatabase:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&WFDefaultDatabaseLock);
  uint64_t v4 = (void *)_defaultDatabase;
  _defaultDatabase = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&WFDefaultDatabaseLock);
}

- (id)mostRunOrLatestImportedVisibleShortcut
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = getWFTipsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    BOOL v8 = "-[WFDatabase(TipKit) mostRunOrLatestImportedVisibleShortcut]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Fetching the most run or the latest imported shortcut.", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke;
  v6[3] = &unk_1E654D918;
  v6[4] = self;
  uint64_t v4 = [(WFDatabase *)self performOperationWithReason:@"getting most run/latest imported shortcut" block:v6 error:0];
  return v4;
}

- (void)clearTombstonesAndSyncState
{
  id v3 = [(WFDatabase *)self context];
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__WFDatabase_Sync__clearTombstonesAndSyncState__block_invoke;
  v7[3] = &unk_1E6558A40;
  v7[4] = self;
  id v8 = v3;
  id v4 = v3;
  [(WFDatabase *)self performTransactionWithReason:@"clear tombstones and sync state" block:v7 error:&v6];
  id v5 = v6;
}

- (void)addActionCountsToShortcutsIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  id v4 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__WFDatabase_addActionCountsToShortcutsIfNecessary__block_invoke;
  v5[3] = &unk_1E65536B8;
  v5[4] = self;
  v5[5] = &v6;
  [(WFDatabase *)self performTransactionWithReason:@"add action counts" block:v5 error:&v4];
  id v2 = v4;
  if (!*((unsigned char *)v7 + 24))
  {
    id v3 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v11 = "-[WFDatabase addActionCountsToShortcutsIfNecessary]";
      __int16 v12 = 2114;
      id v13 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Unable to add action counts: %{public}@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v6, 8);
}

- (void)updateWalrusStatus
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  os_activity_t v3 = _os_activity_create(&dword_1C7F0A000, "database walrus update", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  id v4 = getWFWalrusLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [&unk_1F2317958 componentsJoinedByString:@"\n"];
    *(_DWORD *)long long buf = 136315394;
    uint64_t v38 = "-[WFDatabase(Sync) updateWalrusStatus]";
    __int16 v39 = 2112;
    id v40 = v5;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s Updating Walrus status in the database - per:\n%@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke;
  v23[3] = &unk_1E6550FE0;
  uint64_t v6 = v3;
  uint64_t v28 = 5;
  id v24 = v6;
  id v25 = self;
  long long v26 = &v33;
  long long v27 = &v29;
  id v22 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"updating walrus schema status for shortcuts" block:v23 error:&v22];
  id v7 = v22;
  if (*((unsigned char *)v34 + 24))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_286;
    v16[3] = &unk_1E6550FE0;
    uint64_t v21 = 5;
    uint64_t v17 = v6;
    id v18 = self;
    uint64_t v19 = &v33;
    uint64_t v20 = &v29;
    id v15 = v7;
    [(WFDatabase *)self performTransactionWithReason:@"updating walrus schema status for collections" block:v16 error:&v15];
    id v8 = v15;

    if (*((unsigned char *)v34 + 24))
    {
      char v9 = getWFWalrusLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = (void *)v30[3];
        *(_DWORD *)long long buf = 136315394;
        uint64_t v38 = "-[WFDatabase(Sync) updateWalrusStatus]";
        __int16 v39 = 2048;
        id v40 = v10;
        uint64_t v11 = "%s Updated %lu Walrus schema versions.";
        __int16 v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
        _os_log_impl(&dword_1C7F0A000, v12, v13, v11, buf, 0x16u);
      }
    }
    else
    {
      char v9 = getWFWalrusLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v38 = "-[WFDatabase(Sync) updateWalrusStatus]";
        __int16 v39 = 2114;
        id v40 = v8;
        uint64_t v11 = "%s Unable to update wanted schema versions for Walrus: %{public}@";
        __int16 v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        goto LABEL_11;
      }
    }

    uint64_t v14 = v17;
    id v7 = v8;
    goto LABEL_13;
  }
  uint64_t v14 = getWFWalrusLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v38 = "-[WFDatabase(Sync) updateWalrusStatus]";
    __int16 v39 = 2114;
    id v40 = v7;
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Unable to update wanted schema versions for Walrus: %{public}@", buf, 0x16u);
  }
LABEL_13:

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

+ (WFDatabase)defaultDatabase
{
  os_unfair_lock_lock((os_unfair_lock_t)&WFDefaultDatabaseLock);
  id v2 = (id)_defaultDatabase;
  os_unfair_lock_unlock((os_unfair_lock_t)&WFDefaultDatabaseLock);
  return (WFDatabase *)v2;
}

- (unint64_t)countForResult:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __29__WFDatabase_countForResult___block_invoke;
    __int16 v12 = &unk_1E65589C8;
    id v13 = v4;
    uint64_t v14 = self;
    id v5 = v4;
    uint64_t v6 = [(WFDatabase *)self performOperationWithReason:@"getting count for result" block:&v9 error:0];
    unint64_t v7 = objc_msgSend(v6, "unsignedIntValue", v9, v10, v11, v12);
  }
  else
  {

    id v5 = [v4 descriptors];
    unint64_t v7 = [v5 count];
  }

  return v7;
}

- (void)addObjectObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  uint64_t v6 = [(WFDatabase *)self observers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (id)descriptorsForCoreDataResult:(id)a3 state:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__42419;
  uint64_t v19 = __Block_byref_object_dispose__42420;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__WFDatabase_descriptorsForCoreDataResult_state_error___block_invoke;
  v12[3] = &unk_1E6553668;
  v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  uint64_t v14 = &v15;
  uint64_t v10 = [(WFDatabase *)self performOperationWithReason:@"getting descriptors for result" block:v12 error:a5];
  *a4 = (id) v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)performTransactionWithReason:(id)a3 block:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!a3) {
    a3 = @"transaction";
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __55__WFDatabase_performTransactionWithReason_block_error___block_invoke;
  void v11[3] = &unk_1E65534B8;
  id v12 = v8;
  id v9 = v8;
  id v10 = [(WFDatabase *)self performSaveOperationWithReason:a3 block:v11 error:a5];
}

- (id)performSaveOperationWithReason:(id)a3 block:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__WFDatabase_performSaveOperationWithReason_block_error___block_invoke;
  v12[3] = &unk_1E6553508;
  if (!a3) {
    a3 = @"save";
  }
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(WFDatabase *)self performOperationWithReason:a3 block:v12 error:a5];

  return v10;
}

- (void)contextDidSave:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFDatabase *)self context];
  uint64_t v6 = [v4 userInfo];

  if (v6)
  {
    unint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BE00]];
    BOOL v47 = v7 != 0;
  }
  else
  {
    BOOL v47 = 1;
  }
  id v8 = objc_opt_new();
  id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BE08]];
  [v8 unionSet:v9];

  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BF28]];
  [v8 unionSet:v10];

  uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA0]];
  [v8 unionSet:v11];

  id v12 = v8;
  id v13 = v5;
  uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __WFUpdateSmartPromptChangesToShortcutChanges_block_invoke;
  id v53 = &unk_1E6553758;
  id v54 = v13;
  id v55 = v15;
  id v56 = v14;
  id v16 = v14;
  id v17 = v15;
  id v18 = v13;
  [v12 enumerateObjectsUsingBlock:buf];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __WFUpdateSmartPromptChangesToShortcutChanges_block_invoke_571;
  v50[3] = &unk_1E6553780;
  id v51 = v12;
  id v19 = v12;
  [v17 enumerateObjectsUsingBlock:v50];
  id v20 = [v16 allObjects];
  [v19 addObjectsFromArray:v20];

  uint64_t v21 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF0]];
  id v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_opt_new();
  }
  id v24 = v23;

  id v25 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BDB8]];
  long long v26 = v25;
  if (v25) {
    id v27 = v25;
  }
  else {
    id v27 = (id)objc_opt_new();
  }
  uint64_t v28 = v27;

  id v29 = objc_alloc(MEMORY[0x1E4FB4690]);
  uint64_t v30 = WFDescriptorsForObjectIDs(v19, v18);
  uint64_t v31 = WFDescriptorsForObjectIDs(v24, v18);
  uint64_t v32 = WFDescriptorsForObjectIDs(v28, v18);
  uint64_t v33 = (void *)[v29 initWithInvalidatedAllObjects:v47 updated:v30 inserted:v31 deleted:v32 processIdentifier:getpid()];

  [(WFDatabase *)self addPendingLocalChangeNotification:v33];
  if ([(WFDatabase *)self transactionCount] <= 0)
  {
    id v34 = [(WFDatabase *)self pendingLocalChangeNotification];
    [(WFDatabase *)self setPendingLocalChangeNotification:0];
    if ([v34 hasChanges])
    {
      changeNotificationQueue = self->_changeNotificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__WFDatabase_contextDidSave___block_invoke;
      block[3] = &unk_1E6558938;
      block[4] = self;
      id v36 = v34;
      id v49 = v36;
      dispatch_async(changeNotificationQueue, block);
      BOOL v37 = [(WFDatabase *)self isPostingDistributedNotifications];
      uint64_t v38 = getWFDatabaseLogObject();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
      if (v37)
      {
        if (v39)
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[WFDatabase contextDidSave:]";
          _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_INFO, "%s Posting distributed notification.", buf, 0xCu);
        }

        id v40 = getWFDatabaseLogObject();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v41 = [v36 dictionaryRepresentation];
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[WFDatabase contextDidSave:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v41;
          _os_log_impl(&dword_1C7F0A000, v40, OS_LOG_TYPE_DEBUG, "%s Change notification: %@", buf, 0x16u);
        }
        uint64_t v38 = [MEMORY[0x1E4F28C40] defaultCenter];
        uint64_t v42 = *MEMORY[0x1E4FB4C48];
        id v43 = [(WFDatabase *)self persistentStoreDescription];
        id v44 = [v43 URL];
        id v45 = [v44 path];
        id v46 = [v36 dictionaryRepresentation];
        [v38 postNotificationName:v42 object:v45 userInfo:v46];
      }
      else if (v39)
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFDatabase contextDidSave:]";
        _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_INFO, "%s Not posting distributed notification because it's explicitly disabled.", buf, 0xCu);
      }
    }
  }
}

- (void)addPendingLocalChangeNotification:(id)a3
{
  id v8 = a3;
  id v4 = [(WFDatabase *)self pendingLocalChangeNotification];

  if (v4)
  {
    id v5 = [(WFDatabase *)self pendingLocalChangeNotification];
    uint64_t v6 = [v5 notificationByMergingChangesFromNotification:v8];

    id v7 = (id)v6;
  }
  else
  {
    id v7 = v8;
  }
  id v9 = v7;
  [(WFDatabase *)self setPendingLocalChangeNotification:v7];
}

- (void)setPendingLocalChangeNotification:(id)a3
{
}

- (WFCoreDataChangeNotification)pendingLocalChangeNotification
{
  return self->_pendingLocalChangeNotification;
}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  v63[3] = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  os_activity_scope_state_s v44 = state;
  uint64_t v31 = (void (**)(void))_Block_copy(aBlock);
  int64_t v37 = +[WFCloudKitWorkflow latestEncryptedSchemaVersion];
  os_activity_t v3 = getWFWalrusLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)long long buf = 136315650;
    BOOL v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    __int16 v48 = 2048;
    int64_t v49 = v37;
    __int16 v50 = 2112;
    uint64_t v51 = (uint64_t)v5;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s Looks like we want Walrus schema version %lld for %@", buf, 0x20u);
  }
  uint64_t v33 = +[WFCoreDataWorkflow fetchRequest];
  [v33 setFetchBatchSize:*(void *)(a1 + 64)];
  v63[0] = @"wantedEncryptedSchemaVersion";
  v63[1] = @"syncHash";
  v63[2] = @"lastSyncedEncryptedSchemaVersion";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:3];
  [v33 setPropertiesToFetch:v6];

  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %lld OR %K = nil", @"wantedEncryptedSchemaVersion", v37, @"wantedEncryptedSchemaVersion");
  [v33 setPredicate:v7];

  id v8 = getWFWalrusLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v33 predicate];
    *(_DWORD *)long long buf = 136315650;
    BOOL v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    __int16 v48 = 2112;
    int64_t v49 = (int64_t)v10;
    __int16 v50 = 2112;
    uint64_t v51 = (uint64_t)v11;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Running predicate on %@: %@", buf, 0x20u);
  }
  id v12 = [*(id *)(a1 + 40) context];
  uint64_t v32 = [v12 executeFetchRequest:v33 error:a2];

  id v13 = getWFWalrusLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v32 count];
    id v17 = [v33 predicate];
    *(_DWORD *)long long buf = 136315906;
    BOOL v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    __int16 v48 = 2112;
    int64_t v49 = (int64_t)v15;
    __int16 v50 = 2048;
    uint64_t v51 = v16;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v17;
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%s Ran predicate on %@, found %ld entities: %@", buf, 0x2Au);
  }
  if (v32)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v32;
    uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v62 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v40;
      uint64_t v34 = *(void *)v40;
      do
      {
        uint64_t v20 = 0;
        uint64_t v35 = v18;
        do
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * v20);
          id v22 = (void *)MEMORY[0x1C87CA430]();
          ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          uint64_t v23 = [v21 wantedEncryptedSchemaVersion];
          uint64_t v24 = [v21 syncHash];
          uint64_t v25 = [v21 lastSyncedEncryptedSchemaVersion];
          [v21 setWantedEncryptedSchemaVersion:v37];
          objc_msgSend(v21, "setSyncHash:", objc_msgSend(v21, "computedSyncHash"));
          long long v26 = getWFWalrusLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = [v21 wantedEncryptedSchemaVersion];
            uint64_t v28 = [v21 syncHash];
            uint64_t v29 = [v21 lastSyncedEncryptedSchemaVersion];
            uint64_t v30 = [v21 identifier];
            *(_DWORD *)long long buf = 136316930;
            BOOL v47 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
            __int16 v48 = 2048;
            int64_t v49 = v23;
            __int16 v50 = 2048;
            uint64_t v51 = v24;
            __int16 v52 = 2048;
            uint64_t v53 = v25;
            __int16 v54 = 2048;
            uint64_t v55 = v27;
            __int16 v56 = 2048;
            uint64_t v57 = v28;
            __int16 v58 = 2048;
            uint64_t v59 = v29;
            __int16 v60 = 2112;
            v61 = v30;
            _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_DEFAULT, "%s Updated workflow <old: wanted schema ver %lld, sync hash %lld, last synced schema ver %lld> <new: wanted schema ver %lld, sync hash %lld, last synced schema ver %lld>: %@", buf, 0x52u);

            uint64_t v19 = v34;
            uint64_t v18 = v35;
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v62 count:16];
      }
      while (v18);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }

  v31[2]();
}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2(os_activity_scope_state_s *a1)
{
}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_286(uint64_t a1, uint64_t a2)
{
  v62[2] = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2_287;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  os_activity_scope_state_s v46 = state;
  uint64_t v33 = (void (**)(void))_Block_copy(aBlock);
  int64_t v38 = +[WFCloudKitFolder latestEncryptedSchemaVersion];
  int64_t v37 = +[WFCoreDataCollection fetchRequest];
  [v37 setFetchBatchSize:*(void *)(a1 + 64)];
  v62[0] = @"wantedEncryptedSchemaVersion";
  v62[1] = @"lastSyncedEncryptedSchemaVersion";
  os_activity_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  [v37 setPropertiesToFetch:v3];

  id v4 = getWFWalrusLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)long long buf = 136315650;
    int64_t v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    __int16 v50 = 2048;
    int64_t v51 = v38;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v6;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s Looks like we want Walrus schema version %lld for %@", buf, 0x20u);
  }
  uint64_t v35 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY parents.identifier == %@ AND %K == NO", @"Root", @"tombstoned"];
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %lld OR %K = nil", @"wantedEncryptedSchemaVersion", v38, @"wantedEncryptedSchemaVersion");
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v61[0] = v35;
  v61[1] = v34;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  id v9 = [v7 andPredicateWithSubpredicates:v8];
  [v37 setPredicate:v9];

  id v10 = getWFWalrusLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [v37 predicate];
    *(_DWORD *)long long buf = 136315650;
    int64_t v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    __int16 v50 = 2112;
    int64_t v51 = (int64_t)v12;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v13;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_INFO, "%s Running predicate on %@: %@", buf, 0x20u);
  }
  uint64_t v14 = [*(id *)(a1 + 40) context];
  id v36 = [v14 executeFetchRequest:v37 error:a2];

  id v15 = getWFWalrusLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v36 count];
    uint64_t v19 = [v37 predicate];
    *(_DWORD *)long long buf = 136315906;
    int64_t v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
    __int16 v50 = 2112;
    int64_t v51 = (int64_t)v17;
    __int16 v52 = 2048;
    uint64_t v53 = v18;
    __int16 v54 = 2112;
    uint64_t v55 = (uint64_t)v19;
    _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEFAULT, "%s Ran predicate on %@, found %ld entities: %@", buf, 0x2Au);
  }
  if (v36)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v20 = v36;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v60 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v42;
      do
      {
        uint64_t v40 = v21;
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v25 = (void *)MEMORY[0x1C87CA430]();
          if ([v24 isFolder])
          {
            ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            uint64_t v26 = [v24 wantedEncryptedSchemaVersion];
            uint64_t v27 = [v24 lastSyncedEncryptedSchemaVersion];
            [v24 setWantedEncryptedSchemaVersion:v38];
            uint64_t v28 = getWFWalrusLogObject();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v29 = [v24 wantedEncryptedSchemaVersion];
              uint64_t v30 = [v24 lastSyncedEncryptedSchemaVersion];
              uint64_t v31 = [v24 identifier];
              *(_DWORD *)long long buf = 136316418;
              int64_t v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
              __int16 v50 = 2048;
              int64_t v51 = v26;
              __int16 v52 = 2048;
              uint64_t v53 = v27;
              __int16 v54 = 2048;
              uint64_t v55 = v29;
              __int16 v56 = 2048;
              uint64_t v57 = v30;
              __int16 v58 = 2112;
              uint64_t v59 = v31;
              _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s Updated collection <old: wanted schema ver %lld, last synced schema ver %lld> <new: wanted schema ver %lld, last synced schema ver %lld>: %@", buf, 0x3Eu);
            }
          }
          else
          {
            uint64_t v28 = getWFWalrusLogObject();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [v24 identifier];
              *(_DWORD *)long long buf = 136315394;
              int64_t v49 = "-[WFDatabase(Sync) updateWalrusStatus]_block_invoke";
              __int16 v50 = 2112;
              int64_t v51 = (int64_t)v32;
              _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s Skipping collection %@ for Walrus, as it's not a user-created one", buf, 0x16u);
            }
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v60 count:16];
      }
      while (v21);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }

  v33[2]();
}

void __38__WFDatabase_Sync__updateWalrusStatus__block_invoke_2_287(os_activity_scope_state_s *a1)
{
}

- (id)libraryRecordForVersion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __47__WFDatabase_Library__libraryRecordForVersion___block_invoke;
  void v11[3] = &unk_1E654CD88;
  objc_copyWeak(&v13, &location);
  id v5 = v4;
  id v12 = v5;
  id v10 = 0;
  uint64_t v6 = [(WFDatabase *)self performSaveOperationWithReason:@"create library record" block:v11 error:&v10];
  id v7 = v10;
  if (v7)
  {
    id v8 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v16 = "-[WFDatabase(Library) libraryRecordForVersion:]";
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Error creating library record: %{public}@", buf, 0x16u);
    }
  }
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v6;
}

WFLibraryRecord *__47__WFDatabase_Library__libraryRecordForVersion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_activity_t v3 = [WeakRetained coreDataLibraryWithVersion:*(void *)(a1 + 32)];

  if (v3) {
    id v4 = [(WFRecord *)[WFLibraryRecord alloc] initWithStorage:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)allLatestLibrariesLimitedTo:(unint64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = +[WFCoreDataLibrary fetchRequest];
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"version" ascending:0];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setSortDescriptors:v7];

  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 setFetchLimit:a3];
  }
  id v8 = [(WFDatabase *)self context];
  id v9 = [v8 executeFetchRequest:v5 error:0];

  return v9;
}

- (id)coreDataLibraryWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = +[WFCoreDataLibrary fetchRequest];
  [v5 setPredicate:v4];

  [v5 setFetchLimit:1];
  uint64_t v6 = [(WFDatabase *)self context];
  id v7 = [v6 executeFetchRequest:v5 error:0];

  id v8 = [v7 firstObject];

  return v8;
}

- (id)coreDataLibraryWithIdentifier:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", a3];
  id v5 = [(WFDatabase *)self coreDataLibraryWithPredicate:v4];

  return v5;
}

- (id)coreDataLibraryWithVersion:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"version", a3];
  id v5 = [(WFDatabase *)self coreDataLibraryWithPredicate:v4];

  return v5;
}

- (id)latestCoreDataLibrary
{
  id v2 = [(WFDatabase *)self allLatestLibrariesLimitedTo:1];
  os_activity_t v3 = [v2 firstObject];

  return v3;
}

- (void)saveLibraryToDatabase:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCoherenceLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v17 = "-[WFDatabase(Library) saveLibraryToDatabase:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s Saving library...", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__WFDatabase_Library__saveLibraryToDatabase___block_invoke;
  v12[3] = &unk_1E654CD60;
  id v6 = v4;
  id v13 = v6;
  objc_copyWeak(&v14, &location);
  id v11 = 0;
  id v7 = [(WFDatabase *)self performSaveOperationWithReason:@"saving library" block:v12 error:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v17 = "-[WFDatabase(Library) saveLibraryToDatabase:]";
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Error saving updated library: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v6 dotRepresentation];
      *(_DWORD *)long long buf = 136315394;
      __int16 v17 = "-[WFDatabase(Library) saveLibraryToDatabase:]";
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEBUG, "%s Saved library to disk: %@", buf, 0x16u);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

id __45__WFDatabase_Library__saveLibraryToDatabase___block_invoke(uint64_t a1, NSObject **a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_activity_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v3 version];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [WeakRetained coreDataLibraryWithVersion:v5];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) capsuleDataWithError:a2];
      if (v8)
      {
        id v9 = v8;
        [v7 setData:v8];
        id v10 = v7;
LABEL_14:

        goto LABEL_15;
      }
      id v11 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = *a2;
        int v14 = 136315394;
        id v15 = "-[WFDatabase(Library) saveLibraryToDatabase:]_block_invoke";
        __int16 v16 = 2112;
        __int16 v17 = v12;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Could not generate capsule data: %@", (uint8_t *)&v14, 0x16u);
      }

      id v9 = 0;
    }
    else
    {
      id v9 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        id v15 = "-[WFDatabase(Library) saveLibraryToDatabase:]_block_invoke";
        __int16 v16 = 2114;
        __int16 v17 = v5;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Attempting to save library but there's no existing Core Data library with version: %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
    id v10 = 0;
    goto LABEL_14;
  }
  id v5 = getWFCoherenceLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315138;
    id v15 = "-[WFDatabase(Library) saveLibraryToDatabase:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Attempting to save library but there are no changes", (uint8_t *)&v14, 0xCu);
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)shouldAddWorkflowToLibrary:(id)a3
{
  id v3 = a3;
  if ([v3 hiddenFromLibraryAndSync] & 1) != 0 || (objc_msgSend(v3, "tombstoned"))
  {
    char v4 = 0;
  }
  else if ([v3 isConflictOfOtherWorkflow])
  {
    id v7 = [v3 conflictOf];
    char v4 = [v7 tombstoned];
  }
  else
  {
    char v4 = 1;
  }
  id v5 = [v3 name];

  if (!v5) {
    char v4 = 0;
  }

  return v4;
}

- (id)createLibraryFromCurrentDatabaseSnapshot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = getWFCoherenceLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Creating library from database...", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke;
  v6[3] = &unk_1E654CD38;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  void v6[5] = &buf;
  char v4 = [(WFDatabase *)self performSaveOperationWithReason:@"create library from current database snapshot" block:v6 error:0];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
  return v4;
}

WFLibrary *__63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  char v4 = [WFCoreDataLibrary alloc];
  id v5 = [*(id *)(a1 + 32) context];
  id v6 = [(WFCoreDataLibrary *)v4 initWithContext:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = [WeakRetained latestCoreDataLibrary];

  uint64_t v32 = v8;
  id v9 = [v8 version];
  uint64_t v10 = v9;
  if (v9)
  {
    char v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
    uint64_t v12 = [v11 stringValue];
  }
  else
  {
    uint64_t v12 = [&unk_1F23165D8 stringValue];
  }
  [(WFCoreDataLibrary *)v6 setVersion:v12];
  id v13 = [[WFLibrary alloc] initWithIdentifier:@"Library" version:v12];
  int v14 = [(WFLibrary *)v13 identifier];
  [(WFCoreDataLibrary *)v6 setIdentifier:v14];

  id v15 = [*(id *)(a1 + 32) _rootCollection];
  __int16 v16 = (void *)&unk_1C856C000;
  if (v15)
  {
    __int16 v17 = a2;
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    id v19 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v20 = [v15 shortcuts];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_197;
    v37[3] = &unk_1E654CCC0;
    v37[4] = *(void *)(a1 + 32);
    id v38 = v18;
    id v21 = v18;
    [v20 enumerateObjectsUsingBlock:v37];

    uint64_t v22 = [v15 collections];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_2;
    v35[3] = &unk_1E654CCE8;
    v35[4] = *(void *)(a1 + 32);
    id v36 = v19;
    id v23 = v19;
    [v22 enumerateObjectsUsingBlock:v35];

    a2 = v17;
    [(WFLibrary *)v13 overwriteShortcutsAndFolders:v21 folders:v23];

    __int16 v16 = &unk_1C856C000;
  }
  uint64_t v24 = [*(id *)(a1 + 32) fetchBuiltInCollections];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = v16[180];
  v33[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_4;
  v33[3] = &unk_1E654CCE8;
  v33[4] = *(void *)(a1 + 32);
  uint64_t v25 = v13;
  uint64_t v34 = v25;
  [v24 enumerateObjectsUsingBlock:v33];
  uint64_t v26 = [(WFLibrary *)v25 capsuleDataWithError:a2];
  if (v26)
  {
    uint64_t v27 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v40 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_INFO, "%s Saving capsule data for library in Core Data", buf, 0xCu);
    }

    [(WFCoreDataLibrary *)v6 setData:v26];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v28 = v25;
  }
  else
  {
    uint64_t v29 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *a2;
      *(_DWORD *)long long buf = 136315394;
      uint64_t v40 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke";
      __int16 v41 = 2112;
      uint64_t v42 = v30;
      _os_log_impl(&dword_1C7F0A000, v29, OS_LOG_TYPE_ERROR, "%s Failed to create library from current database snapshot: %@", buf, 0x16u);
    }

    uint64_t v28 = 0;
  }

  return v28;
}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_197(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAddWorkflowToLibrary:"))
  {
    id v3 = *(void **)(a1 + 40);
    char v4 = [v5 workflowID];
    [v3 addObject:v4];
  }
}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = [v3 array];
  id v6 = [v4 shortcuts];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_3;
  int v14 = &unk_1E654CCC0;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:&v11];

  uint64_t v8 = [WFLibraryCollection alloc];
  id v9 = objc_msgSend(v4, "descriptor", v11, v12, v13, v14, v15);

  uint64_t v10 = [(WFLibraryCollection *)v8 initWithWorkflowCollection:v9 shortcutIdentifiers:v7];
  [*(id *)(a1 + 40) addObject:v10];
}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 shortcuts];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_5;
  v8[3] = &unk_1E654CD10;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v4;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldAddWorkflowToLibrary:v3])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [v3 workflowID];
    uint64_t v6 = *(void *)(a1 + 48);
    id v10 = 0;
    [v4 addShortcutWithIdentifier:v5 toCollectionWithIdentifier:v6 error:&v10];
    id v7 = v10;

    if (v7)
    {
      uint64_t v8 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 136315650;
        uint64_t v12 = "-[WFDatabase(Library) createLibraryFromCurrentDatabaseSnapshot]_block_invoke_5";
        __int16 v13 = 2114;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        id v16 = v7;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to add shortcut to collection with identifier: %{public}@, error: %{public}@", buf, 0x20u);
      }
    }
  }
}

void __63__WFDatabase_Library__createLibraryFromCurrentDatabaseSnapshot__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAddWorkflowToLibrary:"))
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [v5 workflowID];
    [v3 addObject:v4];
  }
}

- (id)fetchBuiltInCollections
{
  id v3 = +[WFCoreDataCollection fetchRequest];
  id v4 = WFGetBuiltInCollectionIdentifiers(0);
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY parents = nil && (%K in %@)", @"identifier", v4];
  [v3 setPredicate:v5];

  uint64_t v6 = [(WFDatabase *)self context];
  id v7 = [v6 executeFetchRequest:v3 error:0];

  return v7;
}

- (id)_rootCollection
{
  id v3 = +[WFCoreDataCollection fetchRequest];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", @"Root"];
  [v3 setPredicate:v4];

  [v3 setFetchLimit:1];
  id v5 = [(WFDatabase *)self context];
  uint64_t v6 = [v5 executeFetchRequest:v3 error:0];

  id v7 = [v6 firstObject];

  return v7;
}

- (id)libraryDotRepresentation
{
  if (self) {
    library = self->_library;
  }
  else {
    library = 0;
  }
  id v3 = library;
  id v4 = [(WFLibrary *)v3 dotRepresentation];

  return v4;
}

- (BOOL)wipeAllLibrariesWithError:(id *)a3
{
  id v5 = +[WFCoreDataLibrary fetchRequest];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v5];
  id v7 = [(WFDatabase *)self context];
  id v14 = 0;
  id v8 = (id)[v7 executeRequest:v6 error:&v14];
  id v9 = v14;

  id v10 = [(WFDatabase *)self context];
  id v13 = v9;
  [v10 save:&v13];
  id v11 = v13;

  if (a3) {
    *a3 = v11;
  }

  return v11 != 0;
}

- (id)allLatestLibraries
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __41__WFDatabase_Library__allLatestLibraries__block_invoke;
  v9[3] = &unk_1E654CC98;
  objc_copyWeak(&v10, &location);
  id v8 = 0;
  id v3 = [(WFDatabase *)self performOperationWithReason:@"getting all latest libraries" block:v9 error:&v8];
  id v4 = v8;
  if (v4)
  {
    id v5 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[WFDatabase(Library) allLatestLibraries]";
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Error getting all latest libraries: %{public}@", buf, 0x16u);
    }

    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

id __41__WFDatabase_Library__allLatestLibraries__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained allLatestLibrariesLimitedTo:0x7FFFFFFFFFFFFFFFLL];

  id v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_1480);

  return v3;
}

WFLibrary *__41__WFDatabase_Library__allLatestLibraries__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [WFLibrary alloc];
  id v4 = [v2 identifier];
  id v5 = [v2 version];
  id v6 = [v2 data];

  id v7 = [(WFLibrary *)v3 initWithIdentifier:v4 version:v5 data:v6];
  return v7;
}

- (id)latestLibrary
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__WFDatabase_Library__latestLibrary__block_invoke;
  v4[3] = &unk_1E654CC50;
  v4[4] = self;
  id v2 = [(WFDatabase *)self performOperationWithReason:@"getting latest library" block:v4 error:0];
  return v2;
}

WFLibrary *__36__WFDatabase_Library__latestLibrary__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) latestCoreDataLibrary];
  id v3 = getWFDatabaseLogObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v11 = 136315138;
      uint64_t v12 = "-[WFDatabase(Library) latestLibrary]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Found the latest library in Core Data; creating library with persisted data",
        (uint8_t *)&v11,
        0xCu);
    }

    id v5 = [WFLibrary alloc];
    id v6 = [v2 identifier];
    id v7 = [v2 version];
    id v8 = [v2 data];
    id v9 = [(WFLibrary *)v5 initWithIdentifier:v6 version:v7 data:v8];
  }
  else
  {
    if (v4)
    {
      int v11 = 136315138;
      uint64_t v12 = "-[WFDatabase(Library) latestLibrary]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_INFO, "%s Didn't find the latest library in Core Data; creating one from current snapshot",
        (uint8_t *)&v11,
        0xCu);
    }

    id v9 = [*(id *)(a1 + 32) createLibraryFromCurrentDatabaseSnapshot];
  }

  return v9;
}

- (BOOL)isReference:(id)a3 allowedToRunOnDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __64__WFDatabase_AccessResources__isReference_allowedToRunOnDomain___block_invoke;
  v13[3] = &unk_1E654D348;
  id v14 = v7;
  id v15 = v6;
  uint64_t v16 = self;
  id v8 = v6;
  id v9 = v7;
  id v10 = [(WFDatabase *)self performOperationWithReason:@"getting domain trust" block:v13 error:0];
  char v11 = [v10 BOOLValue];

  return v11;
}

id __64__WFDatabase_AccessResources__isReference_allowedToRunOnDomain___block_invoke(id *a1, uint64_t a2)
{
  BOOL v4 = +[WFCoreDataTrustedDomain fetchRequest];
  [v4 setFetchLimit:1];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [a1[4] lowercaseString];
  id v7 = [a1[5] identifier];
  id v8 = [v5 predicateWithFormat:@"%K = %@ AND %K = %@", @"domain", v6, @"shortcut.workflowID", v7];
  [v4 setPredicate:v8];

  id v9 = [a1[6] context];
  id v10 = [v9 executeFetchRequest:v4 error:a2];
  char v11 = [v10 firstObject];

  uint64_t v12 = [NSNumber numberWithInt:v11 != 0];

  return v12;
}

- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__WFDatabase_AccessResources__setTrustedToRunScripts_forReference_onDomain___block_invoke;
  v16[3] = &unk_1E654D320;
  void v16[4] = self;
  id v10 = v8;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  BOOL v19 = a3;
  id v15 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"set domain trust" block:v16 error:&v15];
  id v12 = v15;
  if (v12)
  {
    uint64_t v13 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v12 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      id v21 = "-[WFDatabase(AccessResources) setTrustedToRunScripts:forReference:onDomain:]";
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Unable to update trusted run scripts: %@", buf, 0x16u);
    }
  }
}

void __76__WFDatabase_AccessResources__setTrustedToRunScripts_forReference_onDomain___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = "WFEnforceClass";
      __int16 v38 = 2114;
      id v39 = v6;
      __int16 v40 = 2114;
      id v41 = (id)objc_opt_class();
      __int16 v42 = 2114;
      uint64_t v43 = v5;
      id v9 = v41;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  id v10 = [v7 trustedDomains];
  id v11 = (void *)[v10 mutableCopy];
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  id v14 = v13;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v14;
  id v16 = (id)[v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    uint64_t v31 = a2;
    uint64_t v17 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v15);
        }
        BOOL v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v20 = [v19 domain];
        id v21 = [*(id *)(a1 + 48) lowercaseString];
        int v22 = [v20 isEqualToString:v21];

        if (v22)
        {
          id v16 = v19;
          goto LABEL_20;
        }
      }
      id v16 = (id)[v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v16) {
        continue;
      }
      break;
    }
LABEL_20:
    a2 = v31;
  }

  int v23 = *(unsigned __int8 *)(a1 + 56);
  if (v16) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v23 == 0;
  }
  if (v24)
  {
    if (v16) {
      BOOL v25 = v23 == 0;
    }
    else {
      BOOL v25 = 0;
    }
    if (v25) {
      [v15 removeObject:v16];
    }
  }
  else
  {
    uint64_t v26 = [WFCoreDataTrustedDomain alloc];
    uint64_t v27 = [*(id *)(a1 + 32) context];
    uint64_t v28 = [(WFCoreDataTrustedDomain *)v26 initWithContext:v27];

    [(WFCoreDataTrustedDomain *)v28 setDomain:*(void *)(a1 + 48)];
    [v15 addObject:v28];
  }
  [v7 setTrustedDomains:v15];
  uint64_t v29 = *(void **)(a1 + 32);
  *(void *)long long buf = @"trustedDomains";
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

  [v29 object:v7 didUpdateProperties:v30 error:a2];
}

- (id)latestWorkflowSiriRunEvent
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__WFDatabase_TipKit__latestWorkflowSiriRunEvent__block_invoke;
  v4[3] = &unk_1E6558628;
  v4[4] = self;
  id v2 = [(WFDatabase *)self performOperationWithReason:@"getting latest siri run event" block:v4 error:0];
  return v2;
}

id __48__WFDatabase_TipKit__latestWorkflowSiriRunEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  BOOL v4 = +[WFCoreDataRunEvent fetchRequest];
  [v4 setFetchLimit:1];
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source == %@", *MEMORY[0x1E4FB4F70]];
  v19[0] = v6;
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source == %@", *MEMORY[0x1E4FB4F68]];
  v19[1] = v7;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source == %@", *MEMORY[0x1E4FB4F78]];
  v19[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  id v10 = [v5 orPredicateWithSubpredicates:v9];
  [v4 setPredicate:v10];

  id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  id v18 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v4 setSortDescriptors:v12];

  id v13 = [*(id *)(a1 + 32) context];
  id v14 = [v13 executeFetchRequest:v4 error:a2];
  id v15 = [v14 firstObject];

  id v16 = [v15 descriptor];

  return v16;
}

- (id)workflowSiriRunEventWithIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__WFDatabase_TipKit__workflowSiriRunEventWithIdentifier___block_invoke;
  v8[3] = &unk_1E654D940;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  id v6 = [(WFDatabase *)self performOperationWithReason:@"getting siri run event by id" block:v8 error:0];

  return v6;
}

id __57__WFDatabase_TipKit__workflowSiriRunEventWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[WFCoreDataRunEvent fetchRequest];
  [v3 setFetchLimit:1];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", *(void *)(a1 + 32)];
  v25[0] = v5;
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source == %@", *MEMORY[0x1E4FB4F70]];
  v24[0] = v7;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source == %@", *MEMORY[0x1E4FB4F68]];
  v24[1] = v8;
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source == %@", *MEMORY[0x1E4FB4F78]];
  v24[2] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  id v11 = [v6 orPredicateWithSubpredicates:v10];
  v25[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v13 = [v4 andPredicateWithSubpredicates:v12];
  [v3 setPredicate:v13];

  id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  int v23 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [v3 setSortDescriptors:v15];

  id v16 = [*(id *)(a1 + 40) context];
  uint64_t v17 = [v16 executeFetchRequest:v3 error:a2];
  id v18 = [v17 firstObject];

  BOOL v19 = [v18 descriptor];

  return v19;
}

uint64_t __60__WFDatabase_TipKit__mostRunOrLatestImportedVisibleShortcut__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 source];
  id v8 = [v6 source];
  if ([v7 isEqualToString:*(void *)(a1 + 32)]
    && [v8 isEqualToString:*(void *)(a1 + 32)])
  {
    id v9 = [v6 creationDate];
    id v10 = [v5 creationDate];
    uint64_t v11 = [v9 compare:v10];
  }
  else if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = [v8 isEqualToString:*(void *)(a1 + 32)] << 63 >> 63;
  }

  return v11;
}

- (BOOL)saveContextOrRollback:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasChanges] && (objc_msgSend(v5, "save:", a4) & 1) == 0)
  {
    [v5 rollback];
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)performSuggestionsOperationWithBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)os_transaction_create();
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = __Block_byref_object_copy__17693;
  uint64_t v26 = __Block_byref_object_dispose__17694;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = __Block_byref_object_copy__17693;
  uint64_t v20 = __Block_byref_object_dispose__17694;
  id v21 = 0;
  id v8 = [(WFDatabase *)self suggestionsContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__WFDatabase_ShortcutSuggestions__performSuggestionsOperationWithBlock_error___block_invoke;
  v12[3] = &unk_1E654F850;
  id v14 = &v22;
  id v9 = v6;
  id v13 = v9;
  id v15 = &v16;
  [v8 performBlockAndWait:v12];

  if (a4) {
    *a4 = (id) v17[5];
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __78__WFDatabase_ShortcutSuggestions__performSuggestionsOperationWithBlock_error___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x1C87CA430]();
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = (*(void (**)(void))(v3 + 16))();
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)deleteShortcutSuggestionsFromApps:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFDatabase+ShortcutSuggestions.m", 189, @"Invalid parameter not satisfying: %@", @"bundleIdentifiers" object file lineNumber description];
  }
  uint64_t v6 = [(WFDatabase *)self suggestionsContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __69__WFDatabase_ShortcutSuggestions__deleteShortcutSuggestionsFromApps___block_invoke;
  v9[3] = &unk_1E6558938;
  id v10 = v5;
  uint64_t v11 = self;
  id v7 = v5;
  [v6 performBlockAndWait:v9];
}

void __69__WFDatabase_ShortcutSuggestions__deleteShortcutSuggestionsFromApps___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = +[VCVoiceShortcutSuggestionListManagedObject fetchRequest];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"associatedAppBundleIdentifier IN %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v2];
  id v5 = [*(id *)(a1 + 40) suggestionsContext];
  id v13 = 0;
  id v6 = (id)[v5 executeRequest:v4 error:&v13];
  id v7 = v13;

  id v8 = *(void **)(a1 + 40);
  id v9 = [v8 suggestionsContext];
  id v12 = v7;
  [v8 saveContextOrRollback:v9 error:&v12];
  id v10 = v12;

  if (v10)
  {
    uint64_t v11 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v15 = "-[WFDatabase(ShortcutSuggestions) deleteShortcutSuggestionsFromApps:]_block_invoke";
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Error deleting suggested shortcuts (%{public}@)", buf, 0x16u);
    }
  }
}

- (id)allShortcutSuggestions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[VCVoiceShortcutSuggestionListManagedObject fetchRequest];
  uint64_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"associatedAppBundleIdentifier" ascending:0];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = [[WFCoreDataDatabaseResult alloc] initWithDatabase:self fetchRequest:v3];
  return v6;
}

- (id)shortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 shortcutAvailability:(unint64_t)a4 error:(id *)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke;
  v7[3] = &unk_1E654F828;
  v7[4] = self;
  void v7[5] = a4;
  v7[6] = a3;
  id v5 = [(WFDatabase *)self performSuggestionsOperationWithBlock:v7 error:a5];
  return v5;
}

id __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[VCVoiceShortcutSuggestionListManagedObject fetchRequest];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"((shortcutAvailabilityOptions & %d) != 0)", *(void *)(a1 + 40));
    [v4 setPredicate:v6];
  }
  id v7 = [*(id *)(a1 + 32) suggestionsContext];
  id v8 = [v7 executeFetchRequest:v4 error:a2];

  if (v8)
  {
    uint64_t v27 = v5;
    BOOL v25 = v4;
    id v28 = (id)objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v24 = v8;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v13 = (void *)MEMORY[0x1E4F28DC0];
          id v14 = (void *)MEMORY[0x1E4F1CAD0];
          v36[0] = objc_opt_class();
          v36[1] = objc_opt_class();
          id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
          __int16 v16 = [v14 setWithArray:v15];
          id v17 = [v12 serializedSuggestions];
          id v31 = 0;
          uint64_t v18 = [v13 unarchivedObjectOfClasses:v16 fromData:v17 error:&v31];
          id v19 = v31;

          if (v18)
          {
            if (v27)
            {
              v30[0] = MEMORY[0x1E4F143A8];
              v30[1] = 3221225472;
              v30[2] = __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke_2;
              v30[3] = &__block_descriptor_40_e20_B16__0__INShortcut_8l;
              v30[4] = *(void *)(a1 + 40);
              uint64_t v20 = objc_msgSend(v18, "if_objectsPassingTest:", v30);

              uint64_t v18 = (void *)v20;
            }
            if ((unint64_t)[v18 count] > *(void *)(a1 + 48))
            {
              uint64_t v21 = [v18 subarrayWithRange:0];

              uint64_t v18 = (void *)v21;
            }
            uint64_t v22 = [v12 associatedAppBundleIdentifier];
            [v28 setObject:v18 forKeyedSubscript:v22];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }

    id v8 = v24;
    uint64_t v4 = v25;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

BOOL __101__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAllAppsWithLimit_shortcutAvailability_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return (objc_msgSend(a2, "wf_shortcutAvailability") & v2) != 0;
}

- (id)shortcutSuggestionsForAppWithBundleIdentifier:(id)a3 shortcutAvailability:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFDatabase+ShortcutSuggestions.m", 102, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke;
  void v14[3] = &unk_1E654F800;
  __int16 v16 = self;
  unint64_t v17 = a4;
  id v15 = v9;
  id v10 = v9;
  uint64_t v11 = [(WFDatabase *)self performSuggestionsOperationWithBlock:v14 error:a5];

  return v11;
}

id __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke(uint64_t a1, void *a2)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[VCVoiceShortcutSuggestionListManagedObject fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(associatedAppBundleIdentifier = %@)", *(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @" ((shortcutAvailabilityOptions & %d) != 0)", *(void *)(a1 + 48));
    id v8 = (void *)MEMORY[0x1E4F28BA0];
    v27[0] = v5;
    v27[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];

    uint64_t v5 = (void *)v10;
  }
  [v4 setPredicate:v5];
  [v4 setFetchLimit:1];
  uint64_t v11 = [*(id *)(a1 + 40) suggestionsContext];
  id v25 = 0;
  id v12 = [v11 executeFetchRequest:v4 error:&v25];
  id v13 = v25;

  if (v13)
  {
    id v14 = 0;
    *a2 = v13;
  }
  else
  {
    id v15 = [v12 firstObject];
    __int16 v16 = [v15 serializedSuggestions];

    if (v16)
    {
      unint64_t v17 = (void *)MEMORY[0x1E4F28DC0];
      int v23 = a2;
      uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
      v26[0] = objc_opt_class();
      v26[1] = objc_opt_class();
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      uint64_t v20 = [v18 setWithArray:v19];
      id v14 = [v17 unarchivedObjectOfClasses:v20 fromData:v16 error:v23];

      if (v14 && v6)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke_2;
        void v24[3] = &__block_descriptor_40_e20_B16__0__INShortcut_8l;
        v24[4] = *(void *)(a1 + 48);
        uint64_t v21 = objc_msgSend(v14, "if_objectsPassingTest:", v24);

        id v14 = (void *)v21;
      }
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v14;
}

BOOL __108__WFDatabase_ShortcutSuggestions__shortcutSuggestionsForAppWithBundleIdentifier_shortcutAvailability_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return (objc_msgSend(a2, "wf_shortcutAvailability") & v2) != 0;
}

- (BOOL)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFDatabase+ShortcutSuggestions.m", 71, @"Invalid parameter not satisfying: %@", @"shortcutSuggestions" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  unint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"WFDatabase+ShortcutSuggestions.m", 72, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:a5];
  if (v12)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke;
    v22[3] = &unk_1E654F790;
    v22[4] = v23;
    [v9 enumerateObjectsUsingBlock:v22];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke_2;
    v18[3] = &unk_1E654F7B8;
    v18[4] = self;
    id v19 = v11;
    id v20 = v12;
    uint64_t v21 = v23;
    id v13 = [(WFDatabase *)self performSuggestionsOperationWithBlock:v18 error:a5];
    char v14 = [v13 BOOLValue];

    _Block_object_dispose(v23, 8);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

uint64_t __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "wf_shortcutAvailability");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

id __91__WFDatabase_ShortcutSuggestions__setShortcutSuggestions_forAppWithBundleIdentifier_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [VCVoiceShortcutSuggestionListManagedObject alloc];
  uint64_t v5 = [*(id *)(a1 + 32) suggestionsContext];
  uint64_t v6 = [(VCVoiceShortcutSuggestionListManagedObject *)v4 initWithContext:v5];

  [(VCVoiceShortcutSuggestionListManagedObject *)v6 setAssociatedAppBundleIdentifier:*(void *)(a1 + 40)];
  [(VCVoiceShortcutSuggestionListManagedObject *)v6 setSerializedSuggestions:*(void *)(a1 + 48)];
  [(VCVoiceShortcutSuggestionListManagedObject *)v6 setShortcutAvailabilityOptions:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v7 = [*(id *)(a1 + 32) suggestionsContext];
  [v7 insertObject:v6];

  id v8 = *(void **)(a1 + 32);
  id v9 = [v8 suggestionsContext];
  uint64_t v10 = [v8 saveContextOrRollback:v9 error:a2];

  uint64_t v11 = [NSNumber numberWithBool:v10];

  return v11;
}

- (id)changedWorkflowIDsForSync
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WFCoreDataWorkflow fetchRequest];
  [v3 setReturnsObjectsAsFaults:0];
  v20[0] = @"workflowID";
  v20[1] = @"syncHash";
  v20[2] = @"lastSyncedHash";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v3 setPropertiesToFetch:v4];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %K", @"syncHash", @"lastSyncedHash");
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil && %K.@count == 0", @"conflictOf", @"conflicts");
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = [(WFDatabase *)self visiblePredicate];
  v19[0] = v8;
  v19[1] = v5;
  v19[2] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  uint64_t v10 = [v7 andPredicateWithSubpredicates:v9];
  [v3 setPredicate:v10];

  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:0];
  uint64_t v18 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v3 setSortDescriptors:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__WFDatabase_Sync__changedWorkflowIDsForSync__block_invoke;
  v16[3] = &unk_1E6553FB0;
  void v16[4] = self;
  id v17 = v3;
  id v13 = v3;
  char v14 = [(WFDatabase *)self performOperationWithReason:@"get changed workflow ids for sync" block:v16 error:0];

  return v14;
}

id __45__WFDatabase_Sync__changedWorkflowIDsForSync__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [v4 executeFetchRequest:*(void *)(a1 + 40) error:a2];

  uint64_t v6 = objc_msgSend(v5, "if_map:", &__block_literal_global_262);

  return v6;
}

uint64_t __45__WFDatabase_Sync__changedWorkflowIDsForSync__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 workflowID];
}

- (id)deletedWorkflowIDsForSync
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WFCoreDataWorkflow fetchRequest];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES AND (%K == nil OR %K == YES)", @"tombstoned", @"conflictOf", @"conflictOf.tombstoned");
  [v3 setPredicate:v4];

  uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v3 setSortDescriptors:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __45__WFDatabase_Sync__deletedWorkflowIDsForSync__block_invoke;
  v10[3] = &unk_1E6553FB0;
  v10[4] = self;
  id v11 = v3;
  id v7 = v3;
  id v8 = [(WFDatabase *)self performOperationWithReason:@"get deleted workflow ids for sync" block:v10 error:0];

  return v8;
}

id __45__WFDatabase_Sync__deletedWorkflowIDsForSync__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) context];
  uint64_t v5 = [v4 executeFetchRequest:*(void *)(a1 + 40) error:a2];

  uint64_t v6 = objc_msgSend(v5, "if_map:", &__block_literal_global_26346);

  return v6;
}

uint64_t __45__WFDatabase_Sync__deletedWorkflowIDsForSync__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 workflowID];
}

- (id)syncToken
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__WFDatabase_Sync__syncToken__block_invoke;
  v4[3] = &unk_1E6550F78;
  v4[4] = self;
  uint64_t v2 = [(WFDatabase *)self performOperationWithReason:@"getting sync token" block:v4 error:0];
  return v2;
}

WFCloudKitSyncToken *__29__WFDatabase_Sync__syncToken__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _syncTokenWithError:a2];
  if (v2) {
    uint64_t v3 = [(WFRecord *)[WFCloudKitSyncToken alloc] initWithStorage:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)setSyncToken:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __33__WFDatabase_Sync__setSyncToken___block_invoke;
  v10[3] = &unk_1E6558A40;
  v10[4] = self;
  id v5 = v4;
  id v11 = v5;
  id v9 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"set sync token" block:v10 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[WFDatabase(Sync) setSyncToken:]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to set sync token: %@", buf, 0x16u);
    }
  }
}

void __33__WFDatabase_Sync__setSyncToken___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _syncTokenWithError:a2];
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if (!v3)
    {
      id v5 = [WFCoreDataCloudKitSyncToken alloc];
      id v6 = [*(id *)(a1 + 32) context];
      id v8 = [(WFCoreDataCloudKitSyncToken *)v5 initWithContext:v6];

      uint64_t v3 = (uint64_t)v8;
      id v4 = *(void **)(a1 + 40);
    }
    id v9 = (id)v3;
    [v4 writeToStorage:v3 error:0];
  }
  else
  {
    if (!v3) {
      return;
    }
    id v9 = (id)v3;
    id v7 = [*(id *)(a1 + 32) context];
    [v7 deleteObject:v9];
  }
}

- (void)trackMetricsForToggleType:(unint64_t)a3 source:(unint64_t)a4 bundleIdentifier:(id)a5 isEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(WFAutoShortcutToggleEvent);
  id v15 = v10;
  id v11 = @"Siri";
  if (a4 == 1) {
    id v11 = @"Spotlight";
  }
  if (a4 == 2) {
    id v12 = @"Shortcuts";
  }
  else {
    id v12 = v11;
  }
  [(WFAutoShortcutToggleEvent *)v10 setSource:v12];
  id v13 = @"AppSiri";
  if (a3 == 1) {
    id v13 = @"AppSpotlight";
  }
  if (a3 == 2) {
    __int16 v14 = @"Spotlight";
  }
  else {
    __int16 v14 = v13;
  }
  [(WFAutoShortcutToggleEvent *)v15 setToggleType:v14];
  [(WFAutoShortcutToggleEvent *)v15 setEnabled:v6];
  [(WFAutoShortcutToggleEvent *)v15 setBundleIdentifier:v9];

  [(WFEvent *)v15 track];
}

- (BOOL)deleteAutoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v14 = "-[WFDatabase(AutoShortcutsPreferences) deleteAutoShortcutsPreferencesForIdentifier:error:]";
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Deleting auto shortcut preferences with identifier: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __90__WFDatabase_AutoShortcutsPreferences__deleteAutoShortcutsPreferencesForIdentifier_error___block_invoke;
  void v11[3] = &unk_1E65512D0;
  void v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = [(WFDatabase *)self performSaveOperationWithReason:@"deleting auto shortcut preferences by id" block:v11 error:a4];

  return a4 == 0;
}

uint64_t __90__WFDatabase_AutoShortcutsPreferences__deleteAutoShortcutsPreferencesForIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) coreDataAutoShortcutsPreferencesForIdentifier:*(void *)(a1 + 40) error:a2];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) context];
    [v4 deleteObject:v3];
  }
  return 0;
}

- (BOOL)mergeAutoShortcutsPreferencesWithNewPreferences:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]";
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Merging local auto shortcuts preferences with new preferences", buf, 0xCu);
  }

  id v8 = [v6 appDescriptor];
  if (v8)
  {
    id v9 = [v6 appDescriptor];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __94__WFDatabase_AutoShortcutsPreferences__mergeAutoShortcutsPreferencesWithNewPreferences_error___block_invoke;
    v13[3] = &unk_1E65512A8;
    id v14 = v6;
    __int16 v15 = a4;
    uint64_t v10 = [(WFDatabase *)self saveAutoShortcutsPreferencesForAppDescriptor:v9 update:v13 error:a4];
    BOOL v11 = v10 != 0;
  }
  else
  {
    id v9 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v17 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Attempting to merge auto shortcuts preferences but app descriptor is nil; skipping merge",
        buf,
        0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

void __94__WFDatabase_AutoShortcutsPreferences__mergeAutoShortcutsPreferencesWithNewPreferences_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 disabledAutoShortcuts];
  id v5 = +[WFDatabase disabledAutoShortcutsFromData:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v5];
  id v7 = [*(id *)(a1 + 32) disabledAutoShortcuts];
  id v8 = (id)[v6 setByAddingObjectsFromSet:v7];

  id v9 = +[WFDatabase dataFromObject:v6 error:*(void *)(a1 + 40)];
  [v3 setDisabledAutoShortcuts:v9];

  if ([v3 siriEnabled]) {
    uint64_t v10 = [*(id *)(a1 + 32) isSiriEnabled];
  }
  else {
    uint64_t v10 = 0;
  }
  [v3 setSiriEnabled:v10];
  if ([v3 spotlightEnabled]) {
    uint64_t v11 = [*(id *)(a1 + 32) isSpotlightEnabled];
  }
  else {
    uint64_t v11 = 0;
  }
  [v3 setSpotlightEnabled:v11];
  id v12 = [v3 cloudKitMetadata];
  id v13 = [*(id *)(a1 + 32) cloudKitMetadata];
  id v14 = +[WFCloudKitItemRequest recordFromSystemFieldsData:v13 error:0];
  if (v12)
  {
    __int16 v15 = +[WFCloudKitItemRequest recordFromSystemFieldsData:v12 error:0];
    id v16 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315650;
      uint64_t v18 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v15;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s CloudKit metadata exists for auto shortcuts preferences. Existing record: %{public}@, new record: %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    __int16 v15 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[WFDatabase(AutoShortcutsPreferences) mergeAutoShortcutsPreferencesWithNewPreferences:error:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_INFO, "%s No existing CloudKit metadata for auto shortcuts preferences - setting incoming metdata. New record: %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }

  [v3 setCloudKitMetadata:v13];
}

- (BOOL)updateAutoShortcutsPreferencesWithNewPreferences:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    int v17 = "-[WFDatabase(AutoShortcutsPreferences) updateAutoShortcutsPreferencesWithNewPreferences:error:]";
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Updating local auto shortcuts preferences with new preferences", buf, 0xCu);
  }

  id v8 = [v6 appDescriptor];
  if (v8)
  {
    id v9 = [v6 appDescriptor];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __95__WFDatabase_AutoShortcutsPreferences__updateAutoShortcutsPreferencesWithNewPreferences_error___block_invoke;
    v13[3] = &unk_1E65512A8;
    id v14 = v6;
    __int16 v15 = a4;
    uint64_t v10 = [(WFDatabase *)self saveAutoShortcutsPreferencesForAppDescriptor:v9 update:v13 error:a4];
    BOOL v11 = v10 != 0;
  }
  else
  {
    id v9 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      int v17 = "-[WFDatabase(AutoShortcutsPreferences) updateAutoShortcutsPreferencesWithNewPreferences:error:]";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Attempting to update auto shortcuts preferences but app descriptor is nil; skipping update",
        buf,
        0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

void __95__WFDatabase_AutoShortcutsPreferences__updateAutoShortcutsPreferencesWithNewPreferences_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) appDescriptor];
    id v5 = +[WFDatabase dataFromObject:v4 error:*(void *)(a1 + 40)];
    [v3 setAppDescriptor:v5];

    id v6 = [*(id *)(a1 + 32) appName];
    [v3 setAppName:v6];

    id v7 = [*(id *)(a1 + 32) disabledAutoShortcuts];
    id v8 = +[WFDatabase dataFromObject:v7 error:*(void *)(a1 + 40)];
    [v3 setDisabledAutoShortcuts:v8];

    objc_msgSend(v3, "setSiriEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSiriEnabled"));
    objc_msgSend(v3, "setSpotlightEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSpotlightEnabled"));
    id v9 = [*(id *)(a1 + 32) cloudKitMetadata];
    [v3 setCloudKitMetadata:v9];

    objc_msgSend(v3, "setLastSyncedHash:", objc_msgSend(*(id *)(a1 + 32), "lastSyncedHash"));
  }
  else
  {
    uint64_t v10 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[WFDatabase(AutoShortcutsPreferences) updateAutoShortcutsPreferencesWithNewPreferences:error:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Attempting to update auto shortcuts preferences but they were not created because app descriptor is nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)defaultCoreDataAutoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[WFAutoShortcutsPreferences defaultSettingsForAppDescriptor:v6];
  id v8 = [WFCoreDataAutoShortcutsPreferences alloc];
  id v9 = [(WFDatabase *)self context];
  uint64_t v10 = [(WFCoreDataAutoShortcutsPreferences *)v8 initWithContext:v9];

  int v11 = +[WFDatabase identifierForAppDescriptor:v6];

  [(WFCoreDataAutoShortcutsPreferences *)v10 setIdentifier:v11];
  id v12 = [v7 appDescriptor];
  uint64_t v13 = +[WFDatabase dataFromObject:v12 error:a4];
  [(WFCoreDataAutoShortcutsPreferences *)v10 setAppDescriptor:v13];

  id v14 = [v7 appName];
  [(WFCoreDataAutoShortcutsPreferences *)v10 setAppName:v14];

  __int16 v15 = [v7 disabledAutoShortcuts];
  id v16 = +[WFDatabase dataFromObject:v15 error:a4];
  [(WFCoreDataAutoShortcutsPreferences *)v10 setDisabledAutoShortcuts:v16];

  -[WFCoreDataAutoShortcutsPreferences setSiriEnabled:](v10, "setSiriEnabled:", [v7 isSiriEnabled]);
  -[WFCoreDataAutoShortcutsPreferences setSpotlightEnabled:](v10, "setSpotlightEnabled:", [v7 isSpotlightEnabled]);

  return v10;
}

- (id)saveAutoShortcutsPreferencesForAppDescriptor:(id)a3 update:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFDatabase+AutoShortcutsPreferences.m", 209, @"Invalid parameter not satisfying: %@", @"appDescriptor" object file lineNumber description];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__WFDatabase_AutoShortcutsPreferences__saveAutoShortcutsPreferencesForAppDescriptor_update_error___block_invoke;
  v16[3] = &unk_1E6551280;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  uint64_t v13 = [(WFDatabase *)self performSaveOperationWithReason:@"saving auto shortcut preferences for app" block:v16 error:a5];

  return v13;
}

id __98__WFDatabase_AutoShortcutsPreferences__saveAutoShortcutsPreferencesForAppDescriptor_update_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) coreDataAutoShortcutsPreferencesForAppDescriptor:*(void *)(a1 + 40) error:a2];
  if (!v4)
  {
    id v4 = [*(id *)(a1 + 32) defaultCoreDataAutoShortcutsPreferencesForAppDescriptor:*(void *)(a1 + 40) error:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  return v4;
}

- (BOOL)setAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutDisabled:(BOOL)a4 autoShortcutIdentifier:(id)a5 source:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a4;
  BOOL v12 = !a4;
  id v13 = a5;
  id v14 = a3;
  [(WFDatabase *)self trackMetricsForToggleType:2 source:a6 bundleIdentifier:v14 isEnabled:v12];
  __int16 v15 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:v14];

  LOBYTE(a7) = [(WFDatabase *)self setAutoShortcutDisabledForAppDescriptor:v15 autoShortcutDisabled:v9 autoShortcutIdentifier:v13 error:a7];
  return (char)a7;
}

- (BOOL)setAutoShortcutDisabledForAppDescriptor:(id)a3 autoShortcutDisabled:(BOOL)a4 autoShortcutIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  BOOL v12 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v22 = "-[WFDatabase(AutoShortcutsPreferences) setAutoShortcutDisabledForAppDescriptor:autoShortcutDisabled:autoShortc"
          "utIdentifier:error:]";
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Setting disabled auto shortcuts", buf, 0xCu);
  }

  if (v10)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __130__WFDatabase_AutoShortcutsPreferences__setAutoShortcutDisabledForAppDescriptor_autoShortcutDisabled_autoShortcutIdentifier_error___block_invoke;
    v17[3] = &unk_1E6551258;
    BOOL v20 = a4;
    id v18 = v11;
    __int16 v19 = a6;
    id v13 = [(WFDatabase *)self saveAutoShortcutsPreferencesForAppDescriptor:v10 update:v17 error:a6];
    BOOL v14 = v13 != 0;

    __int16 v15 = v18;
  }
  else
  {
    __int16 v15 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v22 = "-[WFDatabase(AutoShortcutsPreferences) setAutoShortcutDisabledForAppDescriptor:autoShortcutDisabled:autoShor"
            "tcutIdentifier:error:]";
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Attempting to set disabled auto shortcuts but app descriptor is nil; skipping update",
        buf,
        0xCu);
    }
    BOOL v14 = 0;
  }

  return v14;
}

void __130__WFDatabase_AutoShortcutsPreferences__setAutoShortcutDisabledForAppDescriptor_autoShortcutDisabled_autoShortcutIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 disabledAutoShortcuts];
  id v11 = +[WFDatabase disabledAutoShortcutsFromData:v4];

  id v5 = (void *)[v11 mutableCopy];
  int v6 = [v11 containsObject:*(void *)(a1 + 32)];
  int v7 = v6;
  int v8 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48) && (v6 & 1) == 0)
  {
    [v5 addObject:*(void *)(a1 + 32)];
    int v8 = *(unsigned __int8 *)(a1 + 48);
  }
  if (v8) {
    int v9 = 0;
  }
  else {
    int v9 = v7;
  }
  if (v9 == 1) {
    [v5 removeObject:*(void *)(a1 + 32)];
  }
  id v10 = +[WFDatabase dataFromObject:v5 error:*(void *)(a1 + 40)];
  [v3 setDisabledAutoShortcuts:v10];
}

- (BOOL)isAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:a3];
  id v12 = 0;
  BOOL v8 = [(WFDatabase *)self isAutoShortcutDisabledForAppDescriptor:v7 autoShortcutIdentifier:v6 error:&v12];

  id v9 = v12;
  if (v9)
  {
    id v10 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      BOOL v14 = "-[WFDatabase(AutoShortcutsPreferences) isAutoShortcutDisabledForBundleIdentifier:autoShortcutIdentifier:]";
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Error fetching auto shortcut disabled: %{public}@", buf, 0x16u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isAutoShortcutDisabledForBundleIdentifier:(id)a3 autoShortcutIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:a3];
  LOBYTE(a5) = [(WFDatabase *)self isAutoShortcutDisabledForAppDescriptor:v9 autoShortcutIdentifier:v8 error:a5];

  return (char)a5;
}

- (BOOL)isAutoShortcutDisabledForAppDescriptor:(id)a3 autoShortcutIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(WFDatabase *)self autoShortcutsPreferencesForAppDescriptor:a3 error:a5];
  id v10 = [v9 disabledAutoShortcuts];
  LOBYTE(self) = [v10 containsObject:v8];

  return (char)self;
}

- (BOOL)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  [(WFDatabase *)self trackMetricsForToggleType:1 source:a5 bundleIdentifier:v10 isEnabled:v8];
  id v11 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:v10];

  LOBYTE(a6) = [(WFDatabase *)self setSpotlightAutoShortcutsEnablement:v8 forAppDescriptor:v11 error:a6];
  return (char)a6;
}

- (BOOL)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forAppDescriptor:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[WFDatabase(AutoShortcutsPreferences) setSpotlightAutoShortcutsEnablement:forAppDescriptor:error:]";
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_INFO, "%s Setting Spotlight auto shortcuts enablement", buf, 0xCu);
  }

  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __99__WFDatabase_AutoShortcutsPreferences__setSpotlightAutoShortcutsEnablement_forAppDescriptor_error___block_invoke;
    v13[3] = &__block_descriptor_33_e44_v16__0__WFCoreDataAutoShortcutsPreferences_8l;
    BOOL v14 = a3;
    id v10 = [(WFDatabase *)self saveAutoShortcutsPreferencesForAppDescriptor:v8 update:v13 error:a5];
    BOOL v11 = v10 != 0;
  }
  else
  {
    id v10 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v16 = "-[WFDatabase(AutoShortcutsPreferences) setSpotlightAutoShortcutsEnablement:forAppDescriptor:error:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Attempting to set Spotlight auto shortcuts enablement but app descriptor is nil; skipping update",
        buf,
        0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __99__WFDatabase_AutoShortcutsPreferences__setSpotlightAutoShortcutsEnablement_forAppDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSpotlightEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  BOOL v3 = [(WFDatabase *)self isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:a3 error:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v9 = "-[WFDatabase(AutoShortcutsPreferences) isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:]";
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Error fetching Spotlight auto shortcuts preference from the database: %{public}@", buf, 0x16u);
    }
  }
  return v3;
}

- (BOOL)isSpotlightEnabledForAutoShortcutsWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:a3];
  LOBYTE(a4) = [(WFDatabase *)self isSpotlightEnabledForAutoShortcutsWithAppDescriptor:v6 error:a4];

  return (char)a4;
}

- (BOOL)isSpotlightEnabledForAutoShortcutsWithAppDescriptor:(id)a3 error:(id *)a4
{
  id v4 = [(WFDatabase *)self autoShortcutsPreferencesForAppDescriptor:a3 error:a4];
  char v5 = [v4 isSpotlightEnabled];

  return v5;
}

- (BOOL)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  [(WFDatabase *)self trackMetricsForToggleType:0 source:a5 bundleIdentifier:v10 isEnabled:v8];
  id v11 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:v10];

  LOBYTE(a6) = [(WFDatabase *)self setSiriAutoShortcutsEnablement:v8 forAppDescriptor:v11 error:a6];
  return (char)a6;
}

- (BOOL)setSiriAutoShortcutsEnablement:(BOOL)a3 forAppDescriptor:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[WFDatabase(AutoShortcutsPreferences) setSiriAutoShortcutsEnablement:forAppDescriptor:error:]";
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_INFO, "%s Setting Siri auto shortcuts enablement", buf, 0xCu);
  }

  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __94__WFDatabase_AutoShortcutsPreferences__setSiriAutoShortcutsEnablement_forAppDescriptor_error___block_invoke;
    v13[3] = &__block_descriptor_33_e44_v16__0__WFCoreDataAutoShortcutsPreferences_8l;
    BOOL v14 = a3;
    id v10 = [(WFDatabase *)self saveAutoShortcutsPreferencesForAppDescriptor:v8 update:v13 error:a5];
    BOOL v11 = v10 != 0;
  }
  else
  {
    id v10 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v16 = "-[WFDatabase(AutoShortcutsPreferences) setSiriAutoShortcutsEnablement:forAppDescriptor:error:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Attempting to set Siri auto shortcuts enablement but app descriptor is nil; skipping setting",
        buf,
        0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __94__WFDatabase_AutoShortcutsPreferences__setSiriAutoShortcutsEnablement_forAppDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSiriEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isSiriEnabledForAutoShortcutsWithBundleIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  BOOL v3 = [(WFDatabase *)self isSiriEnabledForAutoShortcutsWithBundleIdentifier:a3 error:&v7];
  id v4 = v7;
  if (v4)
  {
    char v5 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v9 = "-[WFDatabase(AutoShortcutsPreferences) isSiriEnabledForAutoShortcutsWithBundleIdentifier:]";
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Error fetching Siri auto shortcuts preference from the database: %{public}@", buf, 0x16u);
    }
  }
  return v3;
}

- (BOOL)isSiriEnabledForAutoShortcutsWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:a3];
  LOBYTE(a4) = [(WFDatabase *)self isSiriEnabledForAutoShortcutsWithAppDescriptor:v6 error:a4];

  return (char)a4;
}

- (BOOL)isSiriEnabledForAutoShortcutsWithAppDescriptor:(id)a3 error:(id *)a4
{
  id v4 = [(WFDatabase *)self autoShortcutsPreferencesForAppDescriptor:a3 error:a4];
  char v5 = [v4 isSiriEnabled];

  return v5;
}

- (id)coreDataAutoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[WFCoreDataAutoShortcutsPreferences fetchRequest];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v6];

  [v7 setPredicate:v8];
  [v7 setFetchLimit:1];
  id v9 = [(WFDatabase *)self context];
  __int16 v10 = [v9 executeFetchRequest:v7 error:a4];

  id v11 = [v10 firstObject];

  return v11;
}

- (id)coreDataAutoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4
{
  id v6 = +[WFDatabase identifierForAppDescriptor:a3];
  id v7 = [(WFDatabase *)self coreDataAutoShortcutsPreferencesForIdentifier:v6 error:a4];

  return v7;
}

- (id)autoShortcutsPreferencesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = +[WFAutoShortcutsPreferences appDescriptorWithBundleIdentifier:a3];
  id v7 = [(WFDatabase *)self autoShortcutsPreferencesForAppDescriptor:v6 error:a4];

  return v7;
}

- (id)autoShortcutsPreferencesFromCoreDataAutoShortcutsPreferences:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 appDescriptor];
    char v5 = +[WFDatabase appDescriptorFromData:v4];

    id v6 = [v3 disabledAutoShortcuts];
    id v7 = +[WFDatabase disabledAutoShortcutsFromData:v6];

    id v8 = [WFAutoShortcutsPreferences alloc];
    uint64_t v9 = [v3 siriEnabled];
    uint64_t v10 = [v3 spotlightEnabled];
    id v11 = [v3 cloudKitMetadata];
    uint64_t v12 = [v3 lastSyncedHash];

    id v13 = [(WFAutoShortcutsPreferences *)v8 initWithAppDescriptor:v5 isSiriEnabled:v9 isSpotlightEnabled:v10 disabledAutoShortcuts:v7 cloudKitMetadata:v11 lastSyncedHash:v12];
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (id)autoShortcutsPreferencesForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __84__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForIdentifier_error___block_invoke;
  v10[3] = &unk_1E6551210;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(WFDatabase *)self performOperationWithReason:@"getting auto shortcut preferences for id" block:v10 error:a4];

  return v8;
}

id __84__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) coreDataAutoShortcutsPreferencesForIdentifier:*(void *)(a1 + 40) error:a2];
  id v4 = [*(id *)(a1 + 32) autoShortcutsPreferencesFromCoreDataAutoShortcutsPreferences:v3];

  return v4;
}

- (id)autoShortcutsPreferencesForAppDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __87__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForAppDescriptor_error___block_invoke;
  v10[3] = &unk_1E6551210;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(WFDatabase *)self performOperationWithReason:@"getting auto shortcut preferences for app" block:v10 error:a4];

  return v8;
}

id __87__WFDatabase_AutoShortcutsPreferences__autoShortcutsPreferencesForAppDescriptor_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) coreDataAutoShortcutsPreferencesForAppDescriptor:*(void *)(a1 + 40) error:a2];
  if (v3) {
    [*(id *)(a1 + 32) autoShortcutsPreferencesFromCoreDataAutoShortcutsPreferences:v3];
  }
  else {
  id v4 = +[WFAutoShortcutsPreferences defaultSettingsForAppDescriptor:*(void *)(a1 + 40)];
  }

  return v4;
}

+ (id)appDescriptorFromData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v11 = "+[WFDatabase(AutoShortcutsPreferences) appDescriptorFromData:]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Unarchiving app descriptor for auto shortcuts preferences", buf, 0xCu);
  }

  if (v3)
  {
    id v9 = 0;
    char v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v9];
    id v6 = v9;
    if (v6)
    {
      id v7 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v11 = "+[WFDatabase(AutoShortcutsPreferences) appDescriptorFromData:]";
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Unarchiving app descriptor for auto shortcuts preferences: failed with error %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v6 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v11 = "+[WFDatabase(AutoShortcutsPreferences) appDescriptorFromData:]";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Unarchiving app descriptor for auto shortcuts preferences: data is nil; returning nil app descriptor",
        buf,
        0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

+ (id)disabledAutoShortcutsFromData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Unarchiving disabled auto shortcuts", buf, 0xCu);
  }

  if (v3)
  {
    char v5 = objc_opt_new();
    id v26 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v26];
    id v7 = v26;
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    __int16 v12 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    id v13 = [v6 decodeObjectOfClasses:v12 forKey:*MEMORY[0x1E4F284E8]];
    if (v7)
    {
      uint64_t v14 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
        __int16 v29 = 2114;
        id v30 = v7;
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: failed with error %{public}@", buf, 0x16u);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v15 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
        __int16 v29 = 2114;
        id v30 = v13;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: found array %{public}@", buf, 0x16u);
      }

      id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_21;
        }
        uint64_t v22 = getWFDatabaseLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          id v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
          __int16 v29 = 2114;
          id v30 = v13;
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: found dictionary %{public}@", buf, 0x16u);
        }

        uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
        id v24 = v13;
        uint64_t v25 = [v24 allKeys];
        uint64_t v20 = [v23 setWithArray:v25];

        char v5 = (void *)v25;
LABEL_20:

        char v5 = (void *)v20;
LABEL_21:
        id v18 = v5;

        goto LABEL_22;
      }
      __int16 v19 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
        __int16 v29 = 2114;
        id v30 = v13;
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: found set %{public}@", buf, 0x16u);
      }

      id v16 = v13;
    }
    uint64_t v20 = (uint64_t)v16;
    goto LABEL_20;
  }
  uint64_t v17 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    id v28 = "+[WFDatabase(AutoShortcutsPreferences) disabledAutoShortcutsFromData:]";
    _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Unarchiving disabled auto shortcuts: data is nil; returning empty disabled auto shortcuts",
      buf,
      0xCu);
  }

  id v18 = (id)objc_opt_new();
LABEL_22:

  return v18;
}

+ (id)identifierForAppDescriptor:(id)a3
{
  uint64_t v3 = +[WFAutoShortcutsPreferences crossPlatformHashForAppDescriptor:a3];
  id v4 = [NSNumber numberWithInt:v3];
  char v5 = [v4 stringValue];

  return v5;
}

+ (id)dataFromObject:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

- (id)generateAndPersistUUIDForActionWithIdentifier:(id)a3 actionIndex:(unint64_t)a4 workflowIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v15 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__WFDatabase_SmartPrompts__generateAndPersistUUIDForActionWithIdentifier_actionIndex_workflowIdentifier___block_invoke;
  v16[3] = &unk_1E6551530;
  id v17 = v9;
  id v18 = self;
  id v19 = v8;
  unint64_t v20 = a4;
  id v10 = v8;
  id v11 = v9;
  __int16 v12 = [(WFDatabase *)self performSaveOperationWithReason:@"generating UUID for action" block:v16 error:&v15];
  id v13 = v15;

  return v12;
}

id __105__WFDatabase_SmartPrompts__generateAndPersistUUIDForActionWithIdentifier_actionIndex_workflowIdentifier___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = +[WFCoreDataWorkflowActions fetchRequest];
  char v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"shortcut.workflowID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  [v4 setFetchLimit:1];
  id v6 = [*(id *)(a1 + 40) context];
  id v7 = [v6 executeFetchRequest:v4 error:a2];

  id v8 = [v7 firstObject];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 data];
    if (v10)
    {
      id v31 = 0;
      id v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:1 format:0 error:&v31];
      id v12 = v31;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v13 = [v11 objectAtIndex:*(void *)(a1 + 56)];
        id v30 = [v13 objectForKey:@"WFWorkflowActionIdentifier"];
        if ([v30 isEqualToString:*(void *)(a1 + 48)])
        {
          __int16 v29 = v13;
          uint64_t v14 = [v13 objectForKey:@"WFWorkflowActionParameters"];
          if (!v14)
          {
            id v15 = getWFWorkflowExecutionLogObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v16 = *(void *)(a1 + 48);
              *(_DWORD *)long long buf = 136315394;
              long long v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentif"
                    "ier:]_block_invoke";
              __int16 v34 = 2114;
              uint64_t v35 = v16;
              _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEBUG, "%s Action %{public}@ does not have WFWorkflowActionParameters, creating dictionary", buf, 0x16u);
            }

            uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
            [v29 setObject:v14 forKey:@"WFWorkflowActionParameters"];
          }
          id v17 = [v14 objectForKey:@"UUID"];
          id v18 = v17;
          if (v17)
          {
            id v19 = v17;
          }
          else
          {
            id v28 = [MEMORY[0x1E4F29128] UUID];
            id v19 = [v28 UUIDString];

            [v14 setObject:v19 forKey:@"UUID"];
            id v26 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:a2];
            [v9 setData:v26];
          }
          id v13 = v29;
        }
        else
        {
          uint64_t v25 = getWFWorkflowExecutionLogObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            long long v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifie"
                  "r:]_block_invoke";
            _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s actionIdentifier mismatch found, result won't be saved", buf, 0xCu);
          }

          uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
          id v19 = [v14 UUIDString];
        }
      }
      else
      {

        uint64_t v22 = getWFSecurityLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = *a2;
          *(_DWORD *)long long buf = 136315394;
          long long v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:]_block_invoke";
          __int16 v34 = 2114;
          uint64_t v35 = v23;
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Could not deserialize actions from plist: %{public}@", buf, 0x16u);
        }

        id v11 = [MEMORY[0x1E4F29128] UUID];
        id v19 = [v11 UUIDString];
      }
    }
    else
    {
      id v24 = getWFSecurityLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_ERROR, "%s No NSData found on WFCoreDataWorkflowActions object.", buf, 0xCu);
      }

      id v12 = [MEMORY[0x1E4F29128] UUID];
      id v19 = [v12 UUIDString];
    }
  }
  else
  {
    unint64_t v20 = getWFSecurityLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 136315394;
      long long v33 = "-[WFDatabase(SmartPrompts) generateAndPersistUUIDForActionWithIdentifier:actionIndex:workflowIdentifier:]_block_invoke";
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s No WFCoreDataWorkflowActions object found for workflow with identifier %@.", buf, 0x16u);
    }

    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v19 = [v10 UUIDString];
  }

  return v19;
}

- (void)deleteAllDeletionAuthorizationsForReference:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __72__WFDatabase_SmartPrompts__deleteAllDeletionAuthorizationsForReference___block_invoke;
  v10[3] = &unk_1E6558A40;
  v10[4] = self;
  id v5 = v4;
  id v11 = v5;
  id v9 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"delete all deletion authorizations" block:v10 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[WFDatabase(SmartPrompts) deleteAllDeletionAuthorizationsForReference:]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to delete all per-workflow smart prompt data: %@", buf, 0x16u);
    }
  }
}

void __72__WFDatabase_SmartPrompts__deleteAllDeletionAuthorizationsForReference___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v4 = objc_opt_class();
  id v5 = WFEnforceClass(v3, v4);

  id v6 = [v5 smartPromptPermissions];
  id v7 = (void *)[v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  id v10 = v9;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v17 = [v16 data];
        id v18 = +[WFDeletionAuthorizationState stateFromDatabaseData:v17];

        if (v18)
        {
          id v19 = [*(id *)(a1 + 32) context];
          [v19 deleteObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v13);
  }

  unint64_t v20 = *(void **)(a1 + 32);
  uint64_t v27 = @"smartPromptPermissions";
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v27 count:1];

  [v20 object:v5 didUpdateProperties:v21 error:a2];
}

- (void)deleteAllSmartPromptStateDataForReference:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __70__WFDatabase_SmartPrompts__deleteAllSmartPromptStateDataForReference___block_invoke;
  v10[3] = &unk_1E6558A40;
  v10[4] = self;
  id v5 = v4;
  id v11 = v5;
  id v9 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"delete all smart prompt states" block:v10 error:&v9];
  id v6 = v9;
  if (v6)
  {
    id v7 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v13 = "-[WFDatabase(SmartPrompts) deleteAllSmartPromptStateDataForReference:]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to delete all per-workflow smart prompt data: %@", buf, 0x16u);
    }
  }
}

void __70__WFDatabase_SmartPrompts__deleteAllSmartPromptStateDataForReference___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = WFEnforceClass(v4, v5);

  id v7 = +[WFCoreDataSmartPromptPermission fetchRequest];
  long long v23 = (void *)v6;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"shortcut", v6];
  [v7 setPredicate:v8];

  id v9 = [*(id *)(a1 + 32) context];
  uint64_t v22 = v7;
  uint64_t v24 = a2;
  id v10 = [v9 executeFetchRequest:v7 error:a2];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v17 = getWFWorkflowExecutionLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          id v18 = [v16 actionUUID];
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[WFDatabase(SmartPrompts) deleteAllSmartPromptStateDataForReference:]_block_invoke";
          __int16 v30 = 2114;
          id v31 = v18;
          _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEBUG, "%s Deleting smart prompt permission with actionUUID: %{public}@", buf, 0x16u);
        }
        id v19 = [*(id *)(a1 + 32) context];
        [v19 deleteObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v13);
  }

  unint64_t v20 = *(void **)(a1 + 32);
  *(void *)long long buf = @"smartPromptPermissions";
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

  [v20 object:v23 didUpdateProperties:v21 error:v24];
}

- (void)deleteSmartPromptStatesForDeletedActionUUIDs:(id)a3 forReference:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__WFDatabase_SmartPrompts__deleteSmartPromptStatesForDeletedActionUUIDs_forReference___block_invoke;
  void v14[3] = &unk_1E6558490;
  void v14[4] = self;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v13 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"delete smart prompt state for deleted actions" block:v14 error:&v13];
  id v10 = v13;
  if (v10)
  {
    id v11 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v10 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[WFDatabase(SmartPrompts) deleteSmartPromptStatesForDeletedActionUUIDs:forReference:]";
      __int16 v19 = 2112;
      unint64_t v20 = v12;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Unable to delete smart prompt data upon action deletion: %@", buf, 0x16u);
    }
  }
}

void __86__WFDatabase_SmartPrompts__deleteSmartPromptStatesForDeletedActionUUIDs_forReference___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = WFEnforceClass(v4, v5);

  id v7 = +[WFCoreDataSmartPromptPermission fetchRequest];
  long long v23 = (void *)v6;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@ AND %K IN %@", @"shortcut", v6, @"actionUUID", *(void *)(a1 + 48)];
  [v7 setPredicate:v8];

  id v9 = [*(id *)(a1 + 32) context];
  uint64_t v22 = v7;
  uint64_t v24 = a2;
  id v10 = [v9 executeFetchRequest:v7 error:a2];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v17 = getWFWorkflowExecutionLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          id v18 = [v16 actionUUID];
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[WFDatabase(SmartPrompts) deleteSmartPromptStatesForDeletedActionUUIDs:forReference:]_block_invoke";
          __int16 v30 = 2114;
          id v31 = v18;
          _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEBUG, "%s Deleting smart prompt permission with actionUUID: %{public}@", buf, 0x16u);
        }
        __int16 v19 = [*(id *)(a1 + 32) context];
        [v19 deleteObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v13);
  }

  unint64_t v20 = *(void **)(a1 + 32);
  *(void *)long long buf = @"smartPromptPermissions";
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

  [v20 object:v23 didUpdateProperties:v21 error:v24];
}

- (void)_deleteSmartPromptState:(id)a3 forReference:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WFDatabase *)self objectForDescriptor:a4 properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v8 = objc_opt_class();
  id v9 = WFEnforceClass(v7, v8);

  uint64_t v24 = v9;
  id v10 = [v9 smartPromptPermissions];
  id v11 = (void *)[v10 mutableCopy];
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  uint64_t v14 = v13;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        unint64_t v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v21 = [v20 data];
        uint64_t v22 = +[WFSmartPromptState stateFromDatabaseData:v21];

        if ([v22 matches:v6])
        {
          long long v23 = [(WFDatabase *)self context];
          [v23 deleteObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }
}

- (void)deleteSmartPromptState:(id)a3 forReference:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__WFDatabase_SmartPrompts__deleteSmartPromptState_forReference___block_invoke;
  void v14[3] = &unk_1E6558490;
  void v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v13 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"delete smart prompt state" block:v14 error:&v13];
  id v10 = v13;
  if (v10)
  {
    id v11 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v10 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v18 = "-[WFDatabase(SmartPrompts) deleteSmartPromptState:forReference:]";
      __int16 v19 = 2112;
      unint64_t v20 = v12;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Unable to delete smart prompt state: %@", buf, 0x16u);
    }
  }
}

uint64_t __64__WFDatabase_SmartPrompts__deleteSmartPromptState_forReference___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSmartPromptState:*(void *)(a1 + 40) forReference:*(void *)(a1 + 48)];
}

- (void)_updateDeletionAuthorizationsToMatchAuthorization:(id)a3 forWorkflow:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v24 = [v5 status];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v23 = v6;
  id v8 = [v6 smartPromptPermissions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = [v13 data];
        id v15 = +[WFDeletionAuthorizationState stateFromDatabaseData:v14];

        if (v15)
        {
          id v16 = [v15 contentItemClassName];
          uint64_t v17 = [v7 contentItemClassName];
          int v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            __int16 v19 = objc_msgSend(v15, "stateWithStatus:count:", v24, objc_msgSend(v15, "count"));
            id v25 = 0;
            unint64_t v20 = [v19 databaseDataWithError:&v25];
            id v21 = v25;
            [v13 setData:v20];

            if (v21)
            {
              uint64_t v22 = getWFSecurityLogObject();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315394;
                id v31 = "-[WFDatabase(SmartPrompts) _updateDeletionAuthorizationsToMatchAuthorization:forWorkflow:]";
                __int16 v32 = 2112;
                id v33 = v21;
                _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to generate deletion authorization state data upon grouping: %@", buf, 0x16u);
              }
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v10);
  }
}

- (void)_updateStatesToMatchSmartPromptState:(id)a3 forWorkflow:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = getWFSecurityLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v6 smartPromptPermissions];
    *(_DWORD *)long long buf = 136315650;
    int64_t v51 = "-[WFDatabase(SmartPrompts) _updateStatesToMatchSmartPromptState:forWorkflow:]";
    __int16 v52 = 2048;
    uint64_t v53 = [v8 count];
    __int16 v54 = 2114;
    id v55 = v5;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s Grouping: updating %lu permissions to match %{public}@", buf, 0x20u);
  }
  id v39 = [v5 status];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v38 = v6;
  id obj = [v6 smartPromptPermissions];
  uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    uint64_t v40 = *(void *)v46;
    do
    {
      uint64_t v12 = 0;
      uint64_t v42 = v10;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
        uint64_t v14 = [v13 data];
        id v15 = +[WFSmartPromptState stateFromDatabaseData:v14];

        if (v15)
        {
          id v16 = [v15 mode];
          int v17 = [v16 isEqualToString:@"Normal"];

          if (v17)
          {
            id v18 = [v15 sourceContentAttribution];
            __int16 v19 = [v18 origin];
            unint64_t v20 = v5;
            id v21 = [v5 sourceContentAttribution];
            uint64_t v22 = [v21 origin];
            long long v23 = v19;
            uint64_t v24 = v22;
            id v25 = v24;
            if (v23 == v24)
            {

              goto LABEL_24;
            }
            if (v23) {
              BOOL v26 = v24 == 0;
            }
            else {
              BOOL v26 = 1;
            }
            if (v26)
            {
            }
            else
            {
              int v33 = [v23 isEqual:v24];

              if (v33)
              {
LABEL_24:
                __int16 v34 = [v15 contentDestination];
                id v5 = v20;
                uint64_t v35 = [v20 contentDestination];
                char v41 = [v34 isEqual:v35];

                uint64_t v11 = v40;
                uint64_t v10 = v42;
                if ((v41 & 1) == 0) {
                  goto LABEL_31;
                }
LABEL_25:
                uint64_t v36 = [v15 stateWithStatus:v39];
                id v44 = 0;
                int64_t v37 = [v36 databaseDataWithError:&v44];
                id v18 = v44;
                [v13 setData:v37];

                if (v18)
                {
                  long long v23 = getWFSecurityLogObject();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 136315394;
                    int64_t v51 = "-[WFDatabase(SmartPrompts) _updateStatesToMatchSmartPromptState:forWorkflow:]";
                    __int16 v52 = 2112;
                    uint64_t v53 = (uint64_t)v18;
                    _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s Failed to generate database data for smart prompt state upon grouping: %@", buf, 0x16u);
                  }
LABEL_29:

                  uint64_t v10 = v42;
                }

                goto LABEL_31;
              }
            }

            id v5 = v20;
            uint64_t v11 = v40;
            goto LABEL_29;
          }
          long long v27 = [v15 mode];
          if ([v27 isEqualToString:@"UserWildcard"])
          {
          }
          else
          {
            long long v28 = [v15 mode];
            int v29 = [v28 isEqualToString:@"ActionWildcard"];

            if (!v29) {
              goto LABEL_31;
            }
          }
          uint64_t v30 = [v15 contentDestination];
          id v31 = [v5 contentDestination];
          int v32 = [v30 isEqual:v31];

          if (v32) {
            goto LABEL_25;
          }
        }
LABEL_31:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v10);
  }
}

- (void)_saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 forWorkflow:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v36 = +[WFDeletionAuthorizationState stateFromDatabaseData:v8];
  __int16 v34 = +[WFSmartPromptState stateFromDatabaseData:v8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v11 = [v10 smartPromptPermissions];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v30 = self;
    id v31 = v10;
    id v32 = v9;
    id v33 = v8;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v38;
    id obj = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v18 = [v17 data];
        __int16 v19 = +[WFDeletionAuthorizationState stateFromDatabaseData:v18];

        unint64_t v20 = [v17 data];
        id v21 = +[WFSmartPromptState stateFromDatabaseData:v20];

        if (v19
          && ([v19 actionUUID],
              uint64_t v22 = objc_claimAutoreleasedReturnValue(),
              [v36 actionUUID],
              long long v23 = objc_claimAutoreleasedReturnValue(),
              char v24 = [v22 isEqual:v23],
              v23,
              v22,
              (v24 & 1) != 0)
          || v21 && [v21 matches:v34])
        {
          id v25 = v17;

          uint64_t v14 = v25;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v13);

    id v9 = v32;
    id v8 = v33;
    self = v30;
    id v10 = v31;
    if (v14)
    {
      BOOL v26 = getWFSecurityLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v42 = "-[WFDatabase(SmartPrompts) _saveSmartPromptStateData:actionUUID:forWorkflow:]";
        __int16 v43 = 2114;
        id v44 = v34;
        _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_DEBUG, "%s Replacing existing WFCoreDataSmartPromptPermission with new data: %{public}@", buf, 0x16u);
      }

      goto LABEL_21;
    }
  }
  else
  {
  }
  long long v27 = getWFSecurityLogObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v42 = "-[WFDatabase(SmartPrompts) _saveSmartPromptStateData:actionUUID:forWorkflow:]";
    __int16 v43 = 2114;
    id v44 = v34;
    _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_DEBUG, "%s Inserting new WFCoreDataSmartPromptPermission with data: %{public}@", buf, 0x16u);
  }

  long long v28 = [WFCoreDataSmartPromptPermission alloc];
  int v29 = [(WFDatabase *)self context];
  uint64_t v14 = [(WFCoreDataSmartPromptPermission *)v28 initWithContext:v29];

  [v10 addSmartPromptPermissionsObject:v14];
LABEL_21:
  [(WFCoreDataSmartPromptPermission *)v14 setShortcut:v10];
  [(WFCoreDataSmartPromptPermission *)v14 setActionUUID:v9];
  [(WFCoreDataSmartPromptPermission *)v14 setData:v8];
}

- (BOOL)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__WFDatabase_SmartPrompts__saveSmartPromptStateData_actionUUID_reference_error___block_invoke;
  v20[3] = &unk_1E6558468;
  void v20[4] = self;
  id v13 = v12;
  id v21 = v13;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v19 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"save smart prompt state" block:v20 error:&v19];
  id v16 = v19;
  int v17 = v16;
  if (a6) {
    *a6 = v16;
  }

  return v17 == 0;
}

void __80__WFDatabase_SmartPrompts__saveSmartPromptStateData_actionUUID_reference_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v5 = objc_opt_class();
  id v6 = WFEnforceClass(v4, v5);

  if (v6)
  {
    [*(id *)(a1 + 32) _saveSmartPromptStateData:*(void *)(a1 + 48) actionUUID:*(void *)(a1 + 56) forWorkflow:v6];
    id v7 = +[WFDeletionAuthorizationState stateFromDatabaseData:*(void *)(a1 + 48)];
    id v8 = +[WFSmartPromptState stateFromDatabaseData:*(void *)(a1 + 48)];
    if (v8)
    {
      id v9 = getWFSecurityLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v13 = 136315394;
        *(void *)&void v13[4] = "-[WFDatabase(SmartPrompts) saveSmartPromptStateData:actionUUID:reference:error:]_block_invoke";
        __int16 v14 = 2114;
        id v15 = v8;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEBUG, "%s Updating existing smart prompt states to match %{public}@", v13, 0x16u);
      }

      [*(id *)(a1 + 32) _updateStatesToMatchSmartPromptState:v8 forWorkflow:v6];
    }
    else if (v7)
    {
      id v10 = getWFSecurityLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v13 = 136315394;
        *(void *)&void v13[4] = "-[WFDatabase(SmartPrompts) saveSmartPromptStateData:actionUUID:reference:error:]_block_invoke";
        __int16 v14 = 2114;
        id v15 = v7;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEBUG, "%s Updating existing deletion states to match %{public}@", v13, 0x16u);
      }

      [*(id *)(a1 + 32) _updateDeletionAuthorizationsToMatchAuthorization:v7 forWorkflow:v6];
    }
    id v11 = *(void **)(a1 + 32);
    *(void *)id v13 = @"smartPromptPermissions";
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v13 count:1];

    [v11 object:v6 didUpdateProperties:v12 error:a2];
  }
  else
  {
    id v7 = getWFSecurityLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id v13 = 136315138;
      *(void *)&void v13[4] = "-[WFDatabase(SmartPrompts) saveSmartPromptStateData:actionUUID:reference:error:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Bad reference passed to saveSmartPromptStateData", v13, 0xCu);
    }
  }
}

- (BOOL)saveSmartPromptState:(id)a3 reference:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v19 = 0;
  id v10 = [v8 databaseDataWithError:&v19];
  id v11 = v19;
  if (v10)
  {
    id v12 = [v8 actionUUID];
    id v18 = 0;
    BOOL v13 = [(WFDatabase *)self saveSmartPromptStateData:v10 actionUUID:v12 reference:v9 error:&v18];
    id v14 = v18;

    if (!v13)
    {
      id v15 = getWFSecurityLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v21 = "-[WFDatabase(SmartPrompts) saveSmartPromptState:reference:error:]";
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Could not save flattened smart prompt state: %{public}@", buf, 0x16u);
      }

      if (a5) {
        *a5 = v14;
      }
    }
  }
  else
  {
    uint64_t v16 = getWFSecurityLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v21 = "-[WFDatabase(SmartPrompts) saveSmartPromptState:reference:error:]";
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s Could not serialize smart prompt state: %{public}@", buf, 0x16u);
    }

    BOOL v13 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v13;
}

- (id)allStatesDataForReference:(id)a3 actionUUID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__WFDatabase_SmartPrompts__allStatesDataForReference_actionUUID___block_invoke;
  v16[3] = &unk_1E6551508;
  id v8 = v7;
  id v17 = v8;
  id v9 = v6;
  id v18 = v9;
  id v19 = self;
  id v15 = 0;
  id v10 = [(WFDatabase *)self performOperationWithReason:@"getting smart prompt data for shortcut" block:v16 error:&v15];
  id v11 = v15;
  if (v11)
  {
    id v12 = getWFSecurityLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v21 = "-[WFDatabase(SmartPrompts) allStatesDataForReference:actionUUID:]";
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to lookup smart prompt states for reference: %@", buf, 0x16u);
    }

    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v13 = v10;
  }

  return v13;
}

id __65__WFDatabase_SmartPrompts__allStatesDataForReference_actionUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[WFCoreDataSmartPromptPermission fetchRequest];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) identifier];
  id v8 = (void *)v7;
  if (v6) {
    [v5 predicateWithFormat:@"%K = %@ AND %K = %@", @"shortcut.workflowID", v7, @"actionUUID", *(void *)(a1 + 32)];
  }
  else {
  id v9 = [v5 predicateWithFormat:@"%K = %@", @"shortcut.workflowID", v7, v14, v15];
  }
  [v4 setPredicate:v9];

  id v10 = [*(id *)(a1 + 48) context];
  id v11 = [v10 executeFetchRequest:v4 error:a2];
  id v12 = objc_msgSend(v11, "if_map:", &__block_literal_global_209);

  return v12;
}

uint64_t __65__WFDatabase_SmartPrompts__allStatesDataForReference_actionUUID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 data];
}

- (id)deletionAuthorizationStatesForReference:(id)a3
{
  uint64_t v3 = [(WFDatabase *)self allStatesDataForReference:a3 actionUUID:0];
  id v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_189_28480);

  return v4;
}

id __68__WFDatabase_SmartPrompts__deletionAuthorizationStatesForReference___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFDeletionAuthorizationState stateFromDatabaseData:a2];
}

- (void)compactDeletionAuthorizationsIfNecessaryForWorkflowReference:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  uint64_t v3 = -[WFDatabase deletionAuthorizationStatesForReference:](self, "deletionAuthorizationStatesForReference:");
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
  id v32 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v11 = [v10 contentItemClassName];
        id v12 = [v4 objectForKey:v11];

        if (!v12) {
          goto LABEL_12;
        }
        id v13 = [v12 status];

        if (v13 == @"Disallow") {
          goto LABEL_14;
        }
        uint64_t v14 = [v10 status];

        if (v14 == @"Disallow") {
          goto LABEL_12;
        }
        uint64_t v15 = [v10 status];
        if (v15 != @"Allow") {
          goto LABEL_13;
        }
        unint64_t v16 = [v10 count];
        unint64_t v17 = [v12 count];

        BOOL v18 = v16 >= v17;
        id v5 = v32;
        if (v18)
        {
LABEL_12:
          uint64_t v15 = [v10 contentItemClassName];
          [v4 setObject:v10 forKey:v15];
LABEL_13:
        }
LABEL_14:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v7);
  }

  id v19 = [v4 allValues];
  [(WFDatabase *)self deleteAllDeletionAuthorizationsForReference:v34];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        id v36 = 0;
        BOOL v26 = [v25 databaseDataWithError:&v36];
        long long v27 = v36;
        if (v27)
        {
          long long v28 = getWFSecurityLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            uint64_t v46 = "-[WFDatabase(SmartPrompts) compactDeletionAuthorizationsIfNecessaryForWorkflowReference:]";
            __int16 v47 = 2112;
            long long v48 = v27;
            _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_ERROR, "%s Failed to serialize WFDeletionAuthorizationState for save with error %@", buf, 0x16u);
          }
        }
        else
        {
          int v29 = [v25 actionUUID];
          id v35 = 0;
          BOOL v30 = [(WFDatabase *)self saveSmartPromptStateData:v26 actionUUID:v29 reference:v34 error:&v35];
          long long v28 = v35;

          if (!v30)
          {
            id v31 = getWFSecurityLogObject();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315394;
              uint64_t v46 = "-[WFDatabase(SmartPrompts) compactDeletionAuthorizationsIfNecessaryForWorkflowReference:]";
              __int16 v47 = 2112;
              long long v48 = v28;
              _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_ERROR, "%s Failed to save WFDeletionAuthorizationState with error %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v22);
  }
}

- (id)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  BOOL v18 = v17;
  if (!v15)
  {
    id v19 = [v17 identifier];
    id v15 = [(WFDatabase *)self generateAndPersistUUIDForActionWithIdentifier:v16 actionIndex:a6 workflowIdentifier:v19];
  }
  if (+[WFShortcutsSecuritySettings allowsDeletingLargeAmountsOfData](WFShortcutsSecuritySettings, "allowsDeletingLargeAmountsOfData")|| +[WFContentExfiltrationQuantityInfo deletionItemCountLimitForContentWithContentItemClassName:v14] >= a7)
  {
    [(WFDatabase *)self compactDeletionAuthorizationsIfNecessaryForWorkflowReference:v18];
    uint64_t v22 = [(WFDatabase *)self deletionAuthorizationStatesForReference:v18];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __143__WFDatabase_SmartPrompts__currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference___block_invoke;
    v35[3] = &unk_1E65514A0;
    id v23 = v14;
    id v36 = v23;
    uint64_t v24 = objc_msgSend(v22, "if_firstObjectPassingTest:", v35);
    id v25 = v24;
    if (!v24)
    {
      int v29 = getWFSecurityLogObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315650;
        long long v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIde"
              "ntifier:actionIndex:count:reference:]";
        __int16 v39 = 2114;
        id v40 = v23;
        __int16 v41 = 2114;
        id v42 = v15;
        _os_log_impl(&dword_1C7F0A000, v29, OS_LOG_TYPE_DEFAULT, "%s No deletion authorization states found for content item class %{public}@, actionUUID: %{public}@", buf, 0x20u);
      }

      BOOL v30 = [[WFDeletionAuthorizationState alloc] initWithStatus:@"Undefined" contentItemClassName:v23 actionUUID:v15 count:a7];
      goto LABEL_24;
    }
    BOOL v26 = [v24 status];
    int v27 = [v26 isEqualToString:@"Disallow"];

    if (v27)
    {
      long long v28 = getWFSecurityLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIde"
              "ntifier:actionIndex:count:reference:]";
        _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s Not authorizing deletion because the user disallowed deletion previously", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = [v25 count];
      id v32 = getWFSecurityLogObject();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (a7 > 2 * v31)
      {
        if (v33)
        {
          *(_DWORD *)long long buf = 136315138;
          long long v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionI"
                "dentifier:actionIndex:count:reference:]";
          _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_DEFAULT, "%s Will prompt for deletion because currentCount > 2 * previousCount", buf, 0xCu);
        }

        BOOL v30 = [v25 stateWithStatus:@"Undefined" count:a7];
        goto LABEL_24;
      }
      if (v33)
      {
        *(_DWORD *)long long buf = 136315138;
        long long v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIde"
              "ntifier:actionIndex:count:reference:]";
        _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_DEFAULT, "%s Will not prompt for deletion because there is a valid deletion authorization in the database.", buf, 0xCu);
      }
    }
    BOOL v30 = v25;
LABEL_24:
    uint64_t v21 = v30;

    goto LABEL_25;
  }
  id v20 = getWFSecurityLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v38 = "-[WFDatabase(SmartPrompts) currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIdentif"
          "ier:actionIndex:count:reference:]";
    __int16 v39 = 2114;
    id v40 = v14;
    _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_DEFAULT, "%s Deletion action will be restricted because allowsDeletingLargeAmountsOfData is set to NO, and the count for %{public}@ is greater than the maximum allowed", buf, 0x16u);
  }

  uint64_t v21 = [[WFDeletionAuthorizationState alloc] initWithStatus:@"Restricted" contentItemClassName:v14 actionUUID:v15 count:a7];
LABEL_25:

  return v21;
}

uint64_t __143__WFDatabase_SmartPrompts__currentDeletionAuthorizationStatusWithContentItemClassName_actionUUID_actionIdentifier_actionIndex_count_reference___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 contentItemClassName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)smartPromptStatesForReference:(id)a3 actionUUID:(id)a4
{
  uint64_t v4 = [(WFDatabase *)self allStatesDataForReference:a3 actionUUID:a4];
  id v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_28491);

  return v5;
}

id __69__WFDatabase_SmartPrompts__smartPromptStatesForReference_actionUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFSmartPromptState stateFromDatabaseData:a2];
}

- (id)smartPromptStatesForReference:(id)a3
{
  return [(WFDatabase *)self smartPromptStatesForReference:a3 actionUUID:0];
}

- (void)saveSmartPromptStatesForInsertedAction:(id)a3 contentDestination:(id)a4 reference:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 generateUUIDIfNecessaryWithUUIDProvider:0];
  id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v12 = [[WFSmartPromptState alloc] initWithMode:@"UserWildcard" sourceContentAttribution:0 actionUUID:v10 contentDestination:v8 status:@"Allow"];
  [v11 addObject:v12];

  if ([v8 promptingBehaviour])
  {
    id v13 = [[WFSmartPromptState alloc] initWithMode:@"ActionWildcard" sourceContentAttribution:0 actionUUID:v10 contentDestination:v8 status:@"Allow"];
    [v11 addObject:v13];
  }
  id v23 = (void *)v10;
  uint64_t v24 = v8;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v25 = 0;
        BOOL v20 = -[WFDatabase saveSmartPromptState:reference:error:](self, "saveSmartPromptState:reference:error:", v19, v9, &v25, v23, v24);
        id v21 = v25;
        if (!v20)
        {
          uint64_t v22 = getWFSecurityLogObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            uint64_t v31 = "-[WFDatabase(SmartPrompts) saveSmartPromptStatesForInsertedAction:contentDestination:reference:]";
            __int16 v32 = 2112;
            id v33 = v21;
            _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Error storing state data in database for inserted action: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }
}

- (void)createSmartPromptStatesForInsertedActions:(id)a3 forReference:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFSecurityLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
    __int16 v38 = 2048;
    uint64_t v39 = [v6 count];
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEBUG, "%s Will attempt to create SP states for %lu inserted actions.", buf, 0x16u);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v33;
    *(void *)&long long v10 = 136315650;
    long long v28 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v14, "allowsAnyURLDestinationWhenAddedToWorkflowByUser", v28))
        {
          uint64_t v15 = getWFSecurityLogObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v16 = [v14 identifier];
            *(_DWORD *)long long buf = 136315394;
            long long v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
            __int16 v38 = 2112;
            uint64_t v39 = (uint64_t)v16;
            _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEBUG, "%s Creating a network wildcard permission for action %@", buf, 0x16u);
          }
          uint64_t v17 = [v14 generateUUIDIfNecessaryWithUUIDProvider:0];
          BOOL v18 = [WFSmartPromptState alloc];
          uint64_t v19 = [MEMORY[0x1E4F5AA48] locationMatchingAnyHostname];
          BOOL v20 = [(WFSmartPromptState *)v18 initWithMode:@"UserWildcard" sourceContentAttribution:0 actionUUID:v17 contentDestination:v19 status:@"Allow"];

          id v31 = 0;
          BOOL v21 = [(WFDatabase *)self saveSmartPromptState:v20 reference:v7 error:&v31];
          id v22 = v31;
          if (!v21)
          {
            id v23 = getWFSecurityLogObject();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315394;
              long long v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
              __int16 v38 = 2112;
              uint64_t v39 = (uint64_t)v22;
              _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s Error storing state data in database for network wildcard: %@", buf, 0x16u);
            }
          }
        }
        id v30 = 0;
        uint64_t v24 = [v14 contentDestinationWithError:&v30];
        id v25 = v30;
        if (v24)
        {
          [(WFDatabase *)self saveSmartPromptStatesForInsertedAction:v14 contentDestination:v24 reference:v7];
        }
        else
        {
          long long v26 = getWFSecurityLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            long long v27 = [v14 identifier];
            *(_DWORD *)long long buf = v28;
            long long v37 = "-[WFDatabase(SmartPrompts) createSmartPromptStatesForInsertedActions:forReference:]";
            __int16 v38 = 2112;
            uint64_t v39 = (uint64_t)v27;
            __int16 v40 = 2114;
            id v41 = v25;
            _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create content destination for inserted action %@ with error: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v11);
  }
}

- (id)migrateAccountStateToAppOriginIfNecessary:(id)a3 reference:(id)a4 actionUUID:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 sourceContentAttribution];
  long long v10 = [v9 origin];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v12 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v23 = "-[WFDatabase(SmartPrompts) migrateAccountStateToAppOriginIfNecessary:reference:actionUUID:]";
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Migrating saved state from account to app origin: %@", buf, 0x16u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__WFDatabase_SmartPrompts__migrateAccountStateToAppOriginIfNecessary_reference_actionUUID___block_invoke;
    void v19[3] = &unk_1E6551458;
    void v19[4] = self;
    id v13 = v7;
    id v20 = v13;
    id v21 = v8;
    id v18 = 0;
    id v14 = [(WFDatabase *)self performSaveOperationWithReason:@"migrating smart prompt state" block:v19 error:&v18];
    id v15 = v18;
    if (v15)
    {
      uint64_t v16 = getWFSecurityLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        id v23 = "-[WFDatabase(SmartPrompts) migrateAccountStateToAppOriginIfNecessary:reference:actionUUID:]";
        __int16 v24 = 2114;
        id v25 = v13;
        __int16 v26 = 2114;
        id v27 = v15;
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s Failed to migrate smart prompt state: %{public}@, error: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v14 = v7;
  }

  return v14;
}

id __91__WFDatabase_SmartPrompts__migrateAccountStateToAppOriginIfNecessary_reference_actionUUID___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) _deleteSmartPromptState:*(void *)(a1 + 40) forReference:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(a1 + 40) stateByReplacingAccountWithAppOrigin];
  id v15 = 0;
  id v5 = [v4 databaseDataWithError:&v15];
  id v6 = v15;
  id v7 = v6;
  if (v6)
  {
    id v8 = 0;
    *a2 = v6;
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    long long v10 = [v4 actionUUID];
    uint64_t v11 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 48) properties:MEMORY[0x1E4F1CBF0]];
    uint64_t v12 = objc_opt_class();
    id v13 = WFEnforceClass(v11, v12);
    [v9 _saveSmartPromptStateData:v5 actionUUID:v10 forWorkflow:v13];

    id v8 = v4;
  }

  return v8;
}

- (BOOL)shouldPromptForCurrentContentItemCount:(unint64_t)a3 previousCount:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = getWFSecurityLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[WFDatabase(SmartPrompts) shouldPromptForCurrentContentItemCount:previousCount:]";
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEBUG, "%s Smart Prompts counts: current = %lu, previousCount = %lu", (uint8_t *)&v10, 0x20u);
  }

  BOOL v8 = a3 > 0x64 && a4 < 0x65;
  if (a4 <= 0x19) {
    BOOL v8 = a3 > 0x19;
  }
  if (a4 <= 5) {
    return a3 > 5;
  }
  else {
    return v8;
  }
}

- (id)performDatabaseLookupForState:(id)a3 actionUUID:(id)a4 reference:(id)a5
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!+[WFShortcutsSecuritySettings allowsSharingLargeAmountsOfData])
  {
    uint64_t v11 = [v8 sourceContentAttribution];
    __int16 v12 = self;
    unint64_t v13 = [v11 count];
    __int16 v14 = [v8 sourceContentAttribution];
    unint64_t v15 = +[WFContentExfiltrationQuantityInfo sharingItemCountLimitForContentWithAttribution:v14];

    BOOL v16 = v13 > v15;
    self = v12;
    if (v16)
    {
      uint64_t v17 = [v8 stateWithStatus:@"Restricted"];

      id v18 = [WFSmartPromptDatabaseLookupResult alloc];
      v115[0] = v17;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:1];
      id v20 = [(WFSmartPromptDatabaseLookupResult *)v18 initWithAllowedStates:MEMORY[0x1E4F1CBF0] deniedStates:MEMORY[0x1E4F1CBF0] undefinedStates:MEMORY[0x1E4F1CBF0] restrictedStates:v19];
      id v8 = (id)v17;
      goto LABEL_67;
    }
  }
  id v21 = [(WFDatabase *)self smartPromptStatesForReference:v10 actionUUID:v9];
  if (![v21 count])
  {
    id v19 = [(WFDatabase *)self smartPromptStatesForReference:v10];

    if (![v19 count])
    {
      char v63 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = [v10 name];
        *(_DWORD *)long long buf = 136315394;
        v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
        __int16 v113 = 2112;
        id v114 = v64;
        _os_log_impl(&dword_1C7F0A000, v63, OS_LOG_TYPE_DEFAULT, "%s No saved smart prompt states found for workflow '%@'", buf, 0x16u);
      }
      uint64_t v65 = [WFSmartPromptDatabaseLookupResult alloc];
      id v110 = v8;
      id v66 = (void *)MEMORY[0x1E4F1C978];
      id v67 = &v110;
      goto LABEL_60;
    }
    id v21 = v19;
  }
  v92 = self;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v19 = v21;
  uint64_t v22 = [v19 countByEnumeratingWithState:&v98 objects:v109 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    __int16 v24 = v19;
    id v25 = 0;
    uint64_t v26 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v99 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        long long v29 = [(WFDatabase *)v92 migrateAccountStateToAppOriginIfNecessary:v28 reference:v10 actionUUID:v9];
        if ([v29 matches:v8])
        {
          id v30 = v28;

          id v25 = v30;
        }
      }
      uint64_t v23 = [v24 countByEnumeratingWithState:&v98 objects:v109 count:16];
    }
    while (v23);
    id v19 = v24;

    if (v25)
    {
      id v31 = [v25 status];
      int v32 = [v31 isEqualToString:@"Disallow"];

      if (v32)
      {
        long long v33 = getWFSecurityLogObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315395;
          v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
          __int16 v113 = 2113;
          id v114 = v25;
          _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_DEFAULT, "%s Will stop execution because user selected Do Not Allow: %{private}@", buf, 0x16u);
        }

        long long v34 = [WFSmartPromptDatabaseLookupResult alloc];
        id v105 = v25;
        long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
        id v36 = (void *)MEMORY[0x1E4F1CBF0];
        long long v37 = v34;
        __int16 v38 = v35;
        uint64_t v39 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        uint64_t v59 = [v25 status];
        int v60 = [v59 isEqualToString:@"Undefined"];

        if (v60)
        {
          v61 = getWFSecurityLogObject();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315395;
            v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
            __int16 v113 = 2113;
            id v114 = v25;
            _os_log_impl(&dword_1C7F0A000, v61, OS_LOG_TYPE_DEFAULT, "%s Will prompt because user selected Ask Each Time: %{private}@", buf, 0x16u);
          }

          id v62 = [WFSmartPromptDatabaseLookupResult alloc];
          id v104 = v25;
          long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
          id v36 = (void *)MEMORY[0x1E4F1CBF0];
          long long v37 = v62;
          __int16 v38 = (void *)MEMORY[0x1E4F1CBF0];
          uint64_t v39 = v35;
        }
        else
        {
          id v74 = [v25 sourceContentAttribution];
          uint64_t v75 = [v74 count];

          id v76 = [v8 sourceContentAttribution];
          uint64_t v77 = [v76 count];

          LODWORD(v76) = [(WFDatabase *)v92 shouldPromptForCurrentContentItemCount:v77 previousCount:v75];
          long long v78 = getWFSecurityLogObject();
          BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT);
          if (v76)
          {
            if (v79)
            {
              *(_DWORD *)long long buf = 136315395;
              v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
              __int16 v113 = 2113;
              id v114 = v25;
              _os_log_impl(&dword_1C7F0A000, v78, OS_LOG_TYPE_DEFAULT, "%s Will prompt because exfiltrating more data than saved authorization: %{private}@", buf, 0x16u);
            }

            id v80 = [WFSmartPromptDatabaseLookupResult alloc];
            id v103 = v8;
            long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
            id v81 = [v25 sourceContentAttribution];
            id v20 = [(WFSmartPromptDatabaseLookupResult *)v80 initWithAllowedStates:MEMORY[0x1E4F1CBF0] deniedStates:MEMORY[0x1E4F1CBF0] undefinedStates:v35 previousAttribution:v81];

            goto LABEL_65;
          }
          if (v79)
          {
            *(_DWORD *)long long buf = 136315395;
            v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
            __int16 v113 = 2113;
            id v114 = v25;
            _os_log_impl(&dword_1C7F0A000, v78, OS_LOG_TYPE_DEFAULT, "%s Will not prompt because we have a valid authorization saved: %{private}@", buf, 0x16u);
          }

          v84 = [WFSmartPromptDatabaseLookupResult alloc];
          id v102 = v25;
          long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
          __int16 v38 = (void *)MEMORY[0x1E4F1CBF0];
          long long v37 = v84;
          id v36 = v35;
          uint64_t v39 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
      id v20 = [(WFSmartPromptDatabaseLookupResult *)v37 initWithAllowedStates:v36 deniedStates:v38 undefinedStates:v39];
LABEL_65:

      goto LABEL_66;
    }
  }
  else
  {
  }
  __int16 v40 = [v8 mode];
  int v41 = [v40 isEqualToString:@"ActionWildcard"];

  if (!v41) {
    goto LABEL_57;
  }
  id v86 = v19;
  id v87 = v10;
  [(WFDatabase *)v92 smartPromptStatesForReference:v10];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v25 countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (!v42) {
    goto LABEL_56;
  }
  uint64_t v43 = v42;
  uint64_t v44 = *(void *)v95;
  long long v45 = @"ActionWildcard";
  id v91 = v9;
  id v89 = v25;
LABEL_26:
  uint64_t v46 = 0;
  uint64_t v90 = v43;
  while (1)
  {
    if (*(void *)v95 != v44) {
      objc_enumerationMutation(v25);
    }
    __int16 v47 = *(void **)(*((void *)&v94 + 1) + 8 * v46);
    long long v48 = [v47 mode];
    if (![v48 isEqualToString:v45]) {
      goto LABEL_36;
    }
    int64_t v49 = [v47 actionUUID];
    __int16 v50 = [v8 actionUUID];
    if ([v49 isEqualToString:v50]) {
      goto LABEL_35;
    }
    uint64_t v51 = v45;
    uint64_t v52 = v44;
    uint64_t v53 = [v47 contentDestination];
    id v54 = v8;
    id v55 = v8;
    uint64_t v56 = (void *)v53;
    uint64_t v57 = [v55 contentDestination];
    if (![v56 isEqual:v57])
    {

      uint64_t v44 = v52;
      long long v45 = v51;
      id v8 = v54;
      id v25 = v89;
      uint64_t v43 = v90;
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    __int16 v58 = [v47 status];
    int v88 = [v58 isEqualToString:@"Allow"];

    uint64_t v44 = v52;
    long long v45 = v51;
    id v8 = v54;
    id v25 = v89;
    uint64_t v43 = v90;
    if (v88) {
      break;
    }
LABEL_37:
    ++v46;
    id v9 = v91;
    if (v43 == v46)
    {
      uint64_t v43 = [v25 countByEnumeratingWithState:&v94 objects:v108 count:16];
      if (v43) {
        goto LABEL_26;
      }
      goto LABEL_56;
    }
  }
  id v68 = [v8 stateWithStatus:@"Allow"];
  id v93 = 0;
  BOOL v69 = [(WFDatabase *)v92 saveSmartPromptState:v68 reference:v87 error:&v93];
  id v70 = v93;
  v71 = v70;
  id v9 = v91;
  if (v69)
  {
    uint64_t v72 = [WFSmartPromptDatabaseLookupResult alloc];
    v107 = v68;
    id v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
    id v20 = [(WFSmartPromptDatabaseLookupResult *)v72 initWithAllowedStates:v73 deniedStates:MEMORY[0x1E4F1CBF0] undefinedStates:MEMORY[0x1E4F1CBF0]];

    id v19 = v86;
    id v10 = v87;
    goto LABEL_66;
  }
  v82 = getWFSecurityLogObject();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
    _os_log_impl(&dword_1C7F0A000, v82, OS_LOG_TYPE_ERROR, "%s Failed to save new smart prompt state.", buf, 0xCu);
  }

LABEL_56:
  id v19 = v86;
  id v10 = v87;
LABEL_57:
  v83 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315395;
    v112 = "-[WFDatabase(SmartPrompts) performDatabaseLookupForState:actionUUID:reference:]";
    __int16 v113 = 2113;
    id v114 = v8;
    _os_log_impl(&dword_1C7F0A000, v83, OS_LOG_TYPE_DEFAULT, "%s Will prompt because no state in database matches lookup state: %{private}@", buf, 0x16u);
  }

  uint64_t v65 = [WFSmartPromptDatabaseLookupResult alloc];
  id v106 = v8;
  id v66 = (void *)MEMORY[0x1E4F1C978];
  id v67 = &v106;
LABEL_60:
  id v25 = [v66 arrayWithObjects:v67 count:1];
  id v20 = [(WFSmartPromptDatabaseLookupResult *)v65 initWithAllowedStates:MEMORY[0x1E4F1CBF0] deniedStates:MEMORY[0x1E4F1CBF0] undefinedStates:v25];
LABEL_66:

LABEL_67:
  return v20;
}

- (id)fetchFirstAllowedStateMatching:(id)a3 actionUUID:(id)a4 forReference:(id)a5
{
  id v5 = [(WFDatabase *)self performDatabaseLookupForState:a3 actionUUID:a4 reference:a5];
  id v6 = [v5 allowedStates];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = [v5 allowedStates];
    id v9 = [v8 firstObject];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v116 = a6;
  id v135 = a8;
  id v118 = a9;
  if (!v16)
  {
    uint64_t v17 = [v135 identifier];
    id v16 = [(WFDatabase *)self generateAndPersistUUIDForActionWithIdentifier:v116 actionIndex:a7 workflowIdentifier:v17];
  }
  id v18 = [v14 attributionSetByReplacingAccountWithAppOrigins];

  id v19 = [[WFSmartPromptApprovalResult alloc] initWithActionUUID:v16];
  v117 = v18;
  if ([v18 derivedDisclosureLevel] == 1 || objc_msgSend(v15, "promptingBehaviour"))
  {
    v119 = [MEMORY[0x1E4F1CA48] array];
    if ([v15 promptingBehaviour])
    {
      id v20 = getWFSecurityLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v15 identifier];
        *(_DWORD *)long long buf = 136315395;
        v167 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIde"
               "ntifier:actionIndex:reference:allowedOnceStates:]";
        __int16 v168 = 2113;
        id v169 = v21;
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_DEFAULT, "%s Content destination %{private}@ requires first run approval, will prompt for special request", buf, 0x16u);
      }
      uint64_t v22 = [[WFSmartPromptState alloc] initWithMode:@"ActionWildcard" sourceContentAttribution:0 actionUUID:v16 contentDestination:v15 status:@"Undefined"];
      [v119 addObject:v22];
    }
    v115 = [[WFSmartPromptState alloc] initWithMode:@"UserWildcard" sourceContentAttribution:0 actionUUID:v16 contentDestination:v15 status:@"Allow"];
    -[WFDatabase fetchFirstAllowedStateMatching:actionUUID:forReference:](self, "fetchFirstAllowedStateMatching:actionUUID:forReference:");
    id v132 = v16;
    id v133 = v15;
    uint64_t v113 = v123 = v19;
    if (v113)
    {
      long long v161 = 0u;
      long long v162 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      uint64_t v23 = objc_msgSend(v117, "attributions", v113);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v159 objects:v174 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v160;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v160 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void **)(*((void *)&v159 + 1) + 8 * i);
            if ([v28 disclosureLevel] == 1)
            {
              long long v29 = [[WFSmartPromptState alloc] initWithMode:@"Normal" sourceContentAttribution:v28 actionUUID:v16 contentDestination:v15 status:@"Allow"];
              id v158 = 0;
              BOOL v30 = [(WFDatabase *)self saveSmartPromptState:v29 reference:v135 error:&v158];
              id v31 = v158;
              if (!v30)
              {
                int v32 = getWFSecurityLogObject();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 136315394;
                  v167 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID"
                         ":actionIdentifier:actionIndex:reference:allowedOnceStates:]";
                  __int16 v168 = 2112;
                  id v169 = v31;
                  _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_ERROR, "%s Failed to save smart prompt state: %@", buf, 0x16u);
                }
              }
              id v16 = v132;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v159 objects:v174 count:16];
        }
        while (v25);
      }

      long long v33 = getWFSecurityLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315395;
        v167 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIde"
               "ntifier:actionIndex:reference:allowedOnceStates:]";
        __int16 v168 = 2113;
        id v169 = v15;
        _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_DEFAULT, "%s Flattened wildcard smart prompt with content destination: %{private}@", buf, 0x16u);
      }

      id v19 = v123;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = [WFSmartPromptState alloc];
      long long v35 = [MEMORY[0x1E4F5AA48] locationMatchingAnyHostname];
      id v36 = [(WFSmartPromptState *)v34 initWithMode:@"UserWildcard" sourceContentAttribution:0 actionUUID:v16 contentDestination:v35 status:@"Allow"];

      long long v37 = [(WFDatabase *)self fetchFirstAllowedStateMatching:v36 actionUUID:v16 forReference:v135];
      if (v37)
      {
        v127 = v37;
        v129 = v36;
        __int16 v38 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v39 = [v117 attributions];
        __int16 v40 = objc_msgSend(v38, "arrayWithCapacity:", objc_msgSend(v39, "count") + 1);

        v125 = [[WFSmartPromptState alloc] initWithMode:@"ActionWildcard" sourceContentAttribution:0 actionUUID:v16 contentDestination:v15 status:@"Allow"];
        objc_msgSend(v40, "addObject:");
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        int v41 = [v117 attributions];
        uint64_t v42 = [v41 countByEnumeratingWithState:&v154 objects:v173 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v155;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v155 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void **)(*((void *)&v154 + 1) + 8 * j);
              if (objc_msgSend(v46, "disclosureLevel", v113) == 1)
              {
                __int16 v47 = [[WFSmartPromptState alloc] initWithMode:@"Normal" sourceContentAttribution:v46 actionUUID:v132 contentDestination:v15 status:@"Allow"];
                [v40 addObject:v47];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v154 objects:v173 count:16];
          }
          while (v43);
        }

        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        id v48 = v40;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v150 objects:v172 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v151;
          do
          {
            for (uint64_t k = 0; k != v50; ++k)
            {
              if (*(void *)v151 != v51) {
                objc_enumerationMutation(v48);
              }
              uint64_t v53 = *(void *)(*((void *)&v150 + 1) + 8 * k);
              id v149 = 0;
              BOOL v54 = -[WFDatabase saveSmartPromptState:reference:error:](self, "saveSmartPromptState:reference:error:", v53, v135, &v149, v113);
              id v55 = v149;
              if (!v54)
              {
                uint64_t v56 = getWFSecurityLogObject();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 136315394;
                  v167 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID"
                         ":actionIdentifier:actionIndex:reference:allowedOnceStates:]";
                  __int16 v168 = 2112;
                  id v169 = v55;
                  _os_log_impl(&dword_1C7F0A000, v56, OS_LOG_TYPE_ERROR, "%s Failed to save smart prompt state: %@", buf, 0x16u);
                }
              }
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v150 objects:v172 count:16];
          }
          while (v50);
        }

        uint64_t v57 = getWFSecurityLogObject();
        id v19 = v123;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315650;
          v167 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionI"
                 "dentifier:actionIndex:reference:allowedOnceStates:]";
          __int16 v168 = 2112;
          id v169 = v15;
          __int16 v170 = 2112;
          id v171 = v48;
          _os_log_impl(&dword_1C7F0A000, v57, OS_LOG_TYPE_DEFAULT, "%s Flattened network wildcard with content destination: %@ into states %@", buf, 0x20u);
        }

        long long v37 = v127;
        id v36 = v129;
      }
    }
    if (objc_msgSend(v15, "promptingBehaviour", v113) != 2)
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      __int16 v58 = [v117 attributions];
      uint64_t v59 = [v58 countByEnumeratingWithState:&v145 objects:v165 count:16];
      if (!v59) {
        goto LABEL_92;
      }
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v146;
      uint64_t v121 = *(void *)v146;
      v122 = v58;
      while (1)
      {
        uint64_t v62 = 0;
        uint64_t v124 = v60;
        do
        {
          if (*(void *)v146 != v61) {
            objc_enumerationMutation(v58);
          }
          char v63 = *(void **)(*((void *)&v145 + 1) + 8 * v62);
          if ([v63 disclosureLevel] == 1)
          {
            v131 = v63;
            id v64 = [v63 origin];
            id v65 = v15;
            if ([v64 isEqual:v65]) {
              goto LABEL_73;
            }
            id v66 = v64;
            if (v66)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v67 = v66;
              }
              else {
                id v67 = 0;
              }
            }
            else
            {
              id v67 = 0;
            }
            id v68 = v67;

            id v69 = v65;
            if (v15)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v70 = v69;
              }
              else {
                id v70 = 0;
              }
            }
            else
            {
              id v70 = 0;
            }
            id v71 = v70;

            v126 = [v68 appDescriptor];
            uint64_t v72 = [v126 bundleIdentifier];
            id v73 = [v71 appDescriptor];
            id v74 = [v73 bundleIdentifier];
            v128 = v71;
            v130 = v68;
            if ([v72 isEqualToString:v74])
            {
              [v68 accountIdentifier];
              uint64_t v75 = v120 = v69;
              id v76 = [v71 accountIdentifier];
              char v77 = [v75 isEqualToString:v76];

              id v69 = v120;
              if (v77)
              {

                id v15 = v133;
                __int16 v58 = v122;
                id v19 = v123;
                uint64_t v61 = v121;
                uint64_t v60 = v124;
LABEL_73:

LABEL_86:
                getWFSecurityLogObject();
                id v89 = (WFSmartPromptState *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v89->super, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v90 = [v131 origin];
                  *(_DWORD *)long long buf = 136315395;
                  v167 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID"
                         ":actionIdentifier:actionIndex:reference:allowedOnceStates:]";
                  __int16 v168 = 2113;
                  id v169 = v90;
                  _os_log_impl(&dword_1C7F0A000, &v89->super, OS_LOG_TYPE_DEFAULT, "%s Ignoring content attribution with origin %{private}@, as source and destination of content are the same", buf, 0x16u);

                  uint64_t v60 = v124;
                }
                goto LABEL_89;
              }
            }
            else
            {
            }
            id v78 = v66;
            id v19 = v123;
            if (v66)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                BOOL v79 = v78;
              }
              else {
                BOOL v79 = 0;
              }
            }
            else
            {
              BOOL v79 = 0;
            }
            id v80 = v79;

            id v81 = v69;
            if (v133)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v82 = v81;
              }
              else {
                v82 = 0;
              }
            }
            else
            {
              v82 = 0;
            }
            id v83 = v82;

            v84 = [v80 appDescriptor];

            v85 = [v84 bundleIdentifier];
            id v86 = [v83 appDescriptor];

            id v87 = [v86 bundleIdentifier];
            char v88 = [v85 isEqualToString:v87];

            id v15 = v133;
            uint64_t v61 = v121;
            __int16 v58 = v122;
            uint64_t v60 = v124;
            if (v88) {
              goto LABEL_86;
            }
            id v89 = [[WFSmartPromptState alloc] initWithMode:@"Normal" sourceContentAttribution:v131 actionUUID:v132 contentDestination:v81 status:@"Undefined"];
            [v119 addObject:v89];
LABEL_89:
          }
          ++v62;
        }
        while (v60 != v62);
        uint64_t v60 = [v58 countByEnumeratingWithState:&v145 objects:v165 count:16];
        if (!v60)
        {
LABEL_92:

          break;
        }
      }
    }
    if ([v118 count])
    {
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v91 = v119;
      uint64_t v92 = [v91 countByEnumeratingWithState:&v141 objects:v164 count:16];
      if (v92)
      {
        uint64_t v93 = v92;
        uint64_t v94 = *(void *)v142;
        while (2)
        {
          for (uint64_t m = 0; m != v93; ++m)
          {
            if (*(void *)v142 != v94) {
              objc_enumerationMutation(v91);
            }
            uint64_t v96 = *(void *)(*((void *)&v141 + 1) + 8 * m);
            v140[0] = MEMORY[0x1E4F143A8];
            v140[1] = 3221225472;
            v140[2] = __154__WFDatabase_SmartPrompts__approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates___block_invoke;
            v140[3] = &unk_1E6551430;
            v140[4] = v96;
            long long v97 = [v118 objectsPassingTest:v140];
            uint64_t v98 = [v97 count];

            if (!v98)
            {

              id v19 = v123;
              goto LABEL_104;
            }
          }
          uint64_t v93 = [v91 countByEnumeratingWithState:&v141 objects:v164 count:16];
          if (v93) {
            continue;
          }
          break;
        }
      }

      id v16 = v132;
      long long v99 = [[WFSmartPromptApprovalResult alloc] initWithActionUUID:v132];
      long long v100 = [WFSmartPromptDatabaseLookupResult alloc];
      long long v101 = [(WFSmartPromptDatabaseLookupResult *)v100 initWithAllowedStates:v91 deniedStates:MEMORY[0x1E4F1CBF0] undefinedStates:MEMORY[0x1E4F1CBF0]];
      id v102 = [(WFSmartPromptApprovalResult *)v99 resultByAddingDatabaseResult:v101];

      id v103 = v123;
    }
    else
    {
LABEL_104:
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v104 = v119;
      uint64_t v105 = [v104 countByEnumeratingWithState:&v136 objects:v163 count:16];
      if (v105)
      {
        uint64_t v106 = v105;
        uint64_t v107 = *(void *)v137;
        id v16 = v132;
        do
        {
          uint64_t v108 = 0;
          v109 = v19;
          do
          {
            if (*(void *)v137 != v107) {
              objc_enumerationMutation(v104);
            }
            id v110 = [(WFDatabase *)self performDatabaseLookupForState:*(void *)(*((void *)&v136 + 1) + 8 * v108) actionUUID:v132 reference:v135];
            id v19 = [(WFSmartPromptApprovalResult *)v109 resultByAddingDatabaseResult:v110];

            ++v108;
            v109 = v19;
          }
          while (v106 != v108);
          uint64_t v106 = [v104 countByEnumeratingWithState:&v136 objects:v163 count:16];
        }
        while (v106);
      }
      else
      {
        id v16 = v132;
      }

      id v103 = v19;
      id v102 = v103;
    }

    id v15 = v133;
  }
  else
  {
    v112 = getWFSecurityLogObject();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      v167 = "-[WFDatabase(SmartPrompts) approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIdent"
             "ifier:actionIndex:reference:allowedOnceStates:]";
      _os_log_impl(&dword_1C7F0A000, v112, OS_LOG_TYPE_DEFAULT, "%s The current content attribution set has public disclosure level, no approval required.", buf, 0xCu);
    }

    id v103 = v19;
    id v102 = v103;
  }

  return v102;
}

uint64_t __154__WFDatabase_SmartPrompts__approvalResultForContentAttributionSet_contentDestination_actionUUID_actionIdentifier_actionIndex_reference_allowedOnceStates___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 matches:*(void *)(a1 + 32)];
  if (result) {
    *a3 = 1;
  }
  return result;
}

- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 error:(id *)a4
{
  id v19 = 0;
  id v5 = +[WFWorkflow workflowWithReference:a3 database:self error:&v19];
  id v6 = v19;
  id v7 = v6;
  if (a4) {
    *a4 = v6;
  }
  id v8 = [v5 actions];
  id v9 = [v8 lastObject];

  id v10 = [v9 generateUUIDIfNecessaryWithUUIDProvider:0];
  uint64_t v11 = [WFActionOutputVariable alloc];
  __int16 v12 = [v9 outputName];
  unint64_t v13 = [(WFActionOutputVariable *)v11 initWithOutputUUID:v10 outputName:v12 variableProvider:v9 aggrandizements:0];

  id v14 = +[WFActionRegistry sharedRegistry];
  id v15 = [v14 createActionWithIdentifier:@"is.workflow.actions.output" serializedParameters:0];

  id v16 = [v15 inputParameter];
  uint64_t v17 = objc_msgSend(objc_alloc((Class)objc_msgSend(v16, "stateClass")), "initWithVariable:", v13);
  id v18 = [v16 key];
  [v15 setParameterState:v17 forKey:v18];

  [v5 addAction:v15];
  [v5 save];
}

- (id)conflictForWorkflowReference:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDatabase *)self conflictingReferenceForReference:v4];
  if (v5)
  {
    id v6 = [(WFDatabase *)self recordWithDescriptor:v4 error:0];
    id v7 = [(WFDatabase *)self recordWithDescriptor:v5 error:0];
    id v8 = objc_opt_new();
    if ([v6 isConflictOfOtherWorkflow])
    {
      id v9 = [v5 identifier];
      [v8 setLocalWorkflowID:v9];

      [v8 setLocalWorkflowRecord:v7];
      id v10 = [v4 identifier];
      uint64_t v11 = v6;
    }
    else
    {
      __int16 v12 = [v4 identifier];
      [v8 setLocalWorkflowID:v12];

      [v8 setLocalWorkflowRecord:v6];
      id v10 = [v5 identifier];
      uint64_t v11 = v7;
    }
    [v8 setRemoteWorkflowID:v10];

    [v8 setRemoteWorkflowRecord:v11];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_suggestionsContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_changeNotificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_resultsToNotify, 0);
  objc_storeStrong((id *)&self->_remoteChangeNotificationDebouncer, 0);
  objc_storeStrong((id *)&self->_pendingRemoteChangeNotification, 0);
  objc_storeStrong((id *)&self->_remoteChangeQueue, 0);
  objc_storeStrong((id *)&self->_pendingLocalChangeNotification, 0);
  objc_storeStrong((id *)&self->_persistentStoreDescription, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)setPostDistributedNotifications:(BOOL)a3
{
  self->_postDistributedNotifications = a3;
}

- (BOOL)isPostingDistributedNotifications
{
  return self->_postDistributedNotifications;
}

- (void)setContext:(id)a3
{
}

- (void)setSuggestionsContext:(id)a3
{
}

- (NSManagedObjectContext)suggestionsContext
{
  return self->_suggestionsContext;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)changeNotificationQueue
{
  return self->_changeNotificationQueue;
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObservers:(id)a3
{
}

- (void)setResultsToNotify:(id)a3
{
}

- (WFDebouncer)remoteChangeNotificationDebouncer
{
  return self->_remoteChangeNotificationDebouncer;
}

- (void)setPendingRemoteChangeNotification:(id)a3
{
}

- (WFCoreDataChangeNotification)pendingRemoteChangeNotification
{
  return self->_pendingRemoteChangeNotification;
}

- (OS_dispatch_queue)remoteChangeQueue
{
  return self->_remoteChangeQueue;
}

- (void)setPersistentStoreDescription:(id)a3
{
}

- (NSPersistentStoreDescription)persistentStoreDescription
{
  return self->_persistentStoreDescription;
}

- (void)setDestroysOnDeallocation:(BOOL)a3
{
  self->_destroysOnDealid location = a3;
}

- (BOOL)destroysOnDeallocation
{
  return self->_destroysOnDeallocation;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)setWalrusStateForTesting:(int64_t)a3 withError:(id *)a4
{
  id v8 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __49__WFDatabase_setWalrusStateForTesting_withError___block_invoke;
  v9[3] = &unk_1E6553730;
  void v9[4] = self;
  v9[5] = a3;
  [(WFDatabase *)self performTransactionWithReason:@"clearing Walrus state for testing" block:v9 error:&v8];
  id v5 = v8;
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return v6 == 0;
}

void __49__WFDatabase_setWalrusStateForTesting_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = +[WFCoreDataWorkflow fetchRequest];
  id v5 = [*(id *)(a1 + 32) context];
  id v6 = [v5 executeFetchRequest:v4 error:a2];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v12 setWantedEncryptedSchemaVersion:*(void *)(a1 + 40)];
        [v12 setLastSyncedEncryptedSchemaVersion:*(void *)(a1 + 40)];
        objc_msgSend(v12, "setSyncHash:", objc_msgSend(v12, "computedSyncHash"));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  unint64_t v13 = +[WFCoreDataCollection fetchRequest];

  id v14 = [*(id *)(a1 + 32) context];
  id v15 = [v14 executeFetchRequest:v13 error:a2];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        objc_msgSend(v21, "setWantedEncryptedSchemaVersion:", *(void *)(a1 + 40), (void)v22);
        [v21 setLastSyncedEncryptedSchemaVersion:*(void *)(a1 + 40)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(WFDatabase *)self fileURL];
  id v7 = [v3 stringWithFormat:@"<%@: %p, fileURL: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSArray)activeResults
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__42419;
  uint64_t v11 = __Block_byref_object_dispose__42420;
  id v12 = 0;
  uint64_t v3 = [(WFDatabase *)self context];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__WFDatabase_activeResults__block_invoke;
  v6[3] = &unk_1E6558960;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __27__WFDatabase_activeResults__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) resultsToNotify];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)activeObjectObservers
{
  p_observersLocuint64_t k = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v4 = [(WFDatabase *)self observers];
  id v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_observersLock);
  return (NSArray *)v5;
}

- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v27 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke;
  v28[3] = &unk_1E6553708;
  id v29 = v19;
  BOOL v30 = self;
  id v31 = v16;
  id v32 = v18;
  id v33 = v17;
  id v34 = v14;
  id v35 = v15;
  id v20 = v15;
  id v21 = v14;
  id v22 = v17;
  id v23 = v18;
  id v24 = v16;
  id v25 = v19;
  [(WFDatabase *)self performTransactionWithReason:@"update app descriptor for action" block:v28 error:&v27];
  id v26 = v27;
}

void __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke(uint64_t a1)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(a1 + 32) objectType:0];
  uint64_t v3 = [*(id *)(a1 + 40) recordWithDescriptor:v2 error:0];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__42419;
  id v36 = __Block_byref_object_dispose__42420;
  id v37 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v4 = [v3 actions];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke_2;
  v15[3] = &unk_1E65536E0;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v21 = &v32;
  id v19 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  id v22 = &v28;
  id v23 = &v24;
  [v4 enumerateObjectsUsingBlock:v15];

  if (*((unsigned char *)v25 + 24) && v33[5])
  {
    id v5 = [v3 actions];
    id v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = v29[3];
    uint64_t v8 = *(void *)(a1 + 56);
    v42[0] = @"WFWorkflowActionIdentifier";
    v42[1] = @"WFWorkflowActionParameters";
    uint64_t v9 = v33[5];
    v43[0] = v8;
    v43[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    [v6 replaceObjectAtIndex:v7 withObject:v10];

    [v3 setActions:v6];
    uint64_t v11 = *(void **)(a1 + 40);
    id v14 = 0;
    LOBYTE(v7) = [v11 saveRecord:v3 withDescriptor:v2 error:&v14];
    id v12 = v14;
    if ((v7 & 1) == 0)
    {
      unint64_t v13 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v39 = "-[WFDatabase updateAppDescriptor:atKey:actionUUID:actionIndex:actionIdentifier:workflowID:]_block_invoke";
        __int16 v40 = 2112;
        id v41 = v12;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Unable to update app descriptor in workflow: %@", buf, 0x16u);
      }
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

void __91__WFDatabase_updateAppDescriptor_atKey_actionUUID_actionIndex_actionIdentifier_workflowID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v19 = v7;
  if (!*(void *)(a1 + 32))
  {
    uint64_t v11 = [v7 objectForKey:@"WFWorkflowActionIdentifier"];
    if (([v11 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
    {

      uint64_t v10 = v19;
      goto LABEL_8;
    }
    uint64_t v12 = [*(id *)(a1 + 48) integerValue];

    uint64_t v10 = v19;
    if (v12 != a3) {
      goto LABEL_8;
    }
LABEL_6:
    unint64_t v13 = [v19 objectForKey:@"WFWorkflowActionParameters"];
    uint64_t v14 = [v13 mutableCopy];
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v17 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v18 = [*(id *)(a1 + 56) serializedRepresentation];
    [v17 setObject:v18 forKey:*(void *)(a1 + 64)];

    uint64_t v10 = v19;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_8;
  }
  uint64_t v8 = [v7 objectForKey:@"WFWorkflowActionParameters"];
  uint64_t v9 = [(id)v8 objectForKey:@"UUID"];

  LOBYTE(v8) = [v9 isEqualToString:*(void *)(a1 + 32)];
  uint64_t v10 = v19;
  if (v8) {
    goto LABEL_6;
  }
LABEL_8:
}

- (BOOL)reloadRecord:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = getWFDatabaseLogObject();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = getWFDatabaseLogObject();
  unint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ReloadRecord", "", buf, 2u);
  }

  *(void *)long long buf = 0;
  uint64_t v26 = buf;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__WFDatabase_reloadRecord_withDescriptor_error___block_invoke;
  v21[3] = &unk_1E6553690;
  id v14 = v8;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  uint64_t v24 = buf;
  [(WFDatabase *)self accessStorageForDescriptor:v15 forWriting:0 readingRecordProperties:0 usingBlock:v21 withError:a5];
  id v16 = getWFDatabaseLogObject();
  id v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)id v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v17, OS_SIGNPOST_INTERVAL_END, v11, "ReloadRecord", "", v20, 2u);
  }

  uint8_t v18 = v26[24];
  _Block_object_dispose(buf, 8);

  return v18;
}

void __48__WFDatabase_reloadRecord_withDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [*(id *)(a1 + 32) loadFromStorage:a2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    id v6 = [NSString stringWithFormat:@"Can't reload record %@, descriptor %@ is missing backing storage", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a3 = [v5 errorWithDomain:@"WFDatabaseErrorDomain" code:4 userInfo:v7];
  }
}

- (BOOL)saveRecord:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = getWFDatabaseLogObject();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = getWFDatabaseLogObject();
  unint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SaveRecord", "", buf, 2u);
  }

  *(void *)long long buf = 0;
  uint64_t v27 = buf;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v14 = objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__WFDatabase_saveRecord_withDescriptor_error___block_invoke;
  v22[3] = &unk_1E6553690;
  id v15 = v8;
  id v23 = v15;
  id v16 = v9;
  id v24 = v16;
  id v25 = buf;
  [(WFDatabase *)self accessStorageForDescriptor:v16 forWriting:1 readingRecordProperties:v14 usingBlock:v22 withError:a5];

  id v17 = getWFDatabaseLogObject();
  uint8_t v18 = v17;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)id v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v18, OS_SIGNPOST_INTERVAL_END, v11, "SaveRecord", "", v21, 2u);
  }

  uint8_t v19 = v27[24];
  _Block_object_dispose(buf, 8);

  return v19;
}

void __46__WFDatabase_saveRecord_withDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) saveChangesToStorage:a2 error:a3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28568];
    id v5 = [NSString stringWithFormat:@"Can't save record %@, descriptor %@ is missing backing storage", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    *a3 = [v4 errorWithDomain:@"WFDatabaseErrorDomain" code:4 userInfo:v6];
  }
}

- (Class)recordClassForObjectType:(unint64_t)a3
{
  if (a3 <= 0xA && ((0x40Fu >> a3) & 1) != 0)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (id)missingErrorForDescriptor:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = [v5 name];
  if (v6)
  {
    uint64_t v7 = (void *)v6;

LABEL_14:
    os_signpost_id_t v11 = NSString;
    uint64_t v12 = WFLocalizedString(@"“%@” does not exist.");
    unint64_t v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v7);

    goto LABEL_15;
  }
  id v8 = v3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v7 = [v10 name];

  if (v7) {
    goto LABEL_14;
  }
  unint64_t v13 = WFLocalizedString(@"Item does not exist");
LABEL_15:
  id v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = *MEMORY[0x1E4F28568];
  v19[0] = v13;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v16 = [v14 errorWithDomain:@"WFDatabaseErrorDomain" code:3 userInfo:v15];

  return v16;
}

- (BOOL)hasValidLibrary
{
  if (self) {
    library = self->_library;
  }
  else {
    library = 0;
  }
  return library != 0;
}

void __27__WFDatabase_reloadLibrary__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) latestLibrary];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = *(id *)(v3 + 120);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = v6 ? *(void *)(v6 + 120) : 0;
      int v8 = [v2 isEqual:v7];

      if (v8)
      {
        id v9 = getWFCoherenceLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v2 dotRepresentation];
          int v14 = 136315394;
          id v15 = "-[WFDatabase reloadLibrary]_block_invoke";
          __int16 v16 = 2112;
          id v17 = v10;
          _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_INFO, "%s Got a new Coherence blob from database, but didn't reload (== local): %@", (uint8_t *)&v14, 0x16u);
        }
        goto LABEL_12;
      }
    }
  }
  os_signpost_id_t v11 = getWFCoherenceLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    id v15 = "-[WFDatabase reloadLibrary]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_INFO, "%s Succesfully reloaded the library", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    id v13 = v2;
    id v9 = *(NSObject **)(v12 + 120);
    *(void *)(v12 + 120) = v13;
LABEL_12:
  }
}

- (void)notifyResultsAboutChange:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeNotificationQueue);
  uint64_t v39 = self;
  id v36 = [(WFDatabase *)self activeObjectObservers];
  if ([v36 count])
  {
    id v4 = [v40 updatedDescriptors];
    id v5 = [v40 insertedDescriptors];
    uint64_t v6 = [v40 deletedDescriptors];
    if ([v4 count] || objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = v36;
      uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v52 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v12 = [(WFDatabase *)v39 callbackQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke;
            block[3] = &unk_1E65535A0;
            block[4] = v11;
            void block[5] = v39;
            id v48 = v4;
            id v49 = v5;
            id v50 = v6;
            dispatch_async(v12, block);
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v8);
      }
    }
  }
  id v13 = objc_opt_new();
  int v14 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obja = [(WFDatabase *)v39 activeResults];
  uint64_t v15 = [obja countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v44;
    uint64_t v18 = v13;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(obja);
        }
        id v20 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v21 = [v20 state];
        if (v21)
        {
          id v22 = (void *)v21;
          id v23 = [v20 state];
          int v24 = [v40 appliesToResultState:v23];

          if (!v24) {
            continue;
          }
        }
        id v25 = v20;
        if (v25)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v26 = [v25 fetchOperation];
            uint64_t v27 = [v13 objectForKeyedSubscript:v26];

            if (!v27)
            {
              uint64_t v28 = objc_opt_new();
              [v13 setObject:v28 forKeyedSubscript:v26];
            }
            char v29 = [v13 objectForKeyedSubscript:v26];
            [v29 addObject:v25];

            uint64_t v30 = v25;
          }
          else
          {
            uint64_t v30 = 0;
            uint64_t v26 = v25;
          }

          id v31 = v25;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v32 = [v31 libraryQuery];
            id v33 = [v14 objectForKeyedSubscript:v32];

            if (!v33)
            {
              uint64_t v34 = objc_opt_new();
              [v14 setObject:v34 forKeyedSubscript:v32];
            }
            id v35 = [v14 objectForKeyedSubscript:v32];
            [v35 addObject:v31];
          }
        }
        else
        {
          uint64_t v30 = 0;
        }

        id v13 = v18;
      }
      uint64_t v16 = [obja countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v16);
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  void v42[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke_2;
  v42[3] = &unk_1E65535F0;
  v42[4] = v39;
  [v13 enumerateKeysAndObjectsUsingBlock:v42];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke_290;
  v41[3] = &unk_1E6553618;
  v41[4] = v39;
  [v14 enumerateKeysAndObjectsUsingBlock:v41];
}

uint64_t __39__WFDatabase_notifyResultsAboutChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) databaseDidChange:*(void *)(a1 + 40) modified:*(void *)(a1 + 48) inserted:*(void *)(a1 + 56) removed:*(void *)(a1 + 64)];
}

void __39__WFDatabase_notifyResultsAboutChange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__42419;
  uint64_t v27 = __Block_byref_object_dispose__42420;
  id v28 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __39__WFDatabase_notifyResultsAboutChange___block_invoke_3;
  v20[3] = &unk_1E65535C8;
  void v20[4] = v7;
  id v8 = v5;
  id v21 = v8;
  id v22 = &v23;
  id v19 = 0;
  uint64_t v9 = [v7 performOperationWithReason:@"re-querying for results" block:v20 error:&v19];
  id v10 = v19;
  if (v9)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "updateDescriptorsAndNotify:state:", v9, v24[5], (void)v15);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v29 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v11 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      id v31 = "-[WFDatabase notifyResultsAboutChange:]_block_invoke_2";
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to query descriptors for fetch operation: %@. Error: %@", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v23, 8);
}

void __39__WFDatabase_notifyResultsAboutChange___block_invoke_290(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 120);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_msgSend(v5, "performReturningShortcutsIn:database:error:", v8);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    goto LABEL_8;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    uint64_t v13 = *(void *)(v12 + 120);
  }
  else {
    uint64_t v13 = 0;
  }
  objc_msgSend(v5, "performReturningCollectionsIn:database:error:", v13);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_8:
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v20 = objc_msgSend(v19, "state", (void)v21);
          [v19 updateDescriptorsAndNotify:v11 state:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
    goto LABEL_19;
  }
  int v14 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v27 = "-[WFDatabase notifyResultsAboutChange:]_block_invoke";
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to query descriptors for library query: %@", buf, 0x16u);
  }
  id v11 = 0;
LABEL_19:
}

id __39__WFDatabase_notifyResultsAboutChange___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v3 descriptorsForFetchOperation:v2 state:&obj error:a2];
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

- (void)remoteChangeDebouncerDidFire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_remoteChangeQueue);
  uint64_t v3 = [(WFDatabase *)self pendingRemoteChangeNotification];
  if (v3)
  {
    [(WFDatabase *)self setPendingRemoteChangeNotification:0];
    changeNotificationQueue = self->_changeNotificationQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__WFDatabase_remoteChangeDebouncerDidFire__block_invoke;
    v5[3] = &unk_1E6558938;
    id v6 = v3;
    uint64_t v7 = self;
    dispatch_async(changeNotificationQueue, v5);
  }
}

void __42__WFDatabase_remoteChangeDebouncerDidFire__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) updatedDescriptors];
  uint64_t v3 = [v2 objectsPassingTest:&__block_literal_global_42578];
  id v4 = [v3 anyObject];

  if (v4) {
    [*(id *)(a1 + 40) reloadLibrary];
  }
  [*(id *)(a1 + 40) notifyResultsAboutChange:*(void *)(a1 + 32)];
}

BOOL __42__WFDatabase_remoteChangeDebouncerDidFire__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = [a2 objectType];
  if (v4 == 10) {
    *a3 = 1;
  }
  return v4 == 10;
}

- (void)remoteContextDidSave:(id)a3
{
  id v4 = a3;
  remoteChangeQueue = self->_remoteChangeQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__WFDatabase_remoteContextDidSave___block_invoke;
  v7[3] = &unk_1E6558938;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(remoteChangeQueue, v7);
}

void __35__WFDatabase_remoteContextDidSave___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) userInfo];
    int v10 = 136315394;
    id v11 = "-[WFDatabase remoteContextDidSave:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_INFO, "%s Received remote context save notification: %@", (uint8_t *)&v10, 0x16u);
  }
  id v4 = objc_alloc(MEMORY[0x1E4FB4690]);
  id v5 = [*(id *)(a1 + 32) userInfo];
  id v6 = (void *)[v4 initWithDictionaryRepresentation:v5];

  if (([v6 originatedInCurrentProcess] & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 40) pendingRemoteChangeNotification];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 40) pendingRemoteChangeNotification];
      uint64_t v9 = [v8 notificationByMergingChangesFromNotification:v6];

      id v6 = (void *)v9;
    }
    [*(id *)(a1 + 40) setPendingRemoteChangeNotification:v6];
    [*(id *)(*(void *)(a1 + 40) + 64) poke];
  }
}

uint64_t __29__WFDatabase_contextDidSave___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyResultsAboutChange:*(void *)(a1 + 40)];
}

- (void)addPendingDeletedDescriptor:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB4690];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = objc_opt_new();
  id v8 = objc_opt_new();
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = objc_alloc(MEMORY[0x1E4FB4698]);
  id v11 = [v5 identifier];
  uint64_t v12 = [v5 objectType];

  uint64_t v13 = (void *)[v10 initWithIdentifier:v11 objectType:v12];
  uint64_t v14 = [v9 setWithObject:v13];
  id v15 = (id)[v6 initWithInvalidatedAllObjects:0 updated:v7 inserted:v8 deleted:v14 processIdentifier:getpid()];

  [(WFDatabase *)self addPendingLocalChangeNotification:v15];
}

- (void)addPendingInsertedDescriptor:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB4690];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = objc_opt_new();
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = objc_alloc(MEMORY[0x1E4FB4698]);
  id v10 = [v5 identifier];
  uint64_t v11 = [v5 objectType];

  uint64_t v12 = (void *)[v9 initWithIdentifier:v10 objectType:v11];
  uint64_t v13 = [v8 setWithObject:v12];
  uint64_t v14 = objc_opt_new();
  id v15 = (id)[v6 initWithInvalidatedAllObjects:0 updated:v7 inserted:v13 deleted:v14 processIdentifier:getpid()];

  [(WFDatabase *)self addPendingLocalChangeNotification:v15];
}

- (void)addPendingUpdatedDescriptor:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB4690];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = objc_alloc(MEMORY[0x1E4FB4698]);
  id v9 = [v5 identifier];
  uint64_t v10 = [v5 objectType];

  uint64_t v11 = (void *)[v8 initWithIdentifier:v9 objectType:v10];
  uint64_t v12 = [v7 setWithObject:v11];
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = objc_opt_new();
  id v15 = (id)[v6 initWithInvalidatedAllObjects:0 updated:v12 inserted:v13 deleted:v14 processIdentifier:getpid()];

  [(WFDatabase *)self addPendingLocalChangeNotification:v15];
}

- (BOOL)object:(id)a3 didUpdateProperties:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFDatabase.m", 579, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [NSString stringWithFormat:@"properties %@ of %@ updated out-of-band from WFRecord change tracking", v10, v9];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__WFDatabase_object_didUpdateProperties_error___block_invoke;
    v18[3] = &unk_1E65541B8;
    id v19 = v9;
    id v20 = v10;
    id v17 = 0;
    id v12 = [(WFDatabase *)self performSaveOperationWithReason:v11 block:v18 error:&v17];
    id v13 = v17;

    if (a5) {
      *a5 = v13;
    }
    BOOL v14 = v13 == 0;
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

uint64_t __47__WFDatabase_object_didUpdateProperties_error___block_invoke(uint64_t a1)
{
  return 0;
}

- (void)objectWasCreated:(id)a3 identifier:(id)a4
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [WFCoreDataWorkflowActions alloc];
    id v6 = [(WFDatabase *)self context];
    uint64_t v7 = [(WFCoreDataWorkflowActions *)v5 initWithContext:v6];

    [v8 setValue:v7 forKey:@"actions"];
  }
}

- (id)objectOfClass:(Class)a3 withIdentifier:(id)a4 forKey:(id)a5 createIfNecessary:(BOOL)a6 properties:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [(objc_class *)a3 fetchRequest];
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", v13, v12];
  [v15 setPredicate:v16];

  [v15 setFetchLimit:1];
  [v15 setPropertiesToFetch:v14];

  id v17 = [(WFDatabase *)self context];
  long long v18 = [v17 executeFetchRequest:v15 error:0];

  id v19 = [v18 firstObject];
  id v20 = WFEnforceClass(v19, (uint64_t)a3);

  if (!v20 && v8)
  {
    id v21 = [a3 alloc];
    long long v22 = [(WFDatabase *)self context];
    id v20 = (void *)[v21 initWithContext:v22];

    [v20 setValue:v12 forKey:v13];
    [(WFDatabase *)self objectWasCreated:v20 identifier:v12];
  }

  return v20;
}

- (id)recordWithDescriptor:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = getWFDatabaseLogObject();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = getWFDatabaseLogObject();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LoadRecord", "", buf, 2u);
  }

  *(void *)long long buf = 0;
  uint64_t v26 = buf;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__42419;
  id v29 = __Block_byref_object_dispose__42420;
  id v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__WFDatabase_recordWithDescriptor_properties_error___block_invoke;
  v21[3] = &unk_1E6553558;
  void v21[4] = self;
  id v14 = v8;
  id v22 = v14;
  long long v24 = buf;
  id v15 = v9;
  id v23 = v15;
  [(WFDatabase *)self accessStorageForDescriptor:v14 forWriting:0 readingRecordProperties:v15 usingBlock:v21 withError:a5];
  uint64_t v16 = getWFDatabaseLogObject();
  id v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)id v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v17, OS_SIGNPOST_INTERVAL_END, v11, "LoadRecord", "", v20, 2u);
  }

  id v18 = *((id *)v26 + 5);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __52__WFDatabase_recordWithDescriptor_properties_error___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)a1[4];
    id v4 = (void *)a1[5];
    id v5 = a2;
    uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "recordClassForObjectType:", objc_msgSend(v4, "objectType"))), "initWithStorage:properties:", v5, a1[6]);

    uint64_t v7 = *(void *)(a1[7] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)recordWithDescriptor:(id)a3 error:(id *)a4
{
  return [(WFDatabase *)self recordWithDescriptor:a3 properties:0 error:a4];
}

- (void)accessStorageForDescriptor:(id)a3 forWriting:(BOOL)a4 readingRecordProperties:(id)a5 usingBlock:(id)a6 withError:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!v13)
  {
    id v23 = 0;
LABEL_11:
    aBlocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    __int16 v34 = __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_3;
    id v35 = &unk_1E6553530;
    uint64_t v36 = self;
    id v26 = v12;
    id v37 = v26;
    id v27 = v23;
    id v38 = v27;
    id v39 = v14;
    __int16 v28 = _Block_copy(&aBlock);
    if (v10)
    {
      id v29 = [NSString stringWithFormat:@"writing to storage for %@", v26, aBlock, v33, v34, v35, v36, v37, v38];
      id v30 = [(WFDatabase *)self performSaveOperationWithReason:v29 block:v28 error:a7];
    }
    else
    {
      id v29 = [NSString stringWithFormat:@"reading storage for %@", v26, aBlock, v33, v34, v35, v36, v37, v38];
      id v31 = [(WFDatabase *)self performOperationWithReason:v29 block:v28 error:a7];
    }

    goto LABEL_15;
  }
  id v15 = WFRecordStorageClassForObjectType([v12 objectType]);
  id v16 = WFCoreDataClassForObjectType([v12 objectType]);
  if (v15)
  {
    id v17 = v16;
    if (v16)
    {
      id v18 = &unk_1C856C000;
      if (objc_opt_respondsToSelector())
      {
        id v19 = [v15 recordPropertyMap];
        id v20 = [v13 allObjects];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        void v42[2] = __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke;
        v42[3] = &unk_1E6557BC8;
        id v43 = v19;
        id v21 = v19;
        id v22 = objc_msgSend(v20, "if_map:", v42);

        id v18 = (void *)&unk_1C856C000;
      }
      else
      {
        id v22 = [v13 allObjects];
      }
      long long v24 = [v17 entity];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = v18[180];
      v40[2] = __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_2;
      v40[3] = &unk_1E65540A0;
      id v41 = v24;
      id v25 = v24;
      id v23 = objc_msgSend(v22, "if_objectsPassingTest:", v40);

      goto LABEL_11;
    }
  }
  if (a7)
  {
    *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFDatabaseErrorDomain" code:0 userInfo:0];
  }
LABEL_15:
}

id __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = v4;
  if (!v4) {
    id v4 = v3;
  }
  id v6 = v4;

  return v6;
}

BOOL __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 propertiesByName];
  id v5 = [v4 objectForKey:v3];

  return v5 != 0;
}

uint64_t __97__WFDatabase_accessStorageForDescriptor_forWriting_readingRecordProperties_usingBlock_withError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  return 0;
}

- (id)objectForDescriptor:(id)a3 properties:(id)a4 createIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (objc_class *)WFRecordStorageClassForObjectType([v8 objectType]);
  os_signpost_id_t v11 = (objc_class *)WFCoreDataClassForObjectType([v8 objectType]);
  id v12 = 0;
  if (v10)
  {
    id v13 = v11;
    if (v11)
    {
      id v14 = [v8 identifier];
      unint64_t v15 = [v8 objectType];
      if (v15 <= 0xA && ((0x6FFu >> v15) & 1) != 0 && v14)
      {
        id v16 = [(WFDatabase *)self objectOfClass:v13 withIdentifier:v14 forKey:off_1E65538D0[v15] createIfNecessary:v5 properties:v9];
        id v17 = v16;
        if (v10 == v13) {
          id v18 = v16;
        }
        else {
          id v18 = (id)[[v10 alloc] initWithManagedObject:v16 database:self];
        }
        id v12 = v18;
      }
      else
      {
        id v12 = 0;
      }
    }
  }

  return v12;
}

- (id)objectForDescriptor:(id)a3 properties:(id)a4
{
  return [(WFDatabase *)self objectForDescriptor:a3 properties:a4 createIfNecessary:0];
}

- (void)removeObjectObserver:(id)a3
{
  p_observersLocuint64_t k = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  id v6 = [(WFDatabase *)self observers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFDatabase *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFDatabase *)self context];
      id v6 = [(WFDatabase *)v4 context];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v13 = "-[WFDatabase dealloc]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s Deallocating WFDatabase", buf, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4F1BE28];
  id v6 = [(WFDatabase *)self context];
  [v4 removeObserver:self name:v5 object:v6];

  if ([(WFDatabase *)self destroysOnDeallocation])
  {
    char v7 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v13 = "-[WFDatabase dealloc]";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Destroying persistent store coordinator", buf, 0xCu);
    }

    id v8 = [(WFDatabase *)self context];
    id v9 = [v8 persistentStoreCoordinator];
    BOOL v10 = [(WFDatabase *)self fileURL];
    [v9 destroyPersistentStoreAtURL:v10 withType:*MEMORY[0x1E4F1BF70] options:0 error:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)WFDatabase;
  [(WFDatabase *)&v11 dealloc];
}

- (void)invalidateAllObjectsAndNotify
{
  id v3 = objc_alloc(MEMORY[0x1E4FB4690]);
  id v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  char v7 = (void *)[v3 initWithInvalidatedAllObjects:1 updated:v4 inserted:v5 deleted:v6 processIdentifier:getpid()];

  changeNotificationQueue = self->_changeNotificationQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __43__WFDatabase_invalidateAllObjectsAndNotify__block_invoke;
  v10[3] = &unk_1E6558938;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(changeNotificationQueue, v10);
}

uint64_t __43__WFDatabase_invalidateAllObjectsAndNotify__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyResultsAboutChange:*(void *)(a1 + 40)];
}

- (BOOL)replaceWithFileAtURL:(id)a3 error:(id *)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(WFDatabase *)self context];
  id v8 = [v7 persistentStoreCoordinator];

  id v9 = [(WFDatabase *)self persistentStoreDescription];
  BOOL v10 = [v9 URL];

  if (v10)
  {
    [v6 startAccessingSecurityScopedResource];
    uint64_t v11 = *MEMORY[0x1E4F1BDE8];
    v37[0] = *MEMORY[0x1E4F1BE50];
    v37[1] = v11;
    v38[0] = MEMORY[0x1E4F1CC38];
    v38[1] = MEMORY[0x1E4F1CC38];
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    uint64_t v13 = *MEMORY[0x1E4F1BF70];
    id v32 = 0;
    char v14 = [v8 replacePersistentStoreAtURL:v10 destinationOptions:0 withPersistentStoreFromURL:v6 sourceOptions:v12 storeType:v13 error:&v32];
    id v15 = v32;
    id v16 = v15;
    if (v14)
    {
      id v29 = v15;
      [v6 stopAccessingSecurityScopedResource];
      id v17 = objc_msgSend(MEMORY[0x1E4F1C190], "wf_shortcutsConfiguration");
      id v18 = [v17 type];
      [v17 configuration];
      id v19 = v12;
      v21 = id v20 = a4;
      id v22 = [v17 URL];
      id v30 = v19;
      id v31 = v8;
      id v23 = [v8 addPersistentStoreWithType:v18 configuration:v21 URL:v22 options:v19 error:v20];
      BOOL v24 = v23 != 0;

      if (v23)
      {
        [(WFDatabase *)self invalidateAllObjectsAndNotify];
      }
      else
      {
        id v26 = getWFDatabaseLogObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = *v20;
          *(_DWORD *)long long buf = 136315394;
          __int16 v34 = "-[WFDatabase replaceWithFileAtURL:error:]";
          __int16 v35 = 2112;
          uint64_t v36 = v27;
          _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s Error adding persistent store: %@", buf, 0x16u);
        }
      }
      id v8 = v31;
      id v16 = v29;

      id v12 = v30;
    }
    else
    {
      id v25 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        __int16 v34 = "-[WFDatabase replaceWithFileAtURL:error:]";
        __int16 v35 = 2112;
        uint64_t v36 = v16;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, "%s Error replacing persistent store: %@", buf, 0x16u);
      }

      BOOL v24 = 0;
      *a4 = v16;
    }
  }
  else
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"WFDatabaseErrorDomain" code:0 userInfo:MEMORY[0x1E4F1CC08]];
    BOOL v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (NSURL)exportableURL
{
  v49[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSTemporaryDirectory();
  uint64_t v5 = [v3 fileURLWithPath:v4];

  id v6 = [(WFDatabase *)self fileURL];
  uint64_t v7 = [v6 lastPathComponent];

  v49[0] = v7;
  id v8 = [NSString stringWithFormat:@"%@-shm", v7];
  v49[1] = v8;
  __int16 v34 = (void *)v7;
  id v9 = [NSString stringWithFormat:@"%@-wal", v7];
  v49[2] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];

  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [v5 URLByAppendingPathComponent:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        id v18 = [v17 path];
        int v19 = [v11 fileExistsAtPath:v18];

        if (v19)
        {
          id v37 = 0;
          [v11 removeItemAtURL:v17 error:&v37];
          id v20 = v37;
          if (v20)
          {
            BOOL v24 = v20;
            id v25 = getWFDatabaseLogObject();
            id v26 = v34;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315650;
              id v43 = "-[WFDatabase exportableURL]";
              __int16 v44 = 2112;
              long long v45 = v34;
              __int16 v46 = 2112;
              __int16 v47 = v24;
              _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, "%s Error removing the existing %@ database file: %@", buf, 0x20u);
            }

            id v27 = 0;
            goto LABEL_26;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  ppDb = 0;
  id v21 = [(WFDatabase *)self fileURL];
  int v22 = sqlite3_open_v2((const char *)[v21 fileSystemRepresentation], &ppDb, 1, 0);

  if (v22)
  {
    id v23 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v43 = "-[WFDatabase exportableURL]";
      _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s Failed to open the database to export", buf, 0xCu);
    }
    goto LABEL_24;
  }
  __int16 v28 = [(WFDatabase *)self fileURL];
  id v29 = [v28 lastPathComponent];
  id v30 = [v5 URLByAppendingPathComponent:v29];

  id v23 = v30;
  [v23 fileSystemRepresentation];
  if (!_sqlite3_db_copy_compact())
  {
    db = 0;
    id v23 = v23;
    if (!sqlite3_open_v2((const char *)[v23 fileSystemRepresentation], &db, 1, 0))
    {
      sqlite3_wal_checkpoint_v2(db, 0, 1, 0, 0);
      id v27 = v23;
      goto LABEL_25;
    }
    id v31 = getWFDatabaseLogObject();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)long long buf = 136315138;
    id v43 = "-[WFDatabase exportableURL]";
    id v32 = "%s Failed to open the database to export";
    goto LABEL_22;
  }
  id v31 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    id v43 = "-[WFDatabase exportableURL]";
    id v32 = "%s Failed to copy the database to export";
LABEL_22:
    _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
  }
LABEL_23:

LABEL_24:
  id v27 = 0;
LABEL_25:
  id v26 = v34;

LABEL_26:
  return (NSURL *)v27;
}

+ (id)createDatabaseForTesting
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F5AA28];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  id v6 = [v3 createTemporaryFileWithFilename:v5];

  uint64_t v7 = getWFTestingLifecycleLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "+[WFDatabase createDatabaseForTesting]";
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Creating test database at %@", (uint8_t *)&v11, 0x16u);
  }

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C190]) initWithURL:v6];
  [v8 setType:*MEMORY[0x1E4F1BF70]];
  id v9 = (void *)[objc_alloc((Class)a1) initWithStoreDescription:v8 runMigrationsIfNecessary:0 useLockFile:1 error:0];
  [v9 setDestroysOnDeallocation:1];
  [v9 setPostDistributedNotifications:0];

  return v9;
}

- (id)allShortcutBookmarks
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[WFCoreDataShortcutBookmark fetchRequest];
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"path" ascending:0];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = [[WFCoreDataDatabaseResult alloc] initWithDatabase:self fetchRequest:v3];
  return v6;
}

- (BOOL)deleteAllBookmarksForWorkflowID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __63__WFDatabase_Bookmarks__deleteAllBookmarksForWorkflowID_error___block_invoke;
  v9[3] = &unk_1E6558A40;
  id v10 = v6;
  int v11 = self;
  id v7 = v6;
  [(WFDatabase *)self performTransactionWithReason:@"delete all bookmarks for shortcut" block:v9 error:a4];

  return a4 == 0;
}

void __63__WFDatabase_Bookmarks__deleteAllBookmarksForWorkflowID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = +[WFCoreDataShortcutBookmark fetchRequest];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", *(void *)(a1 + 32)];
  [v8 setPredicate:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
  id v6 = [*(id *)(a1 + 40) context];
  id v7 = (id)[v6 executeRequest:v5 error:a2];
}

- (id)bookmarksForWorkflowID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __54__WFDatabase_Bookmarks__bookmarksForWorkflowID_error___block_invoke;
  v10[3] = &unk_1E6553FB0;
  id v11 = v6;
  id v12 = self;
  id v7 = v6;
  id v8 = [(WFDatabase *)self performOperationWithReason:@"getting bookmarks for workflow" block:v10 error:a4];

  return v8;
}

id __54__WFDatabase_Bookmarks__bookmarksForWorkflowID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[WFCoreDataShortcutBookmark fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = [*(id *)(a1 + 40) context];
  id v7 = [v6 executeFetchRequest:v4 error:a2];

  id v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_44913);

  return v8;
}

uint64_t __54__WFDatabase_Bookmarks__bookmarksForWorkflowID_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (id)bookmarkDataForWorkflowID:(id)a3 path:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__WFDatabase_Bookmarks__bookmarkDataForWorkflowID_path_error___block_invoke;
  void v14[3] = &unk_1E6553F68;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v10 = v9;
  id v11 = v8;
  id v12 = [(WFDatabase *)self performOperationWithReason:@"getting bookmark data for workflow+path" block:v14 error:a5];

  return v12;
}

id __62__WFDatabase_Bookmarks__bookmarkDataForWorkflowID_path_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[WFCoreDataShortcutBookmark fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@ AND %K = %@", @"identifier", *(void *)(a1 + 32), @"path", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = [*(id *)(a1 + 48) context];
  id v7 = [v6 executeFetchRequest:v4 error:a2];
  id v8 = [v7 firstObject];

  id v9 = [v8 descriptor];

  return v9;
}

- (id)createBookmarkWithWorkflowID:(id)a3 path:(id)a4 bookmarkData:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__WFDatabase_Bookmarks__createBookmarkWithWorkflowID_path_bookmarkData_error___block_invoke;
  v18[3] = &unk_1E6553F40;
  id v19 = v10;
  id v20 = v11;
  id v21 = self;
  id v22 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = [(WFDatabase *)self performSaveOperationWithReason:@"save bookmark for workflow+path (update if needed)" block:v18 error:a6];

  return v16;
}

id __78__WFDatabase_Bookmarks__createBookmarkWithWorkflowID_path_bookmarkData_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = +[WFCoreDataShortcutBookmark fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@ AND %K = %@", @"identifier", *(void *)(a1 + 32), @"path", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = [*(id *)(a1 + 48) context];
  id v7 = [v6 executeFetchRequest:v4 error:a2];
  id v8 = [v7 firstObject];

  if (v8)
  {
    id v9 = getWFFilesLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v16 = "-[WFDatabase(Bookmarks) createBookmarkWithWorkflowID:path:bookmarkData:error:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Found existing bookmark updating instead", buf, 0xCu);
    }

    [v8 setBookmarkData:*(void *)(a1 + 56)];
    id v10 = [v8 descriptor];
  }
  else
  {
    id v11 = [WFCoreDataShortcutBookmark alloc];
    id v12 = [*(id *)(a1 + 48) context];
    id v13 = [(WFCoreDataShortcutBookmark *)v11 initWithContext:v12];

    [(WFCoreDataShortcutBookmark *)v13 setPath:*(void *)(a1 + 40)];
    [(WFCoreDataShortcutBookmark *)v13 setBookmarkData:*(void *)(a1 + 56)];
    [(WFCoreDataShortcutBookmark *)v13 setIdentifier:*(void *)(a1 + 32)];
    id v10 = [(WFCoreDataShortcutBookmark *)v13 descriptor];
  }
  return v10;
}

- (void)deleteDonationsForShortcutWithIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFDatabase+Shortcuts.m", 1015, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v13[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v7 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  uint64_t v8 = *MEMORY[0x1E4FB4BE8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __66__WFDatabase_Shortcuts__deleteDonationsForShortcutWithIdentifier___block_invoke;
  void v11[3] = &unk_1E6557668;
  id v12 = v5;
  id v9 = v5;
  [v7 deleteInteractionsWithGroupIdentifiers:v6 bundleID:v8 protectionClass:0 completionHandler:v11];
}

void __66__WFDatabase_Shortcuts__deleteDonationsForShortcutWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *MEMORY[0x1E4FB4BB8];
      int v7 = 136315906;
      uint64_t v8 = "-[WFDatabase(Shortcuts) deleteDonationsForShortcutWithIdentifier:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_ERROR, "%s Error deleting interactions for workflow reference %@, attributed to %@: %{public}@", (uint8_t *)&v7, 0x2Au);
    }
  }
}

- (id)duplicateNameErrorWithName:(id)a3
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  v12[0] = *MEMORY[0x1E4F28588];
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = WFLocalizedString(@"You already have a shortcut named “%@”.");
  int v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, v5, v12[0]);

  v13[0] = v7;
  v12[1] = *MEMORY[0x1E4F28568];
  uint64_t v8 = WFLocalizedString(@"Please choose another name for this shortcut.");
  v13[1] = v8;
  __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = [v3 errorWithDomain:@"WFWorkflowErrorDomain" code:1 userInfo:v9];

  return v10;
}

- (id)validateWorkflowName:(id)a3 forCreation:(BOOL)a4 overwriting:(BOOL)a5 error:(id *)a6
{
  v28[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(a3, "wf_trimmedString");
  if (objc_msgSend(v8, "wf_isEmpty"))
  {
    if (!a6) {
      goto LABEL_11;
    }
    __int16 v9 = (void *)MEMORY[0x1E4F28C58];
    v27[0] = *MEMORY[0x1E4F28588];
    uint64_t v10 = WFLocalizedString(@"Invalid Name");
    v28[0] = v10;
    v27[1] = *MEMORY[0x1E4F28568];
    __int16 v11 = WFLocalizedString(@"Please enter a name for this shortcut.");
    v28[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    *a6 = [v9 errorWithDomain:@"WFWorkflowErrorDomain" code:0 userInfo:v12];

    goto LABEL_10;
  }
  if (a5)
  {
LABEL_5:
    a6 = v8;
    goto LABEL_11;
  }
  __int16 v13 = +[WFHomeManager cachedHomeSceneNames];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__WFDatabase_Shortcuts__validateWorkflowName_forCreation_overwriting_error___block_invoke;
  v23[3] = &unk_1E65540A0;
  id v14 = v8;
  id v24 = v14;
  uint64_t v15 = objc_msgSend(v13, "if_firstObjectPassingTest:", v23);

  if (a6 && v15)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    v25[0] = *MEMORY[0x1E4F28588];
    uint64_t v17 = WFLocalizedString(@"Name Cannot Be Used");
    v26[0] = v17;
    v25[1] = *MEMORY[0x1E4F28568];
    id v18 = NSString;
    id v19 = WFLocalizedString(@"You already have a Home scene named “%@”. Please choose another name for this shortcut.");
    id v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v14);
    v26[1] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    *a6 = [v16 errorWithDomain:@"WFWorkflowErrorDomain" code:1 userInfo:v21];
  }
  else
  {

    if (!v15) {
      goto LABEL_5;
    }
  }
LABEL_10:
  a6 = 0;
LABEL_11:

  return a6;
}

BOOL __76__WFDatabase_Shortcuts__validateWorkflowName_forCreation_overwriting_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedStandardCompare:*(void *)(a1 + 32)] == 0;
}

- (id)duplicateReference:(id)a3 newName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke;
  void v14[3] = &unk_1E6554208;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = [(WFDatabase *)self performSaveOperationWithReason:@"duplicate workflow" block:v14 error:a5];

  return v12;
}

id __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = WFEnforceClass(v4, v5);

  if (v6)
  {
    int v7 = [(WFRecord *)[WFWorkflowRecord alloc] initWithStorage:v6 properties:0];
    id v8 = v7;
    if (v7)
    {
      [(WFWorkflowRecord *)v7 setName:*(void *)(a1 + 48)];
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = objc_opt_class();
      id v11 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v12 = [v11 UUIDString];
      __int16 v13 = [v9 objectOfClass:v10 withIdentifier:v12 forKey:@"workflowID" createIfNecessary:1 properties:0];

      if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
      {
        id v14 = *(void **)(a1 + 32);
        if (v14) {
          id v14 = (void *)v14[15];
        }
        id v15 = v14;
        id v16 = [v13 workflowID];
        [v15 prependShortcutWithId:v16];

        uint64_t v17 = *(void **)(a1 + 32);
        if (v17) {
          uint64_t v17 = (void *)v17[15];
        }
        id v18 = v17;
        id v19 = [v6 identifier];
        id v20 = [v18 collectionsAndFoldersContainingShortcut:v19 error:0];

        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke_2;
        v46[3] = &unk_1E65541E0;
        v46[4] = *(void *)(a1 + 32);
        id v47 = v6;
        id v48 = v13;
        id obj = v20;
        [v20 enumerateObjectsUsingBlock:v46];
        id v21 = *(void **)(a1 + 32);
        if (v21) {
          id v22 = (void *)v21[15];
        }
        else {
          id v22 = 0;
        }
        id v23 = v22;
        [v21 saveLibraryToDatabase:v23];
      }
      else
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v25 = v6;
        id obj = [v6 parents];
        uint64_t v26 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = a1;
          long long v39 = v8;
          uint64_t v40 = a2;
          uint64_t v29 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v43 != v29) {
                objc_enumerationMutation(obj);
              }
              id v31 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              id v32 = objc_msgSend(v31, "shortcuts", v39, v40);
              uint64_t v33 = [v32 indexOfObject:v25];

              if (v33 != 0x7FFFFFFFFFFFFFFFLL)
              {
                __int16 v34 = [v31 shortcuts];
                __int16 v35 = (void *)[v34 mutableCopy];

                [v35 insertObject:v13 atIndex:v33 + 1];
                [v31 setShortcuts:v35];
                uint64_t v36 = *(void **)(v28 + 32);
                id v49 = @"shortcuts";
                id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v49 count:1];

                [v36 object:v31 didUpdateProperties:v37 error:0];
                id v25 = v6;
              }
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v27);
          id v8 = v39;
          a2 = v40;
        }
      }

      if ([(WFRecord *)v8 writeToStorage:v13 error:a2])
      {
        id v24 = [v13 descriptor];
      }
      else
      {
        id v24 = 0;
      }
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

void __58__WFDatabase_Shortcuts__duplicateReference_newName_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  uint64_t v5 = WFWorkflowTypeForCollectionIdentifier(v4);

  uint64_t v6 = [v3 identifier];
  int v7 = [v6 isEqualToString:@"Root"];

  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[15];
  }
  id v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 40) identifier];
  if (v5)
  {
    id v11 = [v3 identifier];
    id v47 = 0;
    uint64_t v12 = [v9 indexOfShortcutWithIdentifier:v10 inCollectionWithIdentifier:v11 error:&v47];
    id v13 = v47;

    if (v12)
    {
      id v14 = *(void **)(a1 + 32);
      if (v14) {
        id v14 = (void *)v14[15];
      }
      id v15 = v14;
      id v16 = [*(id *)(a1 + 48) workflowID];
      uint64_t v17 = [v12 integerValue] + 1;
      id v18 = [v3 identifier];
      id v46 = v13;
      [v15 insertShortcutWithIdentifier:v16 atIndex:v17 toCollection:v18 error:&v46];
      id v19 = v46;

      id v13 = v19;
    }
    id v20 = *(void **)(a1 + 32);
    id v21 = objc_alloc(MEMORY[0x1E4FB4698]);
    id v22 = [v3 identifier];
    id v23 = (void *)[v21 initWithIdentifier:v22 objectType:2];
    [v20 addPendingUpdatedDescriptor:v23];

    id v24 = *(void **)(a1 + 32);
    id v25 = (objc_class *)MEMORY[0x1E4FB4698];
LABEL_15:
    id v30 = (void *)[[v25 alloc] initWithIdentifier:@"Root" objectType:2];
    [v24 addPendingUpdatedDescriptor:v30];
    goto LABEL_16;
  }
  if (v7)
  {
    id v45 = 0;
    uint64_t v12 = [v9 indexOfShortcutWithIdentifier:v10 inCollectionWithIdentifier:@"Root" error:&v45];
    id v13 = v45;

    if (v12)
    {
      uint64_t v26 = *(void **)(a1 + 32);
      if (v26) {
        uint64_t v26 = (void *)v26[15];
      }
      uint64_t v27 = v26;
      uint64_t v28 = [*(id *)(a1 + 48) workflowID];
      id v44 = v13;
      objc_msgSend(v27, "moveShortcutWithIdentifier:toIndex:ofCollectionWithIdentifier:error:", v28, objc_msgSend(v12, "integerValue"), @"Root", &v44);
      id v29 = v44;

      id v13 = v29;
    }
    id v24 = *(void **)(a1 + 32);
    id v25 = (objc_class *)MEMORY[0x1E4FB4698];
    goto LABEL_15;
  }
  id v32 = [v3 identifier];
  id v43 = 0;
  uint64_t v12 = [v9 indexOfShortcutWithShortcut:v10 folderIdentifier:v32 error:&v43];
  id v13 = v43;

  if (v12)
  {
    uint64_t v33 = *(void **)(a1 + 32);
    if (v33) {
      uint64_t v33 = (void *)v33[15];
    }
    __int16 v34 = v33;
    __int16 v35 = [*(id *)(a1 + 48) workflowID];
    uint64_t v36 = [v12 integerValue] + 1;
    id v37 = [v3 identifier];
    id v42 = v13;
    [v34 moveShortcutWithIdentifier:v35 toIndex:v36 ofFolderWithIdentifier:v37 error:&v42];
    id v38 = v42;

    id v13 = v38;
  }
  long long v39 = *(void **)(a1 + 32);
  id v40 = objc_alloc(MEMORY[0x1E4FB4698]);
  id v30 = [v3 identifier];
  long long v41 = (void *)[v40 initWithIdentifier:v30 objectType:2];
  [v39 addPendingUpdatedDescriptor:v41];

LABEL_16:
  if (v13)
  {
    id v31 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v49 = "-[WFDatabase(Shortcuts) duplicateReference:newName:error:]_block_invoke_2";
      __int16 v50 = 2114;
      id v51 = v13;
      _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_ERROR, "%s Failed to move duplicate into all folders or collections containing the original shortcut: %{public}@", buf, 0x16u);
    }
  }
}

- (id)_createWorkflowWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __58__WFDatabase_Shortcuts___createWorkflowWithOptions_error___block_invoke;
  v10[3] = &unk_1E65541B8;
  id v11 = v6;
  uint64_t v12 = self;
  id v7 = v6;
  id v8 = [(WFDatabase *)self performSaveOperationWithReason:@"create workflow with options" block:v10 error:a4];

  return v8;
}

id __58__WFDatabase_Shortcuts___createWorkflowWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v73[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  if (!v4) {
    goto LABEL_3;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [*(id *)(a1 + 32) collectionIdentifier];

  if (v6
    || (id v37 = *(void **)(a1 + 40),
        uint64_t v38 = objc_opt_class(),
        [*(id *)(a1 + 32) identifier],
        long long v39 = objc_claimAutoreleasedReturnValue(),
        [v37 objectOfClass:v38 withIdentifier:v39 forKey:@"workflowID" createIfNecessary:0 properties:0], id v9 = (id)objc_claimAutoreleasedReturnValue(), v39, !v9))
  {
LABEL_3:
    id v7 = [*(id *)(a1 + 32) identifier];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
      id v9 = [v10 UUIDString];
    }
    id v11 = [*(id *)(a1 + 40) objectOfClass:objc_opt_class() withIdentifier:v9 forKey:@"workflowID" createIfNecessary:1 properties:0];
    uint64_t v12 = [*(id *)(a1 + 32) record];
    int v13 = [v12 writeToStorage:v11 error:a2];

    id v14 = 0;
    if (!v13) {
      goto LABEL_41;
    }
    objc_msgSend(v11, "setTombstoned:", objc_msgSend(*(id *)(a1 + 32), "deleted"));
    uint64_t v15 = [*(id *)(a1 + 32) collectionIdentifier];
    id v16 = (void *)v15;
    if (v15) {
      uint64_t v17 = (__CFString *)v15;
    }
    else {
      uint64_t v17 = @"Root";
    }
    id v18 = v17;

    id v19 = WFWorkflowTypeForCollectionIdentifier(v18);
    int v20 = [(__CFString *)v18 isEqualToString:@"Root"];
    int v21 = [MEMORY[0x1E4F1CB18] databaseCoherenceEnabled];
    id v22 = *(void **)(a1 + 40);
    uint64_t v23 = objc_opt_class();
    if (!v21)
    {
      id v42 = [v22 objectOfClass:v23 withIdentifier:v18 forKey:@"identifier" createIfNecessary:1 properties:MEMORY[0x1E4F1CBF0]];
      if (v19)
      {
        uint64_t v72 = v19;
        id v43 = [*(id *)(a1 + 40) objectOfClass:objc_opt_class() withIdentifier:@"Root" forKey:@"identifier" createIfNecessary:1 properties:MEMORY[0x1E4F1CBF0]];
        id v44 = [v43 shortcuts];
        id v45 = (void *)[v44 mutableCopy];
        id v46 = v45;
        if (v45) {
          id v47 = v45;
        }
        else {
          id v47 = (id)objc_opt_new();
        }
        id v51 = v47;

        [v51 insertObject:v11 atIndex:0];
        [v43 setShortcuts:v51];
        uint64_t v52 = *(void **)(a1 + 40);
        v73[0] = @"shortcuts";
        long long v53 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v73 count:1];

        [v52 object:v43 didUpdateProperties:v53 error:a2];
        id v19 = v72;
      }
      long long v54 = [v42 shortcuts];
      id v55 = (void *)[v54 mutableCopy];
      uint64_t v56 = v55;
      if (v55) {
        id v57 = v55;
      }
      else {
        id v57 = (id)objc_opt_new();
      }
      __int16 v58 = v57;

      if ([*(id *)(a1 + 32) location] == 0x7FFFFFFFFFFFFFFFLL
        || (unint64_t v59 = [*(id *)(a1 + 32) location], v59 >= objc_msgSend(v58, "count")))
      {
        uint64_t v60 = 0;
      }
      else
      {
        uint64_t v60 = [*(id *)(a1 + 32) location];
      }
      [v58 insertObject:v11 atIndex:v60];
      [v42 setShortcuts:v58];
      uint64_t v61 = *(void **)(a1 + 40);
      v73[0] = @"shortcuts";
      uint64_t v62 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v73 count:1];

      [v61 object:v42 didUpdateProperties:v62 error:a2];
      goto LABEL_40;
    }
    id v24 = (id)[v22 objectOfClass:v23 withIdentifier:v18 forKey:@"identifier" createIfNecessary:1 properties:MEMORY[0x1E4F1CBF0]];
    id v25 = *(void **)(a1 + 40);
    if (v25) {
      id v25 = (void *)v25[15];
    }
    uint64_t v26 = v25;
    uint64_t v27 = [v11 workflowID];
    [v26 prependShortcutWithId:v27];

    uint64_t v28 = *(void **)(a1 + 40);
    if (v19)
    {
      if (v28) {
        id v29 = (void *)v28[15];
      }
      else {
        id v29 = 0;
      }
      id v30 = v29;
      id v31 = [v11 workflowID];
      [v30 insertShortcutWithIdentifier:v31 atIndex:0 toCollection:v18 error:a2];

      id v32 = *(void **)(a1 + 40);
      uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v18 objectType:2];
      [v32 addPendingUpdatedDescriptor:v33];

      __int16 v34 = *(void **)(a1 + 40);
      __int16 v35 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:@"Root" objectType:2];
      uint64_t v36 = v34;
    }
    else
    {
      if (!v20)
      {
        if (v28) {
          id v64 = (void *)v28[15];
        }
        else {
          id v64 = 0;
        }
        id v65 = v64;
        __int16 v35 = [v65 shortcutsInFolderWithIdentifier:v18 error:a2];

        uint64_t v66 = [v35 count];
        id v67 = *(void **)(a1 + 40);
        if (v67) {
          id v67 = (void *)v67[15];
        }
        id v68 = v67;
        id v69 = [v11 workflowID];
        if (v66) {
          [v68 moveShortcutWithIdentifier:v69 toIndex:0 ofFolderWithIdentifier:v18 error:a2];
        }
        else {
          [v68 moveShortcutWithIdentifier:v69 toFolder:v18 error:a2];
        }

        id v70 = *(void **)(a1 + 40);
        id v71 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v18 objectType:2];
        [v70 addPendingUpdatedDescriptor:v71];

        goto LABEL_26;
      }
      __int16 v35 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:@"Root" objectType:2];
      uint64_t v36 = v28;
    }
    [v36 addPendingUpdatedDescriptor:v35];
LABEL_26:

    id v48 = *(void **)(a1 + 40);
    if (v48) {
      id v49 = (void *)v48[15];
    }
    else {
      id v49 = 0;
    }
    id v50 = v49;
    [v48 saveLibraryToDatabase:v50];

LABEL_40:
    id v14 = [v11 descriptor];

LABEL_41:
    goto LABEL_42;
  }
  id v40 = [*(id *)(a1 + 32) record];
  int v41 = [v40 writeToStorage:v9 error:a2];

  if (v41)
  {
    objc_msgSend(v9, "setTombstoned:", objc_msgSend(*(id *)(a1 + 32), "deleted"));
    id v14 = [v9 descriptor];
  }
  else
  {
    id v14 = 0;
  }
LABEL_42:

  return v14;
}

- (id)suggestedWorkflowNameForName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFDatabase+Shortcuts.m", 792, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v6 = [v5 componentsSeparatedByString:@" "];
  id v7 = [v6 lastObject];
  id v8 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  id v9 = [v8 invertedSet];
  uint64_t v10 = [v7 rangeOfCharacterFromSet:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [v6 lastObject];
    uint64_t v12 = [v11 integerValue];

    uint64_t v13 = objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);

    id v6 = (void *)v13;
  }
  else
  {
    uint64_t v12 = 1;
  }
  id v14 = v5;
  int v20 = v14;
  if ([(WFDatabase *)self hasVisibleWorkflowsWithName:v14])
  {
    uint64_t v15 = v14;
    do
    {
      id v16 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu", v12);
      uint64_t v17 = [v6 arrayByAddingObject:v16];
      id v14 = [v17 componentsJoinedByString:@" "];

      ++v12;
      uint64_t v15 = v14;
    }
    while ([(WFDatabase *)self hasVisibleWorkflowsWithName:v14]);
  }

  return v14;
}

- (id)applyConflictResolution:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WFDatabase(Shortcuts) applyConflictResolution:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s applying conflict resolution: %@", buf, 0x16u);
  }

  id v6 = [v4 localWorkflowID];
  id v7 = [(WFDatabase *)self referenceForWorkflowID:v6 includingTombstones:1];

  id v8 = [(WFDatabase *)self recordWithDescriptor:v7 error:0];
  id v9 = [v4 remoteWorkflowID];
  uint64_t v10 = [(WFDatabase *)self referenceForWorkflowID:v9 includingTombstones:1];

  id v11 = [(WFDatabase *)self recordWithDescriptor:v10 error:0];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__45348;
  id v29 = __Block_byref_object_dispose__45349;
  id v30 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __49__WFDatabase_Shortcuts__applyConflictResolution___block_invoke;
  void v19[3] = &unk_1E6554190;
  id v12 = v11;
  id v20 = v12;
  id v13 = v8;
  id v21 = v13;
  id v22 = self;
  id v14 = v7;
  id v23 = v14;
  id v15 = v10;
  id v24 = v15;
  uint64_t v26 = buf;
  id v16 = v4;
  id v25 = v16;
  [(WFDatabase *)self performTransactionWithReason:@"conflict resolution" block:v19 error:0];
  id v17 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v17;
}

void __49__WFDatabase_Shortcuts__applyConflictResolution___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__WFDatabase_Shortcuts__applyConflictResolution___block_invoke_2;
  aBlock[3] = &unk_1E6555730;
  id v39 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v40 = v2;
  uint64_t v41 = v3;
  id v42 = v4;
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 80);
  id v43 = v5;
  uint64_t v44 = v6;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __49__WFDatabase_Shortcuts__applyConflictResolution___block_invoke_317;
  v31[3] = &unk_1E6555730;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void **)(a1 + 56);
  id v32 = v8;
  uint64_t v33 = v9;
  id v34 = v10;
  id v35 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 80);
  id v36 = v11;
  uint64_t v37 = v12;
  id v13 = (void (**)(void))_Block_copy(v31);
  if (![*(id *)(a1 + 72) keepLocal]
    || ![*(id *)(a1 + 72) keepRemote])
  {
    if (![*(id *)(a1 + 72) keepRemote])
    {
      if (![*(id *)(a1 + 72) keepLocal]) {
        goto LABEL_20;
      }
LABEL_19:
      v13[2](v13);
      goto LABEL_20;
    }
LABEL_17:
    v7[2](v7);
    goto LABEL_20;
  }
  id v14 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v46 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_INFO, "%s Conflict resolution: keeping both local and remote change", buf, 0xCu);
  }

  if ([*(id *)(a1 + 40) isDeleted]) {
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) isDeleted]) {
    goto LABEL_19;
  }
  [*(id *)(a1 + 48) setConflictingReference:0 forReference:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setLastSyncedHash:0];
  id v15 = *(void **)(a1 + 48);
  uint64_t v16 = [*(id *)(a1 + 32) name];
  id v17 = [v15 suggestedWorkflowNameForName:v16];
  [*(id *)(a1 + 32) setName:v17];

  id v18 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 64);
  id v30 = 0;
  LOBYTE(v16) = [v18 saveRecord:v19 withDescriptor:v20 error:&v30];
  id v21 = v30;
  if ((v16 & 1) == 0)
  {
    id v22 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v46 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      __int16 v47 = 2114;
      id v48 = v21;
      _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow: %{public}@", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 40) setLastSyncedHash:0];
  uint64_t v24 = *(void *)(a1 + 40);
  id v23 = *(void **)(a1 + 48);
  uint64_t v25 = *(void *)(a1 + 56);
  id v29 = v21;
  char v26 = [v23 saveRecord:v24 withDescriptor:v25 error:&v29];
  id v27 = v29;

  if ((v26 & 1) == 0)
  {
    uint64_t v28 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v46 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      __int16 v47 = 2114;
      id v48 = v27;
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_ERROR, "%s Failed to save localWorkflow: %{public}@", buf, 0x16u);
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 56));

LABEL_20:
}

void __49__WFDatabase_Shortcuts__applyConflictResolution___block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v2 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke_2";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_INFO, "%s Conflict resolution: keeping remote change", buf, 0xCu);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  if (v3 && ([v3 isDeleted] & 1) == 0)
  {
    int v15 = [*(id *)(a1 + 40) isDeleted];
    uint64_t v16 = getWFCloudKitSyncLogObject();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)long long buf = 136315138;
        id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local deleted - remote changed'", buf, 0xCu);
      }

      id v18 = *(void **)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 56);
      id v48 = 0;
      char v20 = [v18 deleteReference:v19 tombstone:0 deleteConflictIfPresent:0 error:&v48];
      id v21 = v48;
      if ((v20 & 1) == 0)
      {
        id v22 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
          __int16 v51 = 2114;
          id v52 = v21;
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to delete localWorkflowReference: %{public}@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 32) setLastSyncedHash:0];
      id v23 = *(void **)(a1 + 48);
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 64);
      id v47 = v21;
      char v26 = [v23 saveRecord:v24 withDescriptor:v25 error:&v47];
      id v13 = v47;

      if ((v26 & 1) == 0)
      {
        id v27 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
          __int16 v51 = 2114;
          id v52 = v13;
          _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v28 = *(void **)(a1 + 48);
      id v29 = *(void **)(a1 + 64);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)long long buf = 136315138;
        id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local changed - remote changed'", buf, 0xCu);
      }

      uint64_t v30 = *(void *)(a1 + 32);
      uint64_t v31 = *(void **)(a1 + 48);
      uint64_t v32 = *(void *)(a1 + 56);
      id v46 = 0;
      char v33 = [v31 saveRecord:v30 withDescriptor:v32 error:&v46];
      id v34 = v46;
      if ((v33 & 1) == 0)
      {
        id v35 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
          __int16 v51 = 2114;
          id v52 = v34;
          _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow into localWorkflowReference: %{public}@", buf, 0x16u);
        }
      }
      id v36 = *(void **)(a1 + 48);
      uint64_t v37 = *(void *)(a1 + 64);
      id v45 = v34;
      char v38 = [v36 deleteReference:v37 tombstone:0 deleteConflictIfPresent:0 error:&v45];
      id v13 = v45;

      if ((v38 & 1) == 0)
      {
        id v39 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
          __int16 v51 = 2114;
          id v52 = v13;
          _os_log_impl(&dword_1C7F0A000, v39, OS_LOG_TYPE_ERROR, "%s Failed to delete remoteWorkflowReference: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v28 = *(void **)(a1 + 48);
      id v29 = *(void **)(a1 + 56);
    }
    id v14 = [v29 identifier];
    uint64_t v40 = [v28 referenceForWorkflowID:v14 includingTombstones:1];
    uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
    id v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;

    goto LABEL_38;
  }
  id v4 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local changed - remote deleted'", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v44 = 0;
  char v7 = [v5 deleteReference:v6 tombstone:0 deleteConflictIfPresent:0 error:&v44];
  id v8 = v44;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      __int16 v51 = 2114;
      id v52 = v8;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to delete localWorkflowReference: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v43 = v8;
  char v12 = [v10 deleteReference:v11 tombstone:0 deleteConflictIfPresent:0 error:&v43];
  id v13 = v43;

  if ((v12 & 1) == 0)
  {
    id v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v50 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      __int16 v51 = 2114;
      id v52 = v13;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to delete remoteWorkflowReference: %{public}@", buf, 0x16u);
    }
LABEL_38:
  }
}

void __49__WFDatabase_Shortcuts__applyConflictResolution___block_invoke_317(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = getWFCloudKitSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_INFO, "%s Conflict resolution: keeping local change", buf, 0xCu);
  }

  int v3 = [*(id *)(a1 + 32) isDeleted];
  id v4 = getWFCloudKitSyncLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local changed - remote changed or deleted'", buf, 0xCu);
    }

    id v22 = *(void **)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 56);
    id v35 = 0;
    char v24 = [v22 deleteReference:v23 tombstone:0 deleteConflictIfPresent:0 error:&v35];
    id v25 = v35;
    if ((v24 & 1) == 0)
    {
      char v26 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
        __int16 v41 = 2114;
        id v42 = v25;
        _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s Failed to delete remoteWorkflowReference: %{public}@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 32) setLastSyncedHash:0];
    uint64_t v28 = *(void *)(a1 + 32);
    id v27 = *(void **)(a1 + 40);
    uint64_t v29 = *(void *)(a1 + 48);
    id v34 = v25;
    char v30 = [v27 saveRecord:v28 withDescriptor:v29 error:&v34];
    id v20 = v34;

    if ((v30 & 1) == 0)
    {
      uint64_t v31 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
        __int16 v41 = 2114;
        id v42 = v20;
        _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_ERROR, "%s Failed to save localWorkflow: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8);
    id v33 = *(id *)(a1 + 48);
    id v21 = *(NSObject **)(v32 + 40);
    *(void *)(v32 + 40) = v33;
    goto LABEL_28;
  }
  if (v5)
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local deleted - remote changed'", buf, 0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v38 = 0;
  char v8 = [v6 deleteReference:v7 tombstone:0 deleteConflictIfPresent:0 error:&v38];
  id v9 = v38;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to delete localWorkflowReference: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 56);
  id v37 = v9;
  char v13 = [v11 deleteReference:v12 tombstone:1 deleteConflictIfPresent:0 error:&v37];
  id v14 = v37;

  if ((v13 & 1) == 0)
  {
    int v15 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      __int16 v41 = 2114;
      id v42 = v14;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to tombstone remoteWorkflowReference: %{public}@", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 64) setLastSyncedHash:0];
  uint64_t v16 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 64);
  id v36 = v14;
  char v19 = [v16 saveRecord:v17 withDescriptor:v18 error:&v36];
  id v20 = v36;

  if ((v19 & 1) == 0)
  {
    id v21 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v40 = "-[WFDatabase(Shortcuts) applyConflictResolution:]_block_invoke";
      __int16 v41 = 2114;
      id v42 = v20;
      _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow: %{public}@", buf, 0x16u);
    }
LABEL_28:
  }
}

- (void)setConflictingReference:(id)a3 forReference:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__WFDatabase_Shortcuts__setConflictingReference_forReference___block_invoke;
  void v14[3] = &unk_1E6558490;
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = self;
  id v9 = v7;
  id v17 = v9;
  id v13 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"create conflict for shortcut" block:v14 error:&v13];
  id v10 = v13;
  if (v10)
  {
    uint64_t v11 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v10 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      char v19 = "-[WFDatabase(Shortcuts) setConflictingReference:forReference:]";
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Unable to mark reference as conflict: %{public}@", buf, 0x16u);
    }
  }
}

void __62__WFDatabase_Shortcuts__setConflictingReference_forReference___block_invoke(uint64_t a1, uint64_t a2)
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 40) objectForDescriptor:v4 properties:MEMORY[0x1E4F1CBF0]];
    uint64_t v6 = objc_opt_class();
    id v7 = WFEnforceClass(v5, v6);
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [*(id *)(a1 + 40) objectForDescriptor:*(void *)(a1 + 48) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v9 = objc_opt_class();
  id v10 = WFEnforceClass(v8, v9);

  [v10 setConflictOf:v7];
  uint64_t v11 = *(void **)(a1 + 40);
  v13[0] = @"conflictOf";
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v13 count:1];

  [v11 object:v10 didUpdateProperties:v12 error:a2];
}

- (BOOL)hasConflictingReferenceForReference:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __61__WFDatabase_Shortcuts__hasConflictingReferenceForReference___block_invoke;
  uint64_t v12 = &unk_1E65589C8;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  uint64_t v6 = [(WFDatabase *)self performOperationWithReason:@"getting conflict status for shortcut" block:&v9 error:0];
  char v7 = objc_msgSend(v6, "BOOLValue", v9, v10, v11, v12, v13);

  return v7;
}

id __61__WFDatabase_Shortcuts__hasConflictingReferenceForReference___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);

  id v5 = NSNumber;
  uint64_t v6 = [v4 conflictOf];
  char v7 = v6;
  if (!v6)
  {
    v1 = [v4 conflicts];
    char v7 = [v1 anyObject];
  }
  id v8 = [v5 numberWithBool:v7 != 0];
  if (!v6)
  {
  }
  return v8;
}

- (id)localConflictingReferenceForReference:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __63__WFDatabase_Shortcuts__localConflictingReferenceForReference___block_invoke;
  v8[3] = &unk_1E6554168;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(WFDatabase *)self performOperationWithReason:@"getting local conflict for shortcut" block:v8 error:0];

  return v6;
}

id __63__WFDatabase_Shortcuts__localConflictingReferenceForReference___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = WFEnforceClass(v1, v2);

  id v4 = [v3 conflictOf];
  id v5 = [v4 descriptor];

  return v5;
}

- (id)remoteConflictingReferenceForReference:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __64__WFDatabase_Shortcuts__remoteConflictingReferenceForReference___block_invoke;
  v8[3] = &unk_1E6554168;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(WFDatabase *)self performOperationWithReason:@"getting remote conflict for shortcut" block:v8 error:0];

  return v6;
}

id __64__WFDatabase_Shortcuts__remoteConflictingReferenceForReference___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = WFEnforceClass(v1, v2);

  id v4 = [v3 conflicts];
  id v5 = [v4 anyObject];
  uint64_t v6 = [v5 descriptor];

  return v6;
}

- (id)conflictingReferenceForReference:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __58__WFDatabase_Shortcuts__conflictingReferenceForReference___block_invoke;
  v8[3] = &unk_1E6554168;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(WFDatabase *)self performOperationWithReason:@"getting conflicts for shortcut" block:v8 error:0];

  return v6;
}

id __58__WFDatabase_Shortcuts__conflictingReferenceForReference___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = WFEnforceClass(v1, v2);

  id v4 = [v3 conflictOf];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 descriptor];
  }
  else
  {
    char v7 = [v3 conflicts];
    id v8 = [v7 anyObject];
    uint64_t v6 = [v8 descriptor];
  }
  return v6;
}

- (BOOL)deleteReference:(id)a3 tombstone:(BOOL)a4 deleteConflictIfPresent:(BOOL)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [v10 identifier];

  if (v11)
  {
    if (![v10 objectType])
    {
      uint64_t v12 = [v10 identifier];
      [(WFDatabase *)self deleteDonationsForShortcutWithIdentifier:v12];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __81__WFDatabase_Shortcuts__deleteReference_tombstone_deleteConflictIfPresent_error___block_invoke;
    void v19[3] = &unk_1E6554140;
    void v19[4] = self;
    id v20 = v10;
    BOOL v21 = a5;
    BOOL v22 = a4;
    id v18 = 0;
    [(WFDatabase *)self performTransactionWithReason:@"delete reference" block:v19 error:&v18];
    id v13 = v18;
    BOOL v14 = v13 == 0;
    if (v13)
    {
      id v15 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [v13 localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        char v24 = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]";
        __int16 v25 = 2114;
        char v26 = v16;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to delete reference: %{public}@", buf, 0x16u);
      }
      *a6 = v13;
    }
  }
  else
  {
    id v13 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      char v24 = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]";
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Unable to delete reference because identifier is invalid", buf, 0xCu);
    }
    BOOL v14 = 0;
  }

  return v14;
}

void __81__WFDatabase_Shortcuts__deleteReference_tombstone_deleteConflictIfPresent_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0];
  if (([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled] & 1) == 0 && !v4)
  {
    *a2 = [*(id *)(a1 + 32) missingErrorForDescriptor:*(void *)(a1 + 40)];
    goto LABEL_63;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [v4 managedObject];
  }
  uint64_t v6 = v5;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    if (![*(id *)(a1 + 40) objectType])
    {
      id v18 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        char v19 = [*(id *)(a1 + 40) identifier];
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke";
        __int16 v70 = 2114;
        id v71 = v19;
        _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_DEBUG, "%s Delete shortcut with id %{public}@", buf, 0x16u);
      }
      id v20 = *(void **)(a1 + 32);
      if (v20) {
        id v20 = (void *)v20[15];
      }
      BOOL v21 = v20;
      BOOL v22 = [*(id *)(a1 + 40) identifier];
      uint64_t v23 = [v21 collectionsAndFoldersContainingShortcut:v22 error:0];

      char v24 = *(void **)(a1 + 32);
      if (v24) {
        char v24 = (void *)v24[15];
      }
      __int16 v25 = v24;
      char v26 = [*(id *)(a1 + 40) identifier];
      [v25 removeShortcutWithIdentifier:v26 error:a2];

      uint64_t v27 = *(void **)(a1 + 32);
      if (v27) {
        uint64_t v28 = (void *)v27[15];
      }
      else {
        uint64_t v28 = 0;
      }
      id v29 = v28;
      [v27 saveLibraryToDatabase:v29];

      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __81__WFDatabase_Shortcuts__deleteReference_tombstone_deleteConflictIfPresent_error___block_invoke_287;
      v68[3] = &unk_1E6554F38;
      v68[4] = *(void *)(a1 + 32);
      [v23 enumerateObjectsUsingBlock:v68];
      [*(id *)(a1 + 32) addPendingDeletedDescriptor:*(void *)(a1 + 40)];
      id v30 = v6;
      uint64_t v31 = v30;
      if (*(unsigned char *)(a1 + 48))
      {
        uint64_t v32 = [v30 conflictOf];
        if (v32
          || ([v31 conflicts],
              id v33 = objc_claimAutoreleasedReturnValue(),
              [v33 anyObject],
              uint64_t v32 = objc_claimAutoreleasedReturnValue(),
              v33,
              v32))
        {
          id v34 = [*(id *)(a1 + 32) context];
          [v34 deleteObject:v32];
        }
      }
      id v35 = [*(id *)(a1 + 32) context];
      [v35 deleteObject:v31];

      goto LABEL_47;
    }
    if ([*(id *)(a1 + 40) objectType] == 2)
    {
      if (*(unsigned char *)(a1 + 49))
      {
        char v7 = getWFCoherenceLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          id v8 = [*(id *)(a1 + 40) identifier];
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke_2";
          __int16 v70 = 2114;
          id v71 = v8;
          _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s Tombstone folder with id %{public}@", buf, 0x16u);
        }
        id v9 = *(void **)(a1 + 32);
        if (v9) {
          id v9 = (void *)v9[15];
        }
        id v10 = v9;
        uint64_t v11 = [*(id *)(a1 + 40) identifier];
        [v10 tombstoneFolderWithIdentifier:v11 error:a2];

        uint64_t v12 = *(void **)(a1 + 32);
        if (v12) {
          id v13 = (void *)v12[15];
        }
        else {
          id v13 = 0;
        }
        id v14 = v13;
        [v12 saveLibraryToDatabase:v14];

        [*(id *)(a1 + 32) addPendingUpdatedDescriptor:*(void *)(a1 + 40)];
        [v6 setTombstoned:1];
        goto LABEL_48;
      }
      id v42 = *(void **)(a1 + 32);
      if (v42) {
        id v42 = (void *)v42[15];
      }
      uint64_t v43 = v42;
      id v44 = [*(id *)(a1 + 40) identifier];
      [v43 deleteFolderWithIdentifier:v44 error:a2];

      id v45 = *(void **)(a1 + 32);
      if (v45) {
        id v46 = (void *)v45[15];
      }
      else {
        id v46 = 0;
      }
      id v47 = v46;
      [v45 saveLibraryToDatabase:v47];

      [*(id *)(a1 + 32) addPendingDeletedDescriptor:*(void *)(a1 + 40)];
      id v48 = [*(id *)(a1 + 40) identifier];

      if (v48 != @"Root")
      {
        uint64_t v49 = *(void **)(a1 + 32);
        id v50 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:@"Root" objectType:2];
        [v49 addPendingUpdatedDescriptor:v50];
      }
    }
LABEL_46:
    uint64_t v23 = [*(id *)(a1 + 32) context];
    [v23 deleteObject:v6];
LABEL_47:

    goto LABEL_48;
  }
  if (!*(unsigned char *)(a1 + 49)) {
    goto LABEL_46;
  }
  if (![*(id *)(a1 + 40) objectType])
  {
    id v36 = v6;
    uint64_t v23 = v36;
    if (*(unsigned char *)(a1 + 48))
    {
      id v37 = [v36 conflictOf];
      if (v37
        || ([v23 conflicts],
            id v38 = objc_claimAutoreleasedReturnValue(),
            [v38 anyObject],
            id v37 = objc_claimAutoreleasedReturnValue(),
            v38,
            v37))
      {
        id v39 = [*(id *)(a1 + 32) context];
        [v39 deleteObject:v37];
      }
    }
    [v23 setTombstoned:1];
    [v23 setParents:0];
    uint64_t v40 = *(void **)(a1 + 32);
    *(void *)long long buf = @"tombstoned";
    __int16 v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

    [v40 object:v23 didUpdateProperties:v41 error:a2];
    goto LABEL_47;
  }
  if ([*(id *)(a1 + 40) objectType] != 2) {
    goto LABEL_46;
  }
  id v15 = v6;
  [v15 setTombstoned:1];
  [v15 setParents:0];
  uint64_t v16 = *(void **)(a1 + 32);
  *(void *)long long buf = @"tombstoned";
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

  [v16 object:v15 didUpdateProperties:v17 error:a2];
LABEL_48:
  if (![*(id *)(a1 + 40) objectType])
  {
    __int16 v51 = *(void **)(a1 + 32);
    id v52 = [*(id *)(a1 + 40) identifier];
    [v51 deleteAllBookmarksForWorkflowID:v52 error:a2];

    uint64_t v53 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    long long v54 = [*(id *)(a1 + 40) identifier];
    id v55 = [NSString stringWithFormat:@"WFCollapsedActions-%@", v54];
    [v53 removeObjectForKey:v55];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([*(id *)(a1 + 32) mergeAutomationsAndShortcuts] & 1) == 0)
  {
    uint64_t v56 = [v6 shortcut];
    if ([v56 hiddenFromLibraryAndSync])
    {
      id v57 = [*(id *)(a1 + 32) context];
      [v57 deleteObject:v4];

      if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
      {
        __int16 v58 = getWFCoherenceLogObject();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v59 = [v56 workflowID];
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[WFDatabase(Shortcuts) deleteReference:tombstone:deleteConflictIfPresent:error:]_block_invoke";
          __int16 v70 = 2114;
          id v71 = v59;
          _os_log_impl(&dword_1C7F0A000, v58, OS_LOG_TYPE_DEBUG, "%s Remove shortcut with id %{public}@", buf, 0x16u);
        }
        uint64_t v60 = *(void **)(a1 + 32);
        if (v60) {
          uint64_t v60 = (void *)v60[15];
        }
        uint64_t v61 = v60;
        uint64_t v62 = [v56 workflowID];
        [v61 removeShortcutWithIdentifier:v62 error:a2];

        char v63 = *(void **)(a1 + 32);
        if (v63) {
          id v64 = (void *)v63[15];
        }
        else {
          id v64 = 0;
        }
        id v65 = v64;
        [v63 saveLibraryToDatabase:v65];

        uint64_t v66 = *(void **)(a1 + 32);
        id v67 = [v56 descriptor];
        [v66 addPendingDeletedDescriptor:v67];
      }
    }
  }
LABEL_63:
}

void __81__WFDatabase_Shortcuts__deleteReference_tombstone_deleteConflictIfPresent_error___block_invoke_287(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FB4698];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v7 = [v4 identifier];

  uint64_t v6 = (void *)[v5 initWithIdentifier:v7 objectType:2];
  [v2 addPendingUpdatedDescriptor:v6];
}

- (BOOL)deleteReference:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LOBYTE(a4) = [(WFDatabase *)self deleteReference:v6 tombstone:+[WFCloudKitSyncSession isSyncEnabled] deleteConflictIfPresent:1 error:a4];

  return (char)a4;
}

- (id)renameReference:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    __int16 v25 = a5;
    char v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFDatabase+Shortcuts.m", 452, @"Invalid parameter not satisfying: %@", @"reference" object file lineNumber description];

    a5 = v25;
  }
  uint64_t v27 = a5;
  uint64_t v28 = self;
  id v29 = [(WFDatabase *)self validateWorkflowName:v10 forCreation:0 overwriting:0 error:a5];

  uint64_t v11 = v29;
  if (v29)
  {
    uint64_t v12 = -[WFDatabase visibleReferencesForWorkflowName:](self, "visibleReferencesForWorkflowName:");
    id v13 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          char v19 = [v18 identifier];
          id v20 = [v9 identifier];
          int v21 = [v19 isEqualToString:v20];

          if (v21)
          {
            id v22 = v9;

            goto LABEL_16;
          }
          [v13 addObject:v18];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if ([v13 count])
    {
      if (v27)
      {
        [(WFDatabase *)v28 duplicateNameErrorWithName:v29];
        id v22 = 0;
        id *v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v22 = 0;
      }
    }
    else
    {
      uint64_t v33 = 0;
      id v34 = &v33;
      uint64_t v35 = 0x3032000000;
      id v36 = __Block_byref_object_copy__45348;
      id v37 = __Block_byref_object_dispose__45349;
      id v38 = 0;
      char v24 = objc_opt_new();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __50__WFDatabase_Shortcuts__renameReference_to_error___block_invoke;
      v30[3] = &unk_1E6554118;
      id v31 = v29;
      uint64_t v32 = &v33;
      [(WFDatabase *)v28 accessStorageForDescriptor:v9 forWriting:1 readingRecordProperties:v24 usingBlock:v30 withError:v27];

      id v22 = (id)v34[5];
      _Block_object_dispose(&v33, 8);
    }
LABEL_16:

    uint64_t v11 = v29;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void __50__WFDatabase_Shortcuts__renameReference_to_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v12 = v5;
    id v6 = [WFWorkflowRecord alloc];
    id v7 = objc_opt_new();
    id v8 = [(WFRecord *)v6 initWithStorage:v12 properties:v7];

    if (v8)
    {
      [(WFWorkflowRecord *)v8 setName:*(void *)(a1 + 32)];
      if ([(WFWorkflowRecord *)v8 saveChangesToStorage:v12 error:a3])
      {
        uint64_t v9 = [v12 descriptor];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
    }

    id v5 = v12;
  }
}

- (id)duplicateReference:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFDatabase+Shortcuts.m", 445, @"Invalid parameter not satisfying: %@", @"reference" object file lineNumber description];
  }
  id v8 = [v7 name];
  uint64_t v9 = [(WFDatabase *)self suggestedWorkflowNameForName:v8];

  uint64_t v10 = [(WFDatabase *)self duplicateReference:v7 newName:v9 error:a4];

  return v10;
}

- (BOOL)createWorkflowWithIdentifier:(id)a3 record:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v8 objectType:0];
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__WFDatabase_Shortcuts__createWorkflowWithIdentifier_record_error___block_invoke;
  void v14[3] = &unk_1E65540F0;
  void v14[4] = self;
  id v11 = v10;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v17 = &v18;
  [(WFDatabase *)self performTransactionWithReason:@"create workflow with identifier" block:v14 error:a5];
  LOBYTE(a5) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)a5;
}

void __67__WFDatabase_Shortcuts__createWorkflowWithIdentifier_record_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0 createIfNecessary:1];
  if (v4)
  {
    id v6 = v4;
    int v5 = [*(id *)(a1 + 48) writeToStorage:v4 error:a2];
    id v4 = v6;
    if (v5) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

- (id)createWorkflowWithOptions:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__45348;
  char v21 = __Block_byref_object_dispose__45349;
  id v22 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __79__WFDatabase_Shortcuts__createWorkflowWithOptions_nameCollisionBehavior_error___block_invoke;
  v12[3] = &unk_1E65540C8;
  id v9 = v8;
  id v13 = v9;
  id v14 = self;
  id v15 = &v17;
  unint64_t v16 = a4;
  [(WFDatabase *)self performTransactionWithReason:@"create shortcut" block:v12 error:a5];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __79__WFDatabase_Shortcuts__createWorkflowWithOptions_nameCollisionBehavior_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) record];
  int v5 = [v4 name];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[WFWorkflow defaultName];
  }
  id v8 = v7;

  id v9 = [*(id *)(a1 + 40) validateWorkflowName:v8 forCreation:1 overwriting:*(void *)(a1 + 56) == 1 error:a2];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        id v12 = [*(id *)(a1 + 40) visibleReferencesForWorkflowName:v9];
        if ((unint64_t)[v12 count] < 2)
        {
          id v13 = [v12 firstObject];
          if (v13)
          {
            uint64_t v18 = [*(id *)(a1 + 32) identifier];
            if (!v18) {
              goto LABEL_24;
            }
            uint64_t v19 = (void *)v18;
            uint64_t v20 = [*(id *)(a1 + 32) identifier];
            char v21 = [v13 identifier];
            char v22 = [v20 isEqualToString:v21];

            if ((v22 & 1) == 0)
            {
              uint64_t v28 = *(void **)(a1 + 40);
              id v29 = [*(id *)(a1 + 32) identifier];
              uint64_t v23 = [v28 referenceForWorkflowID:v29];

              if (v23
                && ([*(id *)(a1 + 40) deleteReference:v13 tombstone:0 deleteConflictIfPresent:1 error:a2] & 1) == 0)
              {

                goto LABEL_28;
              }
            }
            else
            {
LABEL_24:
              uint64_t v23 = [v13 identifier];
              [*(id *)(a1 + 32) setIdentifier:v23];
            }
          }
        }
        else
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v31 != v16) {
                  objc_enumerationMutation(v13);
                }
                objc_msgSend(*(id *)(a1 + 40), "deleteReference:tombstone:deleteConflictIfPresent:error:", *(void *)(*((void *)&v30 + 1) + 8 * i), 0, 1, a2, (void)v30);
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
            }
            while (v15);
          }
        }
      }
      else if (!v10)
      {
        uint64_t v11 = [*(id *)(a1 + 40) suggestedWorkflowNameForName:v9];

        id v9 = (void *)v11;
      }
      goto LABEL_27;
    }
    if (![*(id *)(a1 + 40) hasVisibleWorkflowsWithName:v9])
    {
LABEL_27:
      char v24 = objc_msgSend(*(id *)(a1 + 32), "record", (void)v30);
      [v24 setName:v9];

      uint64_t v25 = [*(id *)(a1 + 40) _createWorkflowWithOptions:*(void *)(a1 + 32) error:a2];
      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      goto LABEL_28;
    }
    if (a2)
    {
      *a2 = [*(id *)(a1 + 40) duplicateNameErrorWithName:v9];
    }
  }
LABEL_28:
}

- (id)createWorkflowWithOptions:(id)a3 error:(id *)a4
{
  return [(WFDatabase *)self createWorkflowWithOptions:a3 nameCollisionBehavior:0 error:a4];
}

- (id)createWorkflowWithError:(id *)a3
{
  int v5 = objc_opt_new();
  id v6 = [(WFDatabase *)self createWorkflowWithOptions:v5 nameCollisionBehavior:0 error:a3];

  return v6;
}

- (BOOL)hasConflictWithName:(id)a3
{
  id v4 = a3;
  int v5 = +[WFHomeManager cachedHomeSceneNames];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __45__WFDatabase_Shortcuts__hasConflictWithName___block_invoke;
  v10[3] = &unk_1E65540A0;
  id v6 = v4;
  id v11 = v6;
  id v7 = objc_msgSend(v5, "if_firstObjectPassingTest:", v10);

  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [(WFDatabase *)self hasVisibleWorkflowsWithName:v6];
  }

  return v8;
}

BOOL __45__WFDatabase_Shortcuts__hasConflictWithName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedStandardCompare:*(void *)(a1 + 32)] == 0;
}

- (BOOL)hasVisibleWorkflowsWithName:(id)a3
{
  uint64_t v3 = [(WFDatabase *)self visibleReferencesForWorkflowName:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)uniqueVisibleReferenceForWorkflowName:(id)a3
{
  uint64_t v3 = [(WFDatabase *)self visibleReferencesForWorkflowName:a3];
  if ([v3 count] == 1)
  {
    BOOL v4 = [v3 firstObject];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)visibleReferencesForWorkflowIDs:(id)a3 sortBy:(unint64_t)a4 nameContaining:(id)a5 nameEqualing:(id)a6 associatedAppBundleIdentifier:(id)a7 hasTombstonedConflicts:(BOOL)a8 isRecentlyModified:(BOOL)a9 isRecentlyRun:(BOOL)a10 limitTo:(unint64_t)a11
{
  BOOL v27 = a8;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = NSNumber;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  char v21 = [v16 numberWithUnsignedInteger:a4];
  char v22 = [v15 setWithObject:v21];
  LOWORD(v25) = __PAIR16__(a10, a9);
  uint64_t v23 = -[WFDatabase visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", v20, v22, v19, v18, v17, v27, v25, a11);

  return v23;
}

- (id)visibleReferencesForWorkflowIDs:(id)a3 sortByKeys:(id)a4 nameContaining:(id)a5 nameEqualing:(id)a6 associatedAppBundleIdentifier:(id)a7 hasTombstonedConflicts:(BOOL)a8 isRecentlyModified:(BOOL)a9 isRecentlyRun:(BOOL)a10 limitTo:(unint64_t)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __190__WFDatabase_Shortcuts__visibleReferencesForWorkflowIDs_sortByKeys_nameContaining_nameEqualing_associatedAppBundleIdentifier_hasTombstonedConflicts_isRecentlyModified_isRecentlyRun_limitTo___block_invoke;
  v29[3] = &unk_1E6554078;
  id v30 = v17;
  long long v31 = self;
  id v32 = v19;
  id v33 = v20;
  BOOL v37 = a8;
  BOOL v38 = a9;
  BOOL v39 = a10;
  id v34 = v21;
  id v35 = v18;
  unint64_t v36 = a11;
  id v22 = v18;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v17;
  BOOL v27 = [(WFDatabase *)self performOperationWithReason:@"getting visible references for workflow ids" block:v29 error:0];

  return v27;
}

id __190__WFDatabase_Shortcuts__visibleReferencesForWorkflowIDs_sortByKeys_nameContaining_nameEqualing_associatedAppBundleIdentifier_hasTombstonedConflicts_isRecentlyModified_isRecentlyRun_limitTo___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[WFCoreDataWorkflow descriptorFetchRequest];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    int v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"workflowID", v4];
    [v3 addObject:v5];
  }
  id v6 = [*(id *)(a1 + 40) visiblePredicate];
  [v3 addObject:v6];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K CONTAINS[cd] %@", @"name", v7];
    [v3 addObject:v8];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == [c] %@", @"name", v9];
    [v3 addObject:v10];
  }
  uint64_t v11 = *(void *)(a1 + 64);
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"associatedAppBundleIdentifier", v11];
    [v3 addObject:v12];
  }
  if (*(unsigned char *)(a1 + 88))
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = YES", @"conflictOf.tombstoned");
    [v3 addObject:v13];
  }
  if (*(unsigned char *)(a1 + 89))
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v16 = [v14 dateByAddingUnit:16 value:-30 toDate:v15 options:0];

    id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"modificationDate", v16];
    [v3 addObject:v17];
  }
  if (*(unsigned char *)(a1 + 90))
  {
    id v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    id v20 = [v18 dateByAddingUnit:16 value:-30 toDate:v19 options:0];

    id v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY runEvents.date >= %@", v20];
    [v3 addObject:v21];
  }
  id v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v3];
  [v2 setPredicate:v22];

  id v23 = objc_opt_new();
  if ([*(id *)(a1 + 72) containsObject:&unk_1F2316CB0])
  {
    id v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
    [v23 addObject:v24];
  }
  if ([*(id *)(a1 + 72) containsObject:&unk_1F2316CC8])
  {
    id v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"workflowID" ascending:1];
    [v23 addObject:v25];
  }
  if ([*(id *)(a1 + 72) containsObject:&unk_1F2316C80])
  {
    id v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastRunEventDate" ascending:0];
    [v23 addObject:v26];
  }
  if ([*(id *)(a1 + 72) containsObject:&unk_1F2316C98])
  {
    BOOL v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:0];
    [v23 addObject:v27];
  }
  [v2 setSortDescriptors:v23];
  if (*(void *)(a1 + 80)) {
    objc_msgSend(v2, "setFetchLimit:");
  }
  uint64_t v28 = [*(id *)(a1 + 40) workflowResultWithFetchRequest:v2];

  return v28;
}

- (id)referenceForWorkflowID:(id)a3 includingTombstones:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFDatabase+Shortcuts.m", 235, @"Invalid parameter not satisfying: %@", @"workflowID" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __68__WFDatabase_Shortcuts__referenceForWorkflowID_includingTombstones___block_invoke;
  v12[3] = &unk_1E6554050;
  id v13 = v7;
  uint64_t v14 = self;
  BOOL v15 = a4;
  id v8 = v7;
  uint64_t v9 = [(WFDatabase *)self performOperationWithReason:@"getting shortcut with id" block:v12 error:0];

  return v9;
}

id __68__WFDatabase_Shortcuts__referenceForWorkflowID_includingTombstones___block_invoke(uint64_t a1, uint64_t a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[WFCoreDataWorkflow descriptorFetchRequest];
  int v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"workflowID", *(void *)(a1 + 32)];
  v17[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v8 = [v5 andPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  [v4 setFetchLimit:1];
  uint64_t v9 = [*(id *)(a1 + 40) context];
  uint64_t v10 = [v9 executeFetchRequest:v4 error:a2];

  uint64_t v11 = [v10 firstObject];
  id v12 = [v11 descriptor];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = v12;
    if (!*(unsigned char *)(a1 + 48))
    {
      if ([v12 isDeleted]) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v13;
      }
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)referenceForWorkflowID:(id)a3
{
  return [(WFDatabase *)self referenceForWorkflowID:a3 includingTombstones:0];
}

- (id)shortcutsWithOutOfSyncWalrusStatus
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WFCoreDataWorkflow descriptorFetchRequest];
  uint64_t v4 = (void *)MEMORY[0x1E4F28BA0];
  int v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K != %K) OR (%K == NIL AND %K > 0)", @"wantedEncryptedSchemaVersion", @"lastSyncedEncryptedSchemaVersion", @"lastSyncedEncryptedSchemaVersion", @"wantedEncryptedSchemaVersion");
  v13[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v7 = [v4 andPredicateWithSubpredicates:v6];
  [v3 setPredicate:v7];

  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:0];
  id v12 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v3 setSortDescriptors:v9];

  uint64_t v10 = [(WFDatabase *)self workflowResultWithFetchRequest:v3];

  return v10;
}

- (id)recentlyRunShortcutsWithLimit:(int64_t)a3
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  int v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 dateByAddingUnit:16 value:-30 toDate:v6 options:0];

  id v8 = +[WFCoreDataWorkflow descriptorFetchRequest];
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY runEvents.date >= %@", v7];
  v19[0] = v10;
  uint64_t v11 = [(WFDatabase *)self visiblePredicate];
  v19[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v13 = [v9 andPredicateWithSubpredicates:v12];
  [v8 setPredicate:v13];

  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastRunEventDate" ascending:0];
  id v18 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v8 setSortDescriptors:v15];

  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL) {
    [v8 setFetchLimit:a3];
  }
  uint64_t v16 = [(WFDatabase *)self workflowResultWithFetchRequest:v8];

  return v16;
}

- (id)recentlyRunShortcuts
{
  return [(WFDatabase *)self recentlyRunShortcutsWithLimit:0];
}

- (id)recentlyModifiedShortcuts
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  int v5 = [v3 dateByAddingUnit:16 value:-30 toDate:v4 options:0];

  id v6 = +[WFCoreDataWorkflow descriptorFetchRequest];
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"modificationDate", v5];
  v17[0] = v8;
  uint64_t v9 = [(WFDatabase *)self visiblePredicate];
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v11 = [v7 andPredicateWithSubpredicates:v10];
  [v6 setPredicate:v11];

  id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:0];
  uint64_t v16 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v6 setSortDescriptors:v13];

  uint64_t v14 = [(WFDatabase *)self workflowResultWithFetchRequest:v6];

  return v14;
}

- (id)visibleReferencesForWorkflowName:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    id v6 = +[WFLibraryQuery sortedWorkflowsWithQuery:v5 sortByName:1 nameEqualing:v4];

    id v7 = [(WFDatabase *)self workflowResultWithLibraryQuery:v6];
    id v8 = [v7 descriptors];
  }
  else
  {
    LOWORD(v10) = 0;
    id v6 = -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, 0, v4, 0, 0, v10, 0);
    id v8 = [v6 descriptors];
  }

  return v8;
}

- (id)allShortcuts
{
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    id v4 = +[WFLibraryQuery sortedWorkflowsWithQuery:v3];

    int v5 = [(WFDatabase *)self workflowResultWithLibraryQuery:v4];
  }
  else
  {
    LOWORD(v7) = 0;
    int v5 = -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 0, 0, 0, 0, 0, v7, 0);
  }
  return v5;
}

- (id)workflowsWithTombstonedConflicts
{
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    id v4 = +[WFLibraryQuery sortedWorkflowsWithQuery:v3 hasTombstonedConflicts:1];

    int v5 = [(WFDatabase *)self workflowResultWithLibraryQuery:v4];
  }
  else
  {
    LOWORD(v7) = 0;
    int v5 = -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 0, 0, 0, 0, 1, v7, 0);
  }
  return v5;
}

- (id)sortedVisibleWorkflowsNameContains:(id)a3 limit:(int64_t)a4
{
  id v6 = a3;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    id v8 = +[WFLibraryQuery sortedWorkflowsWithQuery:v7 sortByName:1 nameContaining:v6 limit:a4];

    uint64_t v9 = [(WFDatabase *)self workflowResultWithLibraryQuery:v8];
  }
  else
  {
    LOWORD(v11) = 0;
    uint64_t v9 = -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, v6, 0, 0, 0, v11, a4);
  }

  return v9;
}

- (id)sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    id v6 = +[WFLibraryQuery sortedWorkflowsWithQuery:v5 sortByName:1 associatedAppBundleIdentifier:v4];

    uint64_t v7 = [(WFDatabase *)self workflowResultWithLibraryQuery:v6];
  }
  else
  {
    LOWORD(v9) = 0;
    uint64_t v7 = -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, 0, 0, v4, 0, v9, 0);
  }

  return v7;
}

- (id)sortedVisibleWorkflowsByLastRunOrModificationDateWithLimit:(int64_t)a3
{
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    id v6 = +[WFLibraryQuery sortedWorkflowsWithQuery:v5 sortByName:0 limit:a3];

    [(WFDatabase *)self workflowResultWithLibraryQuery:v6];
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F2316C80, &unk_1F2316C98, 0);
    LOWORD(v9) = 0;
    -[WFDatabase visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortByKeys:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, v6, 0, 0, 0, 0, v9, a3);
  uint64_t v7 = };

  return v7;
}

- (id)sortedVisibleWorkflowsByNameWithLimit:(int64_t)a3
{
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    id v6 = +[WFLibraryQuery sortedWorkflowsWithQuery:v5 sortByName:1 limit:a3];

    uint64_t v7 = [(WFDatabase *)self workflowResultWithLibraryQuery:v6];
  }
  else
  {
    LOWORD(v9) = 0;
    uint64_t v7 = -[WFDatabase visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:](self, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 1, 0, 0, 0, 0, v9, a3);
  }
  return v7;
}

- (id)sortedVisibleWorkflowsByName
{
  return [(WFDatabase *)self sortedVisibleWorkflowsByNameWithLimit:0];
}

- (id)sortedVisibleWorkflowsWithType:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB4A70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithWorkflowType:v5];

  uint64_t v7 = [(WFDatabase *)self sortedWorkflowsWithQuery:v6];

  return v7;
}

- (unint64_t)countOfAllVisibleWorkflows
{
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    if (self) {
      library = self->_library;
    }
    else {
      library = 0;
    }
    id v4 = library;
    id v5 = [(WFLibrary *)v4 shortcutIdentifiers];
    unint64_t v6 = [v5 count];

    return v6;
  }
  else
  {
    id v8 = +[WFCoreDataWorkflow descriptorFetchRequest];
    uint64_t v9 = [(WFDatabase *)self visiblePredicate];
    [v8 setPredicate:v9];

    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v10 = [(WFDatabase *)self context];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __51__WFDatabase_Shortcuts__countOfAllVisibleWorkflows__block_invoke;
    void v13[3] = &unk_1E6558270;
    id v15 = &v16;
    void v13[4] = self;
    id v11 = v8;
    id v14 = v11;
    [v10 performBlockAndWait:v13];

    unint64_t v12 = v17[3];
    _Block_object_dispose(&v16, 8);

    return v12;
  }
}

void __51__WFDatabase_Shortcuts__countOfAllVisibleWorkflows__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 countForFetchRequest:*(void *)(a1 + 40) error:0];
}

- (id)workflowResultWithLibraryQuery:(id)a3
{
  id v4 = a3;
  id v5 = [[WFCoherenceDatabaseResult alloc] initWithDatabase:self libraryQuery:v4];

  return v5;
}

- (id)allConfiguredTriggersNeedingRunningNotifications
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WFCoreDataTrigger fetchRequest];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %i", @"notificationLevel", 3);
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NO", @"shouldNotify");
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NO", @"shouldPrompt");
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  v15[0] = v4;
  v15[1] = v5;
  v15[2] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];
  [v3 setPredicate:v9];

  uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  id v14 = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v3 setSortDescriptors:v11];

  unint64_t v12 = [(WFDatabase *)self triggerResultWithFetchRequest:v3];

  return v12;
}

- (id)sortedTriggerEventsWithConfirmationOnly:(BOOL)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = +[WFCoreDataTriggerEvent fetchRequest];
  unint64_t v6 = v5;
  if (a3)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = YES", @"confirmed");
    [v6 setPredicate:v7];
  }
  else
  {
    [v5 setPredicate:0];
  }
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v6 setSortDescriptors:v9];

  uint64_t v10 = [[WFCoreDataDatabaseResult alloc] initWithDatabase:self fetchRequest:v6];
  return v10;
}

- (void)setConfirmedForTriggerEventWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __72__WFDatabase_Triggers__setConfirmedForTriggerEventWithIdentifier_error___block_invoke;
  v8[3] = &unk_1E6558A40;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(WFDatabase *)self performTransactionWithReason:@"set trigger confirmed" block:v8 error:a4];
}

void __72__WFDatabase_Triggers__setConfirmedForTriggerEventWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectOfClass:objc_opt_class() withIdentifier:*(void *)(a1 + 40) forKey:@"identifier" createIfNecessary:0 properties:0];
  id v5 = v4;
  if (v4)
  {
    [v4 setConfirmed:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [NSString stringWithFormat:@"Trigger event with ID %@ does not exist", *(void *)(a1 + 40), *MEMORY[0x1E4F28568]];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    *a2 = [v6 errorWithDomain:@"WFDatabaseErrorDomain" code:3 userInfo:v8];
  }
}

- (id)triggerEventForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v6 objectType:4];
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__63112;
  id v15 = __Block_byref_object_dispose__63113;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __56__WFDatabase_Triggers__triggerEventForIdentifier_error___block_invoke;
  v10[3] = &unk_1E6556EF0;
  void v10[4] = &v11;
  [(WFDatabase *)self accessStorageForDescriptor:v7 forWriting:0 readingRecordProperties:0 usingBlock:v10 withError:a4];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __56__WFDatabase_Triggers__triggerEventForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 descriptor];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)createTriggerEventWithTriggerID:(id)a3 eventInfo:(id)a4 confirmed:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__WFDatabase_Triggers__createTriggerEventWithTriggerID_eventInfo_confirmed_error___block_invoke;
  v16[3] = &unk_1E6556EC8;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  BOOL v19 = a5;
  id v12 = v11;
  id v13 = v10;
  id v14 = [(WFDatabase *)self performSaveOperationWithReason:@"creating trigger event" block:v16 error:a6];

  return v14;
}

id __82__WFDatabase_Triggers__createTriggerEventWithTriggerID_eventInfo_confirmed_error___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) objectOfClass:objc_opt_class() withIdentifier:*(void *)(a1 + 40) forKey:@"identifier" createIfNecessary:0 properties:0];
  if (v4)
  {
    id v5 = [WFCoreDataTriggerEvent alloc];
    id v6 = [*(id *)(a1 + 32) context];
    id v7 = [(WFCoreDataTriggerEvent *)v5 initWithContext:v6];

    id v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    [(WFCoreDataTriggerEvent *)v7 setIdentifier:v9];

    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [(WFCoreDataTriggerEvent *)v7 setDateCreated:v10];

    [(WFCoreDataTriggerEvent *)v7 setTrigger:v4];
    [(WFCoreDataTriggerEvent *)v7 setEventInfo:*(void *)(a1 + 48)];
    [(WFCoreDataTriggerEvent *)v7 setConfirmed:*(unsigned __int8 *)(a1 + 56)];
    id v11 = [(WFCoreDataTriggerEvent *)v7 descriptor];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    id v13 = [NSString stringWithFormat:@"Trigger with ID %@ does not exist", *(void *)(a1 + 40), *MEMORY[0x1E4F28568]];
    v17[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a2 = [v12 errorWithDomain:@"WFDatabaseErrorDomain" code:3 userInfo:v14];

    id v11 = 0;
  }

  return v11;
}

- (id)configuredTriggerForTriggerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v4 objectType:1];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__63112;
  id v13 = __Block_byref_object_dispose__63113;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __54__WFDatabase_Triggers__configuredTriggerForTriggerID___block_invoke;
  v8[3] = &unk_1E6556EA0;
  void v8[4] = &v9;
  [(WFDatabase *)self accessStorageForDescriptor:v5 forWriting:0 readingRecordProperties:0 usingBlock:v8 withError:0];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __54__WFDatabase_Triggers__configuredTriggerForTriggerID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 descriptor];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)configuredTriggersForWorkflowID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[WFCoreDataTrigger fetchRequest];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"shortcut.workflowID == %@", v4];

  [v5 setPredicate:v6];
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setSortDescriptors:v8];

  uint64_t v9 = [(WFDatabase *)self triggerResultWithFetchRequest:v5];

  return v9;
}

- (id)associateWorkflowToTrigger:(id)a3 workflow:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__WFDatabase_Triggers__associateWorkflowToTrigger_workflow_error___block_invoke;
  void v14[3] = &unk_1E6556E78;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = [(WFDatabase *)self performSaveOperationWithReason:@"associating trigger with shortcut" block:v14 error:a5];

  return v12;
}

id __66__WFDatabase_Triggers__associateWorkflowToTrigger_workflow_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = [*(id *)(a1 + 40) objectForDescriptor:v3 properties:MEMORY[0x1E4F1CBF0]];
    uint64_t v6 = objc_opt_class();
    id v7 = WFEnforceClass(v5, v6);

    if (!v7)
    {
      [*(id *)(a1 + 40) missingErrorForDescriptor:*(void *)(a1 + 32)];
      id v8 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v9 = [*(id *)(a1 + 40) objectForDescriptor:*(void *)(a1 + 48) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v10 = objc_opt_class();
  id v11 = WFEnforceClass(v9, v10);

  [v11 setShortcut:v7];
  id v8 = [v11 descriptor];

LABEL_6:
  return v8;
}

- (id)createTriggerWithRecord:(id)a3 workflow:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__WFDatabase_Triggers__createTriggerWithRecord_workflow_error___block_invoke;
  void v14[3] = &unk_1E6556E78;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = [(WFDatabase *)self performSaveOperationWithReason:@"creating trigger" block:v14 error:a5];

  return v12;
}

id __63__WFDatabase_Triggers__createTriggerWithRecord_workflow_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:MEMORY[0x1E4F1CBF0]];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = WFEnforceClass(v4, v5);

  if (v6)
  {
    id v7 = [WFCoreDataTrigger alloc];
    id v8 = [*(id *)(a1 + 32) context];
    id v9 = [(WFCoreDataTrigger *)v7 initWithContext:v8];

    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v10 UUIDString];
    [(WFCoreDataTrigger *)v9 setIdentifier:v11];

    if ([*(id *)(a1 + 48) writeToStorage:v9 error:a2])
    {
      [(WFCoreDataTrigger *)v9 setShortcut:v6];
      id v12 = [(WFCoreDataTrigger *)v9 descriptor];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    [*(id *)(a1 + 32) missingErrorForDescriptor:*(void *)(a1 + 40)];
    id v12 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)createTriggerWithRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __54__WFDatabase_Triggers__createTriggerWithRecord_error___block_invoke;
  v10[3] = &unk_1E6556E50;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(WFDatabase *)self performSaveOperationWithReason:@"creating trigger" block:v10 error:a4];

  return v8;
}

id __54__WFDatabase_Triggers__createTriggerWithRecord_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [WFCoreDataTrigger alloc];
  uint64_t v5 = [*(id *)(a1 + 32) context];
  id v6 = [(WFCoreDataTrigger *)v4 initWithContext:v5];

  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  [(WFCoreDataTrigger *)v6 setIdentifier:v8];

  if ([*(id *)(a1 + 40) writeToStorage:v6 error:a2])
  {
    id v9 = [(WFCoreDataTrigger *)v6 descriptor];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)visibleCollectionForFolderName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFDatabase+Collections.m", 677, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __58__WFDatabase_Collections__visibleCollectionForFolderName___block_invoke;
  v10[3] = &unk_1E6558358;
  void v10[4] = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = [(WFDatabase *)self performOperationWithReason:@"getting collection by name" block:v10 error:0];

  return v7;
}

id __58__WFDatabase_Collections__visibleCollectionForFolderName___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      id v4 = (void *)v4[15];
    }
    id v5 = v4;
    id v6 = [v5 folderWithName:*(void *)(a1 + 40) tombstoned:0];
  }
  else
  {
    id v5 = +[WFCoreDataCollection descriptorFetchRequest];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name == %@ AND %K == NO", *(void *)(a1 + 40), @"tombstoned"];
    [v5 setPredicate:v7];

    [v5 setFetchLimit:1];
    id v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 executeFetchRequest:v5 error:a2];

    id v10 = [v9 firstObject];
    id v6 = [v10 descriptor];
  }
  return v6;
}

- (id)validateFolderName:(id)a3 forCollection:(id)a4 error:(id *)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = objc_msgSend(a3, "wf_trimmedString");
  id v10 = v9;
  if (v9 && !objc_msgSend(v9, "wf_isEmpty"))
  {
    id v15 = [(WFDatabase *)self visibleCollectionForFolderName:v10];
    id v12 = v15;
    if (!v15
      || ([v15 identifier],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [v8 identifier],
          id v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v16 isEqualToString:v17],
          v17,
          v16,
          v18))
    {
      a5 = v10;
      goto LABEL_9;
    }
    if (!a5) {
      goto LABEL_9;
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28588];
    id v21 = WFLocalizedString(@"Name Cannot Be Used");
    v28[0] = v21;
    uint64_t v27 = *MEMORY[0x1E4F28568];
    id v22 = NSString;
    id v23 = WFLocalizedString(@"You already have a folder named “%@”. Please choose another name for this folder.");
    id v24 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v10, v26, v27, v21);
    v28[1] = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v26 count:2];
    *a5 = [v20 errorWithDomain:@"WFWorkflowErrorDomain" code:1 userInfo:v25];
  }
  else
  {
    if (!a5) {
      goto LABEL_10;
    }
    id v11 = (void *)MEMORY[0x1E4F28C58];
    v29[0] = *MEMORY[0x1E4F28588];
    id v12 = WFLocalizedString(@"Invalid Name");
    v30[0] = v12;
    v29[1] = *MEMORY[0x1E4F28568];
    id v13 = WFLocalizedString(@"Please enter a name for this folder.");
    v30[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    *a5 = [v11 errorWithDomain:@"WFWorkflowErrorDomain" code:0 userInfo:v14];
  }
  a5 = 0;
LABEL_9:

LABEL_10:
  return a5;
}

- (id)collectionResultWithLibraryQuery:(id)a3
{
  id v4 = a3;
  id v5 = [[WFCoherenceDatabaseResult alloc] initWithDatabase:self libraryQuery:v4];

  return v5;
}

- (id)collectionsWithOutOfSyncWalrusStatus
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WFCoreDataCollection descriptorFetchRequest];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K != %K) OR (%K == NIL AND %K > 0)", @"wantedEncryptedSchemaVersion", @"lastSyncedEncryptedSchemaVersion", @"lastSyncedEncryptedSchemaVersion", @"wantedEncryptedSchemaVersion");
  [v3 setPredicate:v4];

  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:0];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setSortDescriptors:v6];

  id v7 = [(WFDatabase *)self collectionResultWithFetchRequest:v3];

  return v7;
}

- (id)orphanedShortcuts
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__WFDatabase_Collections__orphanedShortcuts__block_invoke;
  v4[3] = &unk_1E6558590;
  v4[4] = self;
  id v2 = [(WFDatabase *)self performOperationWithReason:@"getting orphaned shortcuts" block:v4 error:0];
  return v2;
}

id __44__WFDatabase_Collections__orphanedShortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[WFCoreDataWorkflow descriptorFetchRequest];
  id v5 = [*(id *)(a1 + 32) orphanedWorkflowsPredicate];
  [v4 setPredicate:v5];

  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v12[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v4 setSortDescriptors:v7];

  id v8 = [*(id *)(a1 + 32) context];
  id v9 = [v8 executeFetchRequest:v4 error:a2];

  id v10 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_303_69611);

  return v10;
}

uint64_t __44__WFDatabase_Collections__orphanedShortcuts__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (id)orphanedWorkflowsPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(parents, $folder, ANY $folder.parents.identifier == %@ OR $folder.identifier == %@).@count == 0", @"Root", @"Root"];
}

- (id)orphanedFolders
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__WFDatabase_Collections__orphanedFolders__block_invoke;
  v4[3] = &unk_1E6558590;
  v4[4] = self;
  id v2 = [(WFDatabase *)self performOperationWithReason:@"getting orphaned folders" block:v4 error:0];
  return v2;
}

id __42__WFDatabase_Collections__orphanedFolders__block_invoke(uint64_t a1, uint64_t a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[WFCoreDataCollection descriptorFetchRequest];
  id v5 = [*(id *)(a1 + 32) orphanedFoldersPredicate];
  [v4 setPredicate:v5];

  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v14[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v4 setSortDescriptors:v7];

  id v8 = [*(id *)(a1 + 32) context];
  id v9 = [v8 executeFetchRequest:v4 error:a2];

  id v10 = [v9 indexesOfObjectsPassingTest:&__block_literal_global_290];
  id v11 = [v9 objectsAtIndexes:v10];
  id v12 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_293);

  return v12;
}

uint64_t __42__WFDatabase_Collections__orphanedFolders__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

BOOL __42__WFDatabase_Collections__orphanedFolders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)orphanedFoldersPredicate
{
  id v2 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v3 = WFGetBuiltInCollectionIdentifiers(1);
  BOOL v4 = [v2 predicateWithFormat:@"%K.@count == 0 AND NOT %K IN %@", @"parents", @"identifier", v3];

  return v4;
}

- (id)suggestedFolderNameForName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFDatabase+Collections.m", 566, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v6 = [v5 componentsSeparatedByString:@" "];
  id v7 = [v6 lastObject];
  id v8 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  id v9 = [v8 invertedSet];
  uint64_t v10 = [v7 rangeOfCharacterFromSet:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [v6 lastObject];
    uint64_t v12 = [v11 integerValue];

    uint64_t v13 = objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);

    id v6 = (void *)v13;
  }
  else
  {
    uint64_t v12 = 1;
  }
  id v14 = v5;
  id v15 = [(WFDatabase *)self visibleCollectionForFolderName:v14];

  id v22 = v14;
  if (v15)
  {
    id v16 = v14;
    do
    {
      id v17 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu", v12);
      int v18 = [v6 arrayByAddingObject:v17];
      id v14 = [v18 componentsJoinedByString:@" "];

      ++v12;
      BOOL v19 = [(WFDatabase *)self visibleCollectionForFolderName:v14];

      id v16 = v14;
    }
    while (v19);
  }

  return v14;
}

- (id)collectionRecordForCollectionIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FB4698];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithIdentifier:v7 objectType:2];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __85__WFDatabase_Collections__collectionRecordForCollectionIdentifier_createIfNecessary___block_invoke;
  v12[3] = &unk_1E6558528;
  void v12[4] = self;
  id v13 = v8;
  BOOL v14 = a4;
  id v9 = v8;
  uint64_t v10 = [(WFDatabase *)self performSaveOperationWithReason:@"get/create collection by id" block:v12 error:0];

  return v10;
}

WFWorkflowCollectionRecord *__85__WFDatabase_Collections__collectionRecordForCollectionIdentifier_createIfNecessary___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0 createIfNecessary:*(unsigned __int8 *)(a1 + 48)];
  if (v1) {
    id v2 = [(WFRecord *)[WFWorkflowCollectionRecord alloc] initWithStorage:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)deletedFolders
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v3 = +[WFLibraryQuery deletedFolders];
    uint64_t v4 = [(WFDatabase *)self collectionResultWithLibraryQuery:v3];
  }
  else
  {
    uint64_t v3 = +[WFCoreDataCollection descriptorFetchRequest];
    id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = YES", @"tombstoned");
    [v3 setPredicate:v5];

    id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setSortDescriptors:v7];

    uint64_t v4 = [(WFDatabase *)self collectionResultWithFetchRequest:v3];
  }
  id v8 = (void *)v4;

  return v8;
}

- (id)allCollections
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v3 = +[WFLibraryQuery sortedGroupings];
    uint64_t v4 = [(WFDatabase *)self collectionResultWithLibraryQuery:v3];
  }
  else
  {
    uint64_t v3 = +[WFCoreDataCollection descriptorFetchRequest];
    id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    [v3 setPredicate:v5];

    id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setSortDescriptors:v7];

    uint64_t v4 = [(WFDatabase *)self collectionResultWithFetchRequest:v3];
  }
  id v8 = (void *)v4;

  return v8;
}

- (BOOL)moveCollections:(id)a3 toIndexes:(id)a4 ofCollectionWithIdentifier:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  if (!v11)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFDatabase+Collections.m", 464, @"Invalid parameter not satisfying: %@", @"collections" object file lineNumber description];
  }
  BOOL v14 = @"Root";
  if (v13) {
    BOOL v14 = v13;
  }
  id v15 = v14;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke;
  void v25[3] = &unk_1E6558500;
  id v16 = v12;
  id v26 = v16;
  uint64_t v27 = self;
  id v17 = v11;
  id v28 = v17;
  int v18 = v15;
  id v29 = v18;
  BOOL v19 = v13;
  id v30 = v19;
  id v24 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"move collection(s)" block:v25 error:&v24];
  id v20 = v24;
  id v21 = v20;
  if (a6) {
    *a6 = v20;
  }

  return v21 == 0;
}

void __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v3 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFDatabase(Collections) moveCollections:toIndexes:ofCollectionWithIdentifier:error:]_block_invoke";
      __int16 v49 = 2114;
      uint64_t v50 = v4;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEBUG, "%s Move collections to indexes %{public}@", buf, 0x16u);
    }

    id v5 = *(void **)(a1 + 40);
    if (v5) {
      id v5 = (void *)v5[15];
    }
    id v6 = v5;
    [v6 moveFolders:*(void *)(a1 + 48) toIndexes:*(void *)(a1 + 32) error:a2];

    id v7 = *(void **)(a1 + 40);
    if (v7) {
      id v8 = (void *)v7[15];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    [v7 saveLibraryToDatabase:v9];

    uint64_t v10 = *(void **)(a1 + 40);
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(a1 + 56) objectType:2];
    [v10 addPendingUpdatedDescriptor:v11];
  }
  else
  {
    id v11 = objc_opt_new();
    id v12 = *(__CFString **)(a1 + 64);
    if (!v12) {
      id v12 = @"Root";
    }
    BOOL v39 = v12;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v13 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          id v17 = v11;
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(obj);
          }
          int v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          BOOL v19 = *(void **)(a1 + 40);
          uint64_t v20 = objc_opt_class();
          id v21 = [v18 identifier];
          id v22 = [v19 objectOfClass:v20 withIdentifier:v21 forKey:@"identifier" createIfNecessary:1 properties:MEMORY[0x1E4F1CBF0]];

          id v23 = [v22 parents];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke_266;
          v41[3] = &unk_1E65584B8;
          long long v42 = v39;
          id v24 = objc_msgSend(v23, "if_compactMap:", v41);
          [v22 setParents:v24];

          id v25 = *(void **)(a1 + 40);
          *(void *)long long buf = @"parents";
          id v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

          [v25 object:v22 didUpdateProperties:v26 error:a2];
          id v11 = v17;
          [v17 addObject:v22];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v14);
    }

    uint64_t v27 = [*(id *)(a1 + 40) objectOfClass:objc_opt_class() withIdentifier:v39 forKey:@"identifier" createIfNecessary:1 properties:MEMORY[0x1E4F1CBF0]];
    id v28 = [v27 collections];
    id v29 = (void *)[v28 mutableCopy];
    id v30 = v29;
    if (v29) {
      id v31 = v29;
    }
    else {
      id v31 = (id)objc_opt_new();
    }
    id v32 = v31;

    id v33 = objc_msgSend(v32, "if_compactMap:", &__block_literal_global_269_69644);
    id v34 = (void *)[v33 mutableCopy];

    unint64_t v35 = [*(id *)(a1 + 32) firstIndex];
    if (v35 >= [v34 count]) {
      [v34 addObjectsFromArray:v11];
    }
    else {
      [v34 insertObjects:v11 atIndexes:*(void *)(a1 + 32)];
    }
    [v27 setCollections:v34];
    unint64_t v36 = *(void **)(a1 + 40);
    *(void *)long long buf = @"collections";
    BOOL v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

    [v36 object:v27 didUpdateProperties:v37 error:a2];
  }
}

id __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke_266(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

id __86__WFDatabase_Collections__moveCollections_toIndexes_ofCollectionWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 tombstoned])
  {
    [v2 setParents:0];
    id v3 = 0;
  }
  else
  {
    id v3 = v2;
  }

  return v3;
}

- (BOOL)moveCollections:(id)a3 toIndexes:(id)a4 error:(id *)a5
{
  return [(WFDatabase *)self moveCollections:a3 toIndexes:a4 ofCollectionWithIdentifier:@"Root" error:a5];
}

- (BOOL)removeReferences:(id)a3 fromCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke;
  v16[3] = &unk_1E6558490;
  id v10 = v8;
  id v17 = v10;
  int v18 = self;
  id v11 = v9;
  id v19 = v11;
  id v15 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"remove shortcut from collection" block:v16 error:&v15];
  id v12 = v15;
  uint64_t v13 = v12;
  if (a5) {
    *a5 = v12;
  }

  return v13 == 0;
}

void __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke(id *a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    uint64_t v8 = *(void *)v39;
    *(void *)&long long v5 = 136315394;
    long long v33 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
        id v11 = objc_msgSend(a1[5], "objectForDescriptor:properties:", v10, v7, v33);
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = WFEnforceClass(v11, v12);

        if (!v13)
        {
          *a2 = [a1[5] missingErrorForDescriptor:v10];
          goto LABEL_26;
        }
        if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
        {
          uint64_t v14 = getWFCoherenceLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            id v15 = [v10 identifier];
            id v16 = a1[6];
            *(_DWORD *)long long buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[WFDatabase(Collections) removeReferences:fromCollectionWithIdentifier:error:]_block_invoke";
            __int16 v43 = 2114;
            id v44 = v15;
            __int16 v45 = 2114;
            id v46 = v16;
            _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEBUG, "%s Remove shortcut with id %{public}@ from collection with id %{public}@", buf, 0x20u);
          }
          id v17 = a1[5];
          if (v17) {
            id v17 = (void *)v17[15];
          }
          int v18 = v17;
          id v19 = [v10 identifier];
          id v20 = a1[6];
          id v37 = 0;
          [v18 removeShortcutWithIdentifier:v19 fromCollectionWithIdentifier:v20 error:&v37];
          id v21 = v37;

          if (v21)
          {
            id v22 = getWFCoherenceLogObject();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v33;
              *(void *)&uint8_t buf[4] = "-[WFDatabase(Collections) removeReferences:fromCollectionWithIdentifier:error:]_block_invoke";
              __int16 v43 = 2114;
              id v44 = v21;
              _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to remove workflow from a collection with error: %{public}@", buf, 0x16u);
            }
          }
          id v23 = a1[5];
          if (v23) {
            id v24 = (void *)v23[15];
          }
          else {
            id v24 = 0;
          }
          id v25 = v24;
          [v23 saveLibraryToDatabase:v25];

          id v26 = a1[5];
          uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:a1[6] objectType:2];
          [v26 addPendingUpdatedDescriptor:v27];
        }
        else
        {
          id v28 = [v13 parents];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke_262;
          v35[3] = &unk_1E65583F8;
          id v36 = a1[6];
          id v29 = objc_msgSend(v28, "if_compactMap:", v35);
          [v13 setParents:v29];

          id v30 = a1[5];
          *(void *)long long buf = @"parents";
          id v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

          [v30 object:v13 didUpdateProperties:v31 error:a2];
          id v21 = v36;
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v32 = [v3 countByEnumeratingWithState:&v38 objects:v47 count:16];
      uint64_t v6 = v32;
    }
    while (v32);
  }
LABEL_26:
}

id __79__WFDatabase_Collections__removeReferences_fromCollectionWithIdentifier_error___block_invoke_262(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  LOBYTE(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

- (BOOL)prependReferences:(id)a3 toCollectionWithType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = WFWorkflowCollectionIdentifierForWorkflowType(a4);
  id v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  LOBYTE(a5) = [(WFDatabase *)self _moveReferences:v8 toIndexes:v10 ofCollectionID:v9 error:a5];

  return (char)a5;
}

- (BOOL)prependReferences:(id)a3 toCollection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 identifier];
  id v10 = (void *)v9;
  id v11 = @"Root";
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  uint64_t v12 = v11;

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  BOOL v14 = [(WFDatabase *)self _moveReferences:v8 toIndexes:v13 ofCollectionID:v12 error:a5];

  return v14;
}

- (BOOL)_moveReferences:(id)a3 toIndexes:(id)a4 ofCollectionID:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFDatabase+Collections.m", 253, @"Invalid parameter not satisfying: %@", @"destinationID" object file lineNumber description];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke;
  v22[3] = &unk_1E6558468;
  id v14 = v12;
  id v23 = v14;
  id v15 = v11;
  id v24 = v15;
  id v16 = v13;
  id v25 = v16;
  id v26 = self;
  id v21 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"move shortcut" block:v22 error:&v21];
  id v17 = v21;
  int v18 = v17;
  if (a6) {
    *a6 = v17;
  }

  return v18 == 0;
}

void __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke(id *a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    if (!a1[4])
    {
      uint64_t v6 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to move shortcuts because target index set is nil", buf, 0xCu);
      }
      goto LABEL_28;
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_243;
    v48[3] = &unk_1E65583D0;
    id v3 = a1[5];
    id v4 = a1[6];
    id v5 = a1[7];
    id v49 = v4;
    id v50 = v5;
    id v51 = a1[4];
    [v3 enumerateObjectsUsingBlock:v48];
  }
  uint64_t v6 = [a1[7] objectOfClass:objc_opt_class() withIdentifier:a1[6] forKey:@"identifier" createIfNecessary:1 properties:MEMORY[0x1E4F1CBF0]];
  long long v40 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = a1[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v13 = [a1[7] objectForDescriptor:v12 properties:MEMORY[0x1E4F1CBF0]];
        uint64_t v14 = objc_opt_class();
        id v15 = WFEnforceClass(v13, v14);

        if (!v15)
        {
          *a2 = [a1[7] missingErrorForDescriptor:v12];
          id v31 = v7;
          goto LABEL_27;
        }
        id v16 = [v15 parents];
        id v17 = v6;
        char v18 = [v16 containsObject:v6];

        id v19 = WFWorkflowTypeForCollectionIdentifier(a1[6]);

        id v20 = [v15 parents];
        id v21 = v20;
        if ((v18 & 1) != 0 || v19)
        {
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          void v42[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_249;
          v42[3] = &unk_1E65583F8;
          id v43 = a1[6];
          id v23 = objc_msgSend(v21, "if_compactMap:", v42);
          [v15 setParents:v23];

          id v21 = v43;
        }
        else
        {
          id v22 = objc_msgSend(v20, "if_compactMap:", &__block_literal_global_252);
          [v15 setParents:v22];
        }
        id v24 = a1[7];
        *(void *)long long buf = @"parents";
        id v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

        [v24 object:v15 didUpdateProperties:v25 error:a2];
        [v40 addObject:v15];

        uint64_t v6 = v17;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v26 = v6;
  uint64_t v27 = [v6 shortcuts];
  id v28 = (void *)[v27 mutableCopy];
  id v29 = v28;
  if (v28) {
    id v30 = v28;
  }
  else {
    id v30 = (id)objc_opt_new();
  }
  uint64_t v32 = v30;

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_3;
  v41[3] = &unk_1E6558440;
  void v41[4] = a1[7];
  long long v33 = objc_msgSend(v32, "if_compactMap:", v41);
  id v31 = (void *)[v33 mutableCopy];

  id v34 = a1[4];
  if (v34 && (unint64_t v35 = [v34 firstIndex], v35 <= objc_msgSend(v31, "count")))
  {
    [a1[4] firstIndex];
    [v31 insertObjects:v40 atIndexes:a1[4]];
    [v26 setShortcuts:v31];
    id v38 = a1[7];
    *(void *)long long buf = @"shortcuts";
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

    [v38 object:v26 didUpdateProperties:v37 error:a2];
    uint64_t v6 = v26;
  }
  else
  {
    [v31 addObjectsFromArray:v40];
    uint64_t v6 = v26;
    [v26 setShortcuts:v31];
    id v36 = a1[7];
    *(void *)long long buf = @"shortcuts";
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

    [v36 object:v26 didUpdateProperties:v37 error:a2];
  }

LABEL_27:
LABEL_28:
}

void __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_243(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = getWFCoherenceLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v5 identifier];
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 136315650;
    id v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
    __int16 v79 = 2114;
    id v80 = v7;
    __int16 v81 = 2114;
    uint64_t v82 = v8;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEBUG, "%s Move shortcut with id %{public}@ to collection with id %{public}@", buf, 0x20u);
  }
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9) {
    uint64_t v9 = (void *)v9[15];
  }
  uint64_t v10 = v9;
  id v11 = [v5 identifier];
  id v75 = 0;
  uint64_t v12 = [v10 collectionAndFolderIdentifiersContainingShortcut:v11 error:&v75];
  id v13 = v75;

  if (v13)
  {
    uint64_t v14 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
      __int16 v79 = 2114;
      id v80 = v13;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get collection and folder identifiers: %{public}@", buf, 0x16u);
    }
  }
  int v15 = [v12 containsObject:*(void *)(a1 + 32)];
  id v16 = WFWorkflowTypeForCollectionIdentifier(*(void **)(a1 + 32));

  id v17 = [v5 identifier];
  if (v15)
  {
    int v18 = [*(id *)(a1 + 32) isEqualToString:@"Root"];
    if ([*(id *)(a1 + 48) count] == 1)
    {
      uint64_t v19 = [*(id *)(a1 + 48) firstIndex];
    }
    else
    {
      id v25 = objc_opt_new();
      id v26 = *(void **)(a1 + 48);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      id v73[2] = __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_245;
      v73[3] = &unk_1E65583A8;
      id v74 = v25;
      id v27 = v13;
      id v28 = v25;
      [v26 enumerateIndexesUsingBlock:v73];
      id v29 = [v28 objectAtIndex:a3];
      uint64_t v19 = [v29 unsignedIntValue];

      id v13 = v27;
    }
    if (v16) {
      int v30 = 1;
    }
    else {
      int v30 = v18;
    }
    id v31 = *(void **)(a1 + 40);
    if (v31) {
      id v31 = (void *)v31[15];
    }
    uint64_t v32 = v31;
    long long v33 = v32;
    uint64_t v34 = *(void *)(a1 + 32);
    if (v30)
    {
      uint64_t v72 = 0;
      unint64_t v35 = (id *)&v72;
      [v32 moveShortcutWithIdentifier:v17 toIndex:v19 ofCollectionWithIdentifier:v34 error:&v72];
    }
    else
    {
      uint64_t v71 = 0;
      unint64_t v35 = (id *)&v71;
      [v32 moveShortcutWithIdentifier:v17 toIndex:v19 ofFolderWithIdentifier:v34 error:&v71];
    }
    id v24 = *v35;

    id v36 = *(void **)(a1 + 40);
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(a1 + 32) objectType:2];
    [v36 addPendingUpdatedDescriptor:v37];

    if (v24)
    {
      id v38 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke_2";
        __int16 v79 = 2114;
        id v80 = v24;
        _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_ERROR, "%s Failed to reorder shortcut with error: %{public}@", buf, 0x16u);
      }
LABEL_46:
    }
  }
  else
  {
    id v20 = *(void **)(a1 + 40);
    if (v20) {
      id v20 = (void *)v20[15];
    }
    id v21 = v20;
    id v22 = v21;
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v60 = v17;
    id v61 = v13;
    if (v16)
    {
      id v70 = 0;
      [v21 insertShortcutWithIdentifier:v17 atIndex:a3 toCollection:v23 error:&v70];
      id v24 = v70;
    }
    else
    {
      id v69 = 0;
      long long v39 = [v21 shortcutsInFolderWithIdentifier:v23 error:&v69];
      id v40 = v69;
      uint64_t v41 = [v39 count];

      long long v42 = *(void **)(a1 + 40);
      if (v42) {
        long long v42 = (void *)v42[15];
      }
      id v43 = v42;
      id v22 = v43;
      uint64_t v44 = *(void *)(a1 + 32);
      if (v41)
      {
        id v68 = v40;
        [v43 moveShortcutWithIdentifier:v17 toIndex:a3 ofFolderWithIdentifier:v44 error:&v68];
        id v24 = v68;
      }
      else
      {
        id v67 = v40;
        [v43 appendShortcutWithIdentifier:v17 toFolder:v44 error:&v67];
        id v45 = v67;

        long long v46 = *(void **)(a1 + 40);
        if (v46) {
          long long v46 = (void *)v46[15];
        }
        id v22 = v46;
        uint64_t v47 = *(void *)(a1 + 32);
        id v66 = v45;
        [v22 moveShortcutWithIdentifier:v17 toIndex:0 ofFolderWithIdentifier:v47 error:&v66];
        id v24 = v66;
      }
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v48 = v12;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v62 objects:v76 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v63 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v53 = *(void **)(a1 + 40);
          uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(*((void *)&v62 + 1) + 8 * i) objectType:2];
          [v53 addPendingUpdatedDescriptor:v54];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v62 objects:v76 count:16];
      }
      while (v50);
    }

    id v55 = *(void **)(a1 + 40);
    uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(a1 + 32) objectType:2];
    [v55 addPendingUpdatedDescriptor:v56];

    if (v24)
    {
      id v38 = getWFCoherenceLogObject();
      id v13 = v61;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v78 = "-[WFDatabase(Collections) _moveReferences:toIndexes:ofCollectionID:error:]_block_invoke";
        __int16 v79 = 2114;
        id v80 = v24;
        _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_ERROR, "%s Failed to move shortcut with error: %{public}@", buf, 0x16u);
      }
      id v17 = v60;
      goto LABEL_46;
    }
    id v13 = v61;
    id v17 = v60;
  }

  id v57 = *(void **)(a1 + 40);
  if (v57) {
    __int16 v58 = (void *)v57[15];
  }
  else {
    __int16 v58 = 0;
  }
  id v59 = v58;
  [v57 saveLibraryToDatabase:v59];
}

id __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_249(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  LOBYTE(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

id __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 tombstoned])
  {
    [v3 setParents:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) visiblePredicate];
    int v5 = [v4 evaluateWithObject:v3];

    if (v5)
    {
      id v6 = v3;
      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

id __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 identifier];
  id v4 = WFWorkflowTypeForCollectionIdentifier(v3);

  if (v4) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void __74__WFDatabase_Collections___moveReferences_toIndexes_ofCollectionID_error___block_invoke_245(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (BOOL)moveReferences:(id)a3 toIndexes:(id)a4 ofCollection:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [a5 identifier];
  id v13 = (void *)v12;
  uint64_t v14 = @"Root";
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  int v15 = v14;

  BOOL v16 = [(WFDatabase *)self _moveReferences:v11 toIndexes:v10 ofCollectionID:v15 error:a6];
  return v16;
}

- (BOOL)moveReferences:(id)a3 toIndex:(int64_t)a4 ofCollection:(id)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [a5 identifier];
  uint64_t v12 = (void *)v11;
  id v13 = @"Root";
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  uint64_t v14 = v13;

  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v15 = [(WFDatabase *)self _moveReferences:v10 toIndexes:0 ofCollectionID:v14 error:a6];
  }
  else
  {
    BOOL v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a4, objc_msgSend(v10, "count"));
    BOOL v15 = [(WFDatabase *)self _moveReferences:v10 toIndexes:v16 ofCollectionID:v14 error:a6];
  }
  return v15;
}

- (id)collectionWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  id v6 = a3;
  if (a4 && ![MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __70__WFDatabase_Collections__collectionWithIdentifier_createIfNecessary___block_invoke;
    v9[3] = &unk_1E6558380;
    id v10 = v6;
    uint64_t v11 = self;
    BOOL v12 = a4;
    id v7 = [(WFDatabase *)self performSaveOperationWithReason:@"get/create collection by id" block:v9 error:0];
  }
  else
  {
    id v7 = [(WFDatabase *)self collectionWithIdentifier:v6];
  }

  return v7;
}

id __70__WFDatabase_Collections__collectionWithIdentifier_createIfNecessary___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(a1 + 32) objectType:2];
  id v3 = [*(id *)(a1 + 40) objectForDescriptor:v2 properties:0 createIfNecessary:*(unsigned __int8 *)(a1 + 48)];
  id v4 = [v3 descriptor];

  return v4;
}

- (id)collectionWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    id v5 = WFGetBuiltInCollectionIdentifiers(1);
    char v6 = [v5 containsObject:v4];
    if (self) {
      library = self->_library;
    }
    else {
      library = 0;
    }
    uint64_t v8 = library;
    uint64_t v9 = v8;
    if (v6) {
      [(WFLibrary *)v8 collectionWithIdentifier:v4];
    }
    else {
    id v10 = [(WFLibrary *)v8 folderWithIdentifier:v4 error:0];
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __52__WFDatabase_Collections__collectionWithIdentifier___block_invoke;
    v12[3] = &unk_1E6558358;
    id v13 = v4;
    uint64_t v14 = self;
    id v10 = [(WFDatabase *)self performOperationWithReason:@"getting collection for id" block:v12 error:0];
  }
  return v10;
}

id __52__WFDatabase_Collections__collectionWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:*(void *)(a1 + 32) objectType:2];
  id v3 = [*(id *)(a1 + 40) objectForDescriptor:v2 properties:0 createIfNecessary:0];
  id v4 = [v3 descriptor];

  return v4;
}

- (id)collectionForWorkflowType:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    if (self) {
      library = self->_library;
    }
    else {
      library = 0;
    }
    char v6 = library;
    id v7 = [(WFLibrary *)v6 collectionWithWorkflowType:v4];
  }
  else
  {
    uint64_t v8 = NSString;
    uint64_t v9 = WFHumanReadableNameForWorkflowType();
    id v10 = [v8 stringWithFormat:@"getting collection for workflow type %@", v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __53__WFDatabase_Collections__collectionForWorkflowType___block_invoke;
    v12[3] = &unk_1E6558358;
    id v13 = v4;
    uint64_t v14 = self;
    id v7 = [(WFDatabase *)self performOperationWithReason:v10 block:v12 error:0];
  }
  return v7;
}

id __53__WFDatabase_Collections__collectionForWorkflowType___block_invoke(uint64_t a1)
{
  id v2 = WFWorkflowCollectionIdentifierForWorkflowType(*(void **)(a1 + 32));
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) objectOfClass:objc_opt_class() withIdentifier:v2 forKey:@"identifier" createIfNecessary:1 properties:0];
    id v4 = [v3 descriptor];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)folderForWorkflowReference:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  if ([v4 databaseCoherenceEnabled])
  {
    if (self) {
      library = self->_library;
    }
    else {
      library = 0;
    }
    id v7 = library;
    uint64_t v8 = [v5 identifier];

    uint64_t v9 = [(WFLibrary *)v7 folderContainingShortcut:v8 error:0];
  }
  else
  {
    id v10 = WFGetBuiltInCollectionIdentifiers(1);
    id v7 = [(WFDatabase *)self collectionsForWorkflowReference:v5];

    uint64_t v11 = [(WFLibrary *)v7 allObjects];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __54__WFDatabase_Collections__folderForWorkflowReference___block_invoke;
    void v14[3] = &unk_1E6558330;
    id v15 = v10;
    id v12 = v10;
    uint64_t v9 = objc_msgSend(v11, "if_firstObjectPassingTest:", v14);
  }
  return v9;
}

uint64_t __54__WFDatabase_Collections__folderForWorkflowReference___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)collectionsForWorkflowReference:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    if (self) {
      library = self->_library;
    }
    else {
      library = 0;
    }
    char v6 = library;
    id v7 = [v4 identifier];
    id v17 = 0;
    uint64_t v8 = [(WFLibrary *)v6 collectionsAndFoldersContainingShortcut:v7 error:&v17];
    id v9 = v17;

    if (v9)
    {
      id v10 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [v4 identifier];
        *(_DWORD *)long long buf = 136315650;
        uint64_t v19 = "-[WFDatabase(Collections) collectionsForWorkflowReference:]";
        __int16 v20 = 2114;
        id v21 = v11;
        __int16 v22 = 2114;
        id v23 = v9;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Fetching collections for shortcut with id %{public}@ failed with error: %{public}@", buf, 0x20u);
      }
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    }
    id v13 = (void *)v12;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__WFDatabase_Collections__collectionsForWorkflowReference___block_invoke;
    v15[3] = &unk_1E6558308;
    void v15[4] = self;
    id v16 = v4;
    id v13 = [(WFDatabase *)self performOperationWithReason:@"getting collections for shortcut" block:v15 error:0];
  }
  return v13;
}

id __59__WFDatabase_Collections__collectionsForWorkflowReference___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 40) properties:0 createIfNecessary:0];
  id v2 = [v1 parents];
  id v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_69688);

  return v3;
}

uint64_t __59__WFDatabase_Collections__collectionsForWorkflowReference___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (id)updateFolder:(id)a3 newName:(id)a4 newIcon:(unsigned __int16)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__WFDatabase_Collections__updateFolder_newName_newIcon_error___block_invoke;
  v16[3] = &unk_1E65582C0;
  void v16[4] = self;
  id v17 = v11;
  id v18 = v10;
  unsigned __int16 v19 = a5;
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = [(WFDatabase *)self performSaveOperationWithReason:@"update folder" block:v16 error:a6];

  return v14;
}

id __62__WFDatabase_Collections__updateFolder_newName_newIcon_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) validateFolderName:*(void *)(a1 + 40) forCollection:*(void *)(a1 + 48) error:a2];
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_20;
  }
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    id v5 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      char v6 = [*(id *)(a1 + 48) identifier];
      *(_DWORD *)id v31 = 136315394;
      *(void *)&void v31[4] = "-[WFDatabase(Collections) updateFolder:newName:newIcon:error:]_block_invoke";
      *(_WORD *)&v31[12] = 2114;
      *(void *)&v31[14] = v6;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s Update folder with id %{public}@", v31, 0x16u);
    }
    id v7 = *(void **)(a1 + 32);
    if (v7) {
      id v7 = (void *)v7[15];
    }
    uint64_t v8 = v7;
    id v9 = [*(id *)(a1 + 48) identifier];
    id v10 = [v8 updateFolderWithIdentifier:v9 newName:v4 newIcon:*(unsigned __int16 *)(a1 + 56) error:a2];

    id v11 = *(void **)(a1 + 32);
    if (v11) {
      id v12 = (void *)v11[15];
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    [v11 saveLibraryToDatabase:v13];

    uint64_t v14 = *(void **)(a1 + 32);
    id v15 = objc_alloc(MEMORY[0x1E4FB4698]);
    id v16 = [*(id *)(a1 + 48) identifier];
    id v17 = (void *)[v15 initWithIdentifier:v16 objectType:2];
    [v14 addPendingUpdatedDescriptor:v17];

    goto LABEL_19;
  }
  id v18 = *(void **)(a1 + 32);
  uint64_t v19 = objc_opt_class();
  __int16 v20 = [*(id *)(a1 + 48) identifier];
  id v16 = [v18 objectOfClass:v19 withIdentifier:v20 forKey:@"identifier" createIfNecessary:0 properties:MEMORY[0x1E4F1CBF0]];

  id v21 = *(void **)(a1 + 40);
  __int16 v22 = [v16 name];
  if (([v21 isEqualToString:v22] & 1) == 0)
  {

LABEL_15:
    [v16 setName:v4];
    id v26 = (void *)[objc_alloc(MEMORY[0x1E4FB4A50]) initWithBackgroundColorValue:0 glyphCharacter:*(unsigned __int16 *)(a1 + 56) customImageData:0];
    [v16 setWorkflowIcon:v26];

    id v27 = *(void **)(a1 + 32);
    *(void *)id v31 = @"name";
    *(void *)&v31[8] = @"workflowIcon";
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v31 count:2];
    for (uint64_t i = 8; i != -8; i -= 8)

    objc_msgSend(v27, "object:didUpdateProperties:error:", v16, v28, a2, *(void *)v31, *(void *)&v31[8]);
    goto LABEL_18;
  }
  id v23 = [v16 workflowIcon];
  int v24 = [v23 glyphCharacter];
  int v25 = *(unsigned __int16 *)(a1 + 56);

  if (v24 != v25) {
    goto LABEL_15;
  }
LABEL_18:
  id v10 = [v16 descriptor];
LABEL_19:

LABEL_20:
  return v10;
}

- (id)createFolderWithName:(id)a3 icon:(unsigned __int16)a4 error:(id *)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __59__WFDatabase_Collections__createFolderWithName_icon_error___block_invoke;
  v12[3] = &unk_1E6558298;
  id v13 = v8;
  uint64_t v14 = self;
  unsigned __int16 v15 = a4;
  id v9 = v8;
  id v10 = [(WFDatabase *)self performSaveOperationWithReason:@"create folder" block:v12 error:a5];

  return v10;
}

id __59__WFDatabase_Collections__createFolderWithName_icon_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  if (v4 && (objc_msgSend(v4, "wf_isEmpty") & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 40) validateFolderName:*(void *)(a1 + 32) forCollection:0 error:a2];
    if (v7) {
      goto LABEL_4;
    }
LABEL_17:
    id v18 = 0;
    goto LABEL_26;
  }
  id v5 = *(void **)(a1 + 40);
  char v6 = [MEMORY[0x1E4FB4A28] defaultName];
  id v7 = [v5 suggestedFolderNameForName:v6];

  if (!v7) {
    goto LABEL_17;
  }
LABEL_4:
  id v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];

  id v10 = [WFCoreDataCollection alloc];
  id v11 = [*(id *)(a1 + 40) context];
  id v12 = [(WFCoreDataCollection *)v10 initWithContext:v11];

  [(WFCoreDataCollection *)v12 setIdentifier:v9];
  id v13 = [*(id *)(a1 + 40) objectOfClass:objc_opt_class() withIdentifier:@"Root" forKey:@"identifier" createIfNecessary:1 properties:MEMORY[0x1E4F1CBF0]];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    uint64_t v14 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFDatabase(Collections) createFolderWithName:icon:error:]_block_invoke";
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEBUG, "%s Create folder with id %{public}@", buf, 0x16u);
    }

    unsigned __int16 v15 = *(void **)(a1 + 40);
    if (v15) {
      unsigned __int16 v15 = (void *)v15[15];
    }
    id v16 = v15;
    uint64_t v17 = *(unsigned __int16 *)(a1 + 48);
    id v37 = 0;
    id v18 = [v16 insertFolderWithName:v7 icon:v17 identifier:v9 error:&v37];
    id v19 = v37;

    if (v19)
    {
      __int16 v20 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFDatabase(Collections) createFolderWithName:icon:error:]_block_invoke";
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s Failed to create folder in library: %@", buf, 0x16u);
      }
    }
    id v21 = *(void **)(a1 + 40);
    __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v9 objectType:2];
    [v21 addPendingInsertedDescriptor:v22];

    id v23 = *(void **)(a1 + 40);
    int v24 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:@"Root" objectType:2];
    [v23 addPendingUpdatedDescriptor:v24];

    int v25 = *(void **)(a1 + 40);
    if (v25) {
      id v26 = (void *)v25[15];
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;
    [v25 saveLibraryToDatabase:v27];
  }
  else
  {
    [(WFCoreDataCollection *)v12 setName:v7];
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4FB4A50]) initWithBackgroundColorValue:0 glyphCharacter:*(unsigned __int16 *)(a1 + 48) customImageData:0];
    [(WFCoreDataCollection *)v12 setWorkflowIcon:v28];

    id v29 = [v13 collections];
    int v30 = v29;
    if (!v29) {
      int v30 = objc_opt_new();
    }
    id v31 = [v30 orderedSetByAddingObject:v12];
    [v13 setCollections:v31];

    if (!v29) {
    uint64_t v32 = *(void **)(a1 + 40);
    }
    *(void *)long long buf = @"collections";
    long long v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:1];

    [v32 object:v13 didUpdateProperties:v33 error:a2];
    id v18 = [(WFCoreDataCollection *)v12 descriptor];
    uint64_t v34 = *(void **)(a1 + 40);
    *(void *)long long buf = @"identifier";
    *(void *)&uint8_t buf[8] = @"name";
    *(void *)&buf[16] = @"workflowIcon";
    id v19 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:buf count:3];
    for (uint64_t i = 16; i != -8; i -= 8)

    [v34 object:v12 didUpdateProperties:v19 error:a2];
  }

LABEL_26:
  return v18;
}

- (unint64_t)countOfWorkflowsInAFolder
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    if (self) {
      library = self->_library;
    }
    else {
      library = 0;
    }
    id v4 = library;
    id v5 = [(WFLibrary *)v4 folders];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v6)
    {
      unint64_t v29 = 0;
      uint64_t v7 = *(void *)v35;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(obj);
          }
          if (self) {
            id v9 = self->_library;
          }
          else {
            id v9 = 0;
          }
          id v10 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
          id v11 = v9;
          id v12 = [v10 identifier];
          id v33 = 0;
          id v13 = [(WFLibrary *)v11 shortcutsInFolderWithIdentifier:v12 error:&v33];
          id v14 = v33;
          uint64_t v15 = [v13 count];

          if (v14)
          {
            id v16 = getWFDatabaseLogObject();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              uint64_t v17 = [v10 identifier];
              *(_DWORD *)long long buf = 136315650;
              *(void *)&uint8_t buf[4] = "-[WFDatabase(Collections) countOfWorkflowsInAFolder]";
              *(_WORD *)&unsigned char buf[12] = 2114;
              *(void *)&buf[14] = v17;
              *(_WORD *)&unsigned char buf[22] = 2114;
              id v40 = v14;
              _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_FAULT, "%s Error fetching contents of folder with id %{public}@: %{public}@", buf, 0x20u);
            }
          }
          else
          {
            v29 += v15;
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
        uint64_t v6 = v18;
      }
      while (v18);
    }
    else
    {
      unint64_t v29 = 0;
    }
    __int16 v20 = obj;
    id v26 = obj;
  }
  else
  {
    id v19 = +[WFCoreDataWorkflow descriptorFetchRequest];
    __int16 v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(parents, $folder, ANY $folder.identifier == %@).@count == 0", @"Root"];
    id v21 = (void *)MEMORY[0x1E4F28BA0];
    __int16 v22 = [(WFDatabase *)self visiblePredicate];
    v38[0] = v22;
    v38[1] = v20;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    int v24 = [v21 andPredicateWithSubpredicates:v23];
    [v19 setPredicate:v24];

    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v40 = 0;
    int v25 = [(WFDatabase *)self context];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__WFDatabase_Collections__countOfWorkflowsInAFolder__block_invoke;
    void v30[3] = &unk_1E6558270;
    uint64_t v32 = buf;
    void v30[4] = self;
    id v26 = v19;
    id v31 = v26;
    [v25 performBlockAndWait:v30];

    unint64_t v29 = *(void *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }

  return v29;
}

void __52__WFDatabase_Collections__countOfWorkflowsInAFolder__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 countForFetchRequest:*(void *)(a1 + 40) error:0];
}

- (id)latestRunEvent
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__WFDatabase_RunEvents__latestRunEvent__block_invoke;
  v4[3] = &unk_1E6558628;
  v4[4] = self;
  id v2 = [(WFDatabase *)self performOperationWithReason:@"getting latest run event" block:v4 error:0];
  return v2;
}

id __39__WFDatabase_RunEvents__latestRunEvent__block_invoke(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[WFCoreDataRunEvent fetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [v4 setPredicate:v5];

  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  v13[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v4 setSortDescriptors:v7];

  [v4 setFetchLimit:1];
  uint64_t v8 = [*(id *)(a1 + 32) context];
  id v9 = [v8 executeFetchRequest:v4 error:a2];
  id v10 = [v9 firstObject];

  id v11 = [v10 descriptor];

  return v11;
}

- (id)triggerRunEventsInTheLastWeek
{
  id v3 = +[WFCoreDataRunEvent fetchRequest];
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [v4 dateByAddingUnit:16 value:-7 toDate:v5 options:0];

  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"trigger.identifier != nil && date > %@", v6];
  [v3 setPredicate:v7];

  uint64_t v8 = [[WFCoreDataDatabaseResult alloc] initWithDatabase:self fetchRequest:v3];
  return v8;
}

- (id)sortedRunEventsForTriggerID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[WFCoreDataRunEvent fetchRequest];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"trigger.identifier == %@", v4];

  [v5 setPredicate:v6];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setSortDescriptors:v8];

  id v9 = [[WFCoreDataDatabaseResult alloc] initWithDatabase:self fetchRequest:v5];
  return v9;
}

- (id)sortedRunEventsWithSource:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[WFCoreDataRunEvent fetchRequest];
  id v12 = objc_opt_new();
  if (v8)
  {
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source == %@", v8];
    [v12 addObject:v13];
  }
  if (v9)
  {
    id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"date >= %@", v9];
    [v12 addObject:v14];
  }
  if (v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"date <= %@", v10];
    [v12 addObject:v15];
  }
  if ([v12 count])
  {
    id v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
    [v11 setPredicate:v16];
  }
  uint64_t v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:0];
  v21[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v11 setSortDescriptors:v18];

  id v19 = [[WFCoreDataDatabaseResult alloc] initWithDatabase:self fetchRequest:v11];
  return v19;
}

- (id)sortedRunEventsWithSource:(id)a3
{
  return [(WFDatabase *)self sortedRunEventsWithSource:a3 startDate:0 endDate:0];
}

- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __48__WFDatabase_RunEvents__setOutcome_forRunEvent___block_invoke;
  v12[3] = &unk_1E6558600;
  void v12[4] = self;
  id v7 = v6;
  id v13 = v7;
  int64_t v14 = a3;
  id v11 = 0;
  [(WFDatabase *)self performTransactionWithReason:@"set run event outcome" block:v12 error:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v8 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      id v16 = "-[WFDatabase(RunEvents) setOutcome:forRunEvent:]";
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to set outcome for run event: %@", buf, 0x16u);
    }
  }
}

void __48__WFDatabase_RunEvents__setOutcome_forRunEvent___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  id v6 = [*(id *)(a1 + 40) identifier];
  id v7 = [v4 objectOfClass:v5 withIdentifier:v6 forKey:@"identifier" createIfNecessary:0 properties:0];

  if (v7)
  {
    [v7 setOutcome:*(unsigned int *)(a1 + 48)];
  }
  else
  {
    *a2 = [*(id *)(a1 + 32) missingErrorForDescriptor:*(void *)(a1 + 40)];
  }
}

- (id)logRunOfWorkflow:(id)a3 atDate:(id)a4 withIdentifier:(id)a5 source:(id)a6 triggerID:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  void v28[2] = __81__WFDatabase_RunEvents__logRunOfWorkflow_atDate_withIdentifier_source_triggerID___block_invoke;
  void v28[3] = &unk_1E65585D8;
  void v28[4] = self;
  id v17 = v13;
  id v29 = v17;
  id v18 = v14;
  id v30 = v18;
  id v19 = v15;
  id v31 = v19;
  id v20 = v12;
  id v32 = v20;
  id v21 = v16;
  id v33 = v21;
  id v27 = 0;
  __int16 v22 = [(WFDatabase *)self performSaveOperationWithReason:@"creating run event" block:v28 error:&v27];
  id v23 = v27;
  if (v23)
  {
    int v24 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = [v23 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      long long v35 = "-[WFDatabase(RunEvents) logRunOfWorkflow:atDate:withIdentifier:source:triggerID:]";
      __int16 v36 = 2112;
      long long v37 = v25;
      _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_ERROR, "%s Unable to log workflow run event: %@", buf, 0x16u);
    }
  }

  return v22;
}

id __81__WFDatabase_RunEvents__logRunOfWorkflow_atDate_withIdentifier_source_triggerID___block_invoke(uint64_t a1)
{
  id v2 = [WFCoreDataRunEvent alloc];
  id v3 = [*(id *)(a1 + 32) context];
  id v4 = [(WFCoreDataRunEvent *)v2 initWithContext:v3];

  [(WFCoreDataRunEvent *)v4 setDate:*(void *)(a1 + 40)];
  [(WFCoreDataRunEvent *)v4 setIdentifier:*(void *)(a1 + 48)];
  [(WFCoreDataRunEvent *)v4 setSource:*(void *)(a1 + 56)];
  uint64_t v5 = [*(id *)(a1 + 32) objectForDescriptor:*(void *)(a1 + 64) properties:MEMORY[0x1E4F1CBF0]];
  [(WFCoreDataRunEvent *)v4 setShortcut:v5];

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [(WFCoreDataRunEvent *)v4 shortcut];
  [v7 setLastRunEventDate:v6];

  id v8 = [(WFCoreDataRunEvent *)v4 shortcut];
  id v9 = [v8 source];
  if (([v9 isEqualToString:@"ShortcutSourceUnknown"] & 1) == 0
    && ([v9 isEqualToString:@"ShortcutSourceOnDevice"] & 1) == 0
    && ([v9 isEqualToString:@"ShortcutSourceGallery"] & 1) == 0
    && ([v9 isEqualToString:@"ShortcutSourceAddToSiri"] & 1) == 0
    && ([v9 isEqualToString:@"ShortcutSourceCloudLink"] & 1) == 0)
  {
    if ([v9 isEqualToString:@"ShortcutSourceDefaultShortcut"])
    {

      id v8 = [(WFCoreDataRunEvent *)v4 shortcut];
      [v8 setSource:@"ShortcutSourceActiveStarterShortcut"];
      goto LABEL_17;
    }
    if (([v9 isEqualToString:@"ShortcutSourceSiriTopLevelShortcut"] & 1) == 0
      && ([v9 isEqualToString:@"ShortcutSourceAutomatorMigration"] & 1) == 0
      && ([v9 isEqualToString:@"ShortcutSourceFilePublic"] & 1) == 0
      && ([v9 isEqualToString:@"ShortcutSourceFileKnownContacts"] & 1) == 0
      && ([v9 isEqualToString:@"ShortcutSourceFilePersonal"] & 1) == 0
      && ([v9 isEqualToString:@"ShortcutSourceEditorDocumentMenu"] & 1) == 0
      && ([v9 isEqualToString:@"ShortcutSourceAppShortcut"] & 1) == 0)
    {
      [v9 isEqualToString:@"ShortcutSourceActiveStarterShortcut"];
    }
  }

LABEL_17:
  if (*(void *)(a1 + 72))
  {
    id v10 = [*(id *)(a1 + 32) objectOfClass:objc_opt_class() withIdentifier:*(void *)(a1 + 72) forKey:@"identifier" createIfNecessary:0 properties:0];
    [(WFCoreDataRunEvent *)v4 setTrigger:v10];
  }
  id v11 = [(WFCoreDataRunEvent *)v4 descriptor];

  return v11;
}

- (id)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 date];
  id v13 = [MEMORY[0x1E4F29128] UUID];
  id v14 = [v13 UUIDString];
  id v15 = [(WFDatabase *)self logRunOfWorkflow:v11 atDate:v12 withIdentifier:v14 source:v10 triggerID:v9];

  return v15;
}

- (void)removeAllSerializedParametersForQueryName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __93__WFDatabase_PersistedSerializedParameters__removeAllSerializedParametersForQueryName_error___block_invoke;
  v8[3] = &unk_1E6558A40;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  [(WFDatabase *)self performTransactionWithReason:@"delete all serialized parameters for query" block:v8 error:a4];
}

void __93__WFDatabase_PersistedSerializedParameters__removeAllSerializedParametersForQueryName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = +[WFPersistedSerializedParameters fetchRequest];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"queryName", *(void *)(a1 + 32)];
  [v8 setPredicate:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
  id v6 = [*(id *)(a1 + 40) context];
  id v7 = (id)[v6 executeRequest:v5 error:a2];
}

- (void)storeSerializedParameters:(id)a3 forIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __111__WFDatabase_PersistedSerializedParameters__storeSerializedParameters_forIdentifier_queryName_badgeType_error___block_invoke;
  void v19[3] = &unk_1E6558A18;
  void v19[4] = self;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  unint64_t v23 = a6;
  id v15 = v14;
  id v16 = v12;
  id v17 = v13;
  id v18 = [(WFDatabase *)self performSaveOperationWithReason:@"save serialized parameters" block:v19 error:a7];
}

WFPersistedSerializedParameters *__111__WFDatabase_PersistedSerializedParameters__storeSerializedParameters_forIdentifier_queryName_badgeType_error___block_invoke(uint64_t a1)
{
  id v2 = [WFPersistedSerializedParameters alloc];
  id v3 = [*(id *)(a1 + 32) context];
  id v4 = [(WFPersistedSerializedParameters *)v2 initWithContext:v3];

  [(WFPersistedSerializedParameters *)v4 setIdentifier:*(void *)(a1 + 40)];
  [(WFPersistedSerializedParameters *)v4 setData:*(void *)(a1 + 48)];
  [(WFPersistedSerializedParameters *)v4 setQueryName:*(void *)(a1 + 56)];
  [(WFPersistedSerializedParameters *)v4 setBadgeType:*(unsigned int *)(a1 + 64)];
  return v4;
}

- (id)serializedParametersForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __85__WFDatabase_PersistedSerializedParameters__serializedParametersForIdentifier_error___block_invoke;
  v10[3] = &unk_1E65589F0;
  id v11 = v6;
  id v12 = self;
  id v7 = v6;
  id v8 = [(WFDatabase *)self performOperationWithReason:@"getting serialized parameters" block:v10 error:a4];

  return v8;
}

id __85__WFDatabase_PersistedSerializedParameters__serializedParametersForIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[WFPersistedSerializedParameters fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = [*(id *)(a1 + 40) context];
  id v7 = [v6 executeFetchRequest:v4 error:a2];
  id v8 = [v7 firstObject];

  id v9 = [v8 data];

  return v9;
}

- (id)badgeTypeForEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __80__WFDatabase_PersistedSerializedParameters__badgeTypeForEntityIdentifier_error___block_invoke;
  v10[3] = &unk_1E65589C8;
  id v11 = v6;
  id v12 = self;
  id v7 = v6;
  id v8 = [(WFDatabase *)self performOperationWithReason:@"getting entity badge" block:v10 error:a4];

  return v8;
}

id __80__WFDatabase_PersistedSerializedParameters__badgeTypeForEntityIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[WFPersistedSerializedParameters fetchRequest];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = [*(id *)(a1 + 40) context];
  id v7 = [v6 executeFetchRequest:v4 error:a2];
  id v8 = [v7 firstObject];

  id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "badgeType"));

  return v9;
}

@end