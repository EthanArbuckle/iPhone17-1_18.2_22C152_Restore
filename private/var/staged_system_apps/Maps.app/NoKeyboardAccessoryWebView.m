@interface NoKeyboardAccessoryWebView
- (id)inputAccessoryView;
@end

@implementation NoKeyboardAccessoryWebView

- (id)inputAccessoryView
{
  return 0;
}

@end