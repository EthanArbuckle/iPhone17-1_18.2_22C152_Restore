@interface SXDOMObjectProviderFactory
- (SXDOMObjectProviderFactory)initWithDocumentControllerProvider:(id)a3 componentStyleMerger:(id)a4 componentTextStyleMerger:(id)a5;
- (SXDocumentControllerProvider)documentControllerProvider;
- (SXJSONObjectMerger)componentStyleMerger;
- (SXJSONObjectMerger)componentTextStyleMerger;
- (id)createDOMObjectProvider;
@end

@implementation SXDOMObjectProviderFactory

- (SXDOMObjectProviderFactory)initWithDocumentControllerProvider:(id)a3 componentStyleMerger:(id)a4 componentTextStyleMerger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDOMObjectProviderFactory;
  v12 = [(SXDOMObjectProviderFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentControllerProvider, a3);
    objc_storeStrong((id *)&v13->_componentStyleMerger, a4);
    objc_storeStrong((id *)&v13->_componentTextStyleMerger, a5);
  }

  return v13;
}

- (id)createDOMObjectProvider
{
  v3 = [SXDOMObjectProvider alloc];
  v4 = [(SXDOMObjectProviderFactory *)self documentControllerProvider];
  v5 = [(SXDOMObjectProviderFactory *)self componentStyleMerger];
  v6 = [(SXDOMObjectProviderFactory *)self componentTextStyleMerger];
  v7 = [(SXDOMObjectProvider *)v3 initWithDocumentControllerProvider:v4 componentStyleMerger:v5 componentTextStyleMerger:v6];

  return v7;
}

- (SXDocumentControllerProvider)documentControllerProvider
{
  return self->_documentControllerProvider;
}

- (SXJSONObjectMerger)componentStyleMerger
{
  return self->_componentStyleMerger;
}

- (SXJSONObjectMerger)componentTextStyleMerger
{
  return self->_componentTextStyleMerger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentTextStyleMerger, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
  objc_storeStrong((id *)&self->_documentControllerProvider, 0);
}

@end