@interface DownloadPolicyEntity
+ (id)databaseTable;
@end

@implementation DownloadPolicyEntity

+ (id)databaseTable
{
  return @"download_policy";
}

@end