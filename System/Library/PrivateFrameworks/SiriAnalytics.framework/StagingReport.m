@interface StagingReport
+ (BOOL)supportsSecureCoding;
+ (id)failed;
+ (id)terminated;
+ (id)timedOut;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC13SiriAnalytics13StagingReport)init;
- (_TtC13SiriAnalytics13StagingReport)initWithCoder:(id)a3;
- (_TtC13SiriAnalytics13StagingReport)initWithResult:(int)a3;
- (int)addedCount;
- (int)missingTimestampCount;
- (int)result;
- (void)added;
- (void)encodeWithCoder:(id)a3;
- (void)missingTimestamp;
- (void)setAddedCount:(int)a3;
- (void)setMissingTimestampCount:(int)a3;
- (void)setResult:(int)a3;
@end

@implementation StagingReport

- (int)addedCount
{
  return StagingReport.addedCount.getter();
}

- (void)setAddedCount:(int)a3
{
}

- (int)missingTimestampCount
{
  return StagingReport.missingTimestampCount.getter();
}

- (void)setMissingTimestampCount:(int)a3
{
}

- (int)result
{
  return StagingReport.result.getter();
}

- (void)setResult:(int)a3
{
}

- (_TtC13SiriAnalytics13StagingReport)initWithResult:(int)a3
{
  return (_TtC13SiriAnalytics13StagingReport *)sub_1A2B58C94(a3);
}

+ (id)failed
{
  swift_getObjCClassMetadata();
  id v2 = sub_1A2B58D24();
  return v2;
}

+ (id)timedOut
{
  swift_getObjCClassMetadata();
  id v2 = sub_1A2B58D8C();
  return v2;
}

+ (id)terminated
{
  swift_getObjCClassMetadata();
  id v2 = sub_1A2B58DF4();
  return v2;
}

- (void)added
{
}

- (void)missingTimestamp
{
}

+ (BOOL)supportsSecureCoding
{
  return static StagingReport.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  StagingReport.encode(with:)((NSCoder)v4);
}

- (_TtC13SiriAnalytics13StagingReport)initWithCoder:(id)a3
{
  return (_TtC13SiriAnalytics13StagingReport *)StagingReport.init(coder:)(a3);
}

- (_TtC13SiriAnalytics13StagingReport)init
{
}

@end