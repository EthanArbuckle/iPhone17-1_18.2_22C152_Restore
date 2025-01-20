@interface ICBackgroundTranscriber
+ (ICBackgroundTranscriber)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (ICBackgroundTranscriber)init;
- (void)addCallRecordingTranscriptionTaskToQueueWithSpeakers:(id)a3 NGASR:(BOOL)a4 attachmentIdentifier:(id)a5;
- (void)addFirstTimeTranscriptionTaskToQueueWithMediaURL:(id)a3 attachmentIdentifier:(id)a4 subattachmentIdentifier:(id)a5;
- (void)addRetranscriptionTaskToQueueWithSubattachmentAndMediaInfo:(id)a3 attachmentIdentifier:(id)a4;
- (void)handleResumeForeground;
@end

@implementation ICBackgroundTranscriber

+ (ICBackgroundTranscriber)sharedInstance
{
  if (qword_1EA385870 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (ICBackgroundTranscriber *)(id)qword_1EA387190;
}

+ (void)setSharedInstance:(id)a3
{
  uint64_t v3 = qword_1EA385870;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1EA387190;
  qword_1EA387190 = (uint64_t)v4;
}

- (ICBackgroundTranscriber)init
{
  return (ICBackgroundTranscriber *)sub_1C3CA02B8();
}

- (void)handleResumeForeground
{
  v2 = self;
  sub_1C3CA04E0();
}

- (void)addFirstTimeTranscriptionTaskToQueueWithMediaURL:(id)a3 attachmentIdentifier:(id)a4 subattachmentIdentifier:(id)a5
{
  uint64_t v8 = sub_1C3DB88F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8898();
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  swift_retain();
  sub_1C3CAEAFC((uint64_t)v11, v13, v14, (uint64_t)sub_1C3CA0724, v12);
  swift_release_n();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)addRetranscriptionTaskToQueueWithSubattachmentAndMediaInfo:(id)a3 attachmentIdentifier:(id)a4
{
  sub_1C3C4C8B4(0, (unint64_t *)&qword_1EA388CF0);
  sub_1C3DB88F8();
  sub_1C3CAF500(qword_1EA3864F0, (unint64_t *)&qword_1EA388CF0);
  uint64_t v6 = sub_1C3DB9A98();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v9 = a4;
  uint64_t v8 = self;
  swift_retain();
  BackgroundTranscriber.retranscriptionTask(subattachmentAndMediaInfo:attachmentIdentifier:completion:)(v6, v9, (uint64_t)sub_1C3CAED48, v7);
  swift_release_n();
  swift_bridgeObjectRelease();
}

- (void)addCallRecordingTranscriptionTaskToQueueWithSpeakers:(id)a3 NGASR:(BOOL)a4 attachmentIdentifier:(id)a5
{
  uint64_t v8 = sub_1C3DBA018();
  id v10 = a5;
  id v9 = self;
  sub_1C3CA0C74(v8, a4, v10);
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICBackgroundTranscriber_workerContext);
}

@end