@interface MessageContentItemsHelper
+ (OS_os_log)log;
- (BOOL)allMailDropsDownloaded;
- (ContentRepresentationHandlingDelegate)representationHandler;
- (EMMailDropMetadata)mailDropBannerMetadata;
- (MessageContentItemsHelper)initWithWebView:(id)a3 contentItemHandler:(id)a4;
- (NSArray)contentItems;
- (NSString)debugDescription;
- (WKWebView)webView;
- (id)_futureForContentItem:(id)a3 networkUsage:(int64_t)a4 invokerID:(id)a5 previouslyInvoked:(BOOL *)a6 progress:(id *)a7;
- (id)_representationTypeForContentItem:(id)a3;
- (id)contentItemForContentID:(id)a3;
- (id)contentItemForElementID:(id)a3;
- (id)futureForContentItem:(id)a3 download:(BOOL)a4;
- (id)maildropProgressHandler;
- (id)startDownloadForContentItem:(id)a3 userInitiated:(BOOL)a4;
- (int64_t)displayStateForContentItem:(id)a3;
- (unint64_t)totalMailDropDownloadSize;
- (void)_computeMailDropProperties;
- (void)_injectAttachmentViewForElementWithSourceAttributeValue:(id)a3 forContentItem:(id)a4;
- (void)_updateProgressFraction:(id)a3 forContentItem:(id)a4;
- (void)associateElementID:(id)a3 withContentID:(id)a4;
- (void)associateElementID:(id)a3 withWKAttachmentID:(id)a4;
- (void)attachmentWasTappedWithElementID:(id)a3 rect:(CGRect)a4 view:(id)a5;
- (void)displayViewerForContentItem:(id)a3 rect:(CGRect)a4 view:(id)a5;
- (void)downloadAllMailDropAttachments;
- (void)inlineImageFinishedDownloading:(id)a3;
- (void)noteDidFailLoadingResourceWithURL:(id)a3;
- (void)saveContentItem:(id)a3 toDestination:(int64_t)a4;
- (void)setAllMailDropsDownloaded:(BOOL)a3;
- (void)setContentItems:(id)a3;
- (void)setDisplayState:(int64_t)a3 forContentItem:(id)a4;
- (void)setMaildropProgressHandler:(id)a3;
- (void)setPercentCompleted:(double)a3 forContentItem:(id)a4;
- (void)setRepresentationHandler:(id)a3;
- (void)setTotalMailDropDownloadSize:(unint64_t)a3;
- (void)setWebView:(id)a3;
- (void)showMenuForContentItem:(id)a3 rect:(CGRect)a4 view:(id)a5;
- (void)updateDragItemProvider:(id)a3 forElementID:(id)a4;
- (void)updatePDFContentItemIfNeeded:(void *)a3 contentRepresentation:;
@end

@implementation MessageContentItemsHelper

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MessageContentItemsHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, block);
  }
  v2 = (void *)log_log_1;
  return (OS_os_log *)v2;
}

void __32__MessageContentItemsHelper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;
}

- (id)_representationTypeForContentItem:(id)a3
{
  id v3 = [a3 uniformTypeIdentifier];
  int v4 = objc_msgSend(v3, "ef_conformsToRFC822UTType");
  v5 = (id *)MEMORY[0x1E4F5FC98];
  if (!v4) {
    v5 = (id *)MEMORY[0x1E4F5FCB0];
  }
  id v6 = *v5;

  return v6;
}

- (MessageContentItemsHelper)initWithWebView:(id)a3 contentItemHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MessageContentItemsHelper;
  v9 = [(MessageContentItemsHelper *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    objc_storeWeak((id *)&v10->_representationHandler, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    elementIDToContentID = v10->_elementIDToContentID;
    v10->_elementIDToContentID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    elementIDToWKAttachmentID = v10->_elementIDToWKAttachmentID;
    v10->_elementIDToWKAttachmentID = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contentIDToTask = v10->_contentIDToTask;
    v10->_contentIDToTask = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    inlinedImageContentIDs = v10->_inlinedImageContentIDs;
    v10->_inlinedImageContentIDs = v17;

    uint64_t v19 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.messageContentItemsHelperAttachments" qualityOfService:25];
    attachmentsScheduler = v10->_attachmentsScheduler;
    v10->_attachmentsScheduler = (EFScheduler *)v19;

    v21 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3A20D18];
    v22 = [v7 _remoteObjectRegistry];
    uint64_t v23 = [v22 remoteObjectProxyWithInterface:v21];
    webProcessProxy = v10->_webProcessProxy;
    v10->_webProcessProxy = (MSMailWebProcessAttachmentProxy *)v23;
  }
  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_contentItems];
}

- (void)setContentItems:(id)a3
{
  id v9 = a3;
  int v4 = (NSArray *)[v9 copy];
  contentItems = self->_contentItems;
  self->_contentItems = v4;

  self->_didComputeMailDropProperties = 0;
  mailDropBannerMetadata = self->_mailDropBannerMetadata;
  self->_mailDropBannerMetadata = 0;

  self->_totalUnstartedMailDropDownloadSize = 0;
  id maildropProgressHandler = self->_maildropProgressHandler;
  self->_totalMailDropDownloadSize = 0;
  self->_id maildropProgressHandler = 0;

  totalMailDropProgress = self->_totalMailDropProgress;
  self->_totalMailDropProgress = 0;

  self->_allMailDropsDownloaded = 0;
}

- (void)associateElementID:(id)a3 withContentID:(id)a4
{
}

- (void)associateElementID:(id)a3 withWKAttachmentID:(id)a4
{
}

- (id)contentItemForElementID:(id)a3
{
  int v4 = [(NSMutableDictionary *)self->_elementIDToContentID objectForKeyedSubscript:a3];
  v5 = [(MessageContentItemsHelper *)self contentItemForContentID:v4];

  return v5;
}

- (id)contentItemForContentID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(MessageContentItemsHelper *)self contentItems];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 contentID];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_computeMailDropProperties
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self->_didComputeMailDropProperties = 1;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(MessageContentItemsHelper *)self contentItems];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 mailDropMetadata];
        if (v10)
        {
          if (!v6)
          {
            char v11 = [MEMORY[0x1E4F602F0] mailDropMetadata];
            mailDropBannerMetadata = self->_mailDropBannerMetadata;
            self->_mailDropBannerMetadata = v11;
          }
          uint64_t v13 = [v10 fileSize];
          if ([v9 isAvailableLocally]) {
            v5 += v13;
          }
          else {
            self->_totalUnstartedMailDropDownloadSize += v13;
          }
          [(EMMailDropMetadata *)self->_mailDropBannerMetadata merge:v10];
          ++v6;
          v4 += v13;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);

    if (v6 >= 2) {
      [(EMMailDropMetadata *)self->_mailDropBannerMetadata setFlags:[(EMMailDropMetadata *)self->_mailDropBannerMetadata flags] | 0x10];
    }
  }
  else
  {

    unint64_t v5 = 0;
    unint64_t v4 = 0;
  }
  if (self->_mailDropBannerMetadata)
  {
    [(MessageContentItemsHelper *)self setTotalMailDropDownloadSize:v4];
    long long v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v4];
    totalMailDropProgress = self->_totalMailDropProgress;
    self->_totalMailDropProgress = v14;

    if (v5 >= v4) {
      self->_allMailDropsDownloaded = 1;
    }
  }
}

- (EMMailDropMetadata)mailDropBannerMetadata
{
  if (!self->_didComputeMailDropProperties) {
    [(MessageContentItemsHelper *)self _computeMailDropProperties];
  }
  mailDropBannerMetadata = self->_mailDropBannerMetadata;
  return mailDropBannerMetadata;
}

- (void)noteDidFailLoadingResourceWithURL:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
  unint64_t v6 = [v5 path];
  uint64_t v7 = [(MessageContentItemsHelper *)self contentItemForContentID:v6];
  if (v7)
  {
    id v8 = +[MessageContentItemsHelper log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MessageContentItemsHelper noteDidFailLoadingResourceWithURL:]();
    }

    id v9 = [v4 absoluteString];
    [(MessageContentItemsHelper *)self _injectAttachmentViewForElementWithSourceAttributeValue:v9 forContentItem:v7];
  }
}

- (void)attachmentWasTappedWithElementID:(id)a3 rect:(CGRect)a4 view:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [(MessageContentItemsHelper *)self contentItemForElementID:v11];
  if (!v13)
  {
    long long v17 = +[MessageContentItemsHelper log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v11;
      _os_log_impl(&dword_1DDF5A000, v17, OS_LOG_TYPE_DEFAULT, "tapped unknown attachment %@", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_19;
  }
  long long v14 = +[MessageContentItemsHelper log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [v13 contentID];
    int v25 = 138412290;
    id v26 = v15;
    _os_log_impl(&dword_1DDF5A000, v14, OS_LOG_TYPE_DEFAULT, "tapped attachment %@", (uint8_t *)&v25, 0xCu);
  }
  int64_t v16 = [(MessageContentItemsHelper *)self displayStateForContentItem:v13];
  switch(v16)
  {
    case 1:
      -[MessageContentItemsHelper displayViewerForContentItem:rect:view:](self, "displayViewerForContentItem:rect:view:", v13, v12, x, y, width, height);
      long long v17 = +[MessageContentItemsHelper log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = [v13 contentID];
        int v25 = 138412290;
        id v26 = v19;
        _os_log_impl(&dword_1DDF5A000, v17, OS_LOG_TYPE_DEFAULT, "attachment %@ is already downloaded", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_19;
    case 2:
      long long v20 = [(NSMutableDictionary *)self->_elementIDToWKAttachmentID objectForKeyedSubscript:v11];

      if (!v20)
      {
        long long v17 = +[MessageContentItemsHelper log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v24 = [v13 contentID];
          -[MessageContentItemsHelper attachmentWasTappedWithElementID:rect:view:](v24, (uint64_t)v11, (uint8_t *)&v25, v17);
        }
        goto LABEL_19;
      }
      v21 = +[MessageContentItemsHelper log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v13 contentID];
        int v25 = 138412290;
        id v26 = v22;
        _os_log_impl(&dword_1DDF5A000, v21, OS_LOG_TYPE_DEFAULT, "attachment %@ is downloadable", (uint8_t *)&v25, 0xCu);
      }
      id v23 = [(MessageContentItemsHelper *)self startDownloadForContentItem:v13 userInitiated:1];
      break;
    case 3:
      long long v17 = +[MessageContentItemsHelper log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = [v13 contentID];
        int v25 = 138412290;
        id v26 = v18;
        _os_log_impl(&dword_1DDF5A000, v17, OS_LOG_TYPE_DEFAULT, "attachment %@ is downloading", (uint8_t *)&v25, 0xCu);
      }
LABEL_19:

      break;
  }
}

- (void)displayViewerForContentItem:(id)a3 rect:(CGRect)a4 view:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  if ([v11 exchangeEventUID])
  {
    uint64_t v13 = [(MessageContentItemsHelper *)self representationHandler];
    objc_msgSend(v13, "showSelectedExchangeEventUID:fromRect:view:", objc_msgSend(v11, "exchangeEventUID"), v12, x, y, width, height);
  }
  else
  {
    uint64_t v13 = [(MessageContentItemsHelper *)self _futureForContentItem:v11 networkUsage:0 invokerID:0 previouslyInvoked:0 progress:0];
    long long v14 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__MessageContentItemsHelper_displayViewerForContentItem_rect_view___block_invoke;
    v15[3] = &unk_1E6D1AA50;
    v15[4] = self;
    double v17 = x;
    double v18 = y;
    double v19 = width;
    double v20 = height;
    id v16 = v12;
    [v13 onScheduler:v14 addSuccessBlock:v15];
  }
}

void __67__MessageContentItemsHelper_displayViewerForContentItem_rect_view___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) representationHandler];
  objc_msgSend(v3, "showSelectedContentRepresentation:fromRect:view:", v4, *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)showMenuForContentItem:(id)a3 rect:(CGRect)a4 view:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a5;
  id v12 = [(MessageContentItemsHelper *)self _futureForContentItem:a3 networkUsage:0 invokerID:0 previouslyInvoked:0 progress:0];
  uint64_t v13 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__MessageContentItemsHelper_showMenuForContentItem_rect_view___block_invoke;
  v15[3] = &unk_1E6D1AA50;
  v15[4] = self;
  CGFloat v17 = x;
  CGFloat v18 = y;
  CGFloat v19 = width;
  CGFloat v20 = height;
  id v14 = v11;
  id v16 = v14;
  [v12 onScheduler:v13 addSuccessBlock:v15];
}

void __62__MessageContentItemsHelper_showMenuForContentItem_rect_view___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) representationHandler];
  objc_msgSend(v3, "showMenuForSelectedContentRepresentation:fromRect:view:", v4, *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)futureForContentItem:(id)a3 download:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(MessageContentItemsHelper *)self _futureForContentItem:a3 networkUsage:v4 invokerID:0 previouslyInvoked:0 progress:0];
  return v5;
}

- (id)_futureForContentItem:(id)a3 networkUsage:(int64_t)a4 invokerID:(id)a5 previouslyInvoked:(BOOL *)a6 progress:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = [v12 contentID];
  long long v15 = [(NSMutableDictionary *)self->_contentIDToTask objectForKeyedSubscript:v14];
  id v16 = v15;
  if (!v15)
  {
LABEL_8:
    uint64_t v22 = [(MessageContentItemsHelper *)self _representationTypeForContentItem:v12];
    id v16 = [[MessageContentItemRepresentationTask alloc] initWithContentItem:v12 type:v22 networkUsage:a4];
    [(NSMutableDictionary *)self->_contentIDToTask setObject:v16 forKeyedSubscript:v14];
    id v23 = [(MessageContentItemRepresentationTask *)v16 future];
    v24 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__MessageContentItemsHelper__futureForContentItem_networkUsage_invokerID_previouslyInvoked_progress___block_invoke;
    v28[3] = &unk_1E6D1AA78;
    v28[4] = self;
    id v29 = v12;
    id v30 = v14;
    [v23 onScheduler:v24 addFailureBlock:v28];

    [(MessageContentItemRepresentationTask *)v16 resume];
    goto LABEL_9;
  }
  CGFloat v17 = [(MessageContentItemRepresentationTask *)v15 future];
  CGFloat v18 = [v17 resultIfAvailable];
  if (v18)
  {

    goto LABEL_9;
  }
  int64_t v19 = [(MessageContentItemRepresentationTask *)v16 networkUsage];

  if (v19 < a4)
  {
    CGFloat v20 = +[MessageContentItemsHelper log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v16;
      _os_log_impl(&dword_1DDF5A000, v20, OS_LOG_TYPE_DEFAULT, "Removing and re-creating task: %@", buf, 0xCu);
    }

    v21 = [(MessageContentItemRepresentationTask *)v16 progress];
    [v21 cancel];

    [(NSMutableDictionary *)self->_contentIDToTask setObject:0 forKeyedSubscript:v14];
    goto LABEL_8;
  }
LABEL_9:
  BOOL v25 = [(MessageContentItemRepresentationTask *)v16 hasBeenAccessedByInvokerWithID:v13];
  [(MessageContentItemRepresentationTask *)v16 addAccessedByInvokerWithID:v13];
  if (a6) {
    *a6 = v25;
  }
  if (a7)
  {
    *a7 = [(MessageContentItemRepresentationTask *)v16 progress];
  }
  id v26 = [(MessageContentItemRepresentationTask *)v16 future];

  return v26;
}

uint64_t __101__MessageContentItemsHelper__futureForContentItem_networkUsage_invokerID_previouslyInvoked_progress___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisplayState:2 forContentItem:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 setObject:0 forKeyedSubscript:v3];
}

- (void)updateDragItemProvider:(id)a3 forElementID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageContentItemsHelper *)self contentItemForElementID:v7];
  id v9 = [(MessageContentItemsHelper *)self _futureForContentItem:v8 networkUsage:0 invokerID:0 previouslyInvoked:0 progress:0];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke;
  v11[3] = &unk_1E6D1AAC8;
  objc_copyWeak(&v13, &location);
  id v10 = v8;
  id v12 = v10;
  [v9 addSuccessBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v5 = [*(id *)(a1 + 32) uniformTypeIdentifier];
    id v6 = [v3 contentURL];
    if ([WeakRetained hasItemConformingToTypeIdentifier:v5])
    {
      [WeakRetained setDataAvailability:1 forTypeIdentifier:v5];
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke_2;
      v9[3] = &unk_1E6D1AAA0;
      id v10 = v6;
      [WeakRetained registerFileRepresentationForTypeIdentifier:v5 dataAvailableImmediately:1 visibility:0 loadHandler:v9];
    }
    id v7 = [*(id *)(a1 + 32) displayName];
    id v8 = [v7 stringByDeletingPathExtension];
    [WeakRetained setSuggestedName:v8];

    [WeakRetained registerObject:v6 visibility:0];
  }
}

uint64_t __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)_injectAttachmentViewForElementWithSourceAttributeValue:(id)a3 forContentItem:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ContentItemMarkupGenerator attachmentElementMarkupStringForContentItem:v7];
  id v9 = [(MessageContentItemsHelper *)self webView];
  v12[0] = v6;
  v12[1] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v11 = (id)objc_msgSend(v9, "mcv_stringFromJavaScriptMethod:arguments:", @"replaceNodeWithSrcWithAttachment", v10);
}

- (int64_t)displayStateForContentItem:(id)a3
{
  contentIDToTask = self->_contentIDToTask;
  uint64_t v4 = [a3 contentID];
  unint64_t v5 = [(NSMutableDictionary *)contentIDToTask objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [v5 future];
    int v7 = [v6 isFinished];

    if (v7) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = 3;
    }
  }
  else
  {
    int64_t v8 = 2;
  }

  return v8;
}

- (void)setDisplayState:(int64_t)a3 forContentItem:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(MessageContentItemsHelper *)self webView];
  int64_t v8 = [v6 contentID];
  v12[0] = v8;
  id v9 = [NSNumber numberWithInteger:a3];
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v11 = (id)objc_msgSend(v7, "mcv_stringFromJavaScriptMethod:arguments:", @"set_state_for_attachment_cid", v10);
}

- (void)_updateProgressFraction:(id)a3 forContentItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 fractionCompleted];
  -[MessageContentItemsHelper setPercentCompleted:forContentItem:](self, "setPercentCompleted:forContentItem:", v6);
  int v7 = [v6 mailDropMetadata];

  if (v7)
  {
    if ([(MessageContentItemsHelper *)self displayStateForContentItem:v6] == 3)
    {
      int64_t v8 = [(MessageContentItemsHelper *)self maildropProgressHandler];

      if (v8)
      {
        id v9 = [(MessageContentItemsHelper *)self maildropProgressHandler];
        [(NSProgress *)self->_totalMailDropProgress fractionCompleted];
        v9[2](v9, 3);
      }
    }
  }
}

- (void)setPercentCompleted:(double)a3 forContentItem:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(MessageContentItemsHelper *)self webView];
  int64_t v8 = [v6 contentID];
  v12[0] = v8;
  id v9 = [NSNumber numberWithDouble:a3];
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v11 = (id)objc_msgSend(v7, "mcv_stringFromJavaScriptMethod:arguments:", @"set_progress_for_attachment_cid", v10);
}

- (void)inlineImageFinishedDownloading:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 contentID];
  if (([(NSMutableSet *)self->_inlinedImageContentIDs containsObject:v5] & 1) == 0)
  {
    [(NSMutableSet *)self->_inlinedImageContentIDs addObject:v5];
    id v6 = [v4 contentID];
    int v7 = (void *)MFCreateURLForContentID();

    int64_t v8 = [v4 type];
    id v9 = _markupForInlineAttachment(v4, [v8 conformsToType:*MEMORY[0x1E4F44450]]);

    id v10 = [(MessageContentItemsHelper *)self webView];
    id v11 = objc_msgSend(v7, "absoluteString", v5);
    v14[1] = v11;
    v14[2] = v9;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    id v13 = (id)objc_msgSend(v10, "mcv_stringFromJavaScriptMethod:arguments:", @"imageAttachmentNodeFinishedDownloading", v12);
  }
}

- (id)startDownloadForContentItem:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  char v43 = 0;
  id v42 = 0;
  int64_t v8 = [(MessageContentItemsHelper *)self _futureForContentItem:v6 networkUsage:v7 invokerID:@"startDownloadForContentItem" previouslyInvoked:&v43 progress:&v42];
  id v9 = v42;
  uint64_t v10 = [v6 dataTransferByteCount];
  if (v43)
  {
    id v11 = +[MessageContentItemsHelper log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 contentID];
      *(_DWORD *)buf = 138412546;
      v45 = v12;
      __int16 v46 = 2112;
      id v47 = v9;
      _os_log_impl(&dword_1DDF5A000, v11, OS_LOG_TYPE_DEFAULT, "Stopped downloading contentItem %@ since downloading was previously invoked with a progress of %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v13 = v10;
    if (([v6 isAvailableLocally] & 1) == 0)
    {
      [(MessageContentItemsHelper *)self setDisplayState:3 forContentItem:v6];
      id v14 = NSStringFromSelector(sel_fractionCompleted);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke;
      v39[3] = &unk_1E6D1AB18;
      v39[4] = self;
      id v40 = v9;
      id v41 = v6;
      long long v15 = objc_msgSend(v40, "ef_observeKeyPath:options:usingBlock:", v14, 1, v39);

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_3;
      v37[3] = &unk_1E6D1AB40;
      id v38 = v15;
      id v16 = v15;
      [v8 always:v37];
    }
    CGFloat v17 = [v6 mailDropMetadata];
    char v18 = [v17 isPhotoArchive];

    int64_t v19 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_4;
    v33[3] = &unk_1E6D1ABB8;
    char v35 = v18;
    v33[4] = self;
    id v20 = v6;
    id v34 = v20;
    BOOL v36 = v4;
    [v8 onScheduler:v19 addSuccessBlock:v33];

    v21 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_149;
    id v29 = &unk_1E6D1ABE0;
    id v22 = v20;
    id v30 = v22;
    v31 = self;
    uint64_t v32 = v13;
    [v8 onScheduler:v21 addFailureBlock:&v26];

    id v23 = [(MessageContentItemsHelper *)self representationHandler];
    [v23 didStartDownloadForContentItemWithProgress:v9];

    v24 = [v22 mailDropMetadata];

    if (v24)
    {
      self->_totalUnstartedMailDropDownloadSize -= v13;
      [(NSProgress *)self->_totalMailDropProgress addChild:v9 withPendingUnitCount:v13];
    }
    id v11 = v9;
  }
  return v9;
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_2;
  v4[3] = &unk_1E6D1AAF0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 performBlock:v4];
}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProgressFraction:*(void *)(a1 + 40) forContentItem:*(void *)(a1 + 48)];
}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setDisplayState:1 forContentItem:*(void *)(a1 + 40)];
  }
  if (v3 && ![*(id *)(a1 + 40) exchangeEventUID])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F77C58]) initWithName:@"com.apple.mobilemail.savingPhotos" expiration:0 preventIdleSleep:600.0];
      id v5 = *(void **)(*(void *)(a1 + 32) + 56);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5;
      v29[3] = &unk_1E6D1AB90;
      id v30 = v3;
      id v31 = v4;
      id v6 = v4;
      [v5 performBlock:v29];

      uint64_t v7 = v30;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F28CF0]);
      id v9 = [v3 contentURL];
      id v6 = (id)[v8 initWithURL:v9 options:2 error:0];

      if ([v6 isRegularFile])
      {
        BOOL v10 = +[ContentItemMarkupGenerator isDisplayableInlineContentItem:*(void *)(a1 + 40)];
        BOOL v11 = +[ContentItemMarkupGenerator isPDFContentItem:*(void *)(a1 + 40)];
      }
      else
      {
        BOOL v10 = 0;
        BOOL v11 = 0;
      }
      id v12 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v13 = [*(id *)(a1 + 40) contentID];
      uint64_t v7 = [v12 objectForKeyedSubscript:v13];

      id v14 = [*(id *)(a1 + 32) webView];
      long long v15 = [v14 _attachmentForIdentifier:v7];

      if (v15)
      {
        id v16 = [*(id *)(a1 + 40) uniformTypeIdentifier];
        [v15 setFileWrapper:v6 contentType:v16 completion:0];

        if (v10)
        {
          [*(id *)(a1 + 32) inlineImageFinishedDownloading:*(void *)(a1 + 40)];
        }
        else if (v11)
        {
          -[MessageContentItemsHelper updatePDFContentItemIfNeeded:contentRepresentation:](*(void *)(a1 + 32), *(void **)(a1 + 40), v3);
        }
      }
      else
      {
        CGFloat v17 = NSString;
        uint64_t v18 = [v7 length];
        uint64_t v19 = [*(id *)(a1 + 40) uniformTypeIdentifier];
        id v20 = (void *)v19;
        if (*(unsigned char *)(a1 + 49)) {
          v21 = &stru_1F39E2A88;
        }
        else {
          v21 = @"not ";
        }
        id v22 = [v17 stringWithFormat:@"WKAttachment is missing for an ID with length %lu, type %@, %@user initiated", v18, v19, v21];

        id v23 = [MEMORY[0x1E4F60D20] sharedReporter];
        v24 = (objc_class *)objc_opt_class();
        BOOL v25 = NSStringFromClass(v24);
        [v23 reportIssueType:v25 description:v22];

        memset(__b, 170, sizeof(__b));
        __b[8] = 0;
        *(void *)id v34 = 0xE00000001;
        int v35 = 1;
        pid_t v36 = getpid();
        size_t v32 = 648;
        if (!sysctl(v34, 4u, __b, &v32, 0, 0) && (__b[8] & 0x800) != 0) {
          __debugbreak();
        }
      }
    }
  }
  uint64_t v26 = [*(id *)(a1 + 40) mailDropMetadata];
  if (v26)
  {
    uint64_t v27 = [*(id *)(a1 + 32) maildropProgressHandler];
    if (!v27)
    {
LABEL_28:

      goto LABEL_29;
    }
    BOOL v28 = (unint64_t)[*(id *)(*(void *)(a1 + 32) + 64) completedUnitCount] < *(void *)(*(void *)(a1 + 32) + 120);

    if (!v28)
    {
      uint64_t v26 = [*(id *)(a1 + 32) maildropProgressHandler];
      v26[2](v26, 1, 1.0);
      goto LABEL_28;
    }
  }
LABEL_29:
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F77BB8] archiveDirectory];
  id v3 = [*(id *)(a1 + 32) contentURL];
  [v2 inputWithURL:v3];

  if (v2)
  {
    BOOL v4 = [MEMORY[0x1E4F77BB0] archive];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_6;
    v6[3] = &unk_1E6D1AB68;
    uint64_t v7 = v2;
    id v8 = *(id *)(a1 + 40);
    [v4 decompressContents:v7 completion:v6];

    id v5 = v7;
  }
  else
  {
    id v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) contentURL];
      objc_claimAutoreleasedReturnValue();
      __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5_cold_1();
    }
  }
}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_6(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  os_log_t v1 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.photoLibrary" qualityOfService:17];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [*(id *)(a1 + 32) scrubbedArchiveEntries];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v7 = [v6 contents];
        if ([v7 length]
          && ([MEMORY[0x1E4FB1818] imageWithData:v7],
              (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7;
          v14[3] = &unk_1E6D1AB40;
          uint64_t v9 = v8;
          long long v15 = v9;
          [v1 performBlock:v14];
        }
        else
        {
          uint64_t v9 = MFLogGeneral();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v6;
            _os_log_error_impl(&dword_1DDF5A000, v9, OS_LOG_TYPE_ERROR, "#Attachments Error reading extracted archive entry %@", buf, 0xCu);
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v3);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_136;
  void v12[3] = &unk_1E6D1AB40;
  id v13 = *(id *)(a1 + 40);
  [v1 performBlock:v12];

  return 1;
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7()
{
  char v0 = MFCameraRollSaveImage();
  id v1 = 0;
  if ((v0 & 1) == 0)
  {
    v2 = MFLogGeneral();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v1, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7_cold_1();
    }
  }
}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_136(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)updatePDFContentItemIfNeeded:(void *)a3 contentRepresentation:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [v5 contentID];
    LODWORD(v7) = [v7 containsObject:v8];

    if (v7)
    {
      uint64_t v9 = +[MessageContentItemsHelper log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = objc_msgSend(v5, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v10;
        _os_log_impl(&dword_1DDF5A000, v9, OS_LOG_TYPE_DEFAULT, "Content item is already displayed inline (%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = [v5 type];
      if ([v9 conformsToType:*MEMORY[0x1E4F44450]])
      {
        BOOL v11 = (void *)MEMORY[0x1E4F1C9B8];
        id v12 = [v6 contentURL];
        id v21 = 0;
        id v13 = [v11 dataWithContentsOfURL:v12 options:3 error:&v21];
        id v14 = v21;

        if (v13)
        {
          long long v15 = _markupForInlineAttachment(v5, 1);
          id v16 = objc_alloc(MEMORY[0x1E4F73EA0]);
          long long v17 = [v5 contentID];
          long long v18 = (void *)[v16 initWithContentID:v17 uttype:v9 data:v13 additionalMarkup:v15];

          [*(id *)(a1 + 72) updateToInlinePDFAttachmentIfNeeded:v18];
        }
        else
        {
          long long v15 = +[MessageContentItemsHelper log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            long long v19 = [v14 ef_publicDescription];
            id v20 = objc_msgSend(v5, "ef_publicDescription");
            [(MessageContentItemsHelper *)v19 updatePDFContentItemIfNeeded:buf contentRepresentation:v15];
          }
        }
      }
      else
      {
        id v14 = +[MessageContentItemsHelper log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[MessageContentItemsHelper updatePDFContentItemIfNeeded:contentRepresentation:]();
        }
      }
    }
  }
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_149(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mailDropMetadata];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 40) maildropProgressHandler];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) maildropProgressHandler];
      v5[2](v5, 2, 0.0);

      id v6 = *(void **)(*(void *)(a1 + 40) + 64);
      uint64_t v7 = [v6 completedUnitCount] - *(void *)(a1 + 48);
      [v6 setCompletedUnitCount:v7];
    }
  }
}

- (void)downloadAllMailDropAttachments
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_contentItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isAvailableLocally", (void)v11) & 1) == 0)
        {
          id v8 = [v7 mailDropMetadata];
          BOOL v9 = v8 == 0;

          if (!v9) {
            id v10 = [(MessageContentItemsHelper *)self startDownloadForContentItem:v7 userInitiated:1];
          }
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)saveContentItem:(id)a3 toDestination:(int64_t)a4
{
  uint64_t v5 = [(MessageContentItemsHelper *)self _futureForContentItem:a3 networkUsage:0 invokerID:0 previouslyInvoked:0 progress:0];
  id v6 = [MEMORY[0x1E4F60F28] globalAsyncScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke;
  v7[3] = &__block_descriptor_40_e33_v16__0__EMContentRepresentation_8l;
  v7[4] = a4;
  [v5 onScheduler:v6 addSuccessBlock:v7];
}

void __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = NSTemporaryDirectory();
  id v6 = [v4 fileURLWithPath:v5];
  uint64_t v7 = [v3 contentURL];
  id v8 = [v7 lastPathComponent];
  BOOL v9 = [v6 URLByAppendingPathComponent:v8];

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v11 = [v3 contentURL];
  id v32 = 0;
  char v12 = [v10 copyItemAtURL:v11 toURL:v9 error:&v32];
  long long v13 = v32;

  if (v13) {
    char v14 = 0;
  }
  else {
    char v14 = v12;
  }
  if (v14)
  {
    long long v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = *(void *)(a1 + 32);
    id v31 = 0;
    long long v17 = objc_msgSend(v15, "_doc_importItemAtURL:toDestination:error:", v9, v16, &v31);
    long long v18 = v31;

    if (!v17 || v18)
    {
      long long v19 = +[MessageContentItemsHelper log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v29 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v34 = v9;
        __int16 v35 = 2050;
        pid_t v36 = v29;
        __int16 v37 = 2114;
        id v38 = v18;
        _os_log_error_impl(&dword_1DDF5A000, v19, OS_LOG_TYPE_ERROR, "Failed to save url: %{public}@ to destination: %{public}ld, error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      long long v19 = +[MessageContentItemsHelper log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v34 = v17;
        _os_log_impl(&dword_1DDF5A000, v19, OS_LOG_TYPE_DEFAULT, "Imported file to URL: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v18 = +[MessageContentItemsHelper log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v3 contentURL];
      *(_DWORD *)buf = 138543874;
      id v34 = v20;
      __int16 v35 = 2114;
      pid_t v36 = v9;
      __int16 v37 = 2114;
      id v38 = v13;
      _os_log_error_impl(&dword_1DDF5A000, v18, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@, error: %{public}@", buf, 0x20u);
    }
  }

  id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = [v9 path];
  int v23 = [v21 fileExistsAtPath:v22];

  if (v23)
  {
    uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v30 = 0;
    char v25 = [v24 removeItemAtURL:v9 error:&v30];
    id v26 = v30;

    if (v26) {
      char v27 = 0;
    }
    else {
      char v27 = v25;
    }
    if ((v27 & 1) == 0)
    {
      BOOL v28 = +[MessageContentItemsHelper log];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke_cold_1((uint64_t)v9, (uint64_t)v26, v28);
      }
    }
  }
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (ContentRepresentationHandlingDelegate)representationHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representationHandler);
  return (ContentRepresentationHandlingDelegate *)WeakRetained;
}

- (void)setRepresentationHandler:(id)a3
{
}

- (unint64_t)totalMailDropDownloadSize
{
  return self->_totalMailDropDownloadSize;
}

- (void)setTotalMailDropDownloadSize:(unint64_t)a3
{
  self->_totalMailDropDownloadSize = a3;
}

- (BOOL)allMailDropsDownloaded
{
  return self->_allMailDropsDownloaded;
}

- (void)setAllMailDropsDownloaded:(BOOL)a3
{
  self->_allMailDropsDownloaded = a3;
}

- (id)maildropProgressHandler
{
  return self->_maildropProgressHandler;
}

- (void)setMaildropProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maildropProgressHandler, 0);
  objc_destroyWeak((id *)&self->_representationHandler);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_mailDropBannerMetadata, 0);
  objc_storeStrong((id *)&self->_webProcessProxy, 0);
  objc_storeStrong((id *)&self->_totalMailDropProgress, 0);
  objc_storeStrong((id *)&self->_attachmentsScheduler, 0);
  objc_storeStrong((id *)&self->_inlinedImageContentIDs, 0);
  objc_storeStrong((id *)&self->_contentIDToTask, 0);
  objc_storeStrong((id *)&self->_elementIDToWKAttachmentID, 0);
  objc_storeStrong((id *)&self->_elementIDToContentID, 0);
}

- (void)noteDidFailLoadingResourceWithURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1DDF5A000, v3, v4, "injecting attachment element, failed to load content item %{public}@", v5);
}

- (void)attachmentWasTappedWithElementID:(uint8_t *)buf rect:(os_log_t)log view:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "attachment %@ is not downloadable since elementID %@ is not found in WKAttachmentID dictionary", buf, 0x16u);
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_1DDF5A000, v3, v4, "#Attachments Error opening zip at %@.", v5);
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1DDF5A000, v3, v4, "#Attachments Error saving Maildrop image: %{public}@", v5);
}

- (void)updatePDFContentItemIfNeeded:(uint8_t *)buf contentRepresentation:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "Failed to get data from url (%{public}@) %{public}@", buf, 0x16u);
}

- (void)updatePDFContentItemIfNeeded:contentRepresentation:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1DDF5A000, v3, v4, "UTType does not conform to PDF (%{public}@)", v5);
}

void __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "Failed to cleanup %{public}@, error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end