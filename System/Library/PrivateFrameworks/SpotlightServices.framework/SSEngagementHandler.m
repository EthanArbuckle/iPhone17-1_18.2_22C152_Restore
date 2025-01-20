@interface SSEngagementHandler
+ (void)userEngagedResultWithIdentifier:(id)a3 forQueryString:(id)a4;
+ (void)userEngagedResultWithIdentifier:(id)a3 forQueryString:(id)a4 bundle:(id)a5;
@end

@implementation SSEngagementHandler

+ (void)userEngagedResultWithIdentifier:(id)a3 forQueryString:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a3;
  id v9 = [v5 mainBundle];
  v8 = [v9 bundleIdentifier];
  +[SSEngagementHandler userEngagedResultWithIdentifier:v7 forQueryString:v6 bundle:v8];
}

+ (void)userEngagedResultWithIdentifier:(id)a3 forQueryString:(id)a4 bundle:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PRSAnonymousPipelineManagerSession sharedManager];
  [v10 userEngagedItemWithIdentifier:v9 forBundle:v7 forQuery:v8];
}

@end