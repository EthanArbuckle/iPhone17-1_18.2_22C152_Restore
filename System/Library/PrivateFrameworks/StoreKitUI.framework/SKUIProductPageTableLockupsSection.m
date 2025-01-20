@interface SKUIProductPageTableLockupsSection
- (SKUIProductPageTableLockupsSection)initWithLockups:(id)a3 title:(id)a4;
- (SKUIResourceLoader)resourceLoader;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)_missingItemLoader;
- (id)_productImageForItem:(id)a3;
- (id)footerViewForTableView:(id)a3;
- (id)headerViewForTableView:(id)a3;
- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)setResourceLoader:(id)a3;
@end

@implementation SKUIProductPageTableLockupsSection

- (SKUIProductPageTableLockupsSection)initWithLockups:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableLockupsSection initWithLockups:title:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIProductPageTableLockupsSection;
  v8 = [(SKUIProductPageTableLockupsSection *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    artworkRequests = v8->_artworkRequests;
    v8->_artworkRequests = (NSMapTable *)v9;

    uint64_t v11 = [v6 copy];
    lockups = v8->_lockups;
    v8->_lockups = (NSArray *)v11;

    if (v7)
    {
      v13 = objc_alloc_init(SKUIProductPageTableHeaderView);
      headerView = v8->_headerView;
      v8->_headerView = v13;

      -[SKUIProductPageTableHeaderView setContentInsets:](v8->_headerView, "setContentInsets:", 11.0, 15.0, 5.0, 15.0);
      [(SKUIProductPageTableHeaderView *)v8->_headerView setTitle:v7];
      [(SKUIProductPageTableHeaderView *)v8->_headerView sizeToFit];
    }
  }

  return v8;
}

- (void)dealloc
{
  [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIProductPageTableLockupsSection;
  [(SKUIProductPageTableLockupsSection *)&v3 dealloc];
}

- (id)footerViewForTableView:(id)a3
{
  footerView = self->_footerView;
  if (!footerView)
  {
    v5 = -[SKUIProductPageTableSeparatorView initWithFrame:]([SKUIProductPageTableSeparatorView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 10.0);
    id v6 = self->_footerView;
    self->_footerView = v5;

    footerView = self->_footerView;
  }

  return footerView;
}

- (id)headerViewForTableView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_lockups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "_needsItemData", (void)v15))
        {
          uint64_t v11 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v10, "itemIdentifier"));
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    v12 = [(SKUIProductPageTableLockupsSection *)self _missingItemLoader];
    [v12 loadItemsWithIdentifiers:v4 reason:1];
  }
  v13 = self->_headerView;

  return v13;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  id v4 = [(SKUIProductPageTableSection *)self clientContext];
  double v5 = dbl_1C1CCC3E0[SKUIUserInterfaceIdiom(v4) == 1];

  return v5;
}

- (int64_t)numberOfRowsInSection
{
  return [(NSArray *)self->_lockups count];
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[SKUIProductPageAction actionWithType:4];
  lockups = self->_lockups;
  uint64_t v8 = [v5 row];

  uint64_t v9 = [(NSArray *)lockups objectAtIndex:v8];
  v10 = [v9 item];
  [v6 setItem:v10];

  return v6;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"LOCKUP"];
  uint64_t v8 = [(SKUIProductPageTableSection *)self clientContext];
  if (!v7)
  {
    uint64_t v7 = [[SKUILockupItemTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"LOCKUP"];
    uint64_t v9 = [(SKUILockupItemTableViewCell *)v7 layout];
    v10 = [(SKUIProductPageTableSection *)self clientContext];
    uint64_t v11 = SKUIUserInterfaceIdiom(v10);

    if (v11 == 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    [(SKUILockupItemTableViewCell *)v7 setAccessoryType:v11 != 1];
    [v9 setItemOfferStyle:v12];
    [v9 setClientContext:v8];
    objc_msgSend(v9, "setContentInsets:", 0.0, 15.0, 0.0, 5.0);
    [v9 setLayoutStyle:1];
    [v9 setVerticalAlignment:1];
    uint64_t v13 = SKUIUserInterfaceIdiom(v8);
    double v14 = 64.0;
    if (v13 == 1) {
      double v14 = 72.0;
    }
    objc_msgSend(v9, "setImageBoundingSize:", v14, v14);
  }
  uint64_t v15 = [v6 row];
  lockups = self->_lockups;
  uint64_t v17 = [v6 row];

  long long v18 = [(NSArray *)lockups objectAtIndex:v17];
  v19 = [(SKUILockupItemTableViewCell *)v7 layout];
  if (v18)
  {
    [v18 lockupStyle];
    uint64_t v20 = v24;
  }
  else
  {
    uint64_t v20 = 0;
  }
  [v19 setVisibleFields:v20];
  v21 = [v18 item];
  if (v21)
  {
    [(SKUILockupItemTableViewCell *)v7 configureForItem:v21 clientContext:v8 rowIndex:v15];
    v22 = [(SKUIProductPageTableLockupsSection *)self _productImageForItem:v21];
    [v19 setIconImage:v22];
  }
  else
  {
    [v19 resetLayout];
    [v19 setIconImage:0];
  }

  return v7;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKUITableViewSection *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v24 = v7;
    id v22 = v6;
    uint64_t v25 = [v6 requestIdentifier];
    int64_t v9 = [(SKUITableViewSection *)self sectionIndex];
    v21 = v8;
    v23 = [v8 tableViewForTableViewSection:self];
    [v23 indexPathsForVisibleRows];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v14 section] == v9)
          {
            uint64_t v15 = -[NSArray objectAtIndex:](self->_lockups, "objectAtIndex:", [v14 row]);
            long long v16 = [v15 item];
            if (v16)
            {
              uint64_t v17 = [(NSMapTable *)self->_artworkRequests objectForKey:v16];
              uint64_t v18 = [v17 unsignedIntegerValue];

              if (v25 == v18)
              {
                v19 = [v23 cellForRowAtIndexPath:v14];
                uint64_t v20 = [v19 layout];
                [v20 setIconImage:v24];

                goto LABEL_15;
              }
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    uint64_t v8 = v21;
    id v6 = v22;
    id v7 = v24;
  }
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v6 = a4;
  if ([v6 count])
  {
    long long v19 = 0uLL;
    uint64_t v20 = 0;
    SKUILockupStyleDefault((uint64_t)&v19);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t v8 = [(SKUITableViewSection *)self sectionIndex];
    lockups = self->_lockups;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__SKUIProductPageTableLockupsSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke;
    v13[3] = &unk_1E6429A60;
    id v14 = v6;
    long long v16 = v19;
    uint64_t v17 = v20;
    id v10 = v7;
    id v15 = v10;
    int64_t v18 = v8;
    [(NSArray *)lockups enumerateObjectsUsingBlock:v13];
    if ([v10 count])
    {
      uint64_t v11 = [(SKUITableViewSection *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [v11 tableViewForTableViewSection:self];
        [v12 reloadRowsAtIndexPaths:v10 withRowAnimation:100];
      }
    }
  }
}

void __92__SKUIProductPageTableLockupsSection_missingItemLoader_didLoadItems_invalidItemIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 _needsItemData])
  {
    id v6 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v5, "itemIdentifier"));
    id v7 = [*(id *)(a1 + 32) objectForKey:v6];
    if (v7)
    {
      long long v14 = 0uLL;
      uint64_t v15 = 0;
      if (v5) {
        [v5 lockupStyle];
      }
      if ([v7 itemKind] == 17)
      {
        long long v12 = *(_OWORD *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 64);
        long long v10 = v14;
        uint64_t v11 = v15;
        if (SKUILockupStyleEqualToLockupStyle(&v12, &v10))
        {
          uint64_t v15 = 214;
          long long v12 = v14;
          uint64_t v13 = 214;
          [v5 _setLockupStyle:&v12];
        }
      }
      [v5 _setItem:v7];
      int64_t v8 = *(void **)(a1 + 40);
      int64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:*(void *)(a1 + 72)];
      [v8 addObject:v9];
    }
  }
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    id v4 = [SKUIMissingItemLoader alloc];
    id v5 = [(SKUIProductPageTableLockupsSection *)self resourceLoader];
    id v6 = [(SKUIMissingItemLoader *)v4 initWithResourceLoader:v5];
    id v7 = self->_missingItemLoader;
    self->_missingItemLoader = v6;

    [(SKUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    missingItemLoader = self->_missingItemLoader;
  }

  return missingItemLoader;
}

- (id)_productImageForItem:(id)a3
{
  id v4 = a3;
  if (!self->_productImageDataConsumer)
  {
    id v5 = +[SKUIStyledImageDataConsumer parentBundleIconConsumer];
    productImageDataConsumer = self->_productImageDataConsumer;
    self->_productImageDataConsumer = v5;
  }
  id v7 = [(SKUIProductPageTableLockupsSection *)self resourceLoader];
  int64_t v8 = [(NSMapTable *)self->_artworkRequests objectForKey:v4];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (!v9
    || ([v7 cachedResourceForRequestIdentifier:v9],
        (long long v10 = (UIImage *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v7 trySetReason:1 forRequestWithIdentifier:v9])
    {
      long long v10 = 0;
    }
    else
    {
      uint64_t v11 = [v4 artworksProvider];
      [(SKUIStyledImageDataConsumer *)self->_productImageDataConsumer imageSize];
      long long v12 = objc_msgSend(v11, "bestArtworkForScaledSize:");

      uint64_t v13 = [v12 URL];
      if (v13)
      {
        long long v14 = objc_alloc_init(SKUIArtworkRequest);
        [(SKUIArtworkRequest *)v14 setDelegate:self];
        [(SKUIArtworkRequest *)v14 setDataConsumer:self->_productImageDataConsumer];
        [(SKUIArtworkRequest *)v14 setURL:v13];
        artworkRequests = self->_artworkRequests;
        long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v14, "requestIdentifier"));
        [(NSMapTable *)artworkRequests setObject:v16 forKey:v4];

        [v7 loadResourceWithRequest:v14 reason:1];
      }
      placeholderImage = self->_placeholderImage;
      if (!placeholderImage)
      {
        int64_t v18 = self->_productImageDataConsumer;
        long long v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
        uint64_t v20 = [(SKUIStyledImageDataConsumer *)v18 imageForColor:v19];
        v21 = self->_placeholderImage;
        self->_placeholderImage = v20;

        placeholderImage = self->_placeholderImage;
      }
      long long v10 = placeholderImage;
    }
  }

  return v10;
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_productImageDataConsumer, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_storeStrong((id *)&self->_artworkRequests, 0);
}

- (void)initWithLockups:title:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageTableLockupsSection initWithLockups:title:]";
}

@end