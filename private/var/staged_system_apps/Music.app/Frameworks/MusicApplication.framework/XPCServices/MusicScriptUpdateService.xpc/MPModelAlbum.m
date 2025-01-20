@interface MPModelAlbum
- (NSString)shortDescription;
@end

@implementation MPModelAlbum

- (NSString)shortDescription
{
  v2 = self;
  id v3 = [(MPModelAlbum *)v2 title];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = sub_100460CB0();
    v7 = v6;
  }
  else
  {
    v7 = (void *)0xEE006D75626C4120;
    uint64_t v5 = 0x64656C7469746E55;
  }
  v11._countAndFlagsBits = v5;
  v11._object = v7;
  sub_100460E50(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 34;
  v12._object = (void *)0xE100000000000000;
  sub_100460E50(v12);

  NSString v8 = sub_100460C70();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

@end