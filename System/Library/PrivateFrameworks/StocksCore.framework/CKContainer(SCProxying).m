@interface CKContainer(SCProxying)
- (void)addDatabaseOperation:()SCProxying;
@end

@implementation CKContainer(SCProxying)

- (void)addDatabaseOperation:()SCProxying
{
  id v4 = a3;
  id v5 = [a1 privateCloudDatabase];
  [v5 addOperation:v4];
}

@end