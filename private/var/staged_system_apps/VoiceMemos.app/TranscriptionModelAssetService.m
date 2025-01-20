@interface TranscriptionModelAssetService
+ (_TtC10VoiceMemos30TranscriptionModelAssetService)sharedInstance;
- (_TtC10VoiceMemos30TranscriptionModelAssetService)init;
- (void)assetIsInstalledWithCompletionHandler:(id)a3;
- (void)downloadAsset;
- (void)isAvailableWithCompletionHandler:(id)a3;
@end

@implementation TranscriptionModelAssetService

- (_TtC10VoiceMemos30TranscriptionModelAssetService)init
{
  uint64_t v3 = OBJC_IVAR____TtC10VoiceMemos30TranscriptionModelAssetService__downloadStateValueSubject;
  uint64_t v7 = 0;
  char v8 = 0x80;
  sub_100028654((uint64_t *)&unk_1002690A0);
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)CurrentValueSubject.init(_:)();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for TranscriptionModelAssetService();
  return [(TranscriptionModelAssetService *)&v6 init];
}

- (void)isAvailableWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100269078;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002666C0;
  v12[5] = v11;
  v13 = self;
  sub_100009D98((uint64_t)v7, (uint64_t)&unk_1002666C8, (uint64_t)v12);
  swift_release();
}

+ (_TtC10VoiceMemos30TranscriptionModelAssetService)sharedInstance
{
  if (qword_100264628 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100275560;

  return (_TtC10VoiceMemos30TranscriptionModelAssetService *)v2;
}

- (void)assetIsInstalledWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100269088;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100269090;
  v12[5] = v11;
  v13 = self;
  sub_100009D98((uint64_t)v7, (uint64_t)&unk_100269098, (uint64_t)v12);
  swift_release();
}

- (void)downloadAsset
{
  uint64_t v3 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  uint64_t v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_10001E1A8((uint64_t)v5, (uint64_t)&unk_100266678, (uint64_t)v9);
  swift_release();
}

- (void).cxx_destruct
{
}

@end