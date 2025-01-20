@interface SXComponentBehavior
- (Class)handlerClassForComponent:(id)a3;
@end

@implementation SXComponentBehavior

- (Class)handlerClassForComponent:(id)a3
{
  return (Class)objc_opt_class();
}

@end