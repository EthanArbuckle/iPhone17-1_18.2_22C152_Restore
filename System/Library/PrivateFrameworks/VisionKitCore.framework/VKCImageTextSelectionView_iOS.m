@interface VKCImageTextSelectionView_iOS
+ (BOOL)processHasSnapshotDragEntitlement;
- (BOOL)_scribbleInteractionShouldDisableInputAssistant:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)beginSelectionChangedCalled;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)initializationComplete;
- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isImageBacked;
- (BOOL)longPressHandler:(id)a3 gestureRecognizer:(id)a4 shouldRecieveTouch:(id)a5;
- (BOOL)longPressHandler:(id)a3 gestureRecognizer:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5;
- (BOOL)manuallySettingSelectedRange;
- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)selectable;
- (BOOL)useFullDocumentRangeForEmptySelection;
- (NSArray)accessibilityElements;
- (NSDictionary)markedTextStyle;
- (UIDragInteraction)dragInteraction;
- (UILongPressGestureRecognizer)longPressGR;
- (UITextInputDelegate)inputDelegate;
- (UITextInputStringTokenizer)tokenizer;
- (UITextInteraction)textInteraction;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UITextSelectionGrabberSuppressionAssertion)textSelectionGrabberSuppression;
- (VKCImageTextSelectionView_iOS)initWithCoder:(id)a3;
- (VKCImageTextSelectionView_iOS)initWithFrame:(CGRect)a3;
- (VKCTextPointerTrackingView)textPointerTrackingView;
- (VKCTextSelectionLongPressDelegateHandler)longPressHandler;
- (VKTextRange)preSelectionChangeSelectedRange;
- (id)_accessibilityUserTestingChildren;
- (id)_rvItemForSelectedRange;
- (id)_rvItemInRange:(_NSRange)a3;
- (id)_textImageFromRect:(CGRect)a3;
- (id)_textRangeForActions;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)selectedTextPathsConvertedToView:(id)a3;
- (id)targetedDragPreviewForCurrentSelection;
- (id)targetedDragPreviewWithLabelsForCurrentSelection;
- (id)text;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)_availableTextServices;
- (int64_t)selectionAffinity;
- (unint64_t)currentDraggedRectEdge;
- (unint64_t)draggedRectEdge;
- (void)_addShortcut:(id)a3;
- (void)_define:(id)a3;
- (void)_lookup:(id)a3;
- (void)_share:(id)a3;
- (void)_translate:(id)a3;
- (void)beginSelectionChange;
- (void)commonInit;
- (void)copy:(id)a3;
- (void)didLongPress:(id)a3;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)endSelectionChange;
- (void)presentShareSheetForCustomStrings:(id)a3 attributedString:(id)a4;
- (void)selectAll:(id)a3;
- (void)setBeginSelectionChangedCalled:(BOOL)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setDragInteraction:(id)a3;
- (void)setDraggedRectEdge:(unint64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInitializationComplete:(BOOL)a3;
- (void)setInputDelegate:(id)a3;
- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3;
- (void)setLongPressGR:(id)a3;
- (void)setLongPressHandler:(id)a3;
- (void)setManuallySettingSelectedRange:(BOOL)a3;
- (void)setMarkedTextStyle:(id)a3;
- (void)setPreSelectionChangeSelectedRange:(id)a3;
- (void)setRecognitionResult:(id)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelectedVKRange:(id)a3;
- (void)setSelectionAffinity:(int64_t)a3;
- (void)setTextInteraction:(id)a3;
- (void)setTextPointerTrackingView:(id)a3;
- (void)setTextSelectionGrabberSuppression:(id)a3;
- (void)setTokenizer:(id)a3;
- (void)setUseFullDocumentRangeForEmptySelection:(BOOL)a3;
- (void)suppressSelectionViewGrabbers;
- (void)unsuppressSelectionViewGrabbers;
- (void)updateSelectionRectsForWindowChange;
- (void)useInteractionOptions:(unint64_t)a3;
@end

@implementation VKCImageTextSelectionView_iOS

- (void)commonInit
{
  id v10 = [MEMORY[0x1E4F42F30] textInteractionForMode:1];
  [v10 setTextInput:self];
  [v10 setDelegate:self];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F42998]) initWithDelegate:self];
  [v3 setEnabled:1];
  [(VKCImageTextSelectionView_iOS *)self addInteraction:v3];
  [(VKCImageTextSelectionView_iOS *)self setDragInteraction:v3];
  [(VKCImageTextSelectionView_iOS *)self addInteraction:v10];
  [(VKCImageTextSelectionView_iOS *)self setTextInteraction:v10];
  v4 = +[VKTextRange emptyRange];
  [(VKCImageTextSelectionView_iOS *)self setSelectedTextRange:v4];

  v5 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel_didLongPress_];
  longPressGR = self->_longPressGR;
  self->_longPressGR = v5;

  v7 = objc_alloc_init(VKCTextSelectionLongPressDelegateHandler);
  longPressHandler = self->_longPressHandler;
  self->_longPressHandler = v7;

  [(VKCTextSelectionLongPressDelegateHandler *)self->_longPressHandler setDelegate:self];
  [(UILongPressGestureRecognizer *)self->_longPressGR setDelegate:self->_longPressHandler];
  [(VKCImageTextSelectionView_iOS *)self addGestureRecognizer:self->_longPressGR];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F42DA0]) initWithDelegate:self];
  [(VKCImageTextSelectionView_iOS *)self addInteraction:v9];

  self->_initializationComplete = 1;
}

- (VKCImageTextSelectionView_iOS)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  v3 = -[VKCImageTextSelectionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VKCImageTextSelectionView_iOS *)v3 commonInit];
  }
  return v4;
}

- (VKCImageTextSelectionView_iOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  v3 = [(VKCImageTextSelectionView_iOS *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(VKCImageTextSelectionView_iOS *)v3 commonInit];
  }
  return v4;
}

- (void)useInteractionOptions:(unint64_t)a3
{
  char v3 = a3;
  v5 = [(VKCImageTextSelectionView_iOS *)self textInteraction];

  if (v5)
  {
    objc_super v6 = [(VKCImageTextSelectionView_iOS *)self textInteraction];
    [(VKCImageTextSelectionView_iOS *)self removeInteraction:v6];
  }
  if (v3)
  {
    v7 = [MEMORY[0x1E4F42F30] textInteractionForMode:1001];
    if ((v3 & 2) == 0)
    {
      id v12 = v7;
      [v7 _setAllowsSelectionCommands:1];
      v7 = v12;
    }
  }
  else
  {
    v7 = [MEMORY[0x1E4F42F30] textInteractionForMode:1];
  }
  id v13 = v7;
  [v7 setTextInput:self];
  [v13 setDelegate:self];
  [(VKCImageTextSelectionView_iOS *)self addInteraction:v13];
  [(VKCImageTextSelectionView_iOS *)self setTextInteraction:v13];
  v8 = +[VKTextRange emptyRange];
  [(VKCImageTextSelectionView_iOS *)self setSelectedTextRange:v8];

  v9 = [(VKCImageTextSelectionView_iOS *)self dragInteraction];

  if (v9)
  {
    id v10 = [(VKCImageTextSelectionView_iOS *)self dragInteraction];
    [(VKCImageTextSelectionView_iOS *)self removeInteraction:v10];
  }
  if ((v3 & 4) == 0)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F42998]) initWithDelegate:self];
    [v11 setEnabled:1];
    [(VKCImageTextSelectionView_iOS *)self addInteraction:v11];
    [(VKCImageTextSelectionView_iOS *)self setDragInteraction:v11];
  }
}

- (int64_t)_availableTextServices
{
  v8.receiver = self;
  v8.super_class = (Class)VKCImageTextSelectionView_iOS;
  id v2 = [(VKCImageTextSelectionView_iOS *)&v8 _availableTextServices];
  if (!v2)
  {
    if (objc_msgSend(MEMORY[0x1E4F42948], "vk_isiPad")) {
      return 0;
    }
    char v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [v3 bundleIdentifier];
    int v5 = [v4 isEqualToString:@"com.apple.ScreenshotServicesService"];

    if (!v5)
    {
      return 0;
    }
    else
    {
      objc_super v6 = [MEMORY[0x1E4F42738] sharedApplication];
      id v2 = (id)[v6 _availableTextServices];
    }
  }
  return (int64_t)v2;
}

- (void)beginSelectionChange
{
  [(VKCImageTextSelectionView_iOS *)self setBeginSelectionChangedCalled:1];
  [(VKCImageTextSelectionView_iOS *)self setDraggedRectEdge:[(VKCImageTextSelectionView_iOS *)self currentDraggedRectEdge]];
  id v3 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  [(VKCImageTextSelectionView_iOS *)self setPreSelectionChangeSelectedRange:v3];
}

- (void)endSelectionChange
{
  [(VKCImageTextSelectionView_iOS *)self setDraggedRectEdge:0];
  id v3 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  [(VKCImageTextSelectionView_iOS *)self setPreSelectionChangeSelectedRange:v3];

  [(VKCImageTextSelectionView_iOS *)self setBeginSelectionChangedCalled:0];
  [(VKCImageTextSelectionView *)self sendAnalyticsEventWithSelector:0 type:0 source:1];
}

- (void)setSelectedVKRange:(id)a3
{
  id v4 = a3;
  int v5 = [(VKCImageTextSelectionView_iOS *)self inputDelegate];
  [v5 selectionWillChange:self];

  [(VKCImageTextSelectionView_iOS *)self setManuallySettingSelectedRange:1];
  [(VKCImageTextSelectionView_iOS *)self setSelectedTextRange:v4];

  [(VKCImageTextSelectionView_iOS *)self setManuallySettingSelectedRange:0];
  id v6 = [(VKCImageTextSelectionView_iOS *)self inputDelegate];
  [v6 selectionDidChange:self];
}

- (void)setHidden:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKCImageTextSelectionView_iOS;
  [(VKCImageTextSelectionView_iOS *)&v7 setHidden:a3];
  id v4 = [(VKCImageTextSelectionView_iOS *)self textInteraction];
  if ([(VKCImageTextSelectionView_iOS *)self isHidden])
  {
    [(VKCImageTextSelectionView_iOS *)self removeInteraction:v4];
  }
  else
  {
    int v5 = [(VKCImageTextSelectionView_iOS *)self interactions];
    char v6 = [v5 containsObject:v4];

    if ((v6 & 1) == 0) {
      [(VKCImageTextSelectionView_iOS *)self addInteraction:v4];
    }
  }
}

- (id)_textImageFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  v9 = [v8 viewForImageSnapshotForTextSelectionView:self];

  -[VKCImageTextSelectionView_iOS convertRect:toView:](self, "convertRect:toView:", v9, x, y, width, height);
  id v10 = objc_msgSend(v9, "vk_renderImageFromViewBackingStoreWithSubrect:");

  return v10;
}

- (void)selectAll:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Select All: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [(VKCImageTextSelectionView *)self documentRange];
  [(VKCImageTextSelectionView_iOS *)self setSelectedVKRange:v6];

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  [(VKCImageTextSelectionView *)self sendAnalyticsEventWithSelector:0 type:2 source:v7];
}

- (void)copy:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Copy: %@", buf, 0xCu);
  }

  uint64_t v6 = [(VKCImageTextSelectionView_iOS *)self _textRangeForActions];
  uint64_t v7 = [(VKCImageTextSelectionView *)self selectedText];
  int v8 = [(VKCImageTextSelectionView *)self attributedTextInRange:v6];
  v9 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  uint64_t v10 = [v9 textSelectionView:self updateStringForCopy:v7];

  v11 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  id v12 = [v11 textSelectionView:self updateAttributedStringForCopy:v8];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v10];
  [v13 registerObject:v12 visibility:0];
  uint64_t v14 = [MEMORY[0x1E4F42C50] generalPasteboard];
  v17 = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [(id)v14 setItemProviders:v15];

  objc_opt_class();
  LOBYTE(v14) = objc_opt_isKindOfClass();

  if (v14) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 3;
  }
  [(VKCImageTextSelectionView *)self sendAnalyticsEventWithSelector:0 type:1 source:v16];
}

- (void)setInputDelegate:(id)a3
{
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VKCImageBaseOverlayView *)self contentsRect];
  v16.origin.double x = v8;
  v16.origin.double y = v9;
  v16.size.double width = v10;
  v16.size.double height = v11;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  if (!CGRectEqualToRect(v15, v16))
  {
    id v12 = [(VKCImageTextSelectionView_iOS *)self inputDelegate];
    [v12 textWillChange:self];

    v14.receiver = self;
    v14.super_class = (Class)VKCImageTextSelectionView_iOS;
    -[VKCImageBaseOverlayView setContentsRect:](&v14, sel_setContentsRect_, x, y, width, height);
    id v13 = [(VKCImageTextSelectionView_iOS *)self inputDelegate];
    [v13 textDidChange:self];
  }
}

- (void)setRecognitionResult:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VKCImageTextSelectionView_iOS;
  id v4 = a3;
  [(VKCImageTextSelectionView *)&v8 setRecognitionResult:v4];
  int v5 = [VKTextInputStringTokenizer alloc];
  uint64_t v6 = -[VKTextInputStringTokenizer initWithTextInput:recognitionResult:](v5, "initWithTextInput:recognitionResult:", self, v4, v8.receiver, v8.super_class);
  [(VKCImageTextSelectionView_iOS *)self setTokenizer:v6];

  [v4 setTextDelegate:self];
  uint64_t v7 = [(VKCImageTextSelectionView_iOS *)self inputDelegate];
  [v7 textDidChange:self];

  [(VKCImageTextSelectionView_iOS *)self setAccessibilityElements:0];
}

- (void)setLongPressDataDetectorsInTextMode:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VKCImageTextSelectionView_iOS;
  -[VKCImageTextSelectionView setLongPressDataDetectorsInTextMode:](&v6, sel_setLongPressDataDetectorsInTextMode_);
  int v5 = [(VKCImageTextSelectionView_iOS *)self longPressGR];
  [v5 setEnabled:v3];
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [(VKCImageTextSelectionView *)self textSelectionDelegate];

  if (!v7) {
    return 1;
  }
  objc_super v8 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  char v9 = objc_msgSend(v8, "textSelectionView:shouldBeginAtPoint:", self, x, y);

  return v9;
}

- (void)updateSelectionRectsForWindowChange
{
  id v3 = [(VKCImageTextSelectionView_iOS *)self interactionAssistant];
  id v2 = [v3 selectionView];
  [v2 updateSelectionRects];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([v7 type] == 11 && (vk_isSeedBuild() & 1) == 0)
  {
    -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", x, y);
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    v17 = [(VKCImageBaseOverlayView *)self recognitionResult];
    v18 = [v17 allLineQuads];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __51__VKCImageTextSelectionView_iOS_hitTest_withEvent___block_invoke;
    v27[3] = &__block_descriptor_48_e23_B32__0__VKQuad_8Q16_B24l;
    v27[4] = v14;
    v27[5] = v16;
    objc_super v8 = objc_msgSend(v18, "vk_objectPassingTest:", v27);

    if (v8)
    {
      [(VKCImageBaseOverlayView *)self contentsRect];
      v19 = objc_msgSend(v8, "quadByConvertingFromNormalizedRectToView:contentsRect:", self);
      uint64_t v20 = [(VKCImageTextSelectionView_iOS *)self textPointerTrackingView];
      v21 = [v20 quad];
      BOOL v22 = VKMNearlyEqualVKQuads(v21, v19);

      if (!v22)
      {
        v23 = [(VKCImageTextSelectionView_iOS *)self textPointerTrackingView];
        [v23 removeFromSuperview];

        v24 = [[VKCTextPointerTrackingView alloc] initWithQuad:v19];
        [(VKCImageTextSelectionView_iOS *)self addSubview:v24];
        [(VKCImageTextSelectionView_iOS *)self setTextPointerTrackingView:v24];
      }
    }
  }
  else
  {
    objc_super v8 = [(VKCImageTextSelectionView_iOS *)self textPointerTrackingView];
    [v8 removeFromSuperview];
  }

  v26.receiver = self;
  v26.super_class = (Class)VKCImageTextSelectionView_iOS;
  -[VKCImageTextSelectionView_iOS hitTest:withEvent:](&v26, sel_hitTest_withEvent_, v7, x, y);
  char v9 = (VKCImageTextSelectionView_iOS *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if ([(VKCImageTextSelectionView *)self longPressDataDetectorsInTextMode]
      && ([(VKCImageTextSelectionView *)self textSelectionDelegate],
          CGFloat v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = objc_msgSend(v10, "textSelectionView:dataDetectorExistsAtPoint:", self, x, y),
          v10,
          v11))
    {
      char v9 = self;
    }
    else
    {
      char v9 = 0;
    }
  }
  if (vk_isSeedBuild())
  {
    uint64_t v12 = [v7 buttonMask];
    if (v9 == self && v12 == 2)
    {
      if (-[VKCImageTextSelectionView containsTextAtPoint:](self, "containsTextAtPoint:", x, y))
      {
        char v9 = self;
      }
      else
      {

        char v9 = 0;
      }
    }
  }

  return v9;
}

- (BOOL)longPressHandler:(id)a3 gestureRecognizer:(id)a4 shouldRequireFailureOfGestureRecognizer:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(VKCImageTextSelectionView_iOS *)self longPressGR];

  if (v9 == v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v7 locationInView:self];
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
    int v15 = objc_msgSend(v14, "textSelectionView:dataDetectorExistsAtPoint:", self, v11, v13) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)longPressHandler:(id)a3 gestureRecognizer:(id)a4 shouldRecieveTouch:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(VKCImageTextSelectionView_iOS *)self longPressGR];

  if (v9 == v8)
  {
    double v11 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
    [v7 locationInView:self];
    char v10 = objc_msgSend(v11, "textSelectionView:dataDetectorExistsAtPoint:", self);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)didLongPress:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1)
  {
    id v4 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
    [v5 locationInView:self];
    objc_msgSend(v4, "textSelectionView:requestsDataDetectorActivationAtPoint:", self);
  }
}

- (void)_addShortcut:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__VKCImageTextSelectionView_iOS__addShortcut___block_invoke;
  v7[3] = &unk_1E6BF12B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 textSelectionView:self prepareForCalloutAction:sel__addShortcut_ completion:v7];
}

- (void)_lookup:(id)a3
{
  id v4 = a3;
  if (vk_isCameraApp())
  {
    id v5 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
    int v6 = [v5 isEmpty];

    if (v6)
    {
      id v7 = [(VKCImageTextSelectionView *)self documentRange];
      [(VKCImageTextSelectionView_iOS *)self setSelectedVKRange:v7];
    }
  }
  id v8 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__VKCImageTextSelectionView_iOS__lookup___block_invoke;
  v10[3] = &unk_1E6BF12B8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 textSelectionView:self prepareForCalloutAction:sel__lookup_ completion:v10];
}

- (void)_define:(id)a3
{
  id v4 = a3;
  if (vk_isCameraApp())
  {
    id v5 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
    int v6 = [v5 isEmpty];

    if (v6)
    {
      id v7 = [(VKCImageTextSelectionView *)self documentRange];
      [(VKCImageTextSelectionView_iOS *)self setSelectedVKRange:v7];
    }
  }
  id v8 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__VKCImageTextSelectionView_iOS__define___block_invoke;
  v10[3] = &unk_1E6BF12B8;
  id v11 = v4;
  double v12 = self;
  id v9 = v4;
  [v8 textSelectionView:self prepareForCalloutAction:sel__define_ completion:v10];
}

- (void)_translate:(id)a3
{
  id v4 = a3;
  if (vk_isCameraApp())
  {
    id v5 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
    int v6 = [v5 isEmpty];

    if (v6)
    {
      id v7 = [(VKCImageTextSelectionView *)self documentRange];
      [(VKCImageTextSelectionView_iOS *)self setSelectedVKRange:v7];
    }
  }
  id v8 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__VKCImageTextSelectionView_iOS__translate___block_invoke;
  v10[3] = &unk_1E6BF12B8;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 textSelectionView:self prepareForCalloutAction:sel__translate_ completion:v10];
}

- (void)_share:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  BOOL v22 = (CGRect *)&v21;
  uint64_t v23 = 0x4010000000;
  v24 = &unk_1DB350762;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v25 = *MEMORY[0x1E4F1DB20];
  long long v26 = v5;
  if (vk_isCameraApp())
  {
    int v6 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
    int v7 = [v6 isEmpty];

    if (v7)
    {
      id v8 = [(VKCImageTextSelectionView *)self documentRange];
      [(VKCImageTextSelectionView_iOS *)self setSelectedVKRange:v8];
    }
  }
  id v9 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  char v10 = [(VKCImageTextSelectionView *)self selectionRectsForRange:v9];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __40__VKCImageTextSelectionView_iOS__share___block_invoke;
  v20[3] = &unk_1E6BF3D18;
  v20[4] = &v21;
  [v10 enumerateObjectsUsingBlock:v20];

  if (!CGRectIsNull(v22[1]))
  {
    id v11 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
    double v12 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
    double v13 = [v12 nsRangeArray];
    p_double x = &v22->origin.x;
    int v15 = [(VKCImageTextSelectionView *)self selectedText];
    uint64_t v16 = [(VKCImageTextSelectionView *)self selectedAttributedText];
    LODWORD(p_x) = objc_msgSend(v11, "textSelectionView:shouldHandleShareWithRanges:boundingRect:selectedText:selectedAttributedText:", self, v13, v15, v16, p_x[4], p_x[5], p_x[6], p_x[7]);

    if (p_x)
    {
      v17 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __40__VKCImageTextSelectionView_iOS__share___block_invoke_2;
      v18[3] = &unk_1E6BF12B8;
      v18[4] = self;
      id v19 = v4;
      [v17 textSelectionView:self prepareForCalloutAction:sel__share_ completion:v18];
    }
  }
  _Block_object_dispose(&v21, 8);
}

- (void)presentShareSheetForCustomStrings:(id)a3 attributedString:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  id v9 = [v8 presentingViewControllerForTextSelectionView:self];
  if (v9)
  {
  }
  else
  {
    char v10 = [(VKCImageTextSelectionView_iOS *)self window];
    id v9 = [v10 rootViewController];

    if (!v9) {
      goto LABEL_7;
    }
  }
  id v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_DEFAULT, "presentShareSheetForCustomStrings: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x4010000000;
  v30 = &unk_1DB350762;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v31 = *MEMORY[0x1E4F1DB20];
  long long v32 = v12;
  double v13 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  uint64_t v14 = [(VKCImageTextSelectionView *)self selectionRectsForRange:v13];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __84__VKCImageTextSelectionView_iOS_presentShareSheetForCustomStrings_attributedString___block_invoke;
  v25[3] = &unk_1E6BF3D18;
  v25[4] = &buf;
  [v14 enumerateObjectsUsingBlock:v25];

  id v15 = objc_alloc(MEMORY[0x1E4F42718]);
  v27[0] = v7;
  v27[1] = v6;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v17 = (void *)[v15 initWithActivityItems:v16 applicationActivities:MEMORY[0x1E4F1CBF0]];

  uint64_t v26 = *MEMORY[0x1E4F43620];
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v17 setExcludedActivityTypes:v18];

  double v19 = *(double *)(*((void *)&buf + 1) + 32);
  double v20 = *(double *)(*((void *)&buf + 1) + 40);
  double v21 = *(double *)(*((void *)&buf + 1) + 48);
  double v22 = *(double *)(*((void *)&buf + 1) + 56);
  uint64_t v23 = [v17 popoverPresentationController];
  objc_msgSend(v23, "setSourceRect:", v19, v20, v21, v22);

  v24 = [v17 popoverPresentationController];
  [v24 setSourceView:self];

  [v9 presentViewController:v17 animated:1 completion:0];
  _Block_object_dispose(&buf, 8);

LABEL_7:
}

- (BOOL)isEditable
{
  return 0;
}

- (BOOL)isEditing
{
  return 0;
}

- (BOOL)selectable
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  char v3 = [(VKCImageTextSelectionView_iOS *)self isFirstResponder];
  v9.receiver = self;
  v9.super_class = (Class)VKCImageTextSelectionView_iOS;
  BOOL v4 = [(VKCImageTextSelectionView_iOS *)&v9 becomeFirstResponder];
  if ((v3 & 1) == 0 && [(VKCImageTextSelectionView_iOS *)self isFirstResponder])
  {
    long long v5 = [(VKCImageTextSelectionView_iOS *)self inputDelegate];
    [v5 selectionWillChange:self];

    id v6 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
    [(VKCImageTextSelectionView_iOS *)self setSelectedTextRange:v6];

    id v7 = [(VKCImageTextSelectionView_iOS *)self inputDelegate];
    [v7 selectionDidChange:self];
  }
  return v4;
}

- (void)setSelectedTextRange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(UITextRange *)self->_selectedTextRange isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedTextRange, a3);
    if (![(VKCImageTextSelectionView_iOS *)self beginSelectionChangedCalled]
      && ![(VKCImageTextSelectionView_iOS *)self manuallySettingSelectedRange]
      && [(VKCImageTextSelectionView_iOS *)self initializationComplete])
    {
      [(VKCImageTextSelectionView *)self sendAnalyticsEventWithSelector:0 type:0 source:3];
    }
    id v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      objc_super v9 = self;
      _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "Text Selection Changed: %@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
    [v7 textSelectionView:self selectionDidChange:v5];
  }
}

- (UITextPosition)beginningOfDocument
{
  id v2 = [(VKCImageTextSelectionView *)self documentRange];
  char v3 = [v2 start];

  return (UITextPosition *)v3;
}

- (UITextPosition)endOfDocument
{
  id v2 = [(VKCImageTextSelectionView *)self documentRange];
  char v3 = [v2 end];

  return (UITextPosition *)v3;
}

- (id)text
{
  id v2 = [(VKCImageBaseOverlayView *)self recognitionResult];
  char v3 = [v2 text];

  return v3;
}

- (BOOL)hasText
{
  id v2 = [(VKCImageTextSelectionView_iOS *)self text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[VKTextRange alloc] initWithStart:v6 end:v5];

  return v7;
}

- (unint64_t)currentDraggedRectEdge
{
  id v2 = [(VKCImageTextSelectionView_iOS *)self interactionAssistant];
  if (objc_opt_respondsToSelector()) {
    unint64_t v3 = [v2 currentDraggedHandle];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)_textRangeForActions
{
  unint64_t v3 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  if (-[VKCImageTextSelectionView_iOS useFullDocumentRangeForEmptySelection](self, "useFullDocumentRangeForEmptySelection")&& [v3 isEmpty])
  {
    uint64_t v4 = [(VKCImageTextSelectionView *)self documentRange];

    unint64_t v3 = (void *)v4;
  }
  return v3;
}

- (BOOL)isImageBacked
{
  return 1;
}

- (id)_rvItemForSelectedRange
{
  unint64_t v3 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  uint64_t v4 = [v3 nsRange];
  id v6 = -[VKCImageTextSelectionView_iOS _rvItemInRange:](self, "_rvItemInRange:", v4, v5);

  return v6;
}

- (id)_rvItemInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_alloc(MEMORY[0x1E4F962F0]);
  id v7 = [(VKCImageTextSelectionView_iOS *)self text];
  int v8 = objc_msgSend(v6, "initWithText:selectedRange:", v7, location, length);

  objc_super v9 = [(VKCImageTextSelectionView *)self textQueryProvider];
  [v8 setTextQueryProvider:v9];

  return v8;
}

+ (BOOL)processHasSnapshotDragEntitlement
{
  if (processHasSnapshotDragEntitlement_onceToken != -1) {
    dispatch_once(&processHasSnapshotDragEntitlement_onceToken, &__block_literal_global_35);
  }
  return processHasSnapshotDragEntitlement_sHasEntitlement;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  if (([(id)objc_opt_class() processHasSnapshotDragEntitlement] & 1) != 0
    || ([(VKCImageBaseOverlayView *)self analysisResult],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 request],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 hasImageData],
        v7,
        v6,
        v8))
  {
    objc_super v9 = [(VKCImageTextSelectionView_iOS *)self targetedDragPreviewForCurrentSelection];
  }
  else
  {
    objc_super v9 = [(VKCImageTextSelectionView_iOS *)self targetedDragPreviewWithLabelsForCurrentSelection];
  }
  return v9;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(VKCImageTextSelectionView *)self selectedText];
  [v5 locationInView:self];
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  id v11 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  long long v12 = [(VKCImageTextSelectionView *)self selectionRectsForRange:v11];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__VKCImageTextSelectionView_iOS_dragInteraction_itemsForBeginningSession___block_invoke;
  v24[3] = &__block_descriptor_48_e36_B32__0__UITextSelectionRect_8Q16_B24l;
  v24[4] = v8;
  v24[5] = v10;
  int v13 = objc_msgSend(v12, "vk_containsObjectPassingTest:", v24);

  if (v13 && [v6 length])
  {
    uint64_t v14 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
    id v15 = [(VKCImageTextSelectionView *)self attributedTextInRange:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F28D78]);
    v17 = [(VKCImageTextSelectionView *)self selectedText];
    v18 = (void *)[v16 initWithObject:v17];

    [v18 registerObject:v15 visibility:0];
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v18];
    v25[0] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  }
  else
  {
    double v20 = 0;
  }
  if (v20) {
    double v21 = v20;
  }
  else {
    double v21 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v22 = v21;

  return v22;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = self;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Beginning VisionKit Text Drag: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "VisionKit Text Drag Did End: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)targetedDragPreviewWithLabelsForCurrentSelection
{
  unint64_t v3 = [(VKCImageBaseOverlayView *)self recognitionResult];
  uint64_t v4 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  [(VKCImageBaseOverlayView *)self contentsRect];
  id v5 = objc_msgSend(v3, "selectionRectsForRange:documentView:contentRect:addTranscript:", v4, self, 1);

  int v6 = [(VKCImageTextSelectionView_iOS *)self selectedTextPathsConvertedToView:self];
  [v6 bounds];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [v6 bounds];
  double v19 = VKMCenterOfRect(v15, v16, v17, v18);
  double v21 = v20;
  id v22 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v6 bounds];
  uint64_t v23 = objc_msgSend(v22, "initWithFrame:");
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __81__VKCImageTextSelectionView_iOS_targetedDragPreviewWithLabelsForCurrentSelection__block_invoke;
  v31[3] = &unk_1E6BF3D60;
  uint64_t v33 = v8;
  uint64_t v34 = v10;
  uint64_t v35 = v12;
  uint64_t v36 = v14;
  id v32 = v23;
  id v24 = v23;
  [v5 enumerateObjectsUsingBlock:v31];
  id v25 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  uint64_t v26 = [MEMORY[0x1E4F428B8] clearColor];
  [v25 setBackgroundColor:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F42ED0]);
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42D00]), "initWithContainer:center:", self, v19, v21);
  uint64_t v29 = (void *)[v27 initWithView:v24 parameters:v25 target:v28];

  return v29;
}

- (id)targetedDragPreviewForCurrentSelection
{
  unint64_t v3 = [(VKCImageTextSelectionView *)self textSelectionDelegate];
  uint64_t v4 = [v3 viewForImageSnapshotForTextSelectionView:self];

  if (v4
    && ([(VKCImageBaseOverlayView *)self analysisResult],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasImageData],
        v5,
        (v6 & 1) == 0))
  {
    uint64_t v7 = [(VKCImageTextSelectionView_iOS *)self selectedTextPathsConvertedToView:v4];
    [v7 bounds];
    CGFloat v15 = objc_msgSend(v4, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
    [v7 bounds];
    double v28 = VKMCenterOfRect(v24, v25, v26, v27);
    double v30 = v29;
    [v7 bounds];
    CGFloat v32 = -v31;
    [v7 bounds];
    CGAffineTransformMakeTranslation(&v37, v32, -v33);
    objc_msgSend(v7, "vk_applyTransform:", &v37);
    id v17 = objc_alloc_init(MEMORY[0x1E4F429B0]);
    [v17 setVisiblePath:v7];
    id v34 = objc_alloc(MEMORY[0x1E4F42ED0]);
    uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42D00]), "initWithContainer:center:", self, v28, v30);
    uint64_t v23 = (void *)[v34 initWithView:v15 parameters:v17 target:v35];
  }
  else
  {
    uint64_t v7 = [(VKCImageTextSelectionView_iOS *)self selectedTextPathsConvertedToView:self];
    [v7 bounds];
    double v12 = VKMCenterOfRect(v8, v9, v10, v11);
    double v14 = v13;
    CGFloat v15 = [(VKCImageBaseOverlayView *)self normalizedPathFromViewPath:v7];
    CGFloat v16 = [(VKCImageBaseOverlayView *)self analysisResult];
    [v15 bounds];
    objc_msgSend(v16, "imageFromNormalizedSubrect:");
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    CGFloat v18 = objc_msgSend(v17, "vk_imageView");
    [v18 bounds];
    double v19 = objc_msgSend(v15, "vk_pathByFittingToRect:");
    id v20 = objc_alloc_init(MEMORY[0x1E4F429B0]);
    [v20 setVisiblePath:v19];
    id v21 = objc_alloc(MEMORY[0x1E4F42ED0]);
    id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42D00]), "initWithContainer:center:", self, v12, v14);
    uint64_t v23 = (void *)[v21 initWithView:v18 parameters:v20 target:v22];
  }
  return v23;
}

- (id)selectedTextPathsConvertedToView:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageTextSelectionView_iOS *)self selectedVKRange];
  char v6 = [(VKCImageTextSelectionView *)self selectionRectsForRange:v5];

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __66__VKCImageTextSelectionView_iOS_selectedTextPathsConvertedToView___block_invoke;
  double v14 = &unk_1E6BF3D88;
  id v15 = v4;
  CGFloat v16 = self;
  id v7 = v4;
  CGFloat v8 = objc_msgSend(v6, "vk_compactMap:", &v11);
  CGFloat v9 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_groupAndRoundPaths:radius:offset:", v8, 0.0, 0.0, v11, v12, v13, v14);

  return v9;
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 0;
}

- (BOOL)_scribbleInteractionShouldDisableInputAssistant:(id)a3
{
  return 1;
}

- (id)_accessibilityUserTestingChildren
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  accessibilityElements = self->_accessibilityElements;
  if (!accessibilityElements)
  {
    v49 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [(VKCImageBaseOverlayView *)self recognitionResult];
    id v5 = [v4 sourceVNDocument];

    v51 = v5;
    objc_msgSend(v5, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v61;
      double v9 = *MEMORY[0x1E4F1DB20];
      double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      uint64_t v44 = *(void *)v61;
      do
      {
        uint64_t v13 = 0;
        uint64_t v45 = v7;
        do
        {
          if (*(void *)v61 != v8) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v60 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v48 = v13;
            id v15 = v14;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v47 = v15;
            id v50 = [v15 getChildren];
            uint64_t v16 = [v50 countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v57;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v57 != v18) {
                    objc_enumerationMutation(v50);
                  }
                  id v20 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                  id v21 = [v20 string];
                  uint64_t v22 = [v21 length];

                  if (v22)
                  {
                    uint64_t v23 = [v51 rangeOfTextBlock:v20];
                    CGFloat v25 = +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v23, v24);
                    CGFloat v26 = [(VKCImageTextSelectionView *)self selectionRectsForRange:v25];
                    long long v52 = 0u;
                    long long v53 = 0u;
                    long long v54 = 0u;
                    long long v55 = 0u;
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v64 count:16];
                    double height = v12;
                    double width = v11;
                    double y = v10;
                    double x = v9;
                    if (v27)
                    {
                      uint64_t v32 = v27;
                      uint64_t v33 = *(void *)v53;
                      double height = v12;
                      double width = v11;
                      double y = v10;
                      double x = v9;
                      do
                      {
                        for (uint64_t j = 0; j != v32; ++j)
                        {
                          if (*(void *)v53 != v33) {
                            objc_enumerationMutation(v26);
                          }
                          [*(id *)(*((void *)&v52 + 1) + 8 * j) rect];
                          v72.origin.double x = v35;
                          v72.origin.double y = v36;
                          v72.size.double width = v37;
                          v72.size.double height = v38;
                          v69.origin.double x = x;
                          v69.origin.double y = y;
                          v69.size.double width = width;
                          v69.size.double height = height;
                          CGRect v70 = CGRectUnion(v69, v72);
                          double x = v70.origin.x;
                          double y = v70.origin.y;
                          double width = v70.size.width;
                          double height = v70.size.height;
                        }
                        uint64_t v32 = [v26 countByEnumeratingWithState:&v52 objects:v64 count:16];
                      }
                      while (v32);
                    }
                    v71.origin.double x = x;
                    v71.origin.double y = y;
                    v71.size.double width = width;
                    v71.size.double height = height;
                    if (!CGRectIsEmpty(v71))
                    {
                      v39 = [[VKCImageTextSelectionViewAccessibilityElement alloc] initWithAccessibilityContainer:self];
                      v40 = [v20 string];
                      [(VKCImageTextSelectionViewAccessibilityElement *)v39 setAccessibilityValue:v40];

                      -[VKCImageTextSelectionViewAccessibilityElement setAccessibilityFrameInContainerSpace:](v39, "setAccessibilityFrameInContainerSpace:", x, y, width, height);
                      [v49 addObject:v39];
                    }
                  }
                }
                uint64_t v17 = [v50 countByEnumeratingWithState:&v56 objects:v65 count:16];
              }
              while (v17);
            }

            uint64_t v8 = v44;
            uint64_t v7 = v45;
            uint64_t v13 = v48;
          }
          ++v13;
        }
        while (v13 != v7);
        uint64_t v7 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v7);
    }
    v41 = (NSArray *)[v49 copy];
    v42 = self->_accessibilityElements;
    self->_accessibilityElements = v41;

    accessibilityElements = self->_accessibilityElements;
  }
  return accessibilityElements;
}

- (void)suppressSelectionViewGrabbers
{
  unint64_t v3 = [(VKCImageTextSelectionView_iOS *)self interactionAssistant];
  id v4 = [v3 selectionView];
  id v5 = [v4 obtainGrabberSuppressionAssertion];
  [(VKCImageTextSelectionView_iOS *)self setTextSelectionGrabberSuppression:v5];

  id v7 = [(VKCImageTextSelectionView_iOS *)self interactionAssistant];
  uint64_t v6 = [v7 selectionView];
  [v6 layoutChangedByScrolling:0];
}

- (void)unsuppressSelectionViewGrabbers
{
}

- (UITextInputDelegate)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  return (UITextInputDelegate *)WeakRetained;
}

- (UITextInputStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
}

- (NSDictionary)markedTextStyle
{
  return self->_markedTextStyle;
}

- (void)setMarkedTextStyle:(id)a3
{
}

- (UITextRange)markedTextRange
{
  return self->_markedTextRange;
}

- (int64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(int64_t)a3
{
  self->_selectionAffinitdouble y = a3;
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)objc_getProperty(self, a2, 672, 1);
}

- (NSArray)accessibilityElements
{
  return self->_accessibilityElements;
}

- (BOOL)useFullDocumentRangeForEmptySelection
{
  return self->_useFullDocumentRangeForEmptySelection;
}

- (void)setUseFullDocumentRangeForEmptySelection:(BOOL)a3
{
  self->_useFullDocumentRangeForEmptySelection = a3;
}

- (UITextInteraction)textInteraction
{
  return self->_textInteraction;
}

- (void)setTextInteraction:(id)a3
{
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
}

- (BOOL)beginSelectionChangedCalled
{
  return self->_beginSelectionChangedCalled;
}

- (void)setBeginSelectionChangedCalled:(BOOL)a3
{
  self->_beginSelectionChangedCalled = a3;
}

- (BOOL)manuallySettingSelectedRange
{
  return self->_manuallySettingSelectedRange;
}

- (void)setManuallySettingSelectedRange:(BOOL)a3
{
  self->_manuallySettingSelectedRange = a3;
}

- (unint64_t)draggedRectEdge
{
  return self->_draggedRectEdge;
}

- (void)setDraggedRectEdge:(unint64_t)a3
{
  self->_draggedRectEdge = a3;
}

- (VKTextRange)preSelectionChangeSelectedRange
{
  return self->_preSelectionChangeSelectedRange;
}

- (void)setPreSelectionChangeSelectedRange:(id)a3
{
}

- (VKCTextPointerTrackingView)textPointerTrackingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textPointerTrackingView);
  return (VKCTextPointerTrackingView *)WeakRetained;
}

- (void)setTextPointerTrackingView:(id)a3
{
}

- (VKCTextSelectionLongPressDelegateHandler)longPressHandler
{
  return self->_longPressHandler;
}

- (void)setLongPressHandler:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGR
{
  return self->_longPressGR;
}

- (void)setLongPressGR:(id)a3
{
}

- (BOOL)initializationComplete
{
  return self->_initializationComplete;
}

- (void)setInitializationComplete:(BOOL)a3
{
  self->_initializationComplete = a3;
}

- (UITextSelectionGrabberSuppressionAssertion)textSelectionGrabberSuppression
{
  return self->_textSelectionGrabberSuppression;
}

- (void)setTextSelectionGrabberSuppression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSelectionGrabberSuppression, 0);
  objc_storeStrong((id *)&self->_longPressGR, 0);
  objc_storeStrong((id *)&self->_longPressHandler, 0);
  objc_destroyWeak((id *)&self->_textPointerTrackingView);
  objc_storeStrong((id *)&self->_preSelectionChangeSelectedRange, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_textInteraction, 0);
  objc_storeStrong((id *)&self->_accessibilityElements, 0);
  objc_storeStrong((id *)&self->_selectedTextRange, 0);
  objc_storeStrong((id *)&self->_markedTextRange, 0);
  objc_storeStrong((id *)&self->_markedTextStyle, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
}

@end