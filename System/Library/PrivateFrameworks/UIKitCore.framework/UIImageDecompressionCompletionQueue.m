@interface UIImageDecompressionCompletionQueue
@end

@implementation UIImageDecompressionCompletionQueue

void ___UIImageDecompressionCompletionQueue_block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.UIKit.decompression-completed");
  v1 = (void *)qword_1EB25B1B0;
  qword_1EB25B1B0 = (uint64_t)v0;
}

@end