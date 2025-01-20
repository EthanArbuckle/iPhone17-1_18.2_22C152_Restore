@interface RTTUIUtteranceCell
+ (double)heightForUtterance:(id)a3 andWidth:(double)a4;
- (BOOL)_accessibilityIsUnread;
- (BOOL)_accessibilityRealtimeCompleted;
- (BOOL)isAccessibilityElement;
- (BOOL)isEditingUtterance;
- (RTTUIUtteranceCellDelegate)delegate;
- (RTTUtterance)utterance;
- (_NSRange)selectedTextRange;
- (double)preferredHeightForWidth:(double)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)utteranceTextColor;
- (void)_accessibilityHandleATFocused:(BOOL)a3 assistiveTech:(id)a4;
- (void)_accessibilitySetIsUnread:(BOOL)a3;
- (void)adjustTextViewSize;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEditingUtterance:(BOOL)a3;
- (void)setSendProgressIndex:(unint64_t)a3;
- (void)setUtterance:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)updateUtterance:(id)a3;
- (void)updateUtterance:(id)a3 postNotifications:(BOOL)a4;
@end

@implementation RTTUIUtteranceCell

+ (double)heightForUtterance:(id)a3 andWidth:(double)a4
{
  id v5 = a3;
  if (heightForUtterance_andWidth__onceToken != -1) {
    dispatch_once(&heightForUtterance_andWidth__onceToken, &__block_literal_global_1);
  }
  id v6 = v5;
  v7 = [v6 text];
  uint64_t v8 = [v7 length];

  v9 = v6;
  if (!v8)
  {
    v10 = (void *)MEMORY[0x263F62B08];
    v11 = [v6 contactPath];
    v12 = ttyLocString();
    v9 = [v10 utteranceWithContactPath:v11 andText:v12];
  }
  [(id)heightForUtterance_andWidth__SizeCell updateUtterance:v9 postNotifications:0];
  [(id)heightForUtterance_andWidth__SizeCell preferredHeightForWidth:a4];
  double v14 = v13;

  return v14;
}

uint64_t __50__RTTUIUtteranceCell_heightForUtterance_andWidth___block_invoke()
{
  heightForUtterance_andWidth__SizeCell = objc_alloc_init(RTTUIUtteranceCell);
  return MEMORY[0x270F9A758]();
}

- (void)updateUtterance:(id)a3 postNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(RTTUIUtteranceCell *)self setUtterance:v6];
  [(RTTUIUtteranceCell *)self updateLayout];
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(RTTUIUtteranceCell *)self _accessibilityIsRealtimeElement])
    {
      [(RTTUIUtteranceCell *)self _accessibilitySetIsUnread:1];
      UIAccessibilityPostNotification(0x421u, 0);
    }
    v7 = self;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v8 = (void (*)(RTTUIUtteranceCell *))get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_ptr;
    double v14 = get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_ptr;
    if (!get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_ptr)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_block_invoke;
      v10[3] = &unk_2646386E0;
      v10[4] = &v11;
      __get_UIAccessibilitySetAssociatedElementContextForNextNotificationSymbolLoc_block_invoke((uint64_t)v10);
      uint64_t v8 = (void (*)(RTTUIUtteranceCell *))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v8)
    {
      v9 = (_Unwind_Exception *)-[RTTUIConversationControllerCoordinator registerForCallUpdates:]();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    v8(v7);

    UIAccessibilityPostNotification(0x3EDu, 0);
  }
}

- (void)updateUtterance:(id)a3
{
}

- (void)setSendProgressIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v18[0] = 67109120;
    v18[1] = a3;
    _os_log_impl(&dword_222978000, v5, OS_LOG_TYPE_INFO, "Set progress index: %d", (uint8_t *)v18, 8u);
  }

  id v6 = objc_alloc(MEMORY[0x263F089B8]);
  v7 = [(UITextView *)self->_textView attributedText];
  uint64_t v8 = (void *)[v6 initWithAttributedString:v7];

  [v8 beginEditing];
  v9 = [(RTTUIUtteranceCell *)self delegate];
  v10 = [v9 currentCall];
  LODWORD(v7) = +[RTTUIUtilities ttyShouldBeRealtimeForCall:v10];

  if (v7) {
    unint64_t v11 = [v8 length];
  }
  else {
    unint64_t v11 = a3 + 1;
  }
  unint64_t v12 = [v8 length];
  uint64_t v13 = *MEMORY[0x263F1C240];
  double v14 = [(RTTUIUtteranceCell *)self utteranceTextColor];
  v15 = v14;
  if (v11 >= v12)
  {
    objc_msgSend(v8, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v8, "length"));
  }
  else
  {
    v16 = [v14 colorWithAlphaComponent:0.5];
    objc_msgSend(v8, "addAttribute:value:range:", v13, v16, v11, objc_msgSend(v8, "length") - v11);

    v15 = [(RTTUIUtteranceCell *)self utteranceTextColor];
    v17 = [v15 colorWithAlphaComponent:1.0];
    objc_msgSend(v8, "addAttribute:value:range:", v13, v17, 0, v11);
  }
  [v8 endEditing];
  [(UITextView *)self->_textView setAttributedText:v8];
  [(RTTUIUtteranceCell *)self adjustTextViewSize];
}

- (void)dealloc
{
  [(RTTUIUtteranceCell *)self setUtterance:0];
  v3.receiver = self;
  v3.super_class = (Class)RTTUIUtteranceCell;
  [(RTTUIUtteranceCell *)&v3 dealloc];
}

- (id)utteranceTextColor
{
  int IsRTTNotificationContentExtension = Soft_AXProcessIsRTTNotificationContentExtension();
  BOOL v4 = [(RTTUIUtteranceCell *)self delegate];
  int v5 = [v4 isCurrentCallConnected];

  if (!v5 || IsRTTNotificationContentExtension)
  {
    id v6 = [MEMORY[0x263F1C550] labelColor];
  }
  else
  {
    id v6 = [MEMORY[0x263F1C550] whiteColor];
  }
  return v6;
}

- (_NSRange)selectedTextRange
{
  NSUInteger v2 = [(UITextView *)self->_textView selectedRange];
  result.length = v3;
  result.location = v2;
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  int v5 = +[RTTUIUtilities sharedUtilityProvider];
  [v5 bubbleInsetForMe:1];
  double v7 = v6;
  double v9 = v8;

  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", a3, 1.79769313e308);
  return v10 - v7 - v9;
}

- (void)adjustTextViewSize
{
  NSUInteger v3 = [(RTTUIUtteranceCell *)self utterance];
  uint64_t v4 = [v3 isMe];

  [(RTTUIUtteranceCell *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = (double *)MEMORY[0x263F00148];
  double v14 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  v15 = [(RTTUIUtteranceCell *)self utterance];
  int v16 = [v15 isTranscription];

  if (v16)
  {
    v17 = [v14 fontDescriptor];
    v18 = [v17 fontDescriptorWithSymbolicTraits:1];

    uint64_t v19 = (void *)MEMORY[0x263F1C658];
    [v14 pointSize];
    uint64_t v20 = objc_msgSend(v19, "fontWithDescriptor:size:", v18);

    double v14 = (void *)v20;
  }
  double v22 = *v13;
  double v21 = v13[1];
  [(UITextView *)self->_textView setFont:v14];
  v51.origin.x = v6;
  v51.origin.y = v8;
  v51.size.width = v10;
  v51.size.height = v12;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", CGRectGetWidth(v51), 1.79769313e308);
  double v24 = fmax(v23, 20.0);
  v52.origin.x = v6;
  v52.origin.y = v8;
  v52.size.width = v10;
  v52.size.height = v12;
  double Width = CGRectGetWidth(v52);
  v53.origin.x = v6;
  v53.origin.y = v8;
  v53.size.width = v10;
  v53.size.height = v12;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", CGRectGetWidth(v53), v24);
  double v27 = fmax(v26, 130.0);
  if (Width >= v27) {
    double Width = v27;
  }
  v28 = +[RTTUIUtilities sharedUtilityProvider];
  uint64_t v29 = [v28 textAlignmentForMe:v4];

  if (v29 == 2)
  {
    v54.origin.x = v6;
    v54.origin.y = v8;
    v54.size.width = v10;
    v54.size.height = v12;
    double v30 = CGRectGetWidth(v54);
    v55.origin.x = v22;
    v55.origin.y = v21;
    v55.size.width = Width;
    v55.size.height = v24;
    double v22 = v30 - CGRectGetWidth(v55);
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v22, v21, Width, v24);
  v31 = +[RTTUIUtilities sharedUtilityProvider];
  [v31 textInsetForMe:v4];
  double v33 = v22 + v32;
  double v35 = v21 + v34;
  double v37 = Width - (v32 + v36);
  double v39 = v24 - (v34 + v38);

  v40 = +[RTTUIUtilities sharedUtilityProvider];
  [v40 bubbleInsetForMe:v4];
  double v42 = v33 + v41;
  double v44 = v35 + v43;
  double v46 = v37 - (v41 + v45);
  double v48 = v39 - (v43 + v47);

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __40__RTTUIUtteranceCell_adjustTextViewSize__block_invoke;
  v50[3] = &unk_2646388F8;
  v50[4] = self;
  *(double *)&v50[5] = v42;
  *(double *)&v50[6] = v44;
  *(double *)&v50[7] = v46;
  *(double *)&v50[8] = v48;
  v49 = (void (**)(void))MEMORY[0x223CA2070](v50);
  v49[2]();
}

void __40__RTTUIUtteranceCell_adjustTextViewSize__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)RTTUIUtteranceCell;
  [(RTTUIUtteranceCell *)&v42 layoutSubviews];
  NSUInteger v3 = [(RTTUIUtteranceCell *)self utterance];
  uint64_t v4 = [v3 isMe];

  double v5 = [(RTTUIUtteranceCell *)self delegate];
  int v6 = [v5 isCurrentCallConnected];

  if (!self->_textView)
  {
    double v7 = [RTTUIStaticTextView alloc];
    CGFloat v8 = [(RTTUIUtteranceCell *)self textLabel];
    [v8 frame];
    double v9 = -[RTTUIStaticTextView initWithFrame:textContainer:](v7, "initWithFrame:textContainer:", 0);
    textView = self->_textView;
    self->_textView = v9;

    double v11 = self->_textView;
    CGFloat v12 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v11 setBackgroundColor:v12];

    uint64_t v13 = self->_textView;
    double v14 = [MEMORY[0x263F1C658] systemFontOfSize:20.0];
    [(UITextView *)v13 setFont:v14];

    [(UITextView *)self->_textView setDelegate:self];
    v15 = [(UITextView *)self->_textView textContainer];
    [v15 setLineBreakMode:0];

    int v16 = [(UITextView *)self->_textView textContainer];
    [v16 setMaximumNumberOfLines:0];

    [(UITextView *)self->_textView setDataDetectorTypes:-1];
    [(UITextView *)self->_textView setEditable:0];
    [(UITextView *)self->_textView setSelectable:1];
    [(UITextView *)self->_textView setScrollEnabled:0];
    v17 = self->_textView;
    v18 = [(RTTUIUtteranceCell *)self utteranceTextColor];
    [(UITextView *)v17 setTextColor:v18];

    uint64_t v19 = [(RTTUIUtteranceCell *)self contentView];
    [v19 addSubview:self->_textView];
  }
  uint64_t v20 = [(RTTUIUtteranceCell *)self backgroundView];
  if (!v20
    || (double v21 = (void *)v20,
        [(RTTUIUtteranceCell *)self backgroundView],
        double v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 tag] == 1,
        v22,
        v21,
        v4 != v23))
  {
    double v24 = +[RTTUIUtilities sharedUtilityProvider];
    v25 = [v24 bubbleFillForMe:v4];

    double v26 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v25];
    [v26 setTag:v4];
    [(RTTUIUtteranceCell *)self setBackgroundView:v26];
    double v27 = [MEMORY[0x263F1C550] clearColor];
    [(RTTUIUtteranceCell *)self setBackgroundColor:v27];
  }
  char IsRTTNotificationContentExtension = Soft_AXProcessIsRTTNotificationContentExtension();
  if (v6 && (IsRTTNotificationContentExtension & 1) == 0)
  {
    uint64_t v29 = (void *)MEMORY[0x263EFF9A0];
    double v30 = [(UITextView *)self->_textView linkTextAttributes];
    v31 = [v29 dictionaryWithDictionary:v30];

    double v32 = [MEMORY[0x263F1C550] whiteColor];
    [v31 setValue:v32 forKey:*MEMORY[0x263F1C240]];

    [v31 setValue:&unk_26D522880 forKey:*MEMORY[0x263F1C2D8]];
    [(UITextView *)self->_textView setLinkTextAttributes:v31];
  }
  double v33 = self->_textView;
  double v34 = +[RTTUIUtilities sharedUtilityProvider];
  [v34 textInsetForMe:v4];
  -[UITextView setTextContainerInset:](v33, "setTextContainerInset:");

  double v35 = [(RTTUIUtteranceCell *)self utterance];
  double v36 = [v35 text];

  double v37 = [(RTTUIUtteranceCell *)self utterance];
  double v38 = [v37 text];
  double v39 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v40 = [v38 stringByTrimmingCharactersInSet:v39];
  uint64_t v41 = [v40 length];

  if (!v41)
  {

    double v36 = &stru_26D51E848;
  }
  [(UITextView *)self->_textView setText:v36];
  [(RTTUIUtteranceCell *)self adjustTextViewSize];
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  [(RTTUIUtteranceCell *)self adjustTextViewSize];
  double v5 = [(RTTUIUtteranceCell *)self utterance];
  int v6 = [v4 text];

  [v5 updateText:v6];
  double v7 = [(RTTUIUtteranceCell *)self delegate];

  if (v7)
  {
    id v8 = [(RTTUIUtteranceCell *)self delegate];
    [v8 utteranceCellDidUpdateContent:self];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  NSUInteger v3 = (void *)MEMORY[0x263EFE9F8];
  id v4 = [(RTTUIUtteranceCell *)self utterance];
  double v5 = [v4 contactPath];
  int v6 = [v3 contactForPhoneNumber:v5];

  if ([v6 isKeyAvailable:@"givenName"])
  {
    double v7 = [v6 givenName];
  }
  else
  {
    double v7 = &stru_26D51E848;
  }
  if (!-[__CFString length](v7, "length") && [v6 isKeyAvailable:@"emailAddresses"])
  {
    id v8 = [v6 emailAddresses];
    double v9 = [v8 firstObject];
    uint64_t v10 = [v9 label];

    double v7 = (__CFString *)v10;
  }
  if (![(__CFString *)v7 length])
  {
    if ([v6 ttyIsMe])
    {
      uint64_t v11 = ttyLocString();
    }
    else
    {
      CGFloat v12 = [(RTTUIUtteranceCell *)self utterance];
      uint64_t v11 = [(__CFString *)v12 contactPath];

      double v7 = v12;
    }

    double v7 = (__CFString *)v11;
  }
  if (![(__CFString *)v7 length])
  {
    uint64_t v13 = ttyLocString();

    double v7 = (__CFString *)v13;
  }

  return v7;
}

- (id)accessibilityValue
{
  id v2 = [(RTTUIUtteranceCell *)self utterance];
  NSUInteger v3 = [v2 text];

  return v3;
}

- (void)_accessibilityHandleATFocused:(BOOL)a3 assistiveTech:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RTTUIUtteranceCell;
  [(RTTUIUtteranceCell *)&v5 _accessibilityHandleATFocused:a3 assistiveTech:a4];
  [(RTTUIUtteranceCell *)self _accessibilitySetIsUnread:0];
}

- (BOOL)_accessibilityRealtimeCompleted
{
  id v2 = [(RTTUIUtteranceCell *)self utterance];
  char v3 = [v2 isComplete];

  return v3;
}

- (RTTUtterance)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
}

- (BOOL)isEditingUtterance
{
  return self->_editingUtterance;
}

- (void)setEditingUtterance:(BOOL)a3
{
  self->_editingUtterance = a3;
}

- (RTTUIUtteranceCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RTTUIUtteranceCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_accessibilityIsUnread
{
  return self->_accessibilityIsUnread;
}

- (void)_accessibilitySetIsUnread:(BOOL)a3
{
  self->_accessibilityIsUnread = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_bubbleLayer, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end