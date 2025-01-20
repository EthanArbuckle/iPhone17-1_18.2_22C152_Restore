@interface DownloadsChangeset
- (DownloadsChangeset)init;
- (NSArray)HTTPCookies;
- (NSArray)IPodLibraryItems;
- (NSArray)SSAppWakeRequests;
- (NSArray)applicationWorkspaceChanges;
- (NSArray)deletedHTTPCookies;
- (NSDictionary)changedDownloadProperties;
- (NSDictionary)changedExternalDownloadProperties;
- (NSOrderedSet)pipelineAdditions;
- (NSOrderedSet)pipelineRestarts;
- (NSOrderedSet)policyChangedDownloadIDs;
- (NSOrderedSet)removedDownloadIDs;
- (NSOrderedSet)removedPersistentDownloadIDs;
- (NSOrderedSet)restorableDownloadIDs;
- (NSSet)canceledAppDataRestoreIDs;
- (NSSet)canceledIPodLibraryDownloadIDs;
- (NSSet)changedDownloadKinds;
- (NSSet)deletedIPodLibraryDownloadIDs;
- (NSSet)finishedDownloadKinds;
- (NSSet)statusChangedDownloadIDs;
- (NSSet)updatedDownloadIDs;
- (NSString)restoreReason;
- (id)_SSAppWakeRequests;
- (id)_applicationWorkspaceChanges;
- (id)_canceledAppDataRestoreIDs;
- (id)_canceledIPodLibraryDownloadIDs;
- (id)_cookies;
- (id)_deletedHTTPCookies;
- (id)_deletedIPodLibraryDownloadIDs;
- (id)_finishedDownloadKinds;
- (id)_initDownloadsChangeset;
- (id)_policyChangedDownloadIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)downloadChangeTypes;
- (void)_addApplicationWorkspaceChangeWithHandle:(id)a3 changeType:(int64_t)a4;
- (void)addAppPlaceholderUpdateWithHandle:(id)a3;
- (void)addAppPlaceholderWithHandle:(id)a3;
- (void)addApplicationWorkspaceChange:(id)a3;
- (void)addCanceledAppDataRestoreID:(id)a3;
- (void)addCanceledAppWithHandle:(id)a3;
- (void)addCanceledIPodLibraryDownloadID:(int64_t)a3;
- (void)addDeletedHTTPCookies:(id)a3;
- (void)addDeletedIPodLibraryDownloadID:(int64_t)a3;
- (void)addDownloadChangeTypes:(int64_t)a3;
- (void)addDownloadKind:(id)a3;
- (void)addDownloadToPipelineWithID:(int64_t)a3;
- (void)addDownloadsToPipelineWithIDs:(id)a3;
- (void)addFailedAppWithHandle:(id)a3;
- (void)addFinishedAppWithHandle:(id)a3;
- (void)addFinishedDownloadKind:(id)a3;
- (void)addHTTPCookie:(id)a3;
- (void)addIPodLibraryItem:(id)a3;
- (void)addPolicyChangedDownloadID:(int64_t)a3;
- (void)addRemovedDownloadID:(int64_t)a3;
- (void)addRemovedPersistentDownloadID:(int64_t)a3;
- (void)addRestorableDownloadID:(int64_t)a3;
- (void)addRetryAppWithHandle:(id)a3;
- (void)addSSAppWakeRequest:(id)a3;
- (void)addStatusChangedDownloadID:(int64_t)a3;
- (void)addUpdatedDownloadID:(int64_t)a3;
- (void)dealloc;
- (void)removeDownloadFromPipelineWithID:(int64_t)a3;
- (void)restartDownloadsInPipelineWithIDs:(id)a3;
- (void)setChangedDownloadProperties:(id)a3;
- (void)setChangedExternalDownloadProperties:(id)a3;
- (void)setRestoreReason:(id)a3;
- (void)unionChangeset:(id)a3;
@end

@implementation DownloadsChangeset

- (int64_t)downloadChangeTypes
{
  return self->_downloadChangeTypes;
}

- (NSOrderedSet)policyChangedDownloadIDs
{
  return &self->_policyChangedDownloadIDs->super;
}

- (NSOrderedSet)pipelineRestarts
{
  return &self->_pipelineRestarts->super;
}

- (NSOrderedSet)pipelineAdditions
{
  return &self->_pipelineAdditions->super;
}

- (NSSet)finishedDownloadKinds
{
  return &self->_finishedDownloadKinds->super;
}

- (NSSet)deletedIPodLibraryDownloadIDs
{
  return &self->_deletedIPodLibraryDownloadIDs->super;
}

- (NSArray)deletedHTTPCookies
{
  return &self->_deletedHTTPCookies->super;
}

- (NSSet)changedDownloadKinds
{
  return &self->_changedDownloadKinds->super;
}

- (NSSet)canceledIPodLibraryDownloadIDs
{
  return &self->_canceledIPodLibraryDownloadIDs->super;
}

- (NSSet)canceledAppDataRestoreIDs
{
  return &self->_canceledAppDataRestoreIDs->super;
}

- (NSArray)applicationWorkspaceChanges
{
  return &self->_applicationWorkspaceChanges->super;
}

- (NSArray)SSAppWakeRequests
{
  return &self->_SSAppWakeRequests->super;
}

- (NSArray)IPodLibraryItems
{
  return &self->_ipodLibraryItems->super;
}

- (NSArray)HTTPCookies
{
  return &self->_cookies->super;
}

- (DownloadsChangeset)init
{
  v2 = [(DownloadsChangeset *)self _initDownloadsChangeset];
  if (v2)
  {
    v2->_changedDownloadKinds = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->_ipodLibraryItems = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_pipelineAdditions = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v2->_pipelineRestarts = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v2->_removedDownloadIDs = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v2->_removedPersistentDownloadIDs = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v2->_restorableDownloadIDs = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v2->_statusChangedDownloadIDs = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->_updatedDownloadIDs = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initDownloadsChangeset");
  v5[1] = [(NSMutableArray *)self->_SSAppWakeRequests mutableCopyWithZone:a3];
  v5[2] = [(NSMutableArray *)self->_applicationWorkspaceChanges mutableCopyWithZone:a3];
  v5[3] = [(NSMutableSet *)self->_canceledAppDataRestoreIDs mutableCopyWithZone:a3];
  v5[4] = [(NSMutableSet *)self->_canceledIPodLibraryDownloadIDs mutableCopyWithZone:a3];
  v5[5] = [(NSMutableSet *)self->_changedDownloadKinds mutableCopyWithZone:a3];
  v5[6] = [(NSDictionary *)self->_changedDownloadProperties copyWithZone:a3];
  v5[7] = [(NSDictionary *)self->_changedExternalDownloadProperties copyWithZone:a3];
  v5[8] = [(NSMutableArray *)self->_cookies mutableCopyWithZone:a3];
  v5[9] = [(NSMutableArray *)self->_deletedHTTPCookies mutableCopyWithZone:a3];
  v5[10] = [(NSMutableSet *)self->_deletedIPodLibraryDownloadIDs mutableCopyWithZone:a3];
  v5[11] = self->_downloadChangeTypes;
  v5[12] = [(NSMutableSet *)self->_finishedDownloadKinds mutableCopyWithZone:a3];
  v5[13] = [(NSMutableArray *)self->_ipodLibraryItems mutableCopyWithZone:a3];
  v5[14] = [(NSMutableOrderedSet *)self->_pipelineAdditions mutableCopyWithZone:a3];
  v5[15] = [(NSMutableOrderedSet *)self->_pipelineRestarts mutableCopyWithZone:a3];
  v5[16] = [(NSMutableOrderedSet *)self->_policyChangedDownloadIDs mutableCopyWithZone:a3];
  v5[17] = [(NSMutableOrderedSet *)self->_removedDownloadIDs mutableCopyWithZone:a3];
  v5[18] = [(NSMutableOrderedSet *)self->_removedPersistentDownloadIDs mutableCopyWithZone:a3];
  v5[19] = [(NSMutableOrderedSet *)self->_restorableDownloadIDs mutableCopyWithZone:a3];
  v5[20] = [(NSString *)self->_restoreReason copyWithZone:a3];
  v5[21] = [(NSMutableSet *)self->_statusChangedDownloadIDs mutableCopyWithZone:a3];
  v5[22] = [(NSMutableSet *)self->_updatedDownloadIDs mutableCopyWithZone:a3];
  return v5;
}

- (id)_initDownloadsChangeset
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadsChangeset;
  return [(DownloadsChangeset *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadsChangeset;
  [(DownloadsChangeset *)&v3 dealloc];
}

- (void)addSSAppWakeRequest:(id)a3
{
  id v4 = [(DownloadsChangeset *)self _SSAppWakeRequests];

  [v4 addObject:a3];
}

- (void)addApplicationWorkspaceChange:(id)a3
{
  id v4 = [(DownloadsChangeset *)self _applicationWorkspaceChanges];

  [v4 addObject:a3];
}

- (void)addAppPlaceholderWithHandle:(id)a3
{
}

- (void)addAppPlaceholderUpdateWithHandle:(id)a3
{
}

- (void)addCanceledAppWithHandle:(id)a3
{
}

- (void)addCanceledAppDataRestoreID:(id)a3
{
  id v4 = [(DownloadsChangeset *)self _canceledAppDataRestoreIDs];

  [v4 addObject:a3];
}

- (void)addCanceledIPodLibraryDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  objc_msgSend(-[DownloadsChangeset _canceledIPodLibraryDownloadIDs](self, "_canceledIPodLibraryDownloadIDs"), "addObject:", v4);
}

- (void)addDeletedHTTPCookies:(id)a3
{
  id v4 = [(DownloadsChangeset *)self _deletedHTTPCookies];

  [v4 addObjectsFromArray:a3];
}

- (void)addDeletedIPodLibraryDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  objc_msgSend(-[DownloadsChangeset _deletedIPodLibraryDownloadIDs](self, "_deletedIPodLibraryDownloadIDs"), "addObject:", v4);
}

- (void)addDownloadChangeTypes:(int64_t)a3
{
  self->_downloadChangeTypes |= a3;
}

- (void)addDownloadKind:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_changedDownloadKinds, "addObject:");
  }
}

- (void)addDownloadToPipelineWithID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableOrderedSet *)self->_pipelineAdditions addObject:v4];
}

- (void)addDownloadsToPipelineWithIDs:(id)a3
{
}

- (void)addFailedAppWithHandle:(id)a3
{
}

- (void)addFinishedAppWithHandle:(id)a3
{
}

- (void)addFinishedDownloadKind:(id)a3
{
  if (a3)
  {
    id v4 = [(DownloadsChangeset *)self _finishedDownloadKinds];
    [v4 addObject:a3];
  }
}

- (void)addHTTPCookie:(id)a3
{
  id v4 = [(DownloadsChangeset *)self _cookies];

  [v4 addObject:a3];
}

- (void)addIPodLibraryItem:(id)a3
{
}

- (void)addPolicyChangedDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  objc_msgSend(-[DownloadsChangeset _policyChangedDownloadIDs](self, "_policyChangedDownloadIDs"), "addObject:", v4);
}

- (void)addRemovedDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableOrderedSet *)self->_removedDownloadIDs addObject:v4];
}

- (void)addRemovedPersistentDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableOrderedSet *)self->_removedPersistentDownloadIDs addObject:v4];
}

- (void)addRestorableDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableOrderedSet *)self->_restorableDownloadIDs addObject:v4];
}

- (void)addRetryAppWithHandle:(id)a3
{
}

- (void)addStatusChangedDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableSet *)self->_statusChangedDownloadIDs addObject:v4];
}

- (void)addUpdatedDownloadID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableSet *)self->_updatedDownloadIDs addObject:v4];
}

- (void)removeDownloadFromPipelineWithID:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  [(NSMutableOrderedSet *)self->_pipelineAdditions removeObject:v4];
}

- (void)restartDownloadsInPipelineWithIDs:(id)a3
{
}

- (void)unionChangeset:(id)a3
{
  id v5 = [a3 SSAppWakeRequests];
  if (v5) {
    objc_msgSend(-[DownloadsChangeset _SSAppWakeRequests](self, "_SSAppWakeRequests"), "addObjectsFromArray:", v5);
  }
  id v6 = [a3 applicationWorkspaceChanges];
  if ([v6 count]) {
    objc_msgSend(-[DownloadsChangeset _applicationWorkspaceChanges](self, "_applicationWorkspaceChanges"), "addObjectsFromArray:", v6);
  }
  id v7 = [a3 canceledAppDataRestoreIDs];
  if (v7) {
    objc_msgSend(-[DownloadsChangeset _canceledAppDataRestoreIDs](self, "_canceledAppDataRestoreIDs"), "unionSet:", v7);
  }
  id v8 = [a3 changedDownloadProperties];
  if (v8)
  {
    id v9 = v8;
    changedDownloadProperties = self->_changedDownloadProperties;
    if (changedDownloadProperties) {
      id v11 = [(NSDictionary *)changedDownloadProperties mutableCopy];
    }
    else {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v12 = v11;
    [v11 addEntriesFromDictionary:v9];
    [(DownloadsChangeset *)self setChangedDownloadProperties:v12];
  }
  id v13 = [a3 changedExternalDownloadProperties];
  if (v13)
  {
    id v14 = v13;
    changedExternalDownloadProperties = self->_changedExternalDownloadProperties;
    if (changedExternalDownloadProperties) {
      id v16 = [(NSDictionary *)changedExternalDownloadProperties mutableCopy];
    }
    else {
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v17 = v16;
    [v16 addEntriesFromDictionary:v14];
    [(DownloadsChangeset *)self setChangedExternalDownloadProperties:v17];
  }
  id v18 = [a3 finishedDownloadKinds];
  if (v18) {
    objc_msgSend(-[DownloadsChangeset _finishedDownloadKinds](self, "_finishedDownloadKinds"), "unionSet:", v18);
  }
  id v19 = [a3 HTTPCookies];
  if (v19) {
    objc_msgSend(-[DownloadsChangeset _cookies](self, "_cookies"), "addObjectsFromArray:", v19);
  }
  id v20 = [a3 deletedHTTPCookies];
  if (v20) {
    objc_msgSend(-[DownloadsChangeset _deletedHTTPCookies](self, "_deletedHTTPCookies"), "addObjectsFromArray:", v20);
  }
  id v21 = [a3 deletedIPodLibraryDownloadIDs];
  if (v21) {
    objc_msgSend(-[DownloadsChangeset _deletedIPodLibraryDownloadIDs](self, "_deletedIPodLibraryDownloadIDs"), "unionSet:", v21);
  }
  id v22 = [a3 canceledIPodLibraryDownloadIDs];
  if (v22) {
    objc_msgSend(-[DownloadsChangeset _canceledIPodLibraryDownloadIDs](self, "_canceledIPodLibraryDownloadIDs"), "unionSet:", v22);
  }
  id v23 = [a3 policyChangedDownloadIDs];
  if (v23) {
    objc_msgSend(-[DownloadsChangeset _policyChangedDownloadIDs](self, "_policyChangedDownloadIDs"), "unionOrderedSet:", v23);
  }
  -[NSMutableSet unionSet:](self->_changedDownloadKinds, "unionSet:", [a3 changedDownloadKinds]);
  self->_downloadChangeTypes |= (unint64_t)[a3 downloadChangeTypes];
  -[NSMutableArray addObjectsFromArray:](self->_ipodLibraryItems, "addObjectsFromArray:", [a3 IPodLibraryItems]);
  -[NSMutableOrderedSet unionOrderedSet:](self->_pipelineAdditions, "unionOrderedSet:", [a3 pipelineAdditions]);
  -[NSMutableOrderedSet unionOrderedSet:](self->_removedDownloadIDs, "unionOrderedSet:", [a3 removedDownloadIDs]);
  -[NSMutableOrderedSet unionOrderedSet:](self->_removedPersistentDownloadIDs, "unionOrderedSet:", [a3 removedPersistentDownloadIDs]);
  -[NSMutableOrderedSet unionOrderedSet:](self->_restorableDownloadIDs, "unionOrderedSet:", [a3 restorableDownloadIDs]);
  -[NSMutableSet unionSet:](self->_statusChangedDownloadIDs, "unionSet:", [a3 statusChangedDownloadIDs]);
  -[NSMutableSet unionSet:](self->_updatedDownloadIDs, "unionSet:", [a3 updatedDownloadIDs]);
  if (!self->_restoreReason) {
    self->_restoreReason = (NSString *)[a3 restoreReason];
  }
}

- (void)_addApplicationWorkspaceChangeWithHandle:(id)a3 changeType:(int64_t)a4
{
  id v7 = objc_alloc_init(ApplicationWorkspaceChange);
  [(ApplicationWorkspaceChange *)v7 setChangeType:a4];
  [(ApplicationWorkspaceChange *)v7 setApplicationHandle:a3];
  [(DownloadsChangeset *)self addApplicationWorkspaceChange:v7];
}

- (id)_SSAppWakeRequests
{
  id result = self->_SSAppWakeRequests;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableArray);
    self->_SSAppWakeRequests = (NSMutableArray *)result;
  }
  return result;
}

- (id)_applicationWorkspaceChanges
{
  id result = self->_applicationWorkspaceChanges;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableArray);
    self->_applicationWorkspaceChanges = (NSMutableArray *)result;
  }
  return result;
}

- (id)_canceledAppDataRestoreIDs
{
  id result = self->_canceledAppDataRestoreIDs;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableSet);
    self->_canceledAppDataRestoreIDs = (NSMutableSet *)result;
  }
  return result;
}

- (id)_canceledIPodLibraryDownloadIDs
{
  id result = self->_canceledIPodLibraryDownloadIDs;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableSet);
    self->_canceledIPodLibraryDownloadIDs = (NSMutableSet *)result;
  }
  return result;
}

- (id)_cookies
{
  id result = self->_cookies;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableArray);
    self->_cookies = (NSMutableArray *)result;
  }
  return result;
}

- (id)_deletedHTTPCookies
{
  id result = self->_deletedHTTPCookies;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableArray);
    self->_deletedHTTPCookies = (NSMutableArray *)result;
  }
  return result;
}

- (id)_deletedIPodLibraryDownloadIDs
{
  id result = self->_deletedIPodLibraryDownloadIDs;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableSet);
    self->_deletedIPodLibraryDownloadIDs = (NSMutableSet *)result;
  }
  return result;
}

- (id)_finishedDownloadKinds
{
  id result = self->_finishedDownloadKinds;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableSet);
    self->_finishedDownloadKinds = (NSMutableSet *)result;
  }
  return result;
}

- (id)_policyChangedDownloadIDs
{
  id result = self->_policyChangedDownloadIDs;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableOrderedSet);
    self->_policyChangedDownloadIDs = (NSMutableOrderedSet *)result;
  }
  return result;
}

- (NSDictionary)changedDownloadProperties
{
  return self->_changedDownloadProperties;
}

- (void)setChangedDownloadProperties:(id)a3
{
}

- (NSDictionary)changedExternalDownloadProperties
{
  return self->_changedExternalDownloadProperties;
}

- (void)setChangedExternalDownloadProperties:(id)a3
{
}

- (NSOrderedSet)removedDownloadIDs
{
  return &self->_removedDownloadIDs->super;
}

- (NSOrderedSet)removedPersistentDownloadIDs
{
  return &self->_removedPersistentDownloadIDs->super;
}

- (NSOrderedSet)restorableDownloadIDs
{
  return &self->_restorableDownloadIDs->super;
}

- (NSString)restoreReason
{
  return self->_restoreReason;
}

- (void)setRestoreReason:(id)a3
{
}

- (NSSet)statusChangedDownloadIDs
{
  return &self->_statusChangedDownloadIDs->super;
}

- (NSSet)updatedDownloadIDs
{
  return &self->_updatedDownloadIDs->super;
}

@end