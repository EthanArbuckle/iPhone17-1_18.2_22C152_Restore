@interface SXComponentTextStorage
- (Class)layoutClass;
@end

@implementation SXComponentTextStorage

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end