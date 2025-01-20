@interface SYUserActivityRecord
+ (id)createFetchRequest;
@end

@implementation SYUserActivityRecord

+ (id)createFetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SYUserActivityRecord"];
}

@end