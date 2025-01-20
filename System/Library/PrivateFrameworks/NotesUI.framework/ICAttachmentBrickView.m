@interface ICAttachmentBrickView
+ (BOOL)usesSmallSizeForAttachment:(id)a3 withMetadata:(id)a4 type:(unint64_t)a5 insideSystemPaper:(BOOL)a6;
+ (CGSize)defaultBrickSize;
+ (CGSize)sizeForAttachment:(id)a3 usesSmallSize:(BOOL)a4;
+ (UIColor)standardBackgroundColor;
- (BOOL)hasPerformedInitialLayout;
- (BOOL)isAccessibilityElement;
- (BOOL)isInsideSystemPaper;
- (BOOL)isMetadataComplete;
- (BOOL)selected;
- (BOOL)waitingForMetadata;
- (CGSize)computedSize;
- (ICAddAttachmentsManagerAttachmentInfo)shareExtensionAttachmentInfo;
- (ICAttachment)attachment;
- (ICAttachmentBrickView)initWithType:(unint64_t)a3;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (LPLinkView)linkView;
- (NSHashTable)audioPlayerClients;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)widthConstraint;
- (UIColor)highlightColor;
- (double)effectiveLayoutCornerRadius;
- (float)playbackProgress;
- (id)_linkView:(id)a3 contextMenuConfigurationForSuggestedConfiguration:(id)a4;
- (id)_linkView:(id)a3 playerForAudio:(id)a4;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)quickLookTransitionView;
- (id)typeDescriptionForAccessibility;
- (unint64_t)playerState;
- (unint64_t)type;
- (void)addClient:(id)a3;
- (void)adjustSizeIfNecessary;
- (void)applicationDidBecomeActive;
- (void)attachmentDidLoadNotification:(id)a3;
- (void)attachmentPreviewImagesDidUpdateNotification:(id)a3;
- (void)constrainViews;
- (void)didFailFetchingMetadataNotification:(id)a3;
- (void)displayFilePreview;
- (void)displayGenericURLPreview;
- (void)displayRemoteAttachmentPreview;
- (void)displayScannedDocumentsPreview;
- (void)displaySynapseAttachmentPreview;
- (void)displayUnsupportedAttachmentPreview;
- (void)initialAttachmentPreviewDidLoad:(id)a3;
- (void)layoutSubviews;
- (void)linkView:(id)a3 didFetchMetadata:(id)a4;
- (void)linkViewNeedsResize:(id)a3;
- (void)mediaDidLoadNotification:(id)a3;
- (void)notifyClientsAboutSizeChangesIfNecessary;
- (void)pause;
- (void)play;
- (void)playbackPausedNotification:(id)a3;
- (void)playbackStartedNotification:(id)a3;
- (void)prepareForReuse;
- (void)progressChangedNotification:(id)a3;
- (void)registerForTraitChanges;
- (void)reloadData;
- (void)removeClient:(id)a3;
- (void)reset;
- (void)resetPlaybackProgressAndState;
- (void)setAttachment:(id)a3;
- (void)setAudioPlayerClients:(id)a3;
- (void)setHasPerformedInitialLayout:(BOOL)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setInsideSystemPaper:(BOOL)a3;
- (void)setLinkView:(id)a3;
- (void)setPlaybackProgress:(float)a3;
- (void)setPlayerState:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShareExtensionAttachmentInfo:(id)a3;
- (void)setWaitingForMetadata:(BOOL)a3;
- (void)setWidthConstraint:(id)a3;
- (void)typeDescriptionForAccessibility;
- (void)updateAttachmentBackgroundColorIfNecessary;
- (void)updateAudioClientsProgress:(float)a3;
- (void)updateAudioClientsState:(unint64_t)a3;
- (void)updateSearchResultBackgroundColorIfNecessary;
- (void)updateTitle;
- (void)updateUIWithMetadata:(id)a3;
@end

@implementation ICAttachmentBrickView

+ (CGSize)defaultBrickSize
{
  double v2 = 327.0;
  double v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)usesSmallSizeForAttachment:(id)a3 withMetadata:(id)a4 type:(unint64_t)a5 insideSystemPaper:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  if (!v10
    || [v9 attachmentType] == 6
    || [v9 attachmentType] == 4
    || [v9 attachmentType] == 2)
  {
    char v11 = 1;
  }
  else
  {
    int v13 = [v9 preferredViewSize];
    char v14 = 1;
    if ([v9 isURL] && !v13) {
      char v14 = a5 != 2 || v6;
    }
    BOOL v15 = 1;
    if ([v9 hasSynapseLink] && v6)
    {
      v16 = [v10 selectedText];
      BOOL v15 = v16 == 0;
    }
    char v11 = v14 & v15;
  }

  return v11;
}

+ (CGSize)sizeForAttachment:(id)a3 usesSmallSize:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  if (a4 || [v5 alwaysUsesSmallSize])
  {
    [(id)objc_opt_class() defaultBrickSize];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0x406B800000000000;
    uint64_t v8 = 0x4074700000000000;
  }

  double v11 = *(double *)&v8;
  double v12 = *(double *)&v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (UIColor)standardBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] secondarySystemFillColor];
}

- (ICAttachmentBrickView)initWithType:(unint64_t)a3
{
  [(id)objc_opt_class() defaultBrickSize];
  double v6 = v5;
  double v8 = v7;
  v16.receiver = self;
  v16.super_class = (Class)ICAttachmentBrickView;
  uint64_t v9 = -[ICAttachmentBrickView initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, v5, v7);
  if (v9)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    uint64_t v10 = (void *)getLPLinkViewClass_softClass;
    uint64_t v21 = getLPLinkViewClass_softClass;
    if (!getLPLinkViewClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getLPLinkViewClass_block_invoke;
      v17[3] = &unk_1E5FD95C0;
      v17[4] = &v18;
      __getLPLinkViewClass_block_invoke((uint64_t)v17);
      uint64_t v10 = (void *)v19[3];
    }
    double v11 = v10;
    _Block_object_dispose(&v18, 8);
    uint64_t v12 = objc_msgSend([v11 alloc], "initWithFrame:", 0.0, 0.0, v6, v8);
    linkView = v9->_linkView;
    v9->_linkView = (LPLinkView *)v12;

    v9->_type = a3;
    [(LPLinkView *)v9->_linkView _setPreferredSizeClass:8];
    [(LPLinkView *)v9->_linkView setDelegate:v9];
    [(LPLinkView *)v9->_linkView _setDisableTapGesture:1];
    [(LPLinkView *)v9->_linkView _setDisableHighlightGesture:0];
    if (a3 != 2)
    {
      [(LPLinkView *)v9->_linkView _setDisableAnimations:1];
      [(LPLinkView *)v9->_linkView _setDisableHighlightGesture:1];
      [(LPLinkView *)v9->_linkView _setDisableAutoPlay:1];
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision") && (a3 > 4 || ((1 << a3) & 0x1A) == 0))
    {
      [(LPLinkView *)v9->_linkView setOverrideUserInterfaceStyle:1];
      char v14 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
      [(LPLinkView *)v9->_linkView _setOverrideBackgroundColor:v14];
    }
    [(ICAttachmentBrickView *)v9 updateSearchResultBackgroundColorIfNecessary];
    [(ICAttachmentBrickView *)v9 registerForTraitChanges];
    [(ICAttachmentBrickView *)v9 updateAttachmentBackgroundColorIfNecessary];
    [(ICAttachmentBrickView *)v9 addSubview:v9->_linkView];
    [(ICAttachmentBrickView *)v9 constrainViews];
  }
  return v9;
}

- (void)setAttachment:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_attachment, obj);
    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F83010];
    [v6 removeObserver:self name:*MEMORY[0x1E4F83010] object:0];

    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4F83040];
    [v8 removeObserver:self name:*MEMORY[0x1E4F83040] object:0];

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = *MEMORY[0x1E4F830F8];
    [v10 removeObserver:self name:*MEMORY[0x1E4F830F8] object:0];

    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:@"ICAttachmentDidFailFetchingMetadataNotification" object:0];

    uint64_t v5 = objc_opt_respondsToSelector();
    if (v5) {
      uint64_t v5 = [(ICAttachmentBrickView *)self app_updateViewAnnotation];
    }
    if (obj)
    {
      int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      char v14 = [obj objectID];
      [v13 addObserver:self selector:sel_attachmentDidLoadNotification_ name:v7 object:v14];

      if ([obj attachmentType] == 6
        || [obj attachmentType] == 4
        || [obj attachmentType] == 2)
      {
        int v15 = 1;
      }
      else
      {
        int v15 = [obj hasFallbackPDF];
      }
      if ([obj attachmentType] == 8
        || [obj attachmentType] == 15
        || ([obj attachmentType] == 11 ? (int v16 = 1) : (int v16 = v15), v16 == 1))
      {
        v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v18 = [obj objectID];
        [v17 addObserver:self selector:sel_attachmentPreviewImagesDidUpdateNotification_ name:v9 object:v18];
      }
      if ([obj attachmentType] == 8
        || [obj attachmentType] == 7)
      {
        v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v20 = [obj objectID];
        [v19 addObserver:self selector:sel_initialAttachmentPreviewDidLoad_ name:@"ICAttachmentInitialPreviewDidLoadNotification" object:v20];

        uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v21 addObserver:self selector:sel_didFailFetchingMetadataNotification_ name:@"ICAttachmentDidFailFetchingMetadataNotification" object:obj];
      }
      else
      {
        if (!v15) {
          goto LABEL_20;
        }
        uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v23 = [obj media];
        v24 = [v23 objectID];
        [v21 addObserver:self selector:sel_mediaDidLoadNotification_ name:v11 object:v24];
      }
LABEL_20:
      v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v22 addObserver:self selector:sel_applicationDidBecomeActive name:*MEMORY[0x1E4FB2628] object:0];

      uint64_t v5 = [(ICAttachmentBrickView *)self reloadData];
    }
  }
  MEMORY[0x1F41817F8](v5);
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  id v5 = a3;
  id v7 = [v5 normalRegex];

  double v6 = [(ICAttachmentBrickView *)self linkView];
  [v6 _setEmphasizedTextExpression:v7];
}

- (void)setShareExtensionAttachmentInfo:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_shareExtensionAttachmentInfo, v4);
  id v5 = [v4 attachment];

  if (v5)
  {
    double v6 = [v4 attachment];
    [(ICAttachmentBrickView *)self setAttachment:v6];
  }
  else
  {
    double v6 = [v4 mediaURL];
    objc_initWeak(&location, self);
    uint64_t v15 = 0;
    int v16 = &v15;
    uint64_t v17 = 0x2050000000;
    id v7 = (void *)getLPMetadataProviderClass_softClass_2;
    uint64_t v18 = getLPMetadataProviderClass_softClass_2;
    if (!getLPMetadataProviderClass_softClass_2)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __getLPMetadataProviderClass_block_invoke_2;
      v14[3] = &unk_1E5FD95C0;
      v14[4] = &v15;
      __getLPMetadataProviderClass_block_invoke_2((uint64_t)v14);
      id v7 = (void *)v16[3];
    }
    double v8 = v7;
    _Block_object_dispose(&v15, 8);
    id v9 = objc_alloc_init(v8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__ICAttachmentBrickView_setShareExtensionAttachmentInfo___block_invoke;
    v11[3] = &unk_1E5FDE1F0;
    objc_copyWeak(&v12, &location);
    [v9 startFetchingMetadataForURL:v6 completionHandler:v11];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

  uint64_t v10 = [(ICAttachmentBrickView *)self linkView];
  [v10 _setDisablePlayback:1];
}

void __57__ICAttachmentBrickView_setShareExtensionAttachmentInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v5;
  performBlockOnMainThread();

  objc_destroyWeak(&v8);
}

void __57__ICAttachmentBrickView_setShareExtensionAttachmentInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = [WeakRetained linkView];
  [v3 setMetadata:v2];

  [WeakRetained notifyClientsAboutSizeChangesIfNecessary];
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
  [(ICAttachmentBrickView *)self adjustSizeIfNecessary];
}

- (void)reloadData
{
  double v3 = [(ICAttachmentBrickView *)self attachment];

  if (!v3) {
    return;
  }
  id v4 = [(ICAttachmentBrickView *)self attachment];
  int v5 = [v4 hasSynapseLink];

  if (!v5)
  {
    id v6 = [(ICAttachmentBrickView *)self attachment];
    id v7 = [v6 URL];
    int v8 = objc_msgSend(v7, "ic_isWebURL");

    if (v8)
    {
      [(ICAttachmentBrickView *)self displayRemoteAttachmentPreview];
      goto LABEL_15;
    }
    id v9 = [(ICAttachmentBrickView *)self attachment];
    uint64_t v10 = [v9 URL];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = [(ICAttachmentBrickView *)self attachment];
      int v13 = [v12 URL];
      char v14 = objc_msgSend(v13, "ic_isWebURL");

      if ((v14 & 1) == 0)
      {
        [(ICAttachmentBrickView *)self displayGenericURLPreview];
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v15 = [(ICAttachmentBrickView *)self attachment];
    if ([v15 attachmentType] == 11)
    {

LABEL_14:
      [(ICAttachmentBrickView *)self displayScannedDocumentsPreview];
      goto LABEL_15;
    }
    int v16 = [(ICAttachmentBrickView *)self attachment];
    int v17 = [v16 attachmentType];

    if (v17 == 15) {
      goto LABEL_14;
    }
    uint64_t v18 = [(ICAttachmentBrickView *)self attachment];
    if ([v18 isPasswordProtected])
    {
    }
    else
    {
      v19 = [(ICAttachmentBrickView *)self attachment];
      int v20 = [v19 hasFallbackPDF];

      if (v20) {
        goto LABEL_25;
      }
    }
    uint64_t v21 = [(ICAttachmentBrickView *)self attachment];
    int v22 = [v21 attachmentType];

    if (v22 == 1)
    {
      [(ICAttachmentBrickView *)self displayUnsupportedAttachmentPreview];
      goto LABEL_15;
    }
    v23 = [(ICAttachmentBrickView *)self attachment];
    int v24 = [v23 isLoadingFromCloud];

    if (v24)
    {
      v25 = [(ICAttachmentBrickView *)self linkView];
      v26 = [(ICAttachmentBrickView *)self attachment];
      v27 = [v26 loadingAttachmentsMetadata];
      [v25 _setMetadata:v27 isFinal:0];

      goto LABEL_15;
    }
LABEL_25:
    [(ICAttachmentBrickView *)self displayFilePreview];
    goto LABEL_15;
  }
  [(ICAttachmentBrickView *)self displaySynapseAttachmentPreview];
LABEL_15:
  [(ICAttachmentBrickView *)self adjustSizeIfNecessary];
  [(ICAttachmentBrickView *)self updateAttachmentBackgroundColorIfNecessary];
}

- (void)updateTitle
{
  double v3 = [(ICAttachmentBrickView *)self linkView];
  id v4 = [v3 metadata];

  int v5 = [(ICAttachmentBrickView *)self attachment];
  id v6 = [v5 title];

  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(ICAttachmentBrickView *)self attachment];
    int v8 = [v7 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__ICAttachmentBrickView_updateTitle__block_invoke;
    v9[3] = &unk_1E5FDE218;
    objc_copyWeak(&v12, &location);
    id v10 = v4;
    id v11 = v5;
    [v8 performBlock:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __36__ICAttachmentBrickView_updateTitle__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v2 = [a1[5] title];
  [a1[4] setTitle:v2];

  objc_opt_class();
  double v3 = [a1[4] specialization];
  id v4 = ICDynamicCast();

  if (v4)
  {
    int v5 = [a1[5] title];
    [v4 setName:v5];

    [a1[4] setSpecialization:v4];
  }
  [WeakRetained updateUIWithMetadata:a1[4]];
}

- (void)prepareForReuse
{
  [(ICAttachmentBrickView *)self setSelected:0];
  [(ICAttachmentBrickView *)self setHighlightColor:0];
  [(ICAttachmentBrickView *)self setHighlightPatternRegexFinder:0];
  [(ICAttachmentBrickView *)self setAttachment:0];
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
  id v5 = a3;
  if (v5) {
    double v6 = 2.0;
  }
  else {
    double v6 = 0.0;
  }
  id v7 = [(ICAttachmentBrickView *)self linkView];
  int v8 = [v7 layer];
  [v8 setBorderWidth:v6];

  id v9 = v5;
  uint64_t v10 = [v9 CGColor];

  id v12 = [(ICAttachmentBrickView *)self linkView];
  id v11 = [v12 layer];
  [v11 setBorderColor:v10];
}

- (double)effectiveLayoutCornerRadius
{
  uint64_t v2 = [(ICAttachmentBrickView *)self linkView];
  [v2 _cornerRadius];
  double v4 = v3;

  return v4;
}

- (CGSize)computedSize
{
  double v3 = [(ICAttachmentBrickView *)self linkView];
  [(ICAttachmentBrickView *)self frame];
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(v13), 800.0);
  double v5 = v4;

  double v6 = [(ICAttachmentBrickView *)self linkView];
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v8 = v7;

  if (v5 >= v8) {
    double v9 = v5;
  }
  else {
    double v9 = v8;
  }
  double v10 = 72.0;
  if (v9 >= 72.0) {
    double v10 = v9;
  }
  double v11 = 327.0;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)updateAttachmentBackgroundColorIfNecessary
{
  if ((objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision") & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F09A4010];
    double v3 = NSNumber;
    double v4 = [(ICAttachmentBrickView *)self attachment];
    double v5 = objc_msgSend(v3, "numberWithShort:", objc_msgSend(v4, "attachmentType"));
    char v6 = [v8 containsObject:v5];

    if (v6)
    {
      double v7 = [(id)objc_opt_class() standardBackgroundColor];
      [(LPLinkView *)self->_linkView _setOverrideBackgroundColor:v7];
    }
    else
    {
      [(LPLinkView *)self->_linkView _setOverrideBackgroundColor:0];
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selected = a3;
  [(ICAttachmentBrickView *)self updateSearchResultBackgroundColorIfNecessary];
  if (v3)
  {
    id v6 = [MEMORY[0x1E4FB1618] ICSelectedAttachmentBrickHighlightColor];
  }
  else
  {
    id v6 = 0;
  }
  double v5 = [(ICAttachmentBrickView *)self linkView];
  [v5 setTintColor:v6];

  if (v3)
  {
  }
}

- (id)quickLookTransitionView
{
  uint64_t v2 = [(ICAttachmentBrickView *)self linkView];
  BOOL v3 = [v2 _primaryMediaView];

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentBrickView;
  [(ICAttachmentBrickView *)&v3 layoutSubviews];
  [(ICAttachmentBrickView *)self setHasPerformedInitialLayout:1];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(ICAttachmentBrickView *)self typeDescriptionForAccessibility];
  double v4 = [(ICAttachmentBrickView *)self linkView];
  double v5 = [v4 accessibilityLabel];
  id v12 = __ICAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  return v12;
}

- (id)accessibilityValue
{
  uint64_t v2 = [(ICAttachmentBrickView *)self linkView];
  objc_super v3 = [v2 accessibilityValue];

  return v3;
}

- (id)typeDescriptionForAccessibility
{
  objc_super v3 = [(ICAttachmentBrickView *)self attachment];
  int v4 = [v3 attachmentType];

  switch(v4)
  {
    case 0:
    case 1:
      uint64_t v7 = (void *)MEMORY[0x1E4F83770];
      uint64_t v8 = @"attachment";
      goto LABEL_14;
    case 2:
      uint64_t v7 = (void *)MEMORY[0x1E4F83770];
      uint64_t v8 = @"file attachment";
      goto LABEL_14;
    case 3:
    case 5:
    case 9:
    case 10:
    case 12:
    case 13:
      double v5 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ICAttachmentBrickView typeDescriptionForAccessibility](v5);
      }

      uint64_t v6 = &stru_1F0973378;
      goto LABEL_15;
    case 4:
      uint64_t v7 = (void *)MEMORY[0x1E4F83770];
      uint64_t v8 = @"audio attachment";
      goto LABEL_14;
    case 6:
    case 14:
      uint64_t v7 = (void *)MEMORY[0x1E4F83770];
      uint64_t v8 = @"PDF attachment";
      goto LABEL_14;
    case 7:
      uint64_t v7 = (void *)MEMORY[0x1E4F83770];
      uint64_t v8 = @"map attachment";
      goto LABEL_14;
    case 8:
      uint64_t v9 = [(ICAttachmentBrickView *)self attachment];
      int v10 = [v9 isAppStore];

      if (v10)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F83770];
        uint64_t v8 = @"app attachment";
LABEL_14:
        uint64_t v6 = [v7 localizedFrameworkStringForKey:v8 value:v8 table:0 allowSiri:1];
        goto LABEL_15;
      }
      id v12 = [(ICAttachmentBrickView *)self attachment];
      int v13 = [v12 isiTunes];

      if (!v13)
      {
        uint64_t v18 = [(ICAttachmentBrickView *)self attachment];
        int v19 = [v18 isNews];

        uint64_t v7 = (void *)MEMORY[0x1E4F83770];
        if (v19) {
          uint64_t v8 = @"news article attachment";
        }
        else {
          uint64_t v8 = @"website attachment";
        }
        goto LABEL_14;
      }
      uint64_t v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"iTunes media attachment" value:@"iTunes media attachment" table:0 allowSiri:1];
      char v14 = [(ICAttachmentBrickView *)self attachment];
      uint64_t v15 = [v14 metadata];

      if (v15)
      {
        int v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F83018]];

        if (v16)
        {
          uint64_t v17 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"book attachment" value:@"book attachment" table:0 allowSiri:1];

          uint64_t v6 = (__CFString *)v17;
        }
      }

LABEL_15:
      return v6;
    case 11:
    case 15:
      uint64_t v7 = (void *)MEMORY[0x1E4F83770];
      uint64_t v8 = @"scanned document attachment";
      goto LABEL_14;
    default:
      uint64_t v6 = 0;
      goto LABEL_15;
  }
}

- (id)_linkView:(id)a3 contextMenuConfigurationForSuggestedConfiguration:(id)a4
{
  return 0;
}

- (void)linkViewNeedsResize:(id)a3
{
  if ([(ICAttachmentBrickView *)self type] == 2)
  {
    [(ICAttachmentBrickView *)self notifyClientsAboutSizeChangesIfNecessary];
  }
}

- (void)linkView:(id)a3 didFetchMetadata:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(ICAttachmentBrickView *)self attachment];
  [v6 persistLinkMetadata:v5];

  if ([(ICAttachmentBrickView *)self type] == 2)
  {
    [(ICAttachmentBrickView *)self notifyClientsAboutSizeChangesIfNecessary];
  }
}

- (void)attachmentDidLoadNotification:(id)a3
{
  if (![(ICAttachmentBrickView *)self isMetadataComplete])
  {
    [(ICAttachmentBrickView *)self reloadData];
  }
}

- (void)attachmentPreviewImagesDidUpdateNotification:(id)a3
{
  BOOL v5 = [(ICAttachmentBrickView *)self isMetadataComplete];
  if (!v5)
  {
    objc_super v3 = [(ICAttachmentBrickView *)self attachment];
    if (![v3 hasSynapseLink])
    {
LABEL_5:

LABEL_9:
      uint64_t v9 = [(ICAttachmentBrickView *)self linkView];
      int v10 = [v9 metadata];
      uint64_t v11 = [v10 image];
      if (v11)
      {

        [(ICAttachmentBrickView *)self reloadData];
      }
      else
      {
        id v12 = [(ICAttachmentBrickView *)self attachment];
        int v13 = [v12 metadataExists];

        [(ICAttachmentBrickView *)self reloadData];
        if (v13 && [(ICAttachmentBrickView *)self type] == 2)
        {
          [(ICAttachmentBrickView *)self notifyClientsAboutSizeChangesIfNecessary];
        }
      }
      return;
    }
  }
  uint64_t v6 = [(ICAttachmentBrickView *)self attachment];
  if ([v6 attachmentType] == 11)
  {

    if (v5) {
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  uint64_t v7 = [(ICAttachmentBrickView *)self attachment];
  int v8 = [v7 attachmentType];

  if (!v5) {
  if (v8 == 15)
  }
    goto LABEL_9;
}

- (void)initialAttachmentPreviewDidLoad:(id)a3
{
  [(ICAttachmentBrickView *)self reloadData];
  if ([(ICAttachmentBrickView *)self type] == 2)
  {
    [(ICAttachmentBrickView *)self notifyClientsAboutSizeChangesIfNecessary];
  }
}

- (void)mediaDidLoadNotification:(id)a3
{
}

uint64_t __50__ICAttachmentBrickView_mediaDidLoadNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (void)didFailFetchingMetadataNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  performBlockOnMainThread();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__ICAttachmentBrickView_didFailFetchingMetadataNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained linkView];
  uint64_t v2 = [v1 metadata];

  [WeakRetained setWaitingForMetadata:0];
  objc_super v3 = [WeakRetained linkView];
  [v3 _setMetadata:v2 isFinal:1];
}

- (void)applicationDidBecomeActive
{
  objc_super v3 = [(ICAttachmentBrickView *)self attachment];
  int v4 = [v3 preferredViewSize];

  id v5 = [(ICAttachmentBrickView *)self attachment];
  uint64_t v6 = [v5 URL];
  int v7 = objc_msgSend(v6, "ic_isBooksURL");

  if (v7 && !v4)
  {
    [(ICAttachmentBrickView *)self reloadData];
  }
}

- (void)play
{
  objc_super v3 = [(ICAttachmentBrickView *)self attachment];
  int v4 = [v3 isAudio];

  if (v4)
  {
    id v8 = +[ICAudioController sharedAudioController];
    id v5 = [v8 currentAttachment];
    uint64_t v6 = [(ICAttachmentBrickView *)self attachment];

    if (v5 != v6) {
      [v8 stop];
    }
    int v7 = [(ICAttachmentBrickView *)self attachment];
    [v8 play:v7];
  }
}

- (void)pause
{
  uint64_t v2 = [(ICAttachmentBrickView *)self attachment];
  int v3 = [v2 isAudio];

  if (v3)
  {
    id v4 = +[ICAudioController sharedAudioController];
    [v4 pause];
  }
}

- (void)reset
{
  uint64_t v2 = [(ICAttachmentBrickView *)self attachment];
  int v3 = [v2 isAudio];

  if (v3)
  {
    id v4 = +[ICAudioController sharedAudioController];
    [v4 stop];
  }
}

- (void)addClient:(id)a3
{
  id v16 = a3;
  id v4 = [(ICAttachmentBrickView *)self attachment];
  int v5 = [v4 isAudio];

  if (v5)
  {
    uint64_t v6 = [(ICAttachmentBrickView *)self audioPlayerClients];

    if (!v6)
    {
      int v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      [(ICAttachmentBrickView *)self setAudioPlayerClients:v7];

      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v9 = [(ICAttachmentBrickView *)self attachment];
      [v8 addObserver:self selector:sel_progressChangedNotification_ name:@"ICAudioPlaybackTimeChangedNotification" object:v9];

      int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel_playbackStartedNotification_ name:@"ICAudioPlaybackPlayNotification" object:0];

      uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v12 = [(ICAttachmentBrickView *)self attachment];
      [v11 addObserver:self selector:sel_playbackPausedNotification_ name:@"ICAudioPlaybackPauseNotification" object:v12];

      int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      char v14 = [(ICAttachmentBrickView *)self attachment];
      [v13 addObserver:self selector:sel_playbackStoppedNotification_ name:@"ICAudioPlaybackStopNotification" object:v14];
    }
    uint64_t v15 = [(ICAttachmentBrickView *)self audioPlayerClients];
    [v15 addObject:v16];
  }
}

- (void)removeClient:(id)a3
{
  id v7 = a3;
  id v4 = [(ICAttachmentBrickView *)self attachment];
  int v5 = [v4 isAudio];

  if (v5)
  {
    uint64_t v6 = [(ICAttachmentBrickView *)self audioPlayerClients];
    [v6 removeObject:v7];
  }
}

- (id)_linkView:(id)a3 playerForAudio:(id)a4
{
  int v5 = [(ICAttachmentBrickView *)self attachment];
  int v6 = [v5 isAudio];

  if (v6) {
    id v7 = self;
  }
  else {
    id v7 = 0;
  }
  return v7;
}

- (void)playbackStartedNotification:(id)a3
{
  id v4 = [a3 object];
  int v5 = [(ICAttachmentBrickView *)self attachment];
  if (v4 == v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 4;
  }

  [(ICAttachmentBrickView *)self updateAudioClientsState:v6];
}

- (void)playbackPausedNotification:(id)a3
{
}

- (void)progressChangedNotification:(id)a3
{
  id v4 = a3;
  int v5 = [v4 userInfo];
  id v11 = [v5 objectForKeyedSubscript:@"ICAudioPlaybackNotificationTimeKey"];

  uint64_t v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:@"ICAudioPlaybackNotificationDurationKey"];

  [v11 floatValue];
  float v9 = v8;
  [v7 floatValue];
  if ((float)(v9 / v10) >= 1.0) {
    [(ICAttachmentBrickView *)self resetPlaybackProgressAndState];
  }
  else {
    -[ICAttachmentBrickView updateAudioClientsProgress:](self, "updateAudioClientsProgress:");
  }
}

- (void)resetPlaybackProgressAndState
{
  [(ICAttachmentBrickView *)self updateAudioClientsState:0];
  [(ICAttachmentBrickView *)self updateAudioClientsProgress:0.0];
}

- (void)updateAudioClientsState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = [(ICAttachmentBrickView *)self audioPlayerClients];
  uint64_t v6 = [v5 objectEnumerator];
  id v7 = [v6 allObjects];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) audioPlayer:self didTransitionToState:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(ICAttachmentBrickView *)self setPlayerState:a3];
}

- (void)updateAudioClientsProgress:(float)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = [(ICAttachmentBrickView *)self audioPlayerClients];
  uint64_t v6 = [v5 objectEnumerator];
  id v7 = [v6 allObjects];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        *(float *)&double v9 = a3;
        [*(id *)(*((void *)&v14 + 1) + 8 * v12++) audioPlayer:self didChangeProgress:v9];
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  *(float *)&double v13 = a3;
  [(ICAttachmentBrickView *)self setPlaybackProgress:v13];
}

- (void)displaySynapseAttachmentPreview
{
  int v3 = [(ICAttachmentBrickView *)self attachment];
  id v4 = [v3 synapseBasedMetadata];

  [(ICAttachmentBrickView *)self updateUIWithMetadata:v4];
}

- (void)displayRemoteAttachmentPreview
{
  int v3 = [(ICAttachmentBrickView *)self attachment];
  id v18 = [v3 retrieveLinkMetadata];

  if (v18)
  {
    [(ICAttachmentBrickView *)self setWaitingForMetadata:0];
    goto LABEL_9;
  }
  id v4 = [(ICAttachmentBrickView *)self attachment];
  char v5 = [v4 wasCreatedByCurrentUser];

  if (v5)
  {
    uint64_t v6 = [(ICAttachmentBrickView *)self shareExtensionAttachmentInfo];
    if (!v6)
    {
      if ([(ICAttachmentBrickView *)self waitingForMetadata])
      {
LABEL_8:
        [(ICAttachmentBrickView *)self setWaitingForMetadata:1];
        id v7 = [(ICAttachmentBrickView *)self attachment];
        id v18 = [v7 fallbackRemoteAttachmentMetadata];

LABEL_9:
        uint64_t v8 = [(ICAttachmentBrickView *)self attachment];
        [v8 addPreviewImageToMetadata:v18];

        if ([(ICAttachmentBrickView *)self waitingForMetadata])
        {
          double v9 = [(ICAttachmentBrickView *)self attachment];
          uint64_t v10 = [v9 urlExpired];

          uint64_t v11 = [(ICAttachmentBrickView *)self linkView];
          [v11 _setMetadata:v18 isFinal:v10];

          if ((v10 & 1) == 0) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v12 = [(ICAttachmentBrickView *)self linkView];
          [v12 _setMetadata:v18 isFinal:1];
        }
        [(ICAttachmentBrickView *)self notifyClientsAboutSizeChangesIfNecessary];
LABEL_14:
        double v13 = v18;
        goto LABEL_15;
      }
      uint64_t v6 = [(ICAttachmentBrickView *)self attachment];
      [v6 requestRemoteMetadata];
    }

    goto LABEL_8;
  }
  long long v14 = [(ICAttachmentBrickView *)self attachment];
  long long v15 = [v14 URL];
  long long v16 = [(ICAttachmentBrickView *)self linkView];
  [v16 setURL:v15];

  long long v17 = [(ICAttachmentBrickView *)self linkView];
  [v17 _setAllowsTapToLoad:1];

  double v13 = 0;
LABEL_15:
}

- (void)displayGenericURLPreview
{
  id v4 = [(ICAttachmentBrickView *)self attachment];
  int v3 = [v4 plainURLMetadata];
  [(ICAttachmentBrickView *)self updateUIWithMetadata:v3];
}

- (void)displayFilePreview
{
  int v3 = [(ICAttachmentBrickView *)self attachment];
  if ([v3 attachmentType] == 4)
  {
  }
  else
  {
    id v4 = [(ICAttachmentBrickView *)self attachment];
    int v5 = [v4 metadataExists];

    if (v5)
    {
      uint64_t v6 = [(ICAttachmentBrickView *)self attachment];
      uint64_t v7 = [v6 retrieveLinkMetadata];
      goto LABEL_6;
    }
  }
  uint64_t v6 = [(ICAttachmentBrickView *)self attachment];
  uint64_t v7 = [v6 fileMetadata];
LABEL_6:
  id v9 = (id)v7;

  [(ICAttachmentBrickView *)self updateUIWithMetadata:v9];
  uint64_t v8 = [(ICAttachmentBrickView *)self attachment];
  [v8 requestFileMetadataIfNecessary];
}

- (void)displayScannedDocumentsPreview
{
  id v4 = [(ICAttachmentBrickView *)self attachment];
  int v3 = [v4 scannedDocumentsMetadata];
  [(ICAttachmentBrickView *)self updateUIWithMetadata:v3];
}

- (void)displayUnsupportedAttachmentPreview
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2050000000;
  int v3 = (void *)getLPLinkMetadataClass_softClass_1;
  uint64_t v18 = getLPLinkMetadataClass_softClass_1;
  if (!getLPLinkMetadataClass_softClass_1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getLPLinkMetadataClass_block_invoke_1;
    v14[3] = &unk_1E5FD95C0;
    v14[4] = &v15;
    __getLPLinkMetadataClass_block_invoke_1((uint64_t)v14);
    int v3 = (void *)v16[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v15, 8);
  id v5 = objc_alloc_init(v4);
  uint64_t v6 = [(ICAttachmentBrickView *)self attachment];
  uint64_t v7 = [v6 unsupportedAttachmentTitle];
  [v5 setTitle:v7];

  uint64_t v8 = [(ICAttachmentBrickView *)self attachment];
  id v9 = [v8 unsupportedAttachmentSubtitle];
  [v5 setSummary:v9];

  uint64_t v10 = [(ICAttachmentBrickView *)self attachment];
  [v10 addPreviewImageToMetadata:v5];

  uint64_t v11 = [v5 image];

  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"paperclip"];
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v12];
    [v5 setImage:v13];
  }
  [(ICAttachmentBrickView *)self updateUIWithMetadata:v5];
}

- (void)updateUIWithMetadata:(id)a3
{
  id v4 = a3;
  if (ICInternalSettingsIsPDFsInNotesEnabled())
  {
    id v5 = [(ICAttachmentBrickView *)self attachment];
    if ([v5 attachmentType] != 6)
    {
      uint64_t v6 = [(ICAttachmentBrickView *)self attachment];
      if ([v6 attachmentType] != 14)
      {
        uint64_t v11 = [(ICAttachmentBrickView *)self attachment];
        int v12 = [v11 attachmentType];

        if (v12 != 15)
        {
          double v13 = [(ICAttachmentBrickView *)self attachment];
          int v14 = [v13 attachmentType];

          if (v14 != 11) {
            goto LABEL_8;
          }
          uint64_t v8 = [v4 title];
          id v9 = objc_msgSend(v8, "ic_truncatedStringWithMaxLength:truncated:", 30, 0);
          [v4 setTitle:v9];
          goto LABEL_7;
        }
LABEL_6:
        objc_opt_class();
        uint64_t v7 = [v4 specialization];
        uint64_t v8 = ICDynamicCast();

        id v9 = [v8 name];
        uint64_t v10 = objc_msgSend(v9, "ic_truncatedStringWithMaxLength:truncated:", 30, 0);
        [v8 setName:v10];

LABEL_7:
        goto LABEL_8;
      }
    }
    goto LABEL_6;
  }
LABEL_8:
  objc_initWeak(&location, self);
  objc_copyWeak(&v16, &location);
  id v15 = v4;
  performBlockOnMainThread();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __46__ICAttachmentBrickView_updateUIWithMetadata___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [WeakRetained linkView];
  [v3 setMetadata:v2];
}

- (void)adjustSizeIfNecessary
{
  int v3 = objc_opt_class();
  id v4 = [(ICAttachmentBrickView *)self attachment];
  id v5 = [(ICAttachmentBrickView *)self linkView];
  uint64_t v6 = [v5 metadata];
  LODWORD(v3) = objc_msgSend(v3, "usesSmallSizeForAttachment:withMetadata:type:insideSystemPaper:", v4, v6, -[ICAttachmentBrickView type](self, "type"), -[ICAttachmentBrickView isInsideSystemPaper](self, "isInsideSystemPaper"));

  if (v3) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 9;
  }
  uint64_t v8 = [(ICAttachmentBrickView *)self linkView];
  [v8 _setPreferredSizeClass:v7];

  [(ICAttachmentBrickView *)self effectiveLayoutCornerRadius];
  double v10 = v9;
  uint64_t v11 = [(ICAttachmentBrickView *)self layer];
  [v11 setCornerRadius:v10];

  [(ICAttachmentBrickView *)self effectiveLayoutCornerRadius];
  double v13 = v12;
  id v15 = [(ICAttachmentBrickView *)self linkView];
  int v14 = [v15 layer];
  [v14 setCornerRadius:v13];
}

- (void)notifyClientsAboutSizeChangesIfNecessary
{
  int v3 = [(ICAttachmentBrickView *)self window];

  if (v3)
  {
    id v4 = [(ICAttachmentBrickView *)self linkView];
    objc_msgSend(v4, "sizeThatFits:", 327.0, 800.0);
    double v6 = v5;

    if ([(ICAttachmentBrickView *)self hasPerformedInitialLayout])
    {
      if (v6 > 72.0)
      {
        uint64_t v7 = [(ICAttachmentBrickView *)self linkView];
        [v7 frame];
        double Height = CGRectGetHeight(v14);

        if (v6 != Height)
        {
          id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v9 = *MEMORY[0x1E4F82FF8];
          double v10 = [(ICAttachmentBrickView *)self attachment];
          uint64_t v11 = [v10 objectID];
          [v12 postNotificationName:v9 object:v11];
        }
      }
    }
  }
}

- (void)constrainViews
{
  v27[4] = *MEMORY[0x1E4F143B8];
  [(ICAttachmentBrickView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  int v3 = [(ICAttachmentBrickView *)self linkView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(ICAttachmentBrickView *)self linkView];
  double v5 = [v4 topAnchor];
  double v6 = [(ICAttachmentBrickView *)self topAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];

  uint64_t v8 = [(ICAttachmentBrickView *)self linkView];
  uint64_t v9 = [v8 bottomAnchor];
  double v10 = [(ICAttachmentBrickView *)self bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];

  id v12 = [(ICAttachmentBrickView *)self linkView];
  double v13 = [v12 leadingAnchor];
  CGRect v14 = [(ICAttachmentBrickView *)self leadingAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];

  id v16 = [(ICAttachmentBrickView *)self linkView];
  uint64_t v17 = [v16 trailingAnchor];
  uint64_t v18 = [(ICAttachmentBrickView *)self trailingAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18];

  int v20 = (void *)MEMORY[0x1E4F28DC8];
  v27[0] = v7;
  v27[1] = v11;
  v27[2] = v15;
  v27[3] = v19;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v20 activateConstraints:v21];

  if ([(ICAttachmentBrickView *)self type]
    && [(ICAttachmentBrickView *)self type] != 1
    && ![(ICAttachmentBrickView *)self isInsideSystemPaper])
  {
    if ([(ICAttachmentBrickView *)self type] == 3)
    {
      uint64_t v22 = -1;
    }
    else if ([(ICAttachmentBrickView *)self type] == 4)
    {
      uint64_t v22 = -1;
    }
    else
    {
      uint64_t v22 = 0;
    }
    v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:7 relatedBy:v22 toItem:0 attribute:0 multiplier:1.0 constant:327.0];
    [(ICAttachmentBrickView *)self setWidthConstraint:v23];

    int v24 = [(ICAttachmentBrickView *)self widthConstraint];
    [v24 setActive:1];
  }
  if ([(ICAttachmentBrickView *)self type] == 4 || [(ICAttachmentBrickView *)self type] == 1)
  {
    v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:72.0];
    [(ICAttachmentBrickView *)self setHeightConstraint:v25];

    v26 = [(ICAttachmentBrickView *)self heightConstraint];
    [v26 setActive:1];
  }
}

- (void)updateSearchResultBackgroundColorIfNecessary
{
  if ([(ICAttachmentBrickView *)self type] == 1)
  {
    int v3 = [(ICAttachmentBrickView *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if ([(ICAttachmentBrickView *)self selected])
    {
      uint64_t v5 = [MEMORY[0x1E4FB1618] ICTintColor];
    }
    else
    {
      if (v4 != 1)
      {
        id v7 = 0;
        goto LABEL_11;
      }
      uint64_t v5 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
    }
    id v7 = (id)v5;
LABEL_11:
    double v6 = [(ICAttachmentBrickView *)self linkView];
    [v6 _setOverrideBackgroundColor:v7];

    return;
  }
  [(ICAttachmentBrickView *)self updateAttachmentBackgroundColorIfNecessary];
}

- (void)registerForTraitChanges
{
  id v4 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
  id v3 = (id)[(ICAttachmentBrickView *)self registerForTraitChanges:v4 withAction:sel_updateSearchResultBackgroundColorIfNecessary];
}

- (BOOL)isMetadataComplete
{
  id v3 = [(ICAttachmentBrickView *)self linkView];
  id v4 = [v3 metadata];
  uint64_t v5 = [v4 image];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(ICAttachmentBrickView *)self linkView];
    uint64_t v8 = [v7 metadata];
    uint64_t v9 = [v8 icon];
    BOOL v6 = v9 != 0;
  }
  return v6;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);
  return (ICAttachment *)WeakRetained;
}

- (ICAddAttachmentsManagerAttachmentInfo)shareExtensionAttachmentInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareExtensionAttachmentInfo);
  return (ICAddAttachmentsManagerAttachmentInfo *)WeakRetained;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)isInsideSystemPaper
{
  return self->_insideSystemPaper;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSHashTable)audioPlayerClients
{
  return self->_audioPlayerClients;
}

- (void)setAudioPlayerClients:(id)a3
{
}

- (unint64_t)playerState
{
  return self->_playerState;
}

- (void)setPlayerState:(unint64_t)a3
{
  self->_playerState = a3;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (void)setPlaybackProgress:(float)a3
{
  self->_playbackProgress = a3;
}

- (BOOL)waitingForMetadata
{
  return self->_waitingForMetadata;
}

- (void)setWaitingForMetadata:(BOOL)a3
{
  self->_waitingForMetadata = a3;
}

- (BOOL)hasPerformedInitialLayout
{
  return self->_hasPerformedInitialLayout;
}

- (void)setHasPerformedInitialLayout:(BOOL)a3
{
  self->_hasPerformedInitialLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayerClients, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_destroyWeak((id *)&self->_shareExtensionAttachmentInfo);
  objc_destroyWeak((id *)&self->_attachment);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
}

- (void)typeDescriptionForAccessibility
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Wrong attachment type used for brick attachments", v1, 2u);
}

@end