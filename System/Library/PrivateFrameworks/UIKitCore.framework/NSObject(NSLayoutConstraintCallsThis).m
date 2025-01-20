@interface NSObject(NSLayoutConstraintCallsThis)
- (NSString)className;
@end

@implementation NSObject(NSLayoutConstraintCallsThis)

- (NSString)className
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end