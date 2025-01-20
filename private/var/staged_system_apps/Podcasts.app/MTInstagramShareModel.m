@interface MTInstagramShareModel
- (MTInstagramShareModel)init;
- (MTInstagramShareModel)initWithShowName:(id)a3 episodeName:(id)a4 creatorName:(id)a5 publishDate:(id)a6 artwork:(id)a7;
@end

@implementation MTInstagramShareModel

- (MTInstagramShareModel)initWithShowName:(id)a3 episodeName:(id)a4 creatorName:(id)a5 publishDate:(id)a6 artwork:(id)a7
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___MTInstagramShareModel_showName);
  uint64_t *v18 = v12;
  v18[1] = v14;
  v19 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTInstagramShareModel_episodeName);
  id *v19 = a4;
  v19[1] = v16;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___MTInstagramShareModel_creatorName);
  uint64_t *v20 = v17;
  v20[1] = v21;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTInstagramShareModel_publishDate) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTInstagramShareModel_artwork) = (Class)a7;
  v25.receiver = self;
  v25.super_class = ObjectType;
  id v22 = a6;
  id v23 = a7;
  return [(MTInstagramShareModel *)&v25 init];
}

- (MTInstagramShareModel)init
{
  result = (MTInstagramShareModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTInstagramShareModel_artwork);
}

@end