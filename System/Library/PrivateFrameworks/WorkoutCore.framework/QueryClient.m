@interface QueryClient
- (_TtC11WorkoutCore11QueryClient)init;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInvalidated;
@end

@implementation QueryClient

- (_TtC11WorkoutCore11QueryClient)init
{
  result = (_TtC11WorkoutCore11QueryClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11WorkoutCore11QueryClient_pluginProxyProvider);
}

- (id)exportedInterface
{
  return 0;
}

- (id)remoteInterface
{
  id v2 = (id)WOWorkoutServerInterface();

  return v2;
}

- (void)connectionInvalidated
{
  uint64_t v2 = qword_26AF2E5B0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_236C74B98();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AF2E598);
  oslog = sub_236C74B78();
  os_log_type_t v5 = sub_236C752D8();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_236A4F000, oslog, v5, "healthd connection invalidated", v6, 2u);
    MEMORY[0x237E0C720](v6, -1, -1);
  }
}

@end