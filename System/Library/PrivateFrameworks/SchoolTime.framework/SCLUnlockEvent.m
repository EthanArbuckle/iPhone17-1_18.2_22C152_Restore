@interface SCLUnlockEvent
+ (id)fetchRequest;
@end

@implementation SCLUnlockEvent

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"UnlockEvent"];
}

@end