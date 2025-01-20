@interface DownloadApplicationIdentifierEntity
+ (id)databaseTable;
@end

@implementation DownloadApplicationIdentifierEntity

+ (id)databaseTable
{
  return @"application_id";
}

@end