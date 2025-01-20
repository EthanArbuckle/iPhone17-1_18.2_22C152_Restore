@interface LPLogObject
@end

@implementation LPLogObject

void ___LPLogObject_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MobileSoftwareUpdate", "libpartition2");
  v1 = (void *)_LPLogObject_obj;
  _LPLogObject_obj = (uint64_t)v0;
}

@end