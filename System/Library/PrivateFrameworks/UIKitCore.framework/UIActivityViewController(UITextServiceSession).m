@interface UIActivityViewController(UITextServiceSession)
- (id)dismissCompletionHandler;
- (void)setDismissCompletionHandler:()UITextServiceSession;
@end

@implementation UIActivityViewController(UITextServiceSession)

- (void)setDismissCompletionHandler:()UITextServiceSession
{
  id v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, &kDismissCompletionHandlerKey_0, v4, (void *)3);
}

- (id)dismissCompletionHandler
{
  return objc_getAssociatedObject(a1, &kDismissCompletionHandlerKey_0);
}

@end