@interface PublishedLocalStatus
+ (NSString)identifierKeyPath;
+ (id)fetchRequest;
+ (id)predicateForPublishedLocalStatusIdentifiers:(id)a3;
@end

@implementation PublishedLocalStatus

+ (NSString)identifierKeyPath
{
  return (NSString *)@"identifier";
}

+ (id)predicateForPublishedLocalStatusIdentifiers:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[PublishedLocalStatus identifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K IN %@", v5, v4];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PublishedLocalStatus"];
}

@end