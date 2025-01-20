@interface PXStoryDefaultAutoCurationProducer
- (PXStoryDefaultAutoCurationProducer)init;
- (PXStoryDefaultAutoCurationProducer)initWithCurationContext:(id)a3;
- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5;
- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6;
@end

@implementation PXStoryDefaultAutoCurationProducer

- (PXStoryDefaultAutoCurationProducer)initWithCurationContext:(id)a3
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1AB23BC4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  return (PXStoryDefaultAutoCurationProducer *)StoryDefaultAutoCurationProducer.init(curationContext:)((uint64_t)v4);
}

- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6
{
  sub_1A9CD7A64();
  MEMORY[0x1F4188790](v10 - 8, v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  v16 = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v17 = self;
  id v18 = objc_msgSend(v16, sel_discreteProgressWithTotalUnitCount_, 0);
  uint64_t v19 = OBJC_IVAR___PXStoryDefaultAutoCurationProducer_curationContext;
  uint64_t v20 = sub_1AB23AD7C();
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  long long v25 = *(_OWORD *)((char *)&v17->super.isa + v19);
  v21(v13, 1, 1, v20);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = 0;
  *(void *)(v22 + 24) = 0;
  *(void *)(v22 + 32) = v18;
  *(void *)(v22 + 40) = a4;
  *(void *)(v22 + 48) = a5;
  *(_OWORD *)(v22 + 56) = v25;
  *(void *)(v22 + 72) = sub_1AA7A5188;
  *(void *)(v22 + 80) = v15;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v23 = v18;
  swift_unknownObjectRetain();
  sub_1AB22F8DC();
  sub_1A9BF49C0((uint64_t)v13, (uint64_t)&unk_1E9839DC8, v22);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v23;
}

- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5
{
  int64_t var0 = a4->var0;
  int64_t v9 = a4->var1.var0.var0;
  int64_t var3 = a4->var1.var0.var3;
  int64_t v11 = a4->var1.var1.var0;
  int64_t v12 = a4->var1.var2.var0;
  int64_t v13 = a4->var1.var2.var3;
  int64_t v31 = a4->var1.var1.var3;
  int64_t v32 = v13;
  sub_1A9CD7A64();
  MEMORY[0x1F4188790](v14 - 8, v15);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)&a4->var1.var0.var1;
  uint64_t v19 = *(void *)&a4->var1.var1.var1;
  uint64_t v20 = *(void *)&a4->var1.var2.var1;
  v21 = _Block_copy(a5);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v21;
  id v23 = self;
  v24 = self;
  id v25 = objc_msgSend(v23, sel_discreteProgressWithTotalUnitCount_, 0);
  uint64_t v26 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v17, 1, 1, v26);
  v27 = (void *)swift_allocObject();
  v27[2] = 0;
  v27[3] = 0;
  v27[4] = v24;
  v27[5] = var0;
  v27[6] = v9;
  v27[7] = v18;
  v27[8] = var3;
  v27[9] = v11;
  v27[10] = v19;
  v27[11] = v31;
  v27[12] = v12;
  v27[13] = v20;
  v27[14] = v32;
  v27[15] = v25;
  v27[16] = sub_1A9FDB6A4;
  v27[17] = v22;
  v28 = v24;
  id v29 = v25;
  sub_1AB22F8DC();
  sub_1A9BF49C0((uint64_t)v17, (uint64_t)&unk_1E9839DC0, (uint64_t)v27);
  swift_release();
  swift_release();

  return v29;
}

- (PXStoryDefaultAutoCurationProducer)init
{
  result = (PXStoryDefaultAutoCurationProducer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end