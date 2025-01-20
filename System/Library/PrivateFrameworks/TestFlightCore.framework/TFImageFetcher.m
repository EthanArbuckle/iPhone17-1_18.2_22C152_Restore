@interface TFImageFetcher
- (TFImageFetcher)init;
- (double)displayedScreenScale;
- (id)_urlStringForIconArtwork:(id)a3 ofSize:(CGSize)a4 fileFormat:(id)a5;
- (void)fetchIconArtwork:(id)a3 ofSize:(CGSize)a4 intoView:(id)a5 animated:(BOOL)a6;
@end

@implementation TFImageFetcher

- (TFImageFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)TFImageFetcher;
  v2 = [(TFImageFetcher *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C920] mainScreen];
    [v3 scale];
    v2->_displayedScreenScale = v4;
  }
  return v2;
}

- (void)fetchIconArtwork:(id)a3 ofSize:(CGSize)a4 intoView:(id)a5 animated:(BOOL)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a5;
  v12 = [(TFImageFetcher *)self _urlStringForIconArtwork:a3, @"jpeg", width, height ofSize fileFormat];
  v13 = [NSURL URLWithString:v12];
  if (v13)
  {
    v14 = [MEMORY[0x263F08BF8] sharedSession];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke;
    v22 = &unk_26468EB38;
    v23 = self;
    id v24 = v13;
    id v25 = v11;
    BOOL v26 = a6;
    v15 = [v14 dataTaskWithURL:v24 completionHandler:&v19];

    objc_msgSend(v15, "resume", v19, v20, v21, v22, v23);
  }
  else
  {
    v16 = +[TFLogConfiguration defaultConfiguration];
    v17 = [v16 generatedLogger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = (id)objc_opt_class();
      __int16 v29 = 2112;
      v30 = v12;
      id v18 = v28;
      _os_log_impl(&dword_223064000, v17, OS_LOG_TYPE_ERROR, "%@: Invalid URL %@", buf, 0x16u);
    }
  }
}

void __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v5 = +[TFLogConfiguration defaultConfiguration];
    objc_super v6 = [v5 generatedLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      v8 = *(void **)(a1 + 40);
      id v9 = v7;
      v10 = [v8 absoluteString];
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to fetch url %@", buf, 0x16u);
    }
  }
  else
  {
    id v11 = [MEMORY[0x263F1C6B0] imageWithData:a2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke_5;
    block[3] = &unk_26468EB10;
    v13 = *(id *)(a1 + 48);
    id v14 = v11;
    char v15 = *(unsigned char *)(a1 + 56);
    id v5 = v11;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_super v6 = v13;
  }
}

uint64_t __60__TFImageFetcher_fetchIconArtwork_ofSize_intoView_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (id)_urlStringForIconArtwork:(id)a3 ofSize:(CGSize)a4 fileFormat:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v36[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = NSString;
  [(TFImageFetcher *)self displayedScreenScale];
  v13 = objc_msgSend(v11, "stringWithFormat:", @"%d", (int)(width * v12));
  id v14 = NSString;
  [(TFImageFetcher *)self displayedScreenScale];
  v16 = objc_msgSend(v14, "stringWithFormat:", @"%d", (int)(height * v15));
  v35[0] = @"{w}";
  v35[1] = @"{h}";
  v36[0] = v13;
  v36[1] = v16;
  v35[2] = @"{f}";
  id v28 = v10;
  v36[2] = v10;
  v17 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
  __int16 v29 = v9;
  __int16 v18 = [v9 urlTemplate];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v19 = [v17 allKeys];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v23 = 0;
      id v24 = v18;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v30 + 1) + 8 * v23);
        BOOL v26 = [v17 objectForKeyedSubscript:v25];
        __int16 v18 = [v24 stringByReplacingOccurrencesOfString:v25 withString:v26];

        ++v23;
        id v24 = v18;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  return v18;
}

- (double)displayedScreenScale
{
  return self->_displayedScreenScale;
}

@end