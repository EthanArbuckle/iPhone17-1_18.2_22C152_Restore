@interface MediaRequestController
- (_TtC18PodcastsFoundation22MediaRequestController)init;
- (_TtC18PodcastsFoundation22MediaRequestController)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4;
@end

@implementation MediaRequestController

- (_TtC18PodcastsFoundation22MediaRequestController)init
{
  uint64_t v3 = OBJC_IVAR____TtC18PodcastsFoundation22MediaRequestController_responseQueue;
  sub_1ACA50D4C(0, (unint64_t *)&qword_1EB7734B0);
  v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1ACE76CF8();
  *(Class *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation22MediaRequestController_cachePolicy) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for MediaRequestController();
  return [(IMBaseStoreService *)&v6 initWithConcurrentOperationCount:1 requestEncodingType:1];
}

- (_TtC18PodcastsFoundation22MediaRequestController)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4
{
  result = (_TtC18PodcastsFoundation22MediaRequestController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation22MediaRequestController_responseQueue));
}

@end