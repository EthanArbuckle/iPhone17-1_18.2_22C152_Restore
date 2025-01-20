@interface PICinematicAudioAdjustmentController(Analytics)
- (id)analyticsPayload;
- (uint64_t)analyticsKeysBlocklist;
@end

@implementation PICinematicAudioAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v2 = [a1 adjustment];
  if (v2 && (v3 = (void *)v2, int v4 = [a1 enabled], v3, v4))
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6 = [a1 renderingStyle];
    char v7 = [v6 isEqualToString:*MEMORY[0x263F5D6C8]];

    if (v7)
    {
      v8 = @"Original";
    }
    else
    {
      v9 = [a1 renderingStyle];
      char v10 = [v9 isEqualToString:*MEMORY[0x263F5D6D8]];

      if (v10)
      {
        v8 = @"Voice";
      }
      else
      {
        v11 = [a1 renderingStyle];
        char v12 = [v11 isEqualToString:*MEMORY[0x263F5D6D0]];

        if (v12)
        {
          v8 = @"Studio Voice";
        }
        else
        {
          v13 = [a1 renderingStyle];
          int v14 = [v13 isEqualToString:*MEMORY[0x263F5D6C0]];

          if (v14) {
            v8 = @"Camera Voice";
          }
          else {
            v8 = @"Unknown";
          }
        }
      }
    }
    [v5 setObject:v8 forKeyedSubscript:@"audio_mix"];
    v15 = +[PEAnalyticsUtility adjustmentValueBucketizerFormatter];
    v16 = NSNumber;
    [a1 dialogMixBias];
    v17 = objc_msgSend(v16, "numberWithDouble:");
    v18 = [v15 stringFromNumber:v17];
    [v5 setObject:v18 forKeyedSubscript:@"audio_mix_intensity"];
  }
  else
  {
    id v5 = (id)MEMORY[0x263EFFA78];
  }
  return v5;
}

- (uint64_t)analyticsKeysBlocklist
{
  return [MEMORY[0x263EFFA08] set];
}

@end