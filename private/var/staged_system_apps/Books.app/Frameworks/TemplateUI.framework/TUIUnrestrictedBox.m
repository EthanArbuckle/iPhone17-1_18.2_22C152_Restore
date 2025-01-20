@interface TUIUnrestrictedBox
- (Class)layoutClass;
@end

@implementation TUIUnrestrictedBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end