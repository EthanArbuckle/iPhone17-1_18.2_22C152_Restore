@interface SMContactMO
+ (id)fetchRequest;
@end

@implementation SMContactMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMContactMO"];
}

@end