@interface AFClockAlarmSnapshot
@end

@implementation AFClockAlarmSnapshot

uint64_t __57__AFClockAlarmSnapshot_SiriVOX__svx_notifiedFiringAlarms__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

@end