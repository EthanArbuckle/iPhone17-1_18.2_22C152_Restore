@interface MTSeasonFeedRequest
- (MTSeasonFeedRequest)initWithStoreID:(int64_t)a3;
- (MTSeasonFeedRequest)initWithStoreID:(int64_t)a3 seasons:(id)a4;
- (NSArray)seasons;
- (void)setSeasons:(id)a3;
@end

@implementation MTSeasonFeedRequest

- (NSArray)seasons
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76558();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSeasons:(id)a3
{
  uint64_t v4 = sub_1ACE76578();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MTSeasonFeedRequest_seasons);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MTSeasonFeedRequest)initWithStoreID:(int64_t)a3 seasons:(id)a4
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTSeasonFeedRequest_seasons) = (Class)sub_1ACE76578();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_limit) = (Class)25;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_sections) = (Class)MEMORY[0x1E4FBC860];
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_showMetadata) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_storeID) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BaseFeedRequest();
  return [(MTBaseFeedRequest *)&v7 init];
}

- (MTSeasonFeedRequest)initWithStoreID:(int64_t)a3
{
  result = (MTSeasonFeedRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end