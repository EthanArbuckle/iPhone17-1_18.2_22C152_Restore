@interface PurpleTrustKeyEntity
+ (id)fetchRequest;
@end

@implementation PurpleTrustKeyEntity

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PurpleTrustKeyEntity"];
}

@end