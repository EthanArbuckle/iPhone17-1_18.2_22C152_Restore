@interface SXEmbedComponentSizerFactory
- (NSString)type;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXEmbedComponentSizerFactory)initWithDOMObjectProvider:(id)a3 embedDataProvider:(id)a4;
- (SXEmbedDataProvider)embedDataProvider;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation SXEmbedComponentSizerFactory

- (SXEmbedComponentSizerFactory)initWithDOMObjectProvider:(id)a3 embedDataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXEmbedComponentSizerFactory;
  v9 = [(SXEmbedComponentSizerFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_embedDataProvider, a4);
  }

  return v10;
}

- (NSString)type
{
  return (NSString *)@"embed";
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
  v15 = [SXEmbedComponentSizer alloc];
  v16 = [(SXEmbedComponentSizerFactory *)self embedDataProvider];
  v17 = [(SXEmbedComponentSizer *)v15 initWithComponent:v13 componentLayout:v12 componentStyle:v14 DOMObjectProvider:v10 layoutOptions:v11 embedDataProvider:v16];

  return v17;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXEmbedDataProvider)embedDataProvider
{
  return self->_embedDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedDataProvider, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end