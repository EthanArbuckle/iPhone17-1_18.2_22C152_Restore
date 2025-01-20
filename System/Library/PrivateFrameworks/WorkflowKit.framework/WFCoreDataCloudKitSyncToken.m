@interface WFCoreDataCloudKitSyncToken
+ (id)fetchRequest;
- (id)descriptor;
@end

@implementation WFCoreDataCloudKitSyncToken

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CloudKitSyncToken"];
}

- (id)descriptor
{
  id v3 = objc_alloc(MEMORY[0x1E4FB4698]);
  v4 = [(WFCoreDataCloudKitSyncToken *)self identifier];
  v5 = (void *)[v3 initWithIdentifier:v4 objectType:3];

  return v5;
}

@end