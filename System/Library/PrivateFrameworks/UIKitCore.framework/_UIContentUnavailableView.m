@interface _UIContentUnavailableView
+ (_UIContentUnavailableView)allocWithZone:(_NSZone *)a3;
- (BOOL)_hasVibrantButton;
- (BOOL)_hasVibrantText;
- (CGColor)_colorForButtonForStyle:(unint64_t)a3 controlState:(unint64_t)a4;
- (CGSize)_buttonSize;
- (NSString)buttonTitle;
- (NSString)message;
- (NSString)title;
- (UIEdgeInsets)_buttonContentEdgeInsets;
- (_UIContentUnavailableView)initWithFrame:(CGRect)a3;
- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5;
- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6;
- (double)_buttonAlpha;
- (double)_buttonVerticalSpacing;
- (double)_labelAlpha;
- (double)_labelVerticalSpacing;
- (id)_actionButton;
- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4;
- (id)_buttonFont;
- (id)_buttonTextStyle;
- (id)_flatTextColor;
- (id)_messageLabel;
- (id)_messageTextStyle;
- (id)_titleFont;
- (id)_titleLabel;
- (id)_vibrantBaseColor;
- (id)buttonAction;
- (id)preferredFocusedView;
- (unint64_t)vibrantOptions;
- (void)_actionButtonPressed:(id)a3;
- (void)_rebuildConstraints;
- (void)_updateForCurrentContentSizeCategory;
- (void)_updateViewHierarchy;
- (void)cleanupLingeringRotationState;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setButtonAction:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVibrantOptions:(unint64_t)a3;
- (void)updateConstraints;
- (void)windowWillAnimateRotateNotification:(id)a3;
- (void)windowWillRotateNotification:(id)a3;
@end

@implementation _UIContentUnavailableView

- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v99[1] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  if (!a5 && v6)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIContentUnavailableView.m" lineNumber:138 description:@"UIContentUnavailableStyleAutomatic does not currently support backdrops"];
  }
  v16 = +[UIDevice currentDevice];
  if ([v16 userInterfaceIdiom] == 1) {
    double v17 = 184.0;
  }
  else {
    double v17 = 60.0;
  }

  [(_UIContentUnavailableView *)self _labelVerticalSpacing];
  double v19 = v18;
  v100.origin.double x = x;
  v100.origin.double y = y;
  v100.size.CGFloat width = width;
  v100.size.CGFloat height = height;
  double v20 = CGRectGetWidth(v100);
  if (v20 >= v17) {
    double v21 = v20;
  }
  else {
    double v21 = v17;
  }
  v101.origin.double x = x;
  v101.origin.double y = y;
  v101.size.CGFloat width = v21;
  v101.size.CGFloat height = height;
  double v22 = CGRectGetHeight(v101);
  if (v22 >= v19) {
    double v23 = v22;
  }
  else {
    double v23 = v19;
  }
  v98.receiver = self;
  v98.super_class = (Class)_UIContentUnavailableView;
  v24 = -[UIView initWithFrame:](&v98, sel_initWithFrame_, x, y, v21, v23);
  v25 = v24;
  if (v24)
  {
    v24->_style = a5;
    uint64_t v26 = [v14 copy];
    title = v25->_title;
    v25->_title = (NSString *)v26;

    [(UIView *)v25 setAutoresizingMask:18];
    v28 = [UIScrollView alloc];
    [(UIView *)v25 bounds];
    uint64_t v29 = -[UIScrollView initWithFrame:](v28, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v102), 100.0);
    scrollView = v25->_scrollView;
    v25->_scrollView = (UIScrollView *)v29;

    [(UIView *)v25->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v25->_scrollView setClipsToBounds:0];
    [(UIScrollView *)v25->_scrollView _setApplyVerticalSafeAreaInsetsToNonscrollingContent:1];
    v31 = [UIView alloc];
    [(UIView *)v25 bounds];
    uint64_t v32 = -[UIView initWithFrame:](v31, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v103), 100.0);
    containerView = v25->_containerView;
    v25->_containerView = (UIView *)v32;

    [(UIView *)v25->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v25->_scrollView addSubview:v25->_containerView];
    if (v6)
    {
      v34 = [[_UIBackdropView alloc] initWithPrivateStyle:2030];
      backdrop = v25->_backdrop;
      v25->_backdrop = v34;

      [(UIView *)v25->_backdrop setUserInteractionEnabled:1];
      [(UIView *)v25 addSubview:v25->_backdrop];
      v36 = [(UIView *)v25->_backdrop topAnchor];
      v37 = [(UIView *)v25 topAnchor];
      v38 = [v36 constraintEqualToAnchor:v37];
      [(UIView *)v25 addConstraint:v38];

      v39 = [(UIView *)v25->_backdrop leftAnchor];
      v40 = [(UIView *)v25 leftAnchor];
      v41 = [v39 constraintEqualToAnchor:v40];
      [(UIView *)v25 addConstraint:v41];

      v42 = [(UIView *)v25->_backdrop bottomAnchor];
      v43 = [(UIView *)v25 bottomAnchor];
      v44 = [v42 constraintEqualToAnchor:v43];
      [(UIView *)v25 addConstraint:v44];

      v45 = [(UIView *)v25->_backdrop rightAnchor];
      v46 = [(UIView *)v25 rightAnchor];
      v47 = [v45 constraintEqualToAnchor:v46];
      [(UIView *)v25 addConstraint:v47];

      v48 = [(_UIBackdropView *)v25->_backdrop contentView];
    }
    else
    {
      v48 = v25;
    }
    v49 = v48;
    [(UIView *)v48 _setHostsLayoutEngine:1];
    [(UIView *)v49 addSubview:v25->_scrollView];
    v50 = [(UIView *)v25->_containerView topAnchor];
    v51 = [(UIView *)v25->_scrollView topAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [(UIView *)v49 addConstraint:v52];

    v53 = [(UIView *)v25->_containerView bottomAnchor];
    v54 = [(UIView *)v25->_scrollView bottomAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    [(UIView *)v49 addConstraint:v55];

    v56 = [(UIView *)v25->_scrollView leadingAnchor];
    v57 = [(UIView *)v25->_containerView leadingAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    [(UIView *)v49 addConstraint:v58];

    v59 = [(UIView *)v25->_scrollView trailingAnchor];
    v60 = [(UIView *)v25->_containerView trailingAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];
    [(UIView *)v49 addConstraint:v61];

    v62 = [(UIView *)v25->_containerView centerXAnchor];
    v63 = [(UIView *)v25->_scrollView centerXAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    [(UIView *)v49 addConstraint:v64];

    v65 = [(UIView *)v25->_scrollView heightAnchor];
    v66 = [(UIView *)v49 heightAnchor];
    v67 = [v65 constraintLessThanOrEqualToAnchor:v66];
    [(UIView *)v49 addConstraint:v67];

    v68 = [(UIView *)v25->_scrollView heightAnchor];
    v69 = [(UIView *)v25->_containerView heightAnchor];
    v70 = [v68 constraintEqualToAnchor:v69 constant:0.0];

    LODWORD(v71) = 1144750080;
    [v70 setPriority:v71];
    [(UIView *)v49 addConstraint:v70];
    v72 = [MEMORY[0x1E4F5B268] constraintWithItem:v25->_scrollView attribute:9 relatedBy:0 toItem:v49 attribute:9 multiplier:1.0 constant:0.0];

    LODWORD(v73) = 1144750080;
    [v72 setPriority:v73];
    [(UIView *)v49 addConstraint:v72];
    v74 = [MEMORY[0x1E4F5B268] constraintWithItem:v25->_scrollView attribute:10 relatedBy:0 toItem:v49 attribute:10 multiplier:1.0 constant:0.0];

    LODWORD(v75) = 1144750080;
    [v74 setPriority:v75];
    [(UIView *)v49 addConstraint:v74];
    v76 = +[UIDevice currentDevice];
    uint64_t v77 = [v76 userInterfaceIdiom];

    v78 = (void *)MEMORY[0x1E4F5B268];
    v79 = v25->_scrollView;
    if (v77 == 1)
    {
      v80 = _NSDictionaryOfVariableBindings(&cfstr_Scrollview_1.isa, v79, 0);
      v81 = [v78 constraintsWithVisualFormat:@"H:[_scrollView(>=124,<=418)]" options:0 metrics:0 views:v80];

      [(UIView *)v49 addConstraints:v81];
      v82 = (void *)MEMORY[0x1E4F5B268];
      v83 = v25->_scrollView;
      v84 = [(UIView *)v49 safeAreaLayoutGuide];
      v85 = [v82 constraintWithItem:v83 attribute:5 relatedBy:1 toItem:v84 attribute:5 multiplier:1.0 constant:30.0];

      [(UIView *)v49 addConstraint:v85];
      v86 = (void *)MEMORY[0x1E4F5B268];
      v87 = v25->_scrollView;
      v88 = [(UIView *)v49 safeAreaLayoutGuide];
      v89 = [v86 constraintWithItem:v87 attribute:6 relatedBy:-1 toItem:v88 attribute:6 multiplier:1.0 constant:-30.0];

      [(UIView *)v49 addConstraint:v89];
    }
    else
    {
      v90 = [(UIView *)v49 safeAreaLayoutGuide];
      v91 = [v78 constraintWithItem:v79 attribute:5 relatedBy:0 toItem:v90 attribute:5 multiplier:1.0 constant:29.0];

      [(UIView *)v49 addConstraint:v91];
      v92 = (void *)MEMORY[0x1E4F5B268];
      v93 = v25->_scrollView;
      v94 = [(UIView *)v49 safeAreaLayoutGuide];
      v89 = [v92 constraintWithItem:v93 attribute:6 relatedBy:0 toItem:v94 attribute:6 multiplier:1.0 constant:-29.0];

      [(UIView *)v49 addConstraint:v89];
    }
    if (v25->_style == 1) {
      v25->_vibrantOptions = 1;
    }
    [(UIView *)v25 setNeedsLayout];
    v99[0] = objc_opt_class();
    v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
    id v96 = [(UIView *)v25 registerForTraitChanges:v95 withAction:sel__updateForCurrentContentSizeCategory];
  }
  return v25;
}

- (double)_labelVerticalSpacing
{
  v2 = [(_UIContentUnavailableView *)self _messageTextStyle];
  v3 = +[UIFontMetrics metricsForTextStyle:v2];
  [v3 scaledValueForValue:35.0];
  double v5 = v4;

  return v5;
}

- (id)_messageTextStyle
{
  return @"UICTFontTextStyleBody";
}

- (void)setVibrantOptions:(unint64_t)a3
{
  if (self->_vibrantOptions != a3)
  {
    self->_vibrantOptions = a3;
    [(UIView *)self setNeedsLayout];
  }
}

+ (_UIContentUnavailableView)allocWithZone:(_NSZone *)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIContentUnavailableView;
  return (_UIContentUnavailableView *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (_UIContentUnavailableView)initWithFrame:(CGRect)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIContentUnavailableView.m" lineNumber:129 description:@"-[_UIContentUnavailableView initWithFrame:] will not return a usable view"];

  return 0;
}

- (_UIContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5
{
  return -[_UIContentUnavailableView initWithFrame:title:style:includeBackdrop:](self, "initWithFrame:title:style:includeBackdrop:", a4, a5, a5 != 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIWindowWillRotateNotification";
  v6[1] = @"UIWindowWillAnimateRotationNotification";
  v6[2] = @"UIWindowDidRotateNotification";
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIContentUnavailableView;
  [(UIView *)&v5 dealloc];
}

- (void)_updateForCurrentContentSizeCategory
{
  v3 = [(_UIContentUnavailableView *)self _titleFont];
  [(UILabel *)self->_titleLabel setFont:v3];

  objc_super v4 = [(_UIContentUnavailableView *)self _messageTextStyle];
  objc_super v5 = [off_1E52D39B8 preferredFontForTextStyle:v4];
  [(UILabel *)self->_messageLabel setFont:v5];

  BOOL v6 = [(_UIContentUnavailableView *)self _buttonFont];
  v7 = [(UIButton *)self->_actionButton titleLabel];
  [v7 setFont:v6];

  if (self->_containerViewContraints)
  {
    [(_UIContentUnavailableView *)self _rebuildConstraints];
  }
}

- (CGColor)_colorForButtonForStyle:(unint64_t)a3 controlState:(unint64_t)a4
{
  if (a3 == 1)
  {
    BOOL v5 = [(_UIContentUnavailableView *)self _hasVibrantButton];
    double v6 = 0.6;
    double v7 = 1.0;
    if (a4) {
      double v6 = 1.0;
    }
    if (!v5) {
      double v7 = v6;
    }
    id v8 = +[UIColor colorWithWhite:0.0 alpha:v7];
    v9 = (CGColor *)[v8 CGColor];
  }
  else
  {
    id v8 = +[UIColor labelColor];
    id v10 = [v8 colorWithAlphaComponent:1.0];
    v9 = (CGColor *)[v10 CGColor];
  }
  return v9;
}

- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4
{
  if (qword_1EB25D238 != -1) {
    dispatch_once(&qword_1EB25D238, &__block_literal_global_663);
  }
  double v7 = [(_UIContentUnavailableView *)self _colorForButtonForStyle:a3 controlState:a4];
  id v8 = [[_UIContentUnavailableViewCacheKey alloc] initWithStyle:a3 color:v7];
  v9 = [(id)_MergedGlobals_9_8 objectForKey:v8];
  if (!v9)
  {
    id v10 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", 11.0, 11.0);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __73___UIContentUnavailableView__buttonBackgroundImageForStyle_controlState___block_invoke_2;
    v23[3] = &__block_descriptor_88_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v23[5] = 0;
    v23[6] = 0;
    v23[4] = v7;
    __asm { FMOV            V0.2D, #11.0 }
    long long v24 = _Q0;
    uint64_t v25 = 0x4008000000000000;
    unint64_t v26 = a3;
    v16 = [(UIGraphicsImageRenderer *)v10 imageWithActions:v23];
    v9 = objc_msgSend(v16, "resizableImageWithCapInsets:", 5.0, 5.0, 5.0, 5.0);

    if (a3 == 1)
    {
      uint64_t v17 = [v9 imageWithRenderingMode:2];

      v9 = (void *)v17;
    }
    if (v9)
    {
      double v18 = (void *)_MergedGlobals_9_8;
      [v9 size];
      double v20 = v19;
      [v9 size];
      [v18 setObject:v9 forKey:v8 cost:(unint64_t)(v20 * v21)];
    }
  }
  return v9;
}

- (id)preferredFocusedView
{
  return self->_actionButton;
}

- (void)layoutSubviews
{
  [(_UIContentUnavailableView *)self _updateViewHierarchy];
  v8.receiver = self;
  v8.super_class = (Class)_UIContentUnavailableView;
  [(UIView *)&v8 layoutSubviews];
  [(UIScrollView *)self->_scrollView contentSize];
  double v4 = v3;
  [(UIView *)self->_scrollView bounds];
  if (v4 > CGRectGetHeight(v9))
  {
    BOOL v5 = [(UIView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);

    if (IsAccessibilityCategory) {
      [(UIScrollView *)self->_scrollView flashScrollIndicators];
    }
  }
}

- (void)_rebuildConstraints
{
  containerViewContraints = self->_containerViewContraints;
  if (!containerViewContraints)
  {
    double v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v5 = self->_containerViewContraints;
    self->_containerViewContraints = v4;

    containerViewContraints = self->_containerViewContraints;
  }
  [MEMORY[0x1E4F5B268] deactivateConstraints:containerViewContraints];
  [(NSMutableArray *)self->_containerViewContraints removeAllObjects];
  titleToMessageConstraint = self->titleToMessageConstraint;
  self->titleToMessageConstraint = 0;

  messageToButtonConstraint = self->messageToButtonConstraint;
  location = (id *)&self->messageToButtonConstraint;
  self->messageToButtonConstraint = 0;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UIContentUnavailableView__rebuildConstraints__block_invoke;
  aBlock[3] = &unk_1E53105D8;
  aBlock[4] = self;
  v74 = (void (**)(void *, UILabel *))_Block_copy(aBlock);
  objc_super v8 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_titleLabel attribute:3 relatedBy:0 toItem:self->_containerView attribute:3 multiplier:1.0 constant:0.0];
  [(NSMutableArray *)self->_containerViewContraints addObject:v8];
  CGRect v9 = [(UIView *)self traitCollection];
  id v10 = [v9 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v10);

  messageLabel = self->_messageLabel;
  if (!messageLabel)
  {
    messageLabel = self->_actionButton;
    if (!messageLabel)
    {
      v74[2](v74, self->_titleLabel);
      goto LABEL_24;
    }
  }
  id v13 = messageLabel;
  [(_UIContentUnavailableView *)self _labelVerticalSpacing];
  double v15 = v14;
  if (self->_messageLabel)
  {
    if (IsAccessibilityCategory) {
      goto LABEL_7;
    }
LABEL_11:
    uint64_t v16 = 12;
    goto LABEL_12;
  }
  [(_UIContentUnavailableView *)self _buttonVerticalSpacing];
  double v15 = v15 + v17;
  if (!IsAccessibilityCategory) {
    goto LABEL_11;
  }
LABEL_7:
  if (self->_messageLabel) {
    uint64_t v16 = 12;
  }
  else {
    uint64_t v16 = 3;
  }
LABEL_12:
  double v18 = [MEMORY[0x1E4F5B268] constraintWithItem:v13 attribute:v16 relatedBy:0 toItem:self->_titleLabel attribute:11 multiplier:1.0 constant:v15];

  objc_storeStrong((id *)&self->titleToMessageConstraint, v18);
  if (self->_messageLabel) {
    double v19 = @"UIContentUnavailable-title-to-message-spacing";
  }
  else {
    double v19 = @"UIContentUnavailable-title-to-button-spacing";
  }
  [(NSLayoutConstraint *)self->titleToMessageConstraint setIdentifier:v19];
  [(NSMutableArray *)self->_containerViewContraints addObject:v18];
  double v20 = self->_messageLabel;
  if (v20 && (actionButton = self->_actionButton) != 0)
  {
    uint64_t v22 = 12;
    if (IsAccessibilityCategory) {
      uint64_t v22 = 3;
    }
    uint64_t v72 = v22;
    double v23 = (void *)MEMORY[0x1E4F5B268];
    [(_UIContentUnavailableView *)self _buttonVerticalSpacing];
    objc_super v8 = [v23 constraintWithItem:actionButton attribute:v72 relatedBy:0 toItem:v20 attribute:11 multiplier:1.0 constant:v24];

    objc_storeStrong(location, v8);
    [*location setIdentifier:@"UIContentUnavailable-message-to-button-spacing"];
    [(NSMutableArray *)self->_containerViewContraints addObject:v8];
  }
  else
  {
    objc_super v8 = v18;
  }
  uint64_t v25 = (UILabel *)self->_actionButton;
  if (!v25) {
    uint64_t v25 = self->_messageLabel;
  }
  v74[2](v74, v25);

LABEL_24:
  unint64_t v26 = (void *)MEMORY[0x1E4F5B268];
  v27 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel_0.isa, self->_titleLabel, 0);
  v28 = [v26 constraintsWithVisualFormat:@"H:|[_titleLabel]|" options:0 metrics:0 views:v27];

  [(UIView *)self->_containerView addConstraints:v28];
  [(NSMutableArray *)self->_containerViewContraints addObjectsFromArray:v28];
  uint64_t v29 = self->_messageLabel;
  if (v29)
  {
    v30 = (void *)MEMORY[0x1E4F5B268];
    v31 = _NSDictionaryOfVariableBindings(&cfstr_Messagelabel.isa, v29, 0);
    uint64_t v32 = [v30 constraintsWithVisualFormat:@"H:|[_messageLabel]|" options:0 metrics:0 views:v31];

    [(UIView *)self->_containerView addConstraints:v32];
    [(NSMutableArray *)self->_containerViewContraints addObjectsFromArray:v32];
    v28 = (void *)v32;
  }
  v33 = self->_actionButton;
  if (v33)
  {
    v34 = self->_containerViewContraints;
    v35 = [(UIView *)v33 centerXAnchor];
    v36 = [(UIView *)self->_containerView centerXAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [(NSMutableArray *)v34 addObject:v37];

    v38 = self->_containerViewContraints;
    v39 = [(UIView *)self->_actionButton leadingAnchor];
    v40 = [(UIView *)self->_containerView leadingAnchor];
    v41 = [v39 constraintGreaterThanOrEqualToAnchor:v40];
    [(NSMutableArray *)v38 addObject:v41];

    v42 = self->_containerViewContraints;
    v43 = [(UIView *)self->_actionButton trailingAnchor];
    v44 = [(UIView *)self->_containerView trailingAnchor];
    v45 = [v43 constraintLessThanOrEqualToAnchor:v44];
    [(NSMutableArray *)v42 addObject:v45];

    [(_UIContentUnavailableView *)self _buttonSize];
    double v47 = v46;
    double v49 = v48;
    v50 = self->_containerViewContraints;
    v51 = [(UIView *)self->_actionButton widthAnchor];
    v52 = [v51 constraintGreaterThanOrEqualToConstant:v47];
    [(NSMutableArray *)v50 addObject:v52];

    v53 = self->_containerViewContraints;
    v54 = [(UIView *)self->_actionButton heightAnchor];
    v55 = [v54 constraintGreaterThanOrEqualToConstant:v49];
    [(NSMutableArray *)v53 addObject:v55];

    if ([(UIButton *)self->_actionButton behavioralStyle] != UIBehavioralStyleMac)
    {
      [(_UIContentUnavailableView *)self _buttonContentEdgeInsets];
      double v58 = v56 + v57;
      double v61 = v59 + v60;
      v62 = self->_containerViewContraints;
      v63 = [(UIView *)self->_actionButton widthAnchor];
      v64 = [(UIButton *)self->_actionButton titleLabel];
      v65 = [v64 widthAnchor];
      v66 = [v63 constraintEqualToAnchor:v65 constant:v58];
      [(NSMutableArray *)v62 addObject:v66];

      v67 = self->_containerViewContraints;
      v68 = [(UIView *)self->_actionButton heightAnchor];
      v69 = [(UIButton *)self->_actionButton titleLabel];
      v70 = [v69 heightAnchor];
      double v71 = [v68 constraintEqualToAnchor:v70 constant:v61];
      [(NSMutableArray *)v67 addObject:v71];
    }
  }
  [(UIView *)self _setNeedsUpdateConstraintsNeedingLayout:0];
}

- (void)_updateViewHierarchy
{
  titleLabel = self->_titleLabel;
  BOOL v4 = titleLabel == 0;
  if (!titleLabel)
  {
    BOOL v5 = [UILabel alloc];
    [(UIView *)self->_scrollView bounds];
    double v6 = -[UILabel initWithFrame:](v5, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v60), 20.0);
    double v7 = self->_titleLabel;
    self->_titleLabel = v6;

    LODWORD(v8) = 1148846080;
    [(UIView *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v8];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    CGRect v9 = +[UIColor clearColor];
    [(UIView *)self->_titleLabel setBackgroundColor:v9];

    [(UIView *)self->_titleLabel setOpaque:0];
    id v10 = [(_UIContentUnavailableView *)self _titleFont];
    [(UILabel *)self->_titleLabel setFont:v10];

    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    LODWORD(v11) = 1051931443;
    [(UILabel *)self->_titleLabel _setHyphenationFactor:v11];
    [(UIView *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_containerView addSubview:self->_titleLabel];
    titleLabel = self->_titleLabel;
  }
  [(UILabel *)titleLabel setText:self->_title];
  if ([(_UIContentUnavailableView *)self _hasVibrantText] && self->_style == 1)
  {
    uint64_t v12 = [(_UIContentUnavailableView *)self _vibrantBaseColor];
  }
  else
  {
    uint64_t v12 = [(_UIContentUnavailableView *)self _flatTextColor];
  }
  id v13 = (void *)v12;
  [(UILabel *)self->_titleLabel setTextColor:v12];

  [(_UIContentUnavailableView *)self _labelAlpha];
  -[UIView setAlpha:](self->_titleLabel, "setAlpha:");
  if (self->_style == 1)
  {
    double v14 = self->_titleLabel;
    if ([(_UIContentUnavailableView *)self _hasVibrantText]) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    [(UIView *)v14 _setDrawsAsBackdropOverlayWithBlendMode:v15];
    if ([(_UIContentUnavailableView *)self _hasVibrantText])
    {
      uint64_t v16 = [(_UIContentUnavailableView *)self _vibrantBaseColor];
      [(UIView *)self->_titleLabel setTintColor:v16];
    }
    else
    {
      [(UIView *)self->_titleLabel setTintColor:0];
    }
  }
  NSUInteger v17 = [(NSString *)self->_message length];
  messageLabel = self->_messageLabel;
  if (v17)
  {
    if (!messageLabel)
    {
      double v19 = [UILabel alloc];
      [(UIView *)self->_scrollView bounds];
      double v20 = -[UILabel initWithFrame:](v19, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v61), 20.0);
      double v21 = self->_messageLabel;
      self->_messageLabel = v20;

      LODWORD(v22) = 1148846080;
      BOOL v4 = 1;
      [(UIView *)self->_messageLabel setContentCompressionResistancePriority:1 forAxis:v22];
      [(UILabel *)self->_messageLabel setTextAlignment:1];
      [(UIView *)self->_messageLabel setOpaque:0];
      double v23 = +[UIColor clearColor];
      [(UIView *)self->_messageLabel setBackgroundColor:v23];

      double v24 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
      [(UILabel *)self->_messageLabel setFont:v24];

      [(UILabel *)self->_messageLabel setNumberOfLines:0];
      LODWORD(v25) = 1051931443;
      [(UILabel *)self->_messageLabel _setHyphenationFactor:v25];
      [(UIView *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_containerView addSubview:self->_messageLabel];
      messageLabel = self->_messageLabel;
    }
    [(UILabel *)messageLabel setText:self->_message];
    if ([(_UIContentUnavailableView *)self _hasVibrantText] && self->_style == 1)
    {
      uint64_t v26 = [(_UIContentUnavailableView *)self _vibrantBaseColor];
    }
    else
    {
      uint64_t v26 = [(_UIContentUnavailableView *)self _flatTextColor];
    }
    v27 = (void *)v26;
    [(UILabel *)self->_messageLabel setTextColor:v26];

    [(_UIContentUnavailableView *)self _labelAlpha];
    -[UIView setAlpha:](self->_messageLabel, "setAlpha:");
    if (self->_style == 1)
    {
      v28 = self->_messageLabel;
      if ([(_UIContentUnavailableView *)self _hasVibrantText]) {
        uint64_t v29 = 3;
      }
      else {
        uint64_t v29 = 0;
      }
      [(UIView *)v28 _setDrawsAsBackdropOverlayWithBlendMode:v29];
      if ([(_UIContentUnavailableView *)self _hasVibrantText])
      {
        v30 = [(_UIContentUnavailableView *)self _vibrantBaseColor];
        [(UIView *)self->_messageLabel setTintColor:v30];
      }
      else
      {
        [(UIView *)self->_messageLabel setTintColor:0];
      }
    }
  }
  else if (messageLabel)
  {
    [(UIView *)messageLabel removeFromSuperview];
    v31 = self->_messageLabel;
    self->_messageLabel = 0;

    BOOL v4 = 1;
  }
  NSUInteger v32 = [(NSString *)self->_buttonTitle length];
  actionButton = self->_actionButton;
  if (v32)
  {
    if (!actionButton)
    {
      BOOL v4 = 1;
      v34 = +[UIButton buttonWithType:1];
      v35 = self->_actionButton;
      self->_actionButton = v34;

      [(UIControl *)self->_actionButton addTarget:self action:sel__actionButtonPressed_ forControlEvents:0x2000];
      -[UIButton setFrame:](self->_actionButton, "setFrame:", 0.0, 0.0, 124.0, 29.0);
      v36 = [(_UIContentUnavailableView *)self _buttonFont];
      v37 = [(UIButton *)self->_actionButton titleLabel];
      [v37 setFont:v36];

      v38 = [(UIButton *)self->_actionButton titleLabel];
      [v38 setNumberOfLines:0];

      v39 = [(UIButton *)self->_actionButton titleLabel];
      LODWORD(v40) = 1051931443;
      [v39 _setHyphenationFactor:v40];

      v41 = [(UIButton *)self->_actionButton titleLabel];
      [v41 setTextAlignment:1];

      [(UIView *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIButton *)self->_actionButton setContentHorizontalAlignment:0];
      [(UIView *)self->_containerView addSubview:self->_actionButton];
      actionButton = self->_actionButton;
    }
    [(UIButton *)actionButton setTitle:self->_buttonTitle forState:0];
    v42 = self->_actionButton;
    v43 = [(_UIContentUnavailableView *)self _buttonBackgroundImageForStyle:self->_style controlState:0];
    [(UIButton *)v42 setBackgroundImage:v43 forState:0];

    [(_UIContentUnavailableView *)self _buttonAlpha];
    -[UIView setAlpha:](self->_actionButton, "setAlpha:");
    v44 = [(_UIContentUnavailableView *)self _flatTextColor];
    v45 = +[UIColor blackColor];
    unint64_t style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        BOOL v47 = [(_UIContentUnavailableView *)self _hasVibrantButton];
        double v48 = self->_actionButton;
        if (v47)
        {
          [(UIView *)v48 _setDrawsAsBackdropOverlayWithBlendMode:3];
          double v49 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
          v50 = [(UIButton *)self->_actionButton titleLabel];
          v51 = [v50 layer];
          [v51 setCompositingFilter:v49];

          v52 = [(_UIContentUnavailableView *)self _vibrantBaseColor];
          [(UIButton *)self->_actionButton setTintColor:v52];

          uint64_t v53 = [(_UIContentUnavailableView *)self _vibrantBaseColor];

          [(UIButton *)self->_actionButton setBackgroundImage:0 forState:1];
        }
        else
        {
          [(UIView *)v48 _setDrawsAsBackdropOverlayWithBlendMode:0];
          v55 = [(UIButton *)self->_actionButton titleLabel];
          double v56 = [v55 layer];
          [v56 setCompositingFilter:0];

          [(UIButton *)self->_actionButton setTintColor:0];
          uint64_t v53 = +[UIColor whiteColor];

          double v57 = self->_actionButton;
          double v58 = [(_UIContentUnavailableView *)self _buttonBackgroundImageForStyle:self->_style controlState:1];
          [(UIButton *)v57 setBackgroundImage:v58 forState:1];
        }
        v44 = (void *)v53;
      }
    }
    else
    {
      [(UIButton *)self->_actionButton setBackgroundImage:0 forState:1];
    }
    [(UIButton *)self->_actionButton setTitleColor:v44 forState:0];
    [(UIButton *)self->_actionButton setTitleColor:v45 forState:8];

LABEL_43:
    if (!v4 && self->_containerViewContraints) {
      return;
    }
    goto LABEL_45;
  }
  if (!actionButton) {
    goto LABEL_43;
  }
  [(UIView *)actionButton removeFromSuperview];
  v54 = self->_actionButton;
  self->_actionButton = 0;

LABEL_45:
  [(_UIContentUnavailableView *)self _rebuildConstraints];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5 || (uint64_t v6 = [v5 length], v7 = v11, !v6))
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UIContentUnavailableView.m" lineNumber:540 description:@"Title cannot be nil or empty"];

    double v7 = v11;
  }
  if (([v7 isEqualToString:self->_title] & 1) == 0)
  {
    double v8 = (NSString *)[v11 copy];
    title = self->_title;
    self->_title = v8;

    [(UIView *)self setNeedsLayout];
  }
}

- (void)setMessage:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_message] & 1) == 0)
  {
    BOOL v4 = (NSString *)[v6 copy];
    message = self->_message;
    self->_message = v4;

    [(UIView *)self setNeedsLayout];
  }
}

- (void)setButtonTitle:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_buttonTitle] & 1) == 0)
  {
    BOOL v4 = (NSString *)[v6 copy];
    buttonTitle = self->_buttonTitle;
    self->_buttonTitle = v4;

    [(UIView *)self setNeedsLayout];
  }
}

- (void)_actionButtonPressed:(id)a3
{
  BOOL v4 = [(_UIContentUnavailableView *)self buttonAction];

  if (v4)
  {
    id v5 = [(_UIContentUnavailableView *)self buttonAction];
    v5[2]();
  }
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContentUnavailableView;
  [(UIView *)&v3 updateConstraints];
  [MEMORY[0x1E4F5B268] activateConstraints:self->_containerViewContraints];
}

- (void)didMoveToWindow
{
  objc_super v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self name:@"UIWindowWillRotateNotification" object:0];
    [v9 removeObserver:self name:@"UIWindowWillAnimateRotationNotification" object:0];
    [v9 removeObserver:self name:@"UIWindowDidRotateNotification" object:0];
    id v5 = [(UIView *)self window];

    if (v5)
    {
      id v6 = [(UIView *)self window];
      [v9 addObserver:self selector:sel_windowWillRotateNotification_ name:@"UIWindowWillRotateNotification" object:v6];

      double v7 = [(UIView *)self window];
      [v9 addObserver:self selector:sel_windowWillAnimateRotateNotification_ name:@"UIWindowWillAnimateRotationNotification" object:v7];

      double v8 = [(UIView *)self window];
      [v9 addObserver:self selector:sel_windowDidRotateNotification_ name:@"UIWindowDidRotateNotification" object:v8];
    }
    else
    {
      [(_UIContentUnavailableView *)self cleanupLingeringRotationState];
    }
  }
}

- (void)windowWillRotateNotification:(id)a3
{
  [(UIView *)self->_containerView bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_buttonTitle)
  {
    [(UIView *)self->_actionButton frame];
    double MinY = CGRectGetMinY(v18);
  }
  -[UIView resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](self->_containerView, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v6, v8, v10, MinY, 0.0, 0.0, 0.0, 0.0);
  id v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  fromSnapshot = self->_fromSnapshot;
  self->_fromSnapshot = v11;

  [(UIView *)self->_fromSnapshot setAutoresizingMask:63];
  [(UIView *)self->_fromSnapshot bounds];
  self->_fromSnapshotSize.CGFloat width = v13;
  self->_fromSnapshotSize.CGFloat height = v14;
  containerView = self->_containerView;
  uint64_t v16 = self->_fromSnapshot;
  [(UIView *)containerView addSubview:v16];
}

- (void)windowWillAnimateRotateNotification:(id)a3
{
  [(UIView *)self->_containerView bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_buttonTitle)
  {
    [(UIView *)self->_actionButton frame];
    double MinY = CGRectGetMinY(v13);
  }
  else
  {
    double MinY = v4;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___UIContentUnavailableView_windowWillAnimateRotateNotification___block_invoke;
  v12[3] = &unk_1E52DA520;
  v12[4] = self;
  *(double *)&v12[5] = v6;
  *(double *)&v12[6] = v8;
  *(double *)&v12[7] = v10;
  *(double *)&v12[8] = MinY;
  +[UIView performWithoutAnimation:v12];
  [(UIView *)self->_fromSnapshot setAlpha:0.0];
  [(UIView *)self->_toSnapshot setAlpha:1.0];
  -[UIView setFrame:](self->_toSnapshot, "setFrame:", v6, v8, v10, MinY);
}

- (void)cleanupLingeringRotationState
{
  [(_UIContentUnavailableView *)self _labelAlpha];
  -[UIView setAlpha:](self->_titleLabel, "setAlpha:");
  [(_UIContentUnavailableView *)self _labelAlpha];
  -[UIView setAlpha:](self->_messageLabel, "setAlpha:");
  [(UIView *)self->_fromSnapshot removeFromSuperview];
  fromSnapshot = self->_fromSnapshot;
  self->_fromSnapshot = 0;

  [(UIView *)self->_toSnapshot removeFromSuperview];
  toSnapshot = self->_toSnapshot;
  self->_toSnapshot = 0;
}

- (id)_titleFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleTitle1"];
}

- (id)_vibrantBaseColor
{
  return +[UIColor _vibrantDarkFillDodgeColor];
}

- (id)_flatTextColor
{
  return +[UIColor labelColor];
}

- (double)_labelAlpha
{
  unint64_t style = self->_style;
  if (style == 1)
  {
    BOOL v4 = [(_UIContentUnavailableView *)self _hasVibrantText];
    double result = 1.0;
    if (v4) {
      return result;
    }
    unint64_t style = self->_style;
  }
  return dbl_186B9E4F0[style == 0];
}

- (double)_buttonAlpha
{
  if (self->_style != 1) {
    return 0.4;
  }
  BOOL v2 = [(_UIContentUnavailableView *)self _hasVibrantButton];
  double result = 0.6;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (id)_buttonFont
{
  BOOL v2 = [(_UIContentUnavailableView *)self _buttonTextStyle];
  objc_super v3 = [off_1E52D39B8 preferredFontForTextStyle:v2];

  return v3;
}

- (id)_buttonTextStyle
{
  return @"UICTFontTextStyleSubhead";
}

- (CGSize)_buttonSize
{
  double v2 = 124.0;
  double v3 = 29.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (UIEdgeInsets)_buttonContentEdgeInsets
{
  double v2 = [(UIView *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  double v5 = 0.0;
  if (IsAccessibilityCategory) {
    double v5 = 8.0;
  }
  double v6 = 16.0;
  double v7 = 16.0;
  double v8 = v5;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)_buttonVerticalSpacing
{
  double v3 = [(_UIContentUnavailableView *)self _buttonTextStyle];
  BOOL v4 = +[UIFontMetrics metricsForTextStyle:v3];
  double v5 = [(UIView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);
  double v8 = 35.0;
  if (IsAccessibilityCategory) {
    double v8 = 8.0;
  }
  [v4 scaledValueForValue:v8];
  double v10 = v9;

  return v10;
}

- (BOOL)_hasVibrantText
{
  return [(_UIContentUnavailableView *)self vibrantOptions] & 1;
}

- (BOOL)_hasVibrantButton
{
  return ([(_UIContentUnavailableView *)self vibrantOptions] >> 1) & 1;
}

- (id)_titleLabel
{
  return self->_titleLabel;
}

- (id)_messageLabel
{
  return self->_messageLabel;
}

- (id)_actionButton
{
  return self->_actionButton;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
}

- (unint64_t)vibrantOptions
{
  return self->_vibrantOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_containerViewContraints, 0);
  objc_storeStrong((id *)&self->_toSnapshot, 0);
  objc_storeStrong((id *)&self->_fromSnapshot, 0);
  objc_storeStrong((id *)&self->messageToButtonConstraint, 0);
  objc_storeStrong((id *)&self->titleToMessageConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end