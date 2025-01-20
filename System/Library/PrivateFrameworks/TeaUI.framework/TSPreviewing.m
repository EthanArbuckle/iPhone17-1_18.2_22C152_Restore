@interface TSPreviewing
- (TSPreviewing)init;
@end

@implementation TSPreviewing

- (TSPreviewing)init
{
  return (TSPreviewing *)Previewing.init()();
}

@end