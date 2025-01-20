@interface VisualTranslationService
+ (void)isTranslatable:(id)a3 completion:(id)a4;
+ (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6;
- (_TtC13TranslationUI24VisualTranslationService)init;
@end

@implementation VisualTranslationService

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  sub_1DB0E2EFC(0, &qword_1EBA4E580);
  uint64_t v5 = sub_1DB1F14A0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  swift_getObjCClassMetadata();
  static VisualTranslationService.isTranslatable(_:completion:)(v5, (uint64_t)sub_1DB1CE7E8, v6);
  swift_release();
  swift_bridgeObjectRelease();
}

+ (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA4E570);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  v14 = (char *)&v22 - v13;
  v15 = _Block_copy(a6);
  sub_1DB0E2EFC(0, &qword_1EBA4E580);
  uint64_t v16 = sub_1DB1F14A0();
  if (a4)
  {
    sub_1DB1EF5F0();
    uint64_t v17 = sub_1DB1EF6B0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_1DB1EF6B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 1, 1, v18);
  }
  if (a5)
  {
    sub_1DB1EF5F0();
    uint64_t v19 = sub_1DB1EF6B0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_1DB1EF6B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 1, 1, v20);
  }
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v15;
  swift_getObjCClassMetadata();
  static VisualTranslationService.translate(_:sourceLocale:targetLocale:completion:)(v16, (uint64_t)v14, (uint64_t)v11, (uint64_t)sub_1DB1CE7E0, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1DB0E8BD4((uint64_t)v11, &qword_1EBA4E570);
  sub_1DB0E8BD4((uint64_t)v14, &qword_1EBA4E570);
}

- (_TtC13TranslationUI24VisualTranslationService)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(VisualTranslationService *)&v3 init];
}

@end