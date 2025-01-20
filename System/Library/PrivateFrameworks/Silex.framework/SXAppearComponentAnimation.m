@interface SXAppearComponentAnimation
- (Class)handlerClass;
@end

@implementation SXAppearComponentAnimation

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

@end