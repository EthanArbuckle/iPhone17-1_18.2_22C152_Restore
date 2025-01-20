@interface WFTagField
- (BOOL)allowsTextEntry;
- (BOOL)isEditable;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)tokenizeFreeTextFromRange:(_NSRange)a3;
- (NSArray)suggestedTags;
- (NSString)fieldTitle;
- (NSString)placeholder;
- (NSString)tags;
- (UIButton)plusButton;
- (WFTagField)initWithFrame:(CGRect)a3;
- (WFTagField)initWithFrame:(CGRect)a3 showsAddButton:(BOOL)a4;
- (WFTagFieldDelegate)delegate;
- (WFTagTextView)textView;
- (WFTextScrollView)scrollView;
- (_NSRange)selectedRange;
- (id)containingViewController;
- (id)updateBlock;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)textAlignment;
- (void)insertTag:(id)a3;
- (void)layoutSubviews;
- (void)selectTag;
- (void)setAllowsTextEntry:(BOOL)a3;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setFieldTitle:(id)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlusButton:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setSuggestedTags:(id)a3;
- (void)setTags:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextView:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)tagPicker:(id)a3 didSelectTags:(id)a4;
- (void)tagPickerDidCancel:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)updateEditableState;
- (void)updateTags;
@end

@implementation WFTagField

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_plusButton);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_suggestedTags, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fieldTitle, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (_NSRange)selectedRange
{
  p_selectedRange = &self->_selectedRange;
  NSUInteger location = self->_selectedRange.location;
  NSUInteger length = p_selectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPlusButton:(id)a3
{
}

- (UIButton)plusButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plusButton);
  return (UIButton *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (WFTextScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (WFTextScrollView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (WFTagTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (WFTagTextView *)WeakRetained;
}

- (void)setUpdateBlock:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setSuggestedTags:(id)a3
{
}

- (NSArray)suggestedTags
{
  return self->_suggestedTags;
}

- (void)setDelegate:(id)a3
{
}

- (WFTagFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTagFieldDelegate *)WeakRetained;
}

- (void)setFieldTitle:(id)a3
{
}

- (NSString)fieldTitle
{
  return self->_fieldTitle;
}

- (NSString)tags
{
  return self->_tags;
}

- (void)tagPickerDidCancel:(id)a3
{
  id v3 = [a3 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)tagPicker:(id)a3 didSelectTags:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [a3 presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[WFTagField insertTag:](self, "insertTag:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)updateTags
{
  id v3 = [(WFTagField *)self textView];
  v4 = [v3 attributedText];
  v5 = WFSerializedTagStringFromAttributedText(v4);
  [(WFTagField *)self setTags:v5];

  [(WFTagField *)self updateEditableState];
  updateBlock = (void (**)(id, id))self->_updateBlock;
  if (updateBlock)
  {
    id v7 = [(WFTagField *)self tags];
    updateBlock[2](updateBlock, v7);
  }
}

- (void)insertTag:(id)a3
{
  id v4 = a3;
  v22 = [(WFValueTextAttachment *)[WFTagTextAttachment alloc] initWithData:0 ofType:0];
  [(WFValueTextAttachment *)v22 setStringValue:v4];

  v5 = [(WFTagField *)self textView];
  id v6 = [v5 textStorage];
  id v7 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v22];
  objc_msgSend(v6, "insertAttributedString:atIndex:", v7, -[WFTagField selectedRange](self, "selectedRange"));

  id v8 = [(WFTagField *)self textView];
  uint64_t v9 = [v8 textStorage];
  uint64_t v10 = [(WFTagField *)self textView];
  uint64_t v11 = [v10 typingAttributes];
  objc_msgSend(v9, "addAttributes:range:", v11, -[WFTagField selectedRange](self, "selectedRange"), 1);

  uint64_t v12 = [(WFTagField *)self selectedRange] + 1;
  long long v13 = [(WFTagField *)self textView];
  objc_msgSend(v13, "setSelectedRange:", v12, 0);

  long long v14 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v15 = *MEMORY[0x263F83BE8];
  long long v16 = [(WFTagField *)self textView];
  [v14 postNotificationName:v15 object:v16];

  v17 = [(WFTagField *)self scrollView];
  uint64_t v18 = [(WFTagField *)self textView];
  v19 = [(WFTagField *)self textView];
  v20 = [v19 selectedTextRange];
  v21 = [v20 end];
  [v18 caretRectForPosition:v21];
  objc_msgSend(v17, "scrollRectToVisible:animated:", 0);

  [(WFTagField *)self updateTags];
}

- (void)selectTag
{
  id v3 = [(WFTagField *)self textView];
  uint64_t v4 = [v3 selectedRange];
  -[WFTagField tokenizeFreeTextFromRange:](self, "tokenizeFreeTextFromRange:", v4, v5);

  id v6 = [(WFTagField *)self textView];
  [v6 resignFirstResponder];

  id v7 = [WFTagPickerViewController alloc];
  id v8 = [(WFTagField *)self fieldTitle];
  uint64_t v9 = [(WFTagField *)self suggestedTags];
  uint64_t v15 = [(WFTagPickerViewController *)v7 initWithTitle:v8 tags:v9];

  [(WFTagPickerViewController *)v15 setDelegate:self];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v15];
  [v10 setModalPresentationStyle:7];
  uint64_t v11 = [(WFTagField *)self containingViewController];
  [v11 presentViewController:v10 animated:1 completion:0];

  uint64_t v12 = [v10 popoverPresentationController];
  [v12 setPermittedArrowDirections:3];
  long long v13 = [(WFTagField *)self plusButton];
  [v12 setSourceView:v13];

  long long v14 = [(WFTagField *)self plusButton];
  [v14 bounds];
  objc_msgSend(v12, "setSourceRect:");
}

- (id)containingViewController
{
  id v3 = [(WFTagField *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(WFTagField *)self delegate];
    id v6 = [v5 viewControllerContainingTagField:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 attributedText];
  uint64_t v6 = [v5 length];

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3010000000;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  long long v13 = &unk_234BA41F7;
  id v7 = [v4 attributedText];
  uint64_t v8 = *MEMORY[0x263F814A0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__WFTagField_textViewDidChange___block_invoke;
  v9[3] = &unk_264BFD6F0;
  v9[4] = &v10;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v6, 0, v9);

  if (v6 == v11[5] + v11[4]) {
    [(WFTagField *)self updateTags];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __32__WFTagField_textViewDidChange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
    if ((unint64_t)(a3 + a4) > *(void *)(v4 + 40) + *(void *)(v4 + 32))
    {
      *(void *)(v4 + 32) = a3;
      *(void *)(v4 + 40) = a4;
    }
  }
  return result;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v12 = [v10 rangeOfCharacterFromSet:v11 options:0];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!-[WFTagField tokenizeFreeTextFromRange:](self, "tokenizeFreeTextFromRange:", location, length)) {
      [v9 resignFirstResponder];
    }
    goto LABEL_10;
  }
  [v9 selectedRange];
  long long v13 = (uint64_t *)MEMORY[0x263F814A0];
  if (v14 || [v10 length]) {
    goto LABEL_4;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  LOBYTE(v29) = 0;
  v23 = [v9 attributedText];
  uint64_t v24 = *v13;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke;
  v32[3] = &unk_264BFD6F0;
  v32[4] = &v26;
  objc_msgSend(v23, "enumerateAttribute:inRange:options:usingBlock:", v24, location, length, 0, v32);

  if (*((unsigned char *)v27 + 24))
  {
    objc_msgSend(v9, "setSelectedRange:", location, length);
    _Block_object_dispose(&v26, 8);
LABEL_10:
    BOOL v21 = 0;
    goto LABEL_13;
  }
  _Block_object_dispose(&v26, 8);
LABEL_4:
  uint64_t v15 = [(WFTagField *)self textView];
  long long v16 = [v15 attributedText];
  uint64_t v17 = [v16 length];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3010000000;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  v29 = &unk_234BA41F7;
  uint64_t v18 = [(WFTagField *)self textView];
  v19 = [v18 attributedText];
  uint64_t v20 = *v13;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke_2;
  v25[3] = &unk_264BFD6F0;
  v25[4] = &v26;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v17, 0, v25);

  BOOL v21 = ![v10 length]
     || [(WFTagField *)self allowsTextEntry] && location >= v27[5] + v27[4];
  _Block_object_dispose(&v26, 8);
LABEL_13:

  return v21;
}

uint64_t __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __63__WFTagField_textView_shouldChangeTextInRange_replacementText___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
    if ((unint64_t)(a3 + a4) > *(void *)(v4 + 40) + *(void *)(v4 + 32))
    {
      *(void *)(v4 + 32) = a3;
      *(void *)(v4 + 40) = a4;
    }
  }
  return result;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [(WFTagField *)self textView];
  [v4 updateTextAttachments];

  unint64_t v5 = [(WFTagField *)self selectedRange];
  uint64_t v6 = [v21 selectedRange];
  -[WFTagField setSelectedRange:](self, "setSelectedRange:", v6, v7);
  unint64_t v8 = [(WFTagField *)self selectedRange];
  id v9 = [v21 selectedTextRange];
  id v10 = v9;
  if (v8 >= v5) {
    [v9 end];
  }
  else {
  uint64_t v11 = [v9 start];
  }

  [v21 caretRectForPosition:v11];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(WFTagField *)self scrollView];
  objc_msgSend(v20, "scrollRectToVisible:animated:", 0, v13, v15, v17, v19);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v6 = [(WFTagField *)self textView];
  uint64_t v4 = [v6 selectedRange];
  -[WFTagField tokenizeFreeTextFromRange:](self, "tokenizeFreeTextFromRange:", v4, v5);
}

- (BOOL)tokenizeFreeTextFromRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  uint64_t v5 = [(WFTagField *)self textView];
  id v6 = [v5 attributedText];
  uint64_t v7 = [v6 length];

  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3010000000;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  v33 = &unk_234BA41F7;
  unint64_t v8 = [(WFTagField *)self textView];
  id v9 = [v8 attributedText];
  uint64_t v10 = *MEMORY[0x263F814A0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __40__WFTagField_tokenizeFreeTextFromRange___block_invoke;
  v29[3] = &unk_264BFD6F0;
  v29[4] = &v30;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v7, 0, v29);

  if (location <= v31[5] + v31[4])
  {
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v11 = [(WFTagField *)self textView];
    double v12 = [v11 attributedText];
    double v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = v31[5] + v31[4];
    uint64_t v16 = v7 - v14;
    BOOL v15 = v7 == v14;
    BOOL v17 = v7 != v14;
    if (!v15)
    {
      double v18 = [(WFValueTextAttachment *)[WFTagTextAttachment alloc] initWithData:0 ofType:0];
      double v19 = objc_msgSend(v13, "attributedSubstringFromRange:", v14, v16);
      uint64_t v20 = [v19 string];
      [(WFValueTextAttachment *)v18 setStringValue:v20];

      id v21 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v18];
      objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v14, v16, v21);

      v22 = [(WFTagField *)self textView];
      v23 = [v22 typingAttributes];
      objc_msgSend(v13, "addAttributes:range:", v23, 0, objc_msgSend(v13, "length"));

      uint64_t v24 = [(WFTagField *)self textView];
      [v24 setAttributedText:v13];

      v25 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v26 = [(WFTagField *)self textView];
      [v25 postNotificationName:*MEMORY[0x263F83BE8] object:v26];

      v27 = [(WFTagField *)self textView];
      [v27 updateTextAttachments];

      [(WFTagField *)self updateTags];
    }
  }
  _Block_object_dispose(&v30, 8);
  return v17;
}

uint64_t __40__WFTagField_tokenizeFreeTextFromRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
    if ((unint64_t)(a3 + a4) > *(void *)(v4 + 40) + *(void *)(v4 + 32))
    {
      *(void *)(v4 + 32) = a3;
      *(void *)(v4 + 40) = a4;
    }
  }
  return result;
}

- (void)updateEditableState
{
  if ([(WFTagField *)self isEditable])
  {
    if ([(WFTagField *)self allowsTextEntry])
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v4 = [(WFTagField *)self tags];
      BOOL v3 = [v4 length] != 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  uint64_t v5 = [(WFTagField *)self textView];
  [v5 setEditable:v3];

  id v6 = [(WFTagField *)self textView];
  [v6 setSelectable:v3];

  BOOL v7 = [(WFTagField *)self isEditable];
  unint64_t v8 = [(WFTagField *)self plusButton];
  [v8 setEnabled:v7];

  id v9 = [(WFTagField *)self scrollView];
  [v9 setUserInteractionEnabled:v3];
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
  [(WFTagField *)self updateEditableState];
}

- (void)setAllowsTextEntry:(BOOL)a3
{
  self->_allowsTextEntry = a3;
  [(WFTagField *)self updateEditableState];
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4 = [(WFTagField *)self textView];
  [v4 setTextAlignment:a3];
}

- (int64_t)textAlignment
{
  v2 = [(WFTagField *)self textView];
  int64_t v3 = [v2 textAlignment];

  return v3;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  id v4 = [(WFTagField *)self textView];
  [v4 setKeyboardAppearance:a3];
}

- (int64_t)keyboardAppearance
{
  v2 = [(WFTagField *)self textView];
  int64_t v3 = [v2 keyboardAppearance];

  return v3;
}

- (void)setKeyboardType:(int64_t)a3
{
  id v4 = [(WFTagField *)self textView];
  [v4 setKeyboardType:a3];
}

- (int64_t)keyboardType
{
  v2 = [(WFTagField *)self textView];
  int64_t v3 = [v2 keyboardType];

  return v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFTagField *)self textView];
  [v5 setPlaceholder:v4];
}

- (NSString)placeholder
{
  v2 = [(WFTagField *)self textView];
  int64_t v3 = [v2 placeholder];

  return (NSString *)v3;
}

- (void)setTags:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  tags = self->_tags;
  self->_tags = v5;

  BOOL v7 = [(WFTagField *)self textView];
  unint64_t v8 = [v7 typingAttributes];
  id v9 = WFAttributedTextFromSerializedTagString(v4, v8);

  uint64_t v10 = [(WFTagField *)self textView];
  [v10 setAttributedText:v9];

  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v12 = *MEMORY[0x263F83BE8];
  double v13 = [(WFTagField *)self textView];
  [v11 postNotificationName:v12 object:v13];

  id v14 = [(WFTagField *)self textView];
  [v14 updateTextAttachments];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)WFTagField;
  [(WFTagField *)&v17 layoutSubviews];
  [(WFTagField *)self bounds];
  double v4 = v3;
  id v5 = [(WFTagField *)self plusButton];
  double v6 = 35.0;
  if (!v5) {
    double v6 = 0.0;
  }
  double v7 = v4 - v6;
  [(WFTagField *)self bounds];
  double v9 = v8;
  uint64_t v10 = [(WFTagField *)self scrollView];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);

  uint64_t v11 = [(WFTagField *)self scrollView];
  [v11 bounds];
  double v13 = v12 + 5.0;
  [(WFTagField *)self bounds];
  double v15 = v14;
  uint64_t v16 = [(WFTagField *)self plusButton];
  objc_msgSend(v16, "setFrame:", v13, 0.0, 30.0, v15);
}

- (WFTagField)initWithFrame:(CGRect)a3 showsAddButton:(BOOL)a4
{
  BOOL v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFTagField;
  id v5 = -[WFTagField initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    double v6 = objc_alloc_init(WFTagTextView);
    double v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(WFTagTextView *)v6 setFont:v7];

    double v8 = [MEMORY[0x263F825C8] clearColor];
    [(WFTagTextView *)v6 setBackgroundColor:v8];

    [(WFTagField *)v5 setTextView:v6];
    double v9 = (void *)[objc_alloc(MEMORY[0x263F879D0]) initWithTextView:v6];
    [v9 setTextViewDelegate:v5];
    [(WFTagField *)v5 addSubview:v9];
    [(WFTagField *)v5 setScrollView:v9];
    if (v4)
    {
      uint64_t v10 = [MEMORY[0x263F824E8] buttonWithType:1];
      uint64_t v11 = WFLocalizedString(@"Add Tag");
      [v10 setAccessibilityLabel:v11];

      double v12 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.circle"];
      [v10 setImage:v12 forState:0];

      [v10 addTarget:v5 action:sel_selectTag forControlEvents:64];
      [(WFTagField *)v5 addSubview:v10];
      [(WFTagField *)v5 setPlusButton:v10];
    }
    [(WFTagField *)v5 updateEditableState];
    double v13 = v5;
  }
  return v5;
}

- (WFTagField)initWithFrame:(CGRect)a3
{
  return -[WFTagField initWithFrame:showsAddButton:](self, "initWithFrame:showsAddButton:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end