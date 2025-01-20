@interface THAnnotationController
- (BOOL)_isPageInfoAnnotated:(id)a3 checkBookmarks:(BOOL)a4;
- (BOOL)annotationsReadEnabled;
- (BOOL)annotationsWriteEnabled;
- (BOOL)getPlaceholder:(id *)a3 andPageHistory:(id *)a4;
- (BOOL)isAbsolutePhysicalPageBookmarked:(unint64_t)a3;
- (BOOL)isAbsolutePhysicalPageHighlightedWithNotes:(unint64_t)a3;
- (BOOL)isPageInfoBookmarked:(id)a3;
- (BOOL)isPageInfoHighlightedWithNotes:(id)a3;
- (BOOL)p_annotationNeedsMigration:(id)a3;
- (BOOL)p_annotationNeedsMigrationForAnnotationSchemaVersion:(id)a3;
- (BOOL)p_annotationsNeedsMigration:(id)a3;
- (BOOL)p_cachedAnnotationNeedsMigration:(id)a3;
- (BOOL)p_ensureCFIForAEAnnotation:(id)a3 moc:(id)a4;
- (BOOL)p_migrateAEAnnotation:(id)a3 fromStorage:(id)a4 toAnyNonBodyStorageInContentNode:(id)a5 moc:(id)a6;
- (BOOL)p_migrateAEAnnotation:(id)a3 withinStorage:(id)a4 moc:(id)a5;
- (BOOL)p_migrateAEAnnotationIfNecessary:(id)a3 moc:(id)a4;
- (BOOL)p_migrateBookmarkOrPlaceholderAEAnnotation:(id)a3 inContentNode:(id)a4 moc:(id)a5;
- (NSManagedObjectContext)lastCommitMoc;
- (NSPredicate)basePredicate;
- (NSPredicate)globalPredicate;
- (NSPredicate)nonCurrentVersionPredicate;
- (NSPredicate)nonOrphanedPredicate;
- (NSPredicate)nonOrphanedRangePredicate;
- (NSPredicate)nonSponsoredNonOrphanedPredicate;
- (NSPredicate)nonSponsoredPredicate;
- (NSPredicate)orphanedPredicate;
- (NSPredicate)orphanedRangePredicate;
- (NSPredicate)pointPredicate;
- (NSPredicate)rangePredicate;
- (THAnnotationController)initWithAnnotationProvider:(id)a3 documentNavigationModel:(id)a4;
- (THDocumentNavigationModel)documentNavModel;
- (THDocumentRoot)documentRoot;
- (_NSRange)p_rangeOfAEAnnotation:(id)a3 inStorage:(id)a4;
- (id)addAnnotationForStorage:(id)a3 range:(_NSRange)a4 contentNode:(id)a5 style:(int)a6 undoContext:(id)a7;
- (id)allBookmarkIdentifiers;
- (id)allBookmarksFetchedResultsController;
- (id)annotationID;
- (id)annotationRequestForAllNotes;
- (id)annotationRequestForNonOrphanedNotes;
- (id)annotationRequestForNonOrphanedSearchText:(id)a3;
- (id)annotationRequestForNonSponsoredNonOrphaned;
- (id)annotationRequestForOrphanedNotes;
- (id)annotationRequestForOrphanedSearchText:(id)a3;
- (id)annotationRequestForSearchText:(id)a3;
- (id)annotationRequestForStorageID:(id)a3;
- (id)annotationWithUuid:(id)a3;
- (id)cachedAnnotationForFetchedObject:(id)a3;
- (id)cachedAnnotationsForAnnotations:(id)a3 filteredWithContentNode:(id)a4;
- (id)cachedAnnotationsForAnnotations:(id)a3 withFilter:(id)a4;
- (id)cachedAnnotationsForContentNode:(id)a3;
- (id)cachedAnnotationsForFetchRequest:(id)a3 migrateIfNecessary:(BOOL)a4;
- (id)contentNodeForAnnotation:(id)a3;
- (id)managedObjectContextSaveObserver;
- (id)maxAnnotationAssetVersion;
- (id)modifiedAnnotation:(id)a3 withChapterTitle:(id)a4 physicalPageNumber:(id)a5;
- (id)modifyAnnotation:(id)a3 undoContext:(id)a4 undoActionName:(id)a5 withBlock:(id)a6;
- (id)modifyAnnotation:(id)a3 withNoteText:(id)a4 undoContext:(id)a5;
- (id)modifyAnnotation:(id)a3 withStyle:(int)a4 undoContext:(id)a5;
- (id)p_actionForDeletingAEAnnotation:(id)a3;
- (id)p_actionForDeletingCachedAnnotation:(id)a3 moc:(id)a4;
- (id)p_actionForInsertingAnnotationWithType:(int)a3 style:(int)a4 absolutePageIndex:(unint64_t)a5 range:(_NSRange)a6 storage:(id)a7 contentNode:(id)a8 updateBlock:(id)a9;
- (id)p_actionForUpdatingAnnotation:(id)a3 withBlock:(id)a4;
- (id)p_actionForUpdatingAnnotation:(id)a3 withContentNode:(id)a4 block:(id)a5;
- (id)p_allBookmarksFetchRequest;
- (id)p_allContentNodeAnnotations;
- (id)p_annotationForCachedAnnotation:(id)a3 moc:(id)a4;
- (id)p_annotationRequestForAllNotesWithPredicate:(id)a3;
- (id)p_annotationRequestForAnnotationUUID:(id)a3 includeDeleted:(BOOL)a4;
- (id)p_annotationRequestForContentNode:(id)a3;
- (id)p_annotationRequestForContentNode:(id)a3 withSearchText:(id)a4;
- (id)p_annotationRequestForSearchText:(id)a3 conjoinedWithPredicate:(id)a4;
- (id)p_annotationRequestForStorageID:(id)a3 intersectingRange:(_NSRange)a4;
- (id)p_annotationsForContentNode:(id)a3 moc:(id)a4;
- (id)p_annotationsForFetchRequest:(id)a3 moc:(id)a4 migrateIfNecessary:(BOOL)a5;
- (id)p_annotationsForManagedObjectIDs:(id)a3 moc:(id)a4;
- (id)p_bookmarkRequestForContentNode:(id)a3;
- (id)p_bookmarkSortDescriptorsAscending:(BOOL)a3;
- (id)p_bookmarksWithMOC:(id)a3;
- (id)p_cachedAnnotationsForContentNode:(id)a3 moc:(id)a4;
- (id)p_cachedBookmarksWithMoc:(id)a3;
- (id)p_contentNodeForCachedAnnotation:(id)a3;
- (id)p_extendExistingAnnotationForRange:(_NSRange)a3 storage:(id)a4 contentNode:(id)a5 style:(int)a6 moc:(id)a7;
- (id)p_fetchedResultsControllerForFetchRequest:(id)a3 moc:(id)a4;
- (id)p_getReadingLocationWithMOC:(id)a3;
- (id)p_infoForNodeUniqueID:(id)a3 inContentNode:(id)a4;
- (id)p_keyForContentNode:(id)a3;
- (id)p_nonCurrentVersionPredicateWithPredicate:(id)a3;
- (id)p_nonOrphanedRangeAnnotationPredicateWithPredicate:(id)a3;
- (id)p_nonSponsoredAnnotationRequest;
- (id)p_nonSponsoredPredicateWithDocumentRoot:(id)a3;
- (id)p_pointAnnotationPredicateWithPredicate:(id)a3;
- (id)p_rangeAnnotationPredicateWithPredicate:(id)a3;
- (id)p_sortedAssetIDVersionsWithMoc:(id)a3;
- (id)p_storageAnnotationForUUID:(id)a3 includeDeleted:(BOOL)a4 moc:(id)a5;
- (id)placeholder;
- (id)placeholderFetchRequest;
- (id)readingProgress;
- (id)readingProgressHighwaterMark;
- (id)temporaryAnnotationForStorage:(id)a3 contentNode:(id)a4 withRange:(_NSRange)a5 style:(int)a6;
- (id)temporaryAnnotationForStorage:(id)a3 contentNode:(id)a4 withRange:(_NSRange)a5 style:(int)a6 chapterTitle:(id)a7;
- (int)currentAnnotationStyle;
- (unint64_t)mocRevision;
- (unint64_t)nonOrphanedAnnotationCount;
- (unint64_t)numberOfBookmarks;
- (unint64_t)p_absolutePageIndexForCharacterIndex:(unint64_t)a3 withStorage:(id)a4 contentNode:(id)a5;
- (void)_unbookmarkBookmarks:(id)a3;
- (void)bookmarkAbsolutePhysicalPage:(unint64_t)a3 anchor:(id)a4;
- (void)bookmarkPageInfo:(id)a3 anchor:(id)a4;
- (void)dealloc;
- (void)destroyAnnotation:(id)a3 undoContext:(id)a4;
- (void)destroyAnnotations:(id)a3 undoContext:(id)a4;
- (void)destroyBookmarkForIdentifier:(id)a3;
- (void)ensureNonSponsoredAnnotationsAreMigrated;
- (void)p_addVersioningPropertiesAE:(id)a3;
- (void)p_beginIgnoringWritability;
- (void)p_clearUndoStack;
- (void)p_closeActionGroupWithMoc:(id)a3;
- (void)p_closeUndoGroup;
- (void)p_commitChangesWithMoc:(id)a3;
- (void)p_endIgnoringWritability;
- (void)p_invalidateCaches;
- (void)p_managedObjectContextDidSaveNotification:(id)a3;
- (void)p_migrateAEAnnotation:(id)a3 inContentNode:(id)a4 moc:(id)a5;
- (void)p_openActionGroup;
- (void)p_openUndoGroupWithContext:(id)a3 actionName:(id)a4;
- (void)p_orphanAEAnnotation:(id)a3 moc:(id)a4;
- (void)p_performAction:(id)a3 moc:(id)a4;
- (void)p_performAction:(id)a3 undoable:(BOOL)a4 moc:(id)a5;
- (void)p_performUndoableAction:(id)a3 moc:(id)a4;
- (void)p_processChangeList:(id)a3 moc:(id)a4;
- (void)p_redoWithUndoGroup:(id)a3;
- (void)p_registerAnnotationObserver:(id)a3 forKey:(id)a4;
- (void)p_undoWithUndoGroup:(id)a3;
- (void)p_unregisterAnnotationObserver:(id)a3 forKey:(id)a4;
- (void)p_upgradeAEAnnotation:(id)a3 moc:(id)a4;
- (void)registerAnnotationObserver:(id)a3 forContentNode:(id)a4;
- (void)registerAnnotationUndoObserver:(id)a3;
- (void)registerBookmarkObserver:(id)a3;
- (void)registerWithUndoManager:(id)a3;
- (void)removeBookmark:(id)a3;
- (void)rescueDanglingAnnotationsWithDocumentRoot:(id)a3;
- (void)setAnnotationsReadEnabled:(BOOL)a3;
- (void)setAnnotationsWriteEnabled:(BOOL)a3;
- (void)setBasePredicate:(id)a3;
- (void)setCurrentAnnotationStyle:(int)a3;
- (void)setDocumentNavModel:(id)a3;
- (void)setDocumentRoot:(id)a3;
- (void)setGlobalPredicate:(id)a3;
- (void)setLastCommitMoc:(id)a3;
- (void)setManagedObjectContextSaveObserver:(id)a3;
- (void)setNonCurrentVersionPredicate:(id)a3;
- (void)setNonOrphanedPredicate:(id)a3;
- (void)setNonOrphanedRangePredicate:(id)a3;
- (void)setNonSponsoredNonOrphanedPredicate:(id)a3;
- (void)setNonSponsoredPredicate:(id)a3;
- (void)setOrphanedPredicate:(id)a3;
- (void)setOrphanedRangePredicate:(id)a3;
- (void)setPlaceholder:(id)a3 pageHistoryDictionary:(id)a4 withContentNode:(id)a5;
- (void)setPointPredicate:(id)a3;
- (void)setRangePredicate:(id)a3;
- (void)teardown;
- (void)unbookmarkPageInfo:(id)a3 absolutePageIndex:(unint64_t)a4;
- (void)unregisterAnnotationObserver:(id)a3 forContentNode:(id)a4;
- (void)unregisterAnnotationUndoObserver:(id)a3;
- (void)unregisterBookmarkObserver:(id)a3;
- (void)unregisterWithUndoManager:(id)a3;
@end

@implementation THAnnotationController

- (THAnnotationController)initWithAnnotationProvider:(id)a3 documentNavigationModel:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)THAnnotationController;
  v6 = [(THAnnotationController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->mCurrentStyle = 3;
    v6->mAnnotationProvider = (AEAnnotationProvider *)a3;
    [(THAnnotationController *)v7 setDocumentNavModel:a4];
    -[THAnnotationController setDocumentRoot:](v7, "setDocumentRoot:", [a4 documentRoot]);
    v7->mObservers = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
    v7->mCachedAnnotations = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->mAEAnnotationManagedObjectIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->mAnnotationCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(THAnnotationController *)v7 setManagedObjectContextSaveObserver:[+[NSNotificationCenter defaultCenter] addNonBlockingObserver:v7 selector:"p_managedObjectContextDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:0]];
    [(THAnnotationController *)v7 setBasePredicate:+[NSPredicate predicateWithFormat:@"(annotationAssetID == %@) && (annotationDeleted == NO)", [(THAnnotationController *)v7 annotationID]]];
    v8 = [(THAnnotationController *)v7 basePredicate];
    -[THAnnotationController setNonCurrentVersionPredicate:](v7, "setNonCurrentVersionPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"((%K != %@) || (%K==nil))", kAEAnnotationAssetVersionKey, [(THBookVersion *)[(THDocumentProperties *)[(THDocumentRoot *)[(THAnnotationController *)v7 documentRoot] properties] bookVersion] versionString],
            kAEAnnotationAssetVersionKey),
          0)));
    [(THAnnotationController *)v7 setRangePredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)v7 basePredicate], +[NSPredicate predicateWithFormat:@"(annotationType==%d)", 2], 0))];
    [(THAnnotationController *)v7 setPointPredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)v7 basePredicate], +[NSPredicate predicateWithFormat:@"(annotationType==%d)", 1], 0))];
    [(THAnnotationController *)v7 setGlobalPredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)v7 basePredicate], +[NSPredicate predicateWithFormat:@"(annotationType==%d)", 3], 0))];
    [(THAnnotationController *)v7 setNonOrphanedPredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)v7 basePredicate], +[NSPredicate predicateWithFormat:@"(annotationLocation!=nil)"], 0))];
    [(THAnnotationController *)v7 setNonOrphanedRangePredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)v7 nonOrphanedPredicate], +[NSPredicate predicateWithFormat:@"(annotationType==%d)", 2], 0))];
    -[THAnnotationController setNonSponsoredNonOrphanedPredicate:](v7, "setNonSponsoredNonOrphanedPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController nonOrphanedPredicate](v7, "nonOrphanedPredicate"), -[THAnnotationController p_nonSponsoredPredicateWithDocumentRoot:](v7, "p_nonSponsoredPredicateWithDocumentRoot:", [a4 documentRoot]), 0)));
    [(THAnnotationController *)v7 setOrphanedPredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)v7 basePredicate], +[NSPredicate predicateWithFormat:@"(annotationLocation==nil)"], 0))];
    [(THAnnotationController *)v7 setOrphanedRangePredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)v7 orphanedPredicate], +[NSPredicate predicateWithFormat:@"(annotationType==%d)", 2], 0))];
    -[THAnnotationController setNonSponsoredPredicate:](v7, "setNonSponsoredPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController basePredicate](v7, "basePredicate"), -[THAnnotationController p_nonSponsoredPredicateWithDocumentRoot:](v7, "p_nonSponsoredPredicateWithDocumentRoot:", [a4 documentRoot]), 0)));
    [(THAnnotationController *)v7 setAnnotationsReadEnabled:1];
    [(THAnnotationController *)v7 setAnnotationsWriteEnabled:1];
  }
  return v7;
}

- (void)teardown
{
  self->mObservers = 0;
  self->mBookmarkObservers = 0;

  self->mUndoObservers = 0;
  if (self->mUndoManager) {
    -[THAnnotationController unregisterWithUndoManager:](self, "unregisterWithUndoManager:");
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:[(THAnnotationController *)self managedObjectContextSaveObserver]];

  [(THAnnotationController *)self setManagedObjectContextSaveObserver:0];
}

- (void)dealloc
{
  [(THAnnotationController *)self teardown];
  [(THAnnotationController *)self setDocumentRoot:0];
  [(THAnnotationController *)self setDocumentNavModel:0];
  [(THAnnotationController *)self setBasePredicate:0];
  [(THAnnotationController *)self setNonOrphanedPredicate:0];
  [(THAnnotationController *)self setOrphanedPredicate:0];
  [(THAnnotationController *)self setRangePredicate:0];
  [(THAnnotationController *)self setPointPredicate:0];
  [(THAnnotationController *)self setGlobalPredicate:0];
  [(THAnnotationController *)self setNonCurrentVersionPredicate:0];
  [(THAnnotationController *)self setNonOrphanedRangePredicate:0];
  [(THAnnotationController *)self setOrphanedRangePredicate:0];
  [(THAnnotationController *)self setNonSponsoredPredicate:0];
  [(THAnnotationController *)self setNonSponsoredNonOrphanedPredicate:0];
  [(THAnnotationController *)self setLastCommitMoc:0];
  if (self->mObservers) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationController dealloc]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:591 description:@"someone forgot to call -teardown"];
  }

  self->mAnnotationProvider = 0;
  self->mAnnotationID = 0;

  self->mObservers = 0;
  self->mBookmarkObservers = 0;

  self->mCachedAnnotations = 0;
  self->mAEAnnotationManagedObjectIDs = 0;

  self->mAnnotationCache = 0;
  if (self->mCurrentUndoGroup || self->mCurrentChangeList) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:600 description:@"should not be deallocated with open groups"];
  }
  if (self->mUndoObservers || self->mUndoManager) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:601 description:@"undo manager and observers should have been released during teardown"];
  }
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationController;
  [(THAnnotationController *)&v3 dealloc];
}

- (void)p_managedObjectContextDidSaveNotification:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_managedObjectContextDidSaveNotification:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:608 description:@"This operation must only be performed on the main thread."];
  }
  objc_opt_class();
  [a3 object];
  v5 = (void *)TSUDynamicCast();
  if ([v5 sessionContextType] == 2)
  {
    id v6 = [v5 persistentStoreCoordinator];
    if (v6 == [(AEAnnotationProvider *)self->mAnnotationProvider persistentStoreCoordinator])
    {
      objc_sync_enter(self);
      [(THAnnotationController *)self p_invalidateCaches];
      objc_sync_exit(self);
      [(THAnnotationController *)self p_clearUndoStack];
    }
  }
}

- (void)p_commitChangesWithMoc:(id)a3
{
}

- (void)p_invalidateCaches
{
  [(NSMutableDictionary *)self->mCachedAnnotations removeAllObjects];
  [(NSMutableDictionary *)self->mAEAnnotationManagedObjectIDs removeAllObjects];
  [(NSMutableDictionary *)self->mAnnotationCache removeAllObjects];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v3 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] navigationModel] contentNodes];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v9 = [(THAnnotationController *)self p_keyForContentNode:v8];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v10 = [(TSURetainedPointerKeyDictionary *)self->mObservers objectForKey:v9];
        id v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) annotationsUpdatedForContentNode:v8];
            }
            id v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v12);
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v5);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = [(TSURetainedPointerKeyDictionary *)self->mObservers objectForKey:@"THMacAnnotationLostOrphans", 0];
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)k) annotationsUpdatedForContentNode:0];
      }
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (id)p_keyForContentNode:(id)a3
{
  if (a3) {
    return [a3 nodeGUID];
  }
  else {
    return @"THMacAnnotationLostOrphans";
  }
}

- (id)annotationID
{
  id result = self->mAnnotationID;
  if (!result)
  {
    id result = [(THBookDescription *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] bookDescription] annotationID];
    self->mAnnotationID = (NSString *)result;
    if (!result)
    {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THAnnotationController annotationID]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:682 description:@"invalid nil value for '%s'", "mAnnotationID"];
      return self->mAnnotationID;
    }
  }
  return result;
}

- (id)p_annotationsForFetchRequest:(id)a3 moc:(id)a4 migrateIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  if (![(THAnnotationController *)self annotationsReadEnabled]) {
    return 0;
  }
  id v21 = 0;
  id v9 = [a4 executeFetchRequest:a3 error:&v21];
  if (v21)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"];
    [v10 handleFailureInFunction:v11, v12, 708, @"Error fetching exceptions: %@", [v21 description]];
  }
  if (v5)
  {
    [(THAnnotationController *)self p_openActionGroup];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v13 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v9);
          }
          [(THAnnotationController *)self p_migrateAEAnnotationIfNecessary:*(void *)(*((void *)&v17 + 1) + 8 * (void)v15) moc:a4];
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }
    [(THAnnotationController *)self p_closeActionGroupWithMoc:a4];
  }
  return v9;
}

- (id)p_fetchedResultsControllerForFetchRequest:(id)a3 moc:(id)a4
{
  if (![(THAnnotationController *)self annotationsReadEnabled]) {
    return 0;
  }
  id v6 = [objc_alloc((Class)IMUbiquitousFetchedResultsController) initWithFetchRequest:a3 managedObjectContext:a4 sectionNameKeyPath:0 cacheName:0];

  return v6;
}

- (id)p_nonSponsoredPredicateWithDocumentRoot:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  objc_msgSend(objc_msgSend(a3, "rootNode"), "addMappingFromGUIDToNodeToDictionary:", v4);
  id v5 = [v4 allKeys];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3052000000;
  id v12 = sub_9669C;
  id v13 = sub_966AC;
  id v14 = 0;
  id v14 = +[NSMutableArray array];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_966B8;
  v8[3] = &unk_458698;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = +[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", +[NSCompoundPredicate orPredicateWithSubpredicates:v10[5]]);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)p_rangeAnnotationPredicateWithPredicate:(id)a3
{
  objc_super v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)self rangePredicate], a3, 0);

  return +[NSCompoundPredicate andPredicateWithSubpredicates:v3];
}

- (id)p_pointAnnotationPredicateWithPredicate:(id)a3
{
  objc_super v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)self pointPredicate], a3, 0);

  return +[NSCompoundPredicate andPredicateWithSubpredicates:v3];
}

- (id)p_nonCurrentVersionPredicateWithPredicate:(id)a3
{
  objc_super v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)self nonCurrentVersionPredicate], a3, 0);

  return +[NSCompoundPredicate andPredicateWithSubpredicates:v3];
}

- (id)p_nonOrphanedRangeAnnotationPredicateWithPredicate:(id)a3
{
  objc_super v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [(THAnnotationController *)self nonOrphanedRangePredicate], a3, 0);

  return +[NSCompoundPredicate andPredicateWithSubpredicates:v3];
}

- (id)p_annotationRequestForAnnotationUUID:(id)a3 includeDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc((Class)NSFetchRequest);
  id v8 = [v7 initWithEntityName:kAEAnnotationEntityName];
  if (v4) {
    uint64_t v9 = +[NSPredicate predicateWithFormat:@"(annotationAssetID == %@)", [(THAnnotationController *)self annotationID]];
  }
  else {
    uint64_t v9 = [(THAnnotationController *)self basePredicate];
  }
  [v8 setPredicate:+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(annotationUuid == %@)", a3), 0))];
  return v8;
}

- (id)p_storageAnnotationForUUID:(id)a3 includeDeleted:(BOOL)a4 moc:(id)a5
{
  if (!a3) {
    return 0;
  }
  BOOL v6 = a4;
  if (![a3 length]) {
    return 0;
  }
  id v15 = 0;
  id v9 = [a5 executeFetchRequest:[self p_annotationRequestForAnnotationUUID:a3 includeDeleted:v6] error:&v15];
  if (v15)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_storageAnnotationForUUID:includeDeleted:moc:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"];
    [v10 handleFailureInFunction:v11, v12, 810, @"Error fetching execeptions: %@", [v15 description]];
  }
  if (![v9 count]) {
    return 0;
  }
  id v13 = [v9 objectAtIndex:0];
  if ([v9 count] != (char *)&dword_0 + 1) {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_storageAnnotationForUUID:includeDeleted:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 814, @"Found %lu annotations matching UUID %@.", objc_msgSend(v9, "count"), a3);
  }
  return v13;
}

- (id)annotationRequestForStorageID:(id)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  id v6 = [v5 initWithEntityName:kAEAnnotationEntityName];
  [v6 setPredicate:-[THAnnotationController p_nonOrphanedRangeAnnotationPredicateWithPredicate:](self, "p_nonOrphanedRangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(plStorageUUID == %@)", a3))];
  [v6 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plLocationRangeStart" ascending:0]]];
  return v6;
}

- (id)p_annotationRequestForStorageID:(id)a3 intersectingRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = objc_alloc((Class)NSFetchRequest);
  id v9 = [v8 initWithEntityName:kAEAnnotationEntityName];
  [v9 setPredicate:-[THAnnotationController p_nonOrphanedRangeAnnotationPredicateWithPredicate:](self, "p_nonOrphanedRangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(plStorageUUID == %@) && (plLocationRangeStart < %d) && (plLocationRangeEnd >= %d)", a3, location + length, location))];
  [v9 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plLocationRangeStart" ascending:0]]];
  return v9;
}

- (id)p_annotationRequestForAllNotesWithPredicate:(id)a3
{
  id v4 = objc_alloc((Class)NSFetchRequest);
  id v5 = [v4 initWithEntityName:kAEAnnotationEntityName];
  [v5 setPredicate:a3];
  [v5 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plLocationRangeStart" ascending:0]]];
  return v5;
}

- (id)annotationRequestForAllNotes
{
  objc_super v3 = [(THAnnotationController *)self rangePredicate];

  return [(THAnnotationController *)self p_annotationRequestForAllNotesWithPredicate:v3];
}

- (id)annotationRequestForNonOrphanedNotes
{
  objc_super v3 = [(THAnnotationController *)self nonOrphanedRangePredicate];

  return [(THAnnotationController *)self p_annotationRequestForAllNotesWithPredicate:v3];
}

- (id)annotationRequestForOrphanedNotes
{
  objc_super v3 = [(THAnnotationController *)self orphanedRangePredicate];

  return [(THAnnotationController *)self p_annotationRequestForAllNotesWithPredicate:v3];
}

- (id)annotationRequestForNonSponsoredNonOrphaned
{
  objc_super v3 = [(THAnnotationController *)self nonSponsoredNonOrphanedPredicate];

  return [(THAnnotationController *)self p_annotationRequestForAllNotesWithPredicate:v3];
}

- (id)p_annotationRequestForSearchText:(id)a3 conjoinedWithPredicate:(id)a4
{
  id v6 = objc_alloc((Class)NSFetchRequest);
  id v7 = [v6 initWithEntityName:kAEAnnotationEntityName];
  objc_msgSend(v7, "setPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a4, +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"annotationRepresentativeText contains[cd] %@",
              a3),
            +[NSPredicate predicateWithFormat:@"annotationNote contains[cd] %@", a3], 0)), 0)));
  [v7 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plLocationRangeStart" ascending:0]]];

  return v7;
}

- (id)annotationRequestForSearchText:(id)a3
{
  id v5 = [(THAnnotationController *)self rangePredicate];

  return [(THAnnotationController *)self p_annotationRequestForSearchText:a3 conjoinedWithPredicate:v5];
}

- (id)annotationRequestForNonOrphanedSearchText:(id)a3
{
  id v5 = [(THAnnotationController *)self nonOrphanedRangePredicate];

  return [(THAnnotationController *)self p_annotationRequestForSearchText:a3 conjoinedWithPredicate:v5];
}

- (id)annotationRequestForOrphanedSearchText:(id)a3
{
  id v5 = [(THAnnotationController *)self orphanedRangePredicate];

  return [(THAnnotationController *)self p_annotationRequestForSearchText:a3 conjoinedWithPredicate:v5];
}

- (id)p_nonSponsoredAnnotationRequest
{
  id v3 = objc_alloc((Class)NSFetchRequest);
  id v4 = [v3 initWithEntityName:kAEAnnotationEntityName];
  [v4 setPredicate:[self nonSponsoredPredicate]];
  [v4 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plLocationRangeStart" ascending:0]]];
  return v4;
}

- (id)p_annotationRequestForContentNode:(id)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  id v6 = [v5 initWithEntityName:kAEAnnotationEntityName];
  [v6 setPredicate:-[THAnnotationController p_rangeAnnotationPredicateWithPredicate:](self, "p_rangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(plStorageUUID BEGINSWITH[n] %@)", objc_msgSend(a3, "nodeGUID")))];
  [v6 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plLocationRangeStart" ascending:0]]];
  return v6;
}

- (id)p_bookmarkSortDescriptorsAscending:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THBookDescription *)[(THDocumentRoot *)self->mDocumentRoot bookDescription] isEpub])
  {
    id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"annotationLocation" ascending:v3 selector:"localizedStandardCompare:"];
    id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"annotationCreationDate" ascending:v3];
    v9[0] = v4;
    v9[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v9 count:2];
  }
  else
  {
    id v8 = +[NSSortDescriptor sortDescriptorWithKey:@"plAbsolutePhysicalLocation" ascending:v3];
    return +[NSArray arrayWithObjects:&v8 count:1];
  }
  return v6;
}

- (id)p_bookmarkRequestForContentNode:(id)a3
{
  id v5 = objc_alloc((Class)NSFetchRequest);
  id v6 = [v5 initWithEntityName:kAEAnnotationEntityName];
  [v6 setPredicate:[self p_pointAnnotationPredicateWithPredicate:[NSPredicate predicateWithFormat:@"(plStorageUUID BEGINSWITH[n] %@)", [a3 nodeGUID]]]];
  [v6 setSortDescriptors:[self p_bookmarkSortDescriptorsAscending:0]];
  return v6;
}

- (id)p_annotationRequestForContentNode:(id)a3 withSearchText:(id)a4
{
  id v7 = objc_alloc((Class)NSFetchRequest);
  id v8 = [v7 initWithEntityName:kAEAnnotationEntityName];
  objc_msgSend(v8, "setPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController p_rangeAnnotationPredicateWithPredicate:](self, "p_rangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"(plStorageUUID BEGINSWITH[n] %@)", objc_msgSend(a3, "nodeGUID"))), +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:",
          +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"annotationRepresentativeText contains[cd] %@", a4), +[NSPredicate predicateWithFormat:@"annotationNote contains[cd] %@", a4], 0)), 0)));
  [v8 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plLocationRangeStart" ascending:0]]];

  return v8;
}

- (unint64_t)p_absolutePageIndexForCharacterIndex:(unint64_t)a3 withStorage:(id)a4 contentNode:(id)a5
{
  id v7 = [a5 relativePageIndexForCharacterIndex:a3 forInfo:a4];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v9 = v7;
  id v10 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] context]];

  return (unint64_t)[a5 absolutePageIndexForRelativePageIndex:v9 forPresentationType:v10];
}

- (BOOL)p_annotationNeedsMigration:(id)a3
{
  id v4 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", [a3 annotationBookVersion]);
  BOOL v5 = [(THBookVersion *)[(THDocumentProperties *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] properties] bookVersion] isValid]&& (![(THBookVersion *)v4 isValid]|| [(THBookVersion *)[(THDocumentProperties *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] properties] bookVersion] isStrictlyNewerThanBookVersion:v4]);

  return v5;
}

- (BOOL)p_cachedAnnotationNeedsMigration:(id)a3
{
  id v4 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", [a3 annotationBookVersion]);
  BOOL v5 = [(THBookVersion *)[(THDocumentProperties *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] properties] bookVersion] isValid]&& (![(THBookVersion *)v4 isValid]|| [(THBookVersion *)[(THDocumentProperties *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] properties] bookVersion] isStrictlyNewerThanBookVersion:v4]);

  return v5;
}

- (BOOL)p_annotationNeedsMigrationForAnnotationSchemaVersion:(id)a3
{
  id v3 = [a3 annotationVersion];
  return [v3 compare:kAEAnnotationVersion_4 options:64] == (id)-1;
}

- (id)contentNodeForAnnotation:(id)a3
{
  id v4 = [(THAnnotationController *)self documentNavModel];
  id v5 = [a3 annotationContentNodeID];

  return [(THDocumentNavigationModel *)v4 contentNodeForGUID:v5];
}

- (id)p_allBookmarksFetchRequest
{
  id v3 = objc_alloc((Class)NSFetchRequest);
  id v4 = [v3 initWithEntityName:kAEAnnotationEntityName];
  [v4 setPredicate:[self pointPredicate]];
  [v4 setSortDescriptors:[self p_bookmarkSortDescriptorsAscending:1]];

  return v4;
}

- (id)allBookmarksFetchedResultsController
{
  id v3 = [(THAnnotationController *)self p_allBookmarksFetchRequest];
  id v4 = [v3 predicate];
  [v3 setPredicate:[self p_nonCurrentVersionPredicateWithPredicate:[v3 predicate]]];
  id v5 = [(AEAnnotationProvider *)self->mAnnotationProvider uiManagedObjectContext];
  [(THAnnotationController *)self p_annotationsForFetchRequest:v3 moc:v5 migrateIfNecessary:1];
  [v3 setPredicate:v4];

  return [(THAnnotationController *)self p_fetchedResultsControllerForFetchRequest:v3 moc:v5];
}

- (void)bookmarkAbsolutePhysicalPage:(unint64_t)a3 anchor:(id)a4
{
  id v7 = [a4 storage];
  id v8 = (char *)[a4 range];
  id v10 = v8;
  if (v9) {
    uint64_t v11 = v9 - (&v8[v9] == (char *)[v7 length] + 1);
  }
  else {
    uint64_t v11 = 0;
  }
  mAnnotationProvider = self->mAnnotationProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_979BC;
  v13[3] = &unk_4586C0;
  v13[8] = v10;
  v13[9] = v11;
  v13[4] = self;
  v13[5] = v7;
  v13[6] = a4;
  v13[7] = a3;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v13];
}

- (void)_unbookmarkBookmarks:(id)a3
{
  if (![a3 count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController _unbookmarkBookmarks:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:1046 description:@"Trying to remove bookmark from page without bookmark"];
  }
  [(THAnnotationController *)self p_openActionGroup];
  mAnnotationProvider = self->mAnnotationProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_97B38;
  v6[3] = &unk_4586E8;
  v6[4] = a3;
  v6[5] = self;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v6];
}

- (void)unbookmarkPageInfo:(id)a3 absolutePageIndex:(unint64_t)a4
{
  id v7 = [a3 bodyStorageRange];
  uint64_t v9 = v8;
  id v10 = [a3 parent];
  if (!v10)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unbookmarkPageInfo:absolutePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:1067 description:@"Invalid index."];
    }
    id v10 = [(THDocumentNavigationModel *)self->mDocumentNavModel contentNodeForAbsolutePageIndex:a4];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_97D94;
  v11[3] = &unk_458708;
  v11[4] = a4;
  v11[5] = v7;
  v11[6] = v9;
  -[THAnnotationController _unbookmarkBookmarks:](self, "_unbookmarkBookmarks:", objc_msgSend(objc_msgSend(-[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", v10), "bookmarkAnnotations"), "tsu_arrayOfObjectsPassingTest:", v11));
}

- (void)bookmarkPageInfo:(id)a3 anchor:(id)a4
{
  id v6 = [a4 storage:a3];
  id v7 = (char *)[a4 range];
  uint64_t v9 = v7;
  if (v8) {
    uint64_t v10 = v8 - (&v7[v8] == (char *)[v6 length] + 1);
  }
  else {
    uint64_t v10 = 0;
  }
  mAnnotationProvider = self->mAnnotationProvider;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_97EE4;
  v12[3] = &unk_458730;
  v12[7] = v9;
  v12[8] = v10;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = a4;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v12];
}

- (void)removeBookmark:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    [(THAnnotationController *)self _unbookmarkBookmarks:+[NSArray arrayWithObjects:&v3 count:1]];
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController removeBookmark:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:1111 description:@"invalid nil value for '%s'", "bookmark"];
  }
}

- (BOOL)isAbsolutePhysicalPageBookmarked:(unint64_t)a3
{
  unsigned int v5 = [(THAnnotationController *)self annotationsReadEnabled];
  if (v5)
  {
    id v6 = [[self cachedAnnotationsForContentNode:[self contentNodeForAbsolutePageIndex:a3]] bookmarkAbsolutePhysicalPageIndexSet];
    LOBYTE(v5) = [v6 containsIndex:a3];
  }
  return v5;
}

- (BOOL)_isPageInfoAnnotated:(id)a3 checkBookmarks:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(THAnnotationController *)self annotationsReadEnabled];
  LOBYTE(v8) = 0;
  if (a3 && v7)
  {
    id v9 = [a3 bodyStorageRange];
    if (NSInvalidRange[0] == v9 && NSInvalidRange[1] == v10)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      id v12 = v9;
      id v13 = v10;
      id v14 = -[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", [a3 parent]);
      if (v4) {
        id v15 = [v14 bookmarkAnnotations];
      }
      else {
        id v15 = [v14 annotationsForStorage:[a3 bodyStorage]];
      }
      id v16 = v15;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v8 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8)
      {
        id v17 = v8;
        uint64_t v18 = *(void *)v25;
        unint64_t v19 = (unint64_t)v13 + (void)v12;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v16);
            }
            id v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) annotationStorageRange];
            if (v12 <= v21 && v19 >= (unint64_t)v21 + 1)
            {
              LOBYTE(v8) = 1;
              return (char)v8;
            }
          }
          id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
          LOBYTE(v8) = 0;
          if (v17) {
            continue;
          }
          break;
        }
      }
    }
  }
  return (char)v8;
}

- (BOOL)isPageInfoBookmarked:(id)a3
{
  if (a3) {
    return -[THAnnotationController _isPageInfoAnnotated:checkBookmarks:](self, "_isPageInfoAnnotated:checkBookmarks:");
  }
  else {
    return 0;
  }
}

- (BOOL)isAbsolutePhysicalPageHighlightedWithNotes:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || ![(THAnnotationController *)self annotationsReadEnabled]) {
    return 0;
  }
  id v5 = [(THAnnotationController *)self cachedAnnotationsForContentNode:[(THDocumentNavigationModel *)self->mDocumentNavModel contentNodeForAbsolutePageIndex:a3]];

  return [v5 hasAnnotationWithNoteInAbsolutePhysicalPageIndex:a3];
}

- (BOOL)isPageInfoHighlightedWithNotes:(id)a3
{
  if (!a3 || ![(THAnnotationController *)self annotationsReadEnabled]) {
    return 0;
  }
  id v5 = -[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", [a3 parent]);

  return [v5 hasAnnotationWithNoteOnPageInfo:a3];
}

- (void)registerBookmarkObserver:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    mBookmarkObservers = self->mBookmarkObservers;
    if (!mBookmarkObservers)
    {
      mBookmarkObservers = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
      self->mBookmarkObservers = mBookmarkObservers;
    }
    [(TSUMutablePointerSet *)mBookmarkObservers addObject:a3];
    objc_sync_exit(self);
  }
}

- (void)unregisterBookmarkObserver:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    [(TSUMutablePointerSet *)self->mBookmarkObservers removeObject:a3];
    if (![(TSUMutablePointerSet *)self->mBookmarkObservers count])
    {

      self->mBookmarkObservers = 0;
    }
    objc_sync_exit(self);
  }
}

- (unint64_t)numberOfBookmarks
{
  id v3 = [(THDocumentNavigationModel *)self->mDocumentNavModel contentNodes];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v3);
      }
      v6 += (unint64_t)objc_msgSend(objc_msgSend(-[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", *(void *)(*((void *)&v10 + 1) + 8 * i)), "bookmarkAnnotations"), "count");
    }
    id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (id)allBookmarkIdentifiers
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3052000000;
  long long v13 = sub_9669C;
  id v14 = sub_966AC;
  uint64_t v15 = 0;
  objc_sync_enter(self);
  id v3 = [(NSMutableDictionary *)self->mAnnotationCache objectForKey:@"THMacAnnotationAllBookmarks"];
  v11[5] = (uint64_t)v3;
  objc_sync_exit(self);
  id v4 = (void *)v11[5];
  if (!v4)
  {
    mAnnotationProvider = self->mAnnotationProvider;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_98694;
    v9[3] = &unk_458758;
    v9[4] = self;
    v9[5] = &v10;
    [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v9];
    id v6 = (id)v11[5];
    id v4 = (void *)v11[5];
  }
  id v7 = [v4 bookmarkAnnotations];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)destroyBookmarkForIdentifier:(id)a3
{
  if (![(THAnnotationController *)self canModifyAnnotations]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController destroyBookmarkForIdentifier:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:1294 description:@"cannot modify annotations"];
  }
  uint64_t v4 = TSUCheckedProtocolCast();
  mAnnotationProvider = self->mAnnotationProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9884C;
  v6[3] = &unk_4586E8;
  v6[4] = self;
  v6[5] = v4;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v6];
}

- (void)rescueDanglingAnnotationsWithDocumentRoot:(id)a3
{
  mAnnotationProvider = self->mAnnotationProvider;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_98914;
  v4[3] = &unk_4586E8;
  v4[4] = self;
  v4[5] = a3;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v4];
}

- (id)placeholderFetchRequest
{
  id v3 = objc_alloc((Class)NSFetchRequest);
  id v4 = [v3 initWithEntityName:kAEAnnotationEntityName];
  [v4 setPredicate:[self globalPredicate]];
  [v4 setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"plAbsolutePhysicalLocation" ascending:1]]];

  return v4;
}

- (id)p_getReadingLocationWithMOC:(id)a3
{
  id v3 = [(THAnnotationController *)self p_annotationsForFetchRequest:[(THAnnotationController *)self placeholderFetchRequest] moc:a3 migrateIfNecessary:1];
  id result = [v3 count];
  if (result)
  {
    return [v3 objectAtIndex:0];
  }
  return result;
}

- (id)placeholder
{
  id v3 = 0;
  [(THAnnotationController *)self getPlaceholder:&v3 andPageHistory:0];
  return v3;
}

- (id)readingProgress
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_98CF8;
  v6[3] = &unk_458780;
  v6[4] = self;
  v6[5] = &v7;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v6];
  LODWORD(v3) = *((_DWORD *)v8 + 6);
  id v4 = +[NSNumber numberWithFloat:v3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)readingProgressHighwaterMark
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_98E0C;
  v6[3] = &unk_458780;
  v6[4] = self;
  v6[5] = &v7;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v6];
  LODWORD(v3) = *((_DWORD *)v8 + 6);
  id v4 = +[NSNumber numberWithFloat:v3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)getPlaceholder:(id *)a3 andPageHistory:(id *)a4
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController getPlaceholder:andPageHistory:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:1427 description:@"invalid nil value for '%s'", "placeholderHandle"];
  }
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3052000000;
  long long v23 = sub_9669C;
  long long v24 = sub_966AC;
  uint64_t v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  id v17 = sub_9669C;
  uint64_t v18 = sub_966AC;
  uint64_t v19 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_990B8;
  v13[3] = &unk_4587A8;
  v13[4] = self;
  v13[5] = &v20;
  v13[6] = &v14;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v13];
  id v8 = (id)v21[5];
  id v9 = (id)v15[5];
  if (a3)
  {
    int v10 = (THPageLocation *)v21[5];
    if (!v10)
    {
      if ([(THBookDescription *)[(THDocumentRoot *)self->mDocumentRoot bookDescription] isEpub])
      {
        id v11 = [(NSArray *)[(THDocumentNavigationModel *)self->mDocumentNavModel contentNodes] firstObject];
        int v10 = -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:]([THPageLocation alloc], "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", 0, 0, 0, [v11 nodeGUID], [v11 nodeGUID]);
        v21[5] = (uint64_t)v10;
      }
      else
      {
        int v10 = (THPageLocation *)v21[5];
      }
    }
    *a3 = v10;
  }
  if (a4) {
    *a4 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return a3 != 0;
}

- (void)setPlaceholder:(id)a3 pageHistoryDictionary:(id)a4 withContentNode:(id)a5
{
  id v9 = [(THAnnotationController *)self placeholderFetchRequest];
  id v10 = [(AEAnnotationProvider *)self->mAnnotationProvider uiManagedObjectContext];
  id v11 = [(THAnnotationController *)self p_annotationsForFetchRequest:v9 moc:v10 migrateIfNecessary:1];
  [(THAnnotationController *)self p_beginIgnoringWritability];
  [(THAnnotationController *)self p_openActionGroup];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_99454;
  v27[3] = &unk_4587D0;
  v27[4] = a3;
  v27[5] = self;
  v27[6] = v10;
  [v11 enumerateObjectsUsingBlock:v27];
  float v12 = 0.0;
  if (![(THBookDescription *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] bookDescription] isSample])
  {
    unint64_t v13 = [(THDocumentNavigationModel *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] navigationModel] pageCount];
    float v14 = (float)((unint64_t)[a3 absolutePhysicalPageIndex] + 1) / (float)v13;
    if (v14 > 1.0) {
      float v14 = 1.0;
    }
    float v12 = fmaxf(v14, 0.0);
  }
  if (a3)
  {
    if ([v11 count] && (id v15 = objc_msgSend(v11, "objectAtIndex:", 0)) != 0)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_994B0;
      v25[3] = &unk_4587F8;
      v25[4] = a3;
      v25[5] = a5;
      float v26 = v12;
      v25[6] = a4;
      v25[7] = self;
      id v16 = [(THAnnotationController *)self p_actionForUpdatingAnnotation:v15 withContentNode:a5 block:v25];
    }
    else
    {
      id v17 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] context]];
      objc_opt_class();
      [a5 infoForNodeUniqueID:[a3 storageUID] forPresentationType:v17];
      uint64_t v18 = TSUDynamicCast();
      uint64_t v19 = [(THAnnotationController *)self currentAnnotationStyle];
      id v20 = [a3 absolutePhysicalPageIndex];
      id v21 = [a3 range];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_99588;
      v23[3] = &unk_458820;
      v23[4] = a4;
      v23[5] = self;
      float v24 = v12;
      id v16 = -[THAnnotationController p_actionForInsertingAnnotationWithType:style:absolutePageIndex:range:storage:contentNode:updateBlock:](self, "p_actionForInsertingAnnotationWithType:style:absolutePageIndex:range:storage:contentNode:updateBlock:", 3, v19, v20, v21, v22, v18, a5, v23);
    }
    [(THAnnotationController *)self p_performAction:v16 moc:v10];
  }
  [(THAnnotationController *)self p_closeActionGroupWithMoc:v10];
  [(THAnnotationController *)self p_endIgnoringWritability];
}

- (id)p_allContentNodeAnnotations
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableDictionary dictionary];
  [(THModelNode *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] rootNode] addMappingFromGUIDToNodeToDictionary:v4];
  id v5 = [v4 allKeys];
  objc_sync_enter(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [(THAnnotationController *)self cachedAnnotationsForContentNode:[(THDocumentNavigationModel *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] navigationModel] contentNodeForGUID:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)]];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_997B8;
        v11[3] = &unk_458848;
        v11[4] = v3;
        [v9 enumerateAnnotationsWithBlock:v11];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  objc_sync_exit(self);
  return v3;
}

- (id)annotationWithUuid:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_99844;
  v4[3] = &unk_458870;
  v4[4] = a3;
  return [self p_allContentNodeAnnotations] tsu_firstObjectPassingTest:v4];
}

- (id)maxAnnotationAssetVersion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = sub_9669C;
  id v10 = sub_966AC;
  uint64_t v11 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9997C;
  v5[3] = &unk_458780;
  v5[4] = self;
  v5[5] = &v6;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)p_sortedAssetIDVersionsWithMoc:(id)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  float v24 = sub_9669C;
  uint64_t v25 = sub_966AC;
  uint64_t v26 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_99C04;
  v20[3] = &unk_458780;
  v20[4] = self;
  v20[5] = &v21;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v20];
  id v4 = (id)v22[5];
  id v5 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = (void *)v22[5];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = kAEAnnotationAssetVersionKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKey:v9];
        if (v11) {
          long long v12 = [[THBookVersion alloc] initWithString:v11];
        }
        else {
          long long v12 = +[THBookVersion newUnversionedBookVersion];
        }
        long long v13 = v12;
        [v5 addObject:v12];
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v7);
  }
  id v14 = [v5 sortedArrayUsingComparator:&stru_4588B0];
  _Block_object_dispose(&v21, 8);
  return v14;
}

- (void)ensureNonSponsoredAnnotationsAreMigrated
{
  mAnnotationProvider = self->mAnnotationProvider;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_99DD0;
  v3[3] = &unk_4588D8;
  v3[4] = self;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v3];
}

- (BOOL)p_migrateAEAnnotationIfNecessary:(id)a3 moc:(id)a4
{
  if (-[THAnnotationController p_annotationNeedsMigration:](self, "p_annotationNeedsMigration:"))
  {
    id v7 = -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", [a3 annotationContentNodeID]);
    if (v7) {
      [(THAnnotationController *)self p_migrateAEAnnotation:a3 inContentNode:v7 moc:a4];
    }
    else {
      [(THAnnotationController *)self p_orphanAEAnnotation:a3 moc:a4];
    }
  }
  else if (![(THAnnotationController *)self p_annotationNeedsMigrationForAnnotationSchemaVersion:a3]|| ![(THAnnotationController *)self p_ensureCFIForAEAnnotation:a3 moc:a4])
  {
    BOOL v8 = [(THAnnotationController *)self p_annotationNeedsMigrationForAnnotationSchemaVersion:a3];
    if (!v8) {
      return v8;
    }
  }
  [(THAnnotationController *)self p_upgradeAEAnnotation:a3 moc:a4];
  if ([a3 isOrphan]
    && ([a3 annotationType] == 1 || objc_msgSend(a3, "annotationType") == 3))
  {
    [(THAnnotationController *)self p_performAction:[(THAnnotationController *)self p_actionForDeletingAEAnnotation:a3] moc:a4];
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (void)p_migrateAEAnnotation:(id)a3 inContentNode:(id)a4 moc:(id)a5
{
  -[THAnnotationController p_infoForNodeUniqueID:inContentNode:](self, "p_infoForNodeUniqueID:inContentNode:", [a3 annotationStorageIDWithoutContentNodeID], a4);
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  if ([a3 isPlaceholder]) {
    [(THAnnotationController *)self p_performAction:[(THAnnotationController *)self p_actionForUpdatingAnnotation:a3 withBlock:&stru_458918] moc:a5];
  }
  if (!-[THAnnotationController p_migrateAEAnnotation:withinStorage:moc:](self, "p_migrateAEAnnotation:withinStorage:moc:", a3, v9, a5)&& (([a4 isBodyStorage:v9] & 1) != 0|| !-[THAnnotationController p_migrateAEAnnotation:fromStorage:toAnyNonBodyStorageInContentNode:moc:](self, "p_migrateAEAnnotation:fromStorage:toAnyNonBodyStorageInContentNode:moc:", a3, v9, a4, a5))&& !-[THAnnotationController p_migrateBookmarkOrPlaceholderAEAnnotation:inContentNode:moc:](self, "p_migrateBookmarkOrPlaceholderAEAnnotation:inContentNode:moc:", a3, a4, a5))
  {
    [(THAnnotationController *)self p_orphanAEAnnotation:a3 moc:a5];
  }
}

- (_NSRange)p_rangeOfAEAnnotation:(id)a3 inStorage:(id)a4
{
  if (a4)
  {
    id v6 = [a3 annotationRepresentativeText];
    id v7 = [a3 selectionPreContextText];
    id v8 = [a3 selectionPostContextText];
    id v9 = [a3 annotationStorageRange];
    NSUInteger v10 = (NSUInteger)[a4 closestMatchForString:v6 leftContext:v7 rightContext:v8 startCharIndex:v9];
  }
  else
  {
    NSUInteger v10 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v11 = 0;
  }
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)p_migrateAEAnnotation:(id)a3 withinStorage:(id)a4 moc:(id)a5
{
  id v8 = [(THAnnotationController *)self p_rangeOfAEAnnotation:a3 inStorage:a4];
  id v10 = v8;
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_9A1C4;
    v12[3] = &unk_458938;
    v12[4] = v8;
    v12[5] = v9;
    [(THAnnotationController *)self p_performAction:[(THAnnotationController *)self p_actionForUpdatingAnnotation:a3 withBlock:v12] moc:a5];
  }
  return v10 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)p_migrateAEAnnotation:(id)a3 fromStorage:(id)a4 toAnyNonBodyStorageInContentNode:(id)a5 moc:(id)a6
{
  id v7 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = [a5 storagesForAllPresentationTypes];
  NSUInteger v11 = (char *)[v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v11)
  {
    long long v12 = v11;
    id v32 = 0;
    id v33 = a3;
    uint64_t v13 = *(void *)v37;
    uint64_t v30 = 0;
    unint64_t v31 = 0xFFFFFFFFLL;
    id v28 = a6;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        id v15 = (id)TSUDynamicCast();
        if (v15) {
          BOOL v16 = v15 == a4;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          id v17 = v15;
          if (([v7 isBodyStorage:v15] & 1) == 0)
          {
            id v18 = v10;
            id v19 = v7;
            id v20 = [(THAnnotationController *)self p_rangeOfAEAnnotation:v33 inStorage:v17];
            if (v20 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
            {
              id v10 = v18;
            }
            else
            {
              uint64_t v22 = v20;
              uint64_t v23 = v21;
              float v24 = (char *)[v33 annotationStorageRange];
              uint64_t v25 = v23;
              uint64_t v26 = (char *)(v24 - v22);
              if (v22 >= v24) {
                uint64_t v26 = (char *)(v22 - v24);
              }
              id v7 = v19;
              id v10 = v18;
              if (!v32 || (unint64_t)v26 < v31)
              {
                uint64_t v30 = v25;
                unint64_t v31 = (unint64_t)v26;
                uint64_t v29 = (uint64_t)v22;
                id v32 = v17;
                if (!v26) {
                  goto LABEL_21;
                }
              }
            }
          }
        }
      }
      long long v12 = (char *)[v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    id v17 = v32;
    uint64_t v22 = (unsigned char *)v29;
    uint64_t v25 = v30;
    if (v32)
    {
LABEL_21:
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_9A424;
      v35[3] = &unk_458960;
      v35[4] = v7;
      v35[5] = v17;
      v35[6] = v22;
      v35[7] = v25;
      [(THAnnotationController *)self p_performAction:[(THAnnotationController *)self p_actionForUpdatingAnnotation:v33 withBlock:v35] moc:v28];
      LOBYTE(v11) = 1;
      return (char)v11;
    }
    LOBYTE(v11) = 0;
  }
  return (char)v11;
}

- (BOOL)p_ensureCFIForAEAnnotation:(id)a3 moc:(id)a4
{
  id v7 = -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", [a3 annotationContentNodeID]);
  if (v7)
  {
    id v8 = v7;
    -[THAnnotationController p_infoForNodeUniqueID:inContentNode:](self, "p_infoForNodeUniqueID:inContentNode:", [a3 annotationStorageIDWithoutContentNodeID], v7);
    objc_opt_class();
    id v7 = (id)TSUDynamicCast();
    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_9A57C;
      v10[3] = &unk_458988;
      v10[4] = v8;
      v10[5] = v7;
      [(THAnnotationController *)self p_performAction:[(THAnnotationController *)self p_actionForUpdatingAnnotation:a3 withBlock:v10] moc:a4];
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (BOOL)p_migrateBookmarkOrPlaceholderAEAnnotation:(id)a3 inContentNode:(id)a4 moc:(id)a5
{
  if (([a3 isBookmark] & 1) != 0
    || (unsigned int v9 = [a3 isPlaceholder]) != 0)
  {
    id v10 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] context]];
    id v11 = [a3 contentNodeRelativePageIndex];
    if (v11 >= [a4 pageCountForPresentationType:v10])
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      id v12 = [a4 absolutePageIndexForRelativePageIndex:v11];
      id v13 = [a4 pageAtRelativeIndex:v11 forPresentationType:v10];
      id v14 = [v13 pageStartCharIndex];
      if ([v13 pageStartCharIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v15 = 0;
      }
      else
      {
        BOOL v16 = [v13 pageEndCharIndex];
        int64_t v15 = v16 - (unsigned char *)[v13 pageStartCharIndex];
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_9A780;
      v18[3] = &unk_4589A8;
      v18[4] = v12;
      v18[5] = v14;
      v18[6] = v15;
      [(THAnnotationController *)self p_performAction:[(THAnnotationController *)self p_actionForUpdatingAnnotation:a3 withBlock:v18] moc:a5];
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)p_orphanAEAnnotation:(id)a3 moc:(id)a4
{
  id v6 = [(THAnnotationController *)self p_actionForUpdatingAnnotation:a3 withBlock:&stru_4589C8];

  [(THAnnotationController *)self p_performAction:v6 moc:a4];
}

- (void)p_addVersioningPropertiesAE:(id)a3
{
  [a3 setAnnotationBookVersion:[-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](self, "documentRoot"), "properties"), "bookVersion") versionString]];
  uint64_t v4 = kAEAnnotationVersion_4;

  [a3 setAnnotationVersion:v4];
}

- (void)p_upgradeAEAnnotation:(id)a3 moc:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9A908;
  v4[3] = &unk_4589F0;
  v4[4] = self;
  [(THAnnotationController *)self p_performAction:[(THAnnotationController *)self p_actionForUpdatingAnnotation:a3 withBlock:v4] moc:a4];
}

- (id)p_infoForNodeUniqueID:(id)a3 inContentNode:(id)a4
{
  id v6 = [(THDocumentRoot *)[(THAnnotationController *)self documentRoot] context];
  if (!a4) {
    return 0;
  }
  id v7 = v6;
  id result = [a4 infoForNodeUniqueID:a3 forPresentationType:[THPresentationType paginatedPresentationTypeInContext:v6]];
  if (!result)
  {
    id v9 = +[THPresentationType flowPresentationTypeInContext:v7];
    return [a4 infoForNodeUniqueID:a3 forPresentationType:v9];
  }
  return result;
}

- (void)p_registerAnnotationObserver:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    objc_sync_enter(self);
    id v7 = [(TSURetainedPointerKeyDictionary *)self->mObservers objectForKey:a4];
    if (!v7)
    {
      id v7 = +[TSUMutablePointerSet set];
      [(TSURetainedPointerKeyDictionary *)self->mObservers setObject:v7 forUncopiedKey:a4];
    }
    [v7 addObject:a3];
    objc_sync_exit(self);
  }
}

- (void)registerAnnotationObserver:(id)a3 forContentNode:(id)a4
{
  id v6 = [(THAnnotationController *)self p_keyForContentNode:a4];

  [(THAnnotationController *)self p_registerAnnotationObserver:a3 forKey:v6];
}

- (void)p_unregisterAnnotationObserver:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    objc_sync_enter(self);
    id v7 = [(TSURetainedPointerKeyDictionary *)self->mObservers objectForKey:a4];
    [v7 removeObject:a3];
    if (![v7 count]) {
      [(TSURetainedPointerKeyDictionary *)self->mObservers removeObjectForKey:a4];
    }
    objc_sync_exit(self);
  }
}

- (void)unregisterAnnotationObserver:(id)a3 forContentNode:(id)a4
{
  id v6 = [(THAnnotationController *)self p_keyForContentNode:a4];

  [(THAnnotationController *)self p_unregisterAnnotationObserver:a3 forKey:v6];
}

- (id)p_cachedAnnotationsForContentNode:(id)a3 moc:(id)a4
{
  id v7 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:");
  objc_sync_enter(self);
  id v8 = [(NSMutableDictionary *)self->mCachedAnnotations objectForKey:v7];
  objc_sync_exit(self);
  if (!v8)
  {
    id v8 = +[NSMutableDictionary dictionary];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [[self p_annotationsForContentNode:a3 moc:a4] allValues];
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = [[THCachedAnnotation alloc] initWithAnnotation:*(void *)(*((void *)&v15 + 1) + 8 * (void)v12) contentNode:a3];
          [v8 setObject:v13 forKey:[v13 annotationUuid]];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    objc_sync_enter(self);
    [(NSMutableDictionary *)self->mCachedAnnotations setObject:v8 forKey:v7];
    objc_sync_exit(self);
  }
  return v8;
}

- (id)p_annotationsForContentNode:(id)a3 moc:(id)a4
{
  id v7 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:");
  objc_sync_enter(self);
  id v8 = [(NSMutableDictionary *)self->mAEAnnotationManagedObjectIDs objectForKey:v7];
  if (!v8)
  {
    id v8 = +[NSMutableDictionary dictionary];
    if (a3)
    {
      id v9 = [(THAnnotationController *)self p_annotationsForFetchRequest:[(THAnnotationController *)self p_annotationRequestForContentNode:a3] moc:a4 migrateIfNecessary:1];
      id v22 = v7;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v32;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v9);
            }
            [v8 setObject:[*(id *)(*((void *)&v31 + 1) + 8 * i) objectID] forKey:[*(id *)(*((void *)&v31 + 1) + 8 * i) annotationUuid]];
          }
          id v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v10);
      }
      id v7 = v22;
      id v13 = [(THAnnotationController *)self p_annotationsForFetchRequest:[(THAnnotationController *)self p_bookmarkRequestForContentNode:a3] moc:a4 migrateIfNecessary:1];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v28;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v13);
            }
            [v8 setObject:[*(id *)(*((void *)&v27 + 1) + 8 * (void)j) objectID] forKey:[*(id *)(*((void *)&v27 + 1) + 8 * (void)j) annotationUuid]];
          }
          id v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v14);
      }
    }
    else
    {
      id v17 = [(THAnnotationController *)self p_annotationsForFetchRequest:[(THAnnotationController *)self p_nonSponsoredAnnotationRequest] moc:a4 migrateIfNecessary:1];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v18 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v24;
        do
        {
          for (k = 0; k != v18; k = (char *)k + 1)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v17);
            }
            [v8 setObject:[k objectID] forKey:[k annotationUuid]];
          }
          id v18 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
        }
        while (v18);
      }
    }
    [(NSMutableDictionary *)self->mAEAnnotationManagedObjectIDs setObject:v8 forKey:v7];
  }
  objc_sync_exit(self);
  return [(THAnnotationController *)self p_annotationsForManagedObjectIDs:v8 moc:a4];
}

- (id)p_annotationsForManagedObjectIDs:(id)a3 moc:(id)a4
{
  id v7 = +[NSMutableDictionary dictionary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_9B180;
  v9[3] = &unk_458A18;
  v9[4] = a4;
  v9[5] = self;
  void v9[6] = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v9];
  return v7;
}

- (id)p_cachedBookmarksWithMoc:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->mCachedAnnotations objectForKey:@"THMacAnnotationAllBookmarks"];
  objc_sync_exit(self);
  if (!v5)
  {
    id v5 = +[NSMutableDictionary dictionary];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [[self p_bookmarksWithMOC:a3] allValues];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = -[THCachedAnnotation initWithAnnotation:contentNode:]([THCachedAnnotation alloc], "initWithAnnotation:contentNode:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v9), -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) annotationContentNodeID]));
          [v5 setObject:v10 forKey:[v10 annotationUuid]];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    objc_sync_enter(self);
    [(NSMutableDictionary *)self->mCachedAnnotations setObject:v5 forKey:@"THMacAnnotationAllBookmarks"];
    objc_sync_exit(self);
  }
  return v5;
}

- (id)p_bookmarksWithMOC:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->mAEAnnotationManagedObjectIDs objectForKey:@"THMacAnnotationAllBookmarks"];
  if (!v5)
  {
    id v5 = +[NSMutableDictionary dictionary];
    id v6 = [(THAnnotationController *)self p_annotationsForFetchRequest:[(THAnnotationController *)self p_allBookmarksFetchRequest] moc:a3 migrateIfNecessary:1];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          [v5 setObject:[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) objectID] forKey:[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) annotationUuid]];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(NSMutableDictionary *)self->mAEAnnotationManagedObjectIDs setObject:v5 forKey:@"THMacAnnotationAllBookmarks"];
  }
  objc_sync_exit(self);
  return [(THAnnotationController *)self p_annotationsForManagedObjectIDs:v5 moc:a3];
}

- (id)p_annotationForCachedAnnotation:(id)a3 moc:(id)a4
{
  id v5 = -[THAnnotationController p_annotationsForContentNode:moc:](self, "p_annotationsForContentNode:moc:", -[THAnnotationController p_contentNodeForCachedAnnotation:](self, "p_contentNodeForCachedAnnotation:"), a4);
  id v6 = [a3 annotationUuid];

  return [v5 objectForKey:v6];
}

- (id)p_contentNodeForCachedAnnotation:(id)a3
{
  objc_opt_class();
  id result = [(id)TSUDynamicCast() contentNode];
  if (!result)
  {
    id v6 = [(THAnnotationController *)self documentNavModel];
    id v7 = [a3 annotationContentNodeID];
    return [(THDocumentNavigationModel *)v6 contentNodeForGUID:v7];
  }
  return result;
}

- (id)p_extendExistingAnnotationForRange:(_NSRange)a3 storage:(id)a4 contentNode:(id)a5 style:(int)a6 moc:(id)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_sync_enter(self);
  id v13 = [a5 annotationIDForInfo:a4];
  id v14 = objc_alloc_init((Class)NSMutableArray);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  id v31 = a7;
  id v15 = [[self p_annotationsForContentNode:a5 moc:a7] allValues];
  id v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v41;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v19, "plStorageUUID"), "isEqualToString:", v13))
        {
          v46.NSUInteger location = (NSUInteger)[v19 annotationStorageRange];
          v48.NSUInteger location = location;
          v48.NSUInteger length = length;
          if (NSIntersectionRange(v46, v48).length) {
            [v14 addObject:v19];
          }
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v16);
  }
  id v20 = +[THAnnotationCache annotationsOrderedForVisualStacking:v14];

  if (a6 != 6 || (id v21 = [v20 lastObject]) == 0)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v22 = [v20 reverseObjectEnumerator];
    id v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (!v23)
    {
LABEL_31:
      long long v26 = 0;
      goto LABEL_32;
    }
    uint64_t v24 = *(void *)v37;
LABEL_15:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v37 != v24) {
        objc_enumerationMutation(v22);
      }
      id v21 = *(id *)(*((void *)&v36 + 1) + 8 * v25);
      if (([v21 annotationIsUnderline] & 1) == 0) {
        break;
      }
      if (v23 == (id)++v25)
      {
        id v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
        long long v26 = 0;
        if (v23) {
          goto LABEL_15;
        }
        goto LABEL_32;
      }
    }
    if (!v21) {
      goto LABEL_31;
    }
  }
  v49.NSUInteger location = (NSUInteger)[v21 annotationStorageRange];
  v49.NSUInteger length = v27;
  v47.NSUInteger location = location;
  v47.NSUInteger length = length;
  NSRange v28 = NSUnionRange(v47, v49);
  if ([v21 annotationStyle] == a6
    || (long long v26 = 0, a6 != 6) && (location == v28.location ? (v29 = length == v28.length) : (v29 = 0), v29))
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_9BAE4;
    v33[3] = &unk_458A38;
    NSRange v34 = v28;
    int v35 = a6;
    [(THAnnotationController *)self p_performUndoableAction:[(THAnnotationController *)self p_actionForUpdatingAnnotation:v21 withBlock:v33] moc:v31];
    long long v26 = v21;
  }
LABEL_32:
  objc_sync_exit(self);
  return v26;
}

- (id)addAnnotationForStorage:(id)a3 range:(_NSRange)a4 contentNode:(id)a5 style:(int)a6 undoContext:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (![(THAnnotationController *)self canModifyAnnotations]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationController addAnnotationForStorage:range:contentNode:style:undoContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:2220 description:@"cannot modify annotations"];
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3052000000;
  id v22 = sub_9669C;
  id v23 = sub_966AC;
  uint64_t v24 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_9BCC8;
  v17[3] = &unk_458A88;
  v17[4] = a7;
  v17[5] = a5;
  v17[9] = location;
  v17[10] = length;
  v17[6] = a3;
  v17[7] = self;
  int v18 = a6;
  v17[8] = &v19;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v17];
  id v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);
  return v15;
}

- (void)destroyAnnotations:(id)a3 undoContext:(id)a4
{
  id v7 = (char *)[a3 count];
  if (v7)
  {
    uint64_t v8 = v7;
    if (![(THAnnotationController *)self canModifyAnnotations]) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationController destroyAnnotations:undoContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:2262 description:@"cannot modify annotations"];
    }
    id v9 = [a3 objectAtIndex:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(a3);
          }
          if ([*(id *)(*((void *)&v21 + 1) + 8 * i) annotationNote])
          {
            if (v12)
            {
              uint64_t v12 = 2;
              goto LABEL_17;
            }
            uint64_t v12 = 1;
          }
        }
        id v11 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
LABEL_17:
    id v15 = +[NSMutableDictionary dictionaryWithDictionary:a4];
    id v16 = [(THDocumentRoot *)[(THAnnotationController *)self documentRoot] modelStorageAnchorForAnnotation:v9];
    if (v16) {
      [(NSMutableDictionary *)v15 setObject:v16 forKey:@"THAnnotationStorageAnchorUndoContextKey"];
    }
    if (v12)
    {
      if (v12 == 1)
      {
        uint64_t v17 = (void *)THBundle();
        if (v8 == (unsigned char *)&dword_0 + 1) {
          CFStringRef v18 = @"Remove Highlight and Note";
        }
        else {
          CFStringRef v18 = @"Remove Highlights and Note";
        }
      }
      else
      {
        uint64_t v17 = (void *)THBundle();
        if (v8 == (unsigned char *)&dword_0 + 1) {
          CFStringRef v18 = @"Remove Highlight and Notes";
        }
        else {
          CFStringRef v18 = @"Remove Highlights and Notes";
        }
      }
    }
    else
    {
      uint64_t v17 = (void *)THBundle();
      if (v8 == (unsigned char *)&dword_0 + 1) {
        CFStringRef v18 = @"Remove Highlight";
      }
      else {
        CFStringRef v18 = @"Remove Highlights";
      }
    }
    -[THAnnotationController p_openUndoGroupWithContext:actionName:](self, "p_openUndoGroupWithContext:actionName:", v15, [v17 localizedStringForKey:v18 value:&stru_46D7E8 table:0]);
    mAnnotationProvider = self->mAnnotationProvider;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_9C170;
    v20[3] = &unk_4586E8;
    v20[4] = a3;
    v20[5] = self;
    [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v20];
    [(THAnnotationController *)self p_closeUndoGroup];
  }
}

- (void)destroyAnnotation:(id)a3 undoContext:(id)a4
{
  if (a3)
  {
    id v6 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
    [(THAnnotationController *)self destroyAnnotations:v6 undoContext:a4];
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationController destroyAnnotation:undoContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:2319 description:@"invalid nil value for '%s'", "cachedAnnotation"];
  }
}

- (id)modifyAnnotation:(id)a3 undoContext:(id)a4 undoActionName:(id)a5 withBlock:(id)a6
{
  if (![(THAnnotationController *)self canModifyAnnotations]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2328 description:@"cannot modify annotations"];
  }
  if ([a3 annotationType] != 2) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:2329 description:@"modifyAnnotation is only for highlight (ranged) annotations -- if we need it for somethign else, we should add a variant that does the right thing with undo"];
  }
  id v11 = +[NSMutableDictionary dictionaryWithDictionary:a4];
  id v12 = [(THDocumentRoot *)[(THAnnotationController *)self documentRoot] modelStorageAnchorForAnnotation:a3];
  if (v12) {
    [(NSMutableDictionary *)v11 setObject:v12 forKey:@"THAnnotationStorageAnchorUndoContextKey"];
  }
  [(THAnnotationController *)self p_openUndoGroupWithContext:v11 actionName:a5];
  id v13 = [(THAnnotationController *)self p_contentNodeForCachedAnnotation:a3];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  long long v21 = sub_9669C;
  long long v22 = sub_966AC;
  uint64_t v23 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_9C604;
  v17[3] = &unk_458AD8;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = v13;
  v17[7] = a6;
  v17[8] = &v18;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v17];
  [(THAnnotationController *)self p_closeUndoGroup];
  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);
  return v15;
}

- (id)modifyAnnotation:(id)a3 withNoteText:(id)a4 undoContext:(id)a5
{
  id v7 = a3;
  id v9 = [a3 annotationNote];
  unint64_t v10 = (unint64_t)[v9 length];
  unint64_t v11 = (unint64_t)[a4 length];
  if (v10 | v11)
  {
    unint64_t v12 = v11;
    if (([a4 isEqualToString:v9] & 1) == 0)
    {
      if (v12)
      {
        id v13 = (void *)THBundle();
        if (v10) {
          CFStringRef v14 = @"Edit Note";
        }
        else {
          CFStringRef v14 = @"Add Note";
        }
      }
      else
      {
        id v13 = (void *)THBundle();
        CFStringRef v14 = @"Remove Note";
      }
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_9C8F8;
      v16[3] = &unk_458B00;
      v16[4] = a4;
      return -[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:](self, "modifyAnnotation:undoContext:undoActionName:withBlock:", v7, a5, [v13 localizedStringForKey:v14 value:&stru_46D7E8 table:0], v16);
    }
  }
  return v7;
}

- (id)modifyAnnotation:(id)a3 withStyle:(int)a4 undoContext:(id)a5
{
  id v7 = a3;
  if ([a3 annotationStyle] != a4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_9C9D4;
    v10[3] = &unk_458B20;
    int v11 = a4;
    return -[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:](self, "modifyAnnotation:undoContext:undoActionName:withBlock:", v7, a5, [(id)THBundle() localizedStringForKey:@"Edit Highlight" value:&stru_46D7E8 table:0], v10);
  }
  return v7;
}

- (id)cachedAnnotationsForContentNode:(id)a3
{
  uint64_t v13 = 0;
  CFStringRef v14 = &v13;
  uint64_t v15 = 0x3052000000;
  id v16 = sub_9669C;
  uint64_t v17 = sub_966AC;
  uint64_t v18 = 0;
  id v5 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:");
  objc_sync_enter(self);
  id v6 = [(NSMutableDictionary *)self->mAnnotationCache objectForKey:v5];
  v14[5] = (uint64_t)v6;
  objc_sync_exit(self);
  if (!v14[5])
  {
    mAnnotationProvider = self->mAnnotationProvider;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_9CBA8;
    v12[3] = &unk_458B48;
    v12[5] = a3;
    void v12[6] = &v13;
    v12[4] = self;
    [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v12];
    if (v14[5])
    {
      objc_sync_enter(self);
      [(NSMutableDictionary *)self->mAnnotationCache setObject:v14[5] forKey:v5];
      objc_sync_exit(self);
    }
    else
    {
      uint64_t v8 = _AEBookPluginsAnnotationsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Dropping annotation cache result because annotation provider was nil.", v11, 2u);
      }
    }
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (unint64_t)nonOrphanedAnnotationCount
{
  id v2 = [(THAnnotationController *)self cachedAnnotationsForFetchRequest:[(THAnnotationController *)self annotationRequestForNonOrphanedNotes] migrateIfNecessary:0];

  return (unint64_t)[v2 count];
}

- (id)modifiedAnnotation:(id)a3 withChapterTitle:(id)a4 physicalPageNumber:(id)a5
{
  objc_opt_class();
  id v7 = (void *)TSUDynamicCast();

  return [v7 annotationWithChapterTitle:a4 physicalPageNumber:a5];
}

- (id)temporaryAnnotationForStorage:(id)a3 contentNode:(id)a4 withRange:(_NSRange)a5 style:(int)a6
{
  return -[THAnnotationController temporaryAnnotationForStorage:contentNode:withRange:style:chapterTitle:](self, "temporaryAnnotationForStorage:contentNode:withRange:style:chapterTitle:", a3, a4, a5.location, a5.length, *(void *)&a6, 0);
}

- (id)temporaryAnnotationForStorage:(id)a3 contentNode:(id)a4 withRange:(_NSRange)a5 style:(int)a6 chapterTitle:(id)a7
{
  id v7 = -[THCachedAnnotation initTemporaryWithStorage:range:contentNode:style:chapterTitle:]([THCachedAnnotation alloc], "initTemporaryWithStorage:range:contentNode:style:chapterTitle:", a3, a5.location, a5.length, a4, *(void *)&a6, a7);

  return v7;
}

- (id)cachedAnnotationForFetchedObject:(id)a3
{
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (result)
  {
    uint64_t v4 = [[THCachedAnnotation alloc] initWithAnnotation:result contentNode:0];
    return v4;
  }
  return result;
}

- (id)cachedAnnotationsForFetchRequest:(id)a3 migrateIfNecessary:(BOOL)a4
{
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  unint64_t v12 = sub_9669C;
  uint64_t v13 = sub_966AC;
  uint64_t v14 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9CE9C;
  v7[3] = &unk_458B70;
  v7[5] = a3;
  v7[6] = &v9;
  v7[4] = self;
  BOOL v8 = a4;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v7];
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (BOOL)p_annotationsNeedsMigration:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      BOOL v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        if ([(THAnnotationController *)self p_cachedAnnotationNeedsMigration:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        BOOL v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (id)cachedAnnotationsForAnnotations:(id)a3 withFilter:(id)a4
{
  id v4 = a3;
  if (a4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_9D1CC;
    v7[3] = &unk_458B98;
    v7[4] = a4;
    id v4 = [a3 tsu_arrayOfObjectsPassingTest:v7];
  }
  return [[THAnnotationCache alloc] initWithAnnotations:v4 contentNode:0 needsMigration:[(THAnnotationController *)self p_annotationsNeedsMigration:v4]];
}

- (id)cachedAnnotationsForAnnotations:(id)a3 filteredWithContentNode:(id)a4
{
  if (!a4) {
    return 0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_9D2B8;
  v9[3] = &unk_458BC0;
  v9[4] = [a4 nodeGUID];
  id v7 = [a3 tsu_arrayOfObjectsPassingTest:v9];
  return [[THAnnotationCache alloc] initWithAnnotations:v7 contentNode:a4 needsMigration:[(THAnnotationController *)self p_annotationsNeedsMigration:v7]];
}

- (void)registerWithUndoManager:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerWithUndoManager:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2557 description:@"This operation must only be performed on the main thread."];
  }
  if (self->mUndoManager) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerWithUndoManager:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2558 description:@"already registered with an undo manager"];
  }
  self->mUndoManager = (NSUndoManager *)a3;
}

- (void)unregisterWithUndoManager:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterWithUndoManager:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2565 description:@"This operation must only be performed on the main thread."];
  }
  if (self->mUndoManager != a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterWithUndoManager:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2566 description:@"not registered with this undo manager"];
  }
  [(THAnnotationController *)self p_clearUndoStack];

  self->mUndoManager = 0;
}

- (void)registerAnnotationUndoObserver:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerAnnotationUndoObserver:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2575 description:@"This operation must only be performed on the main thread."];
  }
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerAnnotationUndoObserver:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2576 description:@"invalid undo observer"];
  }
  if ([(TSUMutablePointerSet *)self->mUndoObservers containsObject:a3]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerAnnotationUndoObserver:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2577 description:@"this observer is already registered"];
  }
  if (a3)
  {
    mUndoObservers = self->mUndoObservers;
    if (!mUndoObservers)
    {
      mUndoObservers = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
      self->mUndoObservers = mUndoObservers;
    }
    [(TSUMutablePointerSet *)mUndoObservers addObject:a3];
  }
}

- (void)unregisterAnnotationUndoObserver:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationController unregisterAnnotationUndoObserver:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:2592 description:@"This operation must only be performed on the main thread."];
  }
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterAnnotationUndoObserver:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2593 description:@"invalid undo observer"];
  }
  if (([(TSUMutablePointerSet *)self->mUndoObservers containsObject:a3] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterAnnotationUndoObserver:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2594 description:@"this observer is not registered"];
  }
  if (a3)
  {
    [(TSUMutablePointerSet *)self->mUndoObservers removeObject:a3];
    if (![(TSUMutablePointerSet *)self->mUndoObservers count])
    {

      self->mUndoObservers = 0;
    }
  }
}

- (void)p_performAction:(id)a3 moc:(id)a4
{
}

- (void)p_performUndoableAction:(id)a3 moc:(id)a4
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_performUndoableAction:moc:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2616 description:@"This operation must only be performed on the main thread."];
  }

  [(THAnnotationController *)self p_performAction:a3 undoable:1 moc:a4];
}

- (void)p_performAction:(id)a3 undoable:(BOOL)a4 moc:(id)a5
{
  BOOL v6 = a4;
  if ([(THAnnotationController *)self annotationsWriteEnabled] || self->mIgnoringWritability)
  {
    mCurrentChangeList = self->mCurrentChangeList;
    if (!mCurrentChangeList) {
      [(THAnnotationController *)self p_openActionGroup];
    }
    objc_sync_enter(self);
    [a3 commitWithChangeList:self->mCurrentChangeList annotationHost:self moc:a5];
    objc_sync_exit(self);
    if (v6) {
      [(THAnnotationUndoGroup *)self->mCurrentUndoGroup addAction:a3];
    }
    if (!mCurrentChangeList)
    {
      [(THAnnotationController *)self p_closeActionGroupWithMoc:a5];
    }
  }
}

- (void)p_openActionGroup
{
  unint64_t mCurrentChangeGroupDepth = self->mCurrentChangeGroupDepth;
  if (!mCurrentChangeGroupDepth)
  {
    if (self->mCurrentChangeList) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_openActionGroup]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2655 description:@"can't open an action group while another is open"];
    }
    self->mCurrentChangeList = objc_alloc_init(THAnnotationChangeList);
    unint64_t mCurrentChangeGroupDepth = self->mCurrentChangeGroupDepth;
  }
  self->unint64_t mCurrentChangeGroupDepth = mCurrentChangeGroupDepth + 1;
}

- (void)p_closeActionGroupWithMoc:(id)a3
{
  unint64_t mCurrentChangeGroupDepth = self->mCurrentChangeGroupDepth;
  if (mCurrentChangeGroupDepth)
  {
    unint64_t v5 = mCurrentChangeGroupDepth - 1;
    self->unint64_t mCurrentChangeGroupDepth = v5;
    if (!v5)
    {
      if (!self->mCurrentChangeList) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeActionGroupWithMoc:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2671 description:@"can't close action group if there isn't one open"];
      }
      objc_sync_enter(self);
      [(THAnnotationController *)self p_processChangeList:self->mCurrentChangeList moc:a3];
      objc_sync_exit(self);

      self->mCurrentChangeList = 0;
    }
  }
  else
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    BOOL v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeActionGroupWithMoc:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:2683 description:@"imbalanced calls to p_open/closeActionGroup"];
  }
}

- (void)p_beginIgnoringWritability
{
  if (self->mIgnoringWritability) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_beginIgnoringWritability]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2691 description:@"nested ignore-writability is not supported"];
  }
  self->mIgnoringWritability = 1;
}

- (void)p_endIgnoringWritability
{
  if (!self->mIgnoringWritability) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_endIgnoringWritability]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2697 description:@"can't end ignore-writability before it has begun"];
  }
  self->mIgnoringWritability = 0;
}

- (void)p_openUndoGroupWithContext:(id)a3 actionName:(id)a4
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_openUndoGroupWithContext:actionName:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2705 description:@"This operation must only be performed on the main thread."];
  }
  if (self->mCurrentUndoGroup) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_openUndoGroupWithContext:actionName:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2706 description:@"nested undo groups are not supported"];
  }
  id v7 = objc_alloc_init(THAnnotationUndoGroup);
  self->mCurrentUndoGroup = v7;
  [(THAnnotationUndoGroup *)v7 setContext:a3];
  if (a4)
  {
    mUndoManager = self->mUndoManager;
    [(NSUndoManager *)mUndoManager setActionName:a4];
  }
}

- (void)p_closeUndoGroup
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeUndoGroup]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2719 description:@"This operation must only be performed on the main thread."];
  }
  mCurrentUndoGroup = self->mCurrentUndoGroup;
  if (!mCurrentUndoGroup)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeUndoGroup]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2720 description:@"can't close undo group if it was never opened"];
    mCurrentUndoGroup = self->mCurrentUndoGroup;
  }
  if ([(THAnnotationUndoGroup *)mCurrentUndoGroup hasActions]) {
    [(NSUndoManager *)self->mUndoManager registerUndoWithTarget:self selector:"p_undoWithUndoGroup:" object:self->mCurrentUndoGroup];
  }

  self->mCurrentUndoGroup = 0;
}

- (void)p_undoWithUndoGroup:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_undoWithUndoGroup:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2732 description:@"This operation must only be performed on the main thread."];
  }
  if (([a3 hasActions] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_undoWithUndoGroup:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2733 description:@"undo stack should not contain an empty undo group"];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mUndoObservers = self->mUndoObservers;
  id v6 = [(TSUMutablePointerSet *)mUndoObservers countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(mUndoObservers);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) annotationsWillUpdateWithUndoContext:[a3 context]];
      }
      id v6 = [(TSUMutablePointerSet *)mUndoObservers countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
  objc_sync_enter(self);
  mAnnotationProvider = self->mAnnotationProvider;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_9E1DC;
  v18[3] = &unk_4586E8;
  v18[4] = a3;
  v18[5] = self;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v18];
  objc_sync_exit(self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v10 = self->mUndoObservers;
  id v11 = [(TSUMutablePointerSet *)v10 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)j) annotationsDidUpdateWithUndoContext:[a3 context]];
      }
      id v11 = [(TSUMutablePointerSet *)v10 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v11);
  }
  [(NSUndoManager *)self->mUndoManager registerUndoWithTarget:self selector:"p_redoWithUndoGroup:" object:a3];
}

- (void)p_redoWithUndoGroup:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_redoWithUndoGroup:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2758 description:@"This operation must only be performed on the main thread."];
  }
  if (([a3 hasActions] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_redoWithUndoGroup:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2759 description:@"redo stack should not contain an empty undo group"];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mUndoObservers = self->mUndoObservers;
  id v6 = [(TSUMutablePointerSet *)mUndoObservers countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(mUndoObservers);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) annotationsWillUpdateWithUndoContext:[a3 context]];
      }
      id v6 = [(TSUMutablePointerSet *)mUndoObservers countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
  objc_sync_enter(self);
  mAnnotationProvider = self->mAnnotationProvider;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_9E518;
  v18[3] = &unk_4586E8;
  v18[4] = a3;
  v18[5] = self;
  [(AEAnnotationProvider *)mAnnotationProvider performBlockOnUserSideQueueAndWait:v18];
  objc_sync_exit(self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v10 = self->mUndoObservers;
  id v11 = [(TSUMutablePointerSet *)v10 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)j) annotationsDidUpdateWithUndoContext:[a3 context]];
      }
      id v11 = [(TSUMutablePointerSet *)v10 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v11);
  }
  [(NSUndoManager *)self->mUndoManager registerUndoWithTarget:self selector:"p_undoWithUndoGroup:" object:a3];
}

- (void)p_processChangeList:(id)a3 moc:(id)a4
{
  id v4 = a3;
  if (([a3 isEmpty] & 1) == 0)
  {
    id v58 = +[NSMutableSet set];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id obj = [v4 changedContentNodeIDs];
    id v61 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
    if (v61)
    {
      char v68 = 0;
      char v56 = 0;
      uint64_t v59 = *(void *)v96;
      v65 = v4;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v96 != v59) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v95 + 1) + 8 * i);
          id v9 = [(THDocumentNavigationModel *)[(THAnnotationController *)self documentNavModel] contentNodeForGUID:v7];
          id v10 = [(THAnnotationController *)self p_keyForContentNode:v9];
          if (v10)
          {
            id v11 = v10;
            id v67 = v9;
            v62 = v8;
            v63 = i;
            id v12 = [(NSMutableDictionary *)self->mAEAnnotationManagedObjectIDs objectForKey:v10];
            id v69 = [(NSMutableDictionary *)self->mCachedAnnotations objectForKey:v11];
            id v60 = v11;
            id v13 = [(NSMutableDictionary *)self->mAnnotationCache objectForKey:v11];
            long long v91 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            uint64_t v64 = v7;
            id v66 = [v4 addedAnnotationUUIDsForContentNodeID:v7];
            id v14 = [v66 countByEnumeratingWithState:&v91 objects:v104 count:16];
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v92;
              long long v17 = v13;
              id v18 = v13;
              do
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(void *)v92 != v16) {
                    objc_enumerationMutation(v66);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v91 + 1) + 8 * (void)j);
                  id v21 = [(THAnnotationController *)self p_storageAnnotationForUUID:v20 includeDeleted:0 moc:a4];
                  if (v21)
                  {
                    long long v22 = v21;
                    if (([v21 isPlaceholder] & 1) == 0)
                    {
                      uint64_t v23 = [[THCachedAnnotation alloc] initWithAnnotation:v22 contentNode:v67];
                      [v12 setObject:[v22 objectID] forKey:v20];
                      [v69 setObject:v23 forKey:v20];
                      id v18 = [v18 newAnnotationCacheWithUpdatedAnnotation:v23];
                      if ([(THCachedAnnotation *)v23 annotationIsBookmark])
                      {
                        [self->mCachedAnnotations objectForKey:@"THMacAnnotationAllBookmarks"] setObject:v23 forKey:v20];
                        char v68 = 1;
                      }
                    }
                  }
                }
                id v15 = [v66 countByEnumeratingWithState:&v91 objects:v104 count:16];
              }
              while (v15);
            }
            else
            {
              long long v17 = v13;
              id v18 = v13;
            }
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v24 = [v65 deletedAnnotationUUIDsForContentNodeID:v64];
            id v25 = [v24 countByEnumeratingWithState:&v87 objects:v103 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v88;
              do
              {
                for (k = 0; k != v26; k = (char *)k + 1)
                {
                  if (*(void *)v88 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v87 + 1) + 8 * (void)k);
                  [v12 removeObjectForKey:v29];
                  [v69 removeObjectForKey:v29];
                  id v30 = [v17 annotationWithUUID:v29];
                  if (v30) {
                    id v18 = [v18 newAnnotationCacheWithRemovedAnnotation:v30];
                  }
                  if ([v30 annotationIsBookmark])
                  {
                    objc_msgSend(-[NSMutableDictionary objectForKey:](self->mCachedAnnotations, "objectForKey:", @"THMacAnnotationAllBookmarks"), "removeObjectForKey:", objc_msgSend(v30, "annotationUuid"));
                    char v68 = 1;
                  }
                }
                id v26 = [v24 countByEnumeratingWithState:&v87 objects:v103 count:16];
              }
              while (v26);
            }
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id v31 = [v65 changedAnnotationUUIDsForContentNodeID:v64];
            id v32 = [v31 countByEnumeratingWithState:&v83 objects:v102 count:16];
            if (v32)
            {
              id v33 = v32;
              uint64_t v34 = *(void *)v84;
              do
              {
                for (m = 0; m != v33; m = (char *)m + 1)
                {
                  if (*(void *)v84 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v36 = *(void *)(*((void *)&v83 + 1) + 8 * (void)m);
                  id v37 = [(THAnnotationController *)self p_storageAnnotationForUUID:v36 includeDeleted:0 moc:a4];
                  if (v37)
                  {
                    id v38 = v37;
                    if (([v37 isPlaceholder] & 1) == 0)
                    {
                      long long v39 = [[THCachedAnnotation alloc] initWithAnnotation:v38 contentNode:v67];
                      [v69 setObject:v39 forKey:v36];
                      id v18 = [v18 newAnnotationCacheWithUpdatedAnnotation:v39];
                      if ([(THCachedAnnotation *)v39 annotationIsBookmark])
                      {
                        [self->mCachedAnnotations objectForKey:@"THMacAnnotationAllBookmarks"] setObject:v39 forKey:v36];
                        char v68 = 1;
                      }
                    }
                  }
                  else
                  {
                    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_processChangeList:moc:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2865 description:@"invalid nil value for '%s'", "annotation"];
                  }
                }
                id v33 = [v31 countByEnumeratingWithState:&v83 objects:v102 count:16];
              }
              while (v33);
            }
            if (v18) {
              [(NSMutableDictionary *)self->mAnnotationCache setObject:v18 forKey:v60];
            }
            BOOL v8 = v62;
            i = v63;
            if (v67) {
              [v58 addObject:];
            }
            else {
              char v56 = 1;
            }
            id v4 = v65;
          }
          else
          {
            [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_processChangeList:moc:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:2801 description:@"invalid nil value for '%s'", "contentNodeKey"];
          }
        }
        id v61 = [obj countByEnumeratingWithState:&v95 objects:v105 count:16];
      }
      while (v61);
      if (v68) {
        [(NSMutableDictionary *)self->mAnnotationCache removeObjectForKey:@"THMacAnnotationAllBookmarks"];
      }
    }
    else
    {
      char v56 = 0;
    }
    [(THAnnotationController *)self p_commitChangesWithMoc:a4];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v40 = [v58 countByEnumeratingWithState:&v79 objects:v101 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v80;
      do
      {
        for (n = 0; n != v41; n = (char *)n + 1)
        {
          if (*(void *)v80 != v42) {
            objc_enumerationMutation(v58);
          }
          uint64_t v44 = *(void *)(*((void *)&v79 + 1) + 8 * (void)n);
          id v45 = [(THAnnotationController *)self p_keyForContentNode:v44];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v46 = [(TSURetainedPointerKeyDictionary *)self->mObservers objectForKey:v45];
          id v47 = [v46 countByEnumeratingWithState:&v75 objects:v100 count:16];
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v76;
            do
            {
              for (ii = 0; ii != v48; ii = (char *)ii + 1)
              {
                if (*(void *)v76 != v49) {
                  objc_enumerationMutation(v46);
                }
                [*(id *)(*((void *)&v75 + 1) + 8 * (void)ii) annotationsUpdatedForContentNode:v44];
              }
              id v48 = [v46 countByEnumeratingWithState:&v75 objects:v100 count:16];
            }
            while (v48);
          }
        }
        id v41 = [v58 countByEnumeratingWithState:&v79 objects:v101 count:16];
      }
      while (v41);
    }
    if (v56)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v51 = [(TSURetainedPointerKeyDictionary *)self->mObservers objectForKey:@"THMacAnnotationLostOrphans"];
      id v52 = [v51 countByEnumeratingWithState:&v71 objects:v99 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v72;
        do
        {
          for (jj = 0; jj != v53; jj = (char *)jj + 1)
          {
            if (*(void *)v72 != v54) {
              objc_enumerationMutation(v51);
            }
            [*(id *)(*((void *)&v71 + 1) + 8 * (void)jj) annotationsUpdatedForContentNode:0];
          }
          id v53 = [v51 countByEnumeratingWithState:&v71 objects:v99 count:16];
        }
        while (v53);
      }
    }
  }
}

- (id)p_actionForInsertingAnnotationWithType:(int)a3 style:(int)a4 absolutePageIndex:(unint64_t)a5 range:(_NSRange)a6 storage:(id)a7 contentNode:(id)a8 updateBlock:(id)a9
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_9EE64;
  v16[3] = &unk_458BE8;
  int v18 = a4;
  int v19 = a3;
  v16[4] = a8;
  void v16[5] = a7;
  _NSRange v17 = a6;
  v16[6] = a9;
  v16[7] = a5;
  id v11 = [THInsertAnnotationAction alloc];
  uint64_t v12 = kAEAnnotationVersion_4;
  id v13 = [(THBookVersion *)[(THDocumentProperties *)[(THDocumentRoot *)[(THAnnotationController *)self documentRoot] properties] bookVersion] versionString];
  id v14 = [(THAnnotationController *)self annotationID];
  return [(THInsertAnnotationAction *)v11 initWithVersion:v12 bookVersion:v13 assetID:v14 creatorID:kAEAnnotationCreatorIdentifier_iBooks_textbooks contentNode:a8 storage:a7 updateBlock:v16];
}

- (id)p_actionForUpdatingAnnotation:(id)a3 withContentNode:(id)a4 block:(id)a5
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationController p_actionForUpdatingAnnotation:withContentNode:block:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:2985 description:@"invalid nil value for '%s'", "annotation"];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_9F0AC;
  v9[3] = &unk_458AB0;
  v9[4] = a5;
  return [[THUpdateAnnotationAction alloc] initWithAnnotation:a3 contentNode:a4 updateBlock:v9];
}

- (id)p_actionForUpdatingAnnotation:(id)a3 withBlock:(id)a4
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_actionForUpdatingAnnotation:withBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:3000 description:@"invalid nil value for '%s'", "annotation"];
  }
  id v7 = -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", [a3 annotationContentNodeID]);

  return [(THAnnotationController *)self p_actionForUpdatingAnnotation:a3 withContentNode:v7 block:a4];
}

- (id)p_actionForDeletingCachedAnnotation:(id)a3 moc:(id)a4
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_actionForDeletingCachedAnnotation:moc:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:3008 description:@"invalid nil value for '%s'", "cachedAnnotation"];
  }
  id v7 = [(THAnnotationController *)self p_annotationForCachedAnnotation:a3 moc:a4];

  return [(THAnnotationController *)self p_actionForDeletingAEAnnotation:v7];
}

- (id)p_actionForDeletingAEAnnotation:(id)a3
{
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_actionForDeletingAEAnnotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:3016 description:@"invalid nil value for '%s'", "annotation"];
  }
  id v4 = _AEBookPluginsAnnotationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v7 = [a3 annotationAssetID];
    __int16 v8 = 2112;
    id v9 = [a3 annotationUuid];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "delete bliss annotation: assetID: %@, uuid: %@", buf, 0x16u);
  }
  return [[THDeleteAnnotationAction alloc] initWithAnnotation:a3];
}

- (void)p_clearUndoStack
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_clearUndoStack]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m") lineNumber:3029 description:@"This operation must only be performed on the main thread."];
  }
  mUndoManager = self->mUndoManager;

  [(NSUndoManager *)mUndoManager removeAllActionsWithTarget:self];
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (THDocumentNavigationModel)documentNavModel
{
  return self->mDocumentNavModel;
}

- (void)setDocumentNavModel:(id)a3
{
}

- (int)currentAnnotationStyle
{
  return self->mCurrentStyle;
}

- (void)setCurrentAnnotationStyle:(int)a3
{
  self->mCurrentStyle = a3;
}

- (unint64_t)mocRevision
{
  return self->mMOCRevision;
}

- (NSPredicate)basePredicate
{
  return self->mBasePredicate;
}

- (void)setBasePredicate:(id)a3
{
}

- (NSPredicate)nonOrphanedPredicate
{
  return self->mNonOrphanedPredicate;
}

- (void)setNonOrphanedPredicate:(id)a3
{
}

- (NSPredicate)orphanedPredicate
{
  return self->mOrphanedPredicate;
}

- (void)setOrphanedPredicate:(id)a3
{
}

- (NSPredicate)rangePredicate
{
  return self->mRangePredicate;
}

- (void)setRangePredicate:(id)a3
{
}

- (NSPredicate)pointPredicate
{
  return self->mPointPredicate;
}

- (void)setPointPredicate:(id)a3
{
}

- (NSPredicate)globalPredicate
{
  return self->mGlobalPredicate;
}

- (void)setGlobalPredicate:(id)a3
{
}

- (NSPredicate)nonCurrentVersionPredicate
{
  return self->mNonCurrentVersionPredicate;
}

- (void)setNonCurrentVersionPredicate:(id)a3
{
}

- (NSPredicate)nonOrphanedRangePredicate
{
  return self->mNonOrphanedRangePredicate;
}

- (void)setNonOrphanedRangePredicate:(id)a3
{
}

- (NSPredicate)orphanedRangePredicate
{
  return self->mOrphanedRangePredicate;
}

- (void)setOrphanedRangePredicate:(id)a3
{
}

- (NSPredicate)nonSponsoredPredicate
{
  return self->mNonSponsoredPredicate;
}

- (void)setNonSponsoredPredicate:(id)a3
{
}

- (NSPredicate)nonSponsoredNonOrphanedPredicate
{
  return self->mNonSponsoredNonOrphanedPredicate;
}

- (void)setNonSponsoredNonOrphanedPredicate:(id)a3
{
}

- (BOOL)annotationsReadEnabled
{
  return self->mAnnotationsReadEnabled;
}

- (void)setAnnotationsReadEnabled:(BOOL)a3
{
  self->mAnnotationsReadEnabled = a3;
}

- (BOOL)annotationsWriteEnabled
{
  return self->mAnnotationsWriteEnabled;
}

- (void)setAnnotationsWriteEnabled:(BOOL)a3
{
  self->mAnnotationsWriteEnabled = a3;
}

- (NSManagedObjectContext)lastCommitMoc
{
  return self->_lastCommitMoc;
}

- (void)setLastCommitMoc:(id)a3
{
}

- (id)managedObjectContextSaveObserver
{
  return self->_managedObjectContextSaveObserver;
}

- (void)setManagedObjectContextSaveObserver:(id)a3
{
}

@end