@interface TUImages
- (TUImages)init;
@end

@implementation TUImages

- (TUImages)init
{
  return (TUImages *)Images.init()();
}

@end