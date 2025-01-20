@interface _PASCoalescingTimerGuardedData
@end

@implementation _PASCoalescingTimerGuardedData

- (void).cxx_destruct
{
  objc_storeStrong(&self->acc, 0);
  objc_storeStrong((id *)&self->nonCoalescingSources, 0);
  objc_storeStrong((id *)&self->nextCoalescedEventTime, 0);

  objc_storeStrong((id *)&self->coalescingSource, 0);
}

@end