@interface WFContactTextView
- (BOOL)allowsTextEntry;
- (NSSet)supportedPersonProperties;
- (NSString)placeholder;
- (WFContactTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)attributesByAddingTintColorToAttributes:(id)a3;
- (id)attributesForPasting;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)paste:(id)a3;
- (void)pasteAttributedString:(id)a3;
- (void)setAllowsTextEntry:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setSupportedPersonProperties:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)tintColorDidChange;
- (void)updateTextAttachments;
- (void)updateTextContainerInsets;
@end

@implementation WFContactTextView

- (void).cxx_destruct
{
}

- (void)setSupportedPersonProperties:(id)a3
{
}

- (NSSet)supportedPersonProperties
{
  return self->_supportedPersonProperties;
}

- (void)setAllowsTextEntry:(BOOL)a3
{
  self->_allowsTextEntry = a3;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (void)paste:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F82A18] generalPasteboard];
  v35[0] = @"is.workflow.my.contactfield";
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  int v7 = [v5 containsPasteboardTypes:v6];

  if (v7)
  {
    v8 = [v5 valueForPasteboardType:@"is.workflow.my.contactfield"];
    v9 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:0];
    v10 = (void *)[objc_alloc(MEMORY[0x263F869F8]) initWithSerializedRepresentation:v9 variableProvider:0 parameter:0];
    v11 = [v10 parameterStates];
    v12 = [(WFContactTextView *)self attributesForPasting];
    v13 = WFAttributedStringFromContactEntries(v11, v12, [(WFContactTextView *)self allowsTextEntry]);

    [(WFContactTextView *)self pasteAttributedString:v13];
    goto LABEL_16;
  }
  v14 = [v5 string];
  if (![v14 containsString:@","]
    || ![(WFContactTextView *)self allowsTextEntry])
  {

    goto LABEL_15;
  }
  v15 = [(WFContactTextView *)self supportedPersonProperties];
  int v16 = [v15 containsObject:&unk_26E7C1720];

  if (!v16)
  {
LABEL_15:
    v29.receiver = self;
    v29.super_class = (Class)WFContactTextView;
    [(WFContactTextView *)&v29 paste:v4];
    goto LABEL_16;
  }
  v28 = self;
  v17 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v18 = [v5 string];
  v19 = [v18 componentsSeparatedByString:@","];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v25 = [(WFValueTextAttachment *)[WFContactTextAttachment alloc] initWithData:0 ofType:0];
        [(WFValueTextAttachment *)v25 setStringValue:v24];
        v26 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v25];
        [v17 appendAttributedString:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  v27 = [(WFContactTextView *)v28 attributesForPasting];
  objc_msgSend(v17, "addAttributes:range:", v27, 0, objc_msgSend(v17, "length"));

  [(WFContactTextView *)v28 pasteAttributedString:v17];
LABEL_16:
}

- (void)pasteAttributedString:(id)a3
{
  id v4 = a3;
  v5 = [(WFContactTextView *)self textStorage];
  uint64_t v6 = [(WFContactTextView *)self selectedRange];
  objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", v6, v7, v4);

  uint64_t v8 = [(WFContactTextView *)self selectedRange];
  uint64_t v9 = [v4 length];

  -[WFContactTextView setSelectedRange:](self, "setSelectedRange:", v8 + v9, 0);
  [(WFContactTextView *)self updateTextAttachments];
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:*MEMORY[0x263F83BE8] object:self];

  v11 = [(WFContactTextView *)self delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    v12 = [(WFContactTextView *)self delegate];
    [v12 textViewDidChange:self];
  }
  v13 = [(WFContactTextView *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(WFContactTextView *)self delegate];
    [v15 textViewDidChangeSelection:self];
  }
}

- (id)attributesForPasting
{
  unint64_t v3 = [(WFContactTextView *)self selectedRange];
  id v4 = [(WFContactTextView *)self textStorage];
  unint64_t v5 = [v4 length];

  if (v3 >= v5)
  {
    uint64_t v6 = [(WFContactTextView *)self typingAttributes];
    uint64_t v8 = (void *)[v6 mutableCopy];
  }
  else
  {
    uint64_t v6 = [(WFContactTextView *)self textStorage];
    uint64_t v7 = objc_msgSend(v6, "attributesAtIndex:effectiveRange:", -[WFContactTextView selectedRange](self, "selectedRange"), 0);
    uint64_t v8 = (void *)[v7 mutableCopy];
  }
  [v8 removeObjectForKey:*MEMORY[0x263F814A0]];
  return v8;
}

- (void)copy:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(WFContactTextView *)self attributedText];
  uint64_t v6 = [(WFContactTextView *)self selectedRange];
  uint64_t v8 = objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);

  uint64_t v9 = WFContactStateFromAttributedString(v8);
  v10 = [v9 value];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F08AC0];
    v13 = [v9 serializedRepresentation];
    char v14 = [v12 dataWithPropertyList:v13 format:200 options:0 error:0];

    id v15 = [(id)*MEMORY[0x263F1DD38] identifier];
    v22[0] = v15;
    int v16 = +[WFValueTextAttachment humanReadableStringFromValueTextAttributedString:v8];
    v22[1] = @"is.workflow.my.contactfield";
    v23[0] = v16;
    v23[1] = v14;
    v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    v18 = [MEMORY[0x263F82A18] generalPasteboard];
    uint64_t v21 = v17;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    [v18 setItems:v19];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)WFContactTextView;
    [(WFContactTextView *)&v20 copy:v4];
  }
}

- (void)cut:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WFContactTextView *)self attributedText];
  uint64_t v6 = [(WFContactTextView *)self selectedRange];
  uint64_t v8 = objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);

  uint64_t v9 = WFContactStateFromAttributedString(v8);
  v10 = [v9 value];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)WFContactTextView;
    [(WFContactTextView *)&v15 cut:v4];
    goto LABEL_5;
  }
  [(WFContactTextView *)self copy:v4];

  [(WFContactTextView *)self deleteBackward];
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:*MEMORY[0x263F83BE8] object:self];

  v13 = [(WFContactTextView *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v4 = [(WFContactTextView *)self delegate];
    [v4 textViewDidChange:self];
LABEL_5:
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFContactTextView;
  [(WFContactTextView *)&v3 tintColorDidChange];
  [(WFContactTextView *)self updateTextAttachments];
}

- (void)updateTextAttachments
{
  objc_super v3 = [(WFContactTextView *)self textStorage];
  uint64_t v4 = *MEMORY[0x263F814A0];
  unint64_t v5 = [(WFContactTextView *)self textStorage];
  uint64_t v6 = [v5 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__WFContactTextView_updateTextAttachments__block_invoke;
  v7[3] = &unk_264BFD1A8;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);
}

void __42__WFContactTextView_updateTextAttachments__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v7 textStorage];
    uint64_t v9 = [v8 attributesAtIndex:a3 effectiveRange:0];
    v10 = [v7 attributesByAddingTintColorToAttributes:v9];

    [v12 setAttributes:v10];
    v14.location = [*(id *)(a1 + 32) selectedRange];
    v15.location = a3;
    v15.length = a4;
    objc_msgSend(v12, "setSelected:", NSIntersectionRange(v14, v15).length == a4);
    if ([v12 requiresRedraw])
    {
      uint64_t v11 = [*(id *)(a1 + 32) textStorage];
      objc_msgSend(v11, "edited:range:changeInLength:", 1, a3, a4, 0);
    }
  }
}

- (id)attributesByAddingTintColorToAttributes:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  unint64_t v5 = [(WFContactTextView *)self tintColor];
  [v4 setObject:v5 forKey:*MEMORY[0x263F81500]];

  return v4;
}

- (void)setFont:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFContactTextView;
  [(WFContactTextView *)&v6 setFont:a3];
  uint64_t v4 = [(WFContactTextView *)self placeholder];

  if (v4)
  {
    unint64_t v5 = [(WFContactTextView *)self placeholder];
    [(WFContactTextView *)self setPlaceholder:v5];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFContactTextView;
  [(WFContactTextView *)&v6 setTextAlignment:a3];
  uint64_t v4 = [(WFContactTextView *)self placeholder];

  if (v4)
  {
    unint64_t v5 = [(WFContactTextView *)self placeholder];
    [(WFContactTextView *)self setPlaceholder:v5];
  }
}

- (NSString)placeholder
{
  v2 = [(WFContactTextView *)self attributedPlaceholder];
  objc_super v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setPlaceholder:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263F81658];
  unint64_t v5 = (__CFString *)a3;
  objc_super v6 = [v4 defaultParagraphStyle];
  uint64_t v7 = (void *)[v6 mutableCopy];

  objc_msgSend(v7, "setAlignment:", -[WFContactTextView textAlignment](self, "textAlignment"));
  id v8 = objc_alloc(MEMORY[0x263F086A0]);
  if (v5) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = &stru_26E7AB6D0;
  }
  v16[0] = *MEMORY[0x263F81500];
  v10 = [MEMORY[0x263F825C8] placeholderTextColor];
  uint64_t v11 = *MEMORY[0x263F81540];
  v17[0] = v10;
  v17[1] = v7;
  uint64_t v12 = *MEMORY[0x263F814F0];
  v16[1] = v11;
  v16[2] = v12;
  v13 = [(WFContactTextView *)self font];
  v17[2] = v13;
  NSRange v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  NSRange v15 = (void *)[v8 initWithString:v9 attributes:v14];

  [(WFContactTextView *)self setAttributedPlaceholder:v15];
  [(WFContactTextView *)self setNeedsLayout];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFContactTextView;
  [(WFContactTextView *)&v4 setText:a3];
  [(WFContactTextView *)self updateTextContainerInsets];
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFContactTextView;
  [(WFContactTextView *)&v4 setAttributedText:a3];
  [(WFContactTextView *)self updateTextContainerInsets];
}

- (void)updateTextContainerInsets
{
  __int16 v8 = -4;
  objc_super v3 = [NSString stringWithCharacters:&v8 length:1];
  objc_super v4 = [(WFContactTextView *)self attributedText];
  unint64_t v5 = [v4 string];
  uint64_t v6 = [v5 rangeOfString:v3 options:0];

  double v7 = 8.0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    double v7 = 12.0;
  }
  -[WFContactTextView setTextContainerInset:](self, "setTextContainerInset:", v7, 0.0, 8.0, 0.0);
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83BE8] object:self];

  v4.receiver = self;
  v4.super_class = (Class)WFContactTextView;
  [(WFContactTextView *)&v4 dealloc];
}

- (WFContactTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFContactTextView;
  objc_super v4 = -[WFContactTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  unint64_t v5 = v4;
  if (v4)
  {
    [(WFContactTextView *)v4 setScrollEnabled:1];
    [(WFContactTextView *)v5 setShowsHorizontalScrollIndicator:1];
    [(WFContactTextView *)v5 setShowsVerticalScrollIndicator:0];
    [(WFContactTextView *)v5 setScrollsToTop:0];
    [(WFContactTextView *)v5 updateTextContainerInsets];
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v5 selector:sel_textDidChange_ name:*MEMORY[0x263F83BE8] object:v5];

    double v7 = v5;
  }

  return v5;
}

@end