@interface UIAppSpecificUserInterfaceStyle
@end

@implementation UIAppSpecificUserInterfaceStyle

void ___UIAppSpecificUserInterfaceStyle_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    v0 = [MEMORY[0x1E4F28B50] mainBundle];
    v1 = [v0 objectForInfoDictionaryKey:@"UIUserInterfaceStyle"];

    if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      int v2 = dyld_program_sdk_at_least();

      if (v2) {
        v1 = @"Automatic";
      }
      else {
        v1 = @"Light";
      }
    }
    if ([(__CFString *)v1 isEqualToString:@"Automatic"])
    {
      uint64_t v3 = 0;
    }
    else if ([(__CFString *)v1 isEqualToString:@"Dark"])
    {
      uint64_t v3 = 2;
    }
    else
    {
      if (([(__CFString *)v1 isEqualToString:@"Light"] & 1) == 0)
      {
        v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIInterfaceStyle", &qword_1EB25B8D8) + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          int v5 = 138543874;
          v6 = v1;
          __int16 v7 = 2114;
          v8 = @"UIUserInterfaceStyle";
          __int16 v9 = 2114;
          v10 = @"Light";
          _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "'%{public}@' is not a recognized value for %{public}@. Defaulting to %{public}@.", (uint8_t *)&v5, 0x20u);
        }
      }
      uint64_t v3 = 1;
    }
    qword_1EB25B8C8 = v3;
  }
  else
  {
    qword_1EB25B8C8 = 1;
  }
}

@end