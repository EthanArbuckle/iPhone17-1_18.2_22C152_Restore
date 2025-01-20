@interface GeneratedEncryptionKey
+ (NSString)dateGeneratedKeyPath;
+ (id)fetchRequest;
@end

@implementation GeneratedEncryptionKey

+ (NSString)dateGeneratedKeyPath
{
  return (NSString *)@"dateGenerated";
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"GeneratedEncryptionKey"];
}

@end