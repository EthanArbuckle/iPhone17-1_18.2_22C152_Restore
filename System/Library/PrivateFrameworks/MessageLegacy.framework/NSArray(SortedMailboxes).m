@interface NSArray(SortedMailboxes)
- (uint64_t)mf_indexOfMailboxDictionaryWithName:()SortedMailboxes;
@end

@implementation NSArray(SortedMailboxes)

- (uint64_t)mf_indexOfMailboxDictionaryWithName:()SortedMailboxes
{
  CFIndex v5 = [a1 count];
  v8.location = 0;
  v8.length = v5;
  CFIndex v6 = CFArrayBSearchValues((CFArrayRef)a1, v8, a3, (CFComparatorFunction)_compareNameWithMailboxDictionary, a3);
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x8000000000000000) == 0 && v6 < v5)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v6), "objectForKey:", @"MailboxName"), "isEqual:", a3))return v6; {
    else
    }
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end