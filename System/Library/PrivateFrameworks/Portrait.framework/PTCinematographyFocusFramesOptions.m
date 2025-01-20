@interface PTCinematographyFocusFramesOptions
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_defaultMaximumRackFocusPullTime;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_defaultMinimumRackFocusPullTime;
+ (float)_defaultMaximumDisparityPerSecond;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumRackFocusPullTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRackFocusPullTime;
- (BOOL)writeToGlobalMetadata:(id)a3;
- (PTCinematographyFocusFramesOptions)init;
- (PTCinematographyFocusFramesOptions)initWithGlobalMetadata:(id)a3;
- (float)maximumDisparityPerSecond;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMaximumDisparityPerSecond:(float)a3;
- (void)setMaximumRackFocusPullTime:(id *)a3;
- (void)setMinimumRackFocusPullTime:(id *)a3;
@end

@implementation PTCinematographyFocusFramesOptions

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_defaultMinimumRackFocusPullTime
{
  if (_defaultMinimumRackFocusPullTime_onceToken != -1) {
    dispatch_once(&_defaultMinimumRackFocusPullTime_onceToken, &__block_literal_global_2);
  }
  *(_OWORD *)&retstr->var0 = _defaultMinimumRackFocusPullTime_sDefaultMinimumRackFocusPullTime;
  retstr->var3 = qword_1EA626370;
  return result;
}

void __70__PTCinematographyFocusFramesOptions__defaultMinimumRackFocusPullTime__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  CMTimeMake(&v2, 1, 3);
  *(CMTime *)_defaultMinimumRackFocusPullTime_sDefaultMinimumRackFocusPullTime = v2;
  v0 = _PTLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    CMTime v2 = *(CMTime *)_defaultMinimumRackFocusPullTime_sDefaultMinimumRackFocusPullTime;
    v1 = NSStringFromCMTime(&v2);
    LODWORD(v2.value) = 138412290;
    *(CMTimeValue *)((char *)&v2.value + 4) = (CMTimeValue)v1;
    _os_log_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyMinPullTime: %@", (uint8_t *)&v2, 0xCu);
  }
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_defaultMaximumRackFocusPullTime
{
  if (_defaultMaximumRackFocusPullTime_onceToken != -1) {
    dispatch_once(&_defaultMaximumRackFocusPullTime_onceToken, &__block_literal_global_2);
  }
  *(_OWORD *)&retstr->var0 = _defaultMaximumRackFocusPullTime_sDefaultMaximumRackFocusPullTime;
  retstr->var3 = qword_1EA626350;
  return result;
}

void __70__PTCinematographyFocusFramesOptions__defaultMaximumRackFocusPullTime__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  CMTimeMake(&v2, 1, 1);
  *(CMTime *)_defaultMaximumRackFocusPullTime_sDefaultMaximumRackFocusPullTime = v2;
  v0 = _PTLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    CMTime v2 = *(CMTime *)_defaultMaximumRackFocusPullTime_sDefaultMaximumRackFocusPullTime;
    v1 = NSStringFromCMTime(&v2);
    LODWORD(v2.value) = 138412290;
    *(CMTimeValue *)((char *)&v2.value + 4) = (CMTimeValue)v1;
    _os_log_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyMaxPullTime: %@", (uint8_t *)&v2, 0xCu);
  }
}

+ (float)_defaultMaximumDisparityPerSecond
{
  if (_defaultMaximumDisparityPerSecond_onceToken != -1) {
    dispatch_once(&_defaultMaximumDisparityPerSecond_onceToken, &__block_literal_global_4);
  }
  return *(float *)&_defaultMaximumDisparityPerSecond_sDefaultMaximumDisparityPerSecond;
}

void __71__PTCinematographyFocusFramesOptions__defaultMaximumDisparityPerSecond__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  _defaultMaximumDisparityPerSecond_sDefaultMaximumDisparityPerSecond = 1056964608;
  v0 = _PTLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v1) = 0.5;
    CMTime v2 = [NSNumber numberWithFloat:v1];
    int v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D0778000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyMaxDisparityPerSecond: %@", (uint8_t *)&v3, 0xCu);
  }
}

- (PTCinematographyFocusFramesOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyFocusFramesOptions;
  CMTime v2 = [(PTCinematographyFocusFramesOptions *)&v9 init];
  if (v2)
  {
    int v3 = objc_opt_class();
    if (v3)
    {
      [v3 _defaultMinimumRackFocusPullTime];
    }
    else
    {
      long long v7 = 0uLL;
      uint64_t v8 = 0;
    }
    *(void *)(v2 + 28) = v8;
    *(_OWORD *)(v2 + 12) = v7;
    v4 = objc_opt_class();
    if (v4)
    {
      [v4 _defaultMaximumRackFocusPullTime];
    }
    else
    {
      long long v7 = 0uLL;
      uint64_t v8 = 0;
    }
    *(_OWORD *)(v2 + 36) = v7;
    *(void *)(v2 + 52) = v8;
    [(id)objc_opt_class() _defaultMaximumDisparityPerSecond];
    *((_DWORD *)v2 + 2) = v5;
  }
  return (PTCinematographyFocusFramesOptions *)v2;
}

- (PTCinematographyFocusFramesOptions)initWithGlobalMetadata:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PTCinematographyFocusFramesOptions;
  int v5 = [(PTCinematographyFocusFramesOptions *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      if ([v4 majorVersion] == 1)
      {
        id v6 = v4;
        [v6 minimumRackFocusPullTime];
        *(void *)(v5 + 28) = v12;
        *(_OWORD *)(v5 + 12) = v11;
        [v6 maximumRackFocusPullTime];
        *(_OWORD *)(v5 + 36) = v11;
        *(void *)(v5 + 52) = v12;
        [v6 maximumDisparityPerSecond];
        int v8 = v7;

        *((_DWORD *)v5 + 2) = v8;
        int v5 = v5;

        goto LABEL_9;
      }
      objc_super v9 = _PTLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyFocusFramesOptions initWithGlobalMetadata:](v4);
      }
    }
    int v5 = (char *)[v5 init];
  }
LABEL_9:

  return (PTCinematographyFocusFramesOptions *)v5;
}

- (BOOL)writeToGlobalMetadata:(id)a3
{
  id v4 = a3;
  int v5 = [v4 majorVersion];
  if (v5 == 1)
  {
    long long v11 = *(_OWORD *)(&self->_maximumDisparityPerSecond + 1);
    uint64_t v12 = *(void *)&self->_minimumRackFocusPullTime.flags;
    id v6 = v4;
    [v6 setMinimumRackFocusPullTime:&v11];
    long long v9 = *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4);
    uint64_t v10 = *(void *)&self->_maximumRackFocusPullTime.flags;
    [v6 setMaximumRackFocusPullTime:&v9];
    *(float *)&double v7 = self->_maximumDisparityPerSecond;
    [v6 setMaximumDisparityPerSecond:v7];
  }
  else
  {
    id v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyFocusFramesOptions initWithGlobalMetadata:](v4);
    }
  }

  return v5 == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  [(PTCinematographyFocusFramesOptions *)self minimumRackFocusPullTime];
  long long v10 = v12;
  uint64_t v11 = v13;
  [v4 setMinimumRackFocusPullTime:&v10];
  [(PTCinematographyFocusFramesOptions *)self maximumRackFocusPullTime];
  long long v6 = v8;
  uint64_t v7 = v9;
  [v4 setMaximumRackFocusPullTime:&v6];
  [(PTCinematographyFocusFramesOptions *)self maximumDisparityPerSecond];
  objc_msgSend(v4, "setMaximumDisparityPerSecond:");
  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (void)setMinimumRackFocusPullTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_minimumRackFocusPullTime.flags = a3->var3;
  *(_OWORD *)(&self->_maximumDisparityPerSecond + 1) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  retstr->var3 = *(int64_t *)((char *)&self[2].var0 + 4);
  return self;
}

- (void)setMaximumRackFocusPullTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_maximumRackFocusPullTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4) = v3;
}

- (float)maximumDisparityPerSecond
{
  return self->_maximumDisparityPerSecond;
}

- (void)setMaximumDisparityPerSecond:(float)a3
{
  self->_maximumDisparityPerSecond = a3;
}

- (void)initWithGlobalMetadata:(void *)a1 .cold.1(void *a1)
{
  [a1 majorVersion];
  OUTLINED_FUNCTION_0_2(&dword_1D0778000, v1, v2, "focus frames does not support global cinematography metadata version %d", v3, v4, v5, v6, 0);
}

@end