@interface REMStore
+ (id)eks_storeForSyncing;
- (id)eks_defaultLocalList;
- (id)eks_localAccount;
@end

@implementation REMStore

+ (id)eks_storeForSyncing
{
  id v2 = objc_alloc_init((Class)REMStore);
  [v2 setMode:3];

  return v2;
}

- (id)eks_localAccount
{
  v3 = +[REMAccount localAccountID];
  id v9 = 0;
  v4 = [(REMStore *)self fetchAccountWithObjectID:v3 error:&v9];
  id v5 = v9;

  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10006C178((uint64_t)v5, v7);
    }
  }

  return v4;
}

- (id)eks_defaultLocalList
{
  id v2 = [(REMStore *)self eks_localAccount];
  id v8 = 0;
  v3 = [v2 fetchListsWithError:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = [v3 firstObject];
  }
  else
  {
    id v6 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10006C1F0((uint64_t)v4, v6);
    }
    id v5 = 0;
  }

  return v5;
}

@end