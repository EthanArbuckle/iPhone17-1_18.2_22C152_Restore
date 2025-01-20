@interface UIViewLocalizeOverrideLayoutEngine
@end

@implementation UIViewLocalizeOverrideLayoutEngine

void ___UIViewLocalizeOverrideLayoutEngine_block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v0 objectForKey:@"UIViewLocalizeOverrideLayoutEngine"];

    if (v1
      || (_UIKitPreferencesOnce(),
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 objectForKey:@"UIViewLocalizeOverrideLayoutEngine"],
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
    byte_1EB25C0BA = v3;
  }
}

@end