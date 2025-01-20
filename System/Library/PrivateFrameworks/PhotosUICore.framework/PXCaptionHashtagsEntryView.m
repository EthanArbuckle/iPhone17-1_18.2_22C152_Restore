@interface PXCaptionHashtagsEntryView
- (BOOL)_needsUpdateSize:(BOOL *)a3;
- (BOOL)_shouldShowMoreButton;
- (BOOL)isEditing;
- (BOOL)showAllText;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (BOOL)textViewShouldEndEditing:(id)a3;
- (NSString)originalText;
- (NSString)text;
- (PXCaptionHashtagsEntryView)initWithFrame:(CGRect)a3;
- (PXCaptionHashtagsEntryViewDelegate)delegate;
- (PXWidgetSpec)spec;
- (UIButton)moreButton;
- (UIEdgeInsets)textContainerInsets;
- (UIFont)font;
- (_PXUITextView)textView;
- (double)_ellipsisWidth;
- (double)_maxHeight;
- (double)_preferredHeight:(BOOL *)a3;
- (double)_preferredHeight:(BOOL *)a3 forWidth:(double)a4;
- (double)cachedEllipsisWidth;
- (double)maxHeightInEditMode;
- (double)minimumHeightInEdit;
- (double)preferredHeightForWidth:(double)a3;
- (int64_t)_currentMaxLines;
- (unint64_t)numberOfHashtagsInText;
- (void)_addLinkAttributeToHashtagsInTextView;
- (void)_handleEscape:(id)a3;
- (void)_hideShowButton;
- (void)_removeLinkAttributeInTextView;
- (void)_updateFonts;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)exitEditing;
- (void)layoutSubviews;
- (void)moreButtonTapped:(id)a3;
- (void)resetToOriginalText;
- (void)setCachedEllipsisWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setMaxHeightInEditMode:(double)a3;
- (void)setMoreButton:(id)a3;
- (void)setOriginalText:(id)a3;
- (void)setShowAllText:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setTextView:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation PXCaptionHashtagsEntryView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCachedEllipsisWidth:(double)a3
{
  self->_cachedEllipsisWidth = a3;
}

- (double)cachedEllipsisWidth
{
  return self->_cachedEllipsisWidth;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setShowAllText:(BOOL)a3
{
  self->_showAllText = a3;
}

- (BOOL)showAllText
{
  return self->_showAllText;
}

- (void)setMoreButton:(id)a3
{
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setTextView:(id)a3
{
}

- (_PXUITextView)textView
{
  return self->_textView;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (unint64_t)numberOfHashtagsInText
{
  return self->_numberOfHashtagsInText;
}

- (void)setMaxHeightInEditMode:(double)a3
{
  self->_maxHeightInEditMode = a3;
}

- (double)maxHeightInEditMode
{
  return self->_maxHeightInEditMode;
}

- (NSString)originalText
{
  return self->_originalText;
}

- (void)setDelegate:(id)a3
{
}

- (PXCaptionHashtagsEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCaptionHashtagsEntryViewDelegate *)WeakRetained;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return a6 == 0;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCaptionHashtagsEntryView *)self textView];

  if (v5 == v4)
  {
    v6 = [(PXCaptionHashtagsEntryView *)self textView];
    [v6 setEditable:0];

    uint64_t v7 = [(PXCaptionHashtagsEntryView *)self text];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [(PXCaptionHashtagsEntryView *)self text];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        v11 = PXLocalizedStringFromTable(@"PXWidgetCaptionAndHashtagsAXLabel", @"PhotosUICore");
        v12 = [(PXCaptionHashtagsEntryView *)self textView];
        [v12 setAccessibilityLabel:v11];
      }
    }
    [(PXCaptionHashtagsEntryView *)self _addLinkAttributeToHashtagsInTextView];
    id v13 = [(PXCaptionHashtagsEntryView *)self delegate];
    [v13 captionHashtagsEntryViewDidEndEditing:self];
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = [(PXCaptionHashtagsEntryView *)self delegate];
  [v4 captionHashtagsEntryViewDidBeginEditing:self];

  [(PXCaptionHashtagsEntryView *)self _hideShowButton];
  [(PXCaptionHashtagsEntryView *)self _removeLinkAttributeInTextView];
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  v6 = [(PXCaptionHashtagsEntryView *)self textView];
  uint64_t v7 = [v6 typingAttributes];
  v8 = [v5 dictionaryWithDictionary:v7];

  [v8 removeObjectForKey:*MEMORY[0x1E4FB0720]];
  v9 = [(PXCaptionHashtagsEntryView *)self textView];
  [v9 setTypingAttributes:v8];

  char v12 = 1;
  [(PXCaptionHashtagsEntryView *)self _preferredHeight:&v12];
  BOOL v10 = v12 == 0;
  v11 = [(PXCaptionHashtagsEntryView *)self textView];
  [v11 setScrollEnabled:v10];
}

- (BOOL)textViewShouldEndEditing:(id)a3
{
  v3 = self;
  id v4 = [(PXCaptionHashtagsEntryView *)self delegate];
  LOBYTE(v3) = [v4 captionHashtagsEntryViewShouldEndEditing:v3];

  return (char)v3;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXCaptionHashtagsEntryView *)self delegate];
  if (v5
    && (v6 = (void *)v5,
        [(PXCaptionHashtagsEntryView *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 captionHashtagsEntryViewShouldBeginEditing:self],
        v7,
        v6,
        !v8))
  {
    BOOL v14 = 0;
  }
  else
  {
    v9 = [v4 text];
    BOOL v10 = [(PXCaptionHashtagsEntryView *)self originalText];
    char v11 = [v9 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      char v12 = [(PXCaptionHashtagsEntryView *)self originalText];
      [v4 setText:v12];
    }
    id v13 = [(PXCaptionHashtagsEntryView *)self delegate];
    [v13 captionHashtagsEntryViewWillBeginEditing:self];

    BOOL v14 = 1;
  }

  return v14;
}

- (void)textViewDidChange:(id)a3
{
  if ([(PXCaptionHashtagsEntryView *)self isEditing])
  {
    char v8 = 1;
    if ([(PXCaptionHashtagsEntryView *)self _needsUpdateSize:&v8])
    {
      id v4 = [(PXCaptionHashtagsEntryView *)self delegate];
      [v4 captionHashtagsEntryViewPreferredHeightDidChange:self];
    }
    BOOL v5 = v8 == 0;
    v6 = [(PXCaptionHashtagsEntryView *)self textView];
    [v6 setScrollEnabled:v5];
  }
  else
  {
    [(PXCaptionHashtagsEntryView *)self _addLinkAttributeToHashtagsInTextView];
    id v7 = [(PXCaptionHashtagsEntryView *)self delegate];
    [v7 captionHashtagsEntryViewDidEndEditing:self];
  }
}

- (void)_hideShowButton
{
  [(PXCaptionHashtagsEntryView *)self setShowAllText:1];
  id v3 = [(PXCaptionHashtagsEntryView *)self moreButton];
  [v3 setHidden:1];
}

- (BOOL)_needsUpdateSize:(BOOL *)a3
{
  [(PXCaptionHashtagsEntryView *)self _preferredHeight:a3];
  [(PXCaptionHashtagsEntryView *)self frame];
  id v4 = [(PXCaptionHashtagsEntryView *)self traitCollection];
  [v4 displayScale];

  PXFloatRoundToPixel();
}

- (BOOL)_shouldShowMoreButton
{
  if ([(PXCaptionHashtagsEntryView *)self showAllText]) {
    return 0;
  }
  char v4 = 0;
  [(PXCaptionHashtagsEntryView *)self _preferredHeight:&v4];
  return v4 == 0;
}

- (double)_preferredHeight:(BOOL *)a3 forWidth:(double)a4
{
  BOOL v5 = [(PXCaptionHashtagsEntryView *)self textView];
  if (![(PXCaptionHashtagsEntryView *)self isEditing])
  {
    v6 = [v5 text];
    id v7 = [(PXCaptionHashtagsEntryView *)self originalText];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [v5 text];
      objc_claimAutoreleasedReturnValue();
      v9 = [(PXCaptionHashtagsEntryView *)self originalText];
      [v5 setText:v9];
    }
  }
  BOOL v10 = [v5 layoutManager];
  char v11 = [v5 textContainer];
  [v10 ensureLayoutForTextContainer:v11];

  [v5 layoutIfNeeded];
  char v12 = [(PXCaptionHashtagsEntryView *)self traitCollection];
  [v12 displayScale];

  [v5 textContainerInset];
  [v5 font];
  [(id)objc_claimAutoreleasedReturnValue() lineHeight];
  PXFloatCeilingToPixel();
}

- (double)_preferredHeight:(BOOL *)a3
{
  [(PXCaptionHashtagsEntryView *)self _preferredHeight:a3 forWidth:0.0];
  return result;
}

- (double)_maxHeight
{
  id v3 = [(PXCaptionHashtagsEntryView *)self textView];
  [v3 textContainerInset];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 + v7;
  v9 = [(PXCaptionHashtagsEntryView *)self textView];
  BOOL v10 = [v9 font];
  [v10 lineHeight];
  double v12 = v11;

  return v8 + v12 * (double)[(PXCaptionHashtagsEntryView *)self _currentMaxLines];
}

- (int64_t)_currentMaxLines
{
  v2 = [(PXCaptionHashtagsEntryView *)self traitCollection];
  uint64_t v3 = [v2 verticalSizeClass];

  if (v3 == 1) {
    return 2;
  }
  else {
    return 3;
  }
}

- (void)_removeLinkAttributeInTextView
{
  v2 = [(PXCaptionHashtagsEntryView *)self textView];
  id v4 = [v2 textStorage];

  uint64_t v3 = [v4 length];
  objc_msgSend(v4, "removeAttribute:range:", *MEMORY[0x1E4FB0720], 0, v3);
}

- (void)_addLinkAttributeToHashtagsInTextView
{
  uint64_t v3 = +[PXPhotosDetailsSettings sharedInstance];
  int v4 = [v3 captionWidgetEnableHashtags];

  if (v4)
  {
    double v5 = [(PXCaptionHashtagsEntryView *)self textView];
    double v6 = [v5 text];

    if ([v6 length])
    {
      double v7 = [(PXCaptionHashtagsEntryView *)self textView];
      double v8 = [v7 textStorage];

      objc_msgSend(v8, "removeAttribute:range:", *MEMORY[0x1E4FB0720], 0, objc_msgSend(v8, "length"));
      v9 = PLParseHashtags();
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__PXCaptionHashtagsEntryView__addLinkAttributeToHashtagsInTextView__block_invoke;
      v11[3] = &unk_1E5DBF5C8;
      id v12 = v8;
      id v10 = v8;
      [v9 enumerateKeysAndObjectsUsingBlock:v11];
      self->_numberOfHashtagsInText = [v9 count];
    }
  }
}

void __67__PXCaptionHashtagsEntryView__addLinkAttributeToHashtagsInTextView__block_invoke(uint64_t a1, NSString *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSRange v6 = NSRangeFromString(a2);
  double v7 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  double v8 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v7];

  if ([v8 length])
  {
    v9 = [NSString stringWithFormat:@"photos-navigation://search?hashtag=%@", v8];
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    double v11 = (void *)v10;
    if (v10)
    {
      id v12 = *(void **)(a1 + 32);
      uint64_t v14 = *MEMORY[0x1E4FB0720];
      v15[0] = v10;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      objc_msgSend(v12, "addAttributes:range:", v13, v6.location, v6.length);
    }
  }
}

- (void)_updateFonts
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1AD10AAF0](8, 0x8000, 7);
  [(PXCaptionHashtagsEntryView *)self setFont:v3];
  int v4 = [(PXCaptionHashtagsEntryView *)self textView];
  [v4 setFont:v3];

  id v5 = [(PXCaptionHashtagsEntryView *)self moreButton];
  NSRange v6 = [v5 titleLabel];
  [v6 setFont:v3];

  double v7 = [(PXCaptionHashtagsEntryView *)self spec];
  uint64_t v8 = [v7 sizeClass];

  if (v8 == 2) {
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else {
  uint64_t v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  uint64_t v10 = (void *)v9;
  if (v3)
  {
    uint64_t v11 = *MEMORY[0x1E4FB0700];
    v17[0] = *MEMORY[0x1E4FB06F8];
    v17[1] = v11;
    v18[0] = v3;
    v18[1] = v9;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v14 = PXLocalizedStringFromTable(@"PXWidgetCaptionAndHashtagsPlaceholderTitle", @"PhotosUICore");
  v15 = (void *)[v13 initWithString:v14 attributes:v12];
  v16 = [(PXCaptionHashtagsEntryView *)self textView];
  [v16 setAttributedPlaceholder:v15];
}

- (double)_ellipsisWidth
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [(PXCaptionHashtagsEntryView *)self cachedEllipsisWidth];
  double v4 = v3;
  [(PXCaptionHashtagsEntryView *)self cachedEllipsisWidth];
  if (v5 == 0.0)
  {
    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    NSRange v6 = [(PXCaptionHashtagsEntryView *)self font];
    v11[0] = v6;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [@"…" sizeWithAttributes:v7];
    double v4 = v8;

    [(PXCaptionHashtagsEntryView *)self setCachedEllipsisWidth:v4];
  }
  return v4;
}

- (void)_handleEscape:(id)a3
{
  [(PXCaptionHashtagsEntryView *)self resetToOriginalText];
  [(PXCaptionHashtagsEntryView *)self exitEditing];
}

- (void)setFont:(id)a3
{
  double v7 = (UIFont *)a3;
  double v5 = self->_font;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIFont *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      [(PXCaptionHashtagsEntryView *)self setCachedEllipsisWidth:0.0];
    }
  }
}

- (BOOL)isEditing
{
  v2 = [(PXCaptionHashtagsEntryView *)self textView];
  char v3 = [v2 isEditing];

  return v3;
}

- (void)moreButtonTapped:(id)a3
{
  [(PXCaptionHashtagsEntryView *)self _hideShowButton];
  double v4 = [(PXCaptionHashtagsEntryView *)self delegate];
  [v4 captionHashtagsEntryViewRequestFocus:self];

  id v5 = [(PXCaptionHashtagsEntryView *)self delegate];
  [v5 captionHashtagsEntryViewPreferredHeightDidChange:self];
}

- (void)resetToOriginalText
{
  char v3 = [(PXCaptionHashtagsEntryView *)self originalText];
  double v4 = [(PXCaptionHashtagsEntryView *)self textView];
  [v4 setText:v3];

  [(PXCaptionHashtagsEntryView *)self _addLinkAttributeToHashtagsInTextView];
}

- (void)exitEditing
{
  id v2 = [(PXCaptionHashtagsEntryView *)self textView];
  [v2 resignFirstResponder];
}

- (void)layoutSubviews
{
}

uint64_t __44__PXCaptionHashtagsEntryView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __44__PXCaptionHashtagsEntryView_layoutSubviews__block_invoke_335(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, uint64_t a10, unint64_t a11, uint64_t a12, unsigned char *a13)
{
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void *)(v13 + 24);
  if (v14 != *(void *)(a1 + 72)) {
    goto LABEL_12;
  }
  v33.origin.x = a6;
  v33.origin.y = a7;
  v33.size.width = a8;
  v33.size.height = a9;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CGRectGetMaxX(v33);
  BOOL v19 = __CFADD__(a12 - 1, a11);
  uint64_t v20 = a12 - 1 + a11;
  if (v19) {
    goto LABEL_9;
  }
  while (1)
  {
    [*(id *)(a1 + 32) locationForGlyphAtIndex:v20];
    double v22 = v21;
    if (([*(id *)(a1 + 32) propertyForGlyphAtIndex:v20] & 7) != 0) {
      goto LABEL_8;
    }
    double v23 = *(double *)(a1 + 80);
    if (!*(unsigned char *)(a1 + 88)) {
      break;
    }
    if (v22 <= v23)
    {
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
      double v30 = *(double *)(v28 + 24);
      v29 = (double *)(v28 + 24);
      if (v30 <= v23) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
LABEL_8:
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v22;
    if (--v20 < a11) {
      goto LABEL_9;
    }
  }
  if (v22 < v23) {
    goto LABEL_8;
  }
  uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
  double v32 = *(double *)(v31 + 24);
  v29 = (double *)(v31 + 24);
  if (v32 >= v23) {
    goto LABEL_9;
  }
LABEL_16:
  double *v29 = v22;
  --v20;
LABEL_9:
  v24 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", 0, objc_msgSend(*(id *)(a1 + 32), "characterIndexForGlyphAtIndex:", v20) + 1);
  if ([v24 length])
  {
    uint64_t v25 = [v24 stringByAppendingString:@"…"];
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
  *a13 = 1;

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void *)(v13 + 24);
LABEL_12:
  *(void *)(v13 + 24) = v14 + 1;
}

- (void)setSpec:(id)a3
{
  id v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    char v6 = [MEMORY[0x1E4FB1618] clearColor];
    double v7 = [(PXCaptionHashtagsEntryView *)self textView];
    [v7 setBackgroundColor:v6];

    [(PXCaptionHashtagsEntryView *)self _updateFonts];
    id v5 = v8;
  }
}

- (void)setOriginalText:(id)a3
{
  uint64_t v13 = (NSString *)a3;
  double v4 = self->_originalText;
  if (v4 == v13)
  {

    goto LABEL_9;
  }
  BOOL v5 = [(NSString *)v13 isEqualToString:v4];

  char v6 = v13;
  if (v5) {
    goto LABEL_10;
  }
  double v7 = (NSString *)[(NSString *)v13 copy];
  originalText = self->_originalText;
  self->_originalText = v7;

  if (v13 && [(NSString *)v13 length])
  {
    uint64_t v9 = PXLocalizedStringFromTable(@"PXWidgetCaptionAndHashtagsAXLabel", @"PhotosUICore");
    [(_PXUITextView *)self->_textView setAccessibilityLabel:v9];
  }
  uint64_t v10 = [(PXCaptionHashtagsEntryView *)self textView];
  uint64_t v11 = [v10 text];
  if ([v11 isEqualToString:self->_originalText])
  {

LABEL_9:
    char v6 = v13;
    goto LABEL_10;
  }
  BOOL v12 = [(PXCaptionHashtagsEntryView *)self isEditing];

  char v6 = v13;
  if (!v12)
  {
    [(PXCaptionHashtagsEntryView *)self resetToOriginalText];
    goto LABEL_9;
  }
LABEL_10:
}

- (NSString)text
{
  id v2 = [(PXCaptionHashtagsEntryView *)self textView];
  char v3 = [v2 text];
  double v4 = v3;
  if (!v3) {
    char v3 = &stru_1F00B0030;
  }
  BOOL v5 = v3;

  return v5;
}

- (UIEdgeInsets)textContainerInsets
{
  id v2 = [(PXCaptionHashtagsEntryView *)self textView];
  [v2 textContainerInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)minimumHeightInEdit
{
  double v3 = [(PXCaptionHashtagsEntryView *)self textView];
  double v4 = [(PXCaptionHashtagsEntryView *)self traitCollection];
  [v4 displayScale];

  [v3 textContainerInset];
  [v3 font];
  [(id)objc_claimAutoreleasedReturnValue() lineHeight];
  PXFloatCeilingToPixel();
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3 = a3;
  if (a3 == 0.0)
  {
    double v5 = [(PXCaptionHashtagsEntryView *)self textView];
    [v5 frame];
    double v3 = v6;
  }
  double v7 = [(PXCaptionHashtagsEntryView *)self textView];
  double v8 = [v7 textContainer];
  [v8 lineFragmentPadding];
  double v10 = v9;

  [(PXCaptionHashtagsEntryView *)self _preferredHeight:0 forWidth:v3 + v10 * 2.0];
  return result;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  [(PXCaptionHashtagsEntryView *)self _updateFonts];
  id v4 = [(PXCaptionHashtagsEntryView *)self delegate];
  [v4 captionHashtagsEntryViewPreferredHeightDidChange:self];
}

- (PXCaptionHashtagsEntryView)initWithFrame:(CGRect)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PXCaptionHashtagsEntryView;
  double v3 = -[PXCaptionHashtagsEntryView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[PXPhotosDetailsSettings sharedInstance];
    int v5 = [v4 captionWidgetEnableHashtags];

    double v6 = [_PXUITextView alloc];
    uint64_t v7 = -[_PXUITextView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v3->_textView;
    v3->_textView = (_PXUITextView *)v7;

    [(_PXUITextView *)v3->_textView setDelegate:v3];
    double v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(_PXUITextView *)v3->_textView setTextColor:v9];

    uint64_t v36 = *MEMORY[0x1E4FB0700];
    double v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v37[0] = v10;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [(_PXUITextView *)v3->_textView setLinkTextAttributes:v11];

    if (v5) {
      uint64_t v12 = 9;
    }
    else {
      uint64_t v12 = 0;
    }
    [(_PXUITextView *)v3->_textView setKeyboardType:v12];
    [(_PXUITextView *)v3->_textView setEditable:0];
    [(_PXUITextView *)v3->_textView setDataDetectorTypes:2];
    [(_PXUITextView *)v3->_textView setScrollEnabled:0];
    double v13 = [(_PXUITextView *)v3->_textView layoutManager];
    [v13 setAllowsNonContiguousLayout:1];

    [(_PXUITextView *)v3->_textView setShowsHorizontalScrollIndicator:0];
    [(_PXUITextView *)v3->_textView setShowsVerticalScrollIndicator:0];
    [(_PXUITextView *)v3->_textView textContainerInset];
    double v31 = v14;
    double v32 = v15;
    double v33 = v16;
    double v34 = v17;
    v18 = [(_PXUITextView *)v3->_textView font];
    CTFontGetLanguageAwareOutsets();

    -[_PXUITextView setTextContainerInset:](v3->_textView, "setTextContainerInset:", v31, v32, v33, v34);
    BOOL v19 = v3->_textView;
    uint64_t v20 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel__handleEscape_];
    [(_PXUITextView *)v19 addKeyCommand:v20];

    double v21 = v3->_textView;
    double v22 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0x100000 action:sel__handleReturn_];
    [(_PXUITextView *)v21 addKeyCommand:v22];

    [(PXCaptionHashtagsEntryView *)v3 addSubview:v3->_textView];
    uint64_t v23 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    moreButton = v3->_moreButton;
    v3->_moreButton = (UIButton *)v23;

    uint64_t v25 = v3->_moreButton;
    uint64_t v26 = PXLocalizedStringFromTable(@"PXWidgetCaptionAndHashtagsMoreTitle", @"PhotosUICore");
    [(UIButton *)v25 setTitle:v26 forState:0];

    v27 = v3->_moreButton;
    uint64_t v28 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIButton *)v27 setTitleColor:v28 forState:0];

    [(UIButton *)v3->_moreButton addTarget:v3 action:sel_moreButtonTapped_ forControlEvents:64];
    [(PXCaptionHashtagsEntryView *)v3 insertSubview:v3->_moreButton aboveSubview:v3->_textView];
    [(PXCaptionHashtagsEntryView *)v3 _updateFonts];
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v3 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

@end