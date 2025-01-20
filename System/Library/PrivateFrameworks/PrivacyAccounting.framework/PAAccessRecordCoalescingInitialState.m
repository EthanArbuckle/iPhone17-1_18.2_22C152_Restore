@interface PAAccessRecordCoalescingInitialState
- (id)recordsToRepublish;
@end

@implementation PAAccessRecordCoalescingInitialState

- (id)recordsToRepublish
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end