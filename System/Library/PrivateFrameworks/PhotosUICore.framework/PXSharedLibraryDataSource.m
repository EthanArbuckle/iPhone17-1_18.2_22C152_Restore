@interface PXSharedLibraryDataSource
- (id)sharedLibraryAtItemIndexPath:(PXSimpleIndexPath *)a3;
@end

@implementation PXSharedLibraryDataSource

- (id)sharedLibraryAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXSharedLibraryDataSource.m", 35, @"Method %s is a responsibility of subclass %@", "-[PXSharedLibraryDataSource sharedLibraryAtItemIndexPath:]", v7 object file lineNumber description];

  abort();
}

@end