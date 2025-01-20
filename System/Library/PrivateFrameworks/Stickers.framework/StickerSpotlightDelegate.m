@interface StickerSpotlightDelegate
- (id)attributeSetForObject:(id)a3;
- (id)bundleIdentifier;
- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4;
@end

@implementation StickerSpotlightDelegate

- (id)bundleIdentifier
{
  v2 = (void *)sub_25E4258C0();
  return v2;
}

- (id)attributeSetForObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_25E4239D0(v4);

  return v6;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_25E425690();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for StickerSpotlightDelegate();
  id v8 = [(NSCoreDataCoreSpotlightDelegate *)&v10 initForStoreWithDescription:v6 coordinator:v7];

  return v8;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8Stickers24StickerSpotlightDelegate_logger;
  uint64_t v3 = sub_25E4256A0();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end