@interface SettingsService
- (_TtP8Settings27SettingsHostServiceProvider_)serviceHost;
- (void)filterSearchAnchorsForSidebarItem:(id)a3 suggestedAnchors:(id)a4 reply:(id)a5;
- (void)getSidebarItems:(id)a3;
- (void)getSidebarSections:(id)a3;
- (void)isAvailable:(id)a3;
- (void)openURL:(id)a3;
- (void)setServiceHost:(id)a3;
@end

@implementation SettingsService

- (_TtP8Settings27SettingsHostServiceProvider_)serviceHost
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP8Settings27SettingsHostServiceProvider_ *)v2;
}

- (void)setServiceHost:(id)a3
{
  *(void *)self->serviceHost = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)getSidebarItems:(id)a3
{
}

- (void)isAvailable:(id)a3
{
}

- (void)filterSearchAnchorsForSidebarItem:(id)a3 suggestedAnchors:(id)a4 reply:(id)a5
{
  v5 = _Block_copy(a5);
  uint64_t v6 = sub_1E4DBDF38();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1E4DBDFE8();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v5;
  swift_retain();
  sub_1E4D75E34(v6, v8, v9, (void (*)())sub_1E4D76F80, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)getSidebarSections:(id)a3
{
}

- (void)openURL:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1E4D764D4((uint64_t)v3);

  swift_release();
}

@end