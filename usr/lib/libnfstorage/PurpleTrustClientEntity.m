@interface PurpleTrustClientEntity
+ (id)fetchRequest;
@end

@implementation PurpleTrustClientEntity

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PurpleTrustClientEntity"];
}

@end