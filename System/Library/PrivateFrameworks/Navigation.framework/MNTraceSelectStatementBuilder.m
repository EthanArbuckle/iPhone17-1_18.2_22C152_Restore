@interface MNTraceSelectStatementBuilder
- (_TtC10Navigation29MNTraceSelectStatementBuilder)init;
- (_TtC10Navigation29MNTraceSelectStatementBuilder)initWithTrace:(id)a3 tableName:(id)a4;
- (id)selectStatement;
- (id)selectStatementWithError:(id *)a3;
- (void)addColumn:(id)a3;
- (void)addColumns:(id)a3;
@end

@implementation MNTraceSelectStatementBuilder

- (_TtC10Navigation29MNTraceSelectStatementBuilder)initWithTrace:(id)a3 tableName:(id)a4
{
  uint64_t v6 = sub_1B5531EE0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__columns) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__trace) = (Class)a3;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__tableName);
  uint64_t *v7 = v6;
  v7[1] = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MNTraceSelectStatementBuilder();
  id v9 = a3;
  return [(MNTraceSelectStatementBuilder *)&v11 init];
}

- (void)addColumn:(id)a3
{
  uint64_t v4 = sub_1B5531EE0();
  uint64_t v6 = v5;
  v7 = (void **)((char *)self + OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__columns);
  swift_beginAccess();
  uint64_t v8 = *v7;
  id v9 = self;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = sub_1B5437AF4(0, v8[2] + 1, 1, v8);
    uint64_t *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    uint64_t v8 = sub_1B5437AF4((void *)(v11 > 1), v12 + 1, 1, v8);
    uint64_t *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = v4;
  v13[5] = v6;
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)addColumns:(id)a3
{
  sub_1B5531F60();
  swift_beginAccess();
  uint64_t v4 = self;
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_1B5437150(v5);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (id)selectStatementWithError:(id *)a3
{
  v3 = self;
  uint64_t v4 = (void *)sub_1B5437330();

  return v4;
}

- (id)selectStatement
{
  v2 = self;
  v3 = (void *)sub_1B5437688();

  return v3;
}

- (_TtC10Navigation29MNTraceSelectStatementBuilder)init
{
  result = (_TtC10Navigation29MNTraceSelectStatementBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end