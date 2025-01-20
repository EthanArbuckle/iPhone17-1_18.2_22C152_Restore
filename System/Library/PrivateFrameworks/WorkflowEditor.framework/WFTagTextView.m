@interface WFTagTextView
- (NSString)placeholder;
- (WFTagTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)paste:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)updateTextAttachments;
- (void)updateTextContainerInsets;
@end

@implementation WFTagTextView

- (void)paste:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F82A18] generalPasteboard];
  v29[0] = @"is.workflow.my.tagfield";
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  int v7 = [v5 containsPasteboardTypes:v6];

  if (v7)
  {
    unint64_t v8 = [(WFTagTextView *)self selectedRange];
    v9 = [(WFTagTextView *)self textStorage];
    unint64_t v10 = [v9 length];

    if (v8 >= v10)
    {
      v11 = [(WFTagTextView *)self typingAttributes];
      v13 = (void *)[v11 mutableCopy];
    }
    else
    {
      v11 = [(WFTagTextView *)self textStorage];
      v12 = objc_msgSend(v11, "attributesAtIndex:effectiveRange:", -[WFTagTextView selectedRange](self, "selectedRange"), 0);
      v13 = (void *)[v12 mutableCopy];
    }
    [v13 removeObjectForKey:*MEMORY[0x263F814A0]];
    v14 = [MEMORY[0x263F82A18] generalPasteboard];
    v15 = [v14 dataForPasteboardType:@"is.workflow.my.tagfield"];

    v16 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
    v17 = WFAttributedTextFromSerializedTagString(v16, v13);
    v18 = [(WFTagTextView *)self textStorage];
    uint64_t v19 = [(WFTagTextView *)self selectedRange];
    objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", v19, v20, v17);

    -[WFTagTextView setSelectedRange:](self, "setSelectedRange:", -[WFTagTextView selectedRange](self, "selectedRange") + [v17 length], 0);
    [(WFTagTextView *)self updateTextAttachments];
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 postNotificationName:*MEMORY[0x263F83BE8] object:self];

    v22 = [(WFTagTextView *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      v24 = [(WFTagTextView *)self delegate];
      [v24 textViewDidChange:self];
    }
    v25 = [(WFTagTextView *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      v27 = [(WFTagTextView *)self delegate];
      [v27 textViewDidChangeSelection:self];
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)WFTagTextView;
    [(WFTagTextView *)&v28 paste:v4];
  }
}

- (void)copy:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFTagTextView *)self attributedText];
  uint64_t v6 = [(WFTagTextView *)self selectedRange];
  unint64_t v8 = objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);

  v9 = WFSerializedTagStringFromAttributedText(v8);
  if ([v9 length])
  {
    unint64_t v10 = [(id)*MEMORY[0x263F1DD38] identifier];
    v17[0] = v10;
    v11 = +[WFValueTextAttachment humanReadableStringFromValueTextAttributedString:v8];
    v17[1] = @"is.workflow.my.tagfield";
    v18[0] = v11;
    v18[1] = v9;
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    v13 = [MEMORY[0x263F82A18] generalPasteboard];
    v16 = v12;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [v13 setItems:v14];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFTagTextView;
    [(WFTagTextView *)&v15 copy:v4];
  }
}

- (void)cut:(id)a3
{
  id v4 = a3;
  v5 = [(WFTagTextView *)self attributedText];
  uint64_t v6 = [(WFTagTextView *)self selectedRange];
  unint64_t v8 = objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);

  v9 = WFSerializedTagStringFromAttributedText(v8);
  if (![v9 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)WFTagTextView;
    [(WFTagTextView *)&v13 cut:v4];
    goto LABEL_5;
  }
  [(WFTagTextView *)self copy:v4];

  [(WFTagTextView *)self deleteBackward];
  unint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:*MEMORY[0x263F83BE8] object:self];

  v11 = [(WFTagTextView *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v4 = [(WFTagTextView *)self delegate];
    [v4 textViewDidChange:self];
LABEL_5:
  }
}

- (void)updateTextAttachments
{
  v3 = [(WFTagTextView *)self textStorage];
  uint64_t v4 = *MEMORY[0x263F814A0];
  v5 = [(WFTagTextView *)self textStorage];
  uint64_t v6 = [v5 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__WFTagTextView_updateTextAttachments__block_invoke;
  v7[3] = &unk_264BFD140;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);
}

void __38__WFTagTextView_updateTextAttachments__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [*(id *)(a1 + 32) textStorage];
    unint64_t v8 = [v7 attributesAtIndex:a3 effectiveRange:0];
    v9 = (void *)[v8 mutableCopy];

    unint64_t v10 = [*(id *)(a1 + 32) tintColor];
    [v9 setObject:v10 forKey:*MEMORY[0x263F81500]];

    [v12 setAttributes:v9];
    v14.location = [*(id *)(a1 + 32) selectedRange];
    v15.location = a3;
    v15.length = a4;
    objc_msgSend(v12, "setSelected:", NSIntersectionRange(v14, v15).length == a4);
    if ([v12 requiresRedraw])
    {
      v11 = [*(id *)(a1 + 32) textStorage];
      objc_msgSend(v11, "edited:range:changeInLength:", 1, a3, a4, 0);
    }
  }
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFTagTextView;
  [(WFTagTextView *)&v4 setText:a3];
  [(WFTagTextView *)self updateTextContainerInsets];
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFTagTextView;
  [(WFTagTextView *)&v4 setAttributedText:a3];
  [(WFTagTextView *)self updateTextContainerInsets];
}

- (void)updateTextContainerInsets
{
  __int16 v8 = -4;
  v3 = [NSString stringWithCharacters:&v8 length:1];
  objc_super v4 = [(WFTagTextView *)self attributedText];
  v5 = [v4 string];
  uint64_t v6 = [v5 rangeOfString:v3 options:0];

  double v7 = 8.0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    double v7 = 12.0;
  }
  -[WFTagTextView setTextContainerInset:](self, "setTextContainerInset:", v7, 0.0, 8.0, 0.0);
}

- (NSString)placeholder
{
  v2 = [(WFTagTextView *)self attributedPlaceholder];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setFont:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFTagTextView;
  [(WFTagTextView *)&v6 setFont:a3];
  objc_super v4 = [(WFTagTextView *)self placeholder];

  if (v4)
  {
    v5 = [(WFTagTextView *)self placeholder];
    [(WFTagTextView *)self setPlaceholder:v5];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFTagTextView;
  [(WFTagTextView *)&v6 setTextAlignment:a3];
  objc_super v4 = [(WFTagTextView *)self placeholder];

  if (v4)
  {
    v5 = [(WFTagTextView *)self placeholder];
    [(WFTagTextView *)self setPlaceholder:v5];
  }
}

- (void)setPlaceholder:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  objc_super v4 = (void *)MEMORY[0x263F81658];
  v5 = (__CFString *)a3;
  objc_super v6 = [v4 defaultParagraphStyle];
  double v7 = (void *)[v6 mutableCopy];

  objc_msgSend(v7, "setAlignment:", -[WFTagTextView textAlignment](self, "textAlignment"));
  id v8 = objc_alloc(MEMORY[0x263F086A0]);
  if (v5) {
    v9 = v5;
  }
  else {
    v9 = &stru_26E7AB6D0;
  }
  v16[0] = *MEMORY[0x263F81500];
  unint64_t v10 = [MEMORY[0x263F825C8] placeholderTextColor];
  uint64_t v11 = *MEMORY[0x263F81540];
  v17[0] = v10;
  v17[1] = v7;
  uint64_t v12 = *MEMORY[0x263F814F0];
  v16[1] = v11;
  v16[2] = v12;
  objc_super v13 = [(WFTagTextView *)self font];
  void v17[2] = v13;
  NSRange v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  NSRange v15 = (void *)[v8 initWithString:v9 attributes:v14];

  [(WFTagTextView *)self setAttributedPlaceholder:v15];
  [(WFTagTextView *)self setNeedsLayout];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83BE8] object:self];

  v4.receiver = self;
  v4.super_class = (Class)WFTagTextView;
  [(WFTagTextView *)&v4 dealloc];
}

- (WFTagTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFTagTextView;
  objc_super v4 = -[WFTagTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(WFTagTextView *)v4 setScrollEnabled:1];
    [(WFTagTextView *)v5 setShowsHorizontalScrollIndicator:1];
    [(WFTagTextView *)v5 setShowsVerticalScrollIndicator:0];
    [(WFTagTextView *)v5 setScrollsToTop:0];
    objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v5 selector:sel_textDidChange_ name:*MEMORY[0x263F83BE8] object:v5];

    double v7 = v5;
  }

  return v5;
}

@end