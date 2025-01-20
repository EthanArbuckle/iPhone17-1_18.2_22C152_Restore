@interface ICTK2TextView
+ (void)initialize;
+ (void)swizzleLayoutFragmentPointInside;
+ (void)swizzleTextLayoutCanvasViewTextViewportLayoutControllerDidLayoutTextViewportElement;
- (CGPoint)scrollOffsetForRange:(_NSRange)a3 withHeightPercentageAdjustment:(double)a4;
- (ICAttributionSidebarView)attributionSidebarView;
- (ICNote)note;
- (ICOutlineRenderer)outlineRenderer;
- (ICTK2TextController)tk2TextController;
- (ICTK2TextLayoutManagerDelegate)textLayoutManagerDelegate;
- (ICTK2TextView)initWithNote:(id)a3 size:(CGSize)a4 insideSystemPaper:(BOOL)a5 linkDelegate:(id)a6 insideSiriSnippet:(BOOL)a7;
- (ICTTTextContentStorage)textContentStorage;
- (ICTextContentStorageDelegate)textContentStorageDelegate;
- (NSLayoutConstraint)attributionSidebarLeadingConstraint;
- (NSLayoutConstraint)attributionSidebarWidthConstraint;
- (NSLayoutManager)layoutManager;
- (id)attachmentViewDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)renderingAttributesProvider;
- (id)textStorage;
- (int64_t)hoveredCharacterIndex;
- (void)dealloc;
- (void)handleHover:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollRangeToVisible:(_NSRange)a3;
- (void)scrollRangeToVisible:(_NSRange)a3 withHeightPercentageAdjustment:(double)a4 forceTop:(BOOL)a5;
- (void)setAttachmentViewDelegate:(id)a3;
- (void)setAttributionSidebarLeadingConstraint:(id)a3;
- (void)setAttributionSidebarView:(id)a3;
- (void)setAttributionSidebarWidthConstraint:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHoveredCharacterIndex:(int64_t)a3;
- (void)setOutlineRenderer:(id)a3;
- (void)setRenderingAttributesProvider:(id)a3;
- (void)setTextContentStorageDelegate:(id)a3;
- (void)setTextLayoutManagerDelegate:(id)a3;
- (void)textViewportLayoutControllerDidLayout:(id)a3;
@end

@implementation ICTK2TextView

- (id)textStorage
{
  v2 = [(ICTK2TextView *)self textContentStorage];
  v3 = [v2 textStorage];

  return v3;
}

- (ICTTTextContentStorage)textContentStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContentStorage);

  return (ICTTTextContentStorage *)WeakRetained;
}

void __100__ICTK2TextView_swizzleTextLayoutCanvasViewTextViewportLayoutControllerDidLayoutTextViewportElement__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a4;
  objc_opt_class();
  v7 = [v5 textContainer];
  v8 = ICDynamicCast();

  if (v8)
  {
    objc_opt_class();
    ICDynamicCast();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v17 = long long v21 = 0u;
    v9 = [v17 textLineFragments];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
          v15 = [v8 tk2TextView];
          v16 = [v15 renderingAttributesProvider];
          [v14 setRenderingAttributesProvider:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (id)renderingAttributesProvider
{
  return objc_getProperty(self, a2, 3344, 1);
}

- (ICTK2TextController)tk2TextController
{
  return self->_tk2TextController;
}

- (void)setRenderingAttributesProvider:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICTK2TextView;
  -[ICTK2TextView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ICTextView *)self updateLayoutMargins];
}

- (void)setAttachmentViewDelegate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(ICTK2TextView *)self textLayoutManager];
  ICCheckedDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 setAttachmentViewDelegate:v4];
}

- (ICTK2TextView)initWithNote:(id)a3 size:(CGSize)a4 insideSystemPaper:(BOOL)a5 linkDelegate:(id)a6 insideSiriSnippet:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  id v13 = a6;
  v14 = v12;
  v15 = [v12 textContentStorageCreateIfNeeded];
  v16 = v15;
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = objc_alloc_init(MEMORY[0x263F5B490]);
  }
  long long v18 = v17;

  v40 = objc_alloc_init(ICTextContentStorageDelegate);
  objc_msgSend(v18, "setDelegate:");
  long long v19 = objc_alloc_init(ICTK2TextLayoutManager);
  long long v20 = objc_alloc_init(ICTK2TextLayoutManagerDelegate);
  -[ICTK2TextLayoutManager setDelegate:](v19, "setDelegate:");
  [v18 addTextLayoutManager:v19];
  long long v21 = -[ICTK2TextContainer initWithSize:]([ICTK2TextContainer alloc], "initWithSize:", width, height);
  [(ICTK2TextContainer *)v21 setLinkDelegate:v13];

  [(ICTK2TextContainer *)v21 setInsideSystemPaper:v9];
  [(ICTK2TextLayoutManager *)v19 setTextContainer:v21];
  [(ICTK2TextContainer *)v21 setInsideSiriSnippet:v7];
  objc_opt_class();
  v22 = [v18 textStorage];
  uint64_t v23 = [v22 styler];
  v24 = ICDynamicCast();
  v25 = v24;
  if (v24) {
    id v26 = v24;
  }
  else {
    id v26 = objc_alloc_init(MEMORY[0x263F5B480]);
  }
  v27 = v26;

  [v27 setNote:v14 firstVisibleLocation:0];
  [v27 setIsForSiri:v7];
  v28 = [v18 textStorage];
  [v28 setStyler:v27];

  v41.receiver = self;
  v41.super_class = (Class)ICTK2TextView;
  v29 = -[ICTextView initWithFrame:textContainer:](&v41, sel_initWithFrame_textContainer_, v21, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_note, a3);
    objc_storeWeak((id *)&v30->_textContentStorage, v18);
    objc_storeStrong((id *)&v30->_textLayoutManagerDelegate, v20);
    objc_storeStrong((id *)&v30->_textContentStorageDelegate, v40);
    objc_storeStrong((id *)&v30->_tk2TextController, v27);
    v31 = [[ICOutlineRenderer alloc] initWithTextView:v30];
    outlineRenderer = v30->_outlineRenderer;
    v30->_outlineRenderer = v31;

    v30->_hoveredCharacterIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(ICTK2TextContainer *)v21 setTk2TextView:v30];
    [(ICTK2TextView *)v30 setClipsToBounds:0];
    [(ICTK2TextView *)v30 setCanCancelContentTouches:1];
    [(ICTK2TextView *)v30 setDelaysContentTouches:0];
    [(ICTK2TextView *)v30 setKeyboardDismissMode:4];
    [(ICTK2TextView *)v30 setAlwaysBounceVertical:1];
    [(ICTK2TextView *)v30 setFindInteractionEnabled:1];
    [(ICTK2TextView *)v30 setWritingToolsAllowedInputOptions:15];
    v33 = objc_alloc_init(ICAttributionSidebarView);
    attributionSidebarView = v30->_attributionSidebarView;
    v30->_attributionSidebarView = v33;

    [(ICAttributionSidebarView *)v30->_attributionSidebarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICAttributionSidebarView *)v30->_attributionSidebarView setTextView:v30];
    v35 = (void *)[objc_alloc(MEMORY[0x263F827D0]) initWithTarget:v30 action:sel_handleHover_];
    [(ICTK2TextView *)v30 addGestureRecognizer:v35];

    v36 = [MEMORY[0x263F08A00] defaultCenter];
    [v36 addObserver:v30 selector:sel_textViewportLayoutControllerDidLayout_ name:*MEMORY[0x263F83E18] object:0];

    [(ICTK2TextView *)v30 ic_addObserver:v30 forKeyPath:@"hoveredCharacterIndex" context:compoundliteral_10];
  }

  return v30;
}

- (ICNote)note
{
  return self->_note;
}

- (int64_t)hoveredCharacterIndex
{
  return self->_hoveredCharacterIndex;
}

- (void)layoutSubviews
{
  v32[4] = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)ICTK2TextView;
  [(ICTextView *)&v31 layoutSubviews];
  v3 = [(ICTK2TextView *)self attributionSidebarView];
  [v3 fullContentWidth];
  double v5 = v4;

  id v6 = [(ICTK2TextView *)self attributionSidebarView];
  BOOL v7 = [v6 superview];

  if (v7)
  {
    v8 = [(ICTK2TextView *)self attributionSidebarLeadingConstraint];
    [v8 setConstant:-v5];

    BOOL v9 = [(ICTK2TextView *)self attributionSidebarWidthConstraint];
    [v9 setConstant:v5];
  }
  else
  {
    uint64_t v10 = [(ICTK2TextView *)self containerViewForAttachments];
    uint64_t v11 = [(ICTK2TextView *)self attributionSidebarView];
    [v10 insertSubview:v11 atIndex:0];

    uint64_t v23 = (void *)MEMORY[0x263F08938];
    BOOL v9 = [(ICTK2TextView *)self attributionSidebarView];
    v29 = [v9 topAnchor];
    v30 = [(ICTK2TextView *)self containerViewForAttachments];
    v28 = [v30 topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v32[0] = v27;
    id v26 = [(ICTK2TextView *)self attributionSidebarView];
    v24 = [v26 bottomAnchor];
    v25 = [(ICTK2TextView *)self containerViewForAttachments];
    v22 = [v25 bottomAnchor];
    long long v21 = [v24 constraintEqualToAnchor:v22];
    v32[1] = v21;
    id v12 = [(ICTK2TextView *)self attributionSidebarView];
    id v13 = [v12 leadingAnchor];
    v14 = [(ICTK2TextView *)self containerViewForAttachments];
    v15 = [v14 leadingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15 constant:-v5];
    [(ICTK2TextView *)self setAttributionSidebarLeadingConstraint:v16];
    v32[2] = v16;
    id v17 = [(ICTK2TextView *)self attributionSidebarView];
    long long v18 = [v17 widthAnchor];
    long long v19 = [v18 constraintEqualToConstant:v5];
    [(ICTK2TextView *)self setAttributionSidebarWidthConstraint:v19];
    v32[3] = v19;
    long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
    [v23 activateConstraints:v20];
  }
}

- (ICAttributionSidebarView)attributionSidebarView
{
  return self->_attributionSidebarView;
}

- (NSLayoutConstraint)attributionSidebarWidthConstraint
{
  return self->_attributionSidebarWidthConstraint;
}

- (NSLayoutConstraint)attributionSidebarLeadingConstraint
{
  return self->_attributionSidebarLeadingConstraint;
}

- (void)setAttributionSidebarWidthConstraint:(id)a3
{
}

- (void)setAttributionSidebarLeadingConstraint:(id)a3
{
}

void __27__ICTK2TextView_initialize__block_invoke_2()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = *MEMORY[0x263F5B0A0];
  v1 = [NSNumber numberWithInteger:ic_currentEmphasisColorTypeDefault()];
  v4[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [v0 registerDefaults:v2];
}

- (void)textViewportLayoutControllerDidLayout:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = [v4 object];

  ICDynamicCast();
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v16 textLayoutManager];
  BOOL v7 = [(ICTK2TextView *)self textLayoutManager];

  if (v6 == v7)
  {
    v8 = [(ICTK2TextView *)self textStorage];
    uint64_t v9 = objc_msgSend(v8, "ic_range");
    -[ICBaseTextView updateStyleLayersInRange:](self, "updateStyleLayersInRange:", v9, v10);
  }
  if ([(ICBaseTextView *)self needsStylingRefreshOnNextLayout])
  {
    objc_opt_class();
    uint64_t v11 = [(ICBaseTextView *)self TTTextStorage];
    id v12 = [v11 styler];
    id v13 = ICCheckedDynamicCast();

    v14 = [(ICBaseTextView *)self TTTextStorage];
    [v13 refreshTextStylingForTextStorage:v14 withTextController:v13];

    [(ICBaseTextView *)self setNeedsStylingRefreshOnNextLayout:0];
  }
  v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 postNotificationName:@"ICTextViewLayoutDidChangeNotification" object:self];
}

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__ICTK2TextView_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

void __27__ICTK2TextView_initialize__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) swizzleLayoutFragmentPointInside];
  [*(id *)(a1 + 32) swizzleTextLayoutCanvasViewTextViewportLayoutControllerDidLayoutTextViewportElement];
  [MEMORY[0x263F81678] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:*MEMORY[0x263F5B138]];
  [MEMORY[0x263F81678] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:*MEMORY[0x263F5AAC8]];
  [MEMORY[0x263F81678] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:*MEMORY[0x263F5AAE0]];
  [MEMORY[0x263F81678] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:*MEMORY[0x263F5AAD8]];
  [MEMORY[0x263F81678] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:*MEMORY[0x263F5AAB8]];
  [MEMORY[0x263F81678] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:*MEMORY[0x263F5AAB0]];
  [MEMORY[0x263F81678] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:*MEMORY[0x263F5A9A8]];
  if (ICInternalSettingsIsEmphasisEnabled() && AAJSONErrorDomain_block_invoke_onceToken != -1)
  {
    dispatch_once(&AAJSONErrorDomain_block_invoke_onceToken, &__block_literal_global_34);
  }
}

+ (void)swizzleLayoutFragmentPointInside
{
  v2 = NSClassFromString(&cfstr_Uitextlayoutfr.isa);
  objc_msgSend(NSString, "stringWithFormat:", @"%s%s%s%s%s", "B", "@", ":", "{CGPoint=dd}", "@");
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  double v5 = imp_implementationWithBlock(&__block_literal_global_30);

  class_addMethod(v2, sel_pointInside_withEvent_, v5, v4);
}

+ (void)swizzleTextLayoutCanvasViewTextViewportLayoutControllerDidLayoutTextViewportElement
{
  v2 = NSClassFromString(&cfstr_Uitextlayoutca.isa);
  objc_msgSend(NSString, "stringWithFormat:", @"%s%s%s%s%s", "v", "@", ":", "@", "@");
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  double v5 = imp_implementationWithBlock(&__block_literal_global_40);

  class_addMethod(v2, sel_textViewportLayoutController_didLayoutTextViewportElement_, v5, v4);
}

uint64_t __49__ICTK2TextView_swizzleLayoutFragmentPointInside__block_invoke(double a1, double a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 subviews];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__ICTK2TextView_swizzleLayoutFragmentPointInside__block_invoke_2;
  v15[3] = &unk_2640BBD68;
  double v18 = a1;
  double v19 = a2;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  uint64_t v13 = objc_msgSend(v10, "ic_containsObjectPassingTest:", v15);

  return v13;
}

uint64_t __49__ICTK2TextView_swizzleLayoutFragmentPointInside__block_invoke_2(double *a1, void *a2)
{
  uint64_t v3 = *((void *)a1 + 4);
  double v4 = a1[6];
  double v5 = a1[7];
  id v6 = a2;
  objc_msgSend(v6, "convertPoint:fromView:", v3, v4, v5);
  uint64_t v7 = objc_msgSend(v6, "pointInside:withEvent:", *((void *)a1 + 5));

  return v7;
}

- (void)dealloc
{
  objc_opt_class();
  uint64_t v3 = [(ICTK2TextView *)self textLayoutManager];
  double v4 = ICCheckedDynamicCast();

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textContentStorage);
    [WeakRetained removeTextLayoutManager:v4];
  }
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F83E18] object:0];

  [(ICTK2TextView *)self ic_removeObserver:self forKeyPath:@"hoveredCharacterIndex" context:compoundliteral_10];
  v7.receiver = self;
  v7.super_class = (Class)ICTK2TextView;
  [(ICTextView *)&v7 dealloc];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICTK2TextView;
  id v8 = -[ICTextView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    id v9 = [(ICTK2TextView *)self attributionSidebarView];
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    double v11 = v10;
    double v13 = v12;

    v14 = [(ICTK2TextView *)self attributionSidebarView];
    [v14 bounds];
    v20.double x = v11;
    v20.double y = v13;
    BOOL v15 = CGRectContainsPoint(v21, v20);

    if (v15)
    {
      id v16 = [(ICTK2TextView *)self attributionSidebarView];
      id v8 = objc_msgSend(v16, "hitTest:withEvent:", v7, v11, v13);
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)scrollRangeToVisible:(_NSRange)a3
{
}

- (void)scrollRangeToVisible:(_NSRange)a3 withHeightPercentageAdjustment:(double)a4 forceTop:(BOOL)a5
{
  BOOL v5 = a5;
  -[ICTK2TextView scrollOffsetForRange:withHeightPercentageAdjustment:](self, "scrollOffsetForRange:withHeightPercentageAdjustment:", a3.location, a3.length, a4);
  double v8 = v7;
  double v10 = v9;
  if (v5) {
    goto LABEL_3;
  }
  double v11 = [(ICTK2TextView *)self textLayoutManager];
  double v12 = [v11 textViewportLayoutController];
  [v12 viewportBounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;

  CGRect v21 = [(ICTK2TextView *)self keyboardLayoutGuide];
  [v21 layoutFrame];
  double v23 = v22;

  v26.size.double height = v20 - v23;
  v26.origin.double x = v14;
  v26.origin.double y = v16;
  v26.size.double width = v18;
  v25.double x = v8;
  v25.double y = v10;
  if (!CGRectContainsPoint(v26, v25))
  {
LABEL_3:
    -[ICTextView setContentOffset:](self, "setContentOffset:", v8, v10);
  }
}

- (NSLayoutManager)layoutManager
{
  return 0;
}

- (id)attachmentViewDelegate
{
  objc_opt_class();
  uint64_t v3 = [(ICTK2TextView *)self textLayoutManager];
  double v4 = ICCheckedDynamicCast();

  BOOL v5 = [v4 attachmentViewDelegate];

  return v5;
}

- (void)handleHover:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(ICBaseTextView *)self icTextLayoutManager];
  uint64_t v9 = objc_msgSend(v8, "characterIndexForPoint:", v5, v7);

  if ([(ICTK2TextView *)self hoveredCharacterIndex] != v9)
  {
    [(ICTK2TextView *)self setHoveredCharacterIndex:v9];
  }
}

- (CGPoint)scrollOffsetForRange:(_NSRange)a3 withHeightPercentageAdjustment:(double)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v8 = [(ICTK2TextView *)self textLayoutManager];
  uint64_t v9 = [v8 documentRange];

  double v10 = [(ICTK2TextView *)self textLayoutManager];
  double v11 = [v9 location];
  double v12 = [v10 locationFromLocation:v11 withOffset:location];

  id v13 = objc_alloc(MEMORY[0x263F816E0]);
  CGFloat v14 = [v9 location];
  double v15 = (void *)[v13 initWithLocation:v14 endLocation:v12];

  CGFloat v16 = [(ICTK2TextView *)self textLayoutManager];
  [v16 ensureLayoutForRange:v15];

  [(ICTK2TextView *)self layoutIfNeeded];
  [(ICTextView *)self _updateContentSize];
  uint64_t v28 = 0;
  v29 = (double *)&v28;
  uint64_t v30 = 0x3010000000;
  objc_super v31 = &unk_20C1E2BF2;
  long long v32 = *MEMORY[0x263F00148];
  double v17 = [(ICTK2TextView *)self textLayoutManager];
  CGFloat v18 = objc_msgSend(v17, "ic_textRangeForRange:", location, length);

  double v19 = [(ICTK2TextView *)self textLayoutManager];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __69__ICTK2TextView_scrollOffsetForRange_withHeightPercentageAdjustment___block_invoke;
  v27[3] = &unk_2640BBDB0;
  v27[4] = self;
  v27[5] = &v28;
  *(double *)&v27[6] = a4;
  [v19 enumerateTextSegmentsInRange:v18 type:0 options:0 usingBlock:v27];

  [(ICTK2TextView *)self safeAreaInsets];
  v29[5] = v29[5] - v20;
  [(ICTK2TextView *)self contentOffset];
  double v22 = v21;
  double v23 = v29;
  v29[4] = v21;
  double v24 = v23[5];

  _Block_object_dispose(&v28, 8);
  double v25 = v22;
  double v26 = v24;
  result.double y = v26;
  result.double x = v25;
  return result;
}

uint64_t __69__ICTK2TextView_scrollOffsetForRange_withHeightPercentageAdjustment___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v9 = [*(id *)(a1 + 32) containerViewForAttachments];
  objc_msgSend(v9, "convertPoint:toView:", *(void *)(a1 + 32), a2, a3);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v12;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40)
                                                              + a5 * *(double *)(a1 + 48);

  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a5;
  id v10 = v9;
  if (a6 == compoundliteral_10)
  {
    long long v32 = v9;
    id v9 = (id)[a3 isEqualToString:@"hoveredCharacterIndex"];
    id v10 = v32;
    if (v9)
    {
      objc_opt_class();
      uint64_t v11 = [v32 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      uint64_t v12 = ICDynamicCast();

      objc_opt_class();
      id v13 = [v32 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      CGFloat v14 = ICDynamicCast();

      double v15 = [(ICBaseTextView *)self editorController];
      CGFloat v16 = [v15 calculateRecognitionController];
      uint64_t v17 = [v16 previewBehavior];

      if (!ICInternalSettingsIsScrubbingEnabled() || v17 == 1) {
        goto LABEL_24;
      }
      CGFloat v18 = [(ICBaseTextView *)self editorController];
      double v19 = [v18 note];
      if ([v19 isSharedReadOnly]) {
        goto LABEL_23;
      }
      double v20 = [(ICTK2TextView *)self note];
      if (([v20 isDeletedOrInTrash] & 1) == 0)
      {
        double v21 = (void *)*MEMORY[0x263EFFD08];
        double v22 = (void *)*MEMORY[0x263EFFD08] == v12 ? 0 : v12;
        unint64_t v23 = v22;
        double v24 = v21 == v14 ? 0 : v14;
        unint64_t v25 = v24;
        if (v23 | v25)
        {
          double v26 = (void *)v25;
          if (v23 && v25)
          {
            char v27 = [(id)v23 isEqual:v25];

            if (v27) {
              goto LABEL_24;
            }
          }
          else
          {
          }
          uint64_t v28 = [(ICTK2TextView *)self note];
          CGFloat v18 = [v28 calculateDocumentController];

          double v19 = objc_msgSend(v18, "numberLiteralAtLocation:", objc_msgSend(v14, "integerValue"));
          if ([v19 range] == 0x7FFFFFFFFFFFFFFFLL || (int v29 = objc_msgSend(v14, "intValue"), v29 < 1))
          {
LABEL_23:

LABEL_24:
            id v10 = v32;
            goto LABEL_25;
          }
          uint64_t v30 = v29;
          double v20 = [(ICBaseTextView *)self editorController];
          objc_super v31 = [v20 calculateScrubberController];
          [v31 setHoveredCharacterIndex:v30];
        }
      }

      goto LABEL_23;
    }
  }
LABEL_25:

  MEMORY[0x270F9A758](v9, v10);
}

- (void)setAttributionSidebarView:(id)a3
{
}

- (ICOutlineRenderer)outlineRenderer
{
  return self->_outlineRenderer;
}

- (void)setOutlineRenderer:(id)a3
{
}

- (void)setHoveredCharacterIndex:(int64_t)a3
{
  self->_hoveredCharacterIndedouble x = a3;
}

- (ICTK2TextLayoutManagerDelegate)textLayoutManagerDelegate
{
  return self->_textLayoutManagerDelegate;
}

- (void)setTextLayoutManagerDelegate:(id)a3
{
}

- (ICTextContentStorageDelegate)textContentStorageDelegate
{
  return self->_textContentStorageDelegate;
}

- (void)setTextContentStorageDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSidebarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_attributionSidebarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textContentStorageDelegate, 0);
  objc_storeStrong((id *)&self->_textLayoutManagerDelegate, 0);
  objc_storeStrong(&self->_renderingAttributesProvider, 0);
  objc_storeStrong((id *)&self->_outlineRenderer, 0);
  objc_storeStrong((id *)&self->_attributionSidebarView, 0);
  objc_storeStrong((id *)&self->_tk2TextController, 0);
  objc_destroyWeak((id *)&self->_textContentStorage);

  objc_storeStrong((id *)&self->_note, 0);
}

@end