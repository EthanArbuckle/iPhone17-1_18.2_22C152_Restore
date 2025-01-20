@interface PasscodeSettingsStatus
+ (id)supportedStatusKeys;
- (_TtC26PasscodeSettingsSubscriber22PasscodeSettingsStatus)init;
- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5;
@end

@implementation PasscodeSettingsStatus

+ (id)supportedStatusKeys
{
  sub_10000C370();
  v2.super.isa = sub_10000D1B8().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100003184(&qword_100014C98);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_10000D1A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100014F78;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100014CB0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10000AB8C((uint64_t)v11, (uint64_t)&unk_100014CB8, (uint64_t)v16);
  swift_release();
}

- (_TtC26PasscodeSettingsSubscriber22PasscodeSettingsStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PasscodeSettingsStatus();
  return [(PasscodeSettingsStatus *)&v3 init];
}

@end