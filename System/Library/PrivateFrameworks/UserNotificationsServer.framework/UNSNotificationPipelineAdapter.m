@interface UNSNotificationPipelineAdapter
+ (void)addInitialBulletins:(id)a3 categories:(id)a4 sourceDescription:(id)a5;
+ (void)createBulletin:(id)a3 category:(id)a4 destinations:(unint64_t)a5 sourceDescription:(id)a6 completion:(id)a7;
+ (void)deleteBulletin:(id)a3 sourceDescription:(id)a4 completion:(id)a5;
+ (void)updateBulletin:(id)a3 category:(id)a4 destinations:(unint64_t)a5 sourceDescription:(id)a6 completion:(id)a7;
- (UNSNotificationPipelineAdapter)init;
@end

@implementation UNSNotificationPipelineAdapter

+ (void)createBulletin:(id)a3 category:(id)a4 destinations:(unint64_t)a5 sourceDescription:(id)a6 completion:(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  swift_getObjCClassMetadata();
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  sub_2228D0C04(v13, a4, a5, v15, (uint64_t)sub_2228D3A58, v12, (uint64_t)&unk_26D509D50, (uint64_t)sub_2228D29BC, MEMORY[0x263F841E8]);

  swift_release();
}

+ (void)updateBulletin:(id)a3 category:(id)a4 destinations:(unint64_t)a5 sourceDescription:(id)a6 completion:(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  swift_getObjCClassMetadata();
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  sub_2228D0C04(v13, a4, a5, v15, (uint64_t)sub_2228D2998, v12, (uint64_t)&unk_26D509D00, (uint64_t)sub_2228D29BC, MEMORY[0x263F841F0]);

  swift_release();
}

+ (void)deleteBulletin:(id)a3 sourceDescription:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_getObjCClassMetadata();
  id v9 = a3;
  id v10 = a4;
  sub_2228D0F38(v9, v10, (uint64_t)sub_2228D282C, v8);

  swift_release();
}

+ (void)addInitialBulletins:(id)a3 categories:(id)a4 sourceDescription:(id)a5
{
  sub_2228CEC40(0, &qword_26AC12090);
  unint64_t v6 = sub_2228D8358();
  sub_2228CEC40(0, &qword_26AC12098);
  uint64_t v7 = sub_2228D82C8();
  swift_getObjCClassMetadata();
  id v8 = a5;
  sub_2228D11E4(v6, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (UNSNotificationPipelineAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)UNSNotificationPipelineAdapter;
  return [(UNSNotificationPipelineAdapter *)&v3 init];
}

@end