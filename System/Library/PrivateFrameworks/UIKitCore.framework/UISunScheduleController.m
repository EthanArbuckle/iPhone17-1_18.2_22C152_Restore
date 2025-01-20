@interface UISunScheduleController
@end

@implementation UISunScheduleController

void __61___UISunScheduleController__setNextEventTimerToAbsoluteTime___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = formatAbsoluteTime(*(CFAbsoluteTime *)(a1 + 40));
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Timer fired for: %@", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStatusWithAbsoluteTime:*(double *)(a1 + 40)];
}

@end