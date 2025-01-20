@interface UIKeyboardSplitControlMenu_Merge
- (BOOL)visible;
- (NSString)label;
- (void)actionForMenu:(id)a3;
@end

@implementation UIKeyboardSplitControlMenu_Merge

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(@"Merge", @"Merge");
}

- (BOOL)visible
{
  return +[UIKeyboardImpl isSplit];
}

- (void)actionForMenu:(id)a3
{
  id v3 = a3;
  UIKeyboardSetSplit(0);
  [v3 setFinishSplitTransitionBlock:0];

  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 setRivenSplitLock:1];
}

@end