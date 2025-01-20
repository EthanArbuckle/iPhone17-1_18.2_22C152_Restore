@interface PXCMMMomentsInvitationsDataSource
- (PXCMMMomentsInvitationsDataSource)initWithState:(id)a3;
- (PXCMMMomentsInvitationsDataSourceState)_state;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)invitationForObjectID:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXCMMMomentsInvitationsDataSource

- (void).cxx_destruct
{
}

- (PXCMMMomentsInvitationsDataSourceState)_state
{
  return self->__state;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  v20.receiver = self;
  v20.super_class = (Class)PXCMMMomentsInvitationsDataSource;
  [(PXSimpleIndexPath *)&v20 indexPathForObjectReference:v6];
  uint64_t v7 = v21;
  if ((void)v21 == *(void *)off_1E5DAAED8)
  {
    if (v6)
    {
      [v6 indexPath];
      if (v17 != v7 && v18 != 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = [v6 itemObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v10 = [(PXCMMMomentsInvitationsDataSource *)self _state];
          v11 = [v10 assetCollections];
          v12 = [v6 itemObject];
          v13 = [v12 assetCollection];
          uint64_t v14 = [v11 indexOfObject:v13];

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v21 = (unint64_t)[(PXCMMMomentsInvitationsDataSource *)self identifier];
            *(void *)&long long v22 = v14;
            *((void *)&v22 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
  }
  long long v15 = v22;
  *(_OWORD *)&retstr->dataSourceIdentifier = v21;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (id)invitationForObjectID:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXCMMMomentsInvitationsDataSourceManager.m", 389, @"Invalid parameter not satisfying: %@", @"assetCollectionObjectID" object file lineNumber description];
  }
  id v6 = [(PXCMMMomentsInvitationsDataSource *)self _state];
  uint64_t v7 = [v6 invitationsByAssetCollectionObjectID];
  v8 = [v7 objectForKeyedSubscript:v5];

  if (!v8)
  {
    v9 = [v6 photoLibrary];
    id v10 = objc_alloc(MEMORY[0x1E4F39150]);
    v17[0] = v5;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v12 = [MEMORY[0x1E4F38EE8] fetchType];
    v13 = (void *)[v10 initWithOids:v11 photoLibrary:v9 fetchType:v12 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

    uint64_t v14 = [v13 firstObject];
    v8 = +[PXCMMMomentsInvitation invitationWithAssetCollection:v14];
  }
  return v8;
}

- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  unint64_t item = a3->item;
  uint64_t v7 = [(PXCMMMomentsInvitationsDataSource *)self _state];
  v8 = [v7 assetCollections];
  v9 = [v8 fetchedObjectIDs];
  unint64_t v10 = [v9 count];

  if (item >= v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXCMMMomentsInvitationsDataSourceManager.m", 383, @"Invalid parameter not satisfying: %@", @"indexPath.item < self._state.assetCollections.fetchedObjectIDs.count" object file lineNumber description];
  }
  v11 = [(PXCMMMomentsInvitationsDataSource *)self _state];
  v12 = [v11 assetCollections];
  v13 = [v12 fetchedObjectIDs];
  uint64_t v14 = [v13 objectAtIndexedSubscript:a3->item];

  return v14;
}

- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXCMMMomentsInvitationsDataSource *)self objectAtIndexPath:v6];
  return v4;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXCMMMomentsInvitationsDataSource *)self identifier])
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXCMMMomentsInvitationsDataSourceManager.m", 359, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8)
  {
LABEL_14:
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXCMMMomentsInvitationsDataSourceManager.m" lineNumber:371 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int64_t item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = @"PXCMMMomentsInvitationsDataSourceSection";
    goto LABEL_11;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  v9 = [(PXCMMMomentsInvitationsDataSource *)self _state];
  unint64_t v10 = [v9 assetCollections];
  v11 = [v10 fetchedObjectIDs];
  v12 = [v11 objectAtIndex:a3->item];

  v8 = [(PXCMMMomentsInvitationsDataSource *)self invitationForObjectID:v12];

LABEL_11:
  return v8;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  long long v3 = [(PXCMMMomentsInvitationsDataSource *)self _state];
  v4 = [v3 assetCollections];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXCMMMomentsInvitationsDataSource)initWithState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCMMMomentsInvitationsDataSource;
  id v6 = [(PXCMMMomentsInvitationsDataSource *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__state, a3);
  }

  return v7;
}

@end