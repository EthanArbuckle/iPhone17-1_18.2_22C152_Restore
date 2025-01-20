@interface KSTextReplacementServerClass
@end

@implementation KSTextReplacementServerClass

Class __get_KSTextReplacementServerClass_block_invoke(uint64_t a1)
{
  KeyboardServicesLibrary_14603();
  Class result = objc_getClass("_KSTextReplacementServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_KSTextReplacementServerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getMCKeyboardSettingsChangedNotificationSymbolLoc_block_invoke(v3);
  }
  return result;
}

@end