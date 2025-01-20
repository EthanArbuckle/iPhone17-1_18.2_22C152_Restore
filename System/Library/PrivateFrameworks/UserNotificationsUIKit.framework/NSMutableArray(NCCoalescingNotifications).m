@interface NSMutableArray(NCCoalescingNotifications)
- (void)_insertOrderedNotificationRequest:()NCCoalescingNotifications;
@end

@implementation NSMutableArray(NCCoalescingNotifications)

- (void)_insertOrderedNotificationRequest:()NCCoalescingNotifications
{
  id v4 = a3;
  objc_msgSend(a1, "insertObject:atIndex:", v4, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(a1, "count"), 1024, &__block_literal_global_29));
}

@end