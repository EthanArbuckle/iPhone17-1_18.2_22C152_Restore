@interface UIApplicationIsExtension
@end

@implementation UIApplicationIsExtension

void ___UIApplicationIsExtension_block_invoke()
{
  v0 = [MEMORY[0x1E4F28C70] extensionInfoForCurrentProcess];

  if (v0)
  {
    byte_1EB25B4E3 = 1;
  }
  else
  {
    v1 = [MEMORY[0x1E4F28B50] mainBundle];
    v2 = [v1 infoDictionary];
    v3 = [v2 objectForKey:@"NSExtension"];

    if (v3) {
      goto LABEL_5;
    }
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 infoDictionary];
    v6 = [v5 objectForKey:@"PlugInKit"];

    if (v6)
    {
LABEL_5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v3 objectForKey:@"NSExtensionPointIdentifier"],
            v7 = objc_claimAutoreleasedReturnValue(),
            char v8 = [v7 isEqual:@"com.apple.accessibility.AccessibilityUIServer"],
            v7,
            (v8 & 1) == 0))
      {
        if (os_variant_has_internal_diagnostics())
        {
          v11 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Plist keys indicate the current process is an extension but NSExtensionMain() has not been called. UIKit will treat this process as an extension.", buf, 2u);
          }
        }
        else
        {
          v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B5C0) + 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v12 = 0;
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Plist keys indicate the current process is an extension but NSExtensionMain() has not been called. UIKit will treat this process as an extension.", v12, 2u);
          }
        }
      }
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
    }
    byte_1EB25B4E3 = v10;
  }
}

@end