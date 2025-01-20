@interface SXDataTableTextSourceFactory
- (SXDataTableTextSourceFactory)initWithSmartFieldFactory:(id)a3 documentLanguageProvider:(id)a4 fontAttributesConstructor:(id)a5;
- (SXDocumentLanguageProviding)documentLanguageProvider;
- (SXFontAttributesConstructor)fontAttributesConstructor;
- (SXSmartFieldFactory)smartFieldFactory;
- (id)textSourceWithFormattedText:(id)a3 indexPath:(id)a4 dataSource:(id)a5;
@end

@implementation SXDataTableTextSourceFactory

- (SXDataTableTextSourceFactory)initWithSmartFieldFactory:(id)a3 documentLanguageProvider:(id)a4 fontAttributesConstructor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDataTableTextSourceFactory;
  v12 = [(SXDataTableTextSourceFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartFieldFactory, a3);
    objc_storeStrong((id *)&v13->_documentLanguageProvider, a4);
    objc_storeStrong((id *)&v13->_fontAttributesConstructor, a5);
  }

  return v13;
}

- (id)textSourceWithFormattedText:(id)a3 indexPath:(id)a4 dataSource:(id)a5
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v9 = a5;
  id v10 = a3;
  id v11 = [SXDataTableTextSource alloc];
  v12 = [(SXDataTableTextSourceFactory *)self smartFieldFactory];
  v13 = [(SXDataTableTextSourceFactory *)self documentLanguageProvider];
  v14 = [(SXDataTableTextSourceFactory *)self fontAttributesConstructor];
  objc_super v15 = -[SXDataTableTextSource initWithFormattedText:indexPath:smartFieldFactory:dataSource:documentLangaugeProvider:fontAttributesConstructor:](v11, "initWithFormattedText:indexPath:smartFieldFactory:dataSource:documentLangaugeProvider:fontAttributesConstructor:", v10, var0, var1, v12, v9, v13, v14);

  return v15;
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