@interface GKCDIDSInfoList
+ (id)_gkPrimaryListWithContext:(id)a3;
+ (id)fetchRequest;
- (void)_gkReset;
@end

@implementation GKCDIDSInfoList

+ (id)_gkPrimaryListWithContext:(id)a3
{
  id v4 = a3;
  v5 = +[GKCDIDSInfoList _gkObjectsMatchingPredicate:0 withContext:v4];
  v6 = [v5 firstObject];

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v8 = [GKCDIDSInfoList alloc];
    v9 = [a1 entity];
    v7 = [(GKCDIDSInfoList *)v8 initWithEntity:v9 insertIntoManagedObjectContext:v4];
  }

  return v7;
}

- (void)_gkReset
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100136E0C(v4);
  }
  [(GKCDIDSInfoList *)self setUpdateIntervalStartTimeStamp:0];
  [(GKCDIDSInfoList *)self setUpdateIntervalHandlesCount:0];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"IDSInfoList"];
}

@end