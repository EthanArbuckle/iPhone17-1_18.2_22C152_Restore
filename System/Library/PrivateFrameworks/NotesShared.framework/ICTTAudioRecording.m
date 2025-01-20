@interface ICTTAudioRecording
+ (NSDictionary)CRProperties;
- (ICTTAudioRecording)initWithICCRCoder:(id)a3;
- (ICTTAudioRecording)initWithIdentity:(id)a3 fields:(id)a4;
@end

@implementation ICTTAudioRecording

+ (NSDictionary)CRProperties
{
  return (NSDictionary *)sub_1C3C56450((uint64_t)a1, (uint64_t)a2, (void (*)(void))_sSo18ICTTAudioRecordingC11NotesSharedE12crPropertiesSDySSSo12ICCRDataType_pGvgZ_0);
}

- (ICTTAudioRecording)initWithIdentity:(id)a3 fields:(id)a4
{
  uint64_t v5 = sub_1C3DB8B98();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8B58();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA386200);
  sub_1C3DB9A98();
  v9 = (void *)sub_1C3DB8B38();
  v10 = (void *)sub_1C3DB9A88();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)ICTTAudioRecording;
  v11 = [(ICCRObject *)&v13 initWithIdentity:v9 fields:v10];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (ICTTAudioRecording)initWithICCRCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICTTAudioRecording;
  return [(ICCRObject *)&v4 initWithICCRCoder:a3];
}

@end