@interface ICTK2InlineTextAttachmentViewProvider
- (ICInlineAttachmentView)inlineAttachmentView;
- (ICInlineTextAttachment)inlineTextAttachment;
- (ICTK2InlineTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (NSLayoutManager)displayTextLayoutManager;
- (NSTextContainer)displayTextTextContainer;
- (NSTextContentStorage)tk2displayTextContentStorage;
- (NSTextLayoutManager)tk2displayTextLayoutManager;
- (NSTextStorage)displayTextTextStorage;
- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4;
- (_NSRange)selectedSearchRange;
- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4;
- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4;
- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5;
- (void)loadView;
- (void)setSelectedSearchRange:(_NSRange)a3;
- (void)updateDisplayTextTextStorage;
@end

@implementation ICTK2InlineTextAttachmentViewProvider

- (ICTK2InlineTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  v18.receiver = self;
  v18.super_class = (Class)ICTK2InlineTextAttachmentViewProvider;
  v6 = [(ICTK2TextAttachmentViewProvider *)&v18 initWithTextAttachment:a3 parentView:a4 textLayoutManager:a5 location:a6];
  if (v6)
  {
    if (ICInternalSettingsIsAsyncFindEnabled())
    {
      v7 = (NSTextContentStorage *)objc_alloc_init(MEMORY[0x263F81688]);
      tk2displayTextContentStorage = v6->_tk2displayTextContentStorage;
      v6->_tk2displayTextContentStorage = v7;

      v9 = (NSTextLayoutManager *)objc_alloc_init(MEMORY[0x263F816B8]);
      tk2displayTextLayoutManager = v6->_tk2displayTextLayoutManager;
      v6->_tk2displayTextLayoutManager = v9;

      v11 = v6->_tk2displayTextContentStorage;
      v12 = [(ICTK2InlineTextAttachmentViewProvider *)v6 tk2displayTextLayoutManager];
      [(NSTextContentStorage *)v11 addTextLayoutManager:v12];

      v13 = [(ICTK2InlineTextAttachmentViewProvider *)v6 displayTextTextContainer];
      [(NSTextLayoutManager *)v6->_tk2displayTextLayoutManager setTextContainer:v13];
    }
    else
    {
      v14 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x263F81648]);
      displayTextLayoutManager = v6->_displayTextLayoutManager;
      v6->_displayTextLayoutManager = v14;

      v16 = v6->_displayTextLayoutManager;
      v13 = [(ICTK2InlineTextAttachmentViewProvider *)v6 displayTextTextContainer];
      [(NSLayoutManager *)v16 addTextContainer:v13];
    }
  }
  return v6;
}

- (void)loadView
{
  objc_opt_class();
  v3 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
  ICDynamicCast();
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [(ICTK2InlineTextAttachmentViewProvider *)self inlineTextAttachment];
  if (v4)
  {
    objc_opt_class();
    v5 = [v21 textContainer];
    v6 = [v4 newlyCreatedViewForTextContainer:v5];
    v7 = ICDynamicCast();

    v8 = [v21 textContentStorage];
    v9 = [v8 documentRange];
    v10 = [v9 location];
    v11 = [(ICTK2TextAttachmentViewProvider *)self location];
    uint64_t v12 = [v8 offsetFromLocation:v10 toLocation:v11];

    v13 = [v8 textStorage];
    v14 = [v13 attributesAtIndex:v12 effectiveRange:0];

    [v7 updateStyleWithAttributes:v14];
    v15 = [(ICTK2TextAttachmentViewProvider *)self highlightPatternRegexFinder];
    [v7 setHighlightPatternRegexFinder:v15];

    [(NSTextAttachmentViewProvider *)self setView:v7];
    objc_opt_class();
    v16 = [(NSTextAttachmentViewProvider *)self textAttachment];
    v17 = ICDynamicCast();

    if (v17)
    {
      objc_opt_class();
      objc_super v18 = [v21 textContainer];
      v19 = ICDynamicCast();

      v20 = [v19 linkDelegate];
      [v17 setLinkMenuDelegate:v20];
    }
  }
}

- (NSTextContainer)displayTextTextContainer
{
  displayTextTextContainer = self->_displayTextTextContainer;
  if (!displayTextTextContainer)
  {
    v4 = (NSTextContainer *)objc_alloc_init(MEMORY[0x263F81680]);
    v5 = self->_displayTextTextContainer;
    self->_displayTextTextContainer = v4;

    [(NSTextContainer *)self->_displayTextTextContainer setLineFragmentPadding:0.0];
    [(NSTextContainer *)self->_displayTextTextContainer setMaximumNumberOfLines:1];
    displayTextTextContainer = self->_displayTextTextContainer;
  }

  return displayTextTextContainer;
}

- (NSTextStorage)displayTextTextStorage
{
  displayTextTextStorage = self->_displayTextTextStorage;
  if (!displayTextTextStorage)
  {
    v4 = (NSTextStorage *)objc_alloc_init(MEMORY[0x263F816E8]);
    v5 = self->_displayTextTextStorage;
    self->_displayTextTextStorage = v4;

    char Enabled = ICInternalSettingsIsAsyncFindEnabled();
    displayTextTextStorage = self->_displayTextTextStorage;
    if ((Enabled & 1) == 0)
    {
      v7 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextLayoutManager];
      [(NSTextStorage *)displayTextTextStorage addLayoutManager:v7];

      displayTextTextStorage = self->_displayTextTextStorage;
    }
  }

  return displayTextTextStorage;
}

- (void)updateDisplayTextTextStorage
{
  v3 = [(ICTK2InlineTextAttachmentViewProvider *)self inlineTextAttachment];
  uint64_t v4 = [v3 attachment];
  v5 = [(id)v4 uiModel];
  v6 = [(ICTK2InlineTextAttachmentViewProvider *)self inlineAttachmentView];
  v7 = [v6 surroundingAttributes];
  id v32 = [v5 attributedStringWithSurroundingAttributes:v7 formatter:0];

  v8 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextStorage];
  LOBYTE(v4) = [v8 isEqual:v32];

  if ((v4 & 1) == 0)
  {
    v9 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextStorage];
    v10 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextStorage];
    uint64_t v11 = objc_msgSend(v10, "ic_range");
    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", v11, v12, v32);
  }
  if (ICInternalSettingsIsAsyncFindEnabled()) {
    goto LABEL_6;
  }
  v13 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextContainer];
  [v13 size];
  double v15 = v14;
  double v17 = v16;
  objc_super v18 = [(NSTextAttachmentViewProvider *)self view];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;

  if (v15 != v20) {
    goto LABEL_7;
  }
  if (v17 == v22)
  {
LABEL_6:
    v23 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextStorage];
    v24 = [(ICTK2InlineTextAttachmentViewProvider *)self tk2displayTextContentStorage];
    [v24 setTextStorage:v23];

    v25 = [(ICTK2InlineTextAttachmentViewProvider *)self tk2displayTextLayoutManager];
    v26 = [(ICTK2InlineTextAttachmentViewProvider *)self tk2displayTextLayoutManager];
    v27 = [v26 documentRange];
    [v25 ensureLayoutForRange:v27];
  }
  else
  {
LABEL_7:
    v25 = [(NSTextAttachmentViewProvider *)self view];
    [v25 bounds];
    double v29 = v28;
    double v31 = v30;
    v26 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextContainer];
    objc_msgSend(v26, "setSize:", v29, v31);
  }
}

- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v8 = [(ICTK2InlineTextAttachmentViewProvider *)self inlineTextAttachment];
  v9 = [v8 attachment];
  objc_msgSend(v9, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  uint64_t v11 = v10;

  if (v11)
  {
    uint64_t v12 = [(NSTextAttachmentViewProvider *)self view];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = [(ICTK2InlineTextAttachmentViewProvider *)self inlineTextAttachment];
  v9 = [v8 attachment];
  uint64_t v10 = objc_msgSend(v9, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  uint64_t v12 = v11;

  uint64_t v27 = 0;
  uint64_t v28 = 0;
  [(ICTK2InlineTextAttachmentViewProvider *)self updateDisplayTextTextStorage];
  v13 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextLayoutManager];
  objc_msgSend(v13, "characterRangeForGlyphRange:actualGlyphRange:", v10, v12, &v27);

  double v14 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextLayoutManager];
  double v15 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextContainer];
  objc_msgSend(v14, "boundingRectForGlyphRange:inTextContainer:", v27, v28, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v17, v19, v21, v23);
  v29[0] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];

  return v25;
}

- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  v9 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextContainer];
  [v9 size];
  double v11 = v10 * -0.5;
  uint64_t v12 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextTextContainer];
  [v12 lineFragmentPadding];
  double v14 = v11 - v13;

  double v15 = [(ICTK2InlineTextAttachmentViewProvider *)self inlineTextAttachment];
  double v16 = [v15 attachment];
  uint64_t v17 = objc_msgSend(v16, "displayTextRangeForSearchRange:inSearchableString:", location, length, v8);
  uint64_t v19 = v18;

  uint64_t v22 = 0;
  uint64_t v23 = 0;
  [(ICTK2InlineTextAttachmentViewProvider *)self updateDisplayTextTextStorage];
  double v20 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextLayoutManager];
  objc_msgSend(v20, "characterRangeForGlyphRange:actualGlyphRange:", v17, v19, &v22);

  double v21 = [(ICTK2InlineTextAttachmentViewProvider *)self displayTextLayoutManager];
  objc_msgSend(v21, "drawGlyphsForGlyphRange:atPoint:", v22, v23, 0.0, v14);
}

- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6.NSUInteger location = [(ICTK2InlineTextAttachmentViewProvider *)self selectedSearchRange];
  v7.NSUInteger location = location;
  v7.NSUInteger length = length;

  NSRange v10 = NSIntersectionRange(v6, v7);
  NSUInteger v9 = v10.length;
  NSUInteger v8 = v10.location;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (ICInlineTextAttachment)inlineTextAttachment
{
  objc_opt_class();
  v3 = [(NSTextAttachmentViewProvider *)self textAttachment];
  uint64_t v4 = ICDynamicCast();

  return (ICInlineTextAttachment *)v4;
}

- (ICInlineAttachmentView)inlineAttachmentView
{
  objc_opt_class();
  v3 = [(NSTextAttachmentViewProvider *)self view];
  uint64_t v4 = ICDynamicCast();

  return (ICInlineAttachmentView *)v4;
}

- (NSTextLayoutManager)tk2displayTextLayoutManager
{
  return self->_tk2displayTextLayoutManager;
}

- (NSLayoutManager)displayTextLayoutManager
{
  return self->_displayTextLayoutManager;
}

- (_NSRange)selectedSearchRange
{
  p_selectedSearchRange = &self->_selectedSearchRange;
  NSUInteger location = self->_selectedSearchRange.location;
  NSUInteger length = p_selectedSearchRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSelectedSearchRange:(_NSRange)a3
{
  self->_selectedSearchRange = a3;
}

- (NSTextContentStorage)tk2displayTextContentStorage
{
  return self->_tk2displayTextContentStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tk2displayTextContentStorage, 0);
  objc_storeStrong((id *)&self->_displayTextLayoutManager, 0);
  objc_storeStrong((id *)&self->_tk2displayTextLayoutManager, 0);
  objc_storeStrong((id *)&self->_displayTextTextStorage, 0);

  objc_storeStrong((id *)&self->_displayTextTextContainer, 0);
}

@end