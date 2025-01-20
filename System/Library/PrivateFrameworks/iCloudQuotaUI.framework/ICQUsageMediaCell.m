@interface ICQUsageMediaCell
- (ICQUsageMediaCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)blankIcon;
- (id)getLazyIcon;
- (id)getLazyIconID;
@end

@implementation ICQUsageMediaCell

- (ICQUsageMediaCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICQUsageMediaCell;
  v9 = [(PSTableCell *)&v16 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(ICQUsageMediaCell *)v9 setClipsContents:1];
    if (initWithStyle_reuseIdentifier_specifier__onceToken != -1) {
      dispatch_once(&initWithStyle_reuseIdentifier_specifier__onceToken, &__block_literal_global_8);
    }
    [(ICQUsageMediaCell *)v10 setLayoutManager:initWithStyle_reuseIdentifier_specifier__layoutManager];
    uint64_t v11 = [v8 propertyForKey:@"ICON_LOADER"];
    artworkCatalog = v10->_artworkCatalog;
    v10->_artworkCatalog = (MPArtworkCatalog *)v11;

    -[MPArtworkCatalog setFittingSize:](v10->_artworkCatalog, "setFittingSize:", 44.0, 44.0);
    v13 = v10->_artworkCatalog;
    v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    -[MPArtworkCatalog setDestinationScale:](v13, "setDestinationScale:");
  }
  return v10;
}

void __61__ICQUsageMediaCell_initWithStyle_reuseIdentifier_specifier___block_invoke()
{
  v0 = objc_alloc_init(ICQUsageMediaCellLayoutManager);
  v1 = (void *)initWithStyle_reuseIdentifier_specifier__layoutManager;
  initWithStyle_reuseIdentifier_specifier__layoutManager = (uint64_t)v0;
}

- (id)getLazyIcon
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  artworkCatalog = self->_artworkCatalog;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__ICQUsageMediaCell_getLazyIcon__block_invoke;
  v8[3] = &unk_2649226B8;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  [(MPArtworkCatalog *)artworkCatalog requestImageWithCompletionHandler:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __32__ICQUsageMediaCell_getLazyIcon__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getLazyIconID
{
  return self->_artworkCatalog;
}

- (id)blankIcon
{
  id v2 = objc_alloc_init(MEMORY[0x263F827E8]);
  return v2;
}

- (void).cxx_destruct
{
}

@end