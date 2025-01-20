@interface SBHIconStateArchiverListProperties
- (void)setGridSizeClassDomain:(uint64_t)a1;
@end

@implementation SBHIconStateArchiverListProperties

- (void)setGridSizeClassDomain:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedLayoutClusterGridSizeClass, 0);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_storeStrong((id *)&self->_allowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_rotatedGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_gridSizeClassSizes, 0);
}

@end