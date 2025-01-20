@interface ICInlineAttachmentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)forManualRendering;
- (ICInlineAttachment)attachment;
- (ICInlineAttachmentViewController)initWithCoder:(id)a3;
- (ICInlineAttachmentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICInlineAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5;
- (ICInlineAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5 initialCharacterIndex:(unint64_t)a6;
- (ICInlineTextAttachment)textAttachment;
- (NSLayoutManager)displayTextLayoutManager;
- (NSLayoutManager)layoutManager;
- (NSTextContainer)displayTextTextContainer;
- (NSTextStorage)displayTextTextStorage;
- (_NSRange)attachmentRange;
- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4;
- (_NSRange)selectedSearchRange;
- (id)inlineAttachmentView;
- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4;
- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4;
- (unint64_t)initialCharIndex;
- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5;
- (void)layoutWithStyleAttributesOfCharacterIndex:(unint64_t)a3;
- (void)loadView;
- (void)redrawInlineAttachmentView:(id)a3;
- (void)relayoutInlineAttachmentView:(id)a3;
- (void)setForManualRendering:(BOOL)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setInitialCharIndex:(unint64_t)a3;
- (void)setLayoutManager:(id)a3;
- (void)setSelectedSearchRange:(_NSRange)a3;
- (void)setTextAttachment:(id)a3;
- (void)updateDisplayTextTextStorage;
@end

@implementation ICInlineAttachmentViewController

- (ICInlineAttachmentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (ICInlineAttachmentViewController)initWithCoder:(id)a3
{
  return 0;
}

- (ICInlineAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICInlineAttachmentViewController;
  v10 = [(ICInlineAttachmentViewController *)&v14 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textAttachment, v8);
    v12 = [v8 attachment];
    objc_storeWeak((id *)&v11->_attachment, v12);

    v11->_forManualRendering = a4;
    objc_storeWeak((id *)&v11->_layoutManager, v9);
    v11->_initialCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (ICInlineAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5 initialCharacterIndex:(unint64_t)a6
{
  result = [(ICInlineAttachmentViewController *)self initWithTextAttachment:a3 forManualRendering:a4 layoutManager:a5];
  if (result) {
    result->_initialCharIndex = a6;
  }
  return result;
}

- (void)loadView
{
  v3 = [(ICInlineAttachmentViewController *)self layoutManager];
  uint64_t v4 = [v3 textContainers];
  id v13 = [(id)v4 lastObject];

  LOBYTE(v4) = [(ICInlineAttachmentViewController *)self forManualRendering];
  v5 = [(ICInlineAttachmentViewController *)self textAttachment];
  v6 = v5;
  if (v4) {
    [v5 newlyCreatedViewForManualRenderingInTextContainer:v13];
  }
  else {
  v7 = [v5 newlyCreatedViewForTextContainer:v13];
  }
  [(ICInlineAttachmentViewController *)self setView:v7];

  [(ICInlineAttachmentViewController *)self layoutWithStyleAttributesOfCharacterIndex:[(ICInlineAttachmentViewController *)self initialCharIndex]];
  objc_opt_class();
  id v8 = [(ICInlineAttachmentViewController *)self view];
  id v9 = ICDynamicCast();

  [v9 setDelegate:self];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    [v9 intrinsicContentSize];
    double v11 = v10;
    [v9 intrinsicContentSize];
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v11, v12);
  }
  [v9 animateInsertionIfNecessary];
}

- (id)inlineAttachmentView
{
  if ([(ICInlineAttachmentViewController *)self isViewLoaded])
  {
    objc_opt_class();
    v3 = [(ICInlineAttachmentViewController *)self view];
    uint64_t v4 = ICDynamicCast();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (ICInlineTextAttachment)textAttachment
{
  p_textAttachment = &self->_textAttachment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  if (!WeakRetained)
  {
    if (![(ICInlineAttachmentViewController *)self isViewLoaded]) {
      goto LABEL_5;
    }
    objc_opt_class();
    v5 = [(ICInlineAttachmentViewController *)self view];
    WeakRetained = ICDynamicCast();

    v6 = [WeakRetained textAttachment];
    objc_storeWeak((id *)p_textAttachment, v6);
  }
LABEL_5:
  id v7 = objc_loadWeakRetained((id *)p_textAttachment);

  return (ICInlineTextAttachment *)v7;
}

- (void)layoutWithStyleAttributesOfCharacterIndex:(unint64_t)a3
{
  objc_opt_class();
  v5 = [(ICInlineAttachmentViewController *)self layoutManager];
  v6 = [v5 textStorage];
  id v7 = ICDynamicCast();

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICInlineAttachmentViewController layoutWithStyleAttributesOfCharacterIndex:](self, v8);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = [v7 attributesAtIndex:a3 effectiveRange:0];
  }
  objc_opt_class();
  double v10 = [(ICInlineAttachmentViewController *)self view];
  double v11 = ICDynamicCast();

  objc_opt_class();
  double v12 = [v7 styler];
  id v13 = ICDynamicCast();

  objc_super v14 = [v13 authorHighlightsController];
  int v15 = [v14 isPerformingHighlightUpdatesForTextStorage:v7];

  if (v15) {
    [v11 updateHighlightsWithAttributes:v9];
  }
  else {
    [v11 updateStyleWithAttributes:v9];
  }
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(ICInlineAttachmentViewController *)self view];
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 setHighlightPatternRegexFinder:v4];
}

- (NSTextContainer)displayTextTextContainer
{
  displayTextTextContainer = self->_displayTextTextContainer;
  if (!displayTextTextContainer)
  {
    id v4 = (NSTextContainer *)objc_alloc_init(MEMORY[0x263F81680]);
    v5 = self->_displayTextTextContainer;
    self->_displayTextTextContainer = v4;

    [(NSTextContainer *)self->_displayTextTextContainer setLineFragmentPadding:0.0];
    [(NSTextContainer *)self->_displayTextTextContainer setMaximumNumberOfLines:1];
    displayTextTextContainer = self->_displayTextTextContainer;
  }

  return displayTextTextContainer;
}

- (NSLayoutManager)displayTextLayoutManager
{
  displayTextLayoutManager = self->_displayTextLayoutManager;
  if (!displayTextLayoutManager)
  {
    id v4 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x263F81648]);
    v5 = self->_displayTextLayoutManager;
    self->_displayTextLayoutManager = v4;

    id v6 = self->_displayTextLayoutManager;
    id v7 = [(ICInlineAttachmentViewController *)self displayTextTextContainer];
    [(NSLayoutManager *)v6 addTextContainer:v7];

    displayTextLayoutManager = self->_displayTextLayoutManager;
  }

  return displayTextLayoutManager;
}

- (NSTextStorage)displayTextTextStorage
{
  displayTextTextStorage = self->_displayTextTextStorage;
  if (!displayTextTextStorage)
  {
    id v4 = (NSTextStorage *)objc_alloc_init(MEMORY[0x263F816E8]);
    v5 = self->_displayTextTextStorage;
    self->_displayTextTextStorage = v4;

    id v6 = self->_displayTextTextStorage;
    id v7 = [(ICInlineAttachmentViewController *)self displayTextLayoutManager];
    [(NSTextStorage *)v6 addLayoutManager:v7];

    displayTextTextStorage = self->_displayTextTextStorage;
  }

  return displayTextTextStorage;
}

- (void)updateDisplayTextTextStorage
{
  v3 = [(ICInlineAttachmentViewController *)self attachment];
  uint64_t v4 = [v3 uiModel];
  v5 = [(ICInlineAttachmentViewController *)self inlineAttachmentView];
  id v6 = [v5 surroundingAttributes];
  id v28 = [(id)v4 attributedStringWithSurroundingAttributes:v6 formatter:0];

  id v7 = [(ICInlineAttachmentViewController *)self displayTextTextStorage];
  LOBYTE(v4) = [v7 isEqual:v28];

  if ((v4 & 1) == 0)
  {
    id v8 = [(ICInlineAttachmentViewController *)self displayTextTextStorage];
    id v9 = [(ICInlineAttachmentViewController *)self displayTextTextStorage];
    uint64_t v10 = objc_msgSend(v9, "ic_range");
    objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v10, v11, v28);
  }
  double v12 = [(ICInlineAttachmentViewController *)self displayTextTextContainer];
  [v12 size];
  double v14 = v13;
  double v16 = v15;
  v17 = [(ICInlineAttachmentViewController *)self view];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;

  if (v14 != v19 || v16 != v21)
  {
    v22 = [(ICInlineAttachmentViewController *)self view];
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    v27 = [(ICInlineAttachmentViewController *)self displayTextTextContainer];
    objc_msgSend(v27, "setSize:", v24, v26);
  }
}

- (_NSRange)attachmentRange
{
  v3 = [(ICInlineAttachmentViewController *)self inlineAttachmentView];
  uint64_t v4 = [v3 textAttachment];
  v5 = [v4 attachment];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3010000000;
  v32 = &unk_20C1E2BF2;
  long long v33 = xmmword_20C1794E0;
  if ([(ICInlineAttachmentViewController *)self initialCharIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = [(ICInlineAttachmentViewController *)self initialCharIndex];
    id v7 = [(ICInlineAttachmentViewController *)self layoutManager];
    id v8 = [v7 textStorage];
    id v9 = [v5 managedObjectContext];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __51__ICInlineAttachmentViewController_attachmentRange__block_invoke;
    v26[3] = &unk_2640BAC28;
    id v27 = v5;
    id v28 = &v29;
    objc_msgSend(v8, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v9, v6, 1, 0x100000, v26);
  }
  if (v30[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [(ICInlineAttachmentViewController *)self layoutManager];
    uint64_t v11 = [v10 textStorage];
    uint64_t v12 = [v11 length];

    double v13 = [(ICInlineAttachmentViewController *)self layoutManager];
    double v14 = [v13 textStorage];
    double v15 = [v5 managedObjectContext];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __51__ICInlineAttachmentViewController_attachmentRange__block_invoke_2;
    double v23 = &unk_2640BAC28;
    id v24 = v5;
    double v25 = &v29;
    objc_msgSend(v14, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v15, 0, v12, 0x100000, &v20);
  }
  if ([(ICInlineAttachmentViewController *)self initialCharIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    [(ICInlineAttachmentViewController *)self setInitialCharIndex:v30[4]];
  }
  NSUInteger v16 = v30[4];
  NSUInteger v17 = v30[5];
  _Block_object_dispose(&v29, 8);

  NSUInteger v18 = v16;
  NSUInteger v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

uint64_t __51__ICInlineAttachmentViewController_attachmentRange__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

uint64_t __51__ICInlineAttachmentViewController_attachmentRange__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

- (void)redrawInlineAttachmentView:(id)a3
{
  id v4 = a3;
  id v5 = [(ICInlineAttachmentViewController *)self inlineAttachmentView];

  if (v5 == v4)
  {
    uint64_t v6 = [(ICInlineAttachmentViewController *)self attachmentRange];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      id v10 = [(ICInlineAttachmentViewController *)self layoutManager];
      objc_msgSend(v10, "invalidateDisplayForCharacterRange:", v8, v9);
    }
  }
}

- (void)relayoutInlineAttachmentView:(id)a3
{
  id v4 = a3;
  id v5 = [(ICInlineAttachmentViewController *)self inlineAttachmentView];

  if (v5 == v4)
  {
    uint64_t v6 = [(ICInlineAttachmentViewController *)self attachmentRange];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      id v10 = [(ICInlineAttachmentViewController *)self layoutManager];
      objc_msgSend(v10, "invalidateLayoutForCharacterRange:actualCharacterRange:", v8, v9, 0);
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (void)setForManualRendering:(BOOL)a3
{
  self->_forManualRendering = a3;
}

- (ICInlineAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  return (ICInlineAttachment *)WeakRetained;
}

- (void)setTextAttachment:(id)a3
{
}

- (NSLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  return (NSLayoutManager *)WeakRetained;
}

- (void)setLayoutManager:(id)a3
{
}

- (unint64_t)initialCharIndex
{
  return self->_initialCharIndex;
}

- (void)setInitialCharIndex:(unint64_t)a3
{
  self->_initialCharIndex = a3;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_destroyWeak((id *)&self->_attachment);
  objc_storeStrong((id *)&self->_displayTextTextStorage, 0);
  objc_storeStrong((id *)&self->_displayTextLayoutManager, 0);

  objc_storeStrong((id *)&self->_displayTextTextContainer, 0);
}

- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = [(ICInlineAttachmentViewController *)self attachment];
  objc_msgSend(v8, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  uint64_t v10 = v9;

  if (v10)
  {
    uint64_t v11 = [(ICInlineAttachmentViewController *)self view];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v28[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [(ICInlineAttachmentViewController *)self attachment];
  uint64_t v9 = objc_msgSend(v8, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  uint64_t v11 = v10;

  uint64_t v26 = 0;
  uint64_t v27 = 0;
  [(ICInlineAttachmentViewController *)self updateDisplayTextTextStorage];
  uint64_t v12 = [(ICInlineAttachmentViewController *)self displayTextLayoutManager];
  objc_msgSend(v12, "characterRangeForGlyphRange:actualGlyphRange:", v9, v11, &v26);

  double v13 = [(ICInlineAttachmentViewController *)self displayTextLayoutManager];
  double v14 = [(ICInlineAttachmentViewController *)self displayTextTextContainer];
  objc_msgSend(v13, "boundingRectForGlyphRange:inTextContainer:", v26, v27, v14);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v16, v18, v20, v22);
  v28[0] = v23;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

  return v24;
}

- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  uint64_t v9 = [(ICInlineAttachmentViewController *)self displayTextTextContainer];
  [v9 size];
  double v11 = v10 * -0.5;
  uint64_t v12 = [(ICInlineAttachmentViewController *)self displayTextTextContainer];
  [v12 lineFragmentPadding];
  double v14 = v11 - v13;

  double v15 = [(ICInlineAttachmentViewController *)self attachment];
  uint64_t v16 = objc_msgSend(v15, "displayTextRangeForSearchRange:inSearchableString:", location, length, v8);
  uint64_t v18 = v17;

  uint64_t v21 = 0;
  uint64_t v22 = 0;
  [(ICInlineAttachmentViewController *)self updateDisplayTextTextStorage];
  double v19 = [(ICInlineAttachmentViewController *)self displayTextLayoutManager];
  objc_msgSend(v19, "characterRangeForGlyphRange:actualGlyphRange:", v16, v18, &v21);

  double v20 = [(ICInlineAttachmentViewController *)self displayTextLayoutManager];
  objc_msgSend(v20, "drawGlyphsForGlyphRange:atPoint:", v21, v22, 0.0, v14);
}

- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6.NSUInteger location = [(ICInlineAttachmentViewController *)self selectedSearchRange];
  v7.NSUInteger location = location;
  v7.NSUInteger length = length;

  NSRange v10 = NSIntersectionRange(v6, v7);
  NSUInteger v9 = v10.length;
  NSUInteger v8 = v10.location;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (void)layoutWithStyleAttributesOfCharacterIndex:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 textAttachment];
  id v4 = [v3 attachmentIdentifier];
  int v5 = 138412290;
  NSRange v6 = v4;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "View of Token Attachment %@ character index is NSNotFound", (uint8_t *)&v5, 0xCu);
}

@end