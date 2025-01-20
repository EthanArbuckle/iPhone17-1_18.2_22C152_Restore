@interface MPModelMovie
- (NSString)musicTypeIdentifier;
- (NSString)shortDescription;
@end

@implementation MPModelMovie

- (NSString)musicTypeIdentifier
{
  NSString v2 = sub_AB64D0();

  return (NSString *)v2;
}

- (NSString)shortDescription
{
  NSString v2 = self;
  id v3 = [(MPModelMovie *)v2 title];
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = sub_AB6510();
    v7 = v6;
  }
  else
  {
    v7 = (void *)0xEE006569766F4D20;
    uint64_t v5 = 0x64656C7469746E55;
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