@interface SecurityStatus
+ (id)supportedStatusKeys;
- (_TtC18SecuritySubscriber14SecurityStatus)init;
- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5;
@end

@implementation SecurityStatus

+ (id)supportedStatusKeys
{
  sub_100003028(&qword_100018D60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011110;
  *(void *)(inited + 32) = sub_1000106F8();
  *(void *)(inited + 40) = v3;
  sub_10000E6F4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v4.super.isa = sub_100010828().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (void)queryForStatusWithKeyPaths:(NSArray *)a3 store:(RMSubscriberStore *)a4 completionHandler:(id)a5
{
  sub_100003028(&qword_100018CA0);
  __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_100010818();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100018FC8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100018CB8;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_10000CB04((uint64_t)v10, (uint64_t)&unk_100018CC0, (uint64_t)v15);
  swift_release();
}

- (_TtC18SecuritySubscriber14SecurityStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecurityStatus();
  return [(SecurityStatus *)&v3 init];
}

@end