@interface TransactionEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
- (int64_t)_typeForDownload:(id)a3;
@end

@implementation TransactionEntity

+ (id)databaseTable
{
  return @"trnsaction";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_typeForDownload:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForProperty:@"kind"];
  if ([v4 isEqualToString:SSDownloadKindSoftwareApplication])
  {
    v5 = [v3 valueForProperty:@"is_automatic"];
    v6 = [v3 valueForProperty:@"is_restore"];
    if ([v5 integerValue] == (id)2)
    {
      int64_t v7 = 2;
    }
    else if ([v6 BOOLValue])
    {
      int64_t v7 = 3;
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

@end