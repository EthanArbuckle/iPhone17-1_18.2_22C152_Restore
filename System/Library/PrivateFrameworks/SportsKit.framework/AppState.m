@interface AppState
- (_TtC9SportsKit8AppState)init;
- (void)applicationDidEnterBackgroundNotification;
- (void)applicationWillEnterForegroundNotification;
- (void)applicationWillTerminate;
- (void)dealloc;
@end

@implementation AppState

- (_TtC9SportsKit8AppState)init
{
  return (_TtC9SportsKit8AppState *)sub_23F9520A4();
}

- (void)dealloc
{
  v2 = self;
  sub_23F9522B0();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9SportsKit8AppState__state;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AEB0510);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (void)applicationWillTerminate
{
  v2 = self;
  sub_23F9524CC("AppState - applicationWillTerminate");
}

- (void)applicationDidEnterBackgroundNotification
{
  v2 = self;
  sub_23F9524CC("AppState - applicationDidEnterBackgroundNotification");
}

- (void)applicationWillEnterForegroundNotification
{
  v2 = self;
  sub_23F9524CC("AppState - applicationWillEnterForegroundNotification");
}

@end