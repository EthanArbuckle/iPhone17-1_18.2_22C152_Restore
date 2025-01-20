@interface PLWakeState
+ (void)load;
- (BOOL)updateWithEntry:(id)a3;
- (PLWakeState)init;
@end

@implementation PLWakeState

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLWakeState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLWakeState)init
{
  return [(PLState *)self initWithStateId:8 entryKey:@"PLSleepWakeAgent_EventForward_PowerState" currValue:MEMORY[0x1E4F1CC38]];
}

- (BOOL)updateWithEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"State"];
  int v6 = [v5 intValue];

  v7 = [v4 objectForKeyedSubscript:@"Event"];
  int v8 = [v7 intValue];

  uint64_t v9 = MEMORY[0x1E4F1CC28];
  if (v8 == 1 || v8 == 6) {
    uint64_t v11 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v11 = 0;
  }
  if (v6 != 1) {
    uint64_t v11 = 0;
  }
  if ((v6 - 5) >= 2) {
    uint64_t v9 = v11;
  }
  if ((v6 & 0xFFFFFFFD) != 0) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CC38];
  }
  BOOL v13 = [(PLState *)self updateWithValue:v12];
  if (v13)
  {
    v14 = [v4 entryDate];
    [(PLState *)self setStateChangeTime:v14];
  }
  return v13;
}

@end