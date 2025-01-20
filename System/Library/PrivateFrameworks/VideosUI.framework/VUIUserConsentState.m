@interface VUIUserConsentState
- (NSDate)lastModifiedDate;
- (_TtC8VideosUI19VUIUserConsentState)init;
- (int64_t)status;
@end

@implementation VUIUserConsentState

- (int64_t)status
{
  return VUIUserConsentState.status.getter();
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)sub_1E32E9FAC((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIUserConsentState.lastModifiedDate.getter);
}

- (_TtC8VideosUI19VUIUserConsentState)init
{
}

- (void).cxx_destruct
{
}

@end