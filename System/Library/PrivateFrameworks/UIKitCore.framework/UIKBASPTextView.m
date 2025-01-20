@interface UIKBASPTextView
- (BOOL)_shouldIgnoreAutofillSave;
@end

@implementation UIKBASPTextView

- (BOOL)_shouldIgnoreAutofillSave
{
  return 1;
}

@end