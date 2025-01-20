@interface AppletEntity
+ (id)fetchRequest;
@end

@implementation AppletEntity

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"AppletEntity"];
}

@end