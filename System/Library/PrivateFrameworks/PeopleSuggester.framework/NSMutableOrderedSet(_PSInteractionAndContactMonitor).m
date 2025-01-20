@interface NSMutableOrderedSet(_PSInteractionAndContactMonitor)
- (void)_ps_appendObject:()_PSInteractionAndContactMonitor truncatingToCount:;
@end

@implementation NSMutableOrderedSet(_PSInteractionAndContactMonitor)

- (void)_ps_appendObject:()_PSInteractionAndContactMonitor truncatingToCount:
{
  id v8 = a3;
  objc_msgSend(a1, "removeObject:");
  unint64_t v6 = [a1 count] + 1;
  uint64_t v7 = v6 - a4;
  if (v6 >= a4) {
    objc_msgSend(a1, "removeObjectsInRange:", 0, v7);
  }
  objc_msgSend(a1, "addObject:", v8, v7);
}

@end