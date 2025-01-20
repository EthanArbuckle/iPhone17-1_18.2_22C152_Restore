@interface SearchUIToolKitUtilities
+ (void)performOpenIntentForAnnotation:(SFAppEntityAnnotation *)a3 bundleId:(NSString *)a4 completionHandler:(id)a5;
- (SearchUIToolKitUtilities)init;
@end

@implementation SearchUIToolKitUtilities

+ (void)performOpenIntentForAnnotation:(SFAppEntityAnnotation *)a3 bundleId:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EAE559D8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EAE559E0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1E4693074((uint64_t)v11, (uint64_t)&unk_1EAE559E8, (uint64_t)v16);
  swift_release();
}

- (SearchUIToolKitUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIToolKitUtilities;
  return [(SearchUIToolKitUtilities *)&v3 init];
}

@end