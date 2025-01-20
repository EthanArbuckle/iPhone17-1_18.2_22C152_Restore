@interface UIBackdropViewQueue
@end

@implementation UIBackdropViewQueue

void ___UIBackdropViewQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("_UIBackdropView", 0);
  v1 = (void *)qword_1EB25E658;
  qword_1EB25E658 = (uint64_t)v0;
}

@end