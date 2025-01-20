@interface NoopUserEventHistoryStorage
- (FCUserEventHistoryMetadata)metadata;
- (NSArray)prunedSessionIDs;
- (NSArray)sessionIDs;
- (NSArray)sessions;
- (NSDate)earliestSessionDate;
- (NSURL)baseDirectoryURL;
- (_TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage)init;
- (unint64_t)prunedSessionSize;
- (unint64_t)size;
- (void)setMetadata:(id)a3;
- (void)storeSessionID:(id)a3 sessionData:(id)a4;
- (void)writeJSON:(id)a3;
@end

@implementation NoopUserEventHistoryStorage

- (NSArray)sessionIDs
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_sessionIDs))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = sub_10000C200().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  return (NSArray *)v2.super.isa;
}

- (NSArray)sessions
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_sessions))
  {
    sub_1000084D8(0, &qword_100016D00);
    swift_bridgeObjectRetain();
    v2.super.isa = sub_10000C200().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  return (NSArray *)v2.super.isa;
}

- (NSDate)earliestSessionDate
{
  sub_10000A678(0, &qword_100016C50, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - v4;
  sub_10000AA5C((uint64_t)self+ OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_earliestSessionDate, (uint64_t)&v10 - v4);
  uint64_t v6 = sub_10000BE80();
  uint64_t v7 = *(void *)(v6 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    Class isa = sub_10000BE70().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSDate *)isa;
}

- (unint64_t)size
{
  return 0;
}

- (NSArray)prunedSessionIDs
{
  swift_bridgeObjectRetain();
  v2.super.Class isa = sub_10000C200().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (unint64_t)prunedSessionSize
{
  return 0;
}

- (NSURL)baseDirectoryURL
{
  sub_10000BE00((NSURL *)OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_baseDirectoryURL);
  return (NSURL *)v2;
}

- (FCUserEventHistoryMetadata)metadata
{
  return (FCUserEventHistoryMetadata *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_metadata));
}

- (void)setMetadata:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_metadata);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_metadata) = (Class)a3;
  id v3 = a3;
}

- (void)storeSessionID:(id)a3 sessionData:(id)a4
{
  id v5 = a4;
  v9 = self;
  uint64_t v6 = sub_10000BE60();
  unint64_t v8 = v7;

  sub_10000AA04(v6, v8);
}

- (void)writeJSON:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (_TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage)init
{
  result = (_TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000AAF0((uint64_t)self+ OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_earliestSessionDate);
  swift_bridgeObjectRelease();
  id v3 = (char *)self
     + OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_baseDirectoryURL;
  uint64_t v4 = sub_10000BE50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18NewsScoringServiceP33_C5702952914E111DC8B8265D9BB1866627NoopUserEventHistoryStorage_metadata);
}

@end