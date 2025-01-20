@interface WFCoreDataLibrary
+ (id)fetchRequest;
- (id)descriptor;
@end

@implementation WFCoreDataLibrary

- (id)descriptor
{
  id v3 = objc_alloc(MEMORY[0x1E4FB4698]);
  v4 = [(WFCoreDataLibrary *)self identifier];
  v5 = (void *)[v3 initWithIdentifier:v4 objectType:10];

  return v5;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Library"];
}

@end