@interface _STKStickerAttributionInfo
- (NSNumber)adamID;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)name;
- (_STKStickerAttributionInfo)init;
- (_STKStickerAttributionInfo)initWithAdamID:(id)a3 bundleIdentifier:(id)a4 name:(id)a5;
@end

@implementation _STKStickerAttributionInfo

- (NSNumber)adamID
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____STKStickerAttributionInfo_adamID));
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKStickerAttributionInfo_bundleIdentifier);
}

- (NSString)name
{
  return (NSString *)sub_25E3D259C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKStickerAttributionInfo_name);
}

- (_STKStickerAttributionInfo)initWithAdamID:(id)a3 bundleIdentifier:(id)a4 name:(id)a5
{
  if (!a4)
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = sub_25E4258F0();
  uint64_t v10 = v9;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = sub_25E4258F0();
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____STKStickerAttributionInfo_adamID) = (Class)a3;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerAttributionInfo_bundleIdentifier);
  uint64_t *v13 = v8;
  v13[1] = v10;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____STKStickerAttributionInfo_name);
  uint64_t *v14 = v11;
  v14[1] = v12;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for _STKStickerAttributionInfo();
  id v15 = a3;
  return [(_STKStickerAttributionInfo *)&v17 init];
}

- (NSString)description
{
  return (NSString *)sub_25E3F07F4(self, (uint64_t)a2, (void (*)(void))sub_25E3F0864);
}

- (_STKStickerAttributionInfo)init
{
  result = (_STKStickerAttributionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end