@interface _SFAppDistributorWrapper
+ (void)handlePunchoutWithBundleID:(NSString *)a3 adamID:(NSNumber *)a4 externalVersionID:(NSNumber *)a5 completionHandler:(id)a6;
- (_SFAppDistributorWrapper)init;
@end

@implementation _SFAppDistributorWrapper

+ (void)handlePunchoutWithBundleID:(NSString *)a3 adamID:(NSNumber *)a4 externalVersionID:(NSNumber *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E917BDF0);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  uint64_t v16 = sub_18C6F9B88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E917CBE0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E917C4A0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_18C6EEB84((uint64_t)v13, (uint64_t)&unk_1E917C4A8, (uint64_t)v18);
  swift_release();
}

- (_SFAppDistributorWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SFAppDistributorWrapper();
  return [(_SFAppDistributorWrapper *)&v3 init];
}

@end