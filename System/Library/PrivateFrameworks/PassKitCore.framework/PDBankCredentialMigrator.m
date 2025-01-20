@interface PDBankCredentialMigrator
- (PDBankCredentialMigrator)init;
- (PDBankCredentialMigrator)initWithAccountManager:(id)a3;
- (void)accountAdded:(id)a3;
- (void)migrateIfNecessary;
@end

@implementation PDBankCredentialMigrator

- (PDBankCredentialMigrator)initWithAccountManager:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PDBankCredentialMigrator_isMigrating) = 0;
  uint64_t v5 = OBJC_IVAR___PDBankCredentialMigrator_importer;
  type metadata accessor for FinanceStore();
  v6 = (objc_class *)a3;
  v7 = self;
  static FinanceStore.shared.getter();
  id v8 = objc_allocWithZone((Class)type metadata accessor for WalletBankCredentialImporter());
  *(Class *)((char *)&self->super.isa + v5) = (Class)WalletBankCredentialImporter.init(financeStore:)();
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___PDBankCredentialMigrator_accountManager) = v6;
  v9 = v6;

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for BankCredentialMigrator();
  v10 = [(PDBankCredentialMigrator *)&v12 init];

  return v10;
}

- (void)migrateIfNecessary
{
  v2 = self;
  id v3 = PDUtilityQueue();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  v7[4] = sub_10050F910;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1004C9E64;
  v7[3] = &unk_100758F18;
  uint64_t v5 = _Block_copy(v7);
  v6 = v2;
  swift_release();
  sub_10050E634(v3, v5);
  _Block_release(v5);
}

- (void)accountAdded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = PDUtilityQueue();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v4;
  v11[4] = sub_10050E614;
  v11[5] = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1004C9E64;
  v11[3] = &unk_100758E78;
  id v8 = _Block_copy(v11);
  id v9 = v4;
  v10 = v5;
  swift_release();
  sub_10050E634(v6, v8);
  _Block_release(v8);
}

- (PDBankCredentialMigrator)init
{
  result = (PDBankCredentialMigrator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDBankCredentialMigrator_accountManager);
}

@end