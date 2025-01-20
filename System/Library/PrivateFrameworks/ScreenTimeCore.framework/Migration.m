@interface Migration
+ (BOOL)isReady;
+ (void)preflight;
+ (void)setIsReady:(BOOL)a3;
- (_TtC15ScreenTimeAgent9Migration)init;
@end

@implementation Migration

+ (BOOL)isReady
{
  return byte_10034B308;
}

+ (void)setIsReady:(BOOL)a3
{
  byte_10034B308 = a3;
}

+ (void)preflight
{
  if (qword_100340D70 != -1) {
    swift_once();
  }
}

- (_TtC15ScreenTimeAgent9Migration)init
{
  Logger.init(subsystem:category:)();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Migration(0);
  return [(Migration *)&v4 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC15ScreenTimeAgent9Migration_logger;
  uint64_t v3 = type metadata accessor for Logger();
  objc_super v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end