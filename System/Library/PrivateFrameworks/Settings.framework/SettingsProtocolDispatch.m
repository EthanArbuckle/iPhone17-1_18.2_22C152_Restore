@interface SettingsProtocolDispatch
- (_TtP8Settings20SettingsHostProtocol_)settingsHost;
- (void)didUnselect;
- (void)handshakeWithEndPoint:(id)a3;
- (void)isCloudSyncEnabled:(id)a3;
- (void)popNavigationStack;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setSettingsHost:(id)a3;
- (void)willSelect;
- (void)willSelectWithNavigationPath:(id)a3;
- (void)willSelectWithRevealElementKey:(id)a3;
@end

@implementation SettingsProtocolDispatch

- (_TtP8Settings20SettingsHostProtocol_)settingsHost
{
  id v2 = objc_msgSend(*(id *)self->target, sel_settingsHost);
  return (_TtP8Settings20SettingsHostProtocol_ *)v2;
}

- (void)setSettingsHost:(id)a3
{
}

- (void)willSelect
{
}

- (void)willSelectWithRevealElementKey:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1E4DBDF38();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_retain();
  sub_1E4D7DC2C(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)willSelectWithNavigationPath:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1E4D7E050(v3);

  swift_release();
}

- (void)handshakeWithEndPoint:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1E4D81BEC(v3);

  swift_release();
}

- (void)didUnselect
{
}

- (void)isCloudSyncEnabled:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_1E4D8218C(v4, (void (**)(void, void, void))v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  swift_retain();
  sub_1E4D7EE78(a3);
  swift_release();
}

- (void)popNavigationStack
{
  if (qword_1EAE92F60 != -1) {
    swift_once();
  }
  if (qword_1EAE92F68 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4DBD468();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE94220);
  oslog = sub_1E4DBD448();
  os_log_type_t v1 = sub_1E4DBE1B8();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v9 = v3;
    *(_DWORD *)uint64_t v2 = 136446978;
    uint64_t v4 = sub_1E4DBE428();
    sub_1E4D46BE8(v4, v5, &v9);
    sub_1E4DBE318();
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 12) = 2048;
    sub_1E4DBE318();
    *(_WORD *)(v2 + 22) = 2082;
    uint64_t v6 = sub_1E4DBE428();
    sub_1E4D46BE8(v6, v7, &v9);
    sub_1E4DBE318();
    swift_bridgeObjectRelease();
    *(_WORD *)(v2 + 32) = 2082;
    sub_1E4D46BE8(0, 0xE000000000000000, &v9);
    sub_1E4DBE318();
    _os_log_impl(&dword_1E4D3B000, oslog, v1, "%{public}s:%ld %{public}s %{public}s", (uint8_t *)v2, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x1E4E8E090](v3, -1, -1);
    MEMORY[0x1E4E8E090](v2, -1, -1);
  }
  else
  {
  }
}

@end