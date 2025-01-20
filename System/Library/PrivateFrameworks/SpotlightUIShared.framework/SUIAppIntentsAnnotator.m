@interface SUIAppIntentsAnnotator
+ (id)presentationHelperKey;
+ (id)queryHelperKey;
+ (void)annotateSearchField:(id)a3;
+ (void)registerDependency:(id)a3 forKey:(id)a4;
- (SUIAppIntentsAnnotator)init;
@end

@implementation SUIAppIntentsAnnotator

+ (id)presentationHelperKey
{
  v2 = (void *)sub_22F3D4588();

  return v2;
}

+ (id)queryHelperKey
{
  v2 = (void *)sub_22F3D4588();

  return v2;
}

+ (void)annotateSearchField:(id)a3
{
  id v3 = a3;
  sub_22F3D3B24();
}

+ (void)registerDependency:(id)a3 forKey:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AFA1030);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22F3D4598();
  uint64_t v10 = v9;
  uint64_t v11 = sub_22F3D4618();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_22F3D45F8();
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_22F3D45E8();
  v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v8;
  v13[5] = v10;
  v13[6] = a3;
  sub_22F3D3774((uint64_t)v7, (uint64_t)&unk_2686BFFC8, (uint64_t)v13);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (SUIAppIntentsAnnotator)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUIAppIntentsAnnotator;
  return [(SUIAppIntentsAnnotator *)&v3 init];
}

@end