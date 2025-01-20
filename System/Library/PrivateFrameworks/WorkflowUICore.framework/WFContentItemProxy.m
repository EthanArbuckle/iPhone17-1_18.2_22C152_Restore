@interface WFContentItemProxy
+ (id)previewRetrievalQueue;
- (BOOL)isEqual:(id)a3;
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (WFContentItem)item;
- (WFContentItem)originalItem;
- (WFFileRepresentation)file;
- (WFFileType)preferredFileType;
- (id)refreshBlock;
- (unint64_t)hash;
- (void)setFile:(id)a3;
- (void)setItem:(id)a3;
- (void)setOriginalItem:(id)a3;
- (void)setPreferredFileType:(id)a3;
- (void)setRefreshBlock:(id)a3;
@end

@implementation WFContentItemProxy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_refreshBlock, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_preferredFileType, 0);
  objc_destroyWeak((id *)&self->_originalItem);
  objc_destroyWeak((id *)&self->_item);
}

- (void)setRefreshBlock:(id)a3
{
}

- (id)refreshBlock
{
  return self->_refreshBlock;
}

- (void)setFile:(id)a3
{
}

- (WFFileRepresentation)file
{
  return self->_file;
}

- (void)setPreferredFileType:(id)a3
{
}

- (WFFileType)preferredFileType
{
  return self->_preferredFileType;
}

- (void)setOriginalItem:(id)a3
{
}

- (WFContentItem)originalItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalItem);
  return (WFContentItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (WFContentItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (WFContentItem *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFContentItemProxy *)self file];
    v6 = [v4 file];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v7 && v8) {
        char v10 = [v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(WFContentItemProxy *)self file];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)previewItemTitle
{
  v2 = [(WFContentItemProxy *)self item];
  unint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (NSURL)previewItemURL
{
  unint64_t v3 = [(WFContentItemProxy *)self file];

  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
    [(WFContentItemProxy *)self setFile:v4];

    v5 = [(id)objc_opt_class() previewRetrievalQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__WFContentItemProxy_previewItemURL__block_invoke;
    block[3] = &unk_264C50F28;
    block[4] = self;
    dispatch_async(v5, block);
  }
  v6 = [(WFContentItemProxy *)self file];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(WFContentItemProxy *)self file];
    id v7 = [v8 fileURL];
  }
  return (NSURL *)v7;
}

void __36__WFContentItemProxy_previewItemURL__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) item];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__WFContentItemProxy_previewItemURL__block_invoke_2;
  v3[3] = &unk_264C50F28;
  v3[4] = *(void *)(a1 + 32);
  [v2 prepareForPresentationWithCompletionHandler:v3];
}

void __36__WFContentItemProxy_previewItemURL__block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F33770];
  unint64_t v3 = [*(id *)(a1 + 32) preferredFileType];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __36__WFContentItemProxy_previewItemURL__block_invoke_3;
  v14[3] = &unk_264C50B60;
  v14[4] = *(void *)(a1 + 32);
  id v4 = [v2 requestForCoercingToFileType:v3 completionHandler:v14];

  v5 = (void *)MEMORY[0x263F852B8];
  v6 = WFLivePhotoFileType();
  id v7 = [v5 typeWithUTType:v6];
  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];

  v9 = (void *)MEMORY[0x263F33768];
  uint64_t v10 = *MEMORY[0x263F33A70];
  v15[0] = *MEMORY[0x263F33A68];
  v15[1] = v10;
  v16[0] = v8;
  v16[1] = MEMORY[0x263EFFA88];
  v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v12 = [v9 optionsWithDictionary:v11];
  [v4 setOptions:v12];

  v13 = [*(id *)(a1 + 32) item];
  [v13 performCoercion:v4];
}

void __36__WFContentItemProxy_previewItemURL__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 firstObject];
  id v7 = [v6 wfType];
  int v8 = [v7 conformsToUTType:*MEMORY[0x263F1DAB0]];

  if (v8)
  {
    v9 = [v6 fileURL];
    uint64_t v10 = objc_msgSend(v9, "wf_localizedDisplayName");
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v9 lastPathComponent];
    }
    v13 = v12;

    v14 = NSString;
    v15 = WFLocalizedString(@"Folder (%@)");
    v16 = objc_msgSend(v14, "stringWithFormat:", v15, v13);

    v17 = (void *)MEMORY[0x263F33870];
    v18 = [v16 dataUsingEncoding:4];
    v19 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
    uint64_t v20 = [v17 fileWithData:v18 ofType:v19 proposedFilename:0];

    v6 = (void *)v20;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__WFContentItemProxy_previewItemURL__block_invoke_4;
  block[3] = &unk_264C50B38;
  block[4] = *(void *)(a1 + 32);
  id v24 = v6;
  id v25 = v5;
  id v21 = v5;
  id v22 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __36__WFContentItemProxy_previewItemURL__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"previewItemURL"];
  if (*(void *)(a1 + 40) || (v2 = *(void **)(a1 + 48)) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFile:");
  }
  else
  {
    unint64_t v3 = (void *)MEMORY[0x263F33870];
    id v4 = [v2 localizedDescription];
    id v5 = [v4 dataUsingEncoding:4];
    v6 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
    id v7 = [v3 fileWithData:v5 ofType:v6 proposedFilename:0];
    [*(id *)(a1 + 32) setFile:v7];
  }
  int v8 = [*(id *)(a1 + 32) refreshBlock];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) refreshBlock];
    v9[2]();

    [*(id *)(a1 + 32) setRefreshBlock:0];
  }
  uint64_t v10 = *(void **)(a1 + 32);
  return [v10 didChangeValueForKey:@"previewItemURL"];
}

+ (id)previewRetrievalQueue
{
  if (previewRetrievalQueue_onceToken != -1) {
    dispatch_once(&previewRetrievalQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)previewRetrievalQueue_previewRetrievalQueue;
  return v2;
}

void __43__WFContentItemProxy_previewRetrievalQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.shortcuts.previewRetrievalQueue", 0);
  v1 = (void *)previewRetrievalQueue_previewRetrievalQueue;
  previewRetrievalQueue_previewRetrievalQueue = (uint64_t)v0;
}

@end