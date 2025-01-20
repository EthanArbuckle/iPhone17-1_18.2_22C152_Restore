@interface SKUIViewElementSlideshowController
- (NSMutableArray)dataConsumers;
- (SKUIViewElementLayoutContext)layoutContext;
- (SKUIViewElementSlideshowController)initWithShelf:(id)a3 selectedLockup:(id)a4;
- (SKUIViewElementSlideshowDelegate)delegate;
- (id)slideshowViewController:(id)a3 dataConsumerAtIndex:(int64_t)a4;
- (id)slideshowViewController:(id)a3 imageURLAtIndex:(int64_t)a4;
- (id)slideshowViewController:(id)a3 placeholderImageAtIndex:(int64_t)a4;
- (int64_t)numberOfItemsInSlideshowViewController:(id)a3;
- (int64_t)numberOfSlideshowItems;
- (void)dealloc;
- (void)presentFromParentViewController:(id)a3;
- (void)setDataConsumers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutContext:(id)a3;
- (void)slideshowViewControllerDidFinish:(id)a3;
@end

@implementation SKUIViewElementSlideshowController

- (SKUIViewElementSlideshowController)initWithShelf:(id)a3 selectedLockup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIViewElementSlideshowController initWithShelf:selectedLockup:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIViewElementSlideshowController;
  v8 = [(SKUIViewElementSlideshowController *)&v18 init];
  if (v8)
  {
    v9 = objc_opt_new();
    [(SKUIViewElementSlideshowController *)v8 setDataConsumers:v9];

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lockups = v8->_lockups;
    v8->_lockups = v10;

    v8->_selectedIndex = 0;
    uint64_t v12 = [v6 slideshowTitle];
    title = v8->_title;
    v8->_title = (NSString *)v12;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__SKUIViewElementSlideshowController_initWithShelf_selectedLockup___block_invoke;
    v15[3] = &unk_1E64243A8;
    id v16 = v7;
    v17 = v8;
    [v6 enumerateChildrenUsingBlock:v15];
  }
  return v8;
}

void __67__SKUIViewElementSlideshowController_initWithShelf_selectedLockup___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  BOOL v3 = [v11 elementType] == 66;
  v4 = v11;
  if (v3)
  {
    id v5 = v11;
    id v6 = [v5 fullscreenImage];
    uint64_t v7 = [v5 firstChildForElementType:49];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      if (*(id *)(a1 + 32) == v5) {
        *(void *)(*(void *)(a1 + 40) + 48) = [*(id *)(*(void *)(a1 + 40) + 24) count];
      }
      [*(id *)(*(void *)(a1 + 40) + 24) addObject:v5];
      v9 = [(SKUIStyledImageDataConsumer *)[SKUIScreenshotDataConsumer alloc] initWithViewElement:v6];
      [v6 size];
      -[SKUIStyledImageDataConsumer setImageSize:](v9, "setImageSize:");
      v10 = [*(id *)(a1 + 40) dataConsumers];
      [v10 addObject:v9];
    }
    v4 = v11;
  }
}

- (void)dealloc
{
  [(SKUISlideshowViewController *)self->_padViewController setDataSource:0];
  [(SKUISlideshowViewController *)self->_padViewController setDelegate:0];
  [(SKUIIPhoneSlideshowViewController *)self->_phoneViewController setDataSource:0];
  [(SKUIIPhoneSlideshowViewController *)self->_phoneViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIViewElementSlideshowController;
  [(SKUIViewElementSlideshowController *)&v3 dealloc];
}

- (int64_t)numberOfSlideshowItems
{
  return [(NSMutableArray *)self->_lockups count];
}

- (void)presentFromParentViewController:(id)a3
{
  layoutContext = self->_layoutContext;
  id v5 = a3;
  id v6 = [(SKUIViewElementLayoutContext *)layoutContext clientContext];
  if (SKUIUserInterfaceIdiom(v6) == 1)
  {
    uint64_t v7 = objc_alloc_init(SKUISlideshowViewController);
    p_padViewController = (id *)&self->_padViewController;
    padViewController = self->_padViewController;
  }
  else
  {
    uint64_t v7 = objc_alloc_init(SKUIIPhoneSlideshowViewController);
    p_padViewController = (id *)&self->_phoneViewController;
    padViewController = self->_phoneViewController;
  }
  id *p_padViewController = v7;

  [*p_padViewController setClientContext:v6];
  [*p_padViewController setDataSource:self];
  [*p_padViewController setDelegate:self];
  [*p_padViewController setCurrentIndex:self->_selectedIndex];
  id v11 = *p_padViewController;
  if (self->_title) {
    objc_msgSend(v11, "setTitle:");
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v11];
  [v10 setModalPresentationStyle:17];
  [v5 presentViewController:v10 animated:1 completion:0];
}

- (int64_t)numberOfItemsInSlideshowViewController:(id)a3
{
  return [(NSMutableArray *)self->_lockups count];
}

- (id)slideshowViewController:(id)a3 placeholderImageAtIndex:(int64_t)a4
{
  id v5 = [(NSMutableArray *)self->_lockups objectAtIndex:a4];
  id v6 = [v5 firstChildForElementType:49];
  uint64_t v7 = [(SKUIViewElementLayoutContext *)self->_layoutContext requestIdentifierForViewElement:v6];
  if (v7)
  {
    v8 = [(SKUIViewElementLayoutContext *)self->_layoutContext resourceLoader];
    v9 = objc_msgSend(v8, "cachedResourceForRequestIdentifier:", objc_msgSend(v7, "unsignedIntegerValue"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)slideshowViewController:(id)a3 imageURLAtIndex:(int64_t)a4
{
  v4 = [(NSMutableArray *)self->_lockups objectAtIndex:a4];
  id v5 = [v4 fullscreenImage];
  id v6 = [v5 URL];

  return v6;
}

- (id)slideshowViewController:(id)a3 dataConsumerAtIndex:(int64_t)a4
{
  id v6 = [(SKUIViewElementSlideshowController *)self dataConsumers];
  uint64_t v7 = [v6 objectAtIndex:a4];

  v8 = [(SKUIViewElementLayoutContext *)self->_layoutContext clientContext];
  if (SKUIUserInterfaceIdiom(v8) != 1) {
    [v7 setForcesPortrait:1];
  }

  return v7;
}

- (void)slideshowViewControllerDidFinish:(id)a3
{
  id v5 = a3;
  v4 = [(SKUIViewElementSlideshowController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 viewElementSlideshowWillDismiss:self];
  }
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (SKUIViewElementSlideshowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIViewElementSlideshowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIViewElementLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(id)a3
{
}

- (NSMutableArray)dataConsumers
{
  return self->_dataConsumers;
}

- (void)setDataConsumers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataConsumers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_phoneViewController, 0);
  objc_storeStrong((id *)&self->_padViewController, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithShelf:selectedLockup:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIViewElementSlideshowController initWithShelf:selectedLockup:]";
}

@end