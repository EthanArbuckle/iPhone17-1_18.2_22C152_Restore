@interface UIKeyShortcutHUDShortcut
@end

@implementation UIKeyShortcutHUDShortcut

void __43___UIKeyShortcutHUDShortcut_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  [v5 setBaseShortcutForAlternate:v4];
  [v5 setAlternateForBaseShortcut:v6];
}

@end