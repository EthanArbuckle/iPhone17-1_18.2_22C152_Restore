@interface PMExtensionCoordinator
- (_TtP8Settings20SettingsHostProtocol_)settingsHost;
- (void)setSettingsHost:(id)a3;
- (void)willSelect:(id)a3;
@end

@implementation PMExtensionCoordinator

- (_TtP8Settings20SettingsHostProtocol_)settingsHost
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP8Settings20SettingsHostProtocol_ *)v2;
}

- (void)setSettingsHost:(id)a3
{
  *(void *)self->settingsHost = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)willSelect:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = (void (*)(void *))v3[2];
  swift_retain();
  v4(v3);
  _Block_release(v3);

  swift_release();
}

@end