@interface BAUpSellData
- (BAUpSellData)init;
- (BAUpSellData)initWithLocation:(int64_t)a3 variant:(int64_t)a4 variantVersion:(id)a5;
- (NSString)variantVersion;
- (int64_t)location;
- (int64_t)variant;
@end

@implementation BAUpSellData

- (int64_t)location
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_location);
}

- (int64_t)variant
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_variant);
}

- (NSString)variantVersion
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_27DDA0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BAUpSellData)initWithLocation:(int64_t)a3 variant:(int64_t)a4 variantVersion:(id)a5
{
  uint64_t v8 = sub_27DDB0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_location) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAUpSellData_variant) = (Class)a4;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___BAUpSellData_variantVersion);
  uint64_t *v9 = v8;
  v9[1] = v10;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for BridgedUpSellData();
  return [(BAUpSellData *)&v12 init];
}

- (BAUpSellData)init
{
  result = (BAUpSellData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end