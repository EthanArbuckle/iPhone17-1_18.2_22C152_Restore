@interface ICTTAudioRecording.Fragment
+ (NSDictionary)CRProperties;
- (id)initWithICCRCoder:(uint64_t)a3;
- (id)initWithIdentity:(void *)a1 fields:;
@end

@implementation ICTTAudioRecording.Fragment

+ (NSDictionary)CRProperties
{
  return (NSDictionary *)sub_1C3C56450((uint64_t)a1, (uint64_t)a2, (void (*)(void))_sSo18ICTTAudioRecordingC11NotesSharedE8FragmentC12crPropertiesSDySSSo12ICCRDataType_pGvgZ_0);
}

- (id)initWithIdentity:(void *)a1 fields:
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_1C3DB8B98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8B58();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA386200);
  sub_1C3DB9A98();
  v7 = (void *)sub_1C3DB8B38();
  v8 = (void *)sub_1C3DB9A88();
  swift_bridgeObjectRelease();
  v11.receiver = a1;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, sel_initWithIdentity_fields_, v7, v8);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v9;
}

- (id)initWithICCRCoder:(uint64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, sel_initWithICCRCoder_, a3);
}

@end