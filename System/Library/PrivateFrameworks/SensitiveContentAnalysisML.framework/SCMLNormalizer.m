@interface SCMLNormalizer
+ (id)normalizeText:(id)a3 locale:(id)a4 lite:(BOOL)a5 error:(id *)a6;
+ (id)trimmedText:(id)a3;
- (_TtC26SensitiveContentAnalysisML14SCMLNormalizer)init;
@end

@implementation SCMLNormalizer

+ (id)normalizeText:(id)a3 locale:(id)a4 lite:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v7 = sub_25BFEFDE0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25BFF0380();
  uint64_t v13 = v12;
  sub_25BFEFDD0();
  if (v6) {
    sub_25BF89CF0(v11, v13, (unint64_t)v10);
  }
  else {
    sub_25BF8A22C(v11, v13, (unint64_t)v10);
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  v14 = (void *)sub_25BFF0370();
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)trimmedText:(id)a3
{
  uint64_t v3 = sub_25BFEFD50();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  v10 = (char *)v17 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v17 - v11;
  v17[0] = sub_25BFF0380();
  v17[1] = v13;
  sub_25BFEFD30();
  sub_25BFEFD20();
  sub_25BFEFD40();
  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v7, v3);
  v14(v10, v3);
  sub_25BF8178C();
  sub_25BFF0660();
  v14(v12, v3);
  swift_bridgeObjectRelease();
  v15 = (void *)sub_25BFF0370();
  swift_bridgeObjectRelease();

  return v15;
}

- (_TtC26SensitiveContentAnalysisML14SCMLNormalizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SCMLNormalizer();
  return [(SCMLNormalizer *)&v3 init];
}

@end