@interface TUCopyOrderedPeopleForDestinationIDWithHintInAddressBook
@end

@implementation TUCopyOrderedPeopleForDestinationIDWithHintInAddressBook

__CFArray *__TUCopyOrderedPeopleForDestinationIDWithHintInAddressBook_block_invoke(uint64_t a1)
{
  result = _queue_TUCreateOrderedPeopleFromUIDs(*(const __CFArray **)(a1 + 40), *(const __CFArray **)(a1 + 48), *(CFTypeRef **)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(const void **)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end