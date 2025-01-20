@interface ScheduledActivityQueue
@end

@implementation ScheduledActivityQueue

void ___ScheduledActivityQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.passd.scheduledactivity", 0);
  v1 = (void *)qword_1EB402C88;
  qword_1EB402C88 = (uint64_t)v0;
}

@end