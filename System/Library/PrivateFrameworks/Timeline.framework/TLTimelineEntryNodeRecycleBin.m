@interface TLTimelineEntryNodeRecycleBin
+ (id)sharedRecycleBin;
- (id)_init;
- (id)retrieveRecycledEntryNode;
- (unint64_t)maximumNumberOfRecycledNodes;
- (unint64_t)numberOfRecycledNodes;
- (void)emptyRecycleBin;
- (void)recycleEntryNode:(id)a3;
@end

@implementation TLTimelineEntryNodeRecycleBin

+ (id)sharedRecycleBin
{
  if (sharedRecycleBin_onceToken != -1) {
    dispatch_once(&sharedRecycleBin_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedRecycleBin_bin;
  return v2;
}

uint64_t __49__TLTimelineEntryNodeRecycleBin_sharedRecycleBin__block_invoke()
{
  sharedRecycleBin_bin = [[TLTimelineEntryNodeRecycleBin alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)TLTimelineEntryNodeRecycleBin;
  return [(TLTimelineEntryNodeRecycleBin *)&v3 init];
}

- (void)recycleEntryNode:(id)a3
{
  id v3 = a3;
  v4 = [v3 leftNode];
  id v5 = [v4 rightNode];

  if (v5 == v3)
  {
    v6 = [v3 leftNode];
    [v6 setRightNode:0];
  }
  v7 = [v3 rightNode];
  id v8 = [v7 leftNode];

  if (v8 == v3)
  {
    v9 = [v3 rightNode];
    [v9 setLeftNode:0];
  }
  [v3 setLeftNode:0];
  [v3 setRightNode:0];
  id v16 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v16;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    [v11 setEntry:0];
    v12 = _SharedRecycleBin();
    objc_sync_enter(v12);
    v13 = _SharedRecycleBin();
    unint64_t v14 = [v13 count];

    if (v14 <= 0x3E7)
    {
      v15 = _SharedRecycleBin();
      [v15 addObject:v11];
    }
    objc_sync_exit(v12);
  }
}

- (id)retrieveRecycledEntryNode
{
  v2 = _SharedRecycleBin();
  objc_sync_enter(v2);
  id v3 = _SharedRecycleBin();
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = _SharedRecycleBin();
    v6 = [v5 anyObject];

    v7 = _SharedRecycleBin();
    [v7 removeObject:v6];
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  if (!v6) {
    v6 = objc_alloc_init(TLTimelineEntryNode);
  }
  return v6;
}

- (void)emptyRecycleBin
{
  _SharedRecycleBin();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = _SharedRecycleBin();
  [v2 removeAllObjects];

  objc_sync_exit(obj);
}

- (unint64_t)numberOfRecycledNodes
{
  v2 = _SharedRecycleBin();
  objc_sync_enter(v2);
  id v3 = _SharedRecycleBin();
  unint64_t v4 = [v3 count];

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)maximumNumberOfRecycledNodes
{
  return 1000;
}

@end