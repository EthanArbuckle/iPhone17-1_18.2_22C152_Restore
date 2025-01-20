@interface _UIViewServiceViewControllerDeputy
+ (id)XPCInterface;
+ (id)deputyWithViewController:(id)a3;
- (id)invalidate;
- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3;
@end

@implementation _UIViewServiceViewControllerDeputy

+ (id)XPCInterface
{
  return 0;
}

+ (id)deputyWithViewController:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIViewServiceViewControllerDeputy;
  v3 = objc_msgSendSuper2(&v5, sel_proxyWithTarget_, a3);
  return v3;
}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
{
}

- (id)invalidate
{
  v2 = +[_UIAsyncInvocation emptyInvocation];
  v3 = [v2 invoke];

  return v3;
}

@end