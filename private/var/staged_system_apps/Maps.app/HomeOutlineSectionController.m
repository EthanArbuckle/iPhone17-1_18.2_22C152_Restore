@interface HomeOutlineSectionController
- (BOOL)active;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)expanded;
- (BOOL)isDestinationOfDropCoordinator:(id)a3;
- (BOOL)isSourceOfDropCoordinator:(id)a3;
- (BOOL)persistsExpansions;
- (BOOL)shouldClearSelectionWithReason:(id)a3;
- (BOOL)shouldPersistExpandedIdentifierPath:(id)a3;
- (HomeOutlineSectionController)initWithConfiguration:(id)a3;
- (HomeOutlineSectionControllerConfiguration)configuration;
- (HomeOutlineSectionControllerDelegate)delegate;
- (IdentifierPath)focusedIdentifierPath;
- (IdentifierPath)sectionIdentifierPath;
- (MapsUIDiffableDataSourceIdentifierCache)identifierCache;
- (MapsUIDiffableDataSourceOutlineNodeSnapshot)sectionSnapshot;
- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel;
- (NSArray)dataProviders;
- (NSArray)itemSnapshots;
- (NSDictionary)deletions;
- (NSSet)expandedIdentifierPaths;
- (NSSet)selectedIdentifierPaths;
- (id)_sectionSnapshotByProcessingDeletionsInSectionSnapshot:(id)a3;
- (id)_snapshotByFilteringDeletionsFromSnapshot:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)contentInjectorForSnapshot:(id)a3;
- (id)contextMenuForSnapshot:(id)a3;
- (id)deletionWithSnapshot:(id)a3;
- (id)mapItemForDropSession:(id)a3;
- (id)shareItemSourceForSnapshot:(id)a3;
- (void)_loadExpandedIdentifierPaths;
- (void)_removeDeletions:(id)a3 applySnapshot:(BOOL)a4;
- (void)_scrubDeletionsWithSectionSnapshot:(id)a3;
- (void)_storeExpandedIdentifierPaths;
- (void)_updateDragAndDropPreview;
- (void)beginDeletions:(id)a3;
- (void)clearSelectionWithReason:(id)a3;
- (void)collapseElementAtIdentifierPath:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4;
- (void)dragAndDropPreviewDidUpdate:(id)a3;
- (void)endFailedDeletions:(id)a3 error:(id)a4;
- (void)expandElementAtIdentifierPath:(id)a3;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)invalidateSectionSnapshot;
- (void)setActive:(BOOL)a3;
- (void)toggleElementAtIdentifierPath:(id)a3;
@end

@implementation HomeOutlineSectionController

- (HomeOutlineSectionController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HomeOutlineSectionController;
  v6 = [(HomeOutlineSectionController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = +[NSMutableDictionary dictionary];
    deletions = v7->_deletions;
    v7->_deletions = (NSMutableDictionary *)v8;

    v10 = [(HomeOutlineSectionController *)v7 configuration];
    v11 = [v10 sectionIdentifier];
    uint64_t v12 = +[IdentifierPath identifierPathWithIdentifier:v11];
    sectionIdentifierPath = v7->_sectionIdentifierPath;
    v7->_sectionIdentifierPath = (IdentifierPath *)v12;

    [(HomeOutlineSectionController *)v7 _loadExpandedIdentifierPaths];
  }

  return v7;
}

- (HomeOutlineSectionControllerDelegate)delegate
{
  v2 = [(HomeOutlineSectionController *)self configuration];
  v3 = [v2 delegate];

  return (HomeOutlineSectionControllerDelegate *)v3;
}

- (MapsUIDiffableDataSourceOutlineNodeSnapshot)sectionSnapshot
{
  sectionSnapshot = self->_sectionSnapshot;
  if (!sectionSnapshot)
  {
    v4 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
    id v5 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    v6 = [(HomeOutlineSectionController *)self sectionHeaderViewModel];
    v7 = [(HomeOutlineSectionController *)self itemSnapshots];
    uint64_t v8 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v4 initWithIdentifierPath:v5 viewModel:v6 childSnapshots:v7 expanded:[(HomeOutlineSectionController *)self expanded]];
    v9 = self->_sectionSnapshot;
    self->_sectionSnapshot = v8;

    v10 = [(HomeOutlineSectionController *)self _sectionSnapshotByProcessingDeletionsInSectionSnapshot:self->_sectionSnapshot];
    v11 = self->_sectionSnapshot;
    self->_sectionSnapshot = v10;

    [(MapsUIDiffableDataSourceIdentifierCache *)self->_identifierCache markGeneration];
    sectionSnapshot = self->_sectionSnapshot;
  }

  return sectionSnapshot;
}

- (void)invalidateSectionSnapshot
{
  sectionSnapshot = self->_sectionSnapshot;
  self->_sectionSnapshot = 0;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = [(HomeOutlineSectionController *)self dataProviders];
    id v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * i) setActive:v3];
        }
        id v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v7);
    }

    if (v3)
    {
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      long long v25 = 0uLL;
      long long v26 = 0uLL;
      v10 = [(HomeOutlineSectionController *)self dataProviders];
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_super v15 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) observers];
            [v15 registerObserver:self];
          }
          id v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v12);
      }
    }
    else
    {
      long long v23 = 0uLL;
      long long v24 = 0uLL;
      *((void *)&v21 + 1) = 0;
      long long v22 = 0uLL;
      v10 = [(HomeOutlineSectionController *)self dataProviders];
      id v16 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v22;
        do
        {
          for (k = 0; k != v17; k = (char *)k + 1)
          {
            if (*(void *)v22 != v18) {
              objc_enumerationMutation(v10);
            }
            v20 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)k) observers];
            [v20 unregisterObserver:self];
          }
          id v17 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
        }
        while (v17);
      }
    }
  }
}

- (void)_loadExpandedIdentifierPaths
{
  id v10 = +[NSSet setWithObject:self->_sectionIdentifierPath];
  if ([(HomeOutlineSectionController *)self persistsExpansions])
  {
    BOOL v3 = [(HomeOutlineSectionController *)self configuration];
    v4 = [v3 storage];
    id v5 = [(HomeOutlineSectionController *)self configuration];
    id v6 = [v5 sectionIdentifier];
    id v7 = [v4 expandedIdentifierPathsInSection:v6 defaultExpandedIdentifierPaths:v10];
  }
  else
  {
    id v7 = v10;
  }
  uint64_t v8 = +[NSMutableSet setWithSet:v7];
  expandedIdentifierPaths = self->_expandedIdentifierPaths;
  self->_expandedIdentifierPaths = v8;
}

- (void)_storeExpandedIdentifierPaths
{
  if ([(HomeOutlineSectionController *)self persistsExpansions])
  {
    expandedIdentifierPaths = self->_expandedIdentifierPaths;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100490D38;
    v9[3] = &unk_1012EBC68;
    v9[4] = self;
    v4 = [(NSMutableSet *)expandedIdentifierPaths objectsPassingTest:v9];
    id v5 = [(HomeOutlineSectionController *)self configuration];
    id v6 = [v5 storage];
    id v7 = [(HomeOutlineSectionController *)self configuration];
    uint64_t v8 = [v7 sectionIdentifier];
    [v6 storeExpandedIdentifierPaths:v4 forSection:v8];
  }
}

- (BOOL)expanded
{
  expandedIdentifierPaths = self->_expandedIdentifierPaths;
  BOOL v3 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  LOBYTE(expandedIdentifierPaths) = [(NSMutableSet *)expandedIdentifierPaths containsObject:v3];

  return (char)expandedIdentifierPaths;
}

- (void)expandElementAtIdentifierPath:(id)a3
{
  id v7 = a3;
  v4 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  unsigned int v5 = [v7 hasPrefix:v4];

  if (v5
    && ([(NSMutableSet *)self->_expandedIdentifierPaths containsObject:v7] & 1) == 0)
  {
    [(NSMutableSet *)self->_expandedIdentifierPaths addObject:v7];
    id v6 = [(HomeOutlineSectionController *)self delegate];
    [v6 sectionController:self setNeedsApplySnapshotAnimated:1];

    [(HomeOutlineSectionController *)self _storeExpandedIdentifierPaths];
  }
}

- (void)collapseElementAtIdentifierPath:(id)a3
{
  id v7 = a3;
  v4 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  unsigned int v5 = [v7 hasPrefix:v4];

  if (v5 && [(NSMutableSet *)self->_expandedIdentifierPaths containsObject:v7])
  {
    [(NSMutableSet *)self->_expandedIdentifierPaths removeObject:v7];
    id v6 = [(HomeOutlineSectionController *)self delegate];
    [v6 sectionController:self setNeedsApplySnapshotAnimated:1];

    [(HomeOutlineSectionController *)self _storeExpandedIdentifierPaths];
  }
}

- (void)toggleElementAtIdentifierPath:(id)a3
{
  expandedIdentifierPaths = self->_expandedIdentifierPaths;
  id v5 = a3;
  if (-[NSMutableSet containsObject:](expandedIdentifierPaths, "containsObject:")) {
    [(HomeOutlineSectionController *)self collapseElementAtIdentifierPath:v5];
  }
  else {
    [(HomeOutlineSectionController *)self expandElementAtIdentifierPath:v5];
  }
}

- (BOOL)shouldPersistExpandedIdentifierPath:(id)a3
{
  return 1;
}

- (NSSet)selectedIdentifierPaths
{
  BOOL v3 = [(HomeOutlineSectionController *)self configuration];
  v4 = [v3 collectionView];
  id v5 = [v4 indexPathsForSelectedItems];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100491060;
  v9[3] = &unk_1012EBC90;
  v9[4] = self;
  id v6 = sub_100099700(v5, v9);
  id v7 = +[NSSet setWithArray:v6];

  return (NSSet *)v7;
}

- (MapsUIDiffableDataSourceIdentifierCache)identifierCache
{
  identifierCache = self->_identifierCache;
  if (!identifierCache)
  {
    v4 = objc_alloc_init(MapsUIDiffableDataSourceIdentifierCache);
    id v5 = self->_identifierCache;
    self->_identifierCache = v4;

    identifierCache = self->_identifierCache;
  }

  return identifierCache;
}

- (id)contentInjectorForSnapshot:(id)a3
{
  return 0;
}

- (id)shareItemSourceForSnapshot:(id)a3
{
  return 0;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_active && [v5 active])
  {
    v4 = [(HomeOutlineSectionController *)self delegate];
    [v4 sectionController:self setNeedsApplySnapshotAnimated:1];
  }
}

- (void)beginDeletions:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = sub_1000AA148();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v22 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "HomeOutlineSectionController addDeletion: %@", buf, 0xCu);
        }

        deletions = self->_deletions;
        id v12 = [v9 identifierPath];
        uint64_t v13 = [(NSMutableDictionary *)deletions objectForKeyedSubscript:v12];

        if (v13)
        {
          id v16 = v4;
          goto LABEL_13;
        }
        v14 = self->_deletions;
        objc_super v15 = [v9 identifierPath];
        [(NSMutableDictionary *)v14 setObject:v9 forKeyedSubscript:v15];
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v16 = [(HomeOutlineSectionController *)self delegate];
  [v16 sectionController:self setNeedsApplySnapshotAnimated:1];
LABEL_13:
}

- (void)endFailedDeletions:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) markAsCompletedWithSuccess:0 error:v7];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  [(HomeOutlineSectionController *)self _removeDeletions:v6 applySnapshot:1];
}

- (void)_removeDeletions:(id)a3 applySnapshot:(BOOL)a4
{
  BOOL v20 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = sub_1000AA148();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v26 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "HomeOutlineSectionController removeDeletion: %@", buf, 0xCu);
        }

        deletions = self->_deletions;
        long long v13 = [v10 identifierPath];
        long long v14 = [(NSMutableDictionary *)deletions objectForKeyedSubscript:v13];

        if (!v14)
        {
          long long v19 = v5;
          goto LABEL_14;
        }
        long long v15 = self->_deletions;
        id v16 = [v10 identifierPath];
        [(NSMutableDictionary *)v15 setObject:0 forKeyedSubscript:v16];

        expandedIdentifierPaths = self->_expandedIdentifierPaths;
        long long v18 = [v10 identifierPath];
        [(NSMutableSet *)expandedIdentifierPaths removeObject:v18];
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (v20)
  {
    long long v19 = [(HomeOutlineSectionController *)self delegate];
    [v19 sectionController:self setNeedsApplySnapshotAnimated:1];
LABEL_14:
  }
}

- (id)deletionWithSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [(HomeOutlineSectionController *)self delegate];
  id v6 = [v4 identifierPath];
  id v7 = [v5 sectionController:self indexPathForIdentifierPath:v6];

  uint64_t v8 = [HomeDeletion alloc];
  id v9 = [v4 identifierPath];
  uint64_t v10 = [(HomeDeletion *)v8 initWithObject:v4 indexPath:v7 identifierPath:v9 contextualActionCompletionHandler:0];

  return v10;
}

- (id)_sectionSnapshotByProcessingDeletionsInSectionSnapshot:(id)a3
{
  id v4 = a3;
  [(HomeOutlineSectionController *)self _scrubDeletionsWithSectionSnapshot:v4];
  uint64_t v5 = [(HomeOutlineSectionController *)self _snapshotByFilteringDeletionsFromSnapshot:v4];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (void)_scrubDeletionsWithSectionSnapshot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(NSMutableDictionary *)self->_deletions copy];
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
        long long v12 = [(NSMutableDictionary *)self->_deletions objectForKeyedSubscript:v11];
        long long v13 = [v11 identifierPathByRemovingFirstIdentifier];
        long long v14 = [v4 nodeSnapshotAtIdentifierPath:v13];

        if (!v14 && ([v12 completed] & 1) == 0) {
          [v12 markAsCompletedWithSuccess:1 error:0];
        }
        if ([v12 completed]) {
          [v5 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [(HomeOutlineSectionController *)self _removeDeletions:v5 applySnapshot:0];
  }
}

- (id)_snapshotByFilteringDeletionsFromSnapshot:(id)a3
{
  id v4 = (MapsUIDiffableDataSourceOutlineNodeSnapshot *)a3;
  deletions = self->_deletions;
  id v6 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v4 identifierPath];
  id v7 = [(NSMutableDictionary *)deletions objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v4 childSnapshots];
    id v10 = [v9 count];

    if (v10)
    {
      uint64_t v19 = 0;
      BOOL v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      id v11 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v4 childSnapshots];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100491C04;
      v18[3] = &unk_1012EBCB8;
      v18[4] = self;
      v18[5] = &v19;
      long long v12 = sub_100099700(v11, v18);

      if (*((unsigned char *)v20 + 24))
      {
        long long v13 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
        long long v14 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v4 identifierPath];
        long long v15 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v4 viewModel];
        long long v16 = [(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v13 initWithIdentifierPath:v14 viewModel:v15 childSnapshots:v12 expanded:[(MapsUIDiffableDataSourceOutlineNodeSnapshot *)v4 expanded]];

        id v4 = v16;
      }

      _Block_object_dispose(&v19, 8);
    }
    id v4 = v4;
    id v8 = v4;
  }

  return v8;
}

- (void)clearSelectionWithReason:(id)a3
{
  id v8 = a3;
  id v4 = [(HomeOutlineSectionController *)self selectedIdentifierPaths];
  uint64_t v5 = [v4 anyObject];

  if (v5
    && [(HomeOutlineSectionController *)self shouldClearSelectionWithReason:v8])
  {
    id v6 = [(HomeOutlineSectionController *)self delegate];
    [v6 sectionController:self deselectItemAtIdentifierPath:v5];

    id v7 = [(HomeOutlineSectionController *)self delegate];
    [v7 sectionController:self setNeedsApplySnapshotAnimated:1];
  }
}

- (BOOL)shouldClearSelectionWithReason:(id)a3
{
  return [a3 action] != (id)2;
}

- (void)_updateDragAndDropPreview
{
  dragAndDropPreview = self->_dragAndDropPreview;
  if (dragAndDropPreview)
  {
    id v4 = [(DragAndDropPreview *)dragAndDropPreview renderPreviewImage];
    [v4 dragPreview];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100491E20;
    v7[3] = &unk_1012EBCE0;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    dragItem = self->_dragItem;
    id v6 = v8;
    [(UIDragItem *)dragItem setPreviewProvider:v7];
  }
}

- (BOOL)isSourceOfDropCoordinator:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [a3 items];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) sourceIndexPath];
        id v10 = [(HomeOutlineSectionController *)self delegate];
        uint64_t v11 = [v10 sectionController:self nodeSnapshotAtIndexPath:v9];
        long long v12 = [(id)v11 identifierPath];

        long long v13 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
        LOBYTE(v11) = [v12 hasPrefix:v13];

        if (v11)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)isDestinationOfDropCoordinator:(id)a3
{
  id v4 = [a3 destinationIndexPath];
  id v5 = [(HomeOutlineSectionController *)self delegate];
  id v6 = [v5 sectionController:self nodeSnapshotAtIndexPath:v4];
  uint64_t v7 = [v6 identifierPath];

  id v8 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
  LOBYTE(v5) = [v7 hasPrefix:v8];

  return (char)v5;
}

- (id)mapItemForDropSession:(id)a3
{
  id v3 = a3;
  id v4 = [v3 items];
  id v5 = [v4 count];

  if (v5 == (id)1)
  {
    id v6 = [v3 items];
    uint64_t v7 = [v6 firstObject];

    id v8 = [v7 localObject];
    if ([v8 conformsToProtocol:&OBJC_PROTOCOL___MapsDragMapItemProviding]) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [v10 draggedMapItem];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)dragAndDropItem:(id)a3 didResolveMapItem:(id)a4
{
}

- (void)dragAndDropPreviewDidUpdate:(id)a3
{
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HomeOutlineSectionController *)self delegate];
  uint64_t v7 = [v6 sectionController:self nodeSnapshotAtIndexPath:v5];

  id v8 = [v7 viewModel];
  LODWORD(v6) = [v8 conformsToProtocol:&OBJC_PROTOCOL___HomeCellModel];

  BOOL v11 = 0;
  if (v6)
  {
    uint64_t v9 = [v7 viewModel];
    id v10 = [v9 homeActionObject];

    if (v10) {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  +[GEOAPPortal captureUserAction:2007 target:8 value:0];
  uint64_t v7 = [(HomeOutlineSectionController *)self delegate];
  id v8 = [v7 sectionController:self nodeSnapshotAtIndexPath:v6];

  uint64_t v9 = [v8 viewModel];
  unsigned int v10 = [v9 conformsToProtocol:&OBJC_PROTOCOL___HomeCellModel];

  if (v10)
  {
    BOOL v11 = [v8 viewModel];
    long long v12 = [v11 homeActionObject];

    if (v12)
    {
      long long v13 = [(HomeOutlineSectionController *)self configuration];
      BOOL v14 = [v13 homeActionDelegate];
      long long v15 = [v11 homeActionObject];
      [v14 homeItemTapped:v15];
    }
  }
  long long v16 = +[NSUserDefaults standardUserDefaults];
  long long v17 = [v16 objectForKey:@"SIDEBAR_SELECTION_ENABLED_KEY"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v18 = [v17 BOOLValue];

    if ((v18 & 1) == 0) {
      [v19 deselectItemAtIndexPath:v6 animated:1];
    }
  }
  else
  {
  }
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  [a4 nextFocusedIndexPath:a3];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  focusedIdentifierPath = self->_focusedIdentifierPath;
  self->_focusedIdentifierPath = 0;

  uint64_t v7 = v15;
  if (v15)
  {
    id v8 = [(HomeOutlineSectionController *)self delegate];
    uint64_t v9 = [v8 sectionController:self nodeSnapshotAtIndexPath:v15];

    unsigned int v10 = [v9 identifierPath];
    BOOL v11 = [(HomeOutlineSectionController *)self sectionIdentifierPath];
    unsigned int v12 = [v10 hasPrefix:v11];

    if (v12)
    {
      long long v13 = [v9 identifierPath];
      BOOL v14 = self->_focusedIdentifierPath;
      self->_focusedIdentifierPath = v13;
    }
    uint64_t v7 = v15;
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count] == (id)1)
  {
    uint64_t v9 = [v8 firstObject];
    unsigned int v10 = [(HomeOutlineSectionController *)self delegate];
    BOOL v11 = [v10 sectionController:self nodeSnapshotAtIndexPath:v9];

    objc_initWeak(&location, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100492648;
    v17[3] = &unk_1012EBD08;
    objc_copyWeak(&v19, &location);
    id v12 = v11;
    id v18 = v12;
    long long v13 = objc_retainBlock(v17);
    BOOL v14 = [v12 identifierPath];
    id v15 = +[UIContextMenuConfiguration configurationWithIdentifier:v14 previewProvider:0 actionProvider:v13];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(HomeOutlineSectionController *)self delegate];
  unsigned int v10 = [v9 sectionController:self nodeSnapshotAtIndexPath:v8];

  BOOL v11 = [v10 viewModel];
  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___HomeCellModel]) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13
    && ([v13 homeDragAndDropObject], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v15 = (void *)v14,
        +[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:", v14), long long v16 = objc_claimAutoreleasedReturnValue(), [v16 setObserver:self], v15, v16))
  {
    long long v17 = [DragAndDropPreview alloc];
    id v18 = [v7 traitCollection];
    id v19 = [(DragAndDropPreview *)v17 initWithDragAndDropMapItem:v16 traitCollection:v18];
    dragAndDropPreview = self->_dragAndDropPreview;
    self->_dragAndDropPreview = v19;

    [(DragAndDropPreview *)self->_dragAndDropPreview setContentUpdateDelegate:self];
    uint64_t v21 = [v16 itemProvider];
    char v22 = (UIDragItem *)[objc_alloc((Class)UIDragItem) initWithItemProvider:v21];
    dragItem = self->_dragItem;
    self->_dragItem = v22;

    long long v24 = [[HomeDragLocalContext alloc] initWithItemSnapshot:v10 dragAndDropMapItem:v16];
    [(UIDragItem *)self->_dragItem setLocalObject:v24];

    long long v27 = self->_dragItem;
    long long v25 = +[NSArray arrayWithObjects:&v27 count:1];
  }
  else
  {
    long long v25 = &__NSArray0__struct;
  }

  return v25;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  dragItem = self->_dragItem;
  self->_dragItem = 0;

  [(DragAndDropPreview *)self->_dragAndDropPreview setContentUpdateDelegate:0];
  dragAndDropPreview = self->_dragAndDropPreview;
  self->_dragAndDropPreview = 0;
}

- (NSArray)dataProviders
{
  return (NSArray *)&__NSArray0__struct;
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  v2 = [[SectionHeaderBasicOutlineCellModel alloc] initWithTitle:&stru_101324E70];

  return (MapsUIDiffableDataSourceViewModel *)v2;
}

- (NSArray)itemSnapshots
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)contextMenuForSnapshot:(id)a3
{
  return 0;
}

- (BOOL)persistsExpansions
{
  return 0;
}

- (NSDictionary)deletions
{
  return &self->_deletions->super;
}

- (NSSet)expandedIdentifierPaths
{
  return &self->_expandedIdentifierPaths->super;
}

- (HomeOutlineSectionControllerConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)active
{
  return self->_active;
}

- (IdentifierPath)sectionIdentifierPath
{
  return self->_sectionIdentifierPath;
}

- (IdentifierPath)focusedIdentifierPath
{
  return self->_focusedIdentifierPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedIdentifierPath, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierPath, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dragAndDropPreview, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_storeStrong((id *)&self->_expandedIdentifierPaths, 0);
  objc_storeStrong((id *)&self->_identifierCache, 0);
  objc_storeStrong((id *)&self->_deletions, 0);

  objc_storeStrong((id *)&self->_sectionSnapshot, 0);
}

@end