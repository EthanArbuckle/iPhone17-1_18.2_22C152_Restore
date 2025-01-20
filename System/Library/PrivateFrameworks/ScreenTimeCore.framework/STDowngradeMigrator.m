@interface STDowngradeMigrator
- (STDowngradeMigrator)init;
- (void)triggerMigrationWithPersistenceController:(id)a3 andRequestManager:(id)a4 outError:(id *)a5;
@end

@implementation STDowngradeMigrator

- (void)triggerMigrationWithPersistenceController:(id)a3 andRequestManager:(id)a4 outError:(id *)a5
{
  swift_unknownObjectRetain();
  id v9 = a4;
  v10 = self;
  sub_1000CBFA4(a3, v9, a5);
  swift_unknownObjectRelease();
}

- (STDowngradeMigrator)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STDowngradeMigrator_defaultStoreName);
  void *v2 = 0x746C7561666544;
  v2[1] = 0xE700000000000000;
  v3 = (char *)self + OBJC_IVAR___STDowngradeMigrator_restricitonsStoreName;
  strcpy((char *)self + OBJC_IVAR___STDowngradeMigrator_restricitonsStoreName, "restrictions");
  v3[13] = 0;
  *((_WORD *)v3 + 7) = -5120;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STDowngradeMigrator_shareAcrossDevicesStoreName);
  void *v4 = 0xD000000000000012;
  v4[1] = 0x80000001002912D0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STDowngradeMigrator_userSafetyStoreName);
  void *v5 = 0x6566615372657355;
  v5[1] = 0xEF65726F74537974;
  v7.receiver = self;
  v7.super_class = (Class)STDowngradeMigrator;
  return [(STDowngradeMigrator *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end