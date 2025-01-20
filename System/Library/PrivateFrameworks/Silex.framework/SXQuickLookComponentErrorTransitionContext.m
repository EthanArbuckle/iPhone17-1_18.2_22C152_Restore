@interface SXQuickLookComponentErrorTransitionContext
- (NSError)error;
- (SXQuickLookComponentErrorTransitionContext)initWithError:(id)a3;
@end

@implementation SXQuickLookComponentErrorTransitionContext

- (SXQuickLookComponentErrorTransitionContext)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookComponentErrorTransitionContext;
  v6 = [(SXQuickLookComponentErrorTransitionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end