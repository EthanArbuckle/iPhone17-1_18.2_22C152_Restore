@interface SUUIProductPageTableSwooshSection
- (SUUIColorScheme)colorScheme;
- (SUUIProductPageTableSwooshSection)initWithItems:(id)a3 title:(id)a4;
- (SUUIProductPageTableSwooshSection)initWithLockups:(id)a3 title:(id)a4;
- (SUUIResourceLoader)resourceLoader;
- (id)_artworkLoader;
- (id)_missingItemLoader;
- (id)_swooshViewController;
- (id)actionBlock;
- (id)headerViewForTableView:(id)a3;
- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4;
- (void)dealloc;
- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)setActionBlock:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setResourceLoader:(id)a3;
- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4;
@end

@implementation SUUIProductPageTableSwooshSection

- (SUUIProductPageTableSwooshSection)initWithItems:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIProductPageTableSwooshSection;
  v8 = [(SUUIProductPageTableSwooshSection *)&v13 init];
  if (v8)
  {
    v9 = objc_alloc_init(SUUIItemList);
    [(SUUIItemList *)v9 setItems:v6];
    [(SUUIItemList *)v9 setTitle:v7];
    v10 = [[SUUISwooshPageComponent alloc] initWithItemList:v9];
    swooshComponent = v8->_swooshComponent;
    v8->_swooshComponent = v10;
  }
  return v8;
}

- (SUUIProductPageTableSwooshSection)initWithLockups:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIProductPageTableSwooshSection;
  v8 = [(SUUIProductPageTableSwooshSection *)&v12 init];
  if (v8)
  {
    v9 = [[SUUISwooshPageComponent alloc] initWithLockups:v6 swooshType:0 title:v7];
    swooshComponent = v8->_swooshComponent;
    v8->_swooshComponent = v9;
  }
  return v8;
}

- (void)dealloc
{
  [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  [(SUUILockupSwooshViewController *)self->_swooshViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageTableSwooshSection;
  [(SUUIProductPageTableSwooshSection *)&v3 dealloc];
}

- (SUUIColorScheme)colorScheme
{
  v2 = [(SUUIProductPageTableSwooshSection *)self _swooshViewController];
  objc_super v3 = [v2 colorScheme];

  return (SUUIColorScheme *)v3;
}

- (void)setColorScheme:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIProductPageTableSwooshSection *)self _swooshViewController];
  [v5 setColorScheme:v4];
}

- (id)headerViewForTableView:(id)a3
{
  if (!self->_missingItemLoader
    && [(SUUISwooshPageComponent *)self->_swooshComponent isMissingItemData])
  {
    id v4 = [(SUUIProductPageTableSwooshSection *)self _missingItemLoader];
    [v4 loadItemsForPageComponent:self->_swooshComponent startIndex:0 reason:1];
  }
  id v5 = [(SUUIProductPageTableSwooshSection *)self _swooshViewController];
  id v6 = [v5 view];

  return v6;
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v10 = a4;
  if ([v10 count])
  {
    id v6 = [(SUUISwooshPageComponent *)self->_swooshComponent _updateLockupItemsWithItems:v10];
    swooshViewController = self->_swooshViewController;
    v8 = [(SUUISwooshPageComponent *)self->_swooshComponent lockups];
    [(SUUILockupSwooshViewController *)swooshViewController setLockups:v8];

    v9 = [(SUUIProductPageTableSwooshSection *)self _artworkLoader];
    [v9 loadImagesForNextPageWithReason:0];
  }
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  if (self->_actionBlock)
  {
    id v6 = [a3 lockups];
    id v9 = [v6 objectAtIndex:a4];

    actionBlock = (void (**)(id, void *))self->_actionBlock;
    v8 = [v9 item];
    actionBlock[2](actionBlock, v8);
  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SUUIProductPageTableSwooshSection *)self _artworkLoader];
  v8 = [v6 lockups];

  id v9 = [v8 objectAtIndex:a4];

  id v10 = [v9 item];
  if (v10)
  {
    v11 = [v7 cachedImageForItem:v10];
    if (v11) {
      goto LABEL_6;
    }
    [v7 loadImageForItem:v10 reason:1];
    objc_super v12 = v7;
    objc_super v13 = v10;
  }
  else
  {
    objc_super v12 = v7;
    objc_super v13 = 0;
  }
  v11 = [v12 placeholderImageForItem:v13];
LABEL_6:

  return v11;
}

- (id)_artworkLoader
{
  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    id v4 = [SUUILockupSwooshArtworkLoader alloc];
    id v5 = [(SUUIProductPageTableSwooshSection *)self resourceLoader];
    id v6 = [(SUUIProductPageTableSwooshSection *)self _swooshViewController];
    id v7 = [(SUUILockupSwooshArtworkLoader *)v4 initWithArtworkLoader:v5 swoosh:v6];
    v8 = self->_artworkLoader;
    self->_artworkLoader = v7;

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    id v4 = [SUUIMissingItemLoader alloc];
    id v5 = [(SUUIProductPageTableSwooshSection *)self resourceLoader];
    id v6 = [(SUUIMissingItemLoader *)v4 initWithResourceLoader:v5];
    id v7 = self->_missingItemLoader;
    self->_missingItemLoader = v6;

    [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_swooshViewController
{
  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    id v4 = [[SUUILockupSwooshViewController alloc] initWithSwoosh:self->_swooshComponent];
    id v5 = self->_swooshViewController;
    self->_swooshViewController = v4;

    id v6 = self->_swooshViewController;
    id v7 = [(SUUIProductPageTableSection *)self clientContext];
    [(SUUILockupSwooshViewController *)v6 setClientContext:v7];

    [(SUUILockupSwooshViewController *)self->_swooshViewController setDelegate:self];
    v8 = self->_swooshViewController;
    id v9 = [(SUUILockupSwooshViewController *)v8 artworkContext];
    id v10 = [v9 iconConsumer];
    [v10 imageSize];
    -[SUUILockupSwooshViewController _setExpectedImageSize:](v8, "_setExpectedImageSize:");

    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (SUUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_swooshComponent, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end