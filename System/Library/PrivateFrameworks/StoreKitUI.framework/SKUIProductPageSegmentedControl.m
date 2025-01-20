@interface SKUIProductPageSegmentedControl
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SKUIProductPageSegmentedControl

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageSegmentedControl hitTest:withEvent:]();
  }
  if ([(SKUIProductPageSegmentedControl *)self isEnabled]
    && ![(SKUIProductPageSegmentedControl *)self isHidden])
  {
    [(SKUIProductPageSegmentedControl *)self bounds];
    v19.origin.double x = v9 + -10.0;
    v19.origin.double y = v10 + -10.0;
    v19.size.width = v11 + 20.0;
    v19.size.height = v12 + 20.0;
    v18.double x = x;
    v18.double y = y;
    if (CGRectContainsPoint(v19, v18)) {
      v13 = self;
    }
    else {
      v13 = 0;
    }
    v8 = v13;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SKUIProductPageSegmentedControl;
    -[SKUIProductPageSegmentedControl hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    v8 = (SKUIProductPageSegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v8;

  return v14;
}

- (void)hitTest:withEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageSegmentedControl hitTest:withEvent:]";
}

@end