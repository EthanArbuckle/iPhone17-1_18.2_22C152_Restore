@interface AccountBalanceHistory
- (_TtC9PassKitUI21AccountBalanceHistory)init;
- (void)accountChanged:(id)a3;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
@end

@implementation AccountBalanceHistory

- (void)accountChanged:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_19F488C60(a3);
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  __int16 v5 = *(_WORD *)&a4 & 0x101;
  swift_unknownObjectRetain();
  v6 = self;
  sub_19F48BB78(v5);
  swift_unknownObjectRelease();
}

- (_TtC9PassKitUI21AccountBalanceHistory)init
{
  result = (_TtC9PassKitUI21AccountBalanceHistory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AccountBalanceHistory__balances;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E949EA00);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __int16 v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AccountBalanceHistory__dateRange;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E949EA08);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI21AccountBalanceHistory_account);
}

@end