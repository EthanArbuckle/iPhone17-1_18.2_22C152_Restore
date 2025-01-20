@interface TelephonyUtilDebugGetOsLogObject
@end

@implementation TelephonyUtilDebugGetOsLogObject

os_log_t ___TelephonyUtilDebugGetOsLogObject_block_invoke()
{
  os_log_t result = os_log_create("com.apple.telephony", "libtu");
  _MergedGlobals_0 = (uint64_t)result;
  return result;
}

@end