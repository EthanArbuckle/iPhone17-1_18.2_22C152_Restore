@interface BKAppAddToWTRDelegate
- (BKAppAddToWTRDelegate)init;
- (BKAppAddToWTRDelegate)initWithPriceTracker:(id)a3;
- (void)addToWTR:(Class)a3 didAcceptPriceTrackingOptInWithCompletion:(id)a4;
- (void)addToWTR:(Class)a3 didShowPriceTrackingOptInWithCompletion:(id)a4;
- (void)addToWTR:(Class)a3 priceTrackingOptInTypeWithCompletion:(id)a4;
@end

@implementation BKAppAddToWTRDelegate

- (BKAppAddToWTRDelegate)initWithPriceTracker:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  id v5 = [v4 sharedInstance];
  v6 = (char *)objc_allocWithZone(ObjectType);
  swift_weakInit();
  swift_weakAssign();
  *(void *)&v6[OBJC_IVAR___BKAppAddToWTRDelegate_notifications] = v5;
  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = [(BKAppAddToWTRDelegate *)&v9 init];
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)addToWTR:(Class)a3 priceTrackingOptInTypeWithCompletion:(id)a4
{
  uint64_t v7 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v7 - 8);
  objc_super v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100B44DF0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100B44DF8;
  v14[5] = v13;
  v15 = self;
  sub_1006EB59C((uint64_t)v9, (uint64_t)&unk_100B44E00, (uint64_t)v14);
  swift_release();
}

- (void)addToWTR:(Class)a3 didShowPriceTrackingOptInWithCompletion:(id)a4
{
  uint64_t v7 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v7 - 8);
  objc_super v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100B44DD0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100B44DD8;
  v14[5] = v13;
  v15 = self;
  sub_1006EB59C((uint64_t)v9, (uint64_t)&unk_100B44DE0, (uint64_t)v14);
  swift_release();
}

- (void)addToWTR:(Class)a3 didAcceptPriceTrackingOptInWithCompletion:(id)a4
{
  uint64_t v7 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v7 - 8);
  objc_super v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100B44D98;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100B2C0F0;
  v14[5] = v13;
  v15 = self;
  sub_1006EB59C((uint64_t)v9, (uint64_t)&unk_100B33060, (uint64_t)v14);
  swift_release();
}

- (BKAppAddToWTRDelegate)init
{
  result = (BKAppAddToWTRDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKAppAddToWTRDelegate_notifications);
}

@end