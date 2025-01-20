@interface UIFocusDebugWindow
@end

@implementation UIFocusDebugWindow

void __56___UIFocusDebugWindow_ModuleRegistration__moduleClasses__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v5 = (id)v0;
  if (qword_1EB261758 == -1)
  {
    v1 = (void *)v0;
  }
  else
  {
    dispatch_once(&qword_1EB261758, &__block_literal_global_4_11);
    v1 = v5;
  }
  if (_MergedGlobals_1116)
  {
    [v5 addObject:objc_opt_class()];
    int v2 = dyld_program_sdk_at_least();
    v1 = v5;
    if (v2)
    {
      [v5 addObject:objc_opt_class()];
      v1 = v5;
    }
  }
  uint64_t v3 = [v1 copy];
  v4 = (void *)qword_1EB261748;
  qword_1EB261748 = v3;
}

@end