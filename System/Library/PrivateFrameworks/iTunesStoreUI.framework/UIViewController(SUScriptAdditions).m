@interface UIViewController(SUScriptAdditions)
- (id)copyObjectForScriptFromPoolWithClass:()SUScriptAdditions;
@end

@implementation UIViewController(SUScriptAdditions)

- (id)copyObjectForScriptFromPoolWithClass:()SUScriptAdditions
{
  return objc_alloc_init(a3);
}

@end