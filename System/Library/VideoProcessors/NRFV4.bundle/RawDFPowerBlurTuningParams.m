@interface RawDFPowerBlurTuningParams
- (BOOL)isEnabledForFrameType:(int)a3;
- (int)readPlist:(id)a3;
@end

@implementation RawDFPowerBlurTuningParams

- (int)readPlist:(id)a3
{
  int v4 = -73311;
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"Default"];
  v7 = getNumberForKey(v6, @"Enabled");
  if (!v7) {
    goto LABEL_19;
  }
  v8 = v7;
  self->defaultTuning.enabled = [v7 BOOLValue];
  v9 = getNumberForKey(v6, @"Radius");

  if (!v9) {
    goto LABEL_18;
  }
  int v10 = [v9 unsignedShortValue];
  self->defaultTuning.radius = v10;
  if ((v10 - 7) <= 0xFFFFFFF9)
  {
    v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_18;
  }
  v11 = getNumberForKey(v6, @"ColorMatchThreshold");

  if (!v11)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_18;
  }
  [v11 floatValue];
  self->defaultTuning.colorMatchThreshold = v12;
  v9 = getNumberForKey(v6, @"HighFrequencyNoiseThreshold");

  if (v9)
  {
    [v9 floatValue];
    *(void *)&self->quadraTuning.enabled = *(void *)&self->defaultTuning.enabled;
    self->defaultTuning.highFreqNoiseThreshold = v13;
    self->quadraTuning.highFreqNoiseThreshold = self->defaultTuning.highFreqNoiseThreshold;
    v14 = [v5 objectForKey:@"Quadra"];

    if (v14)
    {
      v15 = [v5 objectForKeyedSubscript:@"Quadra"];
      v16 = getNumberForKey(v15, @"Enabled");

      if (v16) {
        self->quadraTuning.enabled = [v16 BOOLValue];
      }
      v9 = getNumberForKey(v15, @"Radius");

      if (v9
        && (int v17 = [v9 unsignedShortValue],
            self->quadraTuning.radius = v17,
            (v17 - 7) <= 0xFFFFFFF9))
      {
        v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        v18 = getNumberForKey(v15, @"ColorMatchThreshold");

        if (v18)
        {
          [v18 floatValue];
          self->quadraTuning.colorMatchThreshold = v19;
        }
        v9 = getNumberForKey(v15, @"HighFrequencyNoiseThreshold");

        if (v9)
        {
          [v9 floatValue];
          int v4 = 0;
          self->quadraTuning.highFreqNoiseThreshold = v20;
        }
        else
        {
          int v4 = 0;
        }
      }
    }
    else
    {
      int v4 = 0;
    }
  }
LABEL_18:

  return v4;
}

- (BOOL)isEnabledForFrameType:(int)a3
{
  BOOL v4 = isRawDFQuadraFrameType(a3);
  uint64_t v5 = 8;
  if (v4) {
    uint64_t v5 = 20;
  }
  return *((unsigned char *)&self->super.isa + v5);
}

@end