@interface WBTabGroupManager
+ (id)ephemeralTabGroupManager;
- (BOOL)_didLocallyCreateUnnamedTabGroup:(id)a3;
- (BOOL)_needsInitialBlankTabInTabGroup:(id)a3;
- (BOOL)_shouldBeginDevicePresenceReporting;
- (BOOL)_shouldEndDevicePresenceReporting;
- (BOOL)closeAllTabsOnDevice:(id)a3;
- (BOOL)closeTab:(id)a3 onDevice:(id)a4;
- (BOOL)cloudTabsAreEnabled;
- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5;
- (BOOL)enableSharedTabGroupsFastSyncPresence;
- (BOOL)hasCompletedMigration;
- (BOOL)hasMultipleProfiles;
- (BOOL)hasSharedTabGroups;
- (BOOL)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5;
- (BOOL)isBroadcastingPresenceUpdates;
- (BOOL)isPersistent;
- (BOOL)isTab:(id)a3 childOfPinnedTabGroupOfNamedProfileOfUnnamedTabGroup:(id)a4;
- (BOOL)saveBrowserState:(id)a3;
- (BOOL)saveWindowState:(id)a3;
- (NSArray)allNamedTabGroupsUnsorted;
- (NSArray)allSyncedTabGroupsExceptRemoteUnnamedTabGroups;
- (NSArray)namedProfiles;
- (NSArray)namedTabGroupsInDefaultProfile;
- (NSArray)profiles;
- (NSArray)windowStates;
- (NSSet)allNamedProfileIdentifiers;
- (NSSet)allProfileIdentifiers;
- (NSSet)recentlyAddedTabGroupsAwaitingFirstStartPage;
- (NSString)defaultProfileIdentifier;
- (NSString)deviceIdentifier;
- (WBBrowserState)browserState;
- (WBBrowserState)lastSessionBrowserState;
- (WBProfile)defaultProfile;
- (WBTabCollection)tabCollection;
- (WBTabGroupManager)initWithCollection:(id)a3;
- (WBTabGroupSyncAgentProtocol)syncAgentProxy;
- (id)_allSyncedTabGroupsExceptRemoteUnnamedTabGroups;
- (id)_allTabGroupsUnsorted;
- (id)_devicesForProfileWithIdentifier:(id)a3;
- (id)_findLocalDeviceForProfileWithIdentifier:(id)a3;
- (id)_findOrCreateLocalDeviceForProfileWithIdentifier:(id)a3;
- (id)_generatePositionForDevice:(id)a3 afterDevice:(id)a4;
- (id)_generatePositionForProfile:(id)a3 afterProfile:(id)a4;
- (id)_generatePositionForTabGroup:(id)a3 afterTabGroup:(id)a4;
- (id)_generatePositionForTabGroup:(id)a3 afterTabGroup:(id)a4 inTabGroups:(id)a5;
- (id)_insertDevice:(id)a3 inProfile:(id)a4 completionHandler:(id)a5;
- (id)_insertTabGroup:(id)a3 afterTabGroup:(id)a4 isMove:(BOOL)a5;
- (id)_itemSyncPositionComparator;
- (id)_localTabGroups;
- (id)_namedProfiles;
- (id)_performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier:(id)a3 devicesByUUID:(id)a4 uninsertedSyncableTabsFromSyncableTabsByUUID:(id)a5;
- (id)_profiles;
- (id)_remoteDevicesForProfileWithIdentifier:(id)a3;
- (id)_shareRecordIfNeededToBeginCollaborationForTabGroup:(id)a3;
- (id)_shareRecordIfNeededToEndCollaborationForTabGroup:(id)a3;
- (id)_tabCacheForTabGroup:(id)a3;
- (id)_tabGroupAfterTabGroup:(id)a3 inTabGroups:(id)a4;
- (id)_tabGroupCacheForTabGroup:(id)a3;
- (id)_tabGroupWithUUID:(id)a3;
- (id)_tabGroupsForProfileWithIdentifier:(id)a3;
- (id)_tabGroupsWithTabsToBeClosedForProfilesWithIdentifiers:(id)a3;
- (id)_tabWithUUID:(id)a3;
- (id)_unnamedTabGroupsForDeviceWithUUID:(id)a3;
- (id)_unnamedTabGroupsForProfileWithIdentifier:(id)a3;
- (id)_unsafeTabGroupUUIDsToCKShares;
- (id)devicesForProfile:(id)a3;
- (id)insertTabGroup:(id)a3 afterTabGroup:(id)a4;
- (id)insertUnnamedTabGroup:(id)a3;
- (id)namedTabGroupsForProfileWithIdentifier:(id)a3;
- (id)positionGenerator:(id)a3 positionForRecordName:(id)a4;
- (id)positionGenerator:(id)a3 recordNameOfBookmarksAfterRecordWithName:(id)a4;
- (id)positionGenerator:(id)a3 recordNameOfBookmarksBeforeRecordWithName:(id)a4;
- (id)profileWithIdentifier:(id)a3;
- (id)profileWithServerID:(id)a3;
- (id)removedTabGroupWithUUID:(id)a3;
- (id)scopedBookmarkListWithID:(int)a3 filteredUsingString:(id)a4;
- (id)shareRecordForTabGroup:(id)a3;
- (id)syncedRemoteCloudTabDevicesForProfileWithIdentifier:(id)a3;
- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3;
- (id)tabGroupMatchingShare:(id)a3;
- (id)tabGroupWithServerID:(id)a3;
- (id)tabsForTabGroup:(id)a3;
- (id)topScopedBookmarkListForTabGroup:(id)a3;
- (id)unnamedTabGroupsForProfileWithIdentifier:(id)a3;
- (id)updateProfileWithIdentifier:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6;
- (id)windowStateWithUUID:(id)a3;
- (int)pinnedTabsFolderID;
- (int)privatePinnedTabsFolderID;
- (int64_t)_nextInMemoryPositionChangeID;
- (unint64_t)maximumTabsPerGroup;
- (unint64_t)numberOfTabsToBeClosedForProfilesWithIdentifiers:(id)a3;
- (void)_addTab:(id)a3 toParentIdentifierInTabsToParentIdentifiersDictionary:(id)a4;
- (void)_addTabsInTabGroups:(id)a3 toParentIdentifierInTabsToParentIdentifiersDictionary:(id)a4;
- (void)_beginDevicePresenceReportingIfNeeded;
- (void)_cacheProfile:(id)a3;
- (void)_cacheTabGroup:(id)a3 creatorDeviceUUID:(id)a4;
- (void)_dequeueNextAcceptCloudKitShareMetadataIfNeeded;
- (void)_didModifyUnnamedTabGroup:(id)a3;
- (void)_didModifyUnnamedTabGroupInDeviceWithUUID:(id)a3;
- (void)_didReceiveShare:(id)a3 forTabGroupUUID:(id)a4;
- (void)_didRemoveProfiles:(id)a3 updateProfiles:(id)a4 previousProfiles:(id)a5 removeTabGroups:(id)a6 updateTabGroups:(id)a7 previousTabGroups:(id)a8;
- (void)_endDevicePresenceReportingIfNeeded;
- (void)_loadDatabase;
- (void)_mergeTabGroups:(id)a3;
- (void)_movePresenceForParticipantToTabWithUUID:(id)a3;
- (void)_notifyScopedBookmarkChangesInFolderWithID:(int)a3;
- (void)_notifySyncDidFinishedForScopedBookmarks;
- (void)_reloadProfilesAndTabGroupsAndNotify:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)_reorderTabGroup:(id)a3 afterTabGroup:(id)a4;
- (void)_sendAcceptanceResult:(int64_t)a3 forShareMetadata:(id)a4 toHandler:(id)a5;
- (void)_tabGroupSyncDidFinish:(id)a3;
- (void)_uncacheTab:(id)a3;
- (void)_uncacheTabGroup:(id)a3;
- (void)_updateDeviceNameIfNeededWithName:(id)a3;
- (void)_updatePositionsForTabsInTabGroup:(id)a3;
- (void)_updateTabGroupShares:(id)a3;
- (void)_updateTabsAndCacheTabGroup:(id)a3 withTabsByParentIdentifiers:(id)a4 creatorDeviceUUID:(id)a5;
- (void)_userDidAcceptTabGroupShareWithMetadata:(id)a3 inProfileWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_willFlushDeletedTabs:(id)a3 inTabGroup:(id)a4;
- (void)acceptTabGroupShareWithMetadata:(id)a3 handler:(id)a4;
- (void)activeParticipantsDidUpdateInTabGroupWithUUID:(id)a3;
- (void)activeParticipantsDidUpdateInTabWithUUID:(id)a3;
- (void)addCloudTabsObserver:(id)a3;
- (void)addTabGroupObserver:(id)a3;
- (void)appendProfile:(id)a3 completionHandler:(id)a4;
- (void)beginParticipantPresenceReportingForTabGroupWithUUID:(id)a3;
- (void)beginSharingTabGroupWithUUID:(id)a3 completionHandler:(id)a4;
- (void)closeAllTabsInProfilesWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)deleteScopedBookmarkWithUUID:(id)a3 notify:(BOOL)a4;
- (void)deleteScopedBookmarkWithUUID:(id)a3 notify:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteWindowStates:(id)a3 completionHandler:(id)a4;
- (void)disableDevicePresenceReporting;
- (void)disableSuddenTerminationForPendingChanges;
- (void)enableDevicePresenceReporting;
- (void)endParticipantPresenceReportingForTabGroupWithUUID:(id)a3;
- (void)flushDeletedTabsInTabGroup:(id)a3;
- (void)getActiveParticipantsInTab:(id)a3 completionHandler:(id)a4;
- (void)getActiveParticipantsInTabGroup:(id)a3 completionHandler:(id)a4;
- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3;
- (void)getPresenceTabUUIDForParticipantIdentifier:(id)a3 inTabGroup:(id)a4 completionHandler:(id)a5;
- (void)insertScopedBookmark:(id)a3 inScopedBookmarkFolderWithID:(int)a4 afterBookmarkWithUUID:(id)a5 notify:(BOOL)a6;
- (void)movePresenceForParticipantToTabWithUUID:(id)a3;
- (void)moveProfile:(id)a3 afterProfile:(id)a4;
- (void)moveTabGroup:(id)a3 afterTabGroup:(id)a4;
- (void)moveTabGroup:(id)a3 toProfileWithIdentifier:(id)a4 afterTabGroup:(id)a5;
- (void)moveTabs:(id)a3 toTabGroup:(id)a4 afterTab:(id)a5 withoutPersistingTabGroupsWithUUIDStrings:(id)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabGroupWithIdentifier:(id)a5;
- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabWithIdentifier:(id)a5;
- (void)recentlyAddedTabGroupIsAwaitingFirstStartPage:(id)a3;
- (void)registerPinnedTab:(id)a3;
- (void)registerWindowState:(id)a3;
- (void)reloadTabGroupsFromDatabaseWithCompletionHandler:(id)a3;
- (void)removeProfile:(id)a3 completionHandler:(id)a4;
- (void)removeTabGroup:(id)a3;
- (void)removeTabGroupObserver:(id)a3;
- (void)reorderScopedBookmarkWithUUID:(id)a3 afterBookmarkWithUUID:(id)a4 notify:(BOOL)a5;
- (void)saveBrowserState:(id)a3 completionHandler:(id)a4;
- (void)saveWindowState:(id)a3 completionHandler:(id)a4;
- (void)setMaximumTabsPerGroup:(unint64_t)a3;
- (void)setSyncAgentProxy:(id)a3;
- (void)shareDidUpdateForTabGroupWithUUID:(id)a3;
- (void)shareRecordForTabGroup:(id)a3 completionHandler:(id)a4;
- (void)syncDidFinishWithResult:(int64_t)a3;
- (void)tabGroupHasDisplayedStartPage:(id)a3;
- (void)unregisterWindowState:(id)a3;
- (void)updateScopedBookmarkWithUUID:(id)a3 title:(id)a4 address:(id)a5 notify:(BOOL)a6;
- (void)updateTabGroupWithUUID:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5;
- (void)updateTabWithUUID:(id)a3 persist:(BOOL)a4 notify:(BOOL)a5 usingBlock:(id)a6;
- (void)updateTabsInTabGroup:(id)a3 completionHandler:(id)a4;
- (void)updateTabsInTabGroupWithUUID:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)updateTabsInTabGroupWithUUID:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5;
- (void)waitForPendingChanges;
- (void)waitForSetupWithCompletionHandler:(id)a3;
@end

@implementation WBTabGroupManager

- (id)profileWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_profilesByIdentifier objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_removedProfilesByIdentifier objectForKeyedSubscript:v4];
  }
  v8 = v7;

  return v8;
}

- (id)_tabGroupWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_localTabGroupsByUUID objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_syncableTabGroupsByUUID objectForKeyedSubscript:v4];
  }
  v8 = v7;

  return v8;
}

void __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) isNamed] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) deviceUUIDString];
    if (v2)
    {
      v3 = (void *)v2;
      int v4 = [MEMORY[0x263F662A0] isSafariProfilesEnabled];

      if (v4) {
        [*(id *)(a1 + 40) _didModifyUnnamedTabGroup:*(void *)(a1 + 32)];
      }
    }
  }
  if ([*(id *)(a1 + 32) isSyncable])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "copy", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 40)];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)_movePresenceForParticipantToTabWithUUID:(id)a3
{
  id v4 = a3;
  id v19 = [(WBTabGroupManager *)self tabWithUUID:v4];
  v5 = [v19 tabGroupUUID];
  uint64_t v6 = [(WBTabGroupManager *)self tabGroupWithUUID:v5];

  id v7 = objc_alloc(MEMORY[0x263F662E0]);
  uint64_t v8 = [v19 tabGroupUUID];
  uint64_t v9 = (WBSPair *)[v7 initWithFirst:v8 second:v4];

  activeTabGroupAndTabUUIDPair = self->_activeTabGroupAndTabUUIDPair;
  self->_activeTabGroupAndTabUUIDPair = v9;

  tabGroupUUIDsToCKShares = self->_tabGroupUUIDsToCKShares;
  long long v12 = [v19 tabGroupUUID];
  long long v13 = [(NSDictionary *)tabGroupUUIDsToCKShares objectForKeyedSubscript:v12];

  if (v13)
  {
    long long v14 = [v6 bookmark];
    long long v13 = [v14 serverID];

    v15 = [v19 bookmark];
    uint64_t v16 = [v15 serverID];
  }
  else
  {
    uint64_t v16 = 0;
  }
  presenceCoordinator = self->_presenceCoordinator;
  v18 = [(WBTabGroupManager *)self deviceIdentifier];
  [(WBParticipantPresenceCoordinator *)presenceCoordinator moveCurrentParticipantToTabIdentifier:v16 inTabGroupIdentifier:v13 withDeviceIdentifier:v18];
}

- (id)_tabWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_localTabsByUUID objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_syncableTabsByUUID objectForKeyedSubscript:v4];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(NSMutableDictionary *)self->_removedTabsByUUID objectForKeyedSubscript:v4];
    }
    id v7 = v10;
  }
  return v7;
}

- (NSString)deviceIdentifier
{
  return [(WBTabCollection *)self->_tabCollection currentDeviceIdentifier];
}

- (void)updateTabsInTabGroupWithUUID:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5
{
}

- (void)getActiveParticipantsInTab:(id)a3 completionHandler:(id)a4
{
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    presenceCoordinator = self->_presenceCoordinator;
    id v6 = a4;
    id v9 = [a3 bookmark];
    id v7 = [v9 serverID];
    [(WBParticipantPresenceCoordinator *)presenceCoordinator getActiveParticipantsInTabWithIdentifier:v7 completionHandler:v6];
  }
  else
  {
    tabCollection = self->_tabCollection;
    id v9 = a4;
    -[WBTabCollection getActiveParticipantsInTab:completionHandler:](tabCollection, "getActiveParticipantsInTab:completionHandler:", a3);
  }
}

- (WBProfile)defaultProfile
{
  os_unfair_lock_lock(&profilesLock);
  v3 = [(NSMutableDictionary *)self->_profilesByIdentifier objectForKeyedSubscript:*MEMORY[0x263F66420]];
  os_unfair_lock_unlock(&profilesLock);
  return (WBProfile *)v3;
}

- (void)updateTabsInTabGroupWithUUID:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v6 = a4;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v83 = v8;
    _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "Updating tabs in tab group with uuid %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  long long v11 = [(WBTabGroupManager *)self _tabGroupWithUUID:v8];
  long long v12 = v11;
  if (v11)
  {
    devicesByUUID = self->_devicesByUUID;
    long long v14 = [v11 deviceUUIDString];
    v15 = [(NSMutableDictionary *)devicesByUUID objectForKeyedSubscript:v14];

    v57 = v15;
    int v16 = [v15 isRemoteDevice];
    int v17 = v16;
    v55 = v9;
    id v56 = v8;
    if ((v16 & 1) == 0)
    {
      int v53 = v16;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      v18 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v73 objects:v81 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v74 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v24 = [v12 uuid];
              [v23 tabGroupManager:self willPerformBlockUpdatesForTabGroupWithUUID:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v73 objects:v81 count:16];
        }
        while (v20);
      }

      id v9 = v55;
      int v17 = v53;
    }
    if (v9) {
      v9[2](v9, v12);
    }
    if ((v6 & 2) == 0
      && [(WBTabGroupManager *)self _needsInitialBlankTabInTabGroup:v12])
    {
      v25 = [v12 deviceIdentifier];
      v26 = +[WBTab startPageTabWithDeviceIdentifier:v25];

      v80 = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
      [v12 appendTabs:v27];

      v28 = [v26 uuid];
      [v12 setLastSelectedTabUUID:v28];
    }
    v29 = [v57 uuid];
    [(WBTabGroupManager *)self _cacheTabGroup:v12 creatorDeviceUUID:v29];

    [(WBTabGroupManager *)self _updatePositionsForTabsInTabGroup:v12];
    v30 = [v12 deletedTabs];
    [(WBTabGroupManager *)self _willFlushDeletedTabs:v30 inTabGroup:v12];
    os_unfair_lock_unlock(&tabGroupsLock);
    if (v17)
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      v31 = self->_cloudTabObservers;
      uint64_t v32 = [(NSHashTable *)v31 countByEnumeratingWithState:&v69 objects:v79 count:16];
      if (!v32)
      {
LABEL_53:

        if (v6)
        {
          tabCollection = self->_tabCollection;
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke;
          v58[3] = &unk_2643D9CF8;
          id v59 = v12;
          v60 = self;
          [(WBTabCollection *)tabCollection updateTabsInTabGroup:v59 completionHandler:v58];
        }
        goto LABEL_56;
      }
      uint64_t v33 = v32;
      v54 = v30;
      uint64_t v34 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v70 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          if (objc_opt_respondsToSelector())
          {
            v37 = [v12 profileIdentifier];
            [v36 cloudTabDeviceProvider:self didUpdateCloudTabsInProfileWithIdentifier:v37];
          }
        }
        uint64_t v33 = [(NSHashTable *)v31 countByEnumeratingWithState:&v69 objects:v79 count:16];
      }
      while (v33);
    }
    else
    {
      v54 = v30;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v39 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v78 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v66;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v66 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = *(void **)(*((void *)&v65 + 1) + 8 * k);
            if (objc_opt_respondsToSelector())
            {
              v45 = [v12 uuid];
              [v44 tabGroupManager:self didPerformBlockUpdatesForTabGroupWithUUID:v45];
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v78 count:16];
        }
        while (v41);
      }

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v31 = (NSHashTable *)[(NSHashTable *)self->_observers copy];
      uint64_t v46 = [(NSHashTable *)v31 countByEnumeratingWithState:&v61 objects:v77 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v62;
        do
        {
          for (uint64_t m = 0; m != v47; ++m)
          {
            if (*(void *)v62 != v48) {
              objc_enumerationMutation(v31);
            }
            v50 = *(void **)(*((void *)&v61 + 1) + 8 * m);
            if (objc_opt_respondsToSelector())
            {
              v51 = [v12 uuid];
              [v50 tabGroupManager:self didUpdateTabsInTabGroupWithUUID:v51];
            }
          }
          uint64_t v47 = [(NSHashTable *)v31 countByEnumeratingWithState:&v61 objects:v77 count:16];
        }
        while (v47);
      }
    }
    id v9 = v55;
    id v8 = v56;
    v30 = v54;
    goto LABEL_53;
  }
  v38 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v83 = v8;
    _os_log_impl(&dword_21C043000, v38, OS_LOG_TYPE_INFO, "Not updating tabs because the tab group with uuid %{public}@ does not exist.", buf, 0xCu);
  }
  os_unfair_lock_unlock(&tabGroupsLock);
LABEL_56:
}

- (void)_cacheTabGroup:(id)a3 creatorDeviceUUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v21 = a4;
  id v7 = [(WBTabGroupManager *)self _tabCacheForTabGroup:v6];
  id v8 = [(WBTabGroupManager *)self _tabGroupCacheForTabGroup:v6];
  id v9 = [v6 uuid];
  uint64_t v20 = v8;
  [v8 setObject:v6 forKeyedSubscript:v9];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v6 allTabs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v16 = [v15 uuid];
        [(NSMutableDictionary *)self->_localTabsByUUID setObject:0 forKeyedSubscript:v16];
        [(NSMutableDictionary *)self->_syncableTabsByUUID setObject:0 forKeyedSubscript:v16];
        [(NSMutableDictionary *)self->_removedTabsByUUID setObject:0 forKeyedSubscript:v16];
        int v17 = [v15 uuid];
        [v7 setObject:v15 forKeyedSubscript:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  if (v21)
  {
    deviceUUIDByTabGroupUUID = self->_deviceUUIDByTabGroupUUID;
    uint64_t v19 = [v6 uuid];
    [(NSMutableDictionary *)deviceUUIDByTabGroupUUID setObject:v21 forKeyedSubscript:v19];
  }
}

- (id)_tabGroupCacheForTabGroup:(id)a3
{
  int v4 = [a3 isSyncable];
  uint64_t v5 = 72;
  if (v4) {
    uint64_t v5 = 88;
  }
  id v6 = *(Class *)((char *)&self->super.isa + v5);
  return v6;
}

- (id)_tabCacheForTabGroup:(id)a3
{
  int v4 = [a3 isSyncable];
  uint64_t v5 = 64;
  if (v4) {
    uint64_t v5 = 80;
  }
  id v6 = *(Class *)((char *)&self->super.isa + v5);
  return v6;
}

- (void)_willFlushDeletedTabs:(id)a3 inTabGroup:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_unfair_lock_assert_owner(&tabGroupsLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[WBTabGroupManager _uncacheTab:](self, "_uncacheTab:", v11, (void)v14);
        removedTabsByUUID = self->_removedTabsByUUID;
        uint64_t v13 = [v11 uuid];
        [(NSMutableDictionary *)removedTabsByUUID setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_updatePositionsForTabsInTabGroup:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isSyncable])
  {
    uint64_t v20 = [v4 tabs];
    id v5 = objc_msgSend(v20, "safari_filterObjectsUsingBlock:", &__block_literal_global_56_0);
    uint64_t v6 = [v5 valueForKey:@"uuid"];
    uint64_t v7 = [v4 uuid];
    v26 = v7;
    uint64_t v19 = (void *)v6;
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v6];
    v27[0] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];

    [(WBSCRDTPositionGenerator *)self->_positionGenerator generatePositionsForChildRecordNamesGroupedByParentFolders:v9];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          positionGenerator = self->_positionGenerator;
          long long v17 = [v15 uuid];
          v18 = [(WBSCRDTPositionGenerator *)positionGenerator positionForBookmarkWithRecordName:v17];
          [v15 setSyncPosition:v18];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (void)_uncacheTab:(id)a3
{
  localTabsByUUID = self->_localTabsByUUID;
  id v5 = a3;
  uint64_t v6 = [v5 uuid];
  [(NSMutableDictionary *)localTabsByUUID setObject:0 forKeyedSubscript:v6];

  syncableTabsByUUID = self->_syncableTabsByUUID;
  id v8 = [v5 uuid];

  [(NSMutableDictionary *)syncableTabsByUUID setObject:0 forKeyedSubscript:v8];
}

- (BOOL)_needsInitialBlankTabInTabGroup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstUnpinnedTab];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 pinnedStartPage];
    BOOL v5 = v6 == 0;
  }
  return v5;
}

- (void)movePresenceForParticipantToTabWithUUID:(id)a3
{
  if (self->_enableSharedTabGroupsFastSyncPresence) {
    [(WBTabGroupManager *)self _movePresenceForParticipantToTabWithUUID:a3];
  }
  else {
    [(WBTabGroupSyncAgentProtocol *)self->_syncAgentProxy movePresenceForParticipantToTabWithUUID:a3];
  }
}

- (void)registerWindowState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 localTabGroup];
  [(WBTabGroupManager *)self _cacheTabGroup:v5 creatorDeviceUUID:0];

  id v6 = [v4 privateTabGroup];

  [(WBTabGroupManager *)self _cacheTabGroup:v6 creatorDeviceUUID:0];
}

- (WBTabCollection)tabCollection
{
  return self->_tabCollection;
}

- (void)saveWindowState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  if (saveWindowState_completionHandler__lastSavedWindowState
    && [(id)saveWindowState_completionHandler__lastSavedWindowState isEqualToWindowState:v6])
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Skip saving current window state to database since it hasn't changed.", buf, 2u);
    }
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    tabCollection = self->_tabCollection;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__WBTabGroupManager_saveWindowState_completionHandler___block_invoke;
    v10[3] = &unk_2643DC070;
    id v11 = v6;
    uint64_t v12 = v7;
    [(WBTabCollection *)tabCollection saveWindowState:v11 completionHandler:v10];
  }
}

- (void)setSyncAgentProxy:(id)a3
{
  BOOL v5 = (WBTabGroupSyncAgentProtocol *)a3;
  syncAgentProxy = self->_syncAgentProxy;
  if (syncAgentProxy != v5)
  {
    uint64_t v7 = v5;
    [(WBTabGroupSyncAgentProtocol *)syncAgentProxy removeSyncObserver:self];
    objc_storeStrong((id *)&self->_syncAgentProxy, a3);
    syncAgentProxy = (WBTabGroupSyncAgentProtocol *)[(WBTabGroupSyncAgentProtocol *)self->_syncAgentProxy addSyncObserver:self];
    BOOL v5 = v7;
  }
  MEMORY[0x270F9A758](syncAgentProxy, v5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &deviceNameObserverContext)
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x263F081B8], a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&profilesLock);
    [(WBTabGroupManager *)self _updateDeviceNameIfNeededWithName:v7];
    os_unfair_lock_unlock(&profilesLock);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WBTabGroupManager;
    -[WBTabGroupManager observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateDeviceNameIfNeededWithName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSString *)self->_lastLocalDeviceNameSaved isEqualToString:v5])
  {
    id v6 = [(NSMutableDictionary *)self->_devicesByUUID allValues];
    id v7 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_113);

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
          [*(id *)(*((void *)&v15 + 1) + 8 * v12++) setTitle:v5];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_lastLocalDeviceNameSaved, a3);
    tabCollection = self->_tabCollection;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_2;
    v14[3] = &unk_2643D9B90;
    v14[4] = self;
    [(WBTabCollection *)tabCollection saveItems:v8 completionHandler:v14];
  }
}

void __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSSet)allNamedProfileIdentifiers
{
  uint64_t v2 = [(WBTabGroupManager *)self namedProfiles];
  uint64_t v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_82_0);

  uint64_t v4 = [MEMORY[0x263EFFA08] setWithArray:v3];

  return (NSSet *)v4;
}

- (NSSet)allProfileIdentifiers
{
  uint64_t v2 = [(WBTabGroupManager *)self profiles];
  uint64_t v3 = objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_80);

  uint64_t v4 = [MEMORY[0x263EFFA08] setWithArray:v3];

  return (NSSet *)v4;
}

- (id)namedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v5 = [(WBTabGroupManager *)self _tabGroupsForProfileWithIdentifier:v4];

  os_unfair_lock_unlock(&tabGroupsLock);
  return v5;
}

- (NSArray)namedProfiles
{
  os_unfair_lock_lock(&profilesLock);
  uint64_t v3 = [(WBTabGroupManager *)self _namedProfiles];
  os_unfair_lock_unlock(&profilesLock);
  return (NSArray *)v3;
}

- (NSArray)allSyncedTabGroupsExceptRemoteUnnamedTabGroups
{
  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v3 = [(WBTabGroupManager *)self _allSyncedTabGroupsExceptRemoteUnnamedTabGroups];
  os_unfair_lock_unlock(&tabGroupsLock);
  return (NSArray *)v3;
}

- (id)_allSyncedTabGroupsExceptRemoteUnnamedTabGroups
{
  uint64_t v3 = [(NSMutableDictionary *)self->_syncableTabGroupsByUUID allValues];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__WBTabGroupManager__allSyncedTabGroupsExceptRemoteUnnamedTabGroups__block_invoke;
  v7[3] = &unk_2643D9A78;
  v7[4] = self;
  id v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v7);

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v4 copyItems:1];
  return v5;
}

- (id)_namedProfiles
{
  uint64_t v2 = [(WBTabGroupManager *)self _profiles];
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_85_0);

  return v3;
}

- (id)_tabGroupsForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isEqual:*MEMORY[0x263F66420]];
  uint64_t v6 = [(NSMutableDictionary *)self->_syncableTabGroupsByUUID allValues];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  long long v14 = __56__WBTabGroupManager__tabGroupsForProfileWithIdentifier___block_invoke;
  long long v15 = &unk_2643DC150;
  id v16 = v4;
  char v17 = v5;
  id v7 = v4;
  long long v8 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &v12);

  long long v9 = [(WBTabGroupManager *)self _itemSyncPositionComparator];
  long long v10 = [v8 sortedArrayUsingComparator:v9];

  return v10;
}

- (NSArray)profiles
{
  os_unfair_lock_lock(&profilesLock);
  uint64_t v3 = [(WBTabGroupManager *)self _profiles];
  os_unfair_lock_unlock(&profilesLock);
  return (NSArray *)v3;
}

- (id)_profiles
{
  os_unfair_lock_assert_owner(&profilesLock);
  uint64_t v3 = [(NSMutableDictionary *)self->_profilesByIdentifier objectForKeyedSubscript:*MEMORY[0x263F66420]];
  id v4 = [(NSMutableDictionary *)self->_profilesByIdentifier allValues];
  char v5 = (void *)[v4 mutableCopy];

  [v5 removeObject:v3];
  uint64_t v6 = [(WBTabGroupManager *)self _itemSyncPositionComparator];
  [v5 sortUsingComparator:v6];

  [v5 insertObject:v3 atIndex:0];
  id v7 = (void *)[v5 copy];

  return v7;
}

- (id)_itemSyncPositionComparator
{
  return &__block_literal_global_63;
}

uint64_t __42__WBTabGroupManager_allProfileIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)removeTabGroupObserver:(id)a3
{
}

- (BOOL)hasCompletedMigration
{
  return [(WBTabCollection *)self->_tabCollection hasCompletedMigration];
}

- (WBBrowserState)browserState
{
  return [(WBTabCollection *)self->_tabCollection browserState];
}

- (void)addCloudTabsObserver:(id)a3
{
}

- (void)_beginDevicePresenceReportingIfNeeded
{
  if ([(WBTabGroupManager *)self _shouldBeginDevicePresenceReporting])
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Will begin device presence reporting", v4, 2u);
    }
    self->_isBroadcastingPresenceUpdates = 1;
    [(WBParticipantPresenceCoordinator *)self->_presenceCoordinator beginDeviceCoordination];
  }
}

- (void)_updateTabGroupShares:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    id v4 = (NSDictionary *)[a3 copy];
    tabGroupUUIDsToCKShares = self->_tabGroupUUIDsToCKShares;
    self->_tabGroupUUIDsToCKShares = v4;

    if ([(WBTabGroupManager *)self hasSharedTabGroups])
    {
      [(WBTabGroupManager *)self _beginDevicePresenceReportingIfNeeded];
      [(WBTabCollection *)self->_tabCollection setHasSharedTabGroupsWithCompletionHandler:0];
    }
    else
    {
      [(WBTabGroupManager *)self _endDevicePresenceReportingIfNeeded];
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          long long v11 = [(NSDictionary *)self->_tabGroupUUIDsToCKShares objectForKeyedSubscript:v10];
          if (v11)
          {
            uint64_t v12 = [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare objectForKeyedSubscript:v10];
            uint64_t v13 = [v12 recordChangeTag];
            long long v14 = [v11 recordChangeTag];
            char v15 = [v13 isEqualToString:v14];

            if ((v15 & 1) == 0)
            {
              [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare setObject:v11 forKeyedSubscript:v10];
              [(WBParticipantPresenceCoordinator *)self->_presenceCoordinator shareDidUpdate:v11];
            }
          }
          else
          {
            presenceCoordinator = self->_presenceCoordinator;
            char v17 = [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare objectForKeyedSubscript:v10];
            [(WBParticipantPresenceCoordinator *)presenceCoordinator endCollaborationForShare:v17];

            [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare setObject:0 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = self->_tabGroupUUIDsToCKShares;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __43__WBTabGroupManager__updateTabGroupShares___block_invoke;
    v20[3] = &unk_2643DC4F0;
    v20[4] = self;
    [(NSDictionary *)v18 enumerateKeysAndObjectsUsingBlock:v20];
  }
}

- (BOOL)_shouldBeginDevicePresenceReporting
{
  if (!self->_enableSharedTabGroupsFastSyncPresence) {
    goto LABEL_5;
  }
  BOOL v3 = [(WBTabGroupManager *)self hasSharedTabGroups];
  if (v3)
  {
    if (self->_numberOfDevicePresenceReportingRequests)
    {
      LOBYTE(v3) = !self->_isBroadcastingPresenceUpdates;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasSharedTabGroups
{
  return [(NSDictionary *)self->_tabGroupUUIDsToCKShares count] != 0;
}

- (void)_endDevicePresenceReportingIfNeeded
{
  if ([(WBTabGroupManager *)self _shouldEndDevicePresenceReporting])
  {
    [(WBParticipantPresenceCoordinator *)self->_presenceCoordinator endDeviceCoordination];
    self->_isBroadcastingPresenceUpdates = 0;
  }
}

- (BOOL)_shouldEndDevicePresenceReporting
{
  if (!self->_isBroadcastingPresenceUpdates) {
    return 0;
  }
  if (self->_enableSharedTabGroupsFastSyncPresence && self->_numberOfDevicePresenceReportingRequests) {
    return ![(WBTabGroupManager *)self hasSharedTabGroups];
  }
  return 1;
}

- (void)_loadDatabase
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_DEFAULT, "Loading all profiles, tab groups, and tabs records in the database", (uint8_t *)&buf, 2u);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  os_unfair_lock_lock(&profilesLock);
  uint64_t v41 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = [(WBTabCollection *)self->_tabCollection mutableProfiles];
  uint64_t v4 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v53 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v8 = [v7 identifier];
        [(NSMutableDictionary *)v41 setObject:v7 forKeyedSubscript:v8];

        long long v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v9;
          long long v11 = [v7 privacyPreservingDescription];
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_DEFAULT, "Loaded profile from database: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v12 = [v7 devices];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v49 != v14) {
                objc_enumerationMutation(v12);
              }
              id v16 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              char v17 = [v16 uuid];
              [(NSMutableDictionary *)v3 setObject:v16 forKeyedSubscript:v17];
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v62 count:16];
          }
          while (v13);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v4);
  }

  uint64_t v18 = *MEMORY[0x263F66420];
  uint64_t v19 = [(NSMutableDictionary *)v41 objectForKeyedSubscript:*MEMORY[0x263F66420]];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    long long v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21C043000, v21, OS_LOG_TYPE_DEFAULT, "Default profile does not exist. Inserting one...", (uint8_t *)&buf, 2u);
    }
    long long v22 = [(WBTabCollection *)self->_tabCollection mutableNamedTabGroupsInDefaultProfile];
    long long v23 = +[WBMutableProfile createDefaultProfileWithTabGroups:v22];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v58 = 0x3032000000;
    id v59 = __Block_byref_object_copy__7;
    v60 = __Block_byref_object_dispose__7;
    id v61 = 0;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __34__WBTabGroupManager__loadDatabase__block_invoke;
    v47[3] = &unk_2643DBE98;
    v47[4] = &buf;
    [(NSMutableDictionary *)v41 enumerateKeysAndObjectsUsingBlock:v47];
    long long v24 = (void *)MEMORY[0x263F66618];
    uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v26 = [(WBTabGroupManager *)self deviceIdentifier];
    uint64_t v27 = objc_msgSend(v24, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", 0, v25, v26, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
    [v23 setSyncPosition:v27];

    tabCollection = self->_tabCollection;
    id v56 = v23;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    [(WBTabCollection *)tabCollection insertItemsIntoPlace:v29 inParentWithID:0 completionHandler:&__block_literal_global_23];

    [(NSMutableDictionary *)v41 setObject:v23 forKeyedSubscript:v18];
    _Block_object_dispose(&buf, 8);
  }
  profilesByIdentifier = self->_profilesByIdentifier;
  self->_profilesByIdentifier = v41;
  v31 = v41;

  devicesByUUID = self->_devicesByUUID;
  self->_devicesByUUID = v3;
  uint64_t v33 = v3;

  uint64_t v34 = [MEMORY[0x263EFF9A0] dictionary];
  v35 = self->_profilesByIdentifier;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_42;
  v45[3] = &unk_2643DBEE8;
  v45[4] = self;
  id v36 = v34;
  id v46 = v36;
  [(NSMutableDictionary *)v35 enumerateKeysAndObjectsUsingBlock:v45];
  v37 = self->_devicesByUUID;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_3;
  v44[3] = &unk_2643DBF10;
  v44[4] = self;
  [(NSMutableDictionary *)v37 enumerateKeysAndObjectsUsingBlock:v44];
  os_unfair_lock_unlock(&profilesLock);
  os_unfair_lock_unlock(&tabGroupsLock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_4;
  block[3] = &unk_2643D9CF8;
  block[4] = self;
  id v43 = v36;
  id v38 = v36;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (WBTabGroupManager)initWithCollection:(id)a3
{
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)WBTabGroupManager;
  uint64_t v6 = [(WBTabGroupManager *)&v65 init];
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_tabCollection, a3);
    long long v9 = [v5 configuration];
    uint64_t v10 = [v9 device];
    device = v7->_device;
    v7->_device = (WBSDevice *)v10;

    uint64_t v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v7->_enableSharedTabGroupsFastSyncPresence = [v12 BOOLForKey:@"EnableSharedTabGroupsFastSyncPresence"];

    if (v7->_enableSharedTabGroupsFastSyncPresence)
    {
      uint64_t v13 = (WBParticipantPresenceCoordinator *)objc_alloc_init(MEMORY[0x263F861E8]);
      presenceCoordinator = v7->_presenceCoordinator;
      v7->_presenceCoordinator = v13;

      [(WBParticipantPresenceCoordinator *)v7->_presenceCoordinator setDelegate:v7];
      uint64_t v15 = [MEMORY[0x263F08760] set];
      activeTabGroupUUIDs = v7->_activeTabGroupUUIDs;
      v7->_activeTabGroupUUIDs = (NSCountedSet *)v15;

      tabGroupUUIDsToCKShares = v7->_tabGroupUUIDsToCKShares;
      v7->_tabGroupUUIDsToCKShares = (NSDictionary *)MEMORY[0x263EFFA78];

      uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
      broadcastingTabGroupUUIDsToCKShare = v7->_broadcastingTabGroupUUIDsToCKShare;
      v7->_broadcastingTabGroupUUIDsToCKShare = (NSMutableDictionary *)v18;
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_tabGroupManagerProfilesChanged, @"com.apple.mobilesafari.TabGroupManagerProfilesDidChange", 0, (CFNotificationSuspensionBehavior)1024);
    uint64_t v21 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v21;

    uint64_t v23 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    cloudTabObservers = v7->_cloudTabObservers;
    v7->_cloudTabObservers = (NSHashTable *)v23;

    id v25 = [NSString stringWithFormat:@"com.apple.WebBookmarks.WBTabGroupManager.%@.%p.%@", objc_opt_class(), v7, @"InternalQueue"];
    uint64_t v26 = (const char *)[v25 UTF8String];
    uint64_t v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v29 = dispatch_queue_create_with_target_V2(v26, v27, v28);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v29;

    uint64_t v31 = [objc_alloc(MEMORY[0x263F66620]) initWithDelegate:v7];
    positionGenerator = v7->_positionGenerator;
    v7->_positionGenerator = (WBSCRDTPositionGenerator *)v31;

    uint64_t v33 = [MEMORY[0x263EFF9C0] set];
    recentlyAddedTabGroupsAwaitingFirstStartPage = v7->_recentlyAddedTabGroupsAwaitingFirstStartPage;
    v7->_recentlyAddedTabGroupsAwaitingFirstStartPage = (NSMutableSet *)v33;

    uint64_t v35 = [MEMORY[0x263EFF9A0] dictionary];
    removedTabGroupsByUUID = v7->_removedTabGroupsByUUID;
    v7->_removedTabGroupsByUUID = (NSMutableDictionary *)v35;

    uint64_t v37 = [MEMORY[0x263EFF9A0] dictionary];
    removedTabsByUUID = v7->_removedTabsByUUID;
    v7->_removedTabsByUUID = (NSMutableDictionary *)v37;

    uint64_t v39 = [MEMORY[0x263EFF9A0] dictionary];
    localTabsByUUID = v7->_localTabsByUUID;
    v7->_localTabsByUUID = (NSMutableDictionary *)v39;

    uint64_t v41 = [MEMORY[0x263EFF9A0] dictionary];
    localTabGroupsByUUID = v7->_localTabGroupsByUUID;
    v7->_localTabGroupsByUUID = (NSMutableDictionary *)v41;

    uint64_t v43 = [MEMORY[0x263EFF9A0] dictionary];
    syncableTabsByUUID = v7->_syncableTabsByUUID;
    v7->_syncableTabsByUUID = (NSMutableDictionary *)v43;

    uint64_t v45 = [MEMORY[0x263EFF9A0] dictionary];
    syncableTabGroupsByUUID = v7->_syncableTabGroupsByUUID;
    v7->_syncableTabGroupsByUUID = (NSMutableDictionary *)v45;

    uint64_t v47 = [MEMORY[0x263EFF9A0] dictionary];
    profilesByIdentifier = v7->_profilesByIdentifier;
    v7->_profilesByIdentifier = (NSMutableDictionary *)v47;

    uint64_t v49 = [MEMORY[0x263EFF9A0] dictionary];
    removedProfilesByIdentifier = v7->_removedProfilesByIdentifier;
    v7->_removedProfilesByIdentifier = (NSMutableDictionary *)v49;

    uint64_t v51 = [MEMORY[0x263EFF9A0] dictionary];
    devicesByUUID = v7->_devicesByUUID;
    v7->_devicesByUUID = (NSMutableDictionary *)v51;

    uint64_t v53 = [MEMORY[0x263EFF9A0] dictionary];
    deviceUUIDByTabGroupUUID = v7->_deviceUUIDByTabGroupUUID;
    v7->_deviceUUIDByTabGroupUUID = (NSMutableDictionary *)v53;

    uint64_t v55 = [objc_alloc(MEMORY[0x263F66688]) initWithProfileProvider:v7];
    profileDataManager = v7->_profileDataManager;
    v7->_profileDataManager = (WBSProfileDataManager *)v55;

    uint64_t v57 = [MEMORY[0x263EFF9C0] set];
    insertedItemUUIDsThatWereMissingDuringReload = v7->_insertedItemUUIDsThatWereMissingDuringReload;
    v7->_insertedItemUUIDsThatWereMissingDuringReload = (NSMutableSet *)v57;

    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __40__WBTabGroupManager_initWithCollection___block_invoke;
    v63[3] = &unk_2643D9B48;
    id v59 = v7;
    uint64_t v64 = v59;
    v60 = (void *)MEMORY[0x21D4A1230](v63);
    [(WBTabGroupManager *)v59 _loadDatabase];
    [(WBSDevice *)v7->_device addObserver:v59 forKeyPath:@"userAssignedName" options:5 context:&deviceNameObserverContext];
    dispatch_async(MEMORY[0x263EF83A0], v60);
    id v61 = [MEMORY[0x263F087C8] defaultCenter];
    [v61 addObserver:v59 selector:sel__tabGroupSyncDidFinish_ name:@"com.apple.SafariTabGroupSync.SyncDidFinish" object:0];

    uint64_t v8 = v59;
  }

  return v8;
}

uint64_t __35__WBTabGroupManager__namedProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 kind] == 1)
  {
    BOOL v3 = [v2 identifier];
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F66420]] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __34__WBTabGroupManager__loadDatabase__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTabGroupShares:*(void *)(a1 + 40)];
}

- (void)enableDevicePresenceReporting
{
}

void __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke_2;
  v4[3] = &unk_2643D9CF8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

- (void)addTabGroupObserver:(id)a3
{
}

void __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_3;
    block[3] = &unk_2643D9B48;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __34__WBTabGroupManager__loadDatabase__block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a3 tabGroups];
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
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [*(id *)(a1 + 32) _cacheTabGroup:v11 creatorDeviceUUID:0];
        uint64_t v12 = [v11 bookmark];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_2_43;
        v13[3] = &unk_2643DBEC0;
        id v14 = *(id *)(a1 + 40);
        id v15 = v5;
        [v12 getReadOnlyCachedBookmarkSyncDataUsingBlock:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

uint64_t __40__WBTabGroupManager_initWithCollection___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 160) = 1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidFinishSetup:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 168);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)ephemeralTabGroupManager
{
  id v2 = [WBTabCollection alloc];
  uint64_t v3 = +[WBCollectionConfiguration inMemoryTabCollectionConfiguration];
  uint64_t v4 = [(WBTabCollection *)v2 initWithConfiguration:v3 openDatabase:1];

  uint64_t v5 = [[WBTabGroupManager alloc] initWithCollection:v4];
  return v5;
}

- (void)dealloc
{
  [(WBSDevice *)self->_device removeObserver:self forKeyPath:@"userAssignedName" context:&deviceNameObserverContext];
  v3.receiver = self;
  v3.super_class = (Class)WBTabGroupManager;
  [(WBTabGroupManager *)&v3 dealloc];
}

- (NSSet)recentlyAddedTabGroupsAwaitingFirstStartPage
{
  id v2 = (void *)[(NSMutableSet *)self->_recentlyAddedTabGroupsAwaitingFirstStartPage copy];
  return (NSSet *)v2;
}

- (void)waitForSetupWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (self->_didFinishSetup)
  {
    if (!v4) {
      goto LABEL_6;
    }
    uint64_t v7 = v4;
    v4[2]();
  }
  else
  {
    uint64_t v7 = v4;
    uint64_t v5 = (void *)MEMORY[0x21D4A1230]();
    id setupCompletionHandler = self->_setupCompletionHandler;
    self->_id setupCompletionHandler = v5;
  }
  uint64_t v4 = v7;
LABEL_6:
}

- (void)disableSuddenTerminationForPendingChanges
{
}

- (void)waitForPendingChanges
{
}

uint64_t __34__WBTabGroupManager__loadDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 syncPosition];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  obuint64_t j = v4;
  if (*(void *)(v5 + 40))
  {
    uint64_t v6 = objc_msgSend(v4, "compare:");
    id v7 = obj;
    if (v6 != -1) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), obj);
  id v7 = obj;
LABEL_5:
  return MEMORY[0x270F9A758](v6, v7);
}

void __34__WBTabGroupManager__loadDatabase__block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __34__WBTabGroupManager__loadDatabase__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __34__WBTabGroupManager__loadDatabase__block_invoke_2_43(uint64_t a1, void *a2)
{
  id v3 = [a2 shareRecord];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __34__WBTabGroupManager__loadDatabase__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend(a3, "unnamedMutableTabGroups", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) _cacheTabGroup:*(void *)(*((void *)&v11 + 1) + 8 * v10++) creatorDeviceUUID:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_reloadProfilesAndTabGroupsAndNotify:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v51 = a3;
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v49 = a4;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v48 = [MEMORY[0x263EFF9C0] set];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = [(WBTabCollection *)self->_tabCollection mutableProfiles];
  uint64_t v7 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v91;
    uint64_t v52 = *(void *)v91;
    do
    {
      uint64_t v10 = 0;
      uint64_t v54 = v8;
      do
      {
        if (*(void *)v91 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v90 + 1) + 8 * v10);
        long long v12 = [v11 identifier];
        [v5 setObject:v11 forKeyedSubscript:v12];

        if (([v11 isDefault] & 1) == 0)
        {
          long long v13 = v5;
          long long v14 = self;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v15 = [v11 devices];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v86 objects:v94 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v87;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v87 != v18) {
                  objc_enumerationMutation(v15);
                }
                BOOL v20 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                uint64_t v21 = [v20 uuid];
                [v6 setObject:v20 forKeyedSubscript:v21];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v86 objects:v94 count:16];
            }
            while (v17);
          }

          self = v14;
          id v5 = v13;
          uint64_t v9 = v52;
          uint64_t v8 = v54;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
    }
    while (v8);
  }

  os_unfair_lock_lock(&tabGroupsLock);
  os_unfair_lock_lock(&profilesLock);
  uint64_t v55 = [(WBTabGroupManager *)self _profiles];
  long long v22 = [(NSMutableDictionary *)self->_removedProfilesByIdentifier allKeys];
  [v5 removeObjectsForKeys:v22];

  uint64_t v23 = [(WBTabGroupManager *)self _performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier:v5 devicesByUUID:v6 uninsertedSyncableTabsFromSyncableTabsByUUID:self->_syncableTabsByUUID];
  long long v24 = [MEMORY[0x263EFF9C0] set];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke;
  v83[3] = &unk_2643DBF38;
  v83[4] = self;
  id v25 = v23;
  id v84 = v25;
  id v26 = v24;
  id v85 = v26;
  [v5 enumerateKeysAndObjectsUsingBlock:v83];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_2;
  v80[3] = &unk_2643DBF60;
  v80[4] = self;
  id obja = v25;
  id v81 = obja;
  id v27 = v26;
  id v82 = v27;
  [v6 enumerateKeysAndObjectsUsingBlock:v80];
  v28 = [MEMORY[0x263EFF9C0] set];
  dispatch_queue_t v29 = (void *)[(NSMutableDictionary *)self->_syncableTabGroupsByUUID copy];
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_3;
  v75[3] = &unk_2643DBF88;
  id v30 = v27;
  id v76 = v30;
  v77 = self;
  id v31 = v48;
  id v78 = v31;
  id v32 = v28;
  id v79 = v32;
  [v29 enumerateKeysAndObjectsUsingBlock:v75];

  uint64_t v33 = [MEMORY[0x263EFF9C0] set];
  uint64_t v34 = self;
  uint64_t v35 = (void *)[(NSMutableDictionary *)self->_profilesByIdentifier copy];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_4;
  v71[3] = &unk_2643DBF38;
  id v36 = v5;
  id v72 = v36;
  long long v73 = v34;
  id v37 = v33;
  id v74 = v37;
  [v35 enumerateKeysAndObjectsUsingBlock:v71];

  id v38 = (void *)[(NSMutableDictionary *)v34->_devicesByUUID copy];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_5;
  v67[3] = &unk_2643DBF60;
  id v53 = v6;
  id v68 = v53;
  long long v69 = v34;
  id v39 = v31;
  id v70 = v39;
  [v38 enumerateKeysAndObjectsUsingBlock:v67];

  uint64_t v40 = [(WBTabGroupManager *)v34 _unsafeTabGroupUUIDsToCKShares];
  objc_storeStrong((id *)&v34->_insertedItemUUIDsThatWereMissingDuringReload, v48);
  uint64_t v41 = [v39 count];
  os_unfair_lock_unlock(&profilesLock);
  os_unfair_lock_unlock(&tabGroupsLock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_6;
  block[3] = &unk_2643DBFB0;
  block[4] = v34;
  id v59 = v40;
  BOOL v66 = v51;
  id v60 = v37;
  id v61 = v36;
  id v62 = v55;
  id v63 = v32;
  id v64 = v30;
  id v65 = v49;
  id v50 = v49;
  id v42 = v30;
  id v43 = v32;
  id v44 = v55;
  id v45 = v36;
  id v46 = v37;
  id v47 = v40;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if (v41) {
    [(WBTabGroupManager *)v34 _reloadProfilesAndTabGroupsAndNotify:v51 withCompletionHandler:0];
  }
}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v18 = a2;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 tabGroups];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = *(void **)(*(void *)(a1 + 32) + 48);
        long long v14 = [v12 uuid];
        id v15 = [v13 objectForKeyedSubscript:v14];

        if (!v15)
        {
          [*(id *)(a1 + 32) _updateTabsAndCacheTabGroup:v12 withTabsByParentIdentifiers:*(void *)(a1 + 40) creatorDeviceUUID:0];
          [v6 addObject:v12];
          uint64_t v16 = *(void **)(a1 + 48);
          uint64_t v17 = (void *)[v12 copy];
          [v16 addObject:v17];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  [v5 setTabGroups:v6];
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:v5 forKeyedSubscript:v18];
}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v21 = a2;
  id v5 = a3;
  long long v22 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = v5;
  uint64_t v7 = [v5 unnamedMutableTabGroups];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v13 = *(void **)(a1[4] + 48);
        long long v14 = objc_msgSend(v12, "uuid", v21);
        id v15 = [v13 objectForKeyedSubscript:v14];

        if (!v15)
        {
          uint64_t v16 = (void *)a1[4];
          uint64_t v17 = a1[5];
          id v18 = [v6 uuid];
          [v16 _updateTabsAndCacheTabGroup:v12 withTabsByParentIdentifiers:v17 creatorDeviceUUID:v18];

          [v22 addObject:v12];
          long long v19 = (void *)a1[6];
          long long v20 = (void *)[v12 copy];
          [v19 addObject:v20];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  [v6 setUnnamedMutableTabGroups:v22];
  [*(id *)(a1[4] + 120) setObject:v6 forKeyedSubscript:v21];
}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if ([v5 isNamed])
  {
    int v6 = [*(id *)(a1 + 32) containsObject:v5];
    uint64_t v7 = [v5 bookmark];
    int v8 = [v7 wasLoadedFromDatabase];
    int v9 = v6 ^ 1;

    if (v8 && (v9 & 1) != 0) {
      goto LABEL_6;
    }
    if (([v5 isInserted] & v9) != 1) {
      goto LABEL_8;
    }
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 144);
    long long v11 = [v5 uuid];
    LOBYTE(v10) = [v10 containsObject:v11];

    if (v10)
    {
LABEL_6:
      [*(id *)(a1 + 40) _uncacheTabGroup:v5];
      [*(id *)(*(void *)(a1 + 40) + 48) setObject:v5 forKeyedSubscript:v15];
      long long v12 = *(void **)(a1 + 56);
      uint64_t v13 = [v5 copy];
    }
    else
    {
      long long v12 = *(void **)(a1 + 48);
      uint64_t v13 = [v5 uuid];
    }
    long long v14 = (void *)v13;
    [v12 addObject:v13];
  }
LABEL_8:
}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];

  uint64_t v7 = [v5 bookmark];
  int v8 = [v7 wasLoadedFromDatabase];

  if (v8 && !v6 && !WBSIsEqual()) {
    goto LABEL_7;
  }
  if ([v5 isInserted] && !v6)
  {
    int v9 = *(void **)(*(void *)(a1 + 40) + 144);
    uint64_t v10 = [v5 identifier];
    LOBYTE(v9) = [v9 containsObject:v10];

    if ((v9 & 1) == 0)
    {
      long long v11 = *(void **)(*(void *)(a1 + 40) + 144);
      uint64_t v12 = [v5 identifier];
      goto LABEL_9;
    }
LABEL_7:
    [*(id *)(*(void *)(a1 + 40) + 104) setObject:0 forKeyedSubscript:v14];
    [*(id *)(*(void *)(a1 + 40) + 112) setObject:v5 forKeyedSubscript:v14];
    long long v11 = *(void **)(a1 + 48);
    uint64_t v12 = [v5 copy];
LABEL_9:
    uint64_t v13 = (void *)v12;
    [v11 addObject:v12];
  }
}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  int v6 = [v15 bookmark];
  int v7 = [v6 wasLoadedFromDatabase];

  if (v7 && !v5) {
    goto LABEL_6;
  }
  int v8 = [v15 bookmark];
  int v9 = [v8 isInserted];

  if (v9 && !v5)
  {
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 144);
    long long v11 = [v15 uuid];
    LOBYTE(v10) = [v10 containsObject:v11];

    if ((v10 & 1) == 0)
    {
      id v14 = *(void **)(a1 + 48);
      uint64_t v13 = [v15 uuid];
      [v14 addObject:v13];
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 120);
    uint64_t v13 = [v15 uuid];
    [v12 setObject:0 forKeyedSubscript:v13];
LABEL_7:
  }
}

uint64_t __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTabGroupShares:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 96))
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 56) allValues];
    int v6 = [v3 setWithArray:v5];
    [v2 _didRemoveProfiles:v4 updateProfiles:v6 previousProfiles:*(void *)(a1 + 64) removeTabGroups:*(void *)(a1 + 72) updateTabGroups:*(void *)(a1 + 80) previousTabGroups:0];
  }
  uint64_t result = *(void *)(a1 + 88);
  if (result)
  {
    int v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)_mergeTabGroups:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = a3;
  uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v6 = [v5 uuid];
        int v7 = [(WBTabGroupManager *)self _tabGroupWithUUID:v6];

        if (v7) {
          [v5 mergeWithTabGroup:v7];
        }
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        int v8 = [v5 tabs];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              id v14 = [v13 uuid];
              id v15 = [(WBTabGroupManager *)self _tabWithUUID:v14];

              if (v15) {
                [v13 mergeWithTab:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
}

- (id)_performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier:(id)a3 devicesByUUID:(id)a4 uninsertedSyncableTabsFromSyncableTabsByUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  os_unfair_lock_assert_owner(&profilesLock);
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke;
  v29[3] = &unk_2643DBEE8;
  v29[4] = self;
  id v12 = v11;
  id v30 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v29];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_2;
  void v27[3] = &unk_2643DBFD8;
  v27[4] = self;
  id v13 = v12;
  id v28 = v13;
  [v9 enumerateKeysAndObjectsUsingBlock:v27];

  id v14 = (void *)MEMORY[0x263EFFA08];
  id v15 = [v13 allValues];
  uint64_t v16 = objc_msgSend(v15, "safari_flattenedArray");
  uint64_t v17 = objc_msgSend(v16, "safari_mapObjectsUsingBlock:", &__block_literal_global_51_0);
  uint64_t v18 = [v14 setWithArray:v17];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_4;
  v23[3] = &unk_2643DC000;
  id v24 = v18;
  long long v25 = self;
  id v26 = v13;
  id v19 = v13;
  id v20 = v18;
  [v8 enumerateKeysAndObjectsUsingBlock:v23];

  long long v21 = (void *)[v19 copy];
  return v21;
}

void __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 104);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  id v12 = (id)v7;
  if (v7)
  {
    [v6 mergeWithProfile:v7];
  }
  else
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 152);
    id v9 = [v6 serverID];
    id v10 = [v6 identifier];
    [v8 ensureProfileDirectoriesExistForProfileWithServerID:v9 profileIdentifier:v10];
  }
  uint64_t v11 = [v6 tabGroups];

  [*(id *)(a1 + 32) _mergeTabGroups:v11];
  [*(id *)(a1 + 32) _addTabsInTabGroups:v11 toParentIdentifierInTabsToParentIdentifiersDictionary:*(void *)(a1 + 40)];
}

void __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:a2];
  if (v5) {
    [v12 mergeWithDevice:v5];
  }
  id v6 = [v12 unnamedMutableTabGroups];
  [*(id *)(a1 + 32) _mergeTabGroups:v6];
  char v7 = [v12 isRemoteDevice];
  id v8 = *(void **)(a1 + 32);
  if ((v7 & 1) == 0 && !v8[17])
  {
    uint64_t v9 = [v12 title];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 136);
    *(void *)(v10 + 136) = v9;

    id v8 = *(void **)(a1 + 32);
  }
  [v8 _addTabsInTabGroups:v6 toParentIdentifierInTabsToParentIdentifiersDictionary:*(void *)(a1 + 40)];
}

uint64_t __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

void __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v13 = v4;
  id v6 = [v4 uuid];
  LOBYTE(v5) = [v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    char v7 = [v13 bookmark];
    char v8 = [v7 wasLoadedFromDatabase];

    if ((v8 & 1) == 0)
    {
      if (![v13 isInserted]
        || (uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 144),
            [v13 uuid],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(v9) = [v9 containsObject:v10],
            v10,
            (v9 & 1) == 0))
      {
        uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 144);
        id v12 = [v13 uuid];
        [v11 addObject:v12];

        [*(id *)(a1 + 40) _addTab:v13 toParentIdentifierInTabsToParentIdentifiersDictionary:*(void *)(a1 + 48)];
      }
    }
  }
}

- (void)_addTabsInTabGroups:(id)a3 toParentIdentifierInTabsToParentIdentifiersDictionary:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v36 count:16];
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
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        removedTabGroupsByUUID = self->_removedTabGroupsByUUID;
        id v15 = [v13 uuid];
        uint64_t v16 = [(NSMutableDictionary *)removedTabGroupsByUUID objectForKeyedSubscript:v15];

        if (v16)
        {
          long long v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            long long v23 = v22;
            id v24 = [v13 privacyPreservingDescription];
            *(_DWORD *)long long buf = 138543362;
            uint64_t v35 = v24;
            _os_log_impl(&dword_21C043000, v23, OS_LOG_TYPE_INFO, "Filtering tab group %{public}@ because it was removed", buf, 0xCu);
          }
          goto LABEL_19;
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v17 = objc_msgSend(v13, "tabs", 0);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(v17);
              }
              [(WBTabGroupManager *)self _addTab:*(void *)(*((void *)&v25 + 1) + 8 * j) toParentIdentifierInTabsToParentIdentifiersDictionary:v7];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v19);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

- (void)_addTab:(id)a3 toParentIdentifierInTabsToParentIdentifiersDictionary:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  removedTabsByUUID = self->_removedTabsByUUID;
  uint64_t v9 = [v6 uuid];
  uint64_t v10 = [(NSMutableDictionary *)removedTabsByUUID objectForKeyedSubscript:v9];

  if (v10)
  {
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      id v13 = [v6 privacyPreservingDescription];
      int v17 = 138543362;
      uint64_t v18 = v13;
      _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "Filtering tab %{public}@ because it was removed", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if ([v6 parentIdentifier] == 0x7FFFFFFF
      || ![v6 parentIdentifier])
    {
      uint64_t v14 = [v6 tabGroupUUID];
    }
    else
    {
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "parentIdentifier"));
    }
    id v15 = (void *)v14;
    uint64_t v16 = [v7 objectForKeyedSubscript:v14];
    if (!v16)
    {
      uint64_t v16 = [MEMORY[0x263EFF980] array];
      [v7 setObject:v16 forKeyedSubscript:v15];
    }
    [v16 addObject:v6];
  }
}

- (void)_updateTabsAndCacheTabGroup:(id)a3 withTabsByParentIdentifiers:(id)a4 creatorDeviceUUID:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF980];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v21 = [v8 array];
  id v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "identifier"));
  uint64_t v13 = [v10 objectForKeyedSubscript:v12];
  uint64_t v14 = (void *)v13;
  id v15 = (void *)MEMORY[0x263EFFA68];
  if (v13) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = MEMORY[0x263EFFA68];
  }
  [v21 addObjectsFromArray:v16];

  int v17 = [v11 uuid];
  uint64_t v18 = [v10 objectForKeyedSubscript:v17];

  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v15;
  }
  [v21 addObjectsFromArray:v19];

  uint64_t v20 = [(WBTabGroupManager *)self _itemSyncPositionComparator];
  [v21 sortUsingComparator:v20];

  [v11 setTabs:v21];
  [(WBTabGroupManager *)self _cacheTabGroup:v11 creatorDeviceUUID:v9];
}

- (void)_uncacheTabGroup:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WBTabGroupManager *)self _tabCacheForTabGroup:v4];
  id v6 = [(WBTabGroupManager *)self _tabGroupCacheForTabGroup:v4];
  id v7 = [v4 uuid];
  [v6 setObject:0 forKeyedSubscript:v7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = objc_msgSend(v4, "allTabs", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) uuid];
        [v5 setObject:0 forKeyedSubscript:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)removedTabGroupWithUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_removedTabGroupsByUUID objectForKeyedSubscript:a3];
}

- (int64_t)_nextInMemoryPositionChangeID
{
  os_unfair_lock_lock((os_unfair_lock_t)&inMemoryChangeIDLock);
  int64_t v2 = nextInMemoryPositionChangeID--;
  os_unfair_lock_unlock((os_unfair_lock_t)&inMemoryChangeIDLock);
  return v2;
}

- (id)_generatePositionForTabGroup:(id)a3 afterTabGroup:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isNamed])
  {
    id v8 = [v7 profileIdentifier];
    [(WBTabGroupManager *)self _tabGroupsForProfileWithIdentifier:v8];
  }
  else
  {
    id v8 = [v7 deviceUUIDString];
    [(WBTabGroupManager *)self _unnamedTabGroupsForDeviceWithUUID:v8];
  uint64_t v9 = };

  uint64_t v10 = [(WBTabGroupManager *)self _generatePositionForTabGroup:v7 afterTabGroup:v6 inTabGroups:v9];

  return v10;
}

- (id)_generatePositionForTabGroup:(id)a3 afterTabGroup:(id)a4 inTabGroups:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(WBTabGroupManager *)self _tabGroupAfterTabGroup:v9 inTabGroups:a5];
  if ((WBSIsEqual() & 1) != 0 || WBSIsEqual())
  {
    uint64_t v11 = [v8 syncPosition];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F66618];
    uint64_t v13 = [v9 syncPosition];
    long long v14 = [v10 syncPosition];
    long long v15 = [(WBTabGroupManager *)self deviceIdentifier];
    uint64_t v11 = objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v13, v14, v15, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
  }
  return v11;
}

- (id)_tabGroupAfterTabGroup:(id)a3 inTabGroups:(id)a4
{
  if (a3) {
    objc_msgSend(a4, "safari_objectAfter:");
  }
  else {
  id v4 = [a4 firstObject];
  }
  return v4;
}

uint64_t __55__WBTabGroupManager__updatePositionsForTabsInTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 wasAdded]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 wasMoved];
  }

  return v3;
}

- (id)_generatePositionForProfile:(id)a3 afterProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBTabGroupManager *)self _namedProfiles];
  id v9 = v8;
  if (v7) {
    objc_msgSend(v8, "safari_objectAfter:", v7);
  }
  else {
  uint64_t v10 = [v8 firstObject];
  }

  if ((WBSIsEqual() & 1) != 0 || WBSIsEqual())
  {
    uint64_t v11 = [v6 syncPosition];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F66618];
    uint64_t v13 = [v7 syncPosition];
    long long v14 = [v10 syncPosition];
    long long v15 = [(WBTabGroupManager *)self deviceIdentifier];
    uint64_t v11 = objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v13, v14, v15, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
  }
  return v11;
}

- (id)_generatePositionForDevice:(id)a3 afterDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 profileIdentifier];
  id v9 = [(WBTabGroupManager *)self _devicesForProfileWithIdentifier:v8];

  if (v7) {
    objc_msgSend(v9, "safari_objectAfter:", v7);
  }
  else {
  uint64_t v10 = [v9 firstObject];
  }
  if ((WBSIsEqual() & 1) != 0 || WBSIsEqual())
  {
    uint64_t v11 = [v6 syncPosition];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F66618];
    uint64_t v13 = [v7 syncPosition];
    long long v14 = [v10 syncPosition];
    long long v15 = [(WBTabGroupManager *)self deviceIdentifier];
    uint64_t v11 = objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v13, v14, v15, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
  }
  return v11;
}

uint64_t __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 bookmark];
  id v7 = [v5 bookmark];
  uint64_t v8 = [v6 syncPosition];
  uint64_t v9 = [v7 syncPosition];
  uint64_t v10 = (void *)v9;
  if (v8 | v9)
  {
    if (v9)
    {
      if (v8)
      {
        uint64_t v11 = [(id)v8 compare:v9];
      }
      else
      {
        long long v17 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_1(v17);
        }
        uint64_t v11 = 1;
      }
    }
    else
    {
      long long v16 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_1(v16);
      }
      uint64_t v11 = -1;
    }
  }
  else
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_3(v12, v4);
    }
    uint64_t v13 = [v6 serverID];
    uint64_t v14 = [v7 serverID];
    long long v15 = (void *)v14;
    uint64_t v11 = 0;
    if (v13 && v14) {
      uint64_t v11 = [v13 compare:v14];
    }
  }
  return v11;
}

- (void)_cacheProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    os_unfair_lock_lock(&profilesLock);
    profilesByIdentifier = self->_profilesByIdentifier;
    id v6 = [v7 identifier];
    [(NSMutableDictionary *)profilesByIdentifier setObject:v7 forKeyedSubscript:v6];

    os_unfair_lock_unlock(&profilesLock);
    id v4 = v7;
  }
}

- (void)unregisterWindowState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localTabGroup];
  [(WBTabGroupManager *)self _uncacheTabGroup:v5];

  id v6 = [v4 privateTabGroup];

  [(WBTabGroupManager *)self _uncacheTabGroup:v6];
}

- (BOOL)saveBrowserState:(id)a3
{
  return [(WBTabCollection *)self->_tabCollection saveBrowserState:a3];
}

- (void)saveBrowserState:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)saveWindowState:(id)a3
{
  return [(WBTabCollection *)self->_tabCollection saveWindowState:a3];
}

void __55__WBTabGroupManager_saveWindowState_completionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WBTabGroupManager_saveWindowState_completionHandler___block_invoke_2;
  block[3] = &unk_2643DC048;
  char v6 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__WBTabGroupManager_saveWindowState_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = (void *)saveWindowState_completionHandler__lastSavedWindowState;
    saveWindowState_completionHandler__lastSavedWindowState = v2;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)updateTabsInTabGroup:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteWindowStates:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(WBTabGroupManager *)self unregisterWindowState:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  [(WBTabCollection *)self->_tabCollection deleteWindowStates:v6 completionHandler:v7];
}

- (BOOL)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5
{
  return [(WBTabCollection *)self->_tabCollection insertItems:a3 inParentWithID:*(void *)&a4 afterItem:a5];
}

- (id)_localTabGroups
{
  return (id)[(NSMutableDictionary *)self->_localTabGroupsByUUID allValues];
}

- (id)_allTabGroupsUnsorted
{
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v4 = [(NSMutableDictionary *)self->_syncableTabGroupsByUUID allValues];
  id v5 = (void *)[v3 initWithArray:v4 copyItems:1];

  return v5;
}

uint64_t __68__WBTabGroupManager__allSyncedTabGroupsExceptRemoteUnnamedTabGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isNamed]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) _didLocallyCreateUnnamedTabGroup:v3];
  }

  return v4;
}

- (NSArray)allNamedTabGroupsUnsorted
{
  os_unfair_lock_lock(&tabGroupsLock);
  id v3 = [(WBTabGroupManager *)self _allTabGroupsUnsorted];
  os_unfair_lock_unlock(&tabGroupsLock);
  return (NSArray *)v3;
}

- (NSArray)namedTabGroupsInDefaultProfile
{
  os_unfair_lock_lock(&tabGroupsLock);
  id v3 = [(WBTabGroupManager *)self _tabGroupsForProfileWithIdentifier:*MEMORY[0x263F66420]];
  os_unfair_lock_unlock(&tabGroupsLock);
  return (NSArray *)v3;
}

- (id)unnamedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  id v5 = [(WBTabGroupManager *)self _unnamedTabGroupsForProfileWithIdentifier:v4];

  os_unfair_lock_unlock(&tabGroupsLock);
  return v5;
}

- (id)tabGroupWithServerID:(id)a3
{
  id v4 = a3;
  syncableTabGroupsByUUID = self->_syncableTabGroupsByUUID;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__WBTabGroupManager_tabGroupWithServerID___block_invoke;
  v9[3] = &unk_2643DC098;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSMutableDictionary *)syncableTabGroupsByUUID safari_valueOfEntryPassingTest:v9];

  return v7;
}

uint64_t __42__WBTabGroupManager_tabGroupWithServerID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 serverID];
  uint64_t v4 = WBSIsEqual();

  return v4;
}

- (id)insertTabGroup:(id)a3 afterTabGroup:(id)a4
{
  return [(WBTabGroupManager *)self _insertTabGroup:a3 afterTabGroup:a4 isMove:0];
}

- (id)_insertTabGroup:(id)a3 afterTabGroup:(id)a4 isMove:(BOOL)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v9 = (void *)[v7 mutableCopy];
  long long v31 = v8;
  id v10 = [v8 uuid];
  uint64_t v11 = [(WBTabGroupManager *)self _tabGroupWithUUID:v10];

  long long v30 = (void *)v11;
  long long v12 = [(WBTabGroupManager *)self _generatePositionForTabGroup:v9 afterTabGroup:v11];
  [v9 setSyncPosition:v12];

  [(WBTabGroupManager *)self _cacheTabGroup:v9 creatorDeviceUUID:0];
  if ([v7 supportsTabGroupFavorites]) {
    [(NSMutableSet *)self->_recentlyAddedTabGroupsAwaitingFirstStartPage addObject:v7];
  }
  os_unfair_lock_unlock(&tabGroupsLock);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v13 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v18 tabGroupManagerDidUpdateTabGroups:self];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v15);
  }

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke;
  v32[3] = &unk_2643DC0C0;
  BOOL v35 = a5;
  v32[4] = self;
  id v19 = v9;
  id v33 = v19;
  id v20 = v7;
  id v34 = v20;
  id v21 = (void *)MEMORY[0x21D4A1230](v32);
  os_unfair_lock_lock(&profilesLock);
  long long v22 = [v19 profileIdentifier];
  long long v23 = [(WBTabGroupManager *)self profileWithIdentifier:v22];

  os_unfair_lock_unlock(&profilesLock);
  if (v23 && [v23 kind] && objc_msgSend(v20, "isNamed"))
  {
    tabCollection = self->_tabCollection;
    id v41 = v19;
    long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
    [(WBTabCollection *)tabCollection insertItemsIntoPlace:v25 inParent:v23 completionHandler:v21];
  }
  else
  {
    long long v26 = self->_tabCollection;
    id v40 = v19;
    long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
    [(WBTabCollection *)v26 insertItemsIntoPlace:v25 inParentWithID:0 completionHandler:v21];
  }

  long long v27 = (void *)[v19 copy];
  return v27;
}

void __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 248);
    if (v3) {
      [v4 saveMinimumAPISyncVersionOfDescendantItemsForMovedItem:*(void *)(a1 + 48)];
    }
    else {
      [v4 createTopScopedBookmarkListIfNeededForTabGroup:*(void *)(a1 + 40)];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke_2;
    block[3] = &unk_2643D9B48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)moveTabGroup:(id)a3 afterTabGroup:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6
    && ([v6 profileIdentifier],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        [v12 profileIdentifier],
        long long v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        !v10))
  {
    long long v11 = [v7 profileIdentifier];
    [(WBTabGroupManager *)self moveTabGroup:v12 toProfileWithIdentifier:v11 afterTabGroup:v7];
  }
  else
  {
    [(WBTabGroupManager *)self _reorderTabGroup:v12 afterTabGroup:v7];
  }
}

- (void)_reorderTabGroup:(id)a3 afterTabGroup:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    long long v9 = v8;
    int v10 = [v6 privacyPreservingDescription];
    long long v11 = [v7 privacyPreservingDescription];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v43 = v10;
    __int16 v44 = 2114;
    id v45 = v11;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Moving tab group %{public}@ after tab group %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  id v12 = [v6 uuid];
  uint64_t v13 = [(WBTabGroupManager *)self _tabGroupWithUUID:v12];

  uint64_t v14 = [v7 uuid];
  uint64_t v15 = [(WBTabGroupManager *)self _tabGroupWithUUID:v14];

  if (v13)
  {
    uint64_t v16 = [v6 profileIdentifier];
    uint64_t v17 = [(WBTabGroupManager *)self _tabGroupsForProfileWithIdentifier:v16];

    uint64_t v18 = [(WBTabGroupManager *)self _tabGroupAfterTabGroup:v7 inTabGroups:v17];
    if ([v17 count] && !WBSIsEqual())
    {
      id v33 = v18;
      id v34 = v15;
      id v35 = v6;
      long long v25 = [(WBTabGroupManager *)self _generatePositionForTabGroup:v13 afterTabGroup:v15 inTabGroups:v17];
      [v13 setSyncPosition:v25];

      os_unfair_lock_unlock(&tabGroupsLock);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v26 = (void *)[(NSHashTable *)self->_observers copy];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v38 != v29) {
              objc_enumerationMutation(v26);
            }
            long long v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v31 tabGroupManagerDidUpdateTabGroups:self];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v28);
      }

      tabCollection = self->_tabCollection;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke;
      v36[3] = &unk_2643D9B90;
      v36[4] = self;
      [(WBTabCollection *)tabCollection reorderItemIntoPlace:v13 completionHandler:v36];
      id v6 = v35;
      uint64_t v18 = v33;
      uint64_t v15 = v34;
    }
    else
    {
      id v19 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = v19;
        id v21 = [v6 privacyPreservingDescription];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v43 = v21;
        _os_log_impl(&dword_21C043000, v20, OS_LOG_TYPE_INFO, "Not moving tab group %{public}@ because its position did not change.", buf, 0xCu);
      }
      os_unfair_lock_unlock(&tabGroupsLock);
    }
  }
  else
  {
    long long v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = v22;
      id v24 = [v6 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v43 = v24;
      _os_log_impl(&dword_21C043000, v23, OS_LOG_TYPE_INFO, "Not moving tab group %{public}@ because it no longer exists", buf, 0xCu);
    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }
}

void __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke_2;
    block[3] = &unk_2643D9B48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)moveTabGroup:(id)a3 toProfileWithIdentifier:(id)a4 afterTabGroup:(id)a5
{
  id v13 = a5;
  id v8 = a4;
  id v9 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  long long v10 = [v9 uuid];

  long long v11 = [(WBTabGroupManager *)self _tabGroupWithUUID:v10];

  [v11 setProfileIdentifier:v8];
  os_unfair_lock_unlock(&tabGroupsLock);
  id v12 = [(WBTabGroupManager *)self _insertTabGroup:v11 afterTabGroup:v13 isMove:1];
}

- (void)removeTabGroup:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v5 = [v4 uuid];
  uint64_t v6 = [(WBTabGroupManager *)self _tabGroupWithUUID:v5];

  id v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      id v9 = v7;
      long long v10 = [v4 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      id v45 = v10;
      _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Removing tab group %{public}@", buf, 0xCu);
    }
    [(WBTabGroupManager *)self _uncacheTabGroup:v6];
    removedTabGroupsByUUID = self->_removedTabGroupsByUUID;
    id v12 = [v6 uuid];
    long long v30 = v6;
    [(NSMutableDictionary *)removedTabGroupsByUUID setObject:v6 forKeyedSubscript:v12];

    os_unfair_lock_unlock(&tabGroupsLock);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector())
          {
            id v19 = [v4 uuid];
            [v18 tabGroupManager:self didRemoveTabGroupWithUUID:v19];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v15);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v33 + 1) + 8 * v24);
          if (objc_opt_respondsToSelector()) {
            [v25 tabGroupManagerDidUpdateTabGroups:self];
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v22);
    }

    tabCollection = self->_tabCollection;
    uint64_t v6 = v30;
    id v41 = v30;
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __36__WBTabGroupManager_removeTabGroup___block_invoke;
    v31[3] = &unk_2643DC0E8;
    v31[4] = self;
    id v32 = v30;
    [(WBTabCollection *)tabCollection deleteItems:v27 leaveTombstones:1 completionHandler:v31];
  }
  else
  {
    if (v8)
    {
      uint64_t v28 = v7;
      uint64_t v29 = [v4 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      id v45 = v29;
      _os_log_impl(&dword_21C043000, v28, OS_LOG_TYPE_INFO, "Not removing tab group %{public}@ because it no longer exists", buf, 0xCu);
    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }
}

void __36__WBTabGroupManager_removeTabGroup___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __36__WBTabGroupManager_removeTabGroup___block_invoke_2;
    v3[3] = &unk_2643D9CF8;
    uint64_t v2 = *(void **)(a1 + 40);
    v3[4] = *(void *)(a1 + 32);
    id v4 = v2;
    dispatch_async(MEMORY[0x263EF83A0], v3);
  }
}

void __36__WBTabGroupManager_removeTabGroup___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__WBTabGroupManager_removeTabGroup___block_invoke_3;
  v13[3] = &unk_2643D9CF8;
  uint64_t v2 = *(void **)(a1 + 40);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v2;
  os_unfair_lock_lock(&tabGroupsLock);
  __36__WBTabGroupManager_removeTabGroup___block_invoke_3((uint64_t)v13);
  os_unfair_lock_unlock(&tabGroupsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v5);
  }
}

void __36__WBTabGroupManager_removeTabGroup___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(a1 + 40) uuid];
  [v1 setObject:0 forKeyedSubscript:v2];
}

- (void)updateTabGroupWithUUID:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v9 = (void (**)(id, void *))a5;
  long long v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    id v56 = v8;
    _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_INFO, "Updating tab group with uuid %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  long long v11 = [(WBTabGroupManager *)self _tabGroupWithUUID:v8];
  if (v11)
  {
    BOOL v35 = v6;
    id v36 = v8;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v12 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v18 = [v11 uuid];
            [v17 tabGroupManager:self willPerformBlockUpdatesForTabGroupWithUUID:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v14);
    }

    v9[2](v9, v11);
    [v11 updateLastSelectedTab];
    os_unfair_lock_unlock(&tabGroupsLock);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v19 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          if (objc_opt_respondsToSelector())
          {
            long long v25 = [v11 uuid];
            [v24 tabGroupManager:self didPerformBlockUpdatesForTabGroupWithUUID:v25];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v21);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v26 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v40 + 1) + 8 * k);
          if (objc_opt_respondsToSelector())
          {
            id v32 = [v11 uuid];
            [v31 tabGroupManager:self didUpdateTabGroupWithUUID:v32];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v28);
    }

    id v8 = v36;
    if (v35)
    {
      tabCollection = self->_tabCollection;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke;
      v37[3] = &unk_2643DC0E8;
      id v38 = v11;
      long long v39 = self;
      [(WBTabCollection *)tabCollection saveItem:v38 completionHandler:v37];
    }
  }
  else
  {
    long long v34 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      id v56 = v8;
      _os_log_impl(&dword_21C043000, v34, OS_LOG_TYPE_INFO, "Not updating tab group with uuid %{public}@ because it does not exist.", buf, 0xCu);
    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }
}

void __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if ([*(id *)(a1 + 32) isSyncable])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke_2;
      block[3] = &unk_2643D9B48;
      void block[4] = *(void *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)tabGroupHasDisplayedStartPage:(id)a3
{
}

- (void)recentlyAddedTabGroupIsAwaitingFirstStartPage:(id)a3
{
}

- (BOOL)hasMultipleProfiles
{
  id v2 = [(WBTabGroupManager *)self profiles];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

uint64_t __47__WBTabGroupManager_allNamedProfileIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __56__WBTabGroupManager__tabGroupsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isNamed])
  {
    uint64_t v4 = [v3 profileIdentifier];
    if (WBSIsEqual())
    {
      uint64_t v5 = 1;
    }
    else if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v5 = [v3 isInDefaultProfile];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_unnamedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isEqual:*MEMORY[0x263F66420]];
  uint64_t v6 = [(NSMutableDictionary *)self->_syncableTabGroupsByUUID allValues];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__WBTabGroupManager__unnamedTabGroupsForProfileWithIdentifier___block_invoke;
  v10[3] = &unk_2643DC150;
  id v11 = v4;
  char v12 = v5;
  id v7 = v4;
  long long v8 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v10);

  return v8;
}

uint64_t __63__WBTabGroupManager__unnamedTabGroupsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isNamed])
  {
    uint64_t v4 = 0;
  }
  else
  {
    char v5 = [v3 profileIdentifier];
    if (WBSIsEqual())
    {
      uint64_t v4 = 1;
    }
    else if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v4 = [v3 isInDefaultProfile];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (id)_unnamedTabGroupsForDeviceWithUUID:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMutableDictionary *)self->_syncableTabGroupsByUUID allValues];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__WBTabGroupManager__unnamedTabGroupsForDeviceWithUUID___block_invoke;
  v11[3] = &unk_2643DC178;
  id v12 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v11);

  long long v8 = [(WBTabGroupManager *)self _itemSyncPositionComparator];
  long long v9 = [v7 sortedArrayUsingComparator:v8];

  return v9;
}

uint64_t __56__WBTabGroupManager__unnamedTabGroupsForDeviceWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isNamed])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [v2 deviceUUIDString];
    uint64_t v3 = WBSIsEqual();
  }
  return v3;
}

- (void)appendProfile:(id)a3 completionHandler:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v33 = a4;
  os_unfair_lock_lock(&profilesLock);
  id v7 = (void *)[v6 mutableCopy];
  long long v8 = [(WBTabGroupManager *)self _namedProfiles];
  long long v9 = [v8 lastObject];
  long long v10 = [(WBTabGroupManager *)self _generatePositionForProfile:v6 afterProfile:v9];
  [v7 setSyncPosition:v10];

  profilesByIdentifier = self->_profilesByIdentifier;
  id v12 = [v6 identifier];
  [(NSMutableDictionary *)profilesByIdentifier setObject:v7 forKeyedSubscript:v12];

  os_unfair_lock_unlock(&profilesLock);
  profileDataManager = self->_profileDataManager;
  uint64_t v14 = [v6 serverID];
  long long v34 = v6;
  uint64_t v15 = [v6 identifier];
  [(WBSProfileDataManager *)profileDataManager ensureProfileDirectoriesExistForProfileWithServerID:v14 profileIdentifier:v15];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  uint64_t v16 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v43 + 1) + 8 * v20);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v22 = [v7 identifier];
          [v21 tabGroupManager:self didInsertProfileWithIdentifier:v22];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v18);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v23 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v39 + 1) + 8 * v27);
        if (objc_opt_respondsToSelector()) {
          [v28 tabGroupManagerDidUpdateProfiles:self];
        }
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v25);
  }

  tabCollection = self->_tabCollection;
  long long v47 = v7;
  long long v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke;
  v35[3] = &unk_2643DC1C8;
  long long v37 = self;
  id v38 = v33;
  id v36 = v7;
  id v31 = v7;
  id v32 = v33;
  [(WBTabCollection *)tabCollection insertItemsIntoPlace:v30 inParentWithID:0 completionHandler:v35];
}

void __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_2;
    block[3] = &unk_2643DC1A0;
    id v7 = *(id *)(a1 + 48);
    char v8 = a2;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_3;
    v4[3] = &unk_2643D9B48;
    void v4[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

void __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = (id)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
  else
  {
    id v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
}

void __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)updateProfileWithIdentifier:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  long long v11 = (void (**)(id, void *))a5;
  id v12 = a6;
  os_unfair_lock_lock(&profilesLock);
  uint64_t v13 = [(NSMutableDictionary *)self->_profilesByIdentifier objectForKeyedSubscript:v10];
  uint64_t v14 = v13;
  if (v13)
  {
    BOOL v29 = a4;
    long long v30 = v12;
    id v32 = v10;
    id v33 = (void *)[v13 copy];
    id v31 = v11;
    v11[2](v11, v14);
    os_unfair_lock_unlock(&profilesLock);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v15 = self;
    uint64_t v16 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v22 = [v14 identifier];
            uint64_t v23 = [v14 differenceFromProfile:v33];
            [v21 tabGroupManager:v15 didUpdateProfileWithIdentifier:v22 difference:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v18);
    }

    if (v29)
    {
      tabCollection = v15->_tabCollection;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke;
      v34[3] = &unk_2643DC1C8;
      id v12 = v30;
      id v37 = v30;
      id v25 = v14;
      id v35 = v25;
      id v36 = v15;
      [(WBTabCollection *)tabCollection saveItem:v25 completionHandler:v34];
      uint64_t v26 = (void *)[v25 copy];
    }
    else
    {
      uint64_t v26 = (void *)[v14 copy];
      id v12 = v30;
    }

    long long v11 = v31;
    id v10 = v32;
  }
  else
  {
    uint64_t v27 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      id v44 = v10;
      _os_log_impl(&dword_21C043000, v27, OS_LOG_TYPE_INFO, "Not updating profile with uuid %{public}@ because it does not exist.", buf, 0xCu);
    }
    os_unfair_lock_unlock(&profilesLock);
    uint64_t v26 = 0;
  }

  return v26;
}

void __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_2;
    block[3] = &unk_2643DC1F0;
    id v6 = *(id *)(a1 + 48);
    char v7 = a2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (a2)
  {
    if ([*(id *)(a1 + 32) isSyncable])
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_3;
      v4[3] = &unk_2643D9B48;
      void v4[4] = *(void *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], v4);
    }
  }
}

uint64_t __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)removeProfile:(id)a3 completionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&profilesLock);
  profilesByIdentifier = self->_profilesByIdentifier;
  long long v9 = [v6 identifier];
  long long v10 = [(NSMutableDictionary *)profilesByIdentifier objectForKeyedSubscript:v9];

  long long v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = v11;
      uint64_t v14 = [v6 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v55 = v14;
      _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_INFO, "Removing profile %{public}@", buf, 0xCu);
    }
    long long v38 = v7;
    uint64_t v15 = self->_profilesByIdentifier;
    uint64_t v16 = [v6 identifier];
    [(NSMutableDictionary *)v15 removeObjectForKey:v16];

    removedProfilesByIdentifier = self->_removedProfilesByIdentifier;
    uint64_t v18 = [v10 identifier];
    id v37 = v10;
    [(NSMutableDictionary *)removedProfilesByIdentifier setObject:v10 forKeyedSubscript:v18];

    os_unfair_lock_unlock(&profilesLock);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v19 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v25 = [v6 identifier];
            [v24 tabGroupManager:self didRemoveProfileWithIdentifier:v25];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v21);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v26 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v31 tabGroupManagerDidUpdateProfiles:self];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v28);
    }

    long long v10 = v37;
    if (![(WBTabGroupManager *)self hasMultipleProfiles]) {
      id v32 = [(WBTabGroupManager *)self updateProfileWithIdentifier:*MEMORY[0x263F66420] persist:1 usingBlock:&__block_literal_global_97 completionHandler:0];
    }
    tabCollection = self->_tabCollection;
    long long v51 = v37;
    long long v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_2;
    v39[3] = &unk_2643DC238;
    id v7 = v38;
    id v42 = v38;
    v39[4] = self;
    id v40 = v6;
    id v41 = v37;
    [(WBTabCollection *)tabCollection deleteItems:v34 leaveTombstones:1 completionHandler:v39];
  }
  else
  {
    if (v12)
    {
      id v35 = v11;
      id v36 = [v6 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v55 = v36;
      _os_log_impl(&dword_21C043000, v35, OS_LOG_TYPE_INFO, "Not removing profile %{public}@ because it no longer exists", buf, 0xCu);
    }
    os_unfair_lock_unlock(&profilesLock);
  }
}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTitle:&stru_26CC2ED50];
  uint64_t v3 = [MEMORY[0x263F66288] defaultPersonalProfileSymbolImage];
  [v2 setSymbolImageName:v3];

  id v4 = [MEMORY[0x263F66288] defaultPersonalProfileColor];
  [v2 setColor:v4];
}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 56))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_3;
    block[3] = &unk_2643DC1F0;
    id v7 = *(id *)(a1 + 56);
    char v8 = a2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 152) didRemoveProfile:*(void *)(a1 + 40)];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_4;
    v4[3] = &unk_2643D9CF8;
    void v4[4] = *(void *)(a1 + 32);
    id v5 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_5;
  v13[3] = &unk_2643D9CF8;
  id v2 = *(void **)(a1 + 40);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v2;
  os_unfair_lock_lock(&profilesLock);
  __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_5((uint64_t)v13);
  os_unfair_lock_unlock(&profilesLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v5);
  }
}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 112);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 setObject:0 forKeyedSubscript:v2];
}

- (void)moveProfile:(id)a3 afterProfile:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    long long v9 = v8;
    long long v10 = [v6 privacyPreservingDescription];
    long long v11 = [v7 privacyPreservingDescription];
    *(_DWORD *)long long buf = 138543618;
    id v37 = v10;
    __int16 v38 = 2114;
    long long v39 = v11;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Moving profile %{public}@ after profile %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&profilesLock);
  profilesByIdentifier = self->_profilesByIdentifier;
  uint64_t v13 = [v6 identifier];
  id v14 = [(NSMutableDictionary *)profilesByIdentifier objectForKeyedSubscript:v13];

  uint64_t v15 = self->_profilesByIdentifier;
  uint64_t v16 = [v7 identifier];
  uint64_t v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];

  if (v14)
  {
    uint64_t v29 = v17;
    uint64_t v18 = [(WBTabGroupManager *)self _generatePositionForProfile:v6 afterProfile:v17];
    [v14 setSyncPosition:v18];

    os_unfair_lock_unlock(&profilesLock);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v19 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v24 tabGroupManagerDidUpdateProfiles:self];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v21);
    }

    tabCollection = self->_tabCollection;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke;
    v30[3] = &unk_2643D9B90;
    v30[4] = self;
    [(WBTabCollection *)tabCollection reorderItemIntoPlace:v14 completionHandler:v30];
    uint64_t v17 = v29;
  }
  else
  {
    uint64_t v26 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = v26;
      uint64_t v28 = [v6 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      id v37 = v28;
      _os_log_impl(&dword_21C043000, v27, OS_LOG_TYPE_INFO, "Not moving profile %{public}@ because it no longer exists", buf, 0xCu);
    }
    os_unfair_lock_unlock(&profilesLock);
  }
}

void __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke_2;
    block[3] = &unk_2643D9B48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)insertUnnamedTabGroup:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 profileIdentifier];
  id v7 = [(WBTabGroupManager *)self profileWithIdentifier:v6];

  long long v8 = [v7 identifier];
  long long v9 = [(WBTabGroupManager *)self _findOrCreateLocalDeviceForProfileWithIdentifier:v8];

  long long v10 = [v9 uuid];
  deviceUUIDByTabGroupUUID = self->_deviceUUIDByTabGroupUUID;
  long long v12 = [v5 uuid];
  [(NSMutableDictionary *)deviceUUIDByTabGroupUUID setObject:v10 forKeyedSubscript:v12];

  os_unfair_lock_unlock(&profilesLock);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke;
  v21[3] = &unk_2643DA608;
  id v22 = v5;
  uint64_t v23 = self;
  id v24 = v9;
  id v13 = v9;
  id v14 = v5;
  os_unfair_lock_lock(&tabGroupsLock);
  __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke((id *)v21);
  os_unfair_lock_unlock(&tabGroupsLock);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_2;
  v20[3] = &unk_2643D9B90;
  v20[4] = self;
  uint64_t v15 = (void *)MEMORY[0x21D4A1230](v20);
  tabCollection = self->_tabCollection;
  v25[0] = v14;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  [(WBTabCollection *)tabCollection insertItemsIntoPlace:v17 inParent:v13 completionHandler:v15];

  uint64_t v18 = (void *)[v14 copy];
  return v18;
}

void __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke(id *a1)
{
  id v2 = [a1[5] _generatePositionForTabGroup:a1[4] afterTabGroup:0];
  [a1[4] setSyncPosition:v2];

  uint64_t v3 = [a1[6] profileIdentifier];
  [a1[4] setDeviceUUIDString:v3];

  id v5 = a1[4];
  id v4 = a1[5];
  id v6 = [a1[6] profileIdentifier];
  [v4 _cacheTabGroup:v5 creatorDeviceUUID:v6];
}

void __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_3;
    block[3] = &unk_2643D9B48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_tabGroupsWithTabsToBeClosedForProfilesWithIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = *MEMORY[0x263F66420];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(void *)(*((void *)&v14 + 1) + 8 * i) == v10) {
          [(NSMutableDictionary *)self->_localTabGroupsByUUID allValues];
        }
        else {
        long long v12 = -[WBTabGroupManager _unnamedTabGroupsForProfileWithIdentifier:](self, "_unnamedTabGroupsForProfileWithIdentifier:");
        }
        objc_msgSend(v5, "addObjectsFromArray:", v12, (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)numberOfTabsToBeClosedForProfilesWithIdentifiers:(id)a3
{
  return [(WBTabCollection *)self->_tabCollection numberOfLocalTabsToBeClosed];
}

- (void)closeAllTabsInProfilesWithIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [(WBTabGroupManager *)self _tabGroupsWithTabsToBeClosedForProfilesWithIdentifiers:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) uuid];
        [(WBTabGroupManager *)self updateTabsInTabGroupWithUUID:v9 persist:1 usingBlock:&__block_literal_global_104];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

uint64_t __59__WBTabGroupManager_closeAllTabsInProfilesWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearTabs];
}

- (BOOL)isTab:(id)a3 childOfPinnedTabGroupOfNamedProfileOfUnnamedTabGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isNamed] & 1) != 0
    || ([v7 profileIdentifier],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:*MEMORY[0x263F66420]],
        v8,
        (v9 & 1) != 0))
  {
    BOOL v10 = 0;
  }
  else
  {
    tabCollection = self->_tabCollection;
    long long v12 = [v7 profileIdentifier];
    LODWORD(tabCollection) = [(WBTabCollection *)tabCollection pinnedTabsFolderIDForProfileWithIdentifier:v12];

    BOOL v10 = [v6 parentIdentifier] == tabCollection;
  }

  return v10;
}

- (NSString)defaultProfileIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F66420];
}

- (id)profileWithServerID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  profilesByIdentifier = self->_profilesByIdentifier;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__WBTabGroupManager_profileWithServerID___block_invoke;
  v9[3] = &unk_2643DC280;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSMutableDictionary *)profilesByIdentifier safari_valueOfEntryPassingTest:v9];
  os_unfair_lock_unlock(&profilesLock);

  return v7;
}

uint64_t __41__WBTabGroupManager_profileWithServerID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 serverID];
  uint64_t v4 = WBSIsEqual();

  return v4;
}

- (id)syncedRemoteCloudTabDevicesForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  uint64_t v5 = [(WBTabGroupManager *)self _remoteDevicesForProfileWithIdentifier:v4];

  os_unfair_lock_unlock(&profilesLock);
  return v5;
}

- (BOOL)closeTab:(id)a3 onDevice:(id)a4
{
  uint64_t v5 = [a3 uuidString];
  id v6 = [(WBTabGroupManager *)self _tabWithUUID:v5];

  id v7 = [v6 tabGroupUUID];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__WBTabGroupManager_closeTab_onDevice___block_invoke;
  v10[3] = &unk_2643D9B10;
  id v11 = v6;
  id v8 = v6;
  [(WBTabGroupManager *)self updateTabsInTabGroupWithUUID:v7 persist:1 usingBlock:v10];

  return 1;
}

void __39__WBTabGroupManager_closeTab_onDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);
}

- (BOOL)closeAllTabsOnDevice:(id)a3
{
  id v4 = [a3 tabs];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke;
  v12[3] = &unk_2643DC2A8;
  v12[4] = self;
  uint64_t v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v12);

  uint64_t v6 = [v5 count];
  if (v6)
  {
    id v7 = [v5 firstObject];
    id v8 = [v7 tabGroupUUID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke_2;
    v10[3] = &unk_2643D9B10;
    id v11 = v5;
    [(WBTabGroupManager *)self updateTabsInTabGroupWithUUID:v8 persist:1 usingBlock:v10];
  }
  return v6 != 0;
}

id __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuidString];
  id v4 = [v2 _tabWithUUID:v3];

  return v4;
}

uint64_t __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deleteTabs:*(void *)(a1 + 32)];
}

- (BOOL)cloudTabsAreEnabled
{
  return 1;
}

- (id)devicesForProfile:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  uint64_t v5 = [v4 identifier];

  uint64_t v6 = [(WBTabGroupManager *)self _devicesForProfileWithIdentifier:v5];

  os_unfair_lock_unlock(&profilesLock);
  return v6;
}

- (id)_devicesForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_devicesByUUID allValues];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__WBTabGroupManager__devicesForProfileWithIdentifier___block_invoke;
  v11[3] = &unk_2643DC2D0;
  id v12 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v11);

  id v8 = [(WBTabGroupManager *)self _itemSyncPositionComparator];
  char v9 = [v7 sortedArrayUsingComparator:v8];

  return v9;
}

uint64_t __54__WBTabGroupManager__devicesForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 profileIdentifier];
  uint64_t v3 = WBSIsEqual();

  return v3;
}

- (id)_remoteDevicesForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_devicesByUUID allValues];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__WBTabGroupManager__remoteDevicesForProfileWithIdentifier___block_invoke;
  v11[3] = &unk_2643DC2D0;
  id v12 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v11);

  id v8 = [(WBTabGroupManager *)self _itemSyncPositionComparator];
  char v9 = [v7 sortedArrayUsingComparator:v8];

  return v9;
}

BOOL __60__WBTabGroupManager__remoteDevicesForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 bookmark];
  if ([v3 subtype] == 4)
  {
    id v4 = [v2 profileIdentifier];
    if (WBSIsEqual())
    {
      uint64_t v5 = [v2 tabs];
      BOOL v6 = [v5 count] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_insertDevice:(id)a3 inProfile:(id)a4 completionHandler:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  os_unfair_lock_assert_owner(&profilesLock);
  id v11 = [(WBTabGroupManager *)self _generatePositionForDevice:v8 afterDevice:0];
  [v8 setSyncPosition:v11];

  devicesByUUID = self->_devicesByUUID;
  long long v13 = [v8 uuid];
  [(NSMutableDictionary *)devicesByUUID setObject:v8 forKeyedSubscript:v13];

  tabCollection = self->_tabCollection;
  v21[0] = v8;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke;
  v19[3] = &unk_2643DC2F8;
  v19[4] = self;
  id v20 = v9;
  id v16 = v9;
  [(WBTabCollection *)tabCollection insertItemsIntoPlace:v15 inParent:v10 completionHandler:v19];

  id v17 = v8;
  return v17;
}

void __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_2;
    block[3] = &unk_2643DC1F0;
    id v6 = *(id *)(a1 + 40);
    char v7 = a2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_3;
    v4[3] = &unk_2643D9B48;
    void v4[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_findOrCreateLocalDeviceForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBTabGroupManager *)self _findLocalDeviceForProfileWithIdentifier:v4];
  if (!v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_profilesByIdentifier objectForKeyedSubscript:v4];
    lastLocalDeviceNameSaved = self->_lastLocalDeviceNameSaved;
    long long v8 = [(WBSDevice *)self->_device userUniqueDeviceIdentifier];
    long long v9 = [(WBTabGroupManager *)self deviceIdentifier];
    long long v10 = +[WBDeviceParameters localDeviceWithTitle:lastLocalDeviceNameSaved creationDeviceIdentifier:v8 deviceIdentifier:v9];

    long long v11 = [(WBSDevice *)self->_device deviceTypeIdentifier];
    [v10 setDeviceTypeIdentifier:v11];

    id v12 = +[WBDevice deviceWithParameters:v10 unnamedTabGroups:MEMORY[0x263EFFA68] profileIdentifier:v4];
    uint64_t v5 = [(WBTabGroupManager *)self _insertDevice:v12 inProfile:v6 completionHandler:0];
  }
  return v5;
}

- (id)_findLocalDeviceForProfileWithIdentifier:(id)a3
{
  uint64_t v3 = [(WBTabGroupManager *)self _devicesForProfileWithIdentifier:a3];
  id v4 = objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_111);

  return v4;
}

uint64_t __62__WBTabGroupManager__findLocalDeviceForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRemoteDevice] ^ 1;
}

- (void)_didModifyUnnamedTabGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 deviceUUIDString];
  [(WBTabGroupManager *)self _didModifyUnnamedTabGroupInDeviceWithUUID:v5];

  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v6 = [v4 deviceUUIDString];
  char v7 = [(WBTabGroupManager *)self _unnamedTabGroupsForDeviceWithUUID:v6];

  long long v8 = [v7 firstObject];
  int v9 = [v4 isEqual:v8];

  if (v9)
  {
    os_unfair_lock_unlock(&tabGroupsLock);
  }
  else
  {
    long long v10 = [(WBTabGroupManager *)self _generatePositionForTabGroup:v4 afterTabGroup:0];
    [v4 setSyncPosition:v10];

    os_unfair_lock_unlock(&tabGroupsLock);
    tabCollection = self->_tabCollection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke;
    v12[3] = &unk_2643D9B90;
    v12[4] = self;
    [(WBTabCollection *)tabCollection reorderItemIntoPlace:v4 completionHandler:v12];
  }
}

void __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke_2;
    block[3] = &unk_2643D9B48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_didModifyUnnamedTabGroupInDeviceWithUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v5 = [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:v4];

  uint64_t v6 = [v5 profileIdentifier];
  char v7 = [(WBTabGroupManager *)self _devicesForProfileWithIdentifier:v6];

  long long v8 = [v7 firstObject];
  int v9 = [v5 isEqual:v8];

  if (v9)
  {
    os_unfair_lock_unlock(&tabGroupsLock);
  }
  else
  {
    long long v10 = [(WBTabGroupManager *)self _generatePositionForDevice:v5 afterDevice:0];
    [v5 setSyncPosition:v10];

    os_unfair_lock_unlock(&tabGroupsLock);
    tabCollection = self->_tabCollection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke;
    v12[3] = &unk_2643D9B90;
    v12[4] = self;
    [(WBTabCollection *)tabCollection reorderItemIntoPlace:v5 completionHandler:v12];
  }
}

void __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke_2;
    block[3] = &unk_2643D9B48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

uint64_t __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRemoteDevice] ^ 1;
}

- (BOOL)_didLocallyCreateUnnamedTabGroup:(id)a3
{
  deviceUUIDByTabGroupUUID = self->_deviceUUIDByTabGroupUUID;
  uint64_t v5 = [a3 uuid];
  uint64_t v6 = [(NSMutableDictionary *)deviceUUIDByTabGroupUUID objectForKeyedSubscript:v5];

  if (v6)
  {
    char v7 = [(NSMutableDictionary *)self->_devicesByUUID objectForKeyedSubscript:v6];
    long long v8 = v7;
    if (v7) {
      int v9 = [v7 isRemoteDevice] ^ 1;
    }
    else {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)updateTabWithUUID:(id)a3 persist:(BOOL)a4 notify:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  long long v11 = (void (**)(id, void *))a6;
  id v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    id v44 = v10;
    _os_log_impl(&dword_21C043000, v12, OS_LOG_TYPE_INFO, "Updating tabs with uuid %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v13 = [(WBTabGroupManager *)self _tabWithUUID:v10];
  long long v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      id v16 = v14;
      id v17 = [v13 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      id v44 = v17;
      _os_log_impl(&dword_21C043000, v16, OS_LOG_TYPE_INFO, "Updating tab %{public}@", buf, 0xCu);
    }
    v11[2](v11, v13);
    uint64_t v18 = [v13 tabGroupUUID];
    uint64_t v19 = [(WBTabGroupManager *)self _tabGroupWithUUID:v18];

    LODWORD(v18) = [v13 wasModified];
    char v20 = [v13 isSyncable];
    os_unfair_lock_unlock(&tabGroupsLock);
    if (v18)
    {
      if (v7)
      {
        char v32 = v20;
        long long v33 = v19;
        BOOL v34 = v8;
        id v35 = v10;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v21 = (void *)[(NSHashTable *)self->_observers copy];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v39 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                uint64_t v27 = [v13 uuid];
                [v26 tabGroupManager:self didUpdateTabWithUUID:v27 userDriven:1];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v23);
        }

        id v10 = v35;
        BOOL v8 = v34;
        uint64_t v19 = v33;
        char v20 = v32;
      }
      if (v8)
      {
        tabCollection = self->_tabCollection;
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke;
        v36[3] = &unk_2643DC340;
        char v37 = v20;
        v36[4] = self;
        [(WBTabCollection *)tabCollection saveItem:v13 completionHandler:v36];
        [v13 markClean];
        if (([v19 isNamed] & 1) == 0)
        {
          uint64_t v29 = [v19 deviceUUIDString];
          if (v29)
          {
            long long v30 = (void *)v29;
            int v31 = [MEMORY[0x263F662A0] isSafariProfilesEnabled];

            if (v31) {
              [(WBTabGroupManager *)self _didModifyUnnamedTabGroup:v19];
            }
          }
        }
      }
    }
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)long long buf = 138543362;
      id v44 = v10;
      _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_INFO, "Not updating tab with uuid %{public}@ because it does not exist.", buf, 0xCu);
    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }
}

void __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke_2;
    block[3] = &unk_2643D9B48;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)moveTabs:(id)a3 toTabGroup:(id)a4 afterTab:(id)a5 withoutPersistingTabGroupsWithUUIDStrings:(id)a6
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v44 = a4;
  id v41 = a5;
  id v42 = a6;
  long long v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = v10;
    uint64_t v12 = [v9 count];
    uint64_t v13 = [v44 privacyPreservingDescription];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v71 = v12;
    __int16 v72 = 2114;
    long long v73 = v13;
    _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_INFO, "Moving %zu tabs to tab group %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&reloadAfterSyncLock);
  long long v43 = [MEMORY[0x263EFF980] array];
  long long v48 = [MEMORY[0x263EFF9A0] dictionary];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v9;
  uint64_t v47 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v65;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v65 != v46) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v64 + 1) + 8 * v49);
        BOOL v15 = [v14 tabGroupUUID];
        BOOL v16 = v15 == 0;

        if (!v16)
        {
          id v17 = [v14 tabGroupUUID];
          uint64_t v18 = [v48 objectForKeyedSubscript:v17];
          uint64_t v19 = v18;
          if (v18)
          {
            id v20 = v18;
          }
          else
          {
            id v20 = [MEMORY[0x263EFF980] array];
          }
          id v25 = v20;

          [v25 addObject:v14];
          [v48 setObject:v25 forKeyedSubscript:v17];
LABEL_26:

          goto LABEL_27;
        }
        uint64_t v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_21C043000, v21, OS_LOG_TYPE_INFO, "Moving tab with no tab group", buf, 2u);
        }
        int v22 = [v14 isSyncable];
        if (v22 != [v44 isSyncable])
        {
          uint64_t v23 = [WBMutableTab alloc];
          uint64_t v24 = [v14 deviceIdentifier];
          id v17 = [(WBTab *)v23 initWithUUID:0 deviceIdentifier:v24];

          [(WBMutableTab *)v17 adoptAttributesFromTab:v14];
          [v43 addObject:v17];
          long long v62 = 0u;
          long long v63 = 0u;
          long long v61 = 0u;
          long long v60 = 0u;
          id v25 = (void *)[(NSHashTable *)self->_observers copy];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v61;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v61 != v27) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v29 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  long long v30 = [v14 uuid];
                  int v31 = [(WBTab *)v17 uuid];
                  [v29 tabGroupManager:self willReplaceTabWithUUID:v30 withTabWithUUID:v31];
                }
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v68 count:16];
            }
            while (v26);
          }
          goto LABEL_26;
        }
        id v17 = (WBMutableTab *)[v14 mutableCopy];
        [v43 addObject:v17];
LABEL_27:

        ++v49;
      }
      while (v49 != v47);
      uint64_t v32 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
      uint64_t v47 = v32;
    }
    while (v32);
  }

  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke;
  v55[3] = &unk_2643DC390;
  id v33 = v42;
  id v56 = v33;
  id v34 = v44;
  id v57 = v34;
  uint64_t v58 = self;
  id v35 = v43;
  id v59 = v35;
  [v48 enumerateKeysAndObjectsUsingBlock:v55];
  id v36 = [v34 uuid];
  int v37 = [v33 containsObject:v36];

  long long v38 = [v34 uuid];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_3;
  v51[3] = &unk_2643DC3B8;
  id v39 = v35;
  id v52 = v39;
  id v53 = self;
  id v40 = v41;
  id v54 = v40;
  [(WBTabGroupManager *)self updateTabsInTabGroupWithUUID:v38 persist:v37 ^ 1u usingBlock:v51];

  os_unfair_lock_unlock(&reloadAfterSyncLock);
}

void __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  int v8 = [v6 containsObject:v7];
  id v9 = [*(id *)(a1 + 40) uuid];
  int v10 = [v7 isEqualToString:v9];

  uint64_t v11 = 2;
  if (!v10) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11 | v8 ^ 1u;
  uint64_t v13 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_2;
  v17[3] = &unk_2643DC368;
  id v18 = v5;
  int8x16_t v16 = *(int8x16_t *)(a1 + 40);
  id v14 = (id)v16.i64[0];
  int8x16_t v19 = vextq_s8(v16, v16, 8uLL);
  id v20 = *(id *)(a1 + 56);
  id v15 = v5;
  [v13 updateTabsInTabGroupWithUUID:v7 options:v12 usingBlock:v17];
}

void __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v6 = *(void **)(a1 + 40);
        id v7 = [v5 uuid];
        int v8 = [v6 _tabWithUUID:v7];

        int v9 = [v3 isSyncable];
        int v10 = [*(id *)(a1 + 48) isSyncable];
        uint64_t v11 = [v3 profileIdentifier];
        uint64_t v12 = [*(id *)(a1 + 48) profileIdentifier];
        int v13 = WBSIsEqual();

        if (v9 == v10 && v13)
        {
          [v3 removeTab:v8];
          [*(id *)(a1 + 56) addObject:v8];
        }
        else
        {
          uint64_t v26 = v8;
          id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
          [v3 deleteTabs:v14];

          id v15 = [WBMutableTab alloc];
          int8x16_t v16 = [v5 uuid];
          id v17 = [v5 deviceIdentifier];
          id v18 = [(WBTab *)v15 initWithUUID:v16 deviceIdentifier:v17];

          [(WBMutableTab *)v18 adoptAttributesFromTab:v5];
          [*(id *)(a1 + 56) addObject:v18];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v21);
  }
}

void __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_3(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  id v3 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  id v5 = a2;
  id v7 = [v4 uuid];
  uint64_t v6 = [v3 _tabWithUUID:v7];
  [v5 insertTabs:v2 afterTab:v6];
}

- (void)flushDeletedTabsInTabGroup:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&tabGroupsLock);
  id v5 = [v4 deletedTabs];
  [(WBTabGroupManager *)self _willFlushDeletedTabs:v5 inTabGroup:v4];
  [(WBTabCollection *)self->_tabCollection flushDeletedTabsInTabGroup:v4 completionHandler:0];
}

- (void)registerPinnedTab:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  id v5 = (void *)[v4 mutableCopy];
  localTabsByUUID = self->_localTabsByUUID;
  id v7 = [v4 uuid];

  [(NSMutableDictionary *)localTabsByUUID setObject:v5 forKeyedSubscript:v7];
  os_unfair_lock_unlock(&tabGroupsLock);
}

- (int)pinnedTabsFolderID
{
  return [(WBTabCollection *)self->_tabCollection pinnedTabsFolderID];
}

- (int)privatePinnedTabsFolderID
{
  return [(WBTabCollection *)self->_tabCollection privatePinnedTabsFolderID];
}

- (unint64_t)maximumTabsPerGroup
{
  return [(WBTabCollection *)self->_tabCollection maximumTabsPerGroup];
}

- (void)setMaximumTabsPerGroup:(unint64_t)a3
{
}

- (id)tabsForTabGroup:(id)a3
{
  return [(WBTabCollection *)self->_tabCollection tabsForTabGroup:a3];
}

- (BOOL)isPersistent
{
  return [(WBTabCollection *)self->_tabCollection isPersistent];
}

- (WBBrowserState)lastSessionBrowserState
{
  return [(WBTabCollection *)self->_tabCollection lastSessionBrowserState];
}

- (NSArray)windowStates
{
  return [(WBTabCollection *)self->_tabCollection windowStates];
}

- (id)windowStateWithUUID:(id)a3
{
  return [(WBTabCollection *)self->_tabCollection windowStateWithUUID:a3];
}

- (id)positionGenerator:(id)a3 positionForRecordName:(id)a4
{
  id v4 = [(WBTabGroupManager *)self _tabWithUUID:a4];
  id v5 = [v4 syncPosition];

  return v5;
}

- (id)positionGenerator:(id)a3 recordNameOfBookmarksBeforeRecordWithName:(id)a4
{
  id v5 = [(WBTabGroupManager *)self _tabWithUUID:a4];
  uint64_t v6 = [v5 tabGroupUUID];
  id v7 = [(WBTabGroupManager *)self _tabGroupWithUUID:v6];

  int v8 = [v7 tabs];
  int v9 = objc_msgSend(v8, "safari_objectBefore:", v5);
  int v10 = [v9 uuid];

  return v10;
}

- (id)positionGenerator:(id)a3 recordNameOfBookmarksAfterRecordWithName:(id)a4
{
  id v5 = [(WBTabGroupManager *)self _tabWithUUID:a4];
  uint64_t v6 = [v5 tabGroupUUID];
  id v7 = [(WBTabGroupManager *)self _tabGroupWithUUID:v6];

  int v8 = [v7 tabs];
  int v9 = objc_msgSend(v8, "safari_objectAfter:", v5);
  int v10 = [v9 uuid];

  return v10;
}

- (id)topScopedBookmarkListForTabGroup:(id)a3
{
  tabCollection = self->_tabCollection;
  id v5 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  uint64_t v6 = [v5 uuid];

  id v7 = [(WBTabGroupManager *)self tabGroupWithUUID:v6];

  os_unfair_lock_unlock(&tabGroupsLock);
  int v8 = [(WBTabCollection *)tabCollection topScopedBookmarkListForTabGroup:v7];

  return v8;
}

- (id)scopedBookmarkListWithID:(int)a3 filteredUsingString:(id)a4
{
  return [(WBTabCollection *)self->_tabCollection scopedBookmarkListWithID:*(void *)&a3 filteredUsingString:a4];
}

- (void)insertScopedBookmark:(id)a3 inScopedBookmarkFolderWithID:(int)a4 afterBookmarkWithUUID:(id)a5 notify:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  if ([v10 subtype] == 1)
  {
    uint64_t v12 = [(WBTabCollection *)self->_tabCollection scopedBookmarkWithUUID:v11];
    tabCollection = self->_tabCollection;
    v24[0] = v10;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    LOBYTE(tabCollection) = [(WBTabCollection *)tabCollection insertItems:v14 inParentWithID:v8 afterItem:v12];

    if ((tabCollection & 1) == 0)
    {
      id v15 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[WBTabGroupManager insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:](v12, v8, v15);
      }
    }
    if (v6) {
      [(WBTabGroupManager *)self _notifyScopedBookmarkChangesInFolderWithID:v8];
    }
  }
  else
  {
    int8x16_t v16 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[WBTabGroupManager insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)reorderScopedBookmarkWithUUID:(id)a3 afterBookmarkWithUUID:(id)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  int v9 = [(WBTabCollection *)self->_tabCollection scopedBookmarkWithUUID:a3];
  if (v9)
  {
    uint64_t v10 = [(WBTabCollection *)self->_tabCollection scopedBookmarkWithUUID:v8];
    id v11 = (void *)v10;
    if (!v8 || v10)
    {
      if (![(WBTabCollection *)self->_tabCollection reorderItem:v9 afterItem:v10])
      {
        uint64_t v12 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = [v9 identifier];
          if (v11) {
            int v14 = [v11 identifier];
          }
          else {
            int v14 = -1;
          }
          v15[0] = 67109376;
          v15[1] = v13;
          __int16 v16 = 1024;
          int v17 = v14;
          _os_log_error_impl(&dword_21C043000, v12, OS_LOG_TYPE_ERROR, "Failed to reorder scoped bookmark(%d) behind anchor(%d).", (uint8_t *)v15, 0xEu);
        }
      }
      if (v5) {
        -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](self, "_notifyScopedBookmarkChangesInFolderWithID:", [v9 parentID]);
      }
    }
  }
}

- (void)updateScopedBookmarkWithUUID:(id)a3 title:(id)a4 address:(id)a5 notify:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(WBTabCollection *)self->_tabCollection scopedBookmarkWithUUID:a3];
  int v13 = v12;
  if (v12)
  {
    [v12 setTitle:v10];
    [v13 setAddress:v11];
    if (![(WBTabCollection *)self->_tabCollection saveItem:v13])
    {
      int v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[WBTabGroupManager updateScopedBookmarkWithUUID:title:address:notify:](v14, v13);
        if (!v6) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
    }
    if (v6) {
LABEL_5:
    }
      -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](self, "_notifyScopedBookmarkChangesInFolderWithID:", [v13 parentID]);
  }
LABEL_6:
}

- (void)deleteScopedBookmarkWithUUID:(id)a3 notify:(BOOL)a4
{
}

- (void)deleteScopedBookmarkWithUUID:(id)a3 notify:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void))a5;
  uint64_t v9 = [(WBTabCollection *)self->_tabCollection scopedBookmarkWithUUID:a3];
  id v10 = (void *)v9;
  if (!v9)
  {
    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  tabCollection = self->_tabCollection;
  v16[0] = v9;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  BOOL v13 = [(WBTabCollection *)tabCollection deleteItems:v12 leaveTombstones:1];

  if (!v13)
  {
    int v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (!v8) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    -[WBTabGroupManager deleteScopedBookmarkWithUUID:notify:completionHandler:](v14, v10);
    if (v8) {
LABEL_5:
    }
      v8[2](v8, 0);
  }
LABEL_6:
  if (v5) {
    -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](self, "_notifyScopedBookmarkChangesInFolderWithID:", [v10 parentID]);
  }
  char v15 = !v13;
  if (!v8) {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
LABEL_11:
  }
    v8[2](v8, 1);
LABEL_12:
}

- (void)_notifyScopedBookmarkChangesInFolderWithID:(int)a3
{
  BOOL v5 = -[WBTabCollection scopedBookmarkListWithID:](self->_tabCollection, "scopedBookmarkListWithID:");
  BOOL v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__WBTabGroupManager__notifyScopedBookmarkChangesInFolderWithID___block_invoke;
    v8[3] = &unk_2643D9CF8;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](a3, v7);
    }
  }
}

void __64__WBTabGroupManager__notifyScopedBookmarkChangesInFolderWithID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManager:*(void *)(a1 + 32) didUpdateScopedBookmarkList:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 tabGroupManagerDidUpdateSyncableContent:*(void *)(a1 + 32)];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

- (id)shareRecordForTabGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 isSyncable])
  {
    uint64_t v6 = [(WBTabCollection *)self->_tabCollection shareRecordForTabGroup:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)acceptTabGroupShareWithMetadata:(id)a3 handler:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "safari_supportsSharedTabGroups"))
  {
    id v8 = [v6 share];
    uint64_t v9 = [v8 recordID];
    [(WBSPair *)self->_currentShareAcceptancePair second];
    uint64_t v11 = v10 = self;
    uint64_t v12 = [v11 share];
    BOOL v13 = [v12 recordID];
    int v14 = [v9 isEqual:v13];

    long long v50 = v10;
    if (v14)
    {
      long long v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = v15;
        long long v48 = [v8 recordID];
        uint64_t v46 = [v48 zoneID];
        long long v17 = [v46 ckShortDescription];
        long long v18 = [v8 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
        long long v19 = [v8 objectForKeyedSubscript:*MEMORY[0x263EFD530]];
        long long v20 = [v6 ownerIdentity];
        long long v21 = objc_msgSend(v20, "safari_handle");
        *(_DWORD *)long long buf = 138544131;
        id v57 = v17;
        __int16 v58 = 2114;
        id v59 = v18;
        __int16 v60 = 2117;
        long long v61 = v19;
        __int16 v62 = 2117;
        long long v63 = v21;
        _os_log_impl(&dword_21C043000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring accept CloudKit share metadata because it is already being processed, with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);
      }
      [(WBTabGroupManager *)v10 _sendAcceptanceResult:1 forShareMetadata:v6 toHandler:v7];
    }
    else
    {
      id v47 = v7;
      uint64_t v49 = v6;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v22 = v10->_pendingShareAcceptancePairQueue;
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v52 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v28 = [v8 recordID];
            uint64_t v29 = [v27 second];
            long long v30 = [v29 share];
            int v31 = [v30 recordID];
            int v32 = [v28 isEqual:v31];

            if (v32)
            {
              int v37 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              id v6 = v49;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                long long v38 = v37;
                id v39 = [v8 recordID];
                uint64_t v45 = [v39 zoneID];
                id v40 = [v45 ckShortDescription];
                id v41 = [v8 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
                id v42 = [v8 objectForKeyedSubscript:*MEMORY[0x263EFD530]];
                long long v43 = [v49 ownerIdentity];
                id v44 = objc_msgSend(v43, "safari_handle");
                *(_DWORD *)long long buf = 138544131;
                id v57 = v40;
                __int16 v58 = 2114;
                id v59 = v41;
                __int16 v60 = 2117;
                long long v61 = v42;
                __int16 v62 = 2117;
                long long v63 = v44;
                _os_log_impl(&dword_21C043000, v38, OS_LOG_TYPE_DEFAULT, "Ignoring accept CloudKit share metadata because it is already pending processing, with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);
              }
              id v7 = v47;
              [(WBTabGroupManager *)v50 _sendAcceptanceResult:1 forShareMetadata:v49 toHandler:v47];

              goto LABEL_21;
            }
          }
          uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v51 objects:v55 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      pendingShareAcceptancePairQueue = v50->_pendingShareAcceptancePairQueue;
      if (!pendingShareAcceptancePairQueue)
      {
        uint64_t v34 = [MEMORY[0x263EFF980] array];
        id v35 = v50->_pendingShareAcceptancePairQueue;
        v50->_pendingShareAcceptancePairQueue = (NSMutableArray *)v34;

        pendingShareAcceptancePairQueue = v50->_pendingShareAcceptancePairQueue;
      }
      id v7 = v47;
      id v6 = v49;
      id v36 = (void *)[objc_alloc(MEMORY[0x263F662E0]) initWithFirst:v47 second:v49];
      [(NSMutableArray *)pendingShareAcceptancePairQueue addObject:v36];

      [(WBTabGroupManager *)v50 _dequeueNextAcceptCloudKitShareMetadataIfNeeded];
    }
LABEL_21:
  }
  else
  {
    [(WBTabGroupManager *)self _sendAcceptanceResult:3 forShareMetadata:v6 toHandler:v7];
  }
}

- (void)_dequeueNextAcceptCloudKitShareMetadataIfNeeded
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  p_currentShareAcceptancePair = &self->_currentShareAcceptancePair;
  if (!self->_currentShareAcceptancePair)
  {
    id v4 = [(NSMutableArray *)self->_pendingShareAcceptancePairQueue firstObject];
    if (v4)
    {
      [(NSMutableArray *)self->_pendingShareAcceptancePairQueue removeObjectAtIndex:0];
      objc_storeStrong((id *)p_currentShareAcceptancePair, v4);
      uint64_t v5 = [v4 second];
      id v6 = [v5 share];
      id v7 = [(WBTabGroupManager *)self tabGroupMatchingShare:v6];

      id v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          uint64_t v10 = v8;
          int v32 = [v6 recordID];
          long long v30 = [v32 zoneID];
          [v30 ckShortDescription];
          v12 = uint64_t v11 = v6;
          BOOL v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
          int v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFD530]];
          long long v15 = [v5 ownerIdentity];
          long long v16 = objc_msgSend(v15, "safari_handle");
          *(_DWORD *)long long buf = 138544131;
          id v44 = v12;
          __int16 v45 = 2114;
          uint64_t v46 = v13;
          __int16 v47 = 2117;
          long long v48 = v14;
          __int16 v49 = 2117;
          long long v50 = v16;
          _os_log_impl(&dword_21C043000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring accept CloudKit share metadata because it was already accepted, with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);

          id v6 = v11;
        }
        long long v17 = [v4 first];
        [(WBTabGroupManager *)self _sendAcceptanceResult:2 forShareMetadata:v5 toHandler:v17];

        currentShareAcceptancePair = self->_currentShareAcceptancePair;
        self->_currentShareAcceptancePair = 0;

        [(WBTabGroupManager *)self _dequeueNextAcceptCloudKitShareMetadataIfNeeded];
      }
      else
      {
        if (v9)
        {
          long long v19 = v8;
          id v33 = [v6 recordID];
          int v31 = [v33 zoneID];
          long long v20 = [v31 ckShortDescription];
          long long v21 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
          uint64_t v22 = [v6 objectForKeyedSubscript:*MEMORY[0x263EFD530]];
          uint64_t v23 = [v5 ownerIdentity];
          uint64_t v24 = objc_msgSend(v23, "safari_handle");
          *(_DWORD *)long long buf = 138544131;
          id v44 = v20;
          __int16 v45 = 2114;
          uint64_t v46 = v21;
          __int16 v47 = 2117;
          long long v48 = v22;
          __int16 v49 = 2117;
          long long v50 = v24;
          _os_log_impl(&dword_21C043000, v19, OS_LOG_TYPE_DEFAULT, "Will accept CloudKit Share metadata with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);
        }
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke;
        v39[3] = &unk_2643DC3E0;
        id v25 = v5;
        id v40 = v25;
        id v41 = self;
        id v26 = v4;
        id v42 = v26;
        uint64_t v27 = (void *)MEMORY[0x21D4A1230](v39);
        uint64_t v28 = [v26 first];
        uint64_t v29 = [(WBTabGroupManager *)self profiles];
        if (unint64_t)[v29 count] >= 2 && (objc_opt_respondsToSelector())
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke_133;
          v34[3] = &unk_2643DC408;
          void v34[4] = self;
          id v35 = v6;
          id v36 = v28;
          id v37 = v25;
          id v38 = v27;
          [v36 tabGroupManager:self selectProfileIdentifierForShareMetadata:v37 completionHandler:v34];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v28 tabGroupManager:self didBeginAcceptingTabGroupShareWithMetadata:v25];
          }
          [(WBTabGroupManager *)self _userDidAcceptTabGroupShareWithMetadata:v25 inProfileWithIdentifier:*MEMORY[0x263F66420] completionHandler:v27];
        }
      }
    }
  }
}

void __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v8;
      id v33 = [v5 recordID];
      int v31 = [v33 zoneID];
      id v25 = [v31 ckShortDescription];
      id v26 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
      uint64_t v27 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFD530]];
      uint64_t v28 = [a1[4] ownerIdentity];
      uint64_t v29 = objc_msgSend(v28, "safari_handle");
      long long v30 = objc_msgSend(v6, "safari_privacyPreservingError");
      *(_DWORD *)long long buf = 138544387;
      id v35 = v25;
      __int16 v36 = 2114;
      id v37 = v26;
      __int16 v38 = 2117;
      id v39 = v27;
      __int16 v40 = 2117;
      id v41 = v29;
      __int16 v42 = 2114;
      long long v43 = v30;
      _os_log_error_impl(&dword_21C043000, v24, OS_LOG_TYPE_ERROR, "Did fail to accept CloudKit Share metadata with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@, error: %{public}@", buf, 0x34u);
    }
    id v10 = a1[4];
    id v9 = a1[5];
    uint64_t v11 = [a1[6] first];
    uint64_t v12 = v9;
    uint64_t v13 = 4;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = v8;
      int v32 = [v5 recordID];
      long long v15 = [v32 zoneID];
      long long v16 = [v15 ckShortDescription];
      long long v17 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFD538]];
      long long v18 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFD530]];
      long long v19 = [a1[4] ownerIdentity];
      long long v20 = objc_msgSend(v19, "safari_handle");
      *(_DWORD *)long long buf = 138544131;
      id v35 = v16;
      __int16 v36 = 2114;
      id v37 = v17;
      __int16 v38 = 2117;
      id v39 = v18;
      __int16 v40 = 2117;
      id v41 = v20;
      _os_log_impl(&dword_21C043000, v14, OS_LOG_TYPE_DEFAULT, "Did accept CloudKit Share metadata with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);
    }
    id v10 = a1[4];
    id v21 = a1[5];
    uint64_t v11 = [a1[6] first];
    uint64_t v12 = v21;
    uint64_t v13 = 0;
  }
  [v12 _sendAcceptanceResult:v13 forShareMetadata:v10 toHandler:v11];

  uint64_t v22 = a1[5];
  uint64_t v23 = (void *)v22[22];
  v22[22] = 0;

  [a1[5] _dequeueNextAcceptCloudKitShareMetadataIfNeeded];
}

void __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v6 = *(void **)(a1 + 40);
      id v7 = v4;
      id v8 = [v6 recordID];
      id v9 = [v8 zoneID];
      id v10 = [v9 ckShortDescription];
      int v13 = 138543618;
      int v14 = v10;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Will accept tab group share with zone %{public}@, in profile with UUID: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 48) tabGroupManager:*(void *)(a1 + 32) didBeginAcceptingTabGroupShareWithMetadata:*(void *)(a1 + 56)];
    }
    [*(id *)(a1 + 32) _userDidAcceptTabGroupShareWithMetadata:*(void *)(a1 + 56) inProfileWithIdentifier:v3 completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    if (v5)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21C043000, v4, OS_LOG_TYPE_INFO, "Did cancel accepting tab group share by cancelling profile selection", (uint8_t *)&v13, 2u);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 176);
    *(void *)(v11 + 176) = 0;

    [*(id *)(a1 + 32) _dequeueNextAcceptCloudKitShareMetadataIfNeeded];
  }
}

- (void)_sendAcceptanceResult:(int64_t)a3 forShareMetadata:(id)a4 toHandler:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if (objc_opt_respondsToSelector()) {
    [v8 tabGroupManager:self didFinishAcceptingTabGroupShareWithMetadata:v9 result:a3];
  }
}

- (void)_userDidAcceptTabGroupShareWithMetadata:(id)a3 inProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_2643DC458;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = a4;
  int v13 = (void *)MEMORY[0x21D4A1230](v14);
  [(WBTabGroupSyncAgentProtocol *)self->_syncAgentProxy userDidAcceptTabGroupShareWithMetadata:v11 inProfileWithIdentifier:v12 completionHandler:v13];
}

void __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_2643DC430;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = (void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = *(void **)(*(void *)(a1 + 40) + 248);
    id v5 = [v2 recordID];
    id v6 = [v5 zoneID];
    uint64_t v7 = objc_msgSend(v6, "safari_tabGroupRootRecordName");
    id v8 = [v4 tabGroupUUIDForServerID:v7];

    uint64_t v9 = [v8 length];
    id v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *v3;
        uint64_t v13 = v11;
        id v14 = [v12 recordID];
        id v15 = [v14 zoneID];
        id v16 = [v15 ckShortDescription];
        int v19 = 138543618;
        long long v20 = v16;
        __int16 v21 = 2114;
        uint64_t v22 = v8;
        _os_log_impl(&dword_21C043000, v13, OS_LOG_TYPE_DEFAULT, "Did successfully join share %{public}@ with tab group UUID: %{public}@", (uint8_t *)&v19, 0x16u);
      }
      [*(id *)(a1 + 40) _didReceiveShare:*(void *)(a1 + 32) forTabGroupUUID:v8];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_2((uint64_t)v3, v11);
    }
  }
  else
  {
    uint64_t v17 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_1(a1, v17);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)beginSharingTabGroupWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  syncAgentProxy = self->_syncAgentProxy;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke;
  v11[3] = &unk_2643DC458;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(WBTabGroupSyncAgentProtocol *)syncAgentProxy beginSharingTabGroupWithUUID:v10 completionHandler:v11];
}

void __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2;
  block[3] = &unk_2643DC430;
  id v13 = v5;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v6;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = v4;
      uint64_t v8 = [v5 recordID];
      id v9 = [v8 zoneID];
      id v10 = [v9 ckShortDescription];
      int v12 = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_DEFAULT, "Did successfully begin sharing tab group with UUID: %{public}@, share: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 48) _didReceiveShare:*(void *)(a1 + 32) forTabGroupUUID:*(void *)(a1 + 40)];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2_cold_1(a1, v4);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)shareRecordForTabGroup:(id)a3 completionHandler:(id)a4
{
}

- (id)tabGroupMatchingShare:(id)a3
{
  tabCollection = self->_tabCollection;
  id v5 = a3;
  uint64_t v6 = [(WBTabGroupManager *)self allNamedTabGroupsUnsorted];
  id v7 = [(WBTabCollection *)tabCollection tabGroupMatchingShare:v5 inTabGroups:v6];

  return v7;
}

- (void)getActiveParticipantsInTabGroup:(id)a3 completionHandler:(id)a4
{
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    presenceCoordinator = self->_presenceCoordinator;
    id v7 = a4;
    id v12 = [a3 bookmark];
    uint64_t v8 = [v12 serverID];
    [(WBParticipantPresenceCoordinator *)presenceCoordinator getActiveParticipantsInTabGroupWithIdentifier:v8 completionHandler:v7];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFFA08];
    tabCollection = self->_tabCollection;
    id v11 = a4;
    id v12 = [(WBTabCollection *)tabCollection activeParticipantsInTabGroup:a3];
    uint64_t v8 = objc_msgSend(v9, "setWithArray:");
    (*((void (**)(id, void *))a4 + 2))(v11, v8);
  }
}

- (void)getPresenceTabUUIDForParticipantIdentifier:(id)a3 inTabGroup:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    presenceCoordinator = self->_presenceCoordinator;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __93__WBTabGroupManager_getPresenceTabUUIDForParticipantIdentifier_inTabGroup_completionHandler___block_invoke;
    v12[3] = &unk_2643DC480;
    id v13 = v8;
    __int16 v14 = self;
    id v15 = v9;
    [(WBParticipantPresenceCoordinator *)presenceCoordinator getCurrentLocationIdentifiersForParticipantIdentifier:a3 completionHandler:v12];
  }
  else
  {
    id v11 = [(WBTabCollection *)self->_tabCollection presenceTabUUIDForParticipantIdentifier:a3 inTabGroup:v8];
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }
}

void __93__WBTabGroupManager_getPresenceTabUUIDForParticipantIdentifier_inTabGroup_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = (void *)a1[4];
  id v6 = a2;
  id v7 = [v5 bookmark];
  id v8 = [v7 serverID];
  char v9 = WBSIsEqual();

  uint64_t v10 = a1[6];
  if (v9)
  {
    id v11 = [*(id *)(a1[5] + 248) tabUUIDForServerID:v12];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 16))(a1[6], 0);
  }
}

- (id)_unsafeTabGroupUUIDsToCKShares
{
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    os_unfair_lock_assert_owner(&tabGroupsLock);
    id v3 = [(NSMutableDictionary *)self->_syncableTabGroupsByUUID safari_mapAndFilterKeysAndObjectsUsingBlock:&__block_literal_global_140];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA78];
  }
  return v3;
}

id __51__WBTabGroupManager__unsafeTabGroupUUIDsToCKShares__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v5 isNamed])
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = __Block_byref_object_copy__7;
    __int16 v14 = __Block_byref_object_dispose__7;
    id v15 = 0;
    id v6 = [v5 bookmark];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__WBTabGroupManager__unsafeTabGroupUUIDsToCKShares__block_invoke_2;
    v9[3] = &unk_2643DC4C8;
    void v9[4] = &v10;
    [v6 getReadOnlyCachedBookmarkSyncDataUsingBlock:v9];

    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __51__WBTabGroupManager__unsafeTabGroupUUIDsToCKShares__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 shareRecord];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

void __43__WBTabGroupManager__updateTabGroupShares___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 232) objectForKeyedSubscript:v11];

  if (!v6)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 208) containsObject:v11])
    {
      [*(id *)(*(void *)(a1 + 32) + 232) setObject:v5 forKeyedSubscript:v11];
      [*(id *)(*(void *)(a1 + 32) + 192) beginCollaborationForShare:v5];
      id v7 = [*(id *)(*(void *)(a1 + 32) + 216) first];
      int v8 = [v7 isEqualToString:v11];

      if (v8)
      {
        char v9 = *(id **)(a1 + 32);
        uint64_t v10 = [v9[27] second];
        [v9 _movePresenceForParticipantToTabWithUUID:v10];
      }
    }
  }
}

- (void)_didReceiveShare:(id)a3 forTabGroupUUID:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->_enableSharedTabGroupsFastSyncPresence)
  {
    int v8 = [(NSDictionary *)self->_tabGroupUUIDsToCKShares objectForKeyedSubscript:v7];
    char v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 recordChangeTag];
      id v11 = [v6 recordChangeTag];
      char v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare setObject:v6 forKeyedSubscript:v7];
        [(WBParticipantPresenceCoordinator *)self->_presenceCoordinator shareDidUpdate:v6];
      }
    }
    else
    {
      tabGroupUUIDsToCKShares = self->_tabGroupUUIDsToCKShares;
      id v20 = v7;
      v21[0] = v6;
      __int16 v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v15 = [(NSDictionary *)tabGroupUUIDsToCKShares safari_dictionaryByMergingWithDictionary:v14];
      uint64_t v16 = self->_tabGroupUUIDsToCKShares;
      self->_tabGroupUUIDsToCKShares = v15;

      if ([(NSCountedSet *)self->_activeTabGroupUUIDs containsObject:v7])
      {
        [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare setObject:v6 forKeyedSubscript:v7];
        [(WBParticipantPresenceCoordinator *)self->_presenceCoordinator beginCollaborationForShare:v6];
        id v17 = [(WBSPair *)self->_activeTabGroupAndTabUUIDPair first];
        int v18 = [v17 isEqualToString:v7];

        if (v18)
        {
          int v19 = [(WBSPair *)self->_activeTabGroupAndTabUUIDPair second];
          [(WBTabGroupManager *)self _movePresenceForParticipantToTabWithUUID:v19];
        }
      }
    }
  }
}

- (void)beginParticipantPresenceReportingForTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    id v8 = v4;
    id v6 = [(WBTabGroupManager *)self tabGroupWithUUID:v4];
    if (v6)
    {
      [(NSCountedSet *)self->_activeTabGroupUUIDs addObject:v8];
      id v7 = [(WBTabGroupManager *)self _shareRecordIfNeededToBeginCollaborationForTabGroup:v6];
      if (v7)
      {
        [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare setObject:v7 forKeyedSubscript:v8];
        [(WBParticipantPresenceCoordinator *)self->_presenceCoordinator beginCollaborationForShare:v7];
      }
    }
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)_shareRecordIfNeededToBeginCollaborationForTabGroup:(id)a3
{
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    id v4 = [a3 uuid];
    if ([(NSCountedSet *)self->_activeTabGroupUUIDs containsObject:v4]
      && ([(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare objectForKeyedSubscript:v4], id v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
    {
      id v6 = [(NSDictionary *)self->_tabGroupUUIDsToCKShares objectForKeyedSubscript:v4];
      [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare setObject:v6 forKeyedSubscript:v4];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)endParticipantPresenceReportingForTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    id v8 = v4;
    id v6 = [(WBTabGroupManager *)self tabGroupWithUUID:v4];
    if (v6)
    {
      [(NSCountedSet *)self->_activeTabGroupUUIDs removeObject:v8];
      id v7 = [(WBTabGroupManager *)self _shareRecordIfNeededToEndCollaborationForTabGroup:v6];
      if (v7)
      {
        [(WBParticipantPresenceCoordinator *)self->_presenceCoordinator endCollaborationForShare:v7];
        [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare setObject:0 forKeyedSubscript:v8];
      }
    }
    id v5 = v8;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)_shareRecordIfNeededToEndCollaborationForTabGroup:(id)a3
{
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    id v4 = [a3 uuid];
    id v5 = [(NSMutableDictionary *)self->_broadcastingTabGroupUUIDsToCKShare objectForKeyedSubscript:v4];
    if (v5 && ([(NSCountedSet *)self->_activeTabGroupUUIDs containsObject:v4] & 1) == 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)disableDevicePresenceReporting
{
  --self->_numberOfDevicePresenceReportingRequests;
  [(WBTabGroupManager *)self _endDevicePresenceReportingIfNeeded];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_DEFAULT, "Did end device presence reporting", v3, 2u);
  }
}

- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3
{
}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabGroupWithIdentifier:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [(WBTabCollection *)self->_tabCollection tabGroupUUIDForServerID:a5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v9 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 tabGroupManager:self didUpadateActiveParticipants:v7 inTabGroupWithUUID:v8];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabWithIdentifier:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [(WBTabCollection *)self->_tabCollection tabUUIDForServerID:a5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v9 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 tabGroupManager:self didUpadateActiveParticipants:v7 inTabWithUUID:v8];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)shareDidUpdateForTabGroupWithUUID:(id)a3
{
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    id v4 = a3;
    id v6 = [(WBTabGroupManager *)self tabGroupWithUUID:v4];
    id v5 = [(WBTabGroupManager *)self shareRecordForTabGroup:v6];
    [(WBTabGroupManager *)self _didReceiveShare:v5 forTabGroupUUID:v4];
  }
}

- (void)activeParticipantsDidUpdateInTabGroupWithUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_enableSharedTabGroupsFastSyncPresence)
  {
    tabCollection = self->_tabCollection;
    id v6 = [(WBTabGroupManager *)self tabGroupWithUUID:v4];
    id v7 = [(WBTabCollection *)tabCollection activeParticipantsInTabGroup:v6];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            __int16 v14 = [MEMORY[0x263EFFA08] setWithArray:v7];
            [v13 tabGroupManager:self didUpadateActiveParticipants:v14 inTabGroupWithUUID:v4];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)activeParticipantsDidUpdateInTabWithUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_enableSharedTabGroupsFastSyncPresence)
  {
    tabCollection = self->_tabCollection;
    id v6 = [(WBTabGroupManager *)self tabWithUUID:v4];
    id v7 = [(WBTabCollection *)tabCollection activeParticipantsInTab:v6];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v13 tabGroupManager:self didUpadateActiveParticipants:v7 inTabWithUUID:v4];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)_tabGroupSyncDidFinish:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "Tab group sync did finish", buf, 2u);
  }
  id v6 = [v4 userInfo];
  id v7 = objc_msgSend(v6, "safari_numberForKey:", @"syncResult");

  uint64_t v8 = [v7 integerValue];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    [(WBTabGroupManager *)self syncDidFinishWithResult:0];
  }
  else
  {
    uint64_t v10 = v8;
    id v17 = v4;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 tabGroupManager:self didReloadAferSyncWithResult:v10];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v13);
    }

    id v4 = v17;
  }
}

- (void)syncDidFinishWithResult:(int64_t)a3
{
  if (!a3)
  {
    v6[6] = v3;
    v6[7] = v4;
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke;
    v6[3] = &unk_2643DA4C8;
    v6[4] = self;
    v6[5] = 0;
    dispatch_async(internalQueue, v6);
  }
}

void __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock(&reloadAfterSyncLock);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke_2;
  v3[3] = &unk_2643DA4C8;
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v2;
  [v4 _reloadProfilesAndTabGroupsAndNotify:1 withCompletionHandler:v3];
  [*(id *)(a1 + 32) _notifySyncDidFinishedForScopedBookmarks];
  os_unfair_lock_unlock(&reloadAfterSyncLock);
}

void __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 tabGroupManager:*(void *)(a1 + 32) didReloadAferSyncWithResult:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifySyncDidFinishedForScopedBookmarks
{
  uint64_t v3 = [(WBTabGroupManager *)self allSyncedTabGroupsExceptRemoteUnnamedTabGroups];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke;
  v8[3] = &unk_2643DC518;
  v8[4] = self;
  uint64_t v4 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v8);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke_2;
  block[3] = &unk_2643D9CF8;
  void block[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

id __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isNamed])
  {
    uint64_t v4 = [*(id *)(a1 + 32) topScopedBookmarkListForTabGroup:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "tabGroupManager:didFinishSyncForScopedBookmarkLists:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)reloadTabGroupsFromDatabaseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_21C043000, v5, OS_LOG_TYPE_INFO, "Reloading tab groups from database", v14, 2u);
  }
  if (self->_tabCollection)
  {
    [(WBTabGroupManager *)self _reloadProfilesAndTabGroupsAndNotify:1 withCompletionHandler:v4];
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBTabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)_didRemoveProfiles:(id)a3 updateProfiles:(id)a4 previousProfiles:(id)a5 removeTabGroups:(id)a6 updateTabGroups:(id)a7 previousTabGroups:(id)a8
{
  uint64_t v202 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v103 = a4;
  id v94 = a5;
  id v99 = a6;
  id v101 = a7;
  v117 = (void *)[(NSHashTable *)self->_observers copy];
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  obuint64_t j = v13;
  id v113 = (id)[obj countByEnumeratingWithState:&v184 objects:v201 count:16];
  if (v113)
  {
    uint64_t v109 = *(void *)v185;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v185 != v109) {
          objc_enumerationMutation(obj);
        }
        uint64_t v118 = v14;
        uint64_t v15 = *(void **)(*((void *)&v184 + 1) + 8 * v14);
        long long v180 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        id v16 = v117;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v180 objects:v200 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v181;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v181 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v21 = *(void **)(*((void *)&v180 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                uint64_t v22 = [v15 identifier];
                [v21 tabGroupManager:self didRemoveProfileWithIdentifier:v22];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v180 objects:v200 count:16];
          }
          while (v18);
        }

        [(WBSProfileDataManager *)self->_profileDataManager didRemoveProfile:v15];
        v175[0] = MEMORY[0x263EF8330];
        v175[1] = 3221225472;
        v176 = __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke;
        v177 = &unk_2643D9CF8;
        v178 = self;
        v179 = v15;
        os_unfair_lock_lock(&profilesLock);
        v176((uint64_t)v175);
        os_unfair_lock_unlock(&profilesLock);
        uint64_t v14 = v118 + 1;
      }
      while ((id)(v118 + 1) != v113);
      id v113 = (id)[obj countByEnumeratingWithState:&v184 objects:v201 count:16];
    }
    while (v113);
  }

  uint64_t v23 = [v103 allObjects];
  uint64_t v24 = [v94 differenceFromArray:v23 withOptions:4];

  long long v93 = v24;
  if ([v24 hasChanges])
  {
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v25 = v117;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v171 objects:v199 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v172;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v172 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(void **)(*((void *)&v171 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v30 tabGroupManagerDidUpdateProfiles:self];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v171 objects:v199 count:16];
      }
      while (v27);
    }
  }
  int v31 = NSDictionary;
  int v32 = [v94 valueForKey:@"identifier"];
  v106 = [v31 dictionaryWithObjects:v94 forKeys:v32];

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v97 = v103;
  id v107 = (id)[v97 countByEnumeratingWithState:&v167 objects:v198 count:16];
  if (v107)
  {
    uint64_t v104 = *(void *)v168;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v168 != v104) {
          objc_enumerationMutation(v97);
        }
        uint64_t v110 = v33;
        v119 = *(void **)(*((void *)&v167 + 1) + 8 * v33);
        long long v163 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        long long v166 = 0u;
        id v114 = v117;
        uint64_t v34 = [v114 countByEnumeratingWithState:&v163 objects:v197 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v164;
          do
          {
            for (uint64_t k = 0; k != v35; ++k)
            {
              if (*(void *)v164 != v36) {
                objc_enumerationMutation(v114);
              }
              __int16 v38 = *(void **)(*((void *)&v163 + 1) + 8 * k);
              if (objc_opt_respondsToSelector())
              {
                id v39 = [v119 identifier];
                __int16 v40 = [v119 identifier];
                id v41 = [v106 objectForKeyedSubscript:v40];
                __int16 v42 = [v119 differenceFromProfile:v41];
                [v38 tabGroupManager:self didUpdateProfileWithIdentifier:v39 difference:v42];
              }
            }
            uint64_t v35 = [v114 countByEnumeratingWithState:&v163 objects:v197 count:16];
          }
          while (v35);
        }

        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        long long v43 = self->_cloudTabObservers;
        uint64_t v44 = [(NSHashTable *)v43 countByEnumeratingWithState:&v159 objects:v196 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v160;
          do
          {
            for (uint64_t m = 0; m != v45; ++m)
            {
              if (*(void *)v160 != v46) {
                objc_enumerationMutation(v43);
              }
              long long v48 = *(void **)(*((void *)&v159 + 1) + 8 * m);
              if (objc_opt_respondsToSelector())
              {
                __int16 v49 = [v119 identifier];
                [v48 cloudTabDeviceProvider:self didUpdateCloudTabsInProfileWithIdentifier:v49];
              }
            }
            uint64_t v45 = [(NSHashTable *)v43 countByEnumeratingWithState:&v159 objects:v196 count:16];
          }
          while (v45);
        }

        uint64_t v33 = v110 + 1;
      }
      while ((id)(v110 + 1) != v107);
      id v107 = (id)[v97 countByEnumeratingWithState:&v167 objects:v198 count:16];
    }
    while (v107);
  }

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v96 = v99;
  id v115 = (id)[v96 countByEnumeratingWithState:&v155 objects:v195 count:16];
  if (v115)
  {
    uint64_t v111 = *(void *)v156;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v156 != v111) {
          objc_enumerationMutation(v96);
        }
        uint64_t v120 = v50;
        uint64_t v51 = *(void **)(*((void *)&v155 + 1) + 8 * v50);
        long long v151 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        id v52 = v117;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v151 objects:v194 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v152;
          do
          {
            for (uint64_t n = 0; n != v54; ++n)
            {
              if (*(void *)v152 != v55) {
                objc_enumerationMutation(v52);
              }
              id v57 = *(void **)(*((void *)&v151 + 1) + 8 * n);
              if (objc_opt_respondsToSelector())
              {
                __int16 v58 = [v51 uuid];
                [v57 tabGroupManager:self didRemoveTabGroupWithUUID:v58];
              }
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v151 objects:v194 count:16];
          }
          while (v54);
        }

        v146[0] = MEMORY[0x263EF8330];
        v146[1] = 3221225472;
        v147 = __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke_2;
        v148 = &unk_2643D9CF8;
        v149 = self;
        v150 = v51;
        os_unfair_lock_lock(&tabGroupsLock);
        v147((uint64_t)v146);
        os_unfair_lock_unlock(&tabGroupsLock);
        uint64_t v50 = v120 + 1;
      }
      while ((id)(v120 + 1) != v115);
      id v115 = (id)[v96 countByEnumeratingWithState:&v155 objects:v195 count:16];
    }
    while (v115);
  }

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v95 = v101;
  uint64_t v102 = [v95 countByEnumeratingWithState:&v142 objects:v193 count:16];
  if (v102)
  {
    uint64_t v100 = *(void *)v143;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v143 != v100) {
          objc_enumerationMutation(v95);
        }
        uint64_t v105 = v59;
        __int16 v60 = *(void **)(*((void *)&v142 + 1) + 8 * v59);
        os_unfair_lock_lock(&tabGroupsLock);
        id v116 = v60;
        long long v61 = [v60 uuid];
        __int16 v62 = [(WBTabGroupManager *)self _tabGroupWithUUID:v61];
        long long v63 = [v62 tabs];

        os_unfair_lock_unlock(&tabGroupsLock);
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v108 = v63;
        uint64_t v121 = [v108 countByEnumeratingWithState:&v138 objects:v192 count:16];
        if (v121)
        {
          uint64_t v112 = *(void *)v139;
          do
          {
            for (iuint64_t i = 0; ii != v121; ++ii)
            {
              if (*(void *)v139 != v112) {
                objc_enumerationMutation(v108);
              }
              long long v65 = *(void **)(*((void *)&v138 + 1) + 8 * ii);
              long long v134 = 0u;
              long long v135 = 0u;
              long long v136 = 0u;
              long long v137 = 0u;
              id v66 = v117;
              uint64_t v67 = [v66 countByEnumeratingWithState:&v134 objects:v191 count:16];
              if (v67)
              {
                uint64_t v68 = v67;
                uint64_t v69 = *(void *)v135;
                do
                {
                  for (juint64_t j = 0; jj != v68; ++jj)
                  {
                    if (*(void *)v135 != v69) {
                      objc_enumerationMutation(v66);
                    }
                    uint64_t v71 = *(void **)(*((void *)&v134 + 1) + 8 * jj);
                    if (objc_opt_respondsToSelector())
                    {
                      __int16 v72 = [v65 uuid];
                      [v71 tabGroupManager:self didUpdateTabWithUUID:v72 userDriven:0];
                    }
                  }
                  uint64_t v68 = [v66 countByEnumeratingWithState:&v134 objects:v191 count:16];
                }
                while (v68);
              }
            }
            uint64_t v121 = [v108 countByEnumeratingWithState:&v138 objects:v192 count:16];
          }
          while (v121);
        }

        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v73 = v117;
        uint64_t v74 = [v73 countByEnumeratingWithState:&v130 objects:v190 count:16];
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v76 = *(void *)v131;
          do
          {
            for (kuint64_t k = 0; kk != v75; ++kk)
            {
              if (*(void *)v131 != v76) {
                objc_enumerationMutation(v73);
              }
              id v78 = *(void **)(*((void *)&v130 + 1) + 8 * kk);
              if (objc_opt_respondsToSelector())
              {
                id v79 = [v116 uuid];
                [v78 tabGroupManager:self didUpdateTabsInTabGroupWithUUID:v79];
              }
            }
            uint64_t v75 = [v73 countByEnumeratingWithState:&v130 objects:v190 count:16];
          }
          while (v75);
        }

        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        id v80 = v73;
        uint64_t v81 = [v80 countByEnumeratingWithState:&v126 objects:v189 count:16];
        if (v81)
        {
          uint64_t v82 = v81;
          uint64_t v83 = *(void *)v127;
          do
          {
            for (muint64_t m = 0; mm != v82; ++mm)
            {
              if (*(void *)v127 != v83) {
                objc_enumerationMutation(v80);
              }
              id v85 = *(void **)(*((void *)&v126 + 1) + 8 * mm);
              if (objc_opt_respondsToSelector())
              {
                long long v86 = [v116 uuid];
                [v85 tabGroupManager:self didUpdateTabGroupWithUUID:v86];
              }
            }
            uint64_t v82 = [v80 countByEnumeratingWithState:&v126 objects:v189 count:16];
          }
          while (v82);
        }

        uint64_t v59 = v105 + 1;
      }
      while (v105 + 1 != v102);
      uint64_t v102 = [v95 countByEnumeratingWithState:&v142 objects:v193 count:16];
    }
    while (v102);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v87 = v117;
  uint64_t v88 = [v87 countByEnumeratingWithState:&v122 objects:v188 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v123;
    do
    {
      for (nuint64_t n = 0; nn != v89; ++nn)
      {
        if (*(void *)v123 != v90) {
          objc_enumerationMutation(v87);
        }
        long long v92 = *(void **)(*((void *)&v122 + 1) + 8 * nn);
        if (objc_opt_respondsToSelector()) {
          [v92 tabGroupManagerDidUpdateTabGroups:self];
        }
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v122 objects:v188 count:16];
    }
    while (v89);
  }
}

void __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 112);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 setObject:0 forKeyedSubscript:v2];
}

void __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(a1 + 40) uuid];
  [v1 setObject:0 forKeyedSubscript:v2];
}

- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3
{
  return [(WBTabCollection *)self->_tabCollection tabCollectionDataSummaryLogHidingSensitiveData:a3];
}

- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5
{
  return [(WBTabCollection *)self->_tabCollection copyTabsDatabase:a3 hidingSensitiveData:a4 error:a5];
}

- (WBTabGroupSyncAgentProtocol)syncAgentProxy
{
  return self->_syncAgentProxy;
}

- (BOOL)enableSharedTabGroupsFastSyncPresence
{
  return self->_enableSharedTabGroupsFastSyncPresence;
}

- (BOOL)isBroadcastingPresenceUpdates
{
  return self->_isBroadcastingPresenceUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAgentProxy, 0);
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_broadcastingTabGroupUUIDsToCKShare, 0);
  objc_storeStrong((id *)&self->_tabGroupUUIDsToCKShares, 0);
  objc_storeStrong((id *)&self->_activeTabGroupAndTabUUIDPair, 0);
  objc_storeStrong((id *)&self->_activeTabGroupUUIDs, 0);
  objc_storeStrong((id *)&self->_presenceCoordinator, 0);
  objc_storeStrong((id *)&self->_pendingShareAcceptancePairQueue, 0);
  objc_storeStrong((id *)&self->_currentShareAcceptancePair, 0);
  objc_storeStrong(&self->_setupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_profileDataManager, 0);
  objc_storeStrong((id *)&self->_insertedItemUUIDsThatWereMissingDuringReload, 0);
  objc_storeStrong((id *)&self->_lastLocalDeviceNameSaved, 0);
  objc_storeStrong((id *)&self->_deviceUUIDByTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_devicesByUUID, 0);
  objc_storeStrong((id *)&self->_removedProfilesByIdentifier, 0);
  objc_storeStrong((id *)&self->_profilesByIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_syncableTabGroupsByUUID, 0);
  objc_storeStrong((id *)&self->_syncableTabsByUUID, 0);
  objc_storeStrong((id *)&self->_localTabGroupsByUUID, 0);
  objc_storeStrong((id *)&self->_localTabsByUUID, 0);
  objc_storeStrong((id *)&self->_removedTabsByUUID, 0);
  objc_storeStrong((id *)&self->_removedTabGroupsByUUID, 0);
  objc_storeStrong((id *)&self->_recentlyAddedTabGroupsAwaitingFirstStartPage, 0);
  objc_storeStrong((id *)&self->_positionGenerator, 0);
  objc_storeStrong((id *)&self->_cloudTabObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __34__WBTabGroupManager__loadDatabase__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() privacyPreservingDescription];
  OUTLINED_FUNCTION_0_5(&dword_21C043000, v4, v5, "Item does not have a sync position %{public}@", v6, v7, v8, v9, 2u);
}

void __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 privacyPreservingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() privacyPreservingDescription];
  int v5 = 138543618;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_3_3();
  _os_log_fault_impl(&dword_21C043000, v3, OS_LOG_TYPE_FAULT, "Items do not have sync positions: %{public}@, %{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)insertScopedBookmark:(os_log_t)log inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:.cold.1(void *a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1) {
    int v5 = [a1 identifier];
  }
  else {
    int v5 = -1;
  }
  v6[0] = 67109376;
  v6[1] = a2;
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Failed to insert scoped bookmark into parent(%d) after anchor(%d).", (uint8_t *)v6, 0xEu);
}

- (void)insertScopedBookmark:(uint64_t)a3 inScopedBookmarkFolderWithID:(uint64_t)a4 afterBookmarkWithUUID:(uint64_t)a5 notify:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateScopedBookmarkWithUUID:(void *)a1 title:(void *)a2 address:notify:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 identifier];
  OUTLINED_FUNCTION_4_0(&dword_21C043000, v4, v5, "Failed to update scoped bookmark(%d).", v6, v7, v8, v9, 0);
}

- (void)deleteScopedBookmarkWithUUID:(void *)a1 notify:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 identifier];
  OUTLINED_FUNCTION_4_0(&dword_21C043000, v4, v5, "Failed to delete scoped bookmark(%d).", v6, v7, v8, v9, 0);
}

- (void)_notifyScopedBookmarkChangesInFolderWithID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Could not load scoped bookmark folder(%d) when notifying changes.", (uint8_t *)v2, 8u);
}

void __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 48);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 share];
  uint64_t v6 = [v5 recordID];
  uint64_t v7 = [v6 zoneID];
  uint64_t v8 = [v7 ckShortDescription];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 56), "safari_privacyPreservingDescription");
  int v10 = 138543618;
  uint64_t v11 = v8;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_21C043000, v4, OS_LOG_TYPE_ERROR, "Failed to join shared tab group %{public}@ with error: %{public}@", (uint8_t *)&v10, 0x16u);
}

void __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() recordID];
  uint64_t v5 = [v4 ckShortDescription];
  OUTLINED_FUNCTION_0_5(&dword_21C043000, v6, v7, "tabGroupUUID is nil despite successfully accepting share %{public}@", v8, v9, v10, v11, 2u);
}

void __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "safari_privacyPreservingDescription");
  int v6 = 138543618;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_21C043000, v2, OS_LOG_TYPE_ERROR, "Failed to begin sharing tab group with UUID: %{public}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)reloadTabGroupsFromDatabaseWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end