@interface HighlightContextsSymbolLoc
@end

@implementation HighlightContextsSymbolLoc

void *__getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaAnalysisLibrary_44831();
  result = dlsym(v2, "VCPMediaAnalyzerOption_HighlightContexts");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPMediaAnalyzerOption_HighlightContextsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end