@interface SKUIImageActivityItemProvider
+ (id)placeholderItem;
- (id)item;
- (void)item;
@end

@implementation SKUIImageActivityItemProvider

+ (id)placeholderItem
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1818]);

  return v2;
}

- (id)item
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIImageActivityItemProvider item]();
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__13;
  v17 = __Block_byref_object_dispose__13;
  id v18 = 0;
  v3 = [(UIActivityItemProvider *)self activityType];
  if ([MEMORY[0x1E4F42710] activityTypeShouldProvideImage:v3])
  {
    v4 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
    v5 = [v4 artworksProvider];
    v6 = objc_msgSend(v5, "bestArtworkForScaledSize:", 100.0, 100.0);
    v7 = [v6 URL];

    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v7];
      v9 = +[SKUIStyledImageDataConsumer shareSheetIconConsumer];
      [v8 setDataConsumer:v9];

      [v8 setITunesStoreRequest:0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __37__SKUIImageActivityItemProvider_item__block_invoke;
      v12[3] = &unk_1E6424970;
      v12[4] = &v13;
      [v8 setOutputBlock:v12];
      [v8 main];
    }
  }
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v10;
}

void __37__SKUIImageActivityItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
}

- (void)item
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIImageActivityItemProvider item]";
}

@end