@interface AccountDebugModel
- (_TtC9PassKitUI17AccountDebugModel)init;
@end

@implementation AccountDebugModel

- (_TtC9PassKitUI17AccountDebugModel)init
{
  result = (_TtC9PassKitUI17AccountDebugModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__cardAccount;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B6C30);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__inProgress;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__status;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AC928);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__transactionGroups;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E94B16A0);
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v12 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__runningBalance;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A8B60);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__statements;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B16B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__ckTransactions;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B16B8);
  v18 = *(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8);
  v18(v16, v17);
  v19 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__ckRewards;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B16C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  v18((char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__cardTransactions, v17);
  v11((char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__invalidBalanceIncrements, v10);

  v21 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel_accountService);
}

@end