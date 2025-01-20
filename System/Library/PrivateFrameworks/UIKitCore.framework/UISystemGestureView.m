@interface UISystemGestureView
- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (CGRect)_responderSelectionRectForWindow:(id)a3;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation UISystemGestureView

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v10 = [(UIView *)self window];
  if (v10 == a5)
  {
    v13.receiver = self;
    v13.super_class = (Class)UISystemGestureView;
    v11 = -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v13, sel__hitTest_withEvent_windowServerHitTestWindow_, a4, a5, x, y);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    v6 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_5;
    }
    BOOL v9 = [(UIView *)self isUserInteractionEnabled];
    v8 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)buf = 136316162;
    v12 = "-[UISystemGestureView setUserInteractionEnabled:]";
    __int16 v13 = 1024;
    BOOL v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    __int16 v17 = 2112;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "%s: Modifying userInteractionEnabled is not supported: old: %d; new: %d; self: %@; \n%@",
      buf,
      0x2Cu);
LABEL_4:

LABEL_5:
    goto LABEL_6;
  }
  v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setUserInteractionEnabled____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    BOOL v7 = [(UIView *)self isUserInteractionEnabled];
    v8 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)buf = 136316162;
    v12 = "-[UISystemGestureView setUserInteractionEnabled:]";
    __int16 v13 = 1024;
    BOOL v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    __int16 v17 = 2112;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%s: Modifying userInteractionEnabled is not supported: old: %d; new: %d; self: %@; \n%@",
      buf,
      0x2Cu);
    goto LABEL_4;
  }
LABEL_6:
  v10.receiver = self;
  v10.super_class = (Class)UISystemGestureView;
  [(UIView *)&v10 setUserInteractionEnabled:v3];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 0;
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  return 0;
}

- (CGRect)_responderSelectionRectForWindow:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

@end