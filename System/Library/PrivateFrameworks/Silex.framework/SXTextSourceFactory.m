@interface SXTextSourceFactory
- (SXDocumentLanguageProviding)documentLanguageProvider;
- (SXFontAttributesConstructor)fontAttributesConstructor;
- (SXSmartFieldFactory)smartFieldFactory;
- (SXTextSourceFactory)initWithSmartFieldFactory:(id)a3 documentLanguageProvider:(id)a4 fontAttributesConstructor:(id)a5;
- (id)createTextSourceWithString:(id)a3 dataSource:(id)a4;
@end

@implementation SXTextSourceFactory

- (SXTextSourceFactory)initWithSmartFieldFactory:(id)a3 documentLanguageProvider:(id)a4 fontAttributesConstructor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXTextSourceFactory;
  v12 = [(SXTextSourceFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartFieldFactory, a3);
    objc_storeStrong((id *)&v13->_documentLanguageProvider, a4);
    objc_storeStrong((id *)&v13->_fontAttributesConstructor, a5);
  }

  return v13;
}

- (id)createTextSourceWithString:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SXTextSource alloc];
  id v9 = [(SXTextSourceFactory *)self smartFieldFactory];
  id v10 = [(SXTextSourceFactory *)self documentLanguageProvider];
  id v11 = [(SXTextSourceFactory *)self fontAttributesConstructor];
  v12 = [(SXTextSource *)v8 initWithString:v7 smartFieldFactory:v9 dataSource:v6 documentLanguageProvider:v10 fontAttributesConstructor:v11];

  return v12;
}

- (SXSmartFieldFactory)smartFieldFactory
{
  return self->_smartFieldFactory;
}

- (SXDocumentLanguageProviding)documentLanguageProvider
{
  return self->_documentLanguageProvider;
}

- (SXFontAttributesConstructor)fontAttributesConstructor
{
  return self->_fontAttributesConstructor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttributesConstructor, 0);
  objc_storeStrong((id *)&self->_documentLanguageProvider, 0);
  objc_storeStrong((id *)&self->_smartFieldFactory, 0);
}

@end