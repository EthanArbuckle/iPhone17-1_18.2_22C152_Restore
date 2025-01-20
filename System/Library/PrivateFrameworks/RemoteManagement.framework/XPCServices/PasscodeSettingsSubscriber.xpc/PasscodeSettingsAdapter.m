@interface PasscodeSettingsAdapter
- (_TtC26PasscodeSettingsSubscriber23PasscodeSettingsAdapter)init;
- (id)allDeclarationKeysForScope:(int64_t)a3 error:(id *)a4;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation PasscodeSettingsAdapter

- (id)configurationClasses
{
  sub_100003184(&qword_100014BD0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10000DA00;
  *(void *)(v2 + 32) = sub_1000082FC(0, &qword_100014BD8);
  sub_100003184(&qword_100014BB8);
  v3.super.isa = sub_10000D158().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)declarationKeyForConfiguration:(id)a3
{
  v5 = self;
  uint64_t v6 = qword_100014BA8;
  id v7 = a3;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  NSString v9 = sub_10000D0D8();
  id v10 = [v5 newDeclarationKeyWithSubscriberIdentifier:v9 reference:v7];

  return v10;
}

- (id)allDeclarationKeysForScope:(int64_t)a3 error:(id *)a4
{
  sub_100006348();
  sub_1000082FC(0, &qword_100014D08);
  sub_100008338();
  v4.super.isa = sub_10000D1B8().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  sub_100003184(&qword_100014C98);
  __chkstk_darwin();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = sub_10000D1A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100014CE8;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100014CF0;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_10000AB8C((uint64_t)v12, (uint64_t)&unk_100014CF8, (uint64_t)v17);
  swift_release();
}

- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  sub_100003184(&qword_100014C98);
  __chkstk_darwin();
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_10000D1A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100014CC8;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100014CD0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_10000AB8C((uint64_t)v10, (uint64_t)&unk_100014CD8, (uint64_t)v15);
  swift_release();
}

- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100003184(&qword_100014C98);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_10000D1A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100014CA8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100014CB0;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = self;
  sub_10000AB8C((uint64_t)v11, (uint64_t)&unk_100014CB8, (uint64_t)v16);
  swift_release();
}

- (_TtC26PasscodeSettingsSubscriber23PasscodeSettingsAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PasscodeSettingsAdapter();
  return [(PasscodeSettingsAdapter *)&v3 init];
}

@end