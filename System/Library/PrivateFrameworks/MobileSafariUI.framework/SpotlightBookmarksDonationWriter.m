@interface SpotlightBookmarksDonationWriter
- (SpotlightBookmarksDonationWriter)init;
- (id)_bookmarksToDonate;
- (void)_addBookmark:(id)a3 toBookmarksToDonate:(id)a4;
- (void)_bookmarksWereChanged:(id)a3;
- (void)_donateBookmarksToCoreSpotlight;
- (void)_scheduleBookmarksDonationAfterDelay:(double)a3;
- (void)dealloc;
- (void)donateAllBookmarks;
- (void)getBookmarksToDonateWithCompletionHandler:(id)a3;
@end

@implementation SpotlightBookmarksDonationWriter

uint64_t __54__SpotlightBookmarksDonationWriter_donateAllBookmarks__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _donateBookmarksToCoreSpotlight];
}

- (void)_donateBookmarksToCoreSpotlight
{
  id v3 = [(SpotlightBookmarksDonationWriter *)self _bookmarksToDonate];
  -[WBSSiriIntelligenceDonor donateSafariBookmarksToCoreSpotlight:withCompletionHandler:](self->_siriIntelligenceDonor, "donateSafariBookmarksToCoreSpotlight:withCompletionHandler:");
}

- (id)_bookmarksToDonate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(WebBookmarkCollection *)self->_bookmarkCollection listWithID:*MEMORY[0x1E4FB6050] skipOffset:0 includeHidden:1 includeDescendantsAsChildren:1 filteredUsingString:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(v4, "bookmarkArraySkippingDecodeSyncData", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isFolder] & 1) == 0) {
          [(SpotlightBookmarksDonationWriter *)self _addBookmark:v9 toBookmarksToDonate:v3];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (void)_addBookmark:(id)a3 toBookmarksToDonate:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F98E58]);
  uint64_t v7 = [v10 displayTitle];
  [v6 setBookmarkTitle:v7];

  v8 = [v10 address];
  [v6 setBookmarkURLString:v8];

  objc_msgSend(v6, "setIsReadingListItem:", objc_msgSend(v10, "isReadingListItem"));
  v9 = [v10 UUID];
  [v6 setUuidString:v9];

  [v5 addObject:v6];
}

void __40__SpotlightBookmarksDonationWriter_init__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4FB6060] readonlySafariBookmarkCollectionConfiguration];
  [v5 setSkipsExternalNotifications:1];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4FB60E8]) initWithConfiguration:v5 checkIntegrity:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (SpotlightBookmarksDonationWriter)init
{
  v17.receiver = self;
  v17.super_class = (Class)SpotlightBookmarksDonationWriter;
  uint64_t v2 = [(SpotlightBookmarksDonationWriter *)&v17 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.MobileSafari.SpotlightBookmarksDonationWriter.%@.%p._internalQueue", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F98E50] sharedInstance];
    siriIntelligenceDonor = v2->_siriIntelligenceDonor;
    v2->_siriIntelligenceDonor = (WBSSiriIntelligenceDonor *)v8;

    id v10 = v2->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__SpotlightBookmarksDonationWriter_init__block_invoke;
    block[3] = &unk_1E6D79060;
    v11 = v2;
    v16 = v11;
    dispatch_async(v10, block);
    long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v11 selector:sel__bookmarksWereChanged_ name:*MEMORY[0x1E4FB6148] object:0];
    [v12 addObserver:v11 selector:sel__bookmarksWereChanged_ name:*MEMORY[0x1E4FB6180] object:0];
    [v12 addObserver:v11 selector:sel__bookmarksWereChanged_ name:*MEMORY[0x1E4FB6158] object:0];
    [(SpotlightBookmarksDonationWriter *)v11 _scheduleBookmarksDonationAfterDelay:*MEMORY[0x1E4F99278]];
    long long v13 = v11;
  }
  return v2;
}

- (void)donateAllBookmarks
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SpotlightBookmarksDonationWriter_donateAllBookmarks__block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_scheduleBookmarksDonationAfterDelay:(double)a3
{
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke;
  v6[3] = &unk_1E6D7E508;
  v6[4] = self;
  v7[1] = *(id *)&a3;
  objc_copyWeak(v7, &location);
  dispatch_async(internalQueue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = (void *)MEMORY[0x1E4F98AC0];
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke_2;
  v8[3] = &unk_1E6D79768;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v5 = [v2 scheduledTimerWithInterval:0 repeats:v4 queue:v8 handler:v3];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  objc_destroyWeak(&v9);
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(WBSDispatchSourceTimer *)self->_donationTimer invalidate];
  donationTimer = self->_donationTimer;
  self->_donationTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)SpotlightBookmarksDonationWriter;
  [(SpotlightBookmarksDonationWriter *)&v5 dealloc];
}

- (void)_bookmarksWereChanged:(id)a3
{
}

void __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _donateBookmarksToCoreSpotlight];
}

- (void)getBookmarksToDonateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __78__SpotlightBookmarksDonationWriter_getBookmarksToDonateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D79D68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __78__SpotlightBookmarksDonationWriter_getBookmarksToDonateWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _bookmarksToDonate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIntelligenceDonor, 0);
  objc_storeStrong((id *)&self->_donationTimer, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end