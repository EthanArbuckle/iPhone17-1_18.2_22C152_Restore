@interface SBHIconModelDesiredIconStateUnarchiverDelegate
- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listGridSizeForFolderClass:(Class)a4;
- (id)gridSizeClassSizesForIconStateUnarchiver:(id)a3;
- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4;
- (unint64_t)maxIconCountForDockForIconStateUnarchiver:(id)a3;
- (unint64_t)maxListCountForFoldersForIconStateUnarchiver:(id)a3;
@end

@implementation SBHIconModelDesiredIconStateUnarchiverDelegate

- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)393222;
}

- (unint64_t)maxListCountForFoldersForIconStateUnarchiver:(id)a3
{
  return 100;
}

- (unint64_t)maxIconCountForDockForIconStateUnarchiver:(id)a3
{
  return 20;
}

- (id)gridSizeClassSizesForIconStateUnarchiver:(id)a3
{
  v3 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  return v3;
}

- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  v5 = self;
  LODWORD(a4) = [(objc_class *)a4 isSubclassOfClass:v5];

  if (a4) {
    +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses];
  }
  else {
  v6 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
  }
  return v6;
}

@end