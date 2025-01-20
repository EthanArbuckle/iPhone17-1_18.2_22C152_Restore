@interface _UITextChoiceAccelerationBubble
- (BKSHIDEventAuthenticationMessage)authenticationMessage;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isDismissing;
- (BOOL)needsRTLCheck;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)promptWillCollideWithKeyboard:(CGRect)a3;
- (BOOL)shouldRejectCandidate;
- (BOOL)showingAutocorrectHighlight;
- (BOOL)usingRTLInputMode;
- (CAShapeLayer)backgroundMaskLayer;
- (CGRect)referenceRect;
- (NSArray)aboveTextConstraints;
- (NSArray)belowTextConstraints;
- (NSArray)boundaryConstraints;
- (NSArray)buttonConstraints;
- (NSLayoutConstraint)anchorHeight;
- (NSLayoutConstraint)anchorLeading;
- (NSLayoutConstraint)anchorTop;
- (NSLayoutConstraint)anchorWidth;
- (NSLayoutConstraint)leadingSpacing;
- (NSString)selectedChoice;
- (TIKeyboardCandidate)candidate;
- (TIKeyboardCandidate)selectedCandidateChoice;
- (UIColor)optionalTintColor;
- (UIDictationGlowEffect)dictationGlowEffect;
- (UILayoutGuide)textAnchor;
- (UIScrollView)backingScrollView;
- (UIStackView)contentsView;
- (UIView)parentView;
- (UIView)textHighlightView;
- (UIVisualEffectView)backgroundView;
- (_NSRange)deltaRange;
- (_NSRange)originalSelectedRange;
- (_UIReplacementCandidate)replacement;
- (_UITextChoiceAccelerationBubble)init;
- (_UITextChoiceAccelerationBubble)initWithFrame:(CGRect)a3;
- (_UITextOption)sideButton;
- (double)secureCandidateHeight;
- (id)backgroundImageView;
- (id)bubblePathInRect:(CGRect)a3;
- (id)dictationHighlightViewForPoint:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)optionForPoint:(CGPoint)a3 withEvent:(id)a4;
- (id)squaredOffBubblePathInRect:(CGRect)a3;
- (id)textOptionWithText:(id)a3 type:(int64_t)a4;
- (int)textEffectsVisibilityLevel;
- (int)textEffectsVisibilityLevelInKeyboardWindow;
- (int64_t)buttonType;
- (int64_t)promptStyle;
- (unint64_t)labelNumber;
- (void)anchorToTextIfNeeded;
- (void)dismissWithCancel;
- (void)dismissWithCandidate:(id)a3;
- (void)dismissWithRevert:(id)a3;
- (void)dismissWithText:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)hideForNow;
- (void)inputModeDidChange:(id)a3;
- (void)layoutSubviews;
- (void)removeAnimated:(BOOL)a3;
- (void)removeFromSuperview;
- (void)reset;
- (void)setAboveTextConstraints:(id)a3;
- (void)setAnchorHeight:(id)a3;
- (void)setAnchorLeading:(id)a3;
- (void)setAnchorTop:(id)a3;
- (void)setAnchorWidth:(id)a3;
- (void)setAuthenticationMessage:(id)a3;
- (void)setBackgroundMaskLayer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackingScrollView:(id)a3;
- (void)setBelowTextConstraints:(id)a3;
- (void)setBoundaryConstraints:(id)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setCandidate:(id)a3;
- (void)setContentsView:(id)a3;
- (void)setDeltaRange:(_NSRange)a3;
- (void)setDictationGlowEffect:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setLabelNumber:(unint64_t)a3;
- (void)setLeadingSpacing:(id)a3;
- (void)setNeedsRTLCheck:(BOOL)a3;
- (void)setOptionalTintColor:(id)a3;
- (void)setOriginalSelectedRange:(_NSRange)a3;
- (void)setParentView:(id)a3;
- (void)setPromptStyle:(int64_t)a3;
- (void)setReferenceRect:(CGRect)a3;
- (void)setReplacement:(id)a3;
- (void)setSecureCandidateHeight:(double)a3;
- (void)setShouldRejectCandidate:(BOOL)a3;
- (void)setSideButton:(id)a3;
- (void)setTextAnchor:(id)a3;
- (void)setTextHighlightView:(id)a3;
- (void)showChoices:(BOOL)a3;
- (void)showTextHighlightView:(BOOL)a3;
- (void)updateButtonForType:(int64_t)a3;
- (void)updateButtonName:(id)a3 placement:(int64_t)a4 originalText:(id)a5;
- (void)updateForSingleWord:(id)a3 textAnchorRect:(id)a4 inTextView:(id)a5 parentView:(id)a6 highlightColor:(id)a7;
- (void)updateSelfWithRect:(CGRect)a3;
- (void)updateTextAnchorForParentView:(id)a3;
- (void)updateTextBoxHighlightForRect:(id)a3 inTextView:(id)a4 parentView:(id)a5 highlightColor:(id)a6;
- (void)updateTextHighlightViewWithColor:(id)a3 convertedRect:(CGRect)a4;
- (void)updateViewForOptions:(id)a3;
- (void)updateWithChoices:(id)a3 fromParentView:(id)a4 referenceTextView:(id)a5 presentedFromRect:(id)a6 textHighlightColor:(id)a7;
@end

@implementation _UITextChoiceAccelerationBubble

- (_UITextChoiceAccelerationBubble)init
{
  return -[_UITextChoiceAccelerationBubble initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (_UITextChoiceAccelerationBubble)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UITextChoiceAccelerationBubble;
  v3 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[_UITextChoiceAccelerationBubble setReferenceRect:](v4, "setReferenceRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    v5 = +[UIColor clearColor];
    [(UIView *)v4 setBackgroundColor:v5];

    [(UIView *)v4 setClipsToBounds:0];
    [(_UITextChoiceAccelerationBubble *)v4 setNeedsRTLCheck:1];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel_inputModeDidChange_ name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
  }
  return v4;
}

- (void)updateTextAnchorForParentView:(id)a3
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(_UITextChoiceAccelerationBubble *)self parentView];
    if (v5 != v4)
    {

LABEL_4:
      id v6 = [(UIView *)self superview];

      if (v6 != v4)
      {
        [(_UITextChoiceAccelerationBubble *)self removeFromSuperview];
        [v4 addSubview:self];
      }
      [(_UITextChoiceAccelerationBubble *)self setParentView:v4];
      [(_UITextChoiceAccelerationBubble *)self anchorToTextIfNeeded];
      v7 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
      int v8 = [v7 isActive];

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E4F5B268];
        v10 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
        v56[0] = v10;
        v11 = [(_UITextChoiceAccelerationBubble *)self anchorTop];
        v56[1] = v11;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
        [v9 deactivateConstraints:v12];
      }
      v13 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
      v14 = [v13 leftAnchor];
      v15 = [v4 leftAnchor];
      v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
      [(_UITextChoiceAccelerationBubble *)self setAnchorLeading:v16];

      v17 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
      v18 = [v17 topAnchor];
      v19 = [v4 topAnchor];
      v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
      [(_UITextChoiceAccelerationBubble *)self setAnchorTop:v20];

      v21 = (void *)MEMORY[0x1E4F5B268];
      v22 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
      v55[0] = v22;
      v23 = [(_UITextChoiceAccelerationBubble *)self anchorTop];
      v55[1] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
      [v21 activateConstraints:v24];

      v25 = [(_UITextChoiceAccelerationBubble *)self boundaryConstraints];

      if (v25)
      {
        v26 = (void *)MEMORY[0x1E4F5B268];
        v27 = [(_UITextChoiceAccelerationBubble *)self boundaryConstraints];
        [v26 deactivateConstraints:v27];
      }
      v52 = [(UIView *)self leftAnchor];
      v28 = [v4 _window];
      v29 = [v28 leftAnchor];
      v30 = [v52 constraintGreaterThanOrEqualToAnchor:v29 constant:10.0];
      v54[0] = v30;
      v31 = [v4 _window];
      v32 = [v31 rightAnchor];
      v33 = [(UIView *)self rightAnchor];
      v34 = [v32 constraintGreaterThanOrEqualToAnchor:v33 constant:10.0];
      v54[1] = v34;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
      [(_UITextChoiceAccelerationBubble *)self setBoundaryConstraints:v35];

      v36 = (void *)MEMORY[0x1E4F5B268];
      v37 = [(_UITextChoiceAccelerationBubble *)self boundaryConstraints];
      [v36 activateConstraints:v37];
LABEL_11:

      goto LABEL_12;
    }
    v38 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];

    if (!v38) {
      goto LABEL_4;
    }
    uint64_t v39 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
    if (v39)
    {
      v40 = (void *)v39;
      v41 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
      char v42 = [v41 isActive];

      if ((v42 & 1) == 0)
      {
        id v43 = [(_UITextChoiceAccelerationBubble *)self parentView];

        if (v43 == v4)
        {
          v44 = [(UIView *)self superview];
          v45 = [(_UITextChoiceAccelerationBubble *)self parentView];

          if (v44 != v45)
          {
            v46 = [(_UITextChoiceAccelerationBubble *)self parentView];
            [v46 addSubview:self];
          }
          v47 = (void *)MEMORY[0x1E4F5B268];
          v37 = [(_UITextChoiceAccelerationBubble *)self boundaryConstraints];
          v48 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
          v53[0] = v48;
          v49 = [(_UITextChoiceAccelerationBubble *)self anchorTop];
          v53[1] = v49;
          v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
          v51 = [v37 arrayByAddingObjectsFromArray:v50];
          [v47 activateConstraints:v51];

          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:
}

- (void)anchorToTextIfNeeded
{
  v105[2] = *MEMORY[0x1E4F143B8];
  v3 = [(_UITextChoiceAccelerationBubble *)self textAnchor];

  if (!v3)
  {
    id v4 = objc_alloc_init(UILayoutGuide);
    [(_UITextChoiceAccelerationBubble *)self setTextAnchor:v4];

    id v5 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
    [(UIView *)self addLayoutGuide:v5];

    id v6 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
    v7 = [v6 widthAnchor];
    int v8 = [v7 constraintEqualToConstant:0.0];
    [(_UITextChoiceAccelerationBubble *)self setAnchorWidth:v8];

    v9 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
    v10 = [v9 heightAnchor];
    v11 = [v10 constraintEqualToConstant:1.0];
    [(_UITextChoiceAccelerationBubble *)self setAnchorHeight:v11];

    v12 = (void *)MEMORY[0x1E4F5B268];
    v13 = [(_UITextChoiceAccelerationBubble *)self anchorHeight];
    v105[0] = v13;
    v14 = [(_UITextChoiceAccelerationBubble *)self anchorWidth];
    v105[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    [v12 activateConstraints:v15];
  }
  uint64_t v16 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
  if (!v16
    || (v17 = (void *)v16,
        [(_UITextChoiceAccelerationBubble *)self contentsView],
        v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    v19 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    [v19 removeFromSuperview];

    v20 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    [v20 removeFromSuperview];

    v21 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v21 removeFromSuperview];

    v22 = [(_UITextChoiceAccelerationBubble *)self backgroundImageView];
    [(_UITextChoiceAccelerationBubble *)self setBackgroundView:v22];

    v23 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    [(UIView *)self addSubview:v24];

    v25 = objc_alloc_init(UIScrollView);
    [(_UITextChoiceAccelerationBubble *)self setBackingScrollView:v25];

    v26 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    v28 = [v27 contentView];
    v29 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    [v28 addSubview:v29];

    v30 = [UIStackView alloc];
    v31 = [(_UITextChoiceAccelerationBubble *)self textOptionWithText:&stru_1ED0E84C0 type:2];
    v104 = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
    v33 = [(UIStackView *)v30 initWithArrangedSubviews:v32];
    [(_UITextChoiceAccelerationBubble *)self setContentsView:v33];

    v34 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

    v35 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v35 setAxis:0];

    v36 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v36 setAlignment:5];

    v37 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v37 setSpacing:0.0];

    v38 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    uint64_t v39 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v38 addSubview:v39];

    v40 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
    v41 = [v40 leadingAnchor];
    char v42 = [(UIView *)self leadingAnchor];
    id v43 = [v41 constraintEqualToAnchor:v42];
    [(_UITextChoiceAccelerationBubble *)self setLeadingSpacing:v43];

    v44 = [(_UITextChoiceAccelerationBubble *)self leadingSpacing];
    LODWORD(v45) = 1132068864;
    [v44 setPriority:v45];

    v46 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v47 = [v46 widthAnchor];
    v48 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    v49 = [v48 widthAnchor];
    v50 = [v47 constraintEqualToAnchor:v49 constant:0.0];

    LODWORD(v51) = 1144750080;
    v75 = v50;
    [v50 setPriority:v51];
    v82 = (void *)MEMORY[0x1E4F5B268];
    v102 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    v101 = [v102 leadingAnchor];
    v100 = [(UIView *)self leadingAnchor];
    v99 = [v101 constraintEqualToAnchor:v100];
    v103[0] = v99;
    v97 = [(UIView *)self trailingAnchor];
    v98 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    v96 = [v98 trailingAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v103[1] = v95;
    v94 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v92 = [v94 topAnchor];
    v93 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    v91 = [v93 topAnchor];
    v90 = [v92 constraintEqualToAnchor:v91 constant:0.0];
    v103[2] = v90;
    v89 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    v87 = [v89 bottomAnchor];
    v88 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v86 = [v88 bottomAnchor];
    v85 = [v87 constraintEqualToAnchor:v86 constant:0.0];
    v103[3] = v85;
    v84 = [(_UITextChoiceAccelerationBubble *)self leadingSpacing];
    v103[4] = v84;
    v83 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    v80 = [v83 topAnchor];
    v81 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v79 = [v81 contentLayoutGuide];
    v78 = [v79 topAnchor];
    v77 = [v80 constraintEqualToAnchor:v78];
    v103[5] = v77;
    v76 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    v73 = [v76 leadingAnchor];
    v74 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v72 = [v74 contentLayoutGuide];
    v71 = [v72 leadingAnchor];
    v70 = [v73 constraintEqualToAnchor:v71];
    v103[6] = v70;
    v69 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v68 = [v69 contentLayoutGuide];
    v66 = [v68 bottomAnchor];
    v67 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    v65 = [v67 bottomAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v103[7] = v64;
    v63 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v62 = [v63 contentLayoutGuide];
    v52 = [v62 trailingAnchor];
    v53 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    v54 = [v53 trailingAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    v103[8] = v55;
    v56 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
    v57 = [v56 heightAnchor];
    v58 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    v59 = [v58 heightAnchor];
    v60 = [v57 constraintEqualToAnchor:v59];
    v103[9] = v60;
    v103[10] = v50;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:11];
    [v82 activateConstraints:v61];
  }
}

- (void)updateSelfWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v62[3] = *MEMORY[0x1E4F143B8];
  [(_UITextChoiceAccelerationBubble *)self referenceRect];
  v65.origin.double x = x;
  v65.origin.double y = y;
  v65.size.double width = width;
  v65.size.double height = height;
  if (!CGRectEqualToRect(v63, v65))
  {
    v64.origin.double x = x;
    v64.origin.double y = y;
    v64.size.double width = width;
    v64.size.double height = height;
    if (!CGRectIsNull(v64))
    {
      -[_UITextChoiceAccelerationBubble setReferenceRect:](self, "setReferenceRect:", x, y, width, height);
      [(_UITextChoiceAccelerationBubble *)self anchorToTextIfNeeded];
      int v8 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
      [v8 setConstant:x];

      v9 = [(_UITextChoiceAccelerationBubble *)self anchorTop];
      [v9 setConstant:y];

      v10 = [(_UITextChoiceAccelerationBubble *)self anchorWidth];
      [v10 setConstant:width];

      v11 = [(_UITextChoiceAccelerationBubble *)self anchorHeight];
      [v11 setConstant:height];

      if (-[_UITextChoiceAccelerationBubble promptWillCollideWithKeyboard:](self, "promptWillCollideWithKeyboard:", x, y, width, height)|| [(_UITextChoiceAccelerationBubble *)self promptStyle] == 3)
      {
        v12 = [(_UITextChoiceAccelerationBubble *)self belowTextConstraints];
        v13 = [v12 firstObject];
        int v14 = [v13 isActive];

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E4F5B268];
          uint64_t v16 = [(_UITextChoiceAccelerationBubble *)self belowTextConstraints];
          [v15 deactivateConstraints:v16];
        }
        v17 = [(_UITextChoiceAccelerationBubble *)self aboveTextConstraints];

        if (!v17)
        {
          v59 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
          v57 = [v59 topAnchor];
          v55 = [(UIView *)self topAnchor];
          v53 = [v57 constraintEqualToAnchor:v55];
          v62[0] = v53;
          double v51 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
          v18 = [v51 topAnchor];
          v19 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
          v20 = [v19 bottomAnchor];
          v21 = [v18 constraintEqualToAnchor:v20];
          v62[1] = v21;
          v22 = [(UIView *)self bottomAnchor];
          v23 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
          v24 = [v23 bottomAnchor];
          v25 = [v22 constraintEqualToAnchor:v24];
          v62[2] = v25;
          v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
          [(_UITextChoiceAccelerationBubble *)self setAboveTextConstraints:v26];
        }
        v27 = [(_UITextChoiceAccelerationBubble *)self aboveTextConstraints];
        v28 = [v27 firstObject];
        char v29 = [v28 isActive];

        if ((v29 & 1) == 0)
        {
          v30 = (void *)MEMORY[0x1E4F5B268];
          uint64_t v31 = [(_UITextChoiceAccelerationBubble *)self aboveTextConstraints];
LABEL_17:
          v50 = (void *)v31;
          [v30 activateConstraints:v31];
        }
      }
      else
      {
        v32 = [(_UITextChoiceAccelerationBubble *)self belowTextConstraints];

        if (!v32)
        {
          v60 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
          v56 = [v60 topAnchor];
          v58 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
          v54 = [v58 bottomAnchor];
          v52 = [v56 constraintEqualToAnchor:v54 constant:0.0];
          v61[0] = v52;
          v33 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
          v34 = [v33 topAnchor];
          v35 = [(UIView *)self topAnchor];
          v36 = [v34 constraintEqualToAnchor:v35];
          v61[1] = v36;
          v37 = [(UIView *)self bottomAnchor];
          v38 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
          uint64_t v39 = [v38 bottomAnchor];
          v40 = [v37 constraintEqualToAnchor:v39];
          v61[2] = v40;
          v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
          [(_UITextChoiceAccelerationBubble *)self setBelowTextConstraints:v41];
        }
        char v42 = [(_UITextChoiceAccelerationBubble *)self aboveTextConstraints];
        id v43 = [v42 firstObject];
        int v44 = [v43 isActive];

        if (v44)
        {
          double v45 = (void *)MEMORY[0x1E4F5B268];
          v46 = [(_UITextChoiceAccelerationBubble *)self aboveTextConstraints];
          [v45 deactivateConstraints:v46];
        }
        v47 = [(_UITextChoiceAccelerationBubble *)self belowTextConstraints];
        v48 = [v47 firstObject];
        char v49 = [v48 isActive];

        if ((v49 & 1) == 0)
        {
          v30 = (void *)MEMORY[0x1E4F5B268];
          uint64_t v31 = [(_UITextChoiceAccelerationBubble *)self belowTextConstraints];
          goto LABEL_17;
        }
      }
    }
  }
}

- (BOOL)promptWillCollideWithKeyboard:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v8 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
  [v8 bounds];
  double v10 = v9;

  if (v10 >= height) {
    double v11 = v10;
  }
  else {
    double v11 = height;
  }
  CGFloat v12 = height + v11;
  v13 = [(UIView *)self _window];
  int v14 = [(UIView *)self superview];
  objc_msgSend(v13, "convertRect:fromView:", v14, x, y, width, v12);
  uint64_t v54 = v16;
  uint64_t v55 = v15;
  uint64_t v52 = v18;
  uint64_t v53 = v17;

  v19 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v19 visibleFrameInView:self];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v57.origin.double x = x;
  v57.origin.double y = y;
  v57.size.double width = width;
  v57.size.double height = v12;
  v60.origin.double x = v21;
  v60.origin.double y = v23;
  v60.size.double width = v25;
  v60.size.double height = v27;
  if (CGRectIntersectsRect(v57, v60)) {
    return 1;
  }
  char v29 = [(UIView *)self window];
  v30 = [v29 safeAreaLayoutGuide];
  [v30 layoutFrame];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;

  v58.origin.double x = v32;
  v58.origin.double y = v34;
  v58.size.double width = v36;
  v58.size.double height = v38;
  CGFloat MinX = CGRectGetMinX(v58);
  v59.origin.double x = v32;
  v59.origin.double y = v34;
  v59.size.double width = v36;
  v59.size.double height = v38;
  CGFloat MaxY = CGRectGetMaxY(v59);
  v41 = [(UIView *)self window];
  [v41 safeAreaInsets];
  uint64_t v43 = v42;

  uint64_t v45 = v54;
  uint64_t v44 = v55;
  uint64_t v47 = v52;
  uint64_t v46 = v53;
  CGFloat v48 = MinX;
  CGFloat v49 = MaxY;
  CGFloat v50 = v36;
  uint64_t v51 = v43;
  return CGRectIntersectsRect(*(CGRect *)&v44, *(CGRect *)&v48);
}

- (void)showChoices:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
  id v6 = v5;
  if (v3)
  {
    [v5 setHidden:0];

    v7 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v7 setHidden:0];

    int v8 = [(_UITextChoiceAccelerationBubble *)self backgroundMaskLayer];
    [v8 setHidden:0];

    double v9 = +[UIColor systemBlackColor];
    uint64_t v10 = [v9 cgColor];
    double v11 = [(UIView *)self layer];
    [v11 setShadowColor:v10];

    CGFloat v12 = [(UIView *)self layer];
    [v12 setShadowRadius:9.0];

    v13 = [(UIView *)self layer];
    objc_msgSend(v13, "setShadowOffset:", 0.0, 3.0);

    int v14 = [(UIView *)self layer];
    LODWORD(v15) = 0.25;
  }
  else
  {
    [v5 setHidden:1];

    uint64_t v16 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    [v16 setHidden:1];

    uint64_t v17 = [(_UITextChoiceAccelerationBubble *)self backgroundMaskLayer];
    [v17 setHidden:1];

    int v14 = [(UIView *)self layer];
    double v15 = 0.0;
  }
  id v18 = v14;
  [v14 setShadowOpacity:v15];
}

- (void)updateForSingleWord:(id)a3 textAnchorRect:(id)a4 inTextView:(id)a5 parentView:(id)a6 highlightColor:(id)a7
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a4;
  if ([(_UITextChoiceAccelerationBubble *)self needsRTLCheck]
    || ([(_UITextChoiceAccelerationBubble *)self parentView],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v17 isEqual:v14],
        v17,
        (v18 & 1) == 0))
  {
    uint64_t v19 = [(_UITextChoiceAccelerationBubble *)self usingRTLInputMode];
    double v20 = [(UIView *)self traitOverrides];
    [v20 setLayoutDirection:v19];

    [(_UITextChoiceAccelerationBubble *)self setNeedsRTLCheck:0];
  }
  [(_UITextChoiceAccelerationBubble *)self updateTextAnchorForParentView:v14];
  [v16 rect];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  if (!+[UIKeyboard isKeyboardProcess])
  {
    objc_msgSend(v14, "convertRect:fromView:", v13, v22, v24, v26, v28);
    double v22 = v29;
    double v24 = v30;
    double v26 = v31;
    double v28 = v32;
  }
  -[_UITextChoiceAccelerationBubble updateTextHighlightViewWithColor:convertedRect:](self, "updateTextHighlightViewWithColor:convertedRect:", v15, v22, v24, v26, v28);
  double v33 = [(_UITextChoiceAccelerationBubble *)self contentsView];
  CGFloat v34 = [v33 arrangedSubviews];
  uint64_t v35 = [v34 count];

  if (v35 == 1)
  {
    CGFloat v36 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    double v37 = [v36 arrangedSubviews];
    CGFloat v38 = [v37 objectAtIndex:0];

    [v38 updateText:v12 type:3];
  }
  else
  {
    v41[0] = v12;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    v40 = _candidatesChoicesFromTextChoices(v39, 0);
    [(_UITextChoiceAccelerationBubble *)self updateViewForOptions:v40];
  }
}

- (void)updateTextBoxHighlightForRect:(id)a3 inTextView:(id)a4 parentView:(id)a5 highlightColor:(id)a6
{
  id v25 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  [(_UITextChoiceAccelerationBubble *)self updateTextAnchorForParentView:v10];
  [v12 rect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  if (!+[UIKeyboard isKeyboardProcess])
  {
    objc_msgSend(v10, "convertRect:fromView:", v25, v14, v16, v18, v20);
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
    double v20 = v24;
  }
  -[_UITextChoiceAccelerationBubble updateTextHighlightViewWithColor:convertedRect:](self, "updateTextHighlightViewWithColor:convertedRect:", v11, v14, v16, v18, v20);
}

- (void)updateTextHighlightViewWithColor:(id)a3 convertedRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  -[_UITextChoiceAccelerationBubble updateSelfWithRect:](self, "updateSelfWithRect:", x, y, width, height);
  [(_UITextChoiceAccelerationBubble *)self showTextHighlightView:1];
  [(UIView *)self setAlpha:1.0];
  id v10 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  [v10 setBackgroundColor:v9];
}

- (void)hideForNow
{
  BOOL v3 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  char v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    [(_UITextChoiceAccelerationBubble *)self showTextHighlightView:0];
    [(UIView *)self setAlpha:0.0];
  }
}

- (void)updateWithChoices:(id)a3 fromParentView:(id)a4 referenceTextView:(id)a5 presentedFromRect:(id)a6 textHighlightColor:(id)a7
{
  id v40 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  double v16 = [v15 firstObject];
  double v17 = [v16 label];

  LODWORD(v16) = [v17 _isNaturallyRTL];
  uint64_t v18 = v16 ^ [(_UITextChoiceAccelerationBubble *)self usingRTLInputMode];
  double v19 = [(UIView *)self traitOverrides];
  [v19 setLayoutDirection:v16];

  [(_UITextChoiceAccelerationBubble *)self setNeedsRTLCheck:v18];
  [(_UITextChoiceAccelerationBubble *)self updateTextAnchorForParentView:v40];
  [(UIView *)self setAlpha:1.0];
  [(_UITextChoiceAccelerationBubble *)self showChoices:1];
  [(_UITextChoiceAccelerationBubble *)self showTextHighlightView:v14 != 0];
  if (v14)
  {
    double v20 = [v14 colorWithAlphaComponent:0.2];
    double v21 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
    [v21 setBackgroundColor:v14];

    [(_UITextChoiceAccelerationBubble *)self setOptionalTintColor:v14];
    double v22 = [(_UITextChoiceAccelerationBubble *)self dictationGlowEffect];
    [v22 setTintColor:v20];

    double v23 = [(_UITextChoiceAccelerationBubble *)self dictationGlowEffect];
    [v23 setPulsing:1];
  }
  [v13 rect];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  if (!+[UIKeyboard isKeyboardProcess])
  {
    objc_msgSend(v40, "convertRect:fromView:", v12, v25, v27, v29, v31);
    double v25 = v32;
    double v27 = v33;
    double v29 = v34;
    double v31 = v35;
  }
  -[_UITextChoiceAccelerationBubble updateSelfWithRect:](self, "updateSelfWithRect:", v25, v27, v29, v31);
  [(_UITextChoiceAccelerationBubble *)self setShouldRejectCandidate:0];
  [(_UITextChoiceAccelerationBubble *)self updateViewForOptions:v15];

  [(UIView *)self layoutIfNeeded];
  CGFloat v36 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  [v36 bounds];
  double v38 = v37 / 4.75;
  uint64_t v39 = [(_UITextChoiceAccelerationBubble *)self dictationGlowEffect];
  [v39 setBlurRadius:v38];
}

- (void)updateViewForOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITextChoiceAccelerationBubble *)self contentsView];
  id v6 = [v5 arrangedSubviews];
  uint64_t v7 = [v6 firstObject];

  int v8 = [v4 firstObject];
  CGFloat v48 = v8;
  CGFloat v49 = (void *)v7;
  if ([v8 slotID])
  {
    uint64_t v9 = 6;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = 8;
    }
    else if (_candidateSourceIsSmartReply(v8))
    {
      uint64_t v9 = 7;
    }
    else if ((unint64_t)[v4 count] >= 2)
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 3;
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UITextChoiceAccelerationBubble_updateViewForOptions___block_invoke;
  aBlock[3] = &unk_1E52E3DC0;
  aBlock[4] = self;
  uint64_t v51 = (unsigned int (**)(void *, void *))_Block_copy(aBlock);
  unint64_t v10 = [v4 count];
  id v11 = [(_UITextChoiceAccelerationBubble *)self contentsView];
  id v12 = [v11 arrangedSubviews];
  unint64_t v13 = [v12 count];

  if (v10 >= v13)
  {
    if ([v4 count])
    {
      unint64_t v29 = 0;
      do
      {
        double v30 = [v4 objectAtIndexedSubscript:v29];
        double v31 = [v30 label];
        uint64_t v32 = v9;
        if (v9 == 2)
        {
          if (v51[2](v51, v31)) {
            uint64_t v32 = 4;
          }
          else {
            uint64_t v32 = 2;
          }
        }
        double v33 = [(_UITextChoiceAccelerationBubble *)self contentsView];
        double v34 = [v33 arrangedSubviews];
        unint64_t v35 = [v34 count];

        if (v29 >= v35)
        {
          double v38 = objc_alloc_init(_UITextOption);
          CGFloat v36 = [(_UITextChoiceAccelerationBubble *)self contentsView];
          [v36 addArrangedSubview:v38];
        }
        else
        {
          CGFloat v36 = [(_UITextChoiceAccelerationBubble *)self contentsView];
          double v37 = [v36 arrangedSubviews];
          double v38 = [v37 objectAtIndex:v29];
        }
        [(_UITextChoiceAccelerationBubble *)self secureCandidateHeight];
        -[_UITextOption updateSourceCandidate:secureCandidateHeight:](v38, "updateSourceCandidate:secureCandidateHeight:", v30);
        [(_UITextOption *)v38 updateText:v31 type:v32];
        -[_UITextOption showSeparator:](v38, "showSeparator:", v29 < [v4 count] - 1);
        if (v32 == 7) {
          [(_UITextOption *)v38 setLightingEffectEnabled:1 atPosition:v29];
        }

        ++v29;
      }
      while (v29 < [v4 count]);
    }
  }
  else
  {
    id v14 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    id v15 = [v14 arrangedSubviews];
    uint64_t v16 = [v15 count];
    uint64_t v50 = v16 - [v4 count];

    if ([v4 count])
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = [(_UITextChoiceAccelerationBubble *)self contentsView];
        double v19 = [v18 arrangedSubviews];
        double v20 = [v19 objectAtIndex:v17];

        double v21 = [v4 objectAtIndexedSubscript:v17];
        double v22 = [v21 label];
        uint64_t v23 = v9;
        if (v9 == 2)
        {
          if (v51[2](v51, v22)) {
            uint64_t v23 = 4;
          }
          else {
            uint64_t v23 = 2;
          }
        }
        if (!v20)
        {
          double v20 = objc_alloc_init(_UITextOption);
          double v24 = [(_UITextChoiceAccelerationBubble *)self contentsView];
          [v24 addArrangedSubview:v20];
        }
        [(_UITextChoiceAccelerationBubble *)self secureCandidateHeight];
        -[_UITextOption updateSourceCandidate:secureCandidateHeight:](v20, "updateSourceCandidate:secureCandidateHeight:", v21);
        [(_UITextOption *)v20 updateText:v22 type:v23];
        -[_UITextOption showSeparator:](v20, "showSeparator:", v17 < [v4 count] - 1);
        if (v23 == 7) {
          [(_UITextOption *)v20 setLightingEffectEnabled:1 atPosition:v17];
        }

        ++v17;
      }
      while (v17 < [v4 count]);
    }
    if (v50 >= 1)
    {
      unint64_t v25 = v50 + 1;
      do
      {
        double v26 = [(_UITextChoiceAccelerationBubble *)self contentsView];
        double v27 = [v26 arrangedSubviews];
        double v28 = [v27 lastObject];
        [v28 removeFromSuperview];

        --v25;
      }
      while (v25 > 1);
    }
  }
  uint64_t v39 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
  objc_msgSend(v39, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  id v40 = [(_UITextChoiceAccelerationBubble *)self contentsView];
  v41 = [v40 arrangedSubviews];
  uint64_t v42 = [v41 firstObject];

  uint64_t v43 = [v42 viewForLastBaselineLayout];

  if (v43)
  {
    [v42 leadingSpace];
    double v45 = v44;
    uint64_t v46 = [(_UITextChoiceAccelerationBubble *)self leadingSpacing];
    [v46 setConstant:v45];
  }
  uint64_t v47 = [(_UITextChoiceAccelerationBubble *)self contentsView];
  [v47 layoutIfNeeded];
}

- (void)updateButtonName:(id)a3 placement:(int64_t)a4 originalText:(id)a5
{
  v116[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v111 = v9;
  id v112 = v8;
  switch(a4)
  {
    case 0:
      unint64_t v10 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      id v11 = [v10 superview];

      if (v11)
      {
        id v12 = (void *)MEMORY[0x1E4F5B268];
        unint64_t v13 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];
        [v12 deactivateConstraints:v13];

        id v14 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v14 removeFromSuperview];
      }
      [(_UITextChoiceAccelerationBubble *)self setSideButton:0];
      id v15 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];

      if (v15)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F5B268];
        unint64_t v17 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];
        [v16 deactivateConstraints:v17];
      }
      v110 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
      uint64_t v18 = [v110 leadingAnchor];
      double v19 = [(UIView *)self leadingAnchor];
      double v20 = [v18 constraintEqualToAnchor:v19];
      v116[0] = v20;
      double v21 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      double v22 = [v21 trailingAnchor];
      uint64_t v23 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
      double v24 = [v23 trailingAnchor];
      unint64_t v25 = [v22 constraintEqualToAnchor:v24];
      v116[1] = v25;
      double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
      [(_UITextChoiceAccelerationBubble *)self setButtonConstraints:v26];

      goto LABEL_36;
    case 1:
      double v27 = [(_UITextChoiceAccelerationBubble *)self sideButton];

      if (v27)
      {
        double v28 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        objc_msgSend(v28, "updateText:type:", v8, -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType"));
      }
      else
      {
        int64_t v33 = [(_UITextChoiceAccelerationBubble *)self buttonType];
        if (v33 == 2) {
          uint64_t v34 = 1;
        }
        else {
          uint64_t v34 = v33;
        }
        unint64_t v35 = [[_UITextOption alloc] initWithTitle:v8 type:v34];
        [(_UITextChoiceAccelerationBubble *)self setSideButton:v35];

        CGFloat v36 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

        double v28 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
        double v37 = [v28 contentView];
        double v38 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v37 addSubview:v38];
      }
      uint64_t v39 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];

      if (v39)
      {
        id v40 = (void *)MEMORY[0x1E4F5B268];
        v41 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];
        [v40 deactivateConstraints:v41];
      }
      v110 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v108 = [v110 topAnchor];
      v109 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      v107 = [v109 topAnchor];
      v106 = [v108 constraintEqualToAnchor:v107];
      v115[0] = v106;
      v105 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      v103 = [v105 bottomAnchor];
      v104 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v102 = [v104 bottomAnchor];
      v101 = [v103 constraintEqualToAnchor:v102];
      v115[1] = v101;
      v100 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      v97 = [v100 trailingAnchor];
      v98 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v96 = [v98 trailingAnchor];
      v95 = [v97 constraintEqualToAnchor:v96 constant:4.0];
      v115[2] = v95;
      v94 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
      uint64_t v42 = [v94 leadingAnchor];
      uint64_t v43 = [(UIView *)self leadingAnchor];
      double v44 = [v42 constraintEqualToAnchor:v43];
      v115[3] = v44;
      double v45 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      uint64_t v46 = [v45 leadingAnchor];
      uint64_t v47 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
      CGFloat v48 = [v47 trailingAnchor];
      CGFloat v49 = [v46 constraintEqualToAnchor:v48 constant:0.0];
      v115[4] = v49;
      uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:5];
      [(_UITextChoiceAccelerationBubble *)self setButtonConstraints:v50];

      uint64_t v51 = v97;
      goto LABEL_34;
    case 2:
      unint64_t v29 = [(_UITextChoiceAccelerationBubble *)self sideButton];

      if (v29)
      {
        double v30 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        objc_msgSend(v30, "updateText:type:", v8, -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType"));
      }
      else
      {
        int64_t v52 = [(_UITextChoiceAccelerationBubble *)self buttonType];
        if (v52 == 2) {
          uint64_t v53 = 1;
        }
        else {
          uint64_t v53 = v52;
        }
        uint64_t v54 = [[_UITextOption alloc] initWithTitle:v8 type:v53];
        [(_UITextChoiceAccelerationBubble *)self setSideButton:v54];

        uint64_t v55 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v55 setTranslatesAutoresizingMaskIntoConstraints:0];

        double v30 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
        v56 = [v30 contentView];
        CGRect v57 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v56 addSubview:v57];
      }
      CGRect v58 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];

      if (v58)
      {
        CGRect v59 = (void *)MEMORY[0x1E4F5B268];
        CGRect v60 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];
        [v59 deactivateConstraints:v60];
      }
      v110 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v108 = [v110 centerYAnchor];
      v109 = [(_UITextChoiceAccelerationBubble *)self contentsView];
      v107 = [v109 centerYAnchor];
      v106 = [v108 constraintEqualToAnchor:v107];
      v114[0] = v106;
      v105 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v103 = [v105 leadingAnchor];
      v104 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      v102 = [v104 leadingAnchor];
      v101 = [v103 constraintEqualToAnchor:v102 constant:4.0];
      v114[1] = v101;
      v100 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
      v61 = [v100 leadingAnchor];
      v62 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      CGRect v63 = [v62 trailingAnchor];
      CGRect v64 = [v61 constraintEqualToAnchor:v63 constant:0.0];
      v114[2] = v64;
      CGRect v65 = [(UIView *)self trailingAnchor];
      v66 = [(_UITextChoiceAccelerationBubble *)self backingScrollView];
      v67 = [v66 trailingAnchor];
      v68 = [v65 constraintEqualToAnchor:v67];
      v114[3] = v68;
      v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:4];
      [(_UITextChoiceAccelerationBubble *)self setButtonConstraints:v69];

      goto LABEL_35;
    case 3:
      double v31 = [(_UITextChoiceAccelerationBubble *)self sideButton];

      if (v31)
      {
        uint64_t v32 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        objc_msgSend(v32, "updateText:type:", v8, -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType"));
      }
      else
      {
        int64_t v70 = [(_UITextChoiceAccelerationBubble *)self buttonType];
        int64_t v71 = [(_UITextChoiceAccelerationBubble *)self buttonType];
        v72 = [_UITextOption alloc];
        v73 = v72;
        if (v71 == 5)
        {
          v74 = [(_UITextChoiceAccelerationBubble *)self optionalTintColor];
          v75 = [(_UITextOption *)v73 initWithTitle:v8 type:v70 optionalTintColor:v74];
          [(_UITextChoiceAccelerationBubble *)self setSideButton:v75];
        }
        else
        {
          v74 = [(_UITextOption *)v72 initWithTitle:v8 type:v70];
          [(_UITextChoiceAccelerationBubble *)self setSideButton:v74];
        }

        v76 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v76 setTranslatesAutoresizingMaskIntoConstraints:0];

        uint64_t v32 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
        v77 = [v32 contentView];
        v78 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v77 addSubview:v78];
      }
      v79 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];

      if (v79)
      {
        v80 = (void *)MEMORY[0x1E4F5B268];
        v81 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];
        [v80 deactivateConstraints:v81];
      }
      v110 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v108 = [v110 centerXAnchor];
      v109 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
      v107 = [v109 centerXAnchor];
      v106 = [v108 constraintEqualToAnchor:v107];
      v113[0] = v106;
      v105 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v103 = [v105 topAnchor];
      v104 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      v102 = [v104 topAnchor];
      v101 = [v103 constraintEqualToAnchor:v102];
      v113[1] = v101;
      v100 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      v99 = [v100 bottomAnchor];
      v82 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v83 = [v82 bottomAnchor];
      v84 = [v99 constraintEqualToAnchor:v83];
      v113[2] = v84;
      v85 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
      v86 = [v85 widthAnchor];
      v87 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      v88 = [v87 widthAnchor];
      v89 = [v86 constraintGreaterThanOrEqualToAnchor:v88];
      v113[3] = v89;
      v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:4];
      [(_UITextChoiceAccelerationBubble *)self setButtonConstraints:v90];

      uint64_t v51 = v99;
LABEL_34:

LABEL_35:
LABEL_36:

      v91 = (void *)MEMORY[0x1E4F5B268];
      v92 = [(_UITextChoiceAccelerationBubble *)self buttonConstraints];
      [v91 activateConstraints:v92];

      id v9 = v111;
      id v8 = v112;
      break;
    default:
      break;
  }
  v93 = [(_UITextChoiceAccelerationBubble *)self sideButton];
  [v93 setOriginalText:v9];
}

- (void)updateButtonForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = qword_186B96880[a3 - 1];
  }
  [(_UITextChoiceAccelerationBubble *)self setButtonType:v3];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_UITextChoiceAccelerationBubble;
  [(UIView *)&v16 layoutSubviews];
  id v4 = [(_UITextChoiceAccelerationBubble *)self contentsView];
  id v5 = [v4 arrangedSubviews];
  uint64_t v6 = [v5 count];
  if (v6 == 1
    && ([(_UITextChoiceAccelerationBubble *)self replacement],
        v2 = objc_claimAutoreleasedReturnValue(),
        (_replacementSourceIsSmartReply(v2) & 1) == 0))
  {
    id v9 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    [v9 bounds];
    id v8 = -[_UITextChoiceAccelerationBubble squaredOffBubblePathInRect:](self, "squaredOffBubblePathInRect:");
  }
  else
  {
    uint64_t v7 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
    [v7 bounds];
    id v8 = -[_UITextChoiceAccelerationBubble bubblePathInRect:](self, "bubblePathInRect:");

    if (v6 != 1) {
      goto LABEL_7;
    }
  }

LABEL_7:
  id v10 = v8;
  uint64_t v11 = [v10 CGPath];
  id v12 = [(_UITextChoiceAccelerationBubble *)self backgroundMaskLayer];
  [v12 setShadowPath:v11];

  id v13 = v10;
  uint64_t v14 = [v13 CGPath];
  id v15 = [(_UITextChoiceAccelerationBubble *)self backgroundMaskLayer];
  [v15 setPath:v14];
}

- (void)inputModeDidChange:(id)a3
{
}

- (BOOL)usingRTLInputMode
{
  v2 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v3 = [v2 currentInputMode];
  char v4 = [v3 isDefaultRightToLeft];

  return v4;
}

- (id)textOptionWithText:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [[_UITextOption alloc] initWithTitle:v5 type:a4];

  return v6;
}

- (id)backgroundImageView
{
  int64_t v3 = [(_UITextChoiceAccelerationBubble *)self promptStyle];
  char v4 = [UIVisualEffectView alloc];
  id v5 = v4;
  if (v3 == 3)
  {
    uint64_t v6 = [(UIVisualEffectView *)v4 initWithEffect:0];
  }
  else
  {
    uint64_t v7 = +[UIBlurEffect effectWithStyle:9];
    uint64_t v6 = [(UIVisualEffectView *)v5 initWithEffect:v7];

    id v8 = objc_opt_new();
    id v9 = +[UIColor systemBackgroundColor];
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

    [(_UITextChoiceAccelerationBubble *)self referenceRect];
    -[_UITextChoiceAccelerationBubble bubblePathInRect:](self, "bubblePathInRect:");
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPath:", objc_msgSend(v10, "CGPath"));

    [(_UITextChoiceAccelerationBubble *)self setBackgroundMaskLayer:v8];
    uint64_t v11 = [(_UITextChoiceAccelerationBubble *)self backgroundMaskLayer];
    id v12 = [(UIView *)v6 layer];
    [v12 setMask:v11];
  }
  return v6;
}

- (id)squaredOffBubblePathInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = a3.size.height * 0.5;
  double v8 = a3.origin.x + a3.size.height * 0.5;
  id v9 = [(UIView *)self traitCollection];
  uint64_t v10 = [v9 layoutDirection];

  double v11 = x;
  double v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;
  if (v10 == 1)
  {
    double v36 = v7 + CGRectGetMinX(*(CGRect *)&v11);
    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v38 = v7 + CGRectGetMinX(v40);
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v41);
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGFloat v30 = CGRectGetMaxX(v42) + -6.5;
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double v15 = CGRectGetMaxY(v43);
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v44);
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    CGFloat v29 = CGRectGetMaxY(v45) + -6.5;
    v46.origin.double x = x;
    v46.origin.double y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double v28 = CGRectGetMaxX(v46);
    double v27 = y + 6.5;
    v47.origin.double x = x;
    v47.origin.double y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    CGFloat v34 = CGRectGetMaxX(v47) + -6.5;
    objc_super v16 = +[UIBezierPath bezierPath];
    objc_msgSend(v16, "moveToPoint:", v8, y);
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v36, y + v7, v7, 4.71238898, 1.57079633);
    objc_msgSend(v16, "addLineToPoint:", v38, MaxY);
    objc_msgSend(v16, "addLineToPoint:", v30, v15);
    v48.origin.double x = x;
    v48.origin.double y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGFloat v17 = CGRectGetMaxX(v48) + 6.5;
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    objc_msgSend(v16, "addQuadCurveToPoint:controlPoint:", MaxX, v29, v17, CGRectGetMaxY(v49));
    objc_msgSend(v16, "addLineToPoint:", v28, y + 6.5);
    v50.origin.double x = x;
    v50.origin.double y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGFloat v18 = CGRectGetMaxX(v50) + 6.5;
    v51.origin.double x = x;
    v51.origin.double y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v51);
    double v20 = v16;
    double v21 = v34;
    double v22 = y;
    double v23 = v18;
  }
  else
  {
    CGFloat v35 = CGRectGetMaxX(*(CGRect *)&v11) - v7;
    v52.origin.double x = x;
    v52.origin.double y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    CGFloat v37 = CGRectGetMaxX(v52) - v7;
    v53.origin.double x = x;
    v53.origin.double y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    CGRectGetMaxX(v53);
    v54.origin.double x = x;
    v54.origin.double y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    CGRectGetMaxY(v54);
    v55.origin.double x = x;
    v55.origin.double y = y;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    double v24 = CGRectGetMaxY(v55);
    v56.origin.double x = x;
    v56.origin.double y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    CGFloat v33 = CGRectGetMaxY(v56) + -6.5;
    objc_super v16 = +[UIBezierPath bezierPath];
    objc_msgSend(v16, "moveToPoint:", v8, y);
    objc_msgSend(v16, "addLineToPoint:", v35, y);
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v37, y + v7, v7, 4.71238898, 1.57079633);
    objc_msgSend(v16, "addLineToPoint:", x + 6.5, v24);
    v57.origin.double x = x;
    v57.origin.double y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v57);
    v58.origin.double x = x;
    v58.origin.double y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    objc_msgSend(v16, "addQuadCurveToPoint:controlPoint:", x, v33, MinX, CGRectGetMaxY(v58));
    objc_msgSend(v16, "addLineToPoint:", x, y + 6.5);
    double v20 = v16;
    double v21 = x + 6.5;
    double v22 = y;
    double v23 = x;
    double MinY = y;
  }
  objc_msgSend(v20, "addQuadCurveToPoint:controlPoint:", v21, v22, v23, MinY, *(void *)&v27, *(void *)&v28);
  objc_msgSend(v16, "addLineToPoint:", v8, y);
  return v16;
}

- (id)bubblePathInRect:(CGRect)a3
{
  return +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 6.5);
}

- (void)showTextHighlightView:(BOOL)a3
{
  int v3 = a3;
  v41[4] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_10;
  }
  id v5 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];

  if (v5) {
    goto LABEL_10;
  }
  uint64_t v6 = objc_alloc_init(UIView);
  [(_UITextChoiceAccelerationBubble *)self setTextHighlightView:v6];

  double v7 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v8 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  [(UIView *)self addSubview:v8];

  if ([(_UITextChoiceAccelerationBubble *)self promptStyle] == 3) {
    double v9 = 0.0;
  }
  else {
    double v9 = 2.0;
  }
  double v31 = (void *)MEMORY[0x1E4F5B268];
  CGRect v40 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
  double v38 = [v40 topAnchor];
  uint64_t v39 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  CGFloat v37 = [v39 topAnchor];
  double v36 = [v38 constraintEqualToAnchor:v37 constant:v9];
  v41[0] = v36;
  CGFloat v35 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
  CGFloat v33 = [v35 leadingAnchor];
  CGFloat v34 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  uint64_t v32 = [v34 leadingAnchor];
  CGFloat v30 = [v33 constraintEqualToAnchor:v32 constant:v9];
  v41[1] = v30;
  CGFloat v29 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  double v27 = [v29 bottomAnchor];
  double v28 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
  uint64_t v10 = [v28 bottomAnchor];
  double v11 = [v27 constraintEqualToAnchor:v10];
  void v41[2] = v11;
  double v12 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  CGFloat v13 = [v12 trailingAnchor];
  CGFloat v14 = [(_UITextChoiceAccelerationBubble *)self textAnchor];
  double v15 = [v14 trailingAnchor];
  objc_super v16 = [v13 constraintEqualToAnchor:v15 constant:v9];
  v41[3] = v16;
  CGFloat v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  [v31 activateConstraints:v17];

  CGFloat v18 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  [(UIView *)self sendSubviewToBack:v18];

  double v19 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  [v19 setHidden:0];

  double v20 = [(_UITextChoiceAccelerationBubble *)self dictationGlowEffect];
  if (!v20)
  {
    if ([(_UITextChoiceAccelerationBubble *)self promptStyle] != 3) {
      goto LABEL_10;
    }
    double v21 = [UIDictationGlowEffect alloc];
    double v20 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
    double v22 = [(UIDictationGlowEffect *)v21 initWithView:v20];
    [(_UITextChoiceAccelerationBubble *)self setDictationGlowEffect:v22];
  }
LABEL_10:
  double v23 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  int v24 = [v23 isHidden];

  if (v24 == v3)
  {
    unint64_t v25 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
    [(UIView *)self sendSubviewToBack:v25];

    double v26 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
    [v26 setHidden:v3 ^ 1u];
  }
}

- (BOOL)showingAutocorrectHighlight
{
  if ([(_UITextChoiceAccelerationBubble *)self promptStyle] == 3) {
    return 0;
  }
  char v4 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  if (v4)
  {
    id v5 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
    uint64_t v6 = [v5 superview];
    if (v6)
    {
      double v7 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
      if ([v7 isHidden])
      {
        BOOL v3 = 0;
      }
      else
      {
        double v8 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
        [v8 alpha];
        BOOL v3 = v9 > 0.0;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)optionForPoint:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextChoiceAccelerationBubble;
  char v4 = -[UIControl hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)dictationHighlightViewForPoint:(CGPoint)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_UITextChoiceAccelerationBubble;
  id v5 = -[UIControl hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v6 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  if (([v5 isEqual:v6] & 1) != 0
    && ([(_UITextChoiceAccelerationBubble *)self dictationGlowEffect],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v8 = (void *)v7;
    int64_t v9 = [(_UITextChoiceAccelerationBubble *)self promptStyle];

    if (v9 == 3)
    {
      id v10 = v5;
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[_UITextChoiceAccelerationBubble pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    double v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UITextChoiceAccelerationBubble;
    -[UIControl hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    double v8 = (_UITextChoiceAccelerationBubble *)objc_claimAutoreleasedReturnValue();
  }
  int64_t v9 = v8;

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  objc_super v12 = [(_UITextChoiceAccelerationBubble *)self backgroundView];
  [v12 frame];
  CGRect v28 = CGRectInset(v27, -15.0, -30.0);
  CGFloat v13 = v28.origin.x;
  CGFloat v14 = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;

  CGFloat v17 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v29.origin.double x = v13;
  v29.origin.double y = v14;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  v25.double x = v9;
  v25.double y = v11;
  if (CGRectContainsPoint(v29, v25)) {
    return 1;
  }
  double v23 = [(_UITextChoiceAccelerationBubble *)self textHighlightView];
  [v23 bounds];
  v26.double x = v19;
  v26.double y = v21;
  BOOL v24 = CGRectContainsPoint(v30, v26);

  return v24;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 locationInView:self];
  double v8 = -[_UITextChoiceAccelerationBubble optionForPoint:withEvent:](self, "optionForPoint:withEvent:", v7);
  CGFloat v9 = v8;
  if (v8)
  {
    [v8 setState:4];
    if (![v9 type] || objc_msgSend(v9, "type") == 1)
    {
      double v10 = [(_UITextChoiceAccelerationBubble *)self contentsView];
      CGFloat v11 = [v10 arrangedSubviews];
      objc_super v12 = [v11 firstObject];

      [v12 setState:4];
    }
    if ([v9 type] != 3)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
    CGFloat v13 = [(_UITextChoiceAccelerationBubble *)self sideButton];
    [v13 setState:4];
    BOOL v14 = 1;
  }
  else
  {
    [v6 locationInView:self];
    CGFloat v13 = -[_UITextChoiceAccelerationBubble dictationHighlightViewForPoint:withEvent:](self, "dictationHighlightViewForPoint:withEvent:", v7);
    BOOL v14 = v13 != 0;
  }

LABEL_10:
  return v14;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a3 locationInView:self];
  id v7 = -[_UITextChoiceAccelerationBubble optionForPoint:withEvent:](self, "optionForPoint:withEvent:", v6);
  double v8 = v7;
  if (v7)
  {
    if (![v7 state])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      CGFloat v9 = [(_UITextChoiceAccelerationBubble *)self contentsView];
      double v10 = [v9 arrangedSubviews];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            double v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (([v15 isEqual:v8] & 1) == 0) {
              [v15 setState:0];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v12);
      }

      objc_super v16 = [(_UITextChoiceAccelerationBubble *)self sideButton];
      char v17 = [v8 isEqual:v16];

      if ((v17 & 1) == 0)
      {
        double v18 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        [v18 setState:0];
      }
      [v8 setState:4];
    }
  }
  else
  {
    CGFloat v19 = [(_UITextChoiceAccelerationBubble *)self sideButton];
    [v19 setState:0];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v20 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    CGFloat v21 = [v20 arrangedSubviews];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * j) setState:0];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }
  return v8 != 0;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a3 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  if (-[_UITextChoiceAccelerationBubble pointInside:withEvent:](self, "pointInside:withEvent:", v6))
  {
    uint64_t v11 = -[_UITextChoiceAccelerationBubble optionForPoint:withEvent:](self, "optionForPoint:withEvent:", 0, v8, v10);
    uint64_t v12 = v11;
    if (v11)
    {
      [v11 setState:4];
      if (![v12 type])
      {
        uint64_t v24 = [(_UITextChoiceAccelerationBubble *)self contentsView];
        CGPoint v25 = [v24 arrangedSubviews];
        double v15 = [v25 firstObject];

        [v15 setState:4];
        [(_UITextChoiceAccelerationBubble *)self dismissWithCancel];
        goto LABEL_16;
      }
      if ([v12 type] == 1)
      {
        uint64_t v13 = [(_UITextChoiceAccelerationBubble *)self contentsView];
        BOOL v14 = [v13 arrangedSubviews];
        double v15 = [v14 firstObject];

        [v15 setState:4];
        objc_super v16 = [(_UITextChoiceAccelerationBubble *)self sideButton];
        char v17 = [v16 originalText];
        [(_UITextChoiceAccelerationBubble *)self dismissWithRevert:v17];

LABEL_16:
        goto LABEL_29;
      }
      if ([v12 type] == 6 || objc_msgSend(v12, "type") == 8)
      {
        CGPoint v26 = [v6 _authenticationMessage];
        [(_UITextChoiceAccelerationBubble *)self setAuthenticationMessage:v26];

        long long v27 = [v12 sourceCandidate];
        selectedCandidateChoice = self->_selectedCandidateChoice;
        self->_selectedCandidateChoice = v27;

        [(UIControl *)self sendActionsForControlEvents:64];
        [(_UITextChoiceAccelerationBubble *)self removeAnimated:1];
      }
      else
      {
        if ([v12 type] == 7
          && ([v12 sourceCandidate],
              long long v29 = objc_claimAutoreleasedReturnValue(),
              v29,
              v29))
        {
          long long v30 = [(_UITextChoiceAccelerationBubble *)self sideButton];
          [v30 setState:4];

          long long v31 = [v12 sourceCandidate];
          [(_UITextChoiceAccelerationBubble *)self dismissWithCandidate:v31];
        }
        else
        {
          long long v31 = [v12 textToUse];
          long long v32 = [(_UITextChoiceAccelerationBubble *)self candidate];
          long long v33 = [v32 input];

          long long v34 = [(_UITextChoiceAccelerationBubble *)self sideButton];
          [v34 setState:4];

          if (v31 && [v31 isEqualToString:v33]) {
            [(_UITextChoiceAccelerationBubble *)self dismissWithRevert:v31];
          }
          else {
            [(_UITextChoiceAccelerationBubble *)self dismissWithText:v31];
          }
        }
      }
    }
    else
    {
      [(_UITextChoiceAccelerationBubble *)self dismissWithText:0];
    }
  }
  else
  {
    double v18 = [(_UITextChoiceAccelerationBubble *)self sideButton];
    [v18 setState:0];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    CGFloat v19 = [(_UITextChoiceAccelerationBubble *)self contentsView];
    uint64_t v12 = [v19 arrangedSubviews];

    uint64_t v20 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * i) setState:0];
        }
        uint64_t v21 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v21);
    }
  }
LABEL_29:
}

- (void)removeFromSuperview
{
  v12[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];

  if (v3)
  {
    char v4 = (void *)MEMORY[0x1E4F5B268];
    id v5 = [(_UITextChoiceAccelerationBubble *)self anchorLeading];
    v12[0] = v5;
    id v6 = [(_UITextChoiceAccelerationBubble *)self anchorTop];
    v12[1] = v6;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v4 deactivateConstraints:v7];

    -[_UITextChoiceAccelerationBubble setReferenceRect:](self, "setReferenceRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  double v8 = [(_UITextChoiceAccelerationBubble *)self boundaryConstraints];

  if (v8)
  {
    double v9 = (void *)MEMORY[0x1E4F5B268];
    double v10 = [(_UITextChoiceAccelerationBubble *)self boundaryConstraints];
    [v9 deactivateConstraints:v10];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationBubble;
  [(UIView *)&v11 removeFromSuperview];
}

- (void)reset
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(UIView *)self alpha];
  if (v3 == 0.0) {
    [(_UITextChoiceAccelerationBubble *)self removeFromSuperview];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = [(_UITextChoiceAccelerationBubble *)self contentsView];
  id v5 = [v4 arrangedSubviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v9++) setState:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v10 = [(_UITextChoiceAccelerationBubble *)self sideButton];
  [v10 setState:0];

  [(_UITextChoiceAccelerationBubble *)self setCandidate:0];
  selectedChoice = self->_selectedChoice;
  self->_selectedChoice = 0;

  selectedCandidateChoice = self->_selectedCandidateChoice;
  self->_selectedCandidateChoice = 0;
}

- (void)removeAnimated:(BOOL)a3
{
  if (!self->_isDismissing)
  {
    self->_isDismissing = 1;
    if (a3)
    {
      v4[4] = self;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke;
      v5[3] = &unk_1E52D9F70;
      v5[4] = self;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke_2;
      v4[3] = &unk_1E52DC3A0;
      +[UIView animateWithDuration:v5 animations:v4 completion:0.2];
    }
    else
    {
      [(UIView *)self setAlpha:0.0];
      [(_UITextChoiceAccelerationBubble *)self reset];
      self->_isDismissing = 0;
    }
  }
}

- (void)dismissWithCancel
{
  [(_UITextChoiceAccelerationBubble *)self setShouldRejectCandidate:1];
  id v4 = [(_UITextChoiceAccelerationBubble *)self sideButton];
  double v3 = [v4 textToUse];
  [(_UITextChoiceAccelerationBubble *)self dismissWithText:v3];
}

- (void)dismissWithRevert:(id)a3
{
  id v4 = a3;
  [(_UITextChoiceAccelerationBubble *)self setShouldRejectCandidate:1];
  [(_UITextChoiceAccelerationBubble *)self dismissWithText:v4];
}

- (void)dismissWithCandidate:(id)a3
{
  id v8 = a3;
  int64_t v5 = [(_UITextChoiceAccelerationBubble *)self promptStyle];
  if (v8)
  {
    uint64_t v6 = [v8 candidate];
    selectedChoice = self->_selectedChoice;
    self->_selectedChoice = v6;

    objc_storeStrong((id *)&self->_selectedCandidateChoice, a3);
  }
  else if (v5 != 3)
  {
    [(UIControl *)self cancelTrackingWithEvent:0];
  }
  [(_UITextChoiceAccelerationBubble *)self removeAnimated:1];
}

- (void)dismissWithText:(id)a3
{
  id v7 = a3;
  int64_t v5 = [(_UITextChoiceAccelerationBubble *)self promptStyle];
  if (v7)
  {
    objc_storeStrong((id *)&self->_selectedChoice, a3);
    selectedCandidateChoice = self->_selectedCandidateChoice;
    self->_selectedCandidateChoice = 0;
  }
  else if (v5 != 3)
  {
    [(UIControl *)self cancelTrackingWithEvent:0];
  }
  [(_UITextChoiceAccelerationBubble *)self removeAnimated:1];
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 12;
}

- (int)textEffectsVisibilityLevel
{
  v2 = [(UIView *)self superview];
  int v3 = [v2 textEffectsVisibilityLevel];

  if (v3 <= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

- (UILayoutGuide)textAnchor
{
  return self->_textAnchor;
}

- (void)setTextAnchor:(id)a3
{
}

- (NSLayoutConstraint)anchorLeading
{
  return self->_anchorLeading;
}

- (void)setAnchorLeading:(id)a3
{
}

- (NSLayoutConstraint)anchorTop
{
  return self->_anchorTop;
}

- (void)setAnchorTop:(id)a3
{
}

- (NSLayoutConstraint)anchorWidth
{
  return self->_anchorWidth;
}

- (void)setAnchorWidth:(id)a3
{
}

- (NSLayoutConstraint)anchorHeight
{
  return self->_anchorHeight;
}

- (void)setAnchorHeight:(id)a3
{
}

- (NSArray)boundaryConstraints
{
  return self->_boundaryConstraints;
}

- (void)setBoundaryConstraints:(id)a3
{
}

- (NSLayoutConstraint)leadingSpacing
{
  return self->_leadingSpacing;
}

- (void)setLeadingSpacing:(id)a3
{
}

- (NSArray)belowTextConstraints
{
  return self->_belowTextConstraints;
}

- (void)setBelowTextConstraints:(id)a3
{
}

- (NSArray)aboveTextConstraints
{
  return self->_aboveTextConstraints;
}

- (void)setAboveTextConstraints:(id)a3
{
}

- (CGRect)referenceRect
{
  double x = self->_referenceRect.origin.x;
  double y = self->_referenceRect.origin.y;
  double width = self->_referenceRect.size.width;
  double height = self->_referenceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setReferenceRect:(CGRect)a3
{
  self->_referenceRect = a3;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
}

- (double)secureCandidateHeight
{
  return self->_secureCandidateHeight;
}

- (void)setSecureCandidateHeight:(double)a3
{
  self->_secureCandidateHeight = a3;
}

- (BOOL)shouldRejectCandidate
{
  return self->_shouldRejectCandidate;
}

- (void)setShouldRejectCandidate:(BOOL)a3
{
  self->_shouldRejectCandidate = a3;
}

- (_UIReplacementCandidate)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
}

- (NSString)selectedChoice
{
  return self->_selectedChoice;
}

- (TIKeyboardCandidate)selectedCandidateChoice
{
  return self->_selectedCandidateChoice;
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  return (UIView *)WeakRetained;
}

- (void)setParentView:(id)a3
{
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (CAShapeLayer)backgroundMaskLayer
{
  return self->_backgroundMaskLayer;
}

- (void)setBackgroundMaskLayer:(id)a3
{
}

- (UIStackView)contentsView
{
  return self->_contentsView;
}

- (void)setContentsView:(id)a3
{
}

- (UIScrollView)backingScrollView
{
  return self->_backingScrollView;
}

- (void)setBackingScrollView:(id)a3
{
}

- (_UITextOption)sideButton
{
  return self->_sideButton;
}

- (void)setSideButton:(id)a3
{
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (UIView)textHighlightView
{
  return self->_textHighlightView;
}

- (void)setTextHighlightView:(id)a3
{
}

- (UIDictationGlowEffect)dictationGlowEffect
{
  return self->_dictationGlowEffect;
}

- (void)setDictationGlowEffect:(id)a3
{
}

- (BOOL)needsRTLCheck
{
  return self->_needsRTLCheck;
}

- (void)setNeedsRTLCheck:(BOOL)a3
{
  self->_needsRTLCheck = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (int64_t)promptStyle
{
  return self->_promptStyle;
}

- (void)setPromptStyle:(int64_t)a3
{
  self->_promptStyle = a3;
}

- (UIColor)optionalTintColor
{
  return self->_optionalTintColor;
}

- (void)setOptionalTintColor:(id)a3
{
  self->_optionalTintColor = (UIColor *)a3;
}

- (unint64_t)labelNumber
{
  return self->_labelNumber;
}

- (void)setLabelNumber:(unint64_t)a3
{
  self->_labelNumber = a3;
}

- (_NSRange)deltaRange
{
  p_deltaRange = &self->_deltaRange;
  NSUInteger location = self->_deltaRange.location;
  NSUInteger length = p_deltaRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDeltaRange:(_NSRange)a3
{
  self->_deltaRange = a3;
}

- (_NSRange)originalSelectedRange
{
  p_originalSelectedRange = &self->_originalSelectedRange;
  NSUInteger location = self->_originalSelectedRange.location;
  NSUInteger length = p_originalSelectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setOriginalSelectedRange:(_NSRange)a3
{
  self->_originalSelectedRange = a3;
}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  return self->_authenticationMessage;
}

- (void)setAuthenticationMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationMessage, 0);
  objc_storeStrong((id *)&self->_dictationGlowEffect, 0);
  objc_storeStrong((id *)&self->_textHighlightView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_sideButton, 0);
  objc_storeStrong((id *)&self->_backingScrollView, 0);
  objc_storeStrong((id *)&self->_contentsView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong((id *)&self->_selectedCandidateChoice, 0);
  objc_storeStrong((id *)&self->_selectedChoice, 0);
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_aboveTextConstraints, 0);
  objc_storeStrong((id *)&self->_belowTextConstraints, 0);
  objc_storeStrong((id *)&self->_leadingSpacing, 0);
  objc_storeStrong((id *)&self->_boundaryConstraints, 0);
  objc_storeStrong((id *)&self->_anchorHeight, 0);
  objc_storeStrong((id *)&self->_anchorWidth, 0);
  objc_storeStrong((id *)&self->_anchorTop, 0);
  objc_storeStrong((id *)&self->_anchorLeading, 0);
  objc_storeStrong((id *)&self->_textAnchor, 0);
}

@end