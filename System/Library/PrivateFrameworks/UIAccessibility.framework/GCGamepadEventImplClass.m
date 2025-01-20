@interface GCGamepadEventImplClass
@end

@implementation GCGamepadEventImplClass

Class __get_GCGamepadEventImplClass_block_invoke(uint64_t a1)
{
  GameControllerLibrary();
  Class result = objc_getClass("_GCGamepadEventImpl");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_GCGamepadEventImplClass_block_invoke_cold_1();
  }
  get_GCGamepadEventImplClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_GCGamepadEventImplClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_GCGamepadEventImplClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIAccessibilityGameController.m", 18, @"Unable to find class %s", "_GCGamepadEventImpl");

  __break(1u);
}

@end