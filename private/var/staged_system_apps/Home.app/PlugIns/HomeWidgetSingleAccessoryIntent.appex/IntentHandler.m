@interface IntentHandler
- (_TtC31HomeWidgetSingleAccessoryIntent13IntentHandler)init;
- (id)defaultAccessoryForSecurityAccessoryConfiguration:(id)a3;
- (id)defaultClimateTypeForClimateSensorTypeConfiguration:(id)a3;
- (void)provideAccessoryOptionsCollectionForSecurityAccessoryConfiguration:(SecurityAccessoryConfigurationIntent *)a3 withCompletion:(id)a4;
- (void)provideClimateTypeOptionsCollectionForClimateSensorTypeConfiguration:(ClimateSensorTypeConfigurationIntent *)a3 withCompletion:(id)a4;
@end

@implementation IntentHandler

- (_TtC31HomeWidgetSingleAccessoryIntent13IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v3 init];
}

- (void)provideAccessoryOptionsCollectionForSecurityAccessoryConfiguration:(SecurityAccessoryConfigurationIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7 = sub_10000D9EC(&qword_100041D30);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_10002A0B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100041DA0;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100041DA8;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_10001CAB8((uint64_t)v10, (uint64_t)&unk_100041DB0, (uint64_t)v15);
  swift_release();
}

- (id)defaultAccessoryForSecurityAccessoryConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001FDCC();

  return v6;
}

- (void)provideClimateTypeOptionsCollectionForClimateSensorTypeConfiguration:(ClimateSensorTypeConfigurationIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7 = sub_10000D9EC(&qword_100041D30);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_10002A0B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100041D40;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100041D50;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_10001CAB8((uint64_t)v10, (uint64_t)&unk_100041D60, (uint64_t)v15);
  swift_release();
}

- (id)defaultClimateTypeForClimateSensorTypeConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000204F8();
  uint64_t v7 = v6;

  return v7;
}

@end