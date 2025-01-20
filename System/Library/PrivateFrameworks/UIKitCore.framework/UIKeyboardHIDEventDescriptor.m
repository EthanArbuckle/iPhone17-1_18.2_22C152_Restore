@interface UIKeyboardHIDEventDescriptor
@end

@implementation UIKeyboardHIDEventDescriptor

id __62___UIKeyboardHIDEventDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 16);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = (id)[v2 appendUInt64:v4 withName:@"senderID"];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    uint64_t v7 = *(unsigned int *)(v6 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)[*(id *)(a1 + 32) appendUInt64:v7 withName:@"eventType"];
  id v9 = (id)[*(id *)(a1 + 32) appendUInt64:*(unsigned __int16 *)(*(void *)(a1 + 40) + 24) withName:@"usagePage"];
  return (id)[*(id *)(a1 + 32) appendUInt64:*(unsigned __int16 *)(*(void *)(a1 + 40) + 32) withName:@"usage"];
}

@end