@interface GamePolicyPrivilegedToolProxy
- (void)ping;
- (void)requestCCUIGameModeStatusBundle:(id)a3 withReply:(id)a4;
- (void)requestCCUIGameModeStatusBundleInfo:(id)a3 withReply:(id)a4;
- (void)requestCCUIGameModeStatusInfoWithReply:(id)a3;
- (void)requestCCUIGameModeStatusWithReply:(id)a3;
- (void)requestCCUISetGameModeInfoWithState:(int64_t)a3 bundleIdentifier:(id)a4 withReply:(id)a5;
- (void)requestCCUISetGameModeWithState:(int64_t)a3 bundleIdentifier:(id)a4 withReply:(id)a5;
- (void)requestDynamicSplitterStatusWithReply:(id)a3;
- (void)requestGameModeStatusWithReply:(id)a3;
- (void)requestGameModeWithCompletionHandler:(id)a3;
- (void)requestGetIgnoreDeviceRestrictionsWithReply:(id)a3;
- (void)requestModelManagerGameAssertionStatusWithReply:(id)a3;
- (void)requestSEMAddBundleID:(id)a3 withReply:(id)a4;
- (void)requestSEMAllowlistWithReply:(id)a3;
- (void)requestSEMClearAllowlistWithReply:(id)a3;
- (void)requestSEMRemoveBundleID:(id)a3 withReply:(id)a4;
- (void)requestSEMStatusWithReply:(id)a3;
- (void)requestSetDynamicSplitterEnablementStrategy:(int64_t)a3 withReply:(id)a4;
- (void)requestSetGameModeEnablementStrategy:(int64_t)a3 withReply:(id)a4;
- (void)requestSetGameModeWithGameModeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)requestSetIgnoreDeviceRestrictions:(BOOL)a3 withReply:(id)a4;
- (void)requestSetModelManagerGameAssertionPolicyStrategy:(int64_t)a3 withReply:(id)a4;
- (void)requestSetSEMEnablementStrategy:(int64_t)a3 withReply:(id)a4;
@end

@implementation GamePolicyPrivilegedToolProxy

- (void)ping
{
  swift_retain();
  sub_100018E34();

  swift_release();
}

- (void)requestSetIgnoreDeviceRestrictions:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  v5 = (void (**)(void *, uint64_t))_Block_copy(a4);
  uint64_t v6 = qword_10003F328;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  v7 = (void *)*((void *)off_10003F5F8 + 2);
  swift_retain();
  NSString v8 = String._bridgeToObjectiveC()();
  [v7 setBool:v4 forKey:v8];
  swift_release();

  v5[2](v5, 1);
  _Block_release(v5);

  swift_release();
}

- (void)requestGetIgnoreDeviceRestrictionsWithReply:(id)a3
{
  v3 = (void (**)(void *, void))_Block_copy(a3);
  uint64_t v4 = qword_10003F328;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  swift_retain();
  unsigned __int8 v5 = GlobalPreferences.ignoreDeviceRestrictions.getter();
  swift_release();
  v3[2](v3, v5 & 1);
  _Block_release(v3);

  swift_release();
}

- (void)requestGameModeStatusWithReply:(id)a3
{
}

- (void)requestSetGameModeEnablementStrategy:(int64_t)a3 withReply:(id)a4
{
}

- (void)requestDynamicSplitterStatusWithReply:(id)a3
{
}

- (void)requestSetDynamicSplitterEnablementStrategy:(int64_t)a3 withReply:(id)a4
{
}

- (void)requestSEMStatusWithReply:(id)a3
{
}

- (void)requestSetSEMEnablementStrategy:(int64_t)a3 withReply:(id)a4
{
}

- (void)requestSEMAllowlistWithReply:(id)a3
{
  v3 = (void (**)(void *, Class))_Block_copy(a3);
  uint64_t v4 = qword_10003F328;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  swift_retain();
  GlobalPreferences.semAllowList.getter();
  swift_release();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v3[2](v3, isa);
  swift_bridgeObjectRelease();

  _Block_release(v3);

  swift_release();
}

- (void)requestSEMAddBundleID:(id)a3 withReply:(id)a4
{
}

- (void)requestSEMRemoveBundleID:(id)a3 withReply:(id)a4
{
}

- (void)requestSEMClearAllowlistWithReply:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  swift_retain();
  sub_10001BD90((uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);

  swift_release();
}

- (void)requestCCUIGameModeStatusInfoWithReply:(id)a3
{
  v3 = (void (**)(void *, void *))_Block_copy(a3);
  swift_retain();
  uint64_t v4 = (void *)sub_1000195CC(0, 1);
  v3[2](v3, v4);

  _Block_release(v3);

  swift_release();
}

- (void)requestCCUIGameModeStatusBundleInfo:(id)a3 withReply:(id)a4
{
  uint64_t v4 = (void (**)(void *, void *))_Block_copy(a4);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  sub_100005690(&qword_100040718);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002EFD0;
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v7;
  swift_retain();
  swift_bridgeObjectRetain();
  v9 = (void *)sub_1000195CC((void *)inited, 0);
  swift_setDeallocating();
  uint64_t v10 = swift_arrayDestroy();
  unint64_t v11 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v9) + 0x60))(v10);

  swift_bridgeObjectRetain();
  v12 = sub_10001C71C(v11, v5, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4[2](v4, v12);

  _Block_release(v4);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)requestCCUISetGameModeInfoWithState:(int64_t)a3 bundleIdentifier:(id)a4 withReply:(id)a5
{
}

- (void)requestCCUIGameModeStatusWithReply:(id)a3
{
  v3 = (void (**)(void *, void *))_Block_copy(a3);
  swift_retain();
  uint64_t v4 = (void *)sub_1000195CC(0, 1);
  uint64_t v5 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v4) + 0x80))();

  v3[2](v3, v5);
  _Block_release(v3);

  swift_release();
}

- (void)requestCCUIGameModeStatusBundle:(id)a3 withReply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  swift_retain();
  sub_10001CAE0(v6, v8, (uint64_t)self, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)requestCCUISetGameModeWithState:(int64_t)a3 bundleIdentifier:(id)a4 withReply:(id)a5
{
}

- (void)requestGameModeWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100005690(&qword_100040168);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  unint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000406F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100040700;
  v12[5] = v11;
  swift_retain();
  sub_10001A928((uint64_t)v7, (uint64_t)&unk_100040708, (uint64_t)v12);
  swift_release();
}

- (void)requestSetGameModeWithGameModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100005690(&qword_100040168);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000406B0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000406C0;
  v14[5] = v13;
  swift_retain();
  sub_10001A928((uint64_t)v9, (uint64_t)&unk_1000406D0, (uint64_t)v14);
  swift_release();
}

- (void)requestModelManagerGameAssertionStatusWithReply:(id)a3
{
}

- (void)requestSetModelManagerGameAssertionPolicyStrategy:(int64_t)a3 withReply:(id)a4
{
}

@end