@interface PKIdentityDataReleaseTransactionConfiguration
- (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration)init;
- (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration)initWithDocumentType:(id)a3 elements:(id)a4 transactionSource:(unint64_t)a5 passName:(id)a6;
@end

@implementation PKIdentityDataReleaseTransactionConfiguration

- (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration)initWithDocumentType:(id)a3 elements:(id)a4 transactionSource:(unint64_t)a5 passName:(id)a6
{
  uint64_t v7 = sub_1A03B4988();
  uint64_t v9 = v8;
  sub_19FAE87CC();
  sub_19FC8AC8C(&qword_1E94B14E8, (void (*)(uint64_t))sub_19FAE87CC);
  uint64_t v10 = sub_1A03B4F08();
  uint64_t v11 = sub_1A03B4988();
  return (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *)PKIdentityDataReleaseTransactionConfiguration.init(documentType:elements:transactionSource:passName:)(v7, v9, v10, a5, v11, v12);
}

- (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration)init
{
  result = (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration_elementCategoryGroups;
  uint64_t v4 = sub_1A03B1218();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration_presentmentSource;
  uint64_t v6 = sub_1A03B11E8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
}

@end