@interface WFSlotTemplateTypingTextView
- (BOOL)clearsZeroWhenTyping;
- (CGRect)accessibilityFrame;
- (CGRect)caretRectForPosition:(id)a3;
- (UIFont)emojiOverrideFont;
- (WFSlotTemplateTypingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)selectionRectsForRange:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)paste:(id)a3;
- (void)setClearsZeroWhenTyping:(BOOL)a3;
- (void)setEmojiOverrideFont:(id)a3;
- (void)wf_applyEmojiOverrideFont;
- (void)wf_replaceRange:(_NSRange)a3 withAttributedText:(id)a4;
@end

@implementation WFSlotTemplateTypingTextView

- (void).cxx_destruct
{
}

- (void)setEmojiOverrideFont:(id)a3
{
}

- (UIFont)emojiOverrideFont
{
  return self->_emojiOverrideFont;
}

- (void)setClearsZeroWhenTyping:(BOOL)a3
{
  self->_clearsZeroWhenTyping = a3;
}

- (BOOL)clearsZeroWhenTyping
{
  return self->_clearsZeroWhenTyping;
}

- (CGRect)accessibilityFrame
{
  [(WFSlotTemplateTypingTextView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(WFSlotTemplateTypingTextView *)self textContainerInset];
  -[WFSlotTemplateTypingTextView convertRect:toView:](self, "convertRect:toView:", 0, v4 + v12, v6 + v11, v8 - (v12 + v14), v10 - (v11 + v13));
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)wf_applyEmojiOverrideFont
{
  id v5 = [(WFSlotTemplateTypingTextView *)self emojiOverrideFont];
  if (v5)
  {
    double v3 = [(WFSlotTemplateTypingTextView *)self typingAttributes];
    double v4 = (void *)[v3 mutableCopy];

    [v4 setValue:v5 forKey:*MEMORY[0x263F814F0]];
    [(WFSlotTemplateTypingTextView *)self setTypingAttributes:v4];
  }
}

- (void)paste:(id)a3
{
  id v4 = a3;
  [(WFSlotTemplateTypingTextView *)self wf_applyEmojiOverrideFont];
  id v5 = [(WFSlotTemplateTypingTextView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(WFSlotTemplateTypingTextView *)self delegate];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__WFSlotTemplateTypingTextView_paste___block_invoke;
    v9[3] = &unk_264BFD500;
    id v10 = v4;
    double v11 = self;
    [v7 slotTemplateTypingTextViewDidPaste:self withOriginalBlock:v9];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSlotTemplateTypingTextView;
    [(WFSlotTemplateTypingTextView *)&v8 paste:v4];
  }
  [(WFSlotTemplateTypingTextView *)self wf_applyEmojiOverrideFont];
}

id __38__WFSlotTemplateTypingTextView_paste___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  return objc_msgSendSuper2(&v3, sel_paste_, v1);
}

- (void)copy:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSlotTemplateTypingTextView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(WFSlotTemplateTypingTextView *)self delegate];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __37__WFSlotTemplateTypingTextView_copy___block_invoke;
    v9[3] = &unk_264BFD500;
    id v10 = v4;
    double v11 = self;
    [v7 slotTemplateTypingTextViewDidCopy:self withOriginalBlock:v9];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSlotTemplateTypingTextView;
    [(WFSlotTemplateTypingTextView *)&v8 copy:v4];
  }
}

id __37__WFSlotTemplateTypingTextView_copy___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  return objc_msgSendSuper2(&v3, sel_copy_, v1);
}

- (void)cut:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSlotTemplateTypingTextView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(WFSlotTemplateTypingTextView *)self delegate];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__WFSlotTemplateTypingTextView_cut___block_invoke;
    v9[3] = &unk_264BFD500;
    id v10 = v4;
    double v11 = self;
    [v7 slotTemplateTypingTextViewDidCut:self withOriginalBlock:v9];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSlotTemplateTypingTextView;
    [(WFSlotTemplateTypingTextView *)&v8 cut:v4];
  }
}

id __36__WFSlotTemplateTypingTextView_cut___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  return objc_msgSendSuper2(&v3, sel_cut_, v1);
}

- (void)wf_replaceRange:(_NSRange)a3 withAttributedText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v7 = a3.location + a3.length;
  id v8 = a4;
  double v9 = [(WFSlotTemplateTypingTextView *)self attributedText];
  unint64_t v10 = [v9 length];

  NSUInteger v11 = length;
  if (v7 > v10)
  {
    double v12 = [(WFSlotTemplateTypingTextView *)self attributedText];
    NSUInteger v11 = [v12 length] - location;
  }
  double v13 = [(WFSlotTemplateTypingTextView *)self undoManager];
  double v14 = [v13 prepareWithInvocationTarget:self];
  uint64_t v15 = [v8 length];
  double v16 = [(WFSlotTemplateTypingTextView *)self attributedText];
  double v17 = objc_msgSend(v16, "attributedSubstringFromRange:", location, v11);
  objc_msgSend(v14, "wf_replaceRange:withAttributedText:", location, v15, v17);

  id v23 = (id)[v8 mutableCopy];
  double v18 = [(WFSlotTemplateTypingTextView *)self typingAttributes];
  objc_msgSend(v23, "addAttributes:range:", v18, 0, objc_msgSend(v8, "length"));

  v19 = [(WFSlotTemplateTypingTextView *)self textStorage];
  objc_msgSend(v19, "replaceCharactersInRange:withAttributedString:", location, length, v23);

  uint64_t v20 = [v8 length];
  -[WFSlotTemplateTypingTextView setSelectedRange:](self, "setSelectedRange:", v20 + location, 0);
  v21 = [(WFSlotTemplateTypingTextView *)self delegate];
  if (v21 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v21 textViewDidChange:self];
  }
  v22 = [MEMORY[0x263F08A00] defaultCenter];
  [v22 postNotificationName:*MEMORY[0x263F83BE8] object:self];
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  if ([(WFSlotTemplateTypingTextView *)self clearsZeroWhenTyping])
  {
    id v5 = [(WFSlotTemplateTypingTextView *)self text];
    int v6 = [v5 isEqualToString:@"0"];

    if (v6) {
      [(WFSlotTemplateTypingTextView *)self deleteBackward];
    }
  }
  [(WFSlotTemplateTypingTextView *)self wf_applyEmojiOverrideFont];
  v7.receiver = self;
  v7.super_class = (Class)WFSlotTemplateTypingTextView;
  [(WFSlotTemplateTypingTextView *)&v7 insertText:v4];

  [(WFSlotTemplateTypingTextView *)self wf_applyEmojiOverrideFont];
}

- (void)deleteBackward
{
  objc_super v3 = [(WFSlotTemplateTypingTextView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFSlotTemplateTypingTextView *)self delegate];
    [v5 slotTemplateTypingTextViewDidDelete:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateTypingTextView;
  [(WFSlotTemplateTypingTextView *)&v6 deleteBackward];
}

- (id)selectionRectsForRange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateTypingTextView;
  objc_super v3 = [(WFSlotTemplateTypingTextView *)&v6 selectionRectsForRange:a3];
  char v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_2057);

  return v4;
}

uint64_t __55__WFSlotTemplateTypingTextView_selectionRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_selectionRectByInsetting:", 3.0, 0.0, 3.0, 0.0);
}

- (CGRect)caretRectForPosition:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFSlotTemplateTypingTextView;
  [(WFSlotTemplateTypingTextView *)&v3 caretRectForPosition:a3];
  return CGRectInset(v4, 0.0, 5.0);
}

- (WFSlotTemplateTypingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFSlotTemplateTypingTextView;
  CGRect v4 = -[WFSlotTemplateTypingTextView initWithFrame:textContainer:](&v8, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = v4;
  if (v4) {
    objc_super v6 = v4;
  }

  return v5;
}

@end