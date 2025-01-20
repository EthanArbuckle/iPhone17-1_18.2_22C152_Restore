@interface CRLFeatureFlagsHelper
+ (BOOL)isOSFeatureEnabled:(int64_t)a3;
@end

@implementation CRLFeatureFlagsHelper

+ (BOOL)isOSFeatureEnabled:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      goto LABEL_4;
    case 1:
      goto LABEL_4;
    case 2:
      goto LABEL_4;
    case 3:
      if (!_os_feature_enabled_impl()) {
        goto LABEL_12;
      }
LABEL_4:
      BOOL result = _os_feature_enabled_impl();
      break;
    case 4:
      goto LABEL_4;
    case 5:
      goto LABEL_4;
    default:
LABEL_12:
      BOOL result = 0;
      break;
  }
  return result;
}

@end