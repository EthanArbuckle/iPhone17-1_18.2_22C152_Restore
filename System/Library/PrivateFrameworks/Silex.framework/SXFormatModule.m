@interface SXFormatModule
- (SXFormatModule)initWithResolver:(id)a3;
- (TFResolver)resolver;
- (id)createViewController;
@end

@implementation SXFormatModule

- (SXFormatModule)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXFormatModule;
  v6 = [(SXFormatModule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolver, a3);
  }

  return v7;
}

- (id)createViewController
{
  v2 = [(SXFormatModule *)self resolver];
  v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void).cxx_destruct
{
}

@end