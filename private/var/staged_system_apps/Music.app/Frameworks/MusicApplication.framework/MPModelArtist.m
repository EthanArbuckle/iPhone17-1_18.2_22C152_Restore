@interface MPModelArtist
- (NSString)shortDescription;
- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4;
@end

@implementation MPModelArtist

- (id)storeNavigationHandlerWithSourceViewController:(id)a3 defaultSelectionHandler:(id)a4
{
  return sub_17AE68((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_CD8DB0, (uint64_t)sub_17CDEC, (uint64_t)&block_descriptor_106_0);
}

- (NSString)shortDescription
{
  v2 = self;
  id v3 = [(MPModelArtist *)v2 name];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = sub_AB6510();
    v7 = v6;
  }
  else
  {
    v7 = (void *)0xEE00747369747241;
    uint64_t v5 = 0x206E776F6E6B6E55;
  }
  v11._countAndFlagsBits = v5;
  v11._object = v7;
  sub_AB6700(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 34;
  v12._object = (void *)0xE100000000000000;
  sub_AB6700(v12);

  NSString v8 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

@end