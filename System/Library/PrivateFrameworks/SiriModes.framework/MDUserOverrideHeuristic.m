@interface MDUserOverrideHeuristic
- (MDUserOverrideHeuristic)init;
- (MDUserOverrideHeuristic)initWithInternalDefaults:(id)a3;
- (id)determineCurrentMode;
- (unint64_t)internalModeOverride;
- (void)internalModeOverride;
@end

@implementation MDUserOverrideHeuristic

- (MDUserOverrideHeuristic)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.internal"];
  v4 = [(MDUserOverrideHeuristic *)self initWithInternalDefaults:v3];

  return v4;
}

- (MDUserOverrideHeuristic)initWithInternalDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDUserOverrideHeuristic;
  v6 = [(MDUserOverrideHeuristic *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalDefaults, a3);
  }

  return v7;
}

- (id)determineCurrentMode
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v2 = [(MDUserOverrideHeuristic *)self internalModeOverride];
  if (v2 == -1)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v3 = v2;
    v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      v6 = MDModeGetName(v3);
      int v9 = 136315394;
      v10 = "-[MDUserOverrideHeuristic determineCurrentMode]";
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_22161A000, v5, OS_LOG_TYPE_DEFAULT, "%s #modes: Override value being used: %@", (uint8_t *)&v9, 0x16u);
    }
    v7 = [[MDModeDecision alloc] initWithMode:v3];
  }

  return v7;
}

- (unint64_t)internalModeOverride
{
  if (!AFIsInternalInstall()) {
    return -1;
  }
  uint64_t v3 = [(NSUserDefaults *)self->_internalDefaults stringForKey:@"ModeOverride"];
  v4 = [v3 lowercaseString];

  if (([v4 isEqualToString:@"silent"] & 1) != 0
    || ([v4 isEqualToString:@"displayonly"] & 1) != 0)
  {
    unint64_t v5 = 2;
  }
  else if (([v4 isEqualToString:@"mixed"] & 1) != 0 {
         || ([v4 isEqualToString:@"displayforward"] & 1) != 0)
  }
  {
    unint64_t v5 = 1;
  }
  else if (([v4 isEqualToString:@"voice"] & 1) != 0 {
         || ([v4 isEqualToString:@"voiceonly"] & 1) != 0)
  }
  {
    unint64_t v5 = 0;
  }
  else if ([v4 isEqualToString:@"voiceforward"])
  {
    unint64_t v5 = 3;
  }
  else
  {
    if (v4)
    {
      v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        [(MDUserOverrideHeuristic *)(uint64_t)v4 internalModeOverride];
      }
    }
    unint64_t v5 = -1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)internalModeOverride
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[MDUserOverrideHeuristic internalModeOverride]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22161A000, a2, OS_LOG_TYPE_ERROR, "%s #modes Invalid mode override value: %@", (uint8_t *)&v2, 0x16u);
}

@end