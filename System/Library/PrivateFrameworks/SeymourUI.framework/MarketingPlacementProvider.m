@interface MarketingPlacementProvider
- (_TtC9SeymourUI26MarketingPlacementProvider)init;
- (void)engagement:(AMSEngagement *)a3 didUpdateEngagementRequest:(AMSEngagementRequest *)a4 placement:(NSString *)a5 serviceType:(NSString *)a6 completion:(id)a7;
- (void)engagement:(AMSEngagement *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5;
- (void)engagement:(AMSEngagement *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
@end

@implementation MarketingPlacementProvider

- (_TtC9SeymourUI26MarketingPlacementProvider)init
{
  result = (_TtC9SeymourUI26MarketingPlacementProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MarketingPlacementProvider__fakeUnifiedMessagingPlacements;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF5F7F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF607A0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23A7FF988();
  uint64_t v14 = v13;
  uint64_t v15 = sub_23A7FFDD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  v16[7] = v12;
  v16[8] = v14;
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  id v20 = v17;
  id v21 = v18;
  swift_bridgeObjectRetain();
  sub_239CBF39C((uint64_t)v11, (uint64_t)&unk_268A1F0A8, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleDialogRequest:(AMSDialogRequest *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF607A0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_23A7FFDD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268A1F080;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268A1F088;
  v16[5] = v15;
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_239DFF58C((uint64_t)v11, (uint64_t)&unk_268A1F090, (uint64_t)v16);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 handleEngagementRequest:(AMSEngagementRequest *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF607A0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_23A7FFDD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268A1F058;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268A1F060;
  v16[5] = v15;
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_239DFF58C((uint64_t)v11, (uint64_t)&unk_268A1F068, (uint64_t)v16);
  swift_release();
}

- (void)engagement:(AMSEngagement *)a3 didUpdateEngagementRequest:(AMSEngagementRequest *)a4 placement:(NSString *)a5 serviceType:(NSString *)a6 completion:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF607A0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  id v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_23A7FFDD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_268A1F018;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_268A1F028;
  v20[5] = v19;
  id v21 = a3;
  uint64_t v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_239DFF58C((uint64_t)v15, (uint64_t)&unk_268A1F038, (uint64_t)v20);
  swift_release();
}

@end