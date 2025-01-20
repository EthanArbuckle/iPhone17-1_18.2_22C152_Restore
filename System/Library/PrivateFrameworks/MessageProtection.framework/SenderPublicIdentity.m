@interface SenderPublicIdentity
+ (id)fetchRequest;
@end

@implementation SenderPublicIdentity

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"SenderPublicIdentity"];
}

@end