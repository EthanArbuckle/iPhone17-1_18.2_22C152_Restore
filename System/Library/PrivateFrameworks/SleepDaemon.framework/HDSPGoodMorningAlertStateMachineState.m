@interface HDSPGoodMorningAlertStateMachineState
- (void)updateState;
@end

@implementation HDSPGoodMorningAlertStateMachineState

- (void)updateState
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [(HKSPStateMachineState *)self stateMachine];
  v3 = [v2 infoProvider];
  if ([v3 goodMorningAlertEnabled])
  {
    uint64_t v4 = [v2 waitingState];
  }
  else
  {
    v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v8 = 138543362;
      *(void *)&v8[4] = objc_opt_class();
      id v6 = *(id *)&v8[4];
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] good morning alerts disabled", v8, 0xCu);
    }
    uint64_t v4 = [v2 disabledState];
  }
  v7 = (void *)v4;
  objc_msgSend(v2, "enterState:", v4, *(_OWORD *)v8);
}

@end