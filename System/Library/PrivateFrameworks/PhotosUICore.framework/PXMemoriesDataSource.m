@interface PXMemoriesDataSource
- (id)sectionedObjectReferenceForMemoryUUID:(id)a3;
@end

@implementation PXMemoriesDataSource

- (id)sectionedObjectReferenceForMemoryUUID:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXMemoriesDataSource.m", 25, @"Method %s is a responsibility of subclass %@", "-[PXMemoriesDataSource sectionedObjectReferenceForMemoryUUID:]", v8 object file lineNumber description];

  abort();
}

@end