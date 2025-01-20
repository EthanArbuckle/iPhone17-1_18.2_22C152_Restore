@interface GetAddressBookLookupQueue
@end

@implementation GetAddressBookLookupQueue

void ____GetAddressBookLookupQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.address-book-lookup", v2);
  v1 = (void *)__GetAddressBookLookupQueue___queueSingleton;
  __GetAddressBookLookupQueue___queueSingleton = (uint64_t)v0;
}

@end