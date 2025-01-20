@interface TSKUIAlertViewCompletionHandlerDelegate
- (id)completionHandler;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)dealloc;
- (void)setCompletionHandler:(id)a3;
@end

@implementation TSKUIAlertViewCompletionHandlerDelegate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKUIAlertViewCompletionHandlerDelegate;
  [(TSKUIAlertViewCompletionHandlerDelegate *)&v3 dealloc];
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  v4 = [(TSKUIAlertViewCompletionHandlerDelegate *)self completionHandler];
  if (v4)
  {
    v5 = (void (*)(void))v4[2];
    v5();
  }
}

- (id)completionHandler
{
  return self->mCompletionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

@end