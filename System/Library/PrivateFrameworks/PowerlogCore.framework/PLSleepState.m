@interface PLSleepState
+ (void)load;
- (BOOL)updateWithEntry:(id)a3;
- (PLSleepState)init;
@end

@implementation PLSleepState

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSleepState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLSleepState)init
{
  objc_super v2 = [(PLState *)self initWithStateId:32 entryKey:@"PLSleepWakeAgent_EventForward_PowerState" currValue:MEMORY[0x1E4F1CC38]];
  v3 = v2;
  if (v2) {
    [(PLState *)v2 updateWithLastEntry];
  }
  return v3;
}

- (BOOL)updateWithEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"State"];
  unsigned int v6 = [v5 intValue];

  v7 = [v4 objectForKeyedSubscript:@"Event"];
  int v8 = [v7 intValue];

  if (v6 <= 6)
  {
    if (((1 << v6) & 0x65) != 0)
    {
      uint64_t v9 = MEMORY[0x1E4F1CC28];
      goto LABEL_12;
    }
    if (v6 == 1)
    {
      if (v8 == 1 || v8 == 6) {
        uint64_t v9 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v9 = 0;
      }
      goto LABEL_12;
    }
  }
  uint64_t v9 = 0;
LABEL_12:
  BOOL v11 = [(PLState *)self updateWithValue:v9];
  if (v11)
  {
    v12 = [v4 entryDate];
    [(PLState *)self setStateChangeTime:v12];
  }
  return v11;
}

@end