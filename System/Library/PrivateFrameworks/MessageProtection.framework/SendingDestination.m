@interface SendingDestination
+ (id)fetchRequest;
@end

@implementation SendingDestination

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"SendingDestination"];
}

@end