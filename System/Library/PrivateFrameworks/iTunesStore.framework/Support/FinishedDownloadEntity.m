@interface FinishedDownloadEntity
+ (id)databaseTable;
@end

@implementation FinishedDownloadEntity

+ (id)databaseTable
{
  return @"finished_download";
}

@end