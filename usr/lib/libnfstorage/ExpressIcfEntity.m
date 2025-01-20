@interface ExpressIcfEntity
+ (id)fetchRequest;
@end

@implementation ExpressIcfEntity

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ExpressIcfEntity"];
}

@end