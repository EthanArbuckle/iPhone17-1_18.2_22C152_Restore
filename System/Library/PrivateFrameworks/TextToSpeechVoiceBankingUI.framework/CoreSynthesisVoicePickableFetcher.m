@interface CoreSynthesisVoicePickableFetcher
- (_TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher)init;
- (void)dealloc;
- (void)downloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6;
- (void)finishedDeletingResource:(id)a3;
- (void)finishedDownloadingResource:(id)a3 wasCancelled:(BOOL)a4;
@end

@implementation CoreSynthesisVoicePickableFetcher

- (void)dealloc
{
  v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x138);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CoreSynthesisVoicePickableFetcher(0);
  [(CoreSynthesisVoicePickableFetcher *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_assetService));
  swift_bridgeObjectRelease();
  sub_25F44BF3C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_filterBlock));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_requiredTraits;
  uint64_t v4 = sub_25F53B158();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_source;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

- (void)downloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6
{
  uint64_t v8 = sub_25F53D8E8();
  uint64_t v10 = v9;
  v11 = *(void (**)(uint64_t, uint64_t, float))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x110);
  v12 = self;
  v11(v8, v10, a4);

  swift_bridgeObjectRelease();
}

- (void)finishedDownloadingResource:(id)a3 wasCancelled:(BOOL)a4
{
  id v6 = a3;
  v12 = self;
  id v7 = objc_msgSend(v6, sel_voiceId);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_25F53D8E8();
    uint64_t v11 = v10;

    if (a4) {
      (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v12->super.isa) + 0x128))(v9, v11);
    }
    else {
      (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v12->super.isa) + 0x120))(v9, v11);
    }

    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

- (void)finishedDeletingResource:(id)a3
{
  id v4 = a3;
  uint64_t v10 = self;
  id v5 = objc_msgSend(v4, sel_voiceId);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_25F53D8E8();
    uint64_t v9 = v8;

    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v10->super.isa) + 0x118))(v7, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

- (_TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher)init
{
  result = (_TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end