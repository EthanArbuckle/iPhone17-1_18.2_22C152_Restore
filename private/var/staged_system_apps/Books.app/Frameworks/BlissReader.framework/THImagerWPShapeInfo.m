@interface THImagerWPShapeInfo
- (Class)layoutClass;
@end

@implementation THImagerWPShapeInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

@end