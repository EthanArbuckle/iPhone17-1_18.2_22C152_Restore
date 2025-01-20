@interface UIDynamicCaret
- (BOOL)hasCandidates;
- (BOOL)isActive;
- (BOOL)isDeleteCandidate:(id)a3;
- (BOOL)isExtendedList;
- (BOOL)isFloatingList;
- (BOOL)showCandidate:(id)a3;
- (TIKeyboardCandidateResultSet)candidateSet;
- (UIDynamicCaret)initWithFrame:(CGRect)a3;
- (_UIDynamicCaretAlternatives)alternativesView;
- (_UIDynamicCaretHelpLabel)helpLabel;
- (_UIDynamicCaretInput)inputView;
- (_UIDynamicCaretNoContentView)noContentView;
- (id)backgroundImage;
- (id)currentCandidate;
- (id)keyboardBehaviors;
- (id)statisticsIdentifier;
- (unint64_t)currentIndex;
- (unint64_t)selectedSortIndex;
- (void)alternativeTappedAtIndex:(int64_t)a3;
- (void)didMoveToSuperview;
- (void)displayAlternatives:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAlternativesView:(id)a3;
- (void)setCandidateSet:(id)a3;
- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7;
- (void)setDocumentHasContent:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHelpLabel:(id)a3;
- (void)setInputView:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setNoContentView:(id)a3;
- (void)setUIKeyboardCandidateListDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIDynamicCaret

- (UIDynamicCaret)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)UIDynamicCaret;
  v3 = -[UIImageView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setOpaque:0];
    [(UIView *)v4 setMultipleTouchEnabled:0];
    [(UIView *)v4 setUserInteractionEnabled:1];
    v4->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5 = [_UIDynamicCaretInput alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = -[_UIDynamicCaretInput initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [(UIDynamicCaret *)v4 setInputView:v10];

    v11 = -[_UIDynamicCaretAlternatives initWithFrame:]([_UIDynamicCaretAlternatives alloc], "initWithFrame:", v6, v7, v8, v9);
    [(UIDynamicCaret *)v4 setAlternativesView:v11];

    v12 = [[_UIDynamicCaretNoContentView alloc] initWithImage:0];
    [(UIDynamicCaret *)v4 setNoContentView:v12];

    v13 = [[_UIDynamicCaretHelpLabel alloc] initWithImage:0];
    [(UIDynamicCaret *)v4 setHelpLabel:v13];

    v14 = [(UIDynamicCaret *)v4 inputView];
    [(UIView *)v4 addSubview:v14];

    v15 = [(UIDynamicCaret *)v4 alternativesView];
    [(UIView *)v4 addSubview:v15];

    v16 = [(UIDynamicCaret *)v4 noContentView];
    [(UIView *)v4 addSubview:v16];

    v17 = [(UIDynamicCaret *)v4 helpLabel];
    [(UIView *)v4 addSubview:v17];

    [(UIDynamicCaret *)v4 displayAlternatives:0];
    v18 = [(UIDynamicCaret *)v4 noContentView];
    [v18 setAlpha:0.0];

    v19 = [(UIDynamicCaret *)v4 helpLabel];
    [v19 setAlpha:0.0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)UIDynamicCaret;
  [(UIImageView *)&v12 layoutSubviews];
  v3 = [(UIDynamicCaret *)self helpLabel];
  [v3 sizeToFit];

  v4 = [(UIDynamicCaret *)self helpLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  [(UIView *)self frame];
  double v10 = v9;
  v11 = [(UIDynamicCaret *)self helpLabel];
  objc_msgSend(v11, "setFrame:", 0.0, v10, v6, v8);
}

- (void)displayAlternatives:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIDynamicCaret *)self inputView];
  [v5 setHidden:v3];

  id v6 = [(UIDynamicCaret *)self alternativesView];
  [v6 setHidden:v3 ^ 1];
}

- (id)backgroundImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__UIDynamicCaret_backgroundImage__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (qword_1EB25D458 != -1) {
    dispatch_once(&qword_1EB25D458, block);
  }
  return (id)_MergedGlobals_11_14;
}

void __33__UIDynamicCaret_backgroundImage__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) contentScaleFactor];
  _UIGraphicsBeginImageContextWithOptions(0, 0, 80.0, 40.0, v1);
  v2 = +[UIColor colorWithWhite:0.07 alpha:1.0];
  [v2 set];

  BOOL v3 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, 0.0, 0.0, 80.0, 40.0, 20.0, 20.0);
  [v3 fill];

  _UIGraphicsGetImageFromCurrentImageContext(0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  uint64_t v4 = objc_msgSend(v6, "resizableImageWithCapInsets:", 39.0, 40.0, 0.0, 40.0);
  double v5 = (void *)_MergedGlobals_11_14;
  _MergedGlobals_11_14 = v4;
}

- (void)didMoveToSuperview
{
  BOOL v3 = [(UIView *)self window];

  if (v3)
  {
    [(UIDynamicCaret *)self setIsActive:1];
    uint64_t v4 = [(UIImageView *)self image];

    if (!v4)
    {
      id v5 = [(UIDynamicCaret *)self backgroundImage];
      [(UIImageView *)self setImage:v5];
    }
  }
}

- (BOOL)isActive
{
  v2 = UIKeyboardGetCurrentInputMode();
  char v3 = [v2 isEqualToString:@"intl_HWR"];

  return v3;
}

- (void)setIsActive:(BOOL)a3
{
  if (a3)
  {
    char v3 = +[UIWindow _applicationKeyWindow];
    id v6 = [v3 firstResponder];

    if ([v6 _requiresKeyboardWhenFirstResponder])
    {
      uint64_t v4 = +[UIKeyboardImpl sharedInstance];
      [v4 setDelegate:v6];
    }
    id v5 = +[UIKeyboardImpl sharedInstance];
    [v5 setInputMode:@"intl_HWR" userInitiated:0];
  }
}

- (void)setDocumentHasContent:(BOOL)a3
{
  if (a3) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  id v5 = [(UIDynamicCaret *)self noContentView];
  [v5 setAlpha:v4];

  id v6 = [(UIDynamicCaret *)self helpLabel];
  [v6 setAlpha:v4];
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIDynamicCaret;
  -[UIImageView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.height);
}

- (void)alternativeTappedAtIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
  [(UIKeyboardCandidateListDelegate *)self->_candidateListDelegate candidateListAcceptCandidate:self];
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(UIDynamicCaret *)self displayAlternatives:0];
  self->_justDeleted = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = (void *)UIApp;
  id v6 = a3;
  objc_msgSend(v5, "_disableTouchCoalescingWithCount:", objc_msgSend(v6, "count"));
  double v7 = [v6 anyObject];

  [v7 locationInView:self];
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [(UIDynamicCaret *)self inputView];
  LODWORD(v6) = [v12 isHidden];

  if (v6)
  {
    v13 = [(UIDynamicCaret *)self alternativesView];
    self->_selectedIndex = objc_msgSend(v13, "indexOfButtonForPoint:", v9, v11);

    v14 = [(UIDynamicCaret *)self alternativesView];
    [v14 highlightButtonAtIndex:self->_selectedIndex];
  }
  else
  {
    v14 = [(UIDynamicCaret *)self inputView];
    objc_msgSend(v14, "startTouchAtPoint:", v9, v11);
  }

  [(UIDynamicCaret *)self setDocumentHasContent:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v15 = [a3 anyObject];
  [v15 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(UIDynamicCaret *)self inputView];
  char v10 = [v9 isInking];

  if (v10)
  {
    double v11 = [(UIDynamicCaret *)self inputView];
    objc_msgSend(v11, "addTouchAtPoint:", v6, v8);
  }
  else
  {
    [v15 previousLocationInView:self];
    if (sqrt((v6 - v12) * (v6 - v12) + (v8 - v13) * (v8 - v13)) > 1.0)
    {
      self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
      v14 = [(UIDynamicCaret *)self inputView];
      objc_msgSend(v14, "startTouchAtPoint:", v6, v8);

      [(UIDynamicCaret *)self displayAlternatives:0];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (v6) {
    objc_msgSend((id)UIApp, "_enableTouchCoalescingWithCount:", objc_msgSend(v15, "count"));
  }
  double v7 = [v15 anyObject];
  [v7 locationInView:self];
  double v9 = v8;
  double v11 = v10;

  double v12 = [(UIDynamicCaret *)self inputView];
  char v13 = [v12 isInking];

  if (v13)
  {
    v14 = [(UIDynamicCaret *)self inputView];
    objc_msgSend(v14, "endTouchAtPoint:", v9, v11);
  }
  else
  {
    [(UIDynamicCaret *)self alternativeTappedAtIndex:self->_selectedIndex];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)isDeleteCandidate:(id)a3
{
  objc_super v3 = [a3 candidate];
  char v4 = [v3 isEqualToString:@"DELETE"];

  return v4;
}

- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7
{
  id v8 = a3;
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  double v9 = [(UIDynamicCaret *)self candidateSet];
  double v10 = [v9 candidates];
  double v11 = [v10 firstObject];
  double v12 = [v11 candidate];

  char v13 = [v8 candidates];
  v14 = [v13 firstObject];
  LODWORD(v11) = [(UIDynamicCaret *)self isDeleteCandidate:v14];

  if (v11)
  {
    if (self->_justDeleted)
    {
      [(UIDynamicCaret *)self setCandidateSet:0];
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1CA48] array];
      v16 = [(UIDynamicCaret *)self candidateSet];
      v17 = [v16 candidates];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__UIDynamicCaret_setCandidates_inlineText_inlineRect_maxX_layout___block_invoke;
      v20[3] = &unk_1E52FD570;
      id v18 = v15;
      id v21 = v18;
      [v17 enumerateObjectsUsingBlock:v20];

      v19 = [(UIDynamicCaret *)self alternativesView];
      [v19 setButtonLabels:v18];

      if ([v12 length]) {
        [(UIDynamicCaret *)self displayAlternatives:1];
      }
      self->_justDeleted = 1;
    }
  }
  else
  {
    [(UIDynamicCaret *)self setCandidateSet:v8];
    [(UIDynamicCaret *)self displayAlternatives:0];
    self->_justDeleted = 0;
  }
}

void __66__UIDynamicCaret_setCandidates_inlineText_inlineRect_maxX_layout___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  id v6 = *(void **)(a1 + 32);
  double v7 = [a2 candidate];
  [v6 addObject:v7];

  *a4 = a3 > 3;
}

- (void)setUIKeyboardCandidateListDelegate:(id)a3
{
}

- (BOOL)hasCandidates
{
  return self->_candidateSet != 0;
}

- (BOOL)isExtendedList
{
  return 0;
}

- (BOOL)isFloatingList
{
  return 0;
}

- (BOOL)showCandidate:(id)a3
{
  return 0;
}

- (id)currentCandidate
{
  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = 0;
  }
  else
  {
    char v4 = [(UIDynamicCaret *)self candidateSet];
    double v5 = [v4 candidates];
    id v6 = [v5 objectAtIndex:self->_selectedIndex];

    if ([(UIDynamicCaret *)self isDeleteCandidate:v6]) {
      id v2 = 0;
    }
    else {
      id v2 = v6;
    }
  }
  return v2;
}

- (unint64_t)currentIndex
{
  return self->_selectedIndex;
}

- (id)keyboardBehaviors
{
  return 0;
}

- (id)statisticsIdentifier
{
  return 0;
}

- (unint64_t)selectedSortIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (_UIDynamicCaretInput)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
}

- (_UIDynamicCaretAlternatives)alternativesView
{
  return self->_alternativesView;
}

- (void)setAlternativesView:(id)a3
{
}

- (_UIDynamicCaretNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
}

- (_UIDynamicCaretHelpLabel)helpLabel
{
  return self->_helpLabel;
}

- (void)setHelpLabel:(id)a3
{
}

- (TIKeyboardCandidateResultSet)candidateSet
{
  return self->_candidateSet;
}

- (void)setCandidateSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateSet, 0);
  objc_storeStrong((id *)&self->_helpLabel, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_alternativesView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_candidateListDelegate, 0);
}

@end