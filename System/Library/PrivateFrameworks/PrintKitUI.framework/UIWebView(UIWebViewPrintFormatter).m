@interface UIWebView(UIWebViewPrintFormatter)
- (uint64_t)_printFormatterClass;
@end

@implementation UIWebView(UIWebViewPrintFormatter)

- (uint64_t)_printFormatterClass
{
  return objc_opt_class();
}

@end