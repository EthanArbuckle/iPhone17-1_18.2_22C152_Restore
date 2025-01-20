@interface ANEDeviceInfoClass
@end

@implementation ANEDeviceInfoClass

Class __get_ANEDeviceInfoClass_block_invoke(uint64_t a1)
{
  if (!qword_1EB3B7848) {
    qword_1EB3B7848 = _sl_dlopen();
  }
  Class result = objc_getClass("_ANEDeviceInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB3B7840 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end