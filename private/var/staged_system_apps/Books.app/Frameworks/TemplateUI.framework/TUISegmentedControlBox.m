@interface TUISegmentedControlBox
- (Class)layoutClass;
@end

@implementation TUISegmentedControlBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end