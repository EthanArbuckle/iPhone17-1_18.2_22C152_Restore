@interface TabDocumentActivityItemProvider
- (TabDocument)tabDocument;
- (TabDocumentActivityItemProvider)initWithTabDocument:(id)a3;
- (id)item;
@end

@implementation TabDocumentActivityItemProvider

- (TabDocumentActivityItemProvider)initWithTabDocument:(id)a3
{
  id v5 = a3;
  v6 = [v5 URL];
  v7 = [v5 title];
  v8 = [v5 webView];
  v12.receiver = self;
  v12.super_class = (Class)TabDocumentActivityItemProvider;
  v9 = [(_SFActivityItemProvider *)&v12 initWithPlaceholderItem:v5 URL:v6 pageTitle:v7 webView:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabDocument, a3);
    v10 = v9;
  }

  return v9;
}

- (id)item
{
  return self->_tabDocument;
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void).cxx_destruct
{
}

@end