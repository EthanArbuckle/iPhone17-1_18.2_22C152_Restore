@interface SBClockIconInitialize
@end

@implementation SBClockIconInitialize

void ___SBClockIconInitialize_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)__tickClients;
  __tickClients = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  v3 = (void *)__calendar;
  __calendar = v2;

  v4 = (void *)__calendar;
  v5 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v4 setTimeZone:v5];

  uint64_t v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:v6 selector:sel__handleTimeChange_ name:*MEMORY[0x1E4FB2708] object:0];
}

@end