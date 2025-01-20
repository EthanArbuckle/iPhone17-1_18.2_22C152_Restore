@interface AssertionServiceClient
- (BOOL)invalidate:(id)a3 error:(id *)a4;
- (_TtC11SessionCore22AssertionServiceClient)init;
- (id)acquire:(id)a3 error:(id *)a4;
- (id)reconnect:(id)a3 error:(id *)a4;
- (void)didInvalidate:(id)a3;
@end

@implementation AssertionServiceClient

- (_TtC11SessionCore22AssertionServiceClient)init
{
  result = (_TtC11SessionCore22AssertionServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11SessionCore22AssertionServiceClient_assertionManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (id)acquire:(id)a3 error:(id *)a4
{
  return sub_1C7D23590(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_1C7D22EC4);
}

- (BOOL)invalidate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_1C7D30980();
  unint64_t v9 = v8;

  sub_1C7D2311C();
  sub_1C7C028F8(v7, v9);
  return 1;
}

- (id)reconnect:(id)a3 error:(id *)a4
{
  return sub_1C7D23590(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_1C7D23344);
}

- (void)didInvalidate:(id)a3
{
  uint64_t v5 = sub_1C7D31B90();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  uint64_t v11 = sub_1C7D30980();
  unint64_t v13 = v12;

  v14 = (void *)sub_1C7D30970();
  sub_1C7D31B80();

  sub_1C7D22A7C((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1C7C028F8(v11, v13);
}

@end