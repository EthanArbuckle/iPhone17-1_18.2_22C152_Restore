@interface APSigningObservabilityDiary
- (_TtC7Metrics27APSigningObservabilityDiary)init;
- (void)recordFailure;
- (void)recordSuccess;
@end

@implementation APSigningObservabilityDiary

- (void)recordFailure
{
  v2 = self;
  sub_10015A154();
}

- (void)recordSuccess
{
  v2 = self;
  sub_10015AA74();
}

- (_TtC7Metrics27APSigningObservabilityDiary)init
{
  return (_TtC7Metrics27APSigningObservabilityDiary *)sub_10015AC48();
}

- (void).cxx_destruct
{
}

@end