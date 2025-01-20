@interface ICAudioRecordingManager
+ (BOOL)isPaused;
+ (BOOL)isRecording;
+ (ICAttachment)currentAttachment;
+ (void)cancelCurrentAudioRecordingSessionWithCompletionHandler:(id)a3;
- (ICAudioRecordingManager)init;
@end

@implementation ICAudioRecordingManager

+ (ICAttachment)currentAttachment
{
  if (qword_1EB6FC1E8 != -1) {
    swift_once();
  }
  id v2 = AudioRecordingCoordinator.currentAttachment.getter();
  return (ICAttachment *)v2;
}

+ (BOOL)isRecording
{
  return sub_1C3D50368((uint64_t)a1, (uint64_t)a2, (uint64_t (*)(void))AudioRecordingCoordinator.isRecording.getter);
}

+ (BOOL)isPaused
{
  return sub_1C3D50368((uint64_t)a1, (uint64_t)a2, (uint64_t (*)(void))AudioRecordingCoordinator.isPaused.getter);
}

+ (void)cancelCurrentAudioRecordingSessionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FBAE0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_1C3DBA278();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA3885A8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA388210;
  v12[5] = v11;
  sub_1C3D53940((uint64_t)v7, (uint64_t)&unk_1EA388218, (uint64_t)v12);
  swift_release();
}

- (ICAudioRecordingManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICAudioRecordingManager *)&v3 init];
}

@end