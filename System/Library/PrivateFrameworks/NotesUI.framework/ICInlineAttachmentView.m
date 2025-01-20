@interface ICInlineAttachmentView
- (BOOL)isAccessibilityElement;
- (BOOL)isCalculateResultAttachmentView;
- (BOOL)isLinkAttachmentView;
- (BOOL)isSelected;
- (CADisplayLink)rippleAnimationTimer;
- (CGSize)intrinsicContentSize;
- (ICAttributedStringRippler)rippler;
- (ICInlineAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5;
- (ICInlineAttachmentViewAnimationDelegate)delegate;
- (ICInlineTextAttachment)textAttachment;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (NSDictionary)surroundingAttributes;
- (UIContextMenuInteraction)contextInteraction;
- (UIImage)imageForPrinting;
- (UILabel)label;
- (double)baselineOffsetFromBottom;
- (double)textContainerWidth;
- (id)accessibilityAttributedLabel;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)createNewLabel;
- (id)imageForTextPreviewInRange:(_NSRange)a3;
- (unint64_t)accessibilityTraits;
- (void)animateInsertionIfNecessary;
- (void)attachmentDataChanged:(id)a3;
- (void)beginRippleAnimation;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)endRippleAnimation;
- (void)objectDidUpdateShare:(id)a3;
- (void)respondToTapGesture:(id)a3;
- (void)setContextInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRippleAnimationTimer:(id)a3;
- (void)setRippler:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSurroundingAttributes:(id)a3;
- (void)setTextAttachment:(id)a3;
- (void)setTextContainerWidth:(double)a3;
- (void)setupEventHandling;
- (void)updateHighlightsWithAttributes:(id)a3;
- (void)updateLabel;
- (void)updateRippleAnimation;
- (void)updateStyleWithAttributes:(id)a3;
@end

@implementation ICInlineAttachmentView

- (ICInlineAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICInlineAttachmentView;
  v7 = -[ICInlineAttachmentView initWithFrame:](&v15, sel_initWithFrame_, 0.0, 0.0, 300.0, 100.0);
  v8 = v7;
  if (v7)
  {
    v7->_textContainerWidth = 300.0;
    objc_storeWeak((id *)&v7->_textAttachment, v6);
    uint64_t v9 = [(ICInlineAttachmentView *)v8 isLinkAttachmentView]
      || [(ICInlineAttachmentView *)v8 isCalculateResultAttachmentView];
    [(ICInlineAttachmentView *)v8 setUserInteractionEnabled:v9];
    if ([(ICInlineAttachmentView *)v8 isUserInteractionEnabled]) {
      [(ICInlineAttachmentView *)v8 setupEventHandling];
    }
    v10 = [v6 attachment];
    v11 = objc_msgSend(v10, "ic_permanentObjectID");
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v8 selector:sel_attachmentDataChanged_ name:*MEMORY[0x1E4F830D8] object:v11];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v8 selector:sel_objectDidUpdateShare_ name:@"ICCloudSyncingObjectDidUpdateShare" object:v10];

    [(ICInlineAttachmentView *)v8 setClipsToBounds:0];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICInlineAttachmentView;
  [(ICInlineAttachmentView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)ICInlineAttachmentView;
  [(ICInlineAttachmentView *)&v3 didMoveToWindow];
  if (ICInternalSettingsIsTextKit2Enabled()) {
    [(ICInlineAttachmentView *)self animateInsertionIfNecessary];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(ICInlineAttachmentView *)self label];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    double v4 = [(ICInlineAttachmentView *)self createNewLabel];
    double v5 = self->_label;
    self->_label = v4;

    [(ICInlineAttachmentView *)self addSubview:self->_label];
    label = self->_label;
  }
  return label;
}

- (id)createNewLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v2 setNumberOfLines:1];
  [v2 setAdjustsFontSizeToFitWidth:0];
  [v2 setLineBreakMode:5];
  return v2;
}

- (void)attachmentDataChanged:(id)a3
{
  double v4 = [a3 object];
  double v5 = [(ICInlineAttachmentView *)self textAttachment];
  double v6 = [v5 attachment];
  double v7 = [v6 objectID];

  if (v4 == v7)
  {
    double v8 = [(ICInlineAttachmentView *)self textAttachment];
    uint64_t v9 = [v8 attachment];
    [v9 markDisplayTextNeedsUpdate];

    [(ICInlineAttachmentView *)self updateLabel];
  }
}

- (void)objectDidUpdateShare:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  double v4 = [v15 object];
  double v5 = ICCheckedDynamicCast();

  double v6 = [(ICInlineAttachmentView *)self textAttachment];
  uint64_t v7 = [v6 attachment];
  double v8 = [(id)v7 note];

  uint64_t v9 = [v8 objectID];
  LOBYTE(v7) = [v9 isEqual:v5];

  if ((v7 & 1) == 0)
  {
    uint64_t v10 = [v8 folder];
    if (!v10) {
      goto LABEL_9;
    }
    v11 = (void *)v10;
    while (1)
    {
      v12 = [v11 objectID];
      char v13 = [v12 isEqual:v5];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 parent];

      v11 = (void *)v14;
      if (!v14) {
        goto LABEL_9;
      }
    }
  }
  [(ICInlineAttachmentView *)self updateLabel];
LABEL_9:
}

- (void)updateLabel
{
  double v3 = [(ICInlineAttachmentView *)self textAttachment];
  id v34 = [v3 attachment];

  double v4 = [v34 uiModel];
  objc_msgSend(v4, "setSelected:", -[ICInlineAttachmentView isSelected](self, "isSelected"));
  double v5 = [(ICInlineAttachmentView *)self surroundingAttributes];
  double v6 = [v4 attributedStringWithSurroundingAttributes:v5 formatter:0];

  uint64_t v7 = [(ICInlineAttachmentView *)self surroundingAttributes];
  double v8 = [v4 highlightingAttributedString:v6 withSurroundingAttributes:v7];

  uint64_t v9 = [(ICInlineAttachmentView *)self highlightPatternRegexFinder];
  uint64_t v10 = [v4 highlightingAttributedString:v8 withRegexMatches:v9];

  v11 = [(ICInlineAttachmentView *)self label];
  [v11 setAttributedText:v10];

  v12 = [(ICInlineAttachmentView *)self label];
  [v12 sizeToFit];

  char v13 = [(ICInlineAttachmentView *)self label];
  [v13 frame];
  double v15 = v14;
  double textContainerWidth = self->_textContainerWidth;

  if (v15 > textContainerWidth)
  {
    v17 = [(ICInlineAttachmentView *)self label];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    double v24 = self->_textContainerWidth;
    v25 = [(ICInlineAttachmentView *)self label];
    objc_msgSend(v25, "setFrame:", v19, v21, v24, v23);
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    [(ICInlineAttachmentView *)self frame];
    double v27 = v26;
    [(ICInlineAttachmentView *)self frame];
    double v29 = v28;
    v30 = [(ICInlineAttachmentView *)self label];
    [v30 frame];
    double v32 = v31;
    v33 = [(ICInlineAttachmentView *)self label];
    [v33 frame];
    -[ICInlineAttachmentView setFrame:](self, "setFrame:", v27, v29, v32);
  }
}

- (void)setTextContainerWidth:(double)a3
{
  if (a3 > 0.0 && self->_textContainerWidth != a3)
  {
    self->_double textContainerWidth = a3;
    [(ICInlineAttachmentView *)self updateLabel];
  }
}

- (void)updateStyleWithAttributes:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    double v4 = [(ICInlineAttachmentView *)self textAttachment];
    double v5 = [v4 attachment];

    double v6 = [v5 uiModel];
    uint64_t v7 = [(id)objc_opt_class() filteredStyleAttributes:v8];
    [(ICInlineAttachmentView *)self setSurroundingAttributes:v7];
  }
  else
  {
    [(ICInlineAttachmentView *)self setSurroundingAttributes:MEMORY[0x1E4F1CC08]];
  }
  [(ICInlineAttachmentView *)self updateLabel];
}

- (void)updateHighlightsWithAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [(ICInlineAttachmentView *)self textAttachment];
  double v6 = [v5 attachment];
  id v11 = [v6 uiModel];

  uint64_t v7 = [(ICInlineAttachmentView *)self label];
  id v8 = [v7 attributedText];
  uint64_t v9 = [v11 highlightingAttributedString:v8 withSurroundingAttributes:v4];

  uint64_t v10 = [(ICInlineAttachmentView *)self label];
  [v10 setAttributedText:v9];
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(ICInlineAttachmentView *)self updateLabel];
  }
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  [(ICInlineAttachmentView *)self updateLabel];
}

- (double)baselineOffsetFromBottom
{
  id v2 = [(ICInlineAttachmentView *)self label];
  [v2 _baselineOffsetFromBottom];
  double v4 = v3;

  return v4;
}

- (void)animateInsertionIfNecessary
{
  double v3 = [(ICInlineAttachmentView *)self textAttachment];
  id v7 = [v3 attachment];

  if ([v7 animateInsertion])
  {
    double v4 = [(ICInlineAttachmentView *)self label];
    double v5 = [v4 attributedText];
    double v6 = [v5 string];

    if (+[ICAttributedStringRippler canAnimateString:v6])
    {
      [(ICInlineAttachmentView *)self beginRippleAnimation];
    }
    [v7 setAnimateInsertion:0];
  }
}

- (void)beginRippleAnimation
{
  double v3 = [(ICInlineAttachmentView *)self rippler];

  if (v3) {
    [(ICInlineAttachmentView *)self endRippleAnimation];
  }
  double v4 = [ICAttributedStringRippler alloc];
  double v5 = [(ICInlineAttachmentView *)self label];
  double v6 = [v5 attributedText];
  id v7 = [(ICInlineAttachmentView *)self textAttachment];
  id v8 = [v7 attachment];
  uint64_t v9 = [v8 animatableRange];
  id v11 = -[ICAttributedStringRippler initWithAttributedString:animatedRange:](v4, "initWithAttributedString:animatedRange:", v6, v9, v10);
  [(ICInlineAttachmentView *)self setRippler:v11];

  v12 = [(ICInlineAttachmentView *)self rippler];
  [v12 start];

  char v13 = [(ICInlineAttachmentView *)self rippleAnimationTimer];

  if (!v13)
  {
    double v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    double v15 = [v14 displayLinkWithTarget:self selector:sel_updateRippleAnimation];
    [(ICInlineAttachmentView *)self setRippleAnimationTimer:v15];

    unint64_t v16 = +[ICAttributedStringRippler framesPerSecond];
    v17 = [(ICInlineAttachmentView *)self rippleAnimationTimer];
    [v17 setPreferredFramesPerSecond:v16];

    id v19 = [(ICInlineAttachmentView *)self rippleAnimationTimer];
    double v18 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v19 addToRunLoop:v18 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)endRippleAnimation
{
  double v3 = [(ICInlineAttachmentView *)self rippleAnimationTimer];
  [v3 invalidate];

  [(ICInlineAttachmentView *)self setRippleAnimationTimer:0];
  [(ICInlineAttachmentView *)self updateLabel];
  double v4 = [(ICInlineAttachmentView *)self delegate];
  [v4 redrawInlineAttachmentView:self];

  [(ICInlineAttachmentView *)self setRippler:0];
}

- (void)updateRippleAnimation
{
  double v3 = [(ICInlineAttachmentView *)self rippler];
  uint64_t v4 = [v3 currentTimeIndex];

  double v5 = [(ICInlineAttachmentView *)self rippler];
  int v6 = [v5 finishedForTimeIndex:v4];

  if (v6)
  {
    [(ICInlineAttachmentView *)self endRippleAnimation];
  }
  else
  {
    id v7 = [(ICInlineAttachmentView *)self rippler];
    id v21 = [v7 attributedStringForTimeIndex:v4];

    id v8 = [(ICInlineAttachmentView *)self label];
    [v8 setAttributedText:v21];

    uint64_t v9 = [(ICInlineAttachmentView *)self label];
    [v9 sizeToFit];

    uint64_t v10 = [(ICInlineAttachmentView *)self label];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    [(ICInlineAttachmentView *)self frame];
    double v18 = (v17 - v16) / 3.0 + (v17 - v16) / 3.0;
    id v19 = [(ICInlineAttachmentView *)self label];
    objc_msgSend(v19, "setFrame:", v12, v18, v14, v16);

    double v20 = [(ICInlineAttachmentView *)self delegate];
    [v20 redrawInlineAttachmentView:self];
  }
}

- (void)setupEventHandling
{
  if ([(ICInlineAttachmentView *)self isLinkAttachmentView]
    || [(ICInlineAttachmentView *)self isCalculateResultAttachmentView])
  {
    double v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_respondToTapGesture_];
    [v3 setDelegate:self];
    [v3 setNumberOfTapsRequired:1];
    [(ICInlineAttachmentView *)self addGestureRecognizer:v3];
  }
  if ([(ICInlineAttachmentView *)self isLinkAttachmentView]
    || [(ICInlineAttachmentView *)self isCalculateResultAttachmentView])
  {
    uint64_t v4 = [(ICInlineAttachmentView *)self contextInteraction];

    if (!v4)
    {
      double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
      [(ICInlineAttachmentView *)self setContextInteraction:v5];

      id v6 = [(ICInlineAttachmentView *)self contextInteraction];
      [(ICInlineAttachmentView *)self addInteraction:v6];
    }
  }
}

- (void)respondToTapGesture:(id)a3
{
  id v8 = a3;
  if ([(ICInlineAttachmentView *)self isLinkAttachmentView])
  {
    uint64_t v4 = [(ICInlineAttachmentView *)self textAttachment];
    double v5 = [v4 attachment];
    id v6 = [v5 tokenContentIdentifier];
    id v7 = NotesAppURLForNoteIdentifierOrTokenContentIdentifier();

    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(ICInlineAttachmentView *)self openURL:v7];
    }
  }
  else
  {
    if (![(ICInlineAttachmentView *)self isCalculateResultAttachmentView]) {
      goto LABEL_8;
    }
    id v7 = [(ICInlineAttachmentView *)self contextInteraction];
    [v8 location];
    objc_msgSend(v7, "_presentMenuAtLocation:");
  }

LABEL_8:
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  if ([(ICInlineAttachmentView *)self isLinkAttachmentView])
  {
    objc_opt_class();
    double v5 = [(ICInlineAttachmentView *)self textAttachment];
    id v6 = ICDynamicCast();

    id v7 = [v6 linkMenuDelegate];
    id v8 = [(ICInlineAttachmentView *)self textAttachment];
    uint64_t v9 = [v8 attachment];

    uint64_t v10 = [v7 contextMenuInteraction:v9];

    goto LABEL_6;
  }
  if ([(ICInlineAttachmentView *)self isCalculateResultAttachmentView])
  {
    double v11 = [(ICInlineAttachmentView *)self textAttachment];
    id v6 = [v11 attachment];

    double v12 = [v6 note];
    id v7 = [v12 calculateDocumentController];

    if (!v7)
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    [v7 updateAffectingChangeCounts:0];
    uint64_t v10 = [v7 contextMenuForResultAttachment:v6];
LABEL_6:

LABEL_7:
    goto LABEL_9;
  }
  uint64_t v10 = 0;
LABEL_9:
  return v10;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  if ([(ICInlineAttachmentView *)self isLinkAttachmentView])
  {
    id v7 = [(ICInlineAttachmentView *)self textAttachment];
    id v8 = [v7 attachment];
    uint64_t v9 = [v8 tokenContentIdentifier];
    uint64_t v10 = NotesAppURLForNoteIdentifierOrTokenContentIdentifier();

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __107__ICInlineAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v11[3] = &unk_1E5FD91D0;
      v11[4] = self;
      id v12 = v10;
      [v6 addCompletion:v11];
    }
  }
}

uint64_t __107__ICInlineAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openURL:*(void *)(a1 + 40)];
}

- (BOOL)isLinkAttachmentView
{
  id v2 = [(ICInlineAttachmentView *)self textAttachment];
  double v3 = [v2 attachment];
  char v4 = [v3 isLinkAttachment];

  return v4;
}

- (BOOL)isCalculateResultAttachmentView
{
  id v2 = [(ICInlineAttachmentView *)self textAttachment];
  double v3 = [v2 attachment];
  char v4 = [v3 isCalculateResultAttachment];

  return v4;
}

- (id)imageForTextPreviewInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(ICInlineAttachmentView *)self label];
  id v7 = [v6 attributedText];
  id v8 = (void *)[v7 mutableCopy];

  v36.NSUInteger location = objc_msgSend(v8, "ic_range");
  v36.NSUInteger length = v9;
  v35.NSUInteger location = location;
  v35.NSUInteger length = length;
  NSRange v10 = NSIntersectionRange(v35, v36);
  uint64_t v32 = *MEMORY[0x1E4FB0700];
  uint64_t v11 = v32;
  id v12 = [MEMORY[0x1E4FB1618] clearColor];
  v33[0] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  uint64_t v14 = objc_msgSend(v8, "ic_range");
  objc_msgSend(v8, "addAttributes:range:", v13, v14, v15);

  v30[0] = v11;
  double v16 = [MEMORY[0x1E4FB1618] blackColor];
  v31[0] = v16;
  v30[1] = *MEMORY[0x1E4FB06C0];
  double v17 = [MEMORY[0x1E4FB1618] clearColor];
  v31[1] = v17;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  objc_msgSend(v8, "addAttributes:range:", v18, v10.location, v10.length);

  id v19 = [MEMORY[0x1E4FB17E0] defaultFormat];
  id v20 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [(ICInlineAttachmentView *)self bounds];
  double v23 = objc_msgSend(v20, "initWithSize:format:", v19, v21, v22);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__ICInlineAttachmentView_imageForTextPreviewInRange___block_invoke;
  v27[3] = &unk_1E5FD8E18;
  id v28 = v8;
  double v29 = self;
  id v24 = v8;
  v25 = [v23 imageWithActions:v27];

  return v25;
}

uint64_t __53__ICInlineAttachmentView_imageForTextPreviewInRange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  return objc_msgSend(v1, "drawInRect:");
}

- (UIImage)imageForPrinting
{
  [(ICInlineAttachmentView *)self setOverrideUserInterfaceStyle:1];
  [(ICInlineAttachmentView *)self bounds];
  v8.width = v3;
  v8.height = v4;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  [(ICInlineAttachmentView *)self bounds];
  -[ICInlineAttachmentView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  double v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(ICInlineAttachmentView *)self setOverrideUserInterfaceStyle:0];
  return (UIImage *)v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityAttributedLabel
{
  id v2 = (void *)MEMORY[0x1E4F28B18];
  CGFloat v3 = [(ICInlineAttachmentView *)self label];
  CGFloat v4 = [v3 text];
  double v5 = [v2 icaxAttributedStringForSpeakingStringInLowerPitch:v4];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)ICInlineAttachmentView;
  unint64_t v3 = [(ICInlineAttachmentView *)&v10 accessibilityTraits];
  CGFloat v4 = [(ICInlineAttachmentView *)self textAttachment];
  double v5 = [v4 attachment];
  id v6 = [v5 typeUTI];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F83188]];

  uint64_t v8 = *MEMORY[0x1E4FB2568];
  if (!v7) {
    uint64_t v8 = 0;
  }
  return v8 | v3;
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setContextInteraction:(id)a3
{
}

- (ICInlineTextAttachment)textAttachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  return (ICInlineTextAttachment *)WeakRetained;
}

- (void)setTextAttachment:(id)a3
{
}

- (double)textContainerWidth
{
  return self->_textContainerWidth;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (NSDictionary)surroundingAttributes
{
  return self->_surroundingAttributes;
}

- (void)setSurroundingAttributes:(id)a3
{
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (ICInlineAttachmentViewAnimationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICInlineAttachmentViewAnimationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (CADisplayLink)rippleAnimationTimer
{
  return self->_rippleAnimationTimer;
}

- (void)setRippleAnimationTimer:(id)a3
{
}

- (ICAttributedStringRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_rippleAnimationTimer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_surroundingAttributes, 0);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
}

@end