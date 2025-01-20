@interface UIKeyboardSplitControlMenu_Floating
- (BOOL)visible;
- (NSString)label;
- (void)actionForMenu:(id)a3;
@end

@implementation UIKeyboardSplitControlMenu_Floating

- (NSString)label
{
  return (NSString *)_UILocalizedStringInSystemLanguage(@"Floating", @"Floating");
}

- (BOOL)visible
{
  BOOL v2 = +[UIKeyboardImpl supportsFloating];
  if (v2) {
    LOBYTE(v2) = !+[UIKeyboardImpl isFloating];
  }
  return v2;
}

- (void)actionForMenu:(id)a3
{
  +[UIPeripheralHost setFloating:1 onCompletion:&__block_literal_global_392];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  +[UIKBAnalyticsDispatcher floatingKeyboardSummonedEvent:@"Untether", @"NonInteractive", v3, v4 trigger finalPosition];
}

@end