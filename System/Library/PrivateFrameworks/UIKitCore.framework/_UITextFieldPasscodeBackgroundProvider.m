@interface _UITextFieldPasscodeBackgroundProvider
- (Class)systemBackgroundViewClass;
@end

@implementation _UITextFieldPasscodeBackgroundProvider

- (Class)systemBackgroundViewClass
{
  return (Class)objc_opt_class();
}

@end