@interface STStatusBarDataEntry(Testing)
+ (id)entryWithKey:()Testing updatedKeys:enabledKeys:;
+ (id)entryWithKey:()Testing updatedKeys:enabledKeys:populatedEntry:;
@end

@implementation STStatusBarDataEntry(Testing)

+ (id)entryWithKey:()Testing updatedKeys:enabledKeys:
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 containsObject:v8])
  {
    if ([v9 containsObject:v8]) {
      [a1 entry];
    }
    else {
    v10 = [a1 disabledEntry];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)entryWithKey:()Testing updatedKeys:enabledKeys:populatedEntry:
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a4 containsObject:v10])
  {
    if (([v11 containsObject:v10] & 1) == 0)
    {
      uint64_t v13 = [a1 disabledEntry];

      id v12 = (id)v13;
    }
    id v14 = v12;
    id v12 = v14;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end