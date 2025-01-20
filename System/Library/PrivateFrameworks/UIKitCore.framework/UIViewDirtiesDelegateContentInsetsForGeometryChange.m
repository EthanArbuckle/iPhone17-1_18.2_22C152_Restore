@interface UIViewDirtiesDelegateContentInsetsForGeometryChange
@end

@implementation UIViewDirtiesDelegateContentInsetsForGeometryChange

void ___UIViewDirtiesDelegateContentInsetsForGeometryChange_block_invoke()
{
  int v0 = dyld_program_sdk_at_least();
  byte_1EB25C0AC = v0;
  if (v0)
  {
    v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v1 objectForKey:@"UIViewUseStaleDelegateContentInsets"];

    v2 = v4;
    if (v4
      || (_UIKitPreferencesOnce(),
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 objectForKey:@"UIViewUseStaleDelegateContentInsets"],
          id v5 = (id)objc_claimAutoreleasedReturnValue(),
          v3,
          (v2 = v5) != 0))
    {
      id v6 = v2;
      byte_1EB25C0AC = [v2 BOOLValue] ^ 1;
    }
  }
}

@end