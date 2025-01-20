@interface UIHIDEventSenderDescriptor
@end

@implementation UIHIDEventSenderDescriptor

id __60___UIHIDEventSenderDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUInt64:*(void *)(*(void *)(a1 + 40) + 16) withName:@"senderID"];
  return (id)[*(id *)(a1 + 32) appendUInt64:*(unsigned int *)(*(void *)(a1 + 40) + 8) withName:@"eventType"];
}

@end