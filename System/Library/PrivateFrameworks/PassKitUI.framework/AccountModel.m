@interface AccountModel
- (_TtC9PassKitUI12AccountModel)init;
- (void)accountChanged:(void *)a3;
- (void)dealloc;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
@end

@implementation AccountModel

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI12AccountModel_accountService);
  if (v4) {
    objc_msgSend(v4, sel_unregisterObserver_, self);
  }
  else {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(AccountModel *)&v6 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__account;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A2890);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__savingsDetails;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A2898);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__savingsSummary;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A28A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__appleBalanceDetails;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A28A8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__appleBalanceSummary;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A28B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__observableBalance;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A28B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__isNewAccount;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  v17 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);
  v17(v15, v16);
  v17((char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__expectingAccountUpdate, v16);

  v18 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI12AccountModel_pendingAccount);
}

- (void)accountChanged:(void *)a3
{
  if (a3)
  {
    id v5 = a1;
    id v4 = a3;
    sub_19F60F4DC(v4);
  }
  else
  {
    __break(1u);
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  __int16 v5 = *(_WORD *)&a4 & 0x101;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_19F610D54(v5);
  swift_unknownObjectRelease();
}

- (_TtC9PassKitUI12AccountModel)init
{
  result = (_TtC9PassKitUI12AccountModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end