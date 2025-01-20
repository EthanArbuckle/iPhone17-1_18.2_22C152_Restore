@interface ICSystemPaperTextAttachment
+ (BOOL)isEnabled;
- (BOOL)canDragWithoutSelecting;
- (CGRect)_paperBoundsHint;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (CGSize)_paperSizeHint;
- (ICDrawingHashtagsAndMentionsController)hashtagsAndMentionsController;
- (ICSelectorDelayer)paperChangeSelectorDelayer;
- (ICSystemPaperTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (ICSystemPaperTextAttachment)initWithPaperIdentifier:(id)a3;
- (NSHashTable)systemPaperViews;
- (NSString)_paperIdentifier;
- (NSString)paperIdentifierBeforeAttachmentIsSet;
- (NSURL)_encryptionDelegateCRContextURL;
- (NSURL)_nonEncryptedContentCRContextURL;
- (NSURL)_paperBundleURL;
- (UIView)cachedControlViewForPlaceView;
- (UIView)cachedDrawingViewForPlaceView;
- (id)_image;
- (id)attachmentAsNSTextAttachment;
- (id)attachmentViews;
- (id)contents;
- (id)fileType;
- (id)inlineViews;
- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5;
- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
- (void)_linkCanvasElementsDidChange;
- (void)_paperDidChangeLocally;
- (void)configureHashtagAndMentionsForView:(id)a3;
- (void)dealloc;
- (void)detachView:(id)a3 fromParentView:(id)a4;
- (void)paperDidChange;
- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7;
- (void)setCachedControlViewForPlaceView:(id)a3;
- (void)setCachedDrawingViewForPlaceView:(id)a3;
- (void)setHashtagsAndMentionsController:(id)a3;
- (void)setPaperChangeSelectorDelayer:(id)a3;
- (void)setPaperIdentifierBeforeAttachmentIsSet:(id)a3;
- (void)setSystemPaperViews:(id)a3;
- (void)updateAttachmentChangeCountAndSave:(id)a3;
@end

@implementation ICSystemPaperTextAttachment

+ (BOOL)isEnabled
{
  return 1;
}

- (void)dealloc
{
  [(ICSelectorDelayer *)self->_paperChangeSelectorDelayer cancelPreviousFireRequests];
  v3.receiver = self;
  v3.super_class = (Class)ICSystemPaperTextAttachment;
  [(ICSystemPaperTextAttachment *)&v3 dealloc];
}

- (ICSystemPaperTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v6;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F1C9B8] data];
  }
  v15.receiver = self;
  v15.super_class = (Class)ICSystemPaperTextAttachment;
  v9 = [(ICAbstractTextAttachment *)&v15 initWithData:v8 ofType:v7];
  v10 = v9;
  if (!v6)
  {

    if (!v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v9)
  {
LABEL_5:
    v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    paperIdentifierBeforeAttachmentIsSet = v10->_paperIdentifierBeforeAttachmentIsSet;
    v10->_paperIdentifierBeforeAttachmentIsSet = (NSString *)v12;
  }
LABEL_6:

  return v10;
}

- (ICDrawingHashtagsAndMentionsController)hashtagsAndMentionsController
{
  if (!self->_hashtagsAndMentionsController)
  {
    objc_super v3 = [(ICAbstractTextAttachment *)self attachment];

    if (v3)
    {
      v4 = [ICDrawingHashtagsAndMentionsController alloc];
      v5 = [(ICAbstractTextAttachment *)self attachment];
      id v6 = [(ICDrawingHashtagsAndMentionsController *)v4 initWithAttachment:v5];
      hashtagsAndMentionsController = self->_hashtagsAndMentionsController;
      self->_hashtagsAndMentionsController = v6;
    }
  }
  v8 = self->_hashtagsAndMentionsController;
  return v8;
}

- (id)fileType
{
  return (id)*MEMORY[0x1E4F38E80];
}

- (BOOL)canDragWithoutSelecting
{
  return 0;
}

- (id)contents
{
  return (id)[MEMORY[0x1E4F1C9B8] data];
}

- (NSHashTable)systemPaperViews
{
  systemPaperViews = self->_systemPaperViews;
  if (!systemPaperViews)
  {
    v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v5 = self->_systemPaperViews;
    self->_systemPaperViews = v4;

    systemPaperViews = self->_systemPaperViews;
  }
  return systemPaperViews;
}

- (id)attachmentAsNSTextAttachment
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  objc_super v3 = [v2 fallbackImageData];

  id v4 = objc_alloc(MEMORY[0x1E4FB0870]);
  v5 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
  id v6 = (void *)[v4 initWithData:v3 ofType:v5];

  id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v3);
  [v6 setImage:v7];

  return v6;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F83298], "appearanceInfoWithType:", 0, a4, a5);
  id v7 = (void *)MEMORY[0x1E4F832E8];
  v8 = [(ICAbstractTextAttachment *)self attachment];
  v9 = [v7 generateImageForAttachment:v8 fullResolution:1 appearanceInfo:v6];

  v10 = objc_msgSend(v9, "ic_PNGData");
  if (!v10)
  {
    v10 = [MEMORY[0x1E4F1C9B8] data];
  }
  v11 = [ICPrintableTextAttachment alloc];
  uint64_t v12 = [(id)*MEMORY[0x1E4F44460] identifier];
  v13 = [(ICPrintableTextAttachment *)v11 initWithData:v10 ofType:v12];

  v14 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v13];
  if ([v10 length])
  {
    objc_super v15 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v10);
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v20[0] = *MEMORY[0x1E4F1DAB8];
    v20[1] = v16;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v19[0] = v20[0];
    v19[1] = v16;
    v19[2] = v21;
    v17 = +[ICAttachmentPreviewImageLoader orientedImage:v15 withTransform:v20 background:1 backgroundTransform:v19];

    [(ICPrintableTextAttachment *)v13 setImage:v17];
  }

  return v14;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  v11.receiver = self;
  v11.super_class = (Class)ICSystemPaperTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v11, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  v34.receiver = self;
  v34.super_class = (Class)ICSystemPaperTextAttachment;
  id v14 = a3;
  -[ICBaseTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v34, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, v14, a6, v12, v11, width, height, x, y);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = objc_msgSend(v14, "layoutManager", v34.receiver, v34.super_class);

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v25 = [(ICAbstractTextAttachment *)self attachment];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;

    double v22 = width / (v27 / v29);
    double v16 = 0.0;
    double v18 = 0.0;
    double v20 = width;
  }
  double v30 = v16;
  double v31 = v18;
  double v32 = v20;
  double v33 = v22;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (id)_image
{
  return 0;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v30.receiver = self;
    v30.super_class = (Class)ICSystemPaperTextAttachment;
    double v11 = [(ICSystemPaperTextAttachment *)&v30 viewProviderForParentView:v8 location:v9 textContainer:v10];
    double v12 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
    v13 = [v11 view];
    char v14 = [v12 containsObject:v13];

    if ((v14 & 1) == 0)
    {
      double v15 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
      double v16 = [v11 view];
      [v15 addObject:v16];

      objc_initWeak(&location, self);
      double v17 = [v11 view];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      double v26 = __80__ICSystemPaperTextAttachment_viewProviderForParentView_location_textContainer___block_invoke;
      double v27 = &unk_1E5FD97A8;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v17, "ic_addDidMoveToWindowHandler:", &v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    double v18 = objc_msgSend(v8, "window", v24, v25, v26, v27);

    if (v18)
    {
      double v19 = [v8 window];
      double v20 = +[ICInkPaletteController sharedToolPickerForWindow:v19];

      uint64_t v21 = [v20 isVisible];
      double v22 = [v11 view];
      [v20 setVisible:v21 forFirstResponder:v22];
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

void __80__ICSystemPaperTextAttachment_viewProviderForParentView_location_textContainer___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained configureHashtagAndMentionsForView:v3];
}

- (void)configureHashtagAndMentionsForView:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = objc_msgSend(v4, "tiledViewAttachmentViews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v11 = [(ICAbstractTextAttachment *)self attachment];
        objc_msgSend(v10, "setWantsMentionDetection:", objc_msgSend(v11, "isSharedViaICloud"));

        double v12 = [(ICAbstractTextAttachment *)self attachment];
        v13 = [v12 note];
        objc_msgSend(v10, "setWantsHashtagDetection:", objc_msgSend(v13, "isPasswordProtected") ^ 1);

        char v14 = [v4 window];
        if (v14)
        {
          double v15 = [(ICSystemPaperTextAttachment *)self hashtagsAndMentionsController];
          [v10 setHashtagAndMentionsDelegate:v15];
        }
        else
        {
          [v10 setHashtagAndMentionsDelegate:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  double v16 = [v4 window];

  double v17 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  double v18 = v17;
  if (v16)
  {
    char v19 = [v17 containsObject:v4];

    if ((v19 & 1) == 0) {
      [(ICInlineCanvasTextAttachment *)self updatePaletteVisibility];
    }
    double v20 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
    [v20 addObject:v4];

    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v22 = v21;
    v23 = @"ICSystemPaperTextAttachmentDidAppearNotification";
  }
  else
  {
    [v17 removeObject:v4];

    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v22 = v21;
    v23 = @"ICSystemPaperTextAttachmentWillDisappearNotification";
  }
  [v21 postNotificationName:v23 object:v4];
}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)ICSystemPaperTextAttachment;
    id v10 = [(ICSystemPaperTextAttachment *)&v17 viewProviderForParentView:v8 characterIndex:a4 layoutManager:v9];
    double v12 = [v8 window];

    if (v12)
    {
      v13 = [v8 window];
      char v14 = +[ICInkPaletteController sharedToolPickerForWindow:v13];

      uint64_t v15 = [v14 isVisible];
      double v16 = [v10 view];
      [v14 setVisible:v15 forFirstResponder:v16];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  [(ICSystemPaperTextAttachment *)self setCachedDrawingViewForPlaceView:v15];
  [(ICSystemPaperTextAttachment *)self setCachedControlViewForPlaceView:v16];
  double v18 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  char v19 = [v18 containsObject:v15];

  double v20 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  [v20 addObject:v15];

  v41.receiver = self;
  v41.super_class = (Class)ICSystemPaperTextAttachment;
  v35 = v17;
  v36 = v16;
  -[ICSystemPaperTextAttachment placeView:withFrame:inParentView:characterIndex:layoutManager:](&v41, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v15, v16, a6, v17, x, y, width, height);
  if ((v19 & 1) == 0) {
    [(ICInlineCanvasTextAttachment *)self updatePaletteVisibility];
  }
  uint64_t v21 = ICProtocolCast();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v22 = [v21 tiledViewAttachmentViews];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v28 = [v27 hashtagAndMentionsDelegate];
        uint64_t v29 = [(ICSystemPaperTextAttachment *)self hashtagsAndMentionsController];

        if (v28 != v29)
        {
          objc_super v30 = [(ICAbstractTextAttachment *)self attachment];
          objc_msgSend(v27, "setWantsMentionDetection:", objc_msgSend(v30, "isSharedViaICloud"));

          double v31 = [(ICAbstractTextAttachment *)self attachment];
          double v32 = [v31 note];
          objc_msgSend(v27, "setWantsHashtagDetection:", objc_msgSend(v32, "isPasswordProtected") ^ 1);

          double v33 = [(ICSystemPaperTextAttachment *)self hashtagsAndMentionsController];
          [v27 setHashtagAndMentionsDelegate:v33];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v24);
  }

  [(ICSystemPaperTextAttachment *)self setCachedDrawingViewForPlaceView:0];
  [(ICSystemPaperTextAttachment *)self setCachedControlViewForPlaceView:0];
  objc_super v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v34 postNotificationName:@"ICSystemPaperTextAttachmentDidAppearNotification" object:v15];
}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"ICSystemPaperTextAttachmentWillDisappearNotification" object:v6];

  if (IsTextKit2Enabled)
  {
    v26.receiver = self;
    v26.super_class = (Class)ICSystemPaperTextAttachment;
    [(ICBaseTextAttachment *)&v26 detachView:v6 fromParentView:v7];
    id v10 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
    [v10 removeObject:v6];

    p_paperChangeSelectorDelayer = &self->_paperChangeSelectorDelayer;
    if (([(ICSelectorDelayer *)*p_paperChangeSelectorDelayer isScheduledToFire] & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v25.receiver = self;
  v25.super_class = (Class)ICSystemPaperTextAttachment;
  [(ICBaseTextAttachment *)&v25 detachView:v6 fromParentView:v7];
  double v12 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  [v12 removeObject:v6];

  id v13 = [(ICSystemPaperTextAttachment *)self cachedDrawingViewForPlaceView];
  if (v13 == v6)
  {
    id v14 = [(ICSystemPaperTextAttachment *)self cachedControlViewForPlaceView];

    if (v14 == v7) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v15 = ICProtocolCast();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = objc_msgSend(v15, "tiledViewAttachmentViews", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v20++) setHashtagAndMentionsDelegate:0];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v18);
  }

LABEL_15:
  p_paperChangeSelectorDelayer = &self->_paperChangeSelectorDelayer;
  if ([(ICSelectorDelayer *)*p_paperChangeSelectorDelayer isScheduledToFire]) {
LABEL_16:
  }
    [(ICSelectorDelayer *)*p_paperChangeSelectorDelayer fireImmediately];
LABEL_17:
}

- (id)inlineViews
{
  v2 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  id v3 = [v2 allObjects];

  return v3;
}

- (id)attachmentViews
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  id v6 = [(ICSystemPaperTextAttachment *)self systemPaperViews];
  id v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = ICProtocolCast();
        id v13 = [v12 topLevelAttachmentView];
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v14 = (void *)[v5 copy];
  return v14;
}

- (ICSelectorDelayer)paperChangeSelectorDelayer
{
  paperChangeSelectorDelayer = self->_paperChangeSelectorDelayer;
  if (!paperChangeSelectorDelayer)
  {
    id v4 = (ICSelectorDelayer *)[objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:self selector:sel_paperDidChange delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:2.5];
    v5 = self->_paperChangeSelectorDelayer;
    self->_paperChangeSelectorDelayer = v4;

    paperChangeSelectorDelayer = self->_paperChangeSelectorDelayer;
  }
  return paperChangeSelectorDelayer;
}

- (void)paperDidChange
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Received debounced paperDidChange for drawing %@", v4, v5, v6, v7, 2u);
}

uint64_t __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasPaperForm:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setDidRunPaperFormDetection:0];
}

void __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke_3;
  v5[3] = &unk_1E5FD91D0;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 performBlockAndWait:v5];
}

uint64_t __45__ICSystemPaperTextAttachment_paperDidChange__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAttachmentChangeCountAndSave:*(void *)(a1 + 40)];
}

- (void)updateAttachmentChangeCountAndSave:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 note];
  [v4 updateModificationDateAndChangeCount];

  uint64_t v5 = [v3 note];
  int v6 = [v5 regenerateTitle:1 snippet:1];

  if (v6)
  {
    uint64_t v7 = [v3 note];
    [v7 markShareDirtyIfNeededWithReason:@"Updated title after paper change"];

    uint64_t v8 = [v3 note];
    [v8 updateChangeCountWithReason:@"Updated title after paper change"];
  }
  [v3 updateChangeCountWithReason:@"Paper changed"];
  [v3 setPreviewUpdateDate:0];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setModificationDate:v9];

  uint64_t v10 = [v3 managedObjectContext];
  objc_msgSend(v10, "ic_save");

  double v11 = +[ICAttachmentPreviewGenerator sharedGenerator];
  [v11 generatePreviewIfNeededForAttachment:v3];

  double v12 = [MEMORY[0x1E4F83428] sharedContext];
  id v13 = [v12 workerManagedObjectContext];

  id v14 = +[ICPaperSearchIndexer shared];
  id v15 = [v3 objectID];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke;
  v17[3] = &unk_1E5FD8DF0;
  id v18 = v13;
  id v16 = v13;
  [v14 updateIndexForAttachment:v15 userInitiated:1 managedObjectContext:v16 completionHandler:v17];
}

void __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke_2;
  v2[3] = &unk_1E5FD8DF0;
  id v3 = v1;
  [v3 performBlock:v2];
}

uint64_t __66__ICSystemPaperTextAttachment_updateAttachmentChangeCountAndSave___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", @"Updated index from paperDidChange");
}

- (void)setSystemPaperViews:(id)a3
{
}

- (NSString)paperIdentifierBeforeAttachmentIsSet
{
  return self->_paperIdentifierBeforeAttachmentIsSet;
}

- (void)setPaperIdentifierBeforeAttachmentIsSet:(id)a3
{
}

- (void)setHashtagsAndMentionsController:(id)a3
{
}

- (UIView)cachedDrawingViewForPlaceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedDrawingViewForPlaceView);
  return (UIView *)WeakRetained;
}

- (void)setCachedDrawingViewForPlaceView:(id)a3
{
}

- (UIView)cachedControlViewForPlaceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedControlViewForPlaceView);
  return (UIView *)WeakRetained;
}

- (void)setCachedControlViewForPlaceView:(id)a3
{
}

- (void)setPaperChangeSelectorDelayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paperChangeSelectorDelayer, 0);
  objc_destroyWeak((id *)&self->_cachedControlViewForPlaceView);
  objc_destroyWeak((id *)&self->_cachedDrawingViewForPlaceView);
  objc_storeStrong((id *)&self->_hashtagsAndMentionsController, 0);
  objc_storeStrong((id *)&self->_paperIdentifierBeforeAttachmentIsSet, 0);
  objc_storeStrong((id *)&self->_systemPaperViews, 0);
}

- (ICSystemPaperTextAttachment)initWithPaperIdentifier:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F1C9B8] data];
  uint64_t v7 = *MEMORY[0x1E4F38E80];
  v10.receiver = self;
  v10.super_class = (Class)ICSystemPaperTextAttachment;
  uint64_t v8 = [(ICAbstractTextAttachment *)&v10 initWithData:v6 ofType:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_paperIdentifierBeforeAttachmentIsSet, a3);
  }

  return v8;
}

- (NSURL)_paperBundleURL
{
  objc_opt_class();
  id v3 = [(ICAbstractTextAttachment *)self attachment];
  uint64_t v4 = [v3 attachmentModel];
  id v5 = ICDynamicCast();

  if (v5)
  {
    int v6 = [v5 paperBundleURL];
  }
  else
  {
    uint64_t v7 = [(ICAbstractTextAttachment *)self attachment];
    uint64_t v8 = [v7 cloudAccount];
    uint64_t v9 = [v8 temporaryDirectoryURL];
    objc_super v10 = [MEMORY[0x1E4F29128] UUID];
    double v11 = [v10 UUIDString];
    int v6 = [v9 URLByAppendingPathComponent:v11 isDirectory:1];
  }
  return (NSURL *)v6;
}

- (NSURL)_nonEncryptedContentCRContextURL
{
  id v3 = [(ICAbstractTextAttachment *)self attachment];
  char v4 = [v3 isPasswordProtected];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    int v6 = [(ICAbstractTextAttachment *)self attachment];
    id v5 = [v6 paperCoherenceContextURL];
  }
  return (NSURL *)v5;
}

- (NSURL)_encryptionDelegateCRContextURL
{
  id v3 = [(ICAbstractTextAttachment *)self attachment];
  int v4 = [v3 isPasswordProtected];

  if (v4)
  {
    id v5 = [(ICAbstractTextAttachment *)self attachment];
    int v6 = [v5 paperCoherenceContextURL];
  }
  else
  {
    int v6 = 0;
  }
  return (NSURL *)v6;
}

- (NSString)_paperIdentifier
{
  id v3 = [(ICAbstractTextAttachment *)self attachment];

  if (v3)
  {
    int v4 = [(ICAbstractTextAttachment *)self attachment];
    id v5 = [v4 identifier];
  }
  else
  {
    id v5 = [(ICSystemPaperTextAttachment *)self paperIdentifierBeforeAttachmentIsSet];
  }
  return (NSString *)v5;
}

- (void)_linkCanvasElementsDidChange
{
  id v5 = [(ICAbstractTextAttachment *)self attachment];
  id v3 = [v5 modificationDate];
  int v4 = [(ICAbstractTextAttachment *)self attachment];
  [v4 setModificationDate:v3];
}

- (CGSize)_paperSizeHint
{
  id v3 = [(ICAbstractTextAttachment *)self attachment];
  [v3 sizeWidth];
  double v5 = v4;
  int v6 = [(ICAbstractTextAttachment *)self attachment];
  [v6 sizeHeight];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGRect)_paperBoundsHint
{
  objc_opt_class();
  id v3 = [(ICAbstractTextAttachment *)self attachment];
  double v4 = [v3 attachmentModel];
  double v5 = ICDynamicCast();

  if (v5)
  {
    [v5 paperContentBoundsHint];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_paperDidChangeLocally
{
  id v3 = [(ICSystemPaperTextAttachment *)self paperChangeSelectorDelayer];
  [v3 cancelPreviousFireRequests];

  id v4 = [(ICSystemPaperTextAttachment *)self paperChangeSelectorDelayer];
  [v4 requestFire];
}

@end