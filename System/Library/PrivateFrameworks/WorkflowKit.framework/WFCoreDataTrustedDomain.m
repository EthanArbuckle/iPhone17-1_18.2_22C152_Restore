@interface WFCoreDataTrustedDomain
+ (id)fetchRequest;
@end

@implementation WFCoreDataTrustedDomain

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"TrustedDomain"];
}

@end