@interface ICModelAvailabilityManager
+ (ICModelAvailabilityManager)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (BOOL)supportsCallRecording;
- (BOOL)supportsCallTranscription;
- (BOOL)supportsGeneralASR;
- (BOOL)supportsGreymatter;
- (ICModelAvailabilityManager)init;
- (void)determineASRAvailability:(id)a3;
@end

@implementation ICModelAvailabilityManager

+ (ICModelAvailabilityManager)sharedInstance
{
  if (qword_26AA91770 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (ICModelAvailabilityManager *)(id)qword_26AA91698;
}

+ (void)setSharedInstance:(id)a3
{
  uint64_t v3 = qword_26AA91770;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_26AA91698;
  qword_26AA91698 = (uint64_t)v4;
}

- (BOOL)supportsCallRecording
{
  return TUCallRecordingActivatable();
}

- (BOOL)supportsCallTranscription
{
  return TUCallTranscriptionSupported();
}

- (BOOL)supportsGreymatter
{
  v2 = self;
  sub_20C2B2A10();

  return v4;
}

- (BOOL)supportsGeneralASR
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
  uint64_t v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_20C2A3838((unsigned char *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  BOOL v4 = v6;

  swift_release();
  return v4;
}

- (void)determineASRAvailability:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676C6058);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20C2B2960();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676C6490;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676C64A0;
  v12[5] = v11;
  v13 = self;
  sub_20C2A4D08((uint64_t)v7, (uint64_t)&unk_2676C64B0, (uint64_t)v12);
  swift_release();
}

- (ICModelAvailabilityManager)init
{
  return (ICModelAvailabilityManager *)ICModelAvailabilityManager.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end