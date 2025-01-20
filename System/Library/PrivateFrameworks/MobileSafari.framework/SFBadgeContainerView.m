@interface SFBadgeContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)positionsBadgeRelativeToLayoutMargins;
- (BOOL)showsBadge;
- (CGSize)intrinsicContentSize;
- (UIColor)badgeTintColor;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)pulse;
- (void)setBadgeTintColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setPositionsBadgeRelativeToLayoutMargins:(BOOL)a3;
- (void)setShowsBadge:(BOOL)a3;
@end

@implementation SFBadgeContainerView

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)SFBadgeContainerView;
  [(SFBadgeContainerView *)&v31 layoutSubviews];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  contentView = self->_contentView;
  if (isKindOfClass)
  {
    v5 = [(UIView *)contentView imageView];
  }
  else
  {
    v5 = contentView;
  }
  v6 = v5;
  [(UIView *)v5 bounds];
  -[UIView alignmentRectForFrame:](v6, "alignmentRectForFrame:");
  -[SFBadgeContainerView convertRect:fromView:](self, "convertRect:fromView:", v6);
  CGFloat v29 = v8;
  CGFloat v30 = v7;
  CGFloat v27 = v10;
  CGFloat v28 = v9;
  [(SFBadgeContainerView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (self->_positionsBadgeRelativeToLayoutMargins)
  {
    [(SFBadgeContainerView *)self layoutMargins];
    double v12 = v12 + v19;
    double v14 = v14 + v20;
    double v16 = v16 - (v19 + v21);
    double v18 = v18 - (v20 + v22);
  }
  CGFloat rect = v16;
  v32.origin.x = v12;
  v32.origin.y = v14;
  v32.size.width = v16;
  v32.size.height = v18;
  double v23 = CGRectGetMaxX(v32) + -6.0 + -1.0;
  v33.origin.x = v30;
  v33.origin.y = v29;
  v33.size.width = v28;
  v33.size.height = v27;
  double v26 = fmax(v23, CGRectGetMaxX(v33) + -6.0);
  v34.origin.x = v12;
  v34.origin.y = v14;
  v34.size.width = rect;
  v34.size.height = v18;
  double v24 = CGRectGetMinY(v34) + 1.0;
  v35.origin.x = v30;
  v35.origin.y = v29;
  v35.size.width = v28;
  v35.size.height = v27;
  -[SFBadge setFrame:](self->_badge, "setFrame:", v26, fmax(v24, CGRectGetMinY(v35)), 6.0, 6.0);
  [(UIView *)self->_contentView bounds];
  -[SFBadgeMaskView setFrame:](self->_badgeMask, "setFrame:");
  [(SFBadge *)self->_badge frame];
  -[SFBadgeMaskView setBadgeRect:](self->_badgeMask, "setBadgeRect:");
}

- (void)setShowsBadge:(BOOL)a3
{
  if (self->_showsBadge != a3)
  {
    self->_showsBadge = a3;
    if (a3)
    {
      v4 = objc_alloc_init(SFBadge);
      badge = self->_badge;
      self->_badge = v4;

      [(SFBadge *)self->_badge setUserInteractionEnabled:0];
      [(SFBadge *)self->_badge setTintColor:self->_badgeTintColor];
      [(SFBadgeContainerView *)self addSubview:self->_badge];
      v6 = [SFBadgeMaskView alloc];
      [(UIView *)self->_contentView bounds];
      double v7 = -[SFBadgeMaskView initWithFrame:](v6, "initWithFrame:");
      badgeMask = self->_badgeMask;
      self->_badgeMask = v7;

      [(SFBadgeMaskView *)self->_badgeMask setAutoresizingMask:18];
      [(UIView *)self->_contentView bounds];
      -[SFBadgeMaskView setFrame:](self->_badgeMask, "setFrame:");
      double v9 = self->_badgeMask;
      contentView = self->_contentView;
      [(UIView *)contentView setMaskView:v9];
    }
    else
    {
      [(SFBadge *)self->_badge removeFromSuperview];
      double v11 = self->_badge;
      self->_badge = 0;

      [(UIView *)self->_contentView setMaskView:0];
      double v12 = self->_badgeMask;
      self->_badgeMask = 0;
    }
  }
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  double v8 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    [(UIView *)*p_contentView setMaskView:0];
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      [(UIView *)*p_contentView setTranslatesAutoresizingMaskIntoConstraints:1];
      [(UIView *)*p_contentView setAutoresizingMask:18];
      [(SFBadgeContainerView *)self bounds];
      -[UIView setFrame:](*p_contentView, "setFrame:");
      [(UIView *)*p_contentView bounds];
      -[SFBadgeMaskView setFrame:](self->_badgeMask, "setFrame:");
      [(UIView *)*p_contentView setMaskView:self->_badgeMask];
      [(SFBadgeContainerView *)self insertSubview:*p_contentView atIndex:0];
    }
  }
}

- (void)setBadgeTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeTintColor, a3);
  id v5 = a3;
  [(SFBadge *)self->_badge setTintColor:v5];
}

- (void)pulse
{
  v3 = self->_contentView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(UIView *)v3 progressStyle] == 2) {
    [(UIView *)v3 setNeedsPulseOnView:self];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v6 = self;
  contentView = self->_contentView;
  id v8 = a4;
  -[UIView convertPoint:fromView:](contentView, "convertPoint:fromView:", v6, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](contentView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_contentView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)showsBadge
{
  return self->_showsBadge;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)positionsBadgeRelativeToLayoutMargins
{
  return self->_positionsBadgeRelativeToLayoutMargins;
}

- (void)setPositionsBadgeRelativeToLayoutMargins:(BOOL)a3
{
  self->_positionsBadgeRelativeToLayoutMargins = a3;
}

- (UIColor)badgeTintColor
{
  return self->_badgeTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTintColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_badgeMask, 0);

  objc_storeStrong((id *)&self->_badge, 0);
}

@end