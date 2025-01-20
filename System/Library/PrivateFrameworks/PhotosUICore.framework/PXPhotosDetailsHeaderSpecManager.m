@interface PXPhotosDetailsHeaderSpecManager
- (Class)specClass;
@end

@implementation PXPhotosDetailsHeaderSpecManager

- (Class)specClass
{
  return (Class)objc_opt_class();
}

@end