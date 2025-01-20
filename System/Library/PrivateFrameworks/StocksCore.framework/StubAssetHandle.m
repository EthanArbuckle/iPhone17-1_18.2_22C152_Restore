@interface StubAssetHandle
- (FCAssetDataProvider)dataProvider;
- (NSString)uniqueKey;
- (_TtC10StocksCore15StubAssetHandle)init;
@end

@implementation StubAssetHandle

- (FCAssetDataProvider)dataProvider
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10StocksCore15StubAssetHandle_identifier);
  uint64_t v2 = *(uint64_t *)((char *)&self->super._dataProvider + OBJC_IVAR____TtC10StocksCore15StubAssetHandle_identifier);
  type metadata accessor for StubAssetHandle.StubAssetDataProvider();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AFFD3850;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  *(unsigned char *)(v4 + 48) = 1;
  sub_1AFFC8E38();

  return (FCAssetDataProvider *)(id)v4;
}

- (NSString)uniqueKey
{
  sub_1AFFC8E38();
  uint64_t v2 = (void *)sub_1AFFCAE68();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC10StocksCore15StubAssetHandle)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_1AFFC9938();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10StocksCore15StubAssetHandle_identifier);
  v9 = self;
  sub_1AFFC8978();
  uint64_t v10 = sub_1AFFC9918();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t *v8 = v10;
  v8[1] = v12;

  v14.receiver = v9;
  v14.super_class = ObjectType;
  return [(StubAssetHandle *)&v14 init];
}

- (void).cxx_destruct
{
}

@end