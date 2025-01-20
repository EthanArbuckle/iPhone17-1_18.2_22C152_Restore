@interface AllowStreamingOptionSymbolLoc
@end

@implementation AllowStreamingOptionSymbolLoc

void *__getVCPMediaAnalysisService_AllowStreamingOptionSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaAnalysisLibrary_44831();
  result = dlsym(v2, "VCPMediaAnalysisService_AllowStreamingOption");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPMediaAnalysisService_AllowStreamingOptionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

@end