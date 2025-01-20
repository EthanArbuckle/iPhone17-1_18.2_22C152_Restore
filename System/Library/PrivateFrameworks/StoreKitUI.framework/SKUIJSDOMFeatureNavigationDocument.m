@interface SKUIJSDOMFeatureNavigationDocument
+ (id)makeFeatureJSObjectForFeature:(id)a3;
+ (id)possibleFeatureNames;
+ (void)possibleFeatureNames;
- (IKAppContext)appContext;
- (NSString)featureName;
- (SKUIJSDOMFeatureNavigationDocument)initWithDOMNode:(id)a3 featureName:(id)a4;
- (SKUINavigationDocumentController)navigationDocumentController;
- (id)documents;
- (void)clear;
- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5;
- (void)popDocument;
- (void)popToDocument:(id)a3;
- (void)popToRootDocument;
- (void)pushDocument:(id)a3 options:(id)a4;
- (void)removeDocument:(id)a3;
- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5;
- (void)setNavigationDocumentController:(id)a3;
@end

@implementation SKUIJSDOMFeatureNavigationDocument

- (SKUIJSDOMFeatureNavigationDocument)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSDOMFeatureNavigationDocument initWithDOMNode:featureName:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIJSDOMFeatureNavigationDocument;
  v8 = [(SKUIJSDOMFeatureNavigationDocument *)&v15 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v9);

    uint64_t v10 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stackItems = v8->_stackItems;
    v8->_stackItems = v12;
  }
  return v8;
}

- (void)setNavigationDocumentController:(id)a3
{
  v5 = (SKUINavigationDocumentController *)a3;
  if (self->_navigationDocumentController != v5)
  {
    objc_storeStrong((id *)&self->_navigationDocumentController, a3);
    if ([(NSMutableArray *)self->_stackItems count])
    {
      [(SKUINavigationDocumentController *)self->_navigationDocumentController setStackItems:self->_stackItems animated:0];
      [(NSMutableArray *)self->_stackItems removeAllObjects];
    }
  }
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIJSDOMFeatureNavigationDocument makeFeatureJSObjectForFeature:]();
  }
  v4 = (objc_class *)MEMORY[0x1E4F6F0D8];
  id v5 = v3;
  id v6 = [v4 alloc];
  id v7 = [v5 appContext];
  v8 = (void *)[v6 initWithAppContext:v7 navigationController:v5];

  return v8;
}

+ (id)possibleFeatureNames
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIJSDOMFeatureNavigationDocument possibleFeatureNames]();
  }
  v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"leftNavigationDocument", @"rightNavigationDocument", 0);

  return v2;
}

- (void)clear
{
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController) {
    [(SKUINavigationDocumentController *)navigationDocumentController clear];
  }
  else {
    [(NSMutableArray *)self->_stackItems removeAllObjects];
  }
}

- (id)documents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    v4 = [(SKUINavigationDocumentController *)navigationDocumentController documents];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_stackItems;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "document", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8 = a4;
  v9 = v8;
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    id v11 = a5;
    id v12 = a3;
    [(SKUINavigationDocumentController *)navigationDocumentController insertDocument:v12 beforeDocument:v9 options:v11];
  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__SKUIJSDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke;
    v19[3] = &unk_1E6427028;
    id v20 = v8;
    id v14 = a5;
    id v15 = a3;
    uint64_t v16 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v19];
    uint64_t v17 = [[SKUIDocumentStackItem alloc] initWithDocument:v15 presentationOptions:v14];

    v18 = self->_stackItems;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v18 addObject:v17];
    }
    else {
      [(NSMutableArray *)v18 insertObject:v17 atIndex:v16];
    }

    id v12 = v20;
  }
}

BOOL __76__SKUIJSDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    id v6 = a4;
    uint64_t v10 = (SKUIDocumentStackItem *)a3;
    -[SKUINavigationDocumentController pushDocument:options:](navigationDocumentController, "pushDocument:options:");
  }
  else
  {
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = [[SKUIDocumentStackItem alloc] initWithDocument:v9 presentationOptions:v8];

    [(NSMutableArray *)self->_stackItems addObject:v10];
  }
}

- (void)popDocument
{
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController) {
    [(SKUINavigationDocumentController *)navigationDocumentController popDocument];
  }
  else {
    [(NSMutableArray *)self->_stackItems removeLastObject];
  }
}

- (void)popToDocument:(id)a3
{
  id v4 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    [(SKUINavigationDocumentController *)navigationDocumentController popToDocument:v4];
  }
  else
  {
    stackItems = self->_stackItems;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__SKUIJSDOMFeatureNavigationDocument_popToDocument___block_invoke;
    v8[3] = &unk_1E6427028;
    id v9 = v4;
    uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v8];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", v7, [(NSMutableArray *)self->_stackItems count] - v7);
    }
  }
}

BOOL __52__SKUIJSDOMFeatureNavigationDocument_popToDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popToRootDocument
{
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    [(SKUINavigationDocumentController *)navigationDocumentController popToRootDocument];
  }
  else
  {
    uint64_t v4 = [(NSMutableArray *)self->_stackItems count];
    if (v4 >= 2)
    {
      uint64_t v5 = v4 - 1;
      stackItems = self->_stackItems;
      -[NSMutableArray removeObjectsInRange:](stackItems, "removeObjectsInRange:", 1, v5);
    }
  }
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = v8;
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    id v11 = a5;
    id v12 = a4;
    [(SKUINavigationDocumentController *)navigationDocumentController replaceDocument:v9 withDocument:v12 options:v11];
  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__SKUIJSDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke;
    v19[3] = &unk_1E6427028;
    id v20 = v8;
    id v14 = a5;
    id v15 = a4;
    uint64_t v16 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v19];
    uint64_t v17 = [[SKUIDocumentStackItem alloc] initWithDocument:v15 presentationOptions:v14];

    v18 = self->_stackItems;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v18 addObject:v17];
    }
    else {
      [(NSMutableArray *)v18 replaceObjectAtIndex:v16 withObject:v17];
    }

    id v12 = v20;
  }
}

BOOL __75__SKUIJSDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)removeDocument:(id)a3
{
  id v4 = a3;
  navigationDocumentController = self->_navigationDocumentController;
  if (navigationDocumentController)
  {
    [(SKUINavigationDocumentController *)navigationDocumentController removeDocument:v4];
  }
  else
  {
    stackItems = self->_stackItems;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__SKUIJSDOMFeatureNavigationDocument_removeDocument___block_invoke;
    v8[3] = &unk_1E6427028;
    id v9 = v4;
    uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v8];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v7];
    }
  }
}

BOOL __53__SKUIJSDOMFeatureNavigationDocument_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (SKUINavigationDocumentController)navigationDocumentController
{
  return self->_navigationDocumentController;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);

  return (IKAppContext *)WeakRetained;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_navigationDocumentController, 0);

  objc_destroyWeak((id *)&self->_jsNavigationDocument);
}

- (void)initWithDOMNode:featureName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSDOMFeatureNavigationDocument initWithDOMNode:featureName:]";
}

+ (void)makeFeatureJSObjectForFeature:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIJSDOMFeatureNavigationDocument makeFeatureJSObjectForFeature:]";
}

+ (void)possibleFeatureNames
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIJSDOMFeatureNavigationDocument possibleFeatureNames]";
}

@end