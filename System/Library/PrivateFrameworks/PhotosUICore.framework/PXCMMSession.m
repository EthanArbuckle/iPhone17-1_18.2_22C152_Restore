@interface PXCMMSession
+ (PXCMMSession)new;
- (BOOL)hideActionMenu;
- (BOOL)ppt_presentComposeRecipientView;
- (BOOL)ppt_scrollComposeRecipientsView;
- (NSDictionary)diagnosticDictionary;
- (NSDictionary)preparationOptionsPerAsset;
- (NSSet)notificationSuppressionContexts;
- (NSString)importSessionID;
- (PXAssetImportStatusManager)importStatusManager;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXCMMActionManager)actionManager;
- (PXCMMSession)init;
- (PXCMMSession)initWithContext:(id)a3;
- (PXCMMViewModel)viewModel;
- (PXMomentShareStatus)momentShareStatus;
- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager;
- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsPreviewDataSourceManager;
- (PXUIMediaProvider)mediaProvider;
- (double)ppt_delay;
- (id)momentShareStatusPresentationWithPresentationStyle:(int64_t)a3;
- (unint64_t)activityType;
- (unint64_t)sourceType;
- (void)setPpt_delay:(double)a3;
@end

@implementation PXCMMSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareStatus, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_preparationOptionsPerAsset, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsPreviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (BOOL)ppt_scrollComposeRecipientsView
{
  return self->_ppt_scrollComposeRecipientsView;
}

- (BOOL)ppt_presentComposeRecipientView
{
  return self->_ppt_presentComposeRecipientView;
}

- (void)setPpt_delay:(double)a3
{
  self->_ppt_delay = a3;
}

- (double)ppt_delay
{
  return self->_ppt_delay;
}

- (PXMomentShareStatus)momentShareStatus
{
  return self->_momentShareStatus;
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (PXCMMViewModel)viewModel
{
  return self->_viewModel;
}

- (NSDictionary)preparationOptionsPerAsset
{
  return self->_preparationOptionsPerAsset;
}

- (BOOL)hideActionMenu
{
  return self->_hideActionMenu;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (PXCMMActionManager)actionManager
{
  return self->_actionManager;
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsPreviewDataSourceManager
{
  return self->_peopleSuggestionsPreviewDataSourceManager;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXAssetImportStatusManager)importStatusManager
{
  return 0;
}

- (NSSet)notificationSuppressionContexts
{
  return 0;
}

- (id)momentShareStatusPresentationWithPresentationStyle:(int64_t)a3
{
  v5 = [(PXCMMSession *)self momentShareStatus];
  v6 = [v5 momentShare];

  if (+[PXMomentShareStatusMock shouldUseMockStatus])
  {
    v7 = [[PXMomentShareStatusMock alloc] initWithMomentShare:v6];
  }
  else
  {
    v7 = [(PXCMMSession *)self momentShareStatus];
  }
  v8 = v7;
  if (v7) {
    v9 = [[PXMomentShareStatusPresentation alloc] initWithMomentShareStatus:v7 presentationStyle:a3];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (PXCMMSession)initWithContext:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PXCMMSession;
  v5 = [(PXCMMSession *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 dataSourceManager];
    dataSourceManager = v5->_dataSourceManager;
    v5->_dataSourceManager = (PXAssetsDataSourceManager *)v6;

    uint64_t v8 = [v4 mediaProvider];
    mediaProvider = v5->_mediaProvider;
    v5->_mediaProvider = (PXUIMediaProvider *)v8;

    v5->_activityType = [v4 activityType];
    v5->_sourceType = [v4 sourceType];
    v5->_hideActionMenu = [v4 hideActionMenu];
    uint64_t v10 = [v4 assetPreparationOptions];
    preparationOptionsPerAsset = v5->_preparationOptionsPerAsset;
    v5->_preparationOptionsPerAsset = (NSDictionary *)v10;

    uint64_t v12 = [v4 peopleSuggestionsPreviewDataSourceManager];
    peopleSuggestionsPreviewDataSourceManager = v5->_peopleSuggestionsPreviewDataSourceManager;
    v5->_peopleSuggestionsPreviewDataSourceManager = (PXPeopleSuggestionsDataSourceManager *)v12;

    uint64_t v14 = [v4 peopleSuggestionsDataSourceManager];
    peopleSuggestionsDataSourceManager = v5->_peopleSuggestionsDataSourceManager;
    v5->_peopleSuggestionsDataSourceManager = (PXPeopleSuggestionsDataSourceManager *)v14;

    v16 = (void *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v5->_dataSourceManager];
    v17 = objc_alloc_init(PXCMMViewModel);
    viewModel = v5->_viewModel;
    v5->_viewModel = v17;

    v19 = v5->_viewModel;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __32__PXCMMSession_initWithContext___block_invoke;
    v29 = &unk_1E5DB7C08;
    id v20 = v4;
    id v30 = v20;
    id v31 = v16;
    id v21 = v16;
    [(PXCMMViewModel *)v19 performChanges:&v26];
    uint64_t v22 = objc_msgSend(v20, "actionManager", v26, v27, v28, v29);
    actionManager = v5->_actionManager;
    v5->_actionManager = (PXCMMActionManager *)v22;

    objc_msgSend(v20, "ppt_delay");
    v5->_ppt_delay = v24;
    v5->_ppt_presentComposeRecipientView = objc_msgSend(v20, "ppt_presentComposeRecipientView");
    v5->_ppt_scrollComposeRecipientsView = objc_msgSend(v20, "ppt_scrollComposeRecipientsView");
  }
  return v5;
}

void __32__PXCMMSession_initWithContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v13 = a2;
  id v4 = [v3 originalTitle];
  [v13 setOriginalTitle:v4];

  v5 = [*(id *)(a1 + 32) title];
  [v13 setTitle:v5];

  uint64_t v6 = [*(id *)(a1 + 32) subtitle];
  [v13 setSubtitle:v6];

  v7 = [*(id *)(a1 + 32) recipients];
  [v13 setRecipients:v7];

  uint64_t v8 = [*(id *)(a1 + 32) originatorRecipient];
  [v13 setOriginatorRecipient:v8];

  objc_msgSend(v13, "setNumberOfReceivedAssets:", objc_msgSend(*(id *)(a1 + 32), "numberOfReceivedAssets"));
  v9 = [*(id *)(a1 + 32) startDate];
  [v13 setStartDate:v9];

  uint64_t v10 = [*(id *)(a1 + 32) endDate];
  [v13 setEndDate:v10];

  objc_msgSend(v13, "setPhotosCount:", objc_msgSend(*(id *)(a1 + 32), "photosCount"));
  objc_msgSend(v13, "setVideosCount:", objc_msgSend(*(id *)(a1 + 32), "videosCount"));
  objc_msgSend(v13, "setTotalCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v11 = [*(id *)(a1 + 32) posterAsset];
  uint64_t v12 = [*(id *)(a1 + 32) posterMediaProvider];
  [v13 setPosterAsset:v11 posterMediaProvider:v12];

  [v13 setSelectionManager:*(void *)(a1 + 40)];
  [v13 setSelectionEnabled:1];
  objc_msgSend(v13, "setOneUpDisabled:", objc_msgSend(*(id *)(a1 + 32), "disableOneUp"));
}

- (PXCMMSession)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMSession.m", 23, @"%s is not available as initializer", "-[PXCMMSession init]");

  abort();
}

+ (PXCMMSession)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMSession.m", 27, @"%s is not available as initializer", "+[PXCMMSession new]");

  abort();
}

- (NSDictionary)diagnosticDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Activity Type";
  unint64_t v3 = [(PXCMMSession *)self activityType];
  if (v3 - 1 > 3) {
    id v4 = @"PXCMMActivityTypeNone";
  }
  else {
    id v4 = off_1E5DCE4A8[v3 - 1];
  }
  v10[0] = v4;
  v9[1] = @"Source Type";
  unint64_t v5 = [(PXCMMSession *)self sourceType];
  uint64_t v6 = @"PXCMMSourceTypeMessages";
  if (!v5) {
    uint64_t v6 = @"PXCMMSourceTypePhotos";
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  return (NSDictionary *)v7;
}

@end