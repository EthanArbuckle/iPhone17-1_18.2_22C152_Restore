@interface VUIPlaybackUpNextConfig
- (BOOL)disablePostPlayTypeHLSQueryParam;
- (VUIPlaybackUpNextConfig)init;
- (double)autoPlayTimerDuration;
- (double)bootstrapInterval;
- (double)documentUpdateOffsetInterval;
- (double)duration;
- (double)minAutoPlayStopTime;
- (double)minTimeIntervalFromEndToDisplay;
- (unint64_t)maximumAutoPlayableItems;
- (void)setAutoPlayTimerDuration:(double)a3;
- (void)setBootstrapInterval:(double)a3;
- (void)setDisablePostPlayTypeHLSQueryParam:(BOOL)a3;
- (void)setDocumentUpdateOffsetInterval:(double)a3;
- (void)setDuration:(double)a3;
- (void)setMaximumAutoPlayableItems:(unint64_t)a3;
- (void)setMinAutoPlayStopTime:(double)a3;
- (void)setMinTimeIntervalFromEndToDisplay:(double)a3;
@end

@implementation VUIPlaybackUpNextConfig

- (void)setMinTimeIntervalFromEndToDisplay:(double)a3
{
  self->_minTimeIntervalFromEndToDisplay = a3;
}

- (void)setMinAutoPlayStopTime:(double)a3
{
  self->_minAutoPlayStopTime = a3;
}

- (void)setMaximumAutoPlayableItems:(unint64_t)a3
{
  self->_maximumAutoPlayableItems = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setDocumentUpdateOffsetInterval:(double)a3
{
  self->_documentUpdateOffsetInterval = a3;
}

- (void)setBootstrapInterval:(double)a3
{
  self->_bootstrapInterval = a3;
}

- (void)setAutoPlayTimerDuration:(double)a3
{
  self->_autoPlayTimerDuration = a3;
}

- (VUIPlaybackUpNextConfig)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)VUIPlaybackUpNextConfig;
  v2 = [(VUIPlaybackUpNextConfig *)&v26 init];
  v3 = v2;
  if (v2)
  {
    v2->_documentUpdateOffsetInterval = 1.0;
    v2->_duration = 30.0;
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [v4 objectForKey:@"maximumAutoPlayableItemsQAOverride"];

    if (v5)
    {
      v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v5;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: overriding max auto playable items from user defaults %@", buf, 0xCu);
      }

      v3->_maximumAutoPlayableItems = [v5 unsignedIntegerValue];
    }
    else
    {
      v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v8 = [v7 objectForKey:@"maximumAutoPlayableItems"];

      if (v8) {
        uint64_t v9 = [v8 unsignedIntegerValue];
      }
      else {
        uint64_t v9 = 3;
      }
      v3->_maximumAutoPlayableItems = v9;
    }
    v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v11 = [v10 objectForKey:@"autoPlayTimerDuration"];

    if (v11) {
      [v11 doubleValue];
    }
    else {
      double v12 = 15.0;
    }
    v3->_autoPlayTimerDuration = v12;
    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v14 = [v13 objectForKey:@"bootStrapInterval"];

    if (v14) {
      [v14 doubleValue];
    }
    else {
      double v15 = 30.0;
    }
    v3->_bootstrapInterval = v15;
    v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v17 = [v16 objectForKey:@"minAutoPlayStopTimeQAOverride"];

    if (v17)
    {
      [v17 doubleValue];
      v3->_minAutoPlayStopTime = v18;
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v20 = [v19 objectForKey:@"minAutoPlayStopTime"];

      if (v20) {
        [v20 doubleValue];
      }
      else {
        uint64_t v21 = 0x40BC200000000000;
      }
      *(void *)&v3->_minAutoPlayStopTime = v21;
    }
    v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v23 = [v22 objectForKey:@"minTimeIntervalFromEndToDisplay"];

    if (v23) {
      [v23 doubleValue];
    }
    else {
      double v24 = 20.0;
    }
    v3->_minTimeIntervalFromEndToDisplay = v24;
  }
  return v3;
}

- (double)bootstrapInterval
{
  return self->_bootstrapInterval;
}

- (double)documentUpdateOffsetInterval
{
  return self->_documentUpdateOffsetInterval;
}

- (unint64_t)maximumAutoPlayableItems
{
  return self->_maximumAutoPlayableItems;
}

- (double)minAutoPlayStopTime
{
  return self->_minAutoPlayStopTime;
}

- (double)duration
{
  return self->_duration;
}

- (double)autoPlayTimerDuration
{
  return self->_autoPlayTimerDuration;
}

- (double)minTimeIntervalFromEndToDisplay
{
  return self->_minTimeIntervalFromEndToDisplay;
}

- (BOOL)disablePostPlayTypeHLSQueryParam
{
  return self->_disablePostPlayTypeHLSQueryParam;
}

- (void)setDisablePostPlayTypeHLSQueryParam:(BOOL)a3
{
  self->_disablePostPlayTypeHLSQueryParam = a3;
}

@end