@interface VKCImageAnalysis(__PX_Additions__)
- (BOOL)hasDataDetectors;
- (uint64_t)hasTexts;
- (uint64_t)hasVisualSearchResults;
@end

@implementation VKCImageAnalysis(__PX_Additions__)

- (uint64_t)hasVisualSearchResults
{
  return [a1 hasResultsForAnalysisTypes:16];
}

- (BOOL)hasDataDetectors
{
  return [a1 countOfDataDetectorsWithTypes:-1] != 0;
}

- (uint64_t)hasTexts
{
  return [a1 hasResultsForAnalysisTypes:1];
}

@end