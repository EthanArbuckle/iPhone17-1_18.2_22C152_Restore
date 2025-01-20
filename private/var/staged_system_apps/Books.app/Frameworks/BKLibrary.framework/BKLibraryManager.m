@interface BKLibraryManager
+ (BOOL)hasAnySeriesStackBooksWithBasePredicate:(id)a3 forBook:(id)a4;
+ (BOOL)isDirectoryFileName:(id)a3;
+ (BOOL)isTestClass;
+ (id)_continueReadingPredicate;
+ (id)_continueReadingPredicateIncludingExplicitContent:(BOOL)a3;
+ (id)_dateComponentsForYear:(int64_t)a3;
+ (id)_predicateForAssetsWithContentTypes:(id)a3;
+ (id)_predicateForBooksShownInAllBooks;
+ (id)_previouslyReadPredicate;
+ (id)_recentlyEngagedPredicate;
+ (id)_recentlyReadPredicate;
+ (id)adjacentSeriesBooksWithMaxCount:(unint64_t)a3 withSmallerSeriesSortKeys:(BOOL)a4 basePredicate:(id)a5 forBook:(id)a6 includeAllBooksInSeries:(BOOL)a7;
+ (id)defaultManager;
+ (id)ephemeralSamplesPredicate;
+ (id)excludeAudiobooksPredicate;
+ (id)excludeCollectionMembersWithHiddenAssetsPredicate;
+ (id)excludeEphemeralAssetsPredicate;
+ (id)excludeHiddenAssetsPredicate;
+ (id)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 allowGeneric:(BOOL)a6 coverEffectsEnvironment:(id)a7 timeout:(double)a8;
+ (id)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 coverEffectsEnvironment:(id)a6;
+ (id)fetchImageForAssetID:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 coverEffectsEnvironment:(id)a6;
+ (id)fetchRequestForContinueReading;
+ (id)fetchRequestForPreviouslyRead;
+ (id)fetchRequestForRecentlyEngaged;
+ (id)fetchRequestForRecentlyRead;
+ (id)hiddenAssetsPredicate;
+ (id)keyPathsForValuesAffectingIsProcessing;
+ (id)libraryAssetsWithAssetIDsContainedInList:(id)a3 tempAssetIDs:(id)a4 inManagedObjectContext:(id)a5;
+ (id)managedObjectModelName;
+ (id)managerWithDataSources:(id)a3;
+ (id)migrationService;
+ (id)mostRecentlyOpenedSeriesBookWithBasePredicate:(id)a3 forBook:(id)a4;
+ (id)newestSeriesBookWithBasePredicate:(id)a3 forBook:(id)a4;
+ (id)persistentStoreNameSeed;
+ (id)persistentStoreURL;
+ (id)persistentStoreVersion;
+ (id)predicateForAllBooksExceptSeriesLibraryAssets;
+ (id)predicateForAllCollectionMembersExcludingSeriesLibraryAssets;
+ (id)predicateForAllOwnedAudiobooks;
+ (id)predicateForAllOwnedBooks;
+ (id)predicateForAllStoreLibraryAssets;
+ (id)predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets;
+ (id)predicateForAllUnownedLibraryAssets;
+ (id)predicateForAssetIDTaggedLibraryAsset:(id)a3;
+ (id)predicateForAssetIDsTaggedLibraryAssets:(id)a3;
+ (id)predicateForAssetIdentifierTaggedLibraryAsset:(id)a3;
+ (id)predicateForAssetsAvailableToAppIntentsWithTypes:(id)a3;
+ (id)predicateForAssetsInCollectionID:(id)a3 allowExplicit:(BOOL)a4;
+ (id)predicateForAssetsInCollectionID:(id)a3 allowExplicit:(BOOL)a4 includeSeriesItems:(BOOL)a5;
+ (id)predicateForAssetsWithLocalOrDownloadingLibraryAssets;
+ (id)predicateForAudiobooks;
+ (id)predicateForBooksShownInAllBooks;
+ (id)predicateForCollectionIDTaggedLibraryAssets:(id)a3;
+ (id)predicateForCollectionMembersInCollectionID:(id)a3 hideUnownedItems:(BOOL)a4;
+ (id)predicateForCollectionMembersInCollectionID:(id)a3 hideUnownedItems:(BOOL)a4 allowExplicit:(BOOL)a5;
+ (id)predicateForCollectionMembersMatchingSearchStringLibraryAssets:(id)a3;
+ (id)predicateForCollectionMembersWithInTheCloudLibraryAssets;
+ (id)predicateForCollectionMembersWithLocalAssets;
+ (id)predicateForCollectionMembersWithLocalOrDownloadingLibraryAssets;
+ (id)predicateForContainerLibraryAssets;
+ (id)predicateForContentType:(signed __int16)a3;
+ (id)predicateForContentTypes:(id)a3;
+ (id)predicateForContentWithHighWaterMarkOrReadingProgressValue:(double)a3;
+ (id)predicateForDownloadableStoreLibraryAssets;
+ (id)predicateForExcludingCollectionMembersWithContainerLibraryAssets;
+ (id)predicateForExcludingCollectionMembersWithSideloadedAssets;
+ (id)predicateForExcludingContainerLibraryAssets;
+ (id)predicateForExcludingUnownedAudiobookAssets;
+ (id)predicateForHighWaterMarkCapableLibraryAssets;
+ (id)predicateForInTheCloudLibraryAssets;
+ (id)predicateForLastOpenedDateAfter:(id)a3;
+ (id)predicateForLibraryAssetWithValidAssetID;
+ (id)predicateForLibraryAssetsMarkedAsNew;
+ (id)predicateForLibraryAssetsMissingExplicitContentFlag;
+ (id)predicateForLibraryAssetsNotMarkedAsOld;
+ (id)predicateForLibraryAssetsRecentlyOpened;
+ (id)predicateForLibraryAssetsWithoutCoverURL;
+ (id)predicateForLocalAssetsNeedingEpubIDUpdates;
+ (id)predicateForLocalAssetsNeedingEpubIDUpdatesFromAssetIDs:(id)a3;
+ (id)predicateForLocalAssetsNeedingFileSizeUpdates;
+ (id)predicateForLocalOrDownloadingLibraryAssets;
+ (id)predicateForLocalOrDownloadingLibraryAssetsIncludingSamples;
+ (id)predicateForLocalOrDownloadingOrImportingLibraryAssets;
+ (id)predicateForLocalOrDownloadingStoreAssets;
+ (id)predicateForMatchingSearchStringLibraryAssets:(id)a3;
+ (id)predicateForNextInSeriesLibraryAssets;
+ (id)predicateForNonEphemeralSamplesLibraryAssets;
+ (id)predicateForNonLocalAndNonDownloadingStoreAssets;
+ (id)predicateForNonPreorders;
+ (id)predicateForNotContentType:(signed __int16)a3;
+ (id)predicateForNotContentTypes:(id)a3;
+ (id)predicateForNotSamplesLibraryAssets;
+ (id)predicateForOwnedSingleAssetSeries;
+ (id)predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:(id)a3;
+ (id)predicateForPersonalizationAffinityAssets;
+ (id)predicateForPurchasedLibraryAssets;
+ (id)predicateForSeriesItemsWithSeriesIDs:(id)a3;
+ (id)predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:(id)a3;
+ (id)predicateForSupplementalContentLibraryAssetsWithStorePlaylistIDs:(id)a3;
+ (id)predicateForTemporaryAssetIDTaggedLibraryAsset:(id)a3;
+ (id)predicateForTemporaryAssetIDsTaggedLibraryAssets:(id)a3;
+ (id)predicateForUnownedSeriesLibraryAssets;
+ (id)predicateForUnownedStoreLibraryAssets;
+ (id)predicateFor_All_Finished_LibraryAssets;
+ (id)predicateFor_All_Finished_LibraryAssetsAllowsExplicit:(BOOL)a3;
+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets;
+ (id)predicateFor_All_Marked_As_Finished_LibraryAssetsAllowsExplicit:(BOOL)a3;
+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_After_Year:(int64_t)a3;
+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_In_Year:(int64_t)a3;
+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_Prior_To_Year:(int64_t)a3;
+ (id)predicateToExcludeAssetsForSeriesAndStoreItems;
+ (id)predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections;
+ (id)predicateToExcludeAssetsForUnpurchasedItemsInCollection:(id)a3;
+ (id)predicateToExcludeAssetsInASeriesContainerWithOwnedBooks;
+ (id)predicateToExcludeAssetsWithExplicitContent;
+ (id)predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks;
+ (id)predicateToExcludeAudiobookSupplementalContent;
+ (id)predicateToExcludeCollectionMembersForAudiobookSupplementalContent;
+ (id)predicateToExcludeCollectionMembersForSeriesAndStoreItems;
+ (id)predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections;
+ (id)predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection:(id)a3;
+ (id)predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks;
+ (id)predicateToExcludeCollectionMembersWithExplicitContent;
+ (id)predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks;
+ (id)predicateToExcludeCollectionMembersWithUnownedLibraryAssets;
+ (id)predicateToExcludeLibraryAssetsAndAssetsInSeriesContainersWithExplicitContent;
+ (id)predicateToExcludeLibraryAssetsAndContainersWithExplicitContent;
+ (id)predicateToExcludeLibraryAssetsWithExplicitContent;
+ (id)predicateToExcludeSeriesLibraryAssets;
+ (id)predicateToExcludeUnownedLibraryAssets;
+ (id)queryStringForSearchString:(id)a3 attributes:(id)a4;
+ (id)sampleDataSourceIdentifier;
+ (id)searchFetchRequestWithText:(id)a3 entityType:(int64_t)a4;
+ (id)seriesStackBooksForBook:(id)a3;
+ (id)stringByEscapingSearchString:(id)a3;
+ (unint64_t)numberOfLibraryAssetsInManagdObjectContext:(id)a3;
+ (unsigned)processingOptionsFor:(id)a3 coverEffectsEnvironment:(id)a4;
+ (void)_fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 allowGeneric:(BOOL)a7 coverEffectsEnvironment:(id)a8 completion:(id)a9;
+ (void)deleteCloudDataWithCompletion:(id)a3;
+ (void)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 coverEffectsEnvironment:(id)a7 completion:(id)a8;
+ (void)fetchImageForAssetID:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 coverEffectsEnvironment:(id)a7 completion:(id)a8;
+ (void)fetchImageShadowForAsset:(id)a3 size:(CGSize)a4 completion:(id)a5;
+ (void)fetchImageShadowForAssetID:(id)a3 size:(CGSize)a4 completion:(id)a5;
+ (void)initialize;
- ($3F30F48CCF81742A7D163F96C13F4EE1)cacheManager:(SEL)a3 bookCoverInfoForIdentifier:(id)a4;
- (BCManagedObjectIDMonitor)dataSourceIdentifierAndStateMonitor;
- (BCManagedObjectIDMonitor)dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs;
- (BKLibraryAssetDetailsManager)assetDetailsManager;
- (BKLibraryCollectionManager)collectionManager;
- (BKLibraryDelegateProtocol)delegate;
- (BKLibraryImageSource)imageSource;
- (BKLibraryManagedObjectContext)collectionsWorkerChildContext;
- (BKLibraryManagedObjectContext)readOnlyChildContext;
- (BKLibraryManagedObjectContext)uiChildContext;
- (BKLibraryManagedObjectContext)usq_moc;
- (BKLibraryManagedObjectContext)workerChildContext;
- (BKLibraryManager)init;
- (BKLibraryManager)initWithPersistentStoreURL:(id)a3 bdsPriceTracker:(id)a4;
- (BKLibraryPriceManager)priceManager;
- (BKLibraryPriceTracker)priceTracker;
- (BKSeriesManager)seriesManager;
- (BOOL)_shouldPropagateNilAssetIDForDataSourceWithIdentifier:(id)a3;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)collectionsDirty;
- (BOOL)didMigrateFromITunesSyncToICloudSync;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)hasBooks;
- (BOOL)hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks;
- (BOOL)isDownloadableFromLibraryAsset:(id)a3;
- (BOOL)isExplicitMaterialAllowed;
- (BOOL)isFamilyPurchaseWithFamilyID:(id)a3 purchaserDSID:(id)a4 downloaderDSID:(id)a5;
- (BOOL)isProcessing;
- (BOOL)isReloading;
- (BOOL)migratedPropertiesChanged;
- (BOOL)needsDuplicateCollectionMembersRemoved;
- (BOOL)needsMigration;
- (BOOL)needsResetNilAuthorsOnAllBooks;
- (BOOL)needsResetNilAuthorsOnAllSeries;
- (BOOL)needsResetSeriesStacksAndCollectionMembershipOnAllBooks;
- (BOOL)processingAuthentication;
- (BOOL)resetSeriesOnAllBooks;
- (BOOL)usePerformancePredicates;
- (BUCoalescingCallBlock)coalescedLibraryReload;
- (IMManagedObjectContextReadOnlyPool)backgroundReadOnlyContextPool;
- (NSArray)dataSources;
- (NSDate)mostRecentPurchaseDate;
- (NSDictionary)_persistentStoreOptions;
- (NSDictionary)dataSourcesByIdentifier;
- (NSMutableDictionary)assetUpdatesByIdentifier;
- (NSMutableDictionary)coalescedDataSourceReloadByIdentifier;
- (NSMutableDictionary)migratedSortOrderData;
- (NSMutableDictionary)migratedSortOrderDataByPluginAssetID;
- (NSMutableDictionary)notifyBlocksForNewAssets;
- (NSMutableDictionary)ownershipObservers;
- (NSMutableSet)identifiersForAssetsNeedingReconcile;
- (NSMutableSet)unclaimedAssetIDs;
- (NSMutableSet)unclaimedTemporaryAssetIDs;
- (NSOperationQueue)imageSourceOperationQueue;
- (NSOperationQueue)imageSourceScalingOperationQueue;
- (NSPersistentStore)ui_persistentStore;
- (NSPersistentStoreCoordinator)ui_persistentStoreCoordinator;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)coalescedDataSourceReloadByIdentifierSync;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)dqSyncQueue;
- (OS_dispatch_queue)migrationDispatchQueue;
- (OS_dispatch_queue)ownershipSync;
- (OS_dispatch_queue)updatesScheduleQueue;
- (id)_assetIDsForCollectionID:(id)a3 moc:(id)a4;
- (id)_booksWithPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5 error:(id *)a6;
- (id)_dataSourceMatchingPredicate:(id)a3;
- (id)_dataSourcesMatchingPredicate:(id)a3;
- (id)_fetchLibraryAssetsWithTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5;
- (id)_predicateForBooksInSeriesWithCorrectAuthorInfo:(id)a3;
- (id)_predicateForBooksInSeriesWithCorrectSortAuthorInfo:(id)a3;
- (id)_predicateForSearchText:(id)a3;
- (id)_rawSeriesAuthorForContainerID:(id)a3 context:(id)a4;
- (id)_rawSeriesSortAuthorForContainerID:(id)a3 context:(id)a4;
- (id)_removeDupesByAssetID:(id)a3 inMoc:(id)a4;
- (id)_spotlightAssetsWithContentTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5;
- (id)_updateLibraryAssetWithID:(id)a3 withLastOpenDate:(id)a4 withMoc:(id)a5;
- (id)_updateMostRecentPurchaseDateCacheFromDataSources;
- (id)appIntentsLibraryAssetsWithTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5;
- (id)assetIDForAssetAtURLOnMainThread:(id)a3;
- (id)assetIDsInDataSourceWithIdentifier:(id)a3 intersectingWithAssetIDs:(id)a4;
- (id)assetIDsOfStoreAssetsWithPredicate:(id)a3;
- (id)assetIDsOfStoreAudiobookAssets;
- (id)assetIDsOfStoreBookAssets;
- (id)bookDescriptionForAssetID:(id)a3;
- (id)cloudSyncVersionsForDataType:(id)a3 inContext:(id)a4;
- (id)collectionsCloudGeneration;
- (id)contentPredicateForSeriesID:(id)a3 onlyPurchased:(BOOL)a4 forceCloud:(BOOL)a5;
- (id)contentPredicateForSeriesID:(id)a3 onlyPurchased:(BOOL)a4 forceCloud:(BOOL)a5 allowsExplicit:(BOOL)a6;
- (id)copyNextCollectionSortKey:(id)a3;
- (id)dataSourceConformingToProtocol:(id)a3;
- (id)dataSourceWithIdentifier:(id)a3;
- (id)dataSourcesConformingToProtocol:(id)a3;
- (id)dq_assetsToReconcile;
- (id)dragInfoFromLibraryAsset:(id)a3;
- (id)entityName;
- (id)existingAssetIDsFromAssetIDs:(id)a3;
- (id)fetchMigratedProperties:(id)a3 deleteFoundAssets:(BOOL)a4;
- (id)insertNewLibraryAssetWithIdentifier:(id)a3 assetID:(id)a4 orTemporaryAssetID:(id)a5 type:(signed __int16)a6 inManagedObjectContext:(id)a7;
- (id)jaliscoStatusCloudGeneration;
- (id)libraryAssetOnMainQueueWithAssetID:(id)a3;
- (id)libraryAssetOnMainQueueWithAssetIdentifier:(id)a3;
- (id)libraryAssetOnMainQueueWithEpubID:(id)a3;
- (id)libraryAssetOnMainQueueWithFilename:(id)a3;
- (id)libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:(id)a3;
- (id)libraryAssetOnMainQueueWithStoreID:(id)a3;
- (id)libraryAssetWithAssetID:(id)a3 inManagedObjectContext:(id)a4;
- (id)libraryAssetWithAssetIdentifier:(id)a3 inManagedObjectContext:(id)a4;
- (id)libraryAssetWithPermanentOrTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4;
- (id)libraryAssetWithTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4;
- (id)libraryAssetsAsDictionaryWithProperties:(id)a3;
- (id)libraryAssetsWithAssetIDs:(id)a3 inManagedObjectContext:(id)a4;
- (id)libraryAssetsWithAssetIDsContainedInList:(id)a3 tempAssetIDs:(id)a4 inManagedObjectContext:(id)a5;
- (id)libraryMutableAssetWithAssetID:(id)a3 inManagedObjectContext:(id)a4;
- (id)libraryMutableAssetWithAssetIdentifier:(id)a3 inManagedObjectContext:(id)a4;
- (id)libraryMutableAssetWithPermanentOrTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4;
- (id)localNonSampleLibraryAssetStoreSummaries;
- (id)localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks:(BOOL)a3;
- (id)localSeriesBooksForSeriesID:(id)a3 context:(id)a4;
- (id)metadataForAssetAtURL:(id)a3 needsCoordination:(BOOL)a4;
- (id)migrationCachePath;
- (id)migrationMoc;
- (id)migrationOldDatabaseFolderPath;
- (id)mostRecentlyEngagedLibraryAssetWithTypes:(id)a3 inManagedObjectContext:(id)a4;
- (id)mostRecentlyEngagedLibraryAssetsWithTypes:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5;
- (id)mostRecentlyOpenedBooks:(unint64_t)a3 inManagedObjectContext:(id)a4;
- (id)mostRecentlyOpenedLibraryAssetWithTypes:(id)a3 inManagedObjectContext:(id)a4;
- (id)mostRecentlyOpenedLibraryAssetsWithTypes:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5;
- (id)newManagedObjectContext;
- (id)newManagedObjectContextWithClass:(Class)a3;
- (id)newPrivateQueueManagedObjectContext;
- (id)p_libraryAssetWithIdentifier:(id)a3 predicate:(id)a4 inManagedObjectContext:(id)a5;
- (id)pageProgressionDirectionForAssetAtURLOnMainThread:(id)a3;
- (id)predicateForAllBooksWithSeriesID:(id)a3;
- (id)predicateForAllBooksWithSeriesID:(id)a3 forcefullyIncludePurchasedBooks:(BOOL)a4;
- (id)predicateForAssetIDsTaggedLibraryAssets:(id)a3;
- (id)predicateForContainerLibraryAssets;
- (id)predicateForContainerWithSeriesIDLibraryAsset:(id)a3;
- (id)predicateForDataSourceIdentifierTaggedLibraryAssets:(id)a3;
- (id)predicateForDownloadingStoreCollectionMembers;
- (id)predicateForDownloadingStoreLibraryAssets;
- (id)predicateForExcludingContainerLibraryAssets;
- (id)predicateForHighWaterMarkCapableLibraryAssets;
- (id)predicateForIndexing;
- (id)predicateForLibraryAssetsWithSeriesID:(id)a3;
- (id)predicateForLocalBooksWithSeriesID:(id)a3;
- (id)predicateForLocalLibraryAssets;
- (id)predicateForLocalStoreAssets;
- (id)predicateForMatchingSearchStringLibraryAssets:(id)a3;
- (id)predicateForMostRecentBooksOpened;
- (id)predicateForPurchasedBooksAssets;
- (id)predicateForSamples;
- (id)predicateForSearchableLibraryAssets;
- (id)predicateForSeriesBooksIncludingNextForID:(id)a3 includeAllBooksInSeries:(BOOL)a4;
- (id)predicateForUnownedSeriesLibraryAssets;
- (id)predicateFor_AllAudioBooks_LibraryAssets;
- (id)predicateFor_AllBooks_LibraryAssets;
- (id)predicateFor_All_Downloaded_LibraryAssets;
- (id)predicateFor_All_PDFs_LibraryAssets;
- (id)predicateToExcludeUnownedLibraryAssets;
- (id)seriesAuthorForContainerID:(id)a3 context:(id)a4;
- (id)seriesBooksForSeriesID:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesContainerForSeriesID:(id)a3 inManagedObjectContext:(id)a4;
- (id)seriesTitleForAssetID:(id)a3;
- (id)sortDescriptorsForMode:(unint64_t)a3 collectionID:(id)a4;
- (id)storeAssetIDsOfCollectionMembersWithLimit:(int64_t)a3 collectionID:(id)a4 inMoc:(id)a5;
- (id)storeAssetIDsOfFinishedCollectionWithLimit:(int64_t)a3 inMoc:(id)a4;
- (id)storeAssetIDsOfSamplesCollectionWithLimit:(int64_t)a3 inMoc:(id)a4;
- (id)storeAssetIDsOfWantToReadWithLimit:(int64_t)a3 inMoc:(id)a4;
- (id)storeIDsForDownloadingBooks;
- (id)storeIDsOfStoreAssetsWithPredicate:(id)a3;
- (id)validLibraryAssetIDsOnMainQueueWithAssetIDs:(id)a3;
- (id)wq_seriesIDsToResetWithLibraryManagedObjectContext:(id)a3;
- (int64_t)_compareVersionWith:(id)a3;
- (os_unfair_lock_s)notifyLockForNewAssets;
- (unint64_t)countOfBooksInSeriesRelativeToBook:(id)a3 includeAllBooksInSeries:(BOOL)a4 relation:(int)a5;
- (unint64_t)countOfPurchasedBooks;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)wq_countOfBooksInContinueReadingIncludingExplicitContent:(BOOL)a3 limit:(unint64_t)a4 onWorkerQueue:(id)a5;
- (void)_addBitmask:(unint64_t)a3 toUpdate:(id)a4 inMethod:(SEL)a5;
- (void)_addDataSourceIdentifierAndStateObserver:(id)a3;
- (void)_cleanUpOrphanedSampleAssets:(id)a3;
- (void)_enumerateDataSources:(id)a3 intersectingWithAssetIDs:(id)a4 usingBlock:(id)a5;
- (void)_libraryDataSource:(id)a3 addedAssets:(id)a4;
- (void)_libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5;
- (void)_libraryDataSource:(id)a3 updatedAssets:(id)a4;
- (void)_migrateFromOldDatabase;
- (void)_newAssetIDAdded:(id)a3;
- (void)_notifyDataSourceIdentifierAndStateObserversForAssetIDs:(id)a3;
- (void)_notifyLibraryOperationDone:(unint64_t)a3 assetIDs:(id)a4;
- (void)_performInitialDataBaseMaintenance;
- (void)_performReload;
- (void)_performReloadDataSource:(id)a3 completion:(id)a4;
- (void)_persistentStoreDidMigrate;
- (void)_readLibraryVesionInfo;
- (void)_reloadDataSource:(id)a3 completion:(id)a4;
- (void)_reloadWithCompletion:(id)a3;
- (void)_removeAllMembersFromCollection:(id)a3 moc:(id)a4;
- (void)_removeBitmask:(unint64_t)a3 fromUpdate:(id)a4 inMethod:(SEL)a5;
- (void)_removeDataSourceIdentifierAndStateObserver:(id)a3;
- (void)_removeDupesByTemporaryAssetID:(id)a3 inMoc:(id)a4;
- (void)_removeDuplicateCollectionMembers;
- (void)_removePossibleDupes:(id)a3 inMoc:(id)a4;
- (void)_resetAuthorsAndStacksInContext:(id)a3;
- (void)_resetNilAuthorsOnAllBooksInContext:(id)a3;
- (void)_resetNilAuthorsOnAllSeriesInContext:(id)a3;
- (void)_resetSeriesIDs:(id)a3;
- (void)_scheduleOperationGroupWithName:(id)a3 block:(id)a4;
- (void)_setupCoreDataStack;
- (void)_setupUICoreDataStack;
- (void)_sortAndInitializeDataSources:(id)a3;
- (void)_sortUserCollectionToTop:(id)a3 moc:(id)a4;
- (void)_updateAuthorForSeriesContainer:(id)a3;
- (void)_updateProcessingAuthenticationStateDeferred;
- (void)_updateProcessingAuthenticationStateImmediate;
- (void)_updateRelationshipsInContext:(id)a3;
- (void)addCustomOperationBlock:(id)a3;
- (void)adoptMigratedProperties:(id)a3;
- (void)allUnownedIDs:(id)a3;
- (void)allUnownedStoreAssetIDs:(id)a3;
- (void)applyPendingUpdateForAssetID:(id)a3 completion:(id)a4;
- (void)archiveTransientProperties:(id)a3;
- (void)assetAccountIdentifiersForAsset:(id)a3 completion:(id)a4;
- (void)assetAccountIdentifiersForAssetID:(id)a3 path:(id)a4 storeID:(id)a5 purchasedDSID:(id)a6 downloadedDSID:(id)a7 familyID:(id)a8 dataSourceID:(id)a9 completion:(id)a10;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)assetIDsOfPurchasedStoreAssets:(id)a3;
- (void)assetPartsForLibraryAsset:(id)a3 completion:(id)a4;
- (void)beginAuthentication:(id)a3;
- (void)bootstrapSamplesCollectionIfNeeded;
- (void)cacheManager:(id)a3 explicitIdentifiersWithCompletion:(id)a4;
- (void)cancelDownloadingAsset:(id)a3;
- (void)checkDatabaseIntegrity;
- (void)checkNonSeriesAudiobooksWithManagedObjectContext:(id)a3;
- (void)checkOwnedSingleBookSeriesWithManagedObjectContext:(id)a3;
- (void)cleanupDateFinished;
- (void)cleanupDefaultCollections;
- (void)clearAgingDocumentInbox;
- (void)clearMostRecentPurchaseDateCache;
- (void)collectionManagerDidModifyWantToReadCollection:(id)a3;
- (void)collectionsWorkerManagedObjectContextDidSaveNotification:(id)a3;
- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 finished:(unint64_t *)a5 context:(id)a6;
- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 markedFinished:(unint64_t *)a5 context:(id)a6;
- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 purchased:(unint64_t *)a5 context:(id)a6;
- (void)createSeriesUpdaterMoc;
- (void)dealloc;
- (void)deleteAssetIDs:(id)a3;
- (void)deleteAssetIDs:(id)a3 exhaustive:(BOOL)a4;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)didCloseLibraryAsset:(id)a3;
- (void)didHidePurchasedAssetID:(id)a3;
- (void)dq_libraryDataSource:(id)a3 reconcileAssets:(id)a4 reason:(signed __int16)a5;
- (void)dq_sync:(id)a3;
- (void)dq_unclaimAllLibraryAssetsWithContext:(id)a3;
- (void)dq_unclaimIdentifiers:(id)a3 forDataSourceBitmask:(unint64_t)a4;
- (void)earliestPurchaseTimestampWithCompletion:(id)a3;
- (void)fetchLibraryAssetFromAssetID:(id)a3 handler:(id)a4;
- (void)fetchLibraryAssetFromStoreID:(id)a3 handler:(id)a4;
- (void)fetchLibraryAssetsFromAssetIDs:(id)a3 handler:(id)a4;
- (void)fetchLibraryAssetsFromStoreIDs:(id)a3 handler:(id)a4;
- (void)finalizeAuthentication:(id)a3;
- (void)hiddenAssetStoreIDsWithCompletion:(id)a3;
- (void)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (void)initializeMostRecentPurchaseDateCacheIfNeeded;
- (void)isTrackedAsRecent:(id)a3 completion:(id)a4;
- (void)libraryDataSource:(id)a3 addedAsset:(id)a4;
- (void)libraryDataSource:(id)a3 addedAsset:(id)a4 inGroup:(id)a5;
- (void)libraryDataSource:(id)a3 addedAssets:(id)a4;
- (void)libraryDataSource:(id)a3 addedAssets:(id)a4 inGroup:(id)a5;
- (void)libraryDataSource:(id)a3 notifyBlock:(id)a4 inGroup:(id)a5;
- (void)libraryDataSource:(id)a3 reloadInGroup:(id)a4;
- (void)libraryDataSource:(id)a3 removeImagesForAsset:(id)a4;
- (void)libraryDataSource:(id)a3 removedAsset:(id)a4;
- (void)libraryDataSource:(id)a3 removedAsset:(id)a4 inGroup:(id)a5;
- (void)libraryDataSource:(id)a3 removedAssets:(id)a4;
- (void)libraryDataSource:(id)a3 removedAssets:(id)a4 inGroup:(id)a5;
- (void)libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5;
- (void)libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5 inGroup:(id)a6;
- (void)libraryDataSource:(id)a3 updateWithName:(id)a4 block:(id)a5;
- (void)libraryDataSource:(id)a3 updatedAsset:(id)a4;
- (void)libraryDataSource:(id)a3 updatedAsset:(id)a4 inGroup:(id)a5;
- (void)libraryDataSource:(id)a3 updatedAssets:(id)a4;
- (void)libraryDataSource:(id)a3 updatedAssets:(id)a4 inGroup:(id)a5;
- (void)loadCachedMigrationData;
- (void)logCounts;
- (void)managedBooksDidChange;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)migrateCollections:(id)a3 context:(id)a4;
- (void)migrateDataSources:(id)a3;
- (void)migrateLibraryIfNeeded;
- (void)migrateMetaData:(id)a3;
- (void)migratePurgeOldDatabases;
- (void)migrateSortOrderKeys:(id)a3;
- (void)migrateToMyBooksWithAssetIDs:(id)a3 inManagedObjectContext:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)otherManagedObjectContextDidSaveNotification:(id)a3;
- (void)p_deleteAssets:(id)a3;
- (void)p_deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)performBackgroundReadOnlyBlock:(id)a3;
- (void)performBackgroundReadOnlyBlockAndWait:(id)a3;
- (void)performBlockInUIContext:(id)a3;
- (void)performBlockInUIContext:(id)a3 completion:(id)a4;
- (void)performBlockOnCollectionsWorkerQueue:(id)a3;
- (void)performBlockOnCollectionsWorkerQueueAndWait:(id)a3;
- (void)performBlockOnWorkerQueue:(id)a3;
- (void)performBlockOnWorkerQueueAndWait:(id)a3;
- (void)performNamed:(id)a3 workerQueueBlock:(id)a4;
- (void)performNamed:(id)a3 workerQueueBlockAndWait:(id)a4;
- (void)prioritizeImport:(id)a3 completion:(id)a4;
- (void)purgeRecentBooks:(id)a3 completion:(id)a4;
- (void)purgeRecentsListFromAllBooksOlderThanDate:(id)a3;
- (void)q_removeOldMigrationData;
- (void)queryRootFolderShorthandsWithRegistrationBlock:(id)a3;
- (void)rawBookCoverForLibraryAsset:(id)a3 completion:(id)a4;
- (void)readingTimeTracker:(id)a3 cleanupBooksFinishedBefore:(id)a4 completion:(id)a5;
- (void)readingTimeTracker:(id)a3 cleanupFinishedBooksExcluding:(id)a4 completion:(id)a5;
- (void)readingTimeTracker:(id)a3 isAssetTrackedAsRecent:(id)a4 completion:(id)a5;
- (void)readingTimeTracker:(id)a3 updateRecentBook:(id)a4 promoteIfNotTracked:(BOOL)a5 completion:(id)a6;
- (void)readingTimeTrackerHasRecentAssets:(id)a3 completion:(id)a4;
- (void)recentsNotEngagedSinceDateForSamples:(id)a3 dateForNonSamples:(id)a4 completion:(id)a5;
- (void)refreshFamily;
- (void)reloadDataSource:(id)a3 completion:(id)a4;
- (void)reloadWithCompletion:(id)a3;
- (void)resetCover:(id)a3;
- (void)resetNextCollectionSort;
- (void)resolveLibraryAsset:(id)a3 completion:(id)a4;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)resolveToLocalAssetWithAssetID:(id)a3 completion:(id)a4;
- (void)saveCachedMigrationData;
- (void)seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:(id)a3 limit:(unint64_t)a4;
- (void)seriesUpdaterMocObjectsDidChange:(id)a3;
- (void)seriesUpdaterResetWithIDs:(id)a3;
- (void)setAssetDetailsManager:(id)a3;
- (void)setAssetUpdatesByIdentifier:(id)a3;
- (void)setBackgroundReadOnlyContextPool:(id)a3;
- (void)setCloudStateOnAssetWithID:(id)a3;
- (void)setCoalescedDataSourceReloadByIdentifier:(id)a3;
- (void)setCoalescedDataSourceReloadByIdentifierSync:(id)a3;
- (void)setCoalescedLibraryReload:(id)a3;
- (void)setCollectionManager:(id)a3;
- (void)setCollectionsCloudGeneration:(id)a3;
- (void)setCollectionsDirty:(BOOL)a3;
- (void)setCollectionsWorkerChildContext:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDataSourceIdentifierAndStateMonitor:(id)a3;
- (void)setDataSourceIdentifierAndStateMonitorForTemporaryAssetIDs:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setDataSourcesByIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidMigrateFromITunesSyncToICloudSync:(BOOL)a3;
- (void)setDqSyncQueue:(id)a3;
- (void)setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks:(BOOL)a3;
- (void)setIdentifiersForAssetsNeedingReconcile:(id)a3;
- (void)setImageSource:(id)a3;
- (void)setImageSourceOperationQueue:(id)a3;
- (void)setImageSourceScalingOperationQueue:(id)a3;
- (void)setJaliscoStatusCloudGeneration:(id)a3;
- (void)setMigratedPropertiesChanged:(BOOL)a3;
- (void)setMigratedSortOrderData:(id)a3;
- (void)setMigratedSortOrderDataByPluginAssetID:(id)a3;
- (void)setMigrationDispatchQueue:(id)a3;
- (void)setNeedsDuplicateCollectionMembersRemoved:(BOOL)a3;
- (void)setNeedsMigration:(BOOL)a3;
- (void)setNeedsResetNilAuthorsOnAllBooks:(BOOL)a3;
- (void)setNeedsResetNilAuthorsOnAllSeries:(BOOL)a3;
- (void)setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:(BOOL)a3;
- (void)setNotifyBlocksForNewAssets:(id)a3;
- (void)setNotifyLockForNewAssets:(os_unfair_lock_s)a3;
- (void)setOwnershipObservers:(id)a3;
- (void)setOwnershipSync:(id)a3;
- (void)setPriceManager:(id)a3;
- (void)setProcessingAuthentication:(BOOL)a3;
- (void)setReloading:(BOOL)a3;
- (void)setResetSeriesOnAllBooks:(BOOL)a3;
- (void)setUIManagerProviderForAddingToWantToReadBlock:(id)a3;
- (void)setUnclaimedAssetIDs:(id)a3;
- (void)setUnclaimedTemporaryAssetIDs:(id)a3;
- (void)setUpdatesScheduleQueue:(id)a3;
- (void)setUsePerformancePredicates:(BOOL)a3;
- (void)setUsq_moc:(id)a3;
- (void)setWorkerChildContext:(id)a3;
- (void)storeAssetIDsOfWantToReadWithLimit:(int64_t)a3 completion:(id)a4;
- (void)tearDownPersistentStores;
- (void)toggleDownloadPausedForAsset:(id)a3;
- (void)triggerCloudSync:(BOOL)a3;
- (void)uiManagedObjectContextDidSaveNotification:(id)a3;
- (void)updateAsset:(id)a3 coverArt:(id)a4 completion:(id)a5;
- (void)updateAsset:(id)a3 fromURL:(id)a4 completion:(id)a5;
- (void)updateAssetWithID:(id)a3 url:(id)a4;
- (void)updateCloudVersionFromCloudSyncVersions:(id)a3 inContext:(id)a4;
- (void)updateIsDownloadingSupplementalContentAndCombinedState:(id)a3;
- (void)updateLibraryAssetWithID:(id)a3 isEphemeral:(BOOL)a4 completion:(id)a5;
- (void)updateLibraryAssetWithID:(id)a3 withLastOpenDate:(id)a4 completion:(id)a5;
- (void)updateLibraryAssetWithID:(id)a3 withTitle:(id)a4;
- (void)updateMostRecentPurchaseDateCacheFromLibrary;
- (void)updateSeriesContainerSeriesStackAssetIDs:(id)a3;
- (void)updateSeriesRelationshipsForSeriesAsset:(id)a3;
- (void)updateSeriesRelationshipsForSeriesContainer:(id)a3;
- (void)updateSupplementalContentRelationship:(id)a3;
- (void)updateURL:(id)a3 completion:(id)a4;
- (void)waitForAssetID:(id)a3 completion:(id)a4;
- (void)waitForAssetToFinishDownloadWithAssetID:(id)a3 completion:(id)a4;
- (void)waitForAssetToFinishDownloadWithAssetID:(id)a3 resolveAsset:(BOOL)a4 completion:(id)a5;
- (void)workerManagedObjectContextDidSaveNotification:(id)a3;
- (void)wq_dq_integrateClaimedAssetsReason:(signed __int16)a3 context:(id)a4;
- (void)wq_dq_saveDatabaseContext:(id)a3;
- (void)wq_reconcileDataSourceAssetsForReason:(signed __int16)a3 context:(id)a4;
- (void)wq_seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:(id)a3 limit:(unint64_t)a4 onWorkerQueue:(id)a5;
@end

@implementation BKLibraryManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    [v2 registerDefaults:&off_D9DE0];
  }
}

+ (id)defaultManager
{
  if (!qword_EE5A0)
  {
    id v2 = BKLibraryLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_8F624();
    }

    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v3 = getpid();
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2020000000;
      v4 = (void (*)(uint64_t, uint64_t, const __CFString *))off_EE5C8;
      v12 = off_EE5C8;
      if (!off_EE5C8)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_3D110;
        v8[3] = &unk_D17A0;
        v8[4] = &v9;
        sub_3D110((uint64_t)v8);
        v4 = (void (*)(uint64_t, uint64_t, const __CFString *))v10[3];
      }
      _Block_object_dispose(&v9, 8);
      if (!v4)
      {
        v7 = (_Unwind_Exception *)sub_8F600();
        _Block_object_dispose(&v9, 8);
        _Unwind_Resume(v7);
      }
      v4(v3, 3135106305, @"managerWithDataSources: initializer not called!");
    }
  }
  v5 = (void *)qword_EE5A0;

  return v5;
}

+ (id)managerWithDataSources:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_83F4;
  block[3] = &unk_D1520;
  id v8 = a3;
  uint64_t v3 = qword_EE5A8;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_EE5A8, block);
  }
  id v5 = (id)qword_EE5A0;

  return v5;
}

- (void)initializeMostRecentPurchaseDateCacheIfNeeded
{
  objc_opt_class();
  id v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"BKMostRecentPurchaseDateKey"];
  id v4 = BUDynamicCast();

  if (!v4)
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    v6 = +[NSDate distantPast];
    [v5 setObject:v6 forKey:@"BKMostRecentPurchaseDateKey"];

    v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "MRP: initialized cached mrp", v8, 2u);
    }
  }
}

- (void)clearMostRecentPurchaseDateCache
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = +[NSDate distantPast];
  [v2 setObject:v3 forKey:@"BKMostRecentPurchaseDateKey"];

  id v4 = BKLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "MRP: cleared cached mrp", v5, 2u);
  }
}

- (id)_updateMostRecentPurchaseDateCacheFromDataSources
{
  id obj = [(BKLibraryManager *)self dataSources];
  objc_sync_enter(obj);
  uint64_t v3 = dispatch_group_create();
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_89D0;
  v29 = sub_89E0;
  id v30 = +[NSDate distantPast];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(BKLibraryManager *)self dataSources];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v3);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_89E8;
          v18[3] = &unk_D1688;
          v20 = &v25;
          v18[4] = v8;
          v19 = v3;
          [v8 mostRecentPurchaseDate:v18];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v5);
  }

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v3, v9))
  {
    v10 = BKLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_8F658();
    }
  }
  id v11 = (id)v26[5];
  objc_sync_enter(v11);
  v12 = +[NSUserDefaults standardUserDefaults];
  [v12 setObject:v26[5] forKey:@"BKMostRecentPurchaseDateKey"];

  v13 = BKLibraryLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v26[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v14;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "MRP: update cached mrp = %@", buf, 0xCu);
  }

  id v15 = (id)v26[5];
  objc_sync_exit(v11);

  _Block_object_dispose(&v25, 8);
  objc_sync_exit(obj);

  return v15;
}

- (void)updateMostRecentPurchaseDateCacheFromLibrary
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_8BB8;
  v2[3] = &unk_D16B0;
  v2[4] = self;
  [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v2];
}

- (NSDate)mostRecentPurchaseDate
{
  objc_opt_class();
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"BKMostRecentPurchaseDateKey"];
  id v5 = BUDynamicCast();

  if (!v5)
  {
    id v5 = [(BKLibraryManager *)self _updateMostRecentPurchaseDateCacheFromDataSources];
  }
  if (+[BCPPTConfig usePPTLaunchContent])
  {
    if (+[BCPPTConfig isReturningUser])
    {
      uint64_t v6 = +[NSDate date];
    }
    else
    {
      uint64_t v6 = 0;
    }

    id v5 = (void *)v6;
  }

  return (NSDate *)v5;
}

+ (id)sampleDataSourceIdentifier
{
  return @"com.apple.ibooks.plugin.Bookshelf.platformDataSource.SampleBooks";
}

+ (BOOL)isDirectoryFileName:(id)a3
{
  uint64_t v3 = [a3 pathExtension];
  if ([v3 isEqualToString:@"epub"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"ibooks"];
  }

  return v4;
}

+ (BOOL)isTestClass
{
  return 0;
}

- (BKLibraryManager)init
{
  uint64_t v3 = [(id)objc_opt_class() persistentStoreURL];
  unsigned __int8 v4 = objc_opt_new();
  id v5 = [(BKLibraryManager *)self initWithPersistentStoreURL:v3 bdsPriceTracker:v4];

  return v5;
}

- (BKLibraryManager)initWithPersistentStoreURL:(id)a3 bdsPriceTracker:(id)a4
{
  id v6 = a3;
  id v87 = a4;
  kdebug_trace();
  v100.receiver = self;
  v100.super_class = (Class)BKLibraryManager;
  v90 = [(BKLibraryManager *)&v100 initWithPersistentStoreURL:v6];
  if (v90)
  {
    v90->_notifyLockForNewAssets._os_unfair_lock_opaque = 0;
    uint64_t v7 = +[NSMutableDictionary dictionary];
    notifyBlocksForNewAssets = v90->_notifyBlocksForNewAssets;
    v90->_notifyBlocksForNewAssets = (NSMutableDictionary *)v7;

    v88 = [(id)objc_opt_class() persistentStoreURL];
    v89 = +[NSFileManager defaultManager];
    dispatch_time_t v9 = +[NSUserDefaults standardUserDefaults];
    unsigned int v10 = [v9 BOOLForKey:@"BKLibraryPerformancePredicates"];

    if (v10) {
      v90->_usePerformancePredicates = 1;
    }
    id v11 = +[NSUserDefaults standardUserDefaults];
    unsigned int v12 = [v11 BOOLForKey:@"BKLibraryClearDatabaseOnRestart"];

    if (v12)
    {
      v13 = BKLibraryLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_8F728();
      }

      [v89 removeItemAtURL:v88 error:0];
      uint64_t v14 = +[NSUserDefaults standardUserDefaults];
      [v14 removeObjectForKey:@"BKLibraryClearDatabaseOnRestart"];
    }
    id v15 = +[NSUserDefaults standardUserDefaults];
    unsigned int v16 = [v15 BOOLForKey:@"BKLibraryClearImageCacheOnRestart"];

    if (v16)
    {
      +[BCCacheManager clearCacheFiles];
      v17 = +[NSUserDefaults standardUserDefaults];
      [v17 removeObjectForKey:@"BKLibraryClearImageCacheOnRestart"];
    }
    v18 = [v88 path];
    unsigned int v84 = [v89 fileExistsAtPath:v18 isDirectory:0];

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.iBooks.reloadSingleDispatchQueue", v19);
    migrationDispatchQueue = v90->_migrationDispatchQueue;
    v90->_migrationDispatchQueue = (OS_dispatch_queue *)v20;

    v85 = [v88 URLByDeletingLastPathComponent];
    long long v22 = [v85 path];
    unsigned __int8 v23 = [v89 fileExistsAtPath:v22 isDirectory:0];

    if ((v23 & 1) == 0) {
      [v89 createDirectoryAtURL:v85 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_9C5C;
    v98[3] = &unk_D1520;
    v99 = v90;
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_9C64;
    v96[3] = &unk_D1520;
    long long v24 = v99;
    v97 = v24;
    [(BKLibraryManager *)v24 loadCoreDataPersistentStoreInitializedHandler:v98 migrationHandler:v96];
    [(BKLibraryManager *)v24 _readLibraryVesionInfo];
    [(BKLibraryManager *)v24 createSeriesUpdaterMoc];
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_9CF0;
    v94[3] = &unk_D16B0;
    uint64_t v25 = v24;
    v95 = v25;
    [v25 performBlockOnCollectionsWorkerQueueAndWait:v94];
    if (v84)
    {
      [v25 setResetSeriesOnAllBooks:[v25 _compareVersionWith:@"0.0"] == 0];
      [v25 setResetSeriesOnAllBooks:[v25 resetSeriesOnAllBooks] | ([v25 _compareVersionWith:@"1.3"] == (char *)&dword_0 + 1)];
      [v25 setResetSeriesOnAllBooks:[v25 resetSeriesOnAllBooks] | ([v25 _compareVersionWith:@"2.0"] == (char *)&dword_0 + 1)];
      [v25 setNeedsResetNilAuthorsOnAllSeries:[v25 _compareVersionWith:@"1.1"] == (char *)&dword_0 + 1];
      [v25 setNeedsResetNilAuthorsOnAllBooks:[v25 _compareVersionWith:@"1.2"] == (char *)&dword_0 + 1];
      [v25 setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:[v25 _compareVersionWith:@"1.5"] == (char *)&dword_0 + 1];
      [v25 setNeedsDuplicateCollectionMembersRemoved:[v25 _compareVersionWith:@"1.9"] == (char *)&dword_0 + 1];
    }
    if ([v25 _compareVersionWith:@"1.8"] == (char *)&dword_0 + 1)
    {
      v26 = +[BUAccountsProvider sharedProvider];
      [v26 clearLastUsedStoreAccountID];
    }
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    id v28 = v25[36];
    v25[36] = v27;

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.BKLibrary.ownershipSync", v29);
    id v31 = v25[37];
    v25[37] = v30;

    v86 = +[NSPredicate predicateWithFormat:@"%K != %@ AND %K != %@", @"contentType", &off_D9E30, @"state", &off_D9E30];
    id v32 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v33 = [v25 persistentStoreCoordinator];
    v102[0] = @"state";
    v102[1] = @"dataSourceIdentifier";
    v34 = +[NSArray arrayWithObjects:v102 count:2];
    v35 = +[NSSet setWithArray:v34];
    id v36 = [v32 initWithContext:0 coordinator:v33 entityName:@"BKLibraryAsset" predicate:v86 mapProperty:@"assetID" propertiesOfInterest:v35 observer:v25];
    id v37 = v25[34];
    v25[34] = v36;

    id v38 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v39 = [v25 persistentStoreCoordinator];
    v101[0] = @"state";
    v101[1] = @"dataSourceIdentifier";
    v40 = +[NSArray arrayWithObjects:v101 count:2];
    v41 = +[NSSet setWithArray:v40];
    id v42 = [v38 initWithContext:0 coordinator:v39 entityName:@"BKLibraryAsset" predicate:v86 mapProperty:@"temporaryAssetID" propertiesOfInterest:v41 observer:v25];
    id v43 = v25[35];
    v25[35] = v42;

    id v44 = objc_alloc_init((Class)NSMutableSet);
    id v45 = v25[25];
    v25[25] = v44;

    id v46 = objc_alloc_init((Class)NSMutableDictionary);
    id v47 = v25[26];
    v25[26] = v46;

    id v48 = objc_alloc_init((Class)NSMutableSet);
    id v49 = v25[27];
    v25[27] = v48;

    id v50 = objc_alloc_init((Class)NSMutableSet);
    id v51 = v25[28];
    v25[28] = v50;

    id v52 = objc_alloc_init((Class)NSOperationQueue);
    id v53 = v25[10];
    v25[10] = v52;

    [v25[10] setMaxConcurrentOperationCount:4];
    [v25[10] setQualityOfService:25];
    id v54 = objc_alloc_init((Class)NSOperationQueue);
    id v55 = v25[11];
    v25[11] = v54;

    [v25[11] setMaxConcurrentOperationCount:4];
    [v25[11] setQualityOfService:17];
    v56 = [[BKLibraryPriceManager alloc] initWithLibraryManager:v25];
    id v57 = v25[12];
    v25[12] = v56;

    v58 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v59 = dispatch_queue_attr_make_initially_inactive(v58);
    dispatch_queue_t v60 = dispatch_queue_create("com.apple.iBooks.updatesScheduleQueue", (dispatch_queue_attr_t)v59);
    id v61 = v25[21];
    v25[21] = v60;

    v62 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v63 = dispatch_queue_create("com.apple.iBooks.dqSyncQueue", v62);
    id v64 = v25[23];
    v25[23] = v63;

    dispatch_queue_t v65 = dispatch_queue_create("com.apple.iBooks.completionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    id v66 = v25[24];
    v25[24] = v65;

    objc_initWeak(&location, v25);
    id v67 = objc_alloc((Class)BUCoalescingCallBlock);
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_9D50;
    v91[3] = &unk_D16D8;
    objc_copyWeak(&v92, &location);
    id v68 = [v67 initWithNotifyBlock:v91 notifyTimeout:360 blockDescription:@"BKLibraryManager reload" notifyTimeoutBlock:&stru_D1718];
    id v69 = v25[30];
    v25[30] = v68;

    uint64_t v70 = objc_opt_new();
    id v71 = v25[31];
    v25[31] = (id)v70;

    v72 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v73 = dispatch_queue_create("com.apple.iBooks.coalescedDataSourceReloadByIdentifierSync", v72);
    id v74 = v25[32];
    v25[32] = v73;

    v75 = [[BKLibraryAssetDetailsManager alloc] initWithLibraryManager:v25];
    [v25 setAssetDetailsManager:v75];

    v76 = [v25 metadataObjectForKey:@"BKLibraryIsMigrating"];
    LOBYTE(v59) = [v76 BOOLValue];

    if (v59)
    {
      uint64_t v77 = 1;
    }
    else
    {
      [v25 loadCachedMigrationData];
      uint64_t v77 = v84 ^ 1;
    }
    v78 = +[NSUserDefaults standardUserDefaults];
    unsigned int v79 = [v78 BOOLForKey:@"BKLibraryTestMigration"];

    if (v79)
    {
      v80 = BKLibraryLog();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG)) {
        sub_8F6F4();
      }

      uint64_t v77 = 1;
    }
    [v25 setNeedsMigration:v77];
    [v25 _performInitialDataBaseMaintenance];
    [v25 resetNextCollectionSort];
    v81 = [[BKLibraryPriceTracker alloc] initWithLibraryManager:v25 bdsPriceTracker:v87];
    id v82 = v25[14];
    v25[14] = v81;

    objc_destroyWeak(&v92);
    objc_destroyWeak(&location);
  }
  kdebug_trace();

  return v90;
}

- (void)tearDownPersistentStores
{
  uint64_t v3 = [(BKLibraryManager *)self workerChildContext];
  workerChildContext = self->_workerChildContext;
  self->_workerChildContext = 0;

  dispatch_queue_t v30 = v3;
  [v3 performBlockAndWait:&stru_D1738];
  id v5 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  collectionsWorkerChildContext = self->_collectionsWorkerChildContext;
  self->_collectionsWorkerChildContext = 0;

  v29 = v5;
  [v5 performBlockAndWait:&stru_D1758];
  uint64_t v7 = [(BKLibraryManager *)self uiChildContext];
  uiChildContext = self->_uiChildContext;
  self->_uiChildContext = 0;

  id v28 = v7;
  [v7 performBlockAndWait:&stru_D1778];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  dispatch_time_t v9 = [(BKLibraryManager *)self persistentStoreCoordinator];
  v52[0] = v9;
  unsigned int v10 = [(BKLibraryManager *)self ui_persistentStoreCoordinator];
  v52[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v52 count:2];

  id obj = v11;
  id v33 = [v11 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v12;
        v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v14 = [v13 persistentStores];
        id v15 = [v14 copy];

        id v16 = [v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v38;
          do
          {
            v19 = 0;
            do
            {
              if (*(void *)v38 != v18) {
                objc_enumerationMutation(v15);
              }
              dispatch_queue_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v19);
              id v36 = 0;
              [v13 removePersistentStore:v20 error:&v36];
              id v21 = v36;
              if (v21)
              {
                long long v22 = BKLibraryLog();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  unsigned __int8 v23 = [(BKLibraryManager *)self persistentStoreURL];
                  *(_DWORD *)buf = 138412802;
                  id v46 = self;
                  __int16 v47 = 2112;
                  id v48 = v20;
                  __int16 v49 = 2112;
                  id v50 = v23;
                  _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "%@: Error removing persistent store %@ for persistentStoreURL: %@", buf, 0x20u);
                }
              }

              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v37 objects:v51 count:16];
          }
          while (v17);
        }

        long long v24 = [(BKLibraryManager *)self persistentStoreURL];
        uint64_t v25 = [(BKLibraryManager *)self _persistentStoreOptions];
        id v35 = 0;
        [v13 destroyPersistentStoreAtURL:v24 withType:NSSQLiteStoreType options:v25 error:&v35];
        id v26 = v35;

        if (v26 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v27 = [(BKLibraryManager *)self persistentStoreURL];
          *(_DWORD *)buf = 138412546;
          id v46 = self;
          __int16 v47 = 2112;
          id v48 = v27;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@: Error destroying persistentStoreURL: %@", buf, 0x16u);
        }
        uint64_t v12 = v34 + 1;
      }
      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v33);
  }
}

- (void)_performInitialDataBaseMaintenance
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_A2CC;
  v2[3] = &unk_D16B0;
  v2[4] = self;
  [(BKLibraryManager *)self performNamed:@"_performInitialDataBaseMaintenance" workerQueueBlockAndWait:v2];
}

- (void)_cleanUpOrphanedSampleAssets:(id)a3
{
  id v7 = a3;
  uint64_t v3 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  unsigned __int8 v4 = +[NSPredicate predicateWithFormat:@"isSample == 1 AND collectionMembers.@count == 0"];
  [v3 setPredicate:v4];

  id v5 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v3];
  id v6 = [v7 executeRequest:v5 error:0];
}

- (id)_assetIDsForCollectionID:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = +[NSPredicate predicateWithFormat:@"collection.collectionID == %@ AND (asset.isHidden == NO OR asset.isHidden == NULL) AND (asset.isEphemeral == NO OR asset.isEphemeral == NULL) AND asset.state != %@", a3, &off_D9E30];
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  [v7 setPredicate:v6];
  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:1];
  id v16 = v8;
  dispatch_time_t v9 = +[NSArray arrayWithObjects:&v16 count:1];
  [v7 setSortDescriptors:v9];

  id v15 = 0;
  unsigned int v10 = [v5 executeFetchRequest:v7 error:&v15];

  id v11 = v15;
  if (v10)
  {
    uint64_t v12 = [v10 valueForKey:@"assetID"];
  }
  else
  {
    v13 = BKLibraryLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_8F818();
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_removeAllMembersFromCollection:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v8 = +[NSPredicate predicateWithFormat:@"collection.collectionID == %@", v5];
  [v7 setPredicate:v8];

  [v7 setFetchBatchSize:32];
  id v20 = 0;
  dispatch_time_t v9 = [v6 executeFetchRequest:v7 error:&v20];
  id v10 = v20;
  if (v9)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [v6 deleteObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8F818();
    }
  }
}

- (void)_sortUserCollectionToTop:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollection"];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:0];
  id v17 = v9;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  [v8 setSortDescriptors:v10];

  id v11 = +[BKCollection predicateForNonDeletedUserCollections];
  [v8 setPredicate:v11];

  id v16 = 0;
  id v12 = [v7 executeFetchRequest:v8 error:&v16];

  id v13 = v16;
  if (v12)
  {
    uint64_t v14 = [v12 mutableCopy];
    id v15 = [v14 indexOfObject:v6];
    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 removeObjectAtIndex:v15];
      [v14 addObject:v6];
      if (+[BKUserSortOrderManager resortDescendingSortKeyedObjects:v14])
      {
        [(BKLibraryManager *)self resetNextCollectionSort];
        [(BKLibraryManager *)self saveMetaData];
      }
    }
  }
  else
  {
    uint64_t v14 = BKLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_8F818();
    }
  }
}

- (void)_persistentStoreDidMigrate
{
  uint64_t v3 = BKLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Library Persistent Store did migrate.", buf, 2u);
  }

  [(BKLibraryManager *)self setDidMigrateFromITunesSyncToICloudSync:(char *)[(BKLibraryManager *)self _compareVersionWith:@"1.7"] == (char *)&dword_0 + 1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AA94;
  v5[3] = &unk_D16B0;
  v5[4] = self;
  [(BKLibraryManager *)self performBlockOnCollectionsWorkerQueue:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_AAF4;
  v4[3] = &unk_D16B0;
  v4[4] = self;
  [(BKLibraryManager *)self performBlockOnCollectionsWorkerQueue:v4];
}

- (void)migrateToMyBooksWithAssetIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(BKLibraryManager *)self _assetIDsForCollectionID:kBKCollectionDefaultIDBooks moc:v7];
    unsigned __int8 v9 = [v6 isEqualToArray:v8];
    id v10 = BKLibraryLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "My Books: Migration not needed for Books collection - collections match", buf, 2u);
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 134218240;
        id v50 = [v6 count];
        __int16 v51 = 2048;
        id v52 = [v8 count];
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "My Books: Migrating items in Books collection (old: %lu new: %lu).", buf, 0x16u);
      }

      id v10 = [(BKLibraryManager *)self collectionController];
      long long v38 = +[BCCollection identifierForMyBooksCollection];
      uint64_t v12 = -[NSObject mutableCollectionWithCollectionID:inManagedObjectContext:error:](v10, "mutableCollectionWithCollectionID:inManagedObjectContext:error:");
      uint64_t v37 = v12;
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = BKLibraryLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "My Books: Found collection", buf, 2u);
        }
        id v36 = 0;
      }
      else
      {
        id v35 = self;
        uint64_t v34 = [(BKLibraryManager *)self collectionProvider];
        id v15 = [v34 userCollectionsInManagedObjectContext:v7 withError:0];
        id v16 = objc_alloc_init((Class)NSMutableArray);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v17 = v15;
        id v18 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v44;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(v17);
              }
              long long v22 = [*(id *)(*((void *)&v43 + 1) + 8 * i) title];
              if (v22) {
                [v16 addObject:v22];
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v19);
        }

        uint64_t v23 = +[BCCollection uniqueTitleForMyBooksCollection:v16];
        id v13 = +[BKCollection insertNewCollectionWithCollectionID:v38 inManagedObjectContext:v7];
        [v13 setTitle:v23];
        long long v24 = BKLibraryLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "My Books: Created collection", buf, 2u);
        }
        id v36 = (void *)v23;

        uint64_t v14 = v34;
        self = v35;
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v25 = v6;
      id v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v40;
        do
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v40 != v28) {
              objc_enumerationMutation(v25);
            }
            id v30 = [v13 addCollectionMemberAvoidingDupesWithAssetID:*(void *)(*((void *)&v39 + 1) + 8 * (void)j) sortKey:0 forceToTop:0];
          }
          id v27 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v27);
      }

      if (!v37)
      {
        [(BKLibraryManager *)self _sortUserCollectionToTop:v13 moc:v7];
        [v13 setLocalModDate:0];
        id v31 = [(BKLibraryManager *)self delegate];
        char v32 = objc_opt_respondsToSelector();

        if (v32)
        {
          id v33 = [(BKLibraryManager *)self delegate];
          [v33 didMigrateBooksCollection:v36];
        }
      }
    }
  }
  else
  {
    id v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "My Books: Migration not needed for Books collection - no assetIDs", buf, 2u);
    }
  }
}

- (void)_updateRelationshipsInContext:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  id v5 = [(BKLibraryManager *)self migrationDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B644;
  block[3] = &unk_D17A0;
  void block[4] = &v42;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v43 + 24))
  {
    id v6 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    id v7 = +[NSPredicate predicateWithFormat:@"seriesID != NULL AND contentType != %@ AND seriesContainer == NULL", &off_D9E30];
    [v6 setPredicate:v7];

    [v6 setFetchBatchSize:32];
    id v8 = [v4 executeFetchRequest:v6 error:0];
    unsigned __int8 v9 = +[NSMutableDictionary dictionary];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v38;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          [(BKLibraryManager *)self updateSeriesRelationshipsForSeriesAsset:v14];
          id v15 = [v14 seriesContainer];
          id v16 = [v14 seriesID];
          [v9 setObject:v15 forKeyedSubscript:v16];
        }
        id v11 = [v10 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v11);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = v9;
    id v18 = [v17 countByEnumeratingWithState:&v33 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v34;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v17);
          }
          id v21 = [v17 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
          [(BKLibraryManager *)self _updateAuthorForSeriesContainer:v21];
        }
        id v18 = [v17 countByEnumeratingWithState:&v33 objects:v47 count:16];
      }
      while (v18);
    }

    long long v22 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    uint64_t v23 = +[NSPredicate predicateWithFormat:@"contentType != %@ AND storePlaylistID != NULL AND isSupplementalContent == YES AND supplementalContentParent == NULL", &off_D9E48];
    [v22 setPredicate:v23];

    [v22 setFetchBatchSize:32];
    [v4 executeFetchRequest:v22 error:0];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = [v24 countByEnumeratingWithState:&v29 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v30;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(v24);
          }
          [(BKLibraryManager *)self updateSupplementalContentRelationship:*(void *)(*((void *)&v29 + 1) + 8 * (void)k)];
        }
        id v25 = [v24 countByEnumeratingWithState:&v29 objects:v46 count:16];
      }
      while (v25);
    }

    uint64_t v28 = [(BKLibraryManager *)self migrationDispatchQueue];
    dispatch_sync(v28, &stru_D17C0);
  }
  _Block_object_dispose(&v42, 8);
}

- (void)_readLibraryVesionInfo
{
  uint64_t v3 = [(BKLibraryManager *)self metadataObjectForKey:@"BKLibraryVersion_Key"];
  id v4 = v3;
  self->_majorVersion = 0;
  self->_minorVersion = 0;
  if (v3)
  {
    id v5 = [v3 componentsSeparatedByString:@"."];
    if ([v5 count] == (char *)&dword_0 + 2)
    {
      id v6 = [v5 objectAtIndexedSubscript:0];
      self->_majorVersion = (unint64_t)[v6 integerValue];

      id v7 = [v5 objectAtIndexedSubscript:1];
      self->_minorVersion = (unint64_t)[v7 integerValue];
    }
    else
    {
      id v7 = BKLibraryLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_8F880();
      }
    }
  }
  if (([@"2.0" isEqualToString:v4] & 1) == 0)
  {
    [(BKLibraryManager *)self setMetadataObject:@"2.0" forKey:@"BKLibraryVersion_Key"];
    [(BKLibraryManager *)self saveMetaData];
  }
}

- (int64_t)_compareVersionWith:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"."];
  if ([v5 count] == (char *)&dword_0 + 2)
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 integerValue];

    id v8 = [v5 objectAtIndexedSubscript:1];
    id v9 = [v8 integerValue];

    if (v7 == (id)[(BKLibraryManager *)self majorVersion])
    {
      if (v9 == (id)[(BKLibraryManager *)self minorVersion])
      {
        int64_t v10 = 0;
        goto LABEL_13;
      }
      BOOL v12 = v9 >= (id)[(BKLibraryManager *)self minorVersion];
    }
    else
    {
      BOOL v12 = v7 >= (id)[(BKLibraryManager *)self majorVersion];
    }
    if (v12) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = -1;
    }
  }
  else
  {
    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8F8E8();
    }

    int64_t v10 = -1;
  }
LABEL_13:

  return v10;
}

- (void)_scheduleOperationGroupWithName:(id)a3 block:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = [[BKLibraryUpdateGroup alloc] initWithName:v7];

    id v9 = [(BKLibraryManager *)self updatesScheduleQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_BA10;
    block[3] = &unk_D17E8;
    void block[4] = self;
    id v13 = v8;
    id v14 = v6;
    int64_t v10 = v8;
    dispatch_async(v9, block);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_BA6C;
    v11[3] = &unk_D1520;
    v11[4] = self;
    [(BKLibraryUpdateGroup *)v10 executeWithCompletion:v11];
  }
}

- (void)_setupUICoreDataStack
{
  uint64_t v3 = [[BKLibraryManagedObjectContext alloc] initWithConcurrencyType:2];
  uiChildContext = self->_uiChildContext;
  self->_uiChildContext = v3;

  [(BKLibraryManagedObjectContext *)self->_uiChildContext setName:@"UI Child Context"];
  id v5 = [(BKLibraryManager *)self ui_persistentStoreCoordinator];
  [(BKLibraryManagedObjectContext *)self->_uiChildContext setPersistentStoreCoordinator:v5];

  [(BKLibraryManagedObjectContext *)self->_uiChildContext setUndoManager:0];
  [(BKLibraryManagedObjectContext *)self->_uiChildContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [(BKLibraryManagedObjectContext *)self->_uiChildContext setSessionContextType:5];
  [(BKLibraryManagedObjectContext *)self->_uiChildContext setLibraryManager:self];
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"uiManagedObjectContextDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:self->_uiChildContext];
}

- (BKLibraryManagedObjectContext)uiChildContext
{
  uiChildContext = self->_uiChildContext;
  if (!uiChildContext)
  {
    [(BKLibraryManager *)self _setupUICoreDataStack];
    uiChildContext = self->_uiChildContext;
  }

  return uiChildContext;
}

- (NSPersistentStore)ui_persistentStore
{
  return self->_ui_persistentStore;
}

- (NSPersistentStoreCoordinator)ui_persistentStoreCoordinator
{
  return self->_ui_persistentStoreCoordinator;
}

- (void)_setupCoreDataStack
{
  BUIsRunningTests();
  id v3 = objc_alloc((Class)NSPersistentStoreCoordinator);
  id v4 = [(BKLibraryManager *)self managedObjectModel];
  id v5 = (NSPersistentStoreCoordinator *)[v3 initWithManagedObjectModel:v4];
  ui_persistentStoreCoordinator = self->_ui_persistentStoreCoordinator;
  self->_ui_persistentStoreCoordinator = v5;

  id v7 = self->_ui_persistentStoreCoordinator;
  if (v7 || (BCReportAssertionFailureWithMessage(), (id v7 = self->_ui_persistentStoreCoordinator) != 0))
  {
    id v8 = [(BKLibraryManager *)self persistentStoreURL];
    id v9 = [(BKLibraryManager *)self _persistentStoreOptions];
    id v38 = 0;
    int64_t v10 = [(NSPersistentStoreCoordinator *)v7 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v8 options:v9 error:&v38];
    id v11 = v38;
    ui_persistentStore = self->_ui_persistentStore;
    self->_ui_persistentStore = v10;

    id v13 = self->_ui_persistentStore;
    if (!v13) {
      BCReportAssertionFailureWithMessage();
    }
  }
  id v14 = [[BKLibraryManagedObjectContext alloc] initWithConcurrencyType:1];
  [(BKLibraryManager *)self setWorkerChildContext:v14];

  id v15 = [(BKLibraryManager *)self workerChildContext];
  [v15 setName:@"Worker Context"];

  id v16 = [(BKLibraryManager *)self persistentStoreCoordinator];
  id v17 = [(BKLibraryManager *)self workerChildContext];
  [v17 setPersistentStoreCoordinator:v16];

  id v18 = [(BKLibraryManager *)self workerChildContext];
  [v18 setUndoManager:0];

  id v19 = NSMergeByPropertyObjectTrumpMergePolicy;
  uint64_t v20 = [(BKLibraryManager *)self workerChildContext];
  [v20 setMergePolicy:v19];

  id v21 = [(BKLibraryManager *)self workerChildContext];
  [v21 setLibraryManager:self];

  long long v22 = [[BKLibraryManagedObjectContext alloc] initWithConcurrencyType:1];
  [(BKLibraryManager *)self setCollectionsWorkerChildContext:v22];

  uint64_t v23 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  [v23 setName:@"Collections Worker Context"];

  id v24 = [(BKLibraryManager *)self persistentStoreCoordinator];
  id v25 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  [v25 setPersistentStoreCoordinator:v24];

  uint64_t v26 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  [v26 setUndoManager:0];

  id v27 = NSMergeByPropertyObjectTrumpMergePolicy;
  uint64_t v28 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  [v28 setMergePolicy:v27];

  long long v29 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  [v29 setLibraryManager:self];

  long long v30 = [[BKLibraryManagedObjectContext alloc] initWithConcurrencyType:1];
  readOnlyChildContext = self->_readOnlyChildContext;
  self->_readOnlyChildContext = v30;

  [(BKLibraryManagedObjectContext *)self->_readOnlyChildContext setName:@"Read-only Child Context"];
  long long v32 = [(BKLibraryManager *)self persistentStoreCoordinator];
  [(BKLibraryManagedObjectContext *)self->_readOnlyChildContext setPersistentStoreCoordinator:v32];

  [(BKLibraryManagedObjectContext *)self->_readOnlyChildContext setUndoManager:0];
  [(BKLibraryManagedObjectContext *)self->_readOnlyChildContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [(BKLibraryManagedObjectContext *)self->_readOnlyChildContext setLibraryManager:self];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_C0C4;
  v37[3] = &unk_D1810;
  v37[4] = self;
  id v33 = [objc_alloc((Class)IMManagedObjectContextReadOnlyPool) initWithContextProvider:v37];
  [(BKLibraryManager *)self setBackgroundReadOnlyContextPool:v33];

  long long v34 = +[NSNotificationCenter defaultCenter];
  long long v35 = [(BKLibraryManager *)self workerChildContext];
  [v34 addObserver:self selector:"workerManagedObjectContextDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:v35];

  long long v36 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  [v34 addObserver:self selector:"collectionsWorkerManagedObjectContextDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:v36];

  [v34 addObserver:self selector:"otherManagedObjectContextDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:0];
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_imageSourceOperationQueue cancelAllOperations];
  imageSourceOperationQueue = self->_imageSourceOperationQueue;
  self->_imageSourceOperationQueue = 0;

  [(NSOperationQueue *)self->_imageSourceScalingOperationQueue cancelAllOperations];
  imageSourceScalingOperationQueue = self->_imageSourceScalingOperationQueue;
  self->_imageSourceScalingOperationQueue = 0;

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(BKLibraryManager *)self dataSources];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      int64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 removeObserver:self forKeyPath:@"processingAuthentication" context:off_ECE58];
        }
        int64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12.receiver = self;
  v12.super_class = (Class)BKLibraryManager;
  [(BKLibraryManager *)&v12 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if (off_ECE58 == a6)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([v10 processingAuthentication]) {
        [(BKLibraryManager *)self _updateProcessingAuthenticationStateImmediate];
      }
      else {
        [(BKLibraryManager *)self _updateProcessingAuthenticationStateDeferred];
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)BKLibraryManager;
    [(BKLibraryManager *)&v11 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (NSString)description
{
  id v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p dataSources=("], v5, self;

  id v6 = [(BKLibraryManager *)self dataSources];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v6 indexOfObjectIdenticalTo:v11];
        uint64_t v13 = 1 << (char)v12;
        if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = 0;
        }
        [v3 appendFormat:@"%@ b=%#lx, ", v11, v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  long long v14 = [(BKLibraryManager *)self dataSources];
  id v15 = [v14 count];

  if (v15) {
    [v3 replaceCharactersInRange:[v3 length] - 2, 2, &stru_D4160];
  }
  [v3 appendFormat:@">"]);
  id v16 = [v3 copy];

  return (NSString *)v16;
}

- (NSString)debugDescription
{
  id v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p dataSources=(\n", v5, self];

  id v6 = [(BKLibraryManager *)self dataSources];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v51;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v12 = [v6 indexOfObjectIdenticalTo:v11];
        uint64_t v13 = 1 << (char)v12;
        if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = 0;
        }
        [v3 appendFormat:@"%@ b=%#lx,\n", v11, v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v8);
  }
  long long v14 = [(BKLibraryManager *)self dataSources];
  id v15 = [v14 count];

  if (v15) {
    [v3 replaceCharactersInRange:[v3 length] - 2, 2, &stru_D4160];
  }
  [v3 appendFormat:@">"]);
  [v3 appendFormat:@"assetUpdatesByIdentifier={\n"];
  __int16 v47 = self;
  id v16 = [(BKLibraryManager *)self assetUpdatesByIdentifier];
  id v17 = [v16 allKeys];
  long long v18 = [v17 sortedArrayUsingSelector:"compare:"];

  long long v19 = (char *)[v18 count];
  if (v19)
  {
    long long v20 = v19;
    long long v21 = 0;
    __int16 v49 = v19 - 1;
    do
    {
      long long v22 = [v18 objectAtIndexedSubscript:v21];
      [v16 objectForKeyedSubscript:v22];
      v24 = uint64_t v23 = v16;
      id v25 = sub_CAC8([v24 dataSourcesBitmask], v6);
      uint64_t v26 = [v25 identifier];
      id v27 = (void *)v26;
      CFStringRef v28 = &stru_D4160;
      if (v49 != v21) {
        CFStringRef v28 = @",";
      }
      [v3 appendFormat:@"%@=%@ dataSource=%@%@\n", v22, v24, v26, v28];

      id v16 = v23;
      ++v21;
    }
    while (v20 != v21);
  }
  char v45 = v18;
  long long v46 = v16;
  [v3 appendFormat:@"}\n"];
  long long v29 = [(BKLibraryManager *)v47 unclaimedAssetIDs];
  long long v30 = [(BKLibraryManager *)v47 unclaimedTemporaryAssetIDs];
  [v3 appendFormat:@"unclaimedAssetIDs=%@\nunclaimedTemporaryAssetIDs=%@\n", v29, v30];

  long long v31 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  v54[0] = @"assetID";
  v54[1] = @"temporaryAssetID";
  v54[2] = @"title";
  v54[3] = @"dataSourceIdentifier";
  long long v32 = +[NSArray arrayWithObjects:v54 count:4];
  [v31 setPropertiesToFetch:v32];

  [v31 setResultType:2];
  id v33 = [(BKLibraryManager *)v47 uiChildContext];
  id v48 = v31;
  long long v34 = [v33 executeFetchRequest:v31 error:0];

  long long v35 = (char *)[v34 count];
  [v3 appendFormat:@"BKLibraryAssets={\n"];
  if (v35)
  {
    for (j = 0; j != v35; ++j)
    {
      long long v37 = [v34 objectAtIndexedSubscript:j];
      id v38 = [v37 objectForKeyedSubscript:@"assetID"];
      long long v39 = [v37 objectForKeyedSubscript:@"temporaryAssetID"];
      long long v40 = [v37 objectForKeyedSubscript:@"title"];
      uint64_t v41 = [v37 objectForKeyedSubscript:@"dataSourceIdentifier"];
      uint64_t v42 = (void *)v41;
      CFStringRef v43 = &stru_D4160;
      if (v35 - 1 != j) {
        CFStringRef v43 = @",";
      }
      [v3 appendFormat:@"id=%@ tid=%@ title='%@' dataSource=%@%@\n", v38, v39, v40, v41, v43];
    }
  }
  [v3 appendFormat:@"} >"];

  return (NSString *)v3;
}

- (void)dq_sync:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(BKLibraryManager *)self dqSyncQueue];
    dispatch_sync(v5, v4);
  }
}

- (void)uiManagedObjectContextDidSaveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:NSInsertedObjectsKey];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKey:NSUpdatedObjectsKey];

  uint64_t v9 = [v4 userInfo];
  id v10 = [v9 objectForKey:NSDeletedObjectsKey];

  if ([v6 count] || objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
  {
    uint64_t v11 = [(BKLibraryManager *)self workerChildContext];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_CD74;
    v22[3] = &unk_D1418;
    v22[4] = self;
    id v12 = v4;
    id v23 = v12;
    [v11 performBlock:v22];

    uint64_t v13 = [(BKLibraryManager *)self collectionsWorkerChildContext];
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    long long v18 = sub_CDC8;
    long long v19 = &unk_D1418;
    long long v20 = self;
    id v14 = v12;
    id v21 = v14;
    [v13 performBlock:&v16];

    id v15 = [(BKLibraryManager *)self backgroundReadOnlyContextPool];
    [v15 remoteContextDidSave:v14];
  }
}

- (void)workerManagedObjectContextDidSaveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:NSInsertedObjectsKey];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKey:NSUpdatedObjectsKey];

  uint64_t v9 = [v4 userInfo];
  id v10 = [v9 objectForKey:NSDeletedObjectsKey];

  if ([v6 count] || objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
  {
    uiChildContext = self->_uiChildContext;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_D01C;
    v22[3] = &unk_D1418;
    v22[4] = self;
    id v12 = v4;
    id v23 = v12;
    [(BKLibraryManagedObjectContext *)uiChildContext performBlock:v22];
    uint64_t v13 = [(BKLibraryManager *)self collectionsWorkerChildContext];
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    long long v18 = sub_D0E4;
    long long v19 = &unk_D1418;
    long long v20 = self;
    id v14 = v12;
    id v21 = v14;
    [v13 performBlock:&v16];

    id v15 = [(BKLibraryManager *)self backgroundReadOnlyContextPool];
    [v15 remoteContextDidSave:v14];
  }
}

- (void)collectionsWorkerManagedObjectContextDidSaveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:NSInsertedObjectsKey];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKey:NSUpdatedObjectsKey];

  uint64_t v9 = [v4 userInfo];
  id v10 = [v9 objectForKey:NSDeletedObjectsKey];

  if ([v6 count] || objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
  {
    uiChildContext = self->_uiChildContext;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_D338;
    v22[3] = &unk_D1418;
    v22[4] = self;
    id v12 = v4;
    id v23 = v12;
    [(BKLibraryManagedObjectContext *)uiChildContext performBlock:v22];
    uint64_t v13 = [(BKLibraryManager *)self workerChildContext];
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    long long v18 = sub_D400;
    long long v19 = &unk_D1418;
    long long v20 = self;
    id v14 = v12;
    id v21 = v14;
    [v13 performBlock:&v16];

    id v15 = [(BKLibraryManager *)self backgroundReadOnlyContextPool];
    [v15 remoteContextDidSave:v14];
  }
}

- (void)otherManagedObjectContextDidSaveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5 != self->_uiChildContext)
  {
    uint64_t v6 = [(BKLibraryManager *)self workerChildContext];
    if (v5 == (BKLibraryManagedObjectContext *)v6)
    {
    }
    else
    {
      id v7 = (void *)v6;
      uint64_t v8 = [(BKLibraryManager *)self collectionsWorkerChildContext];
      if (v5 == (BKLibraryManagedObjectContext *)v8)
      {

LABEL_12:
        goto LABEL_13;
      }
      uint64_t v9 = (void *)v8;
      id v10 = [(BKLibraryManagedObjectContext *)v5 persistentStoreCoordinator];
      uint64_t v11 = [(BKLibraryManager *)self persistentStoreCoordinator];
      unsigned int v12 = [v10 hasStoreInCommonWith:v11];

      if (v12)
      {
        uint64_t v13 = [v4 userInfo];
        id v7 = [v13 objectForKey:NSInsertedObjectsKey];

        id v14 = [v4 userInfo];
        id v15 = [v14 objectForKey:NSUpdatedObjectsKey];

        id v16 = [v4 userInfo];
        uint64_t v17 = [v16 objectForKey:NSDeletedObjectsKey];

        if ([v7 count] || objc_msgSend(v15, "count") || objc_msgSend(v17, "count"))
        {
          uiChildContext = self->_uiChildContext;
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_D76C;
          v33[3] = &unk_D1418;
          v33[4] = self;
          id v19 = v4;
          id v34 = v19;
          [(BKLibraryManagedObjectContext *)uiChildContext performBlock:v33];
          long long v20 = [(BKLibraryManager *)self workerChildContext];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_D834;
          v31[3] = &unk_D1418;
          v31[4] = self;
          id v21 = v19;
          id v32 = v21;
          [v20 performBlock:v31];

          long long v22 = [(BKLibraryManager *)self collectionsWorkerChildContext];
          id v25 = _NSConcreteStackBlock;
          uint64_t v26 = 3221225472;
          id v27 = sub_D888;
          CFStringRef v28 = &unk_D1418;
          long long v29 = self;
          id v23 = v21;
          id v30 = v23;
          [v22 performBlock:&v25];

          id v24 = [(BKLibraryManager *)self backgroundReadOnlyContextPool];
          [v24 remoteContextDidSave:v23];
        }
        goto LABEL_12;
      }
    }
  }
LABEL_13:
}

- (void)performBlockOnCollectionsWorkerQueue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = BCSignpostLibrary();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    id v7 = BCSignpostLibrary();
    uint64_t v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_EVENT, v6, "CollectionsQueueAsyncScheduled", "", buf, 2u);
    }

    uint64_t v9 = [(BKLibraryManager *)self collectionsWorkerChildContext];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_DA08;
    v10[3] = &unk_D1838;
    os_signpost_id_t v12 = v6;
    v10[4] = self;
    id v11 = v4;
    [v9 performBlock:v10];
  }
}

- (void)performBlockOnCollectionsWorkerQueueAndWait:(id)a3
{
  id v4 = a3;
  if (+[NSThread isMainThread])
  {
    id v5 = BKLibraryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_8F950();
    }
  }
  if (v4)
  {
    os_signpost_id_t v6 = BCSignpostLibrary();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    uint64_t v8 = BCSignpostLibrary();
    uint64_t v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_EVENT, v7, "CollectionsQueueSyncScheduled", "", buf, 2u);
    }

    id v10 = [(BKLibraryManager *)self collectionsWorkerChildContext];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_DCF4;
    v11[3] = &unk_D1838;
    os_signpost_id_t v13 = v7;
    v11[4] = self;
    id v12 = v4;
    [v10 performBlockAndWait:v11];
  }
}

- (void)performBlockOnWorkerQueue:(id)a3
{
}

- (void)performNamed:(id)a3 workerQueueBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BCSignpostLibrary();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = BCSignpostLibrary();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_EVENT, v9, "WorkerQueueAsyncScheduled", "%{public}@", buf, 0xCu);
  }

  id v12 = [(BKLibraryManager *)self workerChildContext];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_E018;
  v15[3] = &unk_D17E8;
  uint64_t v17 = self;
  id v18 = v7;
  id v16 = v6;
  id v13 = v7;
  id v14 = v6;
  [v12 performBlock:v15];
}

- (void)performBlockOnWorkerQueueAndWait:(id)a3
{
}

- (void)performNamed:(id)a3 workerQueueBlockAndWait:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[NSThread isMainThread])
  {
    uint64_t v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_8F950();
    }
  }
  os_signpost_id_t v9 = BCSignpostLibrary();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = BCSignpostLibrary();
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_EVENT, v10, "WorkerQueueSyncScheduled", "%{public}@", buf, 0xCu);
  }

  id v13 = [(BKLibraryManager *)self workerChildContext];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_E3C0;
  v16[3] = &unk_D17E8;
  id v18 = self;
  id v19 = v7;
  id v17 = v6;
  id v14 = v7;
  id v15 = v6;
  [v13 performBlockAndWait:v16];
}

- (void)performBlockInUIContext:(id)a3
{
}

- (void)performBlockInUIContext:(id)a3 completion:(id)a4
{
  os_signpost_id_t v10 = (void (**)(id, void *))a3;
  id v6 = a4;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  if (v10)
  {
    id v7 = [(BKLibraryManager *)self uiChildContext];
    v10[2](v10, v7);
  }
  else
  {
    BCReportAssertionFailureWithMessage();
    id v7 = [(BKLibraryManager *)self uiChildContext];
  }
  if ([v7 hasChanges])
  {
    [v7 setSaveContext:2];
    [v7 save:0];
  }
  id v8 = objc_retainBlock(v6);
  os_signpost_id_t v9 = v8;
  if (v8) {
    (*((void (**)(id))v8 + 2))(v8);
  }
}

- (void)performBackgroundReadOnlyBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BKLibraryManager *)self backgroundReadOnlyContextPool];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_E790;
    v6[3] = &unk_D1860;
    id v7 = v4;
    [v5 performReadOnlyBlock:v6];
  }
}

- (void)performBackgroundReadOnlyBlockAndWait:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(BKLibraryManager *)self backgroundReadOnlyContextPool];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_E880;
    v8[3] = &unk_D1888;
    dispatch_semaphore_t v9 = v5;
    id v10 = v4;
    id v7 = v5;
    [v6 performReadOnlyBlock:v8];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (id)newManagedObjectContextWithClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryManager;
  return [(BKLibraryManager *)&v4 newManagedObjectContextWithClass:a3];
}

- (BOOL)hasBooks
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v3 = [(BKLibraryManager *)self uiChildContext];
  unint64_t v4 = +[BKLibraryManager numberOfLibraryAssetsInManagdObjectContext:v3];

  return v4 != 0;
}

- (void)checkOwnedSingleBookSeriesWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v25 = self;
  id v6 = [(id)objc_opt_class() predicateForOwnedSingleAssetSeries];
  [v5 setPredicate:v6];

  [v5 setReturnsDistinctResults:1];
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  id v38 = 0;
  uint64_t v26 = v5;
  id v27 = v4;
  dispatch_semaphore_t v9 = [v4 executeFetchRequest:v5 error:&v38];
  id v28 = v38;
  id v10 = [v9 bu_arrayByRemovingNSNulls];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v16 = [v15 seriesID:v25];

        if (v16)
        {
          objc_opt_class();
          id v17 = [v15 seriesBooks];
          id v18 = [v17 anyObject];
          id v19 = BUDynamicCast();

          LODWORD(v18) = [v19 isAudiobook];
          id v20 = [v15 seriesID];
          if (v18) {
            id v21 = v8;
          }
          else {
            id v21 = v7;
          }
          [v21 addObject:v20];
        }
        else
        {
          id v19 = BKLibraryLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            long long v40 = v15;
            _os_log_debug_impl(&dword_0, v19, OS_LOG_TYPE_DEBUG, "Series with single asset has no seriesID: %@", buf, 0xCu);
          }
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v12);
  }

  if (v28)
  {
    long long v22 = BKLibraryLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_8F990();
    }
  }
  else
  {
    id v23 = +[BUBag defaultBag];
    id v24 = [v23 seriesInfoUpdateIntervalEnabled];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_ED1C;
    v30[3] = &unk_D18B0;
    long long v31 = v7;
    id v32 = v8;
    id v33 = v25;
    [v24 valueWithCompletion:v30];

    long long v22 = v31;
  }
}

- (void)checkNonSeriesAudiobooksWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v6 = +[BKLibraryManager predicateForAssetsInCollectionID:kBKCollectionDefaultIDAudiobooks allowExplicit:1];
  id v7 = +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != %@ AND seriesContainer == NULL", @"storeID", @"contentType", &off_D9E30];
  v25[0] = v6;
  v25[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v25 count:2];
  dispatch_semaphore_t v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  [v5 setPredicate:v9];

  [v5 setReturnsDistinctResults:1];
  CFStringRef v24 = @"storeID";
  id v10 = +[NSArray arrayWithObjects:&v24 count:1];
  [v5 setPropertiesToFetch:v10];

  [v5 setResultType:2];
  id v21 = 0;
  id v11 = [v4 executeFetchRequest:v5 error:&v21];

  id v12 = v21;
  uint64_t v13 = [v11 valueForKey:@"storeID"];

  if (v12)
  {
    id v14 = BKLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_8FA60();
    }
  }
  else
  {
    id v15 = +[NSUserDefaults standardUserDefaults];
    id v16 = [v15 integerForKey:@"SeriesMigrationVersion"];

    BOOL v17 = v16 == 0;
    if (v13) {
      id v18 = v13;
    }
    else {
      id v18 = &__NSArray0__struct;
    }
    uint64_t v22 = BKSeriesManagerAssetTypeAudiobooks;
    id v23 = v18;
    id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v19 = [(BKLibraryManager *)self seriesManager];
    [v19 updateSeriesForAssetAdamIDsWithTypes:v14 forceCheck:v17];

    id v20 = +[NSUserDefaults standardUserDefaults];
    [v20 setInteger:1 forKey:@"SeriesMigrationVersion"];
  }
}

- (void)wq_dq_saveDatabaseContext:(id)a3
{
  id v4 = a3;
  id v5 = self->_dqSyncQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v5);
  }

  [(BKLibraryManager *)self _resetAuthorsAndStacksInContext:v4];
  if ([v4 hasChanges])
  {
    id v6 = [(BKLibraryManager *)self wq_seriesIDsToResetWithLibraryManagedObjectContext:v4];
    id v7 = [(BKLibraryManager *)self collectionController];
    id v8 = [v7 gatherChangedAssetsCollectionsWithLibraryMoc:v4];
    [(BKLibraryManager *)self saveManagedObjectContext:v4];
    [v7 processGatheredChangedAssetsCollections:v8];
    dispatch_semaphore_t v9 = BKLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
      id v11 = [v6 allObjects];
      id v12 = [v11 bu_prettyDescription];
      *(_DWORD *)buf = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "wq_dq_saveDatabaseContext: reseting %@ seriesIDs: %@", buf, 0x16u);
    }
    [(BKLibraryManager *)self _resetSeriesIDs:v6];
  }
  else
  {
    uint64_t v13 = BKLibraryLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_8FAC8();
    }

    if ([(BKLibraryManager *)self resetSeriesOnAllBooks]) {
      [(BKLibraryManager *)self _resetSeriesIDs:0];
    }
  }
  if (![(BKLibraryManager *)self hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_F40C;
    v14[3] = &unk_D16B0;
    v14[4] = self;
    [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v14];
    [(BKLibraryManager *)self setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks:1];
  }
}

- (void)_updateAuthorForSeriesContainer:(id)a3
{
  id v4 = a3;
  id v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 assetID];
    int v13 = 141558274;
    uint64_t v14 = 1752392040;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "_updateAuthorForSeriesContainer: %{mask.hash}@", (uint8_t *)&v13, 0x16u);
  }
  id v7 = [v4 managedObjectContext];
  id v8 = [v4 seriesID];
  dispatch_semaphore_t v9 = [(BKLibraryManager *)self _rawSeriesAuthorForContainerID:v8 context:v7];

  id v10 = [v4 seriesID];
  id v11 = [(BKLibraryManager *)self _rawSeriesSortAuthorForContainerID:v10 context:v7];

  if (![v11 length] && -[__CFString length](v9, "length")) {
    goto LABEL_13;
  }
  if ([v11 length] && !-[__CFString length](v9, "length"))
  {
    id v12 = v11;
    id v11 = v9;
    goto LABEL_15;
  }
  if (![v11 length] && !-[__CFString length](v9, "length"))
  {

    id v11 = v9;
    dispatch_semaphore_t v9 = @"UnknownAuthor";
    goto LABEL_16;
  }
  if ([v11 isEqualToString:@"UnknownAuthor"]
    || [v11 isEqualToString:@"MultipleAuthors"]
    && ([(__CFString *)v9 isEqualToString:@"MultipleAuthors"] & 1) == 0)
  {
LABEL_13:
    id v12 = v9;
LABEL_15:
    dispatch_semaphore_t v9 = v12;
LABEL_16:

    id v11 = v9;
  }
  [v4 setDifferentString:v9 forKey:@"author"];
  [v4 setDifferentString:v11 forKey:@"sortAuthor"];
}

- (void)_resetNilAuthorsOnAllBooksInContext:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  id v5 = +[NSPredicate predicateWithFormat:@"sortAuthor == %@ AND contentType != %@", @"UnknownAuthor", &off_D9E30];
  [v4 setPredicate:v5];

  [v4 setFetchBatchSize:64];
  id v6 = [v3 executeFetchRequest:v4 error:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 author];
        unsigned __int8 v13 = [v12 isEqualToString:@"UnknownAuthor"];

        if ((v13 & 1) == 0)
        {
          uint64_t v14 = [v11 author];
          [v11 setSortAuthor:v14];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)_resetNilAuthorsOnAllSeriesInContext:(id)a3
{
  id v4 = a3;
  [v4 save:0];
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  id v6 = +[NSPredicate predicateWithFormat:@"author == %@ AND contentType == %@", @"UnknownAuthor", &off_D9E30];
  [v5 setPredicate:v6];

  [v5 setFetchBatchSize:64];
  id v7 = [v4 executeFetchRequest:v5 error:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(BKLibraryManager *)self _updateAuthorForSeriesContainer:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_resetAuthorsAndStacksInContext:(id)a3
{
  id v5 = a3;
  if ([(BKLibraryManager *)self needsResetNilAuthorsOnAllBooks])
  {
    [(BKLibraryManager *)self setNeedsResetNilAuthorsOnAllBooks:0];
    [(BKLibraryManager *)self _resetNilAuthorsOnAllBooksInContext:v5];
  }
  if ([(BKLibraryManager *)self needsResetNilAuthorsOnAllSeries])
  {
    [(BKLibraryManager *)self setNeedsResetNilAuthorsOnAllSeries:0];
    [(BKLibraryManager *)self _resetNilAuthorsOnAllSeriesInContext:v5];
  }
  if ([(BKLibraryManager *)self needsResetSeriesStacksAndCollectionMembershipOnAllBooks])
  {
    [(BKLibraryManager *)self setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:0];
    id v4 = [(BKLibraryManager *)self collectionManager];
    [v4 resetCollections];
  }
  if ([(BKLibraryManager *)self needsDuplicateCollectionMembersRemoved])
  {
    [(BKLibraryManager *)self setNeedsDuplicateCollectionMembersRemoved:0];
    [(BKLibraryManager *)self _removeDuplicateCollectionMembers];
  }
}

- (void)_removeDuplicateCollectionMembers
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_FB44;
  v2[3] = &unk_D16B0;
  v2[4] = self;
  [(BKLibraryManager *)self performBlockOnCollectionsWorkerQueue:v2];
}

- (id)wq_seriesIDsToResetWithLibraryManagedObjectContext:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  id v5 = [v3 updatedObjects];
  [v4 unionSet:v5];

  id v6 = [v3 insertedObjects];
  [v4 unionSet:v6];

  id v7 = [v3 deletedObjects];
  [v4 unionSet:v7];

  id v8 = +[NSMutableSet set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v15 = [v14 seriesID:v18];

          if (v15)
          {
            long long v16 = [v14 seriesID];
            [v8 addObject:v16];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)_resetSeriesIDs:(id)a3
{
  id v8 = a3;
  id v4 = [(BKLibraryManager *)self usq_moc];

  if (!v4) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = [(BKLibraryManager *)self usq_moc];

  id v7 = v8;
  if (v5)
  {
    id v6 = [(BKLibraryManager *)self seriesUpdaterResetWithIDs:v8];
    id v7 = v8;
  }

  _objc_release_x1(v6, v7);
}

- (NSDictionary)_persistentStoreOptions
{
  v4[0] = NSMigratePersistentStoresAutomaticallyOption;
  v4[1] = NSInferMappingModelAutomaticallyOption;
  v5[0] = &__kCFBooleanTrue;
  v5[1] = &__kCFBooleanTrue;
  id v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return (NSDictionary *)v2;
}

- (void)createSeriesUpdaterMoc
{
  if (self->_ui_persistentStoreCoordinator)
  {
    id v3 = [[BKLibraryManagedObjectContext alloc] initWithConcurrencyType:1];
    [(BKLibraryManager *)self setUsq_moc:v3];

    id v4 = [(BKLibraryManager *)self usq_moc];

    if (!v4) {
      BCReportAssertionFailureWithMessage();
    }
    id v5 = [(BKLibraryManager *)self usq_moc];
    [v5 setName:@"Series Updater Context"];

    id v6 = [(BKLibraryManager *)self usq_moc];
    [v6 setPersistentStoreCoordinator:self->_ui_persistentStoreCoordinator];

    id v7 = [(BKLibraryManager *)self usq_moc];
    [v7 setUndoManager:0];

    id v8 = [(BKLibraryManager *)self usq_moc];
    [v8 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];

    id v10 = +[NSNotificationCenter defaultCenter];
    id v9 = [(BKLibraryManager *)self usq_moc];
    [v10 addObserver:self selector:"seriesUpdaterMocObjectsDidChange:" name:NSManagedObjectContextDidSaveNotification object:v9];
  }
}

- (void)seriesUpdaterMocObjectsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  long long v17 = v6;
  id v7 = +[NSArray arrayWithObjects:&v17 count:1];
  +[NSManagedObjectContext mergeChangesFromRemoteContextSave:v5 intoContexts:v7];

  id v8 = [v4 userInfo];
  id v9 = [(BKLibraryManager *)self workerChildContext];
  long long v16 = v9;
  id v10 = +[NSArray arrayWithObjects:&v16 count:1];
  +[NSManagedObjectContext mergeChangesFromRemoteContextSave:v8 intoContexts:v10];

  id v11 = self->_uiChildContext;
  if (v11)
  {
    uint64_t v12 = [v4 userInfo];
    long long v15 = v11;
    long long v13 = +[NSArray arrayWithObjects:&v15 count:1];
    +[NSManagedObjectContext mergeChangesFromRemoteContextSave:v12 intoContexts:v13];
  }
  long long v14 = [(BKLibraryManager *)self backgroundReadOnlyContextPool];
  [v14 remoteContextDidSave:v4];
}

- (void)seriesUpdaterResetWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = [v4 count];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "StackLog: seriesUpdaterResetWithIDs: %lu", buf, 0xCu);
  }

  id v6 = [(BKLibraryManager *)self usq_moc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10734;
  v8[3] = &unk_D1418;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 performBlock:v8];
}

+ (id)persistentStoreURL
{
  id v3 = +[UIApplication applicationDocumentsDirectory];
  id v4 = [a1 persistentStoreName];
  id v5 = [v3 stringByAppendingPathComponent:@"BKLibrary"];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = +[NSURL fileURLWithPath:v6];
  if (!v7)
  {
    id v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_8FDA0();
    }

    id v9 = BKLibraryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_8FD38();
    }

    id v10 = BKLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_8FCD0();
    }

    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8FC68();
    }
  }

  return v7;
}

+ (id)managedObjectModelName
{
  return @"BKLibrary";
}

+ (id)persistentStoreNameSeed
{
  return @"091020131601";
}

+ (id)persistentStoreVersion
{
  return @"1";
}

- (id)newPrivateQueueManagedObjectContext
{
  uint64_t v3 = objc_opt_class();

  return [(BKLibraryManager *)self newPrivateQueueManagedObjectContextWithClass:v3];
}

- (id)newManagedObjectContext
{
  uint64_t v3 = BKLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8FDD4();
  }

  id v4 = [(BKLibraryManager *)self newManagedObjectContextWithClass:objc_opt_class()];
  [v4 setLibraryManager:self];
  return v4;
}

- (void)queryRootFolderShorthandsWithRegistrationBlock:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BKLibraryManager *)self dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 buildRootFolderShorthandMapCompletion:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

+ (id)migrationService
{
  return 0;
}

- (void)triggerCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  id v7 = v5;
  if (v3) {
    CFStringRef v6 = @"BKTriggerCloudSyncSetNotification";
  }
  else {
    CFStringRef v6 = @"BKTriggerCloudSyncGetNotification";
  }
  [v5 postNotificationName:v6 object:self userInfo:0];
}

- (void)logCounts
{
  BOOL v3 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollection"];
  id v4 = +[NSPredicate predicateWithValue:1];
  [v3 setPredicate:v4];

  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  CFStringRef v6 = +[NSPredicate predicateWithValue:1];
  [v5 setPredicate:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_12424;
  v9[3] = &unk_D18D8;
  id v10 = v3;
  id v11 = v5;
  id v7 = v5;
  id v8 = v3;
  [(BKLibraryManager *)self performNamed:@"logCounts" workerQueueBlock:v9];
}

- (void)migrateLibraryIfNeeded
{
  if ([(BKLibraryManager *)self needsMigration])
  {
    [(BKLibraryManager *)self _migrateFromOldDatabase];
    [(BKLibraryManager *)self setNeedsMigration:0];
  }
}

- (void)cleanupDefaultCollections
{
  BOOL v3 = [(BKLibraryManager *)self collectionController];
  [v3 cleanupDefaultCollections];

  id v4 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12DEC;
  block[3] = &unk_D1520;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)cleanupDateFinished
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_12EFC;
  v2[3] = &unk_D16B0;
  v2[4] = self;
  [(BKLibraryManager *)self performBlockInUIContext:v2];
}

- (void)reloadWithCompletion:(id)a3
{
  id v4 = a3;
  coalescedLibraryReload = self->_coalescedLibraryReload;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13194;
  v7[3] = &unk_D1900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BUCoalescingCallBlock *)coalescedLibraryReload signalWithCompletion:v7];
}

- (void)_reloadWithCompletion:(id)a3
{
  id v4 = a3;
  if (qword_EE5C0 != -1) {
    dispatch_once(&qword_EE5C0, &stru_D1920);
  }
  id v5 = qword_EE5B8;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13378;
  v7[3] = &unk_D1548;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_performReload
{
  BOOL v3 = BKLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%p: Library Reload: Start", buf, 0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1360C;
  v4[3] = &unk_D16B0;
  v4[4] = self;
  [(BKLibraryManager *)self performNamed:@"reload" workerQueueBlockAndWait:v4];
}

- (id)assetIDsInDataSourceWithIdentifier:(id)a3 intersectingWithAssetIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = (id)objc_opt_new();
  id v8 = [(NSDictionary *)self->_dataSourcesByIdentifier objectForKeyedSubscript:v6];
  if (v8)
  {
    id v20 = v7;
    id v21 = v6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          long long v14 = [(BKLibraryManager *)self dataSources];
          id v15 = [v14 indexOfObjectIdenticalTo:v8];
          if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v16 = 0;
          }
          else {
            uint64_t v16 = 1 << (char)v15;
          }

          long long v17 = [(BKLibraryManager *)self assetUpdatesByIdentifier];
          long long v18 = [v17 objectForKeyedSubscript:v13];

          if (((unint64_t)[v18 dataSourcesBitmask] & v16) != 0) {
            [v23 addObject:v13];
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    id v7 = v20;
    id v6 = v21;
  }

  return v23;
}

- (void)setUIManagerProviderForAddingToWantToReadBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryManager *)self collectionManager];
  [v5 setUiManagerProviderForAddingToWantToRead:v4];
}

- (void)_enumerateDataSources:(id)a3 intersectingWithAssetIDs:(id)a4 usingBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_13E34;
    v10[3] = &unk_D1948;
    v10[4] = self;
    id v11 = v8;
    id v12 = v9;
    [a3 enumerateObjectsUsingBlock:v10];
  }
}

- (void)reloadDataSource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = sub_89D0;
  long long v18 = sub_89E0;
  id v19 = 0;
  id v8 = [(BKLibraryManager *)self coalescedDataSourceReloadByIdentifierSync];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1413C;
  block[3] = &unk_D1998;
  id v9 = v6;
  id v12 = self;
  uint64_t v13 = &v14;
  id v11 = v9;
  dispatch_sync(v8, block);

  [(id)v15[5] signalWithCompletion:v7];
  _Block_object_dispose(&v14, 8);
}

- (void)_reloadDataSource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = +[NSString stringWithFormat:@"reload(%@)", v8];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_14504;
  v12[3] = &unk_D19C0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(BKLibraryManager *)self _scheduleOperationGroupWithName:v9 block:v12];
}

- (void)_performReloadDataSource:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_145DC;
  v8[3] = &unk_D1B28;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(BKLibraryManager *)self performNamed:@"reloadDataSource" workerQueueBlock:v8];
}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [(BKLibraryManager *)self dataSources];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * i) canImportURL:v8 openInPlace:v6 options:v9])
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (void)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v21 = a6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = [(BKLibraryManager *)self dataSources];
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v27 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
      if ([v17 canImportURL:v10 openInPlace:v8 options:v11])
      {
        unsigned __int8 v18 = [v10 startAccessingSecurityScopedResource];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_15D10;
        v22[3] = &unk_D1BA0;
        v22[4] = self;
        unsigned __int8 v25 = v18;
        id v19 = v10;
        id v23 = v19;
        id v24 = v21;
        unsigned __int8 v20 = [v17 importURL:v19 openInPlace:v8 options:v11 completion:v22];

        if (v20) {
          break;
        }
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)clearAgingDocumentInbox
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(BKLibraryManager *)self dataSources];
  BOOL v3 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = BUProtocolCast();
        if (v7)
        {
          BOOL v8 = v7;
          [v7 clearAgingDocumentInbox];

          goto LABEL_11;
        }
      }
      id v4 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)earliestPurchaseTimestampWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_1616C;
  v5[3] = &unk_D1BC8;
  id v6 = a3;
  id v4 = v6;
  [(BKLibraryManager *)self performBlockOnWorkerQueue:v5];
}

- (void)prioritizeImport:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v8 = [(BKLibraryManager *)self dataSources];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v12);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_16600;
        v15[3] = &unk_D1BF0;
        id v14 = v7;
        void v15[4] = self;
        id v16 = v14;
        LODWORD(v13) = [v13 prioritizeImport:v6 completion:v15];

        if (v13)
        {

          goto LABEL_12;
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_12:
}

- (void)updateURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v8 = [(BKLibraryManager *)self dataSources];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_16878;
      v14[3] = &unk_D1C68;
      v14[4] = self;
      id v15 = v7;
      LOBYTE(v13) = [v13 updateURL:v6 completion:v14];

      if (v13) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)updateAsset:(id)a3 fromURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 dataSourceIdentifier];
  uint64_t v12 = [(BKLibraryManager *)self dataSourceWithIdentifier:v11];

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_3;
  }
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  long long v16 = sub_16C0C;
  long long v17 = &unk_D1C68;
  long long v18 = self;
  id v19 = v10;
  unsigned __int8 v13 = [v12 updateAsset:v8 fromURL:v9 completion:&v14];

  if ((v13 & 1) == 0) {
LABEL_3:
  }
    -[BKLibraryManager updateURL:completion:](self, "updateURL:completion:", v9, v10, v14, v15, v16, v17, v18);
}

- (void)updateAsset:(id)a3 coverArt:(id)a4 completion:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [(BKLibraryManager *)self dataSources];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
      if (objc_opt_respondsToSelector())
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_17040;
        v18[3] = &unk_D1CE0;
        v18[4] = self;
        id v19 = v9;
        unsigned __int8 v16 = [v15 updateAsset:v17 coverArt:v8 completion:v18];

        if (v16) {
          break;
        }
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)updateAssetWithID:(id)a3 url:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_173B4;
  v7[3] = &unk_D1D08;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(BKLibraryManager *)v8 performBlockOnWorkerQueue:v7];
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_175C8;
  v18[3] = &unk_D1C68;
  v18[4] = self;
  id v7 = a4;
  id v19 = v7;
  id v8 = objc_retainBlock(v18);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = [(BKLibraryManager *)self dataSources];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) examineURL:v6 completion:v8])
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v10;
}

- (void)resolveLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(BKResolveLibraryAssetOptions);
  [(BKLibraryManager *)self resolveLibraryAsset:v7 options:v8 completion:v6];
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  long long v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  long long v16 = sub_1789C;
  long long v17 = &unk_D1D58;
  long long v18 = self;
  id v19 = a5;
  id v8 = v19;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_retainBlock(&v14);
  id v12 = [v10 dataSourceIdentifier:v14, v15, v16, v17, v18];
  uint64_t v13 = [(BKLibraryManager *)self dataSourceWithIdentifier:v12];

  [v13 resolveLibraryAsset:v10 options:v9 completion:v11];
}

- (void)_addDataSourceIdentifierAndStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryManager *)self ownershipSync];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_17AA8;
  v7[3] = &unk_D1418;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_removeDataSourceIdentifierAndStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryManager *)self ownershipSync];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_17C4C;
  v7[3] = &unk_D1418;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_notifyDataSourceIdentifierAndStateObserversForAssetIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(BKLibraryManager *)self ownershipSync];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17DE8;
  block[3] = &unk_D1A38;
  id v10 = v4;
  uint64_t v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, block);

  [v7 enumerateKeysAndObjectsUsingBlock:&stru_D1D98];
}

- (void)toggleDownloadPausedForAsset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 isDownloading])
  {
    id v6 = [(BKLibraryManager *)self dataSourcesConformingToProtocol:&OBJC_PROTOCOL___BKBookDownloadController];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
          id v12 = [v5 assetID];
          uint64_t v13 = [v5 temporaryAssetID];
          [v11 togglePausedForAssetID:v12 orTemporaryAssetID:v13];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)cancelDownloadingAsset:(id)a3
{
  id v4 = a3;
  if ([v4 isDownloading])
  {
    id v5 = [(BKLibraryManager *)self dataSourcesConformingToProtocol:&OBJC_PROTOCOL___BKBookDownloadController];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
          uint64_t v11 = [v4 permanentOrTemporaryAssetID];
          [v10 cancelDownloadForAssetID:v11];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)resolveToLocalAssetWithAssetID:(id)a3 completion:(id)a4
{
}

- (void)waitForAssetToFinishDownloadWithAssetID:(id)a3 completion:(id)a4
{
}

- (void)waitForAssetToFinishDownloadWithAssetID:(id)a3 resolveAsset:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = BKLibraryLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] waitForAssetToFinishDownloadWithAssetID", buf, 0x16u);
  }

  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  objc_initWeak(&location, self);
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18930;
  block[3] = &unk_D1DE8;
  objc_copyWeak(&v45, &location);
  id v11 = v7;
  id v43 = v11;
  id v29 = v8;
  id v44 = v29;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  long long v12 = [(BKLibraryManager *)self libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:v11];
  long long v13 = BKLibraryLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [v12 isCloud];
    unsigned int v15 = [v12 isDownloading];
    unsigned int v16 = [v12 isSeriesItem];
    unsigned int v17 = [v12 isStoreItem];
    unsigned int v18 = [v12 isLocal];
    *(_DWORD *)buf = 141559810;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    __int16 v49 = v12;
    __int16 v50 = 1024;
    unsigned int v51 = v14;
    __int16 v52 = 1024;
    unsigned int v53 = v15;
    __int16 v54 = 1024;
    unsigned int v55 = v16;
    __int16 v56 = 1024;
    unsigned int v57 = v17;
    __int16 v58 = 1024;
    unsigned int v59 = v18;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] waitForAssetToFinishDownloadWithAssetID: libraryAsset=%@, isCloud=%d, isDownloading=%d, isSeriesItem=%d, isStoreItem=%d, isLocal=%d", buf, 0x3Eu);
  }

  if (!v12)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v49) = 0;
    dispatch_group_enter(v10);
LABEL_21:
    long long v23 = [BKLibraryDataSourceIdentifierAndStateObserver alloc];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_18AA8;
    v33[3] = &unk_D1E38;
    objc_copyWeak(&v37, &location);
    id v34 = v11;
    long long v36 = buf;
    long long v35 = v10;
    id v24 = [(BKLibraryDataSourceIdentifierAndStateObserver *)v23 initWithAssetID:v34 notify:v33];
    [(BKLibraryManager *)self _addDataSourceIdentifierAndStateObserver:v24];

    objc_destroyWeak(&v37);
    _Block_object_dispose(buf, 8);
    goto LABEL_22;
  }
  if (([v12 isCloud] & 1) != 0
    || ([v12 isDownloading] & 1) != 0
    || ([v12 isSeriesItem] & 1) != 0
    || [v12 isStoreItem])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v49) = 0;
    dispatch_group_enter(v10);
    [(BKLibraryManager *)self dataSourcesConformingToProtocol:&OBJC_PROTOCOL___BKBookDownloadController];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v39;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * i) resumeDownloadForAssetID:v11];
        }
        id v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v20);
    }

    goto LABEL_21;
  }
LABEL_22:
  if (v12 && v6)
  {
    unsigned __int8 v25 = BKLibraryLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      *(void *)&uint8_t buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] waitForAssetToFinishDownloadWithAssetID : attempt to resolve asset", buf, 0x16u);
    }

    long long v26 = [v12 dataSourceIdentifier];
    long long v27 = [(BKLibraryManager *)self dataSourceWithIdentifier:v26];

    long long v28 = objc_alloc_init(BKResolveLibraryAssetOptions);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_18CE8;
    v31[3] = &unk_D1E60;
    id v32 = v10;
    [v27 resolveLibraryAsset:v12 options:v28 completion:v31];
  }
  else
  {
    dispatch_group_leave(v10);
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dataSourceIdentifier];
  uint64_t v9 = [(BKLibraryManager *)self dataSourceWithIdentifier:v8];

  if (v9
    || ([v6 dataSourceIdentifier],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v11 = [v10 isEqual:@"com.apple.ibooks.plugin.Bookshelf.platformDataSource.BookKit"], v10, v11)&& (-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", @"com.apple.ibooks.datasource.BookKit"), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_18E78;
    v14[3] = &unk_D1C68;
    v14[4] = self;
    id v15 = v7;
    [v9 assetForLibraryAsset:v6 completion:v14];
  }
  else
  {
    long long v12 = BKLibraryLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_90150();
    }

    id v13 = objc_retainBlock(v7);
    uint64_t v9 = v13;
    if (v13) {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    }
  }
}

- (void)assetPartsForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_89D0;
  v36[4] = sub_89E0;
  id v37 = 0;
  uint64_t v9 = [v6 assetID];
  id v10 = dispatch_group_create();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unsigned int v11 = [(BKLibraryManager *)self dataSources];
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v38 count:16];
  id v20 = (void *)v9;
  uint64_t v21 = v7;
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v10);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_19300;
          v27[3] = &unk_D1EB0;
          v27[4] = self;
          id v28 = v8;
          id v29 = v15;
          id v30 = v10;
          long long v31 = v36;
          [v15 assetPartsForLibraryAsset:v6 completion:v27];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v12);
  }

  unsigned int v16 = [(BKLibraryManager *)self completionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19494;
  block[3] = &unk_D1ED8;
  id v23 = v8;
  id v24 = v20;
  long long v26 = v36;
  id v25 = v21;
  id v17 = v21;
  id v18 = v20;
  id v19 = v8;
  dispatch_group_notify(v10, v16, block);

  _Block_object_dispose(v36, 8);
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4
{
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_199CC;
  v16[3] = &unk_D1F00;
  objc_copyWeak(&v19, &location);
  id v10 = v9;
  id v18 = v10;
  id v11 = v8;
  id v17 = v11;
  BOOL v20 = a4;
  id v12 = objc_retainBlock(v16);
  uint64_t v13 = [(BKLibraryManager *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(BKLibraryManager *)self delegate];
    [v15 willDeleteAssets:v11 completion:v12];
  }
  else
  {
    ((void (*)(void *))v12[2])(v12);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)p_deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (![v8 count])
  {
LABEL_11:
    id v15 = objc_retainBlock(v9);
    unsigned int v16 = v15;
    if (v15) {
      (*((void (**)(id))v15 + 2))(v15);
    }

    goto LABEL_40;
  }
  if (v6)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v10 = [(BKLibraryManager *)self dataSources];
    id v11 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v48;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * i) deleteAssets:v8 exhaustive:1 completion:0];
        }
        id v12 = [v10 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v12);
    }

    goto LABEL_11;
  }
  id v37 = v9;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  long long v38 = +[NSMutableArray array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v18 = v8;
  id v19 = [v18 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(id *)(*((void *)&v43 + 1) + 8 * (void)j);
        if ([v23 isValid])
        {
          id v24 = [v23 dataSourceIdentifier];
          if (v24)
          {
            id v25 = [v17 objectForKey:v24];
            if (!v25)
            {
              id v25 = +[NSMutableArray array];
              [v17 setObject:v25 forKey:v24];
            }
            [v25 addObject:v23];
          }
          else
          {
            long long v26 = BKLibraryLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v53 = v23;
              _os_log_debug_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "Library asset has nil dataSourceIdentifier {%@}", buf, 0xCu);
            }

            [v38 addObject:v23];
          }
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v20);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v27 = [v17 allKeys];
  id v28 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v39 + 1) + 8 * (void)k);
        long long v33 = [v17 objectForKey:v32];
        long long v34 = [(BKLibraryManager *)self dataSourceWithIdentifier:v32];
        [v34 deleteAssets:v33 exhaustive:0 completion:0];
      }
      id v29 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v29);
  }

  [(BKLibraryManager *)self p_deleteAssets:v38];
  id v9 = v37;
  id v35 = objc_retainBlock(v37);
  long long v36 = v35;
  if (v35) {
    (*((void (**)(id))v35 + 2))(v35);
  }

LABEL_40:
}

- (void)p_deleteAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 valueForKey:@"assetID"];
    BOOL v6 = [v4 valueForKey:@"temporaryAssetID"];
    id v7 = [v6 allObjects];

    if (![v7 count])
    {

      id v7 = 0;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_19F84;
    v10[3] = &unk_D1D08;
    v10[4] = self;
    id v11 = v5;
    id v12 = v7;
    id v8 = v7;
    id v9 = v5;
    [(BKLibraryManager *)self performNamed:@"delete" workerQueueBlock:v10];
  }
}

- (void)managedBooksDidChange
{
  BOOL v3 = [(BKLibraryManager *)self dataSourceConformingToProtocol:&OBJC_PROTOCOL___BKRespondsToManagedBooksChange];
  objc_initWeak(&location, v3);

  id v4 = objc_loadWeakRetained(&location);
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    [(BKLibraryManager *)self reloadDataSource:v5 completion:0];
  }
  objc_destroyWeak(&location);
}

- (id)dataSourceWithIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(BKLibraryManager *)self dataSourcesByIdentifier];
    BOOL v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)dataSourceConformingToProtocol:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A310;
  v7[3] = &unk_D1F28;
  id v8 = a3;
  id v4 = v8;
  id v5 = [(BKLibraryManager *)self _dataSourceMatchingPredicate:v7];

  return v5;
}

- (id)dataSourcesConformingToProtocol:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A3CC;
  v7[3] = &unk_D1F28;
  id v8 = a3;
  id v4 = v8;
  id v5 = [(BKLibraryManager *)self _dataSourcesMatchingPredicate:v7];

  return v5;
}

- (void)dq_libraryDataSource:(id)a3 reconcileAssets:(id)a4 reason:(signed __int16)a5
{
  int v37 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = self->_dqSyncQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v9);
  }

  id v10 = BKLibraryLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    id v12 = [v7 identifier];
    *(_DWORD *)buf = 138412546;
    long long v47 = v11;
    __int16 v48 = 2112;
    long long v49 = v12;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "#datasource reconcileAssets: reconciling %@ assets for: %@", buf, 0x16u);
  }
  uint64_t v13 = [(BKLibraryManager *)self assetUpdatesByIdentifier];
  if (objc_opt_respondsToSelector()) {
    id v35 = [v7 propagateDataProperties];
  }
  else {
    id v35 = 0;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  id v40 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v42;
    long long v34 = v13;
    do
    {
      char v14 = 0;
      do
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v14);
        unsigned int v16 = [v15 assetID];
        id v17 = [v15 temporaryAssetID];
        if (v16)
        {
          id v18 = [v13 objectForKeyedSubscript:v16];
          if (v18) {
            goto LABEL_20;
          }
        }
        else
        {
          id v18 = 0;
        }
        if (v17)
        {
          id v18 = [v13 objectForKeyedSubscript:v17];
        }
LABEL_20:
        if (v16)
        {
          id v19 = [(BKLibraryManager *)self unclaimedAssetIDs];
          [v19 removeObject:v16];

          if (v17)
          {
LABEL_24:
            id v20 = [(BKLibraryManager *)self unclaimedTemporaryAssetIDs];
            [v20 removeObject:v17];
          }
          int v21 = 1;
          goto LABEL_26;
        }
        if (v17) {
          goto LABEL_24;
        }
        BCReportAssertionFailureWithMessage();
        int v21 = 0;
LABEL_26:
        long long v22 = [v15 dataSourceIdentifier];

        if (v22)
        {
          if (!v21) {
            goto LABEL_45;
          }
        }
        else
        {
          BCReportAssertionFailureWithMessage();
          if (!v21) {
            goto LABEL_45;
          }
        }
        id v23 = [(BKLibraryManager *)self dataSources];
        id v24 = [v23 indexOfObjectIdenticalTo:v7];
        if (v24 == (id)0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v25 = 0;
        }
        else {
          unint64_t v25 = 1 << (char)v24;
        }

        if (v18)
        {
          id v26 = v7;
          uint64_t v27 = _bk_compareBitmaskPriority(v25, [(BKLibraryAssetUpdate *)v18 dataSourcesBitmask]);
          id v28 = [(BKLibraryAssetUpdate *)v18 asset];

          BOOL v30 = v37 == 4 && v28 == 0;
          if (v27 != -1 || v30) {
            [(BKLibraryAssetUpdate *)v18 setAsset:v15];
          }
          [(BKLibraryManager *)self _addBitmask:v25 toUpdate:v18 inMethod:a2];
          [(BKLibraryAssetUpdate *)v18 setPropertiesToPropagate:v35];
          [(BKLibraryAssetUpdate *)v18 propagateAdditionalDataWithAsset:v15];
          id v7 = v26;
          uint64_t v13 = v34;
          if (!v16) {
            goto LABEL_43;
          }
LABEL_42:
          [v13 setObject:v18 forKeyedSubscript:v16];
          long long v31 = [(BKLibraryManager *)self identifiersForAssetsNeedingReconcile];
          [v31 addObject:v16];

          goto LABEL_43;
        }
        id v18 = [[BKLibraryAssetUpdate alloc] initWithAsset:v15 dataSource:v7 dataSourceBitmask:v25];
        if (v16) {
          goto LABEL_42;
        }
LABEL_43:
        if (v17)
        {
          [v13 setObject:v18 forKeyedSubscript:v17];
          uint64_t v32 = [(BKLibraryManager *)self identifiersForAssetsNeedingReconcile];
          [v32 addObject:v17];
        }
LABEL_45:

        char v14 = (char *)v14 + 1;
      }
      while (v40 != v14);
      id v33 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      id v40 = v33;
    }
    while (v33);
  }
}

- (void)dq_unclaimIdentifiers:(id)a3 forDataSourceBitmask:(unint64_t)a4
{
  id v7 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        uint64_t v13 = [(BKLibraryManager *)self assetUpdatesByIdentifier];
        char v14 = [v13 objectForKeyedSubscript:v12];

        [(BKLibraryManager *)self _removeBitmask:a4 fromUpdate:v14 inMethod:a2];
        if (![v14 dataSourcesBitmask])
        {
          id v15 = [(BKLibraryManager *)self unclaimedAssetIDs];
          [v15 addObject:v12];

          unsigned int v16 = [(BKLibraryManager *)self unclaimedTemporaryAssetIDs];
          [v16 addObject:v12];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)libraryDataSource:(id)a3 removeImagesForAsset:(id)a4
{
  id v5 = a4;
  id v8 = [v5 assetID];
  BOOL v6 = [(BKLibraryManager *)self imageSource];
  id v7 = [v5 temporaryAssetID];

  [v6 removeImagesForAssetID:v8 temporaryAssetID:v7];
}

- (void)libraryDataSource:(id)a3 removedAssets:(id)a4 inGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1AC0C;
  v13[3] = &unk_D1A38;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  [v10 addOperationBlock:v13];
}

- (void)libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5 inGroup:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1ADA0;
  v12[3] = &unk_D1E88;
  v12[4] = self;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v9 = v15;
  id v10 = v14;
  id v11 = v13;
  [a6 addOperationBlock:v12];
}

- (void)_addBitmask:(unint64_t)a3 toUpdate:(id)a4 inMethod:(SEL)a5
{
  id v6 = a4;
  [v6 setDataSourcesBitmask:((unint64_t)[v6 dataSourcesBitmask] | a3)];
}

- (void)_removeBitmask:(unint64_t)a3 fromUpdate:(id)a4 inMethod:(SEL)a5
{
  id v6 = a4;
  [v6 setDataSourcesBitmask:[v6 dataSourcesBitmask] & ~a3];
}

- (void)_libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1AF64;
    v12[3] = &unk_D1F78;
    id v13 = v10;
    id v14 = v11;
    id v15 = v9;
    id v16 = self;
    SEL v17 = a2;
    [(BKLibraryManager *)self performNamed:@"removedAssets" workerQueueBlock:v12];
  }
}

- (void)libraryDataSource:(id)a3 updatedAssets:(id)a4 inGroup:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1BC54;
  v9[3] = &unk_D1A38;
  void v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  id v7 = v11;
  id v8 = v10;
  [a5 addOperationBlock:v9];
}

- (void)_libraryDataSource:(id)a3 updatedAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    kdebug_trace();
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1BD4C;
    v8[3] = &unk_D1D08;
    id v9 = v7;
    id v10 = self;
    id v11 = v6;
    [(BKLibraryManager *)self performNamed:@"updateAssets" workerQueueBlockAndWait:v8];
  }
}

- (void)libraryDataSource:(id)a3 notifyBlock:(id)a4 inGroup:(id)a5
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1EE1C;
    v9[3] = &unk_D1548;
    void v9[4] = self;
    id v10 = v7;
    [a5 addOperationBlock:v9];
  }
}

- (void)addCustomOperationBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1EF60;
    v6[3] = &unk_D1FC8;
    void v6[4] = self;
    id v7 = v4;
    [(BKLibraryManager *)self _scheduleOperationGroupWithName:@"custom-operation" block:v6];
  }
}

- (void)libraryDataSource:(id)a3 addedAssets:(id)a4 inGroup:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1F154;
  v9[3] = &unk_D1A38;
  void v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  id v7 = v11;
  id v8 = v10;
  [a5 addOperationBlock:v9];
}

- (void)_libraryDataSource:(id)a3 addedAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BKLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_9045C(v7);
  }

  if ([v7 count])
  {
    kdebug_trace();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1F280;
    v9[3] = &unk_D1D08;
    void v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(BKLibraryManager *)self performNamed:@"addedAssets" workerQueueBlock:v9];
  }
}

- (void)libraryDataSource:(id)a3 addedAsset:(id)a4 inGroup:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSArray arrayWithObjects:&v12 count:1];

  -[BKLibraryManager libraryDataSource:addedAssets:inGroup:](self, "libraryDataSource:addedAssets:inGroup:", v10, v11, v8, v12);
}

- (void)libraryDataSource:(id)a3 removedAsset:(id)a4 inGroup:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSArray arrayWithObjects:&v12 count:1];

  -[BKLibraryManager libraryDataSource:removedAssets:inGroup:](self, "libraryDataSource:removedAssets:inGroup:", v10, v11, v8, v12);
}

- (void)libraryDataSource:(id)a3 updatedAsset:(id)a4 inGroup:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSArray arrayWithObjects:&v12 count:1];

  -[BKLibraryManager libraryDataSource:updatedAssets:inGroup:](self, "libraryDataSource:updatedAssets:inGroup:", v10, v11, v8, v12);
}

- (void)libraryDataSource:(id)a3 reloadInGroup:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1F6F8;
  v6[3] = &unk_D1418;
  void v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 addOperationBlock:v6];
}

- (void)libraryDataSource:(id)a3 updateWithName:(id)a4 block:(id)a5
{
}

- (void)libraryDataSource:(id)a3 addedAssets:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1F7E0;
  v7[3] = &unk_D1FF0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(BKLibraryManager *)v8 libraryDataSource:v6 updateWithName:@"addedAssets" block:v7];
}

- (void)libraryDataSource:(id)a3 removedAssets:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1F8C0;
  v7[3] = &unk_D1FF0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(BKLibraryManager *)v8 libraryDataSource:v6 updateWithName:@"removedAssets" block:v7];
}

- (void)libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1F9C0;
  v10[3] = &unk_D2018;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(BKLibraryManager *)v11 libraryDataSource:v9 updateWithName:@"removedAssets" block:v10];
}

- (void)libraryDataSource:(id)a3 updatedAssets:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1FAA0;
  v7[3] = &unk_D1FF0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(BKLibraryManager *)v8 libraryDataSource:v6 updateWithName:@"updatedAssets" block:v7];
}

- (void)libraryDataSource:(id)a3 addedAsset:(id)a4
{
  id v9 = a4;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];

  -[BKLibraryManager libraryDataSource:addedAssets:](self, "libraryDataSource:addedAssets:", v7, v8, v9);
}

- (void)libraryDataSource:(id)a3 removedAsset:(id)a4
{
  id v9 = a4;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];

  -[BKLibraryManager libraryDataSource:removedAssets:](self, "libraryDataSource:removedAssets:", v7, v8, v9);
}

- (void)libraryDataSource:(id)a3 updatedAsset:(id)a4
{
  id v9 = a4;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];

  -[BKLibraryManager libraryDataSource:updatedAssets:](self, "libraryDataSource:updatedAssets:", v7, v8, v9);
}

- (void)_notifyLibraryOperationDone:(unint64_t)a3 assetIDs:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[NSArray array];
  }
  id v7 = +[NSNotificationCenter defaultCenter];
  v10[0] = @"BKLibraryOperationType";
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  v10[1] = @"BKLibraryOperationAssetIDs";
  v11[0] = v8;
  v11[1] = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v7 postNotificationName:@"BKLibraryOperationCompleteNotification" object:self userInfo:v9];
}

- (void)setCloudStateOnAssetWithID:(id)a3
{
  id v4 = a3;
  id v7 = [(BKLibraryManager *)self newManagedObjectContext];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NewMOC 11 %s %@", "-[BKLibraryManager setCloudStateOnAssetWithID:]", v4);
  [v7 setName:v5];

  id v6 = [(BKLibraryManager *)self libraryMutableAssetWithAssetID:v4 inManagedObjectContext:v7];

  if (v6)
  {
    if ([v6 state] != 3) {
      [v6 setState:3];
    }
    [v6 setDifferentObject:0 forKey:@"localOnlySeriesItemsParent"];
    [v7 saveLibrary];
  }
}

- (id)existingAssetIDsFromAssetIDs:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_89D0;
  id v14 = sub_89E0;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1FFF0;
  v6[3] = &unk_D2040;
  id v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(BKLibraryManager *)v7 performBackgroundReadOnlyBlockAndWait:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (id)assetIDsOfStoreBookAssets
{
  id v3 = +[NSPredicate predicateWithFormat:@"%K == %@ || %K == %@", @"contentType", &off_D9E60, @"contentType", &off_D9E78];
  id v4 = [(BKLibraryManager *)self assetIDsOfStoreAssetsWithPredicate:v3];

  return v4;
}

- (id)assetIDsOfStoreAudiobookAssets
{
  id v3 = +[NSPredicate predicateWithFormat:@"%K == %@", @"contentType", &off_D9E48];
  id v4 = [(BKLibraryManager *)self assetIDsOfStoreAssetsWithPredicate:v3];

  return v4;
}

- (id)assetIDsOfStoreAssetsWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  CFStringRef v27 = @"assetID";
  id v6 = +[NSArray arrayWithObjects:&v27 count:1];
  [v5 setPropertiesToFetch:v6];

  [v5 setResultType:2];
  id v7 = +[BKLibraryManager predicateForDownloadableStoreLibraryAssets];
  v26[0] = v7;
  v26[1] = v4;
  id v8 = +[NSArray arrayWithObjects:v26 count:2];
  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  [v5 setPredicate:v9];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_89D0;
  v24[4] = sub_89E0;
  id v25 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = sub_89D0;
  long long v22 = sub_89E0;
  id v23 = 0;
  readOnlyChildContext = self->_readOnlyChildContext;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_20430;
  v14[3] = &unk_D2068;
  v14[4] = self;
  id v11 = v5;
  id v15 = v11;
  id v16 = v24;
  SEL v17 = &v18;
  [(BKLibraryManagedObjectContext *)readOnlyChildContext performBlockAndWait:v14];
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v12;
}

- (id)storeIDsOfStoreAssetsWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  CFStringRef v27 = @"storeID";
  id v6 = +[NSArray arrayWithObjects:&v27 count:1];
  [v5 setPropertiesToFetch:v6];

  [v5 setResultType:2];
  id v7 = +[BKLibraryManager predicateForDownloadableStoreLibraryAssets];
  v26[0] = v7;
  v26[1] = v4;
  id v8 = +[NSArray arrayWithObjects:v26 count:2];
  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  [v5 setPredicate:v9];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_89D0;
  v24[4] = sub_89E0;
  id v25 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = sub_89D0;
  long long v22 = sub_89E0;
  id v23 = 0;
  readOnlyChildContext = self->_readOnlyChildContext;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2078C;
  v14[3] = &unk_D2068;
  v14[4] = self;
  id v11 = v5;
  id v15 = v11;
  id v16 = v24;
  SEL v17 = &v18;
  [(BKLibraryManagedObjectContext *)readOnlyChildContext performBlockAndWait:v14];
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v12;
}

- (void)assetIDsOfPurchasedStoreAssets:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_208DC;
  v4[3] = &unk_D2090;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKLibraryManager *)v5 performBackgroundReadOnlyBlock:v4];
}

- (void)storeAssetIDsOfWantToReadWithLimit:(int64_t)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_20B14;
  v7[3] = &unk_D20B8;
  id v8 = a4;
  int64_t v9 = a3;
  id v6 = v8;
  [(BKLibraryManager *)self performBlockOnWorkerQueue:v7];
}

- (id)storeAssetIDsOfWantToReadWithLimit:(int64_t)a3 inMoc:(id)a4
{
  return [(BKLibraryManager *)self storeAssetIDsOfCollectionMembersWithLimit:a3 collectionID:kBKCollectionDefaultIDWantToRead inMoc:a4];
}

- (id)storeAssetIDsOfFinishedCollectionWithLimit:(int64_t)a3 inMoc:(id)a4
{
  id v5 = [objc_opt_class() predicateFor_All_Finished_LibraryAssets];
  id v6 = [(BKLibraryManager *)self assetIDsOfStoreAssetsWithPredicate:v5];

  id v7 = +[NSOrderedSet orderedSetWithArray:v6];

  return v7;
}

- (id)storeAssetIDsOfSamplesCollectionWithLimit:(int64_t)a3 inMoc:(id)a4
{
  return [(BKLibraryManager *)self storeAssetIDsOfCollectionMembersWithLimit:a3 collectionID:kBKCollectionDefaultIDSamples inMoc:a4];
}

- (id)storeAssetIDsOfCollectionMembersWithLimit:(int64_t)a3 collectionID:(id)a4 inMoc:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc((Class)NSFetchRequest);
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  id v12 = [v9 initWithEntityName:v11];

  CFStringRef v35 = @"assetID";
  id v13 = +[NSArray arrayWithObjects:&v35 count:1];
  [v12 setPropertiesToFetch:v13];

  [v12 setResultType:2];
  [v12 setReturnsObjectsAsFaults:0];
  id v14 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:0];
  v34[0] = v14;
  id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:0];
  v34[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v34 count:2];
  [v12 setSortDescriptors:v16];

  SEL v17 = +[BKLibraryManager predicateForCollectionMembersInCollectionID:v8 hideUnownedItems:0];

  v33[0] = v17;
  uint64_t v18 = +[BKLibraryManager predicateForExcludingCollectionMembersWithSideloadedAssets];
  v33[1] = v18;
  long long v19 = +[BKLibraryManager predicateForExcludingCollectionMembersWithContainerLibraryAssets];
  v33[2] = v19;
  uint64_t v20 = +[BKLibraryManager predicateToExcludeCollectionMembersForAudiobookSupplementalContent];
  v33[3] = v20;
  int v21 = +[NSArray arrayWithObjects:v33 count:4];
  long long v22 = +[NSCompoundPredicate andPredicateWithSubpredicates:v21];
  [v12 setPredicate:v22];

  if (a3) {
    [v12 setFetchLimit:a3];
  }
  id v32 = 0;
  id v23 = [v7 executeFetchRequest:v12 error:&v32];
  id v24 = v32;
  id v25 = [v23 valueForKey:@"assetID"];
  uint64_t v26 = [v25 bu_arrayByRemovingNSNulls];
  CFStringRef v27 = (void *)v26;
  id v28 = &__NSArray0__struct;
  if (v26) {
    id v28 = (void *)v26;
  }
  id v29 = v28;

  BOOL v30 = +[NSOrderedSet orderedSetWithArray:v29];

  return v30;
}

- (void)_sortAndInitializeDataSources:(id)a3
{
  if (!self->_dataSources)
  {
    id v4 = [a3 sortedArrayUsingComparator:&stru_D20F8];
    dataSources = self->_dataSources;
    self->_dataSources = v4;

    id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](self->_dataSources, "count")];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = self->_dataSources;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v12 setLibraryManager:self v15];
          id v13 = [v12 identifier];
          [v6 setObject:v12 forKeyedSubscript:v13];

          if (objc_opt_respondsToSelector()) {
            [v12 addObserver:self forKeyPath:@"processingAuthentication" options:0 context:off_ECE58];
          }
        }
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    id v14 = [v6 copy];
    [(BKLibraryManager *)self setDataSourcesByIdentifier:v14];
  }
}

- (id)_dataSourceMatchingPredicate:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BKLibraryManager *)self dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_dataSourcesMatchingPredicate:(id)a3
{
  id v4 = (unsigned int (**)(id, void))a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(BKLibraryManager *)self dataSources];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)dq_unclaimAllLibraryAssetsWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryManager *)self assetUpdatesByIdentifier];
  [v5 removeAllObjects];

  id v6 = [(BKLibraryManager *)self identifiersForAssetsNeedingReconcile];
  [v6 removeAllObjects];

  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  [v7 setResultType:2];
  [v7 setFetchBatchSize:128];
  v39[0] = @"objectID";
  v39[1] = @"assetID";
  v39[2] = @"temporaryAssetID";
  id v8 = +[NSArray arrayWithObjects:v39 count:3];
  [v7 setPropertiesToFetch:v8];

  id v37 = 0;
  uint64_t v9 = [v4 executeFetchRequest:v7 error:&v37];
  id v10 = v37;
  uint64_t v11 = v10;
  if (v9)
  {
    long long v12 = [(BKLibraryManager *)self unclaimedAssetIDs];
    [v12 removeAllObjects];

    long long v13 = [(BKLibraryManager *)self unclaimedTemporaryAssetIDs];
    [v13 removeAllObjects];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v14 = v9;
    id v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (!v15) {
      goto LABEL_21;
    }
    id v16 = v15;
    CFStringRef v27 = v11;
    id v28 = v9;
    id v29 = v7;
    id v30 = v4;
    uint64_t v17 = *(void *)v34;
    while (1)
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v18);
        uint64_t v20 = [v19 valueForKey:@"assetID"];
        uint64_t v21 = [v19 valueForKey:@"temporaryAssetID"];
        long long v22 = (void *)v21;
        if (v20)
        {
          id v23 = [(BKLibraryManager *)self unclaimedAssetIDs];
          id v24 = v23;
          id v25 = v20;
LABEL_11:
          [v23 addObject:v25];
          goto LABEL_12;
        }
        if (v21)
        {
          id v23 = [(BKLibraryManager *)self unclaimedTemporaryAssetIDs];
          id v24 = v23;
          id v25 = v22;
          goto LABEL_11;
        }
        id v24 = BKLibraryLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_905E4(&buf, v32, v24);
        }
LABEL_12:

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v26 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      id v16 = v26;
      if (!v26)
      {
        id v7 = v29;
        id v4 = v30;
        uint64_t v11 = v27;
        uint64_t v9 = v28;
        goto LABEL_21;
      }
    }
  }
  if (v10)
  {
    long long v14 = BKLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_9057C();
    }
LABEL_21:
  }
}

- (id)dq_assetsToReconcile
{
  id v3 = [(BKLibraryManager *)self assetUpdatesByIdentifier];
  id v4 = [v3 mutableCopy];

  id v5 = [v4 allKeys];
  id v6 = [v5 mutableCopy];

  id v7 = [(BKLibraryManager *)self identifiersForAssetsNeedingReconcile];
  id v8 = [v7 allObjects];
  [v6 removeObjectsInArray:v8];

  [v4 removeObjectsForKeys:v6];

  return v4;
}

- (void)_removePossibleDupes:(id)a3 inMoc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = objc_alloc_init((Class)NSMutableSet);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v15 = [v14 assetID];
        id v16 = [v15 length];

        if (v16)
        {
          uint64_t v17 = [v14 assetID];
          [v7 addObject:v17];
        }
        long long v18 = [v14 temporaryAssetID];
        id v19 = [v18 length];

        if (v19)
        {
          uint64_t v20 = [v14 temporaryAssetID];
          [v8 addObject:v20];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  uint64_t v21 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  long long v22 = [v7 allObjects];
  id v23 = [v8 allObjects];
  id v24 = +[NSPredicate predicateWithFormat:@"(%K IN %@) OR (%K IN %@)", @"assetID", v22, @"temporaryAssetID", v23];
  [v21 setPredicate:v24];

  [v21 setFetchBatchSize:32];
  id v25 = [v6 executeFetchRequest:v21 error:0];
  id v26 = [(BKLibraryManager *)self _removeDupesByAssetID:v25 inMoc:v6];
  [(BKLibraryManager *)self _removeDupesByTemporaryAssetID:v26 inMoc:v6];
}

- (id)_removeDupesByAssetID:(id)a3 inMoc:(id)a4
{
  id v5 = a3;
  id v56 = a4;
  id v6 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v60 = objc_alloc_init((Class)NSMutableArray);
  id v61 = objc_alloc_init((Class)NSMutableDictionary);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v82 objects:v100 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v83;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v83 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        long long v13 = [v12 assetID:v56];
        if ([v13 length])
        {
          id v14 = [v61 objectForKeyedSubscript:v13];
          if (!v14)
          {
            id v14 = objc_alloc_init((Class)v6[502]);
            [v61 setObject:v14 forKeyedSubscript:v13];
          }
          [v14 addObject:v12];
        }
        else
        {
          id v15 = [v12 temporaryAssetID];
          id v16 = [v15 length];

          if (v16)
          {
            uint64_t v17 = v60;
          }
          else
          {
            long long v18 = BKLibraryLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              id v19 = [v12 title];
              uint64_t v20 = [v12 author];
              uint64_t v21 = [v12 dataSourceIdentifier];
              *(_DWORD *)uint8_t buf = 138412802;
              uint64_t v87 = (uint64_t)v19;
              __int16 v88 = 2112;
              v89 = v20;
              __int16 v90 = 2114;
              uint64_t v91 = (uint64_t)v21;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "_removeDupesByAssetID encountered asset without assetID and temporaryAssetID. title: %@, author: %@, dataSource: %{public}@.", buf, 0x20u);

              id v6 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
            }

            uint64_t v17 = v7;
          }
          [v17 addObject:v12];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v82 objects:v100 count:16];
    }
    while (v9);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v57 = [v61 allValues];
  id v63 = [v57 countByEnumeratingWithState:&v78 objects:v99 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v79;
    id v59 = v7;
    do
    {
      for (j = 0; j != v63; j = (char *)j + 1)
      {
        if (*(void *)v79 != v62) {
          objc_enumerationMutation(v57);
        }
        id v23 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v24 = v23;
        id v25 = [v24 countByEnumeratingWithState:&v74 objects:v98 count:16];
        if (v25)
        {
          id v26 = v25;
          id v64 = j;
          id v27 = 0;
          uint64_t v28 = *(void *)v75;
          do
          {
            for (k = 0; k != v26; k = (char *)k + 1)
            {
              if (*(void *)v75 != v28) {
                objc_enumerationMutation(v24);
              }
              long long v30 = *(void **)(*((void *)&v74 + 1) + 8 * (void)k);
              if (v27)
              {
                long long v31 = [(BKLibraryManager *)self dataSourcesByIdentifier];
                id v32 = [v27 dataSourceIdentifier];
                long long v33 = [v31 objectForKeyedSubscript:v32];

                long long v34 = [(BKLibraryManager *)self dataSourcesByIdentifier];
                long long v35 = [v30 dataSourceIdentifier];
                long long v36 = [v34 objectForKeyedSubscript:v35];

                id v37 = [v36 rank];
                if ((uint64_t)v37 < (uint64_t)[v33 rank])
                {
                  id v38 = v30;

                  id v27 = v38;
                }
              }
              else
              {
                id v27 = v30;
              }
            }
            id v26 = [v24 countByEnumeratingWithState:&v74 objects:v98 count:16];
          }
          while (v26);

          if (v27) {
            [v60 addObject:v27];
          }
          id v7 = v59;
          j = v64;
        }
        else
        {

          id v27 = 0;
        }
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v39 = v24;
        id v40 = [v39 countByEnumeratingWithState:&v70 objects:v97 count:16];
        if (v40)
        {
          id v41 = v40;
          uint64_t v42 = *(void *)v71;
          do
          {
            for (m = 0; m != v41; m = (char *)m + 1)
            {
              if (*(void *)v71 != v42) {
                objc_enumerationMutation(v39);
              }
              if (*(id *)(*((void *)&v70 + 1) + 8 * (void)m) != v27) {
                [v7 addObject:];
              }
            }
            id v41 = [v39 countByEnumeratingWithState:&v70 objects:v97 count:16];
          }
          while (v41);
        }
      }
      id v63 = [v57 countByEnumeratingWithState:&v78 objects:v99 count:16];
    }
    while (v63);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v44 = v7;
  id v45 = [v44 countByEnumeratingWithState:&v66 objects:v96 count:16];
  long long v46 = v56;
  if (v45)
  {
    id v47 = v45;
    uint64_t v48 = *(void *)v67;
    do
    {
      for (n = 0; n != v47; n = (char *)n + 1)
      {
        if (*(void *)v67 != v48) {
          objc_enumerationMutation(v44);
        }
        long long v50 = *(void **)(*((void *)&v66 + 1) + 8 * (void)n);
        unsigned int v51 = BKLibraryLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v52 = [v50 assetID];
          id v53 = [v50 temporaryAssetID];
          __int16 v54 = [v50 dataSourceIdentifier];
          *(_DWORD *)uint8_t buf = 141559042;
          uint64_t v87 = 1752392040;
          __int16 v88 = 2112;
          v89 = v52;
          __int16 v90 = 2160;
          uint64_t v91 = 1752392040;
          __int16 v92 = 2112;
          v93 = v53;
          __int16 v94 = 2114;
          v95 = v54;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "Delete Asset from BKLibraryManager (possibleDuplicateAssets) with duplicate assetID: %{mask.hash}@ [%{mask.hash}@], dataSource: %{public}@", buf, 0x34u);

          long long v46 = v56;
        }

        [v46 deleteObject:v50];
      }
      id v47 = [v44 countByEnumeratingWithState:&v66 objects:v96 count:16];
    }
    while (v47);
  }

  return v60;
}

- (void)_removeDupesByTemporaryAssetID:(id)a3 inMoc:(id)a4
{
  id v5 = a3;
  id v60 = a4;
  id v62 = objc_alloc_init((Class)NSMutableArray);
  id v58 = objc_alloc_init((Class)NSMutableDictionary);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v81 objects:v99 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v82;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v82 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        id v11 = [v10 temporaryAssetID];
        if ([v11 length])
        {
          id v12 = [v58 objectForKeyedSubscript:v11];
          if (!v12)
          {
            id v12 = objc_alloc_init((Class)NSMutableArray);
            [v58 setObject:v12 forKeyedSubscript:v11];
          }
          [v12 addObject:v10];
        }
        else
        {
          long long v13 = [v10 assetID];
          id v14 = [v13 length];

          if (!v14)
          {
            id v15 = BKLibraryLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              id v16 = [v10 title];
              uint64_t v17 = [v10 author];
              long long v18 = [v10 dataSourceIdentifier];
              *(_DWORD *)uint8_t buf = 138412802;
              uint64_t v86 = (uint64_t)v16;
              __int16 v87 = 2112;
              __int16 v88 = v17;
              __int16 v89 = 2114;
              uint64_t v90 = (uint64_t)v18;
              _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "_removeDupesByTemporaryAssetID encountered asset without assetID and temporaryAssetID. title: %@, author: %@, dataSource: %{public}@.", buf, 0x20u);
            }
            [v62 addObject:v10];
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v81 objects:v99 count:16];
    }
    while (v7);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v56 = [v58 allValues];
  id v19 = v62;
  id v61 = [v56 countByEnumeratingWithState:&v77 objects:v98 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v78;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v78 != v59) {
          objc_enumerationMutation(v56);
        }
        uint64_t v21 = *(void **)(*((void *)&v77 + 1) + 8 * v20);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v22 = v21;
        id v23 = [v22 countByEnumeratingWithState:&v73 objects:v97 count:16];
        uint64_t v63 = v20;
        if (!v23)
        {
          id v25 = 0;
          goto LABEL_39;
        }
        id v24 = v23;
        id v25 = 0;
        uint64_t v26 = *(void *)v74;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v74 != v26) {
              objc_enumerationMutation(v22);
            }
            uint64_t v28 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
            if (v25)
            {
              long long v29 = [*(id *)(*((void *)&v73 + 1) + 8 * (void)j) assetID];
              if ([v29 length])
              {
                long long v30 = [v25 assetID];
                id v31 = [v30 length];

                if (!v31)
                {
                  id v32 = v28;

                  id v25 = v32;
                  continue;
                }
              }
              else
              {
              }
              long long v33 = [(BKLibraryManager *)self dataSourcesByIdentifier];
              long long v34 = [v25 dataSourceIdentifier];
              long long v35 = [v33 objectForKeyedSubscript:v34];

              long long v36 = [(BKLibraryManager *)self dataSourcesByIdentifier];
              id v37 = [v28 dataSourceIdentifier];
              id v38 = [v36 objectForKeyedSubscript:v37];

              id v39 = [v38 rank];
              if ((uint64_t)v39 < (uint64_t)[v35 rank])
              {
                id v40 = v28;

                id v25 = v40;
              }
            }
            else
            {
              id v25 = v28;
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v73 objects:v97 count:16];
        }
        while (v24);
LABEL_39:

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v41 = v22;
        id v42 = [v41 countByEnumeratingWithState:&v69 objects:v96 count:16];
        id v19 = v62;
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v70;
          do
          {
            for (k = 0; k != v43; k = (char *)k + 1)
            {
              if (*(void *)v70 != v44) {
                objc_enumerationMutation(v41);
              }
              if (*(id *)(*((void *)&v69 + 1) + 8 * (void)k) != v25) {
                [v62 addObject:];
              }
            }
            id v43 = [v41 countByEnumeratingWithState:&v69 objects:v96 count:16];
          }
          while (v43);
        }

        uint64_t v20 = v63 + 1;
      }
      while ((id)(v63 + 1) != v61);
      id v61 = [v56 countByEnumeratingWithState:&v77 objects:v98 count:16];
    }
    while (v61);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v46 = v19;
  id v47 = [v46 countByEnumeratingWithState:&v65 objects:v95 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v66;
    do
    {
      for (m = 0; m != v48; m = (char *)m + 1)
      {
        if (*(void *)v66 != v49) {
          objc_enumerationMutation(v46);
        }
        unsigned int v51 = *(void **)(*((void *)&v65 + 1) + 8 * (void)m);
        __int16 v52 = BKLibraryLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          id v53 = [v51 assetID];
          __int16 v54 = [v51 temporaryAssetID];
          unsigned int v55 = [v51 dataSourceIdentifier];
          *(_DWORD *)uint8_t buf = 141559042;
          uint64_t v86 = 1752392040;
          __int16 v87 = 2112;
          __int16 v88 = v53;
          __int16 v89 = 2160;
          uint64_t v90 = 1752392040;
          __int16 v91 = 2112;
          __int16 v92 = v54;
          __int16 v93 = 2114;
          __int16 v94 = v55;
          _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "Delete Asset from BKLibraryManager (possibleDuplicateAssets) %{mask.hash}@ with duplicate temporaryAssetID: [%{mask.hash}@], dataSource: %{public}@", buf, 0x34u);
        }
        [v60 deleteObject:v51];
      }
      id v48 = [v46 countByEnumeratingWithState:&v65 objects:v95 count:16];
    }
    while (v48);
  }
}

- (void)wq_dq_integrateClaimedAssetsReason:(signed __int16)a3 context:(id)a4
{
  unsigned int v112 = a3;
  id v122 = a4;
  v129 = self;
  id v5 = self->_dqSyncQueue;
  id v6 = &_dispatch_main_q;
  if (v5 == (OS_dispatch_queue *)&_dispatch_main_q)
  {
    unsigned __int8 v7 = +[NSThread isMainThread];

    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  dispatch_assert_queue_V2((dispatch_queue_t)v5);
LABEL_5:

  v130 = [(BKLibraryManager *)v129 dq_assetsToReconcile];
  uint64_t v8 = BKLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithShort:v112];
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v130 count]);
    uint64_t v10 = (CFStringRef (__cdecl *)(const void *))objc_claimAutoreleasedReturnValue();
    LODWORD(buf.version) = 136315650;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
    WORD2(buf.retain) = 2112;
    *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v9;
    HIWORD(buf.release) = 2112;
    buf.copyDescription = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s: reason=%@, assetsToReconcile=%@", (uint8_t *)&buf, 0x20u);
  }
  v110 = [(BKLibraryManager *)v129 unclaimedAssetIDs];
  v109 = [(BKLibraryManager *)v129 unclaimedTemporaryAssetIDs];
  id v125 = objc_alloc_init((Class)NSMutableArray);
  id v106 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v130 count]];
  id v104 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v130 count]];
  v103 = objc_opt_new();
  if ([v130 count])
  {
    kdebug_trace();
    id v105 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    v101 = [v130 allKeys];
    v99 = [(BKLibraryManager *)v129 predicateForAssetIDsTaggedLibraryAssets:v101];
    v98 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:v101];
    v176[0] = v99;
    v176[1] = v98;
    id v11 = +[NSArray arrayWithObjects:v176 count:2];
    id v12 = +[NSCompoundPredicate orPredicateWithSubpredicates:v11];
    [v105 setPredicate:v12];

    [v105 setReturnsObjectsAsFaults:0];
    [v105 setFetchBatchSize:25];
    id v158 = 0;
    v102 = [v122 executeFetchRequest:v105 error:&v158];
    id v100 = v158;
    long long v13 = BKLibraryLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v102 count]);
      id v14 = (const void *(__cdecl *)(CFAllocatorRef, const void *))objc_claimAutoreleasedReturnValue();
      LODWORD(buf.version) = 136315394;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
      WORD2(buf.retain) = 2112;
      *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%s: toBeUpdatedLibraryAssets=%@", (uint8_t *)&buf, 0x16u);
    }
    if (v102)
    {
      id v107 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v130 count]];
      v108 = +[NSMutableArray array];
      long long v15 = *(_OWORD *)&kCFTypeSetCallBacks.release;
      *(_OWORD *)&buf.version = *(_OWORD *)&kCFTypeSetCallBacks.version;
      *(_OWORD *)&buf.release = v15;
      *(_OWORD *)&buf.equal = *(_OWORD *)&kCFTypeSetCallBacks.equal;
      buf.retain = 0;
      buf.release = 0;
      CFMutableSetRef v111 = CFSetCreateMutable(kCFAllocatorDefault, 0, &buf);
      id v113 = objc_alloc_init((Class)NSMutableSet);
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      id obj = v102;
      id v127 = [obj countByEnumeratingWithState:&v154 objects:v174 count:16];
      if (!v127) {
        goto LABEL_61;
      }
      v126 = *(void **)v155;
      while (1)
      {
        for (i = 0; i != v127; i = (char *)i + 1)
        {
          if (*(void **)v155 != v126) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(id *)(*((void *)&v154 + 1) + 8 * i);
          if ([v17 isValid])
          {
            long long v18 = [v17 assetID];
            id v19 = [v17 temporaryAssetID];
            if (v18)
            {
              uint64_t v20 = [v130 objectForKeyedSubscript:v18];
              if (v20) {
                goto LABEL_23;
              }
            }
            else
            {
              uint64_t v20 = 0;
            }
            if (v19)
            {
              uint64_t v20 = [v130 objectForKeyedSubscript:v19];
            }
LABEL_23:
            if (v20)
            {
              if ([v20 dataSourcesBitmask])
              {
                [(__CFSet *)v111 addObject:v20];
                uint64_t v21 = [v17 dataSourceIdentifier];
                id v22 = [v20 dataSourcesBitmask];
                id v23 = [(BKLibraryManager *)v129 dataSources];
                id v24 = sub_CAC8(v22, v23);
                id v123 = [v24 identifier];

                id v25 = [(BKLibraryManager *)v129 dataSourcesByIdentifier];
                v117 = [v25 objectForKeyedSubscript:v21];

                uint64_t v26 = [(BKLibraryManager *)v129 dataSourcesByIdentifier];
                v120 = [v26 objectForKeyedSubscript:v123];

                if (v120)
                {
                  id v27 = [v120 rank];
                  if ((uint64_t)v27 <= (uint64_t)[v117 rank] || v112 == 4 || v112 == 2)
                  {
                    v115 = [v20 asset];
                    id v28 = [v20 dataSourcesBitmask];
                    long long v29 = [(BKLibraryManager *)v129 dataSources];
                    if (!sub_24090((uint64_t)v28, v29)) {
                      goto LABEL_42;
                    }
                    long long v30 = [v20 asset];
                    BOOL v31 = v30 != 0;

                    if (v115) {
                      BOOL v32 = v31;
                    }
                    else {
                      BOOL v32 = 0;
                    }
                    if (v32)
                    {
                      [v107 addObject:v115];
                      long long v33 = [v115 storeID];
                      if (v33 && (BOOL v34 = [v115 contentType] == 6, v33, !v34))
                      {
                        long long v29 = [v115 storeID];
                        [v106 addObject:v29];
LABEL_42:
                      }
                      else
                      {
                        long long v35 = [v115 assetID];
                        if (v35)
                        {
                          BOOL v36 = [v115 state] == 1;

                          if (v36)
                          {
                            long long v29 = [v115 assetID];
                            [v104 addObject:v29];
                            goto LABEL_42;
                          }
                        }
                      }
                    }
                    signed int v37 = [v17 state];
                    id v38 = [v20 asset];
                    signed int v39 = [v38 state];

                    id v40 = [(BKLibraryManager *)v129 dataSources];
                    BOOL v41 = sub_1C6E4(v129, v17, v20, v112, v40);

                    if (v41) {
                      [v108 addObject:v17];
                    }
                    if (([v21 isEqualToString:v123] & 1) == 0)
                    {
                      v173[0] = v123;
                      v172[0] = @"BKLibraryOwnershipNewDatasource";
                      v172[1] = @"BKLibraryOwnershipNewState";
                      id v42 = +[NSNumber numberWithInteger:v39];
                      v173[1] = v42;
                      v172[2] = @"BKLibraryOwnershipAssetIDKey";
                      id v43 = [v17 permanentOrTemporaryAssetID];
                      v173[2] = v43;
                      v173[3] = v21;
                      v172[3] = @"BKLibraryOwnershipOldDatasource";
                      v172[4] = @"BKLibraryOwnershipOldState";
                      uint64_t v44 = +[NSNumber numberWithInteger:v37];
                      v173[4] = v44;
                      id v45 = +[NSDictionary dictionaryWithObjects:v173 forKeys:v172 count:5];
                      [v125 addObject:v45];
                    }
                  }
                }
                if (v18) {
                  [v110 removeObject:v18];
                }
                if (v19) {
                  [v109 removeObject:v19];
                }
                if (v18) {
                  [v113 addObject:v18];
                }
                if (v19) {
                  [v113 addObject:v19];
                }

LABEL_57:
              }

              goto LABEL_59;
            }
            uint64_t v21 = BKLibraryLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v169 = 138412546;
              *(void *)&v169[4] = v18;
              *(_WORD *)&v169[12] = 2112;
              *(void *)&v169[14] = v19;
              _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "We should have had an update for %@ / %@", v169, 0x16u);
            }
            goto LABEL_57;
          }
LABEL_59:
        }
        id v127 = [obj countByEnumeratingWithState:&v154 objects:v174 count:16];
        if (!v127)
        {
LABEL_61:

          long long v152 = 0u;
          long long v153 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          id v46 = v113;
          id v47 = [v46 countByEnumeratingWithState:&v150 objects:v171 count:16];
          if (v47)
          {
            uint64_t v48 = *(void *)v151;
            do
            {
              for (j = 0; j != v47; j = (char *)j + 1)
              {
                if (*(void *)v151 != v48) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v50 = *(void *)(*((void *)&v150 + 1) + 8 * (void)j);
                unsigned int v51 = [v130 objectForKeyedSubscript:v50];
                __int16 v52 = v51;
                if (v51) {
                  [v51 postIntegrateCleanup];
                }
                [v130 removeObjectForKey:v50];
              }
              id v47 = [v46 countByEnumeratingWithState:&v150 objects:v171 count:16];
            }
            while (v47);
          }

          id v53 = BKLibraryLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v108 count]);
            *(_DWORD *)v169 = 136315394;
            *(void *)&v169[4] = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            *(_WORD *)&v169[12] = 2112;
            *(void *)&v169[14] = v54;
            _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "%s: _removePossibleDupes=%@", v169, 0x16u);
          }
          [(BKLibraryManager *)v129 _removePossibleDupes:v108 inMoc:v122];
          unsigned int v55 = BKLibraryLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            id v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v130 count]);
            *(_DWORD *)v169 = 136315394;
            *(void *)&v169[4] = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            *(_WORD *)&v169[12] = 2112;
            *(void *)&v169[14] = v56;
            _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "%s: addOtherAssets, total=%@", v169, 0x16u);
          }
          *(void *)v169 = 0;
          *(void *)&v169[8] = v169;
          *(void *)&v169[16] = 0x2020000000;
          uint64_t v170 = 0;
          v137[0] = _NSConcreteStackBlock;
          v137[1] = 3221225472;
          v137[2] = sub_24164;
          v137[3] = &unk_D2120;
          id v57 = v111;
          v148 = v169;
          v138 = v57;
          v139 = v129;
          id v140 = v122;
          __int16 v149 = v112;
          id v141 = v103;
          id v58 = v107;
          v142 = v58;
          id v143 = v106;
          id v144 = v104;
          id v145 = v125;
          id v146 = v110;
          id v147 = v109;
          [v130 enumerateKeysAndObjectsUsingBlock:v137];
          uint64_t v59 = BKLibraryLog();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            id v60 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)&v169[8] + 24)];
            *(_DWORD *)v165 = 136315394;
            v166 = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            __int16 v167 = 2112;
            v168 = v60;
            _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEFAULT, "%s: addOtherAssets, %@ processed", v165, 0x16u);
          }
          id v61 = BKLibraryLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            id v62 = [(BKLibraryManager *)v129 assetUpdatesByIdentifier];
            uint64_t v63 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v62 count]);
            *(_DWORD *)v165 = 136315394;
            v166 = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            __int16 v167 = 2112;
            v168 = v63;
            _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "%s: postIntegrateCleanup=%@", v165, 0x16u);
          }
          id v64 = [(BKLibraryManager *)v129 assetUpdatesByIdentifier];
          [v64 enumerateKeysAndObjectsUsingBlock:&stru_D2160];

          _Block_object_dispose(v169, 8);
          goto LABEL_82;
        }
      }
    }
    id v58 = BKLibraryLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_907FC();
    }
LABEL_82:
  }
  else
  {
    id v100 = 0;
  }
  long long v65 = BKLibraryLog();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    long long v66 = [(BKLibraryManager *)v129 assetUpdatesByIdentifier];
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 count]);
    long long v67 = (const void *(__cdecl *)(CFAllocatorRef, const void *))objc_claimAutoreleasedReturnValue();
    LODWORD(buf.version) = 136315394;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
    WORD2(buf.retain) = 2112;
    *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v67;
    _os_log_impl(&dword_0, v65, OS_LOG_TYPE_DEFAULT, "%s: purge=%@", (uint8_t *)&buf, 0x16u);
  }
  if ([v110 count] || objc_msgSend(v109, "count"))
  {
    id v118 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    [v118 setReturnsObjectsAsFaults:0];
    [v118 setFetchBatchSize:25];
    if ([v110 count] && objc_msgSend(v109, "count"))
    {
      long long v68 = [(BKLibraryManager *)v129 predicateForAssetIDsTaggedLibraryAssets:v110];
      long long v69 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:v109];
      v164[0] = v68;
      v164[1] = v69;
      long long v70 = +[NSArray arrayWithObjects:v164 count:2];
      long long v71 = +[NSCompoundPredicate orPredicateWithSubpredicates:v70];
      [v118 setPredicate:v71];
    }
    else if ([v110 count])
    {
      long long v68 = [(BKLibraryManager *)v129 predicateForAssetIDsTaggedLibraryAssets:v110];
      [v118 setPredicate:v68];
    }
    else
    {
      if (![v109 count]) {
        BCReportAssertionFailureWithMessage();
      }
      long long v68 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:v109];
      [v118 setPredicate:v68];
    }

    id v136 = 0;
    v116 = [v122 executeFetchRequest:v118 error:&v136];
    id v114 = v136;
    if (v116)
    {
      v121 = [(BKLibraryManager *)v129 imageSource];
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v124 = v116;
      id v72 = [v124 countByEnumeratingWithState:&v132 objects:v163 count:16];
      if (v72)
      {
        uint64_t v128 = *(void *)v133;
        do
        {
          for (k = 0; k != v72; k = (char *)k + 1)
          {
            if (*(void *)v133 != v128) {
              objc_enumerationMutation(v124);
            }
            id v74 = *(id *)(*((void *)&v132 + 1) + 8 * (void)k);
            if ([v74 isValid])
            {
              long long v75 = [v74 assetID];
              uint64_t v76 = [v74 temporaryAssetID];
              long long v77 = (void *)v76;
              if (v75) {
                long long v78 = v75;
              }
              else {
                long long v78 = (void *)v76;
              }
              long long v79 = v78;
              v161[0] = @"BKLibraryOwnershipOldDatasource";
              long long v80 = [v74 dataSourceIdentifier];
              long long v81 = v80;
              if (!v80)
              {
                v126 = +[NSNull null];
                long long v81 = v126;
              }
              v162[0] = v81;
              v161[1] = @"BKLibraryOwnershipOldState";
              long long v82 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v74 state]);
              v161[2] = @"BKLibraryOwnershipAssetIDKey";
              v162[1] = v82;
              v162[2] = v79;
              long long v83 = +[NSDictionary dictionaryWithObjects:v162 forKeys:v161 count:3];
              [v125 addObject:v83];

              if (!v80) {
              [v121 removeImagesForAssetID:v75 temporaryAssetID:v77];
              }
              long long v84 = BKLibraryLog();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              {
                long long v85 = [v74 title];
                LODWORD(buf.version) = 138412546;
                *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v85;
                WORD2(buf.retain) = 2112;
                *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v79;
                _os_log_debug_impl(&dword_0, v84, OS_LOG_TYPE_DEBUG, "Delete Asset from BKLibraryManager (unclaimedLibraryAsset) %@ [%@]", (uint8_t *)&buf, 0x16u);
              }
              [(BKLibraryManager *)v129 archiveTransientProperties:v74];
              [v122 deleteObject:v74];
            }
          }
          id v72 = [v124 countByEnumeratingWithState:&v132 objects:v163 count:16];
        }
        while (v72);
      }

      [v110 removeAllObjects];
      [v109 removeAllObjects];
      uint64_t v86 = v121;
    }
    else
    {
      __int16 v87 = BKLibraryLog();
      uint64_t v86 = v87;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        sub_90794();
        uint64_t v86 = v87;
      }
    }
  }
  __int16 v88 = [(BKLibraryManager *)v129 identifiersForAssetsNeedingReconcile];
  [v88 removeAllObjects];

  __int16 v89 = [v122 insertedObjects];
  id v90 = [v89 count];
  LOBYTE(v90) = v90 == [v103 count];

  if ((v90 & 1) == 0)
  {
    __int16 v91 = BKLibraryLog();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      sub_906CC((uint64_t)v103, v122, v91);
    }
  }
  [(BKLibraryManager *)v129 wq_dq_saveDatabaseContext:v122];
  if ([v125 count])
  {
    __int16 v92 = +[NSNotificationCenter defaultCenter];
    CFStringRef v159 = @"BKLibraryOwnershipAssetsKey";
    id v160 = v125;
    __int16 v93 = +[NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];
    [v92 postNotificationName:@"BKLibraryOwnershipDidChangeNotification" object:v129 userInfo:v93];

    __int16 v94 = BKLibraryLog();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
      sub_90624((uint64_t)v125, v112);
    }
  }
  id v95 = &_dispatch_main_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2462C;
  block[3] = &unk_D1520;
  void block[4] = v129;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v96 = BKLibraryLog();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    v97 = +[NSNumber numberWithShort:v112];
    LODWORD(buf.version) = 136315394;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
    WORD2(buf.retain) = 2112;
    *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v97;
    _os_log_impl(&dword_0, v96, OS_LOG_TYPE_DEFAULT, "%s: reason=%@, done", (uint8_t *)&buf, 0x16u);
  }
}

- (void)wq_reconcileDataSourceAssetsForReason:(signed __int16)a3 context:(id)a4
{
  int v25 = a3;
  id v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v25 == 4) {
      CFStringRef v6 = @"Reload";
    }
    else {
      CFStringRef v6 = @"Other";
    }
    *(_DWORD *)CFSetCallBacks buf = 136315394;
    id v43 = "-[BKLibraryManager wq_reconcileDataSourceAssetsForReason:context:]";
    __int16 v44 = 2112;
    CFStringRef v45 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: reason=%@", buf, 0x16u);
  }

  kdebug_trace();
  unsigned __int8 v7 = dispatch_group_create();
  uint64_t v8 = [(BKLibraryManager *)self dataSources];
  id v9 = [v8 valueForKey:@"identifier"];
  uint64_t v26 = +[NSMutableSet setWithArray:v9];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(BKLibraryManager *)self dataSources];
  id v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        dispatch_group_enter(v7);
        long long v15 = [(BKLibraryManager *)self completionQueue];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_24B2C;
        v33[3] = &unk_D21B0;
        void v33[4] = self;
        void v33[5] = v14;
        __int16 v36 = v25;
        id v34 = v26;
        long long v35 = v7;
        sub_14E60(v14, v15, v33);
      }
      id v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v11);
  }

  id v16 = [(BKLibraryManager *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    long long v18 = [(BKLibraryManager *)self delegate];
    [v18 initialDataSourceFetchInitiated];
  }
  dispatch_time_t v19 = dispatch_time(0, 60000000000);
  if (dispatch_group_wait(v7, v19))
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_24DC4;
    v30[3] = &unk_D21D8;
    char v32 = 0;
    id v20 = v26;
    id v31 = v20;
    [(BKLibraryManager *)self dq_sync:v30];
    dispatch_time_t v21 = dispatch_time(0, 120000000000);
    if (dispatch_group_wait(v7, v21))
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_24EC4;
      v27[3] = &unk_D21D8;
      char v29 = 0;
      id v28 = v20;
      [(BKLibraryManager *)self dq_sync:v27];
      dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  kdebug_trace();
  id v22 = BKLibraryLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v23 = @"Other";
    if (v25 == 4) {
      CFStringRef v23 = @"Reload";
    }
    *(_DWORD *)CFSetCallBacks buf = 136315394;
    id v43 = "-[BKLibraryManager wq_reconcileDataSourceAssetsForReason:context:]";
    __int16 v44 = 2112;
    CFStringRef v45 = v23;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%s: reason=%@, done", buf, 0x16u);
  }
}

- (id)metadataForAssetAtURL:(id)a3 needsCoordination:(BOOL)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = sub_89D0;
  long long v30 = sub_89E0;
  id v31 = 0;
  [v6 path];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_25280;
  v23[3] = &unk_D2200;
  v23[4] = self;
  BOOL v25 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v7;
  uint64_t v8 = objc_retainBlock(v23);
  if (v7)
  {
    if (+[NSThread isMainThread])
    {
      id v9 = +[NSPredicate predicateWithFormat:@"%K == %@", @"path", v7];
      id v10 = [(BKLibraryManager *)self uiChildContext];
      id v11 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v7 predicate:v9 inManagedObjectContext:v10];

      uint64_t v12 = ((void (*)(void *, NSObject *))v8[2])(v8, v11);
      long long v13 = (void *)v27[5];
      void v27[5] = v12;
    }
    else
    {
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_2546C;
      v18[3] = &unk_D2228;
      v18[4] = self;
      id v19 = v7;
      id v22 = &v26;
      dispatch_time_t v21 = v8;
      id v11 = v14;
      id v20 = v11;
      [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v18];
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v11, v15);
    }
  }
  id v16 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v16;
}

- (id)assetIDForAssetAtURLOnMainThread:(id)a3
{
  id v4 = a3;
  if (v4 && +[NSThread isMainThread])
  {
    id v5 = [v4 absoluteString];
    id v6 = [v4 path];
    id v7 = +[NSPredicate predicateWithFormat:@"%K == %@", @"path", v6];
    uint64_t v8 = [(BKLibraryManager *)self uiChildContext];
    id v9 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v5 predicate:v7 inManagedObjectContext:v8];

    id v10 = [v9 permanentOrTemporaryAssetID];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)pageProgressionDirectionForAssetAtURLOnMainThread:(id)a3
{
  id v4 = a3;
  if (v4 && +[NSThread isMainThread])
  {
    id v5 = [v4 absoluteString];
    id v6 = [v4 path];
    id v7 = +[NSPredicate predicateWithFormat:@"%K == %@", @"path", v6];
    uint64_t v8 = [(BKLibraryManager *)self uiChildContext];
    id v9 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v5 predicate:v7 inManagedObjectContext:v8];

    id v10 = [v9 pageProgressionDirection];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)bookDescriptionForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  dispatch_semaphore_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_89D0;
  char v17 = sub_89E0;
  id v18 = 0;
  if (+[NSThread isMainThread])
  {
    id v5 = [(BKLibraryManager *)self libraryAssetOnMainQueueWithAssetID:v4];
    uint64_t v6 = [v5 bookDescription];
    id v7 = (void *)v14[5];
    void v14[5] = v6;
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_258E8;
    v10[3] = &unk_D2250;
    void v10[4] = self;
    id v11 = v4;
    uint64_t v12 = &v13;
    [(BKLibraryManager *)self performBackgroundReadOnlyBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)seriesTitleForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_89D0;
  id v20 = sub_89E0;
  id v21 = 0;
  if (+[NSThread isMainThread])
  {
    id v5 = [(BKLibraryManager *)self libraryAssetOnMainQueueWithAssetID:v4];
    uint64_t v6 = [v5 seriesID];

    if (v6)
    {
      id v7 = [v5 seriesID];
      id v8 = [(BKLibraryManager *)self libraryAssetOnMainQueueWithAssetID:v7];

      uint64_t v9 = [v8 title];
      id v10 = (void *)v17[5];
      v17[5] = v9;
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_25B1C;
    v13[3] = &unk_D2250;
    void v13[4] = self;
    id v14 = v4;
    uint64_t v15 = &v16;
    [(BKLibraryManager *)self performBackgroundReadOnlyBlockAndWait:v13];
  }
  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)deleteAssetIDs:(id)a3
{
}

- (void)deleteAssetIDs:(id)a3 exhaustive:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_25C90;
  v6[3] = &unk_D2278;
  id v7 = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  [(BKLibraryManager *)v7 performBackgroundReadOnlyBlock:v6];
}

- (void)didHidePurchasedAssetID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BKLibraryManager *)self collectionController];
    [v5 removeAssetID:v4 fromCollectionID:kBKCollectionDefaultIDWantToRead completion:0];

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_25DC8;
    v6[3] = &unk_D18D8;
    void v6[4] = self;
    id v7 = v4;
    [(BKLibraryManager *)self performBlockOnWorkerQueue:v6];
  }
}

- (id)entityName
{
  return @"BKLibraryAsset";
}

- (BOOL)isProcessing
{
  return [(BKLibraryManager *)self isReloading];
}

+ (id)keyPathsForValuesAffectingIsProcessing
{
  return +[NSSet setWithObjects:@"reloading", 0];
}

- (BOOL)isExplicitMaterialAllowed
{
  id v2 = +[BURestrictionsProvider sharedInstance];
  unsigned __int8 v3 = [v2 isExplicitContentAllowed];

  return v3;
}

- (unint64_t)countOfPurchasedBooks
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  unsigned __int8 v3 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  id v4 = [(BKLibraryManager *)self predicateForPurchasedBooksAssets];
  [v3 setPredicate:v4];

  id v5 = [(BKLibraryManager *)self uiChildContext];
  id v10 = 0;
  id v6 = [v5 countForFetchRequest:v3 error:&v10];
  id v7 = v10;

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_90B78();
    }

    id v6 = 0;
  }

  return (unint64_t)v6;
}

- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 purchased:(unint64_t *)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10 && a4 && a5)
  {
    uint64_t v28 = a4;
    char v29 = a5;
    uint64_t v12 = [(BKLibraryManager *)self predicateForLibraryAssetsWithSeriesID:v10];
    uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    [v13 setPredicate:v12];
    id v31 = 0;
    id v14 = [v11 countForFetchRequest:v13 error:&v31];
    id v15 = v31;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = BKLibraryLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_90C48();
      }

      id v14 = 0;
    }
    uint64_t v26 = v15;
    char v17 = +[BKLibraryManager predicateToExcludeUnownedLibraryAssets];
    v32[0] = v17;
    v32[1] = v12;
    id v27 = (void *)v12;
    uint64_t v18 = +[BKLibraryManager predicateForNotSamplesLibraryAssets];
    v32[2] = v18;
    id v19 = +[BKLibraryManager sampleDataSourceIdentifier];
    id v20 = +[NSPredicate predicateWithFormat:@"%K != %@", @"dataSourceIdentifier", v19];
    v32[3] = v20;
    id v21 = +[NSArray arrayWithObjects:v32 count:4];
    id v22 = +[NSCompoundPredicate andPredicateWithSubpredicates:v21];
    [v13 setPredicate:v22];

    id v30 = 0;
    id v23 = [v11 countForFetchRequest:v13 error:&v30];
    id v24 = v30;
    if (v23 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v25 = BKLibraryLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_90BE0();
      }

      id v23 = 0;
    }
    *uint64_t v28 = (unint64_t)v14;
    unint64_t *v29 = (unint64_t)v23;
  }
}

- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 finished:(unint64_t *)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10 && a4 && a5)
  {
    id v23 = a5;
    uint64_t v12 = [(BKLibraryManager *)self predicateForLibraryAssetsWithSeriesID:v10];
    uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    [v13 setPredicate:v12];
    id v25 = 0;
    id v14 = [v11 countForFetchRequest:v13 error:&v25];
    id v15 = v25;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = BKLibraryLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_90C48();
      }

      id v14 = 0;
    }
    char v17 = +[BKLibraryManager predicateFor_All_Finished_LibraryAssets];
    v26[0] = v17;
    v26[1] = v12;
    uint64_t v18 = +[NSArray arrayWithObjects:v26 count:2];
    id v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];
    [v13 setPredicate:v19];

    id v24 = 0;
    id v20 = [v11 countForFetchRequest:v13 error:&v24];
    id v21 = v24;
    if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v22 = BKLibraryLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_90BE0();
      }

      id v20 = 0;
    }
    *a4 = (unint64_t)v14;
    *id v23 = (unint64_t)v20;
  }
}

- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 markedFinished:(unint64_t *)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10 && a4 && a5)
  {
    id v23 = a5;
    uint64_t v12 = [(BKLibraryManager *)self predicateForLibraryAssetsWithSeriesID:v10];
    uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    [v13 setPredicate:v12];
    id v25 = 0;
    id v14 = [v11 countForFetchRequest:v13 error:&v25];
    id v15 = v25;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = BKLibraryLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_90C48();
      }

      id v14 = 0;
    }
    char v17 = +[BKLibraryManager predicateFor_All_Marked_As_Finished_LibraryAssets];
    v26[0] = v17;
    v26[1] = v12;
    uint64_t v18 = +[NSArray arrayWithObjects:v26 count:2];
    id v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];
    [v13 setPredicate:v19];

    id v24 = 0;
    id v20 = [v11 countForFetchRequest:v13 error:&v24];
    id v21 = v24;
    if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v22 = BKLibraryLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_90BE0();
      }

      id v20 = 0;
    }
    *a4 = (unint64_t)v14;
    *id v23 = (unint64_t)v20;
  }
}

- (id)predicateForContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"contentType", &off_D9E30];
}

- (id)predicateForExcludingContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != %@", @"contentType", &off_D9E30];
}

- (id)predicateForContainerWithSeriesIDLibraryAsset:(id)a3
{
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %@", @"seriesID", a3];
  v9[0] = v4;
  id v5 = [(BKLibraryManager *)self predicateForContainerLibraryAssets];
  v9[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:2];

  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)predicateForUnownedSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != 0 AND %K != NULL AND %K == %@", @"storeID", @"storeID", @"state", &off_D9E30];
}

- (id)predicateToExcludeUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != %@", @"state", &off_D9E30];
}

+ (id)predicateForInTheCloudLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"state", &off_D9E90];
}

- (id)predicateForDataSourceIdentifierTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"dataSourceIdentifier", a3];
}

- (id)predicateForAssetIDsTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", a3];
}

+ (id)predicateForTemporaryAssetIDsTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@", @"temporaryAssetID", a3];
}

+ (id)predicateForCollectionIDTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"ANY collectionMembers.collection.collectionID == %@", a3];
}

- (id)predicateForHighWaterMarkCapableLibraryAssets
{
  unsigned __int8 v3 = [(BKLibraryManager *)self predicateToExcludeUnownedLibraryAssets];
  id v4 = [(BKLibraryManager *)self predicateForExcludingContainerLibraryAssets];
  v9[1] = v4;
  id v5 = [(id)objc_opt_class() predicateToExcludeAudiobookSupplementalContent];
  void v9[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:3];

  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)predicateForIndexing
{
  unsigned __int8 v3 = [(BKLibraryManager *)self predicateForLocalLibraryAssets];
  v14[0] = v3;
  id v4 = +[BKLibraryManager predicateForAllOwnedAudiobooks];
  v14[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v14 count:2];
  id v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

  id v7 = [(BKLibraryManager *)self predicateToExcludeUnownedLibraryAssets];
  v13[0] = v7;
  id v8 = [(BKLibraryManager *)self predicateForExcludingContainerLibraryAssets];
  v13[1] = v8;
  BOOL v9 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v13[2] = v9;
  v13[3] = v6;
  id v10 = +[NSArray arrayWithObjects:v13 count:4];

  id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)predicateForPersonalizationAffinityAssets
{
  id v2 = +[BKLibraryManager predicateForDownloadableStoreLibraryAssets];
  v9[0] = v2;
  unsigned __int8 v3 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  v9[1] = v3;
  id v4 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  void v9[2] = v4;
  id v5 = +[BKLibraryManager predicateToExcludeUnownedLibraryAssets];
  void v9[3] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:4];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)predicateForMatchingSearchStringLibraryAssets:(id)a3
{
  return +[BKLibraryManager predicateForMatchingSearchStringLibraryAssets:a3];
}

- (id)predicateForSearchableLibraryAssets
{
  unsigned __int8 v3 = +[NSMutableArray arrayWithCapacity:5];
  id v4 = +[NSPredicate predicateWithFormat:@"collectionMembers.@count > 0 OR (purchasedAndLocalParent != NULL AND purchasedAndLocalParent != 0)"];
  [v3 addObject:v4];

  if (![(BKLibraryManager *)self isExplicitMaterialAllowed])
  {
    id v5 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
    [v3 addObject:v5];
  }
  id v6 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  [v3 addObject:v6];

  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v3];

  return v7;
}

- (id)predicateForSamples
{
  id v2 = +[NSPredicate predicateWithFormat:@"(%K == 1)", @"isSample"];
  unsigned __int8 v3 = +[NSPredicate predicateWithFormat:@"%K == %@", @"contentType", &off_D9E48];
  v11[0] = v3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K == %@", @"state", &off_D9E48];
  v11[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v11 count:2];
  id v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  v10[0] = v2;
  v10[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  id v8 = +[NSCompoundPredicate orPredicateWithSubpredicates:v7];

  return v8;
}

- (id)_predicateForSearchText:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:6];
  if ([v4 length])
  {
    id v6 = [(BKLibraryManager *)self predicateForSearchableLibraryAssets];
    [v5 addObject:v6];

    id v7 = [(BKLibraryManager *)self predicateForMatchingSearchStringLibraryAssets:v4];
    [v5 addObject:v7];
  }
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  return v8;
}

- (id)_booksWithPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v12 setPredicate:v11];

  [v12 setSortDescriptors:v10];
  [v12 setReturnsObjectsAsFaults:0];
  uint64_t v13 = [v9 executeFetchRequest:v12 error:a6];

  return v13;
}

+ (id)predicateToExcludeAssetsForSeriesAndStoreItems
{
  return +[NSPredicate predicateWithFormat:@"state != %@ AND (state != %@ || contentType == %@)", &off_D9E48, &off_D9E30, &off_D9E30];
}

+ (id)predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections
{
  id v2 = [a1 predicateToExcludeAssetsForSeriesAndStoreItems];
  v9[0] = v2;
  v8[0] = kBKCollectionDefaultAll;
  v8[1] = kBKCollectionDefaultIDBooks;
  v8[2] = kBKCollectionDefaultIDAudiobooks;
  unsigned __int8 v3 = +[NSArray arrayWithObjects:v8 count:3];
  id v4 = +[NSPredicate predicateWithFormat:@"SUBQUERY(collectionMembers, $collectionMember, NOT $collectionMember.collection.collectionID IN %@).@count > 0", v3];
  v9[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v9 count:2];
  id v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateToExcludeAssetsForUnpurchasedItemsInCollection:(id)a3
{
  uint64_t v3 = kBKCollectionDefaultIDAudiobooks;
  id v4 = [a3 isEqualToString:kBKCollectionDefaultIDAudiobooks];
  if (v4) {
    uint64_t v5 = kBKCollectionDefaultIDBooks;
  }
  else {
    uint64_t v5 = v3;
  }
  id v6 = +[BKCollection contentTypesForDefaultCollectionWithID:v5];
  id v7 = +[NSNumber numberWithBool:v4];
  id v8 = +[NSPredicate predicateWithFormat:@"(%K = NULL OR %K = 0) AND !(%K IN %@) AND (%K != %@ AND (%K != %@ OR (%K == %@ AND seriesBooks.@count > 1 AND ANY seriesBooks.%K == %@)))", @"isSample", @"isSample", @"contentType", v6, @"state", &off_D9E48, @"state", &off_D9E30, @"contentType", &off_D9E30, @"isStoreAudiobook", v7];

  return v8;
}

+ (id)predicateToExcludeAssetsInASeriesContainerWithOwnedBooks
{
  return +[NSPredicate predicateWithFormat:@"contentType == %@ OR seriesContainer = NULL OR seriesContainer.purchasedAndLocalSeriesItems.@count == 0 OR seriesContainer.seriesBooks.@count == 1", &off_D9E30];
}

+ (id)predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks
{
  return +[NSPredicate predicateWithFormat:@"contentType != %@ OR (purchasedAndLocalSeriesItems.@count != 0 AND seriesBooks.@count > 1)", &off_D9E30];
}

+ (id)predicateForOwnedSingleAssetSeries
{
  return +[NSPredicate predicateWithFormat:@"contentType == %@ AND purchasedAndLocalSeriesItems.@count != 0 AND seriesBooks.@count == 1", &off_D9E30];
}

+ (id)predicateForAssetsInCollectionID:(id)a3 allowExplicit:(BOOL)a4
{
  return [a1 predicateForAssetsInCollectionID:a3 allowExplicit:a4 includeSeriesItems:0];
}

+ (id)predicateForAssetsInCollectionID:(id)a3 allowExplicit:(BOOL)a4 includeSeriesItems:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!v8) {
    id v8 = kBKCollectionDefaultAll;
  }
  id v9 = [a1 defaultManager];
  unsigned int v10 = [v9 usePerformancePredicates];

  if (v10)
  {
    id v11 = +[NSPredicate predicateWithValue:1];
  }
  else
  {
    id v12 = +[NSMutableArray array];
    uint64_t v13 = +[NSPredicate predicateWithFormat:@"ANY collectionMembers.collection.collectionID == %@", v8];
    [v12 addObject:v13];

    if (!a4)
    {
      id v14 = +[BKLibraryManager predicateToExcludeAssetsWithExplicitContent];
      [v12 addObject:v14];
    }
    unsigned int v15 = [v8 isEqualToString:kBKCollectionDefaultAll];
    unsigned int v16 = [v8 isEqualToString:kBKCollectionDefaultIDBooks];
    unsigned int v17 = [v8 isEqualToString:kBKCollectionDefaultIDAudiobooks];
    unsigned int v18 = v17;
    if ((v15 & 1) != 0 || (v16 & 1) != 0 || v17)
    {
      id v19 = +[BKLibraryManager predicateToExcludeAssetsInASeriesContainerWithOwnedBooks];
      [v12 addObject:v19];

      id v20 = +[BKLibraryManager predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks];
      [v12 addObject:v20];

      if (v15)
      {
        id v21 = +[BKLibraryManager predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections];
        [v12 addObject:v21];
      }
      if ((v16 | v18) == 1)
      {
        id v22 = +[BKLibraryManager predicateToExcludeAssetsForUnpurchasedItemsInCollection:v8];
        [v12 addObject:v22];
      }
    }
    id v23 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
    [v12 addObject:v23];

    id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];
    if (v5)
    {
      id v24 = +[NSPredicate predicateWithFormat:@"ANY seriesContainer.collectionMembers.collection.collectionID == %@", v8];
      id v25 = +[BKLibraryManager predicateToExcludeUnownedLibraryAssets];
      v32[0] = v24;
      v32[1] = v25;
      uint64_t v26 = +[NSArray arrayWithObjects:v32 count:2];
      id v27 = +[NSCompoundPredicate andPredicateWithSubpredicates:v26];

      v31[0] = v11;
      v31[1] = v27;
      uint64_t v28 = +[NSArray arrayWithObjects:v31 count:2];
      uint64_t v29 = +[NSCompoundPredicate orPredicateWithSubpredicates:v28];

      id v11 = (void *)v29;
    }
  }

  return v11;
}

+ (id)predicateToExcludeAssetsWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:@"isExplicit == NO OR isExplicit == NULL"];
}

+ (id)predicateForAssetsWithLocalOrDownloadingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"state != %@", &off_D9E90];
}

+ (id)predicateForSeriesItemsWithSeriesIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@ AND (%K = NULL OR %K != %@)", @"seriesID", a3, @"state", @"contentType", &off_D9E30];
}

+ (id)predicateForAllOwnedBooks
{
  uint64_t v3 = +[NSMutableArray array];
  id v4 = +[NSPredicate predicateWithFormat:@"state != %@ AND state != %@ AND contentType != %@", &off_D9E30, &off_D9E48, &off_D9E30];
  [v3 addObject:v4];

  BOOL v5 = [a1 defaultManager];
  unsigned __int8 v6 = [v5 isExplicitMaterialAllowed];

  if ((v6 & 1) == 0)
  {
    id v7 = +[NSPredicate predicateWithFormat:@"isExplicit == NO OR isExplicit == NULL"];
    [v3 addObject:v7];
  }
  id v8 = [a1 predicateToExcludeAudiobookSupplementalContent];
  [v3 addObject:v8];

  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v3];

  return v9;
}

+ (id)predicateForAllOwnedAudiobooks
{
  uint64_t v3 = [a1 predicateForAllOwnedBooks];
  id v4 = [a1 predicateForAudiobooks:v3];
  v9[1] = v4;
  BOOL v5 = [a1 predicateForNonPreorders];
  void v9[2] = v5;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:v9 count:3];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks
{
  return +[NSPredicate predicateWithFormat:@"asset.contentType == %@ OR asset.seriesContainer == nil OR asset.seriesContainer.purchasedAndLocalSeriesItems.@count == 0 OR asset.seriesContainer.seriesBooks.@count == 1", &off_D9E30];
}

+ (id)predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks
{
  return +[NSPredicate predicateWithFormat:@"asset.contentType != %@ OR (asset.purchasedAndLocalSeriesItems.@count != 0 AND asset.seriesBooks.@count > 1)", &off_D9E30];
}

+ (id)predicateForCollectionMembersInCollectionID:(id)a3 hideUnownedItems:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [a1 defaultManager];
  id v8 = [v7 isExplicitMaterialAllowed];

  id v9 = [a1 predicateForCollectionMembersInCollectionID:v6 hideUnownedItems:v4 allowExplicit:v8];

  return v9;
}

+ (id)predicateForCollectionMembersInCollectionID:(id)a3 hideUnownedItems:(BOOL)a4 allowExplicit:(BOOL)a5
{
  id v7 = a3;
  if (!v7) {
    id v7 = kBKCollectionDefaultAll;
  }
  id v8 = [a1 defaultManager];
  unsigned int v9 = [v8 usePerformancePredicates];

  if (v9)
  {
    unsigned int v10 = +[NSPredicate predicateWithValue:1];
  }
  else
  {
    id v11 = +[NSMutableArray array];
    id v12 = +[NSPredicate predicateWithFormat:@"collection.collectionID == %@", v7];
    [v11 addObject:v12];

    uint64_t v13 = +[NSPredicate predicateWithFormat:@"asset != NULL"];
    [v11 addObject:v13];

    if (!a5)
    {
      id v14 = +[BKLibraryManager predicateToExcludeCollectionMembersWithExplicitContent];
      [v11 addObject:v14];
    }
    unsigned int v15 = [v7 isEqualToString:kBKCollectionDefaultAll];
    unsigned int v16 = [v7 isEqualToString:kBKCollectionDefaultIDBooks];
    unsigned int v17 = [v7 isEqualToString:kBKCollectionDefaultIDAudiobooks];
    unsigned int v18 = v17;
    if ((v15 & 1) != 0 || (v16 & 1) != 0 || v17)
    {
      id v19 = +[BKLibraryManager predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks];
      [v11 addObject:v19];

      id v20 = +[BKLibraryManager predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks];
      [v11 addObject:v20];

      if (v15)
      {
        id v21 = +[BKLibraryManager predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections];
        [v11 addObject:v21];
      }
      if ((v16 | v18) == 1)
      {
        id v22 = +[BKLibraryManager predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection:v7];
        [v11 addObject:v22];
      }
    }
    id v23 = +[BKLibraryManager predicateToExcludeCollectionMembersForAudiobookSupplementalContent];
    [v11 addObject:v23];

    unsigned int v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];
  }

  return v10;
}

+ (id)predicateToExcludeCollectionMembersWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:@"asset.isExplicit == NO OR asset.isExplicit == NULL"];
}

+ (id)predicateForCollectionMembersMatchingSearchStringLibraryAssets:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = +[NSPredicate predicateWithFormat:@"asset.title contains[cd] %@ OR asset.author contains[cd] %@ OR asset.genre contains[cd] %@ OR asset.localOnlySeriesItemsParent.title CONTAINS[cd] %@", v3, v3, v3, v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)predicateForCollectionMembersWithLocalAssets
{
  id v2 = +[NSPredicate predicateWithFormat:@"asset.state == %@ OR asset.state == %@ OR asset.state == %@", &off_D9E60, &off_D9EA8, &off_D9E78];
  id v3 = +[NSPredicate predicateWithFormat:@"asset.contentType == %@ AND asset.localOnlySeriesItems.@count > 0", &off_D9E30];
  v8[0] = v2;
  v8[1] = v3;
  BOOL v4 = +[BKLibraryManager predicateToExcludeCollectionMembersForAudiobookSupplementalContent];
  v8[2] = v4;
  BOOL v5 = +[NSArray arrayWithObjects:v8 count:3];
  id v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateToExcludeCollectionMembersWithUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"asset.state != %@ AND asset.state != %@", &off_D9E30, &off_D9E48];
}

+ (id)predicateForAllCollectionMembersExcludingSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"(asset.contentType == %@) OR (asset.state != %@)", &off_D9E30, &off_D9E30];
}

+ (id)predicateForCollectionMembersWithInTheCloudLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"asset.state == %@", &off_D9E90];
}

- (id)predicateForDownloadingStoreCollectionMembers
{
  return +[NSPredicate predicateWithFormat:@"asset.state == %@ AND asset.storeID != NULL", &off_D9EA8];
}

+ (id)predicateForCollectionMembersWithLocalOrDownloadingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"asset.state != %@", &off_D9E90];
}

+ (id)excludeCollectionMembersWithHiddenAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:@"(asset.isHidden == NO OR asset.isHidden == NULL) AND (asset.isEphemeral == NO OR asset.isEphemeral == NULL)"];
}

+ (id)predicateForExcludingCollectionMembersWithContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"asset.contentType != %@", &off_D9E30];
}

+ (id)predicateForExcludingCollectionMembersWithSideloadedAssets
{
  return +[NSPredicate predicateWithFormat:@"asset.storeID != NULL"];
}

- (BKLibraryCollectionManager)collectionManager
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_collectionManager)
  {
    id v3 = [[BKLibraryCollectionManager alloc] initWithLibraryManager:v2];
    collectionManager = v2->_collectionManager;
    v2->_collectionManager = v3;
  }
  objc_sync_exit(v2);

  BOOL v5 = v2->_collectionManager;

  return v5;
}

- (void)_newAssetIDAdded:(id)a3
{
  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  unsigned int v9 = sub_2841C;
  unsigned int v10 = &unk_D22A0;
  id v11 = self;
  id v4 = a3;
  id v12 = v4;
  uint64_t v13 = &v14;
  BOOL v5 = v8;
  os_unfair_lock_lock(&self->_notifyLockForNewAssets);
  v9((uint64_t)v5);
  os_unfair_lock_unlock(&self->_notifyLockForNewAssets);

  if (*((unsigned char *)v15 + 24))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_28498;
    block[3] = &unk_D1418;
    void block[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  _Block_object_dispose(&v14, 8);
}

- (void)waitForAssetID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_28904;
    v14[3] = &unk_D22F0;
    v14[4] = self;
    id v8 = v6;
    id v15 = v8;
    id v16 = v7;
    os_unfair_lock_lock(&self->_notifyLockForNewAssets);
    sub_28904((uint64_t)v14);
    os_unfair_lock_unlock(&self->_notifyLockForNewAssets);
    id v17 = v8;
    unsigned int v9 = +[NSArray arrayWithObjects:&v17 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_289BC;
    v12[3] = &unk_D2318;
    void v12[4] = self;
    id v13 = v8;
    [(BKLibraryManager *)self fetchLibraryAssetsFromAssetIDs:v9 handler:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v7);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
}

- (id)libraryAssetsWithAssetIDsContainedInList:(id)a3 tempAssetIDs:(id)a4 inManagedObjectContext:(id)a5
{
  return +[BKLibraryManager libraryAssetsWithAssetIDsContainedInList:a3 tempAssetIDs:a4 inManagedObjectContext:a5];
}

- (id)insertNewLibraryAssetWithIdentifier:(id)a3 assetID:(id)a4 orTemporaryAssetID:(id)a5 type:(signed __int16)a6 inManagedObjectContext:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a4;
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  id v16 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKLibraryAsset" inManagedObjectContext:v13];
  [v16 setAssetID:v12];
  [v16 setTemporaryAssetID:v14];

  [v16 setDataSourceIdentifier:v15];
  [v16 setContentType:v8];
  [v16 setCreationDateToNow];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_28B64;
  v19[3] = &unk_D1418;
  v19[4] = self;
  id v20 = v12;
  id v17 = v12;
  [v13 performBlock:v19];

  return v16;
}

- (id)sortDescriptorsForMode:(unint64_t)a3 collectionID:(id)a4
{
  id v6 = a4;
  id v7 = [(BKLibraryManager *)self collectionProvider];
  unsigned int v8 = [v7 isAllBooksCollection:v6];

  switch(a3)
  {
    case 0uLL:
      id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"seriesSortKey" ascending:1];
      id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:1];
      id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:0];
      v26[0] = v9;
      v26[1] = v10;
      void v26[2] = v11;
      id v12 = v26;
      goto LABEL_15;
    case 1uLL:
      id v17 = objc_alloc((Class)NSSortDescriptor);
      if (v8)
      {
        id v9 = [v17 initWithKey:@"lastOpenDate" ascending:0];
        id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:0];
        id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:0];
        v25[0] = v9;
        v25[1] = v10;
        void v25[2] = v11;
        id v12 = v25;
      }
      else
      {
        id v9 = [v17 initWithKey:@"sortKey" ascending:0];
        id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:0];
        id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"seriesSortKey" ascending:1];
        v24[0] = v9;
        v24[1] = v10;
        v24[2] = v11;
        id v12 = v24;
      }
      goto LABEL_15;
    case 2uLL:
      id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:0];
      id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortTitle" ascending:1 selector:"localizedStandardCompare:"];
      id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"assetID" ascending:1];
      id v14 = objc_alloc((Class)NSSortDescriptor);
      if (v8) {
        CFStringRef v15 = @"lastOpenDate";
      }
      else {
        CFStringRef v15 = @"sortKey";
      }
      id v16 = [v14 initWithKey:v15 ascending:0];
      v23[0] = v16;
      v23[1] = v9;
      v23[2] = v10;
      v23[3] = v11;
      id v13 = +[NSArray arrayWithObjects:v23 count:4];

      goto LABEL_16;
    case 3uLL:
      id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortTitle" ascending:1 selector:"localizedStandardCompare:"];
      id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"assetID" ascending:1];
      v22[0] = v9;
      v22[1] = v10;
      id v13 = +[NSArray arrayWithObjects:v22 count:2];
      goto LABEL_17;
    case 4uLL:
      id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortAuthor" ascending:1 selector:"localizedStandardCompare:"];
      id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortTitle" ascending:1 selector:"localizedStandardCompare:"];
      id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"assetID" ascending:1];
      v21[0] = v9;
      v21[1] = v10;
      v21[2] = v11;
      id v12 = v21;
      goto LABEL_15;
    case 5uLL:
      id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"genre" ascending:1 selector:"localizedCaseInsensitiveCompare:"];
      id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortTitle" ascending:1 selector:"localizedStandardCompare:"];
      id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"assetID" ascending:1];
      v20[0] = v9;
      v20[1] = v10;
      v20[2] = v11;
      id v12 = v20;
      goto LABEL_15;
    case 6uLL:
      id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"dateFinished" ascending:0];
      id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortTitle" ascending:1 selector:"localizedStandardCompare:"];
      id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"assetID" ascending:1];
      v19[0] = v9;
      v19[1] = v10;
      v19[2] = v11;
      id v12 = v19;
LABEL_15:
      id v13 = +[NSArray arrayWithObjects:v12 count:3];
LABEL_16:

LABEL_17:
      break;
    default:
      id v13 = 0;
      break;
  }

  return v13;
}

- (id)predicateForMostRecentBooksOpened
{
  id v16 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  id v3 = [(BKLibraryManager *)self predicateForLocalLibraryAssets];
  CFStringRef v15 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  id v4 = +[BKLibraryManager predicateForContentType:6];
  v19[0] = v4;
  BOOL v5 = +[BKLibraryManager predicateForExcludingUnownedAudiobookAssets];
  v19[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v19 count:2];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  if (BLAudiobookStreamingEnabled())
  {
    v18[0] = v3;
    v18[1] = v7;
    unsigned int v8 = +[NSArray arrayWithObjects:v18 count:2];
    id v9 = +[NSCompoundPredicate orPredicateWithSubpredicates:v8];
  }
  else
  {
    id v9 = v3;
  }
  id v10 = +[NSPredicate predicateWithFormat:@"(%K != NULL) && (%K == NULL)", @"lastOpenDate", @"expectedDate"];
  if ([(BKLibraryManager *)self isExplicitMaterialAllowed]) {
    +[NSPredicate predicateWithValue:1];
  }
  else {
  id v11 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
  }
  v17[0] = v9;
  v17[1] = v16;
  v17[2] = v10;
  v17[3] = v11;
  v17[4] = v15;
  id v12 = +[NSArray arrayWithObjects:v17 count:5];
  id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

  return v13;
}

- (id)mostRecentlyOpenedBooks:(unint64_t)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v7 setFetchLimit:a3];
  unsigned int v8 = [(BKLibraryManager *)self predicateForMostRecentBooksOpened];
  [v7 setPredicate:v8];

  [v7 setReturnsObjectsAsFaults:0];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastOpenDate" ascending:0];
  id v14 = v9;
  id v10 = +[NSArray arrayWithObjects:&v14 count:1];
  [v7 setSortDescriptors:v10];

  uint64_t v13 = 0;
  id v11 = [v6 executeFetchRequest:v7 error:&v13];

  return v11;
}

- (id)mostRecentlyOpenedLibraryAssetWithTypes:(id)a3 inManagedObjectContext:(id)a4
{
  id v4 = [(BKLibraryManager *)self mostRecentlyOpenedLibraryAssetsWithTypes:a3 limit:1 inManagedObjectContext:a4];
  BOOL v5 = [v4 firstObject];

  return v5;
}

- (id)mostRecentlyOpenedLibraryAssetsWithTypes:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(BKLibraryManager *)self predicateForMostRecentBooksOpened];
  if (v8)
  {
    id v11 = +[BKLibraryManager predicateForContentTypes:v8];
    v21[0] = v10;
    v21[1] = v11;
    id v12 = +[NSArray arrayWithObjects:v21 count:2];
    uint64_t v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

    id v10 = (void *)v13;
  }
  id v14 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v14 setPredicate:v10];
  [v14 setReturnsObjectsAsFaults:0];
  id v15 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastOpenDate" ascending:0];
  id v20 = v15;
  id v16 = +[NSArray arrayWithObjects:&v20 count:1];
  [v14 setSortDescriptors:v16];

  if (a4) {
    [v14 setFetchLimit:a4];
  }
  uint64_t v19 = 0;
  id v17 = [v9 executeFetchRequest:v14 error:&v19];

  return v17;
}

- (id)mostRecentlyEngagedLibraryAssetWithTypes:(id)a3 inManagedObjectContext:(id)a4
{
  id v4 = [(BKLibraryManager *)self mostRecentlyEngagedLibraryAssetsWithTypes:a3 limit:1 inManagedObjectContext:a4];
  BOOL v5 = [v4 firstObject];

  return v5;
}

- (id)mostRecentlyEngagedLibraryAssetsWithTypes:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[BKLibraryManager _recentlyEngagedPredicate];
  if (v7)
  {
    id v10 = +[BKLibraryManager predicateForContentTypes:v7];
    v20[0] = v9;
    v20[1] = v10;
    id v11 = +[NSArray arrayWithObjects:v20 count:2];
    uint64_t v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

    id v9 = (void *)v12;
  }
  id v13 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v13 setPredicate:v9];
  [v13 setReturnsObjectsAsFaults:0];
  id v14 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastEngagedDate" ascending:0];
  id v19 = v14;
  id v15 = +[NSArray arrayWithObjects:&v19 count:1];
  [v13 setSortDescriptors:v15];

  if (a4) {
    [v13 setFetchLimit:a4];
  }
  uint64_t v18 = 0;
  id v16 = [v8 executeFetchRequest:v13 error:&v18];

  return v16;
}

- (id)libraryAssetsAsDictionaryWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_89D0;
  id v19 = sub_89E0;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_29984;
  v10[3] = &unk_D2340;
  id v14 = &v15;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = self;
  id v7 = v5;
  id v13 = v7;
  [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v8;
}

- (id)predicateFor_AllBooks_LibraryAssets
{
  id v3 = +[NSMutableArray array];
  id v4 = +[BKLibraryManager _predicateForBooksShownInAllBooks];
  [v3 addObject:v4];

  dispatch_semaphore_t v5 = +[BKLibraryManager predicateForAllBooksExceptSeriesLibraryAssets];
  [v3 addObject:v5];

  if (![(BKLibraryManager *)self isExplicitMaterialAllowed])
  {
    id v6 = +[BKLibraryManager predicateToExcludeLibraryAssetsAndContainersWithExplicitContent];
    [v3 addObject:v6];
  }
  id v7 = +[BKLibraryManager excludeEphemeralAssetsPredicate];
  [v3 addObject:v7];

  id v8 = [(id)objc_opt_class() predicateToExcludeAudiobookSupplementalContent];
  [v3 addObject:v8];

  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v3];

  return v9;
}

+ (id)predicateForContentType:(signed __int16)a3
{
  return +[NSPredicate predicateWithFormat:@"(%K == %d)", @"contentType", a3];
}

+ (id)predicateForNotContentType:(signed __int16)a3
{
  return +[NSPredicate predicateWithFormat:@"(%K != %d)", @"contentType", a3];
}

+ (id)predicateForContentTypes:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@", @"contentType", a3];
}

+ (id)predicateForNotContentTypes:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"NOT (%K IN %@)", @"contentType", a3];
}

+ (id)predicateForAudiobooks
{
  return [a1 predicateForContentType:6];
}

+ (id)predicateForNonPreorders
{
  return +[NSPredicate predicateWithFormat:@"(%K == nil)", @"expectedDate"];
}

- (id)predicateFor_AllAudioBooks_LibraryAssets
{
  id v3 = [(id)objc_opt_class() predicateForContentType:6];
  v8[0] = v3;
  id v4 = [(BKLibraryManager *)self predicateFor_AllBooks_LibraryAssets];
  v8[1] = v4;
  dispatch_semaphore_t v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  return v6;
}

- (id)predicateFor_All_PDFs_LibraryAssets
{
  id v3 = [(id)objc_opt_class() predicateForContentType:3];
  v8[0] = v3;
  id v4 = [(BKLibraryManager *)self predicateFor_AllBooks_LibraryAssets];
  v8[1] = v4;
  dispatch_semaphore_t v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  return v6;
}

- (id)predicateFor_All_Downloaded_LibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"state", &off_D9E60];
}

+ (id)predicateFor_All_Finished_LibraryAssets
{
  id v3 = [a1 defaultManager];
  id v4 = [v3 isExplicitMaterialAllowed];

  return [a1 predicateFor_All_Finished_LibraryAssetsAllowsExplicit:v4];
}

+ (id)predicateFor_All_Finished_LibraryAssetsAllowsExplicit:(BOOL)a3
{
  dispatch_semaphore_t v5 = +[NSMutableArray array];
  LODWORD(v6) = kAEAnnotationReadingLocationSignificantHighwaterMark;
  id v7 = +[NSNumber numberWithFloat:v6];
  id v8 = +[NSPredicate predicateWithFormat:@"isFinished == YES OR (bookHighWaterMarkProgress >= %@ AND (notFinished == NULL OR notFinished == NO) OR (dateFinished != NULL))", v7];
  [v5 addObject:v8];

  if (!a3)
  {
    id v9 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
    [v5 addObject:v9];
  }
  id v10 = [a1 predicateToExcludeAudiobookSupplementalContent];
  [v5 addObject:v10];

  id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  return v11;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets
{
  id v3 = [a1 defaultManager];
  id v4 = [v3 isExplicitMaterialAllowed];

  return _objc_msgSend(a1, "predicateFor_All_Marked_As_Finished_LibraryAssetsAllowsExplicit:", v4);
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssetsAllowsExplicit:(BOOL)a3
{
  dispatch_semaphore_t v5 = +[NSMutableArray array];
  double v6 = +[NSPredicate predicateWithFormat:@"isFinished == YES"];
  [v5 addObject:v6];

  if (!a3)
  {
    id v7 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
    [v5 addObject:v7];
  }
  id v8 = [a1 predicateToExcludeAudiobookSupplementalContent];
  [v5 addObject:v8];

  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  return v9;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_In_Year:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v21 = +[BKLibraryManager _dateComponentsForYear:a3];
  id v20 = [v4 dateFromComponents:v21];
  int64_t v5 = a3 + 1;
  [v21 setYear:a3 + 1];
  id v19 = [v4 dateFromComponents:v21];
  id v16 = +[NSPredicate predicateWithFormat:@"dateFinished >= %@ AND dateFinished < %@ AND finishedDateKind != %i", v20, v19, 2];
  double v6 = +[BKLibraryManager _dateComponentsForYear:a3];
  id v7 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v6 setTimeZone:v7];

  uint64_t v17 = [v4 dateFromComponents:v6];
  [v6 setYear:v5];
  id v8 = [v4 dateFromComponents:v6];
  id v9 = +[NSPredicate predicateWithFormat:@"dateFinished >= %@ AND dateFinished < %@ AND finishedDateKind == %i", v17, v8, 2];
  v23[0] = v16;
  v23[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v23 count:2];
  id v11 = +[NSCompoundPredicate orPredicateWithSubpredicates:v10];

  v22[0] = v11;
  uint64_t v12 = [a1 predicateFor_All_Marked_As_Finished_LibraryAssets];
  v22[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v22 count:2];
  id v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_Prior_To_Year:(int64_t)a3
{
  id v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v19 = +[BKLibraryManager _dateComponentsForYear:a3];
  uint64_t v18 = [v5 dateFromComponents:v19];
  double v6 = +[NSDate distantPast];
  id v7 = +[NSPredicate predicateWithFormat:@"dateFinished < %@ AND dateFinished > %@ AND finishedDateKind != %i", v18, v6, 2];

  id v8 = +[BKLibraryManager _dateComponentsForYear:a3];
  id v9 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v8 setTimeZone:v9];

  id v10 = [v5 dateFromComponents:v8];
  id v11 = +[NSPredicate predicateWithFormat:@"dateFinished < %@ AND finishedDateKind == %i", v10, 2];
  v21[0] = v7;
  v21[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v21 count:2];
  id v13 = +[NSCompoundPredicate orPredicateWithSubpredicates:v12];

  v20[0] = v13;
  [a1 predicateFor_All_Marked_As_Finished_LibraryAssets];
  v20[1] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v20 count:2];
  id v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];

  return v16;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_After_Year:(int64_t)a3
{
  id v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  uint64_t v18 = +[BKLibraryManager _dateComponentsForYear:a3 + 1];
  uint64_t v17 = [v5 dateFromComponents:v18];
  double v6 = +[NSPredicate predicateWithFormat:@"dateFinished >= %@ AND finishedDateKind != %i", v17, 2];
  id v7 = +[BKLibraryManager _dateComponentsForYear:a3 + 1];
  id v8 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v7 setTimeZone:v8];

  id v9 = [v5 dateFromComponents:v7];
  id v10 = +[NSPredicate predicateWithFormat:@"dateFinished >= %@ AND finishedDateKind == %i", v9, 2];
  v20[0] = v6;
  v20[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v20 count:2];
  uint64_t v12 = +[NSCompoundPredicate orPredicateWithSubpredicates:v11];

  v19[0] = v12;
  id v13 = [a1 predicateFor_All_Marked_As_Finished_LibraryAssets];
  v19[1] = v13;
  id v14 = +[NSArray arrayWithObjects:v19 count:2];
  uint64_t v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];

  return v15;
}

+ (id)_dateComponentsForYear:(int64_t)a3
{
  id v4 = +[NSTimeZone systemTimeZone];
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setYear:a3];
  [v5 setDay:1];
  [v5 setMonth:1];
  [v5 setTimeZone:v4];

  return v5;
}

- (id)predicateForLocalStoreAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL AND %K == %@", @"storeID", @"state", &off_D9E60];
}

+ (id)predicateForNotSamplesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K = NULL OR %K = 0", @"isSample", @"isSample"];
}

+ (id)predicateForNonEphemeralSamplesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"            %K != %@ AND             %K = 1 AND             (%K = NULL OR %K = 0)", @"contentType", &off_D9E30, @"isSample", @"isEphemeral", @"isEphemeral"];
}

+ (id)predicateToExcludeCollectionMembersForSeriesAndStoreItems
{
  return +[NSPredicate predicateWithFormat:@"asset.state != %@ AND (asset.state != %@ || asset.contentType == %@)", &off_D9E48, &off_D9E30, &off_D9E30];
}

+ (id)predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections
{
  id v2 = [a1 predicateToExcludeCollectionMembersForSeriesAndStoreItems];
  v9[0] = v2;
  v8[0] = kBKCollectionDefaultAll;
  v8[1] = kBKCollectionDefaultIDBooks;
  void v8[2] = kBKCollectionDefaultIDAudiobooks;
  id v3 = +[NSArray arrayWithObjects:v8 count:3];
  id v4 = +[NSPredicate predicateWithFormat:@"SUBQUERY(asset.collectionMembers, $collectionMember, NOT $collectionMember.collection.collectionID IN %@).@count > 0", v3];
  v9[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v9 count:2];
  double v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection:(id)a3
{
  uint64_t v3 = kBKCollectionDefaultIDAudiobooks;
  id v4 = [a3 isEqualToString:kBKCollectionDefaultIDAudiobooks];
  if (v4) {
    uint64_t v5 = kBKCollectionDefaultIDBooks;
  }
  else {
    uint64_t v5 = v3;
  }
  double v6 = +[BKCollection contentTypesForDefaultCollectionWithID:v5];
  id v7 = +[NSNumber numberWithBool:v4];
  id v8 = +[NSPredicate predicateWithFormat:@"(asset.%K = NULL OR asset.%K = 0) AND !(asset.%K IN %@) AND (asset.%K != %@ AND (asset.%K != %@ OR (asset.%K == %@ AND asset.seriesBooks.@count > 1 AND ANY asset.seriesBooks.%K == %@)))", @"isSample", @"isSample", @"contentType", v6, @"state", &off_D9E48, @"state", &off_D9E30, @"contentType", &off_D9E30, @"isStoreAudiobook", v7];

  return v8;
}

+ (id)predicateToExcludeCollectionMembersForAudiobookSupplementalContent
{
  return +[NSPredicate predicateWithFormat:@"asset.%K == NO OR asset.%K == NULL", @"isSupplementalContent", @"isSupplementalContent"];
}

- (id)predicateForLocalBooksWithSeriesID:(id)a3
{
  return [(BKLibraryManager *)self contentPredicateForSeriesID:a3 onlyPurchased:1 forceCloud:0];
}

- (id)predicateForAllBooksWithSeriesID:(id)a3
{
  return [(BKLibraryManager *)self contentPredicateForSeriesID:a3 onlyPurchased:0 forceCloud:0];
}

- (id)predicateForAllBooksWithSeriesID:(id)a3 forcefullyIncludePurchasedBooks:(BOOL)a4
{
  return [(BKLibraryManager *)self contentPredicateForSeriesID:a3 onlyPurchased:0 forceCloud:a4];
}

- (id)validLibraryAssetIDsOnMainQueueWithAssetIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    double v6 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", v4];
    [v5 setPredicate:v6];

    [v5 setResultType:2];
    CFStringRef v13 = @"assetID";
    id v7 = +[NSArray arrayWithObjects:&v13 count:1];
    [v5 setPropertiesToFetch:v7];

    id v8 = [(BKLibraryManager *)self uiChildContext];
    uint64_t v12 = 0;
    id v9 = [v8 executeFetchRequest:v5 error:&v12];

    id v10 = [v9 valueForKeyPath:@"assetID"];
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)libraryAssetOnMainQueueWithAssetID:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = [(BKLibraryManager *)self uiChildContext];
  double v6 = [(BKLibraryManager *)self libraryAssetWithAssetID:v4 inManagedObjectContext:v5];

  return v6;
}

- (id)libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = [(BKLibraryManager *)self uiChildContext];
  double v6 = [(BKLibraryManager *)self libraryAssetWithPermanentOrTemporaryAssetID:v4 inManagedObjectContext:v5];

  return v6;
}

- (id)libraryAssetOnMainQueueWithAssetIdentifier:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = [(BKLibraryManager *)self uiChildContext];
  double v6 = [(BKLibraryManager *)self libraryAssetWithAssetIdentifier:v4 inManagedObjectContext:v5];

  return v6;
}

- (id)libraryAssetOnMainQueueWithStoreID:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"storeID", v4];
  double v6 = [(BKLibraryManager *)self uiChildContext];
  id v7 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v4 predicate:v5 inManagedObjectContext:v6];

  return v7;
}

- (id)libraryAssetOnMainQueueWithEpubID:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"epubID", v4];
  double v6 = [(BKLibraryManager *)self uiChildContext];
  id v7 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v4 predicate:v5 inManagedObjectContext:v6];

  return v7;
}

- (id)libraryAssetOnMainQueueWithFilename:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  id v5 = +[NSPredicate predicateWithFormat:@"%K CONTAINS %@", @"path", v4];
  double v6 = [(BKLibraryManager *)self uiChildContext];
  id v7 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v4 predicate:v5 inManagedObjectContext:v6];

  return v7;
}

- (id)libraryAssetWithAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BKLibraryManager predicateForAssetIDTaggedLibraryAsset:v7];
  id v9 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v7 predicate:v8 inManagedObjectContext:v6];

  return v9;
}

- (id)libraryAssetsWithAssetIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v7 setReturnsObjectsAsFaults:0];
  id v8 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", v5];
  [v7 setPredicate:v8];

  id v13 = 0;
  id v9 = [v6 executeFetchRequest:v7 error:&v13];

  id v10 = v13;
  if (v10)
  {
    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_90CB0();
    }
  }

  return v9;
}

+ (id)stringByEscapingSearchString:(id)a3
{
  id v3 = [a3 mutableCopy];
  [v3 replaceOccurrencesOfString:@"\\" withString:@"\\\\" options:0 range:NSMakeRange(0, [v3 length])];
  [v3 replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:0 range:NSMakeRange(0, [v3 length])];
  [v3 replaceOccurrencesOfString:@"'" withString:@"\\'" options:0 range:NSMakeRange(0, [v3 length])];
  [v3 replaceOccurrencesOfString:@"*" withString:@"\\*" options:0 range:NSMakeRange(0, [v3 length])];

  return v3;
}

+ (id)queryStringForSearchString:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() stringByEscapingSearchString:v5];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_89D0;
  id v21 = sub_89E0;
  id v22 = objc_alloc_init((Class)NSMutableArray);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_2B710;
  id v14 = &unk_D2368;
  id v8 = v7;
  id v15 = v8;
  id v16 = &v17;
  [v6 enumerateObjectsUsingBlock:&v11];
  id v9 = [v18[5] componentsJoinedByString:@" || " v11, v12, v13, v14];

  _Block_object_dispose(&v17, 8);

  return v9;
}

- (id)appIntentsLibraryAssetsWithTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(BKLibraryManager *)self _fetchLibraryAssetsWithTypes:v8 searchTerm:v9 inManagedObjectContext:v10];
  if (![v11 count])
  {
    uint64_t v12 = [(BKLibraryManager *)self _spotlightAssetsWithContentTypes:v8 searchTerm:v9 inManagedObjectContext:v10];

    id v11 = (void *)v12;
  }

  return v11;
}

- (id)_fetchLibraryAssetsWithTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[BKLibraryManager predicateForAssetsAvailableToAppIntentsWithTypes:a3];
  if ([v8 length])
  {
    id v11 = +[NSPredicate predicateWithFormat:@"%K contains[cd] %@ OR %K contains[cd] %@ OR %K contains[cd] %@", @"title", v8, @"purchasedAndLocalParent.title", v8, @"author", v8];
    v21[0] = v10;
    v21[1] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v21 count:2];
    uint64_t v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

    id v10 = (void *)v13;
  }
  id v14 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v14 setReturnsObjectsAsFaults:0];
  [v14 setPredicate:v10];
  id v15 = [(BKLibraryManager *)self sortDescriptorsForMode:3 collectionID:kBKCollectionDefaultAll];
  [v14 setSortDescriptors:v15];

  id v20 = 0;
  id v16 = [v9 executeFetchRequest:v14 error:&v20];

  id v17 = v20;
  if (v17)
  {
    uint64_t v18 = BKLibraryLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_90D18();
    }
  }

  return v16;
}

- (id)_spotlightAssetsWithContentTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  +[NSMutableArray array];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_2BE0C;
  v41[3] = &unk_D2390;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v42 = v12;
  char v32 = v8;
  [v8 enumerateObjectsUsingBlock:v41];
  id v30 = v12;
  uint64_t v13 = [v12 componentsJoinedByString:@" || "];
  id v31 = v9;
  uint64_t v28 = +[BKLibraryManager queryStringForSearchString:v9 attributes:&off_DA070];
  uint64_t v29 = (void *)v13;
  id v27 = +[NSString stringWithFormat:@"(%@) && (%@)", v13, v28];
  id v14 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v27 attributes:&off_DA088];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_2BEA4;
  void v39[3] = &unk_D23B8;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  id v40 = v15;
  [v14 setFoundItemsHandler:v39];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_2BFC4;
  v37[3] = &unk_D23E0;
  id v16 = dispatch_semaphore_create(0);
  long long v38 = v16;
  [v14 setCompletionHandler:v37];
  uint64_t v26 = v14;
  [v14 start];
  id v25 = v16;
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = +[BKAssetID identifierWithAssetID:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        id v23 = [(BKLibraryManager *)self libraryAssetWithAssetIdentifier:v22 inManagedObjectContext:v10];

        if (v23) {
          [v11 addObject:v23];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v19);
  }

  return v11;
}

- (id)libraryAssetWithTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BKLibraryManager predicateForTemporaryAssetIDTaggedLibraryAsset:v7];
  id v9 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v7 predicate:v8 inManagedObjectContext:v6];

  return v9;
}

- (id)libraryAssetWithPermanentOrTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BKLibraryManager predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:v7];
  id v9 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v7 predicate:v8 inManagedObjectContext:v6];

  return v9;
}

- (id)libraryAssetWithAssetIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 permanentOrTemporaryAssetID];
  id v9 = +[BKLibraryManager predicateForAssetIdentifierTaggedLibraryAsset:v7];

  id v10 = [(BKLibraryManager *)self p_libraryAssetWithIdentifier:v8 predicate:v9 inManagedObjectContext:v6];

  return v10;
}

- (id)p_libraryAssetWithIdentifier:(id)a3 predicate:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    [v10 setReturnsObjectsAsFaults:0];
    [v10 setFetchLimit:1];
    [v10 setPredicate:v9];

    id v16 = 0;
    id v11 = [v8 executeFetchRequest:v10 error:&v16];

    id v12 = v16;
    if (v11)
    {
      uint64_t v13 = [v11 lastObject];
    }
    else
    {
      id v14 = BKLibraryLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_90D80();
      }

      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)libraryMutableAssetWithAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    [v7 setReturnsObjectsAsFaults:0];
    [v7 setFetchLimit:1];
    id v20 = v5;
    id v8 = +[NSArray arrayWithObjects:&v20 count:1];
    id v9 = +[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:v8];
    [v7 setPredicate:v9];

    id v15 = 0;
    id v10 = [v6 executeFetchRequest:v7 error:&v15];
    id v11 = v15;
    if (v10)
    {
      id v12 = [v10 lastObject];
    }
    else
    {
      uint64_t v13 = BKLibraryLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CFSetCallBacks buf = 138412546;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Failed to fetch LibraryAsset with AssetID {%@}{%@}", buf, 0x16u);
      }

      id v12 = 0;
    }
  }
  else
  {
    id v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_90DE8();
    }
    id v12 = 0;
  }

  return v12;
}

- (id)libraryMutableAssetWithPermanentOrTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    [v7 setReturnsObjectsAsFaults:0];
    [v7 setFetchLimit:1];
    id v8 = +[BKLibraryManager predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:v5];
    [v7 setPredicate:v8];

    id v14 = 0;
    id v9 = [v6 executeFetchRequest:v7 error:&v14];
    id v10 = v14;
    if (v9)
    {
      id v11 = [v9 lastObject];
    }
    else
    {
      id v12 = BKLibraryLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CFSetCallBacks buf = 138412546;
        id v16 = v5;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Failed to fetch LibraryAsset with temporaryAssetID {%@}{%@}", buf, 0x16u);
      }

      id v11 = 0;
    }
  }
  else
  {
    id v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_90DE8();
    }
    id v11 = 0;
  }

  return v11;
}

- (id)libraryMutableAssetWithAssetIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    [v7 setReturnsObjectsAsFaults:0];
    [v7 setFetchLimit:1];
    id v8 = +[BKLibraryManager predicateForAssetIdentifierTaggedLibraryAsset:v5];
    [v7 setPredicate:v8];

    id v14 = 0;
    id v9 = [v6 executeFetchRequest:v7 error:&v14];
    id v10 = v14;
    if (v9)
    {
      id v11 = [v9 lastObject];
    }
    else
    {
      id v12 = BKLibraryLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CFSetCallBacks buf = 138412546;
        id v16 = v5;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Failed to fetch LibraryAsset with assetIdentifier {%@}{%@}", buf, 0x16u);
      }

      id v11 = 0;
    }
  }
  else
  {
    id v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_90E1C();
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)predicateForLocalAssetsNeedingFileSizeUpdates
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ AND (%K == 0 OR %K == NULL OR %K == NULL)", @"state", &off_D9E60, @"fileSize", @"fileSize", @"fileOnDiskLastTouchDate"];
}

+ (id)predicateForLocalAssetsNeedingEpubIDUpdates
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ AND %K == NULL AND (%K == NULL OR %K == %@)", @"state", &off_D9E60, @"epubID", @"path", @"path", &stru_D4160];
}

+ (id)predicateForLocalAssetsNeedingEpubIDUpdatesFromAssetIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@ AND %K == %@ AND %K == NULL", @"assetID", a3, @"state", &off_D9E60, @"epubID"];
}

+ (id)predicateForAssetIDsTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", a3];
}

+ (id)predicateForAssetIDTaggedLibraryAsset:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K = %@", @"assetID", a3];
}

+ (id)predicateForTemporaryAssetIDTaggedLibraryAsset:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K = %@", @"temporaryAssetID", a3];
}

+ (id)predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K = %@ OR %K = %@", @"assetID", a3, @"temporaryAssetID", a3];
}

+ (id)predicateForAssetIdentifierTaggedLibraryAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 permanentOrTemporaryAssetID];
  id v5 = [v3 permanentOrTemporaryAssetID];

  id v6 = +[NSPredicate predicateWithFormat:@"%K = %@ OR %K = %@", @"assetID", v4, @"temporaryAssetID", v5];

  return v6;
}

+ (id)predicateForLibraryAssetWithValidAssetID
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != 0", @"assetID", @"assetID"];
}

- (id)predicateForLibraryAssetsWithSeriesID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKLibraryManager *)self isExplicitMaterialAllowed];
  id v6 = +[NSPredicate predicateWithFormat:@"%K = %@ AND (%K = NULL OR %K != %@)", @"seriesID", v4, @"state", @"contentType", &off_D9E30];

  if (v5)
  {
    id v7 = v6;
  }
  else
  {
    v11[0] = v6;
    id v8 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
    v11[1] = v8;
    id v9 = +[NSArray arrayWithObjects:v11 count:2];
    id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  }

  return v7;
}

+ (id)predicateForLibraryAssetsMarkedAsNew
{
  id v2 = +[NSNull null];
  id v3 = +[NSPredicate predicateWithFormat:@"(%K == %@) AND (%K == %@ OR %K == %@)", @"isNew", &__kCFBooleanTrue, @"isSample", v2, @"isSample", &__kCFBooleanFalse];

  return v3;
}

+ (id)predicateForExcludingContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != %@", @"contentType", &off_D9E30];
}

+ (id)predicateForExcludingUnownedAudiobookAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != %@ OR %K != %@", @"contentType", &off_D9E48, @"state", &off_D9E48];
}

- (id)predicateForPurchasedBooksAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != %@ AND %K != %@ AND isSample == NO", @"storeID", @"state", &off_D9E30, @"state", &off_D9E48];
}

+ (id)predicateForAllStoreLibraryAssets
{
  id v2 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"storeID"];
  v7[0] = v2;
  id v3 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v7[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v7 count:2];
  unsigned __int8 v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

  return v5;
}

+ (id)predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets
{
  id v2 = +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != %@ AND isSample == NO", @"storeID", @"state", &off_D9E30];
  v7[0] = v2;
  id v3 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v7[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v7 count:2];
  unsigned __int8 v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

  return v5;
}

+ (id)predicateForPurchasedLibraryAssets
{
  id v3 = +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != %@ AND isSample == NO AND %K != NULL", @"storeID", @"state", &off_D9E30, @"purchaseDate"];
  v8[0] = v3;
  id v4 = [a1 predicateToExcludeAudiobookSupplementalContent];
  v8[1] = v4;
  unsigned __int8 v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateForDownloadableStoreLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != 0 AND %K != NULL", @"storeID", @"storeID"];
}

- (id)predicateForLocalLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"state", &off_D9E60];
}

- (id)predicateForDownloadingStoreLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ AND %K != NULL", @"state", &off_D9EA8, @"storeID"];
}

+ (id)predicateForLocalOrDownloadingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"(%K == %@ OR %K == %@ OR %K == %@ OR %K == %@) AND isSample == NO", @"state", &off_D9E60, @"state", &off_D9EA8, @"state", &off_D9E78, @"contentType", &off_D9E30];
}

+ (id)predicateForLocalOrDownloadingLibraryAssetsIncludingSamples
{
  return +[NSPredicate predicateWithFormat:@"(%K == %@ OR %K == %@ OR %K == %@ OR %K == %@)", @"state", &off_D9E60, @"state", &off_D9EA8, @"state", &off_D9E78, @"contentType", &off_D9E30];
}

+ (id)predicateForLocalOrDownloadingStoreAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL AND (%K == %@ OR %K == %@ OR %K == %@) AND isSample == NO", @"storeID", @"state", &off_D9E60, @"state", &off_D9EA8, @"state", &off_D9E78, @"contentType"];
}

+ (id)predicateForNonLocalAndNonDownloadingStoreAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL AND (%K != %@ AND %K != %@ AND %K != %@) AND isSample == NO", @"storeID", @"state", &off_D9E60, @"state", &off_D9EA8, @"state", &off_D9E78, @"contentType"];
}

+ (id)predicateForAllBooksExceptSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"(%K == %@) OR (%K != %@)", @"contentType", &off_D9E30, @"state", &off_D9E30];
}

+ (id)_predicateForBooksShownInAllBooks
{
  return +[NSPredicate predicateWithFormat:@"(%K.%K.@count = 1 AND %K < %f) OR (%K = NULL AND %K != %@ AND %K != %@) OR (%K.@count > 1 OR (ANY %K.%K > %f))", @"purchasedAndLocalParent", @"purchasedAndLocalSeriesItems", @"bookHighWaterMarkProgress", 0x3FE99999A0000000, @"purchasedAndLocalParent", @"contentType", &off_D9E30, @"state", &off_D9E30, @"purchasedAndLocalSeriesItems", @"purchasedAndLocalSeriesItems", @"bookHighWaterMarkProgress", 0x3FE99999A0000000];
}

+ (id)predicateForBooksShownInAllBooks
{
  id v2 = [a1 _predicateForBooksShownInAllBooks];
  v7[0] = v2;
  id v3 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v7[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v7 count:2];
  unsigned __int8 v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:v4];

  return v5;
}

+ (id)predicateToExcludeLibraryAssetsWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:@"%K == NO OR %K == NULL", @"isExplicit", @"isExplicit"];
}

+ (id)predicateToExcludeLibraryAssetsAndAssetsInSeriesContainersWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:@"(%K == NO OR %K == NULL) AND (%K.%K == NO OR %K.%K == NULL)", @"isExplicit", @"isExplicit", @"seriesContainer", @"isExplicit", @"seriesContainer", @"isExplicit"];
}

+ (id)predicateToExcludeLibraryAssetsAndContainersWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:@"(%K == NO OR %K == NULL) AND (%K != %@ OR (ANY %K.%K = NO OR ANY %K.%K == NULL))", @"isExplicit", @"isExplicit", @"contentType", &off_D9E30, @"purchasedAndLocalSeriesItems", @"isExplicit", @"purchasedAndLocalSeriesItems", @"isExplicit"];
}

+ (id)predicateForContentWithHighWaterMarkOrReadingProgressValue:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unsigned __int8 v5 = +[NSNumber numberWithDouble:a3];
  id v6 = +[NSPredicate predicateWithFormat:@"(%K >= %@ OR %K >= %@)", @"bookHighWaterMarkProgress", v4, @"readingProgress", v5];

  return v6;
}

+ (id)predicateForLastOpenedDateAfter:(id)a3
{
  if (a3)
  {
    id v4 = +[NSPredicate predicateWithFormat:@"(%K >= %@)", @"lastOpenDate", a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (unint64_t)numberOfLibraryAssetsInManagdObjectContext:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  unsigned __int8 v5 = +[BKLibraryManager predicateToExcludeUnownedLibraryAssets];
  v15[0] = v5;
  id v6 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v15[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v15 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  [v4 setResultType:4];
  id v14 = 0;
  id v9 = [v3 executeFetchRequest:v4 error:&v14];

  id v10 = v14;
  if (v9)
  {
    id v11 = [v9 lastObject];
    id v12 = [v11 unsignedIntegerValue];
  }
  else
  {
    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_90E50();
    }
    id v12 = 0;
  }

  return (unint64_t)v12;
}

+ (id)predicateToExcludeSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != %@", @"state", &off_D9E30];
}

+ (id)predicateToExcludeUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != %@ AND %K != %@", @"state", &off_D9E30, @"state", &off_D9E48];
}

+ (id)excludeHiddenAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:@"(%K == NO OR %K == NULL) AND (%K == NO OR %K == NULL)", @"isHidden", @"isHidden", @"isEphemeral", @"isEphemeral"];
}

+ (id)hiddenAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:@"%K == YES", @"isHidden"];
}

+ (id)excludeEphemeralAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:@"%K == NO OR %K == NULL", @"isEphemeral", @"isEphemeral"];
}

+ (id)ephemeralSamplesPredicate
{
  return +[NSPredicate predicateWithFormat:@"(%K == YES) AND (%K == YES)", @"isEphemeral", @"isSample"];
}

+ (id)excludeAudiobooksPredicate
{
  return _[a1 predicateForNotContentType:6];
}

+ (id)predicateToExcludeAudiobookSupplementalContent
{
  return +[NSPredicate predicateWithFormat:@"%K == NO OR %K == NULL", @"isSupplementalContent", @"isSupplementalContent"];
}

+ (id)predicateForLocalOrDownloadingOrImportingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ OR %K == %@ OR %K == %@", @"state", &off_D9E60, @"state", &off_D9EA8, @"state", &off_D9E78];
}

+ (id)predicateForLibraryAssetsRecentlyOpened
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL", @"lastOpenDate"];
}

+ (id)_predicateForAssetsWithContentTypes:(id)a3
{
  return +[BKLibraryManager predicateForContentTypes:a3];
}

+ (id)predicateForAssetsAvailableToAppIntentsWithTypes:(id)a3
{
  id v3 = (_UNKNOWN **)a3;
  if (![v3 count])
  {

    id v3 = &off_DA0A0;
  }
  id v4 = +[BKLibraryManager predicateToExcludeUnownedLibraryAssets];
  v30[0] = v4;
  unsigned __int8 v5 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v30[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v30 count:2];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  id v8 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  id v9 = +[BKLibraryManager _predicateForAssetsWithContentTypes:v3];
  id v10 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v8, v9, 0);

  id v11 = +[NSMutableArray arrayWithObject:v7];
  if ([v3 containsObject:&off_D9E60])
  {
    id v12 = +[BKLibraryManager predicateForAssetsInCollectionID:kBKCollectionDefaultIDSamples allowExplicit:1 includeSeriesItems:0];
    uint64_t v28 = &off_D9E60;
    v29[0] = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:&v28 count:1];
    id v14 = +[BKLibraryManager predicateForContentTypes:v13];
    v29[1] = v14;
    id v15 = +[NSArray arrayWithObjects:v29 count:2];
    id v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];

    [v11 addObject:v16];
  }
  __int16 v17 = +[BKLibraryManager predicateForLibraryAssetWithValidAssetID];
  [v10 addObject:v17];

  id v18 = +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != %@", @"title", @"title", &stru_D4160];
  [v10 addObject:v18];
  id v19 = +[BURestrictionsProvider sharedInstance];
  unsigned __int8 v20 = [v19 isExplicitContentAllowed];

  if ((v20 & 1) == 0)
  {
    id v21 = +[BKLibraryManager predicateToExcludeAssetsWithExplicitContent];
    [v10 addObject:v21];
  }
  id v22 = +[NSCompoundPredicate orPredicateWithSubpredicates:v11];
  id v23 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];
  v27[0] = v23;
  v27[1] = v22;
  id v24 = +[NSArray arrayWithObjects:v27 count:2];
  id v25 = +[NSCompoundPredicate andPredicateWithSubpredicates:v24];

  return v25;
}

+ (id)predicateForMatchingSearchStringLibraryAssets:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = +[NSPredicate predicateWithFormat:@"%K contains[cd] %@ OR %K contains[cd] %@ OR %K contains[cd] %@ OR %K CONTAINS[cd] %@", @"title", v3, @"author", v3, @"genre", v3, @"localOnlySeriesItemsParent.title", v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)predicateForLibraryAssetsNotMarkedAsOld
{
  id v2 = +[NSNull null];
  id v3 = +[NSNull null];
  id v4 = +[NSPredicate predicateWithFormat:@"((%K == %@) OR (%K == %@)) AND (%K == %@ OR %K == %@)", @"isNew", v2, @"isNew", &__kCFBooleanTrue, @"isSample", v3, @"isSample", &__kCFBooleanFalse];

  return v4;
}

+ (id)predicateForLibraryAssetsWithoutCoverURL
{
  return +[NSPredicate predicateWithFormat:@"%K == NULL OR %K == %@", @"coverURL", @"coverURL", &stru_D4160];
}

+ (id)predicateForLibraryAssetsMissingExplicitContentFlag
{
  return +[NSPredicate predicateWithFormat:@"%K == NULL", @"isExplicit"];
}

+ (id)predicateForNextInSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != 0", @"seriesNextFlag", @"seriesNextFlag"];
}

+ (id)predicateForUnownedSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != 0 AND %K != NULL AND %K == %@", @"storeID", @"storeID", @"state", &off_D9E30];
}

+ (id)predicateForUnownedStoreLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != 0 AND %K != NULL AND (%K == %@ OR %K == YES)", @"storeID", @"storeID", @"state", &off_D9E48, @"isSample"];
}

+ (id)predicateForAllUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K != 0 AND %K != NULL AND (%K == %@ OR %K == %@)", @"storeID", @"storeID", @"state", &off_D9E30, @"state", &off_D9E48];
}

+ (id)predicateForContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"contentType", &off_D9E30];
}

+ (id)predicateForHighWaterMarkCapableLibraryAssets
{
  id v3 = [a1 predicateToExcludeUnownedLibraryAssets];
  id v4 = [a1 predicateForExcludingContainerLibraryAssets:v3];
  v9[1] = v4;
  unsigned __int8 v5 = [a1 predicateToExcludeAudiobookSupplementalContent];
  void v9[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:3];

  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ AND %K == YES", @"storePlaylistID", a3, @"isSupplementalContent"];
}

+ (id)predicateForSupplementalContentLibraryAssetsWithStorePlaylistIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@ AND %K == YES", @"storePlaylistID", a3, @"isSupplementalContent"];
}

+ (id)libraryAssetsWithAssetIDsContainedInList:(id)a3 tempAssetIDs:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v10 setReturnsObjectsAsFaults:0];
  [v10 setFetchBatchSize:32];
  id v11 = +[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:v7];
  [v10 setPredicate:v11];

  if (v8)
  {
    id v12 = [v10 predicate];
    v21[0] = v12;
    uint64_t v13 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:v8];
    v21[1] = v13;
    id v14 = +[NSArray arrayWithObjects:v21 count:2];
    id v15 = +[NSCompoundPredicate orPredicateWithSubpredicates:v14];
    [v10 setPredicate:v15];
  }
  id v20 = 0;
  id v16 = [v9 executeFetchRequest:v10 error:&v20];
  id v17 = v20;
  if (!v16)
  {
    id v18 = BKLibraryLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_90EB8();
    }
  }

  return v16;
}

+ (id)newestSeriesBookWithBasePredicate:(id)a3 forBook:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 seriesID];
  id v8 = [v7 length];

  if (v8)
  {
    v27[0] = v5;
    id v9 = +[BKLibraryManager defaultManager];
    id v10 = [v6 seriesID];
    id v11 = [v9 predicateForLibraryAssetsWithSeriesID:v10];
    v27[1] = v11;
    id v12 = +[BKLibraryManager predicateForLibraryAssetsMarkedAsNew];
    void v27[2] = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:v27 count:3];
    id v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];

    id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
    v26[0] = v15;
    id v16 = +[NSSortDescriptor sortDescriptorWithKey:@"seriesSortKey" ascending:0];
    v26[1] = v16;
    id v17 = +[NSArray arrayWithObjects:v26 count:2];

    id v18 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    [v18 setPredicate:v14];
    [v18 setFetchLimit:1];
    [v18 setSortDescriptors:v17];
    [v18 setReturnsObjectsAsFaults:0];
    id v19 = [v6 managedObjectContext];
    id v25 = 0;
    id v20 = [v19 executeFetchRequest:v18 error:&v25];
    id v21 = v25;

    if (!v20 || ![v20 count])
    {
      id v22 = BKLibraryLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_90F20();
      }
    }
    if ([v20 count])
    {
      id v23 = [v20 objectAtIndex:0];
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (id)mostRecentlyOpenedSeriesBookWithBasePredicate:(id)a3 forBook:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 seriesID];
  id v8 = [v7 length];

  if (v8)
  {
    v27[0] = v5;
    id v9 = +[BKLibraryManager defaultManager];
    id v10 = [v6 seriesID];
    id v11 = [v9 predicateForLibraryAssetsWithSeriesID:v10];
    v27[1] = v11;
    id v12 = +[NSArray arrayWithObjects:v27 count:2];
    uint64_t v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

    id v14 = +[NSSortDescriptor sortDescriptorWithKey:@"lastOpenDate" ascending:0];
    v26[0] = v14;
    id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
    v26[1] = v15;
    id v16 = +[NSSortDescriptor sortDescriptorWithKey:@"seriesSortKey" ascending:0];
    void v26[2] = v16;
    id v17 = +[NSArray arrayWithObjects:v26 count:3];

    id v18 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    [v18 setPredicate:v13];
    [v18 setFetchLimit:1];
    [v18 setSortDescriptors:v17];
    [v18 setReturnsObjectsAsFaults:0];
    id v19 = [v6 managedObjectContext];
    id v25 = 0;
    id v20 = [v19 executeFetchRequest:v18 error:&v25];
    id v21 = v25;

    if (!v20 || ![v20 count])
    {
      id v22 = BKLibraryLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_90F20();
      }
    }
    if ([v20 count])
    {
      id v23 = [v20 objectAtIndex:0];
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)predicateForSeriesBooksIncludingNextForID:(id)a3 includeAllBooksInSeries:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(BKLibraryManager *)self usePerformancePredicates] || v4)
  {
    id v14 = [(BKLibraryManager *)self predicateForAllBooksWithSeriesID:v6];
  }
  else
  {
    id v7 = [(BKLibraryManager *)self predicateForAllBooksWithSeriesID:v6];
    v17[0] = v7;
    id v8 = +[BKLibraryManager predicateForNextInSeriesLibraryAssets];
    v17[1] = v8;
    id v9 = +[NSArray arrayWithObjects:v17 count:2];
    id v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

    id v11 = [(BKLibraryManager *)self predicateForLocalBooksWithSeriesID:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained isStoreAllowed])
    {
      v16[0] = v10;
      v16[1] = v11;
      uint64_t v13 = +[NSArray arrayWithObjects:v16 count:2];
      id v14 = +[NSCompoundPredicate orPredicateWithSubpredicates:v13];
    }
    else
    {
      id v14 = v11;
    }
  }

  return v14;
}

+ (id)adjacentSeriesBooksWithMaxCount:(unint64_t)a3 withSmallerSeriesSortKeys:(BOOL)a4 basePredicate:(id)a5 forBook:(id)a6 includeAllBooksInSeries:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[BKLibraryManager defaultManager];
  id v14 = [v12 seriesID];
  id v15 = [v13 predicateForSeriesBooksIncludingNextForID:v14 includeAllBooksInSeries:v7];

  id v33 = v11;
  v37[0] = v11;
  v37[1] = v15;
  id v16 = +[NSArray arrayWithObjects:v37 count:2];
  id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

  id v18 = [v12 seriesSortKey];

  if (v18)
  {
    if (v9) {
      CFStringRef v19 = @"%K < %@";
    }
    else {
      CFStringRef v19 = @"%K > %@";
    }
    id v20 = [v12 seriesSortKey];
    id v21 = +[NSPredicate predicateWithFormat:v19, @"seriesSortKey", v20];

    v36[0] = v17;
    v36[1] = v21;
    id v22 = +[NSArray arrayWithObjects:v36 count:2];
    uint64_t v23 = +[NSCompoundPredicate andPredicateWithSubpredicates:v22];

    id v17 = (void *)v23;
  }
  id v24 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  [v24 setPredicate:v17];
  [v24 setFetchLimit:a3];
  id v25 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"seriesSortKey" ascending:!v9];
  id v35 = v25;
  uint64_t v26 = +[NSArray arrayWithObjects:&v35 count:1];
  [v24 setSortDescriptors:v26];

  [v24 setReturnsObjectsAsFaults:0];
  id v27 = [v12 managedObjectContext];
  id v34 = 0;
  uint64_t v28 = [v27 executeFetchRequest:v24 error:&v34];
  id v29 = v34;

  if (!v28)
  {
    uint64_t v28 = BKLibraryLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_90FB4();
    }
    uint64_t v30 = 0;
    goto LABEL_12;
  }
  if (v9)
  {
    uint64_t v30 = [v28 bu_reversedArray];
LABEL_12:
    id v31 = v33;

    uint64_t v28 = v30;
    goto LABEL_14;
  }
  id v31 = v11;
LABEL_14:

  return v28;
}

- (unint64_t)countOfBooksInSeriesRelativeToBook:(id)a3 includeAllBooksInSeries:(BOOL)a4 relation:(int)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  BOOL v9 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  id v10 = [v8 seriesID];
  id v11 = [(BKLibraryManager *)self predicateForSeriesBooksIncludingNextForID:v10 includeAllBooksInSeries:v6];

  if (v8
    && ([v8 seriesSortKey], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if (a5 == 2) {
      CFStringRef v13 = @"%K > %@";
    }
    else {
      CFStringRef v13 = @"%K < %@";
    }
    id v14 = [v8 seriesSortKey];
    id v15 = +[NSPredicate predicateWithFormat:v13, @"seriesSortKey", v14];

    v24[0] = v15;
    v24[1] = v11;
    id v16 = +[NSArray arrayWithObjects:v24 count:2];
    id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];
  }
  else
  {
    id v17 = v11;
  }
  [v9 setPredicate:v17];
  id v18 = [(BKLibraryManager *)self uiChildContext];
  id v23 = 0;
  id v19 = [v18 countForFetchRequest:v9 error:&v23];
  id v20 = v23;

  if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v21 = BKLibraryLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_9101C();
    }

    id v19 = 0;
  }

  return (unint64_t)v19;
}

- (id)seriesAuthorForContainerID:(id)a3 context:(id)a4
{
  BOOL v4 = [(BKLibraryManager *)self _rawSeriesAuthorForContainerID:a3 context:a4];
  if ([v4 isEqualToString:@"MultipleAuthors"])
  {
    uint64_t v5 = +[BKLibraryAsset multipleAuthors];

    BOOL v4 = (void *)v5;
  }

  return v4;
}

- (id)_predicateForBooksInSeriesWithCorrectSortAuthorInfo:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"seriesID = %@ AND contentType != %@ AND state != %@ AND state != %@", a3, &off_D9E30, &off_D9E30, &off_D9E48];
}

- (id)_predicateForBooksInSeriesWithCorrectAuthorInfo:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"seriesID = %@ AND contentType != %@", a3, &off_D9E30];
}

- (id)_rawSeriesAuthorForContainerID:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  BOOL v9 = [(BKLibraryManager *)self _predicateForBooksInSeriesWithCorrectAuthorInfo:v7];

  [v8 setPredicate:v9];
  [v8 setResultType:2];
  CFStringRef v21 = @"author";
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  [v8 setPropertiesToFetch:v10];

  CFStringRef v20 = @"author";
  id v11 = +[NSArray arrayWithObjects:&v20 count:1];
  [v8 setPropertiesToGroupBy:v11];

  id v19 = 0;
  id v12 = [v6 executeFetchRequest:v8 error:&v19];

  id v13 = v19;
  if (!v12)
  {
    id v17 = v8;
    id v18 = v13;
    BCReportAssertionFailureWithMessage();
  }
  if (objc_msgSend(v12, "count", v17, v18) == (char *)&dword_0 + 1)
  {
    id v14 = [v12 lastObject];
    id v15 = [v14 valueForKey:@"author"];
  }
  else if ((unint64_t)[v12 count] <= 1)
  {
    id v15 = 0;
  }
  else
  {
    id v15 = @"MultipleAuthors";
  }

  return v15;
}

- (id)_rawSeriesSortAuthorForContainerID:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  BOOL v9 = [(BKLibraryManager *)self _predicateForBooksInSeriesWithCorrectSortAuthorInfo:v7];

  [v8 setPredicate:v9];
  [v8 setResultType:2];
  CFStringRef v21 = @"sortAuthor";
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  [v8 setPropertiesToFetch:v10];

  CFStringRef v20 = @"sortAuthor";
  id v11 = +[NSArray arrayWithObjects:&v20 count:1];
  [v8 setPropertiesToGroupBy:v11];

  id v19 = 0;
  id v12 = [v6 executeFetchRequest:v8 error:&v19];

  id v13 = v19;
  if (!v12)
  {
    id v17 = v8;
    id v18 = v13;
    BCReportAssertionFailureWithMessage();
  }
  if (objc_msgSend(v12, "count", v17, v18) == (char *)&dword_0 + 1)
  {
    id v14 = [v12 lastObject];
    id v15 = [v14 valueForKey:@"sortAuthor"];
  }
  else if ((unint64_t)[v12 count] <= 1)
  {
    id v15 = 0;
  }
  else
  {
    id v15 = @"MultipleAuthors";
  }

  return v15;
}

- (id)localSeriesBooksForSeriesID:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  BOOL v9 = [(BKLibraryManager *)self predicateForLocalBooksWithSeriesID:v7];

  [v8 setPredicate:v9];
  [v8 setReturnsObjectsAsFaults:0];
  uint64_t v12 = 0;
  id v10 = [v6 executeFetchRequest:v8 error:&v12];

  return v10;
}

+ (BOOL)hasAnySeriesStackBooksWithBasePredicate:(id)a3 forBook:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 seriesID];
  id v8 = [v7 length];

  if (v8)
  {
    v19[0] = v5;
    BOOL v9 = +[BKLibraryManager defaultManager];
    id v10 = [v6 seriesID];
    id v11 = [v9 predicateForLibraryAssetsWithSeriesID:v10];
    v19[1] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v19 count:2];
    id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

    id v14 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    [v14 setPredicate:v13];
    [v14 setFetchLimit:1];
    [v14 setSortDescriptors:0];
    [v14 setReturnsObjectsAsFaults:1];
    id v15 = [v6 managedObjectContext];
    uint64_t v18 = 0;
    id v8 = [v15 executeFetchRequest:v14 error:&v18];
  }
  BOOL v16 = [v8 count] != 0;

  return v16;
}

- (id)contentPredicateForSeriesID:(id)a3 onlyPurchased:(BOOL)a4 forceCloud:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [(BKLibraryManager *)self contentPredicateForSeriesID:v8 onlyPurchased:v6 forceCloud:v5 allowsExplicit:[(BKLibraryManager *)self isExplicitMaterialAllowed]];

  return v9;
}

- (id)contentPredicateForSeriesID:(id)a3 onlyPurchased:(BOOL)a4 forceCloud:(BOOL)a5 allowsExplicit:(BOOL)a6
{
  BOOL v8 = a4;
  id v44 = a3;
  id v10 = -[BKLibraryManager predicateForLibraryAssetsWithSeriesID:](self, "predicateForLibraryAssetsWithSeriesID:");
  v51[0] = v10;
  id v11 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  v51[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v51 count:2];
  id v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

  if (v8 && ![(BKLibraryManager *)self usePerformancePredicates])
  {
    id v15 = +[BKLibraryManager predicateToExcludeUnownedLibraryAssets];
    v50[0] = v13;
    v50[1] = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:v50 count:2];
    id v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v16) = [WeakRetained isShowPurchasesEnabled];

    if ((v16 & 1) != 0 || a5)
    {
      id v14 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
    }
    else
    {
      v49[0] = v17;
      id v19 = +[BKLibraryManager predicateForLocalOrDownloadingLibraryAssets];
      v49[1] = v19;
      CFStringRef v20 = +[NSArray arrayWithObjects:v49 count:2];
      uint64_t v21 = +[NSCompoundPredicate andPredicateWithSubpredicates:v20];

      id v14 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
      id v17 = (void *)v21;
    }

    id v13 = v17;
  }
  else
  {
    id v14 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
  }
  if (!a6)
  {
    id v22 = v14[484];
    v48[0] = v13;
    id v23 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
    v48[1] = v23;
    id v24 = +[NSArray arrayWithObjects:v48 count:2];
    uint64_t v25 = [v22 andPredicateWithSubpredicates:v24];

    id v13 = (void *)v25;
  }
  uint64_t v26 = v14[484];
  v47[0] = v13;
  id v27 = +[BKLibraryManager excludeEphemeralAssetsPredicate];
  v47[1] = v27;
  uint64_t v28 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v47[2] = v28;
  id v29 = +[NSArray arrayWithObjects:v47 count:3];
  uint64_t v30 = [v26 andPredicateWithSubpredicates:v29];

  id v31 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v32 = [v31 isStoreAllowed];

  if (v32)
  {
    id v33 = v14[484];
    id v34 = +[BKLibraryManager predicateForNextInSeriesLibraryAssets];
    v46[0] = v34;
    id v35 = +[BKLibraryManager defaultManager];
    long long v36 = v44;
    long long v37 = [v35 predicateForLibraryAssetsWithSeriesID:v44];
    v46[1] = v37;
    long long v38 = +[NSArray arrayWithObjects:v46 count:2];
    long long v39 = [v33 andPredicateWithSubpredicates:v38];

    id v40 = v14[484];
    v45[0] = v30;
    v45[1] = v39;
    BOOL v41 = +[NSArray arrayWithObjects:v45 count:2];
    uint64_t v42 = [v40 orPredicateWithSubpredicates:v41];

    uint64_t v30 = (void *)v42;
  }
  else
  {
    long long v36 = v44;
  }

  return v30;
}

+ (id)seriesStackBooksForBook:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:5];
  BOOL v5 = [v3 seriesBooks];
  if (![v5 count]) {
    goto LABEL_47;
  }
  uint64_t v50 = v4;
  id v51 = v3;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v49 = v5;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (!v7)
  {
    BOOL v9 = 0;
    id v53 = 0;
    __int16 v54 = 0;
    __int16 v52 = 0;
    goto LABEL_35;
  }
  id v8 = v7;
  BOOL v9 = 0;
  id v53 = 0;
  __int16 v54 = 0;
  __int16 v52 = 0;
  uint64_t v10 = *(void *)v58;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v58 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      if (![v12 isValid]) {
        continue;
      }
      if ([v12 state] != 5 && objc_msgSend(v12, "state") != 6)
      {
        if ([v12 isNew])
        {
          if (!v52
            || ([v52 purchaseDate],
                id v13 = objc_claimAutoreleasedReturnValue(),
                [v12 purchaseDate],
                id v14 = objc_claimAutoreleasedReturnValue(),
                id v15 = [v13 compare:v14],
                v14,
                v13,
                v15 == (id)-1))
          {
            id v16 = v12;

            __int16 v52 = v16;
          }
        }
        id v17 = [v12 lastOpenDate];
        if (v17)
        {
          uint64_t v18 = v17;
          if (!v53)
          {

LABEL_19:
            id v22 = v12;

            id v53 = v22;
            goto LABEL_20;
          }
          id v19 = [v53 lastOpenDate];
          CFStringRef v20 = [v12 lastOpenDate];
          id v21 = [v19 compare:v20];

          if (v21 == (id)-1) {
            goto LABEL_19;
          }
        }
      }
LABEL_20:
      if ([v12 state] != 6
        || ([v12 creationDate], (id v23 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_24:
        if (!v9) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }
      id v24 = v23;
      if (v54)
      {
        uint64_t v25 = [v54 creationDate];
        uint64_t v26 = [v12 creationDate];
        id v27 = [v25 compare:v26];

        if (v27 != (id)-1) {
          goto LABEL_24;
        }
      }
      else
      {
      }
      id v33 = v12;

      __int16 v54 = v33;
      if (!v9) {
        goto LABEL_30;
      }
LABEL_25:
      uint64_t v28 = [v12 seriesSortKey];
      if (v28)
      {
        id v29 = (void *)v28;
        uint64_t v30 = [v9 seriesSortKey];
        id v31 = [v12 seriesSortKey];
        unsigned int v32 = (char *)[v30 compare:v31];

        if (v32 == (unsigned char *)&dword_0 + 1)
        {
LABEL_30:
          id v34 = v12;

          BOOL v9 = v34;
          continue;
        }
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v57 objects:v62 count:16];
  }
  while (v8);
LABEL_35:

  id v35 = v53;
  if (!v53) {
    id v35 = v9;
  }
  if (v52) {
    id v35 = v52;
  }
  id v36 = v35;
  long long v37 = +[NSSortDescriptor sortDescriptorWithKey:@"seriesSortKey" ascending:1];
  v61[0] = v37;
  long long v38 = +[NSSortDescriptor sortDescriptorWithKey:@"sequenceDisplayName" ascending:1];
  v61[1] = v38;
  long long v39 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:1];
  v61[2] = v39;
  id v40 = +[NSArray arrayWithObjects:v61 count:3];
  BOOL v41 = [v6 sortedArrayUsingDescriptors:v40];

  uint64_t v42 = [v41 indexOfObjectIdenticalTo:v36];
  id v43 = objc_msgSend(v41, "subarrayWithRange:", v42, (unsigned char *)objc_msgSend(v41, "count") - v42);
  [v50 addObjectsFromArray:v43];
  id v44 = [v41 subarrayWithRange:0, v42];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_303D0;
  v55[3] = &unk_D2408;
  id v4 = v50;
  id v56 = v4;
  [v44 enumerateObjectsWithOptions:2 usingBlock:v55];
  if ([v36 isFinished])
  {
    [v4 removeObjectAtIndex:0];
    [v4 addObject:v36];
  }
  id v3 = v51;
  if ((unint64_t)[v4 count] >= 6)
  {
    CFStringRef v45 = [v4 subarrayWithRange:0, 5];
    id v46 = [v45 mutableCopy];

    id v4 = v46;
    BOOL v5 = v49;
  }
  else
  {
    id v47 = (char *)[v4 count];
    BOOL v5 = v49;
    if (v47 == (unsigned char *)&dword_0 + 1) {
      [v4 addObject:v36];
    }
  }

LABEL_47:

  return v4;
}

- (id)storeIDsForDownloadingBooks
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_89D0;
  id v11 = sub_89E0;
  id v12 = +[NSMutableArray array];
  id v3 = [(BKLibraryManager *)self workerChildContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_30510;
  v6[3] = &unk_D2430;
  void v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)localNonSampleLibraryAssetStoreSummaries
{
  return [(BKLibraryManager *)self localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks:0];
}

- (id)localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks:(BOOL)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_30784;
  v6[3] = &unk_D2278;
  BOOL v9 = a3;
  uint64_t v7 = self;
  id v8 = (id)objc_opt_new();
  id v3 = v8;
  [(BKLibraryManager *)v7 performBackgroundReadOnlyBlockAndWait:v6];
  id v4 = [v3 copy];

  return v4;
}

- (void)fetchLibraryAssetFromStoreID:(id)a3 handler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_30BB0;
  void v8[3] = &unk_D2090;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v8];
}

- (void)fetchLibraryAssetFromAssetID:(id)a3 handler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_30D98;
  void v8[3] = &unk_D2090;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v8];
}

- (void)fetchLibraryAssetsFromStoreIDs:(id)a3 handler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_30F80;
  void v8[3] = &unk_D2090;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v8];
}

- (void)fetchLibraryAssetsFromAssetIDs:(id)a3 handler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_3113C;
  void v8[3] = &unk_D2090;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v8];
}

- (void)allUnownedStoreAssetIDs:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_312D0;
  v4[3] = &unk_D2090;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKLibraryManager *)v5 performBackgroundReadOnlyBlock:v4];
}

- (void)allUnownedIDs:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_315D0;
  v4[3] = &unk_D2090;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKLibraryManager *)v5 performBackgroundReadOnlyBlock:v4];
}

+ (id)searchFetchRequestWithText:(id)a3 entityType:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[BKLibraryManager defaultManager];
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:6];
  id v8 = [v6 _predicateForSearchText:v5];

  [v7 addObject:v8];
  id v9 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  [v7 addObject:v9];

  id v10 = +[BKLibraryManager predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks];
  [v7 addObject:v10];

  id v11 = +[BKLibraryManager predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections];
  [v7 addObject:v11];

  switch(a4)
  {
    case 1:
      uint64_t v12 = +[BKLibraryManager predicateForNotContentTypes:&off_DA0B8];
      goto LABEL_5;
    case 2:
      uint64_t v12 = +[BKLibraryManager predicateForContentType:6];
      goto LABEL_5;
    case 3:
      uint64_t v12 = +[BKLibraryManager predicateForContainerLibraryAssets];
LABEL_5:
      id v13 = v12;
      [v7 addObject:v12];
      goto LABEL_8;
    case 4:
      id v13 = BKLibraryLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_91164(v13, v14, v15, v16, v17, v18, v19, v20);
      }
LABEL_8:

      break;
    default:
      break;
  }
  id v21 = +[BKLibraryManager excludeEphemeralAssetsPredicate];
  [v7 addObject:v21];

  id v22 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v23 = [v6 sortDescriptorsForMode:3 collectionID:kBKCollectionDefaultAll];
  [v22 setSortDescriptors:v23];

  id v24 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v22 setPredicate:v24];

  [v22 setReturnsObjectsAsFaults:0];

  return v22;
}

+ (id)_recentlyEngagedPredicate
{
  id v2 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"lastEngagedDate"];
  v10[0] = v2;
  id v3 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isTrackedAsRecent"];
  v10[1] = v3;
  id v4 = +[BKLibraryManager predicateForExcludingUnownedAudiobookAssets];
  void v10[2] = v4;
  id v5 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  v10[3] = v5;
  id v6 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  void v10[4] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:5];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];

  return v8;
}

+ (id)_continueReadingPredicate
{
  id v3 = +[BURestrictionsProvider sharedInstance];
  id v4 = [v3 isExplicitContentAllowed];

  return _[a1 _continueReadingPredicateIncludingExplicitContent:v4];
}

+ (id)_continueReadingPredicateIncludingExplicitContent:(BOOL)a3
{
  id v4 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"lastEngagedDate"];
  v16[0] = v4;
  id v5 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isTrackedAsRecent"];
  v16[1] = v5;
  id v6 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  void v16[2] = v6;
  id v7 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v16[3] = v7;
  id v8 = +[NSArray arrayWithObjects:v16 count:4];
  id v9 = [v8 mutableCopy];

  if (!a3)
  {
    id v10 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
    [v9 addObject:v10];
  }
  if (+[BCPPTConfig usePPTLaunchContent])
  {
    [v9 removeAllObjects];
    unsigned int v11 = +[BCPPTConfig shouldHaveContinueAndPreviousContent];
    uint64_t v12 = (_UNKNOWN **)&__NSArray0__struct;
    if (v11) {
      uint64_t v12 = &off_DA100;
    }
    id v13 = +[NSPredicate predicateWithFormat:@"%K in %@", @"assetID", v12];
    [v9 addObject:v13];
  }
  uint64_t v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  return v14;
}

+ (id)_recentlyReadPredicate
{
  id v2 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"lastOpenDate"];
  id v3 = +[NSPredicate predicateWithFormat:@"%K == NO", @"isTrackedAsRecent", v2];
  v9[1] = v3;
  id v4 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  void v9[2] = v4;
  id v5 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  void v9[3] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:4];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)_previouslyReadPredicate
{
  id v2 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"lastEngagedDate"];
  uint64_t v3 = +[NSPredicate predicateWithFormat:@"%K == NULL OR %K == NO", @"isTrackedAsRecent", @"isTrackedAsRecent", v2];
  v16[1] = v3;
  id v4 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  void v16[2] = v4;
  id v5 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v16[3] = v5;
  id v6 = +[BKLibraryManager predicateToExcludeSeriesLibraryAssets];
  void v16[4] = v6;
  id v7 = +[NSArray arrayWithObjects:v16 count:5];
  id v8 = [v7 mutableCopy];

  id v9 = +[BURestrictionsProvider sharedInstance];
  LOBYTE(v3) = [v9 isExplicitContentAllowed];

  if ((v3 & 1) == 0)
  {
    id v10 = +[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent];
    [v8 addObject:v10];
  }
  if (+[BCPPTConfig usePPTLaunchContent])
  {
    [v8 removeAllObjects];
    unsigned int v11 = +[BCPPTConfig shouldHaveContinueAndPreviousContent];
    uint64_t v12 = (_UNKNOWN **)&__NSArray0__struct;
    if (v11) {
      uint64_t v12 = &off_DA100;
    }
    id v13 = +[NSPredicate predicateWithFormat:@"%K in %@", @"assetID", v12];
    [v8 addObject:v13];
  }
  uint64_t v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];

  return v14;
}

+ (id)fetchRequestForRecentlyEngaged
{
  id v3 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastEngagedDate" ascending:0];
  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = [a1 _recentlyEngagedPredicate];
  [v3 setPredicate:v6];

  [v3 setReturnsObjectsAsFaults:0];

  return v3;
}

+ (id)fetchRequestForContinueReading
{
  id v3 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastEngagedDate" ascending:0];
  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = [a1 _continueReadingPredicate];
  [v3 setPredicate:v6];

  [v3 setReturnsObjectsAsFaults:0];

  return v3;
}

+ (id)fetchRequestForRecentlyRead
{
  id v3 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastOpenDate" ascending:0];
  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = [a1 _recentlyReadPredicate];
  [v3 setPredicate:v6];

  [v3 setReturnsObjectsAsFaults:0];

  return v3;
}

+ (id)fetchRequestForPreviouslyRead
{
  id v3 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastEngagedDate" ascending:0];
  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = [a1 _previouslyReadPredicate];
  [v3 setPredicate:v6];

  [v3 setReturnsObjectsAsFaults:0];

  return v3;
}

- (void)assetAccountIdentifiersForAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v14 = [v7 assetID];
  id v8 = [v7 path];
  id v9 = [v7 storeID];
  id v10 = [v7 purchasedDSID];
  unsigned int v11 = [v7 downloadedDSID];
  uint64_t v12 = [v7 familyID];
  id v13 = [v7 dataSourceIdentifier];

  [(BKLibraryManager *)self assetAccountIdentifiersForAssetID:v14 path:v8 storeID:v9 purchasedDSID:v10 downloadedDSID:v11 familyID:v12 dataSourceID:v13 completion:v6];
}

- (void)assetAccountIdentifiersForAssetID:(id)a3 path:(id)a4 storeID:(id)a5 purchasedDSID:(id)a6 downloadedDSID:(id)a7 familyID:(id)a8 dataSourceID:(id)a9 completion:(id)a10
{
  id v28 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = [[BKLibraryManagerAccountIdentifiers alloc] initWithPurchasedDSID:v22 downloadedDSID:v21 familyID:v20];

  id v24 = [(BKLibraryManager *)self dataSourceWithIdentifier:v19];

  if (v22 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v26 = objc_retainBlock(v18);
    id v27 = v26;
    if (v26) {
      (*((void (**)(id, BKLibraryManagerAccountIdentifiers *, void))v26 + 2))(v26, v23, 0);
    }

    uint64_t v25 = v28;
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    void v29[2] = sub_32874;
    v29[3] = &unk_D2458;
    v29[4] = self;
    uint64_t v25 = v28;
    id v30 = v28;
    id v31 = v23;
    id v32 = v18;
    [v24 assetAccountIdentifiersForAssetID:v30 path:v16 storeID:v17 completion:v29];
  }
}

- (void)hiddenAssetStoreIDsWithCompletion:(id)a3
{
  id v12 = a3;
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.BKLibraryManager.hiddenAssetQueue", v4);

  v29[0] = 0;
  v29[1] = v29;
  void v29[2] = 0x3032000000;
  v29[3] = sub_89D0;
  v29[4] = sub_89E0;
  id v30 = (id)objc_opt_new();
  v27[0] = 0;
  v27[1] = v27;
  void v27[2] = 0x3032000000;
  void v27[3] = sub_89D0;
  void v27[4] = sub_89E0;
  id v28 = 0;
  id v5 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [(BKLibraryManager *)self dataSources];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v5);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          void v18[2] = sub_32E58;
          v18[3] = &unk_D24A8;
          id v19 = queue;
          id v21 = v27;
          id v22 = v29;
          id v20 = v5;
          [v10 hiddenAssetStoreIDsWithCompletion:v18];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_32FB4;
  block[3] = &unk_D24D0;
  id v16 = v29;
  id v17 = v27;
  id v15 = v12;
  id v11 = v12;
  dispatch_group_notify(v5, queue, block);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
}

- (void)rawBookCoverForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dataSourceIdentifier];
  id v9 = [(BKLibraryManager *)self dataSourceWithIdentifier:v8];

  if (v9)
  {
    v14[0] = @"path";
    v14[1] = @"assetID";
    void v14[2] = @"permlink";
    v14[3] = @"temporaryAssetID";
    v14[4] = @"title";
    void v14[5] = @"storeID";
    id v10 = +[NSArray arrayWithObjects:v14 count:6];
    id v11 = [v6 propertiesForKeys:v10];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_3321C;
    v12[3] = &unk_D24F8;
    id v13 = v7;
    [v9 bookCoverForLibraryAssetProperties:v11 size:v12 completion:1.79769313e308, 1.79769313e308];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)readingTimeTracker:(id)a3 updateRecentBook:(id)a4 promoteIfNotTracked:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v25[0] = 0;
  v25[1] = v25;
  void v25[2] = 0x2020000000;
  char v26 = 0;
  id v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_333E0;
  void v20[3] = &unk_D2548;
  v20[4] = self;
  id v14 = v11;
  id v21 = v14;
  BOOL v24 = a5;
  id v15 = v13;
  id v22 = v15;
  long long v23 = v25;
  [(BKLibraryManager *)self performBlockOnWorkerQueue:v20];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3373C;
  block[3] = &unk_D2570;
  id v18 = v12;
  id v19 = v25;
  id v16 = v12;
  dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v25, 8);
}

- (unint64_t)wq_countOfBooksInContinueReadingIncludingExplicitContent:(BOOL)a3 limit:(unint64_t)a4 onWorkerQueue:(id)a5
{
  id v5 = a5;
  id v6 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v7 = +[BKLibraryManager _continueReadingPredicate];
  [v6 setPredicate:v7];

  id v12 = 0;
  id v8 = [v5 countForFetchRequest:v6 error:&v12];

  id v9 = v12;
  if (v9)
  {
    id v10 = BCBookPromotionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_91244();
    }
  }
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v8 = 0;
  }

  return (unint64_t)v8;
}

- (void)wq_seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:(id)a3 limit:(unint64_t)a4 onWorkerQueue:(id)a5
{
  id v7 = a3;
  id v33 = a5;
  id v8 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v8 setReturnsObjectsAsFaults:0];
  [v8 setFetchLimit:a4];
  id v36 = v7;
  uint64_t v9 = +[NSPredicate predicateWithFormat:@"%K > %@", @"lastOpenDate", v7];
  uint64_t v10 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"lastEngagedDate"];
  id v11 = +[BKLibraryManager predicateForLibraryAssetsRecentlyOpened];
  v44[0] = v11;
  v44[1] = v10;
  id v34 = (void *)v10;
  id v35 = (void *)v9;
  v44[2] = v9;
  id v12 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  v44[3] = v12;
  id v13 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  v44[4] = v13;
  id v14 = +[BKLibraryManager excludeHiddenAssetsPredicate];
  v44[5] = v14;
  id v15 = +[BKLibraryManager predicateToExcludeSeriesLibraryAssets];
  v44[6] = v15;
  id v16 = +[BKLibraryManager excludeEphemeralAssetsPredicate];
  v44[7] = v16;
  id v17 = +[NSArray arrayWithObjects:v44 count:8];
  id v18 = +[NSCompoundPredicate andPredicateWithSubpredicates:v17];
  [v8 setPredicate:v18];

  id v19 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lastOpenDate" ascending:0];
  id v43 = v19;
  id v20 = +[NSArray arrayWithObjects:&v43 count:1];
  [v8 setSortDescriptors:v20];

  id v41 = 0;
  id v21 = [v33 executeFetchRequest:v8 error:&v41];
  id v22 = v41;
  long long v23 = v22;
  if (!v21 && v22)
  {
    BOOL v24 = BCBookPromotionLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_91314();
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v21;
  id v26 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = 0;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v25);
        }
        id v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (([v31 isSupplementalContent] & 1) == 0)
        {
          [v31 setIsTrackedAsRecent:1];
          ++v28;
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v27);
  }

  [v33 saveLibrary];
  id v32 = BCBookPromotionLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_912AC();
  }
}

- (void)seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:(id)a3 limit:(unint64_t)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_33CCC;
  v7[3] = &unk_D2598;
  id v8 = a3;
  unint64_t v9 = a4;
  void v7[4] = self;
  id v6 = v8;
  [(BKLibraryManager *)self performBlockOnWorkerQueue:v7];
}

- (void)purgeRecentsListFromAllBooksOlderThanDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_33EC8;
    v6[3] = &unk_D16B0;
    id v7 = v4;
    [(BKLibraryManager *)self performBlockOnWorkerQueue:v6];
  }
}

- (void)purgeRecentBooks:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_341A0;
    v10[3] = &unk_D2090;
    id v11 = v6;
    id v12 = v7;
    [(BKLibraryManager *)self performBlockOnWorkerQueue:v10];
  }
  else
  {
    id v8 = objc_retainBlock(v7);
    unint64_t v9 = v8;
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
}

- (void)readingTimeTrackerHasRecentAssets:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_344E8;
  v6[3] = &unk_D1BC8;
  id v7 = a4;
  id v5 = v7;
  [(BKLibraryManager *)self performBlockOnWorkerQueue:v6];
}

- (void)isTrackedAsRecent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_3478C;
    v14[3] = &unk_D2090;
    id v15 = (void (**)(id, void, void *))v6;
    id v16 = v7;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_3494C;
    v12[3] = &unk_D2090;
    void v12[4] = self;
    id v13 = objc_retainBlock(v14);
    id v8 = v13;
    [(BKLibraryManager *)self performBlockOnCollectionsWorkerQueue:v12];

    unint64_t v9 = v15;
  }
  else
  {
    unint64_t v9 = (void (**)(id, void, void *))objc_retainBlock(v7);
    if (v9)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"No asset identifier.";
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v11 = +[NSError errorWithDomain:@"BKLibraryErrorDomain" code:1 userInfo:v10];
      v9[2](v9, 0, v11);
    }
  }
}

- (void)readingTimeTracker:(id)a3 isAssetTrackedAsRecent:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 length])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_34B50;
    v15[3] = &unk_D2090;
    id v16 = v7;
    id v17 = v8;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_34D6C;
    v13[3] = &unk_D2090;
    void v13[4] = self;
    id v14 = objc_retainBlock(v15);
    unint64_t v9 = v14;
    [(BKLibraryManager *)self performBlockOnCollectionsWorkerQueue:v13];

    id v10 = v16;
  }
  else
  {
    id v10 = objc_retainBlock(v8);
    if (v10)
    {
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      CFStringRef v19 = @"No asset identifier.";
      id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v12 = +[NSError errorWithDomain:@"BKLibraryErrorDomain" code:1 userInfo:v11];
      (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v12);
    }
  }
}

- (void)recentsNotEngagedSinceDateForSamples:(id)a3 dateForNonSamples:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_34E58;
  v10[3] = &unk_D25C0;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(BKLibraryManager *)v11 performBackgroundReadOnlyBlock:v10];
}

- (void)readingTimeTracker:(id)a3 cleanupFinishedBooksExcluding:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_35310;
  void v8[3] = &unk_D1B28;
  id v9 = self;
  id v10 = a4;
  id v11 = a5;
  id v6 = v11;
  id v7 = v10;
  [(BKLibraryManager *)v9 performBlockOnWorkerQueue:v8];
}

- (void)readingTimeTracker:(id)a3 cleanupBooksFinishedBefore:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_35750;
  void v8[3] = &unk_D1B28;
  id v9 = self;
  id v10 = a4;
  id v11 = a5;
  id v6 = v11;
  id v7 = v10;
  [(BKLibraryManager *)v9 performBlockOnWorkerQueue:v8];
}

- (BOOL)isDownloadableFromLibraryAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 permanentOrTemporaryAssetID];
  if ([v4 length])
  {
    id v5 = +[BKLibraryAssetStatusController sharedController];
    id v6 = [v3 permanentOrTemporaryAssetID];
    id v7 = [v5 statusForAssetID:v6];
  }
  else
  {
    id v7 = 0;
  }

  BOOL v8 = [v3 canRedownload]
    && ([v3 isPreorderBook] & 1) == 0
    && ([v3 isLocal] & 1) == 0
    && [v7 state] != &dword_4;

  return v8;
}

- (BKSeriesManager)seriesManager
{
  return (BKSeriesManager *)+[BKSeriesManager sharedManager];
}

- (id)_updateLibraryAssetWithID:(id)a3 withLastOpenDate:(id)a4 withMoc:(id)a5
{
  id v8 = a4;
  id v9 = [(BKLibraryManager *)self libraryMutableAssetWithAssetID:a3 inManagedObjectContext:a5];
  [v9 setLastOpenDate:v8];
  id v10 = [v9 seriesContainer];
  [v10 setLastOpenDate:v8];

  [v9 setModificationDate:v8];
  id v11 = [v9 seriesContainer];
  [v11 setModificationDate:v8];

  id v12 = [v9 storeID];
  if ([v12 longLongValue])
  {
    id v13 = [v9 purchasedAndLocalParent];

    if (!v13)
    {
      unsigned int v14 = [v9 isAudiobook];
      id v15 = (id *)&BKSeriesManagerAssetTypeAudiobooks;
      if (!v14) {
        id v15 = (id *)&BKSeriesManagerAssetTypeBooks;
      }
      id v32 = *v15;
      id v16 = v32;
      id v17 = [v9 storeID];
      id v31 = v17;
      NSErrorUserInfoKey v18 = +[NSArray arrayWithObjects:&v31 count:1];
      id v33 = v18;
      CFStringRef v19 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

      id v20 = [(BKLibraryManager *)self seriesManager];
      [v20 updateExpiredSeriesForAssetAdamIDsWithTypes:v19];
    }
  }
  else
  {
  }
  id v21 = [v9 storeID];
  if (v21)
  {

LABEL_10:
    BOOL v24 = [v9 permlink];
    if (v24)
    {
      id v25 = [v9 permlink];
      id v26 = +[NSURL URLWithString:v25];
    }
    else
    {
      id v26 = +[NSURL URLWithString:&stru_D4160];
    }

    id v27 = +[BLLibrary defaultBookLibrary];
    uint64_t v28 = [v9 storeID];
    uint64_t v29 = +[NSDate date];
    [v27 _bookWasOpenedWithStoreID:v28 permlink:v26 date:v29];

    goto LABEL_14;
  }
  id v22 = [v9 permlink];
  id v23 = [v22 length];

  if (v23) {
    goto LABEL_10;
  }
LABEL_14:

  return v9;
}

- (void)updateLibraryAssetWithID:(id)a3 withTitle:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(BKLibraryManager *)self uiChildContext];
  id v8 = [(BKLibraryManager *)self libraryMutableAssetWithAssetID:v14 inManagedObjectContext:v7];

  if (v8)
  {
    [v8 setTitle:v6];
    [v8 setSortTitle:v6];
    id v9 = [(BKLibraryManager *)self uiChildContext];
    [v9 setSaveContext:2];

    id v10 = [(BKLibraryManager *)self uiChildContext];
    [v10 save:0];

    id v11 = [v8 dataSourceIdentifier];
    id v12 = [(BKLibraryManager *)self dataSourceWithIdentifier:v11];

    if (objc_opt_respondsToSelector()) {
      [v12 updateAsset:v8 userEditedTitle:v6 completion:0];
    }
  }
  id v13 = +[BCProgressKitController sharedController];
  [v13 updateBook:v14 withTitle:v6 completion:0];
}

- (void)updateLibraryAssetWithID:(id)a3 withLastOpenDate:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_36034;
  v10[3] = &unk_D25C0;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(BKLibraryManager *)v11 performBlockOnWorkerQueue:v10];
}

- (void)updateLibraryAssetWithID:(id)a3 isEphemeral:(BOOL)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_3619C;
  void v9[3] = &unk_D25E8;
  id v10 = self;
  id v11 = a3;
  BOOL v13 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(BKLibraryManager *)v10 performBlockOnWorkerQueue:v9];
}

- (void)applyPendingUpdateForAssetID:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_364D0;
  v7[3] = &unk_D1B28;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(BKLibraryManager *)v8 performBackgroundReadOnlyBlock:v7];
}

- (BOOL)_shouldPropagateNilAssetIDForDataSourceWithIdentifier:(id)a3
{
  id v3 = [(NSDictionary *)self->_dataSourcesByIdentifier objectForKeyedSubscript:a3];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 propagateNilAssetID];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)didCloseLibraryAsset:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3682C;
  v3[3] = &unk_D16B0;
  v3[4] = self;
  [(BKLibraryManager *)self performBackgroundReadOnlyBlock:v3];
}

- (id)seriesBooksForSeriesID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = [(BKLibraryManager *)self predicateForLibraryAssetsWithSeriesID:a3];
  v15[0] = v7;
  id v8 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  v15[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v15 count:2];
  id v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

  id v11 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  [v11 setPredicate:v10];
  uint64_t v14 = 0;
  id v12 = [v6 executeFetchRequest:v11 error:&v14];

  return v12;
}

- (id)seriesContainerForSeriesID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  id v9 = [(BKLibraryManager *)self predicateForContainerWithSeriesIDLibraryAsset:v7];

  [v8 setPredicate:v9];
  [v8 setFetchLimit:1];
  uint64_t v13 = 0;
  id v10 = [v6 executeFetchRequest:v8 error:&v13];

  if (v10 && [v10 count])
  {
    id v11 = [v10 firstObject];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)updateSeriesContainerSeriesStackAssetIDs:(id)a3
{
  id v6 = a3;
  if ([v6 isContainer])
  {
    id v3 = +[BKLibraryManager seriesStackBooksForBook:v6];
    unsigned __int8 v4 = [v3 valueForKey:@"assetID"];
    if ([v3 count])
    {
      id v5 = [v4 componentsJoinedByString:@","];
      [v6 setDifferentObject:v5 forKey:@"seriesStackIDs"];
    }
  }
}

- (void)updateSupplementalContentRelationship:(id)a3
{
  id v3 = a3;
  if ([v3 isAudiobook])
  {
    id v4 = [v3 assetID];
    id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
    id v6 = +[BKLibraryManager predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:v4];
    [v5 setPredicate:v6];

    id v7 = [v3 managedObjectContext];
    id v29 = 0;
    id v8 = [v7 executeFetchRequest:v5 error:&v29];
    id v9 = v29;

    if (v9)
    {
      id v10 = BKLibraryLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_91508();
      }
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = v8;
      id v18 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * i) setDifferentObject:v3 forKey:@"supplementalContentParent"];
          }
          id v19 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
        }
        while (v19);
      }
    }
    goto LABEL_33;
  }
  id v4 = v3;
  if ([v4 isSupplementalContent])
  {
    id v11 = [v4 storePlaylistID];

    if (v11)
    {
      id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
      id v12 = [v4 storePlaylistID];
      uint64_t v13 = +[BKLibraryManager predicateForAssetIDTaggedLibraryAsset:v12];
      [v5 setPredicate:v13];

      uint64_t v14 = [v4 managedObjectContext];
      id v24 = 0;
      id v8 = [v14 executeFetchRequest:v5 error:&v24];
      id v9 = v24;

      if (v9)
      {
        id v15 = BKLibraryLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_91724();
        }

        [v4 setDifferentObject:0 forKey:@"supplementalContentParent"];
        goto LABEL_34;
      }
      if ([v8 count])
      {
        if ((unint64_t)[v8 count] < 2)
        {
LABEL_32:
          id v10 = [v8 lastObject];
          [v4 setDifferentObject:v10 forKey:@"supplementalContentParent"];
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        id v22 = BKLibraryLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_91654(v8, v4, v22);
        }
      }
      else
      {
        id v22 = BKLibraryLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v4 storePlaylistID];
          *(_DWORD *)CFSetCallBacks buf = 138412290;
          id v31 = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Fetched 0 audiobook libraryAsset with storePlaylistID %@ for supplemental content", buf, 0xCu);
        }
      }

      goto LABEL_32;
    }
  }
  if ([v4 isSupplementalContent])
  {
    id v16 = [v4 storePlaylistID];

    if (!v16)
    {
      id v17 = BKLibraryLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_9159C(v4, v17);
      }
    }
  }
  [v4 setDifferentObject:0 forKey:@"supplementalContentParent"];
LABEL_35:
}

- (void)updateIsDownloadingSupplementalContentAndCombinedState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 supplementalContentAssets];
  if ([v4 count])
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 supplementalContentParent];
  }
  id v6 = v5;

  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [v6 supplementalContentAssets];
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        id v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) isDownloading])
          {

            uint64_t v14 = +[NSNumber numberWithBool:1];
            [v6 setDifferentValue:v14 forKey:@"isDownloadingSupplementalContent" klass:objc_opt_class()];

            id v13 = &dword_0 + 2;
            goto LABEL_15;
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v12 = +[NSNumber numberWithBool:0];
    [v6 setDifferentValue:v12 forKey:@"isDownloadingSupplementalContent" klass:objc_opt_class()];

    id v13 = [v6 state];
LABEL_15:
    id v15 = +[NSNumber numberWithShort:v13];
    [v6 setDifferentValue:v15 forKey:@"combinedState" klass:objc_opt_class()];
  }
  if (v6 != v3)
  {
    if ([v3 isDownloadingSupplementalContent]) {
      id v16 = &dword_0 + 2;
    }
    else {
      id v16 = [v3 state];
    }
    id v17 = +[NSNumber numberWithShort:v16];
    [v3 setDifferentValue:v17 forKey:@"combinedState" klass:objc_opt_class()];
  }
}

- (void)updateSeriesRelationshipsForSeriesAsset:(id)a3
{
  id v22 = a3;
  id v4 = [v22 seriesID];
  if (!v4)
  {
    [v22 setDifferentObject:0 forKey:@"seriesContainer"];
    [v22 setDifferentObject:0 forKey:@"purchasedAndLocalParent"];
    [v22 setDifferentObject:0 forKey:@"localOnlySeriesItemsParent"];
    goto LABEL_22;
  }
  id v5 = [v22 seriesContainer];
  id v6 = [v5 seriesID];
  unsigned int v7 = [v4 isEqualToString:v6];

  id v8 = [v22 managedObjectContext];
  id v9 = [(BKLibraryManager *)self seriesContainerForSeriesID:v4 inManagedObjectContext:v8];

  uint64_t v10 = [(BKLibraryManager *)self predicateForPurchasedBooksAssets];
  unsigned int v11 = [v10 evaluateWithObject:v22];

  id v12 = [(id)objc_opt_class() predicateForLocalOrDownloadingLibraryAssets];
  unsigned int v13 = [v12 evaluateWithObject:v22];

  if (v7)
  {
    uint64_t v14 = [v22 seriesContainer];

    if (!v14) {
      [v22 setSeriesContainer:v9];
    }
    id v15 = [v22 purchasedAndLocalParent];
    int v16 = v15 != 0;

    if (v11 != v16)
    {
      if (v11) {
        id v17 = v9;
      }
      else {
        id v17 = 0;
      }
      [v22 setPurchasedAndLocalParent:v17];
    }
    long long v18 = [v22 localOnlySeriesItemsParent];
    int v19 = v18 != 0;

    if (v13 == v19) {
      goto LABEL_21;
    }
  }
  else
  {
    [v22 setSeriesContainer:v9];
    if (v11) {
      long long v20 = v9;
    }
    else {
      long long v20 = 0;
    }
    [v22 setPurchasedAndLocalParent:v20];
  }
  if (v13) {
    long long v21 = v9;
  }
  else {
    long long v21 = 0;
  }
  [v22 setLocalOnlySeriesItemsParent:v21];
LABEL_21:

LABEL_22:
}

- (void)updateSeriesRelationshipsForSeriesContainer:(id)a3
{
  id v4 = a3;
  id v14 = [v4 seriesID];
  id v5 = [v4 managedObjectContext];
  id v6 = [(BKLibraryManager *)self seriesBooksForSeriesID:v14 inManagedObjectContext:v5];

  unsigned int v7 = [(BKLibraryManager *)self predicateForPurchasedBooksAssets];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  id v9 = [(BKLibraryManager *)self predicateForLocalLibraryAssets];
  uint64_t v10 = [v8 filteredArrayUsingPredicate:v9];

  unsigned int v11 = +[NSSet setWithArray:v6];
  [v4 setValue:v11 forKey:@"seriesBooks"];

  id v12 = +[NSSet setWithArray:v8];
  [v4 setValue:v12 forKey:@"purchasedAndLocalSeriesItems"];

  unsigned int v13 = +[NSSet setWithArray:v10];
  [v4 setValue:v13 forKey:@"localOnlySeriesItems"];

  [(BKLibraryManager *)self _updateAuthorForSeriesContainer:v4];
}

- (void)checkDatabaseIntegrity
{
  id v3 = [(BKLibraryManager *)self collectionManager];
  [v3 fixCollectionMemberAssetLinks];

  id v4 = [(BKLibraryManager *)self collectionManager];
  [v4 fixPDFCollectionIfNeeded];
}

- (void)_migrateFromOldDatabase
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_37710;
  v2[3] = &unk_D16B0;
  v2[4] = self;
  [(BKLibraryManager *)self performBlockOnCollectionsWorkerQueueAndWait:v2];
}

- (id)migrationOldDatabaseFolderPath
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v3 = [v2 lastObject];

  id v4 = [v3 stringByAppendingPathComponent:@"BKLibrary_database"];

  return v4;
}

- (id)migrationMoc
{
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"iBooks_%@.sqlite", @"v10252011_2152"];
  id v4 = [(BKLibraryManager *)self migrationOldDatabaseFolderPath];
  id v5 = [v4 stringByAppendingPathComponent:v3];

  id v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 pathForResource:@"LibraryInfo" ofType:@"momd"];

    if (v9)
    {
      uint64_t v10 = +[NSURL fileURLWithPath:v9];
      id v11 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v10];
      id v12 = [objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v11];
      if (v12)
      {
        unsigned int v13 = +[NSURL fileURLWithPath:v5 isDirectory:0];
        id v14 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", NSInferMappingModelAutomaticallyOption, &__kCFBooleanTrue, NSMigratePersistentStoresAutomaticallyOption, NSFileProtectionNone, NSPersistentStoreFileProtectionKey, 0);
        id v19 = 0;
        id v15 = [v12 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v13 options:v14 error:&v19];
        id v16 = v19;
        id v17 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
        [v17 setPersistentStoreCoordinator:v12];
        [v17 setUndoManager:0];
        [v17 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)migrationCachePath
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 lastObject];

  id v4 = [v3 stringByAppendingPathComponent:@"BKLibraryMigrationCache.plist"];

  return v4;
}

- (void)migrateDataSources:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BKLibraryManager *)self dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 migrateWithMoc:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)migrateSortOrderKeys:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_37E48;
  v5[3] = &unk_D1418;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [v4 performBlockAndWait:v5];
}

- (void)bootstrapSamplesCollectionIfNeeded
{
  id v3 = [(BKLibraryManager *)self metadataObjectForKey:@"BKLibraryHasBootstrappedSamplesCollection"];
  unsigned int v4 = [v3 BOOLValue];

  id v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"BKLibraryForceBootstrapSamplesCollection"];

  if (!v4 || v6)
  {
    id v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFSetCallBacks buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Bootstrap Samples collection: Going to bootstrap Samples collection.", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    void v8[2] = sub_382EC;
    void v8[3] = &unk_D16B0;
    void v8[4] = self;
    [(BKLibraryManager *)self performBlockOnCollectionsWorkerQueueAndWait:v8];
  }
}

- (void)saveCachedMigrationData
{
  id v3 = [(BKLibraryManager *)self migrationDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_38634;
  block[3] = &unk_D1520;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)q_removeOldMigrationData
{
  id v3 = +[NSDate date];
  unsigned int v4 = [(BKLibraryManager *)self migratedSortOrderData];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_38864;
  void v9[3] = &unk_D2630;
  id v10 = v3;
  id v5 = v3;
  unsigned int v6 = [v4 keysOfEntriesPassingTest:v9];

  if ([v6 count])
  {
    id v7 = [(BKLibraryManager *)self migratedSortOrderData];
    uint64_t v8 = [v6 allObjects];
    [v7 removeObjectsForKeys:v8];

    [(BKLibraryManager *)self setMigratedPropertiesChanged:1];
  }
}

- (void)loadCachedMigrationData
{
  id v3 = [(BKLibraryManager *)self migrationDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_38950;
  block[3] = &unk_D1520;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)fetchMigratedProperties:(id)a3 deleteFoundAssets:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_89D0;
  id v19 = sub_89E0;
  id v20 = 0;
  if (v6)
  {
    id v7 = [(BKLibraryManager *)self migrationDispatchQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_38BB4;
    v11[3] = &unk_D2658;
    long long v13 = &v15;
    v11[4] = self;
    id v12 = v6;
    BOOL v14 = a4;
    dispatch_sync(v7, v11);

    uint64_t v8 = (void *)v16[5];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)adoptMigratedProperties:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetID];
  uint64_t v6 = [(BKLibraryManager *)self fetchMigratedProperties:v5 deleteFoundAssets:1];
  if (v6)
  {
    id v7 = (void *)v6;
  }
  else
  {
    if (![v5 hasPrefix:@"sha1-"]) {
      goto LABEL_19;
    }
    uint64_t v11 = [v5 stringByReplacingOccurrencesOfString:@"sha1-" withString:@"sha1:"];

    id v7 = [(BKLibraryManager *)self fetchMigratedProperties:v11 deleteFoundAssets:1];
    id v5 = (void *)v11;
    if (!v7) {
      goto LABEL_19;
    }
  }
  uint64_t v8 = [v7 objectForKey:@"validUntilKey"];
  id v9 = [v7 objectForKey:@"sortKey"];
  [v4 setSortKey:v9];

  if (v8)
  {
    id v10 = [v7 objectForKey:@"dateLastOpened"];
    [v4 nonUserUpdateLastOpenDateTo:v10];
  }
  else
  {
    id v12 = [v7 objectForKey:@"isNew"];
    [v4 setIsNew:[v12 BOOLValue]];

    long long v13 = [v7 objectForKey:@"dateLastOpened"];
    [v4 nonUserUpdateLastOpenDateTo:v13];

    if ([v4 titleEditsSavedInLibraryOnly])
    {
      BOOL v14 = [v7 objectForKey:@"bookTitle"];
      uint64_t v15 = [v4 title];
      unsigned __int8 v16 = [v15 isEqualToString:v14];

      if ((v16 & 1) == 0) {
        [v4 setTitle:v14];
      }
      uint64_t v17 = [v7 objectForKey:@"sortTitle"];
      long long v18 = [v4 sortTitle];
      unsigned __int8 v19 = [v18 isEqualToString:v17];

      if ((v19 & 1) == 0) {
        [v4 setSortTitle:v17];
      }
    }
    id v10 = [v7 objectForKey:@"dateAdded"];
    id v20 = +[NSDate date];
    long long v21 = [v10 earlierDate:v20];

    if (v21) {
      [v4 setCreationDate:v10];
    }
  }

  id v22 = BKLibraryLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = [v4 assetID];
    id v24 = [v4 sortKey];
    long long v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isNew]);
    int v26 = 138412802;
    long long v27 = v23;
    __int16 v28 = 2112;
    id v29 = v24;
    __int16 v30 = 2112;
    id v31 = v25;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Migrating Library Asset ID: %@ newSortOrder: %@ newIsNew: %@", (uint8_t *)&v26, 0x20u);
  }
LABEL_19:
}

- (void)archiveTransientProperties:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetID];
  uint64_t v6 = [v4 sortKey];
  id v7 = [v4 lastOpenDate];

  if (v5 && v6)
  {
    v15[0] = @"sortKey";
    v15[1] = @"dateLastOpened";
    v16[0] = v6;
    v16[1] = v7;
    void v15[2] = @"validUntilKey";
    uint64_t v8 = +[NSDate dateWithTimeIntervalSinceNow:2592000.0];
    void v16[2] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

    id v10 = [(BKLibraryManager *)self migrationDispatchQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_39280;
    v12[3] = &unk_D1A38;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v5;
    id v11 = v9;
    dispatch_sync(v10, v12);
  }
}

- (void)migrateCollections:(id)a3 context:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_39448;
  v11[3] = &unk_D1A38;
  id v12 = a3;
  id v13 = self;
  id v5 = (id)objc_opt_new();
  id v14 = v5;
  id v6 = v12;
  [v6 performBlockAndWait:v11];
  id v7 = [(BKLibraryManager *)self collectionsWorkerChildContext];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_399D0;
  void v9[3] = &unk_D1418;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 performBlockAndWait:v9];
}

- (void)migrateMetaData:(id)a3
{
  id v13 = [a3 persistentStoreCoordinator];
  id v4 = [v13 persistentStores];
  id v5 = [v4 lastObject];

  id v6 = [v13 metadataForPersistentStore:v5];
  id v7 = [v6 objectForKey:@"BKDatabase-Metadata"];
  id v8 = [v7 objectForKey:@"Collections-Generation-ClientSide"];
  [(BKLibraryManager *)self setMetadataObject:v8 forKey:@"Collections-Generation-ClientSide"];

  id v9 = [v7 objectForKey:@"Collections-ServerSide-Dirty"];
  [(BKLibraryManager *)self setMetadataObject:v9 forKey:@"Collections-ServerSide-Dirty"];

  id v10 = [v7 objectForKey:@"Collections-ServerSide-Generation"];
  [(BKLibraryManager *)self setMetadataObject:v10 forKey:@"Collections-ServerSide-Generation"];

  id v11 = [v7 objectForKey:@"JaliscoStatus-ServerSide-Generation"];
  [(BKLibraryManager *)self setMetadataObject:v11 forKey:@"JaliscoStatus-ServerSide-Generation"];

  id v12 = [v7 objectForKey:@"BKCollection-NextSortKey"];
  [(BKLibraryManager *)self setMetadataObject:v12 forKey:@"BKCollection-NextSortKey"];

  [(BKLibraryManager *)self saveMetaData];
}

- (void)migratePurgeOldDatabases
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"BKLibraryKeepMigrationData"];

  if ((v4 & 1) == 0)
  {
    id v5 = [(BKLibraryManager *)self migrationOldDatabaseFolderPath];
    id v6 = +[NSFileManager defaultManager];
    id v14 = 0;
    unsigned __int8 v7 = [v6 removeItemAtPath:v5 error:&v14];
    id v8 = v14;

    if ((v7 & 1) == 0)
    {
      id v9 = BKLibraryLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_9190C();
      }
    }
    id v10 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    id v11 = [v10 lastObject];

    id v12 = [v11 stringByAppendingPathComponent:@"iBooks_revision-two.sqlite-BKSortOrderMigrator_10152011.plist"];
    id v13 = +[NSFileManager defaultManager];
    [v13 removeItemAtPath:v12 error:0];
  }
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5 = a4;
  id v6 = objc_opt_new();
  unsigned __int8 v7 = [v5 addedObjects];
  [v6 addObjectsFromArray:v7];

  id v8 = [v5 updatedObjects];
  [v6 addObjectsFromArray:v8];

  id v9 = [v5 deletedObjects];
  [v6 addObjectsFromArray:v9];

  id v10 = BKLibraryLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_919DC(v5);
  }

  id v11 = [(BKLibraryManager *)self ownershipSync];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3A358;
  block[3] = &unk_D1418;
  id v12 = v6;
  id v17 = v12;
  long long v18 = self;
  dispatch_sync(v11, block);

  id v13 = BKLibraryLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_91974();
  }

  if ([v12 count])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_3A3E4;
    v14[3] = &unk_D1418;
    void v14[4] = self;
    id v15 = v12;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
}

- (void)beginAuthentication:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BKLibraryManager *)self dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 beginAuthentication:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)finalizeAuthentication:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BKLibraryManager *)self dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 finalizeAuthentication:v4];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_updateProcessingAuthenticationStateDeferred
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3A710;
  v3[3] = &unk_D2680;
  objc_copyWeak(&v4, &location);
  [(BKLibraryManager *)self addCustomOperationBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_updateProcessingAuthenticationStateImmediate
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(BKLibraryManager *)self dataSources];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v7 processingAuthentication] & 1) != 0)
        {
          id v4 = &dword_0 + 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  [(BKLibraryManager *)self setProcessingAuthentication:v4];
}

- (void)refreshFamily
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(BKLibraryManager *)self dataSources];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          [v7 refreshFamily];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)isFamilyPurchaseWithFamilyID:(id)a3 purchaserDSID:(id)a4 downloaderDSID:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  long long v8 = BUStoreIdStringFromObject();
  id v9 = [v8 integerValue];

  long long v10 = BUStoreIdStringFromObject();

  id v11 = [v10 integerValue];
  long long v12 = BUStoreIdStringFromObject();

  id v13 = [v12 integerValue];
  if (v13) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v16 = !v14 && v11 != v13;
  return v9 || v16;
}

- (id)cloudSyncVersionsForDataType:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BCCloudSyncVersions"];
  [v7 setReturnsObjectsAsFaults:0];
  [v7 setFetchLimit:1];
  long long v8 = +[NSPredicate predicateWithFormat:@"dataType == %@", v5];
  [v7 setPredicate:v8];

  id v14 = 0;
  id v9 = [v6 executeFetchRequest:v7 error:&v14];
  id v10 = v14;
  if (v10)
  {
    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_91A94();
    }
  }
  long long v12 = [v9 firstObject];
  if (!v12)
  {
    long long v12 = +[NSEntityDescription insertNewObjectForEntityForName:@"BCCloudSyncVersions" inManagedObjectContext:v6];
    [v12 setDataType:v5];
  }

  return v12;
}

- (void)updateCloudVersionFromCloudSyncVersions:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [v7 dataType];
  id v11 = [(BKLibraryManager *)self cloudSyncVersionsForDataType:v8 inContext:v6];

  [v11 setCloudVersion:[v7 cloudVersion]];
  id v9 = [v7 historyToken];
  [v11 setHistoryToken:v9];

  id v10 = [v7 historyTokenOffset];
  [v11 setHistoryTokenOffset:v10];
}

- (id)dragInfoFromLibraryAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)BCAssetDragInfo);
  uint64_t v5 = (int)[v3 contentType];
  id v6 = [v3 assetID];
  [v4 setAssetID:v6];

  id v7 = [v3 storeID];
  [v4 setStoreID:v7];

  [v4 setContentType:v5];
  long long v8 = [v3 title];
  [v4 setTitle:v8];

  id v9 = [v3 displayAuthor];
  [v4 setAuthor:v9];

  [v4 setFileSize:[v3 fileSize]];
  id v10 = [v3 modificationDate];
  [v4 setModificationDate:v10];

  id v11 = [v3 url];
  [v4 setStoreURL:v11];

  if ([v3 contentType] == 3 && (objc_msgSend(v3, "isManagedBook") & 1) == 0)
  {
    long long v12 = [v3 path];

    if (v12)
    {
      id v13 = [v3 path];
      id v14 = +[NSURL fileURLWithPath:v13];
      [v4 setLocalFileURL:v14];
    }
  }

  return v4;
}

- ($3F30F48CCF81742A7D163F96C13F4EE1)cacheManager:(SEL)a3 bookCoverInfoForIdentifier:(id)a4
{
  id v8 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x5812000000;
  id v17 = sub_3AF98;
  long long v18 = sub_3AFDC;
  uint64_t v19 = 1024;
  memset(v20, 0, sizeof(v20));
  uint64_t v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_3B030;
  v11[3] = &unk_D2250;
  void v11[4] = self;
  id v9 = a5;
  id v12 = v9;
  id v13 = &v14;
  [(BKLibraryManager *)self performNamed:@"bookCoverInfoForIdentifier" workerQueueBlockAndWait:v11];
  sub_3B300((uint64_t)retstr, (uint64_t)(v15 + 6));

  _Block_object_dispose(&v14, 8);
  sub_3AFE4((uint64_t)v20);

  return result;
}

- (void)cacheManager:(id)a3 explicitIdentifiersWithCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3B3F8;
  v6[3] = &unk_D1BC8;
  id v7 = a4;
  id v5 = v7;
  [(BKLibraryManager *)self performBlockOnWorkerQueue:v6];
}

- (void)resetCover:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [(BKLibraryManager *)self imageSource];
    [v4 removeImagesForAssetID:v6 temporaryAssetID:0];

    id v5 = +[NSDate date];
    [(BKLibraryManager *)self updateLibraryAssetWithID:v6 withLastOpenDate:v5 completion:0];
  }
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 persistentStoreURL];
  id v6 = [v5 URLByDeletingLastPathComponent];
  id v7 = +[NSFileManager defaultManager];
  id v10 = 0;
  [v7 removeItemAtURL:v6 error:&v10];
  id v8 = v10;

  id v9 = (void (**)(id, BOOL, id))objc_retainBlock(v4);
  if (v9) {
    v9[2](v9, v8 == 0, v8);
  }
}

- (void)collectionManagerDidModifyWantToReadCollection:(id)a3
{
  id v4 = BKLibraryPriceTrackingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "WTR collection changed, scheduling price tracking update", v6, 2u);
  }

  id v5 = [(BKLibraryManager *)self priceTracker];
  [v5 setNeedsConfigurationUpdate];
}

- (BKLibraryManagedObjectContext)readOnlyChildContext
{
  return self->_readOnlyChildContext;
}

- (BKLibraryDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BKLibraryImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(id)a3
{
}

- (NSOperationQueue)imageSourceOperationQueue
{
  return self->_imageSourceOperationQueue;
}

- (void)setImageSourceOperationQueue:(id)a3
{
}

- (NSOperationQueue)imageSourceScalingOperationQueue
{
  return self->_imageSourceScalingOperationQueue;
}

- (void)setImageSourceScalingOperationQueue:(id)a3
{
}

- (BKLibraryPriceManager)priceManager
{
  return self->_priceManager;
}

- (void)setPriceManager:(id)a3
{
}

- (BKLibraryAssetDetailsManager)assetDetailsManager
{
  return self->_assetDetailsManager;
}

- (void)setAssetDetailsManager:(id)a3
{
}

- (BOOL)didMigrateFromITunesSyncToICloudSync
{
  return self->_didMigrateFromITunesSyncToICloudSync;
}

- (void)setDidMigrateFromITunesSyncToICloudSync:(BOOL)a3
{
  self->_didMigrateFromITunesSyncToICloudSync = a3;
}

- (BKLibraryPriceTracker)priceTracker
{
  return self->_priceTracker;
}

- (BOOL)processingAuthentication
{
  return self->_processingAuthentication;
}

- (void)setProcessingAuthentication:(BOOL)a3
{
  self->_processingAuthentication = a3;
}

- (BKLibraryManagedObjectContext)collectionsWorkerChildContext
{
  return self->_collectionsWorkerChildContext;
}

- (void)setCollectionsWorkerChildContext:(id)a3
{
}

- (BKLibraryManagedObjectContext)workerChildContext
{
  return self->_workerChildContext;
}

- (void)setWorkerChildContext:(id)a3
{
}

- (IMManagedObjectContextReadOnlyPool)backgroundReadOnlyContextPool
{
  return self->_backgroundReadOnlyContextPool;
}

- (void)setBackgroundReadOnlyContextPool:(id)a3
{
}

- (BOOL)isReloading
{
  return self->_reloading;
}

- (void)setReloading:(BOOL)a3
{
  self->_reloading = a3;
}

- (BOOL)collectionsDirty
{
  return self->_collectionsDirty;
}

- (void)setCollectionsDirty:(BOOL)a3
{
  self->_collectionsDirty = a3;
}

- (BOOL)migratedPropertiesChanged
{
  return self->_migratedPropertiesChanged;
}

- (void)setMigratedPropertiesChanged:(BOOL)a3
{
  self->_migratedPropertiesChanged = a3;
}

- (NSMutableDictionary)migratedSortOrderData
{
  return self->_migratedSortOrderData;
}

- (void)setMigratedSortOrderData:(id)a3
{
}

- (NSMutableDictionary)migratedSortOrderDataByPluginAssetID
{
  return self->_migratedSortOrderDataByPluginAssetID;
}

- (void)setMigratedSortOrderDataByPluginAssetID:(id)a3
{
}

- (OS_dispatch_queue)migrationDispatchQueue
{
  return self->_migrationDispatchQueue;
}

- (void)setMigrationDispatchQueue:(id)a3
{
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (void)setNeedsMigration:(BOOL)a3
{
  self->_needsMigration = a3;
}

- (OS_dispatch_queue)updatesScheduleQueue
{
  return self->_updatesScheduleQueue;
}

- (void)setUpdatesScheduleQueue:(id)a3
{
}

- (BKLibraryManagedObjectContext)usq_moc
{
  return self->_usq_moc;
}

- (void)setUsq_moc:(id)a3
{
}

- (OS_dispatch_queue)dqSyncQueue
{
  return self->_dqSyncQueue;
}

- (void)setDqSyncQueue:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (NSMutableSet)identifiersForAssetsNeedingReconcile
{
  return self->_identifiersForAssetsNeedingReconcile;
}

- (void)setIdentifiersForAssetsNeedingReconcile:(id)a3
{
}

- (NSMutableDictionary)assetUpdatesByIdentifier
{
  return self->_assetUpdatesByIdentifier;
}

- (void)setAssetUpdatesByIdentifier:(id)a3
{
}

- (NSMutableSet)unclaimedAssetIDs
{
  return self->_unclaimedAssetIDs;
}

- (void)setUnclaimedAssetIDs:(id)a3
{
}

- (NSMutableSet)unclaimedTemporaryAssetIDs
{
  return self->_unclaimedTemporaryAssetIDs;
}

- (void)setUnclaimedTemporaryAssetIDs:(id)a3
{
}

- (void)setCollectionManager:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedLibraryReload
{
  return self->_coalescedLibraryReload;
}

- (void)setCoalescedLibraryReload:(id)a3
{
}

- (NSMutableDictionary)coalescedDataSourceReloadByIdentifier
{
  return self->_coalescedDataSourceReloadByIdentifier;
}

- (void)setCoalescedDataSourceReloadByIdentifier:(id)a3
{
}

- (OS_dispatch_queue)coalescedDataSourceReloadByIdentifierSync
{
  return self->_coalescedDataSourceReloadByIdentifierSync;
}

- (void)setCoalescedDataSourceReloadByIdentifierSync:(id)a3
{
}

- (NSDictionary)dataSourcesByIdentifier
{
  return self->_dataSourcesByIdentifier;
}

- (void)setDataSourcesByIdentifier:(id)a3
{
}

- (BCManagedObjectIDMonitor)dataSourceIdentifierAndStateMonitor
{
  return self->_dataSourceIdentifierAndStateMonitor;
}

- (void)setDataSourceIdentifierAndStateMonitor:(id)a3
{
}

- (BCManagedObjectIDMonitor)dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs
{
  return self->_dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs;
}

- (void)setDataSourceIdentifierAndStateMonitorForTemporaryAssetIDs:(id)a3
{
}

- (NSMutableDictionary)ownershipObservers
{
  return self->_ownershipObservers;
}

- (void)setOwnershipObservers:(id)a3
{
}

- (OS_dispatch_queue)ownershipSync
{
  return self->_ownershipSync;
}

- (void)setOwnershipSync:(id)a3
{
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (BOOL)resetSeriesOnAllBooks
{
  return self->_resetSeriesOnAllBooks;
}

- (void)setResetSeriesOnAllBooks:(BOOL)a3
{
  self->_resetSeriesOnAllBooks = a3;
}

- (BOOL)needsResetNilAuthorsOnAllSeries
{
  return self->_needsResetNilAuthorsOnAllSeries;
}

- (void)setNeedsResetNilAuthorsOnAllSeries:(BOOL)a3
{
  self->_needsResetNilAuthorsOnAllSeries = a3;
}

- (BOOL)needsResetNilAuthorsOnAllBooks
{
  return self->_needsResetNilAuthorsOnAllBooks;
}

- (void)setNeedsResetNilAuthorsOnAllBooks:(BOOL)a3
{
  self->_needsResetNilAuthorsOnAllBooks = a3;
}

- (BOOL)needsResetSeriesStacksAndCollectionMembershipOnAllBooks
{
  return self->_needsResetSeriesStacksAndCollectionMembershipOnAllBooks;
}

- (void)setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:(BOOL)a3
{
  self->_needsResetSeriesStacksAndCollectionMembershipOnAllBooks = a3;
}

- (BOOL)needsDuplicateCollectionMembersRemoved
{
  return self->_needsDuplicateCollectionMembersRemoved;
}

- (void)setNeedsDuplicateCollectionMembersRemoved:(BOOL)a3
{
  self->_needsDuplicateCollectionMembersRemoved = a3;
}

- (BOOL)usePerformancePredicates
{
  return self->_usePerformancePredicates;
}

- (void)setUsePerformancePredicates:(BOOL)a3
{
  self->_usePerformancePredicates = a3;
}

- (BOOL)hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks
{
  return self->_hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks;
}

- (void)setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks:(BOOL)a3
{
  self->_hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks = a3;
}

- (os_unfair_lock_s)notifyLockForNewAssets
{
  return self->_notifyLockForNewAssets;
}

- (void)setNotifyLockForNewAssets:(os_unfair_lock_s)a3
{
  self->_notifyLockForNewAssets = a3;
}

- (NSMutableDictionary)notifyBlocksForNewAssets
{
  return self->_notifyBlocksForNewAssets;
}

- (void)setNotifyBlocksForNewAssets:(id)a3
{
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_notifyBlocksForNewAssets, 0);
  objc_storeStrong((id *)&self->_ownershipSync, 0);
  objc_storeStrong((id *)&self->_ownershipObservers, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifierAndStateMonitor, 0);
  objc_storeStrong((id *)&self->_dataSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_coalescedDataSourceReloadByIdentifierSync, 0);
  objc_storeStrong((id *)&self->_coalescedDataSourceReloadByIdentifier, 0);
  objc_storeStrong((id *)&self->_coalescedLibraryReload, 0);
  objc_storeStrong((id *)&self->_collectionManager, 0);
  objc_storeStrong((id *)&self->_unclaimedTemporaryAssetIDs, 0);
  objc_storeStrong((id *)&self->_unclaimedAssetIDs, 0);
  objc_storeStrong((id *)&self->_assetUpdatesByIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersForAssetsNeedingReconcile, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_dqSyncQueue, 0);
  objc_storeStrong((id *)&self->_usq_moc, 0);
  objc_storeStrong((id *)&self->_updatesScheduleQueue, 0);
  objc_storeStrong((id *)&self->_migrationDispatchQueue, 0);
  objc_storeStrong((id *)&self->_migratedSortOrderDataByPluginAssetID, 0);
  objc_storeStrong((id *)&self->_migratedSortOrderData, 0);
  objc_storeStrong((id *)&self->_backgroundReadOnlyContextPool, 0);
  objc_storeStrong((id *)&self->_workerChildContext, 0);
  objc_storeStrong((id *)&self->_collectionsWorkerChildContext, 0);
  objc_storeStrong((id *)&self->_priceTracker, 0);
  objc_storeStrong((id *)&self->_assetDetailsManager, 0);
  objc_storeStrong((id *)&self->_priceManager, 0);
  objc_storeStrong((id *)&self->_imageSourceScalingOperationQueue, 0);
  objc_storeStrong((id *)&self->_imageSourceOperationQueue, 0);
  objc_storeStrong((id *)&self->_imageSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_readOnlyChildContext, 0);
  objc_storeStrong((id *)&self->_uiChildContext, 0);
  objc_storeStrong((id *)&self->_ui_persistentStore, 0);

  objc_storeStrong((id *)&self->_ui_persistentStoreCoordinator, 0);
}

- (void)setCollectionsCloudGeneration:(id)a3
{
}

- (id)collectionsCloudGeneration
{
  return [(BKLibraryManager *)self metadataObjectForKey:@"Collections-ServerSide-Generation"];
}

- (void)setJaliscoStatusCloudGeneration:(id)a3
{
}

- (id)jaliscoStatusCloudGeneration
{
  return [(BKLibraryManager *)self metadataObjectForKey:@"JaliscoStatus-ServerSide-Generation"];
}

- (void)resetNextCollectionSort
{
}

- (id)copyNextCollectionSortKey:(id)a3
{
  return [(BKLibraryManager *)self copyNextSortValue:a3 forKey:@"BKCollection-NextSortKey" forEntityName:@"BKCollection"];
}

+ (void)fetchImageShadowForAsset:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    id v12 = [v9 assetID];
    id v13 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v12, [a1 processingOptionsFor:v9 coverEffectsEnvironment:0] | 0x10, width, height);

    [v13 setPriority:5];
    uint64_t v14 = +[BCCacheManager defaultCacheManager];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_5FFE8;
    void v16[3] = &unk_D3248;
    id v17 = v11;
    [v14 fetchCGImageFor:v13 forRequest:v13 completion:v16];
  }
  else
  {
    id v15 = objc_retainBlock(v10);
    id v13 = v15;
    if (v15) {
      (*((void (**)(id, void))v15 + 2))(v15, 0);
    }
  }
}

+ (void)fetchImageShadowForAssetID:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a5;
  id v10 = a3;
  id v11 = [a1 defaultManager];
  id v19 = v10;
  id v12 = +[NSArray arrayWithObjects:&v19 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_6023C;
  v14[3] = &unk_D3298;
  CGFloat v17 = width;
  CGFloat v18 = height;
  id v15 = v9;
  id v16 = a1;
  id v13 = v9;
  [v11 fetchLibraryAssetsFromAssetIDs:v12 handler:v14];
}

+ (void)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 coverEffectsEnvironment:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  double height = a4.height;
  double width = a4.width;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_60480;
  void v16[3] = &unk_D3270;
  id v17 = a8;
  id v15 = v17;
  [a1 _fetchImageForAsset:a3 size:v10 includeSpine:v9 includeShadow:0 allowGeneric:a7 coverEffectsEnvironment:v16 completion:width, height];
}

+ (void)_fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 allowGeneric:(BOOL)a7 coverEffectsEnvironment:(id)a8 completion:(id)a9
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  id v18 = a8;
  id v19 = a9;
  id v20 = v19;
  if (v17)
  {
    if (v13) {
      unsigned int v21 = [a1 processingOptionsFor:v17 coverEffectsEnvironment:v18];
    }
    else {
      unsigned int v21 = 0;
    }
    if (v21) {
      int v24 = v12;
    }
    else {
      int v24 = 1;
    }
    if (v24) {
      uint64_t v25 = v21;
    }
    else {
      uint64_t v25 = v21 | 0x100;
    }
    int v26 = [v17 assetID];
    long long v27 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v26, v25, width, height);

    if (v11) {
      uint64_t v28 = 16;
    }
    else {
      uint64_t v28 = 2;
    }
    [v27 setRequestOptions:v28];
    [v27 setPriority:5];
    id v29 = +[BCCacheManager defaultCacheManager];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    void v30[2] = sub_60754;
    v30[3] = &unk_D3248;
    id v31 = v20;
    [v29 fetchCGImageFor:v27 forRequest:v27 completion:v30];
  }
  else
  {
    id v22 = objc_retainBlock(v19);
    id v23 = v22;
    if (v22) {
      (*((void (**)(id, void))v22 + 2))(v22, 0);
    }
  }
}

+ (void)fetchImageForAssetID:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 coverEffectsEnvironment:(id)a7 completion:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a8;
  id v16 = a3;
  id v17 = +[BKCapturedCoverEffectsEnvironment newCapturedEnvironment:a7];
  id v18 = [a1 defaultManager];
  id v30 = v16;
  id v19 = +[NSArray arrayWithObjects:&v30 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  void v22[2] = sub_60954;
  v22[3] = &unk_D32C0;
  id v24 = v15;
  id v25 = a1;
  CGFloat v26 = width;
  CGFloat v27 = height;
  BOOL v28 = a5;
  BOOL v29 = a6;
  id v23 = v17;
  id v20 = v15;
  id v21 = v17;
  [v18 fetchLibraryAssetsFromAssetIDs:v19 handler:v22];
}

+ (id)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 coverEffectsEnvironment:(id)a6
{
  return [a1 fetchImageForAsset:a3 size:a5 includeSpine:0 allowGeneric:a6 coverEffectsEnvironment:a4.width height:a4.height timeout:2.0];
}

+ (id)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 allowGeneric:(BOOL)a6 coverEffectsEnvironment:(id)a7 timeout:(double)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_60D58;
  id v34 = sub_60D68;
  id v35 = 0;
  if (v15)
  {
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    [v15 assetID];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    void v26[2] = sub_60D70;
    void v26[3] = &unk_D32E8;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = v18;
    BOOL v29 = &v30;
    id v19 = v17;
    BOOL v28 = v19;
    [a1 _fetchImageForAsset:v15 size:v11 includeSpine:0 includeShadow:v10 allowGeneric:v16 coverEffectsEnvironment:v26 completion:width, height];
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a8 * 1000000000.0));
    if (dispatch_semaphore_wait(v19, v20))
    {
      id v21 = BCImageCacheLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v15 assetID];
        sub_92F40(v22, buf, v21);
      }
    }
    id v23 = (void *)v31[5];
  }
  else
  {
    id v23 = 0;
  }
  id v24 = v23;
  _Block_object_dispose(&v30, 8);

  return v24;
}

+ (id)fetchImageForAssetID:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 coverEffectsEnvironment:(id)a6
{
  BOOL v6 = a5;
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a3;
  BOOL v13 = [a1 defaultManager];
  id v14 = [v13 newManagedObjectContext];

  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NewMOC 1 %s %@", "+[BKLibraryManager(BCCacheManager) fetchImageForAssetID:size:includeSpine:coverEffectsEnvironment:]", v12);
  [v14 setName:v15];

  id v16 = [a1 defaultManager];
  id v22 = v12;
  dispatch_semaphore_t v17 = +[NSArray arrayWithObjects:&v22 count:1];

  id v18 = [v16 libraryAssetsWithAssetIDsContainedInList:v17 tempAssetIDs:0 inManagedObjectContext:v14];

  if ([v18 count])
  {
    id v19 = [v18 objectAtIndexedSubscript:0];
    dispatch_time_t v20 = [a1 fetchImageForAsset:v19 size:v6 includeSpine:v11 coverEffectsEnvironment:width, height];
  }
  else
  {
    dispatch_time_t v20 = 0;
  }

  return v20;
}

+ (unsigned)processingOptionsFor:(id)a3 coverEffectsEnvironment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isContainer])
  {
    id v7 = [v5 seriesBooks];
    id v8 = [v7 anyObject];

    __int16 v9 = 32;
    if (v8)
    {
      if ([v8 isAudiobook]) {
        __int16 v9 = 2080;
      }
      else {
        __int16 v9 = 32;
      }
    }
  }
  else
  {
    unsigned int v10 = [v5 contentType];
    if (v10 - 6 >= 0xE)
    {
      switch(v10)
      {
        case 0u:
          if ([v5 state] == 5
            || [v5 state] == 6
            || [v5 state] == 2)
          {
            goto LABEL_23;
          }
          goto LABEL_28;
        case 1u:
        case 4u:
LABEL_23:
          __int16 v9 = 2;
          break;
        case 2u:
        case 3u:
          __int16 v9 = 4;
          break;
        default:
LABEL_28:
          __int16 v9 = 0;
          break;
      }
    }
    else
    {
      __int16 v9 = 8;
    }
  }
  id v11 = [v6 coverEffectRTLOverride];
  id v12 = v11;
  if (v11)
  {
    if (([v11 BOOLValue] & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ([v5 isRightToLeft]) {
LABEL_11:
  }
    v9 |= 0x80u;
LABEL_12:
  BOOL v13 = [v5 isExplicit];
  if ([v13 BOOLValue])
  {
    id v14 = +[BKLibraryManager defaultManager];
    unsigned int v15 = [v14 isExplicitMaterialAllowed];

    if (!v15) {
      v9 |= 0x400u;
    }
  }
  else
  {
  }
  if ([v6 coverEffectsNightMode]) {
    unsigned __int16 v16 = v9 | 0x40;
  }
  else {
    unsigned __int16 v16 = v9;
  }

  return v16;
}

@end