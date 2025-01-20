@interface UITextView(UITextViewPrintFormatter)
- (uint64_t)_printFormatterClass;
- (void)drawRect:()UITextViewPrintFormatter forViewPrintFormatter:;
@end

@implementation UITextView(UITextViewPrintFormatter)

- (uint64_t)_printFormatterClass
{
  return objc_opt_class();
}

- (void)drawRect:()UITextViewPrintFormatter forViewPrintFormatter:
{
  id v9 = [a1 _containerView];
  objc_msgSend(v9, "drawRect:", a2, a3, a4, a5);
}

@end