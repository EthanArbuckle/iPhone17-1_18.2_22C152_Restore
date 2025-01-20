@interface MPModelCurator
- (NSString)shortDescription;
@end

@implementation MPModelCurator

- (NSString)shortDescription
{
  v2 = self;
  id v3 = [(MPModelCurator *)v2 name];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = sub_100534CE0();
    v7 = v6;
  }
  else
  {
    v7 = (void *)0xEF726F7461727543;
    uint64_t v5 = 0x206E776F6E6B6E55;
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