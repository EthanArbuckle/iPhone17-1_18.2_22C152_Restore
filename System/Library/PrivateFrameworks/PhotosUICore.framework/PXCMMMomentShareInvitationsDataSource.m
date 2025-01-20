@interface PXCMMMomentShareInvitationsDataSource
+ (PXCMMMomentShareInvitationsDataSource)new;
- (PXCMMMomentShareInvitationsDataSource)init;
- (PXCMMMomentShareInvitationsDataSource)initWithState:(id)a3;
- (PXCMMMomentShareInvitationsDataSourceState)state;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)invitationForObjectID:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXCMMMomentShareInvitationsDataSource

- (void).cxx_destruct
{
}

- (PXCMMMomentShareInvitationsDataSourceState)state
{
  return self->_state;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  v19.receiver = self;
  v19.super_class = (Class)PXCMMMomentShareInvitationsDataSource;
  [(PXSimpleIndexPath *)&v19 indexPathForObjectReference:v6];
  uint64_t v7 = v20;
  if ((void)v20 == *(void *)off_1E5DAAED8)
  {
    if (v6)
    {
      [v6 indexPath];
      if (v16 != v7 && v17 != 0x7FFFFFFFFFFFFFFFLL && v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = [v6 itemObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v10 = [(PXCMMMomentShareInvitationsDataSourceState *)self->_state momentShares];
          v11 = [v6 itemObject];
          v12 = [v11 momentShare];
          uint64_t v13 = [v10 indexOfObject:v12];

          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v20 = (unint64_t)[(PXCMMMomentShareInvitationsDataSource *)self identifier];
            *(void *)&long long v21 = v13;
            *((void *)&v21 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
  }
  long long v14 = v21;
  *(_OWORD *)&retstr->dataSourceIdentifier = v20;
  *(_OWORD *)&retstr->item = v14;

  return result;
}

- (id)invitationForObjectID:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 500, @"Invalid parameter not satisfying: %@", @"momentShareObjectID" object file lineNumber description];
  }
  id v6 = [(PXCMMMomentShareInvitationsDataSourceState *)self->_state invitationsByMomentShareObjectID];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v8 = [(PXCMMMomentShareInvitationsDataSourceState *)self->_state momentShares];
    v9 = [v8 photoLibrary];

    id v10 = objc_alloc(MEMORY[0x1E4F39150]);
    v17[0] = v5;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    v12 = [MEMORY[0x1E4F391B0] fetchType];
    uint64_t v13 = (void *)[v10 initWithOids:v11 photoLibrary:v9 fetchType:v12 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

    long long v14 = [v13 firstObject];
    uint64_t v7 = +[PXCMMMomentShareInvitation invitationWithMomentShare:v14];
  }
  return v7;
}

- (id)objectIDAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  unint64_t item = a3->item;
  uint64_t v7 = [(PXCMMMomentShareInvitationsDataSourceState *)self->_state momentShares];
  v8 = [v7 fetchedObjectIDs];
  unint64_t v9 = [v8 count];

  if (item >= v9)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 494, @"Invalid parameter not satisfying: %@", @"indexPath.item < _state.momentShares.fetchedObjectIDs.count" object file lineNumber description];
  }
  id v10 = [(PXCMMMomentShareInvitationsDataSourceState *)self->_state momentShares];
  v11 = [v10 fetchedObjectIDs];
  v12 = [v11 objectAtIndexedSubscript:a3->item];

  return v12;
}

- (id)invitationAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXCMMMomentShareInvitationsDataSource *)self objectAtIndexPath:v6];
  return v4;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXCMMMomentShareInvitationsDataSource *)self identifier])
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 471, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8)
  {
LABEL_14:
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXCMMMomentShareInvitationsDataSourceManager.m" lineNumber:482 description:@"Code which should be unreachable has been reached"];

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
    v8 = @"PXCMMMomentShareInvitationsDataSourceSection";
    goto LABEL_11;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  unint64_t v9 = [(PXCMMMomentShareInvitationsDataSourceState *)self->_state momentShares];
  id v10 = [v9 fetchedObjectIDs];
  v11 = [v10 objectAtIndex:a3->item];

  v8 = [(PXCMMMomentShareInvitationsDataSource *)self invitationForObjectID:v11];

LABEL_11:
  return v8;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  long long v3 = [(PXCMMMomentShareInvitationsDataSourceState *)self->_state momentShares];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXCMMMomentShareInvitationsDataSource)init
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 454, @"%s is not available as initializer", "-[PXCMMMomentShareInvitationsDataSource init]");

  abort();
}

- (PXCMMMomentShareInvitationsDataSource)initWithState:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitationsDataSourceManager.m", 445, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXCMMMomentShareInvitationsDataSource;
  uint64_t v7 = [(PXCMMMomentShareInvitationsDataSource *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_state, a3);
  }

  return v8;
}

+ (PXCMMMomentShareInvitationsDataSource)new
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMMomentShareInvitationsDataSourceManager.m", 458, @"%s is not available as initializer", "+[PXCMMMomentShareInvitationsDataSource new]");

  abort();
}

@end