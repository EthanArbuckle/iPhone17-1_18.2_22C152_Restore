@interface _UITableViewCellSwipeContainerView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UITableViewCellSwipeContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_UITableViewCellSwipeContainerView;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UITableViewCellSwipeContainerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v6 = [(UIView *)self subviews];
    uint64_t v7 = [v6 count];

    if (v7)
    {
LABEL_3:

      v5 = 0;
      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v10 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      v11 = [(UIView *)self superview];
      v12 = _logResponderChain(self);
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "A leftover _UITableViewCellSwipeContainerView was hit tested that had no children. This indicates UIKit is not properly cleaning up the container view. tableView: %@; responder chain: %@",
        buf,
        0x16u);
    }
    else
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &hitTest_withEvent____s_category) + 8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      v10 = v9;
      v11 = [(UIView *)self superview];
      v12 = _logResponderChain(self);
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "A leftover _UITableViewCellSwipeContainerView was hit tested that had no children. This indicates UIKit is not properly cleaning up the container view. tableView: %@; responder chain: %@",
        buf,
        0x16u);
    }

LABEL_11:
    goto LABEL_3;
  }
LABEL_4:
  return v5;
}

@end