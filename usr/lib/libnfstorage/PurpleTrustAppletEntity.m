@interface PurpleTrustAppletEntity
+ (id)fetchRequest;
@end

@implementation PurpleTrustAppletEntity

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PurpleTrustAppletEntity"];
}

@end