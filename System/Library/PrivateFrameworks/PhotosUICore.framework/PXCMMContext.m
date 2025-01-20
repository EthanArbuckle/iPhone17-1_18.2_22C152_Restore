@interface PXCMMContext
+ (id)new;
- (BOOL)disableOneUp;
- (BOOL)hideActionMenu;
- (BOOL)ppt_presentComposeRecipientView;
- (BOOL)ppt_scrollComposeRecipientsView;
- (NSArray)recipients;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)assetPreparationOptions;
- (NSString)originalTitle;
- (NSString)subtitle;
- (NSString)title;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXCMMActionManager)actionManager;
- (PXCMMContext)init;
- (PXCMMContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5;
- (PXDisplayAsset)posterAsset;
- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager;
- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsPreviewDataSourceManager;
- (PXRecipient)originatorRecipient;
- (PXUIImageProvider)posterMediaProvider;
- (PXUIMediaProvider)mediaProvider;
- (double)ppt_delay;
- (id)createSession;
- (int64_t)count;
- (int64_t)photosCount;
- (int64_t)videosCount;
- (unint64_t)activityType;
- (unint64_t)numberOfReceivedAssets;
- (unint64_t)sourceType;
- (void)setAssetPreparationOptions:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDisableOneUp:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setHideActionMenu:(BOOL)a3;
- (void)setNumberOfReceivedAssets:(unint64_t)a3;
- (void)setOriginalTitle:(id)a3;
- (void)setOriginatorRecipient:(id)a3;
- (void)setPeopleSuggestionsDataSourceManager:(id)a3;
- (void)setPeopleSuggestionsPreviewDataSourceManager:(id)a3;
- (void)setPhotosCount:(int64_t)a3;
- (void)setPosterAsset:(id)a3;
- (void)setPosterMediaProvider:(id)a3;
- (void)setPpt_delay:(double)a3;
- (void)setPpt_presentComposeRecipientView:(BOOL)a3;
- (void)setPpt_scrollComposeRecipientsView:(BOOL)a3;
- (void)setRecipients:(id)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVideosCount:(int64_t)a3;
@end

@implementation PXCMMContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorRecipient, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_assetPreparationOptions, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsPreviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (void)setPpt_scrollComposeRecipientsView:(BOOL)a3
{
  self->_ppt_scrollComposeRecipientsView = a3;
}

- (BOOL)ppt_scrollComposeRecipientsView
{
  return self->_ppt_scrollComposeRecipientsView;
}

- (void)setPpt_presentComposeRecipientView:(BOOL)a3
{
  self->_ppt_presentComposeRecipientView = a3;
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

- (void)setNumberOfReceivedAssets:(unint64_t)a3
{
  self->_numberOfReceivedAssets = a3;
}

- (unint64_t)numberOfReceivedAssets
{
  return self->_numberOfReceivedAssets;
}

- (void)setOriginatorRecipient:(id)a3
{
}

- (PXRecipient)originatorRecipient
{
  return self->_originatorRecipient;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setVideosCount:(int64_t)a3
{
  self->_videosCount = a3;
}

- (int64_t)videosCount
{
  return self->_videosCount;
}

- (void)setPhotosCount:(int64_t)a3
{
  self->_photosCount = a3;
}

- (int64_t)photosCount
{
  return self->_photosCount;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setPosterMediaProvider:(id)a3
{
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (void)setPosterAsset:(id)a3
{
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (void)setAssetPreparationOptions:(id)a3
{
}

- (NSDictionary)assetPreparationOptions
{
  return self->_assetPreparationOptions;
}

- (void)setDisableOneUp:(BOOL)a3
{
  self->_disableOneUp = a3;
}

- (BOOL)disableOneUp
{
  return self->_disableOneUp;
}

- (void)setHideActionMenu:(BOOL)a3
{
  self->_hideActionMenu = a3;
}

- (BOOL)hideActionMenu
{
  return self->_hideActionMenu;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setOriginalTitle:(id)a3
{
}

- (NSString)originalTitle
{
  return self->_originalTitle;
}

- (void)setPeopleSuggestionsDataSourceManager:(id)a3
{
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (void)setPeopleSuggestionsPreviewDataSourceManager:(id)a3
{
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsPreviewDataSourceManager
{
  return self->_peopleSuggestionsPreviewDataSourceManager;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXCMMActionManager)actionManager
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXCMMContext.m", 39, @"Method %s is a responsibility of subclass %@", "-[PXCMMContext actionManager]", v6 object file lineNumber description];

  abort();
}

- (id)createSession
{
  v2 = [[PXCMMSession alloc] initWithContext:self];
  return v2;
}

- (PXCMMContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXCMMContext;
  v11 = [(PXCMMContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSourceManager, a3);
    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    v12->_activityType = a5;
  }

  return v12;
}

- (PXCMMContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMContext.m", 16, @"%s is not available as initializer", "-[PXCMMContext init]");

  abort();
}

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMContext.m", 20, @"%s is not available as initializer", "+[PXCMMContext new]");

  abort();
}

@end