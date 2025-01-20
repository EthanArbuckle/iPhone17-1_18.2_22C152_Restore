@interface SFCollaborationItem
+ (id)collaborationItemForFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 defaultCollaboration:(BOOL)a6 managedFileURL:(id)a7;
+ (id)collaborationItemForItemProvider:(id)a3 activityItem:(id)a4 isURLProviderSupported:(BOOL)a5;
- (BOOL)_canShowOptions;
- (BOOL)defaultCollaboration;
- (BOOL)isLoading;
- (BOOL)isLoadingCanAddPeople;
- (BOOL)isLoadingMetadata;
- (BOOL)isLoadingOptions;
- (BOOL)isLoadingSendCopyRepresentation;
- (LPLinkMetadata)linkMetadata;
- (NSArray)options;
- (NSArray)sendCopyActivityItemValues;
- (NSArray)sendCopyActivityItems;
- (NSArray)sendCopyItemPlaceholderValues;
- (NSArray)sendCopyItems;
- (NSError)metadataLoadError;
- (NSItemProvider)itemProvider;
- (NSNumber)canAddPeople;
- (NSString)additionalContentIdentifier;
- (NSString)contentIdentifier;
- (NSString)description;
- (NSUUID)identifier;
- (SFChangePublisher)changePublisher;
- (SFCollaborationCloudSharingResult)cloudSharingResult;
- (SFCollaborationItem)initWithItemProvider:(id)a3 activityItem:(id)a4 placeholderActivityItem:(id)a5 defaultCollaboration:(BOOL)a6;
- (SFCollaborationMetadata)metadata;
- (_SWCollaborationShareOptions)shareOptions;
- (id)_defaultLoadingOptionsSummary;
- (id)_optionsSummary;
- (id)activityItem;
- (id)createCollaborationFooterViewModel;
- (id)placeholderActivityItem;
- (id)sendCopyRepresentation;
- (id)workQueue;
- (int64_t)type;
- (void)_didLoadMetadata:(id)a3;
- (void)_didLoadOptions:(id)a3 ckOptions:(id)a4;
- (void)_didLoadSendCopyRepresentation:(id)a3;
- (void)_loadMetadataIfNeeded;
- (void)_loadOptionsIfNeeded;
- (void)_loadSendCopyRepresentationIfNeeded;
- (void)_startLoading;
- (void)_updateLoadingState;
- (void)registerChangeObserver:(id)a3;
- (void)setActivityItem:(id)a3;
- (void)setCanAddPeople:(id)a3;
- (void)setChangePublisher:(id)a3;
- (void)setCloudSharingResult:(id)a3;
- (void)setDefaultCollaboration:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsLoadingCanAddPeople:(BOOL)a3;
- (void)setIsLoadingMetadata:(BOOL)a3;
- (void)setIsLoadingOptions:(BOOL)a3;
- (void)setIsLoadingSendCopyRepresentation:(BOOL)a3;
- (void)setItemProvider:(id)a3;
- (void)setLinkMetadata:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataLoadError:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPlaceholderActivityItem:(id)a3;
- (void)setSendCopyActivityItemValues:(id)a3;
- (void)setSendCopyActivityItems:(id)a3;
- (void)setSendCopyRepresentation:(id)a3;
- (void)setShareOptions:(id)a3;
- (void)setType:(int64_t)a3;
- (void)unregisterChangeObserver:(id)a3;
@end

@implementation SFCollaborationItem

+ (id)collaborationItemForItemProvider:(id)a3 activityItem:(id)a4 isURLProviderSupported:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = +[SFCollaborationUtilities isCKShareItemProvider:v7];
  BOOL v10 = +[SFCollaborationUtilities isSWYActivityItemProvider:v7];
  if (v9 || v10)
  {
    if (v9) {
      v12 = [[_SFCKShareCollaborationItem alloc] initWithItemProvider:v7 activityItem:v8];
    }
    else {
      v12 = [[_SFSWYCollaborationItem alloc] initWithItemProvider:v7 activityItem:v8 isURLProviderSupported:v5];
    }
    v11 = v12;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)collaborationItemForFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 defaultCollaboration:(BOOL)a6 managedFileURL:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v17 = [v13 absoluteString];
  if (!IsAppleInternalBuild())
  {

    v17 = @"<redacted>";
  }
  if (([v13 isFileURL] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"SFCollaborationItem.m", 123, @"url is not a fileURL: %@", v17 object file lineNumber description];
  }
  v18 = [[_SFFPShareCollaborationItem alloc] initWithFileURL:v13 itemProvider:v16 activityItem:v15 defaultCollaboration:v8 managedFileURL:v14];

  return v18;
}

- (SFCollaborationItem)initWithItemProvider:(id)a3 activityItem:(id)a4 placeholderActivityItem:(id)a5 defaultCollaboration:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SFCollaborationItem;
  id v14 = [(SFCollaborationItem *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_itemProvider, a3);
    objc_storeStrong(&v14->_activityItem, a4);
    objc_storeStrong(&v14->_placeholderActivityItem, a5);
    v17 = objc_alloc_init(SFChangePublisher);
    changePublisher = v14->_changePublisher;
    v14->_changePublisher = v17;

    v14->_defaultCollaboration = v6;
    v19 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v20 = [v19 bundleIdentifier];
    contentIdentifier = v14->_contentIdentifier;
    v14->_contentIdentifier = (NSString *)v20;

    v22 = share_sheet_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "no";
      v24 = v14->_identifier;
      *(_DWORD *)buf = 138413571;
      if (v6) {
        v23 = "yes";
      }
      v28 = v14;
      __int16 v29 = 2112;
      v30 = v24;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2113;
      id v34 = v12;
      __int16 v35 = 2113;
      id v36 = v13;
      __int16 v37 = 2080;
      v38 = v23;
      _os_log_impl(&dword_1A5389000, v22, OS_LOG_TYPE_DEFAULT, "%@: identifier:%@ itemProvider:%@ activityItem:%{private}@ placeholderActivityItem:%{private}@ defaultCollaboration:%s", buf, 0x3Eu);
    }

    [(SFCollaborationItem *)v14 _startLoading];
  }

  return v14;
}

- (NSString)additionalContentIdentifier
{
  return 0;
}

- (NSArray)sendCopyItems
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(SFCollaborationItem *)self sendCopyRepresentation];
  int64_t v5 = [(SFCollaborationItem *)self type];
  if (!v5)
  {
    BOOL v8 = [(SFCollaborationItem *)self sendCopyRepresentationURL];

    if (!v8)
    {
      uint64_t v9 = [(SFCollaborationItem *)self activityItem];

      v4 = (void *)v9;
    }
    goto LABEL_9;
  }
  if (v5 != 2 && v5 != 1) {
    goto LABEL_9;
  }
  if (!v4)
  {
    BOOL v6 = [(SFCollaborationItem *)self itemProvider];
    int v7 = [v6 supportsShareSheetSendCopyRepresentation];

    if (!v7) {
      goto LABEL_11;
    }
    v4 = [(SFCollaborationItem *)self itemProvider];
LABEL_9:
    if (!v4) {
      goto LABEL_11;
    }
  }
  [v3 addObject:v4];

LABEL_11:
  BOOL v10 = [(SFCollaborationItem *)self sendCopyActivityItems];
  [v3 addObjectsFromArray:v10];

  id v11 = (void *)[v3 copy];

  return (NSArray *)v11;
}

- (NSArray)sendCopyItemPlaceholderValues
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(SFCollaborationItem *)self sendCopyRepresentation];
  int64_t v5 = [(SFCollaborationItem *)self type];
  if (!v5)
  {
    BOOL v8 = self;
    uint64_t v9 = [(SFCollaborationItem *)v8 sendCopyRepresentationURL];

    if (v9) {
      [(SFCollaborationItem *)v8 sendCopyRepresentationURL];
    }
    else {
    uint64_t v10 = [(SFCollaborationItem *)v8 fileURL];
    }

    v4 = (void *)v10;
    goto LABEL_11;
  }
  if (v5 != 2 && v5 != 1) {
    goto LABEL_11;
  }
  if (!v4)
  {
    BOOL v6 = [(SFCollaborationItem *)self itemProvider];
    int v7 = [v6 supportsShareSheetSendCopyRepresentation];

    if (!v7) {
      goto LABEL_13;
    }
    v4 = [(SFCollaborationItem *)self itemProvider];
LABEL_11:
    if (!v4) {
      goto LABEL_13;
    }
  }
  [v3 addObject:v4];

LABEL_13:
  id v11 = [(SFCollaborationItem *)self sendCopyActivityItemValues];
  [v3 addObjectsFromArray:v11];

  id v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (id)workQueue
{
  if (workQueue_onceToken != -1) {
    dispatch_once(&workQueue_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)workQueue_workQueue;

  return v2;
}

void __32__SFCollaborationItem_workQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.sharing.sfcollaborationitem.work-queue", 0);
  v1 = (void *)workQueue_workQueue;
  workQueue_workQueue = (uint64_t)v0;
}

- (NSString)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SFCollaborationItem;
  v4 = [(SFCollaborationItem *)&v15 description];
  int64_t v5 = [(SFCollaborationItem *)self identifier];
  int64_t v6 = [(SFCollaborationItem *)self type];
  int v7 = [(SFCollaborationItem *)self itemProvider];
  BOOL v8 = [(SFCollaborationItem *)self activityItem];
  uint64_t v9 = [(SFCollaborationItem *)self placeholderActivityItem];
  uint64_t v10 = [(SFCollaborationItem *)self options];
  id v11 = [(SFCollaborationItem *)self sendCopyRepresentation];
  id v12 = [(SFCollaborationItem *)self canAddPeople];
  id v13 = [v3 stringWithFormat:@"%@ identifier:%@, type:%ld, itemProvider:%@, activityItem:%@, placeholderActivityItem:%@, options:%@, sendCopyRepresentation:%@, canAddPeople:%@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (void)_startLoading
{
  [(SFCollaborationItem *)self setIsLoadingCanAddPeople:1];
  [(SFCollaborationItem *)self _loadMetadataIfNeeded];
  [(SFCollaborationItem *)self _loadOptionsIfNeeded];

  [(SFCollaborationItem *)self _loadSendCopyRepresentationIfNeeded];
}

- (void)_loadMetadataIfNeeded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int64_t v5 = self;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "No metadata to load: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_loadOptionsIfNeeded
{
  v3 = [(SFCollaborationItem *)self options];

  if (!v3)
  {
    [(SFCollaborationItem *)self setIsLoadingOptions:1];
    id location = 0;
    objc_initWeak(&location, self);
    int v4 = [(SFCollaborationItem *)self itemProvider];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke;
    v5[3] = &unk_1E5BBE378;
    objc_copyWeak(&v6, &location);
    +[SFCollaborationUtilities loadShareOptionsForItemProvider:v4 completionHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke_2;
  block[3] = &unk_1E5BBE350;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __43__SFCollaborationItem__loadOptionsIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didLoadOptions:*(void *)(a1 + 32) ckOptions:*(void *)(a1 + 40)];
}

- (void)_loadSendCopyRepresentationIfNeeded
{
  v3 = [(SFCollaborationItem *)self sendCopyRepresentation];
  if (v3)
  {
  }
  else
  {
    int v4 = [(SFCollaborationItem *)self itemProvider];
    int v5 = [v4 supportsShareSheetSendCopyRepresentation];

    if (v5)
    {
      [(SFCollaborationItem *)self setIsLoadingSendCopyRepresentation:1];
      id location = 0;
      objc_initWeak(&location, self);
      id v6 = [(SFCollaborationItem *)self itemProvider];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke;
      v7[3] = &unk_1E5BBE3A0;
      objc_copyWeak(&v8, &location);
      +[SFCollaborationUtilities loadSendCopyRepresentationIfNeededForItemProvider:v6 completion:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke_2;
  v5[3] = &unk_1E5BBC540;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __58__SFCollaborationItem__loadSendCopyRepresentationIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didLoadSendCopyRepresentation:*(void *)(a1 + 32)];
}

- (void)_didLoadMetadata:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "did load metadata:%@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 defaultShareOptions];
    id v8 = +[SFCollaborationUtilities descriptionForShareOptions:v7];
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "loaded options:%@", (uint8_t *)&v11, 0xCu);
  }
  [(SFCollaborationItem *)self setIsLoadingMetadata:0];
  if (v4)
  {
    [(SFCollaborationItem *)self setMetadata:v4];
    uint64_t v9 = [v4 defaultShareOptions];
    [(SFCollaborationItem *)self setShareOptions:v9];

    id v10 = [(SFCollaborationItem *)self changePublisher];
    [v10 publishChangeDescriptor:1 forObservable:self];
  }
  [(SFCollaborationItem *)self _updateLoadingState];
}

- (void)_didLoadOptions:(id)a3 ckOptions:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = +[SFCollaborationUtilities descriptionForShareOptions:v6];
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "did load options:%@", (uint8_t *)&v10, 0xCu);
  }
  [(SFCollaborationItem *)self setIsLoadingOptions:0];
  if (v7 && [(SFCollaborationItem *)self type] == 1) {
    [(SFCollaborationItem *)self setCkOptions:v7];
  }
  if (v6) {
    [(SFCollaborationItem *)self setShareOptions:v6];
  }
  [(SFCollaborationItem *)self _updateLoadingState];
}

- (void)_didLoadSendCopyRepresentation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "did load send copy representation:%@", (uint8_t *)&v7, 0xCu);
  }

  [(SFCollaborationItem *)self setIsLoadingSendCopyRepresentation:0];
  if (v4)
  {
    [(SFCollaborationItem *)self setSendCopyRepresentation:v4];
    id v6 = [(SFCollaborationItem *)self changePublisher];
    [v6 publishChangeDescriptor:8 forObservable:self];
  }
  [(SFCollaborationItem *)self _updateLoadingState];
}

- (void)setCanAddPeople:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v5 BOOLValue];
      id v8 = @"NO";
      if (v7) {
        id v8 = @"YES";
      }
      int v10 = 138412290;
      int v11 = v8;
      _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "did load can add people:%@", (uint8_t *)&v10, 0xCu);
    }

    [(SFCollaborationItem *)self setIsLoadingCanAddPeople:0];
    objc_storeStrong((id *)&self->_canAddPeople, a3);
    uint64_t v9 = [(SFCollaborationItem *)self changePublisher];
    [v9 publishChangeDescriptor:16 forObservable:self];

    [(SFCollaborationItem *)self _updateLoadingState];
  }
}

- (void)_updateLoadingState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (![(SFCollaborationItem *)self isLoading])
  {
    id v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = self;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Did finish loading for collaboration item:%@", (uint8_t *)&v5, 0xCu);
    }

    id v4 = [(SFCollaborationItem *)self changePublisher];
    [v4 publishChangeDescriptor:4 forObservable:self];
  }
}

- (BOOL)isLoading
{
  if ([(SFCollaborationItem *)self isLoadingMetadata]
    || [(SFCollaborationItem *)self isLoadingOptions]
    || [(SFCollaborationItem *)self isLoadingSendCopyRepresentation])
  {
    return 1;
  }

  return [(SFCollaborationItem *)self isLoadingCanAddPeople];
}

- (void)registerChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SFCollaborationItem *)self changePublisher];
  [v5 registerChangeObserver:v4];
}

- (void)unregisterChangeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SFCollaborationItem *)self changePublisher];
  [v5 unregisterChangeObserver:v4];
}

- (id)_defaultLoadingOptionsSummary
{
  return 0;
}

- (id)createCollaborationFooterViewModel
{
  v2 = [(SFCollaborationItem *)self _optionsSummary];
  if (v2)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2050000000;
    id v3 = (void *)getSLCollaborationFooterViewModelClass_softClass;
    uint64_t v11 = getSLCollaborationFooterViewModelClass_softClass;
    if (!getSLCollaborationFooterViewModelClass_softClass)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getSLCollaborationFooterViewModelClass_block_invoke;
      v7[3] = &unk_1E5BBBFF8;
      void v7[4] = &v8;
      __getSLCollaborationFooterViewModelClass_block_invoke((uint64_t)v7);
      id v3 = (void *)v9[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v8, 8);
    id v5 = (void *)[[v4 alloc] initWithTitle:0 subtitle:0];
    [v5 setOptionsSummary:v2];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_optionsSummary
{
  if (![(SFCollaborationItem *)self _canShowOptions]) {
    goto LABEL_10;
  }
  if ([(SFCollaborationItem *)self isLoading])
  {
    id v3 = [(SFCollaborationItem *)self _defaultLoadingOptionsSummary];
    if (v3) {
      goto LABEL_13;
    }
    CFStringRef v4 = @"PREPARING_SHARE_OPTIONS";
    goto LABEL_12;
  }
  uint64_t v5 = [(SFCollaborationItem *)self canAddPeople];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(SFCollaborationItem *)self canAddPeople];
    int v8 = [v7 BOOLValue];

    if (!v8)
    {
      CFStringRef v4 = @"SHARE_OPTIONS_CANNOT_ADD";
      goto LABEL_12;
    }
  }
  uint64_t v9 = [(SFCollaborationItem *)self shareOptions];
  id v3 = [v9 summary];

  if (v3) {
    goto LABEL_13;
  }
  uint64_t v10 = [(SFCollaborationItem *)self options];

  if (!v10)
  {
LABEL_10:
    id v3 = 0;
    goto LABEL_13;
  }
  CFStringRef v4 = @"SHARE_OPTIONS";
LABEL_12:
  id v3 = SFLocalizedStringForKey(v4);
LABEL_13:

  return v3;
}

- (BOOL)_canShowOptions
{
  return 1;
}

- (void)setShareOptions:(id)a3
{
  int v8 = (_SWCollaborationShareOptions *)a3;
  if (self->_shareOptions != v8)
  {
    objc_storeStrong((id *)&self->_shareOptions, a3);
    uint64_t v5 = [(_SWCollaborationShareOptions *)v8 optionsGroups];
    options = self->_options;
    self->_options = v5;

    uint64_t v7 = [(SFCollaborationItem *)self changePublisher];
    [v7 publishChangeDescriptor:2 forObservable:self];
  }
}

- (void)setCloudSharingResult:(id)a3
{
  uint64_t v5 = (SFCollaborationCloudSharingResult *)a3;
  if (self->_cloudSharingResult != v5)
  {
    objc_storeStrong((id *)&self->_cloudSharingResult, a3);
    if ([(SFCollaborationItem *)self type] == 1)
    {
      id v6 = [(SFCollaborationCloudSharingResult *)v5 error];
      id v15 = 0;
      BOOL v7 = +[SFCollaborationUtilities isOplockError:v6 updatedShare:&v15];
      id v8 = v15;

      if (v7 && v8)
      {
        uint64_t v9 = share_sheet_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "Received updated share from oplock error, updating options", buf, 2u);
        }

        [(SFCollaborationItem *)self setUpdatedShare:v8];
        [(SFCollaborationItem *)self setIsLoadingOptions:1];
        uint64_t v10 = [(SFCollaborationItem *)self ckOptions];
        id v13 = 0;
        uint64_t v11 = +[SFCollaborationUtilities optionsFromCKShare:v8 previousCKOptions:v10 newCKOptions:&v13];
        id v12 = v13;
        [(SFCollaborationItem *)self _didLoadOptions:v11 ckOptions:v12];
      }
    }
  }
}

- (_SWCollaborationShareOptions)shareOptions
{
  return self->_shareOptions;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (SFCollaborationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (SFCollaborationCloudSharingResult)cloudSharingResult
{
  return self->_cloudSharingResult;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (id)activityItem
{
  return self->_activityItem;
}

- (void)setActivityItem:(id)a3
{
}

- (id)placeholderActivityItem
{
  return self->_placeholderActivityItem;
}

- (void)setPlaceholderActivityItem:(id)a3
{
}

- (NSArray)sendCopyActivityItems
{
  return self->_sendCopyActivityItems;
}

- (void)setSendCopyActivityItems:(id)a3
{
}

- (NSArray)sendCopyActivityItemValues
{
  return self->_sendCopyActivityItemValues;
}

- (void)setSendCopyActivityItemValues:(id)a3
{
}

- (BOOL)defaultCollaboration
{
  return self->_defaultCollaboration;
}

- (void)setDefaultCollaboration:(BOOL)a3
{
  self->_defaultCollaboration = a3;
}

- (NSNumber)canAddPeople
{
  return self->_canAddPeople;
}

- (BOOL)isLoadingMetadata
{
  return self->_isLoadingMetadata;
}

- (void)setIsLoadingMetadata:(BOOL)a3
{
  self->_isLoadingMetadata = a3;
}

- (BOOL)isLoadingOptions
{
  return self->_isLoadingOptions;
}

- (void)setIsLoadingOptions:(BOOL)a3
{
  self->_isLoadingOptions = a3;
}

- (BOOL)isLoadingSendCopyRepresentation
{
  return self->_isLoadingSendCopyRepresentation;
}

- (void)setIsLoadingSendCopyRepresentation:(BOOL)a3
{
  self->_isLoadingSendCopyRepresentation = a3;
}

- (BOOL)isLoadingCanAddPeople
{
  return self->_isLoadingCanAddPeople;
}

- (void)setIsLoadingCanAddPeople:(BOOL)a3
{
  self->_isLoadingCanAddPeople = a3;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (NSError)metadataLoadError
{
  return self->_metadataLoadError;
}

- (void)setMetadataLoadError:(id)a3
{
}

- (id)sendCopyRepresentation
{
  return self->_sendCopyRepresentation;
}

- (void)setSendCopyRepresentation:(id)a3
{
}

- (SFChangePublisher)changePublisher
{
  return self->_changePublisher;
}

- (void)setChangePublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePublisher, 0);
  objc_storeStrong(&self->_sendCopyRepresentation, 0);
  objc_storeStrong((id *)&self->_metadataLoadError, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_canAddPeople, 0);
  objc_storeStrong((id *)&self->_sendCopyActivityItemValues, 0);
  objc_storeStrong((id *)&self->_sendCopyActivityItems, 0);
  objc_storeStrong(&self->_placeholderActivityItem, 0);
  objc_storeStrong(&self->_activityItem, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudSharingResult, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_shareOptions, 0);
}

@end