@interface WFCoreDataAccessResourcePermission
+ (id)fetchRequest;
@end

@implementation WFCoreDataAccessResourcePermission

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AccessResourcePermission"];
}

@end