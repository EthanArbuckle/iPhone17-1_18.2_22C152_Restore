@interface SLMessageComposeViewControllerDelegateAdapter
- (id)resultHandler;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)setResultHandler:(id)a3;
@end

@implementation SLMessageComposeViewControllerDelegateAdapter

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v8 = a3;
  v6 = [(SLMessageComposeViewControllerDelegateAdapter *)self resultHandler];

  if (v6)
  {
    v7 = [(SLMessageComposeViewControllerDelegateAdapter *)self resultHandler];
    ((void (**)(void, id, int64_t))v7)[2](v7, v8, a4);
  }
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setResultHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end