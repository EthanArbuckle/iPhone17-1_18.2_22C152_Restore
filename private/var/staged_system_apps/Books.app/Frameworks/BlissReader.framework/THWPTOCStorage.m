@interface THWPTOCStorage
- (Class)repClass;
@end

@implementation THWPTOCStorage

- (Class)repClass
{
  return (Class)objc_opt_class();
}

@end