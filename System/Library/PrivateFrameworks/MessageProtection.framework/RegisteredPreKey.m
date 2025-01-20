@interface RegisteredPreKey
+ (id)fetchRequest;
@end

@implementation RegisteredPreKey

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"RegisteredPreKey"];
}

@end