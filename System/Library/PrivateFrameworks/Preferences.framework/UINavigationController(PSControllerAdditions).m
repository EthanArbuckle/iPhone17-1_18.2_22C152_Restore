@interface UINavigationController(PSControllerAdditions)
- (id)popRecursivelyToRootController;
@end

@implementation UINavigationController(PSControllerAdditions)

- (id)popRecursivelyToRootController
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__UINavigationController_PSControllerAdditions__popRecursivelyToRootController__block_invoke;
  v4[3] = &unk_1E5C5D680;
  v4[4] = a1;
  [MEMORY[0x1E4F42FF8] _performWithoutDeferringTransitions:v4];
  v3.receiver = a1;
  v3.super_class = (Class)UINavigationController_0;
  return objc_msgSendSuper2(&v3, sel_popRecursivelyToRootController);
}

@end