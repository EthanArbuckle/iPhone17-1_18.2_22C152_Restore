@interface TITrialManagerProxy
+ (TITrialManager)sharedManager;
+ (void)setSharedManager:(id)a3;
@end

@implementation TITrialManagerProxy

+ (TITrialManager)sharedManager
{
  if (sharedManagerOverride)
  {
    id v2 = (id)sharedManagerOverride;
  }
  else
  {
    id v2 = +[TITrialManager sharedInstance];
  }

  return (TITrialManager *)v2;
}

+ (void)setSharedManager:(id)a3
{
}

@end