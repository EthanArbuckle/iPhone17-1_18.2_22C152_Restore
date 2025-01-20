@interface SSKeyValueStoreValueEntity
+ (id)databaseTable;
@end

@implementation SSKeyValueStoreValueEntity

+ (id)databaseTable
{
  return @"kvs_value";
}

@end