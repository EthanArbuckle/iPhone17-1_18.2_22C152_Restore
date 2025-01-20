@interface THTableInfo
- (Class)repClass;
@end

@implementation THTableInfo

- (Class)repClass
{
  return (Class)objc_opt_class();
}

@end