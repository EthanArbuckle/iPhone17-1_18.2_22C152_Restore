@interface ManagedAppsStatus
+ (id)supportedStatusKeys;
- (_TtC21ManagedAppsSubscriber17ManagedAppsStatus)init;
- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5;
@end

@implementation ManagedAppsStatus

+ (id)supportedStatusKeys
{
  sub_100002AE8(&qword_10001CD30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014660;
  *(void *)(inited + 32) = sub_100013C18();
  *(void *)(inited + 40) = v3;
  sub_1000108AC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v4.super.isa = sub_100013D68().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100002AE8(&qword_10001CCE8);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_100013D58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10001D068;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10001CD00;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10000F2B8((uint64_t)v11, (uint64_t)&unk_10001CD08, (uint64_t)v16);
  swift_release();
}

- (_TtC21ManagedAppsSubscriber17ManagedAppsStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ManagedAppsStatus();
  return [(ManagedAppsStatus *)&v3 init];
}

@end