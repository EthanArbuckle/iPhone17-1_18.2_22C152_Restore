@interface PXPeopleDataSource
- (BOOL)isDisclosed;
- (BOOL)useAsynchronousLoad;
- (NSArray)members;
- (NSArray)persons;
- (NSPredicate)filterPredicate;
- (NSString)localizedDisclosedTitle;
- (NSString)localizedUndisclosedTitle;
- (NSString)name;
- (OS_dispatch_queue)reloadQueue;
- (PHFetchResult)objects;
- (PXPeopleDataSource)initWithName:(id)a3 objects:(id)a4;
- (PXPeopleDataSource)initWithName:(id)a3 objectsReloadBlock:(id)a4;
- (PXPeopleDataSource)initWithName:(id)a3 objectsReloadBlock:(id)a4 asynchronousLoad:(BOOL)a5 callbackDelegate:(id)a6;
- (PXPeopleDataSourceDelegate)delegate;
- (id)_itemsArrayFromObjects:(id)a3;
- (id)defaultComparator;
- (id)localizedTitle;
- (id)memberAtIndex:(unint64_t)a3;
- (id)personAtIndex:(unint64_t)a3;
- (id)reloadBlock;
- (id)sortComparator;
- (id)titleAtIndex:(unint64_t)a3;
- (unint64_t)maximumNumberOfMembers;
- (unint64_t)numberOfMembers;
- (unint64_t)photoQuantityAtIndex:(unint64_t)a3;
- (void)_asyncLoadImageForItem:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6;
- (void)_setObjectsWithoutUpdate:(id)a3;
- (void)_updateMembers;
- (void)dealloc;
- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6;
- (void)loadObjectsAndUpdateMembersWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosed:(BOOL)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setLocalizedDisclosedTitle:(id)a3;
- (void)setLocalizedUndisclosedTitle:(id)a3;
- (void)setMaximumNumberOfMembers:(unint64_t)a3;
- (void)setMembers:(id)a3;
- (void)setName:(id)a3;
- (void)setObjects:(id)a3;
- (void)setReloadBlock:(id)a3;
- (void)setReloadQueue:(id)a3;
- (void)setSortComparator:(id)a3;
@end

@implementation PXPeopleDataSource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reloadBlock, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong(&self->_sortComparator, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_localizedUndisclosedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDisclosedTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)reloadBlock
{
  return self->_reloadBlock;
}

- (PHFetchResult)objects
{
  return self->_objects;
}

- (BOOL)useAsynchronousLoad
{
  return self->_useAsynchronousLoad;
}

- (void)setReloadQueue:(id)a3
{
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setMembers:(id)a3
{
}

- (NSArray)members
{
  return self->_members;
}

- (id)sortComparator
{
  return self->_sortComparator;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setDisclosed:(BOOL)a3
{
  self->_disclosed = a3;
}

- (BOOL)isDisclosed
{
  return self->_disclosed;
}

- (void)setLocalizedUndisclosedTitle:(id)a3
{
}

- (NSString)localizedUndisclosedTitle
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalizedDisclosedTitle:(id)a3
{
}

- (NSString)localizedDisclosedTitle
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (PXPeopleDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPeopleDataSourceDelegate *)WeakRetained;
}

- (void)setMaximumNumberOfMembers:(unint64_t)a3
{
  self->_maximumNumberOfMembers = a3;
}

- (unint64_t)maximumNumberOfMembers
{
  return self->_maximumNumberOfMembers;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)_asyncLoadImageForItem:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  if (a6)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    v8 = (void (**)(id, void, id, double, double, double, double))a6;
    objc_msgSend(v7, "px_genericErrorWithDebugDescription:", @"Self isn't subclassed, returning a nil image: %@", self);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9, *(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
  }
}

- (id)_itemsArrayFromObjects:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [PXPersonItem alloc];
        v12 = -[PXPersonItem initWithPerson:](v11, "initWithPerson:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_updateMembers
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PXPeopleDataSource__updateMembers__block_invoke;
  aBlock[3] = &unk_1E5DD36F8;
  aBlock[4] = self;
  id v3 = (void (**)(void))_Block_copy(aBlock);
  v4 = [(PXPeopleDataSource *)self reloadQueue];
  if (!v4
    || (label = dispatch_queue_get_label(0)) != 0 && !strcmp(label, "com.apple.Photos.PeopleDataSourceReloadQueue"))
  {
    v3[2](v3);
  }
  else
  {
    dispatch_sync(v4, v3);
  }
}

void __36__PXPeopleDataSource__updateMembers__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objects", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 addObject:*(void *)(*((void *)&v12 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [*(id *)(a1 + 32) filterPredicate];
  if (v8) {
    [v2 filterUsingPredicate:v8];
  }
  id v9 = [*(id *)(a1 + 32) _itemsArrayFromObjects:v2];
  uint64_t v10 = [*(id *)(a1 + 32) sortComparator];
  if (v10)
  {
    uint64_t v11 = [v9 sortedArrayUsingComparator:v10];

    id v9 = (void *)v11;
  }
  [*(id *)(a1 + 32) setMembers:v9];
}

- (void)loadObjectsAndUpdateMembersWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(PXPeopleDataSource *)self reloadQueue];
  if (v5)
  {
    if ([(PXPeopleDataSource *)self useAsynchronousLoad]) {
      uint64_t v6 = (void (*)(void *, void *))MEMORY[0x1E4F14768];
    }
    else {
      uint64_t v6 = (void (*)(void *, void *))MEMORY[0x1E4F147E8];
    }
    uint64_t v7 = [(PXPeopleDataSource *)self reloadBlock];
    uint64_t v8 = v7;
    if (v7)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke;
      v12[3] = &unk_1E5DCAF58;
      v12[4] = self;
      id v9 = &v13;
      id v13 = v7;
      long long v14 = v4;
      v6(v5, v12);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke_2;
      v10[3] = &unk_1E5DD3280;
      v10[4] = self;
      id v9 = (id *)&v11;
      uint64_t v11 = v4;
      v6(v5, v10);
    }
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  id v3 = (*(void (**)(void))(a1[5] + 16))();
  [v2 setObjects:v3];

  uint64_t result = a1[6];
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __64__PXPeopleDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMembers];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_setObjectsWithoutUpdate:(id)a3
{
}

- (void)setFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicate, a3);
  [(PXPeopleDataSource *)self _updateMembers];
}

- (void)setSortComparator:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id sortComparator = self->_sortComparator;
  self->_id sortComparator = v4;

  [(PXPeopleDataSource *)self _updateMembers];
}

- (void)setReloadBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id reloadBlock = self->_reloadBlock;
  self->_id reloadBlock = v4;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
  [(PXPeopleDataSource *)self _updateMembers];
}

- (id)defaultComparator
{
  return 0;
}

- (id)localizedTitle
{
  if ([(PXPeopleDataSource *)self isDisclosed]) {
    [(PXPeopleDataSource *)self localizedDisclosedTitle];
  }
  else {
  id v3 = [(PXPeopleDataSource *)self localizedUndisclosedTitle];
  }
  return v3;
}

- (unint64_t)photoQuantityAtIndex:(unint64_t)a3
{
  id v3 = [(PXPeopleDataSource *)self personAtIndex:a3];
  unint64_t v4 = [v3 faceCount];

  return v4;
}

- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = [(PXPeopleDataSource *)self memberAtIndex:a3];
  -[PXPeopleDataSource _asyncLoadImageForItem:targetSize:displayScale:resultHandler:](self, "_asyncLoadImageForItem:targetSize:displayScale:resultHandler:", v12, v11, width, height, a5);
}

- (id)titleAtIndex:(unint64_t)a3
{
  id v3 = [(PXPeopleDataSource *)self personAtIndex:a3];
  unint64_t v4 = [v3 name];

  return v4;
}

- (id)personAtIndex:(unint64_t)a3
{
  id v3 = [(PXPeopleDataSource *)self memberAtIndex:a3];
  unint64_t v4 = [v3 modelObject];

  return v4;
}

- (id)memberAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(PXPeopleDataSource *)self members];
  if ([v4 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (unint64_t)numberOfMembers
{
  id v3 = [(PXPeopleDataSource *)self members];
  unint64_t v4 = [v3 count];

  unint64_t v5 = [(PXPeopleDataSource *)self maximumNumberOfMembers];
  if (v4 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v5) {
    return v6;
  }
  else {
    return v4;
  }
}

- (NSArray)persons
{
  v2 = [(PXPeopleDataSource *)self members];
  id v3 = PFMap();

  return (NSArray *)v3;
}

uint64_t __29__PXPeopleDataSource_persons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 modelObject];
}

- (void)dealloc
{
  [(PXPeopleDataSource *)self stopListeningForChanges];
  [(PXPeopleDataSource *)self setReloadQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleDataSource;
  [(PXPeopleDataSource *)&v3 dealloc];
}

- (PXPeopleDataSource)initWithName:(id)a3 objects:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleDataSource;
  id v9 = [(PXPeopleDataSource *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_objects, a4);
    uint64_t v11 = [(PXPeopleDataSource *)v10 defaultComparator];
    id sortComparator = v10->_sortComparator;
    v10->_id sortComparator = (id)v11;
  }
  return v10;
}

- (PXPeopleDataSource)initWithName:(id)a3 objectsReloadBlock:(id)a4 asynchronousLoad:(BOOL)a5 callbackDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXPeopleDataSource;
  objc_super v14 = [(PXPeopleDataSource *)&v24 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeWeak((id *)&v15->_delegate, v13);
    v15->_useAsynchronousLoad = a5;
    if (v12)
    {
      long long v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v17 = dispatch_queue_create("com.apple.Photos.PeopleDataSourceReloadQueue", v16);
      reloadQueue = v15->_reloadQueue;
      v15->_reloadQueue = (OS_dispatch_queue *)v17;

      uint64_t v19 = _Block_copy(v12);
      id reloadBlock = v15->_reloadBlock;
      v15->_id reloadBlock = v19;
    }
    uint64_t v21 = [(PXPeopleDataSource *)v15 defaultComparator];
    id sortComparator = v15->_sortComparator;
    v15->_id sortComparator = (id)v21;
  }
  return v15;
}

- (PXPeopleDataSource)initWithName:(id)a3 objectsReloadBlock:(id)a4
{
  return [(PXPeopleDataSource *)self initWithName:a3 objectsReloadBlock:a4 asynchronousLoad:0 callbackDelegate:0];
}

@end