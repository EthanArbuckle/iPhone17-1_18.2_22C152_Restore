@interface MTBaseFeedRequest
- (MTBaseFeedRequest)init;
- (MTBaseFeedRequest)initWithStoreID:(int64_t)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MTBaseFeedRequest

- (MTBaseFeedRequest)initWithStoreID:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MTBaseFeedRequest_showMetadata) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MTBaseFeedRequest_storeID) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BaseFeedRequest();
  return [(MTBaseMAPIRequest *)&v4 init];
}

- (void)performWithCompletion:(id)a3
{
  objc_super v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1ACCF7C94((uint64_t)sub_1ACA50AB0, v5);

  swift_release();
}

- (MTBaseFeedRequest)init
{
  result = (MTBaseFeedRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end