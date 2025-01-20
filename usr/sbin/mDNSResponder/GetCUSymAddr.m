@interface GetCUSymAddr
@end

@implementation GetCUSymAddr

void ___GetCUSymAddr_DataBuffer_Free_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_DataBuffer_Free_sAddr = (uint64_t (*)(void))dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Free");
  }
}

void ___GetCUSymAddr_DataBuffer_Detach_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_DataBuffer_Detach_sAddr = (uint64_t (*)(void, void, void))dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Detach");
  }
}

void ___GetCUSymAddr_DataBuffer_Append_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_DataBuffer_Append_sAddr = (uint64_t (*)(void, void, void))dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Append");
  }
}

void ___GetCUSymAddr_SecondsToYMD_HMS_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_SecondsToYMD_HMS_sAddr = (uint64_t (*)(void, void, void, void, void, void, void))dlsym((void *)_GetCULibHandle_sHandle, "SecondsToYMD_HMS");
  }
}

void ___GetCUSymAddr_Base64EncodeCopyEx_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_Base64EncodeCopyEx_sAddr = (uint64_t (*)(void, void, void, void, void))dlsym((void *)_GetCULibHandle_sHandle, "Base64EncodeCopyEx");
  }
}

void ___GetCUSymAddr_SNPrintF_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_SNPrintF_sAddr = (uint64_t (*)(void, void, const char *, ...))dlsym((void *)_GetCULibHandle_sHandle, "SNPrintF");
  }
}

void ___GetCUSymAddr_DataBuffer_AppendF_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_DataBuffer_AppendF_sAddr = (uint64_t (*)(void, const char *, ...))dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_AppendF");
  }
}

void ___GetCUSymAddr_DataBuffer_Init_block_invoke(id a1)
{
  if (_GetCULibHandle_sOnce != -1) {
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_211);
  }
  if (_GetCULibHandle_sHandle) {
    _GetCUSymAddr_DataBuffer_Init_sAddr = (uint64_t (*)(void, void, void, void))dlsym((void *)_GetCULibHandle_sHandle, "DataBuffer_Init");
  }
}

@end