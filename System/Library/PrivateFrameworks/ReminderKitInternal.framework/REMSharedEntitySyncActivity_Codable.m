@interface REMSharedEntitySyncActivity_Codable
+ (BOOL)supportsSecureCoding;
- (REMSharedEntitySyncActivity_Codable)initWithAccountIdentifier:(id)a3 activityDate:(id)a4 activityType:(int64_t)a5 authorUserRecordIDString:(id)a6 ckParentCloudObjectEntityName:(id)a7 ckParentCloudObjectIdentifier:(id)a8 ckIdentifier:(id)a9 sharedEntityName:(id)a10 uuidForChangeTracking:(id)a11;
@end

@implementation REMSharedEntitySyncActivity_Codable

- (REMSharedEntitySyncActivity_Codable)initWithAccountIdentifier:(id)a3 activityDate:(id)a4 activityType:(int64_t)a5 authorUserRecordIDString:(id)a6 ckParentCloudObjectEntityName:(id)a7 ckParentCloudObjectIdentifier:(id)a8 ckIdentifier:(id)a9 sharedEntityName:(id)a10 uuidForChangeTracking:(id)a11
{
  uint64_t v43 = a5;
  v44 = self;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB704C40);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1A7571B60();
  MEMORY[0x1F4188790](v16 - 8);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v41 = v20;
  uint64_t v42 = v19;
  sub_1A7571B20();
  uint64_t v21 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v39 = v22;
  uint64_t v40 = v21;
  if (a7)
  {
    uint64_t v38 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    uint64_t v24 = v23;
    id v25 = a11;
    if (a8)
    {
LABEL_3:
      a8 = (id)_sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
      uint64_t v27 = v26;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v24 = 0;
    id v25 = a11;
    if (a8) {
      goto LABEL_3;
    }
  }
  uint64_t v27 = 0;
LABEL_6:
  uint64_t v28 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v30 = v29;
  uint64_t v31 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  uint64_t v33 = v32;
  if (v25)
  {
    sub_1A7571BB0();
    uint64_t v34 = sub_1A7571BC0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v15, 0, 1, v34);
  }
  else
  {
    uint64_t v35 = sub_1A7571BC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v15, 1, 1, v35);
  }
  return (REMSharedEntitySyncActivity_Codable *)REMSharedEntitySyncActivity_Codable.init(accountIdentifier:activityDate:activityType:authorUserRecordIDString:ckParentCloudObjectEntityName:ckParentCloudObjectIdentifier:ckIdentifier:sharedEntityName:uuidForChangeTracking:)(v42, v41, (uint64_t)v18, v43, v40, v39, v38, v24, (uint64_t)a8, v27, v28, v30, v31, v33, (uint64_t)v15);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end