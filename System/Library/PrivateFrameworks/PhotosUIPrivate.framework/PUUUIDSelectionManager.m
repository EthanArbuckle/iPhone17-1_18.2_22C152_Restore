@interface PUUUIDSelectionManager
- (BOOL)isSelectedUUID:(id)a3;
- (BOOL)pu_isAssetReferenceSelected:(id)a3;
- (NSMutableSet)_mutableSelectedUUIDs;
- (NSSet)selectedUUIDs;
- (PUUUIDSelectionManager)init;
- (PUUUIDSelectionManager)initWithSelectedUUIDs:(id)a3;
- (void)addSelectedUUID:(id)a3;
- (void)deselectAllUUIDs;
- (void)performChanges:(id)a3;
- (void)pu_registerSelectionIndicatorObserver:(id)a3;
- (void)pu_unregisterSelectionIndicatorObserver:(id)a3;
- (void)removeSelectedUUID:(id)a3;
- (void)setSelectedUUIDs:(id)a3;
@end

@implementation PUUUIDSelectionManager

- (BOOL)pu_isAssetReferenceSelected:(id)a3
{
  v4 = [a3 asset];
  v5 = [v4 uuid];

  LOBYTE(self) = [(PUUUIDSelectionManager *)self isSelectedUUID:v5];
  return (char)self;
}

- (void)pu_unregisterSelectionIndicatorObserver:(id)a3
{
}

- (void)pu_registerSelectionIndicatorObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSMutableSet)_mutableSelectedUUIDs
{
  return self->__mutableSelectedUUIDs;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUUUIDSelectionManager;
  [(PUUUIDSelectionManager *)&v3 performChanges:a3];
}

- (void)deselectAllUUIDs
{
  if ([(NSMutableSet *)self->__mutableSelectedUUIDs count])
  {
    [(NSMutableSet *)self->__mutableSelectedUUIDs removeAllObjects];
    [(PUUUIDSelectionManager *)self signalChange:1];
  }
}

- (void)setSelectedUUIDs:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet isEqualToSet:](self->__mutableSelectedUUIDs, "isEqualToSet:") & 1) == 0)
  {
    [(NSMutableSet *)self->__mutableSelectedUUIDs setSet:v4];
    [(PUUUIDSelectionManager *)self signalChange:1];
  }
}

- (NSSet)selectedUUIDs
{
  v2 = (void *)[(NSMutableSet *)self->__mutableSelectedUUIDs copy];
  return (NSSet *)v2;
}

- (void)removeSelectedUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(PUUUIDSelectionManager *)self isSelectedUUID:v4];
    id v4 = v6;
    if (v5)
    {
      [(NSMutableSet *)self->__mutableSelectedUUIDs removeObject:v6];
      [(PUUUIDSelectionManager *)self signalChange:1];
      id v4 = v6;
    }
  }
}

- (void)addSelectedUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(PUUUIDSelectionManager *)self isSelectedUUID:v4];
    id v4 = v6;
    if (!v5)
    {
      [(NSMutableSet *)self->__mutableSelectedUUIDs addObject:v6];
      [(PUUUIDSelectionManager *)self signalChange:1];
      id v4 = v6;
    }
  }
}

- (BOOL)isSelectedUUID:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->__mutableSelectedUUIDs, "containsObject:");
  }
  else {
    return 0;
  }
}

- (PUUUIDSelectionManager)init
{
  return [(PUUUIDSelectionManager *)self initWithSelectedUUIDs:0];
}

- (PUUUIDSelectionManager)initWithSelectedUUIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUUUIDSelectionManager;
  BOOL v5 = [(PUUUIDSelectionManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
    mutableSelectedUUIDs = v5->__mutableSelectedUUIDs;
    v5->__mutableSelectedUUIDs = (NSMutableSet *)v6;
  }
  return v5;
}

@end