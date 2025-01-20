@interface ICInlineTextFindingResult
- (ICInlineAttachment)attachment;
- (NSAttributedString)findableString;
- (_NSRange)displayTextRange;
- (id)framesForHighlightInTextView:(id)a3;
- (id)inlineAttachmentViewControllerInTextView:(id)a3;
- (id)inlineTextAttachmentViewProviderInTextView:(id)a3;
- (int64_t)compare:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setDisplayTextRange:(_NSRange)a3;
- (void)setFindableString:(id)a3;
@end

@implementation ICInlineTextFindingResult

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();
  v11.receiver = self;
  v11.super_class = (Class)ICInlineTextFindingResult;
  id v6 = [(ICTextFindingResult *)&v11 compare:v4];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICInlineTextFindingResult displayTextRange](self, "displayTextRange"));
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "displayTextRange"));
    id v6 = (id)[v8 compare:v9];
  }
  return (int64_t)v6;
}

- (id)inlineAttachmentViewControllerInTextView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 layoutManager];

  id v6 = ICDynamicCast();

  BOOL v7 = (void *)MEMORY[0x263F5B370];
  v8 = [(ICInlineTextFindingResult *)self attachment];
  v9 = [v7 textAttachmentWithAttachment:v8];

  objc_opt_class();
  v10 = [v6 viewControllerForTextAttachment:v9];
  objc_super v11 = ICDynamicCast();

  return v11;
}

- (id)inlineTextAttachmentViewProviderInTextView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 textLayoutManager];

  id v6 = ICDynamicCast();

  objc_opt_class();
  BOOL v7 = [(ICInlineTextFindingResult *)self attachment];
  v8 = [v7 identifier];
  v9 = [v6 existingAttachmentViewProviderForIdentifier:v8];
  v10 = ICDynamicCast();

  return v10;
}

- (id)framesForHighlightInTextView:(id)a3
{
  v41[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 textLayoutManager];

  if (v5)
  {
    id v6 = [(ICInlineTextFindingResult *)self inlineTextAttachmentViewProviderInTextView:v4];
    [v6 updateDisplayTextTextStorage];
    BOOL v7 = [v6 tk2displayTextLayoutManager];
    uint64_t v8 = [(ICInlineTextFindingResult *)self displayTextRange];
    objc_msgSend(v7, "ic_rectForRange:", v8, v9);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    id v6 = [(ICInlineTextFindingResult *)self inlineAttachmentViewControllerInTextView:v4];
    [v6 updateDisplayTextTextStorage];
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    v18 = [v6 displayTextLayoutManager];
    uint64_t v19 = [(ICInlineTextFindingResult *)self displayTextRange];
    objc_msgSend(v18, "characterRangeForGlyphRange:actualGlyphRange:", v19, v20, &v39);

    v21 = [v6 displayTextLayoutManager];
    v22 = [v6 displayTextTextContainer];
    objc_msgSend(v21, "boundingRectForGlyphRange:inTextContainer:", v39, v40, v22);
    double v11 = v23;
    double v13 = v24;
    double v15 = v25;
    double v17 = v26;
  }
  v27 = [v6 view];
  objc_msgSend(v27, "convertRect:toView:", v4, v11, v13, v15, v17);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v29, v31, v33, v35);
  v41[0] = v36;
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];

  return v37;
}

- (ICInlineAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  return (ICInlineAttachment *)WeakRetained;
}

- (void)setAttachment:(id)a3
{
}

- (NSAttributedString)findableString
{
  return self->_findableString;
}

- (void)setFindableString:(id)a3
{
}

- (_NSRange)displayTextRange
{
  p_displayTextRange = &self->_displayTextRange;
  NSUInteger location = self->_displayTextRange.location;
  NSUInteger length = p_displayTextRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDisplayTextRange:(_NSRange)a3
{
  self->_displayTextRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findableString, 0);

  objc_destroyWeak((id *)&self->_attachment);
}

@end