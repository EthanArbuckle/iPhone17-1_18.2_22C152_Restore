@interface ManagedAppsAdapter
- (_TtC21ManagedAppsSubscriber18ManagedAppsAdapter)init;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation ManagedAppsAdapter

- (id)configurationClasses
{
  sub_100002AE8(&qword_10001CC40);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100014660;
  *(void *)(v2 + 32) = sub_10000E288(0, (unint64_t *)&unk_10001CE50);
  sub_100002AE8(&qword_10001CC48);
  v3.super.isa = sub_100013CF8().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  sub_100002AE8(&qword_10001CCE8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100013D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10001CE10;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10001CE18;
  v13[5] = v12;
  v14 = self;
  sub_10000F2B8((uint64_t)v8, (uint64_t)&unk_10001CE20, (uint64_t)v13);
  swift_release();
}

- (void)applyConfiguration:(RMSubscribedConfigurationReference *)a3 replaceKey:(RMStoreDeclarationKey *)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  sub_100002AE8(&qword_10001CCE8);
  __chkstk_darwin();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = sub_100013D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10001CDC8;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10001CDD0;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_10000F2B8((uint64_t)v12, (uint64_t)&unk_10001CDD8, (uint64_t)v17);
  swift_release();
}

- (void)removeDeclarationKey:(RMStoreDeclarationKey *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  sub_100002AE8(&qword_10001CCE8);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_100013D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10001CD58;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10001CD60;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_10000F2B8((uint64_t)v10, (uint64_t)&unk_10001CD68, (uint64_t)v15);
  swift_release();
}

- (id)declarationKeyForConfiguration:(id)a3
{
  v5 = self;
  id v6 = a3;
  uint64_t v7 = self;
  NSString v8 = sub_100013C08();
  id v9 = [v5 newDeclarationKeyWithSubscriberIdentifier:v8 reference:v6];

  return v9;
}

- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  sub_100002AE8(&qword_10001CCE8);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_100013D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10001CCF8;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10001CD00;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_10000F2B8((uint64_t)v10, (uint64_t)&unk_10001CD08, (uint64_t)v15);
  swift_release();
}

- (_TtC21ManagedAppsSubscriber18ManagedAppsAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ManagedAppsAdapter();
  return [(ManagedAppsAdapter *)&v3 init];
}

@end