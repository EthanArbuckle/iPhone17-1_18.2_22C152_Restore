@interface _TVActivityView
- (UIView)activityView;
- (UIView)textView;
- (void)layoutSubviews;
- (void)setActivityView:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation _TVActivityView

- (void)setActivityView:(id)a3
{
  v5 = (UIView *)a3;
  activityView = self->_activityView;
  v7 = v5;
  if (activityView != v5)
  {
    [(UIView *)activityView removeFromSuperview];
    objc_storeStrong((id *)&self->_activityView, a3);
    if (self->_activityView) {
      -[_TVActivityView addSubview:](self, "addSubview:");
    }
  }
  [(_TVActivityView *)self setNeedsLayout];
}

- (void)setTextView:(id)a3
{
  v5 = (UIView *)a3;
  textView = self->_textView;
  v7 = v5;
  if (textView != v5)
  {
    [(UIView *)textView removeFromSuperview];
    objc_storeStrong((id *)&self->_textView, a3);
    if (self->_textView) {
      -[_TVActivityView addSubview:](self, "addSubview:");
    }
  }
  [(_TVActivityView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(_TVActivityView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(_TVActivityView *)self activityView];
  objc_msgSend(v7, "tv_itemWidth");
  v8 = [(_TVActivityView *)self activityView];
  objc_msgSend(v8, "tv_itemHeight");
  UIRectCenteredIntegralRect();
  double v10 = v9;
  CGFloat recta = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = [(_TVActivityView *)self activityView];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = [(_TVActivityView *)self textView];
  objc_msgSend(v18, "tv_margin");

  v19 = [(_TVActivityView *)self textView];
  objc_msgSend(v19, "sizeThatFits:", v4, v6);

  v23.origin.x = recta;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  CGRectGetMinY(v23);
  rect = [(_TVActivityView *)self textView];
  UIRectCenteredXInRect();
  objc_msgSend(rect, "setFrame:");
}

- (UIView)activityView
{
  return self->_activityView;
}

- (UIView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end