@interface SXDOMCacheKeyFactory
- (SXDOMCacheKeyFactory)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4;
- (SXDocumentProviding)documentProvider;
- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider;
- (id)createCacheKeyForLayoutOptions:(id)a3;
@end

@implementation SXDOMCacheKeyFactory

- (SXDOMCacheKeyFactory)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDOMCacheKeyFactory;
  v9 = [(SXDOMCacheKeyFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_hintsConfigurationOptionProvider, a4);
  }

  return v10;
}

- (id)createCacheKeyForLayoutOptions:(id)a3
{
  hintsConfigurationOptionProvider = self->_hintsConfigurationOptionProvider;
  id v5 = a3;
  v6 = [(SXHintsConfigurationOptionProvider *)hintsConfigurationOptionProvider hints];
  char v7 = [v6 ignoreConditionHints];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    v9 = [(SXDocumentProviding *)self->_documentProvider document];
    v10 = [v9 hints];
    id v8 = [v10 conditions];
  }
  v11 = [[SXDOMCacheKey alloc] initWithLayoutOptions:v5 hints:v8];

  return v11;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider
{
  return self->_hintsConfigurationOptionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintsConfigurationOptionProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end