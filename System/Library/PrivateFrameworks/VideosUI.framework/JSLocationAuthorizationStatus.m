@interface JSLocationAuthorizationStatus
- (_TtC8VideosUI29JSLocationAuthorizationStatus)init;
- (_TtC8VideosUI29JSLocationAuthorizationStatus)initWithAppContext:(id)a3;
- (id)getLocationAuthorizationStatus;
@end

@implementation JSLocationAuthorizationStatus

- (_TtC8VideosUI29JSLocationAuthorizationStatus)initWithAppContext:(id)a3
{
  id v4 = a3;
  return (_TtC8VideosUI29JSLocationAuthorizationStatus *)sub_1E2CB63E4(a3);
}

- (id)getLocationAuthorizationStatus
{
  v2 = self;
  sub_1E2CEB928();

  v3 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC8VideosUI29JSLocationAuthorizationStatus)init
{
  return (_TtC8VideosUI29JSLocationAuthorizationStatus *)sub_1E305F08C();
}

@end