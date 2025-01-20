@interface BKWidgetService
+ (BOOL)hasWidgetConfigurations;
- (BKWidgetService)init;
@end

@implementation BKWidgetService

+ (BOOL)hasWidgetConfigurations
{
  if (qword_100B22AB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = qword_100B33A30;
  uint64_t v3 = *(void *)algn_100B33A38;
  char v4 = byte_100B33A40;
  v5 = (void *)qword_100B33A48;
  swift_bridgeObjectRetain();
  id v6 = v5;
  LOBYTE(v2) = sub_100062638(v2, v3, v4, v6);

  swift_bridgeObjectRelease();
  return v2 & 1;
}

- (BKWidgetService)init
{
  result = (BKWidgetService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKWidgetService_onWidgetConfigurationChangeCallback);

  sub_10003E138(v3);
}

@end