@interface UITextContentView
+ (id)excludedElementsForHTML;
- (BOOL)_restoreFirstResponder;
- (BOOL)allowsEditingTextAttributes;
- (BOOL)becomeFirstResponder;
- (BOOL)becomesEditableWithGestures;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)dragInteractionEnabled;
- (BOOL)hasMarkedText;
- (BOOL)hasSelection;
- (BOOL)hasText;
- (BOOL)isDragInteractionEnabled;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isFirstResponder;
- (BOOL)isInteractingWithLink;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)mightHaveLinks;
- (BOOL)resignFirstResponder;
- (BOOL)scrollsSelectionOnWebDocumentChanges;
- (BOOL)shouldStartDataDetectors;
- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3;
- (CGPoint)constrainedPoint:(CGPoint)a3;
- (CGPoint)offset;
- (CGRect)_selectionClipRect;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)caretRectForVisiblePosition:(id)a3;
- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)frameForDictationResultPlaceholder:(id)a3;
- (CGRect)rectForScrollToVisible;
- (CGRect)rectForSelection:(_NSRange)a3;
- (CGRect)visibleRect;
- (CGRect)visibleTextRect;
- (NSAttributedString)attributedText;
- (NSDictionary)markedTextStyle;
- (NSString)text;
- (UIColor)textColor;
- (UIEdgeInsets)selectionInset;
- (UIFont)font;
- (UITextContentView)initWithCoder:(id)a3;
- (UITextContentView)initWithFrame:(CGRect)a3;
- (UITextContentView)initWithFrame:(CGRect)a3 webView:(id)a4;
- (UITextContentViewDelegate)delegate;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (_NSRange)selectedRange;
- (_NSRange)selectionRange;
- (double)bottomBufferHeight;
- (id)_keyboardResponder;
- (id)_proxyTextInput;
- (id)automaticallySelectedOverlay;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)contentAsAttributedString;
- (id)contentAsHTMLString;
- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)fontForCaretSelection;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)insertDictationResultPlaceholder;
- (id)insertTextPlaceholderWithSize:(CGSize)a3;
- (id)interactionAssistant;
- (id)metadataDictionariesForDictationResults;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)selectedText;
- (id)selectionRectsForRange:(id)a3;
- (id)styleString;
- (id)supportedPasteboardTypesForCurrentSelection;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)undoManager;
- (id)webView;
- (int)marginTop;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)selectionAffinity;
- (int64_t)selectionGranularity;
- (int64_t)textAlignment;
- (unint64_t)_allowedLinkTypes;
- (unint64_t)dataDetectorTypes;
- (unint64_t)offsetInMarkedTextForSelection:(id)a3;
- (void)_addShortcut:(id)a3;
- (void)_define:(id)a3;
- (void)_didScroll;
- (void)_hideSelectionCommands;
- (void)_insertAttributedTextWithoutClosingTyping:(id)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_promptForReplace:(id)a3;
- (void)_removeAttribute:(id)a3 fromString:(id)a4 andSetPropertyWith:(id)a5 usingValueClass:(Class)a6;
- (void)_removeTextViewPropertiesFromText:(id)a3;
- (void)_share:(id)a3;
- (void)_sizeChanged;
- (void)_translate:(id)a3;
- (void)_transliterateChinese:(id)a3;
- (void)beginSelectionChange;
- (void)cancelAutoscroll;
- (void)cancelDataDetectorsWithWebLock;
- (void)cancelInteractionWithLink;
- (void)commonInitWithWebDocumentView:(id)a3 isDecoding:(BOOL)a4;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)decreaseSize:(id)a3;
- (void)deleteBackward;
- (void)didMoveToSuperview;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)endSelectionChange;
- (void)ensureSelection;
- (void)forwardInvocation:(id)a3;
- (void)increaseSize:(id)a3;
- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)insertText:(id)a3;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardInputChangedSelection:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)performBecomeEditableTasks;
- (void)performScrollSelectionToVisible:(BOOL)a3;
- (void)recalculateStyle;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)removeFromSuperview;
- (void)removeTextPlaceholder:(id)a3;
- (void)replace:(id)a3;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)resetDataDetectorsResultsWithWebLock;
- (void)scrollRangeToVisible:(_NSRange)a3;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)select:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)setAllowsEditingTextAttributes:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setBecomesEditableWithGestures:(BOOL)a3;
- (void)setBottomBufferHeight:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentToAttributedString:(id)a3;
- (void)setContentToHTMLString:(id)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDragInteractionEnabled:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInputDelegate:(id)a3;
- (void)setMarginTop:(int)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextStyle:(id)a3;
- (void)setScrollsSelectionOnWebDocumentChanges:(BOOL)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelectionAffinity:(int64_t)a3;
- (void)setSelectionChangeCallbacksDisabled:(BOOL)a3;
- (void)setSelectionGranularity:(int64_t)a3;
- (void)setSelectionInset:(UIEdgeInsets)a3;
- (void)setSelectionToEnd;
- (void)setSelectionToStart;
- (void)setSelectionWithPoint:(CGPoint)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)startAutoscroll:(CGPoint)a3;
- (void)startDataDetectorsWithWebLock;
- (void)startInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)tapLinkAtPoint:(CGPoint)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)unmarkText;
- (void)updateContentEditableAttribute:(BOOL)a3;
- (void)updateInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)updateSelection;
- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webViewDidChange:(id)a3;
@end

@implementation UITextContentView

- (UITextContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextContentView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UITextContentView *)v3 commonInitWithWebDocumentView:0 isDecoding:0];
  }
  return v4;
}

- (UITextContentView)initWithFrame:(CGRect)a3 webView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextContentView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10) {
    [(UITextContentView *)v10 commonInitWithWebDocumentView:v9 isDecoding:0];
  }

  return v11;
}

- (UITextContentView)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextContentView;
  v5 = [(UIView *)&v11 initWithCoder:v4];
  objc_super v6 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  [(UITextContentView *)v5 commonInitWithWebDocumentView:0 isDecoding:1];
  if ([v4 containsValueForKey:@"UIAttributedText"])
  {
    v7 = [v4 decodeObjectForKey:@"UIAttributedText"];
    [(UITextContentView *)v6 setAttributedText:v7];
LABEL_6:

    goto LABEL_7;
  }
  if ([v4 containsValueForKey:@"UIText"])
  {
    v7 = [v4 decodeObjectForKey:@"UIText"];
    [(UITextContentView *)v6 setText:v7];
    goto LABEL_6;
  }
LABEL_7:
  if ([v4 containsValueForKey:@"UIFont"])
  {
    v8 = [v4 decodeObjectForKey:@"UIFont"];
    [(UITextContentView *)v6 setFont:v8];
  }
  if ([v4 containsValueForKey:@"UITextColor"])
  {
    id v9 = [v4 decodeObjectForKey:@"UITextColor"];
    [(UITextContentView *)v6 setTextColor:v9];
  }
  if ([v4 containsValueForKey:@"UITextAlignment"]) {
    -[UITextContentView setTextAlignment:](v6, "setTextAlignment:", [v4 decodeIntegerForKey:@"UITextAlignment"]);
  }
  if ([v4 containsValueForKey:@"UIEditable"]) {
    -[UITextContentView setEditable:](v6, "setEditable:", [v4 decodeBoolForKey:@"UIEditable"]);
  }
  -[UITextContentView setDataDetectorTypes:](v6, "setDataDetectorTypes:", [v4 decodeIntegerForKey:@"UIDataDetectorTypes"]);
LABEL_16:

  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITextContentView;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->m_webView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextContentView;
  [(UIView *)&v10 encodeWithCoder:v4];
  objc_super v5 = [(UITextContentView *)self text];
  objc_super v6 = v5;
  if (v5 && [v5 length])
  {
    if (self->m_usesAttributedText)
    {
      v7 = [(UITextContentView *)self attributedText];
      [v4 encodeObject:v7 forKey:@"UIAttributedText"];
    }
    [v4 encodeObject:v6 forKey:@"UIText"];
  }
  m_font = self->m_font;
  if (m_font) {
    [v4 encodeObject:m_font forKey:@"UIFont"];
  }
  m_textColor = self->m_textColor;
  if (m_textColor) {
    [v4 encodeObject:m_textColor forKey:@"UITextColor"];
  }
  if (self->m_hasExplicitTextAlignment) {
    [v4 encodeInteger:self->m_textAlignment forKey:@"UITextAlignment"];
  }
  if (![(UITextContentView *)self isEditable]) {
    [v4 encodeBool:0 forKey:@"UIEditable"];
  }
  if ([(UITextContentView *)self dataDetectorTypes]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UITextContentView dataDetectorTypes](self, "dataDetectorTypes"), @"UIDataDetectorTypes");
  }
}

- (void)updateContentEditableAttribute:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    objc_super v5 = @"true";
  }
  else {
    objc_super v5 = @"false";
  }
  [(DOMHTMLElement *)self->m_body setContentEditable:v5];
  if (v3)
  {
    objc_super v6 = [(WebFrame *)self->m_frame selectedDOMRange];

    if (!v6)
    {
      m_frame = self->m_frame;
      [(WebFrame *)m_frame _setSelectionFromNone];
    }
  }
}

- (void)commonInitWithWebDocumentView:(id)a3 isDecoding:(BOOL)a4
{
  id v41 = a3;
  WebThreadLock();
  v7 = [off_1E52D39B8 systemFontOfSize:12.0];
  m_font = self->m_font;
  self->m_font = v7;

  self->m_marginTop = 8;
  id v9 = +[UIColor blackColor];
  m_textColor = self->m_textColor;
  self->m_textColor = v9;

  self->m_editable = 1;
  objc_super v11 = [[UITextInteractionAssistant alloc] initWithView:self];
  m_interactionAssistant = self->m_interactionAssistant;
  self->m_interactionAssistant = v11;

  if (v41)
  {
    objc_storeStrong((id *)&self->m_webView, a3);
    [(UIWebDocumentView *)self->m_webView setWebDraggingDelegate:self];
  }
  else
  {
    [(UIView *)self frame];
    double v14 = v13;
    double v16 = v15;
    v17 = [UIWebDocumentView alloc];
    v18 = [(UITextContentView *)self styleString];
    v19 = +[UIWebDocumentView standardTextViewPreferences];
    v20 = -[UIWebDocumentView initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:](v17, "initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:", v18, v19, 0, 0.0, 0.0, v14, v16);
    m_webView = self->m_webView;
    self->m_webView = v20;

    [(UIWebDocumentView *)self->m_webView setWebDraggingDelegate:self];
    [(UIView *)self->m_webView setEnabled:0];
    [(UIWebDocumentView *)self->m_webView setIgnoresFocusingMouse:1];
    [(UIWebDocumentView *)self->m_webView setLoadsSynchronously:1];
    v22 = [(UIWebDocumentView *)self->m_webView webView];
    objc_msgSend(v22, "_setFixedLayoutSize:", v14, 1.0);
    [v22 setPolicyDelegate:self];
    [v22 setEditingDelegate:self];
    v23 = [(id)objc_opt_class() description];
    [v22 setCustomUserAgent:v23];
  }
  v24 = [(UIWebDocumentView *)self->m_webView webView];
  v25 = [v24 mainFrame];
  m_frame = self->m_frame;
  self->m_frame = v25;

  v27 = [(WebFrame *)self->m_frame DOMDocument];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = [v27 body];
    m_boddouble y = self->m_body;
    self->m_boddouble y = v28;
  }
  v30 = [(WebFrame *)self->m_frame frameView];
  v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v32 = *MEMORY[0x1E4FB6E10];
  v33 = [v30 documentView];
  [v31 addObserver:self selector:sel_webViewDidChange_ name:v32 object:v33];

  uint64_t v34 = *MEMORY[0x1E4FB6E78];
  v35 = [(UIWebDocumentView *)self->m_webView webView];
  [v31 addObserver:self selector:sel_webViewDidChange_ name:v34 object:v35];

  [v31 addObserver:self selector:sel_keyboardDidShow_ name:@"UIKeyboardDidShowNotification" object:0];
  [v30 setAllowsScrolling:0];
  [(DOMHTMLElement *)self->m_body setAttribute:@"dir" value:@"auto"];
  [(UITextContentView *)self setSelectionChangeCallbacksDisabled:1];
  [(UITextContentView *)self setScrollsSelectionOnWebDocumentChanges:1];
  [(UIWebDocumentView *)self->m_webView _setParentTextView:self];
  [(UIWebDocumentView *)self->m_webView setOpaque:0];
  [(UIWebDocumentView *)self->m_webView setDrawsBackground:0];
  [(UIView *)self addSubview:self->m_webView];
  if (!a4)
  {
    v36 = +[UIColor whiteColor];
    [(UIView *)self setBackgroundColor:v36];
  }
  [(UITextContentView *)self updateContentEditableAttribute:1];
  [(UITextContentView *)self setDataDetectorTypes:0];
  v37 = [[UIDragInteraction alloc] initWithDelegate:self];
  m_dragInteraction = self->m_dragInteraction;
  self->m_dragInteraction = v37;

  [(UIView *)self addInteraction:self->m_dragInteraction];
  v39 = [[UIDropInteraction alloc] initWithDelegate:self];
  m_dropInteraction = self->m_dropInteraction;
  self->m_dropInteraction = v39;

  [(UIView *)self addInteraction:self->m_dropInteraction];
}

- (void)dealloc
{
  v12[3] = *MEMORY[0x1E4F143B8];
  WebThreadLock();
  BOOL v3 = [(UIWebDocumentView *)self->m_webView webView];
  [v3 setPolicyDelegate:0];
  [v3 setEditingDelegate:0];
  if (sDataDetectorsUIFrameworkLoaded == 1 && [(UITextContentView *)self dataDetectorTypes])
  {
    id v4 = [DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
    [v4 frameWillBeRemoved:self->m_frame];
  }
  [(UITextContentView *)self cancelDataDetectorsWithWebLock];
  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4FB6E78];
  v12[0] = *MEMORY[0x1E4FB6E10];
  v12[1] = v6;
  v12[2] = @"UIKeyboardDidShowNotification";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v5, self, v7);

  m_interactionAssistant = self->m_interactionAssistant;
  self->m_interactionAssistant = 0;

  [(UIWebDocumentView *)self->m_webView _setParentTextView:0];
  [(UIView *)self removeInteraction:self->m_dragInteraction];
  m_dragInteraction = self->m_dragInteraction;
  self->m_dragInteraction = 0;

  [(UIView *)self removeInteraction:self->m_dropInteraction];
  m_dropInteraction = self->m_dropInteraction;
  self->m_dropInteraction = 0;

  v11.receiver = self;
  v11.super_class = (Class)UITextContentView;
  [(UIView *)&v11 dealloc];
}

- (void)removeFromSuperview
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  BOOL v3 = [(UITextContentView *)self interactionAssistant];
  [v3 detach];

  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  [(UIView *)&v4 removeFromSuperview];
}

- (void)keyboardDidShow:(id)a3
{
  if ([(UITextContentView *)self isFirstResponder])
  {
    objc_super v4 = [(UITextContentView *)self interactionAssistant];
    [v4 setNeedsSelectionDisplayUpdate];

    [(UITextContentView *)self scrollSelectionToVisible:1];
  }
}

- (id)styleString
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v13 = xmmword_186B9D668;
  *(_OWORD *)double v14 = unk_186B9D678;
  m_textColor = self->m_textColor;
  if (m_textColor) {
    [(UIColor *)m_textColor getRed:&v13 green:(char *)&v13 + 8 blue:v14 alpha:&v14[1]];
  }
  objc_super v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t m_marginTop = self->m_marginTop;
  uint64_t v6 = [(UIFont *)self->m_font markupDescription];
  objc_msgSend(v4, "stringWithFormat:", @"margin-top: %dpx; %@; color: rgba(%d, %d, %d, %f); word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;",
    m_marginTop,
    v6,
    (int)(*(double *)&v13 * 255.0),
    (int)(*((double *)&v13 + 1) * 255.0),
    (int)(v14[0] * 255.0),
  v7 = *(void *)&v14[1]);

  if (self->m_hasExplicitTextAlignment)
  {
    unint64_t m_textAlignment = self->m_textAlignment;
    if (m_textAlignment != 4)
    {
      id v9 = NSString;
      objc_super v10 = UITextAlignmentGetStylePropertyString(m_textAlignment);
      objc_super v11 = [v9 stringWithFormat:@"text-align: %@; ", v10];
      [v7 appendString:v11];
    }
  }
  return v7;
}

- (void)recalculateStyle
{
  WebThreadLock();
  m_boddouble y = self->m_body;
  objc_super v4 = [(UITextContentView *)self styleString];
  [(DOMHTMLElement *)m_body setAttribute:@"style" value:v4];

  m_frame = self->m_frame;
  [(WebFrame *)m_frame updateLayout];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  [(UIView *)&v4 didMoveToSuperview];
  BOOL v3 = [(UIView *)self superview];

  if (v3)
  {
    [(WebFrame *)self->m_frame updateLayout];
    [(UITextContentView *)self webViewDidChange:0];
  }
}

- (void)setSelectionChangeCallbacksDisabled:(BOOL)a3
{
  LODWORD(v3) = a3;
  objc_super v5 = [(UIWebDocumentView *)self->m_webView webView];
  uint64_t v6 = [v5 editingDelegate];
  if (v6 == self) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = 0;
  }

  m_frame = self->m_frame;
  [(WebFrame *)m_frame setSelectionChangeCallbacksDisabled:v3];
}

- (id)_keyboardResponder
{
  return self->m_webView;
}

- (BOOL)becomeFirstResponder
{
  BOOL v2 = 1;
  if (!self->m_reentrancyGuard)
  {
    self->m_reentrancyGuard = 1;
    self->m_becomingFirstResponder = 1;
    id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if ([(UITextContentView *)self isFirstResponder])
    {
      if ([(UITextContentView *)self isEditable] && ![(UITextContentView *)self isEditing])
      {
        [(UIResponder *)self reloadInputViews];
        [(UITextContentView *)self setEditing:1];
        [(UITextContentView *)self performSelector:sel_performBecomeEditableTasks withObject:0 afterDelay:0.0];
        if (objc_opt_respondsToSelector()) {
          [WeakRetained textViewDidBeginEditing:self];
        }
        objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v5 postNotificationName:@"UITextViewTextDidBeginEditingNotification" object:self];

        BOOL v2 = 1;
      }
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UITextContentView;
      if ([(UIView *)&v11 becomeFirstResponder])
      {
        [(UIWebDocumentView *)self->m_webView makeWKFirstResponder];
        if ([(UITextContentView *)self isEditable])
        {
          [(UITextContentView *)self setEditing:1];
          [(UITextContentView *)self performSelector:sel_performBecomeEditableTasks withObject:0 afterDelay:0.0];
          if (objc_opt_respondsToSelector()) {
            [WeakRetained textViewDidBeginEditing:self];
          }
          uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v6 postNotificationName:@"UITextViewTextDidBeginEditingNotification" object:self];

          v7 = [(UITextContentView *)self interactionAssistant];
          [v7 setCursorBlinkAnimationEnabled:1];
        }
        else
        {
          v7 = [(UITextContentView *)self interactionAssistant];
          [v7 setGestureRecognizers];
        }

        v8 = [(UITextContentView *)self interactionAssistant];
        BOOL v2 = 1;
        [v8 setSelectionDisplayVisible:1];

        id v9 = [(UITextContentView *)self interactionAssistant];
        [v9 activateSelection];

        [(UITextContentView *)self webViewDidChange:0];
      }
      else
      {
        BOOL v2 = 0;
      }
    }
    self->m_reentrancyGuard = 0;
    self->m_becomingFirstResponder = 0;
  }
  return v2;
}

- (BOOL)resignFirstResponder
{
  BOOL v2 = self;
  BOOL result = 1;
  if (!v2->m_reentrancyGuard)
  {
    v2->m_reentrancyGuard = 1;
    v7.receiver = v2;
    v7.super_class = (Class)UITextContentView;
    if ([(UIResponder *)&v7 resignFirstResponder])
    {
      [(UIWebDocumentView *)v2->m_webView clearWKFirstResponder];
      [(UITextContentView *)v2 setEditing:0];
      id WeakRetained = objc_loadWeakRetained(&v2->m_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained textContentViewDidEndEditing:v2];
      }
      objc_super v5 = [(UITextContentView *)v2 interactionAssistant];
      [v5 resignedFirstResponder];

      uint64_t v6 = [(UITextContentView *)v2 interactionAssistant];
      [v6 setGestureRecognizers];

      v2->m_reentrancyGuard = 0;
      return 1;
    }
    else
    {
      BOOL result = 0;
      v2->m_reentrancyGuard = 0;
    }
  }
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  if (![(UITextContentView *)self isEditable]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained textContentViewShouldBeginEditing:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)canResignFirstResponder
{
  if (![(UITextContentView *)self isEditing]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained textContentViewShouldEndEditing:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  return [(UIView *)&v4 isFirstResponder]
      || [(UIView *)self->m_webView isFirstResponder];
}

- (void)ensureSelection
{
  if (![(UITextContentView *)self isFirstResponder]) {
    [(UITextContentView *)self becomeFirstResponder];
  }
  uint64_t v3 = [(UIWebDocumentView *)self->m_webView selectedTextRange];

  if (!v3)
  {
    [(UITextContentView *)self setSelectionToEnd];
  }
}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self size];
  double v7 = v6 * 0.5;
  [(UITextContentView *)self visibleTextRect];
  if (y >= v8)
  {
    double v10 = v8 + v9;
    double v11 = y - (v8 + v9);
    if (v11 > 0.0) {
      double y = v10 + v11 / (v11 / v7 + 5.0);
    }
  }
  else if (y - v8 < 0.0)
  {
    double y = v8 + (y - v8) / (5.0 - (y - v8) / v7);
  }
  double v12 = x;
  double v13 = y;
  result.double y = v13;
  result.CGFloat x = v12;
  return result;
}

- (id)automaticallySelectedOverlay
{
  uint64_t v3 = [(UIView *)self _scroller];
  objc_super v4 = v3;
  if (!v3) {
    uint64_t v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIDragInteraction setEnabled:](self->m_dragInteraction, "setEnabled:");
  m_webView = self->m_webView;
  [(UIWebDocumentView *)m_webView setDragInteractionEnabled:v3];
}

- (BOOL)dragInteractionEnabled
{
  int v3 = [(UIDragInteraction *)self->m_dragInteraction isEnabled];
  if (v3)
  {
    m_webView = self->m_webView;
    LOBYTE(v3) = [(UIWebDocumentView *)m_webView isDragInteractionEnabled];
  }
  return v3;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  return [(UIWebDocumentView *)self->m_webView dragInteraction:a3 itemsForBeginningSession:a4];
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return [(UIWebDocumentView *)self->m_webView dragInteraction:a3 previewForLiftingItem:a4 session:a5];
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  return [(UIWebDocumentView *)self->m_webView dragInteraction:a3 previewForCancellingItem:a4 withDefault:a5];
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return [(UIWebDocumentView *)self->m_webView _dragInteraction:a3 dataOwnerForSession:a4];
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return -[UIWebDocumentView _dragInteraction:dataOwnerForAddingToSession:withTouchAtPoint:](self->m_webView, "_dragInteraction:dataOwnerForAddingToSession:withTouchAtPoint:", a3, a4, a5.x, a5.y);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return [(UIWebDocumentView *)self->m_webView dropInteraction:a3 sessionDidUpdate:a4];
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  return [(UIWebDocumentView *)self->m_webView dropInteraction:a3 previewForDroppingItem:a4 withDefault:a5];
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  id v9 = a4;
  -[UIWebDocumentView dropInteraction:concludeDrop:](self->m_webView, "dropInteraction:concludeDrop:", a3);
  if (![(UITextContentView *)self isFirstResponder])
  {
    double v6 = [(UIWebDocumentView *)self->m_webView webDraggingDelegate];
    if (objc_opt_respondsToSelector())
    {
      double v7 = [(UIWebDocumentView *)self->m_webView webDraggingDelegate];
      int v8 = [v7 _webView:self->m_webView allowsSelectingContentAfterDropForSession:v9];

      if (!v8) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    [(UITextContentView *)self becomeFirstResponder];
  }
LABEL_7:
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return [(UIWebDocumentView *)self->m_webView _dropInteraction:a3 dataOwnerForSession:a4];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITextContentView;
  -[UIView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (UIWebDocumentView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->m_webView)
  {
    double v6 = self;

    id v5 = (UIWebDocumentView *)v6;
  }
  return v5;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UITextContentView;
  [(UIResponder *)&v4 touchesEnded:a3 withEvent:a4];
}

- (void)beginSelectionChange
{
}

- (void)updateSelection
{
  id v2 = [(UITextContentView *)self interactionAssistant];
  [v2 setNeedsSelectionDisplayUpdate];
}

- (void)endSelectionChange
{
}

- (BOOL)hasSelection
{
  return [(UIWebDocumentView *)self->m_webView hasSelection];
}

- (void)startAutoscroll:(CGPoint)a3
{
}

- (void)cancelAutoscroll
{
}

- (id)interactionAssistant
{
  return self->m_interactionAssistant;
}

- (BOOL)_restoreFirstResponder
{
  int v3 = [(UITextContentView *)self interactionAssistant];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 checkEditabilityAndSetFirstResponderIfNecessary];
    unsigned __int8 v5 = [(UITextContentView *)self isFirstResponder];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITextContentView;
    unsigned __int8 v5 = [(UIResponder *)&v8 _restoreFirstResponder];
  }
  BOOL v6 = v5;

  return v6;
}

- (CGRect)_selectionClipRect
{
  [(UIWebDocumentView *)self->m_webView _selectionClipRect];
  m_webView = self->m_webView;
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", m_webView);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)caretRectForVisiblePosition:(id)a3
{
  m_webView = self->m_webView;
  [(UIWebDocumentView *)m_webView caretRectForVisiblePosition:a3];
  -[UIView convertRect:toView:](m_webView, "convertRect:toView:", self);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  m_webView = self->m_webView;
  double v5 = [a3 _isImpl];
  double v6 = [v5 domRange];
  double v7 = [(UIWebDocumentView *)m_webView selectionRectsForDOMRange:v6];

  if ([v7 count])
  {
    double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v17 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = (void *)[*(id *)(*((void *)&v18 + 1) + 8 * i) copy];
          [v14 rect];
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView);
          objc_msgSend(v14, "setRect:");
          uint64_t v15 = +[UITextSelectionRectImpl rectWithWebRect:v14];
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    double v7 = v17;
  }
  else
  {
    double v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)selectedText
{
  m_webView = self->m_webView;
  int v3 = [(UIWebDocumentView *)m_webView selectedTextRange];
  double v4 = [(UIWebDocumentView *)m_webView textInRange:v3];

  return v4;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
{
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->m_webView, a3.x, a3.y);
  m_webView = self->m_webView;
  -[UIWebDocumentView closestCaretRectInMarkedTextRangeForPoint:](m_webView, "closestCaretRectInMarkedTextRangeForPoint:");
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (unint64_t)offsetInMarkedTextForSelection:(id)a3
{
  return [(UIWebDocumentView *)self->m_webView offsetInMarkedTextForSelection:a3];
}

- (BOOL)hasMarkedText
{
  id v2 = [(UIWebDocumentView *)self->m_webView markedTextRange];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_NSRange)selectionRange
{
  NSUInteger v2 = [(UIWebDocumentView *)self->m_webView selectionRange];
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)fontForCaretSelection
{
  return [(UIWebDocumentView *)self->m_webView fontForCaretSelection];
}

- (void)_hideSelectionCommands
{
  id v2 = [(UITextContentView *)self interactionAssistant];
  [v2 hideSelectionCommands];
}

- (id)undoManager
{
  m_webView = self->m_webView;
  NSUInteger v3 = [(UIWebDocumentView *)m_webView webView];
  double v4 = [(UIWebDocumentView *)m_webView undoManagerForWebView:v3];

  return v4;
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
}

- (void)cut:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UIResponder *)self _dataOwnerForCopy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__UITextContentView_cut___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[UIPasteboard _performAsDataOwner:v5 block:v7];
}

uint64_t __25__UITextContentView_cut___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 504) cut:*(void *)(a1 + 40)];
}

- (void)copy:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UIResponder *)self _dataOwnerForCopy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__UITextContentView_copy___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[UIPasteboard _performAsDataOwner:v5 block:v7];
}

uint64_t __26__UITextContentView_copy___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 504) copy:*(void *)(a1 + 40)];
}

- (void)paste:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UIResponder *)self _dataOwnerForPaste];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__UITextContentView_paste___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[UIPasteboard _performAsDataOwner:v5 block:v7];
}

uint64_t __27__UITextContentView_paste___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 504) paste:*(void *)(a1 + 40)];
}

- (void)pasteAndMatchStyle:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(UIResponder *)self _dataOwnerForPaste];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__UITextContentView_pasteAndMatchStyle___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[UIPasteboard _performAsDataOwner:v5 block:v7];
}

uint64_t __40__UITextContentView_pasteAndMatchStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 504) pasteAndMatchStyle:*(void *)(a1 + 40)];
}

- (void)select:(id)a3
{
  id v3 = [(UITextContentView *)self interactionAssistant];
  [v3 selectWord];
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextContentView *)self interactionAssistant];
  [v5 selectAll:v4];
}

- (void)increaseSize:(id)a3
{
}

- (void)decreaseSize:(id)a3
{
}

- (void)replace:(id)a3
{
}

- (void)_promptForReplace:(id)a3
{
  id v3 = [(UITextContentView *)self interactionAssistant];
  [v3 scheduleReplacements];
}

- (void)_transliterateChinese:(id)a3
{
  id v3 = [(UITextContentView *)self interactionAssistant];
  [v3 scheduleChineseTransliteration];
}

- (void)_define:(id)a3
{
}

- (void)_translate:(id)a3
{
}

- (void)_share:(id)a3
{
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
}

- (void)_addShortcut:(id)a3
{
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  return [(UIWebDocumentView *)self->m_webView textStylingAtPosition:a3 inDirection:a4];
}

- (void)toggleBoldface:(id)a3
{
}

- (void)toggleItalics:(id)a3
{
}

- (void)toggleUnderline:(id)a3
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_replace_ == a3)
  {
    if ([(UITextContentView *)self isEditing]
      && ([(UITextContentView *)self isSecureTextEntry] & 1) == 0)
    {
      return [(UITextContentView *)self hasText];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    m_webView = self->m_webView;
    return -[UIWebDocumentView canPerformAction:withSender:](m_webView, "canPerformAction:withSender:");
  }
}

- (void)selectAll
{
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  if (!_MergedGlobals_9_5)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = (void *)_MergedGlobals_9_5;
    _MergedGlobals_9_5 = (uint64_t)v3;

    id v5 = (void *)_MergedGlobals_9_5;
    id v6 = [(id)*MEMORY[0x1E4F444F8] identifier];
    [v5 addObject:v6];

    [(id)_MergedGlobals_9_5 addObjectsFromArray:UIPasteboardTypeListString];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = (void *)qword_1EB25D1F0;
    qword_1EB25D1F0 = (uint64_t)v7;

    [(id)qword_1EB25D1F0 addObject:*MEMORY[0x1E4FB6E28]];
    id v9 = (void *)qword_1EB25D1F0;
    uint64_t v10 = [(id)*MEMORY[0x1E4F444A0] identifier];
    [v9 addObject:v10];

    uint64_t v11 = (void *)qword_1EB25D1F0;
    uint64_t v12 = [(id)*MEMORY[0x1E4F443C0] identifier];
    [v11 addObject:v12];

    [(id)qword_1EB25D1F0 addObjectsFromArray:UIPasteboardTypeListImage];
    [(id)qword_1EB25D1F0 addObjectsFromArray:_MergedGlobals_9_5];
  }
  BOOL v13 = [(UITextContentView *)self allowsEditingTextAttributes];
  double v14 = &qword_1EB25D1F0;
  if (!v13) {
    double v14 = &_MergedGlobals_9_5;
  }
  uint64_t v15 = (void *)*v14;
  return v15;
}

- (id)documentFragmentForPasteboardItemAtIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [WeakRetained documentFragmentForPasteboardItemAtIndex:a3 inTextContentView:self];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = [(UIView *)self _scroller];
  if (v15)
  {
    [(UITextContentView *)self selectionInset];
    if (self->m_bottomBufferHeight >= v12) {
      double m_bottomBufferHeight = v12;
    }
    else {
      double m_bottomBufferHeight = self->m_bottomBufferHeight;
    }
    -[UIView convertRect:toView:](self, "convertRect:toView:", v15, x + v11, y + v10, width - (v11 + v13), height - (v10 + m_bottomBufferHeight));
    objc_msgSend(v15, "scrollRectToVisible:animated:", v4);
  }
}

- (void)webViewDidChange:(id)a3
{
  WebThreadLock();
  BOOL v4 = [(WebFrame *)self->m_frame frameView];
  id v19 = [v4 documentView];

  [v19 frame];
  double v6 = v5;
  double v8 = v7;
  [(UIView *)self size];
  if (v8 > v9) {
    [(WebFrame *)self->m_frame setNeedsLayout];
  }
  [(UIView *)self frame];
  if (v6 < v10)
  {
    [(UIView *)self frame];
    double v6 = v11;
  }
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector()) {
    int v13 = objc_msgSend(WeakRetained, "textContentView:shouldScrollForPendingContentSize:", self, v6, v8) ^ 1;
  }
  else {
    LOBYTE(v13) = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    int v14 = objc_msgSend(WeakRetained, "textContentView:shouldChangeSizeForContentSize:", self, v6, v8);
    -[UIView setSize:](self->m_webView, "setSize:", v6, v8);
    if (v14)
    {
      [(UIView *)self frame];
      -[UITextContentView setFrame:](self, "setFrame:");
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(WeakRetained, "textContentView:didChangeSize:", self, v6, v8);
      }
    }
  }
  else
  {
    -[UIView setSize:](self->m_webView, "setSize:", v6, v8);
  }
  id v15 = [(UIView *)self _scroller];
  if (v15) {
    char v16 = v13;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0
    && [(UITextContentView *)self scrollsSelectionOnWebDocumentChanges])
  {
    [v15 _contentOffsetAnimationDuration];
    double v18 = v17;
    [v15 _setContentOffsetAnimationDuration:0.1];
    [(UITextContentView *)self scrollSelectionToVisible:1];
    [v15 _setContentOffsetAnimationDuration:v18];
  }
}

- (void)performBecomeEditableTasks
{
  id v3 = [(UIView *)self superview];

  if (v3)
  {
    [(UITextContentView *)self ensureSelection];
    BOOL v4 = +[UIKeyboardImpl activeInstance];
    [v4 setInitialDirection];

    id v5 = [(UITextContentView *)self interactionAssistant];
    [v5 setGestureRecognizers];
  }
}

- (void)_sizeChanged
{
  WebThreadLock();
  [(UIView *)self->m_webView frame];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(UIView *)self bounds];
  double v6 = v5;
  -[UIWebDocumentView setFrame:](self->m_webView, "setFrame:", v3, v4);
  double v7 = [(UIWebDocumentView *)self->m_webView webView];
  objc_msgSend(v7, "_setFixedLayoutSize:", v6, 1.0);

  double v8 = [(UITextContentView *)self interactionAssistant];
  [v8 setNeedsSelectionDisplayUpdate];

  id v9 = +[UIKeyboardImpl activeInstance];
  [v9 textFrameChanged:self];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITextContentView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UITextContentView *)self _sizeChanged];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITextContentView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UITextContentView *)self _sizeChanged];
  }
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  m_webView = self->m_webView;
  -[UITextContentView constrainedPoint:](self, "constrainedPoint:", a3.x, a3.y);
  -[UIWebDocumentView setSelectionWithPoint:](m_webView, "setSelectionWithPoint:");
}

- (void)setSelectionToStart
{
  [(UITextContentView *)self beginSelectionChange];
  WebThreadLock();
  m_webView = self->m_webView;
  double v4 = [(UIWebDocumentView *)m_webView beginningOfDocument];
  double v5 = [(UIWebDocumentView *)self->m_webView beginningOfDocument];
  double v6 = [(UIWebDocumentView *)m_webView textRangeFromPosition:v4 toPosition:v5];
  [(UIWebDocumentView *)self->m_webView setSelectedTextRange:v6];

  [(UITextContentView *)self scrollSelectionToVisible:1];
  [(UITextContentView *)self endSelectionChange];
}

- (void)setSelectionToEnd
{
  [(UITextContentView *)self beginSelectionChange];
  m_webView = self->m_webView;
  double v4 = [(UIWebDocumentView *)m_webView endOfDocument];
  double v5 = [(UIWebDocumentView *)self->m_webView endOfDocument];
  double v6 = [(UIWebDocumentView *)m_webView textRangeFromPosition:v4 toPosition:v5];
  [(UIWebDocumentView *)self->m_webView setSelectedTextRange:v6];

  [(UITextContentView *)self scrollSelectionToVisible:1];
  [(UITextContentView *)self endSelectionChange];
}

- (CGRect)rectForSelection:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  WebThreadLock();
  double v6 = -[WebFrame convertNSRangeToDOMRange:](self->m_frame, "convertNSRangeToDOMRange:", location, length);
  m_frame = self->m_frame;
  double v8 = [v6 startContainer];
  -[WebFrame caretRectAtNode:offset:affinity:](m_frame, "caretRectAtNode:offset:affinity:", v8, [v6 startOffset], 1);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)performScrollSelectionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIWebDocumentView *)self->m_webView hasSelection]
    && [(UITextContentView *)self isFirstResponder])
  {
    [(WebFrame *)self->m_frame rectForScrollToVisible];
    CGRect v7 = CGRectInset(v6, -5.0, -5.0);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
    -[UITextContentView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v3);
  }
}

- (CGRect)rectForScrollToVisible
{
  if ([(UIWebDocumentView *)self->m_webView hasSelection])
  {
    [(WebFrame *)self->m_frame rectForScrollToVisible];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setContentToHTMLString:(id)a3
{
  double v10 = (__CFString *)a3;
  WebThreadLock();
  double v4 = [(UIWebDocumentView *)self->m_webView inputDelegate];
  if ([(UITextContentView *)self isEditing]) {
    [v4 textWillChange:self->m_webView];
  }
  if (v10) {
    double v5 = v10;
  }
  else {
    double v5 = &stru_1ED0E84C0;
  }
  [(DOMHTMLElement *)self->m_body setInnerHTML:v5];
  if ([(UITextContentView *)self isEditing]) {
    [v4 textDidChange:self->m_webView];
  }
  [(WebFrame *)self->m_frame updateLayout];
  [(UITextContentView *)self webViewDidChange:0];
  if ([(UITextContentView *)self shouldStartDataDetectors]) {
    [(UITextContentView *)self startDataDetectorsWithWebLock];
  }
  double v6 = [(UIWebDocumentView *)self->m_webView undoManager];
  char v7 = [v6 isUndoRegistrationEnabled];

  double v8 = [(UIWebDocumentView *)self->m_webView undoManager];
  [v8 removeAllActions];

  if ((v7 & 1) == 0)
  {
    double v9 = [(UIWebDocumentView *)self->m_webView undoManager];
    [v9 disableUndoRegistration];
  }
}

- (id)contentAsHTMLString
{
  WebThreadLock();
  m_boddouble y = self->m_body;
  return (id)[(DOMHTMLElement *)m_body innerHTML];
}

- (void)setContentToAttributedString:(id)a3
{
  id v4 = a3;
  id v8 = (id)[objc_alloc((Class)off_1E52D2C28) initWithAttributedString:v4];

  id v5 = [NSString alloc];
  double v6 = [v8 HTMLData];
  char v7 = (void *)[v5 initWithData:v6 encoding:4];

  [(UITextContentView *)self setContentToHTMLString:v7];
}

- (id)contentAsAttributedString
{
  WebThreadLock();
  double v3 = [(UIWebDocumentView *)self->m_webView _focusedOrMainFrame];
  id v4 = [v3 DOMDocument];
  id v5 = [v4 createRange];

  [v5 selectNodeContents:self->m_body];
  double v6 = (void *)[objc_alloc((Class)off_1E52D2C20) initWithDOMRange:v5];
  char v7 = [v6 attributedString];

  return v7;
}

- (id)textInputTraits
{
  return [(UIWebDocumentView *)self->m_webView textInputTraits];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextContentView *)self textInputTraits];
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITextContentView;
    [(UITextContentView *)&v6 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  return v4;
}

- (void)setAllowsEditingTextAttributes:(BOOL)a3
{
  self->m_allowsEditingTextAttributes = a3;
  if (a3) {
    self->m_usesAttributedText = 1;
  }
}

- (BOOL)allowsEditingTextAttributes
{
  return self->m_allowsEditingTextAttributes;
}

- (NSAttributedString)attributedText
{
  if (self->m_usesAttributedText)
  {
    WebThreadLock();
    double v3 = [(UIWebDocumentView *)self->m_webView _focusedOrMainFrame];
    id v4 = [v3 DOMDocument];
    id v5 = [v4 createRange];

    [v5 selectNodeContents:self->m_body];
    objc_super v6 = (void *)[objc_alloc((Class)off_1E52D2C20) initWithDOMRange:v5];
    char v7 = [v6 attributedString];
    id v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v5 = [(UITextContentView *)self text];
    id v8 = (void *)[v9 initWithString:v5];
  }

  double v10 = [v8 mutableString];
  double v11 = [(UITextContentView *)self textInputTraits];
  objc_msgSend(v10, "_removeCharactersFromSet:", objc_msgSend(v11, "textTrimmingSet"));

  [v10 _replaceOccurrencesOfCharacter:160 withCharacter:32];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v8];

  return (NSAttributedString *)v12;
}

- (void)_removeAttribute:(id)a3 fromString:(id)a4 andSetPropertyWith:(id)a5 usingValueClass:(Class)a6
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  double v10 = [v8 _UIKBStringWideAttributeValueForKey:v11];
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v9[2](v9, v10);
    }
    objc_msgSend(v8, "removeAttribute:range:", v11, 0, objc_msgSend(v8, "length"));
  }
}

- (void)_removeTextViewPropertiesFromText:(id)a3
{
  uint64_t v4 = *(void *)off_1E52D2040;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke;
  double v16 = &unk_1E52FDC70;
  double v17 = self;
  id v5 = a3;
  [(UITextContentView *)self _removeAttribute:v4 fromString:v5 andSetPropertyWith:&v13 usingValueClass:objc_opt_class()];
  uint64_t v6 = *(void *)off_1E52D2048;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke_2;
  id v11 = &unk_1E52FDC70;
  double v12 = self;
  [(UITextContentView *)self _removeAttribute:v6 fromString:v5 andSetPropertyWith:&v8 usingValueClass:objc_opt_class()];
  char v7 = objc_msgSend(v5, "_UIKBStringWideAttributeValueForKey:", *(void *)off_1E52D21B8, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[UITextContentView setTextAlignment:](self, "setTextAlignment:", [v7 alignment]);
  }
}

uint64_t __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setFont:a2];
}

uint64_t __55__UITextContentView__removeTextViewPropertiesFromText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setTextColor:a2];
}

+ (id)excludedElementsForHTML
{
  id v2 = (void *)excludedElementsForHTML_exclusions;
  if (!excludedElementsForHTML_exclusions)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"STYLE", @"HTML", @"APPLET", @"OBJECT", @"BASEFONT", @"CENTER", @"DIR", @"FONT", @"ISINDEX", @"MENU", @"S", @"XML", @"BODY", @"HEAD", @"META", 0);
    uint64_t v4 = (void *)excludedElementsForHTML_exclusions;
    excludedElementsForHTML_exclusions = v3;

    id v2 = (void *)excludedElementsForHTML_exclusions;
  }
  return v2;
}

- (void)setAttributedText:(id)a3
{
  self->m_usesAttributedText = 1;
  id v16 = (id)[a3 mutableCopy];
  uint64_t v4 = [v16 mutableString];
  [(UITextContentView *)self _removeTextViewPropertiesFromText:v16];
  id v5 = [(UITextContentView *)self textInputTraits];
  objc_msgSend(v4, "_removeCharactersFromSet:", objc_msgSend(v5, "textTrimmingSet"));

  [v4 _removeOccurrencesOfCharacter:65532];
  uint64_t v6 = (void *)[objc_alloc((Class)off_1E52D2C28) initWithAttributedString:v16];
  char v7 = [(id)objc_opt_class() excludedElementsForHTML];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:*(void *)off_1E52D1FD8];
  [v6 setDocumentAttributes:v8];

  id v9 = [NSString alloc];
  double v10 = [v6 HTMLData];
  id v11 = (void *)[v9 initWithData:v10 encoding:4];

  if ([v11 length])
  {
    uint64_t v12 = [v11 length] - 1;
    if ([v11 characterAtIndex:v12] == 10)
    {
      uint64_t v13 = [v11 substringToIndex:v12];

      id v11 = (void *)v13;
    }
  }
  uint64_t v14 = [NSString stringWithFormat:@"font-family: 'Helvetica Neue'; font-weight: normal; font-style: normal; font-size: 12px"];
  double v15 = [v11 stringByReplacingOccurrencesOfString:v14 withString:&stru_1ED0E84C0];

  [(UITextContentView *)self setContentToHTMLString:v15];
}

- (UIFont)font
{
  return self->m_font;
}

- (void)setFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->m_font != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->m_font, a3);
    [(UITextContentView *)self recalculateStyle];
    [(UITextContentView *)self webViewDidChange:0];
    id v5 = v6;
  }
}

- (UIColor)textColor
{
  return self->m_textColor;
}

- (void)setTextColor:(id)a3
{
  uint64_t v4 = (UIColor *)a3;
  if (self->m_textColor != v4)
  {
    if (!v4)
    {
      uint64_t v4 = +[UIColor blackColor];
    }
    obj = v4;
    objc_storeStrong((id *)&self->m_textColor, v4);
    [(UITextContentView *)self recalculateStyle];
    uint64_t v4 = obj;
  }
}

- (BOOL)hasText
{
  return [(UIWebDocumentView *)self->m_webView hasContent];
}

- (NSString)text
{
  WebThreadLock();
  uint64_t v3 = [(WebFrame *)self->m_frame DOMDocument];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 body],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 innerText],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    if ([v5 hasSuffix:@"\n"])
    {
      uint64_t v6 = [(DOMHTMLElement *)self->m_body lastChild];
      char v7 = [v6 tagName];
      if (![v7 caseInsensitiveCompare:@"div"])
      {
        uint64_t v8 = [v6 firstChild];
        uint64_t v9 = [v8 tagName];

        char v7 = (void *)v9;
      }
      if (![v7 caseInsensitiveCompare:@"br"])
      {
        uint64_t v10 = [v5 _stringByTrimmingLastCharacter];

        id v5 = (void *)v10;
      }
    }
    if (!text_nbspString)
    {
      uint64_t v11 = [NSString _stringWithUnichar:160];
      uint64_t v12 = (void *)text_nbspString;
      text_nbspString = v11;
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v5];
    objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", text_nbspString, @" ", 2, 0, objc_msgSend(v13, "length"));
    uint64_t v14 = [(UITextContentView *)self textInputTraits];
    uint64_t v15 = [v14 textTrimmingSet];

    if (v15)
    {
      id v16 = [v13 _stringByTrimmingCharactersInCFCharacterSet:v15];
    }
    else
    {
      id v16 = v13;
    }
    double v17 = v16;
  }
  else
  {
    double v17 = 0;
  }

  return (NSString *)v17;
}

- (void)setText:(id)a3
{
  id v13 = a3;
  WebThreadLock();
  if ([(UITextContentView *)self dataDetectorTypes]) {
    [(UITextContentView *)self cancelDataDetectorsWithWebLock];
  }
  uint64_t v4 = [(UIWebDocumentView *)self->m_webView inputDelegate];
  if ([(UITextContentView *)self isEditing]) {
    [v4 textWillChange:self->m_webView];
  }
  uint64_t v5 = [v13 length];
  uint64_t v6 = 0;
  if (v13 && v5)
  {
    char v7 = [(UITextContentView *)self textInputTraits];
    uint64_t v8 = [v7 textTrimmingSet];

    if (v8)
    {
      uint64_t v6 = [v13 _stringByTrimmingCharactersInCFCharacterSet:v8];

      id v13 = (id)v6;
    }
    else
    {
      uint64_t v6 = (uint64_t)v13;
    }
  }
  [(WebFrame *)self->m_frame setText:v6 asChildOfElement:self->m_body];
  if ([(UITextContentView *)self isEditable]) {
    [v4 textDidChange:self->m_webView];
  }
  [(WebFrame *)self->m_frame updateLayout];
  [(UITextContentView *)self webViewDidChange:0];
  if ([(UITextContentView *)self shouldStartDataDetectors]) {
    [(UITextContentView *)self startDataDetectorsWithWebLock];
  }
  uint64_t v9 = [(UIWebDocumentView *)self->m_webView undoManager];
  char v10 = [v9 isUndoRegistrationEnabled];

  uint64_t v11 = [(UIWebDocumentView *)self->m_webView undoManager];
  [v11 removeAllActions];

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = [(UIWebDocumentView *)self->m_webView undoManager];
    [v12 disableUndoRegistration];
  }
}

- (int64_t)textAlignment
{
  return self->m_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->m_hasExplicitTextAlignment = 1;
  self->unint64_t m_textAlignment = a3;
  [(UITextContentView *)self recalculateStyle];
}

- (_NSRange)selectedRange
{
  WebThreadLock();
  m_frame = self->m_frame;
  NSUInteger v4 = [(WebFrame *)m_frame _selectedNSRange];
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(UITextContentView *)self beginSelectionChange];
  WebThreadLock();
  uint64_t v6 = -[WebFrame convertNSRangeToDOMRange:](self->m_frame, "convertNSRangeToDOMRange:", location, length);
  id v7 = (id)v6;
  if (v6) {
    [(WebFrame *)self->m_frame setSelectedDOMRange:v6 affinity:1 closeTyping:1];
  }
  else {
    [(UITextContentView *)self ensureSelection];
  }
  [(UITextContentView *)self scrollSelectionToVisible:1];
  [(UITextContentView *)self endSelectionChange];
}

- (BOOL)isEditable
{
  return self->m_editable;
}

- (void)setEditable:(BOOL)a3
{
  if (self->m_editable != a3)
  {
    BOOL v3 = a3;
    WebThreadLock();
    [(UITextContentView *)self updateContentEditableAttribute:v3];
    if (v3)
    {
      [(UIWebDocumentView *)self->m_webView makeWKFirstResponder];
      [(UITextContentView *)self performSelector:sel_performBecomeEditableTasks withObject:0 afterDelay:0.0];
      NSUInteger v5 = +[UIKeyboardImpl activeInstance];
      [v5 textChanged:self];
    }
    else
    {
      [(UITextContentView *)self resignFirstResponder];
    }
    [(WebFrame *)self->m_frame setIsActive:v3];
    [(UITextContentView *)self setSelectionChangeCallbacksDisabled:v3];
    self->m_editable = v3;
    uint64_t v6 = [(UITextContentView *)self interactionAssistant];
    [v6 setGestureRecognizers];

    if ([(UITextContentView *)self isEditable]
      && [(UITextContentView *)self dataDetectorTypes])
    {
      [(UIWebDocumentView *)self->m_webView setAllowsDataDetectorsSheet:0];
      [(UITextContentView *)self resetDataDetectorsResultsWithWebLock];
    }
    else if ([(UITextContentView *)self shouldStartDataDetectors])
    {
      [(UIWebDocumentView *)self->m_webView setAllowsDataDetectorsSheet:1];
      [(UITextContentView *)self startDataDetectorsWithWebLock];
    }
  }
}

- (BOOL)isEditing
{
  return self->m_editing;
}

- (void)setEditing:(BOOL)a3
{
  if (self->m_editing != a3)
  {
    self->m_editing = a3;
    -[UIWebTiledView setEditingTilingModeEnabled:](self->m_webView, "setEditingTilingModeEnabled:");
  }
}

- (BOOL)becomesEditableWithGestures
{
  return self->m_becomesEditableWithGestures;
}

- (void)setBecomesEditableWithGestures:(BOOL)a3
{
  self->m_becomesEditableWithGestures = a3;
}

- (int)marginTop
{
  return self->m_marginTop;
}

- (void)setMarginTop:(int)a3
{
  if (self->m_marginTop != a3)
  {
    self->uint64_t m_marginTop = a3;
    [(UITextContentView *)self recalculateStyle];
  }
}

- (CGRect)visibleRect
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(UIView *)self _scroller];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 contentOffset];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [v12 size];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [(UIView *)self frame];
    v41.origin.double x = v21;
    v41.origin.double y = v22;
    v41.size.double width = v23;
    v41.size.double height = v24;
    v38.origin.double x = v14;
    v38.origin.double y = v16;
    v38.size.double width = v18;
    v38.size.double height = v20;
    CGRect v39 = CGRectIntersection(v38, v41);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
    double v4 = v25;
    double v6 = v26;
    double v8 = v27;
    double v10 = v28;
  }
  if ([(UITextContentView *)self isEditing])
  {
    v29 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v29, "subtractKeyboardFrameFromRect:inView:", v12, v4, v6, v8, v10);
    double v4 = v30;
    double v6 = v31;
    double v8 = v32;
    double v10 = v33;
  }
  double v34 = v4;
  double v35 = v6;
  double v36 = v8;
  double v37 = v10;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (CGRect)visibleTextRect
{
  [(UITextContentView *)self visibleRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self->m_webView frame];
  v27.origin.CGFloat x = v11;
  v27.origin.CGFloat y = v12;
  v27.size.CGFloat width = v13;
  v27.size.double height = v14;
  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.double height = v10;
  CGRect v25 = CGRectIntersection(v24, v27);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  double height = v25.size.height;
  [(UIFont *)self->m_font pointSize];
  double v20 = height + v19 * -0.5;
  double v21 = x;
  double v22 = y;
  double v23 = width;
  result.size.double height = v20;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)webView
{
  return self->m_webView;
}

- (void)_didScroll
{
}

- (void)scrollRangeToVisible:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  WebThreadLock();
  -[WebFrame convertNSRangeToDOMRange:](self->m_frame, "convertNSRangeToDOMRange:", location, length);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(WebFrame *)self->m_frame firstRectForDOMRange:v6];
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->m_webView);
  -[UITextContentView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 1);
}

- (BOOL)shouldStartDataDetectors
{
  unint64_t v3 = [(UITextContentView *)self dataDetectorTypes];
  if (v3) {
    LOBYTE(v3) = ![(UITextContentView *)self isEditable];
  }
  return v3;
}

- (void)cancelDataDetectorsWithWebLock
{
  id v3 = [DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
  [v3 cancelURLificationForFrame:self->m_frame];
}

- (void)startDataDetectorsWithWebLock
{
  id v3 = [DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
  objc_msgSend(v3, "startURLificationForFrame:detectedTypes:", self->m_frame, -[UIWebDocumentView effectiveDataDetectorTypes](self->m_webView, "effectiveDataDetectorTypes"));
}

- (void)resetDataDetectorsResultsWithWebLock
{
  if (sDataDetectorsUIFrameworkLoaded == 1)
  {
    id v3 = [DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
    [v3 resetResultsForFrame:self->m_frame];
  }
}

- (unint64_t)dataDetectorTypes
{
  return [(UIWebDocumentView *)self->m_webView dataDetectorTypes];
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  if ([(UIWebDocumentView *)self->m_webView dataDetectorTypes] != a3)
  {
    WebThreadLock();
    [(UIWebDocumentView *)self->m_webView setDataDetectorTypes:a3];
    BOOL v5 = [(UITextContentView *)self shouldStartDataDetectors];
    m_webView = self->m_webView;
    if (v5)
    {
      [(UIWebDocumentView *)m_webView setAllowsDataDetectorsSheet:1];
      [(UITextContentView *)self startDataDetectorsWithWebLock];
    }
    else
    {
      [(UIWebDocumentView *)m_webView setAllowsDataDetectorsSheet:0];
      [(UITextContentView *)self resetDataDetectorsResultsWithWebLock];
    }
    id v7 = [(UITextContentView *)self interactionAssistant];
    [v7 setGestureRecognizers];
  }
}

- (BOOL)mightHaveLinks
{
  return [(UITextContentView *)self _allowedLinkTypes] != 0;
}

- (unint64_t)_allowedLinkTypes
{
  if (self->m_usesAttributedText) {
    return -1;
  }
  else {
    return [(UITextContentView *)self dataDetectorTypes];
  }
}

- (void)tapLinkAtPoint:(CGPoint)a3
{
}

- (void)startInteractionWithLinkAtPoint:(CGPoint)a3
{
}

- (void)updateInteractionWithLinkAtPoint:(CGPoint)a3
{
}

- (void)validateInteractionWithLinkAtPoint:(CGPoint)a3
{
}

- (void)cancelInteractionWithLink
{
}

- (void)startLongInteractionWithLinkAtPoint:(CGPoint)a3
{
}

- (BOOL)isInteractingWithLink
{
  return [(UIWebDocumentView *)self->m_webView isInInteraction];
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  return -[UIWebDocumentView willInteractWithLocation:](self->m_webView, "willInteractWithLocation:", a3.x, a3.y);
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector()) {
    char v10 = objc_msgSend(WeakRetained, "textContentView:shouldChangeTextInRange:replacementText:", self, location, length, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(UITextContentView *)self selectedRange];
    char v10 = objc_msgSend(WeakRetained, "textContentView:shouldChangeTextInRange:replacementText:", self, v8, v9, v6);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(UITextContentView *)self selectedRange];
    char v7 = objc_msgSend(WeakRetained, "textContentView:shouldChangeTextInRange:replacementText:", self, v5, v6, &stru_1ED0E84C0);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained textContentViewDidChange:self];
  }
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"UITextViewTextDidChangeNotification" object:self];

  return 1;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  if (!self->m_becomingFirstResponder)
  {
    id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained textContentViewDidChangeSelection:self];
    }
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  id v19 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  CGFloat v14 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4FB6E20]];
  int v15 = [v14 intValue];

  if (v15)
  {
    [v13 use];
  }
  else
  {
    CGFloat v16 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4FB6E18]];
    double v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FB6E38]];

    CGFloat v18 = [v11 URL];
    +[UIWebURLAction performDefaultActionForURL:v18 andDOMNode:v17 withAllowedTypes:[(UITextContentView *)self _allowedLinkTypes] forFrame:v12 inView:self];

    [v13 ignore];
  }
}

- (void)setBottomBufferHeight:(double)a3
{
  self->double m_bottomBufferHeight = -a3;
}

- (double)bottomBufferHeight
{
  return -self->m_bottomBufferHeight;
}

- (CGPoint)offset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (id)_proxyTextInput
{
  double v2 = self;
  double v3 = [(UITextContentView *)self tokenizer];
  CGFloat v4 = [(UIWebDocumentView *)v2->m_webView tokenizer];

  if (v3 == v4) {
    double v2 = (UITextContentView *)v2->m_webView;
  }
  uint64_t v5 = v2;
  return v5;
}

- (void)deleteBackward
{
}

- (void)insertText:(id)a3
{
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  char v7 = [(UITextContentView *)self _proxyTextInput];

  if (v7 == self)
  {
    uint64_t v8 = [v6 dictationPhraseArray];

    [(UITextContentView *)self insertDictationResult:v8];
    id v6 = (id)v8;
  }
  else
  {
    [(UIWebDocumentView *)self->m_webView insertDictationResult:v6 withCorrectionIdentifier:v9];
  }
}

- (id)insertDictationResultPlaceholder
{
  return [(UIWebDocumentView *)self->m_webView insertDictationResultPlaceholder];
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  [(UIWebDocumentView *)self->m_webView frameForDictationResultPlaceholder:a3];
  result.size.double height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (objc_opt_respondsToSelector())
  {
    double v6 = -[UIWebDocumentView insertTextPlaceholderWithSize:](self->m_webView, "insertTextPlaceholderWithSize:", width, height);
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (void)removeTextPlaceholder:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(UIWebDocumentView *)self->m_webView removeTextPlaceholder:v4];
  }
}

- (id)metadataDictionariesForDictationResults
{
  return [(UIWebDocumentView *)self->m_webView metadataDictionariesForDictationResults];
}

- (id)textInRange:(id)a3
{
  return [(UIWebDocumentView *)self->m_webView textInRange:a3];
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
}

- (UITextRange)selectedTextRange
{
  return [(UIWebDocumentView *)self->m_webView selectedTextRange];
}

- (void)setSelectedTextRange:(id)a3
{
  id v6 = a3;
  id v4 = [(UITextContentView *)self _proxyTextInput];

  if (v4 == self)
  {
    double v5 = [(UITextContentView *)self interactionAssistant];
    [v5 selectionChanged];
  }
  else
  {
    [(UIWebDocumentView *)self->m_webView setSelectedTextRange:v6];
  }
}

- (UITextRange)markedTextRange
{
  return [(UIWebDocumentView *)self->m_webView markedTextRange];
}

- (NSDictionary)markedTextStyle
{
  return [(UIWebDocumentView *)self->m_webView markedTextStyle];
}

- (void)setMarkedTextStyle:(id)a3
{
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
}

- (void)unmarkText
{
}

- (UITextPosition)beginningOfDocument
{
  return [(UIWebDocumentView *)self->m_webView beginningOfDocument];
}

- (UITextPosition)endOfDocument
{
  return [(UIWebDocumentView *)self->m_webView endOfDocument];
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return [(UIWebDocumentView *)self->m_webView textRangeFromPosition:a3 toPosition:a4];
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return [(UIWebDocumentView *)self->m_webView positionFromPosition:a3 offset:a4];
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return [(UIWebDocumentView *)self->m_webView positionFromPosition:a3 inDirection:a4 offset:a5];
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return [(UIWebDocumentView *)self->m_webView comparePosition:a3 toPosition:a4];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return [(UIWebDocumentView *)self->m_webView offsetFromPosition:a3 toPosition:a4];
}

- (UITextInputDelegate)inputDelegate
{
  return [(UIWebDocumentView *)self->m_webView inputDelegate];
}

- (void)setInputDelegate:(id)a3
{
}

- (UITextInputTokenizer)tokenizer
{
  return [(UIWebDocumentView *)self->m_webView tokenizer];
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return [(UIWebDocumentView *)self->m_webView positionWithinRange:a3 farthestInDirection:a4];
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return [(UIWebDocumentView *)self->m_webView characterRangeByExtendingPosition:a3 inDirection:a4];
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return [(UIWebDocumentView *)self->m_webView baseWritingDirectionForPosition:a3 inDirection:a4];
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
}

- (CGRect)firstRectForRange:(id)a3
{
  [(UIWebDocumentView *)self->m_webView firstRectForRange:a3];
  m_webView = self->m_webView;
  -[UIView convertRect:toView:](m_webView, "convertRect:toView:", self);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  [(UIWebDocumentView *)self->m_webView caretRectForPosition:a3];
  m_webView = self->m_webView;
  -[UIView convertRect:toView:](m_webView, "convertRect:toView:", self);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  -[UIView convertPoint:fromView:](self->m_webView, "convertPoint:fromView:", self, a3.x, a3.y);
  m_webView = self->m_webView;
  return -[UIWebDocumentView closestPositionToPoint:](m_webView, "closestPositionToPoint:");
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  m_webView = self->m_webView;
  id v8 = a4;
  -[UIView convertPoint:fromView:](m_webView, "convertPoint:fromView:", self, x, y);
  id v9 = -[UIWebDocumentView closestPositionToPoint:withinRange:](self->m_webView, "closestPositionToPoint:withinRange:", v8);

  return v9;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  -[UIView convertPoint:fromView:](self->m_webView, "convertPoint:fromView:", self, a3.x, a3.y);
  m_webView = self->m_webView;
  return -[UIWebDocumentView characterRangeAtPoint:](m_webView, "characterRangeAtPoint:");
}

- (int64_t)selectionAffinity
{
  return [(UIWebDocumentView *)self->m_webView selectionAffinity];
}

- (void)setSelectionAffinity:(int64_t)a3
{
}

- (int64_t)selectionGranularity
{
  return [(UIWebDocumentView *)self->m_webView selectionGranularity];
}

- (void)setSelectionGranularity:(int64_t)a3
{
}

- (UIEdgeInsets)selectionInset
{
  double top = self->m_selectionInset.top;
  double left = self->m_selectionInset.left;
  double bottom = self->m_selectionInset.bottom;
  double right = self->m_selectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSelectionInset:(UIEdgeInsets)a3
{
  self->m_selectionInset = a3;
}

- (BOOL)scrollsSelectionOnWebDocumentChanges
{
  return self->m_scrollsSelectionOnWebDocumentChanges;
}

- (void)setScrollsSelectionOnWebDocumentChanges:(BOOL)a3
{
  self->m_scrollsSelectionOnWebDocumentChanges = a3;
}

- (UITextContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  return (UITextContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDragInteractionEnabled
{
  return self->_dragInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_dropInteraction, 0);
  objc_storeStrong((id *)&self->m_dragInteraction, 0);
  objc_storeStrong((id *)&self->m_textColor, 0);
  objc_storeStrong((id *)&self->m_font, 0);
  objc_storeStrong((id *)&self->m_webView, 0);
  objc_storeStrong((id *)&self->m_interactionAssistant, 0);
  objc_storeStrong((id *)&self->m_body, 0);
  objc_storeStrong((id *)&self->m_frame, 0);
  objc_destroyWeak(&self->m_delegate);
}

@end