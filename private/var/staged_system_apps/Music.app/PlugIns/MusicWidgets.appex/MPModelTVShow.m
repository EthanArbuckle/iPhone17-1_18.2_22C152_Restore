@interface MPModelTVShow
- (NSString)shortDescription;
@end

@implementation MPModelTVShow

- (NSString)shortDescription
{
  v2 = self;
  id v3 = [(MPModelTVShow *)v2 title];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = sub_100534CE0();
    v7 = v6;
  }
  else
  {
    v7 = (void *)0xED0000776F685320;
    uint64_t v5 = 0x64656C7469746E55;
  }
  v11._countAndFlagsBits = v5;
  v11._object = v7;
  sub_100534E80(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 34;
  v12._object = (void *)0xE100000000000000;
  sub_100534E80(v12);

  NSString v8 = sub_100534CA0();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

@end