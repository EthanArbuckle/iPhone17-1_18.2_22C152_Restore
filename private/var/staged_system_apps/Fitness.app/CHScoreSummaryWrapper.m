@interface CHScoreSummaryWrapper
- (CHScoreSummaryWrapper)init;
- (CHScoreSummaryWrapper)initWithElapsedSeconds:(int64_t)a3 personalScore:(float)a4 communityLowerScore:(float)a5 communityLowerMiddleScore:(float)a6 communityUpperMiddleScore:(float)a7 communityUpperScore:(float)a8;
- (NSString)description;
@end

@implementation CHScoreSummaryWrapper

- (CHScoreSummaryWrapper)initWithElapsedSeconds:(int64_t)a3 personalScore:(float)a4 communityLowerScore:(float)a5 communityLowerMiddleScore:(float)a6 communityUpperMiddleScore:(float)a7 communityUpperScore:(float)a8
{
  uint64_t v9 = type metadata accessor for ScoreSummary();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = self;
  ScoreSummary.init(elapsedSeconds:personalScore:communityLowerScore:communityLowerMiddleScore:communityUpperMiddleScore:communityUpperScore:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))((uint64_t)v13 + OBJC_IVAR___CHScoreSummaryWrapper_scoreSummary, v12, v9);

  v14 = (objc_class *)type metadata accessor for ScoreSummaryWrapper();
  v16.receiver = v13;
  v16.super_class = v14;
  return [(CHScoreSummaryWrapper *)&v16 init];
}

- (NSString)description
{
  v2 = self;
  ScoreSummary.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CHScoreSummaryWrapper)init
{
  result = (CHScoreSummaryWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___CHScoreSummaryWrapper_scoreSummary;
  uint64_t v3 = type metadata accessor for ScoreSummary();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end