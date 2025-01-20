@interface SearchUICalculateUIUtilities
+ (void)currencyConversionProviderImageWithCompletionHandler:(id)a3;
+ (void)currencyConversionProviderNameWithCompletionHandler:(id)a3;
+ (void)currencyConversionProviderURLWithCompletionHandler:(id)a3;
- (_TtC8SearchUI28SearchUICalculateUIUtilities)init;
@end

@implementation SearchUICalculateUIUtilities

+ (void)currencyConversionProviderImageWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EAE56258;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EAE56260;
  v12[5] = v11;
  sub_1E4693074((uint64_t)v7, (uint64_t)&unk_1EAE56268, (uint64_t)v12);
  swift_release();
}

+ (void)currencyConversionProviderNameWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EAE56238;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EAE56240;
  v12[5] = v11;
  sub_1E4693074((uint64_t)v7, (uint64_t)&unk_1EAE56248, (uint64_t)v12);
  swift_release();
}

+ (void)currencyConversionProviderURLWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EAE56220;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EAE559E0;
  v12[5] = v11;
  sub_1E4693074((uint64_t)v7, (uint64_t)&unk_1EAE559E8, (uint64_t)v12);
  swift_release();
}

- (_TtC8SearchUI28SearchUICalculateUIUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUICalculateUIUtilities();
  return [(SearchUICalculateUIUtilities *)&v3 init];
}

@end