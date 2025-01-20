@interface PRXCardBackgroundView
- (PRXCardBackgroundView)initWithFrame:(CGRect)a3;
- (PRXCardBackgroundView)initWithFrame:(CGRect)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4;
- (void)_updateCornerRadius;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PRXCardBackgroundView

- (PRXCardBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v11 = PRXCardContainerDefaultLayoutMargins();
  return -[PRXCardBackgroundView initWithFrame:containerLayoutMargins:](self, "initWithFrame:containerLayoutMargins:", x, y, width, height, v11, v8, v9, v10);
}

- (PRXCardBackgroundView)initWithFrame:(CGRect)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4
{
  CGFloat trailing = a4.trailing;
  CGFloat bottom = a4.bottom;
  CGFloat leading = a4.leading;
  CGFloat top = a4.top;
  v13.receiver = self;
  v13.super_class = (Class)PRXCardBackgroundView;
  double v8 = -[PRXCardBackgroundView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v9 = v8;
  if (v8)
  {
    v8->_containerLayoutMargins.CGFloat top = top;
    v8->_containerLayoutMargins.CGFloat leading = leading;
    v8->_containerLayoutMargins.CGFloat bottom = bottom;
    v8->_containerLayoutMargins.CGFloat trailing = trailing;
    double v10 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(PRXCardBackgroundView *)v9 setBackgroundColor:v10];

    [(PRXCardBackgroundView *)v9 _updateCornerRadius];
    double v11 = v9;
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PRXCardBackgroundView;
  id v4 = a3;
  [(PRXCardBackgroundView *)&v14 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayCornerRadius", v14.receiver, v14.super_class);
  double v6 = v5;

  v7 = [(PRXCardBackgroundView *)self traitCollection];
  [v7 displayCornerRadius];
  double v9 = v8;

  if (v6 != v9) {
    [(PRXCardBackgroundView *)self _updateCornerRadius];
  }
  double v10 = [(PRXCardBackgroundView *)self traitCollection];
  double v11 = [v10 customBackgroundColor];

  if (v11)
  {
    v12 = [(PRXCardBackgroundView *)self traitCollection];
    objc_super v13 = [v12 customBackgroundColor];
    [(PRXCardBackgroundView *)self setBackgroundColor:v13];
  }
}

- (void)_updateCornerRadius
{
  v3 = [(PRXCardBackgroundView *)self traitCollection];
  [v3 displayCornerRadius];
  double v5 = v4 - self->_containerLayoutMargins.bottom;

  double v6 = fmax(13.0, v5);
  [(PRXCardBackgroundView *)self _setContinuousCornerRadius:v6];
}

@end