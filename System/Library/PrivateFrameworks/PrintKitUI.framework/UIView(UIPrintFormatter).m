@interface UIView(UIPrintFormatter)
- (id)viewPrintFormatter;
- (uint64_t)_printFormatterClass;
@end

@implementation UIView(UIPrintFormatter)

- (uint64_t)_printFormatterClass
{
  return objc_opt_class();
}

- (id)viewPrintFormatter
{
  v1 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_printFormatterClass")), "_initWithView:", a1);
  return v1;
}

@end