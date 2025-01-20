@interface LPLogObject
@end

@implementation LPLogObject

void ___LPLogObject_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileSoftwareUpdate", "libpartition2");
  v2 = (void *)_LPLogObject_obj;
  _LPLogObject_obj = (uint64_t)v1;
}

@end