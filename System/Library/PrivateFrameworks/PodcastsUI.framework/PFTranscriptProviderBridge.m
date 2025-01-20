@interface PFTranscriptProviderBridge
+ (PFTranscriptProviderBridge)shared;
- (PFTranscriptProviderBridge)init;
- (void)invalidateTranscriptAssetForAdamID:(int64_t)a3;
- (void)updateTTMLIDFrom:(id)a3 toNewID:(id)a4 hasDownloadedContent:(BOOL)a5 forEpisodeAdamID:(int64_t)a6;
@end

@implementation PFTranscriptProviderBridge

+ (PFTranscriptProviderBridge)shared
{
  if (qword_1EBFDF3E8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBFE00D0;

  return (PFTranscriptProviderBridge *)v2;
}

- (void)invalidateTranscriptAssetForAdamID:(int64_t)a3
{
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFTranscriptProviderBridge_managedObjectContext);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = (void *)swift_allocObject();
  v7[2] = v5;
  v7[3] = a3;
  v7[4] = v6;
  v11[4] = sub_1E3D43E9C;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1E3CE65F8;
  v11[3] = &block_descriptor_30;
  v8 = _Block_copy(v11);
  v9 = self;
  id v10 = v5;
  swift_release();
  objc_msgSend(v10, sel_performBlock_, v8);
  _Block_release(v8);
}

- (void)updateTTMLIDFrom:(id)a3 toNewID:(id)a4 hasDownloadedContent:(BOOL)a5 forEpisodeAdamID:(int64_t)a6
{
  BOOL v7 = a5;
  id v8 = a4;
  if (a3)
  {
    uint64_t v10 = sub_1E3E7CD30();
    uint64_t v12 = v11;
    if (v8)
    {
LABEL_3:
      uint64_t v13 = sub_1E3E7CD30();
      id v8 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  v15 = self;
  sub_1E3D41D34(v10, v12, v13, (uint64_t)v8, v7, a6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (PFTranscriptProviderBridge)init
{
  result = (PFTranscriptProviderBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFTranscriptProviderBridge_wrappedProvider);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFTranscriptProviderBridge_workQueue);
}

@end