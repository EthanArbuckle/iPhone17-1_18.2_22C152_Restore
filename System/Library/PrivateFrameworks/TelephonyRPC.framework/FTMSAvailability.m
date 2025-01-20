@interface FTMSAvailability
+ (void)isCloudSyncAvailableWithCompletionHandler:(id)a3;
- (_TtC12TelephonyRPC16FTMSAvailability)init;
@end

@implementation FTMSAvailability

+ (void)isCloudSyncAvailableWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687AAA90);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = a1;
  uint64_t v9 = sub_234673A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_2687AAAA0;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2687AAAB0;
  v11[5] = v10;
  sub_234661144((uint64_t)v6, (uint64_t)&unk_2687AAAC0, (uint64_t)v11);
  swift_release();
}

- (_TtC12TelephonyRPC16FTMSAvailability)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FTMSAvailability();
  return [(FTMSAvailability *)&v3 init];
}

@end