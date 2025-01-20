@interface SXLinkActionFactory
- (SXLinkActionFactory)initWithURLActionFactory:(id)a3;
- (SXURLActionFactory)URLActionFactory;
- (id)actionForAddition:(id)a3;
- (id)actionForURL:(id)a3;
@end

@implementation SXLinkActionFactory

- (SXLinkActionFactory)initWithURLActionFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLinkActionFactory;
  v6 = [(SXLinkActionFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URLActionFactory, a3);
  }

  return v7;
}

- (id)actionForAddition:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [(SXLinkActionFactory *)self URLActionFactory];
    v6 = [v4 URL];
    v7 = [v4 analytics];
    v8 = [v5 actionForURL:v6 analytics:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)actionForURL:(id)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
    id v5 = NSURL;
    v6 = [v4 queryValueForName:@"URL"];
    v7 = [v5 URLWithString:v6];

    if (v7)
    {
      v8 = [(SXLinkActionFactory *)self URLActionFactory];
      objc_super v9 = [v8 actionForURL:v7];
    }
    else
    {
      objc_super v9 = 0;
    }
  }
  else
  {
    objc_super v9 = 0;
  }
  return v9;
}

- (SXURLActionFactory)URLActionFactory
{
  return self->_URLActionFactory;
}

- (void).cxx_destruct
{
}

@end