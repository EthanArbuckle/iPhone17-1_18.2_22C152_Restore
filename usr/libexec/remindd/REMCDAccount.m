@interface REMCDAccount
+ (BOOL)clearAppleCloudKitTable;
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (REMCDAccount)accountWithCKIdentifier:(id)a3 context:(id)a4;
+ (id)_fetchCloudKitAccountsInContext:(id)a3;
+ (id)_groundTruth_primaryActiveCloudKitAccountInContext:(id)a3;
+ (id)_unitTest_randomPersonIDSalt;
+ (id)accountByCKIdentifierFrom:(id)a3;
+ (id)allCloudKitAccountsInContext:(id)a3;
+ (id)allCloudObjectIDsInContext:(id)a3;
+ (id)allCloudObjectsInContext:(id)a3;
+ (id)cdEntityName;
+ (id)cloudKitAccountWithCKIdentifier:(id)a3 context:(id)a4;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)predicateForCloudKitAccountsWithKeyPathPrefix:(id)a3;
+ (id)recordTypes;
+ (id)unsafeUntilSystemReady_primaryCloudKitAccountInContext:(id)a3 appleAccountUtilities:(id)a4;
+ (unint64_t)countCloudBasedAccountsInContext:(id)a3;
+ (void)clearUserRecord:(id)a3;
+ (void)initialize;
+ (void)writeMigrationStateTo:(id)a3 didChooseToMigrate:(BOOL)a4 didFinishMigration:(BOOL)a5;
- (BOOL)generateAndSavePersonIDSaltIfNeededWithContext:(id)a3;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)mergeMigrationStateFromRecord:(id)a3;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)needsToBeDeletedFromCloud;
- (BOOL)needsToBePushedToCloud;
- (BOOL)postAccountPropertyChangeNotificationWithKey:(id)a3 changedValue:(id)a4;
- (BOOL)shouldBeDeletedFromLocalDatabase;
- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4;
- (BOOL)shouldUseResolutionTokenMapForMergingData;
- (NSData)listIDsMergeableOrdering;
- (NSData)personIDSalt;
- (id)accountTypeHost;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)recordName;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)compare:(id)a3;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (void)cleanUpAfterLocalObjectMerge;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)setListIDsMergeableOrdering:(id)a3;
- (void)setPersonIDSalt:(id)a3;
- (void)sortChildrenObjects;
@end

@implementation REMCDAccount

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)predicateForCloudKitAccountsWithKeyPathPrefix:(id)a3
{
  v3 = @"type IN %@";
  if (a3)
  {
    v3 = +[NSString stringWithFormat:@"%@.%@", a3, @"type IN %@"];
  }
  v4 = cloudKitAccountTypes();
  v5 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v3, v4);

  return v5;
}

- (id)accountTypeHost
{
  accountTypeHost = self->_accountTypeHost;
  if (!accountTypeHost
    || (id v4 = [(REMAccountTypeHost *)accountTypeHost _accountType],
        v4 != (id)(int)[(REMCDAccount *)self type]))
  {
    v5 = (REMAccountTypeHost *)[objc_alloc((Class)REMAccountTypeHost) initWithType:((int)-[REMCDAccount type](self, "type"))];
    v6 = self->_accountTypeHost;
    self->_accountTypeHost = v5;
  }
  v7 = self->_accountTypeHost;

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = REMDynamicCast();

  if (v5 && ([v5 name], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [v5 name];
    v8 = [(REMCDAccount *)self name];
    id v9 = [v8 compare:v7];
  }
  else
  {
    id v9 = 0;
  }

  return (int64_t)v9;
}

+ (id)cdEntityName
{
  return +[REMAccount cdEntityName];
}

- (void)setPersonIDSalt:(id)a3
{
  id v4 = a3;
  [(REMCDObject *)self willChangeValueForKey:@"personIDSalt"];
  [(REMCDObject *)self willChangeValueForKey:@"personIDSalt_v1"];
  [(REMCDAccount *)self setPrimitiveValue:v4 forKey:@"personIDSalt_v1"];

  [(REMCDObject *)self didChangeValueForKey:@"personIDSalt_v1"];

  [(REMCDObject *)self didChangeValueForKey:@"personIDSalt"];
}

- (NSData)personIDSalt
{
  [(REMCDAccount *)self willAccessValueForKey:@"personIDSalt"];
  [(REMCDAccount *)self willAccessValueForKey:@"personIDSalt_v1"];
  v3 = [(REMCDAccount *)self primitiveValueForKey:@"personIDSalt_v1"];
  [(REMCDAccount *)self didAccessValueForKey:@"personIDSalt_v1"];
  [(REMCDAccount *)self didAccessValueForKey:@"personIDSalt"];

  return (NSData *)v3;
}

- (NSData)listIDsMergeableOrdering
{
  [(REMCDAccount *)self willAccessValueForKey:@"listIDsMergeableOrdering"];
  [(REMCDAccount *)self willAccessValueForKey:@"listIDsMergeableOrdering_v2"];
  v3 = [(REMCDAccount *)self primitiveValueForKey:@"listIDsMergeableOrdering_v2"];
  [(REMCDAccount *)self didAccessValueForKey:@"listIDsMergeableOrdering_v2"];
  [(REMCDAccount *)self didAccessValueForKey:@"listIDsMergeableOrdering"];

  return (NSData *)v3;
}

- (void)setListIDsMergeableOrdering:(id)a3
{
  id v4 = a3;
  [(REMCDObject *)self willChangeValueForKey:@"listIDsMergeableOrdering"];
  [(REMCDObject *)self willChangeValueForKey:@"listIDsMergeableOrdering_v2"];
  [(REMCDAccount *)self setPrimitiveValue:v4 forKey:@"listIDsMergeableOrdering_v2"];

  [(REMCDObject *)self didChangeValueForKey:@"listIDsMergeableOrdering_v2"];

  [(REMCDObject *)self didChangeValueForKey:@"listIDsMergeableOrdering"];
}

- (BOOL)postAccountPropertyChangeNotificationWithKey:(id)a3 changedValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    v10 = [(REMCDObject *)self remObjectID];
    if (v10
      && ([(REMCDAccount *)self accountTypeHost],
          v11 = objc_claimAutoreleasedReturnValue(),
          unsigned int v12 = [v11 isValid],
          v11,
          v12))
    {
      uint64_t v13 = (int)[(REMCDAccount *)self type];
      v14 = +[NSMutableDictionary dictionary];
      v15 = +[RDAccountPropertiesNotifier notificationUserInfoPropertyNameKey];
      [v14 setValue:v6 forKey:v15];

      v16 = +[RDAccountPropertiesNotifier notificationUserInfoPropertyValueKey];
      [v14 setValue:v8 forKey:v16];

      v17 = +[RDAccountPropertiesNotifier notificationUserInfoAccountObjectIDKey];
      [v14 setValue:v10 forKey:v17];

      v18 = +[NSNumber numberWithInteger:v13];
      v19 = +[RDAccountPropertiesNotifier notificationUserInfoAccountTypeKey];
      [v14 setValue:v18 forKey:v19];

      v20 = +[NSNotificationCenter defaultCenter];
      [v20 postNotificationName:@"RDStoreControllerREMAccountPropertiesDidUpdateNotification" object:0 userInfo:v14];

      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (void).cxx_destruct
{
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  return 1;
}

- (BOOL)shouldCascadeMarkAsDeleteInto:(id)a3 forRelationship:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 name];
  unsigned int v9 = [v8 isEqualToString:@"lists"];

  if (v9)
  {
    objc_opt_class();
    v10 = REMCheckedDynamicCast();
    v11 = [v10 parentList];
    unsigned __int8 v12 = v11 == 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)REMCDAccount;
    unsigned __int8 v12 = [(REMCDObject *)&v14 shouldCascadeMarkAsDeleteInto:v6 forRelationship:v7];
  }

  return v12;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet set];
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  return kREMSupportedVersionUnset;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDAccount"];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = +[NSMapTable weakToStrongObjectsMapTable];
    uint64_t v3 = qword_100922AC0;
    qword_100922AC0 = v2;
    _objc_release_x1(v2, v3);
  }
}

+ (id)_fetchCloudKitAccountsInContext:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unsigned __int8 v12 = sub_100085364;
  uint64_t v13 = sub_100085374;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008537C;
  v6[3] = &unk_1008ADB18;
  v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

+ (id)allCloudKitAccountsInContext:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100085364;
  v17 = sub_100085374;
  id v18 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100922AC8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100085754;
  v9[3] = &unk_1008AFC98;
  id v5 = v4;
  id v10 = v5;
  uint64_t v11 = &v13;
  id v12 = a1;
  sub_100085754((uint64_t)v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100922AC8);

  id v6 = (void *)v14[5];
  if (!v6) {
    id v6 = &__NSArray0__struct;
  }
  id v7 = v6;
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (unint64_t)countCloudBasedAccountsInContext:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085AD8;
  v6[3] = &unk_1008ADB18;
  v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  unint64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (id)_groundTruth_primaryActiveCloudKitAccountInContext:(id)a3
{
  id v3 = [a1 allCloudKitAccountsInContext:a3];
  unint64_t v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 accountTypeHost:v17];
        if ([v11 isPrimaryCloudKit])
        {
          unsigned __int8 v12 = [v10 inactive];

          if ((v12 & 1) == 0) {
            [v4 addObject:v10];
          }
        }
        else
        {
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  if (![v4 count])
  {
    uint64_t v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100756548();
    }
  }
  id v14 = [v4 firstObject:v17];
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v15 = +[REMLog cloudkit];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10075648C(v4, v14, v15);
    }
  }

  return v14;
}

+ (id)unsafeUntilSystemReady_primaryCloudKitAccountInContext:(id)a3 appleAccountUtilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 allCloudKitAccountsInContext:v6];
  if ([v8 count])
  {
    uint64_t v9 = [v7 unsafeUntilSystemReady_primaryICloudACAccount];
    if (v9)
    {
      uint64_t v17 = 0;
      long long v18 = &v17;
      uint64_t v19 = 0x3032000000;
      long long v20 = sub_100085364;
      v21 = sub_100085374;
      id v22 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100085FC0;
      v13[3] = &unk_1008ADFD0;
      id v14 = v8;
      uint64_t v9 = v9;
      uint64_t v15 = v9;
      v16 = &v17;
      [v6 performBlockAndWait:v13];
      id v10 = (id)v18[5];

      _Block_object_dispose(&v17, 8);
      goto LABEL_10;
    }
    uint64_t v11 = +[REMLog cloudkit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1007565B0();
    }
  }
  else
  {
    uint64_t v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10075657C();
    }
  }
  id v10 = 0;
LABEL_10:

  return v10;
}

+ (REMCDAccount)accountWithCKIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"ckIdentifier == %@", v6];
  uint64_t v9 = [a1 accountsMatchingPredicate:v8 context:v7];

  id v10 = [v9 firstObject];
  uint64_t v11 = v10;
  if (v10 && [v10 inactive])
  {
    unsigned __int8 v12 = +[REMLog cloudkit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-accountWithCKIdentifier: fetched an inactive account {ckIdentifier: %{public}@}", buf, 0xCu);
    }
  }

  return (REMCDAccount *)v11;
}

+ (id)cloudKitAccountWithCKIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100085364;
  long long v20 = sub_100085374;
  id v21 = 0;
  if ([v6 length])
  {
    if (v7)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_100922AC8);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100086738;
      v11[3] = &unk_1008B08E8;
      id v12 = v7;
      id v14 = &v16;
      id v13 = v6;
      id v15 = a1;
      sub_100086738((uint64_t)v11);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100922AC8);

      id v8 = (id)v17[5];
      goto LABEL_9;
    }
    uint64_t v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100756618();
    }
  }
  else
  {
    uint64_t v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007565E4();
    }
  }

  id v8 = 0;
LABEL_9:
  _Block_object_dispose(&v16, 8);

  return v8;
}

+ (BOOL)clearAppleCloudKitTable
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100922AC8);
  BOOL v2 = [(id)qword_100922AC0 count] != 0;
  [(id)qword_100922AC0 removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100922AC8);
  return v2;
}

- (BOOL)generateAndSavePersonIDSaltIfNeededWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(REMCDAccount *)self accountTypeHost];
  unsigned __int8 v6 = [v5 isPrimaryCloudKit];

  if ((v6 & 1) == 0)
  {
    v24 = +[REMLog cloudkit];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_100756858();
    }
  }
  id v7 = [(REMCDAccount *)self personIDSalt];

  if (v7)
  {
    id v8 = +[REMLog cloudkit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100756784(self, v8);
    }
LABEL_5:
    LOBYTE(v9) = 0;
    goto LABEL_17;
  }
  uint64_t v10 = +[PersonIDSaltGenerator randomSalt];
  if (!v10)
  {
    id v8 = +[REMLog cloudkit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10075664C(self, v8);
    }
    goto LABEL_5;
  }
  id v8 = v10;
  [(REMCDAccount *)self setPersonIDSalt:v10];
  uint64_t v11 = [(REMCDObject *)self createResolutionTokenMapIfNecessary];
  id v12 = @"personIDSalt";
  [v11 updateForKey:v12];
  uint64_t v13 = [v11 getTokenForKey:v12];
  [(REMCDObject *)self updateChangeCount];
  id v14 = [(REMCDAccount *)self identifier];
  id v15 = [v14 UUIDString];
  uint64_t v16 = [(REMCDAccount *)self personIDSalt];
  uint64_t v17 = [v16 base64EncodedStringWithOptions:0];
  v25 = (void *)v13;
  unsigned int v9 = [v4 ic_saveWithLogDescription:@"Setting account .personIDSalt {accountID: %@, salt: %@, resolutionToken: %@}", v15, v17, v13];

  if (v9)
  {
    uint64_t v18 = [(REMCDAccount *)self personIDSalt];
    unsigned int v19 = [(REMCDAccount *)self postAccountPropertyChangeNotificationWithKey:@"personIDSalt_v1" changedValue:v18];
    long long v20 = +[REMLog cloudkit];
    id v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [(REMCDObject *)self remObjectID];
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2112;
        v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "generateAndSavePersonIDSaltIfNeeded...: Posted RDStoreControllerREMAccountPropertiesDidUpdate {accountID: %{public}@, salt: %@}", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_1007566D8(self, (uint64_t)v18, v21);
    }
  }
LABEL_17:

  return v9;
}

+ (id)_unitTest_randomPersonIDSalt
{
  return +[PersonIDSaltGenerator randomSalt];
}

+ (id)accountByCKIdentifierFrom:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 ckIdentifier:v15];
        if (v11)
        {
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
        else
        {
          id v12 = +[REMLog cloudkit];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_100756898(v19, v10, &v20, v12);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
}

+ (id)recordTypes
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v2.super.isa;
}

- (id)recordName
{
  NSArray v2 = self;
  REMCDAccount.recordName()();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)recordZoneName
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (id)recordType
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)static REMCDAccount.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, (uint64_t)v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)allCloudObjectsInContext:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  static REMCDAccount.allCloudObjects(in:)((uint64_t)v4);

  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

+ (id)allCloudObjectIDsInContext:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  static REMCDAccount.allCloudObjectIDs(in:)((uint64_t)v4);

  sub_1000963CC(0, (unint64_t *)&qword_100914150);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a5;
  static REMCDAccount.newCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, (uint64_t)v11);
  id v13 = v12;

  swift_bridgeObjectRelease();
  return v13;
}

- (void)sortChildrenObjects
{
  NSString v2 = self;
  REMCDAccount.sortChildrenObjects()();
}

- (BOOL)mergeMigrationStateFromRecord:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  LOBYTE(self) = REMCDAccount.mergeMigrationState(fromRecord:)((CKRecord)v4);

  return self & 1;
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDAccount.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  NSString v3 = (void *)REMCDAccount.newlyCreatedRecord()();

  return v3;
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

- (BOOL)needsToBePushedToCloud
{
  NSString v2 = self;
  Swift::Bool v3 = REMCDAccount.needsToBePushedToCloud()();

  return v3;
}

- (BOOL)shouldBeDeletedFromLocalDatabase
{
  return 0;
}

+ (void)clearUserRecord:(id)a3
{
  id v3 = a3;
  sub_10065CC48();
}

+ (void)writeMigrationStateTo:(id)a3 didChooseToMigrate:(BOOL)a4 didFinishMigration:(BOOL)a5
{
  sub_1000963CC(0, (unint64_t *)&qword_100909E80);
  id v6 = a3;
  CKRecordKeyValueSetting.subscript.setter();
  CKRecordKeyValueSetting.subscript.setter();
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 1;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  return 0;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  return 0;
}

- (void)cleanUpAfterLocalObjectMerge
{
  NSString v2 = self;
  REMCDAccount.cleanUpAfterLocalObjectMerge()();
}

@end