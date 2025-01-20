@interface BRCThumbnailGenerateOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCThumbnailGenerateOperation)initWithDocumentAtURL:(id)a3 targetURL:(id)a4 timeout:(id)a5 sessionContext:(id)a6;
- (NSURL)targetURL;
- (id)saveThumbnailCompletionBlock;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setSaveThumbnailCompletionBlock:(id)a3;
@end

@implementation BRCThumbnailGenerateOperation

- (BRCThumbnailGenerateOperation)initWithDocumentAtURL:(id)a3 targetURL:(id)a4 timeout:(id)a5 sessionContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = NSString;
  v16 = [v11 path];
  v17 = [v15 stringWithFormat:@"thumbnail-generate/%@", v16];

  v24.receiver = self;
  v24.super_class = (Class)BRCThumbnailGenerateOperation;
  v18 = [(_BRCOperation *)&v24 initWithName:v17];
  if (v18)
  {
    v19 = objc_msgSend(MEMORY[0x263EFD780], "br_operationGroupWithName:", @"ThumbnailGenerate");
    [(_BRCOperation *)v18 setGroup:v19];

    objc_storeStrong((id *)&v18->_url, a3);
    objc_storeStrong((id *)&v18->_targetURL, a4);
    uint64_t v20 = [v14 tapToRadarManager];
    tapToRadarManager = v18->_tapToRadarManager;
    v18->_tapToRadarManager = (BRCTapToRadarManager *)v20;

    if (v13)
    {
      [v13 doubleValue];
      [(_BRCOperation *)v18 setTimeout:"setTimeout:"];
    }
    else
    {
      v22 = +[BRCUserDefaults defaultsForMangledID:0];
      [v22 thumbnailGenerationOperationTimeout];
      [(_BRCOperation *)v18 setTimeout:"setTimeout:"];
    }
  }

  return v18;
}

- (void)main
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _url && _targetURL%@", (uint8_t *)&v2, 0xCu);
}

void __37__BRCThumbnailGenerateOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 504);
    uint64_t v8 = *(void *)(v6 + 520);
    int v9 = 138413058;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Saved the thumbnail of %@ to %@ with error %@%@", (uint8_t *)&v9, 0x2Au);
  }

  [*(id *)(a1 + 32) completedWithResult:0 error:v3];
}

- (void)cancel
{
  if ([(_BRCOperation *)self timedOut])
  {
    id v3 = NSString;
    [(_BRCOperation *)self timeout];
    v5 = objc_msgSend(v3, "stringWithFormat:", @"Thumbnail generation operation got timeouted after %fs", v4);
    tapToRadarManager = self->_tapToRadarManager;
    uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorThumbnailGenerationOperationTimedOut");
    [(BRCTapToRadarManager *)tapToRadarManager requestTapToRadarWithTitle:v5 description:@"Possible issue in QL, Thumbnail generation operation was running for too long" keywords:MEMORY[0x263EFFA68] attachments:MEMORY[0x263EFFA68] sendFullLog:0 displayReason:@"thumbnail generation encountered an error" triggerRootCause:v7];
  }
  uint64_t v8 = (void (**)(void, void))MEMORY[0x2455D9A50](self->_saveThumbnailCompletionBlock);
  if (v8)
  {
    int v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
    ((void (**)(void, void *))v8)[2](v8, v9);

    id saveThumbnailCompletionBlock = self->_saveThumbnailCompletionBlock;
    self->_id saveThumbnailCompletionBlock = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)BRCThumbnailGenerateOperation;
  [(_BRCOperation *)&v11 cancel];
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id saveThumbnailCompletionBlock = self->_saveThumbnailCompletionBlock;
  id v8 = a3;
  uint64_t v9 = MEMORY[0x2455D9A50](saveThumbnailCompletionBlock);
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    id v11 = self->_saveThumbnailCompletionBlock;
    self->_id saveThumbnailCompletionBlock = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)BRCThumbnailGenerateOperation;
  [(_BRCOperation *)&v12 finishWithResult:v8 error:v6];
}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (id)saveThumbnailCompletionBlock
{
  return self->_saveThumbnailCompletionBlock;
}

- (void)setSaveThumbnailCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveThumbnailCompletionBlock, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end