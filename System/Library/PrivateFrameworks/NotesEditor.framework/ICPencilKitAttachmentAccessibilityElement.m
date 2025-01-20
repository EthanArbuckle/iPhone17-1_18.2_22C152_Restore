@interface ICPencilKitAttachmentAccessibilityElement
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isSelected;
- (BOOL)isShowingGenerationPrompt;
- (BOOL)selectTextRangeAction;
- (BOOL)showingResizeHandles;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (ICBaseTextView)textView;
- (ICInlineCanvasTextAttachment)textAttachment;
- (ICPencilKitAttachmentAccessibilityElement)initWithTextAttachment:(id)a3 textView:(id)a4;
- (NSArray)cachedResizeHandleElements;
- (NSArray)resizeHandleElements;
- (NSArray)supportedRotorTypes;
- (UIView)attachmentDrawingView;
- (_NSRange)rangeInTextStorage;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)canvasGenerationToolView;
- (void)setCachedResizeHandleElements:(id)a3;
- (void)setTextAttachment:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation ICPencilKitAttachmentAccessibilityElement

- (ICPencilKitAttachmentAccessibilityElement)initWithTextAttachment:(id)a3 textView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 accessibilityContainer];
  v9 = ICAccessibilityFindReparentingTarget(v8);

  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
    v10 = [(ICPencilKitAttachmentAccessibilityElement *)&v13 initWithAccessibilityContainer:v9];
    v11 = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_textAttachment, v6);
      objc_storeWeak((id *)&v11->_textView, v7);
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (BOOL)isShowingGenerationPrompt
{
  v2 = [(ICPencilKitAttachmentAccessibilityElement *)self canvasGenerationToolView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)canvasGenerationToolView
{
  v2 = [(ICPencilKitAttachmentAccessibilityElement *)self attachmentDrawingView];
  BOOL v3 = [v2 subviews];
  v4 = objc_msgSend(v3, "ax_firstObjectUsingBlock:", &__block_literal_global_10);

  return v4;
}

uint64_t __69__ICPencilKitAttachmentAccessibilityElement_canvasGenerationToolView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 className];
  uint64_t v3 = [v2 isEqualToString:@"PaperKit.CanvasGenerationTool"];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return ![(ICPencilKitAttachmentAccessibilityElement *)self isShowingGenerationPrompt];
}

- (id)accessibilityLabel
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"handwriting attachment" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityValue
{
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  v4 = [v3 editorController];
  v5 = [v4 note];
  id v6 = [v5 calculateAccessibilityController];
  uint64_t v7 = [(ICPencilKitAttachmentAccessibilityElement *)self rangeInTextStorage];
  v9 = objc_msgSend(v6, "getValueForPencilKitAttachmentAtRange:", v7, v8);

  if ([v9 length])
  {
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:@"Handwritten math: %@" value:&stru_26C10E100 table:0];

    v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, v9);
  }
  else
  {
    objc_super v13 = [(ICPencilKitAttachmentAccessibilityElement *)self textAttachment];
    v14 = [v13 attachment];
    v11 = [v14 handwritingSummary];

    if ([v11 length])
    {
      v15 = [MEMORY[0x263F086E0] mainBundle];
      v16 = [v15 localizedStringForKey:@"Possible handwriting: %@" value:&stru_26C10E100 table:0];

      v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v16, v11);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)accessibilityHint
{
  if ([(ICPencilKitAttachmentAccessibilityElement *)self showingResizeHandles])
  {
    v2 = 0;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
    v2 = [v3 localizedStringForKey:@"Double tap to show resize handles." value:&stru_26C10E100 table:0];
  }

  return v2;
}

- (BOOL)accessibilityActivate
{
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self attachmentDrawingView];
  char v4 = [v3 isFirstResponder];

  if ((v4 & 1) == 0)
  {
    _UIAccessibilityBlockPostingOfNotification();
    v5 = [(ICPencilKitAttachmentAccessibilityElement *)self attachmentDrawingView];
    [v5 becomeFirstResponder];

    _UIAccessibilityUnblockPostingOfNotification();
    id v6 = [(ICPencilKitAttachmentAccessibilityElement *)self resizeHandleElements];
    uint64_t v7 = [v6 firstObject];
    int v8 = [v7 isEnabled];

    if (v8)
    {
      UIAccessibilityNotifications v9 = *MEMORY[0x263F831C0];
      v10 = [(ICPencilKitAttachmentAccessibilityElement *)self resizeHandleElements];
      v11 = [v10 firstObject];
      UIAccessibilityPostNotification(v9, v11);
    }
  }
  return v4 ^ 1;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self attachmentDrawingView];
  [v3 accessibilityFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(ICPencilKitAttachmentAccessibilityElement *)self attachmentDrawingView];
  objc_super v13 = [v12 window];
  [v13 bounds];
  v29.origin.CGFloat x = v14;
  v29.origin.CGFloat y = v15;
  v29.size.CGFloat width = v16;
  v29.size.CGFloat height = v17;
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = v11;
  CGRect v27 = CGRectIntersection(v26, v29);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3 = -1.0;
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  double v5 = -1.0;
  if (!IsVoiceOverRunning)
  {
    v8.receiver = self;
    v8.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
    [(ICPencilKitAttachmentAccessibilityElement *)&v8 accessibilityActivationPoint];
    double v3 = v6;
  }
  double v7 = v3;
  result.CGFloat y = v7;
  result.CGFloat x = v5;
  return result;
}

- (id)accessibilityContainer
{
  v5.receiver = self;
  v5.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
  v2 = [(ICPencilKitAttachmentAccessibilityElement *)&v5 accessibilityContainer];
  double v3 = ICAccessibilityFindReparentingTarget(v2);

  return v3;
}

- (id)accessibilityCustomActions
{
  double v3 = (void *)MEMORY[0x263EFF980];
  v12.receiver = self;
  v12.super_class = (Class)ICPencilKitAttachmentAccessibilityElement;
  double v4 = [(ICPencilKitAttachmentAccessibilityElement *)&v12 accessibilityCustomActions];
  objc_super v5 = [v3 arrayWithArray:v4];

  if (![(ICPencilKitAttachmentAccessibilityElement *)self isSelected])
  {
    id v6 = objc_alloc(MEMORY[0x263F823A0]);
    double v7 = [MEMORY[0x263F086E0] mainBundle];
    objc_super v8 = [v7 localizedStringForKey:@"Select" value:&stru_26C10E100 table:0];
    CGFloat v9 = (void *)[v6 initWithName:v8 target:self selector:sel_selectTextRangeAction];

    [v5 addObject:v9];
  }
  double v10 = (void *)[v5 copy];

  return v10;
}

- (id)accessibilityCustomRotors
{
  v2 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  double v3 = [v2 editorController];
  double v4 = +[ICAccessibilityCustomRotorController sharedInstance];
  [v4 setNoteEditorViewController:v3];

  objc_super v5 = +[ICAccessibilityCustomRotorController sharedInstance];
  id v6 = [v5 sharedTextViewRotors];

  return v6;
}

- (id)accessibilityDragSourceDescriptors
{
  if ([(ICPencilKitAttachmentAccessibilityElement *)self isSelected])
  {
    double v3 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
    double v4 = [v3 accessibilityDragSourceDescriptors];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (UIView)attachmentDrawingView
{
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self rangeInTextStorage];
  double v4 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  objc_super v5 = [v4 superview];

  id v6 = 0;
  if (v5 && v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      double v7 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
      objc_super v8 = [(ICPencilKitAttachmentAccessibilityElement *)self textAttachment];
      CGFloat v9 = objc_msgSend(v7, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v8, v3, 1);
      id v6 = [v9 view];
    }
    else
    {
      double v7 = [(ICPencilKitAttachmentAccessibilityElement *)self textAttachment];
      objc_super v8 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
      CGFloat v9 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
      double v10 = [v9 layoutManager];
      CGFloat v11 = [v7 viewProviderForParentView:v8 characterIndex:v3 layoutManager:v10];
      id v6 = [v11 view];
    }
  }

  return (UIView *)v6;
}

- (_NSRange)rangeInTextStorage
{
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  double v4 = [v3 textStorage];

  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3010000000;
  CGFloat v15 = &unk_20C1E2BF2;
  long long v16 = xmmword_20C1794E0;
  uint64_t v5 = [v4 length];
  uint64_t v6 = *MEMORY[0x263F814A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__ICPencilKitAttachmentAccessibilityElement_rangeInTextStorage__block_invoke;
  v11[3] = &unk_2640B8D60;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v11);
  NSUInteger v7 = v13[4];
  NSUInteger v8 = v13[5];
  _Block_object_dispose(&v12, 8);

  NSUInteger v9 = v7;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

void __63__ICPencilKitAttachmentAccessibilityElement_rangeInTextStorage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  NSUInteger v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 textAttachment];

  if (v11 == v10)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v12 + 32) = a3;
    *(void *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

- (NSArray)resizeHandleElements
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self cachedResizeHandleElements];

  if (v3) {
    goto LABEL_31;
  }
  double v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [(ICPencilKitAttachmentAccessibilityElement *)self attachmentDrawingView];
  uint64_t v6 = [(ICPencilKitAttachmentAccessibilityElement *)self textAttachment];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CGRect v27 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    NSUInteger v8 = [v5 subviews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v8);
          }
          objc_opt_class();
          CGFloat v15 = ICDynamicCast();
          long long v16 = v15;
          if (v15)
          {
            int v17 = [v15 top];
            id v18 = v16;
            if (v17) {
              v19 = v12;
            }
            else {
              v19 = v11;
            }
            if (v17) {
              uint64_t v12 = v18;
            }
            else {
              id v11 = v18;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
      uint64_t v12 = 0;
    }

    uint64_t v5 = v27;
    goto LABEL_24;
  }
  v20 = [(ICPencilKitAttachmentAccessibilityElement *)self textAttachment];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    uint64_t v12 = [v5 safeValueForKey:@"topResizeView"];
    id v11 = [v5 safeValueForKey:@"bottomResizeView"];
LABEL_24:
    if (v12)
    {
      double v22 = [[ICPencilKitAttachmentResizeHandleAccessibilityElement alloc] initWithAttachmentAccessibilityElement:self drawingResizeView:v12];
      [v4 addObject:v22];
    }
    if (v11)
    {
      double v23 = [[ICPencilKitAttachmentResizeHandleAccessibilityElement alloc] initWithAttachmentAccessibilityElement:self drawingResizeView:v11];
      [v4 addObject:v23];
    }
    goto LABEL_28;
  }
  id v11 = 0;
  uint64_t v12 = 0;
LABEL_28:
  if ([v4 count])
  {
    double v24 = (void *)[v4 copy];
    [(ICPencilKitAttachmentAccessibilityElement *)self setCachedResizeHandleElements:v24];
  }
LABEL_31:
  double v25 = [(ICPencilKitAttachmentAccessibilityElement *)self cachedResizeHandleElements];

  return (NSArray *)v25;
}

- (BOOL)showingResizeHandles
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(ICPencilKitAttachmentAccessibilityElement *)self resizeHandleElements];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isAccessibilityElement", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)selectTextRangeAction
{
  _UIAccessibilityBlockPostingOfAllNotifications();
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  uint64_t v4 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  [v3 select:v4];

  uint64_t v5 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  uint64_t v6 = [(ICPencilKitAttachmentAccessibilityElement *)self textRangeInNote];
  objc_msgSend(v5, "setSelectedRange:", v6, v7);

  long long v8 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  uint64_t v9 = [(ICPencilKitAttachmentAccessibilityElement *)self textRangeInNote];
  objc_msgSend(v8, "scrollRangeToVisible:", v9, v10);

  _UIAccessibilityUnblockPostingOfAllNotifications();
  id v11 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"Selected %@. Use the actions rotor to start dragging." value:&stru_26C10E100 table:0];

  uint64_t v13 = NSString;
  uint64_t v14 = [(ICPencilKitAttachmentAccessibilityElement *)self accessibilityLabel];
  CGFloat v15 = objc_msgSend(v13, "localizedStringWithFormat:", v12, v14);

  UIAccessibilityPostNotification(*MEMORY[0x263F83188], v15);
  return 1;
}

- (NSArray)supportedRotorTypes
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"ICAccessibilityRotorTypeAttachments";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)isSelected
{
  uint64_t v3 = [(ICPencilKitAttachmentAccessibilityElement *)self textRangeInNote];
  uint64_t v5 = v4;
  uint64_t v6 = [(ICPencilKitAttachmentAccessibilityElement *)self textView];
  BOOL v9 = v3 == [v6 selectedRange] && v5 == v7;

  return v9;
}

- (ICInlineCanvasTextAttachment)textAttachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);

  return (ICInlineCanvasTextAttachment *)WeakRetained;
}

- (void)setTextAttachment:(id)a3
{
}

- (ICBaseTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (ICBaseTextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (NSArray)cachedResizeHandleElements
{
  return self->_cachedResizeHandleElements;
}

- (void)setCachedResizeHandleElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResizeHandleElements, 0);
  objc_destroyWeak((id *)&self->_textView);

  objc_destroyWeak((id *)&self->_textAttachment);
}

@end