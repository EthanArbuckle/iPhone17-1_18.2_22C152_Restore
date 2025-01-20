@interface THWWidgetBackgroundInfo
- (Class)repClass;
@end

@implementation THWWidgetBackgroundInfo

- (Class)repClass
{
  return (Class)objc_opt_class();
}

@end