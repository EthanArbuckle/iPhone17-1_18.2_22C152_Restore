@interface REMCDAccountV2023MinorEMigratingToZREMCDBASELIST
- (REMCDAccountV2023MinorEMigratingToZREMCDBASELIST)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (id)accountTypeHost;
@end

@implementation REMCDAccountV2023MinorEMigratingToZREMCDBASELIST

- (id)accountTypeHost
{
  v2 = self;
  id v3 = [objc_allocWithZone((Class)REMAccountTypeHost) initWithType:-[REMCDAccountV2023MinorEMigratingToZREMCDBASELIST type](v2, "type")];

  return v3;
}

- (REMCDAccountV2023MinorEMigratingToZREMCDBASELIST)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  return (REMCDAccountV2023MinorEMigratingToZREMCDBASELIST *)sub_1004367B8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, (uint64_t (*)(uint64_t))type metadata accessor for REMCDAccountV2023MinorEMigratingToZREMCDBASELIST);
}

@end