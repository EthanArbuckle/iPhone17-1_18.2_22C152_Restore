@interface VoiceBankingXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13voicebankingd21VoiceBankingXPCServer)init;
- (void)cancelTrainingTaskWithTaskID:(id)a3 reply:(id)a4;
- (void)createVoiceWithNamed:(id)a3 localeID:(id)a4 reply:(id)a5;
- (void)deleteModelWithModelID:(id)a3 reply:(id)a4;
- (void)deleteVoiceWithVoiceID:(id)a3 reply:(id)a4;
- (void)discardTrainingTasksWithReply:(id)a3;
- (void)exportTrainingDataWithVoiceID:(id)a3 reply:(id)a4;
- (void)fetchInstalledVoiceModelsWithCompletion:(id)a3;
- (void)fetchTrainingMetadataWithVoiceID:(id)a3 completion:(id)a4;
- (void)fetchVoiceModelsWithCompletion:(id)a3;
- (void)fetchVoicesWithCompletion:(id)a3;
- (void)importModelFromDirectory:(id)a3 overrideLocaleID:(id)a4 addingToVoice:(id)a5 reply:(id)a6;
- (void)importTrainingDataFromDirectory:(id)a3 creatingVoiceName:(id)a4 localeID:(id)a5 reply:(id)a6;
- (void)initializeCloudKitSchemaWithReply:(id)a3;
- (void)repairDatastoreFromFilesystemWithReply:(id)a3;
- (void)requestVoiceCacheRebuildIfNeeded;
- (void)synchronizeModelFuturesWithModelID:(id)a3 reply:(id)a4;
- (void)trainModelWithVoiceID:(id)a3 mode:(id)a4 startImmediately:(BOOL)a5 skipValidation:(BOOL)a6 overrideMinimumPhraseCount:(int64_t)a7 reply:(id)a8;
- (void)updateTCCCloudKitAccessWithAllowed:(BOOL)a3 reply:(id)a4;
@end

@implementation VoiceBankingXPCServer

- (_TtC13voicebankingd21VoiceBankingXPCServer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->listener[OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for TTSVBService();
  v4 = self;
  static TTSVBService.serviceName.getter();
  id v5 = objc_allocWithZone((Class)NSXPCListener);
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v7 = (objc_class *)[v5 initWithMachServiceName:v6];

  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_listener) = v7;
  v9.receiver = v4;
  v9.super_class = ObjectType;
  return [(VoiceBankingXPCServer *)&v9 init];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000EA5C(v7);

  return v9 & 1;
}

- (void)createVoiceWithNamed:(id)a3 localeID:(id)a4 reply:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  v14 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v15 = *((void *)v14 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v17 = (void *)swift_allocObject();
    v17[2] = v7;
    v17[3] = v9;
    v17[4] = v10;
    v17[5] = v12;
    v17[6] = sub_10000FCC0;
    v17[7] = v13;
    v18 = *(void (**)(uint64_t (*)(), void *, uint64_t, uint64_t))(v15 + 8);
    v19 = self;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v18(sub_10000F128, v17, ObjectType, v15);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    v20 = self;
    swift_bridgeObjectRelease();
    swift_release();
  }

  swift_bridgeObjectRelease();
}

- (void)importTrainingDataFromDirectory:(id)a3 creatingVoiceName:(id)a4 localeID:(id)a5 reply:(id)a6
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v12;
  v20 = self;
  VoiceBankingXPCServer.importTrainingData(fromDirectory:creatingVoiceName:localeID:reply:)((uint64_t)v11, v13, v15, v16, v18, (uint64_t)sub_100010768, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)importModelFromDirectory:(id)a3 overrideLocaleID:(id)a4 addingToVoice:(id)a5 reply:(id)a6
{
  uint64_t v22 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  v20 = self;
  VoiceBankingXPCServer.importModel(fromDirectory:overrideLocaleID:addingToVoice:reply:)((uint64_t)v15, v17, (uint64_t)a4, (uint64_t)v11, (uint64_t)sub_100010768, v19);

  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)exportTrainingDataWithVoiceID:(id)a3 reply:(id)a4
{
}

- (void)deleteVoiceWithVoiceID:(id)a3 reply:(id)a4
{
}

- (void)synchronizeModelFuturesWithModelID:(id)a3 reply:(id)a4
{
}

- (void)deleteModelWithModelID:(id)a3 reply:(id)a4
{
}

- (void)fetchVoicesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_10000FBA8;
    *(void *)(v9 + 24) = v5;
    uint64_t v10 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v7 + 8);
    uint64_t v11 = self;
    swift_retain();
    v10(sub_100010780, v9, ObjectType, v7);

    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)fetchVoiceModelsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_10000FBA8;
    *(void *)(v9 + 24) = v5;
    uint64_t v10 = *(void (**)(uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(v7 + 8);
    uint64_t v11 = self;
    swift_retain();
    v10(sub_10001077C, v9, ObjectType, v7);

    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)fetchInstalledVoiceModelsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_10000FBA8;
    *(void *)(v9 + 24) = v5;
    uint64_t v10 = *(void (**)(uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(v7 + 8);
    uint64_t v11 = self;
    swift_retain();
    v10(sub_100010778, v9, ObjectType, v7);

    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)fetchTrainingMetadataWithVoiceID:(id)a3 completion:(id)a4
{
}

- (void)trainModelWithVoiceID:(id)a3 mode:(id)a4 startImmediately:(BOOL)a5 skipValidation:(BOOL)a6 overrideMinimumPhraseCount:(int64_t)a7 reply:(id)a8
{
  uint64_t v23 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v16;
  uint64_t v21 = self;
  VoiceBankingXPCServer.trainModel(voiceID:mode:startImmediately:skipValidation:overrideMinimumPhraseCount:reply:)((uint64_t)v15, v17, v19, v10, v9, v23, (uint64_t)sub_100010768, v20);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)discardTrainingTasksWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_100010768;
    *(void *)(v9 + 24) = v5;
    BOOL v10 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v7 + 8);
    uint64_t v11 = self;
    swift_retain();
    v10(sub_100010774, v9, ObjectType, v7);

    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)cancelTrainingTaskWithTaskID:(id)a3 reply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  BOOL v10 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v11 = *((void *)v10 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v6;
    v13[3] = v8;
    v13[4] = sub_100010768;
    v13[5] = v9;
    uint64_t v14 = *(void (**)(uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v11 + 8);
    uint64_t v15 = self;
    swift_bridgeObjectRetain();
    swift_retain();
    v14(sub_1000106BC, v13, ObjectType, v11);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v16 = self;
    swift_bridgeObjectRelease();
    swift_release();
  }
}

- (void)requestVoiceCacheRebuildIfNeeded
{
  v3 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 24);
    uint64_t v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void)repairDatastoreFromFilesystemWithReply:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_100010768;
    *(void *)(v9 + 24) = v5;
    BOOL v10 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v7 + 8);
    uint64_t v11 = self;
    swift_retain();
    v10(sub_100010770, v9, ObjectType, v7);

    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)updateTCCCloudKitAccessWithAllowed:(BOOL)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v11 = swift_allocObject();
    *(unsigned char *)(v11 + 16) = a3;
    *(void *)(v11 + 24) = sub_100010768;
    *(void *)(v11 + 32) = v7;
    uint64_t v12 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v9 + 16);
    uint64_t v13 = self;
    swift_retain();
    v12(sub_1000106B8, v11, ObjectType, v9);

    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)initializeCloudKitSchemaWithReply:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_10000FB88;
    *(void *)(v9 + 24) = v5;
    BOOL v10 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v7 + 8);
    uint64_t v11 = self;
    swift_retain();
    v10(sub_10001076C, v9, ObjectType, v7);

    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13voicebankingd21VoiceBankingXPCServer_delegate;

  sub_10000FB00((uint64_t)v3);
}

@end