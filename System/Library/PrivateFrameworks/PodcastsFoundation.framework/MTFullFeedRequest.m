@interface MTFullFeedRequest
- (MTFullFeedRequest)initWithStoreID:(int64_t)a3;
- (MTFullFeedRequest)initWithStoreID:(int64_t)a3 isSerial:(BOOL)a4 hasSeasons:(BOOL)a5;
@end

@implementation MTFullFeedRequest

- (MTFullFeedRequest)initWithStoreID:(int64_t)a3 isSerial:(BOOL)a4 hasSeasons:(BOOL)a5
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___MTFullFeedRequest_isSerial) = a4;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___MTFullFeedRequest_hasSeasons) = a5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_showMetadata) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MTBaseFeedRequest_storeID) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BaseFeedRequest();
  return [(MTBaseFeedRequest *)&v6 init];
}

- (MTFullFeedRequest)initWithStoreID:(int64_t)a3
{
  result = (MTFullFeedRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end