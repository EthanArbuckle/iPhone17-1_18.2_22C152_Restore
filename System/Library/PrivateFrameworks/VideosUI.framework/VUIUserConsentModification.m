@interface VUIUserConsentModification
- (_TtC8VideosUI26VUIUserConsentModification)init;
- (_TtC8VideosUI26VUIUserConsentModification)initWithStatus:(int64_t)a3;
- (int64_t)status;
@end

@implementation VUIUserConsentModification

- (int64_t)status
{
  return VUIUserConsentModification.status.getter();
}

- (_TtC8VideosUI26VUIUserConsentModification)initWithStatus:(int64_t)a3
{
  return (_TtC8VideosUI26VUIUserConsentModification *)VUIUserConsentModification.init(status:)(a3);
}

- (_TtC8VideosUI26VUIUserConsentModification)init
{
}

@end