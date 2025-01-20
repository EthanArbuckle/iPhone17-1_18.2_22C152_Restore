@interface PublishedLocalStatusDevice
+ (NSString)idsIdentifierKeyPath;
+ (id)fetchRequest;
+ (id)predicateForPublishedLocalStatusDeviceIdentifiers:(id)a3;
@end

@implementation PublishedLocalStatusDevice

+ (NSString)idsIdentifierKeyPath
{
  return (NSString *)@"idsIdentifier";
}

+ (id)predicateForPublishedLocalStatusDeviceIdentifiers:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[PublishedLocalStatusDevice idsIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K IN %@", v5, v4];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PublishedLocalStatusDevice"];
}

@end