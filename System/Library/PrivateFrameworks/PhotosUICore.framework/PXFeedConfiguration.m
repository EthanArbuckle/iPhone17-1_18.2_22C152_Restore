@interface PXFeedConfiguration
- (BOOL)allowsPopOnEmptyBehavior;
- (BOOL)hidesBackButton;
- (BOOL)shouldEmbedContentLayout;
- (BOOL)wantsEmbeddedScrollView;
- (NSString)localizedSubtitle;
- (NSString)viewControllerTitle;
- (PXFeedActionPerformer)actionPerformer;
- (PXFeedConfiguration)init;
- (PXFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 specManagerPromise:(id)a4 itemLayoutFactory:(id)a5;
- (PXFeedItemLayoutFactory)itemLayoutFactory;
- (PXFeedPlaceholderFactory)placeholderFactory;
- (PXMediaProvider)mediaProvider;
- (id)chromeControllerPromise;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataSourceManager;
- (id)dataSourceManagerPromise;
- (id)objectReferenceForDestination:(id)a3;
- (id)specManagerPromise;
- (id)specManagerWithExtendedTraitCollection:(id)a3;
- (id)visibleRectChangeObserver;
- (int64_t)selectionContext;
- (void)setActionPerformer:(id)a3;
- (void)setChromeControllerPromise:(id)a3;
- (void)setDataSourceManagerPromise:(id)a3;
- (void)setItemLayoutFactory:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPlaceholderFactory:(id)a3;
- (void)setShouldEmbedContentLayout:(BOOL)a3;
- (void)setSpecManagerPromise:(id)a3;
- (void)setVisibleRectChangeObserver:(id)a3;
@end

@implementation PXFeedConfiguration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_visibleRectChangeObserver, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_placeholderFactory, 0);
  objc_storeStrong((id *)&self->_itemLayoutFactory, 0);
  objc_storeStrong(&self->_chromeControllerPromise, 0);
  objc_storeStrong(&self->_specManagerPromise, 0);
  objc_storeStrong(&self->_dataSourceManagerPromise, 0);
}

- (void)setVisibleRectChangeObserver:(id)a3
{
}

- (id)visibleRectChangeObserver
{
  return self->_visibleRectChangeObserver;
}

- (void)setShouldEmbedContentLayout:(BOOL)a3
{
  self->_shouldEmbedContentLayout = a3;
}

- (BOOL)shouldEmbedContentLayout
{
  return self->_shouldEmbedContentLayout;
}

- (void)setMediaProvider:(id)a3
{
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setActionPerformer:(id)a3
{
}

- (PXFeedActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (void)setPlaceholderFactory:(id)a3
{
}

- (PXFeedPlaceholderFactory)placeholderFactory
{
  return self->_placeholderFactory;
}

- (void)setItemLayoutFactory:(id)a3
{
}

- (PXFeedItemLayoutFactory)itemLayoutFactory
{
  return self->_itemLayoutFactory;
}

- (void)setChromeControllerPromise:(id)a3
{
}

- (id)chromeControllerPromise
{
  return self->_chromeControllerPromise;
}

- (void)setSpecManagerPromise:(id)a3
{
}

- (id)specManagerPromise
{
  return self->_specManagerPromise;
}

- (void)setDataSourceManagerPromise:(id)a3
{
}

- (id)dataSourceManagerPromise
{
  return self->_dataSourceManagerPromise;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PXFeedConfiguration *)self dataSourceManagerPromise];
  v6 = [(PXFeedConfiguration *)self specManagerPromise];
  v7 = [(PXFeedConfiguration *)self itemLayoutFactory];
  v8 = (void *)[v4 initWithDataSourceManagerPromise:v5 specManagerPromise:v6 itemLayoutFactory:v7];

  v9 = [(PXFeedConfiguration *)self chromeControllerPromise];
  [v8 setChromeControllerPromise:v9];

  v10 = [(PXFeedConfiguration *)self placeholderFactory];
  [v8 setPlaceholderFactory:v10];

  v11 = [(PXFeedConfiguration *)self actionPerformer];
  [v8 setActionPerformer:v11];

  v12 = [(PXFeedConfiguration *)self mediaProvider];
  [v8 setMediaProvider:v12];

  objc_msgSend(v8, "setShouldEmbedContentLayout:", -[PXFeedConfiguration shouldEmbedContentLayout](self, "shouldEmbedContentLayout"));
  v13 = [(PXFeedConfiguration *)self visibleRectChangeObserver];
  [v8 setVisibleRectChangeObserver:v13];

  return v8;
}

- (id)objectReferenceForDestination:(id)a3
{
  return 0;
}

- (NSString)localizedSubtitle
{
  return 0;
}

- (NSString)viewControllerTitle
{
  return 0;
}

- (int64_t)selectionContext
{
  return 10;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXFeedConfiguration.m", 55, @"Method %s is a responsibility of subclass %@", "-[PXFeedConfiguration allowsPopOnEmptyBehavior]", v6 object file lineNumber description];

  abort();
}

- (BOOL)wantsEmbeddedScrollView
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXFeedConfiguration.m", 51, @"Method %s is a responsibility of subclass %@", "-[PXFeedConfiguration wantsEmbeddedScrollView]", v6 object file lineNumber description];

  abort();
}

- (BOOL)hidesBackButton
{
  return 0;
}

- (id)specManagerWithExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PXFeedConfiguration *)self specManagerPromise];
  v6 = ((void (**)(void, PXFeedConfiguration *, id))v5)[2](v5, self, v4);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PXFeedConfiguration_specManagerWithExtendedTraitCollection___block_invoke;
  v9[3] = &unk_1E5DBE7C8;
  id v7 = v6;
  id v10 = v7;
  [(PXFeedConfiguration *)self setSpecManagerPromise:v9];

  return v7;
}

id __62__PXFeedConfiguration_specManagerWithExtendedTraitCollection___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)dataSourceManager
{
  v3 = [(PXFeedConfiguration *)self dataSourceManagerPromise];
  id v4 = ((void (**)(void, PXFeedConfiguration *))v3)[2](v3, self);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PXFeedConfiguration_dataSourceManager__block_invoke;
  v7[3] = &unk_1E5DBE7A0;
  id v5 = v4;
  id v8 = v5;
  [(PXFeedConfiguration *)self setDataSourceManagerPromise:v7];

  return v5;
}

id __40__PXFeedConfiguration_dataSourceManager__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PXFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 specManagerPromise:(id)a4 itemLayoutFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXFeedConfiguration;
  v11 = [(PXFeedConfiguration *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id dataSourceManagerPromise = v11->_dataSourceManagerPromise;
    v11->_id dataSourceManagerPromise = (id)v12;

    uint64_t v14 = [v9 copy];
    id specManagerPromise = v11->_specManagerPromise;
    v11->_id specManagerPromise = (id)v14;

    objc_storeStrong((id *)&v11->_itemLayoutFactory, a5);
  }

  return v11;
}

- (PXFeedConfiguration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedConfiguration.m", 15, @"%s is not available as initializer", "-[PXFeedConfiguration init]");

  abort();
}

@end