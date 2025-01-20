@interface TransactionsModel
- (_TtC9PassKitUI17TransactionsModel)init;
- (void)accountDidUpdate;
- (void)dealloc;
- (void)passSettingsDidChangeWithNotification:(id)a3;
- (void)transactionsChanged:(id)a3;
@end

@implementation TransactionsModel

- (void)dealloc
{
  v2 = self;
  TransactionsModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel_calendar;
  uint64_t v4 = sub_1A03AF398();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__transactions;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B6C18);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__yearlyGroups;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E94B6C20);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__monthlyGroups, v8);
  v10 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__notificationServiceUpdatesEnabled;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__account;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B6C30);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__appleCardDetailInfo;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B6C38);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__transactionSourceCollection;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B6C40);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);

  swift_bridgeObjectRelease();
}

- (void)transactionsChanged:(id)a3
{
  if (a3)
  {
    sub_19F48BAC4(0, (unint64_t *)&qword_1E94AD0F0);
    uint64_t v4 = (void *)sub_1A03B4C58();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  v7.value._rawValue = v4;
  TransactionsModel.transactionsChanged(_:)(v7);

  swift_bridgeObjectRelease();
}

- (void)accountDidUpdate
{
  v2 = self;
  sub_19FCB12D8();
}

- (void)passSettingsDidChangeWithNotification:(id)a3
{
  uint64_t v4 = sub_1A03AE798();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AE778();
  v9 = self;
  sub_19FCB17CC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC9PassKitUI17TransactionsModel)init
{
  result = (_TtC9PassKitUI17TransactionsModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end