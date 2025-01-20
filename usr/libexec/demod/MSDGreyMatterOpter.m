@interface MSDGreyMatterOpter
+ (BOOL)isOptedIn;
+ (void)setIsOptedIn:(BOOL)a3;
@end

@implementation MSDGreyMatterOpter

+ (BOOL)isOptedIn
{
  id v2 = objc_alloc_init((Class)CSFGMOptIn);
  unsigned __int8 v3 = [v2 isOptedIn];

  return v3;
}

+ (void)setIsOptedIn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)CSFGMOptIn);
  [v4 setIsOptedIn:v3];
  +[CSFFollowUp setHasEngagedWithCFU:1];
}

@end