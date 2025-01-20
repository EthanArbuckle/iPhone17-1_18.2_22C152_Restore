@interface PXPhotosDetailsActionsSpecManager
- (Class)specClass;
@end

@implementation PXPhotosDetailsActionsSpecManager

- (Class)specClass
{
  return (Class)objc_opt_class();
}

@end