@interface RCRecordingTranscriptionService
+ (RCRecordingTranscriptionService)sharedInstance;
- (RCRecordingTranscriptionService)init;
- (void)cancelFileTranscriptionWithCompletionHandler:(id)a3;
- (void)startTranscriptionFor:(id)a3;
@end

@implementation RCRecordingTranscriptionService

+ (RCRecordingTranscriptionService)sharedInstance
{
  if (qword_100264548 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100275358;

  return (RCRecordingTranscriptionService *)v2;
}

- (RCRecordingTranscriptionService)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___RCRecordingTranscriptionService_fileTranscriptionTask);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RCRecordingTranscriptionService_isTranscribingLive) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RecordingTranscriptionService();
  return [(RCRecordingTranscriptionService *)&v4 init];
}

- (void)startTranscriptionFor:(id)a3
{
  uint64_t v4 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v7;
  v11[6] = v9;
  v12 = self;
  swift_bridgeObjectRetain();
  sub_10001E1A8((uint64_t)v6, (uint64_t)&unk_1002666D8, (uint64_t)v11);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelFileTranscriptionWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002666B8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002666C0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100009D98((uint64_t)v7, (uint64_t)&unk_1002666C8, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
}

@end