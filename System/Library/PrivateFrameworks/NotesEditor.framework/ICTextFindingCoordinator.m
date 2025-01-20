@interface ICTextFindingCoordinator
- (BOOL)replaceMatches:(id)a3 withString:(id)a4 error:(id *)a5;
- (ICTextFindingCoordinator)init;
- (ICTextFindingCoordinator)initWithDataSource:(id)a3;
- (void)configureFindInteraction:(id)a3 forTextView:(id)a4;
- (void)matchesForString:(NSString *)a3 inTextStorage:(NSTextStorage *)a4 note:(ICNote *)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7 startsWith:(BOOL)a8 completion:(id)a9;
- (void)replaceAllOccurrencesOfQueryString:(NSString *)a3 withString:(NSString *)a4 inTextStorage:(NSTextStorage *)a5 note:(ICNote *)a6 ignoreCase:(BOOL)a7 wholeWords:(BOOL)a8 startsWith:(BOOL)a9 completion:(id)a10;
@end

@implementation ICTextFindingCoordinator

- (ICTextFindingCoordinator)initWithDataSource:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ICTextFindingCoordinator *)&v6 init];
}

- (ICTextFindingCoordinator)init
{
  result = (ICTextFindingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)configureFindInteraction:(id)a3 forTextView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s11NotesEditor22TextFindingCoordinatorC9configure15findInteraction3forySo06UIFindH0C_So10ICTextViewCtF_0(v6);
}

- (void)matchesForString:(NSString *)a3 inTextStorage:(NSTextStorage *)a4 note:(ICNote *)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7 startsWith:(BOOL)a8 completion:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD811C0);
  MEMORY[0x270FA5388](v16 - 8);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = a5;
  *(unsigned char *)(v20 + 40) = a6;
  *(unsigned char *)(v20 + 41) = a7;
  *(unsigned char *)(v20 + 42) = a8;
  *(void *)(v20 + 48) = v19;
  *(void *)(v20 + 56) = self;
  uint64_t v21 = sub_20C162DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_2676BC4B8;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_2676BC4C0;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = self;
  sub_20C014C5C((uint64_t)v18, (uint64_t)&unk_2676BC4C8, (uint64_t)v23);
  swift_release();
}

- (BOOL)replaceMatches:(id)a3 withString:(id)a4 error:(id *)a5
{
  sub_20BFCEE58(0, &qword_2676BC488);
  unint64_t v6 = sub_20C162CF0();
  id v7 = (char **)sub_20C162AC0();
  v9 = v8;
  v10 = self;
  sub_20BFF0084(v6, v7, v9, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (void)replaceAllOccurrencesOfQueryString:(NSString *)a3 withString:(NSString *)a4 inTextStorage:(NSTextStorage *)a5 note:(ICNote *)a6 ignoreCase:(BOOL)a7 wholeWords:(BOOL)a8 startsWith:(BOOL)a9 completion:(id)a10
{
  HIDWORD(v29) = a8;
  v30 = a3;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD811C0);
  MEMORY[0x270FA5388](v16 - 8);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = a5;
  *(void *)(v20 + 40) = a6;
  *(unsigned char *)(v20 + 48) = a7;
  *(unsigned char *)(v20 + 49) = BYTE4(v29);
  *(unsigned char *)(v20 + 50) = a9;
  *(void *)(v20 + 56) = v19;
  *(void *)(v20 + 64) = self;
  uint64_t v21 = sub_20C162DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_2676BC498;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_2676BC4A0;
  v23[5] = v22;
  v24 = v30;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  uint64_t v28 = self;
  sub_20C014C5C((uint64_t)v18, (uint64_t)&unk_2676BC410, (uint64_t)v23);
  swift_release();
}

@end