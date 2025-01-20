@interface MTPartialFeedRequest
- (BOOL)showTypeIsSerial;
- (MTPartialFeedRequest)initWithStoreID:(int64_t)a3;
- (NSArray)sections;
- (int64_t)limit;
- (void)setLimit:(int64_t)a3;
- (void)setSections:(id)a3;
- (void)setShowTypeIsSerial:(BOOL)a3;
@end

@implementation MTPartialFeedRequest

- (int64_t)limit
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MTPartialFeedRequest_limit);
  swift_beginAccess();
  return *v2;
}

- (void)setLimit:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MTPartialFeedRequest_limit);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSArray)sections
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76558();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSections:(id)a3
{
  uint64_t v4 = sub_1ACE76578();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MTPartialFeedRequest_sections);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)showTypeIsSerial
{
  v2 = (BOOL *)self + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial;
  swift_beginAccess();
  return *v2;
}

- (void)setShowTypeIsSerial:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (MTPartialFeedRequest)initWithStoreID:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_limit) = (Class)25;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_sections) = (Class)MEMORY[0x1E4FBC860];
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___MTPartialFeedRequest_showTypeIsSerial) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_showMetadata) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_storeID) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BaseFeedRequest();
  return [(MTBaseFeedRequest *)&v4 init];
}

- (void).cxx_destruct
{
}

@end