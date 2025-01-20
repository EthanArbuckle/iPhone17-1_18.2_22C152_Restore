@interface GetCULibHandle
@end

@implementation GetCULibHandle

void ___GetCULibHandle_block_invoke(id a1)
{
  _GetCULibHandle_sHandle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils", 2);
}

@end