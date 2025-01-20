@interface MathSettingsAdapter
- (Class)configurationClass;
- (_TtC22MathSettingsSubscriber19MathSettingsAdapter)init;
- (id)combineConfigurations:(id)a3;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyCombinedConfiguration:(RMModelConfigurationBase *)a3 declarationKeys:(NSSet *)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeCombinedConfigurationForScope:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation MathSettingsAdapter

- (Class)configurationClass
{
  type metadata accessor for RMModelMathSettingsDeclaration();

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)combineConfigurations:(id)a3
{
  sub_10000D85C(0, (unint64_t *)&unk_100021D40);
  unint64_t v4 = sub_100016C70();
  v5 = self;
  v6 = (void *)_s22MathSettingsSubscriber0aB7AdapterC21combineConfigurationsySo24RMModelConfigurationBaseCSgSayAFGF_0(v4);

  swift_bridgeObjectRelease();

  return v6;
}

- (id)declarationKeyForConfiguration:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  NSString v8 = sub_100016BB0();
  id v9 = [v5 newDeclarationKeyWithSubscriberIdentifier:v8 reference:v6];

  return v9;
}

- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4
{
  sub_100003E74(&qword_100021C40);
  __chkstk_darwin();
  NSString v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100016CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100021D28;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100021D30;
  v13[5] = v12;
  v14 = self;
  sub_10000729C((uint64_t)v8, (uint64_t)&unk_100021D38, (uint64_t)v13);
  swift_release();
}

- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  sub_100003E74(&qword_100021C40);
  __chkstk_darwin();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = sub_100016CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100021D08;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100021D10;
  v15[5] = v14;
  v16 = self;
  sub_10000729C((uint64_t)v10, (uint64_t)&unk_100021D18, (uint64_t)v15);
  swift_release();
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  sub_100003E74(&qword_100021C40);
  __chkstk_darwin();
  NSString v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100016CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100021CE8;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100021CF0;
  v13[5] = v12;
  v14 = self;
  sub_10000729C((uint64_t)v8, (uint64_t)&unk_100021CF8, (uint64_t)v13);
  swift_release();
}

- (void)applyCombinedConfiguration:(RMModelConfigurationBase *)a3 declarationKeys:(NSSet *)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  sub_100003E74(&qword_100021C40);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v13;
  v14[6] = self;
  uint64_t v15 = sub_100016CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100021CB0;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100021CB8;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_10000729C((uint64_t)v12, (uint64_t)&unk_100021CC0, (uint64_t)v17);
  swift_release();
}

- (void)removeCombinedConfigurationForScope:(int64_t)a3 completionHandler:(id)a4
{
  sub_100003E74(&qword_100021C40);
  __chkstk_darwin();
  NSString v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100016CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100021C90;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100021C98;
  v13[5] = v12;
  v14 = self;
  sub_10000729C((uint64_t)v8, (uint64_t)&unk_100021CA0, (uint64_t)v13);
  swift_release();
}

- (void)configurationUIForConfiguration:(RMSubscribedConfigurationReference *)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  sub_100003E74(&qword_100021C40);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_100016CC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100021C50;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100021C60;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_10000729C((uint64_t)v10, (uint64_t)&unk_100021C70, (uint64_t)v15);
  swift_release();
}

- (_TtC22MathSettingsSubscriber19MathSettingsAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MathSettingsAdapter();
  return [(MathSettingsAdapter *)&v3 init];
}

@end