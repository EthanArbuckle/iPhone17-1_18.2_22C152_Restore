@interface _PXPhotosBarButtonSpecManager
- (Class)specClass;
- (PXCuratedLibrarySectionHeaderLayoutSpec)spec;
@end

@implementation _PXPhotosBarButtonSpecManager

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)spec
{
  v4.receiver = self;
  v4.super_class = (Class)_PXPhotosBarButtonSpecManager;
  v2 = [(PXFeatureSpecManager *)&v4 spec];
  [v2 setIsFloating:1];
  return (PXCuratedLibrarySectionHeaderLayoutSpec *)v2;
}

@end