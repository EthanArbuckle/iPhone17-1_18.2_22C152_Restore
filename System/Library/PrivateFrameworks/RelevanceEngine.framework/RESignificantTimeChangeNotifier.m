@interface RESignificantTimeChangeNotifier
@end

@implementation RESignificantTimeChangeNotifier

uint64_t __50___RESignificantTimeChangeNotifier_sharedInstance__block_invoke()
{
  sharedInstance_Notifier = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

void __40___RESignificantTimeChangeNotifier_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notify];
}

@end