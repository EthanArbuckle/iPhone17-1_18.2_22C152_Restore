@interface MPModelSocialPerson
- (BOOL)isEqual:(id)a3;
- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
- (int64_t)hash;
@end

@implementation MPModelSocialPerson

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_17AE68((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_CD8D10, (uint64_t)sub_17CDEC, (uint64_t)&block_descriptor_92);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_AB7E30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = MPModelSocialPerson.isEqual(_:)((uint64_t)v8);

  sub_A85C8((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = MPModelSocialPerson.hash.getter();

  return v3;
}

@end