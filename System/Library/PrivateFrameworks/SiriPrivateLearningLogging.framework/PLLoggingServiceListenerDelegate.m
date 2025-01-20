@interface PLLoggingServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate)init;
@end

@implementation PLLoggingServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_21C982E3C(v7);

  return v9 & 1;
}

- (_TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate)init
{
  result = (_TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue));
  swift_bridgeObjectRelease();
}

@end