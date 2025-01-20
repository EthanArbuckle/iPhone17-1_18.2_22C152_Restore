@interface LegacyProfilesAdapter
- (_TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter)init;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation LegacyProfilesAdapter

- (_TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter)init
{
  return (_TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter *)LegacyProfilesAdapter.init()();
}

- (id)configurationClasses
{
  sub_100001D08(&qword_1000109C0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100009D70;
  *(void *)(v2 + 32) = sub_100008814(0, &qword_1000109C8);
  sub_100001D08(&qword_100010B80);
  v3.super.isa = sub_1000095D0().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4
{
  sub_100001D08(&qword_100010AA0);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100009600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100010B68;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100010B70;
  v13[5] = v12;
  v14 = self;
  sub_100004438((uint64_t)v8, (uint64_t)&unk_100010B78, (uint64_t)v13);
  swift_release();
}

- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  sub_100001D08(&qword_100010AA0);
  __chkstk_darwin();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = sub_100009600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100010B48;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100010B50;
  v15[5] = v14;
  v16 = self;
  sub_100004438((uint64_t)v10, (uint64_t)&unk_100010B58, (uint64_t)v15);
  swift_release();
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  sub_100001D08(&qword_100010AA0);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100009600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100010B18;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100010B20;
  v13[5] = v12;
  v14 = self;
  sub_100004438((uint64_t)v8, (uint64_t)&unk_100010B28, (uint64_t)v13);
  swift_release();
}

- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  sub_100001D08(&qword_100010AA0);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = sub_100009600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100010AF0;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100010AF8;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_100004438((uint64_t)v12, (uint64_t)&unk_100010B00, (uint64_t)v17);
  swift_release();
}

- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  sub_100001D08(&qword_100010AA0);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_100009600();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100010AB0;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100010AC0;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_100004438((uint64_t)v10, (uint64_t)&unk_100010AD0, (uint64_t)v15);
  swift_release();
}

- (id)declarationKeyForConfiguration:(id)a3
{
  NSArray v3 = *(void **)((char *)self + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController);
  if (v3)
  {
    id v4 = self;
    id v5 = a3;
    id v6 = v4;
    id v7 = v3;
    id v8 = [v5 store];
    id v9 = [v5 declaration];
    id v10 = [v7 declarationKeyForStore:v8 declaration:v9];

    return v10;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController));

  swift_bridgeObjectRelease();
}

@end