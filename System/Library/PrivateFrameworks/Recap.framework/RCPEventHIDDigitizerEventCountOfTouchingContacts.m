@interface RCPEventHIDDigitizerEventCountOfTouchingContacts
@end

@implementation RCPEventHIDDigitizerEventCountOfTouchingContacts

uint64_t ___RCPEventHIDDigitizerEventCountOfTouchingContacts_block_invoke(uint64_t a1)
{
  uint64_t result = IOHIDEventGetIntegerValue();
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

@end