@interface SBRecordingIndicatorRotationRateLimiter
- (BOOL)shouldAllowRotationUnderRateLimits;
- (SBRecordingIndicatorRotationRateLimiter)init;
- (void)_addTimestampForTime:(double)a3;
- (void)_removeTimestampsEarlierThan:(double)a3;
@end

@implementation SBRecordingIndicatorRotationRateLimiter

- (SBRecordingIndicatorRotationRateLimiter)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBRecordingIndicatorRotationRateLimiter;
  v2 = [(SBRecordingIndicatorRotationRateLimiter *)&v8 init];
  if (v2)
  {
    v3 = (NSHashTable *)objc_alloc_init(MEMORY[0x1E4F28D30]);
    rotationTimestamps = v2->_rotationTimestamps;
    v2->_rotationTimestamps = v3;

    uint64_t v5 = +[SBRecordingIndicatorDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBRecordingIndicatorSettings *)v5;
  }
  return v2;
}

- (BOOL)shouldAllowRotationUnderRateLimits
{
  BSDispatchQueueAssertMain();
  unint64_t v3 = [(SBRecordingIndicatorSettings *)self->_settings rateLimitNumber];
  [(SBRecordingIndicatorSettings *)self->_settings rateLimitPeriod];
  mach_continuous_time();
  BSMachTimeForTimeDifferenceFromMachTime();
  BSMonotonicReferencedTimeFromMachTime();
  double v5 = v4;
  BSMonotonicReferencedTimeFromMachTime();
  double v7 = v6;
  [(SBRecordingIndicatorRotationRateLimiter *)self _removeTimestampsEarlierThan:v5];
  NSUInteger v8 = [(NSHashTable *)self->_rotationTimestamps count];
  if (v8 < v3) {
    [(SBRecordingIndicatorRotationRateLimiter *)self _addTimestampForTime:v7];
  }
  return v8 < v3;
}

- (void)_removeTimestampsEarlierThan:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(NSHashTable *)self->_rotationTimestamps allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 doubleValue];
        if (v11 < a3) {
          [(NSHashTable *)self->_rotationTimestamps removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_addTimestampForTime:(double)a3
{
  rotationTimestamps = self->_rotationTimestamps;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSHashTable *)rotationTimestamps addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rotationTimestamps, 0);
}

@end