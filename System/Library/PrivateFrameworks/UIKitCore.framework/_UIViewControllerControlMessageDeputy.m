@interface _UIViewControllerControlMessageDeputy
+ (id)XPCInterface;
+ (id)proxyWithTarget:(id)a3;
- (id)invalidate;
- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3;
@end

@implementation _UIViewControllerControlMessageDeputy

+ (id)XPCInterface
{
  if (qword_1EB264E40 != -1) {
    dispatch_once(&qword_1EB264E40, &__block_literal_global_136_2);
  }
  v2 = (void *)qword_1EB264E48;
  return v2;
}

+ (id)proxyWithTarget:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIViewControllerControlMessageDeputy;
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