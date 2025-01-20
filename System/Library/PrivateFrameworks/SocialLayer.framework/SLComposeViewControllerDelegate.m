@interface SLComposeViewControllerDelegate
- (SLComposeViewControllerDelegate)initWithCallback:(id)a3;
- (id)callback;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation SLComposeViewControllerDelegate

- (SLComposeViewControllerDelegate)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLComposeViewControllerDelegate;
  v5 = [(SLComposeViewControllerDelegate *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id callback = v5->_callback;
    v5->_id callback = v6;
  }
  return v5;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  v6 = [(SLComposeViewControllerDelegate *)self callback];

  if (v6)
  {
    v7 = [(SLComposeViewControllerDelegate *)self callback];
    v7[2](v7, a4);
  }
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
}

@end