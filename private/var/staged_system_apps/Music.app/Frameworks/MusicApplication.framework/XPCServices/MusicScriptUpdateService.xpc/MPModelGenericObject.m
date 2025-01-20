@interface MPModelGenericObject
- (MPModelObject)innermostModelObject;
- (double)preferredArtworkAspectRatio;
@end

@implementation MPModelGenericObject

- (MPModelObject)innermostModelObject
{
  v2 = self;
  id v3 = MPModelGenericObject.innermostModelObject.getter();

  return (MPModelObject *)v3;
}

- (double)preferredArtworkAspectRatio
{
  v2 = self;
  double v3 = 1.0;
  if ([(MPModelGenericObject *)v2 type] == (id)1)
  {
    v4 = (MPModelGenericObject *)[(MPModelGenericObject *)v2 song];
    if (v4)
    {
      v5 = v4;
      [(MPModelGenericObject *)v4 preferredArtworkAspectRatio];
      double v3 = v6;

      v2 = v5;
    }
  }

  return v3;
}

@end