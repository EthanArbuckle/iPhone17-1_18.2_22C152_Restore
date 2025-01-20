@interface _UITableViewDropAnimationContainerView
- (BOOL)hasCompletedAllDropAnimations;
- (CGPoint)_tableViewContainerOffsetFromTargetCenter;
- (NSArray)cells;
- (_UITableViewDropAnimationContainerView)init;
- (double)originalTargetCenterY;
- (int64_t)activeDropAnimationCount;
- (void)beginDropAnimation;
- (void)endDropAnimation;
- (void)setActiveDropAnimationCount:(int64_t)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setOriginalTargetCenterY:(double)a3;
- (void)set_tableViewContainerOffsetFromTargetCenter:(CGPoint)a3;
- (void)updateOffsetFromTargetCenterIfNeeded;
@end

@implementation _UITableViewDropAnimationContainerView

- (_UITableViewDropAnimationContainerView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UITableViewDropAnimationContainerView;
  v2 = [(_UITableViewContainerView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UIView *)v2 setEdgesInsettingLayoutMarginsFromSafeArea:[(UIView *)v2 edgesInsettingLayoutMarginsFromSafeArea] & 0xA];
    [(_UITableViewDropAnimationContainerView *)v3 setOriginalTargetCenterY:1.79769313e308];
    [(UIView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (NSArray)cells
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(UIView *)self subviews];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObject:", v9, (void)v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)updateOffsetFromTargetCenterIfNeeded
{
  [(_UITableViewDropAnimationContainerView *)self originalTargetCenterY];
  double v4 = v3;
  if (v3 != 1.79769313e308)
  {
    [(UIView *)self center];
    double v6 = v5 - v4;
    -[_UITableViewDropAnimationContainerView set_tableViewContainerOffsetFromTargetCenter:](self, "set_tableViewContainerOffsetFromTargetCenter:", 0.0, v6);
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITableViewDropAnimationContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UITableViewDropAnimationContainerView *)self updateOffsetFromTargetCenterIfNeeded];
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITableViewDropAnimationContainerView;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  [(_UITableViewDropAnimationContainerView *)self updateOffsetFromTargetCenterIfNeeded];
}

- (void)beginDropAnimation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(_UITableViewDropAnimationContainerView *)self activeDropAnimationCount])
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    [(UIView *)self frame];
    BOOL v4 = CGRectEqualToRect(v11, *MEMORY[0x1E4F1DB28]);
    if (has_internal_diagnostics)
    {
      if (v4)
      {
        double v6 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          int v8 = 138412290;
          uint64_t v9 = self;
          _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "The drop animation container view needs to have a valid frame set before -beginDropAnimation is called the first time: %@", (uint8_t *)&v8, 0xCu);
        }
      }
    }
    else if (v4)
    {
      uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &beginDropAnimation___s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        uint64_t v9 = self;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "The drop animation container view needs to have a valid frame set before -beginDropAnimation is called the first time: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    [(UIView *)self center];
    [(_UITableViewDropAnimationContainerView *)self setOriginalTargetCenterY:v5];
  }
  [(_UITableViewDropAnimationContainerView *)self setActiveDropAnimationCount:[(_UITableViewDropAnimationContainerView *)self activeDropAnimationCount] + 1];
}

- (void)endDropAnimation
{
  [(_UITableViewDropAnimationContainerView *)self setActiveDropAnimationCount:[(_UITableViewDropAnimationContainerView *)self activeDropAnimationCount] - 1];
  if ([(_UITableViewDropAnimationContainerView *)self activeDropAnimationCount] < 0)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UITableViewDropAnimationContainerView.m" lineNumber:94 description:@"UITableView internal inconsistency: attempted to end an animation on the drop animation container view that never began"];
  }
  if (![(_UITableViewDropAnimationContainerView *)self activeDropAnimationCount])
  {
    [(_UITableViewDropAnimationContainerView *)self setOriginalTargetCenterY:1.79769313e308];
  }
}

- (BOOL)hasCompletedAllDropAnimations
{
  return [(_UITableViewDropAnimationContainerView *)self activeDropAnimationCount] == 0;
}

- (CGPoint)_tableViewContainerOffsetFromTargetCenter
{
  double x = self->__tableViewContainerOffsetFromTargetCenter.x;
  double y = self->__tableViewContainerOffsetFromTargetCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_tableViewContainerOffsetFromTargetCenter:(CGPoint)a3
{
  self->__tableViewContainerOffsetFromTargetCenter = a3;
}

- (int64_t)activeDropAnimationCount
{
  return self->_activeDropAnimationCount;
}

- (void)setActiveDropAnimationCount:(int64_t)a3
{
  self->_activeDropAnimationCount = a3;
}

- (double)originalTargetCenterY
{
  return self->_originalTargetCenterY;
}

- (void)setOriginalTargetCenterY:(double)a3
{
  self->_originalTargetCenterY = a3;
}

@end