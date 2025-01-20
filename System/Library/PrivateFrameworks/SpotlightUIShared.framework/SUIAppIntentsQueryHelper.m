@interface SUIAppIntentsQueryHelper
- (SUIAppIntentsQueryHelper)init;
- (void)updateSearchString:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation SUIAppIntentsQueryHelper

- (SUIAppIntentsQueryHelper)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  void *v2 = 0;
  v2[1] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AppIntentsQueryHelper();
  return [(SUIAppIntentsQueryHelper *)&v4 init];
}

- (void)updateSearchString:(NSString *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AFA1030);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_22F3D4618();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686BFE08;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2686BFE18;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_22F3CEB84((uint64_t)v8, (uint64_t)&unk_2686BFE28, (uint64_t)v13);
  swift_release();
}

- (void).cxx_destruct
{
}

@end