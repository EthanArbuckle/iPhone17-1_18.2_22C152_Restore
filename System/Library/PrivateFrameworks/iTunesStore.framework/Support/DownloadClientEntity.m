@interface DownloadClientEntity
+ (id)databaseTable;
@end

@implementation DownloadClientEntity

+ (id)databaseTable
{
  return @"client";
}

@end