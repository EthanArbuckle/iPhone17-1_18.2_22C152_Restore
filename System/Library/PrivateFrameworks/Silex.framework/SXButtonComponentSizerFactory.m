@interface SXButtonComponentSizerFactory
- (NSString)type;
- (SXButtonComponentSizerFactory)initWithTextProvider:(id)a3 textSourceFactory:(id)a4;
- (SXButtonComponentTextProvider)textProvider;
- (SXTextComponentLayoutHosting)textComponentLayoutHosting;
- (SXTextSourceFactory)textSourceFactory;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
- (void)setTextComponentLayoutHosting:(id)a3;
@end

@implementation SXButtonComponentSizerFactory

- (SXButtonComponentSizerFactory)initWithTextProvider:(id)a3 textSourceFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXButtonComponentSizerFactory;
  v9 = [(SXButtonComponentSizerFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textProvider, a3);
    objc_storeStrong((id *)&v10->_textSourceFactory, a4);
  }

  return v10;
}

- (NSString)type
{
  return (NSString *)@"button";
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
  v15 = [SXButtonComponentSizer alloc];
  v16 = [(SXButtonComponentSizerFactory *)self textProvider];
  v17 = [(SXButtonComponentSizerFactory *)self textComponentLayoutHosting];
  v18 = [(SXButtonComponentSizerFactory *)self textSourceFactory];
  v19 = [(SXButtonComponentSizer *)v15 initWithComponent:v13 componentLayout:v12 componentStyle:v14 DOMObjectProvider:v10 layoutOptions:v11 textProvider:v16 textComponentLayoutHosting:v17 textSourceFactory:v18];

  return v19;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return self->_textComponentLayoutHosting;
}

- (void)setTextComponentLayoutHosting:(id)a3
{
}

- (SXButtonComponentTextProvider)textProvider
{
  return self->_textProvider;
}

- (SXTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_textComponentLayoutHosting, 0);
}

@end