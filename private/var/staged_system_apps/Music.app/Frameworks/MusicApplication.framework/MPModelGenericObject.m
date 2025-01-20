@interface MPModelGenericObject
- (MPModelObject)innermostModelObject;
- (double)preferredArtworkAspectRatio;
- (id)storeContentItemObject;
- (id)storeContentItemObjectPropertiesFor:(id)a3;
@end

@implementation MPModelGenericObject

- (id)storeContentItemObject
{
  return sub_2A08EC(self, (uint64_t)a2, (SEL *)&selRef_anyObject);
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(MPModelGenericObject *)v5 anyObject];
  id v7 = [v6 storeContentItemObjectPropertiesFor:v4];

  return v7;
}

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
  if ([(MPModelGenericObject *)v2 type] == (char *)&def_3B9D84 + 1)
  {
    id v4 = (MPModelGenericObject *)[(MPModelGenericObject *)v2 song];
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