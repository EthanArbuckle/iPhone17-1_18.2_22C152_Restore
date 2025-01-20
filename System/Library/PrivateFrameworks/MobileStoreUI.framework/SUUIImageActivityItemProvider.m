@interface SUUIImageActivityItemProvider
+ (id)placeholderItem;
- (id)item;
@end

@implementation SUUIImageActivityItemProvider

+ (id)placeholderItem
{
  id v2 = objc_alloc_init(MEMORY[0x263F827E8]);
  return v2;
}

- (id)item
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__88;
  v17 = __Block_byref_object_dispose__88;
  id v18 = 0;
  v3 = [(UIActivityItemProvider *)self activityType];
  if ([MEMORY[0x263F1C3E0] activityTypeShouldProvideImage:v3])
  {
    v4 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
    v5 = [v4 artworksProvider];
    v6 = objc_msgSend(v5, "bestArtworkForScaledSize:", 100.0, 100.0);
    v7 = [v6 URL];

    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v7];
      v9 = +[SUUIStyledImageDataConsumer shareSheetIconConsumer];
      [v8 setDataConsumer:v9];

      [v8 setITunesStoreRequest:0];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __37__SUUIImageActivityItemProvider_item__block_invoke;
      v12[3] = &unk_265401318;
      v12[4] = &v13;
      [v8 setOutputBlock:v12];
      [v8 main];
    }
  }
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __37__SUUIImageActivityItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
}

@end