@interface PXHorizontalCollectionGadgetProvider
- (BOOL)isFixedHeight;
- (BOOL)prefersPagingEnabled;
- (NSDictionary)columnSpanForTraitCollection;
- (NSString)title;
- (PXGadgetProvider)contentGadgetProvider;
- (PXHorizontalCollectionGadgetProvider)init;
- (PXHorizontalCollectionGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4;
- (PXHorizontalCollectionGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4 horizontalCollectionGadgetClass:(Class)a5;
- (PXHorizontalCollectionGadgetProvider)initWithIdentifier:(id)a3;
- (PXHorizontalCollectionGadgetProvider)initWithIdentifier:(id)a3 contentGadgetProvider:(id)a4 title:(id)a5 horizontalCollectionGadgetClass:(Class)a6;
- (id)_createHorizontalGadget;
- (int64_t)defaultColumnSpan;
- (unint64_t)estimatedNumberOfGadgets;
- (unint64_t)gadgetType;
- (unint64_t)headerStyle;
- (void)_updateHorizontalGadget;
- (void)generateGadgets;
- (void)horizontalCollectionGadgetDatasourceDidUpdate:(id)a3;
- (void)loadDataForGadgets;
- (void)setColumnSpanForTraitCollection:(id)a3;
- (void)setDefaultColumnSpan:(int64_t)a3;
- (void)setGadgetType:(unint64_t)a3;
- (void)setHeaderStyle:(unint64_t)a3;
- (void)setIsFixedHeight:(BOOL)a3;
- (void)setPrefersPagingEnabled:(BOOL)a3;
@end

@implementation PXHorizontalCollectionGadgetProvider

- (void)setIsFixedHeight:(BOOL)a3
{
  self->_isFixedHeight = a3;
}

- (PXHorizontalCollectionGadgetProvider)initWithIdentifier:(id)a3 contentGadgetProvider:(id)a4 title:(id)a5 horizontalCollectionGadgetClass:(Class)a6
{
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXHorizontalCollectionGadgetProvider;
  v13 = [(PXGadgetProvider *)&v18 initWithIdentifier:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contentGadgetProvider, a4);
    [(PXGadgetProvider *)v14->_contentGadgetProvider setDelegate:v14];
    uint64_t v15 = [v12 copy];
    title = v14->_title;
    v14->_title = (NSString *)v15;

    v14->_horizontalCollectionGadgetClass = a6;
    v14->_defaultColumnSpan = 1;
    v14->_prefersPagingEnabled = 1;
  }

  return v14;
}

- (PXGadgetProvider)contentGadgetProvider
{
  return self->_contentGadgetProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentGadgetProvider, 0);
  objc_storeStrong((id *)&self->_columnSpanForTraitCollection, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_horizontalGadget, 0);
}

- (BOOL)isFixedHeight
{
  return self->_isFixedHeight;
}

- (BOOL)prefersPagingEnabled
{
  return self->_prefersPagingEnabled;
}

- (NSDictionary)columnSpanForTraitCollection
{
  return self->_columnSpanForTraitCollection;
}

- (int64_t)defaultColumnSpan
{
  return self->_defaultColumnSpan;
}

- (void)setHeaderStyle:(unint64_t)a3
{
  self->_headerStyle = a3;
}

- (unint64_t)headerStyle
{
  return self->_headerStyle;
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (NSString)title
{
  return self->_title;
}

- (id)_createHorizontalGadget
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(self->_horizontalCollectionGadgetClass);
  v9[0] = self->_contentGadgetProvider;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v5 = (void *)[v3 initWithProviders:v4];

  objc_msgSend(v5, "setDefaultColumnSpan:", -[PXHorizontalCollectionGadgetProvider defaultColumnSpan](self, "defaultColumnSpan"));
  v6 = [(PXHorizontalCollectionGadgetProvider *)self columnSpanForTraitCollection];
  [v5 setColumnSpans:v6];

  objc_msgSend(v5, "setGadgetType:", -[PXHorizontalCollectionGadgetProvider gadgetType](self, "gadgetType"));
  objc_msgSend(v5, "setHeaderStyle:", -[PXHorizontalCollectionGadgetProvider headerStyle](self, "headerStyle"));
  [v5 setHorizontalGadgetDelegate:self];
  [v5 setPrefersPagingEnabled:self->_prefersPagingEnabled];
  objc_msgSend(v5, "setIsFixedHeight:", -[PXHorizontalCollectionGadgetProvider isFixedHeight](self, "isFixedHeight"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PXHorizontalCollectionGadgetProvider__createHorizontalGadget__block_invoke;
  v8[3] = &unk_1E5DC5348;
  v8[4] = self;
  [v5 performChanges:v8];
  return v5;
}

void __63__PXHorizontalCollectionGadgetProvider__createHorizontalGadget__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 title];
  [v3 setCollectionTitle:v4];
}

- (void)_updateHorizontalGadget
{
  unint64_t v3 = [(PXHorizontalCollectionGadgetProvider *)self estimatedNumberOfGadgets];
  id v4 = [(PXGadgetProvider *)self gadgets];
  uint64_t v5 = [v4 count];

  if (v3)
  {
    horizontalGadget = self->_horizontalGadget;
    if (!horizontalGadget)
    {
      v7 = [(PXHorizontalCollectionGadgetProvider *)self _createHorizontalGadget];
      v8 = self->_horizontalGadget;
      self->_horizontalGadget = v7;

      horizontalGadget = self->_horizontalGadget;
    }
    if (horizontalGadget) {
      BOOL v9 = v5 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __63__PXHorizontalCollectionGadgetProvider__updateHorizontalGadget__block_invoke;
      v10[3] = &unk_1E5DC3398;
      v10[4] = self;
      [(PXGadgetProvider *)self performChanges:v10];
    }
  }
  else if (v5)
  {
    [(PXGadgetProvider *)self performChanges:&__block_literal_global_118096];
  }
}

void __63__PXHorizontalCollectionGadgetProvider__updateHorizontalGadget__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);
}

uint64_t __63__PXHorizontalCollectionGadgetProvider__updateHorizontalGadget__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeAllGadgets];
}

- (void)horizontalCollectionGadgetDatasourceDidUpdate:(id)a3
{
}

uint64_t __86__PXHorizontalCollectionGadgetProvider_horizontalCollectionGadgetDatasourceDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHorizontalGadget];
}

- (void)setPrefersPagingEnabled:(BOOL)a3
{
  if (self->_prefersPagingEnabled != a3)
  {
    BOOL v3 = a3;
    self->_prefersPagingEnabled = a3;
    id v4 = [(PXGadgetUIViewController *)self->_horizontalGadget layout];
    [v4 setPrefersPagingEnabled:v3];
  }
}

- (void)setColumnSpanForTraitCollection:(id)a3
{
  id v6 = a3;
  if (!-[NSDictionary isEqualToDictionary:](self->_columnSpanForTraitCollection, "isEqualToDictionary:"))
  {
    id v4 = (NSDictionary *)[v6 copy];
    columnSpanForTraitCollection = self->_columnSpanForTraitCollection;
    self->_columnSpanForTraitCollection = v4;

    [(PXHorizontalCollectionGadget *)self->_horizontalGadget setColumnSpans:self->_columnSpanForTraitCollection];
  }
}

- (void)setDefaultColumnSpan:(int64_t)a3
{
  if (self->_defaultColumnSpan != a3)
  {
    self->_defaultColumnSpan = a3;
    -[PXHorizontalCollectionGadget setDefaultColumnSpan:](self->_horizontalGadget, "setDefaultColumnSpan:");
  }
}

- (void)setGadgetType:(unint64_t)a3
{
  if (self->_gadgetType != a3)
  {
    self->_gadgetType = a3;
    -[PXHorizontalCollectionGadget setGadgetType:](self->_horizontalGadget, "setGadgetType:");
  }
}

- (void)generateGadgets
{
  if ([(PXHorizontalCollectionGadgetProvider *)self estimatedNumberOfGadgets])
  {
    [(PXHorizontalCollectionGadgetProvider *)self _updateHorizontalGadget];
    self->_hasLoaded = 1;
  }
}

- (unint64_t)estimatedNumberOfGadgets
{
  return [(PXGadgetProvider *)self->_contentGadgetProvider estimatedNumberOfGadgets] != 0;
}

- (void)loadDataForGadgets
{
}

- (PXHorizontalCollectionGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4 horizontalCollectionGadgetClass:(Class)a5
{
  v8 = NSString;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  id v12 = [v8 stringWithFormat:@"%@:%@", v11, objc_opt_class()];
  v13 = [(PXHorizontalCollectionGadgetProvider *)self initWithIdentifier:v12 contentGadgetProvider:v10 title:v9 horizontalCollectionGadgetClass:a5];

  return v13;
}

- (PXHorizontalCollectionGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXHorizontalCollectionGadgetProvider *)self initWithContentGadgetProvider:v7 title:v6 horizontalCollectionGadgetClass:objc_opt_class()];

  return v8;
}

- (PXHorizontalCollectionGadgetProvider)initWithIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXHorizontalCollectionGadgetProvider.m", 34, @"%s is not available as initializer", "-[PXHorizontalCollectionGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXHorizontalCollectionGadgetProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXHorizontalCollectionGadgetProvider.m", 30, @"%s is not available as initializer", "-[PXHorizontalCollectionGadgetProvider init]");

  abort();
}

@end