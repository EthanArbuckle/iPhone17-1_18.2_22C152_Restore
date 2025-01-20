@interface UIKeyboardSplitControlMenu_Dock
- (BOOL)visible;
- (NSString)label;
- (void)actionForMenu:(id)a3;
@end

@implementation UIKeyboardSplitControlMenu_Dock

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(@"Dock", @"Dock");
}

- (BOOL)visible
{
  if (+[UIKeyboardImpl isSplit]) {
    return 0;
  }
  v3 = +[UIPeripheralHost sharedInstance];
  char v4 = [v3 isUndocked];

  return v4;
}

- (void)actionForMenu:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__UIKeyboardSplitControlMenu_Dock_actionForMenu___block_invoke;
  v5[3] = &unk_1E52DC3A0;
  id v6 = v3;
  id v4 = v3;
  +[UIPeripheralHost setFloating:0 onCompletion:v5];
}

@end