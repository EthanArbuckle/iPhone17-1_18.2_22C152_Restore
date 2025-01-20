@interface LocationAuthorizationMonitor
- (_TtC17GeneralMapsWidget28LocationAuthorizationMonitor)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationAuthorizationMonitor

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100047C08(v4);
}

- (_TtC17GeneralMapsWidget28LocationAuthorizationMonitor)init
{
  return (_TtC17GeneralMapsWidget28LocationAuthorizationMonitor *)sub_100047F68();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget28LocationAuthorizationMonitor_locationManager));
  v3 = (char *)self + OBJC_IVAR____TtC17GeneralMapsWidget28LocationAuthorizationMonitor__accuracyAuthorization;
  uint64_t v4 = sub_100002874(&qword_1000A95F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end