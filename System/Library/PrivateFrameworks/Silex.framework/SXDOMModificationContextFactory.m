@interface SXDOMModificationContextFactory
- (SXDOMModificationContextFactory)initWithDocumentProvider:(id)a3;
- (SXDocumentProviding)documentProvider;
- (id)createModificationContextWithLayoutOptions:(id)a3;
@end

@implementation SXDOMModificationContextFactory

- (SXDOMModificationContextFactory)initWithDocumentProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDOMModificationContextFactory;
  v6 = [(SXDOMModificationContextFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_documentProvider, a3);
  }

  return v7;
}

- (id)createModificationContextWithLayoutOptions:(id)a3
{
  id v4 = a3;
  id v5 = [SXDOMModificationContext alloc];
  v6 = [(SXDOMModificationContextFactory *)self documentProvider];
  v7 = [v6 document];
  v8 = [v7 specVersion];
  objc_super v9 = [(SXDOMModificationContext *)v5 initWithLayoutOptions:v4 specVersion:v8];

  return v9;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (void).cxx_destruct
{
}

@end