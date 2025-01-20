@interface ICAttachmentView
- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityTextOperationAction:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)alertAboutUnsupportedAttachmentIfNecessary;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)finishedInit;
- (BOOL)forManualRendering;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)icaxIsTextRangeSelected;
- (BOOL)icaxSelectAttachmentTextRangeAction;
- (BOOL)insideSystemPaper;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldAddMenuLongPressGesture;
- (BOOL)shouldAddPanGesture;
- (BOOL)shouldAddTapGesture;
- (BOOL)showRecoverNoteAlertIfNecessary;
- (BOOL)wantsContextMenuPreview;
- (ICAttachmentView)initWithAttachment:(id)a3 textContainer:(id)a4 actionWindow:(id)a5;
- (ICAttachmentView)initWithCoder:(id)a3;
- (ICAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6;
- (ICAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5;
- (ICAttachmentViewDelegate)delegate;
- (ICTextView)textView;
- (NSArray)supportedRotorTypes;
- (NSString)icaxAttachmentViewTypeDescription;
- (NSString)icaxHintString;
- (NSTextContainer)textContainer;
- (UIContextMenuInteraction)contextInteraction;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIWindow)actionWindow;
- (_NSRange)textRangeInNote;
- (id)_accessibilityTextOperations;
- (id)_icaxParentTextView;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuPreviewController;
- (id)makeAudioMenu;
- (id)makeMainMenu;
- (id)makePlaybackMenu;
- (id)makeRecordingMenu;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)shareFeedbackMenu;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)dataOwnerForAttachment;
- (void)_copy;
- (void)appendRecording:(id)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)copy:(id)a3;
- (void)copyWithCompletionBlock:(id)a3;
- (void)createImage:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)didMoveToWindow;
- (void)didTapAttachment:(id)a3;
- (void)editAttachmentWithBlock:(id)a3;
- (void)icaxActivate;
- (void)icaxSelectAttachmentTextRange:(BOOL)a3;
- (void)notifyDidMoveToWindow;
- (void)openAttachment;
- (void)playFromBeginning:(id)a3;
- (void)removeFromSuperview;
- (void)rename:(id)a3;
- (void)reportAConcern:(id)a3 withPositiveFeedback:(BOOL)a4;
- (void)requestEditorFirstResponder;
- (void)respondToPanGesture:(id)a3;
- (void)respondToTapGesture:(id)a3;
- (void)saveToFiles:(id)a3;
- (void)setActionWindow:(id)a3;
- (void)setContextInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFinishedInit:(BOOL)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setupEventHandling;
- (void)share:(id)a3;
- (void)shareWebLink:(id)a3;
- (void)sharedInit:(BOOL)a3;
- (void)updateFirstResponder;
- (void)updatePreferredAttachmentViewSize:(signed __int16)a3;
- (void)viewSummary:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation ICAttachmentView

- (void)setDelegate:(id)a3
{
}

- (void)setupEventHandling
{
  if ([(ICAttachmentView *)self shouldAddTapGesture])
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_respondToTapGesture_];
    [v3 setDelegate:self];
    [v3 setNumberOfTapsRequired:1];
    [(ICAttachmentView *)self addGestureRecognizer:v3];
  }
  if ([(ICAttachmentView *)self shouldAddMenuLongPressGesture])
  {
    v4 = [(ICAttachmentView *)self contextInteraction];

    if (!v4)
    {
      v5 = (void *)[objc_alloc(MEMORY[0x263F82628]) initWithDelegate:self];
      [(ICAttachmentView *)self setContextInteraction:v5];

      v6 = [(ICAttachmentView *)self contextInteraction];
      [(ICAttachmentView *)self addInteraction:v6];

      v7 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_respondToLongPressGesture_];
      [(ICAttachmentView *)self addGestureRecognizer:v7];
    }
  }
  if ([(ICAttachmentView *)self shouldAddPanGesture])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel_respondToPanGesture_];
    [v8 setMaximumNumberOfTouches:1];
    [v8 setDelegate:self];
    [(ICAttachmentView *)self addGestureRecognizer:v8];
    [(ICAttachmentView *)self setPanGestureRecognizer:v8];
  }
  id v9 = (id)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:self];
  [(ICAttachmentView *)self addInteraction:v9];
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (BOOL)shouldAddTapGesture
{
  return 1;
}

- (BOOL)shouldAddPanGesture
{
  return 0;
}

- (BOOL)shouldAddMenuLongPressGesture
{
  return 1;
}

- (void)setContextInteraction:(id)a3
{
}

- (ICAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  return -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, "initWithFrame:textAttachment:textContainer:forManualRendering:", a3, a4, a5, 0.0, 0.0, 300.0, 100.0);
}

- (void)sharedInit:(BOOL)a3
{
}

- (ICAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICAttachmentView;
  v15 = -[ICAttachmentView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_textContainer, v14);
    v16->_finishedInit = 1;
    v16->_forManualRendering = a6;
    v17 = [v13 attachment];
    -[ICAttachmentView sharedInit:](v16, "sharedInit:", [v17 preferredViewSize] == 1);

    [(ICAttachmentView *)v16 setupEventHandling];
    [(ICAttachmentView *)v16 setupConstraints];
    [(ICAttachmentView *)v16 setTextAttachment:v13];
    v18 = [v13 attachment];
    [(ICAttachmentView *)v16 setAttachment:v18];

    if (objc_opt_respondsToSelector()) {
      [(ICAttachmentView *)v16 app_updateViewAnnotation];
    }
  }

  return v16;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (void)willMoveToSuperview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentView;
  -[ICAttachmentView willMoveToSuperview:](&v8, sel_willMoveToSuperview_);
  if (!a3)
  {
    v5 = [(ICAttachmentView *)self textView];
    v6 = [v5 nextResponderOverride];

    if (v6 == self)
    {
      v7 = [(ICAttachmentView *)self textView];
      [v7 setNextResponderOverride:0];
    }
  }
}

- (NSString)icaxHintString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Double tap to expand" value:&stru_26C10E100 table:0];

  return (NSString *)v3;
}

- (BOOL)icaxIsTextRangeSelected
{
  uint64_t v3 = [(ICAttachmentView *)self textRangeInNote];
  uint64_t v5 = v4;
  v6 = [(ICAttachmentView *)self _icaxParentTextView];
  BOOL v9 = v3 == [v6 selectedRange] && v5 == v7;

  return v9;
}

- (NSArray)supportedRotorTypes
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"ICAccessibilityRotorTypeAttachments";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (_NSRange)textRangeInNote
{
  uint64_t v3 = [(ICAttachmentView *)self attachment];
  uint64_t v4 = [v3 note];
  uint64_t v5 = [(ICAttachmentView *)self attachment];
  uint64_t v6 = [v4 rangeForAttachment:v5];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityContainer
{
  v7.receiver = self;
  v7.super_class = (Class)ICAttachmentView;
  id v2 = [(ICAttachmentView *)&v7 accessibilityContainer];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
    while (![v4 conformsToProtocol:&unk_26C1E88C8])
    {
      uint64_t v5 = [v4 accessibilityContainer];

      id v4 = (id)v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    id v4 = v4;

    uint64_t v3 = v4;
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:

  return v3;
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"attachment" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityHint
{
  uint64_t v3 = [(ICAttachmentView *)self attachment];
  uint64_t v4 = [v3 note];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(ICAttachmentView *)self attachment];
    objc_super v7 = [v6 note];
    int v8 = [v7 isEditable];

    if (v8)
    {
      NSUInteger v9 = [(ICAttachmentView *)self icaxHintString];
      goto LABEL_6;
    }
  }
  else
  {
  }
  NSUInteger v9 = 0;
LABEL_6:

  return v9;
}

- (id)accessibilityValue
{
  id v2 = [(ICAttachmentView *)self attachment];
  uint64_t v3 = [v2 title];

  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v3 = [(ICAttachmentView *)self _icaxParentTextView];
  uint64_t v4 = [(ICAttachmentView *)self attachment];
  uint64_t v5 = [v4 note];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)v5;
  objc_super v7 = [(ICAttachmentView *)self attachment];
  int v8 = [v7 note];
  if ([v8 isEditable])
  {

LABEL_4:
    goto LABEL_5;
  }
  NSUInteger v9 = [(ICAttachmentView *)self attachment];
  NSUInteger v10 = [v9 note];
  int v11 = [v10 isDeletedOrInTrash];

  if (v11)
  {
    v12 = [v3 editorController];
    [v12 showRecoverNoteAlert];
LABEL_11:

    goto LABEL_12;
  }
LABEL_5:
  if (([v3 isFirstResponder] & 1) == 0
    && ![(ICAttachmentView *)self accessibilityElementIsFocused])
  {
    v12 = [(ICAttachmentView *)self attachment];
    [v3 icaxBeginEditingAtAttachment:v12];
    goto LABEL_11;
  }
  [(ICAttachmentView *)self icaxActivate];
LABEL_12:

  return 1;
}

- (id)_accessibilityTextOperations
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentView;
  uint64_t v4 = [(ICAttachmentView *)&v9 _accessibilityTextOperations];
  [v3 axSafelyAddObjectsFromArray:v4];

  if ([(ICAttachmentView *)self canPerformAction:sel_share_ withSender:0])
  {
    uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"Share Attachment" value:&stru_26C10E100 table:0];
    [v3 addObject:v6];
  }
  objc_super v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"Share Attachment" value:&stru_26C10E100 table:0];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    [(ICAttachmentView *)self share:0];
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICAttachmentView;
    BOOL v8 = [(ICAttachmentView *)&v10 _accessibilityTextOperationAction:v4];
  }

  return v8;
}

- (id)accessibilityCustomActions
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v11.receiver = self;
  v11.super_class = (Class)ICAttachmentView;
  id v4 = [(ICAttachmentView *)&v11 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  if (![(ICAttachmentView *)self icaxIsTextRangeSelected])
  {
    id v5 = objc_alloc(MEMORY[0x263F823A0]);
    uint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
    int v7 = [v6 localizedStringForKey:@"Select" value:&stru_26C10E100 table:0];
    BOOL v8 = (void *)[v5 initWithName:v7 target:self selector:sel_icaxSelectAttachmentTextRangeAction];

    [v3 addObject:v8];
  }
  objc_super v9 = (void *)[v3 copy];

  return v9;
}

- (id)accessibilityCustomRotors
{
  id v2 = [(ICAttachmentView *)self _icaxParentTextView];
  uint64_t v3 = [v2 editorController];
  id v4 = +[ICAccessibilityCustomRotorController sharedInstance];
  [v4 setNoteEditorViewController:v3];

  id v5 = +[ICAccessibilityCustomRotorController sharedInstance];
  uint64_t v6 = [v5 sharedTextViewRotors];

  return v6;
}

- (id)_icaxParentTextView
{
  id v2 = [(ICAttachmentView *)self superview];
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      id v2 = v3;
      if (!v3) {
        goto LABEL_7;
      }
    }
    objc_opt_class();
    uint64_t v3 = ICDynamicCast();
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_7:

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  id v2 = [(ICAttachmentView *)self _icaxParentTextView];
  uint64_t v3 = [v2 accessibilityDragSourceDescriptors];

  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  id v2 = [(ICAttachmentView *)self _icaxParentTextView];
  uint64_t v3 = [v2 accessibilityDropPointDescriptors];

  return v3;
}

- (BOOL)icaxSelectAttachmentTextRangeAction
{
  return 1;
}

- (void)icaxSelectAttachmentTextRange:(BOOL)a3
{
  BOOL v3 = a3;
  id v16 = [(ICAttachmentView *)self _icaxParentTextView];
  id v5 = [v16 editorController];
  uint64_t v6 = [(ICAttachmentView *)self textRangeInNote];
  uint64_t v8 = v7;
  _UIAccessibilityBlockPostingOfAllNotifications();
  if (v5)
  {
    if (([v5 isEditing] & 1) == 0)
    {
      objc_super v9 = [v5 note];
      int v10 = [v9 isEditable];

      if (v10) {
        [v5 startEditing];
      }
    }
  }
  [v16 select:v16];
  objc_msgSend(v16, "setSelectedRange:", v6, v8);
  objc_msgSend(v16, "scrollRangeToVisible:", v6, v8);
  _UIAccessibilityUnblockPostingOfAllNotifications();
  if (v3)
  {
    objc_super v11 = [MEMORY[0x263F086E0] mainBundle];
    v12 = [v11 localizedStringForKey:@"Selected %@. Use the actions rotor to start dragging." value:&stru_26C10E100 table:0];

    id v13 = NSString;
    id v14 = [(ICAttachmentView *)self accessibilityLabel];
    v15 = objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);

    UIAccessibilityPostNotification(*MEMORY[0x263F83188], v15);
  }
}

- (NSString)icaxAttachmentViewTypeDescription
{
  BOOL v3 = [(ICAttachmentView *)self textAttachment];
  int v4 = [v3 supportsMultiplePresentationSizes];

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = [(ICAttachmentView *)self attachment];
  int v6 = [v5 preferredViewSize];

  if (v6 == 2)
  {
    uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v8 = v7;
    objc_super v9 = @"medium";
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v8 = v7;
    objc_super v9 = @"thumbnail";
    goto LABEL_9;
  }
  if (v6)
  {
LABEL_6:
    int v10 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v8 = v7;
  objc_super v9 = @"large";
LABEL_9:
  int v10 = [v7 localizedStringForKey:v9 value:&stru_26C10E100 table:0];

LABEL_10:

  return (NSString *)v10;
}

- (BOOL)insideSystemPaper
{
  objc_opt_class();
  BOOL v3 = [(ICAttachmentView *)self textContainer];
  int v4 = ICDynamicCast();

  LOBYTE(v3) = [v4 insideSystemPaper];
  return (char)v3;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentView;
  [(ICAttachmentView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v5[1] = *MEMORY[0x263EF8340];
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentView;
  [(ICAttachmentView *)&v4 didMoveToWindow];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_notifyDidMoveToWindow object:0];
  v5[0] = *MEMORY[0x263EFF588];
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [(ICAttachmentView *)self performSelector:sel_notifyDidMoveToWindow withObject:0 afterDelay:v3 inModes:0.0];
}

- (void)notifyDidMoveToWindow
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"ICAttachmentViewDidMoveToWindowNotification" object:self];
}

- (ICAttachmentView)initWithAttachment:(id)a3 textContainer:(id)a4 actionWindow:(id)a5
{
  id v9 = a5;
  int v10 = (void *)MEMORY[0x263F5B4D0];
  id v11 = a4;
  v12 = [v10 textAttachmentWithAttachment:a3];
  id v13 = -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, "initWithFrame:textAttachment:textContainer:forManualRendering:", v12, v11, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  if (v13) {
    objc_storeStrong((id *)&v13->_actionWindow, a5);
  }

  return v13;
}

- (ICAttachmentView)initWithCoder:(id)a3
{
  return [(ICAttachmentView *)self initWithTextAttachment:0 textContainer:0 forManualRendering:0];
}

- (UIWindow)actionWindow
{
  actionWindow = self->_actionWindow;
  if (actionWindow)
  {
    id v3 = actionWindow;
  }
  else
  {
    id v3 = [(ICAttachmentView *)self window];
  }

  return v3;
}

- (ICTextView)textView
{
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    id v3 = [(ICAttachmentView *)self textContainer];
    objc_super v4 = ICCheckedDynamicCast();
    [v4 tk2TextView];
  }
  else
  {
    objc_opt_class();
    id v3 = [(ICAttachmentView *)self superview];
    objc_super v4 = [v3 superview];
    ICDynamicCast();
  id v5 = };

  return (ICTextView *)v5;
}

- (void)didTapAttachment:(id)a3
{
  if ([(ICAttachmentView *)self alertAboutUnsupportedAttachmentIfNecessary])
  {
    return;
  }
  id v11 = [(ICAttachmentView *)self attachment];
  if ([v11 hasFallbackPDF])
  {

LABEL_6:
    uint64_t v8 = [(ICAttachmentView *)self attachment];
    id v9 = [v8 media];

    if ([v9 isPasswordProtected])
    {
      int v10 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__ICAttachmentView_didTapAttachment___block_invoke;
      block[3] = &unk_2640B8140;
      block[4] = self;
      dispatch_async(v10, block);
    }
    else
    {
      [(ICAttachmentView *)self openAttachment];
    }

    return;
  }
  objc_super v4 = [(ICAttachmentView *)self attachment];
  id v5 = [v4 attachmentModel];
  if ([v5 isReadyToPresent])
  {
    int v6 = [(ICAttachmentView *)self attachment];
    char v7 = [v6 isUnsupported];

    if (v7) {
      return;
    }
    goto LABEL_6;
  }
}

void __37__ICAttachmentView_didTapAttachment___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ICAttachmentView_didTapAttachment___block_invoke_2;
  block[3] = &unk_2640B8140;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __37__ICAttachmentView_didTapAttachment___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) openAttachment];
}

- (BOOL)alertAboutUnsupportedAttachmentIfNecessary
{
  id v3 = [(ICAttachmentView *)self attachment];
  int v4 = [v3 isUnsupported];
  if (!v4)
  {
LABEL_10:

    return v4;
  }
  id v5 = [(ICAttachmentView *)self attachment];
  if ([v5 isPasswordProtected])
  {

LABEL_6:
    uint64_t v8 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1)
    {
      int v10 = [MEMORY[0x263F086E0] mainBundle];
      [v10 localizedStringForKey:@"iPadOS" value:&stru_26C10E100 table:0];
    }
    else
    {
      int v10 = [MEMORY[0x263F82670] currentDevice];
      [v10 systemName];
    id v3 = };

    id v11 = [MEMORY[0x263F086E0] mainBundle];
    v12 = [v11 localizedStringForKey:@"Unsupported Attachment" value:&stru_26C10E100 table:0];

    id v13 = NSString;
    id v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [v14 localizedStringForKey:@"Editing this attachment is not supported on this device. To edit it, upgrade to the latest version of %@.", &stru_26C10E100, 0 value table];
    id v16 = objc_msgSend(v13, "localizedStringWithFormat:", v15, v3);

    v17 = (void *)MEMORY[0x263F82418];
    v18 = [(ICAttachmentView *)self window];
    v19 = [v18 rootViewController];
    objc_msgSend(v17, "ic_showAlertWithTitle:message:viewController:", v12, v16, v19);

    goto LABEL_10;
  }
  int v6 = [(ICAttachmentView *)self attachment];
  char v7 = [v6 hasFallbackPDF];

  if ((v7 & 1) == 0) {
    goto LABEL_6;
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (void)openAttachment
{
  id v3 = [(ICAttachmentView *)self delegate];

  if (v3)
  {
    id v6 = [(ICAttachmentView *)self delegate];
    int v4 = [(ICAttachmentView *)self attachment];
    [v6 attachmentView:self shouldPresentAttachment:v4];
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BE60000, v5, OS_LOG_TYPE_INFO, "Trying to present attachment for attachment view without a delegate", buf, 2u);
    }
  }
}

- (void)updatePreferredAttachmentViewSize:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(ICAttachmentView *)self attachment];
  [v5 setPreferredViewSize:v3];

  id v7 = [(ICAttachmentView *)self attachment];
  id v6 = [v7 managedObjectContext];
  objc_msgSend(v6, "ic_save");
}

- (BOOL)showRecoverNoteAlertIfNecessary
{
  uint64_t v3 = [(ICAttachmentView *)self attachment];
  int v4 = [v3 note];

  if (v4 && ([v4 isEditable] & 1) == 0 && objc_msgSend(v4, "isDeletedOrInTrash"))
  {
    id v5 = [(ICAttachmentView *)self textView];
    id v6 = [v5 editorController];
    [v6 showRecoverNoteAlert];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)requestEditorFirstResponder
{
  if ([(ICAttachmentView *)self isFirstResponder])
  {
    [(ICAttachmentView *)self updateFirstResponder];
  }
}

- (void)updateFirstResponder
{
  uint64_t v3 = [(ICAttachmentView *)self textView];
  int v4 = [v3 editorController];
  int v5 = [v4 canBecomeFirstResponder];

  if (v5)
  {
    id v7 = [(ICAttachmentView *)self textView];
    id v6 = [v7 editorController];
    [v6 becomeFirstResponder];
  }
}

- (void)playFromBeginning:(id)a3
{
  int v4 = [(ICAttachmentView *)self attachment];
  int v5 = [v4 attachmentType];

  if (v5 == 4)
  {
    id v9 = [(ICAttachmentView *)self textView];
    id v6 = [v9 editorController];
    id v7 = [v6 audioAttachmentEditorCoordinator];
    uint64_t v8 = [(ICAttachmentView *)self attachment];
    [v7 playFromBeginning:v8];
  }
}

- (void)viewSummary:(id)a3
{
  int v4 = [(ICAttachmentView *)self attachment];
  int v5 = [v4 attachmentType];

  if (v5 == 4)
  {
    id v9 = [(ICAttachmentView *)self textView];
    id v6 = [v9 editorController];
    id v7 = [v6 audioAttachmentEditorCoordinator];
    uint64_t v8 = [(ICAttachmentView *)self attachment];
    [v7 presentSummaryFor:v8];
  }
}

- (void)appendRecording:(id)a3
{
  int v4 = [(ICAttachmentView *)self attachment];
  int v5 = [v4 attachmentType];

  if (v5 == 4)
  {
    id v9 = [(ICAttachmentView *)self textView];
    id v6 = [v9 editorController];
    id v7 = [v6 audioAttachmentEditorCoordinator];
    uint64_t v8 = [(ICAttachmentView *)self attachment];
    [v7 appendTo:v8];
  }
}

- (void)reportAConcern:(id)a3 withPositiveFeedback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ICAttachmentView *)self attachment];
  int v7 = [v6 attachmentType];

  if (v7 == 4)
  {
    id v11 = [(ICAttachmentView *)self textView];
    uint64_t v8 = [v11 editorController];
    id v9 = [v8 audioAttachmentEditorCoordinator];
    int v10 = [(ICAttachmentView *)self attachment];
    [v9 presentReportAConcernFor:v10 withPositiveFeedback:v4];
  }
}

- (void)rename:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x263F3AA40]);
  id v6 = [(ICAttachmentView *)self attachment];
  int v7 = [v6 title];
  uint64_t v8 = (void *)[v5 initWithExistingTitle:v7];

  id v9 = [(ICAttachmentView *)self actionWindow];
  int v10 = [v9 rootViewController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __27__ICAttachmentView_rename___block_invoke;
  v11[3] = &unk_2640BBA98;
  objc_copyWeak(&v12, &location);
  [v8 showFromViewController:v10 completion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __27__ICAttachmentView_rename___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [ICDocCamScannedDocumentEditor alloc];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = [WeakRetained attachment];
    int v7 = [(ICDocCamScannedDocumentEditor *)v4 initWithGalleryAttachment:v6];

    [(ICDocCamScannedDocumentEditor *)v7 updateDocumentTitle:v3 isUserDefined:1];
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  [v8 updateFirstResponder];
}

- (void)createImage:(id)a3
{
  if (ICInternalSettingsShouldShowImageGenerationUI())
  {
    id v5 = [(ICAttachmentView *)self textView];
    id v4 = [v5 editorController];
    [v4 createImage:self];
  }
}

- (void)saveToFiles:(id)a3
{
  id v4 = [(ICAttachmentView *)self attachment];
  int v5 = [v4 attachmentType];

  if (v5 == 4)
  {
    id v9 = [(ICAttachmentView *)self textView];
    id v6 = [v9 editorController];
    int v7 = [v6 audioAttachmentEditorCoordinator];
    id v8 = [(ICAttachmentView *)self attachment];
    [v7 presentExportViewForAttachment:v8];
  }
}

- (void)share:(id)a3
{
  id v12 = a3;
  id v4 = [(ICAttachmentView *)self attachment];
  if ([v4 attachmentType] != 8) {
    goto LABEL_8;
  }
  int v5 = [(ICAttachmentView *)self attachment];
  if ([v5 isiTunes])
  {
LABEL_7:

LABEL_8:
LABEL_9:
    id v8 = [(ICAttachmentView *)self delegate];
    id v9 = [(ICAttachmentView *)self attachment];
    [v8 attachmentView:self shouldShareAttachment:v9];

    goto LABEL_10;
  }
  id v6 = [(ICAttachmentView *)self attachment];
  if ([v6 isAppStore])
  {
LABEL_6:

    goto LABEL_7;
  }
  int v7 = [(ICAttachmentView *)self attachment];
  if ([v7 isMap])
  {

    goto LABEL_6;
  }
  int v10 = [(ICAttachmentView *)self attachment];
  char v11 = [v10 isNews];

  if (v11) {
    goto LABEL_9;
  }
  [(ICAttachmentView *)self shareWebLink:v12];
LABEL_10:
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  int v7 = [(ICAttachmentView *)self attachment];
  int v8 = [v7 isUnsupported];

  if (v8)
  {
    if (sel_delete_ != a3)
    {
LABEL_3:
      id v9 = 0;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (sel_cut_ == a3 || sel_copy_ == a3 || sel_delete_ == a3) {
    goto LABEL_12;
  }
  if (sel_share_ == a3 || sel_rename_ == a3)
  {
    if (![(ICAttachmentView *)self canPerformAction:a3 withSender:v6]) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  id v14 = [(ICAttachmentView *)self textAttachment];
  int v15 = [v14 supportsMultiplePresentationSizes];

  id v9 = 0;
  if (v15)
  {
    if (sel_updatePreferredAttachmentViewSize_ == a3) {
LABEL_12:
    }
      id v9 = self;
  }
LABEL_13:

  return v9;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = self;
  int v7 = [(ICAttachmentView *)self attachment];
  int v8 = [v7 isUnsupported];
  if (v8)
  {
    id v4 = [(ICAttachmentView *)v6 attachment];
    if (([v4 hasFallbackPDF] & 1) == 0)
    {

      goto LABEL_23;
    }
  }
  id v9 = [(ICAttachmentView *)v6 attachment];
  uint64_t v10 = [v9 needsInitialFetchFromCloud];

  if (!v8)
  {

    if (!v10) {
      goto LABEL_7;
    }
LABEL_23:
    if (sel_delete_ != a3) {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    id v12 = [v11 note];
    LOBYTE(v6) = [v12 isEditable];
    goto LABEL_66;
  }

  if (v10) {
    goto LABEL_23;
  }
LABEL_7:
  if (sel_playFromBeginning_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    if ([v11 attachmentType] != 4) {
      goto LABEL_78;
    }
    id v12 = [(ICAttachmentView *)v6 attachment];
    id v13 = [MEMORY[0x263F5B240] sharedAudioController];
    int v15 = [v13 currentAttachment];
    LOBYTE(v6) = v12 == v15;
LABEL_29:

LABEL_65:
    goto LABEL_66;
  }
  if (sel_viewSummary_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    if ([v11 attachmentType] != 4) {
      goto LABEL_78;
    }
    id v12 = [(ICAttachmentView *)v6 attachment];
    id v13 = [v12 audioModel];
    id v14 = [v13 audioDocument];
    uint64_t v10 = [v14 transcriptAsPlainText];
    if ([(id)v10 length])
    {
      id v16 = [(ICAttachmentView *)v6 attachment];
      v17 = [MEMORY[0x263F5ABB8] currentAttachment];
      if (v16 == v17 && ![MEMORY[0x263F5ABB8] isPaused])
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        v18 = [MEMORY[0x263F5AE88] sharedInstance];
        LOBYTE(v6) = [v18 supportsGreymatter];
      }
      goto LABEL_63;
    }
    goto LABEL_45;
  }
  if (sel_reportAConcern_withPositiveFeedback_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    if ([v11 attachmentType] != 4) {
      goto LABEL_78;
    }
    id v12 = [MEMORY[0x263F5AE88] sharedInstance];
    if ([v12 supportsGreymatter])
    {
      id v13 = [(ICAttachmentView *)v6 attachment];
      id v14 = [v13 audioModel];
      uint64_t v10 = [v14 audioDocument];
      LOBYTE(v6) = [(id)v10 hasToplineSummary] != 0;
      goto LABEL_63;
    }
    goto LABEL_49;
  }
  if (sel_appendRecording_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    if ([v11 attachmentType] != 4) {
      goto LABEL_78;
    }
    id v12 = [(ICAttachmentView *)v6 attachment];
    id v13 = [MEMORY[0x263F5B240] sharedAudioController];
    id v14 = [v13 currentAttachment];
    if (v12 != v14
      || ([MEMORY[0x263F5B240] sharedAudioController],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          ([(id)v10 isPlaying] & 1) == 0))
    {
      v19 = [(ICAttachmentView *)v6 attachment];
      objc_super v20 = [v19 audioModel];
      v21 = [v20 audioDocument];
      if ([v21 isCallRecording])
      {

        LOBYTE(v6) = 0;
      }
      else
      {
        v23 = [MEMORY[0x263F5ABB8] currentAttachment];
        LOBYTE(v6) = v23 == 0;
      }
      if (v12 != v14) {
        goto LABEL_64;
      }
      goto LABEL_63;
    }
LABEL_45:
    LOBYTE(v6) = 0;
    goto LABEL_63;
  }
  if (sel_cut_ == a3 || sel_delete_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    id v12 = [v11 note];
    if ([v12 isEditable])
    {
      id v13 = [(ICAttachmentView *)v6 attachment];
      int v15 = [MEMORY[0x263F5ABB8] currentAttachment];
      LOBYTE(v6) = v13 != v15;
      goto LABEL_29;
    }
LABEL_49:
    LOBYTE(v6) = 0;
LABEL_66:

LABEL_67:
    return (char)v6;
  }
  if (sel_copy_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
  if (sel_saveToFiles_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([(ICAttachmentView *)v6 ic_isInSecureWindow] & 1) != 0)
    {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    if ([v11 attachmentType] == 4)
    {
      id v12 = [(ICAttachmentView *)v6 attachment];
      v22 = [MEMORY[0x263F5ABB8] currentAttachment];
      LOBYTE(v6) = v12 != v22;

      goto LABEL_66;
    }
LABEL_78:
    LOBYTE(v6) = 0;
    goto LABEL_67;
  }
  if (sel_share_ == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([(ICAttachmentView *)v6 ic_isInSecureWindow] & 1) != 0)
    {
      goto LABEL_24;
    }
LABEL_51:
    char v11 = [(ICAttachmentView *)v6 attachment];
    id v12 = [MEMORY[0x263F5ABB8] currentAttachment];
    LOBYTE(v6) = v11 != v12;
    goto LABEL_66;
  }
  if (sel_rename_ == a3)
  {
    char v11 = [(ICAttachmentView *)v6 attachment];
    if ([v11 supportsRenaming]
      && ([(ICAttachmentView *)v6 ic_isInSecureWindow] & 1) == 0)
    {
      id v12 = [(ICAttachmentView *)v6 attachment];
      if ([v12 attachmentType] == 11)
      {
        LOBYTE(v6) = 1;
        goto LABEL_66;
      }
      id v13 = [(ICAttachmentView *)v6 attachment];
      LOBYTE(v6) = [v13 attachmentType] == 4;
      goto LABEL_65;
    }
    goto LABEL_78;
  }
  if (sel_createImage_ == a3)
  {
    if (!ICInternalSettingsShouldShowImageGenerationUI()) {
      goto LABEL_24;
    }
    char v11 = [(ICAttachmentView *)v6 attachment];
    if ([v11 attachmentType] == 3)
    {
      id v12 = [(ICAttachmentView *)v6 attachment];
      id v13 = [v12 note];
      if ([v13 isEditable])
      {
        LODWORD(v6) = [(ICAttachmentView *)v6 ic_isInSecureWindow] ^ 1;
        goto LABEL_65;
      }
      goto LABEL_79;
    }
    goto LABEL_78;
  }
  if (sel_updatePreferredAttachmentViewSize_ == a3)
  {
    char v11 = [(ICAttachmentView *)v6 attachment];
    id v12 = [v11 note];
    if ([v12 isEditable])
    {
      id v13 = [(ICAttachmentView *)v6 textAttachment];
      if ([v13 supportsMultiplePresentationSizes])
      {
        id v14 = [(ICAttachmentView *)v6 textView];
        uint64_t v10 = [v14 editorController];
        LODWORD(v6) = [(id)v10 isEditingOnSystemPaper] ^ 1;
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
LABEL_79:
      LOBYTE(v6) = 0;
      goto LABEL_65;
    }
    goto LABEL_49;
  }
LABEL_24:
  LOBYTE(v6) = 0;
  return (char)v6;
}

- (void)editAttachmentWithBlock:(id)a3
{
  v18 = (void (**)(id, void *))a3;
  id v4 = [(ICAttachmentView *)self textView];
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 undoManager];
    int v7 = [(ICAttachmentView *)self attachment];
    int v8 = [v7 note];
    id v9 = [(ICAttachmentView *)self attachment];
    uint64_t v10 = [v8 rangeForAttachment:v9];
    uint64_t v12 = v11;

    [v6 beginUndoGrouping];
    id v13 = [v5 editorController];
    id v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v12);
    [v6 registerUndoWithTarget:v13 selector:sel_updateSelectionOnUndo_ object:v14];

    uint64_t v15 = [v5 selectedRange];
    uint64_t v17 = v16;
    objc_msgSend(v5, "setSelectedRange:", v10, v12);
    v18[2](v18, v5);
    objc_msgSend(v5, "setSelectedRange:", v15, v17);
    [v6 endUndoGrouping];
  }
}

- (void)cut:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __24__ICAttachmentView_cut___block_invoke;
  v6[3] = &unk_2640BBAC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICAttachmentView *)self editAttachmentWithBlock:v6];
}

void __24__ICAttachmentView_cut___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __24__ICAttachmentView_cut___block_invoke_2;
  v2[3] = &unk_2640B9510;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 copyWithCompletionBlock:v2];
}

uint64_t __24__ICAttachmentView_cut___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) delete:*(void *)(result + 40)];
  }
  return result;
}

- (void)copy:(id)a3
{
}

- (void)copyWithCompletionBlock:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F5B308];
  id v6 = [(ICAttachmentView *)self attachment];
  v15[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v8 = [(ICAttachmentView *)self actionWindow];
  id v9 = [(ICAttachmentView *)self actionWindow];
  uint64_t v10 = [v9 rootViewController];
  uint64_t v11 = objc_msgSend(v10, "ic_topViewController");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__ICAttachmentView_copyWithCompletionBlock___block_invoke;
  v13[3] = &unk_2640BBAE8;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v5 generatePDFsIfNecessaryForGalleryAttachments:v7 displayWindow:v8 presentingViewController:v11 completionHandler:v13];
}

uint64_t __44__ICAttachmentView_copyWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _copy];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (int64_t)dataOwnerForAttachment
{
  id v2 = [(ICAttachmentView *)self attachment];
  id v3 = [v2 note];
  id v4 = [v3 folder];
  id v5 = [v4 account];
  int v6 = [v5 isManaged];

  if (v6) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_copy
{
  id v3 = (void *)MEMORY[0x263F82A18];
  int64_t v4 = [(ICAttachmentView *)self dataOwnerForAttachment];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __25__ICAttachmentView__copy__block_invoke;
  v5[3] = &unk_2640B8140;
  v5[4] = self;
  [v3 _performAsDataOwner:v4 block:v5];
}

void __25__ICAttachmentView__copy__block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = [*(id *)(a1 + 32) attachment];
  int v4 = [v3 attachmentType];

  id v5 = [*(id *)(a1 + 32) attachment];
  int v6 = v5;
  if (v4 != 3)
  {
    uint64_t v10 = [v5 URL];

    if (!v10) {
      goto LABEL_8;
    }
    id v7 = [*(id *)(a1 + 32) attachment];
    int v8 = [(UIImage *)v7 URL];
    id v9 = (id *)MEMORY[0x263F1DD08];
    goto LABEL_6;
  }
  id v7 = [v5 image];

  if (v7)
  {
    int v8 = UIImagePNGRepresentation(v7);
    id v9 = (id *)MEMORY[0x263F1DC08];
LABEL_6:
    uint64_t v11 = [*v9 identifier];
    [v2 setObject:v8 forKeyedSubscript:v11];
  }
LABEL_8:
  id v12 = [*(id *)(a1 + 32) attachment];
  int v13 = [v12 attachmentType];

  if (v13 == 11)
  {
    id v14 = (void *)MEMORY[0x263F5B308];
    uint64_t v15 = [*(id *)(a1 + 32) attachment];
    uint64_t v16 = [v14 pdfURLForAttachment:v15];

    uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v16];
    v18 = [(id)*MEMORY[0x263F1DBF0] identifier];
    objc_msgSend(v2, "ic_setNonNilObject:forKey:", v17, v18);
  }
  v19 = [*(id *)(a1 + 32) attachment];
  objc_super v20 = [v19 pasteboardData];

  v21 = [v20 persistenceData];
  objc_msgSend(v2, "ic_setNonNilObject:forKey:", v21, *MEMORY[0x263F5AA90]);

  if (v2)
  {
    v22 = [MEMORY[0x263F82A18] generalPasteboard];
    v24[0] = v2;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [v22 setItems:v23];
  }
}

- (void)delete:(id)a3
{
  int v4 = [(ICAttachmentView *)self textView];
  if (v4)
  {
    id v20 = v4;
    int v5 = [(ICAttachmentView *)self isFirstResponder];
    int v6 = [v20 undoManager];
    id v7 = [(ICAttachmentView *)self attachment];
    int v8 = [v7 note];
    id v9 = [(ICAttachmentView *)self attachment];
    uint64_t v10 = [v8 rangeForAttachment:v9];
    uint64_t v12 = v11;

    [v6 beginUndoGrouping];
    int v13 = [v20 editorController];
    id v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v12);
    [v6 registerUndoWithTarget:v13 selector:sel_updateSelectionOnUndo_ object:v14];

    uint64_t v15 = [v20 selectedRange];
    uint64_t v17 = v16;
    objc_msgSend(v20, "setSelectedRange:", v10, v12);
    v18 = [v20 textStorage];
    objc_msgSend(v18, "deleteCharactersInRange:", v10, v12);

    objc_msgSend(v20, "setSelectedRange:", v15, v17);
    [v6 endUndoGrouping];
    v19 = [v20 delegate];
    [v19 textViewDidChange:v20];

    if (v5) {
      [v20 becomeFirstResponder];
    }

    int v4 = v20;
  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  int v6 = [(ICAttachmentView *)self textView];
  id v7 = [v6 findInteraction];
  int v8 = [v7 isFindNavigatorVisible];

  if (v8)
  {
    id v10 = [(ICAttachmentView *)self textView];
    id v9 = [v10 findInteraction];
    [v9 dismissFindNavigator];
  }
}

- (id)makePlaybackMenu
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(ICAttachmentView *)self canPerformAction:sel_playFromBeginning_ withSender:self])
  {
    int v4 = (void *)MEMORY[0x263F823D0];
    int v5 = [MEMORY[0x263F086E0] mainBundle];
    int v6 = [v5 localizedStringForKey:@"Play from Beginning" value:&stru_26C10E100 table:0];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __36__ICAttachmentView_makePlaybackMenu__block_invoke;
    int v13 = &unk_2640B9E88;
    objc_copyWeak(&v14, &location);
    id v7 = objc_msgSend(v4, "ic_actionWithTitle:imageName:handler:", v6, @"arrow.trianglehead.counterclockwise", &v10);

    objc_msgSend(v3, "addObject:", v7, v10, v11, v12, v13);
    objc_destroyWeak(&v14);
  }
  int v8 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v3];

  objc_destroyWeak(&location);

  return v8;
}

void __36__ICAttachmentView_makePlaybackMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained playFromBeginning:WeakRetained];
}

- (id)makeAudioMenu
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(ICAttachmentView *)self canPerformAction:sel_rename_ withSender:self])
  {
    int v4 = [(ICAttachmentView *)self attachment];
    int v5 = [v4 attachmentType];

    if (v5 == 4)
    {
      int v6 = (void *)MEMORY[0x263F823D0];
      id v7 = [MEMORY[0x263F086E0] mainBundle];
      int v8 = [v7 localizedStringForKey:@"Rename" value:&stru_26C10E100 table:0];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __33__ICAttachmentView_makeAudioMenu__block_invoke;
      v19[3] = &unk_2640B9E88;
      objc_copyWeak(&v20, &location);
      id v9 = objc_msgSend(v6, "ic_actionWithTitle:imageName:handler:", v8, @"pencil", v19);

      [v3 addObject:v9];
      objc_destroyWeak(&v20);
    }
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_viewSummary_ withSender:self])
  {
    uint64_t v10 = (void *)MEMORY[0x263F823D0];
    uint64_t v11 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"View Summary" value:&stru_26C10E100 table:0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __33__ICAttachmentView_makeAudioMenu__block_invoke_2;
    v17[3] = &unk_2640B9E88;
    objc_copyWeak(&v18, &location);
    int v13 = objc_msgSend(v10, "ic_actionWithTitle:imageName:handler:", v12, @"text.line.3.summary", v17);

    id v14 = [MEMORY[0x263F827E8] _systemImageNamed:@"text.line.3.summary"];
    [v13 setImage:v14];

    [v3 addObject:v13];
    objc_destroyWeak(&v18);
  }
  uint64_t v15 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v3];

  objc_destroyWeak(&location);

  return v15;
}

void __33__ICAttachmentView_makeAudioMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rename:WeakRetained];
}

void __33__ICAttachmentView_makeAudioMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained viewSummary:WeakRetained];
}

- (id)makeRecordingMenu
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(ICAttachmentView *)self canPerformAction:sel_appendRecording_ withSender:self])
  {
    int v4 = (void *)MEMORY[0x263F823D0];
    int v5 = [MEMORY[0x263F086E0] mainBundle];
    int v6 = [v5 localizedStringForKey:@"Add to Recording" value:&stru_26C10E100 table:0];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __37__ICAttachmentView_makeRecordingMenu__block_invoke;
    int v13 = &unk_2640B9E88;
    objc_copyWeak(&v14, &location);
    id v7 = objc_msgSend(v4, "ic_actionWithTitle:imageName:handler:", v6, @"record.circle", &v10);

    objc_msgSend(v3, "addObject:", v7, v10, v11, v12, v13);
    objc_destroyWeak(&v14);
  }
  int v8 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v3];

  objc_destroyWeak(&location);

  return v8;
}

void __37__ICAttachmentView_makeRecordingMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained appendRecording:WeakRetained];
}

- (id)shareFeedbackMenu
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(ICAttachmentView *)self canPerformAction:sel_reportAConcern_withPositiveFeedback_ withSender:self]&& (ICInternalSettingsIsFCSReportAConcernEnabled() & 1) == 0)
  {
    int v5 = [MEMORY[0x263EFF980] array];
    int v6 = (void *)MEMORY[0x263F823D0];
    id v7 = [MEMORY[0x263F086E0] mainBundle];
    int v8 = [v7 localizedStringForKey:@"Looks Good" value:&stru_26C10E100 table:0];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __37__ICAttachmentView_shareFeedbackMenu__block_invoke;
    v24[3] = &unk_2640B9E88;
    objc_copyWeak(&v25, &location);
    v21 = objc_msgSend(v6, "ic_actionWithTitle:imageName:handler:", v8, @"hand.thumbsup", v24);

    id v9 = (void *)MEMORY[0x263F823D0];
    uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"Something Isn’t Right" value:&stru_26C10E100 table:0];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __37__ICAttachmentView_shareFeedbackMenu__block_invoke_2;
    v22[3] = &unk_2640B9E88;
    objc_copyWeak(&v23, &location);
    uint64_t v12 = objc_msgSend(v9, "ic_actionWithTitle:imageName:handler:", v11, @"hand.thumbsdown", v22);

    [v5 addObject:v21];
    [v5 addObject:v12];
    int v13 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v5];
    [v3 addObject:v13];
    id v14 = (void *)MEMORY[0x263F82940];
    uint64_t v15 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v16 = [v15 localizedStringForKey:@"Share Feedback" value:&stru_26C10E100 table:0];
    uint64_t v17 = [MEMORY[0x263F827E8] imageNamed:@"exclamationmark.bubble"];
    int v4 = [v14 menuWithTitle:v16 image:v17 identifier:0 options:0 children:v3];

    id v18 = [MEMORY[0x263F086E0] mainBundle];
    v19 = [v18 localizedStringForKey:@"Audio Preview" value:&stru_26C10E100 table:0];
    [v4 setSubtitle:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
  }
  else
  {
    int v4 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v3];
  }

  objc_destroyWeak(&location);

  return v4;
}

void __37__ICAttachmentView_shareFeedbackMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reportAConcern:WeakRetained withPositiveFeedback:1];
}

void __37__ICAttachmentView_shareFeedbackMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reportAConcern:WeakRetained withPositiveFeedback:0];
}

- (id)makeMainMenu
{
  v78[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v57 = [MEMORY[0x263EFF980] array];
  if ([(ICAttachmentView *)self canPerformAction:sel_copy_ withSender:self])
  {
    id v3 = (void *)MEMORY[0x263F823D0];
    int v4 = [MEMORY[0x263F086E0] mainBundle];
    int v5 = [v4 localizedStringForKey:@"Copy" value:&stru_26C10E100 table:0];
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __32__ICAttachmentView_makeMainMenu__block_invoke;
    v75[3] = &unk_2640B9E88;
    objc_copyWeak(&v76, &location);
    int v6 = objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, @"doc.on.doc", v75);

    [v57 addObject:v6];
    objc_destroyWeak(&v76);
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_saveToFiles_ withSender:self])
  {
    id v7 = [(ICAttachmentView *)self attachment];
    if ([v7 isAudio])
    {
      int v8 = [MEMORY[0x263F086E0] mainBundle];
      [v8 localizedStringForKey:@"Save Audio to Files" value:&stru_26C10E100 table:0];
    }
    else
    {
      int v8 = [MEMORY[0x263F086E0] mainBundle];
      [v8 localizedStringForKey:@"Save to Files" value:&stru_26C10E100 table:0];
    id v9 = };

    uint64_t v10 = (void *)MEMORY[0x263F823D0];
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_2;
    v73[3] = &unk_2640B9E88;
    objc_copyWeak(&v74, &location);
    uint64_t v11 = objc_msgSend(v10, "ic_actionWithTitle:imageName:handler:", v9, @"folder", v73);
    [v57 addObject:v11];

    objc_destroyWeak(&v74);
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_share_ withSender:self])
  {
    uint64_t v12 = [(ICAttachmentView *)self attachment];
    if ([v12 isAudio])
    {
      int v13 = [MEMORY[0x263F086E0] mainBundle];
      [v13 localizedStringForKey:@"Share Audio" value:&stru_26C10E100 table:0];
    }
    else
    {
      int v13 = [MEMORY[0x263F086E0] mainBundle];
      [v13 localizedStringForKey:@"Share" value:&stru_26C10E100 table:0];
    id v14 = };

    uint64_t v15 = (void *)MEMORY[0x263F823D0];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_3;
    v71[3] = &unk_2640B9E88;
    objc_copyWeak(&v72, &location);
    uint64_t v16 = objc_msgSend(v15, "ic_actionWithTitle:imageName:handler:", v14, @"square.and.arrow.up", v71);
    [v57 addObject:v16];

    objc_destroyWeak(&v72);
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_rename_ withSender:self])
  {
    uint64_t v17 = [(ICAttachmentView *)self attachment];
    BOOL v18 = [v17 attachmentType] == 11;

    if (v18)
    {
      v19 = (void *)MEMORY[0x263F823D0];
      id v20 = [MEMORY[0x263F086E0] mainBundle];
      v21 = [v20 localizedStringForKey:@"Rename" value:&stru_26C10E100 table:0];
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_4;
      v69[3] = &unk_2640B9E88;
      objc_copyWeak(&v70, &location);
      v22 = objc_msgSend(v19, "ic_actionWithTitle:imageName:handler:", v21, @"pencil", v69);

      [v57 addObject:v22];
      objc_destroyWeak(&v70);
    }
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_updatePreferredAttachmentViewSize_ withSender:self])
  {
    id v23 = [(ICAttachmentView *)self textView];
    v24 = [v23 editorController];
    v56 = [v24 attachmentInsertionController];

    id v25 = (void *)[objc_alloc(MEMORY[0x263F5B388]) initWithInsertionController:v56];
    v26 = [(ICAttachmentView *)self attachment];
    unsigned int v55 = [v25 canConvertAttachmentToLink:v26];

    id v54 = objc_alloc(MEMORY[0x263F5B238]);
    v27 = [MEMORY[0x263F086E0] mainBundle];
    v28 = [v27 localizedStringForKey:@"View As" value:&stru_26C10E100 table:0];
    v29 = [MEMORY[0x263F827E8] systemImageNamed:@"rectangle.3.group"];
    v30 = [(ICAttachmentView *)self attachment];
    uint64_t v31 = [v30 preferredViewSize];
    v32 = [(ICAttachmentView *)self textAttachment];
    v33 = [v32 supportedPresentationSizes];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_5;
    v67[3] = &unk_2640BBB10;
    objc_copyWeak(&v68, &location);
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_6;
    v64[3] = &unk_2640B8B30;
    objc_copyWeak(&v66, &location);
    id v34 = v25;
    id v65 = v34;
    v35 = (void *)[v54 initWithTitle:v28 image:v29 preferredViewSize:v31 supportedSizes:v33 supportsPlainLink:v55 isOverrideVariant:0 selectedSizeHandler:v67 plainLinkHandler:v64];

    v36 = [v35 createMenu];
    [v57 addObject:v36];

    objc_destroyWeak(&v66);
    objc_destroyWeak(&v68);
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_createImage_ withSender:self])
  {
    v37 = (void *)MEMORY[0x263F823D0];
    v38 = [MEMORY[0x263F086E0] mainBundle];
    v39 = [v38 localizedStringForKey:@"Add to Playground" value:&stru_26C10E100 table:0];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_7;
    v62[3] = &unk_2640B9E88;
    objc_copyWeak(&v63, &location);
    v40 = objc_msgSend(v37, "ic_actionWithTitle:imageName:handler:", v39, @"apple.image.playground", v62);

    v41 = (void *)MEMORY[0x263F82940];
    v78[0] = v40;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:1];
    v43 = [v41 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v42];

    [v57 addObject:v43];
    objc_destroyWeak(&v63);
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_reportAConcern_withPositiveFeedback_ withSender:self]&& ICInternalSettingsIsFCSReportAConcernEnabled())
  {
    v44 = (void *)MEMORY[0x263F823D0];
    v45 = [MEMORY[0x263F086E0] mainBundle];
    v46 = [v45 localizedStringForKey:@"Report a Concern" value:&stru_26C10E100 table:0];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_8;
    v60[3] = &unk_2640B9E88;
    objc_copyWeak(&v61, &location);
    v47 = objc_msgSend(v44, "ic_actionWithTitle:imageName:handler:", v46, @"exclamationmark.bubble", v60);

    [v57 addObject:v47];
    objc_destroyWeak(&v61);
  }
  if ([(ICAttachmentView *)self canPerformAction:sel_delete_ withSender:self])
  {
    v48 = (void *)MEMORY[0x263F823D0];
    v49 = [MEMORY[0x263F086E0] mainBundle];
    v50 = [v49 localizedStringForKey:@"Delete" value:&stru_26C10E100 table:0];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __32__ICAttachmentView_makeMainMenu__block_invoke_9;
    v58[3] = &unk_2640B9E88;
    objc_copyWeak(&v59, &location);
    v51 = objc_msgSend(v48, "ic_actionWithTitle:imageName:attributes:handler:", v50, @"trash", 2, v58);

    [v57 addObject:v51];
    objc_destroyWeak(&v59);
  }
  v52 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v57];

  objc_destroyWeak(&location);

  return v52;
}

void __32__ICAttachmentView_makeMainMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained copy:WeakRetained];
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained saveToFiles:WeakRetained];
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained share:WeakRetained];
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rename:WeakRetained];
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePreferredAttachmentViewSize:a2];
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained attachment];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = [WeakRetained attachment];
    [v3 convertAttachmentToLink:v4];
  }
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained createImage:WeakRetained];
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reportAConcern:WeakRetained withPositiveFeedback:0];
}

void __32__ICAttachmentView_makeMainMenu__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained delete:WeakRetained];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  if ([(ICAttachmentView *)self shouldAddMenuLongPressGesture])
  {
    int v5 = [(ICAttachmentView *)self attachment];
    if ([v5 attachmentType] == 11)
    {
      objc_opt_class();
      int v6 = [v5 attachmentModel];
      id v7 = ICDynamicCast();

      if (v7)
      {
        uint64_t v8 = [v7 firstSubAttachment];

        int v5 = (void *)v8;
      }
    }
    id v9 = 0;
    if ([(ICAttachmentView *)self wantsContextMenuPreview])
    {
      if (v5)
      {
        id v9 = [(ICAttachmentView *)self contextMenuPreviewController];
        if (!v9)
        {
          char IsExtension = _UIApplicationIsExtension();
          if (IsExtension)
          {
            uint64_t v11 = 0;
          }
          else
          {
            uint64_t v11 = [(ICAttachmentView *)self ic_viewControllerManager];
          }
          v31[0] = v5;
          int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
          id v9 = +[ICAttachmentPresenter previewViewControllerWithViewControllerManager:v11 attachments:v13 startingAtIndex:0 delegate:0 editable:0 isFromAttachmentBrowser:0];

          if ((IsExtension & 1) == 0) {
        }
          }
      }
    }
    id v14 = (void *)MEMORY[0x263F82940];
    uint64_t v15 = [(ICAttachmentView *)self makePlaybackMenu];
    v30[0] = v15;
    uint64_t v16 = [(ICAttachmentView *)self makeAudioMenu];
    v30[1] = v16;
    uint64_t v17 = [(ICAttachmentView *)self makeRecordingMenu];
    v30[2] = v17;
    BOOL v18 = [(ICAttachmentView *)self makeMainMenu];
    v30[3] = v18;
    v19 = [(ICAttachmentView *)self shareFeedbackMenu];
    v30[4] = v19;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:5];
    v21 = [v14 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:0 children:v20];

    v22 = (void *)MEMORY[0x263F82610];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v28[3] = &unk_2640B97C8;
    id v29 = v9;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v26[3] = &unk_2640B97F0;
    id v27 = v21;
    id v23 = v21;
    id v24 = v9;
    uint64_t v12 = [v22 configurationWithIdentifier:0 previewProvider:v28 actionProvider:v26];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __74__ICAttachmentView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  if ([(ICAttachmentView *)self wantsContextMenuPreview]
    || ([(ICAttachmentView *)self attachment],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 preferredViewSize],
        v6,
        v7))
  {
    id v8 = objc_alloc_init(MEMORY[0x263F82AD0]);
    id v9 = [MEMORY[0x263F825C8] systemBackgroundColor];
    uint64_t v10 = [(ICAttachmentView *)self traitCollection];
    uint64_t v11 = [v9 resolvedColorWithTraitCollection:v10];
    [v8 setBackgroundColor:v11];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self parameters:v8];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263F82E00]);
    id v8 = (id)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v14 = objc_alloc_init(MEMORY[0x263F82AD0]);
    id v15 = objc_alloc(MEMORY[0x263F82AE0]);
    [(ICAttachmentView *)self center];
    uint64_t v16 = objc_msgSend(v15, "initWithContainer:center:", self);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:v8 parameters:v14 target:v16];
  }

  return v12;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __101__ICAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v5[3] = &unk_2640B8140;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __101__ICAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapAttachment:*(void *)(a1 + 32)];
}

- (BOOL)wantsContextMenuPreview
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    int v4 = [(ICAttachmentView *)self ic_viewControllerManager];
    uint64_t v5 = [v4 noteContainerViewMode];
    if (v5
      || ([(ICAttachmentView *)self ic_viewControllerManager],
          id v2 = objc_claimAutoreleasedReturnValue(),
          [v2 isMainSplitViewDisplayModeSecondaryOnly]))
    {
      int v6 = [(ICAttachmentView *)self ic_viewControllerManager];
      BOOL v7 = [v6 noteContainerViewMode] == 1;

      if (v5)
      {
LABEL_13:

        return v7;
      }
    }
    else
    {
      BOOL v7 = 1;
    }

    goto LABEL_13;
  }
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isiPad"))
  {
    int v4 = [(ICAttachmentView *)self window];
    [v4 bounds];
    BOOL v7 = v9 >= 800.0 && v8 >= 300.0;
    goto LABEL_13;
  }
  return 1;
}

- (id)contextMenuPreviewController
{
  return 0;
}

- (void)removeFromSuperview
{
  id v3 = [(ICAttachmentView *)self textView];
  uint64_t v4 = [v3 shouldAvoidBecomingFirstResponder];
  [v3 setShouldAvoidBecomingFirstResponder:1];
  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentView;
  [(ICAttachmentView *)&v5 removeFromSuperview];
  [v3 setShouldAvoidBecomingFirstResponder:v4];
}

- (void)respondToTapGesture:(id)a3
{
  id v16 = a3;
  if ([(ICAttachmentView *)self isUserInteractionEnabled]
    && [v16 state] == 3)
  {
    uint64_t v4 = [(ICAttachmentView *)self attachment];
    objc_super v5 = [v4 note];

    int v6 = [(ICAttachmentView *)self attachment];
    NSUInteger v7 = [v5 rangeForAttachment:v6];
    NSUInteger v9 = v8;

    uint64_t v10 = [(ICAttachmentView *)self textView];
    v18.NSUInteger location = [v10 selectedRange];
    NSUInteger location = v18.location;
    NSUInteger length = v18.length;
    v19.NSUInteger location = v7;
    v19.NSUInteger length = v9;
    if (NSIntersectionRange(v18, v19).length)
    {
      objc_msgSend(v10, "setSelectedRange:", location + length, 0);
    }
    else
    {
      id v13 = [MEMORY[0x263F82950] sharedMenuController];
      int v14 = [v13 isMenuVisible];

      if (v14)
      {
        id v15 = [MEMORY[0x263F82950] sharedMenuController];
        [v15 setMenuVisible:0 animated:1];

        [(ICAttachmentView *)self requestEditorFirstResponder];
      }
      else if (![(ICAttachmentView *)self showRecoverNoteAlertIfNecessary])
      {
        [(ICAttachmentView *)self didTapAttachment:self];
      }
    }
  }
}

- (void)respondToPanGesture:(id)a3
{
  uint64_t v4 = [(ICAttachmentView *)self delegate];

  if (v4)
  {
    id v7 = [(ICAttachmentView *)self delegate];
    objc_super v5 = [(ICAttachmentView *)self attachment];
    [v7 attachmentView:self shouldPresentAttachment:v5];
  }
  else
  {
    int v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BE60000, v6, OS_LOG_TYPE_INFO, "respondToPanGesture: attachment view has no delegate", buf, 2u);
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 locationInView:self];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(ICAttachmentView *)self bounds];
  if (v14 > 32.0) {
    *(CGRect *)&uint64_t v12 = CGRectInset(*(CGRect *)&v12, 8.0, 0.0);
  }
  v22.double x = v9;
  v22.double y = v11;
  if (CGRectContainsPoint(*(CGRect *)&v12, v22))
  {
    id v16 = [(ICAttachmentView *)self panGestureRecognizer];
    int v17 = [v6 isEqual:v16];

    if (v17)
    {
      NSRange v18 = [(ICAttachmentView *)self delegate];
      NSRange v19 = [(ICAttachmentView *)self attachment];
      char v20 = [v18 attachmentView:self shouldRespondToPanGestureTouch:v7 forAttachment:v19];
    }
    else
    {
      char v20 = 1;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (void)icaxActivate
{
}

- (void)shareWebLink:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICAttachmentView *)self attachment];
  id v6 = [v5 URL];
  if (objc_msgSend(v6, "ic_isWebURL"))
  {
    id v7 = [(ICAttachmentView *)self attachment];
    double v8 = [v7 urlString];
  }
  else
  {
    double v8 = 0;
  }

  CGFloat v9 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v8 preferredStyle:0];
  double v10 = (void *)MEMORY[0x263F82400];
  CGFloat v11 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"Open" value:&stru_26C10E100 table:0];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __33__ICAttachmentView_shareWebLink___block_invoke;
  v47[3] = &unk_2640B9398;
  v47[4] = self;
  id v13 = [v10 actionWithTitle:v12 style:0 handler:v47];
  [v9 addAction:v13];

  double v14 = [(ICAttachmentView *)self attachment];
  id v15 = [v14 URL];
  LODWORD(v12) = objc_msgSend(v15, "ic_isWebURL");

  if (v12)
  {
    id v16 = (void *)MEMORY[0x263F82400];
    int v17 = [MEMORY[0x263F086E0] mainBundle];
    NSRange v18 = [v17 localizedStringForKey:@"Add to Reading List" value:&stru_26C10E100 table:0];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __33__ICAttachmentView_shareWebLink___block_invoke_2;
    v46[3] = &unk_2640B9398;
    v46[4] = self;
    NSRange v19 = [v16 actionWithTitle:v18 style:0 handler:v46];
    [v9 addAction:v19];
  }
  char v20 = (void *)MEMORY[0x263F82400];
  v21 = [MEMORY[0x263F086E0] mainBundle];
  CGPoint v22 = [v21 localizedStringForKey:@"Copy" value:&stru_26C10E100 table:0];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __33__ICAttachmentView_shareWebLink___block_invoke_221;
  v44[3] = &unk_2640BBB38;
  v44[4] = self;
  id v45 = v4;
  id v23 = v4;
  id v24 = [v20 actionWithTitle:v22 style:0 handler:v44];
  [v9 addAction:v24];

  id v25 = (void *)MEMORY[0x263F82400];
  v26 = [MEMORY[0x263F086E0] mainBundle];
  id v27 = [v26 localizedStringForKey:@"Cancel" value:&stru_26C10E100 table:0];
  v28 = [v25 actionWithTitle:v27 style:1 handler:0];
  [v9 addAction:v28];

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    uint64_t v29 = -2;
  }
  else {
    uint64_t v29 = 7;
  }
  [v9 setModalPresentationStyle:v29];
  v30 = [(ICAttachmentView *)self actionWindow];
  uint64_t v31 = [v30 rootViewController];
  v32 = objc_msgSend(v31, "ic_topViewController");
  [v32 presentViewController:v9 animated:1 completion:0];

  v33 = [v9 popoverPresentationController];
  [v33 setSourceView:self];

  [(ICAttachmentView *)self bounds];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = [v9 popoverPresentationController];
  objc_msgSend(v42, "setSourceRect:", v35, v37, v39, v41);

  v43 = [v9 popoverPresentationController];
  [v43 setPermittedArrowDirections:15];
}

void __33__ICAttachmentView_shareWebLink___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 attachment];
  [v4 attachmentView:v2 shouldPresentAttachment:v3];
}

void __33__ICAttachmentView_shareWebLink___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  id v4 = (void *)getSSReadingListClass_softClass;
  uint64_t v23 = getSSReadingListClass_softClass;
  if (!getSSReadingListClass_softClass)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __getSSReadingListClass_block_invoke;
    v19[3] = &unk_2640B9818;
    void v19[4] = &v20;
    __getSSReadingListClass_block_invoke((uint64_t)v19);
    id v4 = (void *)v21[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v20, 8);
  id v6 = [v5 defaultReadingList];
  id v7 = NSURL;
  CGFloat v9 = *(void **)(a1 + 32);
  double v8 = (id *)(a1 + 32);
  double v10 = [v9 attachment];
  CGFloat v11 = [v10 urlString];
  uint64_t v12 = [v7 URLWithString:v11];
  id v13 = [*v8 attachment];
  double v14 = [v13 title];
  id v18 = 0;
  char v15 = [v6 addReadingListItemWithURL:v12 title:v14 previewText:0 error:&v18];
  id v16 = v18;

  if ((v15 & 1) == 0)
  {
    int v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __33__ICAttachmentView_shareWebLink___block_invoke_2_cold_1(v8, (uint64_t)v16, v17);
    }
  }
}

uint64_t __33__ICAttachmentView_shareWebLink___block_invoke_221(uint64_t a1)
{
  return [*(id *)(a1 + 32) copy:*(void *)(a1 + 40)];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (NSTextContainer)textContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textContainer);

  return (NSTextContainer *)WeakRetained;
}

- (ICAttachmentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICAttachmentViewDelegate *)WeakRetained;
}

- (BOOL)finishedInit
{
  return self->_finishedInit;
}

- (void)setFinishedInit:(BOOL)a3
{
  self->_finishedInit = a3;
}

- (void)setActionWindow:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_actionWindow, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_textContainer);
}

void __33__ICAttachmentView_shareWebLink___block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [*a1 attachment];
  id v6 = [v5 urlString];
  int v7 = 138412546;
  double v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Unable to add %@ to reading list, error %@", (uint8_t *)&v7, 0x16u);
}

@end