@interface CaptionWithHighlightSymbolLoc
@end

@implementation CaptionWithHighlightSymbolLoc

void *__getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaAnalysisLibrary_44831();
  result = dlsym(v2, "VCPMediaAnalyzerOption_CaptionWithHighlight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPMediaAnalyzerOption_CaptionWithHighlightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

@end