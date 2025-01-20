@interface PXStoryTransientChapterCollectionManager
- (BOOL)_validateEditTransaction:(id)a3 error:(id *)a4;
- (BOOL)applyEditTransaction:(id)a3 error:(id *)a4;
- (NSArray)edits;
- (PXStoryChapterCollection)uneditedChapterCollection;
- (PXStoryTransientChapterCollectionManager)initWithUneditedChapterCollection:(id)a3;
- (PXStoryTransientChapterCollectionManagerPersistenceDelegate)persistenceDelegate;
- (PXUpdater)updater;
- (void)_invalidateChapterCollection;
- (void)_setNeedsUpdate;
- (void)_updateChapterCollection;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)setEdits:(id)a3;
- (void)setPersistenceDelegate:(id)a3;
- (void)setUneditedChapterCollection:(id)a3;
@end

@implementation PXStoryTransientChapterCollectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_persistenceDelegate);
  objc_storeStrong((id *)&self->_uneditedChapterCollection, 0);
}

- (NSArray)edits
{
  return self->_edits;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setPersistenceDelegate:(id)a3
{
}

- (PXStoryTransientChapterCollectionManagerPersistenceDelegate)persistenceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistenceDelegate);
  return (PXStoryTransientChapterCollectionManagerPersistenceDelegate *)WeakRetained;
}

- (PXStoryChapterCollection)uneditedChapterCollection
{
  return self->_uneditedChapterCollection;
}

- (void)setUneditedChapterCollection:(id)a3
{
  v5 = (PXStoryChapterCollection *)a3;
  if (self->_uneditedChapterCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_uneditedChapterCollection, a3);
    [(PXStoryTransientChapterCollectionManager *)self _invalidateChapterCollection];
    v5 = v6;
  }
}

- (void)_updateChapterCollection
{
  v3 = [(PXStoryTransientChapterCollectionManager *)self uneditedChapterCollection];
  v4 = [(PXStoryTransientChapterCollectionManager *)self edits];
  uint64_t v5 = [v4 count];
  id v6 = v3;
  v7 = v6;
  id v8 = v6;
  if (v5)
  {
    id v9 = (id)[v6 copyByApplyingEdits:v4];

    id v8 = v9;
  }
  id v10 = v8;
  [(PXStoryChapterCollectionManager *)self setChapterCollection:v8];
}

- (void)_invalidateChapterCollection
{
  id v2 = [(PXStoryTransientChapterCollectionManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChapterCollection];
}

- (void)_setNeedsUpdate
{
}

- (void)setEdits:(id)a3
{
  id v8 = (NSArray *)a3;
  v4 = self->_edits;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSArray *)[(NSArray *)v8 copy];
      edits = self->_edits;
      self->_edits = v6;

      [(PXStoryTransientChapterCollectionManager *)self _invalidateChapterCollection];
    }
  }
}

- (BOOL)_validateEditTransaction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 originalChapterCollection];
  if ([v6 conformsToProtocol:&unk_1F0355ED8])
  {
    id v7 = v6;
    id v8 = [v5 edits];
    id v12 = 0;
    char v9 = [v7 canApplyEdits:v8 error:&v12];

    id v10 = v12;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXStoryChapterErrorDomain" code:3 userInfo:0];
  char v9 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v10;
LABEL_6:

  return v9;
}

- (BOOL)applyEditTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v15 = 0;
  BOOL v7 = [(PXStoryTransientChapterCollectionManager *)self _validateEditTransaction:v6 error:&v15];
  id v8 = v15;
  if (v7)
  {
    char v9 = [(PXStoryTransientChapterCollectionManager *)self edits];
    id v10 = [v6 edits];
    v11 = [v9 arrayByAddingObjectsFromArray:v10];
    [(PXStoryTransientChapterCollectionManager *)self setEdits:v11];

    id v12 = [(PXStoryTransientChapterCollectionManager *)self updater];
    [v12 updateIfNeeded];

    v13 = [(PXStoryTransientChapterCollectionManager *)self persistenceDelegate];
    [v13 chapterCollectionManager:self didApplyEditTransaction:v6];
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransientChapterCollectionManager;
  [(PXStoryTransientChapterCollectionManager *)&v3 performChanges:a3];
}

- (void)didPerformChanges
{
  objc_super v3 = [(PXStoryTransientChapterCollectionManager *)self updater];
  [v3 updateIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)PXStoryTransientChapterCollectionManager;
  [(PXStoryChapterCollectionManager *)&v4 didPerformChanges];
}

- (PXStoryTransientChapterCollectionManager)initWithUneditedChapterCollection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryTransientChapterCollectionManager;
  id v6 = [(PXStoryChapterCollectionManager *)&v13 initWithChapterCollection:v5];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uneditedChapterCollection, a3);
    uint64_t v8 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v8;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateChapterCollection];
    id v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    edits = v7->_edits;
    v7->_edits = v10;
  }
  return v7;
}

@end