@interface UIKeyboardSplitControlMenu_Undock
- (BOOL)visible;
- (NSString)label;
- (void)actionForMenu:(id)a3;
@end

@implementation UIKeyboardSplitControlMenu_Undock

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(@"Undock", @"Undock");
}

- (BOOL)visible
{
  if (+[UIKeyboardImpl rivenPreference]
    && !+[UIKeyboardImpl isSplit])
  {
    v3 = +[UIPeripheralHost sharedInstance];
    int v2 = [v3 isUndocked] ^ 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)actionForMenu:(id)a3
{
  [a3 setFinishSplitTransitionBlock:0];
  UIKeyboardSetUndocked(1);
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 setRivenSplitLock:1];
}

@end