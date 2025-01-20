@interface WebBookmarkCollection
+ (BOOL)_isLockedSync;
+ (BOOL)_lockSync;
+ (BOOL)_removeCorruptedBookmarksDatabaseAtPath:(id)a3;
+ (BOOL)isLockedSync;
+ (BOOL)isSyncAllowed;
+ (BOOL)lockSync;
+ (NSString)bookmarkImagesDirectoryPath;
+ (NSString)readingListArchivesDirectoryPath;
+ (NSURL)inMemoryChangesFileURL;
+ (WebBookmarkChangeSet)inMemoryChangeSet;
+ (WebBookmarkCollection)collectionWithConfiguration:(id)a3;
+ (WebBookmarkCollection)safariBookmarkCollection;
+ (id)_cloudKitSyncMetadataFileNameWithCollectionType:(int64_t)a3;
+ (id)_defaultDatabaseFileNameForConfiguration:(id)a3;
+ (id)_deviceIdentifierForCloudKitWithCollectionType:(int64_t)a3;
+ (id)_syncFlags;
+ (id)_syncLockFileName;
+ (id)_uniqueExternalUUID;
+ (id)databasePathForConfiguration:(id)a3;
+ (id)deviceIdentifierForCloudKitWithCollectionType:(int64_t)a3 generateIfNeeded:(BOOL)a4;
+ (unint64_t)readingListArchivesDiskUsage;
+ (void)_postBookmarksChangedSyncNotificationOnSyncQueue;
+ (void)_unlockSync;
+ (void)holdLockSync:(const void *)a3;
+ (void)resetDeviceIdentifierForCloudKitWithCollectionType:(int64_t)a3;
+ (void)safariBookmarkCollection;
+ (void)unholdLockSync:(const void *)a3;
+ (void)unlockSync;
+ (void)unlockSyncAsynchronously;
- (BOOL)_addBookmarkWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 orderIndex:(unsigned int)a6 isFolder:(BOOL)a7 externalUUID:(id)a8 associatedBookmark:(id)a9 updateParentChildCount:(BOOL)a10 updateAncestorEntries:(BOOL)a11 incrementGenerations:(BOOL)a12;
- (BOOL)_addChildrenOfID:(int)a3 toCollection:(id)a4 recursive:(BOOL)a5 error:(id *)a6;
- (BOOL)_bookmark:(id)a3 hasCurrentDAVHomePath:(id)a4;
- (BOOL)_bookmark:(id)a3 hasPriorityOverBookmarkForDeduplication:(id)a4 prioritizeBookmarksWithSyncData:(BOOL)a5 davHomePath:(id)a6;
- (BOOL)_bookmark:(id)a3 isDuplicateOfBookmark:(id)a4;
- (BOOL)_bookmarkHasSyncedToServer:(id)a3;
- (BOOL)_checkDatabaseIntegrity;
- (BOOL)_childrenOfParentBookmarkAreUnsyncable:(id)a3;
- (BOOL)_clearAllSyncData;
- (BOOL)_clearAllSyncKeys;
- (BOOL)_clearAllTombstones;
- (BOOL)_clearAllTombstonesDuringOrBeforeLocalRecordGeneration:(int64_t)a3;
- (BOOL)_clearChangeList;
- (BOOL)_clearFrequentlyVisitedSitesFolder:(BOOL)a3;
- (BOOL)_clearSyncDataAfterICloudKeychainReset;
- (BOOL)_clearSyncKeysUnderBookmarkID:(int)a3 isFolder:(BOOL)a4;
- (BOOL)_clearTitleWordsForBookmarkID:(int)a3;
- (BOOL)_clearTombstoneForBookmark:(id)a3;
- (BOOL)_deduplicateBookmarksForBookmarkDAVWithHomeURL:(id)a3;
- (BOOL)_deduplicateBookmarksForSyncingAndTrackChanges:(BOOL)a3 considerBookmarksWithSyncDataAsUnique:(BOOL)a4;
- (BOOL)_deduplicateBookmarksWithRootFolder:(int)a3 depth:(unint64_t)a4 trackChanges:(BOOL)a5 considerBookmarksWithSyncDataAsUnique:(BOOL)a6 davHomeURL:(id)a7;
- (BOOL)_deleteAncestorTableEntriesForBookmarkID:(int)a3;
- (BOOL)_deleteAndRebuildAncestorTableRecords;
- (BOOL)_deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4;
- (BOOL)_deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4 insertTombstoneBlock:(id)a5;
- (BOOL)_deleteBookmark:(id)a3 postChangeNotification:(BOOL)a4 forApplyingInMemoryChanges:(BOOL)a5;
- (BOOL)_deleteBookmarks:(id)a3 leaveTombstone:(BOOL)a4;
- (BOOL)_deleteRecursively:(int)a3 descendantsOnly:(BOOL)a4;
- (BOOL)_deleteSyncPropertyForKey:(id)a3;
- (BOOL)_ensureFolderChildrenCount:(id)a3;
- (BOOL)_importBookmarksPlist:(id)a3;
- (BOOL)_importSyncAnchorPlist:(id)a3;
- (BOOL)_incrementGeneration;
- (BOOL)_incrementRecordGeneration;
- (BOOL)_indexAllTitleWords;
- (BOOL)_indexBookmarkID:(int)a3 title:(id)a4;
- (BOOL)_insertAncestorTableEntriesForBookmarkID:(int)a3 withAncestorIDs:(id)a4;
- (BOOL)_insertAncestorTableEntriesForBookmarkID:(int)a3 withParentID:(int)a4;
- (BOOL)_insertTombsonesRecursivelyForRootFolder:(id)a3 insertTombstoneBlock:(id)a4;
- (BOOL)_insertTombstoneWithServerID:(id)a3 itemType:(int64_t)a4 subtype:(int64_t)a5 syncData:(id)a6;
- (BOOL)_isDatabaseWriteAllowed;
- (BOOL)_isTombstoneWithServerID:(id)a3;
- (BOOL)_markBookmarkID:(int)a3 added:(BOOL)a4;
- (BOOL)_markBookmarkID:(int)a3 withSpecialID:(int)a4;
- (BOOL)_markSpecialBookmarks;
- (BOOL)_mergeBookmark:(id)a3 withOriginalBookmark:(id)a4 prioritizeOriginalBookmarkAttributes:(BOOL)a5 generateChangesIfNeeded:(BOOL)a6;
- (BOOL)_mergeChildrenOfID:(int)a3 referencingBase:(id)a4 error:(id *)a5;
- (BOOL)_migrateBookmarksPlist:(id)a3 syncAnchorPlist:(id)a4;
- (BOOL)_migrateToCurrentSchema;
- (BOOL)_moveBookmark:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5;
- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4;
- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4 detectCycles:(BOOL)a5;
- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4 orderIndex:(unsigned int)a5 detectCycles:(BOOL)a6 incrementGeneration:(BOOL)a7 shouldMerge:(BOOL)a8 generateSyncPositionIfNeeded:(BOOL)a9;
- (BOOL)_needsDeduplicationForBookmarkDAVWithHomeURL:(id)a3;
- (BOOL)_openDatabaseAtPath:(id)a3 checkIntegrity:(BOOL)a4 error:(id *)a5;
- (BOOL)_orderChildrenWithServerIDs:(id)a3 inFolderWithServerID:(id)a4 excludeDeletedBookmarks:(BOOL)a5;
- (BOOL)_performOSVersionUpgradesFromPreviousVersion:(id)a3;
- (BOOL)_performSafariVersionUpgradesFromPreviousVersion:(id)a3;
- (BOOL)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:(id)a3;
- (BOOL)_primaryCollection;
- (BOOL)_rebuildAncestorTable;
- (BOOL)_recalculateCachedChildrenCountAndOrderIndices;
- (BOOL)_reindexBookmarkID:(int)a3 title:(id)a4;
- (BOOL)_reorderBookmark:(id)a3 afterBookmark:(id)a4;
- (BOOL)_reorderBookmark:(id)a3 toIndex:(unsigned int)a4;
- (BOOL)_reorderBookmark:(id)a3 toIndex:(unsigned int)a4 generateSyncPositionIfNeeded:(BOOL)a5;
- (BOOL)_restoreBookmarkBarIfMissing;
- (BOOL)_restoreMissingSpecialBookmarksWithChangeNotification:(BOOL)a3;
- (BOOL)_saveAndMoveBookmark:(id)a3 toFolderID:(int)a4;
- (BOOL)_saveAndMoveBookmark:(id)a3 toFolderID:(int)a4 orderIndex:(unsigned int)a5;
- (BOOL)_saveAndMoveBookmarks:(id)a3 toFolderID:(int)a4;
- (BOOL)_saveBookmark:(id)a3 startReadingListFetcher:(BOOL)a4 forApplyingInMemoryChanges:(BOOL)a5;
- (BOOL)_saveBookmark:(id)a3 withSpecialID:(int)a4 updateGenerationIfNeeded:(BOOL)a5;
- (BOOL)_setSyncData:(id)a3 forBookmark:(id)a4;
- (BOOL)_setSyncKey:(id)a3 forBookmark:(id)a4;
- (BOOL)_setupWithPath:(id)a3 checkIntegrity:(BOOL)a4;
- (BOOL)_setupWithPath:(id)a3 migratingBookmarksPlist:(id)a4 syncAnchorPlist:(id)a5 checkIntegrity:(BOOL)a6;
- (BOOL)_shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:(id)a3;
- (BOOL)_syncAdd:(id)a3 toParent:(int)a4 withOrderIndex:(unsigned int)a5 error:(id *)a6;
- (BOOL)_syncPropertyExistsForKey:(id)a3;
- (BOOL)_syncSetString:(id)a3 forKey:(id)a4 updatedExistingKey:(BOOL *)a5;
- (BOOL)_trackChangesInMemoryIfDatabaseWriteIsNotAllowed;
- (BOOL)_unsafeOpenDatabaseAtPath:(id)a3 checkIntegrity:(BOOL)a4 error:(id *)a5;
- (BOOL)_unsafeOrderChildrenWithServerIDs:(id)a3 inFolderWithServerID:(id)a4 excludeDeletedBookmarks:(BOOL)a5;
- (BOOL)_updateBookmarks:(id)a3 inFolderWithID:(int)a4;
- (BOOL)_updateCachedChildCountForParentID:(int)a3 inDirection:(int)a4;
- (BOOL)_updateDatabaseIfNewerOSVersionWasLaunched;
- (BOOL)_updateDatabaseIfNewerSafariVersionWasLaunched;
- (BOOL)_updateDatabaseIfNewerVersion:(id)a3 wasLaunchedForSyncStringKey:(id)a4 upgradeSelector:(SEL)a5 versionType:(id)a6;
- (BOOL)_updateDatabaseOutsideSafariProcessIfNewerSafariVersionWasLaunched;
- (BOOL)_updateHiddenAncestorCountForBookmarksUnderFolderID:(int)a3 addingOffset:(int)a4;
- (BOOL)_usesCloudKit;
- (BOOL)_verifyAllTablesExist:(int *)a3;
- (BOOL)applyInMemoryChangesToDatabase;
- (BOOL)beginSyncTransaction;
- (BOOL)bookmarkContainsLeafBookmark:(id)a3;
- (BOOL)bookmarkIsFavoritesFolder:(id)a3;
- (BOOL)bookmarkIsFrequentlyVisitedSite:(id)a3;
- (BOOL)bookmarkIsInFavoritesFolder:(id)a3;
- (BOOL)bookmarkRequiresParent:(id)a3 specialID:(int)a4;
- (BOOL)cleanUpReadingListArchives;
- (BOOL)clearAllReadingListArchives;
- (BOOL)clearAllSyncData;
- (BOOL)clearChangesDuringOrBeforeLocalRecordGeneration:(int64_t)a3;
- (BOOL)clearChangesForBookmark:(id)a3;
- (BOOL)clearChangesForChangeRecords:(id)a3 lastSyncedRecordGeneration:(int64_t)a4;
- (BOOL)clearFrequentlyVisitedSitesFolder;
- (BOOL)clearReadingListArchiveWithUUID:(id)a3;
- (BOOL)clearSyncDataAfterICloudKeychainReset;
- (BOOL)containsOnlyStockBookmarks;
- (BOOL)deduplicateBookmarks;
- (BOOL)deduplicateBookmarksWithRootFolder:(int)a3 depth:(unint64_t)a4;
- (BOOL)deleteAllFavoriteIcons;
- (BOOL)deleteBookmark:(id)a3;
- (BOOL)deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4;
- (BOOL)deleteBookmark:(id)a3 postChangeNotification:(BOOL)a4;
- (BOOL)deleteBookmarks:(id)a3 postChangeNotification:(BOOL)a4;
- (BOOL)fixCachedNumberOfChildrenIfNeeded;
- (BOOL)getBookmarkType:(BOOL *)a3 andSubtype:(int64_t *)a4 forBookmarkWithID:(int)a5;
- (BOOL)hasInMemoryChanges;
- (BOOL)incrementalVacuumIfNeeded;
- (BOOL)isEmpty;
- (BOOL)isMerging;
- (BOOL)isTransactionCurrentlyActive;
- (BOOL)maintainsSyncMetadata;
- (BOOL)markAllFavoritesAsNeedingIcons;
- (BOOL)markArchivedReadingListItemsAsNonRecoverable;
- (BOOL)markAttributesAsModified:(unint64_t)a3 forBookmark:(id)a4;
- (BOOL)markWebContentFilterAllowsAllReadingListItems;
- (BOOL)mergeWithBookmarksDictionary:(id)a3 clearHidden:(BOOL)a4 clearSyncData:(BOOL)a5 error:(id *)a6;
- (BOOL)mergeWithBookmarksDictionary:(id)a3 clearHidden:(BOOL)a4 error:(id *)a5;
- (BOOL)migrateReadingListIconsFromDatabaseToBookmarkImagesDirectory;
- (BOOL)moveBookmark:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5;
- (BOOL)moveBookmark:(id)a3 toFolderWithID:(int)a4;
- (BOOL)moveBookmark:(id)a3 toFolderWithID:(int)a4 orderIndex:(unsigned int)a5;
- (BOOL)performDatabaseUpdatesWithTransaction:(id)a3 applyInMemoryChanges:(BOOL)a4 secureDelete:(BOOL)a5;
- (BOOL)performDatabaseUpdatesWithTransaction:(id)a3 secureDelete:(BOOL)a4;
- (BOOL)removeAllSyncDataForKeyWithPrefix:(id)a3;
- (BOOL)removePresenceForParticipant:(id)a3 inTabGroupWithServerID:(id)a4;
- (BOOL)removeUnusedPresenceRecords;
- (BOOL)reorderBookmark:(id)a3 toIndex:(unsigned int)a4;
- (BOOL)reorderList:(id)a3 moveBookmarkAtIndex:(unsigned int)a4 toIndex:(unsigned int)a5;
- (BOOL)rollOutLastReadingListItem;
- (BOOL)saveBookmark:(id)a3;
- (BOOL)saveBookmark:(id)a3 incrementGenerations:(BOOL)a4;
- (BOOL)saveBookmark:(id)a3 startReadingListFetcher:(BOOL)a4;
- (BOOL)saveBookmarks:(id)a3 postNotification:(BOOL)a4;
- (BOOL)saveDatabaseSyncData:(id)a3;
- (BOOL)setHasSharedTabGroups;
- (BOOL)setLocalMigrationState:(int64_t)a3 generateDeviceIdentifierIfNeeded:(BOOL)a4;
- (BOOL)setPresenceInTabWithServerID:(id)a3 tabGroupWithServerID:(id)a4 forParticipant:(id)a5;
- (BOOL)setServerID:(id)a3 forBookmark:(id)a4;
- (BOOL)setSyncData:(id)a3 forKey:(id)a4;
- (BOOL)shouldFetchIconForBookmark:(id)a3;
- (BOOL)syncSetString:(id)a3 forKey:(id)a4;
- (BOOL)truncateWAL;
- (BOOL)updateAccountHash:(id)a3;
- (BOOL)updateBookmarkSyncPositionIfNeeded:(id)a3;
- (BOOL)updateBookmarks:(id)a3 inFolderWithID:(int)a4 secureDelete:(BOOL)a5;
- (BOOL)updateDatabaseSyncDataUsingBlock:(id)a3;
- (BOOL)updateReadingListWebFilterStatusForUnsetItemsOnly:(BOOL)a3;
- (BOOL)updateSyncDataForBookmark:(id)a3 usingBlock:(id)a4;
- (BOOL)updateSyncDataForBookmarkWithRecordName:(id)a3 excludeDeletedBookmarks:(BOOL)a4 usingBlock:(id)a5;
- (BOOL)userHasSharedTabGroups;
- (BOOL)vacuum;
- (NSArray)changeList;
- (NSArray)purgeableReadingListItems;
- (NSData)accountHash;
- (NSData)deprecatedUsernameAccountHash;
- (NSNumber)frequentlyVisitedSitesFolderBookmarkID;
- (WBBookmarkDatabaseSyncData)databaseSyncData;
- (WBCollectionConfiguration)configuration;
- (WebBookmark)bookmarksBarBookmark;
- (WebBookmark)favoritesFolder;
- (WebBookmark)frequentlyVisitedSitesFolder;
- (WebBookmark)readingListFolder;
- (WebBookmark)rootBookmark;
- (WebBookmark)webFilterAllowedSitesFolder;
- (WebBookmarkCollection)initWithConfiguration:(id)a3;
- (WebBookmarkCollection)initWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4;
- (WebBookmarkCollection)initWithPath:(id)a3 migratingBookmarksPlist:(id)a4 syncAnchorPlist:(id)a5;
- (WebBookmarkList)bookmarksBarList;
- (WebBookmarkList)bookmarksNeedingIcons;
- (WebBookmarkList)favoritesFolderList;
- (WebBookmarkList)frequentlyVisitedSitesList;
- (WebBookmarkList)rollingListOfArchivedReadingListItems;
- (WebBookmarkList)rootList;
- (WebBookmarkList)webFilterAllowedSites;
- (id).cxx_construct;
- (id)_applyInMemoryChanges:(id)a3 postChangeNotification:(BOOL)a4;
- (id)_bookmarkDictionaryForSqliteRow:(sqlite3_stmt *)a3 recursive:(BOOL)a4 error:(id *)a5;
- (id)_bookmarkUUIDsInFolderWithID:(int)a3;
- (id)_bookmarksFromStatementSelectingIDs:(const char *)a3 withQuery:(id)a4;
- (id)_databaseTitleForSpecialID:(int)a3;
- (id)_descendantIDsOfBookmarkFolderID:(int)a3;
- (id)_errorForMostRecentSQLiteError;
- (id)_errorForMostRecentSQLiteErrorWithErrorCode:(int64_t)a3;
- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 includingHiddenBookmarks:(BOOL)a4;
- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 includingInMemoryChanges:(BOOL)a4;
- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 options:(unint64_t)a4 offset:(int)a5 limit:(int)a6;
- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 options:(unint64_t)a4 offset:(int)a5 limit:(int)a6 includingInMemoryChanges:(BOOL)a7;
- (id)_fetchBookmarkIDsInFolder:(int)a3 onlyFolders:(BOOL)a4 includingHiddenBookmarks:(BOOL)a5;
- (id)_firstBookmarkWithURLMatchingString:(id)a3 prefixMatch:(BOOL)a4 inParent:(int)a5;
- (id)_firstOrLastServerIDInFolderWithServerID:(id)a3 isFirst:(BOOL)a4;
- (id)_firstServerIDInFolderWithServerID:(id)a3;
- (id)_folderContentsDidChangeNotificationName;
- (id)_generateNewServerIDForBookmark:(id)a3;
- (id)_generateSyncPositionForOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4 direction:(int64_t)a5;
- (id)_inMemoryChangeSet;
- (id)_lastServerIDInFolderWithServerID:(id)a3;
- (id)_mergeCandidateBookmarkWithTitle:(id)a3 address:(id)a4 parent:(int)a5 mergeMode:(int64_t)a6;
- (id)_mergeCandidateFolderWithTitle:(id)a3 parent:(int)a4 mergeMode:(int64_t)a5;
- (id)_orderedWhereClauseForArchiveMode:(int64_t)a3;
- (id)_orderedWhereClauseForArchiveMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4;
- (id)_parentIdentifiersOfBookmarksNeedingIcons;
- (id)_positionAfterBookmark:(id)a3;
- (id)_positionAfterOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4;
- (id)_positionBeforeBookmark:(id)a3;
- (id)_positionBeforeOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4;
- (id)_primaryRecordZoneID;
- (id)_readingListItemsWhere:(id)a3 filteredBy:(id)a4 withInMemoryFilter:(id)a5;
- (id)_rootFolderHiddenChildrenClause;
- (id)_rootServerIDForRecordZoneID:(id)a3;
- (id)_safariFetcherServerProxy;
- (id)_serverIDAfterServerID:(id)a3;
- (id)_serverIDAtOrderIndex:(unsigned int)a3 inFolderWithServerID:(id)a4;
- (id)_serverIDBeforeServerID:(id)a3;
- (id)_serverIDForBookmarkID:(int)a3 generateIfNeeded:(BOOL)a4;
- (id)_serverIDOfSiblingBookmarkWithServerID:(id)a3 immediatelyBeforeOrAfter:(BOOL)a4;
- (id)_syncDataBlobForBookmarkServerID:(id)a3;
- (id)_syncDataForBookmarkID:(int)a3;
- (id)_syncDataForBookmarkServerID:(id)a3;
- (id)_syncKeysForServerIDs:(id)a3;
- (id)_tableExpressionForArchiveMode:(int64_t)a3;
- (id)activeParticipantsInTabGroupWithServerID:(id)a3;
- (id)activeParticipantsInTabWithServerID:(id)a3;
- (id)allSyncDataForKeysWithPrefix:(id)a3;
- (id)allSyncingAttributesForBookmark:(id)a3;
- (id)applyInMemoryChanges:(id)a3;
- (id)bookmarkAtPath:(id)a3;
- (id)bookmarkWithID:(int)a3;
- (id)bookmarkWithID:(int)a3 includingInMemoryChanges:(BOOL)a4;
- (id)bookmarkWithServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4;
- (id)bookmarkWithSpecialID:(int)a3;
- (id)bookmarkWithUUID:(id)a3;
- (id)bookmarksDictionary;
- (id)bookmarksMatchingString:(id)a3;
- (id)bookmarksWithSubtype:(int64_t)a3;
- (id)currentDeviceIdentifier;
- (id)currentTabServerIDPresenceForParticipant:(id)a3 getTabGroupServerID:(id *)a4;
- (id)currentTabServerIDPresenceForParticipant:(id)a3 inTabGroupWithServerID:(id)a4;
- (id)databaseHealthInformation;
- (id)descendantsOfBookmarkFolder:(id)a3;
- (id)fastFetchBookmarksInBookmarkList:(id)a3;
- (id)firstReadingListBookmarkNeedingArchiveInMode:(int64_t)a3;
- (id)firstReadingListBookmarkNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4;
- (id)firstReadingListBookmarkWithURLMatchingString:(id)a3 prefixMatch:(BOOL)a4;
- (id)generateSyncPositionForBookmark:(id)a3;
- (id)leafChildCountForFoldersInFolderWithID:(int)a3;
- (id)listWithID:(int)a3;
- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4;
- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4 includeHidden:(BOOL)a5;
- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4 includeHidden:(BOOL)a5 includeDescendantsAsChildren:(BOOL)a6 filteredUsingString:(id)a7;
- (id)listWithSpecialID:(int)a3;
- (id)modifiedSyncingAttributesForBookmark:(id)a3;
- (id)nextChangeAfterLocalRecordGeneration:(int64_t)a3;
- (id)presenceTabUUIDForParticipant:(id)a3 inTabGroupWithServerID:(id)a4;
- (id)readingListBookmarksMatchingString:(id)a3 maxResults:(unsigned int)a4 onlyArchivedBookmarks:(BOOL)a5;
- (id)readingListBookmarksNeedingArchiveInMode:(int64_t)a3;
- (id)readingListBookmarksNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4;
- (id)readingListWithUnreadOnly:(BOOL)a3;
- (id)readingListWithUnreadOnly:(BOOL)a3 filteredUsingString:(id)a4;
- (id)serverIDForBookmarkID:(int)a3;
- (id)serverIDsInFolderWithServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4;
- (id)subfoldersOfID:(int)a3;
- (id)syncDataForBookmark:(id)a3;
- (id)syncDataForBookmarkID:(int)a3;
- (id)syncDataForKey:(id)a3;
- (id)syncStringForKey:(id)a3;
- (id)syncableBookmarksIDsInFolderWithBookmarkID:(int)a3;
- (id)validBookmarkUUIDsFromUUIDs:(id)a3;
- (int)_executeSQL:(id)a3;
- (int)_executeSQLWithCString:(const char *)a3;
- (int)_favoritesFolderIdentifier;
- (int)_finalizeStatementIfNotNull:(sqlite3_stmt *)a3;
- (int)_intFromExecutingSQL:(id)a3;
- (int)_specialIDForBookmarkBeingSaved:(id)a3;
- (int)_specialIDForBookmarkTitle:(id)a3;
- (int)_sqliteStatementWithQuery:(id)a3 runInBlock:(id)a4;
- (int)bookmarkIDForServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4;
- (int)bookmarkIDWithSpecialID:(int)a3;
- (int)bookmarkIdentifierOfAncestorWithAnySubtypeInSubtypes:(id)a3 forBookmark:(id)a4;
- (int)bookmarkIdentifierOfAncestorWithSubtype:(int64_t)a3 forBookmark:(id)a4;
- (int)bookmarkIdentifierOfFolderAncestorWithSubtype:(int64_t)a3 forBookmark:(id)a4;
- (int)identifierOfBookmarkWithUUID:(id)a3;
- (int)parentIdentifierOfBookmarkWithID:(int)a3;
- (int)readingListFolderBookmarkID;
- (int)webFilterAllowedSitesFolderBookmarkID;
- (int64_t)_mergeBookmarkIntoPersistedBookmark:(id)a3 forAttributes:(unint64_t)a4;
- (int64_t)_mergeMode;
- (int64_t)_syncType;
- (int64_t)_userVersion;
- (int64_t)currentRecordGeneration;
- (int64_t)firstSkippedProfileDeviceGeneration;
- (int64_t)firstSkippedProfileGeneration;
- (int64_t)lastSyncedRecordGeneration;
- (int64_t)localMigrationState;
- (int64_t)nextDatabaseSyncChangeID;
- (int64_t)subtypeOfBookmarkWithID:(int)a3;
- (int64_t)subtypeOfBookmarkWithServerID:(id)a3;
- (sqlite3_stmt)_prefixSearch:(id)a3 usingColumns:(const char *)a4 maxCount:(unsigned int)a5;
- (sqlite3_stmt)_selectBookmarksWhere:(id)a3;
- (sqlite3_stmt)_selectBookmarksWhere:(id)a3 returnType:(int64_t)a4;
- (sqlite3_stmt)_sqliteStatementWithQuery:(id)a3;
- (unint64_t)countReadingListBookmarksNeedingArchiveInMode:(int64_t)a3;
- (unint64_t)countReadingListBookmarksNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4;
- (unint64_t)generation;
- (unint64_t)indexOfReadingListBookmark:(id)a3 countingOnlyUnread:(BOOL)a4;
- (unint64_t)leafChildCountForBookmarksInFolderWithID:(int)a3;
- (unint64_t)modifiedAttributesOfBookmark:(id)a3;
- (unint64_t)purge:(unint64_t)a3;
- (unint64_t)purgeableSpace;
- (unint64_t)rollingReadingListMaximumCount;
- (unsigned)_orderIndexForBookmarkInsertedIntoParent:(int)a3 insertAtBeginning:(BOOL)a4;
- (unsigned)orderIndexOfBookmark:(id)a3;
- (unsigned)orderIndexOfBookmark:(id)a3 withSyncPosition:(id)a4 inFolderWithID:(int)a5;
- (void)_addBookmarksForReadingListMatchStatement:(id)a3 normalizedQuery:(id)a4 toArray:(id)a5 maxResults:(int)a6;
- (void)_appendDuplicateBookmarkGroupsInBookmarks:(id)a3 toGroups:(id)a4 considerBookmarksWithSyncDataAsUnique:(BOOL)a5 davHomePath:(id)a6;
- (void)_applyInMemoryChange:(id)a3 fromChangeSet:(id)a4 updatedBookmarks:(id)a5;
- (void)_checkDatabaseIntegrity;
- (void)_clearAllSyncData;
- (void)_clearAllSyncKeys;
- (void)_clearAllTombstones;
- (void)_clearAndCreateAncestorTable;
- (void)_clearAndCreateBookmarksTables;
- (void)_clearAndCreateBookmarksTitleWordTable;
- (void)_clearCachedFavoritesFolderIdentifier;
- (void)_collectChangesOfType:(int)a3 withClause:(id)a4 intoArray:(id)a5;
- (void)_createFreshDatabase;
- (void)_createInMemoryChangeSet;
- (void)_createRecoveredBookmarksFolderIfNeeded;
- (void)_createSchema;
- (void)_cullReadingListBookmarksList:(id)a3 toSize:(unint64_t)a4;
- (void)_deleteBookmarkInMemory:(id)a3;
- (void)_deleteIconForBookmark:(id)a3;
- (void)_enableAutoVacuum;
- (void)_enableForeignKeys;
- (void)_enumerateBookmarksForMatchStatement:(id)a3 normalizedQuery:(id)a4 usingBlock:(id)a5;
- (void)_enumerateBookmarksMatchingString:(id)a3 statementSuffix:(id)a4 usingBlock:(id)a5;
- (void)_enumerateContentsOfBookmarkFolder:(int)a3 includingSubfolders:(BOOL)a4 usingBlock:(id)a5;
- (void)_incrementGeneration;
- (void)_metaDataFileChanged:(id)a3;
- (void)_migrateSchemaVersion0ToVersion1;
- (void)_migrateSchemaVersion10ToVersion11;
- (void)_migrateSchemaVersion11And12And13ToVersion14;
- (void)_migrateSchemaVersion14ToVersion15;
- (void)_migrateSchemaVersion15ToVersion16;
- (void)_migrateSchemaVersion16AndVersion17AndVersion18ToVersion19;
- (void)_migrateSchemaVersion19And20ToVersion21;
- (void)_migrateSchemaVersion1And2ToVersion3;
- (void)_migrateSchemaVersion21ToVersion22;
- (void)_migrateSchemaVersion22ToVersion23;
- (void)_migrateSchemaVersion23ToVersion24;
- (void)_migrateSchemaVersion24ToVersion25;
- (void)_migrateSchemaVersion25ToVersion26;
- (void)_migrateSchemaVersion26ToVersion27;
- (void)_migrateSchemaVersion27ToVersion28;
- (void)_migrateSchemaVersion28ToVersion29;
- (void)_migrateSchemaVersion29ToVersion30;
- (void)_migrateSchemaVersion30ToVersion31;
- (void)_migrateSchemaVersion31ToVersion32;
- (void)_migrateSchemaVersion32ToVersion33;
- (void)_migrateSchemaVersion33ToVersion34;
- (void)_migrateSchemaVersion34ToVersion35;
- (void)_migrateSchemaVersion35ToVersion36;
- (void)_migrateSchemaVersion36ToVersion37;
- (void)_migrateSchemaVersion37ToVersion38;
- (void)_migrateSchemaVersion38ToVersion39;
- (void)_migrateSchemaVersion39Or40ToVersion41;
- (void)_migrateSchemaVersion3ToVersion4;
- (void)_migrateSchemaVersion41ToVersion42;
- (void)_migrateSchemaVersion42ToVersion43;
- (void)_migrateSchemaVersion43ToVersion44;
- (void)_migrateSchemaVersion44ToVersion45;
- (void)_migrateSchemaVersion45ToVersion46;
- (void)_migrateSchemaVersion46ToVersion47;
- (void)_migrateSchemaVersion47ToVersion48;
- (void)_migrateSchemaVersion48ToVersion49;
- (void)_migrateSchemaVersion49ToVersion50;
- (void)_migrateSchemaVersion4ToVersion5;
- (void)_migrateSchemaVersion50ToVersion51;
- (void)_migrateSchemaVersion51ToVersion52;
- (void)_migrateSchemaVersion52ToVersion53;
- (void)_migrateSchemaVersion53ToVersion54;
- (void)_migrateSchemaVersion54ToVersion55;
- (void)_migrateSchemaVersion5ToVersion6;
- (void)_migrateSchemaVersion6ToVersion7;
- (void)_migrateSchemaVersion7ToVersion8;
- (void)_migrateSchemaVersion8ToVersion9;
- (void)_migrateSchemaVersion9ToVersion10;
- (void)_migrateToCurrentSchema;
- (void)_normalizeDatabaseURLs;
- (void)_normalizeSearchString:(__CFString *)a3;
- (void)_postBookmarksChangedSyncNotification;
- (void)_postBookmarksDidReloadNotification;
- (void)_postBookmarksDidReloadNotificationAndStartReadingListFetcherIfChangesWereMade;
- (void)_postBookmarksFolderContentsDidChangeNotification:(int)a3;
- (void)_postBookmarksSpecialFoldersDidChangeNotification;
- (void)_registerForSyncBookmarksFileChangedNotification;
- (void)_rerunMigrationsIfNecessary;
- (void)_restoreOrMergeAllowedSitesFolderAndContentsWithWebFilterAllowedSites:(id)a3 ensureChildCount:(BOOL)a4 postChangeNotification:(BOOL)a5;
- (void)_restoreOrMergeReadingListFolderWithChangeNotification:(BOOL)a3;
- (void)_setMergeMode:(int64_t)a3;
- (void)_setSyncNotificationType:(int64_t)a3;
- (void)_setupInMemoryChangeSet;
- (void)_simulateCrashWithDescription:(id)a3;
- (void)_startReadingListFetcher;
- (void)_test_preventPeriodicallyApplyingInMemoryChangesToDatabase;
- (void)_updateSyncNotificationType;
- (void)addBookmarkInMemory:(id)a3 toFolderWithID:(int)a4;
- (void)cleanUpReadingListArchives;
- (void)clearAllReadingListArchives;
- (void)clearCarrierBookmarks;
- (void)clearFirstSkippedProfileDeviceGeneration;
- (void)clearFirstSkippedProfileGeneration;
- (void)commitSyncTransaction;
- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4;
- (void)dealloc;
- (void)deleteArchiveForReadingListBookmarkWithID:(int)a3;
- (void)deleteBookmarkInMemory:(id)a3;
- (void)deleteBookmarksInMemory:(id)a3 inFolder:(int)a4;
- (void)deleteFrequentlyVisitedSitesFolder;
- (void)didSkipProfileDeviceWithGeneration:(int64_t)a3;
- (void)didSkipProfileWithGeneration:(int64_t)a3;
- (void)enumerateBookmarks:(BOOL)a3 andReadingListItems:(BOOL)a4 matchingString:(id)a5 usingBlock:(id)a6;
- (void)enumerateDescendantsOfBookmark:(id)a3 usingBlock:(id)a4;
- (void)enumerateDescendantsOfBookmarkID:(int)a3 usingBlock:(id)a4;
- (void)fixRecoveredBookmarksIfNeeded;
- (void)localeSettingsChanged;
- (void)logRegulatoryBookmarksRead;
- (void)markChildrenInFolderAsRead:(id)a3;
- (void)markWebContentFilterAllowsAllReadingListItems;
- (void)modifyBookmarkInMemory:(id)a3;
- (void)moveBookmarkInMemory:(id)a3 toFolderWithID:(int)a4;
- (void)persistChangesWithCompletion:(id)a3;
- (void)removePersistedInMemoryBookmarkChangesFile;
- (void)reorderBookmarkInMemory:(id)a3 afterBookmark:(id)a4;
- (void)replaceBookmarksInMemory:(id)a3 inFolderWithID:(int)a4;
- (void)resetDeviceIdentifier;
- (void)restoreOrMergeAllowedSitesFolderAndContentsWithChangeNotification:(BOOL)a3;
- (void)rollOutReadingListItemIfNeededToMakeRoomForOneNewItem;
- (void)rollbackSyncTransaction;
- (void)saveAndMoveBookmark:(id)a3 toFolderID:(int)a4;
- (void)saveArchiveForReadingListBookmarkWithID:(int)a3;
- (void)saveArchivesForReadingListBookmarks:(id)a3;
- (void)saveIconWithData:(id)a3 urlString:(id)a4 forBookmark:(id)a5;
- (void)saveMinimumAPISyncVersionOfDescendantItemsForItem:(id)a3 includingAncestorItem:(BOOL)a4;
- (void)setFavoritesFolder:(id)a3 localOnly:(BOOL)a4;
- (void)setFavoritesFolderIdentifier:(int)a3 postChangeNotification:(BOOL)a4;
- (void)setLastSyncedRecordGeneration:(int64_t)a3;
- (void)test_restoreMissingSpecialBookmarks;
- (void)updateSelectedFavoritesFolderWithBookmarkID:(int)a3 wasFavoritesFolder:(BOOL)a4 isFavoritesFolder:(BOOL)a5;
@end

@implementation WebBookmarkCollection

- (id)currentDeviceIdentifier
{
  if ([(WBCollectionConfiguration *)self->_configuration isInMemoryDatabase])
  {
    v3 = [(WBCollectionConfiguration *)self->_configuration identifier];
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), 1);
    v5 = [v4 UUID];
    v3 = [v5 UUIDString];
  }
  return v3;
}

+ (id)deviceIdentifierForCloudKitWithCollectionType:(int64_t)a3 generateIfNeeded:(BOOL)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke;
  v6[3] = &unk_2643DAAB0;
  BOOL v7 = a4;
  v6[5] = a3;
  v6[6] = a1;
  v6[4] = &v8;
  performBlockExclusively(v6);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke(uint64_t a1)
{
  v2 = collectionTypeToDeviceIdentifierDictionary();
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [(WebBookmarkDeviceIdentifier *)v4 UUID];
    if (v6)
    {
LABEL_7:

LABEL_8:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
      goto LABEL_11;
    }
    if (!*(unsigned char *)(a1 + 56)
      && ![(WebBookmarkDeviceIdentifier *)v5 encounteredErrorWhileObtainingUUID])
    {
      goto LABEL_8;
    }
  }
  v6 = [(id)objc_opt_class() safariDirectoryPath];
  if (v6)
  {
    BOOL v7 = NSURL;
    uint64_t v8 = [*(id *)(a1 + 48) _cloudKitSyncMetadataFileNameWithCollectionType:*(void *)(a1 + 40)];
    v9 = [v6 stringByAppendingPathComponent:v8];
    uint64_t v10 = [v7 fileURLWithPath:v9];

    [(WebBookmarkDeviceIdentifier *)v5 stopObservingChanges];
    v11 = [[WebBookmarkDeviceIdentifier alloc] initWithPlistURL:v10 readOnly:*(unsigned char *)(a1 + 56) == 0];

    [v2 setObject:v11 forKeyedSubscript:v3];
    v5 = v11;
    goto LABEL_7;
  }
  v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke_cold_1();
  }
LABEL_11:
}

- (WBCollectionConfiguration)configuration
{
  return self->_configuration;
}

- (sqlite3_stmt)_sqliteStatementWithQuery:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  db = self->_db;
  id v6 = v4;
  if (sqlite3_prepare_v2(db, (const char *)[v6 UTF8String], -1, &ppStmt, 0)) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = ppStmt;
  }

  return v7;
}

- (BOOL)applyInMemoryChangesToDatabase
{
  if (![(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])return 1; {
  v3 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
  }
  id v4 = [(WebBookmarkCollection *)self _applyInMemoryChanges:v3 postChangeNotification:1];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_inMemoryChangeSet
{
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    v2 = [(id)objc_opt_class() inMemoryChangeSet];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_trackChangesInMemoryIfDatabaseWriteIsNotAllowed
{
  if (-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::onceToken != -1) {
    dispatch_once(&-[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::onceToken, &__block_literal_global_1013);
  }
  return -[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::trackChangesInMemory;
}

+ (WebBookmarkChangeSet)inMemoryChangeSet
{
  return (WebBookmarkChangeSet *)(id)inMemoryChangeSet;
}

- (id)_applyInMemoryChanges:(id)a3 postChangeNotification:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [v6 changes];
  if (![v8 count])
  {
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  char v9 = [(id)objc_opt_class() isLockedSync];
  if (v9 & 1) != 0 || ([(id)objc_opt_class() lockSync])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          [(WebBookmarkCollection *)self _applyInMemoryChange:*(void *)(*((void *)&v18 + 1) + 8 * i) fromChangeSet:v6 updatedBookmarks:v7];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v6 removeAllChanges];
    if ((v9 & 1) == 0) {
      [(id)objc_opt_class() unlockSync];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__WebBookmarkCollection__applyInMemoryChanges_postChangeNotification___block_invoke;
    v16[3] = &unk_2643DA810;
    BOOL v17 = a4;
    v16[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v16);
    goto LABEL_14;
  }
  v14 = v7;
  BOOL v7 = 0;
LABEL_15:

  return v7;
}

+ (id)_cloudKitSyncMetadataFileNameWithCollectionType:(int64_t)a3
{
  v3 = @"SafariTabsSyncMetadata.plist";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"BookmarksSyncMetadata.plist";
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  return self;
}

uint64_t __41__WebBookmarkCollection_Sync__unlockSync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unlockSync];
}

- (BOOL)_deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4 insertTombstoneBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v9 = (unsigned int (**)(id, id))a5;
  if (v6 && ([v8 isSyncable] & 1) != 0)
  {
    BOOL v10 = 0;
    int v11 = 1;
  }
  else
  {
    uint64_t v12 = [v8 serverID];
    BOOL v10 = [(WebBookmarkCollection *)self _isTombstoneWithServerID:v12];

    int v11 = 0;
  }
  if ([v8 identifier])
  {
    id v13 = [v8 serverID];
    int64_t v14 = [(WebBookmarkCollection *)self _syncType];
    if (v14 != 2)
    {
      if (v11)
      {
        int v15 = [v8 isFolder];
        if (v14 == 1) {
          int v16 = v15;
        }
        else {
          int v16 = 0;
        }
        if (v16 == 1)
        {
          if (![(WebBookmarkCollection *)self _insertTombsonesRecursivelyForRootFolder:v8 insertTombstoneBlock:v9])goto LABEL_22; {
        }
          }
        else if (v13 && !v9[2](v9, v8))
        {
          goto LABEL_22;
        }
      }
      if (([v8 isHidden] & 1) != 0
        || -[WebBookmarkCollection _updateCachedChildCountForParentID:inDirection:](self, "_updateCachedChildCountForParentID:inDirection:", [v8 parentID], 0xFFFFFFFFLL))
      {
        uint64_t v18 = [(WebBookmarkCollection *)self orderIndexOfBookmark:v8];
        if (-[WebBookmarkCollection _deleteRecursively:descendantsOnly:](self, "_deleteRecursively:descendantsOnly:", [v8 identifier], 0))
        {
          long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"UPDATE bookmarks SET order_index = (order_index - 1) WHERE parent = %d AND order_index > %d", objc_msgSend(v8, "parentID"), v18);
          if ([(WebBookmarkCollection *)self _executeSQL:v19])
          {
            BOOL v17 = 0;
          }
          else
          {
            if ([(WBCollectionConfiguration *)self->_configuration collectionType] != 1 || !v10) {
              self->_dirty = 1;
            }
            v22 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109376;
              int v24 = [v8 identifier];
              __int16 v25 = 1024;
              int v26 = [v8 parentID];
              _os_log_impl(&dword_21C043000, v22, OS_LOG_TYPE_INFO, "Deleted bookmark with ID %d from parent with ID %d", buf, 0xEu);
            }

            BOOL v17 = [(WebBookmarkCollection *)self _incrementGeneration];
          }

          goto LABEL_23;
        }
      }
    }
LABEL_22:
    BOOL v17 = 0;
LABEL_23:

    goto LABEL_24;
  }
  BOOL v17 = 0;
LABEL_24:

  return v17;
}

- (BOOL)_incrementRecordGeneration
{
  return WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"UPDATE sync_properties SET value = value + 1 WHERE key = '_dav_generation'", v2) == 0;
}

- (BOOL)_updateCachedChildCountForParentID:(int)a3 inDirection:(int)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a4 < 0) {
    objc_msgSend(NSString, "stringWithFormat:", @"UPDATE bookmarks SET num_children = num_children - 1 WHERE id = %d", *(void *)&a3);
  }
  else {
  BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"UPDATE bookmarks SET num_children = num_children + 1 WHERE id = %d", *(void *)&a3);
  }
  int v8 = [(WebBookmarkCollection *)self _executeSQL:v7];

  if (v8)
  {
    char v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      int v12 = a3;
      __int16 v13 = 1024;
      int v14 = a4;
      __int16 v15 = 1024;
      int v16 = v8;
      _os_log_error_impl(&dword_21C043000, v9, OS_LOG_TYPE_ERROR, "Could not update cached child count for parent ID %d in direction: %d, error: %d", buf, 0x14u);
    }
  }
  return v8 == 0;
}

- (int)_executeSQL:(id)a3
{
  return WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)a3, (NSString *)a3);
}

- (BOOL)_saveBookmark:(id)a3 withSpecialID:(int)a4 updateGenerationIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (![(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    int64_t v9 = 2;
    goto LABEL_8;
  }
  int64_t v9 = [(WebBookmarkCollection *)self _mergeBookmarkIntoPersistedBookmark:v8 forAttributes:-69];
  if (![v8 isSyncable]
    || ([v8 syncState],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 integerValue],
        v10,
        v11 != 1))
  {
LABEL_8:
    if (([v8 isFolder] & 1) == 0)
    {
      __int16 v13 = [v8 address];

      if (!v13)
      {
        int v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:]();
        }
      }
    }
    uint64_t v15 = [v8 parentID];
    int v16 = [(WebBookmarkCollection *)self bookmarkWithID:v15];
    if (v6)
    {
      uint64_t v17 = [(WebBookmarkCollection *)self _databaseTitleForSpecialID:v6];
      [v8 setTitle:v17];

      if ((v6 - 3) <= 3) {
        [v8 setExtraAttributesValue:MEMORY[0x263EFFA88] forKey:@"com.apple.bookmarks.OmitFromUI"];
      }
    }
    if (([v8 isInserted] & 1) == 0 && objc_msgSend(v8, "isSyncable")) {
      objc_msgSend(v8, "_setSyncable:", -[WebBookmarkCollection _childrenOfParentBookmarkAreUnsyncable:](self, "_childrenOfParentBookmarkAreUnsyncable:", v16) ^ 1);
    }
    if (([v8 isInserted] & 1) == 0)
    {
      BOOL v21 = [(WebBookmarkCollection *)self bookmarkRequiresParent:v8 specialID:v6];
      BOOL v22 = v21;
      if (v21 && (!v16 || ([v16 isFolder] & 1) == 0))
      {
        v37 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          [v8 UUID];
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:]();
        }

        goto LABEL_68;
      }
      uint64_t v23 = [v8 isFolder];
      if ([(WebBookmarkCollection *)self maintainsSyncMetadata]
        && [v8 isSyncable])
      {
        [v8 lockFields];
      }
      int v24 = [v8 title];
      __int16 v25 = [v8 address];
      BYTE2(v66) = v5;
      BYTE1(v66) = v22;
      LOBYTE(v66) = v22;
      BOOL v26 = -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:](self, "_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:", v24, v25, v15, [(WebBookmarkCollection *)self _orderIndexForBookmarkInsertedIntoParent:v15 insertAtBeginning:v23], v23, 0, v8, v66);

      if (!v26)
      {
        if ([(WebBookmarkCollection *)self maintainsSyncMetadata]
          && [v8 isSyncable])
        {
          [v8 unlockFields];
        }
        goto LABEL_68;
      }
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke;
      v70[3] = &unk_2643DAA88;
      BOOL v73 = v5;
      id v71 = v8;
      v72 = self;
      [(WebBookmarkCollection *)self updateSyncDataForBookmark:v71 usingBlock:v70];

      goto LABEL_34;
    }
    if (![(WebBookmarkCollection *)self maintainsSyncMetadata] || v9 != 1 || v5)
    {
      ppStmt = 0;
      uint64_t v18 = &stru_26CC2ED50;
      if (v5)
      {
        int v19 = [v8 needsSyncUpdate];
        long long v20 = @", dav_generation = ?7";
        int v67 = v19;
        if (!v19) {
          long long v20 = &stru_26CC2ED50;
        }
        uint64_t v18 = @", modified_attributes = ?13";
      }
      else
      {
        int v67 = 0;
        long long v20 = &stru_26CC2ED50;
      }
      v38 = [NSString stringWithFormat:@"UPDATE bookmarks SET title = ?1, url = ?2, extra_attributes = ?3, local_attributes = ?11, fetched_icon = ?4, icon = ?5, locally_added = ?10, archive_status = ?8, web_filter_status = ?12, last_selected_child = ?14%@%@ WHERE id = ?6", v20, v18];
      db = self->_db;
      id v40 = v38;
      int v41 = sqlite3_prepare_v2(db, (const char *)[v40 UTF8String], -1, &ppStmt, 0);
      v42 = ppStmt;
      if (v41) {
        goto LABEL_66;
      }
      id v43 = [v8 title];
      sqlite3_bind_text(v42, 1, (const char *)[v43 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v44 = ppStmt;
      id v45 = [v8 address];
      sqlite3_bind_text(v44, 2, (const char *)[v45 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v46 = ppStmt;
      v47 = [v8 extraAttributes];
      LOBYTE(v46) = bindAttributesToSQLStatement(v46, 3, v47);

      v42 = ppStmt;
      if ((v46 & 1) == 0) {
        goto LABEL_66;
      }
      v48 = [v8 localAttributes];
      char v49 = bindAttributesToSQLStatement(v42, 11, v48);

      v42 = ppStmt;
      if (v49)
      {
        sqlite3_bind_int(ppStmt, 4, [v8 fetchedIconData]);
        v50 = ppStmt;
        v51 = [v8 iconData];
        bindNullableDataToSQLStatement(v50, 5, v51);

        sqlite3_bind_int(ppStmt, 6, [v8 identifier]);
        sqlite3_bind_int(ppStmt, 10, [v8 isAddedLocally]);
        sqlite3_bind_int(ppStmt, 8, [v8 archiveStatus]);
        sqlite3_bind_int(ppStmt, 12, [v8 webFilterStatus]);
        if (v67) {
          sqlite3_bind_int64(ppStmt, 7, [(WebBookmarkCollection *)self currentRecordGeneration]);
        }
        if (v5) {
          sqlite3_bind_int64(ppStmt, 13, [v8 modifiedAttributes]);
        }
        int v52 = [v8 lastSelectedChildID];
        if (v52 == 0x7FFFFFFF) {
          sqlite3_bind_null(ppStmt, 14);
        }
        else {
          sqlite3_bind_int(ppStmt, 14, v52);
        }
        if (sqlite3_step(ppStmt) == 101)
        {
          sqlite3_finalize(ppStmt);

          goto LABEL_34;
        }
        [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:ppStmt];
      }
      else
      {
LABEL_66:
        [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:v42];
      }

      goto LABEL_68;
    }
LABEL_34:
    uint64_t v27 = [v8 omitFromUI];
    if (v27 == [v8 isHidden]) {
      goto LABEL_46;
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt, self->_db, "UPDATE bookmarks SET hidden = ? WHERE id = ?");
    sqlite3_bind_int(v75, 1, v27);
    sqlite3_bind_int(v75, 2, [v8 identifier]);
    if (sqlite3_step(v75) == 101)
    {
      uint64_t v28 = v27 ? 0xFFFFFFFFLL : 1;
      if ([(WebBookmarkCollection *)self _updateCachedChildCountForParentID:v15 inDirection:v28])
      {
        [v8 _setHidden:v27];
        if (![v8 isFolder]
          || ((uint64_t v29 = [v8 identifier], v27) ? (v30 = 1) : (v30 = 0xFFFFFFFFLL),
              [(WebBookmarkCollection *)self _updateHiddenAncestorCountForBookmarksUnderFolderID:v29 addingOffset:v30]))
        {
          WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt);
LABEL_46:
          v31 = [v8 extraAttributes];
          v32 = [v31 objectForKey:@"com.apple.ReadingList"];

          if (!v32)
          {
LABEL_73:
            if (!v6
              || -[WebBookmarkCollection _markBookmarkID:withSpecialID:](self, "_markBookmarkID:withSpecialID:", [v8 identifier], v6))
            {
              v56 = [v16 UUID];
              int v57 = [v56 isEqualToString:&stru_26CC2ED50];

              if (!v57) {
                goto LABEL_97;
              }
              v58 = self->_db;
              v59 = NSString;
              v60 = [(id)objc_opt_class() _uniqueExternalUUID];
              [v59 stringWithFormat:@"UPDATE bookmarks SET external_uuid = '%@' WHERE id = %d", v60, v15];
              v61 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
              LODWORD(v58) = WebBookmarks::BookmarkSQLStatement::executeSQL(v58, v61, v62);

              if (!v58)
              {
LABEL_97:
                if ([(WebBookmarkCollection *)self _incrementGeneration])
                {
                  if (v6) {
                    [v8 markSpecial:v6];
                  }
                  if (([v8 isFolder] & 1) != 0
                    || (uint64_t v63 = [v8 identifier],
                        [v8 title],
                        v64 = objc_claimAutoreleasedReturnValue(),
                        LOBYTE(v63) = [(WebBookmarkCollection *)self _reindexBookmarkID:v63 title:v64], v64, (v63 & 1) != 0))
                  {
                    if (![(WebBookmarkCollection *)self maintainsSyncMetadata]
                      || (v68[0] = MEMORY[0x263EF8330],
                          v68[1] = 3221225472,
                          v68[2] = __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke_2,
                          v68[3] = &unk_2643DA9C0,
                          id v69 = v8,
                          BOOL v12 = [(WebBookmarkCollection *)self updateSyncDataForBookmark:v69 usingBlock:v68], v69, v12))
                    {
                      LOBYTE(v12) = 1;
                      self->_dirty = 1;
                    }
                    goto LABEL_86;
                  }
                }
              }
            }
LABEL_85:
            LOBYTE(v12) = 0;
LABEL_86:

            goto LABEL_87;
          }
          WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt, self->_db, "UPDATE bookmarks SET last_modified = ?, read = ? WHERE id = ?");
          v33 = v75;
          id v34 = v32;
          v35 = [v34 objectForKey:@"DateLastViewed"];
          if (v35)
          {
            int v36 = 1;
          }
          else
          {
            uint64_t v53 = [v34 objectForKey:@"DateAdded"];
            if (!v53)
            {
              sqlite3_bind_null(v33, 1);
              v35 = 0;
              sqlite3_bind_int(v33, 2, 0);
LABEL_72:

              sqlite3_bind_int(v75, 3, [v8 identifier]);
              int v55 = sqlite3_step(v75);
              WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt);
              if (v55 != 101) {
                goto LABEL_85;
              }
              goto LABEL_73;
            }
            int v36 = 0;
            v35 = (void *)v53;
          }
          [v35 timeIntervalSince1970];
          sqlite3_bind_double(v33, 1, v54);
          sqlite3_bind_int(v33, 2, v36);
          goto LABEL_72;
        }
      }
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&ppStmt);
LABEL_68:
    LOBYTE(v12) = 0;
LABEL_87:

    goto LABEL_88;
  }
  LOBYTE(v12) = ![v8 isInserted]
             || ([v8 isDeleted] & 1) != 0
             || [(WebBookmarkCollection *)self _deleteBookmark:v8 leaveTombstone:0];
LABEL_88:

  return v12;
}

- (BOOL)_incrementGeneration
{
  if ([(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE generations SET generation = generation + 1"])
  {
    v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[WebBookmarkCollection _incrementGeneration]();
      LOBYTE(v4) = 0;
    }
  }
  else if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    LOBYTE(v4) = [(WebBookmarkCollection *)self _incrementRecordGeneration];
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)bookmarkWithID:(int)a3
{
  BOOL v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"id = %d AND deleted = 0", *(void *)&a3);
  BOOL v5 = [(WebBookmarkCollection *)self _selectBookmarksWhere:v4];
  if (sqlite3_step(v5) == 100)
  {
    uint64_t v6 = [WebBookmark alloc];
    BOOL v7 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    id v8 = [(WebBookmark *)v6 initWithSQLiteStatement:v5 deviceIdentifier:v7 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    sqlite3_finalize(v5);
  }
  else
  {
    [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:v5];
    id v8 = 0;
  }

  return v8;
}

- (id)bookmarkWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WebBookmarkCollection *)self _selectBookmarksWhere:@"external_uuid = ? AND deleted = 0"];
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    BOOL v7 = [WebBookmark alloc];
    id v8 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    int64_t v9 = [(WebBookmark *)v7 initWithSQLiteStatement:v5 deviceIdentifier:v8 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    sqlite3_finalize(v5);
  }
  else
  {
    [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:v5];
    int64_t v9 = 0;
  }

  return v9;
}

- (sqlite3_stmt)_selectBookmarksWhere:(id)a3
{
  return [(WebBookmarkCollection *)self _selectBookmarksWhere:a3 returnType:0];
}

- (BOOL)updateSyncDataForBookmark:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if ([(WebBookmarkCollection *)self maintainsSyncMetadata]
    && ([v6 isSyncable] & 1) != 0)
  {
    id v8 = (void *)MEMORY[0x21D4A0FE0]();
    int64_t v9 = [(WebBookmarkCollection *)self syncDataForBookmark:v6];
    BOOL v10 = v7[2](v7, v9);

    if (v10)
    {
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, self->_db, "UPDATE bookmarks SET sync_data = ? WHERE server_id = ?");
      uint64_t v11 = [v10 encodedBookmarkSyncData];
      bindNullableDataToSQLStatement(v18, 1, v11);
      BOOL v12 = v18;
      id v13 = [v6 serverID];
      sqlite3_bind_text(v12, 2, (const char *)[v13 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      int v14 = sqlite3_step(v18);
      BOOL v15 = v14 == 101;
      if (v14 == 101) {
        [v6 _setSyncData:v11 cachedWBSyncData:v10];
      }

      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)_unsafeOpenDatabaseAtPath:(id)a3 checkIntegrity:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v37[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = [(WebBookmarkCollection *)self _isDatabaseWriteAllowed];
  if (v9) {
    int v10 = 3145730;
  }
  else {
    int v10 = 3145729;
  }
  id v11 = v8;
  p_db = &self->_db;
  int v13 = sqlite3_open_v2((const char *)[v11 UTF8String], &self->_db, v10, 0);
  int v35 = v13;
  if (v13 == 14 && v9)
  {
    int v35 = sqlite3_open_v2((const char *)[v11 UTF8String], &self->_db, v10 | 4, 0);
    BOOL v15 = v35 == 0;
    if (!v35) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v15 = 0;
    if (!v13)
    {
LABEL_9:
      sqlite3_busy_timeout(*p_db, 3000);
      [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA journal_mode = wal"];
      uint64_t v16 = [(WebBookmarkCollection *)self _userVersion];
      if (v16 >= 41) {
        [(WebBookmarkCollection *)self _enableForeignKeys];
      }
      [(WebBookmarkCollection *)self _enableAutoVacuum];
      if ([v11 containsString:@":memory:"]) {
        int v17 = 1;
      }
      else {
        int v17 = [v11 containsString:@"mode=memory"];
      }
      if (v16 == 55) {
        int v19 = 0;
      }
      else {
        int v19 = v17;
      }
      char v20 = v15 | v19;
      if ((v15 | v19) == 1) {
        [(WebBookmarkCollection *)self _createFreshDatabase];
      }
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32, *p_db, "SELECT * FROM bookmarks LIMIT 1");
      if (v34)
      {
        int v21 = sqlite3_step(v33);
        int v35 = v21;
        if (v21 == 100)
        {
          WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v32);
          if ([(WebBookmarkCollection *)self _verifyAllTablesExist:&v35])
          {
            if (v6 && ![(WebBookmarkCollection *)self _checkDatabaseIntegrity])
            {
              if (a5)
              {
                uint64_t v36 = *MEMORY[0x263F08320];
                v37[0] = @"Database failed full integrity check.";
                uint64_t v27 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
                *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.WebBookmarks.SQLiteError" code:11 userInfo:v27];
              }
            }
            else
            {
              BOOL v22 = [(WebBookmarkCollection *)self _migrateToCurrentSchema];
              if (v9 || v22)
              {
                id v23 = objc_alloc_init(MEMORY[0x263F663B8]);
                v30[0] = MEMORY[0x263EF8330];
                v30[1] = 3221225472;
                v30[2] = __72__WebBookmarkCollection__unsafeOpenDatabaseAtPath_checkIntegrity_error___block_invoke;
                v30[3] = &unk_2643DA810;
                BOOL v31 = v9;
                v30[4] = self;
                [v23 setHandler:v30];
                if (v20)
                {
                  char v18 = 1;
LABEL_63:

                  goto LABEL_47;
                }
                if ([(WBCollectionConfiguration *)self->_configuration isReadonly]
                  && [(WebBookmarkCollection *)self _isDatabaseWriteAllowed]
                  && ([(id)objc_opt_class() isLockedSync] & 1) == 0)
                {
                  int v28 = 0;
                  char v18 = 0;
                  if (([(id)objc_opt_class() lockSync] & 1) == 0) {
                    goto LABEL_63;
                  }
                }
                else
                {
                  int v28 = 1;
                }
                if ([(WebBookmarkCollection *)self _updateDatabaseIfNewerSafariVersionWasLaunched]&& [(WebBookmarkCollection *)self _updateDatabaseOutsideSafariProcessIfNewerSafariVersionWasLaunched])
                {
                  BOOL v29 = [(WebBookmarkCollection *)self _updateDatabaseIfNewerOSVersionWasLaunched];
                  if ((v28 | !v29))
                  {
                    char v18 = v29 && v22;
                  }
                  else
                  {
                    [(id)objc_opt_class() unlockSync];
                    char v18 = v22;
                  }
                }
                else
                {
                  char v18 = 0;
                }
                goto LABEL_63;
              }
            }
            goto LABEL_46;
          }
          if (a5)
          {
            if ((v35 - 5) > 1)
            {
              BOOL v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                -[WebBookmarkCollection _unsafeOpenDatabaseAtPath:checkIntegrity:error:]();
              }
              id v24 = [(WebBookmarkCollection *)self _errorForMostRecentSQLiteErrorWithErrorCode:11];
            }
            else
            {
              -[WebBookmarkCollection _errorForMostRecentSQLiteErrorWithErrorCode:](self, "_errorForMostRecentSQLiteErrorWithErrorCode:");
              id v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_42;
          }
        }
        else
        {
          if (a5)
          {
            if (v21 == 101) {
              [(WebBookmarkCollection *)self _errorForMostRecentSQLiteErrorWithErrorCode:11];
            }
            else {
            *a5 = [(WebBookmarkCollection *)self _errorForMostRecentSQLiteError];
            }
          }
          WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v32);
        }
      }
      else if (a5)
      {
        if ((sqlite3_errcode(*p_db) - 5) > 1) {
          [(WebBookmarkCollection *)self _errorForMostRecentSQLiteErrorWithErrorCode:11];
        }
        else {
        id v24 = [(WebBookmarkCollection *)self _errorForMostRecentSQLiteError];
        }
LABEL_42:
        char v18 = 0;
        *a5 = v24;
LABEL_47:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v32);
        goto LABEL_48;
      }
LABEL_46:
      char v18 = 0;
      goto LABEL_47;
    }
  }
  if (a5)
  {
    [(WebBookmarkCollection *)self _errorForMostRecentSQLiteError];
    char v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v18 = 0;
  }
LABEL_48:

  return v18;
}

- (BOOL)_isDatabaseWriteAllowed
{
  if ([(WBCollectionConfiguration *)self->_configuration isReadonly])
  {
    BOOL v3 = [(WBCollectionConfiguration *)self->_configuration createIfNeeded];
    if (v3) {
      LOBYTE(v3) = !self->_setupFinished;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (int)_executeSQLWithCString:(const char *)a3
{
  return WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)a3, a3);
}

- (id)syncStringForKey:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "SELECT value FROM sync_properties WHERE key = ?");
  if (v9
    && (sqlite3_bind_text(v8, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v8) == 100))
  {
    BOOL v5 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v8, 0));
  }
  else
  {
    BOOL v5 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (BOOL)_updateDatabaseIfNewerVersion:(id)a3 wasLaunchedForSyncStringKey:(id)a4 upgradeSelector:(SEL)a5 versionType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserSharedDefaults");
  int v14 = [v13 stringForKey:@"DebugForceMigrationFromSafariVersionKey"];
  BOOL v15 = v14;
  if (v14)
  {
    uint64_t v16 = v14;
  }
  else
  {
    uint64_t v17 = [(WebBookmarkCollection *)self syncStringForKey:v11];
    char v18 = (void *)v17;
    int v19 = @"0";
    if (v17) {
      int v19 = (__CFString *)v17;
    }
    uint64_t v16 = v19;
  }
  uint64_t v20 = [v10 compare:v16 options:64];
  if (![(WebBookmarkCollection *)self _isDatabaseWriteAllowed])
  {
    BOOL v22 = v20 != 1;
    goto LABEL_13;
  }
  if (!v20) {
    goto LABEL_11;
  }
  if (v20 == -1)
  {
    int v21 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:]();
    }
LABEL_11:
    BOOL v22 = 1;
    goto LABEL_13;
  }
  if (![(WBCollectionConfiguration *)self->_configuration isReadonly]
    || ([(id)objc_opt_class() lockSync] & 1) != 0)
  {
    id v24 = (unsigned int (*)(void, void, void))[(WebBookmarkCollection *)self methodForSelector:a5];
    if ([(WebBookmarkCollection *)self _isDatabaseWriteAllowed]
      && [(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      BOOL v29 = __111__WebBookmarkCollection__updateDatabaseIfNewerVersion_wasLaunchedForSyncStringKey_upgradeSelector_versionType___block_invoke;
      uint64_t v30 = &unk_2643DA9E8;
      id v31 = v13;
      v32 = self;
      id v33 = v11;
      id v34 = v10;
      int v35 = v24;
      SEL v36 = a5;
      BOOL v25 = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:&v27 secureDelete:0];

      if (!v25)
      {
LABEL_19:
        BOOL v22 = 0;
        goto LABEL_22;
      }
    }
    else if (!v24(self, a5, v16))
    {
      goto LABEL_19;
    }
    -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:", v10, v11, v27, v28, v29, v30);
    [v13 removeObjectForKey:@"DebugForceMigrationFromSafariVersionKey"];
    BOOL v22 = 1;
LABEL_22:
    if ([(WBCollectionConfiguration *)self->_configuration isReadonly]) {
      [(id)objc_opt_class() unlockSync];
    }
    goto LABEL_13;
  }
  BOOL v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[WebBookmarkCollection _updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:]();
  }
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)_updateDatabaseOutsideSafariProcessIfNewerSafariVersionWasLaunched
{
  BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
  char v4 = objc_msgSend(v3, "safari_isInSyncAgent");

  if ((v4 & 1) == 0) {
    return 1;
  }
  BOOL v5 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariCoreBundle");
  BOOL v6 = objc_msgSend(v5, "safari_normalizedVersion");

  BOOL v7 = [(WebBookmarkCollection *)self _updateDatabaseIfNewerVersion:v6 wasLaunchedForSyncStringKey:@"newestLaunchedSafariOutsideSafariProcessVersion" upgradeSelector:sel__performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion_ versionType:@"NewestLaunchedSafariVersionOutsideApplicationProcess"];
  return v7;
}

- (BOOL)_updateDatabaseIfNewerSafariVersionWasLaunched
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariCoreBundle");
  char v4 = objc_msgSend(v3, "safari_normalizedVersion");

  LOBYTE(self) = [(WebBookmarkCollection *)self _updateDatabaseIfNewerVersion:v4 wasLaunchedForSyncStringKey:@"newestLaunchedSafariVersion" upgradeSelector:sel__performSafariVersionUpgradesFromPreviousVersion_ versionType:@"Safari"];
  return (char)self;
}

- (BOOL)_updateDatabaseIfNewerOSVersionWasLaunched
{
  BOOL v3 = [MEMORY[0x263F08AB0] processInfo];
  char v4 = objc_msgSend(v3, "safari_operatingSystemVersionString");

  LOBYTE(self) = [(WebBookmarkCollection *)self _updateDatabaseIfNewerVersion:v4 wasLaunchedForSyncStringKey:@"newestLaunchedOSVersion" upgradeSelector:sel__performOSVersionUpgradesFromPreviousVersion_ versionType:@"OS"];
  return (char)self;
}

- (BOOL)_migrateToCurrentSchema
{
  uint64_t v3 = [(WebBookmarkCollection *)self _userVersion];
  if ([(WebBookmarkCollection *)self _isDatabaseWriteAllowed])
  {
    if (v3 < 56)
    {
      if (v3 == 55)
      {
LABEL_68:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {
      char v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _migrateToCurrentSchema]();
      }
    }
    if (![(WBCollectionConfiguration *)self->_configuration isReadonly]
      || ([(id)objc_opt_class() lockSync] & 1) != 0)
    {
      switch(v3)
      {
        case -1:
          BOOL v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            -[WebBookmarkCollection _migrateToCurrentSchema]();
          }
          break;
        case 0:
          [(WebBookmarkCollection *)self _migrateSchemaVersion0ToVersion1];
          goto LABEL_19;
        case 1:
        case 2:
LABEL_19:
          [(WebBookmarkCollection *)self _migrateSchemaVersion1And2ToVersion3];
          goto LABEL_20;
        case 3:
LABEL_20:
          [(WebBookmarkCollection *)self _migrateSchemaVersion3ToVersion4];
          goto LABEL_21;
        case 4:
LABEL_21:
          [(WebBookmarkCollection *)self _migrateSchemaVersion4ToVersion5];
          goto LABEL_22;
        case 5:
LABEL_22:
          [(WebBookmarkCollection *)self _migrateSchemaVersion5ToVersion6];
          goto LABEL_23;
        case 6:
LABEL_23:
          [(WebBookmarkCollection *)self _migrateSchemaVersion6ToVersion7];
          goto LABEL_24;
        case 7:
LABEL_24:
          [(WebBookmarkCollection *)self _migrateSchemaVersion7ToVersion8];
          goto LABEL_25;
        case 8:
LABEL_25:
          [(WebBookmarkCollection *)self _migrateSchemaVersion8ToVersion9];
          goto LABEL_26;
        case 9:
LABEL_26:
          [(WebBookmarkCollection *)self _migrateSchemaVersion9ToVersion10];
          goto LABEL_27;
        case 10:
LABEL_27:
          [(WebBookmarkCollection *)self _migrateSchemaVersion10ToVersion11];
          goto LABEL_28;
        case 11:
        case 12:
        case 13:
LABEL_28:
          [(WebBookmarkCollection *)self _migrateSchemaVersion11And12And13ToVersion14];
          goto LABEL_29;
        case 14:
LABEL_29:
          [(WebBookmarkCollection *)self _migrateSchemaVersion14ToVersion15];
          goto LABEL_30;
        case 15:
LABEL_30:
          [(WebBookmarkCollection *)self _migrateSchemaVersion15ToVersion16];
          goto LABEL_31;
        case 16:
        case 17:
        case 18:
LABEL_31:
          [(WebBookmarkCollection *)self _migrateSchemaVersion16AndVersion17AndVersion18ToVersion19];
          goto LABEL_32;
        case 19:
        case 20:
LABEL_32:
          [(WebBookmarkCollection *)self _migrateSchemaVersion19And20ToVersion21];
          goto LABEL_33;
        case 21:
LABEL_33:
          [(WebBookmarkCollection *)self _migrateSchemaVersion21ToVersion22];
          goto LABEL_34;
        case 22:
LABEL_34:
          [(WebBookmarkCollection *)self _migrateSchemaVersion22ToVersion23];
          goto LABEL_35;
        case 23:
LABEL_35:
          [(WebBookmarkCollection *)self _migrateSchemaVersion23ToVersion24];
          goto LABEL_36;
        case 24:
LABEL_36:
          [(WebBookmarkCollection *)self _migrateSchemaVersion24ToVersion25];
          goto LABEL_37;
        case 25:
LABEL_37:
          [(WebBookmarkCollection *)self _migrateSchemaVersion25ToVersion26];
          goto LABEL_38;
        case 26:
LABEL_38:
          [(WebBookmarkCollection *)self _migrateSchemaVersion26ToVersion27];
          goto LABEL_39;
        case 27:
LABEL_39:
          [(WebBookmarkCollection *)self _migrateSchemaVersion27ToVersion28];
          goto LABEL_40;
        case 28:
LABEL_40:
          [(WebBookmarkCollection *)self _migrateSchemaVersion28ToVersion29];
          goto LABEL_41;
        case 29:
LABEL_41:
          [(WebBookmarkCollection *)self _migrateSchemaVersion29ToVersion30];
          goto LABEL_42;
        case 30:
LABEL_42:
          [(WebBookmarkCollection *)self _migrateSchemaVersion30ToVersion31];
          goto LABEL_43;
        case 31:
LABEL_43:
          [(WebBookmarkCollection *)self _migrateSchemaVersion31ToVersion32];
          goto LABEL_44;
        case 32:
LABEL_44:
          [(WebBookmarkCollection *)self _migrateSchemaVersion32ToVersion33];
          goto LABEL_45;
        case 33:
LABEL_45:
          [(WebBookmarkCollection *)self _migrateSchemaVersion33ToVersion34];
          goto LABEL_46;
        case 34:
LABEL_46:
          [(WebBookmarkCollection *)self _migrateSchemaVersion34ToVersion35];
          goto LABEL_47;
        case 35:
LABEL_47:
          [(WebBookmarkCollection *)self _migrateSchemaVersion35ToVersion36];
          goto LABEL_48;
        case 36:
LABEL_48:
          [(WebBookmarkCollection *)self _migrateSchemaVersion36ToVersion37];
          goto LABEL_49;
        case 37:
LABEL_49:
          [(WebBookmarkCollection *)self _migrateSchemaVersion37ToVersion38];
          goto LABEL_50;
        case 38:
LABEL_50:
          [(WebBookmarkCollection *)self _migrateSchemaVersion38ToVersion39];
          goto LABEL_51;
        case 39:
        case 40:
LABEL_51:
          [(WebBookmarkCollection *)self _migrateSchemaVersion39Or40ToVersion41];
          goto LABEL_52;
        case 41:
LABEL_52:
          [(WebBookmarkCollection *)self _migrateSchemaVersion41ToVersion42];
          goto LABEL_53;
        case 42:
LABEL_53:
          [(WebBookmarkCollection *)self _migrateSchemaVersion42ToVersion43];
          goto LABEL_54;
        case 43:
LABEL_54:
          [(WebBookmarkCollection *)self _migrateSchemaVersion43ToVersion44];
          goto LABEL_55;
        case 44:
LABEL_55:
          [(WebBookmarkCollection *)self _migrateSchemaVersion44ToVersion45];
          goto LABEL_56;
        case 45:
LABEL_56:
          [(WebBookmarkCollection *)self _migrateSchemaVersion45ToVersion46];
          goto LABEL_57;
        case 46:
LABEL_57:
          [(WebBookmarkCollection *)self _migrateSchemaVersion46ToVersion47];
          goto LABEL_58;
        case 47:
LABEL_58:
          [(WebBookmarkCollection *)self _migrateSchemaVersion47ToVersion48];
          goto LABEL_59;
        case 48:
LABEL_59:
          [(WebBookmarkCollection *)self _migrateSchemaVersion48ToVersion49];
          goto LABEL_60;
        case 49:
LABEL_60:
          [(WebBookmarkCollection *)self _migrateSchemaVersion49ToVersion50];
          goto LABEL_61;
        case 50:
LABEL_61:
          [(WebBookmarkCollection *)self _migrateSchemaVersion50ToVersion51];
          goto LABEL_62;
        case 51:
LABEL_62:
          [(WebBookmarkCollection *)self _migrateSchemaVersion51ToVersion52];
          goto LABEL_63;
        case 52:
LABEL_63:
          [(WebBookmarkCollection *)self _migrateSchemaVersion52ToVersion53];
          goto LABEL_64;
        case 53:
LABEL_64:
          [(WebBookmarkCollection *)self _migrateSchemaVersion53ToVersion54];
          goto LABEL_65;
        case 54:
LABEL_65:
          [(WebBookmarkCollection *)self _migrateSchemaVersion54ToVersion55];
          break;
        default:
          break;
      }
      [(WebBookmarkCollection *)self _rerunMigrationsIfNecessary];
      if ([(WBCollectionConfiguration *)self->_configuration isReadonly]) {
        [(id)objc_opt_class() unlockSync];
      }
      goto LABEL_68;
    }
    id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v5 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      -[WebBookmarkCollection _migrateToCurrentSchema]();
      goto LABEL_17;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
    if (v3 <= 54 && v3 != 39)
    {
      BOOL v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      BOOL v5 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        -[WebBookmarkCollection _migrateToCurrentSchema].cold.4();
LABEL_17:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (int64_t)_userVersion
{
  return [(WebBookmarkCollection *)self _intFromExecutingSQL:@"PRAGMA user_version"];
}

- (unsigned)orderIndexOfBookmark:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT order_index FROM bookmarks WHERE id = %d", objc_msgSend(v4, "identifier"));
  unsigned int v6 = [(WebBookmarkCollection *)self _intFromExecutingSQL:v5];

  if (v6 == -1) {
    unsigned int v6 = 0;
  }

  return v6;
}

- (int)_intFromExecutingSQL:(id)a3
{
  return WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)a3, (NSString *)a3);
}

- (sqlite3_stmt)_selectBookmarksWhere:(id)a3 returnType:(int64_t)a4
{
  id v6 = a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  switch(a4)
  {
    case 0:
      id v8 = NSString;
      char v9 = BookmarkSQLiteColumns();
      id v10 = [v8 stringWithFormat:@"SELECT %@ FROM bookmarks WHERE %@", v9, v6];

      goto LABEL_9;
    case 1:
      BOOL v7 = @"SELECT id FROM bookmarks WHERE %@";
      goto LABEL_7;
    case 2:
      BOOL v7 = @"SELECT count(*) FROM bookmarks WHERE %@";
LABEL_7:
      id v10 = objc_msgSend(NSString, "stringWithFormat:", v7, v6);
      goto LABEL_9;
  }
  id v10 = 0;
LABEL_9:
  ppStmt = 0;
  db = self->_db;
  id v12 = v10;
  if (sqlite3_prepare_v2(db, (const char *)[v12 UTF8String], -1, &ppStmt, 0)) {
    int v13 = 0;
  }
  else {
    int v13 = ppStmt;
  }

  return v13;
}

- (void)logRegulatoryBookmarksRead
{
  ct_green_tea_logger_create_static();
  v2 = getCTGreenTeaOsLogHandle();
  uint64_t v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_INFO, "Read Safari bookmarks", v4, 2u);
  }
}

- (int64_t)_mergeBookmarkIntoPersistedBookmark:(id)a3 forAttributes:(unint64_t)a4
{
  id v6 = a3;
  if [v6 isInserted] && (objc_msgSend(v6, "isSyncable"))
  {
    BOOL v7 = (void *)MEMORY[0x21D4A0FE0]();
    id v8 = [v6 serverID];
    char v9 = [(WebBookmarkCollection *)self bookmarkWithServerID:v8 excludeDeletedBookmarks:0];

    if ([v9 isDeleted]) {
      unint64_t v10 = 0x4000;
    }
    else {
      unint64_t v10 = a4;
    }
    if ([(WebBookmarkCollection *)self maintainsSyncMetadata]) {
      [v6 lockFields];
    }
    if (v9) {
      int64_t v11 = [v6 mergeAttributes:v10 withBookmark:v9];
    }
    else {
      int64_t v11 = 2;
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75__WebBookmarkCollection__mergeBookmarkIntoPersistedBookmark_forAttributes___block_invoke;
    v13[3] = &unk_2643DAA60;
    BOOL v15 = self;
    unint64_t v16 = v10;
    id v14 = v6;
    [(WebBookmarkCollection *)self updateSyncDataForBookmark:v14 usingBlock:v13];
  }
  else
  {
    int64_t v11 = 2;
  }

  return v11;
}

- (void)_enableForeignKeys
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA foreign_keys = ON"];
}

- (void)_enableAutoVacuum
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA auto_vacuum = INCREMENTAL"];
}

- (unsigned)_orderIndexForBookmarkInsertedIntoParent:(int)a3 insertAtBeginning:(BOOL)a4
{
  BOOL v4 = a4;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  if (v4)
  {
    if (a3)
    {
      return 0;
    }
    else
    {
      unsigned int v9 = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT MAX(order_index) + 1 FROM bookmarks WHERE special_id != 0", v7);
      if (v9 == -1) {
        return 0;
      }
      else {
        return v9;
      }
    }
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT COUNT(*), MAX(order_index) FROM bookmarks WHERE parent = ? AND deleted = 0 AND syncable = 1");
    sqlite3_bind_int(v12, 1, a3);
    if (sqlite3_step(v12) == 100 && sqlite3_column_int(v12, 0)) {
      unsigned int v8 = sqlite3_column_int(v12, 1) + 1;
    }
    else {
      unsigned int v8 = 0;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  }
  return v8;
}

- (int64_t)_syncType
{
  if ([(WBCollectionConfiguration *)self->_configuration collectionType]) {
    return 1;
  }
  int64_t v4 = [(WebBookmarkCollection *)self localMigrationState];
  if ((unint64_t)(v4 + 1) > 4) {
    return 2;
  }
  else {
    return qword_21C0E8FE0[v4 + 1];
  }
}

- (BOOL)_reindexBookmarkID:(int)a3 title:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  BOOL v7 = [(WebBookmarkCollection *)self _clearTitleWordsForBookmarkID:v4]
    && [(WebBookmarkCollection *)self _indexBookmarkID:v4 title:v6];

  return v7;
}

- (BOOL)_isTombstoneWithServerID:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "SELECT id FROM bookmarks WHERE server_id = ? AND deleted = 1");
  BOOL v5 = v9;
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = sqlite3_step(v9) == 100;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return (char)v4;
}

- (int)_finalizeStatementIfNotNull:(sqlite3_stmt *)a3
{
  if (a3) {
    return sqlite3_finalize(a3);
  }
  else {
    return 0;
  }
}

- (BOOL)_deleteRecursively:(int)a3 descendantsOnly:(BOOL)a4
{
  BOOL v7 = @" OR id = ?";
  if (a4) {
    BOOL v7 = &stru_26CC2ED50;
  }
  unsigned int v8 = [NSString stringWithFormat:@"DELETE FROM bookmarks WHERE parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = ?) OR parent = ?%@", v7];
  db = self->_db;
  id v10 = v8;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, db, (const char *)[v10 UTF8String]);
  sqlite3_bind_int(v15, 1, a3);
  sqlite3_bind_int(v15, 2, a3);
  if (!a4) {
    sqlite3_bind_int(v15, 3, a3);
  }
  int v11 = sqlite3_step(v15);
  if (v11 != 101)
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _deleteRecursively:descendantsOnly:]();
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);

  return v11 == 101;
}

- (BOOL)_clearTitleWordsForBookmarkID:(int)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM bookmark_title_words WHERE bookmark_id = %d", *(void *)&a3);
  LODWORD(self) = [(WebBookmarkCollection *)self _executeSQL:v4];

  return self == 0;
}

- (id)_rootFolderHiddenChildrenClause
{
  v2 = [(WebBookmarkCollection *)self favoritesFolder];
  uint64_t v3 = [v2 identifier];

  return (id)objc_msgSend(NSString, "stringWithFormat:", @"AND hidden = 0 AND id != %d AND (num_children > 0 OR special_id != %d)", v3, 2);
}

- (WebBookmarkList)favoritesFolderList
{
  uint64_t v3 = [(WebBookmarkCollection *)self favoritesFolder];
  uint64_t v4 = [v3 identifier];

  return (WebBookmarkList *)[(WebBookmarkCollection *)self listWithID:v4];
}

- (WebBookmark)favoritesFolder
{
  uint64_t v3 = [(WebBookmarkCollection *)self syncStringForKey:@"_FavoritesFolderID"];
  uint64_t v4 = [v3 intValue];

  if (!v4
    || ([(WebBookmarkCollection *)self bookmarkWithID:v4],
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v5 = [(WebBookmarkCollection *)self bookmarksBarBookmark];
  }
  return (WebBookmark *)v5;
}

- (WebBookmark)bookmarksBarBookmark
{
  uint64_t v3 = +[WBWebFilterSettings sharedWebFilterSettings];
  int v4 = [v3 usesAllowedSitesOnly];

  if (v4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [(WebBookmarkCollection *)self bookmarkWithSpecialID:v5];
  return (WebBookmark *)v6;
}

- (id)bookmarkWithSpecialID:(int)a3
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"special_id = ? AND deleted = 0"]);
  if (v12 && (sqlite3_bind_int(v11, 1, a3), sqlite3_step(v11) == 100))
  {
    uint64_t v5 = [WebBookmark alloc];
    id v6 = v11;
    BOOL v7 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    unsigned int v8 = [(WebBookmark *)v5 initWithSQLiteStatement:v6 deviceIdentifier:v7 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
  }
  else
  {
    unsigned int v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8;
}

- (BOOL)performDatabaseUpdatesWithTransaction:(id)a3 secureDelete:(BOOL)a4
{
  return [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:a3 applyInMemoryChanges:1 secureDelete:a4];
}

uint64_t __72__WebBookmarkCollection__unsafeOpenDatabaseAtPath_checkIntegrity_error___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    result = [(id)objc_opt_class() isLockedSync];
    if (result)
    {
      v2 = *(void **)(v1 + 32);
      return [v2 _restoreMissingSpecialBookmarksWithChangeNotification:0];
    }
  }
  return result;
}

- (BOOL)performDatabaseUpdatesWithTransaction:(id)a3 applyInMemoryChanges:(BOOL)a4 secureDelete:(BOOL)a5
{
  BOOL v6 = a4;
  unsigned int v8 = (uint64_t (**)(void))a3;
  if (([(id)objc_opt_class() isLockedSync] & 1) == 0) {
    [(WebBookmarkCollection *)self _simulateCrashWithDescription:@"Trying to edit bookmarks without first obtaining the bookmarks database file lock."];
  }
  if (v6 && ![(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    BOOL v9 = [(WebBookmarkCollection *)self isTransactionCurrentlyActive];
    if (!v9) {
      operator new();
    }
    value = self->_currentTransaction.__ptr_.__value_;
    if (*((unsigned char *)value + 17))
    {
      int v11 = v8[2](v8);
      value = self->_currentTransaction.__ptr_.__value_;
    }
    else
    {
      int v11 = 0;
    }
    WebBookmarks::BookmarkSQLWriteTransaction::requestSecureDelete((uint64_t)value, a5);
    if (!v9)
    {
      if (v11)
      {
        WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)self->_currentTransaction.__ptr_.__value_, v12, v13);
        id v14 = self->_currentTransaction.__ptr_.__value_;
        if (!*((unsigned char *)v14 + 18))
        {
          self->_currentTransaction.__ptr_.__value_ = 0;
LABEL_18:
          (*(void (**)(BookmarkSQLWriteTransaction *))(*(void *)v14 + 8))(v14);
          goto LABEL_19;
        }
        [(WebBookmarkCollection *)self truncateWAL];
      }
      id v14 = self->_currentTransaction.__ptr_.__value_;
      self->_currentTransaction.__ptr_.__value_ = 0;
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
LABEL_19:

  return v11;
}

- (BOOL)isTransactionCurrentlyActive
{
  value = self->_currentTransaction.__ptr_.__value_;
  return value && *((unsigned char *)value + 17) && *((unsigned char *)value + 16) == 0;
}

- (BOOL)_deleteBookmarks:(id)a3 leaveTombstone:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if (!-[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", *(void *)(*((void *)&v12 + 1) + 8 * i), v4, (void)v12))
        {

          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = [(WebBookmarkCollection *)self _incrementGeneration];
LABEL_11:

  return v10;
}

- (BOOL)deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(WebBookmarkCollection *)self maintainsSyncMetadata]
    || ![v6 isSyncable])
  {
    goto LABEL_6;
  }
  [v6 setSyncState:&unk_26CC3FF30];
  [(WebBookmarkCollection *)self _mergeBookmarkIntoPersistedBookmark:v6 forAttributes:0x4000];
  uint64_t v7 = [v6 syncState];
  uint64_t v8 = [v7 integerValue];

  if (!v8)
  {
    BOOL v11 = 1;
    goto LABEL_7;
  }
  if (v4)
  {
    BOOL v9 = [MEMORY[0x263EFF9C0] set];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__WebBookmarkCollection_deleteBookmark_leaveTombstone___block_invoke;
    v13[3] = &unk_2643DAA38;
    void v13[4] = self;
    id v14 = v9;
    id v15 = v6;
    id v10 = v9;
    BOOL v11 = [(WebBookmarkCollection *)self _deleteBookmark:v15 leaveTombstone:1 insertTombstoneBlock:v13];
  }
  else
  {
LABEL_6:
    BOOL v11 = [(WebBookmarkCollection *)self _deleteBookmark:v6 leaveTombstone:v4];
  }
LABEL_7:

  return v11;
}

- (BOOL)_deleteBookmark:(id)a3 leaveTombstone:(BOOL)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__WebBookmarkCollection__deleteBookmark_leaveTombstone___block_invoke;
  v5[3] = &unk_2643DA8A8;
  v5[4] = self;
  return [(WebBookmarkCollection *)self _deleteBookmark:a3 leaveTombstone:a4 insertTombstoneBlock:v5];
}

- (BOOL)truncateWAL
{
  return [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA wal_checkpoint(TRUNCATE)"] == 0;
}

- (void)enumerateDescendantsOfBookmarkID:(int)a3 usingBlock:(id)a4
{
}

- (BOOL)_addBookmarkWithTitle:(id)a3 address:(id)a4 parentID:(int)a5 orderIndex:(unsigned int)a6 isFolder:(BOOL)a7 externalUUID:(id)a8 associatedBookmark:(id)a9 updateParentChildCount:(BOOL)a10 updateAncestorEntries:(BOOL)a11 incrementGenerations:(BOOL)a12
{
  BOOL v13 = a7;
  uint64_t v14 = *(void *)&a6;
  id v15 = *(void **)&a5;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v52 = a3;
  id v53 = a4;
  id v18 = a8;
  id v19 = a9;
  if (v15 == 0x7FFFFFFF)
  {
    int v20 = 0;
    goto LABEL_3;
  }
  db = self->_db;
  objc_msgSend(NSString, "stringWithFormat:", @"UPDATE bookmarks SET order_index = order_index + 1 WHERE parent = %d AND order_index >= %d", v15, v14);
  id v24 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  LODWORD(db) = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v24, v25);

  if (db)
  {
    BOOL v26 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:]();
    }
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "SELECT (hidden + hidden_ancestor_count) FROM bookmarks WHERE id = ?");
    sqlite3_bind_int(*(sqlite3_stmt **)&v58[4], 1, (int)v15);
    if (sqlite3_step(*(sqlite3_stmt **)&v58[4]) == 100)
    {
      int v20 = sqlite3_column_int(*(sqlite3_stmt **)&v58[4], 0);
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
LABEL_3:
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v54, self->_db, (const char *)objc_msgSend(@"INSERT INTO bookmarks (title, url, parent, type, external_uuid, order_index, extra_attributes, fetched_icon, icon, locally_added, archive_status, web_filter_status, hidden_ancestor_count, editable, local_attributes, syncable, dav_generation, last_selected_child, subtype) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", "UTF8String"));
      if (!v56)
      {
        BOOL v27 = 0;
LABEL_56:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v54);
        goto LABEL_57;
      }
      int v21 = v55;
      if (a10) {
        [(WebBookmarkCollection *)self _updateCachedChildCountForParentID:v15 inDirection:1];
      }
      if (v18)
      {
        uint64_t v22 = (uint64_t)v18;
      }
      else
      {
        uint64_t v22 = [v19 UUID];
        if (!v22)
        {
          uint64_t v22 = [(id)objc_opt_class() _uniqueExternalUUID];
        }
      }
      uint64_t v28 = (void *)v22;
      sqlite3_bind_text(v21, 1, (const char *)[v52 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(v21, 2, (const char *)[v53 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (v15 == 0x7FFFFFFF) {
        sqlite3_bind_null(v21, 3);
      }
      else {
        sqlite3_bind_int(v21, 3, (int)v15);
      }
      sqlite3_bind_int(v21, 4, v13);
      id v51 = v28;
      sqlite3_bind_text(v21, 5, (const char *)[v51 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(v21, 6, v14);
      BOOL v29 = [v19 extraAttributes];
      char v30 = bindAttributesToSQLStatement(v21, 7, v29);

      if (v30)
      {
        sqlite3_bind_int(v21, 8, [v19 fetchedIconData]);
        id v31 = [v19 iconData];
        bindNullableDataToSQLStatement(v21, 9, v31);

        sqlite3_bind_int(v21, 10, [v19 isAddedLocally]);
        sqlite3_bind_int(v21, 11, [v19 archiveStatus]);
        sqlite3_bind_int(v21, 12, [v19 webFilterStatus]);
        sqlite3_bind_int(v21, 13, v20);
        if (v19) {
          int v32 = [v19 isEditable];
        }
        else {
          int v32 = 1;
        }
        sqlite3_bind_int(v21, 14, v32);
        id v34 = [v19 localAttributes];
        bindAttributesToSQLStatement(v21, 15, v34);

        if (v19) {
          int v35 = [v19 isSyncable];
        }
        else {
          int v35 = 1;
        }
        sqlite3_bind_int(v21, 16, v35);
        sqlite3_bind_int64(v21, 17, [(WebBookmarkCollection *)self currentRecordGeneration]);
        int v36 = [v19 lastSelectedChildID];
        if (v36 == 0x7FFFFFFF) {
          sqlite3_bind_null(v21, 18);
        }
        else {
          sqlite3_bind_int(v21, 18, v36);
        }
        sqlite3_bind_int(v21, 19, [v19 subtype]);
        int v37 = sqlite3_step(v21);
        if (v37 == 101)
        {
          sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);
          if (v13 && a11) {
            [(WebBookmarkCollection *)self _insertAncestorTableEntriesForBookmarkID:insert_rowid withParentID:v15];
          }
          [v19 _setOrderIndex:v14];
          [v19 _setID:insert_rowid];
          [v19 _setUUID:v51];
          [v19 _setInserted:1];
          if ([(WebBookmarkCollection *)self maintainsSyncMetadata]
            && [v19 isSyncable])
          {
            v39 = [v19 serverID];
            id v40 = v39;
            if (!v39)
            {
              id v15 = [MEMORY[0x263F08C38] UUID];
              id v40 = [v15 UUIDString];
            }
            [(WebBookmarkCollection *)self setServerID:v40 forBookmark:v19];
            if (!v39)
            {
            }
          }
          if (!a12)
          {
            [(WebBookmarkCollection *)self _markBookmarkID:insert_rowid added:0];
            BOOL v27 = 1;
            goto LABEL_55;
          }
          if ([v19 isSyncable])
          {
            if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
            {
              int v41 = [v19 syncPosition];
              BOOL v42 = v41 == 0;

              if (v42)
              {
                id v43 = [(WebBookmarkCollection *)self generateSyncPositionForBookmark:v19];
                [v19 setSyncPosition:v43];
              }
            }
          }
          if ([(WebBookmarkCollection *)self updateBookmarkSyncPositionIfNeeded:v19])
          {
            BOOL v27 = [(WebBookmarkCollection *)self _incrementGeneration];
LABEL_55:
            id v18 = v51;
            goto LABEL_56;
          }
        }
        else
        {
          v44 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v46 = [v19 serverID];
            objc_msgSend(v46, "wb_stringByRedactingBookmarkDAVServerID");
            id v47 = (id)objc_claimAutoreleasedReturnValue();
            v48 = [(WebBookmarkCollection *)self _errorForMostRecentSQLiteError];
            char v49 = [v48 userInfo];
            v50 = [v49 objectForKeyedSubscript:*MEMORY[0x263F664F0]];
            *(_DWORD *)buf = 138544130;
            *(void *)v58 = v47;
            *(_WORD *)&v58[8] = 1024;
            *(_DWORD *)&v58[10] = v15;
            __int16 v59 = 1024;
            int v60 = v37;
            __int16 v61 = 2114;
            v62 = v50;
            _os_log_error_impl(&dword_21C043000, v44, OS_LOG_TYPE_ERROR, "Could not insert record with server ID: %{public}@ into parent with ID: %d, error: %d %{public}@", buf, 0x22u);
          }
        }
      }
      BOOL v27 = 0;
      goto LABEL_55;
    }
    id v33 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:]();
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  }
  BOOL v27 = 0;
LABEL_57:

  return v27;
}

- (int64_t)currentRecordGeneration
{
  return (int)WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT value from sync_properties WHERE key = '_dav_generation'", v2);
}

- (BOOL)updateBookmarkSyncPositionIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(WebBookmarkCollection *)self maintainsSyncMetadata]
    && ([v4 isSyncable] & 1) != 0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke;
    v7[3] = &unk_2643DACC8;
    v7[4] = self;
    id v8 = v4;
    BOOL v5 = [(WebBookmarkCollection *)self updateSyncDataForBookmark:v8 usingBlock:v7];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)_saveAndMoveBookmark:(id)a3 toFolderID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(WebBookmarkCollection *)self _specialIDForBookmarkBeingSaved:v6];
  BOOL v8 = [(WebBookmarkCollection *)self _moveBookmark:v6 toFolderWithID:v4 detectCycles:1]&& [(WebBookmarkCollection *)self _saveBookmark:v6 withSpecialID:v7 updateGenerationIfNeeded:1]&& [(WebBookmarkCollection *)self _incrementGeneration];

  return v8;
}

- (int)_specialIDForBookmarkBeingSaved:(id)a3
{
  id v4 = a3;
  if ([v4 specialID]
    || ![v4 isFolder]
    || [v4 parentID]
    || ([v4 title],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [(WebBookmarkCollection *)self _specialIDForBookmarkTitle:v7],
        v7,
        !v8))
  {
    int v5 = 0;
  }
  else
  {
    db = self->_db;
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT count(*) FROM Bookmarks WHERE special_id = %u", v8);
    id v10 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
    LODWORD(db) = WebBookmarks::BookmarkSQLStatement::selectInt(db, v10, v11);

    if (db) {
      int v5 = 0;
    }
    else {
      int v5 = v8;
    }
  }

  return v5;
}

- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4 detectCycles:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  LOBYTE(v10) = 1;
  LOBYTE(v5) = [(WebBookmarkCollection *)self _moveBookmark:v8 toFolderWithID:v6 orderIndex:[(WebBookmarkCollection *)self _orderIndexForBookmarkInsertedIntoParent:v6 insertAtBeginning:0] detectCycles:v5 incrementGeneration:1 shouldMerge:1 generateSyncPositionIfNeeded:v10];

  return v5;
}

- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4 orderIndex:(unsigned int)a5 detectCycles:(BOOL)a6 incrementGeneration:(BOOL)a7 shouldMerge:(BOOL)a8 generateSyncPositionIfNeeded:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v15 = a3;
  unint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v15 privacyPreservingDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)id v43 = v17;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)&v43[10] = v13;
    __int16 v44 = 1024;
    LODWORD(v45) = v12;
    _os_log_impl(&dword_21C043000, v16, OS_LOG_TYPE_INFO, "Moving bookmark %{public}@ to parent %d and order index %d", buf, 0x18u);
  }
  if ([v15 isInserted])
  {
    int v18 = [(WebBookmarkCollection *)self orderIndexOfBookmark:v15];
    uint64_t v19 = [v15 parentID];
    int v20 = [(WebBookmarkCollection *)self bookmarkWithID:v13];
    int v21 = v20;
    if (!v20 || ([v20 isFolder] & 1) == 0) {
      goto LABEL_19;
    }
    if (v11 && [v15 isFolder])
    {
      if ([v15 identifier] == v13)
      {
        uint64_t v22 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)id v43 = v13;
          _os_log_impl(&dword_21C043000, v22, OS_LOG_TYPE_INFO, "Cannot insert bookmark with local ID %d into itself", buf, 8u);
        }
        goto LABEL_19;
      }
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "SELECT COUNT(*) from folder_ancestors WHERE folder_id = ? AND ancestor_id = ?");
      sqlite3_bind_int(*(sqlite3_stmt **)&v43[4], 1, v13);
      sqlite3_bind_int(*(sqlite3_stmt **)&v43[4], 2, [v15 identifier]);
      if (sqlite3_step(*(sqlite3_stmt **)&v43[4]) != 100)
      {
        id v24 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
LABEL_17:
          int v25 = [v15 identifier];
          *(_DWORD *)v50 = 67109376;
          int v51 = v25;
          LOWORD(v52) = 1024;
          *(_DWORD *)((char *)&v52 + 2) = v13;
          _os_log_impl(&dword_21C043000, v24, OS_LOG_TYPE_INFO, "Cannot insert bookmark with ID %d into parent with ID %d since it is a descendent", v50, 0xEu);
        }
LABEL_18:

        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
LABEL_19:
        BOOL v23 = 0;
LABEL_20:

        goto LABEL_21;
      }
      if (sqlite3_column_int(*(sqlite3_stmt **)&v43[4], 0))
      {
        id v24 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
    }
    [v15 _setParentID:v13 incrementGeneration:v10];
    if (a9
      && [v15 isSyncable] & v10
      && [(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      BOOL v27 = -[WebBookmarkCollection _generateSyncPositionForOrderIndex:inFolderWithID:direction:](self, "_generateSyncPositionForOrderIndex:inFolderWithID:direction:", v12, [v15 parentID], 1);
      [v15 setSyncPosition:v27];
    }
    if ([(WebBookmarkCollection *)self maintainsSyncMetadata] && v9) {
      [(WebBookmarkCollection *)self _mergeBookmarkIntoPersistedBookmark:v15 forAttributes:68];
    }
    if ([v15 parentID] != v13)
    {
      BOOL v23 = 1;
      goto LABEL_20;
    }
    if ([v15 isSyncable]
      && [(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      uint64_t v28 = [v15 syncPosition];
      uint64_t v12 = -[WebBookmarkCollection orderIndexOfBookmark:withSyncPosition:inFolderWithID:](self, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v15, v28, [v15 parentID]);
    }
    [v15 _setOrderIndex:v12];
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v50, self->_db, "UPDATE bookmarks SET order_index = order_index + 1 WHERE parent = ? AND order_index >= ?");
    sqlite3_bind_int(v52, 1, v13);
    sqlite3_bind_int(v52, 2, v12);
    if (sqlite3_step(v52) != 101)
    {
      BOOL v23 = 0;
LABEL_58:
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v50);
      goto LABEL_20;
    }
    WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v50);
    BOOL v29 = &stru_26CC2ED50;
    if (v10) {
      char v30 = @" modified_attributes = modified_attributes | ?4,";
    }
    else {
      char v30 = &stru_26CC2ED50;
    }
    if (v10) {
      BOOL v29 = @" dav_generation = ?5,";
    }
    id v31 = [NSString stringWithFormat:@"UPDATE bookmarks SET parent = ?1, order_index = ?2,%@%@ icon = NULL, fetched_icon = 0 WHERE id = ?3", v30, v29];
    db = self->_db;
    id v33 = v31;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v40, db, (const char *)[v33 UTF8String]);
    sqlite3_bind_int(v41, 1, v13);
    sqlite3_bind_int(v41, 2, v12);
    sqlite3_bind_int(v41, 3, [v15 identifier]);
    if (v10)
    {
      sqlite3_bind_int64(v41, 4, 64);
      sqlite3_bind_int64(v41, 5, [(WebBookmarkCollection *)self currentRecordGeneration]);
    }
    int v34 = sqlite3_step(v41);
    if (v34 == 101)
    {
      WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v40);
      if ([(WebBookmarkCollection *)self _updateCachedChildCountForParentID:v13 inDirection:1]&& [(WebBookmarkCollection *)self _updateCachedChildCountForParentID:v19 inDirection:0xFFFFFFFFLL])
      {
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET order_index = (order_index - 1) WHERE parent = ? AND order_index > ?");
        sqlite3_bind_int(*(sqlite3_stmt **)&v43[4], 1, v19);
        sqlite3_bind_int(*(sqlite3_stmt **)&v43[4], 2, v18);
        if (sqlite3_step(*(sqlite3_stmt **)&v43[4]) == 101)
        {
          WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)buf);
          if (![v15 isFolder]
            || -[WebBookmarkCollection _deleteAncestorTableEntriesForBookmarkID:](self, "_deleteAncestorTableEntriesForBookmarkID:", [v15 identifier])&& -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withParentID:](self, "_insertAncestorTableEntriesForBookmarkID:withParentID:", objc_msgSend(v15, "identifier"), v13))
          {
            [v15 setFetchedIconData:0];
            [v15 setIconData:0];
            if (!v10
              || [(WebBookmarkCollection *)self updateBookmarkSyncPositionIfNeeded:v15])
            {
              BOOL v23 = 1;
LABEL_62:
              WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
              goto LABEL_57;
            }
          }
        }
        else
        {
          int v36 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[WebBookmarkCollection _moveBookmark:toFolderWithID:orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:](v19, v36);
          }
        }
        BOOL v23 = 0;
        goto LABEL_62;
      }
    }
    else
    {
      int v35 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        int v37 = [v15 identifier];
        v38 = [v15 serverID];
        v39 = objc_msgSend(v38, "wb_stringByRedactingBookmarkDAVServerID");
        *(_DWORD *)buf = 138544386;
        *(void *)id v43 = v15;
        *(_WORD *)&v43[8] = 1024;
        *(_DWORD *)&v43[10] = v37;
        __int16 v44 = 2114;
        id v45 = v39;
        __int16 v46 = 1024;
        int v47 = v13;
        __int16 v48 = 1024;
        int v49 = v34;
        _os_log_error_impl(&dword_21C043000, v35, OS_LOG_TYPE_ERROR, "Could not move record %{public}@ with localID: %d, server ID: %{public}@, to parent %d, error: %d", buf, 0x28u);
      }
    }
    BOOL v23 = 0;
LABEL_57:
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v40);

    goto LABEL_58;
  }
  [v15 _setParentID:v13 incrementGeneration:v10];
  BOOL v23 = 1;
LABEL_21:

  return v23;
}

- (BOOL)_reorderBookmark:(id)a3 afterBookmark:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [v6 privacyPreservingDescription];
    BOOL v10 = [v7 privacyPreservingDescription];
    int v17 = 138543618;
    int v18 = v9;
    __int16 v19 = 2114;
    int v20 = v10;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Reordering bookmark %{public}@ after bookmark %{public}@", (uint8_t *)&v17, 0x16u);
  }
  unsigned int v11 = [(WebBookmarkCollection *)self orderIndexOfBookmark:v6];
  unsigned int v12 = [(WebBookmarkCollection *)self orderIndexOfBookmark:v7];
  if (v12 >= v11) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = v12 + 1;
  }
  if (v7) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  BOOL v15 = [(WebBookmarkCollection *)self _reorderBookmark:v6 toIndex:v14];

  return v15;
}

- (BOOL)_reorderBookmark:(id)a3 toIndex:(unsigned int)a4 generateSyncPositionIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = [v8 privacyPreservingDescription];
    int v20 = 138543618;
    uint64_t v21 = v10;
    __int16 v22 = 1024;
    int v23 = v6;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Reordering bookmark %{public}@ to index %d", (uint8_t *)&v20, 0x12u);
  }
  uint64_t v11 = [(WebBookmarkCollection *)self orderIndexOfBookmark:v8];
  if (v11 != v6)
  {
    if (v5
      && [v8 isSyncable]
      && [(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      uint64_t v13 = [v8 parentID];
      uint64_t v14 = [NSNumber numberWithUnsignedInt:v11];
      BOOL v15 = [NSNumber numberWithUnsignedInt:v6];
      unint64_t v16 = -[WebBookmarkCollection _generateSyncPositionForOrderIndex:inFolderWithID:direction:](self, "_generateSyncPositionForOrderIndex:inFolderWithID:direction:", v6, v13, [v14 compare:v15]);
      [v8 setSyncPosition:v16];
    }
    if ([(WebBookmarkCollection *)self maintainsSyncMetadata]) {
      [(WebBookmarkCollection *)self _mergeBookmarkIntoPersistedBookmark:v8 forAttributes:4];
    }
    if ([v8 isSyncable]
      && [(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      int v17 = [v8 syncPosition];
      unsigned int v18 = -[WebBookmarkCollection orderIndexOfBookmark:withSyncPosition:inFolderWithID:](self, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v8, v17, [v8 parentID]);

      unint64_t v6 = (__PAIR64__(v18, v11) - v18) >> 32;
    }
    [v8 _setOrderIndex:v6];
    if (!-[WebBookmarkCollection _moveBookmark:fromIndex:toIndex:](self, "_moveBookmark:fromIndex:toIndex:", v8, v11, [v8 orderIndex])|| !-[WebBookmarkCollection updateBookmarkSyncPositionIfNeeded:](self, "updateBookmarkSyncPositionIfNeeded:", v8))
    {
      BOOL v12 = 0;
      goto LABEL_19;
    }
    if ([(WebBookmarkCollection *)self maintainsSyncMetadata]) {
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v8 parentID]);
    }
  }
  BOOL v12 = 1;
LABEL_19:

  return v12;
}

- (BOOL)_reorderBookmark:(id)a3 toIndex:(unsigned int)a4
{
  return [(WebBookmarkCollection *)self _reorderBookmark:a3 toIndex:*(void *)&a4 generateSyncPositionIfNeeded:1];
}

+ (id)_uniqueExternalUUID
{
  v2 = [MEMORY[0x263F08C38] UUID];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)_verifyAllTablesExist:(int *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, self->_db, "SELECT name from sqlite_master where type = 'table'");
  if (v21)
  {
    BOOL v5 = [MEMORY[0x263EFF9C0] set];
    while (1)
    {
      int v6 = sqlite3_step(v20);
      if (v6 != 100) {
        break;
      }
      id v7 = sqlite3_column_text(v20, 0);
      if (v7)
      {
        id v8 = (void *)[[NSString alloc] initWithUTF8String:v7];
        [v5 addObject:v8];
      }
    }
    if (a3) {
      *a3 = v6;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [&unk_26CC40160 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(&unk_26CC40160);
          }
          if (([v5 containsObject:*(void *)(*((void *)&v15 + 1) + 8 * i)] & 1) == 0)
          {
            uint64_t v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[WebBookmarkCollection _verifyAllTablesExist:]();
            }
            BOOL v12 = 0;
            goto LABEL_20;
          }
        }
        uint64_t v9 = [&unk_26CC40160 countByEnumeratingWithState:&v15 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_20:
  }
  else
  {
    BOOL v12 = 0;
    if (a3) {
      *a3 = sqlite3_errcode(self->_db);
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);
  return v12;
}

uint64_t __48__WebBookmarkCollection__setupInMemoryChangeSet__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createInMemoryChangeSet];
}

- (WebBookmarkList)frequentlyVisitedSitesList
{
  return (WebBookmarkList *)[(WebBookmarkCollection *)self listWithSpecialID:5];
}

- (void)_updateSyncNotificationType
{
  v10[2] = *MEMORY[0x263EF8340];
  int64_t v3 = [(WebBookmarkCollection *)self localMigrationState];
  if ((unint64_t)(v3 + 1) > 4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = qword_21C0E8FE0[v3 + 1];
  }
  [(WebBookmarkCollection *)self _setSyncNotificationType:v4];
  if (v3 != self->_lastObservedLocalMigrationState)
  {
    v9[0] = @"fromMigrationState";
    BOOL v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    v9[1] = @"toMigrationState";
    v10[0] = v5;
    int v6 = [NSNumber numberWithInteger:v3];
    v10[1] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"WebBookmarksDetectedLocalMigrationStateTransitionNotification" object:self userInfo:v7];

    self->_lastObservedLocalMigrationState = v3;
  }
}

- (int64_t)localMigrationState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v3 = objc_msgSend((id)objc_opt_class(), "_deviceIdentifierForCloudKitWithCollectionType:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"));
  uint64_t v4 = [v3 UUID];
  BOOL v5 = [v4 UUIDString];

  if ([v5 length])
  {
    int v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138477827;
      uint64_t v14 = v5;
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_DEFAULT, "Looking up migration state for device identifier %{private}@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = [@"_ck_local_migration_state_" stringByAppendingString:v5];
    id v8 = [(WebBookmarkCollection *)self syncStringForKey:v7];
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      uint64_t v14 = v8;
      _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_DEFAULT, "Local migration state read from database %{public}@", (uint8_t *)&v13, 0xCu);
    }
    int64_t v10 = [v8 integerValue];
  }
  else
  {
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_DEFAULT, "Device identifier is empty", (uint8_t *)&v13, 2u);
    }
    int64_t v10 = [v3 encounteredErrorWhileObtainingUUID] << 63 >> 63;
  }

  return v10;
}

+ (id)_deviceIdentifierForCloudKitWithCollectionType:(int64_t)a3
{
  return (id)[a1 deviceIdentifierForCloudKitWithCollectionType:a3 generateIfNeeded:0];
}

- (void)_setSyncNotificationType:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_DEFAULT, "Setting sync notification type: %ld", buf, 0xCu);
  }
  uint64_t v5 = objc_opt_class();
  int v6 = syncLockQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__WebBookmarkCollection_Sync___setSyncNotificationType___block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0lu32l8;
  v7[4] = v5;
  void v7[5] = a3;
  dispatch_barrier_async(v6, v7);
}

- (void)_enumerateContentsOfBookmarkFolder:(int)a3 includingSubfolders:(BOOL)a4 usingBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *, unsigned char *))a5;
  __int16 v19 = self;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  int64_t v9 = [MEMORY[0x263EFF980] array];
  int v20 = [MEMORY[0x263EFF9C0] set];
  uint64_t v10 = [NSNumber numberWithInt:v6];
  [v9 addObject:v10];

  while ([v9 count])
  {
    char v21 = [v9 firstObject];
    [v9 removeObjectAtIndex:0];
    if (([v20 containsObject:v21] & 1) == 0)
    {
      [v20 addObject:v21];
      uint64_t v11 = -[WebBookmarkCollection listWithID:](v19, "listWithID:", [v21 intValue]);
      BOOL v12 = [v11 bookmarkArray];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            char v22 = 0;
            v8[2](v8, v17, &v22);
            if (v22 || !a4)
            {
              if (v22)
              {

                goto LABEL_19;
              }
            }
            else if ([v17 isFolder])
            {
              long long v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "identifier"));
              [v9 addObject:v18];
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_19:
}

- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4 includeHidden:(BOOL)a5
{
  return [(WebBookmarkCollection *)self listWithID:*(void *)&a3 skipOffset:*(void *)&a4 includeHidden:a5 includeDescendantsAsChildren:0 filteredUsingString:0];
}

- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4
{
  return [(WebBookmarkCollection *)self listWithID:*(void *)&a3 skipOffset:*(void *)&a4 includeHidden:0];
}

- (id)listWithID:(int)a3
{
  return [(WebBookmarkCollection *)self listWithID:*(void *)&a3 skipOffset:0];
}

- (id)listWithID:(int)a3 skipOffset:(unsigned int)a4 includeHidden:(BOOL)a5 includeDescendantsAsChildren:(BOOL)a6 filteredUsingString:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = [WebBookmarkListQuery alloc];
  if (v7) {
    uint64_t v14 = v8 | 0x10;
  }
  else {
    uint64_t v14 = v8;
  }
  uint64_t v15 = [(WebBookmarkListQuery *)v13 initWithFolderID:v10 inCollection:self usingFilter:v12 options:v14];
  long long v16 = [[WebBookmarkList alloc] initWithQuery:v15 skipOffset:v9 collection:self];

  return v16;
}

- (BOOL)_restoreMissingSpecialBookmarksWithChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  [(WebBookmarkCollection *)self _createRecoveredBookmarksFolderIfNeeded];
  if ([(WBCollectionConfiguration *)self->_configuration collectionType]) {
    goto LABEL_4;
  }
  BOOL v5 = [(WebBookmarkCollection *)self _restoreBookmarkBarIfMissing];
  if (v5)
  {
    [(WebBookmarkCollection *)self _restoreOrMergeReadingListFolderWithChangeNotification:v3];
    [(WebBookmarkCollection *)self restoreOrMergeAllowedSitesFolderAndContentsWithChangeNotification:v3];
LABEL_4:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_createRecoveredBookmarksFolderIfNeeded
{
  int v3 = [(WebBookmarkCollection *)self bookmarkIDWithSpecialID:6];
  BOOL v4 = [(WebBookmarkCollection *)self maintainsSyncMetadata];
  if (v3 == 0x7FFFFFFF)
  {
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __64__WebBookmarkCollection__createRecoveredBookmarksFolderIfNeeded__block_invoke;
      v6[3] = &unk_2643DA0F8;
      v6[4] = self;
      [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v6 secureDelete:0];
    }
  }
  else if (!v4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM bookmarks WHERE special_id = %d", 6);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:");
  }
}

- (int)bookmarkIDWithSpecialID:(int)a3
{
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT id FROM bookmarks WHERE special_id = %d", *(void *)&a3);
  int v5 = [(WebBookmarkCollection *)self _intFromExecutingSQL:v4];

  if (v5 == -1) {
    return 0x7FFFFFFF;
  }
  else {
    return v5;
  }
}

- (void)restoreOrMergeAllowedSitesFolderAndContentsWithChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    id v7 = +[WBWebFilterSettings sharedWebFilterSettings];
    if ([v7 usesAllowedSitesOnly])
    {
      int v5 = [v7 userSettings];
      uint64_t v6 = [v5 whiteListAllowedSites];
      [(WebBookmarkCollection *)self _restoreOrMergeAllowedSitesFolderAndContentsWithWebFilterAllowedSites:v6 ensureChildCount:1 postChangeNotification:v3];
    }
  }
}

- (BOOL)maintainsSyncMetadata
{
  return 0;
}

- (void)_restoreOrMergeReadingListFolderWithChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    BOOL v24 = v3;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v25, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"title = ? AND parent = 0 AND deleted = 0 ORDER BY order_index ASC"]);
    sqlite3_bind_text(v26, 1, (const char *)[@"com.apple.ReadingList" UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    uint64_t v5 = 0;
    int v6 = 0;
    while (sqlite3_step(v26) == 100)
    {
      id v7 = [WebBookmark alloc];
      BOOL v8 = v26;
      uint64_t v9 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
      uint64_t v10 = [(WebBookmark *)v7 initWithSQLiteStatement:v8 deviceIdentifier:v9 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

      if (v5)
      {
        uint64_t v11 = [(WebBookmarkCollection *)self listWithID:[(WebBookmark *)v10 identifier]];
        int v12 = [v11 bookmarkCount];
        if (v12)
        {
          uint64_t v13 = 0;
          do
          {
            uint64_t v14 = [v11 bookmarkAtIndex:v13];
            uint64_t v15 = [v14 address];
            long long v16 = [(WebBookmarkCollection *)self _firstBookmarkWithURLMatchingString:v15 prefixMatch:0 inParent:v5];

            if (!v16)
            {
              long long v17 = [WebBookmark alloc];
              long long v18 = [v14 title];
              __int16 v19 = [v14 address];
              id v20 = [(WebBookmark *)v17 initReadingListBookmarkWithTitle:v18 address:v19 previewText:0];

              char v21 = [v14 extraAttributes];
              [v20 setExtraAttributes:v21];

              char v22 = [v14 localAttributes];
              [v20 setLocalAttributes:v22];

              [v20 _setParentID:v5];
              [(WebBookmarkCollection *)self _saveBookmark:v20 withSpecialID:0 updateGenerationIfNeeded:1];
            }
            uint64_t v13 = (v13 + 1);
          }
          while (v12 != v13);
        }
        [(WebBookmarkCollection *)self deleteBookmark:v10 leaveTombstone:1];

        int v6 = 1;
      }
      else
      {
        if (![(WebBookmark *)v10 isHidden]
          || ![(WebBookmark *)v10 isReadingListFolder])
        {
          [(WebBookmarkCollection *)self _saveBookmark:v10 withSpecialID:3 updateGenerationIfNeeded:1];
        }
        uint64_t v5 = [(WebBookmark *)v10 identifier];
      }
    }
    if (v5)
    {
      if ((v6 & v24) != 1) {
        goto LABEL_21;
      }
    }
    else
    {
      id v23 = [[WebBookmark alloc] initFolderWithParentID:0 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
      [(WebBookmarkCollection *)self _saveBookmark:v23 withSpecialID:3 updateGenerationIfNeeded:1];

      if (!v24)
      {
LABEL_21:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25);
        return;
      }
    }
    [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
    goto LABEL_21;
  }
}

- (BOOL)_restoreBookmarkBarIfMissing
{
  BOOL v3 = [(WebBookmarkCollection *)self applyInMemoryChangesToDatabase];
  if (v3)
  {
    if (!WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT COUNT(*) FROM bookmarks WHERE special_id = 1", v4))
    {
      if (WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"UPDATE bookmarks SET order_index = order_index + 1 WHERE parent = 0", v5))goto LABEL_9; {
      if (WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"INSERT INTO bookmarks (special_id, parent, type, order_index, editable, deletable, title, external_uuid) VALUES (1, 0, 1, 0, 0, 0, 'BookmarksBar', '')", v6))goto LABEL_9;
      }
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);
      if (WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"UPDATE bookmarks SET num_children = num_children + 1 WHERE id = 0", v8))goto LABEL_9; {
      uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
      }
      uint64_t v10 = [NSNumber numberWithInt:0];
      uint64_t v11 = [v9 arrayWithObject:v10];
      BOOL v12 = [(WebBookmarkCollection *)self _insertAncestorTableEntriesForBookmarkID:insert_rowid withAncestorIDs:v11];

      if (!v12)
      {
LABEL_9:
        LOBYTE(v3) = 0;
        return v3;
      }
      [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

void __56__WebBookmarkCollection_Sync___setSyncNotificationType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _syncFlags];
  [v2 setSyncNotificationType:*(void *)(a1 + 40)];
}

+ (NSString)bookmarkImagesDirectoryPath
{
  id v2 = (void *)+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath;
  if (!+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath)
  {
    BOOL v3 = [(id)objc_opt_class() safariDirectoryPath];
    uint64_t v4 = [v3 stringByAppendingPathComponent:@"BookmarkImages"];
    uint64_t v5 = (void *)+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath;
    +[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath = v4;

    id v2 = (void *)+[WebBookmarkCollection bookmarkImagesDirectoryPath]::bookmarkImagesDirectoryPath;
  }
  return (NSString *)v2;
}

uint64_t __39__WebBookmarkCollection_Sync__lockSync__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) _lockSync];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_createInMemoryChangeSet
{
  id v2 = [WebBookmarkChangeSet alloc];
  id v5 = [(id)objc_opt_class() inMemoryChangesFileURL];
  uint64_t v3 = -[WebBookmarkChangeSet initWithFileURL:](v2, "initWithFileURL:");
  uint64_t v4 = (void *)inMemoryChangeSet;
  inMemoryChangeSet = v3;
}

+ (NSURL)inMemoryChangesFileURL
{
  id v2 = NSURL;
  uint64_t v3 = [a1 safariDirectoryPath];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"bookmarkChanges.plist"];
  id v5 = [v2 fileURLWithPath:v4];

  return (NSURL *)v5;
}

uint64_t __62__WebBookmarkCollection_initWithConfiguration_checkIntegrity___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setupWithPath:*(void *)(a1 + 40) migratingBookmarksPlist:*(void *)(a1 + 48) syncAnchorPlist:*(void *)(a1 + 56) checkIntegrity:*(unsigned __int8 *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (BOOL)_setupWithPath:(id)a3 migratingBookmarksPlist:(id)a4 syncAnchorPlist:(id)a5 checkIntegrity:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = bookmarksCollectionQueue();
  dispatch_assert_queue_V2(v13);

  BOOL v14 = [(WebBookmarkCollection *)self _setupWithPath:v10 checkIntegrity:v6];
  if (v14)
  {
    if ([(WebBookmarkCollection *)self _isDatabaseWriteAllowed])
    {
      if (![(WebBookmarkCollection *)self _migrateBookmarksPlist:v11 syncAnchorPlist:v12])
      {
        uint64_t v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection _setupWithPath:migratingBookmarksPlist:syncAnchorPlist:checkIntegrity:]();
        }
      }
    }
  }

  return v14;
}

- (BOOL)_setupWithPath:(id)a3 checkIntegrity:(BOOL)a4
{
  BOOL v4 = a4;
  v35[6] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = bookmarksCollectionQueue();
  dispatch_assert_queue_V2(v7);

  [(WebBookmarkCollection *)self _setupInMemoryChangeSet];
  BOOL v8 = [(WebBookmarkCollection *)self _isDatabaseWriteAllowed];
  BOOL v9 = v8;
  if (v8
    && [(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    id v10 = [[WBDatabaseLockAcquisitor alloc] initWithWebBookmarkCollectionClass:objc_opt_class()];
    databaseLockAcquisitor = self->_databaseLockAcquisitor;
    self->_databaseLockAcquisitor = v10;

    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor setDelegate:self];
  }
  self->_mergeMode = 0;
  self->_locale = CFLocaleCopyCurrent();
  self->_lastObservedLocalMigrationState = -1;
  v35[0] = 0;
  BOOL v12 = [(WebBookmarkCollection *)self _openDatabaseAtPath:v6 checkIntegrity:v4 error:v35];
  id v13 = v35[0];
  if (!v12)
  {
    if (!v9) {
      goto LABEL_41;
    }
    uint64_t v15 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() isLockedSync];
      objc_msgSend(v13, "wb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.6();
    }

    if ([v13 code] != 26 && objc_msgSend(v13, "code") != 11)
    {
      long long v16 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "wb_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.5();
      }
      goto LABEL_34;
    }
    long long v16 = [MEMORY[0x263F08850] defaultManager];
    char v34 = 0;
    if (([v16 fileExistsAtPath:v6 isDirectory:&v34] & 1) == 0)
    {
      long long v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:].cold.4();
      }
      goto LABEL_34;
    }
    if (v34)
    {
      long long v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:]();
      }
      goto LABEL_34;
    }
    __int16 v19 = [(id)objc_opt_class() _defaultDatabaseFileNameForConfiguration:self->_configuration];
    if ([(WebBookmarkCollection *)self _primaryCollection]
      && ([v6 lastPathComponent],
          id v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v20 isEqualToString:v19],
          v20,
          (v21 & 1) == 0))
    {
      BOOL v29 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _setupWithPath:checkIntegrity:]();
      }
    }
    else
    {
      BOOL v22 = [(WBCollectionConfiguration *)self->_configuration isReadonly];
      BOOL v23 = v22;
      if (!v22 || ([(id)objc_opt_class() lockSync])
        && [(id)objc_opt_class() isLockedSync])
      {
        id v24 = objc_alloc_init(MEMORY[0x263F663B8]);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __55__WebBookmarkCollection__setupWithPath_checkIntegrity___block_invoke;
        v32[3] = &unk_2643DA810;
        BOOL v33 = v23;
        v32[4] = self;
        [v24 setHandler:v32];
        if ([(id)objc_opt_class() _removeCorruptedBookmarksDatabaseAtPath:v6])
        {
          id v31 = v13;
          BOOL v25 = [(WebBookmarkCollection *)self _openDatabaseAtPath:v6 checkIntegrity:v4 error:&v31];
          id v26 = v31;

          if (v25)
          {
            BOOL v27 = [v26 userInfo];
            uint64_t v28 = [v27 objectForKey:*MEMORY[0x263F08320]];

            if (v28) {
              [(WebBookmarkCollection *)self syncSetString:v28 forKey:@"_DatabaseResetReason"];
            }
          }
          else
          {
            uint64_t v28 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v26, "wb_privacyPreservingDescription");
              objc_claimAutoreleasedReturnValue();
              -[WebBookmarkCollection _setupWithPath:checkIntegrity:]();
            }
          }

          id v13 = v26;
        }
        else
        {
          BOOL v25 = 0;
        }

        if (v25) {
          goto LABEL_5;
        }
LABEL_41:
        BOOL v14 = 0;
        goto LABEL_42;
      }
    }

LABEL_34:
    BOOL v14 = 0;
    goto LABEL_35;
  }
LABEL_5:
  if ([(WebBookmarkCollection *)self _primaryCollection]
    && ![(WBCollectionConfiguration *)self->_configuration skipsExternalNotifications])
  {
    [(WebBookmarkCollection *)self _registerForSyncBookmarksFileChangedNotification];
    long long v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:self selector:sel__metaDataFileChanged_ name:@"webBookmarksMetaDataDidChangeNotification" object:0];
    BOOL v14 = 1;
LABEL_35:

    goto LABEL_42;
  }
  BOOL v14 = 1;
LABEL_42:

  return v14;
}

- (BOOL)_primaryCollection
{
  return 1;
}

- (BOOL)_openDatabaseAtPath:(id)a3 checkIntegrity:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [(WebBookmarkCollection *)self _unsafeOpenDatabaseAtPath:v8 checkIntegrity:v6 error:a5];
  if (!v9)
  {
    sqlite3_close(self->_db);
    self->_db = 0;
  }

  return v9;
}

- (void)_setupInMemoryChangeSet
{
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__WebBookmarkCollection__setupInMemoryChangeSet__block_invoke;
    block[3] = &unk_2643DA0D0;
    block[4] = self;
    if (-[WebBookmarkCollection _setupInMemoryChangeSet]::onceToken != -1) {
      dispatch_once(&-[WebBookmarkCollection _setupInMemoryChangeSet]::onceToken, block);
    }
  }
}

- (BOOL)_migrateBookmarksPlist:(id)a3 syncAnchorPlist:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(WBCollectionConfiguration *)self->_configuration collectionType])
  {
    BOOL v9 = [MEMORY[0x263F08850] defaultManager];
    id v10 = v9;
    if (!v6 || ([v9 fileExistsAtPath:v6] & 1) == 0)
    {
      BOOL v8 = 1;
LABEL_26:

      goto LABEL_27;
    }
    WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v22, self->_db);
    if (v22[17])
    {
      if ([(WebBookmarkCollection *)self _importBookmarksPlist:v6])
      {
        id v21 = 0;
        char v11 = [v10 removeItemAtPath:v6 error:&v21];
        id v12 = v21;
        id v13 = v12;
        if (v11)
        {

          if (v7 && [v10 fileExistsAtPath:v7])
          {
            if (![(WebBookmarkCollection *)self _importSyncAnchorPlist:v7])
            {
              id v13 = 0;
              goto LABEL_21;
            }
            id v20 = 0;
            char v16 = [v10 removeItemAtPath:v7 error:&v20];
            id v13 = v20;
            if ((v16 & 1) == 0)
            {
              long long v17 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v13, "wb_privacyPreservingDescription");
                objc_claimAutoreleasedReturnValue();
                -[WebBookmarkCollection _migrateBookmarksPlist:syncAnchorPlist:]();
              }
LABEL_20:

LABEL_21:
              BOOL v8 = 0;
LABEL_24:

              goto LABEL_25;
            }
          }
          else
          {
            id v13 = 0;
          }
          WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v22, v14, v15);
          BOOL v8 = 1;
          goto LABEL_24;
        }
        long long v17 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "wb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection _migrateBookmarksPlist:syncAnchorPlist:]();
        }
        goto LABEL_20;
      }
      long long v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _migrateBookmarksPlist:syncAnchorPlist:]();
      }
    }
    BOOL v8 = 0;
LABEL_25:
    WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v22);
    goto LABEL_26;
  }
  BOOL v8 = 1;
LABEL_27:

  return v8;
}

- (void)_registerForSyncBookmarksFileChangedNotification
{
  [(WebBookmarkCollection *)self _updateSyncNotificationType];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)BookmarksFileChanged, @"com.apple.bookmarks.BookmarksFileChanged", 0, (CFNotificationSuspensionBehavior)1024);
}

uint64_t __43__WebBookmarkCollection_Sync__isLockedSync__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) _isLockedSync];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)_isLockedSync
{
  id v2 = [a1 _syncFlags];
  BOOL v3 = [v2 syncLockFileDescriptor] != -1;

  return v3;
}

+ (BOOL)_lockSync
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 _syncFlags];
  int v4 = [v3 syncLockFileDescriptor];
  id v5 = [a1 _syncLockFileName];
  if (v4 != -1) {
    goto LABEL_2;
  }
  char v11 = [a1 safariDirectoryPath];
  id v12 = [v11 stringByAppendingPathComponent:v5];
  id v13 = (const char *)[v12 UTF8String];

  uint64_t v14 = open(v13, 512, 438);
  uint64_t v15 = v14;
  if (v14 == -1)
  {
    [v3 setUnlockSyncRequested:0];
    char v16 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[WebBookmarkCollection(Sync) _lockSync];
    }
    goto LABEL_5;
  }
  if (flock(v14, 6) != -1)
  {
    [v3 setSyncLockFileDescriptor:v15];
LABEL_2:
    [v3 setUnlockSyncRequested:0];
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v8 = [v7 bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      BOOL v22 = v8;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_DEFAULT, "Process %{public}@ did acquire lock: %{public}@", buf, 0x16u);
    }
LABEL_5:
    BOOL v9 = 1;
    goto LABEL_6;
  }
  long long v17 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    long long v18 = [MEMORY[0x263F086E0] mainBundle];
    __int16 v19 = [v18 bundleIdentifier];
    int v20 = *__error();
    *(_DWORD *)buf = 138543874;
    BOOL v22 = v19;
    __int16 v23 = 2114;
    id v24 = v5;
    __int16 v25 = 1024;
    int v26 = v20;
    _os_log_error_impl(&dword_21C043000, v17, OS_LOG_TYPE_ERROR, "Process %{public}@ did fail to acquire lock: %{public}@ (%d)", buf, 0x1Cu);
  }
  close(v15);
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

+ (void)_unlockSync
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 _syncFlags];
  int v4 = [v3 syncLockFileDescriptor];
  if (v4 != -1)
  {
    id v5 = [v3 lockSyncHoldRequestorPointers];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = [MEMORY[0x263F086E0] mainBundle];
        BOOL v9 = [v8 bundleIdentifier];
        int v14 = 138543362;
        uint64_t v15 = v9;
        _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_DEFAULT, "Postponing unlockSync. The process %{public}@ has requested to hold the lock", (uint8_t *)&v14, 0xCu);
      }
      [v3 setUnlockSyncRequested:1];
    }
    else
    {
      flock(v4, 8);
      close(v4);
      [v3 setSyncLockFileDescriptor:0xFFFFFFFFLL];
      [v3 setUnlockSyncRequested:0];
      if ([v3 postSyncNotificationWhenUnlocking])
      {
        [a1 _postBookmarksChangedSyncNotificationOnSyncQueue];
        [v3 setPostSyncNotificationWhenUnlocking:0];
      }
      id v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        char v11 = [MEMORY[0x263F086E0] mainBundle];
        id v12 = [v11 bundleIdentifier];
        id v13 = [a1 _syncLockFileName];
        int v14 = 138543618;
        uint64_t v15 = v12;
        __int16 v16 = 2114;
        long long v17 = v13;
        _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_DEFAULT, "Process %{public}@ did release lock: %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

+ (id)_syncFlags
{
  if (syncFlagsDictionary(void)::onceToken != -1) {
    dispatch_once(&syncFlagsDictionary(void)::onceToken, &__block_literal_global_199);
  }
  id v3 = (id)syncFlagsDictionary(void)::syncFlagsDictionary;
  int v4 = [v3 objectForKey:a1];
  if (!v4)
  {
    int v4 = -[WebBookmarkCollectionSyncFlags initWithSyncAllowed:]([WebBookmarkCollectionSyncFlags alloc], "initWithSyncAllowed:", [a1 isSyncAllowed]);
    [v3 setObject:v4 forKey:a1];
  }

  return v4;
}

+ (id)_syncLockFileName
{
  return @"com.apple.Bookmarks.lock";
}

- (WebBookmarkCollection)initWithConfiguration:(id)a3 checkIntegrity:(BOOL)a4
{
  id v6 = a3;
  id v7 = bookmarksCollectionQueue();
  dispatch_assert_queue_not_V2(v7);

  v39.receiver = self;
  v39.super_class = (Class)WebBookmarkCollection;
  BOOL v8 = [(WebBookmarkCollection *)&v39 init];
  if (v8)
  {
    MEMORY[0x21D4A0CC0](v38, @"com.apple.WebBookmarks.WebBookmarkCollection");
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (WBCollectionConfiguration *)v9;

    char v11 = [(WBCollectionConfiguration *)v8->_configuration databasePath];
    id v12 = [(id)objc_opt_class() databasePathForConfiguration:v8->_configuration];
    if (v11)
    {
      id v13 = 0;
      int v14 = 0;
    }
    else
    {
      __int16 v16 = [(id)objc_opt_class() safariDirectoryPath];
      long long v17 = [v16 stringByAppendingPathComponent:@"Bookmarks.plist"];
      id v13 = [v17 stringByResolvingSymlinksInPath];

      uint64_t v18 = [v16 stringByAppendingPathComponent:@"Bookmarks.plist.anchor.plist"];
      int v14 = [v18 stringByResolvingSymlinksInPath];
    }
    uint64_t v34 = 0;
    int v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    __int16 v19 = bookmarksCollectionQueue();
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __62__WebBookmarkCollection_initWithConfiguration_checkIntegrity___block_invoke;
    v27[3] = &unk_2643DA838;
    int v32 = &v34;
    int v20 = v8;
    uint64_t v28 = v20;
    id v29 = v12;
    id v30 = v13;
    id v31 = v14;
    BOOL v33 = a4;
    id v21 = v14;
    id v22 = v13;
    id v23 = v12;
    dispatch_sync(v19, v27);

    id v24 = v35;
    v20->_setupFinished = *((unsigned char *)v35 + 24);
    if (*((unsigned char *)v24 + 24)) {
      __int16 v25 = v20;
    }
    else {
      __int16 v25 = 0;
    }
    uint64_t v15 = v25;

    _Block_object_dispose(&v34, 8);
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v38);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)databasePathForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [a1 safariDirectoryPath];
  id v6 = [v4 databasePath];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [a1 _defaultDatabaseFileNameForConfiguration:v4];
    id v10 = [v5 stringByAppendingPathComponent:v9];
    id v8 = [v10 stringByResolvingSymlinksInPath];
  }
  return v8;
}

+ (id)_defaultDatabaseFileNameForConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 collectionType];
  if (v4)
  {
    if (v4 == 1 && (unint64_t v5 = [v3 storeOwner], v5 <= 4)) {
      id v6 = off_2643DAD38[v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = @"Bookmarks.db";
  }

  return v6;
}

+ (WebBookmarkCollection)safariBookmarkCollection
{
  if (+[WebBookmarkCollection safariBookmarkCollection]::onceToken != -1) {
    dispatch_once(&+[WebBookmarkCollection safariBookmarkCollection]::onceToken, &__block_literal_global_230);
  }
  id v2 = (void *)+[WebBookmarkCollection safariBookmarkCollection]::collection;
  if (!+[WebBookmarkCollection safariBookmarkCollection]::collection)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)+[WebBookmarkCollection safariBookmarkCollection]::mutex, 0xFFFFFFFFFFFFFFFFLL);
    if (+[WebBookmarkCollection safariBookmarkCollection]::collection)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)+[WebBookmarkCollection safariBookmarkCollection]::mutex);
LABEL_13:
      id v2 = (void *)+[WebBookmarkCollection safariBookmarkCollection]::collection;
      goto LABEL_14;
    }
    MEMORY[0x21D4A0CC0](v10, @"com.apple.WebBookmarks.WebBookmarkCollection");
    BOOL v3 = +[WebBookmarkCollection isLockedSync];
    if (!v3) {
      +[WebBookmarkCollection lockSync];
    }
    uint64_t v4 = [WebBookmarkCollection alloc];
    unint64_t v5 = +[WBCollectionConfiguration safariBookmarkCollectionConfiguration];
    uint64_t v6 = [(WebBookmarkCollection *)v4 initWithConfiguration:v5 checkIntegrity:0];
    id v7 = (void *)+[WebBookmarkCollection safariBookmarkCollection]::collection;
    +[WebBookmarkCollection safariBookmarkCollection]::collection = v6;

    if (!+[WebBookmarkCollection safariBookmarkCollection]::collection
      && (id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks(), os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)))
    {
      +[WebBookmarkCollection safariBookmarkCollection]();
      if (v3) {
        goto LABEL_12;
      }
    }
    else if (v3)
    {
LABEL_12:
      dispatch_semaphore_signal((dispatch_semaphore_t)+[WebBookmarkCollection safariBookmarkCollection]::mutex);
      SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
      goto LABEL_13;
    }
    +[WebBookmarkCollection unlockSync];
    goto LABEL_12;
  }
LABEL_14:
  return (WebBookmarkCollection *)v2;
}

+ (void)unlockSync
{
  BOOL v3 = syncLockQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WebBookmarkCollection_Sync__unlockSync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_barrier_sync(v3, block);
}

+ (BOOL)lockSync
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = syncLockQueue();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__WebBookmarkCollection_Sync__lockSync__block_invoke;
  v5[3] = &unk_2643DADD8;
  v5[4] = &v6;
  void v5[5] = a1;
  dispatch_barrier_sync(v3, v5);

  LOBYTE(a1) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)a1;
}

+ (BOOL)isLockedSync
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = syncLockQueue();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__WebBookmarkCollection_Sync__isLockedSync__block_invoke;
  v5[3] = &unk_2643DADD8;
  v5[4] = &v6;
  void v5[5] = a1;
  dispatch_sync(v3, v5);

  LOBYTE(a1) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)a1;
}

+ (BOOL)isSyncAllowed
{
  return objc_opt_class() == (void)a1;
}

- (BOOL)_indexBookmarkID:(int)a3 title:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a4;
  if (v6)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20, self->_db, "INSERT INTO bookmark_title_words (bookmark_id, word, word_index) VALUES (?, ?, ?)");
    id v7 = v21;
    unint64_t v8 = [(__CFString *)v6 length];
    if (v8 >= 0x200) {
      CFIndex v9 = 512;
    }
    else {
      CFIndex v9 = v8;
    }
    CFStringRef MutableCopy = CFStringCreateMutableCopy(0, v9, v6);
    [(WebBookmarkCollection *)self _normalizeSearchString:MutableCopy];
    wordTokenizer = self->_wordTokenizer;
    if (!wordTokenizer)
    {
      id v12 = objc_alloc_init(WebBookmarkTitleWordTokenizer);
      id v13 = self->_wordTokenizer;
      self->_wordTokenizer = v12;

      wordTokenizer = self->_wordTokenizer;
    }
    [(WebBookmarkTitleWordTokenizer *)wordTokenizer setString:MutableCopy];
    CFIndex usedBufLen = 0;
    CFIndex v14 = [(WebBookmarkTitleWordTokenizer *)self->_wordTokenizer advanceToNextToken];
    v15.length = v15.location;
    for (int i = 0; ; ++i)
    {
      BOOL v17 = v14 == 0x7FFFFFFFFFFFFFFFLL;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v15.location = v14;
      CFStringGetBytes(MutableCopy, v15, 0x8000100u, 0, 0, buffer, 256, &usedBufLen);
      buffer[usedBufLen] = 0;
      sqlite3_bind_int(v7, 1, a3);
      sqlite3_bind_text(v7, 2, (const char *)buffer, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(v7, 3, i);
      if (sqlite3_step(v7) != 101) {
        break;
      }
      sqlite3_reset(v7);
      sqlite3_clear_bindings(v7);
      CFIndex v14 = [(WebBookmarkTitleWordTokenizer *)self->_wordTokenizer advanceToNextToken];
      v15.length = v15.location;
    }
    CFRelease(MutableCopy);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20);
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)_normalizeSearchString:(__CFString *)a3
{
  CFStringNormalize(a3, kCFStringNormalizationFormD);
  locale = self->_locale;
  CFStringFold(a3, 0x181uLL, locale);
}

- (id)readingListWithUnreadOnly:(BOOL)a3 filteredUsingString:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"web_filter_status != %zd", 2);
  unint64_t v8 = v7;
  if (v4)
  {
    [v7 insertString:@"read = 0 AND " atIndex:0];
    CFIndex v9 = objc_alloc_init(WebBookmarkInMemoryChangeFilterUnreadOnly);
  }
  else
  {
    CFIndex v9 = 0;
  }
  id v10 = [(WebBookmarkCollection *)self _readingListItemsWhere:v8 filteredBy:v6 withInMemoryFilter:v9];

  return v10;
}

- (id)_readingListItemsWhere:(id)a3 filteredBy:(id)a4 withInMemoryFilter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  char v11 = [MEMORY[0x263F089D8] string];
  uint64_t v12 = [(WebBookmarkCollection *)self readingListFolderBookmarkID];
  objc_msgSend(v11, "appendFormat:", @"parent = %d AND deleted = 0", -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
  if (v8) {
    [v11 appendFormat:@" AND %@", v8];
  }
  id v13 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:v11 folderID:v12 orderBy:@"order_index DESC" usingFilter:v9];
  [(WebBookmarkListQuery *)v13 setInMemoryFilter:v10];
  CFIndex v14 = [[WebBookmarkList alloc] initWithQuery:v13 skipOffset:0 collection:self];

  return v14;
}

- (int)readingListFolderBookmarkID
{
  BOOL v3 = (sqlite3 *)objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT id FROM bookmarks WHERE special_id = %d", 3);
  LODWORD(self) = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, v3, v4);

  return (int)self;
}

void __73__WebBookmarkCollection__trackChangesInMemoryIfDatabaseWriteIsNotAllowed__block_invoke()
{
  id v0 = [MEMORY[0x263F086E0] mainBundle];
  -[WebBookmarkCollection _trackChangesInMemoryIfDatabaseWriteIsNotAllowed]::trackChangesInMemory = objc_msgSend(v0, "safari_isSafariFamilyApplicationBundle");
}

uint64_t __49__WebBookmarkCollection_safariBookmarkCollection__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  uint64_t v1 = +[WebBookmarkCollection safariBookmarkCollection]::mutex;
  +[WebBookmarkCollection safariBookmarkCollection]::mutex = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)syncDataForKey:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "SELECT value FROM sync_properties WHERE key = ?");
  if (v10
    && (sqlite3_bind_text(v9, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v9) == 100))
  {
    unint64_t v5 = sqlite3_column_blob(v9, 0);
    id v6 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v5, sqlite3_column_bytes(v9, 0));
  }
  else
  {
    id v6 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return v6;
}

- (id)listWithSpecialID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  unint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT id FROM bookmarks WHERE special_id = %d AND deleted = 0", v3);
  uint64_t v6 = [(WebBookmarkCollection *)self _intFromExecutingSQL:v5];
  if (v6 == -1)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(WebBookmarkCollection *)self listWithID:v6];
  }

  return v7;
}

- (NSArray)purgeableReadingListItems
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WebBookmarkCollection *)self readingListFolderBookmarkID];
  int v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"parent = %d AND deleted = 0 AND read = 1 AND (archive_status = %zd OR archive_status = %zd)", v3, 1, 2);
  id v21 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:v20 orderBy:0 usingFilter:0];
  id v4 = [[WebBookmarkList alloc] initWithQuery:v21 skipOffset:0 collection:self];
  if ([(WebBookmarkList *)v4 bookmarkCount])
  {
    BOOL v17 = v4;
    id v18 = objc_alloc_init(MEMORY[0x263EFF910]);
    id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
    __int16 v19 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v6 setDay:-14];
    id v7 = [v19 dateByAddingComponents:v6 toDate:v18 options:0];
    id v8 = [MEMORY[0x263EFF980] array];
    [(WebBookmarkList *)v4 bookmarkArray];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          CFIndex v14 = [v13 dateLastViewed];
          BOOL v15 = [v14 compare:v7] == -1;

          if (v15) {
            [v8 addObject:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    id v4 = v17;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF8C0] array];
  }

  return (NSArray *)v8;
}

uint64_t __55__WebBookmarkCollection__setupWithPath_checkIntegrity___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = objc_opt_class();
    return [v1 unlockSync];
  }
  return result;
}

+ (BOOL)_removeCorruptedBookmarksDatabaseAtPath:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v3;
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Removing corrupted bookmarks database %{public}@", buf, 0xCu);
  }
  if (![MEMORY[0x263F662A0] hasInternalContent]) {
    goto LABEL_11;
  }
  id v6 = [v3 stringByAppendingPathExtension:@"corrupted"];
  id v7 = objc_msgSend(v4, "_web_pathWithUniqueFilenameForPath:", v6);

  if (([v4 moveItemAtPath:v3 toPath:v7 error:0] & 1) == 0)
  {
    id v8 = NSTemporaryDirectory();
    id v9 = NSString;
    uint64_t v10 = [v3 lastPathComponent];
    uint64_t v11 = [v9 stringWithFormat:@"%@.corrupted", v10];
    uint64_t v12 = [v8 stringByAppendingPathComponent:v11];

    id v13 = objc_msgSend(v4, "_web_pathWithUniqueFilenameForPath:", v12);

    if ([v4 moveItemAtPath:v3 toPath:v13 error:0])
    {
      id v7 = v13;
      goto LABEL_7;
    }

LABEL_11:
    char v15 = objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v3);
    goto LABEL_12;
  }
LABEL_7:
  CFIndex v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v7;
    _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_DEFAULT, "Corrupted bookmarks saved as %{public}@", buf, 0xCu);
  }

  char v15 = 1;
LABEL_12:
  __int16 v16 = [v3 stringByAppendingString:@"-journal"];
  if ([v4 fileExistsAtPath:v16])
  {
    if (objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v16))
    {
      BOOL v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v16;
        _os_log_impl(&dword_21C043000, v17, OS_LOG_TYPE_DEFAULT, "Also removed the journal file %{public}@.", buf, 0xCu);
      }
    }
    else
    {
      id v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:].cold.4();
      }
    }
  }
  __int16 v19 = [v3 stringByAppendingString:@"-wal"];
  if ([v4 fileExistsAtPath:v19])
  {
    if (objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v19))
    {
      int v20 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v19;
        _os_log_impl(&dword_21C043000, v20, OS_LOG_TYPE_DEFAULT, "Also removed the wal file %{public}@.", buf, 0xCu);
      }
    }
    else
    {
      id v21 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:]();
      }
    }
  }
  long long v22 = [v3 stringByAppendingString:@"-shm"];
  if ([v4 fileExistsAtPath:v22])
  {
    if (objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v22))
    {
      long long v23 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v22;
        _os_log_impl(&dword_21C043000, v23, OS_LOG_TYPE_DEFAULT, "Also removed the shm file %{public}@.", buf, 0xCu);
      }
    }
    else
    {
      long long v24 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:]();
      }
    }
  }
  if ((v15 & 1) == 0)
  {
    long long v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[WebBookmarkCollection _removeCorruptedBookmarksDatabaseAtPath:]();
    }
  }

  return v15;
}

- (BOOL)_checkDatabaseIntegrity
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "PRAGMA integrity_check(1)");
  int v2 = v13;
  if ((v13 - 5) > 1)
  {
    if (v12)
    {
      if (sqlite3_step(v11) == 100)
      {
        id v5 = sqlite3_column_text(v11, 0);
        if (v5)
        {
          BOOL v4 = strncmp((const char *)v5, "ok", 3uLL) == 0;
          goto LABEL_15;
        }
        id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection _checkDatabaseIntegrity]();
        }
      }
      else
      {
        id v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection _checkDatabaseIntegrity]();
        }
      }
    }
    else
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _checkDatabaseIntegrity]();
      }
    }
    BOOL v4 = 0;
    goto LABEL_15;
  }
  id v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  BOOL v4 = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = v2;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_INFO, "Skipping integrity check because database is busy or locked (sqlite code = %d)", buf, 8u);
  }
LABEL_15:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v4;
}

+ (WebBookmarkCollection)collectionWithConfiguration:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[WebBookmarkCollection alloc] initWithConfiguration:v3];

  return v4;
}

- (WebBookmarkCollection)initWithConfiguration:(id)a3
{
  return [(WebBookmarkCollection *)self initWithConfiguration:a3 checkIntegrity:0];
}

- (WebBookmarkCollection)initWithPath:(id)a3 migratingBookmarksPlist:(id)a4 syncAnchorPlist:(id)a5
{
  id v6 = a3;
  id v7 = [[WBCollectionConfiguration alloc] initWithCollectionType:0 databasePath:v6 readonly:0];
  id v8 = [(WebBookmarkCollection *)self initWithConfiguration:v7 checkIntegrity:0];

  return v8;
}

+ (NSString)readingListArchivesDirectoryPath
{
  if (+[WebBookmarkCollection readingListArchivesDirectoryPath]::onceToken != -1) {
    dispatch_once(&+[WebBookmarkCollection readingListArchivesDirectoryPath]::onceToken, &__block_literal_global_9);
  }
  int v2 = (void *)+[WebBookmarkCollection readingListArchivesDirectoryPath]::archivePath;
  return (NSString *)v2;
}

void __57__WebBookmarkCollection_readingListArchivesDirectoryPath__block_invoke()
{
  dispatch_semaphore_t v0 = WBSafariContainerPath();
  id v6 = v0;
  if (v0)
  {
    uint64_t v1 = [v0 stringByAppendingPathComponent:@"Library/Caches"];
    int v2 = [v1 stringByAppendingPathComponent:@"com.apple.mobilesafari"];
  }
  else
  {
    uint64_t v1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    if ([v1 count])
    {
      id v3 = [v1 objectAtIndex:0];
      int v2 = [v3 stringByAppendingPathComponent:@"com.apple.mobilesafari"];
    }
    else
    {
      int v2 = 0;
    }
  }

  uint64_t v4 = [v2 stringByAppendingPathComponent:@"ReadingListArchives"];
  id v5 = (void *)+[WebBookmarkCollection readingListArchivesDirectoryPath]::archivePath;
  +[WebBookmarkCollection readingListArchivesDirectoryPath]::archivePath = v4;
}

+ (unint64_t)readingListArchivesDiskUsage
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = [a1 readingListArchivesDirectoryPath];
  id v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 enumeratorAtPath:v2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(v2, "stringByAppendingPathComponent:", *(void *)(*((void *)&v13 + 1) + 8 * v8), (void)v13);
        uint64_t v10 = [v3 attributesOfItemAtPath:v9 error:0];
        uint64_t v11 = [v10 fileSize];

        v5 += v11;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v5;
}

- (void)dealloc
{
  id v3 = bookmarksCollectionQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__WebBookmarkCollection_dealloc__block_invoke;
  block[3] = &unk_2643DA0D0;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WebBookmarkCollection;
  [(WebBookmarkCollection *)&v4 dealloc];
}

void __32__WebBookmarkCollection_dealloc__block_invoke(uint64_t a1)
{
  sqlite3_close(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 24));
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = *(const void **)(a1 + 32);
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, v3);
}

- (BOOL)cleanUpReadingListArchives
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  int v2 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_INFO, "Starting to migrate and clean up Reading List archives", buf, 2u);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET archive_status = ? WHERE archive_status = ? OR archive_status = ?");
  sqlite3_bind_int(v54, 1, 0);
  sqlite3_bind_int(v54, 2, 3);
  sqlite3_bind_int(v54, 3, 4);
  if (sqlite3_step(v54) == 101)
  {
    WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)buf);
    BOOL v42 = [MEMORY[0x263F089D8] string];
    id v3 = [(id)objc_opt_class() readingListArchivesDirectoryPath];
    objc_super v4 = [MEMORY[0x263F08850] defaultManager];
    unint64_t v5 = [v3 stringByAppendingPathComponent:@"PendingBookmarkChanges.plist"];
    objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v5);

    uint64_t v6 = [v4 contentsOfDirectoryAtPath:v3 error:0];
    id v43 = (void *)[v6 mutableCopy];

    unsigned int v37 = [(WebBookmarkCollection *)self readingListFolderBookmarkID];
    char v7 = 0;
    id v8 = 0;
    obuint64_t j = 0;
    do
    {
      context = (void *)MEMORY[0x21D4A0FE0]();
      id v9 = [(WebBookmarkCollection *)self _fastFetchBookmarksInBookmarkFolder:v37 options:0 offset:obj limit:100];

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v8 = v9;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v50 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if ((unint64_t)([v13 archiveStatus] - 1) < 2)
            {
              long long v14 = [v13 UUID];
              long long v15 = [v3 stringByAppendingPathComponent:v14];

              v56[0] = 0;
              char v16 = [v4 fileExistsAtPath:v15 isDirectory:v56];
              if (v56[0]) {
                char v17 = v16;
              }
              else {
                char v17 = 0;
              }
              if (v17)
              {
                uint64_t v18 = [v13 UUID];
                [v43 removeObject:v18];
              }
              else
              {
                uint64_t v19 = [v13 identifier];
                if (v7) {
                  int v20 = @",%d";
                }
                else {
                  int v20 = @"%d";
                }
                objc_msgSend(v42, "appendFormat:", v20, v19);
                char v7 = 1;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v10);
      }

      obj += 100;
    }
    while ([v8 count]);
    if (v7)
    {
      id v21 = [NSString stringWithFormat:@"UPDATE bookmarks SET archive_status = ? WHERE parent = ? AND id IN (%@)", v42];
      db = self->_db;
      id obja = v21;
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v56, db, (const char *)[obja UTF8String]);
      sqlite3_bind_int(*(sqlite3_stmt **)&v57[4], 1, 0);
      sqlite3_bind_int(*(sqlite3_stmt **)&v57[4], 2, v37);
      if (sqlite3_step(*(sqlite3_stmt **)&v57[4]) != 101)
      {
        int v35 = WBS_LOG_CHANNEL_PREFIXDataMigration();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection cleanUpReadingListArchives]();
        }
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v56);
        BOOL v33 = 0;
        goto LABEL_45;
      }
      WebBookmarks::BookmarkSQLStatement::finalize((WebBookmarks::BookmarkSQLStatement *)v56);
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v56);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obja = v43;
    uint64_t v23 = [obja countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(obja);
          }
          uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v27 = [v3 stringByAppendingPathComponent:v26];
          id v44 = 0;
          char v28 = [v4 removeItemAtPath:v27 error:&v44];
          id v29 = v44;
          if ((v28 & 1) == 0)
          {
            id v30 = (id)WBS_LOG_CHANNEL_PREFIXDataMigration();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              uint64_t v31 = objc_msgSend(v29, "wb_privacyPreservingDescription");
              *(_DWORD *)char v56 = 138543618;
              *(void *)int v57 = v26;
              *(_WORD *)&v57[8] = 2114;
              *(void *)&v57[10] = v31;
              int v32 = (void *)v31;
              _os_log_error_impl(&dword_21C043000, v30, OS_LOG_TYPE_ERROR, "Failed to remove Reading List archive directory %{public}@: %{public}@", v56, 0x16u);
            }
          }
        }
        uint64_t v23 = [obja countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v23);
    }
    BOOL v33 = 1;
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v34 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[WebBookmarkCollection cleanUpReadingListArchives]();
  }
  BOOL v33 = 0;
LABEL_46:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  return v33;
}

- (BOOL)markArchivedReadingListItemsAsNonRecoverable
{
  int v2 = self;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"parent = %d AND deleted = 0 AND (archive_status = %zd OR archive_status = %zd)", -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"), 1, 2);
  objc_super v4 = [NSString stringWithFormat:@"UPDATE bookmarks SET archive_status = %zd WHERE %@", 4, v3];
  LOBYTE(v2) = [(WebBookmarkCollection *)v2 _executeSQL:v4] == 0;

  return (char)v2;
}

- (BOOL)clearAllReadingListArchives
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = WBCurrentProcessContainerPath();

  if (v3)
  {
    id v21 = [(id)objc_opt_class() readingListArchivesDirectoryPath];
    objc_super v4 = [MEMORY[0x263F08850] defaultManager];
    id v27 = 0;
    unint64_t v5 = [v4 contentsOfDirectoryAtPath:v21 error:&v27];
    id v6 = v27;
    uint64_t v19 = v5;
    if (v5)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      obuint64_t j = v5;
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v24;
        BOOL v9 = 1;
        do
        {
          uint64_t v10 = 0;
          uint64_t v11 = v6;
          do
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
            long long v13 = [v21 stringByAppendingPathComponent:v12];
            id v22 = v11;
            char v14 = [v4 removeItemAtPath:v13 error:&v22];
            id v6 = v22;

            if ((v14 & 1) == 0)
            {
              long long v15 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                char v16 = objc_msgSend(v6, "wb_privacyPreservingDescription");
                *(_DWORD *)buf = 138543618;
                uint64_t v29 = v12;
                __int16 v30 = 2114;
                uint64_t v31 = v16;
                _os_log_error_impl(&dword_21C043000, v15, OS_LOG_TYPE_ERROR, "Failed to remove Reading List archive directory with UUID %{public}@: %{public}@", buf, 0x16u);
              }
              BOOL v9 = 0;
            }

            ++v10;
            uint64_t v11 = v6;
          }
          while (v7 != v10);
          uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
        }
        while (v7);
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      obuint64_t j = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "wb_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection clearAllReadingListArchives]();
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    char v17 = [(WebBookmarkCollection *)self _safariFetcherServerProxy];
    [v17 clearAllReadingListArchives];

    return 1;
  }
  return v9;
}

- (BOOL)clearReadingListArchiveWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = WBCurrentProcessContainerPath();

  if (v5)
  {
    if ([v4 length])
    {
      id v6 = [(id)objc_opt_class() readingListArchivesDirectoryPath];
      uint64_t v7 = [v6 stringByAppendingPathComponent:v4];

      uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
      char v17 = 0;
      char v9 = [v8 fileExistsAtPath:v7 isDirectory:&v17];
      if (v17) {
        char v10 = v9;
      }
      else {
        char v10 = 0;
      }
      if (v10)
      {
        id v16 = 0;
        char v11 = [v8 removeItemAtPath:v7 error:&v16];
        id v12 = v16;
        if ((v11 & 1) == 0)
        {
          long long v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "wb_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[WebBookmarkCollection clearReadingListArchiveWithUUID:]();
          }
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v14 = [(WebBookmarkCollection *)self _safariFetcherServerProxy];
    [v14 clearReadingListArchiveWithUUID:v4];

    char v11 = 1;
  }

  return v11;
}

- (BOOL)updateReadingListWebFilterStatusForUnsetItemsOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v5 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Migrating Reading List web filter status", buf, 2u);
  }
  id v6 = +[WBWebFilterSettings sharedWebFilterSettings];
  int v20 = [v6 userSettings];

  if (v3)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"web_filter_status = %zd", 0);
    uint64_t v18 = [(WebBookmarkCollection *)self _readingListItemsWhere:v7 filteredBy:0 withInMemoryFilter:0];
  }
  else
  {
    if (([v20 contentFilterOverridesEnabled] & 1) == 0
      && ([v20 whiteListEnabled] & 1) == 0)
    {
      [(WebBookmarkCollection *)self markWebContentFilterAllowsAllReadingListItems];
      goto LABEL_19;
    }
    uint64_t v18 = [(WebBookmarkCollection *)self _readingListItemsWhere:0 filteredBy:0 withInMemoryFilter:0];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [v18 bookmarkArray];
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = NSURL;
        long long v13 = [v11 address];
        char v14 = [v12 URLWithString:v13];
        int v15 = [v20 contentFilterListsAllowURL:v14];

        if (v15) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 2;
        }
        [v11 setWebFilterStatus:v16];
        [(WebBookmarkCollection *)self saveBookmark:v11 startReadingListFetcher:0];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

LABEL_19:
  return 1;
}

- (BOOL)markWebContentFilterAllowsAllReadingListItems
{
  BOOL v3 = WBS_LOG_CHANNEL_PREFIXDataMigration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Starting to mark all Reading List items as allowed by Web Content Filter", buf, 2u);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET web_filter_status = ? WHERE parent = ? AND deleted = 0 AND web_filter_status != ?");
  sqlite3_bind_int(v10, 1, 1);
  sqlite3_bind_int(v10, 2, [(WebBookmarkCollection *)self readingListFolderBookmarkID]);
  sqlite3_bind_int(v10, 3, 1);
  int v4 = sqlite3_step(v10);
  if (v4 == 101)
  {
    unint64_t v5 = WBS_LOG_CHANNEL_PREFIXDataMigration();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Finished marking all Reading List items as allowed by Web Content Filter", v8, 2u);
    }
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXDataMigration();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection markWebContentFilterAllowsAllReadingListItems]();
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  return v4 == 101;
}

- (BOOL)incrementalVacuumIfNeeded
{
  return fmax((double)[(WebBookmarkCollection *)self _intFromExecutingSQL:@"PRAGMA page_count"]* 0.05, 256.0) >= (double)[(WebBookmarkCollection *)self _intFromExecutingSQL:@"PRAGMA freelist_count"]|| [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA incremental_vacuum(256)"] == 0;
}

- (BOOL)vacuum
{
  int v2 = [(WebBookmarkCollection *)self _executeSQLWithCString:"VACUUM"];
  BOOL v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 postNotificationName:@"com.apple.WebBookmarks.DidVacuumDatabaseNotification" object:0];

  return v2 == 0;
}

- (void)localeSettingsChanged
{
  self->_locale = CFLocaleCopyCurrent();
}

- (unint64_t)purgeableSpace
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(WebBookmarkCollection *)self purgeableReadingListItems];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v3 += objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "archiveSize", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return v3;
}

- (unint64_t)purge:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  [(WebBookmarkCollection *)self purgeableReadingListItems];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = 0;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      objc_msgSend(v11, "setArchiveStatus:", 4, (void)v14);
      [v11 setDateLastArchived:v5];
      [(WebBookmarkCollection *)self saveBookmark:v11];
      uint64_t v12 = [v11 archiveSize];
      [v11 clearArchiveSynchronously];
      v7 += v12;
      if (v7 >= a3) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  [(WebBookmarkCollection *)self vacuum];
  return v7;
}

- (id)bookmarkWithID:(int)a3 includingInMemoryChanges:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = [(WebBookmarkCollection *)self bookmarkWithID:*(void *)&a3];
  if (v4)
  {
    BOOL v7 = [(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed];
    if (v6 && v7)
    {
      uint64_t v9 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
      v12[0] = v6;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      [v9 applyModificationsToBookmarks:v10];
    }
  }
  return v6;
}

- (id)validBookmarkUUIDsFromUUIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"SELECT external_uuid FROM bookmarks WHERE deleted = 0 AND external_uuid IN (");
    for (unint64_t i = 0; i < [v4 count]; ++i)
    {
      if (i) {
        [v5 appendString:@","];
      }
      [v5 appendString:@"?"];
    }
    [v5 appendString:@""]);
    ppStmt = 0;
    db = self->_db;
    id v8 = v5;
    if (sqlite3_prepare_v2(db, (const char *)[v8 UTF8String], -1, &ppStmt, 0))
    {
      [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:ppStmt];
      uint64_t v9 = 0;
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __53__WebBookmarkCollection_validBookmarkUUIDsFromUUIDs___block_invoke;
      v13[3] = &__block_descriptor_40_e25_v32__0__NSString_8Q16_B24l;
      void v13[4] = ppStmt;
      [v4 enumerateObjectsUsingBlock:v13];
      uint64_t v9 = [MEMORY[0x263EFF980] array];
      while (sqlite3_step(ppStmt) == 100)
      {
        long long v11 = sqlite3_column_text(ppStmt, 0);
        if (v11)
        {
          uint64_t v12 = (void *)[[NSString alloc] initWithUTF8String:v11];
          if (v12) {
            [v9 addObject:v12];
          }
        }
      }
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

void __53__WebBookmarkCollection_validBookmarkUUIDsFromUUIDs___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = *(sqlite3_stmt **)(a1 + 32);
  id v7 = v5;
  sqlite3_bind_text(v6, a3 + 1, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (WebBookmark)readingListFolder
{
  return (WebBookmark *)[(WebBookmarkCollection *)self bookmarkWithSpecialID:3];
}

- (WebBookmark)webFilterAllowedSitesFolder
{
  return (WebBookmark *)[(WebBookmarkCollection *)self bookmarkWithSpecialID:4];
}

- (id)bookmarkAtPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 count])
  {
    id v6 = [(WebBookmarkCollection *)self rootBookmark];
    goto LABEL_23;
  }
  WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v28, self->_db);
  if (v28[17])
  {
    ppStmt = 0;
    if (!sqlite3_prepare_v2(self->_db, "SELECT id FROM bookmarks WHERE parent = ? AND type = 1 AND title = ? AND deleted = 0", -1, &ppStmt, 0))
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - 1);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      int v8 = 0;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            sqlite3_reset(ppStmt);
            sqlite3_bind_int(ppStmt, 1, v8);
            uint64_t v13 = ppStmt;
            id v14 = v12;
            sqlite3_bind_text(v13, 2, (const char *)objc_msgSend(v14, "UTF8String", (void)v23), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            if (sqlite3_step(ppStmt) != 100)
            {
              [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:ppStmt];

              goto LABEL_20;
            }
            int v8 = sqlite3_column_int(ppStmt, 0);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      sqlite3_finalize(ppStmt);
      ppStmt = [(WebBookmarkCollection *)self _selectBookmarksWhere:@"parent = ? AND title = ? AND deleted = 0 ORDER BY order_index"];
      sqlite3_bind_int(ppStmt, 1, v8);
      long long v15 = ppStmt;
      id v16 = [v5 lastObject];
      sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      if (sqlite3_step(ppStmt) == 100)
      {
        long long v17 = [WebBookmark alloc];
        uint64_t v18 = ppStmt;
        uint64_t v19 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
        id v6 = [(WebBookmark *)v17 initWithSQLiteStatement:v18 deviceIdentifier:v19 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

        sqlite3_finalize(ppStmt);
        WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v28, v20, v21);
      }
      else
      {
        [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:ppStmt];
LABEL_20:
        id v6 = 0;
      }

      goto LABEL_22;
    }
    [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:ppStmt];
  }
  id v6 = 0;
LABEL_22:
  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v28);
LABEL_23:

  return v6;
}

- (WebBookmark)rootBookmark
{
  rootBookmark = self->_rootBookmark;
  if (!rootBookmark)
  {
    id v4 = [(WebBookmarkCollection *)self bookmarkWithID:0];
    id v5 = self->_rootBookmark;
    self->_rootBookmark = v4;

    rootBookmark = self->_rootBookmark;
  }
  return rootBookmark;
}

- (id)subfoldersOfID:(int)a3
{
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"parent = %d AND type = 1 AND deleted = 0 AND hidden = 0 AND hidden_ancestor_count = 0 ORDER BY order_index", *(void *)&a3);
  id v5 = [(WebBookmarkCollection *)self _selectBookmarksWhere:v4];
  id v6 = [MEMORY[0x263EFF980] array];
  while (sqlite3_step(v5) == 100)
  {
    id v7 = [WebBookmark alloc];
    int v8 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    uint64_t v9 = [(WebBookmark *)v7 initWithSQLiteStatement:v5 deviceIdentifier:v8 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    [v6 addObject:v9];
  }
  sqlite3_finalize(v5);

  return v6;
}

- (id)descendantsOfBookmarkFolder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = -[WebBookmarkCollection listWithID:](self, "listWithID:", [v4 identifier]);
  id v7 = [v6 bookmarkArray];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isFolder", (void)v15))
        {
          uint64_t v13 = [(WebBookmarkCollection *)self descendantsOfBookmarkFolder:v12];
          [v5 addObjectsFromArray:v13];
        }
        else
        {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)_descendantIDsOfBookmarkFolderID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF9C0] set];
  [(WebBookmarkCollection *)self _fetchBookmarkIDsInFolder:v3 onlyFolders:0 includingHiddenBookmarks:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = -[WebBookmarkCollection _fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:](self, "_fetchBookmarkIDsInFolder:onlyFolders:includingHiddenBookmarks:", objc_msgSend(v10, "intValue", (void)v16), 0, 0);
        BOOL v12 = [v11 count] == 0;

        if (v12)
        {
          [v5 addObject:v10];
        }
        else
        {
          uint64_t v13 = -[WebBookmarkCollection _descendantIDsOfBookmarkFolderID:](self, "_descendantIDsOfBookmarkFolderID:", [v10 intValue]);
          id v14 = (id)[v5 setByAddingObjectsFromSet:v13];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

- (BOOL)bookmarkContainsLeafBookmark:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isFolder])
  {
    id v5 = -[WebBookmarkCollection listWithID:](self, "listWithID:", [v4 identifier]);
    id v6 = [v5 bookmarkArray];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          if (-[WebBookmarkCollection bookmarkContainsLeafBookmark:](self, "bookmarkContainsLeafBookmark:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            BOOL v11 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_13:
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (unint64_t)leafChildCountForBookmarksInFolderWithID:(int)a3
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "SELECT COUNT(*) FROM bookmarks WHERE parent = ? AND type = 0 AND hidden = 0");
  sqlite3_bind_int(v7, 1, a3);
  if (sqlite3_step(v7) == 100) {
    unint64_t v4 = sqlite3_column_int(v7, 0);
  }
  else {
    unint64_t v4 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (id)leafChildCountForFoldersInFolderWithID:(int)a3
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT parent, count(*) FROM bookmarks WHERE (parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = ?) AND hidden = 0 AND type = 0) GROUP BY parent");
  sqlite3_bind_int(v11, 1, a3);
  while (sqlite3_step(v11) == 100)
  {
    int v6 = sqlite3_column_int(v11, 0);
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", sqlite3_column_int(v11, 1));
    uint64_t v8 = [NSNumber numberWithInteger:v6];
    [v5 setObject:v7 forKeyedSubscript:v8];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v5;
}

- (int)parentIdentifierOfBookmarkWithID:(int)a3
{
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT parent FROM bookmarks WHERE id = %d", *(void *)&a3);
  int v5 = [(WebBookmarkCollection *)self _intFromExecutingSQL:v4];

  if (v5 == -1) {
    return 0;
  }
  else {
    return v5;
  }
}

- (BOOL)getBookmarkType:(BOOL *)a3 andSubtype:(int64_t *)a4 forBookmarkWithID:(int)a5
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, (const char *)objc_msgSend(@"SELECT type, subtype FROM bookmarks WHERE id = ?", "UTF8String"));
  sqlite3_bind_int(v11, 1, a5);
  int v8 = sqlite3_step(v11);
  if (v8 == 100)
  {
    if (a3) {
      *a3 = sqlite3_column_int(v11, 0) != 0;
    }
    if (a4) {
      *a4 = sqlite3_column_int(v11, 1);
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  return v8 == 100;
}

- (int64_t)subtypeOfBookmarkWithID:(int)a3
{
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT subtype FROM bookmarks WHERE id = %d", *(void *)&a3);
  int v5 = [(WebBookmarkCollection *)self _intFromExecutingSQL:v4];

  if (v5 == -1) {
    return 0;
  }
  else {
    return v5;
  }
}

- (id)bookmarksWithSubtype:(int64_t)a3
{
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"subtype = %ld", a3);
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v11, [(WebBookmarkCollection *)self _selectBookmarksWhere:v4]);
  int v5 = [MEMORY[0x263EFF980] array];
  while (sqlite3_step(v12) == 100)
  {
    int v6 = [WebBookmark alloc];
    id v7 = v12;
    int v8 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    uint64_t v9 = [(WebBookmark *)v6 initWithSQLiteStatement:v7 deviceIdentifier:v8 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    [v5 addObject:v9];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v5;
}

- (unint64_t)modifiedAttributesOfBookmark:(id)a3
{
  id v4 = a3;
  db = self->_db;
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT modified_attributes FROM bookmarks WHERE id = %d", objc_msgSend(v4, "identifier"));
  id v6 = objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, db, (const char *)[v6 UTF8String]);

  if (sqlite3_step(v10) == 100) {
    sqlite3_int64 v7 = sqlite3_column_int64(v10, 0);
  }
  else {
    sqlite3_int64 v7 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);

  return v7;
}

- (int)identifierOfBookmarkWithUUID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"SELECT id FROM bookmarks WHERE external_uuid = '%@'", a3];
  int v5 = [(WebBookmarkCollection *)self _intFromExecutingSQL:v4];

  if (v5 == -1) {
    return 0x7FFFFFFF;
  }
  else {
    return v5;
  }
}

- (id)_bookmarkUUIDsInFolderWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  db = self->_db;
  objc_msgSend(NSString, "stringWithFormat:", @"SELECT external_uuid FROM bookmarks WHERE parent = %d ORDER BY order_index ASC", v3);
  id v7 = objc_claimAutoreleasedReturnValue();
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, db, (const char *)[v7 UTF8String]);
  while (1)
  {

    if (sqlite3_step(v10) != 100) {
      break;
    }
    WBUTF8StringFromSQLStatement(v10, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v5 addObject:v7];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v5;
}

- (int)bookmarkIdentifierOfAncestorWithSubtype:(int64_t)a3 forBookmark:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFFA08];
  int v8 = [NSNumber numberWithInteger:a3];
  uint64_t v9 = [v7 setWithObject:v8];
  LODWORD(self) = [(WebBookmarkCollection *)self bookmarkIdentifierOfAncestorWithAnySubtypeInSubtypes:v9 forBookmark:v6];

  return (int)self;
}

- (int)bookmarkIdentifierOfAncestorWithAnySubtypeInSubtypes:(id)a3 forBookmark:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 identifier];
  while (v9 && v9 != 0x7FFFFFFF)
  {
    uint64_t v10 = (void *)MEMORY[0x21D4A0FE0]();
    BOOL v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[WebBookmarkCollection subtypeOfBookmarkWithID:](self, "subtypeOfBookmarkWithID:", v9));
    char v12 = [v7 containsObject:v11];

    if (v12)
    {
      int v13 = 1;
      int v4 = v9;
    }
    else if ([v8 isDeleted])
    {
      long long v14 = [(WebBookmarkCollection *)self syncDataForBookmark:v8];
      long long v15 = [v14 parentRecordID];
      long long v16 = [v15 recordName];
      long long v17 = [(WebBookmarkCollection *)self bookmarkWithServerID:v16 excludeDeletedBookmarks:0];

      uint64_t v9 = [v17 identifier];
      int v13 = 2;
      id v8 = v17;
    }
    else
    {
      uint64_t v9 = [(WebBookmarkCollection *)self parentIdentifierOfBookmarkWithID:v9];
      int v13 = 0;
    }
    if ((v13 | 2) != 2) {
      goto LABEL_12;
    }
  }
  int v4 = 0x7FFFFFFF;
LABEL_12:

  return v4;
}

- (int)bookmarkIdentifierOfFolderAncestorWithSubtype:(int64_t)a3 forBookmark:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [v7 identifier];
  while (v8 && v8 != 0x7FFFFFFF)
  {
    uint64_t v9 = (void *)MEMORY[0x21D4A0FE0]();
    char v17 = 0;
    uint64_t v16 = 0;
    if ([(WebBookmarkCollection *)self getBookmarkType:&v17 andSubtype:&v16 forBookmarkWithID:v8])
    {
      if (v17 && v16 == a3)
      {
        int v10 = 1;
        int v4 = v8;
      }
      else if ([v7 isDeleted])
      {
        BOOL v11 = [(WebBookmarkCollection *)self syncDataForBookmark:v7];
        char v12 = [v11 parentRecordID];
        int v13 = [v12 recordName];
        long long v14 = [(WebBookmarkCollection *)self bookmarkWithServerID:v13 excludeDeletedBookmarks:0];

        uint64_t v8 = [v14 identifier];
        int v10 = 2;
        id v7 = v14;
      }
      else
      {
        uint64_t v8 = [(WebBookmarkCollection *)self parentIdentifierOfBookmarkWithID:v8];
        int v10 = 0;
      }
    }
    else
    {
      int v4 = 0x7FFFFFFF;
      int v10 = 1;
    }
    if ((v10 | 2) != 2) {
      goto LABEL_15;
    }
  }
  int v4 = 0x7FFFFFFF;
LABEL_15:

  return v4;
}

- (WebBookmarkList)rootList
{
  return (WebBookmarkList *)[(WebBookmarkCollection *)self listWithID:0];
}

- (WebBookmarkList)bookmarksBarList
{
  uint64_t v3 = +[WBWebFilterSettings sharedWebFilterSettings];
  int v4 = [v3 usesAllowedSitesOnly];

  if (v4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [(WebBookmarkCollection *)self listWithSpecialID:v5];
  return (WebBookmarkList *)v6;
}

- (id)readingListWithUnreadOnly:(BOOL)a3
{
  return [(WebBookmarkCollection *)self readingListWithUnreadOnly:a3 filteredUsingString:0];
}

- (BOOL)isEmpty
{
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  return WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT COUNT(*) FROM bookmarks WHERE special_id == 0 AND id != 0 AND deleted = 0;",
                         v3) == 0;
}

- (id)_parentIdentifiersOfBookmarksNeedingIcons
{
  uint64_t v3 = [(WebBookmarkCollection *)self favoritesFolder];
  uint64_t v4 = [v3 identifier];

  uint64_t v5 = +[WBWebFilterSettings sharedWebFilterSettings];
  int v6 = [v5 usesAllowedSitesOnly];

  if (v6) {
    uint64_t v4 = [(WebBookmarkCollection *)self webFilterAllowedSitesFolderBookmarkID];
  }
  id v7 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = [NSNumber numberWithInt:v4];
  uint64_t v9 = [v7 arrayWithObject:v8];

  int v10 = [(WebBookmarkCollection *)self frequentlyVisitedSitesFolderBookmarkID];
  if (v10) {
    [v9 addObject:v10];
  }

  return v9;
}

- (BOOL)shouldFetchIconForBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 address];
  if ((objc_msgSend(v5, "_webBookmarks_hasCaseInsensitivePrefix:", @"http") & 1) != 0
    || (objc_msgSend(v5, "_webBookmarks_hasCaseInsensitivePrefix:", @"https") & 1) != 0)
  {
    int v6 = [(WebBookmarkCollection *)self _parentIdentifiersOfBookmarksNeedingIcons];
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "parentID"));
    char v8 = [v6 containsObject:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (WebBookmarkList)bookmarksNeedingIcons
{
  uint64_t v3 = NSString;
  id v4 = [(WebBookmarkCollection *)self _parentIdentifiersOfBookmarksNeedingIcons];
  uint64_t v5 = [v4 componentsJoinedByString:@", "];
  int v6 = [v3 stringWithFormat:@"fetched_icon = 0 AND (url LIKE 'http:%%' OR url LIKE 'https:%%') AND parent IN (%@)", v5];

  id v7 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:v6 orderBy:0 usingFilter:0];
  char v8 = [[WebBookmarkList alloc] initWithQuery:v7 skipOffset:0 collection:self];

  return v8;
}

- (BOOL)markAllFavoritesAsNeedingIcons
{
  uint64_t v3 = NSString;
  id v4 = [(WebBookmarkCollection *)self _parentIdentifiersOfBookmarksNeedingIcons];
  uint64_t v5 = [v4 componentsJoinedByString:@", "];
  int v6 = [v3 stringWithFormat:@"UPDATE bookmarks SET fetched_icon = 0 WHERE parent IN (%@)", v5];

  db = self->_db;
  id v8 = v6;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)[v8 UTF8String]);
  LOBYTE(db) = sqlite3_step(v11) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return (char)db;
}

- (BOOL)deleteAllFavoriteIcons
{
  uint64_t v3 = NSString;
  id v4 = [(WebBookmarkCollection *)self _parentIdentifiersOfBookmarksNeedingIcons];
  uint64_t v5 = [v4 componentsJoinedByString:@", "];
  int v6 = [v3 stringWithFormat:@"UPDATE bookmarks SET icon = NULL, fetched_icon = 0 WHERE parent IN (%@)", v5];

  db = self->_db;
  id v8 = v6;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)[v8 UTF8String]);
  LOBYTE(db) = sqlite3_step(v11) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return (char)db;
}

- (int)webFilterAllowedSitesFolderBookmarkID
{
  uint64_t v3 = (sqlite3 *)objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT id FROM bookmarks WHERE special_id = %d", 4);
  LODWORD(self) = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, v3, v4);

  return (int)self;
}

- (WebBookmarkList)webFilterAllowedSites
{
  return (WebBookmarkList *)[(WebBookmarkCollection *)self listWithSpecialID:4];
}

- (BOOL)saveBookmark:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(WebBookmarkCollection *)self saveBookmark:v4 startReadingListFetcher:[(WBCollectionConfiguration *)self->_configuration collectionType] == 0];

  return (char)self;
}

- (BOOL)saveBookmarks:(id)a3 postNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([(id)objc_opt_class() isLockedSync] & 1) == 0) {
    [(WebBookmarkCollection *)self _simulateCrashWithDescription:@"Trying to save bookmarks without first obtaining the bookmarks database file lock."];
  }
  if ([(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v36, self->_db);
    BOOL v26 = v37 != 0;
    if (v37)
    {
      id v25 = v6;
      id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
      char v9 = 0;
      char v10 = 0;
      if (v8)
      {
        uint64_t v11 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v7);
            }
            int v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if ([(WebBookmarkCollection *)self _saveBookmark:v13 withSpecialID:[(WebBookmarkCollection *)self _specialIDForBookmarkBeingSaved:v13] updateGenerationIfNeeded:1])
            {
              if ([v13 needsSyncUpdate])
              {
                [v13 setNeedsSyncUpdate:0];
                char v9 = 1;
              }
              long long v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "parentID"));
              [v27 addObject:v14];
              BOOL v15 = [v13 specialID] != 0;

              v10 |= v15;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v8);
      }

      WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v36, v16, v17);
      if (v9) {
        [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
      }
      if (v4)
      {
        if (v10) {
          [(WebBookmarkCollection *)self _postBookmarksSpecialFoldersDidChangeNotification];
        }
        if ([v27 count])
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v18 = v27;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v29 != v20) {
                  objc_enumerationMutation(v18);
                }
                -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [*(id *)(*((void *)&v28 + 1) + 8 * j) unsignedIntValue]);
              }
              uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
            }
            while (v19);
          }
        }
      }

      id v6 = v25;
    }
    else
    {
      long long v23 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection saveBookmarks:postNotification:]();
      }
    }
    WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v36);
  }
  else
  {
    long long v22 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection saveBookmarks:postNotification:]();
    }
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)saveBookmark:(id)a3 startReadingListFetcher:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(id)objc_opt_class() isLockedSync] & 1) == 0)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v6 UUID];
      objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection saveBookmark:startReadingListFetcher:]();
    }

    [(WebBookmarkCollection *)self _simulateCrashWithDescription:@"Trying to save a bookmark without first obtaining the bookmarks database file lock."];
  }
  if ([(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    BOOL v8 = [(WebBookmarkCollection *)self _saveBookmark:v6 startReadingListFetcher:v4 forApplyingInMemoryChanges:0];
  }
  else
  {
    char v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection saveBookmarks:postNotification:]();
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_saveBookmark:(id)a3 startReadingListFetcher:(BOOL)a4 forApplyingInMemoryChanges:(BOOL)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  char v17 = __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke;
  id v18 = &unk_2643DA270;
  uint64_t v19 = self;
  id v9 = v8;
  id v20 = v9;
  BOOL v10 = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:&v15 applyInMemoryChanges:0 secureDelete:0];
  if (v10)
  {
    if (objc_msgSend(v9, "needsSyncUpdate", v15, v16, v17, v18, v19))
    {
      [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
      [v9 setNeedsSyncUpdate:0];
    }
    if (!a5)
    {
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v9 parentID]);
      if ([v9 specialID]) {
        [(WebBookmarkCollection *)self _postBookmarksSpecialFoldersDidChangeNotification];
      }
    }
    if (([v9 isReadingListItem] & v6) == 1)
    {
      uint64_t v11 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        char v12 = [v9 UUID];
        *(_DWORD *)buf = 138543362;
        long long v22 = v12;
        _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Starting Reading List fetcher when saving bookmark with UUID %{public}@", buf, 0xCu);
      }
      [(WebBookmarkCollection *)self _startReadingListFetcher];
    }
  }
  else
  {
    int v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "UUID", v15, v16, v17, v18, v19);
      objc_claimAutoreleasedReturnValue();
      -[WebBookmarkCollection _saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:]();
    }
  }
  return v10;
}

uint64_t __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_specialIDForBookmarkBeingSaved:", *(void *)(a1 + 40)), 1);
  if ((v1 & 1) == 0)
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke_cold_1();
    }
  }
  return v1;
}

- (BOOL)deleteBookmark:(id)a3 postChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(WebBookmarkCollection *)self applyInMemoryChangesToDatabase]
    && [(WebBookmarkCollection *)self _deleteBookmark:v6 postChangeNotification:v4 forApplyingInMemoryChanges:0];

  return v7;
}

- (void)_deleteIconForBookmark:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 readingListIconUUID];
  if (v3)
  {
    BOOL v4 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v5 = [(id)objc_opt_class() bookmarkImagesDirectoryPath];
    if ([v4 fileExistsAtPath:v5 isDirectory:0])
    {
      id v6 = [v5 stringByAppendingPathComponent:v3];
      id v12 = 0;
      char v7 = [v4 removeItemAtPath:v6 error:&v12];
      id v8 = v12;
      if (v7)
      {
        id v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Deleted bookmark icon successfully", buf, 2u);
        }
      }
      else
      {
        uint64_t v11 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "wb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection _deleteIconForBookmark:]();
        }
      }
    }
    else
    {
      BOOL v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _deleteIconForBookmark:]();
      }
    }
  }
}

- (BOOL)deleteBookmarks:(id)a3 postChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v9 &= -[WebBookmarkCollection deleteBookmark:postChangeNotification:](self, "deleteBookmark:postChangeNotification:", *(void *)(*((void *)&v12 + 1) + 8 * i), v4, (void)v12);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_deleteBookmark:(id)a3 postChangeNotification:(BOOL)a4 forApplyingInMemoryChanges:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13, self->_db);
  if (v13[17]
    && -[WebBookmarkCollection deleteBookmark:leaveTombstone:](self, "deleteBookmark:leaveTombstone:", v8, [v8 specialID] != 5))
  {
    WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v13, v9, v10);
    if (v6) {
      [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
    }
    if (!a5) {
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v8 parentID]);
    }
    if ([v8 isReadingListItem])
    {
      [v8 clearArchive];
      [(WebBookmarkCollection *)self _deleteIconForBookmark:v8];
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13);

  return v11;
}

- (BOOL)deleteBookmark:(id)a3
{
  return [(WebBookmarkCollection *)self deleteBookmark:a3 postChangeNotification:1];
}

- (BOOL)_moveBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  BOOL v7 = [(WebBookmarkCollection *)self _moveBookmark:v6 toFolderWithID:v4 detectCycles:1]&& [(WebBookmarkCollection *)self _incrementGeneration];

  return v7;
}

- (BOOL)moveBookmark:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v15 = (int)[v6 identifier];
    __int16 v16 = 1024;
    int v17 = [v6 parentID];
    __int16 v18 = 2048;
    uint64_t v19 = (int)v4;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Moving bookmark with identifier %ld and parent ID %d to folder with identifier %ld", buf, 0x1Cu);
  }

  uint64_t v8 = [v6 parentID];
  if (v8 == v4) {
    goto LABEL_9;
  }
  if (([v6 isInserted] & 1) == 0)
  {
    [v6 _setParentID:v4];
LABEL_9:
    BOOL v9 = 1;
    goto LABEL_10;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__WebBookmarkCollection_moveBookmark_toFolderWithID___block_invoke;
  v11[3] = &unk_2643DA880;
  v11[4] = self;
  id v12 = v6;
  int v13 = v4;
  BOOL v9 = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v11 secureDelete:0];
  if (v9)
  {
    [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v8];
    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v4];
  }

LABEL_10:
  return v9;
}

uint64_t __53__WebBookmarkCollection_moveBookmark_toFolderWithID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _moveBookmark:*(void *)(a1 + 40) toFolderWithID:*(unsigned int *)(a1 + 48)];
}

- (BOOL)moveBookmark:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13, self->_db);
  if (v13[17]
    && [(WebBookmarkCollection *)self _moveBookmark:v8 fromIndex:v6 toIndex:v5])
  {
    WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v13, v9, v10);
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v13);

  return v11;
}

- (BOOL)_moveBookmark:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    int v20 = [v8 identifier];
    LOWORD(v21) = 1024;
    *(_DWORD *)((char *)&v21 + 2) = [v8 parentID];
    HIWORD(v21) = 1024;
    unsigned int v22 = a5;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Moving bookmark with ID %d and parent ID %d to index %d", buf, 0x14u);
  }

  if (a5 >= a4) {
    BOOL v10 = "UPDATE bookmarks SET order_index = order_index - 1 WHERE order_index > ? AND order_index <= ? AND parent = ?";
  }
  else {
    BOOL v10 = "UPDATE bookmarks SET order_index = order_index + 1 WHERE order_index < ? AND order_index >= ? AND parent = ?";
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, v10);
  sqlite3_bind_int(v21, 1, a4);
  sqlite3_bind_int(v21, 2, a5);
  sqlite3_bind_int(v21, 3, [v8 parentID]);
  if (sqlite3_step(v21) == 101)
  {
    BOOL v11 = [NSString stringWithFormat:@"UPDATE bookmarks SET order_index = ?1, dav_generation = ?2%@ WHERE id = ?3", @", modified_attributes = modified_attributes | ?4"];
    db = self->_db;
    id v13 = v11;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, db, (const char *)[v13 UTF8String]);
    sqlite3_bind_int(v18, 1, a5);
    sqlite3_bind_int(v18, 2, [(WebBookmarkCollection *)self currentRecordGeneration]);
    sqlite3_bind_int(v18, 3, [v8 identifier]);
    sqlite3_bind_int64(v18, 4, 4);
    int v14 = sqlite3_step(v18);
    BOOL v15 = v14 == 101;
    if (v14 == 101) {
      [(WebBookmarkCollection *)self _incrementGeneration];
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);
  }
  else
  {
    BOOL v15 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);

  return v15;
}

- (BOOL)reorderBookmark:(id)a3 toIndex:(unsigned int)a4
{
  unint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [v6 orderIndex];
  if (v7 != v4)
  {
    if (![(WebBookmarkCollection *)self applyInMemoryChangesToDatabase]) {
      goto LABEL_15;
    }
    if ([v6 isSyncable]
      && [(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      uint64_t v9 = [v6 parentID];
      BOOL v10 = [NSNumber numberWithUnsignedInt:v7];
      BOOL v11 = [NSNumber numberWithUnsignedInt:v4];
      id v12 = -[WebBookmarkCollection _generateSyncPositionForOrderIndex:inFolderWithID:direction:](self, "_generateSyncPositionForOrderIndex:inFolderWithID:direction:", v4, v9, [v10 compare:v11]);
      [v6 setSyncPosition:v12];
    }
    if ([(WebBookmarkCollection *)self maintainsSyncMetadata]) {
      [(WebBookmarkCollection *)self _mergeBookmarkIntoPersistedBookmark:v6 forAttributes:4];
    }
    if ([v6 isSyncable]
      && [(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      id v13 = [v6 syncPosition];
      unsigned int v14 = -[WebBookmarkCollection orderIndexOfBookmark:withSyncPosition:inFolderWithID:](self, "orderIndexOfBookmark:withSyncPosition:inFolderWithID:", v6, v13, [v6 parentID]);

      unint64_t v4 = (__PAIR64__(v14, v7) - v14) >> 32;
    }
    [v6 _setOrderIndex:v4];
    if (!-[WebBookmarkCollection moveBookmark:fromIndex:toIndex:](self, "moveBookmark:fromIndex:toIndex:", v6, v7, [v6 orderIndex])|| !-[WebBookmarkCollection updateBookmarkSyncPositionIfNeeded:](self, "updateBookmarkSyncPositionIfNeeded:", v6))
    {
LABEL_15:
      BOOL v8 = 0;
      goto LABEL_16;
    }
    [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v6 parentID]);
  }
  BOOL v8 = 1;
LABEL_16:

  return v8;
}

- (BOOL)reorderList:(id)a3 moveBookmarkAtIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (v6 == v5)
  {
    BOOL v9 = 1;
  }
  else if ([(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    BOOL v10 = [v8 bookmarkAtIndex:v6];
    if (!v10) {
      goto LABEL_10;
    }
    [v8 _moveBookmarkAtIndex:v6 toIndex:v5];
    if ([(WebBookmarkCollection *)self maintainsSyncMetadata]) {
      [(WebBookmarkCollection *)self _mergeBookmarkIntoPersistedBookmark:v10 forAttributes:4];
    }
    BOOL v11 = [v8 bookmarkAtIndex:v5];
    BOOL v12 = -[WebBookmarkCollection moveBookmark:fromIndex:toIndex:](self, "moveBookmark:fromIndex:toIndex:", v10, v6, [v11 orderIndex]);

    if (v12)
    {
      [(WebBookmarkCollection *)self _postBookmarksChangedSyncNotification];
      -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v10 parentID]);
      BOOL v9 = 1;
    }
    else
    {
LABEL_10:
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)saveArchiveForReadingListBookmarkWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(id)objc_opt_class() isLockedSync])
  {
    uint64_t v5 = [(WebBookmarkCollection *)self bookmarkWithID:v3];
    uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v5 UUID];
      int v9 = 138543362;
      BOOL v10 = v7;
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "Saving offline Reading List archive for bookmark with UUID %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [v5 setShouldArchive:1];
    [(WebBookmarkCollection *)self saveBookmark:v5 startReadingListFetcher:1];
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection saveArchiveForReadingListBookmarkWithID:]();
    }
  }
}

- (void)saveArchivesForReadingListBookmarks:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setShouldArchive:", 1, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(WebBookmarkCollection *)self saveBookmarks:v4 postNotification:1];
}

- (void)deleteArchiveForReadingListBookmarkWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(id)objc_opt_class() isLockedSync])
  {
    id v6 = [(WebBookmarkCollection *)self bookmarkWithID:v3];
    [v6 setShouldArchive:0];
    uint64_t v5 = [v6 UUID];
    [(WebBookmarkCollection *)self clearReadingListArchiveWithUUID:v5];

    [(WebBookmarkCollection *)self saveBookmark:v6 startReadingListFetcher:0];
  }
}

- (void)saveIconWithData:(id)a3 urlString:(id)a4 forBookmark:(id)a5
{
  v25[6] = *(id *)MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = v10;
  if (v10)
  {
    BOOL v12 = [v10 readingListIconUUID];
    if (v12)
    {
      [(WebBookmarkCollection *)self _deleteIconForBookmark:v11];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F08C38] UUID];
      uint64_t v14 = [v13 UUIDString];

      [v11 setReadingListIconUUID:v14];
      BOOL v12 = (void *)v14;
    }
    BOOL v15 = [(id)objc_opt_class() bookmarkImagesDirectoryPath];
    __int16 v16 = [v15 stringByAppendingPathComponent:v12];
    int v17 = [MEMORY[0x263F08850] defaultManager];
    if (([v17 fileExistsAtPath:v15 isDirectory:0] & 1) == 0)
    {
      v25[0] = 0;
      char v18 = [v17 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:v25];
      id v19 = v25[0];
      if ((v18 & 1) == 0)
      {
        int v20 = (id)WBS_LOG_CHANNEL_PREFIXReadingListIcons();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "wb_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WebBookmarkCollection saveIconWithData:urlString:forBookmark:]();
        }
      }
    }
    [v11 setReadingListIconURL:v9];
    [v11 setFetchedIconData:1];
    id v24 = 0;
    char v21 = [v8 writeToFile:v16 options:1 error:&v24];
    id v22 = v24;
    if ((v21 & 1) == 0)
    {
      uint64_t v23 = (id)WBS_LOG_CHANNEL_PREFIXReadingListIcons();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "wb_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection saveIconWithData:urlString:forBookmark:]();
      }
    }
  }
}

- (void)saveAndMoveBookmark:(id)a3 toFolderID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 isInserted])
  {
    uint64_t v7 = -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", [v6 identifier]);

    if (v7) {
      goto LABEL_6;
    }
    id v8 = [WebBookmark alloc];
    id v9 = [v6 title];
    id v10 = [v6 address];
    uint64_t v11 = [(WebBookmark *)v8 initWithTitle:v9 address:v10 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    uint64_t v20 = v11;
    BOOL v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    BOOL v13 = [(WebBookmarkCollection *)self saveBookmarks:v12 postNotification:0];

    if (v13)
    {
      id v6 = (id)v11;
      goto LABEL_6;
    }
    char v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection saveAndMoveBookmark:toFolderID:]();
    }
    id v6 = (id)v11;
  }
  else
  {
    v21[0] = v6;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    BOOL v15 = [(WebBookmarkCollection *)self saveBookmarks:v14 postNotification:0];

    if (v15)
    {
LABEL_6:
      if (![(WebBookmarkCollection *)self moveBookmark:v6 toFolderWithID:v4])
      {
        __int16 v16 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection saveAndMoveBookmark:toFolderID:](v19, [v6 identifier], v4, v16);
        }
      }
      goto LABEL_15;
    }
    int v17 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection saveAndMoveBookmark:toFolderID:]();
    }
  }
LABEL_15:
}

- (BOOL)_saveAndMoveBookmark:(id)a3 toFolderID:(int)a4 orderIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  BOOL v9 = [(WebBookmarkCollection *)self _saveBookmark:v8 withSpecialID:[(WebBookmarkCollection *)self _specialIDForBookmarkBeingSaved:v8] updateGenerationIfNeeded:1]&& (LOBYTE(v11) = 0, [(WebBookmarkCollection *)self _moveBookmark:v8 toFolderWithID:v6 orderIndex:v5 detectCycles:1 incrementGeneration:1 shouldMerge:1 generateSyncPositionIfNeeded:v11])&& [(WebBookmarkCollection *)self _incrementGeneration];

  return v9;
}

- (BOOL)_saveAndMoveBookmarks:(id)a3 toFolderID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if (!-[WebBookmarkCollection _saveAndMoveBookmark:toFolderID:](self, "_saveAndMoveBookmark:toFolderID:", *(void *)(*((void *)&v12 + 1) + 8 * i), v4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)updateBookmarks:(id)a3 inFolderWithID:(int)a4 secureDelete:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__WebBookmarkCollection_updateBookmarks_inFolderWithID_secureDelete___block_invoke;
  v11[3] = &unk_2643DA880;
  v11[4] = self;
  id v12 = v8;
  int v13 = a4;
  id v9 = v8;
  LOBYTE(v5) = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v11 secureDelete:v5];

  return v5;
}

uint64_t __69__WebBookmarkCollection_updateBookmarks_inFolderWithID_secureDelete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBookmarks:*(void *)(a1 + 40) inFolderWithID:*(unsigned int *)(a1 + 48)];
}

- (BOOL)_updateBookmarks:(id)a3 inFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v27 = [(WebBookmarkCollection *)self _bookmarkUUIDsInFolderWithID:v4];
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke;
  v48[3] = &unk_2643DA8D0;
  id v28 = v7;
  id v49 = v28;
  id v8 = objc_msgSend(v27, "safari_splitArrayUsingCondition:", v48);
  long long v30 = [v8 first];
  long long v29 = [v8 second];
  id v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v6 count];
    uint64_t v11 = [v30 count];
    uint64_t v12 = [v29 count];
    *(_DWORD *)buf = 134218752;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v11;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v12;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Update %zu bookmarks with folder ID %d. There are %zu current bookmarks, and %zu will be deleted", buf, 0x26u);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v29;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        char v18 = (void *)MEMORY[0x21D4A0FE0]();
        id v19 = [(WebBookmarkCollection *)self bookmarkWithUUID:v17];
        [(WebBookmarkCollection *)self deleteBookmark:v19 leaveTombstone:1];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v14);
  }

  uint64_t v20 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v30];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_401;
  v42[3] = &unk_2643DA8F8;
  id v21 = v20;
  id v43 = v21;
  id v22 = objc_msgSend(v6, "safari_longestIncreasingSubsequenceUsingValues:", v42);
  uint64_t v23 = [MEMORY[0x263EFFA08] setWithArray:v22];
  uint64_t v38 = 0;
  objc_super v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)&uint8_t buf[24] = __Block_byref_object_copy__2;
  *(void *)&buf[32] = __Block_byref_object_dispose__2;
  id v51 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403;
  v31[3] = &unk_2643DA948;
  id v32 = v23;
  long long v33 = self;
  long long v35 = buf;
  uint64_t v36 = &v38;
  id v24 = v21;
  id v34 = v24;
  int v37 = v4;
  id v25 = v23;
  [v6 enumerateObjectsUsingBlock:v31];
  LOBYTE(v21) = *((unsigned char *)v39 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v38, 8);

  return (char)v21;
}

uint64_t __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2;
  v8[3] = &unk_2643DA8A8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "safari_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_401(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 UUID];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
  }

  return v7;
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = (void *)MEMORY[0x21D4A0FE0]();
  id v8 = objc_alloc_init(MEMORY[0x263F663B8]);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2_404;
  char v18 = &unk_2643DA920;
  uint64_t v20 = *(void *)(a1 + 56);
  id v9 = v6;
  id v19 = v9;
  [v8 setHandler:&v15];
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9, v15, v16, v17, v18))
  {
    if ([v9 modifiedAttributes]
      && ([*(id *)(a1 + 40) _saveBookmark:v9 withSpecialID:0 updateGenerationIfNeeded:1] & 1) == 0)
    {
      uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = [v9 UUID];
    LOBYTE(v11) = [v11 containsObject:v12];

    if ((v11 & 1) == 0
      && ([*(id *)(a1 + 40) _saveAndMoveBookmark:v9 toFolderID:*(unsigned int *)(a1 + 72)] & 1) == 0)
    {
      id v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(a1 + 40) _errorForMostRecentSQLiteError];
        objc_claimAutoreleasedReturnValue();
        __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403_cold_4();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
    objc_msgSend(v9, "_setOrderIndex:", objc_msgSend(*(id *)(a1 + 40), "orderIndexOfBookmark:", v9));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "_setOrderIndex:", objc_msgSend(*(id *)(a1 + 40), "orderIndexOfBookmark:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)));
    if (([*(id *)(a1 + 40) _reorderBookmark:v9 afterBookmark:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0)
    {
      uint64_t v14 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(a1 + 40) _errorForMostRecentSQLiteError];
        objc_claimAutoreleasedReturnValue();
        __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403_cold_3();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
    if (([v9 modifiedAttributes] & 0xFFFFFFFFFFFFFFFBLL) != 0
      && ([*(id *)(a1 + 40) _saveBookmark:v9 withSpecialID:0 updateGenerationIfNeeded:1] & 1) == 0)
    {
      uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        [*(id *)(a1 + 40) _errorForMostRecentSQLiteError];
        objc_claimAutoreleasedReturnValue();
        __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403_cold_1();
      }
LABEL_19:

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_2_404(uint64_t a1)
{
}

- (BOOL)fixCachedNumberOfChildrenIfNeeded
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->_db, "SELECT id, parent, num_children, (SELECT COUNT(*) FROM bookmarks AS child_bookmark WHERE child_bookmark.parent = parent_bookmark.id AND hidden = 0) AS real_num_children FROM bookmarks AS parent_bookmark WHERE num_children != real_num_children");
  char v3 = 0;
  while (sqlite3_step(v14) == 100)
  {
    int v4 = sqlite3_column_int(v14, 0);
    int v5 = sqlite3_column_int(v14, 1);
    int v6 = sqlite3_column_int(v14, 2);
    int v7 = sqlite3_column_int(v14, 3);
    id v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      int v22 = v4;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v5;
      HIWORD(v23) = 1024;
      int v24 = v6;
      __int16 v25 = 1024;
      int v26 = v7;
      _os_log_error_impl(&dword_21C043000, v8, OS_LOG_TYPE_ERROR, "Number of children mismatch detected for bookmark with id: %d, parent: %d, expected number of children: %d, actual: %d", buf, 0x1Au);
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET num_children = ? WHERE id = ?");
    sqlite3_bind_int(v23, 1, v7);
    sqlite3_bind_int(v23, 2, v4);
    int v9 = sqlite3_step(v23);
    if (v9 != 101)
    {
      uint64_t v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = sqlite3_errmsg(self->_db);
        *(_DWORD *)uint64_t v15 = 67109634;
        int v16 = v4;
        __int16 v17 = 1024;
        int v18 = v9;
        __int16 v19 = 2082;
        uint64_t v20 = v11;
        _os_log_error_impl(&dword_21C043000, v10, OS_LOG_TYPE_ERROR, "Could not fix number of children of folder with id: %d, error: %d, %{public}s", v15, 0x18u);
      }
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
    char v3 = 1;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);
  return v3 & 1;
}

- (sqlite3_stmt)_prefixSearch:(id)a3 usingColumns:(const char *)a4 maxCount:(unsigned int)a5
{
  id v8 = a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  if (!a4) {
    a4 = "DISTINCT url";
  }
  ppStmt = 0;
  if ([v8 length])
  {
    int v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT %s FROM bookmarks WHERE type = 0 AND url >= ? AND url < ? AND deleted = 0 LIMIT ?", a4);
    db = self->_db;
    id v11 = v9;
    if (!sqlite3_prepare_v2(db, (const char *)[v11 UTF8String], -1, &ppStmt, 0))
    {
      __int16 v21 = objc_msgSend(v8, "characterAtIndex:", objc_msgSend(v8, "length") - 1) + 1;
      uint64_t v12 = [MEMORY[0x263F089D8] stringWithString:v8];
      uint64_t v13 = [v12 length];
      uint64_t v14 = [NSString stringWithCharacters:&v21 length:1];
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v13 - 1, 1, v14);

      sqlite3_bind_text(ppStmt, 1, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      uint64_t v15 = ppStmt;
      id v16 = v12;
      sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(ppStmt, 3, a5);

LABEL_9:
      __int16 v19 = ppStmt;
      goto LABEL_10;
    }
  }
  else
  {
    __int16 v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT %s FROM bookmarks WHERE type = 0 AND deleted = 0 LIMIT ?", a4);
    int v18 = self->_db;
    id v11 = v17;
    if (!sqlite3_prepare_v2(v18, (const char *)[v11 UTF8String], -1, &ppStmt, 0))
    {
      sqlite3_bind_int(ppStmt, 1, a5);
      goto LABEL_9;
    }
  }

  __int16 v19 = 0;
LABEL_10:

  return v19;
}

- (id)bookmarksMatchingString:(id)a3
{
  id v4 = a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  int v5 = [MEMORY[0x263EFF980] array];
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "SELECT id, title, url FROM bookmarks WHERE type = 0 AND deleted = 0", -1, &ppStmt, 0))
  {
    [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:ppStmt];

    int v5 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_12;
  }
  while (sqlite3_step(ppStmt) == 100)
  {
    int v6 = sqlite3_column_text(ppStmt, 1);
    if (v6)
    {
      int v7 = (void *)[[NSString alloc] initWithUTF8String:v6];
      [v7 rangeOfString:v4 options:385];
      if (!v8)
      {

        goto LABEL_7;
      }
LABEL_9:
      id v11 = [(WebBookmarkCollection *)self bookmarkWithID:sqlite3_column_int(ppStmt, 0)];
      [v5 addObject:v11];

LABEL_10:
    }
    else
    {
LABEL_7:
      int v9 = sqlite3_column_text(ppStmt, 2);
      if (v9)
      {
        int v7 = (void *)[[NSString alloc] initWithUTF8String:v9];
        [v7 rangeOfString:v4 options:385];
        if (!v10) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }
  sqlite3_finalize(ppStmt);
LABEL_12:

  return v5;
}

- (void)_enumerateBookmarksForMatchStatement:(id)a3 normalizedQuery:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, unsigned __int8 *, uint64_t, unsigned char *))a5;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  db = self->_db;
  id v12 = v8;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18, db, (const char *)[v12 UTF8String]);
  uint64_t v13 = v19;
  id v14 = v9;
  sqlite3_bind_text(v13, 1, (const char *)[v14 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  while (sqlite3_step(v19) == 100)
  {
    uint64_t v15 = (unsigned __int8 *)sqlite3_column_text(v19, 2);
    if (v15) {
      uint64_t v15 = (unsigned __int8 *)[[NSString alloc] initWithUTF8String:v15];
    }
    id v16 = sqlite3_column_text(v19, 1);
    if (v16) {
      uint64_t v17 = [[NSString alloc] initWithUTF8String:v16];
    }
    else {
      uint64_t v17 = 0;
    }
    if ((unint64_t)v15 | v17) {
      v10[2](v10, v15, v17, v18);
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18);
}

- (void)_enumerateBookmarksMatchingString:(id)a3 statementSuffix:(id)a4 usingBlock:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v33 = a4;
  id v29 = a5;
  long long v30 = v8;
  uint64_t v27 = (void *)[v8 mutableCopy];
  [(WebBookmarkCollection *)self _normalizeSearchString:v27];
  id v9 = v27;
  if (prefixEndingWithFirstWordOfString(NSString *)::once != -1) {
    dispatch_once(&prefixEndingWithFirstWordOfString(NSString *)::once, &__block_literal_global_1815);
  }
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x4012000000;
  long long v50 = __Block_byref_object_copy__1817;
  id v51 = __Block_byref_object_dispose__1818;
  long long v52 = &unk_21C10D019;
  uint64_t v10 = prefixEndingWithFirstWordOfString(NSString *)::tokenizerAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZL33prefixEndingWithFirstWordOfStringP8NSString_block_invoke_1820;
  block[3] = &unk_2643DAD18;
  id v11 = v9;
  id v45 = v11;
  long long v46 = &v47;
  dispatch_sync(v10, block);
  id v12 = 0;
  uint64_t v13 = v48[6];
  id v14 = v11;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [v11 substringToIndex:v48[7] + v13];
    id v12 = v11;
  }
  id v28 = v11;

  _Block_object_dispose(&v47, 8);
  long long v31 = [v14 stringByAppendingString:@"%"];

  uint64_t v15 = NSString;
  id v16 = BookmarkSQLiteColumns();
  id v32 = [v15 stringWithFormat:@"SELECT %@ FROM bookmarks INNER JOIN bookmark_title_words ON bookmarks.id = bookmark_title_words.bookmark_id WHERE bookmark_title_words.word LIKE ? AND type = 0 AND deleted = 0 AND web_filter_status != %zd AND title IS NOT NULL AND url IS NOT NULL AND url != \"\" %@", v16, 2, v33];

  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA case_sensitive_like = true"];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke;
  v42[3] = &unk_2643DA998;
  id v17 = v29;
  void v42[4] = self;
  id v43 = v17;
  [(WebBookmarkCollection *)self _enumerateBookmarksForMatchStatement:v32 normalizedQuery:v31 usingBlock:v42];
  int v18 = NSString;
  __int16 v19 = BookmarkSQLiteColumns();
  long long v35 = [v18 stringWithFormat:@"SELECT %@ FROM bookmarks WHERE url LIKE ? AND type = 0 AND deleted = 0 AND web_filter_status != %zd AND title IS NOT NULL AND url IS NOT NULL %@", v19, 2, v33];

  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA case_sensitive_like = false"];
  objc_msgSend(v8, "_web_possibleURLPrefixesForUserTypedString");
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v39;
    CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(obj);
        }
        int v24 = [*(id *)(*((void *)&v38 + 1) + 8 * i) absoluteString];
        CFStringRef MutableCopy = CFStringCreateMutableCopy(v22, [(__CFString *)v24 length], v24);
        [(WebBookmarkCollection *)self _normalizeSearchString:MutableCopy];
        CFStringAppend(MutableCopy, @"%");
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke_3;
        v36[3] = &unk_2643DA998;
        id v26 = v17;
        v36[4] = self;
        id v37 = v26;
        [(WebBookmarkCollection *)self _enumerateBookmarksForMatchStatement:v35 normalizedQuery:MutableCopy usingBlock:v36];
        CFRelease(MutableCopy);
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v53 count:16];
    }
    while (v20);
  }
}

uint64_t __86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke_2;
  v6[3] = &unk_2643DA970;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  void v6[5] = a4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v4 + 16))(v4, a2, a3, v6);
}

WebBookmark *__86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [WebBookmark alloc];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = [*(id *)(a1 + 32) currentDeviceIdentifier];
  int v5 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v2, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v3, v4, [*(id *)(*(void *)(a1 + 32) + 16) collectionType]);

  return v5;
}

uint64_t __86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke_4;
  v6[3] = &unk_2643DA970;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  void v6[5] = a4;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v4 + 16))(v4, a2, a3, v6);
}

WebBookmark *__86__WebBookmarkCollection__enumerateBookmarksMatchingString_statementSuffix_usingBlock___block_invoke_4(uint64_t a1)
{
  id v2 = [WebBookmark alloc];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = [*(id *)(a1 + 32) currentDeviceIdentifier];
  int v5 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:](v2, "initWithSQLiteStatement:deviceIdentifier:collectionType:", v3, v4, [*(id *)(*(void *)(a1 + 32) + 16) collectionType]);

  return v5;
}

- (void)enumerateBookmarks:(BOOL)a3 andReadingListItems:(BOOL)a4 matchingString:(id)a5 usingBlock:(id)a6
{
  BOOL v7 = a4;
  id v14 = a5;
  id v10 = a6;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  if (a3 || v7)
  {
    if (a3)
    {
      id v11 = @"AND hidden = 0 AND hidden_ancestor_count = 0";
      if (v7) {
        id v11 = &stru_26CC2ED50;
      }
      id v12 = v11;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"AND parent = %d", -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"));
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = v12;
    [(WebBookmarkCollection *)self _enumerateBookmarksMatchingString:v14 statementSuffix:v12 usingBlock:v10];
  }
}

- (id)_bookmarksFromStatementSelectingIDs:(const char *)a3 withQuery:(id)a4
{
  int v6 = (__CFString *)a4;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  CFIndex v7 = [(__CFString *)v6 length];
  CFStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, v6);
  [(WebBookmarkCollection *)self _normalizeSearchString:MutableCopy];
  CFStringAppend(MutableCopy, @"%");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, self->_db, a3);
  id v9 = v20;
  id v10 = MutableCopy;
  sqlite3_bind_text(v9, 1, (const char *)[(__CFString *)v10 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v11 = [MEMORY[0x263EFF980] array];
  while (sqlite3_step(v20) == 100)
  {
    id v12 = sqlite3_column_text(v20, 0);
    uint64_t v13 = sqlite3_column_text(v20, 1);
    if (v12)
    {
      id v14 = v13;
      if (v13)
      {
        uint64_t v15 = (void *)[[NSString alloc] initWithUTF8String:v12];
        id v16 = (void *)[[NSString alloc] initWithUTF8String:v14];
        id v17 = [[WebBookmark alloc] initWithTitle:v15 address:v16 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
        [v11 addObject:v17];
      }
    }
  }
  CFRelease(v10);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);

  return v11;
}

- (void)_addBookmarksForReadingListMatchStatement:(id)a3 normalizedQuery:(id)a4 toArray:(id)a5 maxResults:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  db = self->_db;
  id v14 = v10;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)[v14 UTF8String]);
  uint64_t v15 = v22;
  id v16 = v11;
  sqlite3_bind_text(v15, 1, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v22, 2, [(WebBookmarkCollection *)self readingListFolderBookmarkID]);
  sqlite3_bind_int(v22, 3, 2);
  sqlite3_bind_int(v22, 4, a6);
  while (sqlite3_step(v22) == 100)
  {
    id v17 = [WebBookmark alloc];
    int v18 = v22;
    __int16 v19 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    uint64_t v20 = [(WebBookmark *)v17 initWithSQLiteStatement:v18 deviceIdentifier:v19 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    [v12 addObject:v20];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
}

- (id)readingListBookmarksMatchingString:(id)a3 maxResults:(unsigned int)a4 onlyArchivedBookmarks:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  theString = (__CFString *)a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  CFIndex v8 = [(__CFString *)theString length];
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, theString);
  [(WebBookmarkCollection *)self _normalizeSearchString:MutableCopy];
  CFStringAppend(MutableCopy, @"%");
  cf = MutableCopy;
  long long v38 = [MEMORY[0x263EFF980] array];
  if (v5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" AND (archive_status = %zd OR archive_status = %zd)", 1, 2);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = &stru_26CC2ED50;
  }
  id v32 = v11;
  uint64_t v36 = [NSString stringWithFormat:@"deleted = 0 AND parent = ? AND web_filter_status != ? AND title IS NOT NULL AND url IS NOT NULL%@ ORDER BY order_index DESC LIMIT ?", v11];
  id v12 = NSString;
  uint64_t v13 = BookmarkSQLiteColumns();
  id v33 = [v12 stringWithFormat:@"SELECT %@ FROM bookmarks INNER JOIN bookmark_title_words ON bookmarks.id = bookmark_title_words.bookmark_id WHERE bookmark_title_words.word LIKE ? AND %@", v13, v36];

  id v14 = NSString;
  uint64_t v15 = BookmarkSQLiteColumns();
  id v16 = [v14 stringWithFormat:@"SELECT %@ FROM bookmarks WHERE url LIKE ? AND %@", v15, v36];

  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA case_sensitive_like = true"];
  [(WebBookmarkCollection *)self _addBookmarksForReadingListMatchStatement:v33 normalizedQuery:MutableCopy toArray:v38 maxResults:v6];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA case_sensitive_like = false"];
  [(__CFString *)theString _web_possibleURLPrefixesForUserTypedString];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = [*(id *)(*((void *)&v43 + 1) + 8 * i) absoluteString];
        uint64_t v21 = CFStringCreateMutableCopy(v9, [(__CFString *)v20 length], v20);
        [(WebBookmarkCollection *)self _normalizeSearchString:v21];
        CFStringAppend(v21, @"%");
        [(WebBookmarkCollection *)self _addBookmarksForReadingListMatchStatement:v16 normalizedQuery:v21 toArray:v38 maxResults:v6];
        CFRelease(v21);
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v17);
  }

  CFRelease(cf);
  [v38 sortUsingComparator:&__block_literal_global_449];
  CFAllocatorRef v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v38, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v23 = v38;
  id v24 = 0;
  uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v40;
    do
    {
      uint64_t v27 = 0;
      id v28 = v24;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        id v29 = *(void **)(*((void *)&v39 + 1) + 8 * v27);
        if (!v28
          || (int v30 = [*(id *)(*((void *)&v39 + 1) + 8 * v27) identifier],
              v30 != [v28 identifier]))
        {
          [v22 addObject:v29];
        }
        id v24 = v29;

        ++v27;
        id v28 = v24;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v25);
  }

  if ([v22 count] > (unint64_t)v6) {
    objc_msgSend(v22, "removeObjectsInRange:", v6, objc_msgSend(v22, "count") - v6);
  }

  return v22;
}

uint64_t __93__WebBookmarkCollection_readingListBookmarksMatchingString_maxResults_onlyArchivedBookmarks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unsigned int v5 = [a2 orderIndex];
  unsigned int v6 = [v4 orderIndex];
  if (v5 <= v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 < v6) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }

  return v8;
}

- (id)firstReadingListBookmarkWithURLMatchingString:(id)a3 prefixMatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(WebBookmarkCollection *)self _firstBookmarkWithURLMatchingString:v6 prefixMatch:v4 inParent:[(WebBookmarkCollection *)self readingListFolderBookmarkID]];

  return v7;
}

- (unint64_t)indexOfReadingListBookmark:(id)a3 countingOnlyUnread:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v26 = v6;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  uint64_t v27 = [(WebBookmarkCollection *)self readingListWithUnreadOnly:v4];
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x263F089D8] string];
    uint64_t v8 = [(WebBookmarkCollection *)self readingListFolderBookmarkID];
    id v24 = objc_alloc_init(WebBookmarkInMemoryChangeFilterUnreadOnly);
    CFAllocatorRef v9 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    uint64_t v25 = [(WebBookmarkInMemoryChangeFilterUnreadOnly *)v24 bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:v9 inFolder:v8];

    id v10 = [MEMORY[0x263EFF980] array];
    [v10 addObjectsFromArray:v25];
    id v11 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    id v12 = [v11 deletedBookmarkIDsInBookmarkFolder:v8];
    uint64_t v13 = [v12 allObjects];
    [v10 addObjectsFromArray:v13];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
          if ([v7 length])
          {
            __int16 v19 = [v18 stringValue];
            [v7 appendFormat:@",%@", v19];
          }
          else
          {
            __int16 v19 = [v18 stringValue];
            [v7 appendString:v19];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    db = self->_db;
    [NSString stringWithFormat:@"SELECT COUNT(*) FROM bookmarks WHERE order_index < ? AND parent = ? AND (read = 0 AND deleted = 0 AND id NOT IN (%@))", v7];
    id v21 = objc_claimAutoreleasedReturnValue();
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28, db, (const char *)[v21 UTF8String]);

    sqlite3_bind_int(v29, 1, [v26 orderIndex]);
    sqlite3_bind_int(v29, 2, v8);
    if (sqlite3_step(v29) == 100) {
      unint64_t v22 = objc_msgSend(v27, "_reverseOrderIndex:", sqlite3_column_int(v29, 0));
    }
    else {
      unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28);
  }
  else
  {
    unint64_t v22 = objc_msgSend(v27, "_reverseOrderIndex:", objc_msgSend(v6, "orderIndex"));
  }

  return v22;
}

- (id)_tableExpressionForArchiveMode:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = dword_21C0E8FD4[a3];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SELECT id FROM bookmarks WHERE parent = %d AND deleted = 0 AND web_filter_status = %zd ORDER BY order_index DESC LIMIT %d", -[WebBookmarkCollection readingListFolderBookmarkID](self, "readingListFolderBookmarkID"), 1, v3);
}

- (id)_orderedWhereClauseForArchiveMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x263F089D8];
  uint64_t v7 = -[WebBookmarkCollection _tableExpressionForArchiveMode:](self, "_tableExpressionForArchiveMode:");
  uint64_t v8 = [v6 stringWithFormat:@"id IN (%@) AND ", v7];

  if (v4) {
    objc_msgSend(NSString, "stringWithFormat:", @"archive_status IN (%zd,%zd,%zd)", 0, 6, 3);
  }
  else {
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"archive_status IN (%zd,%zd)", 6, 3);
  }
  id v10 = (void *)v9;
  if ((unint64_t)a3 < 3) {
    objc_msgSend(v8, "appendFormat:", off_2643DAD60[a3], v9);
  }
  id v11 = [v8 stringByAppendingString:@" ORDER BY archive_status ASC, read ASC, locally_added DESC, order_index DESC"];

  return v11;
}

- (id)_orderedWhereClauseForArchiveMode:(int64_t)a3
{
  BOOL v4 = (void *)MEMORY[0x263F089D8];
  unsigned int v5 = -[WebBookmarkCollection _tableExpressionForArchiveMode:](self, "_tableExpressionForArchiveMode:");
  id v6 = [v4 stringWithFormat:@"id IN (%@) AND ", v5];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"archive_status IN (%zd,%zd)", 0, 3);
  uint64_t v8 = (void *)v7;
  if ((unint64_t)a3 < 3) {
    objc_msgSend(v6, "appendFormat:", off_2643DAD60[a3], v7);
  }
  uint64_t v9 = [v6 stringByAppendingString:@" ORDER BY archive_status ASC, read ASC, locally_added DESC, order_index DESC"];

  return v9;
}

- (unint64_t)countReadingListBookmarksNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  unsigned int v5 = [(WebBookmarkCollection *)self _orderedWhereClauseForArchiveMode:a3 automaticArchivingEnabled:a4];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v8, [(WebBookmarkCollection *)self _selectBookmarksWhere:v5 returnType:2]);
  if (sqlite3_step(v9) == 100) {
    unint64_t v6 = sqlite3_column_int(v9, 0);
  }
  else {
    unint64_t v6 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return v6;
}

- (unint64_t)countReadingListBookmarksNeedingArchiveInMode:(int64_t)a3
{
  BOOL v4 = [(WebBookmarkCollection *)self _orderedWhereClauseForArchiveMode:a3];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v7, [(WebBookmarkCollection *)self _selectBookmarksWhere:v4 returnType:2]);
  if (sqlite3_step(v8) == 100) {
    unint64_t v5 = sqlite3_column_int(v8, 0);
  }
  else {
    unint64_t v5 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (id)firstReadingListBookmarkNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  unint64_t v5 = [(WebBookmarkCollection *)self _orderedWhereClauseForArchiveMode:a3 automaticArchivingEnabled:a4];
  unint64_t v6 = [v5 stringByAppendingString:@" LIMIT 1"];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v12, [(WebBookmarkCollection *)self _selectBookmarksWhere:v6]);
  if (sqlite3_step(v13) == 100)
  {
    uint64_t v7 = [WebBookmark alloc];
    uint64_t v8 = v13;
    uint64_t v9 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    id v10 = [(WebBookmark *)v7 initWithSQLiteStatement:v8 deviceIdentifier:v9 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
  }
  else
  {
    id v10 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10;
}

- (id)firstReadingListBookmarkNeedingArchiveInMode:(int64_t)a3
{
  BOOL v4 = [(WebBookmarkCollection *)self _orderedWhereClauseForArchiveMode:a3];
  unint64_t v5 = [v4 stringByAppendingString:@" LIMIT 1"];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v11, [(WebBookmarkCollection *)self _selectBookmarksWhere:v5]);
  if (sqlite3_step(v12) == 100)
  {
    unint64_t v6 = [WebBookmark alloc];
    uint64_t v7 = v12;
    uint64_t v8 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    uint64_t v9 = [(WebBookmark *)v6 initWithSQLiteStatement:v7 deviceIdentifier:v8 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
  }
  else
  {
    uint64_t v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (id)readingListBookmarksNeedingArchiveInMode:(int64_t)a3 automaticArchivingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  uint64_t v7 = [(WebBookmarkCollection *)self _orderedWhereClauseForArchiveMode:a3 automaticArchivingEnabled:v4];
  uint64_t v8 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:v7 orderBy:0 usingFilter:0];
  uint64_t v9 = [[WebBookmarkList alloc] initWithQuery:v8 skipOffset:0 collection:self];

  return v9;
}

- (id)readingListBookmarksNeedingArchiveInMode:(int64_t)a3
{
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  unint64_t v5 = [(WebBookmarkCollection *)self _orderedWhereClauseForArchiveMode:a3];
  unint64_t v6 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:v5 orderBy:0 usingFilter:0];
  uint64_t v7 = [[WebBookmarkList alloc] initWithQuery:v6 skipOffset:0 collection:self];

  return v7;
}

- (void)_cullReadingListBookmarksList:(id)a3 toSize:(unint64_t)a4
{
  id v10 = a3;
  if ([v10 bookmarkCount] > a4)
  {
    char v6 = [(id)objc_opt_class() isLockedSync];
    if ((v6 & 1) != 0 || [(id)objc_opt_class() lockSync])
    {
      uint64_t v7 = [v10 bookmarkArray];
      unint64_t v8 = [v7 count];
      if (v8 > a4)
      {
        do
        {
          uint64_t v9 = [v7 objectAtIndex:a4];
          if ([v9 isFullArchiveAvailable]) {
            [v9 clearArchive];
          }
          [v9 setArchiveStatus:5];
          [(WebBookmarkCollection *)self saveBookmark:v9];

          ++a4;
        }
        while (v8 != a4);
      }
      if ((v6 & 1) == 0) {
        [(id)objc_opt_class() unlockSync];
      }
    }
  }
}

- (BOOL)rollOutLastReadingListItem
{
  uint64_t v3 = [(WebBookmarkCollection *)self rollingListOfArchivedReadingListItems];
  unsigned int v4 = [v3 bookmarkCount];
  unsigned int v5 = v4;
  if (v4)
  {
    if ((unint64_t)v4 - 1 >= 0xF9) {
      uint64_t v6 = 249;
    }
    else {
      uint64_t v6 = v4 - 1;
    }
    [(WebBookmarkCollection *)self _cullReadingListBookmarksList:v3 toSize:v6];
  }

  return v5 != 0;
}

- (void)rollOutReadingListItemIfNeededToMakeRoomForOneNewItem
{
  id v3 = [(WebBookmarkCollection *)self rollingListOfArchivedReadingListItems];
  -[WebBookmarkCollection _cullReadingListBookmarksList:toSize:](self, "_cullReadingListBookmarksList:toSize:");
}

- (WebBookmarkList)rollingListOfArchivedReadingListItems
{
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  uint64_t v3 = [(WebBookmarkCollection *)self readingListFolderBookmarkID];
  unsigned int v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"parent = %d AND deleted = 0 AND (archive_status = %zd OR archive_status = %zd)", v3, 1, 2);
  unsigned int v5 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:v4 orderBy:@"read ASC, order_index DESC" usingFilter:0];
  uint64_t v6 = [[WebBookmarkList alloc] initWithQuery:v5 skipOffset:0 collection:self];
  unsigned int v7 = [(WebBookmarkList *)v6 bookmarkCount];
  if (v7) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = 0;
  }
  if (v7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v6;
  }

  return v8;
}

- (unint64_t)rollingReadingListMaximumCount
{
  return 250;
}

- (void)clearCarrierBookmarks
{
  if ([(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v10, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"syncable = 0 AND parent = 0"]);
    while (sqlite3_step(v11) == 100)
    {
      uint64_t v3 = [WebBookmark alloc];
      unsigned int v4 = v11;
      unsigned int v5 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
      uint64_t v6 = [(WebBookmark *)v3 initWithSQLiteStatement:v4 deviceIdentifier:v5 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

      unsigned int v7 = [(WebBookmark *)v6 localAttributes];
      unint64_t v8 = [v7 objectForKey:@"com.apple.bookmarks.IsCarrierBookmark"];
      int v9 = [v8 BOOLValue];

      if (v9) {
        [(WebBookmarkCollection *)self deleteBookmark:v6 postChangeNotification:0];
      }
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
  }
}

- (id)_firstBookmarkWithURLMatchingString:(id)a3 prefixMatch:(BOOL)a4 inParent:(int)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6)
  {
    [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA case_sensitive_like = false"];
    int v9 = [NSString stringWithFormat:@"%@%%", v8];

    id v10 = [(WebBookmarkCollection *)self _selectBookmarksWhere:@"url LIKE ? AND deleted = 0 AND parent = ? LIMIT 1"];
  }
  else
  {
    id v10 = [(WebBookmarkCollection *)self _selectBookmarksWhere:@"url = ? AND deleted = 0 AND parent = ? ORDER BY last_modified ASC LIMIT 1"];
    int v9 = v8;
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v18, v10);
  id v11 = v19;
  id v12 = v9;
  sqlite3_bind_text(v11, 1, (const char *)[v12 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v19, 2, a5);
  if (sqlite3_step(v19) == 100)
  {
    uint64_t v13 = [WebBookmark alloc];
    id v14 = v19;
    uint64_t v15 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    uint64_t v16 = [(WebBookmark *)v13 initWithSQLiteStatement:v14 deviceIdentifier:v15 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
  }
  else
  {
    uint64_t v16 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18);

  return v16;
}

- (id)_mergeCandidateFolderWithTitle:(id)a3 parent:(int)a4 mergeMode:(int64_t)a5
{
  id v8 = a3;
  if (a5)
  {
    int v9 = &stru_26CC2ED50;
    if (a5 == 1) {
      int v9 = @"AND server_id IS NULL";
    }
    id v10 = [NSString stringWithFormat:@"type = 1 AND title = ? AND parent = ? AND deleted = 0 %@", v9];
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v16, [(WebBookmarkCollection *)self _selectBookmarksWhere:v10]);
    if (v18)
    {
      sqlite3_bind_text(v17, 1, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_int(v17, 2, a4);
      while (sqlite3_step(v17) == 100)
      {
        id v11 = [WebBookmark alloc];
        id v12 = v17;
        uint64_t v13 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
        id v14 = [(WebBookmark *)v11 initWithSQLiteStatement:v12 deviceIdentifier:v13 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

        if (a5 == 1 || ![(WebBookmarkCollection *)self _bookmarkHasSyncedToServer:v14]) {
          goto LABEL_12;
        }
      }
    }
    id v14 = 0;
LABEL_12:
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_mergeCandidateBookmarkWithTitle:(id)a3 address:(id)a4 parent:(int)a5 mergeMode:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6 == 1)
  {
    id v12 = @"type = 0 AND url = ?1 AND parent = ?2 AND deleted = 0 AND server_id IS NULL";
  }
  else
  {
    if (a6 != 2)
    {
      uint64_t v13 = 0;
      goto LABEL_17;
    }
    id v12 = @"type = 0 AND title = ?3 AND url = ?1 AND parent = ?2 AND deleted = 0";
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v18, [(WebBookmarkCollection *)self _selectBookmarksWhere:v12]);
  if (v20)
  {
    sqlite3_bind_text(v19, 1, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int(v19, 2, a5);
    if (a6 == 2)
    {
      if (v10) {
        sqlite3_bind_text(v19, 3, (const char *)[v10 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else {
        sqlite3_bind_null(v19, 3);
      }
    }
    while (sqlite3_step(v19) == 100)
    {
      id v14 = [WebBookmark alloc];
      uint64_t v15 = v19;
      uint64_t v16 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
      uint64_t v13 = [(WebBookmark *)v14 initWithSQLiteStatement:v15 deviceIdentifier:v16 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

      if (a6 == 1 || ![(WebBookmarkCollection *)self _bookmarkHasSyncedToServer:v13]) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v13 = 0;
LABEL_16:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v18);
LABEL_17:

  return v13;
}

- (void)_createFreshDatabase
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to create a fresh database because we failed to lock sync", v2, v3, v4, v5, v6);
}

- (void)_createSchema
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TABLE generations (generation INTEGER NOT NULL)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"INSERT INTO generations (generation) VALUES (1)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TABLE sync_properties (key TEXT NOT NULL, value TEXT NOT NULL)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX sync_properties_key_index ON sync_properties (key)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"INSERT INTO sync_properties (key, value) VALUES ('_dav_generation', 1)"];
  [(WebBookmarkCollection *)self _clearAndCreateBookmarksTables];
  if (isIPad(void)::onceToken != -1) {
    dispatch_once(&isIPad(void)::onceToken, &__block_literal_global_1822);
  }
  if (isIPad(void)::result && ![(WBCollectionConfiguration *)self->_configuration collectionType])
  {
    uint64_t v3 = NSString;
    uint64_t v4 = [(id)objc_opt_class() _uniqueExternalUUID];
    uint64_t v5 = [v3 stringWithFormat:@"INSERT INTO bookmarks (id, special_id, parent, type, order_index, num_children, editable, deletable, title, external_uuid) VALUES (1, 1, 0, 1, 0, 0, 0, 0, 'BookmarksBar', '%@')", v4];
    [(WebBookmarkCollection *)self _executeSQL:v5];

    [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET num_children = 1 WHERE id = 0"];
  }
  [(WebBookmarkCollection *)self _clearAndCreateAncestorTable];
}

- (id)currentTabServerIDPresenceForParticipant:(id)a3 getTabGroupServerID:(id *)a4
{
  id v6 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT tab_group_server_id, tab_server_id FROM participant_presence WHERE participant_id = ?");
  unsigned int v7 = v12;
  id v8 = v6;
  sqlite3_bind_text(v7, 1, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v12) == 100)
  {
    WBUTF8StringFromSQLStatement(v12, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    int v9 = WBUTF8StringFromSQLStatement(v12, 1);
  }
  else
  {
    int v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (id)currentTabServerIDPresenceForParticipant:(id)a3 inTabGroupWithServerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, self->_db, "SELECT tab_server_id FROM participant_presence WHERE participant_id = ? AND tab_group_server_id = ?");
  id v8 = v15;
  id v9 = v6;
  sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v10 = v15;
  id v11 = v7;
  sqlite3_bind_text(v10, 2, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v15) == 100)
  {
    id v12 = WBUTF8StringFromSQLStatement(v15, 0);
  }
  else
  {
    id v12 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);

  return v12;
}

- (BOOL)setPresenceInTabWithServerID:(id)a3 tabGroupWithServerID:(id)a4 forParticipant:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, self->_db, "DELETE FROM participant_presence WHERE participant_id = ?");
  id v11 = v18;
  id v12 = v10;
  sqlite3_bind_text(v11, 1, (const char *)[v12 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v18) == 101)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v15, self->_db, "INSERT INTO participant_presence (participant_id, tab_group_server_id, tab_server_id) VALUES (?, ?, ?)");
    sqlite3_bind_text(v16, 1, (const char *)[v12 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_text(v16, 2, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_text(v16, 3, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    BOOL v13 = sqlite3_step(v16) == 101;
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v15);
  }
  else
  {
    BOOL v13 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);

  return v13;
}

- (BOOL)removePresenceForParticipant:(id)a3 inTabGroupWithServerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->_db, "DELETE FROM participant_presence WHERE participant_id = ? AND tab_group_server_id = ?");
  id v8 = v14;
  id v9 = v6;
  sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v10 = v14;
  id v11 = v7;
  sqlite3_bind_text(v10, 2, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v6) = sqlite3_step(v14) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

  return (char)v6;
}

- (BOOL)removeUnusedPresenceRecords
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4, self->_db, "DELETE FROM participant_presence WHERE tab_group_server_id NOT IN (SELECT server_id FROM bookmarks WHERE type = 1 AND subtype = 0) OR tab_server_id NOT IN (SELECT server_id FROM bookmarks WHERE type = 0 AND subtype = 0)");
  BOOL v2 = sqlite3_step(v5) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4);
  return v2;
}

- (id)presenceTabUUIDForParticipant:(id)a3 inTabGroupWithServerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, self->_db, "SELECT bookmarks.external_uuid FROM bookmarks INNER JOIN participant_presence ON bookmarks.server_id = participant_presence.tab_server_id WHERE participant_id = ? AND tab_group_server_id = ?");
  id v8 = v15;
  id v9 = v6;
  sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v10 = v15;
  id v11 = v7;
  sqlite3_bind_text(v10, 2, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v15) == 100)
  {
    id v12 = WBUTF8StringFromSQLStatement(v15, 0);
  }
  else
  {
    id v12 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);

  return v12;
}

- (id)activeParticipantsInTabGroupWithServerID:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT participant_id FROM participant_presence WHERE tab_group_server_id = ?");
  uint64_t v5 = v12;
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v7 = [MEMORY[0x263EFF9C0] set];
  while (sqlite3_step(v12) == 100)
  {
    id v8 = WBUTF8StringFromSQLStatement(v12, 0);
    if ([v8 length]) {
      [v7 addObject:v8];
    }
  }
  id v9 = (void *)[v7 copy];

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  return v9;
}

- (id)activeParticipantsInTabWithServerID:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT participant_id FROM participant_presence WHERE tab_server_id = ?");
  uint64_t v5 = v12;
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v7 = [MEMORY[0x263EFF9C0] set];
  while (sqlite3_step(v12) == 100)
  {
    id v8 = WBUTF8StringFromSQLStatement(v12, 0);
    if ([v8 length]) {
      [v7 addObject:v8];
    }
  }
  id v9 = (void *)[v7 copy];

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  return v9;
}

- (void)markChildrenInFolderAsRead:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = -[WebBookmarkCollection listWithID:](self, "listWithID:", [v4 identifier]);
  id v6 = [v5 bookmarkArray];

  if ([v6 count])
  {
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
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "markAsRead", (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(WebBookmarkCollection *)self saveBookmarks:v7 postNotification:0];
  }
}

- (int64_t)subtypeOfBookmarkWithServerID:(id)a3
{
  id v4 = [NSString stringWithFormat:@"SELECT subtype FROM bookmarks WHERE server_id = '%@'", a3];
  int v5 = [(WebBookmarkCollection *)self _intFromExecutingSQL:v4];

  if (v5 == -1) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)_clearAndCreateBookmarksTitleWordTable
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TABLE IF EXISTS bookmark_title_words"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TABLE bookmark_title_words (id INTEGER PRIMARY KEY AUTOINCREMENT, bookmark_id INTEGER NOT NULL CONSTRAINT fk_bookmark_id REFERENCES bookmarks(id) ON DELETE CASCADE, word TEXT, word_index INTEGER)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TRIGGER fkd_bookmark_title_words_bookmark_id BEFORE DELETE ON bookmarks      FOR EACH ROW BEGIN DELETE FROM bookmark_title_words WHERE bookmark_id = OLD.id;      END;"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX title_word_index ON bookmark_title_words(word)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX title_bookmark_id_index ON bookmark_title_words(bookmark_id)"];
}

- (void)_clearAndCreateBookmarksTables
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TABLE IF EXISTS bookmarks"];
  [(WebBookmarkCollection *)self _executeSQL:@"CREATE TABLE bookmarks (id INTEGER PRIMARY KEY AUTOINCREMENT,special_id INTEGER DEFAULT 0,parent INTEGER, type INTEGER,title TEXT,url TEXT COLLATE NOCASE,num_children INTEGER DEFAULT 0,editable INTEGER DEFAULT 1,deletable INTEGER DEFAULT 1,hidden INTEGER DEFAULT 0,hidden_ancestor_count INTEGER DEFAULT 0,order_index INTEGER NOT NULL,external_uuid TEXT UNIQUE,read INTEGER DEFAULT NULL,last_modified REAL DEFAULT NULL,server_id TEXT, sync_key TEXT,sync_data BLOB,added INTEGER DEFAULT 1,deleted INTEGER DEFAULT 0,extra_attributes BLOB DEFAULT NULL,local_attributes BLOB DEFAULT NULL,fetched_icon BOOL DEFAULT 0, icon BLOB DEFAULT NULL,dav_generation INTEGER DEFAULT 0,locally_added BOOL DEFAULT 0,archive_status INTEGER DEFAULT 0,syncable BOOL DEFAULT 1,web_filter_status INTEGER DEFAULT 0, modified_attributes UNSIGNED BIG INT DEFAULT 0, date_closed REAL DEFAULT NULL, last_selected_child INTEGER DEFAULT NULL, subtype INTEGER DEFAULT 0, FOREIGN KEY (last_selected_child) REFERENCES bookmarks (id) ON DELETE SET NULL)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX special_id_index ON bookmarks (special_id)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX autocomplete_index ON bookmarks (url)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX folder_list_index ON bookmarks (parent, type, order_index)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX group_index ON bookmarks (parent, order_index)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX sync_index ON bookmarks (external_uuid)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX server_id_index ON bookmarks(server_id)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX dav_generation_index ON bookmarks(dav_generation)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX reading_list_index ON bookmarks (parent, deleted, web_filter_status, order_index DESC)"];
  [(WebBookmarkCollection *)self _clearAndCreateBookmarksTitleWordTable];
  [(WebBookmarkCollection *)self _clearAndCreateAncestorTable];
  id v3 = [NSString stringWithFormat:@"INSERT INTO bookmarks (id, type, order_index, num_children, title, external_uuid) VALUES (0, 1, 0, 0, 'Root', '%@')", @"Root"];
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", [v3 UTF8String]);
}

- (void)_migrateSchemaVersion0ToVersion1
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN special_id INTEGER DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX special_id_index ON bookmarks (special_id)"];
  [NSString stringWithFormat:@"UPDATE bookmarks SET title = 'Root', external_uuid = '%@' WHERE id = 0", @"Root"];
  id v3 = objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", [v3 UTF8String]);

  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET special_id = 1 WHERE id = 1"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET special_id = 2 WHERE id = 2"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 1"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion1And2ToVersion3
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TABLE IF EXISTS bookmark_title_words"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TABLE bookmark_title_words (id INTEGER PRIMARY KEY, bookmark_id INTEGER NOT NULL CONSTRAINT fk_bookmark_id REFERENCES bookmarks(id) ON DELETE CASCADE, word TEXT, word_index INTEGER)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TRIGGER fkd_bookmark_title_words_bookmark_id BEFORE DELETE ON bookmarks         FOR EACH ROW BEGIN DELETE FROM bookmark_title_words WHERE bookmark_id = OLD.id;         END;"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX title_word_index ON bookmark_title_words(word)"];
  [(WebBookmarkCollection *)self _indexAllTitleWords];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 3"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion3ToVersion4
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN server_id TEXT"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN sync_key TEXT"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN sync_data BLOB"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX server_id_index ON bookmarks(server_id)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 4"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion4ToVersion5
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  if (!WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT count(*) FROM sync_properties WHERE key = '_dav_generation'", v3))[(WebBookmarkCollection *)self _executeSQLWithCString:"INSERT INTO sync_properties (key, value) VALUES ('_dav_generation', 1)"]; {
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN deleted INTEGER DEFAULT 0"];
  }
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN dav_generation INTEGER DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX dav_generation_index ON bookmarks(dav_generation)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 5"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion5ToVersion6
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _normalizeDatabaseURLs];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 6"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion6ToVersion7
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TABLE folder_ancestors (id INTEGER PRIMARY KEY, folder_id INTEGER NOT NULL CONSTRAINT fk_ancestors_folder_id REFERENCES bookmarks(id) ON DELETE CASCADE, ancestor_id INTEGER NOT NULL)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TRIGGER fkd_ancestors_folder_id BEFORE DELETE ON bookmarks FOR EACH ROW BEGIN DELETE FROM folder_ancestors WHERE folder_id = OLD.id; END;"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX ancestor_folder_id_index on folder_ancestors(folder_id)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX ancestor_ancestor_id_index on folder_ancestors(ancestor_id)"];
  [(WebBookmarkCollection *)self _rebuildAncestorTable];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 7"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion7ToVersion8
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN extra_attributes BLOB DEFAULT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 8"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion8ToVersion9
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP INDEX IF EXISTS deleted_index"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP INDEX IF EXISTS autocomplete_index"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX autocomplete_index ON bookmarks(url)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 9"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion9ToVersion10
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN hidden INTEGER DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 10"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion10ToVersion11
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN hidden_ancestor_count INTEGER DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 11"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion11And12And13ToVersion14
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN read INTEGER DEFAULT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN last_modified REAL DEFAULT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 14"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion14ToVersion15
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  int v4 = WebBookmarks::BookmarkSQLStatement::selectInt(self->_db, (sqlite3 *)"SELECT id FROM bookmarks WHERE special_id = 3", v3);
  if (v4 >= 1)
  {
    int v5 = v4;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "UPDATE bookmarks SET read = 0 WHERE read IS NULL and parent = ?");
    sqlite3_bind_int(v7, 1, v5);
    sqlite3_step(v7);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  }
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 15"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion15ToVersion16
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX title_word_bookmark_id_index ON bookmark_title_words(bookmark_id)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 16"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion16AndVersion17AndVersion18ToVersion19
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS count_bookmarks WHERE count_bookmarks.parent = bookmarks.id AND hidden = 0) WHERE type = 1"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 19"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion19And20ToVersion21
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  int v3 = [(WebBookmarkCollection *)self readingListFolderBookmarkID];
  if (v3)
  {
    int v4 = v3;
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "SELECT count(*) FROM bookmarks WHERE parent = ? AND deleted = 0");
    sqlite3_bind_int(v9, 1, v4);
    sqlite3_step(v9);
    int v5 = sqlite3_column_int(v9, 0);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v6, self->_db, "UPDATE bookmarks SET order_index = ? - order_index - 1 WHERE parent = ?");
    sqlite3_bind_int(v7, 1, v5);
    sqlite3_bind_int(v7, 2, v4);
    sqlite3_step(v7);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v6);
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);
  }
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 21"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion21ToVersion22
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN icon BLOB DEFAULT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN fetched_icon BOOL DEFAULT 0"];
  int64_t v9 = [(WebBookmarkCollection *)self currentRecordGeneration];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->_db, "SELECT id, extra_attributes FROM bookmarks WHERE deleted = 0 AND parent = ?");
  sqlite3_bind_int(v13, 1, [(WebBookmarkCollection *)self readingListFolderBookmarkID]);
  while (sqlite3_step(v13) == 100)
  {
    int v3 = sqlite3_column_int(v13, 0);
    int v4 = WBDataFromNullableColumn(v13, 1);
    if (v4)
    {
      int v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:2 format:0 error:0];
      uint64_t v6 = [v5 objectForKey:@"com.apple.ReadingList"];
      id v7 = [v6 objectForKey:@"Icon"];
      if (v7)
      {
        uint64_t v8 = [v6 objectForKey:@"DateLastFetchedIcon"];

        [v6 removeObjectForKey:@"Icon"];
        [v6 removeObjectForKey:@"DateLastFetchedIcon"];
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "UPDATE bookmarks SET icon = ?, fetched_icon = ?, extra_attributes = ?, dav_generation = ? WHERE id = ?");
        bindNullableDataToSQLStatement(v11, 1, v7);
        sqlite3_bind_int(v11, 2, v8 != 0);
        bindAttributesToSQLStatement(v11, 3, v5);
        sqlite3_bind_int64(v11, 4, v9);
        sqlite3_bind_int(v11, 5, v3);
        sqlite3_step(v11);
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
      }
    }
  }
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 22"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);
}

- (void)_migrateSchemaVersion22ToVersion23
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  sqlite3_int64 v3 = [(WebBookmarkCollection *)self currentRecordGeneration];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DELETE FROM sync_properties WHERE key = '_dav_generation'"];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4, self->_db, "INSERT INTO sync_properties (key, value) VALUES ('_dav_generation', ?)");
  sqlite3_bind_int64(v5, 1, v3);
  sqlite3_step(v5);
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 23"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v4);
}

- (void)_migrateSchemaVersion23ToVersion24
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN added INTEGER DEFAULT 1"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET added = 0 WHERE server_id IS NOT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 24"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion24ToVersion25
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN archived_offline BOOL DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN last_archived REAL DEFAULT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 25"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion25ToVersion26
{
  WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"PRAGMA journal_mode = wal", v2);
  db = self->_db;
  WebBookmarks::BookmarkSQLStatement::executeSQL(db, (sqlite3 *)"PRAGMA user_version = 26", v4);
}

- (void)_migrateSchemaVersion26ToVersion27
{
  [(WebBookmarkCollection *)self _clearAndCreateBookmarksTitleWordTable];
  [(WebBookmarkCollection *)self _indexAllTitleWords];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 27"];
}

- (void)_migrateSchemaVersion27ToVersion28
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX title_bookmark_id_index ON bookmark_title_words(bookmark_id)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 28"];
}

- (void)_migrateSchemaVersion28ToVersion29
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN locally_added BOOL DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 29"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion29ToVersion30
{
  v24[1] = *MEMORY[0x263EF8340];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN local_attributes BLOB DEFAULT NULL"];
  int64_t v17 = [(WebBookmarkCollection *)self currentRecordGeneration];
  char v18 = self;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, self->_db, "SELECT id, extra_attributes, last_archived FROM bookmarks WHERE deleted = 0 AND parent = ?");
  sqlite3_bind_int(v22, 1, [(WebBookmarkCollection *)self readingListFolderBookmarkID]);
  while (sqlite3_step(v22) == 100)
  {
    int v3 = sqlite3_column_int(v22, 0);
    int v4 = WBDataFromNullableColumn(v22, 1);
    double v5 = sqlite3_column_double(v22, 2);
    double v6 = v5;
    if (v4 || v5 != 0.0)
    {
      if (v4)
      {
        id v7 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:2 format:0 error:0];
        uint64_t v8 = [v7 objectForKey:@"com.apple.ReadingList"];
      }
      else
      {
        id v7 = 0;
        uint64_t v8 = 0;
      }
      uint64_t v9 = [v8 objectForKey:@"NextPageURLs"];
      uint64_t v10 = (void *)v9;
      if (v6 != 0.0 || v9)
      {
        id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        if (v6 != 0.0)
        {
          long long v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v6];
          [v12 setObject:v13 forKey:@"DateLastArchived"];
        }
        if (v10) {
          [v12 setObject:v10 forKey:@"NextPageURLs"];
        }
        id v14 = objc_alloc(NSDictionary);
        v24[0] = v12;
        uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
        id v23 = @"com.apple.ReadingList";
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        long long v11 = (void *)[v14 initWithObjects:v15 forKeys:v16];
      }
      else
      {
        long long v11 = 0;
      }
      if (v8)
      {
        [v8 removeObjectForKey:@"NextPageURLs"];
        [v7 setObject:v8 forKey:@"com.apple.ReadingList"];
      }
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, v18->_db, "UPDATE bookmarks SET extra_attributes = ?, local_attributes = ?, dav_generation = ? WHERE id = ?");
      if (v7) {
        bindAttributesToSQLStatement(v20, 1, v7);
      }
      else {
        sqlite3_bind_null(v20, 1);
      }
      if (v11) {
        bindAttributesToSQLStatement(v20, 2, v11);
      }
      else {
        sqlite3_bind_null(v20, 2);
      }
      sqlite3_bind_int64(v20, 3, v17);
      sqlite3_bind_int(v20, 4, v3);
      sqlite3_step(v20);
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);
    }
  }
  [(WebBookmarkCollection *)v18 _executeSQLWithCString:"ALTER TABLE bookmarks DROP COLUMN last_archived"];
  [(WebBookmarkCollection *)v18 _executeSQLWithCString:"PRAGMA user_version = 30"];
  [(WebBookmarkCollection *)v18 _executeSQLWithCString:"END"];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
}

- (void)_migrateSchemaVersion30ToVersion31
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN archive_status INTEGER DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET archive_status = archived_offline"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET archived_offline = NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET last_archived = NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 31"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion31ToVersion32
{
  [(WebBookmarkCollection *)self _clearAndCreateBookmarksTitleWordTable];
  [(WebBookmarkCollection *)self _indexAllTitleWords];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 32"];
}

- (void)_migrateSchemaVersion32ToVersion33
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  -[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET fetched_icon = 0, icon = NULL WHERE parent = (SELECT id FROM bookmarks WHERE special_id = 3)");
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 33"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion33ToVersion34
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN syncable BOOL DEFAULT 1"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 34"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion34ToVersion35
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET archive_status = 0 WHERE archive_status IS NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 35"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion35ToVersion36
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN web_filter_status INTEGER DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 36"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion36ToVersion37
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self deleteAllFavoriteIcons];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 37"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion37ToVersion38
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self markAllFavoritesAsNeedingIcons];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 38"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion38ToVersion39
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN modified_attributes UNSIGNED BIG INT DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 39"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion39Or40ToVersion41
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DELETE FROM bookmark_title_words WHERE bookmark_id NOT IN (SELECT id FROM bookmarks)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DELETE FROM folder_ancestors WHERE folder_id NOT IN (SELECT id FROM bookmarks)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN date_closed REAL DEFAULT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 41"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
  [(WebBookmarkCollection *)self _enableForeignKeys];
}

- (void)_migrateSchemaVersion41ToVersion42
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN last_selected_child INTEGER DEFAULT NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD FOREIGN KEY (last_selected_child) REFERENCES bookmarks (id) ON DELETE SET NULL"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 42"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion42ToVersion43
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX reading_list_index ON bookmarks (parent, deleted, web_filter_status, order_index DESC)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 43"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion43ToVersion44
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 44"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion44ToVersion45
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 45"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion45ToVersion46
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ALTER TABLE bookmarks ADD COLUMN subtype INTEGER DEFAULT 0"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 46"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion46ToVersion47
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 47"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion47ToVersion48
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TABLE IF EXISTS participants"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 48"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion48ToVersion49
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v11, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"deleted = 1"]);
    while (sqlite3_step(v12) == 100)
    {
      int v3 = (void *)MEMORY[0x21D4A0FE0]();
      int v4 = [WebBookmark alloc];
      double v5 = v12;
      double v6 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
      id v7 = [(WebBookmark *)v4 initWithSQLiteStatement:v5 deviceIdentifier:v6 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      void v9[2] = __59__WebBookmarkCollection__migrateSchemaVersion48ToVersion49__block_invoke;
      v9[3] = &unk_2643DA9C0;
      uint64_t v8 = v7;
      uint64_t v10 = v8;
      [(WebBookmarkCollection *)self updateSyncDataForBookmark:v8 usingBlock:v9];
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  }
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 49"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

id __59__WebBookmarkCollection__migrateSchemaVersion48ToVersion49__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setState:1];
  int v4 = [*(id *)(a1 + 32) deviceIdentifier];
  [v3 incrementGenerationForKey:@"Deleted" withDeviceIdentifier:v4];

  return v3;
}

- (void)_migrateSchemaVersion49ToVersion50
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TABLE IF EXISTS participant_presence"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 50"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion50ToVersion51
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v9, [(WebBookmarkCollection *)self _selectBookmarksWhere:@"id NOT IN (SELECT MIN(id) FROM bookmarks GROUP BY external_uuid)"]);
  while (sqlite3_step(v10) == 100)
  {
    id v3 = [WebBookmark alloc];
    int v4 = [(WebBookmark *)v3 initWithSQLiteStatement:v10 deviceIdentifier:0 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
    double v5 = NSString;
    double v6 = [MEMORY[0x263F08C38] UUID];
    id v7 = [v6 UUIDString];
    uint64_t v8 = [v5 stringWithFormat:@"UPDATE bookmarks SET external_uuid = '%@' WHERE id = %d", v7, -[WebBookmark identifier](v4, "identifier")];
    [(WebBookmarkCollection *)self _executeSQL:v8];
  }
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE UNIQUE INDEX IF NOT EXISTS unique_uuid ON bookmarks(external_uuid)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 51"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
}

- (void)_migrateSchemaVersion51ToVersion52
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 52"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion52ToVersion53
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 53"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion53ToVersion54
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 54"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (void)_migrateSchemaVersion54ToVersion55
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"BEGIN"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"PRAGMA user_version = 55"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"END"];
}

- (BOOL)migrateReadingListIconsFromDatabaseToBookmarkImagesDirectory
{
  *(void *)((char *)&v28[3] + 4) = *MEMORY[0x263EF8340];
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v26, self->_db);
  if (v26[17])
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24, self->_db, "SELECT id, local_attributes, icon FROM bookmarks WHERE deleted = 0 AND parent = ?");
    sqlite3_bind_int(v25, 1, [(WebBookmarkCollection *)self readingListFolderBookmarkID]);
    id v21 = [(id)objc_opt_class() bookmarkImagesDirectoryPath];
    char v20 = [MEMORY[0x263F08850] defaultManager];
    if (([v20 fileExistsAtPath:v21 isDirectory:0] & 1) == 0) {
      [v20 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:0];
    }
    while (sqlite3_step(v25) == 100)
    {
      int v4 = (void *)MEMORY[0x21D4A0FE0]();
      int v5 = sqlite3_column_int(v25, 0);
      double v6 = WBDataFromNullableColumn(v25, 1);
      id v7 = WBDataFromNullableColumn(v25, 2);
      int v8 = 2;
      if (v7 && v6)
      {
        id v23 = 0;
        uint64_t v9 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:2 format:0 error:&v23];
        id v10 = v23;
        if (!v9)
        {
          long long v11 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = objc_msgSend(v10, "wb_privacyPreservingDescription");
            *(_DWORD *)buf = 138543362;
            v28[0] = v12;
            _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Got nil local attributes dictionary: %{public}@", buf, 0xCu);
          }
          uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
        }
        long long v13 = [v9 objectForKey:@"com.apple.ReadingList"];
        if (!v13)
        {
          id v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "Got nil reading list attributes dictionary, creating one", buf, 2u);
          }
          long long v13 = [MEMORY[0x263EFF9A0] dictionary];
        }
        uint64_t v15 = [MEMORY[0x263F08C38] UUID];
        uint64_t v16 = [v15 UUIDString];

        int64_t v17 = [v21 stringByAppendingPathComponent:v16];
        [v7 writeToFile:v17 atomically:1];
        [v13 setObject:v16 forKey:@"ReadingListIconUUID"];
        [v9 setObject:v13 forKey:@"com.apple.ReadingList"];
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "UPDATE bookmarks SET local_attributes = ?, icon = ? WHERE id = ?");
        bindAttributesToSQLStatement(*(sqlite3_stmt **)((char *)v28 + 4), 1, v9);
        sqlite3_bind_null(*(sqlite3_stmt **)((char *)v28 + 4), 2);
        sqlite3_bind_int(*(sqlite3_stmt **)((char *)v28 + 4), 3, v5);
        int v8 = sqlite3_step(*(sqlite3_stmt **)((char *)v28 + 4)) != 101;
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
      }
      if ((v8 | 2) != 2)
      {
        BOOL v18 = 0;
        goto LABEL_19;
      }
    }
    BOOL v18 = WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v26, v2, v3);
LABEL_19:

    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24);
  }
  else
  {
    BOOL v18 = 0;
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v26);
  return v18;
}

- (void)_rerunMigrationsIfNecessary
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Bookmarks database appears to have skipped migration steps. Rerunning migration.", v2, v3, v4, v5, v6);
}

uint64_t __111__WebBookmarkCollection__updateDatabaseIfNewerVersion_wasLaunchedForSyncStringKey_upgradeSelector_versionType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stringForKey:@"DebugForceMigrationFromSafariVersionKey"];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = v2;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) syncStringForKey:*(void *)(a1 + 48)];
    uint8_t v6 = (void *)v5;
    id v7 = @"0";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    uint64_t v4 = v7;
  }
  if ([*(id *)(a1 + 56) compare:v4 options:64]) {
    uint64_t v8 = (*(uint64_t (**)(void, void, __CFString *))(a1 + 64))(*(void *)(a1 + 40), *(void *)(a1 + 72), v4);
  }
  else {
    uint64_t v8 = 1;
  }

  return v8;
}

- (BOOL)_performSafariVersionUpgradesFromPreviousVersion:(id)a3
{
  return 1;
}

- (BOOL)_performSafariVersionUpgradesOutsideSafariProcessFromPreviousVersion:(id)a3
{
  return 1;
}

- (BOOL)_performOSVersionUpgradesFromPreviousVersion:(id)a3
{
  return 1;
}

uint64_t __64__WebBookmarkCollection__createRecoveredBookmarksFolderIfNeeded__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = -[WebBookmark initFolderWithParentID:collectionType:]([WebBookmark alloc], "initFolderWithParentID:collectionType:", 0x7FFFFFFFLL, [*(id *)(*(void *)(a1 + 32) + 16) collectionType]);
  [v2 _setSyncable:0];
  uint8_t v6 = @"com.apple.bookmarks.OmitFromUI";
  v7[0] = MEMORY[0x263EFFA88];
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 setExtraAttributes:v3];

  uint64_t v4 = [*(id *)(a1 + 32) _saveBookmark:v2 withSpecialID:6 updateGenerationIfNeeded:1];
  return v4;
}

- (int)_sqliteStatementWithQuery:(id)a3 runInBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, sqlite3_stmt *))a4;
  ppStmt = 0;
  db = self->_db;
  id v9 = v6;
  int v10 = sqlite3_prepare_v2(db, (const char *)[v9 UTF8String], -1, &ppStmt, 0);
  if (!v10)
  {
    v7[2](v7, ppStmt);
    int v10 = sqlite3_finalize(ppStmt);
  }

  return v10;
}

- (id)_errorForMostRecentSQLiteError
{
  uint64_t v3 = sqlite3_errcode(self->_db);
  return [(WebBookmarkCollection *)self _errorForMostRecentSQLiteErrorWithErrorCode:v3];
}

- (id)_errorForMostRecentSQLiteErrorWithErrorCode:(int64_t)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = [NSString stringWithUTF8String:sqlite3_errmsg(self->_db)];
  uint64_t v5 = *MEMORY[0x263F664F0];
  v9[0] = *MEMORY[0x263F08320];
  v9[1] = v5;
  v10[0] = v4;
  v10[1] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.WebBookmarks.SQLiteError" code:a3 userInfo:v6];

  return v7;
}

- (BOOL)moveBookmark:(id)a3 toFolderWithID:(int)a4 orderIndex:(unsigned int)a5
{
  LOBYTE(v6) = 0;
  return [(WebBookmarkCollection *)self _moveBookmark:a3 toFolderWithID:*(void *)&a4 orderIndex:*(void *)&a5 detectCycles:1 incrementGeneration:0 shouldMerge:1 generateSyncPositionIfNeeded:v6];
}

- (BOOL)_insertTombstoneWithServerID:(id)a3 itemType:(int64_t)a4 subtype:(int64_t)a5 syncData:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [NSString stringWithFormat:@"INSERT INTO bookmarks (order_index, type, subtype, deleted, added, parent, server_id, dav_generation%@) VALUES (0, %ld, %ld, 1, 0, -1, ?, ?%@)", @", sync_data", a4, a5, @", ?"];
  db = self->_db;
  id v14 = v12;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)[v14 UTF8String]);
  uint64_t v15 = v22;
  id v16 = v10;
  sqlite3_bind_text(v15, 1, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(v22, 2, [(WebBookmarkCollection *)self currentRecordGeneration]);
  int64_t v17 = v22;
  if (v11)
  {
    id v18 = v11;
    sqlite3_bind_blob(v17, 3, (const void *)[v18 bytes], objc_msgSend(v18, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v22, 3);
  }
  BOOL v19 = sqlite3_step(v22) == 101 && [(WebBookmarkCollection *)self _incrementGeneration];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);

  return v19;
}

- (BOOL)_clearAllTombstones
{
  int v3 = WebBookmarks::BookmarkSQLStatement::executeSQL(self->_db, (sqlite3 *)"DELETE FROM bookmarks WHERE deleted = 1", v2);
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _clearAllTombstones]();
    }
  }
  return v3 == 0;
}

- (BOOL)_clearAllTombstonesDuringOrBeforeLocalRecordGeneration:(int64_t)a3
{
  db = self->_db;
  objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM bookmarks WHERE deleted = 1 AND dav_generation <= %zu", a3);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (sqlite3 *)[v4 UTF8String];
  int v7 = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v5, v6);

  if (v7)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _clearAllTombstones]();
    }
  }
  return v7 == 0;
}

- (BOOL)_clearTombstoneForBookmark:(id)a3
{
  id v4 = a3;
  db = self->_db;
  objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM bookmarks WHERE deleted = 1 AND id = %d", objc_msgSend(v4, "identifier"));
  id v6 = objc_claimAutoreleasedReturnValue();
  int v7 = (sqlite3 *)[v6 UTF8String];
  int v9 = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v7, v8);

  if (v9)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _clearAllTombstones]();
    }
  }

  return v9 == 0;
}

- (BOOL)_clearSyncKeysUnderBookmarkID:(int)a3 isFolder:(BOOL)a4
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "UPDATE bookmarks SET added = 1, server_id = NULL, sync_key = NULL, sync_data = NULL WHERE parent IN (select folder_id from folder_ancestors where ancestor_id = ?) OR parent = ? OR id = ?");
  sqlite3_bind_int(v7, 1, a3);
  sqlite3_bind_int(v7, 2, a3);
  sqlite3_bind_int(v7, 3, a3);
  LOBYTE(a3) = sqlite3_step(v7) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return a3;
}

- (BOOL)_clearAllSyncKeys
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, "UPDATE bookmarks SET server_id = NULL, sync_key = NULL, sync_data = NULL");
  int v2 = sqlite3_step(v6);
  if (v2 != 101)
  {
    int v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _clearAllSyncKeys]();
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v2 == 101;
}

- (BOOL)clearAllSyncData
{
  int v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all sync data, likely because the user is logging out", buf, 2u);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__WebBookmarkCollection_clearAllSyncData__block_invoke;
  v5[3] = &unk_2643DA0F8;
  v5[4] = self;
  return [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v5 secureDelete:0];
}

uint64_t __41__WebBookmarkCollection_clearAllSyncData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearAllSyncData];
}

- (BOOL)_clearAllSyncData
{
  if (![(WebBookmarkCollection *)self _clearAllSyncKeys]
    || ![(WebBookmarkCollection *)self _clearAllTombstones]
    || ![(WebBookmarkCollection *)self setSyncData:0 forKey:@"BASyncData"]
    || ![(WebBookmarkCollection *)self setSyncData:0 forKey:@"DAVHomeURL"])
  {
    return 0;
  }
  BOOL v3 = 0;
  if ([(WebBookmarkCollection *)self setLocalMigrationState:0 generateDeviceIdentifierIfNeeded:0])
  {
    if (![(WebBookmarkCollection *)self updateAccountHash:0]) {
      return 0;
    }
    if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
    {
      [(WebBookmarkCollection *)self resetDeviceIdentifier];
      if ([(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE generations SET generation = 0"])
      {
        id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection _clearAllSyncData]();
        }
        return 0;
      }
      [(WebBookmarkCollection *)self setLastSyncedRecordGeneration:0];
      uint64_t v10 = 0;
      id v11 = (sqlite3_stmt *)&v10;
      uint64_t v12 = 0x2020000000;
      char v13 = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      void v9[2] = __42__WebBookmarkCollection__clearAllSyncData__block_invoke;
      v9[3] = &unk_2643DA140;
      void v9[4] = self;
      v9[5] = &v10;
      [(WebBookmarkCollection *)self enumerateDescendantsOfBookmarkID:0 usingBlock:v9];
      int v5 = *((unsigned __int8 *)v11 + 24);
      _Block_object_dispose(&v10, 8);
      if (v5) {
        return 0;
      }
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v10, self->_db, "UPDATE bookmarks SET added = 1");
    int v7 = sqlite3_step(v11);
    BOOL v3 = v7 == 101;
    if (v7 != 101)
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _clearAllSyncData]();
      }
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v10);
  }
  return v3;
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([v5 isSyncable])
  {
    if ([*(id *)(a1 + 32) _shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:v5])
    {
      id v6 = *(void **)(a1 + 32);
      int v7 = [v6 _generateNewServerIDForBookmark:v5];
      [v6 setServerID:v7 forBookmark:v5];
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, *(sqlite3 **)(*(void *)(a1 + 32) + 8), (const char *)[@"UPDATE bookmarks SET dav_generation = ? WHERE id = ?" UTF8String]);
    sqlite3_bind_int64(v12, 1, [*(id *)(a1 + 32) currentRecordGeneration]);
    sqlite3_bind_int(v12, 2, [v5 identifier]);
    uint64_t v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__WebBookmarkCollection__clearAllSyncData__block_invoke_2;
    void v10[3] = &unk_2643DA9C0;
    v10[4] = v8;
    if ([v8 updateSyncDataForBookmark:v5 usingBlock:v10])
    {
      if (sqlite3_step(v12) == 101)
      {
        [*(id *)(a1 + 32) _incrementGeneration];
LABEL_12:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
        goto LABEL_13;
      }
      int v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        [v5 privacyPreservingDescription];
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_1();
      }
    }
    else
    {
      int v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        [v5 privacyPreservingDescription];
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_2();
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_12;
  }
LABEL_13:
}

WBBookmarkSyncData *__42__WebBookmarkCollection__clearAllSyncData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(WBBookmarkSyncData);
  id v5 = [v3 position];
  [(WBBookmarkSyncData *)v4 setPosition:v5];

  id v6 = [*(id *)(a1 + 32) currentDeviceIdentifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__WebBookmarkCollection__clearAllSyncData__block_invoke_3;
  void v10[3] = &unk_2643DAA10;
  int v7 = v4;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  [v3 enumerateGenerationsUsingBlock:v10];

  return v7;
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 incrementedGenerationWithDeviceIdentifier:*(void *)(a1 + 40)];
  [v5 setGeneration:v6 forKey:v7];
}

- (BOOL)_shouldGenerateNewServerIDWhenClearingSyncDataForBookmark:(id)a3
{
  return 1;
}

- (id)_generateNewServerIDForBookmark:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F08C38], "UUID", a3);
  id v4 = [v3 UUIDString];

  return v4;
}

uint64_t __55__WebBookmarkCollection_deleteBookmark_leaveTombstone___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 serverID];
  if ([v4 length])
  {
    id v5 = [a1[4] syncDataForBookmark:v3];
    id v6 = [v5 record];
    id v7 = [v6 recordID];
    id v8 = [v7 zoneID];

    if ([a1[5] containsObject:v8])
    {
      [v5 setIsDeletingRecordZone:1];
    }
    else
    {
      uint64_t v10 = [a1[4] _rootServerIDForRecordZoneID:v8];
      if ([v10 isEqualToString:v4])
      {
        [a1[5] addObject:v8];
        [v5 setIsDeletingRecordZone:1];
      }
      else
      {
        [v5 setState:1];
        id v11 = [a1[6] deviceIdentifier];
        [v5 incrementGenerationForKey:@"Deleted" withDeviceIdentifier:v11];
      }
    }
    id v12 = a1[4];
    uint64_t v13 = [v3 itemType];
    uint64_t v14 = [v3 subtype];
    uint64_t v15 = [v5 encodedBookmarkSyncData];
    uint64_t v9 = [v12 _insertTombstoneWithServerID:v4 itemType:v13 subtype:v14 syncData:v15];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __56__WebBookmarkCollection__deleteBookmark_leaveTombstone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 serverID];
  if ([v4 length])
  {
    if ([*(id *)(a1 + 32) maintainsSyncMetadata])
    {
      id v5 = [*(id *)(a1 + 32) syncDataForBookmark:v3];
      [v5 setState:1];
      id v6 = [v3 deviceIdentifier];
      [v5 incrementGenerationForKey:@"Deleted" withDeviceIdentifier:v6];

      id v7 = [v5 encodedBookmarkSyncData];
    }
    else
    {
      id v7 = [v3 syncData];
    }
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_insertTombstoneWithServerID:itemType:subtype:syncData:", v4, objc_msgSend(v3, "itemType"), objc_msgSend(v3, "subtype"), v7);
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (BOOL)_insertTombsonesRecursivelyForRootFolder:(id)a3 insertTombstoneBlock:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (uint64_t (**)(id, void))a4;
  long long v30 = (void *)MEMORY[0x21D4A0FE0]();
  long long v31 = v5;
  long long v32 = [MEMORY[0x263EFF980] arrayWithObject:v5];
  id v34 = [MEMORY[0x263EFF9A0] dictionary];
  while (1)
  {
    id v7 = [v32 firstObject];
    if (!v7) {
      break;
    }
    context = (void *)MEMORY[0x21D4A0FE0]();
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "identifier"));
    uint64_t v9 = [v34 objectForKeyedSubscript:v8];

    if (v9) {
      goto LABEL_4;
    }
    BOOL v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "identifier"));
    [v34 setObject:&unk_26CC3FF48 forKeyedSubscript:v19];

    if (((uint64_t (**)(id, void *))v6)[2](v6, v7))
    {
      uint64_t v20 = 0;
      do
      {
        id v21 = (void *)MEMORY[0x21D4A0FE0]();
        unint64_t v22 = -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", [v7 identifier], 3, v20, 100);
        if ([v22 count])
        {
          id v23 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = [v22 count];
            uint64_t v25 = [v7 privacyPreservingDescription];
            *(_DWORD *)buf = 134218498;
            uint64_t v42 = v24;
            __int16 v43 = 1024;
            int v44 = v20;
            __int16 v45 = 2114;
            long long v46 = v25;
            _os_log_impl(&dword_21C043000, v23, OS_LOG_TYPE_INFO, "Fetched %zu bookmark children at offset %u in folder %{public}@ while inserting tombstones", buf, 0x1Cu);
          }
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v26 = v22;
          id v18 = (void *)[v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v18)
          {
            uint64_t v27 = *(void *)v37;
            while (2)
            {
              for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v37 != v27) {
                  objc_enumerationMutation(v26);
                }
                if ((v6[2](v6, *(void *)(*((void *)&v36 + 1) + 8 * i)) & 1) == 0)
                {
                  LODWORD(v18) = 1;
                  goto LABEL_26;
                }
              }
              id v18 = (void *)[v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }
LABEL_26:

          uint64_t v20 = (v20 + 100);
        }
        else
        {
          LODWORD(v18) = 5;
        }
      }
      while (!v18);
      if (v18 == 5)
      {
        uint64_t v9 = &unk_26CC3FF48;
LABEL_4:
        if ((unint64_t)[v34 count] > 0x14) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = 20;
        }
        uint64_t v11 = [v9 intValue];
        id v12 = -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:options:offset:limit:](self, "_fastFetchBookmarksInBookmarkFolder:options:offset:limit:", [v7 identifier], 5, v11, v10);
        if ([v12 count])
        {
          uint64_t v13 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = [v12 count];
            uint64_t v15 = [v7 privacyPreservingDescription];
            *(_DWORD *)buf = 134218498;
            uint64_t v42 = v14;
            __int16 v43 = 1024;
            int v44 = v11;
            __int16 v45 = 2114;
            long long v46 = v15;
            _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "Fetched %zu folder children at offset %u in folder %{public}@ while inserting tombstones", buf, 0x1Cu);
          }
          id v16 = [NSNumber numberWithInt:(v11 + v10)];
          int64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "identifier"));
          [v34 setObject:v16 forKeyedSubscript:v17];

          id v18 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v12, "count"));
          [v32 insertObjects:v12 atIndexes:v18];

          LODWORD(v18) = 0;
        }
        else
        {
          id v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "identifier"));
          [v34 setObject:0 forKeyedSubscript:v18];

          [v32 removeObjectAtIndex:0];
          LODWORD(v18) = 2;
        }

        goto LABEL_35;
      }
    }
    else
    {
      LODWORD(v18) = 1;
    }
    uint64_t v9 = &unk_26CC3FF48;
LABEL_35:

    if (v18 && v18 != 2) {
      goto LABEL_39;
    }
  }
  LODWORD(v18) = 0;
LABEL_39:

  return v18 == 0;
}

- (int)_specialIDForBookmarkTitle:(id)a3
{
  id v4 = a3;
  if ([(WBCollectionConfiguration *)self->_configuration collectionType] == 1)
  {
    int v5 = 0;
  }
  else if (([v4 isEqualToString:@"BookmarksBar"] & 1) != 0 {
         || (WebBookmarksBookmarksBarFolderTitle(),
  }
             id v6 = objc_claimAutoreleasedReturnValue(),
             char v7 = [v4 isEqualToString:v6],
             v6,
             (v7 & 1) != 0))
  {
    int v5 = 1;
  }
  else if (([v4 isEqualToString:@"BookmarksMenu"] & 1) != 0 {
         || (WebBookmarksBookmarksMenuFolderTitle(),
  }
             uint64_t v9 = objc_claimAutoreleasedReturnValue(),
             char v10 = [v4 isEqualToString:v9],
             v9,
             (v10 & 1) != 0))
  {
    int v5 = 2;
  }
  else if (([v4 isEqualToString:@"com.apple.ReadingList"] & 1) != 0 {
         || (WebBookmarksReadingListFolderTitle(),
  }
             uint64_t v11 = objc_claimAutoreleasedReturnValue(),
             char v12 = [v4 isEqualToString:v11],
             v11,
             (v12 & 1) != 0))
  {
    int v5 = 3;
  }
  else if (([v4 isEqualToString:@"com.apple.WebFilterWhiteList"] & 1) != 0 {
         || (WebBookmarksWebFilterAllowedSitesFolderTitle(),
  }
             uint64_t v13 = objc_claimAutoreleasedReturnValue(),
             char v14 = [v4 isEqualToString:v13],
             v13,
             (v14 & 1) != 0))
  {
    int v5 = 4;
  }
  else if ([v4 isEqualToString:@"com.apple.FrequentlyVisitedSites"])
  {
    int v5 = 5;
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)_databaseTitleForSpecialID:(int)a3
{
  if ((a3 - 1) > 5) {
    return 0;
  }
  else {
    return off_2643DAD78[a3 - 1];
  }
}

- (BOOL)_childrenOfParentBookmarkAreUnsyncable:(id)a3
{
  id v3 = a3;
  if ([v3 isWebFilterAllowedSitesFolder]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isFrequentlyVisitedSitesFolder];
  }

  return v4;
}

id __75__WebBookmarkCollection__mergeBookmarkIntoPersistedBookmark_forAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) updateGenerationsInSyncData:v3 forAttributes:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 40) maintainsSyncMetadata]) {
    [*(id *)(a1 + 32) unlockFields];
  }
  return v3;
}

- (BOOL)saveBookmark:(id)a3 incrementGenerations:(BOOL)a4
{
  return [(WebBookmarkCollection *)self _saveBookmark:a3 withSpecialID:0 updateGenerationIfNeeded:a4];
}

id __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = -1;
  }
  else {
    uint64_t v4 = -69;
  }
  [*(id *)(a1 + 32) updateGenerationsInSyncData:v3 forAttributes:v4];
  if ([*(id *)(a1 + 40) maintainsSyncMetadata]) {
    [*(id *)(a1 + 32) unlockFields];
  }
  return v3;
}

id __78__WebBookmarkCollection__saveBookmark_withSpecialID_updateGenerationIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) minimumSyncAPIVersion];
  objc_msgSend(v3, "setMinimumAPIVersion:", objc_msgSend(v4, "integerValue"));

  int v5 = [*(id *)(a1 + 32) syncState];
  objc_msgSend(v3, "setState:", objc_msgSend(v5, "integerValue"));

  return v3;
}

- (BOOL)_markBookmarkID:(int)a3 withSpecialID:(int)a4
{
  db = self->_db;
  [NSString stringWithFormat:@"UPDATE bookmarks SET special_id = %u, editable = 0, deletable = 0 WHERE id = %u", *(void *)&a4, *(void *)&a3];
  int v5 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  LODWORD(db) = WebBookmarks::BookmarkSQLStatement::executeSQL(db, v5, v6);

  return db == 0;
}

- (BOOL)bookmarkRequiresParent:(id)a3 specialID:(int)a4
{
  return a4 != 6;
}

- (id)serverIDForBookmarkID:(int)a3
{
  return [(WebBookmarkCollection *)self _serverIDForBookmarkID:*(void *)&a3 generateIfNeeded:0];
}

- (id)_serverIDForBookmarkID:(int)a3 generateIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  if (v5)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v15, self->_db, "SELECT server_id FROM bookmarks WHERE id = ?");
    if (v17 && (sqlite3_bind_int(v16, 1, v5), sqlite3_step(v16) == 100) && (sqlite3_column_type(v16, 0) != 5 || v4))
    {
      WBUTF8StringFromSQLStatement(v16, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (![v7 length] && v4)
      {
        uint64_t v11 = [(WebBookmarkCollection *)self bookmarkWithID:v5];
        char v12 = [MEMORY[0x263F08C38] UUID];
        uint64_t v13 = [v12 UUIDString];
        [(WebBookmarkCollection *)self setServerID:v13 forBookmark:v11];

        uint64_t v14 = [v11 serverID];

        id v7 = (id)v14;
      }
    }
    else
    {
      id v7 = 0;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v15);
  }
  else
  {
    BOOL v8 = [(WebBookmarkCollection *)self maintainsSyncMetadata];
    uint64_t v9 = (void *)*MEMORY[0x263F66408];
    if (!v8) {
      uint64_t v9 = 0;
    }
    id v7 = v9;
  }
  return v7;
}

- (int)bookmarkIDForServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  if (v6)
  {
    if ([v6 isEqualToString:*MEMORY[0x263F66408]])
    {
      int v7 = 0;
    }
    else
    {
      BOOL v8 = objc_msgSend(v6, "_wb_stringByStandardizingDAVServerID");
      int v9 = [v6 isEqualToString:v8];
      char v10 = &stru_26CC2ED50;
      if (v4) {
        char v10 = @"deleted = 0 AND";
      }
      uint64_t v11 = @"rtrim(server_id, '/') LIKE ?";
      if (v9) {
        uint64_t v11 = @"server_id = ?";
      }
      char v12 = [NSString stringWithFormat:@"SELECT id FROM bookmarks WHERE %@ %@ ORDER BY server_id ASC", v10, v11];
      db = self->_db;
      id v14 = v12;
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, db, (const char *)[v14 UTF8String]);
      if (v23)
      {
        if (v9)
        {
          id v15 = v8;
        }
        else
        {
          id v15 = [NSString stringWithFormat:@"%%%@", v8];
        }
        char v17 = v22;
        id v18 = v15;
        sqlite3_bind_text(v17, 1, (const char *)[v18 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        if (sqlite3_step(v22) == 100)
        {
          int v7 = sqlite3_column_int(v22, 0);
        }
        else
        {
          BOOL v19 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v25 = v8;
            _os_log_impl(&dword_21C043000, v19, OS_LOG_TYPE_INFO, "Did not find any bookmarks with server ID %{public}@", buf, 0xCu);
          }
          int v7 = 0x7FFFFFFF;
        }
      }
      else
      {
        id v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection bookmarkIDForServerID:excludeDeletedBookmarks:]();
        }
        int v7 = 0x7FFFFFFF;
      }
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
    }
  }
  else if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    int v7 = 0x7FFFFFFF;
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)bookmarkWithServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = v6;
  if (v6 && ![v6 isEqualToString:*MEMORY[0x263F66408]])
  {
    int v9 = objc_msgSend(v7, "_wb_stringByStandardizingDAVServerID");
    int v10 = [v7 isEqualToString:v9];
    uint64_t v11 = &stru_26CC2ED50;
    if (v4) {
      uint64_t v11 = @"deleted = 0 AND";
    }
    char v12 = @"rtrim(server_id, '/') LIKE ?";
    if (v10) {
      char v12 = @"server_id = ?";
    }
    uint64_t v13 = [NSString stringWithFormat:@"%@ %@ ORDER BY server_id ASC", v11, v12];
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v21, [(WebBookmarkCollection *)self _selectBookmarksWhere:v13]);
    if (v10)
    {
      id v14 = v9;
    }
    else
    {
      id v14 = [NSString stringWithFormat:@"%%%@", v9];
    }
    id v15 = v22;
    id v16 = v14;
    sqlite3_bind_text(v15, 1, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(v22) == 100)
    {
      char v17 = [WebBookmark alloc];
      id v18 = v22;
      BOOL v19 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
      BOOL v8 = [(WebBookmark *)v17 initWithSQLiteStatement:v18 deviceIdentifier:v19 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];
    }
    else
    {
      BOOL v8 = 0;
    }

    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
  }
  else
  {
    BOOL v8 = [(WebBookmarkCollection *)self bookmarkWithID:0];
  }

  return v8;
}

- (BOOL)setServerID:(id)a3 forBookmark:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "UPDATE bookmarks SET server_id = ? WHERE id = ?");
  if (!v12) {
    goto LABEL_7;
  }
  if (v6) {
    sqlite3_bind_text(v11, 1, (const char *)[v6 cStringUsingEncoding:4], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_bind_null(v11, 1);
  }
  sqlite3_bind_int(v11, 2, [v7 identifier]);
  if (sqlite3_step(v11) == 101)
  {
    [v7 setServerID:v6];
    BOOL v8 = 1;
  }
  else
  {
LABEL_7:
    BOOL v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (id)_primaryRecordZoneID
{
  int v2 = [(WBCollectionConfiguration *)self->_configuration collectionType];
  if (v2 == (void *)1)
  {
    int v2 = objc_msgSend(MEMORY[0x263EFD808], "safari_tabGroupsRecordZoneID");
  }
  else if (!v2)
  {
    int v2 = objc_msgSend(MEMORY[0x263EFD808], "safari_bookmarksRecordZoneID");
  }
  return v2;
}

- (id)_rootServerIDForRecordZoneID:(id)a3
{
  id v4 = a3;
  if ([(WBCollectionConfiguration *)self->_configuration collectionType] == 1)
  {
    uint64_t v5 = objc_msgSend(v4, "safari_tabGroupRootRecordName");
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)setHasSharedTabGroups
{
  return self->_userHasSharedTabGroups
      || [(WebBookmarkCollection *)self syncSetString:@"YES" forKey:@"UserHasSharedTabGroupsKey"];
}

- (BOOL)userHasSharedTabGroups
{
  if (self->_userHasSharedTabGroups) {
    return 1;
  }
  id v4 = [(WebBookmarkCollection *)self syncStringForKey:@"UserHasSharedTabGroupsKey"];
  self->_userHasSharedTabGroups = [v4 BOOLValue];

  return self->_userHasSharedTabGroups;
}

- (id)_serverIDBeforeServerID:(id)a3
{
  id v3 = [(WebBookmarkCollection *)self _serverIDOfSiblingBookmarkWithServerID:a3 immediatelyBeforeOrAfter:1];
  return v3;
}

- (id)_serverIDAfterServerID:(id)a3
{
  id v3 = [(WebBookmarkCollection *)self _serverIDOfSiblingBookmarkWithServerID:a3 immediatelyBeforeOrAfter:0];
  return v3;
}

- (id)_serverIDOfSiblingBookmarkWithServerID:(id)a3 immediatelyBeforeOrAfter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24, self->_db, "SELECT parent, order_index FROM bookmarks WHERE server_id = ? AND deleted = 0");
  if (v26
    && (sqlite3_bind_text(v25, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v25) == 100))
  {
    int v7 = sqlite3_column_int(v25, 0);
    int v8 = sqlite3_column_int(v25, 1);
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21, self->_db, "SELECT special_id FROM bookmarks WHERE id = ? AND deleted = 0");
    if (v23 && (sqlite3_bind_int(v22, 1, v7), sqlite3_step(v22) == 100))
    {
      int v9 = (sqlite3_column_int(v22, 0) == 3) ^ v4;
      BOOL v10 = v9 == 0;
      if (v9) {
        uint64_t v11 = @"MAX";
      }
      else {
        uint64_t v11 = @"MIN";
      }
      char v12 = @">";
      if (!v10) {
        char v12 = @"<";
      }
      uint64_t v13 = [NSString stringWithFormat:@"SELECT server_id, %@(order_index) FROM bookmarks WHERE parent = ? AND order_index %@ ? AND server_id IS NOT NULL AND deleted = 0", v11, v12];
      db = self->_db;
      id v15 = v13;
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, db, (const char *)[v15 UTF8String]);
      sqlite3_bind_int(v20, 1, v7);
      sqlite3_bind_int(v20, 2, v8);
      if (sqlite3_step(v20) == 100 && (id v16 = sqlite3_column_text(v20, 0)) != 0)
      {
        char v17 = [NSString stringWithUTF8String:v16];
      }
      else
      {
        char v17 = 0;
      }
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);
    }
    else
    {
      char v17 = 0;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v21);
  }
  else
  {
    char v17 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24);

  return v17;
}

- (id)_firstServerIDInFolderWithServerID:(id)a3
{
  id v3 = [(WebBookmarkCollection *)self _firstOrLastServerIDInFolderWithServerID:a3 isFirst:1];
  return v3;
}

- (id)_lastServerIDInFolderWithServerID:(id)a3
{
  id v3 = [(WebBookmarkCollection *)self _firstOrLastServerIDInFolderWithServerID:a3 isFirst:0];
  return v3;
}

- (id)_firstOrLastServerIDInFolderWithServerID:(id)a3 isFirst:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  if ([v6 length])
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16, self->_db, "SELECT id, special_id FROM bookmarks WHERE server_id = ? AND deleted = 0");
    if (!v18
      || (sqlite3_bind_text(v17, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v17) != 100))
    {
      WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);
      int v9 = 0;
      goto LABEL_14;
    }
    int v7 = sqlite3_column_int(v17, 0);
    BOOL v8 = sqlite3_column_int(v17, 1) == 3;
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);
    v4 ^= v8;
  }
  else
  {
    int v7 = 0;
  }
  BOOL v10 = @"MAX";
  if (v4) {
    BOOL v10 = @"MIN";
  }
  uint64_t v11 = [NSString stringWithFormat:@"SELECT %@(order_index), server_id FROM bookmarks WHERE parent = ? AND server_id IS NOT NULL", v10];
  db = self->_db;
  id v13 = v11;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16, db, (const char *)[v13 UTF8String]);
  sqlite3_bind_int(v17, 1, v7);
  if (sqlite3_step(v17) == 100 && (id v14 = sqlite3_column_text(v17, 1)) != 0)
  {
    int v9 = [NSString stringWithUTF8String:v14];
  }
  else
  {
    int v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v16);

LABEL_14:
  return v9;
}

+ (void)resetDeviceIdentifierForCloudKitWithCollectionType:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __76__WebBookmarkCollection_resetDeviceIdentifierForCloudKitWithCollectionType___block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a3;
  performBlockExclusively(v3);
}

void __76__WebBookmarkCollection_resetDeviceIdentifierForCloudKitWithCollectionType___block_invoke(uint64_t a1)
{
  id v9 = [(id)objc_opt_class() safariDirectoryPath];
  int v2 = NSURL;
  id v3 = [*(id *)(a1 + 32) _cloudKitSyncMetadataFileNameWithCollectionType:*(void *)(a1 + 40)];
  int v4 = [v9 stringByAppendingPathComponent:v3];
  uint64_t v5 = [v2 fileURLWithPath:v4];

  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  int v7 = collectionTypeToDeviceIdentifierDictionary();
  BOOL v8 = [v7 objectForKeyedSubscript:v6];
  [v8 stopObservingChanges];
  [v7 setObject:0 forKeyedSubscript:v6];
  +[WebBookmarkDeviceIdentifier clearDeviceIdentifierWithPlistURL:v5];
}

- (void)resetDeviceIdentifier
{
  if ([(WBCollectionConfiguration *)self->_configuration isInMemoryDatabase])
  {
    id v6 = [MEMORY[0x263F08C38] UUID];
    id v3 = [v6 UUIDString];
    [(WBCollectionConfiguration *)self->_configuration setIdentifier:v3];
  }
  else
  {
    int v4 = objc_opt_class();
    int64_t v5 = [(WBCollectionConfiguration *)self->_configuration collectionType];
    [v4 resetDeviceIdentifierForCloudKitWithCollectionType:v5];
  }
}

- (BOOL)_setSyncKey:(id)a3 forBookmark:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "UPDATE bookmarks SET sync_key = ? WHERE id = ?");
  if (!v12) {
    goto LABEL_7;
  }
  if (v6) {
    sqlite3_bind_text(v11, 1, (const char *)[v6 cStringUsingEncoding:4], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_bind_null(v11, 1);
  }
  sqlite3_bind_int(v11, 2, [v7 identifier]);
  if (sqlite3_step(v11) == 101)
  {
    [v7 setSyncKey:v6];
    BOOL v8 = 1;
  }
  else
  {
LABEL_7:
    BOOL v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)_setSyncData:(id)a3 forBookmark:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "UPDATE bookmarks SET sync_data = ? WHERE id = ?");
  if (!v13) {
    goto LABEL_7;
  }
  if (v6)
  {
    int v8 = [v6 length];
    sqlite3_bind_blob(v12, 1, (const void *)[v6 bytes], v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v12, 1);
  }
  sqlite3_bind_int(v12, 2, [v7 identifier]);
  if (sqlite3_step(v12) == 101)
  {
    [v7 setSyncData:v6];
    BOOL v9 = 1;
  }
  else
  {
LABEL_7:
    BOOL v9 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);

  return v9;
}

- (id)_syncKeysForServerIDs:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v16 = a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  id v17 = [MEMORY[0x263EFF9A0] dictionary];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25, self->_db, "SELECT sync_key FROM bookmarks WHERE server_id = ? AND deleted = 0 ORDER BY server_id ASC");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23, self->_db, "SELECT sync_key FROM bookmarks WHERE deleted = 0 AND rtrim(server_id, '/') LIKE ? ORDER BY server_id ASC");
  if (v26[8] && v24[8])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obuint64_t j = v16;
    uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v20 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v8 = objc_msgSend(v7, "_wb_stringByStandardizingDAVServerID");
          if ([v7 isEqualToString:v8])
          {
            id v9 = v8;
            BOOL v10 = (sqlite3_stmt **)v26;
          }
          else
          {
            id v9 = [NSString stringWithFormat:@"%%%@", v8];
            BOOL v10 = (sqlite3_stmt **)v24;
          }
          uint64_t v11 = *v10;
          sqlite3_reset(*v10);
          id v12 = v9;
          sqlite3_bind_text(v11, 1, (const char *)[v12 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          if (sqlite3_step(v11) == 100 && sqlite3_column_type(v11, 0) != 5)
          {
            char v13 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v11, 0));
            [v17 setObject:v13 forKey:v7];
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v4);
    }

    id v14 = 0;
  }
  else
  {
    id v14 = v17;
    id v17 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v25);

  return v17;
}

- (id)serverIDsInFolderWithServerID:(id)a3 excludeDeletedBookmarks:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(WebBookmarkCollection *)self bookmarkIDForServerID:v6 excludeDeletedBookmarks:v4];
  int v8 = [MEMORY[0x263EFF9C0] set];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13, self->_db, "SELECT server_id from bookmarks where parent = ? AND deleted = 0");
  if (v15)
  {
    sqlite3_bind_int(v14, 1, v7);
    while (1)
    {
      int v9 = sqlite3_step(v14);
      if (v9 != 100) {
        break;
      }
      if (sqlite3_column_type(v14, 0) != 5)
      {
        BOOL v10 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v14, 0));
        [v8 addObject:v10];
      }
    }
    if (v9 == 101) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 0;
    }
    if (v9 == 101) {
      int v8 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

  return v11;
}

- (id)_serverIDAtOrderIndex:(unsigned int)a3 inFolderWithServerID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = [(WebBookmarkCollection *)self bookmarkWithServerID:a4 excludeDeletedBookmarks:0];
  if ([v6 isReadingListFolder])
  {
    int v7 = [(WebBookmarkCollection *)self readingListWithUnreadOnly:0];
    LODWORD(v4) = [v7 _reverseOrderIndex:v4];
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT server_id FROM bookmarks WHERE parent = ? AND deleted = 0 AND order_index = ?");
  if (v12
    && (sqlite3_bind_int(v11, 1, [v6 identifier]), sqlite3_bind_int(v11, 2, v4), sqlite3_step(v11) == 100)
    && sqlite3_column_type(v11, 0) != 5)
  {
    int v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v11, 0));
  }
  else
  {
    int v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)_unsafeOrderChildrenWithServerIDs:(id)a3 inFolderWithServerID:(id)a4 excludeDeletedBookmarks:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  __int16 v43 = self;
  BOOL v42 = v5;
  long long v37 = v8;
  long long v38 = [(WebBookmarkCollection *)self bookmarkWithServerID:a4 excludeDeletedBookmarks:v5];
  int v9 = [v38 isReadingListFolder];
  uint64_t v10 = [v38 identifier];
  uint64_t v11 = [(WebBookmarkCollection *)self listWithID:v10 skipOffset:0 includeHidden:1];
  int v12 = [v11 bookmarkCount];
  char v13 = [MEMORY[0x263EFF980] array];
  if (v12)
  {
    uint64_t v14 = 0;
    do
    {
      char v15 = [v11 bookmarkAtIndex:v14];
      [v13 addObject:v15];

      uint64_t v14 = (v14 + 1);
    }
    while (v12 != v14);
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v52, v43->_db, "UPDATE bookmarks SET order_index = ? WHERE id = ?");
  if (v54)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v8;
    uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    int v41 = v9;
    if (v16)
    {
      int v39 = v10;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v49;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = [(WebBookmarkCollection *)v43 bookmarkWithServerID:*(void *)(*((void *)&v48 + 1) + 8 * i) excludeDeletedBookmarks:v42];
          long long v21 = v20;
          if (v20)
          {
            if ([v20 parentID] != v39) {
              goto LABEL_21;
            }
            v58.length = [v13 count];
            v58.location = 0;
            unint64_t v22 = CFArrayBSearchValues((CFArrayRef)v13, v58, v21, (CFComparatorFunction)compareBookmarksByOrder, 0);
            if (v22 >= [v13 count]) {
              goto LABEL_21;
            }
            char v23 = [v13 objectAtIndex:v22];
            int v24 = [v23 orderIndex];
            LOBYTE(v24) = v24 == [v21 orderIndex];

            if ((v24 & 1) == 0) {
              goto LABEL_21;
            }
            [v13 removeObjectAtIndex:v22];
            sqlite3_reset(pStmt);
            uint64_t v25 = pStmt;
            int v26 = v17;
            if (v41) {
              int v26 = [v11 _reverseOrderIndex:v17];
            }
            sqlite3_bind_int(v25, 1, v26);
            sqlite3_bind_int(pStmt, 2, [v21 identifier]);
            if (sqlite3_step(pStmt) != 101)
            {
LABEL_21:

              goto LABEL_38;
            }
            uint64_t v17 = (v17 + 1);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      LODWORD(v17) = 0;
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    if (v41)
    {
      id v27 = [v13 reverseObjectEnumerator];
    }
    else
    {
      id v27 = v13;
    }
    uint64_t v28 = v27;
    uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v45;
      while (2)
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v45 != v30) {
            objc_enumerationMutation(v28);
          }
          long long v32 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          sqlite3_reset(pStmt);
          uint64_t v33 = v17 + j;
          id v34 = pStmt;
          if (v41) {
            LODWORD(v33) = [v11 _reverseOrderIndex:v33];
          }
          sqlite3_bind_int(v34, 1, v33);
          sqlite3_bind_int(pStmt, 2, [v32 identifier]);
          if (sqlite3_step(pStmt) != 101)
          {

            goto LABEL_38;
          }
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v55 count:16];
        LODWORD(v17) = v17 + j;
        if (v29) {
          continue;
        }
        break;
      }
    }

    BOOL v35 = 1;
    v43->_dirty = 1;
  }
  else
  {
LABEL_38:
    BOOL v35 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v52);

  return v35;
}

- (BOOL)_orderChildrenWithServerIDs:(id)a3 inFolderWithServerID:(id)a4 excludeDeletedBookmarks:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(WebBookmarkCollection *)self _executeSQL:@"SAVEPOINT bookmarksdav_order"]) {
    goto LABEL_5;
  }
  if (![(WebBookmarkCollection *)self _unsafeOrderChildrenWithServerIDs:v8 inFolderWithServerID:v9 excludeDeletedBookmarks:v5])
  {
    [(WebBookmarkCollection *)self _executeSQL:@"ROLLBACK TRANSACTION TO SAVEPOINT bookmarksdav_order"];
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  BOOL v10 = [(WebBookmarkCollection *)self _executeSQL:@"RELEASE SAVEPOINT bookmarksdav_order"] == 0;
LABEL_6:

  return v10;
}

- (BOOL)_rebuildAncestorTable
{
  id v3 = [MEMORY[0x263EFF8C0] array];
  LOBYTE(self) = [(WebBookmarkCollection *)self _insertAncestorTableEntriesForBookmarkID:0 withAncestorIDs:v3];

  return (char)self;
}

- (BOOL)_insertAncestorTableEntriesForBookmarkID:(int)a3 withParentID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v7 = [MEMORY[0x263EFF980] array];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->_db, "SELECT ancestor_id from folder_ancestors WHERE folder_id = ?");
  if (v14)
  {
    sqlite3_bind_int(v13, 1, v4);
    while (sqlite3_step(v13) == 100)
    {
      id v8 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(v13, 0));
      [v7 addObject:v8];
    }
    id v9 = [NSNumber numberWithInt:v4];
    [v7 addObject:v9];

    BOOL v10 = [(WebBookmarkCollection *)self _insertAncestorTableEntriesForBookmarkID:v5 withAncestorIDs:v7];
  }
  else
  {
    BOOL v10 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v10;
}

- (BOOL)_deleteAncestorTableEntriesForBookmarkID:(int)a3
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "DELETE FROM folder_ancestors WHERE folder_id IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = ?) OR folder_id = ?;");
  if (!v9)
  {
LABEL_6:
    BOOL v4 = 0;
    goto LABEL_7;
  }
  sqlite3_bind_int(v8, 1, a3);
  sqlite3_bind_int(v8, 2, a3);
  if (sqlite3_step(v8) != 101)
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection _deleteAncestorTableEntriesForBookmarkID:]();
    }
    goto LABEL_6;
  }
  BOOL v4 = 1;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  return v4;
}

- (BOOL)_indexAllTitleWords
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11, self->_db, "SELECT id, title FROM bookmarks where type = 0 AND deleted = 0");
  id v3 = v12;
  while (1)
  {
    int v4 = sqlite3_step(v3);
    if (v4 != 100) {
      break;
    }
    uint64_t v5 = sqlite3_column_int(v3, 0);
    id v6 = sqlite3_column_text(v3, 1);
    if (v6)
    {
      int v7 = (void *)[[NSString alloc] initWithCString:v6 encoding:4];
      BOOL v8 = [(WebBookmarkCollection *)self _indexBookmarkID:v5 title:v7];

      if (!v8)
      {
        BOOL v9 = 0;
        goto LABEL_7;
      }
    }
  }
  BOOL v9 = v4 == 101;
LABEL_7:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v11);
  return v9;
}

- (void)_collectChangesOfType:(int)a3 withClause:(id)a4 intoArray:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = NSString;
  uint64_t v11 = BookmarkSQLiteColumns();
  int v12 = [v10 stringWithFormat:@"SELECT %@ %@", v11, v8];

  db = self->_db;
  id v14 = v12;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20, db, (const char *)[v14 UTF8String]);
  while (sqlite3_step(v21) == 100)
  {
    char v15 = [WebBookmark alloc];
    uint64_t v16 = v21;
    uint64_t v17 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    uint64_t v18 = [(WebBookmark *)v15 initWithSQLiteStatement:v16 deviceIdentifier:v17 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    long long v19 = [[WBChangeRecord alloc] initWithBookmarkCollection:self bookmark:v18 changeType:v6 localRecordGeneration:0];
    [v9 addObject:v19];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v20);
}

- (NSArray)changeList
{
  id v3 = [MEMORY[0x263EFF980] array];
  [(WebBookmarkCollection *)self _collectChangesOfType:0 withClause:@"FROM folder_ancestors LEFT OUTER JOIN bookmarks ON folder_id = bookmarks.id WHERE bookmarks.id != 0 AND added = 1 AND syncable = 1 GROUP BY folder_id ORDER BY count(ancestor_id) ASC" intoArray:v3];
  [(WebBookmarkCollection *)self _collectChangesOfType:0 withClause:@"FROM bookmarks WHERE added = 1 AND id != 0 AND type = 0 AND syncable = 1" intoArray:v3];
  if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    int64_t v4 = [(WebBookmarkCollection *)self lastSyncedRecordGeneration];
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"FROM folder_ancestors LEFT OUTER JOIN bookmarks ON folder_id = bookmarks.id WHERE dav_generation > %ld AND deleted = 0 AND added = 0 AND bookmarks.id != 0 AND syncable = 1 AND (modified_attributes & %llu) == %llu GROUP BY folder_id ORDER BY count(ancestor_id) ASC", v4, 64, 64);
    [(WebBookmarkCollection *)self _collectChangesOfType:1 withClause:v5 intoArray:v3];

    objc_msgSend(NSString, "stringWithFormat:", @"FROM bookmarks WHERE dav_generation > %ld AND deleted = 0 AND added = 0 AND id != 0 AND syncable = 1 AND modified_attributes != 0 AND ((modified_attributes & %llu) != %llu OR type = 0)", v4, 64, 64);
  }
  else
  {
    int64_t v7 = [(WebBookmarkCollection *)self currentRecordGeneration];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"FROM folder_ancestors LEFT OUTER JOIN bookmarks ON folder_id = bookmarks.id WHERE dav_generation = %ld AND deleted = 0 AND added = 0 AND bookmarks.id != 0 AND syncable = 1 AND (modified_attributes & %llu) == %llu GROUP BY folder_id ORDER BY count(ancestor_id) ASC", v7, 64, 64);
    [(WebBookmarkCollection *)self _collectChangesOfType:1 withClause:v8 intoArray:v3];

    objc_msgSend(NSString, "stringWithFormat:", @"FROM bookmarks WHERE dav_generation = %ld AND deleted = 0 AND added = 0 AND id != 0 AND syncable = 1 AND ((modified_attributes & %llu) != %llu OR type = 0)", v7, 64, 64);
  uint64_t v6 = };
  [(WebBookmarkCollection *)self _collectChangesOfType:1 withClause:v6 intoArray:v3];

  [(WebBookmarkCollection *)self _collectChangesOfType:2 withClause:@"FROM bookmarks WHERE deleted = 1 AND server_id IS NOT NULL AND syncable = 1 GROUP BY server_id" intoArray:v3];
  return (NSArray *)v3;
}

- (id)nextChangeAfterLocalRecordGeneration:(int64_t)a3
{
  uint64_t v5 = NSString;
  uint64_t v6 = BookmarkSQLiteColumns();
  int64_t v7 = [v5 stringWithFormat:@"SELECT %@, added, deleted, dav_generation FROM bookmarks WHERE id != 0 AND syncable = 1 AND dav_generation > %ld AND (added = 1 OR deleted = 1 OR modified_attributes != 0) ORDER BY dav_generation ASC LIMIT 1", v6, a3];

  db = self->_db;
  id v9 = v7;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23, db, (const char *)[v9 UTF8String]);
  if (sqlite3_step(v24) == 100)
  {
    BOOL v10 = [WebBookmark alloc];
    uint64_t v11 = v24;
    int v12 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    char v13 = [(WebBookmark *)v10 initWithSQLiteStatement:v11 deviceIdentifier:v12 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType]];

    id v14 = BookmarkSQLiteColumnNames();
    LODWORD(v11) = [v14 count];

    int v15 = sqlite3_column_int(v24, (int)v11);
    int v16 = sqlite3_column_int(v24, v11 + 1);
    sqlite3_int64 v17 = sqlite3_column_int64(v24, (int)v11 + 2);
    uint64_t v18 = [WBChangeRecord alloc];
    if (v16) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = 1;
    }
    if (v15) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v19;
    }
    long long v21 = [(WBChangeRecord *)v18 initWithBookmarkCollection:self bookmark:v13 changeType:v20 localRecordGeneration:v17];
  }
  else
  {
    long long v21 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v23);

  return v21;
}

- (BOOL)_clearChangeList
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, (const char *)objc_msgSend(@"UPDATE bookmarks SET added = 0, modified_attributes = 0 WHERE added != 0 OR modified_attributes != 0", "UTF8String"));
  BOOL v3 = sqlite3_step(v6) == 101
    && [(WebBookmarkCollection *)self _clearAllTombstones]
    && [(WebBookmarkCollection *)self _incrementRecordGeneration];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

- (BOOL)clearChangesDuringOrBeforeLocalRecordGeneration:(int64_t)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"UPDATE bookmarks SET added = 0, modified_attributes = 0 WHERE dav_generation <= %zu AND (added != 0 OR modified_attributes != 0)", a3];
  db = self->_db;
  id v7 = v5;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)[v7 UTF8String]);
  BOOL v8 = sqlite3_step(v11) == 101
    && [(WebBookmarkCollection *)self _clearAllTombstonesDuringOrBeforeLocalRecordGeneration:a3];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)clearChangesForChangeRecords:(id)a3 lastSyncedRecordGeneration:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        BOOL v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (![v10 changeType])
        {
          uint64_t v11 = NSString;
          int v12 = [v10 bookmark];
          char v13 = objc_msgSend(v11, "stringWithFormat:", @"UPDATE bookmarks SET added = 0 WHERE id = %d", objc_msgSend(v12, "identifier"));
          [(WebBookmarkCollection *)self _executeSQL:v13];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  BOOL v14 = [(WebBookmarkCollection *)self clearChangesDuringOrBeforeLocalRecordGeneration:a4];
  return v14;
}

- (BOOL)clearChangesForBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSString stringWithFormat:@"UPDATE bookmarks SET added = 0, modified_attributes = 0 WHERE id = %d", objc_msgSend(v4, "identifier")];
  db = self->_db;
  id v7 = v5;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, db, (const char *)[v7 UTF8String]);
  if (sqlite3_step(v11) == 101
    && [(WebBookmarkCollection *)self _clearTombstoneForBookmark:v4])
  {
    [v4 setModifiedAttributes:0];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (BOOL)_markBookmarkID:(int)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "UPDATE bookmarks SET added = ? WHERE id = ?");
  sqlite3_bind_int(v8, 1, v4);
  sqlite3_bind_int(v8, 2, a3);
  LOBYTE(a3) = sqlite3_step(v8) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  return a3;
}

- (int64_t)lastSyncedRecordGeneration
{
  db = self->_db;
  [NSString stringWithFormat:@"SELECT value from sync_properties WHERE key = '%@'", @"LastSyncedRecordGeneration"];
  BOOL v3 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  int64_t v5 = (int)WebBookmarks::BookmarkSQLStatement::selectInt(db, v3, v4);

  return v5;
}

- (void)setLastSyncedRecordGeneration:(int64_t)a3
{
  int64_t v5 = [(WebBookmarkCollection *)self lastSyncedRecordGeneration];
  if (v5 != a3)
  {
    db = self->_db;
    if (v5 == -1) {
      [NSString stringWithFormat:@"INSERT INTO sync_properties (key, value) VALUES ('%@', %zd)", @"LastSyncedRecordGeneration", a3];
    }
    else {
      [NSString stringWithFormat:@"UPDATE sync_properties SET value = %zd WHERE key = '%@'", a3, @"LastSyncedRecordGeneration"];
    }
    BOOL v8 = (sqlite3 *)objc_claimAutoreleasedReturnValue();
    WebBookmarks::BookmarkSQLStatement::executeSQL(db, v8, v7);
  }
}

- (void)_metaDataFileChanged:(id)a3
{
  if (![(WBCollectionConfiguration *)self->_configuration skipsExternalNotifications]
    && ![(WBCollectionConfiguration *)self->_configuration isReadonly])
  {
    BOOL v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "Handling bookmarks metadata file change notification", buf, 2u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__WebBookmarkCollection__metaDataFileChanged___block_invoke;
    block[3] = &unk_2643DA0D0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __46__WebBookmarkCollection__metaDataFileChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSyncNotificationType];
}

- (void)setFavoritesFolderIdentifier:(int)a3 postChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 < 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%u", *(void *)&a3, 0);
  }
  id v7 = (id)v6;
  -[WebBookmarkCollection syncSetString:forKey:](self, "syncSetString:forKey:");
  if (v4) {
    [(WebBookmarkCollection *)self postBookmarksDidReloadNotification];
  }
}

- (int)_favoritesFolderIdentifier
{
  int result = self->_favoritesFolderIdentifier;
  if (!result)
  {
    BOOL v4 = [(WebBookmarkCollection *)self favoritesFolder];
    self->_favoritesFolderIdentifier = [v4 identifier];

    return self->_favoritesFolderIdentifier;
  }
  return result;
}

- (void)_clearCachedFavoritesFolderIdentifier
{
  self->_favoritesFolderIdentifier = 0;
}

- (void)setFavoritesFolder:(id)a3 localOnly:(BOOL)a4
{
  id v8 = a3;
  if ([(WebBookmarkCollection *)self applyInMemoryChangesToDatabase])
  {
    uint64_t v6 = [(WebBookmarkCollection *)self favoritesFolder];
    int v7 = [v8 identifier];
    if (v7 != [v6 identifier])
    {
      if (a4
        || ([v6 identifier] == 1
         || ([v6 setSelectedFavoritesFolder:MEMORY[0x263EFFA80]],
             -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v6, -[WebBookmarkCollection _specialIDForBookmarkBeingSaved:](self, "_specialIDForBookmarkBeingSaved:", v6), 1)))&& ([v8 setSelectedFavoritesFolder:MEMORY[0x263EFFA88]], -[WebBookmarkCollection _saveBookmark:withSpecialID:updateGenerationIfNeeded:](self, "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", v8, -[WebBookmarkCollection _specialIDForBookmarkBeingSaved:](self, "_specialIDForBookmarkBeingSaved:", v8), 1)))
      {
        -[WebBookmarkCollection setFavoritesFolderIdentifier:postChangeNotification:](self, "setFavoritesFolderIdentifier:postChangeNotification:", [v8 identifier], 1);
      }
    }
  }
}

- (BOOL)bookmarkIsFavoritesFolder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 identifier];
  LOBYTE(self) = v5 == [(WebBookmarkCollection *)self _favoritesFolderIdentifier];

  return (char)self;
}

- (BOOL)bookmarkIsInFavoritesFolder:(id)a3
{
  id v4 = a3;
  int v5 = [(WebBookmarkCollection *)self favoritesFolder];
  uint64_t v6 = -[WebBookmarkCollection _descendantIDsOfBookmarkFolderID:](self, "_descendantIDsOfBookmarkFolderID:", [v5 identifier]);

  int v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "identifier"));
  char v8 = [v6 containsObject:v7];

  return v8;
}

- (WebBookmark)frequentlyVisitedSitesFolder
{
  return (WebBookmark *)[(WebBookmarkCollection *)self bookmarkWithSpecialID:5];
}

- (NSNumber)frequentlyVisitedSitesFolderBookmarkID
{
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, "SELECT id FROM bookmarks WHERE special_id = ?");
  sqlite3_bind_int(v6, 1, 5);
  if (sqlite3_step(v6) == 100)
  {
    BOOL v3 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(v6, 0));
  }
  else
  {
    BOOL v3 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return (NSNumber *)v3;
}

- (BOOL)_clearFrequentlyVisitedSitesFolder:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WebBookmarkCollection *)self frequentlyVisitedSitesFolderBookmarkID];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 intValue];
    WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v14, self->_db);
    if (v14[17]
      && -[WebBookmarkCollection _deleteRecursively:descendantsOnly:](self, "_deleteRecursively:descendantsOnly:", v7, v3)&& (objc_msgSend(NSString, "stringWithFormat:", @"UPDATE bookmarks SET num_children = 0 WHERE id = %d", v7), char v8 = objc_claimAutoreleasedReturnValue(), v9 = -[WebBookmarkCollection _executeSQL:](self, "_executeSQL:", v8), v8, !v9))
    {
      WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v14, v10, v11);
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
    WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v14);
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)clearFrequentlyVisitedSitesFolder
{
  return [(WebBookmarkCollection *)self _clearFrequentlyVisitedSitesFolder:1];
}

- (void)deleteFrequentlyVisitedSitesFolder
{
}

- (BOOL)bookmarkIsFrequentlyVisitedSite:(id)a3
{
  id v4 = a3;
  int v5 = [v4 parentID];
  uint64_t v6 = [(WebBookmarkCollection *)self frequentlyVisitedSitesFolderBookmarkID];
  LOBYTE(v5) = v5 == [v6 intValue];

  return v5;
}

- (void)_postBookmarksDidReloadNotification
{
  if ([(WebBookmarkCollection *)self _primaryCollection])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.bookmarks.BookmarksFileChanged", 0, 0, 0);
  }
}

- (void)_postBookmarksDidReloadNotificationAndStartReadingListFetcherIfChangesWereMade
{
  if (self->_dirty)
  {
    [(WebBookmarkCollection *)self _postBookmarksDidReloadNotification];
    [(WebBookmarkCollection *)self _startReadingListFetcher];
  }
  else
  {
    BOOL v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "WebBookmarks sync is not posting a change notification because the collection is not dirty", v4, 2u);
    }
  }
}

- (id)_folderContentsDidChangeNotificationName
{
  int64_t v2 = [(WBCollectionConfiguration *)self->_configuration collectionType];
  BOOL v3 = @"WebBookmarksTabFolderContentsDidChangeNotification";
  if (v2 != 1) {
    BOOL v3 = 0;
  }
  if (v2) {
    return v3;
  }
  else {
    return @"WebBookmarksFolderContentsDidChangeNotification";
  }
}

- (void)_postBookmarksFolderContentsDidChangeNotification:(int)a3
{
  if (self->_setupFinished)
  {
    id v4 = NSDictionary;
    int v5 = [NSNumber numberWithInt:*(void *)&a3];
    id v8 = [v4 dictionaryWithObject:v5 forKey:@"WebBookmarksChangedFolderID"];

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v7 = [(WebBookmarkCollection *)self _folderContentsDidChangeNotificationName];
    [v6 postNotificationName:v7 object:self userInfo:v8];
  }
}

- (void)_postBookmarksSpecialFoldersDidChangeNotification
{
  if (self->_setupFinished && ![(WBCollectionConfiguration *)self->_configuration collectionType])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"WebBookmarksSpecialFoldersDidChangeNotification" object:self userInfo:0];
  }
}

- (id)_safariFetcherServerProxy
{
  if ([(WebBookmarkCollection *)self _primaryCollection]
    && (+[WBFeatureManager sharedFeatureManager],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isOfflineReadingListAvailable],
        v3,
        (v4 & 1) != 0))
  {
    safariFetcherServerProxy = self->_safariFetcherServerProxy;
    if (!safariFetcherServerProxy)
    {
      uint64_t v6 = objc_alloc_init(SafariFetcherServerProxy);
      uint64_t v7 = self->_safariFetcherServerProxy;
      self->_safariFetcherServerProxy = v6;

      safariFetcherServerProxy = self->_safariFetcherServerProxy;
    }
    id v8 = safariFetcherServerProxy;
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)_startReadingListFetcher
{
  id v2 = [(WebBookmarkCollection *)self _safariFetcherServerProxy];
  [v2 startReadingListFetcher];
}

- (void)_simulateCrashWithDescription:(id)a3
{
  id v3 = a3;
  char v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[WebBookmarkCollection _simulateCrashWithDescription:]();
  }
}

- (BOOL)_importBookmarksPlist:(id)a3
{
  char v4 = [NSDictionary dictionaryWithContentsOfFile:a3];
  if (v4
    && [(WebBookmarkCollection *)self mergeWithBookmarksDictionary:v4 clearHidden:1 error:0])
  {
    [(WebBookmarkCollection *)self _normalizeDatabaseURLs];
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(WebBookmarkCollection *)v4 == 0 _importBookmarksPlist:v7];
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_importSyncAnchorPlist:(id)a3
{
  char v4 = [NSDictionary dictionaryWithContentsOfFile:a3];
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKey:@"ComputerAnchorKey"];
    if (v6) {
      BOOL v7 = [(WebBookmarkCollection *)self syncSetString:v6 forKey:@"ComputerAnchorKey"];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_normalizeDatabaseURLs
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT id, URL FROM bookmarks WHERE type = 0 AND deleted = 0");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v8, self->_db, "UPDATE bookmarks SET URL = ? WHERE id = ?");
  while (sqlite3_step(v11) == 100)
  {
    int v3 = sqlite3_column_int(v11, 0);
    char v4 = sqlite3_column_text(v11, 1);
    if (v4)
    {
      BOOL v5 = (void *)[[NSString alloc] initWithUTF8String:v4];
      uint64_t v6 = objc_msgSend(v5, "wb_bestURLForUserTypedString");
      BOOL v7 = [v6 absoluteString];

      if (v7)
      {
        if (([v5 isEqualToString:v7] & 1) == 0)
        {
          sqlite3_reset(pStmt);
          sqlite3_bind_text(pStmt, 1, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          sqlite3_bind_int(pStmt, 2, v3);
          sqlite3_step(pStmt);
        }
      }
    }
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v8);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);
}

- (void)_restoreOrMergeAllowedSitesFolderAndContentsWithWebFilterAllowedSites:(id)a3 ensureChildCount:(BOOL)a4 postChangeNotification:(BOOL)a5
{
  BOOL v27 = a5;
  BOOL v5 = a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v34 = self;
  uint64_t v7 = [(WebBookmarkCollection *)self webFilterAllowedSitesFolder];
  id v8 = (id)v7;
  if (!v7)
  {
    id v8 = [[WebBookmark alloc] initFolderWithParentID:0 collectionType:[(WBCollectionConfiguration *)v34->_configuration collectionType]];
    [v8 _setSyncable:0];
    [(WebBookmarkCollection *)v34 _saveBookmark:v8 withSpecialID:4 updateGenerationIfNeeded:1];
  }
  long long v31 = v8;
  uint64_t v29 = (void *)[v28 mutableCopy];
  uint64_t v30 = [MEMORY[0x263F089C8] indexSet];
  if (v7)
  {
    if (v5 && ![(WebBookmarkCollection *)v34 _ensureFolderChildrenCount:v8]) {
      goto LABEL_32;
    }
    int v9 = [v29 valueForKey:@"address"];
    uint64_t v10 = [(WebBookmarkCollection *)v34 webFilterAllowedSites];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v11 = [v10 bookmarkArray];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v12)
    {
      int v33 = 0;
      uint64_t v13 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v11);
          }
          int v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v16 = [v15 address];
          uint64_t v17 = [v9 indexOfObject:v16];
          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [(WebBookmarkCollection *)v34 deleteBookmark:v15 postChangeNotification:0];
            int v33 = 1;
          }
          else
          {
            [v30 addIndex:v17];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v12);
    }
    else
    {
      int v33 = 0;
    }
  }
  else
  {
    int v33 = 1;
  }
  [v29 removeObjectsAtIndexes:v30];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v29;
  uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        unint64_t v22 = [v21 objectForKey:@"pageTitle"];
        char v23 = [v21 objectForKey:@"address"];
        int v24 = [v21 objectForKey:@"bookmarkPath"];
        if ([v23 length] && objc_msgSend(v22, "length"))
        {
          uint64_t v25 = +[WebBookmark _allowedSiteBookmarkWithTitle:v22 address:v23];
          -[WebBookmarkCollection moveBookmark:toFolderWithID:](v34, "moveBookmark:toFolderWithID:", v25, [v31 identifier]);
          [(WebBookmarkCollection *)v34 saveBookmark:v25];

          int v33 = 1;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v18);
  }

  if ((v33 & v27) == 1)
  {
    int v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 postNotificationName:@"WebBookmarksDidReloadNotification" object:v34 userInfo:0];
  }
LABEL_32:
}

- (BOOL)_ensureFolderChildrenCount:(id)a3
{
  uint64_t v4 = [a3 identifier];
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS count_bookmarks WHERE count_bookmarks.parent = %d) WHERE (bookmarks.id = %d AND bookmarks.num_children < 0)", v4, v4);
  LOBYTE(self) = [(WebBookmarkCollection *)self _executeSQL:v5] == 0;

  return (char)self;
}

- (void)_clearAndCreateAncestorTable
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TABLE IF EXISTS folder_ancestors"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"DROP TRIGGER IF EXISTS fkd_ancestors_folder_id"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TABLE folder_ancestors (id INTEGER PRIMARY KEY AUTOINCREMENT, folder_id INTEGER NOT NULL CONSTRAINT fk_ancestors_folder_id REFERENCES bookmarks(id) ON DELETE CASCADE, ancestor_id INTEGER NOT NULL)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE TRIGGER fkd_ancestors_folder_id BEFORE DELETE ON bookmarks FOR EACH ROW BEGIN DELETE FROM folder_ancestors WHERE folder_id = OLD.id; END;"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX ancestor_folder_id_index on folder_ancestors(folder_id)"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"CREATE INDEX ancestor_ancestor_id_index on folder_ancestors(ancestor_id)"];
  [(WebBookmarkCollection *)self _rebuildAncestorTable];
}

- (BOOL)_insertAncestorTableEntriesForBookmarkID:(int)a3 withAncestorIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24, self->_db, "INSERT INTO folder_ancestors (folder_id, ancestor_id) VALUES (?, ?)");
  if (v26)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          sqlite3_reset(pStmt);
          sqlite3_bind_int(pStmt, 1, v4);
          sqlite3_bind_int(pStmt, 2, objc_msgSend(v11, "intValue", (void)v20));
          int v12 = sqlite3_step(pStmt);
          if (v12 != 101)
          {
            long long v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)id v28 = v11;
              *(_WORD *)&unsigned char v28[8] = 1024;
              *(_DWORD *)&v28[10] = v4;
              __int16 v29 = 1024;
              int v30 = v12;
              _os_log_error_impl(&dword_21C043000, v16, OS_LOG_TYPE_ERROR, "Could not insert ancestor table entry %{public}@ for bookmark %d, error: %d", buf, 0x18u);
            }

            goto LABEL_17;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf, self->_db, "SELECT id FROM bookmarks WHERE parent = ? AND type = 1 AND deleted = 0");
    if (v28[12])
    {
      sqlite3_bind_int(*(sqlite3_stmt **)&v28[4], 1, v4);
      uint64_t v13 = [NSNumber numberWithInt:v4];
      BOOL v14 = [v7 arrayByAddingObject:v13];

      while (1)
      {
        int v15 = sqlite3_step(*(sqlite3_stmt **)&v28[4]);
        if (v15 != 100) {
          break;
        }
        [(WebBookmarkCollection *)self _insertAncestorTableEntriesForBookmarkID:sqlite3_column_int(*(sqlite3_stmt **)&v28[4], 0) withAncestorIDs:v14];
      }
      BOOL v17 = v15 == 101;
      if (v15 != 101)
      {
        uint64_t v18 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection _insertAncestorTableEntriesForBookmarkID:withAncestorIDs:]();
        }
      }
    }
    else
    {
      BOOL v17 = 0;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)buf);
  }
  else
  {
LABEL_17:
    BOOL v17 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v24);

  return v17;
}

- (BOOL)_updateHiddenAncestorCountForBookmarksUnderFolderID:(int)a3 addingOffset:(int)a4
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "UPDATE bookmarks SET hidden_ancestor_count = hidden_ancestor_count + ? WHERE parent IN (SELECT folder_id from folder_ancestors WHERE ancestor_id = ?) OR parent = ?");
  sqlite3_bind_int(v8, 1, a4);
  sqlite3_bind_int(v8, 2, a3);
  sqlite3_bind_int(v8, 3, a3);
  LOBYTE(a3) = sqlite3_step(v8) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  return a3;
}

- (id)fastFetchBookmarksInBookmarkList:(id)a3
{
  id v4 = a3;
  if ([v4 bookmarkCount])
  {
    BOOL v5 = -[WebBookmarkCollection _fastFetchBookmarksInBookmarkFolder:includingHiddenBookmarks:](self, "_fastFetchBookmarksInBookmarkFolder:includingHiddenBookmarks:", [v4 folderID], 0);
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 includingHiddenBookmarks:(BOOL)a4
{
  return [(WebBookmarkCollection *)self _fastFetchBookmarksInBookmarkFolder:*(void *)&a3 options:a4 offset:0 limit:0 includingInMemoryChanges:1];
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 includingInMemoryChanges:(BOOL)a4
{
  return [(WebBookmarkCollection *)self _fastFetchBookmarksInBookmarkFolder:*(void *)&a3 options:0 offset:0 limit:0 includingInMemoryChanges:a4];
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 options:(unint64_t)a4 offset:(int)a5 limit:(int)a6
{
  return [(WebBookmarkCollection *)self _fastFetchBookmarksInBookmarkFolder:*(void *)&a3 options:a4 offset:*(void *)&a5 limit:*(void *)&a6 includingInMemoryChanges:1];
}

- (id)_fastFetchBookmarksInBookmarkFolder:(int)a3 options:(unint64_t)a4 offset:(int)a5 limit:(int)a6 includingInMemoryChanges:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v11 = *(void *)&a3;
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a4) {
    BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions(a4);
  }
  else {
  BOOL v14 = BookmarkInFolderWithoutIconColumnsSelectQuery();
  }
  int v15 = v14;
  if (a6 >= 1)
  {
    uint64_t v16 = [v14 stringByAppendingString:@" LIMIT ? OFFSET ?"];

    int v15 = (void *)v16;
  }
  db = self->_db;
  id v18 = v15;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28, db, (const char *)[v18 UTF8String]);
  sqlite3_bind_int(v29, 1, v11);
  if (a6 >= 1)
  {
    sqlite3_bind_int(v29, 2, a6);
    sqlite3_bind_int(v29, 3, a5);
  }
  while (sqlite3_step(v29) == 100)
  {
    uint64_t v19 = [WebBookmark alloc];
    long long v20 = v29;
    long long v21 = [(WebBookmarkCollection *)self currentDeviceIdentifier];
    long long v22 = [(WebBookmark *)v19 initWithSQLiteStatement:v20 deviceIdentifier:v21 hasIcon:0 collectionType:[(WBCollectionConfiguration *)self->_configuration collectionType] skipDecodingSyncData:0];

    [v13 addObject:v22];
  }
  if (v7)
  {
    long long v23 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    int v24 = v23;
    if (v23)
    {
      id v25 = [v23 bookmarksAfterReplayingChangesToBookmarks:v13 inFolderWithID:v11];
    }
    else
    {
      id v25 = v13;
    }
    id v26 = v25;

    id v13 = v26;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v28);

  return v13;
}

- (id)databaseHealthInformation
{
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT parent, count(*) AS identical_bookmarks FROM bookmarks GROUP BY parent, type, title, url HAVING identical_bookmarks > 1");
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  while (sqlite3_step(v10) == 100)
  {
    int v5 = sqlite3_column_int(v10, 0);
    sqlite3_int64 v6 = sqlite3_column_int64(v10, 1) - 1;
    v4 += v6;
    if (v5) {
      sqlite3_int64 v6 = 0;
    }
    v3 += v6;
  }
  BOOL v7 = [[WBBookmarksDatabaseHealthInformation alloc] initWithTopLevelDuplicateBookmarksCount:v3 allDuplicateBookmarksCount:v4];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v7;
}

- (BOOL)isMerging
{
  return self->_mergeMode != 0;
}

- (void)_setMergeMode:(int64_t)a3
{
  self->_mergeMode = a3;
}

- (int64_t)_mergeMode
{
  return self->_mergeMode;
}

- (BOOL)hasInMemoryChanges
{
  id v2 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
  uint64_t v3 = [v2 changes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)persistChangesWithCompletion:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
  [v4 persistChangesWithCompletion:v5];
}

- (id)applyInMemoryChanges:(id)a3
{
  uint64_t v3 = [(WebBookmarkCollection *)self _applyInMemoryChanges:a3 postChangeNotification:1];
  return v3;
}

- (void)_applyInMemoryChange:(id)a3 fromChangeSet:(id)a4 updatedBookmarks:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch([v8 changeType])
  {
    case 0:
      uint64_t v11 = -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", [v8 bookmarkID]);
      int v12 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v11 privacyPreservingDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = (uint64_t)v13;
        _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "Applying in-memory delete change for %{public}@", buf, 0xCu);
      }
      if (v11) {
        [(WebBookmarkCollection *)self _deleteBookmark:v11 postChangeNotification:0 forApplyingInMemoryChanges:1];
      }
      goto LABEL_21;
    case 2:
      BOOL v14 = [v8 bookmark];
      int v15 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [v14 privacyPreservingDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = (uint64_t)v16;
        _os_log_impl(&dword_21C043000, v15, OS_LOG_TYPE_INFO, "Applying in-memory add change for %{public}@", buf, 0xCu);
      }
      uint64_t v17 = [v14 identifier];
      uint64_t v18 = [v8 specialFolderID];
      if (v18)
      {
        uint64_t v19 = [(WebBookmarkCollection *)self bookmarkWithSpecialID:v18];
        objc_msgSend(v14, "_setParentID:", objc_msgSend(v19, "identifier"));
      }
      [(WebBookmarkCollection *)self _saveBookmark:v14 startReadingListFetcher:0 forApplyingInMemoryChanges:1];
      [v9 removeChange:v8];
      objc_msgSend(v9, "updateAddChangesWithInMemoryBookmarkID:toDatabaseGeneratedID:", v17, objc_msgSend(v14, "identifier"));
      [v10 addObject:v14];

      break;
    case 3:
      uint64_t v11 = -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", [v8 bookmarkID]);
      long long v20 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v21 = [v11 privacyPreservingDescription];
        long long v22 = [v8 bookmark];
        long long v23 = [v22 privacyPreservingDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = (uint64_t)v21;
        __int16 v50 = 2114;
        long long v51 = v23;
        _os_log_impl(&dword_21C043000, v20, OS_LOG_TYPE_INFO, "Applying in-memory modify change for %{public}@ from %{public}@", buf, 0x16u);
      }
      if (v11)
      {
        [v8 applyModificationsToBookmark:v11];
        [(WebBookmarkCollection *)self _saveBookmark:v11 startReadingListFetcher:0 forApplyingInMemoryChanges:1];
        [v9 removeChange:v8];
      }
      goto LABEL_21;
    case 4:
      uint64_t v11 = -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", [v8 bookmarkID]);
      int v24 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v11 privacyPreservingDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = (uint64_t)v25;
        _os_log_impl(&dword_21C043000, v24, OS_LOG_TYPE_INFO, "Applying in-memory move change for %{public}@", buf, 0xCu);
      }
      if (v11)
      {
        -[WebBookmarkCollection _moveBookmark:toFolderWithID:](self, "_moveBookmark:toFolderWithID:", v11, [v8 associatedBookmarkID]);
        [v9 removeChange:v8];
      }
LABEL_21:

      break;
    case 5:
      id v26 = -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", [v8 bookmarkID]);
      BOOL v27 = -[WebBookmarkCollection bookmarkWithID:](self, "bookmarkWithID:", [v8 associatedBookmarkID]);
      id v28 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        __int16 v29 = [v26 privacyPreservingDescription];
        int v30 = [v27 privacyPreservingDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = (uint64_t)v29;
        __int16 v50 = 2114;
        long long v51 = v30;
        _os_log_impl(&dword_21C043000, v28, OS_LOG_TYPE_INFO, "Applying in-memory reorder change for %{public}@ after %{public}@", buf, 0x16u);
      }
      if (v26)
      {
        [(WebBookmarkCollection *)self _reorderBookmark:v26 afterBookmark:v27];
        [v9 removeChange:v8];
      }

      break;
    case 6:
      long long v31 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = [v8 bookmarks];
        *(_DWORD *)buf = 134218240;
        uint64_t v49 = [v32 count];
        __int16 v50 = 1024;
        LODWORD(v51) = [v8 parentID];
        _os_log_impl(&dword_21C043000, v31, OS_LOG_TYPE_INFO, "Applying in-memory replace change for %zu bookmarks in folder %d", buf, 0x12u);
      }
      int v33 = [v8 bookmarks];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __77__WebBookmarkCollection__applyInMemoryChange_fromChangeSet_updatedBookmarks___block_invoke;
      v46[3] = &unk_2643DAAF8;
      v46[4] = self;
      id v34 = objc_msgSend(v33, "safari_mapObjectsUsingBlock:", v46);

      uint64_t v35 = [v8 parentID];
      uint64_t v36 = [v8 specialFolderID];
      if (v36)
      {
        long long v37 = [(WebBookmarkCollection *)self bookmarkWithSpecialID:v36];
        uint64_t v35 = [v37 identifier];
      }
      [(WebBookmarkCollection *)self _updateBookmarks:v34 inFolderWithID:v35];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v38 = v34;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v43 != v40) {
              objc_enumerationMutation(v38);
            }
            -[WebBookmarkCollection _saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:](self, "_saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:", *(void *)(*((void *)&v42 + 1) + 8 * i), 0, 1, (void)v42);
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v39);
      }

      [v9 removeChange:v8];
      break;
    default:
      break;
  }
}

id __77__WebBookmarkCollection__applyInMemoryChange_fromChangeSet_updatedBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [v3 UUID];
  sqlite3_int64 v6 = [v4 bookmarkWithUUID:v5];

  if (v6 && ([v3 isInserted] & 1) == 0) {
    objc_msgSend(v3, "_setID:", objc_msgSend(v6, "identifier"));
  }

  return v3;
}

uint64_t __70__WebBookmarkCollection__applyInMemoryChanges_postChangeNotification___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:@"WebBookmarksDidReloadNotification" object:*(void *)(a1 + 32) userInfo:0];
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 _postBookmarksChangedSyncNotification];
}

- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    [(WebBookmarkCollection *)self applyInMemoryChangesToDatabase];
    [v6 releaseLock];
  }
}

- (void)deleteBookmarkInMemory:(id)a3
{
  id v5 = a3;
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    uint64_t v4 = [v5 parentID];
    [(WebBookmarkCollection *)self _deleteBookmarkInMemory:v5];
    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v4];
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

- (void)deleteBookmarksInMemory:(id)a3 inFolder:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
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
          -[WebBookmarkCollection _deleteBookmarkInMemory:](self, "_deleteBookmarkInMemory:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v4];
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

- (void)_deleteBookmarkInMemory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v4 parentID];
  id v7 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
  uint64_t v8 = +[WebBookmarkChange deleteChangeWithBookmark:v4];
  [v7 addChange:v8];
  if ([v4 isFolder])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __49__WebBookmarkCollection__deleteBookmarkInMemory___block_invoke;
    v9[3] = &unk_2643DAB20;
    id v10 = v7;
    [(WebBookmarkCollection *)self _enumerateContentsOfBookmarkFolder:v5 includingSubfolders:1 usingBlock:v9];
  }
  else
  {
    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v6];
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

void __49__WebBookmarkCollection__deleteBookmarkInMemory___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = -[WebBookmarkChange initWithBookmarkID:parentID:changeType:]([WebBookmarkChange alloc], "initWithBookmarkID:parentID:changeType:", [v4 identifier], objc_msgSend(v4, "parentID"), 1);
  [*(id *)(a1 + 32) addChange:v3];
}

- (void)addBookmarkInMemory:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    id v7 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    uint64_t v8 = [v7 nextBookmarkIDForAddingBookmarkInMemory];
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218240;
      uint64_t v12 = (int)v8;
      __int16 v13 = 2048;
      uint64_t v14 = (int)v4;
      _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Adding bookmark in memory with identifier %ld to folder with identifier %ld", (uint8_t *)&v11, 0x16u);
    }
    [v6 _setParentID:v4];
    [v6 _setID:v8];
    id v10 = +[WebBookmarkChange bookmarkAddChangeWithBookmark:v6];
    [v7 addChange:v10];

    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v4];
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

- (void)modifyBookmarkInMemory:(id)a3
{
  id v6 = a3;
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    uint64_t v4 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    uint64_t v5 = +[WebBookmarkChange bookmarkModifyChangeWithBookmark:v6];
    [v4 addChange:v5];

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v6 parentID]);
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

- (void)moveBookmarkInMemory:(id)a3 toFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    id v6 = +[WebBookmarkChange moveChangeWithBookmark:v8 toFolderWithID:v4];
    id v7 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    [v7 addChange:v6];

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v8 parentID]);
    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v4];
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

- (void)reorderBookmarkInMemory:(id)a3 afterBookmark:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    id v7 = +[WebBookmarkChange reorderChangeWithBookmark:v9 afterBookmark:v6];
    id v8 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    [v8 addChange:v7];

    -[WebBookmarkCollection _postBookmarksFolderContentsDidChangeNotification:](self, "_postBookmarksFolderContentsDidChangeNotification:", [v9 parentID]);
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

- (void)replaceBookmarksInMemory:(id)a3 inFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  if ([(WebBookmarkCollection *)self _trackChangesInMemoryIfDatabaseWriteIsNotAllowed])
  {
    id v6 = +[WebBookmarkChange replaceChangeWithBookmarks:v8 inFolderWithID:v4];
    id v7 = [(WebBookmarkCollection *)self _inMemoryChangeSet];
    [v7 addChange:v6];

    [(WebBookmarkCollection *)self _postBookmarksFolderContentsDidChangeNotification:v4];
    [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor acquireLockWithTimeout:60.0];
  }
}

- (BOOL)deduplicateBookmarks
{
  return [(WebBookmarkCollection *)self deduplicateBookmarksWithRootFolder:0 depth:0];
}

- (BOOL)deduplicateBookmarksWithRootFolder:(int)a3 depth:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v11, self->_db);
  BOOL v9 = [(WebBookmarkCollection *)self _deduplicateBookmarksWithRootFolder:v5 depth:a4 trackChanges:1 considerBookmarksWithSyncDataAsUnique:0 davHomeURL:0];
  if (v9)
  {
    WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v11, v7, v8);
    [(WebBookmarkCollection *)self _postBookmarksDidReloadNotification];
  }
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)v11);
  return v9;
}

- (BOOL)_deduplicateBookmarksForSyncingAndTrackChanges:(BOOL)a3 considerBookmarksWithSyncDataAsUnique:(BOOL)a4
{
  return [(WebBookmarkCollection *)self _deduplicateBookmarksWithRootFolder:0 depth:0 trackChanges:a3 considerBookmarksWithSyncDataAsUnique:a4 davHomeURL:0];
}

- (BOOL)_deduplicateBookmarksForBookmarkDAVWithHomeURL:(id)a3
{
  id v4 = a3;
  if ([(WebBookmarkCollection *)self _deduplicateBookmarksWithRootFolder:0 depth:0 trackChanges:1 considerBookmarksWithSyncDataAsUnique:0 davHomeURL:v4])
  {
    uint64_t v5 = [v4 dataRepresentation];
    BOOL v6 = [(WebBookmarkCollection *)self setSyncData:v5 forKey:@"DAVHomeURL"];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_needsDeduplicationForBookmarkDAVWithHomeURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WebBookmarkCollection *)self syncDataForKey:@"DAVHomeURL"];
  if (v5)
  {
    BOOL v6 = (void *)[objc_alloc(NSURL) initWithDataRepresentation:v5 relativeToURL:0];
    int v7 = [v4 isEqual:v6] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)_deduplicateBookmarksWithRootFolder:(int)a3 depth:(unint64_t)a4 trackChanges:(BOOL)a5 considerBookmarksWithSyncDataAsUnique:(BOOL)a6 davHomeURL:(id)a7
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  [a7 absoluteString];
  objc_claimAutoreleasedReturnValue();
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy__2;
  long long v22 = __Block_byref_object_dispose__2;
  uint64_t v23 = [MEMORY[0x263EFF980] array];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  v17[5] = [MEMORY[0x263EFF980] array];
  [MEMORY[0x263EFF9C0] set];
  objc_claimAutoreleasedReturnValue();
  BOOL v9 = (void *)v19[5];
  id v10 = [NSNumber numberWithInt:v8];
  [v9 addObject:v10];

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __129__WebBookmarkCollection__deduplicateBookmarksWithRootFolder_depth_trackChanges_considerBookmarksWithSyncDataAsUnique_davHomeURL___block_invoke;
  v12[3] = &unk_2643DAB48;
  v12[4] = &v18;
  v12[5] = v16;
  BOOL v13 = a4 == 0;
  unsigned char v12[8] = a4;
  v12[6] = v14;
  v12[7] = v17;
  MEMORY[0x21D4A1230](v12);
  operator new();
}

uint64_t __129__WebBookmarkCollection__deduplicateBookmarksWithRootFolder_depth_trackChanges_considerBookmarksWithSyncDataAsUnique_davHomeURL___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
  if (!result)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (*(unsigned char *)(a1 + 72)
      || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= *(void *)(a1 + 64)
      || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v3 = [MEMORY[0x263EFF980] array];
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v5 = *(void *)(v4 + 40);
      *(void *)(v4 + 40) = v3;
      return MEMORY[0x270F9A758](v3, v5);
    }
  }
  return result;
}

- (BOOL)_deleteAndRebuildAncestorTableRecords
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, self->_db, "DELETE FROM folder_ancestors");
  BOOL v3 = sqlite3_step(v6) == 101 && [(WebBookmarkCollection *)self _rebuildAncestorTable];
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

- (BOOL)_recalculateCachedChildrenCountAndOrderIndices
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  [v3 addObject:&unk_26CC3FF60];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29, self->_db, "UPDATE bookmarks SET order_index = ? WHERE id = ?");
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v27, self->_db, "UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS b WHERE b.parent = ? AND b.hidden = 0) WHERE id = ? AND type = 1");
  char v4 = 0;
  uint64_t v19 = self;
  uint64_t v20 = v3;
  do
  {
    uint64_t v5 = objc_msgSend(v3, "count", v19);
    if (!v5) {
      break;
    }
    context = (void *)MEMORY[0x21D4A0FE0]();
    BOOL v6 = [v3 firstObject];
    [v3 removeObjectAtIndex:0];
    uint64_t v7 = [v6 intValue];
    uint64_t v8 = v7;
    if ((v4 & 1) == 0 || v7)
    {
      if (!(v4 & 1 | v7)) {
        char v4 = 1;
      }
      id v10 = [(WebBookmarkCollection *)self _fetchBookmarkIDsInFolder:v7 onlyFolders:0 includingHiddenBookmarks:1];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v12)
      {
        int v13 = 0;
        uint64_t v14 = *(void *)v24;
        uint64_t v21 = v5;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            sqlite3_reset(pStmt);
            sqlite3_clear_bindings(pStmt);
            sqlite3_bind_int(pStmt, 1, v13 + i);
            sqlite3_bind_int(pStmt, 2, [v16 intValue]);
            if (sqlite3_step(pStmt) != 101)
            {
              int v9 = 1;
              uint64_t v17 = v11;
              self = v19;
              BOOL v3 = v20;
              uint64_t v5 = v21;
              goto LABEL_18;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          v13 += i;
          BOOL v3 = v20;
          uint64_t v5 = v21;
          if (v12) {
            continue;
          }
          break;
        }
      }

      self = v19;
      uint64_t v17 = [(WebBookmarkCollection *)v19 _fetchBookmarkIDsInFolder:v8 onlyFolders:1 includingHiddenBookmarks:1];
      [v3 addObjectsFromArray:v17];
      sqlite3_reset(v28);
      sqlite3_clear_bindings(v28);
      sqlite3_bind_int(v28, 1, v8);
      sqlite3_bind_int(v28, 2, v8);
      int v9 = sqlite3_step(v28) != 101;
LABEL_18:
    }
    else
    {
      int v9 = 2;
    }
  }
  while ((v9 | 2) == 2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v27);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v29);

  return v5 == 0;
}

- (BOOL)_bookmarkHasSyncedToServer:(id)a3
{
  id v4 = a3;
  if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    uint64_t v5 = [(WebBookmarkCollection *)self syncDataForBookmark:v4];
    BOOL v6 = [v5 record];
  }
  else
  {
    uint64_t v5 = [v4 syncData];
    BOOL v6 = v5;
  }

  return v6 != 0;
}

- (BOOL)_bookmark:(id)a3 hasPriorityOverBookmarkForDeduplication:(id)a4 prioritizeBookmarksWithSyncData:(BOOL)a5 davHomePath:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = [v10 specialID];
  int v14 = [v11 specialID];
  if (v13 && !v14) {
    goto LABEL_3;
  }
  if (!v13 && v14)
  {
LABEL_6:
    BOOL v15 = 0;
    goto LABEL_7;
  }
  if (v7)
  {
    BOOL v17 = [(WebBookmarkCollection *)self _bookmarkHasSyncedToServer:v10];
    BOOL v18 = [(WebBookmarkCollection *)self _bookmarkHasSyncedToServer:v11];
    if (v17 && !v18) {
      goto LABEL_3;
    }
    if (!v17 && v18) {
      goto LABEL_6;
    }
  }
  BOOL v19 = [(WebBookmarkCollection *)self _bookmark:v10 hasCurrentDAVHomePath:v12];
  BOOL v20 = [(WebBookmarkCollection *)self _bookmark:v11 hasCurrentDAVHomePath:v12];
  if (!v19 || v20)
  {
    if (!v19 && v20) {
      goto LABEL_6;
    }
    uint64_t v21 = [v10 serverID];
    long long v22 = [v11 serverID];
    uint64_t v23 = [v21 length];
    uint64_t v24 = [v22 length];
    if (v23 && !v24) {
      goto LABEL_15;
    }
    if (v23 || !v24)
    {
      int v25 = objc_msgSend(v21, "safari_isSpecialFolderRecordName");
      int v26 = objc_msgSend(v22, "safari_isSpecialFolderRecordName");
      if (((v25 ^ 1 | v26) & 1) == 0)
      {
LABEL_15:
        BOOL v15 = 1;
LABEL_19:

        goto LABEL_7;
      }
      if ((v25 | v26 ^ 1) == 1)
      {
        BOOL v15 = [v21 compare:v22] == -1;
        goto LABEL_19;
      }
    }
    BOOL v15 = 0;
    goto LABEL_19;
  }
LABEL_3:
  BOOL v15 = 1;
LABEL_7:

  return v15;
}

- (BOOL)_bookmark:(id)a3 hasCurrentDAVHomePath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 serverID];
  if ([v6 length])
  {
    if (v5) {
      char v7 = objc_msgSend(v6, "_webBookmarks_hasCaseInsensitivePrefix:", v5);
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_appendDuplicateBookmarkGroupsInBookmarks:(id)a3 toGroups:(id)a4 considerBookmarksWithSyncDataAsUnique:(BOOL)a5 davHomePath:(id)a6
{
  BOOL v32 = a5;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v27 = a4;
  id v30 = a6;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v11 = 0;
      uint64_t v28 = v10;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * v11);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v31 = v27;
        uint64_t v13 = [v31 countByEnumeratingWithState:&v33 objects:v41 count:16];
        uint64_t v29 = v11;
        if (!v13)
        {

LABEL_26:
          uint64_t v24 = [[WBDuplicateBookmarkGroup alloc] initWithOriginalBookmark:v12];
          [v31 addObject:v24];

          goto LABEL_27;
        }
        char v14 = 0;
        uint64_t v15 = *(void *)v34;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v31);
            }
            BOOL v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
            BOOL v18 = (void *)MEMORY[0x21D4A0FE0]();
            BOOL v19 = [v17 originalBookmark];
            BOOL v20 = [(WebBookmarkCollection *)self _bookmark:v12 isDuplicateOfBookmark:v19];
            BOOL v21 = v20;
            if (v20)
            {
              BOOL v22 = [(WebBookmarkCollection *)self _bookmark:v12 hasPriorityOverBookmarkForDeduplication:v19 prioritizeBookmarksWithSyncData:v32 davHomePath:v30];
              if (v32)
              {
                if ([(WebBookmarkCollection *)self _bookmarkHasSyncedToServer:v19]
                  && v22)
                {
                  [v17 addDuplicateBookmarkToKeep:v19];
                  [v17 exchangeOriginalBookmarkWithBookmark:v12];
LABEL_17:
                  char v14 = 1;
                  goto LABEL_18;
                }
                if (!([(WebBookmarkCollection *)self _bookmarkHasSyncedToServer:v12] ^ 1 | v22))
                {
                  [v17 addDuplicateBookmarkToKeep:v12];
                  goto LABEL_17;
                }
              }
              [v17 addDuplicateBookmark:v12 replaceOriginal:v22];
              goto LABEL_17;
            }
LABEL_18:

            if (v21) {
              goto LABEL_23;
            }
            ++v16;
          }
          while (v13 != v16);
          uint64_t v23 = [v31 countByEnumeratingWithState:&v33 objects:v41 count:16];
          uint64_t v13 = v23;
        }
        while (v23);
LABEL_23:

        if ((v14 & 1) == 0) {
          goto LABEL_26;
        }
LABEL_27:
        uint64_t v11 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);
  }
}

- (BOOL)_bookmark:(id)a3 isDuplicateOfBookmark:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 isFolder];
  if (v7 != [v5 isFolder]
    || (int v8 = [v6 identifier], v8 == objc_msgSend(v5, "identifier"))
    || ![v6 isSyncable]
    || ![v5 isSyncable])
  {
    char v14 = 0;
    goto LABEL_8;
  }
  id v9 = [v6 serverID];
  uint64_t v10 = objc_msgSend(v9, "_wb_stringByStandardizingDAVServerID");
  uint64_t v11 = [v5 serverID];
  uint64_t v12 = objc_msgSend(v11, "_wb_stringByStandardizingDAVServerID");
  char v13 = [v10 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    uint64_t v16 = [v5 title];
    BOOL v17 = [v6 title];
    if (v17 == v16)
    {
    }
    else
    {
      BOOL v18 = [v6 title];
      BOOL v19 = [v5 title];
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) == 0)
      {
        char v14 = 0;
LABEL_20:

        goto LABEL_8;
      }
    }
    BOOL v21 = [v5 address];
    if ([v6 isFolder])
    {
      LOBYTE(v22) = 0;
    }
    else
    {
      uint64_t v23 = [v6 address];
      if (v21 == v23)
      {
        LOBYTE(v22) = 0;
      }
      else
      {
        uint64_t v24 = [v6 address];
        int v22 = [v24 isEqualToString:v21] ^ 1;
      }
    }
    char v14 = v22 ^ 1;

    goto LABEL_20;
  }
  char v14 = 1;
LABEL_8:

  return v14;
}

- (id)_fetchBookmarkIDsInFolder:(int)a3 onlyFolders:(BOOL)a4 includingHiddenBookmarks:(BOOL)a5
{
  int v7 = &stru_26CC2ED50;
  int v8 = @" AND type = 1";
  if (!a4) {
    int v8 = &stru_26CC2ED50;
  }
  if (!a5) {
    int v7 = @" AND hidden = 0";
  }
  id v9 = [NSString stringWithFormat:@"parent = ?%@%@", v8, v7];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v13, [(WebBookmarkCollection *)self _selectBookmarksWhere:v9 returnType:1]);
  sqlite3_bind_int(v14, 1, a3);
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  while (sqlite3_step(v14) == 100)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(v14, 0));
    [v10 addObject:v11];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v13);

  return v10;
}

- (BOOL)_mergeBookmark:(id)a3 withOriginalBookmark:(id)a4 prioritizeOriginalBookmarkAttributes:(BOOL)a5 generateChangesIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v40 = a5;
  id v9 = a3;
  id v10 = a4;
  if (![v10 specialID])
  {
    uint64_t v12 = [v10 isSelectedFavoritesFolder];
    unsigned int v39 = [v12 BOOLValue];

    if ([v9 isFolder]) {
      goto LABEL_7;
    }
    char v13 = [v10 title];
    char v14 = [v9 title];
    char v15 = [v13 isEqualToString:v14];

    if (v15) {
      goto LABEL_7;
    }
    uint64_t v16 = [v9 title];
    uint64_t v17 = [v16 length];

    BOOL v18 = [v10 title];
    unint64_t v19 = [v18 length];

    if (v17 - 1 >= v19)
    {
LABEL_7:
      int v21 = 0;
    }
    else
    {
      char v20 = [v9 title];
      [v10 setTitle:v20];

      int v21 = 1;
    }
    if (([v9 isFolder] & 1) == 0)
    {
      int v22 = [v10 address];
      uint64_t v23 = [v9 address];
      char v24 = [v22 isEqualToString:v23];

      if ((v24 & 1) == 0)
      {
        int v25 = [v9 address];
        [v10 setAddress:v25];

        int v21 = 1;
      }
    }
    uint64_t v26 = [v10 extraAttributes];
    id v27 = [v9 extraAttributes];
    uint64_t v28 = [v26 count];
    uint64_t v29 = [v27 count];
    if (v28 || !v29)
    {
      if (v28 && !v29) {
        goto LABEL_17;
      }
      if (!v29 || !v28 || ([v27 isEqualToDictionary:v26] & 1) != 0)
      {
LABEL_18:
        id v31 = [v10 localAttributes];
        BOOL v32 = [v9 localAttributes];
        uint64_t v33 = [v31 count];
        uint64_t v34 = [v32 count];
        if (v33 || !v34)
        {
          if (v33 && !v34) {
            goto LABEL_24;
          }
          if (!v34 || !v33 || ([v32 isEqualToDictionary:v31] & 1) != 0) {
            goto LABEL_25;
          }
          if (v40)
          {
            long long v35 = (void *)[v32 mutableCopy];
            [v35 addEntriesFromDictionary:v31];
          }
          else
          {
            long long v35 = (void *)[v31 mutableCopy];
            [v35 addEntriesFromDictionary:v32];
          }
          [v10 setLocalAttributes:v35];
        }
        else
        {
          long long v35 = [v9 localAttributes];
          [v10 setLocalAttributes:v35];
        }

LABEL_24:
        int v21 = 1;
LABEL_25:
        [v10 cleanUpRedundantPreviewText];
        BOOL v11 = [(WebBookmarkCollection *)self _saveBookmark:v10 withSpecialID:0 updateGenerationIfNeeded:v21 & v6];
        uint64_t v36 = [v10 identifier];
        long long v37 = [v10 isSelectedFavoritesFolder];
        -[WebBookmarkCollection updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:](self, "updateSelectedFavoritesFolderWithBookmarkID:wasFavoritesFolder:isFavoritesFolder:", v36, v39, [v37 BOOLValue]);

        goto LABEL_26;
      }
      if (v40)
      {
        id v30 = (void *)[v27 mutableCopy];
        [v30 addEntriesFromDictionary:v26];
      }
      else
      {
        id v30 = (void *)[v26 mutableCopy];
        [v30 addEntriesFromDictionary:v27];
      }
      [v10 setExtraAttributes:v30];
    }
    else
    {
      id v30 = [v9 extraAttributes];
      [v10 setExtraAttributes:v30];
    }

LABEL_17:
    int v21 = 1;
    goto LABEL_18;
  }
  BOOL v11 = 1;
LABEL_26:

  return v11;
}

- (void)updateSelectedFavoritesFolderWithBookmarkID:(int)a3 wasFavoritesFolder:(BOOL)a4 isFavoritesFolder:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = +[WBFeatureManager sharedFeatureManager];
  int v10 = [v9 favoritesFolderSelectionShouldSync];

  if ((v6 || v5) & v10)
  {
    if (!v6
      || v5
      || ([(WebBookmarkCollection *)self favoritesFolder],
          BOOL v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 identifier],
          v11,
          v12 == a3))
    {
      if (v5) {
        uint64_t v13 = a3;
      }
      else {
        uint64_t v13 = 0;
      }
      [(WebBookmarkCollection *)self setFavoritesFolderIdentifier:v13 postChangeNotification:0];
    }
  }
}

- (BOOL)_usesCloudKit
{
  return [(WebBookmarkCollection *)self _syncType] == 1;
}

- (BOOL)setLocalMigrationState:(int64_t)a3 generateDeviceIdentifierIfNeeded:(BOOL)a4
{
  BOOL v6 = objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), a4);
  int v7 = [v6 UUID];
  int v8 = [v7 UUIDString];

  if ([v8 length])
  {
    id v9 = [@"_ck_local_migration_state_" stringByAppendingString:v8];
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a3);
    char v21 = 0;
    if ([(WebBookmarkCollection *)self _syncSetString:v10 forKey:v9 updatedExistingKey:&v21])
    {
      if (v21)
      {
        LOBYTE(v11) = 1;
        self->_dirty = 1;
      }
      else
      {
        WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19, self->_db, "DELETE FROM sync_properties WHERE key != ? AND key LIKE ?");
        uint64_t v13 = [NSString stringWithFormat:@"%@%%", @"_ck_local_migration_state_"];
        sqlite3_bind_text(v20, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        BOOL v11 = v20;
        id v14 = v13;
        sqlite3_bind_text(v11, 2, (const char *)[v14 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        int v15 = sqlite3_step(v20);
        LOBYTE(v11) = v15 == 101;
        if (v15 == 101)
        {
          self->_dirty = 1;
        }
        else
        {
          uint64_t v16 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[WebBookmarkCollection setLocalMigrationState:generateDeviceIdentifierIfNeeded:]();
          }
        }

        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v19);
      }
    }
    else
    {
      int v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection setLocalMigrationState:generateDeviceIdentifierIfNeeded:]();
      }
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LODWORD(v11) = [v6 encounteredErrorWhileObtainingUUID] ^ 1;
  }

  return (char)v11;
}

- (NSData)deprecatedUsernameAccountHash
{
  return (NSData *)[(WebBookmarkCollection *)self syncDataForKey:@"AccountHash"];
}

- (NSData)accountHash
{
  return (NSData *)[(WebBookmarkCollection *)self syncDataForKey:@"AccountDSIDHash"];
}

- (BOOL)updateAccountHash:(id)a3
{
  return [(WebBookmarkCollection *)self setSyncData:a3 forKey:@"AccountDSIDHash"];
}

- (id)syncableBookmarksIDsInFolderWithBookmarkID:(int)a3
{
  [(WebBookmarkCollection *)self logRegulatoryBookmarksRead];
  BOOL v5 = [MEMORY[0x263EFF9C0] set];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10, self->_db, "SELECT id from bookmarks where parent = ? AND deleted = 0 AND syncable = 1");
  if (v12)
  {
    sqlite3_bind_int(v11, 1, a3);
    while (1)
    {
      int v6 = sqlite3_step(v11);
      if (v6 != 100) {
        break;
      }
      int v7 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(v11, 0));
      [v5 addObject:v7];
    }
    if (v6 == 101) {
      int v8 = v5;
    }
    else {
      int v8 = 0;
    }
    if (v6 == 101) {
      BOOL v5 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v10);

  return v8;
}

- (unsigned)orderIndexOfBookmark:(id)a3 withSyncPosition:(id)a4 inFolderWithID:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(WebBookmarkCollection *)self maintainsSyncMetadata];
  if (v9) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17, self->_db, "SELECT sync_data, order_index FROM bookmarks WHERE special_id = 0 AND syncable = 1 AND deleted = 0 AND parent = ? AND id != ? ORDER BY order_index DESC");
    sqlite3_bind_int(v18, 1, a5);
    sqlite3_bind_int(v18, 2, [v8 identifier]);
    char v12 = 0;
    while (sqlite3_step(v18) == 100)
    {
      uint64_t v13 = WBDataFromNullableColumn(v18, 0);
      id v14 = +[WBBookmarkSyncData positionFromContentsOfData:v13];

      char v12 = v14;
      if ([v14 compare:v9] == -1)
      {
        unsigned int v15 = sqlite3_column_int(v18, 1) + 1;
        char v12 = v14;
        goto LABEL_11;
      }
    }
    unsigned int v15 = 0;
LABEL_11:

    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v17);
  }
  else
  {
    unsigned int v15 = [(WebBookmarkCollection *)self orderIndexOfBookmark:v8];
  }

  return v15;
}

- (id)_positionBeforeBookmark:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[WebBookmarkCollection _positionBeforeOrderIndex:inFolderWithID:](self, "_positionBeforeOrderIndex:inFolderWithID:", -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v4), [v4 parentID]);

  return v5;
}

- (id)_positionBeforeOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT sync_data FROM bookmarks WHERE special_id = 0 AND syncable = 1 AND deleted = 0 AND parent = ? AND order_index < ? ORDER BY order_index DESC");
  sqlite3_bind_int(v10, 1, a4);
  sqlite3_bind_int(v10, 2, a3);
  while (sqlite3_step(v10) == 100)
  {
    int v6 = WBDataFromNullableColumn(v10, 0);
    int v7 = +[WBBookmarkSyncData positionFromContentsOfData:v6];

    if (v7) {
      goto LABEL_6;
    }
  }
  int v7 = 0;
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v7;
}

- (id)_positionAfterBookmark:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[WebBookmarkCollection _positionAfterOrderIndex:inFolderWithID:](self, "_positionAfterOrderIndex:inFolderWithID:", -[WebBookmarkCollection orderIndexOfBookmark:](self, "orderIndexOfBookmark:", v4), [v4 parentID]);

  return v5;
}

- (id)_positionAfterOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT sync_data FROM bookmarks WHERE special_id = 0 AND syncable = 1 AND deleted = 0 AND parent = ? AND order_index > ? ORDER BY order_index ASC");
  sqlite3_bind_int(v10, 1, a4);
  sqlite3_bind_int(v10, 2, a3);
  while (sqlite3_step(v10) == 100)
  {
    int v6 = WBDataFromNullableColumn(v10, 0);
    int v7 = +[WBBookmarkSyncData positionFromContentsOfData:v6];

    if (v7) {
      goto LABEL_6;
    }
  }
  int v7 = 0;
LABEL_6:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);
  return v7;
}

- (id)_generateSyncPositionForOrderIndex:(unsigned int)a3 inFolderWithID:(int)a4 direction:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v19[0] = 67109376;
      v19[1] = a3;
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Generating position for order index %d in folder id %d", (uint8_t *)v19, 0xEu);
    }
    BOOL v10 = a5 != -1;
    if (a5 == -1) {
      uint64_t v11 = a3 + 1;
    }
    else {
      uint64_t v11 = a3;
    }
    char v12 = [(WebBookmarkCollection *)self _positionBeforeOrderIndex:v11 inFolderWithID:v6];
    uint64_t v13 = [(WebBookmarkCollection *)self _positionAfterOrderIndex:a3 - v10 inFolderWithID:v6];
    id v14 = objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), 1);
    unsigned int v15 = [v14 UUID];
    uint64_t v16 = [v15 UUIDString];

    uint64_t v17 = objc_msgSend(MEMORY[0x263F66618], "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v12, v13, v16, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));
  }
  else
  {
    uint64_t v17 = 0;
  }
  return v17;
}

- (id)generateSyncPositionForBookmark:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WebBookmarkCollection *)self maintainsSyncMetadata])
  {
    BOOL v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "Generating position for bookmark %{public}@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v6 = [(WebBookmarkCollection *)self _positionBeforeBookmark:v4];
    int v7 = [(WebBookmarkCollection *)self _positionAfterBookmark:v4];
    id v8 = objc_msgSend((id)objc_opt_class(), "deviceIdentifierForCloudKitWithCollectionType:generateIfNeeded:", -[WBCollectionConfiguration collectionType](self->_configuration, "collectionType"), 1);
    id v9 = [v8 UUID];
    BOOL v10 = [v9 UUIDString];

    uint64_t v11 = objc_msgSend(MEMORY[0x263F66618], "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v6, v7, v10, -[WebBookmarkCollection nextDatabaseSyncChangeID](self, "nextDatabaseSyncChangeID"));
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (WBBookmarkDatabaseSyncData)databaseSyncData
{
  id v2 = [(WebBookmarkCollection *)self syncDataForKey:@"BASyncData"];
  BOOL v3 = +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:v2];

  return (WBBookmarkDatabaseSyncData *)v3;
}

- (BOOL)saveDatabaseSyncData:(id)a3
{
  id v4 = [a3 encodedDatabaseSyncData];
  LOBYTE(self) = [(WebBookmarkCollection *)self setSyncData:v4 forKey:@"BASyncData"];

  return (char)self;
}

- (BOOL)clearSyncDataAfterICloudKeychainReset
{
  BOOL v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Clearing sync data because the user has reset the iCloud Keychain.", buf, 2u);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__WebBookmarkCollection_clearSyncDataAfterICloudKeychainReset__block_invoke;
  v5[3] = &unk_2643DA0F8;
  v5[4] = self;
  return [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v5 secureDelete:0];
}

uint64_t __62__WebBookmarkCollection_clearSyncDataAfterICloudKeychainReset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSyncDataAfterICloudKeychainReset];
}

- (BOOL)_clearSyncDataAfterICloudKeychainReset
{
  [(WebBookmarkCollection *)self setLastSyncedRecordGeneration:0];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __63__WebBookmarkCollection__clearSyncDataAfterICloudKeychainReset__block_invoke;
  v9[3] = &unk_2643DA140;
  void v9[4] = self;
  v9[5] = &v10;
  [(WebBookmarkCollection *)self enumerateDescendantsOfBookmarkID:0 usingBlock:v9];
  if (*((unsigned char *)v11 + 24))
  {
    BOOL v3 = 0;
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "UPDATE bookmarks SET added = 1");
    int v4 = sqlite3_step(v8);
    BOOL v3 = v4 == 101;
    if (v4 != 101)
    {
      BOOL v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection _clearAllSyncData]();
      }
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
  }
  _Block_object_dispose(&v10, 8);
  return v3;
}

void __63__WebBookmarkCollection__clearSyncDataAfterICloudKeychainReset__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([v5 isSyncable])
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, *(sqlite3 **)(*(void *)(a1 + 32) + 8), (const char *)[@"UPDATE bookmarks SET dav_generation = ? WHERE id = ?" UTF8String]);
    sqlite3_bind_int64(v8, 1, [*(id *)(a1 + 32) currentRecordGeneration]);
    sqlite3_bind_int(v8, 2, [v5 identifier]);
    if ([*(id *)(a1 + 32) updateSyncDataForBookmark:v5 usingBlock:&__block_literal_global_1048])
    {
      if (sqlite3_step(v8) == 101)
      {
        [*(id *)(a1 + 32) _incrementGeneration];
LABEL_10:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);
        goto LABEL_11;
      }
      uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        [v5 privacyPreservingDescription];
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        [v5 privacyPreservingDescription];
        objc_claimAutoreleasedReturnValue();
        __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_2();
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_10;
  }
LABEL_11:
}

id __63__WebBookmarkCollection__clearSyncDataAfterICloudKeychainReset__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 clearAllCKRecords];
  return v2;
}

- (BOOL)updateDatabaseSyncDataUsingBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __58__WebBookmarkCollection_updateDatabaseSyncDataUsingBlock___block_invoke;
  v7[3] = &unk_2643DAB90;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v7 secureDelete:0];

  return (char)self;
}

uint64_t __58__WebBookmarkCollection_updateDatabaseSyncDataUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) databaseSyncData];
  id v4 = v3;
  if (!v3) {
    id v4 = objc_alloc_init(WBBookmarkDatabaseSyncData);
  }
  id v5 = (*(void (**)(uint64_t, WBBookmarkDatabaseSyncData *))(v2 + 16))(v2, v4);
  if (!v3) {

  }
  if (v5) {
    uint64_t v6 = [*(id *)(a1 + 32) saveDatabaseSyncData:v5];
  }
  else {
    uint64_t v6 = 1;
  }

  return v6;
}

- (int64_t)nextDatabaseSyncChangeID
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__WebBookmarkCollection_nextDatabaseSyncChangeID__block_invoke;
  v4[3] = &unk_2643DABB8;
  v4[4] = &v5;
  [(WebBookmarkCollection *)self updateDatabaseSyncDataUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __49__WebBookmarkCollection_nextDatabaseSyncChangeID__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 nextChangeID];
  return v3;
}

- (id)modifiedSyncingAttributesForBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WebBookmarkCollection *)self allSyncingAttributesForBookmark:v4];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = +[WebBookmark modifiedAttributesToFieldNames];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__WebBookmarkCollection_modifiedSyncingAttributesForBookmark___block_invoke;
  v11[3] = &unk_2643DABE0;
  id v8 = v4;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  return v9;
}

void __62__WebBookmarkCollection_modifiedSyncingAttributesForBookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_fieldsForAttributes:", objc_msgSend(v9, "unsignedIntegerValue"));
  uint64_t v7 = [v6 firstObject];

  uint64_t v8 = [*(id *)(a1 + 32) _attributesForField:v7];
  if (([*(id *)(a1 + 32) modifiedAttributes] & v8) == 0) {
    [*(id *)(a1 + 40) removeObjectForKey:v5];
  }
}

- (id)allSyncingAttributesForBookmark:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [v4 syncState];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
  }
  [v5 setObject:v7 forKeyedSubscript:@"Deleted"];
  if (!v6) {

  }
  if ([v6 integerValue] != 1)
  {
    uint64_t v8 = [v4 parentID];
    if (v8 == [(WebBookmarkCollection *)self bookmarkIDWithSpecialID:6])
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [(WebBookmarkCollection *)self _serverIDForBookmarkID:v8 generateIfNeeded:1];
    }
    uint64_t v10 = [v4 minimumSyncAPIVersion];
    uint64_t v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = &unk_26CC3FF78;
    }
    [v5 setObject:v12 forKeyedSubscript:@"MinimumAPIVersion"];

    if (([v4 isFolder] & 1) != 0 || !objc_msgSend(v4, "isPinned"))
    {
      uint64_t v18 = [v4 title];
      id v14 = (void *)v18;
      if (v18)
      {
        int v17 = 0;
        int v16 = 0;
        int v15 = 1;
        id v13 = (void *)v18;
      }
      else
      {
        id v13 = [MEMORY[0x263EFF9D0] null];
        int v17 = 0;
        id v14 = 0;
        int v15 = 1;
        int v16 = 1;
      }
    }
    else
    {
      id v13 = [v4 pinnedTitle];
      id v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 1;
    }
    [v5 setObject:v13 forKeyedSubscript:@"Title"];
    if (v16)
    {

      if (!v15) {
        goto LABEL_20;
      }
    }
    else if (!v15)
    {
LABEL_20:
      if (!v17)
      {
LABEL_22:
        unint64_t v19 = [(WebBookmarkCollection *)self syncDataForBookmark:v4];
        __int16 v20 = [v19 positionDictionaryRepresentation];
        int v21 = v20;
        if (!v20)
        {
          int v21 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v21 forKeyedSubscript:@"Position"];
        if (!v20) {

        }
        uint64_t v22 = v9;
        if (!v9)
        {
          uint64_t v22 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v22 forKeyedSubscript:@"ParentFolder"];
        if (!v9) {

        }
        uint64_t v23 = -[WebBookmarkCollection serverIDForBookmarkID:](self, "serverIDForBookmarkID:", [v4 lastSelectedChildID]);
        char v24 = v23;
        if (!v23)
        {
          char v24 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v24 forKeyedSubscript:@"LastSelectedTab"];
        if (!v23) {

        }
        int v25 = [v4 extraAttributes];
        uint64_t v26 = [v25 objectForKeyedSubscript:@"SymbolImageName"];
        id v27 = v26;
        if (!v26)
        {
          id v27 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v27 forKeyedSubscript:@"SymbolImageName"];
        if (!v26) {

        }
        uint64_t v28 = [v4 extraAttributes];
        uint64_t v29 = [v28 objectForKeyedSubscript:@"CustomFavoritesFolderServerID"];
        id v30 = v29;
        if (!v29)
        {
          id v30 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v30 forKeyedSubscript:@"CustomFavoritesFolderServerID"];
        if (!v29) {

        }
        id v31 = [v4 startPageSectionsDataRepresentation];
        BOOL v32 = v31;
        if (!v31)
        {
          BOOL v32 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v32 forKeyedSubscript:@"CustomStartPageSectionsData"];
        if (!v31) {

        }
        uint64_t v33 = [v4 UUID];
        if (v33)
        {
          uint64_t v34 = [MEMORY[0x263F08850] defaultManager];
          long long v35 = objc_msgSend(v34, "safari_startPageBackgroundImageFileURLForIdentifier:", v33);

          char v36 = [v35 checkResourceIsReachableAndReturnError:0];
          long long v37 = v35;
          if ((v36 & 1) == 0)
          {
            long long v37 = [MEMORY[0x263EFF9D0] null];
          }
          [v5 setObject:v37 forKeyedSubscript:@"BackgroundImage"];
          if ((v36 & 1) == 0) {
        }
          }
        long long v38 = [v4 extraAttributes];
        unsigned int v39 = objc_msgSend(v38, "safari_numberForKey:", @"com.apple.bookmarks.SelectedFavoritesFolder");
        BOOL v40 = v39;
        if (!v39)
        {
          BOOL v40 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v40 forKeyedSubscript:@"IsSelectedFavoritesFolder"];
        if (!v39) {

        }
        if (([v4 isFolder] & 1) != 0 || !objc_msgSend(v4, "isPinned"))
        {
          long long v41 = [v4 address];
        }
        else
        {
          long long v41 = [v4 pinnedAddress];
        }
        id v42 = v41;

        uint64_t v43 = [NSURL URLWithString:v42];
        long long v44 = v43;
        if (!v43)
        {
          long long v44 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v44 forKeyedSubscript:@"URL"];
        if (!v43) {

        }
        long long v45 = [v4 dateAdded];
        long long v46 = v45;
        if (!v45)
        {
          long long v46 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v46 forKeyedSubscript:@"DateAdded"];
        if (!v45) {

        }
        long long v47 = [v4 dateLastViewed];
        long long v48 = v47;
        if (!v47)
        {
          long long v48 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v48 forKeyedSubscript:@"DateLastViewed"];
        if (!v47) {

        }
        uint64_t v49 = [v4 previewText];
        __int16 v50 = v49;
        if (!v49)
        {
          __int16 v50 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v50 forKeyedSubscript:@"PreviewText"];
        if (!v49) {

        }
        long long v51 = [v4 readingListIconURL];
        uint64_t v52 = v51;
        if (!v51)
        {
          uint64_t v52 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v52 forKeyedSubscript:@"ImageURL"];
        if (!v51) {

        }
        uint64_t v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isPinned"));
        [v5 setObject:v53 forKeyedSubscript:@"IsPinned"];

        char v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "showIconOnly"));
        [v5 setObject:v54 forKeyedSubscript:@"ShowIconOnly"];

        int v55 = [v4 creationDeviceIdentifier];
        char v56 = v55;
        if (!v55)
        {
          char v56 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v56 forKeyedSubscript:@"CreationDeviceIdentifier"];
        if (!v55) {

        }
        uint64_t v57 = [v4 deviceTypeIdentifier];
        CFRange v58 = v57;
        if (!v57)
        {
          CFRange v58 = [MEMORY[0x263EFF9D0] null];
        }
        [v5 setObject:v58 forKeyedSubscript:@"DeviceTypeIdentifier"];
        if (!v57) {

        }
        goto LABEL_92;
      }
LABEL_21:

      goto LABEL_22;
    }

    if (!v17) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_92:

  return v5;
}

- (id)_syncDataForBookmarkID:(int)a3
{
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6, self->_db, "SELECT sync_data FROM bookmarks WHERE id = ?");
  sqlite3_bind_int(v7, 1, a3);
  if (sqlite3_step(v7) == 100)
  {
    id v4 = WBDataFromNullableColumn(v7, 0);
  }
  else
  {
    id v4 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v6);
  return v4;
}

- (id)_syncDataBlobForBookmarkServerID:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "SELECT sync_data FROM bookmarks WHERE server_id = ?");
  id v5 = v10;
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v10) == 100)
  {
    uint64_t v7 = WBDataFromNullableColumn(v10, 0);
  }
  else
  {
    uint64_t v7 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);

  return v7;
}

- (id)syncDataForBookmark:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serverID];
  if (v5) {
    [(WebBookmarkCollection *)self _syncDataForBookmarkServerID:v5];
  }
  else {
  id v6 = -[WebBookmarkCollection syncDataForBookmarkID:](self, "syncDataForBookmarkID:", [v4 identifier]);
  }

  return v6;
}

- (id)syncDataForBookmarkID:(int)a3
{
  id v3 = [(WebBookmarkCollection *)self _syncDataForBookmarkID:*(void *)&a3];
  id v4 = +[WBBookmarkSyncData syncDataWithContentsOfData:v3];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(WBBookmarkSyncData);
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)_syncDataForBookmarkServerID:(id)a3
{
  id v3 = [(WebBookmarkCollection *)self _syncDataBlobForBookmarkServerID:a3];
  id v4 = +[WBBookmarkSyncData syncDataWithContentsOfData:v3];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(WBBookmarkSyncData);
  }
  uint64_t v7 = v6;

  return v7;
}

- (BOOL)updateSyncDataForBookmarkWithRecordName:(id)a3 excludeDeletedBookmarks:(BOOL)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke;
  v13[3] = &unk_2643DAC30;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  LOBYTE(self) = [(WebBookmarkCollection *)self performDatabaseUpdatesWithTransaction:v13 secureDelete:0];

  return (char)self;
}

uint64_t __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) bookmarkWithServerID:*(void *)(a1 + 40) excludeDeletedBookmarks:*(unsigned __int8 *)(a1 + 56)];
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke_2;
    v6[3] = &unk_2643DAC08;
    id v8 = *(id *)(a1 + 48);
    id v7 = v2;
    uint64_t v4 = [v3 updateSyncDataForBookmark:v7 usingBlock:v6];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __100__WebBookmarkCollection_updateSyncDataForBookmarkWithRecordName_excludeDeletedBookmarks_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int64_t v2 = (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
  return v2;
}

- (void)enumerateDescendantsOfBookmark:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 identifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __67__WebBookmarkCollection_enumerateDescendantsOfBookmark_usingBlock___block_invoke;
  v9[3] = &unk_2643DAC58;
  id v8 = v6;
  id v10 = v8;
  [(WebBookmarkCollection *)self _enumerateContentsOfBookmarkFolder:v7 includingSubfolders:1 usingBlock:v9];
}

uint64_t __67__WebBookmarkCollection_enumerateDescendantsOfBookmark_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)markAttributesAsModified:(unint64_t)a3 forBookmark:(id)a4
{
  id v6 = a4;
  [v6 markAttributesAsModified:a3];
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8, self->_db, "UPDATE bookmarks SET modified_attributes = modified_attributes | ? WHERE id = ?");
  sqlite3_bind_int64(v9, 1, [v6 modifiedAttributes]);
  sqlite3_bind_int(v9, 2, [v6 identifier]);
  LOBYTE(self) = sqlite3_step(v9) == 101;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v8);

  return (char)self;
}

id __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263F663B8]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_2;
  v13[3] = &unk_2643D9C00;
  id v5 = *(void **)(a1 + 40);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v6 = v3;
  id v15 = v6;
  [v4 setHandler:v13];
  uint64_t v7 = [*(id *)(a1 + 40) syncPosition];
  id v8 = [v7 sortValues];
  if (objc_msgSend(v8, "safari_containsObjectPassingTest:", &__block_literal_global_1118))
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_4;
    v12[3] = &unk_2643DACA0;
    v12[4] = *(void *)(a1 + 32);
    id v9 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v12);
    id v10 = (void *)[objc_alloc(MEMORY[0x263F66618]) initWithSortValues:v9];
    [v6 setPosition:v10];
    [*(id *)(a1 + 40) setSyncPosition:v10 incrementGeneration:0];
  }
  else
  {
    [v6 setPosition:v7];
  }

  return v6;
}

void __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "serverIDForBookmarkID:", objc_msgSend(a1[5], "parentID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3) {
    int64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v3];
  }
  else {
    int64_t v2 = 0;
  }
  [a1[6] setParentRecordID:v2];
  if (v3) {
}
  }

unint64_t __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_3(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 changeID] >> 63;
}

id __60__WebBookmarkCollection_updateBookmarkSyncPositionIfNeeded___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 changeID] < 0)
  {
    objc_msgSend(v3, "positionSortValueWithChangeID:", objc_msgSend(*(id *)(a1 + 32), "nextDatabaseSyncChangeID"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)fixRecoveredBookmarksIfNeeded
{
  OUTLINED_FUNCTION_3_1();
  *uint64_t v1 = 138543362;
  void *v3 = v2;
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v5, (uint64_t)v3, "Error fixing recovered bookmark: %{public}@", v4);
}

- (int64_t)firstSkippedProfileGeneration
{
  uint64_t v2 = [(WebBookmarkCollection *)self syncStringForKey:@"FirstSkippedProfileGeneration"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)didSkipProfileWithGeneration:(int64_t)a3
{
  id v5 = [(WebBookmarkCollection *)self syncStringForKey:@"FirstSkippedProfileGeneration"];
  id v10 = v5;
  if (!v5 || (v6 = [v5 integerValue] <= a3, uint64_t v7 = v10, !v6))
  {
    id v8 = [NSNumber numberWithInteger:a3];
    id v9 = [v8 stringValue];
    [(WebBookmarkCollection *)self syncSetString:v9 forKey:@"FirstSkippedProfileGeneration"];

    uint64_t v7 = v10;
  }
}

- (void)clearFirstSkippedProfileGeneration
{
}

- (int64_t)firstSkippedProfileDeviceGeneration
{
  uint64_t v2 = [(WebBookmarkCollection *)self syncStringForKey:@"FirstSkippedProfileDeviceGeneration"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)didSkipProfileDeviceWithGeneration:(int64_t)a3
{
  id v5 = [(WebBookmarkCollection *)self syncStringForKey:@"FirstSkippedProfileDeviceGeneration"];
  id v10 = v5;
  if (!v5 || (v6 = [v5 integerValue] <= a3, uint64_t v7 = v10, !v6))
  {
    id v8 = [NSNumber numberWithInteger:a3];
    id v9 = [v8 stringValue];
    [(WebBookmarkCollection *)self syncSetString:v9 forKey:@"FirstSkippedProfileDeviceGeneration"];

    uint64_t v7 = v10;
  }
}

- (void)clearFirstSkippedProfileDeviceGeneration
{
}

- (void)saveMinimumAPISyncVersionOfDescendantItemsForItem:(id)a3 includingAncestorItem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4)
  {
    [v6 markAttributesAsModified:0x8000];
    [(WebBookmarkCollection *)self saveBookmark:v7 incrementGenerations:1];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __97__WebBookmarkCollection_saveMinimumAPISyncVersionOfDescendantItemsForItem_includingAncestorItem___block_invoke;
  v8[3] = &unk_2643DACF0;
  void v8[4] = self;
  [(WebBookmarkCollection *)self enumerateDescendantsOfBookmark:v7 usingBlock:v8];
}

void __97__WebBookmarkCollection_saveMinimumAPISyncVersionOfDescendantItemsForItem_includingAncestorItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 markAttributesAsModified:0x8000];
  [*(id *)(a1 + 32) saveBookmark:v3 incrementGenerations:1];
}

- (void)_test_preventPeriodicallyApplyingInMemoryChangesToDatabase
{
  [(WBDatabaseLockAcquisitor *)self->_databaseLockAcquisitor releaseLock];
  databaseLockAcquisitor = self->_databaseLockAcquisitor;
  self->_databaseLockAcquisitor = 0;
}

- (void)test_restoreMissingSpecialBookmarks
{
}

- (void).cxx_destruct
{
  value = self->_currentTransaction.__ptr_.__value_;
  self->_currentTransaction.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(BookmarkSQLWriteTransaction *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_storeStrong((id *)&self->_databaseLockAcquisitor, 0);
  objc_storeStrong((id *)&self->_safariFetcherServerProxy, 0);
  objc_storeStrong((id *)&self->_rootBookmark, 0);
  objc_storeStrong((id *)&self->_wordTokenizer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)_bookmarkDictionaryForSqliteRow:(sqlite3_stmt *)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  int v10 = sqlite3_column_int(a3, 0);
  if (v10) {
    id v11 = @"WebBookmarkTypeList";
  }
  else {
    id v11 = @"WebBookmarkTypeLeaf";
  }
  [v9 setObject:v11 forKey:@"WebBookmarkType"];
  id v12 = sqlite3_column_text(a3, 1);
  id v13 = [NSString alloc];
  if (v12) {
    id v14 = (const char *)v12;
  }
  else {
    id v14 = "";
  }
  id v15 = (void *)[v13 initWithUTF8String:v14];
  if (v10)
  {
    [v9 setObject:v15 forKey:@"Title"];
  }
  else
  {
    BOOL v16 = [NSDictionary dictionaryWithObject:v15 forKey:@"title"];
    [v9 setObject:v16 forKey:@"URIDictionary"];
  }
  int v17 = sqlite3_column_text(a3, 2);
  if (!v10 && v17)
  {
    id v18 = (id)[[NSString alloc] initWithUTF8String:v17];
    [v9 setObject:v18 forKey:@"URLString"];
LABEL_13:

    goto LABEL_14;
  }
  if (!v10 || !v6)
  {
LABEL_14:
    unint64_t v19 = sqlite3_column_text(a3, 4);
    id v20 = [NSString alloc];
    if (v19) {
      int v21 = (const char *)v19;
    }
    else {
      int v21 = "";
    }
    uint64_t v22 = (void *)[v20 initWithUTF8String:v21];
    [v9 setObject:v22 forKey:@"WebBookmarkUUID"];
    goto LABEL_18;
  }
  uint64_t v24 = sqlite3_column_int(a3, 3);
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(WebBookmarkCollection *)self _addChildrenOfID:v24 toCollection:v18 recursive:1 error:a5])
  {
    [v9 setObject:v18 forKey:@"Children"];
    goto LABEL_13;
  }

  uint64_t v22 = v9;
  id v9 = 0;
LABEL_18:

  return v9;
}

- (BOOL)_addChildrenOfID:(int)a3 toCollection:(id)a4 recursive:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = (void *)MEMORY[0x21D4A0FE0]();
  ppStmt = 0;
  uint64_t v12 = sqlite3_prepare_v2(self->_db, "SELECT type, title, url, id, external_uuid FROM bookmarks WHERE parent = ? AND deleted = 0 AND hidden = 0 AND syncable = 1 ORDER BY order_index", -1, &ppStmt, 0);
  if (v12)
  {
    id v24 = 0;
    _SetErrorFromSQLiteResult(v12, &v24);
    id i = v24;
    BOOL v14 = 0;
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, a3);
    for (id i = 0; ; id i = v18)
    {
      uint64_t v15 = sqlite3_step(ppStmt);
      uint64_t v16 = v15;
      if (v15 != 100) {
        break;
      }
      id v23 = i;
      int v17 = [(WebBookmarkCollection *)self _bookmarkDictionaryForSqliteRow:ppStmt recursive:v7 error:&v23];
      id v18 = v23;

      if (!v17)
      {
        id i = v18;
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v19 = [v17 objectForKey:@"WebBookmarkUUID"];
        if (v19) {
          [v10 setObject:v17 forKey:v19];
        }
      }
      else
      {
        [v10 addObject:v17];
      }
    }
    if (v15 == 101)
    {
      BOOL v14 = 1;
      goto LABEL_16;
    }
LABEL_15:
    id v22 = i;
    _SetErrorFromSQLiteResult(v16, &v22);
    id v20 = v22;

    BOOL v14 = 0;
    id i = v20;
LABEL_16:
    sqlite3_finalize(ppStmt);
  }
  if (a6) {
    *a6 = i;
  }

  return v14;
}

- (id)bookmarksDictionary
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v23, self->_db);
  if (!v23[17]) {
    goto LABEL_17;
  }
  ppStmt = 0;
  int v3 = sqlite3_prepare_v2(self->_db, "SELECT type, title, url, id, external_uuid FROM bookmarks WHERE id = 0", -1, &ppStmt, 0);
  BOOL v4 = ppStmt;
  if (v3 || (v5 = sqlite3_step(ppStmt), BOOL v4 = ppStmt, v5 != 100))
  {
    [(WebBookmarkCollection *)self _finalizeStatementIfNotNull:v4];
LABEL_17:
    id v17 = 0;
    goto LABEL_18;
  }
  id v17 = [(WebBookmarkCollection *)self _bookmarkDictionaryForSqliteRow:ppStmt recursive:1 error:0];
  sqlite3_finalize(ppStmt);
  WebBookmarks::BookmarkSQLTransaction::commit((WebBookmarks::BookmarkSQLTransaction *)v23, v6, v7);
  [v17 removeObjectForKey:@"Title"];
  [v17 objectForKey:@"Children"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = [v12 objectForKey:@"Title"];
        if ([v13 isEqualToString:@"BookmarksBar"])
        {
          BOOL v14 = [v12 objectForKey:@"WebBookmarkUUID"];
          int v15 = [v14 isEqualToString:&stru_26CC2ED50];

          if (v15)
          {
            [v8 removeObject:v12];
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }
LABEL_21:

LABEL_18:
  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)v23);
  return v17;
}

- (BOOL)_syncAdd:(id)a3 toParent:(int)a4 withOrderIndex:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = [v10 objectForKey:@"WebBookmarkType"];
  uint64_t v12 = [v11 isEqualToString:@"WebBookmarkTypeList"];

  if (v12)
  {
    id v13 = [v10 objectForKey:@"Title"];
  }
  else
  {
    BOOL v14 = [v10 objectForKeyedSubscript:@"URIDictionary"];
    id v13 = [v14 objectForKey:@"title"];
  }
  uint64_t v15 = [v10 objectForKey:@"URLString"];
  if (v15) {
    uint64_t v16 = (__CFString *)v15;
  }
  else {
    uint64_t v16 = &stru_26CC2ED50;
  }
  id v17 = [v10 objectForKey:@"WebBookmarkUUID"];
  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  BOOL v18 = -[WebBookmarkCollection _addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:](self, "_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:", v13, v16, v8, v7, v12, v17, 0, v21);

  if (!v18)
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.WebBookmarks.ErrorDomain" code:5 userInfo:0];
      BOOL v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  if ((v12 & 1) == 0
    && ![(WebBookmarkCollection *)self _indexBookmarkID:sqlite3_last_insert_rowid(self->_db) title:v13])
  {
    goto LABEL_13;
  }
  BOOL v19 = 1;
LABEL_14:

  return v19;
}

- (BOOL)_mergeChildrenOfID:(int)a3 referencingBase:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = MEMORY[0x21D4A0FE0]();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v23 = v6;
  uint64_t v8 = [v6 objectForKey:@"Children"];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  context = (void *)v7;
  if (v9)
  {
    obuint64_t j = v8;
    uint64_t v10 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v15 = [v14 objectForKey:@"WebBookmarkType"];
        if (([v15 isEqualToString:@"WebBookmarkTypeList"] & 1) != 0
          || ([v15 isEqualToString:@"WebBookmarkTypeLeaf"] & 1) != 0)
        {
          id v28 = v11;
          BOOL v16 = [(WebBookmarkCollection *)self _syncAdd:v14 toParent:a3 withOrderIndex:v10 error:&v28];
          id v17 = v28;

          if (!v16)
          {

            BOOL v20 = 0;
            goto LABEL_16;
          }
          if ([v15 isEqualToString:@"WebBookmarkTypeList"])
          {
            sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);
            id v27 = v17;
            [(WebBookmarkCollection *)self _mergeChildrenOfID:insert_rowid referencingBase:v14 error:&v27];
            id v19 = v27;

            id v17 = v19;
          }
          uint64_t v10 = (v10 + 1);
          id v11 = v17;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    BOOL v20 = 1;
    id v17 = v11;
LABEL_16:
    uint64_t v8 = obj;
  }
  else
  {
    id v17 = 0;
    BOOL v20 = 1;
  }

  if (a5) {
    *a5 = v17;
  }

  return v20;
}

- (BOOL)_markSpecialBookmarks
{
  if (-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET special_id = 1, editable = 0, deletable = 0 WHERE id = (SELECT id FROM bookmarks WHERE title = 'BookmarksBar' AND parent = 0 ORDER BY id ASC LIMIT 1);"))
  {
    int v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
LABEL_6:
      -[WebBookmarkCollection(Sync) _markSpecialBookmarks]();
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    if (!-[WebBookmarkCollection _executeSQLWithCString:](self, "_executeSQLWithCString:", "UPDATE bookmarks SET special_id = 2, editable = 0, deletable = 0 WHERE id = (SELECT id FROM bookmarks WHERE title = 'BookmarksMenu' AND parent = 0 ORDER BY id ASC LIMIT 1);"))
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    int v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    BOOL v4 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4) {
      goto LABEL_6;
    }
  }
  return v4;
}

- (BOOL)mergeWithBookmarksDictionary:(id)a3 clearHidden:(BOOL)a4 error:(id *)a5
{
  return [(WebBookmarkCollection *)self mergeWithBookmarksDictionary:a3 clearHidden:a4 clearSyncData:1 error:a5];
}

- (BOOL)mergeWithBookmarksDictionary:(id)a3 clearHidden:(BOOL)a4 clearSyncData:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = @"DELETE FROM bookmarks WHERE id != 0 AND hidden = 0 AND hidden_ancestor_count = 0 AND syncable = 1";
  if (v8) {
    id v11 = @"DELETE FROM bookmarks WHERE id != 0 AND syncable = 1";
  }
  uint64_t v12 = v11;
  if ([(WebBookmarkCollection *)self _executeSQL:v12])
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:].cold.5();
    }
  }
  else
  {
    if (v8) {
      [(WebBookmarkCollection *)self clearAllReadingListArchives];
    }
    if ([(WebBookmarkCollection *)self _mergeChildrenOfID:0 referencingBase:v10 error:a6])
    {
      if ([(WebBookmarkCollection *)self _executeSQLWithCString:"UPDATE bookmarks SET num_children = (SELECT COUNT(*) FROM bookmarks AS count_bookmarks WHERE count_bookmarks.parent = bookmarks.id AND hidden = 0) WHERE type = 1"])
      {
        BOOL v14 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:]();
        }
      }
      else if ([(WebBookmarkCollection *)self _markSpecialBookmarks])
      {
        if ([(WebBookmarkCollection *)self _restoreMissingSpecialBookmarksWithChangeNotification:1])
        {
          if ([(WebBookmarkCollection *)self _rebuildAncestorTable])
          {
            if ([(WebBookmarkCollection *)self _incrementGeneration]
              && (!v7 || [(WebBookmarkCollection *)self _clearAllSyncData]))
            {
              [(WebBookmarkCollection *)self _startReadingListFetcher];
              BOOL v23 = 1;
              goto LABEL_15;
            }
          }
          else
          {
            uint64_t v33 = WBS_LOG_CHANNEL_PREFIXBookmarks();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:](v33, v34, v35, v36, v37, v38, v39, v40);
            }
          }
        }
        else
        {
          uint64_t v25 = WBS_LOG_CHANNEL_PREFIXBookmarks();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:](v25, v26, v27, v28, v29, v30, v31, v32);
          }
        }
      }
    }
    else
    {
      uint64_t v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection(Sync) mergeWithBookmarksDictionary:clearHidden:clearSyncData:error:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  BOOL v23 = 0;
LABEL_15:

  return v23;
}

- (void)removePersistedInMemoryBookmarkChangesFile
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v2 = [(id)objc_opt_class() inMemoryChangesFileURL];
  [v3 removeItemAtURL:v2 error:0];
}

- (unint64_t)generation
{
  return [(WebBookmarkCollection *)self _intFromExecutingSQL:@"SELECT generation FROM generations"];
}

- (BOOL)_syncPropertyExistsForKey:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "SELECT COUNT(*) FROM sync_properties WHERE key = ?");
  BOOL v5 = v9
    && (sqlite3_bind_text(v8, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(v8) == 100)&& sqlite3_column_int(v8, 0) > 0;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (BOOL)_deleteSyncPropertyForKey:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7, self->_db, "DELETE FROM sync_properties WHERE key = ?");
  if (v9)
  {
    sqlite3_bind_text(v8, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    BOOL v5 = sqlite3_step(v8) == 101;
  }
  else
  {
    BOOL v5 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v7);

  return v5;
}

- (BOOL)syncSetString:(id)a3 forKey:(id)a4
{
  return [(WebBookmarkCollection *)self _syncSetString:a3 forKey:a4 updatedExistingKey:0];
}

- (BOOL)_syncSetString:(id)a3 forKey:(id)a4 updatedExistingKey:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__WebBookmarkCollection_Sync___syncSetString_forKey_updatedExistingKey___block_invoke;
    v20[3] = &__block_descriptor_40_e8_v12__0B8l;
    v20[4] = a5;
    id v10 = (void *)MEMORY[0x21D4A1230](v20);
    BOOL v11 = [(WebBookmarkCollection *)self _syncPropertyExistsForKey:v9];
    uint64_t v12 = (void (*)(void *, uint64_t))v10[2];
    if (v11)
    {
      v12(v10, 1);
      id v13 = "UPDATE sync_properties SET value = ? WHERE key = ?";
    }
    else
    {
      v12(v10, 0);
      id v13 = "INSERT INTO sync_properties (value, key) VALUES (?, ?)";
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v17, self->_db, v13);
    if (v19)
    {
      sqlite3_bind_text(v18, 1, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(v18, 2, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(v18) == 101)
      {
        BOOL v14 = 1;
LABEL_12:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&v17);

        goto LABEL_13;
      }
      uint64_t v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection(Sync) _syncSetString:forKey:updatedExistingKey:]();
      }
    }
    BOOL v14 = 0;
    goto LABEL_12;
  }
  BOOL v14 = [(WebBookmarkCollection *)self _deleteSyncPropertyForKey:v9];
LABEL_13:

  return v14;
}

uint64_t __72__WebBookmarkCollection_Sync___syncSetString_forKey_updatedExistingKey___block_invoke(uint64_t result, char a2)
{
  uint64_t v2 = *(unsigned char **)(result + 32);
  if (v2) {
    unsigned char *v2 = a2;
  }
  return result;
}

- (BOOL)setSyncData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(WebBookmarkCollection *)self syncDataForKey:v7];

    if (v8) {
      id v9 = "UPDATE sync_properties SET value = ? WHERE key = ?";
    }
    else {
      id v9 = "INSERT INTO sync_properties (value, key) VALUES (?, ?)";
    }
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14, self->_db, v9);
    if (v16)
    {
      int v10 = [v6 length];
      sqlite3_bind_blob(v15, 1, (const void *)[v6 bytes], v10, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(v15, 2, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(v15) == 101)
      {
        BOOL v11 = 1;
LABEL_12:
        WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v14);
        goto LABEL_13;
      }
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkCollection(Sync) setSyncData:forKey:]();
      }
    }
    BOOL v11 = 0;
    goto LABEL_12;
  }
  BOOL v11 = [(WebBookmarkCollection *)self _deleteSyncPropertyForKey:v7];
LABEL_13:

  return v11;
}

- (id)allSyncDataForKeysWithPrefix:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12, self->_db, "SELECT key, value FROM sync_properties WHERE key = ?");
  if (v14)
  {
    BOOL v5 = v13;
    id v6 = [v4 stringByAppendingString:@"%"];
    sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    while (sqlite3_step(v13) == 100)
    {
      id v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v13, 0));
      id v9 = sqlite3_column_blob(v13, 1);
      int v10 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v9, sqlite3_column_bytes(v13, 1));
      [v7 setObject:v10 forKeyedSubscript:v8];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA78];
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v12);

  return v7;
}

- (BOOL)removeAllSyncDataForKeyWithPrefix:(id)a3
{
  id v4 = a3;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9, self->_db, "DELETE FROM sync_properties WHERE key LIKE ?");
  if (v11)
  {
    BOOL v5 = v10;
    id v6 = [v4 stringByAppendingString:@"%"];
    sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    BOOL v7 = sqlite3_step(v10) == 101;
  }
  else
  {
    BOOL v7 = 0;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v9);

  return v7;
}

- (BOOL)beginSyncTransaction
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = [(WebBookmarkCollection *)self _executeSQLWithCString:"SAVEPOINT sync"];
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (v3 == 1)
    {
      BOOL v5 = v4;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = sqlite3_errmsg(self->_db);
        [(WebBookmarkCollection(Sync) *)(uint64_t)v6 beginSyncTransaction];
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WebBookmarkCollection(Sync) beginSyncTransaction]();
    }
    if ([MEMORY[0x263F662A0] hasInternalContent])
    {
      BOOL v7 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [MEMORY[0x263F08B88] callStackSymbols];
        [(WebBookmarkCollection(Sync) *)v8 beginSyncTransaction];
      }
    }
  }
  else
  {
    self->_dirty = 0;
  }
  return v3 == 0;
}

- (void)commitSyncTransaction
{
}

- (void)rollbackSyncTransaction
{
  [(WebBookmarkCollection *)self _executeSQLWithCString:"ROLLBACK TRANSACTION TO SAVEPOINT sync"];
  [(WebBookmarkCollection *)self _executeSQLWithCString:"RELEASE SAVEPOINT sync"];
}

+ (void)unlockSyncAsynchronously
{
  int v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Unlocking sync asynchronously", buf, 2u);
  }
  id v4 = syncLockQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WebBookmarkCollection_Sync__unlockSyncAsynchronously__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_barrier_async(v4, block);
}

uint64_t __55__WebBookmarkCollection_Sync__unlockSyncAsynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unlockSync];
}

+ (void)holdLockSync:(const void *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = a3;
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Hold lock sync for requestor %p", buf, 0xCu);
  }
  id v6 = syncLockQueue();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __44__WebBookmarkCollection_Sync__holdLockSync___block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  v7[4] = a1;
  void v7[5] = a3;
  dispatch_barrier_async(v6, v7);
}

void __44__WebBookmarkCollection_Sync__holdLockSync___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _syncFlags];
  uint64_t v2 = [v4 lockSyncHoldRequestorPointers];
  int v3 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(a1 + 40)];
  [v2 addObject:v3];
}

+ (void)unholdLockSync:(const void *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = a3;
    _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_DEFAULT, "Unhold lock sync for requestor %p", buf, 0xCu);
  }
  operator new();
}

void __46__WebBookmarkCollection_Sync__unholdLockSync___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _syncFlags];
  int v3 = [v2 lockSyncHoldRequestorPointers];
  id v4 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(a1 + 40)];
  [v3 removeObject:v4];

  if ([v2 unlockSyncRequested] && !objc_msgSend(v3, "count"))
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
      id v8 = [v7 bundleIdentifier];
      int v10 = 138543362;
      uint64_t v11 = (uint64_t)v8;
      _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to unlock sync since last requestor has unheld the lock in process %{public}@", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) _unlockSync];
  }
  else if ([v2 unlockSyncRequested])
  {
    BOOL v5 = (id)WBS_LOG_CHANNEL_PREFIXBookmarkSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = [v3 count];
      _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_DEFAULT, "Unlock sync requested but there are still %zu requestors remaining", (uint8_t *)&v10, 0xCu);
    }
  }
  id v9 = *(id **)(a1 + 48);
  if (v9)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v9);
    MEMORY[0x21D4A0CE0]();
  }
}

- (void)_postBookmarksChangedSyncNotification
{
  if (![(WBCollectionConfiguration *)self->_configuration collectionType])
  {
    uint64_t v2 = objc_opt_class();
    int v3 = syncLockQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__WebBookmarkCollection_Sync___postBookmarksChangedSyncNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    dispatch_barrier_async(v3, block);
  }
}

uint64_t __68__WebBookmarkCollection_Sync___postBookmarksChangedSyncNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postBookmarksChangedSyncNotificationOnSyncQueue];
}

+ (void)_postBookmarksChangedSyncNotificationOnSyncQueue
{
  uint64_t v2 = [a1 _syncFlags];
  if ([v2 syncAllowed])
  {
    if ([v2 syncLockFileDescriptor] == -1)
    {
      if ([v2 syncNotificationType] == 1)
      {
        int v3 = _os_activity_create(&dword_21C043000, "Request sync client trigger sync", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
        os_activity_scope_enter(v3, &state);
        id v4 = WBS_LOG_CHANNEL_PREFIXBookmarks();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v6 = 0;
          _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_DEFAULT, "Requesting a CloudKit bookmarks sync due to local changes", v6, 2u);
        }
        BOOL v5 = [MEMORY[0x263F66380] sharedProxy];
        [v5 userDidUpdateBookmarkDatabase];

        os_activity_scope_leave(&state);
      }
    }
    else
    {
      [v2 setPostSyncNotificationWhenUnlocking:1];
    }
  }
}

- (BOOL)containsOnlyStockBookmarks
{
  int v3 = [[WebBookmarkListQuery alloc] initWithBookmarksWhere:@"special_id == 0 AND id != 0 AND deleted = 0" orderBy:0 usingFilter:0];
  id v4 = [[WebBookmarkList alloc] initWithQuery:v3 skipOffset:0 collection:self];
  unsigned int v5 = [(WebBookmarkList *)v4 bookmarkCount];
  if (v5)
  {
    BOOL v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [(WebBookmarkList *)v4 bookmarkAtIndex:v7];
      id v9 = [v8 localAttributes];
      if ((objc_msgSend(v9, "wb_BOOLForKey:", @"com.apple.bookmarks.IsBuiltinBookmark") & 1) == 0
        && (objc_msgSend(v9, "wb_BOOLForKey:", @"com.apple.bookmarks.IsBuiltinDeviceBookmark") & 1) == 0
        && (objc_msgSend(v9, "wb_BOOLForKey:", @"com.apple.bookmarks.IsCarrierBookmark") & 1) == 0)
      {
        break;
      }

      uint64_t v7 = (v7 + 1);
      BOOL v6 = v7 >= v5;
      if (v5 == v7) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_setupWithPath:checkIntegrity:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Still could not open bookmarks database: %{public}@", v5);
}

- (void)_setupWithPath:checkIntegrity:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_21C043000, v0, (uint64_t)v0, "Refusing to remove corrupted bookmarks database at %{public}@: The file is not named %{public}@.", v1);
}

- (void)_setupWithPath:checkIntegrity:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Refusing to remove corrupted bookmarks database at %{public}@: The path appears to be a directory.", v2);
}

- (void)_setupWithPath:checkIntegrity:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Couldn't create bookmarks database at %{public}@", v2);
}

- (void)_setupWithPath:checkIntegrity:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Could not open bookmarks database: %{public}@", v5);
}

- (void)_setupWithPath:checkIntegrity:.cold.6()
{
  OUTLINED_FUNCTION_13();
  *(_DWORD *)uint64_t v2 = 67109378;
  *(_DWORD *)(v2 + 4) = v1 & 1;
  *(_WORD *)(v2 + 8) = 2114;
  *(void *)(v2 + 10) = v3;
  _os_log_error_impl(&dword_21C043000, v5, OS_LOG_TYPE_ERROR, "Failed to open Bookmarks database. Acquired sync lock: %d, error: %{public}@.", v4, 0x12u);
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Could not remove bookmarks database %{public}@", v2);
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Failed to remove the shm file %{public}@.", v2);
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Failed to remove the wal file %{public}@.", v2);
}

+ (void)_removeCorruptedBookmarksDatabaseAtPath:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Failed to remove the journal file at %{public}@.", v2);
}

- (void)_unsafeOpenDatabaseAtPath:checkIntegrity:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "A table is missing from bookmarks database. The database is corrupt.", v2, v3, v4, v5, v6);
}

- (void)_verifyAllTablesExist:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Table %{public}@ is missing from bookmarks database", v2);
}

- (void)_checkDatabaseIntegrity
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "sqlite3_step failed for integrity_check with error code %d", v2, v3, v4, v5, v6);
}

- (void)_setupWithPath:migratingBookmarksPlist:syncAnchorPlist:checkIntegrity:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_21C043000, v0, (uint64_t)v0, "Failed to migrate from bookmarks plist at path %{public}@ sync anchor plist path %{public}@", v1);
}

+ (void)safariBookmarkCollection
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Unable to initialize WebBookmarkCollection. Nil was returned from +initSafariBookmarkCollectionCheckingIntegrity:", v2, v3, v4, v5, v6);
}

- (void)cleanUpReadingListArchives
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to migrate Reading List archives; couldn't reset record status.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)clearAllReadingListArchives
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to get list of archive directories: %{public}@", v5);
}

- (void)clearReadingListArchiveWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12(&dword_21C043000, v6, v4, "Failed to remove reading list archive at path %{public}@: %{public}@", v5);
}

- (void)markWebContentFilterAllowsAllReadingListItems
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to mark all Reading List items as allowed by Web Content Filter with result code: %i", v2, v3, v4, v5, v6);
}

- (void)saveBookmarks:postNotification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Could not open a write transaction", v2, v3, v4, v5, v6);
}

- (void)saveBookmarks:postNotification:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Could not apply in-memory changes to database", v2, v3, v4, v5, v6);
}

- (void)saveBookmark:startReadingListFetcher:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8382e-34);
  *(_WORD *)(v3 + 12) = 2114;
  *(void *)(v3 + 14) = @"Trying to save a bookmark without first obtaining the bookmarks database file lock.";
  OUTLINED_FUNCTION_12(&dword_21C043000, v4, (uint64_t)v4, "Failed to save bookmark with UUID %{public}@: %{public}@", v5);
}

- (void)_saveBookmark:startReadingListFetcher:forApplyingInMemoryChanges:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to save bookmark %{public}@", v5);
}

void __90__WebBookmarkCollection__saveBookmark_startReadingListFetcher_forApplyingInMemoryChanges___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "_saveBookmark:withSpecialID:updateGenerationIfNeeded: failed", v2, v3, v4, v5, v6);
}

- (void)_deleteIconForBookmark:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to delete bookmark icon: %{public}@", v5);
}

- (void)_deleteIconForBookmark:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "No BookmarkImages directory exists, but bookmark had an icon UUID", v2, v3, v4, v5, v6);
}

- (void)saveArchiveForReadingListBookmarkWithID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to acquire lock when saving offline Reading List archive", v2, v3, v4, v5, v6);
}

- (void)saveIconWithData:urlString:forBookmark:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Saving Reading List icon failed: %{public}@", v5);
}

- (void)saveIconWithData:urlString:forBookmark:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Creating a directory for Reading List icons failed: %{public}@", v5);
}

- (void)saveAndMoveBookmark:(int)a3 toFolderID:(os_log_t)log .cold.1(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Moving bookmark %d to folder %d failed", buf, 0xEu);
}

- (void)saveAndMoveBookmark:toFolderID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Saving a previously deleted bookmark failed", v2, v3, v4, v5, v6);
}

- (void)saveAndMoveBookmark:toFolderID:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Saving a bookmark failed", v2, v3, v4, v5, v6);
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to save bookmark during update with error: %@", v5);
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403_cold_3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to reorder bookmark during update with error: %@", v5);
}

void __57__WebBookmarkCollection__updateBookmarks_inFolderWithID___block_invoke_403_cold_4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to save and move bookmark during update with error: %@", v5);
}

- (void)_migrateToCurrentSchema
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Could not migrate database because database is not writable.", v2, v3, v4, v5, v6);
}

- (void)_migrateBookmarksPlist:syncAnchorPlist:.cold.1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12(&dword_21C043000, v6, v4, "Failed to remove bookmarks sync anchor plist at path %{public}@. Error: %{public}@", v5);
}

- (void)_migrateBookmarksPlist:syncAnchorPlist:.cold.2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12(&dword_21C043000, v6, v4, "Failed to remove old bookmarks plist at path %{public}@. Error: %{public}@", v5);
}

- (void)_migrateBookmarksPlist:syncAnchorPlist:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Failed to import bookmarks with plist path %{public}@", v2);
}

- (void)_updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to perform Safari version upgrades because we failed to lock sync", v2, v3, v4, v5, v6);
}

- (void)_updateDatabaseIfNewerVersion:wasLaunchedForSyncStringKey:upgradeSelector:versionType:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Warning: The web bookmarks database was used on a more recent %{public}@ version than the current one. Restoring a database from a newer version is not supported.", v2);
}

- (void)_moveBookmark:(int)a1 toFolderWithID:(NSObject *)a2 orderIndex:detectCycles:incrementGeneration:shouldMerge:generateSyncPositionIfNeeded:.cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 101;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Could not reorder records in previous parent %d, error: %d", (uint8_t *)v2, 0xEu);
}

- (void)_clearAllTombstones
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Failed to clear local bookmark tombstones", v2, v3, v4, v5, v6);
}

- (void)_clearAllSyncKeys
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to clear sync server ids. Sqlite error: %d", v2, v3, v4, v5, v6);
}

- (void)_clearAllSyncData
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to reset bookmarks generation. Sqlite error: %d", v2, v3, v4, v5, v6);
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to reset generation of bookmark %{public}@", v5);
}

void __42__WebBookmarkCollection__clearAllSyncData__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_2(&dword_21C043000, v3, v4, "Failed to reset sync data of bookmark %{public}@", v5);
}

- (void)_deleteRecursively:descendantsOnly:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_21C043000, v0, v1, "Could not delete records recursively starting with localID: %d, error: %d", v2, v3);
}

- (void)_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Cannot save bookmark: failed to get hidden ancestor count (%i)", v2, v3, v4, v5, v6);
}

- (void)_addBookmarkWithTitle:address:parentID:orderIndex:isFolder:externalUUID:associatedBookmark:updateParentChildCount:updateAncestorEntries:incrementGenerations:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Cannot save bookmark: failed to update order index of bookmarks during insertion (%i)", v2, v3, v4, v5, v6);
}

- (void)_saveBookmark:withSpecialID:updateGenerationIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v1, v2, 5.8382e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = v4;
  _os_log_fault_impl(&dword_21C043000, v6, OS_LOG_TYPE_FAULT, "Failed to save bookmark %{public}@: Invalid parentID %d", v5, 0x12u);
}

- (void)_saveBookmark:withSpecialID:updateGenerationIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21C043000, v0, OS_LOG_TYPE_FAULT, "Refusing to save a bookmark with no address", v1, 2u);
}

- (void)bookmarkIDForServerID:excludeDeletedBookmarks:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_21C043000, v1, OS_LOG_TYPE_ERROR, "Could not get bookmark ID with server ID %{public}@ with prepare result %d", v2, 0x12u);
}

void __88__WebBookmarkCollection_deviceIdentifierForCloudKitWithCollectionType_generateIfNeeded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C043000, v0, v1, "Safari directory is currently inaccessible", v2, v3, v4, v5, v6);
}

- (void)_deleteAncestorTableEntriesForBookmarkID:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_21C043000, v0, v1, "Could not delete ancestor table entries for record %d, error: %d", v2, v3);
}

- (void)_incrementGeneration
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to increment bookmarks generation. Sqlite error: %d", v2, v3, v4, v5, v6);
}

- (void)_simulateCrashWithDescription:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_21C043000, v0, OS_LOG_TYPE_FAULT, "%{public}@ Please file a bug citing the following caller:", v1, 0xCu);
}

- (void)_importBookmarksPlist:(uint64_t)a3 .cold.1(char a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"not null";
  if (a1) {
    uint64_t v3 = @"null";
  }
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_21C043000, a2, a3, "Failed to merge bookmarks with dictionary. Bookmarks dictionary is %{public}@", (uint8_t *)&v4);
}

- (void)_insertAncestorTableEntriesForBookmarkID:withAncestorIDs:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_21C043000, v0, v1, "Could not recursively update ancestor table entries for bookmark %d, error: %d", v2, v3);
}

- (void)setLocalMigrationState:generateDeviceIdentifierIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to delete local migration state from sync properties. Sqlite error: %d", v2, v3, v4, v5, v6);
}

- (void)setLocalMigrationState:generateDeviceIdentifierIfNeeded:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_21C043000, v0, v1, "Failed to save local migration state %{public}@ to database", v2);
}

@end