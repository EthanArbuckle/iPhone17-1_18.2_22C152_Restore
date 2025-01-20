@interface ICPDFTextFindingResult
+ (void)resultsInAttachment:(ICAttachment *)a3 matchingString:(NSString *)a4 textView:(ICTextView *)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7 startsWith:(BOOL)a8 usePattern:(BOOL)a9 completion:(id)a10;
- (_TtC11NotesEditor22ICPDFTextFindingResult)init;
- (id)framesForHighlightInTextView:(id)a3;
- (int64_t)compare:(id)a3;
- (void)scrollToVisibleInTextView:(id)a3;
- (void)selectInTextView:(id)a3;
@end

@implementation ICPDFTextFindingResult

- (int64_t)compare:(id)a3
{
  v4 = (objc_class *)a3;
  v5 = self;
  v8.super.isa = v4;
  NSComparisonResult v6 = ICPDFTextFindingResult.compare(_:)(v8);

  return v6;
}

- (void)selectInTextView:(id)a3
{
  NSComparisonResult v6 = self;
  id v4 = a3;
  id v5 = [(ICTextFindingResult *)v6 range];
  if (v4)
  {
    objc_msgSend(v4, sel_setSelectedRange_, v5, 0);
  }
}

- (id)framesForHighlightInTextView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ICPDFTextFindingResult.framesForHighlight(in:)(v4);

  sub_20BFCEE58(0, (unint64_t *)&qword_2676BC4D0);
  NSComparisonResult v6 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)scrollToVisibleInTextView:(id)a3
{
  id v5 = a3;
  NSComparisonResult v6 = self;
  ICPDFTextFindingResult.scrollToVisible(in:)((ICTextView_optional *)a3);
}

+ (void)resultsInAttachment:(ICAttachment *)a3 matchingString:(NSString *)a4 textView:(ICTextView *)a5 ignoreCase:(BOOL)a6 wholeWords:(BOOL)a7 startsWith:(BOOL)a8 usePattern:(BOOL)a9 completion:(id)a10
{
  HIDWORD(v27) = a8;
  v28 = a3;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD811C0);
  MEMORY[0x270FA5388](v16 - 8);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = a5;
  *(unsigned char *)(v20 + 40) = a6;
  *(unsigned char *)(v20 + 41) = a7;
  *(unsigned char *)(v20 + 42) = BYTE4(v27);
  *(unsigned char *)(v20 + 43) = a9;
  *(void *)(v20 + 48) = v19;
  *(void *)(v20 + 56) = a1;
  uint64_t v21 = sub_20C162DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_2676BC408;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_2676BC4A0;
  v23[5] = v22;
  v24 = v28;
  v25 = a4;
  v26 = a5;
  sub_20C014C5C((uint64_t)v18, (uint64_t)&unk_2676BC410, (uint64_t)v23);
  swift_release();
}

- (_TtC11NotesEditor22ICPDFTextFindingResult)init
{
  result = (_TtC11NotesEditor22ICPDFTextFindingResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end