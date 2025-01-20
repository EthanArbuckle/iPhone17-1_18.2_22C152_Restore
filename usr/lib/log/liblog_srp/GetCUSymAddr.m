@interface GetCUSymAddr
@end

@implementation GetCUSymAddr

uint64_t (*___GetCUSymAddr_DataBuffer_Free_block_invoke())(void)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (uint64_t (*)(void))_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = (uint64_t (*)(void))dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Free");
    _GetCUSymAddr_DataBuffer_Free_sAddr = result;
  }
  return result;
}

void *___GetCUSymAddr_DataBuffer_Detach_block_invoke()
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (void *)_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Detach");
    _GetCUSymAddr_DataBuffer_Detach_sAddr = (uint64_t (*)(void, void, void))result;
  }
  return result;
}

void *___GetCUSymAddr_DataBuffer_Append_block_invoke()
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (void *)_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Append");
    _GetCUSymAddr_DataBuffer_Append_sAddr = (uint64_t (*)(void, void, void))result;
  }
  return result;
}

void *___GetCUSymAddr_SecondsToYMD_HMS_block_invoke()
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (void *)_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = dlsym((void *)_GetCULibHandle_sHandle, "SecondsToYMD_HMS");
    _GetCUSymAddr_SecondsToYMD_HMS_sAddr = (uint64_t (*)(void, void, void, void, void, void, void))result;
  }
  return result;
}

void *___GetCUSymAddr_Base64EncodeCopyEx_block_invoke()
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (void *)_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = dlsym((void *)_GetCULibHandle_sHandle, "Base64EncodeCopyEx");
    _GetCUSymAddr_Base64EncodeCopyEx_sAddr = (uint64_t (*)(void, void, void, void, void))result;
  }
  return result;
}

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

uint64_t (*___GetCUSymAddr_DataBuffer_AppendF_block_invoke())(void, const char *, ...)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (uint64_t (*)(void, const char *, ...))_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = (uint64_t (*)(void, const char *, ...))dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_AppendF");
    _GetCUSymAddr_DataBuffer_AppendF_sAddr = result;
  }
  return result;
}

void *___GetCUSymAddr_DataBuffer_Init_block_invoke()
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  result = (void *)_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Init");
    _GetCUSymAddr_DataBuffer_Init_sAddr = (uint64_t (*)(void, void, void, void))result;
  }
  return result;
}

@end