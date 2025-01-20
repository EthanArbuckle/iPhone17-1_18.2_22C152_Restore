@interface TransactionList
- (_TtC9PassKitUI15TransactionList)init;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)transactionsChanged:(id)a3;
@end

@implementation TransactionList

- (void)transactionsChanged:(id)a3
{
  sub_19F48BAC4(0, (unint64_t *)&qword_1E94AD0F0);
  uint64_t v4 = sub_1A03B4C58();
  v5 = self;
  sub_19F9764F0(v4);

  swift_bridgeObjectRelease();
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  uint64_t v5 = *(_WORD *)&a4 & 0x101;
  swift_unknownObjectRetain();
  v6 = self;
  sub_19F9785C4(v5);
  swift_unknownObjectRelease();
}

- (_TtC9PassKitUI15TransactionList)init
{
  result = (_TtC9PassKitUI15TransactionList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI15TransactionList__rows;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AD0F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI15TransactionList__yearlyGroups;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AD100);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease();

  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI15TransactionList__filter;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AD108);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end