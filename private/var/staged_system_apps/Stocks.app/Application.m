@interface Application
- (BOOL)shouldChangeWindowFrameSize;
- (BOOL)shouldRecordExtendedLaunchTime;
- (_TtC9StocksApp11Application)init;
- (id)_extendLaunchTest;
- (void)sendEvent:(id)a3;
- (void)setShouldChangeWindowFrameSize:(BOOL)a3;
@end

@implementation Application

- (_TtC9StocksApp11Application)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9StocksApp11Application_shouldChangeWindowFrameSize) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(Application *)&v6 init];
}

- (id)_extendLaunchTest
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (BOOL)shouldChangeWindowFrameSize
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9StocksApp11Application_shouldChangeWindowFrameSize);
}

- (void)setShouldChangeWindowFrameSize:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9StocksApp11Application_shouldChangeWindowFrameSize) = a3;
}

- (void)sendEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v8.receiver;
  [(Application *)&v8 sendEvent:v4];
  uint64_t v6 = (uint64_t)v5 + OBJC_IVAR____TtC9StocksApp11Application_keyboardInputMonitor;
  swift_beginAccess();
  if (*(void *)(v6 + 24))
  {
    sub_100016F78(v6, (uint64_t)v7);
    sub_1000136F8(v7, v7[3]);
    dispatch thunk of KeyboardInputMonitorType.handle(_:)();
    sub_10001373C((uint64_t)v7);
  }
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (void).cxx_destruct
{
}

@end