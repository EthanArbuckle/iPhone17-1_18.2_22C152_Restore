@interface UIKeyboardSplitControlMenu_DockAndMerge
- (BOOL)visible;
- (NSString)label;
- (void)actionForMenu:(id)a3;
@end

@implementation UIKeyboardSplitControlMenu_DockAndMerge

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(@"Dock and Merge", @"Dock and Merge");
}

- (BOOL)visible
{
  BOOL v2 = +[UIKeyboardImpl rivenPreference];
  if (v2)
  {
    LOBYTE(v2) = +[UIKeyboardImpl isSplit];
  }
  return v2;
}

- (void)actionForMenu:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__UIKeyboardSplitControlMenu_DockAndMerge_actionForMenu___block_invoke;
  v5[3] = &unk_1E52DC3A0;
  id v6 = v3;
  id v4 = v3;
  +[UIPeripheralHost setFloating:0 onCompletion:v5];
}

@end