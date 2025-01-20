@interface SVXRadarRateLimiter
- (BOOL)isRateLimited;
- (int)_getRandom;
@end

@implementation SVXRadarRateLimiter

- (int)_getRandom
{
  return arc4random_uniform(0x14u);
}

- (BOOL)isRateLimited
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = [(SVXRadarRateLimiter *)self _getRandom];
  v3 = *MEMORY[0x263F28348];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v7 = 136315394;
      v8 = "-[SVXRadarRateLimiter isRateLimited]";
      __int16 v9 = 1024;
      int v10 = v2;
      v5 = "%s User not sampled for this time, randint=%d";
LABEL_6:
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v7, 0x12u);
    }
  }
  else if (v4)
  {
    int v7 = 136315394;
    v8 = "-[SVXRadarRateLimiter isRateLimited]";
    __int16 v9 = 1024;
    int v10 = 0;
    v5 = "%s User sampled for this time, randint=%d";
    goto LABEL_6;
  }
  return v2 != 0;
}

@end