@interface _UIFeedbackButtonBehavior
+ (id)buttonBehaviorWithStyle:(int64_t)a3 coordinateSpace:(id)a4;
@end

@implementation _UIFeedbackButtonBehavior

+ (id)buttonBehaviorWithStyle:(int64_t)a3 coordinateSpace:(id)a4
{
  id v7 = a4;
  _UIIsPrivateMainBundle();
  if (dyld_program_sdk_at_least())
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"_UIButtonFeedbackGenerator.m" lineNumber:177 description:@"Use of _UIFeedbackButtonBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based _UIFeedbackButtonGenerator methods."];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v12 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Use of _UIFeedbackButtonBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based _UIFeedbackButtonGenerator methods.  This will become an assert in a future version.", buf, 2u);
    }
  }
  else
  {
    v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &buttonBehaviorWithStyle_coordinateSpace____s_category)
                      + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Use of _UIFeedbackButtonBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based _UIFeedbackButtonGenerator methods.  This will become an assert in a future version.", v13, 2u);
    }
  }
  v10 = (void *)[objc_alloc((Class)a1) initWithStyle:a3 coordinateSpace:v7];

  return v10;
}

@end