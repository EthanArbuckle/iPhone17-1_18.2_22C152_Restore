@interface SignpostSupportMachTimeTranslator
@end

@implementation SignpostSupportMachTimeTranslator

uint64_t __81__SignpostSupportMachTimeTranslator_Collection___globalNotificationDispatchQueue__block_invoke()
{
  _globalNotificationDispatchQueue_notificationQueue = (uint64_t)dispatch_queue_create("SignpostSupportMachTimeTranslation sleep/wake notification queue", 0);
  return MEMORY[0x270F9A758]();
}

uint64_t __68__SignpostSupportMachTimeTranslator_Collection___timeTranslationLog__block_invoke()
{
  _timeTranslationLog_timeTranslationLog = (uint64_t)os_log_create("com.apple.SignpostSupport", "TimeTranslation");
  return MEMORY[0x270F9A758]();
}

void __77__SignpostSupportMachTimeTranslator_Collection___addListeningTimeTranslator___block_invoke(uint64_t a1)
{
  v2 = (void *)gListeningTimeTranslators;
  if (!gListeningTimeTranslators)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    v4 = (void *)gListeningTimeTranslators;
    gListeningTimeTranslators = v3;

    v2 = (void *)gListeningTimeTranslators;
  }
  [v2 addObject:*(void *)(a1 + 32)];
  if ([(id)gListeningTimeTranslators count] == 1)
  {
    IONotificationPortRef thePortRef = 0;
    gRootDomainConnect = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)_SignpostSupportMachTimeTranslatorPowerChanged, &gNotifier);
    v5 = thePortRef;
    v6 = [*(id *)(a1 + 40) _globalNotificationDispatchQueue];
    IONotificationPortSetDispatchQueue(v5, v6);

    gNotificationPort = (uint64_t)thePortRef;
  }
}

void __80__SignpostSupportMachTimeTranslator_Collection___removeListeningTimeTranslator___block_invoke(uint64_t a1)
{
  if (gListeningTimeTranslators)
  {
    if ([(id)gListeningTimeTranslators count])
    {
      [(id)gListeningTimeTranslators removeObject:*(void *)(a1 + 32)];
      if (![(id)gListeningTimeTranslators count])
      {
        IODeregisterForSystemPower(&gNotifier);
        IONotificationPortDestroy((IONotificationPortRef)gNotificationPort);
        v2 = (void *)gListeningTimeTranslators;
        gListeningTimeTranslators = 0;
      }
    }
  }
}

@end