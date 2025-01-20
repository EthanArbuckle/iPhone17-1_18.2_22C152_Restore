@interface DeniesInternalPresentationEnqueueableManagedNavigationController
- (Class)showViewControllerOperationClass;
@end

@implementation DeniesInternalPresentationEnqueueableManagedNavigationController

- (Class)showViewControllerOperationClass
{
  return (Class)objc_opt_class();
}

@end