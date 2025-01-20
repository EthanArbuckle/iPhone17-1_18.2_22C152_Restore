@interface NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents
@end

@implementation NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents

void ___NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents_block_invoke(uint64_t a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) complicationForSlot:a2];
  if ([v3 complicationType] == 31 || !objc_msgSend(v3, "complicationType"))
  {
    uint64_t v7 = [v3 appIdentifier];
    v8 = (void *)v7;
    v9 = @"ntk_unknown";
    if (v7) {
      v9 = (__CFString *)v7;
    }
    v6 = v9;
  }
  else
  {
    v4 = [v3 appIdentifier];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      v6 = [v3 appIdentifier];
    }
    else
    {
      v6 = @"ntk_unknown";
    }
  }
  if (([(__CFString *)v6 isEqualToString:@"com.apple.nanotimekit.off"] & 1) == 0)
  {
    if ((_isFirstPartyComplicationBundleID(v6) & 1) == 0)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      v6 = @"ntk_third_party";
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    v11 = @"firstPartyFaceComplications";
    v12[0] = v6;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    AnalyticsSendEvent();
  }
}

@end