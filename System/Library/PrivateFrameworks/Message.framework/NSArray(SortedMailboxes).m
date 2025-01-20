@interface NSArray(SortedMailboxes)
- (uint64_t)mf_indexOfMailboxDictionaryWithName:()SortedMailboxes;
@end

@implementation NSArray(SortedMailboxes)

- (uint64_t)mf_indexOfMailboxDictionaryWithName:()SortedMailboxes
{
  id v4 = a3;
  CFIndex v5 = [a1 count];
  v13.location = 0;
  v13.length = v5;
  CFIndex v6 = CFArrayBSearchValues((CFArrayRef)a1, v13, v4, (CFComparatorFunction)_compareNameWithMailboxDictionary, v4);
  CFIndex v7 = v6;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x8000000000000000) == 0 && v6 < v5)
  {
    v9 = [a1 objectAtIndex:v6];
    v10 = [v9 objectForKey:@"MailboxName"];
    int v11 = [v10 isEqual:v4];

    if (v11) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v8;
}

@end