@interface WFPersistedSerializedParameters
+ (id)fetchRequest;
@end

@implementation WFPersistedSerializedParameters

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"PersistedSerializedParameters"];
}

@end