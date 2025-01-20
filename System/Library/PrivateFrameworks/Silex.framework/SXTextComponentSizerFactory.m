@interface SXTextComponentSizerFactory
- (NSString)type;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXTextComponentLayoutHosting)textComponentLayoutHosting;
- (SXTextComponentSizerFactory)initWithDOMObjectProvider:(id)a3 textComponentLayoutHosting:(id)a4 textSourceFactory:(id)a5;
- (SXTextSourceFactory)textSourceFactory;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation SXTextComponentSizerFactory

- (SXTextComponentSizerFactory)initWithDOMObjectProvider:(id)a3 textComponentLayoutHosting:(id)a4 textSourceFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXTextComponentSizerFactory;
  v12 = [(SXTextComponentSizerFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v13->_textComponentLayoutHosting, a4);
    objc_storeStrong((id *)&v13->_textSourceFactory, a5);
  }

  return v13;
}

- (NSString)type
{
  return (NSString *)@"text";
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
  objc_super v15 = [SXTextComponentSizer alloc];
  v16 = [(SXTextComponentSizerFactory *)self textComponentLayoutHosting];
  v17 = [(SXTextComponentSizerFactory *)self textSourceFactory];
  v18 = [(SXTextComponentSizer *)v15 initWithComponent:v13 componentLayout:v12 componentStyle:v14 DOMObjectProvider:v10 layoutOptions:v11 textComponentLayoutHosting:v16 textSourceFactory:v17];

  return v18;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return self->_textComponentLayoutHosting;
}

- (SXTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_textComponentLayoutHosting, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end