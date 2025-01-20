@interface UIKBTutorialModalDisplay
- (BOOL)isPortrait;
- (BOOL)presentsFullScreen;
- (CGSize)sizeForTutorialPageView;
- (NSArray)adjustableConstraints;
- (NSArray)mediaContents;
- (NSArray)textBodyDescriptions;
- (NSArray)textTitleDescriptions;
- (NSLayoutConstraint)containerViewTopConstraits;
- (NSLayoutConstraint)widthAdjustmentConstraint;
- (NSString)buttonTitle;
- (NSString)largeTitle;
- (UIButton)button;
- (UIEdgeInsets)safeAreaInsets;
- (UIFont)largeTitleFont;
- (UIFont)textBodyFont;
- (UIFont)textTitleFont;
- (UIKBTutorialModalDisplay)initWithKeyboardAppearance:(int64_t)a3;
- (UIKBTutorialModalDisplayStyling)styling;
- (UIView)containerView;
- (UIView)mediaView;
- (UIVisualEffectView)backgroundBlurView;
- (double)containerBottomPadding;
- (double)containerTopPadding;
- (double)mediaLayoutWidthAdjustment;
- (double)pagingInterval;
- (id)constructMediaView;
- (int64_t)appearance;
- (int64_t)textBodyMaxLines;
- (void)configBackgroundBlur;
- (void)configContainerView;
- (void)containerForAlertPresentation;
- (void)containerForFullScreenView;
- (void)containerForKeyboardView;
- (void)layoutSubviews;
- (void)restartPagingAnimation;
- (void)setAdjustableConstraints:(id)a3;
- (void)setAppearance:(int64_t)a3;
- (void)setBackgroundBlurView:(id)a3;
- (void)setButton:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContainerViewTopConstraits:(id)a3;
- (void)setMediaView:(id)a3;
- (void)setStyling:(id)a3;
- (void)setWidthAdjustmentConstraint:(id)a3;
- (void)tapInsideButton:(id)a3;
- (void)updateMediaViewTextAndPlacement;
@end

@implementation UIKBTutorialModalDisplay

- (UIKBTutorialModalDisplay)initWithKeyboardAppearance:(int64_t)a3
{
  v28.receiver = self;
  v28.super_class = (Class)UIKBTutorialModalDisplay;
  v4 = [(UIView *)&v28 init];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(UIView *)v4 setBackgroundColor:v5];

    v4->_appearance = a3;
    if (a3 == 10 || !a3)
    {
      v6 = [(UIView *)v4 traitCollection];
      uint64_t v7 = [v6 userInterfaceStyle];

      uint64_t v8 = 1;
      if (v7 != 2) {
        uint64_t v8 = 2;
      }
      v4->_appearance = v8;
    }
    v9 = [[UIKBTutorialModalDisplayStyling alloc] initWithKeyboardAppearance:v4->_appearance];
    styling = v4->_styling;
    v4->_styling = v9;

    v11 = [[UIVisualEffectView alloc] initWithEffect:0];
    backgroundBlurView = v4->_backgroundBlurView;
    v4->_backgroundBlurView = v11;

    v13 = [(UIKBTutorialModalDisplayStyling *)v4->_styling backgroundEffects];
    [(UIVisualEffectView *)v4->_backgroundBlurView setBackgroundEffects:v13];

    [(UIView *)v4 addSubview:v4->_backgroundBlurView];
    v14 = objc_alloc_init(UIView);
    containerView = v4->_containerView;
    v4->_containerView = v14;

    [(UIView *)v4 addSubview:v4->_containerView];
    uint64_t v16 = [(UIKBTutorialModalDisplay *)v4 constructMediaView];
    mediaView = v4->_mediaView;
    v4->_mediaView = (UIView *)v16;

    if (v4->_mediaView) {
      -[UIView addSubview:](v4->_containerView, "addSubview:");
    }
    uint64_t v18 = +[UIButton buttonWithType:1];
    button = v4->_button;
    v4->_button = (UIButton *)v18;

    v20 = v4->_button;
    v21 = [(UIKBTutorialModalDisplay *)v4 buttonTitle];
    [(UIButton *)v20 setTitle:v21 forState:0];

    v22 = v4->_button;
    v23 = +[UIColor systemBlueColor];
    [(UIButton *)v22 setTitleColor:v23 forState:0];

    v24 = [off_1E52D39B8 boldSystemFontOfSize:18.0];
    v25 = [(UIButton *)v4->_button titleLabel];
    [v25 setFont:v24];

    [(UIControl *)v4->_button addTarget:v4 action:sel_tapInsideButton_ forControlEvents:64];
    [(UIView *)v4->_containerView addSubview:v4->_button];
    v26 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  [(UIKBTutorialModalDisplay *)self configBackgroundBlur];
  [(UIKBTutorialModalDisplay *)self configContainerView];
}

- (BOOL)isPortrait
{
  v2 = +[UIKeyboard activeKeyboard];
  BOOL v3 = (unint64_t)([v2 interfaceOrientation] - 5) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (double)containerTopPadding
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    BOOL v3 = [(UIKBTutorialModalDisplay *)self isPortrait];
    double result = 60.0;
    if (v3) {
      return 20.0;
    }
  }
  else
  {
    v5 = [(UIView *)self _rootInputWindowController];
    v6 = [v5 _inputView];
    [v6 bounds];
    double v8 = v7;
    v9 = [(UIView *)self _rootInputWindowController];
    v10 = [v9 _inputAssistantView];
    [v10 bounds];
    double v12 = v8 + v11;

    [(UIKBTutorialModalDisplay *)self safeAreaInsets];
    if (v13 <= 0.0)
    {
      v15 = [(UIView *)self _rootInputWindowController];
      uint64_t v16 = [v15 _inputAssistantView];
      if (v16)
      {
        v17 = [(UIKBTutorialModalDisplay *)self textBodyDescriptions];
        uint64_t v18 = [v17 objectAtIndex:0];
        double v14 = dbl_186B96970[(unint64_t)[v18 length] > 0xBE];
      }
      else
      {
        double v14 = 0.12;
      }
    }
    else
    {
      double v14 = 0.2;
    }
    return v12 * v14;
  }
  return result;
}

- (double)containerBottomPadding
{
  unint64_t v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  double result = 20.0;
  if (v3 != 1)
  {
    [(UIKBTutorialModalDisplay *)self safeAreaInsets];
    double result = 34.0;
    if (v5 <= 0.0) {
      return 19.0;
    }
  }
  return result;
}

- (void)configBackgroundBlur
{
  if (![(UIKBTutorialModalDisplay *)self presentsFullScreen])
  {
    [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    unint64_t v3 = [(UIView *)self _rootInputWindowController];
    v4 = [v3 _inputAccessoryView];

    double v5 = [(UIView *)self _rootInputWindowController];
    v6 = v5;
    if (v4)
    {
      double v7 = [v5 _inputAccessoryView];
LABEL_13:
      uint64_t v16 = v7;
      id v57 = [v7 topAnchor];

      BOOL v17 = +[UIKeyboardImpl isFloating];
      uint64_t v18 = [(UIView *)self _rootInputWindowController];
      v19 = v18;
      if (v17)
      {
        v20 = [v18 _inputView];

        +[UIKeyboardPopoverContainer contentInsets];
        double v22 = -fabs(v21);
        +[UIKeyboardPopoverContainer contentInsets];
        double v24 = fabs(v23);
        +[UIKeyboardPopoverContainer contentInsets];
        double v26 = -fabs(v25);
        +[UIKeyboardPopoverContainer contentInsets];
        double v28 = fabs(v27);
      }
      else
      {
        v20 = [v18 view];

        double v26 = 0.0;
        double v22 = 0.0;
        double v24 = 0.0;
        double v28 = 0.0;
      }
      v29 = [(UIView *)self topAnchor];
      v30 = [v29 constraintEqualToAnchor:v57 constant:v22];
      [v30 setActive:1];

      v31 = [(UIView *)self bottomAnchor];
      v32 = [v20 bottomAnchor];
      v33 = [v31 constraintEqualToAnchor:v32 constant:v24];
      [v33 setActive:1];

      v34 = [(UIView *)self leftAnchor];
      v35 = [v20 leftAnchor];
      v36 = [v34 constraintEqualToAnchor:v35 constant:v26];
      [v36 setActive:1];

      v37 = [(UIView *)self rightAnchor];
      v38 = [v20 rightAnchor];
      v39 = [v37 constraintEqualToAnchor:v38 constant:v28];
      [v39 setActive:1];

      v40 = [(UIKBTutorialModalDisplay *)self backgroundBlurView];
      [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

      v41 = [(UIKBTutorialModalDisplay *)self backgroundBlurView];
      v42 = [v41 bottomAnchor];
      v43 = [(UIView *)self bottomAnchor];
      v44 = [v42 constraintEqualToAnchor:v43];
      [v44 setActive:1];

      v45 = [(UIKBTutorialModalDisplay *)self backgroundBlurView];
      v46 = [v45 topAnchor];
      v47 = [(UIView *)self topAnchor];
      v48 = [v46 constraintEqualToAnchor:v47];
      [v48 setActive:1];

      v49 = [(UIKBTutorialModalDisplay *)self backgroundBlurView];
      v50 = [v49 leftAnchor];
      v51 = [(UIView *)self leftAnchor];
      v52 = [v50 constraintEqualToAnchor:v51];
      [v52 setActive:1];

      v53 = [(UIKBTutorialModalDisplay *)self backgroundBlurView];
      v54 = [v53 rightAnchor];
      v55 = [(UIView *)self rightAnchor];
      v56 = [v54 constraintEqualToAnchor:v55];
      [v56 setActive:1];

      goto LABEL_17;
    }
    double v8 = [v5 _inputAssistantView];
    uint64_t v9 = [v8 superview];
    if (v9)
    {
      v10 = (void *)v9;
      double v11 = +[UIKeyboardImpl activeInstance];
      char v12 = [v11 _showsScribbleIconsInAssistantView];

      if ((v12 & 1) == 0)
      {
        v6 = [(UIView *)self _rootInputWindowController];
        double v7 = [v6 _inputAssistantView];
        goto LABEL_13;
      }
    }
    else
    {
    }
    double v13 = [(UIView *)self _rootInputWindowController];
    double v14 = [v13 _inputView];

    v15 = [(UIView *)self _rootInputWindowController];
    v6 = v15;
    if (v14) {
      [v15 _inputView];
    }
    else {
    double v7 = [v15 view];
    }
    goto LABEL_13;
  }
  id v57 = [(UIKBTutorialModalDisplay *)self backgroundBlurView];
  [v57 removeFromSuperview];
LABEL_17:
}

- (void)configContainerView
{
  if ([(UIKBTutorialModalDisplay *)self presentsFullScreen])
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(UIKBTutorialModalDisplay *)self containerForFullScreenView];
    }
    else
    {
      [(UIKBTutorialModalDisplay *)self containerForAlertPresentation];
    }
  }
  else
  {
    [(UIKBTutorialModalDisplay *)self containerForKeyboardView];
  }
}

- (UIEdgeInsets)safeAreaInsets
{
  v2 = [(UIView *)self _rootInputWindowController];
  unint64_t v3 = [v2 view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)containerForKeyboardView
{
  v80[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(UIKBTutorialModalDisplay *)self adjustableConstraints];
  double v4 = [v3 firstObject];
  char v5 = [v4 isActive];

  if ((v5 & 1) == 0)
  {
    double v6 = [(UIKBTutorialModalDisplay *)self containerView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v7 = objc_alloc_init(UILayoutGuide);
    [(UIView *)self addLayoutGuide:v7];
    double v8 = [(UILayoutGuide *)v7 widthAnchor];
    uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    double v10 = 320.0;
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v10 = 448.0;
    }
    double v11 = [v8 constraintEqualToConstant:v10];
    [v11 setActive:1];

    double v12 = [(UIKBTutorialModalDisplay *)self containerView];
    double v13 = [v12 widthAnchor];
    double v14 = [(UILayoutGuide *)v7 widthAnchor];
    [(UIKBTutorialModalDisplay *)self mediaLayoutWidthAdjustment];
    uint64_t v16 = [v13 constraintEqualToAnchor:v14 multiplier:1.0 constant:v15];
    [(UIKBTutorialModalDisplay *)self setWidthAdjustmentConstraint:v16];

    BOOL v17 = [(UIKBTutorialModalDisplay *)self widthAdjustmentConstraint];
    [v17 setActive:1];

    uint64_t v18 = [(UIKBTutorialModalDisplay *)self containerView];
    v19 = [v18 centerXAnchor];
    v20 = [(UIView *)self centerXAnchor];
    double v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    double v22 = [(UIKBTutorialModalDisplay *)self containerView];
    double v23 = [v22 topAnchor];
    double v24 = [(UIView *)self topAnchor];
    double v25 = [v23 constraintEqualToAnchor:v24];
    [(UIKBTutorialModalDisplay *)self setContainerViewTopConstraits:v25];

    double v26 = [(UIKBTutorialModalDisplay *)self containerViewTopConstraits];
    [v26 setActive:1];

    double v27 = [(UIView *)self safeAreaLayoutGuide];
    double v28 = [v27 bottomAnchor];
    v29 = [(UIKBTutorialModalDisplay *)self containerView];
    v30 = [v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [(UIKBTutorialModalDisplay *)self button];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = [(UIKBTutorialModalDisplay *)self button];
    v34 = [v33 centerXAnchor];
    v35 = [(UIKBTutorialModalDisplay *)self containerView];
    v36 = [v35 centerXAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    [v37 setActive:1];

    v38 = [(UIKBTutorialModalDisplay *)self button];
    v39 = [v38 widthAnchor];
    v40 = [(UIKBTutorialModalDisplay *)self containerView];
    v41 = [v40 widthAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 multiplier:0.7];
    [v42 setActive:1];

    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v43 = 50.0;
    }
    else {
      double v43 = 21.0;
    }
    v44 = [(UIKBTutorialModalDisplay *)self button];
    v45 = [v44 heightAnchor];
    v46 = [v45 constraintEqualToConstant:v43];
    [v46 setActive:1];

    double v47 = 0.0;
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      [(UIKBTutorialModalDisplay *)self safeAreaInsets];
      if (v48 <= 0.0) {
        double v47 = 23.0;
      }
      else {
        double v47 = 0.0;
      }
    }
    v49 = [(UIKBTutorialModalDisplay *)self containerView];
    v50 = [v49 bottomAnchor];
    v51 = [(UIKBTutorialModalDisplay *)self button];
    v52 = [v51 bottomAnchor];
    v53 = [v50 constraintEqualToAnchor:v52 constant:v47];
    [v53 setActive:1];

    v54 = [(UIKBTutorialModalDisplay *)self mediaView];
    [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

    v55 = [(UIKBTutorialModalDisplay *)self mediaView];
    v56 = [v55 centerXAnchor];
    id v57 = [(UIKBTutorialModalDisplay *)self containerView];
    v58 = [v57 centerXAnchor];
    v59 = [v56 constraintEqualToAnchor:v58];
    [v59 setActive:1];

    v60 = [(UIKBTutorialModalDisplay *)self mediaView];
    v61 = [v60 topAnchor];
    v62 = [(UIKBTutorialModalDisplay *)self containerView];
    v63 = [v62 topAnchor];
    v64 = [v61 constraintEqualToAnchor:v63];
    [v64 setActive:1];

    v65 = [(UIKBTutorialModalDisplay *)self button];
    LODWORD(v61) = [v65 isHidden];

    if (v61)
    {
      v66 = [(UIKBTutorialModalDisplay *)self mediaView];
      v67 = [v66 bottomAnchor];
      v68 = [(UIView *)self bottomAnchor];
      v69 = [v67 constraintEqualToAnchor:v68];
      v80[0] = v69;
      v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
      [(UIKBTutorialModalDisplay *)self setAdjustableConstraints:v70];
    }
    else
    {
      v66 = [(UIKBTutorialModalDisplay *)self button];
      v67 = [v66 topAnchor];
      v68 = [(UIKBTutorialModalDisplay *)self mediaView];
      v69 = [v68 bottomAnchor];
      v70 = [v67 constraintGreaterThanOrEqualToAnchor:v69];
      v79 = v70;
      v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      [(UIKBTutorialModalDisplay *)self setAdjustableConstraints:v71];
    }
    v72 = (void *)MEMORY[0x1E4F5B268];
    v73 = [(UIKBTutorialModalDisplay *)self adjustableConstraints];
    [v72 activateConstraints:v73];

    v74 = [(UIKBTutorialModalDisplay *)self mediaView];
    v75 = [v74 widthAnchor];
    v76 = [(UIKBTutorialModalDisplay *)self containerView];
    v77 = [v76 widthAnchor];
    v78 = [v75 constraintEqualToAnchor:v77];
    [v78 setActive:1];
  }
}

- (void)containerForFullScreenView
{
  v118[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(UIKBTutorialModalDisplay *)self containerView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v4 = [(UIKBTutorialModalDisplay *)self containerView];
  char v5 = [v4 leadingAnchor];
  double v6 = [(UIView *)self leadingAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  double v8 = [(UIView *)self trailingAnchor];
  double v9 = [(UIKBTutorialModalDisplay *)self containerView];
  double v10 = [v9 trailingAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  double v12 = [(UIKBTutorialModalDisplay *)self containerView];
  double v13 = [v12 topAnchor];
  double v14 = [(UIView *)self topAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  uint64_t v16 = [(UIView *)self bottomAnchor];
  BOOL v17 = [(UIKBTutorialModalDisplay *)self containerView];
  uint64_t v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = objc_alloc_init(UILayoutGuide);
  [(UIView *)self addLayoutGuide:"addLayoutGuide:"];
  double v21 = objc_alloc_init(UILabel);
  [(UIView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v22 = [(UIKBTutorialModalDisplay *)self largeTitleFont];
  [(UILabel *)v21 setFont:v22];

  double v23 = [(UIKBTutorialModalDisplay *)self largeTitle];
  [(UILabel *)v21 setText:v23];

  [(UILabel *)v21 setTextAlignment:1];
  [(UILabel *)v21 setAdjustsFontSizeToFitWidth:1];
  double v24 = [(UIKBTutorialModalDisplay *)self containerView];
  [v24 addSubview:v21];

  v89 = (void *)MEMORY[0x1E4F5B268];
  v108 = [(UILayoutGuide *)v20 topAnchor];
  v111 = [(UIKBTutorialModalDisplay *)self containerView];
  v105 = [v111 topAnchor];
  v102 = [v108 constraintEqualToAnchor:v105];
  v118[0] = v102;
  v114 = v20;
  v96 = [(UILayoutGuide *)v20 heightAnchor];
  v99 = [(UIKBTutorialModalDisplay *)self containerView];
  v93 = [v99 heightAnchor];
  v91 = [v96 constraintEqualToAnchor:v93 multiplier:0.09];
  v118[1] = v91;
  v87 = [(UIView *)v21 topAnchor];
  v85 = [(UILayoutGuide *)v20 bottomAnchor];
  v83 = [v87 constraintEqualToAnchor:v85 constant:8.0];
  v118[2] = v83;
  v115 = v21;
  double v25 = [(UIView *)v21 leadingAnchor];
  double v26 = [(UIKBTutorialModalDisplay *)self containerView];
  double v27 = [v26 leadingAnchor];
  double v28 = [v25 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:1.0];
  v118[3] = v28;
  v29 = [(UIKBTutorialModalDisplay *)self containerView];
  v30 = [v29 trailingAnchor];
  v31 = [(UIView *)v21 trailingAnchor];
  v32 = [v30 constraintEqualToSystemSpacingAfterAnchor:v31 multiplier:1.0];
  v118[4] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:5];
  [v89 activateConstraints:v33];

  v34 = [(UIKBTutorialModalDisplay *)self mediaView];
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

  v97 = (void *)MEMORY[0x1E4F5B268];
  v112 = [(UIKBTutorialModalDisplay *)self mediaView];
  v109 = [v112 topAnchor];
  v106 = [(UIView *)v115 bottomAnchor];
  v103 = [v109 constraintEqualToAnchor:v106];
  v117[0] = v103;
  v100 = [(UIKBTutorialModalDisplay *)self mediaView];
  v94 = [v100 leadingAnchor];
  v35 = [(UIKBTutorialModalDisplay *)self containerView];
  v36 = [v35 leadingAnchor];
  v37 = [v94 constraintEqualToAnchor:v36];
  v117[1] = v37;
  v38 = [(UIKBTutorialModalDisplay *)self containerView];
  v39 = [v38 trailingAnchor];
  v40 = [(UIKBTutorialModalDisplay *)self mediaView];
  v41 = [v40 trailingAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  v117[2] = v42;
  double v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:3];
  [v97 activateConstraints:v43];

  v44 = [(UIKBTutorialModalDisplay *)self button];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

  v45 = [(UIKBTutorialModalDisplay *)self button];
  v46 = [v45 widthAnchor];
  double v47 = [v46 constraintEqualToConstant:327.0];

  LODWORD(v48) = 1148829696;
  v49 = v47;
  v82 = v47;
  [v47 setPriority:v48];
  v50 = objc_alloc_init(UILayoutGuide);
  [(UIView *)self addLayoutGuide:v50];
  v51 = objc_alloc_init(UILayoutGuide);
  [(UIView *)self addLayoutGuide:v51];
  v77 = (void *)MEMORY[0x1E4F5B268];
  v110 = [(UILayoutGuide *)v51 widthAnchor];
  v104 = [(UILayoutGuide *)v50 widthAnchor];
  v101 = [v110 constraintEqualToAnchor:v104 multiplier:1.0];
  v116[0] = v101;
  v113 = v50;
  v95 = [(UILayoutGuide *)v50 leadingAnchor];
  v98 = [(UIKBTutorialModalDisplay *)self containerView];
  v92 = [v98 leadingAnchor];
  v90 = [v95 constraintEqualToSystemSpacingAfterAnchor:v92 multiplier:1.0];
  v116[1] = v90;
  v88 = [(UIKBTutorialModalDisplay *)self button];
  v86 = [v88 leadingAnchor];
  v84 = [(UILayoutGuide *)v50 trailingAnchor];
  v81 = [v86 constraintEqualToAnchor:v84];
  v116[2] = v81;
  v107 = v51;
  v79 = [(UILayoutGuide *)v51 leadingAnchor];
  v80 = [(UIKBTutorialModalDisplay *)self button];
  v78 = [v80 trailingAnchor];
  v76 = [v79 constraintEqualToAnchor:v78];
  v116[3] = v76;
  v75 = [(UIKBTutorialModalDisplay *)self containerView];
  v74 = [v75 trailingAnchor];
  v73 = [(UILayoutGuide *)v51 trailingAnchor];
  v72 = [v74 constraintEqualToSystemSpacingAfterAnchor:v73 multiplier:1.0];
  v116[4] = v72;
  v71 = [(UIKBTutorialModalDisplay *)self button];
  v70 = [v71 heightAnchor];
  v69 = [v70 constraintEqualToConstant:50.0];
  v116[5] = v69;
  v68 = [(UIKBTutorialModalDisplay *)self button];
  v67 = [v68 topAnchor];
  v52 = [(UIKBTutorialModalDisplay *)self mediaView];
  v53 = [v52 bottomAnchor];
  v54 = [v67 constraintEqualToAnchor:v53 constant:128.0];
  v116[6] = v54;
  v55 = [(UIKBTutorialModalDisplay *)self containerView];
  v56 = [v55 bottomAnchor];
  id v57 = [(UIKBTutorialModalDisplay *)self button];
  v58 = [v57 bottomAnchor];
  v59 = [v56 constraintEqualToAnchor:v58 constant:55.0];
  v116[7] = v59;
  v116[8] = v49;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:9];
  [v77 activateConstraints:v60];

  v61 = [(UIKBTutorialModalDisplay *)self styling];
  v62 = [v61 buttonTextColor];
  v63 = [(UIKBTutorialModalDisplay *)self button];
  [v63 setBackgroundColor:v62];

  v64 = [(UIKBTutorialModalDisplay *)self button];
  v65 = +[UIColor systemWhiteColor];
  [v64 setTitleColor:v65 forState:0];

  v66 = [(UIKBTutorialModalDisplay *)self button];
  [v66 _setContinuousCornerRadius:14.0];
}

- (void)containerForAlertPresentation
{
  unint64_t v3 = [(UIKBTutorialModalDisplay *)self containerView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v4 = [(UIKBTutorialModalDisplay *)self containerView];
  char v5 = [v4 leadingAnchor];
  double v6 = [(UIView *)self leadingAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  double v8 = [(UIView *)self trailingAnchor];
  double v9 = [(UIKBTutorialModalDisplay *)self containerView];
  double v10 = [v9 trailingAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  double v12 = [(UIKBTutorialModalDisplay *)self containerView];
  double v13 = [v12 topAnchor];
  double v14 = [(UIView *)self topAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
  [v15 setActive:1];

  uint64_t v16 = [(UIView *)self bottomAnchor];
  BOOL v17 = [(UIKBTutorialModalDisplay *)self containerView];
  uint64_t v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18 constant:0.0];
  [v19 setActive:1];

  v20 = [(UIKBTutorialModalDisplay *)self mediaView];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v21 = [(UIKBTutorialModalDisplay *)self mediaView];
  double v22 = [v21 topAnchor];
  double v23 = [(UIKBTutorialModalDisplay *)self containerView];
  double v24 = [v23 topAnchor];
  double v25 = [v22 constraintEqualToAnchor:v24 constant:0.0];
  [v25 setActive:1];

  double v26 = [(UIKBTutorialModalDisplay *)self mediaView];
  double v27 = [v26 leadingAnchor];
  double v28 = [(UIKBTutorialModalDisplay *)self containerView];
  v29 = [v28 leadingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(UIKBTutorialModalDisplay *)self containerView];
  v32 = [v31 trailingAnchor];
  v33 = [(UIKBTutorialModalDisplay *)self mediaView];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [(UIKBTutorialModalDisplay *)self button];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

  v37 = [(UIKBTutorialModalDisplay *)self button];
  v38 = [v37 leadingAnchor];
  v39 = [(UIKBTutorialModalDisplay *)self containerView];
  v40 = [v39 leadingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [(UIKBTutorialModalDisplay *)self button];
  double v43 = [v42 trailingAnchor];
  v44 = [(UIKBTutorialModalDisplay *)self containerView];
  v45 = [v44 trailingAnchor];
  v46 = [v43 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  double v47 = [(UIKBTutorialModalDisplay *)self button];
  double v48 = [v47 heightAnchor];
  v49 = [v48 constraintEqualToConstant:50.0];
  [v49 setActive:1];

  v50 = [(UIKBTutorialModalDisplay *)self button];
  v51 = [v50 topAnchor];
  v52 = [(UIKBTutorialModalDisplay *)self mediaView];
  v53 = [v52 bottomAnchor];
  v54 = [v51 constraintEqualToAnchor:v53 constant:0.0];
  [v54 setActive:1];

  v55 = [(UIKBTutorialModalDisplay *)self containerView];
  v56 = [v55 bottomAnchor];
  id v57 = [(UIKBTutorialModalDisplay *)self button];
  v58 = [v57 bottomAnchor];
  v59 = [v56 constraintEqualToAnchor:v58 constant:0.0];
  [v59 setActive:1];

  id v62 = [(UIKBTutorialModalDisplay *)self button];
  v60 = [(UIKBTutorialModalDisplay *)self styling];
  v61 = [v60 buttonTextColor];
  [v62 setTitleColor:v61 forState:0];
}

- (CGSize)sizeForTutorialPageView
{
  unint64_t v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  BOOL v4 = [(UIKBTutorialModalDisplay *)self isPortrait];
  double v5 = 201.6;
  if (!v4) {
    double v5 = 246.4;
  }
  double v6 = 160.0;
  if (!v4) {
    double v6 = 96.0;
  }
  double v7 = 320.0;
  if (v3 == 1) {
    double v7 = 448.0;
  }
  else {
    double v5 = v6;
  }
  result.height = v5;
  result.width = v7;
  return result;
}

- (void)updateMediaViewTextAndPlacement
{
  unint64_t v3 = [(UIKBTutorialModalDisplay *)self mediaView];

  if (v3)
  {
    [(UIKBTutorialModalDisplay *)self mediaLayoutWidthAdjustment];
    double v5 = v4;
    double v6 = [(UIKBTutorialModalDisplay *)self widthAdjustmentConstraint];
    [v6 setConstant:v5];

    double v7 = [(UIKBTutorialModalDisplay *)self mediaView];
    id v49 = [v7 pageViews];

    uint64_t v8 = [v49 count];
    double v9 = v49;
    if (v8)
    {
      for (unint64_t i = 0; i < v37; ++i)
      {
        double v11 = [v9 objectAtIndex:i];
        double v12 = [(UIKBTutorialModalDisplay *)self textTitleDescriptions];
        double v13 = [v12 objectAtIndex:i];
        uint64_t v14 = [v13 length];

        if (v14)
        {
          double v15 = [(UIKBTutorialModalDisplay *)self textTitleDescriptions];
          uint64_t v16 = [v15 objectAtIndex:i];
          BOOL v17 = [v11 textTitle];
          [v17 setText:v16];

          uint64_t v18 = [(UIKBTutorialModalDisplay *)self textTitleFont];
          v19 = [v11 textTitle];
          [v19 setFont:v18];

          v20 = [(UIKBTutorialModalDisplay *)self styling];
          double v21 = [v20 mainTextColor];
          double v22 = [v11 textTitle];
          [v22 setTextColor:v21];
        }
        else
        {
          v20 = [v11 textTitle];
          [v20 setText:&stru_1ED0E84C0];
        }

        double v23 = [(UIKBTutorialModalDisplay *)self textBodyDescriptions];
        double v24 = [v23 objectAtIndex:i];
        uint64_t v25 = [v24 length];

        if (v25)
        {
          double v26 = [(UIKBTutorialModalDisplay *)self textBodyDescriptions];
          double v27 = [v26 objectAtIndex:i];
          double v28 = [v11 textBody];
          [v28 setText:v27];

          v29 = [(UIKBTutorialModalDisplay *)self textBodyFont];
          v30 = [v11 textBody];
          [v30 setFont:v29];

          v31 = [(UIKBTutorialModalDisplay *)self styling];
          v32 = [v31 mainTextColor];
          v33 = [v11 textBody];
          [v33 setTextColor:v32];

          int64_t v34 = [(UIKBTutorialModalDisplay *)self textBodyMaxLines];
          v35 = [v11 textBody];
          [v35 setNumberOfLines:v34];

          v36 = [v11 textBody];
          [v36 setAdjustsFontSizeToFitWidth:1];
        }
        else
        {
          v36 = [v11 textBody];
          [v36 setText:&stru_1ED0E84C0];
        }

        [v11 setNeedsLayout];
        unint64_t v37 = [v49 count];
        double v9 = v49;
      }
    }
    v38 = (void *)MEMORY[0x1E4F5B268];
    v39 = [(UIKBTutorialModalDisplay *)self adjustableConstraints];
    [v38 deactivateConstraints:v39];

    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v41 = [(UIKBTutorialModalDisplay *)self button];
    char v42 = [v41 isHidden];

    if (v42)
    {
      double v43 = [(UIKBTutorialModalDisplay *)self mediaView];
      v44 = [v43 bottomAnchor];
      v45 = [(UIView *)self bottomAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      [v40 addObject:v46];
    }
    else
    {
      double v43 = [(UIKBTutorialModalDisplay *)self button];
      v44 = [v43 topAnchor];
      v45 = [(UIKBTutorialModalDisplay *)self mediaView];
      v46 = [v45 bottomAnchor];
      double v47 = [v44 constraintGreaterThanOrEqualToAnchor:v46];
      [v40 addObject:v47];
    }
    [MEMORY[0x1E4F5B268] activateConstraints:v40];
    [(UIKBTutorialModalDisplay *)self setAdjustableConstraints:v40];
    double v48 = [(UIKBTutorialModalDisplay *)self mediaView];
    [v48 layoutIfNeeded];
  }
}

- (id)constructMediaView
{
  unint64_t v3 = [(UIKBTutorialModalDisplay *)self mediaContents];
  uint64_t v4 = [v3 count];
  double v5 = [(UIKBTutorialModalDisplay *)self textTitleDescriptions];
  if (v4 != [v5 count])
  {
    v39 = 0;
LABEL_15:

    goto LABEL_17;
  }
  uint64_t v6 = [v3 count];
  double v7 = [(UIKBTutorialModalDisplay *)self textBodyDescriptions];
  uint64_t v8 = [v7 count];

  if (v6 == v8)
  {
    double v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    if ([v3 count])
    {
      unint64_t v9 = 0;
      do
      {
        double v10 = [UIKBTutorialSinglePageView alloc];
        double v11 = [v3 objectAtIndex:v9];
        double v12 = [(UIKBTutorialSinglePageView *)v10 initWithImageView:v11];

        double v13 = [(UIKBTutorialModalDisplay *)self textTitleDescriptions];
        uint64_t v14 = [v13 objectAtIndex:v9];
        uint64_t v15 = [v14 length];

        if (v15)
        {
          uint64_t v16 = [(UIKBTutorialModalDisplay *)self textTitleDescriptions];
          BOOL v17 = [v16 objectAtIndex:v9];
          uint64_t v18 = [(UIKBTutorialSinglePageView *)v12 textTitle];
          [v18 setText:v17];

          v19 = [(UIKBTutorialModalDisplay *)self textTitleFont];
          v20 = [(UIKBTutorialSinglePageView *)v12 textTitle];
          [v20 setFont:v19];

          double v21 = [(UIKBTutorialModalDisplay *)self styling];
          double v22 = [v21 mainTextColor];
          double v23 = [(UIKBTutorialSinglePageView *)v12 textTitle];
          [v23 setTextColor:v22];
        }
        double v24 = [(UIKBTutorialModalDisplay *)self textBodyDescriptions];
        uint64_t v25 = [v24 objectAtIndex:v9];
        uint64_t v26 = [v25 length];

        if (v26)
        {
          double v27 = [(UIKBTutorialModalDisplay *)self textBodyDescriptions];
          double v28 = [v27 objectAtIndex:v9];
          v29 = [(UIKBTutorialSinglePageView *)v12 textBody];
          [v29 setText:v28];

          v30 = [(UIKBTutorialModalDisplay *)self textBodyFont];
          v31 = [(UIKBTutorialSinglePageView *)v12 textBody];
          [v31 setFont:v30];

          v32 = [(UIKBTutorialModalDisplay *)self styling];
          v33 = [v32 mainTextColor];
          int64_t v34 = [(UIKBTutorialSinglePageView *)v12 textBody];
          [v34 setTextColor:v33];

          int64_t v35 = [(UIKBTutorialModalDisplay *)self textBodyMaxLines];
          v36 = [(UIKBTutorialSinglePageView *)v12 textBody];
          [v36 setNumberOfLines:v35];

          unint64_t v37 = [(UIKBTutorialSinglePageView *)v12 textBody];
          [v37 setAdjustsFontSizeToFitWidth:1];
        }
        if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
          && [(UIKBTutorialModalDisplay *)self presentsFullScreen])
        {
          [(UIKBTutorialSinglePageView *)v12 setUseAlertStyle:1];
        }
        [v5 addObject:v12];

        ++v9;
      }
      while (v9 < [v3 count]);
    }
    v38 = [UIKBTutorialMultipageView alloc];
    [(UIKBTutorialModalDisplay *)self pagingInterval];
    v39 = -[UIKBTutorialMultipageView initWithPageViews:pagingInterval:](v38, "initWithPageViews:pagingInterval:", v5);
    goto LABEL_15;
  }
  v39 = 0;
LABEL_17:

  return v39;
}

- (void)tapInsideButton:(id)a3
{
  uint64_t v4 = [(UIView *)self superview];

  if (v4)
  {
    [(UIKBTutorialModalDisplay *)self extraButtonTapAction];
    [(UIView *)self removeFromSuperview];
  }
}

- (void)restartPagingAnimation
{
  unint64_t v3 = [(UIKBTutorialModalDisplay *)self mediaView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKBTutorialModalDisplay *)self mediaView];
    [v5 resetPageScrolling];
  }
}

- (NSString)buttonTitle
{
  return (NSString *)_UILocalizedStringInSystemLanguage(@"Continue", @"Continue");
}

- (NSArray)textTitleDescriptions
{
  return (NSArray *)&unk_1ED3EFB48;
}

- (UIFont)textTitleFont
{
  v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleBody" addingSymbolicTraits:2 options:2];
  unint64_t v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return (UIFont *)v3;
}

- (NSArray)textBodyDescriptions
{
  return (NSArray *)&unk_1ED3EFB60;
}

- (UIFont)textBodyFont
{
  return (UIFont *)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
}

- (NSString)largeTitle
{
  return (NSString *)@"Title";
}

- (UIFont)largeTitleFont
{
  v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleTitle0" addingSymbolicTraits:2 options:2];
  unint64_t v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return (UIFont *)v3;
}

- (BOOL)presentsFullScreen
{
  return 0;
}

- (NSArray)mediaContents
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [UIImageView alloc];
  unint64_t v3 = _UIImageWithName(@"globe_tutorial-light");
  char v4 = [(UIImageView *)v2 initWithImage:v3];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return (NSArray *)v5;
}

- (double)pagingInterval
{
  return 0.0;
}

- (double)mediaLayoutWidthAdjustment
{
  return 0.0;
}

- (int64_t)textBodyMaxLines
{
  return 0;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)mediaView
{
  return self->_mediaView;
}

- (void)setMediaView:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (UIKBTutorialModalDisplayStyling)styling
{
  return self->_styling;
}

- (void)setStyling:(id)a3
{
}

- (UIVisualEffectView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
}

- (NSLayoutConstraint)containerViewTopConstraits
{
  return self->_containerViewTopConstraits;
}

- (void)setContainerViewTopConstraits:(id)a3
{
}

- (NSArray)adjustableConstraints
{
  return self->_adjustableConstraints;
}

- (void)setAdjustableConstraints:(id)a3
{
}

- (NSLayoutConstraint)widthAdjustmentConstraint
{
  return self->_widthAdjustmentConstraint;
}

- (void)setWidthAdjustmentConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthAdjustmentConstraint, 0);
  objc_storeStrong((id *)&self->_adjustableConstraints, 0);
  objc_storeStrong((id *)&self->_containerViewTopConstraits, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_styling, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end