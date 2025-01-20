@interface NSMutableSet(TCMessageEntryAdditions)
- (void)tc_addMessageEntry:()TCMessageEntryAdditions;
@end

@implementation NSMutableSet(TCMessageEntryAdditions)

- (void)tc_addMessageEntry:()TCMessageEntryAdditions
{
  id v6 = a3;
  v4 = objc_msgSend(a1, "member:");
  v5 = v4;
  if (v4)
  {
    [v4 mergeEntries:v6];
  }
  else
  {
    [a1 addObject:v6];
    objc_msgSend(v6, "setTimeStamp:", objc_msgSend(a1, "count"));
  }
}

@end