@interface ContainerHeaderView
- (BOOL)areTrailingButtonsHidden;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isButtonHidden;
- (BOOL)positionButtonAboveTitle;
- (BOOL)shouldCenterButtonVertically;
- (BOOL)titleViewIgnoresButton;
- (CGSize)intrinsicContentSize;
- (ContainerHeaderView)init;
- (ContainerHeaderView)initWithCardButton:(id)a3 trailingCardButtons:(id)a4;
- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3;
- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3 cardButtonBlurred:(BOOL)a4;
- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3 cardButtonTintColor:(id)a4;
- (ContainerHeaderView)initWithFrame:(CGRect)a3;
- (ContainerHeaderView)initWithHairlineMargin:(double)a3;
- (ContainerHeaderView)initWithRespectSafeArea:(BOOL)a3;
- (HeaderViewDelegate)delegate;
- (NSString)title;
- (UIEdgeInsets)accessoryViewInsets;
- (UIEdgeInsets)titleViewInsets;
- (UIFont)customTitleFont;
- (UIFont)titleFont;
- (UILayoutGuide)accessoryViewLayoutGuide;
- (UILayoutGuide)titleViewLayoutGuide;
- (UIMenu)buttonMenu;
- (UITapGestureRecognizer)_headerTapGesture;
- (UIView)accessoryView;
- (UIView)buttonView;
- (UIView)buttonViewForVisualAlignment;
- (UIView)titleView;
- (double)customButtonBottomMargin;
- (double)hairLineAlpha;
- (double)heightWithoutAccessoryView;
- (double)verticalAlignmentOffset;
- (id)_cardButtonForActionButton:(id)a3;
- (id)_defaultTitleViewConstraints;
- (id)_initialConstraints;
- (unint64_t)headerSize;
- (void)_attachDefaultTitleView;
- (void)_createLayoutGuidesIfNeeded;
- (void)_customInit;
- (void)_setMask:(id)a3;
- (void)_updateTitleFontForHeaderSize;
- (void)buttonAction:(id)a3;
- (void)layoutMarginsDidChange;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewInsets:(UIEdgeInsets)a3;
- (void)setAccessoryViewLayoutGuide:(id)a3;
- (void)setButtonHidden:(BOOL)a3;
- (void)setButtonMenu:(id)a3;
- (void)setCustomButtonBottomMargin:(double)a3;
- (void)setCustomTitleFont:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHairLineAlpha:(double)a3;
- (void)setHeaderSize:(unint64_t)a3;
- (void)setShouldCenterButtonVertically:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleView:(id)a3 subtitleView:(id)a4;
- (void)setTitleView:(id)a3 subtitleView:(id)a4 verticalSpaceBetweenViews:(double)a5;
- (void)setTitleView:(id)a3 subtitleView:(id)a4 verticalSpaceBetweenViews:(double)a5 padding:(NSDirectionalEdgeInsets)a6;
- (void)setTitleViewIgnoresButton:(BOOL)a3;
- (void)setTitleViewInsets:(UIEdgeInsets)a3;
- (void)setTitleViewLayoutGuide:(id)a3;
- (void)setTrailingButtonsHidden:(BOOL)a3;
- (void)setVerticalAlignmentOffset:(double)a3;
- (void)tapAction:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBaseMargins;
- (void)updateTheme;
@end

@implementation ContainerHeaderView

- (void)updateTheme
{
  id v4 = [(ContainerHeaderView *)self theme];
  v3 = [v4 hairlineColor];
  [(HairlineView *)self->_hairLineView setBackgroundColor:v3];
}

- (ContainerHeaderView)initWithHairlineMargin:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ContainerHeaderView;
  id v4 = -[ContainerHeaderView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_hairlineMargin = a3;
    v6 = [CardButton alloc];
    v7 = +[CardButtonConfiguration close];
    v8 = [(CardButton *)v6 initWithConfiguration:v7];
    buttonView = v5->_buttonView;
    v5->_buttonView = v8;

    [(ContainerHeaderView *)v5 _customInit];
  }
  return v5;
}

- (ContainerHeaderView)initWithRespectSafeArea:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ContainerHeaderView;
  id v4 = -[ContainerHeaderView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_respectSafeArea = a3;
    v6 = [CardButton alloc];
    v7 = +[CardButtonConfiguration close];
    v8 = [(CardButton *)v6 initWithConfiguration:v7];
    buttonView = v5->_buttonView;
    v5->_buttonView = v8;

    [(ContainerHeaderView *)v5 _customInit];
  }
  return v5;
}

- (ContainerHeaderView)initWithFrame:(CGRect)a3
{
  return -[ContainerHeaderView initWithHairlineMargin:](self, "initWithHairlineMargin:", 0.0, a3.origin.y, a3.size.width, a3.size.height);
}

- (ContainerHeaderView)init
{
  return [(ContainerHeaderView *)self initWithHairlineMargin:0.0];
}

- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ContainerHeaderView;
  id v4 = -[ContainerHeaderView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = objc_opt_new();
    [v5 setType:a3];
    v6 = [[CardButton alloc] initWithConfiguration:v5];
    buttonView = v4->_buttonView;
    v4->_buttonView = v6;

    [(ContainerHeaderView *)v4 _customInit];
  }
  return v4;
}

- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3 cardButtonBlurred:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ContainerHeaderView;
  v6 = -[ContainerHeaderView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v6)
  {
    v7 = objc_opt_new();
    [v7 setType:a3];
    [v7 setBlurred:v4];
    v8 = [[CardButton alloc] initWithConfiguration:v7];
    buttonView = v6->_buttonView;
    v6->_buttonView = v8;

    [(ContainerHeaderView *)v6 _customInit];
  }
  return v6;
}

- (ContainerHeaderView)initWithCardButtonType:(unint64_t)a3 cardButtonTintColor:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ContainerHeaderView;
  v7 = -[ContainerHeaderView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v7)
  {
    v8 = objc_opt_new();
    [v8 setType:a3];
    [v8 setTintColor:v6];
    objc_super v9 = [[CardButton alloc] initWithConfiguration:v8];
    buttonView = v7->_buttonView;
    v7->_buttonView = v9;

    [(ContainerHeaderView *)v7 _customInit];
  }

  return v7;
}

- (ContainerHeaderView)initWithCardButton:(id)a3 trailingCardButtons:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ContainerHeaderView;
  objc_super v9 = -[ContainerHeaderView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_buttonView, a3);
    objc_storeStrong((id *)&v10->_trailingCardButtons, a4);
    [(ContainerHeaderView *)v10 _customInit];
  }

  return v10;
}

- (UIView)buttonView
{
  return (UIView *)self->_buttonView;
}

- (UIView)buttonViewForVisualAlignment
{
  return [(CardButton *)self->_buttonView viewForVisualAlignment];
}

- (CGSize)intrinsicContentSize
{
  v3 = [(ContainerHeaderView *)self titleView];
  if (v3)
  {

    double v4 = UIViewNoIntrinsicMetric;
  }
  else
  {
    v5 = [(ContainerHeaderView *)self accessoryView];

    double v4 = UIViewNoIntrinsicMetric;
    if (!v5)
    {
      unint64_t v6 = [(ContainerHeaderView *)self headerSize];
      double v7 = 40.0;
      if (v6 == 1) {
        double v7 = 54.0;
      }
      double v4 = 68.0;
      if (v6 != 2) {
        double v4 = v7;
      }
    }
  }
  double v8 = UIViewNoIntrinsicMetric;
  result.height = v4;
  result.width = v8;
  return result;
}

- (void)setHeaderSize:(unint64_t)a3
{
  if (self->_headerSize != a3)
  {
    self->_headerSize = a3;
    [(ContainerHeaderView *)self _updateTitleFontForHeaderSize];
    [(ContainerHeaderView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setHairLineAlpha:(double)a3
{
}

- (double)hairLineAlpha
{
  [(HairlineView *)self->_hairLineView alpha];
  return result;
}

- (BOOL)shouldCenterButtonVertically
{
  return [(NSLayoutConstraint *)self->_buttonCenterVerticallyConstraint isActive];
}

- (void)setShouldCenterButtonVertically:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLayoutConstraint *)self->_buttonAlignToTopConstraint setActive:!a3];
  buttonCenterVerticallyConstraint = self->_buttonCenterVerticallyConstraint;

  [(NSLayoutConstraint *)buttonCenterVerticallyConstraint setActive:v3];
}

- (BOOL)isButtonHidden
{
  return [(CardButton *)self->_buttonView isHidden];
}

- (void)setButtonHidden:(BOOL)a3
{
}

- (BOOL)areTrailingButtonsHidden
{
  return [(UIStackView *)self->_trailingButtonsStackView isHidden];
}

- (void)setTrailingButtonsHidden:(BOOL)a3
{
}

- (void)setVerticalAlignmentOffset:(double)a3
{
  if (vabdd_f64(self->_verticalAlignmentOffset, a3) > 2.22044605e-16)
  {
    self->_verticalAlignmentOffset = a3;
    [(NSLayoutConstraint *)self->_defaultTitleLabelCenterYConstraint setConstant:a3];
    [(NSLayoutConstraint *)self->_buttonAlignToTopConstraint setConstant:a3];
    buttonCenterVerticallyConstraint = self->_buttonCenterVerticallyConstraint;
    [(NSLayoutConstraint *)buttonCenterVerticallyConstraint setConstant:a3];
  }
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_defaultTitleLabel text];
}

- (void)setTitleView:(id)a3
{
  id v12 = a3;
  p_titleView = &self->_titleView;
  unint64_t v6 = [(UIView *)self->_titleView superview];

  if (v6 == self) {
    [(UIView *)*p_titleView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_titleView, a3);
  if (*p_titleView)
  {
    [(UILabel *)self->_defaultTitleLabel removeFromSuperview];
    [(UIView *)*p_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)self addSubview:*p_titleView];
    double v7 = *p_titleView;
    double v8 = [(ContainerHeaderView *)self titleViewLayoutGuide];
    LODWORD(v9) = 1148846080;
    v10 = [(UIView *)v7 _maps_constraintsEqualToEdgesOfLayoutGuide:v8 priority:v9];
    objc_super v11 = [v10 allConstraints];
    +[NSLayoutConstraint activateConstraints:v11];
  }
  else
  {
    [(ContainerHeaderView *)self _attachDefaultTitleView];
  }
  [(ContainerHeaderView *)self invalidateIntrinsicContentSize];
}

- (void)setTitleView:(id)a3 subtitleView:(id)a4
{
}

- (void)setTitleView:(id)a3 subtitleView:(id)a4 verticalSpaceBetweenViews:(double)a5
{
}

- (void)setTitleView:(id)a3 subtitleView:(id)a4 verticalSpaceBetweenViews:(double)a5 padding:(NSDirectionalEdgeInsets)a6
{
  double trailing = a6.trailing;
  double bottom = a6.bottom;
  double leading = a6.leading;
  double top = a6.top;
  id v14 = a3;
  id v15 = a4;
  p_titleView = &self->_titleView;
  v17 = [(UIView *)self->_titleView superview];

  if (v17 == self) {
    [(UIView *)*p_titleView removeFromSuperview];
  }
  p_subtitleView = &self->_subtitleView;
  v19 = [(UIView *)self->_subtitleView superview];

  if (v19 == self) {
    [(UIView *)*p_subtitleView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_titleView, a3);
  objc_storeStrong((id *)&self->_subtitleView, a4);
  if (*p_titleView)
  {
    [(UILabel *)self->_defaultTitleLabel removeFromSuperview];
    [(UIView *)*p_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)self addSubview:*p_titleView];
    [(UIView *)*p_subtitleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)self addSubview:*p_subtitleView];
    unsigned __int8 v20 = [(ContainerHeaderView *)self positionButtonAboveTitle];
    v21 = [(UIView *)*p_titleView trailingAnchor];
    id v46 = v15;
    id v47 = v14;
    if (v20)
    {
      v22 = [(ContainerHeaderView *)self trailingAnchor];
      double v23 = -trailing;
      uint64_t v24 = [v21 constraintEqualToAnchor:v22 constant:v23];
    }
    else
    {
      v25 = [(CardButton *)self->_buttonView leadingAnchor];
      uint64_t v24 = [v21 constraintEqualToAnchor:v25];

      double v23 = -trailing;
    }
    v37 = (void *)v24;
    v45 = [(UIView *)*p_titleView topAnchor];
    v44 = [(ContainerHeaderView *)self topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:top];
    v48[0] = v43;
    v42 = [(UIView *)*p_titleView leadingAnchor];
    v41 = [(ContainerHeaderView *)self leadingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41 constant:leading];
    v48[1] = v40;
    v48[2] = v24;
    v39 = [(UIView *)*p_subtitleView topAnchor];
    v38 = [(UIView *)*p_titleView bottomAnchor];
    v36 = [v39 constraintEqualToAnchor:v38 constant:a5];
    v48[3] = v36;
    v35 = [(UIView *)*p_subtitleView leadingAnchor];
    v26 = [(ContainerHeaderView *)self leadingAnchor];
    v27 = [v35 constraintEqualToAnchor:v26 constant:leading];
    v48[4] = v27;
    v28 = [(UIView *)*p_subtitleView trailingAnchor];
    v29 = [(ContainerHeaderView *)self trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:v23];
    v48[5] = v30;
    v31 = [(UIView *)*p_subtitleView bottomAnchor];
    v32 = [(ContainerHeaderView *)self bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:-bottom];
    v48[6] = v33;
    v34 = +[NSArray arrayWithObjects:v48 count:7];
    +[NSLayoutConstraint activateConstraints:v34];

    id v15 = v46;
    id v14 = v47;
  }
  else
  {
    [(ContainerHeaderView *)self _attachDefaultTitleView];
  }
  [(ContainerHeaderView *)self invalidateIntrinsicContentSize];
}

- (UILayoutGuide)titleViewLayoutGuide
{
  [(ContainerHeaderView *)self _createLayoutGuidesIfNeeded];
  titleViewLayoutGuide = self->_titleViewLayoutGuide;

  return titleViewLayoutGuide;
}

- (void)setTitleViewInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(ContainerHeaderView *)self _createLayoutGuidesIfNeeded];
  double v8 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints topConstraint];
  [v8 setConstant:top];

  double v9 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints leadingConstraint];
  [v9 setConstant:left];

  v10 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints bottomConstraint];
  [v10 setConstant:bottom];

  id v11 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints trailingConstraint];
  [v11 setConstant:right];
}

- (UIEdgeInsets)titleViewInsets
{
  [(ContainerHeaderView *)self _createLayoutGuidesIfNeeded];
  BOOL v3 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints topConstraint];
  [v3 constant];
  double v5 = v4;
  unint64_t v6 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints leadingConstraint];
  [v6 constant];
  double v8 = v7;
  double v9 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints bottomConstraint];
  [v9 constant];
  double v11 = v10;
  id v12 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints trailingConstraint];
  [v12 constant];
  double v14 = v13;

  double v15 = v5;
  double v16 = v8;
  double v17 = v11;
  double v18 = v14;
  result.double right = v18;
  result.double bottom = v17;
  result.double left = v16;
  result.double top = v15;
  return result;
}

- (UIFont)titleFont
{
  if (self->_customTitleFont)
  {
    self = [(ContainerHeaderView *)self customTitleFont];
  }
  else
  {
    unint64_t headerSize = self->_headerSize;
    if (headerSize >= 2)
    {
      if (headerSize == 2)
      {
        self = +[UIFont _maps_boldSystemFontWithSize:27.0];
      }
    }
    else
    {
      self = +[UIFont system22AdaptiveSemibold];
    }
  }

  return (UIFont *)self;
}

- (void)setCustomTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_customTitleFont, a3);

  [(ContainerHeaderView *)self _updateTitleFontForHeaderSize];
}

- (void)setAccessoryView:(id)a3
{
  id v29 = a3;
  p_accessoryView = &self->_accessoryView;
  unint64_t v6 = [(UIView *)self->_accessoryView superview];

  if (v6 == self) {
    [(UIView *)*p_accessoryView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_accessoryView, a3);
  if (*p_accessoryView)
  {
    [(UIView *)*p_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ContainerHeaderView *)self addSubview:*p_accessoryView];
    uint64_t v7 = sub_1000BBB44(self);
    double v8 = *p_accessoryView;
    if (v7 == 5)
    {
      v27 = [(UIView *)v8 topAnchor];
      v28 = [(ContainerHeaderView *)self accessoryViewLayoutGuide];
      v26 = [v28 topAnchor];
      double v9 = [v27 constraintEqualToAnchor:v26];
      uint64_t v24 = [(UIView *)*p_accessoryView leadingAnchor];
      v25 = [(ContainerHeaderView *)self accessoryViewLayoutGuide];
      double v23 = [v25 leadingAnchor];
      double v10 = [v24 constraintGreaterThanOrEqualToAnchor:v23];
      v22 = [(ContainerHeaderView *)self accessoryViewLayoutGuide];
      double v11 = [v22 bottomAnchor];
      id v12 = [(UIView *)*p_accessoryView bottomAnchor];
      double v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12];
      double v14 = [(ContainerHeaderView *)self accessoryViewLayoutGuide];
      double v15 = [v14 trailingAnchor];
      double v16 = [(UIView *)*p_accessoryView trailingAnchor];
      double v17 = [v15 constraintEqualToAnchor:v16];
      double v18 = +[MapsEdgeConstraints edgeConstraintsWithTop:v9 leading:v10 bottom:v13 trailing:v17];

      v19 = [v18 allConstraints];
      +[NSLayoutConstraint activateConstraints:v19];
    }
    else
    {
      double v18 = [(ContainerHeaderView *)self accessoryViewLayoutGuide];
      LODWORD(v20) = 1148846080;
      v19 = [(UIView *)v8 _maps_constraintsEqualToEdgesOfLayoutGuide:v18 priority:v20];
      v21 = [v19 allConstraints];
      +[NSLayoutConstraint activateConstraints:v21];
    }
  }
}

- (void)setAccessoryViewInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(ContainerHeaderView *)self _createLayoutGuidesIfNeeded];
  double v8 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints topConstraint];
  [v8 setConstant:top];

  double v9 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints leadingConstraint];
  [v9 setConstant:left];

  double v10 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints bottomConstraint];
  [v10 setConstant:bottom];

  id v11 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints trailingConstraint];
  [v11 setConstant:right];
}

- (UIEdgeInsets)accessoryViewInsets
{
  [(ContainerHeaderView *)self _createLayoutGuidesIfNeeded];
  BOOL v3 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints topConstraint];
  [v3 constant];
  double v5 = v4;
  unint64_t v6 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints leadingConstraint];
  [v6 constant];
  double v8 = v7;
  double v9 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints bottomConstraint];
  [v9 constant];
  double v11 = v10;
  id v12 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints trailingConstraint];
  [v12 constant];
  double v14 = v13;

  double v15 = v5;
  double v16 = v8;
  double v17 = v11;
  double v18 = v14;
  result.double right = v18;
  result.double bottom = v17;
  result.double left = v16;
  result.double top = v15;
  return result;
}

- (double)heightWithoutAccessoryView
{
  uint64_t v3 = [(ContainerHeaderView *)self superview];
  double v4 = (void *)v3;
  if (v3) {
    double v5 = (ContainerHeaderView *)v3;
  }
  else {
    double v5 = self;
  }
  unint64_t v6 = v5;

  double height = UILayoutFittingCompressedSize.height;
  -[ContainerHeaderView systemLayoutSizeFittingSize:](v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
  if (v8 == 0.0) {
    [(ContainerHeaderView *)v6 intrinsicContentSize];
  }
  double v9 = v8;
  double v10 = [(ContainerHeaderView *)self accessoryView];

  if (v10)
  {
    double v11 = [(ContainerHeaderView *)self accessoryView];
    [v11 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width height];
    double v13 = v12;

    if (v13 == 0.0)
    {
      double v14 = [(ContainerHeaderView *)self accessoryView];
      [v14 intrinsicContentSize];
      double v13 = v15;
    }
    double v16 = v9 - v13;
    [(ContainerHeaderView *)self accessoryViewInsets];
    double v18 = v17;
    [(ContainerHeaderView *)self accessoryViewInsets];
    double v9 = v16 - (v18 + v19);
  }

  return v9;
}

- (UIMenu)buttonMenu
{
  return [(CardButton *)self->_buttonView menu];
}

- (void)setButtonMenu:(id)a3
{
}

- (double)customButtonBottomMargin
{
  [(CardButton *)self->_buttonView bottomMargin];
  return result;
}

- (void)setCustomButtonBottomMargin:(double)a3
{
}

- (void)tapAction:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 headerViewTapped:self];
  }
}

- (void)buttonAction:(id)a3
{
  id v7 = [(ContainerHeaderView *)self _cardButtonForActionButton:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 headerViewButtonTapped:self buttonType:[v7 type]];
  }
}

- (id)_cardButtonForActionButton:(id)a3
{
  id v4 = a3;
  id v5 = [(CardButton *)self->_buttonView underlyingButton];

  if (v5 == v4)
  {
    double v13 = self->_buttonView;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = self->_trailingCardButtons;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v11 underlyingButton:v15];
          id v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v4)
          {
            double v13 = v11;

            goto LABEL_13;
          }
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    double v13 = 0;
  }
LABEL_13:

  return v13;
}

- (void)_setMask:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  [v4 capInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[ContainerHeaderView _setCornerRadius:](self, "_setCornerRadius:");
  [(ContainerHeaderView *)self setClipsToBounds:1];
  id v19 = [(ContainerHeaderView *)self layer];
  id v17 = v4;
  id v18 = [v17 CGImage];

  [v19 setCornerContents:v18];
  [v19 setCornerContentsCenter:v12 / v6, v10 / v8, (v6 - v12 - v16) / v6, (v8 - v10 - v14) / v8];
}

- (void)_customInit
{
  [(ContainerHeaderView *)self setAccessibilityIdentifier:@"ContainerHeaderView"];
  LODWORD(v3) = 1144750080;
  [(ContainerHeaderView *)self setContentCompressionResistancePriority:1 forAxis:v3];
  self->_unint64_t headerSize = 1;
  id v4 = +[UIColor clearColor];
  [(ContainerHeaderView *)self setBackgroundColor:v4];

  [(ContainerHeaderView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardButton *)self->_buttonView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardButton *)self->_buttonView addTarget:self action:"buttonAction:" forControlEvents:64];
  [(ContainerHeaderView *)self addSubview:self->_buttonView];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v5 = self->_trailingCardButtons;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) addTarget:self action:@"buttonAction:" forControlEvents:64 v24];
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  double v10 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:self->_trailingCardButtons];
  trailingButtonsStackView = self->_trailingButtonsStackView;
  self->_trailingButtonsStackView = v10;

  [(UIStackView *)self->_trailingButtonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v12) = 1148846080;
  [(UIStackView *)self->_trailingButtonsStackView setContentHuggingPriority:0 forAxis:v12];
  [(UIStackView *)self->_trailingButtonsStackView setAxis:0];
  [(UIStackView *)self->_trailingButtonsStackView setSpacing:8.0];
  [(ContainerHeaderView *)self addSubview:self->_trailingButtonsStackView];
  double v13 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
  defaultTitleLabel = self->_defaultTitleLabel;
  self->_defaultTitleLabel = v13;

  LODWORD(v15) = 1132068864;
  [(UILabel *)self->_defaultTitleLabel setContentCompressionResistancePriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(UILabel *)self->_defaultTitleLabel setContentCompressionResistancePriority:1 forAxis:v16];
  [(UILabel *)self->_defaultTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = +[UIColor clearColor];
  [(UILabel *)self->_defaultTitleLabel setBackgroundColor:v17];

  id v18 = +[UIColor labelColor];
  [(UILabel *)self->_defaultTitleLabel setTextColor:v18];

  [(UILabel *)self->_defaultTitleLabel setAccessibilityIdentifier:@"ContainerHeaderTitle"];
  id v19 = [(ContainerHeaderView *)self _maps_addHairlineAtBottomWithMargin:self->_hairlineMargin];
  hairLineView = self->_hairLineView;
  self->_hairLineView = v19;

  [(HairlineView *)self->_hairLineView setAutoUpdateTheme:0];
  v21 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapAction:"];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v21;

  [(UITapGestureRecognizer *)self->_tapGesture setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->_tapGesture setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)self->_tapGesture setDelegate:self];
  [(ContainerHeaderView *)self addGestureRecognizer:self->_tapGesture];
  double v23 = [(ContainerHeaderView *)self _initialConstraints];
  +[NSLayoutConstraint activateConstraints:v23];

  [(ContainerHeaderView *)self _attachDefaultTitleView];
  [(ContainerHeaderView *)self updateBaseMargins];
  [(ContainerHeaderView *)self _updateTitleFontForHeaderSize];
}

- (UITapGestureRecognizer)_headerTapGesture
{
  return self->_tapGesture;
}

- (id)_initialConstraints
{
  double v3 = [(CardButton *)self->_buttonView topAnchor];
  id v4 = [(ContainerHeaderView *)self topAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  buttonAlignToTopConstraint = self->_buttonAlignToTopConstraint;
  self->_buttonAlignToTopConstraint = v5;

  id v7 = [(CardButton *)self->_buttonView centerYAnchor];
  uint64_t v8 = [(ContainerHeaderView *)self centerYAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  buttonCenterVerticallyConstraint = self->_buttonCenterVerticallyConstraint;
  self->_buttonCenterVerticallyConstraint = v9;

  if ([(ContainerHeaderView *)self positionButtonAboveTitle])
  {
    double v11 = [(ContainerHeaderView *)self leadingAnchor];
    double v12 = [(CardButton *)self->_buttonView leadingAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    buttonEdgeConstraint = self->_buttonEdgeConstraint;
    self->_buttonEdgeConstraint = v13;

    double v15 = [(ContainerHeaderView *)self trailingAnchor];
    double v16 = [(UIStackView *)self->_trailingButtonsStackView trailingAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];
    trailingButtonEdgeConstraint = self->_trailingButtonEdgeConstraint;
    self->_trailingButtonEdgeConstraint = v17;

    id v19 = self->_buttonEdgeConstraint;
    v31 = self->_buttonAlignToTopConstraint;
    v32 = v19;
    v33 = self->_trailingButtonEdgeConstraint;
    double v20 = &v31;
    uint64_t v21 = 3;
  }
  else
  {
    v22 = [(ContainerHeaderView *)self trailingAnchor];
    double v23 = [(CardButton *)self->_buttonView trailingAnchor];
    long long v24 = [v22 constraintEqualToAnchor:v23];
    long long v25 = self->_buttonEdgeConstraint;
    self->_buttonEdgeConstraint = v24;

    long long v26 = self->_buttonEdgeConstraint;
    id v29 = self->_buttonAlignToTopConstraint;
    v30 = v26;
    double v20 = &v29;
    uint64_t v21 = 2;
  }
  long long v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, v21, v29, v30, v31, v32, v33);

  return v27;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderView;
  [(ContainerHeaderView *)&v3 layoutMarginsDidChange];
  [(ContainerHeaderView *)self updateBaseMargins];
}

- (void)updateBaseMargins
{
  if (self->_respectSafeArea)
  {
    id v3 = [(ContainerHeaderView *)self effectiveUserInterfaceLayoutDirection];
    unsigned int v4 = [(ContainerHeaderView *)self positionButtonAboveTitle];
    [(ContainerHeaderView *)self safeAreaInsets];
    if (v4)
    {
      buttonEdgeConstraint = self->_buttonEdgeConstraint;
      if (v3 == (id)1)
      {
        [(NSLayoutConstraint *)buttonEdgeConstraint setConstant:v6];
        [(ContainerHeaderView *)self safeAreaInsets];
        double v9 = v8;
      }
      else
      {
        [(NSLayoutConstraint *)buttonEdgeConstraint setConstant:v5];
        [(ContainerHeaderView *)self safeAreaInsets];
        double v9 = v12;
      }
      double v11 = &OBJC_IVAR___ContainerHeaderView__trailingButtonEdgeConstraint;
    }
    else
    {
      if (v3 == (id)1) {
        double v9 = v5;
      }
      else {
        double v9 = v6;
      }
      double v11 = &OBJC_IVAR___ContainerHeaderView__buttonEdgeConstraint;
    }
    [*(id *)((char *)&self->super.super.super.super.isa + *v11) setConstant:v9];
    [(ContainerHeaderView *)self safeAreaInsets];
    if (v3 == (id)1) {
      double v15 = v14;
    }
    else {
      double v15 = v13;
    }
    double v10 = v15 + 16.0;
  }
  else
  {
    [(NSLayoutConstraint *)self->_buttonEdgeConstraint setConstant:0.0];
    [(NSLayoutConstraint *)self->_trailingButtonEdgeConstraint setConstant:0.0];
    double v10 = 16.0;
  }
  titleLeadingConstraint = self->_titleLeadingConstraint;

  [(NSLayoutConstraint *)titleLeadingConstraint setConstant:v10];
}

- (void)_attachDefaultTitleView
{
  [(ContainerHeaderView *)self addSubview:self->_defaultTitleLabel];
  id v3 = [(ContainerHeaderView *)self _defaultTitleViewConstraints];
  +[NSLayoutConstraint activateConstraints:v3];
}

- (BOOL)positionButtonAboveTitle
{
  id v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (id)5 && !-[CardButton type](self->_buttonView, "type")) {
    unsigned int v4 = ![(ContainerHeaderView *)self isButtonHidden];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_defaultTitleViewConstraints
{
  unsigned int v3 = [(ContainerHeaderView *)self positionButtonAboveTitle];
  unsigned int v4 = [(UILabel *)self->_defaultTitleLabel leadingAnchor];
  if (v3)
  {
    double v5 = [(CardButton *)self->_buttonView leadingAnchor];
    double v6 = [v4 constraintEqualToAnchor:v5];
    titleLeadingConstraint = self->_titleLeadingConstraint;
    self->_titleLeadingConstraint = v6;

    v29[0] = self->_titleLeadingConstraint;
    double v8 = [(UILabel *)self->_defaultTitleLabel trailingAnchor];
    double v9 = [(ContainerHeaderView *)self trailingAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v29[1] = v10;
    double v11 = [(UILabel *)self->_defaultTitleLabel topAnchor];
    double v12 = [(CardButton *)self->_buttonView bottomAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v29[2] = v13;
    double v14 = [(ContainerHeaderView *)self bottomAnchor];
    double v15 = [(UILabel *)self->_defaultTitleLabel bottomAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:10.0];
    v29[3] = v16;
    id v17 = v29;
    uint64_t v18 = 4;
  }
  else
  {
    id v19 = [(ContainerHeaderView *)self leadingAnchor];
    double v20 = [v4 constraintEqualToAnchor:v19];
    uint64_t v21 = self->_titleLeadingConstraint;
    self->_titleLeadingConstraint = v20;

    v22 = [(UILabel *)self->_defaultTitleLabel centerYAnchor];
    double v23 = [(ContainerHeaderView *)self centerYAnchor];
    long long v24 = [v22 constraintEqualToAnchor:v23 constant:self->_verticalAlignmentOffset];
    defaultTitleLabelCenterYConstraint = self->_defaultTitleLabelCenterYConstraint;
    self->_defaultTitleLabelCenterYConstraint = v24;

    double v8 = [(CardButton *)self->_buttonView leadingAnchor];
    double v9 = [(UILabel *)self->_defaultTitleLabel trailingAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v28[2] = v10;
    double v11 = [(UILabel *)self->_defaultTitleLabel topAnchor];
    double v12 = [(ContainerHeaderView *)self topAnchor];
    double v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12];
    v28[3] = v13;
    double v14 = [(ContainerHeaderView *)self bottomAnchor];
    double v15 = [(UILabel *)self->_defaultTitleLabel bottomAnchor];
    double v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
    v28[4] = v16;
    id v17 = v28;
    uint64_t v18 = 5;
  }
  long long v26 = +[NSArray arrayWithObjects:v17 count:v18];

  return v26;
}

- (void)_createLayoutGuidesIfNeeded
{
  if (self->_titleViewLayoutGuide || self->_accessoryViewLayoutGuide) {
    return;
  }
  unsigned int v3 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  titleViewLayoutGuide = self->_titleViewLayoutGuide;
  self->_titleViewLayoutGuide = v3;

  [(ContainerHeaderView *)self addLayoutGuide:self->_titleViewLayoutGuide];
  double v5 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  accessoryViewLayoutGuide = self->_accessoryViewLayoutGuide;
  self->_accessoryViewLayoutGuide = v5;

  [(ContainerHeaderView *)self addLayoutGuide:self->_accessoryViewLayoutGuide];
  id v7 = [(UILabel *)self->_defaultTitleLabel superview];

  if (v7 == self) {
    defaultTitleLabel = self->_defaultTitleLabel;
  }
  else {
    defaultTitleLabel = self;
  }
  double v9 = [defaultTitleLabel bottomAnchor];
  double v10 = [(UILayoutGuide *)self->_titleViewLayoutGuide bottomAnchor];
  id v48 = [v9 constraintEqualToAnchor:v10];

  double v11 = [(UILayoutGuide *)self->_titleViewLayoutGuide leadingAnchor];
  double v12 = [(ContainerHeaderView *)self leadingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];

  if ([(ContainerHeaderView *)self positionButtonAboveTitle])
  {
    double v15 = [(UILayoutGuide *)self->_titleViewLayoutGuide topAnchor];
    double v16 = [(CardButton *)self->_buttonView bottomAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];

    LODWORD(v18) = 1148829696;
    [v17 setPriority:v18];
  }
  else
  {
    LODWORD(v14) = 1148829696;
    [v48 setPriority:v14];
    id v19 = [(UILayoutGuide *)self->_titleViewLayoutGuide topAnchor];
    double v20 = [(ContainerHeaderView *)self topAnchor];
    id v17 = [v19 constraintEqualToAnchor:v20];

    if (![(ContainerHeaderView *)self titleViewIgnoresButton])
    {
      uint64_t v21 = [(CardButton *)self->_buttonView leadingAnchor];
      goto LABEL_12;
    }
  }
  uint64_t v21 = [(ContainerHeaderView *)self trailingAnchor];
LABEL_12:
  v22 = (void *)v21;
  double v23 = [(UILayoutGuide *)self->_titleViewLayoutGuide trailingAnchor];
  long long v24 = [v22 constraintEqualToAnchor:v23];

  long long v25 = +[MapsEdgeConstraints edgeConstraintsWithTop:v17 leading:v13 bottom:v48 trailing:v24];
  titleLayoutGuideEdgeConstraints = self->_titleLayoutGuideEdgeConstraints;
  self->_titleLayoutGuideEdgeConstraints = v25;

  long long v27 = [(MapsEdgeConstraints *)self->_titleLayoutGuideEdgeConstraints allConstraints];
  +[NSLayoutConstraint activateConstraints:v27];

  v28 = [(ContainerHeaderView *)self trailingAnchor];
  id v29 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];

  LODWORD(v28) = [(ContainerHeaderView *)self positionButtonAboveTitle];
  v31 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide topAnchor];
  if (v28)
  {
    v32 = [(CardButton *)self->_buttonView viewForVisualAlignment];
    v33 = [v32 topAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];

    v35 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide leadingAnchor];
    v36 = [(CardButton *)self->_buttonView trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];

    v38 = [(UILayoutGuide *)self->_titleViewLayoutGuide topAnchor];
    v39 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide bottomAnchor];
    [v38 constraintGreaterThanOrEqualToAnchor:v39];
  }
  else
  {
    v40 = [(UILayoutGuide *)self->_titleViewLayoutGuide bottomAnchor];
    v34 = [v31 constraintEqualToAnchor:v40];

    LODWORD(v41) = 1148829696;
    [v34 setPriority:v41];
    v42 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide leadingAnchor];
    v43 = [(ContainerHeaderView *)self leadingAnchor];
    v37 = [v42 constraintEqualToAnchor:v43];

    v38 = [(ContainerHeaderView *)self bottomAnchor];
    v39 = [(UILayoutGuide *)self->_accessoryViewLayoutGuide bottomAnchor];
    [v38 constraintEqualToAnchor:v39];
  v44 = };

  v45 = +[MapsEdgeConstraints edgeConstraintsWithTop:v34 leading:v37 bottom:v44 trailing:v30];
  accessoryLayoutGuideEdgeConstraints = self->_accessoryLayoutGuideEdgeConstraints;
  self->_accessoryLayoutGuideEdgeConstraints = v45;

  id v47 = [(MapsEdgeConstraints *)self->_accessoryLayoutGuideEdgeConstraints allConstraints];
  +[NSLayoutConstraint activateConstraints:v47];
}

- (void)_updateTitleFontForHeaderSize
{
  id v3 = [(ContainerHeaderView *)self titleFont];
  [(UILabel *)self->_defaultTitleLabel setFont:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ContainerHeaderView;
  id v4 = a3;
  [(MapsThemeView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(ContainerHeaderView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(ContainerHeaderView *)self _updateTitleFontForHeaderSize];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  [v4 locationInView:self];
  double v7 = v6;
  double v9 = v8;

  [v5 hitTest:0 withEvent:v7];
  double v10 = (CardButton *)objc_claimAutoreleasedReturnValue();

  double v11 = [(ContainerHeaderView *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    double v13 = [(ContainerHeaderView *)self delegate];
    unsigned __int8 v14 = [v13 shouldIgnoreTapOnView:v10 headerView:self];

    if (v14) {
      goto LABEL_12;
    }
  }
  uint64_t v15 = [(ContainerHeaderView *)self accessoryView];
  if (v15)
  {
    double v16 = (void *)v15;
    id v17 = [(ContainerHeaderView *)self accessoryView];
    unsigned int v18 = [v17 isUserInteractionEnabled];

    if (v18)
    {
      uint64_t v19 = [(ContainerHeaderView *)self accessoryView];
      if (v10 == (CardButton *)v19)
      {
      }
      else
      {
        double v20 = (void *)v19;
        uint64_t v21 = [(ContainerHeaderView *)self accessoryView];
        unsigned __int8 v22 = [(CardButton *)v10 isDescendantOfView:v21];

        if ((v22 & 1) == 0) {
          goto LABEL_7;
        }
      }
LABEL_12:
      BOOL v24 = 0;
      goto LABEL_13;
    }
  }
LABEL_7:
  buttonView = self->_buttonView;
  if (buttonView
    && (v10 == buttonView || (-[CardButton isDescendantOfView:](v10, "isDescendantOfView:") & 1) != 0))
  {
    goto LABEL_12;
  }
  BOOL v24 = 1;
LABEL_13:

  return v24;
}

- (HeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)headerSize
{
  return self->_headerSize;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (BOOL)titleViewIgnoresButton
{
  return self->_titleViewIgnoresButton;
}

- (void)setTitleViewIgnoresButton:(BOOL)a3
{
  self->_titleViewIgnoresButton = a3;
}

- (void)setTitleViewLayoutGuide:(id)a3
{
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (double)verticalAlignmentOffset
{
  return self->_verticalAlignmentOffset;
}

- (UIFont)customTitleFont
{
  return self->_customTitleFont;
}

- (UILayoutGuide)accessoryViewLayoutGuide
{
  return self->_accessoryViewLayoutGuide;
}

- (void)setAccessoryViewLayoutGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_customTitleFont, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonCenterVerticallyConstraint, 0);
  objc_storeStrong((id *)&self->_buttonAlignToTopConstraint, 0);
  objc_storeStrong((id *)&self->_defaultTitleLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLayoutGuideEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_titleLayoutGuideEdgeConstraints, 0);
  objc_storeStrong((id *)&self->_trailingButtonEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_buttonEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_trailingButtonsStackView, 0);
  objc_storeStrong((id *)&self->_trailingCardButtons, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_defaultTitleLabel, 0);

  objc_storeStrong((id *)&self->_hairLineView, 0);
}

@end