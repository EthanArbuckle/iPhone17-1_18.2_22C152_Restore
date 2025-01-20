@interface GetCUSymAddr
@end

@implementation GetCUSymAddr

void *___GetCUSymAddr_SNPrintF_block_invoke()
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (void *)_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = dlsym((void *)_GetCULibHandle_sHandle, "SNPrintF");
    _GetCUSymAddr_SNPrintF_sAddr = (uint64_t (*)(void, void, const char *, ...))result;
  }
  return result;
}

@end