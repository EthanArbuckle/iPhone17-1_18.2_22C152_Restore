@interface _DASPolicyManager
+ (id)allPoliciesForPlatform;
+ (id)allPredictingPoliciesForPlatform;
+ (id)policyForBitIndex:(unint64_t)a3;
+ (unint64_t)bitmaskForPolicy:(id)a3;
+ (void)initializeAllPolicies;
@end

@implementation _DASPolicyManager

+ (id)allPoliciesForPlatform
{
  +[_DASPolicyManager initializeAllPolicies];
  v2 = (void *)qword_1001C4110;

  return v2;
}

+ (void)initializeAllPolicies
{
  if (qword_1001C4108 != -1) {
    dispatch_once(&qword_1001C4108, &stru_100176A88);
  }
}

+ (id)allPredictingPoliciesForPlatform
{
  +[_DASPolicyManager initializeAllPolicies];
  v2 = (void *)qword_1001C4128;

  return v2;
}

+ (unint64_t)bitmaskForPolicy:(id)a3
{
  v3 = [(id)qword_1001C4120 objectForKeyedSubscript:a3];
  unsigned __int8 v4 = [v3 unsignedIntegerValue];

  return 1 << v4;
}

+ (id)policyForBitIndex:(unint64_t)a3
{
  v3 = (void *)qword_1001C4118;
  unsigned __int8 v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  v5 = [v3 objectForKeyedSubscript:v4];

  return v5;
}

@end