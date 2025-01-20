@interface SEMTrialUtilities
+ (BOOL)getBoolTrialValueForTrialCli:(id)a3 withFactor:(id)a4 andNamespaceName:(id)a5;
+ (int64_t)getLongTrialValueForTrialCli:(id)a3 withFactor:(id)a4 andNamespaceName:(id)a5;
@end

@implementation SEMTrialUtilities

+ (BOOL)getBoolTrialValueForTrialCli:(id)a3 withFactor:(id)a4 andNamespaceName:(id)a5
{
  v5 = objc_msgSend_levelForFactor_withNamespaceName_(a3, a2, (uint64_t)a4, (uint64_t)a5);
  char v9 = objc_msgSend_BOOLeanValue(v5, v6, v7, v8);

  return v9;
}

+ (int64_t)getLongTrialValueForTrialCli:(id)a3 withFactor:(id)a4 andNamespaceName:(id)a5
{
  v5 = objc_msgSend_levelForFactor_withNamespaceName_(a3, a2, (uint64_t)a4, (uint64_t)a5);
  int64_t v9 = objc_msgSend_longValue(v5, v6, v7, v8);

  return v9;
}

@end