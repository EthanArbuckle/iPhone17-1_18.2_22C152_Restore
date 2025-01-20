@interface QoSObservationServiceClient
- (BOOL)subscribeToActivityQoSMatchingPredicate:(id)a3 error:(id *)a4;
- (_TtC11SessionCore27QoSObservationServiceClient)init;
@end

@implementation QoSObservationServiceClient

- (_TtC11SessionCore27QoSObservationServiceClient)init
{
  result = (_TtC11SessionCore27QoSObservationServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C7C04290((uint64_t)self + OBJC_IVAR____TtC11SessionCore27QoSObservationServiceClient__lock_predicate, (uint64_t *)&unk_1EA500468);
}

- (BOOL)subscribeToActivityQoSMatchingPredicate:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1C7D30F30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  uint64_t v12 = sub_1C7D30980();
  unint64_t v14 = v13;

  v15 = (void *)sub_1C7D30970();
  sub_1C7D27500(&qword_1EA500460, MEMORY[0x1E4F17C40]);
  sub_1C7D31860();

  sub_1C7D270F0((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  sub_1C7C028F8(v12, v14);
  return 1;
}

@end