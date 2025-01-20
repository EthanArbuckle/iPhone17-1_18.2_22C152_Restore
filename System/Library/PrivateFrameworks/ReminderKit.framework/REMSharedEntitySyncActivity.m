@interface REMSharedEntitySyncActivity
+ (BOOL)supportsSecureCoding;
- (NSDate)activityDate;
- (NSString)accountIdentifier;
- (NSString)authorUserRecordIDString;
- (NSString)ckIdentifier;
- (NSString)ckParentCloudObjectEntityName;
- (NSString)ckParentCloudObjectIdentifier;
- (NSString)sharedEntityName;
- (NSUUID)uuidForChangeTracking;
- (REMSharedEntitySyncActivity)initWithAccountIdentifier:(id)a3 activityDate:(id)a4 activityType:(int64_t)a5 authorUserRecordIDString:(id)a6 ckParentCloudObjectEntityName:(id)a7 ckParentCloudObjectIdentifier:(id)a8 ckIdentifier:(id)a9 sharedEntityName:(id)a10 uuidForChangeTracking:(id)a11;
- (REMSharedEntitySyncActivity)initWithCoder:(id)a3;
- (id)activityTypeDescription;
- (id)description;
- (int64_t)activityType;
- (void)activityTypeDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSharedEntitySyncActivity

- (REMSharedEntitySyncActivity)initWithAccountIdentifier:(id)a3 activityDate:(id)a4 activityType:(int64_t)a5 authorUserRecordIDString:(id)a6 ckParentCloudObjectEntityName:(id)a7 ckParentCloudObjectIdentifier:(id)a8 ckIdentifier:(id)a9 sharedEntityName:(id)a10 uuidForChangeTracking:(id)a11
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)REMSharedEntitySyncActivity;
  v18 = [(REMSharedEntitySyncActivity *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountIdentifier, a3);
    objc_storeStrong((id *)&v19->_activityDate, a4);
    v19->_activityType = a5;
    objc_storeStrong((id *)&v19->_authorUserRecordIDString, a6);
    objc_storeStrong((id *)&v19->_ckParentCloudObjectEntityName, a7);
    objc_storeStrong((id *)&v19->_ckParentCloudObjectIdentifier, a8);
    objc_storeStrong((id *)&v19->_ckIdentifier, a9);
    objc_storeStrong((id *)&v19->_sharedEntityName, a10);
    objc_storeStrong((id *)&v19->_uuidForChangeTracking, a11);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSharedEntitySyncActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)REMSharedEntitySyncActivity;
  v5 = [(REMSharedEntitySyncActivity *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityDate"];
    activityDate = v5->_activityDate;
    v5->_activityDate = (NSDate *)v8;

    v5->_activityType = [v4 decodeIntegerForKey:@"activityType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorUserRecordIDString"];
    authorUserRecordIDString = v5->_authorUserRecordIDString;
    v5->_authorUserRecordIDString = (NSString *)v10;

    if ([v4 containsValueForKey:@"ckParentCloudObjectEntityName"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckParentCloudObjectEntityName"];
      ckParentCloudObjectEntityName = v5->_ckParentCloudObjectEntityName;
      v5->_ckParentCloudObjectEntityName = (NSString *)v12;
    }
    if ([v4 containsValueForKey:@"ckParentCloudObjectIdentifier"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckParentCloudObjectIdentifier"];
      ckParentCloudObjectIdentifier = v5->_ckParentCloudObjectIdentifier;
      v5->_ckParentCloudObjectIdentifier = (NSString *)v14;
    }
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckIdentifier"];
    ckIdentifier = v5->_ckIdentifier;
    v5->_ckIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedEntityName"];
    sharedEntityName = v5->_sharedEntityName;
    v5->_sharedEntityName = (NSString *)v18;

    if ([v4 containsValueForKey:@"uuidForChangeTracking"])
    {
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuidForChangeTracking"];
      uuidForChangeTracking = v5->_uuidForChangeTracking;
      v5->_uuidForChangeTracking = (NSUUID *)v20;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = [(REMSharedEntitySyncActivity *)self accountIdentifier];
  [v15 encodeObject:v4 forKey:@"accountIdentifier"];

  v5 = [(REMSharedEntitySyncActivity *)self activityDate];
  [v15 encodeObject:v5 forKey:@"activityDate"];

  objc_msgSend(v15, "encodeInteger:forKey:", -[REMSharedEntitySyncActivity activityType](self, "activityType"), @"activityType");
  uint64_t v6 = [(REMSharedEntitySyncActivity *)self authorUserRecordIDString];
  [v15 encodeObject:v6 forKey:@"authorUserRecordIDString"];

  v7 = [(REMSharedEntitySyncActivity *)self ckParentCloudObjectEntityName];

  if (v7)
  {
    uint64_t v8 = [(REMSharedEntitySyncActivity *)self ckParentCloudObjectEntityName];
    [v15 encodeObject:v8 forKey:@"ckParentCloudObjectEntityName"];
  }
  v9 = [(REMSharedEntitySyncActivity *)self ckParentCloudObjectIdentifier];

  if (v9)
  {
    uint64_t v10 = [(REMSharedEntitySyncActivity *)self ckParentCloudObjectIdentifier];
    [v15 encodeObject:v10 forKey:@"ckParentCloudObjectIdentifier"];
  }
  v11 = [(REMSharedEntitySyncActivity *)self ckIdentifier];
  [v15 encodeObject:v11 forKey:@"ckIdentifier"];

  uint64_t v12 = [(REMSharedEntitySyncActivity *)self sharedEntityName];
  [v15 encodeObject:v12 forKey:@"sharedEntityName"];

  v13 = [(REMSharedEntitySyncActivity *)self uuidForChangeTracking];

  if (v13)
  {
    uint64_t v14 = [(REMSharedEntitySyncActivity *)self uuidForChangeTracking];
    [v15 encodeObject:v14 forKey:@"uuidForChangeTracking"];
  }
}

- (id)description
{
  id v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v3 = [(REMSharedEntitySyncActivity *)self accountIdentifier];
  id v4 = [(REMSharedEntitySyncActivity *)self activityDate];
  v5 = [(REMSharedEntitySyncActivity *)self activityTypeDescription];
  uint64_t v6 = [(REMSharedEntitySyncActivity *)self authorUserRecordIDString];
  v7 = [(REMSharedEntitySyncActivity *)self ckParentCloudObjectEntityName];
  uint64_t v8 = [(REMSharedEntitySyncActivity *)self ckParentCloudObjectIdentifier];
  v9 = [(REMSharedEntitySyncActivity *)self ckIdentifier];
  uint64_t v10 = [(REMSharedEntitySyncActivity *)self sharedEntityName];
  v11 = [(REMSharedEntitySyncActivity *)self uuidForChangeTracking];
  uint64_t v12 = [v15 stringWithFormat:@"<%@: %p accountIdentifier: %@, activityDate: %@, activityType: %@, authorUserRecordIDString: %@, ckParentCloudObjectEntityName: %@, ckParentCloudObjectIdentifier: %@, ckIdentifier: %@, sharedEntityName: %@, uuidForChangeTracking: %@", v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)activityTypeDescription
{
  unint64_t v3 = [(REMSharedEntitySyncActivity *)self activityType];
  if (v3 < 6) {
    return off_1E61DCDC0[v3];
  }
  v5 = os_log_create("com.apple.reminderkit", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    [(REMSharedEntitySyncActivity *)self activityTypeDescription];
  }

  return @"ILL-DEFINED";
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDate)activityDate
{
  return self->_activityDate;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (NSString)authorUserRecordIDString
{
  return self->_authorUserRecordIDString;
}

- (NSString)ckParentCloudObjectEntityName
{
  return self->_ckParentCloudObjectEntityName;
}

- (NSString)ckParentCloudObjectIdentifier
{
  return self->_ckParentCloudObjectIdentifier;
}

- (NSString)ckIdentifier
{
  return self->_ckIdentifier;
}

- (NSString)sharedEntityName
{
  return self->_sharedEntityName;
}

- (NSUUID)uuidForChangeTracking
{
  return self->_uuidForChangeTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidForChangeTracking, 0);
  objc_storeStrong((id *)&self->_sharedEntityName, 0);
  objc_storeStrong((id *)&self->_ckIdentifier, 0);
  objc_storeStrong((id *)&self->_ckParentCloudObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_ckParentCloudObjectEntityName, 0);
  objc_storeStrong((id *)&self->_authorUserRecordIDString, 0);
  objc_storeStrong((id *)&self->_activityDate, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (void)activityTypeDescription
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 activityType];
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Attempted to describe invalid REMSharedEntitySyncActivityType with value %ld", (uint8_t *)&v3, 0xCu);
}

@end