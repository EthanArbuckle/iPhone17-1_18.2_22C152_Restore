@interface CKKSCloudKitClassDependencies
+ (id)forLiveCloudKit;
- (CKKSCloudKitClassDependencies)initWithFetchRecordZoneChangesOperationClass:(Class)a3 fetchRecordsOperationClass:(Class)a4 queryOperationClass:(Class)a5 modifySubscriptionsOperationClass:(Class)a6 modifyRecordZonesOperationClass:(Class)a7 apsConnectionClass:(Class)a8 nsnotificationCenterClass:(Class)a9 nsdistributednotificationCenterClass:(Class)a10 notifierClass:(Class)a11;
- (Class)apsConnectionClass;
- (Class)fetchRecordZoneChangesOperationClass;
- (Class)fetchRecordsOperationClass;
- (Class)modifyRecordZonesOperationClass;
- (Class)modifySubscriptionsOperationClass;
- (Class)notifierClass;
- (Class)nsdistributednotificationCenterClass;
- (Class)nsnotificationCenterClass;
- (Class)queryOperationClass;
@end

@implementation CKKSCloudKitClassDependencies

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifierClass, 0);
  objc_storeStrong((id *)&self->_nsdistributednotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_nsnotificationCenterClass, 0);
  objc_storeStrong((id *)&self->_apsConnectionClass, 0);
  objc_storeStrong((id *)&self->_modifyRecordZonesOperationClass, 0);
  objc_storeStrong((id *)&self->_modifySubscriptionsOperationClass, 0);
  objc_storeStrong((id *)&self->_queryOperationClass, 0);
  objc_storeStrong((id *)&self->_fetchRecordsOperationClass, 0);

  objc_storeStrong((id *)&self->_fetchRecordZoneChangesOperationClass, 0);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 72, 1);
}

- (Class)nsdistributednotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 64, 1);
}

- (Class)nsnotificationCenterClass
{
  return (Class)objc_getProperty(self, a2, 56, 1);
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (Class)modifyRecordZonesOperationClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (Class)modifySubscriptionsOperationClass
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (Class)queryOperationClass
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (Class)fetchRecordsOperationClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (CKKSCloudKitClassDependencies)initWithFetchRecordZoneChangesOperationClass:(Class)a3 fetchRecordsOperationClass:(Class)a4 queryOperationClass:(Class)a5 modifySubscriptionsOperationClass:(Class)a6 modifyRecordZonesOperationClass:(Class)a7 apsConnectionClass:(Class)a8 nsnotificationCenterClass:(Class)a9 nsdistributednotificationCenterClass:(Class)a10 notifierClass:(Class)a11
{
  v20.receiver = self;
  v20.super_class = (Class)CKKSCloudKitClassDependencies;
  v17 = [(CKKSCloudKitClassDependencies *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fetchRecordZoneChangesOperationClass, a3);
    objc_storeStrong((id *)&v18->_fetchRecordsOperationClass, a4);
    objc_storeStrong((id *)&v18->_queryOperationClass, a5);
    objc_storeStrong((id *)&v18->_modifySubscriptionsOperationClass, a6);
    objc_storeStrong((id *)&v18->_modifyRecordZonesOperationClass, a7);
    objc_storeStrong((id *)&v18->_apsConnectionClass, a8);
    objc_storeStrong((id *)&v18->_nsnotificationCenterClass, a9);
    objc_storeStrong((id *)&v18->_nsdistributednotificationCenterClass, a10);
    objc_storeStrong((id *)&v18->_notifierClass, a11);
  }
  return v18;
}

+ (id)forLiveCloudKit
{
  v2 = [CKKSCloudKitClassDependencies alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = [(CKKSCloudKitClassDependencies *)v2 initWithFetchRecordZoneChangesOperationClass:v3 fetchRecordsOperationClass:v4 queryOperationClass:v5 modifySubscriptionsOperationClass:v6 modifyRecordZonesOperationClass:v7 apsConnectionClass:v8 nsnotificationCenterClass:v9 nsdistributednotificationCenterClass:v10 notifierClass:objc_opt_class()];

  return v11;
}

@end