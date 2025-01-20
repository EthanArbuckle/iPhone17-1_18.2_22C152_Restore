@interface MasterNavigationPaletteView
- (BOOL)showIdentity;
- (BOOL)showsHeader;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CUIKCalendarModel)model;
- (MasterNavigationPaletteDelegate)delegate;
- (MasterNavigationPaletteView)initWithFrame:(CGRect)a3;
- (NSString)title;
- (UISegmentedControl)segmentedControl;
- (void)cellTapped;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setShowIdentity:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)updateIdentity:(id)a3;
@end

@implementation MasterNavigationPaletteView

- (MasterNavigationPaletteView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MasterNavigationPaletteView;
  v3 = -[MasterNavigationPaletteView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init((Class)UINavigationBarAppearance);
    uint64_t v5 = [v4 largeTitleTextAttributes];
    titleAttributes = v3->_titleAttributes;
    v3->_titleAttributes = (NSDictionary *)v5;

    v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    [(MasterNavigationPaletteView *)v3 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ([(MasterNavigationPaletteView *)self showsHeader])
  {
    if (self->_showIdentity) {
      v6 = &OBJC_IVAR___MasterNavigationPaletteView__identityCell;
    }
    else {
      v6 = &OBJC_IVAR___MasterNavigationPaletteView__titleLabel;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v6) frame];
    double height = CGRectGetMaxY(v12);
  }
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    [(UISegmentedControl *)segmentedControl frame];
    double height = CGRectGetMaxY(v13);
  }
  double v8 = height + 16.0;
  if (![(MasterNavigationPaletteView *)self showsHeader] && !self->_segmentedControl) {
    double v8 = 0.0;
  }
  double v9 = width;
  double v10 = v8;
  result.double height = v10;
  result.CGFloat width = v9;
  return result;
}

- (BOOL)showsHeader
{
  v2 = [(MasterNavigationPaletteView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] != 0;

  return v3;
}

- (void)setShowIdentity:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showIdentity = a3;
  if ([(MasterNavigationPaletteView *)self showsHeader])
  {
    if (v3)
    {
      uint64_t v5 = [(CUIKCalendarModel *)self->_model sourceForSelectedIdentity];
      [(MasterNavigationPaletteView *)self updateIdentity:v5];

      titleLabel = self->_titleLabel;
      [(UILabel *)titleLabel removeFromSuperview];
    }
    else
    {
      [(IdentitySwitcherCell *)self->_identityCell removeFromSuperview];
      v7 = self->_titleLabel;
      [(MasterNavigationPaletteView *)self addSubview:v7];
    }
  }
}

- (void)setModel:(id)a3
{
  self->_model = (CUIKCalendarModel *)a3;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MasterNavigationPaletteDelegate *)a3;
}

- (void)layoutSubviews
{
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  [(MasterNavigationPaletteView *)self safeAreaInsets];
  if (IsLeftToRight) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  double v7 = 16.0;
  double v8 = v6 + 16.0;
  int v9 = CalInterfaceIsLeftToRight();
  [(MasterNavigationPaletteView *)self safeAreaInsets];
  if (v9) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  double v13 = v12 + 16.0;
  if ([(MasterNavigationPaletteView *)self showsHeader])
  {
    if (self->_showIdentity)
    {
      if (CalInterfaceIsLeftToRight()) {
        double v14 = v8;
      }
      else {
        double v14 = v13;
      }
      [(MasterNavigationPaletteView *)self bounds];
      CGFloat v16 = v15 - (v8 + v13);
      -[IdentitySwitcherCell systemLayoutSizeFittingSize:](self->_identityCell, "systemLayoutSizeFittingSize:", v16, 0.0);
      CGFloat v18 = v17;
      -[IdentitySwitcherCell setFrame:](self->_identityCell, "setFrame:", v14, 6.0, v16, v17);
      v33.origin.y = 6.0;
      v33.origin.x = v14;
      v33.size.CGFloat width = v16;
      v33.size.double height = v18;
      double v7 = CGRectGetMaxY(v33) + 16.0;
    }
    else
    {
      [(UILabel *)self->_titleLabel frame];
      double v20 = v19;
      double v22 = v21;
      double v23 = v8;
      if ((CalInterfaceIsLeftToRight() & 1) == 0)
      {
        [(MasterNavigationPaletteView *)self bounds];
        double v23 = v24 - v8 - v20;
      }
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v23, 16.0, v20, v22);
      v34.origin.y = 16.0;
      v34.origin.x = v23;
      v34.size.CGFloat width = v20;
      v34.size.double height = v22;
      double v7 = CGRectGetMaxY(v34) + 16.0;
    }
  }
  else
  {
    [(UILabel *)self->_titleLabel removeFromSuperview];
    [(IdentitySwitcherCell *)self->_identityCell removeFromSuperview];
  }
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    [(UISegmentedControl *)segmentedControl frame];
    double v27 = v26;
    if (CalInterfaceIsLeftToRight()) {
      double v28 = v8;
    }
    else {
      double v28 = v13;
    }
    [(MasterNavigationPaletteView *)self bounds];
    v29 = self->_segmentedControl;
    double v31 = v30 - (v8 + v13);
    -[UISegmentedControl setFrame:](v29, "setFrame:", v28, v7, v31, v27);
  }
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];
  double v4 = [(MasterNavigationPaletteView *)self window];
  double v5 = [(MasterNavigationPaletteView *)self traitCollection];
  double v6 = paletteTitleFont(v4, v5);
  [(UILabel *)self->_titleLabel setFont:v6];

  titleLabel = self->_titleLabel;

  [(UILabel *)titleLabel sizeToFit];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setSegmentedControl:(id)a3
{
  double v4 = (UISegmentedControl *)a3;
  segmentedControl = self->_segmentedControl;
  if (segmentedControl != v4)
  {
    double v6 = v4;
    if (segmentedControl)
    {
      segmentedControl = (UISegmentedControl *)[(UISegmentedControl *)segmentedControl removeFromSuperview];
      double v4 = v6;
    }
    self->_segmentedControl = v4;
    if (v4)
    {
      segmentedControl = (UISegmentedControl *)[(MasterNavigationPaletteView *)self addSubview:v6];
      double v4 = v6;
    }
  }

  _objc_release_x1(segmentedControl, v4);
}

- (void)updateIdentity:(id)a3
{
  identityCell = self->_identityCell;
  id v5 = a3;
  [(IdentitySwitcherCell *)identityCell removeFromSuperview];
  double v6 = +[IdentitySwitcherCell cellForSource:v5 withModel:self->_model inTableView:0];

  double v7 = self->_identityCell;
  self->_identityCell = v6;

  [(IdentitySwitcherCell *)self->_identityCell setSelectionStyle:0];
  [(IdentitySwitcherCell *)self->_identityCell setAccessoryType:1];
  double v8 = +[UIColor tableCellGroupedBackgroundColor];
  [(IdentitySwitcherCell *)self->_identityCell setBackgroundColor:v8];

  int v9 = [(IdentitySwitcherCell *)self->_identityCell layer];
  [v9 setCornerRadius:10.0];

  id v10 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"cellTapped"];
  [(IdentitySwitcherCell *)self->_identityCell addGestureRecognizer:v10];
  [(MasterNavigationPaletteView *)self addSubview:self->_identityCell];
}

- (void)cellTapped
{
  id v3 = [(MasterNavigationPaletteView *)self delegate];
  [v3 palette:self identitySwitcherTapped:self->_identityCell];
}

- (MasterNavigationPaletteDelegate)delegate
{
  return self->_delegate;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (BOOL)showIdentity
{
  return self->_showIdentity;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_identityCell, 0);
}

@end