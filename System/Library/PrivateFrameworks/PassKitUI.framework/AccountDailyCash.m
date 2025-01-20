@interface AccountDailyCash
- (_TtC9PassKitUI16AccountDailyCash)init;
- (void)transactionsChanged:(id)a3;
@end

@implementation AccountDailyCash

- (void)transactionsChanged:(id)a3
{
  if (a3)
  {
    sub_19F48BAC4(0, (unint64_t *)&qword_1E94AD0F0);
    sub_1A03B4C58();
  }
  v4 = self;
  sub_19F9A05D0();

  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI16AccountDailyCash)init
{
  result = (_TtC9PassKitUI16AccountDailyCash *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI16AccountDailyCash__amount;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AD890);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_19F5635F0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI16AccountDailyCash_date);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI16AccountDailyCash_account);
}

@end