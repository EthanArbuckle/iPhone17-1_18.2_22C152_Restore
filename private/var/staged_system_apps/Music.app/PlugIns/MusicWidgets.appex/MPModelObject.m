@interface MPModelObject
- (NSString)shortDescription;
- (double)preferredArtworkAspectRatio;
@end

@implementation MPModelObject

- (NSString)shortDescription
{
  NSString v2 = sub_100534CA0();

  return (NSString *)v2;
}

- (double)preferredArtworkAspectRatio
{
  self;
  NSString v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2)
  {
    self;
    NSString v2 = (void *)swift_dynamicCastObjCClass();
    if (!v2) {
      return 1.0;
    }
  }

  [v2 preferredArtworkAspectRatio];
  return result;
}

@end