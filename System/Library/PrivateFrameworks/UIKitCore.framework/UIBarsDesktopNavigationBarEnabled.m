@interface UIBarsDesktopNavigationBarEnabled
@end

@implementation UIBarsDesktopNavigationBarEnabled

void ___UIBarsDesktopNavigationBarEnabled_block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v0 objectForKey:@"UseDesktopNavigationBar"];

    if (v1
      || (_UIKitPreferencesOnce(),
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 objectForKey:@"UseDesktopNavigationBar"],
          v1 = objc_claimAutoreleasedReturnValue(),
          v2,
          v1))
    {
      char v3 = [v1 BOOLValue];
    }
    else
    {
      char v3 = 1;
    }
    byte_1EB25C81B = v3;
  }
}

@end