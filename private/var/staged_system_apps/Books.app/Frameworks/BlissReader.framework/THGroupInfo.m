@interface THGroupInfo
- (Class)layoutClass;
@end

@implementation THGroupInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end