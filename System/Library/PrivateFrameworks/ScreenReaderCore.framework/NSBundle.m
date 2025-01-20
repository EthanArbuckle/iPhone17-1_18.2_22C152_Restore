@interface NSBundle
@end

@implementation NSBundle

uint64_t __62__NSBundle_SCRCBundleExtras__preferredLocalizationsForLocale___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)preferredLocalizationsForLocale__preferredLocMap;
  preferredLocalizationsForLocale__preferredLocMap = (uint64_t)v0;

  preferredLocalizationsForLocale__preferredLocQueue = (uint64_t)dispatch_queue_create("com.apple.accessibility.VoiceOver.preferredLocalizationsQueue", 0);
  return MEMORY[0x270F9A758]();
}

void __62__NSBundle_SCRCBundleExtras__preferredLocalizationsForLocale___block_invoke_19(uint64_t a1)
{
  uint64_t v2 = [(id)preferredLocalizationsForLocale__preferredLocMap objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v9 = [MEMORY[0x263EFF960] availableLocaleIdentifiers];
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", *(void *)(a1 + 32), 0);
    uint64_t v6 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v9 forPreferences:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && *(void *)(a1 + 32)) {
      objc_msgSend((id)preferredLocalizationsForLocale__preferredLocMap, "setObject:forKey:");
    }
  }
}

@end