@interface JSImpression
- (NSString)debugDescription;
@end

@implementation JSImpression

- (NSString)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v2 = v9.receiver;
  v3 = [(JSImpression *)&v9 debugDescription];
  uint64_t v4 = sub_AB6510();
  uint64_t v6 = v5;

  uint64_t v10 = v4;
  uint64_t v11 = v6;
  v13._countAndFlagsBits = 10;
  v13._object = (void *)0xE100000000000000;
  sub_AB6700(v13);
  swift_bridgeObjectRetain();
  v14._countAndFlagsBits = sub_AB6260();
  sub_AB6700(v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v7 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
}

@end