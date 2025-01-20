@interface SettingsServiceScene.SettingsServiceProtocolDispatch
- (_TtP8Settings27SettingsHostServiceProvider_)serviceHost;
- (void)filterSearchAnchorsForSidebarItem:(id)a3 suggestedAnchors:(id)a4 reply:(id)a5;
- (void)getSidebarItems:(id)a3;
- (void)getSidebarSections:(id)a3;
- (void)isAvailable:(id)a3;
- (void)openURL:(id)a3;
- (void)setServiceHost:(id)a3;
@end

@implementation SettingsServiceScene.SettingsServiceProtocolDispatch

- (_TtP8Settings27SettingsHostServiceProvider_)serviceHost
{
  id v2 = objc_msgSend(*(id *)self->target, sel_serviceHost);
  return (_TtP8Settings27SettingsHostServiceProvider_ *)v2;
}

- (void)setServiceHost:(id)a3
{
}

- (void)openURL:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1E4D7719C(v3);

  swift_release();
}

- (void)getSidebarItems:(id)a3
{
}

- (void)getSidebarSections:(id)a3
{
}

- (void)isAvailable:(id)a3
{
}

- (void)filterSearchAnchorsForSidebarItem:(id)a3 suggestedAnchors:(id)a4 reply:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1E4DBDF38();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1E4DBDFE8();
  _Block_copy(v6);
  swift_retain();
  sub_1E4D78810(v7, v9, v10, (uint64_t)self, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end