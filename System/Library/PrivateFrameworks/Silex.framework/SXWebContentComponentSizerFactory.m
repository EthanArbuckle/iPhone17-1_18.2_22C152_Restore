@interface SXWebContentComponentSizerFactory
- (NSString)type;
- (SWLoadingPolicyProvider)loadingPolicyProvider;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXWebContentComponentSizerFactory)initWithDOMObjectProvider:(id)a3 loadingPolicyProvider:(id)a4;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation SXWebContentComponentSizerFactory

- (SXWebContentComponentSizerFactory)initWithDOMObjectProvider:(id)a3 loadingPolicyProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentComponentSizerFactory;
  v9 = [(SXWebContentComponentSizerFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_loadingPolicyProvider, a4);
  }

  return v10;
}

- (NSString)type
{
  return (NSString *)@"webcontent";
}

- (int)role
{
  return 0;
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 componentStyleForComponent:v13];
  v15 = [SXWebContentComponentSizer alloc];
  v16 = [(SXWebContentComponentSizerFactory *)self loadingPolicyProvider];
  v17 = [(SXWebContentComponentSizer *)v15 initWithComponent:v13 componentLayout:v12 componentStyle:v14 DOMObjectProvider:v10 layoutOptions:v11 loadingPolicyProvider:v16];

  return v17;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SWLoadingPolicyProvider)loadingPolicyProvider
{
  return self->_loadingPolicyProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end