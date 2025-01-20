@interface WBReadingList
+ (BOOL)supportsURL:(id)a3;
+ (WBReadingList)defaultReadingList;
- (BOOL)addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5 error:(id *)a6;
- (WBReadingList)init;
- (id)_init;
@end

@implementation WBReadingList

+ (BOOL)supportsURL:(id)a3
{
  return objc_msgSend(a3, "_webBookmarks_isHTTPFamilyURL");
}

+ (WBReadingList)defaultReadingList
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WBReadingList_defaultReadingList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultReadingList_onceToken != -1) {
    dispatch_once(&defaultReadingList_onceToken, block);
  }
  v2 = (void *)defaultReadingList_wbReadingList;
  return (WBReadingList *)v2;
}

uint64_t __35__WBReadingList_defaultReadingList__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = defaultReadingList_wbReadingList;
  defaultReadingList_wbReadingList = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (WBReadingList)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Misuse of WBReadingList interface. Use class method defaultReadingList." userInfo:0];
  objc_exception_throw(v2);
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)WBReadingList;
  id v2 = [(WBReadingList *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(WBReadingListPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.WebBookmarks.AddToReadingListQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)addReadingListItemWithURL:(id)a3 title:(id)a4 previewText:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = +[WBReadingList supportsURL:v10];
  if (!v13)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[WBReadingList addReadingListItemWithURL:title:previewText:error:](v15);
      if (!a6) {
        goto LABEL_6;
      }
    }
    else if (!a6)
    {
      goto LABEL_6;
    }
    *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"WBErrorDomain" code:1 userInfo:0];
    goto LABEL_6;
  }
  serialQueue = self->_serialQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__WBReadingList_addReadingListItemWithURL_title_previewText_error___block_invoke;
  v17[3] = &unk_2643DA550;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  dispatch_async(serialQueue, v17);

LABEL_6:
  return v13;
}

uint64_t __67__WBReadingList_addReadingListItemWithURL_title_previewText_error___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) _addReadingListItemWithURL:a1[5] title:a1[6] previewText:a1[7]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_private, 0);
}

- (void)addReadingListItemWithURL:(os_log_t)log title:previewText:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Cannot create a Reading List item. URLs must begin with http or https.", v1, 2u);
}

@end