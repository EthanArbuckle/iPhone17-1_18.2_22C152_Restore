@interface PXBrowserSelectionSnapshot
+ (id)selectionWithIndexPaths:(id)a3 dataSource:(id)a4;
- (NSArray)modelObjects;
- (id)assetReferenceAtIndex:(int64_t)a3;
- (id)displayAssetAtIndex:(int64_t)a3;
- (int64_t)assetCount;
- (int64_t)estimatedAssetCount;
- (int64_t)estimatedModelObjectsCount;
- (int64_t)indexOfAssetReference:(id)a3;
- (int64_t)mediaType;
@end

@implementation PXBrowserSelectionSnapshot

- (NSArray)modelObjects
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 148, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot modelObjects]", v6 object file lineNumber description];

  abort();
}

- (int64_t)estimatedModelObjectsCount
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 144, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot estimatedModelObjectsCount]", v6 object file lineNumber description];

  abort();
}

- (int64_t)indexOfAssetReference:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 140, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot indexOfAssetReference:]", v8 object file lineNumber description];

  abort();
}

- (id)displayAssetAtIndex:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 136, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot displayAssetAtIndex:]", v7 object file lineNumber description];

  abort();
}

- (id)assetReferenceAtIndex:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 132, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot assetReferenceAtIndex:]", v7 object file lineNumber description];

  abort();
}

- (int64_t)mediaType
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 128, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot mediaType]", v6 object file lineNumber description];

  abort();
}

- (int64_t)assetCount
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 124, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot assetCount]", v6 object file lineNumber description];

  abort();
}

- (int64_t)estimatedAssetCount
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXBrowserSnapshot.m", 120, @"Method %s is a responsibility of subclass %@", "-[PXBrowserSelectionSnapshot estimatedAssetCount]", v6 object file lineNumber description];

  abort();
}

+ (id)selectionWithIndexPaths:(id)a3 dataSource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_PXBrowserDataSourceSelection alloc] initWithIndexPaths:v6 dataSource:v5];

  return v7;
}

@end