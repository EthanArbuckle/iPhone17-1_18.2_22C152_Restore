@interface USUsageTrust
+ (BOOL)validateTrustForSecTask:(__SecTask *)a3;
+ (BOOL)validateTrustForSecTask:(__SecTask *)a3 representingBundleIdentifier:(id)a4;
@end

@implementation USUsageTrust

+ (BOOL)validateTrustForSecTask:(__SecTask *)a3
{
  return 1;
}

+ (BOOL)validateTrustForSecTask:(__SecTask *)a3 representingBundleIdentifier:(id)a4
{
  return 1;
}

@end