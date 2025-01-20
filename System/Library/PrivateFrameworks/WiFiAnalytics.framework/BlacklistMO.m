@interface BlacklistMO
+ (id)entityName;
+ (id)fetchRequest;
@end

@implementation BlacklistMO

+ (id)entityName
{
  return @"Blacklist";
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Blacklist"];
}

@end