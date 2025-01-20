@interface SXQuickLookRouter
- (SXQuickLookRouter)initWithResolver:(id)a3;
- (TFResolver)resolver;
- (void)presentFile:(id)a3 transitionContext:(id)a4;
@end

@implementation SXQuickLookRouter

- (SXQuickLookRouter)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookRouter;
  v6 = [(SXQuickLookRouter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolver, a3);
  }

  return v7;
}

- (void)presentFile:(id)a3 transitionContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SXQuickLookRouter *)self resolver];
  id v12 = [v8 resolveProtocol:&unk_26D62F240];

  objc_super v9 = [v12 viewControllerForFile:v7 transitionContext:v6];

  if (v9)
  {
    v10 = [(SXQuickLookRouter *)self resolver];
    v11 = [v10 resolveProtocol:&unk_26D5EFEA8];

    [v11 presentViewController:v9 animated:1];
  }
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void).cxx_destruct
{
}

@end