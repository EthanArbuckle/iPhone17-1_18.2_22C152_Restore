@interface PLChargingState
+ (void)load;
- (BOOL)updateWithEntry:(id)a3;
- (PLChargingState)init;
@end

@implementation PLChargingState

- (BOOL)updateWithEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"IsCharging"];
  BOOL v6 = [(PLState *)self updateWithValue:v5];
  if (v6)
  {
    v7 = [v4 entryDate];
    [(PLState *)self setStateChangeTime:v7];
  }
  return v6;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLChargingState;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLChargingState)init
{
  objc_super v2 = [(PLState *)self initWithStateId:2 entryKey:@"PLBatteryAgent_EventBackward_Battery" currValue:MEMORY[0x1E4F1CC28]];
  v3 = v2;
  if (v2) {
    [(PLState *)v2 updateWithLastEntry];
  }
  return v3;
}

@end