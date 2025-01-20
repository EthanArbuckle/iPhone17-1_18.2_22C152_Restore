@interface NoteContentLayer
- (BOOL)allowsAttachments;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canInsertImagesInNoteHTMLEditorView:(id)a3;
- (BOOL)canResignFirstResponder;
- (BOOL)contentContainsValuableContent;
- (BOOL)isEditable;
- (BOOL)isFirstResponder;
- (BOOL)isForPreview;
- (BOOL)isNoteHTMLEditorViewVisible:(id)a3;
- (BOOL)isNoteManagedForNoteHTMLEditorView:(id)a3;
- (BOOL)noteHTMLEditorView:(id)a3 acceptContentsFromPasteboard:(id)a4;
- (BOOL)noteHTMLEditorView:(id)a3 canAddAttachmentItemProviders:(id)a4;
- (BOOL)noteHTMLEditorViewShouldBeginEditing:(id)a3 isUserInitiated:(BOOL)a4;
- (BOOL)noteHTMLEditorViewShouldPaste:(id)a3;
- (BOOL)processMapAttachmentItemProvider:(id)a3;
- (BOOL)resignFirstResponder;
- (BOOL)shouldRenderAsAttachment:(id)a3;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)tracksMaximumContentLength;
- (BOOL)updatedTitleRange;
- (CGPoint)contentOffset;
- (CGRect)rectForDOMNode:(id)a3;
- (ICTextBackgroundView)backgroundView;
- (NSDate)timestampDate;
- (NSLayoutConstraint)backgroundHeightConstraint;
- (NSString)title;
- (NoteContentLayer)initWithFrame:(CGRect)a3;
- (NoteContentLayer)initWithFrame:(CGRect)a3 forPreview:(BOOL)a4;
- (NoteContentLayerAttachmentPresentationDelegate)attachmentPresentationDelegate;
- (NoteContentLayerDelegate)delegate;
- (NoteHTMLEditorView)noteHTMLEditorView;
- (UILabel)dateLabel;
- (id)contentAsPlainText:(BOOL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyCommands;
- (id)noteHTMLEditorView:(id)a3 attachmentPresentationForContentID:(id)a4;
- (id)noteHTMLEditorView:(id)a3 createAttachmentPresentationWithFileWrapper:(id)a4 mimeType:(id)a5;
- (id)noteHTMLEditorView:(id)a3 fileURLForAttachmentWithContentID:(id)a4;
- (id)noteHTMLEditorView:(id)a3 updateAttachments:(id)a4;
- (id)readerDelegateInNoteHTMLEditorView:(id)a3;
- (id)viewPrintFormatter;
- (id)webArchive;
- (void)chosenUTI:(id *)a3 andChosenMIMEType:(id *)a4 forItemProvider:(id)a5;
- (void)copyNoteHTMLToPasteboard;
- (void)createLayout;
- (void)dealloc;
- (void)flashScrollIndicators;
- (void)getRectForSelectionWithCompletion:(id)a3;
- (void)insertImageInNoteHTMLEditorView:(id)a3;
- (void)noteHTMLEditorView:(id)a3 addAttachmentItemProviders:(id)a4;
- (void)noteHTMLEditorView:(id)a3 didAddAttachmentForMimeType:(id)a4 filename:(id)a5 data:(id)a6;
- (void)noteHTMLEditorView:(id)a3 didInvokeFormattingCalloutOption:(int64_t)a4;
- (void)noteHTMLEditorView:(id)a3 didInvokeStyleFormattingOption:(int64_t)a4;
- (void)noteHTMLEditorView:(id)a3 openURL:(id)a4;
- (void)noteHTMLEditorView:(id)a3 showShareSheetForAttachment:(id)a4 atPoint:(CGPoint)a5;
- (void)noteHTMLEditorViewDidBeginEditing:(id)a3;
- (void)noteHTMLEditorViewDidChange:(id)a3;
- (void)noteHTMLEditorViewDidEndEditing:(id)a3;
- (void)noteHTMLEditorViewNeedsContentReload:(id)a3;
- (void)noteHTMLEditorViewWillChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)processAttachmentItemProviders:(id)a3;
- (void)registerForTraitChanges;
- (void)replaceSelectionWithAttachmentPresentation:(id)a3;
- (void)scrollSelectionToVisible:(BOOL)a3;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)setAllowsAttachments:(BOOL)a3;
- (void)setAttachmentPresentationDelegate:(id)a3;
- (void)setBackgroundHeightConstraint:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setContent:(id)a3 isPlainText:(BOOL)a4 attachments:(id)a5;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDateLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setNoteHTMLEditorView:(id)a3;
- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3;
- (void)setSelectionToStart;
- (void)setTimestampDate:(id)a3;
- (void)setTracksMaximumContentLength:(BOOL)a3;
- (void)setUpdatedTitleRange:(BOOL)a3;
- (void)updateContentInsets;
- (void)updateObscuredInsets;
@end

@implementation NoteContentLayer

- (NoteContentLayer)initWithFrame:(CGRect)a3 forPreview:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NoteContentLayer;
  v5 = -[NoteContentLayer initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_forPreview = a4;
    [(NoteContentLayer *)v5 setPreservesSuperviewLayoutMargins:1];
    [(NoteContentLayer *)v6 createLayout];
    v7 = [(NoteContentLayer *)v6 noteHTMLEditorView];
    v8 = [v7 webView];
    v9 = [v8 scrollView];
    objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", v6, @"contentSize", compoundliteral);

    [(NoteContentLayer *)v6 updateContentInsets];
  }
  return v6;
}

- (NoteContentLayer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [MEMORY[0x1E4FB1438] shouldMakeUIForDefaultPNG];
  return -[NoteContentLayer initWithFrame:forPreview:](self, "initWithFrame:forPreview:", v8, x, y, width, height);
}

- (void)dealloc
{
  v3 = [(NoteContentLayer *)self noteHTMLEditorView];
  v4 = [v3 webView];
  v5 = [v4 scrollView];
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, @"contentSize", compoundliteral);

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7 = [(NoteHTMLEditorView *)self->_noteHTMLEditorView webView];
  uint64_t v8 = [v7 scrollView];
  [v8 setDelegate:0];

  [(NoteHTMLEditorView *)self->_noteHTMLEditorView setDelegate:0];
  [(NoteHTMLEditorView *)self->_noteHTMLEditorView setActionDelegate:0];
  [(NoteHTMLEditorView *)self->_noteHTMLEditorView setLayoutDelegate:0];
  v9.receiver = self;
  v9.super_class = (Class)NoteContentLayer;
  [(NoteContentLayer *)&v9 dealloc];
}

- (void)createLayout
{
  v62[4] = *MEMORY[0x1E4F143B8];
  v3 = [(NoteContentLayer *)self noteHTMLEditorView];
  v4 = [v3 superview];

  if (!v4)
  {
    v5 = [(NoteContentLayer *)self noteHTMLEditorView];
    [(NoteContentLayer *)self addSubview:v5];

    v6 = [(NoteContentLayer *)self noteHTMLEditorView];
    objc_msgSend(v6, "ic_addConstraintsToFillSuperview");
  }
  BOOL v7 = [(NoteContentLayer *)self isForPreview];
  unint64_t v8 = 0x1E4FB1000;
  if (!v7)
  {
    objc_super v9 = [(NoteContentLayer *)self noteHTMLEditorView];
    v10 = [v9 webView];
    objc_super v11 = [v10 scrollView];
    v12 = [(NoteContentLayer *)self backgroundView];
    [v11 insertSubview:v12 atIndex:0];

    v13 = [(NoteContentLayer *)self noteHTMLEditorView];
    v14 = [v13 webView];
    v15 = [v14 scrollView];
    v16 = [(NoteContentLayer *)self dateLabel];
    [v15 addSubview:v16];

    v59 = [(NoteContentLayer *)self backgroundView];
    v53 = [v59 leadingAnchor];
    v57 = [(NoteContentLayer *)self noteHTMLEditorView];
    v55 = [v57 webView];
    v51 = [v55 scrollView];
    v49 = [v51 leadingAnchor];
    v48 = [v53 constraintEqualToAnchor:v49];
    v62[0] = v48;
    v47 = [(NoteContentLayer *)self backgroundView];
    v44 = [v47 topAnchor];
    v46 = [(NoteContentLayer *)self noteHTMLEditorView];
    v45 = [v46 webView];
    v43 = [v45 scrollView];
    v42 = [v43 topAnchor];
    v41 = [v44 constraintEqualToAnchor:v42];
    v62[1] = v41;
    v40 = [(NoteContentLayer *)self backgroundView];
    v17 = [v40 widthAnchor];
    v18 = [(NoteContentLayer *)self noteHTMLEditorView];
    v19 = [v18 webView];
    v20 = [v19 scrollView];
    v21 = [v20 widthAnchor];
    v22 = [v17 constraintEqualToAnchor:v21];
    v62[2] = v22;
    v23 = [(NoteContentLayer *)self backgroundView];
    v24 = [v23 heightAnchor];
    [(NoteContentLayer *)self bounds];
    v26 = [v24 constraintEqualToConstant:v25 + v25];
    backgroundHeightConstraint = self->_backgroundHeightConstraint;
    self->_backgroundHeightConstraint = v26;

    v62[3] = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    [(NoteContentLayer *)self addConstraints:v28];

    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v29 = 12.0;
    }
    else {
      double v29 = 0.0;
    }
    v60 = [(NoteContentLayer *)self dateLabel];
    v54 = [v60 centerXAnchor];
    v58 = [(NoteContentLayer *)self noteHTMLEditorView];
    v56 = [v58 webView];
    v52 = [v56 scrollView];
    v50 = [v52 centerXAnchor];
    v30 = [v54 constraintEqualToAnchor:v50];
    v61[0] = v30;
    v31 = [(NoteContentLayer *)self dateLabel];
    v32 = [v31 firstBaselineAnchor];
    v33 = [(NoteContentLayer *)self noteHTMLEditorView];
    v34 = [v33 webView];
    v35 = [v34 scrollView];
    v36 = [v35 topAnchor];
    v37 = [v32 constraintEqualToAnchor:v36 constant:v29];
    v61[1] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    [(NoteContentLayer *)self addConstraints:v38];

    unint64_t v8 = 0x1E4FB1000uLL;
  }
  if (objc_msgSend(*(id *)(v8 + 1736), "ic_isVision"))
  {
    v39 = objc_msgSend(MEMORY[0x1E4FB1618], "ic_noteEditorBackgroundColor");
    [(NoteContentLayer *)self setBackgroundColor:v39];
  }
}

- (void)updateContentInsets
{
  v3 = [(NoteContentLayer *)self noteHTMLEditorView];
  v4 = [v3 webView];
  v5 = [v4 scrollView];
  [v5 contentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(NoteContentLayer *)self dateLabel];
  v13 = [v12 font];
  [v13 lineHeight];
  double v15 = v14;

  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    double v15 = v15 + 12.0;
  }
  id v18 = [(NoteContentLayer *)self noteHTMLEditorView];
  v16 = [v18 webView];
  v17 = [v16 scrollView];
  objc_msgSend(v17, "setContentInset:", v15, v7, v9, v11);
}

- (void)updateObscuredInsets
{
  [(NoteContentLayer *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v12 = [(NoteContentLayer *)self noteHTMLEditorView];
  double v11 = [v12 webView];
  objc_msgSend(v11, "_setObscuredInsets:", v4, v6, v8, v10);
}

- (NoteHTMLEditorView)noteHTMLEditorView
{
  noteHTMLEditorView = self->_noteHTMLEditorView;
  if (!noteHTMLEditorView)
  {
    double v4 = objc_alloc_init(NoteHTMLEditorView);
    double v5 = self->_noteHTMLEditorView;
    self->_noteHTMLEditorView = v4;

    [(NoteHTMLEditorView *)self->_noteHTMLEditorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NoteHTMLEditorView *)self->_noteHTMLEditorView setEditable:0];
    [(NoteHTMLEditorView *)self->_noteHTMLEditorView setDelegate:self];
    [(NoteHTMLEditorView *)self->_noteHTMLEditorView setActionDelegate:self];
    [(NoteHTMLEditorView *)self->_noteHTMLEditorView setLayoutDelegate:self];
    double v6 = [(NoteHTMLEditorView *)self->_noteHTMLEditorView webView];
    double v7 = [v6 scrollView];
    [v7 setAlwaysBounceVertical:1];

    noteHTMLEditorView = self->_noteHTMLEditorView;
  }
  return noteHTMLEditorView;
}

- (ICTextBackgroundView)backgroundView
{
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    double v4 = objc_alloc_init(ICTextBackgroundView);
    double v5 = self->_backgroundView;
    self->_backgroundView = v4;

    [(ICTextBackgroundView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICTextBackgroundView *)self->_backgroundView setBackgroundColor:0];
    backgroundView = self->_backgroundView;
  }
  return backgroundView;
}

- (UILabel)dateLabel
{
  dateLabel = self->_dateLabel;
  if (!dateLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v5 = self->_dateLabel;
    self->_dateLabel = v4;

    [(UILabel *)self->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [(NoteContentLayer *)self timestampDate];
    double v7 = [v6 userFriendlyStringWithTime];
    [(UILabel *)self->_dateLabel setText:v7];

    double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "ic_noteEditorSecondaryLabelColor");
    [(UILabel *)self->_dateLabel setTextColor:v8];

    double v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)self->_dateLabel setFont:v9];

    [(UILabel *)self->_dateLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_dateLabel _accessibilitySetIsSpeakThisElement:0];
    dateLabel = self->_dateLabel;
  }
  return dateLabel;
}

- (void)setTimestampDate:(id)a3
{
  objc_storeStrong((id *)&self->_timestampDate, a3);
  id v6 = [(NoteContentLayer *)self timestampDate];
  double v4 = [v6 userFriendlyStringWithTime];
  double v5 = [(NoteContentLayer *)self dateLabel];
  [v5 setText:v4];
}

- (void)setContent:(id)a3 isPlainText:(BOOL)a4 attachments:(id)a5
{
  BOOL v5 = a4;
  id v11 = a5;
  id v8 = a3;
  double v9 = [(NoteContentLayer *)self noteHTMLEditorView];
  double v10 = v9;
  if (v5) {
    [v9 setText:v8];
  }
  else {
    [v9 setHtmlString:v8 attachments:v11];
  }
}

- (BOOL)isEditable
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  char v3 = [v2 isEditable];

  return v3;
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NoteContentLayer *)self noteHTMLEditorView];
  [v4 setEditable:v3];
}

- (id)contentAsPlainText:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NoteContentLayer *)self contentContainsValuableContent])
  {
    BOOL v5 = [(NoteContentLayer *)self noteHTMLEditorView];
    id v6 = v5;
    if (v3) {
      [v5 text];
    }
    else {
    double v7 = [v5 htmlString];
    }
  }
  else
  {
    double v7 = &stru_1F0973378;
  }
  return v7;
}

- (NSString)title
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  BOOL v3 = [v2 title];

  return (NSString *)v3;
}

- (BOOL)contentContainsValuableContent
{
  BOOL v3 = [(NoteContentLayer *)self noteHTMLEditorView];
  id v4 = [v3 title];
  if ([v4 length])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(NoteContentLayer *)self noteHTMLEditorView];
    char v5 = [v6 hasAttachments];
  }
  return v5;
}

- (void)flashScrollIndicators
{
  id v4 = [(NoteContentLayer *)self noteHTMLEditorView];
  v2 = [v4 webView];
  BOOL v3 = [v2 scrollView];
  [v3 flashScrollIndicators];
}

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = [(NoteContentLayer *)self noteHTMLEditorView];
  double v7 = [v9 webView];
  id v8 = [v7 scrollView];
  objc_msgSend(v8, "setScrollIndicatorInsets:", top, left, bottom, right);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(NoteContentLayer *)self delegate];
  [v8 noteContentLayer:self willHitTestWithEvent:v7];

  v11.receiver = self;
  v11.super_class = (Class)NoteContentLayer;
  id v9 = -[NoteContentLayer hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (BOOL)isFirstResponder
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (CGPoint)contentOffset
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  char v3 = [v2 webView];
  id v4 = [v3 scrollView];
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(NoteContentLayer *)self noteHTMLEditorView];
  double v7 = [v6 webView];
  double v8 = [v7 scrollView];
  [v8 layoutIfNeeded];

  id v11 = [(NoteContentLayer *)self noteHTMLEditorView];
  double v9 = [v11 webView];
  double v10 = [v9 scrollView];
  objc_msgSend(v10, "setContentOffset:", x, y);
}

- (void)getRectForSelectionWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(NoteContentLayer *)self noteHTMLEditorView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__NoteContentLayer_getRectForSelectionWithCompletion___block_invoke;
  v7[3] = &unk_1E5FDACB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getRectForSelectionWithCompletion:v7];
}

void __54__NoteContentLayer_getRectForSelectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  performBlockOnMainThread();
}

uint64_t __54__NoteContentLayer_getRectForSelectionWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 noteHTMLEditorView];
  objc_msgSend(v2, "convertRect:fromView:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  unint64_t v5 = v4;
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  unint64_t v11 = v10;

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v17 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(result + 16);
    v12.n128_u64[0] = v5;
    v13.n128_u64[0] = v7;
    v14.n128_u64[0] = v9;
    v15.n128_u64[0] = v11;
    return v17(v12, v13, v14, v15);
  }
  return result;
}

- (CGRect)rectForDOMNode:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)replaceSelectionWithAttachmentPresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteContentLayer *)self noteHTMLEditorView];
  [v5 replaceSelectionWithAttachmentPresentation:v4];
}

- (id)webArchive
{
  v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  double v3 = [v2 webArchive];

  return v3;
}

- (void)copyNoteHTMLToPasteboard
{
  id v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  [v2 copyNoteHTMLToPasteboard];
}

- (id)viewPrintFormatter
{
  id v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  double v3 = [v2 viewPrintFormatter];

  return v3;
}

- (void)setSelectionToStart
{
  id v2 = [(NoteContentLayer *)self noteHTMLEditorView];
  [v2 setSelectionToStart];
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(NoteContentLayer *)self noteHTMLEditorView];
  id v4 = [v6 webView];
  id v5 = [v4 scrollView];
  objc_msgSend(v5, "scrollRectToVisible:animated:", v3, 0.0, 0.0, 1.0, 1.0);
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NoteContentLayer *)self noteHTMLEditorView];
  [v4 scrollSelectionToVisible:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(NoteContentLayer *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/iOS/EmbeddedMobileNotes/NoteContentLayer.m"])
  {
    char v13 = [(NoteContentLayer *)self ic_shouldIgnoreObserveValue:v12 ofObject:v11 forKeyPath:v10];

    if (a6 == compoundliteral && (v13 & 1) == 0)
    {
      __n128 v14 = [(NoteContentLayer *)self noteHTMLEditorView];
      __n128 v15 = [v14 webView];
      id v16 = [v15 scrollView];
      if (v16 == v11)
      {
        int v17 = [v10 isEqualToString:@"contentSize"];

        if (v17)
        {
          id v18 = [(NoteContentLayer *)self noteHTMLEditorView];
          v19 = [v18 webView];
          v20 = [v19 scrollView];
          [v20 contentSize];
          double v22 = v21;

          v23 = [(NoteContentLayer *)self noteHTMLEditorView];
          v24 = [v23 webView];
          double v25 = [v24 scrollView];
          [v25 bounds];
          double v27 = v26;

          if (v22 < v27) {
            double v22 = v27;
          }
          [(NoteContentLayer *)self bounds];
          double v29 = v22 + v28;
          v30 = [(NoteContentLayer *)self backgroundHeightConstraint];
          [v30 setConstant:v29];
        }
      }
      else
      {
      }
    }
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)NoteContentLayer;
    [(NoteContentLayer *)&v31 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)registerForTraitChanges
{
  objc_msgSend(MEMORY[0x1E4FB1E20], "ic_traitsAffectingSize");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[(NoteContentLayer *)self registerForTraitChanges:v4 withAction:sel_updateContentInsets];
}

- (id)keyCommands
{
  id v3 = [(NoteContentLayer *)self noteHTMLEditorView];
  int v4 = [v3 isEditing];

  if (v4)
  {
    if (keyCommands_predicate != -1) {
      dispatch_once(&keyCommands_predicate, &__block_literal_global_28);
    }
    id v5 = (void *)keyCommands_keyCommands;
    v9.receiver = self;
    v9.super_class = (Class)NoteContentLayer;
    id v6 = [(NoteContentLayer *)&v9 keyCommands];
    unint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

void __31__NoteContentLayer_keyCommands__block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB18D0];
  v1 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Bold" value:@"Bold" table:0 allowSiri:1];
  id v2 = objc_msgSend(v0, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"b", 0x100000, sel_toggleBoldface_, v1);
  id v3 = (void *)MEMORY[0x1E4FB18D0];
  int v4 = objc_msgSend(MEMORY[0x1E4F83770], "localizedFrameworkStringForKey:value:table:allowSiri:", @"Italics", @"Italics", 0, 1, v2);
  id v5 = objc_msgSend(v3, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"i", 0x100000, sel_toggleItalics_, v4);
  v11[1] = v5;
  id v6 = (void *)MEMORY[0x1E4FB18D0];
  unint64_t v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Underline" value:@"Underline" table:0 allowSiri:1];
  unint64_t v8 = objc_msgSend(v6, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", @"u", 0x100000, sel_toggleUnderline_, v7);
  v11[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  id v10 = (void *)keyCommands_keyCommands;
  keyCommands_keyCommands = v9;
}

- (BOOL)noteHTMLEditorView:(id)a3 canAddAttachmentItemProviders:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v45;
    uint64_t v36 = *MEMORY[0x1E4F443F0];
    uint64_t v37 = *MEMORY[0x1E4F444F0];
    uint64_t v34 = *MEMORY[0x1E4F444A8];
    unint64_t v9 = 0x1E4F44000uLL;
LABEL_3:
    uint64_t v10 = 0;
    uint64_t v35 = v7;
    while (1)
    {
      if (*(void *)v45 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * v10);
      id v43 = 0;
      [(NoteContentLayer *)self chosenUTI:&v43 andChosenMIMEType:0 forItemProvider:v11];
      id v12 = v43;
      if (!v12) {
        break;
      }
      char v13 = [*(id *)(v9 + 728) typeWithIdentifier:v12];
      if (([v13 conformsToType:v36] & 1) != 0
        || [(NoteContentLayer *)self shouldRenderAsAttachment:v11])
      {

        goto LABEL_20;
      }
      __n128 v14 = [*(id *)(v9 + 728) typeWithIdentifier:v12];
      if ([v14 conformsToType:v37])
      {
      }
      else
      {
        uint64_t v15 = v8;
        unint64_t v16 = v9;
        id v17 = v5;
        unint64_t v18 = v16;
        v19 = [*(id *)(v16 + 728) typeWithIdentifier:v12];
        if ([v19 conformsToType:v34]) {
          BOOL v20 = [(NoteContentLayer *)self allowsAttachments];
        }
        else {
          BOOL v20 = 0;
        }

        id v5 = v17;
        unint64_t v9 = v18;
        uint64_t v8 = v15;
        uint64_t v7 = v35;
        if (!v20) {
          goto LABEL_20;
        }
      }

      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    [(NoteContentLayer *)self shouldRenderAsAttachment:v11];
LABEL_20:

    if ([(NoteContentLayer *)self allowsAttachments])
    {
      BOOL v21 = 1;
      goto LABEL_37;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v22 = v5;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      unint64_t v25 = v9;
      uint64_t v26 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v38 = 0;
          [(NoteContentLayer *)self chosenUTI:&v38 andChosenMIMEType:0 forItemProvider:v28];
          id v29 = v38;
          if (!v29) {
            goto LABEL_34;
          }
          v30 = [*(id *)(v25 + 728) typeWithIdentifier:v29];
          if (([v30 conformsToType:v37] & 1) == 0)
          {

LABEL_34:
            v32 = [(NoteContentLayer *)self delegate];
            [v32 showAttachmentsUnsupportedAlertForNoteContentLayer:self];

            goto LABEL_35;
          }
          BOOL v31 = [(NoteContentLayer *)self shouldRenderAsAttachment:v28];

          if (v31) {
            goto LABEL_34;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v48 count:16];
        BOOL v21 = 1;
        if (v24) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_35:
      BOOL v21 = 1;
    }
  }
  else
  {
LABEL_17:
    BOOL v21 = 0;
  }

LABEL_37:
  return v21;
}

- (void)noteHTMLEditorView:(id)a3 addAttachmentItemProviders:(id)a4
{
}

- (id)noteHTMLEditorView:(id)a3 createAttachmentPresentationWithFileWrapper:(id)a4 mimeType:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unint64_t v9 = [(NoteContentLayer *)self delegate];
  uint64_t v10 = [v8 regularFileContents];
  uint64_t v11 = [v8 preferredFilename];

  id v12 = [v9 noteContentLayer:self createAttachmentPresentationWithData:v10 mimeType:v7 filename:v11];

  return v12;
}

- (void)noteHTMLEditorView:(id)a3 didAddAttachmentForMimeType:(id)a4 filename:(id)a5 data:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(NoteContentLayer *)self delegate];
  [v12 noteContentLayer:self didAddAttachmentForMimeType:v11 filename:v10 data:v9];
}

- (BOOL)noteHTMLEditorViewShouldBeginEditing:(id)a3 isUserInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  [(NoteContentLayer *)self setNeedsLayout];
  uint64_t v6 = [(NoteContentLayer *)self delegate];
  if (v6)
  {
    id v7 = [(NoteContentLayer *)self delegate];
    char v8 = [v7 noteContentLayerShouldBeginEditing:self isUserInitiated:v4];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)noteHTMLEditorViewDidChange:(id)a3
{
  id v4 = [(NoteContentLayer *)self delegate];
  [v4 noteContentLayerContentDidChange:self updatedTitle:1 fromDrop:0];
}

- (void)noteHTMLEditorViewWillChange:(id)a3
{
  id v4 = [(NoteContentLayer *)self delegate];
  [v4 noteContentLayerContentWillChange:self];
}

- (void)noteHTMLEditorViewDidBeginEditing:(id)a3
{
  id v4 = [(NoteContentLayer *)self delegate];
  [v4 noteContentLayer:self setEditing:1 animated:1];
}

- (void)noteHTMLEditorViewDidEndEditing:(id)a3
{
  id v4 = [(NoteContentLayer *)self delegate];
  [v4 noteContentLayer:self setEditing:0 animated:1];

  [(NoteContentLayer *)self setNeedsLayout];
}

- (void)noteHTMLEditorView:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteContentLayer *)self delegate];
  [v6 noteContentLayer:self openURL:v5];
}

- (id)noteHTMLEditorView:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteContentLayer *)self attachmentPresentationDelegate];
  id v7 = [v6 noteContentLayer:self fileURLForAttachmentWithContentID:v5];

  return v7;
}

- (id)noteHTMLEditorView:(id)a3 attachmentPresentationForContentID:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteContentLayer *)self attachmentPresentationDelegate];
  id v7 = [v6 noteContentLayer:self attachmentPresentationForContentID:v5];

  return v7;
}

- (BOOL)isNoteManagedForNoteHTMLEditorView:(id)a3
{
  id v3 = self;
  id v4 = [(NoteContentLayer *)self delegate];
  LOBYTE(v3) = [v4 isNoteManagedForNoteContentLayer:v3];

  return (char)v3;
}

- (void)noteHTMLEditorView:(id)a3 didInvokeFormattingCalloutOption:(int64_t)a4
{
  id v6 = [(NoteContentLayer *)self delegate];
  [v6 noteContentLayer:self didInvokeFormattingCalloutOption:a4];
}

- (void)noteHTMLEditorView:(id)a3 didInvokeStyleFormattingOption:(int64_t)a4
{
  id v6 = [(NoteContentLayer *)self delegate];
  [v6 noteContentLayer:self didInvokeStyleFormattingOption:a4];
}

- (id)noteHTMLEditorView:(id)a3 updateAttachments:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteContentLayer *)self delegate];
  id v7 = [v6 noteContentLayer:self updateAttachments:v5];

  return v7;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  [(NoteContentLayer *)self setUpdatedTitleRange:location <= *MEMORY[0x1E4F82D48]];
  if ([(NoteContentLayer *)self tracksMaximumContentLength]
    && [v8 length] > length)
  {
    id v9 = [v8 substringFromIndex:length];
    id v10 = [(NoteContentLayer *)self delegate];
    char v11 = [v10 noteContentLayer:self acceptStringIncreasingContentLength:v9];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)canInsertImagesInNoteHTMLEditorView:(id)a3
{
  id v3 = self;
  id v4 = [(NoteContentLayer *)self delegate];
  LOBYTE(v3) = [v4 canInsertImagesInNoteContentLayer:v3];

  return (char)v3;
}

- (void)insertImageInNoteHTMLEditorView:(id)a3
{
  id v4 = [(NoteContentLayer *)self delegate];
  [v4 insertImageInNoteContentLayer:self];
}

- (void)noteHTMLEditorViewNeedsContentReload:(id)a3
{
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  dateLabel = self->_dateLabel;
  self->_dateLabel = 0;

  [(NoteContentLayer *)self createLayout];
  id v6 = [(NoteContentLayer *)self noteHTMLEditorView];
  [v6 setNeedsDisplay];

  [(NoteContentLayer *)self setNeedsLayout];
  id v7 = [(NoteContentLayer *)self delegate];
  [v7 noteContentLayerNeedsContentReload:self];
}

- (BOOL)noteHTMLEditorView:(id)a3 acceptContentsFromPasteboard:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteContentLayer *)self delegate];
  LOBYTE(self) = [v6 noteContentLayer:self acceptContentsFromPasteboard:v5];

  return (char)self;
}

- (id)readerDelegateInNoteHTMLEditorView:(id)a3
{
  id v4 = [(NoteContentLayer *)self delegate];
  id v5 = [v4 readerDelegateForNoteContentLayer:self];

  return v5;
}

- (BOOL)shouldRenderAsAttachment:(id)a3
{
  id v3 = (void *)*MEMORY[0x1E4F444F0];
  id v4 = a3;
  id v5 = [v3 identifier];
  char v6 = [v4 hasItemConformingToTypeIdentifier:v5];

  uint64_t v7 = [v4 preferredPresentationStyle];
  if (v7 == 2) {
    return 1;
  }
  else {
    return v6 ^ 1;
  }
}

- (void)noteHTMLEditorView:(id)a3 showShareSheetForAttachment:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  id v9 = [(NoteContentLayer *)self delegate];
  objc_msgSend(v9, "noteContentLayer:showShareSheetForAttachment:atPoint:", self, v8, x, y);
}

- (BOOL)noteHTMLEditorViewShouldPaste:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4FB1A78], "generalPasteboard", a3);
  id v5 = [v4 itemProviders];

  char v6 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (-[NoteContentLayer shouldRenderAsAttachment:](self, "shouldRenderAsAttachment:", v12, (void)v17)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    if ([(NoteContentLayer *)self allowsAttachments])
    {
      [(NoteContentLayer *)self processAttachmentItemProviders:v6];
      uint64_t v13 = [v6 count];
      BOOL v14 = v13 != [v7 count];
    }
    else
    {
      uint64_t v15 = [(NoteContentLayer *)self delegate];
      [v15 showAttachmentsUnsupportedAlertForNoteContentLayer:self];

      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)isNoteHTMLEditorViewVisible:(id)a3
{
  id v3 = self;
  id v4 = [(NoteContentLayer *)self delegate];
  LOBYTE(v3) = [v4 isNoteContentLayerVisible:v3];

  return (char)v3;
}

- (void)chosenUTI:(id *)a3 andChosenMIMEType:(id *)a4 forItemProvider:(id)a5
{
  double v27 = a3;
  uint64_t v28 = a4;
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  char v6 = [(id)*MEMORY[0x1E4F444A8] identifier];
  v36[0] = v6;
  id v7 = [(id)*MEMORY[0x1E4F443F0] identifier];
  v36[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v10 = [v5 registeredTypeIdentifiers];
  char v11 = [v9 arrayWithArray:v10];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__NoteContentLayer_chosenUTI_andChosenMIMEType_forItemProvider___block_invoke;
  v33[3] = &unk_1E5FDACE0;
  id v12 = v8;
  id v34 = v12;
  [v11 sortUsingComparator:v33];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(v13);
      }
      long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
      long long v19 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", v18, v27, v28, (void)v29);
      long long v20 = [v19 preferredMIMEType];

      if (v20) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v23 = v18;

    uint64_t v22 = v27;
    BOOL v21 = v28;
    if (v23) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_9:

    long long v20 = 0;
    uint64_t v22 = v27;
    BOOL v21 = v28;
  }
  uint64_t v24 = objc_msgSend(v13, "firstObject", v27, v28);
  int v25 = [v12 containsObject:v24];

  if (v25)
  {
    id v23 = [v13 firstObject];
LABEL_13:
    if (v22) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v26 = [v5 registeredTypeIdentifiers];
    id v23 = [v26 firstObject];

    if (v22) {
LABEL_14:
    }
      id *v22 = v23;
  }
  if (v21) {
    id *v21 = v20;
  }
}

uint64_t __64__NoteContentLayer_chosenUTI_andChosenMIMEType_forItemProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  char v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  uint64_t v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  char v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (void)processAttachmentItemProviders:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    uint64_t v7 = *MEMORY[0x1E4F83590];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = [v9 registeredTypeIdentifiers];
        int v11 = [v10 containsObject:v7];

        if (!v11
          || ![(NoteContentLayer *)self processMapAttachmentItemProvider:v9])
        {
          id v24 = 0;
          id v25 = 0;
          [(NoteContentLayer *)self chosenUTI:&v25 andChosenMIMEType:&v24 forItemProvider:v9];
          id v12 = v25;
          id v13 = v24;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __51__NoteContentLayer_processAttachmentItemProviders___block_invoke;
          v18[3] = &unk_1E5FDAD30;
          objc_copyWeak(&v23, &location);
          id v14 = v12;
          id v19 = v14;
          long long v20 = self;
          BOOL v21 = v9;
          id v15 = v13;
          id v22 = v15;
          id v16 = (id)[v9 loadDataRepresentationForTypeIdentifier:v14 completionHandler:v18];

          objc_destroyWeak(&v23);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

void __51__NoteContentLayer_processAttachmentItemProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v6)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_68;
    v9[3] = &unk_1E5FDAD08;
    uint64_t v10 = *(id *)(a1 + 32);
    long long v11 = *(_OWORD *)(a1 + 40);
    id v12 = v5;
    id v13 = WeakRetained;
    id v14 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], v9);

    uint64_t v8 = v10;
  }
}

void __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_68(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    if ([v2 isEqual:*MEMORY[0x1E4F443F0]])
    {
      char v3 = [*(id *)(a1 + 40) shouldRenderAsAttachment:*(void *)(a1 + 48)];

      if ((v3 & 1) == 0)
      {
        id v8 = (id)[[NSString alloc] initWithData:*(void *)(a1 + 56) encoding:4];
        id v4 = [*(id *)(a1 + 40) noteHTMLEditorView];
        [v4 insertHTMLString:v8];
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  if (![*(id *)(a1 + 40) allowsAttachments]) {
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 48) suggestedName];
  id v8 = (id)v5;
  if (*(void *)(a1 + 32) && !v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    uint64_t v7 = [v6 preferredFilenameExtension];

    id v8 = [NSString localizedStringWithFormat:@"untitled.%@", v7];
  }
  id v4 = [*(id *)(a1 + 64) delegate];
  [v4 noteContentLayer:*(void *)(a1 + 40) didAddAttachmentForMimeType:*(void *)(a1 + 72) filename:v8 data:*(void *)(a1 + 56)];
LABEL_11:
}

- (BOOL)processMapAttachmentItemProvider:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__24;
  uint64_t v35 = __Block_byref_object_dispose__24;
  id v36 = 0;
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v6 = objc_opt_class();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke;
  v28[3] = &unk_1E5FDAD58;
  long long v30 = &v31;
  uint64_t v7 = v5;
  long long v29 = v7;
  id v8 = (id)[v4 loadObjectOfClass:v6 completionHandler:v28];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__24;
  long long v26 = __Block_byref_object_dispose__24;
  id v27 = 0;
  dispatch_group_enter(v7);
  uint64_t v9 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_2;
  v19[3] = &unk_1E5FDAD58;
  BOOL v21 = &v22;
  uint64_t v10 = v7;
  long long v20 = v10;
  id v11 = (id)[v4 loadObjectOfClass:v9 completionHandler:v19];
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = [(id)v23[5] absoluteString];
  id v13 = v12;
  if (!v12 || ![v12 length])
  {
    BOOL v16 = 0;
    goto LABEL_9;
  }
  id v14 = v32;
  id v15 = v32[5];
  if (!v15) {
    goto LABEL_6;
  }
  if (![v15 length])
  {
    id v14 = v32;
LABEL_6:
    objc_storeStrong(v14 + 5, v13);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_3;
  block[3] = &unk_1E5FDAD80;
  block[4] = self;
  block[5] = &v22;
  block[6] = &v31;
  dispatch_async(MEMORY[0x1E4F14428], block);
  BOOL v16 = 1;
LABEL_9:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__NoteContentLayer_processMapAttachmentItemProvider___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) noteHTMLEditorView];
  [v2 insertLinkWithURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) title:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (NoteContentLayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NoteContentLayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NoteContentLayerAttachmentPresentationDelegate)attachmentPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentPresentationDelegate);
  return (NoteContentLayerAttachmentPresentationDelegate *)WeakRetained;
}

- (void)setAttachmentPresentationDelegate:(id)a3
{
}

- (NSDate)timestampDate
{
  return self->_timestampDate;
}

- (BOOL)tracksMaximumContentLength
{
  return self->_tracksMaximumContentLength;
}

- (void)setTracksMaximumContentLength:(BOOL)a3
{
  self->_tracksMaximumContentLength = a3;
}

- (void)setNoteHTMLEditorView:(id)a3
{
}

- (BOOL)allowsAttachments
{
  return self->_allowsAttachments;
}

- (void)setAllowsAttachments:(BOOL)a3
{
  self->_allowsAttachments = a3;
}

- (BOOL)isForPreview
{
  return self->_forPreview;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSLayoutConstraint)backgroundHeightConstraint
{
  return self->_backgroundHeightConstraint;
}

- (void)setBackgroundHeightConstraint:(id)a3
{
}

- (void)setDateLabel:(id)a3
{
}

- (BOOL)updatedTitleRange
{
  return self->_updatedTitleRange;
}

- (void)setUpdatedTitleRange:(BOOL)a3
{
  self->_updatedTitleRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_noteHTMLEditorView, 0);
  objc_storeStrong((id *)&self->_timestampDate, 0);
  objc_destroyWeak((id *)&self->_attachmentPresentationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__NoteContentLayer_processAttachmentItemProviders___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Error loading data for pasted attachment (%@) : uti %@", (uint8_t *)&v4, 0x16u);
}

@end