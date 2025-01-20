@interface _TUIVisualEffectBoxStyler
- (BOOL)isEqualToStyle:(id)a3;
- (UIVisualEffectView)visualEffectView;
- (_TUIVisualEffectBoxStyler)initWithBlurStyle:(unint64_t)a3;
- (unint64_t)blurStyle;
- (void)applyStylingToView:(id)a3;
- (void)removeStylingFromView:(id)a3;
@end

@implementation _TUIVisualEffectBoxStyler

- (_TUIVisualEffectBoxStyler)initWithBlurStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TUIVisualEffectBoxStyler;
  result = [(_TUIVisualEffectBoxStyler *)&v5 init];
  if (result) {
    result->_blurStyle = a3;
  }
  return result;
}

- (void)applyStylingToView:(id)a3
{
  id v9 = a3;
  if (self->_blurStyle - 1 >= 3) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = self->_blurStyle - 1;
  }
  objc_super v5 = +[UIBlurEffect effectWithStyle:v4];
  [(UIVisualEffectView *)self->_visualEffectView removeFromSuperview];
  v6 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v5];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v6;

  [v9 frame];
  double Width = CGRectGetWidth(v11);
  [v9 frame];
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v12));
  [v9 addSubview:self->_visualEffectView];
  [(UIVisualEffectView *)self->_visualEffectView setAutoresizingMask:18];
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  TUIDynamicCast(v5, v4);
  v6 = (_TUIVisualEffectBoxStyler *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    char v8 = 1;
  }
  else
  {
    id v7 = [(_TUIVisualEffectBoxStyler *)v6 blurStyle];
    char v8 = v7 == (id)[(_TUIVisualEffectBoxStyler *)self blurStyle];
  }

  return v8;
}

- (void)removeStylingFromView:(id)a3
{
  [(UIVisualEffectView *)self->_visualEffectView removeFromSuperview];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = 0;
}

- (unint64_t)blurStyle
{
  return self->_blurStyle;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void).cxx_destruct
{
}

@end