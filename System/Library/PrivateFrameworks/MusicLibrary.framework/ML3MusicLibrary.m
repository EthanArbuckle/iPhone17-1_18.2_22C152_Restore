@interface ML3MusicLibrary
+ (BOOL)autoFilledTracksArePurgeable;
+ (BOOL)deviceSupportsASTC;
+ (BOOL)dropIndexesUsingConnection:(id)a3 tableNames:(const char *)a4;
+ (BOOL)orderingLanguageMatchesSystemUsingConnection:(id)a3;
+ (BOOL)shouldOptimizeStorage;
+ (BOOL)supportsSecureCoding;
+ (BOOL)updateTrackIntegrityOnConnection:(id)a3;
+ (BOOL)userVersionMatchesSystemUsingConnection:(id)a3;
+ (ML3MusicLibrary)autoupdatingSharedLibrary;
+ (NSArray)allLibraries;
+ (NSArray)registeredLibraries;
+ (NSDictionary)distributedToLocalNotificationMapping;
+ (NSMutableDictionary)musicLibraryPerUserDSID;
+ (NSString)autoupdatingSharedLibraryPath;
+ (NSString)sharedLibraryDatabasePath;
+ (OS_dispatch_queue)globalSerialQueue;
+ (id)_onGlobalQueue_shareableMusicLibraryWithResourcesManager:(id)a3 libraryFilePath:(id)a4;
+ (id)allLibraryContainerPaths;
+ (id)allPragmaSQL;
+ (id)allSchemaSQL;
+ (id)allTables;
+ (id)allTriggersSQL;
+ (id)artworkRelativePathFromToken:(id)a3;
+ (id)artworkTokenForArtistHeroURL:(id)a3;
+ (id)artworkTokenForChapterWithItemPID:(int64_t)a3 retrievalTime:(double)a4;
+ (id)assistantSyncDataChangedNotificationName;
+ (id)cloudAssetsSharedCacheFolderPath;
+ (id)databasePathForUnitTest:(id)a3 withBasePath:(id)a4;
+ (id)indexSchemaSQL;
+ (id)itemIndexSchemaSQL;
+ (id)itemNewSchemaSQL;
+ (id)itemSchemaSQL;
+ (id)jaliscoGetSortedMediaKinds:(id)a3;
+ (id)libraryContainerPath;
+ (id)libraryContainerPathByAppendingPathComponent:(id)a3;
+ (id)libraryContainerRelativePath:(id)a3;
+ (id)libraryPathForContainerPath:(id)a3;
+ (id)localizedSectionHeaderForSectionHeader:(id)a3;
+ (id)localizedSectionIndexTitleForSectionHeader:(id)a3;
+ (id)mediaFolderPath;
+ (id)mediaFolderPathByAppendingPathComponent:(id)a3;
+ (id)musicLibraryForUserAccount:(id)a3;
+ (id)pathForBaseLocationPath:(int64_t)a3;
+ (id)pathForResourceFileOrFolder:(int)a3;
+ (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6;
+ (id)sectionIndexTitleForSectionHeader:(id)a3;
+ (id)sectionIndexTitles;
+ (id)sharedLibrary;
+ (id)sortMapNewSchemaSQL;
+ (id)sortMapSchemaSQL;
+ (id)unitTestableLibraryForTest:(id)a3 basePath:(id)a4 setupSQLFilenames:(id)a5;
+ (id)widthLimitedSetValuesQueue;
+ (int)userVersionUsingConnection:(id)a3;
+ (int64_t)artworkSourceTypeForTrackSource:(int)a3;
+ (int64_t)devicePreferredImageFormat;
+ (int64_t)minimumPurgeableStorage;
+ (void)clearCloudAssetSharedCache;
+ (void)disableAutomaticDatabaseValidation;
+ (void)disableSharedLibrary;
+ (void)enableAutomaticDatabaseValidation;
+ (void)enumerateSortMapTablesUsingBlock:(id)a3;
+ (void)removeOrphanedTracks;
+ (void)setAutoFilledTracksArePurgeable:(BOOL)a3;
+ (void)setAutoupdatingSharedLibraryPath:(id)a3;
+ (void)setGlobalPrivacyContextWithAuditToken:(id *)a3;
+ (void)setMinimumPurgeableStorage:(int64_t)a3;
+ (void)setSharedLibraryDatabasePath:(id)a3;
+ (void)setShouldOptimizeStorage:(BOOL)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)nameOrderForString:(id)a3;
- (BOOL)_canConfigureMediaLibraryDatabaseConnection:(id)a3;
- (BOOL)_clearAllRowsFromTables:(id)a3;
- (BOOL)_coalesceMismatchedCollectionClass:(Class)a3 usingConnection:(id)a4;
- (BOOL)_determineAndUpdateBestArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 preserveExistingAvailableToken:(BOOL)a7 usingConnection:(id)a8;
- (BOOL)_insertArtworkRowWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 relativePath:(id)a6;
- (BOOL)_insertArtworkRowWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 relativePath:(id)a6 usingConnection:(id)a7;
- (BOOL)_prepareForAccountChange:(id *)a3;
- (BOOL)_removeInvalidAvailableArtworkTokensUsingConnection:(id)a3;
- (BOOL)_removeOrphanedArtworkAssetsUsingConnection:(id)a3;
- (BOOL)_removeOrphanedArtworkMetadataUsingConnection:(id)a3;
- (BOOL)_removeOrphanedArtworkTokensUsingConnection:(id)a3;
- (BOOL)_removeSource:(int)a3 fromPersistentIDS:(id)a4 forImportOperation:(id)a5 canonocalizeCollections:(BOOL)a6 usingConnection:(id)a7 postNotifications:(BOOL)a8;
- (BOOL)_shouldProcessAccountChanges;
- (BOOL)_shouldPurgeManagedAlbumsTracksForUrgency:(unint64_t)a3;
- (BOOL)_unmanagedPurgeShouldPurgeKeepLocalTracksForUrgency:(unint64_t)a3;
- (BOOL)_updateBestArtworkTokensForArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 preserveExistingAvailableToken:(BOOL)a6 usingConnection:(id)a7;
- (BOOL)_validateDatabaseUsingConnection:(id)a3 error:(id *)a4;
- (BOOL)automaticDatabaseValidationDisabled;
- (BOOL)cleanupArtworkWithOptions:(unint64_t)a3;
- (BOOL)cleanupArtworkWithOptions:(unint64_t)a3 usingConnection:(id)a4;
- (BOOL)clearAllCloudKVSData;
- (BOOL)clearAllGeniusData;
- (BOOL)coalesceMismatchedCollectionsUsingConnection:(id)a3;
- (BOOL)coerceValidDatabaseWithError:(id *)a3;
- (BOOL)createIndexes;
- (BOOL)deleteArtworkToken:(id)a3;
- (BOOL)deleteDatabaseProperty:(id)a3;
- (BOOL)downloadOnAddToLibrary;
- (BOOL)emptyAllTables;
- (BOOL)hasAddedToLibraryAppleMusicContent;
- (BOOL)hasOriginalArtworkForRelativePath:(id)a3;
- (BOOL)hasPresignedValidity;
- (BOOL)hasUserPlaylists;
- (BOOL)hasUserPlaylistsContainingAppleMusicContent;
- (BOOL)importExistingOriginalArtworkWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 mediaType:(unsigned int)a6;
- (BOOL)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7;
- (BOOL)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8;
- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7;
- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8;
- (BOOL)inTransactionUpdateSearchMapOnConnection:(id)a3;
- (BOOL)inTransactionUpdateSortMapOnConnection:(id)a3 forceRebuild:(BOOL)a4 forceUpdateOriginals:(BOOL)a5;
- (BOOL)inTransactionUpdateSortMapOnConnection:(id)a3 forceUpdateOriginals:(BOOL)a4;
- (BOOL)isArtworkFetchableForPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6;
- (BOOL)isArtworkTokenAvailable:(id)a3;
- (BOOL)isAutoUpdatingSharedLibrary;
- (BOOL)isCurrentThreadInTransaction;
- (BOOL)isHomeSharingLibrary;
- (BOOL)isLibraryEmpty;
- (BOOL)isReadOnly;
- (BOOL)isUnitTesting;
- (BOOL)jaliscoHasCloudGeniusData;
- (BOOL)jaliscoIsMusicGeniusUserEnabled;
- (BOOL)jaliscoNeedsUpdateForTokens;
- (BOOL)markSystemPurgeableMusicPath:(id)a3 forUrgency:(unint64_t)a4;
- (BOOL)mediaRestrictionEnabled;
- (BOOL)persistentID:(int64_t)a3 changedAfterRevision:(int64_t)a4 revisionTrackingCode:(int64_t)a5;
- (BOOL)prepareUnitTestDatabaseWithSQLFromContentsOfFile:(id)a3 error:(id *)a4;
- (BOOL)removeArtworkAssetWithToken:(id)a3;
- (BOOL)removeSource:(int)a3 forImportOperation:(id)a4 usingConnection:(id)a5 postNotifications:(BOOL)a6;
- (BOOL)removeSource:(int)a3 fromPersistentIDS:(id)a4 forImportOperation:(id)a5 usingConnection:(id)a6 postNotifications:(BOOL)a7;
- (BOOL)repairAlbumArtistRelationshipsWithConnection:(id)a3;
- (BOOL)requiresNonSchemaUpdatesOnConnection:(id)a3;
- (BOOL)requiresSchemaOnlyUpdatesOnConnection:(id)a3;
- (BOOL)sagaInitiateClientResetSync;
- (BOOL)sagaNeedsFullUpdate;
- (BOOL)sagaPrefersToMergeWithCloudLibrary;
- (BOOL)sanitizeSortMapContentsUsingConnection:(id)a3 didSortMapEntries:(BOOL *)a4;
- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4;
- (BOOL)supportsUbiquitousPlaybackPositions;
- (BOOL)updateSortMap;
- (BOOL)updateSortMapOnConnection:(id)a3;
- (BOOL)updateSortMapOnConnection:(id)a3 forceUpdateOriginals:(BOOL)a4;
- (BOOL)updateSystemPlaylistNamesForCurrentLanguageUsingConnection:(id)a3;
- (BOOL)validateDatabase;
- (BOOL)validateItemTablesEntriesUsingConnection:(id)a3;
- (BOOL)validateSortMapUnicodeVersionOnConnection:(id)a3;
- (BOOL)verifyPresignedValidity;
- (CGSize)_sizeForColorAnalysisForMediaType:(unsigned int)a3 artworkType:(int64_t)a4;
- (ML3Container)currentDeviceFavoriteSongsPlaylist;
- (ML3Container)currentDevicePhotosMemoriesPlaylist;
- (ML3Container)currentDevicePlaybackHistoryPlaylist;
- (ML3Container)currentDevicePurchasesPlaylist;
- (ML3DatabaseConnectionPool)connectionPool;
- (ML3DatabaseMetadata)databaseInfo;
- (ML3DatabasePrivacyContext)privacyContext;
- (ML3LibraryNotificationManager)notificationManager;
- (ML3MusicLibrary)initWithClientIdentity:(id)a3 forUserAccount:(id)a4;
- (ML3MusicLibrary)initWithClientIdentity:(id)a3 path:(id)a4;
- (ML3MusicLibrary)initWithClientIdentity:(id)a3 path:(id)a4 readOnly:(BOOL)a5 populateUnitTestTablesBlock:(id)a6;
- (ML3MusicLibrary)initWithCoder:(id)a3;
- (ML3MusicLibrary)initWithPath:(id)a3;
- (ML3MusicLibrary)initWithPath:(id)a3 isUnitTesting:(BOOL)a4;
- (ML3MusicLibrary)initWithPath:(id)a3 readOnly:(BOOL)a4 populateUnitTestTablesBlock:(id)a5;
- (ML3MusicLibrary)initWithResourcesManager:(id)a3;
- (ML3MusicLibraryDelegate)delegate;
- (ML3MusicLibraryResourcesManager)resourcesManager;
- (NSArray)jaliscoLastExcludedMediaKinds;
- (NSArray)libraryContainerFilterPredicates;
- (NSArray)libraryEntityFilterPredicates;
- (NSArray)libraryPublicContainerFilterPredicates;
- (NSArray)libraryPublicEntityFilterPredicates;
- (NSArray)localizedSectionIndexTitles;
- (NSArray)preferredAudioTracks;
- (NSArray)preferredSubtitleTracks;
- (NSDate)jaliscoLastGeniusUpdateDate;
- (NSDate)jaliscoLastLibraryUpdateTime;
- (NSDate)sagaLastGeniusUpdateDate;
- (NSDate)sagaLastItemPlayDataUploadDate;
- (NSDate)sagaLastLibraryUpdateTime;
- (NSDate)sagaLastPlaylistPlayDataUploadDate;
- (NSDate)sagaLastSubscribedContainersUpdateTime;
- (NSNumber)jaliscoAccountID;
- (NSNumber)sagaAccountID;
- (NSNumber)sagaLastKnownActiveLockerAccountDSID;
- (NSString)accountDSID;
- (NSString)artworkDirectory;
- (NSString)databasePath;
- (NSString)debugDescription;
- (NSString)jaliscoLastSupportedMediaKinds;
- (NSString)libraryUID;
- (NSString)originalArtworkDirectory;
- (NSString)rootArtworkCacheDirectory;
- (NSString)sagaClientFeaturesVersion;
- (NSString)sagaCloudLibraryCUID;
- (NSString)sagaCloudLibraryTroveID;
- (NSString)sagaLastCloudUpdateClientBuildVersion;
- (NSString)storefrontIdentifier;
- (NSString)syncLibraryID;
- (OS_dispatch_queue)serialQueue;
- (iPhoneSortKeyBuilder)sortKeyBuilder;
- (id)_allArtworkVariantDirectories;
- (id)_allKeepLocalPlaylistTracks;
- (id)_getPlaylistContentTasteChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4;
- (id)_newGeniusDBConnectionAtPath:(id)a3;
- (id)_nonPurgeableAlbumsQuerySQLWithUrgency:(unint64_t)a3;
- (id)_notInKeepLocalCollectionPredicate;
- (id)_purgeableAlbumsQuerySQLWithUrgency:(unint64_t)a3;
- (id)_purgeableItemsPredicateSQLWithUrgency:(unint64_t)a3;
- (id)_purgeableNonCachedItemsPredicateSQL;
- (id)_purgeableTrackPredicateWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4 includeCloudAssets:(BOOL)a5;
- (id)_systemUnicodeVersionData;
- (id)accountCacheDatabase;
- (id)albumArtistForEffectiveAlbumArtistName:(id)a3;
- (id)albumForAlbumArtistPersistentID:(int64_t)a3 albumName:(id)a4 feedURL:(id)a5 seasonNumber:(id)a6 compilation:(BOOL)a7;
- (id)artistForArtistName:(id)a3 seriesName:(id)a4;
- (id)artistGroupingKeyForArtistName:(id)a3 seriesName:(id)a4;
- (id)artworkCacheDirectoryForEffect:(id)a3;
- (id)artworkCacheDirectoryForSize:(CGSize)a3;
- (id)checkoutReaderConnection;
- (id)checkoutWriterConnection;
- (id)composerForComposerName:(id)a3;
- (id)genreForGenre:(id)a3;
- (id)getAlbumArtistChanges;
- (id)getAlbumArtistChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4;
- (id)getAlbumChanges;
- (id)getAlbumChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4;
- (id)groupingKeyForString:(id)a3;
- (id)groupingKeysForStrings:(id)a3;
- (id)insertStringsIntoSortMap:(id)a3;
- (id)insertStringsIntoSortMap:(id)a3 didReSortMap:(BOOL *)a4;
- (id)libraryContainerPath;
- (id)libraryContainerPathByAppendingPathComponent:(id)a3;
- (id)libraryContainerRelativePath:(id)a3;
- (id)libraryEntityFilterPredicatesForContainerClass:(Class)a3;
- (id)libraryEntityFilterPredicatesForEntityClass:(Class)a3;
- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3;
- (id)mediaFolderPath;
- (id)mediaFolderPathByAppendingPathComponent:(id)a3;
- (id)mediaFolderRelativePath:(id)a3;
- (id)pathForBaseLocationPath:(int64_t)a3;
- (id)pathForResourceFileOrFolder:(int)a3;
- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6;
- (id)securityScopedFileURLForItemPID:(unint64_t)a3;
- (id)valueForDatabaseProperty:(id)a3;
- (int)currentDatabaseVersion;
- (int64_t)_clearAllCloudAssets;
- (int64_t)_clearDatabaseFileFreeSpace;
- (int64_t)_clearOrphanedAssetsOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4;
- (int64_t)_clearPurgeableTracksOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeAutoFilledTracks:(BOOL)a5;
- (int64_t)_clearPurgeableTracksOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeCloudAssets:(BOOL)a5 includeAutoFilledTracks:(BOOL)a6;
- (int64_t)_cloudAssetsTotalSize;
- (int64_t)_databaseFileFreeSpace;
- (int64_t)_purgeableTracksTotalSizeWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4;
- (int64_t)autoFilledTracksTotalSize;
- (int64_t)clearAllRemovedTracks;
- (int64_t)clearPurgeableStorageAmount:(int64_t)a3 withUrgency:(unint64_t)a4;
- (int64_t)clearPurgeableStorageAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeAutoFilledTracks:(BOOL)a5;
- (int64_t)currentContentRevision;
- (int64_t)currentRevision;
- (int64_t)deleteAutoFilledTracksOfAtLeastTotalSize:(int64_t)a3;
- (int64_t)insertStringIntoSortMapNoTransaction:(id)a3;
- (int64_t)jaliscoOnDiskDatabaseRevision;
- (int64_t)preferredVideoQuality;
- (int64_t)purgeableStorageSizeWithUrgency:(unint64_t)a3;
- (int64_t)purgeableStorageSizeWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4;
- (int64_t)sagaCloudAddToPlaylistBehavior;
- (int64_t)sagaCloudFavoriteSongAddToLibraryBehavior;
- (int64_t)sagaDatabaseUserVersion;
- (int64_t)sagaOnDiskDatabaseRevision;
- (int64_t)syncGenerationID;
- (int64_t)syncIdFromMultiverseId:(id)a3;
- (unint64_t)_managedClearPurgeableTracksOfAmount:(unint64_t)a3 urgency:(unint64_t)a4;
- (unint64_t)_managedPurgeableTracksTotalSizeWithUrgency:(unint64_t)a3;
- (unint64_t)_minimumPurgeableStorageForUrgency:(unint64_t)a3;
- (unint64_t)_totalSizeForTracksPredicate:(id)a3;
- (unint64_t)countOfChangedPersistentIdsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5;
- (unint64_t)sectionIndexTitleIndexForSectionIndex:(unint64_t)a3;
- (unint64_t)totalSizeForAllNonCacheTracks;
- (unint64_t)totalSizeForAllNonRedownloadableTracks;
- (unint64_t)totalSizeForAllRedownloadableNonCacheTracks;
- (unint64_t)totalSizeForAllSyncedTracks;
- (unint64_t)totalSizeForArtwork;
- (unint64_t)unknownSectionIndex;
- (void)_autogenerateArtworkForRelativePath:(id)a3 artworkType:(int64_t)a4 mediaType:(unsigned int)a5 completionHandler:(id)a6;
- (void)_closeAndLockCurrentDatabaseConnections;
- (void)_completeAccountChangeWithPath:(id)a3;
- (void)_configureMediaLibraryDatabaseConnection:(id)a3;
- (void)_convertOriginalArtworkToDevicePreferredFormatFromSourceURL:(id)a3 toDestinationURL:(id)a4 completionHandler:(id)a5;
- (void)_createColorAnalysisForRelativePath:(id)a3 artworkType:(int64_t)a4 artworkToken:(id)a5 preferredImageSize:(CGSize)a6 completionHandler:(id)a7;
- (void)_deleteAllArtworkVariantsAtRelativePaths:(id)a3;
- (void)_effectiveSettingsDidChangeNotification:(id)a3;
- (void)_enumeratePurgeableAlbumTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4;
- (void)_enumeratePurgeableStreamedTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4;
- (void)_enumeratePurgeableTracksForUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4 includeCloudAssets:(BOOL)a5 usingBlock:(id)a6;
- (void)_libraryPathDidChangeNotification:(id)a3;
- (void)_logDatabaseAccess;
- (void)_postClientNotificationWithDistributedName:(id)a3 localName:(id)a4;
- (void)_setupNotificationManager;
- (void)_tearDownNotificationManager;
- (void)_teardownMediaLibraryDatabaseConnection:(id)a3;
- (void)_updateSystemPlaylist:(id)a3 withName:(id)a4 usingConnection:(id)a5;
- (void)accessSortKeyBuilder:(id)a3;
- (void)autogenerateSupportedSizesForAllOriginalArtworkWithConnection:(id)a3 completionHandler:(id)a4;
- (void)checkInDatabaseConnection:(id)a3;
- (void)clearCachedCloudLibraryVersionsUsingConnection:(id)a3;
- (void)clearCachedPurchaseHistoryVersionsUsingConnection:(id)a3;
- (void)clearJaliscoAccountID;
- (void)clearJaliscoLastExcludedMediaKinds;
- (void)clearJaliscoLastGeniusUpdateDate;
- (void)clearSagaClientFeaturesVersion;
- (void)clearSagaCloudAccountID;
- (void)clearSagaCloudAddToPlaylistBehavior;
- (void)clearSagaCloudFavoriteSongAddToLibraryBehavior;
- (void)clearSagaCloudLibraryCUID;
- (void)clearSagaCloudLibraryTroveID;
- (void)clearSagaLastGeniusUpdateDate;
- (void)clearSagaLastItemPlayDataUploadDate;
- (void)clearSagaLastPlaylistPlayDataUploadDate;
- (void)clearSagaLastUpdatedClientBuildVersion;
- (void)clearSagaPrefersToMergeWithCloudLibrary;
- (void)connection:(id)a3 didEndDatabaseTransactionAndCommit:(BOOL)a4;
- (void)connectionDidAccessDatabase:(id)a3;
- (void)connectionDidBeginDatabaseTransaction:(id)a3;
- (void)connectionDidClose:(id)a3;
- (void)connectionDidOpenDatabase:(id)a3;
- (void)connectionPool:(id)a3 createdNewConnection:(id)a4;
- (void)connectionWillCloseDatabase:(id)a3;
- (void)connectionWillOpenDatabase:(id)a3;
- (void)databaseConnectionAllowingWrites:(BOOL)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)deletePresignedValidity;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAlbumArtistPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateAlbumPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateArtworkRelativePathsWithConnection:(id)a3 matchingRelativePathContainer:(id)a4 block:(id)a5;
- (void)enumerateArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 usingBlock:(id)a6;
- (void)enumeratePersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5 forMediaTypes:(id)a6 inUsersLibrary:(BOOL)a7 usingBlock:(id)a8;
- (void)enumeratePersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5 usingBlock:(id)a6;
- (void)enumeratePurgeableAlbumTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4;
- (void)generateArtworkForRelativePath:(id)a3 sizes:(id)a4 completionHandler:(id)a5;
- (void)getChangedPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(int64_t)a4 maximumRevisionType:(int)a5 usingBlock:(id)a6;
- (void)importArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7;
- (void)importArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7 usingConnection:(id)a8;
- (void)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8 completion:(id)a9;
- (void)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8 completion:(id)a9;
- (void)migrateExistingArtworkToken:(id)a3 newArtworkToken:(id)a4 newSourceType:(int64_t)a5;
- (void)migratePresignedValidity;
- (void)notifyAssistantContentsDidChange;
- (void)notifyCloudLibraryAvailabilityDidChange;
- (void)notifyContentsDidChange;
- (void)notifyDisplayValuesPropertyDidChange;
- (void)notifyEntitiesAddedOrRemoved;
- (void)notifyInvisiblePropertyDidChange;
- (void)notifyKeepLocalStateDidChange;
- (void)notifyLibraryImportDidFinish;
- (void)notifyNonContentsPropertyDidChange;
- (void)notifySectionsDidChange;
- (void)performAsyncDatabaseWriteTransactionWithBlock:(id)a3 completionBlock:(id)a4;
- (void)performColorAnalysisForArtworkWithConnection:(id)a3 shouldRegenerateColorAnalysis:(BOOL)a4;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)performDatabaseTransactionWithBlock:(id)a3;
- (void)performReadOnlyDatabaseTransactionWithBlock:(id)a3;
- (void)reconnectToDatabase;
- (void)removeArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6;
- (void)removeArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 usingConnection:(id)a7;
- (void)removeCloudSourcesWithAttributes:(id)a3 completionHandler:(id)a4;
- (void)removeItemsWithFamilyAccountID:(unint64_t)a3 purchaserAccountID:(unint64_t)a4 downloaderAccountID:(unint64_t)a5;
- (void)removeOrphanedTracksOnlyInCaches:(BOOL)a3;
- (void)removePlaylistsWithPersistentIDs:(id)a3 fromSource:(int)a4 usingConnection:(id)a5 withCompletionHandler:(id)a6;
- (void)removeSource:(int)a3 usingConnection:(id)a4 withCompletionHandler:(id)a5;
- (void)removeSource:(int)a3 withCompletionHandler:(id)a4;
- (void)removeTombstonesForDeletedItems;
- (void)removeTracksWithPersistentIDs:(id)a3 fromSource:(int)a4 usingConnection:(id)a5 withCompletionHandler:(id)a6;
- (void)removeTracksWithPersistentIDs:(id)a3 fromSource:(int)a4 withCompletionHandler:(id)a5;
- (void)retrieveBestArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 completionHandler:(id)a7;
- (void)sanitizeDatabaseContentsUsingConnection:(id)a3 removeOrphanedAssets:(BOOL *)a4;
- (void)savePlaylists;
- (void)savePlaylistsSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4;
- (void)saveTrackMetadata;
- (void)saveTrackMetadataSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4;
- (void)setAutoUpdatingSharedLibrary:(BOOL)a3;
- (void)setClientIdentity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsHomeSharingLibrary:(BOOL)a3;
- (void)setIsUnitTesting:(BOOL)a3;
- (void)setJaliscoAccountID:(id)a3;
- (void)setJaliscoHasCloudGeniusData:(BOOL)a3;
- (void)setJaliscoIsMusicGeniusUserEnabled:(BOOL)a3;
- (void)setJaliscoLastGeniusUpdateDate:(id)a3;
- (void)setJaliscoLastLibraryUpdateTime:(id)a3;
- (void)setJaliscoLastSupportedMediaKinds:(id)a3;
- (void)setJaliscoNeedsUpdateForTokens:(BOOL)a3;
- (void)setJaliscoOnDiskDatabaseRevision:(int64_t)a3;
- (void)setLibraryContainerFilterPredicates:(id)a3;
- (void)setLibraryEntityFilterPredicates:(id)a3;
- (void)setLibraryPublicContainerFilterPredicates:(id)a3;
- (void)setLibraryPublicEntityFilterPredicates:(id)a3;
- (void)setLibraryUID:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setPreferredVideoQuality:(int64_t)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setSagaAccountID:(id)a3;
- (void)setSagaClientFeaturesVersion:(id)a3;
- (void)setSagaCloudAddToPlaylistBehavior:(int64_t)a3;
- (void)setSagaCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3;
- (void)setSagaCloudLibraryCUID:(id)a3;
- (void)setSagaCloudLibraryTroveID:(id)a3;
- (void)setSagaDatabaseUserVersion:(int64_t)a3;
- (void)setSagaInitiateClientResetSync:(BOOL)a3;
- (void)setSagaLastCloudUpdateClientBuildVersion:(id)a3;
- (void)setSagaLastGeniusUpdateDate:(id)a3;
- (void)setSagaLastItemPlayDataUploadDate:(id)a3;
- (void)setSagaLastKnownActiveLockerAccountDSID:(id)a3;
- (void)setSagaLastLibraryUpdateTime:(id)a3;
- (void)setSagaLastPlaylistPlayDataUploadDate:(id)a3;
- (void)setSagaLastSubscribedContainersUpdateTime:(id)a3;
- (void)setSagaNeedsFullUpdate:(BOOL)a3;
- (void)setSagaOnDiskDatabaseRevision:(int64_t)a3;
- (void)setSagaPrefersToMergeWithCloudLibrary:(BOOL)a3;
- (void)setStorefrontIdentifier:(id)a3;
- (void)setSyncGenerationID:(int64_t)a3;
- (void)setSyncLibraryID:(id)a3;
- (void)sortJaliscoLastSupportedMediaKinds;
- (void)terminateForFailureToPerformDatabasePathChange;
- (void)updateBestArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 usingConnection:(id)a7;
- (void)updateJaliscoExcludedMediaKindsWith:(id)a3 excludingMediaKindsInSet:(BOOL)a4;
- (void)updateOrderingLanguagesForCurrentLanguage;
- (void)updatePurgeabilityForCachedArtworkWithAbsolutePath:(id)a3;
- (void)updatePurgeabilityForOriginalArtworkWithRelativePath:(id)a3;
- (void)updateRootArtworkPurgeability;
- (void)updateTrackIntegrity;
- (void)updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a3;
@end

@implementation ML3MusicLibrary

uint64_t __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)valueForDatabaseProperty:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2480;
  v16 = __Block_byref_object_dispose__2481;
  id v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__ML3MusicLibrary_valueForDatabaseProperty___block_invoke;
    v9[3] = &unk_1E5FB7640;
    id v10 = v4;
    v11 = &v12;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v9];

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)databaseConnectionAllowingWrites:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v4) {
    [(ML3MusicLibrary *)self checkoutWriterConnection];
  }
  else {
  v6 = [(ML3MusicLibrary *)self checkoutReaderConnection];
  }
  v7[2](v7, v6);
  [(ML3MusicLibrary *)self checkInDatabaseConnection:v6];
}

- (id)checkoutReaderConnection
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  v3 = [(ML3MusicLibrary *)self connectionPool];
  BOOL v4 = [v3 readerConnection];

  return v4;
}

- (ML3DatabaseConnectionPool)connectionPool
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2480;
  v15 = __Block_byref_object_dispose__2481;
  id v16 = 0;
  v3 = [(ML3MusicLibrary *)self databasePath];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ML3MusicLibrary_connectionPool__block_invoke;
  block[3] = &unk_1E5FB8208;
  block[4] = self;
  id v9 = v3;
  id v10 = &v11;
  id v5 = v3;
  dispatch_sync(serialQueue, block);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return (ML3DatabaseConnectionPool *)v6;
}

- (NSString)databasePath
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2480;
  id v10 = __Block_byref_object_dispose__2481;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__ML3MusicLibrary_databasePath__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)connectionDidAccessDatabase:(id)a3
{
  id v6 = a3;
  BOOL v4 = [v6 privacyContext];

  if (v4)
  {
    id v5 = [v6 privacyContext];
    [v5 logDatabasePrivacyAccess];
  }
  else
  {
    [(ML3MusicLibrary *)self _logDatabaseAccess];
  }
}

- (void)checkInDatabaseConnection:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2480;
  v29 = __Block_byref_object_dispose__2481;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2480;
  v23 = __Block_byref_object_dispose__2481;
  id v24 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke;
  block[3] = &unk_1E5FB7FF0;
  block[4] = self;
  void block[5] = &v25;
  block[6] = &v19;
  dispatch_sync(serialQueue, block);
  if ([(id)v26[5] ownsConnection:v4])
  {
    [(id)v26[5] checkInConnection:v4];
  }
  else
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v6 = (void *)v20[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke_2;
    v11[3] = &unk_1E5FAFA40;
    id v7 = v4;
    id v12 = v7;
    uint64_t v13 = &v14;
    [v6 enumerateObjectsUsingBlock:v11];
    if (!*((unsigned char *)v15 + 24))
    {
      uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v26[5];
        uint64_t v10 = v20[5];
        *(_DWORD *)buf = 138543874;
        id v32 = v7;
        __int16 v33 = 2114;
        uint64_t v34 = v9;
        __int16 v35 = 2114;
        uint64_t v36 = v10;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Orphaned connection=%{public}@, activePool=%{public}@, poolsPendingClose=%{public}@", buf, 0x20u);
      }
    }
    _Block_object_dispose(&v14, 8);
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

void __44__ML3MusicLibrary_valueForDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v10 count:1];
  id v6 = objc_msgSend(v4, "executeQuery:withParameters:", @"SELECT value FROM _MLDatabaseProperties WHERE key = ?", v5, v10, v11);

  uint64_t v7 = [v6 objectForFirstRowAndColumn];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 stringForColumnIndex:0];
  if ([v6 length]) {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), v6);
  }
  uint64_t v7 = [v8 stringForColumnIndex:1];
  if ([v7 length]) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v7);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = (int)[v8 intForColumnIndex:2];
  *a4 = 1;
}

- (void)connectionPool:(id)a3 createdNewConnection:(id)a4
{
}

void __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 stringForColumnIndex:0];
  [v3 intForColumnIndex:1];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__ML3MusicLibrary_setValue_forDatabaseProperty___block_invoke(void *a1, void *a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  v8[0] = a1[4];
  v8[1] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:v8 count:2];
  char v7 = objc_msgSend(v5, "executeUpdate:withParameters:error:", @"INSERT OR REPLACE INTO _MLDatabaseProperties (value, key) VALUES (?, ?);",
         v6,
         0);

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v7;
}

void __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_622(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 executeQuery:*(void *)(a1 + 32) withParameters:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5FB26C0;
  id v5 = *(id *)(a1 + 48);
  [v3 enumerateRowsWithBlock:v4];
}

void __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 104));
  v2 = *(void **)(a1[4] + 88);
  uint64_t v3 = (id *)(*(void *)(a1[6] + 8) + 40);

  objc_storeStrong(v3, v2);
}

uint64_t __55__ML3MusicLibrary_Jalisco__jaliscoGetSortedMediaKinds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)jaliscoNeedsUpdateForTokens
{
  v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoNeedsUpdateForTokens"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)jaliscoOnDiskDatabaseRevision
{
  v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoDatabaseRevision"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)sagaOnDiskDatabaseRevision
{
  v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudDatabaseRevision"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)libraryEntityFilterPredicatesForEntityClass:(Class)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2480;
  uint64_t v11 = __Block_byref_object_dispose__2481;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ML3MusicLibrary_libraryEntityFilterPredicatesForEntityClass___block_invoke;
  block[3] = &unk_1E5FAFA18;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)mediaRestrictionEnabled
{
  ML3RestrictionInfoInitializeIfNecessary();
  LOBYTE(v3) = byte_1EB551E2B | byte_1EB551E2C
            || qword_1EB551E38 < qword_1EB551E40
            || qword_1EB551E50 < qword_1EB551E58;
  id v4 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MPExplicitContentAllowedBoolean"];
  id v5 = v4;
  if (v4)
  {
    if (v3) {
      LOBYTE(v3) = 1;
    }
    else {
      int v3 = [v4 BOOLValue] ^ 1;
    }
  }
  else if (byte_1EB551E2A)
  {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (id)libraryEntityFilterPredicatesForContainerClass:(Class)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2480;
  uint64_t v11 = __Block_byref_object_dispose__2481;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ML3MusicLibrary_libraryEntityFilterPredicatesForContainerClass___block_invoke;
  block[3] = &unk_1E5FAFA18;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__ML3MusicLibrary_isHomeSharingLibrary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 80))
  {
    int v3 = [*(id *)(a1 + 40) lastPathComponent];
    char v4 = [v3 isEqualToString:@"Library.itdb"];

    *(unsigned char *)(*(void *)(a1 + 32) + 81) = v4;
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(v2 + 81);
}

- (ML3Container)currentDeviceFavoriteSongsPlaylist
{
  int v3 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.distinguished_kind = 71)" equalToValue:MEMORY[0x1E4F1CC38]];
  char v4 = +[ML3Entity anyInLibrary:self predicate:v3 options:3];

  return (ML3Container *)v4;
}

void __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) globalSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke_2;
  block[3] = &unk_1E5FB8298;
  id v4 = *(id *)(a1 + 32);
  dispatch_sync(v2, block);
}

+ (id)musicLibraryForUserAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accountDSID];
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries])
  {
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v8 = [a1 autoupdatingSharedLibrary];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2480;
    uint64_t v19 = __Block_byref_object_dispose__2481;
    id v20 = 0;
    uint64_t v7 = [a1 globalSerialQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__ML3MusicLibrary_musicLibraryForUserAccount___block_invoke;
    v10[3] = &unk_1E5FB7F70;
    uint64_t v13 = &v15;
    id v14 = a1;
    id v11 = v5;
    id v12 = v4;
    dispatch_sync(v7, v10);

    id v8 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

+ (ML3MusicLibrary)autoupdatingSharedLibrary
{
  if (__disableSharedLibrary == 1)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"ML3MusicLibrary.m" lineNumber:338 description:@"sharedLibrary use is disabled. use initWithPath: in this process"];
  }
  int v3 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
  id v4 = (void *)[v3 copy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke;
  v11[3] = &unk_1E5FB2738;
  id v12 = v4;
  id v13 = a1;
  uint64_t v5 = autoupdatingSharedLibrary_onceToken[0];
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(autoupdatingSharedLibrary_onceToken, v11);
  }
  uint64_t v7 = (ML3MusicLibrary *)(id)autoupdatingSharedLibrary___sharedLibrary;

  return v7;
}

+ (NSString)autoupdatingSharedLibraryPath
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2480;
  id v11 = __Block_byref_object_dispose__2481;
  id v12 = 0;
  int v3 = [a1 globalSerialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__ML3MusicLibrary_autoupdatingSharedLibraryPath__block_invoke;
  v6[3] = &unk_1E5FAF980;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken != -1) {
    dispatch_once(&globalSerialQueue_onceToken, &__block_literal_global_2999);
  }
  uint64_t v2 = (void *)globalSerialQueue___globalSerialQueue;

  return (OS_dispatch_queue *)v2;
}

- (ML3MusicLibrary)initWithClientIdentity:(id)a3 path:(id)a4 readOnly:(BOOL)a5 populateUnitTestTablesBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v37.receiver = self;
  v37.super_class = (Class)ML3MusicLibrary;
  id v13 = [(ML3MusicLibrary *)&v37 init];
  id v14 = v13;
  if (v13)
  {
    v13->_readOnly = a5;
    if (v11)
    {
      uint64_t v15 = objc_msgSend(v11, "msv_stringByResolvingRealPath");
      databasePath = v14->_databasePath;
      v14->_databasePath = (NSString *)v15;
    }
    else
    {
      databasePath = v13->_databasePath;
      v13->_databasePath = 0;
    }

    uint64_t v17 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    libraryUIDLock = v14->_libraryUIDLock;
    v14->_libraryUIDLock = v17;

    uint64_t v19 = [ML3DatabasePrivacyContext alloc];
    id v20 = v10;
    if (!v10)
    {
      id v20 = MSVTCCIdentityForCurrentProcess();
    }
    uint64_t v21 = [(ML3DatabasePrivacyContext *)v19 initWithClientIdentity:v20];
    privacyContext = v14->_privacyContext;
    v14->_privacyContext = (ML3DatabasePrivacyContext *)v21;

    if (!v10) {
    uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
    }
    connectionPoolsPendingClose = v14->_connectionPoolsPendingClose;
    v14->_connectionPoolsPendingClose = (NSMutableSet *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.MusicLibrary.atomicity", 0);
    serialQueue = v14->_serialQueue;
    v14->_serialQueue = (OS_dispatch_queue *)v25;

    [(ML3MusicLibrary *)v14 _setupNotificationManager];
    if (v12 && !a5)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      __int16 v33 = __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke;
      uint64_t v34 = &unk_1E5FAF9A8;
      id v36 = v12;
      __int16 v35 = v14;
      [(ML3MusicLibrary *)v35 databaseConnectionAllowingWrites:1 withBlock:&v31];
    }
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v31, v32, v33, v34);
    [v27 addObserver:v14 selector:sel__effectiveSettingsDidChangeNotification_ name:*MEMORY[0x1E4F73EC0] object:0];
    if (!__daemonProcessInfo)
    {
      [v27 addObserver:v14 selector:sel__libraryPathDidChangeNotification_ name:@"MLUserDatabasePathDidChangeNotification" object:0];
      id v28 = (id)[v27 addObserverForName:*MEMORY[0x1E4F1C370] object:0 queue:0 usingBlock:&__block_literal_global_126];
      id v29 = (id)[v27 addObserverForName:@"SBFinishedLanguageChangeStartup" object:0 queue:0 usingBlock:&__block_literal_global_132];
    }
    ML3RestrictionInfoInitializeIfNecessary();
  }
  return v14;
}

- (void)setClientIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&__privacyContextLock);
  uint64_t v5 = [[ML3DatabasePrivacyContext alloc] initWithClientIdentity:v4];

  privacyContext = self->_privacyContext;
  self->_privacyContext = v5;

  os_unfair_lock_unlock(&__privacyContextLock);
}

- (void)_setupNotificationManager
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  int v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - _setupNotificationManager", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(ML3MusicLibrary *)self notificationManager];
}

- (ML3LibraryNotificationManager)notificationManager
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2480;
  id v10 = __Block_byref_object_dispose__2481;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__ML3MusicLibrary_notificationManager__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ML3LibraryNotificationManager *)v3;
}

void __33__ML3MusicLibrary_connectionPool__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 104))
  {
    uint64_t v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v3;
      __int16 v12 = 2114;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating connection pool with path: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    int v5 = -[ML3DatabaseConnectionPool initWithDatabasePath:maxReaders:maxWriters:]([ML3DatabaseConnectionPool alloc], "initWithDatabasePath:maxReaders:maxWriters:", *(void *)(a1 + 40), 10, [*(id *)(a1 + 32) isReadOnly] ^ 1);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 104);
    *(void *)(v6 + 104) = v5;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "setDelegate:");
    uint64_t v8 = [*(id *)(a1 + 40) lastPathComponent];
    char v9 = [v8 isEqualToString:@"Library.itdb"];

    if ((v9 & 1) != 0 || [*(id *)(a1 + 32) isUnitTesting]) {
      [*(id *)(*(void *)(a1 + 32) + 104) setUseDistantWriterConnections:0];
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)_configureMediaLibraryDatabaseConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  if (([v4 isOpen] & 1) == 0) {
    [v4 open];
  }
  if ([v4 isOpen])
  {
    [v4 registerFunctionName:@"ML3SearchStringMatch" argumentCount:2 functionPointer:ML3SearchStringMatch];
    [v4 registerFunctionName:@"ML3SeasonDisplayName" argumentCount:1 functionPointer:ML3SeasonDisplayName];
    [v4 registerFunctionName:@"ML3IsCurrentlyRestrictedMedia" argumentCount:4 functionPointer:ML3IsCurrentlyRestrictedMedia];
    [v4 registerFunctionName:@"ML3TrackIntegrityCompute" argumentCount:0xFFFFFFFFLL functionPointer:ML3TrackIntegrityCompute];
    [v4 registerFunctionName:@"ML3TrackIntegrityVerify" argumentCount:0xFFFFFFFFLL functionPointer:ML3TrackIntegrityVerify];
    [v4 registerFunctionName:@"ML3TrackDigestCompute" argumentCount:0xFFFFFFFFLL functionPointer:ML3TrackDigestCompute];
    [v4 registerFunctionName:@"ML3CompoundSortKey" argumentCount:0xFFFFFFFFLL functionPointer:ML3CompoundSortKey];
    [v4 registerFunctionName:@"ML3SpotlightMatch" argumentCount:0xFFFFFFFFLL functionPointer:ML3SpotlightMatch];
    [v4 registerFunctionName:@"ML3SortString" argumentCount:0xFFFFFFFFLL functionPointer:ML3SortString];
    [v4 registerFunctionName:@"ML3SortStringWithPrefix" argumentCount:0xFFFFFFFFLL functionPointer:ML3SortStringWithPrefix];
    [v4 registerFunctionName:@"ML3StandardizedMediaType" argumentCount:1 block:&__block_literal_global_960];
    +[ML3Track registerBookmarkMetadataIdentifierFunctionOnConnection:v4];
    iPhoneSortKeyBuilderInstallSqlite3_v2((atomic_uint *)-[ML3MusicLibrary sortKeyBuilder](self, "sortKeyBuilder"), (sqlite3 *)[v4 _sqliteHandle]);
  }
}

void __63__ML3MusicLibrary_libraryEntityFilterPredicatesForEntityClass___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) objectForKey:a1[6]];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1[5] + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  uint64_t v7 = (id *)(v6 + 40);
  if (!v8)
  {
    char v9 = *(void **)(a1[4] + 168);
    objc_storeStrong(v7, v9);
  }
}

void __31__ML3MusicLibrary_databasePath__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  if (!v2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
      int v14 = 138543618;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating database path : %{public}@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v6 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
    uint64_t v7 = [v6 copy];
    uint64_t v8 = *(void *)(a1 + 32);
    char v9 = *(void **)(v8 + 112);
    *(void *)(v8 + 112) = v7;

    *(unsigned char *)(*(void *)(a1 + 32) + 97) = 1;
    int v10 = +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy];
    [v10 addAccountChangeObserver:*(void *)(a1 + 32)];

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  }
  uint64_t v11 = [v2 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (NSArray)localizedSectionIndexTitles
{
  if (localizedSectionIndexTitles_once != -1) {
    dispatch_once(&localizedSectionIndexTitles_once, &__block_literal_global_192);
  }
  uint64_t v2 = (void *)localizedSectionIndexTitles_localizedSectionIndexTitles;

  return (NSArray *)v2;
}

void __41__ML3MusicLibrary_currentContentRevision__block_invoke(uint64_t a1, void *a2)
{
  [a2 executeQuery:@"SELECT MAX(revision) FROM entity_revision WHERE revision_type=0;"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ValueForFirstRowAndColumn];
}

void __34__ML3MusicLibrary_currentRevision__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 executeQuery:@"SELECT MAX(revision) FROM entity_revision;"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ValueForFirstRowAndColumn];
}

- (int64_t)currentRevision
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__ML3MusicLibrary_currentRevision__block_invoke;
  v4[3] = &unk_1E5FAF9F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)currentContentRevision
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__ML3MusicLibrary_currentContentRevision__block_invoke;
  v4[3] = &unk_1E5FAF9F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void *__33__ML3MusicLibrary_sortKeyBuilder__block_invoke(void *result)
{
  v1 = result;
  uint64_t v2 = *(void *)(result[4] + 120);
  if (!v2)
  {
    result = iPhoneSortKeyBuilderCreateForCurrentDevice();
    *(void *)(v1[4] + 120) = result;
    uint64_t v2 = *(void *)(v1[4] + 120);
  }
  *(void *)(*(void *)(v1[5] + 8) + 24) = v2;
  return result;
}

void __46__ML3MusicLibrary_localizedSectionIndexTitles__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = ML3LocalizedSectionDictionary();
  uint64_t v2 = [v1 objectForKey:@"LocalizedSectionIndices"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = objc_msgSend(v1, "objectForKey:", @"SectionIndices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = [v2 objectForKey:v8];
        int v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = (void *)v9;
        }
        else {
          uint64_t v11 = v8;
        }
        id v12 = v11;

        [v0 addObject:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v14 = [v13 localizedStringForKey:@"NUMERIC_SECTION_HEADER" value:&stru_1F08D4D70 table:@"MLLocalizable"];
  [v0 addObject:v14];

  uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  __int16 v16 = [v15 localizedStringForKey:@"UNKNOWN_SECTION_HEADER" value:&stru_1F08D4D70 table:@"MLLocalizable"];
  [v0 addObject:v16];

  uint64_t v17 = [v0 copy];
  uint64_t v18 = (void *)localizedSectionIndexTitles_localizedSectionIndexTitles;
  localizedSectionIndexTitles_localizedSectionIndexTitles = v17;
}

- (unint64_t)sectionIndexTitleIndexForSectionIndex:(unint64_t)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2480;
  int v14 = __Block_byref_object_dispose__2481;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke;
  v9[3] = &unk_1E5FAFB08;
  void v9[4] = &v10;
  v9[5] = a3;
  [(ML3MusicLibrary *)self accessSortKeyBuilder:v9];
  if ([(id)v11[5] isEqualToString:@"NUMERIC_SECTION_HEADER"])
  {
    unint64_t v4 = [(ML3MusicLibrary *)self unknownSectionIndex] - 1;
  }
  else if ([(id)v11[5] isEqualToString:@"UNKNOWN_SECTION_HEADER"])
  {
    unint64_t v4 = [(ML3MusicLibrary *)self unknownSectionIndex];
  }
  else
  {
    uint64_t v5 = ML3LocalizedSectionDictionary();
    uint64_t v6 = [v5 objectForKey:@"SectionIndices"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke_2;
    void v8[3] = &unk_1E5FAFB30;
    v8[4] = &v10;
    unint64_t v4 = [v6 indexOfObjectPassingTest:v8];
  }
  _Block_object_dispose(&v10, 8);

  return v4;
}

- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__2480;
  id v15 = __Block_byref_object_dispose__2481;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ML3MusicLibrary_localizedSectionHeaderForSectionIndex___block_invoke;
  v10[3] = &unk_1E5FAFB08;
  void v10[4] = &v11;
  v10[5] = a3;
  [(ML3MusicLibrary *)self accessSortKeyBuilder:v10];
  id v3 = ML3LocalizedSectionDictionary();
  unint64_t v4 = [v3 objectForKey:@"LocalizedSectionHeaders"];

  uint64_t v5 = [v4 objectForKey:v12[5]];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v8 localizedStringForKey:v12[5] value:&stru_1F08D4D70 table:@"MLLocalizable"];
  }
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void)accessSortKeyBuilder:(id)a3
{
  serialQueue = self->_serialQueue;
  uint64_t v5 = (void (**)(id, iPhoneSortKeyBuilder *))a3;
  dispatch_assert_queue_not_V2(serialQueue);
  v5[2](v5, [(ML3MusicLibrary *)self sortKeyBuilder]);
}

- (iPhoneSortKeyBuilder)sortKeyBuilder
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__ML3MusicLibrary_sortKeyBuilder__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (iPhoneSortKeyBuilder *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__ML3MusicLibrary_localizedSectionHeaderForSectionIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = iPhoneSortKeyBuilderGetHeaderForSection(a2, *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

uint64_t __57__ML3MusicLibrary_sectionIndexTitleIndexForSectionIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = iPhoneSortKeyBuilderGetHeaderForSection(a2, *(void *)(a1 + 40));

  return MEMORY[0x1F41817F8]();
}

CFIndex __38__ML3MusicLibrary_unknownSectionIndex__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24) + 48 * *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(v3 - 8);
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(v3 - 24));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4 + result + 1;
  return result;
}

- (unint64_t)unknownSectionIndex
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__ML3MusicLibrary_unknownSectionIndex__block_invoke;
  v4[3] = &unk_1E5FB42F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self accessSortKeyBuilder:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)mediaFolderPath
{
  return +[ML3MusicLibrary mediaFolderPath];
}

void __61__ML3MusicLibrary_setLibraryPublicContainerFilterPredicates___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 192) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(a1 + 40));
    uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 72);
      uint64_t v7 = objc_opt_class();
      [v6 setObject:v5 forKey:v7];
    }
  }
}

void __52__ML3MusicLibrary_setLibraryEntityFilterPredicates___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 168) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(a1 + 40));
    uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 48);
      uint64_t v7 = objc_opt_class();
      [v6 setObject:v5 forKey:v7];
    }
  }
}

void __58__ML3MusicLibrary_setLibraryPublicEntityFilterPredicates___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 184) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 40));
    uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = v2;

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 64);
      uint64_t v7 = objc_opt_class();
      [v6 setObject:v5 forKey:v7];
    }
  }
}

void __55__ML3MusicLibrary_setLibraryContainerFilterPredicates___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 176) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(a1 + 40));
    uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 56);
      uint64_t v7 = objc_opt_class();
      [v6 setObject:v5 forKey:v7];
    }
  }
}

- (NSArray)jaliscoLastExcludedMediaKinds
{
  uint64_t v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoLastExcludedMediaKinds"];
  uint64_t v3 = [v2 componentsSeparatedByString:@","];
  uint64_t v4 = NSStringFromSelector(sel_longLongValue);
  uint64_t v5 = [v3 valueForKey:v4];

  uint64_t v6 = +[ML3MusicLibrary jaliscoGetSortedMediaKinds:v5];

  return (NSArray *)v6;
}

+ (id)jaliscoGetSortedMediaKinds:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_20954];
}

- (void)setLibraryEntityFilterPredicates:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ML3MusicLibrary_setLibraryEntityFilterPredicates___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)setLibraryPublicEntityFilterPredicates:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ML3MusicLibrary_setLibraryPublicEntityFilterPredicates___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)setLibraryContainerFilterPredicates:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ML3MusicLibrary_setLibraryContainerFilterPredicates___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)setLibraryPublicContainerFilterPredicates:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ML3MusicLibrary_setLibraryPublicContainerFilterPredicates___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (BOOL)isUnitTesting
{
  return self->_isUnitTesting;
}

- (BOOL)isHomeSharingLibrary
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v3 = [(ML3MusicLibrary *)self databasePath];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ML3MusicLibrary_isHomeSharingLibrary__block_invoke;
  block[3] = &unk_1E5FB8208;
  void block[4] = self;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v5 = v3;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)serialQueue;
}

- (NSString)originalArtworkDirectory
{
  return (NSString *)[(ML3MusicLibrary *)self pathForResourceFileOrFolder:13];
}

- (id)artworkCacheDirectoryForSize:(CGSize)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fx%.0f", *(void *)&a3.width, *(void *)&a3.height);
  id v5 = NSString;
  id v6 = [(ML3MusicLibrary *)self rootArtworkCacheDirectory];
  v10[0] = v6;
  v10[1] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v5 pathWithComponents:v7];

  return v8;
}

- (NSString)rootArtworkCacheDirectory
{
  return (NSString *)[(ML3MusicLibrary *)self pathForResourceFileOrFolder:14];
}

+ (id)artworkRelativePathFromToken:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(v58, 0, sizeof(v58));
  CC_SHA1_Init((CC_SHA1_CTX *)v58);
  id v4 = v3;
  CC_SHA1_Update((CC_SHA1_CTX *)v58, (const void *)[v4 UTF8String], objc_msgSend(v4, "length"));

  memset(&v59[8], 0, 64);
  *(void *)v59 = 4001;
  CC_SHA1_Final(&v59[8], (CC_SHA1_CTX *)v58);
  v60[0] = *(_OWORD *)v59;
  v60[1] = *(_OWORD *)&v59[16];
  v60[2] = *(_OWORD *)&v59[32];
  v60[3] = *(_OWORD *)&v59[48];
  uint64_t v61 = *(void *)&v59[64];
  if (*(uint64_t *)v59 > 3999)
  {
    if (*(uint64_t *)v59 > 4255)
    {
      if (*(void *)v59 == 4256)
      {
        v46 = (unsigned __int8 *)v60 + 8;
        v47 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v48 = v47;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v50 = *v46++;
          v51 = &v47[i];
          char *v51 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v50 >> 4];
          v51[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v50 & 0xF];
        }
        id v17 = [NSString alloc];
        uint64_t v18 = v48;
        uint64_t v19 = 64;
      }
      else
      {
        if (*(void *)v59 != 4512) {
          goto LABEL_50;
        }
        uint64_t v24 = (unsigned __int8 *)v60 + 8;
        dispatch_queue_t v25 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v26 = v25;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v28 = *v24++;
          id v29 = &v25[j];
          *id v29 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v28 >> 4];
          v29[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v28 & 0xF];
        }
        id v17 = [NSString alloc];
        uint64_t v18 = v26;
        uint64_t v19 = 128;
      }
    }
    else if (*(void *)v59 == 4000)
    {
      id v36 = (unsigned __int8 *)v60 + 8;
      objc_super v37 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v38 = v37;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v40 = *v36++;
        v41 = &v37[k];
        char *v41 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v40 >> 4];
        v41[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v40 & 0xF];
      }
      id v17 = [NSString alloc];
      uint64_t v18 = v38;
      uint64_t v19 = 32;
    }
    else
    {
      if (*(void *)v59 != 4001) {
        goto LABEL_50;
      }
      uint64_t v11 = (unsigned __int8 *)v60 + 8;
      uint64_t v12 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      char v13 = v12;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v15 = *v11++;
        id v16 = &v12[m];
        *id v16 = MSVFastHexStringFromBytes_hexCharacters_27232[(unint64_t)v15 >> 4];
        v16[1] = MSVFastHexStringFromBytes_hexCharacters_27232[v15 & 0xF];
      }
      id v17 = [NSString alloc];
      uint64_t v18 = v13;
      uint64_t v19 = 40;
    }
LABEL_45:
    CFStringRef v35 = (CFStringRef)objc_msgSend(v17, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v18, v19, 4, 1, 4001, *(void *)v58);
    goto LABEL_46;
  }
  if (*(uint64_t *)v59 > 2999)
  {
    if (*(void *)v59 == 3000)
    {
      LODWORD(v62[0]) = bswap32(DWORD2(v60[0]));
      v42 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v43 = 0;
      v44 = v42 + 1;
      do
      {
        unint64_t v45 = *((unsigned __int8 *)v62 + v43);
        *(v44 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v45 >> 4];
        unsigned char *v44 = MSVFastHexStringFromBytes_hexCharacters_27232[v45 & 0xF];
        v44 += 2;
        ++v43;
      }
      while (v43 != 4);
      id v17 = [NSString alloc];
      uint64_t v18 = v42;
      uint64_t v19 = 8;
    }
    else
    {
      if (*(void *)v59 != 3001) {
        goto LABEL_50;
      }
      v62[0] = bswap64(*((unint64_t *)&v60[0] + 1));
      long long v20 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v21 = 0;
      long long v22 = v20 + 1;
      do
      {
        unint64_t v23 = *((unsigned __int8 *)v62 + v21);
        *(v22 - 1) = MSVFastHexStringFromBytes_hexCharacters_27232[v23 >> 4];
        *long long v22 = MSVFastHexStringFromBytes_hexCharacters_27232[v23 & 0xF];
        v22 += 2;
        ++v21;
      }
      while (v21 != 8);
      id v17 = [NSString alloc];
      uint64_t v18 = v20;
      uint64_t v19 = 16;
    }
    goto LABEL_45;
  }
  if (*(void *)v59 == 1000)
  {
    uint64_t v30 = *((void *)&v60[0] + 1);
    uint64_t v31 = (char *)&v63 + 1;
    uint64_t quot = *((void *)&v60[0] + 1);
    do
    {
      lldiv_t v33 = lldiv(quot, 10);
      uint64_t quot = v33.quot;
      if (v33.rem >= 0) {
        LOBYTE(v34) = v33.rem;
      }
      else {
        uint64_t v34 = -v33.rem;
      }
      *(v31 - 2) = v34 + 48;
      uint64_t v10 = (const UInt8 *)(v31 - 2);
      --v31;
    }
    while (v33.quot);
    if (v30 < 0)
    {
      *(v31 - 2) = 45;
      uint64_t v10 = (const UInt8 *)(v31 - 2);
    }
    uint64_t v9 = (char *)((char *)&v63 - (char *)v10);
    goto LABEL_35;
  }
  if (*(void *)v59 == 2000)
  {
    uint64_t v5 = DWORD2(v60[0]);
    id v6 = &v63;
    do
    {
      ldiv_t v7 = ldiv(v5, 10);
      uint64_t v5 = v7.quot;
      if (v7.rem >= 0) {
        LOBYTE(v8) = v7.rem;
      }
      else {
        uint64_t v8 = -v7.rem;
      }
      *((unsigned char *)v6 - 1) = v8 + 48;
      id v6 = (uint64_t *)((char *)v6 - 1);
    }
    while (v7.quot);
    uint64_t v9 = (char *)((char *)&v63 - (char *)v6);
    uint64_t v10 = (const UInt8 *)v6;
LABEL_35:
    CFStringRef v35 = CFStringCreateWithBytes(0, v10, (CFIndex)v9, 0x8000100u, 0);
LABEL_46:
    v52 = (__CFString *)v35;
    goto LABEL_47;
  }
LABEL_50:
  v56 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 4001, *(void *)v58);
  v57 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v56 handleFailureInFunction:v57 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  v52 = &stru_1F08D4D70;
LABEL_47:

  v53 = (void *)[(__CFString *)v52 mutableCopy];
  [v53 insertString:@"/" atIndex:2];
  v54 = (void *)[v53 copy];

  return v54;
}

- (void)enumeratePersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5 forMediaTypes:(id)a6 inUsersLibrary:(BOOL)a7 usingBlock:(id)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a5;
  v46[1] = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a8;
  id v36 = self;
  if (enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock__onceToken != -1) {
    dispatch_once(&enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock__onceToken, &__block_literal_global_546);
  }
  id v16 = objc_msgSend(@"SELECT entity_pid, revision, revision_type, deleted, class FROM entity_revision ", "mutableCopy");
  id v17 = [NSNumber numberWithLongLong:a3];
  v46[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  uint64_t v19 = (void *)[v18 mutableCopy];

  if (v14) {
    [v16 appendString:@" LEFT OUTER JOIN item AS mediaType_item ON (mediaType_item.item_pid = entity_pid) "];
  }
  [v16 appendString:@" WHERE revision > ? "];
  if (v10 <= 2)
  {
    long long v20 = [NSNumber numberWithUnsignedInt:v10];
    [v19 addObject:v20];

    [v16 appendString:@" AND revision_type <= ? "];
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9)
    {
      [v16 appendString:@" AND CASE "];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v21 = [(id)enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses allValues];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v42 != v24) {
              objc_enumerationMutation(v21);
            }
            [v16 appendString:*(void *)(*((void *)&v41 + 1) + 8 * i)];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v23);
      }

      v26 = @"ELSE 0 END";
      goto LABEL_20;
    }
  }
  else
  {
    if (!v9)
    {
      uint64_t v30 = [NSNumber numberWithUnsignedInteger:a4];
      [v19 addObject:v30];

      v26 = @" AND class = ? ";
LABEL_20:
      [v16 appendString:v26];
      goto LABEL_21;
    }
    uint64_t v27 = (void *)enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses;
    unsigned int v28 = [NSNumber numberWithUnsignedInteger:a4];
    id v29 = [v27 objectForKeyedSubscript:v28];
    [v16 appendFormat:@" AND CASE %@ ELSE 0 END", v29];
  }
LABEL_21:
  if (v14 && [v14 count])
  {
    objc_msgSend(v16, "appendFormat:", @" AND (deleted != 0");
    if ([v14 count])
    {
      unint64_t v31 = 0;
      do
      {
        [v16 appendString:@" OR"];
        uint64_t v32 = [v14 objectAtIndex:v31];
        objc_msgSend(v16, "appendFormat:", @" ((media_type & %lu) != 0)", objc_msgSend(v32, "unsignedIntegerValue"));

        ++v31;
      }
      while ([v14 count] > v31);
    }
    [v16 appendString:@""]);
  }
  [v16 appendString:@";"];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_622;
  v37[3] = &unk_1E5FB6460;
  id v38 = v16;
  id v39 = v19;
  id v40 = v15;
  id v33 = v15;
  id v34 = v19;
  id v35 = v16;
  [(ML3MusicLibrary *)v36 databaseConnectionAllowingWrites:0 withBlock:v37];
}

- (id)checkoutWriterConnection
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(ML3MusicLibrary *)self connectionPool];
  id v4 = [v3 writerConnection];

  return v4;
}

void __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 numberWithLongLong:v4];
  v13[0] = v6;
  ldiv_t v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v13[1] = v7;
  uint64_t v8 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v13[2] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  uint64_t v10 = [v5 executeQuery:@"SELECT artwork_token, artwork_source_type FROM artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?", v9 withParameters];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke_2;
  v11[3] = &unk_1E5FB26C0;
  id v12 = *(id *)(a1 + 32);
  [v10 enumerateRowsWithBlock:v11];
}

void __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = a2;
  id v6 = [v3 numberWithLongLong:v4];
  v14[0] = v6;
  ldiv_t v7 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  v14[1] = v7;
  uint64_t v8 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  v14[2] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  uint64_t v10 = [v5 executeQuery:@"SELECT available_artwork_token, fetchable_artwork_token, fetchable_artwork_source_type FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?", v9 withParameters];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5FB4FA8;
  long long v12 = *(_OWORD *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  [v10 enumerateRowsWithBlock:v11];
}

uint64_t __48__ML3MusicLibrary_autoupdatingSharedLibraryPath__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)__sharedLibraryDatabasePath;
  if (!__sharedLibraryDatabasePath)
  {
    uint64_t v3 = [*(id *)(a1 + 40) pathForResourceFileOrFolder:15];
    uint64_t v4 = (void *)__sharedLibraryDatabasePath;
    __sharedLibraryDatabasePath = v3;

    uint64_t v2 = (void *)__sharedLibraryDatabasePath;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [v2 copy];

  return MEMORY[0x1F41817F8]();
}

+ (id)pathForResourceFileOrFolder:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = +[ML3MusicLibraryResourcesManager sharedManager];
  id v5 = [v4 pathForResourceFileOrFolder:v3];

  return v5;
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  databasePath = self->_databasePath;
  uint64_t v5 = __sharedLibraryDatabasePath;
  id v6 = [(ML3MusicLibrary *)self pathForResourceFileOrFolder:15];
  ldiv_t v7 = [v3 stringWithFormat:@"<MusicLibrary: %p> path=%@ _sharedLibraryDatabasePath=%@ computedSharedLibraryDatabasePath=%@ _connectionPool=%p _autoUpdatingSharedLibrary=%d, _isHomeSharingLibrary=%d", self, databasePath, v5, v6, self->_connectionPool, self->_autoUpdatingSharedLibrary, self->_isHomeSharingLibrary];

  return (NSString *)v7;
}

- (id)pathForResourceFileOrFolder:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(ML3MusicLibrary *)self resourcesManager];
  uint64_t v5 = [v4 pathForResourceFileOrFolder:v3];

  return v5;
}

- (ML3MusicLibraryResourcesManager)resourcesManager
{
  uint64_t v6 = 0;
  ldiv_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__2480;
  uint64_t v10 = __Block_byref_object_dispose__2481;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__ML3MusicLibrary_resourcesManager__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ML3MusicLibraryResourcesManager *)v3;
}

+ (id)mediaFolderPath
{
  uint64_t v2 = MLMobileUserHomeDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"Media"];

  return v3;
}

- (void)connectionWillOpenDatabase:(id)a3
{
  id v9 = a3;
  if (MSVDeviceOSIsInternalInstall())
  {
    if (!__daemonProcessInfo)
    {
      uint64_t v4 = +[ML3TerminationCoordinator sharedCoordinator];
      char v5 = [v4 isSigned];

      if ((v5 & 1) == 0)
      {
        uint64_t v6 = +[ML3TerminationCoordinator sharedCoordinator];
        [v6 signForReason:1];
      }
    }
  }
  if ((__disableAutomaticDatabaseValidation & 1) == 0) {
    [(ML3MusicLibrary *)self validateDatabase];
  }
  ldiv_t v7 = [v9 privacyContext];

  if (!v7)
  {
    uint64_t v8 = [(ML3MusicLibrary *)self privacyContext];
    [v9 setPrivacyContext:v8];
  }
}

- (BOOL)validateDatabase
{
  id v3 = +[ML3DatabaseValidationClient sharedClient];
  LOBYTE(self) = [v3 validateDatabaseForLibrary:self];

  return (char)self;
}

- (ML3DatabasePrivacyContext)privacyContext
{
  os_unfair_lock_lock(&__privacyContextLock);
  privacyContext = (ML3DatabasePrivacyContext *)__privacyContextOverride;
  if (!__privacyContextOverride) {
    privacyContext = self->_privacyContext;
  }
  uint64_t v4 = privacyContext;
  os_unfair_lock_unlock(&__privacyContextLock);

  return v4;
}

- (void)connectionDidOpenDatabase:(id)a3
{
  id v4 = a3;
  if (-[ML3MusicLibrary _canConfigureMediaLibraryDatabaseConnection:](self, "_canConfigureMediaLibraryDatabaseConnection:"))
  {
    [(ML3MusicLibrary *)self _configureMediaLibraryDatabaseConnection:v4];
  }
}

- (BOOL)_canConfigureMediaLibraryDatabaseConnection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = ([v4 isReadOnly] & 1) != 0
  }
      || __daemonProcessInfo && ![v4 isReadOnly]
      || [(ML3MusicLibrary *)self isHomeSharingLibrary]
      || [(ML3MusicLibrary *)self isUnitTesting];

  return v5;
}

void __35__ML3MusicLibrary_resourcesManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (!v2)
  {
    uint64_t v3 = +[ML3MusicLibraryResourcesManager sharedManager];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

void __44__ML3MusicLibrary_autoupdatingSharedLibrary__block_invoke_2(uint64_t a1)
{
  v1 = [[ML3MusicLibrary alloc] initWithPath:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)autoupdatingSharedLibrary___sharedLibrary;
  autoupdatingSharedLibrary___sharedLibrary = (uint64_t)v1;

  [(id)autoupdatingSharedLibrary___sharedLibrary setAutoUpdatingSharedLibrary:1];
  id v3 = +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy];
  [v3 addAccountChangeObserver:autoupdatingSharedLibrary___sharedLibrary];
}

- (ML3MusicLibrary)initWithPath:(id)a3 readOnly:(BOOL)a4 populateUnitTestTablesBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = MSVTCCIdentityForCurrentProcess();
  id v11 = [(ML3MusicLibrary *)self initWithClientIdentity:v10 path:v9 readOnly:v5 populateUnitTestTablesBlock:v8];

  return v11;
}

- (ML3MusicLibrary)initWithPath:(id)a3
{
  return [(ML3MusicLibrary *)self initWithPath:a3 readOnly:0 populateUnitTestTablesBlock:0];
}

- (NSString)libraryUID
{
  [(NSLock *)self->_libraryUIDLock lock];
  if (!self->_libraryUID)
  {
    id v3 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"_UUID"];
    libraryUID = self->_libraryUID;
    self->_libraryUID = v3;

    if (!self->_libraryUID)
    {
      BOOL v5 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v6 = [v5 UUIDString];

      if ([(ML3MusicLibrary *)self setValue:v6 forDatabaseProperty:@"_UUID"]) {
        objc_storeStrong((id *)&self->_libraryUID, v6);
      }
    }
  }
  [(NSLock *)self->_libraryUIDLock unlock];
  ldiv_t v7 = self->_libraryUID;

  return v7;
}

- (void)connectionDidBeginDatabaseTransaction:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained library:self didBeginDatabaseTransactionWithConnection:v5];
  }
}

- (void)connection:(id)a3 didEndDatabaseTransactionAndCommit:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained library:self didCommitDatabaseTransactionWithConnection:v7];
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained library:self didRollbackDatabaseTransactionWithConnection:v7];
  }
}

- (NSString)sagaClientFeaturesVersion
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudDatabaseClientFeaturesVersion"];
}

- (void)setJaliscoAccountID:(id)a3
{
}

- (NSString)jaliscoLastSupportedMediaKinds
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoLastSupportedMediaKinds"];
}

- (void)retrieveBestArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 completionHandler:(id)a7
{
  long long v12 = (void (**)(id, uint64_t, uint64_t, uint64_t))a7;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__2480;
  uint64_t v30 = __Block_byref_object_dispose__2481;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2480;
  long long v20 = __Block_byref_object_dispose__2481;
  id v21 = 0;
  if (a5 == 3)
  {
    uint64_t v13 = +[ML3MusicLibrary artworkTokenForChapterWithItemPID:a3 retrievalTime:a6];
    id v14 = (void *)v27[5];
    v27[5] = v13;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __121__ML3MusicLibrary_retrieveBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_completionHandler___block_invoke;
    v15[3] = &unk_1E5FAFF88;
    v15[8] = a4;
    v15[9] = a5;
    v15[4] = &v26;
    v15[5] = &v16;
    v15[6] = &v22;
    v15[7] = a3;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v15];
  }
  v12[2](v12, v27[5], v17[5], v23[3]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void __36__ML3MusicLibrary_globalSerialQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MusicLibrary.global.serial.queue", v2);
  v1 = (void *)globalSerialQueue___globalSerialQueue;
  globalSerialQueue___globalSerialQueue = (uint64_t)v0;
}

void __66__ML3MusicLibrary_libraryEntityFilterPredicatesForContainerClass___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKey:a1[6]];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  if (!v8)
  {
    id v9 = *(void **)(a1[4] + 176);
    objc_storeStrong(v7, v9);
  }
}

void __38__ML3MusicLibrary_notificationManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v2)
  {
    uint64_t v3 = [ML3LibraryNotificationManager alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [(id)objc_opt_class() distributedToLocalNotificationMapping];
    uint64_t v6 = [(ML3LibraryNotificationManager *)v3 initWithLibrary:v4 distributedAndLocalNames:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 136);
    *(void *)(v7 + 136) = v6;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  id v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v9, v2);
}

+ (NSDictionary)distributedToLocalNotificationMapping
{
  if (distributedToLocalNotificationMapping_onceToken != -1) {
    dispatch_once(&distributedToLocalNotificationMapping_onceToken, &__block_literal_global_971);
  }
  uint64_t v2 = (void *)distributedToLocalNotificationMapping__mapping;

  return (NSDictionary *)v2;
}

- (void)setStorefrontIdentifier:(id)a3
{
  if (a3) {
    [(ML3MusicLibrary *)self setValue:a3 forDatabaseProperty:@"MLStorefrontID"];
  }
  else {
    [(ML3MusicLibrary *)self deleteDatabaseProperty:@"MLStorefrontID"];
  }
}

- (void)enumerateArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 usingBlock:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__ML3MusicLibrary_enumerateArtworkTokensForEntityPersistentID_entityType_artworkType_usingBlock___block_invoke;
  v12[3] = &unk_1E5FAFFB0;
  int64_t v15 = a4;
  int64_t v16 = a5;
  id v13 = v10;
  int64_t v14 = a3;
  id v11 = v10;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v12];
}

void __56__ML3MusicLibrary_distributedToLocalNotificationMapping__block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.mobileipod.librarychanged";
  v2[1] = @"com.apple.mobileipod.entitiesaddedorremoved";
  v3[0] = @"ML3MusicLibraryContentsDidChangeNotification";
  v3[1] = @"ML3MusicLibraryEntitiesAddedOrRemovedNotification";
  v2[2] = @"com.apple.mobileipod.noncontentspropertieschanged";
  v2[3] = @"com.apple.mobileipod.invisiblepropertieschanged";
  v3[2] = @"ML3MusicLibraryNonContentsPropertiesDidChangeNotification";
  v3[3] = @"ML3MusicLibraryInvisiblePropertiesDidChangeNotification";
  v2[4] = @"com.apple.mobileipod.displayvalueschanged";
  v2[5] = @"com.apple.mobileipod.syncgenerationchanged";
  v3[4] = @"ML3MusicLibraryDisplayValuesDidChangeNotification";
  v3[5] = @"ML3MusicLibrarySyncGenerationDidChangeNotification";
  v2[6] = @"com.apple.mobileipod.libraryUIDchanged";
  v2[7] = @"com.apple.mobileipod.cloudlibraryavailabilitychanged";
  v3[6] = @"ML3MusicLibraryUIDDidChangeNotification";
  v3[7] = @"ML3MusicLibraryCloudLibraryAvailablityDidChangeNotification";
  v2[8] = @"com.apple.mobileipod.sectionschanged";
  v2[9] = @"com.apple.mobileipod.libraryimportdidfinish";
  v3[8] = @"ML3MusicLibrarySectionsDidChangeNotification";
  v3[9] = @"ML3MusicLibraryImportDidFinishNotification";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:10];
  v1 = (void *)distributedToLocalNotificationMapping__mapping;
  distributedToLocalNotificationMapping__mapping = v0;
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v14 = 0;
    int64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__ML3MusicLibrary_setValue_forDatabaseProperty___block_invoke;
    void v10[3] = &unk_1E5FB57C0;
    id v13 = &v14;
    id v6 = v6;
    id v11 = v6;
    id v12 = v7;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v10];
    BOOL v8 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isArtworkFetchableForPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6
{
  BOOL v6 = 0;
  switch(a4)
  {
    case 0:
      if (a6 == 600) {
        goto LABEL_14;
      }
      if (a6 == 400)
      {
        if ((unint64_t)(a5 - 1) > 1) {
          goto LABEL_20;
        }
        id v7 = +[ML3Entity newWithPersistentID:a3 inLibrary:self];
        if ([v7 existsInLibrary])
        {
          id v9 = @"item_store.purchase_history_id";
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (a6 != 200 || (unint64_t)(a5 - 1) > 1) {
        goto LABEL_20;
      }
      id v7 = +[ML3Entity newWithPersistentID:a3 inLibrary:self];
      if (![v7 existsInLibrary]) {
        goto LABEL_21;
      }
      BOOL v8 = [v7 valueForProperty:@"item_store.store_saga_id"];
      BOOL v6 = [v8 longLongValue] > 0;
      goto LABEL_19;
    case 1:
      if (a6 == 600)
      {
LABEL_14:
        BOOL v6 = 1;
      }
      else if (a6 == 200 && a5 == 5)
      {
        id v7 = +[ML3Entity newWithPersistentID:a3 inLibrary:self];
        if ([v7 existsInLibrary])
        {
          id v9 = @"store_cloud_id";
LABEL_18:
          BOOL v8 = [v7 valueForProperty:v9];
          BOOL v6 = [v8 unsignedIntegerValue] != 0;
LABEL_19:
        }
        else
        {
LABEL_21:
          BOOL v6 = 0;
        }
      }
      else
      {
LABEL_20:
        BOOL v6 = 0;
      }
      break;
    case 2:
    case 7:
      BOOL v6 = a6 == 500;
      break;
    default:
      return v6;
  }
  return v6;
}

void __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0910DE0;
  v2[1] = &unk_1F0910DF8;
  v3[0] = @"WHEN class = 0 THEN deleted != 0 OR EXISTS (SELECT 1 FROM item WHERE item.in_my_library AND item.item_pid = entity_pid) ";
  v3[1] = @"WHEN class = 1 THEN deleted != 0 OR EXISTS (SELECT 1 FROM container WHERE container_pid = entity_pid) ";
  v2[2] = &unk_1F0910E10;
  v2[3] = &unk_1F0910E28;
  v3[2] = @"WHEN class = 2 THEN deleted != 0 OR EXISTS (SELECT 1 FROM item_artist JOIN item USING(item_artist_pid) WHERE item.in_my_library AND item_artist_pid = entity_pid LIMIT 1) ";
  v3[3] = @"WHEN class = 3 THEN deleted != 0 OR EXISTS (SELECT 1 FROM genre JOIN item USING(genre_id) WHERE item.in_my_library AND genre_id = entity_pid LIMIT 1) ";
  v2[4] = &unk_1F0910E40;
  v2[5] = &unk_1F0910E58;
  v3[4] = @"WHEN class = 4 THEN deleted != 0 OR EXISTS (SELECT 1 FROM album JOIN item USING(album_pid) WHERE item.in_my_library AND album_pid = entity_pid LIMIT 1) ";
  v3[5] = @"WHEN class = 5 THEN deleted != 0 OR EXISTS (SELECT 1 FROM composer JOIN item USING(composer_pid) WHERE item.in_my_library AND composer_pid = entity_pid LIMIT 1) ";
  v2[6] = &unk_1F0910E70;
  v3[6] = @"WHEN class = 7 THEN deleted != 0 OR EXISTS (SELECT 1 FROM album_artist JOIN item USING(album_artist_pid) WHERE item.in_my_library AND album_artist_pid = entity_pid LIMIT 1) ";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses;
  enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock____existsInLibraryClauses = v0;
}

- (int64_t)purgeableStorageSizeWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(ML3MusicLibrary *)self currentDatabaseVersion] == 2220020)
  {
    int64_t v7 = [(ML3MusicLibrary *)self _databaseFileFreeSpace];
    if ([(ML3MusicLibrary *)self _shouldPurgeManagedAlbumsTracksForUrgency:a3])
    {
      int64_t v8 = [(ML3MusicLibrary *)self _managedPurgeableTracksTotalSizeWithUrgency:a3];
    }
    else
    {
      int64_t v8 = [(ML3MusicLibrary *)self _purgeableTracksTotalSizeWithUrgency:a3 includeAutoFilledTracks:v4];
    }
    int64_t v10 = v8 + v7;
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 67109376;
      *(_DWORD *)uint64_t v14 = [(ML3MusicLibrary *)self currentDatabaseVersion];
      *(_WORD *)&void v14[4] = 1024;
      *(_DWORD *)&v14[6] = 2220020;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "Skipping purgeable calculation for tracks because DB is not present or invalid (db version=%d, current version=%d)", (uint8_t *)&v13, 0xEu);
    }

    int64_t v10 = 0;
  }
  id v11 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218496;
    *(void *)uint64_t v14 = v10;
    *(_WORD *)&v14[8] = 1024;
    int v15 = a3;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Purgeable size of %lld bytes for urgency %d, includeAutoFilledTracks=%d", (uint8_t *)&v13, 0x18u);
  }

  return v10;
}

- (int64_t)purgeableStorageSizeWithUrgency:(unint64_t)a3
{
  BOOL v5 = +[ML3MusicLibrary autoFilledTracksArePurgeable];

  return [(ML3MusicLibrary *)self purgeableStorageSizeWithUrgency:a3 includeAutoFilledTracks:v5];
}

- (int)currentDatabaseVersion
{
  uint64_t v2 = [(ML3MusicLibrary *)self databasePath];
  uint64_t v3 = [[ML3DatabaseConnection alloc] initWithDatabasePath:v2];
  if ([(ML3DatabaseConnection *)v3 databasePathExists])
  {
    BOOL v4 = [(ML3DatabaseConnection *)v3 executeQuery:@"PRAGMA user_version"];
    int v5 = [v4 int64ValueForFirstRowAndColumn];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (BOOL)autoFilledTracksArePurgeable
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"_ML3AutofilledTracksArePurgeableKey", @"com.apple.medialibrary", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryPublicContainerFilterPredicates, 0);
  objc_storeStrong((id *)&self->_libraryPublicEntityFilterPredicates, 0);
  objc_storeStrong((id *)&self->_libraryContainerFilterPredicates, 0);
  objc_storeStrong((id *)&self->_libraryEntityFilterPredicates, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_resourcesManager, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_connectionPool, 0);
  objc_storeStrong((id *)&self->_connectionPoolsPendingClose, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryPublicContainerFilterPredicatesByContainerClass, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryPublicEntityFilterPredicatesByEntityClass, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryContainerFilterPredicatesByContainerClass, 0);
  objc_storeStrong((id *)&self->_optimizedLibraryEntityFilterPredicatesByEntityClass, 0);
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_accountCacheDatabase, 0);
  objc_storeStrong((id *)&self->_syncLibraryUID, 0);
  objc_storeStrong((id *)&self->_libraryUIDLock, 0);

  objc_storeStrong((id *)&self->_libraryUID, 0);
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void)setAutoUpdatingSharedLibrary:(BOOL)a3
{
  self->_autoUpdatingSharedLibrary = a3;
}

- (BOOL)isAutoUpdatingSharedLibrary
{
  return self->_autoUpdatingSharedLibrary;
}

- (NSArray)libraryPublicContainerFilterPredicates
{
  return self->_libraryPublicContainerFilterPredicates;
}

- (NSArray)libraryPublicEntityFilterPredicates
{
  return self->_libraryPublicEntityFilterPredicates;
}

- (NSArray)libraryContainerFilterPredicates
{
  return self->_libraryContainerFilterPredicates;
}

- (NSArray)libraryEntityFilterPredicates
{
  return self->_libraryEntityFilterPredicates;
}

- (void)setIsUnitTesting:(BOOL)a3
{
  self->_isUnitTesting = a3;
}

- (void)setDelegate:(id)a3
{
}

- (ML3MusicLibraryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ML3MusicLibraryDelegate *)WeakRetained;
}

- (NSString)accountDSID
{
  return self->_accountDSID;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setNotificationManager:(id)a3
{
}

- (CGSize)_sizeForColorAnalysisForMediaType:(unsigned int)a3 artworkType:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v6 = +[ML3ArtworkConfiguration systemConfiguration];
  int64_t v7 = [v6 sizesToAutogenerateForMediaType:v5 artworkType:a4];

  uint64_t v14 = 0;
  int v15 = (float *)&v14;
  uint64_t v16 = 0x2020000000;
  int v17 = -8388609;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__ML3MusicLibrary__sizeForColorAnalysisForMediaType_artworkType___block_invoke;
  v13[3] = &unk_1E5FB0138;
  void v13[4] = &v14;
  [v7 enumerateObjectsUsingBlock:v13];
  int64_t v8 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = v15[6];
    *(_DWORD *)buf = 134217984;
    double v19 = v9;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Size to use for color analysis: %f", buf, 0xCu);
  }

  float v10 = v15[6];
  _Block_object_dispose(&v14, 8);

  double v11 = v10;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

float __65__ML3MusicLibrary__sizeForColorAnalysisForMediaType_artworkType___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = 0.0;
  v5[1] = 0.0;
  [a2 getValue:v5];
  float result = *(float *)v5;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v5[0] > *(float *)(v4 + 24))
  {
    float result = v5[0];
    *(float *)(v4 + 24) = result;
  }
  return result;
}

- (void)_postClientNotificationWithDistributedName:(id)a3 localName:(id)a4
{
  serialQueue = self->_serialQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_not_V2(serialQueue);
  double v9 = [(ML3MusicLibrary *)self notificationManager];
  [v9 enqueueLocalNotificationNamed:v7];

  id v10 = [(ML3MusicLibrary *)self notificationManager];
  [v10 enqueueDistributedNotificationNamed:v8];
}

- (void)_tearDownNotificationManager
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    double v9 = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - _tearDownNotificationManager", buf, 0xCu);
  }

  uint64_t v4 = [(id)objc_opt_class() distributedToLocalNotificationMapping];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke;
  v7[3] = &unk_1E5FB7A00;
  v7[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke_2;
  v6[3] = &unk_1E5FB8298;
  v6[4] = self;
  dispatch_sync(serialQueue, v6);
}

void __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 notificationManager];
  [v4 removeObserverWithDistributedName:v3];
}

void __47__ML3MusicLibrary__tearDownNotificationManager__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = 0;
}

- (void)_closeAndLockCurrentDatabaseConnections
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _closeAndLockCurrentDatabaseConnections", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__2480;
  uint64_t v18 = __Block_byref_object_dispose__2481;
  id v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke;
  block[3] = &unk_1E5FB8360;
  void block[4] = self;
  void block[5] = &buf;
  dispatch_sync(serialQueue, block);
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ML3MusicLibraryWillInvalidateDatabaseConnectionNotification" object:self];

  [*(id *)(*((void *)&buf + 1) + 40) lockAndCloseAllConnectionsForTermination];
  BOOL v6 = self->_serialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke_2;
  v9[3] = &unk_1E5FB8360;
  void v9[4] = self;
  v9[5] = &buf;
  dispatch_sync(v6, v9);
  id v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)double v11 = 138543618;
    double v12 = self;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - connection pool %{public}@ locked and closed", v11, 0x16u);
  }

  _Block_object_dispose(&buf, 8);
}

void __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "addObject:");
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;
}

void __58__ML3MusicLibrary__closeAndLockCurrentDatabaseConnections__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    if ([v2 isClosedWithNoActiveOrBusyConnections])
    {
      [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDelegate:0];
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
      id v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = 0;
    }
    else
    {
      uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v8 = 138543618;
        uint64_t v9 = v6;
        __int16 v10 = 2114;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - connection pool %{public}@ has pending or active connections", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (BOOL)_shouldProcessAccountChanges
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  double v5[2] = __47__ML3MusicLibrary__shouldProcessAccountChanges__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__ML3MusicLibrary__shouldProcessAccountChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[81]) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = [v2 isAutoUpdatingSharedLibrary];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_completeAccountChangeWithPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v16 = self;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - _completeAccountChangeWithPath - New database path: %{public}@", buf, 0x16u);
  }

  +[ML3MusicLibrary setAutoupdatingSharedLibraryPath:v4];
  serialQueue = self->_serialQueue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __50__ML3MusicLibrary__completeAccountChangeWithPath___block_invoke;
  uint64_t v12 = &unk_1E5FB83D0;
  __int16 v13 = self;
  id v14 = v4;
  id v7 = v4;
  dispatch_sync(serialQueue, &v9);
  [(NSLock *)self->_libraryUIDLock lock];
  libraryUID = self->_libraryUID;
  self->_libraryUID = 0;

  [(NSLock *)self->_libraryUIDLock unlock];
}

void __50__ML3MusicLibrary__completeAccountChangeWithPath___block_invoke(uint64_t a1)
{
}

- (BOOL)_prepareForAccountChange:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - _prepareForAccountChange", buf, 0xCu);
  }

  [(ML3MusicLibrary *)self _closeAndLockCurrentDatabaseConnections];
  [(ML3MusicLibrary *)self _tearDownNotificationManager];
  return 1;
}

- (void)terminateForFailureToPerformDatabasePathChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(ML3MusicLibrary *)self _shouldProcessAccountChanges])
  {
    id v4 = self;
    char v3 = _ML3LogCategoryMultiUser();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ - terminateForFailureToPerformDatabasePathChange [unresponsive process]", buf, 0xCu);
    }

    exit(0);
  }
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, BOOL, void))a3;
  uint64_t v6 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v11 = self;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - emergencyDisconnectWithCompletion:", buf, 0xCu);
  }

  BOOL v7 = [(ML3MusicLibrary *)self _shouldProcessAccountChanges];
  if (v7)
  {
    if (![(ML3MusicLibrary *)self _prepareForAccountChange:0])
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ML3MusicLibrary.m", 4367, @"ML3MusicLibrary %p - Unable to prepare for account changes during emergency disconnect", self);
    }
    [(ML3MusicLibrary *)self _completeAccountChangeWithPath:0];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v11 = self;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - emergencyDisconnectWithCompletion: - No action to take [returning early]", buf, 0xCu);
    }
  }
  v5[2](v5, v7, 0);
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, id))a4;
  BOOL v9 = [(ML3MusicLibrary *)self _shouldProcessAccountChanges];
  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 138543362;
      __int16 v17 = self;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - Process started", buf, 0xCu);
    }

    id v15 = 0;
    BOOL v12 = [(ML3MusicLibrary *)self _prepareForAccountChange:&v15];
    id v13 = v15;
    if (!v12)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"ML3MusicLibrary.m", 4353, @"ML3MusicLibrary %p - Database path change failure [unable to close connection pools] - error=%@", self, v13 object file lineNumber description];
    }
    [(ML3MusicLibrary *)self _completeAccountChangeWithPath:v7];
    v8[2](v8, 1, v13);

    uint64_t v8 = (void (**)(id, uint64_t, id))v13;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 138543362;
      __int16 v17 = self;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - No action to take [returning early]", buf, 0xCu);
    }

    v8[2](v8, 0, 0);
  }
}

- (void)_libraryPathDidChangeNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (__daemonProcessInfo)
  {
    id v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v8 = self;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - Received MLUserDatabasePathDidChangeNotification in medialibraryd which is unexpected", buf, 0xCu);
    }
  }
  else
  {
    [(ML3MusicLibrary *)self _setupNotificationManager];
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"ML3MusicLibraryPathDidChangeNotification" object:self];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"ML3MusicLibraryContentsDidChangeNotification" object:self];
  }
}

- (void)_effectiveSettingsDidChangeNotification:(id)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  pthread_mutex_lock(&sRestrictionSettingsLock);
  sRestrictionSettingsInfo = 0;
  pthread_mutex_unlock(&sRestrictionSettingsLock);
  id v4 = [(ML3MusicLibrary *)self notificationManager];
  [v4 enqueueLocalNotificationNamed:@"ML3MusicLibraryContentsDidChangeNotification"];
}

- (BOOL)_clearAllRowsFromTables:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2480;
  uint64_t v23 = __Block_byref_object_dispose__2481;
  id v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43__ML3MusicLibrary__clearAllRowsFromTables___block_invoke;
  v15[3] = &unk_1E5FB5B60;
  id v5 = v4;
  id v16 = v5;
  __int16 v17 = &v25;
  uint64_t v18 = &v19;
  [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v15];
  int v6 = *((unsigned __int8 *)v26 + 24);
  id v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 138543362;
      id v30 = v5;
      uint64_t v9 = "Succesfully emptied tables in media library database: %{public}@";
      uint64_t v10 = v7;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else if (v8)
  {
    uint64_t v12 = v20[5];
    *(_DWORD *)long long buf = 138543618;
    id v30 = v5;
    __int16 v31 = 2114;
    uint64_t v32 = v12;
    uint64_t v9 = "Failed to empty tables: %{public}@ with error: %{public}@";
    uint64_t v10 = v7;
    uint32_t v11 = 22;
    goto LABEL_6;
  }

  BOOL v13 = *((unsigned char *)v26 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

uint64_t __43__ML3MusicLibrary__clearAllRowsFromTables___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = [NSString stringWithFormat:@"DELETE FROM %@", *(void *)(*((void *)&v17 + 1) + 8 * v8)];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      obuint64_t j = *(id *)(v10 + 40);
      char v11 = [v3 executeUpdate:v9 withParameters:0 error:&obj];
      objc_storeStrong((id *)(v10 + 40), obj);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      char v13 = *(unsigned char *)(v12 + 24) ? v11 : 0;
      *(unsigned char *)(v12 + 24) = v13;

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return v14;
}

- (void)_teardownMediaLibraryDatabaseConnection:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(serialQueue);
  uint64_t v6 = (sqlite3 *)[v5 _sqliteHandle];

  if (v6)
  {
    int v7 = (int)[(ML3MusicLibrary *)self sortKeyBuilder];
    iPhoneSortKeyBuilderUninstallSqlite3(v7, v6);
  }
}

void __60__ML3MusicLibrary__configureMediaLibraryDatabaseConnection___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  uint64_t v5 = sqlite3_value_int(*a4);
  int v6 = MLMediaTypeByStandardizingMediaType(v5);

  sqlite3_result_int(a2, v6);
}

- (id)_newGeniusDBConnectionAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v3]) {
    uint64_t v5 = [[ML3DatabaseConnection alloc] initWithDatabasePath:v3];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_createColorAnalysisForRelativePath:(id)a3 artworkType:(int64_t)a4 artworkToken:(id)a5 preferredImageSize:(CGSize)a6 completionHandler:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (v13)
  {
    id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F77930]), "initWithSourceURL:preferredImageSize:", v16, width, height);
    long long v18 = [MEMORY[0x1E4F77928] sharedService];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __117__ML3MusicLibrary__createColorAnalysisForRelativePath_artworkType_artworkToken_preferredImageSize_completionHandler___block_invoke;
    v20[3] = &unk_1E5FB00F0;
    id v21 = v13;
    int64_t v25 = a4;
    id v22 = v14;
    uint64_t v23 = self;
    id v24 = v15;
    [v18 sendRequest:v17 completion:v20];
  }
  else
  {
    long long v19 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v27 = v14;
      _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{public}@. Relative path is nil.", buf, 0xCu);
    }

    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "ml_errorWithCode:", 6);
    if (v15) {
      (*((void (**)(id, void *))v15 + 2))(v15, v16);
    }
  }
}

void __117__ML3MusicLibrary__createColorAnalysisForRelativePath_artworkType_artworkToken_preferredImageSize_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  uint64_t v8 = (ML3ArtworkColorAnalysis *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1B022D000, &v8->super, OS_LOG_TYPE_ERROR, "Failed to create color analysis for relative path: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1B022D000, &v8->super, OS_LOG_TYPE_INFO, "Created color analysis for relative path: %{public}@", buf, 0xCu);
    }

    uint64_t v8 = [[ML3ArtworkColorAnalysis alloc] initWithColorAnalysis:v5];
    char v11 = [[ML3Artwork alloc] initWithToken:a1[5] artworkType:a1[8] musicLibrary:a1[6]];
    long long v19 = @"ColorAnalysis";
    uint64_t v12 = [&unk_1F0910DF8 stringValue];
    id v13 = [(ML3ArtworkColorAnalysis *)v8 dictRepresentation];
    long long v18 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    long long v20 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    [(ML3Artwork *)v11 setInterestDictionary:v15];
  }

  uint64_t v16 = a1[7];
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v6);
  }
}

- (void)_autogenerateArtworkForRelativePath:(id)a3 artworkType:(int64_t)a4 mediaType:(unsigned int)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v13 = a3;
  id v10 = a6;
  char v11 = +[ML3ArtworkConfiguration systemConfiguration];
  uint64_t v12 = [v11 sizesToAutogenerateForMediaType:v7 artworkType:a4];

  if ([v12 count])
  {
    [(ML3MusicLibrary *)self generateArtworkForRelativePath:v13 sizes:v12 completionHandler:v10];
  }
  else if (v10)
  {
    (*((void (**)(id, void, void, double, double))v10 + 2))(v10, 0, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
}

- (void)_convertOriginalArtworkToDevicePreferredFormatFromSourceURL:(id)a3 toDestinationURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F77938];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)[[v7 alloc] initWithSourceURL:v10 destinationURL:v9 destinationFormat:0];

  [v12 setDestinationCompressionQuality:0.9];
  char v11 = [MEMORY[0x1E4F77928] sharedService];
  [v11 sendRequest:v12 completionHandler:v8];
}

- (BOOL)_removeInvalidAvailableArtworkTokensUsingConnection:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = (void *)MEMORY[0x1B3E93C70]();
  uint64_t v7 = [v4 executeQuery:@"SELECT entity_pid, entity_type, best_artwork_token.artwork_type, available_artwork_token FROM best_artwork_token LEFT OUTER JOIN artwork ON available_artwork_token = artwork_token WHERE available_artwork_token != '' AND artwork_token IS NULL"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __71__ML3MusicLibrary__removeInvalidAvailableArtworkTokensUsingConnection___block_invoke;
  v36[3] = &unk_1E5FB83F8;
  id v8 = v5;
  id v37 = v8;
  [v7 enumerateRowsWithBlock:v36];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v8;
  uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v30)
  {
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        context = (void *)MEMORY[0x1B3E93C70]();
        id v12 = os_log_create("com.apple.amp.medialibrary", "Library");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [v11 objectAtIndexedSubscript:0];
          uint64_t v27 = [v29 longLongValue];
          uint64_t v28 = [v11 objectAtIndexedSubscript:1];
          uint64_t v13 = v9;
          int v14 = [v28 intValue];
          id v15 = [v11 objectAtIndexedSubscript:2];
          int v16 = [v15 intValue];
          [v11 objectAtIndexedSubscript:3];
          uint64_t v17 = self;
          long long v19 = v18 = v4;
          *(_DWORD *)long long buf = 134218754;
          uint64_t v39 = v27;
          __int16 v40 = 1024;
          int v41 = v14;
          uint64_t v9 = v13;
          __int16 v42 = 1024;
          int v43 = v16;
          __int16 v44 = 2114;
          unint64_t v45 = v19;
          _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Updating best tokens for entity_pid = %lld entity_type = %d artwork_type = %d with invalid available token %{public}@", buf, 0x22u);

          id v4 = v18;
          self = v17;
        }
        long long v20 = [v11 objectAtIndexedSubscript:0];
        uint64_t v21 = [v20 longLongValue];
        uint64_t v22 = [v11 objectAtIndexedSubscript:1];
        uint64_t v23 = (int)[v22 intValue];
        id v24 = [v11 objectAtIndexedSubscript:2];
        -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:](self, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:preserveExistingAvailableToken:usingConnection:", v21, v23, (int)[v24 intValue], 0, v4, 0.0);
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v30);
  }

  return 1;
}

void __71__ML3MusicLibrary__removeInvalidAvailableArtworkTokensUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  v9[0] = v4;
  id v5 = [v3 objectAtIndexedSubscript:1];
  v9[1] = v5;
  id v6 = [v3 objectAtIndexedSubscript:2];
  v9[2] = v6;
  uint64_t v7 = [v3 objectAtIndexedSubscript:3];

  v9[3] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  [v2 addObject:v8];
}

- (BOOL)_removeOrphanedArtworkAssetsUsingConnection:(id)a3
{
  v132[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = (void *)MEMORY[0x1B3E93C70]();
  v92 = v4;
  uint64_t v7 = [v4 executeQuery:@"SELECT distinct(relative_path) FROM artwork"];
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke;
  v119[3] = &unk_1E5FB83F8;
  id v8 = v5;
  id v120 = v8;
  [v7 enumerateRowsWithBlock:v119];

  v85 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = (void *)MEMORY[0x1E4F1CB10];
  v91 = self;
  char v11 = [(ML3MusicLibrary *)self originalArtworkDirectory];
  uint64_t v12 = [v10 fileURLWithPath:v11 isDirectory:1];

  uint64_t v13 = *MEMORY[0x1E4F1C628];
  v132[0] = *MEMORY[0x1E4F1C628];
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:1];
  v82 = (void *)v12;
  v83 = v9;
  id v15 = [v9 enumeratorAtURL:v12 includingPropertiesForKeys:v14 options:4 errorHandler:0];

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v116;
    uint64_t v86 = *(void *)v116;
    do
    {
      uint64_t v19 = 0;
      id v87 = (id)v17;
      do
      {
        if (*(void *)v116 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v115 + 1) + 8 * v19);
        uint64_t v21 = (void *)MEMORY[0x1B3E93C70]();
        id v114 = 0;
        [v20 getResourceValue:&v114 forKey:v13 error:0];
        id v22 = v114;
        if (([v22 BOOLValue] & 1) == 0)
        {
          uint64_t v23 = [v20 pathComponents];
          uint64_t v24 = [v23 count];
          uint64_t v25 = v24 - 1;
          uint64_t v26 = NSString;
          [v23 objectAtIndexedSubscript:v24 - 2];
          v28 = uint64_t v27 = v8;
          v130[0] = v28;
          id v29 = [v23 objectAtIndexedSubscript:v25];
          v130[1] = v29;
          uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
          __int16 v31 = [v26 pathWithComponents:v30];

          id v8 = v27;
          if ([v27 containsObject:v31])
          {
            [v27 removeObject:v31];
          }
          else
          {
            [v85 addObject:v31];
            long long v32 = os_log_create("com.apple.amp.medialibrary", "Library");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543362;
              uint64_t v129 = (uint64_t)v31;
              _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_DEFAULT, "Found orphaned artwork on disk with relative path: %{public}@", buf, 0xCu);
            }
          }
          uint64_t v18 = v86;

          uint64_t v17 = (uint64_t)v87;
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
    }
    while (v17);
  }

  if ([v8 count] || objc_msgSend(v85, "count"))
  {
    long long v33 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v8 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v129 = v34;
      _os_log_impl(&dword_1B022D000, v33, OS_LOG_TYPE_DEFAULT, "Found %lu artwork metadata without an asset on disk", buf, 0xCu);
    }

    long long v35 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [v85 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v129 = v36;
      _os_log_impl(&dword_1B022D000, v35, OS_LOG_TYPE_DEFAULT, "Found %lu artwork asset without metadata in database", buf, 0xCu);
    }

    id v37 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v84 = v8;
    id v88 = v8;
    uint64_t v38 = [v88 countByEnumeratingWithState:&v110 objects:v127 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v111 != v40) {
            objc_enumerationMutation(v88);
          }
          uint64_t v42 = *(void *)(*((void *)&v110 + 1) + 8 * i);
          int v43 = (void *)MEMORY[0x1B3E93C70]();
          uint64_t v126 = v42;
          __int16 v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
          unint64_t v45 = [v92 executeQuery:@"SELECT artwork_token FROM artwork WHERE relative_path = ?" withParameters:v44];

          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          v108[2] = __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_943;
          v108[3] = &unk_1E5FB83F8;
          id v109 = v37;
          [v45 enumerateRowsWithBlock:v108];
        }
        uint64_t v39 = [v88 countByEnumeratingWithState:&v110 objects:v127 count:16];
      }
      while (v39);
    }

    v46 = [MEMORY[0x1E4F1CA48] array];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v47 = v37;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v104 objects:v125 count:16];
    id v89 = v47;
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v105;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v105 != v50) {
            objc_enumerationMutation(v89);
          }
          uint64_t v52 = *(void *)(*((void *)&v104 + 1) + 8 * j);
          v53 = (void *)MEMORY[0x1B3E93C70]();
          uint64_t v124 = v52;
          v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
          v55 = [v92 executeQuery:@"SELECT entity_pid, entity_type, artwork_type FROM best_artwork_token WHERE available_artwork_token = ?", v54 withParameters];

          v102[0] = MEMORY[0x1E4F143A8];
          v102[1] = 3221225472;
          v102[2] = __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_2;
          v102[3] = &unk_1E5FB83F8;
          id v103 = v46;
          [v55 enumerateRowsWithBlock:v102];
        }
        id v47 = v89;
        uint64_t v49 = [v89 countByEnumeratingWithState:&v104 objects:v125 count:16];
      }
      while (v49);
    }

    if ([v47 count])
    {
      v81 = v46;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v56 = v47;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v98 objects:v123 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v99;
        do
        {
          for (uint64_t k = 0; k != v58; ++k)
          {
            if (*(void *)v99 != v59) {
              objc_enumerationMutation(v56);
            }
            uint64_t v61 = *(void *)(*((void *)&v98 + 1) + 8 * k);
            v62 = (void *)MEMORY[0x1B3E93C70]();
            uint64_t v122 = v61;
            uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
            id v97 = 0;
            LOBYTE(v61) = [v92 executeUpdate:@"DELETE FROM artwork WHERE artwork_token = ?" withParameters:v63 error:&v97];
            id v64 = v97;

            if ((v61 & 1) == 0)
            {
              v65 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138543362;
                uint64_t v129 = (uint64_t)v64;
                _os_log_impl(&dword_1B022D000, v65, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table with error: %{public}@", buf, 0xCu);
              }
            }
          }
          uint64_t v58 = [v56 countByEnumeratingWithState:&v98 objects:v123 count:16];
        }
        while (v58);
      }

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v66 = v81;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v93 objects:v121 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v94;
        do
        {
          for (uint64_t m = 0; m != v68; ++m)
          {
            if (*(void *)v94 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = *(void **)(*((void *)&v93 + 1) + 8 * m);
            v72 = (void *)MEMORY[0x1B3E93C70]();
            v73 = [v71 objectAtIndexedSubscript:0];
            uint64_t v74 = [v73 longLongValue];
            v75 = [v71 objectAtIndexedSubscript:1];
            uint64_t v76 = (int)[v75 intValue];
            v77 = [v71 objectAtIndexedSubscript:2];
            -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:](v91, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", v74, v76, (int)[v77 intValue], v92, 0.0);
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v93 objects:v121 count:16];
        }
        while (v68);
      }

      v46 = v81;
      id v47 = v89;
    }

    id v8 = v84;
  }
  v78 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
  {
    uint64_t v79 = [v85 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v129 = v79;
    _os_log_impl(&dword_1B022D000, v78, OS_LOG_TYPE_ERROR, "Deleting %ld orphaned artwork assets.", buf, 0xCu);
  }

  [(ML3MusicLibrary *)v91 _deleteAllArtworkVariantsAtRelativePaths:v85];
  return 1;
}

void __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 stringForColumnIndex:0];
  [*(id *)(a1 + 32) addObject:v3];
}

void __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_943(uint64_t a1, void *a2)
{
  id v3 = [a2 stringForColumnIndex:0];
  [*(id *)(a1 + 32) addObject:v3];
}

void __63__ML3MusicLibrary__removeOrphanedArtworkAssetsUsingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v8[1] = v5;
  id v6 = [v3 objectAtIndexedSubscript:2];

  v8[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [v2 addObject:v7];
}

- (BOOL)_removeOrphanedArtworkMetadataUsingConnection:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = (void *)MEMORY[0x1B3E93C70]();
  id v8 = [v4 executeQuery:@"SELECT artwork_token, artwork_source_type, relative_path, artwork.artwork_type FROM artwork LEFT OUTER JOIN best_artwork_token ON artwork_token = available_artwork_token WHERE artwork.artwork_type != ? AND available_artwork_token IS NULL", &unk_1F090EC80 withParameters];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke;
  v34[3] = &unk_1E5FB6278;
  id v9 = v5;
  id v35 = v9;
  id v10 = v6;
  id v36 = v10;
  [v8 enumerateRowsWithBlock:v34];

  char v11 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = (void *)MEMORY[0x1B3E93C70]();
  uint64_t v13 = [v4 executeQuery:@"SELECT item_pid, chapter_data FROM chapter JOIN item USING (item_pid) WHERE chapter_data IS NOT NULL"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_924;
  v32[3] = &unk_1E5FB83F8;
  id v14 = v11;
  id v33 = v14;
  [v13 enumerateRowsWithBlock:v32];

  id v15 = [v4 executeQuery:@"SELECT artwork_token, relative_path FROM artwork WHERE artwork_type = ?", &unk_1F090EC98 withParameters];
  uint64_t v16 = (void *)MEMORY[0x1B3E93C70]();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_3;
  v28[3] = &unk_1E5FB6A00;
  id v17 = v14;
  id v29 = v17;
  id v18 = v9;
  id v30 = v18;
  id v19 = v10;
  id v31 = v19;
  [v15 enumerateRowsWithBlock:v28];

  if ([v18 count])
  {
    long long v20 = (void *)MEMORY[0x1B3E93C70]();
    uint64_t v21 = +[ML3DatabaseStatementRenderer defaultRenderer];
    id v22 = objc_msgSend(v21, "statementWithPrefix:inParameterCount:", @"DELETE FROM artwork WHERE artwork_token", objc_msgSend(v18, "count"));
    id v27 = 0;
    [v4 executeUpdate:v22 withParameters:v18 error:&v27];
    id v23 = v27;

    uint64_t v24 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v19 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v38 = v25;
      _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_ERROR, "Deleting %ld artwork assets from orphaned metadata.", buf, 0xCu);
    }

    [(ML3MusicLibrary *)self _deleteAllArtworkVariantsAtRelativePaths:v19];
  }

  return 1;
}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 stringForColumnIndex:0];
  int v5 = [v3 intForColumnIndex:1];
  id v6 = [v3 stringForColumnIndex:2];
  int v7 = [v3 intForColumnIndex:3];

  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) addObject:v6];
  id v8 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109890;
    v9[1] = v7;
    __int16 v10 = 1024;
    int v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Found orphaned artwork (type=%d, source=%d) in database with token: %{public}@ relative path: %{public}@", (uint8_t *)v9, 0x22u);
  }
}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_924(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64ForColumnIndex:0];
  int v5 = [v3 dataForColumnIndex:1];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_2;
  v6[3] = &unk_1E5FB00C8;
  uint64_t v8 = v4;
  id v7 = *(id *)(a1 + 32);
  +[MLITChapterTOC enumerateChapterTimesInFlattenedChapterData:v5 usingBlock:v6];
}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_3(id *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 stringForColumnIndex:0];
  int v5 = [v3 stringForColumnIndex:1];

  if (([a1[4] containsObject:v4] & 1) == 0)
  {
    [a1[5] addObject:v4];
    [a1[6] addObject:v5];
    id v6 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2114;
      __int16 v10 = v5;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Found orphaned chapter artwork in database with token: %{public}@ relative path: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __65__ML3MusicLibrary__removeOrphanedArtworkMetadataUsingConnection___block_invoke_2(uint64_t a1)
{
  +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

- (BOOL)_removeOrphanedArtworkTokensUsingConnection:(id)a3
{
  v16[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v15[0] = &unk_1F0910DE0;
  v15[1] = &unk_1F0910DF8;
  v16[0] = @"item";
  v16[1] = @"container";
  v15[2] = &unk_1F0910E10;
  v15[3] = &unk_1F0910E28;
  v16[2] = @"item_artist";
  v16[3] = @"genre";
  void v15[4] = &unk_1F0910E40;
  v15[5] = &unk_1F0910E58;
  v16[4] = @"album";
  v16[5] = @"composer";
  v15[6] = &unk_1F0910E70;
  v16[6] = @"album_artist";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:7];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__ML3MusicLibrary__removeOrphanedArtworkTokensUsingConnection___block_invoke;
  void v8[3] = &unk_1E5FB00A0;
  __int16 v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  BOOL v6 = *((unsigned char *)v12 + 24) != 0;

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __63__ML3MusicLibrary__removeOrphanedArtworkTokensUsingConnection___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = NSString;
  id v9 = a3;
  __int16 v10 = [v8 stringWithFormat:@"DELETE FROM artwork_token WHERE entity_type = ? AND entity_pid NOT IN (SELECT ROWID FROM %@)", v9];
  uint64_t v11 = [NSString stringWithFormat:@"DELETE FROM best_artwork_token WHERE entity_type = ? AND entity_pid NOT IN (SELECT ROWID FROM %@)", v9];

  v26[0] = v7;
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  uint64_t v13 = *(void **)(a1 + 32);
  id v23 = 0;
  char v14 = [v13 executeUpdate:v10 withParameters:v12 error:&v23];
  id v15 = v23;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v25 = v15;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "Failed to remove orphaned artwork tokens with error: %{public}@", buf, 0xCu);
    }

    id v15 = 0;
  }
  id v17 = *(void **)(a1 + 32);
  id v22 = v15;
  char v18 = [v17 executeUpdate:v11 withParameters:v12 error:&v22];
  id v19 = v22;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v18;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v20 = 0;
  }
  else
  {
    uint64_t v21 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v25 = v19;
      _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_ERROR, "Failed to remove orphaned best artwork tokens with error: %{public}@", buf, 0xCu);
    }

    char v20 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
  }
  *a4 = v20;
}

- (void)_deleteAllArtworkVariantsAtRelativePaths:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [(ML3MusicLibrary *)self _allArtworkVariantDirectories];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v5;
        BOOL v6 = *(void **)(*((void *)&v31 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1B3E93C70]();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v7 = v22;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v28 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              uint64_t v13 = (void *)MEMORY[0x1B3E93C70]();
              char v14 = [v6 URLByAppendingPathComponent:v12];
              id v15 = [v14 path];
              int v16 = [v4 fileExistsAtPath:v15];

              if (v16)
              {
                id v17 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138543362;
                  id v36 = v14;
                  _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "Deleting artwork at: %{public}@", buf, 0xCu);
                }

                id v26 = 0;
                [v4 removeItemAtURL:v14 error:&v26];
                id v18 = v26;
                if (v18)
                {
                  id v19 = os_log_create("com.apple.amp.medialibrary", "Default");
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138543618;
                    id v36 = v14;
                    __int16 v37 = 2114;
                    id v38 = v18;
                    _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_ERROR, "Failed to delete artwork at '%{public}@' with error: %{public}@", buf, 0x16u);
                  }
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v25 + 1;
      }
      while (v25 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v23);
  }
}

- (id)_allArtworkVariantDirectories
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v6 = [(ML3MusicLibrary *)self originalArtworkDirectory];
  id v7 = [v5 fileURLWithPath:v6 isDirectory:1];
  [v4 addObject:v7];

  uint64_t v8 = [(ML3MusicLibrary *)self rootArtworkCacheDirectory];
  uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
  uint64_t v10 = *MEMORY[0x1E4F1C628];
  v30[0] = *MEMORY[0x1E4F1C628];
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  uint64_t v23 = v3;
  uint64_t v12 = [v3 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:v11 options:4 error:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v24 = 0;
        int v19 = [v18 getResourceValue:&v24 forKey:v10 error:0];
        id v20 = v24;
        uint64_t v21 = v20;
        if (v19 && [v20 BOOLValue]) {
          [v4 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  return v4;
}

- (BOOL)_determineAndUpdateBestArtworkTokensForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 preserveExistingAvailableToken:(BOOL)a7 usingConnection:(id)a8
{
  BOOL v8 = a7;
  v86[3] = *MEMORY[0x1E4F143B8];
  id v12 = a8;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__2480;
  v73 = __Block_byref_object_dispose__2481;
  uint64_t v74 = &stru_1F08D4D70;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v68[3] = 0;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__2480;
  id v66 = __Block_byref_object_dispose__2481;
  uint64_t v67 = &stru_1F08D4D70;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  id v13 = [NSNumber numberWithLongLong:a3];
  v77[0] = v13;
  uint64_t v14 = [NSNumber numberWithInteger:a4];
  v77[1] = v14;
  uint64_t v15 = [NSNumber numberWithInteger:a5];
  v77[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
  v53 = [v12 executeQuery:@"SELECT artwork_token.artwork_token, artwork_token.artwork_source_type, (artwork.relative_path != '') AS has_artwork_on_disk FROM artwork_token LEFT OUTER JOIN artwork USING (artwork_token) WHERE artwork_token.entity_pid = ? AND artwork_token.entity_type = ? AND artwork_token.artwork_type = ? ORDER BY artwork_token.artwork_source_type ASC", v16 withParameters];

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __161__ML3MusicLibrary__determineAndUpdateBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_preserveExistingAvailableToken_usingConnection___block_invoke;
  v57[3] = &unk_1E5FB0078;
  v57[6] = &v69;
  v57[7] = &v58;
  v57[4] = self;
  v57[5] = v68;
  v57[10] = a4;
  v57[11] = a5;
  v57[8] = &v62;
  v57[9] = a3;
  [v53 enumerateRowsWithBlock:v57];
  id v17 = (void *)v70[5];
  id v18 = (void *)v63[5];
  uint64_t v51 = v59[3];
  id v55 = v12;
  id v19 = v17;
  id v20 = v18;
  if (!v19)
  {
    id v46 = v20;
    id v47 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v48 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL UpdateBestArtworkToken(ML3DatabaseConnection *__strong, int64_t, ML3EntityType, ML3ArtworkType, NSString *__strong, NSString *__strong, ML3ArtworkSourceType, BOOL)");
    [v47 handleFailureInFunction:v48 file:@"ML3MusicLibrary.m" lineNumber:4634 description:@"Available artwork token cannot be nil"];

    id v20 = v46;
  }
  v54 = v20;
  if (!v20)
  {
    uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v50 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL UpdateBestArtworkToken(ML3DatabaseConnection *__strong, int64_t, ML3EntityType, ML3ArtworkType, NSString *__strong, NSString *__strong, ML3ArtworkSourceType, BOOL)");
    [v49 handleFailureInFunction:v50 file:@"ML3MusicLibrary.m" lineNumber:4635 description:@"Fetchable artwork token cannot be nil"];
  }
  uint64_t v21 = objc_msgSend(v19, "length", v51);
  uint64_t v22 = [v54 length];
  BOOL v23 = v22 != 0;
  if (!v8 || v21)
  {
    if (!(v21 | v22)) {
      goto LABEL_10;
    }
  }
  else
  {
    id v24 = [NSNumber numberWithLongLong:a3];
    v86[0] = v24;
    long long v25 = [NSNumber numberWithInteger:a4];
    v86[1] = v25;
    long long v26 = [NSNumber numberWithInteger:a5];
    v86[2] = v26;
    long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];
    long long v28 = [v55 executeQuery:@"SELECT available_artwork_token FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?" withParameters:v27];

    v80 = 0;
    v81 = &v80;
    uint64_t v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__2480;
    id v84 = __Block_byref_object_dispose__2481;
    id v85 = 0;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __UpdateBestArtworkToken_block_invoke;
    v76[3] = &unk_1E5FB77B8;
    v76[4] = &v80;
    [v28 enumerateRowsWithBlock:v76];
    if ([v81[5] length])
    {
      id v29 = v81[5];

      BOOL v23 = 1;
      id v19 = v29;
    }
    _Block_object_dispose(&v80, 8);

    if (!v23)
    {
LABEL_10:
      long long v30 = [NSNumber numberWithLongLong:a3];
      v80 = v30;
      long long v31 = [NSNumber numberWithInteger:a4];
      v81 = v31;
      long long v32 = [NSNumber numberWithInteger:a5];
      uint64_t v82 = (uint64_t)v32;
      long long v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:3];
      id v75 = 0;
      char v34 = [v55 executeUpdate:@"DELETE FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?" withParameters:v33 error:&v75];
      id v35 = v75;

      if ((v34 & 1) == 0)
      {
        id v36 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v79 = v35;
          __int16 v37 = "Failed to delete best_artwork_token with error: %{public}@";
LABEL_18:
          _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      goto LABEL_15;
    }
  }
  id v38 = [NSNumber numberWithLongLong:a3];
  v80 = v38;
  uint64_t v39 = [NSNumber numberWithInteger:a4];
  v81 = v39;
  uint64_t v40 = [NSNumber numberWithInteger:a5];
  uint64_t v82 = (uint64_t)v40;
  v83 = (uint64_t (*)(uint64_t, uint64_t))v19;
  id v84 = (void (*)(uint64_t))v54;
  uint64_t v41 = [NSNumber numberWithInteger:v52];
  id v85 = v41;
  uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:6];
  id v75 = 0;
  char v43 = [v55 executeUpdate:@"INSERT OR REPLACE INTO best_artwork_token (entity_pid, entity_type, artwork_type, available_artwork_token, fetchable_artwork_token, fetchable_artwork_source_type) VALUES (?, ?, ?, ?, ?, ?)", v42, &v75 withParameters error];
  id v35 = v75;

  if ((v43 & 1) == 0)
  {
    id v36 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v79 = v35;
      __int16 v37 = "Failed to update best_artwork_token with error: %{public}@";
      goto LABEL_18;
    }
LABEL_19:

    BOOL v44 = 0;
    goto LABEL_20;
  }
LABEL_15:
  BOOL v44 = 1;
LABEL_20:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(&v69, 8);

  return v44;
}

void __161__ML3MusicLibrary__determineAndUpdateBestArtworkTokensForEntityPersistentID_entityType_artworkType_retrievalTime_preserveExistingAvailableToken_usingConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  obuint64_t j = [v6 stringForColumnIndex:0];
  uint64_t v7 = (int)[v6 intForColumnIndex:1];
  int v8 = [v6 intForColumnIndex:2];

  if (!v8)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (v9) {
      goto LABEL_14;
    }
    if (![*(id *)(a1 + 32) isArtworkFetchableForPersistentID:*(void *)(a1 + 72) entityType:*(void *)(a1 + 80) artworkType:*(void *)(a1 + 88) artworkSourceType:v7])goto LABEL_14; {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), obj);
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
    if (v7 == 100 || v7 == 200 || v7 == 300) {
LABEL_13:
    }
      *a4 = 1;
  }
LABEL_14:
}

- (BOOL)_updateBestArtworkTokensForArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 preserveExistingAvailableToken:(BOOL)a6 usingConnection:(id)a7
{
  BOOL v34 = a6;
  v45[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  v45[0] = v11;
  uint64_t v14 = [NSNumber numberWithInteger:a4];
  v45[1] = v14;
  uint64_t v15 = [NSNumber numberWithInteger:a5];
  v45[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  id v17 = [v12 executeQuery:@"SELECT entity_pid, entity_type FROM artwork_token WHERE artwork_token = ? AND artwork_type = ? AND artwork_source_type = ?", v16 withParameters];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __129__ML3MusicLibrary__updateBestArtworkTokensForArtworkToken_artworkType_sourceType_preserveExistingAvailableToken_usingConnection___block_invoke;
  v39[3] = &unk_1E5FB0050;
  id v18 = v13;
  id v40 = v18;
  id v19 = v11;
  id v41 = v19;
  int64_t v42 = a4;
  int64_t v43 = a5;
  long long v33 = v17;
  [v17 enumerateRowsWithBlock:v39];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id v32 = v19;
    uint64_t v23 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v26 = [v25 objectAtIndexedSubscript:0];
        uint64_t v27 = [v26 longLongValue];

        long long v28 = [v25 objectAtIndexedSubscript:1];
        unint64_t v29 = (int)[v28 intValue];

        if (![(ML3MusicLibrary *)self _determineAndUpdateBestArtworkTokensForEntityPersistentID:v27 entityType:v29 artworkType:a4 retrievalTime:v34 preserveExistingAvailableToken:v12 usingConnection:0.0])
        {
          BOOL v30 = 0;
          goto LABEL_11;
        }
        [MLEntityClassForType(v29) incrementRevisionWithLibrary:self persistentID:v27 deletionType:0 revisionType:1 usingConnection:v12];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v22) {
        continue;
      }
      break;
    }
    BOOL v30 = 1;
LABEL_11:
    id v19 = v32;
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

void __129__ML3MusicLibrary__updateBestArtworkTokensForArtworkToken_artworkType_sourceType_preserveExistingAvailableToken_usingConnection___block_invoke(void *a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  int v8 = [v6 objectAtIndexedSubscript:1];

  if (v7 && v8)
  {
    BOOL v9 = (void *)a1[4];
    v22[0] = v7;
    v22[1] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v9 addObject:v10];
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = a1[5];
      uint64_t v12 = a1[6];
      uint64_t v13 = a1[7];
      int v14 = 138544130;
      uint64_t v15 = v11;
      __int16 v16 = 1024;
      int v17 = v12;
      __int16 v18 = 1024;
      int v19 = v13;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Could not find artwork with token %{public}@, type=%d, source=%d - error=%{public}@", (uint8_t *)&v14, 0x22u);
    }
  }
}

- (BOOL)_insertArtworkRowWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 relativePath:(id)a6 usingConnection:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (![v13 length])
  {
    int v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v27 = v12;
      _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "_insertArtworkRowWithArtworkToken passed empty path for artwork with token %{public}@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v23 = self;
  v25[0] = v12;
  uint64_t v15 = [NSNumber numberWithInteger:a4];
  v25[1] = v15;
  __int16 v16 = [NSNumber numberWithInteger:a5];
  v25[2] = v16;
  v25[3] = v13;
  int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  id v24 = 0;
  int v18 = [v14 executeUpdate:@"INSERT OR REPLACE INTO artwork (artwork_token, artwork_type, artwork_source_type, relative_path) VALUES (?, ?, ?, ?)", v17, &v24 withParameters error];
  int v19 = v24;

  if (!v18)
  {
    id v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v27 = v19;
      _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_ERROR, "Failed to insert into artwork table with error: %{public}@", buf, 0xCu);
    }

LABEL_9:
    BOOL v20 = 0;
    goto LABEL_10;
  }
  BOOL v20 = 1;
  [(ML3MusicLibrary *)v23 _updateBestArtworkTokensForArtworkToken:v12 artworkType:a4 sourceType:a5 preserveExistingAvailableToken:1 usingConnection:v14];
  [(ML3MusicLibrary *)v23 updatePurgeabilityForOriginalArtworkWithRelativePath:v13];
LABEL_10:

  return v20;
}

- (BOOL)_insertArtworkRowWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 relativePath:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__ML3MusicLibrary__insertArtworkRowWithArtworkToken_artworkType_sourceType_relativePath___block_invoke;
  v15[3] = &unk_1E5FB0028;
  int v18 = &v21;
  void v15[4] = self;
  id v12 = v10;
  id v16 = v12;
  int64_t v19 = a4;
  int64_t v20 = a5;
  id v13 = v11;
  id v17 = v13;
  [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v15];
  LOBYTE(a4) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return a4;
}

uint64_t __89__ML3MusicLibrary__insertArtworkRowWithArtworkToken_artworkType_sourceType_relativePath___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _insertArtworkRowWithArtworkToken:*(void *)(a1 + 40) artworkType:*(void *)(a1 + 64) sourceType:*(void *)(a1 + 72) relativePath:*(void *)(a1 + 48) usingConnection:a2];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

- (void)_logDatabaseAccess
{
  if (!__daemonProcessInfo)
  {
    id v2 = [(ML3MusicLibrary *)self privacyContext];
    [v2 logDatabasePrivacyAccess];
  }
}

- (id)securityScopedFileURLForItemPID:(unint64_t)a3
{
  id v5 = +[MLMediaLibraryService sharedMediaLibraryService];
  id v6 = [(ML3MusicLibrary *)self databasePath];
  uint64_t v7 = [v5 securityScopedURLForItemPID:a3 withDatabasePath:v6];

  return v7;
}

- (BOOL)sanitizeSortMapContentsUsingConnection:(id)a3 didSortMapEntries:(BOOL *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  id v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = [v5 executeQuery:@"SELECT DISTINCT title, sort_title FROM item_extra JOIN item USING(item_pid) WHERE title_order = 0 AND LENGTH(title)"];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke;
  v48[3] = &unk_1E5FB83F8;
  id v8 = v6;
  id v49 = v8;
  [v7 enumerateRowsWithBlock:v48];

  BOOL v9 = [v5 executeQuery:@"SELECT DISTINCT item_artist, sort_item_artist, series_name, sort_series_name FROM item_artist JOIN item USING(item_artist_pid) WHERE item_artist_order = 0 AND LENGTH(item_artist)"];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_2;
  void v46[3] = &unk_1E5FB83F8;
  id v10 = v8;
  id v47 = v10;
  [v9 enumerateRowsWithBlock:v46];

  id v11 = [v5 executeQuery:@"SELECT DISTINCT album_artist, sort_album_artist FROM album_artist WHERE sort_order = 0 AND LENGTH(album_artist)"];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_3;
  v44[3] = &unk_1E5FB83F8;
  id v12 = v10;
  id v45 = v12;
  [v11 enumerateRowsWithBlock:v44];

  id v13 = [v5 executeQuery:@"SELECT DISTINCT album, sort_album FROM album JOIN item USING(album_pid) WHERE album_order = 0 AND LENGTH(album)"];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_4;
  v42[3] = &unk_1E5FB83F8;
  id v14 = v12;
  id v43 = v14;
  [v13 enumerateRowsWithBlock:v42];

  uint64_t v15 = [v5 executeQuery:@"SELECT DISTINCT composer, sort_composer FROM composer JOIN item USING(composer_pid) WHERE composer_order = 0 AND LENGTH(composer)"];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_5;
  v40[3] = &unk_1E5FB83F8;
  id v16 = v14;
  id v41 = v16;
  [v15 enumerateRowsWithBlock:v40];

  id v17 = [v5 executeQuery:@"SELECT DISTINCT genre FROM genre JOIN item USING(genre_id) WHERE genre_order = 0 AND LENGTH(genre)"];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_6;
  v38[3] = &unk_1E5FB83F8;
  id v18 = v16;
  id v39 = v18;
  [v17 enumerateRowsWithBlock:v38];

  if ([v18 count])
  {
    int64_t v19 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Sanity check recoverable condition: Sort map was missing the following names %{public}@", (uint8_t *)&buf, 0xCu);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v58 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v57 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          char v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
          [v5 executeUpdate:@"INSERT OR REPLACE INTO sort_map (name, sort_key) VALUES (?, '')", v24, 0 withParameters error];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v58 count:16];
      }
      while (v21);
    }

    *((unsigned char *)v51 + 24) = 1;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  long long v25 = [v5 executeQuery:@"SELECT name_order, name_section FROM sort_map ORDER BY sort_key ASC"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_890;
  v32[3] = &unk_1E5FB4FA8;
  void v32[4] = &buf;
  v32[5] = &v50;
  v32[6] = v33;
  [v25 enumerateRowsWithBlock:v32];

  long long v26 = v51;
  if (a4) {
    *a4 = *((unsigned char *)v51 + 24);
  }
  if (!*((unsigned char *)v26 + 24)) {
    goto LABEL_19;
  }
  uint64_t v27 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v31 = 0;
    _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "Sanity check recoverable condition: Sort map is inconsistent", v31, 2u);
  }

  if ([(ML3MusicLibrary *)self inTransactionUpdateSortMapOnConnection:v5 forceUpdateOriginals:1]&& [(ML3MusicLibrary *)self inTransactionUpdateSearchMapOnConnection:v5])
  {
LABEL_19:
    BOOL v28 = 1;
  }
  else
  {
    BOOL v28 = 0;
  }
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v50, 8);
  return v28;
}

void __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 stringForColumnIndex:0];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v13 stringForColumnIndex:0];
    uint64_t v7 = [v6 sanitizedString];
    [v5 addObject:v7];
  }
  id v8 = [v13 stringForColumnIndex:1];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v13 stringForColumnIndex:1];
    id v12 = [v11 sanitizedString];
    [v10 addObject:v12];
  }
}

void __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_2(uint64_t a1, void *a2)
{
  id v23 = a2;
  id v3 = [v23 stringForColumnIndex:0];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v23 stringForColumnIndex:0];
    uint64_t v7 = [v6 sanitizedString];
    [v5 addObject:v7];
  }
  id v8 = [v23 stringForColumnIndex:1];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v23 stringForColumnIndex:1];
    id v12 = [v11 sanitizedString];
    [v10 addObject:v12];
  }
  id v13 = [v23 stringForColumnIndex:2];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = [v23 stringForColumnIndex:2];
    id v17 = [v16 sanitizedString];
    [v15 addObject:v17];
  }
  id v18 = [v23 stringForColumnIndex:3];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = [v23 stringForColumnIndex:3];
    uint64_t v22 = [v21 sanitizedString];
    [v20 addObject:v22];
  }
}

void __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 stringForColumnIndex:0];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v13 stringForColumnIndex:0];
    uint64_t v7 = [v6 sanitizedString];
    [v5 addObject:v7];
  }
  id v8 = [v13 stringForColumnIndex:1];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v13 stringForColumnIndex:1];
    id v12 = [v11 sanitizedString];
    [v10 addObject:v12];
  }
}

void __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_4(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 stringForColumnIndex:0];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v13 stringForColumnIndex:0];
    uint64_t v7 = [v6 sanitizedString];
    [v5 addObject:v7];
  }
  id v8 = [v13 stringForColumnIndex:1];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v13 stringForColumnIndex:1];
    id v12 = [v11 sanitizedString];
    [v10 addObject:v12];
  }
}

void __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_5(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 stringForColumnIndex:0];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v13 stringForColumnIndex:0];
    uint64_t v7 = [v6 sanitizedString];
    [v5 addObject:v7];
  }
  id v8 = [v13 stringForColumnIndex:1];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v13 stringForColumnIndex:1];
    id v12 = [v11 sanitizedString];
    [v10 addObject:v12];
  }
}

void __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_6(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 stringForColumnIndex:0];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v8 stringForColumnIndex:0];
    uint64_t v7 = [v6 sanitizedString];
    [v5 addObject:v7];
  }
}

void __76__ML3MusicLibrary_sanitizeSortMapContentsUsingConnection_didSortMapEntries___block_invoke_890(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 int64ForColumnIndex:0];
  uint64_t v8 = [v6 int64ForColumnIndex:1];

  if (v7)
  {
    uint64_t v9 = *(void *)(a1[4] + 8);
    if (v7 >= *(void *)(v9 + 24))
    {
      *(void *)(v9 + 24) = v7;
      if (v8 == -1) {
        return;
      }
      uint64_t v12 = *(void *)(a1[6] + 8);
      if (v8 >= *(void *)(v12 + 24))
      {
        *(void *)(v12 + 24) = v8;
        return;
      }
      id v13 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(*(void *)(a1[6] + 8) + 24);
        int v15 = 134218240;
        uint64_t v16 = v8;
        __int16 v17 = 2048;
        uint64_t v18 = v14;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Sort map nextSection %lli, nameSection %lli", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      id v10 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1[4] + 8) + 24);
        int v15 = 134218240;
        uint64_t v16 = v7;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Sort map nextOrder %lli, nameOrder %lli", (uint8_t *)&v15, 0x16u);
      }
    }
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)sanitizeDatabaseContentsUsingConnection:(id)a3 removeOrphanedAssets:(BOOL *)a4
{
  uint64_t v57 = self;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 executeQuery:@"SELECT COUNT() FROM item"];
  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];

  uint64_t v8 = [v5 executeQuery:@"SELECT COUNT() FROM item_extra"];
  uint64_t v9 = [v8 int64ValueForFirstRowAndColumn];

  id v10 = [v5 executeQuery:@"SELECT COUNT() FROM item_stats"];
  uint64_t v11 = [v10 int64ValueForFirstRowAndColumn];

  uint64_t v12 = [v5 executeQuery:@"SELECT COUNT() FROM item_store"];
  uint64_t v13 = [v12 int64ValueForFirstRowAndColumn];

  uint64_t v14 = [v5 executeQuery:@"SELECT COUNT() FROM item_video"];
  uint64_t v15 = [v14 int64ValueForFirstRowAndColumn];

  uint64_t v16 = v13 == (v11 == (v7 == v9));
  uint64_t v56 = v7;
  if (v15 == v16) {
    goto LABEL_21;
  }
  __int16 v17 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134219008;
    uint64_t v72 = v7;
    __int16 v73 = 2048;
    uint64_t v74 = v9;
    __int16 v75 = 2048;
    uint64_t v76 = v11;
    __int16 v77 = 2048;
    uint64_t v78 = v13;
    __int16 v79 = 2048;
    uint64_t v80 = v15;
    _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "Sanity check recoverable condition for inconsistent counts: item(%lli), item_extra(%lli), item_stats(%lli), item_store(%lli), item_video(%lli) ", buf, 0x34u);
  }

  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  if (v7 > v9)
  {
    BOOL v19 = v13 == (v11 == (v7 == v9));
    id v20 = [v5 executeQuery:@"SELECT ROWID FROM item WHERE item_pid IN (SELECT item.item_pid FROM item LEFT OUTER JOIN item_extra ON item.item_pid=item_extra.item_pid WHERE item_extra.item_pid ISNULL)"];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __80__ML3MusicLibrary_sanitizeDatabaseContentsUsingConnection_removeOrphanedAssets___block_invoke;
    v66[3] = &unk_1E5FB83F8;
    uint64_t v21 = &v67;
    id v67 = v18;
    [v20 enumerateRowsWithBlock:v66];
    uint64_t v22 = @"DELETE FROM item WHERE item_pid IN (SELECT item.item_pid FROM item LEFT OUTER JOIN item_extra ON item.item_pid=item_extra.item_pid WHERE item_extra.item_pid ISNULL)";
LABEL_8:

    [v5 executeUpdate:v22];
    uint64_t v16 = v19;
    uint64_t v7 = v56;
    goto LABEL_9;
  }
  if (v7 < v9)
  {
    BOOL v19 = v13 == (v11 == (v7 == v9));
    id v20 = [v5 executeQuery:@"SELECT ROWID FROM item_extra WHERE item_pid IN (SELECT item_extra.item_pid FROM item_extra LEFT OUTER JOIN item ON item_extra.item_pid=item.item_pid WHERE item.item_pid ISNULL)"];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __80__ML3MusicLibrary_sanitizeDatabaseContentsUsingConnection_removeOrphanedAssets___block_invoke_2;
    v64[3] = &unk_1E5FB83F8;
    uint64_t v21 = &v65;
    id v65 = v18;
    [v20 enumerateRowsWithBlock:v64];
    uint64_t v22 = @"DELETE FROM item_extra WHERE item_pid IN (SELECT item_extra.item_pid FROM item_extra LEFT OUTER JOIN item ON item_extra.item_pid=item.item_pid WHERE item.item_pid ISNULL)";
    goto LABEL_8;
  }
LABEL_9:
  [v5 executeUpdate:@"DELETE FROM item_stats WHERE item_pid IN (SELECT item_stats.item_pid FROM item_stats LEFT OUTER JOIN item ON item_stats.item_pid=item.item_pid WHERE item.item_pid ISNULL)"];
  [v5 executeUpdate:@"DELETE FROM item_search WHERE item_pid IN (SELECT item_search.item_pid FROM item_search LEFT OUTER JOIN item ON item_search.item_pid=item.item_pid WHERE item.item_pid ISNULL)"];
  [v5 executeUpdate:@"DELETE FROM item_store WHERE item_pid IN (SELECT item_store.item_pid FROM item_store LEFT OUTER JOIN item ON item_store.item_pid=item.item_pid WHERE item.item_pid ISNULL)"];
  [v5 executeUpdate:@"DELETE FROM item_playback WHERE item_pid IN (SELECT item_playback.item_pid FROM item_playback LEFT OUTER JOIN item ON item_playback.item_pid=item.item_pid WHERE item.item_pid ISNULL)"];
  [v5 executeUpdate:@"DELETE FROM item_video WHERE Item_pid IN (SELECT item_video.item_pid FROM item_video LEFT OUTER JOIN item ON item_video.item_pid=item.item_pid WHERE item.item_pid ISNULL)"];
  if ([v18 count])
  {
    uint64_t v53 = v16;
    uint64_t v54 = v15;
    id v59 = v5;
    uint64_t v55 = a4;
    id v23 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v72 = (uint64_t)v18;
      _os_log_impl(&dword_1B022D000, v23, OS_LOG_TYPE_DEFAULT, "Sanity check: Incrementing revision for removed tracks: %{public}@", buf, 0xCu);
    }

    char v24 = objc_msgSend(NSNumber, "numberWithInteger:", +[ML3Track revisionTrackingCode](ML3Track, "revisionTrackingCode"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v52 = v18;
    id v58 = v18;
    uint64_t v25 = [v58 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v61 != v27) {
            objc_enumerationMutation(v58);
          }
          v69[0] = *(void *)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v29 = v69[0];
          v69[1] = &unk_1F0910DB0;
          v69[2] = v24;
          v69[3] = &unk_1F0910DC8;
          BOOL v30 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v69, 4, v52);
          [v59 executeUpdate:@"REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES (?, ?, ?, ?)", v30, 0 withParameters error];

          v68[0] = &unk_1F0910DC8;
          v68[1] = v24;
          v68[2] = v29;
          long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
          [v59 executeUpdate:@"DELETE FROM entity_revision WHERE revision_type > ? AND class = ? AND entity_pid = ?" withParameters:v31 error:0];
        }
        uint64_t v26 = [v58 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v26);
    }

    uint64_t v15 = v54;
    a4 = v55;
    id v5 = v59;
    uint64_t v18 = v52;
    uint64_t v16 = v53;
    uint64_t v7 = v56;
  }

LABEL_21:
  id v32 = objc_msgSend(v5, "executeQuery:", @"SELECT item_pid FROM item JOIN item_store USING(item_pid) WHERE media_type = 8 AND title_order = 0 AND album_order = 0 AND album_artist_order = 0 AND subscription_store_item_id = 0 AND is_ota_purchased = 0 AND store_saga_id = 0 AND store_item_id = 0 AND sync_id = 0 AND purchase_history_id = 0 AND base_location_id = 0 AND remote_location_id = 0 AND disc_number = 0 AND track_number = 0 AND needs_reporting = 1", v52);
  long long v33 = [v32 objectsInColumn:0];

  if ([v33 count])
  {
    [v33 count];
    MEMORY[0x1F4188790]();
    long long v35 = (char *)&v52 - v34;
    if ([v33 count])
    {
      unint64_t v36 = 0;
      do
      {
        long long v37 = [v33 objectAtIndexedSubscript:v36];
        *(void *)&v35[8 * v36] = [v37 longLongValue];

        ++v36;
      }
      while ([v33 count] > v36);
    }
    uint64_t v38 = [v33 count];
    BOOL v39 = +[ML3Track deleteFromLibrary:v57 deletionType:2 persistentIDs:v35 count:v38 usingConnection:v5];
    uint64_t v7 = v56;
    if (v39)
    {
      id v40 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v72 = (uint64_t)v33;
        _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_DEFAULT, "Sanity check: Deleted garbage tracks %{public}@", buf, 0xCu);
      }
    }
  }
  id v41 = v57;
  +[ML3Collection removeOrphanedCollectionsInLibrary:v57 usingConnection:v5];
  [(ML3MusicLibrary *)v41 coalesceMismatchedCollectionsUsingConnection:v5];
  [(ML3MusicLibrary *)v41 repairAlbumArtistRelationshipsWithConnection:v5];
  +[ML3Collection canonicalizeCollectionRepresentativeItemsInLibrary:v41 usingConnection:v5];
  +[ML3Collection canonicalizeCollectionRepresentativeItemsInLibrary:v41 usingConnection:v5];
  +[ML3Collection canonicalizeCollectionRepresentativeItemsInLibrary:v41 usingConnection:v5];
  +[ML3Collection canonicalizeCollectionRepresentativeItemsInLibrary:v41 usingConnection:v5];
  +[ML3Collection canonicalizeCollectionRepresentativeItemsInLibrary:v41 usingConnection:v5];
  int64_t v42 = [v5 executeQuery:@"SELECT COUNT() FROM lyrics"];
  uint64_t v43 = [v42 int64ValueForFirstRowAndColumn];

  if (v43 != v7)
  {
    BOOL v44 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      uint64_t v72 = v7;
      __int16 v73 = 2048;
      uint64_t v74 = v43;
      _os_log_impl(&dword_1B022D000, v44, OS_LOG_TYPE_DEFAULT, "Sanity check recoverable condition: %lli rows in item and %lli rows in lyrics", buf, 0x16u);
    }

    [v5 executeUpdate:@"INSERT INTO lyrics (item_pid) SELECT item.item_pid FROM item LEFT OUTER JOIN lyrics USING (item_pid) WHERE lyrics.item_pid ISNULL;"];
  }
  if (v15 != v16)
  {
    id v45 = [v5 executeQuery:@"SELECT value FROM _MLDatabaseProperties WHERE key = 'MLCloudDatabaseRevision'"];
    uint64_t v46 = [v45 int64ValueForFirstRowAndColumn];

    if (v46 >= 1)
    {
      id v47 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B022D000, v47, OS_LOG_TYPE_DEFAULT, "Sanity check: flagging cloud library for full refresh after next update", buf, 2u);
      }

      [v5 executeUpdate:@"INSERT OR REPLACE INTO _MLDatabaseProperties (value, key) VALUES (?, ?)", &unk_1F090EC50, 0 withParameters error];
    }
    uint64_t v48 = [v5 executeQuery:@"SELECT value FROM _MLDatabaseProperties WHERE key = 'MLJaliscoDatabaseRevision'"];
    uint64_t v49 = [v48 int64ValueForFirstRowAndColumn];

    if (v49 >= 1)
    {
      uint64_t v50 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B022D000, v50, OS_LOG_TYPE_DEFAULT, "Sanity check: flagging purchase history for next update to include all tokens", buf, 2u);
      }

      [v5 executeUpdate:@"INSERT OR REPLACE INTO _MLDatabaseProperties (value, key) VALUES (?, ?)", &unk_1F090EC68, 0 withParameters error];
    }
    uint64_t v51 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B022D000, v51, OS_LOG_TYPE_DEFAULT, "Sanity check: resetting sync anchors", buf, 2u);
    }

    [v5 executeUpdate:@"DELETE FROM _MLDatabaseProperties WHERE key = 'MLSyncClientLastSyncedRevision'"];
    [v5 executeUpdate:@"DELETE FROM _MLDatabaseProperties WHERE key = 'MLSyncClientSyncAnchor'"];
    [v5 executeUpdate:@"DELETE FROM _MLDatabaseProperties WHERE key = 'MLSyncClientGenerationID'"];
    [v5 executeUpdate:@"DELETE FROM _MLDatabaseProperties WHERE key = 'MLSyncClientHasPendingAssets'"];
  }
  if (a4) {
    *a4 = v15 != v16;
  }
}

void __80__ML3MusicLibrary_sanitizeDatabaseContentsUsingConnection_removeOrphanedAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectAtIndexedSubscript:0];
  [v2 addObject:v3];
}

void __80__ML3MusicLibrary_sanitizeDatabaseContentsUsingConnection_removeOrphanedAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectAtIndexedSubscript:0];
  [v2 addObject:v3];
}

- (BOOL)validateItemTablesEntriesUsingConnection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 executeQuery:@"SELECT COUNT() FROM item"];
  uint64_t v5 = [v4 int64ValueForFirstRowAndColumn];

  id v6 = [v3 executeQuery:@"SELECT COUNT() FROM item_extra"];
  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];

  uint64_t v8 = [v3 executeQuery:@"SELECT COUNT() FROM item_stats"];
  uint64_t v9 = [v8 int64ValueForFirstRowAndColumn];

  id v10 = [v3 executeQuery:@"SELECT COUNT() FROM item_store"];
  uint64_t v11 = [v10 int64ValueForFirstRowAndColumn];

  uint64_t v12 = [v3 executeQuery:@"SELECT COUNT() FROM item_video"];

  uint64_t v13 = [v12 int64ValueForFirstRowAndColumn];
  BOOL v16 = v5 == v7 && v5 == v9 && v5 == v11 && v5 == v13;
  BOOL v17 = v16;
  if (!v16)
  {
    uint64_t v18 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134219008;
      uint64_t v21 = v5;
      __int16 v22 = 2048;
      uint64_t v23 = v7;
      __int16 v24 = 2048;
      uint64_t v25 = v9;
      __int16 v26 = 2048;
      uint64_t v27 = v11;
      __int16 v28 = 2048;
      uint64_t v29 = v13;
      _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "Counts in item table(s) are inconsistent: item(%lli), item_extra(%lli), item_stats(%lli), item_store(%lli), item_video(%lli) ", (uint8_t *)&v20, 0x34u);
    }
  }
  return v17;
}

- (void)updateTrackIntegrity
{
}

uint64_t __39__ML3MusicLibrary_updateTrackIntegrity__block_invoke(uint64_t a1, void *a2)
{
  return [a2 executeUpdate:@"UPDATE item_extra SET integrity = (SELECT ML3TrackIntegrityCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size) FROM item JOIN item_extra AS item_extra2 USING (item_pid) WHERE item_extra.item_pid = item.item_pid) WHERE item_pid IN (SELECT item_pid FROM item WHERE base_location_id != 0)"];
}

- (void)deletePresignedValidity
{
  id v2 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_ERROR, "deleting presigned validity", v4, 2u);
  }

  GetP7BPath();
  id v3 = objc_claimAutoreleasedReturnValue();
  unlink((const char *)[v3 fileSystemRepresentation]);
}

- (BOOL)verifyPresignedValidity
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = GetP7BPath();
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
  if ([v4 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA58] data];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke;
    v14[3] = &unk_1E5FB8420;
    id v6 = v5;
    id v15 = v6;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v14];
    memset(&v13, 0, sizeof(v13));
    CC_SHA1_Init(&v13);
    id v7 = v6;
    CC_SHA1_Update(&v13, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
    CC_SHA1_Final(md, &v13);
    [v4 length];
    [v4 bytes];
    zLTj();
    BOOL v9 = v8 == 0;
    if (v8)
    {
      int v10 = v8;
      uint64_t v11 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134219008;
        uint64_t v17 = v10;
        __int16 v18 = 1024;
        int v19 = md[0];
        __int16 v20 = 1024;
        int v21 = md[1];
        __int16 v22 = 1024;
        int v23 = md[2];
        __int16 v24 = 1024;
        int v25 = md[3];
        _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "BarVerify returned %ld for %02x%02x%02x%02x...", buf, 0x24u);
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke(uint64_t a1, void *a2)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  v22[0] = v4;
  uint64_t v5 = objc_opt_new();
  v22[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  BOOL v9 = v7;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        CC_SHA1_CTX v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) name];
        int v14 = [v3 tableExists:v13];

        if (!v14)
        {
          BOOL v9 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    BOOL v9 = [v3 executeQuery:@"SELECT ML3TrackDigestCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size) FROM item JOIN item_extra USING (item_pid) ORDER BY item_pid"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke_2;
    v15[3] = &unk_1E5FB83F8;
    id v16 = *(id *)(a1 + 32);
    [v9 enumerateRowsWithBlock:v15];
  }
LABEL_11:
}

uint64_t __42__ML3MusicLibrary_verifyPresignedValidity__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  int v4 = 0;
  [a2 getBlobBytes:&v5 outLength:&v4 forColumnIndex:0];
  return [*(id *)(a1 + 32) appendBytes:v5 length:v4];
}

- (BOOL)hasPresignedValidity
{
  id v2 = GetP7BPath();
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2];

  return v4;
}

- (void)migratePresignedValidity
{
  if ([(ML3MusicLibrary *)self hasPresignedValidity])
  {
    if ([(ML3MusicLibrary *)self verifyPresignedValidity]) {
      [(ML3MusicLibrary *)self updateTrackIntegrity];
    }
    [(ML3MusicLibrary *)self deletePresignedValidity];
  }
}

- (BOOL)deleteDatabaseProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__ML3MusicLibrary_deleteDatabaseProperty___block_invoke;
    void v8[3] = &unk_1E5FB7640;
    uint64_t v10 = &v11;
    id v9 = v4;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __42__ML3MusicLibrary_deleteDatabaseProperty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  uint64_t v5 = [v3 arrayWithObjects:&v7 count:1];
  char v6 = objc_msgSend(v4, "executeUpdate:withParameters:error:", @"DELETE FROM _MLDatabaseProperties WHERE key = ?", v5, 0, v7, v8);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
}

- (void)removeItemsWithFamilyAccountID:(unint64_t)a3 purchaserAccountID:(unint64_t)a4 downloaderAccountID:(unint64_t)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a4];
  id v9 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.account_id" value:v8 comparison:1];

  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:a5];
  uint64_t v11 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.downloader_account_id" value:v10 comparison:1];

  v34[0] = v9;
  v34[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  uint64_t v13 = +[ML3CompoundPredicate predicateMatchingPredicates:v12];

  unint64_t v24 = a3;
  char v14 = [NSNumber numberWithUnsignedLongLong:a3];
  id v15 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.family_account_id" value:v14 comparison:1];

  id v16 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.is_protected" value:&unk_1F0910DF8 comparison:1];
  v33[0] = v13;
  v33[1] = v15;
  v33[2] = v16;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  long long v18 = +[ML3CompoundPredicate predicateMatchingPredicates:v17];

  long long v19 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:self predicate:v18 orderingTerms:0];
  long long v20 = [MEMORY[0x1E4F1CA48] array];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__ML3MusicLibrary_removeItemsWithFamilyAccountID_purchaserAccountID_downloaderAccountID___block_invoke;
  v25[3] = &unk_1E5FB7EE0;
  id v21 = v20;
  id v26 = v21;
  [v19 enumeratePersistentIDsUsingBlock:v25];
  __int16 v22 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = [v21 count];
    *(_DWORD *)long long buf = 134218498;
    uint64_t v28 = v23;
    __int16 v29 = 2048;
    unint64_t v30 = v24;
    __int16 v31 = 2114;
    id v32 = v21;
    _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_ERROR, "Removing %llu tracks due to family account removal (family account id = %lld)\npersistent_ids = %{public}@", buf, 0x20u);
  }

  +[ML3Track unlinkRedownloadableAssetsFromLibrary:self persistentIDs:v21 deletionType:2 deletedFileSize:0];
}

void __89__ML3MusicLibrary_removeItemsWithFamilyAccountID_purchaserAccountID_downloaderAccountID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (void)removeOrphanedTracksOnlyInCaches:(BOOL)a3
{
  v73[2] = *MEMORY[0x1E4F143B8];
  char v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  double v8 = v7;

  if (![(ML3MusicLibrary *)self isHomeSharingLibrary])
  {
    id v9 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:self predicate:0 orderingTerms:0];
    v73[0] = @"item_extra.location";
    v73[1] = @"base_location_id";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v13 = [v12 fileExistsAtPath:self->_databasePath];

    if (v13)
    {
      if ([(ML3MusicLibrary *)self currentDatabaseVersion] != 2220020)
      {
        id v15 = os_log_create("com.apple.amp.medialibrary", "Library");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.st_dev) = 0;
          _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_ERROR, "De-orphaning called on old database, returning immediately", (uint8_t *)&buf, 2u);
        }
        goto LABEL_42;
      }
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke;
      v70[3] = &unk_1E5FB5218;
      uint64_t v71 = v11;
      [v9 enumeratePersistentIDsAndProperties:v10 usingBlock:v70];
      char v14 = v71;
    }
    else
    {
      char v14 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.st_dev) = 0;
        _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "De-orphaning called with no database, removing everything", (uint8_t *)&buf, 2u);
      }
    }

    id v15 = [(ML3MusicLibrary *)self pathForBaseLocationPath:300];
    uint64_t v16 = [v15 stringByAppendingPathComponent:@"Ringtones.plist"];
    id v58 = (void *)v16;
    id v59 = v10;
    SEL v57 = a2;
    if (a3
      || (long long v17 = (void *)v16,
          [MEMORY[0x1E4F28CB8] defaultManager],
          long long v18 = objc_claimAutoreleasedReturnValue(),
          long long v19 = v17,
          LODWORD(v17) = [v18 fileExistsAtPath:v17],
          v18,
          !v17))
    {
      char v34 = 1;
      long long v35 = (void *)&unk_1B04DA000;
LABEL_33:
      int64_t v42 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"mp3", @"m4a", @"m4p", @"aa", @"aax", @"mp4", @"m4v", @"mov", @"m4b", @"movpkg", @"m4bpkg", 0);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = v35[32];
      v60[2] = __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke_747;
      v60[3] = &unk_1E5FB0000;
      _OWORD v60[4] = self;
      id v43 = v42;
      id v61 = v43;
      id v62 = v11;
      uint64_t v63 = (uint64_t)v8;
      BOOL v44 = (void (**)(void, void))MEMORY[0x1B3E93EE0](v60);
      if (!a3)
      {
        id v45 = v9;
        uint64_t v46 = v15;
        id v47 = [(ML3MusicLibrary *)self libraryContainerPath];
        uint64_t v48 = +[ML3MusicLibrary mediaFolderPath];
        uint64_t v49 = self;
        char v50 = [v47 isEqualToString:v48];

        if ((v50 & 1) == 0)
        {
          uint64_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v53 = [(ML3MusicLibrary *)v49 libraryContainerPath];
          [v52 handleFailureInMethod:v57, v49, @"ML3MusicLibrary.m", 3404, @"Attempting to de-orphan shared resources in a MU library! %@", v53 object file lineNumber description];
        }
        for (uint64_t i = 3840; i != 3890; ++i)
          v44[2](v44, i);
        v44[2](v44, 250);
        id v15 = v46;
        if (v34)
        {
          v44[2](v44, 300);
          v44[2](v44, 500);
          v44[2](v44, 600);
        }
        v44[2](v44, 400);
        id v9 = v45;
      }
      v44[2](v44, 200);
      v44[2](v44, 100);

      uint64_t v10 = v59;
LABEL_42:

      return;
    }
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v19];
    uint64_t v56 = v20;
    if (v20)
    {
      uint64_t v54 = self;
      uint64_t v55 = v9;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v21 = [v20 objectForKey:@"Ringtones"];
      __int16 v22 = [v21 allKeys];

      uint64_t v23 = [v22 countByEnumeratingWithState:&v66 objects:v72 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v67 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v66 + 1) + 8 * j);
            uint64_t v28 = [NSNumber numberWithLongLong:300];
            __int16 v29 = [v11 objectForKeyedSubscript:v28];

            if (!v29)
            {
              unint64_t v30 = [MEMORY[0x1E4F1CA80] set];
              __int16 v31 = [NSNumber numberWithLongLong:300];
              [v11 setObject:v30 forKeyedSubscript:v31];
            }
            id v32 = [NSNumber numberWithLongLong:300];
            long long v33 = [v11 objectForKeyedSubscript:v32];
            [v33 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v66 objects:v72 count:16];
        }
        while (v24);
      }

      char v34 = 1;
      self = v54;
      id v9 = v55;
      long long v35 = (void *)&unk_1B04DA000;
      goto LABEL_32;
    }
    memset(&buf, 0, sizeof(buf));
    if (stat((const char *)[v19 UTF8String], &buf))
    {
      unint64_t v36 = os_log_create("com.apple.amp.medialibrary", "Library");
      long long v35 = (void *)&unk_1B04DA000;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v64 = 0;
        long long v37 = "Couldn't stat ringtone.plist";
        uint64_t v38 = v36;
        os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
        _os_log_impl(&dword_1B022D000, v38, v39, v37, v64, 2u);
      }
    }
    else
    {
      off_t st_size = buf.st_size;
      id v41 = _ML3LogCategoryLibrary();
      unint64_t v36 = v41;
      if (st_size < 1)
      {
        long long v35 = (void *)&unk_1B04DA000;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v64 = 0;
          _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_DEFAULT, "Empty ringtone.plist found, OK to purge.", v64, 2u);
        }
        char v34 = 1;
        goto LABEL_31;
      }
      long long v35 = &unk_1B04DA000;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v64 = 0;
        long long v37 = "Skipping de-orphaning of Purchases directory due to locked ringtone.plist";
        uint64_t v38 = v36;
        os_log_type_t v39 = OS_LOG_TYPE_ERROR;
        goto LABEL_29;
      }
    }
    char v34 = 0;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
}

void __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke(uint64_t a1, uint64_t a2, id *a3)
{
  id v9 = *a3;
  id v5 = a3[1];
  if ([v9 length])
  {
    char v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

    if (!v6)
    {
      double v7 = [MEMORY[0x1E4F1CA80] set];
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
    }
    double v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    [v8 addObject:v9];
  }
}

void __52__ML3MusicLibrary_removeOrphanedTracksOnlyInCaches___block_invoke_747(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) pathForBaseLocationPath:a2];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v34 = (void *)v3;
  id v5 = [v4 enumeratorAtPath:v3];

  long long v33 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    uint64_t v35 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1B3E93C70]();
        uint64_t v12 = [v10 pathExtension];
        int v13 = [v12 lowercaseString];

        if ([*(id *)(a1 + 40) containsObject:v13])
        {
          if (v13)
          {
            char v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"movpkg", @"m4bpkg", 0);
            int v15 = [v14 containsObject:v13];
          }
          else
          {
            int v15 = 0;
          }
          uint64_t v16 = *(void **)(a1 + 48);
          long long v17 = [NSNumber numberWithLongLong:a2];
          long long v18 = [v16 objectForKeyedSubscript:v17];
          int v19 = [v18 containsObject:v10];

          if (!v19)
          {
            id v20 = [v34 stringByAppendingPathComponent:v10];
            id v21 = (const char *)[v20 fileSystemRepresentation];

            memset(&v46, 0, sizeof(v46));
            if (stat(v21, &v46))
            {
              __int16 v22 = os_log_create("com.apple.amp.medialibrary", "Library");
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                uint64_t v23 = __error();
                uint64_t v24 = strerror(*v23);
                *(_DWORD *)stat buf = 136446466;
                id v43 = v21;
                __int16 v44 = 2082;
                id v45 = v24;
                uint64_t v25 = v22;
                os_log_type_t v26 = OS_LOG_TYPE_ERROR;
                uint64_t v27 = "Could not read old file: %{public}s, %{public}s";
                uint32_t v28 = 22;
                goto LABEL_16;
              }
              goto LABEL_17;
            }
            if ((v46.st_mode & 0x4000) != 0) {
              char v29 = v15;
            }
            else {
              char v29 = 1;
            }
            if (v29)
            {
              if (v46.st_mtimespec.tv_sec <= *(void *)(a1 + 56) - 300)
              {
                unint64_t v30 = [NSString stringWithUTF8String:v21];
                [v33 addObject:v30];
              }
              else
              {
                __int16 v22 = os_log_create("com.apple.amp.medialibrary", "Library");
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)stat buf = 136446210;
                  id v43 = v21;
                  uint64_t v25 = v22;
                  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
                  uint64_t v27 = "Ignoring new unaccounted file %{public}s";
                  uint32_t v28 = 12;
LABEL_16:
                  _os_log_impl(&dword_1B022D000, v25, v26, v27, buf, v28);
                }
LABEL_17:
              }
            }
            else
            {
              [obj skipDescendants];
            }
            uint64_t v8 = v35;
            goto LABEL_28;
          }
          uint64_t v8 = v35;
          if (v15) {
            [obj skipDescendants];
          }
        }
LABEL_28:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v7);
  }

  __int16 v31 = os_log_create("com.apple.amp.medialibrary", "Library");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    __darwin_ino64_t v32 = [v33 count];
    v46.st_dev = 138543874;
    *(void *)&v46.st_mode = v34;
    WORD2(v46.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v46.st_ino + 6) = v32;
    HIWORD(v46.st_gvoid (**v8)(id, uint64_t, id) = 2114;
    *(void *)&v46.st_rdev = v33;
    _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_ERROR, "Track de-orphaning of '%{public}@']: removing %lu orphaned tracks at paths %{public}@", (uint8_t *)&v46, 0x20u);
  }

  ML3DeleteAssetsAtPaths(v33);
}

- (void)removeTombstonesForDeletedItems
{
}

void __50__ML3MusicLibrary_removeTombstonesForDeletedItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 executeUpdate:@"DELETE FROM item_store WHERE item_pid NOT IN (SELECT item_pid FROM item)"];
  [v2 executeUpdate:@"DELETE FROM item_stats WHERE item_pid NOT IN (SELECT item_pid FROM item)"];
}

- (BOOL)cleanupArtworkWithOptions:(unint64_t)a3 usingConnection:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  if ([(ML3MusicLibrary *)self isHomeSharingLibrary])
  {
    LOBYTE(v7) = 1;
    goto LABEL_15;
  }
  if ((v4 & 2) != 0)
  {
    BOOL v7 = [(ML3MusicLibrary *)self _removeOrphanedArtworkTokensUsingConnection:v6];
    if ((v4 & 4) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    if (v7) {
      BOOL v7 = [(ML3MusicLibrary *)self _removeOrphanedArtworkMetadataUsingConnection:v6];
    }
    goto LABEL_9;
  }
  BOOL v7 = 1;
  if ((v4 & 4) != 0) {
    goto LABEL_7;
  }
LABEL_9:
  if ((v4 & 8) != 0 && v7) {
    BOOL v7 = [(ML3MusicLibrary *)self _removeOrphanedArtworkAssetsUsingConnection:v6];
  }
  if ((v4 & 0x10) != 0 && v7) {
    LOBYTE(v7) = [(ML3MusicLibrary *)self _removeInvalidAvailableArtworkTokensUsingConnection:v6];
  }
LABEL_15:

  return v7;
}

- (BOOL)cleanupArtworkWithOptions:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  if (![(ML3MusicLibrary *)self isHomeSharingLibrary])
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v6 = [v5 fileExistsAtPath:self->_databasePath];

    if (v6)
    {
      int v7 = [(ML3MusicLibrary *)self currentDatabaseVersion];
      if (v7 == 2220020)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __45__ML3MusicLibrary_cleanupArtworkWithOptions___block_invoke;
        v13[3] = &unk_1E5FAFFD8;
        void v13[4] = self;
        void v13[5] = &v14;
        v13[6] = a3;
        [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v13];
        goto LABEL_11;
      }
      uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        databasePath = self->_databasePath;
        *(_DWORD *)stat buf = 67109890;
        int v19 = a3;
        __int16 v20 = 2114;
        id v21 = databasePath;
        __int16 v22 = 1024;
        int v23 = v7;
        __int16 v24 = 1024;
        int v25 = 2220020;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "not cleaning up artwork with options (%d) with database at %{public}@ as current version (%d) is not (%d)", buf, 0x1Eu);
      }
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = self->_databasePath;
        *(_DWORD *)stat buf = 67109378;
        int v19 = a3;
        __int16 v20 = 2114;
        id v21 = v9;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "not cleaning up artwork with options (%d) with database at %{public}@ as file does not exist at this location", buf, 0x12u);
      }
    }
  }
LABEL_11:
  char v11 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __45__ML3MusicLibrary_cleanupArtworkWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) cleanupArtworkWithOptions:*(void *)(a1 + 48) usingConnection:a2];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)hasUserPlaylistsContainingAppleMusicContent
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__ML3MusicLibrary_hasUserPlaylistsContainingAppleMusicContent__block_invoke;
  v4[3] = &unk_1E5FAF9F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __62__ML3MusicLibrary_hasUserPlaylistsContainingAppleMusicContent__block_invoke(uint64_t a1, void *a2)
{
  [a2 executeQuery:@"SELECT 1 FROM container_item JOIN container USING (container_pid) JOIN item_store USING (item_pid) WHERE cloud_status = ? AND NOT is_hidden AND distinguished_kind = ? AND smart_criteria IS NULL AND NOT smart_is_genius AND (NOT cloud_is_subscribed OR is_editable) LIMIT 1" withParameters:&unk_1F090EC38];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 hasAtLeastOneRow];
}

- (BOOL)hasAddedToLibraryAppleMusicContent
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__ML3MusicLibrary_hasAddedToLibraryAppleMusicContent__block_invoke;
  v4[3] = &unk_1E5FAF9F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __53__ML3MusicLibrary_hasAddedToLibraryAppleMusicContent__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 executeQuery:@"SELECT 1 FROM item JOIN item_store USING (item_pid) JOIN item_stats USING (item_pid) WHERE item.in_my_library AND item_store.cloud_status = 8 AND item_stats.liked_state != 2 LIMIT 1"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 hasAtLeastOneRow];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    char v4 = [v5 executeQuery:@"SELECT 1 FROM container WHERE store_cloud_id != 0 AND cloud_is_subscribed AND liked_state != 2 LIMIT 1"];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 hasAtLeastOneRow];
    id v3 = v4;
  }
}

- (BOOL)hasUserPlaylists
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__ML3MusicLibrary_hasUserPlaylists__block_invoke;
  v4[3] = &unk_1E5FAF9F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__ML3MusicLibrary_hasUserPlaylists__block_invoke(uint64_t a1, void *a2)
{
  [a2 executeQuery:@"SELECT 1 FROM container WHERE NOT is_hidden AND distinguished_kind = ? AND smart_criteria IS NULL AND NOT smart_is_genius AND (NOT cloud_is_subscribed OR is_editable) LIMIT 1" withParameters:&unk_1F090EC20];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 hasAtLeastOneRow];
}

- (BOOL)isArtworkTokenAvailable:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v10 = 0;
    char v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke;
    v7[3] = &unk_1E5FB7640;
    id v8 = v4;
    id v9 = &v10;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v7];
    BOOL v5 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  BOOL v5 = [v3 arrayWithObjects:v8 count:1];
  int v6 = [v4 executeQuery:@"SELECT 1 FROM artwork WHERE artwork_token=?" withParameters:v5];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke_2;
  v7[3] = &unk_1E5FB77B8;
  void v7[4] = *(void *)(a1 + 40);
  [v6 enumerateRowsWithBlock:v7];
}

uint64_t __43__ML3MusicLibrary_isArtworkTokenAvailable___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (void)updateBestArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 retrievalTime:(double)a6 usingConnection:(id)a7
{
}

- (void)removeArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 usingConnection:(id)a7
{
}

- (void)removeArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__ML3MusicLibrary_removeArtworkTokenForEntityPersistentID_entityType_artworkType_sourceType___block_invoke;
  v6[3] = &unk_1E5FAFF60;
  void v6[4] = self;
  void v6[5] = a3;
  void v6[6] = a4;
  v6[7] = a5;
  v6[8] = a6;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v6];
}

uint64_t __93__ML3MusicLibrary_removeArtworkTokenForEntityPersistentID_entityType_artworkType_sourceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeArtworkTokenForEntityPersistentID:*(void *)(a1 + 40) entityType:*(void *)(a1 + 48) artworkType:*(void *)(a1 + 56) sourceType:*(void *)(a1 + 64) usingConnection:a2];
}

- (void)importArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7 usingConnection:(id)a8
{
}

- (void)importArtworkTokenForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7
{
  id v12 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__ML3MusicLibrary_importArtworkTokenForEntityPersistentID_entityType_artworkToken_artworkType_sourceType___block_invoke;
  v14[3] = &unk_1E5FAFF38;
  int64_t v16 = a3;
  int64_t v17 = a4;
  void v14[4] = self;
  id v15 = v12;
  int64_t v18 = a6;
  int64_t v19 = a7;
  id v13 = v12;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v14];
}

uint64_t __106__ML3MusicLibrary_importArtworkTokenForEntityPersistentID_entityType_artworkToken_artworkType_sourceType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) importArtworkTokenForEntityPersistentID:*(void *)(a1 + 48) entityType:*(void *)(a1 + 56) artworkToken:*(void *)(a1 + 40) artworkType:*(void *)(a1 + 64) sourceType:*(void *)(a1 + 72) usingConnection:a2];
}

- (void)migrateExistingArtworkToken:(id)a3 newArtworkToken:(id)a4 newSourceType:(int64_t)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  uint32_t v28 = v7;
  if ([v7 length])
  {
    uint64_t v51 = 0;
    uint64_t v52 = &v51;
    uint64_t v53 = 0x3032000000;
    uint64_t v54 = __Block_byref_object_copy__2480;
    uint64_t v55 = __Block_byref_object_dispose__2481;
    id v56 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    id v8 = [MEMORY[0x1E4F1CA48] array];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke;
    v45[3] = &unk_1E5FAFEE8;
    id v9 = v28;
    id v46 = v9;
    uint64_t v48 = &v51;
    uint64_t v49 = v50;
    id v26 = v8;
    id v47 = v26;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v45];
    if ([(id)v52[5] length])
    {
      uint64_t v10 = +[ML3MusicLibrary artworkRelativePathFromToken:v27];
      *(void *)&long long v64 = 0;
      *((void *)&v64 + 1) = &v64;
      uint64_t v65 = 0x2020000000;
      char v66 = 1;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_700;
      v36[3] = &unk_1E5FAFF10;
      id v37 = v26;
      int64_t v42 = &v64;
      id v38 = v27;
      int64_t v44 = a5;
      id v39 = v9;
      long long v40 = self;
      id v43 = v50;
      os_log_t v11 = v10;
      os_log_t v41 = v11;
      [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v36];
      if (*(unsigned char *)(*((void *)&v64 + 1) + 24))
      {
        id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        [(ML3MusicLibrary *)self _allArtworkVariantDirectories];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v63 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(obj);
              }
              int64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              int64_t v17 = [v16 URLByAppendingPathComponent:v52[5]];
              int64_t v18 = [v16 URLByAppendingPathComponent:v11];
              int64_t v19 = [v18 URLByDeletingLastPathComponent];
              __int16 v20 = [v19 path];
              char v21 = [v12 fileExistsAtPath:v20];

              if ((v21 & 1) == 0) {
                [v12 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:0];
              }
              __int16 v22 = [v17 path];
              int v23 = [v12 fileExistsAtPath:v22];

              if (v23)
              {
                id v31 = 0;
                [v12 moveItemAtURL:v17 toURL:v18 error:&v31];
                id v24 = v31;
                if (v24)
                {
                  int v25 = os_log_create("com.apple.amp.medialibrary", "Default");
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)stat buf = 138543874;
                    id v58 = v17;
                    __int16 v59 = 2114;
                    long long v60 = v18;
                    __int16 v61 = 2114;
                    id v62 = v24;
                    _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "Failed to move artwork from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
                  }
                }
                else
                {
                  int v25 = [v18 path];
                  [(ML3MusicLibrary *)self updatePurgeabilityForCachedArtworkWithAbsolutePath:v25];
                }
              }
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v63 count:16];
          }
          while (v13);
        }
      }
      _Block_object_dispose(&v64, 8);
    }
    else
    {
      os_log_t v11 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v64) = 138543362;
        *(void *)((char *)&v64 + 4) = v9;
        _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "Cannot migrate exisitng artwork, no artwork found in database with token %{public}@", (uint8_t *)&v64, 0xCu);
      }
    }

    _Block_object_dispose(v50, 8);
    _Block_object_dispose(&v51, 8);
  }
}

void __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v13[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  BOOL v5 = [v3 executeQuery:@"SELECT relative_path, artwork_type FROM artwork WHERE artwork_token = ?", v4 withParameters];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_2;
  void v10[3] = &unk_1E5FB76A0;
  long long v11 = *(_OWORD *)(a1 + 48);
  [v5 enumerateRowsWithBlock:v10];
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    id v7 = [v3 executeQuery:@"SELECT entity_pid, entity_type, artwork_type FROM artwork_token WHERE artwork_token = ?", v6 withParameters];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_3;
    void v8[3] = &unk_1E5FB83F8;
    id v9 = *(id *)(a1 + 40);
    [v7 enumerateRowsWithBlock:v8];

    BOOL v5 = v7;
  }
}

uint64_t __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_700(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v28 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v33;
    *(void *)&long long v4 = 138543362;
    long long v25 = v4;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v31 = 0;
        char v7 = objc_msgSend(v3, "executeUpdate:withParameters:error:", @"DELETE FROM artwork_token WHERE entity_pid = ? AND entity_type = ? AND artwork_type = ?", v6, &v31, v25);
        id v8 = v31;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v7;
        id v9 = v3;
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = v25;
            id v37 = v8;
            _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Failed to delete from artwork_token table with error: %{public}@", buf, 0xCu);
          }
        }
        long long v11 = *(void **)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 88);
        uint64_t v13 = [v6 objectAtIndexedSubscript:2];
        char v29 = v8;
        uint64_t v14 = (int)[v13 intValue];
        id v15 = [v6 objectAtIndexedSubscript:0];
        uint64_t v16 = [v15 longLongValue];
        int64_t v17 = [v6 objectAtIndexedSubscript:1];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = InsertOrReplaceIntoArtworkToken(v9, v11, v12, v14, v16, (int)[v17 intValue]);

        id v3 = v9;
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v28);
  }

  uint64_t v40 = *(void *)(a1 + 48);
  int64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  id v30 = 0;
  char v19 = [v3 executeUpdate:@"DELETE FROM artwork WHERE artwork_token = ?" withParameters:v18 error:&v30];
  id v20 = v30;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v19;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    char v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = *(void **)(a1 + 48);
      *(_DWORD *)stat buf = 138543618;
      id v37 = v22;
      __int16 v38 = 2114;
      id v39 = v20;
      _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table (token = %{public}@) with error: %{public}@", buf, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 56) _insertArtworkRowWithArtworkToken:*(void *)(a1 + 40) artworkType:*(void *)(*(void *)(*(void *)(a1 + 80) + 8)+ 24) sourceType:*(void *)(a1 + 88) relativePath:*(void *)(a1 + 64) usingConnection:v3];
  uint64_t v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);

  return v23;
}

void __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 stringForColumnIndex:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  int v10 = [v6 intForColumnIndex:1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  *a4 = 1;
}

void __77__ML3MusicLibrary_migrateExistingArtworkToken_newArtworkToken_newSourceType___block_invoke_3(uint64_t a1, void *a2)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  id v3 = a2;
  long long v4 = [v3 objectAtIndexedSubscript:0];
  BOOL v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v8[1] = v5;
  id v6 = [v3 objectAtIndexedSubscript:2];

  void v8[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [v2 addObject:v7];
}

- (BOOL)deleteArtworkToken:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__ML3MusicLibrary_deleteArtworkToken___block_invoke;
    v7[3] = &unk_1E5FB57C0;
    id v9 = self;
    int v10 = &v11;
    id v8 = v4;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v7];
    BOOL v5 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __38__ML3MusicLibrary_deleteArtworkToken___block_invoke(void *a1, void *a2)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v48[0] = a1[4];
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  id v6 = [v3 executeQuery:@"SELECT entity_pid, entity_type, artwork_type FROM artwork_token WHERE artwork_token = ?", v5 withParameters];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __38__ML3MusicLibrary_deleteArtworkToken___block_invoke_2;
  v41[3] = &unk_1E5FB83F8;
  id v7 = v4;
  id v42 = v7;
  [v6 enumerateRowsWithBlock:v41];
  id v40 = 0;
  char v8 = [v3 executeUpdate:@"DELETE FROM artwork_token WHERE artwork_token = ?" withParameters:v5 error:&v40];
  id v9 = v40;
  int v10 = v9;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v8;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v39 = v9;
    char v11 = [v3 executeUpdate:@"DELETE FROM artwork WHERE artwork_token = ?" withParameters:v5 error:&v39];
    id v12 = v39;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v11;
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      os_log_t v13 = (os_log_t)v7;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v29 = v12;
        id v30 = v7;
        id v31 = v6;
        long long v32 = v5;
        obuint64_t j = v13;
        uint64_t v34 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            id v17 = v3;
            if (*(void *)v36 != v34) {
              objc_enumerationMutation(obj);
            }
            int64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            char v19 = (void *)a1[5];
            id v20 = objc_msgSend(v18, "objectAtIndexedSubscript:", 0, v29, v30, v31, v32);
            uint64_t v21 = [v20 longLongValue];
            __int16 v22 = [v18 objectAtIndexedSubscript:1];
            uint64_t v23 = (int)[v22 intValue];
            id v24 = [v18 objectAtIndexedSubscript:2];
            int v25 = [v24 intValue];
            uint64_t v26 = v21;
            id v3 = v17;
            [v19 updateBestArtworkTokenForEntityPersistentID:v26 entityType:v23 artworkType:v25 retrievalTime:v17 usingConnection:0.0];
          }
          os_log_t v13 = obj;
          uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
        }
        while (v15);
        id v6 = v31;
        BOOL v5 = v32;
        id v12 = v29;
        id v7 = v30;
      }
    }
    else
    {
      os_log_t v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = a1[4];
        *(_DWORD *)stat buf = 138543618;
        uint64_t v44 = v28;
        __int16 v45 = 2114;
        id v46 = v12;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table (token = %{public}@) with error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    os_log_t v13 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = a1[4];
      *(_DWORD *)stat buf = 138543618;
      uint64_t v44 = v27;
      __int16 v45 = 2114;
      id v46 = v10;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "Failed to delete from artwork_token table (token = %{public}@) with error: %{public}@", buf, 0x16u);
    }
    id v12 = v10;
  }
}

void __38__ML3MusicLibrary_deleteArtworkToken___block_invoke_2(uint64_t a1, void *a2)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  BOOL v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v8[1] = v5;
  id v6 = [v3 objectAtIndexedSubscript:2];

  void v8[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [v2 addObject:v7];
}

- (BOOL)removeArtworkAssetWithToken:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    uint64_t v21 = 0;
    __int16 v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__2480;
    int v25 = __Block_byref_object_dispose__2481;
    id v26 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke;
    v15[3] = &unk_1E5FAFE98;
    id v5 = v4;
    id v16 = v5;
    id v17 = v27;
    int64_t v18 = &v21;
    char v19 = v20;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v15];
    if ([(id)v22[5] length])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_3;
      void v8[3] = &unk_1E5FAFEC0;
      char v11 = &v28;
      id v9 = v5;
      int v10 = self;
      id v12 = v20;
      os_log_t v13 = v27;
      uint64_t v14 = &v21;
      [(ML3MusicLibrary *)self performDatabaseTransactionWithBlock:v8];
    }
    BOOL v6 = *((unsigned char *)v29 + 24) != 0;

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v10 count:1];
  BOOL v6 = [v4 executeQuery:@"SELECT artwork_source_type, relative_path, artwork_type FROM artwork WHERE artwork_token = ?", v5 withParameters];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_2;
  v7[3] = &unk_1E5FB4FA8;
  long long v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  [v6 enumerateRowsWithBlock:v7];
}

uint64_t __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_3(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v20[0] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v14 = 0;
  char v5 = [v3 executeUpdate:@"DELETE FROM artwork WHERE artwork_token = ?" withParameters:v4 error:&v14];
  id v6 = v14;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 40) _updateBestArtworkTokensForArtworkToken:*(void *)(a1 + 32) artworkType:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) sourceType:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) preserveExistingAvailableToken:0 usingConnection:v3];
    id v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)stat buf = 138543362;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "Explicitly deleting artwork at relative path %{public}@", buf, 0xCu);
    }

    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v9 _deleteAllArtworkVariantsAtRelativePaths:v10];
  }
  else
  {
    int v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)stat buf = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Failed to delete from artwork table (token = %{public}@) with error: %{public}@", buf, 0x16u);
    }
  }

  uint64_t v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v12;
}

void __47__ML3MusicLibrary_removeArtworkAssetWithToken___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  *(void *)(*(void *)(a1[4] + 8) + 24) = (int)[v6 intForColumnIndex:0];
  uint64_t v7 = [v6 stringForColumnIndex:1];
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  int v10 = [v6 intForColumnIndex:2];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v10;
  *a4 = 1;
}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7
{
  return [(ML3MusicLibrary *)self importOriginalArtworkFromImageData:a3 withArtworkToken:a4 artworkType:a5 sourceType:a6 mediaType:*(void *)&a7 shouldPerformColorAnalysis:1];
}

- (void)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  uint64_t v10 = *(void *)&a7;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  uint64_t v15 = (void (**)(id, id))a9;
  id v16 = a3;
  __int16 v17 = NSTemporaryDirectory();
  id v18 = [v17 stringByAppendingPathComponent:@"imagedata.XXXXXX"];

  v28[1] = 0;
  uint64_t v19 = MSVCreateTemporaryFileHandle();
  id v20 = 0;
  v28[0] = 0;
  [v19 writeData:v16 error:v28];

  id v21 = v28[0];
  [v19 closeFile];

  if (v21)
  {
    __int16 v22 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138543362;
      id v30 = v21;
      _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_ERROR, "Failed to write original artwork to temporary path with error: %{public}@", buf, 0xCu);
    }

    if (v15) {
      v15[2](v15, v21);
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __142__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke;
    v25[3] = &unk_1E5FB6ED8;
    id v26 = v20;
    uint64_t v27 = v15;
    [(ML3MusicLibrary *)self importOriginalArtworkFromFileURL:v23 withArtworkToken:v14 artworkType:a5 sourceType:a6 mediaType:v10 shouldPerformColorAnalysis:v9 completion:v25];
  }
}

void __142__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = 0;
  char v6 = [v4 removeItemAtPath:v5 error:&v11];
  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)stat buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "Failed to remove temporary artwork file: '%{public}@'. err = %{public}@", buf, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  if ([v15 length])
  {
    uint64_t v53 = 0;
    uint64_t v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v37 = a8;
    unsigned int v38 = a7;
    int64_t v41 = a6;
    int64_t v42 = a5;
    __int16 v17 = +[ML3MusicLibrary artworkRelativePathFromToken:v15];
    id v18 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v19 = NSString;
    id v20 = [(ML3MusicLibrary *)self originalArtworkDirectory];
    v61[0] = v20;
    v61[1] = v17;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    __int16 v22 = [v19 pathWithComponents:v21];
    uint64_t v23 = [v18 fileURLWithPath:v22 isDirectory:0];

    id v24 = [v23 path];
    LODWORD(v20) = [v16 fileExistsAtPath:v24];

    if (v20)
    {
      int v25 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 138543362;
        id v58 = v15;
        _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEBUG, "Artwork already exists on disk for artwork token %{public}@, ensuring artwork table is consistent", buf, 0xCu);
      }

      BOOL v26 = [(ML3MusicLibrary *)self _insertArtworkRowWithArtworkToken:v15 artworkType:v42 sourceType:v41 relativePath:v17];
      *((unsigned char *)v54 + 24) = v26;
    }
    else
    {
      uint64_t v27 = NSTemporaryDirectory();
      id v40 = [v27 stringByAppendingPathComponent:@"imagedata.XXXXXX"];

      v52[1] = 0;
      uint64_t v28 = MSVCreateTemporaryFileHandle();
      id v39 = 0;
      v52[0] = 0;
      [v28 writeData:v14 error:v52];
      id v29 = v52[0];
      [v28 closeFile];

      if (v29)
      {
        id v30 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138543362;
          id v58 = v29;
          _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_ERROR, "Failed to write original artwork to temporary path with error: %{public}@", buf, 0xCu);
        }
        BOOL v26 = 0;
      }
      else
      {
        dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
        uint64_t v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v39 isDirectory:0];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke;
        v49[3] = &unk_1E5FB6E10;
        uint64_t v51 = &v53;
        id v30 = v31;
        char v50 = v30;
        [(ML3MusicLibrary *)self _convertOriginalArtworkToDevicePreferredFormatFromSourceURL:v32 toDestinationURL:v23 completionHandler:v49];

        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        id v48 = 0;
        LOBYTE(v32) = [v16 removeItemAtPath:v39 error:&v48];
        id v33 = v48;
        if ((v32 & 1) == 0)
        {
          uint64_t v34 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138543618;
            id v58 = v39;
            __int16 v59 = 2114;
            id v60 = v33;
            _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_ERROR, "Failed to remove temporary artwork file: '%{public}@'. err = %{public}@", buf, 0x16u);
          }
        }
        if (*((unsigned char *)v54 + 24)
          && (BOOL v35 = [(ML3MusicLibrary *)self _insertArtworkRowWithArtworkToken:v15 artworkType:v42 sourceType:v41 relativePath:v17], *((unsigned char *)v54 + 24) = v35, v35))
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_684;
          v43[3] = &unk_1E5FAFE70;
          BOOL v47 = v37;
          v43[4] = self;
          id v44 = v23;
          int64_t v46 = v42;
          id v45 = v15;
          [(ML3MusicLibrary *)self _autogenerateArtworkForRelativePath:v17 artworkType:v42 mediaType:v38 completionHandler:v43];

          BOOL v26 = *((unsigned char *)v54 + 24) != 0;
        }
        else
        {
          BOOL v26 = 0;
        }
      }
    }

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

void __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "Failed to convert original artwork with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __131__ML3MusicLibrary_importOriginalArtworkFromImageData_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_684(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  if (a5 && *(unsigned char *)(a1 + 64))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) absoluteString];
    objc_msgSend(v8, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v9, *(void *)(a1 + 56), *(void *)(a1 + 48), 0, a2, a3);
  }
}

- (BOOL)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7
{
  return [(ML3MusicLibrary *)self importOriginalArtworkFromFileURL:a3 withArtworkToken:a4 artworkType:a5 sourceType:a6 mediaType:*(void *)&a7 shouldPerformColorAnalysis:1];
}

- (void)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8 completion:(id)a9
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  __int16 v17 = (void (**)(id, void))a9;
  if ([v16 length])
  {
    unsigned int v32 = a7;
    BOOL v33 = a8;
    id v34 = v15;
    id v18 = +[ML3MusicLibrary artworkRelativePathFromToken:v16];
    uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
    id v20 = NSString;
    id v21 = [(ML3MusicLibrary *)self originalArtworkDirectory];
    v45[0] = v21;
    v45[1] = v18;
    __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    uint64_t v23 = [v20 pathWithComponents:v22];
    id v24 = [v19 fileURLWithPath:v23 isDirectory:0];

    int v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v26 = [v24 path];
    LODWORD(v21) = [v25 fileExistsAtPath:v26];

    if (v21)
    {
      uint64_t v27 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138543362;
        id v44 = v16;
        _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "Artwork already exists on disk for artwork token %{public}@, ensuring artwork table is consistent", buf, 0xCu);
      }

      BOOL v28 = [(ML3MusicLibrary *)self _insertArtworkRowWithArtworkToken:v16 artworkType:a5 sourceType:a6 relativePath:v18];
      id v15 = v34;
      if (v17)
      {
        if (v28)
        {
          v17[2](v17, 0);
        }
        else
        {
          id v30 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)stat buf = 0;
            _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to insert into artwork table", buf, 2u);
          }

          dispatch_semaphore_t v31 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ML3DatabaseErrorDomain", 0, @"Failed to insert row for artwork");
          ((void (**)(id, void *))v17)[2](v17, v31);
        }
      }
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke;
      v35[3] = &unk_1E5FAFE48;
      unsigned int v38 = v17;
      v35[4] = self;
      id v36 = v16;
      int64_t v39 = a5;
      int64_t v40 = a6;
      id v37 = v18;
      unsigned int v41 = v32;
      BOOL v42 = v33;
      id v15 = v34;
      [(ML3MusicLibrary *)self _convertOriginalArtworkToDevicePreferredFormatFromSourceURL:v34 toDestinationURL:v24 completionHandler:v35];
    }
  }
  else if (v17)
  {
    id v29 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ML3DatabaseErrorDomain", 700, @"Cannot import artwork without a valid artwork token");
    ((void (**)(id, void *))v17)[2](v17, v29);
  }
}

void __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)stat buf = 138543618;
      id v20 = v3;
      __int16 v21 = 2114;
      __int16 v22 = v5;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to convert original artwork with error: %{public}@ error=%{public}@", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
  }
  else if ([*(id *)(a1 + 32) _insertArtworkRowWithArtworkToken:*(void *)(a1 + 40) artworkType:*(void *)(a1 + 64) sourceType:*(void *)(a1 + 72) relativePath:*(void *)(a1 + 48)])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(unsigned int *)(a1 + 80);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke_680;
    v14[3] = &unk_1E5FAFE20;
    char v18 = *(unsigned char *)(a1 + 84);
    void v14[4] = v7;
    uint64_t v17 = v8;
    uint64_t v10 = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    [v7 _autogenerateArtworkForRelativePath:v10 artworkType:v8 mediaType:v9 completionHandler:v14];
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to insert into artwork table", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ML3DatabaseErrorDomain", 0, @"Failed to insert row for artwork");
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
  }
}

void __140__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis_completion___block_invoke_680(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if (v9)
  {
    id v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(v9, "msv_description");
      int v16 = 138543618;
      id v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "importOriginalArtworkFromFileURL failed to convert original artwork with error: %{public}@ error=%{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (v10 && *(unsigned char *)(a1 + 64))
  {
    uint64_t v13 = *(void **)(a1 + 32);
    id v14 = [v10 absoluteString];
    objc_msgSend(v13, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v14, *(void *)(a1 + 56), *(void *)(a1 + 40), 0, a4, a5);
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v9);
  }
}

- (BOOL)importOriginalArtworkFromFileURL:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unsigned int)a7 shouldPerformColorAnalysis:(BOOL)a8
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  if ([v15 length])
  {
    uint64_t v40 = 0;
    unsigned int v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    unsigned int v32 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v30 = a8;
    unsigned int v31 = a7;
    int v16 = +[ML3MusicLibrary artworkRelativePathFromToken:v15];
    id v17 = (void *)MEMORY[0x1E4F1CB10];
    __int16 v18 = NSString;
    uint64_t v19 = [(ML3MusicLibrary *)self originalArtworkDirectory];
    v46[0] = v19;
    v46[1] = v16;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    __int16 v21 = [v18 pathWithComponents:v20];
    __int16 v22 = [v17 fileURLWithPath:v21 isDirectory:0];

    uint64_t v23 = [v22 path];
    LODWORD(v19) = [v32 fileExistsAtPath:v23];

    if (v19)
    {
      id v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138543362;
        id v45 = v15;
        _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "Artwork already exists on disk for artwork token %{public}@, ensuring artwork table is consistent", buf, 0xCu);
      }

      BOOL v25 = [(ML3MusicLibrary *)self _insertArtworkRowWithArtworkToken:v15 artworkType:a5 sourceType:a6 relativePath:v16];
      *((unsigned char *)v41 + 24) = v25;
    }
    else
    {
      dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke;
      v37[3] = &unk_1E5FB6E10;
      int64_t v39 = &v40;
      uint64_t v27 = v26;
      unsigned int v38 = v27;
      [(ML3MusicLibrary *)self _convertOriginalArtworkToDevicePreferredFormatFromSourceURL:v14 toDestinationURL:v22 completionHandler:v37];
      dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      if (*((unsigned char *)v41 + 24)
        && (BOOL v28 = [(ML3MusicLibrary *)self _insertArtworkRowWithArtworkToken:v15 artworkType:a5 sourceType:a6 relativePath:v16], *((unsigned char *)v41 + 24) = v28, v28))
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_673;
        void v33[3] = &unk_1E5FAFDF8;
        BOOL v36 = v30;
        void v33[4] = self;
        int64_t v35 = a5;
        id v34 = v15;
        [(ML3MusicLibrary *)self _autogenerateArtworkForRelativePath:v16 artworkType:a5 mediaType:v31 completionHandler:v33];

        BOOL v25 = *((unsigned char *)v41 + 24) != 0;
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

void __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "Failed to convert original artwork with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __129__ML3MusicLibrary_importOriginalArtworkFromFileURL_withArtworkToken_artworkType_sourceType_mediaType_shouldPerformColorAnalysis___block_invoke_673(uint64_t a1, double a2, double a3, uint64_t a4, void *a5)
{
  if (a5 && *(unsigned char *)(a1 + 56))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [a5 absoluteString];
    objc_msgSend(v8, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v9, *(void *)(a1 + 48), *(void *)(a1 + 40), 0, a2, a3);
  }
}

- (BOOL)importExistingOriginalArtworkWithArtworkToken:(id)a3 artworkType:(int64_t)a4 sourceType:(int64_t)a5 mediaType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v25[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([v10 length])
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v12 = +[ML3MusicLibrary artworkRelativePathFromToken:v10];
    uint64_t v13 = NSString;
    id v14 = [(ML3MusicLibrary *)self originalArtworkDirectory];
    v25[0] = v14;
    v25[1] = v12;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    int v16 = [v13 pathWithComponents:v15];

    if ([v11 fileExistsAtPath:v16])
    {
      if ([(ML3MusicLibrary *)self _insertArtworkRowWithArtworkToken:v10 artworkType:a4 sourceType:a5 relativePath:v12])
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        void v20[2] = __98__ML3MusicLibrary_importExistingOriginalArtworkWithArtworkToken_artworkType_sourceType_mediaType___block_invoke;
        v20[3] = &unk_1E5FAFDD0;
        void v20[4] = self;
        int64_t v22 = a4;
        id v21 = v10;
        [(ML3MusicLibrary *)self _autogenerateArtworkForRelativePath:v12 artworkType:a4 mediaType:v6 completionHandler:v20];

        BOOL v17 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      __int16 v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138543362;
        id v24 = v16;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_ERROR, "Original artwork not found at '%{public}@'", buf, 0xCu);
      }
    }
    BOOL v17 = 0;
    goto LABEL_10;
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

void __98__ML3MusicLibrary_importExistingOriginalArtworkWithArtworkToken_artworkType_sourceType_mediaType___block_invoke(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  if (a5)
  {
    uint64_t v8 = (void *)a1[4];
    id v9 = [a5 absoluteString];
    objc_msgSend(v8, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v9, a1[6], a1[5], 0, a2, a3);
  }
}

- (void)performColorAnalysisForArtworkWithConnection:(id)a3 shouldRegenerateColorAnalysis:(BOOL)a4
{
  if (a4) {
    uint64_t v6 = @"SELECT DISTINCT(relative_path), artwork.artwork_type, item.media_type, artwork.artwork_token FROM artwork JOIN artwork_token ON artwork.artwork_token = artwork_token.artwork_token JOIN item ON item_pid = entity_pid";
  }
  else {
    uint64_t v6 = @"SELECT DISTINCT(relative_path), artwork.artwork_type, item.media_type, artwork.artwork_token FROM artwork JOIN artwork_token ON artwork.artwork_token = artwork_token.artwork_token JOIN item ON item_pid = entity_pid WHERE artwork.interest_data IS NULL";
  }
  uint64_t v7 = [a3 executeQuery:v6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __94__ML3MusicLibrary_performColorAnalysisForArtworkWithConnection_shouldRegenerateColorAnalysis___block_invoke;
  void v8[3] = &unk_1E5FB83F8;
  void v8[4] = self;
  [v7 enumerateRowsWithBlock:v8];
}

void __94__ML3MusicLibrary_performColorAnalysisForArtworkWithConnection_shouldRegenerateColorAnalysis___block_invoke(uint64_t a1, void *a2)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 stringForColumnIndex:0];
  uint64_t v5 = (int)[v3 intForColumnIndex:1];
  uint64_t v6 = [v3 intForColumnIndex:2];
  uint64_t v7 = [v3 stringForColumnIndex:3];

  [*(id *)(a1 + 32) _sizeForColorAnalysisForMediaType:v6 artworkType:v5];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v13 = NSString;
  id v14 = [*(id *)(a1 + 32) originalArtworkDirectory];
  v23[0] = v14;
  v23[1] = v4;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  int v16 = [v13 pathWithComponents:v15];
  BOOL v17 = [v12 fileURLWithPath:v16 isDirectory:0];

  __int16 v18 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    int64_t v22 = v7;
    _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "Creating color analysis for artwork token: %{public}@", (uint8_t *)&v21, 0xCu);
  }

  if (v7)
  {
    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v20 = [v17 absoluteString];
    objc_msgSend(v19, "_createColorAnalysisForRelativePath:artworkType:artworkToken:preferredImageSize:completionHandler:", v20, v5, v7, &__block_literal_global_672, v9, v11);
  }
}

void __94__ML3MusicLibrary_performColorAnalysisForArtworkWithConnection_shouldRegenerateColorAnalysis___block_invoke_670(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.medialibrary", "Artwork");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend(v2, "msv_description");
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "_ML3MigrationExecuteDirectives - Color analysis for library artwork is completed error=%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "_ML3MigrationExecuteDirectives - Color analysis for library artwork is completed", (uint8_t *)&v6, 2u);
  }
}

- (void)generateArtworkForRelativePath:(id)a3 sizes:(id)a4 completionHandler:(id)a5
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v7 && [v7 count])
  {
    uint64_t v42 = v8;
    int64_t v9 = +[ML3MusicLibrary devicePreferredImageFormat];
    double v10 = (void *)MEMORY[0x1E4F1CB10];
    double v11 = NSString;
    uint64_t v12 = [(ML3MusicLibrary *)self originalArtworkDirectory];
    v61[0] = v12;
    v61[1] = v46;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    id v14 = [v11 pathWithComponents:v13];
    uint64_t v15 = [v10 fileURLWithPath:v14 isDirectory:0];

    unsigned int v41 = (void *)v15;
    int v16 = (void *)[objc_alloc(MEMORY[0x1E4F77948]) initWithSourceURL:v15];
    uint64_t v17 = MEMORY[0x1E4F1DB30];
    __int16 v18 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 134217984;
      *(void *)&uint8_t buf[4] = [v7 count];
      _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "Generating artwork for sizes: %lu", buf, 0xCu);
    }
    double v20 = *(double *)v17;
    uint64_t v19 = *(void *)(v17 + 8);

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v43 = v7;
    obuint64_t j = v7;
    uint64_t v21 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(obj);
          }
          dispatch_semaphore_t v26 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          *(void *)stat buf = 0;
          *(void *)&buf[8] = 0;
          [v26 getValue:buf];
          uint64_t v27 = (void *)MEMORY[0x1E4F1CB10];
          BOOL v28 = NSString;
          id v29 = -[ML3MusicLibrary artworkCacheDirectoryForSize:](self, "artworkCacheDirectoryForSize:", *(double *)buf, *(double *)&buf[8]);
          v59[0] = v29;
          v59[1] = v46;
          BOOL v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
          unsigned int v31 = [v28 pathWithComponents:v30];
          unsigned int v32 = [v27 fileURLWithPath:v31 isDirectory:0];

          double v33 = *(double *)buf;
          if (v20 >= *(double *)buf)
          {
            double v35 = *(double *)buf;
          }
          else
          {
            uint64_t v19 = *(void *)&buf[8];
            id v34 = v32;

            double v35 = *(double *)buf;
            uint64_t v23 = v34;
            double v20 = v33;
          }
          if (v9) {
            objc_msgSend(v16, "addDestinationWithFormat:size:url:", 2, v32, v35, *(double *)&buf[8]);
          }
          else {
            objc_msgSend(v16, "addJPEGDestinationWithSize:compressionQuality:url:", v32, v35, *(double *)&buf[8], 0.9);
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v22);
    }
    else
    {
      uint64_t v23 = 0;
    }

    id v37 = os_log_create("com.apple.amp.medialibrary", "Artwork");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543618;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = (unint64_t)v20;
      _os_log_impl(&dword_1B022D000, v37, OS_LOG_TYPE_DEFAULT, "Preferred for color analysis: %{public}@ of size %lu", buf, 0x16u);
    }

    unsigned int v38 = [MEMORY[0x1E4F77928] sharedService];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke;
    v47[3] = &unk_1E5FAFDA8;
    id v48 = v16;
    uint64_t v49 = self;
    id v8 = v42;
    double v52 = v20;
    uint64_t v53 = v19;
    id v50 = v23;
    id v51 = v42;
    id v39 = v23;
    id v40 = v16;
    [v38 sendRequest:v40 completionHandler:v47];

    id v7 = v43;
  }
  else if (v8)
  {
    BOOL v36 = objc_msgSend(MEMORY[0x1E4F28C58], "ml_errorWithCode:description:", 1, 0);
    (*((void (**)(id, void *, void, double, double))v8 + 2))(v8, v36, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
}

void __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5FAFD80;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 enumerateDestinationsUsingBlock:v7];
  (*(void (**)(double, double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __74__ML3MusicLibrary_generateArtworkForRelativePath_sizes_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 destinationURL];
  id v6 = [v3 path];

  if (!*(void *)(a1 + 32)
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 fileExistsAtPath:v6],
        v4,
        v5))
  {
    [*(id *)(a1 + 40) updatePurgeabilityForCachedArtworkWithAbsolutePath:v6];
  }
}

- (void)enumerateArtworkRelativePathsWithConnection:(id)a3 matchingRelativePathContainer:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    double v11 = [NSString stringWithFormat:@" WHERE relative_path LIKE \"%@%%\"", v9];
    objc_msgSend(@"SELECT DISTINCT(relative_path), best_artwork_token.artwork_type, media_type FROM item JOIN best_artwork_token ON item_pid = entity_pid AND entity_type = 0 JOIN artwork ON available_artwork_token = artwork_token", "stringByAppendingString:", v11);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = @"SELECT DISTINCT(relative_path), best_artwork_token.artwork_type, media_type FROM item JOIN best_artwork_token ON item_pid = entity_pid AND entity_type = 0 JOIN artwork ON available_artwork_token = artwork_token";
  }
  uint64_t v13 = [v8 executeQuery:v12];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke;
  v21[3] = &unk_1E5FB6438;
  v21[4] = self;
  id v14 = v10;
  id v22 = v14;
  [v13 enumerateRowsWithBlock:v21];

  if (v9)
  {
    uint64_t v15 = [NSString stringWithFormat:@" AND relative_path LIKE \"%@%%\"", v9];
    objc_msgSend(@"SELECT DISTINCT(relative_path), best_artwork_token.artwork_type FROM best_artwork_token JOIN artwork ON available_artwork_token = artwork_token WHERE entity_type IN (2,7)", "stringByAppendingString:", v15);
    int v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v16 = @"SELECT DISTINCT(relative_path), best_artwork_token.artwork_type FROM best_artwork_token JOIN artwork ON available_artwork_token = artwork_token WHERE entity_type IN (2,7)";
  }
  uint64_t v17 = [v8 executeQuery:v16];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke_657;
  v19[3] = &unk_1E5FB6438;
  v19[4] = self;
  id v20 = v14;
  id v18 = v14;
  [v17 enumerateRowsWithBlock:v19];
}

void __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v8 stringForColumnIndex:0];
  uint64_t v10 = (int)[v8 intForColumnIndex:1];
  uint64_t v11 = [v8 intForColumnIndex:2];

  uint64_t v12 = +[ML3ArtworkConfiguration systemConfiguration];
  uint64_t v13 = [v12 sizesToAutogenerateForMediaType:v11 artworkType:v10];

  if (v7)
  {
    id v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error enumerating artwork paths. error=%{public}@", (uint8_t *)&v16, 0x16u);
    }

    *a4 = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __99__ML3MusicLibrary_enumerateArtworkRelativePathsWithConnection_matchingRelativePathContainer_block___block_invoke_657(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v8 stringForColumnIndex:0];
  int v10 = [v8 intForColumnIndex:1];

  uint64_t v11 = v10;
  uint64_t v12 = +[ML3ArtworkConfiguration systemConfiguration];
  uint64_t v13 = [v12 sizesToAutogenerateForMediaType:8 artworkType:v11];

  if (v7)
  {
    id v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error enumerating hero artwork paths. error=%{public}@", (uint8_t *)&v16, 0x16u);
    }

    *a4 = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)autogenerateSupportedSizesForAllOriginalArtworkWithConnection:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__2480;
  v19[4] = __Block_byref_object_dispose__2481;
  id v20 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke;
  v15[3] = &unk_1E5FAFD30;
  id v9 = v8;
  int v16 = v9;
  uint64_t v17 = self;
  __int16 v18 = v19;
  [(ML3MusicLibrary *)self enumerateArtworkRelativePathsWithConnection:v6 matchingRelativePathContainer:0 block:v15];
  int v10 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_3;
  block[3] = &unk_1E5FAFD58;
  id v13 = v7;
  id v14 = v19;
  id v11 = v7;
  dispatch_group_notify(v9, v10, block);

  _Block_object_dispose(v19, 8);
}

void __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(NSObject **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  dispatch_group_enter(v5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5FAFD08;
  dispatch_group_t v8 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 32);
  [v8 generateArtworkForRelativePath:v7 sizes:v6 completionHandler:v9];
}

uint64_t __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void __99__ML3MusicLibrary_autogenerateSupportedSizesForAllOriginalArtworkWithConnection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (int64_t)deleteAutoFilledTracksOfAtLeastTotalSize:(int64_t)a3
{
  return [(ML3MusicLibrary *)self clearPurgeableStorageAmount:a3 withUrgency:2];
}

- (int64_t)autoFilledTracksTotalSize
{
  return [(ML3MusicLibrary *)self purgeableStorageSizeWithUrgency:2];
}

- (void)removePlaylistsWithPersistentIDs:(id)a3 fromSource:(int)a4 usingConnection:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  serialQueue = self->_serialQueue;
  id v13 = a6;
  dispatch_assert_queue_not_V2(serialQueue);
  id v14 = +[MLMediaLibraryService sharedMediaLibraryService];
  uint64_t v15 = (void *)MEMORY[0x1E4F1CA60];
  int v16 = [NSNumber numberWithInt:v8];
  uint64_t v17 = [v15 dictionaryWithObject:v16 forKey:@"MLDatabaseOperationAttributeTrackSourceKey"];

  if (v10) {
    [v17 setObject:v10 forKey:@"MLDatabaseOperationAttributePersistentIDsArrayKey"];
  }
  __int16 v18 = (void *)MEMORY[0x1E4F1CA60];
  id v19 = [(ML3MusicLibrary *)self databasePath];
  id v20 = [v18 dictionaryWithObject:v19 forKey:@"MLDatabaseOperationOptionDatabasePathKey"];

  if (v11 && [v11 isInTransaction])
  {
    uint64_t v21 = [v11 currentTransactionID];
    [v20 setObject:v21 forKey:@"MLDatabaseOperationOptionTransactionIdentifierKey"];
  }
  id v22 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543874;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    dispatch_semaphore_t v26 = v17;
    __int16 v27 = 2114;
    BOOL v28 = v20;
    _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "Sending remove playlists request to %{public}@. Attributes: %{public}@, options: %{public}@", (uint8_t *)&v23, 0x20u);
  }

  [v14 performDatabaseOperation:6 withAttributes:v17 options:v20 completionHandler:v13];
}

- (void)removeCloudSourcesWithAttributes:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  serialQueue = self->_serialQueue;
  id v8 = a4;
  dispatch_assert_queue_not_V2(serialQueue);
  id v9 = +[MLMediaLibraryService sharedMediaLibraryService];
  id v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = [(ML3MusicLibrary *)self databasePath];
  uint64_t v12 = [v10 dictionaryWithObject:v11 forKey:@"MLDatabaseOperationOptionDatabasePathKey"];

  id v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v12;
    _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Sending remove tracks request to %{public}@. Attributes: %{public}@, options: %{public}@", (uint8_t *)&v14, 0x20u);
  }

  [v9 performDatabaseOperation:9 withAttributes:v6 options:v12 completionHandler:v8];
}

- (void)removeTracksWithPersistentIDs:(id)a3 fromSource:(int)a4 usingConnection:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  serialQueue = self->_serialQueue;
  id v13 = a6;
  dispatch_assert_queue_not_V2(serialQueue);
  int v14 = +[MLMediaLibraryService sharedMediaLibraryService];
  uint64_t v15 = (void *)MEMORY[0x1E4F1CA60];
  __int16 v16 = [NSNumber numberWithInt:v8];
  id v17 = [v15 dictionaryWithObject:v16 forKey:@"MLDatabaseOperationAttributeTrackSourceKey"];

  if (v10) {
    [v17 setObject:v10 forKey:@"MLDatabaseOperationAttributePersistentIDsArrayKey"];
  }
  __int16 v18 = (void *)MEMORY[0x1E4F1CA60];
  id v19 = [(ML3MusicLibrary *)self databasePath];
  uint64_t v20 = [v18 dictionaryWithObject:v19 forKey:@"MLDatabaseOperationOptionDatabasePathKey"];

  if (v11 && [v11 isInTransaction])
  {
    uint64_t v21 = [v11 currentTransactionID];
    [v20 setObject:v21 forKey:@"MLDatabaseOperationOptionTransactionIdentifierKey"];
  }
  id v22 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543874;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    dispatch_semaphore_t v26 = v17;
    __int16 v27 = 2114;
    BOOL v28 = v20;
    _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "Sending remove tracks request to %{public}@. Attributes: %{public}@, options: %{public}@", (uint8_t *)&v23, 0x20u);
  }

  [v14 performDatabaseOperation:3 withAttributes:v17 options:v20 completionHandler:v13];
}

- (void)removeTracksWithPersistentIDs:(id)a3 fromSource:(int)a4 withCompletionHandler:(id)a5
{
}

- (void)removeSource:(int)a3 usingConnection:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)removeSource:(int)a3 withCompletionHandler:(id)a4
{
}

- (unint64_t)countOfChangedPersistentIdsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  dispatch_semaphore_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = @"SELECT COUNT() FROM entity_revision WHERE revision > ? ";
  }
  else
  {
    [@"SELECT COUNT() FROM entity_revision WHERE revision > ? " stringByAppendingString:@" AND class = ? "];
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5 <= 2)
  {
    uint64_t v10 = [(__CFString *)v9 stringByAppendingString:@" AND revision_type <= ? "];

    id v9 = (__CFString *)v10;
  }
  id v11 = [(__CFString *)v9 stringByAppendingString:@";"];

  uint64_t v12 = [NSNumber numberWithLongLong:a3];
  v29[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  int v14 = (void *)[v13 mutableCopy];

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
    [v14 addObject:v15];
  }
  if (v5 <= 2)
  {
    __int16 v16 = [NSNumber numberWithUnsignedInt:v5];
    [v14 addObject:v16];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __101__ML3MusicLibrary_countOfChangedPersistentIdsAfterRevision_revisionTrackingCode_maximumRevisionType___block_invoke;
  v21[3] = &unk_1E5FB57C0;
  uint64_t v24 = &v25;
  id v17 = v11;
  id v22 = v17;
  id v18 = v14;
  id v23 = v18;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v21];
  unint64_t v19 = v26[3];

  _Block_object_dispose(&v25, 8);
  return v19;
}

void __101__ML3MusicLibrary_countOfChangedPersistentIdsAfterRevision_revisionTrackingCode_maximumRevisionType___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 executeQuery:a1[4] withParameters:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v3 int64ValueForFirstRowAndColumn];
}

- (BOOL)persistentID:(int64_t)a3 changedAfterRevision:(int64_t)a4 revisionTrackingCode:(int64_t)a5
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ML3MusicLibrary_persistentID_changedAfterRevision_revisionTrackingCode___block_invoke;
  v7[3] = &unk_1E5FAFCE0;
  v7[6] = a5;
  v7[7] = a4;
  void v7[4] = &v8;
  void v7[5] = a3;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __74__ML3MusicLibrary_persistentID_changedAfterRevision_revisionTrackingCode___block_invoke(void *a1, void *a2)
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v6 = [v3 numberWithLongLong:v4];
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", a1[6], v6);
  v11[1] = v7;
  uint64_t v8 = [NSNumber numberWithLongLong:a1[7]];
  v11[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v10 = [v5 executeQuery:@"SELECT 1 FROM entity_revision WHERE entity_pid = ? AND class = ? AND revision > ? " withParameters:v9];

  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = [v10 hasAtLeastOneRow];
}

- (void)getChangedPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(int64_t)a4 maximumRevisionType:(int)a5 usingBlock:(id)a6
{
  uint64_t v10 = (void (**)(id, uint64_t, uint64_t))a6;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 32;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v20 = malloc_type_malloc(0x100uLL, 0x100004000313F17uLL);
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke;
  v11[3] = &unk_1E5FAFCB8;
  int v12 = a5;
  v11[7] = a3;
  v11[8] = a4;
  void v11[4] = v21;
  v11[5] = &v13;
  v11[6] = &v17;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v11];
  v10[2](v10, v18[3], v14[3]);
  free((void *)v18[3]);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
}

void __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(@"SELECT entity_pid, class FROM entity_revision WHERE revision > ?", "mutableCopy");
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, 0);

  if (*(_DWORD *)(a1 + 72) <= 2u)
  {
    [v4 appendString:@" AND revision_type <= ? "];
    uint64_t v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
    [v7 addObject:v8];
  }
  [v4 appendString:@";"];
  id v9 = [v3 executeQuery:v4 withParameters:v7];

  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2;
  v13[3] = &unk_1E5FAFC90;
  uint64_t v11 = *(void *)(a1 + 64);
  id v14 = v10;
  long long v15 = *(_OWORD *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = v11;
  id v12 = v10;
  [v9 enumerateRowsWithBlock:v13];
}

void __108__ML3MusicLibrary_getChangedPersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64ForColumnIndex:0];
  int v5 = [v3 intForColumnIndex:1];

  if (*(void *)(a1 + 64) == v5)
  {
    uint64_t v9 = [NSNumber numberWithLongLong:v4];
    if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v9];
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v7 = *(void *)(v6 + 24);
      unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v7 <= v8)
      {
        *(void *)(v6 + 24) = 2 * v7 + 2;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = malloc_type_realloc(*(void **)(*(void *)(*(void *)(a1 + 56) + 8)+ 24), 8* *(void *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 24), 0x100004000313F17uLL);
        unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 8 * v8) = v4;
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    MEMORY[0x1F4181820]();
  }
}

- (void)enumerateAlbumPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 usingBlock:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  unint64_t v8 = [NSNumber numberWithLongLong:a3];
  v17[0] = v8;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", +[ML3Album revisionTrackingCode](ML3Album, "revisionTrackingCode"));
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke;
  v13[3] = &unk_1E5FB6460;
  id v14 = @"SELECT entity_pid, revision, revision_type, deleted, representative_item_pid, liked_state FROM entity_revision LEFT JOIN album ON album.album_pid=entity_revision.entity_pid WHERE revision > ? AND class = ?;";
  id v15 = v10;
  id v16 = v7;
  id v11 = v7;
  id v12 = v10;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v13];
}

void __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 executeQuery:*(void *)(a1 + 32) withParameters:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5FB26C0;
  id v5 = *(id *)(a1 + 48);
  [v3 enumerateRowsWithBlock:v4];
}

uint64_t __92__ML3MusicLibrary_enumerateAlbumPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 int64ForColumnIndex:0];
  [v3 int64ForColumnIndex:1];
  [v3 int64ForColumnIndex:2];
  [v3 int64ForColumnIndex:3];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)enumerateAlbumArtistPersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 usingBlock:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  unint64_t v8 = [NSNumber numberWithLongLong:a3];
  v17[0] = v8;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", +[ML3AlbumArtist revisionTrackingCode](ML3AlbumArtist, "revisionTrackingCode"));
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke;
  v13[3] = &unk_1E5FB6460;
  id v14 = @"SELECT entity_pid, revision, revision_type, deleted, representative_item_pid, liked_state FROM entity_revision LEFT JOIN album_artist ON album_artist.album_artist_pid=entity_revision.entity_pid WHERE revision > ? AND class = ?;";
  id v15 = v10;
  id v16 = v7;
  id v11 = v7;
  id v12 = v10;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v13];
}

void __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 executeQuery:*(void *)(a1 + 32) withParameters:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5FB26C0;
  id v5 = *(id *)(a1 + 48);
  [v3 enumerateRowsWithBlock:v4];
}

uint64_t __98__ML3MusicLibrary_enumerateAlbumArtistPersistentIDsAfterRevision_revisionTrackingCode_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 int64ForColumnIndex:0];
  [v3 int64ForColumnIndex:1];
  [v3 int64ForColumnIndex:2];
  [v3 int64ForColumnIndex:3];
  [v3 int64ForColumnIndex:4];
  [v3 intForColumnIndex:5];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)enumeratePersistentIDsAfterRevision:(int64_t)a3 revisionTrackingCode:(unint64_t)a4 maximumRevisionType:(int)a5 usingBlock:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = @"SELECT entity_pid, revision, deleted, class FROM entity_revision WHERE revision > ? ";
  }
  else
  {
    objc_msgSend(@"SELECT entity_pid, revision, deleted, class FROM entity_revision WHERE revision > ? ", "stringByAppendingString:", @" AND class = ? ");
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v6 <= 2)
  {
    uint64_t v12 = [(__CFString *)v11 stringByAppendingString:@" AND revision_type <= ? "];

    id v11 = (__CFString *)v12;
  }
  uint64_t v13 = [(__CFString *)v11 stringByAppendingString:@";"];

  id v14 = [NSNumber numberWithLongLong:a3];
  v26[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v16 = (void *)[v15 mutableCopy];

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:a4];
    [v16 addObject:v17];
  }
  if (v6 <= 2)
  {
    id v18 = [NSNumber numberWithUnsignedInt:v6];
    [v16 addObject:v18];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke;
  void v22[3] = &unk_1E5FB6460;
  id v23 = v13;
  id v24 = v16;
  id v25 = v10;
  id v19 = v10;
  id v20 = v16;
  id v21 = v13;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v22];
}

void __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 executeQuery:*(void *)(a1 + 32) withParameters:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2;
  v4[3] = &unk_1E5FB26C0;
  id v5 = *(id *)(a1 + 48);
  [v3 enumerateRowsWithBlock:v4];
}

uint64_t __107__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 int64ForColumnIndex:0];
  [v3 int64ForColumnIndex:1];
  [v3 int64ForColumnIndex:2];
  [v3 intForColumnIndex:3];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

uint64_t __136__ML3MusicLibrary_enumeratePersistentIDsAfterRevision_revisionTrackingCode_maximumRevisionType_forMediaTypes_inUsersLibrary_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 int64ForColumnIndex:0];
  [v3 int64ForColumnIndex:1];
  [v3 int64ForColumnIndex:2];
  [v3 int64ForColumnIndex:3];
  [v3 intForColumnIndex:4];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (BOOL)updateSortMap
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__ML3MusicLibrary_updateSortMap__block_invoke;
  v4[3] = &unk_1E5FB7640;
  void v4[4] = self;
  void v4[5] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__ML3MusicLibrary_updateSortMap__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) updateSortMapOnConnection:a2 forceUpdateOriginals:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)requiresNonSchemaUpdatesOnConnection:(id)a3
{
  id v3 = a3;
  if ([v3 databasePathExists])
  {
    if ([v3 tableExists:@"_MLDatabaseProperties"])
    {
      if (+[ML3MusicLibrary orderingLanguageMatchesSystemUsingConnection:v3])
      {
        uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v5 = GetP7BPath();
        int v6 = [v4 fileExistsAtPath:v5];

        if (v6)
        {
          uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v19 = 0;
            char v8 = "Requires pre-processing because of integrity";
            uint64_t v9 = (uint8_t *)&v19;
LABEL_13:
            _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
          }
        }
        else
        {
          if ([v3 tableExists:@"sort_map"])
          {
            uint64_t v12 = [v3 executeQuery:@"SELECT rowid FROM sort_map WHERE name='' AND name_order != 0"];
            int v13 = [v12 hasAtLeastOneRow];

            if (v13)
            {
              uint64_t v7 = _ML3LogCategoryDefault();
              if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_14;
              }
              __int16 v18 = 0;
              char v8 = "Requires pre-processing because of invalid sort_map entries";
              uint64_t v9 = (uint8_t *)&v18;
              goto LABEL_13;
            }
          }
          id v14 = [NSString stringWithFormat:@"SELECT value FROM _MLDatabaseProperties WHERE key = '%@'", @"_UUID"];
          id v15 = [v3 executeQuery:v14];
          char v16 = [v15 hasAtLeastOneRow];

          if (v16)
          {
            BOOL v10 = 0;
            goto LABEL_15;
          }
          uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v17 = 0;
            char v8 = "Requires pre-processing because of missing database UID";
            uint64_t v9 = (uint8_t *)&v17;
            goto LABEL_13;
          }
        }
      }
      else
      {
        uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          char v8 = "Requires pre-processing because of a language mismatch";
          uint64_t v9 = buf;
          goto LABEL_13;
        }
      }
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = 0;
        char v8 = "Requires pre-processing because database properties table does not exist";
        uint64_t v9 = (uint8_t *)&v21;
        goto LABEL_13;
      }
    }
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = 0;
      char v8 = "Requires pre-processing because database does not yet exist";
      uint64_t v9 = (uint8_t *)&v22;
      goto LABEL_13;
    }
  }
LABEL_14:

  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)requiresSchemaOnlyUpdatesOnConnection:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[ML3MusicLibrary userVersionMatchesSystemUsingConnection:v3])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v4 = +[ML3MusicLibrary allTables];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      obuint64_t j = v4;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(NSString, "stringWithFormat:", @"SELECT COUNT(name) FROM sqlite_master WHERE type='table' AND name = '%@';",
          BOOL v10 = v9);
          id v11 = [v3 executeQuery:v10];
          uint64_t v12 = [v11 int64ValueForFirstRowAndColumn];

          if (!v12)
          {
            id v14 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 138543362;
              uint64_t v22 = v9;
              _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Requires schema upgrade because database is missing table %{public}@", buf, 0xCu);
            }

            BOOL v13 = 1;
            uint64_t v4 = obj;
            goto LABEL_17;
          }
        }
        uint64_t v4 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "Requires schema upgrade because of a version mismatch", buf, 2u);
    }
    BOOL v13 = 1;
  }
LABEL_17:

  return v13;
}

- (id)_getPlaylistContentTasteChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, *(void *)&a4);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke;
  v15[3] = &unk_1E5FAF9F0;
  void v15[4] = v16;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v15];
  int64_t v7 = +[ML3Container revisionTrackingCode];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke_2;
  v12[3] = &unk_1E5FAFBF8;
  id v14 = v16;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  [(ML3MusicLibrary *)self enumeratePersistentIDsAfterRevision:a3 revisionTrackingCode:v7 maximumRevisionType:3 forMediaTypes:0 inUsersLibrary:1 usingBlock:v12];
  uint64_t v9 = v13;
  id v10 = v8;

  _Block_object_dispose(v16, 8);

  return v10;
}

void __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 executeQuery:@"SELECT primary_container_pid FROM db_info"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ValueForFirstRowAndColumn];
}

void __77__ML3MusicLibrary__getPlaylistContentTasteChangesSinceRevision_withGrappaID___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  void v28[4] = *MEMORY[0x1E4F143B8];
  if (a4 == 1 && *(void *)(*(void *)(a1[6] + 8) + 24) != a2)
  {
    id v6 = +[ML3Entity newWithPersistentID:a2 inLibrary:a1[4]];
    int64_t v7 = @"is_hidden";
    v28[0] = @"is_hidden";
    id v8 = @"sync_id";
    v28[1] = @"sync_id";
    uint64_t v9 = @"liked_state";
    id v28[2] = @"liked_state";
    id v10 = @"liked_state_changed_date";
    v28[3] = @"liked_state_changed_date";
    MEMORY[0x1F4188790](v10);
    long long v22 = 0u;
    long long v23 = 0u;
    [v6 getValues:&v22 forProperties:v28 count:4];
    if ([(id)v22 BOOLValue])
    {
      id v11 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)stat buf = 134217984;
      uint64_t v27 = a2;
      uint64_t v12 = "Skip reverse syncing dynamic change for playlist persistentID=%lld as it's hidden";
    }
    else
    {
      if (*((void *)&v22 + 1))
      {
        uint64_t v13 = [*((id *)&v22 + 1) longLongValue];
        if (v13)
        {
          uint64_t v14 = v13;
          v25[0] = v23;
          v24[0] = @"likedState";
          v24[1] = @"likedMacOSDate";
          id v15 = NSNumber;
          [*((id *)&v23 + 1) doubleValue];
          long long v17 = [v15 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(v16)];
          v25[1] = v17;
          v24[2] = @"persistentID";
          long long v18 = [NSNumber numberWithLongLong:v14];
          v25[2] = v18;
          id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

          long long v19 = (void *)a1[5];
          long long v20 = [NSNumber numberWithLongLong:v14];
          [v19 setObject:v11 forKey:v20];

          goto LABEL_12;
        }
      }
      id v11 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        for (uint64_t i = 3; i != -1; --i)
        return;
      }
      *(_DWORD *)stat buf = 134217984;
      uint64_t v27 = a2;
      uint64_t v12 = "Skip reverse syncing dynamic change for playlist persistentID=%lld as syncID is 0";
    }
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    goto LABEL_12;
  }
}

- (id)getAlbumChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2480;
  uint64_t v14 = __Block_byref_object_dispose__2481;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, *(void *)&a4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v6 = +[ML3Album revisionTrackingCode];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __61__ML3MusicLibrary_getAlbumChangesSinceRevision_withGrappaID___block_invoke;
  v9[3] = &unk_1E5FAFBD0;
  void v9[4] = self;
  void v9[5] = &v10;
  [(ML3MusicLibrary *)self enumeratePersistentIDsAfterRevision:a3 revisionTrackingCode:v6 maximumRevisionType:3 forMediaTypes:0 inUsersLibrary:1 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __61__ML3MusicLibrary_getAlbumChangesSinceRevision_withGrappaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void v33[3] = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    os_log_t v7 = +[ML3Entity newWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
    id v8 = @"liked_state";
    v33[0] = @"liked_state";
    uint64_t v9 = @"liked_state_changed_date";
    v33[1] = @"liked_state_changed_date";
    uint64_t v10 = @"sync_id";
    v33[2] = @"sync_id";
    MEMORY[0x1F4188790](v10);
    uint64_t v22 = 0;
    id v23 = 0;
    id v24 = 0;
    [v7 getValues:&v22 forProperties:v33 count:3];
    if (v24 && (uint64_t v11 = [v24 longLongValue]) != 0)
    {
      uint64_t v12 = v11;
      v32[0] = v22;
      v31[0] = @"likedState";
      v31[1] = @"likedMacOSDate";
      uint64_t v13 = NSNumber;
      [v23 doubleValue];
      id v15 = [v13 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(v14)];
      v32[1] = v15;
      v31[2] = @"persistentID";
      CFAbsoluteTime v16 = [NSNumber numberWithLongLong:v12];
      v32[2] = v16;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

      long long v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      long long v19 = [NSNumber numberWithLongLong:v12];
      [v18 setObject:v17 forKey:v19];
    }
    else
    {
      long long v17 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 67109632;
        int v26 = 1;
        __int16 v27 = 2048;
        uint64_t v28 = a3;
        __int16 v29 = 2048;
        uint64_t v30 = a2;
        _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing dynamic revision type=%d, revision=%lld album changes for pid=%lld as it's missing the syncID", buf, 0x1Cu);
      }
    }

    for (uint64_t i = 2; i != -1; --i)
  }
  else
  {
    os_log_t v7 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109632;
      int v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = a3;
      __int16 v29 = 2048;
      uint64_t v30 = a2;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing non dynamic revision type=%d, revision=%lld album changes for pid=%lld", buf, 0x1Cu);
    }
  }
}

- (id)getAlbumChanges
{
  return [(ML3MusicLibrary *)self getAlbumChangesSinceRevision:0 withGrappaID:0];
}

- (id)getAlbumArtistChangesSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2480;
  CFAbsoluteTime v14 = __Block_byref_object_dispose__2481;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, *(void *)&a4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v6 = +[ML3AlbumArtist revisionTrackingCode];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __67__ML3MusicLibrary_getAlbumArtistChangesSinceRevision_withGrappaID___block_invoke;
  v9[3] = &unk_1E5FAFBD0;
  void v9[4] = self;
  void v9[5] = &v10;
  [(ML3MusicLibrary *)self enumeratePersistentIDsAfterRevision:a3 revisionTrackingCode:v6 maximumRevisionType:3 forMediaTypes:0 inUsersLibrary:1 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __67__ML3MusicLibrary_getAlbumArtistChangesSinceRevision_withGrappaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void v33[3] = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    os_log_t v7 = +[ML3Entity newWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
    id v8 = @"liked_state";
    v33[0] = @"liked_state";
    uint64_t v9 = @"liked_state_changed_date";
    v33[1] = @"liked_state_changed_date";
    uint64_t v10 = @"sync_id";
    v33[2] = @"sync_id";
    MEMORY[0x1F4188790](v10);
    uint64_t v22 = 0;
    id v23 = 0;
    id v24 = 0;
    [v7 getValues:&v22 forProperties:v33 count:3];
    if (v24 && (uint64_t v11 = [v24 longLongValue]) != 0)
    {
      uint64_t v12 = v11;
      v32[0] = v22;
      v31[0] = @"likedState";
      v31[1] = @"likedMacOSDate";
      uint64_t v13 = NSNumber;
      [v23 doubleValue];
      id v15 = [v13 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(v14)];
      v32[1] = v15;
      v31[2] = @"persistentID";
      CFAbsoluteTime v16 = [NSNumber numberWithLongLong:v12];
      v32[2] = v16;
      long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

      long long v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      long long v19 = [NSNumber numberWithLongLong:v12];
      [v18 setObject:v17 forKey:v19];
    }
    else
    {
      long long v17 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 67109632;
        int v26 = 1;
        __int16 v27 = 2048;
        uint64_t v28 = a3;
        __int16 v29 = 2048;
        uint64_t v30 = a2;
        _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing dynamic revision type=%d, revision=%lld album artist changes for pid=%lld as it's missing the syncID", buf, 0x1Cu);
      }
    }

    for (uint64_t i = 2; i != -1; --i)
  }
  else
  {
    os_log_t v7 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109632;
      int v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = a3;
      __int16 v29 = 2048;
      uint64_t v30 = a2;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Skip reverse syncing non dynamic revision type=%d, revision=%lld album artist changes for pid=%lld", buf, 0x1Cu);
    }
  }
}

- (id)getAlbumArtistChanges
{
  return [(ML3MusicLibrary *)self getAlbumArtistChangesSinceRevision:0 withGrappaID:0];
}

- (void)savePlaylistsSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  void v24[3] = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke;
  void v23[3] = &unk_1E5FAF9F0;
  v23[4] = v24;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v23];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  CFAbsoluteTime v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  int64_t v8 = +[ML3Container revisionTrackingCode];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_2;
  v13[3] = &unk_1E5FAFB80;
  void v13[7] = &v15;
  v13[8] = a2;
  void v13[4] = self;
  void v13[5] = v24;
  v13[6] = &v19;
  unsigned int v14 = a4;
  [(ML3MusicLibrary *)self enumeratePersistentIDsAfterRevision:a3 revisionTrackingCode:v8 maximumRevisionType:3 forMediaTypes:0 inUsersLibrary:1 usingBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_514;
  v11[3] = &unk_1E5FAFBA8;
  void v11[4] = self;
  unsigned int v12 = a4;
  uint64_t v9 = MEMORY[0x1B3E93EE0](v11);
  uint64_t v10 = (void (**)(void, void))v9;
  if (*((unsigned char *)v20 + 24) || *((unsigned char *)v16 + 24))
  {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 5);
    v10[2](v10, 3);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v24, 8);
}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 executeQuery:@"SELECT primary_container_pid FROM db_info"];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ValueForFirstRowAndColumn];
}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, int a5)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  if (a5 != 2 && *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != a2)
  {
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v105 = 134218496;
      *(void *)&v105[4] = a2;
      *(_WORD *)&v105[12] = 2048;
      *(void *)&v105[14] = a3;
      *(_WORD *)&v105[22] = 1024;
      LODWORD(v106) = a5;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Saving updated container data. container_pid=%lld, revision=%lld, deletionType=%d", v105, 0x1Cu);
    }

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned int v12 = [NSNumber numberWithLongLong:a2];
    [v11 setObject:v12 forKey:@"playlistPersistentID"];

    if (a5)
    {
      if (a5 != 1)
      {
        uint64_t v15 = 0;
LABEL_42:
        uint64_t v63 = +[ML3MusicLibrary pathForResourceFileOrFolder:7];
        id v94 = 0;
        uint64_t v64 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v63, @"%llu", &v94, a2);
        id v65 = v94;

        if (v65)
        {
          v70 = [MEMORY[0x1E4F28B00] currentHandler];
          [v70 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"ML3MusicLibrary.m", 1901, @"Encountered error validating format. pathFormat=%@ error=%@", v63, v65 object file lineNumber description];
        }
        uint64_t v15 = (__CFString *)v64;
LABEL_45:
        id v93 = 0;
        char v66 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:100 options:0 error:&v93];
        id v67 = v93;
        if (v66)
        {
          if (WriteDictionaryToPathWithGrappaID(v11, v15, *(unsigned int *)(a1 + 72)))
          {
LABEL_54:

LABEL_55:
            return;
          }
        }
        else
        {
          long long v68 = os_log_create("com.apple.amp.medialibrary", "Library");
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long v105 = 138543618;
            *(void *)&v105[4] = v15;
            *(_WORD *)&v105[12] = 2114;
            *(void *)&v105[14] = v67;
            _os_log_impl(&dword_1B022D000, v68, OS_LOG_TYPE_ERROR, "Could not serialize plist: %{public}@ (%{public}@)", v105, 0x16u);
          }
        }
        long long v69 = os_log_create("com.apple.amp.medialibrary", "Library");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v105 = 136446722;
          *(void *)&v105[4] = "-[ML3MusicLibrary savePlaylistsSinceRevision:withGrappaID:]_block_invoke";
          *(_WORD *)&v105[12] = 2114;
          *(void *)&v105[14] = v67;
          *(_WORD *)&v105[22] = 2114;
          long long v106 = v15;
          _os_log_impl(&dword_1B022D000, v69, OS_LOG_TYPE_ERROR, "%{public}s failed with error %{public}@ path = %{public}@\n", v105, 0x20u);
        }

        goto LABEL_54;
      }
      uint64_t v13 = [NSNumber numberWithBool:1];
      [v11 setValue:v13 forKey:@"playlistDeleted"];

      unsigned int v14 = +[ML3MusicLibrary pathForResourceFileOrFolder:7];
      id v97 = 0;
      objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, @"%llu", &v97, a2);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v16 = v97;
      if (v16)
      {
        uint64_t v71 = [MEMORY[0x1E4F28B00] currentHandler];
        [v71 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"ML3MusicLibrary.m", 1767, @"Encountered error validating format. pathFormat=%@ error=%@", v14, v16 object file lineNumber description];
      }
    }
    else
    {
      id v17 = +[ML3Entity newWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
      char v18 = @"filepath";
      *(void *)long long v105 = @"filepath";
      uint64_t v19 = @"is_ignored_syncing";
      *(void *)&v105[8] = @"is_ignored_syncing";
      long long v20 = @"date_modified";
      *(void *)&v105[16] = @"date_modified";
      uint64_t v21 = @"orig_date_modified";
      long long v106 = @"orig_date_modified";
      char v22 = @"smart_is_genius";
      long long v107 = @"smart_is_genius";
      id v23 = @"smart_is_dynamic";
      v108 = @"smart_is_dynamic";
      id v24 = @"container_type";
      id v109 = @"container_type";
      id v25 = @"container_seed.item_pid";
      long long v110 = @"container_seed.item_pid";
      int v26 = @"name";
      long long v111 = @"name";
      __int16 v27 = @"distinguished_kind";
      long long v112 = @"distinguished_kind";
      uint64_t v28 = @"is_hidden";
      long long v113 = @"is_hidden";
      __int16 v29 = @"liked_state";
      id v114 = @"liked_state";
      uint64_t v30 = @"description";
      long long v115 = @"description";
      unsigned int v31 = @"parent_pid";
      long long v116 = @"parent_pid";
      unsigned int v32 = @"external_vendor_identifier";
      long long v117 = @"external_vendor_identifier";
      double v33 = @"external_vendor_display_name";
      long long v118 = @"external_vendor_display_name";
      id v34 = @"external_vendor_container_tag";
      v119 = @"external_vendor_container_tag";
      double v35 = @"is_external_vendor_playlist";
      v92 = &v81;
      id v120 = @"is_external_vendor_playlist";
      MEMORY[0x1F4188790](v35);
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v72 = 0u;
      [v17 getValues:&v72 forProperties:v105 count:18];
      if ([(id)v77 BOOLValue])
      {
        uint64_t v15 = 0;
        int v36 = 1;
      }
      else
      {
        v90 = [[ML3ArtworkTokenSet alloc] initWithEntity:v17 artworkType:5];
        uint64_t v37 = [(ML3ArtworkTokenSet *)v90 artworkTokenForSource:100];
        v91 = (void *)v37;
        if (!a4 || v37)
        {
          if (*((void *)&v75 + 1))
          {
            id v40 = [ML3Track alloc];
            unsigned int v41 = -[ML3Entity initWithPersistentID:inLibrary:](v40, "initWithPersistentID:inLibrary:", [*((id *)&v75 + 1) longLongValue], *(void *)(a1 + 32));
            uint64_t v89 = [(ML3Entity *)v41 valueForProperty:@"item_store.sync_id"];
          }
          else
          {
            uint64_t v89 = 0;
          }
          int v42 = [(id)v74 intValue];
          uint64_t v43 = 48;
          if (!v42) {
            uint64_t v43 = 56;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + v43) + 8) + 24) = 1;
          [v11 setValue:*((void *)&v72 + 1) forKey:@"deleteWithoutSyncing"];
          [v11 setValue:(void)v73 forKey:@"dateLastModified"];
          [v11 setValue:*((void *)&v73 + 1) forKey:@"originalDateLastModified"];
          [v11 setValue:*((void *)&v77 + 1) forKey:@"likedState"];
          [v11 setValue:(void)v78 forKey:@"description"];
          [v11 setValue:*((void *)&v78 + 1) forKey:@"parentPersistentID"];
          [v11 setValue:(void)v79 forKey:@"external_vendor_identifier"];
          [v11 setValue:*((void *)&v79 + 1) forKey:@"external_vendor_display_name"];
          [v11 setValue:(void)v80 forKey:@"external_tag"];
          [v11 setValue:*((void *)&v80 + 1) forKey:@"is_external_vendor_playlist"];
          id v88 = v17;
          id v44 = +[ML3Track containerQueryWithContainer:v17];
          id v45 = [MEMORY[0x1E4F1CA48] array];
          v104[0] = @"item_store.sync_id";
          v104[1] = @"item_store.store_saga_id";
          v104[2] = @"item_store.purchase_history_id";
          id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:3];
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_490;
          v95[3] = &unk_1E5FB5218;
          id v47 = v45;
          id v96 = v47;
          id v87 = v44;
          [v44 enumeratePersistentIDsAndProperties:v46 usingBlock:v95];

          [v11 setValue:v47 forKey:@"trackPersistentIDs"];
          uint64_t v48 = [v47 count];
          unsigned int v38 = v89;
          if (v48 && v89) {
            [v11 setValue:v89 forKey:@"seedTrackPersistentID"];
          }
          [v11 setValue:*((void *)&v76 + 1) forKey:@"distinguishedKind"];
          id v86 = [NSNumber numberWithUnsignedInt:2];
          objc_msgSend(v11, "setValue:forKey:");
          [v11 setValue:(void)v76 forKey:@"name"];
          uint64_t v15 = (__CFString *)[(id)v72 copy];
          id v39 = v91;
          id v17 = v88;
          if (v91)
          {
            id v82 = v47;
            uint64_t v49 = os_log_create("com.apple.amp.medialibrary", "Library");
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              int v98 = 138543362;
              long long v99 = v39;
              _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_DEFAULT, "container artwork has changed. new token=%{public}@", (uint8_t *)&v98, 0xCu);
            }

            id v50 = [[ML3Artwork alloc] initWithToken:v39 artworkType:5 musicLibrary:*(void *)(a1 + 32)];
            id v51 = [(ML3Artwork *)v50 originalFileURL];
            double v52 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v85 = v51;
            uint64_t v53 = [v51 path];
            id v83 = v52;
            char v54 = [v52 fileExistsAtPath:v53];
            long long v55 = v39;
            char v56 = v54;

            id v84 = v50;
            if (v56)
            {
              long long v57 = [v85 path];
              id v58 = +[ML3MusicLibrary libraryContainerPath];
              __int16 v59 = objc_msgSend(v57, "substringFromIndex:", objc_msgSend(v58, "length"));

              [v11 setValue:v55 forKey:@"artworkCacheId"];
              [v11 setValue:v59 forKey:@"artworkFilePath"];
              id v39 = v55;
            }
            else
            {
              __int16 v59 = _ML3LogCategoryLibrary();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                int v98 = 134218498;
                long long v99 = a2;
                __int16 v100 = 2114;
                id v39 = v91;
                long long v101 = v91;
                __int16 v102 = 2114;
                id v103 = v85;
                _os_log_impl(&dword_1B022D000, v59, OS_LOG_TYPE_ERROR, "artwork file not found. container_pid=%lld, token=%{public}@, url=%{public}@", (uint8_t *)&v98, 0x20u);
              }
              else
              {
                id v39 = v91;
              }
            }
            id v47 = v82;
            id v17 = v88;

            unsigned int v38 = v89;
          }

          int v36 = 0;
        }
        else
        {
          unsigned int v38 = os_log_create("com.apple.amp.medialibrary", "Library");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            int v98 = 134217984;
            long long v99 = a2;
            _os_log_impl(&dword_1B022D000, v38, OS_LOG_TYPE_DEFAULT, "no content changes for container %lld - skipping", (uint8_t *)&v98, 0xCu);
          }
          uint64_t v15 = 0;
          int v36 = 1;
          id v39 = v91;
        }
      }
      for (uint64_t i = 136; i != -8; i -= 8)

      if (v36) {
        goto LABEL_55;
      }
    }
    if (v15)
    {
      __int16 v61 = [(__CFString *)v15 stringByDeletingLastPathComponent];
      uint64_t v62 = [v61 length];

      if (v62) {
        goto LABEL_45;
      }
    }
    goto LABEL_42;
  }
}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_514(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) pathForResourceFileOrFolder:a2];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v9];

  if ((v4 & 1) == 0)
  {
    uint64_t valuePtr = ML3CreateIntegerUUID();
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    int64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    os_log_t v7 = [NSNumber numberWithBool:1];
    int64_t v8 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"deleteWithoutSyncing", v5, @"playlistPersistentID", @"SYNC_MARKER", @"name", 0);

    WriteDictionaryToPathWithGrappaID(v8, v9, *(unsigned int *)(a1 + 40));
  }
}

void __59__ML3MusicLibrary_savePlaylistsSinceRevision_withGrappaID___block_invoke_490(uint64_t a1, uint64_t a2, id *a3)
{
  if ([*a3 longLongValue])
  {
    id v6 = *a3;
  }
  else
  {
    id v6 = [NSNumber numberWithLongLong:a2];
  }
  id v7 = v6;
  [*(id *)(a1 + 32) addObject:v6];
}

- (void)savePlaylists
{
}

- (void)saveTrackMetadataSinceRevision:(int64_t)a3 withGrappaID:(unsigned int)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = +[ML3MusicLibrary autoupdatingSharedLibrary];

  if (v7 == self)
  {
    unsigned int v38 = a4;
    context = (void *)MEMORY[0x1B3E93C70]();
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = NSNumber;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    id v39 = [v9 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(Current)];
    objc_msgSend(v8, "setObject:forKey:");
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:0];
    id v40 = v8;
    [v8 setObject:v11 forKey:@"version"];

    unsigned int v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke;
    void v46[3] = &unk_1E5FAFB58;
    id v47 = @"SELECT item_store.sync_id, item_video.audio_track_id, item_stats.bookmark_time_ms, entity_revision.deleted, item_stats.play_count_recent, item_stats.date_played, item_stats.has_been_played, item_stats.skip_count_recent, item_stats.date_skipped, item_stats.user_rating, item_stats.liked_state, item_store.item_pid, store_saga_id, album.liked_state, item.in_my_library FROM item JOIN item_stats USING(item_pid) LEFT OUTER JOIN entity_revision ON (item.item_pid = entity_pid) JOIN item_video USING (item_pid) JOIN item_store using (item_pid) LEFT OUTER JOIN album USING (album_pid) WHERE revision > ? AND class = 0 ORDER BY entity_revision.revision DESC;";
    int64_t v49 = a3;
    id v13 = v12;
    id v48 = v13;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v46];
    uint64_t v37 = +[ML3MusicLibrary pathForResourceFileOrFolder:1 basePath:0 relativeToBase:0 createParentFolderIfNecessary:0];
    unsigned int v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithContentsOfFile:");
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1C978] array];
    }
    id v17 = v16;

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v24 = [v23 objectForKeyedSubscript:@"persistentID"];

          if (v24)
          {
            id v25 = [v23 objectForKeyedSubscript:@"persistentID"];
            [v13 setObject:v23 forKey:v25];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v20);
    }

    if (_os_feature_enabled_impl())
    {
      int v26 = [(ML3MusicLibrary *)self getAlbumArtistChangesSinceRevision:a3 withGrappaID:v38];
      __int16 v27 = [(ML3MusicLibrary *)self getAlbumChangesSinceRevision:a3 withGrappaID:v38];
      uint64_t v28 = [(ML3MusicLibrary *)self _getPlaylistContentTasteChangesSinceRevision:a3 withGrappaID:v38];
      if ([v26 count])
      {
        __int16 v29 = [v26 allValues];
        [v40 setObject:v29 forKey:@"artists"];
      }
      if ([v27 count])
      {
        uint64_t v30 = [v27 allValues];
        [v40 setObject:v30 forKey:@"albums"];
      }
      if ([v28 count])
      {
        unsigned int v31 = [v28 allValues];
        [v40 setObject:v31 forKey:@"playlists"];
      }
      if ([v26 count] || objc_msgSend(v27, "count") || objc_msgSend(v28, "count"))
      {
        unsigned int v32 = os_log_create("com.apple.amp.medialibrary", "Library_Oversize");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 138543362;
          id v51 = v40;
          _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_DEFAULT, "playCountsPlistDictionary=%{public}@", buf, 0xCu);
        }
      }
    }
    double v33 = [MEMORY[0x1E4F1C9E8] dictionary];
    [v33 writeToFile:v37 atomically:1];

    id v34 = [v13 allValues];
    [v40 setObject:v34 forKey:@"tracks"];

    double v35 = +[ML3MusicLibrary pathForResourceFileOrFolder:2 basePath:0 relativeToBase:0 createParentFolderIfNecessary:1];
    if ((WriteDictionaryToPathWithGrappaID(v40, v35, v38) & 1) == 0)
    {
      int v36 = os_log_create("com.apple.amp.medialibrary", "Library");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138543618;
        id v51 = v35;
        __int16 v52 = 1024;
        int v53 = 0;
        _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_DEFAULT, "Saved play counts to %{public}@: success=%d", buf, 0x12u);
      }
    }
  }
}

void __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = NSNumber;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  id v7 = [v4 numberWithLongLong:v5];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = [v6 executeQuery:v3 withParameters:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke_2;
  void v10[3] = &unk_1E5FB83F8;
  id v11 = *(id *)(a1 + 40);
  [v9 enumerateRowsWithBlock:v10];
}

void __63__ML3MusicLibrary_saveTrackMetadataSinceRevision_withGrappaID___block_invoke_2(uint64_t a1, void *a2)
{
  id v34 = a2;
  unsigned int v32 = [v34 objectAtIndexedSubscript:1];
  char v2 = NSNumber;
  uint64_t v3 = [v34 objectAtIndexedSubscript:2];
  unsigned int v31 = objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "longLongValue"));

  double v33 = [v34 objectAtIndexedSubscript:3];
  uint64_t v30 = [v34 objectAtIndexedSubscript:4];
  char v4 = NSNumber;
  [v34 doubleForColumnIndex:5];
  __int16 v27 = [v4 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(v5)];
  int v26 = [v34 objectAtIndexedSubscript:6];
  __int16 v29 = [v34 objectAtIndexedSubscript:7];
  id v6 = NSNumber;
  [v34 doubleForColumnIndex:8];
  id v25 = [v6 numberWithUnsignedInt:ML3UInt32MacTimeFromCFAbsoluteTime(v7)];
  id v8 = NSNumber;
  id v9 = [v34 objectAtIndexedSubscript:9];
  uint64_t v28 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "longLongValue"));

  uint64_t v10 = NSNumber;
  id v11 = [v34 objectAtIndexedSubscript:10];
  unsigned int v12 = objc_msgSend(v10, "numberWithUnsignedLongLong:", objc_msgSend(v11, "longLongValue"));

  id v13 = [v34 objectAtIndexedSubscript:0];
  unsigned int v14 = [v34 objectAtIndexedSubscript:11];
  uint64_t v15 = [v34 objectAtIndexedSubscript:12];
  if (!v13 || (v16 = [v13 unsignedLongLongValue], id v17 = v13, !v16)) {
    id v17 = v14;
  }
  id v18 = v17;
  uint64_t v19 = [v34 objectAtIndexedSubscript:13];
  uint64_t v20 = [v34 objectAtIndexedSubscript:14];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:13];
  if (v18)
  {
    char v22 = [*(id *)(a1 + 32) objectForKey:v18];

    if (!v22)
    {
      [v21 setValue:v18 forKey:@"persistentID"];
      if ([v33 BOOLValue] && objc_msgSend(v13, "longLongValue")) {
        [v21 setValue:v33 forKey:@"deleted"];
      }
      if (![v15 longLongValue])
      {
        if ([v30 intValue])
        {
          [v21 setValue:v30 forKey:@"playCount"];
          [v21 setObject:v27 forKey:@"playMacOSDate"];
          [v21 setValue:v26 forKey:@"playedState"];
        }
        if ([v29 intValue])
        {
          [v21 setValue:v29 forKey:@"skipCount"];
          [v21 setObject:v25 forKey:@"skipMacOSDate"];
        }
        [v21 setValue:v31 forKey:@"bookmarkTimeInMS"];
        [v21 setValue:v32 forKey:@"audioTrackID"];
        [v21 setValue:v28 forKey:@"userRating"];
        [v21 setValue:v12 forKey:@"likedState"];
        [v21 setValue:v19 forKey:@"albumLikedState"];
        if (v20)
        {
          id v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "BOOLValue") ^ 1);
          [v21 setValue:v23 forKey:@"isPlaylistOnly"];
        }
      }
      [*(id *)(a1 + 32) setObject:v21 forKey:v18];
    }
  }
}

- (void)saveTrackMetadata
{
}

- (void)notifyKeepLocalStateDidChange
{
}

- (void)notifyLibraryImportDidFinish
{
}

- (void)notifyCloudLibraryAvailabilityDidChange
{
}

- (void)notifySectionsDidChange
{
}

- (void)notifyDisplayValuesPropertyDidChange
{
}

- (void)notifyInvisiblePropertyDidChange
{
}

- (void)notifyNonContentsPropertyDidChange
{
}

- (void)notifyEntitiesAddedOrRemoved
{
}

- (void)notifyAssistantContentsDidChange
{
  if ([(ML3MusicLibrary *)self isAutoUpdatingSharedLibrary])
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
    id v4 = [(ML3MusicLibrary *)self notificationManager];
    uint64_t v3 = [(id)objc_opt_class() assistantSyncDataChangedNotificationName];
    [v4 enqueueDistributedNotificationNamed:v3];
  }
}

- (void)notifyContentsDidChange
{
}

- (id)groupingKeysForStrings:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  unsigned int v14 = __Block_byref_object_copy__2480;
  uint64_t v15 = __Block_byref_object_dispose__2481;
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __42__ML3MusicLibrary_groupingKeysForStrings___block_invoke;
  void v8[3] = &unk_1E5FAFAE0;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(ML3MusicLibrary *)self accessSortKeyBuilder:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __42__ML3MusicLibrary_groupingKeysForStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(__CFString **)(*((void *)&v12 + 1) + 8 * i);
        if ([(__CFString *)v9 length])
        {
          uint64_t v10 = (uint64_t)iPhoneSortKeyBuilderCopyGroupingKeyForString(a2, v9);
        }
        else
        {
          uint64_t v10 = [MEMORY[0x1E4F1C9B8] data];
        }
        uint64_t v11 = (void *)v10;
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v10 forKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)groupingKeyForString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    long long v13 = __Block_byref_object_copy__2480;
    long long v14 = __Block_byref_object_dispose__2481;
    id v15 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__ML3MusicLibrary_groupingKeyForString___block_invoke;
    v7[3] = &unk_1E5FAFAE0;
    id v9 = &v10;
    id v8 = v4;
    [(ML3MusicLibrary *)self accessSortKeyBuilder:v7];
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v5;
}

uint64_t __40__ML3MusicLibrary_groupingKeyForString___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = iPhoneSortKeyBuilderCopyGroupingKeyForString(a2, *(CFStringRef *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (id)accountCacheDatabase
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ML3MusicLibrary_accountCacheDatabase__block_invoke;
  block[3] = &unk_1E5FB8298;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
  return self->_accountCacheDatabase;
}

uint64_t __39__ML3MusicLibrary_accountCacheDatabase__block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 32))
  {
    *(void *)(*(void *)(result + 32) + 32) = [[ML3AccountCacheDatabase alloc] initWithLibrary:*(void *)(result + 32)];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (BOOL)clearAllCloudKVSData
{
  return [(ML3MusicLibrary *)self _clearAllRowsFromTables:&unk_1F090EBC0];
}

- (BOOL)clearAllGeniusData
{
  BOOL v3 = [(ML3MusicLibrary *)self _clearAllRowsFromTables:&unk_1F090EBA8];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.is_container_type_active_target AND container.smart_is_genius)" equalToInteger:1];
  id v5 = +[ML3Entity queryWithLibrary:self predicate:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ML3MusicLibrary_clearAllGeniusData__block_invoke;
  v7[3] = &unk_1E5FAFAB8;
  void v7[4] = self;
  void v7[5] = &v8;
  [v5 enumeratePersistentIDsUsingBlock:v7];
  if (*((unsigned char *)v9 + 24)) {
    [(ML3MusicLibrary *)self notifyContentsDidChange];
  }

  _Block_object_dispose(&v8, 8);
  return v3;
}

void __37__ML3MusicLibrary_clearAllGeniusData__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = +[ML3Entity newWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
  if ([v4 existsInLibrary])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 deleteFromLibrary];
    id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = a2;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "Deleted active Genius playlist with pid: %lld", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)emptyAllTables
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v3 = [(ML3MusicLibrary *)self _clearAllRowsFromTables:&unk_1F090EB90];
  *((unsigned char *)v8 + 24) = v3;
  if (v3
    && (v6[0] = MEMORY[0x1E4F143A8],
        v6[1] = 3221225472,
        v6[2] = __33__ML3MusicLibrary_emptyAllTables__block_invoke,
        v6[3] = &unk_1E5FAF9F0,
        void v6[4] = &v7,
        [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v6], *((unsigned char *)v8 + 24)))
  {
    [(ML3MusicLibrary *)self cleanupArtworkWithOptions:8];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__ML3MusicLibrary_emptyAllTables__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = ML3ValidationRunInitialInsertStatements(a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)createIndexes
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__ML3MusicLibrary_createIndexes__block_invoke;
  v4[3] = &unk_1E5FB7640;
  void v4[4] = self;
  void v4[5] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__ML3MusicLibrary_createIndexes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = objc_msgSend((id)objc_opt_class(), "indexSchemaSQL", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 executeUpdate:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v9 = [v3 executeUpdate:@"ANALYZE;"];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v10 + 24)) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)(v10 + 24) = v11;
}

- (BOOL)automaticDatabaseValidationDisabled
{
  return __disableAutomaticDatabaseValidation;
}

- (BOOL)isCurrentThreadInTransaction
{
  char v2 = [(ML3MusicLibrary *)self connectionPool];
  char v3 = [v2 isCurrentThreadConnectionInTransaction];

  return v3;
}

- (void)performAsyncDatabaseWriteTransactionWithBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() widthLimitedSetValuesQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke;
  v11[3] = &unk_1E5FAFA90;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

void __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke_2;
  v4[3] = &unk_1E5FAFA68;
  id v6 = &v7;
  char v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 performDatabaseTransactionWithBlock:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *((unsigned __int8 *)v8 + 24), 0);
  }

  _Block_object_dispose(&v7, 8);
}

uint64_t __81__ML3MusicLibrary_performAsyncDatabaseWriteTransactionWithBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)performReadOnlyDatabaseTransactionWithBlock:(id)a3
{
  id v5 = (uint64_t (**)(id, void *))a3;
  BOOL v4 = [(ML3MusicLibrary *)self checkoutReaderConnection];
  [v4 pushTransactionUsingBehaviorType:3];
  objc_msgSend(v4, "popTransactionAndCommit:", v5[2](v5, v4));
  [(ML3MusicLibrary *)self checkInDatabaseConnection:v4];
}

- (void)performDatabaseTransactionWithBlock:(id)a3
{
  id v5 = (uint64_t (**)(id, void *))a3;
  BOOL v4 = [(ML3MusicLibrary *)self checkoutWriterConnection];
  [v4 pushTransaction];
  objc_msgSend(v4, "popTransactionAndCommit:", v5[2](v5, v4));
  [(ML3MusicLibrary *)self checkInDatabaseConnection:v4];
}

- (void)reconnectToDatabase
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ML3MusicLibraryWillInvalidateDatabaseConnectionNotification" object:self];

  id v4 = [(ML3MusicLibrary *)self connectionPool];
  [v4 _closeAllConnectionsAndWaitForBusyConnections:0];
}

void __45__ML3MusicLibrary_checkInDatabaseConnection___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 ownsConnection:*(void *)(a1 + 32)])
  {
    [v5 checkInConnection:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (a3) {
      *a3 = 1;
    }
  }
}

- (void)connectionDidClose:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ML3MusicLibrary_connectionDidClose___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __38__ML3MusicLibrary_connectionDidClose___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2480;
  uint64_t v20 = __Block_byref_object_dispose__2481;
  id v21 = 0;
  char v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)stat buf = 138543618;
    uint64_t v23 = v3;
    __int16 v24 = 2114;
    uint64_t v25 = v4;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received connection=%{public}@ did close notification", buf, 0x16u);
  }

  id v5 = *(void **)(*(void *)(a1 + 32) + 88);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __38__ML3MusicLibrary_connectionDidClose___block_invoke_218;
  id v13 = &unk_1E5FAFA40;
  id v14 = *(id *)(a1 + 40);
  long long v15 = &v16;
  [v5 enumerateObjectsUsingBlock:&v10];
  id v6 = (void *)v17[5];
  if (v6)
  {
    objc_msgSend(v6, "setDelegate:", 0, v10, v11, v12, v13);
    uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = v17[5];
      *(_DWORD *)stat buf = 138543618;
      uint64_t v23 = v8;
      __int16 v24 = 2114;
      uint64_t v25 = v9;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - connection pool %{public}@ will be removed from the pending pools as it has no pending or active connections", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 88) removeObject:v17[5]];
  }

  _Block_object_dispose(&v16, 8);
}

void __38__ML3MusicLibrary_connectionDidClose___block_invoke_218(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 ownsConnection:*(void *)(a1 + 32)])
  {
    if ([v6 isClosedWithNoActiveOrBusyConnections])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      if (a3) {
        *a3 = 1;
      }
    }
  }
}

- (void)connectionWillCloseDatabase:(id)a3
{
  id v4 = a3;
  if (-[ML3MusicLibrary _canConfigureMediaLibraryDatabaseConnection:](self, "_canConfigureMediaLibraryDatabaseConnection:"))
  {
    [(ML3MusicLibrary *)self _teardownMediaLibraryDatabaseConnection:v4];
  }
}

- (NSArray)preferredSubtitleTracks
{
  if (TCCAccessPreflight())
  {
    uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "Could not resolve preferredSubtitleTracks, missing TCC", v7, 2u);
    }
    id v4 = 0;
    goto LABEL_7;
  }
  id v5 = [(ML3MusicLibrary *)self databaseInfo];
  uint64_t v3 = [v5 valueForProperty:@"subtitle_language"];

  [(ML3MusicLibrary *)self _logDatabaseAccess];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v3];
LABEL_7:

    goto LABEL_8;
  }
  id v4 = 0;
LABEL_8:

  return (NSArray *)v4;
}

- (NSArray)preferredAudioTracks
{
  if (TCCAccessPreflight())
  {
    uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "Could not resolve preferredAudioTracks, missing TCC", v7, 2u);
    }
    id v4 = 0;
    goto LABEL_7;
  }
  id v5 = [(ML3MusicLibrary *)self databaseInfo];
  uint64_t v3 = [v5 valueForProperty:@"audio_language"];

  [(ML3MusicLibrary *)self _logDatabaseAccess];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v3];
LABEL_7:

    goto LABEL_8;
  }
  id v4 = 0;
LABEL_8:

  return (NSArray *)v4;
}

- (ML3DatabaseMetadata)databaseInfo
{
  return (ML3DatabaseMetadata *)+[ML3Entity anyInLibrary:self predicate:0];
}

- (ML3Container)currentDevicePhotosMemoriesPlaylist
{
  v11[6] = *MEMORY[0x1E4F143B8];
  if ([(ML3MusicLibrary *)self isHomeSharingLibrary])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
    id v5 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.distinguished_kind = 10010 AND container.is_container_type_active_target)" equalToValue:MEMORY[0x1E4F1CC38]];
    id v3 = +[ML3Entity anyInLibrary:self predicate:v5 options:7];
    if (!v3)
    {
      v10[0] = @"distinguished_kind";
      v10[1] = @"is_container_type_active_target";
      v11[0] = &unk_1F0910D98;
      v11[1] = v4;
      v11[2] = v4;
      void v10[2] = @"is_hidden";
      void v10[3] = @"date_created";
      id v6 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
      v11[3] = v7;
      void v11[4] = &unk_1F0910DB0;
      void v10[4] = @"keep_local";
      v10[5] = @"name";
      void v11[5] = @"Photos Memories";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

      id v3 = +[ML3Entity newWithDictionary:v8 inLibrary:self];
    }
  }

  return (ML3Container *)v3;
}

- (ML3Container)currentDevicePlaybackHistoryPlaylist
{
  void v13[5] = *MEMORY[0x1E4F143B8];
  if ([(ML3MusicLibrary *)self isHomeSharingLibrary])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
    id v5 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.distinguished_kind = 10000 AND container.is_container_type_active_target)" equalToValue:MEMORY[0x1E4F1CC38]];
    id v3 = +[ML3Entity anyInLibrary:self predicate:v5 options:3];
    if (!v3)
    {
      v12[0] = @"distinguished_kind";
      v12[1] = @"is_container_type_active_target";
      v13[0] = &unk_1F0910D80;
      v13[1] = v4;
      void v13[2] = v4;
      void v12[2] = @"is_hidden";
      v12[3] = @"date_created";
      id v6 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
      v13[3] = v7;
      void v12[4] = @"name";
      uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v9 = [v8 localizedStringForKey:@"PLAYBACK_HISTORY_PLAYLIST_NAME" value:&stru_1F08D4D70 table:@"MLLocalizable"];
      void v13[4] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

      id v3 = +[ML3Entity newWithDictionary:v10 inLibrary:self];
    }
  }

  return (ML3Container *)v3;
}

- (ML3Container)currentDevicePurchasesPlaylist
{
  id v3 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.distinguished_kind = 20 AND container.is_container_type_active_target)" equalToValue:MEMORY[0x1E4F1CC38]];
  uint64_t v4 = +[ML3Entity anyInLibrary:self predicate:v3];

  return (ML3Container *)v4;
}

- (BOOL)isLibraryEmpty
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__ML3MusicLibrary_isLibraryEmpty__block_invoke;
  v4[3] = &unk_1E5FAF9F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__ML3MusicLibrary_isLibraryEmpty__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 executeQuery:@"SELECT 1 FROM item LIMIT 1"];
  char v5 = [v4 hasAtLeastOneRow];

  id v6 = [v3 executeQuery:@"SELECT 1 FROM container WHERE distinguished_kind = 0 LIMIT 1"];

  LOBYTE(v3) = [v6 hasAtLeastOneRow];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (v5 | v3) ^ 1;
}

- (void)setLibraryUID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_libraryUIDLock lock];
  libraryUID = self->_libraryUID;
  if (libraryUID && ![(NSString *)libraryUID isEqualToString:v4])
  {
    id v6 = (NSString *)[v4 copy];
    uint64_t v7 = self->_libraryUID;
    self->_libraryUID = v6;

    [(NSLock *)self->_libraryUIDLock unlock];
    char v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __33__ML3MusicLibrary_setLibraryUID___block_invoke;
    v9[3] = &unk_1E5FB83D0;
    void v9[4] = self;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
  else
  {
    [(NSLock *)self->_libraryUIDLock unlock];
  }
}

uint64_t __33__ML3MusicLibrary_setLibraryUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forDatabaseProperty:@"_UUID"];
}

- (NSString)syncLibraryID
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__ML3MusicLibrary_syncLibraryID__block_invoke;
  block[3] = &unk_1E5FB8360;
  void block[4] = self;
  void block[5] = &v20;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v21 + 24))
  {
    id v4 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLSyncLibraryID"];
    char v5 = self->_serialQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__ML3MusicLibrary_syncLibraryID__block_invoke_2;
    void v17[3] = &unk_1E5FB83D0;
    v17[4] = self;
    id v18 = v4;
    id v6 = v4;
    dispatch_sync(v5, v17);
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2480;
  long long v15 = __Block_byref_object_dispose__2481;
  id v16 = 0;
  uint64_t v7 = self->_serialQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __32__ML3MusicLibrary_syncLibraryID__block_invoke_3;
  void v10[3] = &unk_1E5FB8360;
  void v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v20, 8);

  return (NSString *)v8;
}

uint64_t __32__ML3MusicLibrary_syncLibraryID__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24) == 0;
  return result;
}

uint64_t __32__ML3MusicLibrary_syncLibraryID__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __32__ML3MusicLibrary_syncLibraryID__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setSyncLibraryID:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __36__ML3MusicLibrary_setSyncLibraryID___block_invoke;
  id v10 = &unk_1E5FB83D0;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, &v7);
  [(ML3MusicLibrary *)self setValue:v6, @"MLSyncLibraryID", v7, v8, v9, v10, v11 forDatabaseProperty];
}

void __36__ML3MusicLibrary_setSyncLibraryID___block_invoke(uint64_t a1)
{
}

- (int64_t)syncGenerationID
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLSyncClientGenerationID"];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (void)setSyncGenerationID:(int64_t)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  char v5 = [NSNumber numberWithLongLong:a3];
  [(ML3MusicLibrary *)self setValue:v5 forDatabaseProperty:@"MLSyncClientGenerationID"];

  id v6 = [(ML3MusicLibrary *)self notificationManager];
  [v6 enqueueDistributedNotificationNamed:@"com.apple.mobileipod.syncgenerationchanged"];
}

- (BOOL)downloadOnAddToLibrary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (MSVDeviceSupportsSideLoadedMediaContent())
  {
    char v2 = +[ML3AccountStore defaultStore];
    int64_t v3 = [v2 activeAccount];

    if (v3)
    {
      objc_opt_class();
      id v4 = objc_msgSend(v3, "ams_automaticDownloadKinds");
      if ([v4 containsObject:@"song"]) {
        int v5 = [v4 containsObject:@"music-video"];
      }
      else {
        int v5 = 0;
      }
      id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109378;
        v8[1] = v5;
        __int16 v9 = 2114;
        id v10 = v4;
        _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Automatic Downloads are %{BOOL}u. enabledKinds=%{public}@", (uint8_t *)v8, 0x12u);
      }
    }
    else
    {
      id v4 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "Could not get active account. Treating automatic Downloads as disabled", (uint8_t *)v8, 2u);
      }
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setIsHomeSharingLibrary:(BOOL)a3
{
  BOOL v3 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ML3MusicLibrary_setIsHomeSharingLibrary___block_invoke;
  v7[3] = &unk_1E5FB80E8;
  void v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(serialQueue, v7);
  id v6 = [NSNumber numberWithBool:v3];
  [(ML3MusicLibrary *)self setValue:v6 forDatabaseProperty:@"MLIsHomeSharingLibrary"];
}

uint64_t __43__ML3MusicLibrary_setIsHomeSharingLibrary___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = 1;
  *(unsigned char *)(*(void *)(result + 32) + 81) = *(unsigned char *)(result + 40);
  return result;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
  iPhoneSortKeyBuilderRelease(self->_sortKeyBuilder);
  self->_sortKeyBuilder = 0;
  accountCacheDatabase = self->_accountCacheDatabase;
  self->_accountCacheDatabase = 0;

  v5.receiver = self;
  v5.super_class = (Class)ML3MusicLibrary;
  [(ML3MusicLibrary *)&v5 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serialQueue);
  objc_msgSend(v5, "encodeBool:forKey:", -[ML3MusicLibrary isAutoUpdatingSharedLibrary](self, "isAutoUpdatingSharedLibrary"), @"isAutoupdatingSharedLibraryKey");
  if (![(ML3MusicLibrary *)self isAutoUpdatingSharedLibrary])
  {
    id v4 = [(ML3MusicLibrary *)self resourcesManager];
    [v5 encodeObject:v4 forKey:@"resourceManagerKey"];
  }
}

- (ML3MusicLibrary)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2480;
  uint64_t v20 = __Block_byref_object_dispose__2481;
  id v21 = 0;
  if ([v4 decodeBoolForKey:@"isAutoupdatingSharedLibraryKey"])
  {
    uint64_t v5 = +[ML3MusicLibrary autoupdatingSharedLibrary];
    id v6 = 0;
    uint64_t v7 = (void *)v17[5];
    void v17[5] = v5;
  }
  else
  {
    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceManagerKey"];
    __int16 v9 = +[ML3MusicLibrary globalSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__ML3MusicLibrary_initWithCoder___block_invoke;
    block[3] = &unk_1E5FB8208;
    long long v15 = &v16;
    id v6 = v8;
    id v13 = v6;
    id v14 = 0;
    dispatch_sync(v9, block);

    uint64_t v7 = v13;
  }

  id v10 = (ML3MusicLibrary *)(id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __33__ML3MusicLibrary_initWithCoder___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = +[ML3MusicLibrary _onGlobalQueue_shareableMusicLibraryWithResourcesManager:a1[4] libraryFilePath:a1[5]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke_3()
{
  id v0 = +[ML3LanguageResourceManager sharedResourceManager];
  [v0 invalidateCachedResources];
}

void __84__ML3MusicLibrary_initWithClientIdentity_path_readOnly_populateUnitTestTablesBlock___block_invoke_2()
{
  id v0 = +[ML3LanguageResourceManager sharedResourceManager];
  [v0 invalidateCachedResources];
}

- (ML3MusicLibrary)initWithClientIdentity:(id)a3 path:(id)a4
{
  return [(ML3MusicLibrary *)self initWithClientIdentity:a3 path:a4 readOnly:0 populateUnitTestTablesBlock:0];
}

- (ML3MusicLibrary)initWithPath:(id)a3 isUnitTesting:(BOOL)a4
{
  self->_isUnitTesting = a4;
  return [(ML3MusicLibrary *)self initWithPath:a3];
}

- (ML3MusicLibrary)initWithResourcesManager:(id)a3
{
  id v5 = a3;
  id v6 = [v5 pathForResourceFileOrFolder:15];
  uint64_t v7 = [(ML3MusicLibrary *)self initWithPath:v6];
  BOOL v8 = v7;
  if (v7)
  {
    v7->_autoUpdatingSharedLibrary = 0;
    objc_storeStrong((id *)&v7->_resourcesManager, a3);
    __int16 v9 = [v5 context];
    id v10 = [v9 accountInfo];
    uint64_t v11 = [v10 accountDSID];
    accountDSID = v8->_accountDSID;
    v8->_accountDSID = (NSString *)v11;
  }
  return v8;
}

- (ML3MusicLibrary)initWithClientIdentity:(id)a3 forUserAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[ML3MusicLibrary deviceSupportsMultipleLibraries];
  if (v7
    && v8
    && ([v7 accountDSID], __int16 v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    id v10 = +[ML3MusicLibraryResourcesManagerContext contextForSingleUserLibraryWithAccountInfo:v7];
    uint64_t v11 = [[ML3MusicLibraryResourcesManager alloc] initWithContext:v10];
    id v12 = [(ML3MusicLibraryResourcesManager *)v11 pathForResourceFileOrFolder:15];
    id v13 = [(ML3MusicLibrary *)self initWithClientIdentity:v6 path:v12 readOnly:0 populateUnitTestTablesBlock:0];
    id v14 = v13;
    if (v13)
    {
      v13->_autoUpdatingSharedLibrary = 0;
      objc_storeStrong((id *)&v13->_resourcesManager, v11);
      long long v15 = [(ML3MusicLibraryResourcesManager *)v11 context];
      uint64_t v16 = [v15 accountInfo];
      uint64_t v17 = [v16 accountDSID];
      accountDSID = v14->_accountDSID;
      v14->_accountDSID = (NSString *)v17;
    }
  }
  else
  {
    id v14 = [(ML3MusicLibrary *)self initWithClientIdentity:v6 path:0 readOnly:0 populateUnitTestTablesBlock:0];
  }

  return v14;
}

+ (id)assistantSyncDataChangedNotificationName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s%s", "com.apple.media.entities", ".siri_data_changed");
}

+ (id)widthLimitedSetValuesQueue
{
  if (widthLimitedSetValuesQueue___once != -1) {
    dispatch_once(&widthLimitedSetValuesQueue___once, &__block_literal_global_892);
  }
  char v2 = (void *)widthLimitedSetValuesQueue___setValuesQueue;

  return v2;
}

uint64_t __45__ML3MusicLibrary_widthLimitedSetValuesQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v1 = (void *)widthLimitedSetValuesQueue___setValuesQueue;
  widthLimitedSetValuesQueue___setValuesQueue = (uint64_t)v0;

  char v2 = (void *)widthLimitedSetValuesQueue___setValuesQueue;

  return [v2 setMaxConcurrentOperationCount:5];
}

+ (BOOL)updateTrackIntegrityOnConnection:(id)a3
{
  return [a3 executeUpdate:@"UPDATE item_extra SET integrity = (SELECT ML3TrackIntegrityCompute(item.item_pid, item.media_type, item_extra.location, item_extra.file_size) FROM item JOIN item_extra AS item_extra2 USING (item_pid) WHERE item_extra.item_pid = item.item_pid) WHERE item_pid IN (SELECT item_pid FROM item WHERE base_location_id != 0)"];
}

+ (void)removeOrphanedTracks
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  char v2 = +[ML3MusicLibrary allLibraries];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeOrphanedTracksOnlyInCaches:", +[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries"));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (void)enumerateSortMapTablesUsingBlock:(id)a3
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  void block[4] = a2;
  void block[5] = a1;
  if (enumerateSortMapTablesUsingBlock____once != -1) {
    dispatch_once(&enumerateSortMapTablesUsingBlock____once, block);
  }
  uint64_t v6 = (void *)enumerateSortMapTablesUsingBlock____sortMapTables;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_2;
  void v8[3] = &unk_1E5FAFC68;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v2 = [v6 pathForResource:@"MLSortMapTables" ofType:@"plist"];
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v2];
  uint64_t v4 = (void *)enumerateSortMapTablesUsingBlock____sortMapTables;
  enumerateSortMapTablesUsingBlock____sortMapTables = v3;

  if (!enumerateSortMapTablesUsingBlock____sortMapTables)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"ML3MusicLibrary.m", 2161, @"Unable to load MLSortMapTables.plist at %@", v2 object file lineNumber description];
  }
}

void __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_3;
  void v8[3] = &unk_1E5FAFC40;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __52__ML3MusicLibrary_enumerateSortMapTablesUsingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  if ((unint64_t)[v11 count] < 2)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v11 objectAtIndexedSubscript:1];
  }
  uint64_t v9 = a1 + 32;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v9 + 8);
  id v10 = [v11 objectAtIndexedSubscript:0];
  (*(void (**)(uint64_t, uint64_t, id, void *, void *))(v8 + 16))(v8, v7, v5, v10, v6);
}

+ (id)sectionIndexTitleForSectionHeader:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex;
  if (!sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex)
  {
    id v36 = v4;
    context = (void *)MEMORY[0x1B3E93C70]();
    uint64_t v37 = [a1 sectionIndexTitles];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v7 = ML3LocalizedSectionDictionary();
    uint64_t v8 = [v7 objectForKey:@"SectionHeaders"];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v14 = [v13 objectForKey:@"Headers"];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v39 != v17) {
                  objc_enumerationMutation(v14);
                }
                [v6 addObject:*(void *)(*((void *)&v38 + 1) + 8 * j)];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v16);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v10);
    }

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v20 = (void *)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex;
    sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex = (uint64_t)v19;

    id v21 = v37;
    if ([v37 count])
    {
      unint64_t v22 = 0;
      unint64_t v23 = 0;
      uint64_t v24 = 1;
      do
      {
        uint64_t v25 = [v21 objectAtIndex:v23];
        if (([v25 isEqualToString:@"•"] & 1) == 0)
        {
          uint64_t v26 = 0;
          unint64_t v27 = v24;
          while (v27 < [v21 count])
          {
            uint64_t v28 = [v21 objectAtIndex:v27];

            ++v27;
            uint64_t v26 = v28;
            if (([v28 isEqualToString:@"•"] & 1) == 0) {
              goto LABEL_24;
            }
          }
          uint64_t v28 = v26;
LABEL_24:
          if (v22 < [v6 count])
          {
            while (1)
            {
              __int16 v29 = [v6 objectAtIndex:v22];
              if ([v28 isEqualToString:v29]) {
                break;
              }
              [(id)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex setObject:v25 forKey:v29];

              if (++v22 >= [v6 count]) {
                goto LABEL_29;
              }
            }
          }
LABEL_29:

          id v21 = v37;
        }

        ++v23;
        ++v24;
      }
      while (v23 < [v21 count]);
    }

    id v5 = (void *)sectionIndexTitleForSectionHeader__sectionHeaderToSectionIndex;
    id v4 = v36;
  }
  uint64_t v30 = [v5 objectForKey:v4];
  unsigned int v31 = v30;
  if (v30)
  {
    id v32 = v30;
  }
  else
  {
    double v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v32 = [v33 localizedStringForKey:@"NUMERIC_SECTION_HEADER" value:&stru_1F08D4D70 table:@"MLLocalizable"];
  }

  return v32;
}

+ (id)sectionIndexTitles
{
  char v2 = ML3LocalizedSectionDictionary();
  uint64_t v3 = [v2 objectForKey:@"SectionIndices"];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"NUMERIC_SECTION_HEADER" value:&stru_1F08D4D70 table:@"MLLocalizable"];
  id v6 = [v3 arrayByAddingObject:v5];

  return v6;
}

+ (id)localizedSectionIndexTitleForSectionHeader:(id)a3
{
  id v3 = a3;
  id v4 = ML3LocalizedSectionDictionary();
  id v5 = [v4 objectForKey:@"LocalizedSectionIndices"];

  id v6 = [v5 objectForKey:v3];
  uint64_t v7 = v6;
  if (!v6) {
    id v6 = v3;
  }
  id v8 = v6;

  return v8;
}

+ (id)localizedSectionHeaderForSectionHeader:(id)a3
{
  id v3 = a3;
  id v4 = ML3LocalizedSectionDictionary();
  id v5 = [v4 objectForKey:@"LocalizedSectionHeaders"];

  id v6 = [v5 objectForKey:v3];
  uint64_t v7 = v6;
  if (!v6) {
    id v6 = v3;
  }
  id v8 = v6;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)setGlobalPrivacyContextWithAuditToken:(id *)a3
{
  os_unfair_lock_lock(&__privacyContextLock);
  id v4 = [ML3DatabasePrivacyContext alloc];
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  uint64_t v6 = [(ML3DatabasePrivacyContext *)v4 initWithAuditToken:v8];
  uint64_t v7 = (void *)__privacyContextOverride;
  __privacyContextOverride = v6;

  os_unfair_lock_unlock(&__privacyContextLock);
}

+ (void)enableAutomaticDatabaseValidation
{
  __disableAutomaticDatabaseValidation = 0;
}

+ (void)disableAutomaticDatabaseValidation
{
  __disableAutomaticDatabaseValidation = 1;
}

+ (void)disableSharedLibrary
{
  __disableSharedLibrary = 1;
}

+ (void)setSharedLibraryDatabasePath:(id)a3
{
}

+ (NSString)sharedLibraryDatabasePath
{
  return +[ML3MusicLibrary autoupdatingSharedLibraryPath];
}

+ (id)sharedLibrary
{
  return +[ML3MusicLibrary autoupdatingSharedLibrary];
}

+ (NSMutableDictionary)musicLibraryPerUserDSID
{
  if (musicLibraryPerUserDSID_onceToken != -1) {
    dispatch_once(&musicLibraryPerUserDSID_onceToken, &__block_literal_global_113);
  }
  char v2 = (void *)musicLibraryPerUserDSID___musicLibraryPerUserDSID;

  return (NSMutableDictionary *)v2;
}

uint64_t __42__ML3MusicLibrary_musicLibraryPerUserDSID__block_invoke()
{
  musicLibraryPerUserDSID___musicLibraryPerUserDSID = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];

  return MEMORY[0x1F41817F8]();
}

+ (void)setAutoupdatingSharedLibraryPath:(id)a3
{
  id v4 = a3;
  long long v5 = [a1 globalSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ML3MusicLibrary_setAutoupdatingSharedLibraryPath___block_invoke;
  block[3] = &unk_1E5FB8298;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

uint64_t __52__ML3MusicLibrary_setAutoupdatingSharedLibraryPath___block_invoke(uint64_t a1)
{
  __sharedLibraryDatabasePath = [*(id *)(a1 + 32) copy];

  return MEMORY[0x1F41817F8]();
}

+ (NSArray)allLibraries
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
  long long v5 = [a1 globalSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__ML3MusicLibrary_allLibraries__block_invoke;
  block[3] = &unk_1E5FB7BB0;
  id v12 = v4;
  id v13 = a1;
  id v11 = v3;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);

  id v8 = (void *)[v7 copy];

  return (NSArray *)v8;
}

void __31__ML3MusicLibrary_allLibraries__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    obuint64_t j = +[ML3MusicLibrary allLibraryContainerPaths];
    uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v16 != v4) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v7 = [v6 lastPathComponent];
          if ([v7 isEqualToString:@"iTunes_Control"])
          {

            id v7 = 0;
          }
          id v8 = [v6 lastPathComponent];
          uint64_t v9 = +[ML3MusicLibraryResourcesManagerContext contextForSingleUserLibraryWithLibraryContainerIdentifier:v8];

          uint64_t v10 = [[ML3MusicLibraryResourcesManager alloc] initWithContext:v9];
          id v11 = objc_msgSend(*(id *)(a1 + 48), "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:libraryFilePath:", v10, 0);
          [*(id *)(a1 + 32) addObject:v11];
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v3);
    }
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:libraryFilePath:", 0, *(void *)(a1 + 40));
    id obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:");
  }
}

+ (NSArray)registeredLibraries
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (+[ML3MusicLibrary deviceSupportsMultipleLibraries])
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    id v11 = __Block_byref_object_copy__2480;
    id v12 = __Block_byref_object_dispose__2481;
    id v13 = 0;
    uint64_t v3 = [a1 globalSerialQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__ML3MusicLibrary_registeredLibraries__block_invoke;
    v7[3] = &unk_1E5FAF980;
    void v7[4] = &v8;
    void v7[5] = a1;
    dispatch_sync(v3, v7);

    id v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    long long v5 = [a1 autoupdatingSharedLibrary];
    v14[0] = v5;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }

  return (NSArray *)v4;
}

void __38__ML3MusicLibrary_registeredLibraries__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) musicLibraryPerUserDSID];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __46__ML3MusicLibrary_musicLibraryForUserAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) musicLibraryPerUserDSID];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v12 = +[ML3MusicLibraryResourcesManagerContext contextForSingleUserLibraryWithAccountInfo:*(void *)(a1 + 40)];
    id v6 = [[ML3MusicLibraryResourcesManager alloc] initWithContext:v12];
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 56), "_onGlobalQueue_shareableMusicLibraryWithResourcesManager:libraryFilePath:", v6, 0);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v11 = [*(id *)(a1 + 56) musicLibraryPerUserDSID];
    [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

+ (id)_onGlobalQueue_shareableMusicLibraryWithResourcesManager:(id)a3 libraryFilePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a1 globalSerialQueue];
  dispatch_assert_queue_V2(v9);

  if (!v7 && ![v8 length])
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:a1 file:@"ML3MusicLibrary.m" lineNumber:258 description:@"Must have a resource mananger or valid file path to create the library"];
  }
  if (!_onGlobalQueue_shareableMusicLibraryWithResourcesManager_libraryFilePath___cachedLibraries)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    id v11 = (void *)_onGlobalQueue_shareableMusicLibraryWithResourcesManager_libraryFilePath___cachedLibraries;
    _onGlobalQueue_shareableMusicLibraryWithResourcesManager_libraryFilePath___cachedLibraries = v10;
  }
  uint64_t v12 = [v7 pathForResourceFileOrFolder:15];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = v8;
  }
  id v15 = v14;

  long long v16 = [(id)_onGlobalQueue_shareableMusicLibraryWithResourcesManager_libraryFilePath___cachedLibraries objectForKey:v15];
  if (!v16)
  {
    long long v17 = [ML3MusicLibrary alloc];
    if (v7) {
      uint64_t v18 = [(ML3MusicLibrary *)v17 initWithResourcesManager:v7];
    }
    else {
      uint64_t v18 = [(ML3MusicLibrary *)v17 initWithPath:v15];
    }
    long long v16 = (void *)v18;
    [(id)_onGlobalQueue_shareableMusicLibraryWithResourcesManager_libraryFilePath___cachedLibraries setObject:v18 forKey:v15];
  }

  return v16;
}

- (id)artistForArtistName:(id)a3 seriesName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__5194;
  uint64_t v20 = __Block_byref_object_dispose__5195;
  id v21 = 0;
  id v8 = [(ML3MusicLibrary *)self artistGroupingKeyForArtistName:v6 seriesName:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __70__ML3MusicLibrary_ML3ArtistAdditions__artistForArtistName_seriesName___block_invoke;
    v12[3] = &unk_1E5FB57C0;
    id v14 = self;
    id v15 = &v16;
    id v13 = v8;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v12];
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __70__ML3MusicLibrary_ML3ArtistAdditions__artistForArtistName_seriesName___block_invoke(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a1[4];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v9 count:1];
  id v6 = objc_msgSend(v4, "executeQuery:withParameters:", @"SELECT ROWID FROM item_artist WHERE (grouping_key = ?)", v5, v9, v10);

  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];
  if (v7) {
    id v8 = +[ML3Entity newWithPersistentID:v7 inLibrary:a1[5]];
  }
  else {
    id v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  if (v7) {
}
  }

- (id)artistGroupingKeyForArtistName:(id)a3 seriesName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 length]) {
    id v8 = v6;
  }
  else {
    id v8 = v7;
  }
  uint64_t v9 = [(ML3MusicLibrary *)self groupingKeyForString:v8];

  return v9;
}

- (BOOL)repairAlbumArtistRelationshipsWithConnection:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 executeQuery:@"SELECT album_pid FROM album LEFT OUTER JOIN album_artist USING(album_artist_pid) WHERE album_artist IS NULL AND album_artist_pid != 0"];
  id v5 = [v4 objectsInColumn:0];

  id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 134218242;
    uint64_t v30 = [v5 count];
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEBUG, "Album -> AlbumArtist repair: Found %lu albums with invalid album artists %{public}@", buf, 0x16u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    char v20 = 1;
    *(void *)&long long v8 = 138543362;
    long long v19 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v27 = v12;
        id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v27, 1, v19);
        id v14 = [v3 executeQuery:@"SELECT album_artist_pid FROM item WHERE album_artist_pid != 0 AND album_pid = ? LIMIT 1" withParameters:v13];
        id v15 = [v14 objectForFirstRowAndColumn];

        if ([v15 longLongValue])
        {
          v26[0] = v15;
          v26[1] = v12;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
          [v3 executeUpdate:@"UPDATE album SET album_artist_pid = ? WHERE album_pid = ?" withParameters:v16 error:0];

          long long v17 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = 138543618;
            uint64_t v30 = v12;
            __int16 v31 = 2114;
            id v32 = v15;
            _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEBUG, "Updated album %{public}@ with album artist %{public}@", buf, 0x16u);
          }
        }
        else
        {
          long long v17 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = v19;
            uint64_t v30 = v12;
            _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, "Could not find valid album artist for album %{public}@", buf, 0xCu);
          }
          char v20 = 0;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }
  else
  {
    char v20 = 1;
  }

  return v20 & 1;
}

- (id)albumForAlbumArtistPersistentID:(int64_t)a3 albumName:(id)a4 feedURL:(id)a5 seasonNumber:(id)a6 compilation:(BOOL)a7
{
  BOOL v7 = a7;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(ML3MusicLibrary *)self checkoutReaderConnection];
  if ([v13 length])
  {
    v30[0] = v13;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    long long v17 = [v15 executeQuery:@"SELECT ROWID FROM album WHERE feed_url = ?" withParameters:v16];

    uint64_t v18 = [v17 int64ValueForFirstRowAndColumn];
  }
  else
  {
    uint64_t v19 = [(ML3MusicLibrary *)self groupingKeyForString:v12];
    long long v17 = (void *)v19;
    char v20 = @"SELECT ROWID FROM album WHERE (grouping_key = ?) AND (all_compilations = ?) AND (album_artist_pid = ?) AND (season_number = ?)";
    if (!v14) {
      char v20 = @"SELECT ROWID FROM album WHERE (grouping_key = ?) AND (all_compilations = ?) AND (album_artist_pid = ?)";
    }
    id v21 = objc_msgSend(NSNumber, "numberWithInt:", v7, v20, v19);
    v29[1] = v21;
    long long v22 = [NSNumber numberWithLongLong:a3];
    void v29[2] = v22;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    long long v24 = (void *)[v23 mutableCopy];

    if (v14) {
      [v24 addObject:v14];
    }
    long long v25 = [v15 executeQuery:v28 withParameters:v24];
    uint64_t v18 = [v25 int64ValueForFirstRowAndColumn];
  }
  if (v18) {
    id v26 = +[ML3Entity newWithPersistentID:v18 inLibrary:self];
  }
  else {
    id v26 = 0;
  }
  [(ML3MusicLibrary *)self checkInDatabaseConnection:v15];

  return v26;
}

- (BOOL)_validateDatabaseUsingConnection:(id)a3 error:(id *)a4
{
  *(void *)&v40[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[ML3MusicLibrary userVersionUsingConnection:v6];
  uint64_t v8 = v7;
  if ((int)v7 > 2220020)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ml_errorWithCode:description:", 3, @"Media library database is too new for this device. (version = %d, latest known version is %d)", v7, 2220020);
LABEL_3:
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138543362;
      *(void *)long long v40 = v9;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Failed to validate database with error: %{public}@", buf, 0xCu);
    }
    BOOL v11 = 0;
    goto LABEL_30;
  }
  if (!v7)
  {
    uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "User version is 0, building tables for newly created DB", buf, 2u);
    }

    if ((_ML3ValidationBuildDatabaseTables(v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ml_errorWithCode:description:", 4, @"Could not build database tables using connection %@.", v6, v35);
      goto LABEL_3;
    }
    id v9 = 0;
    goto LABEL_18;
  }
  if ((int)v7 >= 2220020)
  {
    id v15 = 0;
    goto LABEL_20;
  }
  id v12 = os_log_create("com.apple.amp.medialibrary", "Validation");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109376;
    v40[0] = v8;
    LOWORD(v40[1]) = 1024;
    *(_DWORD *)((char *)&v40[1] + 2) = 2220020;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "Migrating media library database from %d to %d", buf, 0xEu);
  }

  id v37 = 0;
  char v13 = ML3MigrationMigrateLibraryToCurrentVersion(self, v6, &v37);
  id v14 = v37;
  id v9 = 0;
  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ml_errorWithCode:description:", 5, @"Failed to migrate database from version %d to %d. %@", v8, 2220020, v14);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    long long v25 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v9 localizedDescription];
      *(_DWORD *)stat buf = 138543362;
      *(void *)long long v40 = v26;
      _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "Migration error: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = os_log_create("com.apple.amp.medialibrary", "Validation");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_ERROR, "Recreating un-migratable database...", buf, 2u);
    }

    id v28 = v6;
    __int16 v29 = v28;
    if (__daemonProcessInfo)
    {
      if ([v28 deleteDatabase])
      {
        int v30 = _ML3ValidationBuildDatabaseTables(v29);

        if (v30)
        {
          __int16 v31 = _ML3LogCategoryValidation();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)stat buf = 0;
            _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_DEFAULT, "Successfully deleted un-migratable database and re-created.", buf, 2u);
          }

          goto LABEL_12;
        }
LABEL_51:
        id v34 = os_log_create("com.apple.amp.medialibrary", "Validation");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_ERROR, "Still can't validate database after recreating.", buf, 2u);
        }

        goto LABEL_4;
      }
      uint64_t v33 = _ML3LogCategoryDefault();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1B022D000, v33, OS_LOG_TYPE_ERROR, "Could not delete database", buf, 2u);
      }
    }
    goto LABEL_51;
  }
LABEL_12:

  id v15 = v9;
  if ((int)v8 <= 1140159)
  {
LABEL_18:
    +[ML3Container populateMediaTypesOfStaticContainersInLibrary:self];
    id v15 = v9;
  }
LABEL_20:
  long long v17 = [NSString stringWithFormat:@"SELECT value FROM _MLDatabaseProperties WHERE key = '%@'", @"_UUID"];
  uint64_t v18 = [v6 executeQuery:v17];
  uint64_t v19 = [v18 objectForFirstRowAndColumn];

  if (v19)
  {
    id v9 = v15;
  }
  else
  {
    char v20 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [v20 UUIDString];

    v38[0] = v19;
    v38[1] = @"_UUID";
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v36 = v15;
    char v22 = objc_msgSend(v6, "executeUpdate:withParameters:error:", @"INSERT OR REPLACE INTO _MLDatabaseProperties (value, key) VALUES (?, ?);",
            v21,
            &v36);
    id v9 = v36;

    if ((v22 & 1) == 0)
    {
      id v32 = os_log_create("com.apple.amp.medialibrary", "Validation");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138543362;
        *(void *)long long v40 = v9;
        _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_ERROR, "Failed to insert a library UID into the database properties table. (Error = %{public}@)", buf, 0xCu);
      }

      goto LABEL_4;
    }
  }

  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Validation");
  BOOL v23 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v23)
    {
      *(_DWORD *)stat buf = 138543362;
      *(void *)long long v40 = v9;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Successfully validated database, but encountered a recoverable error: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v23)
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Successfully validated database", buf, 2u);
    }
    id v9 = 0;
  }
  BOOL v11 = 1;
LABEL_30:

  if (a4) {
    *a4 = v9;
  }

  return v11;
}

- (BOOL)coerceValidDatabaseWithError:(id *)a3
{
  [(ML3MusicLibrary *)self migratePresignedValidity];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ML3MusicLibrary_Validation__coerceValidDatabaseWithError___block_invoke;
  v6[3] = &unk_1E5FB7B88;
  void v6[4] = self;
  void v6[5] = &v7;
  void v6[6] = a3;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v6];
  LOBYTE(a3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)a3;
}

uint64_t __60__ML3MusicLibrary_Validation__coerceValidDatabaseWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _validateDatabaseUsingConnection:a2 error:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_coalesceMismatchedCollectionClass:(Class)a3 usingConnection:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(objc_class *)a3 databaseTable];
  id v47 = [(objc_class *)a3 trackForeignPersistentID];
  Class v57 = a3;
  uint64_t v8 = [(objc_class *)a3 propertiesForGroupingUniqueCollections];
  if (![v8 count])
  {
    long long v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"ML3SortMap.m", 511, @"Collection %@ has no properties for grouping unique collections. This should be impossible!", v7 object file lineNumber description];
  }
  unint64_t v9 = 0x1E4F1C000uLL;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v8 componentsJoinedByString:@", "];
  v46 = uint64_t v48 = (void *)v7;
  long long v45 = [NSString stringWithFormat:@"SELECT %@ FROM %@ GROUP BY %@ HAVING COUNT(*) > 1", v46, v7, v46];
  BOOL v11 = objc_msgSend(v6, "executeQuery:");
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke;
  void v68[3] = &unk_1E5FB83F8;
  id v12 = v10;
  id v69 = v12;
  long long v44 = v11;
  [v11 enumerateRowsWithBlock:v68];
  char v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v65 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = [NSString stringWithFormat:@"%@ = ?", *(void *)(*((void *)&v64 + 1) + 8 * i)];
        [v54 addObject:v17];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v64 objects:v77 count:16];
    }
    while (v14);
  }

  long long v43 = [v54 componentsJoinedByString:@" AND "];
  uint64_t v18 = [NSString stringWithFormat:@"SELECT ROWID FROM %@ WHERE %@", v48, v43];
  uint64_t v19 = [NSString stringWithFormat:@"UPDATE item SET %@ = ? WHERE %@ = ?", v47, v47];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v50 = v12;
  uint64_t v55 = [v50 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v61;
    char v20 = 1;
    int64_t v49 = v18;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v61 != v53) {
          objc_enumerationMutation(v50);
        }
        uint64_t v22 = *(void *)(*((void *)&v60 + 1) + 8 * j);
        id v23 = objc_alloc_init(*(Class *)(v9 + 2632));
        long long v24 = [v6 executeQuery:v18 withParameters:v22];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke_2;
        v58[3] = &unk_1E5FB83F8;
        id v25 = v23;
        id v59 = v25;
        [v24 enumerateRowsWithBlock:v58];
        unint64_t v26 = [v25 count];
        if (v26 >= 2)
        {
          unint64_t v27 = v26;
          __int16 v52 = v24;
          id v28 = [v25 objectAtIndexedSubscript:0];
          unsigned int v29 = 2;
          uint64_t v30 = 1;
          while (1)
          {
            __int16 v31 = [v25 objectAtIndexedSubscript:v30];
            v75[0] = v28;
            v75[1] = v31;
            id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
            char v33 = [v6 executeUpdate:v19 withParameters:v32 error:0];

            id v34 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
            if ((v33 & 1) == 0) {
              break;
            }
            if (v35)
            {
              uint64_t v36 = [v31 longLongValue];
              *(_DWORD *)stat buf = 138543618;
              uint64_t v72 = (uint64_t)v57;
              __int16 v73 = 2048;
              uint64_t v74 = v36;
              _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_ERROR, "Deleting duplicate %{public}@ %lld", buf, 0x16u);
            }

            uint64_t v70 = [v31 longLongValue];
            if (([(objc_class *)v57 deleteFromLibrary:self deletionType:2 persistentIDs:&v70 count:1 usingConnection:v6] & 1) == 0)
            {
              long long v39 = os_log_create("com.apple.amp.medialibrary", "SortMap");
              unint64_t v9 = 0x1E4F1C000;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                uint64_t v40 = [v31 longLongValue];
                *(_DWORD *)stat buf = 134217984;
                uint64_t v72 = v40;
                _os_log_impl(&dword_1B022D000, v39, OS_LOG_TYPE_ERROR, "Failed to delete duplicate collection with pid %lld", buf, 0xCu);
              }

              goto LABEL_29;
            }

            uint64_t v30 = v29;
            if (v27 <= v29++)
            {
              char v20 = 1;
              unint64_t v9 = 0x1E4F1C000;
              long long v24 = v52;
              goto LABEL_30;
            }
          }
          if (v35)
          {
            uint64_t v38 = [v28 longLongValue];
            *(_DWORD *)stat buf = 134217984;
            uint64_t v72 = v38;
            _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_ERROR, "Failed to repair entities converging on PID %lld", buf, 0xCu);
          }

          unint64_t v9 = 0x1E4F1C000;
LABEL_29:
          long long v24 = v52;

          char v20 = 0;
LABEL_30:

          uint64_t v18 = v49;
        }
      }
      uint64_t v55 = [v50 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v55);
  }
  else
  {
    char v20 = 1;
  }

  return v20 & 1;
}

void __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  unint64_t v3 = [v12 columnCount];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  if (v3)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      uint64_t v7 = [v12 valueForColumnIndex:v5];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F1CA98] null];
      }
      id v10 = v9;

      [v4 addObject:v10];
      uint64_t v5 = v6;
    }
    while (v3 > v6++);
  }
  [*(id *)(a1 + 32) addObject:v4];
}

void __79__ML3MusicLibrary_SortMap___coalesceMismatchedCollectionClass_usingConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 numberForColumnIndex:0];
  [*(id *)(a1 + 32) addObject:v3];
}

- (BOOL)coalesceMismatchedCollectionsUsingConnection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[ML3Collection collectionEntityClasses];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = *(objc_class **)(*((void *)&v15 + 1) + 8 * i);
        if (-[objc_class isSubclassOfClass:](v11, "isSubclassOfClass:", objc_opt_class(), (void)v15))
        {
          if (![(ML3MusicLibrary *)self _coalesceMismatchedCollectionClass:v11 usingConnection:v4])
          {
            id v12 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v13 = NSStringFromClass(v11);
              *(_DWORD *)stat buf = 138543362;
              char v20 = v13;
              _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "Failed to coalesce potentially mismatched collection %{public}@", buf, 0xCu);
            }
            goto LABEL_15;
          }
          char v8 = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_15:
    char v8 = 0;
  }

  return v8 & 1;
}

- (id)_systemUnicodeVersionData
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__6243;
  uint64_t v9 = __Block_byref_object_dispose__6244;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__ML3MusicLibrary_SortMap___systemUnicodeVersionData__block_invoke;
  v4[3] = &unk_1E5FB42F0;
  void v4[4] = &v5;
  [(ML3MusicLibrary *)self accessSortKeyBuilder:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __53__ML3MusicLibrary_SortMap___systemUnicodeVersionData__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = iPhoneSortKeyBuilderCopyVersionData(a2);

  return MEMORY[0x1F41817F8]();
}

- (int64_t)insertStringIntoSortMapNoTransaction:(id)a3
{
  v64[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    unint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"ML3SortMap.m" lineNumber:426 description:@"blank string cannot be inserted into sort map"];
  }
  uint64_t v6 = [(ML3MusicLibrary *)self checkoutWriterConnection];
  v64[0] = v5;
  v64[1] = v5;
  v64[2] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:3];
  [v6 executeUpdate:@"INSERT INTO sort_map (name, sort_key, name_section) VALUES (?, iPhoneSortKey(?), iPhoneSortSection(iPhoneSortKey(?)))", v7, 0 withParameters error];

  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 1;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = __Block_byref_object_copy__6243;
  long long v43 = __Block_byref_object_dispose__6244;
  id v44 = 0;
  id v63 = v5;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  objc_msgSend(v6, "executeQuery:withParameters:", @"SELECT sort_map1.name_order, sort_map1.name FROM sort_map AS sort_map1 WHERE sort_map1.sort_key < (SELECT sort_map2.sort_key FROM sort_map AS sort_map2 WHERE name = ?) ORDER BY sort_map1.sort_key DESC, sort_map1.name_order DESC LIMIT 1;",
  uint64_t v9 = v8);

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  void v38[2] = __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke;
  v38[3] = &unk_1E5FB76A0;
  void v38[4] = &v45;
  v38[5] = &v39;
  [v9 enumerateRowsWithBlock:v38];
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v28 = 0;
  unsigned int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__6243;
  id v32 = __Block_byref_object_dispose__6244;
  id v33 = 0;
  v62[0] = v5;
  v62[1] = v5;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  objc_msgSend(v6, "executeQuery:withParameters:", @"SELECT sort_map1.name_order, sort_map1.name FROM sort_map AS sort_map1 WHERE sort_map1.sort_key >= (SELECT sort_map2.sort_key FROM sort_map AS sort_map2 WHERE name = ?) AND sort_map1.name != ? ORDER BY sort_map1.sort_key ASC, sort_map1.name_order ASC LIMIT 1;",
  BOOL v11 = v10);

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke_2;
  v27[3] = &unk_1E5FB76A0;
  void v27[4] = &v34;
  v27[5] = &v28;
  [v11 enumerateRowsWithBlock:v27];
  uint64_t v12 = v35[3];
  if (v12 >= 0) {
    uint64_t v13 = v35[3];
  }
  else {
    uint64_t v13 = v12 + 1;
  }
  uint64_t v14 = v46[3];
  if (v14 >= 0) {
    uint64_t v15 = v46[3];
  }
  else {
    uint64_t v15 = v14 + 1;
  }
  int64_t v16 = (v15 >> 1) + (v13 >> 1);
  if (v16 == v12 || v16 == v14) {
    goto LABEL_15;
  }
  long long v17 = [NSNumber numberWithLongLong:(v15 >> 1) + (v13 >> 1)];
  v61[0] = v17;
  v61[1] = v5;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  char v19 = objc_msgSend(v6, "executeUpdate:withParameters:error:", @"UPDATE sort_map SET name_order = ? WHERE name = ?;",
          v18,
          0);

  if ((v19 & 1) == 0)
  {
    char v20 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v46[3];
      uint64_t v22 = v40[5];
      uint64_t v23 = v35[3];
      uint64_t v24 = v29[5];
      *(_DWORD *)stat buf = 134219266;
      int64_t v50 = v16;
      __int16 v51 = 2048;
      uint64_t v52 = v21;
      __int16 v53 = 2114;
      uint64_t v54 = v22;
      __int16 v55 = 2048;
      uint64_t v56 = v23;
      __int16 v57 = 2114;
      uint64_t v58 = v24;
      __int16 v59 = 2114;
      id v60 = v5;
      _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_ERROR, "Could not not insert name_order = %lld (between %lld/%{public}@ and %lld/%{public}@) for %{public}@", buf, 0x3Eu);
    }

LABEL_15:
    [(ML3MusicLibrary *)self updateSortMap];
    int64_t v16 = [(ML3MusicLibrary *)self nameOrderForString:v5];
  }
  [(ML3MusicLibrary *)self checkInDatabaseConnection:v6];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v16;
}

void __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ForColumnIndex:0];
  uint64_t v4 = [v3 stringForColumnIndex:1];

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __65__ML3MusicLibrary_SortMap__insertStringIntoSortMapNoTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ForColumnIndex:0];
  uint64_t v4 = [v3 stringForColumnIndex:1];

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)insertStringsIntoSortMap:(id)a3
{
  return [(ML3MusicLibrary *)self insertStringsIntoSortMap:a3 didReSortMap:0];
}

- (id)insertStringsIntoSortMap:(id)a3 didReSortMap:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__6243;
  long long v18 = __Block_byref_object_dispose__6244;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __66__ML3MusicLibrary_SortMap__insertStringsIntoSortMap_didReSortMap___block_invoke;
  void v10[3] = &unk_1E5FB42C8;
  void v10[4] = self;
  id v7 = v6;
  uint64_t v12 = &v14;
  uint64_t v13 = a4;
  id v11 = v7;
  [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __66__ML3MusicLibrary_SortMap__insertStringsIntoSortMap_didReSortMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = -[ML3SortMap initWithConnection:library:preloadNames:]([ML3SortMap alloc], "initWithConnection:library:preloadNames:", v3, *(void *)(a1 + 32), (unint64_t)[*(id *)(a1 + 40) count] > 0x32);

  if ([(ML3SortMap *)v7 insertStringsIntoSortMap:*(void *)(a1 + 40) didReSortMap:*(void *)(a1 + 56)]&& [(ML3SortMap *)v7 commitUpdates])
  {
    uint64_t v4 = [(ML3SortMap *)v7 nameOrders];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)nameOrderForString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3010000000;
    uint64_t v15 = "";
    long long v16 = *(_OWORD *)"";
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke;
    v9[3] = &unk_1E5FB7640;
    id v10 = v4;
    id v11 = &v12;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v9];
    int64_t v6 = v13[4];
    unint64_t v5 = v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    unint64_t v5 = [(ML3MusicLibrary *)self unknownSectionIndex];
    int64_t v6 = 0;
  }

  int64_t v7 = v6;
  int64_t v8 = v5;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

void __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  unint64_t v5 = [v3 arrayWithObjects:v8 count:1];
  objc_msgSend(v4, "executeQuery:withParameters:", @"SELECT name_order, name_section FROM sort_map WHERE name = ? LIMIT 1;",
  int64_t v6 = v5);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke_2;
  v7[3] = &unk_1E5FB77B8;
  void v7[4] = *(void *)(a1 + 40);
  [v6 enumerateRowsWithBlock:v7];
}

void __47__ML3MusicLibrary_SortMap__nameOrderForString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 int64ForColumnIndex:0];
  int v8 = [v6 intForColumnIndex:1];

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v9 + 32) = v7;
  *(void *)(v9 + 40) = v8;
  *a4 = 1;
}

- (BOOL)validateSortMapUnicodeVersionOnConnection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLSortMapUnicodeVersion"];
  id v6 = [(ML3MusicLibrary *)self _systemUnicodeVersionData];
  if (v5 && ([v5 isEqualToData:v6] & 1) != 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    int v8 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "System unicode version does not match version stored in the library -- upgrading sort map", v10, 2u);
    }

    BOOL v7 = [(ML3MusicLibrary *)self updateSortMapOnConnection:v4 forceUpdateOriginals:1];
  }

  return v7;
}

- (BOOL)inTransactionUpdateSearchMapOnConnection:(id)a3
{
  id v3 = a3;
  if [v3 executeUpdate:@"INSERT OR REPLACE INTO item_search (item_pid, search_title) SELECT item_extra.item_pid, sort_map.name_order from sort_map JOIN item_extra ON item_extra.title = sort_map.name"]&& objc_msgSend(v3, "executeUpdate:", @"UPDATE item_search SET search_albuuint64_t m = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN album ON album.albuuint64_t m = sort_map.name JOIN item ON item.album_pid = album.album_pid WHERE item.item_pid = item_search.item_pid), 0)")&& objc_msgSend(v3, "executeUpdate:", @"UPDATE item_search SET search_artist = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN item_artist ON item_artist.item_artist = sort_map.name JOIN item ON item.item_artist_pid = item_artist.item_artist_pid WHERE item.item_pid = item_search.item_pid), 0)")&& objc_msgSend(v3, "executeUpdate:", @"UPDATE item_search SET search_composer = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN composer ON composer.composer = sort_map.name JOIN item ON item.composer_pid = composer.composer_pid WHERE item.item_pid = item_search.item_pid), 0)")&& (objc_msgSend(v3, "executeUpdate:", @"UPDATE item_search SET search_album_artist = IFNULL((SELECT sort_map.name_order FROM sort_map JOIN album_artist ON album_artist.album_artist = sort_map.name JOIN item ON item.album_artist_pid = album_artist.album_artist_pid WHERE item.item_pid = item_search.item_pid), 0)"))
  {
    BOOL v4 = 1;
  }
  else
  {
    unint64_t v5 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_ERROR, "failed to update item_search entries", v7, 2u);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)inTransactionUpdateSortMapOnConnection:(id)a3 forceRebuild:(BOOL)a4 forceUpdateOriginals:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v163 = 0;
  v164 = &v163;
  uint64_t v165 = 0x2020000000;
  char v166 = 1;
  int v8 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Rebuilding the sort_map table", buf, 2u);
  }

  uint64_t v9 = [v7 executeQuery:@"SELECT COUNT(name) FROM sqlite_master WHERE type='table' AND name = 'sort_map'"];;
  int v10 = [v9 int64ValueForFirstRowAndColumn] == 1;

  if (v10)
  {
    id v11 = [v7 executeQuery:@"SELECT ROWID FROM sort_map LIMIT 1;"];
    int v10 = [v11 hasAtLeastOneRow];
  }
  char v12 = [v7 executeUpdate:@"DROP TABLE IF EXISTS sort_map_new"];
  *((unsigned char *)v164 + 24) = v12;
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "failed to delete existing sort_map_new table", buf, 2u);
    }
  }
  uint64_t v14 = +[ML3MusicLibrary sortMapNewSchemaSQL];
  char v15 = [v7 executeUpdate:v14];
  *((unsigned char *)v164 + 24) = v15;

  if (v15)
  {
    if (!v10 || a4)
    {
      char v22 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT title, iPhoneSortKey(title) FROM item_extra;"];
      if (*((unsigned char *)v164 + 24)) {
        char v23 = v22;
      }
      else {
        char v23 = 0;
      }
      *((unsigned char *)v164 + 24) = v23;
      char v24 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(title), iPhoneSortKey(ML3SortString(title)) FROM item_extra;"];
      if (*((unsigned char *)v164 + 24)) {
        char v25 = v24;
      }
      else {
        char v25 = 0;
      }
      *((unsigned char *)v164 + 24) = v25;
      char v26 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_title, iPhoneSortKey(sort_title) FROM item_extra;"];
      if (*((unsigned char *)v164 + 24)) {
        char v27 = v26;
      }
      else {
        char v27 = 0;
      }
      *((unsigned char *)v164 + 24) = v27;
      char v28 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT item_artist, iPhoneSortKey(item_artist) FROM item_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v29 = v28;
      }
      else {
        char v29 = 0;
      }
      *((unsigned char *)v164 + 24) = v29;
      char v30 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(item_artist), iPhoneSortKey(ML3SortString(item_artist)) FROM item_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v31 = v30;
      }
      else {
        char v31 = 0;
      }
      *((unsigned char *)v164 + 24) = v31;
      char v32 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_item_artist, iPhoneSortKey(sort_item_artist) FROM item_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v33 = v32;
      }
      else {
        char v33 = 0;
      }
      *((unsigned char *)v164 + 24) = v33;
      char v34 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT series_name, iPhoneSortKey(series_name) FROM item_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v35 = v34;
      }
      else {
        char v35 = 0;
      }
      *((unsigned char *)v164 + 24) = v35;
      char v36 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(series_name), iPhoneSortKey(ML3SortString(series_name)) FROM item_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v37 = v36;
      }
      else {
        char v37 = 0;
      }
      *((unsigned char *)v164 + 24) = v37;
      char v38 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_series_name, iPhoneSortKey(sort_series_name) FROM item_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v39 = v38;
      }
      else {
        char v39 = 0;
      }
      *((unsigned char *)v164 + 24) = v39;
      char v40 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT album_artist, iPhoneSortKey(album_artist) FROM album_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v41 = v40;
      }
      else {
        char v41 = 0;
      }
      *((unsigned char *)v164 + 24) = v41;
      char v42 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(album_artist), iPhoneSortKey(ML3SortString(album_artist)) FROM album_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v43 = v42;
      }
      else {
        char v43 = 0;
      }
      *((unsigned char *)v164 + 24) = v43;
      char v44 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_album_artist, iPhoneSortKey(sort_album_artist) FROM album_artist;"];
      if (*((unsigned char *)v164 + 24)) {
        char v45 = v44;
      }
      else {
        char v45 = 0;
      }
      *((unsigned char *)v164 + 24) = v45;
      char v46 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT album, iPhoneSortKey(album) FROM album;"];
      if (*((unsigned char *)v164 + 24)) {
        char v47 = v46;
      }
      else {
        char v47 = 0;
      }
      *((unsigned char *)v164 + 24) = v47;
      char v48 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(album), iPhoneSortKey(ML3SortString(album)) FROM album;"];
      if (*((unsigned char *)v164 + 24)) {
        char v49 = v48;
      }
      else {
        char v49 = 0;
      }
      *((unsigned char *)v164 + 24) = v49;
      char v50 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_album, iPhoneSortKey(sort_album) FROM album;"];
      if (*((unsigned char *)v164 + 24)) {
        char v51 = v50;
      }
      else {
        char v51 = 0;
      }
      *((unsigned char *)v164 + 24) = v51;
      char v52 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT season_number, iPhoneSortKey(season_number) FROM album;"];
      if (*((unsigned char *)v164 + 24)) {
        char v53 = v52;
      }
      else {
        char v53 = 0;
      }
      *((unsigned char *)v164 + 24) = v53;
      char v54 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT composer, iPhoneSortKey(composer) FROM composer;"];
      if (*((unsigned char *)v164 + 24)) {
        char v55 = v54;
      }
      else {
        char v55 = 0;
      }
      *((unsigned char *)v164 + 24) = v55;
      char v56 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(composer), iPhoneSortKey(ML3SortString(composer)) FROM composer;"];
      if (*((unsigned char *)v164 + 24)) {
        char v57 = v56;
      }
      else {
        char v57 = 0;
      }
      *((unsigned char *)v164 + 24) = v57;
      char v58 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_composer, iPhoneSortKey(sort_composer) FROM composer;"];
      if (*((unsigned char *)v164 + 24)) {
        char v59 = v58;
      }
      else {
        char v59 = 0;
      }
      *((unsigned char *)v164 + 24) = v59;
      char v60 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT genre, iPhoneSortKey(genre) FROM genre;"];
      if (*((unsigned char *)v164 + 24)) {
        char v61 = v60;
      }
      else {
        char v61 = 0;
      }
      *((unsigned char *)v164 + 24) = v61;
      int v19 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT name, iPhoneSortKey(name) FROM container;"];
    }
    else
    {
      char v16 = [v7 executeUpdate:@"INSERT INTO sort_map_new (name, sort_key) SELECT name, iPhoneSortKey(name) FROM sort_map;"];
      *((unsigned char *)v164 + 24) = v16;
      char v17 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT ML3SortString(name), iPhoneSortKey(ML3SortString(name)) FROM sort_map;"];
      if (*((unsigned char *)v164 + 24)) {
        char v18 = v17;
      }
      else {
        char v18 = 0;
      }
      *((unsigned char *)v164 + 24) = v18;
      int v19 = [v7 executeUpdate:@"INSERT OR IGNORE INTO sort_map_new (name, sort_key) SELECT sort_composer, iPhoneSortKey(sort_composer) FROM composer WHERE sort_composer IS NOT NULL;"];
    }
    long long v62 = v164;
    if (*((unsigned char *)v164 + 24)) {
      int v63 = v19;
    }
    else {
      int v63 = 0;
    }
    *((unsigned char *)v164 + 24) = v63;
    if (v63) {
      goto LABEL_87;
    }
    char v20 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      uint64_t v21 = "failed to populate sort_map_new";
      goto LABEL_85;
    }
  }
  else
  {
    char v20 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      uint64_t v21 = "failed to create sort_map_new";
LABEL_85:
      _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    }
  }

  long long v62 = v164;
LABEL_87:
  if (!*((unsigned char *)v62 + 24)) {
    goto LABEL_163;
  }
  int v64 = [v7 executeUpdate:@"UPDATE sort_map_new SET name_section = iPhoneSortSection(sort_key);"];
  *((unsigned char *)v164 + 24) = v64;
  if (!v64) {
    goto LABEL_168;
  }
  int v65 = [v7 executeUpdate:@"CREATE TEMPORARY TABLE sort_map_new_in_order (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, UNIQUE (name));"];
  *((unsigned char *)v164 + 24) = v65;
  if (!v65) {
    goto LABEL_168;
  }
  int v66 = [v7 executeUpdate:@"INSERT INTO sort_map_new_in_order (name) SELECT name FROM sort_map_new ORDER BY sort_key;"];
  *((unsigned char *)v164 + 24) = v66;
  if (!v66) {
    goto LABEL_168;
  }
  int v67 = [v7 executeUpdate:@"UPDATE sort_map_new SET name_order = (SELECT sort_map_new_in_order.ROWID << 32 FROM sort_map_new_in_order WHERE sort_map_new.name = sort_map_new_in_order.name);"];
  *((unsigned char *)v164 + 24) = v67;
    || ([NSString stringWithFormat:@"INSERT OR REPLACE INTO sort_map_new (name, name_order, name_section, sort_key) VALUES ('', 0, %u, '')", -[ML3MusicLibrary unknownSectionIndex](self, "unknownSectionIndex")], long long v68 = if (!v67;
        *((unsigned char *)v164 + 24) = v70,
        (v70 & 1) == 0))
  {
LABEL_168:
    uint64_t v71 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v71, OS_LOG_TYPE_ERROR, "failed to re-order sort-map entries", buf, 2u);
    }

    if (!*((unsigned char *)v164 + 24)) {
      goto LABEL_163;
    }
  }
  if (v10 && !a4)
  {
    uint64_t v72 = [v7 executeQuery:@"SELECT sort_map.name FROM sort_map JOIN sort_map_new ON sort_map.name = sort_map_new.name WHERE (sort_map_new.name_order != sort_map.name_order) OR (sort_map_new.name_section != sort_map.name_section) LIMIT 1"];;
    if ([v72 hasAtLeastOneRow])
    {
      __int16 v73 = os_log_create("com.apple.amp.medialibrary", "SortMap");
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl(&dword_1B022D000, v73, OS_LOG_TYPE_ERROR, "Sort collations changed, need to recompute", buf, 2u);
      }
    }
    else
    {

      if (!v5) {
        goto LABEL_128;
      }
    }
  }
  uint64_t v74 = [MEMORY[0x1E4F1CA60] dictionary];
  v159[0] = MEMORY[0x1E4F143A8];
  v159[1] = 3221225472;
  v159[2] = __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke;
  v159[3] = &unk_1E5FB4278;
  v162 = &v163;
  id v143 = v74;
  id v160 = v143;
  id v75 = v7;
  id v161 = v75;
  +[ML3MusicLibrary enumerateSortMapTablesUsingBlock:v159];
  long long v76 = [MEMORY[0x1E4F1CA48] array];
  long long v77 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v78 = [MEMORY[0x1E4F1CA48] array];
  long long v79 = [MEMORY[0x1E4F1CA48] array];
  v153[0] = MEMORY[0x1E4F143A8];
  v153[1] = 3221225472;
  v153[2] = __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke_2;
  v153[3] = &unk_1E5FB42A0;
  id v141 = v76;
  id v154 = v141;
  v155 = self;
  id v80 = v77;
  id v156 = v80;
  id v81 = v78;
  id v157 = v81;
  id v142 = v79;
  id v158 = v142;
  [v143 enumerateKeysAndObjectsUsingBlock:v153];
  id v82 = objc_alloc_init(ML3ItemTable);
  id v83 = [(ML3ItemTable *)v82 columns];
  id v84 = [v83 valueForKey:@"name"];

  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v85 = v84;
  uint64_t v86 = [v85 countByEnumeratingWithState:&v149 objects:v171 count:16];
  if (v86)
  {
    uint64_t v87 = *(void *)v150;
    do
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v150 != v87) {
          objc_enumerationMutation(v85);
        }
        uint64_t v89 = *(void *)(*((void *)&v149 + 1) + 8 * i);
        if (([v80 containsObject:v89] & 1) == 0)
        {
          [v80 addObject:v89];
          v90 = [@"item." stringByAppendingString:v89];
          [v81 addObject:v90];
        }
      }
      uint64_t v86 = [v85 countByEnumeratingWithState:&v149 objects:v171 count:16];
    }
    while (v86);
  }

  v91 = +[ML3MusicLibrary itemNewSchemaSQL];
  char v92 = [v75 executeUpdate:v91];
  *((unsigned char *)v164 + 24) = v92;

  if (v92)
  {
    id v93 = NSString;
    id v94 = [v141 componentsJoinedByString:@", "];
    long long v95 = [v80 componentsJoinedByString:@", "];
    id v96 = [v81 componentsJoinedByString:@", "];
    id v97 = [v142 componentsJoinedByString:@" LEFT JOIN "];
    objc_msgSend(v93, "stringWithFormat:", @"WITH %@ INSERT OR REPLACE INTO item_new (%@) SELECT %@ FROM item LEFT JOIN %@;",
      v94,
      v95,
      v96,
    int v98 = v97);

    int v99 = [v75 executeUpdate:v98];
    *((unsigned char *)v164 + 24) = v99;
    if (v99)
    {
      int v100 = [v75 executeUpdate:@"DROP TABLE IF EXISTS item;"];
      *((unsigned char *)v164 + 24) = v100;
      if (v100)
      {
        int v101 = [v75 executeUpdate:@"ALTER TABLE item_new RENAME TO item;"];
        *((unsigned char *)v164 + 24) = v101;
        if (v101)
        {
          long long v147 = 0u;
          long long v148 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          __int16 v102 = +[ML3MusicLibrary itemIndexSchemaSQL];
          uint64_t v103 = [v102 countByEnumeratingWithState:&v145 objects:v170 count:16];
          if (v103)
          {
            uint64_t v104 = *(void *)v146;
LABEL_118:
            uint64_t v105 = 0;
            while (1)
            {
              if (*(void *)v146 != v104) {
                objc_enumerationMutation(v102);
              }
              char v106 = [v75 executeUpdate:*(void *)(*((void *)&v145 + 1) + 8 * v105)];
              *((unsigned char *)v164 + 24) = v106;
              if ((v106 & 1) == 0) {
                break;
              }
              if (v103 == ++v105)
              {
                uint64_t v103 = [v102 countByEnumeratingWithState:&v145 objects:v170 count:16];
                if (v103) {
                  goto LABEL_118;
                }
                break;
              }
            }
          }

          [v75 executeUpdate:@"ANALYZE;"];
        }
      }
    }
  }
  else
  {
    int v98 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v98, OS_LOG_TYPE_ERROR, "failed to create item_new", buf, 2u);
    }
  }

LABEL_128:
  if (*((unsigned char *)v164 + 24)) {
    goto LABEL_169;
  }
  long long v107 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_1B022D000, v107, OS_LOG_TYPE_ERROR, "failed to update tables with new name_orders", buf, 2u);
  }

  if (*((unsigned char *)v164 + 24))
  {
LABEL_169:
    int v108 = [v7 executeUpdate:@"DROP TABLE IF EXISTS sort_map;"];
    *((unsigned char *)v164 + 24) = v108;
    if (v108)
    {
      int v109 = [v7 executeUpdate:@"ALTER TABLE sort_map_new RENAME TO sort_map;"];
      *((unsigned char *)v164 + 24) = v109;
      if (v109)
      {
        char v110 = [v7 executeUpdate:@"CREATE INDEX IF NOT EXISTS SortMapSortKeys ON sort_map (sort_key ASC);"];
        *((unsigned char *)v164 + 24) = v110;
        if (v110) {
          goto LABEL_170;
        }
      }
    }
    long long v111 = os_log_create("com.apple.amp.medialibrary", "SortMap");
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v111, OS_LOG_TYPE_ERROR, "failed to swap sort_map tables", buf, 2u);
    }

    if (*((unsigned char *)v164 + 24))
    {
LABEL_170:
      long long v112 = NSString;
      long long v113 = ML3LocalizationLanguageCanonicalIdentifier();
      id v114 = [v112 stringWithFormat:@"INSERT OR REPLACE INTO _MLDatabaseProperties (key, value) VALUES ('OrderingLanguage', '%@')", v113];

      int v115 = [v7 executeUpdate:v114];
      *((unsigned char *)v164 + 24) = v115;
      if (!v115) {
        goto LABEL_144;
      }
      int v116 = [v7 executeUpdate:@"UPDATE item_artist SET grouping_key = iPhoneGroupingKey((CASE LENGTH(series_name) WHEN 0 THEN item_artist ELSE series_name END))"];
      *((unsigned char *)v164 + 24) = v116;
      if (!v116) {
        goto LABEL_144;
      }
      int v117 = [v7 executeUpdate:@"UPDATE album_artist SET grouping_key = iPhoneGroupingKey(album_artist), sort_order = IFNULL((SELECT name_order FROM sort_map WHERE name = IFNULL(album_artist.sort_album_artist, ML3SortString(album_artist.album_artist))), 0), sort_order_section = IFNULL((SELECT name_section FROM sort_map WHERE name = IFNULL(album_artist.sort_album_artist, ML3SortString(album_artist.album_artist))), 0), name_order = IFNULL((SELECT name_order FROM sort_map WHERE name = IFNULL(album_artist.album_artist, '')), 0)"];
      *((unsigned char *)v164 + 24) = v117;
      if (!v117
        || (int v118 = [v7 executeUpdate:@"UPDATE album SET grouping_key = iPhoneGroupingKey(album)"],
            *((unsigned char *)v164 + 24) = v118,
            !v118)
        || (v119 = [v7 executeUpdate:@"UPDATE composer SET grouping_key = iPhoneGroupingKey(composer)"], *((unsigned char *)v164 + 24) = v119, !v119)|| (char v120 = objc_msgSend(v7, "executeUpdate:", @"UPDATE genre SET grouping_key = iPhoneGroupingKey(genre)"), *((unsigned char *)v164 + 24) = v120, (v120 & 1) == 0))
      {
LABEL_144:
        uint64_t v121 = os_log_create("com.apple.amp.medialibrary", "SortMap");
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_1B022D000, v121, OS_LOG_TYPE_ERROR, "failed to update grouping_key fields", buf, 2u);
        }
      }
      if (*((unsigned char *)v164 + 24))
      {
        uint64_t v122 = [(ML3MusicLibrary *)self _systemUnicodeVersionData];
        v123 = [NSString stringWithFormat:@"SELECT value FROM _MLDatabaseProperties WHERE key = '%@'", @"MLSortMapUnicodeVersion"];
        uint64_t v124 = [v7 executeQuery:v123];
        v125 = [v124 objectForFirstRowAndColumn];

        if ([v122 isEqualToData:v125])
        {
LABEL_158:
          v133 = [NSString stringWithFormat:@"INSERT OR REPLACE INTO _MLDatabaseProperties (key, value) VALUES (?, ?)"];
          v169[0] = @"MLSortMapUnicodeVersion";
          v169[1] = v122;
          v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:2];
          char v135 = [v7 executeUpdate:v133 withParameters:v134 error:0];
          *((unsigned char *)v164 + 24) = v135;

          if (!*((unsigned char *)v164 + 24))
          {
            v136 = os_log_create("com.apple.amp.medialibrary", "SortMap");
            if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)stat buf = 0;
              _os_log_impl(&dword_1B022D000, v136, OS_LOG_TYPE_ERROR, "failed to update library unicode version", buf, 2u);
            }
          }
          goto LABEL_163;
        }
        uint64_t v126 = os_log_create("com.apple.amp.medialibrary", "SortMap");
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_1B022D000, v126, OS_LOG_TYPE_ERROR, "Unicode version has changed after sort map update. Coalescing mismatched collections...", buf, 2u);
        }

        +[ML3Collection removeOrphanedCollectionsInLibrary:self usingConnection:v7];
        BOOL v127 = [(ML3MusicLibrary *)self coalesceMismatchedCollectionsUsingConnection:v7];
        v128 = os_log_create("com.apple.amp.medialibrary", "SortMap");
        uint64_t v129 = v128;
        if (v127)
        {
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)stat buf = 0;
            v130 = "Successfully coalesced mismatched collections.";
            v131 = v129;
            os_log_type_t v132 = OS_LOG_TYPE_DEFAULT;
LABEL_156:
            _os_log_impl(&dword_1B022D000, v131, v132, v130, buf, 2u);
          }
        }
        else if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)stat buf = 0;
          v130 = "failed to coalesce mismatched collections after rebuilding sort map";
          v131 = v129;
          os_log_type_t v132 = OS_LOG_TYPE_ERROR;
          goto LABEL_156;
        }

        goto LABEL_158;
      }
    }
  }
LABEL_163:
  v137 = os_log_create("com.apple.amp.medialibrary", "SortMap");
  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
  {
    int v138 = *((unsigned __int8 *)v164 + 24);
    *(_DWORD *)stat buf = 67109120;
    int v168 = v138;
    _os_log_impl(&dword_1B022D000, v137, OS_LOG_TYPE_DEFAULT, "Finished rebuilding the sort_map table. success = %{BOOL}u", buf, 8u);
  }

  BOOL v139 = *((unsigned char *)v164 + 24) != 0;
  _Block_object_dispose(&v163, 8);

  return v139;
}

void __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (v12 && [v9 isEqualToString:@"item"])
    {
      v16[0] = v11;
      v16[1] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v10];
    }
    else
    {
      uint64_t v14 = [NSString stringWithFormat:@"IFNULL((SELECT sort_map_new.name_order FROM sort_map_new WHERE sort_map_new.name = (CASE %@ WHEN '' THEN NULL ELSE %@ END)), 0)", v11, v11];
      char v15 = [NSString stringWithFormat:@"UPDATE %@ SET %@ = %@", v9, v10, v14];;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) executeUpdate:v15];
    }
  }
}

void __101__ML3MusicLibrary_SortMap__inTransactionUpdateSortMapOnConnection_forceRebuild_forceUpdateOriginals___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
  id v23 = [v7 stringByAppendingString:@"_view"];

  int v8 = [v23 stringByAppendingString:@"_sq"];
  id v9 = [v5 objectAtIndexedSubscript:0];
  id v10 = [v5 objectAtIndexedSubscript:1];

  id v11 = *(void **)(a1 + 32);
  id v12 = [NSString stringWithFormat:@"%1$@(pid, name_order, name_section) AS (SELECT %3$@.pid, sort_map_new.name_order, sort_map_new.name_section FROM sort_map_new JOIN %2$@ AS %3$@ ON sort_map_new.name = %3$@.name UNION SELECT 0, 0, %4$u)", v23, v9, v8, objc_msgSend(*(id *)(a1 + 40), "unknownSectionIndex")];
  [v11 addObject:v12];

  uint64_t v13 = *(void **)(a1 + 48);
  uint64_t v14 = [v6 stringByReplacingOccurrencesOfString:@"item." withString:&stru_1F08D4D70];
  [v13 addObject:v14];

  char v15 = *(void **)(a1 + 56);
  char v16 = [NSString stringWithFormat:@"%@.name_order", v23];
  [v15 addObject:v16];

  char v17 = *(void **)(a1 + 48);
  char v18 = [v6 stringByAppendingString:@"_section"];

  [v17 addObject:v18];
  int v19 = *(void **)(a1 + 56);
  char v20 = [NSString stringWithFormat:@"%@.name_section", v23];
  [v19 addObject:v20];

  uint64_t v21 = *(void **)(a1 + 64);
  char v22 = objc_msgSend(NSString, "stringWithFormat:", @"%1$@ ON %2$@ = %1$@.pid", v23, v10);
  [v21 addObject:v22];
}

- (BOOL)inTransactionUpdateSortMapOnConnection:(id)a3 forceUpdateOriginals:(BOOL)a4
{
  return [(ML3MusicLibrary *)self inTransactionUpdateSortMapOnConnection:a3 forceRebuild:0 forceUpdateOriginals:a4];
}

- (BOOL)updateSortMapOnConnection:(id)a3 forceUpdateOriginals:(BOOL)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __75__ML3MusicLibrary_SortMap__updateSortMapOnConnection_forceUpdateOriginals___block_invoke;
  void v10[3] = &unk_1E5FB4250;
  void v10[4] = self;
  id v7 = v6;
  BOOL v13 = a4;
  id v11 = v7;
  id v12 = &v14;
  [v7 performTransactionWithBlock:v10];
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __75__ML3MusicLibrary_SortMap__updateSortMapOnConnection_forceUpdateOriginals___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) inTransactionUpdateSortMapOnConnection:*(void *)(a1 + 40) forceUpdateOriginals:*(unsigned __int8 *)(a1 + 56)])*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "inTransactionUpdateSearchMapOnConnection:", *(void *)(a1 + 40)); {
  else
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (BOOL)updateSortMapOnConnection:(id)a3
{
  return [(ML3MusicLibrary *)self updateSortMapOnConnection:a3 forceUpdateOriginals:0];
}

- (id)genreForGenre:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__7430;
  char v17 = __Block_byref_object_dispose__7431;
  id v18 = 0;
  id v5 = [(ML3MusicLibrary *)self groupingKeyForString:v4];
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __52__ML3MusicLibrary_ML3GenreAdditions__genreForGenre___block_invoke;
    v9[3] = &unk_1E5FB57C0;
    id v11 = self;
    id v12 = &v13;
    id v10 = v5;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v9];
  }
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __52__ML3MusicLibrary_ML3GenreAdditions__genreForGenre___block_invoke(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a1[4];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v9 count:1];
  id v6 = objc_msgSend(v4, "executeQuery:withParameters:", @"SELECT ROWID FROM genre WHERE (grouping_key = ?)", v5, v9, v10);

  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];
  if (v7) {
    id v8 = +[ML3Entity newWithPersistentID:v7 inLibrary:a1[5]];
  }
  else {
    id v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  if (v7) {
}
  }

- (id)composerForComposerName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__9227;
  char v17 = __Block_byref_object_dispose__9228;
  id v18 = 0;
  id v5 = [(ML3MusicLibrary *)self groupingKeyForString:v4];
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __65__ML3MusicLibrary_ML3ComposerAdditions__composerForComposerName___block_invoke;
    v9[3] = &unk_1E5FB57C0;
    id v11 = self;
    id v12 = &v13;
    id v10 = v5;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v9];
  }
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __65__ML3MusicLibrary_ML3ComposerAdditions__composerForComposerName___block_invoke(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a1[4];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v9 count:1];
  id v6 = objc_msgSend(v4, "executeQuery:withParameters:", @"SELECT ROWID FROM composer WHERE (grouping_key = ?)", v5, v9, v10);

  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];
  if (v7) {
    id v8 = +[ML3Entity newWithPersistentID:v7 inLibrary:a1[5]];
  }
  else {
    id v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  if (v7) {
}
  }

- (id)albumArtistForEffectiveAlbumArtistName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__9336;
  char v17 = __Block_byref_object_dispose__9337;
  id v18 = 0;
  id v5 = [(ML3MusicLibrary *)self groupingKeyForString:v4];
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __83__ML3MusicLibrary_ML3AlbumArtistAdditions__albumArtistForEffectiveAlbumArtistName___block_invoke;
    v9[3] = &unk_1E5FB57C0;
    id v11 = self;
    id v12 = &v13;
    id v10 = v5;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:0 withBlock:v9];
  }
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __83__ML3MusicLibrary_ML3AlbumArtistAdditions__albumArtistForEffectiveAlbumArtistName___block_invoke(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a1[4];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v9 count:1];
  id v6 = objc_msgSend(v4, "executeQuery:withParameters:", @"SELECT ROWID FROM album_artist WHERE (grouping_key = ?)", v5, v9, v10);

  uint64_t v7 = [v6 int64ValueForFirstRowAndColumn];
  if (v7) {
    id v8 = +[ML3Entity newWithPersistentID:v7 inLibrary:a1[5]];
  }
  else {
    id v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
  if (v7) {
}
  }

- (void)_updateSystemPlaylist:(id)a3 withName:(id)a4 usingConnection:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    v23[0] = v8;
    uint64_t v10 = NSNumber;
    id v11 = a5;
    id v12 = objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v23[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v18 = 0;
    char v14 = [v11 executeUpdate:@"UPDATE container SET name = ? WHERE container_pid = ?" withParameters:v13 error:&v18];

    id v15 = v18;
    if ((v14 & 1) == 0)
    {
      uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v7 persistentID];
        *(_DWORD *)stat buf = 134218242;
        uint64_t v20 = v17;
        __int16 v21 = 2114;
        char v22 = v9;
        _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "Failed to update name of container %lld (%{public}@)", buf, 0x16u);
      }
    }
  }
}

- (void)updateOrderingLanguagesForCurrentLanguage
{
  uint64_t v3 = ML3LocalizationLanguageCanonicalIdentifier();
  if (!v3) {
    __assert_rtn("-[ML3MusicLibrary(ProcessingAdditions) updateOrderingLanguagesForCurrentLanguage]", "ML3MusicLibraryProcessingAdditions.m", 50, "currentLanaguage");
  }
  id v4 = (id)v3;
  [(ML3MusicLibrary *)self setValue:v3 forDatabaseProperty:@"OrderingLanguage"];
}

- (BOOL)updateSystemPlaylistNamesForCurrentLanguageUsingConnection:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"GENIUS_PLAYLIST_NAME" value:&stru_1F08D4D70 table:@"MLLocalizable"];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_1F08D4D70;
  }
  uint64_t v9 = v8;

  uint64_t v10 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.is_container_type_active_target AND container.smart_is_genius)" equalToInteger:1];
  id v11 = +[ML3Entity anyInLibrary:self predicate:v10];

  [(ML3MusicLibrary *)self _updateSystemPlaylist:v11 withName:v9 usingConnection:v4];
  id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"ON_THE_GO_PLAYLIST_NAME" value:&stru_1F08D4D70 table:@"MLLocalizable"];
  char v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_1F08D4D70;
  }
  uint64_t v16 = v15;

  uint64_t v17 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.is_container_type_active_target AND (container.container_type = 2))" equalToInteger:1];
  id v18 = +[ML3Entity anyInLibrary:self predicate:v17];

  [(ML3MusicLibrary *)self _updateSystemPlaylist:v18 withName:v16 usingConnection:v4];
  int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v20 = [v19 localizedStringForKey:@"PLAYBACK_HISTORY_PLAYLIST_NAME" value:&stru_1F08D4D70 table:@"MLLocalizable"];
  __int16 v21 = (void *)v20;
  if (v20) {
    char v22 = (__CFString *)v20;
  }
  else {
    char v22 = &stru_1F08D4D70;
  }
  id v23 = v22;

  char v24 = [(ML3MusicLibrary *)self currentDevicePlaybackHistoryPlaylist];

  [(ML3MusicLibrary *)self _updateSystemPlaylist:v24 withName:v23 usingConnection:v4];
  +[ML3Container updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary:self];

  return 1;
}

- (int64_t)_clearPurgeableTracksOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeCloudAssets:(BOOL)a5 includeAutoFilledTracks:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke;
  v26[3] = &unk_1E5FB5CF0;
  char v28 = &v30;
  v26[4] = self;
  id v12 = v11;
  id v27 = v12;
  int64_t v29 = a3;
  [(ML3MusicLibrary *)self _enumeratePurgeableTracksForUrgency:a4 includeAutoFilledTracks:v6 includeCloudAssets:v7 usingBlock:v26];
  if ([v12 count]
    && !+[ML3Track unlinkRedownloadableAssetsFromLibrary:self persistentIDs:v12])
  {
    char v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "Failed to purge redownloadable assets", buf, 2u);
    }

    int64_t v15 = [(ML3MusicLibrary *)self _clearAllCloudAssets];
    v31[3] += v15;
    BOOL v13 = +[ML3Track unlinkRedownloadableAssetsFromLibrary:self persistentIDs:v12];
  }
  else
  {
    BOOL v13 = 1;
  }
  if (a4 == 3 && v13 && [v12 count])
  {
    uint64_t v16 = objc_msgSend(&stru_1F08D4D70, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(v12, "count") - 1, @",?", 1);
    uint64_t v17 = [NSString stringWithFormat:@"UPDATE item SET keep_local=%d WHERE item_pid IN (%@)", 0, v16];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke_92;
    void v23[3] = &unk_1E5FB6A58;
    id v18 = v17;
    id v24 = v18;
    id v25 = v12;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v23];
  }
  int v19 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v31[3];
    *(_DWORD *)stat buf = 134217984;
    uint64_t v35 = v20;
    _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Removed %lli bytes of track data", buf, 0xCu);
  }

  int64_t v21 = v31[3];
  _Block_object_dispose(&v30, 8);
  return v21;
}

uint64_t __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  *(void *)(*(void *)(a1[6] + 8) + 24) += [v7 longLongValue];
  id v8 = [(ML3Entity *)[ML3Track alloc] initWithPersistentID:a2 inLibrary:a1[4]];
  uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(ML3Entity *)v8 valueForProperty:@"item_artist.item_artist"];
    id v11 = [(ML3Entity *)v8 valueForProperty:@"item_extra.title"];
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    id v18 = v11;
    __int16 v19 = 2048;
    uint64_t v20 = [v7 longLongValue];
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "Purging %{public}@ - %{public}@ (%lli bytes)", (uint8_t *)&v15, 0x20u);
  }
  id v12 = (void *)a1[5];
  BOOL v13 = [NSNumber numberWithLongLong:a2];
  [v12 addObject:v13];

  if (*(void *)(*(void *)(a1[6] + 8) + 24) >= a1[7]) {
    *a4 = 1;
  }

  return 0;
}

void __121__ML3MusicLibrary_CacheManagement___clearPurgeableTracksOfAmount_withUrgency_includeCloudAssets_includeAutoFilledTracks___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  char v4 = [a2 executeUpdate:v2 withParameters:v3 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    BOOL v6 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_ERROR, "failed to mark purged tracks as keep-local off. err=%{public}@", buf, 0xCu);
    }
  }
}

- (int64_t)_clearPurgeableTracksOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeAutoFilledTracks:(BOOL)a5
{
  return [(ML3MusicLibrary *)self _clearPurgeableTracksOfAmount:a3 withUrgency:a4 includeCloudAssets:1 includeAutoFilledTracks:a5];
}

- (int64_t)_clearOrphanedAssetsOfAmount:(int64_t)a3 withUrgency:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17) = a4;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Clearing orphaned assets with urgency %d", (uint8_t *)&v16, 8u);
  }

  if (a4 < 2)
  {
    int64_t v9 = 0;
  }
  else
  {
    int64_t v8 = [(ML3MusicLibrary *)self _cloudAssetsTotalSize];
    [(ML3MusicLibrary *)self removeOrphanedTracksOnlyInCaches:1];
    int64_t v9 = v8 - [(ML3MusicLibrary *)self _cloudAssetsTotalSize];
    uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      int64_t v17 = v9;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes of orphaned tracks", (uint8_t *)&v16, 0xCu);
    }

    if (v9 < a3)
    {
      unint64_t v11 = [(ML3MusicLibrary *)self totalSizeForArtwork];
      [(ML3MusicLibrary *)self cleanupArtworkWithOptions:30];
      unint64_t v12 = v11 - [(ML3MusicLibrary *)self totalSizeForArtwork];
      v9 += v12;
      BOOL v13 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        int64_t v17 = v12;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes of orphaned artwork", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  char v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    int64_t v17 = v9;
    _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes of orphaned assets", (uint8_t *)&v16, 0xCu);
  }

  return v9;
}

- (int64_t)_clearAllCloudAssets
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Purging all cloud assets", buf, 2u);
  }

  int64_t v4 = [(ML3MusicLibrary *)self _cloudAssetsTotalSize];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v6 = [(ML3MusicLibrary *)self pathForBaseLocationPath:200];
  v23[0] = v6;
  id v7 = [(ML3MusicLibrary *)self pathForBaseLocationPath:100];
  v23[1] = v7;
  int64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v5, "removeItemAtPath:error:", *(void *)(*((void *)&v16 + 1) + 8 * v13++), 0, (void)v16);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }

  char v14 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    int64_t v21 = v4;
    _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes clearing cloud assets", buf, 0xCu);
  }

  return v4;
}

- (int64_t)_clearDatabaseFileFreeSpace
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "Compacting the database file", (uint8_t *)&v5, 2u);
  }

  uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Removed %lld bytes compacting the db", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (id)_notInKeepLocalCollectionPredicate
{
  if (_notInKeepLocalCollectionPredicate_onceToken != -1) {
    dispatch_once(&_notInKeepLocalCollectionPredicate_onceToken, &__block_literal_global_13490);
  }
  uint64_t v2 = (void *)_notInKeepLocalCollectionPredicate_predicate;

  return v2;
}

void __70__ML3MusicLibrary_CacheManagement___notInKeepLocalCollectionPredicate__block_invoke()
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v16[0] = @"album_artist.keep_local";
  v16[1] = @"item_artist.keep_local";
  v16[2] = @"album.keep_local";
  void v16[3] = @"composer.keep_local";
  void v16[4] = @"genre.keep_local";
  v16[5] = @"keep_local";
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
  uint64_t v1 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = +[ML3ComparisonPredicate predicateWithProperty:value:comparison:caseInsensitive:treatNullAsString:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:caseInsensitive:treatNullAsString:", *(void *)(*((void *)&v11 + 1) + 8 * v6), &unk_1F0911620, 1, 0, &stru_1F08D4D70, (void)v11);
        [v1 addObject:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  int64_t v8 = +[ML3CompoundPredicate predicateMatchingPredicates:v1];
  uint64_t v9 = +[ML3UnaryPredicate predicateWithPredicate:v8];
  uint64_t v10 = (void *)_notInKeepLocalCollectionPredicate_predicate;
  _notInKeepLocalCollectionPredicate_predicate = v9;
}

- (id)_allKeepLocalPlaylistTracks
{
  uint64_t v3 = +[ML3ComparisonPredicate predicateWithProperty:@"keep_local" value:&unk_1F0911608 comparison:3];
  uint64_t v4 = +[ML3Entity queryWithLibrary:self predicate:v3];
  uint64_t v5 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke;
  void v10[3] = &unk_1E5FB6138;
  void v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v4 enumeratePersistentIDsUsingBlock:v10];
  uint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[ML3Entity newWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
  uint64_t v4 = +[ML3Track containerQueryWithContainer:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  double v5[2] = __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke_2;
  v5[3] = &unk_1E5FB7EE0;
  id v6 = *(id *)(a1 + 40);
  [v4 enumeratePersistentIDsUsingBlock:v5];
}

void __63__ML3MusicLibrary_CacheManagement___allKeepLocalPlaylistTracks__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (id)_purgeableTrackPredicateWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4 includeCloudAssets:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  char v48 = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.chosen_by_auto_fill" equalToInteger:1];
  uint64_t v9 = [(ML3MusicLibrary *)self _notInKeepLocalCollectionPredicate];
  uint64_t v10 = +[ML3ComparisonPredicate predicateWithProperty:@"(item.remote_location_id >= 50 AND item.remote_location_id < 300)" equalToInteger:1];
  if (v5) {
    uint64_t v11 = 6;
  }
  else {
    uint64_t v11 = 1;
  }
  long long v12 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F09115C0 comparison:v11];
  +[ML3ComparisonPredicate predicateWithProperty:@"keep_local" value:&unk_1F0911608 comparison:6];
  v57[0] = v10;
  v57[1] = v12;
  uint64_t v58 = v57[2] = v9;
  char v47 = (void *)v58;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
  long long v14 = +[ML3CompoundPredicate predicateMatchingPredicates:v13];

  if (a4)
  {
    v56[0] = v48;
    v56[1] = v14;
    int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    id v16 = +[ML3CompoundPredicate predicateMatchingPredicates:v15];
  }
  else
  {
    id v16 = v14;
  }
  unint64_t v17 = 0x1E5FAE000uLL;
  char v45 = v16;
  char v46 = v14;
  if (a3 - 1 >= 2)
  {
    if (a3 == 3)
    {
      if (MSVDeviceIsWatch()) {
        id v18 = 0;
      }
      else {
        id v18 = v16;
      }
    }
    else
    {
      char v31 = v12;
      uint64_t v32 = +[ML3ComparisonPredicate predicateWithProperty:@"keep_local" equalToInt64:3];
      v52[0] = v32;
      v52[1] = v9;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
      char v34 = +[ML3CompoundPredicate predicateMatchingPredicates:v33];

      if (a4)
      {
        v51[0] = v48;
        v51[1] = v34;
        uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
        id v18 = +[ML3CompoundPredicate predicateMatchingPredicates:v35];
      }
      else
      {
        id v18 = v34;
      }
      long long v12 = v31;
    }
  }
  else
  {
    id v18 = v16;
    if (a3 == 1)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v20 = [NSNumber numberWithDouble:v19 + -3600.0];
      int64_t v21 = +[ML3ComparisonPredicate predicateWithProperty:@"date_downloaded" value:v20 comparison:5];

      v55[0] = v18;
      v55[1] = v21;
      char v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
      uint64_t v23 = +[ML3CompoundPredicate predicateMatchingPredicates:v22];

      id v18 = (id)v23;
    }
    if (MSVDeviceIsWatch())
    {
      char v43 = +[ML3ComparisonPredicate predicateWithProperty:@"item_extra.is_audible_audio_book" equalToInt64:1];
      id v24 = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.bookmark_time_ms" equalToInt64:0];
      id v25 = +[ML3ComparisonPredicate predicateWithProperty:@"keep_local" equalToInt64:2];
      v54[0] = v43;
      v54[1] = v25;
      v54[2] = v24;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
      v26 = char v44 = v10;
      id v27 = +[ML3CompoundPredicate predicateMatchingPredicates:v26];

      v53[0] = v18;
      v53[1] = v27;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
      v29 = char v28 = v12;
      uint64_t v30 = +[ML3CompoundPredicate predicateMatchingPredicates:v29];

      long long v12 = v28;
      id v18 = (id)v30;
      unint64_t v17 = 0x1E5FAE000;
      uint64_t v10 = v44;
    }
  }
  uint64_t v36 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F0911608 comparison:2];
  uint64_t v37 = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.is_alarm" equalToInteger:0];
  char v38 = (void *)v37;
  char v39 = *(void **)(v17 + 2704);
  if (v18)
  {
    v49[0] = v18;
    v49[1] = v37;
    v49[2] = v36;
    char v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    char v41 = [v39 predicateMatchingPredicates:v40];
  }
  else
  {
    v50[0] = v37;
    v50[1] = v36;
    char v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
    char v41 = [v39 predicateMatchingPredicates:v40];
  }

  return v41;
}

- (void)_enumeratePurgeableTracksForUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4 includeCloudAssets:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v11 = [(ML3MusicLibrary *)self _purgeableTrackPredicateWithUrgency:a3 includeAutoFilledTracks:v7 includeCloudAssets:v6];
  if (v11)
  {
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObject:@"item_extra.file_size"];
    long long v13 = +[ML3OrderingTerm orderingTermWithProperty:@"base_location_id" direction:1];
    long long v14 = +[ML3OrderingTerm orderingTermWithProperty:@"item_stats.date_accessed" direction:1];
    v27[0] = v13;
    v27[1] = v14;
    int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    id v16 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:self predicate:v11 orderingTerms:v15];

    unint64_t v17 = [MEMORY[0x1E4F1CAD0] set];
    if (![(ML3MusicLibrary *)self _unmanagedPurgeShouldPurgeKeepLocalTracksForUrgency:a3])
    {
      uint64_t v18 = [(ML3MusicLibrary *)self _allKeepLocalPlaylistTracks];

      unint64_t v17 = (void *)v18;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke;
    void v22[3] = &unk_1E5FB5C90;
    id v23 = v16;
    id v24 = v12;
    id v25 = v17;
    id v26 = v10;
    id v19 = v17;
    id v20 = v12;
    id v21 = v16;
    [(ML3MusicLibrary *)self performReadOnlyDatabaseTransactionWithBlock:v22];
  }
}

uint64_t __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke_2;
  void v8[3] = &unk_1E5FB5C68;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = &v12;
  [v4 enumeratePersistentIDsAndProperties:v5 usingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __126__ML3MusicLibrary_CacheManagement___enumeratePurgeableTracksForUrgency_includeAutoFilledTracks_includeCloudAssets_usingBlock___block_invoke_2(void *a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v9 = (void *)a1[4];
  id v10 = [NSNumber numberWithLongLong:a2];
  LOBYTE(v9) = [v9 containsObject:v10];

  if ((v9 & 1) == 0)
  {
    char v12 = 0;
    uint64_t v11 = a1[5];
    if (v11) {
      LOBYTE(v11) = (*(uint64_t (**)(uint64_t, uint64_t, void, char *))(v11 + 16))(v11, a2, *a3, &v12);
    }
    if (a5) {
      *a5 = v12;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= v11;
  }
}

- (int64_t)_purgeableTracksTotalSizeWithUrgency:(unint64_t)a3 includeAutoFilledTracks:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __97__ML3MusicLibrary_CacheManagement___purgeableTracksTotalSizeWithUrgency_includeAutoFilledTracks___block_invoke;
  void v8[3] = &unk_1E5FB5A60;
  void v8[4] = &v9;
  [(ML3MusicLibrary *)self _enumeratePurgeableTracksForUrgency:a3 includeAutoFilledTracks:a4 includeCloudAssets:1 usingBlock:v8];
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v10[3];
    *(_DWORD *)stat buf = 134217984;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "Purgeable tracks size: %lld bytes", buf, 0xCu);
  }

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __97__ML3MusicLibrary_CacheManagement___purgeableTracksTotalSizeWithUrgency_includeAutoFilledTracks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [a3 longLongValue];
  return 0;
}

- (void)_enumeratePurgeableAlbumTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  unint64_t v20 = 0;
  unint64_t v20 = [(ML3MusicLibrary *)self _minimumPurgeableStorageForUrgency:a3];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  unint64_t v18 = 0;
  unint64_t v18 = [(ML3MusicLibrary *)self totalSizeForAllNonCacheTracks];
  BOOL v7 = [(ML3MusicLibrary *)self _purgeableNonCachedItemsPredicateSQL];
  id v8 = [NSString stringWithFormat:@"SELECT item_pid, item_extra.file_size FROM item JOIN item_stats USING (item_pid) JOIN item_extra USING (item_pid) WHERE album_pid = ? AND (%@)", v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke;
  v11[3] = &unk_1E5FB5C38;
  void v11[4] = self;
  unint64_t v16 = a3;
  id v9 = v8;
  id v12 = v9;
  uint64_t v14 = v17;
  uint64_t v15 = v19;
  id v10 = v6;
  id v13 = v10;
  [(ML3MusicLibrary *)self performReadOnlyDatabaseTransactionWithBlock:v11];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

uint64_t __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v19 = 0;
  unint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v4 = [*(id *)(a1 + 32) _purgeableAlbumsQuerySQLWithUrgency:*(void *)(a1 + 72)];
  uint64_t v5 = [v3 executeQuery:v4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_2;
  v13[3] = &unk_1E5FB5C10;
  id v6 = v3;
  id v14 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = v7;
  uint64_t v17 = v8;
  unint64_t v18 = &v19;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v16 = v12;
  [v5 enumerateRowsWithBlock:v13];
  uint64_t v10 = *((unsigned __int8 *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_2(void *a1, void *a2, void *a3, unsigned char *a4)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v24 = a3;
  uint64_t v8 = [v7 int64ForColumnIndex:0];
  id v9 = objc_opt_new();
  uint64_t v28 = 0;
  int64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  long long v12 = [NSNumber numberWithLongLong:v8];
  v32[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  id v14 = [v10 executeQuery:v11 withParameters:v13];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_3;
  void v25[3] = &unk_1E5FB7618;
  id v15 = v9;
  id v26 = v15;
  id v27 = &v28;
  [v14 enumerateRowsWithBlock:v25];
  uint64_t v16 = *(void *)(a1[7] + 8);
  uint64_t v17 = v29;
  unint64_t v18 = *(void *)(v16 + 24) - v29[3];
  if (v18 >= *(void *)(*(void *)(a1[8] + 8) + 24))
  {
    *(void *)(v16 + 24) = v18;
    uint64_t v19 = a1[6];
    unint64_t v20 = [NSNumber numberWithLongLong:v17[3]];
    int v21 = (*(uint64_t (**)(uint64_t, uint64_t, id, void *, unsigned char *))(v19 + 16))(v19, v8, v15, v20, a4);
    uint64_t v22 = *(void *)(a1[9] + 8);
    if (v21) {
      BOOL v23 = *(unsigned char *)(v22 + 24) != 0;
    }
    else {
      BOOL v23 = 0;
    }
    *(unsigned char *)(v22 + 24) = v23;
  }
  else
  {
    *a4 = 1;
  }

  _Block_object_dispose(&v28, 8);
}

void __88__ML3MusicLibrary_CacheManagement___enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 int64ForColumnIndex:0];
  uint64_t v5 = [v3 int64ForColumnIndex:1];

  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithLongLong:v4];
  [v6 addObject:v7];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
}

- (void)_enumeratePurgeableStreamedTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[ML3ComparisonPredicate predicateWithProperty:@"(item.base_location_id BETWEEN 100 AND 200)" equalToInteger:1];
  if (a3 <= 1)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    id v9 = [NSNumber numberWithDouble:v8 + -3600.0];
    uint64_t v10 = +[ML3ComparisonPredicate predicateWithProperty:@"date_downloaded" value:v9 comparison:5];

    v26[0] = v7;
    v26[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v12 = +[ML3CompoundPredicate predicateMatchingPredicates:v11];

    id v7 = (void *)v12;
  }
  id v13 = +[ML3ComparisonPredicate predicateWithProperty:@"keep_local" equalToInteger:3];
  v25[0] = v7;
  v25[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v15 = +[ML3CompoundPredicate predicateMatchingPredicates:v14];

  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObject:@"item_extra.file_size"];
  uint64_t v17 = +[ML3Entity queryWithLibrary:self predicate:v15];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke;
  v21[3] = &unk_1E5FB5BE8;
  id v22 = v17;
  id v23 = v16;
  id v24 = v6;
  id v18 = v6;
  id v19 = v16;
  id v20 = v17;
  [(ML3MusicLibrary *)self performReadOnlyDatabaseTransactionWithBlock:v21];
}

uint64_t __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke_2;
  void v8[3] = &unk_1E5FB5BC0;
  uint64_t v10 = &v11;
  id v9 = *(id *)(a1 + 48);
  [v4 enumeratePersistentIDsAndProperties:v5 usingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __91__ML3MusicLibrary_CacheManagement___enumeratePurgeableStreamedTracksForUrgency_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (result) {
    BOOL v4 = *(unsigned char *)(v3 + 24) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  return result;
}

- (id)_purgeableAlbumsQuerySQLWithUrgency:(unint64_t)a3
{
  uint64_t v5 = -[ML3MusicLibrary _nonPurgeableAlbumsQuerySQLWithUrgency:](self, "_nonPurgeableAlbumsQuerySQLWithUrgency:");
  uint64_t v6 = [(ML3MusicLibrary *)self _purgeableItemsPredicateSQLWithUrgency:a3];
  id v7 = [NSString stringWithFormat:@"SELECT album_pid, max(max(date_accessed), max(date_added), max(date_played)) AS date_accessed, max(liked_state = 2) AS liked_state FROM item JOIN item_stats USING (item_pid) JOIN item_extra USING (item_pid) WHERE album_pid NOT IN (%@) AND (%@) GROUP BY album_pid ORDER BY liked_state, date_accessed", v5, v6];

  return v7;
}

- (id)_nonPurgeableAlbumsQuerySQLWithUrgency:(unint64_t)a3
{
  if (a3 >= 2) {
    return @"SELECT DISTINCT album_pid FROM item JOIN item_store USING (item_pid) JOIN item_extra USING (item_pid) JOIN item_stats USING (item_pid) WHERE (item.base_location_id > 0 AND item.remote_location_id < 200) OR (item.base_location_id = 0 AND item.keep_local_status = 1)";
  }
  else {
    return @"SELECT DISTINCT album_pid FROM item JOIN item_store USING (item_pid) JOIN item_extra USING (item_pid) JOIN item_stats USING (item_pid) WHERE (item.base_location_id > 0 AND (item.remote_location_id < 200 OR item_stats.liked_state = 2)) OR (item.base_location_id = 0 AND item.keep_local_status = 1)";
  }
}

- (id)_purgeableNonCachedItemsPredicateSQL
{
  return @"((item.base_location_id > 200) AND (item_stats.is_alaruint64_t m = 0) AND ((item_stats.chosen_by_auto_fill = 1) OR (item.remote_location_id >= 50 AND item.remote_location_id < 300)))";
}

- (id)_purgeableItemsPredicateSQLWithUrgency:(unint64_t)a3
{
  return @"((item.base_location_id > 0) AND (item_stats.is_alaruint64_t m = 0) AND ((item_stats.chosen_by_auto_fill = 1) OR (item.remote_location_id >= 50 AND item.remote_location_id < 300)))";
}

- (unint64_t)_managedClearPurgeableTracksOfAmount:(unint64_t)a3 urgency:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  char v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke;
  void v29[3] = &unk_1E5FB5AB0;
  id v8 = v7;
  id v30 = v8;
  uint64_t v31 = &v33;
  unint64_t v32 = a3;
  [(ML3MusicLibrary *)self _enumeratePurgeableStreamedTracksForUrgency:a4 usingBlock:v29];
  BOOL v9 = +[ML3Track unlinkRedownloadableAssetsFromLibrary:self persistentIDs:v8];
  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v34[3];
      *(_DWORD *)stat buf = 134218242;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Purged %llu bytes of streaming assets from tracks %{public}@", buf, 0x16u);
    }

    unint64_t v13 = v34[3];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, "Failed to purge streaming assets %{public}@", buf, 0xCu);
    }

    unint64_t v13 = 0;
    void v34[3] = 0;
  }
  if (v13 < a3)
  {
    *(void *)stat buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    char v42 = __Block_byref_object_copy__13522;
    char v43 = __Block_byref_object_dispose__13523;
    id v44 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__13522;
    id v27 = __Block_byref_object_dispose__13523;
    id v28 = [MEMORY[0x1E4F1CA60] dictionary];
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__13522;
    void v21[4] = __Block_byref_object_dispose__13523;
    id v22 = [MEMORY[0x1E4F1CA60] dictionary];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_38;
    v20[3] = &unk_1E5FB5B08;
    void v20[4] = self;
    void v20[5] = v21;
    v20[6] = &v23;
    v20[7] = buf;
    v20[8] = a4;
    [(ML3MusicLibrary *)self _enumeratePurgeableAlbumTracksForUrgency:a4 usingBlock:v20];
    char v14 = [(id)v24[5] allKeys];
    id v15 = os_log_create("com.apple.amp.medialibrary", "CacheManagement_Oversize");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 count];
      *(_DWORD *)uint64_t v37 = 134218242;
      uint64_t v38 = v16;
      __int16 v39 = 2114;
      char v40 = v14;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Found %lu albums to purge %{public}@", v37, 0x16u);
    }

    uint64_t v17 = (void *)v24[5];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_40;
    void v19[3] = &unk_1E5FB5B88;
    v19[4] = self;
    void v19[5] = v21;
    v19[6] = &v33;
    v19[7] = buf;
    v19[8] = a4;
    v19[9] = a3;
    [v17 enumerateKeysAndObjectsUsingBlock:v19];
    unint64_t v13 = v34[3];

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v33, 8);
  return v13;
}

uint64_t __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = (void *)a1[4];
  id v8 = NSNumber;
  id v9 = a3;
  uint64_t v10 = [v8 numberWithLongLong:a2];
  [v7 addObject:v10];

  uint64_t v11 = [v9 unsignedLongLongValue];
  *(void *)(*(void *)(a1[5] + 8) + 24) += v11;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[6]) {
    *a4 = 1;
  }
  return 0;
}

uint64_t __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_38(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 numberWithLongLong:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2;
  v14[3] = &unk_1E5FB5AE0;
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 32);
  id v15 = v10;
  uint64_t v16 = v11;
  long long v17 = *(_OWORD *)(a1 + 48);
  id v12 = v10;
  [v9 enumerateObjectsUsingBlock:v14];

  return 1;
}

void __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_40(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  id v9 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:v7];
  BOOL v10 = +[ML3Track unlinkRedownloadableAssetsFromLibrary:a1[4] persistentIDs:v8];
  *((unsigned char *)v21 + 24) = v10;
  uint64_t v11 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v8 count];
      *(_DWORD *)stat buf = 134218754;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2114;
      int64_t v29 = v9;
      __int16 v30 = 2114;
      id v31 = v8;
      char v14 = "Purged %lu tracks from album %{public}@ (%{public}@ bytes): %{public}@";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 42;
LABEL_6:
      _os_log_impl(&dword_1B022D000, v15, v16, v14, buf, v17);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 138543362;
    uint64_t v25 = (uint64_t)v7;
    char v14 = "Failed to purge redownloadable assets for album %{public}@";
    id v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 12;
    goto LABEL_6;
  }

  if (*((unsigned char *)v21 + 24))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) += [v9 unsignedLongLongValue];
    if (*((unsigned char *)v21 + 24))
    {
      if (a1[8] == 3)
      {
        uint64_t v18 = (void *)a1[4];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_41;
        void v19[3] = &unk_1E5FB5B60;
        void v19[5] = a1[7];
        v19[6] = &v20;
        v19[4] = v18;
        [v18 performDatabaseTransactionWithBlock:v19];
      }
    }
  }
  if (*(void *)(*(void *)(a1[6] + 8) + 24) >= a1[9]) {
    *a4 = 1;
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_41(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(*(void *)(a1[5] + 8) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2_42;
  v9[3] = &unk_1E5FB5B38;
  uint64_t v5 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  void v9[4] = a1[4];
  id v6 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);

  return v7;
}

void __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2_42(void *a1, void *a2, void *a3, unsigned char *a4)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v19[0] = v7;
  v19[1] = &unk_1F09115F0;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v18[0] = @"keep_local";
  v18[1] = @"keep_local_constraints";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = +[ML3Entity setValues:v9 forProperties:v10 forEntityPersistentIDs:v8 inLibrary:a1[4] usingConnection:a1[5]];

  int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  id v12 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "Marked %{public}@ persistentIDs as keep_local=%@ with keep_local_constraints=wifi", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "Failed to mark purged tracks as keep_local=%@ with keep_local_constraints=wifi", (uint8_t *)&v14, 0xCu);
    }

    *a4 = 1;
  }
}

void __81__ML3MusicLibrary_CacheManagement___managedClearPurgeableTracksOfAmount_urgency___block_invoke_2(void *a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:a1[4]];

  if (!v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v4 forKeyedSubscript:a1[4]];
  }
  uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:a1[4]];
  [v5 addObject:v11];

  if (a1[8] == 3)
  {
    id v6 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", [v11 unsignedLongLongValue], a1[5]);
    id v7 = [v6 valueForProperty:@"keep_local"];
    id v8 = [*(id *)(*(void *)(a1[7] + 8) + 40) objectForKeyedSubscript:v7];

    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v9 forKeyedSubscript:v7];
    }
    id v10 = [*(id *)(*(void *)(a1[7] + 8) + 40) objectForKeyedSubscript:v7];
    [v10 addObject:v11];
  }
}

- (unint64_t)_managedPurgeableTracksTotalSizeWithUrgency:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke;
  v12[3] = &unk_1E5FB5A60;
  void v12[4] = &v13;
  [(ML3MusicLibrary *)self _enumeratePurgeableStreamedTracksForUrgency:a3 usingBlock:v12];
  uint64_t v5 = v14[3];
  id v6 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Purgeable cached tracks size: %lld bytes", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke_34;
  v11[3] = &unk_1E5FB5A88;
  void v11[4] = &v13;
  [(ML3MusicLibrary *)self _enumeratePurgeableAlbumTracksForUrgency:a3 usingBlock:v11];
  id v7 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v14[3] - v5;
    *(_DWORD *)stat buf = 134217984;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "Purgeable managed tracks size: %lld bytes", buf, 0xCu);
  }

  unint64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [a3 unsignedLongLongValue];
  return 0;
}

uint64_t __80__ML3MusicLibrary_CacheManagement___managedPurgeableTracksTotalSizeWithUrgency___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [a4 unsignedLongLongValue];
  return 0;
}

- (unint64_t)totalSizeForArtwork
{
  id v2 = [(ML3MusicLibrary *)self originalArtworkDirectory];
  unint64_t DiskUsageForPath = ML3GetDiskUsageForPath(v2);

  return DiskUsageForPath;
}

- (int64_t)_cloudAssetsTotalSize
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(ML3MusicLibrary *)self pathForBaseLocationPath:200];
  v18[0] = v3;
  BOOL v4 = [(ML3MusicLibrary *)self pathForBaseLocationPath:100];
  v18[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += ML3GetDiskUsageForPath(*(void **)(*((void *)&v13 + 1) + 8 * i));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_databaseFileFreeSpace
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = 0;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "Purgeable database free space: %lld bytes", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (BOOL)_unmanagedPurgeShouldPurgeKeepLocalTracksForUrgency:(unint64_t)a3
{
  if (a3 == 3)
  {
    if (MSVDeviceIsWatch()) {
      return 1;
    }
  }
  else if (a3 < 2)
  {
    return 0;
  }
  return +[ML3MusicLibrary shouldOptimizeStorage];
}

- (BOOL)_shouldPurgeManagedAlbumsTracksForUrgency:(unint64_t)a3
{
  return +[ML3MusicLibrary shouldOptimizeStorage];
}

- (unint64_t)_totalSizeForTracksPredicate:(id)a3
{
  id v3 = +[ML3Entity queryWithLibrary:self predicate:a3];
  int v4 = [v3 valueForAggregateFunction:@"TOTAL" onEntitiesForProperty:@"item_extra.file_size"];
  unint64_t v5 = [v4 unsignedLongLongValue];

  return v5;
}

- (unint64_t)_minimumPurgeableStorageForUrgency:(unint64_t)a3
{
  if (a3 == 3) {
    return 0;
  }
  else {
    return +[ML3MusicLibrary minimumPurgeableStorage];
  }
}

- (void)updateRootArtworkPurgeability
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (MSVDeviceSupportsMultipleLibraries())
  {
    id v3 = [(ML3MusicLibrary *)self rootArtworkCacheDirectory];
    int v4 = [(ML3MusicLibrary *)self originalArtworkDirectory];
    unint64_t v5 = [(ML3MusicLibrary *)self databasePath];
    uint64_t v6 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
    int v7 = [v5 isEqualToString:v6];

    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        uint64_t v10 = [(ML3MusicLibrary *)self databasePath];
        int v13 = 138543619;
        long long v14 = self;
        __int16 v15 = 2113;
        long long v16 = v10;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating multi-user artwork purgeability for primary user. path=%{private}@", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v11 = 4;
      [(ML3MusicLibrary *)self markSystemPurgeableMusicPath:v3 forUrgency:4];
    }
    else
    {
      if (v9)
      {
        id v12 = [(ML3MusicLibrary *)self databasePath];
        int v13 = 138543619;
        long long v14 = self;
        __int16 v15 = 2113;
        long long v16 = v12;
        _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating multi-user artwork purgeability for non-primary user. path=%{private}@", (uint8_t *)&v13, 0x16u);
      }
      MSVEnableDirStatsForDirectory();
      [(ML3MusicLibrary *)self markSystemPurgeableMusicPath:v3 forUrgency:0];
      MSVEnableDirStatsForDirectory();
      uint64_t v11 = 1;
    }
    [(ML3MusicLibrary *)self markSystemPurgeableMusicPath:v4 forUrgency:v11];
  }
  else
  {
    id v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      long long v14 = self;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ Root artwork purgeability not supported on single-user devices.", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (BOOL)markSystemPurgeableMusicPath:(id)a3 forUrgency:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = v6;
  uint64_t v22 = 65538;
  switch(a4)
  {
    case 0uLL:
      uint64_t v8 = 66050;
      goto LABEL_9;
    case 1uLL:
      uint64_t v8 = 66562;
      goto LABEL_9;
    case 2uLL:
      uint64_t v8 = 67586;
      goto LABEL_9;
    case 3uLL:
      uint64_t v8 = 98306;
LABEL_9:
      uint64_t v22 = v8;
      goto LABEL_11;
    case 4uLL:
      uint64_t v22 = 0;
      goto LABEL_11;
    default:
      if (a4 == 0x7FFFFFFF)
      {
        BOOL v9 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138543362;
          id v24 = self;
          uint64_t v10 = "%{public}@ Not marking purgeability for undefined urgency.";
          uint64_t v11 = v9;
          uint32_t v12 = 12;
LABEL_14:
          _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
LABEL_11:
      int v13 = (__CFString *)v6;
      int v14 = fsctl((const char *)[(__CFString *)v13 UTF8String], 0xC0084A44uLL, &v22, 0);
      __int16 v15 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
      BOOL v9 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = v22;
          uint64_t v17 = __error();
          uint64_t v18 = strerror(*v17);
          *(_DWORD *)stat buf = 138544131;
          id v24 = self;
          __int16 v25 = 2113;
          __int16 v26 = v13;
          __int16 v27 = 2048;
          uint64_t v28 = v16;
          __int16 v29 = 2080;
          uint64_t v30 = (uint64_t)v18;
          uint64_t v10 = "%{public}@ Failed to set purgeability for path %{private}@. flags=%llu error=%s";
          uint64_t v11 = v9;
          uint32_t v12 = 42;
          goto LABEL_14;
        }
LABEL_15:
        BOOL v19 = 0;
        goto LABEL_16;
      }
      BOOL v19 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        switch(a4)
        {
          case 1uLL:
            int v21 = @"medium";
            break;
          case 2uLL:
            int v21 = @"high";
            break;
          case 3uLL:
            int v21 = @"special";
            break;
          case 4uLL:
            int v21 = @"none";
            break;
          default:
            if (a4 == 0x7FFFFFFF) {
              int v21 = @"undefined";
            }
            else {
              int v21 = @"low";
            }
            break;
        }
        *(_DWORD *)stat buf = 138544131;
        id v24 = self;
        __int16 v25 = 2114;
        __int16 v26 = v21;
        __int16 v27 = 2113;
        uint64_t v28 = (uint64_t)v13;
        __int16 v29 = 2048;
        uint64_t v30 = v22;
        _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_INFO, "%{public}@ Marked purgeability level %{public}@ for path %{private}@. flags=%llu", buf, 0x2Au);
      }
LABEL_16:

      return v19;
  }
}

- (unint64_t)totalSizeForAllSyncedTracks
{
  id v3 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F09115D8 comparison:4];
  unint64_t v4 = [(ML3MusicLibrary *)self _totalSizeForTracksPredicate:v3];

  return v4;
}

- (unint64_t)totalSizeForAllNonRedownloadableTracks
{
  id v3 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F09115C0 comparison:3];
  unint64_t v4 = [(ML3MusicLibrary *)self _totalSizeForTracksPredicate:v3];

  return v4;
}

- (unint64_t)totalSizeForAllRedownloadableNonCacheTracks
{
  id v3 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F09115C0 comparison:1];
  unint64_t v4 = [(ML3MusicLibrary *)self _totalSizeForTracksPredicate:v3];

  return v4;
}

- (unint64_t)totalSizeForAllNonCacheTracks
{
  id v3 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F09115C0 comparison:4];
  unint64_t v4 = [(ML3MusicLibrary *)self _totalSizeForTracksPredicate:v3];

  return v4;
}

- (void)enumeratePurgeableAlbumTracksForUrgency:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  if ([(ML3MusicLibrary *)self _shouldPurgeManagedAlbumsTracksForUrgency:a3])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__ML3MusicLibrary_CacheManagement__enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke;
    v7[3] = &unk_1E5FB5A30;
    id v8 = v6;
    [(ML3MusicLibrary *)self _enumeratePurgeableAlbumTracksForUrgency:a3 usingBlock:v7];
  }
}

uint64_t __87__ML3MusicLibrary_CacheManagement__enumeratePurgeableAlbumTracksForUrgency_usingBlock___block_invoke(uint64_t a1)
{
  return 0;
}

- (int64_t)clearAllRemovedTracks
{
  id v3 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "Clearing removed tracks.", v5, 2u);
  }

  return [(ML3MusicLibrary *)self _clearPurgeableTracksOfAmount:0x7FFFFFFFFFFFFFFFLL withUrgency:2 includeCloudAssets:0 includeAutoFilledTracks:0];
}

- (int64_t)clearPurgeableStorageAmount:(int64_t)a3 withUrgency:(unint64_t)a4 includeAutoFilledTracks:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v9 = [(ML3MusicLibrary *)self _shouldPurgeManagedAlbumsTracksForUrgency:a4];
  unint64_t v10 = [(ML3MusicLibrary *)self _minimumPurgeableStorageForUrgency:a4];
  uint64_t v11 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134219008;
    *(void *)int v21 = a3;
    *(_WORD *)&v21[8] = 1024;
    int v22 = a4;
    __int16 v23 = 1024;
    *(_DWORD *)id v24 = v5;
    *(_WORD *)&void v24[4] = 1024;
    *(_DWORD *)&v24[6] = v9;
    __int16 v25 = 2048;
    unint64_t v26 = v10;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "Purging media data of at least %lli bytes for urgency %d. includeAutoFilledTracks=%{BOOL}u, optimizedStorageEnabled=%{BOOL}u, minStorageAmount=%llu", (uint8_t *)&v20, 0x28u);
  }

  char IsWatch = MSVDeviceIsWatch();
  if (a3 < 1) {
    char v13 = 1;
  }
  else {
    char v13 = IsWatch;
  }
  if (v13) {
    int64_t v14 = 0;
  }
  else {
    int64_t v14 = [(ML3MusicLibrary *)self _clearOrphanedAssetsOfAmount:a3 withUrgency:a4];
  }
  if ([(ML3MusicLibrary *)self currentDatabaseVersion] == 2220020)
  {
    v14 += [(ML3MusicLibrary *)self _clearDatabaseFileFreeSpace];
    if (v14 < a3)
    {
      if (v9) {
        int64_t v15 = [(ML3MusicLibrary *)self _managedClearPurgeableTracksOfAmount:a3 urgency:a4];
      }
      else {
        int64_t v15 = [(ML3MusicLibrary *)self _clearPurgeableTracksOfAmount:a3 withUrgency:a4 includeAutoFilledTracks:v5];
      }
      v14 += v15;
    }
  }
  else
  {
    uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = [(ML3MusicLibrary *)self currentDatabaseVersion];
      int v20 = 67109376;
      *(_DWORD *)int v21 = v17;
      *(_WORD *)&void v21[4] = 1024;
      *(_DWORD *)&v21[6] = 2220020;
      _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "Skipping purge for tracks because DB is not present or invalid (db version=%d, current version=%d)", (uint8_t *)&v20, 0xEu);
    }
  }
  uint64_t v18 = os_log_create("com.apple.amp.medialibrary", "CacheManagement");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134218496;
    *(void *)int v21 = v14;
    *(_WORD *)&v21[8] = 1024;
    int v22 = a4;
    __int16 v23 = 2048;
    *(void *)id v24 = a3;
    _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "Purged %lld bytes of media data for urgency %d (%lld bytes requested)", (uint8_t *)&v20, 0x1Cu);
  }

  return v14;
}

- (int64_t)clearPurgeableStorageAmount:(int64_t)a3 withUrgency:(unint64_t)a4
{
  BOOL v7 = +[ML3MusicLibrary autoFilledTracksArePurgeable];

  return [(ML3MusicLibrary *)self clearPurgeableStorageAmount:a3 withUrgency:a4 includeAutoFilledTracks:v7];
}

+ (void)clearCloudAssetSharedCache
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 cloudAssetsSharedCacheFolderPath];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    unint64_t v4 = [v3 enumeratorAtPath:v2];
    uint64_t v5 = [v4 nextObject];
    if (v5)
    {
      BOOL v7 = (void *)v5;
      id v8 = 0;
      *(void *)&long long v6 = 138543618;
      long long v14 = v6;
      do
      {
        BOOL v9 = v8;
        unint64_t v10 = objc_msgSend(v2, "stringByAppendingPathComponent:", v7, v14);
        id v15 = v8;
        char v11 = [v3 removeItemAtPath:v10 error:&v15];
        id v8 = v15;

        if ((v11 & 1) == 0)
        {
          uint32_t v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = v14;
            int v17 = v7;
            __int16 v18 = 2114;
            id v19 = v8;
            _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "Failed to remove cached asset %{public}@ error %{public}@", buf, 0x16u);
          }
        }
        uint64_t v13 = [v4 nextObject];

        BOOL v7 = (void *)v13;
      }
      while (v13);
    }
  }
}

+ (int64_t)minimumPurgeableStorage
{
  int64_t result = (int64_t)CFPreferencesCopyAppValue(@"MinimumStorageSize", @"com.apple.Music");
  int64_t valuePtr = 0;
  if (result)
  {
    CFNumberRef v3 = (const __CFNumber *)result;
    CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
    if (v4 == CFNumberGetTypeID()) {
      CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
    }
    CFRelease(v3);
    return valuePtr;
  }
  return result;
}

+ (void)setMinimumPurgeableStorage:(int64_t)a3
{
  int64_t valuePtr = a3;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFPreferencesSetAppValue(@"MinimumStorageSize", v3, @"com.apple.Music");
  CFRelease(v3);
}

+ (BOOL)shouldOptimizeStorage
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"OptimizeStorage", @"com.apple.Music", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (void)setShouldOptimizeStorage:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(@"OptimizeStorage", *v3, @"com.apple.Music");
}

+ (void)setAutoFilledTracksArePurgeable:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(@"_ML3AutofilledTracksArePurgeableKey", *v3, @"com.apple.medialibrary");
}

- (void)updatePurgeabilityForCachedArtworkWithAbsolutePath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ML3MusicLibrary *)self rootArtworkCacheDirectory];
  int v6 = [v4 containsString:v5];

  if (v6)
  {
    BOOL v7 = [v4 stringByDeletingLastPathComponent];
    if (MSVDeviceIsAppleTV()) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    [(ML3MusicLibrary *)self markSystemPurgeableMusicPath:v7 forUrgency:v8];
  }
  else
  {
    BOOL v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      unint64_t v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Unexpected path for cached artwork %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)updatePurgeabilityForOriginalArtworkWithRelativePath:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = NSString;
  int v6 = [(ML3MusicLibrary *)self originalArtworkDirectory];
  v15[0] = v6;
  v15[1] = v4;
  uint64_t v7 = 2;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  int v9 = [v5 pathWithComponents:v8];

  if (MSVDeviceIsAppleTV()) {
    goto LABEL_4;
  }
  if (MSVDeviceIsWatch())
  {
    uint64_t v7 = 3;
LABEL_4:
    [(ML3MusicLibrary *)self markSystemPurgeableMusicPath:v9 forUrgency:v7];
    goto LABEL_8;
  }
  unint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ Not marking purgeability for original artwork. relativePath=%{public}@", (uint8_t *)&v11, 0x16u);
  }

LABEL_8:
}

- (BOOL)hasOriginalArtworkForRelativePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ML3MusicLibrary *)self originalArtworkDirectory];
  int v6 = [v5 stringByAppendingPathComponent:v4];

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v4) = [v7 fileExistsAtPath:v6];

  return (char)v4;
}

- (id)artworkCacheDirectoryForEffect:(id)a3
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  id v5 = a3;
  int v6 = [(ML3MusicLibrary *)self rootArtworkCacheDirectory];
  v10[0] = v6;
  v10[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = [v4 pathWithComponents:v7];

  return v8;
}

- (NSString)artworkDirectory
{
  return (NSString *)[(ML3MusicLibrary *)self pathForResourceFileOrFolder:12];
}

+ (int64_t)artworkSourceTypeForTrackSource:(int)a3
{
  if ((a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1B04DCCB0[a3 - 1];
  }
}

+ (id)artworkTokenForChapterWithItemPID:(int64_t)a3 retrievalTime:(double)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"chapter=%llu-%.0f", a3, a4 * 1000.0);
}

+ (id)artworkTokenForArtistHeroURL:(id)a3
{
  return (id)[a3 absoluteString];
}

+ (int64_t)devicePreferredImageFormat
{
  if ([a1 deviceSupportsASTC]) {
    return 2;
  }
  else {
    return 0;
  }
}

+ (BOOL)deviceSupportsASTC
{
  if (_os_feature_enabled_impl()) {
    return 0;
  }
  if (deviceSupportsASTC_onceToken != -1) {
    dispatch_once(&deviceSupportsASTC_onceToken, &__block_literal_global_13657);
  }
  return deviceSupportsASTC_deviceSupportsASTC != 0;
}

uint64_t __46__ML3MusicLibrary_Artwork__deviceSupportsASTC__block_invoke()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DisableASTCEncoding", @"com.apple.mobileipod", 0);
  uint64_t result = CFPreferencesGetAppBooleanValue(@"EnableASTCEncoding", @"com.apple.medialibrary", 0);
  if (AppBooleanValue)
  {
    char v2 = 0;
  }
  else if (result)
  {
    char v2 = 1;
  }
  else
  {
    char v3 = MGGetBoolAnswer();
    uint64_t result = MGGetBoolAnswer();
    char v2 = v3 & result;
  }
  deviceSupportsASTC_deviceSupportsASTC = v2;
  return result;
}

+ (BOOL)dropIndexesUsingConnection:(id)a3 tableNames:(const char *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT name FROM sqlite_master WHERE type='index' AND tbl_name IN (%s);",
  uint64_t v7 = a4);
  uint64_t v8 = [v5 executeQuery:v7];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __65__ML3MusicLibrary_Schema__dropIndexesUsingConnection_tableNames___block_invoke;
  void v26[3] = &unk_1E5FB83F8;
  id v9 = v6;
  id v27 = v9;
  [v8 enumerateRowsWithBlock:v26];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v20 = v8;
    int v21 = v7;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v15 hasPrefix:@"sqlite_autoindex_"] & 1) == 0)
        {
          uint64_t v16 = [NSString stringWithFormat:@"DROP INDEX %@;", v15];
          int v17 = [v5 executeUpdate:v16];

          if (!v17)
          {
            BOOL v18 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v18 = 1;
LABEL_12:
    uint64_t v8 = v20;
    uint64_t v7 = v21;
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

void __65__ML3MusicLibrary_Schema__dropIndexesUsingConnection_tableNames___block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectAtIndexedSubscript:0];
  [v2 addObject:v3];
}

+ (BOOL)orderingLanguageMatchesSystemUsingConnection:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 executeQuery:@"SELECT value FROM _MLDatabaseProperties WHERE key = 'OrderingLanguage'"];;
  id v4 = [v3 stringValueForFirstRowAndColumn];

  id v5 = ML3LocalizationLanguageCanonicalIdentifier();
  char v6 = [v5 isEqualToString:v4];
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "[Schema] Device language changed from %{public}@ to %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v6;
}

+ (BOOL)userVersionMatchesSystemUsingConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "[Schema] Checking if the current database version is up-to-date...", (uint8_t *)v9, 2u);
  }

  int v6 = [a1 userVersionUsingConnection:v4];
  if (v6 != 2220020)
  {
    uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109376;
      v9[1] = v6;
      __int16 v10 = 1024;
      int v11 = 2220020;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "[Schema] Database version is %d, not %d", (uint8_t *)v9, 0xEu);
    }
  }
  return v6 == 2220020;
}

+ (int)userVersionUsingConnection:(id)a3
{
  id v3 = a3;
  if ([v3 databasePathExists])
  {
    id v4 = [v3 executeQuery:@"PRAGMA user_version;"];
    int v5 = [v4 int64ValueForFirstRowAndColumn];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (id)itemIndexSchemaSQL
{
  if (itemIndexSchemaSQL_onceToken != -1) {
    dispatch_once(&itemIndexSchemaSQL_onceToken, &__block_literal_global_461);
  }
  char v2 = (void *)itemIndexSchemaSQL_itemIndices;

  return v2;
}

uint64_t __45__ML3MusicLibrary_Schema__itemIndexSchemaSQL__block_invoke()
{
  itemIndexSchemaSQL_itemIndices = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:itemIndexSchemaSQL_indexSQLs count:30];

  return MEMORY[0x1F41817F8]();
}

+ (id)indexSchemaSQL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ML3MusicLibrary_Schema__indexSchemaSQL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (indexSchemaSQL_onceToken != -1) {
    dispatch_once(&indexSchemaSQL_onceToken, block);
  }
  char v2 = (void *)indexSchemaSQL_indices;

  return v2;
}

void __41__ML3MusicLibrary_Schema__indexSchemaSQL__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) itemIndexSchemaSQL];
  uint64_t v1 = [v3 setByAddingObjectsFromArray:&unk_1F09109C0];
  char v2 = (void *)indexSchemaSQL_indices;
  indexSchemaSQL_indices = v1;
}

+ (id)allTables
{
  if (allTables_once != -1) {
    dispatch_once(&allTables_once, &__block_literal_global_108_14265);
  }
  char v2 = (void *)allTables_allTables;

  return v2;
}

uint64_t __36__ML3MusicLibrary_Schema__allTables__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"album", @"item_artist", @"album_artist", @"composer", @"genre", @"category", @"base_location", @"sort_map", @"item", @"item_extra", @"item_playback", @"item_search", @"item_stats", @"item_store", @"item_video", @"item_kvs", @"container",
    @"container_seed",
    @"container_item",
    @"_MLDatabaseProperties",
    @"db_info",
    @"chapter",
    @"lyrics",
    @"entity_revision",
    @"genius_config",
    @"genius_metadata",
    @"genius_similarities",
    @"artwork_token",
    @"best_artwork_token",
    @"artwork",
    @"entity_changes",
    @"source",
    @"library_property",
    @"cloud_kvs",
    @"account",
    @"person",
    @"container_item_person",
    @"container_author",
    @"container_item_reaction",
  allTables_allTables = 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)allTriggersSQL
{
  void v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CREATE TRIGGER IF NOT EXISTS on_insert_item_setRemoteLocationColumn AFTER INSERT ON item_store BEGIN UPDATE item SET remote_location_id =(CASE WHEN new.home_sharing_id != 0 THEN 300 ELSE(CASE WHEN IFNULL(new.match_redownload_params, '') != '' THEN 200 ELSE(CASE WHEN IFNULL(new.purchase_history_redownload_params, '') != '' AND new.purchase_history_id != 0 THEN 100 ELSE(CASE WHEN new.subscription_store_item_id != 0 AND new.is_subscription AND new.cloud_asset_available THEN 50 ELSE(CASE WHEN new.sync_redownload_params == 'redownload' AND new.sync_id != 0 THEN 20 ELSE(CASE WHEN new.sync_redownload_params == 'local' AND new.sync_id != 0 THEN 10 ELSE 0 END) END) END) END) END) END) WHERE item_pid = new.item_pid; END;";
  v4[1] = @"CREATE TRIGGER IF NOT EXISTS on_update_item_setRemoteLocationColumn AFTER UPDATE OF match_redownload_params, purchase_history_redownload_params, purchase_history_id, home_sharing_id, sync_redownload_params, subscription_store_item_id, store_saga_id, is_subscription, cloud_asset_available ON item_store BEGIN UPDATE item SET remote_location_id =(CASE WHEN new.home_sharing_id != 0 THEN 300 ELSE(CASE WHEN IFNULL(new.match_redownload_params, '') != '' THEN 200 ELSE(CASE WHEN IFNULL(new.purchase_history_redownload_params, '') != '' AND new.purchase_history_id != 0 THEN 100 ELSE(CASE WHEN new.subscription_store_item_id != 0 AND new.is_subscription AND new.cloud_asset_available THEN 50 ELSE(CASE WHEN new.sync_redownload_params == 'redownload' AND new.sync_id != 0 THEN 20 ELSE(CASE WHEN new.sync_redownload_params == 'local' AND new.sync_id != 0 THEN 10 ELSE 0 END) END) END) END) END) END) WHERE item_pid = new.item_pid; END;";
  v4[2] = @"CREATE TRIGGER IF NOT EXISTS on_insert_item_setInMyLibraryColumn AFTER INSERT ON item_store BEGIN UPDATE item SET in_my_library =(CASE WHEN new.home_sharing_id OR (new.store_saga_id AND new.cloud_in_my_library) OR new.purchase_history_id OR (new.sync_id AND new.sync_in_my_library) OR new.is_ota_purchased THEN 1 ELSE 0 END) WHERE item_pid = new.item_pid; END;";
  v4[3] = @"CREATE TRIGGER IF NOT EXISTS on_update_item_setInMyLibraryColumn AFTER UPDATE OF purchase_history_id, home_sharing_id, sync_id, subscription_store_item_id, store_saga_id, is_ota_purchased, sync_in_my_library, cloud_in_my_library ON item_store BEGIN UPDATE item SET in_my_library =(CASE WHEN new.home_sharing_id OR (new.store_saga_id AND new.cloud_in_my_library) OR new.purchase_history_id OR (new.sync_id AND new.sync_in_my_library) OR new.is_ota_purchased THEN 1 ELSE 0 END) WHERE item_pid = new.item_pid; END;";
  void v4[4] = @"CREATE TRIGGER IF NOT EXISTS on_remove_source_setPlaybackEndpointType AFTER UPDATE OF playback_endpoint_type ON item_store BEGIN UPDATE item_store SET playback_endpoint_type = (CASE WHEN new.playback_endpoint_type >= 0 THEN new.playback_endpoint_type ELSE (CASE WHEN store_saga_id THEN cloud_playback_endpoint_type WHEN sync_id THEN 0 WHEN purchase_history_id THEN 1 WHEN is_ota_purchased THEN 0 WHEN is_subscription THEN 3 ELSE 0 END) END) WHERE item_pid = new.item_pid; END;";
  char v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];

  return v2;
}

+ (id)allPragmaSQL
{
  return &unk_1F09109A8;
}

+ (id)allSchemaSQL
{
  if (allSchemaSQL_once != -1) {
    dispatch_once(&allSchemaSQL_once, &__block_literal_global_14405);
  }
  char v2 = (void *)allSchemaSQL_allSchemaSQL;

  return v2;
}

void __39__ML3MusicLibrary_Schema__allSchemaSQL__block_invoke()
{
  v44[41] = *MEMORY[0x1E4F143B8];
  char v43 = objc_opt_new();
  char v42 = [v43 createTableSQLWithExistenceClause:0];
  v44[0] = v42;
  char v41 = objc_opt_new();
  char v40 = [v41 createTableSQLWithExistenceClause:0];
  v44[1] = v40;
  __int16 v39 = objc_opt_new();
  uint64_t v38 = [v39 createTableSQLWithExistenceClause:0];
  v44[2] = v38;
  uint64_t v37 = objc_opt_new();
  uint64_t v36 = [v37 createTableSQLWithExistenceClause:0];
  v44[3] = v36;
  uint64_t v35 = objc_opt_new();
  char v34 = [v35 createTableSQLWithExistenceClause:0];
  void v44[4] = v34;
  v44[5] = @"CREATE TABLE category (category_id INTEGER PRIMARY KEY, category TEXT NOT NULL UNIQUE)";
  v44[6] = @"CREATE TABLE base_location (base_location_id INTEGER PRIMARY KEY, path TEXT NOT NULL)";
  v44[7] = @"CREATE TABLE \"sort_map\" (name TEXT NOT NULL UNIQUE, name_order INTEGER UNIQUE, name_section INTEGER,  sort_key BLOB NOT NULL)";
  uint64_t v33 = objc_opt_new();
  uint64_t v32 = [v33 createTableSQLWithExistenceClause:0];
  v44[8] = v32;
  uint64_t v31 = objc_opt_new();
  uint64_t v30 = [v31 createTableSQLWithExistenceClause:0];
  v44[9] = v30;
  uint64_t v29 = objc_opt_new();
  uint64_t v28 = [v29 createTableSQLWithExistenceClause:0];
  v44[10] = v28;
  id v27 = objc_opt_new();
  unint64_t v26 = [v27 createTableSQLWithExistenceClause:0];
  v44[11] = v26;
  long long v25 = objc_opt_new();
  long long v24 = [v25 createTableSQLWithExistenceClause:0];
  v44[12] = v24;
  long long v23 = objc_opt_new();
  long long v22 = [v23 createTableSQLWithExistenceClause:0];
  v44[13] = v22;
  int v21 = objc_opt_new();
  uint64_t v20 = [v21 createTableSQLWithExistenceClause:0];
  v44[14] = v20;
  id v19 = objc_opt_new();
  BOOL v18 = [v19 createTableSQLWithExistenceClause:0];
  v44[15] = v18;
  v44[16] = @"CREATE TABLE container (container_pid INTEGER PRIMARY KEY, distinguished_kind INTEGER NOT NULL DEFAULT 0, date_created INTEGER NOT NULL DEFAULT 0, date_modified INTEGER NOT NULL DEFAULT 0, date_played INTEGER NOT NULL DEFAULT 0, name TEXT NOT NULL DEFAULT '', name_order INTEGER NOT NULL DEFAULT 0, is_owner INTEGER NOT NULL DEFAULT 1, is_editable INTEGER NOT NULL DEFAULT 0, parent_pid INTEGER NOT NULL DEFAULT 0, contained_media_type INTEGER NOT NULL DEFAULT 0, workout_template_id INTEGER NOT NULL DEFAULT 0, is_hidden INTEGER NOT NULL DEFAULT 0, is_ignorable_itunes_playlist INTEGER NOT NULL DEFAULT 0, description TEXT, play_count_user INTEGER NOT NULL DEFAULT 0, play_count_recent INTEGER NOT NULL DEFAULT 0, liked_state INTEGER NOT NULL DEFAULT 0, smart_evaluation_order INTEGER NOT NULL DEFAULT 0, smart_is_folder INTEGER NOT NULL DEFAULT 0, smart_is_dynamic INTEGER NOT NULL DEFAULT 0, smart_is_filtered INTEGER NOT NULL DEFAULT 0, smart_is_genius INTEGER NOT NULL DEFAULT 0, smart_enabled_only INTEGER NOT NULL DEFAULT 0, smart_is_limited INTEGER NOT NULL DEFAULT 0, smart_limit_kind INTEGER NOT NULL DEFAULT 0, smart_limit_order INTEGER NOT NULL DEFAULT 0, smart_limit_value INTEGER NOT NULL DEFAULT 0, smart_reverse_limit_order INTEGER NOT NULL DEFAULT 0, smart_criteria BLOB, play_order INTEGER NOT NULL DEFAULT 0, is_reversed INTEGER NOT NULL DEFAULT 0, album_field_order INTEGER NOT NULL DEFAULT 0, repeat_mode INTEGER NOT NULL DEFAULT 0, shuffle_items INTEGER NOT NULL DEFAULT 0, has_been_shuffled INTEGER NOT NULL DEFAULT 0, filepath TEXT NOT NULL DEFAULT '', is_saveable INTEGER NOT NULL DEFAULT 0, is_src_remote INTEGER NOT NULL DEFAULT 0, is_ignored_syncing INTEGER NOT NULL DEFAULT 0, container_type INTEGER NOT NULL DEFAULT 0, is_container_type_active_target INTEGER NOT NULL DEFAULT 0, orig_date_modified INTEGER NOT NULL DEFAULT 0, store_cloud_id INTEGER NOT NULL DEFAULT 0, has_cloud_play_order INTEGER NOT NULL DEFAULT 0, cloud_global_id TEXT NOT NULL DEFAULT '', cloud_share_url TEXT NOT NULL DEFAULT '', cloud_is_public INTEGER NOT NULL DEFAULT 0, cloud_is_visible INTEGER NOT NULL DEFAULT 0, cloud_is_subscribed INTEGER NOT NULL DEFAULT 0, cloud_is_curator_playlist INTEGER NOT NULL DEFAULT 0, cloud_author_store_id INTEGER NOT NULL DEFAULT 0, cloud_author_display_name TEXT NOT NULL DEFAULT '', cloud_author_store_url TEXT NOT NULL DEFAULT '', cloud_min_refresh_interval INTEGER NOT NULL DEFAULT 0, cloud_last_update_time INTEGER NOT NULL DEFAULT 0, cloud_user_count INTEGER NOT NULL DEFAULT 0, cloud_global_play_count INTEGER NOT NULL DEFAULT 0, cloud_global_like_count INTEGER NOT NULL DEFAULT 0, keep_local INTEGER NOT NULL DEFAULT 0, keep_local_status INTEGER NOT NULL DEFAULT 0, keep_local_status_reason INTEGER NOT NULL DEFAULT 0, keep_local_constraints INTEGER NOT NULL DEFAULT 0, external_vendor_identifier TEXT NOT NULL DEFAULT '', external_vendor_display_name TEXT NOT NULL DEFAULT '', external_vendor_container_tag TEXT NOT NULL DEFAULT '', is_external_vendor_playlist INTEGER NOT NULL DEFAULT 0, sync_id INTEGER NOT NULL DEFAULT 0, cloud_is_sharing_disabled INTEGER NOT NULL DEFAULT 0, cloud_version_hash TEXT NOT NULL DEFAULT '', date_played_local INTEGER NOT NULL DEFAULT 0, cloud_author_handle TEXT NOT NULL DEFAULT '', cloud_universal_library_id TEXT NOT NULL DEFAULT '', should_display_index INTEGER NOT NULL DEFAULT 0, date_downloaded INTEGER NOT NULL DEFAULT 0, category_type_mask INTEGER NOT NULL DEFAULT 0, grouping_sort_key TEXT NOT NULL DEFAULT '', traits INTEGER NOT NULL DEFAULT 0, liked_state_changed_date INTEGER NOT NULL DEFAULT 0, is_collaborative INTEGER NOT NULL DEFAULT 0, collaborator_invite_options INTEGER NOT NULL DEFAULT 0, collaborator_permissions INTEGER NOT NULL DEFAULT 0, collaboration_invitation_link TEXT NOT NULL DEFAULT '', cover_artwork_recipe TEXT NOT NULL DEFAULT '', collaboration_invitation_url_expiration_date INTEGER NOT NULL DEFAULT 0 ,collaboration_join_request_pending INTEGER NOT NULL DEFAULT 0 ,collaborator_status INTEGER NOT NULL DEFAULT 0)";
  v44[17] = @"CREATE TABLE container_seed (container_pid INTEGER PRIMARY KEY, item_pid INTEGER NOT NULL DEFAULT 0, seed_order INTEGER NOT NULL DEFAULT 0)";
  v44[18] = @"CREATE TABLE container_item_media_type (container_pid INTEGER PRIMARY KEY, media_type INTEGER NOT NULL DEFAULT 0, count INTEGER NOT NULL DEFAULT 0, UNIQUE (container_pid, media_type))";
  int v17 = objc_opt_new();
  uint64_t v16 = [v17 createTableSQLWithExistenceClause:0];
  v44[19] = v16;
  v44[20] = @"CREATE TABLE _MLDatabaseProperties (key TEXT PRIMARY KEY, value TEXT)";
  v44[21] = @"CREATE TABLE db_info (db_pid INTEGER PRIMARY KEY, primary_container_pid INTEGER, media_folder_url TEXT, audio_language INTEGER, subtitle_language INTEGER, genius_cuid TEXT, bib BLOB, rib BLOB)";
  id v15 = objc_opt_new();
  id v14 = [v15 createTableSQLWithExistenceClause:0];
  v44[22] = v14;
  uint64_t v13 = objc_opt_new();
  uint64_t v12 = [v13 createTableSQLWithExistenceClause:0];
  v44[23] = v12;
  v44[24] = @"CREATE TABLE entity_revision (revision INTEGER PRIMARY KEY, entity_pid INTEGER NOT NULL DEFAULT 0, deleted INTEGER NOT NULL DEFAULT 0, class INTEGER NOT NULL DEFAULT 0, revision_type INTEGER NOT NULL DEFAULT 0, UNIQUE (entity_pid, revision_type))";
  v44[25] = @"CREATE TABLE genius_config (id INTEGER PRIMARY KEY, version INTEGER UNIQUE, default_num_results INTEGER NOT NULL DEFAULT 0, min_num_results INTEGER NOT NULL DEFAULT 0, data BLOB)";
  v44[26] = @"CREATE TABLE genius_metadata (genius_id INTEGER PRIMARY KEY, revision_level INTEGER NOT NULL DEFAULT 0, version INTEGER NOT NULL DEFAULT 0, checksum INTEGER NOT NULL DEFAULT 0, data BLOB)";
  v44[27] = @"CREATE TABLE genius_similarities (genius_id INTEGER PRIMARY KEY, data BLOB)";
  v44[28] = @"CREATE TABLE artwork_token (artwork_token TEXT NOT NULL DEFAULT '', artwork_source_type INTEGER NOT NULL DEFAULT 0, artwork_type INTEGER NOT NULL DEFAULT 0, entity_pid INTEGER NOT NULL DEFAULT 0, entity_type INTEGER NOT NULL DEFAULT 0, UNIQUE (artwork_source_type, artwork_type, entity_pid, entity_type))";
  v44[29] = @"CREATE TABLE best_artwork_token (entity_pid INTEGER NOT NULL DEFAULT 0, entity_type INTEGER NOT NULL DEFAULT 0, artwork_type INTEGER NOT NULL DEFAULT 0, available_artwork_token TEXT NOT NULL DEFAULT '', fetchable_artwork_token TEXT NOT NULL DEFAULT '', fetchable_artwork_source_type INTEGER NOT NULL DEFAULT 0, UNIQUE (entity_pid, entity_type, artwork_type))";
  v44[30] = @"CREATE TABLE artwork (artwork_token TEXT NOT NULL DEFAULT '', artwork_source_type INTEGER NOT NULL DEFAULT 0, relative_path TEXT NOT NULL DEFAULT '', artwork_type INTEGER NOT NULL DEFAULT 0, interest_data BLOB, UNIQUE (artwork_token, artwork_source_type))";
  v44[31] = @"CREATE TABLE entity_changes (class INTEGER NOT NULL, entity_pid INTEGER NOT NULL, source_pid INTEGER NOT NULL, change_type INTEGER NOT NULL, changes TEXT NOT NULL DEFAULT '', UNIQUE (class, entity_pid, source_pid, change_type))";
  v44[32] = @"CREATE TABLE source (source_pid INTEGER PRIMARY KEY, source_name TEXT, last_sync_date INTEGER NOT NULL DEFAULT 0, last_sync_revision INTEGER NOT NULL DEFAULT 0)";
  v44[33] = @"CREATE TABLE library_property (property_pid INTEGER PRIMARY KEY, source_id INTEGER, key TEXT, value TEXT, UNIQUE (source_id, key))";
  id v0 = objc_opt_new();
  uint64_t v1 = [v0 createTableSQLWithExistenceClause:0];
  v44[34] = v1;
  char v2 = objc_opt_new();
  id v3 = [v2 createTableSQLWithExistenceClause:0];
  v44[35] = v3;
  id v4 = objc_opt_new();
  int v5 = [v4 createTableSQLWithExistenceClause:0];
  v44[36] = v5;
  v44[37] = @"CREATE TABLE container_item_person (container_item_person_pid INTEGER PRIMARY KEY, container_item_pid INTEGER NOT NULL DEFAULT 0, person_pid INTEGER NOT NULL DEFAULT 0, UNIQUE (container_item_pid, person_pid))";
  int v6 = objc_opt_new();
  uint64_t v7 = [v6 createTableSQLWithExistenceClause:0];
  v44[38] = v7;
  v44[39] = @"CREATE TABLE container_author (container_author_pid INTEGER PRIMARY KEY, container_pid INTEGER NOT NULL DEFAULT 0, person_pid INTEGER NOT NULL DEFAULT 0, role INTEGER NOT NULL DEFAULT 0, is_pending INTEGER NOT NULL DEFAULT 0, position INTEGER NOT NULL DEFAULT 0, UNIQUE (container_pid, person_pid))";
  uint64_t v8 = objc_opt_new();
  int v9 = [v8 createTableSQLWithExistenceClause:0];
  v44[40] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:41];
  int v11 = (void *)allSchemaSQL_allSchemaSQL;
  allSchemaSQL_allSchemaSQL = v10;
}

+ (id)itemNewSchemaSQL
{
  char v2 = objc_opt_new();
  id v3 = (void *)[v2 mutableCopy];

  [v3 setName:@"item_new"];
  id v4 = [v3 createTableSQLWithExistenceClause:0];

  return v4;
}

+ (id)itemSchemaSQL
{
  char v2 = objc_opt_new();
  id v3 = [v2 createTableSQLWithExistenceClause:0];

  return v3;
}

+ (id)sortMapNewSchemaSQL
{
  return @"CREATE TABLE \"sort_map_new\" (name TEXT NOT NULL UNIQUE, name_order INTEGER UNIQUE, name_section INTEGER, sort_key BLOB NOT NULL DEFAULT x'')";
}

+ (id)sortMapSchemaSQL
{
  return @"CREATE TABLE \"sort_map\" (name TEXT NOT NULL UNIQUE, name_order INTEGER UNIQUE, name_section INTEGER,  sort_key BLOB NOT NULL)";
}

- (void)updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID:(int64_t)a3
{
  id v4 = [(ML3Entity *)[ML3Track alloc] initWithPersistentID:a3 inLibrary:self];
  int v5 = [(ML3Entity *)v4 valueForProperty:@"item_kvs.key"];
  if ([v5 length])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __117__ML3MusicLibrary_UbiquitousDatabase__updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID___block_invoke;
    v6[3] = &unk_1E5FB6A58;
    id v7 = v5;
    uint64_t v8 = self;
    [(ML3MusicLibrary *)self databaseConnectionAllowingWrites:1 withBlock:v6];
  }
}

void __117__ML3MusicLibrary_UbiquitousDatabase__updateUbiquitousDatabaseByRemovingUbiquitousMetadataFromTrackWithPersistentID___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v18[0] = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  int v5 = [v3 arrayWithObjects:v18 count:1];
  id v11 = 0;
  char v6 = [v4 executeUpdate:@"DELETE FROM cloud_kvs WHERE key = ?" withParameters:v5 error:&v11];

  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)stat buf = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Encountered removing item from cloud_kvs. key=%{public}@ error=%{public}@", buf, 0x20u);
    }
  }
}

- (BOOL)supportsUbiquitousPlaybackPositions
{
  if (MSVDeviceIsHomePod() & 1) != 0 || (MSVDeviceIsWatch()) {
    return 0;
  }
  id v4 = [(ML3MusicLibrary *)self databasePath];
  int v5 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
  BOOL v3 = ([v4 isEqualToString:v5] & 1) != 0 || NSClassFromString(&cfstr_Sentestcase.isa) != 0;

  return v3;
}

- (id)mediaFolderRelativePath:(id)a3
{
  id v4 = a3;
  int v5 = [(ML3MusicLibrary *)self resourcesManager];
  char v6 = [v5 mediaFolderRelativePath:v4];

  return v6;
}

- (id)mediaFolderPathByAppendingPathComponent:(id)a3
{
  return +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:a3];
}

- (id)pathForBaseLocationPath:(int64_t)a3
{
  id v4 = [(ML3MusicLibrary *)self resourcesManager];
  int v5 = [v4 pathForBaseLocationPath:a3];

  return v5;
}

- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = [(ML3MusicLibrary *)self resourcesManager];
  uint64_t v12 = [v11 pathForResourceFileOrFolder:v8 basePath:v10 relativeToBase:v7 createParentFolderIfNecessary:v6];

  return v12;
}

- (id)libraryContainerRelativePath:(id)a3
{
  id v4 = a3;
  int v5 = [(ML3MusicLibrary *)self resourcesManager];
  BOOL v6 = [v5 libraryContainerRelativePath:v4];

  return v6;
}

- (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v4 = a3;
  int v5 = [(ML3MusicLibrary *)self resourcesManager];
  BOOL v6 = [v5 libraryContainerPathByAppendingPathComponent:v4];

  return v6;
}

- (id)libraryContainerPath
{
  char v2 = [(ML3MusicLibrary *)self resourcesManager];
  BOOL v3 = [v2 libraryContainerPath];

  return v3;
}

+ (id)cloudAssetsSharedCacheFolderPath
{
  char v2 = +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:@"Music/Cache/SharedCache"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ML3MusicLibrary_ML3Resources__cloudAssetsSharedCacheFolderPath__block_invoke;
  block[3] = &unk_1E5FB8298;
  id v3 = v2;
  id v6 = v3;
  if (cloudAssetsSharedCacheFolderPath_onceToken != -1) {
    dispatch_once(&cloudAssetsSharedCacheFolderPath_onceToken, block);
  }

  return v3;
}

void __65__ML3MusicLibrary_ML3Resources__cloudAssetsSharedCacheFolderPath__block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  char v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v37 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v44 = 0;
  id v4 = v2;
  char v5 = [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v44];
  id v6 = v44;
  if ((v5 & 1) == 0)
  {
    BOOL v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 32);
      *(_DWORD *)stat buf = 138543618;
      char v47 = v8;
      __int16 v48 = 2114;
      id v49 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "Failed to create cloud asset shared cache folder %{public}@ error %{public}@", buf, 0x16u);
    }
  }
  MSVGetKernelBootTime();
  double v10 = v9;
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSince1970];
  double v13 = v12 + -604800.0;

  if (v10 < v13) {
    double v10 = v13;
  }
  __int16 v14 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
    *(_DWORD *)stat buf = 138412290;
    char v47 = v15;
    _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Clearing cached items created before %@ in the shared cache folder", buf, 0xCu);
  }
  __int16 v16 = [v4 enumeratorAtPath:*(void *)(a1 + 32)];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v41;
    uint64_t v36 = *MEMORY[0x1E4F282C0];
    *(void *)&long long v18 = 138543618;
    long long v35 = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v22, "hasPrefix:", @"tmp.", v35))
        {
          id v23 = v6;
        }
        else
        {
          long long v24 = [*(id *)(v37 + 32) stringByAppendingPathComponent:v22];
          id v39 = v6;
          long long v25 = [v4 attributesOfItemAtPath:v24 error:&v39];
          id v23 = v39;

          if (!v25)
          {
            uint64_t v32 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = v35;
              char v47 = v22;
              __int16 v48 = 2114;
              id v49 = v23;
              uint64_t v33 = v32;
              char v34 = "Failed to retrieve attributes of shared cache file %{public}@ error %{public}@";
LABEL_23:
              _os_log_impl(&dword_1B022D000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);
            }
LABEL_24:

            goto LABEL_25;
          }
          unint64_t v26 = [v25 objectForKey:v36];
          [v26 timeIntervalSince1970];
          double v28 = v27;

          id v6 = v23;
          if (v28 >= v10) {
            goto LABEL_26;
          }
        }
        uint64_t v29 = v23;
        uint64_t v30 = [*(id *)(v37 + 32) stringByAppendingPathComponent:v22];
        id v38 = v23;
        char v31 = [v4 removeItemAtPath:v30 error:&v38];
        id v23 = v38;

        if ((v31 & 1) == 0)
        {
          uint64_t v32 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = v35;
            char v47 = v22;
            __int16 v48 = 2114;
            id v49 = v23;
            uint64_t v33 = v32;
            char v34 = "Failed to remove shared cache temporary file %{public}@ error %{public}@";
            goto LABEL_23;
          }
          goto LABEL_24;
        }
LABEL_25:
        id v6 = v23;
LABEL_26:
        [v16 skipDescendants];
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v19);
  }
}

+ (id)pathForBaseLocationPath:(int64_t)a3
{
  id v4 = +[ML3MusicLibraryResourcesManager sharedManager];
  char v5 = [v4 pathForBaseLocationPath:a3];

  return v5;
}

+ (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  double v10 = +[ML3MusicLibraryResourcesManager sharedManager];
  id v11 = [v10 pathForResourceFileOrFolder:v8 basePath:v9 relativeToBase:v7 createParentFolderIfNecessary:v6];

  return v11;
}

+ (id)libraryContainerRelativePath:(id)a3
{
  id v3 = a3;
  id v4 = +[ML3MusicLibraryResourcesManager sharedManager];
  char v5 = [v4 libraryContainerRelativePath:v3];

  return v5;
}

+ (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v3 = a3;
  id v4 = +[ML3MusicLibraryResourcesManager sharedManager];
  char v5 = [v4 libraryContainerPathByAppendingPathComponent:v3];

  return v5;
}

+ (id)libraryContainerPath
{
  char v2 = +[ML3MusicLibraryResourcesManager sharedManager];
  id v3 = [v2 libraryContainerPath];

  return v3;
}

+ (id)libraryPathForContainerPath:(id)a3
{
  id v3 = objc_msgSend(a3, "msv_stringByResolvingRealPath");
  id v4 = [v3 stringByAppendingPathComponent:@"iTunes_Control/iTunes/MediaLibrary.sqlitedb"];

  return v4;
}

+ (id)allLibraryContainerPaths
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (allLibraryContainerPaths_onceToken != -1) {
    dispatch_once(&allLibraryContainerPaths_onceToken, &__block_literal_global_16418);
  }
  id v17 = [MEMORY[0x1E4F1CA48] array];
  char v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = +[ML3MusicLibrary mediaFolderPath];
  id v4 = [v2 contentsOfDirectoryAtPath:v3 error:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = +[ML3MusicLibrary mediaFolderPath];
        double v12 = [v11 stringByAppendingPathComponent:v10];

        if (([(id)allLibraryContainerPaths___potentialContainerDenylist containsObject:v10] & 1) == 0)
        {
          double v13 = [MEMORY[0x1E4F28CB8] defaultManager];
          __int16 v14 = [v13 contentsOfDirectoryAtPath:v12 error:0];
          int v15 = [v14 containsObject:@"iTunes_Control"];

          if (v15) {
            [v17 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v17;
}

void __57__ML3MusicLibrary_ML3Resources__allLibraryContainerPaths__block_invoke()
{
  id v0 = (void *)allLibraryContainerPaths___potentialContainerDenylist;
  allLibraryContainerPaths___potentialContainerDenylist = (uint64_t)&unk_1F0910A08;
}

+ (id)mediaFolderPathByAppendingPathComponent:(id)a3
{
  id v3 = a3;
  id v4 = +[ML3MusicLibrary mediaFolderPath];
  id v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

- (BOOL)_removeSource:(int)a3 fromPersistentIDS:(id)a4 forImportOperation:(id)a5 canonocalizeCollections:(BOOL)a6 usingConnection:(id)a7 postNotifications:(BOOL)a8
{
  BOOL v9 = a6;
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v84 = a5;
  id v83 = a7;
  double v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109632;
    *(_DWORD *)uint64_t v124 = a3;
    *(_WORD *)&v124[4] = 2048;
    *(void *)&v124[6] = [v12 count];
    __int16 v125 = 1024;
    BOOL v126 = v9;
    _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks removing source %d from %lu tracks, canonocalizeCollections=%{BOOL}u", buf, 0x18u);
  }
  id v85 = v12;

  if (v12 && [v12 count])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v15 = v14;
    __int16 v16 = [MEMORY[0x1E4F1CA60] dictionary];
    id v80 = malloc_type_malloc(8 * [v12 count], 0x100004000313F17uLL);
    uint64_t v119 = 0;
    char v120 = &v119;
    uint64_t v121 = 0x2020000000;
    uint64_t v122 = 0;
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke;
    v113[3] = &unk_1E5FB6250;
    int v118 = a3;
    int v116 = &v119;
    int v117 = v80;
    v113[4] = self;
    id v17 = v83;
    id v114 = v17;
    id v94 = v16;
    id v115 = v94;
    +[ML3Track enumeratePathsToDeleteFromLibrary:self persistentIDs:v12 usingConnection:v17 usingBlock:v113];
    if ([v84 isCancelled]) {
      goto LABEL_36;
    }
    long long v18 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v120[3];
      *(_DWORD *)stat buf = 134217984;
      *(void *)uint64_t v124 = v19;
      _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks deleting %lu tracks", buf, 0xCu);
    }

    uint64_t v20 = v120[3];
    if (v20)
    {
      if (!+[ML3Track deleteFromLibrary:self deletionType:2 canonicalizeCollections:v9 persistentIDs:v80 count:v20 usingConnection:v17])
      {
        uint64_t v37 = os_log_create("com.apple.amp.medialibrary", "Default");
        BOOL v82 = 0;
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        *(_WORD *)stat buf = 0;
        id v39 = "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks failed to delete purged tracks";
        goto LABEL_34;
      }
      [v17 executeUpdate:@"UPDATE album SET user_rating=IFNULL((SELECT AVG(user_rating) FROM item_stats JOIN item USING (item_pid) WHERE album.album_pid=item.album_pid), album.user_rating) WHERE album.user_rating_is_derived=1", 0, 0 withParameters error];
    }
    long long v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543362;
      *(void *)uint64_t v124 = v12;
      _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing potential non-library tracks from all containers: %{public}@", buf, 0xCu);
    }

    +[ML3Container removeAnyNonLibraryItemsInPersistentIDs:v12 fromContainersInLibrary:self usingConnection:v17];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v22 = [v94 allKeys];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v109 objects:v132 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v110 != v24) {
            objc_enumerationMutation(v22);
          }
          unint64_t v26 = *(void **)(*((void *)&v109 + 1) + 8 * i);
          v131 = v26;
          double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
          double v28 = [v17 executeQuery:@"SELECT 1 FROM container_item JOIN container USING(container_pid) WHERE is_hidden = 0 AND item_pid = ?" withParameters:v27];
          int v29 = [v28 hasAtLeastOneRow];

          if (v29)
          {
            uint64_t v30 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v31 = [v26 longLongValue];
              *(_DWORD *)stat buf = 134217984;
              *(void *)uint64_t v124 = v31;
              _os_log_impl(&dword_1B022D000, v30, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Keeping asset for track %llu because it is ATPWATL", buf, 0xCu);
            }

            [v94 removeObjectForKey:v26];
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v109 objects:v132 count:16];
      }
      while (v23);
    }

    uint64_t v32 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [v94 count];
      *(_DWORD *)stat buf = 134217984;
      *(void *)uint64_t v124 = v33;
      _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks purging %lu assets", buf, 0xCu);
    }

    if (![v94 count]
      || ([v94 allKeys],
          char v34 = objc_claimAutoreleasedReturnValue(),
          BOOL v35 = +[ML3Track clearLocationFromLibrary:self persistentIDs:v34 usingConnection:v17], v34, v35))
    {
      uint64_t v36 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v37 = [v94 allValues];
      id v38 = [v36 setWithArray:v37];
      ML3DeleteAssetsAtPaths(v38);

      BOOL v82 = 1;
      goto LABEL_35;
    }
    uint64_t v37 = os_log_create("com.apple.amp.medialibrary", "Default");
    BOOL v82 = 0;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
LABEL_35:

      if (([v84 isCancelled] & 1) == 0)
      {
        id v88 = [MEMORY[0x1E4F1CA48] array];
        int64_t v41 = +[ML3MusicLibrary artworkSourceTypeForTrackSource:a3];
        long long v42 = (void *)MEMORY[0x1E4F1CA48];
        long long v43 = [NSNumber numberWithInteger:v41];
        uint64_t v89 = objc_msgSend(v42, "arrayWithObjects:", v43, &unk_1F0911E18, &unk_1F0911E48, 0);

        id v44 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = [v85 count];
          *(_DWORD *)stat buf = 134218240;
          *(void *)uint64_t v124 = v45;
          *(_WORD *)&v124[8] = 1024;
          *(_DWORD *)&v124[10] = v41;
          _os_log_impl(&dword_1B022D000, v44, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks updating artwork for %lu persistentIDs, sourceType=%d", buf, 0x12u);
        }

        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        obuint64_t j = v85;
        uint64_t v46 = [obj countByEnumeratingWithState:&v105 objects:v130 count:16];
        if (v46)
        {
          uint64_t v87 = *(void *)v106;
          do
          {
            uint64_t v90 = v46;
            for (uint64_t j = 0; j != v90; ++j)
            {
              if (*(void *)v106 != v87) {
                objc_enumerationMutation(obj);
              }
              uint64_t v48 = *(void *)(*((void *)&v105 + 1) + 8 * j);
              [v89 replaceObjectAtIndex:1 withObject:v48];
              [v17 executeUpdate:@"DELETE FROM artwork_token WHERE artwork_source_type = ? AND entity_pid = ? AND entity_type = ?" withParameters:v89 error:0];
              id v49 = [v17 executeQuery:@"SELECT artwork_type FROM best_artwork_token WHERE fetchable_artwork_source_type = ? AND entity_pid = ? AND entity_type = ?" withParameters:v89];
              v102[0] = MEMORY[0x1E4F143A8];
              v102[1] = 3221225472;
              v102[2] = __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_143;
              v102[3] = &unk_1E5FB6278;
              id v50 = v88;
              id v103 = v50;
              uint64_t v104 = v48;
              [v49 enumerateRowsWithBlock:v102];
              char v92 = v49;
              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              id v51 = v50;
              uint64_t v52 = [v51 countByEnumeratingWithState:&v98 objects:v129 count:16];
              if (v52)
              {
                uint64_t v53 = *(void *)v99;
                do
                {
                  for (uint64_t k = 0; k != v52; ++k)
                  {
                    if (*(void *)v99 != v53) {
                      objc_enumerationMutation(v51);
                    }
                    char v55 = *(void **)(*((void *)&v98 + 1) + 8 * k);
                    char v56 = [v55 objectAtIndexedSubscript:0];
                    uint64_t v57 = [v56 longLongValue];
                    uint64_t v58 = [v55 objectAtIndexedSubscript:1];
                    -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:](self, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", v57, 0, (int)[v58 intValue], v17, 0.0);
                  }
                  uint64_t v52 = [v51 countByEnumeratingWithState:&v98 objects:v129 count:16];
                }
                while (v52);
              }
            }
            uint64_t v46 = [obj countByEnumeratingWithState:&v105 objects:v130 count:16];
          }
          while (v46);
        }

        if (a3 == 3)
        {
          uint64_t v59 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)stat buf = 67109120;
            *(_DWORD *)uint64_t v124 = 3;
            _os_log_impl(&dword_1B022D000, v59, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks cleaning artwork options for source=%d", buf, 8u);
          }

          [(ML3MusicLibrary *)self cleanupArtworkWithOptions:6 usingConnection:v17];
        }
        id v93 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v60 = [obj count];
        if (v60 >= 1)
        {
          do
          {
            if ((unint64_t)v60 >= 0xFA) {
              uint64_t v61 = 250;
            }
            else {
              uint64_t v61 = v60;
            }
            long long v62 = +[ML3DatabaseStatementRenderer defaultRenderer];
            int v63 = [v62 statementWithPrefix:@"SELECT item_pid FROM item JOIN item_stats USING(item_pid) WHERE in_my_library=0 AND liked_state=2 AND item_pid" inParameterCount:v61];
            int v64 = objc_msgSend(obj, "subarrayWithRange:", objc_msgSend(obj, "count") - v60, v61);
            int v65 = [v17 executeQuery:v63 withParameters:v64];
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_148;
            v96[3] = &unk_1E5FB83F8;
            id v97 = v93;
            [v65 enumerateRowsWithBlock:v96];

            BOOL v66 = v60 <= v61;
            v60 -= v61;
          }
          while (!v66);
        }
        int v67 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v68 = [v93 count];
          *(_DWORD *)stat buf = 134217984;
          *(void *)uint64_t v124 = v68;
          _os_log_impl(&dword_1B022D000, v67, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks removing liked_state from=%lu presistentIDs", buf, 0xCu);
        }

        uint64_t v69 = [v93 count];
        if (v69 >= 1)
        {
          do
          {
            char v70 = [MEMORY[0x1E4F1C9C8] date];
            if ((unint64_t)v69 >= 0xFA) {
              uint64_t v71 = 250;
            }
            else {
              uint64_t v71 = v69;
            }
            uint64_t v72 = +[ML3DatabaseStatementRenderer defaultRenderer];
            __int16 v73 = [v72 statementWithPrefix:@"UPDATE item_stats SET liked_state=0, liked_state_changed_date=? WHERE item_pid", v71 inParameterCount];
            uint64_t v74 = [MEMORY[0x1E4F1CA48] arrayWithObject:v70];
            uint64_t v75 = objc_msgSend(v93, "subarrayWithRange:", objc_msgSend(v93, "count") - v69, v71);
            [v74 addObjectsFromArray:v75];

            id v95 = 0;
            LOBYTE(v75) = [v17 executeUpdate:v73 withParameters:v74 error:&v95];
            id v91 = v95;
            if ((v75 & 1) == 0)
            {
              long long v76 = os_log_create("com.apple.amp.medialibrary", "Default");
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)stat buf = 138543362;
                *(void *)uint64_t v124 = v91;
                _os_log_impl(&dword_1B022D000, v76, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks failed to update liked_state on deleted tracks, error=%{public}@", buf, 0xCu);
              }
            }
            BOOL v66 = v69 <= v71;
            v69 -= v71;
          }
          while (!v66);
        }
        long long v77 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v78 = [obj count];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          *(_DWORD *)stat buf = 67109888;
          *(_DWORD *)uint64_t v124 = a3;
          *(_WORD *)&v124[4] = 2048;
          *(void *)&v124[6] = v78;
          __int16 v125 = 1024;
          BOOL v126 = v82;
          __int16 v127 = 2048;
          double v128 = v79 - v15;
          _os_log_impl(&dword_1B022D000, v77, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d from %lu tracks finished with success=%d in %.3f seconds", buf, 0x22u);
        }

        [(ML3MusicLibrary *)self notifyEntitiesAddedOrRemoved];
        [(ML3MusicLibrary *)self notifyContentsDidChange];
        free(v80);

        goto LABEL_37;
      }
LABEL_36:
      LOBYTE(v82) = 0;
LABEL_37:

      _Block_object_dispose(&v119, 8);
      goto LABEL_38;
    }
    *(_WORD *)stat buf = 0;
    id v39 = "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks failed to clear location for purged tracks";
LABEL_34:
    _os_log_impl(&dword_1B022D000, v37, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
    BOOL v82 = 0;
    goto LABEL_35;
  }
  LOBYTE(v82) = 1;
LABEL_38:

  return v82;
}

void __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    uint64_t v37 = a5;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks enumeratePathsToDeleteFromLibrary: %lld", buf, 0xCu);
  }

  id v11 = +[ML3Entity newWithPersistentID:a5 inLibrary:*(void *)(a1 + 32)];
  id v12 = [v11 valueForProperty:@"item_stats.needs_restore"];
  if ([v12 BOOLValue])
  {
    double v13 = [v11 valueForProperty:@"item_store.store_item_id"];
    uint64_t v14 = [v13 longLongValue];

    if (v14) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v15 = *(unsigned int *)(a1 + 72);
  if (v15 < 2) {
    goto LABEL_11;
  }
  if ((a4 & 1) == 0)
  {
    if ((ML3TrackRulesRemoveLocalAssetForSource(v15) & 1) == 0)
    {
      uint64_t v34 = a3;
      uint64_t v15 = *(unsigned int *)(a1 + 72);
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v18 = *(void *)(v17 + 24);
    *(void *)(v17 + 24) = v18 + 1;
    *(void *)(v16 + 8 * v18) = a5;
    goto LABEL_22;
  }
  uint64_t v34 = a3;
LABEL_13:
  uint64_t v19 = ML3TrackRulesRemovalPropertiesForSource(v15);
  uint64_t v20 = [v19 allValues];
  long long v21 = [v19 allKeys];
  [v11 setValues:v20 forProperties:v21 usingConnection:*(void *)(a1 + 40)];

  long long v22 = *(void **)(a1 + 40);
  uint64_t v23 = [NSString stringWithFormat:@"SELECT %@ FROM item WHERE item_pid=?", @"(item.remote_location_id >= 50 AND item.remote_location_id < 300)"];
  uint64_t v24 = [NSNumber numberWithLongLong:a5];
  BOOL v35 = v24;
  long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  unint64_t v26 = [v22 executeQuery:v23 withParameters:v25];
  uint64_t v27 = [v26 int64ValueForFirstRowAndColumn];

  if (v27)
  {
    if (v9 && ML3TrackRulesRemoveLocalAssetForSource(*(unsigned int *)(a1 + 72)))
    {
      double v28 = *(void **)(a1 + 48);
      int v29 = [NSNumber numberWithLongLong:a5];
      [v28 setObject:v9 forKey:v29];
    }
  }
  else if (!v9 || (int v30 = ML3TrackRulesRemoveLocalAssetForSource(*(unsigned int *)(a1 + 72)), v34 < 250) || v30)
  {
    uint64_t v31 = *(void *)(a1 + 64);
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v33 = *(void *)(v32 + 24);
    *(void *)(v32 + 24) = v33 + 1;
    *(void *)(v31 + 8 * v33) = a5;
  }

LABEL_22:
}

void __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_143(uint64_t a1, void *a2)
{
  double v5[2] = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  id v3 = [a2 objectAtIndexedSubscript:0];
  v5[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v2 addObject:v4];
}

void __150__ML3MusicLibrary_RemoveSourceOrTracks___removeSource_fromPersistentIDS_forImportOperation_canonocalizeCollections_usingConnection_postNotifications___block_invoke_148(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a2, "int64ForColumnIndex:", 0));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)removeSource:(int)a3 fromPersistentIDS:(id)a4 forImportOperation:(id)a5 usingConnection:(id)a6 postNotifications:(BOOL)a7
{
  return [(ML3MusicLibrary *)self _removeSource:*(void *)&a3 fromPersistentIDS:a4 forImportOperation:a5 canonocalizeCollections:1 usingConnection:a6 postNotifications:a7];
}

- (BOOL)removeSource:(int)a3 forImportOperation:(id)a4 usingConnection:(id)a5 postNotifications:(BOOL)a6
{
  BOOL v95 = a6;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v110 = a4;
  id v115 = a5;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d from entire library", buf, 8u);
  }
  unsigned int v111 = a3;

  long long v112 = ML3TrackRulesRemovalPropertiesForSource(a3);
  long long v109 = ML3TrackRulesRemovalSourceIdentityPropertyForSource(a3);
  long long v108 = +[ML3ComparisonPredicate predicateWithProperty:v109 value:&unk_1F0911E18 comparison:2];
  if (a3 != 3)
  {
    if (a3 != 2)
    {
      int v99 = 0;
      goto LABEL_28;
    }
    int v99 = 1;
    id v143 = 0;
    char v11 = [v115 executeUpdate:@"UPDATE item_stats SET liked_state=0, liked_state_changed_date=0", 0, &v143 withParameters error];
    id v12 = v143;
    if ((v11 & 1) == 0)
    {
      double v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 2;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v12;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to clear item_stats properties. error: %@", buf, 0x12u);
      }
    }
    v151[0] = v108;
    uint64_t v14 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.is_protected" equalToInt64:2];
    v151[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:2];
    uint64_t v16 = +[ML3CompoundPredicate predicateMatchingPredicates:v15];

    uint64_t v17 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:self predicate:v16 orderingTerms:MEMORY[0x1E4F1CBF0]];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke;
    v141[3] = &unk_1E5FB7EE0;
    uint64_t v19 = v18;
    id v142 = v19;
    [v17 enumeratePersistentIDsUsingBlock:v141];
    if ([v19 count])
    {
      uint64_t v20 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v19 count];
        *(_DWORD *)stat buf = 134218240;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2;
        _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Found %lu tracks to unlink with asset protection type = %d", buf, 0x12u);
      }

      long long v22 = [MEMORY[0x1E4F1CA80] set];
      v139[0] = MEMORY[0x1E4F143A8];
      v139[1] = 3221225472;
      v139[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_92;
      v139[3] = &unk_1E5FB61E0;
      id v23 = v22;
      id v140 = v23;
      +[ML3Track enumeratePathsToDeleteFromLibrary:self persistentIDs:v19 usingBlock:v139];
      uint64_t v24 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138543362;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Deleting assets due to remove cloud library source:%{public}@", buf, 0xCu);
      }

      ML3DeleteAssetsAtPaths(v23);
      if (!+[ML3Track clearLocationFromLibrary:self persistentIDs:v19 usingConnection:v115])
      {
        long long v25 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = 2;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to clear location for tracks with asset protection type = %d", buf, 0xEu);
        }
      }
    }
    unint64_t v26 = v142;
    goto LABEL_26;
  }
  int v99 = 0;
  ML3NonQualifiedColumnNameFromProperty(@"item_stats.chosen_by_auto_fill");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v112 objectForKey:@"item_stats.chosen_by_auto_fill"];
  uint64_t v27 = (void *)[v112 mutableCopy];
  [v27 removeObjectForKey:@"item_stats.chosen_by_auto_fill"];

  uint64_t v17 = [NSString stringWithFormat:@"UPDATE item_stats SET %@=%@", v12, v16];
  id v144 = 0;
  char v28 = [v115 executeUpdate:v17 withParameters:0 error:&v144];
  uint64_t v19 = v144;
  if ((v28 & 1) == 0)
  {
    unint64_t v26 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = 3;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = @"item_stats.chosen_by_auto_fill";
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v16;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v19;
      _os_log_impl(&dword_1B022D000, v26, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to set %@ to %@ with error: %@", buf, 0x26u);
    }
    long long v112 = v27;
LABEL_26:

    uint64_t v27 = v112;
    goto LABEL_27;
  }
  int v99 = 0;
LABEL_27:

  long long v112 = v27;
LABEL_28:
  if ([v110 isCancelled])
  {
    LOBYTE(v105) = 0;
  }
  else
  {
    long long v107 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:self predicate:v108 orderingTerms:MEMORY[0x1E4F1CBF0]];
    [v107 setIgnoreRestrictionsPredicates:1];
    long long v101 = [v107 selectPersistentIDsSQL];
    uint64_t v104 = [v107 persistentIDParameters];
    id v103 = [MEMORY[0x1E4F28E78] stringWithString:@"UPDATE item_store SET "];
    int v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v112, "count"));
    int v30 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v112, "count"));
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v31 = v112;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v135 objects:v150 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v136 != v33) {
            objc_enumerationMutation(v31);
          }
          BOOL v35 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          uint64_t v36 = ML3NonQualifiedColumnNameFromProperty(v35);
          [v29 addObject:v36];
          uint64_t v37 = [v31 objectForKey:v35];
          [v30 addObject:v37];
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v135 objects:v150 count:16];
      }
      while (v32);
    }

    long long v100 = [v29 componentsJoinedByString:@"=?, "];
    [v103 appendFormat:@"%@=? WHERE item_pid IN (%@)", v100, v101];
    long long v106 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v30, "count") + objc_msgSend(v104, "count"));
    [v106 addObjectsFromArray:v30];
    [v106 addObjectsFromArray:v104];
    id v134 = 0;
    char v38 = [v115 executeUpdate:v103 withParameters:v106 error:&v134];
    id v96 = v134;
    if ((v38 & 1) == 0)
    {
      id v39 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        long long v40 = [v31 allKeys];
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)&uint8_t buf[4] = v111;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v40;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v96;
        _os_log_impl(&dword_1B022D000, v39, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to remove source properties: %{public}@\nwith error: %@", buf, 0x1Cu);
      }
    }
    if ([v110 isCancelled])
    {
      LOBYTE(v105) = 0;
    }
    else
    {
      int64_t v41 = [MEMORY[0x1E4F1CA48] array];
      id v85 = [MEMORY[0x1E4F1CA48] array];
      long long v42 = [MEMORY[0x1E4F1CA48] array];
      __int16 v102 = [MEMORY[0x1E4F1CA48] array];
      long long v43 = +[ML3ComparisonPredicate predicateWithProperty:@"remote_location_id" equalToInt64:0];
      [v102 addObject:v43];

      id v44 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.is_ota_purchased" equalToInteger:0];
      [v102 addObject:v44];

      uint64_t v45 = +[ML3ComparisonPredicate predicateWithProperty:@"item_stats.needs_restore" equalToInt64:0];
      [v102 addObject:v45];

      uint64_t v46 = v111;
      if ((int)v111 > 3 || v111 == 1)
      {
        char v47 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.sync_id" equalToInt64:0];
        [v102 addObject:v47];

        uint64_t v46 = v111;
      }
      if ((ML3TrackRulesRemoveLocalAssetForSource(v46) & 1) == 0)
      {
        uint64_t v48 = +[ML3ComparisonPredicate predicateWithProperty:@"base_location_id" value:&unk_1F0911E30 comparison:5];
        [v102 addObject:v48];
      }
      id v94 = +[ML3CompoundPredicate predicateMatchingPredicates:v102];
      long long v98 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:self predicate:v94 orderingTerms:0];
      [v98 setIgnoreRestrictionsPredicates:1];
      char v92 = [v98 selectPersistentIDsSQL];
      id v91 = [v98 persistentIDParameters];
      uint64_t v90 = [v115 executeQuery:v92 withParameters:v91];
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_106;
      v132[3] = &unk_1E5FB83F8;
      id v93 = v41;
      id v133 = v93;
      [v90 enumerateRowsWithBlock:v132];
      uint64_t v89 = +[ML3UnaryPredicate predicateWithPredicate:v94];
      id v97 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:self predicate:v89 orderingTerms:0];
      [v97 setIgnoreRestrictionsPredicates:1];
      id v88 = [v97 selectPersistentIDsSQL];
      uint64_t v87 = [v97 persistentIDParameters];
      uint64_t v86 = [v115 executeQuery:v88 withParameters:v87];
      v130[0] = MEMORY[0x1E4F143A8];
      v130[1] = 3221225472;
      void v130[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_2;
      v130[3] = &unk_1E5FB83F8;
      id v84 = v42;
      id v131 = v84;
      [v86 enumerateRowsWithBlock:v130];
      if ([v110 isCancelled]) {
        goto LABEL_71;
      }
      id v49 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = [v93 count];
        uint64_t v51 = [v85 count];
        *(_DWORD *)stat buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v111;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = v50;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v51;
        _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, deleting %lu tracks, purging %lu assets", buf, 0x1Cu);
      }

      if ([v93 count])
      {
        uint64_t v52 = (void *)MEMORY[0x1B3E93C70]();
        *(void *)stat buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        *(void *)&unsigned char buf[24] = 0;
        uint64_t v53 = [v93 count];
        uint64_t v126 = 0;
        __int16 v127 = &v126;
        uint64_t v128 = 0x2020000000;
        uint64_t v129 = 0;
        uint64_t v129 = malloc_type_malloc(8 * v53, 0x100004000313F17uLL);
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_109;
        v125[3] = &unk_1E5FB6228;
        v125[4] = &v126;
        v125[5] = buf;
        [v93 enumerateObjectsUsingBlock:v125];
        [v93 removeAllObjects];
        char v54 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v148 = 134217984;
          uint64_t v149 = v53;
          _os_log_impl(&dword_1B022D000, v54, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks deleting %lu tracks", v148, 0xCu);
        }

        if (!+[ML3Track deleteFromLibrary:self deletionType:2 persistentIDs:v127[3] count:v53 usingConnection:v115])
        {
          char v55 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v148 = 67109120;
            LODWORD(v149) = v111;
            _os_log_impl(&dword_1B022D000, v55, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to delete purged tracks", v148, 8u);
          }
        }
        free((void *)v127[3]);
        [v115 executeUpdate:@"UPDATE album SET user_rating=IFNULL((SELECT AVG(user_rating) FROM item_stats JOIN item USING (item_pid) WHERE album.album_pid=item.album_pid), album.user_rating) WHERE album.user_rating_is_derived=1", 0, 0 withParameters error];
        _Block_object_dispose(&v126, 8);
        _Block_object_dispose(buf, 8);
      }
      if ([v110 isCancelled]) {
        goto LABEL_71;
      }
      if ([v85 count])
      {
        char v56 = (void *)MEMORY[0x1B3E93C70]();
        uint64_t v57 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_1B022D000, v57, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Deleting assets due to remove source:", buf, 2u);
        }

        uint64_t v58 = [v85 count];
        uint64_t v59 = [MEMORY[0x1E4F1CA80] set];
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_114;
        v123[3] = &unk_1E5FB61E0;
        id v60 = v59;
        id v124 = v60;
        +[ML3Track enumeratePathsToDeleteFromLibrary:self persistentIDs:v85 usingBlock:v123];
        ML3DeleteAssetsAtPaths(v60);
        uint64_t v61 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 134217984;
          *(void *)&uint8_t buf[4] = v58;
          _os_log_impl(&dword_1B022D000, v61, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks clearing location from %lu tracks", buf, 0xCu);
        }

        if (!+[ML3Track clearLocationFromLibrary:self persistentIDs:v85 usingConnection:v115])
        {
          long long v62 = _ML3LogCategoryDefault();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)stat buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v111;
            _os_log_impl(&dword_1B022D000, v62, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d, failed to clear location for purged tracks", buf, 8u);
          }
        }
      }
      if ([v110 isCancelled])
      {
LABEL_71:
        LOBYTE(v105) = 0;
      }
      else
      {
        if ([v84 count]) {
          +[ML3Entity incrementRevisionForRevisionTypeContentWithConnection:v115 deletionType:0 persistentIDs:v84];
        }
        int64_t v64 = +[ML3MusicLibrary artworkSourceTypeForTrackSource:v111];
        int v65 = [NSNumber numberWithInteger:v64];
        long long v147 = v65;
        BOOL v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
        int v105 = [v115 executeUpdate:@"DELETE FROM artwork_token WHERE artwork_source_type = ?" withParameters:v66 error:0];

        int v67 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v68 = [NSNumber numberWithInteger:v64];
        long long v146 = v68;
        uint64_t v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
        id v83 = [v115 executeQuery:@"SELECT entity_pid, entity_type, artwork_type FROM best_artwork_token WHERE fetchable_artwork_source_type = ?", v69 withParameters];

        v121[0] = MEMORY[0x1E4F143A8];
        v121[1] = 3221225472;
        v121[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_122;
        v121[3] = &unk_1E5FB83F8;
        id v70 = v67;
        id v122 = v70;
        [v83 enumerateRowsWithBlock:v121];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        obuint64_t j = v70;
        uint64_t v71 = [obj countByEnumeratingWithState:&v117 objects:v145 count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v118;
          do
          {
            for (uint64_t j = 0; j != v71; ++j)
            {
              if (*(void *)v118 != v72) {
                objc_enumerationMutation(obj);
              }
              uint64_t v74 = *(void **)(*((void *)&v117 + 1) + 8 * j);
              uint64_t v75 = [v74 objectAtIndexedSubscript:0];
              uint64_t v76 = [v75 longLongValue];
              long long v77 = [v74 objectAtIndexedSubscript:1];
              int v78 = [v77 intValue];
              double v79 = [v74 objectAtIndexedSubscript:2];
              -[ML3MusicLibrary updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:](self, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", v76, v78, (int)[v79 intValue], v115, 0.0);
            }
            uint64_t v71 = [obj countByEnumeratingWithState:&v117 objects:v145 count:16];
          }
          while (v71);
        }

        if (v111 == 3) {
          [(ML3MusicLibrary *)self cleanupArtworkWithOptions:6 usingConnection:v115];
        }
        if (v99)
        {
          id v80 = _ML3LogCategoryDefault();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)stat buf = 0;
            _os_log_impl(&dword_1B022D000, v80, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Deleting all non-library tracks from playlists (removing source match)", buf, 2u);
          }

          +[ML3Container removeNonLibraryItemsFromContainersInLibrary:self usingConnection:v115];
        }
        id v81 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          *(_DWORD *)stat buf = 67109632;
          *(_DWORD *)&uint8_t buf[4] = v111;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v105;
          *(_WORD *)&buf[14] = 2048;
          *(double *)&buf[16] = v82 - v9;
          _os_log_impl(&dword_1B022D000, v81, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Removing source: %d from entire library finished with success=%d in %.3f seconds", buf, 0x18u);
        }

        if ((v105 & v95) == 1)
        {
          v116[0] = MEMORY[0x1E4F143A8];
          v116[1] = 3221225472;
          v116[2] = __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_124;
          v116[3] = &unk_1E5FB75F0;
          v116[4] = self;
          [v115 enqueueBlockForTransactionCommit:v116];
        }
      }
    }
  }
  return v105;
}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

uint64_t __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    if ([v3 length]) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 int64ForColumnIndex:0];
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithLongLong:v3];
  [v4 addObject:v5];
}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 int64ForColumnIndex:0];
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithLongLong:v3];
  [v4 addObject:v5];
}

uint64_t __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t result = [a2 longLongValue];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  *(void *)(v4 + 8 * v6) = result;
  return result;
}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && [v3 length])
  {
    [*(id *)(a1 + 32) addObject:v4];
    uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_122(uint64_t a1, void *a2)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", 1, v4);
  v8[1] = v5;
  int v6 = [v3 objectAtIndexedSubscript:2];

  void v8[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [v2 addObject:v7];
}

uint64_t __107__ML3MusicLibrary_RemoveSourceOrTracks__removeSource_forImportOperation_usingConnection_postNotifications___block_invoke_124(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyEntitiesAddedOrRemoved];
  char v2 = *(void **)(a1 + 32);

  return [v2 notifyContentsDidChange];
}

- (void)clearCachedPurchaseHistoryVersionsUsingConnection:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  char v3 = [a3 executeUpdate:@"DELETE FROM _MLDatabaseProperties WHERE key IN (?, ?, ?, ?)", &unk_1F0910A38, &v6 withParameters error];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Could not remove cached jalisco library properties - error=%{public}@", buf, 0xCu);
    }
  }
}

- (void)clearCachedCloudLibraryVersionsUsingConnection:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  char v3 = [a3 executeUpdate:@"DELETE FROM _MLDatabaseProperties WHERE key IN (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", &unk_1F0910A20, &v6 withParameters error];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "[ML3MusicLibrary+RemoveSourceOrTracks] ML3MusicLibrary+RemoveSourceOrTracks Could not remove cached saga library properties - error=%{public}@", buf, 0xCu);
    }
  }
}

- (void)clearSagaLastUpdatedClientBuildVersion
{
}

- (void)clearSagaCloudFavoriteSongAddToLibraryBehavior
{
}

- (void)clearSagaClientFeaturesVersion
{
}

- (void)clearSagaCloudAddToPlaylistBehavior
{
}

- (void)clearSagaPrefersToMergeWithCloudLibrary
{
}

- (void)clearSagaCloudLibraryTroveID
{
}

- (void)clearSagaCloudLibraryCUID
{
}

- (void)clearSagaLastPlaylistPlayDataUploadDate
{
}

- (void)clearSagaLastItemPlayDataUploadDate
{
}

- (void)clearSagaLastGeniusUpdateDate
{
}

- (void)clearSagaCloudAccountID
{
}

- (void)setSagaLastCloudUpdateClientBuildVersion:(id)a3
{
}

- (NSString)sagaLastCloudUpdateClientBuildVersion
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudDatabaseUpdateClientBuildVersion"];
}

- (void)setSagaClientFeaturesVersion:(id)a3
{
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%li", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudDatabasePreferredVideoQuality"];
}

- (int64_t)preferredVideoQuality
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudDatabasePreferredVideoQuality"];
  char v3 = v2;
  if (v2 && [v2 length]) {
    int64_t v4 = (int)[v3 intValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)setSagaLastSubscribedContainersUpdateTime:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudLastSubscribedContainersUpdate"];
}

- (NSDate)sagaLastSubscribedContainersUpdateTime
{
  char v2 = (void *)MEMORY[0x1E4F1C9C8];
  char v3 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudLastSubscribedContainersUpdate"];
  [v3 doubleValue];
  id v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (void)setSagaLastLibraryUpdateTime:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudLastLibraryUpdate"];
}

- (NSDate)sagaLastLibraryUpdateTime
{
  char v2 = (void *)MEMORY[0x1E4F1C9C8];
  char v3 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudLastLibraryUpdate"];
  [v3 doubleValue];
  id v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (void)setSagaOnDiskDatabaseRevision:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudDatabaseRevision"];
}

- (NSString)storefrontIdentifier
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLStorefrontID"];
}

- (void)setSagaPrefersToMergeWithCloudLibrary:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudLibraryPrefersToMerge"];
}

- (BOOL)sagaInitiateClientResetSync
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLSagaInitiateClientResetSync"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSagaInitiateClientResetSync:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLSagaInitiateClientResetSync"];
}

- (BOOL)sagaPrefersToMergeWithCloudLibrary
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudLibraryPrefersToMerge"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSagaNeedsFullUpdate:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLSagaNeedsFullUpdate"];
}

- (BOOL)sagaNeedsFullUpdate
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLSagaNeedsFullUpdate"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSagaCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudAccountFavoriteSongAddToLibraryBehavior"];
}

- (int64_t)sagaCloudFavoriteSongAddToLibraryBehavior
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudAccountFavoriteSongAddToLibraryBehavior"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setSagaCloudAddToPlaylistBehavior:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudAccountAddToPlaylistBehavior"];
}

- (int64_t)sagaCloudAddToPlaylistBehavior
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudAccountAddToPlaylistBehavior"];
  int64_t v3 = [v2 integerValue];

  if (v3) {
    return v3;
  }
  else {
    return 2;
  }
}

- (void)setSagaDatabaseUserVersion:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%i", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudDatabaseUserVersion"];
}

- (int64_t)sagaDatabaseUserVersion
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudDatabaseUserVersion"];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)setSagaCloudLibraryTroveID:(id)a3
{
}

- (NSString)sagaCloudLibraryTroveID
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudLibraryTroveID"];
}

- (void)setSagaCloudLibraryCUID:(id)a3
{
}

- (NSString)sagaCloudLibraryCUID
{
  return (NSString *)[(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudLibraryCUID"];
}

- (void)setSagaLastPlaylistPlayDataUploadDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudLastPlaylistPlayDataUpdate"];
}

- (NSDate)sagaLastPlaylistPlayDataUploadDate
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudLastPlaylistPlayDataUpdate"];
  [v2 doubleValue];
  double v4 = v3;

  if (v4 == 0.0)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = [v5 dateByAddingTimeInterval:-86400.0];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v4];
  }

  return (NSDate *)v6;
}

- (void)setSagaLastItemPlayDataUploadDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLCloudLastPlayDataUpdate"];
}

- (NSDate)sagaLastItemPlayDataUploadDate
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudLastPlayDataUpdate"];
  [v2 doubleValue];
  double v4 = v3;

  if (v4 == 0.0)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = [v5 dateByAddingTimeInterval:-86400.0];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v4];
  }

  return (NSDate *)v6;
}

- (void)setSagaLastGeniusUpdateDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLSagaLastGeniusUpdate"];
}

- (NSDate)sagaLastGeniusUpdateDate
{
  char v2 = (void *)MEMORY[0x1E4F1C9C8];
  double v3 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLSagaLastGeniusUpdate"];
  [v3 doubleValue];
  id v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (void)setSagaLastKnownActiveLockerAccountDSID:(id)a3
{
  objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a3, "longLongValue"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLLastKnownActiveLockerAccountDSID"];
}

- (NSNumber)sagaLastKnownActiveLockerAccountDSID
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLLastKnownActiveLockerAccountDSID"];
  double v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
  }
  else
  {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setSagaAccountID:(id)a3
{
}

- (NSNumber)sagaAccountID
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLCloudAccountID"];
  double v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
  }
  else
  {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (int64_t)syncIdFromMultiverseId:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ML3MusicLibrary *)self syncLibraryID];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v4, "libraryIdentifiers", 0);
  int64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v11 = [v10 libraryName];
        int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          int64_t v7 = [v10 libraryId];
          goto LABEL_11;
        }
      }
      int64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)prepareUnitTestDatabaseWithSQLFromContentsOfFile:(id)a3 error:(id *)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    if (a4) {
      *a4 = 0;
    }
    int64_t v7 = (void *)[[NSString alloc] initWithContentsOfFile:v6 encoding:4 error:a4];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = [v7 componentsSeparatedByString:@";"];
      if ([v9 count])
      {
        uint64_t v10 = [(ML3MusicLibrary *)self checkoutWriterConnection];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v9 = v9;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          long long v40 = self;
          int64_t v41 = v8;
          id v44 = a4;
          id v42 = v6;
          obuint64_t j = v9;
          uint64_t v13 = *(void *)v46;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v46 != v13) {
                objc_enumerationMutation(obj);
              }
              id v15 = *(id *)(*((void *)&v45 + 1) + 8 * i);
              long long v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              long long v17 = [v15 stringByTrimmingCharactersInSet:v16];
              uint64_t v18 = (void *)[v17 mutableCopy];

              unsigned int v20 = 1;
              do
              {
                uint64_t v21 = NSPersistentStringFromMLMediaType(v20, v19);
                if ([v21 length])
                {
                  long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v20);
                  objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", v21, v22, 1, 0, objc_msgSend(v18, "length"));
                }
                BOOL v23 = (v20 & 0x7FFFFF) == 0;
                v20 *= 2;
              }
              while (!v23);
              uint64_t v24 = [v18 rangeOfString:@"mlmediatype" options:1];
              if (v25)
              {
                uint64_t v28 = v24;
                int v29 = [MEMORY[0x1E4F28B00] currentHandler];
                int v30 = [NSString stringWithUTF8String:"NSString *executableSQLFromUnitTestFileForString(NSString *__strong)"];
                id v31 = [v18 substringFromIndex:v28];
                [v29 handleFailureInFunction:v30, @"ML3MusicLibrary+MLUnitTestingAdditions.m", 27, @"sql contains invalid text at '%@'", v31 file lineNumber description];
              }
              if ([v18 length])
              {
                int v26 = [v10 executeUpdate:v18];
                int v27 = v26;
                if (v44 && (v26 & 1) == 0)
                {
                  uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v49 = *MEMORY[0x1E4F28568];
                  uint64_t v37 = [NSString stringWithFormat:@"Error executing '%@'", v18];
                  uint64_t v50 = v37;
                  char v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
                  id *v44 = [v36 errorWithDomain:&stru_1F08D4D70 code:-1 userInfo:v38];

LABEL_35:
                  BOOL v32 = 0;
                  goto LABEL_36;
                }

                if (!v27) {
                  goto LABEL_35;
                }
              }
              else
              {
              }
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
            if (v12) {
              continue;
            }
            break;
          }
          BOOL v32 = 1;
LABEL_36:
          uint64_t v8 = v41;
          id v6 = v42;
          id v9 = obj;
          self = v40;
        }
        else
        {
          BOOL v32 = 1;
        }

        [v10 executeUpdate:@"DROP TABLE sort_map"];
        [(ML3MusicLibrary *)self updateSortMapOnConnection:v10 forceUpdateOriginals:1];
        [(ML3MusicLibrary *)self checkInDatabaseConnection:v10];
      }
      else
      {
        if (!a4)
        {
          BOOL v32 = 0;
          goto LABEL_39;
        }
        uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        uint64_t v10 = [NSString stringWithFormat:@"No SQL statements found in %@", v6];
        uint64_t v53 = v10;
        BOOL v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        *a4 = [v34 errorWithDomain:&stru_1F08D4D70 code:-1 userInfo:v35];

        BOOL v32 = 0;
      }
    }
    else
    {
      if (!a4)
      {
        BOOL v32 = 0;
LABEL_40:

        goto LABEL_41;
      }
      uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      id v9 = [NSString stringWithFormat:@"Unable to open file '%@'", v6];
      v55[0] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
      [v33 errorWithDomain:&stru_1F08D4D70 code:-1 userInfo:v10];
      BOOL v32 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_39:
    goto LABEL_40;
  }
  BOOL v32 = 1;
LABEL_41:

  return v32;
}

+ (id)unitTestableLibraryForTest:(id)a3 basePath:(id)a4 setupSQLFilenames:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v8 = a5;
  uint64_t v34 = v7;
  id v9 = (objc_class *)objc_opt_class();
  uint64_t v33 = NSStringFromClass(v9);
  BOOL v32 = NSStringFromSelector((SEL)[v7 selector]);
  uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v17 = [v16 stringByDeletingPathExtension];
        uint64_t v18 = [v16 pathExtension];
        int8x8_t v19 = [v10 pathForResource:v17 ofType:v18];

        if ([v16 length] && !objc_msgSend(v19, "length"))
        {
          int v27 = [MEMORY[0x1E4F28B00] currentHandler];
          [v27 handleFailureInMethod:a2, a1, @"ML3MusicLibrary+MLUnitTestingAdditions.m", 99, @"Could not prepare for test '%@/%@' database, unable to load setupSQLFilename = '%@' - no such file in bundle %@", v33, v32, v16, v10 object file lineNumber description];

          id v26 = 0;
          uint64_t v24 = v12;
          goto LABEL_15;
        }
        [v11 addObject:v19];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  int8x8_t v19 = [a1 databasePathForUnitTest:v34 withBasePath:v30];
  unsigned int v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v21 = [v19 stringByDeletingLastPathComponent];
  [v20 removeItemAtPath:v21 error:0];

  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  long long v22 = [ML3MusicLibrary alloc];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __97__ML3MusicLibrary_MLUnitTestingAdditions__unitTestableLibraryForTest_basePath_setupSQLFilenames___block_invoke;
  v35[3] = &unk_1E5FB71C0;
  id v36 = v11;
  SEL v40 = a2;
  id v41 = a1;
  id v37 = v33;
  id v38 = v32;
  id v39 = &v42;
  uint64_t v23 = [(ML3MusicLibrary *)v22 initWithPath:v19 readOnly:0 populateUnitTestTablesBlock:v35];
  uint64_t v24 = (void *)v23;
  if (*((unsigned char *)v43 + 24)) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = (void *)v23;
  }
  id v26 = v25;

  _Block_object_dispose(&v42, 8);
LABEL_15:

  return v26;
}

void __97__ML3MusicLibrary_MLUnitTestingAdditions__unitTestableLibraryForTest_basePath_setupSQLFilenames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        id v14 = v10;
        char v12 = [v3 prepareUnitTestDatabaseWithSQLFromContentsOfFile:v11 error:&v14];
        id v7 = v14;

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"ML3MusicLibrary+MLUnitTestingAdditions.m", 114, @"Could not prepare for test '%@/%@' database with setupSQLPath = %@, error = %@", *(void *)(a1 + 40), *(void *)(a1 + 48), v11, v7 object file lineNumber description];

          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        ++v9;
        uint64_t v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
}

+ (id)databasePathForUnitTest:(id)a3 withBasePath:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  id v6 = a3;
  uint64_t v7 = [(__CFString *)v5 length];
  uint64_t v8 = @"/tmp/ML3UnitTests";
  if (v7) {
    uint64_t v8 = v5;
  }
  uint64_t v9 = v8;

  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  char v12 = (const char *)[v6 selector];

  uint64_t v13 = NSStringFromSelector(v12);
  if ([(__CFString *)v9 length])
  {
    id v14 = [(__CFString *)v9 stringByAppendingPathComponent:v11];
    long long v15 = [v14 stringByAppendingPathComponent:v13];

    long long v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v16 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:0];

    [v15 stringByAppendingPathComponent:@"library.sqlitedb"];
  }
  else
  {
    long long v15 = [NSString stringWithFormat:@"%@_%@", v11, v13];
    ML3MemorySQLiteDatabasePathWithName(v15);
  long long v17 = };

  return v17;
}

- (void)updateJaliscoExcludedMediaKindsWith:(id)a3 excludingMediaKindsInSet:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [(ML3MusicLibrary *)self jaliscoLastExcludedMediaKinds];
  if (!v6)
  {
    if (!v4) {
      goto LABEL_14;
    }
    uint64_t v7 = [v12 allObjects];
    uint64_t v9 = +[ML3MusicLibrary jaliscoGetSortedMediaKinds:v7];
    goto LABEL_10;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
  uint64_t v8 = [v7 count];
  if (v4) {
    [v7 unionSet:v12];
  }
  else {
    [v7 minusSet:v12];
  }
  if (v8 != [v7 count])
  {
    uint64_t v10 = [v7 allObjects];
    uint64_t v9 = +[ML3MusicLibrary jaliscoGetSortedMediaKinds:v10];

LABEL_10:
    if ([v9 count])
    {
      uint64_t v11 = [v9 componentsJoinedByString:@","];
      [(ML3MusicLibrary *)self setValue:v11 forDatabaseProperty:@"MLJaliscoLastExcludedMediaKinds"];
    }
    else
    {
      [(ML3MusicLibrary *)self clearJaliscoLastExcludedMediaKinds];
    }
    goto LABEL_13;
  }
  uint64_t v9 = v7;
LABEL_13:

LABEL_14:
}

- (void)sortJaliscoLastSupportedMediaKinds
{
  id v8 = [(ML3MusicLibrary *)self jaliscoLastSupportedMediaKinds];
  id v3 = [v8 componentsSeparatedByString:@","];
  BOOL v4 = NSStringFromSelector(sel_longLongValue);
  uint64_t v5 = [v3 valueForKey:v4];

  id v6 = +[ML3MusicLibrary jaliscoGetSortedMediaKinds:v5];

  uint64_t v7 = [v6 componentsJoinedByString:@","];
  [(ML3MusicLibrary *)self setJaliscoLastSupportedMediaKinds:v7];
}

- (void)clearJaliscoLastExcludedMediaKinds
{
}

- (void)clearJaliscoLastGeniusUpdateDate
{
}

- (void)clearJaliscoAccountID
{
}

- (void)setJaliscoLastLibraryUpdateTime:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLJaliscoLastLibraryUpdate"];
}

- (NSDate)jaliscoLastLibraryUpdateTime
{
  char v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoLastLibraryUpdate"];
  [v3 doubleValue];
  id v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (void)setJaliscoOnDiskDatabaseRevision:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLJaliscoDatabaseRevision"];
}

- (void)setJaliscoNeedsUpdateForTokens:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLJaliscoNeedsUpdateForTokens"];
}

- (void)setJaliscoIsMusicGeniusUserEnabled:(BOOL)a3
{
  id v3 = (const void *)[NSNumber numberWithBool:a3];

  CFPreferencesSetAppValue(@"GeniusUserEnabled", v3, @"com.apple.mobileipod");
}

- (BOOL)jaliscoIsMusicGeniusUserEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"GeniusUserEnabled", @"com.apple.mobileipod", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)setJaliscoHasCloudGeniusData:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLJaliscoHasCloudGeniusData"];
}

- (BOOL)jaliscoHasCloudGeniusData
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoHasCloudGeniusData"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setJaliscoLastSupportedMediaKinds:(id)a3
{
}

- (void)setJaliscoLastGeniusUpdateDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(ML3MusicLibrary *)self setValue:v4 forDatabaseProperty:@"MLJaliscoLastGeniusUpdate"];
}

- (NSDate)jaliscoLastGeniusUpdateDate
{
  char v2 = (void *)MEMORY[0x1E4F1C9C8];
  char v3 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoLastGeniusUpdate"];
  [v3 doubleValue];
  id v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (NSNumber)jaliscoAccountID
{
  char v2 = [(ML3MusicLibrary *)self valueForDatabaseProperty:@"MLJaliscoAccountID"];
  char v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
  }
  else
  {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

@end