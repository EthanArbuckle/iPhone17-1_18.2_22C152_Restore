@interface ExpressESEEntity
+ (id)fetchRequest;
@end

@implementation ExpressESEEntity

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ExpressESEEntity"];
}

@end