@interface UIPanelWrapperView
+ (id)existingWrapperViewForView:(id)a3;
+ (id)wrapperViewForView:(id)a3;
- (void)layoutSubviews;
@end

@implementation UIPanelWrapperView

+ (id)wrapperViewForView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 existingWrapperViewForView:v4];
    if (!v5)
    {
      id v6 = objc_alloc((Class)a1);
      [v4 frame];
      v5 = objc_msgSend(v6, "initWithFrame:");
      [v5 setAutoresizingMask:0];
      [v5 setAutoresizesSubviews:0];
      [v5 bounds];
      objc_msgSend(v4, "setFrame:");
      [v5 addSubview:v4];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)existingWrapperViewForView:(id)a3
{
  v3 = [a3 superview];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)UIPanelWrapperView;
  [(UIView *)&v6 layoutSubviews];
  v3 = [(UIView *)self subviews];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = v4[11];
    [(UIView *)self bounds];
    if (v5) {
      objc_msgSend(v5, "_updateControlledViewsToFrame:");
    }
    else {
      objc_msgSend(v4, "setFrame:");
    }
  }
}

@end