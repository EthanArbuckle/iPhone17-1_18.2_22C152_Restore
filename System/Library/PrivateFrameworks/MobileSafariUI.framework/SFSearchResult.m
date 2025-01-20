@interface SFSearchResult
- (uint64_t)_usesMapsPlacecard;
- (uint64_t)_willShowNewsHeader;
@end

@implementation SFSearchResult

void __49__SFSearchResult_CompletionItem__prewarmSearchUI__block_invoke()
{
  v0 = dispatch_get_global_queue(21, 0);
  dispatch_async(v0, &__block_literal_global_21);
}

- (uint64_t)_willShowNewsHeader
{
  if (!a1) {
    return 0;
  }
  v2 = [a1 sectionBundleIdentifier];
  if ([v2 isEqualToString:@"com.apple.parsec.news"])
  {
    v3 = [a1 punchout];
    v4 = [v3 urls];
    v5 = [v4 firstObject];
    v6 = [v5 scheme];
    if (isNewsScheme(v6))
    {
      v7 = _newsProxy();
      v8 = [v7 appState];
      uint64_t v9 = [v8 isInstalled];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)_usesMapsPlacecard
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 punchout];
  v2 = [v1 urls];
  v3 = [v2 firstObject];

  if (_SFDeviceIsPad())
  {
    v4 = [v3 host];
    if ([v4 isEqualToString:@"maps.apple.com"])
    {
      v5 = [v3 path];
      uint64_t v6 = objc_msgSend(v5, "safari_hasPrefix:", @"/place");
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL __74__SFSearchResult_CompletionItem__completionCellBackgroundModeInTopSection__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 backgroundColor];
  BOOL v3 = v2 != 0;

  return v3;
}

@end