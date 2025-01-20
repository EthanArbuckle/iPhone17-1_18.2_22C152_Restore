@interface SXDataTableComponentSizerFactory
- (NSString)type;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXDataRecordValueTransformerFactory)recordValueTransformerFactory;
- (SXDataTableComponentSizerFactory)initWithDOMObjectProvider:(id)a3 textComponentLayoutHosting:(id)a4 textSourceFactory:(id)a5 recordValueTransformerFactory:(id)a6;
- (SXDataTableTextSourceFactory)textSourceFactory;
- (SXTextComponentLayoutHosting)textComponentLayoutHosting;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation SXDataTableComponentSizerFactory

- (SXDataTableComponentSizerFactory)initWithDOMObjectProvider:(id)a3 textComponentLayoutHosting:(id)a4 textSourceFactory:(id)a5 recordValueTransformerFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXDataTableComponentSizerFactory;
  v15 = [(SXDataTableComponentSizerFactory *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v16->_textComponentLayoutHosting, a4);
    objc_storeStrong((id *)&v16->_textSourceFactory, a5);
    objc_storeStrong((id *)&v16->_recordValueTransformerFactory, a6);
  }

  return v16;
}

- (NSString)type
{
  return (NSString *)@"data_table";
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
  id v14 = [v10 componentStyleForComponent:v13];
  v15 = [SXDataTableComponentSizer alloc];
  v16 = [(SXDataTableComponentSizerFactory *)self textComponentLayoutHosting];
  v17 = [(SXDataTableComponentSizerFactory *)self textSourceFactory];
  objc_super v18 = [(SXDataTableComponentSizerFactory *)self recordValueTransformerFactory];
  v19 = [(SXDataTableComponentSizer *)v15 initWithComponent:v13 componentLayout:v12 componentStyle:v14 DOMObjectProvider:v10 layoutOptions:v11 textComponentLayoutHosting:v16 textSourceFactory:v17 recordValueTransformerFactory:v18];

  return v19;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  return self->_textComponentLayoutHosting;
}

- (SXDataTableTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (SXDataRecordValueTransformerFactory)recordValueTransformerFactory
{
  return self->_recordValueTransformerFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordValueTransformerFactory, 0);
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_textComponentLayoutHosting, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end