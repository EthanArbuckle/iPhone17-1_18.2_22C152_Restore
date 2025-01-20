@interface TUILayoutOptionsBox
- (Class)layoutClass;
@end

@implementation TUILayoutOptionsBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end