@interface NTPBFeedConfiguration(FCAdditions)
+ (id)feedConfigurationFromDict:()FCAdditions;
+ (id)feedConfigurationFromJSON:()FCAdditions;
- (id)feedIDForBin:()FCAdditions paid:;
@end

@implementation NTPBFeedConfiguration(FCAdditions)

+ (id)feedConfigurationFromJSON:()FCAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryFromJSON:");
  v3 = [a1 feedConfigurationFromDict:v2];

  return v3;
}

+ (id)feedConfigurationFromDict:()FCAdditions
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F82A48]);
    v5 = [v3 objectForKeyedSubscript:@"limitOnePerHourFeedID"];
    [v4 setFreeAFeedID:v5];

    v6 = [v3 objectForKeyedSubscript:@"limitTwelvePerHourFeedID"];
    [v4 setFreeBFeedID:v6];

    v7 = [v3 objectForKeyedSubscript:@"everythingFeedID"];
    [v4 setFreeCFeedID:v7];

    v8 = [v3 objectForKeyedSubscript:@"paidLimitOnePerHourFeedID"];
    [v4 setPaidAFeedID:v8];

    v9 = [v3 objectForKeyedSubscript:@"paidLimitTwelvePerHourFeedID"];
    [v4 setPaidBFeedID:v9];

    v10 = [v3 objectForKeyedSubscript:@"paidEverythingFeedID"];
    [v4 setPaidCFeedID:v10];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)feedIDForBin:()FCAdditions paid:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v7 = (void *)[[NSString alloc] initWithFormat:@"can't get feed ID for unknown bin"];
        int v10 = 136315906;
        v11 = "-[NTPBFeedConfiguration(FCAdditions) feedIDForBin:paid:]";
        __int16 v12 = 2080;
        v13 = "NTPBFeedConfiguration+FCAdditions.m";
        __int16 v14 = 1024;
        int v15 = 56;
        __int16 v16 = 2114;
        v17 = v7;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
      }
      goto LABEL_16;
    case 1:
      if (a4)
      {
        v8 = [a1 paidAFeedID];
        if (v8) {
          goto LABEL_17;
        }
      }
      else
      {
        v8 = [a1 freeAFeedID];
        if (v8) {
          goto LABEL_17;
        }
      }
      goto LABEL_16;
    case 2:
      if (a4)
      {
        v8 = [a1 paidBFeedID];
        if (v8) {
          goto LABEL_17;
        }
      }
      else
      {
        v8 = [a1 freeBFeedID];
        if (v8) {
          goto LABEL_17;
        }
      }
LABEL_16:
      v8 = [a1 feedIDForBin:FCNextHigherVolumeFeedBin(a3) paid:a4];
LABEL_17:
      return v8;
    case 3:
      if (a4) {
        [a1 paidCFeedID];
      }
      else {
      v8 = [a1 freeCFeedID];
      }
      goto LABEL_17;
    default:
      goto LABEL_16;
  }
}

@end