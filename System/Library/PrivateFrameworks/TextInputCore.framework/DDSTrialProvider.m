@interface DDSTrialProvider
- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4;
- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4;
- (void)registerDelegate:(id)a3;
- (void)setUpTrialForQuery:(id)a3;
- (void)unregisterDelegate:(id)a3;
@end

@implementation DDSTrialProvider

- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F5EF48];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 sharedInstance];
  v9 = [v8 contentItemsFromAssets:v7 matchingFilter:v6];

  return v9;
}

- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F5EF48];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstance];
  [v8 fetchTrialAssetForQuery:v7 callback:v6];
}

- (void)setUpTrialForQuery:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5EF48];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 setUpTrialForQuery:v4];
}

- (void)unregisterDelegate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5EF48];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 unregisterDelegate:v4];
}

- (void)registerDelegate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5EF48];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 registerDelegate:v4];
}

@end