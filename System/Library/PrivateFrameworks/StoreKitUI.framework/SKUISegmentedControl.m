@interface SKUISegmentedControl
- (CGRect)frameForSegmentAtIndex:(int64_t)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SKUISegmentedControl

- (CGRect)frameForSegmentAtIndex:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISegmentedControl frameForSegmentAtIndex:]();
  }
  [(SKUISegmentedControl *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = v7 / (double)(unint64_t)[(SKUISegmentedControl *)self numberOfSegments] * (double)a3;
  double v12 = v8 / (double)(unint64_t)[(SKUISegmentedControl *)self numberOfSegments];
  double v13 = v11;
  double v14 = v6;
  double v15 = v10;
  result.size.height = v15;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISegmentedControl touchesEnded:withEvent:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUISegmentedControl;
  [(SKUISegmentedControl *)&v8 touchesEnded:v6 withEvent:v7];
  [(SKUISegmentedControl *)self sendActionsForControlEvents:4096];
}

- (void)frameForSegmentAtIndex:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISegmentedControl frameForSegmentAtIndex:]";
}

- (void)touchesEnded:withEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISegmentedControl touchesEnded:withEvent:]";
}

@end