@interface UIViewControllerWrapperView
+ (UIViewControllerWrapperView)wrapperViewForView:(double)a3 frame:(double)a4;
+ (UIViewControllerWrapperView)wrapperViewForView:(double)a3 wrapperFrame:(double)a4 viewFrame:(double)a5;
+ (id)existingWrapperViewForView:(uint64_t)a1;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)unwrapView;
- (void)unwrapView:(void *)a1;
@end

@implementation UIViewControllerWrapperView

+ (UIViewControllerWrapperView)wrapperViewForView:(double)a3 wrapperFrame:(double)a4 viewFrame:(double)a5
{
  id v18 = a10;
  uint64_t v19 = self;
  if (!v18)
  {
    v21 = 0;
    goto LABEL_7;
  }
  +[UIViewControllerWrapperView existingWrapperViewForView:](v19, v18);
  v20 = (UIViewControllerWrapperView *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = v20;
    -[UIViewControllerWrapperView setFrame:](v20, "setFrame:", a1, a2, a3, a4);
    objc_msgSend(v18, "setFrame:", a5, a6, a7, a8);
  }
  else
  {
    v21 = -[UIView initWithFrame:]([UIViewControllerWrapperView alloc], "initWithFrame:", a1, a2, a3, a4);
    -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", [v18 autoresizingMask]);
    objc_msgSend(v18, "setFrame:", a5, a6, a7, a8);
    [(UIView *)v21 addSubview:v18];
    if (!v21) {
      goto LABEL_7;
    }
  }
  v21->_tightWrappingDisabled = 1;
LABEL_7:

  return v21;
}

+ (id)existingWrapperViewForView:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [v2 superview];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  if (self)
  {
    BOOL tightWrappingDisabled = self->_tightWrappingDisabled;
    v7.receiver = self;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (tightWrappingDisabled) {
      return;
    }
  }
  else
  {
    v7.receiver = 0;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  v5 = [(UIView *)self subviews];
  v6 = [v5 lastObject];
  [(UIView *)self bounds];
  objc_msgSend(v6, "setFrame:");
}

- (void)unwrapView
{
  if (a1)
  {
    id v1 = [a1 subviews];
    [v1 makeObjectsPerformSelector:sel_removeFromSuperview];
  }
}

- (void)unwrapView:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v5 = v3;
    id v4 = +[UIViewControllerWrapperView existingWrapperViewForView:]((uint64_t)UIViewControllerWrapperView, v3);

    id v3 = v5;
    if (v4 == a1)
    {
      [v5 removeFromSuperview];
      id v3 = v5;
    }
  }
}

+ (UIViewControllerWrapperView)wrapperViewForView:(double)a3 frame:(double)a4
{
  id v10 = a6;
  uint64_t v11 = self;
  if (!v10)
  {
    v13 = 0;
    goto LABEL_7;
  }
  +[UIViewControllerWrapperView existingWrapperViewForView:](v11, v10);
  v12 = (UIViewControllerWrapperView *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    -[UIViewControllerWrapperView setFrame:](v12, "setFrame:", a1, a2, a3, a4);
    [(UIView *)v13 bounds];
    objc_msgSend(v10, "setFrame:");
  }
  else
  {
    v13 = -[UIView initWithFrame:]([UIViewControllerWrapperView alloc], "initWithFrame:", a1, a2, a3, a4);
    -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", [v10 autoresizingMask]);
    [(UIView *)v13 bounds];
    objc_msgSend(v10, "setFrame:");
    [(UIView *)v13 addSubview:v10];
    if (!v13) {
      goto LABEL_7;
    }
  }
  v13->_BOOL tightWrappingDisabled = 0;
LABEL_7:

  return v13;
}

- (void)setBounds:(CGRect)a3
{
  if (self)
  {
    BOOL tightWrappingDisabled = self->_tightWrappingDisabled;
    v7.receiver = self;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    if (tightWrappingDisabled) {
      return;
    }
  }
  else
  {
    v7.receiver = 0;
    v7.super_class = (Class)UIViewControllerWrapperView;
    -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  v5 = [(UIView *)self subviews];
  v6 = [v5 lastObject];
  [(UIView *)self bounds];
  objc_msgSend(v6, "setFrame:");
}

@end