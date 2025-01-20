@interface CRLURLMetadataProviderBase
- (_TtC8Freeform26CRLURLMetadataProviderBase)init;
@end

@implementation CRLURLMetadataProviderBase

- (_TtC8Freeform26CRLURLMetadataProviderBase)init
{
  result = (_TtC8Freeform26CRLURLMetadataProviderBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase_url;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase__linkPresentationMetadata));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase____lazy_storage___linkPresentationMetadataProvider));
  swift_bridgeObjectRelease();
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform26CRLURLMetadataProviderBase__icon);
}

@end