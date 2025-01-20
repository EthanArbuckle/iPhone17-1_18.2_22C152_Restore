@interface PresentationObservationServiceClient
- (BOOL)subscribeToActivityPresentationMatchingPredicate:(id)a3 error:(id *)a4;
- (_TtC11SessionCore36PresentationObservationServiceClient)init;
@end

@implementation PresentationObservationServiceClient

- (_TtC11SessionCore36PresentationObservationServiceClient)init
{
  result = (_TtC11SessionCore36PresentationObservationServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore36PresentationObservationServiceClient_connection));
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C7C04290((uint64_t)self + OBJC_IVAR____TtC11SessionCore36PresentationObservationServiceClient__lock_predicate, (uint64_t *)&unk_1EA4FF808);
}

- (BOOL)subscribeToActivityPresentationMatchingPredicate:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1C7D311F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  uint64_t v12 = sub_1C7D30980();
  unint64_t v14 = v13;

  v15 = (void *)sub_1C7D30970();
  sub_1C7C667A8(&qword_1EA4FF800, MEMORY[0x1E4F17E60]);
  sub_1C7D31860();

  sub_1C7C66318((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C7C028F8(v12, v14);
  return 1;
}

@end