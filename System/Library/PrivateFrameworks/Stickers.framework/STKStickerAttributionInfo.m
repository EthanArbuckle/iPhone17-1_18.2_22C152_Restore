@interface STKStickerAttributionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)adamID;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)name;
- (STKStickerAttributionInfo)init;
- (STKStickerAttributionInfo)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation STKStickerAttributionInfo

- (NSNumber)adamID
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___STKStickerAttributionInfo_adamID));
}

- (NSString)bundleIdentifier
{
  v2 = (char *)self + OBJC_IVAR___STKStickerAttributionInfo_bundleIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_25E4258C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_25E4258F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerAttributionInfo_bundleIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)name
{
  if (*(void *)&self->adamID[OBJC_IVAR___STKStickerAttributionInfo_name])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_25E4258C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_25E425DD0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_25E41E7E4((uint64_t)v8);

  sub_25E3E0148((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_25E41EA88();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STKStickerAttributionInfo)initWithCoder:(id)a3
{
  return (STKStickerAttributionInfo *)Sticker.AttributionInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_25E41F128(v4);
}

- (NSString)description
{
  v2 = self;
  sub_25E41F5F8();

  int64_t v3 = (void *)sub_25E4258C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (STKStickerAttributionInfo)init
{
  result = (STKStickerAttributionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end